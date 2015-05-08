// mandelbrot.js
// Calculate Mandelbrot set in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var Complex = require("Complex");
var cm = require("./colormap");

var r_max = 2.0;
var n_max = cm.Colormap.length;

// calculate pixel value
function pixel(x, y) {
	var z0 = Complex.from(x, y).finalize();
	var z = new Complex(0, 0);

	for (var n = 0; n <= n_max; n++) {
		z = z.multiply(z).add(z0);
		if (z.abs() > r_max) { return n; }
	}
	return 0;
}

function value2RGB(val) {
	return cm.Colormap[val] || [0, 0, 0];
}

// calculate Mandelbrot set for given coordinates
exports.mandelbrot = function (x_max, y_max, x_center, y_center, pixel_size) {

	const x_offset = x_center - 0.5 * pixel_size * (x_max + 1);
	const y_offset = y_center + 0.5 * pixel_size * (y_max + 1);

	let image = Array(x_max*y_max);

	for (var y=1; y<y_max; y++) {
		for (var x=1; x<x_max; x++) {
			image[y*x_max + x -1] = value2RGB(pixel(x_offset + x*pixel_size, y_offset - y*pixel_size));
		}
	}

	return image;
}

exports.debug = function() {
	let image = mandelbrot(640, 480, -0.5, 0.0, 4.0/640);
}

