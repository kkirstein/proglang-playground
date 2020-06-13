with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

package Fibonacci is

   function Fib_Iter (N : Natural) return Big_Natural;
   function Fib_Naive (N : Natural) return Natural;
   function Fib_Recur (N : Natural) return Big_Natural;

   function Big_Natural_Image (N : Big_Natural) return String;
end Fibonacci;
