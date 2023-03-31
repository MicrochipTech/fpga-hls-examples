// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2023.1
// Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
// For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
// Date: Fri Mar 31 11:45:42 2023
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
//
// NOTE:// If you take this code outside the SmartHLS directory structure
// into your own, then you should adjust this constant accordingly.
// E.g. for simulation on Modelsim:
//		vlog +define+MEM_INIT_DIR=/path/to/rtl/mem_init/ part1.v  ...
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

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_cond1_preheader_1 = 4'd1;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_body3_2 = 4'd2;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_cond14_preheader_3 = 4'd3;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_cond14_preheader_4 = 4'd4;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_cond14_preheader_5 = 4'd5;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_cond14_preheader_6 = 4'd6;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_cond14_preheader_7 = 4'd7;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_inc54_8 = 4'd8;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_inc54_9 = 4'd9;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_inc57_10 = 4'd10;
parameter [3:0] LEGUP_F_sobel_filter_BB_for_end59_11 = 4'd11;

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
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;
reg [9:0] sobel_filter_cond1_preheader_i_038;
reg [9:0] sobel_filter_cond1_preheader_i_038_reg;
reg [9:0] sobel_filter_cond1_preheader_bit_select17;
reg [18:0] sobel_filter_cond1_preheader_bit_concat20;
reg [18:0] sobel_filter_cond1_preheader_bit_concat20_reg;
reg [19:0] sobel_filter_cond1_preheader_0;
reg [19:0] sobel_filter_cond1_preheader_0_reg;
reg [19:0] sobel_filter_cond1_preheader_1;
reg [19:0] sobel_filter_cond1_preheader_1_reg;
reg [19:0] sobel_filter_cond1_preheader_2;
reg [19:0] sobel_filter_cond1_preheader_2_reg;
reg [19:0] sobel_filter_cond1_preheader_3;
reg [19:0] sobel_filter_cond1_preheader_3_reg;
reg [18:0] sobel_filter_cond1_preheader_bit_concat19;
reg [18:0] sobel_filter_cond1_preheader_bit_concat19_reg;
reg [18:0] sobel_filter_cond1_preheader_bit_concat18;
reg [18:0] sobel_filter_cond1_preheader_bit_concat18_reg;
reg [19:0] sobel_filter_cond1_preheader_4;
reg [19:0] sobel_filter_cond1_preheader_4_reg;
reg [19:0] sobel_filter_cond1_preheader_5;
reg [19:0] sobel_filter_cond1_preheader_5_reg;
reg [10:0] sobel_filter_cond1_preheader_i_0_off;
reg  sobel_filter_cond1_preheader_6;
reg  sobel_filter_cond1_preheader_bit_concat16;
reg  sobel_filter_cond1_preheader_bit_concat16_reg;
reg [31:0] sobel_filter_for_body3_7;
reg [31:0] sobel_filter_for_body3_7_reg;
reg [31:0] sobel_filter_for_body3_loop_init_phi;
reg [31:0] sobel_filter_for_body3_loop_init_phi_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body3_mem_flat_gep87;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_for_body3_mem_flat_gep87_reg;
reg  sobel_filter_for_body3_cmp7;
reg  sobel_filter_for_body3_bit_concat15;
reg  sobel_filter_for_body3_or9;
reg  sobel_filter_for_body3_cmp10;
reg  sobel_filter_for_body3_bit_concat14;
reg  sobel_filter_for_body3_or12;
reg  sobel_filter_for_body3_tobool;
reg [31:0] sobel_filter_for_body3_8;
reg [31:0] sobel_filter_for_body3_8_reg;
reg [31:0] sobel_filter_for_body3_9;
reg [31:0] sobel_filter_for_body3_9_reg;
reg [31:0] sobel_filter_for_body3_10;
reg [31:0] sobel_filter_for_body3_10_reg;
reg [31:0] sobel_filter_for_body3_11;
reg [31:0] sobel_filter_for_body3_11_reg;
reg [31:0] sobel_filter_for_body3_12;
reg [31:0] sobel_filter_for_body3_12_reg;
reg [31:0] sobel_filter_for_body3_13;
reg [31:0] sobel_filter_for_body3_13_reg;
reg [31:0] sobel_filter_for_body3_14;
reg [31:0] sobel_filter_for_body3_14_reg;
reg [31:0] sobel_filter_for_body3_15;
reg [31:0] sobel_filter_for_body3_15_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep77;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep77_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep67;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep67_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep57;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep57_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep47;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep47_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep37;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep37_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep27;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep17;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep17_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_ond14_preheader_mem_flat_gep7;
reg [7:0] sobel_filter_ond14_preheader_16;
reg [7:0] sobel_filter_ond14_preheader_bit_concat13;
reg [7:0] sobel_filter_ond14_preheader_17;
reg [7:0] sobel_filter_ond14_preheader_bit_concat12;
reg [7:0] sobel_filter_ond14_preheader_bit_concat12_reg;
reg [7:0] sobel_filter_ond14_preheader_18;
reg [7:0] sobel_filter_ond14_preheader_bit_concat11;
reg [7:0] sobel_filter_ond14_preheader_19;
reg [7:0] sobel_filter_ond14_preheader_bit_concat10;
reg [7:0] sobel_filter_ond14_preheader_20;
reg [7:0] sobel_filter_ond14_preheader_bit_concat9;
reg [7:0] sobel_filter_ond14_preheader_21;
reg [7:0] sobel_filter_ond14_preheader_bit_concat8;
reg [7:0] sobel_filter_ond14_preheader_22;
reg [7:0] sobel_filter_ond14_preheader_bit_concat7;
reg [7:0] sobel_filter_ond14_preheader_23;
reg [7:0] sobel_filter_ond14_preheader_bit_concat6;
reg [8:0] sobel_filter_ond14_preheader_tmp;
reg [8:0] sobel_filter_ond14_preheader_bit_select4;
reg [9:0] sobel_filter_ond14_preheader_bit_concat5;
reg [9:0] sobel_filter_ond14_preheader_bit_concat5_reg;
reg [8:0] sobel_filter_ond14_preheader_add28_143;
reg [8:0] sobel_filter_ond14_preheader_add28_143_reg;
reg [9:0] sobel_filter_ond14_preheader_add28_2_1;
reg [9:0] sobel_filter_ond14_preheader_add28_2_1_reg;
reg [10:0] sobel_filter_ond14_preheader_add28_251;
reg [11:0] sobel_filter_ond14_preheader_add28_2_2;
reg  sobel_filter_ond14_preheader_bit_select2;
reg [8:0] sobel_filter_ond14_preheader_tmp3;
reg [8:0] sobel_filter_ond14_preheader_bit_select3;
reg [9:0] sobel_filter_ond14_preheader_bit_concat;
reg [8:0] sobel_filter_ond14_preheader_add34_2;
reg [8:0] sobel_filter_ond14_preheader_add34_2_reg;
reg [9:0] sobel_filter_ond14_preheader_add34_254;
reg [9:0] sobel_filter_ond14_preheader_add34_254_reg;
reg [10:0] sobel_filter_ond14_preheader_add34_1_2;
reg [11:0] sobel_filter_ond14_preheader_add34_2_2;
reg  sobel_filter_ond14_preheader_bit_select1;
reg [12:0] sobel_filter_ond14_preheader_sub;
reg [12:0] sobel_filter_ond14_preheader_cond;
reg [12:0] sobel_filter_ond14_preheader_sub41;
reg [12:0] sobel_filter_ond14_preheader_cond44;
reg [13:0] sobel_filter_ond14_preheader_add45;
reg [7:0] sobel_filter_ond14_preheader_bit_select;
reg  sobel_filter_ond14_preheader_cmp46;
reg [7:0] sobel_filter_ond14_preheader_conv51;
reg [7:0] sobel_filter_for_inc54_conv51_sink;
reg [7:0] sobel_filter_for_inc54_conv51_sink_reg;
reg [31:0] sobel_filter_for_inc54_24;
reg [31:0] sobel_filter_for_inc54_24_reg;
reg  sobel_filter_for_inc54_exitcond2;
reg  sobel_filter_for_inc54_exitcond2_reg;
reg [31:0] sobel_filter_for_inc54_25;
reg [31:0] sobel_filter_for_inc54_25_reg;
reg [10:0] sobel_filter_for_inc57_26;
reg  sobel_filter_for_inc57_exitcond;
reg [22:0] sobel_filter_cond1_preheader_i_038_reg_width_extended;
reg [22:0] sobel_filter_cond1_preheader_bit_select17_width_extended;
wire [8:0] sobel_filter_cond1_preheader_bit_concat20_bit_select_operand_2;
wire [8:0] sobel_filter_cond1_preheader_bit_concat19_bit_select_operand_2;
wire [8:0] sobel_filter_cond1_preheader_bit_concat18_bit_select_operand_2;
wire [30:0] sobel_filter_cond1_preheader_bit_concat16_bit_select_operand_0;
wire [1:0] sobel_filter_for_body3_cmp7_op1_temp;
wire [30:0] sobel_filter_for_body3_bit_concat15_bit_select_operand_0;
wire [9:0] sobel_filter_for_body3_cmp10_op1_temp;
wire [30:0] sobel_filter_for_body3_bit_concat14_bit_select_operand_0;
reg [7:0] in_var_read_data_wire_a;
reg  in_var_clken_sequential_cond;
reg [7:0] in_var_read_data_wire_b;
wire [23:0] sobel_filter_ond14_preheader_bit_concat13_bit_select_operand_0;
wire [23:0] sobel_filter_ond14_preheader_bit_concat11_bit_select_operand_0;
wire [23:0] sobel_filter_ond14_preheader_bit_concat12_bit_select_operand_0;
wire [23:0] sobel_filter_ond14_preheader_bit_concat8_bit_select_operand_0;
wire [23:0] sobel_filter_ond14_preheader_bit_concat10_bit_select_operand_0;
wire [23:0] sobel_filter_ond14_preheader_bit_concat9_bit_select_operand_0;
reg [30:0] sobel_filter_ond14_preheader_tmp_width_extended;
reg [30:0] sobel_filter_ond14_preheader_bit_select4_width_extended;
wire  sobel_filter_ond14_preheader_bit_concat5_bit_select_operand_2;
wire [23:0] sobel_filter_ond14_preheader_bit_concat7_bit_select_operand_0;
wire [23:0] sobel_filter_ond14_preheader_bit_concat6_bit_select_operand_0;
reg [31:0] sobel_filter_ond14_preheader_add28_2_2_width_extended;
reg [30:0] sobel_filter_ond14_preheader_tmp3_width_extended;
reg [30:0] sobel_filter_ond14_preheader_bit_select3_width_extended;
wire  sobel_filter_ond14_preheader_bit_concat_bit_select_operand_2;
reg [31:0] sobel_filter_ond14_preheader_add34_2_2_width_extended;
wire [8:0] sobel_filter_ond14_preheader_cmp46_op1_temp;
reg  out_var_clken_sequential_cond;


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
		next_state = LEGUP_F_sobel_filter_BB_for_cond1_preheader_1;
LEGUP_F_sobel_filter_BB_for_body3_2:
	if ((fsm_stall == 1'd0) && (sobel_filter_for_body3_tobool == 1'd1))
		next_state = LEGUP_F_sobel_filter_BB_for_cond14_preheader_3;
	else if ((fsm_stall == 1'd0) && (sobel_filter_for_body3_tobool == 1'd0))
		next_state = LEGUP_F_sobel_filter_BB_for_inc54_8;
LEGUP_F_sobel_filter_BB_for_cond14_preheader_3:
		next_state = LEGUP_F_sobel_filter_BB_for_cond14_preheader_4;
LEGUP_F_sobel_filter_BB_for_cond14_preheader_4:
		next_state = LEGUP_F_sobel_filter_BB_for_cond14_preheader_5;
LEGUP_F_sobel_filter_BB_for_cond14_preheader_5:
		next_state = LEGUP_F_sobel_filter_BB_for_cond14_preheader_6;
LEGUP_F_sobel_filter_BB_for_cond14_preheader_6:
		next_state = LEGUP_F_sobel_filter_BB_for_cond14_preheader_7;
LEGUP_F_sobel_filter_BB_for_cond14_preheader_7:
		next_state = LEGUP_F_sobel_filter_BB_for_inc54_8;
LEGUP_F_sobel_filter_BB_for_cond1_preheader_1:
		next_state = LEGUP_F_sobel_filter_BB_for_body3_2;
LEGUP_F_sobel_filter_BB_for_end59_11:
		next_state = LEGUP_0;
LEGUP_F_sobel_filter_BB_for_inc54_8:
		next_state = LEGUP_F_sobel_filter_BB_for_inc54_9;
LEGUP_F_sobel_filter_BB_for_inc54_9:
	if ((fsm_stall == 1'd0) && (sobel_filter_for_inc54_exitcond2_reg == 1'd1))
		next_state = LEGUP_F_sobel_filter_BB_for_inc57_10;
	else if ((fsm_stall == 1'd0) && (sobel_filter_for_inc54_exitcond2_reg == 1'd0))
		next_state = LEGUP_F_sobel_filter_BB_for_body3_2;
LEGUP_F_sobel_filter_BB_for_inc57_10:
	if ((fsm_stall == 1'd0) && (sobel_filter_for_inc57_exitcond == 1'd1))
		next_state = LEGUP_F_sobel_filter_BB_for_end59_11;
	else if ((fsm_stall == 1'd0) && (sobel_filter_for_inc57_exitcond == 1'd0))
		next_state = LEGUP_F_sobel_filter_BB_for_cond1_preheader_1;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		sobel_filter_cond1_preheader_i_038 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sobel_filter_BB_for_inc57_10) & (fsm_stall == 1'd0)) & (sobel_filter_for_inc57_exitcond == 1'd0))) */ begin
		sobel_filter_cond1_preheader_i_038 = sobel_filter_for_inc57_26;
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		sobel_filter_cond1_preheader_i_038_reg <= sobel_filter_cond1_preheader_i_038;
	end
	if ((((cur_state == LEGUP_F_sobel_filter_BB_for_inc57_10) & (fsm_stall == 1'd0)) & (sobel_filter_for_inc57_exitcond == 1'd0))) begin
		sobel_filter_cond1_preheader_i_038_reg <= sobel_filter_cond1_preheader_i_038;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_bit_select17 = sobel_filter_cond1_preheader_i_038_reg_width_extended[22:0];
end
always @(*) begin
		sobel_filter_cond1_preheader_bit_concat20 = {sobel_filter_cond1_preheader_bit_select17_width_extended[22:0], sobel_filter_cond1_preheader_bit_concat20_bit_select_operand_2[8:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_bit_concat20_reg <= sobel_filter_cond1_preheader_bit_concat20;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_0 = ({1'd0,sobel_filter_cond1_preheader_bit_concat20} + $signed(-32'd513));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_0_reg <= sobel_filter_cond1_preheader_0;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_1 = ({1'd0,sobel_filter_cond1_preheader_bit_concat20} + $signed(-32'd512));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_1_reg <= sobel_filter_cond1_preheader_1;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_2 = ({1'd0,sobel_filter_cond1_preheader_bit_concat20} + $signed(-32'd511));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_2_reg <= sobel_filter_cond1_preheader_2;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_3 = ({1'd0,sobel_filter_cond1_preheader_bit_concat20} + $signed(-32'd1));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_3_reg <= sobel_filter_cond1_preheader_3;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_bit_concat19 = {sobel_filter_cond1_preheader_bit_select17_width_extended[22:0], sobel_filter_cond1_preheader_bit_concat19_bit_select_operand_2[8:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_bit_concat19_reg <= sobel_filter_cond1_preheader_bit_concat19;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_bit_concat18 = {sobel_filter_cond1_preheader_bit_select17_width_extended[22:0], sobel_filter_cond1_preheader_bit_concat18_bit_select_operand_2[8:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_bit_concat18_reg <= sobel_filter_cond1_preheader_bit_concat18;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_4 = ({1'd0,sobel_filter_cond1_preheader_bit_concat20} + 32'd512);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_4_reg <= sobel_filter_cond1_preheader_4;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_5 = ({1'd0,sobel_filter_cond1_preheader_bit_concat20} + 32'd513);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_5_reg <= sobel_filter_cond1_preheader_5;
	end
end
always @(*) begin
		sobel_filter_cond1_preheader_i_0_off = ({1'd0,sobel_filter_cond1_preheader_i_038_reg} + $signed(-32'd1));
end
always @(*) begin
		sobel_filter_cond1_preheader_6 = ({{21{sobel_filter_cond1_preheader_i_0_off[10]}},sobel_filter_cond1_preheader_i_0_off} > 32'd509);
end
always @(*) begin
		sobel_filter_cond1_preheader_bit_concat16 = {sobel_filter_cond1_preheader_bit_concat16_bit_select_operand_0[30:0], sobel_filter_cond1_preheader_6};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1)) begin
		sobel_filter_cond1_preheader_bit_concat16_reg <= sobel_filter_cond1_preheader_bit_concat16;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1) & (fsm_stall == 1'd0))) begin
		sobel_filter_for_body3_7 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_9) & (fsm_stall == 1'd0)) & (sobel_filter_for_inc54_exitcond2_reg == 1'd0))) */ begin
		sobel_filter_for_body3_7 = sobel_filter_for_inc54_24_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1) & (fsm_stall == 1'd0))) begin
		sobel_filter_for_body3_7_reg <= sobel_filter_for_body3_7;
	end
	if ((((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_9) & (fsm_stall == 1'd0)) & (sobel_filter_for_inc54_exitcond2_reg == 1'd0))) begin
		sobel_filter_for_body3_7_reg <= sobel_filter_for_body3_7;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1) & (fsm_stall == 1'd0))) begin
		sobel_filter_for_body3_loop_init_phi = {13'd0,sobel_filter_cond1_preheader_bit_concat20};
	end
	else /* if ((((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_9) & (fsm_stall == 1'd0)) & (sobel_filter_for_inc54_exitcond2_reg == 1'd0))) */ begin
		sobel_filter_for_body3_loop_init_phi = sobel_filter_for_inc54_25_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sobel_filter_BB_for_cond1_preheader_1) & (fsm_stall == 1'd0))) begin
		sobel_filter_for_body3_loop_init_phi_reg <= sobel_filter_for_body3_loop_init_phi;
	end
	if ((((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_9) & (fsm_stall == 1'd0)) & (sobel_filter_for_inc54_exitcond2_reg == 1'd0))) begin
		sobel_filter_for_body3_loop_init_phi_reg <= sobel_filter_for_body3_loop_init_phi;
	end
end
always @(*) begin
		sobel_filter_for_body3_mem_flat_gep87 = (0 + (1 * sobel_filter_for_body3_loop_init_phi_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_mem_flat_gep87_reg <= sobel_filter_for_body3_mem_flat_gep87;
	end
end
always @(*) begin
		sobel_filter_for_body3_cmp7 = ($signed(sobel_filter_for_body3_7_reg) < $signed({30'd0,sobel_filter_for_body3_cmp7_op1_temp}));
end
always @(*) begin
		sobel_filter_for_body3_bit_concat15 = {sobel_filter_for_body3_bit_concat15_bit_select_operand_0[30:0], sobel_filter_for_body3_cmp7};
end
always @(*) begin
		sobel_filter_for_body3_or9 = (sobel_filter_for_body3_bit_concat15 | sobel_filter_cond1_preheader_bit_concat16_reg);
end
always @(*) begin
		sobel_filter_for_body3_cmp10 = ($signed(sobel_filter_for_body3_7_reg) > $signed({22'd0,sobel_filter_for_body3_cmp10_op1_temp}));
end
always @(*) begin
		sobel_filter_for_body3_bit_concat14 = {sobel_filter_for_body3_bit_concat14_bit_select_operand_0[30:0], sobel_filter_for_body3_cmp10};
end
always @(*) begin
		sobel_filter_for_body3_or12 = (sobel_filter_for_body3_or9 | sobel_filter_for_body3_bit_concat14);
end
always @(*) begin
		sobel_filter_for_body3_tobool = (sobel_filter_for_body3_or12 == 32'd0);
end
always @(*) begin
		sobel_filter_for_body3_8 = ({12'd0,sobel_filter_cond1_preheader_5_reg} + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_8_reg <= sobel_filter_for_body3_8;
	end
end
always @(*) begin
		sobel_filter_for_body3_9 = ({12'd0,sobel_filter_cond1_preheader_4_reg} + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_9_reg <= sobel_filter_for_body3_9;
	end
end
always @(*) begin
		sobel_filter_for_body3_10 = ({13'd0,sobel_filter_cond1_preheader_bit_concat18_reg} + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_10_reg <= sobel_filter_for_body3_10;
	end
end
always @(*) begin
		sobel_filter_for_body3_11 = ({13'd0,sobel_filter_cond1_preheader_bit_concat19_reg} + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_11_reg <= sobel_filter_for_body3_11;
	end
end
always @(*) begin
		sobel_filter_for_body3_12 = ($signed({{12{sobel_filter_cond1_preheader_3_reg[19]}},sobel_filter_cond1_preheader_3_reg}) + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_12_reg <= sobel_filter_for_body3_12;
	end
end
always @(*) begin
		sobel_filter_for_body3_13 = ($signed({{12{sobel_filter_cond1_preheader_2_reg[19]}},sobel_filter_cond1_preheader_2_reg}) + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_13_reg <= sobel_filter_for_body3_13;
	end
end
always @(*) begin
		sobel_filter_for_body3_14 = ($signed({{12{sobel_filter_cond1_preheader_1_reg[19]}},sobel_filter_cond1_preheader_1_reg}) + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_14_reg <= sobel_filter_for_body3_14;
	end
end
always @(*) begin
		sobel_filter_for_body3_15 = ($signed({{12{sobel_filter_cond1_preheader_0_reg[19]}},sobel_filter_cond1_preheader_0_reg}) + sobel_filter_for_body3_7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2)) begin
		sobel_filter_for_body3_15_reg <= sobel_filter_for_body3_15;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep77 = (0 + (1 * sobel_filter_for_body3_8_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		sobel_filter_ond14_preheader_mem_flat_gep77_reg <= sobel_filter_ond14_preheader_mem_flat_gep77;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep67 = (0 + (1 * sobel_filter_for_body3_9_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		sobel_filter_ond14_preheader_mem_flat_gep67_reg <= sobel_filter_ond14_preheader_mem_flat_gep67;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep57 = (0 + (1 * sobel_filter_for_body3_10_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		sobel_filter_ond14_preheader_mem_flat_gep57_reg <= sobel_filter_ond14_preheader_mem_flat_gep57;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep47 = (0 + (1 * sobel_filter_for_body3_11_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		sobel_filter_ond14_preheader_mem_flat_gep47_reg <= sobel_filter_ond14_preheader_mem_flat_gep47;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep37 = (0 + (1 * sobel_filter_for_body3_12_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		sobel_filter_ond14_preheader_mem_flat_gep37_reg <= sobel_filter_ond14_preheader_mem_flat_gep37;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep27 = (0 + (1 * sobel_filter_for_body3_13_reg));
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep17 = (0 + (1 * sobel_filter_for_body3_14_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		sobel_filter_ond14_preheader_mem_flat_gep17_reg <= sobel_filter_ond14_preheader_mem_flat_gep17;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_mem_flat_gep7 = (0 + (1 * sobel_filter_for_body3_15_reg));
end
always @(*) begin
		sobel_filter_ond14_preheader_16 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat13 = {sobel_filter_ond14_preheader_bit_concat13_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_16[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_17 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat12 = {sobel_filter_ond14_preheader_bit_concat12_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_17[7:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		sobel_filter_ond14_preheader_bit_concat12_reg <= sobel_filter_ond14_preheader_bit_concat12;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_18 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat11 = {sobel_filter_ond14_preheader_bit_concat11_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_18[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_19 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat10 = {sobel_filter_ond14_preheader_bit_concat10_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_19[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_20 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat9 = {sobel_filter_ond14_preheader_bit_concat9_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_20[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_21 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat8 = {sobel_filter_ond14_preheader_bit_concat8_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_21[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_22 = in_var_read_data_wire_a;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat7 = {sobel_filter_ond14_preheader_bit_concat7_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_22[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_23 = in_var_read_data_wire_b;
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat6 = {sobel_filter_ond14_preheader_bit_concat6_bit_select_operand_0[23:0], sobel_filter_ond14_preheader_23[7:0]};
end
always @(*) begin
		sobel_filter_ond14_preheader_tmp = ({1'd0,sobel_filter_ond14_preheader_bit_concat9} - {1'd0,sobel_filter_ond14_preheader_bit_concat10});
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_select4 = sobel_filter_ond14_preheader_tmp_width_extended[30:0];
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat5 = {sobel_filter_ond14_preheader_bit_select4_width_extended[30:0], sobel_filter_ond14_preheader_bit_concat5_bit_select_operand_2};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_6)) begin
		sobel_filter_ond14_preheader_bit_concat5_reg <= sobel_filter_ond14_preheader_bit_concat5;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_add28_143 = ({1'd0,sobel_filter_ond14_preheader_bit_concat11} - {1'd0,sobel_filter_ond14_preheader_bit_concat13});
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_4)) begin
		sobel_filter_ond14_preheader_add28_143_reg <= sobel_filter_ond14_preheader_add28_143;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_add28_2_1 = ($signed({{1{sobel_filter_ond14_preheader_add28_143_reg[8]}},sobel_filter_ond14_preheader_add28_143_reg}) - {2'd0,sobel_filter_ond14_preheader_bit_concat8});
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		sobel_filter_ond14_preheader_add28_2_1_reg <= sobel_filter_ond14_preheader_add28_2_1;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_add28_251 = ($signed({{1{sobel_filter_ond14_preheader_add28_2_1_reg[9]}},sobel_filter_ond14_preheader_add28_2_1_reg}) + {3'd0,sobel_filter_ond14_preheader_bit_concat6});
end
always @(*) begin
		sobel_filter_ond14_preheader_add28_2_2 = ($signed({{1{sobel_filter_ond14_preheader_add28_251[10]}},sobel_filter_ond14_preheader_add28_251}) + $signed({{2{sobel_filter_ond14_preheader_bit_concat5_reg[9]}},sobel_filter_ond14_preheader_bit_concat5_reg}));
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_select2 = sobel_filter_ond14_preheader_add28_2_2_width_extended[31];
end
always @(*) begin
		sobel_filter_ond14_preheader_tmp3 = ({1'd0,sobel_filter_ond14_preheader_bit_concat12_reg} - {1'd0,sobel_filter_ond14_preheader_bit_concat7});
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_select3 = sobel_filter_ond14_preheader_tmp3_width_extended[30:0];
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_concat = {sobel_filter_ond14_preheader_bit_select3_width_extended[30:0], sobel_filter_ond14_preheader_bit_concat_bit_select_operand_2};
end
always @(*) begin
		sobel_filter_ond14_preheader_add34_2 = ({1'd0,sobel_filter_ond14_preheader_bit_concat11} + {1'd0,sobel_filter_ond14_preheader_bit_concat13});
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_4)) begin
		sobel_filter_ond14_preheader_add34_2_reg <= sobel_filter_ond14_preheader_add34_2;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_add34_254 = ({1'd0,sobel_filter_ond14_preheader_add34_2_reg} - {2'd0,sobel_filter_ond14_preheader_bit_concat8});
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		sobel_filter_ond14_preheader_add34_254_reg <= sobel_filter_ond14_preheader_add34_254;
	end
end
always @(*) begin
		sobel_filter_ond14_preheader_add34_1_2 = ($signed({{1{sobel_filter_ond14_preheader_add34_254_reg[9]}},sobel_filter_ond14_preheader_add34_254_reg}) - {3'd0,sobel_filter_ond14_preheader_bit_concat6});
end
always @(*) begin
		sobel_filter_ond14_preheader_add34_2_2 = ($signed({{1{sobel_filter_ond14_preheader_add34_1_2[10]}},sobel_filter_ond14_preheader_add34_1_2}) + $signed({{2{sobel_filter_ond14_preheader_bit_concat[9]}},sobel_filter_ond14_preheader_bit_concat}));
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_select1 = sobel_filter_ond14_preheader_add34_2_2_width_extended[31];
end
always @(*) begin
		sobel_filter_ond14_preheader_sub = (32'd0 - $signed({{1{sobel_filter_ond14_preheader_add28_2_2[11]}},sobel_filter_ond14_preheader_add28_2_2}));
end
always @(*) begin
		sobel_filter_ond14_preheader_cond = (sobel_filter_ond14_preheader_bit_select2 ? sobel_filter_ond14_preheader_sub : {{1{sobel_filter_ond14_preheader_add28_2_2[11]}},sobel_filter_ond14_preheader_add28_2_2});
end
always @(*) begin
		sobel_filter_ond14_preheader_sub41 = (32'd0 - $signed({{1{sobel_filter_ond14_preheader_add34_2_2[11]}},sobel_filter_ond14_preheader_add34_2_2}));
end
always @(*) begin
		sobel_filter_ond14_preheader_cond44 = (sobel_filter_ond14_preheader_bit_select1 ? sobel_filter_ond14_preheader_sub41 : {{1{sobel_filter_ond14_preheader_add34_2_2[11]}},sobel_filter_ond14_preheader_add34_2_2});
end
always @(*) begin
		sobel_filter_ond14_preheader_add45 = ($signed({{1{sobel_filter_ond14_preheader_cond44[12]}},sobel_filter_ond14_preheader_cond44}) + $signed({{1{sobel_filter_ond14_preheader_cond[12]}},sobel_filter_ond14_preheader_cond}));
end
always @(*) begin
		sobel_filter_ond14_preheader_bit_select = sobel_filter_ond14_preheader_add45[7:0];
end
always @(*) begin
		sobel_filter_ond14_preheader_cmp46 = ($signed({{18{sobel_filter_ond14_preheader_add45[13]}},sobel_filter_ond14_preheader_add45}) > $signed({23'd0,sobel_filter_ond14_preheader_cmp46_op1_temp}));
end
always @(*) begin
		sobel_filter_ond14_preheader_conv51 = (sobel_filter_ond14_preheader_cmp46 ? -8'd1 : sobel_filter_ond14_preheader_bit_select);
end
always @(*) begin
	if ((((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2) & (fsm_stall == 1'd0)) & (sobel_filter_for_body3_tobool == 1'd0))) begin
		sobel_filter_for_inc54_conv51_sink = 8'd0;
	end
	else /* if (((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_7) & (fsm_stall == 1'd0))) */ begin
		sobel_filter_for_inc54_conv51_sink = sobel_filter_ond14_preheader_conv51;
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_F_sobel_filter_BB_for_body3_2) & (fsm_stall == 1'd0)) & (sobel_filter_for_body3_tobool == 1'd0))) begin
		sobel_filter_for_inc54_conv51_sink_reg <= sobel_filter_for_inc54_conv51_sink;
	end
	if (((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_7) & (fsm_stall == 1'd0))) begin
		sobel_filter_for_inc54_conv51_sink_reg <= sobel_filter_for_inc54_conv51_sink;
	end
end
always @(*) begin
		sobel_filter_for_inc54_24 = (sobel_filter_for_body3_7_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_8)) begin
		sobel_filter_for_inc54_24_reg <= sobel_filter_for_inc54_24;
	end
end
always @(*) begin
		sobel_filter_for_inc54_exitcond2 = (sobel_filter_for_inc54_24 == 32'd512);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_8)) begin
		sobel_filter_for_inc54_exitcond2_reg <= sobel_filter_for_inc54_exitcond2;
	end
end
always @(*) begin
		sobel_filter_for_inc54_25 = ({13'd0,sobel_filter_cond1_preheader_bit_concat20_reg} + sobel_filter_for_inc54_24);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_8)) begin
		sobel_filter_for_inc54_25_reg <= sobel_filter_for_inc54_25;
	end
end
always @(*) begin
		sobel_filter_for_inc57_26 = ({1'd0,sobel_filter_cond1_preheader_i_038_reg} + 32'd1);
end
always @(*) begin
		sobel_filter_for_inc57_exitcond = ({21'd0,sobel_filter_for_inc57_26} == 32'd512);
end
always @(*) begin
	sobel_filter_cond1_preheader_i_038_reg_width_extended = {13'd0,sobel_filter_cond1_preheader_i_038_reg};
end
always @(*) begin
	sobel_filter_cond1_preheader_bit_select17_width_extended = {13'd0,sobel_filter_cond1_preheader_bit_select17};
end
assign sobel_filter_cond1_preheader_bit_concat20_bit_select_operand_2 = 9'd0;
assign sobel_filter_cond1_preheader_bit_concat19_bit_select_operand_2 = 9'd1;
assign sobel_filter_cond1_preheader_bit_concat18_bit_select_operand_2 = -9'd1;
assign sobel_filter_cond1_preheader_bit_concat16_bit_select_operand_0 = 31'd0;
assign sobel_filter_for_body3_cmp7_op1_temp = 32'd1;
assign sobel_filter_for_body3_bit_concat15_bit_select_operand_0 = 31'd0;
assign sobel_filter_for_body3_cmp10_op1_temp = 32'd510;
assign sobel_filter_for_body3_bit_concat14_bit_select_operand_0 = 31'd0;
always @(*) begin
	in_var_read_data_wire_a = in_var_read_data_a;
end
always @(*) begin
	in_var_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	in_var_read_data_wire_b = in_var_read_data_b;
end
assign sobel_filter_ond14_preheader_bit_concat13_bit_select_operand_0 = 24'd0;
assign sobel_filter_ond14_preheader_bit_concat11_bit_select_operand_0 = 24'd0;
assign sobel_filter_ond14_preheader_bit_concat12_bit_select_operand_0 = 24'd0;
assign sobel_filter_ond14_preheader_bit_concat8_bit_select_operand_0 = 24'd0;
assign sobel_filter_ond14_preheader_bit_concat10_bit_select_operand_0 = 24'd0;
assign sobel_filter_ond14_preheader_bit_concat9_bit_select_operand_0 = 24'd0;
always @(*) begin
	sobel_filter_ond14_preheader_tmp_width_extended = {{22{sobel_filter_ond14_preheader_tmp[8]}},sobel_filter_ond14_preheader_tmp};
end
always @(*) begin
	sobel_filter_ond14_preheader_bit_select4_width_extended = {{22{sobel_filter_ond14_preheader_bit_select4[8]}},sobel_filter_ond14_preheader_bit_select4};
end
assign sobel_filter_ond14_preheader_bit_concat5_bit_select_operand_2 = 1'd0;
assign sobel_filter_ond14_preheader_bit_concat7_bit_select_operand_0 = 24'd0;
assign sobel_filter_ond14_preheader_bit_concat6_bit_select_operand_0 = 24'd0;
always @(*) begin
	sobel_filter_ond14_preheader_add28_2_2_width_extended = {{20{sobel_filter_ond14_preheader_add28_2_2[11]}},sobel_filter_ond14_preheader_add28_2_2};
end
always @(*) begin
	sobel_filter_ond14_preheader_tmp3_width_extended = {{22{sobel_filter_ond14_preheader_tmp3[8]}},sobel_filter_ond14_preheader_tmp3};
end
always @(*) begin
	sobel_filter_ond14_preheader_bit_select3_width_extended = {{22{sobel_filter_ond14_preheader_bit_select3[8]}},sobel_filter_ond14_preheader_bit_select3};
end
assign sobel_filter_ond14_preheader_bit_concat_bit_select_operand_2 = 1'd0;
always @(*) begin
	sobel_filter_ond14_preheader_add34_2_2_width_extended = {{20{sobel_filter_ond14_preheader_add34_2_2[11]}},sobel_filter_ond14_preheader_add34_2_2};
end
assign sobel_filter_ond14_preheader_cmp46_op1_temp = 32'd255;
always @(*) begin
	out_var_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_end59_11)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(*) begin
	in_var_clken = in_var_clken_sequential_cond;
end
always @(*) begin
	in_var_read_en_a = 1'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		in_var_read_en_a = 1'd1;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_4)) begin
		in_var_read_en_a = 1'd1;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		in_var_read_en_a = 1'd1;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_6)) begin
		in_var_read_en_a = 1'd1;
	end
end
always @(*) begin
	in_var_address_a = 18'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		in_var_address_a = (sobel_filter_ond14_preheader_mem_flat_gep7 >> 1'd0);
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_4)) begin
		in_var_address_a = (sobel_filter_ond14_preheader_mem_flat_gep17_reg >> 1'd0);
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		in_var_address_a = (sobel_filter_ond14_preheader_mem_flat_gep37_reg >> 1'd0);
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_6)) begin
		in_var_address_a = (sobel_filter_ond14_preheader_mem_flat_gep67_reg >> 1'd0);
	end
end
always @(*) begin
	in_var_read_en_b = 1'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		in_var_read_en_b = 1'd1;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_4)) begin
		in_var_read_en_b = 1'd1;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		in_var_read_en_b = 1'd1;
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_6)) begin
		in_var_read_en_b = 1'd1;
	end
end
always @(*) begin
	in_var_address_b = 18'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_3)) begin
		in_var_address_b = (sobel_filter_ond14_preheader_mem_flat_gep27 >> 1'd0);
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_4)) begin
		in_var_address_b = (sobel_filter_ond14_preheader_mem_flat_gep57_reg >> 1'd0);
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_5)) begin
		in_var_address_b = (sobel_filter_ond14_preheader_mem_flat_gep47_reg >> 1'd0);
	end
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_cond14_preheader_6)) begin
		in_var_address_b = (sobel_filter_ond14_preheader_mem_flat_gep77_reg >> 1'd0);
	end
end
always @(*) begin
	out_var_clken = out_var_clken_sequential_cond;
end
always @(*) begin
	out_var_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_8)) begin
		out_var_write_en_a = 1'd1;
	end
end
always @(*) begin
	out_var_write_data_a = 8'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_8)) begin
		out_var_write_data_a = sobel_filter_for_inc54_conv51_sink_reg;
	end
end
assign out_var_read_en_a = 1'd0;
always @(*) begin
	out_var_address_a = 18'd0;
	if ((cur_state == LEGUP_F_sobel_filter_BB_for_inc54_8)) begin
		out_var_address_a = (sobel_filter_for_body3_mem_flat_gep87_reg >> 1'd0);
	end
end
assign out_var_write_en_b = 1'd0;
assign out_var_write_data_b = 8'd0;
assign out_var_read_en_b = 1'd0;
assign out_var_address_b = 18'd0;

endmodule



