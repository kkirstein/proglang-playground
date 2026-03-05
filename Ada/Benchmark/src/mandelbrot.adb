package body Mandelbrot is

   function Pixel_Value (Z : Complex) return Image_IO.RGB_Value is
      C : constant Complex := Z;
      I : Image_IO.RGB_Value := 0;

   begin
      -- TODO: Implementation for calculating pixel value
      return I;
   end Pixel_Value;

   function To_RGB (I : Image_IO.RGB_Value) return Image_IO.Color_Info is
      R : Image_IO.RGB_Value := Image_IO.RGB_Value ((Integer (I) mod 15) * 15);
      G : Image_IO.RGB_Value := Image_IO.RGB_Value ((Integer (I) mod 7) * 32);
      B : Image_IO.RGB_Value := Image_IO.RGB_Value ((Integer (I) mod 31) * 8);
   begin
      return (Red => R, Green => G, Blue => B);
   end To_RGB;

   procedure Generate_Image
     (Width, Height      : Natural;
      Center_X, Center_Y : Float;
      Pixel_size         : Float;
      Img                : out Image_IO.Holders.Handle) is
   begin
      for Y in 1 .. Height loop
         for X in 1 .. Width loop
            declare
               -- TODO: CHeck Calculation of complex coordinates
               Z : Complex :=
                 (Center_X + (Float (X) - Float (Width) / 2.0) * Pixel_size,
                  Center_Y + (Float (Y) - Float (Height) / 2.0) * Pixel_size);
            begin
               -- Image (X, Y) := To_RGB (Pixel_Value (Z));
               null;
            end;
         end loop;
      end loop;
   end Generate_Image;

end Mandelbrot;
