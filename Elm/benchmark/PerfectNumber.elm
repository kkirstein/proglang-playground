-- vim: ft=elm sw=4 ts=4 et
--
-- PerfectNumber.elm
-- Calculate perfect numbers
--
module PerfectNumber where

import Trampoline (..)

-- check whether given number is perfect
isperfect : Int -> Bool
isperfect n =
    let loop s i n = 
        if  | i == n -> Done (s == n)
            | (n `rem` i) == 0 -> Continue (\() -> loop (s+i) (i+1) n)
            | otherwise -> Continue (\() -> loop s (i+1) n)
    in
        trampoline <| loop 0 1 n

-- calculate perfect numbers until upper limit is met
-----------------------------------------------------
perfectnumbers : Int -> [Int]
perfectnumbers n = filter isperfect [1..n]

