-- vim: ft=idris sw= ts=2 et

import Data.Vect

-- vector arithmetics
add : Vect n a -> Vect m a -> Vect (n + m) a
add Nil ys = ys
add (x :: xs) ys = x :: add xs ys

