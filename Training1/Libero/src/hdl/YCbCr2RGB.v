// ----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 9.2
// Copyright (c) 2015-2021 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: legup@microchip.com
// Date: Wed Apr  7 13:17:32 2021
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEM_INIT_DIR ""
/* synthesis translate_off */
// For Microsemi, the simulation directory is different from
// the synthesis directory for memory initialization files.
`undef MEM_INIT_DIR
`define MEM_INIT_DIR "../mem_init/"
/* synthesis translate_on */

`timescale 1 ns / 1 ns
module YCbCr2RGB_legup_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo_Y,
	input_fifo_ready,
	input_fifo_valid,
	input_fifo_Cb,
	input_fifo_Cr,
	output_fifo_R,
	output_fifo_ready,
	output_fifo_valid,
	output_fifo_G,
	output_fifo_B
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] input_fifo_Y;
output reg  input_fifo_ready;
input  input_fifo_valid;
input [7:0] input_fifo_Cb;
input [7:0] input_fifo_Cr;
output reg [7:0] output_fifo_R;
input  output_fifo_ready;
output reg  output_fifo_valid;
output reg [7:0] output_fifo_G;
output reg [7:0] output_fifo_B;
reg  YCbCr2RGB_legup_inst_clk;
reg  YCbCr2RGB_legup_inst_reset;
reg  YCbCr2RGB_legup_inst_start;
wire  YCbCr2RGB_legup_inst_ready;
wire  YCbCr2RGB_legup_inst_finish;
reg [7:0] YCbCr2RGB_legup_inst_input_fifo_Y;
wire  YCbCr2RGB_legup_inst_input_fifo_ready;
reg  YCbCr2RGB_legup_inst_input_fifo_valid;
reg [7:0] YCbCr2RGB_legup_inst_input_fifo_Cb;
reg [7:0] YCbCr2RGB_legup_inst_input_fifo_Cr;
wire [7:0] YCbCr2RGB_legup_inst_output_fifo_R;
reg  YCbCr2RGB_legup_inst_output_fifo_ready;
wire  YCbCr2RGB_legup_inst_output_fifo_valid;
wire [7:0] YCbCr2RGB_legup_inst_output_fifo_G;
wire [7:0] YCbCr2RGB_legup_inst_output_fifo_B;
reg  YCbCr2RGB_legup_inst_finish_reg;


YCbCr2RGB_legup YCbCr2RGB_legup_inst (
	.clk (YCbCr2RGB_legup_inst_clk),
	.reset (YCbCr2RGB_legup_inst_reset),
	.start (YCbCr2RGB_legup_inst_start),
	.ready (YCbCr2RGB_legup_inst_ready),
	.finish (YCbCr2RGB_legup_inst_finish),
	.input_fifo_Y (YCbCr2RGB_legup_inst_input_fifo_Y),
	.input_fifo_ready (YCbCr2RGB_legup_inst_input_fifo_ready),
	.input_fifo_valid (YCbCr2RGB_legup_inst_input_fifo_valid),
	.input_fifo_Cb (YCbCr2RGB_legup_inst_input_fifo_Cb),
	.input_fifo_Cr (YCbCr2RGB_legup_inst_input_fifo_Cr),
	.output_fifo_R (YCbCr2RGB_legup_inst_output_fifo_R),
	.output_fifo_ready (YCbCr2RGB_legup_inst_output_fifo_ready),
	.output_fifo_valid (YCbCr2RGB_legup_inst_output_fifo_valid),
	.output_fifo_G (YCbCr2RGB_legup_inst_output_fifo_G),
	.output_fifo_B (YCbCr2RGB_legup_inst_output_fifo_B)
);



always @(*) begin
	YCbCr2RGB_legup_inst_clk = clk;
end
always @(*) begin
	YCbCr2RGB_legup_inst_reset = reset;
end
always @(*) begin
	YCbCr2RGB_legup_inst_start = start;
end
always @(*) begin
	YCbCr2RGB_legup_inst_input_fifo_Y = input_fifo_Y;
end
always @(*) begin
	YCbCr2RGB_legup_inst_input_fifo_valid = input_fifo_valid;
end
always @(*) begin
	YCbCr2RGB_legup_inst_input_fifo_Cb = input_fifo_Cb;
end
always @(*) begin
	YCbCr2RGB_legup_inst_input_fifo_Cr = input_fifo_Cr;
end
always @(*) begin
	YCbCr2RGB_legup_inst_output_fifo_ready = output_fifo_ready;
end
always @(posedge clk) begin
	if ((reset | YCbCr2RGB_legup_inst_start)) begin
		YCbCr2RGB_legup_inst_finish_reg <= 1'd0;
	end
	if (YCbCr2RGB_legup_inst_finish) begin
		YCbCr2RGB_legup_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = YCbCr2RGB_legup_inst_ready;
end
always @(*) begin
	finish = YCbCr2RGB_legup_inst_finish;
end
always @(*) begin
	input_fifo_ready = YCbCr2RGB_legup_inst_input_fifo_ready;
end
always @(*) begin
	output_fifo_R = YCbCr2RGB_legup_inst_output_fifo_R;
end
always @(*) begin
	output_fifo_valid = YCbCr2RGB_legup_inst_output_fifo_valid;
end
always @(*) begin
	output_fifo_G = YCbCr2RGB_legup_inst_output_fifo_G;
end
always @(*) begin
	output_fifo_B = YCbCr2RGB_legup_inst_output_fifo_B;
end

endmodule
`timescale 1 ns / 1 ns
module legup_split_mult_unsigned_25_17_42_2
(
	clock,
	aclr,
	clken,
	dataa,
	datab,
	result
);

parameter [4:0] widtha = 5'd25;
parameter [4:0] widthb = 5'd17;
parameter [5:0] widthp = 6'd42;
parameter [1:0] pipeline = 2'd2;
parameter  representation = "UNSIGNED";
parameter  preserve_module_hierarchy = 1'd0;

input  clock;
input  aclr;
input  clken;
input [24:0] dataa;
input [16:0] datab;
output reg [41:0] result;
reg [7:0] lhs_in_7_0;
reg [16:0] rhs_in_16_0;
reg [24:0] mul_0_wire;
reg [24:0] mul_0_reg_out;
reg [16:0] lhs_in_24_8;
reg [17:0] mul_1_wire;
reg [17:0] mul_1_reg_out;
reg [7:0] mul_result_slice_7_0;
reg [7:0] mul_result_slice_7_0_1;
reg [17:0] mul_result_slice_25_8;


always @(*) begin
	lhs_in_7_0 = dataa[7:0];
end
always @(*) begin
	rhs_in_16_0 = datab[16:0];
end
always @(*) begin
	mul_0_wire = (lhs_in_7_0 * rhs_in_16_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_0_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_0_reg_out <= mul_0_wire;
	end
end
always @(*) begin
	lhs_in_24_8 = dataa[24:8];
end
always @(*) begin
	mul_1_wire = (lhs_in_24_8 * rhs_in_16_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_1_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_1_reg_out <= mul_1_wire;
	end
end
always @(*) begin
	mul_result_slice_7_0 = mul_0_reg_out[7:0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_7_0_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_7_0_1 <= mul_result_slice_7_0;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_25_8 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_25_8 <= (mul_0_reg_out[24:8] + mul_1_reg_out);
	end
end
always @(*) begin
	result = {mul_result_slice_25_8, mul_result_slice_7_0_1};
end
/*   %3 = mul i26 %bit_concat16, 38154, !dbg !5990, !MSB !5992, !LSB !5993, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
endmodule
`timescale 1 ns / 1 ns
module legup_split_mult_unsigned_26_17_43_2
(
	clock,
	aclr,
	clken,
	dataa,
	datab,
	result
);

parameter [4:0] widtha = 5'd26;
parameter [4:0] widthb = 5'd17;
parameter [5:0] widthp = 6'd43;
parameter [1:0] pipeline = 2'd2;
parameter  representation = "UNSIGNED";
parameter  preserve_module_hierarchy = 1'd0;

input  clock;
input  aclr;
input  clken;
input [25:0] dataa;
input [16:0] datab;
output reg [42:0] result;
reg [8:0] lhs_in_8_0;
reg [16:0] rhs_in_16_0;
reg [25:0] mul_0_wire;
reg [25:0] mul_0_reg_out;
reg [16:0] lhs_in_25_9;
reg [16:0] mul_1_wire;
reg [16:0] mul_1_reg_out;
reg [8:0] mul_result_slice_8_0;
reg [8:0] mul_result_slice_8_0_1;
reg [16:0] mul_result_slice_25_9;


always @(*) begin
	lhs_in_8_0 = dataa[8:0];
end
always @(*) begin
	rhs_in_16_0 = datab[16:0];
end
always @(*) begin
	mul_0_wire = (lhs_in_8_0 * rhs_in_16_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_0_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_0_reg_out <= mul_0_wire;
	end
end
always @(*) begin
	lhs_in_25_9 = dataa[25:9];
end
always @(*) begin
	mul_1_wire = (lhs_in_25_9 * rhs_in_16_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_1_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_1_reg_out <= mul_1_wire;
	end
end
always @(*) begin
	mul_result_slice_8_0 = mul_0_reg_out[8:0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_8_0_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_8_0_1 <= mul_result_slice_8_0;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_25_9 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_25_9 <= (mul_0_reg_out[25:9] + mul_1_reg_out);
	end
end
always @(*) begin
	result = {mul_result_slice_25_9, mul_result_slice_8_0_1};
end
/*   %4 = mul i26 %bit_concat15, 52298, !dbg !5995, !MSB !5992, !LSB !5993, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
endmodule
`timescale 1 ns / 1 ns
module legup_split_mult_unsigned_26_15_41_2
(
	clock,
	aclr,
	clken,
	dataa,
	datab,
	result
);

parameter [4:0] widtha = 5'd26;
parameter [3:0] widthb = 4'd15;
parameter [5:0] widthp = 6'd41;
parameter [1:0] pipeline = 2'd2;
parameter  representation = "UNSIGNED";
parameter  preserve_module_hierarchy = 1'd0;

input  clock;
input  aclr;
input  clken;
input [25:0] dataa;
input [14:0] datab;
output reg [40:0] result;
reg [8:0] lhs_in_8_0;
reg [14:0] rhs_in_14_0;
reg [23:0] mul_0_wire;
reg [23:0] mul_0_reg_out;
reg [16:0] lhs_in_25_9;
reg [16:0] mul_1_wire;
reg [16:0] mul_1_reg_out;
reg [8:0] mul_result_slice_8_0;
reg [8:0] mul_result_slice_8_0_1;
reg [16:0] mul_result_slice_25_9;


always @(*) begin
	lhs_in_8_0 = dataa[8:0];
end
always @(*) begin
	rhs_in_14_0 = datab[14:0];
end
always @(*) begin
	mul_0_wire = (lhs_in_8_0 * rhs_in_14_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_0_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_0_reg_out <= mul_0_wire;
	end
end
always @(*) begin
	lhs_in_25_9 = dataa[25:9];
end
always @(*) begin
	mul_1_wire = (lhs_in_25_9 * rhs_in_14_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_1_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_1_reg_out <= mul_1_wire;
	end
end
always @(*) begin
	mul_result_slice_8_0 = mul_0_reg_out[8:0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_8_0_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_8_0_1 <= mul_result_slice_8_0;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_25_9 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_25_9 <= (mul_0_reg_out[23:9] + mul_1_reg_out);
	end
end
always @(*) begin
	result = {mul_result_slice_25_9, mul_result_slice_8_0_1};
end
/*   %7 = mul i26 %bit_concat11, 12837, !dbg !6007, !MSB !5992, !LSB !5987, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
endmodule
`timescale 1 ns / 1 ns
module legup_split_mult_unsigned_26_16_42_2
(
	clock,
	aclr,
	clken,
	dataa,
	datab,
	result
);

parameter [4:0] widtha = 5'd26;
parameter [4:0] widthb = 5'd16;
parameter [5:0] widthp = 6'd42;
parameter [1:0] pipeline = 2'd2;
parameter  representation = "UNSIGNED";
parameter  preserve_module_hierarchy = 1'd0;

input  clock;
input  aclr;
input  clken;
input [25:0] dataa;
input [15:0] datab;
output reg [41:0] result;
reg [8:0] lhs_in_8_0;
reg [15:0] rhs_in_15_0;
reg [24:0] mul_0_wire;
reg [24:0] mul_0_reg_out;
reg [16:0] lhs_in_25_9;
reg [16:0] mul_1_wire;
reg [16:0] mul_1_reg_out;
reg [8:0] mul_result_slice_8_0;
reg [8:0] mul_result_slice_8_0_1;
reg [16:0] mul_result_slice_25_9;


always @(*) begin
	lhs_in_8_0 = dataa[8:0];
end
always @(*) begin
	rhs_in_15_0 = datab[15:0];
end
always @(*) begin
	mul_0_wire = (lhs_in_8_0 * rhs_in_15_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_0_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_0_reg_out <= mul_0_wire;
	end
end
always @(*) begin
	lhs_in_25_9 = dataa[25:9];
end
always @(*) begin
	mul_1_wire = (lhs_in_25_9 * rhs_in_15_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_1_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_1_reg_out <= mul_1_wire;
	end
end
always @(*) begin
	mul_result_slice_8_0 = mul_0_reg_out[8:0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_8_0_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_8_0_1 <= mul_result_slice_8_0;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_25_9 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_25_9 <= (mul_0_reg_out[24:9] + mul_1_reg_out);
	end
end
always @(*) begin
	result = {mul_result_slice_25_9, mul_result_slice_8_0_1};
end
/*   %9 = mul i26 %bit_concat15, 26639, !dbg !6014, !MSB !5992, !LSB !5987, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
endmodule
`timescale 1 ns / 1 ns
module legup_split_mult_unsigned_26_18_44_3
(
	clock,
	aclr,
	clken,
	dataa,
	datab,
	result
);

parameter [4:0] widtha = 5'd26;
parameter [4:0] widthb = 5'd18;
parameter [5:0] widthp = 6'd44;
parameter [1:0] pipeline = 2'd3;
parameter  representation = "UNSIGNED";
parameter  preserve_module_hierarchy = 1'd0;

input  clock;
input  aclr;
input  clken;
input [25:0] dataa;
input [17:0] datab;
output reg [43:0] result;
reg [8:0] lhs_in_8_0;
reg  rhs_in_0_0;
reg [9:0] mul_0_wire;
reg [9:0] mul_0_reg_out;
reg [16:0] rhs_in_17_1;
reg [24:0] mul_1_wire;
reg [24:0] mul_1_reg_out;
reg  mul_result_slice_0_0;
reg  mul_result_slice_0_0_1;
reg  mul_result_slice_0_0_2;
reg [24:0] add_0_reg;
reg [16:0] lhs_in_25_9;
reg [16:0] lhs_in_25_9_1;
reg  rhs_in_0_0_1;
reg [16:0] mul_2_wire;
reg [16:0] mul_2_reg_out;
reg [7:0] mul_result_slice_8_1;
reg [7:0] mul_result_slice_8_1_1;
reg [16:0] add_1;
reg [16:0] rhs_in_17_1_1;
reg [15:0] mul_3_wire;
reg [15:0] mul_3_reg_out;
reg  mul_result_slice_9_9;
reg  mul_result_slice_9_9_1;
reg [15:0] mul_result_slice_25_10;


always @(*) begin
	lhs_in_8_0 = dataa[8:0];
end
always @(*) begin
	rhs_in_0_0 = datab[0];
end
always @(*) begin
	mul_0_wire = (lhs_in_8_0 * rhs_in_0_0);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_0_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_0_reg_out <= mul_0_wire;
	end
end
always @(*) begin
	rhs_in_17_1 = datab[17:1];
end
always @(*) begin
	mul_1_wire = (lhs_in_8_0 * rhs_in_17_1);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_1_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_1_reg_out <= mul_1_wire;
	end
end
always @(*) begin
	mul_result_slice_0_0 = mul_0_reg_out[0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_0_0_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_0_0_1 <= mul_result_slice_0_0;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_0_0_2 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_0_0_2 <= mul_result_slice_0_0_1;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		add_0_reg <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		add_0_reg <= (mul_0_reg_out[9:1] + mul_1_reg_out);
	end
end
always @(*) begin
	lhs_in_25_9 = dataa[25:9];
end
always @(posedge clock) begin
	if (aclr) begin
		lhs_in_25_9_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		lhs_in_25_9_1 <= lhs_in_25_9;
	end
	if (aclr) begin
		lhs_in_25_9_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		lhs_in_25_9_1 <= lhs_in_25_9;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		rhs_in_0_0_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		rhs_in_0_0_1 <= rhs_in_0_0;
	end
end
always @(*) begin
	mul_2_wire = (lhs_in_25_9_1 * rhs_in_0_0_1);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_2_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_2_reg_out <= mul_2_wire;
	end
end
always @(*) begin
	mul_result_slice_8_1 = add_0_reg[7:0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_8_1_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_8_1_1 <= mul_result_slice_8_1;
	end
end
always @(*) begin
	add_1 = (add_0_reg[24:8] + mul_2_reg_out);
end
always @(posedge clock) begin
	if (aclr) begin
		rhs_in_17_1_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		rhs_in_17_1_1 <= rhs_in_17_1;
	end
end
always @(*) begin
	mul_3_wire = (lhs_in_25_9_1 * rhs_in_17_1_1);
end
always @(posedge clock) begin
	if (aclr) begin
		mul_3_reg_out <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_3_reg_out <= mul_3_wire;
	end
end
always @(*) begin
	mul_result_slice_9_9 = add_1[0];
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_9_9_1 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_9_9_1 <= mul_result_slice_9_9;
	end
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_25_10 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_25_10 <= (add_1[16:1] + mul_3_reg_out);
	end
end
always @(*) begin
	result = {{{mul_result_slice_25_10, mul_result_slice_9_9_1}, mul_result_slice_8_1_1}, mul_result_slice_0_0_2};
end
/*   %12 = mul i26 %bit_concat11, 66100, !dbg !6026, !MSB !5992, !LSB !5994, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !6025, !legup.pipeline.stage !5987*/
endmodule
`timescale 1 ns / 1 ns
module YCbCr2RGB_legup
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo_Y,
	input_fifo_ready,
	input_fifo_valid,
	input_fifo_Cb,
	input_fifo_Cr,
	output_fifo_R,
	output_fifo_ready,
	output_fifo_valid,
	output_fifo_G,
	output_fifo_B
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] input_fifo_Y;
output reg  input_fifo_ready;
input  input_fifo_valid;
input [7:0] input_fifo_Cb;
input [7:0] input_fifo_Cr;
output reg [7:0] output_fifo_R;
input  output_fifo_ready;
output reg  output_fifo_valid;
output reg [7:0] output_fifo_G;
output reg [7:0] output_fifo_B;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_0;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_1;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_2;
reg [24:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat16;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_3;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat15;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_4;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat14;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat13;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_5;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select12;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_6;
reg [10:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select5;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select4;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat11;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_7;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat10;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_8;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_9;
reg [27:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat9;
reg [27:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat8;
reg [27:0] YCbCr2RGB_legup_EERKT3_exit120_10;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select7;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_11;
reg [10:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select3;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select2;
reg [25:0] YCbCr2RGB_legup_EERKT3_exit120_12;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_13;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select6;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_14;
reg [10:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select1;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select;
reg  YCbCr2RGB_legup_EERKT3_exit120_15;
reg  YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i6;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_select;
reg  YCbCr2RGB_legup_EERKT3_exit120_16;
reg  YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i1;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var0;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_select8;
reg  YCbCr2RGB_legup_EERKT3_exit120_17;
reg  YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var1;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_select10;
reg  YCbCr2RGB_legup_valid_bit_0;
reg  YCbCr2RGB_legup_state_stall_0;
reg  YCbCr2RGB_legup_state_enable_0;
reg  YCbCr2RGB_legup_valid_bit_1;
reg  YCbCr2RGB_legup_state_stall_1;
reg  YCbCr2RGB_legup_state_enable_1;
reg  YCbCr2RGB_legup_valid_bit_2;
reg  YCbCr2RGB_legup_state_stall_2;
reg  YCbCr2RGB_legup_state_enable_2;
reg  YCbCr2RGB_legup_valid_bit_3;
reg  YCbCr2RGB_legup_state_stall_3;
reg  YCbCr2RGB_legup_state_enable_3;
reg  YCbCr2RGB_legup_valid_bit_4;
reg  YCbCr2RGB_legup_state_stall_4;
reg  YCbCr2RGB_legup_state_enable_4;
reg  YCbCr2RGB_legup_valid_bit_5;
reg  YCbCr2RGB_legup_state_stall_5;
reg  YCbCr2RGB_legup_state_enable_5;
reg  YCbCr2RGB_legup_II_counter;
reg [26:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat14_reg_stage3;
reg [10:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select5_reg_stage3;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select4_reg_stage3;
reg [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select7_reg_stage3;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select2_reg_stage4;
reg [10:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select1_reg_stage4;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_bit_select_reg_stage4;
reg  YCbCr2RGB_legup_EERKT3_exit120_15_reg_stage4;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_reg_stage4;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_select_reg_stage5;
reg  YCbCr2RGB_legup_EERKT3_exit120_16_reg_stage4;
reg  YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i1_reg_stage4;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_select8_reg_stage5;
reg  YCbCr2RGB_legup_EERKT3_exit120_17_reg_stage5;
reg [7:0] YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var1_reg_stage5;
reg  input_fifo_Y_consumed_valid;
reg [7:0] input_fifo_Y_consumed_data;
reg  input_fifo_Y_consumed_taken;
reg  input_fifo_Cb_consumed_valid;
reg [7:0] input_fifo_Cb_consumed_data;
reg  input_fifo_Cb_consumed_taken;
reg  input_fifo_Cr_consumed_valid;
reg [7:0] input_fifo_Cr_consumed_data;
reg  input_fifo_Cr_consumed_taken;
wire [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat16_bit_select_operand_0;
reg  legup_split_mult_unsigned_25_17_42_20_clock;
reg  legup_split_mult_unsigned_25_17_42_20_aclr;
reg  legup_split_mult_unsigned_25_17_42_20_clken;
reg [24:0] legup_split_mult_unsigned_25_17_42_20_dataa;
wire [16:0] legup_split_mult_unsigned_25_17_42_20_datab;
wire [41:0] legup_split_mult_unsigned_25_17_42_20_result;
reg [41:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_out_actual;
reg [25:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_out;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_en;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_en_pipeline_cond;
wire [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat15_bit_select_operand_0;
reg  legup_split_mult_unsigned_26_17_43_21_clock;
reg  legup_split_mult_unsigned_26_17_43_21_aclr;
reg  legup_split_mult_unsigned_26_17_43_21_clken;
reg [25:0] legup_split_mult_unsigned_26_17_43_21_dataa;
wire [16:0] legup_split_mult_unsigned_26_17_43_21_datab;
wire [42:0] legup_split_mult_unsigned_26_17_43_21_result;
reg [42:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_out_actual;
reg [25:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_out;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_en;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_en_pipeline_cond;
wire  YCbCr2RGB_legup_EERKT3_exit120_bit_concat14_bit_select_operand_0;
wire  YCbCr2RGB_legup_EERKT3_exit120_bit_concat13_bit_select_operand_0;
wire [17:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat11_bit_select_operand_0;
reg  legup_split_mult_unsigned_26_15_41_22_clock;
reg  legup_split_mult_unsigned_26_15_41_22_aclr;
reg  legup_split_mult_unsigned_26_15_41_22_clken;
reg [25:0] legup_split_mult_unsigned_26_15_41_22_dataa;
wire [14:0] legup_split_mult_unsigned_26_15_41_22_datab;
wire [40:0] legup_split_mult_unsigned_26_15_41_22_result;
reg [40:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_out_actual;
reg [25:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_out;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_en;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_en_pipeline_cond;
wire  YCbCr2RGB_legup_EERKT3_exit120_bit_concat10_bit_select_operand_0;
reg  legup_split_mult_unsigned_26_16_42_23_clock;
reg  legup_split_mult_unsigned_26_16_42_23_aclr;
reg  legup_split_mult_unsigned_26_16_42_23_clken;
reg [25:0] legup_split_mult_unsigned_26_16_42_23_dataa;
wire [15:0] legup_split_mult_unsigned_26_16_42_23_datab;
wire [41:0] legup_split_mult_unsigned_26_16_42_23_result;
reg [41:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_out_actual;
reg [25:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_out;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_en;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_en_pipeline_cond;
wire  YCbCr2RGB_legup_EERKT3_exit120_bit_concat9_bit_select_operand_0;
wire [1:0] YCbCr2RGB_legup_EERKT3_exit120_bit_concat8_bit_select_operand_0;
reg  legup_split_mult_unsigned_26_18_44_34_clock;
reg  legup_split_mult_unsigned_26_18_44_34_aclr;
reg  legup_split_mult_unsigned_26_18_44_34_clken;
reg [25:0] legup_split_mult_unsigned_26_18_44_34_dataa;
wire [17:0] legup_split_mult_unsigned_26_18_44_34_datab;
wire [43:0] legup_split_mult_unsigned_26_18_44_34_result;
reg [43:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_out_actual;
reg [25:0] legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_out;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_en;
reg  legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_en_pipeline_cond;
wire  YCbCr2RGB_legup_EERKT3_exit120_bit_concat_bit_select_operand_0;
reg  output_fifo_R_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a;
reg  output_fifo_R_YCbCr2RGB_legup_state_5_stalln_reg;
reg  output_fifo_R_YCbCr2RGB_legup_state_5_enable_cond_a;
reg  output_fifo_G_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a;
reg  output_fifo_G_YCbCr2RGB_legup_state_5_stalln_reg;
reg  output_fifo_G_YCbCr2RGB_legup_state_5_enable_cond_a;
reg  output_fifo_B_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a;
reg  output_fifo_B_YCbCr2RGB_legup_state_5_stalln_reg;
reg  output_fifo_B_YCbCr2RGB_legup_state_5_enable_cond_a;

/*   %3 = mul i26 %bit_concat16, 38154, !dbg !5990, !MSB !5992, !LSB !5993, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
legup_split_mult_unsigned_25_17_42_2 legup_split_mult_unsigned_25_17_42_20 (
	.clock (legup_split_mult_unsigned_25_17_42_20_clock),
	.aclr (legup_split_mult_unsigned_25_17_42_20_aclr),
	.clken (legup_split_mult_unsigned_25_17_42_20_clken),
	.dataa (legup_split_mult_unsigned_25_17_42_20_dataa),
	.datab (legup_split_mult_unsigned_25_17_42_20_datab),
	.result (legup_split_mult_unsigned_25_17_42_20_result)
);

defparam
	legup_split_mult_unsigned_25_17_42_20.widtha = 25,
	legup_split_mult_unsigned_25_17_42_20.widthb = 17,
	legup_split_mult_unsigned_25_17_42_20.widthp = 42,
	legup_split_mult_unsigned_25_17_42_20.pipeline = 2,
	legup_split_mult_unsigned_25_17_42_20.representation = "UNSIGNED",
	legup_split_mult_unsigned_25_17_42_20.preserve_module_hierarchy = 0;

/*   %4 = mul i26 %bit_concat15, 52298, !dbg !5995, !MSB !5992, !LSB !5993, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
legup_split_mult_unsigned_26_17_43_2 legup_split_mult_unsigned_26_17_43_21 (
	.clock (legup_split_mult_unsigned_26_17_43_21_clock),
	.aclr (legup_split_mult_unsigned_26_17_43_21_aclr),
	.clken (legup_split_mult_unsigned_26_17_43_21_clken),
	.dataa (legup_split_mult_unsigned_26_17_43_21_dataa),
	.datab (legup_split_mult_unsigned_26_17_43_21_datab),
	.result (legup_split_mult_unsigned_26_17_43_21_result)
);

defparam
	legup_split_mult_unsigned_26_17_43_21.widtha = 26,
	legup_split_mult_unsigned_26_17_43_21.widthb = 17,
	legup_split_mult_unsigned_26_17_43_21.widthp = 43,
	legup_split_mult_unsigned_26_17_43_21.pipeline = 2,
	legup_split_mult_unsigned_26_17_43_21.representation = "UNSIGNED",
	legup_split_mult_unsigned_26_17_43_21.preserve_module_hierarchy = 0;

/*   %7 = mul i26 %bit_concat11, 12837, !dbg !6007, !MSB !5992, !LSB !5987, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
legup_split_mult_unsigned_26_15_41_2 legup_split_mult_unsigned_26_15_41_22 (
	.clock (legup_split_mult_unsigned_26_15_41_22_clock),
	.aclr (legup_split_mult_unsigned_26_15_41_22_aclr),
	.clken (legup_split_mult_unsigned_26_15_41_22_clken),
	.dataa (legup_split_mult_unsigned_26_15_41_22_dataa),
	.datab (legup_split_mult_unsigned_26_15_41_22_datab),
	.result (legup_split_mult_unsigned_26_15_41_22_result)
);

defparam
	legup_split_mult_unsigned_26_15_41_22.widtha = 26,
	legup_split_mult_unsigned_26_15_41_22.widthb = 15,
	legup_split_mult_unsigned_26_15_41_22.widthp = 41,
	legup_split_mult_unsigned_26_15_41_22.pipeline = 2,
	legup_split_mult_unsigned_26_15_41_22.representation = "UNSIGNED",
	legup_split_mult_unsigned_26_15_41_22.preserve_module_hierarchy = 0;

/*   %9 = mul i26 %bit_concat15, 26639, !dbg !6014, !MSB !5992, !LSB !5987, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !5994, !legup.pipeline.stage !5987*/
legup_split_mult_unsigned_26_16_42_2 legup_split_mult_unsigned_26_16_42_23 (
	.clock (legup_split_mult_unsigned_26_16_42_23_clock),
	.aclr (legup_split_mult_unsigned_26_16_42_23_aclr),
	.clken (legup_split_mult_unsigned_26_16_42_23_clken),
	.dataa (legup_split_mult_unsigned_26_16_42_23_dataa),
	.datab (legup_split_mult_unsigned_26_16_42_23_datab),
	.result (legup_split_mult_unsigned_26_16_42_23_result)
);

defparam
	legup_split_mult_unsigned_26_16_42_23.widtha = 26,
	legup_split_mult_unsigned_26_16_42_23.widthb = 16,
	legup_split_mult_unsigned_26_16_42_23.widthp = 42,
	legup_split_mult_unsigned_26_16_42_23.pipeline = 2,
	legup_split_mult_unsigned_26_16_42_23.representation = "UNSIGNED",
	legup_split_mult_unsigned_26_16_42_23.preserve_module_hierarchy = 0;

/*   %12 = mul i26 %bit_concat11, 66100, !dbg !6026, !MSB !5992, !LSB !5994, !extendFrom !5992, !legup.pipeline.start_time !5987, !legup.pipeline.avail_time !6025, !legup.pipeline.stage !5987*/
legup_split_mult_unsigned_26_18_44_3 legup_split_mult_unsigned_26_18_44_34 (
	.clock (legup_split_mult_unsigned_26_18_44_34_clock),
	.aclr (legup_split_mult_unsigned_26_18_44_34_aclr),
	.clken (legup_split_mult_unsigned_26_18_44_34_clken),
	.dataa (legup_split_mult_unsigned_26_18_44_34_dataa),
	.datab (legup_split_mult_unsigned_26_18_44_34_datab),
	.result (legup_split_mult_unsigned_26_18_44_34_result)
);

defparam
	legup_split_mult_unsigned_26_18_44_34.widtha = 26,
	legup_split_mult_unsigned_26_18_44_34.widthb = 18,
	legup_split_mult_unsigned_26_18_44_34.widthp = 44,
	legup_split_mult_unsigned_26_18_44_34.pipeline = 3,
	legup_split_mult_unsigned_26_18_44_34.representation = "UNSIGNED",
	legup_split_mult_unsigned_26_18_44_34.preserve_module_hierarchy = 0;


always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_0 = input_fifo_Y_consumed_data;
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_1 = input_fifo_Cb_consumed_data;
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_2 = input_fifo_Cr_consumed_data;
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat16 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat16_bit_select_operand_0[17:0], YCbCr2RGB_legup_EERKT3_exit120_0[7:0]};
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_3 = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_out;
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat15 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat15_bit_select_operand_0[17:0], YCbCr2RGB_legup_EERKT3_exit120_2[7:0]};
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_4 = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_out;
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat14 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat14_bit_select_operand_0, YCbCr2RGB_legup_EERKT3_exit120_3[25:0]};
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat13 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat13_bit_select_operand_0, YCbCr2RGB_legup_EERKT3_exit120_4[25:0]};
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_5 = (YCbCr2RGB_legup_EERKT3_exit120_bit_concat13 + YCbCr2RGB_legup_EERKT3_exit120_bit_concat14);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select12 = YCbCr2RGB_legup_EERKT3_exit120_5[25:8];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_6 = (YCbCr2RGB_legup_EERKT3_exit120_bit_select12 + $signed(-18'd28470));
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select5 = YCbCr2RGB_legup_EERKT3_exit120_6[17:7];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select4 = YCbCr2RGB_legup_EERKT3_exit120_6[14:7];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat11 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat11_bit_select_operand_0[17:0], YCbCr2RGB_legup_EERKT3_exit120_1[7:0]};
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_7 = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_out;
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat10 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat10_bit_select_operand_0, YCbCr2RGB_legup_EERKT3_exit120_7[25:0]};
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_8 = (YCbCr2RGB_legup_EERKT3_exit120_bit_concat14 - YCbCr2RGB_legup_EERKT3_exit120_bit_concat10);
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_9 = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_out;
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat9 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat9_bit_select_operand_0, YCbCr2RGB_legup_EERKT3_exit120_8[26:0]};
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat8 = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat8_bit_select_operand_0[1:0], YCbCr2RGB_legup_EERKT3_exit120_9[25:0]};
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_10 = (YCbCr2RGB_legup_EERKT3_exit120_bit_concat9 - YCbCr2RGB_legup_EERKT3_exit120_bit_concat8);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select7 = YCbCr2RGB_legup_EERKT3_exit120_10[25:8];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_11 = (YCbCr2RGB_legup_EERKT3_exit120_bit_select7_reg_stage3 + 18'd17417);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select3 = YCbCr2RGB_legup_EERKT3_exit120_11[17:7];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select2 = YCbCr2RGB_legup_EERKT3_exit120_11[14:7];
end
always @(*) begin
	YCbCr2RGB_legup_EERKT3_exit120_12 = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_out;
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat = {YCbCr2RGB_legup_EERKT3_exit120_bit_concat_bit_select_operand_0, YCbCr2RGB_legup_EERKT3_exit120_12[25:0]};
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_13 = (YCbCr2RGB_legup_EERKT3_exit120_bit_concat + YCbCr2RGB_legup_EERKT3_exit120_bit_concat14_reg_stage3);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select6 = YCbCr2RGB_legup_EERKT3_exit120_13[25:8];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_14 = (YCbCr2RGB_legup_EERKT3_exit120_bit_select6 + -18'd35372);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select1 = YCbCr2RGB_legup_EERKT3_exit120_14[17:7];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select = YCbCr2RGB_legup_EERKT3_exit120_14[14:7];
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_15 = ($signed(YCbCr2RGB_legup_EERKT3_exit120_bit_select5_reg_stage3) > $signed($signed(-11'd1)));
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i6 = (YCbCr2RGB_legup_EERKT3_exit120_bit_select5_reg_stage3 > 11'd255);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro = (YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i6 ? -8'd1 : YCbCr2RGB_legup_EERKT3_exit120_bit_select4_reg_stage3);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_select = (YCbCr2RGB_legup_EERKT3_exit120_15_reg_stage4 ? YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_reg_stage4 : 8'd0);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_16 = ($signed(YCbCr2RGB_legup_EERKT3_exit120_bit_select3) > $signed($signed(-11'd1)));
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i1 = (YCbCr2RGB_legup_EERKT3_exit120_bit_select3 > 11'd255);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var0 = (YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i1_reg_stage4 ? -8'd1 : YCbCr2RGB_legup_EERKT3_exit120_bit_select2_reg_stage4);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_select8 = (YCbCr2RGB_legup_EERKT3_exit120_16_reg_stage4 ? YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var0 : 8'd0);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_17 = ($signed(YCbCr2RGB_legup_EERKT3_exit120_bit_select1_reg_stage4) > $signed($signed(-11'd1)));
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i = (YCbCr2RGB_legup_EERKT3_exit120_bit_select1_reg_stage4 > 11'd255);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var1 = (YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i ? -8'd1 : YCbCr2RGB_legup_EERKT3_exit120_bit_select_reg_stage4);
end
always @(*) begin
		YCbCr2RGB_legup_EERKT3_exit120_select10 = (YCbCr2RGB_legup_EERKT3_exit120_17_reg_stage5 ? YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var1_reg_stage5 : 8'd0);
end
always @(posedge clk) begin
	if (~(YCbCr2RGB_legup_state_stall_0)) begin
		YCbCr2RGB_legup_valid_bit_0 <= (YCbCr2RGB_legup_II_counter & start);
	end
	if (reset) begin
		YCbCr2RGB_legup_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_stall_0 = 1'd0;
	if (YCbCr2RGB_legup_state_stall_1) begin
		YCbCr2RGB_legup_state_stall_0 = 1'd1;
	end
	if (((YCbCr2RGB_legup_valid_bit_0 & 1'd1) & ~(input_fifo_Y_consumed_valid))) begin
		YCbCr2RGB_legup_state_stall_0 = 1'd1;
	end
	if (((YCbCr2RGB_legup_valid_bit_0 & 1'd1) & ~(input_fifo_Cb_consumed_valid))) begin
		YCbCr2RGB_legup_state_stall_0 = 1'd1;
	end
	if (((YCbCr2RGB_legup_valid_bit_0 & 1'd1) & ~(input_fifo_Cr_consumed_valid))) begin
		YCbCr2RGB_legup_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_enable_0 = (YCbCr2RGB_legup_valid_bit_0 & ~(YCbCr2RGB_legup_state_stall_0));
end
always @(posedge clk) begin
	if (~(YCbCr2RGB_legup_state_stall_1)) begin
		YCbCr2RGB_legup_valid_bit_1 <= YCbCr2RGB_legup_state_enable_0;
	end
	if (reset) begin
		YCbCr2RGB_legup_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_stall_1 = 1'd0;
	if (YCbCr2RGB_legup_state_stall_2) begin
		YCbCr2RGB_legup_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_enable_1 = (YCbCr2RGB_legup_valid_bit_1 & ~(YCbCr2RGB_legup_state_stall_1));
end
always @(posedge clk) begin
	if (~(YCbCr2RGB_legup_state_stall_2)) begin
		YCbCr2RGB_legup_valid_bit_2 <= YCbCr2RGB_legup_state_enable_1;
	end
	if (reset) begin
		YCbCr2RGB_legup_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_stall_2 = 1'd0;
	if (YCbCr2RGB_legup_state_stall_3) begin
		YCbCr2RGB_legup_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_enable_2 = (YCbCr2RGB_legup_valid_bit_2 & ~(YCbCr2RGB_legup_state_stall_2));
end
always @(posedge clk) begin
	if (~(YCbCr2RGB_legup_state_stall_3)) begin
		YCbCr2RGB_legup_valid_bit_3 <= YCbCr2RGB_legup_state_enable_2;
	end
	if (reset) begin
		YCbCr2RGB_legup_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_stall_3 = 1'd0;
	if (YCbCr2RGB_legup_state_stall_4) begin
		YCbCr2RGB_legup_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_enable_3 = (YCbCr2RGB_legup_valid_bit_3 & ~(YCbCr2RGB_legup_state_stall_3));
end
always @(posedge clk) begin
	if (~(YCbCr2RGB_legup_state_stall_4)) begin
		YCbCr2RGB_legup_valid_bit_4 <= YCbCr2RGB_legup_state_enable_3;
	end
	if (reset) begin
		YCbCr2RGB_legup_valid_bit_4 <= 1'd0;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_stall_4 = 1'd0;
	if (YCbCr2RGB_legup_state_stall_5) begin
		YCbCr2RGB_legup_state_stall_4 = 1'd1;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_enable_4 = (YCbCr2RGB_legup_valid_bit_4 & ~(YCbCr2RGB_legup_state_stall_4));
end
always @(posedge clk) begin
	if (~(YCbCr2RGB_legup_state_stall_5)) begin
		YCbCr2RGB_legup_valid_bit_5 <= YCbCr2RGB_legup_state_enable_4;
	end
	if (reset) begin
		YCbCr2RGB_legup_valid_bit_5 <= 1'd0;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_stall_5 = 1'd0;
	if ((((YCbCr2RGB_legup_valid_bit_5 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_R_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a | output_fifo_R_YCbCr2RGB_legup_state_5_stalln_reg))) begin
		YCbCr2RGB_legup_state_stall_5 = 1'd1;
	end
	if ((((YCbCr2RGB_legup_valid_bit_5 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_G_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a | output_fifo_G_YCbCr2RGB_legup_state_5_stalln_reg))) begin
		YCbCr2RGB_legup_state_stall_5 = 1'd1;
	end
	if ((((YCbCr2RGB_legup_valid_bit_5 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_B_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a | output_fifo_B_YCbCr2RGB_legup_state_5_stalln_reg))) begin
		YCbCr2RGB_legup_state_stall_5 = 1'd1;
	end
end
always @(*) begin
	YCbCr2RGB_legup_state_enable_5 = (YCbCr2RGB_legup_valid_bit_5 & ~(YCbCr2RGB_legup_state_stall_5));
end
always @(posedge clk) begin
	YCbCr2RGB_legup_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_2) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_concat14_reg_stage3 <= YCbCr2RGB_legup_EERKT3_exit120_bit_concat14;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_2) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select5_reg_stage3 <= YCbCr2RGB_legup_EERKT3_exit120_bit_select5;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_2) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select4_reg_stage3 <= YCbCr2RGB_legup_EERKT3_exit120_bit_select4;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_2) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select7_reg_stage3 <= YCbCr2RGB_legup_EERKT3_exit120_bit_select7;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select2_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_bit_select2;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select1_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_bit_select1;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_bit_select_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_bit_select;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_15_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_15;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_4) begin
		YCbCr2RGB_legup_EERKT3_exit120_select_reg_stage5 <= YCbCr2RGB_legup_EERKT3_exit120_select;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_16_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_16;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_3) begin
		YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i1_reg_stage4 <= YCbCr2RGB_legup_EERKT3_exit120_lnot_i_i_i_i1;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_4) begin
		YCbCr2RGB_legup_EERKT3_exit120_select8_reg_stage5 <= YCbCr2RGB_legup_EERKT3_exit120_select8;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_4) begin
		YCbCr2RGB_legup_EERKT3_exit120_17_reg_stage5 <= YCbCr2RGB_legup_EERKT3_exit120_17;
	end
end
always @(posedge clk) begin
	if (YCbCr2RGB_legup_state_enable_4) begin
		YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var1_reg_stage5 <= YCbCr2RGB_legup_EERKT3_exit120_condlvalue7_i_i_sro_var1;
	end
end
always @(posedge clk) begin
	if (input_fifo_Y_consumed_taken) begin
		input_fifo_Y_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_Y_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_Y_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_Y_consumed_data <= input_fifo_Y;
	end
	if (reset) begin
		input_fifo_Y_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_Y_consumed_taken = 1'd0;
	if ((YCbCr2RGB_legup_valid_bit_0 & 1'd1)) begin
		input_fifo_Y_consumed_taken = ~(YCbCr2RGB_legup_state_stall_0);
	end
end
always @(posedge clk) begin
	if (input_fifo_Cb_consumed_taken) begin
		input_fifo_Cb_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_Cb_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_Cb_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_Cb_consumed_data <= input_fifo_Cb;
	end
	if (reset) begin
		input_fifo_Cb_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_Cb_consumed_taken = 1'd0;
	if ((YCbCr2RGB_legup_valid_bit_0 & 1'd1)) begin
		input_fifo_Cb_consumed_taken = ~(YCbCr2RGB_legup_state_stall_0);
	end
end
always @(posedge clk) begin
	if (input_fifo_Cr_consumed_taken) begin
		input_fifo_Cr_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_Cr_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_Cr_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_Cr_consumed_data <= input_fifo_Cr;
	end
	if (reset) begin
		input_fifo_Cr_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_Cr_consumed_taken = 1'd0;
	if ((YCbCr2RGB_legup_valid_bit_0 & 1'd1)) begin
		input_fifo_Cr_consumed_taken = ~(YCbCr2RGB_legup_state_stall_0);
	end
end
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat16_bit_select_operand_0 = 18'd0;
always @(*) begin
	legup_split_mult_unsigned_25_17_42_20_clock = clk;
end
always @(*) begin
	legup_split_mult_unsigned_25_17_42_20_aclr = reset;
end
always @(*) begin
	legup_split_mult_unsigned_25_17_42_20_clken = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_en;
end
always @(*) begin
	legup_split_mult_unsigned_25_17_42_20_dataa = YCbCr2RGB_legup_EERKT3_exit120_bit_concat16;
end
assign legup_split_mult_unsigned_25_17_42_20_datab = 26'd38154;
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_out_actual = legup_split_mult_unsigned_25_17_42_20_result;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_out = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_out_actual[25:0];
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_en = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_en_pipeline_cond;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_3_en_pipeline_cond = ~(YCbCr2RGB_legup_state_stall_2);
end
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat15_bit_select_operand_0 = 18'd0;
always @(*) begin
	legup_split_mult_unsigned_26_17_43_21_clock = clk;
end
always @(*) begin
	legup_split_mult_unsigned_26_17_43_21_aclr = reset;
end
always @(*) begin
	legup_split_mult_unsigned_26_17_43_21_clken = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_en;
end
always @(*) begin
	legup_split_mult_unsigned_26_17_43_21_dataa = YCbCr2RGB_legup_EERKT3_exit120_bit_concat15;
end
assign legup_split_mult_unsigned_26_17_43_21_datab = 26'd52298;
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_out_actual = legup_split_mult_unsigned_26_17_43_21_result;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_out = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_out_actual[25:0];
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_en = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_en_pipeline_cond;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_4_en_pipeline_cond = ~(YCbCr2RGB_legup_state_stall_2);
end
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat14_bit_select_operand_0 = 1'd0;
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat13_bit_select_operand_0 = 1'd0;
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat11_bit_select_operand_0 = 18'd0;
always @(*) begin
	legup_split_mult_unsigned_26_15_41_22_clock = clk;
end
always @(*) begin
	legup_split_mult_unsigned_26_15_41_22_aclr = reset;
end
always @(*) begin
	legup_split_mult_unsigned_26_15_41_22_clken = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_en;
end
always @(*) begin
	legup_split_mult_unsigned_26_15_41_22_dataa = YCbCr2RGB_legup_EERKT3_exit120_bit_concat11;
end
assign legup_split_mult_unsigned_26_15_41_22_datab = 26'd12837;
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_out_actual = legup_split_mult_unsigned_26_15_41_22_result;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_out = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_out_actual[25:0];
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_en = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_en_pipeline_cond;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_7_en_pipeline_cond = ~(YCbCr2RGB_legup_state_stall_2);
end
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat10_bit_select_operand_0 = 1'd0;
always @(*) begin
	legup_split_mult_unsigned_26_16_42_23_clock = clk;
end
always @(*) begin
	legup_split_mult_unsigned_26_16_42_23_aclr = reset;
end
always @(*) begin
	legup_split_mult_unsigned_26_16_42_23_clken = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_en;
end
always @(*) begin
	legup_split_mult_unsigned_26_16_42_23_dataa = YCbCr2RGB_legup_EERKT3_exit120_bit_concat15;
end
assign legup_split_mult_unsigned_26_16_42_23_datab = 26'd26639;
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_out_actual = legup_split_mult_unsigned_26_16_42_23_result;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_out = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_out_actual[25:0];
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_en = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_en_pipeline_cond;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_9_en_pipeline_cond = ~(YCbCr2RGB_legup_state_stall_2);
end
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat9_bit_select_operand_0 = 1'd0;
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat8_bit_select_operand_0 = 2'd0;
always @(*) begin
	legup_split_mult_unsigned_26_18_44_34_clock = clk;
end
always @(*) begin
	legup_split_mult_unsigned_26_18_44_34_aclr = reset;
end
always @(*) begin
	legup_split_mult_unsigned_26_18_44_34_clken = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_en;
end
always @(*) begin
	legup_split_mult_unsigned_26_18_44_34_dataa = YCbCr2RGB_legup_EERKT3_exit120_bit_concat11;
end
assign legup_split_mult_unsigned_26_18_44_34_datab = 26'd66100;
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_out_actual = legup_split_mult_unsigned_26_18_44_34_result;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_out = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_out_actual[25:0];
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_en = legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_en_pipeline_cond;
end
always @(*) begin
	legup_mult_YCbCr2RGB_legup_EERKT3_exit120_12_en_pipeline_cond = ~(YCbCr2RGB_legup_state_stall_3);
end
assign YCbCr2RGB_legup_EERKT3_exit120_bit_concat_bit_select_operand_0 = 1'd0;
always @(posedge clk) begin
	output_fifo_R_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a <= ((YCbCr2RGB_legup_state_stall_5 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_R_YCbCr2RGB_legup_state_5_stalln_reg <= ~(YCbCr2RGB_legup_state_stall_5);
end
always @(*) begin
	output_fifo_R_YCbCr2RGB_legup_state_5_enable_cond_a = (YCbCr2RGB_legup_valid_bit_5 & (output_fifo_R_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a | output_fifo_R_YCbCr2RGB_legup_state_5_stalln_reg));
end
always @(posedge clk) begin
	output_fifo_G_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a <= ((YCbCr2RGB_legup_state_stall_5 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_G_YCbCr2RGB_legup_state_5_stalln_reg <= ~(YCbCr2RGB_legup_state_stall_5);
end
always @(*) begin
	output_fifo_G_YCbCr2RGB_legup_state_5_enable_cond_a = (YCbCr2RGB_legup_valid_bit_5 & (output_fifo_G_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a | output_fifo_G_YCbCr2RGB_legup_state_5_stalln_reg));
end
always @(posedge clk) begin
	output_fifo_B_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a <= ((YCbCr2RGB_legup_state_stall_5 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_B_YCbCr2RGB_legup_state_5_stalln_reg <= ~(YCbCr2RGB_legup_state_stall_5);
end
always @(*) begin
	output_fifo_B_YCbCr2RGB_legup_state_5_enable_cond_a = (YCbCr2RGB_legup_valid_bit_5 & (output_fifo_B_YCbCr2RGB_legup_state_5_not_accessed_due_to_stall_a | output_fifo_B_YCbCr2RGB_legup_state_5_stalln_reg));
end
always @(*) begin
	ready = ~(YCbCr2RGB_legup_state_stall_0);
end
always @(posedge clk) begin
	finish <= YCbCr2RGB_legup_state_enable_5;
end
always @(*) begin
	input_fifo_ready = (~(input_fifo_Cr_consumed_valid) | input_fifo_Cr_consumed_taken);
	if (reset) begin
		input_fifo_ready = 1'd0;
	end
	if (reset) begin
		input_fifo_ready = 1'd0;
	end
	if (reset) begin
		input_fifo_ready = 1'd0;
	end
end
always @(*) begin
		output_fifo_R = YCbCr2RGB_legup_EERKT3_exit120_select_reg_stage5;
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((output_fifo_R_YCbCr2RGB_legup_state_5_enable_cond_a & 1'd1)) begin
		output_fifo_valid = 1'd1;
	end
	if ((output_fifo_G_YCbCr2RGB_legup_state_5_enable_cond_a & 1'd1)) begin
		output_fifo_valid = 1'd1;
	end
	if ((output_fifo_B_YCbCr2RGB_legup_state_5_enable_cond_a & 1'd1)) begin
		output_fifo_valid = 1'd1;
	end
end
always @(*) begin
		output_fifo_G = YCbCr2RGB_legup_EERKT3_exit120_select8_reg_stage5;
end
always @(*) begin
		output_fifo_B = YCbCr2RGB_legup_EERKT3_exit120_select10;
end

endmodule
