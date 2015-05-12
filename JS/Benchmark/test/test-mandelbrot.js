// test-mandelbrot.js
// test for Mandelbrot set module
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var m = require('../mandelbrot.js');
var expect = require('expect.js');

describe('Mandelbrot module', function () {

	it('should export mandelbrot function', function () {
		expect(m.mandelbrot).to.be.a('function');
	});
});


