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

void gaussian_filter(hls::FIFO<unsigned char> &input_fifo,
                     hls::FIFO<unsigned char> &output_fifo) {

    hls::LineBuffer<unsigned char, WIDTH, GF_KERNEL_SIZE> line_buffer;
    const unsigned center = GF_KERNEL_SIZE / 2;
    const unsigned LineBufferFillCount = center * WIDTH + center;
    // track the position we are at while processing each input frame
    unsigned int x = 0, y = 0;

#pragma HLS loop pipeline
    for (unsigned int i = 0; i < (HEIGHT * WIDTH + LineBufferFillCount); i++) {
        unsigned char input_pixel = 0;
        if (i < HEIGHT * WIDTH)
            input_pixel = input_fifo.read();
        line_buffer.ShiftInPixel(input_pixel);

        // keep track of how many pixels we have shifted into the line_buffer to
        // tell when it is filled
        if (!is_filled(GF_KERNEL_SIZE, i)) {
            continue;
        }

        // calculate if the kernel is currently out of bounds, i.e. the kernel
        // overlaps with pixels outside of the current input frame
        bool out_of_bounds =
            is_out_of_bounds(GF_KERNEL_SIZE, y, x);

        // update x, y for next iteration
        update_image_position(y, x);

        if (out_of_bounds) {
            output_fifo.write(line_buffer.window[center][center]);
            continue;
        }

        unsigned int sum = 0;
        for (unsigned int m = 0; m < GF_KERNEL_SIZE; m++) {
            for (unsigned int n = 0; n < GF_KERNEL_SIZE; n++) {
                sum +=
                    ((unsigned int)line_buffer.window[m][n] * GAUSSIAN[m][n]);
            }
        }

        sum /= DIVISOR;

        output_fifo.write((unsigned char)sum);
    }
}
