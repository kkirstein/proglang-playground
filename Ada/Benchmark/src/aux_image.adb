with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Perfect_Number; use Perfect_Number;
with Primes; use Primes;

package body Aux_Image is

   function Generic_Image (X : T) return String is
      Res : Unbounded_String := Null_Unbounded_String;
   begin
      Res := Res & "[";
      for E of X loop
         Res := Res & To_String (E) & ",";
      end loop;
      Res := Res & "]";
      return To_String (Res);
   end Generic_Image;
      

   --function Img is new Generic_Image (T => Pn_Vectors.Element_Type,
   --                                   I => Pn_Vectors.Index_Type,
   --                                   A => Pn_Vectors.Vector,
   --                                   To_String => Integer'Image);
                                                                            
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
