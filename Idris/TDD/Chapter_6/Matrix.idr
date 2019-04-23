-- Matrix.idr
--
-- Matrix arithmetics with dependent types

module Matrix

import Data.Vect

||| A type alias for nested Vect
||| @ n number of rows
||| @ m number of columns
Matrix : (n : Nat) -> (m : Nat) -> Type -> Type
Matrix n m elem = Vect n (Vect m elem)

testMatrix : Matrix 2 3 Int
testMatrix = [[0, 0, 0], [0, 0, 0]]

-- matrix addition
addMatrix : Num numType =>
            Vect rows (Vect cols numType) ->
            Vect rows (Vect cols numType) ->
            Vect rows (Vect cols numType)

-- matrix multiplication
multMatrix : Num numType =>
             Vect n (Vect m numType) ->
             Vect m (Vect p numType) ->
             Vect n (Vect p numType)

-- transpose matrix
createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeHelper : (x : Vect n elem) -> (xsTrans : Vect n (Vect len elem)) ->
                  Vect n (Vect (S len) elem)
transposeHelper [] [] = []
transposeHelper (x :: xs) (y :: ys) = (x :: y) :: transposeHelper xs ys

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xsTrans = transposeMat xs in
                             transposeHelper x xsTrans


