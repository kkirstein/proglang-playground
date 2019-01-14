-- vim: set ft=idris sw=2 ts=2:
--
-- fibonacci.idr
-- Calculate Fibonacci numbers in the Idris programming language
--

module Fibonacci


-- Naive implementation
fib_naive : Int -> Int
fib_naive 0 = 0
fib_naive 1 = 1
fib_naive n = fib_naive (n - 1) + fib_naive (n - 2)

-- Tail-call friendly version
fib : Int -> Integer
fib n = fib_aux 0 1 n where
  fib_aux : Integer -> Integer -> Int -> Integer
  fib_aux a b 0 = a
  fib_aux a b n = fib_aux b (a + b) (n -1)


