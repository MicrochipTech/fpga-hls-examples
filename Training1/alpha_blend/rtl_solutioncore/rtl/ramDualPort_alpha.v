/*****************************************************************************************************************************
--
--    File Name    : ramDualPort_alpha.v

--    Description  : This module implements dual port ram .
--                   

-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team

-- SVN Revision Information:
-- SVN $Revision: TBD
-- SVN $Date: TBD
--
--
--
-- COPYRIGHT 2016 BY MICROSEMI 
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
-- FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
-- MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
-- NO BACK-UP OF THE FILE SHOULD BE MADE. 
-- 

--******************************************************************************************************************************/

module ramDualPort_alpha #(parameter DATA_WIDTH = 10,
                           parameter ADDRESS_WIDTH = 64)
                         (input clk,
                          input we_a,
                          input[ADDRESS_WIDTH - 1 : 0] addr_a, addr_b,
                          input[DATA_WIDTH - 1 : 0] data_a,
                          output wire[DATA_WIDTH - 1 : 0] q_b);
  reg[ADDRESS_WIDTH - 1 : 0] Iil;
  reg[DATA_WIDTH - 1 : 0] lil[2 ** ADDRESS_WIDTH - 1 : 0]/* synthesis syn_ramstyle="lsram" */;
  always
    @(posedge clk)
    begin
      if (we_a)
        begin
          lil[addr_a] <= data_a;
        end
    end
  always
    @(posedge clk)
    begin
      Iil <= addr_b;
    end
  assign q_b = lil[Iil];
endmodule
