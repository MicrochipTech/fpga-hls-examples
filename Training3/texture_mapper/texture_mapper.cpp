/*
 * texture_mapper.cpp
 *
 *  Created on: Jan 6, 2021
 *      Author: M34934
 */

// Arbitrary Texture Mapping
// with reference to:
// https://www.flipcode.com/archives/The_Art_of_Demomaking-Issue_10_Roto-Zooming.shtml
//
// Rectangle Texture Mapping Test
//
// texture-space coordinates (screen):
//
// 0/0+
// +
//     A..B
//     .  .
//     .  .
//     C..D
//
#include "axi4_target.h"
#include "hls/bit_level_operations.h"
#include <hls/streaming.hpp>
#include <stdio.h>
#include <stdint.h>

using namespace hls;

// global variable for AXI4-Lite target
#pragma HLS interface variable(gv) type(axi_slave) concurrent_access(true)
TargetLayout gv;

volatile uint64_t texture_frame[texture_size * texture_size / 8];

#define image_width 640  // output frame width
#define image_height 480 // output frame height

// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

uint8_t get_texture_pixel(uint16_t x, uint16_t y) {
    uint32_t offset;
    uint64_t input_64b;
    uint8_t byte_select;

    // ensure x&y coordinates are valid (in range), simplified due to texture
    // size in multiples of 2
    // arbitrary size requires use of modulo operator (%), resulting on
    // initiation interval & pipeline length penalty
    // hardcoded for texture size 512
    x = x & 511;
    y = y & 511;

    //	printf("x/y=%d/%d,",x,y);

    //	offset = (texture_width/8)*y + (x>>3);
    // hardcoded for *512/8 = *64
    offset = (y << 6) + (x >> 3);

    input_64b = texture_frame[offset];
    byte_select = x % 8;

    // Note: first pixel at least significant byte of 64Bit LSRAM buffer entry
    switch (byte_select) {
    case 0:
        return (hls_bit_select(input_64b, 8 * 0 + 7, 8 * 0));
        break;
    case 1:
        return (hls_bit_select(input_64b, 8 * 1 + 7, 8 * 1));
        break;
    case 2:
        return (hls_bit_select(input_64b, 8 * 2 + 7, 8 * 2));
        break;
    case 3:
        return (hls_bit_select(input_64b, 8 * 3 + 7, 8 * 3));
        break;
    case 4:
        return (hls_bit_select(input_64b, 8 * 4 + 7, 8 * 4));
        break;
    case 5:
        return (hls_bit_select(input_64b, 8 * 5 + 7, 8 * 5));
        break;
    case 6:
        return (hls_bit_select(input_64b, 8 * 6 + 7, 8 * 6));
        break;
    case 7:
        return (hls_bit_select(input_64b, 8 * 7 + 7, 8 * 7));
        break;
    default:
        return (-1);
        break;
    }
}

// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

void texture_mapper(uint8_t run_loop, uint8_t &run_done,
                    FIFO<uint64_t> &output_fifo) {
#pragma HLS function top

    uint32_t ax, ay, bx, by; // texture start coordinates
    uint32_t cx, cy;
    int32_t dxdx, dydx; // deltas over x loop (calculated for every line)
    uint16_t p0, p1, p2, p3, p4, p5, p6, p7;
    uint16_t n;

    run_done = 0; // clear done output

    if (run_loop == 0x01) // processing phase for next line, done at start of DE
    {

        // get current start coordinates (changing every y scanline)
        ax = gv.AX;
        ay = gv.AY;
        bx = gv.BX;
        by = gv.BY;

        // compute deltas for interpolation along X
        dxdx = ((int32_t)bx - (int32_t)ax) / image_width;
        dydx = ((int32_t)by - (int32_t)ay) / image_width;

        //	  printf("dxdx,dydx=%d,%d",dxdx,dydx);

        // set starting position in texture space
        cx = ax;
        cy = ay;

#pragma HLS loop pipeline
        for (n = 0; n < image_width / 8; n++) {

            // calculate texture coordinates of 8 pixels
            p0 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p1 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p2 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p3 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p4 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p5 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p6 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;
            p7 = get_texture_pixel(hls_bit_select(cx, 31, 16),
                                   hls_bit_select(cy, 31, 16));
            cx += dxdx;
            cy += dydx;

            // concatenate 8 pixels and place result in output FIFO
            output_fifo.write(hls_bit_concat_8(p0, 8, p1, 8, p2, 8, p3, 8, p4,
                                               8, p5, 8, p6, 8, p7, 8));
        }

        // interpolate to get coordinates of next line in texture space
        ax += gv.DX1DY;
        ay += gv.DY1DY;

        bx += gv.DX2DY;
        by += gv.DY2DY;

        // store updated start points for next run
        gv.AX = ax;
        gv.AY = ay;
        gv.BX = bx;
        gv.BY = by;

        run_done = 0x01; // processing phase completed, one line processed
    }
}

// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
int main() {

    FIFO<uint64_t> output_fifo(/* depth: */ image_width);

    uint8_t done_status;
    texture_mapper(0, done_status, output_fifo);

#if 0
    int i, j, index;

    uint64_t output_pixel64;

    // texture-space coordinates (screen):
    //
    // 0/0+
    // +
    //     A..B
    //     .  .
    //     .  .
    //     C..D

    // define four corner points
    uint32_t ax = (320 - 319);
    uint32_t ay = (240 - 239) + 128;
    uint32_t bx = (320 + 319);
    uint32_t by = (240 - 239);
    uint32_t cx = (320 - 319) + 128;
    uint32_t cy = (240 + 239);
    uint32_t dx = (320 + 319);
    uint32_t dy = (240 + 239);

    // register number format is fixpoint, 1.0 = 65536
    gv.AX = 65536 * ax;
    gv.AY = 65536 * ay;
    gv.BX = 65536 * bx;
    gv.BY = 65536 * by;
    gv.DX1DY = 65536 * ((int32_t)cx - (int32_t)ax) / image_height;
    gv.DY1DY = 65536 * ((int32_t)cy - (int32_t)ay) / image_height;
    gv.DX2DY = 65536 * ((int32_t)dx - (int32_t)bx) / image_height;
    gv.DY2DY = 65536 * ((int32_t)dy - (int32_t)by) / image_height;

    printf("AX/65536=%d, AY/65536=%d\r\n", gv.AX >> 16, gv.AY >> 16);
    printf("BX/65536=%d, BY/65536=%d\r\n", gv.BX >> 16, gv.BY >> 16);
    printf("DX1DY=%d, DY1DY=%d\r\n", gv.DX1DY, gv.DY1DY);
    printf("DX2DY=%d, DY2DY=%d\r\n", gv.DX2DY, gv.DY2DY);

    // generate input texture
    index = 0;
    for (i = 0; i < texture_size; i++) {
        for (j = 0; j < texture_size / 8; j++) {
            // draw horizontal bar
            if ((i > (512 / 2 - 16)) && (i < 512 / 2 + 16)) {
                texture_frame[index] = 0xffffffffffffffff;
            } else
                texture_frame[index] = 0;

            index++;
        }
    }

#if 0
    // output texture buffer values
    for (i = 0; i < texture_size; i++) {
        printf("\r\nline %d:", i);
        framebuffer_process(2, &done_status, output_fifo);
        for (j = 0; j < texture_size / 8; j++) {
            output_pixel64 = output_fifo.read();
            printf("input_texture[%d] = 0x%.16llx ", j, output_pixel64);
        }
    }
#endif

    printf("Processing\r\n");

    // processing phase - full frame
    for (i = 0; i < image_height; i++) {
        printf("\r\nline %d:", i);
        texture_mapper(1, &done_status, output_fifo);
        for (j = 0; j < image_width / 8; j++) {
            output_pixel64 = output_fifo.read();
            printf("output_pixel[%d] = 0x%.16llx ", j, output_pixel64);
        }
    }

#endif
}

// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

