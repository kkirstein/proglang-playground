with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

package body Fibonacci is

   function Fib_Iter (N : Natural) return Big_Natural is
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
   end Fib_Iter;


   function Fib_Naive (N : Natural) return Natural is
   begin
      if N < 2 then return N;
      else return Fib_Naive (N - 1) + Fib_Naive (N - 2);
      end if;
   end Fib_Naive;


   function Fib_Recur (N : Natural) return Big_Natural is

      function Fib_Aux (N : Natural; A : Big_Natural; B : Big_Natural)
                        return Big_Natural is
      begin
         if N > 0 then return Fib_Aux(N - 1, B, A + B);
         else return A;
         end if;
      end Fib_Aux;
   begin
      return Fib_Aux (N, 0, 1);
   end Fib_Recur;

end Fibonacci;
