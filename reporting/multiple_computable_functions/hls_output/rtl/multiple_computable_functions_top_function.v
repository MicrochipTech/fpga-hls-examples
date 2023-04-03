// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2023.1
// Copyright (c) 2015-2023 Microchip Technology Inc. All Rights Reserved.
// For support, please visit https://microchiptech.github.io/fpga-hls-docs/techsupport.html.
// Date: Mon Apr  3 08:59:50 2023
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
//
// NOTE:// If you take this code outside the SmartHLS directory structure
// into your own, then you should adjust this constant accordingly.
// E.g. for simulation on Modelsim:
//		vlog +define+MEM_INIT_DIR=/path/to/rtl/mem_init/ multiple_computable_functions.v  ...
//
`ifndef MEM_INIT_DIR
`define MEM_INIT_DIR "../hdl/"
`endif


`timescale 1 ns / 1 ns
module top_function_top
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
reg  top_function_inst_clk;
reg  top_function_inst_reset;
reg  top_function_inst_start;
wire  top_function_inst_ready;
wire  top_function_inst_finish;
wire [31:0] top_function_inst_return_val;
reg [31:0] top_function_inst_n;
wire  top_function_inst_sub_function_start;
reg  top_function_inst_sub_function_finish;
reg  top_function_inst_sub_function_ready;
reg [31:0] top_function_inst_sub_function_return_val;
wire [31:0] top_function_inst_sub_function_n;
reg  top_function_inst_finish_reg;
reg [31:0] top_function_inst_return_val_reg;
reg  sub_function_inst_clk;
reg  sub_function_inst_reset;
reg  sub_function_inst_start;
wire  sub_function_inst_ready;
wire  sub_function_inst_finish;
wire [31:0] sub_function_inst_return_val;
reg [31:0] sub_function_inst_n;
reg  sub_function_inst_finish_reg;
reg [31:0] sub_function_inst_return_val_reg;


top_function_top_function top_function_inst (
	.clk (top_function_inst_clk),
	.reset (top_function_inst_reset),
	.start (top_function_inst_start),
	.ready (top_function_inst_ready),
	.finish (top_function_inst_finish),
	.return_val (top_function_inst_return_val),
	.n (top_function_inst_n),
	.sub_function_start (top_function_inst_sub_function_start),
	.sub_function_finish (top_function_inst_sub_function_finish),
	.sub_function_ready (top_function_inst_sub_function_ready),
	.sub_function_return_val (top_function_inst_sub_function_return_val),
	.sub_function_n (top_function_inst_sub_function_n)
);



top_function_sub_function sub_function_inst (
	.clk (sub_function_inst_clk),
	.reset (sub_function_inst_reset),
	.start (sub_function_inst_start),
	.ready (sub_function_inst_ready),
	.finish (sub_function_inst_finish),
	.return_val (sub_function_inst_return_val),
	.n (sub_function_inst_n)
);



always @(*) begin
	top_function_inst_clk = clk;
end
always @(*) begin
	top_function_inst_reset = reset;
end
always @(*) begin
	top_function_inst_start = start;
end
always @(*) begin
	top_function_inst_n = n;
end
always @(*) begin
	top_function_inst_sub_function_finish = (~(sub_function_inst_start) & sub_function_inst_finish_reg);
end
always @(*) begin
	top_function_inst_sub_function_ready = sub_function_inst_ready;
end
always @(*) begin
	top_function_inst_sub_function_return_val = sub_function_inst_return_val_reg;
end
always @(posedge clk) begin
	if ((reset | top_function_inst_start)) begin
		top_function_inst_finish_reg <= 1'd0;
	end
	if (top_function_inst_finish) begin
		top_function_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	if ((reset | top_function_inst_start)) begin
		top_function_inst_return_val_reg <= 0;
	end
	if (top_function_inst_finish) begin
		top_function_inst_return_val_reg <= top_function_inst_return_val;
	end
end
always @(*) begin
	sub_function_inst_clk = clk;
end
always @(*) begin
	sub_function_inst_reset = reset;
end
always @(*) begin
	sub_function_inst_start = top_function_inst_sub_function_start;
end
always @(*) begin
	sub_function_inst_n = top_function_inst_sub_function_n;
end
always @(posedge clk) begin
	if ((reset | sub_function_inst_start)) begin
		sub_function_inst_finish_reg <= 1'd0;
	end
	if (sub_function_inst_finish) begin
		sub_function_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	if ((reset | sub_function_inst_start)) begin
		sub_function_inst_return_val_reg <= 0;
	end
	if (sub_function_inst_finish) begin
		sub_function_inst_return_val_reg <= sub_function_inst_return_val;
	end
end
always @(*) begin
	ready = top_function_inst_ready;
end
always @(*) begin
	finish = top_function_inst_finish;
end
always @(*) begin
	return_val = top_function_inst_return_val;
end

endmodule

`timescale 1 ns / 1 ns
module top_function_top_function
(
	clk,
	reset,
	start,
	ready,
	finish,
	return_val,
	n,
	sub_function_start,
	sub_function_finish,
	sub_function_ready,
	sub_function_return_val,
	sub_function_n
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_top_function_BB_entry_1 = 3'd1;
parameter [2:0] LEGUP_F_top_function_BB_for_body_2 = 3'd2;
parameter [2:0] LEGUP_F_top_function_BB_for_body_4 = 3'd4;
parameter [2:0] LEGUP_F_top_function_BB_for_end_5 = 3'd5;
parameter [2:0] LEGUP_function_call_3 = 3'd3;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg [31:0] return_val;
input [31:0] n;
output reg  sub_function_start;
input  sub_function_finish;
input  sub_function_ready;
input [31:0] sub_function_return_val;
output reg [31:0] sub_function_n;
reg [2:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [2:0] next_state;
reg [31:0] n_reg;
wire  fsm_stall;
reg [4:0] top_function_for_body_indvar;
reg [4:0] top_function_for_body_indvar_reg;
reg [31:0] top_function_for_body_sum_05;
reg [31:0] top_function_for_body_sum_05_reg;
reg [31:0] top_function_for_body_i_06;
reg [31:0] top_function_for_body_call;
reg [31:0] top_function_for_body_call_reg;
reg [31:0] top_function_for_body_add1;
reg [31:0] top_function_for_body_add1_reg;
reg [5:0] top_function_for_body_0;
reg [5:0] top_function_for_body_0_reg;
reg  top_function_for_body_exitcond1;
reg  top_function_for_body_exitcond1_reg;


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
		next_state = LEGUP_F_top_function_BB_entry_1;
LEGUP_F_top_function_BB_entry_1:
		next_state = LEGUP_F_top_function_BB_for_body_2;
LEGUP_F_top_function_BB_for_body_2:
		next_state = LEGUP_function_call_3;
LEGUP_F_top_function_BB_for_body_4:
	if ((fsm_stall == 1'd0) && (top_function_for_body_exitcond1_reg == 1'd1))
		next_state = LEGUP_F_top_function_BB_for_end_5;
	else if ((fsm_stall == 1'd0) && (top_function_for_body_exitcond1_reg == 1'd0))
		next_state = LEGUP_F_top_function_BB_for_body_2;
LEGUP_F_top_function_BB_for_end_5:
		next_state = LEGUP_0;
LEGUP_function_call_3:
	if ((fsm_stall == 1'd0) && (sub_function_finish == 1'd1))
		next_state = LEGUP_F_top_function_BB_for_body_4;
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
	if (((cur_state == LEGUP_F_top_function_BB_entry_1) & (fsm_stall == 1'd0))) begin
		top_function_for_body_indvar = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_top_function_BB_for_body_4) & (fsm_stall == 1'd0)) & (top_function_for_body_exitcond1_reg == 1'd0))) */ begin
		top_function_for_body_indvar = top_function_for_body_0_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_top_function_BB_entry_1) & (fsm_stall == 1'd0))) begin
		top_function_for_body_indvar_reg <= top_function_for_body_indvar;
	end
	if ((((cur_state == LEGUP_F_top_function_BB_for_body_4) & (fsm_stall == 1'd0)) & (top_function_for_body_exitcond1_reg == 1'd0))) begin
		top_function_for_body_indvar_reg <= top_function_for_body_indvar;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_top_function_BB_entry_1) & (fsm_stall == 1'd0))) begin
		top_function_for_body_sum_05 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_top_function_BB_for_body_4) & (fsm_stall == 1'd0)) & (top_function_for_body_exitcond1_reg == 1'd0))) */ begin
		top_function_for_body_sum_05 = top_function_for_body_add1;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_top_function_BB_entry_1) & (fsm_stall == 1'd0))) begin
		top_function_for_body_sum_05_reg <= top_function_for_body_sum_05;
	end
	if ((((cur_state == LEGUP_F_top_function_BB_for_body_4) & (fsm_stall == 1'd0)) & (top_function_for_body_exitcond1_reg == 1'd0))) begin
		top_function_for_body_sum_05_reg <= top_function_for_body_sum_05;
	end
end
always @(*) begin
		top_function_for_body_i_06 = ({27'd0,top_function_for_body_indvar_reg} + n_reg);
end
always @(*) begin
		top_function_for_body_call = sub_function_return_val;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_function_call_3)) begin
		top_function_for_body_call_reg <= top_function_for_body_call;
	end
end
always @(*) begin
		top_function_for_body_add1 = (top_function_for_body_call_reg + top_function_for_body_sum_05_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_top_function_BB_for_body_4)) begin
		top_function_for_body_add1_reg <= top_function_for_body_add1;
	end
end
always @(*) begin
		top_function_for_body_0 = ({1'd0,top_function_for_body_indvar_reg} + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_top_function_BB_for_body_2)) begin
		top_function_for_body_0_reg <= top_function_for_body_0;
	end
end
always @(*) begin
		top_function_for_body_exitcond1 = ({26'd0,top_function_for_body_0} == 32'd16);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_top_function_BB_for_body_2)) begin
		top_function_for_body_exitcond1_reg <= top_function_for_body_exitcond1;
	end
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_top_function_BB_for_end_5)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	if ((cur_state == LEGUP_F_top_function_BB_for_end_5)) begin
		return_val <= top_function_for_body_add1_reg;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sub_function_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_top_function_BB_for_body_2)) begin
		sub_function_start <= (fsm_stall == 1'd0);
	end
	if ((cur_state == LEGUP_function_call_3)) begin
		sub_function_start <= 1'd0;
	end
end
always @(posedge clk) begin
	sub_function_n <= 0;
	if ((cur_state == LEGUP_F_top_function_BB_for_body_2)) begin
		sub_function_n <= top_function_for_body_i_06;
	end
end

endmodule

`timescale 1 ns / 1 ns
module top_function_sub_function
(
	clk,
	reset,
	start,
	ready,
	finish,
	return_val,
	n
);

parameter [1:0] LEGUP_0 = 2'd0;
parameter [1:0] LEGUP_F_sub_function_BB_entry_1 = 2'd1;
parameter [1:0] LEGUP_F_sub_function_BB_entry_2 = 2'd2;
parameter [1:0] LEGUP_F_sub_function_BB_entry_3 = 2'd3;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg [31:0] return_val;
input [31:0] n;
reg [1:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [1:0] next_state;
reg [31:0] n_reg;
wire  fsm_stall;
reg [31:0] sub_function_entry_mul;
reg [31:0] sub_function_entry_sub;
reg  legup_mult_unsigned_32_32_2_0_clock;
reg  legup_mult_unsigned_32_32_2_0_aclr;
reg  legup_mult_unsigned_32_32_2_0_clken;
reg [31:0] legup_mult_unsigned_32_32_2_0_dataa;
reg [31:0] legup_mult_unsigned_32_32_2_0_datab;
wire [31:0] legup_mult_unsigned_32_32_2_0_result;
reg [31:0] legup_mult_sub_function_entry_mul_out_actual;
reg [31:0] legup_mult_sub_function_entry_mul_out;
reg  legup_mult_sub_function_entry_mul_en;
reg  legup_mult_sub_function_entry_mul_en_sequential_cond;

/*   %mul = mul nsw i32 %n, %n, !dbg !351, !MSB !352, !LSB !353, !ExtendFrom !352*/
top_function_legup_mult legup_mult_unsigned_32_32_2_0 (
	.clock (legup_mult_unsigned_32_32_2_0_clock),
	.aclr (legup_mult_unsigned_32_32_2_0_aclr),
	.clken (legup_mult_unsigned_32_32_2_0_clken),
	.dataa (legup_mult_unsigned_32_32_2_0_dataa),
	.datab (legup_mult_unsigned_32_32_2_0_datab),
	.result (legup_mult_unsigned_32_32_2_0_result)
);

defparam
	legup_mult_unsigned_32_32_2_0.widtha = 32,
	legup_mult_unsigned_32_32_2_0.widthb = 32,
	legup_mult_unsigned_32_32_2_0.widthp = 32,
	legup_mult_unsigned_32_32_2_0.pipeline = 2,
	legup_mult_unsigned_32_32_2_0.representation = "UNSIGNED";


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
		next_state = LEGUP_F_sub_function_BB_entry_1;
LEGUP_F_sub_function_BB_entry_1:
		next_state = LEGUP_F_sub_function_BB_entry_2;
LEGUP_F_sub_function_BB_entry_2:
		next_state = LEGUP_F_sub_function_BB_entry_3;
LEGUP_F_sub_function_BB_entry_3:
		next_state = LEGUP_0;
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
	sub_function_entry_mul = legup_mult_sub_function_entry_mul_out;
end
always @(*) begin
		sub_function_entry_sub = (sub_function_entry_mul - n_reg);
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_clock = clk;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_aclr = reset;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_clken = legup_mult_sub_function_entry_mul_en;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_dataa = n_reg;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_datab = n_reg;
end
always @(*) begin
	legup_mult_sub_function_entry_mul_out_actual = legup_mult_unsigned_32_32_2_0_result;
end
always @(*) begin
	legup_mult_sub_function_entry_mul_out = legup_mult_sub_function_entry_mul_out_actual[31:0];
end
always @(*) begin
	legup_mult_sub_function_entry_mul_en = legup_mult_sub_function_entry_mul_en_sequential_cond;
end
always @(*) begin
	legup_mult_sub_function_entry_mul_en_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_sub_function_BB_entry_3)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	if ((cur_state == LEGUP_F_sub_function_BB_entry_3)) begin
		return_val <= sub_function_entry_sub;
	end
end

endmodule



// ©2022 Microchip Technology Inc. and its subsidiaries
//
// Subject to your compliance with these terms, you may use this Microchip
// software and any derivatives exclusively with Microchip products. You are
// responsible for complying with third party license terms applicable to your
// use of third party software (including open source software) that may
// accompany this Microchip software. SOFTWARE IS “AS IS.” NO WARRANTIES,
// WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING
// ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR
// A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY
// INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST
// OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED,
// EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
// FORESEEABLE.  TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP’S TOTAL
// LIABILITY ON ALL CLAIMS LATED TO THE SOFTWARE WILL NOT EXCEED AMOUNT OF
// FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE. MICROCHIP
// OFFERS NO SUPPORT FOR THE SOFTWARE. YOU MAY CONTACT MICROCHIP AT
// https://www.microchip.com/en-us/support-and-training/design-help/client-support-services
// TO INQUIRE ABOUT SUPPORT SERVICES AND APPLICABLE FEES, IF AVAILABLE.

`timescale 1ns / 1ns
module top_function_legup_mult # (
  parameter widtha = 32,
  parameter widthb = 32,
  parameter widthp = 64,
  parameter pipeline = 3,
  parameter representation = "UNSIGNED",
  parameter pipeline_stallable = 0 
) (
  input clock,
  input aclr,
  input clken,
  input [widtha-1:0] dataa,
  input [widthb-1:0] datab,
  output [widthp-1:0] result
);

generate 
if (pipeline == 0) begin
  // If the number of pipeline stages is 0, 
  // instantiate the combinational multiplier
  top_function_legup_mult_core legup_mult_core_inst(
      .dataa(dataa),
      .datab(datab),
      .result(result) 
  );
  defparam legup_mult_core_inst.widtha = widtha;
  defparam legup_mult_core_inst.widthb = widthb;
  defparam legup_mult_core_inst.widthp = widthp;
  defparam legup_mult_core_inst.representation = representation;

end else if (pipeline_stallable == 0) begin
  // If the datapath that uses the multiplier is not a pipeline or 
  // is a pipeline but is not stallable, or if the number of pipeline stages
  // is 1 or less,
  // simply instantiate the normal multiplier
  top_function_legup_mult_pipelined legup_mult_pipelined_inst(
      .clock(clock),
      .aclr(aclr),
      .clken(clken),
      .dataa(dataa),
      .datab(datab),
      .result(result) 
  );
  defparam legup_mult_pipelined_inst.widtha = widtha;
  defparam legup_mult_pipelined_inst.widthb = widthb;
  defparam legup_mult_pipelined_inst.widthp = widthp;
  defparam legup_mult_pipelined_inst.pipeline = pipeline;
  defparam legup_mult_pipelined_inst.representation = representation;

end 
endgenerate

endmodule


// ©2022 Microchip Technology Inc. and its subsidiaries
//
// Subject to your compliance with these terms, you may use this Microchip
// software and any derivatives exclusively with Microchip products. You are
// responsible for complying with third party license terms applicable to your
// use of third party software (including open source software) that may
// accompany this Microchip software. SOFTWARE IS “AS IS.” NO WARRANTIES,
// WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING
// ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR
// A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY
// INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST
// OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED,
// EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
// FORESEEABLE.  TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP’S TOTAL
// LIABILITY ON ALL CLAIMS LATED TO THE SOFTWARE WILL NOT EXCEED AMOUNT OF
// FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE. MICROCHIP
// OFFERS NO SUPPORT FOR THE SOFTWARE. YOU MAY CONTACT MICROCHIP AT
// https://www.microchip.com/en-us/support-and-training/design-help/client-support-services
// TO INQUIRE ABOUT SUPPORT SERVICES AND APPLICABLE FEES, IF AVAILABLE.

// combinational generic multiplier
`timescale 1ns / 1ns

module top_function_legup_mult_core(
    dataa,
    datab,
    result  
);

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;
parameter representation = "UNSIGNED";

input [widtha-1:0] dataa;
input [widthb-1:0] datab;
output [widthp-1:0] result;

generate
if (representation == "UNSIGNED")
begin

    wire [widtha-1:0] dataa_in = dataa;
    wire [widthb-1:0] datab_in = datab;
    assign result = dataa_in * datab_in;

end else begin

    wire signed [widtha-1:0] dataa_in = dataa;
    wire signed [widthb-1:0] datab_in = datab;
    assign result = dataa_in * datab_in;

end
endgenerate

endmodule

// ©2022 Microchip Technology Inc. and its subsidiaries
//
// Subject to your compliance with these terms, you may use this Microchip
// software and any derivatives exclusively with Microchip products. You are
// responsible for complying with third party license terms applicable to your
// use of third party software (including open source software) that may
// accompany this Microchip software. SOFTWARE IS “AS IS.” NO WARRANTIES,
// WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING
// ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR
// A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY
// INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST
// OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED,
// EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
// FORESEEABLE.  TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP’S TOTAL
// LIABILITY ON ALL CLAIMS LATED TO THE SOFTWARE WILL NOT EXCEED AMOUNT OF
// FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE. MICROCHIP
// OFFERS NO SUPPORT FOR THE SOFTWARE. YOU MAY CONTACT MICROCHIP AT
// https://www.microchip.com/en-us/support-and-training/design-help/client-support-services
// TO INQUIRE ABOUT SUPPORT SERVICES AND APPLICABLE FEES, IF AVAILABLE.

// generic multiplier with parameterizable pipeline stages
`timescale 1ns / 1ns
module top_function_legup_mult_pipelined(
    clock,
    aclr,
    clken, 
    dataa,
    datab,
    result  
)/* synthesis syn_hier = fixed */;

parameter widtha = 32;
parameter widthb = 32;
parameter widthp = 64;
parameter pipeline = 3;
parameter representation = "UNSIGNED";
localparam num_input_pipelines = pipeline >> 1;
localparam num_output_pipelines = pipeline - num_input_pipelines;

input clock;
input aclr;
input clken; 

input [widtha-1:0] dataa;
input [widthb-1:0] datab;
output [widthp-1:0] result;

`define PIPELINED_MULTIPLIER_CORE                                                                                \
    integer input_stage;                                                                                         \
    always @(*)                                                                                                  \
    begin                                                                                                        \
      dataa_reg[0] <= dataa;                                                                                     \
      datab_reg[0] <= datab;                                                                                     \
    end                                                                                                          \
    always @(posedge clock)                                                                                      \
    begin                                                                                                        \
      for (input_stage=0; input_stage<num_input_pipelines; input_stage=input_stage+1) begin                      \
        if (aclr) begin                                                                                          \
          dataa_reg[input_stage+1] <= 'd0;                                                                       \
          datab_reg[input_stage+1] <= 'd0;                                                                       \
        end else if (clken) begin                                                                                \
          dataa_reg[input_stage+1] <= dataa_reg[input_stage];                                                    \
          datab_reg[input_stage+1] <= datab_reg[input_stage];                                                    \
        end                                                                                                      \
      end                                                                                                        \
    end                                                                                                          \
    integer output_stage;                                                                                        \
    always @(*)                                                                                                  \
    begin                                                                                                        \
      result_reg[0] <= dataa_reg[num_input_pipelines] * datab_reg[num_input_pipelines];                          \
    end                                                                                                          \
    always @(posedge clock)                                                                                      \
    begin                                                                                                        \
      for (output_stage=0; output_stage<num_output_pipelines; output_stage=output_stage+1) begin                 \
        if (aclr) begin                                                                                          \
           result_reg[output_stage+1] <= 'd0;                                                                    \
        end else if (clken) begin                                                                                \
           result_reg[output_stage+1] <= result_reg[output_stage];                                               \
        end                                                                                                      \
      end                                                                                                        \
    end                                                                                                          \
    assign result = result_reg[num_output_pipelines];

generate
if (representation == "UNSIGNED")
begin
    reg [widtha-1:0] dataa_reg [num_input_pipelines:0];
    reg [widthb-1:0] datab_reg [num_input_pipelines:0];
    reg [widthp-1:0] result_reg [num_output_pipelines:0];

    `PIPELINED_MULTIPLIER_CORE

end else begin

    reg signed [widtha-1:0] dataa_reg [num_input_pipelines:0];
    reg signed [widthb-1:0] datab_reg [num_input_pipelines:0];
    reg signed [widthp-1:0] result_reg [num_output_pipelines:0];

    `PIPELINED_MULTIPLIER_CORE

end
endgenerate

endmodule

