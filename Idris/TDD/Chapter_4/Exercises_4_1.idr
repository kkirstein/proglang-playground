-- Exercises_4_1.idr
--
-- Exercises for generic types

import Tree

||| Converts given List to a binary tree
listToTree : Ord elem => List elem -> Tree elem
listToTree [] = Empty
listToTree (x :: xs) = insert x (listToTree xs)


