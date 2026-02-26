with AUnit.Test_Suites; use AUnit.Test_Suites;
with Fibonacci_Tests;

package body Test_Suite is

   Result : aliased Test_Suite;
   Fib    : aliased Fibonacci_Tests.Test_Case;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Fib'Access);
      return Result'Access;
   end Suite;

end Test_Suite;
