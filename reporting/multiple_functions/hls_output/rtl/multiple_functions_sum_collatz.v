// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2023.1
// Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
// For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
// Date: Mon Apr  3 08:58:31 2023
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
//
// NOTE:// If you take this code outside the SmartHLS directory structure
// into your own, then you should adjust this constant accordingly.
// E.g. for simulation on Modelsim:
//		vlog +define+MEM_INIT_DIR=/path/to/rtl/mem_init/ multiple_functions.v  ...
//
`ifndef MEM_INIT_DIR
`define MEM_INIT_DIR "../hdl/"
`endif


`timescale 1 ns / 1 ns
module sum_collatz_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	return_val,
	n
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg [31:0] return_val;
input [31:0] n;
reg  sum_collatz_inst_clk;
reg  sum_collatz_inst_reset;
reg  sum_collatz_inst_start;
wire  sum_collatz_inst_ready;
wire  sum_collatz_inst_finish;
wire [31:0] sum_collatz_inst_return_val;
reg [31:0] sum_collatz_inst_n;
wire  sum_collatz_inst_collatz_start;
reg  sum_collatz_inst_collatz_finish;
reg  sum_collatz_inst_collatz_ready;
reg [31:0] sum_collatz_inst_collatz_return_val;
wire [31:0] sum_collatz_inst_collatz_n;
reg  sum_collatz_inst_finish_reg;
reg [31:0] sum_collatz_inst_return_val_reg;
reg  collatz_inst_clk;
reg  collatz_inst_reset;
reg  collatz_inst_start;
wire  collatz_inst_ready;
wire  collatz_inst_finish;
wire [31:0] collatz_inst_return_val;
reg [31:0] collatz_inst_n;
reg  collatz_inst_finish_reg;
reg [31:0] collatz_inst_return_val_reg;


sum_collatz_sum_collatz sum_collatz_inst (
	.clk (sum_collatz_inst_clk),
	.reset (sum_collatz_inst_reset),
	.start (sum_collatz_inst_start),
	.ready (sum_collatz_inst_ready),
	.finish (sum_collatz_inst_finish),
	.return_val (sum_collatz_inst_return_val),
	.n (sum_collatz_inst_n),
	.collatz_start (sum_collatz_inst_collatz_start),
	.collatz_finish (sum_collatz_inst_collatz_finish),
	.collatz_ready (sum_collatz_inst_collatz_ready),
	.collatz_return_val (sum_collatz_inst_collatz_return_val),
	.collatz_n (sum_collatz_inst_collatz_n)
);



sum_collatz_collatz collatz_inst (
	.clk (collatz_inst_clk),
	.reset (collatz_inst_reset),
	.start (collatz_inst_start),
	.ready (collatz_inst_ready),
	.finish (collatz_inst_finish),
	.return_val (collatz_inst_return_val),
	.n (collatz_inst_n)
);



always @(*) begin
	sum_collatz_inst_clk = clk;
end
always @(*) begin
	sum_collatz_inst_reset = reset;
end
always @(*) begin
	sum_collatz_inst_start = start;
end
always @(*) begin
	sum_collatz_inst_n = n;
end
always @(*) begin
	sum_collatz_inst_collatz_finish = (~(collatz_inst_start) & collatz_inst_finish_reg);
end
always @(*) begin
	sum_collatz_inst_collatz_ready = collatz_inst_ready;
end
always @(*) begin
	sum_collatz_inst_collatz_return_val = collatz_inst_return_val_reg;
end
always @(posedge clk) begin
	if ((reset | sum_collatz_inst_start)) begin
		sum_collatz_inst_finish_reg <= 1'd0;
	end
	if (sum_collatz_inst_finish) begin
		sum_collatz_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	if ((reset | sum_collatz_inst_start)) begin
		sum_collatz_inst_return_val_reg <= 0;
	end
	if (sum_collatz_inst_finish) begin
		sum_collatz_inst_return_val_reg <= sum_collatz_inst_return_val;
	end
end
always @(*) begin
	collatz_inst_clk = clk;
end
always @(*) begin
	collatz_inst_reset = reset;
end
always @(*) begin
	collatz_inst_start = sum_collatz_inst_collatz_start;
end
always @(*) begin
	collatz_inst_n = sum_collatz_inst_collatz_n;
end
always @(posedge clk) begin
	if ((reset | collatz_inst_start)) begin
		collatz_inst_finish_reg <= 1'd0;
	end
	if (collatz_inst_finish) begin
		collatz_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	if ((reset | collatz_inst_start)) begin
		collatz_inst_return_val_reg <= 0;
	end
	if (collatz_inst_finish) begin
		collatz_inst_return_val_reg <= collatz_inst_return_val;
	end
end
always @(*) begin
	ready = sum_collatz_inst_ready;
end
always @(*) begin
	finish = sum_collatz_inst_finish;
end
always @(*) begin
	return_val = sum_collatz_inst_return_val;
end

endmodule

`timescale 1 ns / 1 ns
module sum_collatz_sum_collatz
(
	clk,
	reset,
	start,
	ready,
	finish,
	return_val,
	n,
	collatz_start,
	collatz_finish,
	collatz_ready,
	collatz_return_val,
	collatz_n
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_sum_collatz_BB_entry_1 = 3'd1;
parameter [2:0] LEGUP_F_sum_collatz_BB_for_body_2 = 3'd2;
parameter [2:0] LEGUP_F_sum_collatz_BB_for_body_4 = 3'd4;
parameter [2:0] LEGUP_F_sum_collatz_BB_for_end_5 = 3'd5;
parameter [2:0] LEGUP_function_call_3 = 3'd3;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg [31:0] return_val;
input [31:0] n;
output reg  collatz_start;
input  collatz_finish;
input  collatz_ready;
input [31:0] collatz_return_val;
output reg [31:0] collatz_n;
reg [2:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [2:0] next_state;
reg [31:0] n_reg;
wire  fsm_stall;
reg [4:0] sum_collatz_for_body_indvar;
reg [4:0] sum_collatz_for_body_indvar_reg;
reg [31:0] sum_collatz_for_body_sum_05;
reg [31:0] sum_collatz_for_body_sum_05_reg;
reg [31:0] sum_collatz_for_body_i_06;
reg [31:0] sum_collatz_for_body_call;
reg [31:0] sum_collatz_for_body_call_reg;
reg [31:0] sum_collatz_for_body_add1;
reg [31:0] sum_collatz_for_body_add1_reg;
reg [5:0] sum_collatz_for_body_0;
reg [5:0] sum_collatz_for_body_0_reg;
reg  sum_collatz_for_body_exitcond1;
reg  sum_collatz_for_body_exitcond1_reg;


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
		next_state = LEGUP_F_sum_collatz_BB_entry_1;
LEGUP_F_sum_collatz_BB_entry_1:
		next_state = LEGUP_F_sum_collatz_BB_for_body_2;
LEGUP_F_sum_collatz_BB_for_body_2:
		next_state = LEGUP_function_call_3;
LEGUP_F_sum_collatz_BB_for_body_4:
	if ((fsm_stall == 1'd0) && (sum_collatz_for_body_exitcond1_reg == 1'd1))
		next_state = LEGUP_F_sum_collatz_BB_for_end_5;
	else if ((fsm_stall == 1'd0) && (sum_collatz_for_body_exitcond1_reg == 1'd0))
		next_state = LEGUP_F_sum_collatz_BB_for_body_2;
LEGUP_F_sum_collatz_BB_for_end_5:
		next_state = LEGUP_0;
LEGUP_function_call_3:
	if ((fsm_stall == 1'd0) && (collatz_finish == 1'd1))
		next_state = LEGUP_F_sum_collatz_BB_for_body_4;
default:
	next_state = cur_state;
endcase

end
always @(posedge clk) begin
	if ((start & ready)) begin
		n_reg <= n;
	end
end
assign fsm_stall = 1'd0;
always @(*) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_body_indvar = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sum_collatz_BB_for_body_4) & (fsm_stall == 1'd0)) & (sum_collatz_for_body_exitcond1_reg == 1'd0))) */ begin
		sum_collatz_for_body_indvar = sum_collatz_for_body_0_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_body_indvar_reg <= sum_collatz_for_body_indvar;
	end
	if ((((cur_state == LEGUP_F_sum_collatz_BB_for_body_4) & (fsm_stall == 1'd0)) & (sum_collatz_for_body_exitcond1_reg == 1'd0))) begin
		sum_collatz_for_body_indvar_reg <= sum_collatz_for_body_indvar;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_body_sum_05 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sum_collatz_BB_for_body_4) & (fsm_stall == 1'd0)) & (sum_collatz_for_body_exitcond1_reg == 1'd0))) */ begin
		sum_collatz_for_body_sum_05 = sum_collatz_for_body_add1;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_body_sum_05_reg <= sum_collatz_for_body_sum_05;
	end
	if ((((cur_state == LEGUP_F_sum_collatz_BB_for_body_4) & (fsm_stall == 1'd0)) & (sum_collatz_for_body_exitcond1_reg == 1'd0))) begin
		sum_collatz_for_body_sum_05_reg <= sum_collatz_for_body_sum_05;
	end
end
always @(*) begin
		sum_collatz_for_body_i_06 = ({27'd0,sum_collatz_for_body_indvar_reg} + n_reg);
end
always @(*) begin
		sum_collatz_for_body_call = collatz_return_val;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_function_call_3)) begin
		sum_collatz_for_body_call_reg <= sum_collatz_for_body_call;
	end
end
always @(*) begin
		sum_collatz_for_body_add1 = (sum_collatz_for_body_call_reg + sum_collatz_for_body_sum_05_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_body_4)) begin
		sum_collatz_for_body_add1_reg <= sum_collatz_for_body_add1;
	end
end
always @(*) begin
		sum_collatz_for_body_0 = ({1'd0,sum_collatz_for_body_indvar_reg} + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_body_2)) begin
		sum_collatz_for_body_0_reg <= sum_collatz_for_body_0;
	end
end
always @(*) begin
		sum_collatz_for_body_exitcond1 = ({26'd0,sum_collatz_for_body_0} == 32'd30);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_body_2)) begin
		sum_collatz_for_body_exitcond1_reg <= sum_collatz_for_body_exitcond1;
	end
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_end_5)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_end_5)) begin
		return_val <= sum_collatz_for_body_add1_reg;
	end
end
always @(posedge clk) begin
	if (reset) begin
		collatz_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_body_2)) begin
		collatz_start <= (fsm_stall == 1'd0);
	end
	if ((cur_state == LEGUP_function_call_3)) begin
		collatz_start <= 1'd0;
	end
end
always @(posedge clk) begin
	collatz_n <= 0;
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_body_2)) begin
		collatz_n <= sum_collatz_for_body_i_06;
	end
end

endmodule

`timescale 1 ns / 1 ns
module sum_collatz_collatz
(
	clk,
	reset,
	start,
	ready,
	finish,
	return_val,
	n
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_collatz_BB_entry_1 = 4'd1;
parameter [3:0] LEGUP_F_collatz_BB_if_end_preheader_2 = 4'd2;
parameter [3:0] LEGUP_F_collatz_BB_if_then_loopexit_3 = 4'd3;
parameter [3:0] LEGUP_F_collatz_BB_if_then_4 = 4'd4;
parameter [3:0] LEGUP_F_collatz_BB_if_end_5 = 4'd5;
parameter [3:0] LEGUP_F_collatz_BB_if_then1_6 = 4'd6;
parameter [3:0] LEGUP_F_collatz_BB_if_else_7 = 4'd7;
parameter [3:0] LEGUP_F_collatz_BB_for_inc_8 = 4'd8;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg [31:0] return_val;
input [31:0] n;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
reg [31:0] n_reg;
wire  fsm_stall;
reg  collatz_entry_cmp5;
reg [31:0] collatz_if_then_i_0_lcssa;
reg [31:0] collatz_if_then_i_0_lcssa_reg;
reg [31:0] collatz_if_end_i_07;
reg [31:0] collatz_if_end_i_07_reg;
reg [31:0] collatz_if_end_n_addr_06;
reg [31:0] collatz_if_end_n_addr_06_reg;
reg  collatz_if_end_bit_select6;
reg [30:0] collatz_if_end_bit_select4;
reg [30:0] collatz_if_end_bit_select4_reg;
reg [31:0] collatz_if_end_0;
reg [31:0] collatz_if_end_0_reg;
reg  collatz_if_end_bit_concat7;
reg  collatz_if_end_tobool;
reg [31:0] collatz_if_then1_bit_concat5;
reg [31:0] collatz_if_then1_sr_add1;
reg [31:0] collatz_if_then1_add;
reg [31:0] collatz_if_else_1;
reg [32:0] collatz_if_else_sr_negate;
reg [32:0] collatz_if_else_bit_select2;
reg [63:0] collatz_if_else_bit_concat3;
reg [63:0] collatz_if_else_sr_add2;
reg [31:0] collatz_if_else_bit_select1;
reg [31:0] collatz_if_else_2;
reg  collatz_if_else_bit_select;
reg  collatz_if_else_bit_concat;
reg [31:0] collatz_if_else_3;
reg [31:0] collatz_for_inc_n_addr_1;
reg [31:0] collatz_for_inc_n_addr_1_reg;
reg  collatz_for_inc_cmp;
wire [30:0] collatz_if_end_bit_concat7_bit_select_operand_0;
wire  collatz_if_then1_bit_concat5_bit_select_operand_2;
wire [30:0] collatz_if_else_bit_concat3_bit_select_operand_2;
wire [30:0] collatz_if_else_bit_concat_bit_select_operand_0;


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
		next_state = LEGUP_F_collatz_BB_entry_1;
LEGUP_F_collatz_BB_entry_1:
	if ((fsm_stall == 1'd0) && (collatz_entry_cmp5 == 1'd1))
		next_state = LEGUP_F_collatz_BB_if_then_4;
	else if ((fsm_stall == 1'd0) && (collatz_entry_cmp5 == 1'd0))
		next_state = LEGUP_F_collatz_BB_if_end_preheader_2;
LEGUP_F_collatz_BB_for_inc_8:
	if ((fsm_stall == 1'd0) && (collatz_for_inc_cmp == 1'd1))
		next_state = LEGUP_F_collatz_BB_if_then_loopexit_3;
	else if ((fsm_stall == 1'd0) && (collatz_for_inc_cmp == 1'd0))
		next_state = LEGUP_F_collatz_BB_if_end_5;
LEGUP_F_collatz_BB_if_else_7:
		next_state = LEGUP_F_collatz_BB_for_inc_8;
LEGUP_F_collatz_BB_if_end_5:
	if ((fsm_stall == 1'd0) && (collatz_if_end_tobool == 1'd1))
		next_state = LEGUP_F_collatz_BB_if_else_7;
	else if ((fsm_stall == 1'd0) && (collatz_if_end_tobool == 1'd0))
		next_state = LEGUP_F_collatz_BB_if_then1_6;
LEGUP_F_collatz_BB_if_end_preheader_2:
		next_state = LEGUP_F_collatz_BB_if_end_5;
LEGUP_F_collatz_BB_if_then1_6:
		next_state = LEGUP_F_collatz_BB_for_inc_8;
LEGUP_F_collatz_BB_if_then_4:
		next_state = LEGUP_0;
LEGUP_F_collatz_BB_if_then_loopexit_3:
		next_state = LEGUP_F_collatz_BB_if_then_4;
default:
	next_state = cur_state;
endcase

end
always @(posedge clk) begin
	if ((start & ready)) begin
		n_reg <= n;
	end
end
assign fsm_stall = 1'd0;
always @(*) begin
		collatz_entry_cmp5 = (n_reg == 32'd1);
end
always @(*) begin
	if ((((cur_state == LEGUP_F_collatz_BB_entry_1) & (fsm_stall == 1'd0)) & (collatz_entry_cmp5 == 1'd1))) begin
		collatz_if_then_i_0_lcssa = 32'd0;
	end
	else /* if (((cur_state == LEGUP_F_collatz_BB_if_then_loopexit_3) & (fsm_stall == 1'd0))) */ begin
		collatz_if_then_i_0_lcssa = collatz_if_end_0_reg;
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_F_collatz_BB_entry_1) & (fsm_stall == 1'd0)) & (collatz_entry_cmp5 == 1'd1))) begin
		collatz_if_then_i_0_lcssa_reg <= collatz_if_then_i_0_lcssa;
	end
	if (((cur_state == LEGUP_F_collatz_BB_if_then_loopexit_3) & (fsm_stall == 1'd0))) begin
		collatz_if_then_i_0_lcssa_reg <= collatz_if_then_i_0_lcssa;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_collatz_BB_if_end_preheader_2) & (fsm_stall == 1'd0))) begin
		collatz_if_end_i_07 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_collatz_BB_for_inc_8) & (fsm_stall == 1'd0)) & (collatz_for_inc_cmp == 1'd0))) */ begin
		collatz_if_end_i_07 = collatz_if_end_0_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_collatz_BB_if_end_preheader_2) & (fsm_stall == 1'd0))) begin
		collatz_if_end_i_07_reg <= collatz_if_end_i_07;
	end
	if ((((cur_state == LEGUP_F_collatz_BB_for_inc_8) & (fsm_stall == 1'd0)) & (collatz_for_inc_cmp == 1'd0))) begin
		collatz_if_end_i_07_reg <= collatz_if_end_i_07;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_collatz_BB_if_end_preheader_2) & (fsm_stall == 1'd0))) begin
		collatz_if_end_n_addr_06 = n_reg;
	end
	else /* if ((((cur_state == LEGUP_F_collatz_BB_for_inc_8) & (fsm_stall == 1'd0)) & (collatz_for_inc_cmp == 1'd0))) */ begin
		collatz_if_end_n_addr_06 = collatz_for_inc_n_addr_1_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_collatz_BB_if_end_preheader_2) & (fsm_stall == 1'd0))) begin
		collatz_if_end_n_addr_06_reg <= collatz_if_end_n_addr_06;
	end
	if ((((cur_state == LEGUP_F_collatz_BB_for_inc_8) & (fsm_stall == 1'd0)) & (collatz_for_inc_cmp == 1'd0))) begin
		collatz_if_end_n_addr_06_reg <= collatz_if_end_n_addr_06;
	end
end
always @(*) begin
		collatz_if_end_bit_select6 = collatz_if_end_n_addr_06_reg[0];
end
always @(*) begin
		collatz_if_end_bit_select4 = collatz_if_end_n_addr_06_reg[30:0];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_collatz_BB_if_end_5)) begin
		collatz_if_end_bit_select4_reg <= collatz_if_end_bit_select4;
	end
end
always @(*) begin
		collatz_if_end_0 = (collatz_if_end_i_07_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_collatz_BB_if_end_5)) begin
		collatz_if_end_0_reg <= collatz_if_end_0;
	end
end
always @(*) begin
		collatz_if_end_bit_concat7 = {collatz_if_end_bit_concat7_bit_select_operand_0[30:0], collatz_if_end_bit_select6};
end
always @(*) begin
		collatz_if_end_tobool = (collatz_if_end_bit_concat7 == 32'd0);
end
always @(*) begin
		collatz_if_then1_bit_concat5 = {collatz_if_end_bit_select4_reg[30:0], collatz_if_then1_bit_concat5_bit_select_operand_2};
end
always @(*) begin
		collatz_if_then1_sr_add1 = (collatz_if_end_n_addr_06_reg + collatz_if_then1_bit_concat5);
end
always @(*) begin
		collatz_if_then1_add = (collatz_if_then1_sr_add1 + 32'd1);
end
always @(*) begin
		collatz_if_else_1 = $signed(collatz_if_end_n_addr_06_reg);
end
always @(*) begin
		collatz_if_else_sr_negate = (64'd0 - $signed({{1{collatz_if_else_1[31]}},collatz_if_else_1}));
end
always @(*) begin
		collatz_if_else_bit_select2 = collatz_if_else_sr_negate[32:0];
end
always @(*) begin
		collatz_if_else_bit_concat3 = {collatz_if_else_bit_select2[32:0], collatz_if_else_bit_concat3_bit_select_operand_2[30:0]};
end
always @(*) begin
		collatz_if_else_sr_add2 = ($signed({{32{collatz_if_else_1[31]}},collatz_if_else_1}) + collatz_if_else_bit_concat3);
end
always @(*) begin
		collatz_if_else_bit_select1 = collatz_if_else_sr_add2[63:32];
end
always @(*) begin
		collatz_if_else_2 = (collatz_if_else_bit_select1 + collatz_if_end_n_addr_06_reg);
end
always @(*) begin
		collatz_if_else_bit_select = collatz_if_else_2[31];
end
always @(*) begin
		collatz_if_else_bit_concat = {collatz_if_else_bit_concat_bit_select_operand_0[30:0], collatz_if_else_bit_select};
end
always @(*) begin
		collatz_if_else_3 = (collatz_if_else_2 + collatz_if_else_bit_concat);
end
always @(*) begin
	if (((cur_state == LEGUP_F_collatz_BB_if_then1_6) & (fsm_stall == 1'd0))) begin
		collatz_for_inc_n_addr_1 = collatz_if_then1_add;
	end
	else /* if (((cur_state == LEGUP_F_collatz_BB_if_else_7) & (fsm_stall == 1'd0))) */ begin
		collatz_for_inc_n_addr_1 = collatz_if_else_3;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_collatz_BB_if_then1_6) & (fsm_stall == 1'd0))) begin
		collatz_for_inc_n_addr_1_reg <= collatz_for_inc_n_addr_1;
	end
	if (((cur_state == LEGUP_F_collatz_BB_if_else_7) & (fsm_stall == 1'd0))) begin
		collatz_for_inc_n_addr_1_reg <= collatz_for_inc_n_addr_1;
	end
end
always @(*) begin
		collatz_for_inc_cmp = (collatz_for_inc_n_addr_1_reg == 32'd1);
end
assign collatz_if_end_bit_concat7_bit_select_operand_0 = 31'd0;
assign collatz_if_then1_bit_concat5_bit_select_operand_2 = 1'd0;
assign collatz_if_else_bit_concat3_bit_select_operand_2 = 31'd0;
assign collatz_if_else_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_collatz_BB_if_then_4)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	if ((cur_state == LEGUP_F_collatz_BB_if_then_4)) begin
		return_val <= collatz_if_then_i_0_lcssa_reg;
	end
end

endmodule



