// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2023.1
// Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
// For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
// Date: Mon Apr  3 09:00:22 2023
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
//
// NOTE:// If you take this code outside the SmartHLS directory structure
// into your own, then you should adjust this constant accordingly.
// E.g. for simulation on Modelsim:
//		vlog +define+MEM_INIT_DIR=/path/to/rtl/mem_init/ part2.v  ...
//
`ifndef MEM_INIT_DIR
`define MEM_INIT_DIR "../hdl/"
`endif


`timescale 1 ns / 1 ns
module sobel_filter_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	in_var_clken,
	in_var_read_en_a,
	in_var_address_a,
	in_var_read_data_a,
	in_var_read_en_b,
	in_var_address_b,
	in_var_read_data_b,
	out_var_clken,
	out_var_write_en_a,
	out_var_write_data_a,
	out_var_read_en_a,
	out_var_address_a,
	out_var_read_data_a,
	out_var_write_en_b,
	out_var_write_data_b,
	out_var_read_en_b,
	out_var_address_b,
	out_var_read_data_b
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  in_var_clken;
output reg  in_var_read_en_a;
output reg [17:0] in_var_address_a;
input [7:0] in_var_read_data_a;
output reg  in_var_read_en_b;
output reg [17:0] in_var_address_b;
input [7:0] in_var_read_data_b;
output reg  out_var_clken;
output reg  out_var_write_en_a;
output reg [7:0] out_var_write_data_a;
output reg  out_var_read_en_a;
output reg [17:0] out_var_address_a;
input [7:0] out_var_read_data_a;
output reg  out_var_write_en_b;
output reg [7:0] out_var_write_data_b;
output reg  out_var_read_en_b;
output reg [17:0] out_var_address_b;
input [7:0] out_var_read_data_b;
reg  sobel_filter_inst_clk;
reg  sobel_filter_inst_reset;
reg  sobel_filter_inst_start;
wire  sobel_filter_inst_ready;
wire  sobel_filter_inst_finish;
wire  sobel_filter_inst_in_var_clken;
wire  sobel_filter_inst_in_var_read_en_a;
wire [17:0] sobel_filter_inst_in_var_address_a;
reg [7:0] sobel_filter_inst_in_var_read_data_a;
wire  sobel_filter_inst_in_var_read_en_b;
wire [17:0] sobel_filter_inst_in_var_address_b;
reg [7:0] sobel_filter_inst_in_var_read_data_b;
wire  sobel_filter_inst_out_var_clken;
wire  sobel_filter_inst_out_var_write_en_a;
wire [7:0] sobel_filter_inst_out_var_write_data_a;
wire  sobel_filter_inst_out_var_read_en_a;
wire [17:0] sobel_filter_inst_out_var_address_a;
reg [7:0] sobel_filter_inst_out_var_read_data_a;
wire  sobel_filter_inst_out_var_write_en_b;
wire [7:0] sobel_filter_inst_out_var_write_data_b;
wire  sobel_filter_inst_out_var_read_en_b;
wire [17:0] sobel_filter_inst_out_var_address_b;
reg [7:0] sobel_filter_inst_out_var_read_data_b;
reg  sobel_filter_inst_finish_reg;


sobel_filter_sobel_filter sobel_filter_inst (
	.clk (sobel_filter_inst_clk),
	.reset (sobel_filter_inst_reset),
	.start (sobel_filter_inst_start),
	.ready (sobel_filter_inst_ready),
	.finish (sobel_filter_inst_finish),
	.in_var_clken (sobel_filter_inst_in_var_clken),
	.in_var_read_en_a (sobel_filter_inst_in_var_read_en_a),
	.in_var_address_a (sobel_filter_inst_in_var_address_a),
	.in_var_read_data_a (sobel_filter_inst_in_var_read_data_a),
	.in_var_read_en_b (sobel_filter_inst_in_var_read_en_b),
	.in_var_address_b (sobel_filter_inst_in_var_address_b),
	.in_var_read_data_b (sobel_filter_inst_in_var_read_data_b),
	.out_var_clken (sobel_filter_inst_out_var_clken),
	.out_var_write_en_a (sobel_filter_inst_out_var_write_en_a),
	.out_var_write_data_a (sobel_filter_inst_out_var_write_data_a),
	.out_var_read_en_a (sobel_filter_inst_out_var_read_en_a),
	.out_var_address_a (sobel_filter_inst_out_var_address_a),
	.out_var_read_data_a (sobel_filter_inst_out_var_read_data_a),
	.out_var_write_en_b (sobel_filter_inst_out_var_write_en_b),
	.out_var_write_data_b (sobel_filter_inst_out_var_write_data_b),
	.out_var_read_en_b (sobel_filter_inst_out_var_read_en_b),
	.out_var_address_b (sobel_filter_inst_out_var_address_b),
	.out_var_read_data_b (sobel_filter_inst_out_var_read_data_b)
);



always @(*) begin
	sobel_filter_inst_clk = clk;
end
always @(*) begin
	sobel_filter_inst_reset = reset;
end
always @(*) begin
	sobel_filter_inst_start = start;
end
always @(*) begin
	sobel_filter_inst_in_var_read_data_a = in_var_read_data_a;
end
always @(*) begin
	sobel_filter_inst_in_var_read_data_b = in_var_read_data_b;
end
always @(*) begin
	sobel_filter_inst_out_var_read_data_a = out_var_read_data_a;
end
always @(*) begin
	sobel_filter_inst_out_var_read_data_b = out_var_read_data_b;
end
always @(posedge clk) begin
	if ((reset | sobel_filter_inst_start)) begin
		sobel_filter_inst_finish_reg <= 1'd0;
	end
	if (sobel_filter_inst_finish) begin
		sobel_filter_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = sobel_filter_inst_ready;
end
always @(*) begin
	finish = sobel_filter_inst_finish;
end
always @(*) begin
	in_var_clken = sobel_filter_inst_in_var_clken;
end
always @(*) begin
	in_var_read_en_a = sobel_filter_inst_in_var_read_en_a;
end
always @(*) begin
	in_var_address_a = sobel_filter_inst_in_var_address_a;
end
always @(*) begin
	in_var_read_en_b = sobel_filter_inst_in_var_read_en_b;
end
always @(*) begin
	in_var_address_b = sobel_filter_inst_in_var_address_b;
end
always @(*) begin
	out_var_clken = sobel_filter_inst_out_var_clken;
end
always @(*) begin
	out_var_write_en_a = sobel_filter_inst_out_var_write_en_a;
end
always @(*) begin
	out_var_write_data_a = sobel_filter_inst_out_var_write_data_a;
end
always @(*) begin
	out_var_read_en_a = sobel_filter_inst_out_var_read_en_a;
end
always @(*) begin
	out_var_address_a = sobel_filter_inst_out_var_address_a;
end
always @(*) begin
	out_var_write_en_b = sobel_filter_inst_out_var_write_en_b;
end
always @(*) begin
	out_var_write_data_b = sobel_filter_inst_out_var_write_data_b;
end
always @(*) begin
	out_var_read_en_b = sobel_filter_inst_out_var_read_en_b;
end
always @(*) begin
	out_var_address_b = sobel_filter_inst_out_var_address_b;
end

endmodule

`timescale 1 ns / 1 ns
module sobel_filter_sobel_filter
(
	clk,
	reset,
	start,
	ready,
	finish,
	in_var_clken,
	in_var_read_en_a,
	in_var_address_a,
	in_var_read_data_a,
	in_var_read_en_b,
	in_var_address_b,
	in_var_read_data_b,
	out_var_clken,
	out_var_write_en_a,
	out_var_write_data_a,
	out_var_read_en_a,
	out_var_address_a,
	out_var_read_data_a,
	out_var_write_en_b,
	out_var_write_data_b,
	out_var_read_en_b,
	out_var_address_b,
	out_var_read_data_b
);

parameter [1:0] LEGUP_0 = 2'd0;
parameter [1:0] LEGUP_pipeline_wait_for_loop_sobel_cpp_20_5_1 = 2'd1;
parameter [1:0] LEGUP_F_sobel_filter_BB_for_end53_2 = 2'd2;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  in_var_clken;
output reg  in_var_read_en_a;
output reg [17:0] in_var_address_a;
input [7:0] in_var_read_data_a;
output reg  in_var_read_en_b;
output reg [17:0] in_var_address_b;
input [7:0] in_var_read_data_b;
output reg  out_var_clken;
output reg  out_var_write_en_a;
output reg [7:0] out_var_write_data_a;
output  out_var_read_en_a;
output reg [17:0] out_var_address_a;
input [7:0] out_var_read_data_a;
output  out_var_write_en_b;
output [7:0] out_var_write_data_b;
output  out_var_read_en_b;
output [17:0] out_var_address_b;
input [7:0] out_var_read_data_b;
reg [1:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [1:0] next_state;
wire  fsm_stall;
reg [31:0] sobel_filter_for_body_x_033;
reg [31:0] sobel_filter_for_body_x_033_reg;
reg [31:0] sobel_filter_for_body_y_032;
reg [31:0] sobel_filter_for_body_y_032_reg;
reg  sobel_filter_for_body_cmp1;
reg  sobel_filter_for_body_bit_concat16;
reg [31:0] sobel_filter_for_body_cond;
reg [22:0] sobel_filter_for_body_bit_select14;
reg [31:0] sobel_filter_for_body_add5;
reg [31:0] sobel_filter_for_body_add5_0;
reg [31:0] sobel_filter_for_body_add14;
reg [31:0] sobel_filter_for_body_bit_concat15;
reg [31:0] sobel_filter_for_body_mem_flat_mul4;
reg [31:0] sobel_filter_for_body_mem_flat_add14;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep17;
reg [7:0] sobel_filter_for_body_0;
reg [7:0] sobel_filter_for_body_bit_concat13;
reg [31:0] sobel_filter_for_body_mem_flat_add24;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep27;
reg [7:0] sobel_filter_for_body_1;
reg [7:0] sobel_filter_for_body_bit_concat12;
reg [31:0] sobel_filter_for_body_add14_2;
reg [31:0] sobel_filter_for_body_mem_flat_add34;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep37;
reg [7:0] sobel_filter_for_body_2;
reg [7:0] sobel_filter_for_body_bit_concat11;
reg [31:0] sobel_filter_for_body_mem_flat_add44;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep47;
reg [7:0] sobel_filter_for_body_3;
reg [7:0] sobel_filter_for_body_bit_concat10;
reg [31:0] sobel_filter_for_body_mem_flat_add54;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep57;
reg [7:0] sobel_filter_for_body_4;
reg [7:0] sobel_filter_for_body_bit_concat9;
reg [31:0] sobel_filter_for_body_mem_flat_mul34;
reg [31:0] sobel_filter_for_body_mem_flat_add64;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep67;
reg [7:0] sobel_filter_for_body_5;
reg [7:0] sobel_filter_for_body_bit_concat8;
reg [31:0] sobel_filter_for_body_mem_flat_add74;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep77;
reg [7:0] sobel_filter_for_body_6;
reg [7:0] sobel_filter_for_body_bit_concat7;
reg [31:0] sobel_filter_for_body_mem_flat_add84;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep87;
reg [7:0] sobel_filter_for_body_7;
reg [7:0] sobel_filter_for_body_bit_concat6;
reg [8:0] sobel_filter_for_body_tmp;
reg [8:0] sobel_filter_for_body_bit_select4;
reg [9:0] sobel_filter_for_body_bit_concat5;
reg [8:0] sobel_filter_for_body_add21_138;
reg [9:0] sobel_filter_for_body_add21_2_1;
reg [10:0] sobel_filter_for_body_add21_246;
reg [11:0] sobel_filter_for_body_add21_2_2;
reg  sobel_filter_for_body_bit_select2;
reg [8:0] sobel_filter_for_body_tmp3;
reg [8:0] sobel_filter_for_body_bit_select3;
reg [9:0] sobel_filter_for_body_bit_concat;
reg [8:0] sobel_filter_for_body_add27_2;
reg [9:0] sobel_filter_for_body_add27_249;
reg [10:0] sobel_filter_for_body_add27_1_2;
reg [11:0] sobel_filter_for_body_add27_2_2;
reg  sobel_filter_for_body_bit_select1;
reg [12:0] sobel_filter_for_body_sub;
reg [12:0] sobel_filter_for_body_cond35;
reg [12:0] sobel_filter_for_body_sub38;
reg [12:0] sobel_filter_for_body_cond41;
reg [13:0] sobel_filter_for_body_add42;
reg [7:0] sobel_filter_for_body_bit_select;
reg  sobel_filter_for_body_cmp43;
reg [7:0] sobel_filter_for_body_conv48;
reg [31:0] sobel_filter_for_body_mem_flat_add94;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep97;
reg  for_loop_sobel_cpp_20_5_valid_bit_0;
wire  for_loop_sobel_cpp_20_5_state_stall_0;
reg  for_loop_sobel_cpp_20_5_state_enable_0;
reg  for_loop_sobel_cpp_20_5_valid_bit_1;
wire  for_loop_sobel_cpp_20_5_state_stall_1;
reg  for_loop_sobel_cpp_20_5_state_enable_1;
reg  for_loop_sobel_cpp_20_5_valid_bit_2;
wire  for_loop_sobel_cpp_20_5_state_stall_2;
reg  for_loop_sobel_cpp_20_5_state_enable_2;
reg  for_loop_sobel_cpp_20_5_valid_bit_3;
wire  for_loop_sobel_cpp_20_5_state_stall_3;
reg  for_loop_sobel_cpp_20_5_state_enable_3;
reg  for_loop_sobel_cpp_20_5_valid_bit_4;
wire  for_loop_sobel_cpp_20_5_state_stall_4;
reg  for_loop_sobel_cpp_20_5_state_enable_4;
reg  for_loop_sobel_cpp_20_5_valid_bit_5;
wire  for_loop_sobel_cpp_20_5_state_stall_5;
reg  for_loop_sobel_cpp_20_5_state_enable_5;
reg [3:0] for_loop_sobel_cpp_20_5_II_counter;
reg  for_loop_sobel_cpp_20_5_start;
reg  for_loop_sobel_cpp_20_5_activate_pipeline;
reg [31:0] sobel_filter_for_body_cond_reg_stage0;
reg [31:0] sobel_filter_for_body_add5_0_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep27_reg_stage0;
reg [7:0] sobel_filter_for_body_bit_concat12_reg_stage0;
reg [7:0] sobel_filter_for_body_bit_concat12_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep47_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep57_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep67_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep77_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep87_reg_stage0;
reg [9:0] sobel_filter_for_body_bit_concat5_reg_stage1;
reg [8:0] sobel_filter_for_body_add21_138_reg_stage0;
reg [9:0] sobel_filter_for_body_add21_2_1_reg_stage0;
reg [9:0] sobel_filter_for_body_add21_2_1_reg_stage1;
reg [8:0] sobel_filter_for_body_add27_2_reg_stage0;
reg [9:0] sobel_filter_for_body_add27_249_reg_stage0;
reg [9:0] sobel_filter_for_body_add27_249_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep97_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body_mem_flat_gep97_reg_stage1;
reg [17:0] for_loop_sobel_cpp_20_5_inductionVar_stage0;
reg  for_loop_sobel_cpp_20_5_pipeline_exit_cond;
reg  for_loop_sobel_cpp_20_5_active;
reg  for_loop_sobel_cpp_20_5_begin_pipeline;
reg  for_loop_sobel_cpp_20_5_epilogue;
reg  for_loop_sobel_cpp_20_5_pipeline_finish;
reg  for_loop_sobel_cpp_20_5_pipeline_finishing;
reg  for_loop_sobel_cpp_20_5_only_last_stage_enabled;
reg [2:0] for_loop_sobel_cpp_20_5_num_active_iterations;
reg  for_loop_sobel_cpp_20_5_inserting_new_iteration;
reg  for_loop_sobel_cpp_20_5_pipeline_finish_reg;
reg  for_loop_sobel_cpp_20_5_in_first_iteration_stage0;
wire [30:0] sobel_filter_for_body_bit_concat16_bit_select_operand_0;
wire [8:0] sobel_filter_for_body_bit_concat15_bit_select_operand_2;
reg [7:0] in_var_read_data_wire_a;
reg  in_var_clken_pipeline_cond;
wire [23:0] sobel_filter_for_body_bit_concat13_bit_select_operand_0;
wire [23:0] sobel_filter_for_body_bit_concat12_bit_select_operand_0;
reg [7:0] in_var_read_data_wire_b;
wire [23:0] sobel_filter_for_body_bit_concat11_bit_select_operand_0;
wire [23:0] sobel_filter_for_body_bit_concat10_bit_select_operand_0;
wire [23:0] sobel_filter_for_body_bit_concat9_bit_select_operand_0;
wire [23:0] sobel_filter_for_body_bit_concat8_bit_select_operand_0;
wire [23:0] sobel_filter_for_body_bit_concat7_bit_select_operand_0;
wire [23:0] sobel_filter_for_body_bit_concat6_bit_select_operand_0;
reg [30:0] sobel_filter_for_body_tmp_width_extended;
reg [30:0] sobel_filter_for_body_bit_select4_width_extended;
wire  sobel_filter_for_body_bit_concat5_bit_select_operand_2;
reg [31:0] sobel_filter_for_body_add21_2_2_width_extended;
reg [30:0] sobel_filter_for_body_tmp3_width_extended;
reg [30:0] sobel_filter_for_body_bit_select3_width_extended;
wire  sobel_filter_for_body_bit_concat_bit_select_operand_2;
reg [31:0] sobel_filter_for_body_add27_2_2_width_extended;
wire [8:0] sobel_filter_for_body_cmp43_op1_temp;
reg  out_var_clken_pipeline_cond;


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
		next_state = LEGUP_pipeline_wait_for_loop_sobel_cpp_20_5_1;
LEGUP_F_sobel_filter_BB_for_end53_2:
		next_state = LEGUP_0;
LEGUP_pipeline_wait_for_loop_sobel_cpp_20_5_1:
	if ((fsm_stall == 1'd0) && (for_loop_sobel_cpp_20_5_pipeline_finish == 1'd1))
		next_state = LEGUP_F_sobel_filter_BB_for_end53_2;
	else if ((fsm_stall == 1'd0) && (for_loop_sobel_cpp_20_5_pipeline_finish == 1'd1))
		next_state = LEGUP_F_sobel_filter_BB_for_end53_2;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
	if ((for_loop_sobel_cpp_20_5_valid_bit_0 & for_loop_sobel_cpp_20_5_in_first_iteration_stage0)) begin
		sobel_filter_for_body_x_033 = sobel_filter_for_body_x_033_reg;
	end
	else if ((for_loop_sobel_cpp_20_5_valid_bit_0 & ~(for_loop_sobel_cpp_20_5_in_first_iteration_stage0))) begin
		sobel_filter_for_body_x_033 = sobel_filter_for_body_add5_0_reg_stage0;
	end
	else /* if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) */ begin
		sobel_filter_for_body_x_033 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_x_033_reg <= sobel_filter_for_body_x_033;
	end
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		sobel_filter_for_body_x_033_reg <= sobel_filter_for_body_x_033;
	end
end
always @(*) begin
	if ((for_loop_sobel_cpp_20_5_valid_bit_0 & for_loop_sobel_cpp_20_5_in_first_iteration_stage0)) begin
		sobel_filter_for_body_y_032 = sobel_filter_for_body_y_032_reg;
	end
	else if ((for_loop_sobel_cpp_20_5_valid_bit_0 & ~(for_loop_sobel_cpp_20_5_in_first_iteration_stage0))) begin
		sobel_filter_for_body_y_032 = sobel_filter_for_body_cond_reg_stage0;
	end
	else /* if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) */ begin
		sobel_filter_for_body_y_032 = 32'd1;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_y_032_reg <= sobel_filter_for_body_y_032;
	end
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		sobel_filter_for_body_y_032_reg <= sobel_filter_for_body_y_032;
	end
end
always @(*) begin
		sobel_filter_for_body_cmp1 = (sobel_filter_for_body_x_033 == 32'd510);
end
always @(*) begin
		sobel_filter_for_body_bit_concat16 = {sobel_filter_for_body_bit_concat16_bit_select_operand_0[30:0], sobel_filter_for_body_cmp1};
end
always @(*) begin
		sobel_filter_for_body_cond = (sobel_filter_for_body_bit_concat16 + sobel_filter_for_body_y_032);
end
always @(*) begin
		sobel_filter_for_body_bit_select14 = sobel_filter_for_body_cond[22:0];
end
always @(*) begin
		sobel_filter_for_body_add5 = (sobel_filter_for_body_x_033 + 32'd1);
end
always @(*) begin
		sobel_filter_for_body_add5_0 = (sobel_filter_for_body_cmp1 ? 32'd1 : sobel_filter_for_body_add5);
end
always @(*) begin
		sobel_filter_for_body_add14 = (sobel_filter_for_body_add5_0 + $signed(-32'd1));
end
always @(*) begin
		sobel_filter_for_body_bit_concat15 = {sobel_filter_for_body_bit_select14[22:0], sobel_filter_for_body_bit_concat15_bit_select_operand_2[8:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_mul4 = (sobel_filter_for_body_bit_concat15 + $signed(-32'd512));
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add14 = (sobel_filter_for_body_mem_flat_mul4 + sobel_filter_for_body_add14);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep17 = (0 + (1 * sobel_filter_for_body_mem_flat_add14));
end
always @(*) begin
		sobel_filter_for_body_0 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_for_body_bit_concat13 = {sobel_filter_for_body_bit_concat13_bit_select_operand_0[23:0], sobel_filter_for_body_0[7:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add24 = (sobel_filter_for_body_mem_flat_mul4 + sobel_filter_for_body_add5_0);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep27 = (0 + (1 * sobel_filter_for_body_mem_flat_add24));
end
always @(*) begin
		sobel_filter_for_body_1 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_for_body_bit_concat12 = {sobel_filter_for_body_bit_concat12_bit_select_operand_0[23:0], sobel_filter_for_body_1[7:0]};
end
always @(*) begin
		sobel_filter_for_body_add14_2 = (sobel_filter_for_body_add5_0 + 32'd1);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add34 = (sobel_filter_for_body_mem_flat_mul4 + sobel_filter_for_body_add14_2);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep37 = (0 + (1 * sobel_filter_for_body_mem_flat_add34));
end
always @(*) begin
		sobel_filter_for_body_2 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_for_body_bit_concat11 = {sobel_filter_for_body_bit_concat11_bit_select_operand_0[23:0], sobel_filter_for_body_2[7:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add44 = (sobel_filter_for_body_bit_concat15 + sobel_filter_for_body_add14);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep47 = (0 + (1 * sobel_filter_for_body_mem_flat_add44));
end
always @(*) begin
		sobel_filter_for_body_3 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_for_body_bit_concat10 = {sobel_filter_for_body_bit_concat10_bit_select_operand_0[23:0], sobel_filter_for_body_3[7:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add54 = (sobel_filter_for_body_bit_concat15 + sobel_filter_for_body_add14_2);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep57 = (0 + (1 * sobel_filter_for_body_mem_flat_add54));
end
always @(*) begin
		sobel_filter_for_body_4 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_for_body_bit_concat9 = {sobel_filter_for_body_bit_concat9_bit_select_operand_0[23:0], sobel_filter_for_body_4[7:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_mul34 = (sobel_filter_for_body_bit_concat15 + 32'd512);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add64 = (sobel_filter_for_body_mem_flat_mul34 + sobel_filter_for_body_add14);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep67 = (0 + (1 * sobel_filter_for_body_mem_flat_add64));
end
always @(*) begin
		sobel_filter_for_body_5 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_for_body_bit_concat8 = {sobel_filter_for_body_bit_concat8_bit_select_operand_0[23:0], sobel_filter_for_body_5[7:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add74 = (sobel_filter_for_body_mem_flat_mul34 + sobel_filter_for_body_add5_0);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep77 = (0 + (1 * sobel_filter_for_body_mem_flat_add74));
end
always @(*) begin
		sobel_filter_for_body_6 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_for_body_bit_concat7 = {sobel_filter_for_body_bit_concat7_bit_select_operand_0[23:0], sobel_filter_for_body_6[7:0]};
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add84 = (sobel_filter_for_body_mem_flat_mul34 + sobel_filter_for_body_add14_2);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep87 = (0 + (1 * sobel_filter_for_body_mem_flat_add84));
end
always @(*) begin
		sobel_filter_for_body_7 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_for_body_bit_concat6 = {sobel_filter_for_body_bit_concat6_bit_select_operand_0[23:0], sobel_filter_for_body_7[7:0]};
end
always @(*) begin
		sobel_filter_for_body_tmp = ({1'd0,sobel_filter_for_body_bit_concat9} - {1'd0,sobel_filter_for_body_bit_concat10});
end
always @(*) begin
		sobel_filter_for_body_bit_select4 = sobel_filter_for_body_tmp_width_extended[30:0];
end
always @(*) begin
		sobel_filter_for_body_bit_concat5 = {sobel_filter_for_body_bit_select4_width_extended[30:0], sobel_filter_for_body_bit_concat5_bit_select_operand_2};
end
always @(*) begin
		sobel_filter_for_body_add21_138 = ({1'd0,sobel_filter_for_body_bit_concat11} - {1'd0,sobel_filter_for_body_bit_concat13});
end
always @(*) begin
		sobel_filter_for_body_add21_2_1 = ($signed({{1{sobel_filter_for_body_add21_138_reg_stage0[8]}},sobel_filter_for_body_add21_138_reg_stage0}) - {2'd0,sobel_filter_for_body_bit_concat8});
end
always @(*) begin
		sobel_filter_for_body_add21_246 = ($signed({{1{sobel_filter_for_body_add21_2_1_reg_stage1[9]}},sobel_filter_for_body_add21_2_1_reg_stage1}) + {3'd0,sobel_filter_for_body_bit_concat6});
end
always @(*) begin
		sobel_filter_for_body_add21_2_2 = ($signed({{1{sobel_filter_for_body_add21_246[10]}},sobel_filter_for_body_add21_246}) + $signed({{2{sobel_filter_for_body_bit_concat5_reg_stage1[9]}},sobel_filter_for_body_bit_concat5_reg_stage1}));
end
always @(*) begin
		sobel_filter_for_body_bit_select2 = sobel_filter_for_body_add21_2_2_width_extended[31];
end
always @(*) begin
		sobel_filter_for_body_tmp3 = ({1'd0,sobel_filter_for_body_bit_concat12_reg_stage1} - {1'd0,sobel_filter_for_body_bit_concat7});
end
always @(*) begin
		sobel_filter_for_body_bit_select3 = sobel_filter_for_body_tmp3_width_extended[30:0];
end
always @(*) begin
		sobel_filter_for_body_bit_concat = {sobel_filter_for_body_bit_select3_width_extended[30:0], sobel_filter_for_body_bit_concat_bit_select_operand_2};
end
always @(*) begin
		sobel_filter_for_body_add27_2 = ({1'd0,sobel_filter_for_body_bit_concat11} + {1'd0,sobel_filter_for_body_bit_concat13});
end
always @(*) begin
		sobel_filter_for_body_add27_249 = ({1'd0,sobel_filter_for_body_add27_2_reg_stage0} - {2'd0,sobel_filter_for_body_bit_concat8});
end
always @(*) begin
		sobel_filter_for_body_add27_1_2 = ($signed({{1{sobel_filter_for_body_add27_249_reg_stage1[9]}},sobel_filter_for_body_add27_249_reg_stage1}) - {3'd0,sobel_filter_for_body_bit_concat6});
end
always @(*) begin
		sobel_filter_for_body_add27_2_2 = ($signed({{1{sobel_filter_for_body_add27_1_2[10]}},sobel_filter_for_body_add27_1_2}) + $signed({{2{sobel_filter_for_body_bit_concat[9]}},sobel_filter_for_body_bit_concat}));
end
always @(*) begin
		sobel_filter_for_body_bit_select1 = sobel_filter_for_body_add27_2_2_width_extended[31];
end
always @(*) begin
		sobel_filter_for_body_sub = (32'd0 - $signed({{1{sobel_filter_for_body_add21_2_2[11]}},sobel_filter_for_body_add21_2_2}));
end
always @(*) begin
		sobel_filter_for_body_cond35 = (sobel_filter_for_body_bit_select2 ? sobel_filter_for_body_sub : {{1{sobel_filter_for_body_add21_2_2[11]}},sobel_filter_for_body_add21_2_2});
end
always @(*) begin
		sobel_filter_for_body_sub38 = (32'd0 - $signed({{1{sobel_filter_for_body_add27_2_2[11]}},sobel_filter_for_body_add27_2_2}));
end
always @(*) begin
		sobel_filter_for_body_cond41 = (sobel_filter_for_body_bit_select1 ? sobel_filter_for_body_sub38 : {{1{sobel_filter_for_body_add27_2_2[11]}},sobel_filter_for_body_add27_2_2});
end
always @(*) begin
		sobel_filter_for_body_add42 = ($signed({{1{sobel_filter_for_body_cond41[12]}},sobel_filter_for_body_cond41}) + $signed({{1{sobel_filter_for_body_cond35[12]}},sobel_filter_for_body_cond35}));
end
always @(*) begin
		sobel_filter_for_body_bit_select = sobel_filter_for_body_add42[7:0];
end
always @(*) begin
		sobel_filter_for_body_cmp43 = ($signed({{18{sobel_filter_for_body_add42[13]}},sobel_filter_for_body_add42}) > $signed({23'd0,sobel_filter_for_body_cmp43_op1_temp}));
end
always @(*) begin
		sobel_filter_for_body_conv48 = (sobel_filter_for_body_cmp43 ? -8'd1 : sobel_filter_for_body_bit_select);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_add94 = (sobel_filter_for_body_bit_concat15 + sobel_filter_for_body_add5_0);
end
always @(*) begin
		sobel_filter_for_body_mem_flat_gep97 = (0 + (1 * sobel_filter_for_body_mem_flat_add94));
end
always @(posedge clk) begin
	if (~(for_loop_sobel_cpp_20_5_state_stall_0)) begin
		for_loop_sobel_cpp_20_5_valid_bit_0 <= (for_loop_sobel_cpp_20_5_II_counter[3] & for_loop_sobel_cpp_20_5_start);
	end
	if (reset) begin
		for_loop_sobel_cpp_20_5_valid_bit_0 <= 1'd0;
	end
end
assign for_loop_sobel_cpp_20_5_state_stall_0 = 1'd0;
always @(*) begin
	for_loop_sobel_cpp_20_5_state_enable_0 = (for_loop_sobel_cpp_20_5_valid_bit_0 & ~(for_loop_sobel_cpp_20_5_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop_sobel_cpp_20_5_state_stall_1)) begin
		for_loop_sobel_cpp_20_5_valid_bit_1 <= for_loop_sobel_cpp_20_5_state_enable_0;
	end
	if (reset) begin
		for_loop_sobel_cpp_20_5_valid_bit_1 <= 1'd0;
	end
end
assign for_loop_sobel_cpp_20_5_state_stall_1 = 1'd0;
always @(*) begin
	for_loop_sobel_cpp_20_5_state_enable_1 = (for_loop_sobel_cpp_20_5_valid_bit_1 & ~(for_loop_sobel_cpp_20_5_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop_sobel_cpp_20_5_state_stall_2)) begin
		for_loop_sobel_cpp_20_5_valid_bit_2 <= for_loop_sobel_cpp_20_5_state_enable_1;
	end
	if (reset) begin
		for_loop_sobel_cpp_20_5_valid_bit_2 <= 1'd0;
	end
end
assign for_loop_sobel_cpp_20_5_state_stall_2 = 1'd0;
always @(*) begin
	for_loop_sobel_cpp_20_5_state_enable_2 = (for_loop_sobel_cpp_20_5_valid_bit_2 & ~(for_loop_sobel_cpp_20_5_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop_sobel_cpp_20_5_state_stall_3)) begin
		for_loop_sobel_cpp_20_5_valid_bit_3 <= for_loop_sobel_cpp_20_5_state_enable_2;
	end
	if (reset) begin
		for_loop_sobel_cpp_20_5_valid_bit_3 <= 1'd0;
	end
end
assign for_loop_sobel_cpp_20_5_state_stall_3 = 1'd0;
always @(*) begin
	for_loop_sobel_cpp_20_5_state_enable_3 = (for_loop_sobel_cpp_20_5_valid_bit_3 & ~(for_loop_sobel_cpp_20_5_state_stall_3));
end
always @(posedge clk) begin
	if (~(for_loop_sobel_cpp_20_5_state_stall_4)) begin
		for_loop_sobel_cpp_20_5_valid_bit_4 <= for_loop_sobel_cpp_20_5_state_enable_3;
	end
	if (reset) begin
		for_loop_sobel_cpp_20_5_valid_bit_4 <= 1'd0;
	end
end
assign for_loop_sobel_cpp_20_5_state_stall_4 = 1'd0;
always @(*) begin
	for_loop_sobel_cpp_20_5_state_enable_4 = (for_loop_sobel_cpp_20_5_valid_bit_4 & ~(for_loop_sobel_cpp_20_5_state_stall_4));
end
always @(posedge clk) begin
	if (~(for_loop_sobel_cpp_20_5_state_stall_5)) begin
		for_loop_sobel_cpp_20_5_valid_bit_5 <= for_loop_sobel_cpp_20_5_state_enable_4;
	end
	if (reset) begin
		for_loop_sobel_cpp_20_5_valid_bit_5 <= 1'd0;
	end
end
assign for_loop_sobel_cpp_20_5_state_stall_5 = 1'd0;
always @(*) begin
	for_loop_sobel_cpp_20_5_state_enable_5 = (for_loop_sobel_cpp_20_5_valid_bit_5 & ~(for_loop_sobel_cpp_20_5_state_stall_5));
end
always @(posedge clk) begin
	for_loop_sobel_cpp_20_5_II_counter <= {for_loop_sobel_cpp_20_5_II_counter[2:0], for_loop_sobel_cpp_20_5_II_counter[3]};
	if (reset) begin
		for_loop_sobel_cpp_20_5_II_counter <= 4'd1;
	end
end
always @(*) begin
	for_loop_sobel_cpp_20_5_start = (for_loop_sobel_cpp_20_5_activate_pipeline | ((for_loop_sobel_cpp_20_5_active & ~(for_loop_sobel_cpp_20_5_epilogue)) & ~(for_loop_sobel_cpp_20_5_pipeline_exit_cond)));
	if (reset) begin
		for_loop_sobel_cpp_20_5_start = 1'd0;
	end
end
always @(*) begin
	for_loop_sobel_cpp_20_5_activate_pipeline = ((((fsm_stall == 1'd0) & for_loop_sobel_cpp_20_5_begin_pipeline) & ~(for_loop_sobel_cpp_20_5_active)) & ~(reset));
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_cond_reg_stage0 <= sobel_filter_for_body_cond;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_add5_0_reg_stage0 <= sobel_filter_for_body_add5_0;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep27_reg_stage0 <= sobel_filter_for_body_mem_flat_gep27;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_2) begin
		sobel_filter_for_body_bit_concat12_reg_stage0 <= sobel_filter_for_body_bit_concat12;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		sobel_filter_for_body_bit_concat12_reg_stage1 <= sobel_filter_for_body_bit_concat12_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep47_reg_stage0 <= sobel_filter_for_body_mem_flat_gep47;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep57_reg_stage0 <= sobel_filter_for_body_mem_flat_gep57;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep67_reg_stage0 <= sobel_filter_for_body_mem_flat_gep67;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep77_reg_stage0 <= sobel_filter_for_body_mem_flat_gep77;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep87_reg_stage0 <= sobel_filter_for_body_mem_flat_gep87;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		sobel_filter_for_body_bit_concat5_reg_stage1 <= sobel_filter_for_body_bit_concat5;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_1) begin
		sobel_filter_for_body_add21_138_reg_stage0 <= sobel_filter_for_body_add21_138;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_2) begin
		sobel_filter_for_body_add21_2_1_reg_stage0 <= sobel_filter_for_body_add21_2_1;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		sobel_filter_for_body_add21_2_1_reg_stage1 <= sobel_filter_for_body_add21_2_1_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_1) begin
		sobel_filter_for_body_add27_2_reg_stage0 <= sobel_filter_for_body_add27_2;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_2) begin
		sobel_filter_for_body_add27_249_reg_stage0 <= sobel_filter_for_body_add27_249;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		sobel_filter_for_body_add27_249_reg_stage1 <= sobel_filter_for_body_add27_249_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		sobel_filter_for_body_mem_flat_gep97_reg_stage0 <= sobel_filter_for_body_mem_flat_gep97;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		sobel_filter_for_body_mem_flat_gep97_reg_stage1 <= sobel_filter_for_body_mem_flat_gep97_reg_stage0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_sobel_cpp_20_5_inductionVar_stage0 <= 18'd0;
	end
	if (for_loop_sobel_cpp_20_5_activate_pipeline) begin
		for_loop_sobel_cpp_20_5_inductionVar_stage0 <= 18'd0;
	end
	if ((for_loop_sobel_cpp_20_5_II_counter[3] & for_loop_sobel_cpp_20_5_state_enable_3)) begin
		for_loop_sobel_cpp_20_5_inductionVar_stage0 <= (for_loop_sobel_cpp_20_5_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop_sobel_cpp_20_5_pipeline_exit_cond = (for_loop_sobel_cpp_20_5_state_enable_0 & ({14'd0,for_loop_sobel_cpp_20_5_inductionVar_stage0} == 260099));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_sobel_cpp_20_5_active <= 1'd0;
	end
	if (for_loop_sobel_cpp_20_5_activate_pipeline) begin
		for_loop_sobel_cpp_20_5_active <= 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_pipeline_finishing) begin
		for_loop_sobel_cpp_20_5_active <= 1'd0;
	end
end
always @(*) begin
	for_loop_sobel_cpp_20_5_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop_sobel_cpp_20_5_begin_pipeline = 1'd0;
	end
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		for_loop_sobel_cpp_20_5_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_sobel_cpp_20_5_epilogue <= 1'd0;
	end
	if ((for_loop_sobel_cpp_20_5_pipeline_exit_cond & for_loop_sobel_cpp_20_5_active)) begin
		for_loop_sobel_cpp_20_5_epilogue <= 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_pipeline_finishing) begin
		for_loop_sobel_cpp_20_5_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop_sobel_cpp_20_5_pipeline_finish = (for_loop_sobel_cpp_20_5_pipeline_finishing | for_loop_sobel_cpp_20_5_pipeline_finish_reg);
end
always @(*) begin
	for_loop_sobel_cpp_20_5_pipeline_finishing = ((for_loop_sobel_cpp_20_5_epilogue | for_loop_sobel_cpp_20_5_pipeline_exit_cond) & for_loop_sobel_cpp_20_5_only_last_stage_enabled);
end
always @(*) begin
	for_loop_sobel_cpp_20_5_only_last_stage_enabled = ((for_loop_sobel_cpp_20_5_num_active_iterations == 1'd1) & for_loop_sobel_cpp_20_5_state_enable_5);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_sobel_cpp_20_5_num_active_iterations <= 1'd0;
	end
	if ((for_loop_sobel_cpp_20_5_inserting_new_iteration & ~(for_loop_sobel_cpp_20_5_state_enable_5))) begin
		for_loop_sobel_cpp_20_5_num_active_iterations <= (for_loop_sobel_cpp_20_5_num_active_iterations + 1'd1);
	end
	if ((~(for_loop_sobel_cpp_20_5_inserting_new_iteration) & for_loop_sobel_cpp_20_5_state_enable_5)) begin
		for_loop_sobel_cpp_20_5_num_active_iterations <= (for_loop_sobel_cpp_20_5_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop_sobel_cpp_20_5_inserting_new_iteration = ((~(for_loop_sobel_cpp_20_5_state_stall_0) & for_loop_sobel_cpp_20_5_II_counter[3]) & for_loop_sobel_cpp_20_5_start);
end
always @(posedge clk) begin
	for_loop_sobel_cpp_20_5_pipeline_finish_reg <= for_loop_sobel_cpp_20_5_pipeline_finish;
	if (reset) begin
		for_loop_sobel_cpp_20_5_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop_sobel_cpp_20_5_activate_pipeline) begin
		for_loop_sobel_cpp_20_5_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop_sobel_cpp_20_5_activate_pipeline) begin
		for_loop_sobel_cpp_20_5_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		for_loop_sobel_cpp_20_5_in_first_iteration_stage0 <= 1'd0;
	end
end
assign sobel_filter_for_body_bit_concat16_bit_select_operand_0 = 31'd0;
assign sobel_filter_for_body_bit_concat15_bit_select_operand_2 = 9'd0;
always @(*) begin
	in_var_read_data_wire_a = in_var_read_data_a;
end
always @(*) begin
	in_var_clken_pipeline_cond = (((~(for_loop_sobel_cpp_20_5_state_stall_1) | ~(for_loop_sobel_cpp_20_5_state_stall_2)) | ~(for_loop_sobel_cpp_20_5_state_stall_3)) | ~(for_loop_sobel_cpp_20_5_state_stall_4));
end
assign sobel_filter_for_body_bit_concat13_bit_select_operand_0 = 24'd0;
assign sobel_filter_for_body_bit_concat12_bit_select_operand_0 = 24'd0;
always @(*) begin
	in_var_read_data_wire_b = in_var_read_data_b;
end
assign sobel_filter_for_body_bit_concat11_bit_select_operand_0 = 24'd0;
assign sobel_filter_for_body_bit_concat10_bit_select_operand_0 = 24'd0;
assign sobel_filter_for_body_bit_concat9_bit_select_operand_0 = 24'd0;
assign sobel_filter_for_body_bit_concat8_bit_select_operand_0 = 24'd0;
assign sobel_filter_for_body_bit_concat7_bit_select_operand_0 = 24'd0;
assign sobel_filter_for_body_bit_concat6_bit_select_operand_0 = 24'd0;
always @(*) begin
	sobel_filter_for_body_tmp_width_extended = {{22{sobel_filter_for_body_tmp[8]}},sobel_filter_for_body_tmp};
end
always @(*) begin
	sobel_filter_for_body_bit_select4_width_extended = {{22{sobel_filter_for_body_bit_select4[8]}},sobel_filter_for_body_bit_select4};
end
assign sobel_filter_for_body_bit_concat5_bit_select_operand_2 = 1'd0;
always @(*) begin
	sobel_filter_for_body_add21_2_2_width_extended = {{20{sobel_filter_for_body_add21_2_2[11]}},sobel_filter_for_body_add21_2_2};
end
always @(*) begin
	sobel_filter_for_body_tmp3_width_extended = {{22{sobel_filter_for_body_tmp3[8]}},sobel_filter_for_body_tmp3};
end
always @(*) begin
	sobel_filter_for_body_bit_select3_width_extended = {{22{sobel_filter_for_body_bit_select3[8]}},sobel_filter_for_body_bit_select3};
end
assign sobel_filter_for_body_bit_concat_bit_select_operand_2 = 1'd0;
always @(*) begin
	sobel_filter_for_body_add27_2_2_width_extended = {{20{sobel_filter_for_body_add27_2_2[11]}},sobel_filter_for_body_add27_2_2};
end
assign sobel_filter_for_body_cmp43_op1_temp = 32'd255;
always @(*) begin
	out_var_clken_pipeline_cond = ~(for_loop_sobel_cpp_20_5_state_stall_5);
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_end53_2)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(*) begin
	in_var_clken = in_var_clken_pipeline_cond;
end
always @(*) begin
	in_var_read_en_a = 1'd0;
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		in_var_read_en_a = 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_1) begin
		in_var_read_en_a = 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_2) begin
		in_var_read_en_a = 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		in_var_read_en_a = 1'd1;
	end
end
always @(*) begin
	in_var_address_a = 18'd0;
	if (for_loop_sobel_cpp_20_5_valid_bit_0) begin
		in_var_address_a = (sobel_filter_for_body_mem_flat_gep17 >> 1'd0);
	end
	if (for_loop_sobel_cpp_20_5_valid_bit_1) begin
		in_var_address_a = (sobel_filter_for_body_mem_flat_gep27_reg_stage0 >> 1'd0);
	end
	if (for_loop_sobel_cpp_20_5_valid_bit_2) begin
		in_var_address_a = (sobel_filter_for_body_mem_flat_gep47_reg_stage0 >> 1'd0);
	end
	if (for_loop_sobel_cpp_20_5_valid_bit_3) begin
		in_var_address_a = (sobel_filter_for_body_mem_flat_gep77_reg_stage0 >> 1'd0);
	end
end
always @(*) begin
	in_var_read_en_b = 1'd0;
	if (for_loop_sobel_cpp_20_5_state_enable_0) begin
		in_var_read_en_b = 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_2) begin
		in_var_read_en_b = 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_1) begin
		in_var_read_en_b = 1'd1;
	end
	if (for_loop_sobel_cpp_20_5_state_enable_3) begin
		in_var_read_en_b = 1'd1;
	end
end
always @(*) begin
	in_var_address_b = 18'd0;
	if (for_loop_sobel_cpp_20_5_valid_bit_0) begin
		in_var_address_b = (sobel_filter_for_body_mem_flat_gep37 >> 1'd0);
	end
	if (for_loop_sobel_cpp_20_5_valid_bit_2) begin
		in_var_address_b = (sobel_filter_for_body_mem_flat_gep57_reg_stage0 >> 1'd0);
	end
	if (for_loop_sobel_cpp_20_5_valid_bit_1) begin
		in_var_address_b = (sobel_filter_for_body_mem_flat_gep67_reg_stage0 >> 1'd0);
	end
	if (for_loop_sobel_cpp_20_5_valid_bit_3) begin
		in_var_address_b = (sobel_filter_for_body_mem_flat_gep87_reg_stage0 >> 1'd0);
	end
end
always @(*) begin
	out_var_clken = out_var_clken_pipeline_cond;
end
always @(*) begin
	out_var_write_en_a = 1'd0;
	if (for_loop_sobel_cpp_20_5_state_enable_4) begin
		out_var_write_en_a = 1'd1;
	end
end
always @(*) begin
	out_var_write_data_a = 8'd0;
	if (for_loop_sobel_cpp_20_5_valid_bit_4) begin
		out_var_write_data_a = sobel_filter_for_body_conv48;
	end
end
assign out_var_read_en_a = 1'd0;
always @(*) begin
	out_var_address_a = 18'd0;
	if (for_loop_sobel_cpp_20_5_valid_bit_4) begin
		out_var_address_a = (sobel_filter_for_body_mem_flat_gep97_reg_stage1 >> 1'd0);
	end
end
assign out_var_write_en_b = 1'd0;
assign out_var_write_data_b = 8'd0;
assign out_var_read_en_b = 1'd0;
assign out_var_address_b = 18'd0;

endmodule



