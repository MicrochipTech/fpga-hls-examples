///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: signal_synchronizer.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF100T> <Package::FCG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module signal_synchronizer( clk_dst, signal_src, signal_dst );

input clk_dst;
input signal_src;
output signal_dst;

reg reg_meta;
reg reg_out;

always @(posedge clk_dst)
begin
  reg_meta <= signal_src;
  reg_out <= reg_meta;
end

assign signal_dst = reg_out;
  
endmodule

