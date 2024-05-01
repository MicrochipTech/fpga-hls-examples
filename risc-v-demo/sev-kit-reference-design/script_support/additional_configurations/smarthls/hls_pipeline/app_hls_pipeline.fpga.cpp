#pragma GCC diagnostic ignored "-Wpointer-arith"
#include "hls/hls_physmap.h"
#include "hls/hls_alloc.h"
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
#include <sys/time.h>
#include "../rotozoom/rotozoom.hpp"

#include "opencv2/opencv.hpp"

#define WATERMARK_IMG_FILENAME "microchip_riscv_1280x720.bmp"

#define WIDTH 1280
#define HEIGHT 720
#define N_PIXELS (WIDTH*HEIGHT)

unsigned int keep_going;

struct cfg_t {
    int         nPixels;
    uint8_t     do_sobel;
    uint8_t     do_invert;
    uint8_t     thresh;
    uint8_t     alpha;
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
int main(int argc, char** argv) {
    printf("hls_pipeline - FPGA (%s, %s)\n", __DATE__, __TIME__); fflush(stdout);

    void *hls_pipeline_virt_addr;
    void *watermark_virt_addr;
    void *rotozoom_virt_addr;
    void *get_frame_virt_addr;
    void *put_frame_virt_addr;
    
    printf("Running hls_pipeline_setup function\n"); fflush(stdout);
    if (!(hls_pipeline_virt_addr = hls_pipeline_setup())) {
        printf("Error: hls_pipeline_setup function failed\n"); fflush(stdout);
        exit(EXIT_FAILURE);
    }

    printf("Running watermark_setup function\n"); fflush(stdout);
    if (!(watermark_virt_addr = watermark_setup())) {
        printf("Error: watermark_setup function failed\n"); fflush(stdout);
        exit(EXIT_FAILURE);
    }

    printf("Running rotozoom_setup function\n"); fflush(stdout);
    if (!(rotozoom_virt_addr = rotozoom_setup())) {
        printf("Error: rotozoom_setup function failed\n"); fflush(stdout);
        exit(EXIT_FAILURE);
    }

    printf("Running get_frame_setup function\n"); fflush(stdout);
    if (!(get_frame_virt_addr = get_frame_setup())) {
        printf("Error: get_frame_setup function failed\n"); fflush(stdout);
        exit(EXIT_FAILURE);
    }

    printf("Running put_frame_setup function\n"); fflush(stdout);
    if (!(put_frame_virt_addr = put_frame_setup())) {
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
    printf("FPS file is opened!\n"); fflush(stdout);

    // Allocate memory for watermark image 
    uint32_t *buf1 = (uint32_t *)hls_malloc(WIDTH * HEIGHT * sizeof(uint32_t), HLS_ALLOC_NONCACHED);
    if (!buf1) {
        printf("Error allocating buf1\n"); fflush(stdout);
        exit(-1);
    }
    printf("buf1 allocated\n");

    cv::Mat watermark_img(HEIGHT, WIDTH, CV_8UC4, buf1);
    cv::cvtColor(imread(WATERMARK_IMG_FILENAME, cv::IMREAD_COLOR), watermark_img, cv::COLOR_RGB2BGRA);
    printf("Done reading %s\n", WATERMARK_IMG_FILENAME); fflush(stdout);

    struct cfg_t cfg;
    int frameCnt = 0;
    keep_going = 1;

    read_config(cfgFile, cfg);

    cfg.get_frame_enable    = 0; // frames don't go through cpu
    get_frame_write_nPixels(cfg.nPixels, get_frame_virt_addr);
    get_frame_write_enable(cfg.get_frame_enable, get_frame_virt_addr);
    
    hls_pipeline_write_nPixels(cfg.nPixels, hls_pipeline_virt_addr);

    cfg.alpha               = 256 * 0.25;
    watermark_write_nPixels(cfg.nPixels, watermark_virt_addr);
    watermark_write_buf_ptr_addr(watermark_img.data, watermark_virt_addr);
    watermark_write_alpha(cfg.alpha, watermark_virt_addr);

    cfg.put_frame_enable    = 0; // frames don't go through cpu
    put_frame_write_enable(cfg.put_frame_enable, put_frame_virt_addr);


    hls::sev::RotozoomData rd;
    const bool rotate = true;
    const bool scale = true;

    int firstPass = 1;
    printf("Going into main loop...\n"); fflush(stdout);
    double t1, t0 = timestamp();
    while(keep_going) { 

        // Read configuration parameters from the webpage
        read_config(cfgFile, cfg);

        hls_pipeline_write_do_sobel(cfg.do_sobel, hls_pipeline_virt_addr);
        hls_pipeline_write_do_invert(cfg.do_invert, hls_pipeline_virt_addr);
        hls_pipeline_write_thresh(cfg.thresh, hls_pipeline_virt_addr);
        watermark_write_enable(cfg.watermark_enable, watermark_virt_addr);

        // CPU computes the amount of rotation 
        hls::sev::rotate_points<512, 512, WIDTH, HEIGHT, rotate, scale>(rd);
        rotozoom_write_enable(cfg.rotozoom_enable, rotozoom_virt_addr);
        rotozoom_memcpy_write_rd((void *)&rd, sizeof(hls::sev::RotozoomData), rotozoom_virt_addr);

        // Start the HLS modules
        get_frame_start(get_frame_virt_addr);
        hls_pipeline_start(hls_pipeline_virt_addr);
        watermark_start(watermark_virt_addr);
        rotozoom_start(rotozoom_virt_addr);

        if (cfg.rotozoom_enable && firstPass) {
            printf("Skipping put_frame_start\n"); fflush(stdout);
        } else {
            put_frame_start(put_frame_virt_addr);
        }

        // Wait for the HLS modules to complete
        get_frame_join(get_frame_virt_addr);
        hls_pipeline_join(hls_pipeline_virt_addr);
        watermark_join(watermark_virt_addr);
        rotozoom_join(rotozoom_virt_addr);

        if (cfg.rotozoom_enable && firstPass) {
            printf("Skipping put_frame_join\n"); fflush(stdout);
            firstPass = 0;
        } else {
            put_frame_join(put_frame_virt_addr);
        }

        // Update the frame counter
        if(++frameCnt % 30 == 0) {
            t1 = timestamp();
            double fps = 30.0/(t1 - t0);
            fpsFile.seekp(0);
            fpsFile << fps;
            t0 = t1;
        }
    }
    printf("Out of main loop\n"); fflush(stdout);

    fpsFile.seekp(0);
    fpsFile << "0";
    fpsFile.close();

    hls_free(buf1);
    return 0;
}

