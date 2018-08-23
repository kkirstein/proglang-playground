-- vim: ft=idris sw=2 ts=2 et

-- exercise of day1

-- find all numbers in a list that are greater than a given one
greater : Ord a => a -> List a -> List a
greater n ls = filter (\x => x > n) ls

-- find every other list element, starting from first element
everyOther : List a -> List a
everyOther [] = []
everyOther (x1 :: []) = [x1]
everyOther (x1 :: x2 :: xs) = x1 :: everyOther xs

-- playcard data type
data Color = Kreuz | Pik | Herz | Karo
data Value = Sieben | Acht | Neun | Zehn | Bube | Dame | Koenig | Ass
data Card = Pair Color Value
data Deck = List Card

-- even & odd numbers
mutual
  data Even = Two | EvenSucc Odd
  data Odd = One | OddSucc Even

-- binary tree
data BTree a =
  Node (BTree a) (BTree a) | Leaf

-- reverse a list
rev : List a -> List a
rev l = rev' l [] where
  rev' : List a -> List a -> List a
  rev' [] b = b
  rev' (a :: as) b = rev' as (a :: b)

