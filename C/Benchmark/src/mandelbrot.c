/* vim: set ft=c sw=4 ts=4: */

/* mandelbrot.c
 * Mandelbrot set calculation in C */

#include "mandelbrot.h"
#include <complex.h>

#ifdef _MSC_VER
typedef _Dcomplex dcplx;
#else
typedef double complex dcplx;
#endif

#define R_MAX 2.0
#define N_MAX 255

#ifdef _MSC_VER
unsigned calc_value(dcplx const z0) {

    dcplx z = _Cbuild(0.0, 0.0);

    for (unsigned n = N_MAX; n > 0; --n) {
        z = _Cbuild(creal(z) * creal(z) - cimag(z) * cimag(z) + creal(z0),
                    2 * creal(z) * cimag(z) + cimag(z0));
        if (cabs(z) > R_MAX)
            return n;
    }

    return 0;
}
#else
unsigned calc_value(dcplx const z0) {

    dcplx z = 0 + 0 * I;

    for (unsigned n = N_MAX; n > 0; --n) {
        z = z * z + z0;
        if (cabs(z) > R_MAX)
            return n;
    }

    return 0;
}
#endif

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

#ifdef _MSC_VER
    const dcplx offset = _Cbuild(x_center - 0.5 * pixel_size * (double)width,
                                 y_center + 0.5 * pixel_size * (double)height);
#else
    const dcplx offset = x_center - 0.5 * pixel_size * (double)width +
                         I * (y_center + 0.5 * pixel_size * (double)height);
#endif

    size_t y;
#pragma omp parallel for private(y)
    for (y = 0; y < height; ++y) {
        for (size_t x = 0; x < width; ++x) {
#ifdef _MSC_VER
            dcplx z = _Cbuild((double)x * pixel_size + creal(offset),
                              -(double)y * pixel_size + cimag(offset));
#else
            dcplx z = x * pixel_size - y * pixel_size * I + offset;
#endif
            to_rgb(calc_value(z), rgb);
            img_set_pixel(img, x, y, rgb);
        }
    }

    return img;
}
