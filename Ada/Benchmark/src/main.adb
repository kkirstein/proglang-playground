
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Fibonacci;

procedure Main is
   package Fib renames Fibonacci;

   procedure Put_Elapsed (Tic : Time; Toc : Time := Clock) is
      begin
      Put_Line (" elapsed time: " & Duration'Image(Toc - Tic) & "s");
   end Put_Elapsed;

   Tic : Time;
begin
   Put_Line ("Benchmark");
   Put_Line ("=========");

   Put_Line ("Fibonacci Numbers");
   Put_Line ("-----------------");
   Tic := Clock;
   Put ("Fib_Naive (35)        = " & Natural'Image (Fib.Fib_Naive (35)));
   Put_Elapsed (Tic);
   Tic := Clock;
   Put ("Fib_Iter (35)         = " & Natural'Image (Fib.Fib_Iter (35)));
   Put_Elapsed (Tic);
   Tic := Clock;
   Put ("Fib_Iter_Big_Int (35) = " & To_String (Fib.Fib_Iter_Big_Int (35)));
   Put_Elapsed (Tic);

end Main;
