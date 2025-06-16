// benchmark.ts
// Some (micro-)benchmarks for the TypeScript programming language
//
// vim: ft=typescript sw=2 ts=2
//

import { fib, fib_naive } from "./fib.ts";
import { perfect_numbers, sequence } from "./perfect_numbers.ts";
import { mandelbrot, mandelbrot_async, writePGM } from "./mandelbrot.ts";
import { isAsyncFunction } from "node:util/types";

// time_it helper
async function time_it(fun: (...x: any[]) => any | Promise<any>, ...args: any[]): Promise<{ result: any, elapsed: number }> {
  return new Promise((resolve, reject) => {
    const tic = new Date();
    if (isAsyncFunction(fun)) {
      fun(...args).then((res: any) => {
        const toc = new Date();
        resolve({ result: res, elapsed: toc.getTime() - tic.getTime() });
      }).catch((err: any) => {
        reject(err);
      });
    } else {
      const res = fun(...args);
      const toc = new Date();
      resolve({ result: res, elapsed: toc.getTime() - tic.getTime() });
    }
  });
}
//async function time_it_async(fun, ...args): Promise<{result: any, elapsed: number}> {
//  const tic = new Date();
//  const res = await fun(...args);
//  const toc = new Date();
//  return {"result": res, "elapsed": toc.getTime()-tic.getTime()};
//}

(async () => {

  console.log("TypeScript benchmarks");
  console.log("=====================");
  console.log();

  console.log("Fibonacci numbers:");
  console.log("------------------");

  const fib_naive_result = await time_it(fib_naive, 35);
  console.log(`Naive implementation: fib(35) = ${fib_naive_result.result} (elapsed: ${fib_naive_result.elapsed} ms)`);
  const fib_result = await time_it(fib, 35);
  console.log(`Efficient implementation: fib(35) = ${fib_result.result} (elapsed: ${fib_result.elapsed} ms)`);
  const fib_result_2 = await time_it(fib, 1000);
  console.log(`Efficient implementation: fib(1000) = ${fib_result_2.result} (elapsed: ${fib_result_2.elapsed} ms)`);
  console.log();

  console.log("Perfect numbers:");
  console.log("----------------");

  const pn = await time_it(perfect_numbers, 10000);
  console.log(`Perfect numbers <= 10000: ${pn.result.join(", ")} (elapsed: ${pn.elapsed} ms)`);
  const tic = new Date();
  const pn_1 = [];
  let pn_seq = sequence();
  for (let i = 0; i < 4; i++) {
    pn_1.push(pn_seq.next().value);
  }
  const toc = new Date();
  console.log(`First 4 perfect numbers from generator: ${pn_1.join(", ")} (elapsed: ${toc.getTime() - tic.getTime()} ms)`);
  console.log();

  console.log("Mandelbrot set:");
  console.log("---------------");

  const mandel = await time_it(mandelbrot, 180, 120, -0.5, 0.0, 4.0 / 180);
  console.log(`Mandelbrot set image: ${mandel.result.width}x${mandel.result.height} pixels (elapsed: ${mandel.elapsed} ms)`);
  const mandel_large = await time_it(mandelbrot, 1920, 1200, -0.5, 0.0, 4.0 / 1920);
  console.log(`Mandelbrot set image: ${mandel_large.result.width}x${mandel_large.result.height} pixels (elapsed: ${mandel_large.elapsed} ms)`);

  const mandel_async = await time_it(mandelbrot_async, 180, 120, -0.5, 0.0, 4.0 / 180);
  console.log(`Mandelbrot set image (async): ${mandel_async.result.width}x${mandel_async.result.height} pixels (elapsed: ${mandel_async.elapsed} ms)`);
  const mandel_async_large = await time_it(mandelbrot_async, 1920, 1200, -0.5, 0.0, 4.0 / 1920);
  console.log(`Mandelbrot set image (async): ${mandel_async_large.result.width}x${mandel_async_large.result.height} pixels (elapsed: ${mandel_async_large.elapsed} ms)`);

  const image_written = await time_it(writePGM, "mandelbrot.pgm", mandel.result);
  console.log(`Mandelbrot set image written to file (elapsed: ${image_written.elapsed} ms)`);

  console.log();

  console.log("------------------");
  console.log("Done!");

})()
