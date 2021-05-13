#include "input.h"
#include "output.h"
#include <stdio.h>
#include <stdlib.h>

#define HEIGHT 512
#define WIDTH 512

void sobel_filter(unsigned char in[HEIGHT][WIDTH],
                  unsigned char out[HEIGHT][WIDTH]) {
#pragma LEGUP function top

    // The 3x3 Sobel filters.
    const static int gx[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
    const static int gy[3][3] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

    int x = 0;
    int y = 1;
#pragma LEGUP loop pipeline
    for (int i = 0; i < (HEIGHT - 2) * (WIDTH - 2); i++) {
        // increment row when column reaches end of row
        y = (x == WIDTH - 2) ? y + 1 : y;
        // increment column until end of row
        x = (x == WIDTH - 2) ? 1 : x + 1;

        // Apply the sobel filter at the current "receptive field".
        int gx_sum = 0, gy_sum = 0;
        for (int m = -1; m <= 1; m++) {
            for (int n = -1; n <= 1; n++) {
                int pixel = in[y + m][x + n];
                gx_sum += pixel * gx[m + 1][n + 1];
                gy_sum += pixel * gy[m + 1][n + 1];
            }
        }

        gx_sum = (gx_sum < 0) ? -gx_sum : gx_sum;
        gy_sum = (gy_sum < 0) ? -gy_sum : gy_sum;

        int sum = gx_sum + gy_sum;
        sum = (sum > 255) ? 255 : sum;

        out[y][x] = (unsigned char)sum;
    }
}

int main() {
    unsigned char sobel_output[HEIGHT][WIDTH];

    sobel_filter(elaine_512_input, sobel_output);

    int mismatch_count = 0;

    for (int i = 1; i < HEIGHT - 1; i++) {
        for (int j = 1; j < WIDTH - 1; j++) {
            if (sobel_output[i][j] != elaine_512_golden_output[i][j])
                mismatch_count++;
        }
    }

    if (mismatch_count == 0)
        printf("PASS!\n");
    else
        printf("FAIL with %d differences\n", mismatch_count);

    return mismatch_count;
}

