with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Perfect_Number; use Perfect_Number;
with Primes; use Primes;

package body Aux_Image is

   function Img (X : Pn_Vectors.Vector) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & Img (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Img;

   function Img (X : Prime_Vectors.Vector) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & Img (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Img;

   function Img (X : Big_Prime_Vectors.Vector) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & Img (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Img;
   

end Aux_Image;
