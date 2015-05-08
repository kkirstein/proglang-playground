-- PerfectNumber.hs
-- Caluclate perfect numbers in Haskell
--
-- vim: ft=haskell sw=2 ts=2 et
--

module PerfectNumber where


-- Predicate for pefect numbers
isPerfect :: Integral a => a -> Bool
isPerfect n =
  isPerfect' 1 0
  where
    isPerfect' i s
      | i == n = s==n
      | n `mod` i == 0 = isPerfect' (i+1) (s+i)
      | otherwise = isPerfect' (i+1) s

-- Generate perfect number up to given limit
perfectNumbers :: Integral a => a -> [a]
perfectNumbers n =
  [ x | x <- [1..n], isPerfect x ]



