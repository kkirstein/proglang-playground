with AUnit;
with AUnit.Test_Cases;

package Fibonacci_Tests is
   type Test_Case is new AUnit.Test_Cases.Test_Case with null record;

   overriding
   procedure Register_Tests (T : in out Test_Case);
   overriding
   function Name (T : Test_Case) return AUnit.Message.String;

   -- Optional fixture hooks:
   overriding
   procedure Set_Up (T : in out Test_Case);
   overriding
   procedure Tear_Down (T : in out Test_Case);

end Fibonacci_Tests;
