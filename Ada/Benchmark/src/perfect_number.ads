with Ada.Containers.Vectors;

package Perfect_Number is

   function Is_Perfect (N : Natural) return Boolean;
   
   package Pn_Vectors is new Ada.Containers.Vectors (
                                                     Index_Type => Natural,
                                                     Element_Type => Natural);
                                                     
   
   function Get_Perfect_Numbers (Limit : Natural) return Pn_Vectors.Vector;

end Perfect_Number;
