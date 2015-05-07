// mandelbrot.js
// Calculate Mandelbrot set in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

var Complex = require("Complex");
var cm = require("./colormap");

var r_max = 2.0;
var n_max = cm.Colormap.length;

function pixel(x, y) {
	var z0 = Complex.from(x, y).finalize();
	var z = new Complex(0, 0);

	for (var n = 0; n <= n_max; n++) {
		z = z.multiply(z).add(z0);
		if (z.abs() > r_max) { return n; }
	}
	return 0;
}

exports.debug = function() {
	console.log("n_max = ", n_max);
}

