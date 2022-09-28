// ----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 9.2
// Copyright (c) 2015-2021 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: legup@microchip.com
// Date: Wed Apr  7 10:34:09 2021
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
module gaussian_filter_pipelined_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	on_switch,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input  on_switch;
input [7:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
output reg [7:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg  gaussian_filter_pipelined_inst_clk;
reg  gaussian_filter_pipelined_inst_reset;
reg  gaussian_filter_pipelined_inst_start;
wire  gaussian_filter_pipelined_inst_ready;
wire  gaussian_filter_pipelined_inst_finish;
reg  gaussian_filter_pipelined_inst_on_switch;
reg [7:0] gaussian_filter_pipelined_inst_input_fifo;
wire  gaussian_filter_pipelined_inst_input_fifo_ready;
reg  gaussian_filter_pipelined_inst_input_fifo_valid;
wire [7:0] gaussian_filter_pipelined_inst_output_fifo;
reg  gaussian_filter_pipelined_inst_output_fifo_ready;
wire  gaussian_filter_pipelined_inst_output_fifo_valid;
reg  gaussian_filter_pipelined_inst_finish_reg;


gaussian_filter_pipelined gaussian_filter_pipelined_inst (
	.clk (gaussian_filter_pipelined_inst_clk),
	.reset (gaussian_filter_pipelined_inst_reset),
	.start (gaussian_filter_pipelined_inst_start),
	.ready (gaussian_filter_pipelined_inst_ready),
	.finish (gaussian_filter_pipelined_inst_finish),
	.on_switch (gaussian_filter_pipelined_inst_on_switch),
	.input_fifo (gaussian_filter_pipelined_inst_input_fifo),
	.input_fifo_ready (gaussian_filter_pipelined_inst_input_fifo_ready),
	.input_fifo_valid (gaussian_filter_pipelined_inst_input_fifo_valid),
	.output_fifo (gaussian_filter_pipelined_inst_output_fifo),
	.output_fifo_ready (gaussian_filter_pipelined_inst_output_fifo_ready),
	.output_fifo_valid (gaussian_filter_pipelined_inst_output_fifo_valid)
);



always @(*) begin
	gaussian_filter_pipelined_inst_clk = clk;
end
always @(*) begin
	gaussian_filter_pipelined_inst_reset = reset;
end
always @(*) begin
	gaussian_filter_pipelined_inst_start = start;
end
always @(*) begin
	gaussian_filter_pipelined_inst_on_switch = on_switch;
end
always @(*) begin
	gaussian_filter_pipelined_inst_input_fifo = input_fifo;
end
always @(*) begin
	gaussian_filter_pipelined_inst_input_fifo_valid = input_fifo_valid;
end
always @(*) begin
	gaussian_filter_pipelined_inst_output_fifo_ready = output_fifo_ready;
end
always @(posedge clk) begin
	if ((reset | gaussian_filter_pipelined_inst_start)) begin
		gaussian_filter_pipelined_inst_finish_reg <= 1'd0;
	end
	if (gaussian_filter_pipelined_inst_finish) begin
		gaussian_filter_pipelined_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = gaussian_filter_pipelined_inst_ready;
end
always @(*) begin
	finish = gaussian_filter_pipelined_inst_finish;
end
always @(*) begin
	input_fifo_ready = gaussian_filter_pipelined_inst_input_fifo_ready;
end
always @(*) begin
	output_fifo = gaussian_filter_pipelined_inst_output_fifo;
end
always @(*) begin
	output_fifo_valid = gaussian_filter_pipelined_inst_output_fifo_valid;
end

endmodule
`timescale 1 ns / 1 ns
module gaussian_filter_pipelined
(
	clk,
	reset,
	start,
	ready,
	finish,
	on_switch,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input  on_switch;
input [7:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
output reg [7:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg  on_switch_reg;
reg [7:0] gaussian_filter_pipelined_entry_1;
reg [7:0] gaussian_filter_pipelined_entry_3;
reg [7:0] gaussian_filter_pipelined_entry_4;
reg [7:0] gaussian_filter_pipelined_entry_5;
reg [7:0] gaussian_filter_pipelined_entry_6;
reg [7:0] gaussian_filter_pipelined_entry_8;
reg [7:0] gaussian_filter_pipelined_entry_9;
reg [7:0] gaussian_filter_pipelined_entry_10;
reg [7:0] gaussian_filter_pipelined_entry_11;
reg [7:0] gaussian_filter_pipelined_entry_13;
reg [7:0] gaussian_filter_pipelined_entry_14;
reg [7:0] gaussian_filter_pipelined_entry_15;
reg [7:0] gaussian_filter_pipelined_entry_16;
reg [7:0] gaussian_filter_pipelined_entry_18;
reg [7:0] gaussian_filter_pipelined_entry_19;
reg [7:0] gaussian_filter_pipelined_entry_20;
reg [7:0] gaussian_filter_pipelined_entry_21;
reg [7:0] gaussian_filter_pipelined_entry_23;
reg [7:0] gaussian_filter_pipelined_entry_24;
reg [7:0] gaussian_filter_pipelined_entry_25;
reg [31:0] gaussian_filter_pipelined_entry_26;
reg [31:0] gaussian_filter_pipelined_entry_27;
reg [31:0] gaussian_filter_pipelined_entry_28;
reg [31:0] gaussian_filter_pipelined_entry_29;
wire  gaussian_filter_pipelined_entry_30;
reg  gaussian_filter_pipelined_entry_NotCondition;
reg [7:0] gaussian_filter_pipelined_entry_31;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_32;
reg [7:0] gaussian_filter_pipelined_entry_33;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_34;
reg [7:0] gaussian_filter_pipelined_entry_35;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_36;
reg [7:0] gaussian_filter_pipelined_entry_37;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_38;
reg [7:0] gaussian_filter_pipelined_entry_39;
reg  gaussian_filter_pipelined_entry_cmp46_i;
reg [31:0] gaussian_filter_pipelined_entry_add50_i;
reg [31:0] gaussian_filter_pipelined_entry_add50_i_var0;
reg  gaussian_filter_pipelined_entry_cmp_i;
reg  gaussian_filter_pipelined_entry_exitMask_T1;
reg [31:0] gaussian_filter_pipelined_entry_off;
reg  gaussian_filter_pipelined_entry_40;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat43;
reg  gaussian_filter_pipelined_entry_cmp4_i;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat42;
reg [31:0] gaussian_filter_pipelined_entry_or6_i;
reg  gaussian_filter_pipelined_entry_cmp9_i;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat41;
reg [31:0] gaussian_filter_pipelined_entry_or11_i;
reg  gaussian_filter_pipelined_entry_tobool_i;
reg  gaussian_filter_pipelined_entry_cmp_i2;
reg  gaussian_filter_pipelined_entry_exitMask_T4;
reg [31:0] gaussian_filter_pipelined_entry_inc_i;
reg  gaussian_filter_pipelined_entry_cmp1_i;
reg  gaussian_filter_pipelined_entry_cmp2_i3;
reg  gaussian_filter_pipelined_entry_or_cond_i;
reg [31:0] gaussian_filter_pipelined_entry_inc5_i;
reg [31:0] gaussian_filter_pipelined_entry_inc5_i_var1;
reg [31:0] gaussian_filter_pipelined_entry_select11;
reg [31:0] gaussian_filter_pipelined_entry_select;
reg  gaussian_filter_pipelined_entry_41;
reg  gaussian_filter_pipelined_entry_brmerge;
reg  gaussian_filter_pipelined_entry_exitMask_T7;
reg  gaussian_filter_pipelined_entry_tobool_i_not;
reg  gaussian_filter_pipelined_entry_NotCondition8;
reg  gaussian_filter_pipelined_entry_exitMask_F9;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat40;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat39;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat38;
reg [31:0] gaussian_filter_pipelined_entry_sr_add3;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat37;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_add_2;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_add_2;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat36;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat35;
reg [31:0] gaussian_filter_pipelined_entry_sr_add5;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat34;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat33;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat32;
reg [31:0] gaussian_filter_pipelined_entry_sr_add8;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat31;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly_;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat30;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat29;
reg [31:0] gaussian_filter_pipelined_entry_sr_add11;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var2;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat28;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat27;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat26;
reg [31:0] gaussian_filter_pipelined_entry_sr_add13;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat25;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat24;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat23;
reg [31:0] gaussian_filter_pipelined_entry_sr_add16;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat22;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat21;
reg [31:0] gaussian_filter_pipelined_entry_sr_add19;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat20;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat19;
reg [31:0] gaussian_filter_pipelined_entry_sr_add22;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_add_1_1;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat18;
reg [31:0] gaussian_filter_pipelined_entry_mul_291;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat17;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat16;
reg [31:0] gaussian_filter_pipelined_entry_sr_add24;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var3;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat15;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat14;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat13;
reg [31:0] gaussian_filter_pipelined_entry_sr_add28;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var4;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat12;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var5;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat11;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat10;
reg [31:0] gaussian_filter_pipelined_entry_sr_add30;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var6;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat9;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var7;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly_;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat8;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat7;
reg [31:0] gaussian_filter_pipelined_entry_sr_add32;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var8;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var9;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat6;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_add_2302;
reg [29:0] gaussian_filter_pipelined_entry_bit_select4;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat5;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var10;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat3;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat2;
reg [31:0] gaussian_filter_pipelined_entry_sr_add34;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var11;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var12;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var13;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat1;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var14;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var15;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var16;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var17;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_add_4_4;
reg [7:0] gaussian_filter_pipelined_entry_bit_select;
reg  gaussian_filter_pipelined_entry_ORexitM180;
reg [7:0] gaussian_filter_pipelined_entry_select181;
reg [7:0] gaussian_filter_pipelined_entry_select185;
reg [7:0] gaussian_filter_pipelined_entry_select169;
reg [7:0] gaussian_filter_pipelined_entry_select173;
reg [7:0] gaussian_filter_pipelined_entry_select163;
reg [7:0] gaussian_filter_pipelined_entry_select167;
reg [7:0] gaussian_filter_pipelined_entry_select157;
reg [7:0] gaussian_filter_pipelined_entry_select161;
reg [7:0] gaussian_filter_pipelined_entry_select151;
reg [7:0] gaussian_filter_pipelined_entry_select155;
reg [7:0] gaussian_filter_pipelined_entry_select139;
reg [7:0] gaussian_filter_pipelined_entry_select143;
reg [7:0] gaussian_filter_pipelined_entry_select133;
reg [7:0] gaussian_filter_pipelined_entry_select137;
reg [7:0] gaussian_filter_pipelined_entry_select127;
reg [7:0] gaussian_filter_pipelined_entry_select131;
reg [7:0] gaussian_filter_pipelined_entry_select121;
reg [7:0] gaussian_filter_pipelined_entry_select125;
reg [7:0] gaussian_filter_pipelined_entry_select109;
reg [7:0] gaussian_filter_pipelined_entry_select113;
reg [7:0] gaussian_filter_pipelined_entry_select103;
reg [7:0] gaussian_filter_pipelined_entry_select107;
reg [7:0] gaussian_filter_pipelined_entry_select97;
reg [7:0] gaussian_filter_pipelined_entry_select101;
reg [7:0] gaussian_filter_pipelined_entry_select91;
reg [7:0] gaussian_filter_pipelined_entry_select95;
reg [7:0] gaussian_filter_pipelined_entry_select79;
reg [7:0] gaussian_filter_pipelined_entry_select83;
reg [7:0] gaussian_filter_pipelined_entry_select73;
reg [7:0] gaussian_filter_pipelined_entry_select77;
reg [7:0] gaussian_filter_pipelined_entry_select67;
reg [7:0] gaussian_filter_pipelined_entry_select71;
reg [7:0] gaussian_filter_pipelined_entry_select61;
reg [7:0] gaussian_filter_pipelined_entry_select65;
reg [7:0] gaussian_filter_pipelined_entry_select49;
reg [7:0] gaussian_filter_pipelined_entry_select53;
reg [7:0] gaussian_filter_pipelined_entry_select43;
reg [7:0] gaussian_filter_pipelined_entry_select47;
reg [7:0] gaussian_filter_pipelined_entry_select37;
reg [7:0] gaussian_filter_pipelined_entry_select41;
reg [31:0] gaussian_filter_pipelined_entry_select31;
reg [31:0] gaussian_filter_pipelined_entry_select35;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat;
reg [31:0] gaussian_filter_pipelined_entry_inc;
reg [31:0] gaussian_filter_pipelined_entry_select27;
reg [31:0] gaussian_filter_pipelined_entry_select29;
reg [31:0] gaussian_filter_pipelined_entry_select19;
reg [31:0] gaussian_filter_pipelined_entry_select21;
reg [31:0] gaussian_filter_pipelined_entry_select23;
reg [31:0] gaussian_filter_pipelined_entry_select13;
reg [31:0] gaussian_filter_pipelined_entry_select15;
reg [31:0] gaussian_filter_pipelined_entry_select17;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a0_a1_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a0_a2_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a0_a3_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a0_a4_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a1_a1_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a1_a2_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a1_a3_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a1_a4_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a2_a1_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a2_a2_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a2_a3_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a2_a4_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a3_a1_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a3_a2_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a3_a3_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a3_a4_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a4_a1_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a4_a2_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a4_a3_inferred_reg;
reg [7:0] gaussian_filter_pipelined_line_buffer_window_a4_a4_inferred_reg;
reg [31:0] gaussian_filter_pipelined_line_buffer_prev_row_ind_inferred_reg;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a0__clken;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__address_a;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a0__read_en_a;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__address_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_b;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_b;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_b;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a0__read_en_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a1__clken;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__address_a;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a1__read_en_a;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__address_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_b;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_b;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_b;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a1__read_en_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a2__clken;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__address_a;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a2__read_en_a;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__address_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_b;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_b;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_b;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a2__read_en_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a3__clken;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__address_a;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_a;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a3__read_en_a;
reg [10:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__address_b;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_b;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_b;
wire [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_b;
wire  gaussian_filter_pipelined_line_buffer_prev_row_a3__read_en_b;
reg [31:0] gaussian_filter_pipelined_count_inferred_reg;
reg [31:0] gaussian_filter_pipelined_i_inferred_reg;
reg [31:0] gaussian_filter_pipelined_j_inferred_reg;
reg  gaussian_filter_pipelined_valid_bit_0;
reg  gaussian_filter_pipelined_state_stall_0;
reg  gaussian_filter_pipelined_state_enable_0;
reg  gaussian_filter_pipelined_valid_bit_1;
reg  gaussian_filter_pipelined_state_stall_1;
reg  gaussian_filter_pipelined_state_enable_1;
reg  gaussian_filter_pipelined_valid_bit_2;
reg  gaussian_filter_pipelined_state_stall_2;
reg  gaussian_filter_pipelined_state_enable_2;
reg  gaussian_filter_pipelined_valid_bit_3;
reg  gaussian_filter_pipelined_state_stall_3;
reg  gaussian_filter_pipelined_state_enable_3;
reg  gaussian_filter_pipelined_valid_bit_4;
reg  gaussian_filter_pipelined_state_stall_4;
reg  gaussian_filter_pipelined_state_enable_4;
reg  gaussian_filter_pipelined_valid_bit_5;
wire  gaussian_filter_pipelined_state_stall_5;
reg  gaussian_filter_pipelined_state_enable_5;
reg  gaussian_filter_pipelined_II_counter;
reg [7:0] gaussian_filter_pipelined_entry_14_reg_stage3;
reg [7:0] gaussian_filter_pipelined_entry_14_reg_stage4;
reg  gaussian_filter_pipelined_entry_30_reg_stage1;
reg  gaussian_filter_pipelined_entry_30_reg_stage2;
reg  gaussian_filter_pipelined_entry_30_reg_stage3;
reg  gaussian_filter_pipelined_entry_30_reg_stage4;
reg  gaussian_filter_pipelined_entry_NotCondition_reg_stage1;
reg  gaussian_filter_pipelined_entry_NotCondition_reg_stage2;
reg  gaussian_filter_pipelined_entry_NotCondition_reg_stage3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_32_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_32_reg_stage2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_32_reg_stage3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_34_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_34_reg_stage2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_pipelined_entry_36_reg_stage1;
reg  gaussian_filter_pipelined_entry_exitMask_T7_reg_stage1;
reg  gaussian_filter_pipelined_entry_exitMask_T7_reg_stage2;
reg  gaussian_filter_pipelined_entry_exitMask_T7_reg_stage3;
reg  gaussian_filter_pipelined_entry_exitMask_T7_reg_stage4;
reg  gaussian_filter_pipelined_entry_exitMask_F9_reg_stage1;
reg  gaussian_filter_pipelined_entry_exitMask_F9_reg_stage2;
reg  gaussian_filter_pipelined_entry_exitMask_F9_reg_stage3;
reg  gaussian_filter_pipelined_entry_exitMask_F9_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat31_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_sr_add22_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_sr_add24_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_sr_add28_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_sr_add28_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_sr_add28_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat12_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat12_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat12_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_sr_add30_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_sr_add30_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat9_reg_stage1;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat9_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat9_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var7_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_sr_add32_reg_stage1;
reg [31:0] gaussian_filter_pipelined_entry_sr_add32_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_sr_add32_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var8_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat6_reg_stage1;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat6_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat5_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat5_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_sr_add34_reg_stage1;
reg [31:0] gaussian_filter_pipelined_entry_sr_add34_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var11_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var12_reg_stage4;
reg [31:0] gaussian_filter_pipelined_entry_bit_concat1_reg_stage1;
reg [31:0] gaussian_filter_pipelined_entry_newEarly_newEarly__var14_reg_stage2;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var15_reg_stage3;
reg [31:0] gaussian_filter_pipelined_entry_newCurOp_newEarly__var15_reg_stage4;
reg  gaussian_filter_pipelined_entry_ORexitM180_reg_stage1;
reg  gaussian_filter_pipelined_entry_ORexitM180_reg_stage2;
reg  gaussian_filter_pipelined_entry_ORexitM180_reg_stage3;
reg  gaussian_filter_pipelined_entry_ORexitM180_reg_stage4;
reg  input_fifo_consumed_valid;
reg [7:0] input_fifo_consumed_data;
reg  input_fifo_consumed_taken;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_wire_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a3__clken_pipeline_cond;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_wire_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a2__clken_pipeline_cond;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_wire_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a1__clken_pipeline_cond;
reg [7:0] gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_wire_a;
reg  gaussian_filter_pipelined_line_buffer_prev_row_a0__clken_pipeline_cond;
wire [30:0] gaussian_filter_pipelined_entry_bit_concat43_bit_select_operand_0;
wire [30:0] gaussian_filter_pipelined_entry_bit_concat42_bit_select_operand_0;
wire [30:0] gaussian_filter_pipelined_entry_bit_concat41_bit_select_operand_0;
wire [12:0] gaussian_filter_pipelined_entry_cmp_i2_op1_temp;
reg  output_fifo_gaussian_filter_pipelined_state_4_not_accessed_due_to_stall_a;
reg  output_fifo_gaussian_filter_pipelined_state_4_stalln_reg;
reg  output_fifo_gaussian_filter_pipelined_state_4_enable_cond_a;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat40_bit_select_operand_0;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat39_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat38_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat38_bit_select_operand_4;
wire [21:0] gaussian_filter_pipelined_entry_bit_concat37_bit_select_operand_0;
wire [1:0] gaussian_filter_pipelined_entry_bit_concat37_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat36_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat35_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat35_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat34_bit_select_operand_0;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat33_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat32_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat32_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat31_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat31_bit_select_operand_4;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat30_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat30_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat29_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat29_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat28_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat28_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat27_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat26_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat26_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat25_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat24_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat24_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat23_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat23_bit_select_operand_4;
wire [21:0] gaussian_filter_pipelined_entry_bit_concat22_bit_select_operand_0;
wire [1:0] gaussian_filter_pipelined_entry_bit_concat22_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat21_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat21_bit_select_operand_4;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat20_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat20_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat19_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat19_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat18_bit_select_operand_0;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat17_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat16_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat16_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat15_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat15_bit_select_operand_4;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat14_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat14_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat13_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat13_bit_select_operand_4;
wire [20:0] gaussian_filter_pipelined_entry_bit_concat12_bit_select_operand_0;
wire [2:0] gaussian_filter_pipelined_entry_bit_concat12_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat11_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat10_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat10_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat9_bit_select_operand_0;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat8_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat7_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat7_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat6_bit_select_operand_0;
wire [1:0] gaussian_filter_pipelined_entry_bit_concat5_bit_select_operand_2;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat3_bit_select_operand_0;
wire [22:0] gaussian_filter_pipelined_entry_bit_concat2_bit_select_operand_0;
wire  gaussian_filter_pipelined_entry_bit_concat2_bit_select_operand_4;
wire [23:0] gaussian_filter_pipelined_entry_bit_concat1_bit_select_operand_0;
wire [30:0] gaussian_filter_pipelined_entry_bit_concat_bit_select_operand_0;



// @_ZZ25gaussian_filter_pipelinedN5legup7ap_uintILj1EEERNS_4FIFOIhLb0EEES4_E11line_buffer.prev_row.a0.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_pipelined_line_buffer_prev_row_a0_ (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_pipelined_line_buffer_prev_row_a0__clken ),
	.address_a( gaussian_filter_pipelined_line_buffer_prev_row_a0__address_a ),
	.write_en_a( gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_a ),
	.write_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_a ),
	.address_b( gaussian_filter_pipelined_line_buffer_prev_row_a0__address_b ),
	.write_en_b( gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_b ),
	.write_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_b )
);
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.width_a = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.widthad_a = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.width_be_a = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.numwords_a = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.width_b = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.widthad_b = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.width_be_b = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.numwords_b = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.latency = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a0_.init_file = {`MEM_INIT_DIR, "gaussian_filter_pipelined_line_buffer_prev_row_a0_.mem"};



// @_ZZ25gaussian_filter_pipelinedN5legup7ap_uintILj1EEERNS_4FIFOIhLb0EEES4_E11line_buffer.prev_row.a1.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_pipelined_line_buffer_prev_row_a1_ (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_pipelined_line_buffer_prev_row_a1__clken ),
	.address_a( gaussian_filter_pipelined_line_buffer_prev_row_a1__address_a ),
	.write_en_a( gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_a ),
	.write_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_a ),
	.address_b( gaussian_filter_pipelined_line_buffer_prev_row_a1__address_b ),
	.write_en_b( gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_b ),
	.write_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_b )
);
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.width_a = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.widthad_a = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.width_be_a = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.numwords_a = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.width_b = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.widthad_b = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.width_be_b = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.numwords_b = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.latency = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a1_.init_file = {`MEM_INIT_DIR, "gaussian_filter_pipelined_line_buffer_prev_row_a1_.mem"};



// @_ZZ25gaussian_filter_pipelinedN5legup7ap_uintILj1EEERNS_4FIFOIhLb0EEES4_E11line_buffer.prev_row.a2.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_pipelined_line_buffer_prev_row_a2_ (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_pipelined_line_buffer_prev_row_a2__clken ),
	.address_a( gaussian_filter_pipelined_line_buffer_prev_row_a2__address_a ),
	.write_en_a( gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_a ),
	.write_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_a ),
	.address_b( gaussian_filter_pipelined_line_buffer_prev_row_a2__address_b ),
	.write_en_b( gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_b ),
	.write_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_b )
);
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.width_a = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.widthad_a = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.width_be_a = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.numwords_a = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.width_b = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.widthad_b = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.width_be_b = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.numwords_b = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.latency = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a2_.init_file = {`MEM_INIT_DIR, "gaussian_filter_pipelined_line_buffer_prev_row_a2_.mem"};



// @_ZZ25gaussian_filter_pipelinedN5legup7ap_uintILj1EEERNS_4FIFOIhLb0EEES4_E11line_buffer.prev_row.a3.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_pipelined_line_buffer_prev_row_a3_ (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_pipelined_line_buffer_prev_row_a3__clken ),
	.address_a( gaussian_filter_pipelined_line_buffer_prev_row_a3__address_a ),
	.write_en_a( gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_a ),
	.write_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_a ),
	.address_b( gaussian_filter_pipelined_line_buffer_prev_row_a3__address_b ),
	.write_en_b( gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_b ),
	.write_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_b )
);
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.width_a = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.widthad_a = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.width_be_a = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.numwords_a = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.width_b = 8;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.widthad_b = 11;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.width_be_b = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.numwords_b = 1920;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.latency = 1;
defparam gaussian_filter_pipelined_line_buffer_prev_row_a3_.init_file = {`MEM_INIT_DIR, "gaussian_filter_pipelined_line_buffer_prev_row_a3_.mem"};


always @(posedge clk) begin
	if ((start & ready)) begin
		on_switch_reg <= on_switch;
	end
end
always @(*) begin
		gaussian_filter_pipelined_entry_1 = gaussian_filter_pipelined_line_buffer_window_a0_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_3 = gaussian_filter_pipelined_line_buffer_window_a0_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_4 = gaussian_filter_pipelined_line_buffer_window_a0_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_5 = gaussian_filter_pipelined_line_buffer_window_a0_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_6 = gaussian_filter_pipelined_line_buffer_window_a1_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_8 = gaussian_filter_pipelined_line_buffer_window_a1_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_9 = gaussian_filter_pipelined_line_buffer_window_a1_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_10 = gaussian_filter_pipelined_line_buffer_window_a1_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_11 = gaussian_filter_pipelined_line_buffer_window_a2_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_13 = gaussian_filter_pipelined_line_buffer_window_a2_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_14 = gaussian_filter_pipelined_line_buffer_window_a2_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_15 = gaussian_filter_pipelined_line_buffer_window_a2_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_16 = gaussian_filter_pipelined_line_buffer_window_a3_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_18 = gaussian_filter_pipelined_line_buffer_window_a3_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_19 = gaussian_filter_pipelined_line_buffer_window_a3_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_20 = gaussian_filter_pipelined_line_buffer_window_a3_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_21 = gaussian_filter_pipelined_line_buffer_window_a4_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_23 = gaussian_filter_pipelined_line_buffer_window_a4_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_24 = gaussian_filter_pipelined_line_buffer_window_a4_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_25 = gaussian_filter_pipelined_line_buffer_window_a4_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_26 = gaussian_filter_pipelined_line_buffer_prev_row_ind_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_27 = gaussian_filter_pipelined_count_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_28 = gaussian_filter_pipelined_i_inferred_reg;
end
always @(*) begin
		gaussian_filter_pipelined_entry_29 = gaussian_filter_pipelined_j_inferred_reg;
end
assign gaussian_filter_pipelined_entry_30 = ~(input_fifo_consumed_valid);
always @(*) begin
		gaussian_filter_pipelined_entry_NotCondition = (gaussian_filter_pipelined_entry_30 ^ 1'd1);
end
always @(*) begin
	gaussian_filter_pipelined_entry_31 = input_fifo_consumed_data;
end
always @(*) begin
		gaussian_filter_pipelined_entry_32 = (1'd0 + (1 * gaussian_filter_pipelined_entry_26));
end
always @(*) begin
		gaussian_filter_pipelined_entry_33 = gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_wire_a;
end
always @(*) begin
		gaussian_filter_pipelined_entry_34 = (1'd0 + (1 * gaussian_filter_pipelined_entry_26));
end
always @(*) begin
		gaussian_filter_pipelined_entry_35 = gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_wire_a;
end
always @(*) begin
		gaussian_filter_pipelined_entry_36 = (1'd0 + (1 * gaussian_filter_pipelined_entry_26));
end
always @(*) begin
		gaussian_filter_pipelined_entry_37 = gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_wire_a;
end
always @(*) begin
		gaussian_filter_pipelined_entry_38 = (1'd0 + (1 * gaussian_filter_pipelined_entry_26));
end
always @(*) begin
		gaussian_filter_pipelined_entry_39 = gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_wire_a;
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp46_i = (gaussian_filter_pipelined_entry_26 == 32'd1919);
end
always @(*) begin
		gaussian_filter_pipelined_entry_add50_i = (gaussian_filter_pipelined_entry_26 + 32'd1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_add50_i_var0 = (gaussian_filter_pipelined_entry_cmp46_i ? 32'd0 : gaussian_filter_pipelined_entry_add50_i);
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp_i = (gaussian_filter_pipelined_entry_27 > 32'd3841);
end
always @(*) begin
		gaussian_filter_pipelined_entry_exitMask_T1 = (gaussian_filter_pipelined_entry_cmp_i & gaussian_filter_pipelined_entry_NotCondition);
end
always @(*) begin
		gaussian_filter_pipelined_entry_off = (gaussian_filter_pipelined_entry_28 + $signed(-32'd2));
end
always @(*) begin
		gaussian_filter_pipelined_entry_40 = (gaussian_filter_pipelined_entry_off > 32'd1075);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat43 = {gaussian_filter_pipelined_entry_bit_concat43_bit_select_operand_0[30:0], gaussian_filter_pipelined_entry_40};
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp4_i = (gaussian_filter_pipelined_entry_29 < 32'd2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat42 = {gaussian_filter_pipelined_entry_bit_concat42_bit_select_operand_0[30:0], gaussian_filter_pipelined_entry_cmp4_i};
end
always @(*) begin
		gaussian_filter_pipelined_entry_or6_i = (gaussian_filter_pipelined_entry_bit_concat43 | gaussian_filter_pipelined_entry_bit_concat42);
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp9_i = (gaussian_filter_pipelined_entry_29 > 32'd1917);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat41 = {gaussian_filter_pipelined_entry_bit_concat41_bit_select_operand_0[30:0], gaussian_filter_pipelined_entry_cmp9_i};
end
always @(*) begin
		gaussian_filter_pipelined_entry_or11_i = (gaussian_filter_pipelined_entry_or6_i | gaussian_filter_pipelined_entry_bit_concat41);
end
always @(*) begin
		gaussian_filter_pipelined_entry_tobool_i = (gaussian_filter_pipelined_entry_or11_i != 32'd0);
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp_i2 = ($signed(gaussian_filter_pipelined_entry_29) < $signed({19'd0,gaussian_filter_pipelined_entry_cmp_i2_op1_temp}));
end
always @(*) begin
		gaussian_filter_pipelined_entry_exitMask_T4 = (gaussian_filter_pipelined_entry_exitMask_T1 & gaussian_filter_pipelined_entry_cmp_i2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_inc_i = (gaussian_filter_pipelined_entry_29 + 32'd1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp1_i = (gaussian_filter_pipelined_entry_28 == 32'd1079);
end
always @(*) begin
		gaussian_filter_pipelined_entry_cmp2_i3 = (gaussian_filter_pipelined_entry_29 == 32'd1919);
end
always @(*) begin
		gaussian_filter_pipelined_entry_or_cond_i = (gaussian_filter_pipelined_entry_cmp1_i & gaussian_filter_pipelined_entry_cmp2_i3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_inc5_i = (gaussian_filter_pipelined_entry_28 + 32'd1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_inc5_i_var1 = (gaussian_filter_pipelined_entry_or_cond_i ? 32'd0 : gaussian_filter_pipelined_entry_inc5_i);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select11 = (gaussian_filter_pipelined_entry_exitMask_T4 ? gaussian_filter_pipelined_entry_28 : gaussian_filter_pipelined_entry_inc5_i_var1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select = (gaussian_filter_pipelined_entry_exitMask_T4 ? gaussian_filter_pipelined_entry_inc_i : 32'd0);
end
always @(*) begin
		gaussian_filter_pipelined_entry_41 = (on_switch_reg ^ 1'd1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_brmerge = (gaussian_filter_pipelined_entry_tobool_i | gaussian_filter_pipelined_entry_41);
end
always @(*) begin
		gaussian_filter_pipelined_entry_exitMask_T7 = (gaussian_filter_pipelined_entry_exitMask_T1 & gaussian_filter_pipelined_entry_brmerge);
end
always @(*) begin
		gaussian_filter_pipelined_entry_tobool_i_not = (gaussian_filter_pipelined_entry_tobool_i ^ 1'd1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_NotCondition8 = (on_switch_reg & gaussian_filter_pipelined_entry_tobool_i_not);
end
always @(*) begin
		gaussian_filter_pipelined_entry_exitMask_F9 = (gaussian_filter_pipelined_entry_exitMask_T1 & gaussian_filter_pipelined_entry_NotCondition8);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat40 = {gaussian_filter_pipelined_entry_bit_concat40_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_1[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat39 = {gaussian_filter_pipelined_entry_bit_concat39_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_3[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat38 = {{gaussian_filter_pipelined_entry_bit_concat38_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_3[7:0]}, gaussian_filter_pipelined_entry_bit_concat38_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add3 = (gaussian_filter_pipelined_entry_bit_concat39 + gaussian_filter_pipelined_entry_bit_concat38);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat37 = {{gaussian_filter_pipelined_entry_bit_concat37_bit_select_operand_0[21:0], gaussian_filter_pipelined_entry_4[7:0]}, gaussian_filter_pipelined_entry_bit_concat37_bit_select_operand_4[1:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_add_2 = (gaussian_filter_pipelined_entry_bit_concat40 + gaussian_filter_pipelined_entry_bit_concat37);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_add_2 = (gaussian_filter_pipelined_entry_newEarly_add_2 + gaussian_filter_pipelined_entry_sr_add3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat36 = {gaussian_filter_pipelined_entry_bit_concat36_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_5[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat35 = {{gaussian_filter_pipelined_entry_bit_concat35_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_5[7:0]}, gaussian_filter_pipelined_entry_bit_concat35_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add5 = (gaussian_filter_pipelined_entry_bit_concat36 + gaussian_filter_pipelined_entry_bit_concat35);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat34 = {gaussian_filter_pipelined_entry_bit_concat34_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_33[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat33 = {gaussian_filter_pipelined_entry_bit_concat33_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_6[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat32 = {{gaussian_filter_pipelined_entry_bit_concat32_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_6[7:0]}, gaussian_filter_pipelined_entry_bit_concat32_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add8 = (gaussian_filter_pipelined_entry_bit_concat33 + gaussian_filter_pipelined_entry_bit_concat32);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat31 = {{gaussian_filter_pipelined_entry_bit_concat31_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_8[7:0]}, gaussian_filter_pipelined_entry_bit_concat31_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly_ = (gaussian_filter_pipelined_entry_bit_concat34 + gaussian_filter_pipelined_entry_bit_concat31_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat30 = {{gaussian_filter_pipelined_entry_bit_concat30_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_9[7:0]}, gaussian_filter_pipelined_entry_bit_concat30_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat29 = {{gaussian_filter_pipelined_entry_bit_concat29_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_9[7:0]}, gaussian_filter_pipelined_entry_bit_concat29_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add11 = (gaussian_filter_pipelined_entry_bit_concat30 + gaussian_filter_pipelined_entry_bit_concat29);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var2 = (gaussian_filter_pipelined_entry_sr_add8 + gaussian_filter_pipelined_entry_sr_add11);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat28 = {{gaussian_filter_pipelined_entry_bit_concat28_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_10[7:0]}, gaussian_filter_pipelined_entry_bit_concat28_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat27 = {gaussian_filter_pipelined_entry_bit_concat27_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_35[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat26 = {{gaussian_filter_pipelined_entry_bit_concat26_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_35[7:0]}, gaussian_filter_pipelined_entry_bit_concat26_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add13 = (gaussian_filter_pipelined_entry_bit_concat27 + gaussian_filter_pipelined_entry_bit_concat26);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat25 = {gaussian_filter_pipelined_entry_bit_concat25_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_11[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat24 = {{gaussian_filter_pipelined_entry_bit_concat24_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_13[7:0]}, gaussian_filter_pipelined_entry_bit_concat24_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat23 = {{gaussian_filter_pipelined_entry_bit_concat23_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_13[7:0]}, gaussian_filter_pipelined_entry_bit_concat23_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add16 = (gaussian_filter_pipelined_entry_bit_concat24 + gaussian_filter_pipelined_entry_bit_concat23);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat22 = {{gaussian_filter_pipelined_entry_bit_concat22_bit_select_operand_0[21:0], gaussian_filter_pipelined_entry_14[7:0]}, gaussian_filter_pipelined_entry_bit_concat22_bit_select_operand_4[1:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat21 = {{gaussian_filter_pipelined_entry_bit_concat21_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_14[7:0]}, gaussian_filter_pipelined_entry_bit_concat21_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add19 = (gaussian_filter_pipelined_entry_bit_concat22 + gaussian_filter_pipelined_entry_bit_concat21);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat20 = {{gaussian_filter_pipelined_entry_bit_concat20_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_15[7:0]}, gaussian_filter_pipelined_entry_bit_concat20_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat19 = {{gaussian_filter_pipelined_entry_bit_concat19_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_15[7:0]}, gaussian_filter_pipelined_entry_bit_concat19_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add22 = (gaussian_filter_pipelined_entry_bit_concat20 + gaussian_filter_pipelined_entry_bit_concat19);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_add_1_1 = (gaussian_filter_pipelined_entry_sr_add13 + gaussian_filter_pipelined_entry_sr_add22_reg_stage3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat18 = {gaussian_filter_pipelined_entry_bit_concat18_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_37[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_mul_291 = (gaussian_filter_pipelined_entry_bit_concat25 + gaussian_filter_pipelined_entry_bit_concat18);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat17 = {gaussian_filter_pipelined_entry_bit_concat17_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_16[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat16 = {{gaussian_filter_pipelined_entry_bit_concat16_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_16[7:0]}, gaussian_filter_pipelined_entry_bit_concat16_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add24 = (gaussian_filter_pipelined_entry_bit_concat17 + gaussian_filter_pipelined_entry_bit_concat16);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var3 = (gaussian_filter_pipelined_entry_sr_add16 + gaussian_filter_pipelined_entry_sr_add24_reg_stage2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat15 = {{gaussian_filter_pipelined_entry_bit_concat15_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_18[7:0]}, gaussian_filter_pipelined_entry_bit_concat15_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat14 = {{gaussian_filter_pipelined_entry_bit_concat14_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_19[7:0]}, gaussian_filter_pipelined_entry_bit_concat14_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat13 = {{gaussian_filter_pipelined_entry_bit_concat13_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_19[7:0]}, gaussian_filter_pipelined_entry_bit_concat13_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add28 = (gaussian_filter_pipelined_entry_bit_concat14 + gaussian_filter_pipelined_entry_bit_concat13);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var4 = (gaussian_filter_pipelined_entry_newCurOp_add_2 + gaussian_filter_pipelined_entry_sr_add28_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat12 = {{gaussian_filter_pipelined_entry_bit_concat12_bit_select_operand_0[20:0], gaussian_filter_pipelined_entry_20[7:0]}, gaussian_filter_pipelined_entry_bit_concat12_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var5 = (gaussian_filter_pipelined_entry_newEarly_newEarly_ + gaussian_filter_pipelined_entry_bit_concat12_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat11 = {gaussian_filter_pipelined_entry_bit_concat11_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_39[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat10 = {{gaussian_filter_pipelined_entry_bit_concat10_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_39[7:0]}, gaussian_filter_pipelined_entry_bit_concat10_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add30 = (gaussian_filter_pipelined_entry_bit_concat11 + gaussian_filter_pipelined_entry_bit_concat10);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var6 = (gaussian_filter_pipelined_entry_newEarly_newEarly__var2 + gaussian_filter_pipelined_entry_sr_add30_reg_stage3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat9 = {gaussian_filter_pipelined_entry_bit_concat9_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_21[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var7 = (gaussian_filter_pipelined_entry_bit_concat28 + gaussian_filter_pipelined_entry_bit_concat9_reg_stage3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly_ = (gaussian_filter_pipelined_entry_sr_add5 + gaussian_filter_pipelined_entry_newEarly_newEarly__var7_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat8 = {gaussian_filter_pipelined_entry_bit_concat8_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_23[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat7 = {{gaussian_filter_pipelined_entry_bit_concat7_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_23[7:0]}, gaussian_filter_pipelined_entry_bit_concat7_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add32 = (gaussian_filter_pipelined_entry_bit_concat8 + gaussian_filter_pipelined_entry_bit_concat7);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var8 = (gaussian_filter_pipelined_entry_newEarly_add_1_1 + gaussian_filter_pipelined_entry_sr_add32_reg_stage3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var9 = (gaussian_filter_pipelined_entry_newEarly_newEarly__var4 + gaussian_filter_pipelined_entry_newEarly_newEarly__var8_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat6 = {gaussian_filter_pipelined_entry_bit_concat6_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_24[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_add_2302 = (gaussian_filter_pipelined_entry_mul_291 + gaussian_filter_pipelined_entry_bit_concat6_reg_stage2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_select4 = gaussian_filter_pipelined_entry_newEarly_add_2302[29:0];
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat5 = {gaussian_filter_pipelined_entry_bit_select4[29:0], gaussian_filter_pipelined_entry_bit_concat5_bit_select_operand_2[1:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var10 = (gaussian_filter_pipelined_entry_newEarly_newEarly__var5 + gaussian_filter_pipelined_entry_bit_concat5_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat3 = {gaussian_filter_pipelined_entry_bit_concat3_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_25[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat2 = {{gaussian_filter_pipelined_entry_bit_concat2_bit_select_operand_0[22:0], gaussian_filter_pipelined_entry_25[7:0]}, gaussian_filter_pipelined_entry_bit_concat2_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_pipelined_entry_sr_add34 = (gaussian_filter_pipelined_entry_bit_concat3 + gaussian_filter_pipelined_entry_bit_concat2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var11 = (gaussian_filter_pipelined_entry_newEarly_newEarly__var3 + gaussian_filter_pipelined_entry_sr_add34_reg_stage2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var12 = (gaussian_filter_pipelined_entry_newEarly_newEarly__var6 + gaussian_filter_pipelined_entry_newEarly_newEarly__var11_reg_stage3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var13 = (gaussian_filter_pipelined_entry_newCurOp_newEarly__var9 + gaussian_filter_pipelined_entry_newCurOp_newEarly__var12_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat1 = {gaussian_filter_pipelined_entry_bit_concat1_bit_select_operand_0[23:0], gaussian_filter_pipelined_entry_31[7:0]};
end
always @(*) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var14 = (gaussian_filter_pipelined_entry_bit_concat15 + gaussian_filter_pipelined_entry_bit_concat1_reg_stage1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var15 = (gaussian_filter_pipelined_entry_sr_add19 + gaussian_filter_pipelined_entry_newEarly_newEarly__var14_reg_stage2);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var16 = (gaussian_filter_pipelined_entry_newCurOp_newEarly_ + gaussian_filter_pipelined_entry_newCurOp_newEarly__var15_reg_stage4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var17 = (gaussian_filter_pipelined_entry_newCurOp_newEarly__var16 + gaussian_filter_pipelined_entry_newCurOp_newEarly__var10);
end
always @(*) begin
		gaussian_filter_pipelined_entry_newCurOp_add_4_4 = (gaussian_filter_pipelined_entry_newCurOp_newEarly__var13 + gaussian_filter_pipelined_entry_newCurOp_newEarly__var17);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_select = gaussian_filter_pipelined_entry_newCurOp_add_4_4[14:7];
end
always @(*) begin
		gaussian_filter_pipelined_entry_ORexitM180 = (gaussian_filter_pipelined_entry_30 | gaussian_filter_pipelined_entry_exitMask_T7);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select181 = (gaussian_filter_pipelined_entry_30_reg_stage4 ? gaussian_filter_pipelined_entry_1 : gaussian_filter_pipelined_entry_3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select185 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage4 ? gaussian_filter_pipelined_entry_select181 : gaussian_filter_pipelined_entry_3);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select169 = (gaussian_filter_pipelined_entry_30_reg_stage4 ? gaussian_filter_pipelined_entry_3 : gaussian_filter_pipelined_entry_4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select173 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage4 ? gaussian_filter_pipelined_entry_select169 : gaussian_filter_pipelined_entry_4);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select163 = (gaussian_filter_pipelined_entry_30_reg_stage4 ? gaussian_filter_pipelined_entry_4 : gaussian_filter_pipelined_entry_5);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select167 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage4 ? gaussian_filter_pipelined_entry_select163 : gaussian_filter_pipelined_entry_5);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select157 = (gaussian_filter_pipelined_entry_30_reg_stage4 ? gaussian_filter_pipelined_entry_5 : gaussian_filter_pipelined_entry_33);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select161 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage4 ? gaussian_filter_pipelined_entry_select157 : gaussian_filter_pipelined_entry_33);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select151 = (gaussian_filter_pipelined_entry_30_reg_stage3 ? gaussian_filter_pipelined_entry_6 : gaussian_filter_pipelined_entry_8);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select155 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage3 ? gaussian_filter_pipelined_entry_select151 : gaussian_filter_pipelined_entry_8);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select139 = (gaussian_filter_pipelined_entry_30_reg_stage3 ? gaussian_filter_pipelined_entry_8 : gaussian_filter_pipelined_entry_9);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select143 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage3 ? gaussian_filter_pipelined_entry_select139 : gaussian_filter_pipelined_entry_9);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select133 = (gaussian_filter_pipelined_entry_30_reg_stage3 ? gaussian_filter_pipelined_entry_9 : gaussian_filter_pipelined_entry_10);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select137 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage3 ? gaussian_filter_pipelined_entry_select133 : gaussian_filter_pipelined_entry_10);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select127 = (gaussian_filter_pipelined_entry_30_reg_stage3 ? gaussian_filter_pipelined_entry_10 : gaussian_filter_pipelined_entry_35);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select131 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage3 ? gaussian_filter_pipelined_entry_select127 : gaussian_filter_pipelined_entry_35);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select121 = (gaussian_filter_pipelined_entry_30_reg_stage2 ? gaussian_filter_pipelined_entry_11 : gaussian_filter_pipelined_entry_13);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select125 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage2 ? gaussian_filter_pipelined_entry_select121 : gaussian_filter_pipelined_entry_13);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select109 = (gaussian_filter_pipelined_entry_30_reg_stage2 ? gaussian_filter_pipelined_entry_13 : gaussian_filter_pipelined_entry_14);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select113 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage2 ? gaussian_filter_pipelined_entry_select109 : gaussian_filter_pipelined_entry_14);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select103 = (gaussian_filter_pipelined_entry_30_reg_stage2 ? gaussian_filter_pipelined_entry_14 : gaussian_filter_pipelined_entry_15);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select107 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage2 ? gaussian_filter_pipelined_entry_select103 : gaussian_filter_pipelined_entry_15);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select97 = (gaussian_filter_pipelined_entry_30_reg_stage2 ? gaussian_filter_pipelined_entry_15 : gaussian_filter_pipelined_entry_37);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select101 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage2 ? gaussian_filter_pipelined_entry_select97 : gaussian_filter_pipelined_entry_37);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select91 = (gaussian_filter_pipelined_entry_30_reg_stage1 ? gaussian_filter_pipelined_entry_16 : gaussian_filter_pipelined_entry_18);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select95 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage1 ? gaussian_filter_pipelined_entry_select91 : gaussian_filter_pipelined_entry_18);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select79 = (gaussian_filter_pipelined_entry_30_reg_stage1 ? gaussian_filter_pipelined_entry_18 : gaussian_filter_pipelined_entry_19);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select83 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage1 ? gaussian_filter_pipelined_entry_select79 : gaussian_filter_pipelined_entry_19);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select73 = (gaussian_filter_pipelined_entry_30_reg_stage1 ? gaussian_filter_pipelined_entry_19 : gaussian_filter_pipelined_entry_20);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select77 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage1 ? gaussian_filter_pipelined_entry_select73 : gaussian_filter_pipelined_entry_20);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select67 = (gaussian_filter_pipelined_entry_30_reg_stage1 ? gaussian_filter_pipelined_entry_20 : gaussian_filter_pipelined_entry_39);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select71 = (gaussian_filter_pipelined_entry_ORexitM180_reg_stage1 ? gaussian_filter_pipelined_entry_select67 : gaussian_filter_pipelined_entry_39);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select61 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_21 : gaussian_filter_pipelined_entry_23);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select65 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select61 : gaussian_filter_pipelined_entry_23);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select49 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_23 : gaussian_filter_pipelined_entry_24);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select53 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select49 : gaussian_filter_pipelined_entry_24);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select43 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_24 : gaussian_filter_pipelined_entry_25);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select47 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select43 : gaussian_filter_pipelined_entry_25);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select37 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_25 : gaussian_filter_pipelined_entry_31);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select41 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select37 : gaussian_filter_pipelined_entry_31);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select31 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_26 : gaussian_filter_pipelined_entry_add50_i_var0);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select35 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select31 : gaussian_filter_pipelined_entry_add50_i_var0);
end
always @(*) begin
		gaussian_filter_pipelined_entry_bit_concat = {gaussian_filter_pipelined_entry_bit_concat_bit_select_operand_0[30:0], gaussian_filter_pipelined_entry_exitMask_F9};
end
always @(*) begin
		gaussian_filter_pipelined_entry_inc = (gaussian_filter_pipelined_entry_bit_concat ^ 32'd1);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select27 = (gaussian_filter_pipelined_entry_ORexitM180 ? 32'd0 : gaussian_filter_pipelined_entry_inc);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select29 = (gaussian_filter_pipelined_entry_27 + gaussian_filter_pipelined_entry_select27);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select19 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_28 : gaussian_filter_pipelined_entry_select11);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select21 = (gaussian_filter_pipelined_entry_exitMask_F9 ? gaussian_filter_pipelined_entry_select11 : gaussian_filter_pipelined_entry_28);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select23 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select19 : gaussian_filter_pipelined_entry_select21);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select13 = (gaussian_filter_pipelined_entry_30 ? gaussian_filter_pipelined_entry_29 : gaussian_filter_pipelined_entry_select);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select15 = (gaussian_filter_pipelined_entry_exitMask_F9 ? gaussian_filter_pipelined_entry_select : gaussian_filter_pipelined_entry_29);
end
always @(*) begin
		gaussian_filter_pipelined_entry_select17 = (gaussian_filter_pipelined_entry_ORexitM180 ? gaussian_filter_pipelined_entry_select13 : gaussian_filter_pipelined_entry_select15);
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_4 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a1_inferred_reg <= gaussian_filter_pipelined_entry_select185;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_4 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a2_inferred_reg <= gaussian_filter_pipelined_entry_select173;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_4 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a3_inferred_reg <= gaussian_filter_pipelined_entry_select167;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_4 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a0_a4_inferred_reg <= gaussian_filter_pipelined_entry_select161;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_3 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a1_inferred_reg <= gaussian_filter_pipelined_entry_select155;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_3 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a2_inferred_reg <= gaussian_filter_pipelined_entry_select143;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_3 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a3_inferred_reg <= gaussian_filter_pipelined_entry_select137;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_3 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a1_a4_inferred_reg <= gaussian_filter_pipelined_entry_select131;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_2 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a1_inferred_reg <= gaussian_filter_pipelined_entry_select125;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_2 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a2_inferred_reg <= gaussian_filter_pipelined_entry_select113;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_2 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a3_inferred_reg <= gaussian_filter_pipelined_entry_select107;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_2 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a2_a4_inferred_reg <= gaussian_filter_pipelined_entry_select101;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_1 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a1_inferred_reg <= gaussian_filter_pipelined_entry_select95;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_1 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a2_inferred_reg <= gaussian_filter_pipelined_entry_select83;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_1 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a3_inferred_reg <= gaussian_filter_pipelined_entry_select77;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_1 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a3_a4_inferred_reg <= gaussian_filter_pipelined_entry_select71;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a1_inferred_reg <= gaussian_filter_pipelined_entry_select65;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a2_inferred_reg <= gaussian_filter_pipelined_entry_select53;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a3_inferred_reg <= gaussian_filter_pipelined_entry_select47;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_window_a4_a4_inferred_reg <= gaussian_filter_pipelined_entry_select41;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_line_buffer_prev_row_ind_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_ind_inferred_reg <= gaussian_filter_pipelined_entry_select35;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__clken = gaussian_filter_pipelined_line_buffer_prev_row_a0__clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__address_a = 'dx;
	if ((gaussian_filter_pipelined_state_enable_0 & gaussian_filter_pipelined_entry_NotCondition)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a0__address_a = (gaussian_filter_pipelined_entry_38 >>> 1'd0);
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_a = 'd0;
assign gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_a = 'dx;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__read_en_a = 'd0;
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a0__read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__address_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_0 & gaussian_filter_pipelined_entry_NotCondition)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a0__address_b = (gaussian_filter_pipelined_entry_38 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_b = 'd0;
	if ((gaussian_filter_pipelined_state_enable_0 & gaussian_filter_pipelined_entry_NotCondition)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a0__write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_0 & gaussian_filter_pipelined_entry_NotCondition)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a0__write_data_b = gaussian_filter_pipelined_entry_31;
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a0__read_en_b = 'd0;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__clken = gaussian_filter_pipelined_line_buffer_prev_row_a1__clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__address_a = 'dx;
	if ((gaussian_filter_pipelined_state_enable_1 & gaussian_filter_pipelined_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a1__address_a = (gaussian_filter_pipelined_entry_36_reg_stage1 >>> 1'd0);
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_a = 'd0;
assign gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_a = 'dx;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__read_en_a = 'd0;
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a1__read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__address_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_1 & gaussian_filter_pipelined_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a1__address_b = (gaussian_filter_pipelined_entry_36_reg_stage1 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_b = 'd0;
	if ((gaussian_filter_pipelined_state_enable_1 & gaussian_filter_pipelined_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a1__write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_1 & gaussian_filter_pipelined_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a1__write_data_b = gaussian_filter_pipelined_entry_39;
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a1__read_en_b = 'd0;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__clken = gaussian_filter_pipelined_line_buffer_prev_row_a2__clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__address_a = 'dx;
	if ((gaussian_filter_pipelined_state_enable_2 & gaussian_filter_pipelined_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a2__address_a = (gaussian_filter_pipelined_entry_34_reg_stage2 >>> 1'd0);
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_a = 'd0;
assign gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_a = 'dx;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__read_en_a = 'd0;
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a2__read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__address_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_2 & gaussian_filter_pipelined_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a2__address_b = (gaussian_filter_pipelined_entry_34_reg_stage2 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_b = 'd0;
	if ((gaussian_filter_pipelined_state_enable_2 & gaussian_filter_pipelined_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a2__write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_2 & gaussian_filter_pipelined_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a2__write_data_b = gaussian_filter_pipelined_entry_37;
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a2__read_en_b = 'd0;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__clken = gaussian_filter_pipelined_line_buffer_prev_row_a3__clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__address_a = 'dx;
	if ((gaussian_filter_pipelined_state_enable_3 & gaussian_filter_pipelined_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a3__address_a = (gaussian_filter_pipelined_entry_32_reg_stage3 >>> 1'd0);
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_a = 'd0;
assign gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_a = 'dx;
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__read_en_a = 'd0;
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a3__read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__address_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_3 & gaussian_filter_pipelined_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a3__address_b = (gaussian_filter_pipelined_entry_32_reg_stage3 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_b = 'd0;
	if ((gaussian_filter_pipelined_state_enable_3 & gaussian_filter_pipelined_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a3__write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_b = 'dx;
	if ((gaussian_filter_pipelined_valid_bit_3 & gaussian_filter_pipelined_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_pipelined_line_buffer_prev_row_a3__write_data_b = gaussian_filter_pipelined_entry_35;
	end
end
assign gaussian_filter_pipelined_line_buffer_prev_row_a3__read_en_b = 'd0;
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_count_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_count_inferred_reg <= gaussian_filter_pipelined_entry_select29;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_i_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_i_inferred_reg <= gaussian_filter_pipelined_entry_select23;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_pipelined_j_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_pipelined_state_enable_0 & 1'd1)) begin
		gaussian_filter_pipelined_j_inferred_reg <= gaussian_filter_pipelined_entry_select17;
	end
end
always @(posedge clk) begin
	if (~(gaussian_filter_pipelined_state_stall_0)) begin
		gaussian_filter_pipelined_valid_bit_0 <= (gaussian_filter_pipelined_II_counter & start);
	end
	if (reset) begin
		gaussian_filter_pipelined_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_stall_0 = 1'd0;
	if (gaussian_filter_pipelined_state_stall_1) begin
		gaussian_filter_pipelined_state_stall_0 = 1'd1;
	end
	if (((gaussian_filter_pipelined_valid_bit_0 & gaussian_filter_pipelined_entry_NotCondition) & ~(input_fifo_consumed_valid))) begin
		gaussian_filter_pipelined_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_enable_0 = (gaussian_filter_pipelined_valid_bit_0 & ~(gaussian_filter_pipelined_state_stall_0));
end
always @(posedge clk) begin
	if (~(gaussian_filter_pipelined_state_stall_1)) begin
		gaussian_filter_pipelined_valid_bit_1 <= gaussian_filter_pipelined_state_enable_0;
	end
	if (reset) begin
		gaussian_filter_pipelined_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_stall_1 = 1'd0;
	if (gaussian_filter_pipelined_state_stall_2) begin
		gaussian_filter_pipelined_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_enable_1 = (gaussian_filter_pipelined_valid_bit_1 & ~(gaussian_filter_pipelined_state_stall_1));
end
always @(posedge clk) begin
	if (~(gaussian_filter_pipelined_state_stall_2)) begin
		gaussian_filter_pipelined_valid_bit_2 <= gaussian_filter_pipelined_state_enable_1;
	end
	if (reset) begin
		gaussian_filter_pipelined_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_stall_2 = 1'd0;
	if (gaussian_filter_pipelined_state_stall_3) begin
		gaussian_filter_pipelined_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_enable_2 = (gaussian_filter_pipelined_valid_bit_2 & ~(gaussian_filter_pipelined_state_stall_2));
end
always @(posedge clk) begin
	if (~(gaussian_filter_pipelined_state_stall_3)) begin
		gaussian_filter_pipelined_valid_bit_3 <= gaussian_filter_pipelined_state_enable_2;
	end
	if (reset) begin
		gaussian_filter_pipelined_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_stall_3 = 1'd0;
	if (gaussian_filter_pipelined_state_stall_4) begin
		gaussian_filter_pipelined_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_enable_3 = (gaussian_filter_pipelined_valid_bit_3 & ~(gaussian_filter_pipelined_state_stall_3));
end
always @(posedge clk) begin
	if (~(gaussian_filter_pipelined_state_stall_4)) begin
		gaussian_filter_pipelined_valid_bit_4 <= gaussian_filter_pipelined_state_enable_3;
	end
	if (reset) begin
		gaussian_filter_pipelined_valid_bit_4 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_stall_4 = 1'd0;
	if (gaussian_filter_pipelined_state_stall_5) begin
		gaussian_filter_pipelined_state_stall_4 = 1'd1;
	end
	if ((((gaussian_filter_pipelined_valid_bit_4 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_gaussian_filter_pipelined_state_4_not_accessed_due_to_stall_a | output_fifo_gaussian_filter_pipelined_state_4_stalln_reg))) begin
		gaussian_filter_pipelined_state_stall_4 = 1'd1;
	end
	if ((((gaussian_filter_pipelined_valid_bit_4 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_gaussian_filter_pipelined_state_4_not_accessed_due_to_stall_a | output_fifo_gaussian_filter_pipelined_state_4_stalln_reg))) begin
		gaussian_filter_pipelined_state_stall_4 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_pipelined_state_enable_4 = (gaussian_filter_pipelined_valid_bit_4 & ~(gaussian_filter_pipelined_state_stall_4));
end
always @(posedge clk) begin
	if (~(gaussian_filter_pipelined_state_stall_5)) begin
		gaussian_filter_pipelined_valid_bit_5 <= gaussian_filter_pipelined_state_enable_4;
	end
	if (reset) begin
		gaussian_filter_pipelined_valid_bit_5 <= 1'd0;
	end
end
assign gaussian_filter_pipelined_state_stall_5 = 1'd0;
always @(*) begin
	gaussian_filter_pipelined_state_enable_5 = (gaussian_filter_pipelined_valid_bit_5 & ~(gaussian_filter_pipelined_state_stall_5));
end
always @(posedge clk) begin
	gaussian_filter_pipelined_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_14_reg_stage3 <= gaussian_filter_pipelined_entry_14;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_14_reg_stage4 <= gaussian_filter_pipelined_entry_14_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_30_reg_stage1 <= gaussian_filter_pipelined_entry_30;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_30_reg_stage2 <= gaussian_filter_pipelined_entry_30_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_30_reg_stage3 <= gaussian_filter_pipelined_entry_30_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_30_reg_stage4 <= gaussian_filter_pipelined_entry_30_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_NotCondition_reg_stage1 <= gaussian_filter_pipelined_entry_NotCondition;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_NotCondition_reg_stage2 <= gaussian_filter_pipelined_entry_NotCondition_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_NotCondition_reg_stage3 <= gaussian_filter_pipelined_entry_NotCondition_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_32_reg_stage1 <= gaussian_filter_pipelined_entry_32;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_32_reg_stage2 <= gaussian_filter_pipelined_entry_32_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_32_reg_stage3 <= gaussian_filter_pipelined_entry_32_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_34_reg_stage1 <= gaussian_filter_pipelined_entry_34;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_34_reg_stage2 <= gaussian_filter_pipelined_entry_34_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_36_reg_stage1 <= gaussian_filter_pipelined_entry_36;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_exitMask_T7_reg_stage1 <= gaussian_filter_pipelined_entry_exitMask_T7;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_exitMask_T7_reg_stage2 <= gaussian_filter_pipelined_entry_exitMask_T7_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_exitMask_T7_reg_stage3 <= gaussian_filter_pipelined_entry_exitMask_T7_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_exitMask_T7_reg_stage4 <= gaussian_filter_pipelined_entry_exitMask_T7_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_exitMask_F9_reg_stage1 <= gaussian_filter_pipelined_entry_exitMask_F9;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_exitMask_F9_reg_stage2 <= gaussian_filter_pipelined_entry_exitMask_F9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_exitMask_F9_reg_stage3 <= gaussian_filter_pipelined_entry_exitMask_F9_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_exitMask_F9_reg_stage4 <= gaussian_filter_pipelined_entry_exitMask_F9_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_bit_concat31_reg_stage4 <= gaussian_filter_pipelined_entry_bit_concat31;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_sr_add22_reg_stage3 <= gaussian_filter_pipelined_entry_sr_add22;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_sr_add24_reg_stage2 <= gaussian_filter_pipelined_entry_sr_add24;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_sr_add28_reg_stage2 <= gaussian_filter_pipelined_entry_sr_add28;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_sr_add28_reg_stage3 <= gaussian_filter_pipelined_entry_sr_add28_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_sr_add28_reg_stage4 <= gaussian_filter_pipelined_entry_sr_add28_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_bit_concat12_reg_stage2 <= gaussian_filter_pipelined_entry_bit_concat12;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_bit_concat12_reg_stage3 <= gaussian_filter_pipelined_entry_bit_concat12_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_bit_concat12_reg_stage4 <= gaussian_filter_pipelined_entry_bit_concat12_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_sr_add30_reg_stage2 <= gaussian_filter_pipelined_entry_sr_add30;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_sr_add30_reg_stage3 <= gaussian_filter_pipelined_entry_sr_add30_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_bit_concat9_reg_stage1 <= gaussian_filter_pipelined_entry_bit_concat9;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_bit_concat9_reg_stage2 <= gaussian_filter_pipelined_entry_bit_concat9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_bit_concat9_reg_stage3 <= gaussian_filter_pipelined_entry_bit_concat9_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var7_reg_stage4 <= gaussian_filter_pipelined_entry_newEarly_newEarly__var7;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_sr_add32_reg_stage1 <= gaussian_filter_pipelined_entry_sr_add32;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_sr_add32_reg_stage2 <= gaussian_filter_pipelined_entry_sr_add32_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_sr_add32_reg_stage3 <= gaussian_filter_pipelined_entry_sr_add32_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var8_reg_stage4 <= gaussian_filter_pipelined_entry_newEarly_newEarly__var8;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_bit_concat6_reg_stage1 <= gaussian_filter_pipelined_entry_bit_concat6;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_bit_concat6_reg_stage2 <= gaussian_filter_pipelined_entry_bit_concat6_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_bit_concat5_reg_stage3 <= gaussian_filter_pipelined_entry_bit_concat5;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_bit_concat5_reg_stage4 <= gaussian_filter_pipelined_entry_bit_concat5_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_sr_add34_reg_stage1 <= gaussian_filter_pipelined_entry_sr_add34;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_sr_add34_reg_stage2 <= gaussian_filter_pipelined_entry_sr_add34_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var11_reg_stage3 <= gaussian_filter_pipelined_entry_newEarly_newEarly__var11;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var12_reg_stage4 <= gaussian_filter_pipelined_entry_newCurOp_newEarly__var12;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_bit_concat1_reg_stage1 <= gaussian_filter_pipelined_entry_bit_concat1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_newEarly_newEarly__var14_reg_stage2 <= gaussian_filter_pipelined_entry_newEarly_newEarly__var14;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var15_reg_stage3 <= gaussian_filter_pipelined_entry_newCurOp_newEarly__var15;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_newCurOp_newEarly__var15_reg_stage4 <= gaussian_filter_pipelined_entry_newCurOp_newEarly__var15_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_0) begin
		gaussian_filter_pipelined_entry_ORexitM180_reg_stage1 <= gaussian_filter_pipelined_entry_ORexitM180;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_1) begin
		gaussian_filter_pipelined_entry_ORexitM180_reg_stage2 <= gaussian_filter_pipelined_entry_ORexitM180_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_2) begin
		gaussian_filter_pipelined_entry_ORexitM180_reg_stage3 <= gaussian_filter_pipelined_entry_ORexitM180_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_pipelined_state_enable_3) begin
		gaussian_filter_pipelined_entry_ORexitM180_reg_stage4 <= gaussian_filter_pipelined_entry_ORexitM180_reg_stage3;
	end
end
always @(posedge clk) begin
	if (input_fifo_consumed_taken) begin
		input_fifo_consumed_valid <= 1'd0;
	end
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_consumed_valid <= 1'd1;
	end
	if (reset) begin
		input_fifo_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((input_fifo_ready & input_fifo_valid)) begin
		input_fifo_consumed_data <= input_fifo;
	end
	if (reset) begin
		input_fifo_consumed_data <= 1'd0;
	end
end
always @(*) begin
	input_fifo_consumed_taken = 1'd0;
	if ((gaussian_filter_pipelined_valid_bit_0 & gaussian_filter_pipelined_entry_NotCondition)) begin
		input_fifo_consumed_taken = ~(gaussian_filter_pipelined_state_stall_0);
	end
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_wire_a = gaussian_filter_pipelined_line_buffer_prev_row_a3__read_data_a;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a3__clken_pipeline_cond = ~(gaussian_filter_pipelined_state_stall_4);
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_wire_a = gaussian_filter_pipelined_line_buffer_prev_row_a2__read_data_a;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a2__clken_pipeline_cond = ~(gaussian_filter_pipelined_state_stall_3);
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_wire_a = gaussian_filter_pipelined_line_buffer_prev_row_a1__read_data_a;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a1__clken_pipeline_cond = ~(gaussian_filter_pipelined_state_stall_2);
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_wire_a = gaussian_filter_pipelined_line_buffer_prev_row_a0__read_data_a;
end
always @(*) begin
	gaussian_filter_pipelined_line_buffer_prev_row_a0__clken_pipeline_cond = ~(gaussian_filter_pipelined_state_stall_1);
end
assign gaussian_filter_pipelined_entry_bit_concat43_bit_select_operand_0 = 31'd0;
assign gaussian_filter_pipelined_entry_bit_concat42_bit_select_operand_0 = 31'd0;
assign gaussian_filter_pipelined_entry_bit_concat41_bit_select_operand_0 = 31'd0;
assign gaussian_filter_pipelined_entry_cmp_i2_op1_temp = 32'd1919;
always @(posedge clk) begin
	output_fifo_gaussian_filter_pipelined_state_4_not_accessed_due_to_stall_a <= ((gaussian_filter_pipelined_state_stall_4 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_gaussian_filter_pipelined_state_4_stalln_reg <= ~(gaussian_filter_pipelined_state_stall_4);
end
always @(*) begin
	output_fifo_gaussian_filter_pipelined_state_4_enable_cond_a = (gaussian_filter_pipelined_valid_bit_4 & (output_fifo_gaussian_filter_pipelined_state_4_not_accessed_due_to_stall_a | output_fifo_gaussian_filter_pipelined_state_4_stalln_reg));
end
assign gaussian_filter_pipelined_entry_bit_concat40_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat39_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat38_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat38_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat37_bit_select_operand_0 = 22'd0;
assign gaussian_filter_pipelined_entry_bit_concat37_bit_select_operand_4 = 2'd0;
assign gaussian_filter_pipelined_entry_bit_concat36_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat35_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat35_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat34_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat33_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat32_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat32_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat31_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat31_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat30_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat30_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat29_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat29_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat28_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat28_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat27_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat26_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat26_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat25_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat24_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat24_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat23_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat23_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat22_bit_select_operand_0 = 22'd0;
assign gaussian_filter_pipelined_entry_bit_concat22_bit_select_operand_4 = 2'd0;
assign gaussian_filter_pipelined_entry_bit_concat21_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat21_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat20_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat20_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat19_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat19_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat18_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat17_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat16_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat16_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat15_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat15_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat14_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat14_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat13_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat13_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat12_bit_select_operand_0 = 21'd0;
assign gaussian_filter_pipelined_entry_bit_concat12_bit_select_operand_4 = 3'd0;
assign gaussian_filter_pipelined_entry_bit_concat11_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat10_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat10_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat9_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat8_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat7_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat7_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat6_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat5_bit_select_operand_2 = 2'd0;
assign gaussian_filter_pipelined_entry_bit_concat3_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat2_bit_select_operand_0 = 23'd0;
assign gaussian_filter_pipelined_entry_bit_concat2_bit_select_operand_4 = 1'd0;
assign gaussian_filter_pipelined_entry_bit_concat1_bit_select_operand_0 = 24'd0;
assign gaussian_filter_pipelined_entry_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = ~(gaussian_filter_pipelined_state_stall_0);
end
always @(posedge clk) begin
	finish <= gaussian_filter_pipelined_state_enable_5;
end
always @(*) begin
	input_fifo_ready = (~(input_fifo_consumed_valid) | input_fifo_consumed_taken);
	if (reset) begin
		input_fifo_ready = 1'd0;
	end
end
always @(*) begin
	if ((gaussian_filter_pipelined_valid_bit_4 & gaussian_filter_pipelined_entry_exitMask_T7_reg_stage4)) begin
		output_fifo = gaussian_filter_pipelined_entry_14_reg_stage4;
	end
	else /* if ((gaussian_filter_pipelined_valid_bit_4 & gaussian_filter_pipelined_entry_exitMask_F9_reg_stage4)) */ begin
		output_fifo = gaussian_filter_pipelined_entry_bit_select;
	end
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((output_fifo_gaussian_filter_pipelined_state_4_enable_cond_a & gaussian_filter_pipelined_entry_exitMask_T7_reg_stage4)) begin
		output_fifo_valid = 1'd1;
	end
	if ((output_fifo_gaussian_filter_pipelined_state_4_enable_cond_a & gaussian_filter_pipelined_entry_exitMask_F9_reg_stage4)) begin
		output_fifo_valid = 1'd1;
	end
end

endmodule
