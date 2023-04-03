// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2023.1
// Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
// For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
// Date: Mon Apr  3 09:01:06 2023
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
//
// NOTE:// If you take this code outside the SmartHLS directory structure
// into your own, then you should adjust this constant accordingly.
// E.g. for simulation on Modelsim:
//		vlog +define+MEM_INIT_DIR=/path/to/rtl/mem_init/ nested_pipeline.v  ...
//
`ifndef MEM_INIT_DIR
`define MEM_INIT_DIR "../hdl/"
`endif


`timescale 1 ns / 1 ns
module row_cumulative_sum_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	grid_clken,
	grid_write_en_a,
	grid_write_data_a,
	grid_read_en_a,
	grid_address_a,
	grid_read_data_a,
	grid_write_en_b,
	grid_write_data_b,
	grid_read_en_b,
	grid_address_b,
	grid_read_data_b
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  grid_clken;
output reg  grid_write_en_a;
output reg [31:0] grid_write_data_a;
output reg  grid_read_en_a;
output reg [15:0] grid_address_a;
input [31:0] grid_read_data_a;
output reg  grid_write_en_b;
output reg [31:0] grid_write_data_b;
output reg  grid_read_en_b;
output reg [15:0] grid_address_b;
input [31:0] grid_read_data_b;
reg  row_cumulative_sum_inst_clk;
reg  row_cumulative_sum_inst_reset;
reg  row_cumulative_sum_inst_start;
wire  row_cumulative_sum_inst_ready;
wire  row_cumulative_sum_inst_finish;
wire  row_cumulative_sum_inst_grid_clken;
wire  row_cumulative_sum_inst_grid_write_en_a;
wire [31:0] row_cumulative_sum_inst_grid_write_data_a;
wire  row_cumulative_sum_inst_grid_read_en_a;
wire [15:0] row_cumulative_sum_inst_grid_address_a;
reg [31:0] row_cumulative_sum_inst_grid_read_data_a;
wire  row_cumulative_sum_inst_grid_write_en_b;
wire [31:0] row_cumulative_sum_inst_grid_write_data_b;
wire  row_cumulative_sum_inst_grid_read_en_b;
wire [15:0] row_cumulative_sum_inst_grid_address_b;
reg [31:0] row_cumulative_sum_inst_grid_read_data_b;
reg  row_cumulative_sum_inst_finish_reg;


row_cumulative_sum_row_cumulative_sum row_cumulative_sum_inst (
	.clk (row_cumulative_sum_inst_clk),
	.reset (row_cumulative_sum_inst_reset),
	.start (row_cumulative_sum_inst_start),
	.ready (row_cumulative_sum_inst_ready),
	.finish (row_cumulative_sum_inst_finish),
	.grid_clken (row_cumulative_sum_inst_grid_clken),
	.grid_write_en_a (row_cumulative_sum_inst_grid_write_en_a),
	.grid_write_data_a (row_cumulative_sum_inst_grid_write_data_a),
	.grid_read_en_a (row_cumulative_sum_inst_grid_read_en_a),
	.grid_address_a (row_cumulative_sum_inst_grid_address_a),
	.grid_read_data_a (row_cumulative_sum_inst_grid_read_data_a),
	.grid_write_en_b (row_cumulative_sum_inst_grid_write_en_b),
	.grid_write_data_b (row_cumulative_sum_inst_grid_write_data_b),
	.grid_read_en_b (row_cumulative_sum_inst_grid_read_en_b),
	.grid_address_b (row_cumulative_sum_inst_grid_address_b),
	.grid_read_data_b (row_cumulative_sum_inst_grid_read_data_b)
);



always @(*) begin
	row_cumulative_sum_inst_clk = clk;
end
always @(*) begin
	row_cumulative_sum_inst_reset = reset;
end
always @(*) begin
	row_cumulative_sum_inst_start = start;
end
always @(*) begin
	row_cumulative_sum_inst_grid_read_data_a = grid_read_data_a;
end
always @(*) begin
	row_cumulative_sum_inst_grid_read_data_b = grid_read_data_b;
end
always @(posedge clk) begin
	if ((reset | row_cumulative_sum_inst_start)) begin
		row_cumulative_sum_inst_finish_reg <= 1'd0;
	end
	if (row_cumulative_sum_inst_finish) begin
		row_cumulative_sum_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = row_cumulative_sum_inst_ready;
end
always @(*) begin
	finish = row_cumulative_sum_inst_finish;
end
always @(*) begin
	grid_clken = row_cumulative_sum_inst_grid_clken;
end
always @(*) begin
	grid_write_en_a = row_cumulative_sum_inst_grid_write_en_a;
end
always @(*) begin
	grid_write_data_a = row_cumulative_sum_inst_grid_write_data_a;
end
always @(*) begin
	grid_read_en_a = row_cumulative_sum_inst_grid_read_en_a;
end
always @(*) begin
	grid_address_a = row_cumulative_sum_inst_grid_address_a;
end
always @(*) begin
	grid_write_en_b = row_cumulative_sum_inst_grid_write_en_b;
end
always @(*) begin
	grid_write_data_b = row_cumulative_sum_inst_grid_write_data_b;
end
always @(*) begin
	grid_read_en_b = row_cumulative_sum_inst_grid_read_en_b;
end
always @(*) begin
	grid_address_b = row_cumulative_sum_inst_grid_address_b;
end

endmodule

`timescale 1 ns / 1 ns
module row_cumulative_sum_row_cumulative_sum
(
	clk,
	reset,
	start,
	ready,
	finish,
	grid_clken,
	grid_write_en_a,
	grid_write_data_a,
	grid_read_en_a,
	grid_address_a,
	grid_read_data_a,
	grid_write_en_b,
	grid_write_data_b,
	grid_read_en_b,
	grid_address_b,
	grid_read_data_b
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_1 = 3'd1;
parameter [2:0] LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_2 = 3'd2;
parameter [2:0] LEGUP_pipeline_wait_for_loop_main_cpp_9_9_3 = 3'd3;
parameter [2:0] LEGUP_F_row_cumulative_sum_BB_for_inc8_4 = 3'd4;
parameter [2:0] LEGUP_F_row_cumulative_sum_BB_for_end10_5 = 3'd5;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  grid_clken;
output  grid_write_en_a;
output [31:0] grid_write_data_a;
output reg  grid_read_en_a;
output reg [15:0] grid_address_a;
input [31:0] grid_read_data_a;
output reg  grid_write_en_b;
output reg [31:0] grid_write_data_b;
output  grid_read_en_b;
output reg [15:0] grid_address_b;
input [31:0] grid_read_data_b;
reg [2:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [2:0] next_state;
wire  fsm_stall;
reg [7:0] row_cumulative_sum_cond1_preheader_i_09;
reg [7:0] row_cumulative_sum_cond1_preheader_i_09_reg;
reg [31:0] row_cumulative_sum_cond1_preheader_loop_init_phi9;
reg [31:0] row_cumulative_sum_cond1_preheader_loop_init_phi9_reg;
reg [31:0] row_cumulative_sum_cond1_preheader_loop_init_phi10;
reg [31:0] row_cumulative_sum_cond1_preheader_loop_init_phi10_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] row_cumulative_sum_cond1_preheader_mem_flat_gep5;
reg [31:0] row_cumulative_sum_cond1_preheader_pre;
reg [31:0] row_cumulative_sum_for_body3_0;
reg [31:0] row_cumulative_sum_for_body3_0_reg;
reg [31:0] row_cumulative_sum_for_body3_1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] row_cumulative_sum_for_body3_mem_flat_gep15;
reg [31:0] row_cumulative_sum_for_body3_3;
reg [31:0] row_cumulative_sum_for_body3_add7;
reg [8:0] row_cumulative_sum_for_inc8_4;
reg [8:0] row_cumulative_sum_for_inc8_bit_select5;
reg [8:0] row_cumulative_sum_for_inc8_bit_select3;
reg [8:0] row_cumulative_sum_for_inc8_bit_select1;
reg  row_cumulative_sum_for_inc8_exitcond;
reg [15:0] row_cumulative_sum_for_inc8_bit_concat6;
reg [14:0] row_cumulative_sum_for_inc8_bit_concat4;
reg [11:0] row_cumulative_sum_for_inc8_bit_concat2;
reg [15:0] row_cumulative_sum_for_inc8_5;
reg [16:0] row_cumulative_sum_for_inc8_6;
reg [15:0] row_cumulative_sum_for_inc8_bit_select;
reg [16:0] row_cumulative_sum_for_inc8_bit_concat;
reg  for_loop_main_cpp_9_9_valid_bit_0;
wire  for_loop_main_cpp_9_9_state_stall_0;
reg  for_loop_main_cpp_9_9_state_enable_0;
reg  for_loop_main_cpp_9_9_valid_bit_1;
wire  for_loop_main_cpp_9_9_state_stall_1;
reg  for_loop_main_cpp_9_9_state_enable_1;
reg  for_loop_main_cpp_9_9_valid_bit_2;
wire  for_loop_main_cpp_9_9_state_stall_2;
reg  for_loop_main_cpp_9_9_state_enable_2;
reg  for_loop_main_cpp_9_9_II_counter;
reg  for_loop_main_cpp_9_9_start;
reg  for_loop_main_cpp_9_9_activate_pipeline;
reg [31:0] row_cumulative_sum_for_body3_0_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] row_cumulative_sum_for_body3_mem_flat_gep15_reg_stage1;
reg [31:0] row_cumulative_sum_for_body3_add7_reg_stage2;
reg [31:0] for_loop_main_cpp_9_9_inductionVar_stage0;
reg  for_loop_main_cpp_9_9_pipeline_exit_cond;
reg  for_loop_main_cpp_9_9_active;
reg  for_loop_main_cpp_9_9_begin_pipeline;
reg  for_loop_main_cpp_9_9_epilogue;
reg  for_loop_main_cpp_9_9_pipeline_finish;
reg  for_loop_main_cpp_9_9_pipeline_finishing;
reg  for_loop_main_cpp_9_9_only_last_stage_enabled;
reg [1:0] for_loop_main_cpp_9_9_num_active_iterations;
reg  for_loop_main_cpp_9_9_inserting_new_iteration;
reg  for_loop_main_cpp_9_9_pipeline_finish_reg;
reg  for_loop_main_cpp_9_9_in_first_iteration_stage0;
reg [31:0] grid_read_data_wire_a;
reg  grid_clken_sequential_cond;
reg  grid_clken_pipeline_cond;
reg [28:0] row_cumulative_sum_for_inc8_4_width_extended;
reg [24:0] row_cumulative_sum_for_inc8_bit_select5_width_extended;
wire [6:0] row_cumulative_sum_for_inc8_bit_concat6_bit_select_operand_2;
reg [25:0] row_cumulative_sum_for_inc8_bit_select3_width_extended;
wire [5:0] row_cumulative_sum_for_inc8_bit_concat4_bit_select_operand_2;
reg [28:0] row_cumulative_sum_for_inc8_bit_select1_width_extended;
wire [2:0] row_cumulative_sum_for_inc8_bit_concat2_bit_select_operand_2;
reg [31:0] row_cumulative_sum_for_inc8_6_width_extended;
reg [30:0] row_cumulative_sum_for_inc8_bit_select_width_extended;
wire  row_cumulative_sum_for_inc8_bit_concat_bit_select_operand_2;


always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (!fsm_stall)
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  /* synthesis parallel_case */
LEGUP_0:
	if ((fsm_stall == 1'd0) && (start == 1'd1))
		next_state = LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_1;
LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_1:
		next_state = LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_2;
LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_2:
		next_state = LEGUP_pipeline_wait_for_loop_main_cpp_9_9_3;
LEGUP_F_row_cumulative_sum_BB_for_end10_5:
		next_state = LEGUP_0;
LEGUP_F_row_cumulative_sum_BB_for_inc8_4:
	if ((fsm_stall == 1'd0) && (row_cumulative_sum_for_inc8_exitcond == 1'd1))
		next_state = LEGUP_F_row_cumulative_sum_BB_for_end10_5;
	else if ((fsm_stall == 1'd0) && (row_cumulative_sum_for_inc8_exitcond == 1'd0))
		next_state = LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_1;
LEGUP_pipeline_wait_for_loop_main_cpp_9_9_3:
	if ((fsm_stall == 1'd0) && (for_loop_main_cpp_9_9_pipeline_finish == 1'd1))
		next_state = LEGUP_F_row_cumulative_sum_BB_for_inc8_4;
	else if ((fsm_stall == 1'd0) && (for_loop_main_cpp_9_9_pipeline_finish == 1'd1))
		next_state = LEGUP_F_row_cumulative_sum_BB_for_inc8_4;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		row_cumulative_sum_cond1_preheader_i_09 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_row_cumulative_sum_BB_for_inc8_4) & (fsm_stall == 1'd0)) & (row_cumulative_sum_for_inc8_exitcond == 1'd0))) */ begin
		row_cumulative_sum_cond1_preheader_i_09 = row_cumulative_sum_for_inc8_4;
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		row_cumulative_sum_cond1_preheader_i_09_reg <= row_cumulative_sum_cond1_preheader_i_09;
	end
	if ((((cur_state == LEGUP_F_row_cumulative_sum_BB_for_inc8_4) & (fsm_stall == 1'd0)) & (row_cumulative_sum_for_inc8_exitcond == 1'd0))) begin
		row_cumulative_sum_cond1_preheader_i_09_reg <= row_cumulative_sum_cond1_preheader_i_09;
	end
end
always @(*) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		row_cumulative_sum_cond1_preheader_loop_init_phi9 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_row_cumulative_sum_BB_for_inc8_4) & (fsm_stall == 1'd0)) & (row_cumulative_sum_for_inc8_exitcond == 1'd0))) */ begin
		row_cumulative_sum_cond1_preheader_loop_init_phi9 = {15'd0,row_cumulative_sum_for_inc8_6};
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		row_cumulative_sum_cond1_preheader_loop_init_phi9_reg <= row_cumulative_sum_cond1_preheader_loop_init_phi9;
	end
	if ((((cur_state == LEGUP_F_row_cumulative_sum_BB_for_inc8_4) & (fsm_stall == 1'd0)) & (row_cumulative_sum_for_inc8_exitcond == 1'd0))) begin
		row_cumulative_sum_cond1_preheader_loop_init_phi9_reg <= row_cumulative_sum_cond1_preheader_loop_init_phi9;
	end
end
always @(*) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		row_cumulative_sum_cond1_preheader_loop_init_phi10 = 32'd1;
	end
	else /* if ((((cur_state == LEGUP_F_row_cumulative_sum_BB_for_inc8_4) & (fsm_stall == 1'd0)) & (row_cumulative_sum_for_inc8_exitcond == 1'd0))) */ begin
		row_cumulative_sum_cond1_preheader_loop_init_phi10 = {15'd0,row_cumulative_sum_for_inc8_bit_concat};
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		row_cumulative_sum_cond1_preheader_loop_init_phi10_reg <= row_cumulative_sum_cond1_preheader_loop_init_phi10;
	end
	if ((((cur_state == LEGUP_F_row_cumulative_sum_BB_for_inc8_4) & (fsm_stall == 1'd0)) & (row_cumulative_sum_for_inc8_exitcond == 1'd0))) begin
		row_cumulative_sum_cond1_preheader_loop_init_phi10_reg <= row_cumulative_sum_cond1_preheader_loop_init_phi10;
	end
end
always @(*) begin
		row_cumulative_sum_cond1_preheader_mem_flat_gep5 = (0 + (4 * row_cumulative_sum_cond1_preheader_loop_init_phi9_reg));
end
always @(*) begin
		row_cumulative_sum_cond1_preheader_pre = grid_read_data_wire_a;
end
always @(*) begin
	if ((for_loop_main_cpp_9_9_valid_bit_0 & for_loop_main_cpp_9_9_in_first_iteration_stage0)) begin
		row_cumulative_sum_for_body3_0 = row_cumulative_sum_for_body3_0_reg;
	end
	else if (((for_loop_main_cpp_9_9_valid_bit_0 & ~(for_loop_main_cpp_9_9_in_first_iteration_stage0)) & for_loop_main_cpp_9_9_state_enable_1)) begin
		row_cumulative_sum_for_body3_0 = row_cumulative_sum_for_body3_add7;
	end
	else if (((for_loop_main_cpp_9_9_valid_bit_0 & ~(for_loop_main_cpp_9_9_in_first_iteration_stage0)) & ~(for_loop_main_cpp_9_9_state_enable_1))) begin
		row_cumulative_sum_for_body3_0 = row_cumulative_sum_for_body3_add7_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_2) & (fsm_stall == 1'd0))) */ begin
		row_cumulative_sum_for_body3_0 = row_cumulative_sum_cond1_preheader_pre;
	end
end
always @(posedge clk) begin
	if (for_loop_main_cpp_9_9_state_enable_0) begin
		row_cumulative_sum_for_body3_0_reg <= row_cumulative_sum_for_body3_0;
	end
	if (((cur_state == LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_2) & (fsm_stall == 1'd0))) begin
		row_cumulative_sum_for_body3_0_reg <= row_cumulative_sum_for_body3_0;
	end
end
always @(*) begin
		row_cumulative_sum_for_body3_1 = (row_cumulative_sum_cond1_preheader_loop_init_phi10_reg + for_loop_main_cpp_9_9_inductionVar_stage0);
end
always @(*) begin
		row_cumulative_sum_for_body3_mem_flat_gep15 = (0 + (4 * row_cumulative_sum_for_body3_1));
end
always @(*) begin
		row_cumulative_sum_for_body3_3 = grid_read_data_wire_a;
end
always @(*) begin
		row_cumulative_sum_for_body3_add7 = (row_cumulative_sum_for_body3_3 + row_cumulative_sum_for_body3_0_reg_stage1);
end
always @(*) begin
		row_cumulative_sum_for_inc8_4 = ({1'd0,row_cumulative_sum_cond1_preheader_i_09_reg} + 32'd1);
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_select5 = row_cumulative_sum_for_inc8_4_width_extended[24:0];
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_select3 = row_cumulative_sum_for_inc8_4_width_extended[25:0];
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_select1 = row_cumulative_sum_for_inc8_4_width_extended[28:0];
end
always @(*) begin
		row_cumulative_sum_for_inc8_exitcond = ({23'd0,row_cumulative_sum_for_inc8_4} == 32'd200);
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_concat6 = {row_cumulative_sum_for_inc8_bit_select5_width_extended[24:0], row_cumulative_sum_for_inc8_bit_concat6_bit_select_operand_2[6:0]};
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_concat4 = {row_cumulative_sum_for_inc8_bit_select3_width_extended[25:0], row_cumulative_sum_for_inc8_bit_concat4_bit_select_operand_2[5:0]};
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_concat2 = {row_cumulative_sum_for_inc8_bit_select1_width_extended[28:0], row_cumulative_sum_for_inc8_bit_concat2_bit_select_operand_2[2:0]};
end
always @(*) begin
		row_cumulative_sum_for_inc8_5 = ({4'd0,row_cumulative_sum_for_inc8_bit_concat2} + {1'd0,row_cumulative_sum_for_inc8_bit_concat4});
end
always @(*) begin
		row_cumulative_sum_for_inc8_6 = ({1'd0,row_cumulative_sum_for_inc8_bit_concat6} + {1'd0,row_cumulative_sum_for_inc8_5});
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_select = row_cumulative_sum_for_inc8_6_width_extended[31:1];
end
always @(*) begin
		row_cumulative_sum_for_inc8_bit_concat = {row_cumulative_sum_for_inc8_bit_select_width_extended[30:0], row_cumulative_sum_for_inc8_bit_concat_bit_select_operand_2};
end
always @(posedge clk) begin
	if (~(for_loop_main_cpp_9_9_state_stall_0)) begin
		for_loop_main_cpp_9_9_valid_bit_0 <= (for_loop_main_cpp_9_9_II_counter & for_loop_main_cpp_9_9_start);
	end
	if (reset) begin
		for_loop_main_cpp_9_9_valid_bit_0 <= 1'd0;
	end
end
assign for_loop_main_cpp_9_9_state_stall_0 = 1'd0;
always @(*) begin
	for_loop_main_cpp_9_9_state_enable_0 = (for_loop_main_cpp_9_9_valid_bit_0 & ~(for_loop_main_cpp_9_9_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop_main_cpp_9_9_state_stall_1)) begin
		for_loop_main_cpp_9_9_valid_bit_1 <= for_loop_main_cpp_9_9_state_enable_0;
	end
	if (reset) begin
		for_loop_main_cpp_9_9_valid_bit_1 <= 1'd0;
	end
end
assign for_loop_main_cpp_9_9_state_stall_1 = 1'd0;
always @(*) begin
	for_loop_main_cpp_9_9_state_enable_1 = (for_loop_main_cpp_9_9_valid_bit_1 & ~(for_loop_main_cpp_9_9_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop_main_cpp_9_9_state_stall_2)) begin
		for_loop_main_cpp_9_9_valid_bit_2 <= for_loop_main_cpp_9_9_state_enable_1;
	end
	if (reset) begin
		for_loop_main_cpp_9_9_valid_bit_2 <= 1'd0;
	end
end
assign for_loop_main_cpp_9_9_state_stall_2 = 1'd0;
always @(*) begin
	for_loop_main_cpp_9_9_state_enable_2 = (for_loop_main_cpp_9_9_valid_bit_2 & ~(for_loop_main_cpp_9_9_state_stall_2));
end
always @(posedge clk) begin
	for_loop_main_cpp_9_9_II_counter <= 1'd1;
end
always @(*) begin
	for_loop_main_cpp_9_9_start = (for_loop_main_cpp_9_9_activate_pipeline | ((for_loop_main_cpp_9_9_active & ~(for_loop_main_cpp_9_9_epilogue)) & ~(for_loop_main_cpp_9_9_pipeline_exit_cond)));
	if (reset) begin
		for_loop_main_cpp_9_9_start = 1'd0;
	end
end
always @(*) begin
	for_loop_main_cpp_9_9_activate_pipeline = ((((fsm_stall == 1'd0) & for_loop_main_cpp_9_9_begin_pipeline) & ~(for_loop_main_cpp_9_9_active)) & ~(reset));
end
always @(posedge clk) begin
	if (for_loop_main_cpp_9_9_state_enable_0) begin
		row_cumulative_sum_for_body3_0_reg_stage1 <= row_cumulative_sum_for_body3_0;
	end
end
always @(posedge clk) begin
	if (for_loop_main_cpp_9_9_state_enable_0) begin
		row_cumulative_sum_for_body3_mem_flat_gep15_reg_stage1 <= row_cumulative_sum_for_body3_mem_flat_gep15;
	end
end
always @(posedge clk) begin
	if (for_loop_main_cpp_9_9_state_enable_1) begin
		row_cumulative_sum_for_body3_add7_reg_stage2 <= row_cumulative_sum_for_body3_add7;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_main_cpp_9_9_inductionVar_stage0 <= 0;
	end
	if (for_loop_main_cpp_9_9_activate_pipeline) begin
		for_loop_main_cpp_9_9_inductionVar_stage0 <= 0;
	end
	if ((for_loop_main_cpp_9_9_II_counter & for_loop_main_cpp_9_9_state_enable_0)) begin
		for_loop_main_cpp_9_9_inductionVar_stage0 <= (for_loop_main_cpp_9_9_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop_main_cpp_9_9_pipeline_exit_cond = (for_loop_main_cpp_9_9_state_enable_0 & (for_loop_main_cpp_9_9_inductionVar_stage0 == 198));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_main_cpp_9_9_active <= 1'd0;
	end
	if (for_loop_main_cpp_9_9_activate_pipeline) begin
		for_loop_main_cpp_9_9_active <= 1'd1;
	end
	if (for_loop_main_cpp_9_9_pipeline_finishing) begin
		for_loop_main_cpp_9_9_active <= 1'd0;
	end
end
always @(*) begin
	for_loop_main_cpp_9_9_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop_main_cpp_9_9_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_2) & (fsm_stall == 1'd0))) begin
		for_loop_main_cpp_9_9_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_main_cpp_9_9_epilogue <= 1'd0;
	end
	if ((for_loop_main_cpp_9_9_pipeline_exit_cond & for_loop_main_cpp_9_9_active)) begin
		for_loop_main_cpp_9_9_epilogue <= 1'd1;
	end
	if (for_loop_main_cpp_9_9_pipeline_finishing) begin
		for_loop_main_cpp_9_9_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop_main_cpp_9_9_pipeline_finish = (for_loop_main_cpp_9_9_pipeline_finishing | for_loop_main_cpp_9_9_pipeline_finish_reg);
end
always @(*) begin
	for_loop_main_cpp_9_9_pipeline_finishing = ((for_loop_main_cpp_9_9_epilogue | for_loop_main_cpp_9_9_pipeline_exit_cond) & for_loop_main_cpp_9_9_only_last_stage_enabled);
end
always @(*) begin
	for_loop_main_cpp_9_9_only_last_stage_enabled = ((for_loop_main_cpp_9_9_num_active_iterations == 1'd1) & for_loop_main_cpp_9_9_state_enable_2);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_main_cpp_9_9_num_active_iterations <= 1'd0;
	end
	if ((for_loop_main_cpp_9_9_inserting_new_iteration & ~(for_loop_main_cpp_9_9_state_enable_2))) begin
		for_loop_main_cpp_9_9_num_active_iterations <= (for_loop_main_cpp_9_9_num_active_iterations + 1'd1);
	end
	if ((~(for_loop_main_cpp_9_9_inserting_new_iteration) & for_loop_main_cpp_9_9_state_enable_2)) begin
		for_loop_main_cpp_9_9_num_active_iterations <= (for_loop_main_cpp_9_9_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop_main_cpp_9_9_inserting_new_iteration = ((~(for_loop_main_cpp_9_9_state_stall_0) & for_loop_main_cpp_9_9_II_counter) & for_loop_main_cpp_9_9_start);
end
always @(posedge clk) begin
	for_loop_main_cpp_9_9_pipeline_finish_reg <= for_loop_main_cpp_9_9_pipeline_finish;
	if (reset) begin
		for_loop_main_cpp_9_9_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop_main_cpp_9_9_activate_pipeline) begin
		for_loop_main_cpp_9_9_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop_main_cpp_9_9_activate_pipeline) begin
		for_loop_main_cpp_9_9_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop_main_cpp_9_9_state_enable_0) begin
		for_loop_main_cpp_9_9_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(*) begin
	grid_read_data_wire_a = grid_read_data_a;
end
always @(*) begin
	grid_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	grid_clken_pipeline_cond = (~(for_loop_main_cpp_9_9_state_stall_1) | ~(for_loop_main_cpp_9_9_state_stall_2));
end
always @(*) begin
	row_cumulative_sum_for_inc8_4_width_extended = {20'd0,row_cumulative_sum_for_inc8_4};
end
always @(*) begin
	row_cumulative_sum_for_inc8_bit_select5_width_extended = {16'd0,row_cumulative_sum_for_inc8_bit_select5};
end
assign row_cumulative_sum_for_inc8_bit_concat6_bit_select_operand_2 = 7'd0;
always @(*) begin
	row_cumulative_sum_for_inc8_bit_select3_width_extended = {17'd0,row_cumulative_sum_for_inc8_bit_select3};
end
assign row_cumulative_sum_for_inc8_bit_concat4_bit_select_operand_2 = 6'd0;
always @(*) begin
	row_cumulative_sum_for_inc8_bit_select1_width_extended = {20'd0,row_cumulative_sum_for_inc8_bit_select1};
end
assign row_cumulative_sum_for_inc8_bit_concat2_bit_select_operand_2 = 3'd0;
always @(*) begin
	row_cumulative_sum_for_inc8_6_width_extended = {15'd0,row_cumulative_sum_for_inc8_6};
end
always @(*) begin
	row_cumulative_sum_for_inc8_bit_select_width_extended = {15'd0,row_cumulative_sum_for_inc8_bit_select};
end
assign row_cumulative_sum_for_inc8_bit_concat_bit_select_operand_2 = 1'd1;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_row_cumulative_sum_BB_for_end10_5)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(*) begin
	grid_clken = (grid_clken_pipeline_cond & grid_clken_sequential_cond);
end
assign grid_write_en_a = 1'd0;
assign grid_write_data_a = 0;
always @(*) begin
	grid_read_en_a = 1'd0;
	if ((cur_state == LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_1)) begin
		grid_read_en_a = 1'd1;
	end
	if (for_loop_main_cpp_9_9_state_enable_0) begin
		grid_read_en_a = 1'd1;
	end
end
always @(*) begin
	grid_address_a = 16'd0;
	if ((cur_state == LEGUP_F_row_cumulative_sum_BB_for_cond1_preheader_1)) begin
		grid_address_a = (row_cumulative_sum_cond1_preheader_mem_flat_gep5 >> 2'd2);
	end
	if (for_loop_main_cpp_9_9_valid_bit_0) begin
		grid_address_a = (row_cumulative_sum_for_body3_mem_flat_gep15 >> 2'd2);
	end
end
always @(*) begin
	grid_write_en_b = 1'd0;
	if (for_loop_main_cpp_9_9_state_enable_1) begin
		grid_write_en_b = 1'd1;
	end
end
always @(*) begin
	grid_write_data_b = 0;
	if (for_loop_main_cpp_9_9_valid_bit_1) begin
		grid_write_data_b = row_cumulative_sum_for_body3_add7;
	end
end
assign grid_read_en_b = 1'd0;
always @(*) begin
	grid_address_b = 16'd0;
	if (for_loop_main_cpp_9_9_valid_bit_1) begin
		grid_address_b = (row_cumulative_sum_for_body3_mem_flat_gep15_reg_stage1 >> 2'd2);
	end
end

endmodule



