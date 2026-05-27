with AUnit.Assertions; use AUnit.Assertions;

with Fibonacci;

package body Fibonacci_Tests is

   procedure Register_Tests (T : in out Test_Case) is
   begin
      T.Register_Test ("Test_Fibonacci_0", Test_Fibonacci_0'Access);
      T.Register_Test ("Test_Fibonacci_1", Test_Fibonacci_1'Access);
      T.Register_Test ("Test_Fibonacci_5", Test_Fibonacci_5'Access);
      T.Register_Test ("Test_Fibonacci_10", Test_Fibonacci_10'Access);
   end Register_Tests;

   function Name (T : Test_Case) return AUnit.Message.String is
   begin
      return "Fibonacci Tests";
   end Name;

   procedure Test_Fibonacci_0 is
   begin
      Assert_Equals (Fibonacci.Fib (0), 0, "Fib(0) should be 0");
   end Test_Fibonacci_0;

   procedure Test_Fibonacci_1 is
   begin
      Assert_Equals (Fibonacci.Fib (1), 1, "Fib(1) should be 1");
   end Test_Fibonacci_1;

   procedure Test_Fibonacci_5 is
   begin
      Assert_Equals (Fibonacci.Fib (5), 5, "Fib(5) should be 5");
   end Test_Fibonacci_5;

   procedure Test_Fibonacci_10 is
   begin
      Assert_Equals (Fibonacci.Fib (10), 55, "Fib(10) should be 55");
   end Test_Fibonacci_10;

end Fibonacci_Tests;
