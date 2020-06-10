with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

package body Fibonacci is

   function Fib_Iter(N : Natural) return Natural is
      A   : Natural := 0;
      B   : Natural := 1;
      Tmp : Natural := 0;
   begin
      for I in 0..N-1 loop
         Tmp := A;
         A   := B;
         B   := Tmp + B;
      end loop;
      return A;
   end Fib_Iter;

   function Fib_Iter_Big_Int(N : Natural) return Big_Natural is
      A   : Big_Natural := 0;
      B   : Big_Natural := 1;
      Tmp : Big_Natural := 0;
   begin
      for I in 0..N-1 loop
         Tmp := A;
         A   := B;
         B   := Tmp + B;
      end loop;
      return A;
   end Fib_Iter_Big_Int;

   function Fib_Naive (N : Natural) return Natural is
   begin
      if N < 2 then return N;
      else return Fib_Naive (N - 1) + Fib_Naive (N - 2);
      end if;
   end Fib_Naive;

   function Fib_Recur (N : Natural) return Big_Natural is
      -- TODO: local defs

   begin
      return 0;
   end Fib_Recur;

end Fibonacci;
