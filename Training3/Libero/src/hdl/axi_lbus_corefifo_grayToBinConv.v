//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_grayToBinConv.v

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

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_grayToBinConv(
                                         gray_in,
                                         bin_out
                                        );

   // --------------------------------------------------------------------------
   // Parameter Declaration
   // --------------------------------------------------------------------------
   parameter ADDRWIDTH  = 3;
  // parameter SYNC_RESET = 0;   

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------

   //--------
   // Inputs
   //--------
   input [ADDRWIDTH:0]    gray_in;

   //---------
   // Outputs
   //---------
   output [ADDRWIDTH:0] bin_out;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg [ADDRWIDTH:0]      bin_out;   
   integer                i;
   

   // --------------------------------------------------------------------------
   //                               Start - of - Code
   // --------------------------------------------------------------------------


   // --------------------------------------------------------------------------
   // Logic to Convert the Gray code to Binary
   // --------------------------------------------------------------------------
   always @(*) begin

      bin_out[ADDRWIDTH]  = gray_in[ADDRWIDTH];      

      for(i=ADDRWIDTH;i>0;i = i-1) begin
         bin_out[i-1]     = (bin_out[i] ^ gray_in[i-1]);
      end

   end

endmodule // corefifo_grayToBinConv

// --------------------------------------------------------------------------
//                             End - of - Code
// --------------------------------------------------------------------------
