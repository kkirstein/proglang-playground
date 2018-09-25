// Calulate Fibonacci numbers in FSharp

namespace Tasks

module Fibonacci =
    (* a naive implementation of Fibonacci numbers *)
    let rec fibNaive n =
        if n > 2 then fibNaive (n - 1) + fibNaive (n - 2)
        else 1

    (* optimized version *)
    let fib n =
        let rec loop a b i =
            if i < 1 then a
            else loop b (a + b) (i - 1)
        in
        loop 0 1 n
