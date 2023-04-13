#include "define.hpp"
#include <hls/image_processing.hpp>

// A Simpler Gaussian Filter for hardware (the divisor is a power of 2)
const unsigned int GAUSSIAN[GF_KERNEL_SIZE]
                           [GF_KERNEL_SIZE] = {{1, 3, 4, 3, 1},
                                               {3, 8, 10, 8, 3},
                                               {4, 10, 12, 10, 4},
                                               {3, 8, 10, 8, 3},
                                               {1, 3, 4, 3, 1}};
const unsigned int DIVISOR = 128;

void gaussian_filter(bool on_switch,
                     hls::FIFO<unsigned char> &input_fifo,
                     hls::FIFO<unsigned char> &output_fifo) {
    #pragma HLS function pipeline

    if (input_fifo.empty())
        return;

    unsigned char input_pixel = input_fifo.read();

    static hls::LineBuffer<unsigned char, WIDTH, GF_KERNEL_SIZE> line_buffer;

    line_buffer.ShiftInPixel(input_pixel);

    // keep track of how many pixels we have shifted into the line_buffer to
    // tell when it is filled
    static int count = 0;
    if (!is_filled(GF_KERNEL_SIZE, count)) {
        count++;
        return;
    }

    // i, j to track the position we are at while processing each input frame
    static unsigned int i = 0, j = 0;

    // calculate if the kernel is currently out of bounds, i.e. the kernel
    // overlaps with pixels outside of the current input frame
    bool outofbounds = is_out_of_bounds(GF_KERNEL_SIZE, i, j);

    // update i, j for next iteration
    update_image_position(i, j);

    unsigned int center = GF_KERNEL_SIZE / 2;
    unsigned char current_pixel = line_buffer.window[center][center];

    // if filter is off, pass pixel through
    if (!on_switch) {
        output_fifo.write(current_pixel);
        return;
    }

    if (outofbounds) {
        output_fifo.write(current_pixel);
        return;
    }

    unsigned int sum = 0;
    for (unsigned int m = 0; m < GF_KERNEL_SIZE; m++) {
        for (unsigned int n = 0; n < GF_KERNEL_SIZE; n++) {
            sum += ((unsigned int)line_buffer.window[m][n]) * GAUSSIAN[m][n];
        }
    }

    int output = sum / DIVISOR;

    output_fifo.write(output);
}

