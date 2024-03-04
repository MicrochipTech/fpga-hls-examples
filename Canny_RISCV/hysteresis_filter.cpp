#include "define.hpp"
#include <hls/image_processing.hpp>

void hysteresis_filter(hls::FIFO<unsigned char> &input_fifo,
                       hls::FIFO<unsigned char> &output_fifo) {

    hls::LineBuffer<unsigned char, WIDTH, HF_KERNEL_SIZE> line_buffer;
    const unsigned center = HF_KERNEL_SIZE / 2;
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
        if (!is_filled(HF_KERNEL_SIZE, i)) {
            continue;
        }

        // calculate if the kernel is currently out of bounds, i.e. the kernel
        // overlaps with pixels outside of the current input frame
        bool out_of_bounds =
            is_out_of_bounds(HF_KERNEL_SIZE, y, x);

        // update x, y for next iteration
        update_image_position(y, x);

        if (out_of_bounds) {
            output_fifo.write(0);
            continue;
        }

        // check stencil for strong edges where the two most
        // significant bits are set to one (& 0xC0)
        int threshold = 0;
        for (unsigned int m = 0; m < HF_KERNEL_SIZE; m++) {
            for (unsigned int n = 0; n < HF_KERNEL_SIZE; n++) {
                threshold = (line_buffer.window[m][n] & 0xC0) ? 1 : threshold;
            }
        }

        // strengthen edge by a factor of 2
        unsigned int center = HF_KERNEL_SIZE / 2;
        int output = line_buffer.window[center][center] * 2;
        output = (output > 255) ? 255 : output;

        // only keep edge if it neighbours on a strong edge
        output = threshold ? output : 0;

        output_fifo.write(output);
    }
}
