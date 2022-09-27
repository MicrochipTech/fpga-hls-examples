///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: counter.v
// File history:
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Generic counter with enable and reset
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module counter( clk, reset_n, enable, counter_out );

parameter bitwidth = 6;

input clk;
input reset_n;
input enable;

output reg [bitwidth-1:0] counter_out;

always @(posedge clk or negedge reset_n)
begin
  if (!reset_n) counter_out <= 0;
  else 
  if (enable) counter_out <= counter_out + 1;
end

endmodule

