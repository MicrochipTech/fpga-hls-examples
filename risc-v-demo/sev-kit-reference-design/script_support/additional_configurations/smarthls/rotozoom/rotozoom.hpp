#include "hls/ap_int.hpp"
#include "hls/streaming.hpp"
#include <hls/data_buffer.hpp>
#include <hls/utils.hpp>
#include "../rotozoom/SinCosTables.hpp"
#include "../common/sev.hpp"

using namespace hls;
using hls::DoubleBuffer;
using hls::FIFO;
using hls::ref;
using hls::thread;

#ifndef __SHLS_SEV_ROTOZOOM_HPP__
#define __SHLS_SEV_ROTOZOOM_HPP__

namespace hls {
namespace sev {

// texture-space coordinates (screen):
//
// 0/0+
// +
//     A..B
//     .  .
//     .  .
//     C..D
struct RotozoomData {
    uint32_t AX;
    uint32_t AY;
    uint32_t BX;
    uint32_t BY;
    int32_t DX1DY;
    int32_t DY1DY;
    int32_t DX2DY;
    int32_t DY2DY;
};

template <int texture_size_x, int texture_size_y, int output_size_x,
          int output_size_y, bool rotate = 1, bool scale = 1>
void rotate_points(RotozoomData &rd) {

    static int g_scale =
        1024; // 1024 = 1.0 (bigger value => downscaled texture display)
    static uint8_t g_scale_flag = 0;
    // We add 180 to the rotation angle to gandle the flipped image issue
    static int g_angle = 180 + 0; // 0...359

    int display_size_x_div_2 = output_size_x / 2;
    int display_size_y_div_2 = output_size_y / 2;
    // x & y start vectors with aspect ratio correction
    int scaled_vect1 = (g_scale * display_size_x_div_2) >> 10;
    int scaled_vect2 = (g_scale * display_size_y_div_2) >> 10;

    // generate four rotated corner points
    // Note: texture image data is vertically flipped (bmp image conversion
    // issue), correct by defining A & C + B & D Points in different y order
    // (swap)

    int A_x_rot = (-scaled_vect1 * g_cos_table[g_angle] -
                   scaled_vect2 * g_sin_table[g_angle]) >>
                  15;
    int A_y_rot = (-scaled_vect1 * g_sin_table[g_angle] +
                   scaled_vect2 * g_cos_table[g_angle]) >>
                  15;

    int B_x_rot = (scaled_vect1 * g_cos_table[g_angle] -
                   scaled_vect2 * g_sin_table[g_angle]) >>
                  15;
    int B_y_rot = (scaled_vect1 * g_sin_table[g_angle] +
                   scaled_vect2 * g_cos_table[g_angle]) >>
                  15;

    int C_x_rot = (-scaled_vect1 * g_cos_table[g_angle] +
                   scaled_vect2 * g_sin_table[g_angle]) >>
                  15;
    int C_y_rot = (-scaled_vect1 * g_sin_table[g_angle] -
                   scaled_vect2 * g_cos_table[g_angle]) >>
                  15;

    int D_x_rot = (scaled_vect1 * g_cos_table[g_angle] +
                   scaled_vect2 * g_sin_table[g_angle]) >>
                  15;
    int D_y_rot = (scaled_vect1 * g_sin_table[g_angle] -
                   scaled_vect2 * g_cos_table[g_angle]) >>
                  15;
    uint32_t offset = (display_size_x_div_2 > display_size_y_div_2)
                          ? display_size_x_div_2
                          : display_size_y_div_2;

    // Replaced A <-> B and C <->D to fix the mirrored image issue
    uint32_t BX = (offset + A_x_rot);
    uint32_t BY = (offset + A_y_rot);

    uint32_t AX = (offset + B_x_rot);
    uint32_t AY = (offset + B_y_rot);

    uint32_t DX = (offset + C_x_rot);
    uint32_t DY = (offset + C_y_rot);

    uint32_t CX = (offset + D_x_rot);
    uint32_t CY = (offset + D_y_rot);

    // update rotation and scale
    if (rotate) {
        // rotate
        g_angle += 1;
        if (g_angle == 360)
            g_angle = 0;
    }
    if (scale) {
        // scale out/in
        if (g_scale_flag == 0) {
            g_scale += 16;
            if (g_scale > 1024 + 2048)
                g_scale_flag = 1;
        } else {
            g_scale -= 16;
            if (g_scale < 1024 - 512)
                g_scale_flag = 0;
        }
    }

    // return the calculated points
    rd.AX = AX << 16;
    rd.AY = AY << 16;
    rd.BX = BX << 16;
    rd.BY = BY << 16;
    rd.DX1DY = (((int32_t)CX - (int32_t)AX) << 16) / output_size_y;
    rd.DY1DY = (((int32_t)CY - (int32_t)AY) << 16) / output_size_y;
    rd.DX2DY = (((int32_t)DX - (int32_t)BX) << 16) / output_size_y;
    rd.DY2DY = (((int32_t)DY - (int32_t)BY) << 16) / output_size_y;
}

template <int texture_size_x, int texture_size_y, int output_size_x,
          int output_size_y>
void texture_mapper(hls::FIFO<axis_wd_t> &input_fifo,
                    hls::FIFO<axis_wd_t> &output_fifo, RotozoomData &gv,
                    ap_uint<8> image_buffer[2 * texture_size_y][texture_size_x]
                    ) {
    static bool first_iteration = 1;
    // static ap_uint<8> image_buffer[2 * texture_size_y][texture_size_x];
    static bool buffer_flag = 0;

    // calculate bound for cropping image
    const int left_bound = (output_size_x - texture_size_x) / 2;
    const int right_bound =
        ((output_size_x - texture_size_x) / 2) + texture_size_x;
    const int bot_bound = (output_size_y - texture_size_y) / 2;
    const int top_bound =
        ((output_size_y - texture_size_y) / 2) + texture_size_y;

    // texture coordinates for rotation and zooming
    uint32_t ax, ay, bx, by; // texture start coordinates
    ap_uint<32> cx, cy, read_index_x, read_index_y;
    int32_t dxdx, dydx; // deltas over x loop (calculated for every line)
    int32_t dx1dy, dy1dy, dx2dy,
        dy2dy; // deltas over x loop (calculated for every line)

    // the pixel we read from image buffer
    ap_uint<8> p;

    // uint16_t n;
    // read/write offset for reading to and writing from the buffer
    int read_offset, write_offset;

    ap_uint<24> in_pixel;
    ap_uint<8> gs_pixel;
    axis_wd_t output_data;

    if (buffer_flag) {
        write_offset = texture_size_y;
        read_offset = 0;
    } else {
        write_offset = 0;
        read_offset = texture_size_y;
    }
    ax = gv.AX;
    ay = gv.AY;
    bx = gv.BX;
    by = gv.BY;
    dx1dy = gv.DX1DY;
    dy1dy = gv.DY1DY;

    dx2dy = gv.DX2DY;
    dy2dy = gv.DY2DY;

    for (int i = 0; i < output_size_y; i++) {
        // compute deltas for interpolation along X
        dxdx = ((int32_t)bx - (int32_t)ax) / output_size_x;
        dydx = ((int32_t)by - (int32_t)ay) / output_size_x;

        // set starting position in texture space
        cx = ax;
        cy = ay;
#pragma HLS loop pipeline
#pragma HLS loop dependence variable(image_buffer) type(inter) direction(WAR) dependent(false)
        for (int j = 0; j < output_size_x; j++) {
            // reading incoming data
            in_pixel = input_fifo.read().data;
            if (j >= left_bound && j < right_bound && i >= bot_bound &&
                i < top_bound) {
                gs_pixel =
                    (in_pixel(7, 0) + in_pixel(15, 8) + in_pixel(23, 16)) / 3;
                image_buffer[write_offset + i - bot_bound][j - left_bound] =
                    gs_pixel;
            }

            // generating output pixels
            if (!first_iteration) {
                // since we're doing size 512, we just select the first 10 bits
                read_index_y = read_offset + cy(31, 16);
                read_index_x = cx(31, 16);
                p = image_buffer[read_index_y(8, 0)][read_index_x(8, 0)];
                cx += dxdx;
                cy += dydx;
                output_data.data = (p, p, p);
                // generate tlast and tuser data
                output_data.last = (j == output_size_x - 1) ? 1 : 0;
                output_data.user[1] =
                    ((j == output_size_x - 1) && (i == output_size_y - 1)) ? 1
                                                                           : 0;
                output_data.user[0] = ((j == 0) && (i == 0)) ? 1 : 0;
                output_fifo.write(output_data);
            }
        }
        // interpolate to get coordinates of next line in texture space
        ax += dx1dy;
        ay += dy1dy;

        bx += dx2dy;
        by += dy2dy;
    }
    first_iteration = 0;
}

} // End of namespace sev.
} // End of namespace hls.

#endif
