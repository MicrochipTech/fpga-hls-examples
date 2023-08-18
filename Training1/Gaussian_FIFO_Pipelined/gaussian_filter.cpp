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

void update_image_position(int &i, int &j) {
    if (j < WIDTH - 1) {
        // increment column
        j++;
    } else if (i == HEIGHT - 1 && j == WIDTH - 1) {
        // end of the image frame
        i = 0;
        j = 0;
    } else {
        // increment row
        i++;
        j = 0;
    }
}

void gaussian_filter_pipelined(hls::ap_uint<1> on_switch,
                               hls::FIFO<unsigned char> &input_fifo,
                               hls::FIFO<unsigned char> &output_fifo) {
#pragma HLS function top
#pragma HLS function pipeline

    if (input_fifo.empty())
        return;

    unsigned char input_pixel = input_fifo.read();

    static hls::LineBuffer<unsigned char, WIDTH, KERNEL_SIZE> line_buffer;

    line_buffer.ShiftInPixel(input_pixel);

    // keep track of how many pixels we have shifted into the line_buffer to
    // tell when it is filled
    static unsigned int count = 0;
    if (!is_filled(KERNEL_SIZE, count)) {
        count++;
        return;
    }

    // i, j to track the position we are at while processing each input frame
    static int i = 0, j = 0;

    // calculate if the kernel is currently out of bounds, i.e. the kernel
    // overlaps with pixels outside of the current input frame
    bool outofbounds = is_out_of_bounds(KERNEL_SIZE, i, j);

    // update i, j for next iteration
    update_image_position(i, j);

    if (!on_switch || outofbounds) {
        unsigned int center = KERNEL_SIZE / 2;
        unsigned char current_pixel = line_buffer.window[center][center];
        output_fifo.write(current_pixel);
        return;
    }

    unsigned int sum = 0;
    for (unsigned int m = 0; m < KERNEL_SIZE; m++) {
        for (unsigned int n = 0; n < KERNEL_SIZE; n++) {
            sum += ((unsigned int)line_buffer.window[m][n]) * GAUSSIAN[m][n];
        }
    }

    int output = sum / DIVISOR;

    output_fifo.write(output);
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

    // input
    for (i = 0; i < HEIGHT; i++) {
        for (j = 0; j < WIDTH; j++) {
            unsigned char r = input_channel->r;
            unsigned char g = input_channel->g;
            unsigned char b = input_channel->b;
            unsigned grayscale = (r + g + b) / 3;
            input_fifo.write(grayscale);
            // run design
            gaussian_filter_pipelined(on, input_fifo, output_fifo);
            input_channel++;
        }
    }

    // Give more inputs to flush out all pixels.
    for (i = 0; i < KERNEL_SIZE * WIDTH + KERNEL_SIZE; i++) {
        input_fifo.write(0);
        gaussian_filter_pipelined(on, input_fifo, output_fifo);
    }

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

