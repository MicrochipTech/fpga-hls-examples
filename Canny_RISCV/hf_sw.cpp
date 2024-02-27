#include "define.hpp"

// Hysteresis filter.
void hf_sw(unsigned char input[][WIDTH], unsigned char output[][WIDTH]) {

    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {

            if (is_out_of_bounds(HF_KERNEL_SIZE, i, j)) {
                output[i][j] = 0;
                continue;
            }

            // check stencil for strong edges where the two most
            // significant bits are set to one (& 0xC0)
            int threshold = 0;
            for (unsigned int m = 0; m < HF_KERNEL_SIZE; m++) {
                for (unsigned int n = 0; n < HF_KERNEL_SIZE; n++) {
                    threshold =
                        (input[i + m - 1][j + n - 1] & 0xC0) ? 1 : threshold;
                }
            }

            //  strengthen edge by a factor of 2
            int point = input[i][j] * 2;
            point = (point > 255) ? 255 : point;

            // only keep edge if it neighbours on a strong edge
            point = threshold ? point : 0;

            output[i][j] = (unsigned char)point;
        }
    }
}

