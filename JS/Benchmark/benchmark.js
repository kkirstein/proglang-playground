// benchmark.js
// Some (micro-)benchmarks for the JavaScript (node/io) programming language
//
// vim: ft=javascript sw=4 ts=4
//

var fib = require("./fib");
var pn = require("./perfect_numbers")

console.log("Fibonacci numbers:");
console.log("------------------");

var tic = new Date();
var res = fib.fib_naive(35);
var toc = new Date();
console.log("fib_naive(35) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");

tic = new Date();
res = fib.fib(35);
toc = new Date();
console.log("fib(35) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");

tic = new Date();
res = fib.fib(1000);
toc = new Date();
console.log("fib(1000) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");


console.log("Perfect numbers:");
console.log("----------------");

tic = new Date();
res = pn.perfect_numbers(10000);
toc = new Date();
console.log("perfect_numbers(10000) = ", res, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");


console.log("------------------");
console.log("Done!");

