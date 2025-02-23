pragma Ada_2012;
with Ada.Assertions;

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

            Ada.Assertions.Assert
               (Stable (Engine_Data_Samples (Engine_Data_Sample).all) = True,
                "Unexpected unstable Engine - sample " & Engine_Data_Sample'Img);

         when 2 =>

            Ada.Assertions.Assert
               (Stable (Engine_Data_Samples (Engine_Data_Sample).all) = False,
                "Unexpected unstable Engine - sample " & Engine_Data_Sample'Img);
                
         when 3 =>

            -- to fail MC/DC, uncomment the following line
            --exit;

            Ada.Assertions.Assert
               (Stable (Engine_Data_Samples (Engine_Data_Sample).all) = False,
                "Unexpected unstable Engine " & Engine_Data_Sample'Img);

      end case;

   end loop;   

end Engines.Test_Stable;