#include "define.hpp"
#include <hls/image_processing.hpp>

const int GX[SF_KERNEL_SIZE]
            [SF_KERNEL_SIZE] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
const int GY[SF_KERNEL_SIZE]
            [SF_KERNEL_SIZE] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

void sobel_filter(hls::FIFO<unsigned char> &input_fifo,
                  hls::FIFO<unsigned short> &output_fifo) {

    hls::LineBuffer<unsigned char, WIDTH, SF_KERNEL_SIZE> line_buffer;
    const unsigned center = SF_KERNEL_SIZE / 2;
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
        if (!is_filled(SF_KERNEL_SIZE, i)) {
            continue;
        }

        // calculate if the kernel is currently out of bounds, i.e. the kernel
        // overlaps with pixels outside of the current input frame
        bool out_of_bounds =
            is_out_of_bounds(SF_KERNEL_SIZE, y, x);

        // update x, y for next iteration
        update_image_position(y, x);

        if (out_of_bounds) {
            output_fifo.write(0);
            continue;
        }

        int gx_sum = 0, gy_sum = 0;
        for (unsigned int m = 0; m < SF_KERNEL_SIZE; m++) {
            for (unsigned int n = 0; n < SF_KERNEL_SIZE; n++) {
                gx_sum += ((int)line_buffer.window[m][n]) * GX[m][n];
                gy_sum += ((int)line_buffer.window[m][n]) * GY[m][n];
            }
        }

        bool gx_sign = gx_sum < 0, gy_sign = gy_sum < 0;
        gx_sum = gx_sign ? -gx_sum : gx_sum;
        gy_sum = gy_sign ? -gy_sum : gy_sum;

        bool gy_over_gx = (gx_sum >= gy_sum) ? 0 : 1;

        int sum = gx_sum + gy_sum;
        sum = (sum > 255) ? 255 : sum;

        unsigned int direction = (gx_sign ^ gy_sign) << 1;
        direction |= (gx_sign ^ gy_sign ^ gy_over_gx);

        hls::ap_uint<10> output = ((direction & 0x3) << 8) | (unsigned char)sum;

        output_fifo.write(output);
    }
}

