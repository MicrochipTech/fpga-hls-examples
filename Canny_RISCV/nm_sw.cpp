#include "define.hpp"

// Non-maximum suppression.
void nm_sw(hls::ap_uint<10> input[][WIDTH], unsigned char output[][WIDTH]) {

    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {

            int point = input[i][j] & 0xff;

            if (is_out_of_bounds(NM_KERNEL_SIZE, i, j)) {
                output[i][j] = (unsigned char)point;
                continue;
            }

            int avg1, avg2;
            unsigned int direction = (input[i][j] & 0x300) >> 8;

            if (direction == 0) {
                avg1 = (((int)(input[i - 1][j - 1] & 0xff)) +
                        ((int)(input[i + 0][j - 1] & 0xff))) >>
                       1;
                avg2 = (((int)(input[i + 0][j + 1] & 0xff)) +
                        ((int)(input[i + 1][j + 1] & 0xff))) >>
                       1;

            } else if (direction == 1) {
                avg1 = (((int)(input[i - 1][j - 1] & 0xff)) +
                        ((int)(input[i - 1][j + 0] & 0xff))) >>
                       1;
                avg2 = (((int)(input[i + 1][j + 0] & 0xff)) +
                        ((int)(input[i + 1][j + 1] & 0xff))) >>
                       1;

            } else if (direction == 2) {
                avg1 = (((int)(input[i - 1][j + 0] & 0xff)) +
                        ((int)(input[i - 1][j + 1] & 0xff))) >>
                       1;
                avg2 = (((int)(input[i + 1][j - 1] & 0xff)) +
                        ((int)(input[i + 1][j + 0] & 0xff))) >>
                       1;

            } else {
                avg1 = (((int)(input[i - 1][j + 1] & 0xff)) +
                        ((int)(input[i + 0][j + 1] & 0xff))) >>
                       1;
                avg2 = (((int)(input[i + 0][j - 1] & 0xff)) +
                        ((int)(input[i + 1][j - 1] & 0xff))) >>
                       1;
            }

            // point must be greater than both averages otherwise set to 0
            // (suppress)
            point = (point >= avg1) ? point : 0;
            point = (point >= avg2) ? point : 0;

            output[i][j] = (unsigned char)point;
        }
    }
}
