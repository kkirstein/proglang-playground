with Test_Suite;
with AUnit.Run;
with AUnit.Reporter.Text;

procedure Run_Tests is
   procedure Runner is new AUnit.Run.Test_Runner (Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Run_Tests;
