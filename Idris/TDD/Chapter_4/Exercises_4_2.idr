-- Exercise_4_2.idr
--

import Data.Vect


||| Take the first n elements of given Vect xs
vectTake : (n : Nat) -> (xs : Vect (n + m) a) -> Vect n a
vectTake Z [] = []
vectTake Z (x :: xs) = []
vectTake (S k) (x :: xs) = x :: vectTake k xs


||| Calculate sum of selected entries, return Nothing if index
||| is out of bounds
sumEntries : Num a => (pos : Integer) -> Vect n a -> Vect n a ->
             Maybe a
sumEntries {n} pos xs ys = case integerToFin pos n of
                                Nothing => Nothing
                                (Just x) => Just ((index x xs) + (index x ys))



