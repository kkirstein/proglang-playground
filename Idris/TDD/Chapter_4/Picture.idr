-- Picture.idr
--
-- Demonstraters recursive data types

import Shape

||| Represents a picture with multiple shapes
data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture

-- a test picture

rectangle : Picture
rectangle = Primitive (Rectangle 20 10)

circle : Picture

triangle : Picture

testPicture : Picture
testPicture = Combine (Translate 5 5 rectangle)
              (Combine (Translate 35 5 circle)
              (Translate 15 25 triangle))

