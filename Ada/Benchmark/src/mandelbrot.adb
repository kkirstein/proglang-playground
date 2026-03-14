with Image_IO.Operations;

package body Mandelbrot is

   R_MAX : constant Float := 2.0;
   N_MAX : constant Natural := 255;

   function Pixel_Value (Z : Complex) return Image_IO.RGB_Value is
      C  : constant Complex := Z;
      I  : Image_IO.RGB_Value := Image_IO.RGB_Value (N_MAX);
      ZI : Complex := Z;

      use type Image_IO.RGB_Value;

      -- Rust version of the Mandelbrot calculation for reference:
      -- fn pixel_value(x: f64, y: f64) -> u8 {
      --     let z0 = Complex::new(x, y);
      --     let mut z = Complex::new(x, y);
      --     let mut n = N_MAX;
      --
      --     while z.norm() <= R_MAX && n > 0 {
      --         z = z * z + z0;
      --         n -= 1;
      --     }
      --
      --     // return final "index"
      --     n
      -- }

   begin
      -- TODO: Implementation for calculating pixel value
      while I > 0 and abs (ZI) <= R_MAX loop
         ZI := ZI * ZI + C;
         I := I - 1;
      end loop;
      return I;
   end Pixel_Value;

   function To_RGB (I : Image_IO.RGB_Value) return Image_IO.Color_Info is
      R : constant Image_IO.RGB_Value :=
        Image_IO.RGB_Value ((Integer (I) mod 15) * 15);
      G : constant Image_IO.RGB_Value :=
        Image_IO.RGB_Value ((Integer (I) mod 7) * 32);
      B : constant Image_IO.RGB_Value :=
        Image_IO.RGB_Value ((Integer (I) mod 31) * 8);
   begin
      return (Red => R, Green => G, Blue => B);
   end To_RGB;

   procedure Generate_Image
     (Width, Height      : Natural;
      Center_X, Center_Y : Float;
      Pixel_size         : Float;
      Img                : out Image_IO.Holders.Handle)
   is
      procedure Process_Pixel (Data : in out Image_IO.Image_Data) is
      begin
         Rows : for R in Data'Range (1) loop
            Columns : for C in Data'Range (2) loop
               declare
                  Z : constant Complex :=
                    (Center_X + (Float (C) - Float (Width) / 2.0) * Pixel_size,
                     Center_Y
                     + (Float (R) - Float (Height) / 2.0) * Pixel_size);
               begin
                  Data (R, C) := To_RGB (Pixel_Value (Z));
                  null;
               end;
            end loop Columns;
         end loop Rows;
      end Process_Pixel;
   begin
      Img.Create (Width, Height);
      Img.Update (Process_Pixel'Access);
   end Generate_Image;

   procedure Write_Image (Img : Image_IO.Holders.Handle; Filename : String) is
   begin
      Image_IO.Operations.Write_PNG (Filename, Img.Value, False);
   end Write_Image;

end Mandelbrot;
