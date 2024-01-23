#include "define.hpp"

const int GX[SF_KERNEL_SIZE]
            [SF_KERNEL_SIZE] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
const int GY[SF_KERNEL_SIZE]
            [SF_KERNEL_SIZE] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

// Sobel Filter.
void sf_sw(unsigned char input[][WIDTH], hls::ap_uint<10> output[][WIDTH]) {

    int center = SF_KERNEL_SIZE / 2;

    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {

            if (is_out_of_bounds(SF_KERNEL_SIZE, i, j)) {
                output[i][j] = 0;
                continue;
            }

            int gx_sum = 0, gy_sum = 0;
            for (unsigned int m = 0; m < SF_KERNEL_SIZE; m++) {
                for (unsigned int n = 0; n < SF_KERNEL_SIZE; n++) {
                    gx_sum +=
                        ((int)input[i + m - center][j + n - center]) * GX[m][n];
                    gy_sum +=
                        ((int)input[i + m - center][j + n - center]) * GY[m][n];
                }
            }

            bool gx_sign = (gx_sum < 0) ? 1 : 0;
            bool gy_sign = (gy_sum < 0) ? 1 : 0;

            gx_sum = (gx_sum < 0) ? -gx_sum : gx_sum;
            gy_sum = (gy_sum < 0) ? -gy_sum : gy_sum;

            bool gy_over_gx = (gx_sum >= gy_sum) ? 0 : 1;

            int sum = gx_sum + gy_sum;
            sum = (sum > 255) ? 255 : sum;

            unsigned int direction = (gx_sign ^ gy_sign) << 1;
            direction |= (gx_sign ^ gy_sign ^ gy_over_gx);

            output[i][j] = ((direction & 0x3) << 8) | (unsigned char)sum;
        }
    }
}

