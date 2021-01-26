/* vim: set ft=c sw=4 ts=4: */

/* mandelbrot.h
 * Header file for Mandelbrot set calculation in C */

#ifndef MANDELBROT_H
#define MANDELBROT_H

#include "image.h"

/** generate mandelbrot set for given coordinates */
struct image *create(size_t const width, size_t const height, double const x_center,
                     double const y_center, double const pixel_size);

#endif
