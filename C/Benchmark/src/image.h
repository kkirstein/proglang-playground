/* vim: set ft=c sw=4 ts=4: */

/* image.h
 * Header file for image data struct and methods */

#ifndef IMAGE_H
#define IMAGE_H

/** struct for RGB image data */
struct image {
	size_t width,
	size_t height,
	size_t channels,
	char *data
};

#endif

