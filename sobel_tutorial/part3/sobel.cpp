#include "input.h"
#include "output.h"
#include <legup/image_processing.hpp>
#include <legup/streaming.hpp>
#include <stdio.h>

using namespace legup;

#define HEIGHT 512
#define WIDTH 512

void sobel_filter(FIFO<unsigned char> &input_fifo,
                  FIFO<unsigned char> &output_fifo) {
#pragma LEGUP function top
#pragma LEGUP function pipeline

    // The 3x3 Sobel filters.
    const static int GX[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
    const static int GY[3][3] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

    // i, j indicates the x/y coordinates in the image.
    static int i = 0, j = 0;

    // LegUp's line buffer library.
    static LineBuffer<unsigned char, WIDTH, 3> line_buffer;

    // Read input pixel from FIFO and put into the line buffer.
    unsigned char input_pixel = input_fifo.read();
    line_buffer.ShiftInPixel(input_pixel);

    // Wait for line buffers to fill before output.
    static int count = 0;
    if (count++ <= WIDTH)
        return;

    // Indicates whether the corresponding 3x3 receptive field is out of bound.
    bool outofbounds = (i < 1) | (i > HEIGHT - 2) | (j < 1) | (j > WIDTH - 2);

    // Apply the sobel filter at the current "receptive field".
    int gx_sum = 0, gy_sum = 0;
    for (int m = -1; m <= 1; m++) {
        for (int n = -1; n <= 1; n++) {
            // Get the pixel in "receptive field" from LineBuffer's window.
            int pixel = line_buffer.window[m + 1][n + 1];
            gx_sum += pixel * GX[m + 1][n + 1];
            gy_sum += pixel * GY[m + 1][n + 1];
        }
    }

    gx_sum = (gx_sum < 0) ? -gx_sum : gx_sum;
    gy_sum = (gy_sum < 0) ? -gy_sum : gy_sum;

    int sum = gx_sum + gy_sum;
    sum = (sum > 255) ? 255 : sum;

    // Set output to 0 if the corresponding 3x3 receptive field is out of bound.
    output_fifo.write(outofbounds ? 0 : sum);

    // Keep track of row/column of image.
    if (j < WIDTH - 1) {
        // Case 1: Moving to next pixel from left to right across image row.
        j++;
    } else if (i == HEIGHT - 1 && j == WIDTH - 1) {
        // Case 2: End of the image frame, reset to the first pixel coordinates
        // for the next image frame.
        i = 0;
        j = 0;
    } else {
        // Case 3: End of image row. Move to the first pixel of one row down in
        // the image frame.
        i++;
        j = 0;
    }
}

int main() {
    FIFO<unsigned char> input_fifo(/* depth: */ WIDTH * HEIGHT * 2);
    FIFO<unsigned char> output_fifo(/* depth: */ WIDTH * HEIGHT * 2);

    // Write input pixels and run the hardware model.
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            input_fifo.write(elaine_512_input[i][j]);
            sobel_filter(input_fifo, output_fifo);
        }
    }

    // Need to push in extra pixels to flush the pipeline.
    for (int i = 0; i < WIDTH + 2; i++) {
        input_fifo.write(0);
        sobel_filter(input_fifo, output_fifo);
    }

    // Verify output by comparing against a golden output.
    int mismatch_count = 0;
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            unsigned char hw = output_fifo.read();
            unsigned char golden = elaine_512_golden_output[i][j];
            if (hw != golden)
                mismatch_count++;
        }
    }

    if (mismatch_count == 0)
        printf("PASS!\n");
    else
        printf("FAIL with %d differences\n", mismatch_count);

    return mismatch_count;
}

