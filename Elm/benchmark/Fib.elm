-- vim: ft=elm sw=4 ts=4 et
--
-- Fib.elm
-- Calculate Fibonacci series
--
module Fib where

-- naive approach
-----------------
fib_naive n = if n <= 2 then 1 else fib_naive (n-2) + fib_naive (n-1)

-- tail-call optimize approach
------------------------------
fib n =
    let fib' a b n = if n == 0 then (a, b, 0) else fib' b (a+b) (n-1)
        (res, _, _) = fib' 0 1 n
    in
        res

