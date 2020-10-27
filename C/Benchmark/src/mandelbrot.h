/* vim: set ft=c sw=4 ts=4: */

/* mandelbrot.h
 * Header file for Mandelbrot set calculation in C */

#ifndef MANDELBROT_H
#define MANDELBROT_H

#include "image.h"

/** generate mandelbrot set for given coordinates */
void create (struct image *img, const int width, const int height,
		const double x_center, const double y_center, const double pixel_size);

#endif

