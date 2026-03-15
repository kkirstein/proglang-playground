with Ada.Text_IO;                           use Ada.Text_IO;
with Ada.Calendar;                          use Ada.Calendar;
with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Fibonacci;
with Perfect_Number;
with Primes;
with Aux_Image; use Aux_Image;
with Mandelbrot;
with Image_IO.Holders;

procedure Runner is
   package Fib renames Fibonacci;
   package Pn renames Perfect_Number;

   procedure Put_Elapsed (Tic : Time; Toc : Time := Clock) is
   begin
      Put_Line (" elapsed time: " & Duration'Image (Toc - Tic) & "s");
   end Put_Elapsed;

   Tic              : Time;
   Mandelbrot_Image : Image_IO.Holders.Handle;
begin
   Put_Line ("Benchmark");
   Put_Line ("=========");
   New_Line;

   Put_Line ("Fibonacci Numbers");
   Put_Line ("-----------------");
   Tic := Clock;
   Put ("Fib_Naive (35)   = " & Img (Fib.Fib_Naive (35)));
   Put_Elapsed (Tic);
   Tic := Clock;
   Put ("Fib_Iter (1000)  = " & Img (Fib.Fib_Iter (1_000)));
   Put_Elapsed (Tic);
   Tic := Clock;
   Put ("Fib_Recur (1000) = " & Img (Fib.Fib_Recur (1_000)));
   Put_Elapsed (Tic);
   New_Line;

   Put_Line ("Perfect Numbers");
   Put_Line ("---------------");
   Tic := Clock;
   Put ("Perfect_Numbers (10000) = " & Img (Pn.Get_Perfect_Numbers (10_000)));
   Put_Elapsed (Tic);
   New_Line;

   Put_Line ("Prime Numbers");
   Put_Line ("-------------");
   Tic := Clock;
   Put
     ("Get_Primes (10_000): ("
      & Img (Primes.Get_Primes (Integer (10_000)))
      & ")");
   Put_Elapsed (Tic);
   Tic := Clock;
   Put
     ("Get_Primes (1_000_000): ("
      & Img (Primes.Get_Primes (Integer (1_000_000)))
      & ")");
   Put_Elapsed (Tic);
   Tic := Clock;
   Put
     ("Get_Primes (10_000): ("
      & Img (Primes.Get_Primes (To_Big_Integer (10_000)))
      & ")");
   Put_Elapsed (Tic);
   New_Line;

   Put_Line ("Mandelbrot Set");
   Put_Line ("--------------");
   Tic := Clock;
   Mandelbrot.Generate_Image (1920, 1200, -0.5, 0.0, 4.0 / 1920.0, Mandelbrot_Image);
   Put ("Generate_Image (1920, 1200, -0.5, 0.0, 4.0 / 1920.0): ");
   Put_Elapsed (Tic);

   Tic := Clock;
   Mandelbrot.Write_Image (Mandelbrot_Image, "mandelbrot.png");
   Put ("Write_Image (mandelbrot.png): ");
   Put_Elapsed (Tic);

   New_Line;

end Runner;
