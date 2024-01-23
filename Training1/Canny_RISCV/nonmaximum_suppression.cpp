#include "define.hpp"
#include <hls/image_processing.hpp>

void nonmaximum_suppression(hls::FIFO<unsigned short> &input_fifo,
                            hls::FIFO<unsigned char> &output_fifo) {

    hls::LineBuffer<hls::ap_uint<10>, WIDTH, NM_KERNEL_SIZE> line_buffer;
    const unsigned center = NM_KERNEL_SIZE / 2;
    const unsigned LineBufferFillCount = center * WIDTH + center;
    unsigned int x = 0, y = 0;

#pragma HLS loop pipeline
    for (unsigned int i = 0; i < (HEIGHT * WIDTH + LineBufferFillCount); i++) {
        hls::ap_uint<10> input_pixel = 0;
        if (i < HEIGHT * WIDTH)
            input_pixel = input_fifo.read();
        line_buffer.ShiftInPixel(input_pixel);

        // keep track of how many pixels we have shifted into the line_buffer to
        // tell when it is filled
        if (!is_filled(NM_KERNEL_SIZE, i)) {
            continue;
        }

        int current_pixel = (int)line_buffer.window[center][center] & 0xff;

        // calculate if the kernel is currently out of bounds, i.e. the kernel
        // overlaps with pixels outside of the current input frame
        bool out_of_bounds =
            is_out_of_bounds(NM_KERNEL_SIZE, y, x);

        // update x, y for next iteration
        update_image_position(y, x);

        if (out_of_bounds) {
            output_fifo.write(current_pixel);
            continue;
        }

        int avg1, avg2;
        unsigned int direction = (line_buffer.window[center][center] & 0x300) >> 8;

        if (direction == 0) {
            avg1 = (((int)(line_buffer.window[center - 1][center - 1] & 0xff)) +
                    ((int)(line_buffer.window[center + 0][center - 1] & 0xff))) >>
                   1;
            avg2 = (((int)(line_buffer.window[center + 0][center + 1] & 0xff)) +
                    ((int)(line_buffer.window[center + 1][center + 1] & 0xff))) >>
                   1;
        }
        if (direction == 1) {
            avg1 = (((int)(line_buffer.window[center - 1][center - 1] & 0xff)) +
                    ((int)(line_buffer.window[center - 1][center + 0] & 0xff))) >>
                   1;
            avg2 = (((int)(line_buffer.window[center + 1][center + 0] & 0xff)) +
                    ((int)(line_buffer.window[center + 1][center + 1] & 0xff))) >>
                   1;
        }
        if (direction == 2) {
            avg1 = (((int)(line_buffer.window[center - 1][center + 0] & 0xff)) +
                    ((int)(line_buffer.window[center - 1][center + 1] & 0xff))) >>
                   1;
            avg2 = (((int)(line_buffer.window[center + 1][center - 1] & 0xff)) +
                    ((int)(line_buffer.window[center + 1][center + 0] & 0xff))) >>
                   1;
        }
        if (direction == 3) {
            avg1 = (((int)(line_buffer.window[center - 1][center + 1] & 0xff)) +
                    ((int)(line_buffer.window[center + 0][center + 1] & 0xff))) >>
                   1;
            avg2 = (((int)(line_buffer.window[center + 0][center - 1] & 0xff)) +
                    ((int)(line_buffer.window[center + 1][center - 1] & 0xff))) >>
                   1;
        }

        // point must be greater than both averages otherwise set to 0
        // (suppress)
        int output = current_pixel;

        #pragma GCC diagnostic push
        #pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
        output = (output >= avg1) ? output : 0;
        output = (output >= avg2) ? output : 0;
        #pragma GCC diagnostic pop

        output_fifo.write(output);
    }
}
