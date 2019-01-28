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

xor : Bool -> Bool -> Bool
xor False y = y
xor True y = not y

isEven : Nat -> Bool
isEven Z = True
isEven (S k) = not (isEven k)

-- mutally definde functions
mutual
  isEven2 : Nat -> Bool
  isEven2 Z = True
  isEven2 (S k) = isOdd2 k

  isOdd2 : Nat -> Bool
  isOdd2 Z = False
  isOdd2 (S k) = isEven2 k


