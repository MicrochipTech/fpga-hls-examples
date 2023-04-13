#include "define.hpp"
#include <hls/image_processing.hpp>

void hysteresis_filter(bool on_switch,
                       hls::FIFO<unsigned char> &input_fifo,
                       hls::FIFO<unsigned char> &output_fifo) {
#pragma HLS function pipeline

    if (input_fifo.empty())
        return;

    unsigned char input_pixel = input_fifo.read();

    static hls::LineBuffer<unsigned char, WIDTH, HF_KERNEL_SIZE> line_buffer;

    line_buffer.ShiftInPixel(input_pixel);

    // keep track of how many pixels we have shifted into the line_buffer to
    // tell when it is filled
    static int count = 0;
    if (!is_filled(HF_KERNEL_SIZE, count)) {
        count++;
        return;
    }

    // i, j to track the position we are at while processing each input frame
    static unsigned int i = 0, j = 0;

    // calculate if the kernel is currently out of bounds, i.e. the kernel
    // overlaps with pixels outside of the current input frame
    bool outofbounds = is_out_of_bounds(HF_KERNEL_SIZE, i, j);

    // update i, j for next iteration
    update_image_position(i, j);

    unsigned int center = HF_KERNEL_SIZE / 2;
    unsigned char current_pixel = line_buffer.window[center][center];

    // if filter is off, pass pixel through
    if (!on_switch) {
        output_fifo.write(current_pixel);
        return;
    }

    if (outofbounds) {
        output_fifo.write(0);
        return;
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
    int output = line_buffer.window[center][center] * 2;
    output = (output > 255) ? 255 : output;

    // only keep edge if it neighbours on a strong edge
    output = threshold ? output : 0;

    output_fifo.write(output);
}

