
package body Perfect_Number is

   function Is_Perfect (N : Natural) return Boolean is
      Sum : Natural := 0;
   begin
      for I in 1 .. N - 1 loop
         if N mod I = 0 then
            Sum := Sum + I;
         end if;
      end loop;
      if Sum = N then
         return True;
      else
         return False;
      end if;
   end Is_Perfect;

   function Get_Perfect_Numbers (Limit : Natural) return Pn_Vectors.Vector is
      Result : Pn_Vectors.Vector;
   begin
      for I in 2 .. Limit loop
         if Is_Perfect (I) then
            Result.Append (I);
         end if;
      end loop;
      return Result;
   end Get_Perfect_Numbers;

end Perfect_Number;
