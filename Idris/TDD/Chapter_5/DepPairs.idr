-- DepPairs.idr

-- Demonstrates dependendent pairs by reading
-- 2 Vect of variable length
-- and zip them together


import Data.Vect

||| Reads a Vect of unknown length
readVect : IO (len ** Vect len String)
readVect = do
  x <- getLine
  if x == ""
     then pure (_ ** [])
     else do (_ ** xs) <- readVect
             pure (_ ** x :: xs)

||| Zip to Vect of unknown length
zipInputs : IO ()
zipInputs = do putStrLn "Enter first vector (blank line to end):"
               (len1 ** vec1) <- readVect
               putStrLn "Enter second vector (blank line to end):"
               (len2 ** vec2) <- readVect
               case exactLength len1 vec2 of
                    Nothing => putStrLn "Vectors have different length"
                    Just vec2' => printLn (zip vec1 vec2')



