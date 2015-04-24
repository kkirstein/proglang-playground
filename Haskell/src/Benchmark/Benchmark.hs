-- Benchmark.hs
-- A set of (micro-) benchmarks for the Haskell
-- programming language
--
-- vim: ft=haskell sw=2 ts=2 et
--

module Main where

import System.CPUTime

import Fibonacci as Fib
import PerfectNumber as Pn

-- a helper fun for timing measurement
timeIt :: (Fractional c) => (a -> IO b) -> a -> IO c
timeIt action arg =
  do startTime <- getCPUTime
     action arg
     finishTime <- getCPUTime
     return $ fromIntegral (finishTime - startTime) / 1000000000000
 
toMSec :: (Integral a, Fractional c) => a -> a -> c
toMSec tic toc =
  fromIntegral (toc -tic) / 1000000000

--timeIt' :: (Fractional c) => (a -> b) -> a -> IO (b, c)
--timeIt' f arg =
--  do tic <- getCPUTime
--     res <- f arg
--     toc <- getCPUTime
--     return (res, fromIntegral $ (toc - tic) / 1000000000000)


-- main entry point
main :: IO ()
main =
  do putStrLn "Haskell Benchmarks"
     putStrLn "=================="
     putStrLn ""
     putStrLn "Fibonacci numbers:"
     putStrLn "------------------"
     tic <- getCPUTime
     putStrLn $ "fibNaive(35) = " ++ show (fibNaive 35)
     toc <- getCPUTime
     putStrLn $ "Elapsed: " ++ show (toMSec tic toc) ++ "msec."
     tic <- getCPUTime
     putStrLn $ "fib(35) = " ++ show (fib 35)
     toc <- getCPUTime
     putStrLn $ "Elapsed: " ++ show (toMSec tic toc) ++ "msec."
     tic <- getCPUTime
     putStrLn $ "fib(1000) = " ++ show (fib 1000)
     toc <- getCPUTime
     putStrLn $ "Elapsed: " ++ show (toMSec tic toc) ++ "msec."

     putStrLn ""
     putStrLn "Perfect numbers:"
     putStrLn "----------------"
     tic <- getCPUTime
     putStrLn $ "perfectNumbers(10000) = " ++ show (perfectNumbers 10000)
     toc <- getCPUTime
     putStrLn $ "Elapsed: " ++ show (toMSec tic toc) ++ "msec."

     putStrLn ""
     putStrLn "Done!"
     putStrLn "Press <ENTER> to continue.."
     getLine
     return ()

