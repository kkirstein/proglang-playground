-- Exercises_4_1.idr
--
-- Exercises for generic types

import Tree

||| Converts given List to a binary Tree
listToTree : Ord elem => List elem -> Tree elem
listToTree [] = Empty
listToTree (x :: xs) = insert x (listToTree xs)


||| Converts given Tree to an ordered List
treeToList : Tree a -> List a
treeToList Empty = []
treeToList (Node left x right) = let leftList = treeToList left
                                     rightList = treeToList right in
                                     leftList ++ [x] ++ rightList



