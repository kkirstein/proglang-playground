-- Picture.idr
--
-- Demonstraters recursive data types

import Shape

||| Represents a picture with multiple shapes
data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double

-- a test picture
testPicture : Picture

