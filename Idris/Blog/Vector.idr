-- Vector.idr
--
-- Working with vectors and length-constraint lists

import Data.Vect

aList : List Int
aList = [1, 2, 3]

addToList : List Int -> Int -> List Int
addToList [] x = []
addToList (y :: ys) x = y + x :: addToList ys x

addToListWrong : List Int -> Int -> List Int
addToListWrong [] x = [0]
addToListWrong (y :: ys) x = y + x :: addToListWrong ys x



aVect : Vect 3 Int
aVect = [1, 2, 3]

addToVect : Vect n Int -> Int -> Vect n Int
addToVect [] x = []
addToVect (y :: ys) x = y + x :: addToVect ys x


addToVectWrong : Vect n Int -> Int -> Vect n Int
addToVectWrong [] x = [0]
addToVectWrong (y :: ys) x = y + x :: addToVectWrong ys x




