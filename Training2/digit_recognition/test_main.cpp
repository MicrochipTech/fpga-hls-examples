#include "digit_recognition.h"
#include "test_images.h"

// Main testbench that writes test_images to input, runs the CNN, and prints the
// output.
int main() {
    // Call ClassifierPipeline to start the layer threads.
    ClassifierPipeline();

    // Run 10 iterations, each with a 28x28 input image of digit from 0 to 9.
    for (unsigned n = 0; n < 10; n++) {
        // Wait for the CNN to finish reading input before writing new input.
        while (classifier_input_valid)
            ;
        for (unsigned i = 0; i < 28; i++)
            for (unsigned j = 0; j < 28; j++)
                classifier_input[i][j][0] = test_images[n][i][j][0];
        // Signal for the CNN that the input is ready for use.
        classifier_input_valid = true;
    }
    // Read predictions for digits 0-9 and print them to console.
    for (unsigned n = 0; n < 10; n++) {
        ap_uint<4> digit = classifier_output.read();
        printf("Received prediction: %lld\n", digit.to_uint64());
    }
    return 0;
};

