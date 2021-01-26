/* vim: set ft=c sw=4 ts=4: */

/* image.c
 * Implementation file for image data struct and methods */

#include "image.h"
#include <stdio.h>

struct image *img_create(const size_t width, const size_t height,
                         const size_t channels) {
    struct image *img = 0;
    char *data = 0;

    img = (struct image *)malloc(sizeof(struct image));
    if (!img)
        return 0;

    data = (char *)malloc(width * height * channels * sizeof(char));
    if (!data)
        return 0;

    img->width = width;
    img->height = height;
    img->channels = channels;
    img->data = data;

    return img;
}

void img_deinit(struct image *img) {
    if (img) {
        if (img->data)
            free(img->data);
        free(img);
    }
}

void img_set_pixel(struct image *img, size_t const x, size_t const y,
                   char const pix[1]) {
    size_t const stride = (x + img->width * y) * img->channels;
    for (unsigned i = 0; i < img->channels; ++i) {
        img->data[stride + i] = pix[i];
    }
}

char *img_get_pixel(struct image const *const img, size_t const x,
                    size_t const y) {
    char *pix = 0;
    size_t const stride = (x + img->width * y) * img->channels;
    pix = (char *)malloc(img->channels * sizeof(char));
    if (!pix)
        return 0;

    for (unsigned i = 0; i < img->channels; i++) {
        pix[i] = img->data[stride + i];
    }

    return pix;
}

int img_writePPM(struct image const *const img, char const file_name[1]) {

    FILE *fp = 0;
    int ret;

    // open file
    fp = fopen(file_name, "w");
    if (!fp) {
        perror("fopen() error");
        return -1;
    }

    // write header
    ret = fprintf(fp, "P3\n");
    if (ret < 0) {
        perror("fprintf() error");
        fclose(fp);
        return -1;
    }
    ret = fprintf(fp, "%4zu %4zu  255\n", img->width, img->height);
    if (ret < 0) {
        perror("fprintf() error");
        fclose(fp);
        return -1;
    }

    // write pixel values
    for (size_t i = 0; i < img->width * img->height * img->channels; ++i) {
        ret = fprintf(fp, "%4u", img->data[i]);
        if (ret < 0) {
            perror("fprintf() error");
            fclose(fp);
            return -1;
        }
        if (i % (img->channels * 4) == (img->channels * 4 - 1)) {
            ret = fputc('\n', fp);
            if (!ret) {
                perror("fputc() error");
                fclose(fp);
                return -1;
            }
        }
    }
    // close
    fclose(fp);

    return 0;
}