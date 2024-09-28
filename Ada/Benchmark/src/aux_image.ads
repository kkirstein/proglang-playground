with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Fibonacci;      use Fibonacci;
with Perfect_Number; use Perfect_Number;
with Primes;         use Primes;

package Aux_Image is

   function Img (X : Natural) return String renames Natural'Image;

   function Img (X : Big_Natural) return String renames Big_Natural_Image;

   function Img (X : Pn_Vectors.Vector) return String;

   function Img (X : Prime_Vectors.Vector) return String;

   function Img (X : Big_Prime_Vectors.Vector) return String;

private
   --  generic
   --     type T is private;
   --  --type I is (<>);
   --  --type A is array (I) of T;
   --  --with function To_String (X : E) return String;
   --  function Generic_Image (X : T) return String;

end Aux_Image;
