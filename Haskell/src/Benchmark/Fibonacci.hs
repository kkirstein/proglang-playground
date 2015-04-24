-- Fibonacci.hs
-- Caluclate Fibonacci numbers in Haskell
--
-- vim: ft=haskell sw=2 ts=2 et
--

module Fibonacci
	( fibNaive
	, fib )
	where


-- naive approach
fibNaive :: Integer -> Integer
fibNaive n
  | n < 2 = n
  | otherwise = fibNaive (n -1) + fibNaive (n -2)

fib :: Integer -> Integer
fib n = fib' 0 1 n
  where
    fib' a _ 0 = a
    fib' a b n = fib' b (a+b) (n-1)

      
