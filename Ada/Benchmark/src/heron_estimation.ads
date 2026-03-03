with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

package Heron_Estimation is

   --function Estimate_Sqrt (N : Float; Eps: Float) return Float;
   function Estimate_Sqrt (N : Big_Integer; Eps : Big_Integer) return Big_Integer;
   --function Estimate_Sqrt (N : Big_Natural; Eps : Float) return Big_Natural;

end Heron_Estimation;
