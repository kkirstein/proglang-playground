// mandelbrot.js
// Calculate Mandelbrot set in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

import fs from "node:fs";
import { Complex } from "complex.js";
import { Colormap } from "./colormap";
import { color } from "bun";

var r_max = 2.0;
var n_max = Colormap.length;

// calculate pixel value
function pixel(x: number, y: number): number {
	var z0 = new Complex({ re: x, im: y });
	var z = new Complex(0, 0);

	for (var n = 0; n <= n_max; n++) {
		z = z.mul(z).add(z0);
		if (z.abs() > r_max) { return n; }
	}
	return 0;
}

function value2RGB(val: number): number[] {
	const color_value = (val < n_max) ? Colormap[val] : [0, 0, 0];
	return (color_value !== undefined) ? color_value : [0, 0, 0];
}

// calculate Mandelbrot set for given coordinates
export function mandelbrot(x_max: number, y_max: number, x_center: number, y_center: number, pixel_size: number): { width: number, height: number, pixel: number[][] } {
	const x_offset = x_center - 0.5 * pixel_size * (x_max + 1);
	const y_offset = y_center + 0.5 * pixel_size * (y_max + 1);

	let data = new Array(x_max * y_max);
	for (var y = 0; y < y_max; y++) {
		for (var x = 0; x < x_max; x++) {
			data[y * x_max + x] = value2RGB(pixel(x_offset + x * pixel_size, y_offset - y * pixel_size));
		}
	}

	return { width: x_max, height: y_max, pixel: data };
}

// async version using Promise
export function mandelbrot_async(x_max: number, y_max: number, x_center: number, y_center: number, pixel_size: number): Promise<{ width: number, height: number, pixel: number[][] }> {
	return new Promise(function (resolve, reject) {
		const x_offset = x_center - 0.5 * pixel_size * (x_max + 1);
		const y_offset = y_center + 0.5 * pixel_size * (y_max + 1);
		let data = new Array(x_max * y_max);
		for (var y = 0; y < y_max; y++) {
			for (var x = 0; x < x_max; x++) {
				data[y * x_max + x] = value2RGB(pixel(x_offset + x * pixel_size, y_offset - y * pixel_size));
			}
		}
		resolve({ width: x_max, height: y_max, pixel: data });
	});
}


// write image to PGM file
export function writePGM(file_name: string, image: { width: number, height: number, pixel: number[][] }): boolean {

	let fid = fs.createWriteStream(file_name);

	// write header to file
	let header_str = "P3" + "\n" + image.width + "\n" + image.height + "\n" + "255" + "\n";
	fid.write(header_str);

	let data_str = image.pixel.map(function (pix) {
		return pix.join(" ");
	}).join("\n");
	fid.write(data_str);
	fid.write("\n");

	fid.end();
	return true;
}
