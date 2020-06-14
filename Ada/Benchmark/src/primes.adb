with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

package body Primes is

   function Is_Prime (N : Natural) return Boolean is
      Limit : constant Natural := Natural (Sqrt (Float (N)));
   begin
      if N < 2 then return False; end if;
      for I in 2 .. Limit loop
         if N mod I = 0 then return False; end if;
      end loop;
      return True;
   end Is_Prime;
   
   
   function Is_Prime (N : Big_Natural) return Boolean is
      Limit : constant Big_Natural := N / 2;
      I     : Big_Natural := To_Big_Integer (2);
   begin
      if N < 2 then return False; end if;
      while I < Limit loop
         if N mod I = 0 then return False; end if;
         I := I + 1;
      end loop;
      return True;
   end Is_Prime;

end Primes;
