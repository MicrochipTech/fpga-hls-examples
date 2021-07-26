#ifndef __DEFINE_H__
#define __DEFINE_H__

// uncomment this line to test on a smaller image for faster co-simulation
//#define FAST_COSIM

#ifdef FAST_COSIM
#define WIDTH 100
#define HEIGHT 56
#define INPUT_IMAGE "toronto_100x56.bmp"
#define GOLDEN_OUTPUT "golden_output_100x56.bmp"
#else
#define WIDTH 1920
#define HEIGHT 1080
#define INPUT_IMAGE "toronto.bmp"
#define GOLDEN_OUTPUT "golden_output.bmp"
#endif
#define SIZE (WIDTH*HEIGHT)

#endif
