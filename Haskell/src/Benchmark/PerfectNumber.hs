-- PerfectNumber.hs
-- Caluclate perfect numbers in Haskell
--
-- vim: ft=haskell sw=2 ts=2 et
--

module PerfectNumber where


-- Predicate for pefect numbers
isPerfect :: Integral a => a -> Bool
isPerfect n =
  isPerfect' n 1 0
  where
    isPerfect' n i sum
      | i == n = (sum == n)
      | n `mod` i == 0 = isPerfect' n (i+1) (sum+i)
      | otherwise = isPerfect' n (i+1) sum

-- Generate perfect number up to given limit
perfectNumbers :: Integral a => a -> [a]
perfectNumbers n =
  [ x | x <- [1..n], isPerfect x ]



