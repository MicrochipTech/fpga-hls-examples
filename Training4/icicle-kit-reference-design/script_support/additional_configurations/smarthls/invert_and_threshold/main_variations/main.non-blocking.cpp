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
    if (!BitMap) {
        fprintf(stderr,"Unable to read %s\n", FILENAME);
        return 1;
    } else {
        printf("Opened file %s\n", FILENAME);
    }

    bmp_pixel_t *OutBitMap1 = (bmp_pixel_t*)hls_malloc(HEIGHT * WIDTH * sizeof(bmp_pixel_t), HLS_ALLOC_NONCACHED);
    bmp_pixel_t *OutBitMap2 = (bmp_pixel_t*)hls_malloc(HEIGHT * WIDTH * sizeof(bmp_pixel_t), HLS_ALLOC_NONCACHED);

    double t0 = timestamp();
    for(int i = 0; i < HEIGHT/N_ROWS; i++) {
        if (do_invert) {
            #ifdef HAS_ACCELERATOR
            invert_write_input_and_start((uint32_t *)&BitMap[i*WIDTH*N_ROWS]);
            #else
            invert((uint32_t *)&BitMap[i*WIDTH*N_ROWS], (uint32_t *)&OutBitMap1[i*WIDTH*N_ROWS]);
            #endif
        }
        
        if (threshold > 0) {
            #ifdef HAS_ACCELERATOR
            threshold_to_zero_write_input_and_start((uint32_t *)&BitMap[i*WIDTH*N_ROWS], threshold);
            #else
            threshold_to_zero((uint32_t *)&BitMap[i*WIDTH*N_ROWS], (uint32_t *)&OutBitMap2[i*WIDTH*N_ROWS], threshold);
            #endif
        }

        #ifdef HAS_ACCELERATOR
        if (do_invert)
            invert_join_and_read_output((uint32_t *)&OutBitMap1[i*WIDTH*N_ROWS]);

        if (threshold > 0)
            threshold_to_zero_join_and_read_output((uint32_t *)&OutBitMap2[i*WIDTH*N_ROWS]);
        #endif
    }
    double t1 = timestamp();
    printf("function elapsed time: %f [s]\n", t1 - t0);

    write_bmp("output1_" + mode + ".bmp", &ImgHeader, OutBitMap1);
    write_bmp("output2_" + mode + ".bmp", &ImgHeader, OutBitMap2);
    hls_free(OutBitMap1);
    hls_free(OutBitMap2);
    hls_free(BitMap);
    return 0;
}

