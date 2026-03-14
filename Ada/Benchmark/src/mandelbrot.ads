with Ada.Numerics.Complex_Types; use Ada.Numerics.Complex_Types;
with Image_IO.Holders;

package Mandelbrot is

   -- Generate Mandelbrot set image
   procedure Generate_Image
     (Width, Height      : Natural;
      Center_X, Center_Y : Float;
      Pixel_size         : Float;
      Img                : out Image_IO.Holders.Handle);

   -- Write Image to file
   procedure Write_Image (Img : in Image_IO.Holders.Handle; Filename : String);

private

   -- Calculate pixel value for (complex) coordinates
   function Pixel_Value (Z : Complex) return Image_IO.RGB_Value;

   -- Convert pixel value to RGB
   function To_RGB (I : Image_IO.RGB_Value) return Image_IO.Color_Info;

end Mandelbrot;
