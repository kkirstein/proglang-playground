-- DepPairs.idr

-- Demonstrates dependendent pairs by reading
-- 2 Vect of variable length
-- and zip them together



||| Reads a Vect of unknown length
readVect : IO (len ** Vect len String)
readVect = do
  x <- getLine
  if x == ""
     then pure (_ ** [])
     else do (_ ** xs) <- readVect
             pure (_ ** x :: xs)

