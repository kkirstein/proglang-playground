-- Exercise_4_2.idr
--

import Data.Vect


||| Take the first n elements of given Vect xs
vectTake : (n : Nat) -> (xs : Vect (n + m) a) -> Vect n a
vectTake Z [] = []
vectTake Z (x :: xs) = []
vectTake (S k) (x :: xs) = x :: vectTake k xs



