-- vim: set ft=idris sw=2 ts=2:
--
-- perfect_number.idr
-- Calculate 'perfect' numbers in the Idris programming language
--

module PerfectNumber

-- predicate to check whether given number is perfect
is_perfect : (Integral a, Ord a) => a -> Bool
is_perfect n = if n > 0 then loop n 1 0 else False
where
  loop : a -> a -> a -> Bool
  loop n i sum = if n == i then (sum == n) else
    if (n `mod` i) == 0 then loop n (i + 1) (sum + i) else loop n (i + 1) sum

-- generate 'perfect' numbers until given limit
perfect_numbers : Nat -> List Nat
perfect_numbers n = filter (\x => is_perfect x) $ natRange n

