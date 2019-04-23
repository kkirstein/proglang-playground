-- vim: set ft=idris sw=2 ts=2:
--
-- benchmark.idr
-- A set of (micro-) benchmarks for the Idris programming language
--

module Main

import System
import Fibonacci
import PerfectNumber

-- convert list to string
show_list : Show a => List a -> String
show_list [] = ""
show_list (x :: xs) = (show x) ++ ", " ++ show_list xs


-- main entry point
main : IO ()
main = do
  tic <- System.time
  putStrLn $ "fib_naive(35) = " ++ (show (fib_naive 35))
  toc <- System.time
  putStrLn $ "Elapsed " ++ (show (toc - tic)) ++ "s."

  tic <- System.time
  putStrLn $ "fib(35) = " ++ (show (Fibonacci.fib 35))
  toc <- System.time
  putStrLn $ "Elapsed " ++ (show (toc - tic)) ++ "s."

  tic <- System.time
  putStrLn $ "fib(1000) = " ++ (show (Fibonacci.fib 1000))
  toc <- System.time
  putStrLn $ "Elapsed " ++ (show (toc - tic)) ++ "s."

  tic <- System.time
  putStrLn $ "pn(1000) = " ++ (show (perfect_numbers 1000))
  toc <- System.time
  putStrLn $ "Elapsed " ++ (show (toc - tic)) ++ "s."


