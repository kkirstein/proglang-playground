// A simple set of (micro-) benchmarks for the
// Pony programming language
//
// vim: ft=pony sw=2 ts=2 et
//

use "time"

actor Main
  new create(env: Env) =>
    env.out.print("Starting benchmarks... ")
		env.out.print("")

    env.out.print("Fibonacci numbers:")
    env.out.print("==================")
    let tic_1 = Time.perf_begin()
    let fib_naive_res = Fibonacci.fib_naive(35)
    let toc_1 = Time.perf_end()
    env.out.print("fib_naive(35) = " + fib_naive_res.string() + " Elapsed: " + (toc_1 - tic_1).string() + "cycles")

    let tic_2 = Time.perf_begin()
    let fib_res = Fibonacci.fib(35)
    let toc_2 = Time.perf_end()
    env.out.print("fib(35) = " + fib_res.string() + " Elapsed: " + (toc_2 - tic_2).string() + "cycles")

    let tic_3 = Time.perf_begin()
    let fib2_res = Fibonacci.fib(1000)
    let toc_3 = Time.perf_end()
    env.out.print("fib(1000) = " + fib2_res.string() + " Elapsed: " + (toc_3 - tic_3).string() + "cycles")

		env.out.print("")

    env.out.print("Perfect numbers:")
    env.out.print("================")

		env.out.print("")

    env.out.print("----------------")
    env.out.print("done!")

  //fun _timeit[T1, T2](d: Applyable[T1, T2], arg: T1) : (T2, U64) =>
  //  let tic = Time.perf_begin()
  //  let res = d.apply(arg)
  //  let toc = Time.perf_end()
  //  (res, toc-tic)



// so, far I don't know about packages, so put everything here:

// Fibonacci numbers
primitive Fibonacci
  fun fib_naive(n: U64) : U64 =>
    if n < 2 then n
    else fib_naive(n-2) + fib_naive(n-1)
    end

  fun _fib_aux(n: U32, a: U128, b: U128) : U128 =>
    if n == 0 then a
    else _fib_aux(n-1, b, a+b)
    end

  fun fib(n: U32) : U128 =>
    _fib_aux(n, 0, 1)

// use sugar for function objects
interface Applyable[T1, T2]
  fun apply(arg: T1) : T2

class FibNaive
  fun apply(n: U64) : U64 =>
    Fibonacci.fib_naive(n)


