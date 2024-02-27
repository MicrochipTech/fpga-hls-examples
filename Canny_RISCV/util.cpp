#include "define.hpp"

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

