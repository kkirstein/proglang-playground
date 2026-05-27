package body Heron_Estimation is

   function Estimate_Sqrt
     (N : Big_Integer; Eps : Big_Integer) return Big_Integer
   is
      X0 : Big_Integer := N / 2;
      X1 : Big_Integer := (X0 + N / X0) / 2;
   begin
      while abs (X1 - X0) > Eps loop
         X0 := X1;
         X1 := (X0 + N / X0) / 2;
      end loop;
      return X1;
   end Estimate_Sqrt;

end Heron_Estimation;
