//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_resetSync.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//--=================================================================================================

`timescale 1ns / 100ps

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_resetSync(
                  clk,
                  reset,
                  
                  reset_out
                  );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
 parameter NUM_STAGES = 2;
 

input clk;
input reset;
output  reset_out;
reg  [NUM_STAGES-1:0] shift_reg ;

always @( posedge clk or negedge reset) begin
if (!reset)
  shift_reg <= 'h0;
else
  shift_reg <= {shift_reg[NUM_STAGES-2:0], 1'b1};
end
  

assign reset_out = shift_reg[NUM_STAGES-1];



 endmodule
   
   // --------------------------------------------------------------------------
   //                             End - of - Code
   // --------------------------------------------------------------------------
