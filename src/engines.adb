------------------------------------------------------------------------------
--                                                                          --
--                              Couverture                                  --
--                                                                          --
--                      Copyright (C) 2008-2022, AdaCore                    --
--                                                                          --
-- Couverture is free software; you can redistribute it  and/or modify it   --
-- under terms of the GNU General Public License as published by the Free   --
-- Software Foundation; either version 2, or (at your option) any later     --
-- version.  Couverture is distributed in the hope that it will be useful,  --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHAN-  --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License  for more details. You  should  have  received a copy of the GNU --
-- General Public License  distributed with GNAT; see file COPYING. If not, --
-- write  to  the Free  Software  Foundation,  59 Temple Place - Suite 330, --
-- Boston, MA 02111-1307, USA.                                              --
--                                                                          --
------------------------------------------------------------------------------

package body Engines is

   ------------
   -- Stable --
   ------------

   function Stable (E : Engine) return Boolean is
   begin
      return E.P < Stable_Engine_Data.P and then E.T < Stable_Engine_Data.T;
   end Stable;

-- Uncomment the next 2 lines to cause havoc
--begin
--Stable_Engine_Data := null;

end Engines;