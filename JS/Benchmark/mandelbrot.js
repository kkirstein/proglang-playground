// mandelbrot.js
// Calculate Mandelbrot set in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var fs = require("fs");
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
	return (val < n_max) ? cm.Colormap[val] : [0, 0, 0];
}

// calculate Mandelbrot set for given coordinates
function mandelbrot (x_max, y_max, x_center, y_center, pixel_size) {
	const x_offset = x_center - 0.5 * pixel_size * (x_max + 1);
	const y_offset = y_center + 0.5 * pixel_size * (y_max + 1);

	let data = new Array(x_max*y_max);
	for (var y=0; y<y_max; y++) {
		for (var x=0; x<x_max; x++) {
			data[y*x_max + x] = value2RGB(pixel(x_offset + x*pixel_size, y_offset - y*pixel_size));
		}
	}

	return { width: x_max, height: y_max, pixel: data };
}

// async version using Promise
function mandelbrot_async (x_max, y_max, x_center, y_center, pixel_size) {
	return new Promise( function (resolve, reject) {
		const x_offset = x_center - 0.5 * pixel_size * (x_max + 1);
		const y_offset = y_center + 0.5 * pixel_size * (y_max + 1);
		let data = new Array(x_max*y_max);
		for (var y=0; y<y_max; y++) {
			for (var x=0; x<x_max; x++) {
				data[y*x_max + x] = value2RGB(pixel(x_offset + x*pixel_size, y_offset - y*pixel_size));
			}
		}
		resolve({ width: x_max, height: y_max, pixel: data });
	});
}
 

// write image to PGM file
function writePGM (file_name, image, cb) {

	let fid = fs.createWriteStream(file_name);

	// write header to file
	let header_str = "P3" + "\n" + image.width + "\n" + image.height + "\n" + "255" + "\n";
	fid.write(header_str);

	let data_str = image.pixel.map(function (pix) {
		return pix.join(" ");
	}).join("\n");
	fid.write(data_str);

	fid.end();
	return true;
}

// exports
exports.mandelbrot = mandelbrot;
exports.mandelbrot_async = mandelbrot_async;
exports.writePGM = writePGM;


