-- WordLength.idr
--

import Data.Vect

-- allLengths for Vect String
total allLengths : Vect len String -> Vect len Nat
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words



