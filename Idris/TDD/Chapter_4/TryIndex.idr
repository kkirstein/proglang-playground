-- tryIndex.idr
--
-- Demonstrates Fin type for indexing Vect
--

import Data.Vect

||| Returns the element at given index or Nothing if out-of-bounds
tryIndex : Integer -> Vect n a -> Maybe a
tryIndex {n} i xs = case integerToFin i n of
                         Nothing => Nothing
                         (Just idx) => Just (index idx xs)





