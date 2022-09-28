// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2022.1
// Copyright (c) 2015-2022 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: smarthls@microchip.com
// Date: Mon May  2 10:34:24 2022
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEM_INIT_DIR "../simulation/"
/* synthesis translate_off */
// For Microsemi, the simulation directory is different from
// the synthesis directory for memory initialization files.
`undef MEM_INIT_DIR
`define MEM_INIT_DIR "../rtl/mem_init/"
/* synthesis translate_on */

`timescale 1 ns / 1 ns
module texture_mapper_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	run_loop,
	run_done_write_en,
	run_done_write_data,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid,
	axi_s_aw_addr,
	axi_s_aw_ready,
	axi_s_aw_valid,
	axi_s_aw_burst,
	axi_s_aw_size,
	axi_s_aw_len,
	axi_s_w_data,
	axi_s_w_ready,
	axi_s_w_valid,
	axi_s_w_strb,
	axi_s_w_last,
	axi_s_b_resp,
	axi_s_b_resp_ready,
	axi_s_b_resp_valid,
	axi_s_ar_addr,
	axi_s_ar_ready,
	axi_s_ar_valid,
	axi_s_ar_burst,
	axi_s_ar_size,
	axi_s_ar_len,
	axi_s_r_data,
	axi_s_r_ready,
	axi_s_r_valid,
	axi_s_r_resp,
	axi_s_r_last
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] run_loop;
output reg  run_done_write_en;
output reg [7:0] run_done_write_data;
output reg [63:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
input [31:0] axi_s_aw_addr;
output reg  axi_s_aw_ready;
input  axi_s_aw_valid;
input [1:0] axi_s_aw_burst;
input [2:0] axi_s_aw_size;
input [7:0] axi_s_aw_len;
input [63:0] axi_s_w_data;
output reg  axi_s_w_ready;
input  axi_s_w_valid;
input [7:0] axi_s_w_strb;
input  axi_s_w_last;
output reg [1:0] axi_s_b_resp;
input  axi_s_b_resp_ready;
output reg  axi_s_b_resp_valid;
input [31:0] axi_s_ar_addr;
output reg  axi_s_ar_ready;
input  axi_s_ar_valid;
input [1:0] axi_s_ar_burst;
input [2:0] axi_s_ar_size;
input [7:0] axi_s_ar_len;
output reg [63:0] axi_s_r_data;
input  axi_s_r_ready;
output reg  axi_s_r_valid;
output reg [1:0] axi_s_r_resp;
output reg  axi_s_r_last;
reg  texture_mapper_inst_clk;
reg  texture_mapper_inst_reset;
reg  texture_mapper_inst_start;
wire  texture_mapper_inst_ready;
wire  texture_mapper_inst_finish;
reg [7:0] texture_mapper_inst_run_loop;
wire  texture_mapper_inst_texture_mapper_orig_start;
reg  texture_mapper_inst_texture_mapper_orig_finish;
reg  texture_mapper_inst_texture_mapper_orig_ready;
wire [7:0] texture_mapper_inst_texture_mapper_orig_run_loop;
wire  texture_mapper_inst_gv_read_start;
reg  texture_mapper_inst_gv_read_finish;
reg  texture_mapper_inst_gv_read_ready;
wire  texture_mapper_inst_gv_write_start;
reg  texture_mapper_inst_gv_write_finish;
reg  texture_mapper_inst_gv_write_ready;
reg  texture_mapper_inst_finish_reg;
reg  texture_mapper_orig_inst_clk;
reg  texture_mapper_orig_inst_reset;
reg  texture_mapper_orig_inst_start;
wire  texture_mapper_orig_inst_ready;
wire  texture_mapper_orig_inst_finish;
reg [7:0] texture_mapper_orig_inst_run_loop;
wire  texture_mapper_orig_inst_run_done_write_en;
wire [7:0] texture_mapper_orig_inst_run_done_write_data;
wire  texture_mapper_orig_inst_gv_AX_write_en;
wire [31:0] texture_mapper_orig_inst_gv_AX_write_data;
reg [31:0] texture_mapper_orig_inst_gv_AX_read_data;
wire  texture_mapper_orig_inst_gv_AY_write_en;
wire [31:0] texture_mapper_orig_inst_gv_AY_write_data;
reg [31:0] texture_mapper_orig_inst_gv_AY_read_data;
wire  texture_mapper_orig_inst_gv_BX_write_en;
wire [31:0] texture_mapper_orig_inst_gv_BX_write_data;
reg [31:0] texture_mapper_orig_inst_gv_BX_read_data;
wire  texture_mapper_orig_inst_gv_BY_write_en;
wire [31:0] texture_mapper_orig_inst_gv_BY_write_data;
reg [31:0] texture_mapper_orig_inst_gv_BY_read_data;
wire [63:0] texture_mapper_orig_inst_output_fifo;
reg  texture_mapper_orig_inst_output_fifo_ready;
wire  texture_mapper_orig_inst_output_fifo_valid;
wire  texture_mapper_orig_inst_gv_DX1DY_write_en;
wire [31:0] texture_mapper_orig_inst_gv_DX1DY_write_data;
reg [31:0] texture_mapper_orig_inst_gv_DX1DY_read_data;
wire  texture_mapper_orig_inst_gv_DY1DY_write_en;
wire [31:0] texture_mapper_orig_inst_gv_DY1DY_write_data;
reg [31:0] texture_mapper_orig_inst_gv_DY1DY_read_data;
wire  texture_mapper_orig_inst_gv_DX2DY_write_en;
wire [31:0] texture_mapper_orig_inst_gv_DX2DY_write_data;
reg [31:0] texture_mapper_orig_inst_gv_DX2DY_read_data;
wire  texture_mapper_orig_inst_gv_DY2DY_write_en;
wire [31:0] texture_mapper_orig_inst_gv_DY2DY_write_data;
reg [31:0] texture_mapper_orig_inst_gv_DY2DY_read_data;
reg  texture_mapper_orig_inst_finish_reg;
reg  gv_AX_inst_clk;
reg  gv_AX_inst_reset;
reg  gv_AX_inst_write_en;
wire [31:0] gv_AX_inst_read_data;
reg [31:0] gv_AX_inst_write_data;
reg  gv_AY_inst_clk;
reg  gv_AY_inst_reset;
reg  gv_AY_inst_write_en;
wire [31:0] gv_AY_inst_read_data;
reg [31:0] gv_AY_inst_write_data;
reg  gv_BX_inst_clk;
reg  gv_BX_inst_reset;
reg  gv_BX_inst_write_en;
wire [31:0] gv_BX_inst_read_data;
reg [31:0] gv_BX_inst_write_data;
reg  gv_BY_inst_clk;
reg  gv_BY_inst_reset;
reg  gv_BY_inst_write_en;
wire [31:0] gv_BY_inst_read_data;
reg [31:0] gv_BY_inst_write_data;
reg  gv_DX1DY_inst_clk;
reg  gv_DX1DY_inst_reset;
reg  gv_DX1DY_inst_write_en;
wire [31:0] gv_DX1DY_inst_read_data;
reg [31:0] gv_DX1DY_inst_write_data;
reg  gv_DY1DY_inst_clk;
reg  gv_DY1DY_inst_reset;
reg  gv_DY1DY_inst_write_en;
wire [31:0] gv_DY1DY_inst_read_data;
reg [31:0] gv_DY1DY_inst_write_data;
reg  gv_DX2DY_inst_clk;
reg  gv_DX2DY_inst_reset;
reg  gv_DX2DY_inst_write_en;
wire [31:0] gv_DX2DY_inst_read_data;
reg [31:0] gv_DX2DY_inst_write_data;
reg  gv_DY2DY_inst_clk;
reg  gv_DY2DY_inst_reset;
reg  gv_DY2DY_inst_write_en;
wire [31:0] gv_DY2DY_inst_read_data;
reg [31:0] gv_DY2DY_inst_write_data;
reg  gv_read_inst_clk;
reg  gv_read_inst_reset;
reg  gv_read_inst_start;
wire  gv_read_inst_ready;
wire  gv_read_inst_finish;
reg [31:0] gv_read_inst_s_ar_addr;
wire  gv_read_inst_axi_s_ar_ready;
reg  gv_read_inst_axi_s_ar_valid;
reg [1:0] gv_read_inst_s_ar_burst;
reg [2:0] gv_read_inst_s_ar_size;
reg [7:0] gv_read_inst_s_ar_len;
wire  gv_read_inst_gv_AY_write_en;
wire [31:0] gv_read_inst_gv_AY_write_data;
reg [31:0] gv_read_inst_gv_AY_read_data;
wire  gv_read_inst_gv_AX_write_en;
wire [31:0] gv_read_inst_gv_AX_write_data;
reg [31:0] gv_read_inst_gv_AX_read_data;
wire  gv_read_inst_gv_BY_write_en;
wire [31:0] gv_read_inst_gv_BY_write_data;
reg [31:0] gv_read_inst_gv_BY_read_data;
wire  gv_read_inst_gv_BX_write_en;
wire [31:0] gv_read_inst_gv_BX_write_data;
reg [31:0] gv_read_inst_gv_BX_read_data;
wire  gv_read_inst_gv_DY1DY_write_en;
wire [31:0] gv_read_inst_gv_DY1DY_write_data;
reg [31:0] gv_read_inst_gv_DY1DY_read_data;
wire  gv_read_inst_gv_DX1DY_write_en;
wire [31:0] gv_read_inst_gv_DX1DY_write_data;
reg [31:0] gv_read_inst_gv_DX1DY_read_data;
wire  gv_read_inst_gv_DY2DY_write_en;
wire [31:0] gv_read_inst_gv_DY2DY_write_data;
reg [31:0] gv_read_inst_gv_DY2DY_read_data;
wire  gv_read_inst_gv_DX2DY_write_en;
wire [31:0] gv_read_inst_gv_DX2DY_write_data;
reg [31:0] gv_read_inst_gv_DX2DY_read_data;
wire  gv_read_inst_gv_ctrl_write_en;
wire  gv_read_inst_gv_ctrl_write_data;
reg  gv_read_inst_gv_ctrl_read_data;
wire [63:0] gv_read_inst_s_r_data;
reg  gv_read_inst_axi_s_r_ready;
wire  gv_read_inst_axi_s_r_valid;
wire [1:0] gv_read_inst_s_r_resp;
wire  gv_read_inst_s_r_last;
reg  gv_read_inst_finish_reg;
reg  gv_ctrl_inst_clk;
reg  gv_ctrl_inst_reset;
reg  gv_ctrl_inst_write_en;
wire  gv_ctrl_inst_read_data;
wire  gv_ctrl_inst_write_data;
reg  gv_write_inst_clk;
reg  gv_write_inst_reset;
reg  gv_write_inst_start;
wire  gv_write_inst_ready;
wire  gv_write_inst_finish;
reg [31:0] gv_write_inst_s_aw_addr;
wire  gv_write_inst_axi_s_aw_ready;
reg  gv_write_inst_axi_s_aw_valid;
reg [63:0] gv_write_inst_s_w_data;
wire  gv_write_inst_axi_s_w_ready;
reg  gv_write_inst_axi_s_w_valid;
reg [1:0] gv_write_inst_s_aw_burst;
reg [2:0] gv_write_inst_s_aw_size;
reg [7:0] gv_write_inst_s_aw_len;
reg [7:0] gv_write_inst_s_w_strb;
reg  gv_write_inst_s_w_last;
wire  gv_write_inst_gv_ctrl_write_en;
wire  gv_write_inst_gv_ctrl_write_data;
wire  gv_write_inst_gv_ctrl_read_data;
wire  gv_write_inst_gv_AX_write_en;
wire [31:0] gv_write_inst_gv_AX_write_data;
reg [31:0] gv_write_inst_gv_AX_read_data;
wire  gv_write_inst_gv_BX_write_en;
wire [31:0] gv_write_inst_gv_BX_write_data;
reg [31:0] gv_write_inst_gv_BX_read_data;
wire  gv_write_inst_gv_DX1DY_write_en;
wire [31:0] gv_write_inst_gv_DX1DY_write_data;
reg [31:0] gv_write_inst_gv_DX1DY_read_data;
wire  gv_write_inst_gv_DX2DY_write_en;
wire [31:0] gv_write_inst_gv_DX2DY_write_data;
reg [31:0] gv_write_inst_gv_DX2DY_read_data;
wire  gv_write_inst_gv_AY_write_en;
wire [31:0] gv_write_inst_gv_AY_write_data;
reg [31:0] gv_write_inst_gv_AY_read_data;
wire  gv_write_inst_gv_BY_write_en;
wire [31:0] gv_write_inst_gv_BY_write_data;
reg [31:0] gv_write_inst_gv_BY_read_data;
wire  gv_write_inst_gv_DY1DY_write_en;
wire [31:0] gv_write_inst_gv_DY1DY_write_data;
reg [31:0] gv_write_inst_gv_DY1DY_read_data;
wire  gv_write_inst_gv_DY2DY_write_en;
wire [31:0] gv_write_inst_gv_DY2DY_write_data;
reg [31:0] gv_write_inst_gv_DY2DY_read_data;
wire [1:0] gv_write_inst_s_b_resp;
reg  gv_write_inst_s_b_resp_ready;
wire  gv_write_inst_s_b_resp_valid;
reg  gv_write_inst_finish_reg;


texture_mapper texture_mapper_inst (
	.clk (texture_mapper_inst_clk),
	.reset (texture_mapper_inst_reset),
	.start (texture_mapper_inst_start),
	.ready (texture_mapper_inst_ready),
	.finish (texture_mapper_inst_finish),
	.run_loop (texture_mapper_inst_run_loop),
	.texture_mapper_orig_start (texture_mapper_inst_texture_mapper_orig_start),
	.texture_mapper_orig_finish (texture_mapper_inst_texture_mapper_orig_finish),
	.texture_mapper_orig_ready (texture_mapper_inst_texture_mapper_orig_ready),
	.texture_mapper_orig_run_loop (texture_mapper_inst_texture_mapper_orig_run_loop),
	.gv_read_start (texture_mapper_inst_gv_read_start),
	.gv_read_finish (texture_mapper_inst_gv_read_finish),
	.gv_read_ready (texture_mapper_inst_gv_read_ready),
	.gv_write_start (texture_mapper_inst_gv_write_start),
	.gv_write_finish (texture_mapper_inst_gv_write_finish),
	.gv_write_ready (texture_mapper_inst_gv_write_ready)
);



texture_mapper_orig texture_mapper_orig_inst (
	.clk (texture_mapper_orig_inst_clk),
	.reset (texture_mapper_orig_inst_reset),
	.start (texture_mapper_orig_inst_start),
	.ready (texture_mapper_orig_inst_ready),
	.finish (texture_mapper_orig_inst_finish),
	.run_loop (texture_mapper_orig_inst_run_loop),
	.run_done_write_en (texture_mapper_orig_inst_run_done_write_en),
	.run_done_write_data (texture_mapper_orig_inst_run_done_write_data),
	.gv_AX_write_en (texture_mapper_orig_inst_gv_AX_write_en),
	.gv_AX_write_data (texture_mapper_orig_inst_gv_AX_write_data),
	.gv_AX_read_data (texture_mapper_orig_inst_gv_AX_read_data),
	.gv_AY_write_en (texture_mapper_orig_inst_gv_AY_write_en),
	.gv_AY_write_data (texture_mapper_orig_inst_gv_AY_write_data),
	.gv_AY_read_data (texture_mapper_orig_inst_gv_AY_read_data),
	.gv_BX_write_en (texture_mapper_orig_inst_gv_BX_write_en),
	.gv_BX_write_data (texture_mapper_orig_inst_gv_BX_write_data),
	.gv_BX_read_data (texture_mapper_orig_inst_gv_BX_read_data),
	.gv_BY_write_en (texture_mapper_orig_inst_gv_BY_write_en),
	.gv_BY_write_data (texture_mapper_orig_inst_gv_BY_write_data),
	.gv_BY_read_data (texture_mapper_orig_inst_gv_BY_read_data),
	.output_fifo (texture_mapper_orig_inst_output_fifo),
	.output_fifo_ready (texture_mapper_orig_inst_output_fifo_ready),
	.output_fifo_valid (texture_mapper_orig_inst_output_fifo_valid),
	.gv_DX1DY_write_en (texture_mapper_orig_inst_gv_DX1DY_write_en),
	.gv_DX1DY_write_data (texture_mapper_orig_inst_gv_DX1DY_write_data),
	.gv_DX1DY_read_data (texture_mapper_orig_inst_gv_DX1DY_read_data),
	.gv_DY1DY_write_en (texture_mapper_orig_inst_gv_DY1DY_write_en),
	.gv_DY1DY_write_data (texture_mapper_orig_inst_gv_DY1DY_write_data),
	.gv_DY1DY_read_data (texture_mapper_orig_inst_gv_DY1DY_read_data),
	.gv_DX2DY_write_en (texture_mapper_orig_inst_gv_DX2DY_write_en),
	.gv_DX2DY_write_data (texture_mapper_orig_inst_gv_DX2DY_write_data),
	.gv_DX2DY_read_data (texture_mapper_orig_inst_gv_DX2DY_read_data),
	.gv_DY2DY_write_en (texture_mapper_orig_inst_gv_DY2DY_write_en),
	.gv_DY2DY_write_data (texture_mapper_orig_inst_gv_DY2DY_write_data),
	.gv_DY2DY_read_data (texture_mapper_orig_inst_gv_DY2DY_read_data)
);



texture_mapper_hls_register gv_AX_inst (
	.clk (gv_AX_inst_clk),
	.reset (gv_AX_inst_reset),
	.write_en (gv_AX_inst_write_en),
	.read_data (gv_AX_inst_read_data),
	.write_data (gv_AX_inst_write_data)
);

defparam
	gv_AX_inst.width = 32,
	gv_AX_inst.init_value = 32'd0;


texture_mapper_hls_register gv_AY_inst (
	.clk (gv_AY_inst_clk),
	.reset (gv_AY_inst_reset),
	.write_en (gv_AY_inst_write_en),
	.read_data (gv_AY_inst_read_data),
	.write_data (gv_AY_inst_write_data)
);

defparam
	gv_AY_inst.width = 32,
	gv_AY_inst.init_value = 32'd0;


texture_mapper_hls_register gv_BX_inst (
	.clk (gv_BX_inst_clk),
	.reset (gv_BX_inst_reset),
	.write_en (gv_BX_inst_write_en),
	.read_data (gv_BX_inst_read_data),
	.write_data (gv_BX_inst_write_data)
);

defparam
	gv_BX_inst.width = 32,
	gv_BX_inst.init_value = 32'd0;


texture_mapper_hls_register gv_BY_inst (
	.clk (gv_BY_inst_clk),
	.reset (gv_BY_inst_reset),
	.write_en (gv_BY_inst_write_en),
	.read_data (gv_BY_inst_read_data),
	.write_data (gv_BY_inst_write_data)
);

defparam
	gv_BY_inst.width = 32,
	gv_BY_inst.init_value = 32'd0;


texture_mapper_hls_register gv_DX1DY_inst (
	.clk (gv_DX1DY_inst_clk),
	.reset (gv_DX1DY_inst_reset),
	.write_en (gv_DX1DY_inst_write_en),
	.read_data (gv_DX1DY_inst_read_data),
	.write_data (gv_DX1DY_inst_write_data)
);

defparam
	gv_DX1DY_inst.width = 32,
	gv_DX1DY_inst.init_value = 32'd0;


texture_mapper_hls_register gv_DY1DY_inst (
	.clk (gv_DY1DY_inst_clk),
	.reset (gv_DY1DY_inst_reset),
	.write_en (gv_DY1DY_inst_write_en),
	.read_data (gv_DY1DY_inst_read_data),
	.write_data (gv_DY1DY_inst_write_data)
);

defparam
	gv_DY1DY_inst.width = 32,
	gv_DY1DY_inst.init_value = 32'd0;


texture_mapper_hls_register gv_DX2DY_inst (
	.clk (gv_DX2DY_inst_clk),
	.reset (gv_DX2DY_inst_reset),
	.write_en (gv_DX2DY_inst_write_en),
	.read_data (gv_DX2DY_inst_read_data),
	.write_data (gv_DX2DY_inst_write_data)
);

defparam
	gv_DX2DY_inst.width = 32,
	gv_DX2DY_inst.init_value = 32'd0;


texture_mapper_hls_register gv_DY2DY_inst (
	.clk (gv_DY2DY_inst_clk),
	.reset (gv_DY2DY_inst_reset),
	.write_en (gv_DY2DY_inst_write_en),
	.read_data (gv_DY2DY_inst_read_data),
	.write_data (gv_DY2DY_inst_write_data)
);

defparam
	gv_DY2DY_inst.width = 32,
	gv_DY2DY_inst.init_value = 32'd0;


gv_read gv_read_inst (
	.clk (gv_read_inst_clk),
	.reset (gv_read_inst_reset),
	.start (gv_read_inst_start),
	.ready (gv_read_inst_ready),
	.finish (gv_read_inst_finish),
	.s_ar_addr (gv_read_inst_s_ar_addr),
	.axi_s_ar_ready (gv_read_inst_axi_s_ar_ready),
	.axi_s_ar_valid (gv_read_inst_axi_s_ar_valid),
	.s_ar_burst (gv_read_inst_s_ar_burst),
	.s_ar_size (gv_read_inst_s_ar_size),
	.s_ar_len (gv_read_inst_s_ar_len),
	.gv_AY_write_en (gv_read_inst_gv_AY_write_en),
	.gv_AY_write_data (gv_read_inst_gv_AY_write_data),
	.gv_AY_read_data (gv_read_inst_gv_AY_read_data),
	.gv_AX_write_en (gv_read_inst_gv_AX_write_en),
	.gv_AX_write_data (gv_read_inst_gv_AX_write_data),
	.gv_AX_read_data (gv_read_inst_gv_AX_read_data),
	.gv_BY_write_en (gv_read_inst_gv_BY_write_en),
	.gv_BY_write_data (gv_read_inst_gv_BY_write_data),
	.gv_BY_read_data (gv_read_inst_gv_BY_read_data),
	.gv_BX_write_en (gv_read_inst_gv_BX_write_en),
	.gv_BX_write_data (gv_read_inst_gv_BX_write_data),
	.gv_BX_read_data (gv_read_inst_gv_BX_read_data),
	.gv_DY1DY_write_en (gv_read_inst_gv_DY1DY_write_en),
	.gv_DY1DY_write_data (gv_read_inst_gv_DY1DY_write_data),
	.gv_DY1DY_read_data (gv_read_inst_gv_DY1DY_read_data),
	.gv_DX1DY_write_en (gv_read_inst_gv_DX1DY_write_en),
	.gv_DX1DY_write_data (gv_read_inst_gv_DX1DY_write_data),
	.gv_DX1DY_read_data (gv_read_inst_gv_DX1DY_read_data),
	.gv_DY2DY_write_en (gv_read_inst_gv_DY2DY_write_en),
	.gv_DY2DY_write_data (gv_read_inst_gv_DY2DY_write_data),
	.gv_DY2DY_read_data (gv_read_inst_gv_DY2DY_read_data),
	.gv_DX2DY_write_en (gv_read_inst_gv_DX2DY_write_en),
	.gv_DX2DY_write_data (gv_read_inst_gv_DX2DY_write_data),
	.gv_DX2DY_read_data (gv_read_inst_gv_DX2DY_read_data),
	.gv_ctrl_write_en (gv_read_inst_gv_ctrl_write_en),
	.gv_ctrl_write_data (gv_read_inst_gv_ctrl_write_data),
	.gv_ctrl_read_data (gv_read_inst_gv_ctrl_read_data),
	.s_r_data (gv_read_inst_s_r_data),
	.axi_s_r_ready (gv_read_inst_axi_s_r_ready),
	.axi_s_r_valid (gv_read_inst_axi_s_r_valid),
	.s_r_resp (gv_read_inst_s_r_resp),
	.s_r_last (gv_read_inst_s_r_last)
);



texture_mapper_hls_register gv_ctrl_inst (
	.clk (gv_ctrl_inst_clk),
	.reset (gv_ctrl_inst_reset),
	.write_en (gv_ctrl_inst_write_en),
	.read_data (gv_ctrl_inst_read_data),
	.write_data (gv_ctrl_inst_write_data)
);

defparam
	gv_ctrl_inst.width = 1,
	gv_ctrl_inst.init_value = 1'd0;


gv_write gv_write_inst (
	.clk (gv_write_inst_clk),
	.reset (gv_write_inst_reset),
	.start (gv_write_inst_start),
	.ready (gv_write_inst_ready),
	.finish (gv_write_inst_finish),
	.s_aw_addr (gv_write_inst_s_aw_addr),
	.axi_s_aw_ready (gv_write_inst_axi_s_aw_ready),
	.axi_s_aw_valid (gv_write_inst_axi_s_aw_valid),
	.s_w_data (gv_write_inst_s_w_data),
	.axi_s_w_ready (gv_write_inst_axi_s_w_ready),
	.axi_s_w_valid (gv_write_inst_axi_s_w_valid),
	.s_aw_burst (gv_write_inst_s_aw_burst),
	.s_aw_size (gv_write_inst_s_aw_size),
	.s_aw_len (gv_write_inst_s_aw_len),
	.s_w_strb (gv_write_inst_s_w_strb),
	.s_w_last (gv_write_inst_s_w_last),
	.gv_ctrl_write_en (gv_write_inst_gv_ctrl_write_en),
	.gv_ctrl_write_data (gv_write_inst_gv_ctrl_write_data),
	.gv_ctrl_read_data (gv_write_inst_gv_ctrl_read_data),
	.gv_AX_write_en (gv_write_inst_gv_AX_write_en),
	.gv_AX_write_data (gv_write_inst_gv_AX_write_data),
	.gv_AX_read_data (gv_write_inst_gv_AX_read_data),
	.gv_BX_write_en (gv_write_inst_gv_BX_write_en),
	.gv_BX_write_data (gv_write_inst_gv_BX_write_data),
	.gv_BX_read_data (gv_write_inst_gv_BX_read_data),
	.gv_DX1DY_write_en (gv_write_inst_gv_DX1DY_write_en),
	.gv_DX1DY_write_data (gv_write_inst_gv_DX1DY_write_data),
	.gv_DX1DY_read_data (gv_write_inst_gv_DX1DY_read_data),
	.gv_DX2DY_write_en (gv_write_inst_gv_DX2DY_write_en),
	.gv_DX2DY_write_data (gv_write_inst_gv_DX2DY_write_data),
	.gv_DX2DY_read_data (gv_write_inst_gv_DX2DY_read_data),
	.gv_AY_write_en (gv_write_inst_gv_AY_write_en),
	.gv_AY_write_data (gv_write_inst_gv_AY_write_data),
	.gv_AY_read_data (gv_write_inst_gv_AY_read_data),
	.gv_BY_write_en (gv_write_inst_gv_BY_write_en),
	.gv_BY_write_data (gv_write_inst_gv_BY_write_data),
	.gv_BY_read_data (gv_write_inst_gv_BY_read_data),
	.gv_DY1DY_write_en (gv_write_inst_gv_DY1DY_write_en),
	.gv_DY1DY_write_data (gv_write_inst_gv_DY1DY_write_data),
	.gv_DY1DY_read_data (gv_write_inst_gv_DY1DY_read_data),
	.gv_DY2DY_write_en (gv_write_inst_gv_DY2DY_write_en),
	.gv_DY2DY_write_data (gv_write_inst_gv_DY2DY_write_data),
	.gv_DY2DY_read_data (gv_write_inst_gv_DY2DY_read_data),
	.s_b_resp (gv_write_inst_s_b_resp),
	.s_b_resp_ready (gv_write_inst_s_b_resp_ready),
	.s_b_resp_valid (gv_write_inst_s_b_resp_valid)
);



always @(*) begin
	texture_mapper_inst_clk = clk;
end
always @(*) begin
	texture_mapper_inst_reset = reset;
end
always @(*) begin
	texture_mapper_inst_start = start;
end
always @(*) begin
	texture_mapper_inst_run_loop = run_loop;
end
always @(*) begin
	texture_mapper_inst_texture_mapper_orig_finish = (~(texture_mapper_orig_inst_start) & texture_mapper_orig_inst_finish_reg);
end
always @(*) begin
	texture_mapper_inst_texture_mapper_orig_ready = texture_mapper_orig_inst_ready;
end
always @(*) begin
	texture_mapper_inst_gv_read_finish = gv_read_inst_finish;
end
always @(*) begin
	texture_mapper_inst_gv_read_ready = gv_read_inst_ready;
end
always @(*) begin
	texture_mapper_inst_gv_write_finish = gv_write_inst_finish;
end
always @(*) begin
	texture_mapper_inst_gv_write_ready = gv_write_inst_ready;
end
always @(posedge clk) begin
	if ((reset | texture_mapper_inst_start)) begin
		texture_mapper_inst_finish_reg <= 1'd0;
	end
	if (texture_mapper_inst_finish) begin
		texture_mapper_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	texture_mapper_orig_inst_clk = clk;
end
always @(*) begin
	texture_mapper_orig_inst_reset = reset;
end
always @(*) begin
	texture_mapper_orig_inst_start = (start | gv_write_inst_gv_ctrl_write_en);
end
always @(*) begin
	texture_mapper_orig_inst_run_loop = texture_mapper_inst_texture_mapper_orig_run_loop;
end
always @(*) begin
	texture_mapper_orig_inst_gv_AX_read_data = gv_AX_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_gv_AY_read_data = gv_AY_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_gv_BX_read_data = gv_BX_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_gv_BY_read_data = gv_BY_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_output_fifo_ready = output_fifo_ready;
end
always @(*) begin
	texture_mapper_orig_inst_gv_DX1DY_read_data = gv_DX1DY_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_gv_DY1DY_read_data = gv_DY1DY_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_gv_DX2DY_read_data = gv_DX2DY_inst_read_data;
end
always @(*) begin
	texture_mapper_orig_inst_gv_DY2DY_read_data = gv_DY2DY_inst_read_data;
end
always @(posedge clk) begin
	if ((reset | texture_mapper_orig_inst_start)) begin
		texture_mapper_orig_inst_finish_reg <= 1'd0;
	end
	if (texture_mapper_orig_inst_finish) begin
		texture_mapper_orig_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	gv_AX_inst_clk = clk;
end
always @(*) begin
	gv_AX_inst_reset = reset;
end
always @(*) begin
	gv_AX_inst_write_en = ((texture_mapper_orig_inst_gv_AX_write_en | gv_read_inst_gv_AX_write_en) | gv_write_inst_gv_AX_write_en);
end
always @(*) begin
	gv_AX_inst_write_data = ((texture_mapper_orig_inst_gv_AX_write_data | gv_read_inst_gv_AX_write_data) | gv_write_inst_gv_AX_write_data);
end
always @(*) begin
	gv_AY_inst_clk = clk;
end
always @(*) begin
	gv_AY_inst_reset = reset;
end
always @(*) begin
	gv_AY_inst_write_en = ((texture_mapper_orig_inst_gv_AY_write_en | gv_read_inst_gv_AY_write_en) | gv_write_inst_gv_AY_write_en);
end
always @(*) begin
	gv_AY_inst_write_data = ((texture_mapper_orig_inst_gv_AY_write_data | gv_read_inst_gv_AY_write_data) | gv_write_inst_gv_AY_write_data);
end
always @(*) begin
	gv_BX_inst_clk = clk;
end
always @(*) begin
	gv_BX_inst_reset = reset;
end
always @(*) begin
	gv_BX_inst_write_en = ((texture_mapper_orig_inst_gv_BX_write_en | gv_read_inst_gv_BX_write_en) | gv_write_inst_gv_BX_write_en);
end
always @(*) begin
	gv_BX_inst_write_data = ((texture_mapper_orig_inst_gv_BX_write_data | gv_read_inst_gv_BX_write_data) | gv_write_inst_gv_BX_write_data);
end
always @(*) begin
	gv_BY_inst_clk = clk;
end
always @(*) begin
	gv_BY_inst_reset = reset;
end
always @(*) begin
	gv_BY_inst_write_en = ((texture_mapper_orig_inst_gv_BY_write_en | gv_read_inst_gv_BY_write_en) | gv_write_inst_gv_BY_write_en);
end
always @(*) begin
	gv_BY_inst_write_data = ((texture_mapper_orig_inst_gv_BY_write_data | gv_read_inst_gv_BY_write_data) | gv_write_inst_gv_BY_write_data);
end
always @(*) begin
	gv_DX1DY_inst_clk = clk;
end
always @(*) begin
	gv_DX1DY_inst_reset = reset;
end
always @(*) begin
	gv_DX1DY_inst_write_en = ((texture_mapper_orig_inst_gv_DX1DY_write_en | gv_read_inst_gv_DX1DY_write_en) | gv_write_inst_gv_DX1DY_write_en);
end
always @(*) begin
	gv_DX1DY_inst_write_data = ((texture_mapper_orig_inst_gv_DX1DY_write_data | gv_read_inst_gv_DX1DY_write_data) | gv_write_inst_gv_DX1DY_write_data);
end
always @(*) begin
	gv_DY1DY_inst_clk = clk;
end
always @(*) begin
	gv_DY1DY_inst_reset = reset;
end
always @(*) begin
	gv_DY1DY_inst_write_en = ((texture_mapper_orig_inst_gv_DY1DY_write_en | gv_read_inst_gv_DY1DY_write_en) | gv_write_inst_gv_DY1DY_write_en);
end
always @(*) begin
	gv_DY1DY_inst_write_data = ((texture_mapper_orig_inst_gv_DY1DY_write_data | gv_read_inst_gv_DY1DY_write_data) | gv_write_inst_gv_DY1DY_write_data);
end
always @(*) begin
	gv_DX2DY_inst_clk = clk;
end
always @(*) begin
	gv_DX2DY_inst_reset = reset;
end
always @(*) begin
	gv_DX2DY_inst_write_en = ((texture_mapper_orig_inst_gv_DX2DY_write_en | gv_read_inst_gv_DX2DY_write_en) | gv_write_inst_gv_DX2DY_write_en);
end
always @(*) begin
	gv_DX2DY_inst_write_data = ((texture_mapper_orig_inst_gv_DX2DY_write_data | gv_read_inst_gv_DX2DY_write_data) | gv_write_inst_gv_DX2DY_write_data);
end
always @(*) begin
	gv_DY2DY_inst_clk = clk;
end
always @(*) begin
	gv_DY2DY_inst_reset = reset;
end
always @(*) begin
	gv_DY2DY_inst_write_en = ((texture_mapper_orig_inst_gv_DY2DY_write_en | gv_read_inst_gv_DY2DY_write_en) | gv_write_inst_gv_DY2DY_write_en);
end
always @(*) begin
	gv_DY2DY_inst_write_data = ((texture_mapper_orig_inst_gv_DY2DY_write_data | gv_read_inst_gv_DY2DY_write_data) | gv_write_inst_gv_DY2DY_write_data);
end
always @(*) begin
	gv_read_inst_clk = clk;
end
always @(*) begin
	gv_read_inst_reset = reset;
end
always @(*) begin
	gv_read_inst_start = texture_mapper_inst_gv_read_start;
end
always @(*) begin
	gv_read_inst_s_ar_addr = axi_s_ar_addr;
end
always @(*) begin
	gv_read_inst_axi_s_ar_valid = axi_s_ar_valid;
end
always @(*) begin
	gv_read_inst_s_ar_burst = axi_s_ar_burst;
end
always @(*) begin
	gv_read_inst_s_ar_size = axi_s_ar_size;
end
always @(*) begin
	gv_read_inst_s_ar_len = axi_s_ar_len;
end
always @(*) begin
	gv_read_inst_gv_AY_read_data = gv_AY_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_AX_read_data = gv_AX_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_BY_read_data = gv_BY_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_BX_read_data = gv_BX_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_DY1DY_read_data = gv_DY1DY_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_DX1DY_read_data = gv_DX1DY_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_DY2DY_read_data = gv_DY2DY_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_DX2DY_read_data = gv_DX2DY_inst_read_data;
end
always @(*) begin
	gv_read_inst_gv_ctrl_read_data = gv_ctrl_inst_read_data;
end
always @(*) begin
	gv_read_inst_axi_s_r_ready = axi_s_r_ready;
end
always @(posedge clk) begin
	if ((reset | gv_read_inst_start)) begin
		gv_read_inst_finish_reg <= 1'd0;
	end
	if (gv_read_inst_finish) begin
		gv_read_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	gv_ctrl_inst_clk = clk;
end
always @(*) begin
	gv_ctrl_inst_reset = ((reset | gv_write_inst_gv_ctrl_write_en) | start);
end
always @(*) begin
	gv_ctrl_inst_write_en = texture_mapper_orig_inst_finish;
end
assign gv_ctrl_inst_write_data = 1'd1;
always @(*) begin
	gv_write_inst_clk = clk;
end
always @(*) begin
	gv_write_inst_reset = reset;
end
always @(*) begin
	gv_write_inst_start = texture_mapper_inst_gv_write_start;
end
always @(*) begin
	gv_write_inst_s_aw_addr = axi_s_aw_addr;
end
always @(*) begin
	gv_write_inst_axi_s_aw_valid = axi_s_aw_valid;
end
always @(*) begin
	gv_write_inst_s_w_data = axi_s_w_data;
end
always @(*) begin
	gv_write_inst_axi_s_w_valid = axi_s_w_valid;
end
always @(*) begin
	gv_write_inst_s_aw_burst = axi_s_aw_burst;
end
always @(*) begin
	gv_write_inst_s_aw_size = axi_s_aw_size;
end
always @(*) begin
	gv_write_inst_s_aw_len = axi_s_aw_len;
end
always @(*) begin
	gv_write_inst_s_w_strb = axi_s_w_strb;
end
always @(*) begin
	gv_write_inst_s_w_last = axi_s_w_last;
end
always @(*) begin
	gv_write_inst_gv_AX_read_data = gv_AX_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_BX_read_data = gv_BX_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_DX1DY_read_data = gv_DX1DY_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_DX2DY_read_data = gv_DX2DY_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_AY_read_data = gv_AY_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_BY_read_data = gv_BY_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_DY1DY_read_data = gv_DY1DY_inst_read_data;
end
always @(*) begin
	gv_write_inst_gv_DY2DY_read_data = gv_DY2DY_inst_read_data;
end
always @(*) begin
	gv_write_inst_s_b_resp_ready = axi_s_b_resp_ready;
end
always @(posedge clk) begin
	if ((reset | gv_write_inst_start)) begin
		gv_write_inst_finish_reg <= 1'd0;
	end
	if (gv_write_inst_finish) begin
		gv_write_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = texture_mapper_inst_ready;
end
always @(*) begin
	finish = texture_mapper_inst_finish;
end
always @(*) begin
	run_done_write_en = texture_mapper_orig_inst_run_done_write_en;
end
always @(*) begin
	run_done_write_data = texture_mapper_orig_inst_run_done_write_data;
end
always @(*) begin
	output_fifo = texture_mapper_orig_inst_output_fifo;
end
always @(*) begin
	output_fifo_valid = texture_mapper_orig_inst_output_fifo_valid;
end
always @(*) begin
	axi_s_aw_ready = gv_write_inst_axi_s_aw_ready;
end
always @(*) begin
	axi_s_w_ready = gv_write_inst_axi_s_w_ready;
end
always @(*) begin
	axi_s_b_resp = gv_write_inst_s_b_resp;
end
always @(*) begin
	axi_s_b_resp_valid = gv_write_inst_s_b_resp_valid;
end
always @(*) begin
	axi_s_ar_ready = gv_read_inst_axi_s_ar_ready;
end
always @(*) begin
	axi_s_r_data = gv_read_inst_s_r_data;
end
always @(*) begin
	axi_s_r_valid = gv_read_inst_axi_s_r_valid;
end
always @(*) begin
	axi_s_r_resp = gv_read_inst_s_r_resp;
end
always @(*) begin
	axi_s_r_last = gv_read_inst_s_r_last;
end

endmodule
`timescale 1 ns / 1 ns
module texture_mapper
(
	clk,
	reset,
	start,
	ready,
	finish,
	run_loop,
	texture_mapper_orig_start,
	texture_mapper_orig_finish,
	texture_mapper_orig_ready,
	texture_mapper_orig_run_loop,
	gv_read_start,
	gv_read_finish,
	gv_read_ready,
	gv_write_start,
	gv_write_finish,
	gv_write_ready
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_texture_mapper_BB_entry_1 = 3'd1;
parameter [2:0] LEGUP_F_texture_mapper_BB_entry_3 = 3'd3;
parameter [2:0] LEGUP_F_texture_mapper_BB_entry_5 = 3'd5;
parameter [2:0] LEGUP_F_texture_mapper_BB_entry_7 = 3'd7;
parameter [2:0] LEGUP_function_call_2 = 3'd2;
parameter [2:0] LEGUP_function_call_4 = 3'd4;
parameter [2:0] LEGUP_function_call_6 = 3'd6;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] run_loop;
output reg  texture_mapper_orig_start;
input  texture_mapper_orig_finish;
input  texture_mapper_orig_ready;
output reg [7:0] texture_mapper_orig_run_loop;
output reg  gv_read_start;
input  gv_read_finish;
input  gv_read_ready;
output reg  gv_write_start;
input  gv_write_finish;
input  gv_write_ready;
reg [2:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [2:0] next_state;
reg [7:0] run_loop_reg;
wire  fsm_stall;
reg  pipeline_wrapper_init_started;
reg  start_initialization;


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
	if ((fsm_stall == 1'd0) && (start_initialization == 1'd1))
		next_state = LEGUP_F_texture_mapper_BB_entry_1;
LEGUP_F_texture_mapper_BB_entry_1:
		next_state = LEGUP_function_call_2;
LEGUP_F_texture_mapper_BB_entry_3:
		next_state = LEGUP_function_call_4;
LEGUP_F_texture_mapper_BB_entry_5:
		next_state = LEGUP_function_call_6;
LEGUP_F_texture_mapper_BB_entry_7:
		next_state = LEGUP_0;
LEGUP_function_call_2:
	if ((fsm_stall == 1'd0) && (texture_mapper_orig_finish == 1'd1))
		next_state = LEGUP_F_texture_mapper_BB_entry_3;
LEGUP_function_call_4:
		next_state = LEGUP_F_texture_mapper_BB_entry_5;
LEGUP_function_call_6:
		next_state = LEGUP_F_texture_mapper_BB_entry_7;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	run_loop_reg = run_loop;
end
assign fsm_stall = 1'd0;
always @(posedge clk) begin
	if (reset) begin
		pipeline_wrapper_init_started <= 1'd0;
	end
	if ((cur_state != LEGUP_0)) begin
		pipeline_wrapper_init_started <= 1'd1;
	end
end
always @(*) begin
	start_initialization = (start & ~(pipeline_wrapper_init_started));
end
always @(*) begin
	ready = texture_mapper_orig_ready;
end
always @(posedge clk) begin
	finish <= texture_mapper_orig_finish;
end
always @(*) begin
	if (reset) begin
		texture_mapper_orig_start = 1'd0;
	end
	else if ((cur_state == LEGUP_F_texture_mapper_BB_entry_1)) begin
		texture_mapper_orig_start = 1'd1;
	end
	else /* if (((cur_state == LEGUP_function_call_2) & ~(fsm_stall))) */ begin
		texture_mapper_orig_start = 1'd0;
	end
end
always @(*) begin
	texture_mapper_orig_run_loop = run_loop_reg;
end
always @(*) begin
	gv_read_start = 1'd1;
	if (reset) begin
		gv_read_start = 1'd0;
	end
end
always @(*) begin
	gv_write_start = 1'd1;
	if (reset) begin
		gv_write_start = 1'd0;
	end
end

endmodule
`timescale 1 ns / 1 ns
module texture_mapper_orig
(
	clk,
	reset,
	start,
	ready,
	finish,
	run_loop,
	run_done_write_en,
	run_done_write_data,
	gv_AX_write_en,
	gv_AX_write_data,
	gv_AX_read_data,
	gv_AY_write_en,
	gv_AY_write_data,
	gv_AY_read_data,
	gv_BX_write_en,
	gv_BX_write_data,
	gv_BX_read_data,
	gv_BY_write_en,
	gv_BY_write_data,
	gv_BY_read_data,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid,
	gv_DX1DY_write_en,
	gv_DX1DY_write_data,
	gv_DX1DY_read_data,
	gv_DY1DY_write_en,
	gv_DY1DY_write_data,
	gv_DY1DY_read_data,
	gv_DX2DY_write_en,
	gv_DX2DY_write_data,
	gv_DX2DY_read_data,
	gv_DY2DY_write_en,
	gv_DY2DY_write_data,
	gv_DY2DY_read_data
);

parameter [5:0] LEGUP_0 = 6'd0;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_entry_1 = 6'd1;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_entry_2 = 6'd2;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_3 = 6'd3;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_4 = 6'd4;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_5 = 6'd5;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_6 = 6'd6;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_7 = 6'd7;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_8 = 6'd8;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_9 = 6'd9;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_10 = 6'd10;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_11 = 6'd11;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_12 = 6'd12;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_13 = 6'd13;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_14 = 6'd14;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_15 = 6'd15;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_16 = 6'd16;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_17 = 6'd17;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_18 = 6'd18;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_19 = 6'd19;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_20 = 6'd20;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_21 = 6'd21;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_22 = 6'd22;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_23 = 6'd23;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_24 = 6'd24;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_25 = 6'd25;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_26 = 6'd26;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_27 = 6'd27;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_28 = 6'd28;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_29 = 6'd29;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_30 = 6'd30;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_31 = 6'd31;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_32 = 6'd32;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_33 = 6'd33;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_34 = 6'd34;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_35 = 6'd35;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_36 = 6'd36;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_37 = 6'd37;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_then_38 = 6'd38;
parameter [5:0] LEGUP_pipeline_wait_for_loop_texture_mapper_cpp_102_9_39 = 6'd39;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_for_end_40 = 6'd40;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_for_end_41 = 6'd41;
parameter [5:0] LEGUP_F_texture_mapper_orig_BB_if_end_42 = 6'd42;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] run_loop;
output reg  run_done_write_en;
output reg [7:0] run_done_write_data;
output reg  gv_AX_write_en;
output reg [31:0] gv_AX_write_data;
input [31:0] gv_AX_read_data;
output reg  gv_AY_write_en;
output reg [31:0] gv_AY_write_data;
input [31:0] gv_AY_read_data;
output reg  gv_BX_write_en;
output reg [31:0] gv_BX_write_data;
input [31:0] gv_BX_read_data;
output reg  gv_BY_write_en;
output reg [31:0] gv_BY_write_data;
input [31:0] gv_BY_read_data;
output reg [63:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
output  gv_DX1DY_write_en;
output [31:0] gv_DX1DY_write_data;
input [31:0] gv_DX1DY_read_data;
output  gv_DY1DY_write_en;
output [31:0] gv_DY1DY_write_data;
input [31:0] gv_DY1DY_read_data;
output  gv_DX2DY_write_en;
output [31:0] gv_DX2DY_write_data;
input [31:0] gv_DX2DY_read_data;
output  gv_DY2DY_write_en;
output [31:0] gv_DY2DY_write_data;
input [31:0] gv_DY2DY_read_data;
reg [5:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [5:0] next_state;
reg [7:0] run_loop_reg;
wire  fsm_stall;
reg  texture_mapper_orig_entry_cmp;
reg  texture_mapper_orig_entry_cmp_reg;
reg [31:0] texture_mapper_orig_if_then_0;
reg [31:0] texture_mapper_orig_if_then_0_reg;
reg [31:0] texture_mapper_orig_if_then_1;
reg [31:0] texture_mapper_orig_if_then_1_reg;
reg [31:0] texture_mapper_orig_if_then_2;
reg [31:0] texture_mapper_orig_if_then_2_reg;
reg [31:0] texture_mapper_orig_if_then_3;
reg [31:0] texture_mapper_orig_if_then_3_reg;
reg [31:0] texture_mapper_orig_if_then_sub;
reg [31:0] texture_mapper_orig_if_then_div;
reg [30:0] texture_mapper_orig_if_then_bit_select104;
reg [29:0] texture_mapper_orig_if_then_bit_select102;
reg [28:0] texture_mapper_orig_if_then_bit_select100;
reg [31:0] texture_mapper_orig_if_then_sub1;
reg [31:0] texture_mapper_orig_if_then_sub1_reg;
reg [31:0] texture_mapper_orig_if_then_div2;
reg [30:0] texture_mapper_orig_if_then_bit_select93;
reg [29:0] texture_mapper_orig_if_then_bit_select91;
reg [28:0] texture_mapper_orig_if_then_bit_select89;
reg [31:0] texture_mapper_orig_if_then_4;
reg [31:0] texture_mapper_orig_if_then_4_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat110;
reg [31:0] texture_mapper_orig_if_then_bit_concat110_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat109;
reg [31:0] texture_mapper_orig_if_then_5;
reg [31:0] texture_mapper_orig_if_then_5_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat108;
reg [31:0] texture_mapper_orig_if_then_sr_add;
reg [31:0] texture_mapper_orig_if_then_6;
reg [31:0] texture_mapper_orig_if_then_6_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat107;
reg [31:0] texture_mapper_orig_if_then_7;
reg [31:0] texture_mapper_orig_if_then_7_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat106;
reg [31:0] texture_mapper_orig_if_then_sr_add2;
reg [31:0] texture_mapper_orig_if_then_8;
reg [31:0] texture_mapper_orig_if_then_8_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat105;
reg [31:0] texture_mapper_orig_if_then_bit_concat103;
reg [31:0] texture_mapper_orig_if_then_sr_add5;
reg [31:0] texture_mapper_orig_if_then_9;
reg [31:0] texture_mapper_orig_if_then_9_reg;
reg [31:0] texture_mapper_orig_if_then_sr_negate;
reg [31:0] texture_mapper_orig_if_then_bit_concat101;
reg [31:0] texture_mapper_orig_if_then_sr_add7;
reg [31:0] texture_mapper_orig_if_then_sr_add7_reg;
reg [31:0] texture_mapper_orig_if_then_10;
reg [31:0] texture_mapper_orig_if_then_10_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat99;
reg [31:0] texture_mapper_orig_if_then_bit_concat99_reg;
reg [31:0] texture_mapper_orig_if_then_11;
reg [31:0] texture_mapper_orig_if_then_11_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat98;
reg [31:0] texture_mapper_orig_if_then_12;
reg [31:0] texture_mapper_orig_if_then_12_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat97;
reg [31:0] texture_mapper_orig_if_then_sr_add9;
reg [31:0] texture_mapper_orig_if_then_13;
reg [31:0] texture_mapper_orig_if_then_13_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat96;
reg [31:0] texture_mapper_orig_if_then_14;
reg [31:0] texture_mapper_orig_if_then_14_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat95;
reg [31:0] texture_mapper_orig_if_then_sr_add11;
reg [31:0] texture_mapper_orig_if_then_15;
reg [31:0] texture_mapper_orig_if_then_15_reg;
reg [31:0] texture_mapper_orig_if_then_bit_concat94;
reg [31:0] texture_mapper_orig_if_then_bit_concat92;
reg [31:0] texture_mapper_orig_if_then_sr_add14;
reg [31:0] texture_mapper_orig_if_then_16;
reg [31:0] texture_mapper_orig_if_then_16_reg;
reg [31:0] texture_mapper_orig_if_then_sr_negate15;
reg [31:0] texture_mapper_orig_if_then_bit_concat90;
reg [31:0] texture_mapper_orig_if_then_sr_add17;
reg [31:0] texture_mapper_orig_if_then_sr_add17_reg;
reg [31:0] texture_mapper_orig_if_then_17;
reg [31:0] texture_mapper_orig_if_then_17_reg;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_18;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_cx_0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select87;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select79;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_19;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select77;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select69;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_20;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select67;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select59;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_21;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select57;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select49;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_22;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select47;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select39;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_23;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select37;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select29;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_24;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select27;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select19;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_25;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select17;
reg [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select9;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_26;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_cy_0;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select86;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_27;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select76;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_28;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select66;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_29;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select56;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_30;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select46;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_31;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select36;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_32;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select26;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_33;
reg [8:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select16;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat88;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_34;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat85;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat84;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select82;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat83;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat81;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_35;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat80;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_36;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_37;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat78;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i129;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_38;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat75;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat74;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select72;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat73;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition2;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat71;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_39;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i138;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select8;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat70;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_40;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_41;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat68;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i109;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_42;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat65;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat64;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select62;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat63;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition5;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat61;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_43;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i118;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select13;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat60;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_44;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_45;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select2;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat58;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i89;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_46;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat55;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat54;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select52;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat53;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition10;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat51;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_47;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i98;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select18;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat50;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_48;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_49;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select3;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat48;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i69;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_50;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat45;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat44;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select42;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat43;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition15;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat41;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_51;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i78;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select23;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat40;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_52;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_53;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select4;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat38;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i49;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_54;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat35;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat34;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select32;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat33;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition20;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat31;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_55;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i58;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select28;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat30;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_56;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_57;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select5;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat28;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i29;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_58;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat25;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat24;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select22;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat23;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition25;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat21;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_59;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i38;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select33;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat20;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_60;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_61;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select6;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat18;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i9;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_62;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat15;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat14;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select12;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat13;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition30;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat11;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_63;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i18;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_select38;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat10;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_64;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select7;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat8;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_65;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_66;
reg [31:0] texture_mapper_orig_for_end_68;
reg [31:0] texture_mapper_orig_for_end_add;
reg [31:0] texture_mapper_orig_for_end_69;
reg [31:0] texture_mapper_orig_for_end_add111;
reg [31:0] texture_mapper_orig_for_end_70;
reg [31:0] texture_mapper_orig_for_end_add112;
reg [31:0] texture_mapper_orig_for_end_71;
reg [31:0] texture_mapper_orig_for_end_add113;
reg  texture_frame_clken;
reg [14:0] texture_frame_address_a;
wire  texture_frame_write_en_a;
wire [63:0] texture_frame_write_data_a;
wire [63:0] texture_frame_read_data_a;
reg  texture_frame_read_en_a;
reg [14:0] texture_frame_address_b;
wire  texture_frame_write_en_b;
wire [63:0] texture_frame_write_data_b;
wire [63:0] texture_frame_read_data_b;
reg  texture_frame_read_en_b;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_0;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_0;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_0;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_0;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_1;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_1;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_1;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_1;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_2;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_2;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_2;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_2;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_3;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_3;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_3;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_3;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_4;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_4;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_4;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_4;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_5;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_5;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_5;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_5;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_6;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_6;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_6;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_6;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_7;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_7;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_7;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_7;
reg  for_loop_texture_mapper_cpp_102_9_valid_bit_8;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_8;
reg  for_loop_texture_mapper_cpp_102_9_state_enable_8;
reg  for_loop_texture_mapper_cpp_102_9_state_stall_reg_8;
reg [3:0] for_loop_texture_mapper_cpp_102_9_II_counter;
reg  for_loop_texture_mapper_cpp_102_9_start;
reg  for_loop_texture_mapper_cpp_102_9_activate_pipeline;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat88_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_35_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_36_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat78_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition2_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_39_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i138_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_40_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select1_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat68_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i109_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition5_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_43_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i118_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select2_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat58_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i89_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition10_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_47_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i98_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select3_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat48_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i69_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition15_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_51_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i78_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select23_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select4_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat38_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i49_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition20_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_55_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i58_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select28_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select5_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat28_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i29_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition25_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_59_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i38_reg_stage1;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_select33_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_reg_stage1;
reg [14:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat18_reg_stage0;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i9_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_reg_stage0;
reg [6:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_reg_stage0;
reg  texture_mapper_orig_IXT_EEEjj_exit_NotCondition30_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_63_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_phitmp_i18_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_select38_reg_stage1;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_reg_stage0;
reg [5:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_reg_stage1;
reg [7:0] texture_mapper_orig_IXT_EEEjj_exit_65_reg_stage2;
reg [63:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat_reg_stage2;
reg [31:0] for_loop_texture_mapper_cpp_102_9_inductionVar_stage0;
reg  for_loop_texture_mapper_cpp_102_9_pipeline_exit_cond;
reg  for_loop_texture_mapper_cpp_102_9_active;
reg  for_loop_texture_mapper_cpp_102_9_begin_pipeline;
reg  for_loop_texture_mapper_cpp_102_9_epilogue;
reg  for_loop_texture_mapper_cpp_102_9_pipeline_finish;
reg  for_loop_texture_mapper_cpp_102_9_pipeline_finishing;
reg  for_loop_texture_mapper_cpp_102_9_only_last_stage_enabled;
reg [3:0] for_loop_texture_mapper_cpp_102_9_num_active_iterations;
reg  for_loop_texture_mapper_cpp_102_9_inserting_new_iteration;
reg  for_loop_texture_mapper_cpp_102_9_pipeline_finish_reg;
reg [31:0] texture_mapper_orig_signed_divide_32_0_op0;
reg [11:0] texture_mapper_orig_signed_divide_32_0_op1;
reg  texture_mapper_orig_signed_divide_32_0_inst_clock;
reg  texture_mapper_orig_signed_divide_32_0_inst_aclr;
reg  texture_mapper_orig_signed_divide_32_0_inst_clken;
reg [31:0] texture_mapper_orig_signed_divide_32_0_inst_numer;
reg [31:0] texture_mapper_orig_signed_divide_32_0_inst_denom;
wire [31:0] texture_mapper_orig_signed_divide_32_0_inst_quotient;
wire [31:0] texture_mapper_orig_signed_divide_32_0_inst_remain;
reg [31:0] divide_texture_mapper_orig_if_then_div_temp_out;
reg  texture_mapper_orig_signed_divide_32_0_clken;
reg [31:0] divide_texture_mapper_orig_if_then_div_out;
reg [31:0] texture_mapper_orig_signed_divide_32_0;
reg  texture_mapper_orig_signed_divide_32_0_clken_sequential_cond;
wire [2:0] texture_mapper_orig_if_then_bit_concat110_bit_select_operand_2;
wire  texture_mapper_orig_if_then_bit_concat109_bit_select_operand_2;
wire  texture_mapper_orig_if_then_bit_concat108_bit_select_operand_2;
wire [1:0] texture_mapper_orig_if_then_bit_concat107_bit_select_operand_2;
wire [1:0] texture_mapper_orig_if_then_bit_concat106_bit_select_operand_2;
wire  texture_mapper_orig_if_then_bit_concat105_bit_select_operand_2;
wire [1:0] texture_mapper_orig_if_then_bit_concat103_bit_select_operand_2;
wire [2:0] texture_mapper_orig_if_then_bit_concat101_bit_select_operand_2;
wire [2:0] texture_mapper_orig_if_then_bit_concat99_bit_select_operand_2;
wire  texture_mapper_orig_if_then_bit_concat98_bit_select_operand_2;
wire  texture_mapper_orig_if_then_bit_concat97_bit_select_operand_2;
wire [1:0] texture_mapper_orig_if_then_bit_concat96_bit_select_operand_2;
wire [1:0] texture_mapper_orig_if_then_bit_concat95_bit_select_operand_2;
wire  texture_mapper_orig_if_then_bit_concat94_bit_select_operand_2;
wire [1:0] texture_mapper_orig_if_then_bit_concat92_bit_select_operand_2;
wire [2:0] texture_mapper_orig_if_then_bit_concat90_bit_select_operand_2;
reg  legup_mult_unsigned_32_32_2_0_clock;
reg  legup_mult_unsigned_32_32_2_0_aclr;
wire  legup_mult_unsigned_32_32_2_0_clken;
reg [31:0] legup_mult_unsigned_32_32_2_0_dataa;
reg [31:0] legup_mult_unsigned_32_32_2_0_datab;
wire [31:0] legup_mult_unsigned_32_32_2_0_result;
reg [31:0] legup_mult_texture_mapper_orig_IXT_EEEjj_exit_18_out;
reg  legup_mult_unsigned_32_32_2_1_clock;
reg  legup_mult_unsigned_32_32_2_1_aclr;
wire  legup_mult_unsigned_32_32_2_1_clken;
reg [31:0] legup_mult_unsigned_32_32_2_1_dataa;
reg [31:0] legup_mult_unsigned_32_32_2_1_datab;
wire [31:0] legup_mult_unsigned_32_32_2_1_result;
reg [31:0] legup_mult_texture_mapper_orig_IXT_EEEjj_exit_26_out;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat88_bit_select_operand_0;
reg [63:0] texture_frame_read_data_wire_a;
reg  texture_frame_clken_pipeline_cond;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat85_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat85_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select82_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat81_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat78_bit_select_operand_0;
reg [63:0] texture_frame_read_data_wire_b;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat75_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat75_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select72_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat71_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat68_bit_select_operand_0;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat65_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat65_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select62_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat61_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat58_bit_select_operand_0;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat55_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat55_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select52_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat51_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat48_bit_select_operand_0;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat45_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat45_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select42_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat41_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat38_bit_select_operand_0;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat35_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat35_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select32_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat31_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat28_bit_select_operand_0;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat25_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat25_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select22_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat21_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_bit_select_operand_4;
wire [16:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat18_bit_select_operand_0;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat15_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat15_bit_select_operand_4;
wire [25:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_bit_select_operand_4;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14_width_extended;
reg [30:0] texture_mapper_orig_IXT_EEEjj_exit_bit_select12_width_extended;
wire  texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_bit_select_operand_2;
wire [31:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat11_bit_select_operand_0;
reg [31:0] texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16_width_extended;
wire [57:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_bit_select_operand_0;
wire [2:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_bit_select_operand_4;
wire [55:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat8_bit_select_operand_0;
wire [7:0] texture_mapper_orig_IXT_EEEjj_exit_bit_concat_bit_select_operand_14;
reg  output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_not_accessed_due_to_stall_a;
reg  output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_stalln_reg;
reg  output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_enable_cond_a;
reg  legup_mult_unsigned_32_32_2_0_receiver_clk;
reg  legup_mult_unsigned_32_32_2_0_receiver_reset;
reg  legup_mult_unsigned_32_32_2_0_receiver_op_start;
reg  legup_mult_unsigned_32_32_2_0_receiver_user_enable;
reg [31:0] legup_mult_unsigned_32_32_2_0_receiver_data_in;
wire [31:0] legup_mult_unsigned_32_32_2_0_receiver_data_out;
reg [31:0] legup_mult_unsigned_32_32_2_0_receiver_in;
reg  legup_mult_unsigned_32_32_2_1_receiver_clk;
reg  legup_mult_unsigned_32_32_2_1_receiver_reset;
reg  legup_mult_unsigned_32_32_2_1_receiver_op_start;
reg  legup_mult_unsigned_32_32_2_1_receiver_user_enable;
reg [31:0] legup_mult_unsigned_32_32_2_1_receiver_data_in;
wire [31:0] legup_mult_unsigned_32_32_2_1_receiver_data_out;
reg [31:0] legup_mult_unsigned_32_32_2_1_receiver_in;

/*   %div = sdiv i32 %sub, 640, !dbg !7460, !MSB !7453, !LSB !7445, !extendFrom !7453*/
texture_mapper_legup_divider texture_mapper_orig_signed_divide_32_0_inst (
	.clock (texture_mapper_orig_signed_divide_32_0_inst_clock),
	.aclr (texture_mapper_orig_signed_divide_32_0_inst_aclr),
	.clken (texture_mapper_orig_signed_divide_32_0_inst_clken),
	.numer (texture_mapper_orig_signed_divide_32_0_inst_numer),
	.denom (texture_mapper_orig_signed_divide_32_0_inst_denom),
	.quotient (texture_mapper_orig_signed_divide_32_0_inst_quotient),
	.remain (texture_mapper_orig_signed_divide_32_0_inst_remain)
);

defparam
	texture_mapper_orig_signed_divide_32_0_inst.stages = 32,
	texture_mapper_orig_signed_divide_32_0_inst.width_n = 32,
	texture_mapper_orig_signed_divide_32_0_inst.width_d = 32,
	texture_mapper_orig_signed_divide_32_0_inst.is_signed = 1;

/*   %18 = mul i32 %bit_concat110, %indvar, !MSB !7453, !LSB !7469, !extendFrom !7453, !legup.pipeline.start_time !7445, !legup.pipeline.avail_time !7471, !legup.pipeline.stage !7445*/
texture_mapper_legup_mult legup_mult_unsigned_32_32_2_0 (
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

/*   %26 = mul i32 %bit_concat99, %indvar, !MSB !7453, !LSB !7469, !extendFrom !7453, !legup.pipeline.start_time !7445, !legup.pipeline.avail_time !7471, !legup.pipeline.stage !7445*/
texture_mapper_legup_mult legup_mult_unsigned_32_32_2_1 (
	.clock (legup_mult_unsigned_32_32_2_1_clock),
	.aclr (legup_mult_unsigned_32_32_2_1_aclr),
	.clken (legup_mult_unsigned_32_32_2_1_clken),
	.dataa (legup_mult_unsigned_32_32_2_1_dataa),
	.datab (legup_mult_unsigned_32_32_2_1_datab),
	.result (legup_mult_unsigned_32_32_2_1_result)
);

defparam
	legup_mult_unsigned_32_32_2_1.widtha = 32,
	legup_mult_unsigned_32_32_2_1.widthb = 32,
	legup_mult_unsigned_32_32_2_1.widthp = 32,
	legup_mult_unsigned_32_32_2_1.pipeline = 2,
	legup_mult_unsigned_32_32_2_1.representation = "UNSIGNED";


texture_mapper_data_receiver_fifo legup_mult_unsigned_32_32_2_0_receiver (
	.clk (legup_mult_unsigned_32_32_2_0_receiver_clk),
	.reset (legup_mult_unsigned_32_32_2_0_receiver_reset),
	.op_start (legup_mult_unsigned_32_32_2_0_receiver_op_start),
	.user_enable (legup_mult_unsigned_32_32_2_0_receiver_user_enable),
	.data_in (legup_mult_unsigned_32_32_2_0_receiver_data_in),
	.data_out (legup_mult_unsigned_32_32_2_0_receiver_data_out)
);

defparam
	legup_mult_unsigned_32_32_2_0_receiver.latency = 2,
	legup_mult_unsigned_32_32_2_0_receiver.data_width = 32;


texture_mapper_data_receiver_fifo legup_mult_unsigned_32_32_2_1_receiver (
	.clk (legup_mult_unsigned_32_32_2_1_receiver_clk),
	.reset (legup_mult_unsigned_32_32_2_1_receiver_reset),
	.op_start (legup_mult_unsigned_32_32_2_1_receiver_op_start),
	.user_enable (legup_mult_unsigned_32_32_2_1_receiver_user_enable),
	.data_in (legup_mult_unsigned_32_32_2_1_receiver_data_in),
	.data_out (legup_mult_unsigned_32_32_2_1_receiver_data_out)
);

defparam
	legup_mult_unsigned_32_32_2_1_receiver.latency = 2,
	legup_mult_unsigned_32_32_2_1_receiver.data_width = 32;



// @texture_frame = internal global [32768 x i64] zeroinitializer, align 8
texture_mapper_ram_dual_port texture_frame (
	.clk( clk ),
	.clken( texture_frame_clken ),
	.address_a( texture_frame_address_a ),
	.write_en_a( texture_frame_write_en_a ),
	.write_data_a( texture_frame_write_data_a ),
	.read_data_a( texture_frame_read_data_a ),
	.address_b( texture_frame_address_b ),
	.write_en_b( texture_frame_write_en_b ),
	.write_data_b( texture_frame_write_data_b ),
	.read_data_b( texture_frame_read_data_b )
);
defparam texture_frame.width_a = 64;
defparam texture_frame.widthad_a = 15;
defparam texture_frame.width_be_a = 8;
defparam texture_frame.numwords_a = 32768;
defparam texture_frame.width_b = 64;
defparam texture_frame.widthad_b = 15;
defparam texture_frame.width_be_b = 8;
defparam texture_frame.numwords_b = 32768;
defparam texture_frame.latency = 1;
defparam texture_frame.init_file = {`MEM_INIT_DIR, "texture_frame.mem"};


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
		next_state = LEGUP_F_texture_mapper_orig_BB_entry_1;
LEGUP_F_texture_mapper_orig_BB_entry_1:
		next_state = LEGUP_F_texture_mapper_orig_BB_entry_2;
LEGUP_F_texture_mapper_orig_BB_entry_2:
	if ((fsm_stall == 1'd0) && (texture_mapper_orig_entry_cmp_reg == 1'd1))
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_3;
	else if ((fsm_stall == 1'd0) && (texture_mapper_orig_entry_cmp_reg == 1'd0))
		next_state = LEGUP_F_texture_mapper_orig_BB_if_end_42;
LEGUP_F_texture_mapper_orig_BB_for_end_40:
		next_state = LEGUP_F_texture_mapper_orig_BB_for_end_41;
LEGUP_F_texture_mapper_orig_BB_for_end_41:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_end_42;
LEGUP_F_texture_mapper_orig_BB_if_end_42:
		next_state = LEGUP_0;
LEGUP_F_texture_mapper_orig_BB_if_then_10:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_11;
LEGUP_F_texture_mapper_orig_BB_if_then_11:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_12;
LEGUP_F_texture_mapper_orig_BB_if_then_12:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_13;
LEGUP_F_texture_mapper_orig_BB_if_then_13:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_14;
LEGUP_F_texture_mapper_orig_BB_if_then_14:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_15;
LEGUP_F_texture_mapper_orig_BB_if_then_15:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_16;
LEGUP_F_texture_mapper_orig_BB_if_then_16:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_17;
LEGUP_F_texture_mapper_orig_BB_if_then_17:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_18;
LEGUP_F_texture_mapper_orig_BB_if_then_18:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_19;
LEGUP_F_texture_mapper_orig_BB_if_then_19:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_20;
LEGUP_F_texture_mapper_orig_BB_if_then_20:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_21;
LEGUP_F_texture_mapper_orig_BB_if_then_21:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_22;
LEGUP_F_texture_mapper_orig_BB_if_then_22:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_23;
LEGUP_F_texture_mapper_orig_BB_if_then_23:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_24;
LEGUP_F_texture_mapper_orig_BB_if_then_24:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_25;
LEGUP_F_texture_mapper_orig_BB_if_then_25:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_26;
LEGUP_F_texture_mapper_orig_BB_if_then_26:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_27;
LEGUP_F_texture_mapper_orig_BB_if_then_27:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_28;
LEGUP_F_texture_mapper_orig_BB_if_then_28:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_29;
LEGUP_F_texture_mapper_orig_BB_if_then_29:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_30;
LEGUP_F_texture_mapper_orig_BB_if_then_3:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_4;
LEGUP_F_texture_mapper_orig_BB_if_then_30:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_31;
LEGUP_F_texture_mapper_orig_BB_if_then_31:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_32;
LEGUP_F_texture_mapper_orig_BB_if_then_32:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_33;
LEGUP_F_texture_mapper_orig_BB_if_then_33:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_34;
LEGUP_F_texture_mapper_orig_BB_if_then_34:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_35;
LEGUP_F_texture_mapper_orig_BB_if_then_35:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_36;
LEGUP_F_texture_mapper_orig_BB_if_then_36:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_37;
LEGUP_F_texture_mapper_orig_BB_if_then_37:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_38;
LEGUP_F_texture_mapper_orig_BB_if_then_38:
		next_state = LEGUP_pipeline_wait_for_loop_texture_mapper_cpp_102_9_39;
LEGUP_F_texture_mapper_orig_BB_if_then_4:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_5;
LEGUP_F_texture_mapper_orig_BB_if_then_5:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_6;
LEGUP_F_texture_mapper_orig_BB_if_then_6:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_7;
LEGUP_F_texture_mapper_orig_BB_if_then_7:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_8;
LEGUP_F_texture_mapper_orig_BB_if_then_8:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_9;
LEGUP_F_texture_mapper_orig_BB_if_then_9:
		next_state = LEGUP_F_texture_mapper_orig_BB_if_then_10;
LEGUP_pipeline_wait_for_loop_texture_mapper_cpp_102_9_39:
	if ((fsm_stall == 1'd0) && (for_loop_texture_mapper_cpp_102_9_pipeline_finish == 1'd1))
		next_state = LEGUP_F_texture_mapper_orig_BB_for_end_40;
	else if ((fsm_stall == 1'd0) && (for_loop_texture_mapper_cpp_102_9_pipeline_finish == 1'd1))
		next_state = LEGUP_F_texture_mapper_orig_BB_for_end_40;
default:
	next_state = cur_state;
endcase

end
always @(posedge clk) begin
	if ((start & ready)) begin
		run_loop_reg <= run_loop;
	end
end
assign fsm_stall = 1'd0;
always @(*) begin
		texture_mapper_orig_entry_cmp = (run_loop_reg == 8'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_entry_1)) begin
		texture_mapper_orig_entry_cmp_reg <= texture_mapper_orig_entry_cmp;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_0 = gv_AX_read_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_if_then_0_reg <= texture_mapper_orig_if_then_0;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_1 = gv_AY_read_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_if_then_1_reg <= texture_mapper_orig_if_then_1;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_2 = gv_BX_read_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_if_then_2_reg <= texture_mapper_orig_if_then_2;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_3 = gv_BY_read_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_if_then_3_reg <= texture_mapper_orig_if_then_3;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_sub = (texture_mapper_orig_if_then_2 - texture_mapper_orig_if_then_0);
end
always @(*) begin
	texture_mapper_orig_if_then_div = texture_mapper_orig_signed_divide_32_0;
end
always @(*) begin
		texture_mapper_orig_if_then_bit_select104 = texture_mapper_orig_if_then_div[30:0];
end
always @(*) begin
		texture_mapper_orig_if_then_bit_select102 = texture_mapper_orig_if_then_div[29:0];
end
always @(*) begin
		texture_mapper_orig_if_then_bit_select100 = texture_mapper_orig_if_then_div[28:0];
end
always @(*) begin
		texture_mapper_orig_if_then_sub1 = (texture_mapper_orig_if_then_3 - texture_mapper_orig_if_then_1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_if_then_sub1_reg <= texture_mapper_orig_if_then_sub1;
	end
end
always @(*) begin
	texture_mapper_orig_if_then_div2 = texture_mapper_orig_signed_divide_32_0;
end
always @(*) begin
		texture_mapper_orig_if_then_bit_select93 = texture_mapper_orig_if_then_div2[30:0];
end
always @(*) begin
		texture_mapper_orig_if_then_bit_select91 = texture_mapper_orig_if_then_div2[29:0];
end
always @(*) begin
		texture_mapper_orig_if_then_bit_select89 = texture_mapper_orig_if_then_div2[28:0];
end
always @(*) begin
		texture_mapper_orig_if_then_4 = (texture_mapper_orig_if_then_0_reg + $signed(texture_mapper_orig_if_then_div));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_4_reg <= texture_mapper_orig_if_then_4;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat110 = {texture_mapper_orig_if_then_bit_select100[28:0], texture_mapper_orig_if_then_bit_concat110_bit_select_operand_2[2:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_bit_concat110_reg <= texture_mapper_orig_if_then_bit_concat110;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat109 = {texture_mapper_orig_if_then_bit_select104[30:0], texture_mapper_orig_if_then_bit_concat109_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_if_then_5 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_if_then_bit_concat109);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_5_reg <= texture_mapper_orig_if_then_5;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat108 = {texture_mapper_orig_if_then_bit_select104[30:0], texture_mapper_orig_if_then_bit_concat108_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add = ($signed(texture_mapper_orig_if_then_div) + texture_mapper_orig_if_then_bit_concat108);
end
always @(*) begin
		texture_mapper_orig_if_then_6 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_if_then_sr_add);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_6_reg <= texture_mapper_orig_if_then_6;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat107 = {texture_mapper_orig_if_then_bit_select102[29:0], texture_mapper_orig_if_then_bit_concat107_bit_select_operand_2[1:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_7 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_if_then_bit_concat107);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_7_reg <= texture_mapper_orig_if_then_7;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat106 = {texture_mapper_orig_if_then_bit_select102[29:0], texture_mapper_orig_if_then_bit_concat106_bit_select_operand_2[1:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add2 = ($signed(texture_mapper_orig_if_then_div) + texture_mapper_orig_if_then_bit_concat106);
end
always @(*) begin
		texture_mapper_orig_if_then_8 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_if_then_sr_add2);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_8_reg <= texture_mapper_orig_if_then_8;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat105 = {texture_mapper_orig_if_then_bit_select104[30:0], texture_mapper_orig_if_then_bit_concat105_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat103 = {texture_mapper_orig_if_then_bit_select102[29:0], texture_mapper_orig_if_then_bit_concat103_bit_select_operand_2[1:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add5 = (texture_mapper_orig_if_then_bit_concat105 + texture_mapper_orig_if_then_bit_concat103);
end
always @(*) begin
		texture_mapper_orig_if_then_9 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_if_then_sr_add5);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_9_reg <= texture_mapper_orig_if_then_9;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_sr_negate = (32'd0 - $signed(texture_mapper_orig_if_then_div));
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat101 = {texture_mapper_orig_if_then_bit_select100[28:0], texture_mapper_orig_if_then_bit_concat101_bit_select_operand_2[2:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add7 = (texture_mapper_orig_if_then_sr_negate + texture_mapper_orig_if_then_bit_concat101);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_36)) begin
		texture_mapper_orig_if_then_sr_add7_reg <= texture_mapper_orig_if_then_sr_add7;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_10 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_if_then_sr_add7_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_10_reg <= texture_mapper_orig_if_then_10;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat99 = {texture_mapper_orig_if_then_bit_select89[28:0], texture_mapper_orig_if_then_bit_concat99_bit_select_operand_2[2:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_bit_concat99_reg <= texture_mapper_orig_if_then_bit_concat99;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_11 = (texture_mapper_orig_if_then_1_reg + $signed(texture_mapper_orig_if_then_div2));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_11_reg <= texture_mapper_orig_if_then_11;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat98 = {texture_mapper_orig_if_then_bit_select93[30:0], texture_mapper_orig_if_then_bit_concat98_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_if_then_12 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_if_then_bit_concat98);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_12_reg <= texture_mapper_orig_if_then_12;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat97 = {texture_mapper_orig_if_then_bit_select93[30:0], texture_mapper_orig_if_then_bit_concat97_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add9 = ($signed(texture_mapper_orig_if_then_div2) + texture_mapper_orig_if_then_bit_concat97);
end
always @(*) begin
		texture_mapper_orig_if_then_13 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_if_then_sr_add9);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_13_reg <= texture_mapper_orig_if_then_13;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat96 = {texture_mapper_orig_if_then_bit_select91[29:0], texture_mapper_orig_if_then_bit_concat96_bit_select_operand_2[1:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_14 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_if_then_bit_concat96);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_14_reg <= texture_mapper_orig_if_then_14;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat95 = {texture_mapper_orig_if_then_bit_select91[29:0], texture_mapper_orig_if_then_bit_concat95_bit_select_operand_2[1:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add11 = ($signed(texture_mapper_orig_if_then_div2) + texture_mapper_orig_if_then_bit_concat95);
end
always @(*) begin
		texture_mapper_orig_if_then_15 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_if_then_sr_add11);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_15_reg <= texture_mapper_orig_if_then_15;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat94 = {texture_mapper_orig_if_then_bit_select93[30:0], texture_mapper_orig_if_then_bit_concat94_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat92 = {texture_mapper_orig_if_then_bit_select91[29:0], texture_mapper_orig_if_then_bit_concat92_bit_select_operand_2[1:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add14 = (texture_mapper_orig_if_then_bit_concat94 + texture_mapper_orig_if_then_bit_concat92);
end
always @(*) begin
		texture_mapper_orig_if_then_16 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_if_then_sr_add14);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_16_reg <= texture_mapper_orig_if_then_16;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_sr_negate15 = (32'd0 - $signed(texture_mapper_orig_if_then_div2));
end
always @(*) begin
		texture_mapper_orig_if_then_bit_concat90 = {texture_mapper_orig_if_then_bit_select89[28:0], texture_mapper_orig_if_then_bit_concat90_bit_select_operand_2[2:0]};
end
always @(*) begin
		texture_mapper_orig_if_then_sr_add17 = (texture_mapper_orig_if_then_sr_negate15 + texture_mapper_orig_if_then_bit_concat90);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_37)) begin
		texture_mapper_orig_if_then_sr_add17_reg <= texture_mapper_orig_if_then_sr_add17;
	end
end
always @(*) begin
		texture_mapper_orig_if_then_17 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_if_then_sr_add17_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_38)) begin
		texture_mapper_orig_if_then_17_reg <= texture_mapper_orig_if_then_17;
	end
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_18 = legup_mult_texture_mapper_orig_IXT_EEEjj_exit_18_out;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_cx_0 = (texture_mapper_orig_if_then_0_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select87 = texture_mapper_orig_IXT_EEEjj_exit_cx_0[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select79 = texture_mapper_orig_IXT_EEEjj_exit_cx_0[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_19 = (texture_mapper_orig_if_then_4_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select77 = texture_mapper_orig_IXT_EEEjj_exit_19[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select69 = texture_mapper_orig_IXT_EEEjj_exit_19[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_20 = (texture_mapper_orig_if_then_5_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select67 = texture_mapper_orig_IXT_EEEjj_exit_20[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select59 = texture_mapper_orig_IXT_EEEjj_exit_20[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_21 = (texture_mapper_orig_if_then_6_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select57 = texture_mapper_orig_IXT_EEEjj_exit_21[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select49 = texture_mapper_orig_IXT_EEEjj_exit_21[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_22 = (texture_mapper_orig_if_then_7_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select47 = texture_mapper_orig_IXT_EEEjj_exit_22[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select39 = texture_mapper_orig_IXT_EEEjj_exit_22[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_23 = (texture_mapper_orig_if_then_8_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select37 = texture_mapper_orig_IXT_EEEjj_exit_23[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select29 = texture_mapper_orig_IXT_EEEjj_exit_23[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_24 = (texture_mapper_orig_if_then_9_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select27 = texture_mapper_orig_IXT_EEEjj_exit_24[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select19 = texture_mapper_orig_IXT_EEEjj_exit_24[18:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_25 = (texture_mapper_orig_if_then_10_reg + texture_mapper_orig_IXT_EEEjj_exit_18);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select17 = texture_mapper_orig_IXT_EEEjj_exit_25[24:19];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select9 = texture_mapper_orig_IXT_EEEjj_exit_25[18:16];
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_26 = legup_mult_texture_mapper_orig_IXT_EEEjj_exit_26_out;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_cy_0 = (texture_mapper_orig_if_then_1_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select86 = texture_mapper_orig_IXT_EEEjj_exit_cy_0[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_27 = (texture_mapper_orig_if_then_11_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select76 = texture_mapper_orig_IXT_EEEjj_exit_27[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_28 = (texture_mapper_orig_if_then_12_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select66 = texture_mapper_orig_IXT_EEEjj_exit_28[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_29 = (texture_mapper_orig_if_then_13_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select56 = texture_mapper_orig_IXT_EEEjj_exit_29[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_30 = (texture_mapper_orig_if_then_14_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select46 = texture_mapper_orig_IXT_EEEjj_exit_30[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_31 = (texture_mapper_orig_if_then_15_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select36 = texture_mapper_orig_IXT_EEEjj_exit_31[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_32 = (texture_mapper_orig_if_then_16_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select26 = texture_mapper_orig_IXT_EEEjj_exit_32[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_33 = (texture_mapper_orig_if_then_17_reg + texture_mapper_orig_IXT_EEEjj_exit_26);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select16 = texture_mapper_orig_IXT_EEEjj_exit_33[24:16];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat88 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat88_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select86[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select87[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat88_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_34 = texture_frame_read_data_wire_a;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat85 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat85_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select79[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat85_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat84 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select79[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat85});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select82 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat83 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select82_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat81 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat81_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_35 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat81} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i = (texture_mapper_orig_IXT_EEEjj_exit_35_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat80 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select79[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_36 = (texture_mapper_orig_IXT_EEEjj_exit_34 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_37 = (texture_mapper_orig_IXT_EEEjj_exit_select & texture_mapper_orig_IXT_EEEjj_exit_36_reg_stage1);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select = texture_mapper_orig_IXT_EEEjj_exit_37[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat78 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat78_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select76[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select77[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i129 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat78_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_38 = texture_frame_read_data_wire_b;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat75 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat75_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select69[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat75_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat74 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select69[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat75});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select72 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat73 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select72_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition2 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat71 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat71_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_39 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat71} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i138 = (texture_mapper_orig_IXT_EEEjj_exit_39_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select8 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition2_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i138_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat70 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select69[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_40 = (texture_mapper_orig_IXT_EEEjj_exit_38 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_41 = (texture_mapper_orig_IXT_EEEjj_exit_select8 & texture_mapper_orig_IXT_EEEjj_exit_40_reg_stage1);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select1 = texture_mapper_orig_IXT_EEEjj_exit_41[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat68 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat68_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select66[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select67[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i109 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat68_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_42 = texture_frame_read_data_wire_a;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat65 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat65_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select59[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat65_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat64 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select59[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat65});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select62 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat63 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select62_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition5 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat61 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat61_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_43 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat61} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i118 = (texture_mapper_orig_IXT_EEEjj_exit_43_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select13 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition5_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i118_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat60 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select59[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_44 = (texture_mapper_orig_IXT_EEEjj_exit_42 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_45 = (texture_mapper_orig_IXT_EEEjj_exit_select13 & texture_mapper_orig_IXT_EEEjj_exit_44);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select2 = texture_mapper_orig_IXT_EEEjj_exit_45[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat58 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat58_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select56[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select57[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i89 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat58_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_46 = texture_frame_read_data_wire_b;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat55 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat55_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select49[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat55_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat54 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select49[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat55});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select52 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat53 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select52_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition10 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat51 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat51_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_47 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat51} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i98 = (texture_mapper_orig_IXT_EEEjj_exit_47_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select18 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition10_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i98_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat50 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select49[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_48 = (texture_mapper_orig_IXT_EEEjj_exit_46 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_49 = (texture_mapper_orig_IXT_EEEjj_exit_select18 & texture_mapper_orig_IXT_EEEjj_exit_48);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select3 = texture_mapper_orig_IXT_EEEjj_exit_49[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat48 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat48_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select46[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select47[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i69 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat48_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_50 = texture_frame_read_data_wire_a;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat45 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat45_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select39[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat45_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat44 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select39[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat45});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select42 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat43 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select42_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition15 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat41 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat41_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_51 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat41} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i78 = (texture_mapper_orig_IXT_EEEjj_exit_51_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select23 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition15_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i78_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat40 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select39[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_52 = (texture_mapper_orig_IXT_EEEjj_exit_50 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_53 = (texture_mapper_orig_IXT_EEEjj_exit_select23_reg_stage1 & texture_mapper_orig_IXT_EEEjj_exit_52);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select4 = texture_mapper_orig_IXT_EEEjj_exit_53[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat38 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat38_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select36[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select37[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i49 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat38_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_54 = texture_frame_read_data_wire_b;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat35 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat35_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select29[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat35_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat34 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select29[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat35});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select32 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat33 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select32_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition20 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat31 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat31_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_55 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat31} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i58 = (texture_mapper_orig_IXT_EEEjj_exit_55_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select28 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition20_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i58_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat30 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select29[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_56 = (texture_mapper_orig_IXT_EEEjj_exit_54 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_57 = (texture_mapper_orig_IXT_EEEjj_exit_select28_reg_stage1 & texture_mapper_orig_IXT_EEEjj_exit_56);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select5 = texture_mapper_orig_IXT_EEEjj_exit_57[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat28 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat28_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select26[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select27[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i29 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat28_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_58 = texture_frame_read_data_wire_a;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat25 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat25_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select19[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat25_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat24 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select19[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat25});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select22 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat23 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select22_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition25 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat21 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat21_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_59 = (64'd1 <<< ({32'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat21} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i38 = (texture_mapper_orig_IXT_EEEjj_exit_59_reg_stage1 + 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select33 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition25_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i38_reg_stage1 : 64'd255);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat20 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select19[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_60 = (texture_mapper_orig_IXT_EEEjj_exit_58 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_61 = (texture_mapper_orig_IXT_EEEjj_exit_select33_reg_stage1 & texture_mapper_orig_IXT_EEEjj_exit_60);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select6 = texture_mapper_orig_IXT_EEEjj_exit_61[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat18 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat18_bit_select_operand_0[16:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select16[8:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select17[5:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i9 = (1'd0 + (8 * {17'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat18_reg_stage0}));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_62 = texture_frame_read_data_wire_b;
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat15 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat15_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select9[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat15_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat14 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_bit_select_operand_0[25:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select9[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14 = (32'd0 - {1'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat15});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select12 = texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14_width_extended[31:1];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat13 = {texture_mapper_orig_IXT_EEEjj_exit_bit_select12_width_extended[30:0], texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_bit_select_operand_2};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16 = ($signed({{1{texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_reg_stage0[6]}},texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_reg_stage0}) + {2'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_reg_stage0});
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition30 = ({{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16} < 32'd64);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat11 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat11_bit_select_operand_0[31:0], texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16_width_extended[31:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_63 = (64'd1 <<< (texture_mapper_orig_IXT_EEEjj_exit_bit_concat11 % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i18 = (texture_mapper_orig_IXT_EEEjj_exit_63_reg_stage1 + $signed(-64'd1));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_select38 = (texture_mapper_orig_IXT_EEEjj_exit_NotCondition30_reg_stage1 ? texture_mapper_orig_IXT_EEEjj_exit_phitmp_i18_reg_stage1 : -64'd1);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat10 = {{texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_bit_select_operand_0[57:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select9[2:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_bit_select_operand_4[2:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_64 = (texture_mapper_orig_IXT_EEEjj_exit_62 >> ({58'd0,texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_reg_stage1} % 64'd64));
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select7 = texture_mapper_orig_IXT_EEEjj_exit_64[7:0];
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat8 = {texture_mapper_orig_IXT_EEEjj_exit_bit_concat8_bit_select_operand_0[55:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select7[7:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_65 = (texture_mapper_orig_IXT_EEEjj_exit_bit_concat8 & texture_mapper_orig_IXT_EEEjj_exit_select38_reg_stage1);
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat = {{{{{{{texture_mapper_orig_IXT_EEEjj_exit_bit_select_reg_stage1[7:0], texture_mapper_orig_IXT_EEEjj_exit_bit_select1_reg_stage1[7:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select2_reg_stage1[7:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select3_reg_stage1[7:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select4_reg_stage1[7:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select5_reg_stage1[7:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_select6[7:0]}, texture_mapper_orig_IXT_EEEjj_exit_bit_concat_bit_select_operand_14[7:0]};
end
always @(*) begin
		texture_mapper_orig_IXT_EEEjj_exit_66 = ({56'd0,texture_mapper_orig_IXT_EEEjj_exit_65_reg_stage2} | texture_mapper_orig_IXT_EEEjj_exit_bit_concat_reg_stage2);
end
always @(*) begin
		texture_mapper_orig_for_end_68 = gv_DX1DY_read_data;
end
always @(*) begin
		texture_mapper_orig_for_end_add = (texture_mapper_orig_for_end_68 + texture_mapper_orig_if_then_0_reg);
end
always @(*) begin
		texture_mapper_orig_for_end_69 = gv_DY1DY_read_data;
end
always @(*) begin
		texture_mapper_orig_for_end_add111 = (texture_mapper_orig_for_end_69 + texture_mapper_orig_if_then_1_reg);
end
always @(*) begin
		texture_mapper_orig_for_end_70 = gv_DX2DY_read_data;
end
always @(*) begin
		texture_mapper_orig_for_end_add112 = (texture_mapper_orig_for_end_70 + texture_mapper_orig_if_then_2_reg);
end
always @(*) begin
		texture_mapper_orig_for_end_71 = gv_DY2DY_read_data;
end
always @(*) begin
		texture_mapper_orig_for_end_add113 = (texture_mapper_orig_for_end_71 + texture_mapper_orig_if_then_3_reg);
end
always @(*) begin
	texture_frame_clken = texture_frame_clken_pipeline_cond;
end
always @(*) begin
	texture_frame_address_a = 15'd0;
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_3 & 1'd1)) begin
		texture_frame_address_a = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i >> 2'd3);
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_4 & 1'd1)) begin
		texture_frame_address_a = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i109_reg_stage1 >> 2'd3);
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_5 & 1'd1)) begin
		texture_frame_address_a = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i69_reg_stage1 >> 2'd3);
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_6 & 1'd1)) begin
		texture_frame_address_a = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i29_reg_stage1 >> 2'd3);
	end
end
assign texture_frame_write_en_a = 'd0;
assign texture_frame_write_data_a = 64'd0;
always @(*) begin
	texture_frame_read_en_a = 'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_frame_read_en_a = 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_frame_read_en_a = 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_frame_read_en_a = 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_state_enable_6) begin
		texture_frame_read_en_a = 1'd1;
	end
end
always @(*) begin
	texture_frame_address_b = 15'd0;
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_3 & 1'd1)) begin
		texture_frame_address_b = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i129 >> 2'd3);
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_4 & 1'd1)) begin
		texture_frame_address_b = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i89_reg_stage1 >> 2'd3);
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_5 & 1'd1)) begin
		texture_frame_address_b = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i49_reg_stage1 >> 2'd3);
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_enable_6 & 1'd1)) begin
		texture_frame_address_b = (texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i9_reg_stage1 >> 2'd3);
	end
end
assign texture_frame_write_en_b = 'd0;
assign texture_frame_write_data_b = 64'd0;
always @(*) begin
	texture_frame_read_en_b = 'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_frame_read_en_b = 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_frame_read_en_b = 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_frame_read_en_b = 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_state_enable_6) begin
		texture_frame_read_en_b = 1'd1;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_0)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_0 <= (for_loop_texture_mapper_cpp_102_9_II_counter[3] & for_loop_texture_mapper_cpp_102_9_start);
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_0 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_1) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_0 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_0 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[0]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_0 = (for_loop_texture_mapper_cpp_102_9_valid_bit_0 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_0));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_0 <= for_loop_texture_mapper_cpp_102_9_state_stall_0;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_1)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_1 <= for_loop_texture_mapper_cpp_102_9_state_enable_0;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_1 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_2) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_1 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_1 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[1]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_1 = (for_loop_texture_mapper_cpp_102_9_valid_bit_1 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_1));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_1 <= for_loop_texture_mapper_cpp_102_9_state_stall_1;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_1 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_2)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_2 <= for_loop_texture_mapper_cpp_102_9_state_enable_1;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_2 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_3) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_2 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_2 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[2]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_2 = (for_loop_texture_mapper_cpp_102_9_valid_bit_2 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_2));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_2 <= for_loop_texture_mapper_cpp_102_9_state_stall_2;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_2 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_3)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_3 <= for_loop_texture_mapper_cpp_102_9_state_enable_2;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_3 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_4) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_3 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_3 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[3]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_3 = (for_loop_texture_mapper_cpp_102_9_valid_bit_3 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_3));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_3 <= for_loop_texture_mapper_cpp_102_9_state_stall_3;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_3 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_4)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_4 <= for_loop_texture_mapper_cpp_102_9_state_enable_3;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_4 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_4 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_5) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_4 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_4 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[0]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_4 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_4 = (for_loop_texture_mapper_cpp_102_9_valid_bit_4 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_4));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_4 <= for_loop_texture_mapper_cpp_102_9_state_stall_4;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_4 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_5)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_5 <= for_loop_texture_mapper_cpp_102_9_state_enable_4;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_5 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_5 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_6) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_5 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_5 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[1]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_5 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_5 = (for_loop_texture_mapper_cpp_102_9_valid_bit_5 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_5));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_5 <= for_loop_texture_mapper_cpp_102_9_state_stall_5;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_5 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_6)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_6 <= for_loop_texture_mapper_cpp_102_9_state_enable_5;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_6 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_6 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_7) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_6 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_6 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[2]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_6 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_6 = (for_loop_texture_mapper_cpp_102_9_valid_bit_6 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_6));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_6 <= for_loop_texture_mapper_cpp_102_9_state_stall_6;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_6 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_7)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_7 <= for_loop_texture_mapper_cpp_102_9_state_enable_6;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_7 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_7 = 1'd0;
	if (for_loop_texture_mapper_cpp_102_9_state_stall_8) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_7 = 1'd1;
	end
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_7 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[3]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_7 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_7 = (for_loop_texture_mapper_cpp_102_9_valid_bit_7 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_7));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_7 <= for_loop_texture_mapper_cpp_102_9_state_stall_7;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_7 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (~(for_loop_texture_mapper_cpp_102_9_state_stall_8)) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_8 <= for_loop_texture_mapper_cpp_102_9_state_enable_7;
	end
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_valid_bit_8 <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_8 = 1'd0;
	if ((for_loop_texture_mapper_cpp_102_9_state_stall_reg_8 & ~(for_loop_texture_mapper_cpp_102_9_II_counter[0]))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_8 = 1'd1;
	end
	if ((((for_loop_texture_mapper_cpp_102_9_valid_bit_8 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_not_accessed_due_to_stall_a | output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_stalln_reg))) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_8 = 1'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_state_enable_8 = (for_loop_texture_mapper_cpp_102_9_valid_bit_8 & ~(for_loop_texture_mapper_cpp_102_9_state_stall_8));
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_state_stall_reg_8 <= for_loop_texture_mapper_cpp_102_9_state_stall_8;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_state_stall_reg_8 <= 1'd0;
	end
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_II_counter <= {for_loop_texture_mapper_cpp_102_9_II_counter[2:0], for_loop_texture_mapper_cpp_102_9_II_counter[3]};
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_II_counter <= 4'd1;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_start = (for_loop_texture_mapper_cpp_102_9_activate_pipeline | ((for_loop_texture_mapper_cpp_102_9_active & ~(for_loop_texture_mapper_cpp_102_9_epilogue)) & ~(for_loop_texture_mapper_cpp_102_9_pipeline_exit_cond)));
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_start = 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_activate_pipeline = (((fsm_stall == 1'd0) & for_loop_texture_mapper_cpp_102_9_begin_pipeline) & ~(for_loop_texture_mapper_cpp_102_9_active));
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat88_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat88;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat84;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat83;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_35_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_35;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat80;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_36_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_36;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_select;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat78_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat78;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat74;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat73;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition2_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition2;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_39_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_39;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i138_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i138;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat70;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_40_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_40;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select1_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_select1;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat68_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat68;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i109_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i109;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat64;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat63;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition5_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition5;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_43_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_43;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i118_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i118;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat60;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select2_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_select2;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat58_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat58;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i89_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i89;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat54;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat53;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition10_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition10;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_47_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_47;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i98_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i98;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat50;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select3_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_select3;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat48_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat48;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i69_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i69;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat44;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat43;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition15_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition15;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_51_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_51;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i78_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i78;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_select23_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_select23;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat40;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_6) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select4_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_select4;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat38_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat38;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i49_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i49;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat34;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat33;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition20_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition20;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_55_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_55;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i58_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i58;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_select28_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_select28;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat30;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_6) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_select5_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_select5;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat28_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat28;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i29_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i29;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat24;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat23;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition25_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition25;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_59_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_59;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i38_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i38;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_select33_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_select33;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat20;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat18_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat18;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i9_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_arrayidx_i9;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat14;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat13;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_NotCondition30_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_NotCondition30;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_63_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_63;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_4) begin
		texture_mapper_orig_IXT_EEEjj_exit_phitmp_i18_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_phitmp_i18;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_5) begin
		texture_mapper_orig_IXT_EEEjj_exit_select38_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_select38;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_2) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_reg_stage0 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat10;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_3) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_reg_stage1 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_reg_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_7) begin
		texture_mapper_orig_IXT_EEEjj_exit_65_reg_stage2 <= texture_mapper_orig_IXT_EEEjj_exit_65;
	end
end
always @(posedge clk) begin
	if (for_loop_texture_mapper_cpp_102_9_state_enable_7) begin
		texture_mapper_orig_IXT_EEEjj_exit_bit_concat_reg_stage2 <= texture_mapper_orig_IXT_EEEjj_exit_bit_concat;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_inductionVar_stage0 <= 0;
	end
	if (for_loop_texture_mapper_cpp_102_9_activate_pipeline) begin
		for_loop_texture_mapper_cpp_102_9_inductionVar_stage0 <= 0;
	end
	if ((for_loop_texture_mapper_cpp_102_9_II_counter[3] & for_loop_texture_mapper_cpp_102_9_state_enable_3)) begin
		for_loop_texture_mapper_cpp_102_9_inductionVar_stage0 <= (for_loop_texture_mapper_cpp_102_9_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_pipeline_exit_cond = (for_loop_texture_mapper_cpp_102_9_state_enable_0 & (for_loop_texture_mapper_cpp_102_9_inductionVar_stage0 == 79));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_active <= 1'd0;
	end
	if (for_loop_texture_mapper_cpp_102_9_activate_pipeline) begin
		for_loop_texture_mapper_cpp_102_9_active <= 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_pipeline_finishing) begin
		for_loop_texture_mapper_cpp_102_9_active <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_38) & (fsm_stall == 1'd0))) begin
		for_loop_texture_mapper_cpp_102_9_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_epilogue <= 1'd0;
	end
	if ((for_loop_texture_mapper_cpp_102_9_pipeline_exit_cond & for_loop_texture_mapper_cpp_102_9_active)) begin
		for_loop_texture_mapper_cpp_102_9_epilogue <= 1'd1;
	end
	if (for_loop_texture_mapper_cpp_102_9_pipeline_finishing) begin
		for_loop_texture_mapper_cpp_102_9_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_pipeline_finish = (for_loop_texture_mapper_cpp_102_9_pipeline_finishing | for_loop_texture_mapper_cpp_102_9_pipeline_finish_reg);
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_pipeline_finishing = ((for_loop_texture_mapper_cpp_102_9_epilogue | for_loop_texture_mapper_cpp_102_9_pipeline_exit_cond) & for_loop_texture_mapper_cpp_102_9_only_last_stage_enabled);
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_only_last_stage_enabled = ((for_loop_texture_mapper_cpp_102_9_num_active_iterations == 1'd1) & for_loop_texture_mapper_cpp_102_9_state_enable_8);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_num_active_iterations <= 1'd0;
	end
	if ((for_loop_texture_mapper_cpp_102_9_inserting_new_iteration & ~(for_loop_texture_mapper_cpp_102_9_state_enable_8))) begin
		for_loop_texture_mapper_cpp_102_9_num_active_iterations <= (for_loop_texture_mapper_cpp_102_9_num_active_iterations + 1'd1);
	end
	if ((~(for_loop_texture_mapper_cpp_102_9_inserting_new_iteration) & for_loop_texture_mapper_cpp_102_9_state_enable_8)) begin
		for_loop_texture_mapper_cpp_102_9_num_active_iterations <= (for_loop_texture_mapper_cpp_102_9_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop_texture_mapper_cpp_102_9_inserting_new_iteration = ((~(for_loop_texture_mapper_cpp_102_9_state_stall_0) & for_loop_texture_mapper_cpp_102_9_II_counter[3]) & for_loop_texture_mapper_cpp_102_9_start);
end
always @(posedge clk) begin
	for_loop_texture_mapper_cpp_102_9_pipeline_finish_reg <= for_loop_texture_mapper_cpp_102_9_pipeline_finish;
	if (reset) begin
		for_loop_texture_mapper_cpp_102_9_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop_texture_mapper_cpp_102_9_activate_pipeline) begin
		for_loop_texture_mapper_cpp_102_9_pipeline_finish_reg <= 1'd0;
	end
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_op0 = 0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_signed_divide_32_0_op0 = texture_mapper_orig_if_then_sub;
	end
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_4)) begin
		texture_mapper_orig_signed_divide_32_0_op0 = texture_mapper_orig_if_then_sub1_reg;
	end
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_op1 = 12'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_3)) begin
		texture_mapper_orig_signed_divide_32_0_op1 = 32'd640;
	end
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_then_4)) begin
		texture_mapper_orig_signed_divide_32_0_op1 = 32'd640;
	end
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_inst_clock = clk;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_inst_aclr = reset;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_inst_clken = texture_mapper_orig_signed_divide_32_0_clken;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_inst_numer = texture_mapper_orig_signed_divide_32_0_op0;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_inst_denom = {{20{texture_mapper_orig_signed_divide_32_0_op1[11]}},texture_mapper_orig_signed_divide_32_0_op1};
end
always @(*) begin
	divide_texture_mapper_orig_if_then_div_temp_out = texture_mapper_orig_signed_divide_32_0_inst_quotient;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_clken = texture_mapper_orig_signed_divide_32_0_clken_sequential_cond;
end
always @(*) begin
	divide_texture_mapper_orig_if_then_div_out = divide_texture_mapper_orig_if_then_div_temp_out;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0 = divide_texture_mapper_orig_if_then_div_out;
end
always @(*) begin
	texture_mapper_orig_signed_divide_32_0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign texture_mapper_orig_if_then_bit_concat110_bit_select_operand_2 = 3'd0;
assign texture_mapper_orig_if_then_bit_concat109_bit_select_operand_2 = 1'd0;
assign texture_mapper_orig_if_then_bit_concat108_bit_select_operand_2 = 1'd0;
assign texture_mapper_orig_if_then_bit_concat107_bit_select_operand_2 = 2'd0;
assign texture_mapper_orig_if_then_bit_concat106_bit_select_operand_2 = 2'd0;
assign texture_mapper_orig_if_then_bit_concat105_bit_select_operand_2 = 1'd0;
assign texture_mapper_orig_if_then_bit_concat103_bit_select_operand_2 = 2'd0;
assign texture_mapper_orig_if_then_bit_concat101_bit_select_operand_2 = 3'd0;
assign texture_mapper_orig_if_then_bit_concat99_bit_select_operand_2 = 3'd0;
assign texture_mapper_orig_if_then_bit_concat98_bit_select_operand_2 = 1'd0;
assign texture_mapper_orig_if_then_bit_concat97_bit_select_operand_2 = 1'd0;
assign texture_mapper_orig_if_then_bit_concat96_bit_select_operand_2 = 2'd0;
assign texture_mapper_orig_if_then_bit_concat95_bit_select_operand_2 = 2'd0;
assign texture_mapper_orig_if_then_bit_concat94_bit_select_operand_2 = 1'd0;
assign texture_mapper_orig_if_then_bit_concat92_bit_select_operand_2 = 2'd0;
assign texture_mapper_orig_if_then_bit_concat90_bit_select_operand_2 = 3'd0;
always @(*) begin
	legup_mult_unsigned_32_32_2_0_clock = clk;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_aclr = reset;
end
assign legup_mult_unsigned_32_32_2_0_clken = 1'b1;
always @(*) begin
	legup_mult_unsigned_32_32_2_0_dataa = texture_mapper_orig_if_then_bit_concat110_reg;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_datab = for_loop_texture_mapper_cpp_102_9_inductionVar_stage0;
end
always @(*) begin
	legup_mult_texture_mapper_orig_IXT_EEEjj_exit_18_out = legup_mult_unsigned_32_32_2_0_receiver_data_out;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_clock = clk;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_aclr = reset;
end
assign legup_mult_unsigned_32_32_2_1_clken = 1'b1;
always @(*) begin
	legup_mult_unsigned_32_32_2_1_dataa = texture_mapper_orig_if_then_bit_concat99_reg;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_datab = for_loop_texture_mapper_cpp_102_9_inductionVar_stage0;
end
always @(*) begin
	legup_mult_texture_mapper_orig_IXT_EEEjj_exit_26_out = legup_mult_unsigned_32_32_2_1_receiver_data_out;
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat88_bit_select_operand_0 = 17'd0;
always @(*) begin
	texture_frame_read_data_wire_a = texture_frame_read_data_a;
end
always @(*) begin
	texture_frame_clken_pipeline_cond = (((~(for_loop_texture_mapper_cpp_102_9_state_stall_4) | ~(for_loop_texture_mapper_cpp_102_9_state_stall_5)) | ~(for_loop_texture_mapper_cpp_102_9_state_stall_6)) | ~(for_loop_texture_mapper_cpp_102_9_state_stall_7));
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat85_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat85_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat84_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select82_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select82[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select82};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat83_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat81_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat80_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat78_bit_select_operand_0 = 17'd0;
always @(*) begin
	texture_frame_read_data_wire_b = texture_frame_read_data_b;
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat75_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat75_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat74_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i134};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select72_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select72[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select72};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat73_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat71_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i136};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat70_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat68_bit_select_operand_0 = 17'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat65_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat65_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat64_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i114};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select62_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select62[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select62};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat63_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat61_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i116};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat60_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat58_bit_select_operand_0 = 17'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat55_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat55_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat54_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i94};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select52_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select52[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select52};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat53_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat51_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i96};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat50_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat48_bit_select_operand_0 = 17'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat45_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat45_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat44_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i74};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select42_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select42[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select42};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat43_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat41_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i76};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat40_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat38_bit_select_operand_0 = 17'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat35_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat35_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat34_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i54};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select32_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select32[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select32};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat33_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat31_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i56};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat30_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat28_bit_select_operand_0 = 17'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat25_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat25_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat24_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i34};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select22_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select22[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select22};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat23_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat21_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i36};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat20_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat18_bit_select_operand_0 = 17'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat15_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat15_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_bit_select_operand_0 = 26'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat14_bit_select_operand_4 = -3'd1;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14[6]}},texture_mapper_orig_IXT_EEEjj_exit_mul_neg_i14};
end
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_bit_select12_width_extended = {{25{texture_mapper_orig_IXT_EEEjj_exit_bit_select12[5]}},texture_mapper_orig_IXT_EEEjj_exit_bit_select12};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat13_bit_select_operand_2 = 1'd1;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat11_bit_select_operand_0 = 32'd0;
always @(*) begin
	texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16_width_extended = {{24{texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16[7]}},texture_mapper_orig_IXT_EEEjj_exit_add_i_i_i16};
end
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_bit_select_operand_0 = 58'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat10_bit_select_operand_4 = 3'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat8_bit_select_operand_0 = 56'd0;
assign texture_mapper_orig_IXT_EEEjj_exit_bit_concat_bit_select_operand_14 = 8'd0;
always @(posedge clk) begin
	output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_not_accessed_due_to_stall_a <= ((for_loop_texture_mapper_cpp_102_9_state_stall_8 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_stalln_reg <= ~(for_loop_texture_mapper_cpp_102_9_state_stall_8);
end
always @(*) begin
	output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_enable_cond_a = (for_loop_texture_mapper_cpp_102_9_valid_bit_8 & (output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_not_accessed_due_to_stall_a | output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_stalln_reg));
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_receiver_clk = clk;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_receiver_reset = reset;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_receiver_op_start = for_loop_texture_mapper_cpp_102_9_state_enable_0;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_receiver_user_enable = for_loop_texture_mapper_cpp_102_9_state_enable_2;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_receiver_data_in = legup_mult_unsigned_32_32_2_0_receiver_in;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_0_receiver_in = legup_mult_unsigned_32_32_2_0_result;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_receiver_clk = clk;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_receiver_reset = reset;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_receiver_op_start = for_loop_texture_mapper_cpp_102_9_state_enable_0;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_receiver_user_enable = for_loop_texture_mapper_cpp_102_9_state_enable_2;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_receiver_data_in = legup_mult_unsigned_32_32_2_1_receiver_in;
end
always @(*) begin
	legup_mult_unsigned_32_32_2_1_receiver_in = legup_mult_unsigned_32_32_2_1_result;
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_if_end_42)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(*) begin
	run_done_write_en = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_entry_1)) begin
		run_done_write_en = 1'd1;
	end
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		run_done_write_en = 1'd1;
	end
end
always @(*) begin
	run_done_write_data = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_entry_1)) begin
		run_done_write_data = 8'd0;
	end
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		run_done_write_data = 8'd1;
	end
end
always @(*) begin
	gv_AX_write_en = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_AX_write_en = 1'd1;
	end
end
always @(*) begin
	gv_AX_write_data = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_AX_write_data = texture_mapper_orig_for_end_add;
	end
end
always @(*) begin
	gv_AY_write_en = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_AY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_AY_write_data = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_AY_write_data = texture_mapper_orig_for_end_add111;
	end
end
always @(*) begin
	gv_BX_write_en = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_BX_write_en = 1'd1;
	end
end
always @(*) begin
	gv_BX_write_data = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_BX_write_data = texture_mapper_orig_for_end_add112;
	end
end
always @(*) begin
	gv_BY_write_en = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_BY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_BY_write_data = 1'd0;
	if ((cur_state == LEGUP_F_texture_mapper_orig_BB_for_end_40)) begin
		gv_BY_write_data = texture_mapper_orig_for_end_add113;
	end
end
always @(*) begin
		output_fifo = texture_mapper_orig_IXT_EEEjj_exit_66;
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((output_fifo_for_loop_texture_mapper_cpp_102_9_state_8_enable_cond_a & 1'd1)) begin
		output_fifo_valid = 1'd1;
	end
end
assign gv_DX1DY_write_en = 1'd0;
assign gv_DX1DY_write_data = 1'd0;
assign gv_DY1DY_write_en = 1'd0;
assign gv_DY1DY_write_data = 1'd0;
assign gv_DX2DY_write_en = 1'd0;
assign gv_DX2DY_write_data = 1'd0;
assign gv_DY2DY_write_en = 1'd0;
assign gv_DY2DY_write_data = 1'd0;

endmodule
`timescale 1 ns / 1 ns
module gv_write
(
	clk,
	reset,
	start,
	ready,
	finish,
	s_aw_addr,
	axi_s_aw_ready,
	axi_s_aw_valid,
	s_w_data,
	axi_s_w_ready,
	axi_s_w_valid,
	s_aw_burst,
	s_aw_size,
	s_aw_len,
	s_w_strb,
	s_w_last,
	gv_ctrl_write_en,
	gv_ctrl_write_data,
	gv_ctrl_read_data,
	gv_AX_write_en,
	gv_AX_write_data,
	gv_AX_read_data,
	gv_BX_write_en,
	gv_BX_write_data,
	gv_BX_read_data,
	gv_DX1DY_write_en,
	gv_DX1DY_write_data,
	gv_DX1DY_read_data,
	gv_DX2DY_write_en,
	gv_DX2DY_write_data,
	gv_DX2DY_read_data,
	gv_AY_write_en,
	gv_AY_write_data,
	gv_AY_read_data,
	gv_BY_write_en,
	gv_BY_write_data,
	gv_BY_read_data,
	gv_DY1DY_write_en,
	gv_DY1DY_write_data,
	gv_DY1DY_read_data,
	gv_DY2DY_write_en,
	gv_DY2DY_write_data,
	gv_DY2DY_read_data,
	s_b_resp,
	s_b_resp_ready,
	s_b_resp_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [31:0] s_aw_addr;
output reg  axi_s_aw_ready;
input  axi_s_aw_valid;
input [63:0] s_w_data;
output reg  axi_s_w_ready;
input  axi_s_w_valid;
input [1:0] s_aw_burst;
input [2:0] s_aw_size;
input [7:0] s_aw_len;
input [7:0] s_w_strb;
input  s_w_last;
output reg  gv_ctrl_write_en;
output reg  gv_ctrl_write_data;
input  gv_ctrl_read_data;
output reg  gv_AX_write_en;
output reg [31:0] gv_AX_write_data;
input [31:0] gv_AX_read_data;
output reg  gv_BX_write_en;
output reg [31:0] gv_BX_write_data;
input [31:0] gv_BX_read_data;
output reg  gv_DX1DY_write_en;
output reg [31:0] gv_DX1DY_write_data;
input [31:0] gv_DX1DY_read_data;
output reg  gv_DX2DY_write_en;
output reg [31:0] gv_DX2DY_write_data;
input [31:0] gv_DX2DY_read_data;
output reg  gv_AY_write_en;
output reg [31:0] gv_AY_write_data;
input [31:0] gv_AY_read_data;
output reg  gv_BY_write_en;
output reg [31:0] gv_BY_write_data;
input [31:0] gv_BY_read_data;
output reg  gv_DY1DY_write_en;
output reg [31:0] gv_DY1DY_write_data;
input [31:0] gv_DY1DY_read_data;
output reg  gv_DY2DY_write_en;
output reg [31:0] gv_DY2DY_write_data;
input [31:0] gv_DY2DY_read_data;
output [1:0] s_b_resp;
input  s_b_resp_ready;
output reg  s_b_resp_valid;
reg  gv_write_init_check_i_0;
reg [31:0] gv_write_init_check_i_1;
reg [7:0] gv_write_init_check_i_2;
reg  gv_write_init_check_i_CaseCmpExitMask;
wire  gv_write_init_check_i_3;
reg  gv_write_init_check_i_exitMask_T;
reg  gv_write_init_check_i_NotCondition;
reg  gv_write_init_check_i_exitMask_F;
wire  gv_write_init_check_i_4;
reg  gv_write_init_check_i_exitMask_T2;
reg  gv_write_init_check_i_NotCondition3;
reg  gv_write_init_check_i_exitMask_F4;
reg [31:0] gv_write_init_check_i_5;
reg [28:0] gv_write_init_check_i_bit_select11;
reg [28:0] gv_write_init_check_i_bit_concat12;
reg [63:0] gv_write_init_check_i_9;
reg  gv_write_init_check_i_bit_select2;
reg [31:0] gv_write_init_check_i_bit_select1;
reg [31:0] gv_write_init_check_i_bit_select;
reg [7:0] gv_write_init_check_i_10;
reg [1:0] gv_write_init_check_i_bit_select8;
reg [3:0] gv_write_init_check_i_bit_select6;
reg  gv_write_init_check_i_11;
reg  gv_write_init_check_i_not_1;
reg [7:0] gv_write_init_check_i_bit_concat10;
reg [31:0] gv_write_init_check_i_12;
reg [2:0] gv_write_init_check_i_bit_select4;
reg  gv_write_init_check_i_cmp_i;
reg [5:0] gv_write_init_check_i_bit_concat9;
reg  gv_write_init_check_i_cmp43_i;
reg  gv_write_init_check_i_and164_i;
reg [3:0] gv_write_init_check_i_bit_concat7;
reg  gv_write_init_check_i_13;
reg [2:0] gv_write_init_check_i_bit_concat5;
reg  gv_write_init_check_i_CaseCmpExitMask5;
reg  gv_write_init_check_i_CaseCmpExitMask6;
reg  gv_write_init_check_i_CaseCmpExitMask7;
reg  gv_write_init_check_i_CaseCmpExitMask8;
reg  gv_write_init_check_i_CaseCmpExitMask9;
reg  gv_write_init_check_i_CaseCmpExitMask5_AndEntryMas;
reg  gv_write_init_check_i_CaseCmpExitMask6_AndEntryMas;
reg  gv_write_init_check_i_CaseCmpExitMask7_AndEntryMas;
reg  gv_write_init_check_i_CaseCmpExitMask8_AndEntryMas;
reg  gv_write_init_check_i_CaseCmpExitMask9_AndEntryMas;
reg  gv_write_init_check_i_exitMask_T15;
reg  gv_write_init_check_i_exitMask_T18;
reg  gv_write_init_check_i_exitMask_T21;
reg  gv_write_init_check_i_exitMask_T24;
reg  gv_write_init_check_i_bit_concat3;
reg  gv_write_init_check_i_14;
reg  gv_write_init_check_i_exitMask_T27;
reg  gv_write_init_check_i_exitMask_T30;
reg  gv_write_init_check_i_exitMask_T33;
reg  gv_write_init_check_i_exitMask_T36;
reg  gv_write_init_check_i_exitMask_T39;
reg  gv_write_init_check_i_select65;
reg  gv_write_init_check_i_1_var1;
reg  gv_write_init_check_i_select67;
reg  gv_write_init_check_i_select69;
reg [31:0] gv_write_init_check_i_select55;
reg [31:0] gv_write_init_check_i_select59;
reg [7:0] gv_write_init_check_i_select45;
reg  gv_write_init_check_i_bit_concat;
reg  gv_write_init_check_i_15;
reg [7:0] gv_write_init_check_i_select47;
reg [7:0] gv_write_init_check_i_select49;
reg  axi_s_write_state_inferred_reg;
reg [31:0] axi_s_write_word_addr_inferred_reg;
reg [7:0] axi_s_write_count_inferred_reg;
reg  gv_write_valid_bit_0;
reg  gv_write_state_stall_0;
reg  gv_write_state_enable_0;
reg  gv_write_valid_bit_1;
reg  gv_write_state_stall_1;
reg  gv_write_state_enable_1;
reg  gv_write_valid_bit_2;
wire  gv_write_state_stall_2;
reg  gv_write_state_enable_2;
reg  gv_write_II_counter;
reg  gv_write_init_check_i_0_reg_stage1;
reg  gv_write_init_check_i_exitMask_T_reg_stage1;
reg  gv_write_init_check_i_exitMask_F4_reg_stage1;
reg [28:0] gv_write_init_check_i_bit_concat12_reg_stage1;
reg [31:0] gv_write_init_check_i_bit_select1_reg_stage1;
reg [31:0] gv_write_init_check_i_bit_select_reg_stage1;
reg [7:0] gv_write_init_check_i_bit_concat10_reg_stage1;
reg  gv_write_init_check_i_and164_i_reg_stage1;
reg  gv_write_init_check_i_13_reg_stage1;
reg  gv_write_init_check_i_14_reg_stage1;
reg  gv_write_init_check_i_exitMask_T39_reg_stage1;
reg  axi_s_aw_addr_consumed_valid;
reg [31:0] axi_s_aw_addr_consumed_data;
reg  axi_s_aw_addr_consumed_taken;
reg  axi_s_w_data_consumed_valid;
reg [63:0] axi_s_w_data_consumed_data;
reg  axi_s_w_data_consumed_taken;
reg  axi_s_aw_burst_consumed_valid;
reg  axi_s_aw_burst_consumed_taken;
reg  axi_s_aw_size_consumed_valid;
reg  axi_s_aw_size_consumed_taken;
reg  axi_s_aw_len_consumed_valid;
reg  axi_s_aw_len_consumed_taken;
wire [2:0] gv_write_init_check_i_bit_concat12_bit_select_operand_0;
reg  axi_s_w_strb_consumed_valid;
reg [7:0] axi_s_w_strb_consumed_data;
reg  axi_s_w_strb_consumed_taken;
reg  axi_s_w_last_consumed_valid;
reg  axi_s_w_last_consumed_data;
reg  axi_s_w_last_consumed_taken;
wire [23:0] gv_write_init_check_i_bit_concat10_bit_select_operand_0;
wire [1:0] gv_write_init_check_i_bit_concat9_bit_select_operand_0;
wire [3:0] gv_write_init_check_i_bit_concat9_bit_select_operand_4;
wire [3:0] gv_write_init_check_i_bit_concat7_bit_select_operand_0;
wire [28:0] gv_write_init_check_i_bit_concat5_bit_select_operand_0;
wire [62:0] gv_write_init_check_i_bit_concat3_bit_select_operand_0;
reg  axi_s_b_resp_gv_write_state_1_not_accessed_due_to_stall_a;
reg  axi_s_b_resp_gv_write_state_1_stalln_reg;
reg  axi_s_b_resp_gv_write_state_1_enable_cond_a;
wire [6:0] gv_write_init_check_i_bit_concat_bit_select_operand_0;


always @(*) begin
		gv_write_init_check_i_0 = axi_s_write_state_inferred_reg;
end
always @(*) begin
		gv_write_init_check_i_1 = axi_s_write_word_addr_inferred_reg;
end
always @(*) begin
		gv_write_init_check_i_2 = axi_s_write_count_inferred_reg;
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask = (gv_write_init_check_i_0 ^ 1'd1);
end
assign gv_write_init_check_i_3 = ~(axi_s_aw_addr_consumed_valid);
always @(*) begin
		gv_write_init_check_i_exitMask_T = (gv_write_init_check_i_3 & gv_write_init_check_i_CaseCmpExitMask);
end
always @(*) begin
		gv_write_init_check_i_NotCondition = (gv_write_init_check_i_3 ^ 1'd1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_F = (gv_write_init_check_i_CaseCmpExitMask & gv_write_init_check_i_NotCondition);
end
assign gv_write_init_check_i_4 = ~(axi_s_w_data_consumed_valid);
always @(*) begin
		gv_write_init_check_i_exitMask_T2 = (gv_write_init_check_i_0 & gv_write_init_check_i_4);
end
always @(*) begin
		gv_write_init_check_i_NotCondition3 = (gv_write_init_check_i_4 ^ 1'd1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_F4 = (gv_write_init_check_i_0 & gv_write_init_check_i_NotCondition3);
end
always @(*) begin
	gv_write_init_check_i_5 = axi_s_aw_addr_consumed_data;
end
always @(*) begin
		gv_write_init_check_i_bit_select11 = gv_write_init_check_i_5[31:3];
end
always @(*) begin
		gv_write_init_check_i_bit_concat12 = {gv_write_init_check_i_bit_concat12_bit_select_operand_0[2:0], gv_write_init_check_i_bit_select11[28:0]};
end
always @(*) begin
	gv_write_init_check_i_9 = axi_s_w_data_consumed_data;
end
always @(*) begin
		gv_write_init_check_i_bit_select2 = gv_write_init_check_i_9[0];
end
always @(*) begin
		gv_write_init_check_i_bit_select1 = gv_write_init_check_i_9[31:0];
end
always @(*) begin
		gv_write_init_check_i_bit_select = gv_write_init_check_i_9[63:32];
end
always @(*) begin
	gv_write_init_check_i_10 = axi_s_w_strb_consumed_data;
end
always @(*) begin
		gv_write_init_check_i_bit_select8 = gv_write_init_check_i_10[5:4];
end
always @(*) begin
		gv_write_init_check_i_bit_select6 = gv_write_init_check_i_10[3:0];
end
always @(*) begin
	gv_write_init_check_i_11 = axi_s_w_last_consumed_data;
end
always @(*) begin
		gv_write_init_check_i_not_1 = (gv_write_init_check_i_11 ^ 1'd1);
end
always @(*) begin
		gv_write_init_check_i_bit_concat10 = {gv_write_init_check_i_bit_concat10_bit_select_operand_0[23:0], gv_write_init_check_i_2[7:0]};
end
always @(*) begin
		gv_write_init_check_i_12 = (gv_write_init_check_i_1 + {24'd0,gv_write_init_check_i_bit_concat10_reg_stage1});
end
always @(*) begin
		gv_write_init_check_i_bit_select4 = gv_write_init_check_i_12[2:0];
end
always @(*) begin
		gv_write_init_check_i_cmp_i = (gv_write_init_check_i_10 > -8'd65);
end
always @(*) begin
		gv_write_init_check_i_bit_concat9 = {{gv_write_init_check_i_bit_concat9_bit_select_operand_0[1:0], gv_write_init_check_i_bit_select8[1:0]}, gv_write_init_check_i_bit_concat9_bit_select_operand_4[3:0]};
end
always @(*) begin
		gv_write_init_check_i_cmp43_i = ({2'd0,gv_write_init_check_i_bit_concat9} == 8'd48);
end
always @(*) begin
		gv_write_init_check_i_and164_i = (gv_write_init_check_i_cmp_i & gv_write_init_check_i_cmp43_i);
end
always @(*) begin
		gv_write_init_check_i_bit_concat7 = {gv_write_init_check_i_bit_concat7_bit_select_operand_0[3:0], gv_write_init_check_i_bit_select6[3:0]};
end
always @(*) begin
		gv_write_init_check_i_13 = ({4'd0,gv_write_init_check_i_bit_concat7} == 8'd15);
end
always @(*) begin
		gv_write_init_check_i_bit_concat5 = {gv_write_init_check_i_bit_concat5_bit_select_operand_0[28:0], gv_write_init_check_i_bit_select4[2:0]};
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask5 = ({29'd0,gv_write_init_check_i_bit_concat5} == 32'd0);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask6 = ({29'd0,gv_write_init_check_i_bit_concat5} == 32'd1);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask7 = ({29'd0,gv_write_init_check_i_bit_concat5} == 32'd2);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask8 = ({29'd0,gv_write_init_check_i_bit_concat5} == 32'd3);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask9 = ({29'd0,gv_write_init_check_i_bit_concat5} == 32'd4);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask5_AndEntryMas = (gv_write_init_check_i_exitMask_F4_reg_stage1 & gv_write_init_check_i_CaseCmpExitMask5);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask6_AndEntryMas = (gv_write_init_check_i_exitMask_F4_reg_stage1 & gv_write_init_check_i_CaseCmpExitMask6);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask7_AndEntryMas = (gv_write_init_check_i_exitMask_F4_reg_stage1 & gv_write_init_check_i_CaseCmpExitMask7);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask8_AndEntryMas = (gv_write_init_check_i_exitMask_F4_reg_stage1 & gv_write_init_check_i_CaseCmpExitMask8);
end
always @(*) begin
		gv_write_init_check_i_CaseCmpExitMask9_AndEntryMas = (gv_write_init_check_i_exitMask_F4_reg_stage1 & gv_write_init_check_i_CaseCmpExitMask9);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T15 = (gv_write_init_check_i_CaseCmpExitMask5_AndEntryMas & gv_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T18 = (gv_write_init_check_i_CaseCmpExitMask6_AndEntryMas & gv_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T21 = (gv_write_init_check_i_CaseCmpExitMask7_AndEntryMas & gv_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T24 = (gv_write_init_check_i_CaseCmpExitMask8_AndEntryMas & gv_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_bit_concat3 = {gv_write_init_check_i_bit_concat3_bit_select_operand_0[62:0], gv_write_init_check_i_bit_select2};
end
always @(*) begin
		gv_write_init_check_i_14 = (gv_write_init_check_i_bit_concat3 != 64'd0);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T27 = (gv_write_init_check_i_CaseCmpExitMask5_AndEntryMas & gv_write_init_check_i_and164_i_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T30 = (gv_write_init_check_i_CaseCmpExitMask6_AndEntryMas & gv_write_init_check_i_and164_i_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T33 = (gv_write_init_check_i_CaseCmpExitMask7_AndEntryMas & gv_write_init_check_i_and164_i_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T36 = (gv_write_init_check_i_CaseCmpExitMask8_AndEntryMas & gv_write_init_check_i_and164_i_reg_stage1);
end
always @(*) begin
		gv_write_init_check_i_exitMask_T39 = (gv_write_init_check_i_exitMask_F4 & gv_write_init_check_i_11);
end
always @(*) begin
		gv_write_init_check_i_select65 = (gv_write_init_check_i_0 | gv_write_init_check_i_NotCondition);
end
always @(*) begin
		gv_write_init_check_i_1_var1 = (gv_write_init_check_i_exitMask_T2 | gv_write_init_check_i_not_1);
end
always @(*) begin
		gv_write_init_check_i_select67 = (gv_write_init_check_i_0 & gv_write_init_check_i_1_var1);
end
always @(*) begin
		gv_write_init_check_i_select69 = (gv_write_init_check_i_0 ? gv_write_init_check_i_select67 : gv_write_init_check_i_select65);
end
always @(*) begin
		gv_write_init_check_i_select55 = (gv_write_init_check_i_exitMask_T_reg_stage1 ? gv_write_init_check_i_1 : {3'd0,gv_write_init_check_i_bit_concat12_reg_stage1});
end
always @(*) begin
		gv_write_init_check_i_select59 = (gv_write_init_check_i_0_reg_stage1 ? gv_write_init_check_i_1 : gv_write_init_check_i_select55);
end
always @(*) begin
		gv_write_init_check_i_select45 = (gv_write_init_check_i_exitMask_T ? gv_write_init_check_i_2 : 8'd0);
end
always @(*) begin
		gv_write_init_check_i_bit_concat = {gv_write_init_check_i_bit_concat_bit_select_operand_0[6:0], gv_write_init_check_i_exitMask_T2};
end
always @(*) begin
		gv_write_init_check_i_15 = (gv_write_init_check_i_bit_concat ^ 8'd1);
end
always @(*) begin
		gv_write_init_check_i_select47 = (gv_write_init_check_i_2 + gv_write_init_check_i_15);
end
always @(*) begin
		gv_write_init_check_i_select49 = (gv_write_init_check_i_0 ? gv_write_init_check_i_select47 : gv_write_init_check_i_select45);
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_write_state_inferred_reg <= 1'd0;
	end
	if ((gv_write_state_enable_0 & 1'd1)) begin
		axi_s_write_state_inferred_reg <= gv_write_init_check_i_select69;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_write_word_addr_inferred_reg <= 32'd0;
	end
	if ((gv_write_state_enable_1 & 1'd1)) begin
		axi_s_write_word_addr_inferred_reg <= gv_write_init_check_i_select59;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_write_count_inferred_reg <= 8'd0;
	end
	if ((gv_write_state_enable_0 & 1'd1)) begin
		axi_s_write_count_inferred_reg <= gv_write_init_check_i_select49;
	end
end
always @(posedge clk) begin
	if (~(gv_write_state_stall_0)) begin
		gv_write_valid_bit_0 <= (gv_write_II_counter & start);
	end
	if (reset) begin
		gv_write_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	gv_write_state_stall_0 = 1'd0;
	if (gv_write_state_stall_1) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F) & ~(axi_s_aw_addr_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F) & ~(axi_s_aw_burst_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F) & ~(axi_s_aw_size_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F) & ~(axi_s_aw_len_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F4) & ~(axi_s_w_data_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F4) & ~(axi_s_w_strb_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
	if (((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F4) & ~(axi_s_w_last_consumed_valid))) begin
		gv_write_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	gv_write_state_enable_0 = (gv_write_valid_bit_0 & ~(gv_write_state_stall_0));
end
always @(posedge clk) begin
	if (~(gv_write_state_stall_1)) begin
		gv_write_valid_bit_1 <= gv_write_state_enable_0;
	end
	if (reset) begin
		gv_write_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	gv_write_state_stall_1 = 1'd0;
	if (gv_write_state_stall_2) begin
		gv_write_state_stall_1 = 1'd1;
	end
	if ((((gv_write_valid_bit_1 & s_b_resp_valid) & ~(s_b_resp_ready)) & (axi_s_b_resp_gv_write_state_1_not_accessed_due_to_stall_a | axi_s_b_resp_gv_write_state_1_stalln_reg))) begin
		gv_write_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	gv_write_state_enable_1 = (gv_write_valid_bit_1 & ~(gv_write_state_stall_1));
end
always @(posedge clk) begin
	if (~(gv_write_state_stall_2)) begin
		gv_write_valid_bit_2 <= gv_write_state_enable_1;
	end
	if (reset) begin
		gv_write_valid_bit_2 <= 1'd0;
	end
end
assign gv_write_state_stall_2 = 1'd0;
always @(*) begin
	gv_write_state_enable_2 = (gv_write_valid_bit_2 & ~(gv_write_state_stall_2));
end
always @(posedge clk) begin
	gv_write_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_0_reg_stage1 <= gv_write_init_check_i_0;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_exitMask_T_reg_stage1 <= gv_write_init_check_i_exitMask_T;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_exitMask_F4_reg_stage1 <= gv_write_init_check_i_exitMask_F4;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_bit_concat12_reg_stage1 <= gv_write_init_check_i_bit_concat12;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_bit_select1_reg_stage1 <= gv_write_init_check_i_bit_select1;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_bit_select_reg_stage1 <= gv_write_init_check_i_bit_select;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_bit_concat10_reg_stage1 <= gv_write_init_check_i_bit_concat10;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_and164_i_reg_stage1 <= gv_write_init_check_i_and164_i;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_13_reg_stage1 <= gv_write_init_check_i_13;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_14_reg_stage1 <= gv_write_init_check_i_14;
	end
end
always @(posedge clk) begin
	if (gv_write_state_enable_0) begin
		gv_write_init_check_i_exitMask_T39_reg_stage1 <= gv_write_init_check_i_exitMask_T39;
	end
end
always @(posedge clk) begin
	if (axi_s_aw_addr_consumed_taken) begin
		axi_s_aw_addr_consumed_valid <= 1'd0;
	end
	if ((axi_s_aw_ready & axi_s_aw_valid)) begin
		axi_s_aw_addr_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_aw_addr_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((axi_s_aw_ready & axi_s_aw_valid)) begin
		axi_s_aw_addr_consumed_data <= s_aw_addr;
	end
	if (reset) begin
		axi_s_aw_addr_consumed_data <= 1'd0;
	end
end
always @(*) begin
	axi_s_aw_addr_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F)) begin
		axi_s_aw_addr_consumed_taken = ~(gv_write_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_w_data_consumed_taken) begin
		axi_s_w_data_consumed_valid <= 1'd0;
	end
	if ((axi_s_w_ready & axi_s_w_valid)) begin
		axi_s_w_data_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_w_data_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((axi_s_w_ready & axi_s_w_valid)) begin
		axi_s_w_data_consumed_data <= s_w_data;
	end
	if (reset) begin
		axi_s_w_data_consumed_data <= 1'd0;
	end
end
always @(*) begin
	axi_s_w_data_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F4)) begin
		axi_s_w_data_consumed_taken = ~(gv_write_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_aw_burst_consumed_taken) begin
		axi_s_aw_burst_consumed_valid <= 1'd0;
	end
	if ((axi_s_aw_ready & axi_s_aw_valid)) begin
		axi_s_aw_burst_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_aw_burst_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	axi_s_aw_burst_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F)) begin
		axi_s_aw_burst_consumed_taken = ~(gv_write_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_aw_size_consumed_taken) begin
		axi_s_aw_size_consumed_valid <= 1'd0;
	end
	if ((axi_s_aw_ready & axi_s_aw_valid)) begin
		axi_s_aw_size_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_aw_size_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	axi_s_aw_size_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F)) begin
		axi_s_aw_size_consumed_taken = ~(gv_write_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_aw_len_consumed_taken) begin
		axi_s_aw_len_consumed_valid <= 1'd0;
	end
	if ((axi_s_aw_ready & axi_s_aw_valid)) begin
		axi_s_aw_len_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_aw_len_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	axi_s_aw_len_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F)) begin
		axi_s_aw_len_consumed_taken = ~(gv_write_state_stall_0);
	end
end
assign gv_write_init_check_i_bit_concat12_bit_select_operand_0 = 3'd0;
always @(posedge clk) begin
	if (axi_s_w_strb_consumed_taken) begin
		axi_s_w_strb_consumed_valid <= 1'd0;
	end
	if ((axi_s_w_ready & axi_s_w_valid)) begin
		axi_s_w_strb_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_w_strb_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((axi_s_w_ready & axi_s_w_valid)) begin
		axi_s_w_strb_consumed_data <= s_w_strb;
	end
	if (reset) begin
		axi_s_w_strb_consumed_data <= 1'd0;
	end
end
always @(*) begin
	axi_s_w_strb_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F4)) begin
		axi_s_w_strb_consumed_taken = ~(gv_write_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_w_last_consumed_taken) begin
		axi_s_w_last_consumed_valid <= 1'd0;
	end
	if ((axi_s_w_ready & axi_s_w_valid)) begin
		axi_s_w_last_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_w_last_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((axi_s_w_ready & axi_s_w_valid)) begin
		axi_s_w_last_consumed_data <= s_w_last;
	end
	if (reset) begin
		axi_s_w_last_consumed_data <= 1'd0;
	end
end
always @(*) begin
	axi_s_w_last_consumed_taken = 1'd0;
	if ((gv_write_valid_bit_0 & gv_write_init_check_i_exitMask_F4)) begin
		axi_s_w_last_consumed_taken = ~(gv_write_state_stall_0);
	end
end
assign gv_write_init_check_i_bit_concat10_bit_select_operand_0 = 24'd0;
assign gv_write_init_check_i_bit_concat9_bit_select_operand_0 = 2'd0;
assign gv_write_init_check_i_bit_concat9_bit_select_operand_4 = 4'd0;
assign gv_write_init_check_i_bit_concat7_bit_select_operand_0 = 4'd0;
assign gv_write_init_check_i_bit_concat5_bit_select_operand_0 = 29'd0;
assign gv_write_init_check_i_bit_concat3_bit_select_operand_0 = 63'd0;
always @(posedge clk) begin
	axi_s_b_resp_gv_write_state_1_not_accessed_due_to_stall_a <= ((gv_write_state_stall_1 & s_b_resp_valid) & ~(s_b_resp_ready));
end
always @(posedge clk) begin
	axi_s_b_resp_gv_write_state_1_stalln_reg <= ~(gv_write_state_stall_1);
end
always @(*) begin
	axi_s_b_resp_gv_write_state_1_enable_cond_a = (gv_write_valid_bit_1 & (axi_s_b_resp_gv_write_state_1_not_accessed_due_to_stall_a | axi_s_b_resp_gv_write_state_1_stalln_reg));
end
assign gv_write_init_check_i_bit_concat_bit_select_operand_0 = 7'd0;
always @(*) begin
	ready = ~(gv_write_state_stall_0);
end
always @(posedge clk) begin
	finish <= gv_write_state_enable_2;
end
always @(*) begin
	axi_s_aw_ready = (~(axi_s_aw_len_consumed_valid) | axi_s_aw_len_consumed_taken);
	if (reset) begin
		axi_s_aw_ready = 1'd0;
	end
	if (reset) begin
		axi_s_aw_ready = 1'd0;
	end
	if (reset) begin
		axi_s_aw_ready = 1'd0;
	end
	if (reset) begin
		axi_s_aw_ready = 1'd0;
	end
end
always @(*) begin
	axi_s_w_ready = (~(axi_s_w_last_consumed_valid) | axi_s_w_last_consumed_taken);
	if (reset) begin
		axi_s_w_ready = 1'd0;
	end
	if (reset) begin
		axi_s_w_ready = 1'd0;
	end
	if (reset) begin
		axi_s_w_ready = 1'd0;
	end
end
always @(*) begin
	gv_ctrl_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_CaseCmpExitMask9_AndEntryMas)) begin
		gv_ctrl_write_en = 1'd1;
	end
end
always @(*) begin
	gv_ctrl_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_CaseCmpExitMask9_AndEntryMas)) begin
		gv_ctrl_write_data = gv_write_init_check_i_14_reg_stage1;
	end
end
always @(*) begin
	gv_AX_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T15)) begin
		gv_AX_write_en = 1'd1;
	end
end
always @(*) begin
	gv_AX_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T15)) begin
		gv_AX_write_data = gv_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	gv_BX_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T18)) begin
		gv_BX_write_en = 1'd1;
	end
end
always @(*) begin
	gv_BX_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T18)) begin
		gv_BX_write_data = gv_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	gv_DX1DY_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T21)) begin
		gv_DX1DY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_DX1DY_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T21)) begin
		gv_DX1DY_write_data = gv_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	gv_DX2DY_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T24)) begin
		gv_DX2DY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_DX2DY_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T24)) begin
		gv_DX2DY_write_data = gv_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	gv_AY_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T27)) begin
		gv_AY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_AY_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T27)) begin
		gv_AY_write_data = gv_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	gv_BY_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T30)) begin
		gv_BY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_BY_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T30)) begin
		gv_BY_write_data = gv_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	gv_DY1DY_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T33)) begin
		gv_DY1DY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_DY1DY_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T33)) begin
		gv_DY1DY_write_data = gv_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	gv_DY2DY_write_en = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T36)) begin
		gv_DY2DY_write_en = 1'd1;
	end
end
always @(*) begin
	gv_DY2DY_write_data = 1'd0;
	if ((gv_write_state_enable_1 & gv_write_init_check_i_exitMask_T36)) begin
		gv_DY2DY_write_data = gv_write_init_check_i_bit_select_reg_stage1;
	end
end
assign s_b_resp = 2'd0;
always @(*) begin
	s_b_resp_valid = 1'd0;
	if ((axi_s_b_resp_gv_write_state_1_enable_cond_a & gv_write_init_check_i_exitMask_T39_reg_stage1)) begin
		s_b_resp_valid = 1'd1;
	end
end

endmodule
`timescale 1 ns / 1 ns
module gv_read
(
	clk,
	reset,
	start,
	ready,
	finish,
	s_ar_addr,
	axi_s_ar_ready,
	axi_s_ar_valid,
	s_ar_burst,
	s_ar_size,
	s_ar_len,
	gv_AY_write_en,
	gv_AY_write_data,
	gv_AY_read_data,
	gv_AX_write_en,
	gv_AX_write_data,
	gv_AX_read_data,
	gv_BY_write_en,
	gv_BY_write_data,
	gv_BY_read_data,
	gv_BX_write_en,
	gv_BX_write_data,
	gv_BX_read_data,
	gv_DY1DY_write_en,
	gv_DY1DY_write_data,
	gv_DY1DY_read_data,
	gv_DX1DY_write_en,
	gv_DX1DY_write_data,
	gv_DX1DY_read_data,
	gv_DY2DY_write_en,
	gv_DY2DY_write_data,
	gv_DY2DY_read_data,
	gv_DX2DY_write_en,
	gv_DX2DY_write_data,
	gv_DX2DY_read_data,
	gv_ctrl_write_en,
	gv_ctrl_write_data,
	gv_ctrl_read_data,
	s_r_data,
	axi_s_r_ready,
	axi_s_r_valid,
	s_r_resp,
	s_r_last
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [31:0] s_ar_addr;
output reg  axi_s_ar_ready;
input  axi_s_ar_valid;
input [1:0] s_ar_burst;
input [2:0] s_ar_size;
input [7:0] s_ar_len;
output  gv_AY_write_en;
output [31:0] gv_AY_write_data;
input [31:0] gv_AY_read_data;
output  gv_AX_write_en;
output [31:0] gv_AX_write_data;
input [31:0] gv_AX_read_data;
output  gv_BY_write_en;
output [31:0] gv_BY_write_data;
input [31:0] gv_BY_read_data;
output  gv_BX_write_en;
output [31:0] gv_BX_write_data;
input [31:0] gv_BX_read_data;
output  gv_DY1DY_write_en;
output [31:0] gv_DY1DY_write_data;
input [31:0] gv_DY1DY_read_data;
output  gv_DX1DY_write_en;
output [31:0] gv_DX1DY_write_data;
input [31:0] gv_DX1DY_read_data;
output  gv_DY2DY_write_en;
output [31:0] gv_DY2DY_write_data;
input [31:0] gv_DY2DY_read_data;
output  gv_DX2DY_write_en;
output [31:0] gv_DX2DY_write_data;
input [31:0] gv_DX2DY_read_data;
output  gv_ctrl_write_en;
output  gv_ctrl_write_data;
input  gv_ctrl_read_data;
output reg [63:0] s_r_data;
input  axi_s_r_ready;
output reg  axi_s_r_valid;
output [1:0] s_r_resp;
output reg  s_r_last;
reg  gv_read_init_check_i_0;
reg [31:0] gv_read_init_check_i_1;
reg [7:0] gv_read_init_check_i_2;
reg [7:0] gv_read_init_check_i_3;
reg  gv_read_init_check_i_CaseCmpExitMask;
reg [7:0] gv_read_init_check_i_4;
reg  gv_read_init_check_i_5;
reg  gv_read_init_check_i_not_1;
reg  gv_read_init_check_i_1_var2;
reg [7:0] gv_read_init_check_i_bit_concat10;
reg [31:0] gv_read_init_check_i_6;
reg [2:0] gv_read_init_check_i_bit_select8;
reg [1:0] gv_read_init_check_i_bit_select6;
reg [2:0] gv_read_init_check_i_bit_concat9;
reg  gv_read_init_check_i_CaseCmpExitMask2;
reg  gv_read_init_check_i_CaseCmpExitMask3;
reg  gv_read_init_check_i_CaseCmpExitMask4;
reg  gv_read_init_check_i_CaseCmpExitMask6;
reg [2:0] gv_read_init_check_i_bit_concat7;
reg  gv_read_init_check_i_7;
reg  gv_read_init_check_i_8;
reg  gv_read_init_check_i_OrCaseExitMask9;
reg  gv_read_init_check_i_OrCaseExitMask10;
reg  gv_read_init_check_i_CaseDefaultCond11;
reg  gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask;
reg  gv_read_init_check_i_CaseCmpExitMask3_AndEntryMask;
reg  gv_read_init_check_i_CaseCmpExitMask4_AndEntryMask;
reg  gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask;
reg  gv_read_init_check_i_CaseDefaultCond11_AndEntryMas;
wire  gv_read_init_check_i_9;
reg  gv_read_init_check_i_exitMask_T;
reg  gv_read_init_check_i_NotCondition;
reg  gv_read_init_check_i_exitMask_F;
reg [31:0] gv_read_init_check_i_10;
reg [28:0] gv_read_init_check_i_bit_select;
reg [7:0] gv_read_init_check_i_13;
reg [28:0] gv_read_init_check_i_bit_concat5;
reg [31:0] gv_read_init_check_i_14;
reg [31:0] gv_read_init_check_i_15;
reg [63:0] gv_read_init_check_i_bit_concat4;
reg [31:0] gv_read_init_check_i_16;
reg [31:0] gv_read_init_check_i_17;
reg [63:0] gv_read_init_check_i_bit_concat3;
reg [31:0] gv_read_init_check_i_18;
reg [31:0] gv_read_init_check_i_19;
reg [63:0] gv_read_init_check_i_bit_concat2;
reg [31:0] gv_read_init_check_i_20;
reg [31:0] gv_read_init_check_i_21;
reg [63:0] gv_read_init_check_i_bit_concat1;
reg  gv_read_init_check_i_22;
reg  gv_read_init_check_i_bit_concat;
reg  gv_read_init_check_i_ORexitM;
reg [63:0] gv_read_init_check_i_select;
reg [63:0] gv_read_init_check_i_select13;
reg  gv_read_init_check_i_ORexitM14;
reg  gv_read_init_check_i_select15;
reg [63:0] gv_read_init_check_i_select17;
reg [63:0] gv_read_init_check_i_select19;
reg  gv_read_init_check_i_select41;
reg  gv_read_init_check_i_select43;
reg [31:0] gv_read_init_check_i_select35;
reg [31:0] gv_read_init_check_i_select37;
reg [7:0] gv_read_init_check_i_select29;
reg [7:0] gv_read_init_check_i_select31;
reg [7:0] gv_read_init_check_i_select23;
reg [7:0] gv_read_init_check_i_select25;
reg  axi_s_read_state_inferred_reg;
reg [31:0] axi_s_read_word_addr_inferred_reg;
reg [7:0] axi_s_read_burst_len_minus1_inferred_reg;
reg [7:0] axi_s_read_count_inferred_reg;
reg  gv_read_valid_bit_0;
reg  gv_read_state_stall_0;
reg  gv_read_state_enable_0;
reg  gv_read_valid_bit_1;
reg  gv_read_state_stall_1;
reg  gv_read_state_enable_1;
reg  gv_read_valid_bit_2;
reg  gv_read_state_stall_2;
reg  gv_read_state_enable_2;
reg  gv_read_valid_bit_3;
reg  gv_read_state_stall_3;
reg  gv_read_state_enable_3;
reg  gv_read_valid_bit_4;
reg  gv_read_state_stall_4;
reg  gv_read_state_enable_4;
reg  gv_read_II_counter;
reg  gv_read_init_check_i_0_reg_stage1;
reg  gv_read_init_check_i_0_reg_stage2;
reg  gv_read_init_check_i_0_reg_stage3;
reg  gv_read_init_check_i_0_reg_stage4;
reg  gv_read_init_check_i_5_reg_stage1;
reg  gv_read_init_check_i_5_reg_stage2;
reg  gv_read_init_check_i_5_reg_stage3;
reg  gv_read_init_check_i_5_reg_stage4;
reg [7:0] gv_read_init_check_i_bit_concat10_reg_stage1;
reg  gv_read_init_check_i_OrCaseExitMask10_reg_stage2;
reg  gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask_reg_stage2;
reg  gv_read_init_check_i_CaseCmpExitMask4_AndEntryMask_reg_stage2;
reg  gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask_reg_stage2;
reg  gv_read_init_check_i_exitMask_T_reg_stage1;
reg [28:0] gv_read_init_check_i_bit_concat5_reg_stage1;
reg [63:0] gv_read_init_check_i_bit_concat4_reg_stage2;
reg [63:0] gv_read_init_check_i_bit_concat3_reg_stage2;
reg [63:0] gv_read_init_check_i_bit_concat2_reg_stage2;
reg [63:0] gv_read_init_check_i_bit_concat1_reg_stage2;
reg  gv_read_init_check_i_bit_concat_reg_stage2;
reg  gv_read_init_check_i_ORexitM_reg_stage2;
reg  gv_read_init_check_i_ORexitM_reg_stage3;
reg [63:0] gv_read_init_check_i_select_reg_stage3;
reg [63:0] gv_read_init_check_i_select13_reg_stage3;
reg  gv_read_init_check_i_ORexitM14_reg_stage3;
reg  gv_read_init_check_i_ORexitM14_reg_stage4;
reg  gv_read_init_check_i_select15_reg_stage3;
reg  gv_read_init_check_i_select15_reg_stage4;
reg [63:0] gv_read_init_check_i_select17_reg_stage4;
wire [23:0] gv_read_init_check_i_bit_concat10_bit_select_operand_0;
wire [28:0] gv_read_init_check_i_bit_concat9_bit_select_operand_0;
wire [28:0] gv_read_init_check_i_bit_concat7_bit_select_operand_0;
wire  gv_read_init_check_i_bit_concat7_bit_select_operand_4;
reg  axi_s_ar_addr_consumed_valid;
reg [31:0] axi_s_ar_addr_consumed_data;
reg  axi_s_ar_addr_consumed_taken;
reg  axi_s_ar_burst_consumed_valid;
reg  axi_s_ar_burst_consumed_taken;
reg  axi_s_ar_size_consumed_valid;
reg  axi_s_ar_size_consumed_taken;
reg  axi_s_ar_len_consumed_valid;
reg [7:0] axi_s_ar_len_consumed_data;
reg  axi_s_ar_len_consumed_taken;
wire [2:0] gv_read_init_check_i_bit_concat5_bit_select_operand_0;
wire [62:0] gv_read_init_check_i_bit_concat_bit_select_operand_0;
reg  axi_s_r_data_gv_read_state_4_not_accessed_due_to_stall_a;
reg  axi_s_r_data_gv_read_state_4_stalln_reg;
reg  axi_s_r_data_gv_read_state_4_enable_cond_a;
reg  axi_s_r_resp_gv_read_state_4_not_accessed_due_to_stall_a;
reg  axi_s_r_resp_gv_read_state_4_stalln_reg;
reg  axi_s_r_resp_gv_read_state_4_enable_cond_a;
reg  axi_s_r_last_gv_read_state_4_not_accessed_due_to_stall_a;
reg  axi_s_r_last_gv_read_state_4_stalln_reg;
reg  axi_s_r_last_gv_read_state_4_enable_cond_a;


always @(*) begin
		gv_read_init_check_i_0 = axi_s_read_state_inferred_reg;
end
always @(*) begin
		gv_read_init_check_i_1 = axi_s_read_word_addr_inferred_reg;
end
always @(*) begin
		gv_read_init_check_i_2 = axi_s_read_burst_len_minus1_inferred_reg;
end
always @(*) begin
		gv_read_init_check_i_3 = axi_s_read_count_inferred_reg;
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask = (gv_read_init_check_i_0 ^ 1'd1);
end
always @(*) begin
		gv_read_init_check_i_4 = (gv_read_init_check_i_3 + 8'd1);
end
always @(*) begin
		gv_read_init_check_i_5 = (gv_read_init_check_i_3 == gv_read_init_check_i_2);
end
always @(*) begin
		gv_read_init_check_i_not_1 = (gv_read_init_check_i_5 ^ 1'd1);
end
always @(*) begin
		gv_read_init_check_i_1_var2 = (gv_read_init_check_i_0 & gv_read_init_check_i_not_1);
end
always @(*) begin
		gv_read_init_check_i_bit_concat10 = {gv_read_init_check_i_bit_concat10_bit_select_operand_0[23:0], gv_read_init_check_i_3[7:0]};
end
always @(*) begin
		gv_read_init_check_i_6 = (gv_read_init_check_i_1 + {24'd0,gv_read_init_check_i_bit_concat10_reg_stage1});
end
always @(*) begin
		gv_read_init_check_i_bit_select8 = gv_read_init_check_i_6[2:0];
end
always @(*) begin
		gv_read_init_check_i_bit_select6 = gv_read_init_check_i_6[2:1];
end
always @(*) begin
		gv_read_init_check_i_bit_concat9 = {gv_read_init_check_i_bit_concat9_bit_select_operand_0[28:0], gv_read_init_check_i_bit_select8[2:0]};
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask2 = ({29'd0,gv_read_init_check_i_bit_concat9} == 32'd0);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask3 = ({29'd0,gv_read_init_check_i_bit_concat9} == 32'd1);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask4 = ({29'd0,gv_read_init_check_i_bit_concat9} == 32'd2);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask6 = ({29'd0,gv_read_init_check_i_bit_concat9} == 32'd4);
end
always @(*) begin
		gv_read_init_check_i_bit_concat7 = {{gv_read_init_check_i_bit_concat7_bit_select_operand_0[28:0], gv_read_init_check_i_bit_select6[1:0]}, gv_read_init_check_i_bit_concat7_bit_select_operand_4};
end
always @(*) begin
		gv_read_init_check_i_7 = ({29'd0,gv_read_init_check_i_bit_concat7} == 32'd0);
end
always @(*) begin
		gv_read_init_check_i_8 = ({29'd0,gv_read_init_check_i_bit_concat7} == 32'd2);
end
always @(*) begin
		gv_read_init_check_i_OrCaseExitMask9 = (gv_read_init_check_i_CaseCmpExitMask6 | gv_read_init_check_i_7);
end
always @(*) begin
		gv_read_init_check_i_OrCaseExitMask10 = (gv_read_init_check_i_8 | gv_read_init_check_i_OrCaseExitMask9);
end
always @(*) begin
		gv_read_init_check_i_CaseDefaultCond11 = (gv_read_init_check_i_OrCaseExitMask10_reg_stage2 ^ 1'd1);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask = (gv_read_init_check_i_0_reg_stage1 & gv_read_init_check_i_CaseCmpExitMask2);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask3_AndEntryMask = (gv_read_init_check_i_0_reg_stage1 & gv_read_init_check_i_CaseCmpExitMask3);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask4_AndEntryMask = (gv_read_init_check_i_0_reg_stage1 & gv_read_init_check_i_CaseCmpExitMask4);
end
always @(*) begin
		gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask = (gv_read_init_check_i_0_reg_stage1 & gv_read_init_check_i_CaseCmpExitMask6);
end
always @(*) begin
		gv_read_init_check_i_CaseDefaultCond11_AndEntryMas = (gv_read_init_check_i_0_reg_stage2 & gv_read_init_check_i_CaseDefaultCond11);
end
assign gv_read_init_check_i_9 = ~(axi_s_ar_addr_consumed_valid);
always @(*) begin
		gv_read_init_check_i_exitMask_T = (gv_read_init_check_i_9 & gv_read_init_check_i_CaseCmpExitMask);
end
always @(*) begin
		gv_read_init_check_i_NotCondition = (gv_read_init_check_i_9 ^ 1'd1);
end
always @(*) begin
		gv_read_init_check_i_exitMask_F = (gv_read_init_check_i_CaseCmpExitMask & gv_read_init_check_i_NotCondition);
end
always @(*) begin
	gv_read_init_check_i_10 = axi_s_ar_addr_consumed_data;
end
always @(*) begin
		gv_read_init_check_i_bit_select = gv_read_init_check_i_10[31:3];
end
always @(*) begin
	gv_read_init_check_i_13 = axi_s_ar_len_consumed_data;
end
always @(*) begin
		gv_read_init_check_i_bit_concat5 = {gv_read_init_check_i_bit_concat5_bit_select_operand_0[2:0], gv_read_init_check_i_bit_select[28:0]};
end
always @(*) begin
		gv_read_init_check_i_14 = gv_AY_read_data;
end
always @(*) begin
		gv_read_init_check_i_15 = gv_AX_read_data;
end
always @(*) begin
		gv_read_init_check_i_bit_concat4 = {gv_read_init_check_i_14[31:0], gv_read_init_check_i_15[31:0]};
end
always @(*) begin
		gv_read_init_check_i_16 = gv_BY_read_data;
end
always @(*) begin
		gv_read_init_check_i_17 = gv_BX_read_data;
end
always @(*) begin
		gv_read_init_check_i_bit_concat3 = {gv_read_init_check_i_16[31:0], gv_read_init_check_i_17[31:0]};
end
always @(*) begin
		gv_read_init_check_i_18 = gv_DY1DY_read_data;
end
always @(*) begin
		gv_read_init_check_i_19 = gv_DX1DY_read_data;
end
always @(*) begin
		gv_read_init_check_i_bit_concat2 = {gv_read_init_check_i_18[31:0], gv_read_init_check_i_19[31:0]};
end
always @(*) begin
		gv_read_init_check_i_20 = gv_DY2DY_read_data;
end
always @(*) begin
		gv_read_init_check_i_21 = gv_DX2DY_read_data;
end
always @(*) begin
		gv_read_init_check_i_bit_concat1 = {gv_read_init_check_i_20[31:0], gv_read_init_check_i_21[31:0]};
end
always @(*) begin
		gv_read_init_check_i_22 = gv_ctrl_read_data;
end
always @(*) begin
		gv_read_init_check_i_bit_concat = {gv_read_init_check_i_bit_concat_bit_select_operand_0[62:0], gv_read_init_check_i_22};
end
always @(*) begin
		gv_read_init_check_i_ORexitM = (gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask | gv_read_init_check_i_CaseCmpExitMask3_AndEntryMask);
end
always @(*) begin
		gv_read_init_check_i_select = (gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask_reg_stage2 ? gv_read_init_check_i_bit_concat4_reg_stage2 : gv_read_init_check_i_bit_concat3_reg_stage2);
end
always @(*) begin
		gv_read_init_check_i_select13 = (gv_read_init_check_i_CaseCmpExitMask4_AndEntryMask_reg_stage2 ? gv_read_init_check_i_bit_concat2_reg_stage2 : gv_read_init_check_i_bit_concat1_reg_stage2);
end
always @(*) begin
		gv_read_init_check_i_ORexitM14 = (gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask_reg_stage2 | gv_read_init_check_i_CaseDefaultCond11_AndEntryMas);
end
always @(*) begin
		gv_read_init_check_i_select15 = (gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask_reg_stage2 ? gv_read_init_check_i_bit_concat_reg_stage2 : 64'd0);
end
always @(*) begin
		gv_read_init_check_i_select17 = (gv_read_init_check_i_ORexitM_reg_stage3 ? gv_read_init_check_i_select_reg_stage3 : gv_read_init_check_i_select13_reg_stage3);
end
always @(*) begin
		gv_read_init_check_i_select19 = (gv_read_init_check_i_ORexitM14_reg_stage4 ? gv_read_init_check_i_select15_reg_stage4 : gv_read_init_check_i_select17_reg_stage4);
end
always @(*) begin
		gv_read_init_check_i_select41 = (gv_read_init_check_i_0 | gv_read_init_check_i_NotCondition);
end
always @(*) begin
		gv_read_init_check_i_select43 = (gv_read_init_check_i_0 ? gv_read_init_check_i_1_var2 : gv_read_init_check_i_select41);
end
always @(*) begin
		gv_read_init_check_i_select35 = (gv_read_init_check_i_exitMask_T_reg_stage1 ? gv_read_init_check_i_1 : {3'd0,gv_read_init_check_i_bit_concat5_reg_stage1});
end
always @(*) begin
		gv_read_init_check_i_select37 = (gv_read_init_check_i_0_reg_stage1 ? gv_read_init_check_i_1 : gv_read_init_check_i_select35);
end
always @(*) begin
		gv_read_init_check_i_select29 = (gv_read_init_check_i_exitMask_T ? gv_read_init_check_i_2 : gv_read_init_check_i_13);
end
always @(*) begin
		gv_read_init_check_i_select31 = (gv_read_init_check_i_0 ? gv_read_init_check_i_2 : gv_read_init_check_i_select29);
end
always @(*) begin
		gv_read_init_check_i_select23 = (gv_read_init_check_i_exitMask_T ? gv_read_init_check_i_3 : 8'd0);
end
always @(*) begin
		gv_read_init_check_i_select25 = (gv_read_init_check_i_0 ? gv_read_init_check_i_4 : gv_read_init_check_i_select23);
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_state_inferred_reg <= 1'd0;
	end
	if ((gv_read_state_enable_0 & 1'd1)) begin
		axi_s_read_state_inferred_reg <= gv_read_init_check_i_select43;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_word_addr_inferred_reg <= 32'd0;
	end
	if ((gv_read_state_enable_1 & 1'd1)) begin
		axi_s_read_word_addr_inferred_reg <= gv_read_init_check_i_select37;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_burst_len_minus1_inferred_reg <= 8'd0;
	end
	if ((gv_read_state_enable_0 & 1'd1)) begin
		axi_s_read_burst_len_minus1_inferred_reg <= gv_read_init_check_i_select31;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_count_inferred_reg <= 8'd0;
	end
	if ((gv_read_state_enable_0 & 1'd1)) begin
		axi_s_read_count_inferred_reg <= gv_read_init_check_i_select25;
	end
end
always @(posedge clk) begin
	if (~(gv_read_state_stall_0)) begin
		gv_read_valid_bit_0 <= (gv_read_II_counter & start);
	end
	if (reset) begin
		gv_read_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	gv_read_state_stall_0 = 1'd0;
	if (gv_read_state_stall_1) begin
		gv_read_state_stall_0 = 1'd1;
	end
	if (((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F) & ~(axi_s_ar_addr_consumed_valid))) begin
		gv_read_state_stall_0 = 1'd1;
	end
	if (((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F) & ~(axi_s_ar_burst_consumed_valid))) begin
		gv_read_state_stall_0 = 1'd1;
	end
	if (((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F) & ~(axi_s_ar_size_consumed_valid))) begin
		gv_read_state_stall_0 = 1'd1;
	end
	if (((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F) & ~(axi_s_ar_len_consumed_valid))) begin
		gv_read_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	gv_read_state_enable_0 = (gv_read_valid_bit_0 & ~(gv_read_state_stall_0));
end
always @(posedge clk) begin
	if (~(gv_read_state_stall_1)) begin
		gv_read_valid_bit_1 <= gv_read_state_enable_0;
	end
	if (reset) begin
		gv_read_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	gv_read_state_stall_1 = 1'd0;
	if (gv_read_state_stall_2) begin
		gv_read_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	gv_read_state_enable_1 = (gv_read_valid_bit_1 & ~(gv_read_state_stall_1));
end
always @(posedge clk) begin
	if (~(gv_read_state_stall_2)) begin
		gv_read_valid_bit_2 <= gv_read_state_enable_1;
	end
	if (reset) begin
		gv_read_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	gv_read_state_stall_2 = 1'd0;
	if (gv_read_state_stall_3) begin
		gv_read_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	gv_read_state_enable_2 = (gv_read_valid_bit_2 & ~(gv_read_state_stall_2));
end
always @(posedge clk) begin
	if (~(gv_read_state_stall_3)) begin
		gv_read_valid_bit_3 <= gv_read_state_enable_2;
	end
	if (reset) begin
		gv_read_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	gv_read_state_stall_3 = 1'd0;
	if (gv_read_state_stall_4) begin
		gv_read_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	gv_read_state_enable_3 = (gv_read_valid_bit_3 & ~(gv_read_state_stall_3));
end
always @(posedge clk) begin
	if (~(gv_read_state_stall_4)) begin
		gv_read_valid_bit_4 <= gv_read_state_enable_3;
	end
	if (reset) begin
		gv_read_valid_bit_4 <= 1'd0;
	end
end
always @(*) begin
	gv_read_state_stall_4 = 1'd0;
	if ((((gv_read_valid_bit_4 & axi_s_r_valid) & ~(axi_s_r_ready)) & (axi_s_r_data_gv_read_state_4_not_accessed_due_to_stall_a | axi_s_r_data_gv_read_state_4_stalln_reg))) begin
		gv_read_state_stall_4 = 1'd1;
	end
	if ((((gv_read_valid_bit_4 & axi_s_r_valid) & ~(axi_s_r_ready)) & (axi_s_r_resp_gv_read_state_4_not_accessed_due_to_stall_a | axi_s_r_resp_gv_read_state_4_stalln_reg))) begin
		gv_read_state_stall_4 = 1'd1;
	end
	if ((((gv_read_valid_bit_4 & axi_s_r_valid) & ~(axi_s_r_ready)) & (axi_s_r_last_gv_read_state_4_not_accessed_due_to_stall_a | axi_s_r_last_gv_read_state_4_stalln_reg))) begin
		gv_read_state_stall_4 = 1'd1;
	end
end
always @(*) begin
	gv_read_state_enable_4 = (gv_read_valid_bit_4 & ~(gv_read_state_stall_4));
end
always @(posedge clk) begin
	gv_read_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (gv_read_state_enable_0) begin
		gv_read_init_check_i_0_reg_stage1 <= gv_read_init_check_i_0;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_0_reg_stage2 <= gv_read_init_check_i_0_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_0_reg_stage3 <= gv_read_init_check_i_0_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_3) begin
		gv_read_init_check_i_0_reg_stage4 <= gv_read_init_check_i_0_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_0) begin
		gv_read_init_check_i_5_reg_stage1 <= gv_read_init_check_i_5;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_5_reg_stage2 <= gv_read_init_check_i_5_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_5_reg_stage3 <= gv_read_init_check_i_5_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_3) begin
		gv_read_init_check_i_5_reg_stage4 <= gv_read_init_check_i_5_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_0) begin
		gv_read_init_check_i_bit_concat10_reg_stage1 <= gv_read_init_check_i_bit_concat10;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_OrCaseExitMask10_reg_stage2 <= gv_read_init_check_i_OrCaseExitMask10;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask_reg_stage2 <= gv_read_init_check_i_CaseCmpExitMask2_AndEntryMask;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_CaseCmpExitMask4_AndEntryMask_reg_stage2 <= gv_read_init_check_i_CaseCmpExitMask4_AndEntryMask;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask_reg_stage2 <= gv_read_init_check_i_CaseCmpExitMask6_AndEntryMask;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_0) begin
		gv_read_init_check_i_exitMask_T_reg_stage1 <= gv_read_init_check_i_exitMask_T;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_0) begin
		gv_read_init_check_i_bit_concat5_reg_stage1 <= gv_read_init_check_i_bit_concat5;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_bit_concat4_reg_stage2 <= gv_read_init_check_i_bit_concat4;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_bit_concat3_reg_stage2 <= gv_read_init_check_i_bit_concat3;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_bit_concat2_reg_stage2 <= gv_read_init_check_i_bit_concat2;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_bit_concat1_reg_stage2 <= gv_read_init_check_i_bit_concat1;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_bit_concat_reg_stage2 <= gv_read_init_check_i_bit_concat;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_1) begin
		gv_read_init_check_i_ORexitM_reg_stage2 <= gv_read_init_check_i_ORexitM;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_ORexitM_reg_stage3 <= gv_read_init_check_i_ORexitM_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_select_reg_stage3 <= gv_read_init_check_i_select;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_select13_reg_stage3 <= gv_read_init_check_i_select13;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_ORexitM14_reg_stage3 <= gv_read_init_check_i_ORexitM14;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_3) begin
		gv_read_init_check_i_ORexitM14_reg_stage4 <= gv_read_init_check_i_ORexitM14_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_2) begin
		gv_read_init_check_i_select15_reg_stage3 <= gv_read_init_check_i_select15;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_3) begin
		gv_read_init_check_i_select15_reg_stage4 <= gv_read_init_check_i_select15_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gv_read_state_enable_3) begin
		gv_read_init_check_i_select17_reg_stage4 <= gv_read_init_check_i_select17;
	end
end
assign gv_read_init_check_i_bit_concat10_bit_select_operand_0 = 24'd0;
assign gv_read_init_check_i_bit_concat9_bit_select_operand_0 = 29'd0;
assign gv_read_init_check_i_bit_concat7_bit_select_operand_0 = 29'd0;
assign gv_read_init_check_i_bit_concat7_bit_select_operand_4 = 1'd0;
always @(posedge clk) begin
	if (axi_s_ar_addr_consumed_taken) begin
		axi_s_ar_addr_consumed_valid <= 1'd0;
	end
	if ((axi_s_ar_ready & axi_s_ar_valid)) begin
		axi_s_ar_addr_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_ar_addr_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((axi_s_ar_ready & axi_s_ar_valid)) begin
		axi_s_ar_addr_consumed_data <= s_ar_addr;
	end
	if (reset) begin
		axi_s_ar_addr_consumed_data <= 1'd0;
	end
end
always @(*) begin
	axi_s_ar_addr_consumed_taken = 1'd0;
	if ((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F)) begin
		axi_s_ar_addr_consumed_taken = ~(gv_read_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_ar_burst_consumed_taken) begin
		axi_s_ar_burst_consumed_valid <= 1'd0;
	end
	if ((axi_s_ar_ready & axi_s_ar_valid)) begin
		axi_s_ar_burst_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_ar_burst_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	axi_s_ar_burst_consumed_taken = 1'd0;
	if ((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F)) begin
		axi_s_ar_burst_consumed_taken = ~(gv_read_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_ar_size_consumed_taken) begin
		axi_s_ar_size_consumed_valid <= 1'd0;
	end
	if ((axi_s_ar_ready & axi_s_ar_valid)) begin
		axi_s_ar_size_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_ar_size_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	axi_s_ar_size_consumed_taken = 1'd0;
	if ((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F)) begin
		axi_s_ar_size_consumed_taken = ~(gv_read_state_stall_0);
	end
end
always @(posedge clk) begin
	if (axi_s_ar_len_consumed_taken) begin
		axi_s_ar_len_consumed_valid <= 1'd0;
	end
	if ((axi_s_ar_ready & axi_s_ar_valid)) begin
		axi_s_ar_len_consumed_valid <= 1'd1;
	end
	if (reset) begin
		axi_s_ar_len_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((axi_s_ar_ready & axi_s_ar_valid)) begin
		axi_s_ar_len_consumed_data <= s_ar_len;
	end
	if (reset) begin
		axi_s_ar_len_consumed_data <= 1'd0;
	end
end
always @(*) begin
	axi_s_ar_len_consumed_taken = 1'd0;
	if ((gv_read_valid_bit_0 & gv_read_init_check_i_exitMask_F)) begin
		axi_s_ar_len_consumed_taken = ~(gv_read_state_stall_0);
	end
end
assign gv_read_init_check_i_bit_concat5_bit_select_operand_0 = 3'd0;
assign gv_read_init_check_i_bit_concat_bit_select_operand_0 = 63'd0;
always @(posedge clk) begin
	axi_s_r_data_gv_read_state_4_not_accessed_due_to_stall_a <= ((gv_read_state_stall_4 & axi_s_r_valid) & ~(axi_s_r_ready));
end
always @(posedge clk) begin
	axi_s_r_data_gv_read_state_4_stalln_reg <= ~(gv_read_state_stall_4);
end
always @(*) begin
	axi_s_r_data_gv_read_state_4_enable_cond_a = (gv_read_valid_bit_4 & (axi_s_r_data_gv_read_state_4_not_accessed_due_to_stall_a | axi_s_r_data_gv_read_state_4_stalln_reg));
end
always @(posedge clk) begin
	axi_s_r_resp_gv_read_state_4_not_accessed_due_to_stall_a <= ((gv_read_state_stall_4 & axi_s_r_valid) & ~(axi_s_r_ready));
end
always @(posedge clk) begin
	axi_s_r_resp_gv_read_state_4_stalln_reg <= ~(gv_read_state_stall_4);
end
always @(*) begin
	axi_s_r_resp_gv_read_state_4_enable_cond_a = (gv_read_valid_bit_4 & (axi_s_r_resp_gv_read_state_4_not_accessed_due_to_stall_a | axi_s_r_resp_gv_read_state_4_stalln_reg));
end
always @(posedge clk) begin
	axi_s_r_last_gv_read_state_4_not_accessed_due_to_stall_a <= ((gv_read_state_stall_4 & axi_s_r_valid) & ~(axi_s_r_ready));
end
always @(posedge clk) begin
	axi_s_r_last_gv_read_state_4_stalln_reg <= ~(gv_read_state_stall_4);
end
always @(*) begin
	axi_s_r_last_gv_read_state_4_enable_cond_a = (gv_read_valid_bit_4 & (axi_s_r_last_gv_read_state_4_not_accessed_due_to_stall_a | axi_s_r_last_gv_read_state_4_stalln_reg));
end
always @(*) begin
	ready = ~(gv_read_state_stall_0);
end
always @(posedge clk) begin
	finish <= gv_read_state_enable_4;
end
always @(*) begin
	axi_s_ar_ready = (~(axi_s_ar_len_consumed_valid) | axi_s_ar_len_consumed_taken);
	if (reset) begin
		axi_s_ar_ready = 1'd0;
	end
	if (reset) begin
		axi_s_ar_ready = 1'd0;
	end
	if (reset) begin
		axi_s_ar_ready = 1'd0;
	end
	if (reset) begin
		axi_s_ar_ready = 1'd0;
	end
end
assign gv_AY_write_en = 1'd0;
assign gv_AY_write_data = 1'd0;
assign gv_AX_write_en = 1'd0;
assign gv_AX_write_data = 1'd0;
assign gv_BY_write_en = 1'd0;
assign gv_BY_write_data = 1'd0;
assign gv_BX_write_en = 1'd0;
assign gv_BX_write_data = 1'd0;
assign gv_DY1DY_write_en = 1'd0;
assign gv_DY1DY_write_data = 1'd0;
assign gv_DX1DY_write_en = 1'd0;
assign gv_DX1DY_write_data = 1'd0;
assign gv_DY2DY_write_en = 1'd0;
assign gv_DY2DY_write_data = 1'd0;
assign gv_DX2DY_write_en = 1'd0;
assign gv_DX2DY_write_data = 1'd0;
assign gv_ctrl_write_en = 1'd0;
assign gv_ctrl_write_data = 1'd0;
always @(*) begin
		s_r_data = gv_read_init_check_i_select19;
end
always @(*) begin
	axi_s_r_valid = 1'd0;
	if ((axi_s_r_data_gv_read_state_4_enable_cond_a & gv_read_init_check_i_0_reg_stage4)) begin
		axi_s_r_valid = 1'd1;
	end
	if ((axi_s_r_resp_gv_read_state_4_enable_cond_a & gv_read_init_check_i_0_reg_stage4)) begin
		axi_s_r_valid = 1'd1;
	end
	if ((axi_s_r_last_gv_read_state_4_enable_cond_a & gv_read_init_check_i_0_reg_stage4)) begin
		axi_s_r_valid = 1'd1;
	end
end
assign s_r_resp = 2'd0;
always @(*) begin
		s_r_last = gv_read_init_check_i_5_reg_stage4;
end

endmodule
