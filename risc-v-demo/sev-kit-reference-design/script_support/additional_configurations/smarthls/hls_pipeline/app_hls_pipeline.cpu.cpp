#pragma GCC diagnostic ignored "-Wpointer-arith"
#include "hls/hls_physmap.h"
#include "hls/hls_alloc.h"
#include <hls/image_processing.hpp>
// #include "hls/ap_int.hpp"
#include "hls_pipeline_accelerator_driver.h"
#include <cstdlib>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <fstream>
#include <iostream>
#include <csignal>
#include "../common/bmp.hpp"
#include <sys/time.h>
#include <pthread.h>
#include <thread>
#include "opencv2/opencv.hpp"

#define PIP_IMG_FILENAME "microchip_100x56.bmp"
// #define PIP_IMG_FILENAME "microchip_202x114.bmp"
#define WATERMARK_IMG_FILENAME "microchip_riscv_1280x720.bmp"

#define WIDTH 1280
#define HEIGHT 720
#define N_PIXELS (WIDTH*HEIGHT)

// Valid values: 1, 2,3 and 4 threads
#define N_THREADS 3

unsigned int keep_going;
uint32_t *buf1;
uint32_t *buf2;

struct cfg_t {
    int         nPixels;
    uint8_t     do_sobel;
    uint8_t     do_invert;
    uint8_t     thresh;
    float       alpha;
    uint8_t     watermark_enable;
    uint8_t     rotozoom_enable;
    uint8_t     get_frame_enable;
    uint8_t     put_frame_enable;
};



//------------------------------------------------------------------------------
void signalHandler( int signum ) {
    std::cout << "Interrupt signal (" << signum << ") received!\n";
    keep_going = 0;
}

//------------------------------------------------------------------------------
double timestamp() {
    struct timeval Tp;
    gettimeofday(&Tp, NULL);
    return (Tp.tv_sec + Tp.tv_usec * 1.0e-6);
}

//------------------------------------------------------------------------------
void printMatToFile(cv::Mat &m, std::string filename) {
    FILE *fp =fopen(filename.c_str(), "w+");
    if (!fp) {
        printf("ERROR. Could not open %s file\n", filename.c_str());
        fflush(stdout);
        return;
    }
    int nChan = m.channels();
    int width = m.cols;
    int height = m.rows;
    fprintf(fp, "height:%d, width:%d, nChan:%d\n", m.rows, m.cols, nChan);
    for(int i=0; i<height; i++){
        fprintf(fp, "line %d:\n", i);
        for(int j=0; j<width; j++){
            for(int c=0; c < nChan; c++){
                fprintf(fp, "0x%02x:", m.data[i*width*nChan + j*nChan + c]);
            }
            fprintf(fp, "\n");
        }
    }
    fclose(fp);
}

//------------------------------------------------------------------------------
void read_config(std::ifstream &cfgFile, struct cfg_t &cfg) {
    
    std::string line;
    cfgFile.seekg(0);
    
    std::getline(cfgFile,line); 
    cfg.nPixels = std::stoi(line);

    std::getline(cfgFile,line); 
    cfg.do_sobel = (line == "on");

    std::getline(cfgFile,line); 
    cfg.do_invert = (line == "on");

    std::getline(cfgFile,line); 
    cfg.thresh = std::stoi(line);

    std::getline(cfgFile,line); 
    cfg.watermark_enable = (line == "on");

    std::getline(cfgFile,line); 
    cfg.rotozoom_enable = (line == "on");
}

//------------------------------------------------------------------------------
void move_image_around(uint32_t *buf1, cv::Mat &img) {
    static int yoffset = 0;
    static int xoffset = 0;
    static int xdelta = 0;
    static int ydelta = 0;

    if(xoffset >= WIDTH-img.cols-1) xdelta = -1;
    if(xoffset < 1) xdelta = 1;
    if(yoffset >= (HEIGHT-img.rows-1)*WIDTH) ydelta = -WIDTH;
    if(yoffset < 1) ydelta = WIDTH;
    xoffset += xdelta;
    yoffset += ydelta; 

    uint32_t *p = (buf1 + yoffset + xoffset);
    for(int i=0; i<img.rows; i++) {
        for(int j=0; j<img.cols; j++) {
            p[j] = img.at<uint32_t>(i, j);
        }
        p += WIDTH;
    }
}

//------------------------------------------------------------------------------
void * analyze_frame(void *) {
    // double t0, t1;
    printf("Running analyze_frame!\n"); fflush(stdout);

    printf("Finished analyze_frame!\n"); fflush(stdout);
    return NULL;
}

//------------------------------------------------------------------------------
const unsigned int SOBEL_KERNEL_SIZE = 3;
const int GX[SOBEL_KERNEL_SIZE]
            [SOBEL_KERNEL_SIZE] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
const int GY[SOBEL_KERNEL_SIZE]
            [SOBEL_KERNEL_SIZE] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

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

void sobel_filter(unsigned char input_pixel, unsigned short &output_pixel) {
    static hls::LineBuffer<unsigned char, WIDTH, SOBEL_KERNEL_SIZE> line_buffer;
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

    // hls::ap_uint<10> output = ((direction & 0x3) << 8) | (unsigned char)sum;
    unsigned short output = ((direction & 0x3) << 8) | (unsigned char)sum;
    output_pixel = output;
}

void sw_sobel(uint32_t *buf, int nPixels) {
    bmp_pixel_t *p = (bmp_pixel_t *)buf;
    for(int i=0; i < nPixels; i++) {
        unsigned char pixIn = (p->r + p->g + p->b)/3;
        unsigned short pixOut;
        sobel_filter(pixIn, pixOut);
        p->r = pixOut;
        p->g = pixOut;
        p->b = pixOut;
        p++;
    }
}

//------------------------------------------------------------------------------
void th_invert(int thId) {
    uint32_t *p = &buf1[(HEIGHT/N_THREADS)*WIDTH*thId];
    for(int i=0; i < N_PIXELS/N_THREADS; i++) {
        p[i] = ~p[i];
    }
}

//------------------------------------------------------------------------------
int main(int argc, char** argv) {
    printf("hls_pipeline - CPU (%s, %s)\n", __DATE__, __TIME__); fflush(stdout);
    
    printf("Running get_frame_setup function\n"); fflush(stdout);
    if (!get_frame_setup()) {
        printf("Error: get_frame_setup function failed\n"); fflush(stdout);
        exit(EXIT_FAILURE);
    }

    printf("Running put_frame_setup function\n"); fflush(stdout);
    if (!put_frame_setup()) {
        printf("Error: put_frame_setup function failed\n"); fflush(stdout);
        exit(EXIT_FAILURE);
    }

    signal(SIGUSR1, signalHandler);
    printf("SIGUSR1 registered\n"); fflush(stdout);

    std::ifstream cfgFile("/srv/www/test/h264/hls.hls_pipeline.config");
    if (!cfgFile) {
        printf("ERROR. Could not open cfg file\n"); fflush(stdout);
        exit(-1);
    }
    printf("Config file is opened!\n"); fflush(stdout);

    std::ofstream fpsFile("/srv/www/test/h264/fps.txt");
    if (!fpsFile) {
        printf("ERROR. Could not open cfg file\n"); fflush(stdout);
        exit(-1);
    }
    fpsFile << "0";


    cv::Mat pip_img;
    cv::cvtColor(cv::imread(PIP_IMG_FILENAME, cv::IMREAD_COLOR), pip_img, cv::COLOR_BGR2BGRA);
    printf("Done reading %s\n", PIP_IMG_FILENAME); fflush(stdout);

    cv::Mat watermark_img;
    cv::cvtColor(imread(WATERMARK_IMG_FILENAME, cv::IMREAD_COLOR), watermark_img, cv::COLOR_BGR2BGRA);
    printf("Done reading %s\n", WATERMARK_IMG_FILENAME); fflush(stdout);

    buf1 = (uint32_t *)hls_malloc(WIDTH * HEIGHT * sizeof(uint32_t), HLS_ALLOC_NONCACHED);
    if (!buf1) {
        printf("Error allocating buf1\n"); fflush(stdout);
        exit(-1);
    }
    printf("buf1 allocated\n");

    buf2 = (uint32_t *)hls_malloc(WIDTH * HEIGHT * sizeof(uint32_t), HLS_ALLOC_NONCACHED);
    if (!buf2) {
        printf("Error allocating buf2\n"); fflush(stdout);
        exit(-1);
    }
    printf("buf2 allocated\n");

    cv::Mat frame(HEIGHT, WIDTH, CV_8UC4, buf1);

    struct cfg_t cfg;
    int frameCnt = 0;
    keep_going = 1;

    read_config(cfgFile, cfg);

    cfg.get_frame_enable    = 1; // frames to CPU
    cfg.put_frame_enable    = 1; // frames from CPU

    cfg.alpha               = 0.25;

    get_frame_write_buf_ptr_addr(buf1);
    get_frame_write_nPixels(cfg.nPixels);
    get_frame_write_enable(cfg.get_frame_enable);

    put_frame_write_buf_ptr_addr(buf1);
    put_frame_write_enable(cfg.put_frame_enable);

    std::thread th[N_THREADS];

    double t1, t0 = timestamp();
    printf("Going into main loop...\n"); fflush(stdout);
    while(keep_going) {

        read_config(cfgFile, cfg);

        get_frame_start();
        get_frame_join(); // wait for frame to be in DDR

        move_image_around(buf1, pip_img);
        
        if(cfg.do_sobel) {
            sw_sobel(buf1, cfg.nPixels);
        }

        if(cfg.do_invert) {
            for(int thId=0; thId < N_THREADS; ++thId)
                th[thId] = std::thread(th_invert, thId);

            for(int thId=0; thId < N_THREADS; ++thId)
                th[thId].join();
        }

        if(cfg.thresh > 0) {
            cv::threshold(frame, frame, cfg.thresh, 255, cv::THRESH_TOZERO);
        }

        if(cfg.watermark_enable) {
            cv::addWeighted(watermark_img, cfg.alpha, frame, 1.0-cfg.alpha, 0.0, frame);
        }

        put_frame_start();
        put_frame_join();

        if(++frameCnt % 30 == 0) {
            t1 = timestamp();
            double fps = 30.0/(t1 - t0);
            fpsFile.seekp(0); 
            fpsFile << fps;
            t0 = t1;
        }
    }
    printf("Out of main loop. frameCnt=%d\n", frameCnt); fflush(stdout);

    fpsFile.seekp(0);
    fpsFile << "0";
    fpsFile.close();

    hls_free(buf1);
    hls_free(buf2);
    return 0;
}

