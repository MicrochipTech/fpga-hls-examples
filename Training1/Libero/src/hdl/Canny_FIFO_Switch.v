// ----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 9.2
// Copyright (c) 2015-2021 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: legup@microchip.com
// Date: Wed Apr  7 13:18:23 2021
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
module canny_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	switch_fifo_0,
	switch_fifo_0_ready,
	switch_fifo_0_valid,
	switch_fifo_3,
	switch_fifo_3_ready,
	switch_fifo_3_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid,
	switch_fifo_2,
	switch_fifo_2_ready,
	switch_fifo_2_valid,
	switch_fifo_1,
	switch_fifo_1_ready,
	switch_fifo_1_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
input  switch_fifo_0;
output reg  switch_fifo_0_ready;
input  switch_fifo_0_valid;
input  switch_fifo_3;
output reg  switch_fifo_3_ready;
input  switch_fifo_3_valid;
output reg [7:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
input  switch_fifo_2;
output reg  switch_fifo_2_ready;
input  switch_fifo_2_valid;
input  switch_fifo_1;
output reg  switch_fifo_1_ready;
input  switch_fifo_1_valid;
reg  canny_inst_clk;
reg  canny_inst_reset;
reg  canny_inst_start;
wire  canny_inst_ready;
wire  canny_inst_finish;
wire  canny_inst_gaussian_filter_start;
reg  canny_inst_gaussian_filter_finish;
reg  canny_inst_gaussian_filter_ready;
wire  canny_inst_sobel_filter_start;
reg  canny_inst_sobel_filter_finish;
reg  canny_inst_sobel_filter_ready;
wire  canny_inst_nonmaximum_suppression_start;
reg  canny_inst_nonmaximum_suppression_finish;
reg  canny_inst_nonmaximum_suppression_ready;
wire  canny_inst_hysteresis_filter_start;
reg  canny_inst_hysteresis_filter_finish;
reg  canny_inst_hysteresis_filter_ready;
reg  canny_inst_finish_reg;
reg  gaussian_filter_inst_clk;
reg  gaussian_filter_inst_reset;
reg  gaussian_filter_inst_start;
wire  gaussian_filter_inst_ready;
wire  gaussian_filter_inst_finish;
reg [7:0] gaussian_filter_inst_input_fifo;
wire  gaussian_filter_inst_input_fifo_ready;
reg  gaussian_filter_inst_input_fifo_valid;
reg  gaussian_filter_inst_switch_fifo;
wire  gaussian_filter_inst_switch_fifo_ready;
reg  gaussian_filter_inst_switch_fifo_valid;
wire [7:0] gaussian_filter_inst_output_fifo;
reg  gaussian_filter_inst_output_fifo_ready;
wire  gaussian_filter_inst_output_fifo_valid;
reg  gaussian_filter_inst_finish_reg;
reg  canny_entry_output_fifo_gf_inst_clk;
reg  canny_entry_output_fifo_gf_inst_reset;
wire  canny_entry_output_fifo_gf_inst_clken;
reg  canny_entry_output_fifo_gf_inst_write_en;
reg [7:0] canny_entry_output_fifo_gf_inst_write_data;
reg  canny_entry_output_fifo_gf_inst_read_en;
wire [7:0] canny_entry_output_fifo_gf_inst_read_data;
wire  canny_entry_output_fifo_gf_inst_full;
wire  canny_entry_output_fifo_gf_inst_almost_full;
wire  canny_entry_output_fifo_gf_inst_empty;
wire  canny_entry_output_fifo_gf_inst_almost_empty;
wire [1:0] canny_entry_output_fifo_gf_inst_usedw;
reg  sobel_filter_inst_clk;
reg  sobel_filter_inst_reset;
reg  sobel_filter_inst_start;
wire  sobel_filter_inst_ready;
wire  sobel_filter_inst_finish;
reg [7:0] sobel_filter_inst_input_fifo;
wire  sobel_filter_inst_input_fifo_ready;
reg  sobel_filter_inst_input_fifo_valid;
reg  sobel_filter_inst_switch_fifo;
wire  sobel_filter_inst_switch_fifo_ready;
reg  sobel_filter_inst_switch_fifo_valid;
wire [15:0] sobel_filter_inst_output_fifo;
reg  sobel_filter_inst_output_fifo_ready;
wire  sobel_filter_inst_output_fifo_valid;
reg  sobel_filter_inst_finish_reg;
reg  canny_entry_output_fifo_sf_inst_clk;
reg  canny_entry_output_fifo_sf_inst_reset;
wire  canny_entry_output_fifo_sf_inst_clken;
reg  canny_entry_output_fifo_sf_inst_write_en;
reg [15:0] canny_entry_output_fifo_sf_inst_write_data;
reg  canny_entry_output_fifo_sf_inst_read_en;
wire [15:0] canny_entry_output_fifo_sf_inst_read_data;
wire  canny_entry_output_fifo_sf_inst_full;
wire  canny_entry_output_fifo_sf_inst_almost_full;
wire  canny_entry_output_fifo_sf_inst_empty;
wire  canny_entry_output_fifo_sf_inst_almost_empty;
wire [1:0] canny_entry_output_fifo_sf_inst_usedw;
reg  nonmaximum_suppression_inst_clk;
reg  nonmaximum_suppression_inst_reset;
reg  nonmaximum_suppression_inst_start;
wire  nonmaximum_suppression_inst_ready;
wire  nonmaximum_suppression_inst_finish;
reg [15:0] nonmaximum_suppression_inst_input_fifo;
wire  nonmaximum_suppression_inst_input_fifo_ready;
reg  nonmaximum_suppression_inst_input_fifo_valid;
reg  nonmaximum_suppression_inst_switch_fifo;
wire  nonmaximum_suppression_inst_switch_fifo_ready;
reg  nonmaximum_suppression_inst_switch_fifo_valid;
wire [7:0] nonmaximum_suppression_inst_output_fifo;
reg  nonmaximum_suppression_inst_output_fifo_ready;
wire  nonmaximum_suppression_inst_output_fifo_valid;
reg  nonmaximum_suppression_inst_finish_reg;
reg  canny_entry_output_fifo_nm_inst_clk;
reg  canny_entry_output_fifo_nm_inst_reset;
wire  canny_entry_output_fifo_nm_inst_clken;
reg  canny_entry_output_fifo_nm_inst_write_en;
reg [7:0] canny_entry_output_fifo_nm_inst_write_data;
reg  canny_entry_output_fifo_nm_inst_read_en;
wire [7:0] canny_entry_output_fifo_nm_inst_read_data;
wire  canny_entry_output_fifo_nm_inst_full;
wire  canny_entry_output_fifo_nm_inst_almost_full;
wire  canny_entry_output_fifo_nm_inst_empty;
wire  canny_entry_output_fifo_nm_inst_almost_empty;
wire [1:0] canny_entry_output_fifo_nm_inst_usedw;
reg  hysteresis_filter_inst_clk;
reg  hysteresis_filter_inst_reset;
reg  hysteresis_filter_inst_start;
wire  hysteresis_filter_inst_ready;
wire  hysteresis_filter_inst_finish;
reg [7:0] hysteresis_filter_inst_input_fifo;
wire  hysteresis_filter_inst_input_fifo_ready;
reg  hysteresis_filter_inst_input_fifo_valid;
reg  hysteresis_filter_inst_switch_fifo;
wire  hysteresis_filter_inst_switch_fifo_ready;
reg  hysteresis_filter_inst_switch_fifo_valid;
wire [7:0] hysteresis_filter_inst_output_fifo;
reg  hysteresis_filter_inst_output_fifo_ready;
wire  hysteresis_filter_inst_output_fifo_valid;
reg  hysteresis_filter_inst_finish_reg;


canny canny_inst (
	.clk (canny_inst_clk),
	.reset (canny_inst_reset),
	.start (canny_inst_start),
	.ready (canny_inst_ready),
	.finish (canny_inst_finish),
	.gaussian_filter_start (canny_inst_gaussian_filter_start),
	.gaussian_filter_finish (canny_inst_gaussian_filter_finish),
	.gaussian_filter_ready (canny_inst_gaussian_filter_ready),
	.sobel_filter_start (canny_inst_sobel_filter_start),
	.sobel_filter_finish (canny_inst_sobel_filter_finish),
	.sobel_filter_ready (canny_inst_sobel_filter_ready),
	.nonmaximum_suppression_start (canny_inst_nonmaximum_suppression_start),
	.nonmaximum_suppression_finish (canny_inst_nonmaximum_suppression_finish),
	.nonmaximum_suppression_ready (canny_inst_nonmaximum_suppression_ready),
	.hysteresis_filter_start (canny_inst_hysteresis_filter_start),
	.hysteresis_filter_finish (canny_inst_hysteresis_filter_finish),
	.hysteresis_filter_ready (canny_inst_hysteresis_filter_ready)
);



gaussian_filter gaussian_filter_inst (
	.clk (gaussian_filter_inst_clk),
	.reset (gaussian_filter_inst_reset),
	.start (gaussian_filter_inst_start),
	.ready (gaussian_filter_inst_ready),
	.finish (gaussian_filter_inst_finish),
	.input_fifo (gaussian_filter_inst_input_fifo),
	.input_fifo_ready (gaussian_filter_inst_input_fifo_ready),
	.input_fifo_valid (gaussian_filter_inst_input_fifo_valid),
	.switch_fifo (gaussian_filter_inst_switch_fifo),
	.switch_fifo_ready (gaussian_filter_inst_switch_fifo_ready),
	.switch_fifo_valid (gaussian_filter_inst_switch_fifo_valid),
	.output_fifo (gaussian_filter_inst_output_fifo),
	.output_fifo_ready (gaussian_filter_inst_output_fifo_ready),
	.output_fifo_valid (gaussian_filter_inst_output_fifo_valid)
);



fwft_fifo canny_entry_output_fifo_gf_inst (
	.clk (canny_entry_output_fifo_gf_inst_clk),
	.reset (canny_entry_output_fifo_gf_inst_reset),
	.clken (canny_entry_output_fifo_gf_inst_clken),
	.write_en (canny_entry_output_fifo_gf_inst_write_en),
	.write_data (canny_entry_output_fifo_gf_inst_write_data),
	.read_en (canny_entry_output_fifo_gf_inst_read_en),
	.read_data (canny_entry_output_fifo_gf_inst_read_data),
	.full (canny_entry_output_fifo_gf_inst_full),
	.almost_full (canny_entry_output_fifo_gf_inst_almost_full),
	.empty (canny_entry_output_fifo_gf_inst_empty),
	.almost_empty (canny_entry_output_fifo_gf_inst_almost_empty),
	.usedw (canny_entry_output_fifo_gf_inst_usedw)
);

defparam
	canny_entry_output_fifo_gf_inst.width = 8,
	canny_entry_output_fifo_gf_inst.depth = 2,
	canny_entry_output_fifo_gf_inst.name = "canny_entry_output_fifo_gf",
	canny_entry_output_fifo_gf_inst.widthad = 1,
	canny_entry_output_fifo_gf_inst.ramstyle = "distributed";


sobel_filter sobel_filter_inst (
	.clk (sobel_filter_inst_clk),
	.reset (sobel_filter_inst_reset),
	.start (sobel_filter_inst_start),
	.ready (sobel_filter_inst_ready),
	.finish (sobel_filter_inst_finish),
	.input_fifo (sobel_filter_inst_input_fifo),
	.input_fifo_ready (sobel_filter_inst_input_fifo_ready),
	.input_fifo_valid (sobel_filter_inst_input_fifo_valid),
	.switch_fifo (sobel_filter_inst_switch_fifo),
	.switch_fifo_ready (sobel_filter_inst_switch_fifo_ready),
	.switch_fifo_valid (sobel_filter_inst_switch_fifo_valid),
	.output_fifo (sobel_filter_inst_output_fifo),
	.output_fifo_ready (sobel_filter_inst_output_fifo_ready),
	.output_fifo_valid (sobel_filter_inst_output_fifo_valid)
);



fwft_fifo canny_entry_output_fifo_sf_inst (
	.clk (canny_entry_output_fifo_sf_inst_clk),
	.reset (canny_entry_output_fifo_sf_inst_reset),
	.clken (canny_entry_output_fifo_sf_inst_clken),
	.write_en (canny_entry_output_fifo_sf_inst_write_en),
	.write_data (canny_entry_output_fifo_sf_inst_write_data),
	.read_en (canny_entry_output_fifo_sf_inst_read_en),
	.read_data (canny_entry_output_fifo_sf_inst_read_data),
	.full (canny_entry_output_fifo_sf_inst_full),
	.almost_full (canny_entry_output_fifo_sf_inst_almost_full),
	.empty (canny_entry_output_fifo_sf_inst_empty),
	.almost_empty (canny_entry_output_fifo_sf_inst_almost_empty),
	.usedw (canny_entry_output_fifo_sf_inst_usedw)
);

defparam
	canny_entry_output_fifo_sf_inst.width = 16,
	canny_entry_output_fifo_sf_inst.depth = 2,
	canny_entry_output_fifo_sf_inst.name = "canny_entry_output_fifo_sf",
	canny_entry_output_fifo_sf_inst.widthad = 1,
	canny_entry_output_fifo_sf_inst.ramstyle = "distributed";


nonmaximum_suppression nonmaximum_suppression_inst (
	.clk (nonmaximum_suppression_inst_clk),
	.reset (nonmaximum_suppression_inst_reset),
	.start (nonmaximum_suppression_inst_start),
	.ready (nonmaximum_suppression_inst_ready),
	.finish (nonmaximum_suppression_inst_finish),
	.input_fifo (nonmaximum_suppression_inst_input_fifo),
	.input_fifo_ready (nonmaximum_suppression_inst_input_fifo_ready),
	.input_fifo_valid (nonmaximum_suppression_inst_input_fifo_valid),
	.switch_fifo (nonmaximum_suppression_inst_switch_fifo),
	.switch_fifo_ready (nonmaximum_suppression_inst_switch_fifo_ready),
	.switch_fifo_valid (nonmaximum_suppression_inst_switch_fifo_valid),
	.output_fifo (nonmaximum_suppression_inst_output_fifo),
	.output_fifo_ready (nonmaximum_suppression_inst_output_fifo_ready),
	.output_fifo_valid (nonmaximum_suppression_inst_output_fifo_valid)
);



fwft_fifo canny_entry_output_fifo_nm_inst (
	.clk (canny_entry_output_fifo_nm_inst_clk),
	.reset (canny_entry_output_fifo_nm_inst_reset),
	.clken (canny_entry_output_fifo_nm_inst_clken),
	.write_en (canny_entry_output_fifo_nm_inst_write_en),
	.write_data (canny_entry_output_fifo_nm_inst_write_data),
	.read_en (canny_entry_output_fifo_nm_inst_read_en),
	.read_data (canny_entry_output_fifo_nm_inst_read_data),
	.full (canny_entry_output_fifo_nm_inst_full),
	.almost_full (canny_entry_output_fifo_nm_inst_almost_full),
	.empty (canny_entry_output_fifo_nm_inst_empty),
	.almost_empty (canny_entry_output_fifo_nm_inst_almost_empty),
	.usedw (canny_entry_output_fifo_nm_inst_usedw)
);

defparam
	canny_entry_output_fifo_nm_inst.width = 8,
	canny_entry_output_fifo_nm_inst.depth = 2,
	canny_entry_output_fifo_nm_inst.name = "canny_entry_output_fifo_nm",
	canny_entry_output_fifo_nm_inst.widthad = 1,
	canny_entry_output_fifo_nm_inst.ramstyle = "distributed";


hysteresis_filter hysteresis_filter_inst (
	.clk (hysteresis_filter_inst_clk),
	.reset (hysteresis_filter_inst_reset),
	.start (hysteresis_filter_inst_start),
	.ready (hysteresis_filter_inst_ready),
	.finish (hysteresis_filter_inst_finish),
	.input_fifo (hysteresis_filter_inst_input_fifo),
	.input_fifo_ready (hysteresis_filter_inst_input_fifo_ready),
	.input_fifo_valid (hysteresis_filter_inst_input_fifo_valid),
	.switch_fifo (hysteresis_filter_inst_switch_fifo),
	.switch_fifo_ready (hysteresis_filter_inst_switch_fifo_ready),
	.switch_fifo_valid (hysteresis_filter_inst_switch_fifo_valid),
	.output_fifo (hysteresis_filter_inst_output_fifo),
	.output_fifo_ready (hysteresis_filter_inst_output_fifo_ready),
	.output_fifo_valid (hysteresis_filter_inst_output_fifo_valid)
);



always @(*) begin
	canny_inst_clk = clk;
end
always @(*) begin
	canny_inst_reset = reset;
end
always @(*) begin
	canny_inst_start = start;
end
always @(*) begin
	canny_inst_gaussian_filter_finish = gaussian_filter_inst_finish;
end
always @(*) begin
	canny_inst_gaussian_filter_ready = gaussian_filter_inst_ready;
end
always @(*) begin
	canny_inst_sobel_filter_finish = sobel_filter_inst_finish;
end
always @(*) begin
	canny_inst_sobel_filter_ready = sobel_filter_inst_ready;
end
always @(*) begin
	canny_inst_nonmaximum_suppression_finish = nonmaximum_suppression_inst_finish;
end
always @(*) begin
	canny_inst_nonmaximum_suppression_ready = nonmaximum_suppression_inst_ready;
end
always @(*) begin
	canny_inst_hysteresis_filter_finish = hysteresis_filter_inst_finish;
end
always @(*) begin
	canny_inst_hysteresis_filter_ready = hysteresis_filter_inst_ready;
end
always @(posedge clk) begin
	if ((reset | canny_inst_start)) begin
		canny_inst_finish_reg <= 1'd0;
	end
	if (canny_inst_finish) begin
		canny_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	gaussian_filter_inst_clk = clk;
end
always @(*) begin
	gaussian_filter_inst_reset = reset;
end
always @(*) begin
	gaussian_filter_inst_start = canny_inst_gaussian_filter_start;
end
always @(*) begin
	gaussian_filter_inst_input_fifo = input_fifo;
end
always @(*) begin
	gaussian_filter_inst_input_fifo_valid = input_fifo_valid;
end
always @(*) begin
	gaussian_filter_inst_switch_fifo = switch_fifo_0;
end
always @(*) begin
	gaussian_filter_inst_switch_fifo_valid = switch_fifo_0_valid;
end
always @(*) begin
	gaussian_filter_inst_output_fifo_ready = ~(canny_entry_output_fifo_gf_inst_full);
end
always @(posedge clk) begin
	if ((reset | gaussian_filter_inst_start)) begin
		gaussian_filter_inst_finish_reg <= 1'd0;
	end
	if (gaussian_filter_inst_finish) begin
		gaussian_filter_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	canny_entry_output_fifo_gf_inst_clk = clk;
end
always @(*) begin
	canny_entry_output_fifo_gf_inst_reset = reset;
end
assign canny_entry_output_fifo_gf_inst_clken = 1'd1;
always @(*) begin
	canny_entry_output_fifo_gf_inst_write_en = gaussian_filter_inst_output_fifo_valid;
end
always @(*) begin
	canny_entry_output_fifo_gf_inst_write_data = gaussian_filter_inst_output_fifo;
end
always @(*) begin
	canny_entry_output_fifo_gf_inst_read_en = sobel_filter_inst_input_fifo_ready;
end
always @(*) begin
	sobel_filter_inst_clk = clk;
end
always @(*) begin
	sobel_filter_inst_reset = reset;
end
always @(*) begin
	sobel_filter_inst_start = canny_inst_sobel_filter_start;
end
always @(*) begin
	sobel_filter_inst_input_fifo = canny_entry_output_fifo_gf_inst_read_data;
end
always @(*) begin
	sobel_filter_inst_input_fifo_valid = ~(canny_entry_output_fifo_gf_inst_empty);
end
always @(*) begin
	sobel_filter_inst_switch_fifo = switch_fifo_1;
end
always @(*) begin
	sobel_filter_inst_switch_fifo_valid = switch_fifo_1_valid;
end
always @(*) begin
	sobel_filter_inst_output_fifo_ready = ~(canny_entry_output_fifo_sf_inst_full);
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
	canny_entry_output_fifo_sf_inst_clk = clk;
end
always @(*) begin
	canny_entry_output_fifo_sf_inst_reset = reset;
end
assign canny_entry_output_fifo_sf_inst_clken = 1'd1;
always @(*) begin
	canny_entry_output_fifo_sf_inst_write_en = sobel_filter_inst_output_fifo_valid;
end
always @(*) begin
	canny_entry_output_fifo_sf_inst_write_data = sobel_filter_inst_output_fifo;
end
always @(*) begin
	canny_entry_output_fifo_sf_inst_read_en = nonmaximum_suppression_inst_input_fifo_ready;
end
always @(*) begin
	nonmaximum_suppression_inst_clk = clk;
end
always @(*) begin
	nonmaximum_suppression_inst_reset = reset;
end
always @(*) begin
	nonmaximum_suppression_inst_start = canny_inst_nonmaximum_suppression_start;
end
always @(*) begin
	nonmaximum_suppression_inst_input_fifo = canny_entry_output_fifo_sf_inst_read_data;
end
always @(*) begin
	nonmaximum_suppression_inst_input_fifo_valid = ~(canny_entry_output_fifo_sf_inst_empty);
end
always @(*) begin
	nonmaximum_suppression_inst_switch_fifo = switch_fifo_2;
end
always @(*) begin
	nonmaximum_suppression_inst_switch_fifo_valid = switch_fifo_2_valid;
end
always @(*) begin
	nonmaximum_suppression_inst_output_fifo_ready = ~(canny_entry_output_fifo_nm_inst_full);
end
always @(posedge clk) begin
	if ((reset | nonmaximum_suppression_inst_start)) begin
		nonmaximum_suppression_inst_finish_reg <= 1'd0;
	end
	if (nonmaximum_suppression_inst_finish) begin
		nonmaximum_suppression_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	canny_entry_output_fifo_nm_inst_clk = clk;
end
always @(*) begin
	canny_entry_output_fifo_nm_inst_reset = reset;
end
assign canny_entry_output_fifo_nm_inst_clken = 1'd1;
always @(*) begin
	canny_entry_output_fifo_nm_inst_write_en = nonmaximum_suppression_inst_output_fifo_valid;
end
always @(*) begin
	canny_entry_output_fifo_nm_inst_write_data = nonmaximum_suppression_inst_output_fifo;
end
always @(*) begin
	canny_entry_output_fifo_nm_inst_read_en = hysteresis_filter_inst_input_fifo_ready;
end
always @(*) begin
	hysteresis_filter_inst_clk = clk;
end
always @(*) begin
	hysteresis_filter_inst_reset = reset;
end
always @(*) begin
	hysteresis_filter_inst_start = canny_inst_hysteresis_filter_start;
end
always @(*) begin
	hysteresis_filter_inst_input_fifo = canny_entry_output_fifo_nm_inst_read_data;
end
always @(*) begin
	hysteresis_filter_inst_input_fifo_valid = ~(canny_entry_output_fifo_nm_inst_empty);
end
always @(*) begin
	hysteresis_filter_inst_switch_fifo = switch_fifo_3;
end
always @(*) begin
	hysteresis_filter_inst_switch_fifo_valid = switch_fifo_3_valid;
end
always @(*) begin
	hysteresis_filter_inst_output_fifo_ready = output_fifo_ready;
end
always @(posedge clk) begin
	if ((reset | hysteresis_filter_inst_start)) begin
		hysteresis_filter_inst_finish_reg <= 1'd0;
	end
	if (hysteresis_filter_inst_finish) begin
		hysteresis_filter_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = canny_inst_ready;
end
always @(*) begin
	finish = canny_inst_finish;
end
always @(*) begin
	input_fifo_ready = gaussian_filter_inst_input_fifo_ready;
end
always @(*) begin
	switch_fifo_0_ready = gaussian_filter_inst_switch_fifo_ready;
end
always @(*) begin
	switch_fifo_3_ready = hysteresis_filter_inst_switch_fifo_ready;
end
always @(*) begin
	output_fifo = hysteresis_filter_inst_output_fifo;
end
always @(*) begin
	output_fifo_valid = hysteresis_filter_inst_output_fifo_valid;
end
always @(*) begin
	switch_fifo_2_ready = nonmaximum_suppression_inst_switch_fifo_ready;
end
always @(*) begin
	switch_fifo_1_ready = sobel_filter_inst_switch_fifo_ready;
end

endmodule
`timescale 1 ns / 1 ns
module canny
(
	clk,
	reset,
	start,
	ready,
	finish,
	gaussian_filter_start,
	gaussian_filter_finish,
	gaussian_filter_ready,
	sobel_filter_start,
	sobel_filter_finish,
	sobel_filter_ready,
	nonmaximum_suppression_start,
	nonmaximum_suppression_finish,
	nonmaximum_suppression_ready,
	hysteresis_filter_start,
	hysteresis_filter_finish,
	hysteresis_filter_ready
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_canny_BB_entry_1 = 4'd1;
parameter [3:0] LEGUP_F_canny_BB_entry_3 = 4'd3;
parameter [3:0] LEGUP_F_canny_BB_entry_5 = 4'd5;
parameter [3:0] LEGUP_F_canny_BB_entry_7 = 4'd7;
parameter [3:0] LEGUP_F_canny_BB_entry_9 = 4'd9;
parameter [3:0] LEGUP_function_call_2 = 4'd2;
parameter [3:0] LEGUP_function_call_4 = 4'd4;
parameter [3:0] LEGUP_function_call_6 = 4'd6;
parameter [3:0] LEGUP_function_call_8 = 4'd8;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  gaussian_filter_start;
input  gaussian_filter_finish;
input  gaussian_filter_ready;
output reg  sobel_filter_start;
input  sobel_filter_finish;
input  sobel_filter_ready;
output reg  nonmaximum_suppression_start;
input  nonmaximum_suppression_finish;
input  nonmaximum_suppression_ready;
output reg  hysteresis_filter_start;
input  hysteresis_filter_finish;
input  hysteresis_filter_ready;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;
reg  pipeline_wrapper_init_completed;
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
		next_state = LEGUP_F_canny_BB_entry_1;
LEGUP_F_canny_BB_entry_1:
		next_state = LEGUP_function_call_2;
LEGUP_F_canny_BB_entry_3:
		next_state = LEGUP_function_call_4;
LEGUP_F_canny_BB_entry_5:
		next_state = LEGUP_function_call_6;
LEGUP_F_canny_BB_entry_7:
		next_state = LEGUP_function_call_8;
LEGUP_F_canny_BB_entry_9:
		next_state = LEGUP_0;
LEGUP_function_call_2:
		next_state = LEGUP_F_canny_BB_entry_3;
LEGUP_function_call_4:
		next_state = LEGUP_F_canny_BB_entry_5;
LEGUP_function_call_6:
		next_state = LEGUP_F_canny_BB_entry_7;
LEGUP_function_call_8:
		next_state = LEGUP_F_canny_BB_entry_9;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(posedge clk) begin
	if (reset) begin
		pipeline_wrapper_init_completed <= 1'd0;
	end
	if (((cur_state == LEGUP_0) & pipeline_wrapper_init_started)) begin
		pipeline_wrapper_init_completed <= 1'd1;
	end
end
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
	ready = gaussian_filter_ready;
end
always @(posedge clk) begin
	finish <= hysteresis_filter_finish;
end
always @(posedge clk) begin
	gaussian_filter_start <= (start & pipeline_wrapper_init_completed);
	if (reset) begin
		gaussian_filter_start <= 1'd0;
	end
end
always @(posedge clk) begin
	sobel_filter_start <= (start & pipeline_wrapper_init_completed);
	if (reset) begin
		sobel_filter_start <= 1'd0;
	end
end
always @(posedge clk) begin
	nonmaximum_suppression_start <= (start & pipeline_wrapper_init_completed);
	if (reset) begin
		nonmaximum_suppression_start <= 1'd0;
	end
end
always @(posedge clk) begin
	hysteresis_filter_start <= (start & pipeline_wrapper_init_completed);
	if (reset) begin
		hysteresis_filter_start <= 1'd0;
	end
end

endmodule
`timescale 1 ns / 1 ns
module gaussian_filter
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	switch_fifo,
	switch_fifo_ready,
	switch_fifo_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
input  switch_fifo;
output reg  switch_fifo_ready;
input  switch_fifo_valid;
output reg [7:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg [7:0] gaussian_filter_entry_1;
reg [7:0] gaussian_filter_entry_3;
reg [7:0] gaussian_filter_entry_4;
reg [7:0] gaussian_filter_entry_5;
reg [7:0] gaussian_filter_entry_6;
reg [7:0] gaussian_filter_entry_8;
reg [7:0] gaussian_filter_entry_9;
reg [7:0] gaussian_filter_entry_10;
reg [7:0] gaussian_filter_entry_11;
reg [7:0] gaussian_filter_entry_13;
reg [7:0] gaussian_filter_entry_14;
reg [7:0] gaussian_filter_entry_15;
reg [7:0] gaussian_filter_entry_16;
reg [7:0] gaussian_filter_entry_18;
reg [7:0] gaussian_filter_entry_19;
reg [7:0] gaussian_filter_entry_20;
reg [7:0] gaussian_filter_entry_21;
reg [7:0] gaussian_filter_entry_23;
reg [7:0] gaussian_filter_entry_24;
reg [7:0] gaussian_filter_entry_25;
reg [31:0] gaussian_filter_entry_26;
reg [31:0] gaussian_filter_entry_27;
reg [31:0] gaussian_filter_entry_28;
reg [31:0] gaussian_filter_entry_29;
wire  gaussian_filter_entry_30;
reg  gaussian_filter_entry_NotCondition;
reg [7:0] gaussian_filter_entry_31;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_32;
reg [7:0] gaussian_filter_entry_33;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_34;
reg [7:0] gaussian_filter_entry_35;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_36;
reg [7:0] gaussian_filter_entry_37;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_38;
reg [7:0] gaussian_filter_entry_39;
reg  gaussian_filter_entry_cmp46_i;
reg [31:0] gaussian_filter_entry_add50_i;
reg [31:0] gaussian_filter_entry_add50_i_var0;
reg  gaussian_filter_entry_cmp_i;
reg  gaussian_filter_entry_exitMask_T1;
reg  gaussian_filter_entry_NotCondition2;
reg  gaussian_filter_entry_exitMask_F3;
reg [31:0] gaussian_filter_entry_off;
reg  gaussian_filter_entry_40;
reg [31:0] gaussian_filter_entry_bit_concat43;
reg  gaussian_filter_entry_cmp4_i;
reg [31:0] gaussian_filter_entry_bit_concat42;
reg [31:0] gaussian_filter_entry_or6_i;
reg  gaussian_filter_entry_cmp9_i;
reg [31:0] gaussian_filter_entry_bit_concat41;
reg [31:0] gaussian_filter_entry_or11_i;
reg  gaussian_filter_entry_tobool_i;
reg  gaussian_filter_entry_cmp_i1;
reg  gaussian_filter_entry_exitMask_T4;
reg [31:0] gaussian_filter_entry_inc_i;
reg  gaussian_filter_entry_cmp1_i;
reg  gaussian_filter_entry_cmp2_i;
reg  gaussian_filter_entry_or_cond_i;
reg [31:0] gaussian_filter_entry_inc5_i;
reg [31:0] gaussian_filter_entry_inc5_i_var1;
reg [31:0] gaussian_filter_entry_select11;
reg [31:0] gaussian_filter_entry_select;
reg  gaussian_filter_entry_41;
reg  gaussian_filter_entry_exitMask_T7;
reg  gaussian_filter_entry_NotCondition8;
reg  gaussian_filter_entry_exitMask_F9;
reg  gaussian_filter_entry_exitMask_T12;
reg  gaussian_filter_entry_NotCondition13;
reg  gaussian_filter_entry_exitMask_F14;
reg [31:0] gaussian_filter_entry_bit_concat40;
reg [31:0] gaussian_filter_entry_bit_concat39;
reg [31:0] gaussian_filter_entry_bit_concat38;
reg [31:0] gaussian_filter_entry_sr_add3;
reg [31:0] gaussian_filter_entry_bit_concat37;
reg [31:0] gaussian_filter_entry_newEarly_add_2;
reg [31:0] gaussian_filter_entry_newCurOp_add_2;
reg [31:0] gaussian_filter_entry_bit_concat36;
reg [31:0] gaussian_filter_entry_bit_concat35;
reg [31:0] gaussian_filter_entry_sr_add5;
reg [31:0] gaussian_filter_entry_bit_concat34;
reg [31:0] gaussian_filter_entry_bit_concat33;
reg [31:0] gaussian_filter_entry_bit_concat32;
reg [31:0] gaussian_filter_entry_sr_add8;
reg [31:0] gaussian_filter_entry_bit_concat31;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_add_1_1;
reg [31:0] gaussian_filter_entry_bit_concat30;
reg [31:0] gaussian_filter_entry_bit_concat29;
reg [31:0] gaussian_filter_entry_sr_add11;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_add_2_1;
reg [31:0] gaussian_filter_entry_bit_concat28;
reg [31:0] gaussian_filter_entry_bit_concat27;
reg [31:0] gaussian_filter_entry_bit_concat26;
reg [31:0] gaussian_filter_entry_sr_add13;
reg [31:0] gaussian_filter_entry_bit_concat25;
reg [31:0] gaussian_filter_entry_bit_concat24;
reg [31:0] gaussian_filter_entry_bit_concat23;
reg [31:0] gaussian_filter_entry_sr_add16;
reg [31:0] gaussian_filter_entry_bit_concat22;
reg [31:0] gaussian_filter_entry_bit_concat21;
reg [31:0] gaussian_filter_entry_sr_add19;
reg [31:0] gaussian_filter_entry_bit_concat20;
reg [31:0] gaussian_filter_entry_bit_concat19;
reg [31:0] gaussian_filter_entry_sr_add22;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a;
reg [31:0] gaussian_filter_entry_bit_concat18;
reg [31:0] gaussian_filter_entry_mul_291;
reg [31:0] gaussian_filter_entry_bit_concat17;
reg [31:0] gaussian_filter_entry_bit_concat16;
reg [31:0] gaussian_filter_entry_sr_add24;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var3;
reg [31:0] gaussian_filter_entry_bit_concat15;
reg [31:0] gaussian_filter_entry_bit_concat14;
reg [31:0] gaussian_filter_entry_bit_concat13;
reg [31:0] gaussian_filter_entry_sr_add28;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var4;
reg [31:0] gaussian_filter_entry_bit_concat12;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var5;
reg [31:0] gaussian_filter_entry_bit_concat11;
reg [31:0] gaussian_filter_entry_bit_concat10;
reg [31:0] gaussian_filter_entry_sr_add30;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var6;
reg [31:0] gaussian_filter_entry_bit_concat9;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_n;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_n;
reg [31:0] gaussian_filter_entry_bit_concat8;
reg [31:0] gaussian_filter_entry_bit_concat7;
reg [31:0] gaussian_filter_entry_sr_add32;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var7;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_a;
reg [31:0] gaussian_filter_entry_bit_concat6;
reg [31:0] gaussian_filter_entry_newEarly_add_2_32;
reg [29:0] gaussian_filter_entry_bit_select4;
reg [31:0] gaussian_filter_entry_bit_concat5;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var8;
reg [31:0] gaussian_filter_entry_bit_concat3;
reg [31:0] gaussian_filter_entry_bit_concat2;
reg [31:0] gaussian_filter_entry_sr_add34;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var9;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var10;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_add_3_4;
reg [31:0] gaussian_filter_entry_bit_concat1;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_n_var11;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var13;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_add_4_4;
reg [31:0] gaussian_filter_entry_newCurOp_add_4_4;
reg [7:0] gaussian_filter_entry_bit_select;
reg  gaussian_filter_entry_ORexitM249;
reg [7:0] gaussian_filter_entry_select240;
reg [7:0] gaussian_filter_entry_select244;
reg [7:0] gaussian_filter_entry_select246;
reg [7:0] gaussian_filter_entry_select224;
reg [7:0] gaussian_filter_entry_select228;
reg [7:0] gaussian_filter_entry_select230;
reg [7:0] gaussian_filter_entry_select216;
reg [7:0] gaussian_filter_entry_select220;
reg [7:0] gaussian_filter_entry_select222;
reg [7:0] gaussian_filter_entry_select208;
reg [7:0] gaussian_filter_entry_select212;
reg [7:0] gaussian_filter_entry_select214;
reg [7:0] gaussian_filter_entry_select200;
reg [7:0] gaussian_filter_entry_select204;
reg [7:0] gaussian_filter_entry_select206;
reg [7:0] gaussian_filter_entry_select184;
reg [7:0] gaussian_filter_entry_select188;
reg [7:0] gaussian_filter_entry_select190;
reg [7:0] gaussian_filter_entry_select176;
reg [7:0] gaussian_filter_entry_select180;
reg [7:0] gaussian_filter_entry_select182;
reg [7:0] gaussian_filter_entry_select168;
reg [7:0] gaussian_filter_entry_select172;
reg [7:0] gaussian_filter_entry_select174;
reg [7:0] gaussian_filter_entry_select160;
reg [7:0] gaussian_filter_entry_select164;
reg [7:0] gaussian_filter_entry_select166;
reg [7:0] gaussian_filter_entry_select144;
reg [7:0] gaussian_filter_entry_select148;
reg [7:0] gaussian_filter_entry_select150;
reg [7:0] gaussian_filter_entry_select136;
reg [7:0] gaussian_filter_entry_select140;
reg [7:0] gaussian_filter_entry_select142;
reg [7:0] gaussian_filter_entry_select128;
reg [7:0] gaussian_filter_entry_select132;
reg [7:0] gaussian_filter_entry_select134;
reg [7:0] gaussian_filter_entry_select120;
reg [7:0] gaussian_filter_entry_select124;
reg [7:0] gaussian_filter_entry_select126;
reg [7:0] gaussian_filter_entry_select104;
reg [7:0] gaussian_filter_entry_select108;
reg [7:0] gaussian_filter_entry_select110;
reg [7:0] gaussian_filter_entry_select96;
reg [7:0] gaussian_filter_entry_select100;
reg [7:0] gaussian_filter_entry_select102;
reg [7:0] gaussian_filter_entry_select88;
reg [7:0] gaussian_filter_entry_select92;
reg [7:0] gaussian_filter_entry_select94;
reg [7:0] gaussian_filter_entry_select80;
reg [7:0] gaussian_filter_entry_select84;
reg [7:0] gaussian_filter_entry_select86;
reg [7:0] gaussian_filter_entry_select64;
reg [7:0] gaussian_filter_entry_select68;
reg [7:0] gaussian_filter_entry_select70;
reg [7:0] gaussian_filter_entry_select56;
reg [7:0] gaussian_filter_entry_select60;
reg [7:0] gaussian_filter_entry_select62;
reg [7:0] gaussian_filter_entry_select48;
reg [7:0] gaussian_filter_entry_select52;
reg [7:0] gaussian_filter_entry_select54;
reg [31:0] gaussian_filter_entry_select40;
reg [31:0] gaussian_filter_entry_select44;
reg [31:0] gaussian_filter_entry_select46;
reg [31:0] gaussian_filter_entry_bit_concat;
reg [31:0] gaussian_filter_entry_select36;
reg [31:0] gaussian_filter_entry_select38;
reg [31:0] gaussian_filter_entry_select24;
reg [31:0] gaussian_filter_entry_select28;
reg [31:0] gaussian_filter_entry_select30;
reg [31:0] gaussian_filter_entry_select16;
reg [31:0] gaussian_filter_entry_select20;
reg [31:0] gaussian_filter_entry_select22;
reg [7:0] gaussian_filter_line_buffer_window_a0_a1_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a0_a2_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a0_a3_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a0_a4_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a1_a1_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a1_a2_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a1_a3_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a1_a4_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a2_a1_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a2_a2_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a2_a3_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a2_a4_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a3_a1_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a3_a2_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a3_a3_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a3_a4_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a4_a1_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a4_a2_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a4_a3_inferred_reg;
reg [7:0] gaussian_filter_line_buffer_window_a4_a4_inferred_reg;
reg [31:0] gaussian_filter_line_buffer_prev_row_index_inferred_reg;
reg  gaussian_filter_line_buffer_prev_row_a0_a0_clken;
reg [10:0] gaussian_filter_line_buffer_prev_row_a0_a0_address_a;
wire  gaussian_filter_line_buffer_prev_row_a0_a0_write_en_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a0_a0_write_data_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a0_a0_read_data_a;
reg  gaussian_filter_line_buffer_prev_row_a0_a0_read_en_a;
reg [10:0] gaussian_filter_line_buffer_prev_row_a0_a0_address_b;
reg  gaussian_filter_line_buffer_prev_row_a0_a0_write_en_b;
reg [7:0] gaussian_filter_line_buffer_prev_row_a0_a0_write_data_b;
wire [7:0] gaussian_filter_line_buffer_prev_row_a0_a0_read_data_b;
wire  gaussian_filter_line_buffer_prev_row_a0_a0_read_en_b;
reg  gaussian_filter_line_buffer_prev_row_a1_a0_clken;
reg [10:0] gaussian_filter_line_buffer_prev_row_a1_a0_address_a;
wire  gaussian_filter_line_buffer_prev_row_a1_a0_write_en_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a1_a0_write_data_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a1_a0_read_data_a;
reg  gaussian_filter_line_buffer_prev_row_a1_a0_read_en_a;
reg [10:0] gaussian_filter_line_buffer_prev_row_a1_a0_address_b;
reg  gaussian_filter_line_buffer_prev_row_a1_a0_write_en_b;
reg [7:0] gaussian_filter_line_buffer_prev_row_a1_a0_write_data_b;
wire [7:0] gaussian_filter_line_buffer_prev_row_a1_a0_read_data_b;
wire  gaussian_filter_line_buffer_prev_row_a1_a0_read_en_b;
reg  gaussian_filter_line_buffer_prev_row_a2_a0_clken;
reg [10:0] gaussian_filter_line_buffer_prev_row_a2_a0_address_a;
wire  gaussian_filter_line_buffer_prev_row_a2_a0_write_en_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a2_a0_write_data_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a2_a0_read_data_a;
reg  gaussian_filter_line_buffer_prev_row_a2_a0_read_en_a;
reg [10:0] gaussian_filter_line_buffer_prev_row_a2_a0_address_b;
reg  gaussian_filter_line_buffer_prev_row_a2_a0_write_en_b;
reg [7:0] gaussian_filter_line_buffer_prev_row_a2_a0_write_data_b;
wire [7:0] gaussian_filter_line_buffer_prev_row_a2_a0_read_data_b;
wire  gaussian_filter_line_buffer_prev_row_a2_a0_read_en_b;
reg  gaussian_filter_line_buffer_prev_row_a3_a0_clken;
reg [10:0] gaussian_filter_line_buffer_prev_row_a3_a0_address_a;
wire  gaussian_filter_line_buffer_prev_row_a3_a0_write_en_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a3_a0_write_data_a;
wire [7:0] gaussian_filter_line_buffer_prev_row_a3_a0_read_data_a;
reg  gaussian_filter_line_buffer_prev_row_a3_a0_read_en_a;
reg [10:0] gaussian_filter_line_buffer_prev_row_a3_a0_address_b;
reg  gaussian_filter_line_buffer_prev_row_a3_a0_write_en_b;
reg [7:0] gaussian_filter_line_buffer_prev_row_a3_a0_write_data_b;
wire [7:0] gaussian_filter_line_buffer_prev_row_a3_a0_read_data_b;
wire  gaussian_filter_line_buffer_prev_row_a3_a0_read_en_b;
reg [31:0] gaussian_filter_count_inferred_reg;
reg [31:0] gaussian_filter_i_inferred_reg;
reg [31:0] gaussian_filter_j_inferred_reg;
reg  gaussian_filter_valid_bit_0;
reg  gaussian_filter_state_stall_0;
reg  gaussian_filter_state_enable_0;
reg  gaussian_filter_valid_bit_1;
reg  gaussian_filter_state_stall_1;
reg  gaussian_filter_state_enable_1;
reg  gaussian_filter_valid_bit_2;
reg  gaussian_filter_state_stall_2;
reg  gaussian_filter_state_enable_2;
reg  gaussian_filter_valid_bit_3;
reg  gaussian_filter_state_stall_3;
reg  gaussian_filter_state_enable_3;
reg  gaussian_filter_valid_bit_4;
reg  gaussian_filter_state_stall_4;
reg  gaussian_filter_state_enable_4;
reg  gaussian_filter_valid_bit_5;
wire  gaussian_filter_state_stall_5;
reg  gaussian_filter_state_enable_5;
reg  gaussian_filter_II_counter;
reg [7:0] gaussian_filter_entry_14_reg_stage3;
reg [7:0] gaussian_filter_entry_14_reg_stage4;
reg  gaussian_filter_entry_30_reg_stage1;
reg  gaussian_filter_entry_30_reg_stage2;
reg  gaussian_filter_entry_30_reg_stage3;
reg  gaussian_filter_entry_30_reg_stage4;
reg  gaussian_filter_entry_NotCondition_reg_stage1;
reg  gaussian_filter_entry_NotCondition_reg_stage2;
reg  gaussian_filter_entry_NotCondition_reg_stage3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_32_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_32_reg_stage2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_32_reg_stage3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_34_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_34_reg_stage2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] gaussian_filter_entry_36_reg_stage1;
reg  gaussian_filter_entry_exitMask_F3_reg_stage1;
reg  gaussian_filter_entry_exitMask_F3_reg_stage2;
reg  gaussian_filter_entry_exitMask_F3_reg_stage3;
reg  gaussian_filter_entry_exitMask_F3_reg_stage4;
reg  gaussian_filter_entry_exitMask_F9_reg_stage1;
reg  gaussian_filter_entry_exitMask_F9_reg_stage2;
reg  gaussian_filter_entry_exitMask_F9_reg_stage3;
reg  gaussian_filter_entry_exitMask_F9_reg_stage4;
reg  gaussian_filter_entry_exitMask_T12_reg_stage1;
reg  gaussian_filter_entry_exitMask_T12_reg_stage2;
reg  gaussian_filter_entry_exitMask_T12_reg_stage3;
reg  gaussian_filter_entry_exitMask_T12_reg_stage4;
reg  gaussian_filter_entry_exitMask_F14_reg_stage1;
reg  gaussian_filter_entry_exitMask_F14_reg_stage2;
reg  gaussian_filter_entry_exitMask_F14_reg_stage3;
reg  gaussian_filter_entry_exitMask_F14_reg_stage4;
reg [31:0] gaussian_filter_entry_bit_concat31_reg_stage4;
reg [31:0] gaussian_filter_entry_sr_add22_reg_stage3;
reg [31:0] gaussian_filter_entry_sr_add24_reg_stage2;
reg [31:0] gaussian_filter_entry_sr_add28_reg_stage2;
reg [31:0] gaussian_filter_entry_sr_add28_reg_stage3;
reg [31:0] gaussian_filter_entry_sr_add28_reg_stage4;
reg [31:0] gaussian_filter_entry_bit_concat12_reg_stage2;
reg [31:0] gaussian_filter_entry_bit_concat12_reg_stage3;
reg [31:0] gaussian_filter_entry_bit_concat12_reg_stage4;
reg [31:0] gaussian_filter_entry_sr_add30_reg_stage2;
reg [31:0] gaussian_filter_entry_sr_add30_reg_stage3;
reg [31:0] gaussian_filter_entry_bit_concat9_reg_stage1;
reg [31:0] gaussian_filter_entry_bit_concat9_reg_stage2;
reg [31:0] gaussian_filter_entry_bit_concat9_reg_stage3;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_n_reg_stage4;
reg [31:0] gaussian_filter_entry_sr_add32_reg_stage1;
reg [31:0] gaussian_filter_entry_sr_add32_reg_stage2;
reg [31:0] gaussian_filter_entry_sr_add32_reg_stage3;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var7_reg_stage4;
reg [31:0] gaussian_filter_entry_bit_concat6_reg_stage1;
reg [31:0] gaussian_filter_entry_bit_concat6_reg_stage2;
reg [31:0] gaussian_filter_entry_bit_concat5_reg_stage3;
reg [31:0] gaussian_filter_entry_bit_concat5_reg_stage4;
reg [31:0] gaussian_filter_entry_sr_add34_reg_stage1;
reg [31:0] gaussian_filter_entry_sr_add34_reg_stage2;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_a_var9_reg_stage3;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var10_reg_stage4;
reg [31:0] gaussian_filter_entry_bit_concat1_reg_stage1;
reg [31:0] gaussian_filter_entry_newEarly_newEarly_newEarly_n_var11_reg_stage2;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12_reg_stage3;
reg [31:0] gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12_reg_stage4;
reg  gaussian_filter_entry_ORexitM249_reg_stage1;
reg  gaussian_filter_entry_ORexitM249_reg_stage2;
reg  gaussian_filter_entry_ORexitM249_reg_stage3;
reg  gaussian_filter_entry_ORexitM249_reg_stage4;
reg  input_fifo_consumed_valid;
reg [7:0] input_fifo_consumed_data;
reg  input_fifo_consumed_taken;
reg [7:0] gaussian_filter_line_buffer_prev_row_a3_a0_read_data_wire_a;
reg  gaussian_filter_line_buffer_prev_row_a3_a0_clken_pipeline_cond;
reg [7:0] gaussian_filter_line_buffer_prev_row_a2_a0_read_data_wire_a;
reg  gaussian_filter_line_buffer_prev_row_a2_a0_clken_pipeline_cond;
reg [7:0] gaussian_filter_line_buffer_prev_row_a1_a0_read_data_wire_a;
reg  gaussian_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
reg [7:0] gaussian_filter_line_buffer_prev_row_a0_a0_read_data_wire_a;
reg  gaussian_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
wire [30:0] gaussian_filter_entry_bit_concat43_bit_select_operand_0;
wire [30:0] gaussian_filter_entry_bit_concat42_bit_select_operand_0;
wire [30:0] gaussian_filter_entry_bit_concat41_bit_select_operand_0;
reg  switch_fifo_0_consumed_valid;
reg  switch_fifo_0_consumed_data;
reg  switch_fifo_0_consumed_taken;
wire [23:0] gaussian_filter_entry_bit_concat40_bit_select_operand_0;
wire [23:0] gaussian_filter_entry_bit_concat39_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat38_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat38_bit_select_operand_4;
wire [21:0] gaussian_filter_entry_bit_concat37_bit_select_operand_0;
wire [1:0] gaussian_filter_entry_bit_concat37_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat36_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat35_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat35_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat34_bit_select_operand_0;
wire [23:0] gaussian_filter_entry_bit_concat33_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat32_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat32_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat31_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat31_bit_select_operand_4;
wire [22:0] gaussian_filter_entry_bit_concat30_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat30_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat29_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat29_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat28_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat28_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat27_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat26_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat26_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat25_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat24_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat24_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat23_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat23_bit_select_operand_4;
wire [21:0] gaussian_filter_entry_bit_concat22_bit_select_operand_0;
wire [1:0] gaussian_filter_entry_bit_concat22_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat21_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat21_bit_select_operand_4;
wire [22:0] gaussian_filter_entry_bit_concat20_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat20_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat19_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat19_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat18_bit_select_operand_0;
wire [23:0] gaussian_filter_entry_bit_concat17_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat16_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat16_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat15_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat15_bit_select_operand_4;
wire [22:0] gaussian_filter_entry_bit_concat14_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat14_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat13_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat13_bit_select_operand_4;
wire [20:0] gaussian_filter_entry_bit_concat12_bit_select_operand_0;
wire [2:0] gaussian_filter_entry_bit_concat12_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat11_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat10_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat10_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat9_bit_select_operand_0;
wire [23:0] gaussian_filter_entry_bit_concat8_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat7_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat7_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat6_bit_select_operand_0;
wire [1:0] gaussian_filter_entry_bit_concat5_bit_select_operand_2;
wire [23:0] gaussian_filter_entry_bit_concat3_bit_select_operand_0;
wire [22:0] gaussian_filter_entry_bit_concat2_bit_select_operand_0;
wire  gaussian_filter_entry_bit_concat2_bit_select_operand_4;
wire [23:0] gaussian_filter_entry_bit_concat1_bit_select_operand_0;
wire [30:0] gaussian_filter_entry_bit_concat_bit_select_operand_0;



// @_ZZ15gaussian_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEES6_E11line_buffer.prev_row.a2.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_line_buffer_prev_row_a2_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_line_buffer_prev_row_a2_a0_clken ),
	.address_a( gaussian_filter_line_buffer_prev_row_a2_a0_address_a ),
	.write_en_a( gaussian_filter_line_buffer_prev_row_a2_a0_write_en_a ),
	.write_data_a( gaussian_filter_line_buffer_prev_row_a2_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_line_buffer_prev_row_a2_a0_read_data_a ),
	.address_b( gaussian_filter_line_buffer_prev_row_a2_a0_address_b ),
	.write_en_b( gaussian_filter_line_buffer_prev_row_a2_a0_write_en_b ),
	.write_data_b( gaussian_filter_line_buffer_prev_row_a2_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_line_buffer_prev_row_a2_a0_read_data_b )
);
defparam gaussian_filter_line_buffer_prev_row_a2_a0.width_a = 8;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.widthad_a = 11;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.width_be_a = 1;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.numwords_a = 1920;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.width_b = 8;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.widthad_b = 11;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.width_be_b = 1;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.numwords_b = 1920;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.latency = 1;
defparam gaussian_filter_line_buffer_prev_row_a2_a0.init_file = {`MEM_INIT_DIR, "gaussian_filter_line_buffer_prev_row_a2_a0.mem"};



// @_ZZ15gaussian_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEES6_E11line_buffer.prev_row.a0.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_line_buffer_prev_row_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_line_buffer_prev_row_a0_a0_clken ),
	.address_a( gaussian_filter_line_buffer_prev_row_a0_a0_address_a ),
	.write_en_a( gaussian_filter_line_buffer_prev_row_a0_a0_write_en_a ),
	.write_data_a( gaussian_filter_line_buffer_prev_row_a0_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_line_buffer_prev_row_a0_a0_read_data_a ),
	.address_b( gaussian_filter_line_buffer_prev_row_a0_a0_address_b ),
	.write_en_b( gaussian_filter_line_buffer_prev_row_a0_a0_write_en_b ),
	.write_data_b( gaussian_filter_line_buffer_prev_row_a0_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_line_buffer_prev_row_a0_a0_read_data_b )
);
defparam gaussian_filter_line_buffer_prev_row_a0_a0.width_a = 8;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.widthad_a = 11;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.width_be_a = 1;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.numwords_a = 1920;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.width_b = 8;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.widthad_b = 11;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.width_be_b = 1;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.numwords_b = 1920;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.latency = 1;
defparam gaussian_filter_line_buffer_prev_row_a0_a0.init_file = {`MEM_INIT_DIR, "gaussian_filter_line_buffer_prev_row_a0_a0.mem"};



// @_ZZ15gaussian_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEES6_E11line_buffer.prev_row.a1.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_line_buffer_prev_row_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_line_buffer_prev_row_a1_a0_clken ),
	.address_a( gaussian_filter_line_buffer_prev_row_a1_a0_address_a ),
	.write_en_a( gaussian_filter_line_buffer_prev_row_a1_a0_write_en_a ),
	.write_data_a( gaussian_filter_line_buffer_prev_row_a1_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_line_buffer_prev_row_a1_a0_read_data_a ),
	.address_b( gaussian_filter_line_buffer_prev_row_a1_a0_address_b ),
	.write_en_b( gaussian_filter_line_buffer_prev_row_a1_a0_write_en_b ),
	.write_data_b( gaussian_filter_line_buffer_prev_row_a1_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_line_buffer_prev_row_a1_a0_read_data_b )
);
defparam gaussian_filter_line_buffer_prev_row_a1_a0.width_a = 8;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.widthad_a = 11;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.width_be_a = 1;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.numwords_a = 1920;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.width_b = 8;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.widthad_b = 11;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.width_be_b = 1;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.numwords_b = 1920;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.latency = 1;
defparam gaussian_filter_line_buffer_prev_row_a1_a0.init_file = {`MEM_INIT_DIR, "gaussian_filter_line_buffer_prev_row_a1_a0.mem"};



// @_ZZ15gaussian_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEES6_E11line_buffer.prev_row.a3.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port gaussian_filter_line_buffer_prev_row_a3_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( gaussian_filter_line_buffer_prev_row_a3_a0_clken ),
	.address_a( gaussian_filter_line_buffer_prev_row_a3_a0_address_a ),
	.write_en_a( gaussian_filter_line_buffer_prev_row_a3_a0_write_en_a ),
	.write_data_a( gaussian_filter_line_buffer_prev_row_a3_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( gaussian_filter_line_buffer_prev_row_a3_a0_read_data_a ),
	.address_b( gaussian_filter_line_buffer_prev_row_a3_a0_address_b ),
	.write_en_b( gaussian_filter_line_buffer_prev_row_a3_a0_write_en_b ),
	.write_data_b( gaussian_filter_line_buffer_prev_row_a3_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( gaussian_filter_line_buffer_prev_row_a3_a0_read_data_b )
);
defparam gaussian_filter_line_buffer_prev_row_a3_a0.width_a = 8;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.widthad_a = 11;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.width_be_a = 1;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.numwords_a = 1920;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.width_b = 8;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.widthad_b = 11;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.width_be_b = 1;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.numwords_b = 1920;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.latency = 1;
defparam gaussian_filter_line_buffer_prev_row_a3_a0.init_file = {`MEM_INIT_DIR, "gaussian_filter_line_buffer_prev_row_a3_a0.mem"};


always @(*) begin
		gaussian_filter_entry_1 = gaussian_filter_line_buffer_window_a0_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_3 = gaussian_filter_line_buffer_window_a0_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_4 = gaussian_filter_line_buffer_window_a0_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_5 = gaussian_filter_line_buffer_window_a0_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_6 = gaussian_filter_line_buffer_window_a1_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_8 = gaussian_filter_line_buffer_window_a1_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_9 = gaussian_filter_line_buffer_window_a1_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_10 = gaussian_filter_line_buffer_window_a1_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_11 = gaussian_filter_line_buffer_window_a2_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_13 = gaussian_filter_line_buffer_window_a2_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_14 = gaussian_filter_line_buffer_window_a2_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_15 = gaussian_filter_line_buffer_window_a2_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_16 = gaussian_filter_line_buffer_window_a3_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_18 = gaussian_filter_line_buffer_window_a3_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_19 = gaussian_filter_line_buffer_window_a3_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_20 = gaussian_filter_line_buffer_window_a3_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_21 = gaussian_filter_line_buffer_window_a4_a1_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_23 = gaussian_filter_line_buffer_window_a4_a2_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_24 = gaussian_filter_line_buffer_window_a4_a3_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_25 = gaussian_filter_line_buffer_window_a4_a4_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_26 = gaussian_filter_line_buffer_prev_row_index_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_27 = gaussian_filter_count_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_28 = gaussian_filter_i_inferred_reg;
end
always @(*) begin
		gaussian_filter_entry_29 = gaussian_filter_j_inferred_reg;
end
assign gaussian_filter_entry_30 = ~(input_fifo_consumed_valid);
always @(*) begin
		gaussian_filter_entry_NotCondition = (gaussian_filter_entry_30 ^ 1'd1);
end
always @(*) begin
	gaussian_filter_entry_31 = input_fifo_consumed_data;
end
always @(*) begin
		gaussian_filter_entry_32 = (1'd0 + (1 * gaussian_filter_entry_26));
end
always @(*) begin
		gaussian_filter_entry_33 = gaussian_filter_line_buffer_prev_row_a3_a0_read_data_wire_a;
end
always @(*) begin
		gaussian_filter_entry_34 = (1'd0 + (1 * gaussian_filter_entry_26));
end
always @(*) begin
		gaussian_filter_entry_35 = gaussian_filter_line_buffer_prev_row_a2_a0_read_data_wire_a;
end
always @(*) begin
		gaussian_filter_entry_36 = (1'd0 + (1 * gaussian_filter_entry_26));
end
always @(*) begin
		gaussian_filter_entry_37 = gaussian_filter_line_buffer_prev_row_a1_a0_read_data_wire_a;
end
always @(*) begin
		gaussian_filter_entry_38 = (1'd0 + (1 * gaussian_filter_entry_26));
end
always @(*) begin
		gaussian_filter_entry_39 = gaussian_filter_line_buffer_prev_row_a0_a0_read_data_wire_a;
end
always @(*) begin
		gaussian_filter_entry_cmp46_i = (gaussian_filter_entry_26 == 32'd1919);
end
always @(*) begin
		gaussian_filter_entry_add50_i = (gaussian_filter_entry_26 + 32'd1);
end
always @(*) begin
		gaussian_filter_entry_add50_i_var0 = (gaussian_filter_entry_cmp46_i ? 32'd0 : gaussian_filter_entry_add50_i);
end
always @(*) begin
		gaussian_filter_entry_cmp_i = (gaussian_filter_entry_27 > 32'd3841);
end
always @(*) begin
		gaussian_filter_entry_exitMask_T1 = (gaussian_filter_entry_cmp_i & gaussian_filter_entry_NotCondition);
end
always @(*) begin
		gaussian_filter_entry_NotCondition2 = (gaussian_filter_entry_cmp_i ^ 1'd1);
end
always @(*) begin
		gaussian_filter_entry_exitMask_F3 = (gaussian_filter_entry_NotCondition & gaussian_filter_entry_NotCondition2);
end
always @(*) begin
		gaussian_filter_entry_off = (gaussian_filter_entry_28 + $signed(-32'd2));
end
always @(*) begin
		gaussian_filter_entry_40 = (gaussian_filter_entry_off > 32'd1075);
end
always @(*) begin
		gaussian_filter_entry_bit_concat43 = {gaussian_filter_entry_bit_concat43_bit_select_operand_0[30:0], gaussian_filter_entry_40};
end
always @(*) begin
		gaussian_filter_entry_cmp4_i = (gaussian_filter_entry_29 < 32'd2);
end
always @(*) begin
		gaussian_filter_entry_bit_concat42 = {gaussian_filter_entry_bit_concat42_bit_select_operand_0[30:0], gaussian_filter_entry_cmp4_i};
end
always @(*) begin
		gaussian_filter_entry_or6_i = (gaussian_filter_entry_bit_concat43 | gaussian_filter_entry_bit_concat42);
end
always @(*) begin
		gaussian_filter_entry_cmp9_i = (gaussian_filter_entry_29 > 32'd1917);
end
always @(*) begin
		gaussian_filter_entry_bit_concat41 = {gaussian_filter_entry_bit_concat41_bit_select_operand_0[30:0], gaussian_filter_entry_cmp9_i};
end
always @(*) begin
		gaussian_filter_entry_or11_i = (gaussian_filter_entry_or6_i | gaussian_filter_entry_bit_concat41);
end
always @(*) begin
		gaussian_filter_entry_tobool_i = (gaussian_filter_entry_or11_i == 32'd0);
end
always @(*) begin
		gaussian_filter_entry_cmp_i1 = (gaussian_filter_entry_29 < 32'd1919);
end
always @(*) begin
		gaussian_filter_entry_exitMask_T4 = (gaussian_filter_entry_exitMask_T1 & gaussian_filter_entry_cmp_i1);
end
always @(*) begin
		gaussian_filter_entry_inc_i = (gaussian_filter_entry_29 + 32'd1);
end
always @(*) begin
		gaussian_filter_entry_cmp1_i = (gaussian_filter_entry_28 == 32'd1079);
end
always @(*) begin
		gaussian_filter_entry_cmp2_i = (gaussian_filter_entry_29 == 32'd1919);
end
always @(*) begin
		gaussian_filter_entry_or_cond_i = (gaussian_filter_entry_cmp1_i & gaussian_filter_entry_cmp2_i);
end
always @(*) begin
		gaussian_filter_entry_inc5_i = (gaussian_filter_entry_28 + 32'd1);
end
always @(*) begin
		gaussian_filter_entry_inc5_i_var1 = (gaussian_filter_entry_or_cond_i ? 32'd0 : gaussian_filter_entry_inc5_i);
end
always @(*) begin
		gaussian_filter_entry_select11 = (gaussian_filter_entry_exitMask_T4 ? gaussian_filter_entry_28 : gaussian_filter_entry_inc5_i_var1);
end
always @(*) begin
		gaussian_filter_entry_select = (gaussian_filter_entry_exitMask_T4 ? gaussian_filter_entry_inc_i : 32'd0);
end
always @(*) begin
	gaussian_filter_entry_41 = switch_fifo_0_consumed_data;
end
always @(*) begin
		gaussian_filter_entry_exitMask_T7 = (gaussian_filter_entry_exitMask_T1 & gaussian_filter_entry_41);
end
always @(*) begin
		gaussian_filter_entry_NotCondition8 = (gaussian_filter_entry_41 ^ 1'd1);
end
always @(*) begin
		gaussian_filter_entry_exitMask_F9 = (gaussian_filter_entry_exitMask_T1 & gaussian_filter_entry_NotCondition8);
end
always @(*) begin
		gaussian_filter_entry_exitMask_T12 = (gaussian_filter_entry_exitMask_T7 & gaussian_filter_entry_tobool_i);
end
always @(*) begin
		gaussian_filter_entry_NotCondition13 = (gaussian_filter_entry_tobool_i ^ 1'd1);
end
always @(*) begin
		gaussian_filter_entry_exitMask_F14 = (gaussian_filter_entry_exitMask_T7 & gaussian_filter_entry_NotCondition13);
end
always @(*) begin
		gaussian_filter_entry_bit_concat40 = {gaussian_filter_entry_bit_concat40_bit_select_operand_0[23:0], gaussian_filter_entry_1[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat39 = {gaussian_filter_entry_bit_concat39_bit_select_operand_0[23:0], gaussian_filter_entry_3[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat38 = {{gaussian_filter_entry_bit_concat38_bit_select_operand_0[22:0], gaussian_filter_entry_3[7:0]}, gaussian_filter_entry_bit_concat38_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add3 = (gaussian_filter_entry_bit_concat39 + gaussian_filter_entry_bit_concat38);
end
always @(*) begin
		gaussian_filter_entry_bit_concat37 = {{gaussian_filter_entry_bit_concat37_bit_select_operand_0[21:0], gaussian_filter_entry_4[7:0]}, gaussian_filter_entry_bit_concat37_bit_select_operand_4[1:0]};
end
always @(*) begin
		gaussian_filter_entry_newEarly_add_2 = (gaussian_filter_entry_bit_concat40 + gaussian_filter_entry_bit_concat37);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_add_2 = (gaussian_filter_entry_newEarly_add_2 + gaussian_filter_entry_sr_add3);
end
always @(*) begin
		gaussian_filter_entry_bit_concat36 = {gaussian_filter_entry_bit_concat36_bit_select_operand_0[23:0], gaussian_filter_entry_5[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat35 = {{gaussian_filter_entry_bit_concat35_bit_select_operand_0[22:0], gaussian_filter_entry_5[7:0]}, gaussian_filter_entry_bit_concat35_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add5 = (gaussian_filter_entry_bit_concat36 + gaussian_filter_entry_bit_concat35);
end
always @(*) begin
		gaussian_filter_entry_bit_concat34 = {gaussian_filter_entry_bit_concat34_bit_select_operand_0[23:0], gaussian_filter_entry_33[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat33 = {gaussian_filter_entry_bit_concat33_bit_select_operand_0[23:0], gaussian_filter_entry_6[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat32 = {{gaussian_filter_entry_bit_concat32_bit_select_operand_0[22:0], gaussian_filter_entry_6[7:0]}, gaussian_filter_entry_bit_concat32_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add8 = (gaussian_filter_entry_bit_concat33 + gaussian_filter_entry_bit_concat32);
end
always @(*) begin
		gaussian_filter_entry_bit_concat31 = {{gaussian_filter_entry_bit_concat31_bit_select_operand_0[20:0], gaussian_filter_entry_8[7:0]}, gaussian_filter_entry_bit_concat31_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_add_1_1 = (gaussian_filter_entry_bit_concat34 + gaussian_filter_entry_bit_concat31_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat30 = {{gaussian_filter_entry_bit_concat30_bit_select_operand_0[22:0], gaussian_filter_entry_9[7:0]}, gaussian_filter_entry_bit_concat30_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_bit_concat29 = {{gaussian_filter_entry_bit_concat29_bit_select_operand_0[20:0], gaussian_filter_entry_9[7:0]}, gaussian_filter_entry_bit_concat29_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_sr_add11 = (gaussian_filter_entry_bit_concat30 + gaussian_filter_entry_bit_concat29);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_add_2_1 = (gaussian_filter_entry_sr_add8 + gaussian_filter_entry_sr_add11);
end
always @(*) begin
		gaussian_filter_entry_bit_concat28 = {{gaussian_filter_entry_bit_concat28_bit_select_operand_0[20:0], gaussian_filter_entry_10[7:0]}, gaussian_filter_entry_bit_concat28_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat27 = {gaussian_filter_entry_bit_concat27_bit_select_operand_0[23:0], gaussian_filter_entry_35[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat26 = {{gaussian_filter_entry_bit_concat26_bit_select_operand_0[22:0], gaussian_filter_entry_35[7:0]}, gaussian_filter_entry_bit_concat26_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add13 = (gaussian_filter_entry_bit_concat27 + gaussian_filter_entry_bit_concat26);
end
always @(*) begin
		gaussian_filter_entry_bit_concat25 = {gaussian_filter_entry_bit_concat25_bit_select_operand_0[23:0], gaussian_filter_entry_11[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat24 = {{gaussian_filter_entry_bit_concat24_bit_select_operand_0[22:0], gaussian_filter_entry_13[7:0]}, gaussian_filter_entry_bit_concat24_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_bit_concat23 = {{gaussian_filter_entry_bit_concat23_bit_select_operand_0[20:0], gaussian_filter_entry_13[7:0]}, gaussian_filter_entry_bit_concat23_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_sr_add16 = (gaussian_filter_entry_bit_concat24 + gaussian_filter_entry_bit_concat23);
end
always @(*) begin
		gaussian_filter_entry_bit_concat22 = {{gaussian_filter_entry_bit_concat22_bit_select_operand_0[21:0], gaussian_filter_entry_14[7:0]}, gaussian_filter_entry_bit_concat22_bit_select_operand_4[1:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat21 = {{gaussian_filter_entry_bit_concat21_bit_select_operand_0[20:0], gaussian_filter_entry_14[7:0]}, gaussian_filter_entry_bit_concat21_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_sr_add19 = (gaussian_filter_entry_bit_concat22 + gaussian_filter_entry_bit_concat21);
end
always @(*) begin
		gaussian_filter_entry_bit_concat20 = {{gaussian_filter_entry_bit_concat20_bit_select_operand_0[22:0], gaussian_filter_entry_15[7:0]}, gaussian_filter_entry_bit_concat20_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_bit_concat19 = {{gaussian_filter_entry_bit_concat19_bit_select_operand_0[20:0], gaussian_filter_entry_15[7:0]}, gaussian_filter_entry_bit_concat19_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_sr_add22 = (gaussian_filter_entry_bit_concat20 + gaussian_filter_entry_bit_concat19);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a = (gaussian_filter_entry_sr_add13 + gaussian_filter_entry_sr_add22_reg_stage3);
end
always @(*) begin
		gaussian_filter_entry_bit_concat18 = {gaussian_filter_entry_bit_concat18_bit_select_operand_0[23:0], gaussian_filter_entry_37[7:0]};
end
always @(*) begin
		gaussian_filter_entry_mul_291 = (gaussian_filter_entry_bit_concat25 + gaussian_filter_entry_bit_concat18);
end
always @(*) begin
		gaussian_filter_entry_bit_concat17 = {gaussian_filter_entry_bit_concat17_bit_select_operand_0[23:0], gaussian_filter_entry_16[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat16 = {{gaussian_filter_entry_bit_concat16_bit_select_operand_0[22:0], gaussian_filter_entry_16[7:0]}, gaussian_filter_entry_bit_concat16_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add24 = (gaussian_filter_entry_bit_concat17 + gaussian_filter_entry_bit_concat16);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var3 = (gaussian_filter_entry_sr_add16 + gaussian_filter_entry_sr_add24_reg_stage2);
end
always @(*) begin
		gaussian_filter_entry_bit_concat15 = {{gaussian_filter_entry_bit_concat15_bit_select_operand_0[20:0], gaussian_filter_entry_18[7:0]}, gaussian_filter_entry_bit_concat15_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat14 = {{gaussian_filter_entry_bit_concat14_bit_select_operand_0[22:0], gaussian_filter_entry_19[7:0]}, gaussian_filter_entry_bit_concat14_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_bit_concat13 = {{gaussian_filter_entry_bit_concat13_bit_select_operand_0[20:0], gaussian_filter_entry_19[7:0]}, gaussian_filter_entry_bit_concat13_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_sr_add28 = (gaussian_filter_entry_bit_concat14 + gaussian_filter_entry_bit_concat13);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var4 = (gaussian_filter_entry_newCurOp_add_2 + gaussian_filter_entry_sr_add28_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat12 = {{gaussian_filter_entry_bit_concat12_bit_select_operand_0[20:0], gaussian_filter_entry_20[7:0]}, gaussian_filter_entry_bit_concat12_bit_select_operand_4[2:0]};
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var5 = (gaussian_filter_entry_newEarly_newEarly_add_1_1 + gaussian_filter_entry_bit_concat12_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat11 = {gaussian_filter_entry_bit_concat11_bit_select_operand_0[23:0], gaussian_filter_entry_39[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat10 = {{gaussian_filter_entry_bit_concat10_bit_select_operand_0[22:0], gaussian_filter_entry_39[7:0]}, gaussian_filter_entry_bit_concat10_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add30 = (gaussian_filter_entry_bit_concat11 + gaussian_filter_entry_bit_concat10);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var6 = (gaussian_filter_entry_newEarly_newEarly_add_2_1 + gaussian_filter_entry_sr_add30_reg_stage3);
end
always @(*) begin
		gaussian_filter_entry_bit_concat9 = {gaussian_filter_entry_bit_concat9_bit_select_operand_0[23:0], gaussian_filter_entry_21[7:0]};
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_n = (gaussian_filter_entry_bit_concat28 + gaussian_filter_entry_bit_concat9_reg_stage3);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_n = (gaussian_filter_entry_sr_add5 + gaussian_filter_entry_newEarly_newEarly_newEarly_n_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat8 = {gaussian_filter_entry_bit_concat8_bit_select_operand_0[23:0], gaussian_filter_entry_23[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat7 = {{gaussian_filter_entry_bit_concat7_bit_select_operand_0[22:0], gaussian_filter_entry_23[7:0]}, gaussian_filter_entry_bit_concat7_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add32 = (gaussian_filter_entry_bit_concat8 + gaussian_filter_entry_bit_concat7);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var7 = (gaussian_filter_entry_newEarly_newEarly_newEarly_a + gaussian_filter_entry_sr_add32_reg_stage3);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_a = (gaussian_filter_entry_newEarly_newEarly_newEarly_a_var4 + gaussian_filter_entry_newEarly_newEarly_newEarly_a_var7_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat6 = {gaussian_filter_entry_bit_concat6_bit_select_operand_0[23:0], gaussian_filter_entry_24[7:0]};
end
always @(*) begin
		gaussian_filter_entry_newEarly_add_2_32 = (gaussian_filter_entry_mul_291 + gaussian_filter_entry_bit_concat6_reg_stage2);
end
always @(*) begin
		gaussian_filter_entry_bit_select4 = gaussian_filter_entry_newEarly_add_2_32[29:0];
end
always @(*) begin
		gaussian_filter_entry_bit_concat5 = {gaussian_filter_entry_bit_select4[29:0], gaussian_filter_entry_bit_concat5_bit_select_operand_2[1:0]};
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var8 = (gaussian_filter_entry_newEarly_newEarly_newEarly_a_var5 + gaussian_filter_entry_bit_concat5_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat3 = {gaussian_filter_entry_bit_concat3_bit_select_operand_0[23:0], gaussian_filter_entry_25[7:0]};
end
always @(*) begin
		gaussian_filter_entry_bit_concat2 = {{gaussian_filter_entry_bit_concat2_bit_select_operand_0[22:0], gaussian_filter_entry_25[7:0]}, gaussian_filter_entry_bit_concat2_bit_select_operand_4};
end
always @(*) begin
		gaussian_filter_entry_sr_add34 = (gaussian_filter_entry_bit_concat3 + gaussian_filter_entry_bit_concat2);
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var9 = (gaussian_filter_entry_newEarly_newEarly_newEarly_a_var3 + gaussian_filter_entry_sr_add34_reg_stage2);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var10 = (gaussian_filter_entry_newEarly_newEarly_newEarly_a_var6 + gaussian_filter_entry_newEarly_newEarly_newEarly_a_var9_reg_stage3);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_add_3_4 = (gaussian_filter_entry_newCurOp_newEarly_newEarly_a + gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var10_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_bit_concat1 = {gaussian_filter_entry_bit_concat1_bit_select_operand_0[23:0], gaussian_filter_entry_31[7:0]};
end
always @(*) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_n_var11 = (gaussian_filter_entry_bit_concat15 + gaussian_filter_entry_bit_concat1_reg_stage1);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12 = (gaussian_filter_entry_sr_add19 + gaussian_filter_entry_newEarly_newEarly_newEarly_n_var11_reg_stage2);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var13 = (gaussian_filter_entry_newCurOp_newEarly_newEarly_n + gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12_reg_stage4);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_newEarly_add_4_4 = (gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var13 + gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var8);
end
always @(*) begin
		gaussian_filter_entry_newCurOp_add_4_4 = (gaussian_filter_entry_newCurOp_newEarly_add_3_4 + gaussian_filter_entry_newCurOp_newEarly_add_4_4);
end
always @(*) begin
		gaussian_filter_entry_bit_select = gaussian_filter_entry_newCurOp_add_4_4[14:7];
end
always @(*) begin
		gaussian_filter_entry_ORexitM249 = (gaussian_filter_entry_exitMask_F14 | gaussian_filter_entry_exitMask_F9);
end
always @(*) begin
		gaussian_filter_entry_select240 = (gaussian_filter_entry_30_reg_stage4 ? gaussian_filter_entry_1 : gaussian_filter_entry_3);
end
always @(*) begin
		gaussian_filter_entry_select244 = (gaussian_filter_entry_exitMask_F3_reg_stage4 ? gaussian_filter_entry_3 : gaussian_filter_entry_select240);
end
always @(*) begin
		gaussian_filter_entry_select246 = (gaussian_filter_entry_ORexitM249_reg_stage4 ? gaussian_filter_entry_3 : gaussian_filter_entry_select244);
end
always @(*) begin
		gaussian_filter_entry_select224 = (gaussian_filter_entry_30_reg_stage4 ? gaussian_filter_entry_3 : gaussian_filter_entry_4);
end
always @(*) begin
		gaussian_filter_entry_select228 = (gaussian_filter_entry_exitMask_F3_reg_stage4 ? gaussian_filter_entry_4 : gaussian_filter_entry_select224);
end
always @(*) begin
		gaussian_filter_entry_select230 = (gaussian_filter_entry_ORexitM249_reg_stage4 ? gaussian_filter_entry_4 : gaussian_filter_entry_select228);
end
always @(*) begin
		gaussian_filter_entry_select216 = (gaussian_filter_entry_30_reg_stage4 ? gaussian_filter_entry_4 : gaussian_filter_entry_5);
end
always @(*) begin
		gaussian_filter_entry_select220 = (gaussian_filter_entry_exitMask_F3_reg_stage4 ? gaussian_filter_entry_5 : gaussian_filter_entry_select216);
end
always @(*) begin
		gaussian_filter_entry_select222 = (gaussian_filter_entry_ORexitM249_reg_stage4 ? gaussian_filter_entry_5 : gaussian_filter_entry_select220);
end
always @(*) begin
		gaussian_filter_entry_select208 = (gaussian_filter_entry_30_reg_stage4 ? gaussian_filter_entry_5 : gaussian_filter_entry_33);
end
always @(*) begin
		gaussian_filter_entry_select212 = (gaussian_filter_entry_exitMask_F3_reg_stage4 ? gaussian_filter_entry_33 : gaussian_filter_entry_select208);
end
always @(*) begin
		gaussian_filter_entry_select214 = (gaussian_filter_entry_ORexitM249_reg_stage4 ? gaussian_filter_entry_33 : gaussian_filter_entry_select212);
end
always @(*) begin
		gaussian_filter_entry_select200 = (gaussian_filter_entry_30_reg_stage3 ? gaussian_filter_entry_6 : gaussian_filter_entry_8);
end
always @(*) begin
		gaussian_filter_entry_select204 = (gaussian_filter_entry_exitMask_F3_reg_stage3 ? gaussian_filter_entry_8 : gaussian_filter_entry_select200);
end
always @(*) begin
		gaussian_filter_entry_select206 = (gaussian_filter_entry_ORexitM249_reg_stage3 ? gaussian_filter_entry_8 : gaussian_filter_entry_select204);
end
always @(*) begin
		gaussian_filter_entry_select184 = (gaussian_filter_entry_30_reg_stage3 ? gaussian_filter_entry_8 : gaussian_filter_entry_9);
end
always @(*) begin
		gaussian_filter_entry_select188 = (gaussian_filter_entry_exitMask_F3_reg_stage3 ? gaussian_filter_entry_9 : gaussian_filter_entry_select184);
end
always @(*) begin
		gaussian_filter_entry_select190 = (gaussian_filter_entry_ORexitM249_reg_stage3 ? gaussian_filter_entry_9 : gaussian_filter_entry_select188);
end
always @(*) begin
		gaussian_filter_entry_select176 = (gaussian_filter_entry_30_reg_stage3 ? gaussian_filter_entry_9 : gaussian_filter_entry_10);
end
always @(*) begin
		gaussian_filter_entry_select180 = (gaussian_filter_entry_exitMask_F3_reg_stage3 ? gaussian_filter_entry_10 : gaussian_filter_entry_select176);
end
always @(*) begin
		gaussian_filter_entry_select182 = (gaussian_filter_entry_ORexitM249_reg_stage3 ? gaussian_filter_entry_10 : gaussian_filter_entry_select180);
end
always @(*) begin
		gaussian_filter_entry_select168 = (gaussian_filter_entry_30_reg_stage3 ? gaussian_filter_entry_10 : gaussian_filter_entry_35);
end
always @(*) begin
		gaussian_filter_entry_select172 = (gaussian_filter_entry_exitMask_F3_reg_stage3 ? gaussian_filter_entry_35 : gaussian_filter_entry_select168);
end
always @(*) begin
		gaussian_filter_entry_select174 = (gaussian_filter_entry_ORexitM249_reg_stage3 ? gaussian_filter_entry_35 : gaussian_filter_entry_select172);
end
always @(*) begin
		gaussian_filter_entry_select160 = (gaussian_filter_entry_30_reg_stage2 ? gaussian_filter_entry_11 : gaussian_filter_entry_13);
end
always @(*) begin
		gaussian_filter_entry_select164 = (gaussian_filter_entry_exitMask_F3_reg_stage2 ? gaussian_filter_entry_13 : gaussian_filter_entry_select160);
end
always @(*) begin
		gaussian_filter_entry_select166 = (gaussian_filter_entry_ORexitM249_reg_stage2 ? gaussian_filter_entry_13 : gaussian_filter_entry_select164);
end
always @(*) begin
		gaussian_filter_entry_select144 = (gaussian_filter_entry_30_reg_stage2 ? gaussian_filter_entry_13 : gaussian_filter_entry_14);
end
always @(*) begin
		gaussian_filter_entry_select148 = (gaussian_filter_entry_exitMask_F3_reg_stage2 ? gaussian_filter_entry_14 : gaussian_filter_entry_select144);
end
always @(*) begin
		gaussian_filter_entry_select150 = (gaussian_filter_entry_ORexitM249_reg_stage2 ? gaussian_filter_entry_14 : gaussian_filter_entry_select148);
end
always @(*) begin
		gaussian_filter_entry_select136 = (gaussian_filter_entry_30_reg_stage2 ? gaussian_filter_entry_14 : gaussian_filter_entry_15);
end
always @(*) begin
		gaussian_filter_entry_select140 = (gaussian_filter_entry_exitMask_F3_reg_stage2 ? gaussian_filter_entry_15 : gaussian_filter_entry_select136);
end
always @(*) begin
		gaussian_filter_entry_select142 = (gaussian_filter_entry_ORexitM249_reg_stage2 ? gaussian_filter_entry_15 : gaussian_filter_entry_select140);
end
always @(*) begin
		gaussian_filter_entry_select128 = (gaussian_filter_entry_30_reg_stage2 ? gaussian_filter_entry_15 : gaussian_filter_entry_37);
end
always @(*) begin
		gaussian_filter_entry_select132 = (gaussian_filter_entry_exitMask_F3_reg_stage2 ? gaussian_filter_entry_37 : gaussian_filter_entry_select128);
end
always @(*) begin
		gaussian_filter_entry_select134 = (gaussian_filter_entry_ORexitM249_reg_stage2 ? gaussian_filter_entry_37 : gaussian_filter_entry_select132);
end
always @(*) begin
		gaussian_filter_entry_select120 = (gaussian_filter_entry_30_reg_stage1 ? gaussian_filter_entry_16 : gaussian_filter_entry_18);
end
always @(*) begin
		gaussian_filter_entry_select124 = (gaussian_filter_entry_exitMask_F3_reg_stage1 ? gaussian_filter_entry_18 : gaussian_filter_entry_select120);
end
always @(*) begin
		gaussian_filter_entry_select126 = (gaussian_filter_entry_ORexitM249_reg_stage1 ? gaussian_filter_entry_18 : gaussian_filter_entry_select124);
end
always @(*) begin
		gaussian_filter_entry_select104 = (gaussian_filter_entry_30_reg_stage1 ? gaussian_filter_entry_18 : gaussian_filter_entry_19);
end
always @(*) begin
		gaussian_filter_entry_select108 = (gaussian_filter_entry_exitMask_F3_reg_stage1 ? gaussian_filter_entry_19 : gaussian_filter_entry_select104);
end
always @(*) begin
		gaussian_filter_entry_select110 = (gaussian_filter_entry_ORexitM249_reg_stage1 ? gaussian_filter_entry_19 : gaussian_filter_entry_select108);
end
always @(*) begin
		gaussian_filter_entry_select96 = (gaussian_filter_entry_30_reg_stage1 ? gaussian_filter_entry_19 : gaussian_filter_entry_20);
end
always @(*) begin
		gaussian_filter_entry_select100 = (gaussian_filter_entry_exitMask_F3_reg_stage1 ? gaussian_filter_entry_20 : gaussian_filter_entry_select96);
end
always @(*) begin
		gaussian_filter_entry_select102 = (gaussian_filter_entry_ORexitM249_reg_stage1 ? gaussian_filter_entry_20 : gaussian_filter_entry_select100);
end
always @(*) begin
		gaussian_filter_entry_select88 = (gaussian_filter_entry_30_reg_stage1 ? gaussian_filter_entry_20 : gaussian_filter_entry_39);
end
always @(*) begin
		gaussian_filter_entry_select92 = (gaussian_filter_entry_exitMask_F3_reg_stage1 ? gaussian_filter_entry_39 : gaussian_filter_entry_select88);
end
always @(*) begin
		gaussian_filter_entry_select94 = (gaussian_filter_entry_ORexitM249_reg_stage1 ? gaussian_filter_entry_39 : gaussian_filter_entry_select92);
end
always @(*) begin
		gaussian_filter_entry_select80 = (gaussian_filter_entry_30 ? gaussian_filter_entry_21 : gaussian_filter_entry_23);
end
always @(*) begin
		gaussian_filter_entry_select84 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_23 : gaussian_filter_entry_select80);
end
always @(*) begin
		gaussian_filter_entry_select86 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_23 : gaussian_filter_entry_select84);
end
always @(*) begin
		gaussian_filter_entry_select64 = (gaussian_filter_entry_30 ? gaussian_filter_entry_23 : gaussian_filter_entry_24);
end
always @(*) begin
		gaussian_filter_entry_select68 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_24 : gaussian_filter_entry_select64);
end
always @(*) begin
		gaussian_filter_entry_select70 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_24 : gaussian_filter_entry_select68);
end
always @(*) begin
		gaussian_filter_entry_select56 = (gaussian_filter_entry_30 ? gaussian_filter_entry_24 : gaussian_filter_entry_25);
end
always @(*) begin
		gaussian_filter_entry_select60 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_25 : gaussian_filter_entry_select56);
end
always @(*) begin
		gaussian_filter_entry_select62 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_25 : gaussian_filter_entry_select60);
end
always @(*) begin
		gaussian_filter_entry_select48 = (gaussian_filter_entry_30 ? gaussian_filter_entry_25 : gaussian_filter_entry_31);
end
always @(*) begin
		gaussian_filter_entry_select52 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_31 : gaussian_filter_entry_select48);
end
always @(*) begin
		gaussian_filter_entry_select54 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_31 : gaussian_filter_entry_select52);
end
always @(*) begin
		gaussian_filter_entry_select40 = (gaussian_filter_entry_30 ? gaussian_filter_entry_26 : gaussian_filter_entry_add50_i_var0);
end
always @(*) begin
		gaussian_filter_entry_select44 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_add50_i_var0 : gaussian_filter_entry_select40);
end
always @(*) begin
		gaussian_filter_entry_select46 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_add50_i_var0 : gaussian_filter_entry_select44);
end
always @(*) begin
		gaussian_filter_entry_bit_concat = {gaussian_filter_entry_bit_concat_bit_select_operand_0[30:0], gaussian_filter_entry_exitMask_F3};
end
always @(*) begin
		gaussian_filter_entry_select36 = (gaussian_filter_entry_ORexitM249 ? 32'd0 : gaussian_filter_entry_bit_concat);
end
always @(*) begin
		gaussian_filter_entry_select38 = (gaussian_filter_entry_27 + gaussian_filter_entry_select36);
end
always @(*) begin
		gaussian_filter_entry_select24 = (gaussian_filter_entry_30 ? gaussian_filter_entry_28 : gaussian_filter_entry_select11);
end
always @(*) begin
		gaussian_filter_entry_select28 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_28 : gaussian_filter_entry_select24);
end
always @(*) begin
		gaussian_filter_entry_select30 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_select11 : gaussian_filter_entry_select28);
end
always @(*) begin
		gaussian_filter_entry_select16 = (gaussian_filter_entry_30 ? gaussian_filter_entry_29 : gaussian_filter_entry_select);
end
always @(*) begin
		gaussian_filter_entry_select20 = (gaussian_filter_entry_exitMask_F3 ? gaussian_filter_entry_29 : gaussian_filter_entry_select16);
end
always @(*) begin
		gaussian_filter_entry_select22 = (gaussian_filter_entry_ORexitM249 ? gaussian_filter_entry_select : gaussian_filter_entry_select20);
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a0_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_4 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a0_a1_inferred_reg <= gaussian_filter_entry_select246;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a0_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_4 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a0_a2_inferred_reg <= gaussian_filter_entry_select230;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a0_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_4 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a0_a3_inferred_reg <= gaussian_filter_entry_select222;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a0_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_4 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a0_a4_inferred_reg <= gaussian_filter_entry_select214;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a1_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_3 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a1_a1_inferred_reg <= gaussian_filter_entry_select206;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a1_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_3 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a1_a2_inferred_reg <= gaussian_filter_entry_select190;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a1_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_3 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a1_a3_inferred_reg <= gaussian_filter_entry_select182;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a1_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_3 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a1_a4_inferred_reg <= gaussian_filter_entry_select174;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a2_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_2 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a2_a1_inferred_reg <= gaussian_filter_entry_select166;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a2_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_2 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a2_a2_inferred_reg <= gaussian_filter_entry_select150;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a2_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_2 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a2_a3_inferred_reg <= gaussian_filter_entry_select142;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a2_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_2 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a2_a4_inferred_reg <= gaussian_filter_entry_select134;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a3_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_1 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a3_a1_inferred_reg <= gaussian_filter_entry_select126;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a3_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_1 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a3_a2_inferred_reg <= gaussian_filter_entry_select110;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a3_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_1 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a3_a3_inferred_reg <= gaussian_filter_entry_select102;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a3_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_1 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a3_a4_inferred_reg <= gaussian_filter_entry_select94;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a4_a1_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a4_a1_inferred_reg <= gaussian_filter_entry_select86;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a4_a2_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a4_a2_inferred_reg <= gaussian_filter_entry_select70;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a4_a3_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a4_a3_inferred_reg <= gaussian_filter_entry_select62;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_window_a4_a4_inferred_reg <= 8'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_line_buffer_window_a4_a4_inferred_reg <= gaussian_filter_entry_select54;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_line_buffer_prev_row_index_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_line_buffer_prev_row_index_inferred_reg <= gaussian_filter_entry_select46;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_clken = gaussian_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_address_a = 'dx;
	if ((gaussian_filter_state_enable_0 & gaussian_filter_entry_NotCondition)) begin
		gaussian_filter_line_buffer_prev_row_a0_a0_address_a = (gaussian_filter_entry_38 >>> 1'd0);
	end
end
assign gaussian_filter_line_buffer_prev_row_a0_a0_write_en_a = 'd0;
assign gaussian_filter_line_buffer_prev_row_a0_a0_write_data_a = 'dx;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_read_en_a = 'd0;
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_line_buffer_prev_row_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_address_b = 'dx;
	if ((gaussian_filter_valid_bit_0 & gaussian_filter_entry_NotCondition)) begin
		gaussian_filter_line_buffer_prev_row_a0_a0_address_b = (gaussian_filter_entry_38 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_write_en_b = 'd0;
	if ((gaussian_filter_state_enable_0 & gaussian_filter_entry_NotCondition)) begin
		gaussian_filter_line_buffer_prev_row_a0_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_write_data_b = 'dx;
	if ((gaussian_filter_valid_bit_0 & gaussian_filter_entry_NotCondition)) begin
		gaussian_filter_line_buffer_prev_row_a0_a0_write_data_b = gaussian_filter_entry_31;
	end
end
assign gaussian_filter_line_buffer_prev_row_a0_a0_read_en_b = 'd0;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_clken = gaussian_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_address_a = 'dx;
	if ((gaussian_filter_state_enable_1 & gaussian_filter_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_line_buffer_prev_row_a1_a0_address_a = (gaussian_filter_entry_36_reg_stage1 >>> 1'd0);
	end
end
assign gaussian_filter_line_buffer_prev_row_a1_a0_write_en_a = 'd0;
assign gaussian_filter_line_buffer_prev_row_a1_a0_write_data_a = 'dx;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_read_en_a = 'd0;
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_line_buffer_prev_row_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_address_b = 'dx;
	if ((gaussian_filter_valid_bit_1 & gaussian_filter_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_line_buffer_prev_row_a1_a0_address_b = (gaussian_filter_entry_36_reg_stage1 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_write_en_b = 'd0;
	if ((gaussian_filter_state_enable_1 & gaussian_filter_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_line_buffer_prev_row_a1_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_write_data_b = 'dx;
	if ((gaussian_filter_valid_bit_1 & gaussian_filter_entry_NotCondition_reg_stage1)) begin
		gaussian_filter_line_buffer_prev_row_a1_a0_write_data_b = gaussian_filter_entry_39;
	end
end
assign gaussian_filter_line_buffer_prev_row_a1_a0_read_en_b = 'd0;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_clken = gaussian_filter_line_buffer_prev_row_a2_a0_clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_address_a = 'dx;
	if ((gaussian_filter_state_enable_2 & gaussian_filter_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_line_buffer_prev_row_a2_a0_address_a = (gaussian_filter_entry_34_reg_stage2 >>> 1'd0);
	end
end
assign gaussian_filter_line_buffer_prev_row_a2_a0_write_en_a = 'd0;
assign gaussian_filter_line_buffer_prev_row_a2_a0_write_data_a = 'dx;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_read_en_a = 'd0;
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_line_buffer_prev_row_a2_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_address_b = 'dx;
	if ((gaussian_filter_valid_bit_2 & gaussian_filter_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_line_buffer_prev_row_a2_a0_address_b = (gaussian_filter_entry_34_reg_stage2 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_write_en_b = 'd0;
	if ((gaussian_filter_state_enable_2 & gaussian_filter_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_line_buffer_prev_row_a2_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_write_data_b = 'dx;
	if ((gaussian_filter_valid_bit_2 & gaussian_filter_entry_NotCondition_reg_stage2)) begin
		gaussian_filter_line_buffer_prev_row_a2_a0_write_data_b = gaussian_filter_entry_37;
	end
end
assign gaussian_filter_line_buffer_prev_row_a2_a0_read_en_b = 'd0;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_clken = gaussian_filter_line_buffer_prev_row_a3_a0_clken_pipeline_cond;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_address_a = 'dx;
	if ((gaussian_filter_state_enable_3 & gaussian_filter_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_line_buffer_prev_row_a3_a0_address_a = (gaussian_filter_entry_32_reg_stage3 >>> 1'd0);
	end
end
assign gaussian_filter_line_buffer_prev_row_a3_a0_write_en_a = 'd0;
assign gaussian_filter_line_buffer_prev_row_a3_a0_write_data_a = 'dx;
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_read_en_a = 'd0;
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_line_buffer_prev_row_a3_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_address_b = 'dx;
	if ((gaussian_filter_valid_bit_3 & gaussian_filter_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_line_buffer_prev_row_a3_a0_address_b = (gaussian_filter_entry_32_reg_stage3 >>> 1'd0);
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_write_en_b = 'd0;
	if ((gaussian_filter_state_enable_3 & gaussian_filter_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_line_buffer_prev_row_a3_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_write_data_b = 'dx;
	if ((gaussian_filter_valid_bit_3 & gaussian_filter_entry_NotCondition_reg_stage3)) begin
		gaussian_filter_line_buffer_prev_row_a3_a0_write_data_b = gaussian_filter_entry_35;
	end
end
assign gaussian_filter_line_buffer_prev_row_a3_a0_read_en_b = 'd0;
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_count_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_count_inferred_reg <= gaussian_filter_entry_select38;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_i_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_i_inferred_reg <= gaussian_filter_entry_select30;
	end
end
always @(posedge clk) begin
	if (reset) begin
		gaussian_filter_j_inferred_reg <= 32'd0;
	end
	if ((gaussian_filter_state_enable_0 & 1'd1)) begin
		gaussian_filter_j_inferred_reg <= gaussian_filter_entry_select22;
	end
end
always @(posedge clk) begin
	if (~(gaussian_filter_state_stall_0)) begin
		gaussian_filter_valid_bit_0 <= (gaussian_filter_II_counter & start);
	end
	if (reset) begin
		gaussian_filter_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_state_stall_0 = 1'd0;
	if (gaussian_filter_state_stall_1) begin
		gaussian_filter_state_stall_0 = 1'd1;
	end
	if (((gaussian_filter_valid_bit_0 & gaussian_filter_entry_NotCondition) & ~(input_fifo_consumed_valid))) begin
		gaussian_filter_state_stall_0 = 1'd1;
	end
	if (((gaussian_filter_valid_bit_0 & gaussian_filter_entry_exitMask_T1) & ~(switch_fifo_0_consumed_valid))) begin
		gaussian_filter_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_state_enable_0 = (gaussian_filter_valid_bit_0 & ~(gaussian_filter_state_stall_0));
end
always @(posedge clk) begin
	if (~(gaussian_filter_state_stall_1)) begin
		gaussian_filter_valid_bit_1 <= gaussian_filter_state_enable_0;
	end
	if (reset) begin
		gaussian_filter_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_state_stall_1 = 1'd0;
	if (gaussian_filter_state_stall_2) begin
		gaussian_filter_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_state_enable_1 = (gaussian_filter_valid_bit_1 & ~(gaussian_filter_state_stall_1));
end
always @(posedge clk) begin
	if (~(gaussian_filter_state_stall_2)) begin
		gaussian_filter_valid_bit_2 <= gaussian_filter_state_enable_1;
	end
	if (reset) begin
		gaussian_filter_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_state_stall_2 = 1'd0;
	if (gaussian_filter_state_stall_3) begin
		gaussian_filter_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_state_enable_2 = (gaussian_filter_valid_bit_2 & ~(gaussian_filter_state_stall_2));
end
always @(posedge clk) begin
	if (~(gaussian_filter_state_stall_3)) begin
		gaussian_filter_valid_bit_3 <= gaussian_filter_state_enable_2;
	end
	if (reset) begin
		gaussian_filter_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_state_stall_3 = 1'd0;
	if (gaussian_filter_state_stall_4) begin
		gaussian_filter_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_state_enable_3 = (gaussian_filter_valid_bit_3 & ~(gaussian_filter_state_stall_3));
end
always @(posedge clk) begin
	if (~(gaussian_filter_state_stall_4)) begin
		gaussian_filter_valid_bit_4 <= gaussian_filter_state_enable_3;
	end
	if (reset) begin
		gaussian_filter_valid_bit_4 <= 1'd0;
	end
end
always @(*) begin
	gaussian_filter_state_stall_4 = 1'd0;
	if (gaussian_filter_state_stall_5) begin
		gaussian_filter_state_stall_4 = 1'd1;
	end
	if (((gaussian_filter_valid_bit_4 & ~(output_fifo_ready)) & gaussian_filter_entry_exitMask_F9_reg_stage4)) begin
		gaussian_filter_state_stall_4 = 1'd1;
	end
	if (((gaussian_filter_valid_bit_4 & ~(output_fifo_ready)) & gaussian_filter_entry_exitMask_F14_reg_stage4)) begin
		gaussian_filter_state_stall_4 = 1'd1;
	end
	if (((gaussian_filter_valid_bit_4 & ~(output_fifo_ready)) & gaussian_filter_entry_exitMask_T12_reg_stage4)) begin
		gaussian_filter_state_stall_4 = 1'd1;
	end
end
always @(*) begin
	gaussian_filter_state_enable_4 = (gaussian_filter_valid_bit_4 & ~(gaussian_filter_state_stall_4));
end
always @(posedge clk) begin
	if (~(gaussian_filter_state_stall_5)) begin
		gaussian_filter_valid_bit_5 <= gaussian_filter_state_enable_4;
	end
	if (reset) begin
		gaussian_filter_valid_bit_5 <= 1'd0;
	end
end
assign gaussian_filter_state_stall_5 = 1'd0;
always @(*) begin
	gaussian_filter_state_enable_5 = (gaussian_filter_valid_bit_5 & ~(gaussian_filter_state_stall_5));
end
always @(posedge clk) begin
	gaussian_filter_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_14_reg_stage3 <= gaussian_filter_entry_14;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_14_reg_stage4 <= gaussian_filter_entry_14_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_30_reg_stage1 <= gaussian_filter_entry_30;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_30_reg_stage2 <= gaussian_filter_entry_30_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_30_reg_stage3 <= gaussian_filter_entry_30_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_30_reg_stage4 <= gaussian_filter_entry_30_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_NotCondition_reg_stage1 <= gaussian_filter_entry_NotCondition;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_NotCondition_reg_stage2 <= gaussian_filter_entry_NotCondition_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_NotCondition_reg_stage3 <= gaussian_filter_entry_NotCondition_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_32_reg_stage1 <= gaussian_filter_entry_32;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_32_reg_stage2 <= gaussian_filter_entry_32_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_32_reg_stage3 <= gaussian_filter_entry_32_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_34_reg_stage1 <= gaussian_filter_entry_34;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_34_reg_stage2 <= gaussian_filter_entry_34_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_36_reg_stage1 <= gaussian_filter_entry_36;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_exitMask_F3_reg_stage1 <= gaussian_filter_entry_exitMask_F3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_exitMask_F3_reg_stage2 <= gaussian_filter_entry_exitMask_F3_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_exitMask_F3_reg_stage3 <= gaussian_filter_entry_exitMask_F3_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_exitMask_F3_reg_stage4 <= gaussian_filter_entry_exitMask_F3_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_exitMask_F9_reg_stage1 <= gaussian_filter_entry_exitMask_F9;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_exitMask_F9_reg_stage2 <= gaussian_filter_entry_exitMask_F9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_exitMask_F9_reg_stage3 <= gaussian_filter_entry_exitMask_F9_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_exitMask_F9_reg_stage4 <= gaussian_filter_entry_exitMask_F9_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_exitMask_T12_reg_stage1 <= gaussian_filter_entry_exitMask_T12;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_exitMask_T12_reg_stage2 <= gaussian_filter_entry_exitMask_T12_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_exitMask_T12_reg_stage3 <= gaussian_filter_entry_exitMask_T12_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_exitMask_T12_reg_stage4 <= gaussian_filter_entry_exitMask_T12_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_exitMask_F14_reg_stage1 <= gaussian_filter_entry_exitMask_F14;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_exitMask_F14_reg_stage2 <= gaussian_filter_entry_exitMask_F14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_exitMask_F14_reg_stage3 <= gaussian_filter_entry_exitMask_F14_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_exitMask_F14_reg_stage4 <= gaussian_filter_entry_exitMask_F14_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_bit_concat31_reg_stage4 <= gaussian_filter_entry_bit_concat31;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_sr_add22_reg_stage3 <= gaussian_filter_entry_sr_add22;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_sr_add24_reg_stage2 <= gaussian_filter_entry_sr_add24;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_sr_add28_reg_stage2 <= gaussian_filter_entry_sr_add28;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_sr_add28_reg_stage3 <= gaussian_filter_entry_sr_add28_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_sr_add28_reg_stage4 <= gaussian_filter_entry_sr_add28_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_bit_concat12_reg_stage2 <= gaussian_filter_entry_bit_concat12;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_bit_concat12_reg_stage3 <= gaussian_filter_entry_bit_concat12_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_bit_concat12_reg_stage4 <= gaussian_filter_entry_bit_concat12_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_sr_add30_reg_stage2 <= gaussian_filter_entry_sr_add30;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_sr_add30_reg_stage3 <= gaussian_filter_entry_sr_add30_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_bit_concat9_reg_stage1 <= gaussian_filter_entry_bit_concat9;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_bit_concat9_reg_stage2 <= gaussian_filter_entry_bit_concat9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_bit_concat9_reg_stage3 <= gaussian_filter_entry_bit_concat9_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_n_reg_stage4 <= gaussian_filter_entry_newEarly_newEarly_newEarly_n;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_sr_add32_reg_stage1 <= gaussian_filter_entry_sr_add32;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_sr_add32_reg_stage2 <= gaussian_filter_entry_sr_add32_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_sr_add32_reg_stage3 <= gaussian_filter_entry_sr_add32_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var7_reg_stage4 <= gaussian_filter_entry_newEarly_newEarly_newEarly_a_var7;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_bit_concat6_reg_stage1 <= gaussian_filter_entry_bit_concat6;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_bit_concat6_reg_stage2 <= gaussian_filter_entry_bit_concat6_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_bit_concat5_reg_stage3 <= gaussian_filter_entry_bit_concat5;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_bit_concat5_reg_stage4 <= gaussian_filter_entry_bit_concat5_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_sr_add34_reg_stage1 <= gaussian_filter_entry_sr_add34;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_sr_add34_reg_stage2 <= gaussian_filter_entry_sr_add34_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_a_var9_reg_stage3 <= gaussian_filter_entry_newEarly_newEarly_newEarly_a_var9;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var10_reg_stage4 <= gaussian_filter_entry_newCurOp_newEarly_newEarly_a_var10;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_bit_concat1_reg_stage1 <= gaussian_filter_entry_bit_concat1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_newEarly_newEarly_newEarly_n_var11_reg_stage2 <= gaussian_filter_entry_newEarly_newEarly_newEarly_n_var11;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12_reg_stage3 <= gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12_reg_stage4 <= gaussian_filter_entry_newCurOp_newEarly_newEarly_n_var12_reg_stage3;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_0) begin
		gaussian_filter_entry_ORexitM249_reg_stage1 <= gaussian_filter_entry_ORexitM249;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_1) begin
		gaussian_filter_entry_ORexitM249_reg_stage2 <= gaussian_filter_entry_ORexitM249_reg_stage1;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_2) begin
		gaussian_filter_entry_ORexitM249_reg_stage3 <= gaussian_filter_entry_ORexitM249_reg_stage2;
	end
end
always @(posedge clk) begin
	if (gaussian_filter_state_enable_3) begin
		gaussian_filter_entry_ORexitM249_reg_stage4 <= gaussian_filter_entry_ORexitM249_reg_stage3;
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
	if ((gaussian_filter_valid_bit_0 & gaussian_filter_entry_NotCondition)) begin
		input_fifo_consumed_taken = ~(gaussian_filter_state_stall_0);
	end
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_read_data_wire_a = gaussian_filter_line_buffer_prev_row_a3_a0_read_data_a;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a3_a0_clken_pipeline_cond = ~(gaussian_filter_state_stall_4);
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_read_data_wire_a = gaussian_filter_line_buffer_prev_row_a2_a0_read_data_a;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a2_a0_clken_pipeline_cond = ~(gaussian_filter_state_stall_3);
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_read_data_wire_a = gaussian_filter_line_buffer_prev_row_a1_a0_read_data_a;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond = ~(gaussian_filter_state_stall_2);
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_read_data_wire_a = gaussian_filter_line_buffer_prev_row_a0_a0_read_data_a;
end
always @(*) begin
	gaussian_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond = ~(gaussian_filter_state_stall_1);
end
assign gaussian_filter_entry_bit_concat43_bit_select_operand_0 = 31'd0;
assign gaussian_filter_entry_bit_concat42_bit_select_operand_0 = 31'd0;
assign gaussian_filter_entry_bit_concat41_bit_select_operand_0 = 31'd0;
always @(posedge clk) begin
	if (switch_fifo_0_consumed_taken) begin
		switch_fifo_0_consumed_valid <= 1'd0;
	end
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_0_consumed_valid <= 1'd1;
	end
	if (reset) begin
		switch_fifo_0_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_0_consumed_data <= switch_fifo;
	end
	if (reset) begin
		switch_fifo_0_consumed_data <= 1'd0;
	end
end
always @(*) begin
	switch_fifo_0_consumed_taken = 1'd0;
	if ((gaussian_filter_valid_bit_0 & gaussian_filter_entry_exitMask_T1)) begin
		switch_fifo_0_consumed_taken = ~(gaussian_filter_state_stall_0);
	end
end
assign gaussian_filter_entry_bit_concat40_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat39_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat38_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat38_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat37_bit_select_operand_0 = 22'd0;
assign gaussian_filter_entry_bit_concat37_bit_select_operand_4 = 2'd0;
assign gaussian_filter_entry_bit_concat36_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat35_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat35_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat34_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat33_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat32_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat32_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat31_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat31_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat30_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat30_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat29_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat29_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat28_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat28_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat27_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat26_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat26_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat25_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat24_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat24_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat23_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat23_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat22_bit_select_operand_0 = 22'd0;
assign gaussian_filter_entry_bit_concat22_bit_select_operand_4 = 2'd0;
assign gaussian_filter_entry_bit_concat21_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat21_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat20_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat20_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat19_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat19_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat18_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat17_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat16_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat16_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat15_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat15_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat14_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat14_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat13_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat13_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat12_bit_select_operand_0 = 21'd0;
assign gaussian_filter_entry_bit_concat12_bit_select_operand_4 = 3'd0;
assign gaussian_filter_entry_bit_concat11_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat10_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat10_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat9_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat8_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat7_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat7_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat6_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat5_bit_select_operand_2 = 2'd0;
assign gaussian_filter_entry_bit_concat3_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat2_bit_select_operand_0 = 23'd0;
assign gaussian_filter_entry_bit_concat2_bit_select_operand_4 = 1'd0;
assign gaussian_filter_entry_bit_concat1_bit_select_operand_0 = 24'd0;
assign gaussian_filter_entry_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = ~(gaussian_filter_state_stall_0);
end
always @(posedge clk) begin
	finish <= gaussian_filter_state_enable_5;
end
always @(*) begin
	input_fifo_ready = (~(input_fifo_consumed_valid) | input_fifo_consumed_taken);
	if (reset) begin
		input_fifo_ready = 1'd0;
	end
end
always @(*) begin
	switch_fifo_ready = (~(switch_fifo_0_consumed_valid) | switch_fifo_0_consumed_taken);
	if (reset) begin
		switch_fifo_ready = 1'd0;
	end
end
always @(*) begin
	if ((gaussian_filter_valid_bit_4 & gaussian_filter_entry_exitMask_F9_reg_stage4)) begin
		output_fifo = gaussian_filter_entry_14_reg_stage4;
	end
	else if ((gaussian_filter_valid_bit_4 & gaussian_filter_entry_exitMask_F14_reg_stage4)) begin
		output_fifo = gaussian_filter_entry_14_reg_stage4;
	end
	else /* if ((gaussian_filter_valid_bit_4 & gaussian_filter_entry_exitMask_T12_reg_stage4)) */ begin
		output_fifo = gaussian_filter_entry_bit_select;
	end
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((gaussian_filter_state_enable_4 & gaussian_filter_entry_exitMask_F9_reg_stage4)) begin
		output_fifo_valid = 1'd1;
	end
	if ((gaussian_filter_state_enable_4 & gaussian_filter_entry_exitMask_F14_reg_stage4)) begin
		output_fifo_valid = 1'd1;
	end
	if ((gaussian_filter_state_enable_4 & gaussian_filter_entry_exitMask_T12_reg_stage4)) begin
		output_fifo_valid = 1'd1;
	end
end

endmodule
`timescale 1 ns / 1 ns
module hysteresis_filter
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	switch_fifo,
	switch_fifo_ready,
	switch_fifo_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
input  switch_fifo;
output reg  switch_fifo_ready;
input  switch_fifo_valid;
output reg [7:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg [7:0] hysteresis_filter_entry_1;
reg [7:0] hysteresis_filter_entry_3;
reg [7:0] hysteresis_filter_entry_4;
reg [7:0] hysteresis_filter_entry_6;
reg [6:0] hysteresis_filter_entry_bit_select;
reg [7:0] hysteresis_filter_entry_7;
reg [7:0] hysteresis_filter_entry_9;
reg [31:0] hysteresis_filter_entry_10;
reg [31:0] hysteresis_filter_entry_11;
reg [31:0] hysteresis_filter_entry_12;
reg [31:0] hysteresis_filter_entry_13;
wire  hysteresis_filter_entry_14;
reg  hysteresis_filter_entry_NotCondition;
reg [7:0] hysteresis_filter_entry_15;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] hysteresis_filter_entry_16;
reg [7:0] hysteresis_filter_entry_17;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] hysteresis_filter_entry_18;
reg [7:0] hysteresis_filter_entry_19;
reg  hysteresis_filter_entry_cmp46_i;
reg [31:0] hysteresis_filter_entry_add50_i;
reg [31:0] hysteresis_filter_entry_add50_i_var0;
reg  hysteresis_filter_entry_cmp_i;
reg  hysteresis_filter_entry_exitMask_T1;
reg  hysteresis_filter_entry_NotCondition2;
reg  hysteresis_filter_entry_exitMask_F3;
reg [31:0] hysteresis_filter_entry_20;
reg  hysteresis_filter_entry_21;
reg [31:0] hysteresis_filter_entry_bit_concat5;
reg  hysteresis_filter_entry_cmp4_i;
reg [31:0] hysteresis_filter_entry_bit_concat4;
reg [31:0] hysteresis_filter_entry_or6_i;
reg  hysteresis_filter_entry_cmp9_i;
reg [31:0] hysteresis_filter_entry_bit_concat3;
reg [31:0] hysteresis_filter_entry_or11_i;
reg  hysteresis_filter_entry_tobool_i;
reg  hysteresis_filter_entry_cmp_i1;
reg  hysteresis_filter_entry_exitMask_T4;
reg [31:0] hysteresis_filter_entry_inc_i;
reg  hysteresis_filter_entry_cmp1_i;
reg  hysteresis_filter_entry_cmp2_i;
reg  hysteresis_filter_entry_or_cond_i;
reg [31:0] hysteresis_filter_entry_inc5_i;
reg [31:0] hysteresis_filter_entry_inc5_i_var1;
reg [31:0] hysteresis_filter_entry_select11;
reg [31:0] hysteresis_filter_entry_select;
reg  hysteresis_filter_entry_22;
reg  hysteresis_filter_entry_exitMask_T7;
reg  hysteresis_filter_entry_NotCondition8;
reg  hysteresis_filter_entry_exitMask_F9;
reg  hysteresis_filter_entry_exitMask_T12;
reg  hysteresis_filter_entry_NotCondition13;
reg  hysteresis_filter_entry_exitMask_F14;
reg [31:0] hysteresis_filter_entry_bit_concat2;
reg  hysteresis_filter_entry_cmp33;
reg [7:0] hysteresis_filter_entry_23;
reg [7:0] hysteresis_filter_entry_newEarly_25;
reg [7:0] hysteresis_filter_entry_newEarly_newEarly_28;
reg [7:0] hysteresis_filter_entry_newEarly_newEarly_29;
reg [7:0] hysteresis_filter_entry_newCurOp_newEarly_29;
reg [7:0] hysteresis_filter_entry_newEarly_newEarly_30;
reg [7:0] hysteresis_filter_entry_newCurOp_newEarly_30;
reg [7:0] hysteresis_filter_entry_newCurOp_30;
reg  hysteresis_filter_entry_24;
reg [7:0] hysteresis_filter_entry_bit_concat1;
reg [7:0] hysteresis_filter_entry_25;
reg [7:0] hysteresis_filter_entry_conv44;
reg  hysteresis_filter_entry_ORexitM121;
reg [7:0] hysteresis_filter_entry_select112;
reg [7:0] hysteresis_filter_entry_select116;
reg [7:0] hysteresis_filter_entry_select118;
reg [7:0] hysteresis_filter_entry_select96;
reg [7:0] hysteresis_filter_entry_select100;
reg [7:0] hysteresis_filter_entry_select102;
reg [7:0] hysteresis_filter_entry_select88;
reg [7:0] hysteresis_filter_entry_select92;
reg [7:0] hysteresis_filter_entry_select94;
reg [7:0] hysteresis_filter_entry_select72;
reg [7:0] hysteresis_filter_entry_select76;
reg [7:0] hysteresis_filter_entry_select78;
reg [7:0] hysteresis_filter_entry_select64;
reg [7:0] hysteresis_filter_entry_select68;
reg [7:0] hysteresis_filter_entry_select70;
reg [7:0] hysteresis_filter_entry_select48;
reg [7:0] hysteresis_filter_entry_select52;
reg [7:0] hysteresis_filter_entry_select54;
reg [31:0] hysteresis_filter_entry_select40;
reg [31:0] hysteresis_filter_entry_select44;
reg [31:0] hysteresis_filter_entry_select46;
reg [31:0] hysteresis_filter_entry_bit_concat;
reg [31:0] hysteresis_filter_entry_select36;
reg [31:0] hysteresis_filter_entry_select38;
reg [31:0] hysteresis_filter_entry_select24;
reg [31:0] hysteresis_filter_entry_select28;
reg [31:0] hysteresis_filter_entry_select30;
reg [31:0] hysteresis_filter_entry_select16;
reg [31:0] hysteresis_filter_entry_select20;
reg [31:0] hysteresis_filter_entry_select22;
reg [7:0] hysteresis_filter_line_buffer_window_a0_a1_inferred_reg;
reg [7:0] hysteresis_filter_line_buffer_window_a0_a2_inferred_reg;
reg [7:0] hysteresis_filter_line_buffer_window_a1_a1_inferred_reg;
reg [7:0] hysteresis_filter_line_buffer_window_a1_a2_inferred_reg;
reg [7:0] hysteresis_filter_line_buffer_window_a2_a1_inferred_reg;
reg [7:0] hysteresis_filter_line_buffer_window_a2_a2_inferred_reg;
reg [31:0] hysteresis_filter_line_buffer_prev_row_index_inferred_reg;
reg  hysteresis_filter_line_buffer_prev_row_a0_a0_clken;
reg [10:0] hysteresis_filter_line_buffer_prev_row_a0_a0_address_a;
wire  hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_a;
wire [7:0] hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_a;
wire [7:0] hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_a;
reg  hysteresis_filter_line_buffer_prev_row_a0_a0_read_en_a;
reg [10:0] hysteresis_filter_line_buffer_prev_row_a0_a0_address_b;
reg  hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_b;
reg [7:0] hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_b;
wire [7:0] hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_b;
wire  hysteresis_filter_line_buffer_prev_row_a0_a0_read_en_b;
reg  hysteresis_filter_line_buffer_prev_row_a1_a0_clken;
reg [10:0] hysteresis_filter_line_buffer_prev_row_a1_a0_address_a;
wire  hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_a;
wire [7:0] hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_a;
wire [7:0] hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_a;
reg  hysteresis_filter_line_buffer_prev_row_a1_a0_read_en_a;
reg [10:0] hysteresis_filter_line_buffer_prev_row_a1_a0_address_b;
reg  hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_b;
reg [7:0] hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_b;
wire [7:0] hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_b;
wire  hysteresis_filter_line_buffer_prev_row_a1_a0_read_en_b;
reg [31:0] hysteresis_filter_count_inferred_reg;
reg [31:0] hysteresis_filter_i_inferred_reg;
reg [31:0] hysteresis_filter_j_inferred_reg;
reg  hysteresis_filter_valid_bit_0;
reg  hysteresis_filter_state_stall_0;
reg  hysteresis_filter_state_enable_0;
reg  hysteresis_filter_valid_bit_1;
reg  hysteresis_filter_state_stall_1;
reg  hysteresis_filter_state_enable_1;
reg  hysteresis_filter_valid_bit_2;
reg  hysteresis_filter_state_stall_2;
reg  hysteresis_filter_state_enable_2;
reg  hysteresis_filter_valid_bit_3;
wire  hysteresis_filter_state_stall_3;
reg  hysteresis_filter_state_enable_3;
reg  hysteresis_filter_II_counter;
reg [7:0] hysteresis_filter_entry_4_reg_stage2;
reg [7:0] hysteresis_filter_entry_6_reg_stage2;
reg [7:0] hysteresis_filter_entry_7_reg_stage1;
reg [7:0] hysteresis_filter_entry_9_reg_stage1;
reg  hysteresis_filter_entry_14_reg_stage1;
reg  hysteresis_filter_entry_14_reg_stage2;
reg  hysteresis_filter_entry_NotCondition_reg_stage1;
reg [7:0] hysteresis_filter_entry_15_reg_stage1;
reg [7:0] hysteresis_filter_entry_15_reg_stage2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] hysteresis_filter_entry_16_reg_stage1;
reg  hysteresis_filter_entry_exitMask_F3_reg_stage1;
reg  hysteresis_filter_entry_exitMask_F3_reg_stage2;
reg  hysteresis_filter_entry_exitMask_F9_reg_stage1;
reg  hysteresis_filter_entry_exitMask_F9_reg_stage2;
reg  hysteresis_filter_entry_exitMask_T12_reg_stage1;
reg  hysteresis_filter_entry_exitMask_T12_reg_stage2;
reg  hysteresis_filter_entry_exitMask_F14_reg_stage1;
reg  hysteresis_filter_entry_exitMask_F14_reg_stage2;
reg [7:0] hysteresis_filter_entry_newEarly_newEarly_28_reg_stage2;
reg [7:0] hysteresis_filter_entry_newEarly_newEarly_29_reg_stage2;
reg [7:0] hysteresis_filter_entry_25_reg_stage2;
reg  hysteresis_filter_entry_ORexitM121_reg_stage1;
reg  hysteresis_filter_entry_ORexitM121_reg_stage2;
reg  canny_entry_output_fifo_nm_consumed_valid;
reg [7:0] canny_entry_output_fifo_nm_consumed_data;
reg  canny_entry_output_fifo_nm_consumed_taken;
reg [7:0] hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_wire_a;
reg  hysteresis_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
reg [7:0] hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_wire_a;
reg  hysteresis_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
wire [30:0] hysteresis_filter_entry_bit_concat5_bit_select_operand_0;
wire [30:0] hysteresis_filter_entry_bit_concat4_bit_select_operand_0;
wire [30:0] hysteresis_filter_entry_bit_concat3_bit_select_operand_0;
reg  switch_fifo_3_consumed_valid;
reg  switch_fifo_3_consumed_data;
reg  switch_fifo_3_consumed_taken;
reg  output_fifo_hysteresis_filter_state_2_not_accessed_due_to_stall_a;
reg  output_fifo_hysteresis_filter_state_2_stalln_reg;
reg  output_fifo_hysteresis_filter_state_2_enable_cond_a;
wire [22:0] hysteresis_filter_entry_bit_concat2_bit_select_operand_0;
wire  hysteresis_filter_entry_bit_concat2_bit_select_operand_4;
wire  hysteresis_filter_entry_bit_concat1_bit_select_operand_2;
wire [30:0] hysteresis_filter_entry_bit_concat_bit_select_operand_0;



// @_ZZ17hysteresis_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEES6_E11line_buffer.prev_row.a1.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port hysteresis_filter_line_buffer_prev_row_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( hysteresis_filter_line_buffer_prev_row_a1_a0_clken ),
	.address_a( hysteresis_filter_line_buffer_prev_row_a1_a0_address_a ),
	.write_en_a( hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_a ),
	.write_data_a( hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_a ),
	.address_b( hysteresis_filter_line_buffer_prev_row_a1_a0_address_b ),
	.write_en_b( hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_b ),
	.write_data_b( hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_b )
);
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.width_a = 8;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.widthad_a = 11;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.width_be_a = 1;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.numwords_a = 1920;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.width_b = 8;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.widthad_b = 11;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.width_be_b = 1;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.numwords_b = 1920;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.latency = 1;
defparam hysteresis_filter_line_buffer_prev_row_a1_a0.init_file = {`MEM_INIT_DIR, "hysteresis_filter_line_buffer_prev_row_a1_a0.mem"};



// @_ZZ17hysteresis_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEES6_E11line_buffer.prev_row.a0.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port hysteresis_filter_line_buffer_prev_row_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( hysteresis_filter_line_buffer_prev_row_a0_a0_clken ),
	.address_a( hysteresis_filter_line_buffer_prev_row_a0_a0_address_a ),
	.write_en_a( hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_a ),
	.write_data_a( hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_a ),
	.address_b( hysteresis_filter_line_buffer_prev_row_a0_a0_address_b ),
	.write_en_b( hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_b ),
	.write_data_b( hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_b )
);
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.width_a = 8;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.widthad_a = 11;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.width_be_a = 1;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.numwords_a = 1920;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.width_b = 8;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.widthad_b = 11;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.width_be_b = 1;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.numwords_b = 1920;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.latency = 1;
defparam hysteresis_filter_line_buffer_prev_row_a0_a0.init_file = {`MEM_INIT_DIR, "hysteresis_filter_line_buffer_prev_row_a0_a0.mem"};


always @(*) begin
		hysteresis_filter_entry_1 = hysteresis_filter_line_buffer_window_a0_a1_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_3 = hysteresis_filter_line_buffer_window_a0_a2_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_4 = hysteresis_filter_line_buffer_window_a1_a1_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_6 = hysteresis_filter_line_buffer_window_a1_a2_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_bit_select = hysteresis_filter_entry_6[6:0];
end
always @(*) begin
		hysteresis_filter_entry_7 = hysteresis_filter_line_buffer_window_a2_a1_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_9 = hysteresis_filter_line_buffer_window_a2_a2_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_10 = hysteresis_filter_line_buffer_prev_row_index_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_11 = hysteresis_filter_count_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_12 = hysteresis_filter_i_inferred_reg;
end
always @(*) begin
		hysteresis_filter_entry_13 = hysteresis_filter_j_inferred_reg;
end
assign hysteresis_filter_entry_14 = ~(canny_entry_output_fifo_nm_consumed_valid);
always @(*) begin
		hysteresis_filter_entry_NotCondition = (hysteresis_filter_entry_14 ^ 1'd1);
end
always @(*) begin
	hysteresis_filter_entry_15 = canny_entry_output_fifo_nm_consumed_data;
end
always @(*) begin
		hysteresis_filter_entry_16 = (1'd0 + (1 * hysteresis_filter_entry_10));
end
always @(*) begin
		hysteresis_filter_entry_17 = hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_wire_a;
end
always @(*) begin
		hysteresis_filter_entry_18 = (1'd0 + (1 * hysteresis_filter_entry_10));
end
always @(*) begin
		hysteresis_filter_entry_19 = hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_wire_a;
end
always @(*) begin
		hysteresis_filter_entry_cmp46_i = (hysteresis_filter_entry_10 == 32'd1919);
end
always @(*) begin
		hysteresis_filter_entry_add50_i = (hysteresis_filter_entry_10 + 32'd1);
end
always @(*) begin
		hysteresis_filter_entry_add50_i_var0 = (hysteresis_filter_entry_cmp46_i ? 32'd0 : hysteresis_filter_entry_add50_i);
end
always @(*) begin
		hysteresis_filter_entry_cmp_i = (hysteresis_filter_entry_11 > 32'd1920);
end
always @(*) begin
		hysteresis_filter_entry_exitMask_T1 = (hysteresis_filter_entry_cmp_i & hysteresis_filter_entry_NotCondition);
end
always @(*) begin
		hysteresis_filter_entry_NotCondition2 = (hysteresis_filter_entry_cmp_i ^ 1'd1);
end
always @(*) begin
		hysteresis_filter_entry_exitMask_F3 = (hysteresis_filter_entry_NotCondition & hysteresis_filter_entry_NotCondition2);
end
always @(*) begin
		hysteresis_filter_entry_20 = (hysteresis_filter_entry_12 + $signed(-32'd1));
end
always @(*) begin
		hysteresis_filter_entry_21 = (hysteresis_filter_entry_20 > 32'd1077);
end
always @(*) begin
		hysteresis_filter_entry_bit_concat5 = {hysteresis_filter_entry_bit_concat5_bit_select_operand_0[30:0], hysteresis_filter_entry_21};
end
always @(*) begin
		hysteresis_filter_entry_cmp4_i = (hysteresis_filter_entry_13 == 32'd0);
end
always @(*) begin
		hysteresis_filter_entry_bit_concat4 = {hysteresis_filter_entry_bit_concat4_bit_select_operand_0[30:0], hysteresis_filter_entry_cmp4_i};
end
always @(*) begin
		hysteresis_filter_entry_or6_i = (hysteresis_filter_entry_bit_concat5 | hysteresis_filter_entry_bit_concat4);
end
always @(*) begin
		hysteresis_filter_entry_cmp9_i = (hysteresis_filter_entry_13 > 32'd1918);
end
always @(*) begin
		hysteresis_filter_entry_bit_concat3 = {hysteresis_filter_entry_bit_concat3_bit_select_operand_0[30:0], hysteresis_filter_entry_cmp9_i};
end
always @(*) begin
		hysteresis_filter_entry_or11_i = (hysteresis_filter_entry_or6_i | hysteresis_filter_entry_bit_concat3);
end
always @(*) begin
		hysteresis_filter_entry_tobool_i = (hysteresis_filter_entry_or11_i == 32'd0);
end
always @(*) begin
		hysteresis_filter_entry_cmp_i1 = (hysteresis_filter_entry_13 < 32'd1919);
end
always @(*) begin
		hysteresis_filter_entry_exitMask_T4 = (hysteresis_filter_entry_exitMask_T1 & hysteresis_filter_entry_cmp_i1);
end
always @(*) begin
		hysteresis_filter_entry_inc_i = (hysteresis_filter_entry_13 + 32'd1);
end
always @(*) begin
		hysteresis_filter_entry_cmp1_i = (hysteresis_filter_entry_12 == 32'd1079);
end
always @(*) begin
		hysteresis_filter_entry_cmp2_i = (hysteresis_filter_entry_13 == 32'd1919);
end
always @(*) begin
		hysteresis_filter_entry_or_cond_i = (hysteresis_filter_entry_cmp1_i & hysteresis_filter_entry_cmp2_i);
end
always @(*) begin
		hysteresis_filter_entry_inc5_i = (hysteresis_filter_entry_12 + 32'd1);
end
always @(*) begin
		hysteresis_filter_entry_inc5_i_var1 = (hysteresis_filter_entry_or_cond_i ? 32'd0 : hysteresis_filter_entry_inc5_i);
end
always @(*) begin
		hysteresis_filter_entry_select11 = (hysteresis_filter_entry_exitMask_T4 ? hysteresis_filter_entry_12 : hysteresis_filter_entry_inc5_i_var1);
end
always @(*) begin
		hysteresis_filter_entry_select = (hysteresis_filter_entry_exitMask_T4 ? hysteresis_filter_entry_inc_i : 32'd0);
end
always @(*) begin
	hysteresis_filter_entry_22 = switch_fifo_3_consumed_data;
end
always @(*) begin
		hysteresis_filter_entry_exitMask_T7 = (hysteresis_filter_entry_exitMask_T1 & hysteresis_filter_entry_22);
end
always @(*) begin
		hysteresis_filter_entry_NotCondition8 = (hysteresis_filter_entry_22 ^ 1'd1);
end
always @(*) begin
		hysteresis_filter_entry_exitMask_F9 = (hysteresis_filter_entry_exitMask_T1 & hysteresis_filter_entry_NotCondition8);
end
always @(*) begin
		hysteresis_filter_entry_exitMask_T12 = (hysteresis_filter_entry_exitMask_T7 & hysteresis_filter_entry_tobool_i);
end
always @(*) begin
		hysteresis_filter_entry_NotCondition13 = (hysteresis_filter_entry_tobool_i ^ 1'd1);
end
always @(*) begin
		hysteresis_filter_entry_exitMask_F14 = (hysteresis_filter_entry_exitMask_T7 & hysteresis_filter_entry_NotCondition13);
end
always @(*) begin
		hysteresis_filter_entry_bit_concat2 = {{hysteresis_filter_entry_bit_concat2_bit_select_operand_0[22:0], hysteresis_filter_entry_6[7:0]}, hysteresis_filter_entry_bit_concat2_bit_select_operand_4};
end
always @(*) begin
		hysteresis_filter_entry_cmp33 = (hysteresis_filter_entry_bit_concat2 > 32'd255);
end
always @(*) begin
		hysteresis_filter_entry_23 = (hysteresis_filter_entry_3 | hysteresis_filter_entry_1);
end
always @(*) begin
		hysteresis_filter_entry_newEarly_25 = (hysteresis_filter_entry_17 | hysteresis_filter_entry_4_reg_stage2);
end
always @(*) begin
		hysteresis_filter_entry_newEarly_newEarly_28 = (hysteresis_filter_entry_6 | hysteresis_filter_entry_7_reg_stage1);
end
always @(*) begin
		hysteresis_filter_entry_newEarly_newEarly_29 = (hysteresis_filter_entry_19 | hysteresis_filter_entry_9_reg_stage1);
end
always @(*) begin
		hysteresis_filter_entry_newCurOp_newEarly_29 = (hysteresis_filter_entry_newEarly_25 | hysteresis_filter_entry_newEarly_newEarly_29_reg_stage2);
end
always @(*) begin
		hysteresis_filter_entry_newEarly_newEarly_30 = (hysteresis_filter_entry_23 | hysteresis_filter_entry_15_reg_stage2);
end
always @(*) begin
		hysteresis_filter_entry_newCurOp_newEarly_30 = (hysteresis_filter_entry_newEarly_newEarly_30 | hysteresis_filter_entry_newEarly_newEarly_28_reg_stage2);
end
always @(*) begin
		hysteresis_filter_entry_newCurOp_30 = (hysteresis_filter_entry_newCurOp_newEarly_30 | hysteresis_filter_entry_newCurOp_newEarly_29);
end
always @(*) begin
		hysteresis_filter_entry_24 = (hysteresis_filter_entry_newCurOp_30 > 8'd63);
end
always @(*) begin
		hysteresis_filter_entry_bit_concat1 = {hysteresis_filter_entry_bit_select[6:0], hysteresis_filter_entry_bit_concat1_bit_select_operand_2};
end
always @(*) begin
		hysteresis_filter_entry_25 = (hysteresis_filter_entry_cmp33 ? -8'd1 : hysteresis_filter_entry_bit_concat1);
end
always @(*) begin
		hysteresis_filter_entry_conv44 = (hysteresis_filter_entry_24 ? hysteresis_filter_entry_25_reg_stage2 : 8'd0);
end
always @(*) begin
		hysteresis_filter_entry_ORexitM121 = (hysteresis_filter_entry_exitMask_F14 | hysteresis_filter_entry_exitMask_F9);
end
always @(*) begin
		hysteresis_filter_entry_select112 = (hysteresis_filter_entry_14_reg_stage2 ? hysteresis_filter_entry_1 : hysteresis_filter_entry_3);
end
always @(*) begin
		hysteresis_filter_entry_select116 = (hysteresis_filter_entry_exitMask_F3_reg_stage2 ? hysteresis_filter_entry_3 : hysteresis_filter_entry_select112);
end
always @(*) begin
		hysteresis_filter_entry_select118 = (hysteresis_filter_entry_ORexitM121_reg_stage2 ? hysteresis_filter_entry_3 : hysteresis_filter_entry_select116);
end
always @(*) begin
		hysteresis_filter_entry_select96 = (hysteresis_filter_entry_14_reg_stage2 ? hysteresis_filter_entry_3 : hysteresis_filter_entry_17);
end
always @(*) begin
		hysteresis_filter_entry_select100 = (hysteresis_filter_entry_exitMask_F3_reg_stage2 ? hysteresis_filter_entry_17 : hysteresis_filter_entry_select96);
end
always @(*) begin
		hysteresis_filter_entry_select102 = (hysteresis_filter_entry_ORexitM121_reg_stage2 ? hysteresis_filter_entry_17 : hysteresis_filter_entry_select100);
end
always @(*) begin
		hysteresis_filter_entry_select88 = (hysteresis_filter_entry_14_reg_stage1 ? hysteresis_filter_entry_4 : hysteresis_filter_entry_6);
end
always @(*) begin
		hysteresis_filter_entry_select92 = (hysteresis_filter_entry_exitMask_F3_reg_stage1 ? hysteresis_filter_entry_6 : hysteresis_filter_entry_select88);
end
always @(*) begin
		hysteresis_filter_entry_select94 = (hysteresis_filter_entry_ORexitM121_reg_stage1 ? hysteresis_filter_entry_6 : hysteresis_filter_entry_select92);
end
always @(*) begin
		hysteresis_filter_entry_select72 = (hysteresis_filter_entry_14_reg_stage1 ? hysteresis_filter_entry_6 : hysteresis_filter_entry_19);
end
always @(*) begin
		hysteresis_filter_entry_select76 = (hysteresis_filter_entry_exitMask_F3_reg_stage1 ? hysteresis_filter_entry_19 : hysteresis_filter_entry_select72);
end
always @(*) begin
		hysteresis_filter_entry_select78 = (hysteresis_filter_entry_ORexitM121_reg_stage1 ? hysteresis_filter_entry_19 : hysteresis_filter_entry_select76);
end
always @(*) begin
		hysteresis_filter_entry_select64 = (hysteresis_filter_entry_14 ? hysteresis_filter_entry_7 : hysteresis_filter_entry_9);
end
always @(*) begin
		hysteresis_filter_entry_select68 = (hysteresis_filter_entry_exitMask_F3 ? hysteresis_filter_entry_9 : hysteresis_filter_entry_select64);
end
always @(*) begin
		hysteresis_filter_entry_select70 = (hysteresis_filter_entry_ORexitM121 ? hysteresis_filter_entry_9 : hysteresis_filter_entry_select68);
end
always @(*) begin
		hysteresis_filter_entry_select48 = (hysteresis_filter_entry_14 ? hysteresis_filter_entry_9 : hysteresis_filter_entry_15);
end
always @(*) begin
		hysteresis_filter_entry_select52 = (hysteresis_filter_entry_exitMask_F3 ? hysteresis_filter_entry_15 : hysteresis_filter_entry_select48);
end
always @(*) begin
		hysteresis_filter_entry_select54 = (hysteresis_filter_entry_ORexitM121 ? hysteresis_filter_entry_15 : hysteresis_filter_entry_select52);
end
always @(*) begin
		hysteresis_filter_entry_select40 = (hysteresis_filter_entry_14 ? hysteresis_filter_entry_10 : hysteresis_filter_entry_add50_i_var0);
end
always @(*) begin
		hysteresis_filter_entry_select44 = (hysteresis_filter_entry_exitMask_F3 ? hysteresis_filter_entry_add50_i_var0 : hysteresis_filter_entry_select40);
end
always @(*) begin
		hysteresis_filter_entry_select46 = (hysteresis_filter_entry_ORexitM121 ? hysteresis_filter_entry_add50_i_var0 : hysteresis_filter_entry_select44);
end
always @(*) begin
		hysteresis_filter_entry_bit_concat = {hysteresis_filter_entry_bit_concat_bit_select_operand_0[30:0], hysteresis_filter_entry_exitMask_F3};
end
always @(*) begin
		hysteresis_filter_entry_select36 = (hysteresis_filter_entry_ORexitM121 ? 32'd0 : hysteresis_filter_entry_bit_concat);
end
always @(*) begin
		hysteresis_filter_entry_select38 = (hysteresis_filter_entry_11 + hysteresis_filter_entry_select36);
end
always @(*) begin
		hysteresis_filter_entry_select24 = (hysteresis_filter_entry_14 ? hysteresis_filter_entry_12 : hysteresis_filter_entry_select11);
end
always @(*) begin
		hysteresis_filter_entry_select28 = (hysteresis_filter_entry_exitMask_F3 ? hysteresis_filter_entry_12 : hysteresis_filter_entry_select24);
end
always @(*) begin
		hysteresis_filter_entry_select30 = (hysteresis_filter_entry_ORexitM121 ? hysteresis_filter_entry_select11 : hysteresis_filter_entry_select28);
end
always @(*) begin
		hysteresis_filter_entry_select16 = (hysteresis_filter_entry_14 ? hysteresis_filter_entry_13 : hysteresis_filter_entry_select);
end
always @(*) begin
		hysteresis_filter_entry_select20 = (hysteresis_filter_entry_exitMask_F3 ? hysteresis_filter_entry_13 : hysteresis_filter_entry_select16);
end
always @(*) begin
		hysteresis_filter_entry_select22 = (hysteresis_filter_entry_ORexitM121 ? hysteresis_filter_entry_select : hysteresis_filter_entry_select20);
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_window_a0_a1_inferred_reg <= 8'd0;
	end
	if ((hysteresis_filter_state_enable_2 & 1'd1)) begin
		hysteresis_filter_line_buffer_window_a0_a1_inferred_reg <= hysteresis_filter_entry_select118;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_window_a0_a2_inferred_reg <= 8'd0;
	end
	if ((hysteresis_filter_state_enable_2 & 1'd1)) begin
		hysteresis_filter_line_buffer_window_a0_a2_inferred_reg <= hysteresis_filter_entry_select102;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_window_a1_a1_inferred_reg <= 8'd0;
	end
	if ((hysteresis_filter_state_enable_1 & 1'd1)) begin
		hysteresis_filter_line_buffer_window_a1_a1_inferred_reg <= hysteresis_filter_entry_select94;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_window_a1_a2_inferred_reg <= 8'd0;
	end
	if ((hysteresis_filter_state_enable_1 & 1'd1)) begin
		hysteresis_filter_line_buffer_window_a1_a2_inferred_reg <= hysteresis_filter_entry_select78;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_window_a2_a1_inferred_reg <= 8'd0;
	end
	if ((hysteresis_filter_state_enable_0 & 1'd1)) begin
		hysteresis_filter_line_buffer_window_a2_a1_inferred_reg <= hysteresis_filter_entry_select70;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_window_a2_a2_inferred_reg <= 8'd0;
	end
	if ((hysteresis_filter_state_enable_0 & 1'd1)) begin
		hysteresis_filter_line_buffer_window_a2_a2_inferred_reg <= hysteresis_filter_entry_select54;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_line_buffer_prev_row_index_inferred_reg <= 32'd0;
	end
	if ((hysteresis_filter_state_enable_0 & 1'd1)) begin
		hysteresis_filter_line_buffer_prev_row_index_inferred_reg <= hysteresis_filter_entry_select46;
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_clken = hysteresis_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_address_a = 'dx;
	if ((hysteresis_filter_state_enable_0 & hysteresis_filter_entry_NotCondition)) begin
		hysteresis_filter_line_buffer_prev_row_a0_a0_address_a = (hysteresis_filter_entry_18 >>> 1'd0);
	end
end
assign hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_a = 'd0;
assign hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_a = 'dx;
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_read_en_a = 'd0;
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_line_buffer_prev_row_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_address_b = 'dx;
	if ((hysteresis_filter_valid_bit_0 & hysteresis_filter_entry_NotCondition)) begin
		hysteresis_filter_line_buffer_prev_row_a0_a0_address_b = (hysteresis_filter_entry_18 >>> 1'd0);
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_b = 'd0;
	if ((hysteresis_filter_state_enable_0 & hysteresis_filter_entry_NotCondition)) begin
		hysteresis_filter_line_buffer_prev_row_a0_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_b = 'dx;
	if ((hysteresis_filter_valid_bit_0 & hysteresis_filter_entry_NotCondition)) begin
		hysteresis_filter_line_buffer_prev_row_a0_a0_write_data_b = hysteresis_filter_entry_15;
	end
end
assign hysteresis_filter_line_buffer_prev_row_a0_a0_read_en_b = 'd0;
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_clken = hysteresis_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_address_a = 'dx;
	if ((hysteresis_filter_state_enable_1 & hysteresis_filter_entry_NotCondition_reg_stage1)) begin
		hysteresis_filter_line_buffer_prev_row_a1_a0_address_a = (hysteresis_filter_entry_16_reg_stage1 >>> 1'd0);
	end
end
assign hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_a = 'd0;
assign hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_a = 'dx;
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_read_en_a = 'd0;
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_line_buffer_prev_row_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_address_b = 'dx;
	if ((hysteresis_filter_valid_bit_1 & hysteresis_filter_entry_NotCondition_reg_stage1)) begin
		hysteresis_filter_line_buffer_prev_row_a1_a0_address_b = (hysteresis_filter_entry_16_reg_stage1 >>> 1'd0);
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_b = 'd0;
	if ((hysteresis_filter_state_enable_1 & hysteresis_filter_entry_NotCondition_reg_stage1)) begin
		hysteresis_filter_line_buffer_prev_row_a1_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_b = 'dx;
	if ((hysteresis_filter_valid_bit_1 & hysteresis_filter_entry_NotCondition_reg_stage1)) begin
		hysteresis_filter_line_buffer_prev_row_a1_a0_write_data_b = hysteresis_filter_entry_19;
	end
end
assign hysteresis_filter_line_buffer_prev_row_a1_a0_read_en_b = 'd0;
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_count_inferred_reg <= 32'd0;
	end
	if ((hysteresis_filter_state_enable_0 & 1'd1)) begin
		hysteresis_filter_count_inferred_reg <= hysteresis_filter_entry_select38;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_i_inferred_reg <= 32'd0;
	end
	if ((hysteresis_filter_state_enable_0 & 1'd1)) begin
		hysteresis_filter_i_inferred_reg <= hysteresis_filter_entry_select30;
	end
end
always @(posedge clk) begin
	if (reset) begin
		hysteresis_filter_j_inferred_reg <= 32'd0;
	end
	if ((hysteresis_filter_state_enable_0 & 1'd1)) begin
		hysteresis_filter_j_inferred_reg <= hysteresis_filter_entry_select22;
	end
end
always @(posedge clk) begin
	if (~(hysteresis_filter_state_stall_0)) begin
		hysteresis_filter_valid_bit_0 <= (hysteresis_filter_II_counter & start);
	end
	if (reset) begin
		hysteresis_filter_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	hysteresis_filter_state_stall_0 = 1'd0;
	if (hysteresis_filter_state_stall_1) begin
		hysteresis_filter_state_stall_0 = 1'd1;
	end
	if (((hysteresis_filter_valid_bit_0 & hysteresis_filter_entry_NotCondition) & ~(canny_entry_output_fifo_nm_consumed_valid))) begin
		hysteresis_filter_state_stall_0 = 1'd1;
	end
	if (((hysteresis_filter_valid_bit_0 & hysteresis_filter_entry_exitMask_T1) & ~(switch_fifo_3_consumed_valid))) begin
		hysteresis_filter_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_state_enable_0 = (hysteresis_filter_valid_bit_0 & ~(hysteresis_filter_state_stall_0));
end
always @(posedge clk) begin
	if (~(hysteresis_filter_state_stall_1)) begin
		hysteresis_filter_valid_bit_1 <= hysteresis_filter_state_enable_0;
	end
	if (reset) begin
		hysteresis_filter_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	hysteresis_filter_state_stall_1 = 1'd0;
	if (hysteresis_filter_state_stall_2) begin
		hysteresis_filter_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_state_enable_1 = (hysteresis_filter_valid_bit_1 & ~(hysteresis_filter_state_stall_1));
end
always @(posedge clk) begin
	if (~(hysteresis_filter_state_stall_2)) begin
		hysteresis_filter_valid_bit_2 <= hysteresis_filter_state_enable_1;
	end
	if (reset) begin
		hysteresis_filter_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	hysteresis_filter_state_stall_2 = 1'd0;
	if (hysteresis_filter_state_stall_3) begin
		hysteresis_filter_state_stall_2 = 1'd1;
	end
	if ((((hysteresis_filter_valid_bit_2 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_hysteresis_filter_state_2_not_accessed_due_to_stall_a | output_fifo_hysteresis_filter_state_2_stalln_reg))) begin
		hysteresis_filter_state_stall_2 = 1'd1;
	end
	if ((((hysteresis_filter_valid_bit_2 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_hysteresis_filter_state_2_not_accessed_due_to_stall_a | output_fifo_hysteresis_filter_state_2_stalln_reg))) begin
		hysteresis_filter_state_stall_2 = 1'd1;
	end
	if ((((hysteresis_filter_valid_bit_2 & output_fifo_valid) & ~(output_fifo_ready)) & (output_fifo_hysteresis_filter_state_2_not_accessed_due_to_stall_a | output_fifo_hysteresis_filter_state_2_stalln_reg))) begin
		hysteresis_filter_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	hysteresis_filter_state_enable_2 = (hysteresis_filter_valid_bit_2 & ~(hysteresis_filter_state_stall_2));
end
always @(posedge clk) begin
	if (~(hysteresis_filter_state_stall_3)) begin
		hysteresis_filter_valid_bit_3 <= hysteresis_filter_state_enable_2;
	end
	if (reset) begin
		hysteresis_filter_valid_bit_3 <= 1'd0;
	end
end
assign hysteresis_filter_state_stall_3 = 1'd0;
always @(*) begin
	hysteresis_filter_state_enable_3 = (hysteresis_filter_valid_bit_3 & ~(hysteresis_filter_state_stall_3));
end
always @(posedge clk) begin
	hysteresis_filter_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_4_reg_stage2 <= hysteresis_filter_entry_4;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_6_reg_stage2 <= hysteresis_filter_entry_6;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_7_reg_stage1 <= hysteresis_filter_entry_7;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_9_reg_stage1 <= hysteresis_filter_entry_9;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_14_reg_stage1 <= hysteresis_filter_entry_14;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_14_reg_stage2 <= hysteresis_filter_entry_14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_NotCondition_reg_stage1 <= hysteresis_filter_entry_NotCondition;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_15_reg_stage1 <= hysteresis_filter_entry_15;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_15_reg_stage2 <= hysteresis_filter_entry_15_reg_stage1;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_16_reg_stage1 <= hysteresis_filter_entry_16;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_exitMask_F3_reg_stage1 <= hysteresis_filter_entry_exitMask_F3;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_exitMask_F3_reg_stage2 <= hysteresis_filter_entry_exitMask_F3_reg_stage1;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_exitMask_F9_reg_stage1 <= hysteresis_filter_entry_exitMask_F9;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_exitMask_F9_reg_stage2 <= hysteresis_filter_entry_exitMask_F9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_exitMask_T12_reg_stage1 <= hysteresis_filter_entry_exitMask_T12;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_exitMask_T12_reg_stage2 <= hysteresis_filter_entry_exitMask_T12_reg_stage1;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_exitMask_F14_reg_stage1 <= hysteresis_filter_entry_exitMask_F14;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_exitMask_F14_reg_stage2 <= hysteresis_filter_entry_exitMask_F14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_newEarly_newEarly_28_reg_stage2 <= hysteresis_filter_entry_newEarly_newEarly_28;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_newEarly_newEarly_29_reg_stage2 <= hysteresis_filter_entry_newEarly_newEarly_29;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_25_reg_stage2 <= hysteresis_filter_entry_25;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_0) begin
		hysteresis_filter_entry_ORexitM121_reg_stage1 <= hysteresis_filter_entry_ORexitM121;
	end
end
always @(posedge clk) begin
	if (hysteresis_filter_state_enable_1) begin
		hysteresis_filter_entry_ORexitM121_reg_stage2 <= hysteresis_filter_entry_ORexitM121_reg_stage1;
	end
end
always @(*) begin
	canny_entry_output_fifo_nm_consumed_valid = input_fifo_valid;
end
always @(*) begin
	canny_entry_output_fifo_nm_consumed_data = input_fifo;
end
always @(*) begin
	canny_entry_output_fifo_nm_consumed_taken = 1'd0;
	if ((hysteresis_filter_valid_bit_0 & hysteresis_filter_entry_NotCondition)) begin
		canny_entry_output_fifo_nm_consumed_taken = ~(hysteresis_filter_state_stall_0);
	end
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_wire_a = hysteresis_filter_line_buffer_prev_row_a1_a0_read_data_a;
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond = ~(hysteresis_filter_state_stall_2);
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_wire_a = hysteresis_filter_line_buffer_prev_row_a0_a0_read_data_a;
end
always @(*) begin
	hysteresis_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond = ~(hysteresis_filter_state_stall_1);
end
assign hysteresis_filter_entry_bit_concat5_bit_select_operand_0 = 31'd0;
assign hysteresis_filter_entry_bit_concat4_bit_select_operand_0 = 31'd0;
assign hysteresis_filter_entry_bit_concat3_bit_select_operand_0 = 31'd0;
always @(posedge clk) begin
	if (switch_fifo_3_consumed_taken) begin
		switch_fifo_3_consumed_valid <= 1'd0;
	end
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_3_consumed_valid <= 1'd1;
	end
	if (reset) begin
		switch_fifo_3_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_3_consumed_data <= switch_fifo;
	end
	if (reset) begin
		switch_fifo_3_consumed_data <= 1'd0;
	end
end
always @(*) begin
	switch_fifo_3_consumed_taken = 1'd0;
	if ((hysteresis_filter_valid_bit_0 & hysteresis_filter_entry_exitMask_T1)) begin
		switch_fifo_3_consumed_taken = ~(hysteresis_filter_state_stall_0);
	end
end
always @(posedge clk) begin
	output_fifo_hysteresis_filter_state_2_not_accessed_due_to_stall_a <= ((hysteresis_filter_state_stall_2 & output_fifo_valid) & ~(output_fifo_ready));
end
always @(posedge clk) begin
	output_fifo_hysteresis_filter_state_2_stalln_reg <= ~(hysteresis_filter_state_stall_2);
end
always @(*) begin
	output_fifo_hysteresis_filter_state_2_enable_cond_a = (hysteresis_filter_valid_bit_2 & (output_fifo_hysteresis_filter_state_2_not_accessed_due_to_stall_a | output_fifo_hysteresis_filter_state_2_stalln_reg));
end
assign hysteresis_filter_entry_bit_concat2_bit_select_operand_0 = 23'd0;
assign hysteresis_filter_entry_bit_concat2_bit_select_operand_4 = 1'd0;
assign hysteresis_filter_entry_bit_concat1_bit_select_operand_2 = 1'd0;
assign hysteresis_filter_entry_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = ~(hysteresis_filter_state_stall_0);
end
always @(posedge clk) begin
	finish <= hysteresis_filter_state_enable_3;
end
always @(*) begin
	input_fifo_ready = canny_entry_output_fifo_nm_consumed_taken;
end
always @(*) begin
	switch_fifo_ready = (~(switch_fifo_3_consumed_valid) | switch_fifo_3_consumed_taken);
	if (reset) begin
		switch_fifo_ready = 1'd0;
	end
end
always @(*) begin
	if ((hysteresis_filter_valid_bit_2 & hysteresis_filter_entry_exitMask_F9_reg_stage2)) begin
		output_fifo = hysteresis_filter_entry_6_reg_stage2;
	end
	else if ((hysteresis_filter_valid_bit_2 & hysteresis_filter_entry_exitMask_T12_reg_stage2)) begin
		output_fifo = hysteresis_filter_entry_conv44;
	end
	else /* if ((hysteresis_filter_valid_bit_2 & hysteresis_filter_entry_exitMask_F14_reg_stage2)) */ begin
		output_fifo = 8'd0;
	end
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((output_fifo_hysteresis_filter_state_2_enable_cond_a & hysteresis_filter_entry_exitMask_F9_reg_stage2)) begin
		output_fifo_valid = 1'd1;
	end
	if ((output_fifo_hysteresis_filter_state_2_enable_cond_a & hysteresis_filter_entry_exitMask_T12_reg_stage2)) begin
		output_fifo_valid = 1'd1;
	end
	if ((output_fifo_hysteresis_filter_state_2_enable_cond_a & hysteresis_filter_entry_exitMask_F14_reg_stage2)) begin
		output_fifo_valid = 1'd1;
	end
end

endmodule
`timescale 1 ns / 1 ns
module nonmaximum_suppression
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	switch_fifo,
	switch_fifo_ready,
	switch_fifo_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [15:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
input  switch_fifo;
output reg  switch_fifo_ready;
input  switch_fifo_valid;
output reg [7:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg [9:0] nonmaximum_suppression_entry_1;
reg [7:0] nonmaximum_suppression_entry_bit_select19;
reg [9:0] nonmaximum_suppression_entry_3;
reg [7:0] nonmaximum_suppression_entry_bit_select11;
reg [9:0] nonmaximum_suppression_entry_4;
reg [7:0] nonmaximum_suppression_entry_bit_select17;
reg [9:0] nonmaximum_suppression_entry_6;
reg [7:0] nonmaximum_suppression_entry_bit_select23;
reg [1:0] nonmaximum_suppression_entry_bit_select21;
reg [9:0] nonmaximum_suppression_entry_7;
reg [7:0] nonmaximum_suppression_entry_bit_select5;
reg [9:0] nonmaximum_suppression_entry_9;
reg [7:0] nonmaximum_suppression_entry_bit_select9;
reg [31:0] nonmaximum_suppression_entry_10;
reg [31:0] nonmaximum_suppression_entry_11;
reg [31:0] nonmaximum_suppression_entry_12;
reg [31:0] nonmaximum_suppression_entry_13;
wire  nonmaximum_suppression_entry_14;
reg  nonmaximum_suppression_entry_NotCondition;
reg [15:0] nonmaximum_suppression_entry_15;
reg [9:0] nonmaximum_suppression_entry_bit_select28;
reg [7:0] nonmaximum_suppression_entry_bit_select13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] nonmaximum_suppression_entry_16;
reg [9:0] nonmaximum_suppression_entry_17;
reg [7:0] nonmaximum_suppression_entry_bit_select7;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] nonmaximum_suppression_entry_18;
reg [9:0] nonmaximum_suppression_entry_19;
reg [7:0] nonmaximum_suppression_entry_bit_select15;
reg  nonmaximum_suppression_entry_cmp48_i;
reg [31:0] nonmaximum_suppression_entry_add52_i;
reg [31:0] nonmaximum_suppression_entry_add52_i_var0;
reg  nonmaximum_suppression_entry_cmp_i;
reg  nonmaximum_suppression_entry_exitMask_T1;
reg  nonmaximum_suppression_entry_NotCondition2;
reg  nonmaximum_suppression_entry_exitMask_F3;
reg [31:0] nonmaximum_suppression_entry_20;
reg  nonmaximum_suppression_entry_21;
reg [31:0] nonmaximum_suppression_entry_bit_concat27;
reg  nonmaximum_suppression_entry_cmp4_i;
reg [31:0] nonmaximum_suppression_entry_bit_concat26;
reg [31:0] nonmaximum_suppression_entry_or6_i;
reg  nonmaximum_suppression_entry_cmp9_i;
reg [31:0] nonmaximum_suppression_entry_bit_concat25;
reg [31:0] nonmaximum_suppression_entry_or11_i;
reg  nonmaximum_suppression_entry_tobool_i;
reg  nonmaximum_suppression_entry_cmp_i3;
reg  nonmaximum_suppression_entry_exitMask_T4;
reg [31:0] nonmaximum_suppression_entry_inc_i;
reg  nonmaximum_suppression_entry_cmp1_i;
reg  nonmaximum_suppression_entry_cmp2_i4;
reg  nonmaximum_suppression_entry_or_cond_i;
reg [31:0] nonmaximum_suppression_entry_inc5_i;
reg [31:0] nonmaximum_suppression_entry_inc5_i_var1;
reg [31:0] nonmaximum_suppression_entry_select11;
reg [31:0] nonmaximum_suppression_entry_select;
reg [31:0] nonmaximum_suppression_entry_bit_concat24;
reg  nonmaximum_suppression_entry_22;
reg  nonmaximum_suppression_entry_exitMask_T7;
reg  nonmaximum_suppression_entry_NotCondition8;
reg  nonmaximum_suppression_entry_exitMask_F9;
reg  nonmaximum_suppression_entry_exitMask_T12;
reg  nonmaximum_suppression_entry_NotCondition13;
reg  nonmaximum_suppression_entry_exitMask_F14;
reg [31:0] nonmaximum_suppression_entry_bit_concat22;
reg  nonmaximum_suppression_entry_CaseCmpExitMask;
reg  nonmaximum_suppression_entry_CaseCmpExitMask15;
reg  nonmaximum_suppression_entry_CaseCmpExitMask17;
reg  nonmaximum_suppression_entry_CaseCmpExitMask_AndEn;
reg  nonmaximum_suppression_entry_CaseCmpExitMask15_And;
reg  nonmaximum_suppression_entry_CaseCmpExitMask17_And;
reg [31:0] nonmaximum_suppression_entry_bit_concat20;
reg [31:0] nonmaximum_suppression_entry_bit_concat18;
reg [31:0] nonmaximum_suppression_entry_add46;
reg [31:0] nonmaximum_suppression_entry_bit_concat16;
reg [31:0] nonmaximum_suppression_entry_bit_concat14;
reg [31:0] nonmaximum_suppression_entry_add63;
reg [31:0] nonmaximum_suppression_entry_bit_concat12;
reg [31:0] nonmaximum_suppression_entry_add84;
reg [31:0] nonmaximum_suppression_entry_bit_concat10;
reg [31:0] nonmaximum_suppression_entry_add102;
reg [31:0] nonmaximum_suppression_entry_bit_concat8;
reg [31:0] nonmaximum_suppression_entry_add123;
reg [31:0] nonmaximum_suppression_entry_bit_concat6;
reg [31:0] nonmaximum_suppression_entry_add141;
reg [31:0] nonmaximum_suppression_entry_add162;
reg [31:0] nonmaximum_suppression_entry_add180;
reg [31:0] nonmaximum_suppression_entry_select29_v;
reg  nonmaximum_suppression_entry_ORexitM30;
reg [31:0] nonmaximum_suppression_entry_select31_v;
reg [31:0] nonmaximum_suppression_entry_select35_v;
reg [30:0] nonmaximum_suppression_entry_bit_select3;
reg [31:0] nonmaximum_suppression_entry_bit_concat4;
reg [31:0] nonmaximum_suppression_entry_select21_v;
reg [31:0] nonmaximum_suppression_entry_select23_v;
reg [31:0] nonmaximum_suppression_entry_select27_v;
reg [30:0] nonmaximum_suppression_entry_bit_select1;
reg [31:0] nonmaximum_suppression_entry_bit_concat2;
reg  nonmaximum_suppression_entry_cmp184;
reg [31:0] nonmaximum_suppression_entry_cond;
reg [7:0] nonmaximum_suppression_entry_bit_select;
reg  nonmaximum_suppression_entry_cmp185;
reg [7:0] nonmaximum_suppression_entry_conv191;
reg  nonmaximum_suppression_entry_ORexitM142;
reg [9:0] nonmaximum_suppression_entry_select133;
reg [9:0] nonmaximum_suppression_entry_select137;
reg [9:0] nonmaximum_suppression_entry_select139;
reg [9:0] nonmaximum_suppression_entry_select117;
reg [9:0] nonmaximum_suppression_entry_select121;
reg [9:0] nonmaximum_suppression_entry_select123;
reg [9:0] nonmaximum_suppression_entry_select109;
reg [9:0] nonmaximum_suppression_entry_select113;
reg [9:0] nonmaximum_suppression_entry_select115;
reg [9:0] nonmaximum_suppression_entry_select93;
reg [9:0] nonmaximum_suppression_entry_select97;
reg [9:0] nonmaximum_suppression_entry_select99;
reg [9:0] nonmaximum_suppression_entry_select85;
reg [9:0] nonmaximum_suppression_entry_select89;
reg [9:0] nonmaximum_suppression_entry_select91;
reg [9:0] nonmaximum_suppression_entry_select69;
reg [9:0] nonmaximum_suppression_entry_select73;
reg [9:0] nonmaximum_suppression_entry_select75;
reg [31:0] nonmaximum_suppression_entry_select61;
reg [31:0] nonmaximum_suppression_entry_select65;
reg [31:0] nonmaximum_suppression_entry_select67;
reg [31:0] nonmaximum_suppression_entry_bit_concat;
reg [31:0] nonmaximum_suppression_entry_select57;
reg [31:0] nonmaximum_suppression_entry_select59;
reg [31:0] nonmaximum_suppression_entry_select45;
reg [31:0] nonmaximum_suppression_entry_select49;
reg [31:0] nonmaximum_suppression_entry_select51;
reg [31:0] nonmaximum_suppression_entry_select37;
reg [31:0] nonmaximum_suppression_entry_select41;
reg [31:0] nonmaximum_suppression_entry_select43;
reg [9:0] nonmaximum_suppression_line_buffer_window_a0_a1_inferred_reg;
reg [9:0] nonmaximum_suppression_line_buffer_window_a0_a2_inferred_reg;
reg [9:0] nonmaximum_suppression_line_buffer_window_a1_a1_inferred_reg;
reg [9:0] nonmaximum_suppression_line_buffer_window_a1_a2_inferred_reg;
reg [9:0] nonmaximum_suppression_line_buffer_window_a2_a1_inferred_reg;
reg [9:0] nonmaximum_suppression_line_buffer_window_a2_a2_inferred_reg;
reg [31:0] nonmaximum_suppression_line_buffer_prev_row_index_inferred_reg;
reg  nonmaximum_suppression_line_buffer_prev_row_a0_a0_clken;
reg [10:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_a;
wire  nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_a;
wire [9:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_a;
wire [9:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_a;
reg  nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_en_a;
reg [10:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_b;
reg  nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_b;
reg [9:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_b;
wire [9:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_b;
wire  nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_en_b;
reg  nonmaximum_suppression_line_buffer_prev_row_a1_a0_clken;
reg [10:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_a;
wire  nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_a;
wire [9:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_a;
wire [9:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_a;
reg  nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_en_a;
reg [10:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_b;
reg  nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_b;
reg [9:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_b;
wire [9:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_b;
wire  nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_en_b;
reg [31:0] nonmaximum_suppression_count_inferred_reg;
reg [31:0] nonmaximum_suppression_i_inferred_reg;
reg [31:0] nonmaximum_suppression_j_inferred_reg;
reg  nonmaximum_suppression_valid_bit_0;
reg  nonmaximum_suppression_state_stall_0;
reg  nonmaximum_suppression_state_enable_0;
reg  nonmaximum_suppression_valid_bit_1;
reg  nonmaximum_suppression_state_stall_1;
reg  nonmaximum_suppression_state_enable_1;
reg  nonmaximum_suppression_valid_bit_2;
reg  nonmaximum_suppression_state_stall_2;
reg  nonmaximum_suppression_state_enable_2;
reg  nonmaximum_suppression_valid_bit_3;
reg  nonmaximum_suppression_state_stall_3;
reg  nonmaximum_suppression_state_enable_3;
reg  nonmaximum_suppression_II_counter;
reg [7:0] nonmaximum_suppression_entry_bit_select23_reg_stage2;
reg [7:0] nonmaximum_suppression_entry_bit_select23_reg_stage3;
reg  nonmaximum_suppression_entry_14_reg_stage1;
reg  nonmaximum_suppression_entry_14_reg_stage2;
reg  nonmaximum_suppression_entry_NotCondition_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] nonmaximum_suppression_entry_16_reg_stage1;
reg  nonmaximum_suppression_entry_exitMask_F3_reg_stage1;
reg  nonmaximum_suppression_entry_exitMask_F3_reg_stage2;
reg [31:0] nonmaximum_suppression_entry_bit_concat24_reg_stage2;
reg  nonmaximum_suppression_entry_exitMask_F9_reg_stage1;
reg  nonmaximum_suppression_entry_exitMask_F9_reg_stage2;
reg  nonmaximum_suppression_entry_exitMask_F9_reg_stage3;
reg  nonmaximum_suppression_entry_exitMask_T12_reg_stage1;
reg  nonmaximum_suppression_entry_exitMask_T12_reg_stage2;
reg  nonmaximum_suppression_entry_exitMask_T12_reg_stage3;
reg  nonmaximum_suppression_entry_exitMask_F14_reg_stage1;
reg  nonmaximum_suppression_entry_exitMask_F14_reg_stage2;
reg  nonmaximum_suppression_entry_exitMask_F14_reg_stage3;
reg  nonmaximum_suppression_entry_CaseCmpExitMask15_And_reg_stage2;
reg  nonmaximum_suppression_entry_CaseCmpExitMask17_And_reg_stage2;
reg [31:0] nonmaximum_suppression_entry_bit_concat18_reg_stage2;
reg [31:0] nonmaximum_suppression_entry_bit_concat16_reg_stage2;
reg [31:0] nonmaximum_suppression_entry_bit_concat14_reg_stage1;
reg [31:0] nonmaximum_suppression_entry_add102_reg_stage1;
reg [31:0] nonmaximum_suppression_entry_bit_concat6_reg_stage1;
reg [31:0] nonmaximum_suppression_entry_add141_reg_stage1;
reg  nonmaximum_suppression_entry_ORexitM30_reg_stage2;
reg [31:0] nonmaximum_suppression_entry_bit_concat2_reg_stage2;
reg [7:0] nonmaximum_suppression_entry_bit_select_reg_stage3;
reg  nonmaximum_suppression_entry_cmp185_reg_stage3;
reg  nonmaximum_suppression_entry_ORexitM142_reg_stage1;
reg  nonmaximum_suppression_entry_ORexitM142_reg_stage2;
reg  canny_entry_output_fifo_sf_consumed_valid;
reg [15:0] canny_entry_output_fifo_sf_consumed_data;
reg  canny_entry_output_fifo_sf_consumed_taken;
reg [9:0] nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_wire_a;
reg  nonmaximum_suppression_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
reg [9:0] nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_wire_a;
reg  nonmaximum_suppression_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
wire [30:0] nonmaximum_suppression_entry_bit_concat27_bit_select_operand_0;
wire [30:0] nonmaximum_suppression_entry_bit_concat26_bit_select_operand_0;
wire [30:0] nonmaximum_suppression_entry_bit_concat25_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat24_bit_select_operand_0;
reg  switch_fifo_2_consumed_valid;
reg  switch_fifo_2_consumed_data;
reg  switch_fifo_2_consumed_taken;
wire [29:0] nonmaximum_suppression_entry_bit_concat22_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat20_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat18_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat16_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat14_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat12_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat10_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat8_bit_select_operand_0;
wire [23:0] nonmaximum_suppression_entry_bit_concat6_bit_select_operand_0;
wire  nonmaximum_suppression_entry_bit_concat4_bit_select_operand_0;
wire  nonmaximum_suppression_entry_bit_concat2_bit_select_operand_0;
wire [30:0] nonmaximum_suppression_entry_bit_concat_bit_select_operand_0;



// @_ZZ22nonmaximum_suppressionRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_ItLb0EEERNS0_IhLb0EEEE11line_buffer.prev_row.a1.a0 = internal unnamed_addr global [1920 x i10] zeroinitializer
ram_dual_port nonmaximum_suppression_line_buffer_prev_row_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( nonmaximum_suppression_line_buffer_prev_row_a1_a0_clken ),
	.address_a( nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_a ),
	.write_en_a( nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_a ),
	.write_data_a( nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_a ),
	.byte_en_a( {2{1'b1}} ),
	.read_data_a( nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_a ),
	.address_b( nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_b ),
	.write_en_b( nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_b ),
	.write_data_b( nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_b ),
	.byte_en_b( {2{1'b1}} ),
	.read_data_b( nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_b )
);
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.width_a = 10;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.widthad_a = 11;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.width_be_a = 2;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.numwords_a = 1920;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.width_b = 10;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.widthad_b = 11;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.width_be_b = 2;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.numwords_b = 1920;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.latency = 1;
defparam nonmaximum_suppression_line_buffer_prev_row_a1_a0.init_file = {`MEM_INIT_DIR, "nonmaximum_suppression_line_buffer_prev_row_a1_a0.mem"};



// @_ZZ22nonmaximum_suppressionRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_ItLb0EEERNS0_IhLb0EEEE11line_buffer.prev_row.a0.a0 = internal unnamed_addr global [1920 x i10] zeroinitializer
ram_dual_port nonmaximum_suppression_line_buffer_prev_row_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( nonmaximum_suppression_line_buffer_prev_row_a0_a0_clken ),
	.address_a( nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_a ),
	.write_en_a( nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_a ),
	.write_data_a( nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_a ),
	.byte_en_a( {2{1'b1}} ),
	.read_data_a( nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_a ),
	.address_b( nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_b ),
	.write_en_b( nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_b ),
	.write_data_b( nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_b ),
	.byte_en_b( {2{1'b1}} ),
	.read_data_b( nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_b )
);
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.width_a = 10;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.widthad_a = 11;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.width_be_a = 2;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.numwords_a = 1920;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.width_b = 10;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.widthad_b = 11;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.width_be_b = 2;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.numwords_b = 1920;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.latency = 1;
defparam nonmaximum_suppression_line_buffer_prev_row_a0_a0.init_file = {`MEM_INIT_DIR, "nonmaximum_suppression_line_buffer_prev_row_a0_a0.mem"};


always @(*) begin
		nonmaximum_suppression_entry_1 = nonmaximum_suppression_line_buffer_window_a0_a1_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select19 = nonmaximum_suppression_entry_1[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_3 = nonmaximum_suppression_line_buffer_window_a0_a2_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select11 = nonmaximum_suppression_entry_3[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_4 = nonmaximum_suppression_line_buffer_window_a1_a1_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select17 = nonmaximum_suppression_entry_4[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_6 = nonmaximum_suppression_line_buffer_window_a1_a2_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select23 = nonmaximum_suppression_entry_6[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select21 = nonmaximum_suppression_entry_6[9:8];
end
always @(*) begin
		nonmaximum_suppression_entry_7 = nonmaximum_suppression_line_buffer_window_a2_a1_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select5 = nonmaximum_suppression_entry_7[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_9 = nonmaximum_suppression_line_buffer_window_a2_a2_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select9 = nonmaximum_suppression_entry_9[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_10 = nonmaximum_suppression_line_buffer_prev_row_index_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_11 = nonmaximum_suppression_count_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_12 = nonmaximum_suppression_i_inferred_reg;
end
always @(*) begin
		nonmaximum_suppression_entry_13 = nonmaximum_suppression_j_inferred_reg;
end
assign nonmaximum_suppression_entry_14 = ~(canny_entry_output_fifo_sf_consumed_valid);
always @(*) begin
		nonmaximum_suppression_entry_NotCondition = (nonmaximum_suppression_entry_14 ^ 1'd1);
end
always @(*) begin
	nonmaximum_suppression_entry_15 = canny_entry_output_fifo_sf_consumed_data;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select28 = nonmaximum_suppression_entry_15[9:0];
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select13 = nonmaximum_suppression_entry_15[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_16 = (1'd0 + (2 * nonmaximum_suppression_entry_10));
end
always @(*) begin
		nonmaximum_suppression_entry_17 = nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_wire_a;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select7 = nonmaximum_suppression_entry_17[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_18 = (1'd0 + (2 * nonmaximum_suppression_entry_10));
end
always @(*) begin
		nonmaximum_suppression_entry_19 = nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_wire_a;
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select15 = nonmaximum_suppression_entry_19[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_cmp48_i = (nonmaximum_suppression_entry_10 == 32'd1919);
end
always @(*) begin
		nonmaximum_suppression_entry_add52_i = (nonmaximum_suppression_entry_10 + 32'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_add52_i_var0 = (nonmaximum_suppression_entry_cmp48_i ? 32'd0 : nonmaximum_suppression_entry_add52_i);
end
always @(*) begin
		nonmaximum_suppression_entry_cmp_i = (nonmaximum_suppression_entry_11 > 32'd1920);
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_T1 = (nonmaximum_suppression_entry_cmp_i & nonmaximum_suppression_entry_NotCondition);
end
always @(*) begin
		nonmaximum_suppression_entry_NotCondition2 = (nonmaximum_suppression_entry_cmp_i ^ 1'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_F3 = (nonmaximum_suppression_entry_NotCondition & nonmaximum_suppression_entry_NotCondition2);
end
always @(*) begin
		nonmaximum_suppression_entry_20 = (nonmaximum_suppression_entry_12 + $signed(-32'd1));
end
always @(*) begin
		nonmaximum_suppression_entry_21 = (nonmaximum_suppression_entry_20 > 32'd1077);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat27 = {nonmaximum_suppression_entry_bit_concat27_bit_select_operand_0[30:0], nonmaximum_suppression_entry_21};
end
always @(*) begin
		nonmaximum_suppression_entry_cmp4_i = (nonmaximum_suppression_entry_13 == 32'd0);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat26 = {nonmaximum_suppression_entry_bit_concat26_bit_select_operand_0[30:0], nonmaximum_suppression_entry_cmp4_i};
end
always @(*) begin
		nonmaximum_suppression_entry_or6_i = (nonmaximum_suppression_entry_bit_concat27 | nonmaximum_suppression_entry_bit_concat26);
end
always @(*) begin
		nonmaximum_suppression_entry_cmp9_i = (nonmaximum_suppression_entry_13 > 32'd1918);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat25 = {nonmaximum_suppression_entry_bit_concat25_bit_select_operand_0[30:0], nonmaximum_suppression_entry_cmp9_i};
end
always @(*) begin
		nonmaximum_suppression_entry_or11_i = (nonmaximum_suppression_entry_or6_i | nonmaximum_suppression_entry_bit_concat25);
end
always @(*) begin
		nonmaximum_suppression_entry_tobool_i = (nonmaximum_suppression_entry_or11_i == 32'd0);
end
always @(*) begin
		nonmaximum_suppression_entry_cmp_i3 = (nonmaximum_suppression_entry_13 < 32'd1919);
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_T4 = (nonmaximum_suppression_entry_exitMask_T1 & nonmaximum_suppression_entry_cmp_i3);
end
always @(*) begin
		nonmaximum_suppression_entry_inc_i = (nonmaximum_suppression_entry_13 + 32'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_cmp1_i = (nonmaximum_suppression_entry_12 == 32'd1079);
end
always @(*) begin
		nonmaximum_suppression_entry_cmp2_i4 = (nonmaximum_suppression_entry_13 == 32'd1919);
end
always @(*) begin
		nonmaximum_suppression_entry_or_cond_i = (nonmaximum_suppression_entry_cmp1_i & nonmaximum_suppression_entry_cmp2_i4);
end
always @(*) begin
		nonmaximum_suppression_entry_inc5_i = (nonmaximum_suppression_entry_12 + 32'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_inc5_i_var1 = (nonmaximum_suppression_entry_or_cond_i ? 32'd0 : nonmaximum_suppression_entry_inc5_i);
end
always @(*) begin
		nonmaximum_suppression_entry_select11 = (nonmaximum_suppression_entry_exitMask_T4 ? nonmaximum_suppression_entry_12 : nonmaximum_suppression_entry_inc5_i_var1);
end
always @(*) begin
		nonmaximum_suppression_entry_select = (nonmaximum_suppression_entry_exitMask_T4 ? nonmaximum_suppression_entry_inc_i : 32'd0);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat24 = {nonmaximum_suppression_entry_bit_concat24_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select23[7:0]};
end
always @(*) begin
	nonmaximum_suppression_entry_22 = switch_fifo_2_consumed_data;
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_T7 = (nonmaximum_suppression_entry_exitMask_T1 & nonmaximum_suppression_entry_22);
end
always @(*) begin
		nonmaximum_suppression_entry_NotCondition8 = (nonmaximum_suppression_entry_22 ^ 1'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_F9 = (nonmaximum_suppression_entry_exitMask_T1 & nonmaximum_suppression_entry_NotCondition8);
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_T12 = (nonmaximum_suppression_entry_exitMask_T7 & nonmaximum_suppression_entry_tobool_i);
end
always @(*) begin
		nonmaximum_suppression_entry_NotCondition13 = (nonmaximum_suppression_entry_tobool_i ^ 1'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_exitMask_F14 = (nonmaximum_suppression_entry_exitMask_T7 & nonmaximum_suppression_entry_NotCondition13);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat22 = {nonmaximum_suppression_entry_bit_concat22_bit_select_operand_0[29:0], nonmaximum_suppression_entry_bit_select21[1:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_CaseCmpExitMask = (nonmaximum_suppression_entry_bit_concat22 == 32'd0);
end
always @(*) begin
		nonmaximum_suppression_entry_CaseCmpExitMask15 = (nonmaximum_suppression_entry_bit_concat22 == 32'd1);
end
always @(*) begin
		nonmaximum_suppression_entry_CaseCmpExitMask17 = (nonmaximum_suppression_entry_bit_concat22 == 32'd3);
end
always @(*) begin
		nonmaximum_suppression_entry_CaseCmpExitMask_AndEn = (nonmaximum_suppression_entry_exitMask_T12_reg_stage1 & nonmaximum_suppression_entry_CaseCmpExitMask);
end
always @(*) begin
		nonmaximum_suppression_entry_CaseCmpExitMask15_And = (nonmaximum_suppression_entry_exitMask_T12_reg_stage1 & nonmaximum_suppression_entry_CaseCmpExitMask15);
end
always @(*) begin
		nonmaximum_suppression_entry_CaseCmpExitMask17_And = (nonmaximum_suppression_entry_exitMask_T12_reg_stage1 & nonmaximum_suppression_entry_CaseCmpExitMask17);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat20 = {nonmaximum_suppression_entry_bit_concat20_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select19[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat18 = {nonmaximum_suppression_entry_bit_concat18_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select17[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_add46 = (nonmaximum_suppression_entry_bit_concat18_reg_stage2 + nonmaximum_suppression_entry_bit_concat20);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat16 = {nonmaximum_suppression_entry_bit_concat16_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select15[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat14 = {nonmaximum_suppression_entry_bit_concat14_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select13[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_add63 = (nonmaximum_suppression_entry_bit_concat14_reg_stage1 + nonmaximum_suppression_entry_bit_concat16);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat12 = {nonmaximum_suppression_entry_bit_concat12_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select11[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_add84 = (nonmaximum_suppression_entry_bit_concat12 + nonmaximum_suppression_entry_bit_concat20);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat10 = {nonmaximum_suppression_entry_bit_concat10_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select9[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_add102 = (nonmaximum_suppression_entry_bit_concat14 + nonmaximum_suppression_entry_bit_concat10);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat8 = {nonmaximum_suppression_entry_bit_concat8_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select7[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_add123 = (nonmaximum_suppression_entry_bit_concat8 + nonmaximum_suppression_entry_bit_concat12);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat6 = {nonmaximum_suppression_entry_bit_concat6_bit_select_operand_0[23:0], nonmaximum_suppression_entry_bit_select5[7:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_add141 = (nonmaximum_suppression_entry_bit_concat10 + nonmaximum_suppression_entry_bit_concat6);
end
always @(*) begin
		nonmaximum_suppression_entry_add162 = (nonmaximum_suppression_entry_bit_concat16_reg_stage2 + nonmaximum_suppression_entry_bit_concat8);
end
always @(*) begin
		nonmaximum_suppression_entry_add180 = (nonmaximum_suppression_entry_bit_concat6_reg_stage1 + nonmaximum_suppression_entry_bit_concat18);
end
always @(*) begin
		nonmaximum_suppression_entry_select29_v = (nonmaximum_suppression_entry_CaseCmpExitMask17_And_reg_stage2 ? nonmaximum_suppression_entry_add162 : nonmaximum_suppression_entry_add123);
end
always @(*) begin
		nonmaximum_suppression_entry_ORexitM30 = (nonmaximum_suppression_entry_CaseCmpExitMask15_And | nonmaximum_suppression_entry_CaseCmpExitMask_AndEn);
end
always @(*) begin
		nonmaximum_suppression_entry_select31_v = (nonmaximum_suppression_entry_CaseCmpExitMask15_And_reg_stage2 ? nonmaximum_suppression_entry_add84 : nonmaximum_suppression_entry_add46);
end
always @(*) begin
		nonmaximum_suppression_entry_select35_v = (nonmaximum_suppression_entry_ORexitM30_reg_stage2 ? nonmaximum_suppression_entry_select31_v : nonmaximum_suppression_entry_select29_v);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select3 = nonmaximum_suppression_entry_select35_v[31:1];
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat4 = {nonmaximum_suppression_entry_bit_concat4_bit_select_operand_0, nonmaximum_suppression_entry_bit_select3[30:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_select21_v = (nonmaximum_suppression_entry_CaseCmpExitMask17_And ? nonmaximum_suppression_entry_add180 : nonmaximum_suppression_entry_add141_reg_stage1);
end
always @(*) begin
		nonmaximum_suppression_entry_select23_v = (nonmaximum_suppression_entry_CaseCmpExitMask15_And ? nonmaximum_suppression_entry_add102_reg_stage1 : nonmaximum_suppression_entry_add63);
end
always @(*) begin
		nonmaximum_suppression_entry_select27_v = (nonmaximum_suppression_entry_ORexitM30 ? nonmaximum_suppression_entry_select23_v : nonmaximum_suppression_entry_select21_v);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select1 = nonmaximum_suppression_entry_select27_v[31:1];
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat2 = {nonmaximum_suppression_entry_bit_concat2_bit_select_operand_0, nonmaximum_suppression_entry_bit_select1[30:0]};
end
always @(*) begin
		nonmaximum_suppression_entry_cmp184 = (nonmaximum_suppression_entry_bit_concat24_reg_stage2 >= nonmaximum_suppression_entry_bit_concat4);
end
always @(*) begin
		nonmaximum_suppression_entry_cond = (nonmaximum_suppression_entry_cmp184 ? nonmaximum_suppression_entry_bit_concat24_reg_stage2 : 32'd0);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_select = nonmaximum_suppression_entry_cond[7:0];
end
always @(*) begin
		nonmaximum_suppression_entry_cmp185 = (nonmaximum_suppression_entry_cond >= nonmaximum_suppression_entry_bit_concat2_reg_stage2);
end
always @(*) begin
		nonmaximum_suppression_entry_conv191 = (nonmaximum_suppression_entry_cmp185_reg_stage3 ? nonmaximum_suppression_entry_bit_select_reg_stage3 : 8'd0);
end
always @(*) begin
		nonmaximum_suppression_entry_ORexitM142 = (nonmaximum_suppression_entry_exitMask_F14 | nonmaximum_suppression_entry_exitMask_F9);
end
always @(*) begin
		nonmaximum_suppression_entry_select133 = (nonmaximum_suppression_entry_14_reg_stage2 ? nonmaximum_suppression_entry_1 : nonmaximum_suppression_entry_3);
end
always @(*) begin
		nonmaximum_suppression_entry_select137 = (nonmaximum_suppression_entry_exitMask_F3_reg_stage2 ? nonmaximum_suppression_entry_3 : nonmaximum_suppression_entry_select133);
end
always @(*) begin
		nonmaximum_suppression_entry_select139 = (nonmaximum_suppression_entry_ORexitM142_reg_stage2 ? nonmaximum_suppression_entry_3 : nonmaximum_suppression_entry_select137);
end
always @(*) begin
		nonmaximum_suppression_entry_select117 = (nonmaximum_suppression_entry_14_reg_stage2 ? nonmaximum_suppression_entry_3 : nonmaximum_suppression_entry_17);
end
always @(*) begin
		nonmaximum_suppression_entry_select121 = (nonmaximum_suppression_entry_exitMask_F3_reg_stage2 ? nonmaximum_suppression_entry_17 : nonmaximum_suppression_entry_select117);
end
always @(*) begin
		nonmaximum_suppression_entry_select123 = (nonmaximum_suppression_entry_ORexitM142_reg_stage2 ? nonmaximum_suppression_entry_17 : nonmaximum_suppression_entry_select121);
end
always @(*) begin
		nonmaximum_suppression_entry_select109 = (nonmaximum_suppression_entry_14_reg_stage1 ? nonmaximum_suppression_entry_4 : nonmaximum_suppression_entry_6);
end
always @(*) begin
		nonmaximum_suppression_entry_select113 = (nonmaximum_suppression_entry_exitMask_F3_reg_stage1 ? nonmaximum_suppression_entry_6 : nonmaximum_suppression_entry_select109);
end
always @(*) begin
		nonmaximum_suppression_entry_select115 = (nonmaximum_suppression_entry_ORexitM142_reg_stage1 ? nonmaximum_suppression_entry_6 : nonmaximum_suppression_entry_select113);
end
always @(*) begin
		nonmaximum_suppression_entry_select93 = (nonmaximum_suppression_entry_14_reg_stage1 ? nonmaximum_suppression_entry_6 : nonmaximum_suppression_entry_19);
end
always @(*) begin
		nonmaximum_suppression_entry_select97 = (nonmaximum_suppression_entry_exitMask_F3_reg_stage1 ? nonmaximum_suppression_entry_19 : nonmaximum_suppression_entry_select93);
end
always @(*) begin
		nonmaximum_suppression_entry_select99 = (nonmaximum_suppression_entry_ORexitM142_reg_stage1 ? nonmaximum_suppression_entry_19 : nonmaximum_suppression_entry_select97);
end
always @(*) begin
		nonmaximum_suppression_entry_select85 = (nonmaximum_suppression_entry_14 ? nonmaximum_suppression_entry_7 : nonmaximum_suppression_entry_9);
end
always @(*) begin
		nonmaximum_suppression_entry_select89 = (nonmaximum_suppression_entry_exitMask_F3 ? nonmaximum_suppression_entry_9 : nonmaximum_suppression_entry_select85);
end
always @(*) begin
		nonmaximum_suppression_entry_select91 = (nonmaximum_suppression_entry_ORexitM142 ? nonmaximum_suppression_entry_9 : nonmaximum_suppression_entry_select89);
end
always @(*) begin
		nonmaximum_suppression_entry_select69 = (nonmaximum_suppression_entry_14 ? nonmaximum_suppression_entry_9 : nonmaximum_suppression_entry_bit_select28);
end
always @(*) begin
		nonmaximum_suppression_entry_select73 = (nonmaximum_suppression_entry_exitMask_F3 ? nonmaximum_suppression_entry_bit_select28 : nonmaximum_suppression_entry_select69);
end
always @(*) begin
		nonmaximum_suppression_entry_select75 = (nonmaximum_suppression_entry_ORexitM142 ? nonmaximum_suppression_entry_bit_select28 : nonmaximum_suppression_entry_select73);
end
always @(*) begin
		nonmaximum_suppression_entry_select61 = (nonmaximum_suppression_entry_14 ? nonmaximum_suppression_entry_10 : nonmaximum_suppression_entry_add52_i_var0);
end
always @(*) begin
		nonmaximum_suppression_entry_select65 = (nonmaximum_suppression_entry_exitMask_F3 ? nonmaximum_suppression_entry_add52_i_var0 : nonmaximum_suppression_entry_select61);
end
always @(*) begin
		nonmaximum_suppression_entry_select67 = (nonmaximum_suppression_entry_ORexitM142 ? nonmaximum_suppression_entry_add52_i_var0 : nonmaximum_suppression_entry_select65);
end
always @(*) begin
		nonmaximum_suppression_entry_bit_concat = {nonmaximum_suppression_entry_bit_concat_bit_select_operand_0[30:0], nonmaximum_suppression_entry_exitMask_F3};
end
always @(*) begin
		nonmaximum_suppression_entry_select57 = (nonmaximum_suppression_entry_ORexitM142 ? 32'd0 : nonmaximum_suppression_entry_bit_concat);
end
always @(*) begin
		nonmaximum_suppression_entry_select59 = (nonmaximum_suppression_entry_11 + nonmaximum_suppression_entry_select57);
end
always @(*) begin
		nonmaximum_suppression_entry_select45 = (nonmaximum_suppression_entry_14 ? nonmaximum_suppression_entry_12 : nonmaximum_suppression_entry_select11);
end
always @(*) begin
		nonmaximum_suppression_entry_select49 = (nonmaximum_suppression_entry_exitMask_F3 ? nonmaximum_suppression_entry_12 : nonmaximum_suppression_entry_select45);
end
always @(*) begin
		nonmaximum_suppression_entry_select51 = (nonmaximum_suppression_entry_ORexitM142 ? nonmaximum_suppression_entry_select11 : nonmaximum_suppression_entry_select49);
end
always @(*) begin
		nonmaximum_suppression_entry_select37 = (nonmaximum_suppression_entry_14 ? nonmaximum_suppression_entry_13 : nonmaximum_suppression_entry_select);
end
always @(*) begin
		nonmaximum_suppression_entry_select41 = (nonmaximum_suppression_entry_exitMask_F3 ? nonmaximum_suppression_entry_13 : nonmaximum_suppression_entry_select37);
end
always @(*) begin
		nonmaximum_suppression_entry_select43 = (nonmaximum_suppression_entry_ORexitM142 ? nonmaximum_suppression_entry_select : nonmaximum_suppression_entry_select41);
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_window_a0_a1_inferred_reg <= 10'd0;
	end
	if ((nonmaximum_suppression_state_enable_2 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_window_a0_a1_inferred_reg <= nonmaximum_suppression_entry_select139;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_window_a0_a2_inferred_reg <= 10'd0;
	end
	if ((nonmaximum_suppression_state_enable_2 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_window_a0_a2_inferred_reg <= nonmaximum_suppression_entry_select123;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_window_a1_a1_inferred_reg <= 10'd0;
	end
	if ((nonmaximum_suppression_state_enable_1 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_window_a1_a1_inferred_reg <= nonmaximum_suppression_entry_select115;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_window_a1_a2_inferred_reg <= 10'd0;
	end
	if ((nonmaximum_suppression_state_enable_1 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_window_a1_a2_inferred_reg <= nonmaximum_suppression_entry_select99;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_window_a2_a1_inferred_reg <= 10'd0;
	end
	if ((nonmaximum_suppression_state_enable_0 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_window_a2_a1_inferred_reg <= nonmaximum_suppression_entry_select91;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_window_a2_a2_inferred_reg <= 10'd0;
	end
	if ((nonmaximum_suppression_state_enable_0 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_window_a2_a2_inferred_reg <= nonmaximum_suppression_entry_select75;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_line_buffer_prev_row_index_inferred_reg <= 32'd0;
	end
	if ((nonmaximum_suppression_state_enable_0 & 1'd1)) begin
		nonmaximum_suppression_line_buffer_prev_row_index_inferred_reg <= nonmaximum_suppression_entry_select67;
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_clken = nonmaximum_suppression_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_a = 'dx;
	if ((nonmaximum_suppression_state_enable_0 & nonmaximum_suppression_entry_NotCondition)) begin
		nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_a = (nonmaximum_suppression_entry_18 >>> 1'd1);
	end
end
assign nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_a = 'd0;
assign nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_a = 'dx;
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_en_a = 'd0;
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_b = 'dx;
	if ((nonmaximum_suppression_valid_bit_0 & nonmaximum_suppression_entry_NotCondition)) begin
		nonmaximum_suppression_line_buffer_prev_row_a0_a0_address_b = (nonmaximum_suppression_entry_18 >>> 1'd1);
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_b = 'd0;
	if ((nonmaximum_suppression_state_enable_0 & nonmaximum_suppression_entry_NotCondition)) begin
		nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_b = 'dx;
	if ((nonmaximum_suppression_valid_bit_0 & nonmaximum_suppression_entry_NotCondition)) begin
		nonmaximum_suppression_line_buffer_prev_row_a0_a0_write_data_b = nonmaximum_suppression_entry_bit_select28;
	end
end
assign nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_en_b = 'd0;
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_clken = nonmaximum_suppression_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_a = 'dx;
	if ((nonmaximum_suppression_state_enable_1 & nonmaximum_suppression_entry_NotCondition_reg_stage1)) begin
		nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_a = (nonmaximum_suppression_entry_16_reg_stage1 >>> 1'd1);
	end
end
assign nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_a = 'd0;
assign nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_a = 'dx;
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_en_a = 'd0;
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_b = 'dx;
	if ((nonmaximum_suppression_valid_bit_1 & nonmaximum_suppression_entry_NotCondition_reg_stage1)) begin
		nonmaximum_suppression_line_buffer_prev_row_a1_a0_address_b = (nonmaximum_suppression_entry_16_reg_stage1 >>> 1'd1);
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_b = 'd0;
	if ((nonmaximum_suppression_state_enable_1 & nonmaximum_suppression_entry_NotCondition_reg_stage1)) begin
		nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_b = 'dx;
	if ((nonmaximum_suppression_valid_bit_1 & nonmaximum_suppression_entry_NotCondition_reg_stage1)) begin
		nonmaximum_suppression_line_buffer_prev_row_a1_a0_write_data_b = nonmaximum_suppression_entry_19;
	end
end
assign nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_en_b = 'd0;
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_count_inferred_reg <= 32'd0;
	end
	if ((nonmaximum_suppression_state_enable_0 & 1'd1)) begin
		nonmaximum_suppression_count_inferred_reg <= nonmaximum_suppression_entry_select59;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_i_inferred_reg <= 32'd0;
	end
	if ((nonmaximum_suppression_state_enable_0 & 1'd1)) begin
		nonmaximum_suppression_i_inferred_reg <= nonmaximum_suppression_entry_select51;
	end
end
always @(posedge clk) begin
	if (reset) begin
		nonmaximum_suppression_j_inferred_reg <= 32'd0;
	end
	if ((nonmaximum_suppression_state_enable_0 & 1'd1)) begin
		nonmaximum_suppression_j_inferred_reg <= nonmaximum_suppression_entry_select43;
	end
end
always @(posedge clk) begin
	if (~(nonmaximum_suppression_state_stall_0)) begin
		nonmaximum_suppression_valid_bit_0 <= (nonmaximum_suppression_II_counter & start);
	end
	if (reset) begin
		nonmaximum_suppression_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	nonmaximum_suppression_state_stall_0 = 1'd0;
	if (nonmaximum_suppression_state_stall_1) begin
		nonmaximum_suppression_state_stall_0 = 1'd1;
	end
	if (((nonmaximum_suppression_valid_bit_0 & nonmaximum_suppression_entry_NotCondition) & ~(canny_entry_output_fifo_sf_consumed_valid))) begin
		nonmaximum_suppression_state_stall_0 = 1'd1;
	end
	if (((nonmaximum_suppression_valid_bit_0 & nonmaximum_suppression_entry_exitMask_T1) & ~(switch_fifo_2_consumed_valid))) begin
		nonmaximum_suppression_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_state_enable_0 = (nonmaximum_suppression_valid_bit_0 & ~(nonmaximum_suppression_state_stall_0));
end
always @(posedge clk) begin
	if (~(nonmaximum_suppression_state_stall_1)) begin
		nonmaximum_suppression_valid_bit_1 <= nonmaximum_suppression_state_enable_0;
	end
	if (reset) begin
		nonmaximum_suppression_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	nonmaximum_suppression_state_stall_1 = 1'd0;
	if (nonmaximum_suppression_state_stall_2) begin
		nonmaximum_suppression_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_state_enable_1 = (nonmaximum_suppression_valid_bit_1 & ~(nonmaximum_suppression_state_stall_1));
end
always @(posedge clk) begin
	if (~(nonmaximum_suppression_state_stall_2)) begin
		nonmaximum_suppression_valid_bit_2 <= nonmaximum_suppression_state_enable_1;
	end
	if (reset) begin
		nonmaximum_suppression_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	nonmaximum_suppression_state_stall_2 = 1'd0;
	if (nonmaximum_suppression_state_stall_3) begin
		nonmaximum_suppression_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_state_enable_2 = (nonmaximum_suppression_valid_bit_2 & ~(nonmaximum_suppression_state_stall_2));
end
always @(posedge clk) begin
	if (~(nonmaximum_suppression_state_stall_3)) begin
		nonmaximum_suppression_valid_bit_3 <= nonmaximum_suppression_state_enable_2;
	end
	if (reset) begin
		nonmaximum_suppression_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	nonmaximum_suppression_state_stall_3 = 1'd0;
	if (((nonmaximum_suppression_valid_bit_3 & ~(output_fifo_ready)) & nonmaximum_suppression_entry_exitMask_F9_reg_stage3)) begin
		nonmaximum_suppression_state_stall_3 = 1'd1;
	end
	if (((nonmaximum_suppression_valid_bit_3 & ~(output_fifo_ready)) & nonmaximum_suppression_entry_exitMask_F14_reg_stage3)) begin
		nonmaximum_suppression_state_stall_3 = 1'd1;
	end
	if (((nonmaximum_suppression_valid_bit_3 & ~(output_fifo_ready)) & nonmaximum_suppression_entry_exitMask_T12_reg_stage3)) begin
		nonmaximum_suppression_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	nonmaximum_suppression_state_enable_3 = (nonmaximum_suppression_valid_bit_3 & ~(nonmaximum_suppression_state_stall_3));
end
always @(posedge clk) begin
	nonmaximum_suppression_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_bit_select23_reg_stage2 <= nonmaximum_suppression_entry_bit_select23;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_2) begin
		nonmaximum_suppression_entry_bit_select23_reg_stage3 <= nonmaximum_suppression_entry_bit_select23_reg_stage2;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_14_reg_stage1 <= nonmaximum_suppression_entry_14;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_14_reg_stage2 <= nonmaximum_suppression_entry_14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_NotCondition_reg_stage1 <= nonmaximum_suppression_entry_NotCondition;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_16_reg_stage1 <= nonmaximum_suppression_entry_16;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_exitMask_F3_reg_stage1 <= nonmaximum_suppression_entry_exitMask_F3;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_exitMask_F3_reg_stage2 <= nonmaximum_suppression_entry_exitMask_F3_reg_stage1;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_bit_concat24_reg_stage2 <= nonmaximum_suppression_entry_bit_concat24;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_exitMask_F9_reg_stage1 <= nonmaximum_suppression_entry_exitMask_F9;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_exitMask_F9_reg_stage2 <= nonmaximum_suppression_entry_exitMask_F9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_2) begin
		nonmaximum_suppression_entry_exitMask_F9_reg_stage3 <= nonmaximum_suppression_entry_exitMask_F9_reg_stage2;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_exitMask_T12_reg_stage1 <= nonmaximum_suppression_entry_exitMask_T12;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_exitMask_T12_reg_stage2 <= nonmaximum_suppression_entry_exitMask_T12_reg_stage1;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_2) begin
		nonmaximum_suppression_entry_exitMask_T12_reg_stage3 <= nonmaximum_suppression_entry_exitMask_T12_reg_stage2;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_exitMask_F14_reg_stage1 <= nonmaximum_suppression_entry_exitMask_F14;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_exitMask_F14_reg_stage2 <= nonmaximum_suppression_entry_exitMask_F14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_2) begin
		nonmaximum_suppression_entry_exitMask_F14_reg_stage3 <= nonmaximum_suppression_entry_exitMask_F14_reg_stage2;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_CaseCmpExitMask15_And_reg_stage2 <= nonmaximum_suppression_entry_CaseCmpExitMask15_And;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_CaseCmpExitMask17_And_reg_stage2 <= nonmaximum_suppression_entry_CaseCmpExitMask17_And;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_bit_concat18_reg_stage2 <= nonmaximum_suppression_entry_bit_concat18;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_bit_concat16_reg_stage2 <= nonmaximum_suppression_entry_bit_concat16;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_bit_concat14_reg_stage1 <= nonmaximum_suppression_entry_bit_concat14;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_add102_reg_stage1 <= nonmaximum_suppression_entry_add102;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_bit_concat6_reg_stage1 <= nonmaximum_suppression_entry_bit_concat6;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_add141_reg_stage1 <= nonmaximum_suppression_entry_add141;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_ORexitM30_reg_stage2 <= nonmaximum_suppression_entry_ORexitM30;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_bit_concat2_reg_stage2 <= nonmaximum_suppression_entry_bit_concat2;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_2) begin
		nonmaximum_suppression_entry_bit_select_reg_stage3 <= nonmaximum_suppression_entry_bit_select;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_2) begin
		nonmaximum_suppression_entry_cmp185_reg_stage3 <= nonmaximum_suppression_entry_cmp185;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_0) begin
		nonmaximum_suppression_entry_ORexitM142_reg_stage1 <= nonmaximum_suppression_entry_ORexitM142;
	end
end
always @(posedge clk) begin
	if (nonmaximum_suppression_state_enable_1) begin
		nonmaximum_suppression_entry_ORexitM142_reg_stage2 <= nonmaximum_suppression_entry_ORexitM142_reg_stage1;
	end
end
always @(*) begin
	canny_entry_output_fifo_sf_consumed_valid = input_fifo_valid;
end
always @(*) begin
	canny_entry_output_fifo_sf_consumed_data = input_fifo;
end
always @(*) begin
	canny_entry_output_fifo_sf_consumed_taken = 1'd0;
	if ((nonmaximum_suppression_valid_bit_0 & nonmaximum_suppression_entry_NotCondition)) begin
		canny_entry_output_fifo_sf_consumed_taken = ~(nonmaximum_suppression_state_stall_0);
	end
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_wire_a = nonmaximum_suppression_line_buffer_prev_row_a1_a0_read_data_a;
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a1_a0_clken_pipeline_cond = ~(nonmaximum_suppression_state_stall_2);
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_wire_a = nonmaximum_suppression_line_buffer_prev_row_a0_a0_read_data_a;
end
always @(*) begin
	nonmaximum_suppression_line_buffer_prev_row_a0_a0_clken_pipeline_cond = ~(nonmaximum_suppression_state_stall_1);
end
assign nonmaximum_suppression_entry_bit_concat27_bit_select_operand_0 = 31'd0;
assign nonmaximum_suppression_entry_bit_concat26_bit_select_operand_0 = 31'd0;
assign nonmaximum_suppression_entry_bit_concat25_bit_select_operand_0 = 31'd0;
assign nonmaximum_suppression_entry_bit_concat24_bit_select_operand_0 = 24'd0;
always @(posedge clk) begin
	if (switch_fifo_2_consumed_taken) begin
		switch_fifo_2_consumed_valid <= 1'd0;
	end
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_2_consumed_valid <= 1'd1;
	end
	if (reset) begin
		switch_fifo_2_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_2_consumed_data <= switch_fifo;
	end
	if (reset) begin
		switch_fifo_2_consumed_data <= 1'd0;
	end
end
always @(*) begin
	switch_fifo_2_consumed_taken = 1'd0;
	if ((nonmaximum_suppression_valid_bit_0 & nonmaximum_suppression_entry_exitMask_T1)) begin
		switch_fifo_2_consumed_taken = ~(nonmaximum_suppression_state_stall_0);
	end
end
assign nonmaximum_suppression_entry_bit_concat22_bit_select_operand_0 = 30'd0;
assign nonmaximum_suppression_entry_bit_concat20_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat18_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat16_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat14_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat12_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat10_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat8_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat6_bit_select_operand_0 = 24'd0;
assign nonmaximum_suppression_entry_bit_concat4_bit_select_operand_0 = 1'd0;
assign nonmaximum_suppression_entry_bit_concat2_bit_select_operand_0 = 1'd0;
assign nonmaximum_suppression_entry_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = ~(nonmaximum_suppression_state_stall_0);
end
always @(posedge clk) begin
	finish <= nonmaximum_suppression_state_enable_3;
end
always @(*) begin
	input_fifo_ready = canny_entry_output_fifo_sf_consumed_taken;
end
always @(*) begin
	switch_fifo_ready = (~(switch_fifo_2_consumed_valid) | switch_fifo_2_consumed_taken);
	if (reset) begin
		switch_fifo_ready = 1'd0;
	end
end
always @(*) begin
	if ((nonmaximum_suppression_valid_bit_3 & nonmaximum_suppression_entry_exitMask_F9_reg_stage3)) begin
		output_fifo = nonmaximum_suppression_entry_bit_select23_reg_stage3;
	end
	else if ((nonmaximum_suppression_valid_bit_3 & nonmaximum_suppression_entry_exitMask_F14_reg_stage3)) begin
		output_fifo = nonmaximum_suppression_entry_bit_select23_reg_stage3;
	end
	else /* if ((nonmaximum_suppression_valid_bit_3 & nonmaximum_suppression_entry_exitMask_T12_reg_stage3)) */ begin
		output_fifo = nonmaximum_suppression_entry_conv191;
	end
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((nonmaximum_suppression_state_enable_3 & nonmaximum_suppression_entry_exitMask_F9_reg_stage3)) begin
		output_fifo_valid = 1'd1;
	end
	if ((nonmaximum_suppression_state_enable_3 & nonmaximum_suppression_entry_exitMask_F14_reg_stage3)) begin
		output_fifo_valid = 1'd1;
	end
	if ((nonmaximum_suppression_state_enable_3 & nonmaximum_suppression_entry_exitMask_T12_reg_stage3)) begin
		output_fifo_valid = 1'd1;
	end
end

endmodule
`timescale 1 ns / 1 ns
module sobel_filter
(
	clk,
	reset,
	start,
	ready,
	finish,
	input_fifo,
	input_fifo_ready,
	input_fifo_valid,
	switch_fifo,
	switch_fifo_ready,
	switch_fifo_valid,
	output_fifo,
	output_fifo_ready,
	output_fifo_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [7:0] input_fifo;
output reg  input_fifo_ready;
input  input_fifo_valid;
input  switch_fifo;
output reg  switch_fifo_ready;
input  switch_fifo_valid;
output reg [15:0] output_fifo;
input  output_fifo_ready;
output reg  output_fifo_valid;
reg [7:0] sobel_filter_entry_1;
reg [7:0] sobel_filter_entry_3;
reg [7:0] sobel_filter_entry_4;
reg [7:0] sobel_filter_entry_6;
reg [7:0] sobel_filter_entry_7;
reg [7:0] sobel_filter_entry_9;
reg [31:0] sobel_filter_entry_10;
reg [31:0] sobel_filter_entry_11;
reg [31:0] sobel_filter_entry_12;
reg [31:0] sobel_filter_entry_13;
wire  sobel_filter_entry_14;
reg  sobel_filter_entry_NotCondition;
reg [7:0] sobel_filter_entry_15;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_entry_16;
reg [7:0] sobel_filter_entry_17;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_entry_18;
reg [7:0] sobel_filter_entry_19;
reg  sobel_filter_entry_cmp46_i;
reg [31:0] sobel_filter_entry_add50_i;
reg [31:0] sobel_filter_entry_add50_i_var0;
reg  sobel_filter_entry_cmp_i;
reg  sobel_filter_entry_exitMask_T1;
reg  sobel_filter_entry_NotCondition2;
reg  sobel_filter_entry_exitMask_F3;
reg [31:0] sobel_filter_entry_20;
reg  sobel_filter_entry_21;
reg [31:0] sobel_filter_entry_bit_concat26;
reg  sobel_filter_entry_cmp4_i;
reg [31:0] sobel_filter_entry_bit_concat25;
reg [31:0] sobel_filter_entry_or6_i;
reg  sobel_filter_entry_cmp9_i;
reg [31:0] sobel_filter_entry_bit_concat24;
reg [31:0] sobel_filter_entry_or11_i;
reg  sobel_filter_entry_tobool_i;
reg  sobel_filter_entry_cmp_i4;
reg  sobel_filter_entry_exitMask_T4;
reg [31:0] sobel_filter_entry_inc_i;
reg  sobel_filter_entry_cmp1_i;
reg  sobel_filter_entry_cmp2_i5;
reg  sobel_filter_entry_or_cond_i;
reg [31:0] sobel_filter_entry_inc5_i;
reg [31:0] sobel_filter_entry_inc5_i_var1;
reg [31:0] sobel_filter_entry_select11;
reg [31:0] sobel_filter_entry_select;
reg  sobel_filter_entry_22;
reg  sobel_filter_entry_exitMask_T7;
reg  sobel_filter_entry_NotCondition8;
reg  sobel_filter_entry_exitMask_F9;
reg [15:0] sobel_filter_entry_bit_concat23;
reg  sobel_filter_entry_exitMask_T12;
reg  sobel_filter_entry_NotCondition13;
reg  sobel_filter_entry_exitMask_F14;
reg [31:0] sobel_filter_entry_bit_concat22;
reg [31:0] sobel_filter_entry_bit_concat21;
reg [31:0] sobel_filter_entry_bit_concat20;
reg [31:0] sobel_filter_entry_bit_concat19;
reg [31:0] sobel_filter_entry_bit_concat18;
reg [31:0] sobel_filter_entry_bit_concat17;
reg [31:0] sobel_filter_entry_bit_concat16;
reg [31:0] sobel_filter_entry_bit_concat15;
reg [31:0] sobel_filter_entry_tmp;
reg [30:0] sobel_filter_entry_bit_select13;
reg [31:0] sobel_filter_entry_bit_concat14;
reg [31:0] sobel_filter_entry_add_1126;
reg [31:0] sobel_filter_entry_add_2_1;
reg [31:0] sobel_filter_entry_add_2134;
reg [31:0] sobel_filter_entry_add_2_2;
reg  sobel_filter_entry_bit_select10;
reg [31:0] sobel_filter_entry_tmp3;
reg [30:0] sobel_filter_entry_bit_select11;
reg [31:0] sobel_filter_entry_bit_concat12;
reg [31:0] sobel_filter_entry_add35_2;
reg [31:0] sobel_filter_entry_add35_2137;
reg [31:0] sobel_filter_entry_add35_1_2;
reg [31:0] sobel_filter_entry_add35_2_2;
reg  sobel_filter_entry_bit_select9;
reg [31:0] sobel_filter_entry_sub;
reg [31:0] sobel_filter_entry_cond;
reg [31:0] sobel_filter_entry_sub49;
reg [31:0] sobel_filter_entry_cond52;
reg  sobel_filter_entry_not_cmp54;
reg [31:0] sobel_filter_entry_add59;
reg [7:0] sobel_filter_entry_bit_select1;
reg  sobel_filter_entry_cmp60;
reg [31:0] sobel_filter_entry_gx_sum_0_lobit115;
reg  sobel_filter_entry_bit_select6;
reg [31:0] sobel_filter_entry_bit_concat8;
reg [31:0] sobel_filter_entry_bit_concat7;
reg [31:0] sobel_filter_entry_bit_concat5;
reg [31:0] sobel_filter_entry_xor77;
reg [31:0] sobel_filter_entry_or;
reg [23:0] sobel_filter_entry_bit_select3;
reg [31:0] sobel_filter_entry_bit_concat4;
reg [31:0] sobel_filter_entry_bit_concat2;
reg [31:0] sobel_filter_entry_conv81;
reg [31:0] sobel_filter_entry_or82;
reg [15:0] sobel_filter_entry_bit_select;
reg  sobel_filter_entry_ORexitM121;
reg [7:0] sobel_filter_entry_select112;
reg [7:0] sobel_filter_entry_select116;
reg [7:0] sobel_filter_entry_select118;
reg [7:0] sobel_filter_entry_select96;
reg [7:0] sobel_filter_entry_select100;
reg [7:0] sobel_filter_entry_select102;
reg [7:0] sobel_filter_entry_select88;
reg [7:0] sobel_filter_entry_select92;
reg [7:0] sobel_filter_entry_select94;
reg [7:0] sobel_filter_entry_select72;
reg [7:0] sobel_filter_entry_select76;
reg [7:0] sobel_filter_entry_select78;
reg [7:0] sobel_filter_entry_select64;
reg [7:0] sobel_filter_entry_select68;
reg [7:0] sobel_filter_entry_select70;
reg [7:0] sobel_filter_entry_select48;
reg [7:0] sobel_filter_entry_select52;
reg [7:0] sobel_filter_entry_select54;
reg [31:0] sobel_filter_entry_select40;
reg [31:0] sobel_filter_entry_select44;
reg [31:0] sobel_filter_entry_select46;
reg [31:0] sobel_filter_entry_bit_concat;
reg [31:0] sobel_filter_entry_select36;
reg [31:0] sobel_filter_entry_select38;
reg [31:0] sobel_filter_entry_select24;
reg [31:0] sobel_filter_entry_select28;
reg [31:0] sobel_filter_entry_select30;
reg [31:0] sobel_filter_entry_select16;
reg [31:0] sobel_filter_entry_select20;
reg [31:0] sobel_filter_entry_select22;
reg [7:0] sobel_filter_line_buffer_window_a0_a1_inferred_reg;
reg [7:0] sobel_filter_line_buffer_window_a0_a2_inferred_reg;
reg [7:0] sobel_filter_line_buffer_window_a1_a1_inferred_reg;
reg [7:0] sobel_filter_line_buffer_window_a1_a2_inferred_reg;
reg [7:0] sobel_filter_line_buffer_window_a2_a1_inferred_reg;
reg [7:0] sobel_filter_line_buffer_window_a2_a2_inferred_reg;
reg [31:0] sobel_filter_line_buffer_prev_row_index_inferred_reg;
reg  sobel_filter_line_buffer_prev_row_a0_a0_clken;
reg [10:0] sobel_filter_line_buffer_prev_row_a0_a0_address_a;
wire  sobel_filter_line_buffer_prev_row_a0_a0_write_en_a;
wire [7:0] sobel_filter_line_buffer_prev_row_a0_a0_write_data_a;
wire [7:0] sobel_filter_line_buffer_prev_row_a0_a0_read_data_a;
reg  sobel_filter_line_buffer_prev_row_a0_a0_read_en_a;
reg [10:0] sobel_filter_line_buffer_prev_row_a0_a0_address_b;
reg  sobel_filter_line_buffer_prev_row_a0_a0_write_en_b;
reg [7:0] sobel_filter_line_buffer_prev_row_a0_a0_write_data_b;
wire [7:0] sobel_filter_line_buffer_prev_row_a0_a0_read_data_b;
wire  sobel_filter_line_buffer_prev_row_a0_a0_read_en_b;
reg  sobel_filter_line_buffer_prev_row_a1_a0_clken;
reg [10:0] sobel_filter_line_buffer_prev_row_a1_a0_address_a;
wire  sobel_filter_line_buffer_prev_row_a1_a0_write_en_a;
wire [7:0] sobel_filter_line_buffer_prev_row_a1_a0_write_data_a;
wire [7:0] sobel_filter_line_buffer_prev_row_a1_a0_read_data_a;
reg  sobel_filter_line_buffer_prev_row_a1_a0_read_en_a;
reg [10:0] sobel_filter_line_buffer_prev_row_a1_a0_address_b;
reg  sobel_filter_line_buffer_prev_row_a1_a0_write_en_b;
reg [7:0] sobel_filter_line_buffer_prev_row_a1_a0_write_data_b;
wire [7:0] sobel_filter_line_buffer_prev_row_a1_a0_read_data_b;
wire  sobel_filter_line_buffer_prev_row_a1_a0_read_en_b;
reg [31:0] sobel_filter_count_inferred_reg;
reg [31:0] sobel_filter_i_inferred_reg;
reg [31:0] sobel_filter_j_inferred_reg;
reg  sobel_filter_valid_bit_0;
reg  sobel_filter_state_stall_0;
reg  sobel_filter_state_enable_0;
reg  sobel_filter_valid_bit_1;
reg  sobel_filter_state_stall_1;
reg  sobel_filter_state_enable_1;
reg  sobel_filter_valid_bit_2;
reg  sobel_filter_state_stall_2;
reg  sobel_filter_state_enable_2;
reg  sobel_filter_valid_bit_3;
reg  sobel_filter_state_stall_3;
reg  sobel_filter_state_enable_3;
reg  sobel_filter_II_counter;
reg  sobel_filter_entry_14_reg_stage1;
reg  sobel_filter_entry_14_reg_stage2;
reg  sobel_filter_entry_NotCondition_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] sobel_filter_entry_16_reg_stage1;
reg  sobel_filter_entry_exitMask_F3_reg_stage1;
reg  sobel_filter_entry_exitMask_F3_reg_stage2;
reg  sobel_filter_entry_exitMask_F9_reg_stage1;
reg  sobel_filter_entry_exitMask_F9_reg_stage2;
reg  sobel_filter_entry_exitMask_F9_reg_stage3;
reg [15:0] sobel_filter_entry_bit_concat23_reg_stage2;
reg [15:0] sobel_filter_entry_bit_concat23_reg_stage3;
reg  sobel_filter_entry_exitMask_T12_reg_stage1;
reg  sobel_filter_entry_exitMask_T12_reg_stage2;
reg  sobel_filter_entry_exitMask_T12_reg_stage3;
reg  sobel_filter_entry_exitMask_F14_reg_stage1;
reg  sobel_filter_entry_exitMask_F14_reg_stage2;
reg  sobel_filter_entry_exitMask_F14_reg_stage3;
reg [31:0] sobel_filter_entry_bit_concat17_reg_stage1;
reg [31:0] sobel_filter_entry_bit_concat17_reg_stage2;
reg [31:0] sobel_filter_entry_bit_concat16_reg_stage1;
reg [31:0] sobel_filter_entry_bit_concat16_reg_stage2;
reg [31:0] sobel_filter_entry_bit_concat15_reg_stage1;
reg [31:0] sobel_filter_entry_bit_concat15_reg_stage2;
reg [31:0] sobel_filter_entry_bit_concat14_reg_stage2;
reg [31:0] sobel_filter_entry_add59_reg_stage3;
reg [31:0] sobel_filter_entry_bit_concat8_reg_stage3;
reg [31:0] sobel_filter_entry_bit_concat7_reg_stage3;
reg [31:0] sobel_filter_entry_bit_concat5_reg_stage3;
reg [31:0] sobel_filter_entry_bit_concat2_reg_stage3;
reg  sobel_filter_entry_ORexitM121_reg_stage1;
reg  sobel_filter_entry_ORexitM121_reg_stage2;
reg  canny_entry_output_fifo_gf_consumed_valid;
reg [7:0] canny_entry_output_fifo_gf_consumed_data;
reg  canny_entry_output_fifo_gf_consumed_taken;
reg [7:0] sobel_filter_line_buffer_prev_row_a1_a0_read_data_wire_a;
reg  sobel_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
reg [7:0] sobel_filter_line_buffer_prev_row_a0_a0_read_data_wire_a;
reg  sobel_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
wire [30:0] sobel_filter_entry_bit_concat26_bit_select_operand_0;
wire [30:0] sobel_filter_entry_bit_concat25_bit_select_operand_0;
wire [30:0] sobel_filter_entry_bit_concat24_bit_select_operand_0;
reg  switch_fifo_1_consumed_valid;
reg  switch_fifo_1_consumed_data;
reg  switch_fifo_1_consumed_taken;
wire [7:0] sobel_filter_entry_bit_concat23_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat22_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat21_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat20_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat19_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat18_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat17_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat16_bit_select_operand_0;
wire [23:0] sobel_filter_entry_bit_concat15_bit_select_operand_0;
wire  sobel_filter_entry_bit_concat14_bit_select_operand_2;
wire  sobel_filter_entry_bit_concat12_bit_select_operand_2;
wire [9:0] sobel_filter_entry_cmp60_op1_temp;
wire [30:0] sobel_filter_entry_bit_concat8_bit_select_operand_0;
wire [29:0] sobel_filter_entry_bit_concat7_bit_select_operand_0;
wire  sobel_filter_entry_bit_concat7_bit_select_operand_4;
wire [30:0] sobel_filter_entry_bit_concat5_bit_select_operand_0;
wire [7:0] sobel_filter_entry_bit_concat4_bit_select_operand_2;
wire [23:0] sobel_filter_entry_bit_concat2_bit_select_operand_0;
wire [30:0] sobel_filter_entry_bit_concat_bit_select_operand_0;



// @_ZZ12sobel_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEERNS0_ItLb0EEEE11line_buffer.prev_row.a0.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port sobel_filter_line_buffer_prev_row_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( sobel_filter_line_buffer_prev_row_a0_a0_clken ),
	.address_a( sobel_filter_line_buffer_prev_row_a0_a0_address_a ),
	.write_en_a( sobel_filter_line_buffer_prev_row_a0_a0_write_en_a ),
	.write_data_a( sobel_filter_line_buffer_prev_row_a0_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( sobel_filter_line_buffer_prev_row_a0_a0_read_data_a ),
	.address_b( sobel_filter_line_buffer_prev_row_a0_a0_address_b ),
	.write_en_b( sobel_filter_line_buffer_prev_row_a0_a0_write_en_b ),
	.write_data_b( sobel_filter_line_buffer_prev_row_a0_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( sobel_filter_line_buffer_prev_row_a0_a0_read_data_b )
);
defparam sobel_filter_line_buffer_prev_row_a0_a0.width_a = 8;
defparam sobel_filter_line_buffer_prev_row_a0_a0.widthad_a = 11;
defparam sobel_filter_line_buffer_prev_row_a0_a0.width_be_a = 1;
defparam sobel_filter_line_buffer_prev_row_a0_a0.numwords_a = 1920;
defparam sobel_filter_line_buffer_prev_row_a0_a0.width_b = 8;
defparam sobel_filter_line_buffer_prev_row_a0_a0.widthad_b = 11;
defparam sobel_filter_line_buffer_prev_row_a0_a0.width_be_b = 1;
defparam sobel_filter_line_buffer_prev_row_a0_a0.numwords_b = 1920;
defparam sobel_filter_line_buffer_prev_row_a0_a0.latency = 1;
defparam sobel_filter_line_buffer_prev_row_a0_a0.init_file = {`MEM_INIT_DIR, "sobel_filter_line_buffer_prev_row_a0_a0.mem"};



// @_ZZ12sobel_filterRN5legup4FIFOINS_7ap_uintILj1EEELb0EEERNS0_IhLb0EEERNS0_ItLb0EEEE11line_buffer.prev_row.a1.a0 = internal unnamed_addr global [1920 x i8] zeroinitializer
ram_dual_port sobel_filter_line_buffer_prev_row_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( sobel_filter_line_buffer_prev_row_a1_a0_clken ),
	.address_a( sobel_filter_line_buffer_prev_row_a1_a0_address_a ),
	.write_en_a( sobel_filter_line_buffer_prev_row_a1_a0_write_en_a ),
	.write_data_a( sobel_filter_line_buffer_prev_row_a1_a0_write_data_a ),
	.byte_en_a( {1{1'b1}} ),
	.read_data_a( sobel_filter_line_buffer_prev_row_a1_a0_read_data_a ),
	.address_b( sobel_filter_line_buffer_prev_row_a1_a0_address_b ),
	.write_en_b( sobel_filter_line_buffer_prev_row_a1_a0_write_en_b ),
	.write_data_b( sobel_filter_line_buffer_prev_row_a1_a0_write_data_b ),
	.byte_en_b( {1{1'b1}} ),
	.read_data_b( sobel_filter_line_buffer_prev_row_a1_a0_read_data_b )
);
defparam sobel_filter_line_buffer_prev_row_a1_a0.width_a = 8;
defparam sobel_filter_line_buffer_prev_row_a1_a0.widthad_a = 11;
defparam sobel_filter_line_buffer_prev_row_a1_a0.width_be_a = 1;
defparam sobel_filter_line_buffer_prev_row_a1_a0.numwords_a = 1920;
defparam sobel_filter_line_buffer_prev_row_a1_a0.width_b = 8;
defparam sobel_filter_line_buffer_prev_row_a1_a0.widthad_b = 11;
defparam sobel_filter_line_buffer_prev_row_a1_a0.width_be_b = 1;
defparam sobel_filter_line_buffer_prev_row_a1_a0.numwords_b = 1920;
defparam sobel_filter_line_buffer_prev_row_a1_a0.latency = 1;
defparam sobel_filter_line_buffer_prev_row_a1_a0.init_file = {`MEM_INIT_DIR, "sobel_filter_line_buffer_prev_row_a1_a0.mem"};


always @(*) begin
		sobel_filter_entry_1 = sobel_filter_line_buffer_window_a0_a1_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_3 = sobel_filter_line_buffer_window_a0_a2_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_4 = sobel_filter_line_buffer_window_a1_a1_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_6 = sobel_filter_line_buffer_window_a1_a2_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_7 = sobel_filter_line_buffer_window_a2_a1_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_9 = sobel_filter_line_buffer_window_a2_a2_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_10 = sobel_filter_line_buffer_prev_row_index_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_11 = sobel_filter_count_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_12 = sobel_filter_i_inferred_reg;
end
always @(*) begin
		sobel_filter_entry_13 = sobel_filter_j_inferred_reg;
end
assign sobel_filter_entry_14 = ~(canny_entry_output_fifo_gf_consumed_valid);
always @(*) begin
		sobel_filter_entry_NotCondition = (sobel_filter_entry_14 ^ 1'd1);
end
always @(*) begin
	sobel_filter_entry_15 = canny_entry_output_fifo_gf_consumed_data;
end
always @(*) begin
		sobel_filter_entry_16 = (1'd0 + (1 * sobel_filter_entry_10));
end
always @(*) begin
		sobel_filter_entry_17 = sobel_filter_line_buffer_prev_row_a1_a0_read_data_wire_a;
end
always @(*) begin
		sobel_filter_entry_18 = (1'd0 + (1 * sobel_filter_entry_10));
end
always @(*) begin
		sobel_filter_entry_19 = sobel_filter_line_buffer_prev_row_a0_a0_read_data_wire_a;
end
always @(*) begin
		sobel_filter_entry_cmp46_i = (sobel_filter_entry_10 == 32'd1919);
end
always @(*) begin
		sobel_filter_entry_add50_i = (sobel_filter_entry_10 + 32'd1);
end
always @(*) begin
		sobel_filter_entry_add50_i_var0 = (sobel_filter_entry_cmp46_i ? 32'd0 : sobel_filter_entry_add50_i);
end
always @(*) begin
		sobel_filter_entry_cmp_i = (sobel_filter_entry_11 > 32'd1920);
end
always @(*) begin
		sobel_filter_entry_exitMask_T1 = (sobel_filter_entry_cmp_i & sobel_filter_entry_NotCondition);
end
always @(*) begin
		sobel_filter_entry_NotCondition2 = (sobel_filter_entry_cmp_i ^ 1'd1);
end
always @(*) begin
		sobel_filter_entry_exitMask_F3 = (sobel_filter_entry_NotCondition & sobel_filter_entry_NotCondition2);
end
always @(*) begin
		sobel_filter_entry_20 = (sobel_filter_entry_12 + $signed(-32'd1));
end
always @(*) begin
		sobel_filter_entry_21 = (sobel_filter_entry_20 > 32'd1077);
end
always @(*) begin
		sobel_filter_entry_bit_concat26 = {sobel_filter_entry_bit_concat26_bit_select_operand_0[30:0], sobel_filter_entry_21};
end
always @(*) begin
		sobel_filter_entry_cmp4_i = (sobel_filter_entry_13 == 32'd0);
end
always @(*) begin
		sobel_filter_entry_bit_concat25 = {sobel_filter_entry_bit_concat25_bit_select_operand_0[30:0], sobel_filter_entry_cmp4_i};
end
always @(*) begin
		sobel_filter_entry_or6_i = (sobel_filter_entry_bit_concat26 | sobel_filter_entry_bit_concat25);
end
always @(*) begin
		sobel_filter_entry_cmp9_i = (sobel_filter_entry_13 > 32'd1918);
end
always @(*) begin
		sobel_filter_entry_bit_concat24 = {sobel_filter_entry_bit_concat24_bit_select_operand_0[30:0], sobel_filter_entry_cmp9_i};
end
always @(*) begin
		sobel_filter_entry_or11_i = (sobel_filter_entry_or6_i | sobel_filter_entry_bit_concat24);
end
always @(*) begin
		sobel_filter_entry_tobool_i = (sobel_filter_entry_or11_i == 32'd0);
end
always @(*) begin
		sobel_filter_entry_cmp_i4 = (sobel_filter_entry_13 < 32'd1919);
end
always @(*) begin
		sobel_filter_entry_exitMask_T4 = (sobel_filter_entry_exitMask_T1 & sobel_filter_entry_cmp_i4);
end
always @(*) begin
		sobel_filter_entry_inc_i = (sobel_filter_entry_13 + 32'd1);
end
always @(*) begin
		sobel_filter_entry_cmp1_i = (sobel_filter_entry_12 == 32'd1079);
end
always @(*) begin
		sobel_filter_entry_cmp2_i5 = (sobel_filter_entry_13 == 32'd1919);
end
always @(*) begin
		sobel_filter_entry_or_cond_i = (sobel_filter_entry_cmp1_i & sobel_filter_entry_cmp2_i5);
end
always @(*) begin
		sobel_filter_entry_inc5_i = (sobel_filter_entry_12 + 32'd1);
end
always @(*) begin
		sobel_filter_entry_inc5_i_var1 = (sobel_filter_entry_or_cond_i ? 32'd0 : sobel_filter_entry_inc5_i);
end
always @(*) begin
		sobel_filter_entry_select11 = (sobel_filter_entry_exitMask_T4 ? sobel_filter_entry_12 : sobel_filter_entry_inc5_i_var1);
end
always @(*) begin
		sobel_filter_entry_select = (sobel_filter_entry_exitMask_T4 ? sobel_filter_entry_inc_i : 32'd0);
end
always @(*) begin
	sobel_filter_entry_22 = switch_fifo_1_consumed_data;
end
always @(*) begin
		sobel_filter_entry_exitMask_T7 = (sobel_filter_entry_exitMask_T1 & sobel_filter_entry_22);
end
always @(*) begin
		sobel_filter_entry_NotCondition8 = (sobel_filter_entry_22 ^ 1'd1);
end
always @(*) begin
		sobel_filter_entry_exitMask_F9 = (sobel_filter_entry_exitMask_T1 & sobel_filter_entry_NotCondition8);
end
always @(*) begin
		sobel_filter_entry_bit_concat23 = {sobel_filter_entry_bit_concat23_bit_select_operand_0[7:0], sobel_filter_entry_6[7:0]};
end
always @(*) begin
		sobel_filter_entry_exitMask_T12 = (sobel_filter_entry_exitMask_T7 & sobel_filter_entry_tobool_i);
end
always @(*) begin
		sobel_filter_entry_NotCondition13 = (sobel_filter_entry_tobool_i ^ 1'd1);
end
always @(*) begin
		sobel_filter_entry_exitMask_F14 = (sobel_filter_entry_exitMask_T7 & sobel_filter_entry_NotCondition13);
end
always @(*) begin
		sobel_filter_entry_bit_concat22 = {sobel_filter_entry_bit_concat22_bit_select_operand_0[23:0], sobel_filter_entry_1[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat21 = {sobel_filter_entry_bit_concat21_bit_select_operand_0[23:0], sobel_filter_entry_3[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat20 = {sobel_filter_entry_bit_concat20_bit_select_operand_0[23:0], sobel_filter_entry_17[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat19 = {sobel_filter_entry_bit_concat19_bit_select_operand_0[23:0], sobel_filter_entry_4[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat18 = {sobel_filter_entry_bit_concat18_bit_select_operand_0[23:0], sobel_filter_entry_19[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat17 = {sobel_filter_entry_bit_concat17_bit_select_operand_0[23:0], sobel_filter_entry_7[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat16 = {sobel_filter_entry_bit_concat16_bit_select_operand_0[23:0], sobel_filter_entry_9[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat15 = {sobel_filter_entry_bit_concat15_bit_select_operand_0[23:0], sobel_filter_entry_15[7:0]};
end
always @(*) begin
		sobel_filter_entry_tmp = (sobel_filter_entry_bit_concat18 - sobel_filter_entry_bit_concat19);
end
always @(*) begin
		sobel_filter_entry_bit_select13 = sobel_filter_entry_tmp[30:0];
end
always @(*) begin
		sobel_filter_entry_bit_concat14 = {sobel_filter_entry_bit_select13[30:0], sobel_filter_entry_bit_concat14_bit_select_operand_2};
end
always @(*) begin
		sobel_filter_entry_add_1126 = (sobel_filter_entry_bit_concat20 - sobel_filter_entry_bit_concat22);
end
always @(*) begin
		sobel_filter_entry_add_2_1 = (sobel_filter_entry_add_1126 - sobel_filter_entry_bit_concat17_reg_stage2);
end
always @(*) begin
		sobel_filter_entry_add_2134 = (sobel_filter_entry_add_2_1 + sobel_filter_entry_bit_concat15_reg_stage2);
end
always @(*) begin
		sobel_filter_entry_add_2_2 = (sobel_filter_entry_add_2134 + sobel_filter_entry_bit_concat14_reg_stage2);
end
always @(*) begin
		sobel_filter_entry_bit_select10 = sobel_filter_entry_add_2_2[31];
end
always @(*) begin
		sobel_filter_entry_tmp3 = (sobel_filter_entry_bit_concat21 - sobel_filter_entry_bit_concat16_reg_stage2);
end
always @(*) begin
		sobel_filter_entry_bit_select11 = sobel_filter_entry_tmp3[30:0];
end
always @(*) begin
		sobel_filter_entry_bit_concat12 = {sobel_filter_entry_bit_select11[30:0], sobel_filter_entry_bit_concat12_bit_select_operand_2};
end
always @(*) begin
		sobel_filter_entry_add35_2 = (sobel_filter_entry_bit_concat20 + sobel_filter_entry_bit_concat22);
end
always @(*) begin
		sobel_filter_entry_add35_2137 = (sobel_filter_entry_add35_2 - sobel_filter_entry_bit_concat17_reg_stage2);
end
always @(*) begin
		sobel_filter_entry_add35_1_2 = (sobel_filter_entry_add35_2137 - sobel_filter_entry_bit_concat15_reg_stage2);
end
always @(*) begin
		sobel_filter_entry_add35_2_2 = (sobel_filter_entry_add35_1_2 + sobel_filter_entry_bit_concat12);
end
always @(*) begin
		sobel_filter_entry_bit_select9 = sobel_filter_entry_add35_2_2[31];
end
always @(*) begin
		sobel_filter_entry_sub = (32'd0 - sobel_filter_entry_add_2_2);
end
always @(*) begin
		sobel_filter_entry_cond = (sobel_filter_entry_bit_select10 ? sobel_filter_entry_sub : sobel_filter_entry_add_2_2);
end
always @(*) begin
		sobel_filter_entry_sub49 = (32'd0 - sobel_filter_entry_add35_2_2);
end
always @(*) begin
		sobel_filter_entry_cond52 = (sobel_filter_entry_bit_select9 ? sobel_filter_entry_sub49 : sobel_filter_entry_add35_2_2);
end
always @(*) begin
		sobel_filter_entry_not_cmp54 = ($signed(sobel_filter_entry_cond) < $signed(sobel_filter_entry_cond52));
end
always @(*) begin
		sobel_filter_entry_add59 = (sobel_filter_entry_cond + sobel_filter_entry_cond52);
end
always @(*) begin
		sobel_filter_entry_bit_select1 = sobel_filter_entry_add59[7:0];
end
always @(*) begin
		sobel_filter_entry_cmp60 = ($signed(sobel_filter_entry_add59_reg_stage3) > $signed({22'd0,sobel_filter_entry_cmp60_op1_temp}));
end
always @(*) begin
		sobel_filter_entry_gx_sum_0_lobit115 = (sobel_filter_entry_add_2_2 ^ sobel_filter_entry_add35_2_2);
end
always @(*) begin
		sobel_filter_entry_bit_select6 = sobel_filter_entry_gx_sum_0_lobit115[31];
end
always @(*) begin
		sobel_filter_entry_bit_concat8 = {sobel_filter_entry_bit_concat8_bit_select_operand_0[30:0], sobel_filter_entry_bit_select6};
end
always @(*) begin
		sobel_filter_entry_bit_concat7 = {{sobel_filter_entry_bit_concat7_bit_select_operand_0[29:0], sobel_filter_entry_bit_select6}, sobel_filter_entry_bit_concat7_bit_select_operand_4};
end
always @(*) begin
		sobel_filter_entry_bit_concat5 = {sobel_filter_entry_bit_concat5_bit_select_operand_0[30:0], sobel_filter_entry_not_cmp54};
end
always @(*) begin
		sobel_filter_entry_xor77 = (sobel_filter_entry_bit_concat5_reg_stage3 ^ sobel_filter_entry_bit_concat8_reg_stage3);
end
always @(*) begin
		sobel_filter_entry_or = (sobel_filter_entry_xor77 | sobel_filter_entry_bit_concat7_reg_stage3);
end
always @(*) begin
		sobel_filter_entry_bit_select3 = sobel_filter_entry_or[23:0];
end
always @(*) begin
		sobel_filter_entry_bit_concat4 = {sobel_filter_entry_bit_select3[23:0], sobel_filter_entry_bit_concat4_bit_select_operand_2[7:0]};
end
always @(*) begin
		sobel_filter_entry_bit_concat2 = {sobel_filter_entry_bit_concat2_bit_select_operand_0[23:0], sobel_filter_entry_bit_select1[7:0]};
end
always @(*) begin
		sobel_filter_entry_conv81 = (sobel_filter_entry_cmp60 ? 32'd255 : sobel_filter_entry_bit_concat2_reg_stage3);
end
always @(*) begin
		sobel_filter_entry_or82 = (sobel_filter_entry_bit_concat4 | sobel_filter_entry_conv81);
end
always @(*) begin
		sobel_filter_entry_bit_select = sobel_filter_entry_or82[15:0];
end
always @(*) begin
		sobel_filter_entry_ORexitM121 = (sobel_filter_entry_exitMask_F14 | sobel_filter_entry_exitMask_F9);
end
always @(*) begin
		sobel_filter_entry_select112 = (sobel_filter_entry_14_reg_stage2 ? sobel_filter_entry_1 : sobel_filter_entry_3);
end
always @(*) begin
		sobel_filter_entry_select116 = (sobel_filter_entry_exitMask_F3_reg_stage2 ? sobel_filter_entry_3 : sobel_filter_entry_select112);
end
always @(*) begin
		sobel_filter_entry_select118 = (sobel_filter_entry_ORexitM121_reg_stage2 ? sobel_filter_entry_3 : sobel_filter_entry_select116);
end
always @(*) begin
		sobel_filter_entry_select96 = (sobel_filter_entry_14_reg_stage2 ? sobel_filter_entry_3 : sobel_filter_entry_17);
end
always @(*) begin
		sobel_filter_entry_select100 = (sobel_filter_entry_exitMask_F3_reg_stage2 ? sobel_filter_entry_17 : sobel_filter_entry_select96);
end
always @(*) begin
		sobel_filter_entry_select102 = (sobel_filter_entry_ORexitM121_reg_stage2 ? sobel_filter_entry_17 : sobel_filter_entry_select100);
end
always @(*) begin
		sobel_filter_entry_select88 = (sobel_filter_entry_14_reg_stage1 ? sobel_filter_entry_4 : sobel_filter_entry_6);
end
always @(*) begin
		sobel_filter_entry_select92 = (sobel_filter_entry_exitMask_F3_reg_stage1 ? sobel_filter_entry_6 : sobel_filter_entry_select88);
end
always @(*) begin
		sobel_filter_entry_select94 = (sobel_filter_entry_ORexitM121_reg_stage1 ? sobel_filter_entry_6 : sobel_filter_entry_select92);
end
always @(*) begin
		sobel_filter_entry_select72 = (sobel_filter_entry_14_reg_stage1 ? sobel_filter_entry_6 : sobel_filter_entry_19);
end
always @(*) begin
		sobel_filter_entry_select76 = (sobel_filter_entry_exitMask_F3_reg_stage1 ? sobel_filter_entry_19 : sobel_filter_entry_select72);
end
always @(*) begin
		sobel_filter_entry_select78 = (sobel_filter_entry_ORexitM121_reg_stage1 ? sobel_filter_entry_19 : sobel_filter_entry_select76);
end
always @(*) begin
		sobel_filter_entry_select64 = (sobel_filter_entry_14 ? sobel_filter_entry_7 : sobel_filter_entry_9);
end
always @(*) begin
		sobel_filter_entry_select68 = (sobel_filter_entry_exitMask_F3 ? sobel_filter_entry_9 : sobel_filter_entry_select64);
end
always @(*) begin
		sobel_filter_entry_select70 = (sobel_filter_entry_ORexitM121 ? sobel_filter_entry_9 : sobel_filter_entry_select68);
end
always @(*) begin
		sobel_filter_entry_select48 = (sobel_filter_entry_14 ? sobel_filter_entry_9 : sobel_filter_entry_15);
end
always @(*) begin
		sobel_filter_entry_select52 = (sobel_filter_entry_exitMask_F3 ? sobel_filter_entry_15 : sobel_filter_entry_select48);
end
always @(*) begin
		sobel_filter_entry_select54 = (sobel_filter_entry_ORexitM121 ? sobel_filter_entry_15 : sobel_filter_entry_select52);
end
always @(*) begin
		sobel_filter_entry_select40 = (sobel_filter_entry_14 ? sobel_filter_entry_10 : sobel_filter_entry_add50_i_var0);
end
always @(*) begin
		sobel_filter_entry_select44 = (sobel_filter_entry_exitMask_F3 ? sobel_filter_entry_add50_i_var0 : sobel_filter_entry_select40);
end
always @(*) begin
		sobel_filter_entry_select46 = (sobel_filter_entry_ORexitM121 ? sobel_filter_entry_add50_i_var0 : sobel_filter_entry_select44);
end
always @(*) begin
		sobel_filter_entry_bit_concat = {sobel_filter_entry_bit_concat_bit_select_operand_0[30:0], sobel_filter_entry_exitMask_F3};
end
always @(*) begin
		sobel_filter_entry_select36 = (sobel_filter_entry_ORexitM121 ? 32'd0 : sobel_filter_entry_bit_concat);
end
always @(*) begin
		sobel_filter_entry_select38 = (sobel_filter_entry_11 + sobel_filter_entry_select36);
end
always @(*) begin
		sobel_filter_entry_select24 = (sobel_filter_entry_14 ? sobel_filter_entry_12 : sobel_filter_entry_select11);
end
always @(*) begin
		sobel_filter_entry_select28 = (sobel_filter_entry_exitMask_F3 ? sobel_filter_entry_12 : sobel_filter_entry_select24);
end
always @(*) begin
		sobel_filter_entry_select30 = (sobel_filter_entry_ORexitM121 ? sobel_filter_entry_select11 : sobel_filter_entry_select28);
end
always @(*) begin
		sobel_filter_entry_select16 = (sobel_filter_entry_14 ? sobel_filter_entry_13 : sobel_filter_entry_select);
end
always @(*) begin
		sobel_filter_entry_select20 = (sobel_filter_entry_exitMask_F3 ? sobel_filter_entry_13 : sobel_filter_entry_select16);
end
always @(*) begin
		sobel_filter_entry_select22 = (sobel_filter_entry_ORexitM121 ? sobel_filter_entry_select : sobel_filter_entry_select20);
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_window_a0_a1_inferred_reg <= 8'd0;
	end
	if ((sobel_filter_state_enable_2 & 1'd1)) begin
		sobel_filter_line_buffer_window_a0_a1_inferred_reg <= sobel_filter_entry_select118;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_window_a0_a2_inferred_reg <= 8'd0;
	end
	if ((sobel_filter_state_enable_2 & 1'd1)) begin
		sobel_filter_line_buffer_window_a0_a2_inferred_reg <= sobel_filter_entry_select102;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_window_a1_a1_inferred_reg <= 8'd0;
	end
	if ((sobel_filter_state_enable_1 & 1'd1)) begin
		sobel_filter_line_buffer_window_a1_a1_inferred_reg <= sobel_filter_entry_select94;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_window_a1_a2_inferred_reg <= 8'd0;
	end
	if ((sobel_filter_state_enable_1 & 1'd1)) begin
		sobel_filter_line_buffer_window_a1_a2_inferred_reg <= sobel_filter_entry_select78;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_window_a2_a1_inferred_reg <= 8'd0;
	end
	if ((sobel_filter_state_enable_0 & 1'd1)) begin
		sobel_filter_line_buffer_window_a2_a1_inferred_reg <= sobel_filter_entry_select70;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_window_a2_a2_inferred_reg <= 8'd0;
	end
	if ((sobel_filter_state_enable_0 & 1'd1)) begin
		sobel_filter_line_buffer_window_a2_a2_inferred_reg <= sobel_filter_entry_select54;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_line_buffer_prev_row_index_inferred_reg <= 32'd0;
	end
	if ((sobel_filter_state_enable_0 & 1'd1)) begin
		sobel_filter_line_buffer_prev_row_index_inferred_reg <= sobel_filter_entry_select46;
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_clken = sobel_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_address_a = 'dx;
	if ((sobel_filter_state_enable_0 & sobel_filter_entry_NotCondition)) begin
		sobel_filter_line_buffer_prev_row_a0_a0_address_a = (sobel_filter_entry_18 >>> 1'd0);
	end
end
assign sobel_filter_line_buffer_prev_row_a0_a0_write_en_a = 'd0;
assign sobel_filter_line_buffer_prev_row_a0_a0_write_data_a = 'dx;
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_read_en_a = 'd0;
	if (sobel_filter_state_enable_0) begin
		sobel_filter_line_buffer_prev_row_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_address_b = 'dx;
	if ((sobel_filter_valid_bit_0 & sobel_filter_entry_NotCondition)) begin
		sobel_filter_line_buffer_prev_row_a0_a0_address_b = (sobel_filter_entry_18 >>> 1'd0);
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_write_en_b = 'd0;
	if ((sobel_filter_state_enable_0 & sobel_filter_entry_NotCondition)) begin
		sobel_filter_line_buffer_prev_row_a0_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_write_data_b = 'dx;
	if ((sobel_filter_valid_bit_0 & sobel_filter_entry_NotCondition)) begin
		sobel_filter_line_buffer_prev_row_a0_a0_write_data_b = sobel_filter_entry_15;
	end
end
assign sobel_filter_line_buffer_prev_row_a0_a0_read_en_b = 'd0;
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_clken = sobel_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_address_a = 'dx;
	if ((sobel_filter_state_enable_1 & sobel_filter_entry_NotCondition_reg_stage1)) begin
		sobel_filter_line_buffer_prev_row_a1_a0_address_a = (sobel_filter_entry_16_reg_stage1 >>> 1'd0);
	end
end
assign sobel_filter_line_buffer_prev_row_a1_a0_write_en_a = 'd0;
assign sobel_filter_line_buffer_prev_row_a1_a0_write_data_a = 'dx;
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_read_en_a = 'd0;
	if (sobel_filter_state_enable_1) begin
		sobel_filter_line_buffer_prev_row_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_address_b = 'dx;
	if ((sobel_filter_valid_bit_1 & sobel_filter_entry_NotCondition_reg_stage1)) begin
		sobel_filter_line_buffer_prev_row_a1_a0_address_b = (sobel_filter_entry_16_reg_stage1 >>> 1'd0);
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_write_en_b = 'd0;
	if ((sobel_filter_state_enable_1 & sobel_filter_entry_NotCondition_reg_stage1)) begin
		sobel_filter_line_buffer_prev_row_a1_a0_write_en_b = 1'd1;
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_write_data_b = 'dx;
	if ((sobel_filter_valid_bit_1 & sobel_filter_entry_NotCondition_reg_stage1)) begin
		sobel_filter_line_buffer_prev_row_a1_a0_write_data_b = sobel_filter_entry_19;
	end
end
assign sobel_filter_line_buffer_prev_row_a1_a0_read_en_b = 'd0;
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_count_inferred_reg <= 32'd0;
	end
	if ((sobel_filter_state_enable_0 & 1'd1)) begin
		sobel_filter_count_inferred_reg <= sobel_filter_entry_select38;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_i_inferred_reg <= 32'd0;
	end
	if ((sobel_filter_state_enable_0 & 1'd1)) begin
		sobel_filter_i_inferred_reg <= sobel_filter_entry_select30;
	end
end
always @(posedge clk) begin
	if (reset) begin
		sobel_filter_j_inferred_reg <= 32'd0;
	end
	if ((sobel_filter_state_enable_0 & 1'd1)) begin
		sobel_filter_j_inferred_reg <= sobel_filter_entry_select22;
	end
end
always @(posedge clk) begin
	if (~(sobel_filter_state_stall_0)) begin
		sobel_filter_valid_bit_0 <= (sobel_filter_II_counter & start);
	end
	if (reset) begin
		sobel_filter_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	sobel_filter_state_stall_0 = 1'd0;
	if (sobel_filter_state_stall_1) begin
		sobel_filter_state_stall_0 = 1'd1;
	end
	if (((sobel_filter_valid_bit_0 & sobel_filter_entry_NotCondition) & ~(canny_entry_output_fifo_gf_consumed_valid))) begin
		sobel_filter_state_stall_0 = 1'd1;
	end
	if (((sobel_filter_valid_bit_0 & sobel_filter_entry_exitMask_T1) & ~(switch_fifo_1_consumed_valid))) begin
		sobel_filter_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	sobel_filter_state_enable_0 = (sobel_filter_valid_bit_0 & ~(sobel_filter_state_stall_0));
end
always @(posedge clk) begin
	if (~(sobel_filter_state_stall_1)) begin
		sobel_filter_valid_bit_1 <= sobel_filter_state_enable_0;
	end
	if (reset) begin
		sobel_filter_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	sobel_filter_state_stall_1 = 1'd0;
	if (sobel_filter_state_stall_2) begin
		sobel_filter_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	sobel_filter_state_enable_1 = (sobel_filter_valid_bit_1 & ~(sobel_filter_state_stall_1));
end
always @(posedge clk) begin
	if (~(sobel_filter_state_stall_2)) begin
		sobel_filter_valid_bit_2 <= sobel_filter_state_enable_1;
	end
	if (reset) begin
		sobel_filter_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	sobel_filter_state_stall_2 = 1'd0;
	if (sobel_filter_state_stall_3) begin
		sobel_filter_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	sobel_filter_state_enable_2 = (sobel_filter_valid_bit_2 & ~(sobel_filter_state_stall_2));
end
always @(posedge clk) begin
	if (~(sobel_filter_state_stall_3)) begin
		sobel_filter_valid_bit_3 <= sobel_filter_state_enable_2;
	end
	if (reset) begin
		sobel_filter_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	sobel_filter_state_stall_3 = 1'd0;
	if (((sobel_filter_valid_bit_3 & ~(output_fifo_ready)) & sobel_filter_entry_exitMask_F9_reg_stage3)) begin
		sobel_filter_state_stall_3 = 1'd1;
	end
	if (((sobel_filter_valid_bit_3 & ~(output_fifo_ready)) & sobel_filter_entry_exitMask_T12_reg_stage3)) begin
		sobel_filter_state_stall_3 = 1'd1;
	end
	if (((sobel_filter_valid_bit_3 & ~(output_fifo_ready)) & sobel_filter_entry_exitMask_F14_reg_stage3)) begin
		sobel_filter_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	sobel_filter_state_enable_3 = (sobel_filter_valid_bit_3 & ~(sobel_filter_state_stall_3));
end
always @(posedge clk) begin
	sobel_filter_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_14_reg_stage1 <= sobel_filter_entry_14;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_14_reg_stage2 <= sobel_filter_entry_14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_NotCondition_reg_stage1 <= sobel_filter_entry_NotCondition;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_16_reg_stage1 <= sobel_filter_entry_16;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_exitMask_F3_reg_stage1 <= sobel_filter_entry_exitMask_F3;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_exitMask_F3_reg_stage2 <= sobel_filter_entry_exitMask_F3_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_exitMask_F9_reg_stage1 <= sobel_filter_entry_exitMask_F9;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_exitMask_F9_reg_stage2 <= sobel_filter_entry_exitMask_F9_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_exitMask_F9_reg_stage3 <= sobel_filter_entry_exitMask_F9_reg_stage2;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_bit_concat23_reg_stage2 <= sobel_filter_entry_bit_concat23;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_bit_concat23_reg_stage3 <= sobel_filter_entry_bit_concat23_reg_stage2;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_exitMask_T12_reg_stage1 <= sobel_filter_entry_exitMask_T12;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_exitMask_T12_reg_stage2 <= sobel_filter_entry_exitMask_T12_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_exitMask_T12_reg_stage3 <= sobel_filter_entry_exitMask_T12_reg_stage2;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_exitMask_F14_reg_stage1 <= sobel_filter_entry_exitMask_F14;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_exitMask_F14_reg_stage2 <= sobel_filter_entry_exitMask_F14_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_exitMask_F14_reg_stage3 <= sobel_filter_entry_exitMask_F14_reg_stage2;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_bit_concat17_reg_stage1 <= sobel_filter_entry_bit_concat17;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_bit_concat17_reg_stage2 <= sobel_filter_entry_bit_concat17_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_bit_concat16_reg_stage1 <= sobel_filter_entry_bit_concat16;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_bit_concat16_reg_stage2 <= sobel_filter_entry_bit_concat16_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_bit_concat15_reg_stage1 <= sobel_filter_entry_bit_concat15;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_bit_concat15_reg_stage2 <= sobel_filter_entry_bit_concat15_reg_stage1;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_bit_concat14_reg_stage2 <= sobel_filter_entry_bit_concat14;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_add59_reg_stage3 <= sobel_filter_entry_add59;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_bit_concat8_reg_stage3 <= sobel_filter_entry_bit_concat8;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_bit_concat7_reg_stage3 <= sobel_filter_entry_bit_concat7;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_bit_concat5_reg_stage3 <= sobel_filter_entry_bit_concat5;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_2) begin
		sobel_filter_entry_bit_concat2_reg_stage3 <= sobel_filter_entry_bit_concat2;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_0) begin
		sobel_filter_entry_ORexitM121_reg_stage1 <= sobel_filter_entry_ORexitM121;
	end
end
always @(posedge clk) begin
	if (sobel_filter_state_enable_1) begin
		sobel_filter_entry_ORexitM121_reg_stage2 <= sobel_filter_entry_ORexitM121_reg_stage1;
	end
end
always @(*) begin
	canny_entry_output_fifo_gf_consumed_valid = input_fifo_valid;
end
always @(*) begin
	canny_entry_output_fifo_gf_consumed_data = input_fifo;
end
always @(*) begin
	canny_entry_output_fifo_gf_consumed_taken = 1'd0;
	if ((sobel_filter_valid_bit_0 & sobel_filter_entry_NotCondition)) begin
		canny_entry_output_fifo_gf_consumed_taken = ~(sobel_filter_state_stall_0);
	end
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_read_data_wire_a = sobel_filter_line_buffer_prev_row_a1_a0_read_data_a;
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a1_a0_clken_pipeline_cond = ~(sobel_filter_state_stall_2);
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_read_data_wire_a = sobel_filter_line_buffer_prev_row_a0_a0_read_data_a;
end
always @(*) begin
	sobel_filter_line_buffer_prev_row_a0_a0_clken_pipeline_cond = ~(sobel_filter_state_stall_1);
end
assign sobel_filter_entry_bit_concat26_bit_select_operand_0 = 31'd0;
assign sobel_filter_entry_bit_concat25_bit_select_operand_0 = 31'd0;
assign sobel_filter_entry_bit_concat24_bit_select_operand_0 = 31'd0;
always @(posedge clk) begin
	if (switch_fifo_1_consumed_taken) begin
		switch_fifo_1_consumed_valid <= 1'd0;
	end
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_1_consumed_valid <= 1'd1;
	end
	if (reset) begin
		switch_fifo_1_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((switch_fifo_ready & switch_fifo_valid)) begin
		switch_fifo_1_consumed_data <= switch_fifo;
	end
	if (reset) begin
		switch_fifo_1_consumed_data <= 1'd0;
	end
end
always @(*) begin
	switch_fifo_1_consumed_taken = 1'd0;
	if ((sobel_filter_valid_bit_0 & sobel_filter_entry_exitMask_T1)) begin
		switch_fifo_1_consumed_taken = ~(sobel_filter_state_stall_0);
	end
end
assign sobel_filter_entry_bit_concat23_bit_select_operand_0 = 8'd0;
assign sobel_filter_entry_bit_concat22_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat21_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat20_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat19_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat18_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat17_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat16_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat15_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat14_bit_select_operand_2 = 1'd0;
assign sobel_filter_entry_bit_concat12_bit_select_operand_2 = 1'd0;
assign sobel_filter_entry_cmp60_op1_temp = 32'd255;
assign sobel_filter_entry_bit_concat8_bit_select_operand_0 = 31'd0;
assign sobel_filter_entry_bit_concat7_bit_select_operand_0 = 30'd0;
assign sobel_filter_entry_bit_concat7_bit_select_operand_4 = 1'd0;
assign sobel_filter_entry_bit_concat5_bit_select_operand_0 = 31'd0;
assign sobel_filter_entry_bit_concat4_bit_select_operand_2 = 8'd0;
assign sobel_filter_entry_bit_concat2_bit_select_operand_0 = 24'd0;
assign sobel_filter_entry_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = ~(sobel_filter_state_stall_0);
end
always @(posedge clk) begin
	finish <= sobel_filter_state_enable_3;
end
always @(*) begin
	input_fifo_ready = canny_entry_output_fifo_gf_consumed_taken;
end
always @(*) begin
	switch_fifo_ready = (~(switch_fifo_1_consumed_valid) | switch_fifo_1_consumed_taken);
	if (reset) begin
		switch_fifo_ready = 1'd0;
	end
end
always @(*) begin
	if ((sobel_filter_valid_bit_3 & sobel_filter_entry_exitMask_F9_reg_stage3)) begin
		output_fifo = sobel_filter_entry_bit_concat23_reg_stage3;
	end
	else if ((sobel_filter_valid_bit_3 & sobel_filter_entry_exitMask_T12_reg_stage3)) begin
		output_fifo = sobel_filter_entry_bit_select;
	end
	else /* if ((sobel_filter_valid_bit_3 & sobel_filter_entry_exitMask_F14_reg_stage3)) */ begin
		output_fifo = 16'd0;
	end
end
always @(*) begin
	output_fifo_valid = 1'd0;
	if ((sobel_filter_state_enable_3 & sobel_filter_entry_exitMask_F9_reg_stage3)) begin
		output_fifo_valid = 1'd1;
	end
	if ((sobel_filter_state_enable_3 & sobel_filter_entry_exitMask_T12_reg_stage3)) begin
		output_fifo_valid = 1'd1;
	end
	if ((sobel_filter_state_enable_3 & sobel_filter_entry_exitMask_F14_reg_stage3)) begin
		output_fifo_valid = 1'd1;
	end
end

endmodule
