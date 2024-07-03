#include <stdio.h>
#include <stdint.h>
#include <hls/streaming.hpp>
#include "hls/ap_int.hpp"
#include <hls/image_processing.hpp> // line buffer
#include "hls/thread.hpp"
#include "hls/ap_int.hpp"
#include "../common/bmp.hpp"
#include "../common/sev.hpp" // axis_wd_t
#include "../rotozoom/rotozoom.hpp"

#define FIFO_DEPTH 16
#define BURST_LEN 64

// #define FAST_COSIM

#ifdef FAST_COSIM
#define WIDTH 100
#define HEIGHT 56
#define INPUT_IMG_FILENAME "toronto_100x56.bmp"
#define WATERMARK_IMG_FILENAME "microchip_riscv_100x56.bmp"
#else
#define WIDTH 1280
#define HEIGHT 720
#define INPUT_IMG_FILENAME "toronto_1280x720.bmp"
#define WATERMARK_IMG_FILENAME "microchip_riscv_1280x720.bmp"
#endif

#define N_PIXELS (WIDTH*HEIGHT)

const unsigned int SOBEL_KERNEL_SIZE = 3;
const int GX[SOBEL_KERNEL_SIZE]
            [SOBEL_KERNEL_SIZE] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
const int GY[SOBEL_KERNEL_SIZE]
            [SOBEL_KERNEL_SIZE] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};


typedef hls::FIFO<hls::sev::axis_wd_t> fifo_t;

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

//------------------------------------------------------------------------------
void sobel_filter(unsigned char input_pixel, unsigned short &output_pixel,
    hls::LineBuffer<unsigned char, WIDTH, SOBEL_KERNEL_SIZE> line_buffer
) {
    #pragma HLS function pipeline

    // static hls::LineBuffer<unsigned char, WIDTH, SOBEL_KERNEL_SIZE> line_buffer;
    line_buffer.ShiftInPixel(input_pixel);

    // keep track of how many pixels we have shifted into the line_buffer to
    // tell when it is filled
    static int count = 0;
    if (!is_filled(SOBEL_KERNEL_SIZE, count)) {
        count++;
        return;
    }

    // i, j to track the position we are at while processing each input frame
    static unsigned int i = 0, j = 0;

    // calculate if the kernel is currently out of bounds, i.e. the kernel
    // overlaps with pixels outside of the current input frame
    bool outofbounds = is_out_of_bounds(SOBEL_KERNEL_SIZE, i, j);

    // update i, j for next iteration
    update_image_position(i, j);

    if (outofbounds) {
        output_pixel = 0;
        return;
    }

    int gx_sum = 0, gy_sum = 0;
    for (unsigned int m = 0; m < SOBEL_KERNEL_SIZE; m++) {
        for (unsigned int n = 0; n < SOBEL_KERNEL_SIZE; n++) {
            gx_sum += ((int)line_buffer.window[m][n]) * GX[m][n];
            gy_sum += ((int)line_buffer.window[m][n]) * GY[m][n];
        }
    }

    bool gx_sign = gx_sum < 0, gy_sign = gy_sum < 0;
    gx_sum = gx_sign ? -gx_sum : gx_sum;
    gy_sum = gy_sign ? -gy_sum : gy_sum;

    bool gy_over_gx = (gx_sum >= gy_sum) ? 0 : 1;

    int sum = gx_sum + gy_sum;
    sum = (sum > 255) ? 255 : sum;

    unsigned int direction = (gx_sign ^ gy_sign) << 1;
    direction |= (gx_sign ^ gy_sign ^ gy_over_gx);

    hls::ap_uint<10> output = ((direction & 0x3) << 8) | (unsigned char)sum;
    output_pixel = output;
}

void sobel(fifo_t &in, fifo_t &out, int nPixels, uint8_t enable) {
    hls::LineBuffer<unsigned char, WIDTH, SOBEL_KERNEL_SIZE> line_buffer;

    #pragma HLS loop pipeline II(1)
    for(int p=0; p < nPixels; p++) {
        hls::sev::axis_wd_t wd = in.read();
        if (enable) {
            unsigned short pixOut;
            // to 8 bit gray scale
            unsigned char pixIn = (wd.data(23,16) + wd.data(15,8) + wd.data(7,0))/3;
            sobel_filter(pixIn, pixOut, line_buffer);
            wd.data(7,0)    = pixOut;
            wd.data(15,8)   = pixOut;
            wd.data(23,16)  = pixOut;
        }
        out.write(wd);
    }
}

//------------------------------------------------------------------------------
void invert(fifo_t &in, fifo_t &out, int nPixels, uint8_t do_invert) {
    #pragma HLS loop pipeline II(1)
    for (int i = 0; i < nPixels; i++) {
        auto p = in.read();
        p.data = do_invert ? ~p.data : p.data;
        out.write(p);
    }
}

//------------------------------------------------------------------------------
void threshold_to_zero(fifo_t &in, fifo_t &out, int nPixels, uint8_t thresh) {
    #pragma HLS loop pipeline II(1)
    for (int i = 0; i < nPixels; i++) {
        auto p = in.read();
        p.data(7,0) = p.data(7,0) > thresh ? p.data(7,0) : 0;
        p.data(15,8) = p.data(15,8) > thresh ? p.data(15,8) : 0;
        p.data(23,16) = p.data(23,16) > thresh ? p.data(23,16) : 0;
        out.write(p);
    }
}

//------------------------------------------------------------------------------
void get_frame(fifo_t &in_fifo, fifo_t &out_fifo, uint32_t *buf, int nPixels, uint8_t enable) {
    #pragma HLS function top
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(in_fifo) type(simple)
    #pragma HLS interface argument(out_fifo) type(simple)
    #pragma HLS interface argument(buf) type(axi_initiator) max_burst_len(BURST_LEN) num_elements(N_PIXELS)
    #pragma HLS memory partition argument(in_fifo) type(struct_fields)
    #pragma HLS memory partition argument(out_fifo) type(struct_fields)

    if (enable) {
        #pragma HLS loop pipeline
        for(int i=0; i<nPixels; i++) {
            hls::sev::axis_wd_t wd = in_fifo.read();
            buf[i] = (wd.last,wd.user,wd.data);
        };
    } else {
        #pragma HLS loop pipeline
        for(int i=0; i<nPixels; i++) {
            hls::sev::axis_wd_t wd = in_fifo.read();
            out_fifo.write(wd);
        };
    }
}

//------------------------------------------------------------------------------
void put_frame(fifo_t &in_fifo, fifo_t &out_fifo, uint32_t *buf, uint8_t enable) {
    #pragma HLS function top
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(in_fifo) type(simple)
    #pragma HLS interface argument(out_fifo) type(simple)
    #pragma HLS interface argument(buf) type(axi_initiator) max_burst_len(BURST_LEN) num_elements(N_PIXELS)
    #pragma HLS memory partition argument(in_fifo) type(struct_fields)
    #pragma HLS memory partition argument(out_fifo) type(struct_fields)

    hls::ap_uint<8> error = 0;
    if (enable) {
        for(int i=0; i<HEIGHT; i++) {
            #pragma HLS loop pipeline II(1)
            for(int j=0; j<WIDTH; j++) {
                hls::ap_int<32> tmp = buf[i * WIDTH + j];
                hls::sev::axis_wd_t wd;
                wd.data = tmp(23,0); // RGB
                wd.user[0] = ((i == 0) && (j == 0)); // SOF
                wd.user[1] = ((i == HEIGHT-1) && (j == WIDTH-1)); // EOF
                wd.last = (j == WIDTH-1); // EOL
                out_fifo.write(wd);
            }
        }
    } else {
        #pragma HLS loop pipeline II(1)
        for(int i=0; i<N_PIXELS; i++) {
            hls::sev::axis_wd_t wd = in_fifo.read();
            out_fifo.write(wd);
        }
    }
}



//------------------------------------------------------------------------------
void watermark(uint32_t *buf, fifo_t &in_fifo, fifo_t &out_fifo, int nPixels, uint16_t alpha, uint8_t enable) {
    #pragma HLS function top
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(in_fifo) type(simple)
    #pragma HLS memory partition argument(in_fifo) type(struct_fields)
    #pragma HLS interface argument(out_fifo) type(simple)
    #pragma HLS memory partition argument(out_fifo) type(struct_fields)
    #pragma HLS interface argument(buf) type(axi_initiator) max_burst_len(BURST_LEN) num_elements(N_PIXELS)

    hls::sev::axis_wd_t fromMem;

    if (enable) {
        #pragma HLS loop pipeline II(1)
        for(int i=0; i<nPixels; i++) {
            hls::ap_int<32> fromMem = buf[i];
            // CPU uses RGB
            hls::ap_uint<8> r_mem = fromMem(23,16);
            hls::ap_uint<8> g_mem = fromMem(15,8);
            hls::ap_uint<8> b_mem = fromMem(7,0);

            // Camera uses BGR
            hls::sev::axis_wd_t wd = in_fifo.read();
            hls::ap_uint<8> b = wd.data(23,16);
            hls::ap_uint<8> g = wd.data(15,8);
            hls::ap_uint<8> r = wd.data(7,0);

            r = ((256-alpha) * r + alpha * r_mem) >> 8;
            g = ((256-alpha) * g + alpha * g_mem) >> 8;
            b = ((256-alpha) * b + alpha * b_mem) >> 8;

            wd.data = (b,g,r);
            out_fifo.write(wd);
        };
    } else {
        #pragma HLS loop pipeline II(1)
        for(int i=0; i<nPixels; i++) {
            hls::sev::axis_wd_t wd = in_fifo.read();
            out_fifo.write(wd);
        }
    }
}

//------------------------------------------------------------------------------
void hls_pipeline(
    fifo_t      &in_fifo, 
    fifo_t      &out_fifo,
    int         nPixels,
    uint8_t     do_invert,
    uint8_t     thresh,
    uint8_t     do_sobel
) {
    #pragma HLS function top
    #pragma HLS interface default type(axi_target)
    #pragma HLS interface argument(in_fifo) type(simple)
    #pragma HLS memory partition argument(in_fifo) type(struct_fields)
    #pragma HLS interface argument(out_fifo) type(simple)
    #pragma HLS memory partition argument(out_fifo) type(struct_fields)

    fifo_t fifo_0(FIFO_DEPTH);
    fifo_t fifo_1(FIFO_DEPTH);

    hls::thread<void> t_sobel(sobel,
        std::ref(in_fifo),
        std::ref(fifo_0),
        nPixels,
        do_sobel);

    hls::thread<void> t_invert(invert,
        std::ref(fifo_0), 
        std::ref(fifo_1), 
        nPixels, 
        do_invert);

    hls::thread<void> t_threshold_to_zero(threshold_to_zero,
        std::ref(fifo_1),
        std::ref(out_fifo), 
        nPixels,
        thresh);

    t_sobel.join();
    t_invert.join();
    t_threshold_to_zero.join();
}


//------------------------------------------------------------------------------
void rotozoom(fifo_t &in_fifo, fifo_t &out_fifo, hls::sev::RotozoomData &rd, uint8_t enable) {
#pragma HLS function top
#pragma HLS interface default type(axi_target)
#pragma HLS interface argument(in_fifo) type(simple)
#pragma HLS interface argument(out_fifo) type(simple)
#pragma HLS memory partition argument(in_fifo) type(struct_fields)
#pragma HLS memory partition argument(out_fifo) type(struct_fields)
    hls::ap_uint<8> image_buffer[2 * 512][512];

    if (enable) {
        hls::sev::texture_mapper<512, 512, WIDTH, HEIGHT>(in_fifo, out_fifo, rd, image_buffer);
    }
    else {
        #pragma HLS loop pipeline II(1)
        for (int i = 0; i < WIDTH * HEIGHT; i++) {
            hls::sev::axis_wd_t input_fifo_d = in_fifo.read();
            out_fifo.write(input_fifo_d);
        }
    }
}

//------------------------------------------------------------------------------
int main() {
    fifo_t in_fifo(N_PIXELS);
    fifo_t out_fifo(N_PIXELS);
    fifo_t tmp_fifo_1(N_PIXELS);
    fifo_t tmp_fifo_2(N_PIXELS);
    fifo_t tmp_fifo_3(N_PIXELS);
    uint32_t frame_buf[N_PIXELS];

    bmp_header_t input_img_hdr, watermark_img_hdr;
    bmp_pixel_t *input_img, *input_img_ptr,
                *output_img, *output_img_ptr,
                *watermark_img;

    input_img = read_bmp(INPUT_IMG_FILENAME, &input_img_hdr);
    if (!input_img) {
        printf("Error opening file (%s)\n", INPUT_IMG_FILENAME);
        return 1;
    }
    printf("Done reading %s file\n", INPUT_IMG_FILENAME);

    watermark_img = read_bmp(WATERMARK_IMG_FILENAME, &watermark_img_hdr);
    if (!watermark_img) {
        printf("Error opening file (%s)\n", WATERMARK_IMG_FILENAME);
        return 1;
    }
    printf("Done reading %s file\n", WATERMARK_IMG_FILENAME);

    input_img_ptr = input_img;
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            hls::sev::axis_wd_t wd;
            wd.data(7,0)    = input_img_ptr->r;
            wd.data(15,8)   = input_img_ptr->g;
            wd.data(23,16)  = input_img_ptr->b;
            wd.user(0,0)    = (i==0 && j==0);
            wd.last         = (i==HEIGHT-1 && j==WIDTH-1);
            in_fifo.write(wd);
            input_img_ptr++;
        }
    }

    uint8_t do_invert           = 0;
    uint8_t do_sobel            = 0;
    uint8_t thresh              = 0;
    uint8_t watermark_enable    = 0;
    uint8_t get_enable          = 0;
    uint8_t put_enable          = get_enable;
    uint16_t alpha      = 256 * 0.25;   // 25% on the watermark
    // uint16_t alpha      = 256 * 0.75;   // 75% on the watermark
    // uint16_t alpha      = 256 * 0.0; // 100% original image
    // uint16_t alpha      = 255 * 1.0; // 100% watermark image

    if (get_enable) {
        get_frame(in_fifo, tmp_fifo_1, frame_buf, N_PIXELS, get_enable);
        put_frame(tmp_fifo_1, out_fifo, frame_buf, put_enable);
    } else {
        get_frame(in_fifo, tmp_fifo_1, frame_buf, N_PIXELS, get_enable);
        hls_pipeline(tmp_fifo_1, tmp_fifo_2, N_PIXELS, do_invert, thresh, do_sobel);
        watermark((uint32_t *)watermark_img, tmp_fifo_2, tmp_fifo_3, N_PIXELS, alpha, watermark_enable);
        put_frame(tmp_fifo_3, out_fifo, frame_buf, put_enable);
    }

    char errorFlag = 0;

    output_img = (bmp_pixel_t*)hls_malloc(N_PIXELS * sizeof(bmp_pixel_t));
    output_img_ptr = output_img;
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            hls::sev::axis_wd_t wd = out_fifo.read();
            // printf("d%8d: rc:%d, d:0x%6llx, u:0x%llx, l:%d\n", i*WIDTH+j, errorFlag, wd.data.to_uint64(), wd.user.to_uint64(),wd.last.to_uint64());

            output_img_ptr->r = wd.data(7,0);
            output_img_ptr->g = wd.data(15,8);
            output_img_ptr->b = wd.data(23,16);
            output_img_ptr++;

            if (i==0 && j==0)
                errorFlag |= (wd.user(0,0) != 1);

            if (i==HEIGHT-1 && j==WIDTH-1)
                errorFlag |= (wd.last != 1);
        }
    }
    // write_bmp("output.bmp", &input_img_hdr, input_img);
    write_bmp("output.bmp", &input_img_hdr, output_img);
    // write_bmp("output.bmp", &watermark_img_hdr, watermark_img);

    hls_free(output_img);
    hls_free(input_img);
    hls_free(watermark_img);

    if (errorFlag) {
        printf("ICICLE_TEST_FAIL\n");
	    return 1;
    } else {
        printf("ICICLE_TEST_PASS\n");
    	return 0;
    }
}

