
with Ada.Text_IO; use Ada.Text_IO;

with Fibonacci;

procedure Main is
   package Fib renames Fibonacci;
begin
   Put_Line("Benchmark");
   Put_Line("=========");

   Put_Line("Fibonacci Numbers");
   Put_Line("-----------------");
   Put_Line("Fib_Iter (35) = " & Natural'Image (Fib.Fib_Iter (35)));

end Main;
