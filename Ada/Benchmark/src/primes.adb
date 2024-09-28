with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Primes is

   function Is_Prime (N : Natural) return Boolean is
      Limit : constant Natural := Natural (Sqrt (Float (N)));
   begin
      if N < 2 then
         return False;
      end if;
      for I in 2 .. Limit loop
         if N mod I = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Prime;

   function Is_Prime (N : Big_Integer) return Boolean is
      Limit : constant Big_Integer := N / To_Big_Integer (2);
      I     : Big_Integer          := To_Big_Integer (2);
   begin
      if N < To_Big_Integer (2) then
         return False;
      end if;
      while I < Limit loop
         if N mod I = To_Big_Integer (0) then
            return False;
         end if;
         I := I + To_Big_Integer (1);
      end loop;
      return True;
   end Is_Prime;

   function Get_Primes (Limit : Natural) return Prime_Vectors.Vector is
      Result : Prime_Vectors.Vector;
   begin
      for I in 2 .. Limit loop
         if Is_Prime (I) then
            Result.Append (I);
         end if;
      end loop;
      return Result;
   end Get_Primes;

   function Get_Primes (Limit : Big_Integer) return Big_Prime_Vectors.Vector is
      I      : Big_Integer := To_Big_Integer (2);
      Result : Big_Prime_Vectors.Vector;
   begin
      while I < Limit loop
         null;
         I := I + To_Big_Integer (1);
         if Is_Prime (I) then
            Result.Append (I);
         end if;
      end loop;
      return Result;
   end Get_Primes;

end Primes;
