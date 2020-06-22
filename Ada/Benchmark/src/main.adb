
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Fibonacci;
with Perfect_Number;
with Primes;

procedure Main is
   package Fib renames Fibonacci;
   package Pn renames Perfect_Number;

   procedure Put_Elapsed (Tic : Time; Toc : Time := Clock) is
   begin
      Put_Line (" elapsed time: " & Duration'Image(Toc - Tic) & "s");
   end Put_Elapsed;

   -- overload Img function for string representatin of result data
   function Img (X : Natural) return String renames Natural'Image;

   function Img (X : Big_Natural) return String renames Fib.Big_Natural_Image;

   function Img (X : Pn.Pn_Vectors.Vector) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & Img (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Img;

   function Img (X : Primes.Prime_Vectors.Vector) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & Img (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Img;

   function Img (X : Primes.Big_Prime_Vectors.Vector) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & Img (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Img;


   Tic : Time;
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
   Put ("Fib_Iter (1000)  = " & Img (Fib.Fib_Iter (1000)));
   Put_Elapsed (Tic);
   Tic := Clock;
   Put ("Fib_Recur (1000) = " & Img (Fib.Fib_Recur (1000)));
   Put_Elapsed (Tic);
   New_Line;

   Put_Line ("Perfect Numbers");
   Put_Line ("---------------");
   Tic := Clock;
   Put ("Perfect_Numbers (10000) = " & Img (Pn.Get_Perfect_Numbers (10000)));
   Put_Elapsed (Tic);
   New_line;

   Put_Line ("Prime Numbers");
   Put_Line ("-------------");
   Tic := Clock;
   Put ("Get_Primes (10000): (" & Img (Primes.Get_Primes (10_000)) & ")");
   Put_Elapsed (Tic);
   Tic := Clock;
   Put ("Get_Primes (10000): (" & Img (Primes.Get_Primes (To_Big_Integer (10_000))) & ")");
   Put_Elapsed (Tic);
   New_Line;

end Main;
