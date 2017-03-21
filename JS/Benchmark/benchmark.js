// benchmark.js
// Some (micro-)benchmarks for the JavaScript (node/io) programming language
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

const fib = require("./fib");
const BigInt = require('BigInt');
const pn = require("./perfect_numbers");
const mandel = require("./mandelbrot");

console.log("JavaScript benchmarks");
console.log("=====================");
console.log();

console.log("Fibonacci numbers:");
console.log("------------------");

var tic = new Date();
var res = fib.fib_naive(35);
var toc = new Date();
console.log("fib_naive(35) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");

var tic = new Date();
var fib_promise = fib.fib_naive_async(35);
fib_promise.then((res) => {
  var toc = new Date();
  console.log("fib_naive_async(35) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");
});

tic = new Date();
res = fib.fib(35);
toc = new Date();
console.log("fib(35) = ", BigInt.bigInt2str(res, 10), "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");

tic = new Date();
res = fib.fib(1000);
toc = new Date();
console.log("fib(1000) = ", BigInt.bigInt2str(res, 10), "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");
console.log();

console.log("Perfect numbers:");
console.log("----------------");

tic = new Date();
res = pn.perfect_numbers(10000);
toc = new Date();
console.log("perfect_numbers(10000) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");
tic = new Date();
res = [];
// the following version seems not to be completely lazy:
//for (let n of pn.sequence()) {
//   	if (n < 1000) res.push(n); else break;
//}
var gen = pn.sequence();
for (let i=0; i<4; i++) {
   	res.push(gen.next().value);
}
toc = new Date();
console.log("4 perfect numbers (Generator) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");
console.log();


console.log("Mandelbrot set:");
console.log("--------------");

var tic11 = new Date();
let image = mandel.mandelbrot(640, 480, -0.5, 0.0, 4.0/640);
var toc11 = new Date();
console.log("Mandelbrot set (640x480) calculated!", "\tElapsed: ", (toc11.getTime()-tic11.getTime()), "ms.");

var tic12 = new Date();
var promise = mandel.mandelbrot_async(640, 480, -0.5, 0.0, 4.0/640);
promise.then(function (res) {
	var toc12 = new Date();
	console.log("Mandelbrot set (640x480) calculated (async)!", "\tElapsed: ", (toc12.getTime()-tic12.getTime()), "ms.");
});

var tic13 = new Date();
mandel.writePGM("./mandelbrot.pgm", image);
var toc13 = new Date();
console.log("Mandelbrot set (640x480) written!", "\tElapsed: ", (toc13.getTime()-tic13.getTime()), "ms.");
console.log();

// wait for all pending promises
// TODO
console.log("------------------");
console.log("Done!");
