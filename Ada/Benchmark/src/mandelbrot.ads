
package Mandelbrot is

-- color value range
subtype Intensity is Integer range 0..255;

-- RGB pixel values
type Pixel is record
R: Intensity;
G: Intensity;
B: Intensity;
end record;

-- Calculate pixel value for (complex) coordinates
function Pixel_Value (Z: Complex) return Intensity;

-- Convert pixel value to RGB
function To_RGB (I: Intensity) return Pixel;

end Mandelbrot;
