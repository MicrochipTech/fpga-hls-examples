
#include "define.hpp"
#include "bmp.hpp"
#include "hls/hls_alloc.h"

#include <assert.h>


#ifndef __SYNTHESIS__ 
// For software, the fifo depth has to be larger
#define FIFO_DEPTH SIZE
#else
#define FIFO_DEPTH 2
#endif

void write_fifo(unsigned char *buf, hls::FIFO<unsigned char> &out_fifo, int nWords) {
	#pragma HLS loop pipeline
    for(int i=0; i<nWords; i++) {
    	auto tmp = buf[i];
    	out_fifo.write(tmp);
    }
}

void read_fifo(hls::FIFO<unsigned char>  &in_fifo, unsigned char *buf, int nWords) {
	#pragma HLS loop pipeline
    for(int i=0; i<nWords; i++) {
    	auto wd = in_fifo.read();
    	buf[i] = wd;
    }
}


void canny(hls::FIFO<unsigned char> &input_fifo,
           hls::FIFO<unsigned char> &output_fifo) {

    #pragma HLS function dataflow
    hls::FIFO<unsigned char> output_fifo_gf(FIFO_DEPTH);
    hls::FIFO<unsigned short> output_fifo_sf(FIFO_DEPTH);
    hls::FIFO<unsigned char> output_fifo_nm(FIFO_DEPTH);

    gaussian_filter(input_fifo, output_fifo_gf);
    sobel_filter(output_fifo_gf, output_fifo_sf);
    nonmaximum_suppression(output_fifo_sf, output_fifo_nm);
    hysteresis_filter(output_fifo_nm, output_fifo);
}

void canny_wrapper(unsigned char *bufIn, unsigned char *bufOut) {
	#pragma HLS function top dataflow
	#pragma HLS interface default type(axi_target)
	#pragma HLS interface argument(bufIn) type(axi_initiator) num_elements(SIZE) max_burst_len(256)
    #pragma HLS interface argument(bufOut) type(axi_initiator) num_elements(SIZE) max_burst_len(256)

	hls::FIFO<unsigned char> fifo_1(FIFO_DEPTH);
	hls::FIFO<unsigned char> fifo_2(FIFO_DEPTH);
	write_fifo(bufIn, fifo_1, SIZE);
	canny(fifo_1, fifo_2);
	read_fifo(fifo_2, bufOut, SIZE);
}

int main() {
    bmp_header_t input_channel_header;
    bmp_pixel_t *input_channel, *output_channel, *tmp;

    input_channel = read_bmp(INPUT_IMAGE, &input_channel_header);
    if (!input_channel) return 1;

    output_channel = (bmp_pixel_t*)malloc(SIZE * sizeof(bmp_pixel_t));
    if (!output_channel) return 1;

    unsigned char *bufIn  = (unsigned char *)hls_malloc(SIZE);
    unsigned char *bufOut = (unsigned char *)hls_malloc(SIZE);

    for (int i = 0; i < SIZE; i++) {
        unsigned char r = input_channel->r;
        unsigned char g = input_channel->g;
        unsigned char b = input_channel->b;
        unsigned grayscale = (r + g + b) / 3;
        bufIn[i] = grayscale;
        input_channel++;
    }

    canny_wrapper(bufIn, bufOut);

    tmp = output_channel;
    for (int i = 0; i < SIZE; i++) {
        tmp->r = bufOut[i];
        tmp->g = bufOut[i];
        tmp->b = bufOut[i];
        tmp++;
    }

    write_bmp("output.bmp", &input_channel_header, output_channel);

    hls_free(bufIn);
    hls_free(bufOut);

    return 0;
}

