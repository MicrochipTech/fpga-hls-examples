///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: delay_chain.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Configurable Delay Chaine
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module delay_chain( clk, reset_n, enable, data, reset_state, q );
parameter BITWIDTH = 4;
parameter DELAY = 5;

input clk;
input reset_n;
input enable;

input [BITWIDTH-1:0] data;
input [BITWIDTH-1:0] reset_state;
output [BITWIDTH-1:0] q;

reg [DELAY:0][BITWIDTH-1:0]shiftreg;


always @(posedge clk, negedge reset_n)
    if (!reset_n)
		shiftreg <= {(DELAY+1){reset_state}};

    else if (enable) shiftreg <= {shiftreg[DELAY-1:0], data};
    else shiftreg <= shiftreg;
   
assign q = shiftreg[DELAY];

endmodule

