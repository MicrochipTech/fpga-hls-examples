#include "define.hpp"

// A Simpler Gaussian Filter for hardware (the divisor is a power of 2)
const unsigned int GAUSSIAN[GF_KERNEL_SIZE]
                           [GF_KERNEL_SIZE] = {{1, 3, 4, 3, 1},
                                               {3, 8, 10, 8, 3},
                                               {4, 10, 12, 10, 4},
                                               {3, 8, 10, 8, 3},
                                               {1, 3, 4, 3, 1}};
const unsigned int DIVISOR = 128;

// Gaussian Filter.
void gf_sw(unsigned char input[][WIDTH], unsigned char output[][WIDTH]) {

    int center = GF_KERNEL_SIZE / 2;

    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {

            if (is_out_of_bounds(GF_KERNEL_SIZE, i, j)) {
                output[i][j] = input[i][j];
                continue;
            }

            unsigned int sum = 0;
            for (unsigned int m = 0; m < GF_KERNEL_SIZE; m++) {
                for (unsigned int n = 0; n < GF_KERNEL_SIZE; n++) {
                    sum +=
                        ((unsigned int)input[i + m - center][j + n - center]) *
                        GAUSSIAN[m][n];
                }
            }

            sum /= DIVISOR;

            // Safety Check
            // if (sum > 255) printf ("%d %d\n", i, j);

            output[i][j] = (unsigned char)sum;
        }
    }
}
