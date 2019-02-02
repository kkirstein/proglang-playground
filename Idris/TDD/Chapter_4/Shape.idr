-- Shape.idr
--
-- Demonstrate union data types

module Shape

||| Represents shapes
export
data Shape = ||| A triangle, with its base and height
             Triangle Double Double
           | ||| A rectangle, with length and height
             Rectangle Double Double
           | ||| A circle, with radius
             Circle Double

||| Calculates area of given shape
export
area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius

