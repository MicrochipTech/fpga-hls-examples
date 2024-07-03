#include <stdio.h>
#include <stdint.h>
#include <hls/streaming.hpp>
#include "hls/ap_int.hpp"
#include "rotozoom.hpp"
#include "../common/bmp.hpp"
#include "../common/sev.hpp" // axis_wd_t

#define INPUT_IMG_FILENAME "toronto.bmp"
#define WIDTH 1920
#define HEIGHT 1080
#define N_PIXELS (WIDTH*HEIGHT)
#define TEST_FRAMES 1


using namespace hls::sev;

typedef hls::FIFO<axis_wd_t> fifo_t;

void rotozoom(fifo_t &in, fifo_t &out, RotozoomData &rd, uint8_t enable)
{
#pragma HLS function top
#pragma HLS interface default type(axi_target)
#pragma HLS interface argument(in) type(simple)
#pragma HLS interface argument(out) type(simple)
#pragma HLS memory partition argument(in) type(struct_fields)
#pragma HLS memory partition argument(out) type(struct_fields)
    hls::ap_uint<8> image_buffer[2 * 512][512];
    if (enable)
    {
        texture_mapper<512, 512, WIDTH, HEIGHT>(in, out, rd, image_buffer);
    }
    else
    {
#pragma HLS loop pipeline II(1)
        for (int i = 0; i < N_PIXELS; i++)
        {
            axis_wd_t input_fifo_d = in.read();
            out.write(input_fifo_d);
        }
    }
}

int main(){
    bmp_header_t input_img_hdr, golden_img_hdr;
    bmp_pixel_t *input_img, *input_img_ptr,
                *output_img, *output_img_ptr,
                *golden_img;
    bmp_pixel_t output_channel[N_PIXELS];
    fifo_t in_fifo(N_PIXELS), out_fifo(N_PIXELS);

    input_img = read_bmp(INPUT_IMG_FILENAME, &input_img_hdr);
    if (!input_img) {
        printf("Error opening file (%s)\n", INPUT_IMG_FILENAME);
        return 1;
    }
    output_img = (bmp_pixel_t*)hls_malloc(N_PIXELS * sizeof(bmp_pixel_t));
    printf("Done reading %s file\n", INPUT_IMG_FILENAME);
    for (int frames = 0; frames < TEST_FRAMES + 1; frames++) {

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
        sev::RotozoomData points;
        sev::rotate_points<512, 512, WIDTH, HEIGHT>(points);
        rotozoom(in_fifo, out_fifo, points, 1);
        int image_index = 0;
        // rotozoom doesn't output data after reading the first frame
        if (frames > 0) {
            output_img_ptr = output_img;

            char golden_name[50];
            char output_name[50];

            sprintf(golden_name, "output%d_golden.bmp", frames - 1);
            sprintf(output_name, "output%d.bmp", frames - 1);

            golden_img = read_bmp(golden_name, &golden_img_hdr);
            if (!golden_img) {
                printf("could not open golden image file");
                return 1;
            }
            for (int i = 0; i < N_PIXELS; i++) {
                    auto pixel = out_fifo.read().data;
                    output_img_ptr->r = pixel(7, 0);
                    output_img_ptr->g = pixel(15, 8);
                    output_img_ptr->b = pixel(23, 16);
                    output_img_ptr ++;
                    // just check the first 8 bits since the output is in 
                    // grayscale
                    if (golden_img[i].r != pixel(7, 0)) {
                        printf("FAIL");
                        return 1;
                    }
            }
            write_bmp(output_name, &input_img_hdr, output_img);
            
        }
    }
    hls_free(output_img);
    hls_free(input_img);
    hls_free(golden_img);
    printf("PASS\n");
    return 0;
}
