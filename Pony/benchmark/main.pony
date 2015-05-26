// A simple set of (micro-) benchmarks for the
// Pony programming language
//
// vim: ft=pony sw=2 ts=2 et
//

actor Main
  new create(env: Env) =>
    env.out.print("Starting benchmarks... ")
		env.out.print("")

    env.out.print("Fibonacci numbers:")
    env.out.print("==================")
    let fib_res = Fibonacci.fib_naive(35)
    env.out.print("fib_naive(35) = " + fib_res.string())

		env.out.print("")

    env.out.print("Perfect numbers:")
    env.out.print("================")

		env.out.print("")

    env.out.print("----------------")
    env.out.print("done!")


// so, far I don't know about packages, so put everything here:

// Finbonacci numbers
class Fibonacci
  fun fib_naive(n: U64) : U64 =>
    if n < 2 then n
    else fib_naive(n-2) + fib_naive(n-1)
    end



