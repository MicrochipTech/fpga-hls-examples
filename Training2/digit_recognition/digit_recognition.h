#ifndef __DIGIT_RECOGNITION_H__
#define __DIGIT_RECOGNITION_H__

// This file implements each layer of the digit recognition CNN.
// The ClassifierPipeline top level function and each layer in this file
// implements a hardware optimized version of our desired CNN based on the
// following table:
// +-----------------+------------------------------------+-------------+------------+--------+-------+
// | Layers          | Input Size: Width x Height x Depth | Filter Size | #. Kernels | Stride | MACCs |
// +-----------------+------------------------------------+-------------+------------+--------+-------+
// | Convolution 1   |                        28 x 28 x 1 |           3 |          2 |      1 |     2 |
// | Maxpool         |                        26 x 26 x 2 |           2 |        n/a |      2 |     0 |
// | Convolution 2   |                        13 x 13 x 2 |           3 |          4 |      1 |     8 |
// | Convolution 3   |                        11 x 11 x 4 |           3 |          4 |      1 |     4 |
// | Convolution 4   |                          9 x 9 x 4 |           3 |          2 |      1 |     4 |
// | Fully Connected |                          7 x 7 x 2 |     98 x 10 |        n/a |      2 |     0 |
// +-----------------+------------------------------------+-------------+------------+--------+-------+
// Other requirements are:
//   1. RAM interfaces at the top level of the CNN and between layers.
//   2. Registered output interface for prediciton.
//   3. Each layer runs continuously in parallel.
//   4. Handshaking between layers to ensure valid data.
// This implementation meets requirements.

#include "defines.h"
#include "weights.h"
#include <hls/image_processing.hpp>
#include <hls/streaming.hpp>

using namespace hls;

//=========
// Interface of the ClassifierPipeline.
//
extern Tensor<28, 1> classifier_input;
extern volatile bool classifier_input_valid;
extern FIFO<ap_uint<4>> classifier_output;

//=========
// Top-level function of the classifer pipeline.
//
void ClassifierPipeline();

template <typename T> T ReLU(T v) { return (v > 0) ? v : T(0); }

//=========
// Classifer pipeline kernels.
//

// Conv implements a generic convolution layer.
// Note that NUM_MACC has to be a multiple of INPUT_DEPTH,
template <unsigned INPUT_SIZE, unsigned INPUT_DEPTH, unsigned OUTPUT_SIZE,
          unsigned OUTPUT_DEPTH, unsigned FILTER_SIZE, unsigned NUM_MACC>
void Conv(Tensor<INPUT_SIZE, INPUT_DEPTH> input, volatile bool &input_valid,
          Tensor<OUTPUT_SIZE, OUTPUT_DEPTH> output, volatile bool &output_valid,
          const short weights[OUTPUT_DEPTH][INPUT_DEPTH]
                             [FILTER_SIZE * FILTER_SIZE],
          const short bias[OUTPUT_DEPTH]) {

    // Based on the number of MACCs we want, calculate how many
    // loop iterations we want to run in parallel.
    const static unsigned PARALLEL_KERNELS = NUM_MACC / INPUT_DEPTH;

    while (1) {
        // Input valid handshaking
        bool should_run = input_valid;
        should_run &= !output_valid;
        if (!should_run)
            continue;

        // Loop over all dimensions of the input tensor.
        for (unsigned r = 0; r < OUTPUT_SIZE; r++) {
            for (unsigned c = 0; c < OUTPUT_SIZE; c++) {
                for (unsigned od = 0; od < OUTPUT_DEPTH;
                     od += PARALLEL_KERNELS) {
                    // For each depth dimension, store the convolution result in
                    // accumulated_value.
                    ap_int<36> accumulated_value[PARALLEL_KERNELS][INPUT_DEPTH];
                    for (unsigned i = 0; i < PARALLEL_KERNELS; i++)
                        for (unsigned j = 0; j < INPUT_DEPTH; j++)
                            accumulated_value[i][j] = 0;

// Pipelining improves performance and unrolls inner loops, causing
// PARALLEL_KERNELS * INPUT_DEPTH iterations to run in parallel.
// Parallel iterations use one MACC each, resulting in NUM_MACC =
// PARALLEL_KERNELS * INPUT_DEPTH MACCs to be used.
#pragma HLS loop pipeline
                    // Perform the convolution between input and weights in a
                    // window.
                    for (unsigned m = 0, n = 0, i = 0;
                         i < FILTER_SIZE * FILTER_SIZE; i++) {
                        for (unsigned k = 0; k < PARALLEL_KERNELS; k++) {
                            for (unsigned id = 0; id < INPUT_DEPTH; id++) {
                                accumulated_value[k][id] +=
                                    weights[od + k][id][i] *
                                    input[r + m][c + n][id];
                            }
                        }
                        n = (n == FILTER_SIZE - 1) ? 0 : n + 1;
                        m = (n > 0) ? m : m + 1;
                    }

                    // Add a bias and sum the outputs
                    for (unsigned k = 0; k < PARALLEL_KERNELS; k++) {
                        DType sum = bias[od + k];
                        for (unsigned id = 0; id < INPUT_DEPTH; id++)
                            sum += accumulated_value[k][id](29, 14);
                        output[r][c][od + k] = ReLU(sum);
                    }
                }
            }
        }
        // More handshaking
        input_valid = false;
        output_valid = true;
    }
}

// Maxpool implements a generic maxpool layer.
template <unsigned DEPTH, unsigned INPUT_SIZE, unsigned OUTPUT_SIZE,
          unsigned FILTER_SIZE, unsigned STRIDE>
void Maxpool(Tensor<INPUT_SIZE, DEPTH> input, volatile bool &input_valid,
             Tensor<OUTPUT_SIZE, DEPTH> output, volatile bool &output_valid) {
    while (1) {
        // Input valid handshaking
        bool should_run = input_valid;
        should_run &= !output_valid;
        if (!should_run)
            continue;

        // Loop over windows and apply maxpool function
        for (unsigned r = 0; r < OUTPUT_SIZE; r++) {
            for (unsigned c = 0; c < OUTPUT_SIZE; c++) {
                DType max[DEPTH];
                for (unsigned i = 0; i < DEPTH; i++)
                    max[i] = 0x8000; // Smallest signed value in 16-bit.

// Prevent automatic unrolling and apply pipelining for more performance.
#pragma unroll 1
#pragma HLS loop pipeline
                // Find the maximum value in each window.
                for (unsigned j = 0, m = 0, n = 0;
                     j < FILTER_SIZE * FILTER_SIZE; j++) {
                    for (unsigned d = 0; d < DEPTH; d++) {
                        DType val = input[r * STRIDE + m][c * STRIDE + n][d];
                        max[d] = (max[d] < val) ? val : max[d];
                    }
                    n = (n == FILTER_SIZE - 1) ? 0 : n + 1;
                    m = (n > 0) ? m : m + 1;
                }

                // Write it to output.
                for (unsigned d = 0; d < DEPTH; d++)
                    output[r][c][d] = max[d];
            }
        }
        // More handshaking
        input_valid = false;
        output_valid = true;
    }
}

// TC implements a generic fully-connected layer.
template <unsigned INPUT_DEPTH, unsigned INPUT_SIZE, unsigned OUTPUT_DEPTH>
void FC(Tensor<INPUT_SIZE, INPUT_DEPTH> input, volatile bool &input_valid,
        DType output[OUTPUT_DEPTH], volatile bool &output_valid) {

    while (1) {
        // Input valid handshaking
        bool should_run = input_valid;
        should_run &= !output_valid;
        if (!should_run)
            continue;

        // Loop over all inputs and perform multiply accumulate between inputs
        // and weights.
        for (unsigned od = 0; od < OUTPUT_DEPTH; od++) {
            ap_uint<32 + 7> accumulated_value = 0;
// Apply pipelining for more performance
#pragma HLS loop pipeline
            for (unsigned i = 0, r = 0, c = 0; i < INPUT_SIZE * INPUT_SIZE;
                 i++) {
                for (unsigned id = 0; id < INPUT_DEPTH; id++) {
                    accumulated_value +=
                        input[r][c][id] * fc_weights[id][od][i];
                }
                c = (c == INPUT_SIZE - 1) ? 0 : c + 1;
                r = (c > 0) ? r : r + 1;
            }
            output[od] = accumulated_value(29, 14) + fc_bias[od];
        }
        // More handshaking
        input_valid = false;
        output_valid = true;
    }
}

void MaxComp(DType input[10], volatile bool &input_valid,
             FIFO<ap_uint<4>> &output_digit);

#endif
