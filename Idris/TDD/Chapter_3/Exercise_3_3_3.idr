-- Matrix.idr
--
-- Matrix arithmetics with dependent types

module Matrix

import Data.Vect


-- matrix addition
addCol : Num numType => (x : Vect cols numType) -> (y : Vect cols numType) ->
                        Vect cols numType
addCol [] [] = []
addCol (x :: xs) (y :: ys) = x + y :: addCol xs ys

addMatrix : Num numType =>
            Vect rows (Vect cols numType) ->
            Vect rows (Vect cols numType) ->
            Vect rows (Vect cols numType)
addMatrix [] [] = []
addMatrix (x :: xs) (y :: ys) = addCol x y :: addMatrix xs ys


-- transpose matrix
createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeHelper : (x : Vect n elem) -> (xsTrans : Vect n (Vect len elem)) ->
                  Vect n (Vect (S len) elem)
transposeHelper x xsTrans = zipWith (::) x xsTrans

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xsTrans = transposeMat xs in
                             transposeHelper x xsTrans

-- matrix multiplication

calcStride : Num numType => (x : Vect m numType) -> (y : Vect m numType) -> numType
calcStride [] [] = 0
calcStride (x :: xs) (y :: ys) = x * y + calcStride xs ys

doLeftRow : Num numType => (x : Vect m numType) ->
                           (ys' : Vect p (Vect m numType)) ->
                           Vect p numType
doLeftRow x [] = []
doLeftRow x (y :: ys) = calcStride x y :: doLeftRow x ys

multMatrix' : Num numType => (xs : Vect n (Vect m numType)) ->
                             (ys' : Vect p (Vect m numType)) ->
                             Vect n (Vect p numType)
multMatrix' [] ys' = []
multMatrix' (x :: xs) ys' = doLeftRow x ys' :: multMatrix' xs ys'

multMatrix : Num numType =>
             Vect n (Vect m numType) ->
             Vect m (Vect p numType) ->
             Vect n (Vect p numType)
multMatrix xs ys = let ys' = transposeMat ys in
                       multMatrix' xs ys'




