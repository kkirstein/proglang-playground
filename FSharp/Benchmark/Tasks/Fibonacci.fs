// Calulate Fibonacci numbers in FSharp

namespace Tasks

module Fibonacci =
    let fib_naive n =
        if n > 2 then fib_naive (n - 1) + fib_naive (n - 2)
        else n