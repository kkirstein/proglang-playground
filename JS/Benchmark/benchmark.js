// benchmark.js
// Some (micro-)benchmarks for the JavaScript (node/io) programming language
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

// time_it helper
async function time_it(fun, ...args) {
  return new Promise((resolve, reject) => {
    const tic = new Date();
    const res = fun(...args);
    const toc = new Date();
    resolve({"result": res, "elapsed": toc.getTime()-tic.getTime()});
  });
}
async function time_it_async(fun, ...args) {
  const tic = new Date();
  const res = await fun(...args);
  const toc = new Date();
  return {"result": res, "elapsed": toc.getTime()-tic.getTime()};
}

// async entry point
(async () => {
  const fib = require("./fib");
  const BigInt = require('BigInt');
  const pn = require("./perfect_numbers");
  const mandel = require("./mandelbrot");

  console.log("JavaScript benchmarks");
  console.log("=====================");
  console.log();

  console.log("Fibonacci numbers:");
  console.log("------------------");

  const fib_naive = await time_it_async(fib.fib_naive, 35);
  console.log("fib_naive(35) = ", fib_naive.result, "\tElapsed: ", fib_naive.elapsed, "ms.");

  const fib_35 = await time_it_async(fib.fib, 35);
  console.log("fib(35) = ", BigInt.bigInt2str(fib_35.result, 10),
  "\tElapsed: ", fib_35.elapsed, "ms.");

  const fib_1000 = await time_it_async(fib.fib, 1000);
  console.log("fib(1000) = ", BigInt.bigInt2str(fib_1000.result, 10),
  "\tElapsed: ", fib_1000.elapsed, "ms.");

  console.log();
  console.log("Perfect numbers:");
  console.log("----------------");

  let tic = new Date();
  let res = pn.perfect_numbers(10000);
  let toc = new Date();
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
})()
