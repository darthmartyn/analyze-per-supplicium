with Ada.Text_IO;
with Engines.Test_Stable;

procedure Standalone_Test_Runner is
begin

   Engines.Test_Stable;

   Ada.Text_IO.Put_Line ("All Tests Executed");

end Standalone_Test_Runner;