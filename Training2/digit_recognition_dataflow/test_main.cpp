#include "digit_recognition.h"
#include "test_images.h"

// Top-level function of the classifer pipeline.
void ClassifierPipeline(Tensor<28, 1> &classifier_input,
                        FIFO<ap_uint<4>> &classifier_output);

// Main testbench that writes test_images to input, runs the CNN, and prints the
// output.
int main() {
    Tensor<28, 1> classifier_input;
    FIFO<ap_uint<4>> classifier_output(10);
    // Run 10 iterations, each with a 28x28 input image of digit from 0 to 9.
    for (unsigned n = 0; n < 10; n++) {
        for (unsigned i = 0; i < 28; i++)
            for (unsigned j = 0; j < 28; j++)
                classifier_input[i][j][0] = test_images[n][i][j][0];
        ClassifierPipeline(classifier_input, classifier_output);
    }
    // Read predictions for digits 0-9 and print them to console.
    // Count number of incorrect predictions
    unsigned err_cnt = 0;
    for (unsigned n = 0; n < 10; n++) {
        ap_uint<4> digit = classifier_output.read();
        printf("Received prediction: %lld\n", digit.to_uint64());
        err_cnt += (digit != n);
    }
    printf("%s\n", err_cnt ? "FAIL" : "PASS");
    return err_cnt;
};

