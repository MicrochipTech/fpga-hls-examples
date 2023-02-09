#ifndef __DEFINE_H__
#define __DEFINE_H__

#include "hls/ap_int.hpp"
#include "hls/streaming.hpp"

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

void window_and_line_buffer(hls::ap_uint<10> input,
                            hls::ap_uint<10> window[3][3]);

// Gaussian Filter.
const unsigned int GF_KERNEL_SIZE = 5;
void gaussian_filter(bool on_switch,
                     hls::FIFO<unsigned char> &input_fifo,
                     hls::FIFO<unsigned char> &output_fifo);
void gf_sw(unsigned char input[][WIDTH], unsigned char output[][WIDTH]);

// Sobel Filter.
const unsigned int SF_KERNEL_SIZE = 3;
void sf_sw(unsigned char input[][WIDTH], hls::ap_uint<10> output[][WIDTH]);
void sobel_filter(bool on_switch,
                  hls::FIFO<unsigned char> &input_fifo,
                  hls::FIFO<unsigned short> &output_fifo);

// Non-maximum suppression.
const unsigned int NM_KERNEL_SIZE = 3;
void nonmaximum_suppression(bool on_switch,
                            hls::FIFO<unsigned short> &input_fifo,
                            hls::FIFO<unsigned char> &output_fifo);
void nm_sw(hls::ap_uint<10> input[][WIDTH], unsigned char output[][WIDTH]);

// Hysteresis filter.
const unsigned int HF_KERNEL_SIZE = 3;
void hf_sw(unsigned char input[][WIDTH], unsigned char output[][WIDTH]);
void hysteresis_filter(bool on_switch,
                       hls::FIFO<unsigned char> &input_fifo,
                       hls::FIFO<unsigned char> &output_fifo);

// Utility functions
bool is_filled(unsigned int kernel_size, unsigned int count);
bool is_out_of_bounds(unsigned int kernel_size, unsigned int i, unsigned int j);
void update_image_position(unsigned int &i, unsigned int &j);

#endif
