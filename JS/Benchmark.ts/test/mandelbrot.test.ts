// mandelbrot.test.ts
// test for Mandelbrot set module
//
// vim: ft=typescript sw=4 ts=4
//


import { mandelbrot, mandelbrot_async } from "../mandelbrot";
import { expect, describe, it } from "bun:test";


describe('Mandelbrot module', function () {

	it('should export mandelbrot functions', function () {
		expect(mandelbrot).toBeFunction();
		expect(mandelbrot).toBeFunction();
	});

	it('should return an image object', function () {
		var img = mandelbrot(180, 120, -0.5, 0.0, 4.0 / 180);
		expect(img).toHaveProperty('width', 180);
		expect(img).toHaveProperty('height', 120);
		expect(img).toHaveProperty('pixel');
	});
	it('should return a Promise, which resolves to an image object', function () {
		var promise = mandelbrot_async(180, 120, -0.5, 0.0, 4.0 / 180);
		promise.then(function (res) {
			expect(res).toHaveProperty('width', 180);
			expect(res).toHaveProperty('height', 120);
			expect(res).toHaveProperty('pixel');
		});
	});
});


