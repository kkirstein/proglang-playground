
package body Fibonacci is

   function Fib_Iter (N : Natural) return Big_Natural is
      A   : Big_Natural := To_Big_Integer (0);
      B   : Big_Natural := To_Big_Integer (1);
      Tmp : Big_Natural := To_Big_Integer (0);
   begin
      for I in 0 .. N - 1 loop
         Tmp := A;
         A   := B;
         B   := Tmp + B;
      end loop;
      return A;
   end Fib_Iter;

   function Fib_Naive (N : Natural) return Natural is
   begin
      if N < 2 then
         return N;
      else
         return Fib_Naive (N - 1) + Fib_Naive (N - 2);
      end if;
   end Fib_Naive;

   function Fib_Recur (N : Natural) return Big_Natural is

      function Fib_Aux
        (N : Natural; A : Big_Natural; B : Big_Natural) return Big_Natural
      is
      begin
         if N > 0 then
            return Fib_Aux (N - 1, B, A + B);
         else
            return A;
         end if;
      end Fib_Aux;
   begin
      return Fib_Aux (N, To_Big_Integer (0), To_Big_Integer (1));
   end Fib_Recur;

   function Big_Natural_Image (N : Big_Natural) return String is
   begin
      return To_String (N);
   end Big_Natural_Image;

end Fibonacci;
