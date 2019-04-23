-- vim: set ft=idris sw=2 ts=2:
--
-- fibonacci.idr
-- Calculate Fibonacci numbers in the Idris programming language
--

module Fibonacci


-- Naive implementation
export
fib_naive : Int -> Int
fib_naive 0 = 0
fib_naive 1 = 1
fib_naive n = fib_naive (n - 1) + fib_naive (n - 2)

-- Tail-call friendly version
export
fib : Nat -> Nat
fib n = fib_aux Z (S Z) n where
  fib_aux : Nat -> Nat -> Nat -> Nat
  fib_aux a b Z = a
  fib_aux a b (S n) = fib_aux b (plus a b) n


