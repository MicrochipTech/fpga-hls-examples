#include "hls/ap_int.hpp"
#include "hls/streaming.hpp"
#include "hls/image_processing.hpp"

#include "define.hpp"
#include "bmp.hpp"

const unsigned int KERNEL_SIZE = 5;

// A Simpler Gaussian Filter for hardware (the divisor is a power of 2)
const unsigned int GAUSSIAN[KERNEL_SIZE][KERNEL_SIZE] = {{1, 3, 4, 3, 1},
                                                         {3, 8, 10, 8, 3},
                                                         {4, 10, 12, 10, 4},
                                                         {3, 8, 10, 8, 3},
                                                         {1, 3, 4, 3, 1}};
const unsigned int DIVISOR = 128;


bool is_filled(unsigned int kernel_size, unsigned int count) {
    unsigned int center = kernel_size / 2;
    return count > (center * WIDTH + center - 1);
}

bool is_out_of_bounds(unsigned int kernel_size, unsigned int i, unsigned int j) {
    unsigned int center = kernel_size / 2;
    return (i < center) | (i > (HEIGHT - center - 1)) | (j < center) |
           (j > (WIDTH - center - 1));
}

void update_image_position(unsigned int &i, unsigned int &j) {
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

void gaussian_filter_pipelined(hls::ap_uint<1> on_switch,
                               hls::FIFO<unsigned char> &input_fifo,
                               hls::FIFO<unsigned char> &output_fifo) {
#pragma HLS function top

    hls::LineBuffer<unsigned char, WIDTH, KERNEL_SIZE> line_buffer;
    const unsigned center = KERNEL_SIZE / 2;
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
        if (!is_filled(KERNEL_SIZE, i)) {
            continue;
        }

        // calculate if the kernel is currently out of bounds, i.e. the kernel
        // overlaps with pixels outside of the current input frame
        bool out_of_bounds =
            is_out_of_bounds(KERNEL_SIZE, y, x);

        // update x, y for next iteration
        update_image_position(y, x);

        if (!on_switch || out_of_bounds) {
            output_fifo.write(line_buffer.window[center][center]);
            continue;
        }

        unsigned int sum = 0;
        for (unsigned int m = 0; m < KERNEL_SIZE; m++) {
            for (unsigned int n = 0; n < KERNEL_SIZE; n++) {
                sum +=
                    ((unsigned int)line_buffer.window[m][n] * GAUSSIAN[m][n]);
            }
        }

        sum /= DIVISOR;

        output_fifo.write((unsigned char)sum);
    }
}

int main() {
    unsigned int i, j;
    unsigned int matching = 0;

    hls::FIFO<unsigned char> input_fifo(/* depth = */ WIDTH * HEIGHT * 2);
    hls::FIFO<unsigned char> output_fifo(/* depth = */ WIDTH * HEIGHT * 2);
    hls::ap_uint<1> on = 1;

    bmp_header_t input_channel_header, golden_output_image_header;
    bmp_pixel_t *input_channel, *golden_output_image,
                *output_image, *output_image_ptr;

    // read inputs from file
    input_channel = read_bmp(INPUT_IMAGE, &input_channel_header);
    if (!input_channel) return 1;

    golden_output_image = read_bmp(GOLDEN_OUTPUT, &golden_output_image_header);
    if (!golden_output_image) return 1;

    output_image = (bmp_pixel_t*)malloc(SIZE * sizeof(bmp_pixel_t));
    output_image_ptr = output_image;

    // convert image to grayscale and write to input array

    // input
    for (i = 0; i < HEIGHT; i++) {
        for (j = 0; j < WIDTH; j++) {
            unsigned char r = input_channel->r;
            unsigned char g = input_channel->g;
            unsigned char b = input_channel->b;
            unsigned grayscale = (r + g + b) / 3;
            input_fifo.write(grayscale);
            input_channel++;
        }
    }

    // run design
    gaussian_filter_pipelined(on, input_fifo, output_fifo);

    // output validation
    for (i = 0; i < HEIGHT; i++) {
        for (j = 0; j < WIDTH; j++) {
            unsigned char gold = golden_output_image->r;
            unsigned char hw = output_fifo.read();
            output_image_ptr->r = hw;
            output_image_ptr->g = hw;
            output_image_ptr->b = hw;

            if (hw != gold) {
                printf("ERROR: ");
                printf("i = %d j = %d gold = %d hw = %d\n", i, j, gold, hw);
            } else {
                matching++;
            }

            output_image_ptr++;
            golden_output_image++;
        }
    }

    printf("Result: %d\n", matching);
    bool result_incorrect = 0;
    if (matching == SIZE) {
        printf("RESULT: PASS\n");
    } else {
        printf("RESULT: FAIL\n");
        result_incorrect = 1;
    }

    write_bmp("output.bmp", &input_channel_header, output_image);
    return result_incorrect;
}
