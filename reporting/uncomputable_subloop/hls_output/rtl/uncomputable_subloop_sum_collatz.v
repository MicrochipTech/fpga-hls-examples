// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2023.1
// Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
// For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
// Date: Fri Mar 31 13:55:25 2023
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
//
// NOTE:// If you take this code outside the SmartHLS directory structure
// into your own, then you should adjust this constant accordingly.
// E.g. for simulation on Modelsim:
//		vlog +define+MEM_INIT_DIR=/path/to/rtl/mem_init/ uncomputable_subloop.v  ...
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
reg  sum_collatz_inst_finish_reg;
reg [31:0] sum_collatz_inst_return_val_reg;


sum_collatz_sum_collatz sum_collatz_inst (
	.clk (sum_collatz_inst_clk),
	.reset (sum_collatz_inst_reset),
	.start (sum_collatz_inst_start),
	.ready (sum_collatz_inst_ready),
	.finish (sum_collatz_inst_finish),
	.return_val (sum_collatz_inst_return_val),
	.n (sum_collatz_inst_n)
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
	n
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_sum_collatz_BB_entry_1 = 4'd1;
parameter [3:0] LEGUP_F_sum_collatz_BB_for_body2_preheader_2 = 4'd2;
parameter [3:0] LEGUP_F_sum_collatz_BB_if_end_preheader_3 = 4'd3;
parameter [3:0] LEGUP_F_sum_collatz_BB_if_then_loopexit_4 = 4'd4;
parameter [3:0] LEGUP_F_sum_collatz_BB_if_then_5 = 4'd5;
parameter [3:0] LEGUP_F_sum_collatz_BB_if_end_6 = 4'd6;
parameter [3:0] LEGUP_F_sum_collatz_BB_if_then5_7 = 4'd7;
parameter [3:0] LEGUP_F_sum_collatz_BB_if_else_8 = 4'd8;
parameter [3:0] LEGUP_F_sum_collatz_BB_for_inc_9 = 4'd9;
parameter [3:0] LEGUP_F_sum_collatz_BB_for_end10_10 = 4'd10;

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
reg [4:0] sum_collatz_body2_preheader_indvar;
reg [4:0] sum_collatz_body2_preheader_indvar_reg;
reg [31:0] sum_collatz_body2_preheader_sum_012;
reg [31:0] sum_collatz_body2_preheader_sum_012_reg;
reg [31:0] sum_collatz_body2_preheader_i_013;
reg [31:0] sum_collatz_body2_preheader_i_013_reg;
reg  sum_collatz_body2_preheader_cmp39;
reg [31:0] sum_collatz_if_then_j_0_lcssa;
reg [31:0] sum_collatz_if_then_j_0_lcssa_reg;
reg [31:0] sum_collatz_if_then_add4;
reg [31:0] sum_collatz_if_then_add4_reg;
reg [5:0] sum_collatz_if_then_0;
reg  sum_collatz_if_then_exitcond1;
reg [31:0] sum_collatz_if_end_j_011;
reg [31:0] sum_collatz_if_end_j_011_reg;
reg [31:0] sum_collatz_if_end_m_010;
reg [31:0] sum_collatz_if_end_m_010_reg;
reg  sum_collatz_if_end_bit_select6;
reg [30:0] sum_collatz_if_end_bit_select4;
reg [30:0] sum_collatz_if_end_bit_select4_reg;
reg [31:0] sum_collatz_if_end_1;
reg [31:0] sum_collatz_if_end_1_reg;
reg  sum_collatz_if_end_bit_concat7;
reg  sum_collatz_if_end_tobool;
reg [31:0] sum_collatz_if_then5_bit_concat5;
reg [31:0] sum_collatz_if_then5_sr_add3;
reg [31:0] sum_collatz_if_then5_add6;
reg [31:0] sum_collatz_if_else_2;
reg [32:0] sum_collatz_if_else_sr_negate;
reg [32:0] sum_collatz_if_else_bit_select2;
reg [63:0] sum_collatz_if_else_bit_concat3;
reg [63:0] sum_collatz_if_else_sr_add2;
reg [31:0] sum_collatz_if_else_bit_select1;
reg [31:0] sum_collatz_if_else_3;
reg  sum_collatz_if_else_bit_select;
reg  sum_collatz_if_else_bit_concat;
reg [31:0] sum_collatz_if_else_4;
reg [31:0] sum_collatz_for_inc_m_1;
reg [31:0] sum_collatz_for_inc_m_1_reg;
reg  sum_collatz_for_inc_cmp3;
wire [30:0] sum_collatz_if_end_bit_concat7_bit_select_operand_0;
wire  sum_collatz_if_then5_bit_concat5_bit_select_operand_2;
wire [30:0] sum_collatz_if_else_bit_concat3_bit_select_operand_2;
wire [30:0] sum_collatz_if_else_bit_concat_bit_select_operand_0;


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
		next_state = LEGUP_F_sum_collatz_BB_for_body2_preheader_2;
LEGUP_F_sum_collatz_BB_for_body2_preheader_2:
	if ((fsm_stall == 1'd0) && (sum_collatz_body2_preheader_cmp39 == 1'd1))
		next_state = LEGUP_F_sum_collatz_BB_if_then_5;
	else if ((fsm_stall == 1'd0) && (sum_collatz_body2_preheader_cmp39 == 1'd0))
		next_state = LEGUP_F_sum_collatz_BB_if_end_preheader_3;
LEGUP_F_sum_collatz_BB_for_end10_10:
		next_state = LEGUP_0;
LEGUP_F_sum_collatz_BB_for_inc_9:
	if ((fsm_stall == 1'd0) && (sum_collatz_for_inc_cmp3 == 1'd1))
		next_state = LEGUP_F_sum_collatz_BB_if_then_loopexit_4;
	else if ((fsm_stall == 1'd0) && (sum_collatz_for_inc_cmp3 == 1'd0))
		next_state = LEGUP_F_sum_collatz_BB_if_end_6;
LEGUP_F_sum_collatz_BB_if_else_8:
		next_state = LEGUP_F_sum_collatz_BB_for_inc_9;
LEGUP_F_sum_collatz_BB_if_end_6:
	if ((fsm_stall == 1'd0) && (sum_collatz_if_end_tobool == 1'd1))
		next_state = LEGUP_F_sum_collatz_BB_if_else_8;
	else if ((fsm_stall == 1'd0) && (sum_collatz_if_end_tobool == 1'd0))
		next_state = LEGUP_F_sum_collatz_BB_if_then5_7;
LEGUP_F_sum_collatz_BB_if_end_preheader_3:
		next_state = LEGUP_F_sum_collatz_BB_if_end_6;
LEGUP_F_sum_collatz_BB_if_then5_7:
		next_state = LEGUP_F_sum_collatz_BB_for_inc_9;
LEGUP_F_sum_collatz_BB_if_then_5:
	if ((fsm_stall == 1'd0) && (sum_collatz_if_then_exitcond1 == 1'd1))
		next_state = LEGUP_F_sum_collatz_BB_for_end10_10;
	else if ((fsm_stall == 1'd0) && (sum_collatz_if_then_exitcond1 == 1'd0))
		next_state = LEGUP_F_sum_collatz_BB_for_body2_preheader_2;
LEGUP_F_sum_collatz_BB_if_then_loopexit_4:
		next_state = LEGUP_F_sum_collatz_BB_if_then_5;
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
		sum_collatz_body2_preheader_indvar = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sum_collatz_BB_if_then_5) & (fsm_stall == 1'd0)) & (sum_collatz_if_then_exitcond1 == 1'd0))) */ begin
		sum_collatz_body2_preheader_indvar = sum_collatz_if_then_0;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_body2_preheader_indvar_reg <= sum_collatz_body2_preheader_indvar;
	end
	if ((((cur_state == LEGUP_F_sum_collatz_BB_if_then_5) & (fsm_stall == 1'd0)) & (sum_collatz_if_then_exitcond1 == 1'd0))) begin
		sum_collatz_body2_preheader_indvar_reg <= sum_collatz_body2_preheader_indvar;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_body2_preheader_sum_012 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sum_collatz_BB_if_then_5) & (fsm_stall == 1'd0)) & (sum_collatz_if_then_exitcond1 == 1'd0))) */ begin
		sum_collatz_body2_preheader_sum_012 = sum_collatz_if_then_add4;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_entry_1) & (fsm_stall == 1'd0))) begin
		sum_collatz_body2_preheader_sum_012_reg <= sum_collatz_body2_preheader_sum_012;
	end
	if ((((cur_state == LEGUP_F_sum_collatz_BB_if_then_5) & (fsm_stall == 1'd0)) & (sum_collatz_if_then_exitcond1 == 1'd0))) begin
		sum_collatz_body2_preheader_sum_012_reg <= sum_collatz_body2_preheader_sum_012;
	end
end
always @(*) begin
		sum_collatz_body2_preheader_i_013 = ({27'd0,sum_collatz_body2_preheader_indvar_reg} + n_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_body2_preheader_2)) begin
		sum_collatz_body2_preheader_i_013_reg <= sum_collatz_body2_preheader_i_013;
	end
end
always @(*) begin
		sum_collatz_body2_preheader_cmp39 = (sum_collatz_body2_preheader_i_013 == 32'd1);
end
always @(*) begin
	if ((((cur_state == LEGUP_F_sum_collatz_BB_for_body2_preheader_2) & (fsm_stall == 1'd0)) & (sum_collatz_body2_preheader_cmp39 == 1'd1))) begin
		sum_collatz_if_then_j_0_lcssa = 32'd0;
	end
	else /* if (((cur_state == LEGUP_F_sum_collatz_BB_if_then_loopexit_4) & (fsm_stall == 1'd0))) */ begin
		sum_collatz_if_then_j_0_lcssa = sum_collatz_if_end_1_reg;
	end
end
always @(posedge clk) begin
	if ((((cur_state == LEGUP_F_sum_collatz_BB_for_body2_preheader_2) & (fsm_stall == 1'd0)) & (sum_collatz_body2_preheader_cmp39 == 1'd1))) begin
		sum_collatz_if_then_j_0_lcssa_reg <= sum_collatz_if_then_j_0_lcssa;
	end
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_then_loopexit_4) & (fsm_stall == 1'd0))) begin
		sum_collatz_if_then_j_0_lcssa_reg <= sum_collatz_if_then_j_0_lcssa;
	end
end
always @(*) begin
		sum_collatz_if_then_add4 = (sum_collatz_if_then_j_0_lcssa_reg + sum_collatz_body2_preheader_sum_012_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_if_then_5)) begin
		sum_collatz_if_then_add4_reg <= sum_collatz_if_then_add4;
	end
end
always @(*) begin
		sum_collatz_if_then_0 = ({1'd0,sum_collatz_body2_preheader_indvar_reg} + 32'd1);
end
always @(*) begin
		sum_collatz_if_then_exitcond1 = ({26'd0,sum_collatz_if_then_0} == 32'd30);
end
always @(*) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_end_preheader_3) & (fsm_stall == 1'd0))) begin
		sum_collatz_if_end_j_011 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_sum_collatz_BB_for_inc_9) & (fsm_stall == 1'd0)) & (sum_collatz_for_inc_cmp3 == 1'd0))) */ begin
		sum_collatz_if_end_j_011 = sum_collatz_if_end_1_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_end_preheader_3) & (fsm_stall == 1'd0))) begin
		sum_collatz_if_end_j_011_reg <= sum_collatz_if_end_j_011;
	end
	if ((((cur_state == LEGUP_F_sum_collatz_BB_for_inc_9) & (fsm_stall == 1'd0)) & (sum_collatz_for_inc_cmp3 == 1'd0))) begin
		sum_collatz_if_end_j_011_reg <= sum_collatz_if_end_j_011;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_end_preheader_3) & (fsm_stall == 1'd0))) begin
		sum_collatz_if_end_m_010 = sum_collatz_body2_preheader_i_013_reg;
	end
	else /* if ((((cur_state == LEGUP_F_sum_collatz_BB_for_inc_9) & (fsm_stall == 1'd0)) & (sum_collatz_for_inc_cmp3 == 1'd0))) */ begin
		sum_collatz_if_end_m_010 = sum_collatz_for_inc_m_1_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_end_preheader_3) & (fsm_stall == 1'd0))) begin
		sum_collatz_if_end_m_010_reg <= sum_collatz_if_end_m_010;
	end
	if ((((cur_state == LEGUP_F_sum_collatz_BB_for_inc_9) & (fsm_stall == 1'd0)) & (sum_collatz_for_inc_cmp3 == 1'd0))) begin
		sum_collatz_if_end_m_010_reg <= sum_collatz_if_end_m_010;
	end
end
always @(*) begin
		sum_collatz_if_end_bit_select6 = sum_collatz_if_end_m_010_reg[0];
end
always @(*) begin
		sum_collatz_if_end_bit_select4 = sum_collatz_if_end_m_010_reg[30:0];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_if_end_6)) begin
		sum_collatz_if_end_bit_select4_reg <= sum_collatz_if_end_bit_select4;
	end
end
always @(*) begin
		sum_collatz_if_end_1 = (sum_collatz_if_end_j_011_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_sum_collatz_BB_if_end_6)) begin
		sum_collatz_if_end_1_reg <= sum_collatz_if_end_1;
	end
end
always @(*) begin
		sum_collatz_if_end_bit_concat7 = {sum_collatz_if_end_bit_concat7_bit_select_operand_0[30:0], sum_collatz_if_end_bit_select6};
end
always @(*) begin
		sum_collatz_if_end_tobool = (sum_collatz_if_end_bit_concat7 == 32'd0);
end
always @(*) begin
		sum_collatz_if_then5_bit_concat5 = {sum_collatz_if_end_bit_select4_reg[30:0], sum_collatz_if_then5_bit_concat5_bit_select_operand_2};
end
always @(*) begin
		sum_collatz_if_then5_sr_add3 = (sum_collatz_if_end_m_010_reg + sum_collatz_if_then5_bit_concat5);
end
always @(*) begin
		sum_collatz_if_then5_add6 = (sum_collatz_if_then5_sr_add3 + 32'd1);
end
always @(*) begin
		sum_collatz_if_else_2 = $signed(sum_collatz_if_end_m_010_reg);
end
always @(*) begin
		sum_collatz_if_else_sr_negate = (64'd0 - $signed({{1{sum_collatz_if_else_2[31]}},sum_collatz_if_else_2}));
end
always @(*) begin
		sum_collatz_if_else_bit_select2 = sum_collatz_if_else_sr_negate[32:0];
end
always @(*) begin
		sum_collatz_if_else_bit_concat3 = {sum_collatz_if_else_bit_select2[32:0], sum_collatz_if_else_bit_concat3_bit_select_operand_2[30:0]};
end
always @(*) begin
		sum_collatz_if_else_sr_add2 = ($signed({{32{sum_collatz_if_else_2[31]}},sum_collatz_if_else_2}) + sum_collatz_if_else_bit_concat3);
end
always @(*) begin
		sum_collatz_if_else_bit_select1 = sum_collatz_if_else_sr_add2[63:32];
end
always @(*) begin
		sum_collatz_if_else_3 = (sum_collatz_if_else_bit_select1 + sum_collatz_if_end_m_010_reg);
end
always @(*) begin
		sum_collatz_if_else_bit_select = sum_collatz_if_else_3[31];
end
always @(*) begin
		sum_collatz_if_else_bit_concat = {sum_collatz_if_else_bit_concat_bit_select_operand_0[30:0], sum_collatz_if_else_bit_select};
end
always @(*) begin
		sum_collatz_if_else_4 = (sum_collatz_if_else_3 + sum_collatz_if_else_bit_concat);
end
always @(*) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_then5_7) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_inc_m_1 = sum_collatz_if_then5_add6;
	end
	else /* if (((cur_state == LEGUP_F_sum_collatz_BB_if_else_8) & (fsm_stall == 1'd0))) */ begin
		sum_collatz_for_inc_m_1 = sum_collatz_if_else_4;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_then5_7) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_inc_m_1_reg <= sum_collatz_for_inc_m_1;
	end
	if (((cur_state == LEGUP_F_sum_collatz_BB_if_else_8) & (fsm_stall == 1'd0))) begin
		sum_collatz_for_inc_m_1_reg <= sum_collatz_for_inc_m_1;
	end
end
always @(*) begin
		sum_collatz_for_inc_cmp3 = (sum_collatz_for_inc_m_1_reg == 32'd1);
end
assign sum_collatz_if_end_bit_concat7_bit_select_operand_0 = 31'd0;
assign sum_collatz_if_then5_bit_concat5_bit_select_operand_2 = 1'd0;
assign sum_collatz_if_else_bit_concat3_bit_select_operand_2 = 31'd0;
assign sum_collatz_if_else_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_end10_10)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	if ((cur_state == LEGUP_F_sum_collatz_BB_for_end10_10)) begin
		return_val <= sum_collatz_if_then_add4_reg;
	end
end

endmodule



