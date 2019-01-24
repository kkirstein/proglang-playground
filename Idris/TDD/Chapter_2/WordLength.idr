-- WordLength.idr
--

allLengths : List String -> List Nat
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words


-- demonstrate pattern matching
invert : Bool -> Bool
invert False = True
invert True = False

describeList : List Int -> String
describeList [] = "Empty"
describeList (x :: xs) = "Non-empty, tail = " ++ show xs

