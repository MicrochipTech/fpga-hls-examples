#include "input.h"
#include "output.h"
#include <hls/image_processing.hpp>
#include <hls/streaming.hpp>
#include <stdio.h>

using namespace hls;

#define HEIGHT 512
#define WIDTH 512

void sobel_filter(FIFO<unsigned char> &input_fifo,
                  FIFO<unsigned char> &output_fifo) {
#pragma HLS function top

    // The 3x3 Sobel filters.
    const static int gx[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
    const static int gy[3][3] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

    // SmartHLS's line buffer library.
    LineBuffer<unsigned char, WIDTH, 3> line_buffer;
    const unsigned LineBufferFillCount = WIDTH + 1;

    // Output pixel location
    int x = 0;
    int y = 0;
#pragma HLS loop pipeline
    for (unsigned i = 0; i < (HEIGHT * WIDTH + LineBufferFillCount); i++) {

        // Read input pixel from FIFO and put into the line buffer.
        unsigned char input_pixel = 0;
        if (i < HEIGHT * WIDTH)
            input_pixel = input_fifo.read();
        line_buffer.ShiftInPixel(input_pixel);

        // Wait for line buffers to fill before output.
        if (i < LineBufferFillCount) {
            continue;
        }

        // Indicates whether the corresponding 3x3 receptive field is out of
        // bounds.
        bool outofbounds =
            (x < 1) | (x > HEIGHT - 2) | (y < 1) | (y > WIDTH - 2);
        // increment row when column reaches end of row
        y = (x == WIDTH - 1) ? y + 1 : y;
        // increment column until end of row
        x = (x == WIDTH - 1) ? 0 : x + 1;

        // Apply the sobel filter at the current "receptive field".
        int gx_sum = 0, gy_sum = 0;
        for (int m = -1; m <= 1; m++) {
            for (int n = -1; n <= 1; n++) {
                // Get the pixel in "receptive field" from LineBuffer's window.
                int pixel = line_buffer.window[m + 1][n + 1];
                gx_sum += pixel * gx[m + 1][n + 1];
                gy_sum += pixel * gy[m + 1][n + 1];
            }
        }

        gx_sum = (gx_sum < 0) ? -gx_sum : gx_sum;
        gy_sum = (gy_sum < 0) ? -gy_sum : gy_sum;

        int sum = gx_sum + gy_sum;
        sum = (sum > 255) ? 255 : sum;

        // Set output to 0 if the corresponding 3x3 receptive field is
        // out of bounds.
        output_fifo.write(outofbounds ? 0 : sum);
    }
}

int main() {
    FIFO<unsigned char> input_fifo(/* depth: */ WIDTH * HEIGHT * 2);
    FIFO<unsigned char> output_fifo(/* depth: */ WIDTH * HEIGHT * 2);

    // Write input pixels and run the hardware model.
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            input_fifo.write(elaine_512_input[i][j]);
        }
    }

    sobel_filter(input_fifo, output_fifo);

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
