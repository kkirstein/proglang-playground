with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Containers.Vectors;

package Primes is

   function Is_Prime (N : Natural) return Boolean;
   function Is_Prime (N : Big_Integer) return Boolean;

   package Prime_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Natural);
   package Big_Prime_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Big_Integer);

   function Get_Primes (Limit : Natural) return Prime_Vectors.Vector;
   function Get_Primes (Limit : Big_Integer) return Big_Prime_Vectors.Vector;

end Primes;
