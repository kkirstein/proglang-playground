with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

package Primes is

   function Is_Prime (N : Natural) return Boolean;
   function Is_Prime (N : Big_Natural) return Boolean;

end Primes;
