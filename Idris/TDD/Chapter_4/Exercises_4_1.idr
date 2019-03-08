-- Exercises_4_1.idr
--
-- Exercises for generic types

import Tree
import Shape
import Picture

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


-- Integer arithmetic
-- ==================

||| Data type for arithmetic expression(s)
data Expr = ||| Int value
            Val Int
          | ||| Arithmetic addition of two expressions
            Add Expr Expr
          | ||| Arithmetic substraction of two expressions
            Sub Expr Expr
          | ||| Arithmetic multiplication of two expressions
            Mult Expr Expr

||| Evaluates given arithmentic expression
evaluate : Expr -> Int
evaluate (Val x) = x
evaluate (Add x y) = (evaluate x) + (evaluate y)
evaluate (Sub x y) = (evaluate x) - (evaluate y)
evaluate (Mult x y) = (evaluate x) * (evaluate y)


-- Maybe comparator
-- ================
maxMaybe : Ord a => Maybe a -> Maybe a -> Maybe a
maxMaybe Nothing Nothing = Nothing
maxMaybe Nothing (Just y) = Just y
maxMaybe (Just x) Nothing = Just x
maxMaybe (Just x) (Just y) = case compare x y of
                                  LT => Just y
                                  EQ => Just x
                                  GT => Just x


-- Biggest triangle of picture
-- ===========================
biggestTriangle : Picture -> Maybe Double
biggestTriangle (Primitive triangle@(Triangle _ _)) = Just (area triangle)
biggestTriangle (Primitive _) = Nothing
biggestTriangle (Combine pic pic1) = maxMaybe (biggestTriangle pic) (biggestTriangle pic1)
biggestTriangle (Rotate x pic) = biggestTriangle pic
biggestTriangle (Translate x y pic) = biggestTriangle pic


testPic1 : Picture
testPic1 = Combine (Primitive (Triangle 2 3))
                   (Primitive (Triangle 2 4))
testPic2 : Picture
testPic2 = Combine (Primitive (Rectangle 1 3))
                   (Primitive (Circle 4))

