with Ada.Assertions; use Ada.Assertions;

procedure Engines.Test_Stable is

   type Engine_Sample_Data_Ptr is access all Engines.Engine;

   type Engine_Data_Samples_Type is array (1..3) of Engine_Sample_Data_Ptr;

   Engine_Data_Samples : constant Engine_Data_Samples_Type :=
     (1 => new Engines.Engine'(P => 9, T => 49),   -- True && True will be True
      2 => new Engines.Engine'(P => 9, T => 50),   -- True && False will be False
      3 => new Engines.Engine'(P => 10, T => 49)); -- False && True will be False

begin
  
   for Engine_Data_Sample in Engine_Data_Samples'Range loop

      case Engine_Data_Sample is

         when 1 =>

            declare
               Actual_Result : constant Boolean :=
                  Stable (Engine_Data_Samples (Engine_Data_Sample).all);
               Expected_Result : constant Boolean := True;
               Passed : constant Boolean := Actual_Result = Expected_Result;
            begin
               Assert (Passed,"actual result /= expected result");
            end;

         when 2 =>

            declare
               Actual_Result : constant Boolean :=
                  Stable (Engine_Data_Samples (Engine_Data_Sample).all);
               Expected_Result : constant Boolean := False;
               Passed : constant Boolean := Actual_Result = Expected_Result;
            begin
               Assert (Passed,"actual result /= expected result");
            end;

         when 3 =>

            -- to fail MC/DC, uncomment the following line
            --exit;
            
            declare
               Actual_Result : constant Boolean :=
                  Stable (Engine_Data_Samples (Engine_Data_Sample).all);
               Expected_Result : constant Boolean := False;
               Passed : constant Boolean := Actual_Result = Expected_Result;
            begin
               Assert (Passed,"actual result /= expected result");
            end;

      end case;

   end loop;

end Engines.Test_Stable;