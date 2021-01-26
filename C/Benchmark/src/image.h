/* vim: set ft=c sw=4 ts=4: */

/* image.h
 * Header file for image data struct and methods */

#ifndef IMAGE_H
#define IMAGE_H

#include <stdlib.h>

/** struct for RGB image data */
struct image {
    size_t width;
    size_t height;
    size_t channels;
    char *data;
};

struct image *img_create(size_t const width, size_t const height,
                     size_t const channels);

void img_deinit(struct image *img);

void img_set_pixel(struct image *img, size_t const width, size_t const height,
               char const pix[1]);

char *img_get_pixel(struct image const *const img, const size_t width,
                const size_t height);

int img_writePPM(struct image const *const img, char const file_name[1]);
#endif
