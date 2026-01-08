//////////////////////////////////////////////////////////////////////
// Created by Microsemi SmartDesign Tue Oct  6 18:13:47 2020
// Testbench Template
// This is a basic testbench that instantiates your design with basic
// clock and reset pins connected.  If your design has special
// clock/reset or testbench driver requirements then you should
// copy this file and modify it.
//////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: WideMultTopPf_Tb.v
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

`timescale 1ns/100ps


module shiftdelay
    #(parameter STAGES = 4, WIDTH = 64) (
     resetn, clock, sigin, sigout );
input resetn;
input clock;
input  [WIDTH-1:0]  sigin;
output [WIDTH-1:0]  sigout;

reg [WIDTH-1 :0] sr[STAGES-1 :0];


always @ (negedge resetn or posedge clock) begin
    if (!resetn) begin
        sr[0] <= '0;
    end
    else begin
        sr[0] <= sigin;
    end
end

genvar i;
generate
for (i=1; i<=STAGES-1; i=i+1) begin
always @ (negedge resetn or posedge clock) begin
    if (!resetn) begin
        sr[i] <= '0;
    end
    else begin
        sr[i] <= sr[i-1];
    end
    end
end
endgenerate

assign sigout = sr[STAGES-1];

endmodule

// WIDE_MULT_LATENCY is assumed to be >= 2
`ifndef WIDE_MULT_LATENCY
    `define WIDE_MULT_LATENCY  7
`endif

module WideMultTopPf_Tb;

parameter SYSCLK_PERIOD = 6.4;// 156.25MHZ

reg SYSCLK;
reg NSYSRESET;
reg signed [127:0]astim[47]= '{128'b010, 128'b011, 128'b100, 128'b101, 128'd10, 128'd100, 128'd33, 128'd1024, 128'd100000,
                               128'd1000000, 128'b011, 128'd1000000000, 128'd999999999999,128'h0100000000000000000000000000000,
                               128'd5000000000, 128'd123456789, 128'd7777, 128'd9876543210, 128'd9876543210, 128'd9876543210, 128'd9876543210,
                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
                               128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,
                               128'd9876543210, 128'd9876543210};

reg signed [63:0] bstim[47] = '{64'b010, 64'b011, 64'b100, 64'b101,64'd20,64'd200,64'd555,64'd2048,64'd555555, 64'd5555555, 64'b011, 
                                64'd1000000000,64'd999999999999,64'h0100000000000000,64'd5000000000, 64'd123456789, 
                                64'd8888,64'd9876543210,64'd9876543210, 64'd9876543210,64'd9876543210, 64'd9876543210,64'd9876543210,
                                64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,
                                64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,
                                64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,64'd9876543210,
                                64'd9876543210,64'd9876543210,64'd9876543210};

reg signed [63:0]cstim[47] = '{64'b010, 64'b011, 64'b100, 64'b101,64'd30,64'd300,64'd11,64'd4096, 64'd1444000,64'd14440000,
                                64'b011, 64'd1000000000,64'd999999999999, 64'h0100000000000000, 64'd5000000000, 64'd123456789,
                                64'd9999, 64'd9876543210, 64'hb4, 64'h1, 64'h8000000000000000,64'h8000000000000000,64'h8000000000000000,
                                64'h9000000000000000, 64'hA000000000000000,64'hB000000000000000, 64'hC000000000000000, 64'hD000000000000000,
                                64'hE000000000000000,64'hF000000000000000,64'h0000000000000001,64'h7FFFFFFFFFFFFFFF,64'h100000000000000,
                                64'h200000000000000, 64'h300000000000000,64'h400000000000000,64'h500000000000000, 64'h600000000000000,
                                64'h700000000000000, 64'h1123456780000000,64'h2123456780000000,64'h3123456780000000, 64'h4123456780000000,
                                64'h5123456780000000,64'h6123456780000000,64'h7123456780000000,64'hFFFFFFFFFFFFFFFE };

reg signed [127:0] dstim[47] = '{128'b010, 128'b011, 128'b100, 128'b101,128'd40,128'd400,128'd1248,128'd8182,128'd10, 128'd100, 128'b011,
                                128'd1000000000,128'd999999999999,128'h0100000000000000,128'd5000000000, 128'd123456789, 
                                128'd8888,128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210, 128'd9876543210,128'd9876543210,
                                128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,
                                128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,
                                128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,128'd9876543210,
                                128'd9876543210,128'd9876543210,128'd9876543210};


reg signed [127:0] estim[47] = '{128'b010, 128'b011,128'b100,128'b101,128'd50,128'd500,128'd4096,128'd16384,128'd100000888,128'd1000008888,
                                 128'b011,128'd1000000000,128'd999999999999,128'h0100000000000000000000000000000,128'd5000000000,128'd123456789,
                                 128'd7777,128'd9876543210,128'h8000000000000000,128'h80000000000000008000000000000000,128'h00000000000000000000000000000001,
                                 128'h80000000000000000000000000000000,128'h80000000000000000000000000000000,128'h90000000000000000000000000000000,
                                 128'hA0000000000000000000000000000000,128'hB0000000000000000000000000000000,128'hC0000000000000000000000000000000,
                                 128'hD0000000000000000000000000000000,128'hE0000000000000000000000000000000, 128'hF0000000000000000000000000000000,
                                 128'h80000000000000000000000000000000, 128'h7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,128'h1123456789ABCDEF0000000000000000,
                                 128'h2123456789ABCDEF0000000000000000,128'h3123456789ABCDEF0000000000000000,128'h4123456789ABCDEF0000000000000000,
                                 128'h5123456789ABCDEF0000000000000000,128'h6123456789ABCDEF0000000000000000,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,
                                 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,
                                 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE, 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE,
                                 128'h7123456789ABCDEFFFFFFFFFFFFFFFFE ,128'h7123456789ABCDEFFFFFFFFFFFFFFFFE};
reg         WE;
reg         WE_delayed;
reg         START;

parameter numloops = 1;


wire signed[255:0] result;

wire signed [191:0] result_128x64;
wire signed [255:0] result_192x64;
wire signed [191:0] result_128x64_rs;
wire signed [191:0] result_cepd;
wire signed [255:0] result_widemult;
reg signed [255:0] check_result_widemult;

reg signed [127:0] astim_r;
reg signed [63:0] bstim_r;
reg signed [63:0] cstim_r;
reg signed [127:0] dstim_r;
reg signed [127:0] estim_r;

reg signed [127:0] astim_r_delayed;
reg signed [63:0] bstim_r_delayed;
reg signed [63:0] cstim_r_delayed;
reg signed [127:0] dstim_r_delayed;
reg signed [127:0] estim_r_delayed;

reg signed [127:0] astim_test;
reg signed [63:0]  bstim_test;
reg signed [63:0]  cstim_test;
reg signed [127:0] dstim_test;
reg signed [127:0] estim_test;

initial
begin
    SYSCLK = 1'b1;
    NSYSRESET = 1'b0;
    START   = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10)
        NSYSRESET = 1'b1;
    #(SYSCLK_PERIOD * 490)
        START = 1'b1;
    #(SYSCLK_PERIOD * 47)
        START = 1'b0;
end


//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)begin
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;
end
integer i;
integer x;
//initial
//begin
always @ (posedge SYSCLK) begin
    if (START) begin
        WE <= 1'b1;
            for(i=0; i<=46; i=i+1) begin
            astim_test = astim[i];
            bstim_test = bstim[i];
            cstim_test = cstim[i];
            dstim_test = dstim[i];
            estim_test = estim[i];
            #(SYSCLK_PERIOD);
            end
    end
    else begin
        WE <= 1'b0;
        astim_test = '0;
        bstim_test = '0;
        cstim_test = '0;
        dstim_test = '0;
        estim_test = '0;
    end
end


always @ (posedge SYSCLK) begin
    astim_r <= astim_test;
    bstim_r <= bstim_test;
    cstim_r <= cstim_test;
    dstim_r <= dstim_test;
    estim_r <= estim_test;
end

//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  LegUp-generated wide_mult_top
//////////////////////////////////////////////////////////////////////
wide_mult_top WideMultTop_0 (
    // Inputs
    .reset(~NSYSRESET),
    .clk(SYSCLK),
    .A(astim_r),
    .B(bstim_r),
    .C(cstim_r),
    .D(dstim_r),
    .E(estim_r),
    .start(WE),
    // Outputs
    .return_val (result)
);

// result of 128x64 multiply used for checking internal operation
assign result_128x64 = cstim_r*estim_r;

// result of (0.5(128x64)) + D used for checking internal operation
assign result_cepd = result_128x64_rs + dstim_r;

// result_192x64 multiply = (cstim *(dstim + 0.5*(cstim*estim)));
// used for checking internal operation
assign result_192x64 = (cstim_r *(dstim_r + result_128x64_rs));


// assign result_128x64_rs = (cstim*estim)/ 2;
// used for checking internal operation
assign result_128x64_rs = {result_128x64[191], result_128x64[191:1]};

// assign result_widemult = astim + bstim + (cstim *(dstim + 0.5*(cstim*estim)));
// used for checking internal operation
assign result_widemult = astim_r + {bstim_r,{64{1'b0}}} + result_192x64;

// shift register block to add delay to match input to multiplier
// pipeline stages require to meet timing.
shiftdelay #(.STAGES(`WIDE_MULT_LATENCY-1), .WIDTH(256)) shiftdelay_inst3(
     .resetn    (NSYSRESET ),
     .clock     (SYSCLK ),
     .sigin     (result_widemult ),
     .sigout    (check_result_widemult )
);

// print out the inputs for debugging purposes
shiftdelay #(.STAGES(`WIDE_MULT_LATENCY-1), .WIDTH(128)) shiftdelay_inst5(
     .resetn    (NSYSRESET ),
     .clock     (SYSCLK ),
     .sigin     (astim_r ),
     .sigout    (astim_r_delayed )
);
shiftdelay #(.STAGES(`WIDE_MULT_LATENCY-1), .WIDTH(64)) shiftdelay_inst6(
     .resetn    (NSYSRESET ),
     .clock     (SYSCLK ),
     .sigin     (bstim_r ),
     .sigout    (bstim_r_delayed )
);
shiftdelay #(.STAGES(`WIDE_MULT_LATENCY-1), .WIDTH(64)) shiftdelay_inst7(
     .resetn    (NSYSRESET ),
     .clock     (SYSCLK ),
     .sigin     (cstim_r ),
     .sigout    (cstim_r_delayed )
);
shiftdelay #(.STAGES(`WIDE_MULT_LATENCY-1), .WIDTH(128)) shiftdelay_inst8(
     .resetn    (NSYSRESET ),
     .clock     (SYSCLK ),
     .sigin     (dstim_r ),
     .sigout    (dstim_r_delayed )
);
shiftdelay #(.STAGES(`WIDE_MULT_LATENCY-1), .WIDTH(128)) shiftdelay_inst9(
     .resetn    (NSYSRESET ),
     .clock     (SYSCLK ),
     .sigin     (estim_r ),
     .sigout    (estim_r_delayed )
);

integer num_res = 0;
integer num_mismatch = 0;

always @ (result) begin
    @(negedge SYSCLK)
    $display ("time=%0t num=%d\n  A=%h B=%h C=%h D=%h E=%h\n  result=               %h\n  check_result_widemult=%h",
             $time, num_res, astim_r_delayed, bstim_r_delayed, cstim_r_delayed,
             dstim_r_delayed, estim_r_delayed, result, check_result_widemult,);
    num_res += 1;
    if (check_result_widemult != result) begin
        $display ("Error: calculated result not equal to expected result!");
        num_mismatch += 1;
    end
    $display("");
    if (num_res == 46) begin
        $display ("This testbench expects a pipelined wide multiply with initiation interval of 1 and pipeline latency of %0d.", `WIDE_MULT_LATENCY);
        $display ("If there are mismatches in this testbench but not in co-simulation, check your pipeline results.");
        $display ("Simulation finished! %d mismatches.", num_mismatch);
        if (num_mismatch)
            $display("FAIL");
        else
            $display("PASS");
        $finish;
    end
end

endmodule
