-- ReadVect.idr

-- Demonstrates reading of dependent types from stdin
-- e.g., reading Data.Vect of defined length

module ReadVect

import Data.Vect

||| Reads a Vect with given length
||| @len Length of Vect to be read
export
readVectLen : (len : Nat) -> IO (Vect len String)
readVectLen Z = pure []
readVectLen (S k) = do x <- getLine
                       xs <- readVectLen k
                       pure (x :: xs)


public export
data VectUnknown : Type -> Type where
  MkVect : (len : Nat) -> Vect len a -> VectUnknown a

||| Reads a Vect of unknown length
export
readVect2 : IO (VectUnknown String)
readVect2 = do x <- getLine
               if (x == "")
                 then pure (MkVect _ [])
                 else do MkVect _ xs <- readVect2
                         pure (MkVect _ (x :: xs))


||| Prints a vector of unknown length
export
printVect : Show a => VectUnknown a -> IO ()
printVect (MkVect len xs) =
  putStrLn (show xs ++ " (length: " ++ (show len) ++ ")\n")



