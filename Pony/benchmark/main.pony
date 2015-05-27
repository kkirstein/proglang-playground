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
    let tic = Time.perf_begin()
    let fib_res = Fibonacci.fib_naive(35)
    let toc = Time.perf_end()
    env.out.print("fib_naive(35) = " + fib_res.string() + " Elapsed: " + (toc-tic).string() + "ns")
    env.out.print("fib(35) = " + Fibonacci.fib(35).string())
    env.out.print("fib(1000) = " + Fibonacci.fib(1000).string())

		env.out.print("")

    env.out.print("Perfect numbers:")
    env.out.print("================")

		env.out.print("")

    env.out.print("----------------")
    env.out.print("done!")


// so, far I don't know about packages, so put everything here:

// Finbonacci numbers
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



