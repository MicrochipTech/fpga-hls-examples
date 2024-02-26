#include "hls/utils.hpp"
#include "hls/ap_int.hpp"
#include "bmp.h"

void invert(uint32_t *in, uint32_t *out) {
    #pragma HLS function top
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(in) type(axi_target) dma(true) num_elements(WIDTH*N_ROWS)
    #pragma HLS interface argument(out) type(axi_target) dma(true) num_elements(WIDTH*N_ROWS)

    #pragma HLS loop pipeline II(1)
    for (int j = 0; j < WIDTH*N_ROWS; j++) {
        out[j] = hls::hls_reg(~in[j]);
    }
}

void threshold_to_zero(uint32_t *in, uint32_t *out, uint8_t thresh) {
    #pragma HLS function top
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(in) type(axi_target) dma(true) num_elements(WIDTH*N_ROWS)
    #pragma HLS interface argument(out) type(axi_target) dma(true) num_elements(WIDTH*N_ROWS)

    #pragma HLS loop pipeline II(1)
    for (int j = 0; j < WIDTH*N_ROWS; j++) {
        hls::ap_uint<32> p = in[j];
        p(7,0) = p(7,0) > thresh ? p(7,0) : 0;
        p(15,8) = p(15,8) > thresh ? p(15,8) : 0;
        p(23,16) = p(23,16) > thresh ? p(23,16) : 0;
        p(31,24) = p(31,24) > thresh ? p(31,24) : 0;
        out[j] = hls::hls_reg(p.to_int64());
    }
}

#ifdef HAS_ACCELERATOR
std::string mode="hw";
#else
std::string mode="sw";
#endif

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("\nError, need two arguments: invert<0|1> threshold<0..255>\n");
        return -1;
    }

    int do_invert = atoi(argv[1]);
    int threshold = atoi(argv[2]);
    
    printf("\nHere we go!\n");
    printf("N_ROWS:%u, buf_size :%u, do_invert:%d, threshold:%d, mode:%s\n", 
        N_ROWS, N_CHANNELS*WIDTH*N_ROWS, do_invert, threshold, mode.c_str());
    bmp_header_t ImgHeader;
    bmp_pixel_t *BitMap = read_bmp(FILENAME, &ImgHeader);

    double t0 = timestamp();
    for(int i = 0; i < HEIGHT/N_ROWS; i++) {
        if (do_invert) {
            invert((uint32_t *)&BitMap[i*WIDTH*N_ROWS], (uint32_t *)&BitMap[i*WIDTH*N_ROWS]);
        }
        
        if (threshold > 0) {
            threshold_to_zero((uint32_t *)&BitMap[i*WIDTH*N_ROWS], (uint32_t *)&BitMap[i*WIDTH*N_ROWS], threshold);
        }
    }
    double t1 = timestamp();
    printf("Elapsed time: %f [s]\n", t1 - t0);

    write_bmp("output_" + mode + ".bmp", &ImgHeader, BitMap);
    hls_free(BitMap); // allocated inside read_bmp()
    return 0;
}

