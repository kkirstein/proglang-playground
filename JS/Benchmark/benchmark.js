// benchmark.js
// Some (micro-)benchmarks for the JavaScript (node/io) programming language
//
// vim: ft=javascript sw=4 ts=4
//

var fib = require("./fib");

console.log("Fibonacci numbers:");
console.log("------------------");

var tic = new Date();
var fib_1 = fib.fib_naive(35);
var toc = new Date();
console.log("fib_naive(35) = ", fib_1, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");

tic = new Date();
var fib_2 = fib.fib(35);
toc = new Date();
console.log("fib(35) = ", fib_2, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");

tic = new Date();
var fib_3 = fib.fib(1000);
toc = new Date();
console.log("fib(1000) = ", fib_3, "\tElapsed: ", (toc.getTime()-tic.getTime()), "ms.");



console.log("------------------");
console.log("Done!");

