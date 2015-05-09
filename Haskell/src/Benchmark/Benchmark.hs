-- Benchmark.hs
-- A set of (micro-) benchmarks for the Haskell
-- programming language
--
-- vim: ft=haskell sw=2 ts=2 et
--

{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.CPUTime

import Fibonacci as Fib
import PerfectNumber as Pn
import qualified Mandelbrot as M

-- a helper fun for timing measurement
--timeIt :: (Fractional c) => (a -> b) -> a -> IO (b, c)
--timeIt action arg =
--  do startTime <- getCPUTime
--     res <- action arg
--     finishTime <- getCPUTime
--     return $ (res, fromIntegral (finishTime - startTime) / 1000000000000)
 
toMSec :: (Fractional a) => Integer -> Integer -> a
toMSec tic toc =
  fromIntegral (toc -tic) / 1000000000

toMSecStr :: Integer -> Integer -> String
toMSecStr tic toc =
  show $ fromIntegral (toc -tic) / 1000000000

putElapsedSince :: Integer -> IO ()
putElapsedSince tic =
  do toc <- getCPUTime
     putStrLn $ "Elapsed: " ++ show (toMSec tic toc) ++ "msec." 


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
     tic0 <- getCPUTime
     putStrLn $ "fibNaive(35) = " ++ show (fibNaive 35)
     putElapsedSince tic0
     tic1 <- getCPUTime
     putStrLn $ "fib(35) = " ++ show (fib 35)
     putElapsedSince tic1
     tic2 <- getCPUTime
     putStrLn $ "fib(1000) = " ++ show (fib 1000)
     putElapsedSince tic2

     putStrLn ""
     putStrLn "Perfect numbers:"
     putStrLn "----------------"
     tic3 <- getCPUTime
     putStrLn $ "perfectNumbers(10000) = " ++ show (perfectNumbers 10000)
     putElapsedSince tic3

     putStrLn ""
     putStrLn "Perfect numbers:"
     putStrLn "----------------"
     tic4 <- getCPUTime
     putStrLn $ "mandelbrot(640x480): "
        ++ show (length (M.mandelbrot 640 480 (-0.5) 0.0 (4/640)))
        ++ " pixel calculated"
     putElapsedSince tic4

     putStrLn ""
     putStrLn "Done!"
     putStrLn "Press <ENTER> to continue.."
     _ <- getLine
     return ()

