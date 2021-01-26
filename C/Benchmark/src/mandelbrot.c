/* vim: set ft=c sw=4 ts=4: */

/* mandelbrot.c
 * Mandelbrot set calculation in C */

#include "mandelbrot.h"
#include <complex.h>

#define R_MAX 2.0
#define N_MAX 255

unsigned calc_value(double complex const z0) {

    double complex z = 0 + 0 * I;

    for (unsigned n = N_MAX; n > 0; --n) {
        z = z * z + z0;
        if (cabs(z) > R_MAX)
            return n;
    }

    return 0;
}

void to_rgb(unsigned const val, char rgb[3]) {

    rgb[0] = 5 * (val % 15);
    rgb[1] = 32 * (val % 7);
    rgb[2] = 8 * (val % 31);
}

struct image *create(size_t const width, size_t const height,
                     double const x_center, double const y_center,
                     double const pixel_size) {

    struct image *img = 0;
    char rgb[3];

    img = img_create(width, height, 3);
    if (!img)
        return 0;

    const double complex offset =
        x_center - 0.5 * pixel_size * (double)width +
        I * (y_center + 0.5 * pixel_size * (double)height);

    for (size_t y = 0; y < height; ++y) {
        for (size_t x = 0; x < width; ++x) {
            double complex z = x * pixel_size - y * pixel_size * I + offset;
            to_rgb(calc_value(z), rgb);
            img_set_pixel(img, x, y, rgb);
        }
    }

    return img;
}
