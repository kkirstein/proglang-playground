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

end Fibonacci;
