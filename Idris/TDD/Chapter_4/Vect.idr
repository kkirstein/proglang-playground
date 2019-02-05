-- Vect.idr
--
-- Vector type to demonstrate dependent types


||| Vect data type: A List with defined length
data Vect : Nat -> Type -> Type where
  ||| Empty vector
  Nil : Vect Z a
  ||| Prepend a new element to vector
  (::) : (x : a) -> (xs : Vect k a) -> Vect (S k) a

%name Vect xs, ys, zs

||| appends two vectors
append : Vect n elem -> Vect m elem -> Vect (n + m) elem
append [] ys = ys
append (x :: xs) ys = x :: append xs ys

||| Combine two vectors to a vector of pairs
zip : Vect n a -> Vect n b -> Vect n (a, b)
zip [] ys = []
zip (x :: xs) (y :: ys) = (x, y) :: zip xs ys



