-- Mandelbrot.hs
-- Caluclate Mandelbrot set in Haskell
--
-- vim: ft=haskell sw=2 ts=2 et
--

module Mandelbrot
  ( Pixel
  , mandelbrot ) where

import Data.Complex

-- Basic type defs
type Pixel = (Int, Int, Int)

-- Calculate pixel value
pixelValue :: (Integral a) => Double -> Double -> a -> a
pixelValue x y nMax =
  let z0 = x :+ y
      z = 0.0 :+ 0.0 in
    loop z z0 nMax
  where
    loop :: (Integral a) => Complex Double -> Complex Double -> a -> a
    loop z z0 nMax =
      nMax
    

valueToColor :: (Integral a) => a -> Pixel
valueToColor val =
  (0, 0, 0)


mandelbrot :: (Integral a, Floating b) => a -> a -> b -> b -> b -> [Pixel]
mandelbrot xMax yMax xCenter yCenter pixelSize =
  [(0, 0, 0)]

