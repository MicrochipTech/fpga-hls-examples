#pragma once

#include "hls/hls_physmap.h"
#include "hls/hls_alloc.h"

#define N_CHANNELS 3

struct bmp_pixel_t {
    unsigned char b;
    unsigned char g;
    unsigned char r;
    unsigned char alpha;
};

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


bmp_pixel_t *read_bmp(const char *filename, bmp_header_t *header, bool swap = 0) {
    FILE *file = fopen(filename, "rb");
    if (file == NULL) {
        perror("Error openning file:\n");
        fflush(stdout);
        return NULL;
    }

    if (fread(header, sizeof(bmp_header_t), 1, file) != 1) return NULL;
    printf("Header read!\n");

    if (header->offset != sizeof(bmp_header_t)) {
        printf("Incorrect header size!\n");
        return NULL;
    } 

    bmp_pixel_t *image = (bmp_pixel_t*)hls_malloc(
        header->height * header->width * sizeof(bmp_pixel_t), 
        HLS_ALLOC_NONCACHED);
    if (image == NULL) {
        printf("Error allocating memory!\n");
        return NULL;
    }

    // bmp_pixel_t is always 4 bytes, but the image file may be 4 or 3 bytes per pixel
    unsigned int num_channels = header->bits_per_pixel/8;
    
    // first pixel in the .bmp file is the bottom left of the image

    // Return pixels in image format (top-left) is the first pixel
    for(int i=header->height-1; i>=0; i--) {
        unsigned char *p = (unsigned char *)image + i * header->width * 4;
        for(int j=0; j<header->width; j++) {
            fread(p, num_channels, 1, file); 
            if(swap) {
                // Swap B and R pixels
                unsigned char c = p[0];
                p[0] = p[2];
                p[2] = c;
            }
            p += 4;
        }
    }

    // Return pixels in .bmp format
    // for(int i=0; i<header->height * header->width; i++) {
        // fread(p, N_CHANNELS, 1, file); p -= 4;
    // }

    if(1) {
        printf(
            "type               : 0x%x\n"
            "size               : %d\n"
            "reserved           : 0x%x\n"
            "offset             : 0x%x\n"
            "dib_header_size    : %d\n"
            "width              : %d\n"
            "height             : %d\n"
            "num_planes         : %d\n"
            "bits_per_pixel     : %d\n"
            "compression        : 0x%x\n"
            "image_size         : %d\n"
            "x_resolution_ppm   : %d\n"
            "y_resolution_ppm   : %d\n"
            "num_colors         : %d\n"
            "important_colors   : 0x%x\n",
            header->type,               
            header->size,               
            header->reserved,           
            header->offset,             
            header->dib_header_size,    
            header->width,              
            header->height,             
            header->num_planes,         
            header->bits_per_pixel,     
            header->compression,        
            header->image_size,         
            header->x_resolution_ppm,   
            header->y_resolution_ppm,   
            header->num_colors,         
            header->important_colors
        );

        printf("pix0: alpha:0x%x, R:0x%x, G:0x%x, B:0x%x, (uint32_t):0x%08x\n", 
            image[0].alpha, image[0].r, image[0].g, image[0].b, *((uint32_t *)image));
    }
    fclose(file);
    return image;
}

bmp_pixel_t *read_bmp_or_die(const char *filename, bmp_header_t *header, bool swap = 0) {
    bmp_pixel_t *buf = read_bmp(filename, header, swap);
    if (buf == NULL) {
        printf("Error opening file (%s)\n", filename);
        exit(-1);
    }
    return buf;
}

void write_bmp(const char *filename, const bmp_header_t *header, const bmp_pixel_t *image) {
    FILE *file = fopen(filename, "wb");
    if (file == NULL) {
        perror("Error opening the file\n");
        return;
    }
    fwrite(header, sizeof(bmp_header_t), 1, file);

    unsigned int num_channels = header->bits_per_pixel/8;

    // Assumes 1st pixel is top-left
    for(int i=header->height-1; i>=0; i--) {
        unsigned char *p = (unsigned char *)image + i * header->width * 4;
        for(int j=0; j<header->width; j++) {
            fwrite(p, num_channels, 1, file); p += 4;
        }
    }

    // Assumes the input buffer is in .bmp pixel format
    // unsigned char *p = (unsigned char *)image;
    // for(int i=0; i<header->height * header->width; i++) {
    //     fwrite(p, N_CHANNELS, 1, file); p += 4;
    // }
    fclose(file);
}

