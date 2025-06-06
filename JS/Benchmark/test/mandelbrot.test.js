// test-mandelbrot.js
// test for Mandelbrot set module
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var m = require('../mandelbrot.js');
var expect = require('expect.js');

describe('Mandelbrot module', function () {

	it('should export mandelbrot functions', function () {
		expect(m.mandelbrot).to.be.a('function');
		expect(m.mandelbrot_async).to.be.a('function');
	});

	it('should return an image object', function () {
		var img = m.mandelbrot(180, 120, -0.5, 0.0, 4.0/180);
		expect(img).to.have.property('width', 180);
		expect(img).to.have.property('height', 120);
		expect(img).to.have.property('pixel');
	});
	it('should return a Promise, which resolves to an image object', function () {
		var promise = m.mandelbrot_async(180, 120, -0.5, 0.0, 4.0/180);
		promise.then(function (res) {
			expect(res).to.have.property('width', 180);
			expect(res).to.have.property('height', 120);
			expect(res).to.have.property('pixel');
		});
	});
});


