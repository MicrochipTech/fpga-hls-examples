#ifndef __PPM_H__
#define __PPM_H__

#include "hls/ap_int.hpp"
#include "define.hpp"

using namespace hls;

// bit width of a pixel
const int W = 8;

// 24-bit RGB
typedef ap_uint<3*W> rgb_t;

// 7:0 blue
const int B2 = 0;
const int B1 = B2 + W-1;

// 15:8 green
const int G2 = W;
const int G1 = G2 + W-1;

// 23:16 red
const int R2 = 2*W;
const int R1 = R2 + W-1;

struct input_t {
    rgb_t      channel1;
    rgb_t      channel2;
    ap_uint<8> alpha;
};


struct bmp_pixel_t {
    unsigned char b;
    unsigned char g;
    unsigned char r;
};

// Total: 54 bytes
struct bmp_header_t {
    uint16_t  type;             // Magic identifier: 0x4d42
    uint32_t  size;             // File size in bytes
    uint32_t  reserved;         // Not used
    uint32_t  offset;           // Offset to image data in bytes from beginning of file (54 bytes)
    uint32_t  dib_header_size;  // DIB Header size in bytes (40 bytes)
    int32_t   width;            // Width of the image
    int32_t   height;           // Height of image
    uint16_t  num_planes;       // Number of color planes
    uint16_t  bits_per_pixel;   // Bits per pixel
    uint32_t  compression;      // Compression type
    uint32_t  image_size;       // Image size in bytes
    int32_t   x_resolution_ppm; // Pixels per meter
    int32_t   y_resolution_ppm; // Pixels per meter
    uint32_t  num_colors;       // Number of colors
    uint32_t  important_colors; // Important colors
} __attribute__((__packed__));

bmp_pixel_t *read_bmp(const char *filename, bmp_header_t *header) {
    FILE *file = fopen(filename, "rb");
    if (!file) return NULL;

    // read BMP header and verify width/height
    if (fread(header, sizeof(bmp_header_t), 1, file) != 1) return NULL;
    if (header->offset != sizeof(bmp_header_t) ||
        header->width != WIDTH || header->height != HEIGHT) return NULL;

    // allocate image buffer
    bmp_pixel_t *image = (bmp_pixel_t*)malloc(SIZE * sizeof(bmp_pixel_t));

    // read BMP image
    if (fread(image, sizeof(bmp_pixel_t), SIZE, file) != SIZE) return NULL;

    fclose(file);
    return image;
}

void write_bmp(const char *filename, const bmp_header_t *header, const bmp_pixel_t *image) {
    FILE *file = fopen(filename, "wb");
    if (!file) return;
    fwrite(header, sizeof(bmp_header_t), 1, file);
    fwrite(image, sizeof(bmp_pixel_t), SIZE, file);
    fclose(file);
}

#endif
