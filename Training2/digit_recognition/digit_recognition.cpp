// This file implements the top level ClassifierPipeline as well as the output
// layer of the CNN.

#include "digit_recognition.h"
#include "hls/thread.hpp"

// All variables are marked as contention_free as there will only be up two 2
// accesses on each of them per cycle.

// Tensors outputs of each layer in the CNN.
#pragma HLS memory impl variable(conv1_output) contention_free(true)
Tensor<26, 2> conv1_output;
#pragma HLS memory impl variable(maxpool_output) contention_free(true)
Tensor<13, 2> maxpool_output;
#pragma HLS memory impl variable(conv2_output) contention_free(true)
Tensor<11, 4> conv2_output;
#pragma HLS memory impl variable(conv3_output) contention_free(true)
Tensor<9, 4> conv3_output;
#pragma HLS memory impl variable(conv4_output) contention_free(true)
Tensor<7, 2> conv4_output;
#pragma HLS memory impl variable(fc_output) contention_free(true)
DType fc_output[10];

// Input valid signal to CNN to make sure CNN is always accessing valid data.
#pragma HLS memory impl variable(classifier_input_valid) contention_free(true)
volatile bool classifier_input_valid = false;
// Input tensor to CNN and output classification FIFO.
#pragma HLS memory impl variable(classifier_input) contention_free(true)
Tensor<28, 1> classifier_input;
FIFO<ap_uint<4>> classifier_output;

// Valid signals between CNN layers to make sure downstream layers are always
// accessing valid data
#pragma HLS memory impl variable(conv1_output_valid) contention_free(true)
#pragma HLS memory impl variable(maxpool_output_valid) contention_free(true)
#pragma HLS memory impl variable(conv2_output_valid) contention_free(true)
#pragma HLS memory impl variable(conv3_output_valid) contention_free(true)
#pragma HLS memory impl variable(conv4_output_valid) contention_free(true)
#pragma HLS memory impl variable(fc_output_valid) contention_free(true)
volatile bool conv1_output_valid = false, maxpool_output_valid = false,
              conv2_output_valid = false, conv3_output_valid = false,
              conv4_output_valid = false, fc_output_valid = false;

// Top level function which calls all layers in sequence.
// Each layer runs in a thread, meaning all layers will run in parallel in both
// software and hardware.
void ClassifierPipeline() {
#pragma HLS function top

    hls::thread<void> t0(
        Conv</* INPUT_SIZE */ 28, /* INPUT_DEPTH */ 1, /* OUTPUT_SIZE */ 26,
             /* OUTPUT_DEPTH */ 2, /* FILTER_SIZE */ 3, /* NUM_MACC */ 2>,
        classifier_input, hls::ref(classifier_input_valid), conv1_output,
        hls::ref(conv1_output_valid), conv1_weights, conv1_bias);

    hls::thread<void> t1(
        Maxpool</* DEPTH */ 2, /* INPUT_SIZE */ 26, /* OUTPUT_SIZE */ 13,
                /* FILTER_SIZE */ 2, /* STRIDE */ 2>,
        conv1_output, hls::ref(conv1_output_valid), maxpool_output,
        hls::ref(maxpool_output_valid));

    hls::thread<void> t2(
        Conv</* INPUT_SIZE */ 13, /* INPUT_DEPTH */ 2, /* OUTPUT_SIZE */ 11,
             /* OUTPUT_DEPTH */ 4, /* FILTER_SIZE */ 3, /* NUM_MACC */ 8>,
        maxpool_output, hls::ref(maxpool_output_valid), conv2_output,
        hls::ref(conv2_output_valid), conv2_weights, conv2_bias);

    hls::thread<void> t3(
        Conv</* INPUT_SIZE */ 11, /* INPUT_DEPTH */ 4, /* OUTPUT_SIZE */ 9,
             /* OUTPUT_DEPTH */ 4, /* FILTER_SIZE */ 3, /* NUM_MACC */ 4>,
        conv2_output, hls::ref(conv2_output_valid), conv3_output,
        hls::ref(conv3_output_valid), conv3_weights, conv3_bias);

    hls::thread<void> t4(
        Conv</* INPUT_SIZE */ 9, /* INPUT_DEPTH */ 4, /* OUTPUT_SIZE */ 7,
             /* OUTPUT_DEPTH */ 2, /* FILTER_SIZE */ 3, /* NUM_MACC */ 4>,
        conv3_output, hls::ref(conv3_output_valid), conv4_output,
        hls::ref(conv4_output_valid), conv4_weights, conv4_bias);

    hls::thread<void> t5(
        FC</* INPUT_DEPTH */ 2, /* INPUT_SIZE */ 7, /* OUTPUT_DEPTH */ 10>,
        conv4_output, hls::ref(conv4_output_valid), fc_output,
        hls::ref(fc_output_valid));

    hls::thread<void> t6(MaxComp, fc_output, hls::ref(fc_output_valid),
                           hls::ref(classifier_output));

    // All threads are continuously running therefore we do not wait for the
    // termination of the threads and omit the join calls, e.g., t0.join()
}

// MaxComp runs continuously, taking the output of the fully-connected layer and
// finds the digit with the maximum confidence and reports it.
void MaxComp(DType input[10], volatile bool &input_valid,
             FIFO<ap_uint<4>> &output_digit) {
    while (1) {
        if (!input_valid)
            continue;

        DType max = 0x8000; // Smallest signed value in 16-bit.
        ap_uint<4> digit = 0;
        for (unsigned i = 0; i < 10; i++) {
            if (input[i] > max) {
                max = input[i];
                digit = i;
            }
        }
        input_valid = false;
        printf("Highest confidence: %5d, digit-%lld\n", (uint16_t)max,
               digit.to_uint64());
        output_digit.write(digit);
    }
}
