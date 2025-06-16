// benchmark.ts
// Some (micro-)benchmarks for the TypeScript programming language
//
// vim: ft=typescript sw=2 ts=2
//

import { fib, fib_naive } from "./fib.ts";
import { perfect_numbers, sequence } from "./perfect_numbers.ts";

// time_it helper
async function time_it(fun: (...x: any[]) => any, ...args: any[]): Promise<{ result: any, elapsed: number }> {
  return new Promise((resolve, reject) => {
    const tic = new Date();
    const res = fun(...args);
    const toc = new Date();
    resolve({ "result": res, "elapsed": toc.getTime() - tic.getTime() });
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
  console.log();

  console.log("------------------");
  console.log("Done!");

})()
