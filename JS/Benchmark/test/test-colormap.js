// test-colormap.js
// test for Colormap set module
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var cm = require('../colormap.js');
var expect = require('expect.js');

describe('Colormap module', function () {

	it('should export colormap array', function () {
		expect(cm.Colormap).to.be.an('array');
	});

	it('should contain RGB entries', function () {
		cm.Colormap.forEach( function (e) {
			expect(e).to.have.length(3);
		});
	});
});



