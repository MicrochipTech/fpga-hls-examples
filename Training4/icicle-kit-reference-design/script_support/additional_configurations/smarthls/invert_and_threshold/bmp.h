#include <stdio.h>
#include <stdlib.h>
#include "inttypes.h"
#include <sys/time.h>
#include "hls/hls_alloc.h"

// make sure the HEIGHT/N_ROWS is an integer number
#define N_CHANNELS 3
#define WIDTH 1920
#define HEIGHT 1080
#define N_ROWS 45
#define FILENAME "toronto.bmp"

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

bmp_pixel_t *read_bmp(const std::string filename, bmp_header_t *header) {
    FILE *file = fopen(filename.c_str(), "rb");
    if (!file) {
        fprintf(stderr,"Unable to read %s\n", filename.c_str());
        exit(-1);
    };

    if (fread(header, sizeof(bmp_header_t), 1, file) != 1) return NULL;
    
    if (header->offset != sizeof(bmp_header_t) ||
        header->width != WIDTH || header->height != HEIGHT) return NULL;

    bmp_pixel_t *image = (bmp_pixel_t*)hls_malloc(HEIGHT * WIDTH * sizeof(bmp_pixel_t), HLS_ALLOC_CACHED);
    unsigned char *p = (unsigned char *)image;
    for(int i=0; i<HEIGHT * WIDTH; i++) {
        fread(p, N_CHANNELS, 1, file); p += 4;
    }
    fclose(file);
    return image;
}

void write_bmp(const std::string filename, const bmp_header_t *header, const bmp_pixel_t *image) {
    FILE *file = fopen(filename.c_str(), "wb");
    if (!file) {
        fprintf(stderr,"Unable to write %s\n", filename.c_str());
        exit(-1);
    };

    fwrite(header, sizeof(bmp_header_t), 1, file);
    unsigned char *p = (unsigned char *)image;
    for(int i=0; i<header->height * header->width; i++) {
        fwrite(p, N_CHANNELS, 1, file); p += 4;
    }
    fclose(file);
}

double timestamp() {
    struct timeval Tp;
    int stat = gettimeofday (&Tp, NULL);
    if (stat != 0)
      printf ("Error return from gettimeofday: %d", stat);
    return (Tp.tv_sec + Tp.tv_usec * 1.0e-6);
}
