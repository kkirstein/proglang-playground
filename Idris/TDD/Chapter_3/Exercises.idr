-- Exercises.idr
-- Solutions for exercises of chapter 2

module Exercises

import Data.Vect

-- length function
myLength : List a -> Nat
myLength [] = 0
myLength (x :: xs) = 1 + myLength xs


-- reverse function
myReverse : List a -> List a
myReverse [] = []
myReverse (x :: xs) = (myReverse xs) ++ [x]

-- myVectReverse : Vect n a -> Vect n a
-- myVectReverse [] = []
-- myVectReverse (x :: xs) = (?myVectReverse_rhs xs) ++ (the (Vect 1 _) [x])


-- map function
myMap : (a -> b) -> List a -> List b
myMap f [] = []
myMap f (x :: xs) = f x :: myMap f xs

myVectMap : (a -> b) -> Vect n a -> Vect n b
myVectMap f [] = []
myVectMap f (x :: xs) = f x :: myVectMap f xs

