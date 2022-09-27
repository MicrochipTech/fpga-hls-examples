// ----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 9.2
// Copyright (c) 2015-2021 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: legup@microchip.com
// Date: Mon Mar 29 16:59:07 2021
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
module alpha_blend_legup_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo_channel1,
	input_fifo_ready,
	input_fifo_valid,
	input_fifo_channel2,
	input_fifo_alpha,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [23:0] input_fifo_channel1;
output reg  input_fifo_ready;
input  input_fifo_valid;
input [23:0] input_fifo_channel2;
input [7:0] input_fifo_alpha;
output reg [23:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg  alpha_blend_legup_inst_clk;
reg  alpha_blend_legup_inst_reset;
reg  alpha_blend_legup_inst_start;
wire  alpha_blend_legup_inst_ready;
wire  alpha_blend_legup_inst_finish;
reg [23:0] alpha_blend_legup_inst_input_fifo_channel1;
wire  alpha_blend_legup_inst_input_fifo_ready;
reg  alpha_blend_legup_inst_input_fifo_valid;
reg [23:0] alpha_blend_legup_inst_input_fifo_channel2;
reg [7:0] alpha_blend_legup_inst_input_fifo_alpha;
wire [23:0] alpha_blend_legup_inst_output_fifo;
reg  alpha_blend_legup_inst_output_fifo_ready;
wire  alpha_blend_legup_inst_output_fifo_valid;
reg  alpha_blend_legup_inst_finish_reg;


alpha_blend_legup alpha_blend_legup_inst (
	.clk (alpha_blend_legup_inst_clk),
	.reset (alpha_blend_legup_inst_reset),
	.start (alpha_blend_legup_inst_start),
	.ready (alpha_blend_legup_inst_ready),
	.finish (alpha_blend_legup_inst_finish),
	.input_fifo_channel1 (alpha_blend_legup_inst_input_fifo_channel1),
	.input_fifo_ready (alpha_blend_legup_inst_input_fifo_ready),
	.input_fifo_valid (alpha_blend_legup_inst_input_fifo_valid),
	.input_fifo_channel2 (alpha_blend_legup_inst_input_fifo_channel2),
	.input_fifo_alpha (alpha_blend_legup_inst_input_fifo_alpha),
	.output_fifo (alpha_blend_legup_inst_output_fifo),
	.output_fifo_ready (alpha_blend_legup_inst_output_fifo_ready),
	.output_fifo_valid (alpha_blend_legup_inst_output_fifo_valid)
);



always @(*) begin
	alpha_blend_legup_inst_clk = clk;
end
always @(*) begin
	alpha_blend_legup_inst_reset = reset;
end
always @(*) begin
	alpha_blend_legup_inst_start = start;
end
always @(*) begin
	alpha_blend_legup_inst_input_fifo_channel1 = input_fifo_channel1;
end
always @(*) begin
	alpha_blend_legup_inst_input_fifo_valid = input_fifo_valid;
end
always @(*) begin
	alpha_blend_legup_inst_input_fifo_channel2 = input_fifo_channel2;
end
always @(*) begin
	alpha_blend_legup_inst_input_fifo_alpha = input_fifo_alpha;
end
always @(*) begin
	alpha_blend_legup_inst_output_fifo_ready = output_fifo_ready;
end
always @(posedge clk) begin
	if ((reset | alpha_blend_legup_inst_start)) begin
		alpha_blend_legup_inst_finish_reg <= 1'd0;
	end
	if (alpha_blend_legup_inst_finish) begin
		alpha_blend_legup_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = alpha_blend_legup_inst_ready;
end
always @(*) begin
	finish = alpha_blend_legup_inst_finish;
end
always @(*) begin
	input_fifo_ready = alpha_blend_legup_inst_input_fifo_ready;
end
always @(*) begin
	output_fifo = alpha_blend_legup_inst_output_fifo;
end
always @(*) begin
	output_fifo_valid = alpha_blend_legup_inst_output_fifo_valid;
end

endmodule
`timescale 1 ns / 1 ns
module alpha_blend_legup
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo_channel1,
	input_fifo_ready,
	input_fifo_valid,
	input_fifo_channel2,
	input_fifo_alpha,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [23:0] input_fifo_channel1;
output reg  input_fifo_ready;
input  input_fifo_valid;
input [23:0] input_fifo_channel2;
input [7:0] input_fifo_alpha;
output reg [23:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg [23:0] alpha_blend_legup_EEcvyEv_exit203_0;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select15;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select9;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select5;
reg [23:0] alpha_blend_legup_EEcvyEv_exit203_1;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select12;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select7;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select3;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_2;
reg [15:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat17;
reg [15:0] alpha_blend_legup_EEcvyEv_exit203_3;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat16;
reg [32:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat14;
reg [32:0] alpha_blend_legup_EEcvyEv_exit203_4;
reg [32:0] alpha_blend_legup_EEcvyEv_exit203_5;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_mul;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat13;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat11;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_mul10;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_add;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat10;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_mul19;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat8;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_mul24;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_add25;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select1;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat6;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_mul35;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat4;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_mul40;
reg [63:0] alpha_blend_legup_EEcvyEv_exit203_add41;
reg [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_select2;
reg [23:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat;
reg  alpha_blend_legup_valid_bit_0;
reg  alpha_blend_legup_state_stall_0;
reg  alpha_blend_legup_state_enable_0;
reg  alpha_blend_legup_valid_bit_1;
reg  alpha_blend_legup_state_stall_1;
reg  alpha_blend_legup_state_enable_1;
reg  alpha_blend_legup_II_counter;
reg  input_fifo_channel1_consumed_valid;
reg [23:0] input_fifo_channel1_consumed_data;
reg  input_fifo_channel1_consumed_taken;
reg  input_fifo_channel2_consumed_valid;
reg [23:0] input_fifo_channel2_consumed_data;
reg  input_fifo_channel2_consumed_taken;
reg  input_fifo_alpha_consumed_valid;
reg [7:0] input_fifo_alpha_consumed_data;
reg  input_fifo_alpha_consumed_taken;
wire [7:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat17_bit_select_operand_0;
wire [55:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat16_bit_select_operand_0;
wire [16:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat14_bit_select_operand_0;
reg  legup_mult_signed_33_64_1_0_clock;
reg  legup_mult_signed_33_64_1_0_aclr;
reg  legup_mult_signed_33_64_1_0_clken;
reg [32:0] legup_mult_signed_33_64_1_0_dataa;
reg [63:0] legup_mult_signed_33_64_1_0_datab;
wire [96:0] legup_mult_signed_33_64_1_0_result;
reg [96:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_out_actual;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_out;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_en;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_en_pipeline_cond;
wire [55:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat13_bit_select_operand_0;
wire [47:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat11_bit_select_operand_0;
reg  legup_mult_unsigned_64_64_1_1_clock;
reg  legup_mult_unsigned_64_64_1_1_aclr;
reg  legup_mult_unsigned_64_64_1_1_clken;
reg [63:0] legup_mult_unsigned_64_64_1_1_dataa;
reg [63:0] legup_mult_unsigned_64_64_1_1_datab;
wire [63:0] legup_mult_unsigned_64_64_1_1_result;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_out_actual;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_out;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_en;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_en_pipeline_cond;
wire [55:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat10_bit_select_operand_0;
reg  legup_mult_signed_33_64_1_2_clock;
reg  legup_mult_signed_33_64_1_2_aclr;
reg  legup_mult_signed_33_64_1_2_clken;
reg [32:0] legup_mult_signed_33_64_1_2_dataa;
reg [63:0] legup_mult_signed_33_64_1_2_datab;
wire [96:0] legup_mult_signed_33_64_1_2_result;
reg [96:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_out_actual;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_out;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_en;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_en_pipeline_cond;
wire [55:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat8_bit_select_operand_0;
reg  legup_mult_unsigned_64_64_1_3_clock;
reg  legup_mult_unsigned_64_64_1_3_aclr;
reg  legup_mult_unsigned_64_64_1_3_clken;
reg [63:0] legup_mult_unsigned_64_64_1_3_dataa;
reg [63:0] legup_mult_unsigned_64_64_1_3_datab;
wire [63:0] legup_mult_unsigned_64_64_1_3_result;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_out_actual;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_out;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_en;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_en_pipeline_cond;
wire [55:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat6_bit_select_operand_0;
reg  legup_mult_signed_33_64_1_4_clock;
reg  legup_mult_signed_33_64_1_4_aclr;
reg  legup_mult_signed_33_64_1_4_clken;
reg [32:0] legup_mult_signed_33_64_1_4_dataa;
reg [63:0] legup_mult_signed_33_64_1_4_datab;
wire [96:0] legup_mult_signed_33_64_1_4_result;
reg [96:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_out_actual;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_out;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_en;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_en_pipeline_cond;
wire [55:0] alpha_blend_legup_EEcvyEv_exit203_bit_concat4_bit_select_operand_0;
reg  legup_mult_unsigned_64_64_1_5_clock;
reg  legup_mult_unsigned_64_64_1_5_aclr;
reg  legup_mult_unsigned_64_64_1_5_clken;
reg [63:0] legup_mult_unsigned_64_64_1_5_dataa;
reg [63:0] legup_mult_unsigned_64_64_1_5_datab;
wire [63:0] legup_mult_unsigned_64_64_1_5_result;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_out_actual;
reg [63:0] legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_out;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_en;
reg  legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_en_pipeline_cond;
reg  output_fifo_alpha_blend_legup_state_1_not_accessed_due_to_stall_a;
reg  output_fifo_alpha_blend_legup_state_1_stalln_reg;
reg  output_fifo_alpha_blend_legup_state_1_enable_cond_a;

/*   %mul = mul i64 %5, %bit_concat16, !dbg !3869, !MSB !3864, !LSB !3857, !extendFrom !3864, !legup.pipeline.start_time !3857, !legup.pipeline.avail_time !3871, !legup.pipeline.stage !3857*/
legup_mult legup_mult_signed_33_64_1_0 (
	.clock (legup_mult_signed_33_64_1_0_clock),
	.aclr (legup_mult_signed_33_64_1_0_aclr),
	.clken (legup_mult_signed_33_64_1_0_clken),
	.dataa (legup_mult_signed_33_64_1_0_dataa),
	.datab (legup_mult_signed_33_64_1_0_datab),
	.result (legup_mult_signed_33_64_1_0_result)
);

defparam
	legup_mult_signed_33_64_1_0.widtha = 33,
	legup_mult_signed_33_64_1_0.widthb = 64,
	legup_mult_signed_33_64_1_0.widthp = 97,
	legup_mult_signed_33_64_1_0.pipeline = 1,
	legup_mult_signed_33_64_1_0.representation = "SIGNED",
	legup_mult_signed_33_64_1_0.preserve_module_hierarchy = 0;

/*   %mul10 = mul i64 %bit_concat11, %bit_concat13, !dbg !3872, !MSB !3864, !LSB !3857, !extendFrom !3864, !legup.pipeline.start_time !3857, !legup.pipeline.avail_time !3871, !legup.pipeline.stage !3857*/
legup_mult legup_mult_unsigned_64_64_1_1 (
	.clock (legup_mult_unsigned_64_64_1_1_clock),
	.aclr (legup_mult_unsigned_64_64_1_1_aclr),
	.clken (legup_mult_unsigned_64_64_1_1_clken),
	.dataa (legup_mult_unsigned_64_64_1_1_dataa),
	.datab (legup_mult_unsigned_64_64_1_1_datab),
	.result (legup_mult_unsigned_64_64_1_1_result)
);

defparam
	legup_mult_unsigned_64_64_1_1.widtha = 64,
	legup_mult_unsigned_64_64_1_1.widthb = 64,
	legup_mult_unsigned_64_64_1_1.widthp = 64,
	legup_mult_unsigned_64_64_1_1.pipeline = 1,
	legup_mult_unsigned_64_64_1_1.representation = "UNSIGNED",
	legup_mult_unsigned_64_64_1_1.preserve_module_hierarchy = 0;

/*   %mul19 = mul i64 %5, %bit_concat10, !dbg !3873, !MSB !3864, !LSB !3857, !extendFrom !3864, !legup.pipeline.start_time !3857, !legup.pipeline.avail_time !3871, !legup.pipeline.stage !3857*/
legup_mult legup_mult_signed_33_64_1_2 (
	.clock (legup_mult_signed_33_64_1_2_clock),
	.aclr (legup_mult_signed_33_64_1_2_aclr),
	.clken (legup_mult_signed_33_64_1_2_clken),
	.dataa (legup_mult_signed_33_64_1_2_dataa),
	.datab (legup_mult_signed_33_64_1_2_datab),
	.result (legup_mult_signed_33_64_1_2_result)
);

defparam
	legup_mult_signed_33_64_1_2.widtha = 33,
	legup_mult_signed_33_64_1_2.widthb = 64,
	legup_mult_signed_33_64_1_2.widthp = 97,
	legup_mult_signed_33_64_1_2.pipeline = 1,
	legup_mult_signed_33_64_1_2.representation = "SIGNED",
	legup_mult_signed_33_64_1_2.preserve_module_hierarchy = 0;

/*   %mul24 = mul i64 %bit_concat11, %bit_concat8, !dbg !3874, !MSB !3864, !LSB !3857, !extendFrom !3864, !legup.pipeline.start_time !3857, !legup.pipeline.avail_time !3871, !legup.pipeline.stage !3857*/
legup_mult legup_mult_unsigned_64_64_1_3 (
	.clock (legup_mult_unsigned_64_64_1_3_clock),
	.aclr (legup_mult_unsigned_64_64_1_3_aclr),
	.clken (legup_mult_unsigned_64_64_1_3_clken),
	.dataa (legup_mult_unsigned_64_64_1_3_dataa),
	.datab (legup_mult_unsigned_64_64_1_3_datab),
	.result (legup_mult_unsigned_64_64_1_3_result)
);

defparam
	legup_mult_unsigned_64_64_1_3.widtha = 64,
	legup_mult_unsigned_64_64_1_3.widthb = 64,
	legup_mult_unsigned_64_64_1_3.widthp = 64,
	legup_mult_unsigned_64_64_1_3.pipeline = 1,
	legup_mult_unsigned_64_64_1_3.representation = "UNSIGNED",
	legup_mult_unsigned_64_64_1_3.preserve_module_hierarchy = 0;

/*   %mul35 = mul i64 %5, %bit_concat6, !dbg !3875, !MSB !3864, !LSB !3857, !extendFrom !3864, !legup.pipeline.start_time !3857, !legup.pipeline.avail_time !3871, !legup.pipeline.stage !3857*/
legup_mult legup_mult_signed_33_64_1_4 (
	.clock (legup_mult_signed_33_64_1_4_clock),
	.aclr (legup_mult_signed_33_64_1_4_aclr),
	.clken (legup_mult_signed_33_64_1_4_clken),
	.dataa (legup_mult_signed_33_64_1_4_dataa),
	.datab (legup_mult_signed_33_64_1_4_datab),
	.result (legup_mult_signed_33_64_1_4_result)
);

defparam
	legup_mult_signed_33_64_1_4.widtha = 33,
	legup_mult_signed_33_64_1_4.widthb = 64,
	legup_mult_signed_33_64_1_4.widthp = 97,
	legup_mult_signed_33_64_1_4.pipeline = 1,
	legup_mult_signed_33_64_1_4.representation = "SIGNED",
	legup_mult_signed_33_64_1_4.preserve_module_hierarchy = 0;

/*   %mul40 = mul i64 %bit_concat11, %bit_concat4, !dbg !3876, !MSB !3864, !LSB !3857, !extendFrom !3864, !legup.pipeline.start_time !3857, !legup.pipeline.avail_time !3871, !legup.pipeline.stage !3857*/
legup_mult legup_mult_unsigned_64_64_1_5 (
	.clock (legup_mult_unsigned_64_64_1_5_clock),
	.aclr (legup_mult_unsigned_64_64_1_5_aclr),
	.clken (legup_mult_unsigned_64_64_1_5_clken),
	.dataa (legup_mult_unsigned_64_64_1_5_dataa),
	.datab (legup_mult_unsigned_64_64_1_5_datab),
	.result (legup_mult_unsigned_64_64_1_5_result)
);

defparam
	legup_mult_unsigned_64_64_1_5.widtha = 64,
	legup_mult_unsigned_64_64_1_5.widthb = 64,
	legup_mult_unsigned_64_64_1_5.widthp = 64,
	legup_mult_unsigned_64_64_1_5.pipeline = 1,
	legup_mult_unsigned_64_64_1_5.representation = "UNSIGNED",
	legup_mult_unsigned_64_64_1_5.preserve_module_hierarchy = 0;


always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_0 = input_fifo_channel1_consumed_data;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select15 = alpha_blend_legup_EEcvyEv_exit203_0[23:16];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select9 = alpha_blend_legup_EEcvyEv_exit203_0[15:8];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select5 = alpha_blend_legup_EEcvyEv_exit203_0[7:0];
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_1 = input_fifo_channel2_consumed_data;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select12 = alpha_blend_legup_EEcvyEv_exit203_1[23:16];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select7 = alpha_blend_legup_EEcvyEv_exit203_1[15:8];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select3 = alpha_blend_legup_EEcvyEv_exit203_1[7:0];
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_2 = input_fifo_alpha_consumed_data;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat17 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat17_bit_select_operand_0[7:0], alpha_blend_legup_EEcvyEv_exit203_2[7:0]};
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_3 = (alpha_blend_legup_EEcvyEv_exit203_bit_concat17 + 16'd1);
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat16 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat16_bit_select_operand_0[55:0], alpha_blend_legup_EEcvyEv_exit203_bit_select15[7:0]};
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat14 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat14_bit_select_operand_0[16:0], alpha_blend_legup_EEcvyEv_exit203_3[15:0]};
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_4 = (33'd256 - alpha_blend_legup_EEcvyEv_exit203_bit_concat14);
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_5 = $signed(alpha_blend_legup_EEcvyEv_exit203_4);
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_mul = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_out;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat13 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat13_bit_select_operand_0[55:0], alpha_blend_legup_EEcvyEv_exit203_bit_select12[7:0]};
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat11 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat11_bit_select_operand_0[47:0], alpha_blend_legup_EEcvyEv_exit203_3[15:0]};
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_mul10 = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_out;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_add = (alpha_blend_legup_EEcvyEv_exit203_mul + alpha_blend_legup_EEcvyEv_exit203_mul10);
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select = alpha_blend_legup_EEcvyEv_exit203_add[15:8];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat10 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat10_bit_select_operand_0[55:0], alpha_blend_legup_EEcvyEv_exit203_bit_select9[7:0]};
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_mul19 = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_out;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat8 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat8_bit_select_operand_0[55:0], alpha_blend_legup_EEcvyEv_exit203_bit_select7[7:0]};
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_mul24 = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_out;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_add25 = (alpha_blend_legup_EEcvyEv_exit203_mul19 + alpha_blend_legup_EEcvyEv_exit203_mul24);
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select1 = alpha_blend_legup_EEcvyEv_exit203_add25[15:8];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat6 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat6_bit_select_operand_0[55:0], alpha_blend_legup_EEcvyEv_exit203_bit_select5[7:0]};
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_mul35 = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_out;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat4 = {alpha_blend_legup_EEcvyEv_exit203_bit_concat4_bit_select_operand_0[55:0], alpha_blend_legup_EEcvyEv_exit203_bit_select3[7:0]};
end
always @(*) begin
	alpha_blend_legup_EEcvyEv_exit203_mul40 = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_out;
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_add41 = (alpha_blend_legup_EEcvyEv_exit203_mul35 + alpha_blend_legup_EEcvyEv_exit203_mul40);
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_select2 = alpha_blend_legup_EEcvyEv_exit203_add41[15:8];
end
always @(*) begin
		alpha_blend_legup_EEcvyEv_exit203_bit_concat = {{alpha_blend_legup_EEcvyEv_exit203_bit_select[7:0], alpha_blend_legup_EEcvyEv_exit203_bit_select1[7:0]}, alpha_blend_legup_EEcvyEv_exit203_bit_select2[7:0]};
end
always @(posedge clk) begin
	if (~(alpha_blend_legup_state_stall_0)) begin
		alpha_blend_legup_valid_bit_0 <= (alpha_blend_legup_II_counter & start);
	end
	if (reset) begin
		alpha_blend_legup_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	alpha_blend_legup_state_stall_0 = 1'd0;
	if (alpha_blend_legup_state_stall_1) begin
		alpha_blend_legup_state_stall_0 = 1'd1;
	end
	if ((alpha_blend_legup_valid_bit_0 & ~(input_fifo_channel1_consumed_valid))) begin
		alpha_blend_legup_state_stall_0 = 1'd1;
	end
	if ((alpha_blend_legup_valid_bit_0 & ~(input_fifo_channel2_consumed_valid))) begin
		alpha_blend_legup_state_stall_0 = 1'd1;
	end
	if ((alpha_blend_legup_valid_bit_0 & ~(input_fifo_alpha_consumed_valid))) begin
		alpha_blend_legup_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	alpha_blend_legup_state_enable_0 = (alpha_blend_legup_valid_bit_0 & ~(alpha_blend_legup_state_stall_0));
end
always @(posedge clk) begin
	if (~(alpha_blend_legup_state_stall_1)) begin
		alpha_blend_legup_valid_bit_1 <= alpha_blend_legup_state_enable_0;
	end
	if (reset) begin
		alpha_blend_legup_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	alpha_blend_legup_state_stall_1 = 1'd0;
	if ((((alpha_blend_legup_valid_bit_1 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_alpha_blend_legup_state_1_not_accessed_due_to_stall_a | output_fifo_alpha_blend_legup_state_1_stalln_reg))) begin
		alpha_blend_legup_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	alpha_blend_legup_state_enable_1 = (alpha_blend_legup_valid_bit_1 & ~(alpha_blend_legup_state_stall_1));
end
always @(posedge clk) begin
	alpha_blend_legup_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (input_fifo_channel1_consumed_taken) begin
		input_fifo_channel1_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_channel1_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_channel1_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_channel1_consumed_data <= input_fifo_channel1;
	end
	if (reset) begin
		input_fifo_channel1_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_channel1_consumed_taken = 1'd0;
	if (alpha_blend_legup_valid_bit_0) begin
		input_fifo_channel1_consumed_taken = ~(alpha_blend_legup_state_stall_0);
	end
end
always @(posedge clk) begin
	if (input_fifo_channel2_consumed_taken) begin
		input_fifo_channel2_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_channel2_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_channel2_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_channel2_consumed_data <= input_fifo_channel2;
	end
	if (reset) begin
		input_fifo_channel2_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_channel2_consumed_taken = 1'd0;
	if (alpha_blend_legup_valid_bit_0) begin
		input_fifo_channel2_consumed_taken = ~(alpha_blend_legup_state_stall_0);
	end
end
always @(posedge clk) begin
	if (input_fifo_alpha_consumed_taken) begin
		input_fifo_alpha_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_alpha_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_alpha_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_alpha_consumed_data <= input_fifo_alpha;
	end
	if (reset) begin
		input_fifo_alpha_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_alpha_consumed_taken = 1'd0;
	if (alpha_blend_legup_valid_bit_0) begin
		input_fifo_alpha_consumed_taken = ~(alpha_blend_legup_state_stall_0);
	end
end
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat17_bit_select_operand_0 = 8'd0;
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat16_bit_select_operand_0 = 56'd0;
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat14_bit_select_operand_0 = 17'd0;
always @(*) begin
	legup_mult_signed_33_64_1_0_clock = clk;
end
always @(*) begin
	legup_mult_signed_33_64_1_0_aclr = reset;
end
always @(*) begin
	legup_mult_signed_33_64_1_0_clken = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_en;
end
always @(*) begin
	legup_mult_signed_33_64_1_0_dataa = alpha_blend_legup_EEcvyEv_exit203_5;
end
always @(*) begin
	legup_mult_signed_33_64_1_0_datab = alpha_blend_legup_EEcvyEv_exit203_bit_concat16;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_out_actual = legup_mult_signed_33_64_1_0_result;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_out = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_out_actual[63:0];
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_en = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_en_pipeline_cond;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul_en_pipeline_cond = ~(alpha_blend_legup_state_stall_1);
end
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat13_bit_select_operand_0 = 56'd0;
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat11_bit_select_operand_0 = 48'd0;
always @(*) begin
	legup_mult_unsigned_64_64_1_1_clock = clk;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_1_aclr = reset;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_1_clken = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_en;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_1_dataa = alpha_blend_legup_EEcvyEv_exit203_bit_concat11;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_1_datab = alpha_blend_legup_EEcvyEv_exit203_bit_concat13;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_out_actual = legup_mult_unsigned_64_64_1_1_result;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_out = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_out_actual[63:0];
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_en = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_en_pipeline_cond;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul10_en_pipeline_cond = ~(alpha_blend_legup_state_stall_1);
end
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat10_bit_select_operand_0 = 56'd0;
always @(*) begin
	legup_mult_signed_33_64_1_2_clock = clk;
end
always @(*) begin
	legup_mult_signed_33_64_1_2_aclr = reset;
end
always @(*) begin
	legup_mult_signed_33_64_1_2_clken = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_en;
end
always @(*) begin
	legup_mult_signed_33_64_1_2_dataa = alpha_blend_legup_EEcvyEv_exit203_5;
end
always @(*) begin
	legup_mult_signed_33_64_1_2_datab = alpha_blend_legup_EEcvyEv_exit203_bit_concat10;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_out_actual = legup_mult_signed_33_64_1_2_result;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_out = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_out_actual[63:0];
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_en = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_en_pipeline_cond;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul19_en_pipeline_cond = ~(alpha_blend_legup_state_stall_1);
end
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat8_bit_select_operand_0 = 56'd0;
always @(*) begin
	legup_mult_unsigned_64_64_1_3_clock = clk;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_3_aclr = reset;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_3_clken = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_en;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_3_dataa = alpha_blend_legup_EEcvyEv_exit203_bit_concat11;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_3_datab = alpha_blend_legup_EEcvyEv_exit203_bit_concat8;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_out_actual = legup_mult_unsigned_64_64_1_3_result;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_out = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_out_actual[63:0];
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_en = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_en_pipeline_cond;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul24_en_pipeline_cond = ~(alpha_blend_legup_state_stall_1);
end
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat6_bit_select_operand_0 = 56'd0;
always @(*) begin
	legup_mult_signed_33_64_1_4_clock = clk;
end
always @(*) begin
	legup_mult_signed_33_64_1_4_aclr = reset;
end
always @(*) begin
	legup_mult_signed_33_64_1_4_clken = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_en;
end
always @(*) begin
	legup_mult_signed_33_64_1_4_dataa = alpha_blend_legup_EEcvyEv_exit203_5;
end
always @(*) begin
	legup_mult_signed_33_64_1_4_datab = alpha_blend_legup_EEcvyEv_exit203_bit_concat6;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_out_actual = legup_mult_signed_33_64_1_4_result;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_out = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_out_actual[63:0];
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_en = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_en_pipeline_cond;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul35_en_pipeline_cond = ~(alpha_blend_legup_state_stall_1);
end
assign alpha_blend_legup_EEcvyEv_exit203_bit_concat4_bit_select_operand_0 = 56'd0;
always @(*) begin
	legup_mult_unsigned_64_64_1_5_clock = clk;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_5_aclr = reset;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_5_clken = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_en;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_5_dataa = alpha_blend_legup_EEcvyEv_exit203_bit_concat11;
end
always @(*) begin
	legup_mult_unsigned_64_64_1_5_datab = alpha_blend_legup_EEcvyEv_exit203_bit_concat4;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_out_actual = legup_mult_unsigned_64_64_1_5_result;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_out = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_out_actual[63:0];
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_en = legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_en_pipeline_cond;
end
always @(*) begin
	legup_mult_alpha_blend_legup_EEcvyEv_exit203_mul40_en_pipeline_cond = ~(alpha_blend_legup_state_stall_1);
end
always @(posedge clk) begin
	output_fifo_alpha_blend_legup_state_1_not_accessed_due_to_stall_a <= ((alpha_blend_legup_state_stall_1 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_alpha_blend_legup_state_1_stalln_reg <= ~(alpha_blend_legup_state_stall_1);
end
always @(*) begin
	output_fifo_alpha_blend_legup_state_1_enable_cond_a = (alpha_blend_legup_valid_bit_1 & (output_fifo_alpha_blend_legup_state_1_not_accessed_due_to_stall_a | output_fifo_alpha_blend_legup_state_1_stalln_reg));
end
always @(*) begin
	ready = ~(alpha_blend_legup_state_stall_0);
end
always @(posedge clk) begin
	finish <= alpha_blend_legup_state_enable_1;
end
always @(*) begin
	input_fifo_ready = (~(input_fifo_alpha_consumed_valid) | input_fifo_alpha_consumed_taken);
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
		output_fifo = alpha_blend_legup_EEcvyEv_exit203_bit_concat;
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if (output_fifo_alpha_blend_legup_state_1_enable_cond_a) begin
		output_fifo_valid = 1'd1;
	end
end

endmodule
