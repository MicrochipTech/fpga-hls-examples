// This file implements the top level ClassifierPipeline as well as the output
// layer of the CNN.

#include "digit_recognition.h"
#include "hls/thread.hpp"

// Input tensor to CNN and output classification FIFO.
Tensor<28, 1> classifier_input; // Can try making an argument to ClassifierPipeline()
// Output FIFO is size 10 to catch outputs from 10 runs in main testbench
FIFO<ap_uint<4>> classifier_output(10);

// Top level function which calls all layers in sequence.
void ClassifierPipeline() {
#pragma function top

	// Tensors outputs of each layer in the CNN.
	Tensor<26, 2> conv1_output;
	Tensor<13, 2> maxpool_output;
	Tensor<11, 4> conv2_output;
	Tensor<9, 4> conv3_output;
	Tensor<7, 2> conv4_output;
	DType fc_output[10];

    Conv</* INPUT_SIZE */ 28, /* INPUT_DEPTH */ 1, /* OUTPUT_SIZE */ 26,
         /* OUTPUT_DEPTH */ 2, /* FILTER_SIZE */ 3>(
        classifier_input, conv1_output, conv1_weights, conv1_bias);

    Maxpool</* DEPTH */ 2, /* INPUT_SIZE */ 26, /* OUTPUT_SIZE */ 13,
            /* FILTER_SIZE */ 2, /* STRIDE */ 2>(conv1_output, maxpool_output);

    Conv</* INPUT_SIZE */ 13, /* INPUT_DEPTH */ 2, /* OUTPUT_SIZE */ 11,
         /* OUTPUT_DEPTH */ 4, /* FILTER_SIZE */ 3>(
        maxpool_output, conv2_output, conv2_weights, conv2_bias);

    Conv</* INPUT_SIZE */ 11, /* INPUT_DEPTH */ 4, /* OUTPUT_SIZE */ 9,
         /* OUTPUT_DEPTH */ 4, /* FILTER_SIZE */ 3>(conv2_output, conv3_output,
                                                    conv3_weights, conv3_bias);

    Conv</* INPUT_SIZE */ 9, /* INPUT_DEPTH */ 4, /* OUTPUT_SIZE */ 7,
         /* OUTPUT_DEPTH */ 2, /* FILTER_SIZE */ 3>(conv3_output, conv4_output,
                                                    conv4_weights, conv4_bias);

    FC</* INPUT_DEPTH */ 2, /* INPUT_SIZE */ 7, /* OUTPUT_DEPTH */ 10>(
        conv4_output, fc_output);

    MaxComp(fc_output, classifier_output);
}

// MaxComp takes the output of the fully-connected layer and finds the digit
// with the maximum confidence and reports it.
void MaxComp(DType input[10], FIFO<ap_uint<4>> &output_digit) {

    DType max = 0x8000; // Smallest signed value in 16-bit.
    ap_uint<4> digit = 0;
    for (unsigned i = 0; i < 10; i++) {
        if (input[i] > max) {
            max = input[i];
            digit = i;
        }
    }

    printf("Highest confidence: %5d, digit-%lld\n", (uint16_t)max,
           digit.to_uint64());
    output_digit.write(digit);
}

