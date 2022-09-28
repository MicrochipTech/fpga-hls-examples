//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_NstagesSync.v

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

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_NstagesSync(
                  clk,
                  rstn,
                  inp,
                  sync_out
                  );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
  parameter NUM_STAGES = 2;
  parameter ADDRWIDTH = 3;

input clk;
input rstn;
input [ADDRWIDTH : 0 ] inp;
output [ADDRWIDTH : 0 ] sync_out;

//reg [WIDTH -1:0] signal_out;

 reg [ADDRWIDTH : 0 ] shift_reg [NUM_STAGES-1:0] ;

integer i;
always @ ( posedge clk or negedge rstn) 
  begin	
    if (!rstn) 
      begin
        for(i = NUM_STAGES-1; i >= 0 ; i = i-1) 
          begin
		    shift_reg[i] <= 'h0;
          end
      end
 /// signal_out <= 'h0;
  else
    begin

	  for(i = NUM_STAGES-1; i > 0; i = i-1) 
		shift_reg[i] <= shift_reg[i-1];

	shift_reg[0] <= inp;
//end
    //signal_out <= shift_reg[NUM_STAGES-1];
    end
end 

assign sync_out = shift_reg[NUM_STAGES-1];


   
   
endmodule // corefifo_doubleSync

   // --------------------------------------------------------------------------
   //                             End - of - Code
   // --------------------------------------------------------------------------
