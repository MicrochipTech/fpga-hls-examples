// ----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 2021.1
// Copyright (c) 2015-2021 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: legup@microchip.com
// Date: Thu Apr 15 20:40:34 2021
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEM_INIT_DIR "../simulation/"
/* synthesis translate_off */
// For Microsemi, the simulation directory is different from
// the synthesis directory for memory initialization files.
`undef MEM_INIT_DIR
`define MEM_INIT_DIR "../mem_init/"
/* synthesis translate_on */

`timescale 1 ns / 1 ns
module ClassifierPipeline_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	classifier_input_valid_write_en,
	classifier_input_valid_write_data,
	classifier_input_valid_read_data,
	classifier_input_clken,
	classifier_input_read_en_a,
	classifier_input_address_a,
	classifier_input_read_data_a,
	classifier_input_read_en_b,
	classifier_input_address_b,
	classifier_input_read_data_b,
	classifier_output,
	classifier_output_ready,
	classifier_output_valid
);

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  classifier_input_valid_write_en;
output reg [7:0] classifier_input_valid_write_data;
input [7:0] classifier_input_valid_read_data;
output reg  classifier_input_clken;
output reg  classifier_input_read_en_a;
output reg [9:0] classifier_input_address_a;
input [15:0] classifier_input_read_data_a;
output reg  classifier_input_read_en_b;
output reg [9:0] classifier_input_address_b;
input [15:0] classifier_input_read_data_b;
output reg [3:0] classifier_output;
input  classifier_output_ready;
output reg  classifier_output_valid;
reg  ClassifierPipeline_inst_clk;
reg  ClassifierPipeline_inst_reset;
reg  ClassifierPipeline_inst_start;
wire  ClassifierPipeline_inst_ready;
wire  ClassifierPipeline_inst_finish;
wire  ClassifierPipeline_inst_Conv_start;
wire  ClassifierPipeline_inst_Conv_ready;
wire [15:0] ClassifierPipeline_inst_Conv_threadID;
wire  ClassifierPipeline_inst_Maxpool_start;
wire  ClassifierPipeline_inst_Maxpool_ready;
wire [15:0] ClassifierPipeline_inst_Maxpool_threadID;
wire  ClassifierPipeline_inst_Conv_overloaded_1_start;
wire  ClassifierPipeline_inst_Conv_overloaded_1_ready;
wire [15:0] ClassifierPipeline_inst_Conv_overloaded_1_threadID;
wire  ClassifierPipeline_inst_Conv_overloaded_2_start;
wire  ClassifierPipeline_inst_Conv_overloaded_2_ready;
wire [15:0] ClassifierPipeline_inst_Conv_overloaded_2_threadID;
wire  ClassifierPipeline_inst_Conv_overloaded_3_start;
wire  ClassifierPipeline_inst_Conv_overloaded_3_ready;
wire [15:0] ClassifierPipeline_inst_Conv_overloaded_3_threadID;
wire  ClassifierPipeline_inst_FC_start;
wire  ClassifierPipeline_inst_FC_ready;
wire [15:0] ClassifierPipeline_inst_FC_threadID;
wire  ClassifierPipeline_inst_MaxComp_start;
wire  ClassifierPipeline_inst_MaxComp_ready;
wire [15:0] ClassifierPipeline_inst_MaxComp_threadID;
reg  ClassifierPipeline_inst_finish_reg;
reg  Conv_inst_clk;
reg  Conv_inst_reset;
reg  Conv_inst_start;
wire  Conv_inst_ready;
wire  Conv_inst_finish;
wire  Conv_inst_classifier_input_valid_write_en;
wire [7:0] Conv_inst_classifier_input_valid_write_data;
reg [7:0] Conv_inst_classifier_input_valid_read_data;
wire  Conv_inst_conv1_output_valid_write_en;
wire [7:0] Conv_inst_conv1_output_valid_write_data;
reg [7:0] Conv_inst_conv1_output_valid_read_data;
wire  Conv_inst_conv1_output_a0_a0_a0_clken;
wire  Conv_inst_conv1_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_inst_conv1_output_a0_a0_a0_write_data_a;
wire  Conv_inst_conv1_output_a0_a0_a0_read_en_a;
wire [9:0] Conv_inst_conv1_output_a0_a0_a0_address_a;
reg [15:0] Conv_inst_conv1_output_a0_a0_a0_read_data_a;
wire  Conv_inst_conv1_output_a0_a0_a1_clken;
wire  Conv_inst_conv1_output_a0_a0_a1_write_en_a;
wire [15:0] Conv_inst_conv1_output_a0_a0_a1_write_data_a;
wire  Conv_inst_conv1_output_a0_a0_a1_read_en_a;
wire [9:0] Conv_inst_conv1_output_a0_a0_a1_address_a;
reg [15:0] Conv_inst_conv1_output_a0_a0_a1_read_data_a;
wire  Conv_inst_classifier_input_clken;
wire  Conv_inst_classifier_input_read_en_a;
wire [9:0] Conv_inst_classifier_input_address_a;
reg [15:0] Conv_inst_classifier_input_read_data_a;
wire  Conv_inst_classifier_input_read_en_b;
wire [9:0] Conv_inst_classifier_input_address_b;
reg [15:0] Conv_inst_classifier_input_read_data_b;
reg  Conv_inst_finish_reg;
reg  conv1_output_valid_inst_clk;
reg  conv1_output_valid_inst_reset;
reg  conv1_output_valid_inst_write_en;
wire [7:0] conv1_output_valid_inst_read_data;
reg [7:0] conv1_output_valid_inst_write_data;
reg  conv1_output_a0_a0_a0_inst_clk;
reg  conv1_output_a0_a0_a0_inst_reset;
reg  conv1_output_a0_a0_a0_inst_clken;
reg [9:0] conv1_output_a0_a0_a0_inst_address_a;
reg  conv1_output_a0_a0_a0_inst_write_en_a;
reg [15:0] conv1_output_a0_a0_a0_inst_write_data_a;
wire [15:0] conv1_output_a0_a0_a0_inst_read_data_a;
reg  conv1_output_a0_a0_a0_inst_read_en_a;
reg  conv1_output_a0_a0_a1_inst_clk;
reg  conv1_output_a0_a0_a1_inst_reset;
reg  conv1_output_a0_a0_a1_inst_clken;
reg [9:0] conv1_output_a0_a0_a1_inst_address_a;
reg  conv1_output_a0_a0_a1_inst_write_en_a;
reg [15:0] conv1_output_a0_a0_a1_inst_write_data_a;
wire [15:0] conv1_output_a0_a0_a1_inst_read_data_a;
reg  conv1_output_a0_a0_a1_inst_read_en_a;
reg  Maxpool_inst_clk;
reg  Maxpool_inst_reset;
reg  Maxpool_inst_start;
wire  Maxpool_inst_ready;
wire  Maxpool_inst_finish;
wire  Maxpool_inst_conv1_output_valid_write_en;
wire [7:0] Maxpool_inst_conv1_output_valid_write_data;
reg [7:0] Maxpool_inst_conv1_output_valid_read_data;
wire  Maxpool_inst_maxpool_output_valid_write_en;
wire [7:0] Maxpool_inst_maxpool_output_valid_write_data;
reg [7:0] Maxpool_inst_maxpool_output_valid_read_data;
wire  Maxpool_inst_maxpool_output_a0_a0_a0_clken;
wire  Maxpool_inst_maxpool_output_a0_a0_a0_write_en_a;
wire [15:0] Maxpool_inst_maxpool_output_a0_a0_a0_write_data_a;
wire  Maxpool_inst_maxpool_output_a0_a0_a0_read_en_a;
wire [7:0] Maxpool_inst_maxpool_output_a0_a0_a0_address_a;
reg [15:0] Maxpool_inst_maxpool_output_a0_a0_a0_read_data_a;
wire  Maxpool_inst_maxpool_output_a0_a0_a1_clken;
wire  Maxpool_inst_maxpool_output_a0_a0_a1_write_en_a;
wire [15:0] Maxpool_inst_maxpool_output_a0_a0_a1_write_data_a;
wire  Maxpool_inst_maxpool_output_a0_a0_a1_read_en_a;
wire [7:0] Maxpool_inst_maxpool_output_a0_a0_a1_address_a;
reg [15:0] Maxpool_inst_maxpool_output_a0_a0_a1_read_data_a;
wire  Maxpool_inst_conv1_output_a0_a0_a0_clken;
wire  Maxpool_inst_conv1_output_a0_a0_a0_write_en_a;
wire [15:0] Maxpool_inst_conv1_output_a0_a0_a0_write_data_a;
wire  Maxpool_inst_conv1_output_a0_a0_a0_read_en_a;
wire [9:0] Maxpool_inst_conv1_output_a0_a0_a0_address_a;
reg [15:0] Maxpool_inst_conv1_output_a0_a0_a0_read_data_a;
wire  Maxpool_inst_conv1_output_a0_a0_a1_clken;
wire  Maxpool_inst_conv1_output_a0_a0_a1_write_en_a;
wire [15:0] Maxpool_inst_conv1_output_a0_a0_a1_write_data_a;
wire  Maxpool_inst_conv1_output_a0_a0_a1_read_en_a;
wire [9:0] Maxpool_inst_conv1_output_a0_a0_a1_address_a;
reg [15:0] Maxpool_inst_conv1_output_a0_a0_a1_read_data_a;
reg  Maxpool_inst_finish_reg;
reg  maxpool_output_valid_inst_clk;
reg  maxpool_output_valid_inst_reset;
reg  maxpool_output_valid_inst_write_en;
wire [7:0] maxpool_output_valid_inst_read_data;
reg [7:0] maxpool_output_valid_inst_write_data;
reg  maxpool_output_a0_a0_a0_inst_clk;
reg  maxpool_output_a0_a0_a0_inst_reset;
reg  maxpool_output_a0_a0_a0_inst_clken;
reg [7:0] maxpool_output_a0_a0_a0_inst_address_a;
reg  maxpool_output_a0_a0_a0_inst_write_en_a;
reg [15:0] maxpool_output_a0_a0_a0_inst_write_data_a;
wire [15:0] maxpool_output_a0_a0_a0_inst_read_data_a;
reg  maxpool_output_a0_a0_a0_inst_read_en_a;
reg  maxpool_output_a0_a0_a1_inst_clk;
reg  maxpool_output_a0_a0_a1_inst_reset;
reg  maxpool_output_a0_a0_a1_inst_clken;
reg [7:0] maxpool_output_a0_a0_a1_inst_address_a;
reg  maxpool_output_a0_a0_a1_inst_write_en_a;
reg [15:0] maxpool_output_a0_a0_a1_inst_write_data_a;
wire [15:0] maxpool_output_a0_a0_a1_inst_read_data_a;
reg  maxpool_output_a0_a0_a1_inst_read_en_a;
reg  Conv_overloaded_1_inst_clk;
reg  Conv_overloaded_1_inst_reset;
reg  Conv_overloaded_1_inst_start;
wire  Conv_overloaded_1_inst_ready;
wire  Conv_overloaded_1_inst_finish;
wire  Conv_overloaded_1_inst_maxpool_output_valid_write_en;
wire [7:0] Conv_overloaded_1_inst_maxpool_output_valid_write_data;
reg [7:0] Conv_overloaded_1_inst_maxpool_output_valid_read_data;
wire  Conv_overloaded_1_inst_conv2_output_valid_write_en;
wire [7:0] Conv_overloaded_1_inst_conv2_output_valid_write_data;
reg [7:0] Conv_overloaded_1_inst_conv2_output_valid_read_data;
wire  Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_clken;
wire  Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_write_data_a;
wire  Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_read_en_a;
wire [7:0] Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_address_a;
reg [15:0] Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_read_data_a;
wire  Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_clken;
wire  Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_write_en_a;
wire [15:0] Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_write_data_a;
wire  Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_read_en_a;
wire [7:0] Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_address_a;
reg [15:0] Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_read_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a0_clken;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a0_write_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a0_read_en_a;
wire [6:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a0_address_a;
reg [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a0_read_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a1_clken;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a1_write_en_a;
wire [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a1_write_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a1_read_en_a;
wire [6:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a1_address_a;
reg [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a1_read_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a2_clken;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a2_write_en_a;
wire [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a2_write_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a2_read_en_a;
wire [6:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a2_address_a;
reg [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a2_read_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a3_clken;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a3_write_en_a;
wire [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a3_write_data_a;
wire  Conv_overloaded_1_inst_conv2_output_a0_a0_a3_read_en_a;
wire [6:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a3_address_a;
reg [15:0] Conv_overloaded_1_inst_conv2_output_a0_a0_a3_read_data_a;
reg  Conv_overloaded_1_inst_finish_reg;
reg  conv2_output_valid_inst_clk;
reg  conv2_output_valid_inst_reset;
reg  conv2_output_valid_inst_write_en;
wire [7:0] conv2_output_valid_inst_read_data;
reg [7:0] conv2_output_valid_inst_write_data;
reg  conv2_output_a0_a0_a0_inst_clk;
reg  conv2_output_a0_a0_a0_inst_reset;
reg  conv2_output_a0_a0_a0_inst_clken;
reg [6:0] conv2_output_a0_a0_a0_inst_address_a;
reg  conv2_output_a0_a0_a0_inst_write_en_a;
reg [15:0] conv2_output_a0_a0_a0_inst_write_data_a;
wire [15:0] conv2_output_a0_a0_a0_inst_read_data_a;
reg  conv2_output_a0_a0_a0_inst_read_en_a;
reg  conv2_output_a0_a0_a1_inst_clk;
reg  conv2_output_a0_a0_a1_inst_reset;
reg  conv2_output_a0_a0_a1_inst_clken;
reg [6:0] conv2_output_a0_a0_a1_inst_address_a;
reg  conv2_output_a0_a0_a1_inst_write_en_a;
reg [15:0] conv2_output_a0_a0_a1_inst_write_data_a;
wire [15:0] conv2_output_a0_a0_a1_inst_read_data_a;
reg  conv2_output_a0_a0_a1_inst_read_en_a;
reg  conv2_output_a0_a0_a2_inst_clk;
reg  conv2_output_a0_a0_a2_inst_reset;
reg  conv2_output_a0_a0_a2_inst_clken;
reg [6:0] conv2_output_a0_a0_a2_inst_address_a;
reg  conv2_output_a0_a0_a2_inst_write_en_a;
reg [15:0] conv2_output_a0_a0_a2_inst_write_data_a;
wire [15:0] conv2_output_a0_a0_a2_inst_read_data_a;
reg  conv2_output_a0_a0_a2_inst_read_en_a;
reg  conv2_output_a0_a0_a3_inst_clk;
reg  conv2_output_a0_a0_a3_inst_reset;
reg  conv2_output_a0_a0_a3_inst_clken;
reg [6:0] conv2_output_a0_a0_a3_inst_address_a;
reg  conv2_output_a0_a0_a3_inst_write_en_a;
reg [15:0] conv2_output_a0_a0_a3_inst_write_data_a;
wire [15:0] conv2_output_a0_a0_a3_inst_read_data_a;
reg  conv2_output_a0_a0_a3_inst_read_en_a;
reg  Conv_overloaded_2_inst_clk;
reg  Conv_overloaded_2_inst_reset;
reg  Conv_overloaded_2_inst_start;
wire  Conv_overloaded_2_inst_ready;
wire  Conv_overloaded_2_inst_finish;
wire  Conv_overloaded_2_inst_conv2_output_valid_write_en;
wire [7:0] Conv_overloaded_2_inst_conv2_output_valid_write_data;
reg [7:0] Conv_overloaded_2_inst_conv2_output_valid_read_data;
wire  Conv_overloaded_2_inst_conv3_output_valid_write_en;
wire [7:0] Conv_overloaded_2_inst_conv3_output_valid_write_data;
reg [7:0] Conv_overloaded_2_inst_conv3_output_valid_read_data;
wire  Conv_overloaded_2_inst_conv3_output_a0_a0_a0_clken;
wire  Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_data_a;
wire  Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_en_a;
wire [8:0] Conv_overloaded_2_inst_conv3_output_a0_a0_a0_address_a;
reg [15:0] Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_data_a;
wire  Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_en_b;
wire [15:0] Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_data_b;
wire  Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_en_b;
wire [8:0] Conv_overloaded_2_inst_conv3_output_a0_a0_a0_address_b;
reg [15:0] Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_data_b;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a0_clken;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a0_write_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a0_read_en_a;
wire [6:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a0_address_a;
reg [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a0_read_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a1_clken;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a1_write_en_a;
wire [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a1_write_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a1_read_en_a;
wire [6:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a1_address_a;
reg [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a1_read_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a2_clken;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a2_write_en_a;
wire [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a2_write_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a2_read_en_a;
wire [6:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a2_address_a;
reg [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a2_read_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a3_clken;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a3_write_en_a;
wire [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a3_write_data_a;
wire  Conv_overloaded_2_inst_conv2_output_a0_a0_a3_read_en_a;
wire [6:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a3_address_a;
reg [15:0] Conv_overloaded_2_inst_conv2_output_a0_a0_a3_read_data_a;
reg  Conv_overloaded_2_inst_finish_reg;
reg  conv3_output_valid_inst_clk;
reg  conv3_output_valid_inst_reset;
reg  conv3_output_valid_inst_write_en;
wire [7:0] conv3_output_valid_inst_read_data;
reg [7:0] conv3_output_valid_inst_write_data;
reg  conv3_output_a0_a0_a0_inst_clk;
reg  conv3_output_a0_a0_a0_inst_reset;
reg  conv3_output_a0_a0_a0_inst_clken;
reg [8:0] conv3_output_a0_a0_a0_inst_address_a;
reg  conv3_output_a0_a0_a0_inst_write_en_a;
reg [15:0] conv3_output_a0_a0_a0_inst_write_data_a;
wire [15:0] conv3_output_a0_a0_a0_inst_read_data_a;
reg  conv3_output_a0_a0_a0_inst_read_en_a;
reg [8:0] conv3_output_a0_a0_a0_inst_address_b;
reg  conv3_output_a0_a0_a0_inst_write_en_b;
reg [15:0] conv3_output_a0_a0_a0_inst_write_data_b;
wire [15:0] conv3_output_a0_a0_a0_inst_read_data_b;
reg  conv3_output_a0_a0_a0_inst_read_en_b;
reg  Conv_overloaded_3_inst_clk;
reg  Conv_overloaded_3_inst_reset;
reg  Conv_overloaded_3_inst_start;
wire  Conv_overloaded_3_inst_ready;
wire  Conv_overloaded_3_inst_finish;
wire  Conv_overloaded_3_inst_conv3_output_valid_write_en;
wire [7:0] Conv_overloaded_3_inst_conv3_output_valid_write_data;
reg [7:0] Conv_overloaded_3_inst_conv3_output_valid_read_data;
wire  Conv_overloaded_3_inst_conv4_output_valid_write_en;
wire [7:0] Conv_overloaded_3_inst_conv4_output_valid_write_data;
reg [7:0] Conv_overloaded_3_inst_conv4_output_valid_read_data;
wire  Conv_overloaded_3_inst_conv4_output_a0_a0_a0_clken;
wire  Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_data_a;
wire  Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_en_a;
wire [6:0] Conv_overloaded_3_inst_conv4_output_a0_a0_a0_address_a;
reg [15:0] Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_data_a;
wire  Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_en_b;
wire [15:0] Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_data_b;
wire  Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_en_b;
wire [6:0] Conv_overloaded_3_inst_conv4_output_a0_a0_a0_address_b;
reg [15:0] Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_data_b;
wire  Conv_overloaded_3_inst_conv3_output_a0_a0_a0_clken;
wire  Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_en_a;
wire [15:0] Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_data_a;
wire  Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_en_a;
wire [8:0] Conv_overloaded_3_inst_conv3_output_a0_a0_a0_address_a;
reg [15:0] Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_data_a;
wire  Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_en_b;
wire [15:0] Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_data_b;
wire  Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_en_b;
wire [8:0] Conv_overloaded_3_inst_conv3_output_a0_a0_a0_address_b;
reg [15:0] Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_data_b;
reg  Conv_overloaded_3_inst_finish_reg;
reg  conv4_output_valid_inst_clk;
reg  conv4_output_valid_inst_reset;
reg  conv4_output_valid_inst_write_en;
wire [7:0] conv4_output_valid_inst_read_data;
reg [7:0] conv4_output_valid_inst_write_data;
reg  conv4_output_a0_a0_a0_inst_clk;
reg  conv4_output_a0_a0_a0_inst_reset;
reg  conv4_output_a0_a0_a0_inst_clken;
reg [6:0] conv4_output_a0_a0_a0_inst_address_a;
reg  conv4_output_a0_a0_a0_inst_write_en_a;
reg [15:0] conv4_output_a0_a0_a0_inst_write_data_a;
wire [15:0] conv4_output_a0_a0_a0_inst_read_data_a;
reg  conv4_output_a0_a0_a0_inst_read_en_a;
reg [6:0] conv4_output_a0_a0_a0_inst_address_b;
reg  conv4_output_a0_a0_a0_inst_write_en_b;
reg [15:0] conv4_output_a0_a0_a0_inst_write_data_b;
wire [15:0] conv4_output_a0_a0_a0_inst_read_data_b;
reg  conv4_output_a0_a0_a0_inst_read_en_b;
reg  FC_inst_clk;
reg  FC_inst_reset;
reg  FC_inst_start;
wire  FC_inst_ready;
wire  FC_inst_finish;
wire  FC_inst_conv4_output_valid_write_en;
wire [7:0] FC_inst_conv4_output_valid_write_data;
reg [7:0] FC_inst_conv4_output_valid_read_data;
wire  FC_inst_fc_output_valid_write_en;
wire [7:0] FC_inst_fc_output_valid_write_data;
reg [7:0] FC_inst_fc_output_valid_read_data;
wire  FC_inst_conv4_output_a0_a0_a0_clken;
wire  FC_inst_conv4_output_a0_a0_a0_write_en_a;
wire [15:0] FC_inst_conv4_output_a0_a0_a0_write_data_a;
wire  FC_inst_conv4_output_a0_a0_a0_read_en_a;
wire [6:0] FC_inst_conv4_output_a0_a0_a0_address_a;
reg [15:0] FC_inst_conv4_output_a0_a0_a0_read_data_a;
wire  FC_inst_conv4_output_a0_a0_a0_write_en_b;
wire [15:0] FC_inst_conv4_output_a0_a0_a0_write_data_b;
wire  FC_inst_conv4_output_a0_a0_a0_read_en_b;
wire [6:0] FC_inst_conv4_output_a0_a0_a0_address_b;
reg [15:0] FC_inst_conv4_output_a0_a0_a0_read_data_b;
wire  FC_inst_fc_output_clken;
wire  FC_inst_fc_output_write_en_a;
wire [15:0] FC_inst_fc_output_write_data_a;
wire  FC_inst_fc_output_read_en_a;
wire [3:0] FC_inst_fc_output_address_a;
reg [15:0] FC_inst_fc_output_read_data_a;
reg  FC_inst_finish_reg;
reg  fc_output_valid_inst_clk;
reg  fc_output_valid_inst_reset;
reg  fc_output_valid_inst_write_en;
wire [7:0] fc_output_valid_inst_read_data;
reg [7:0] fc_output_valid_inst_write_data;
reg  fc_output_inst_clk;
reg  fc_output_inst_reset;
reg  fc_output_inst_clken;
reg [3:0] fc_output_inst_address_a;
reg  fc_output_inst_write_en_a;
reg [15:0] fc_output_inst_write_data_a;
wire [15:0] fc_output_inst_read_data_a;
reg  fc_output_inst_read_en_a;
reg  MaxComp_inst_clk;
reg  MaxComp_inst_reset;
reg  MaxComp_inst_start;
wire  MaxComp_inst_ready;
wire  MaxComp_inst_finish;
wire  MaxComp_inst_fc_output_valid_write_en;
wire [7:0] MaxComp_inst_fc_output_valid_write_data;
reg [7:0] MaxComp_inst_fc_output_valid_read_data;
wire  MaxComp_inst_fc_output_clken;
wire  MaxComp_inst_fc_output_write_en_a;
wire [15:0] MaxComp_inst_fc_output_write_data_a;
wire  MaxComp_inst_fc_output_read_en_a;
wire [3:0] MaxComp_inst_fc_output_address_a;
reg [15:0] MaxComp_inst_fc_output_read_data_a;
wire [3:0] MaxComp_inst_output_digit;
reg  MaxComp_inst_output_digit_ready;
wire  MaxComp_inst_output_digit_valid;
reg  MaxComp_inst_finish_reg;


ClassifierPipeline ClassifierPipeline_inst (
	.clk (ClassifierPipeline_inst_clk),
	.reset (ClassifierPipeline_inst_reset),
	.start (ClassifierPipeline_inst_start),
	.ready (ClassifierPipeline_inst_ready),
	.finish (ClassifierPipeline_inst_finish),
	.Conv_start (ClassifierPipeline_inst_Conv_start),
	.Conv_ready (ClassifierPipeline_inst_Conv_ready),
	.Conv_threadID (ClassifierPipeline_inst_Conv_threadID),
	.Maxpool_start (ClassifierPipeline_inst_Maxpool_start),
	.Maxpool_ready (ClassifierPipeline_inst_Maxpool_ready),
	.Maxpool_threadID (ClassifierPipeline_inst_Maxpool_threadID),
	.Conv_overloaded_1_start (ClassifierPipeline_inst_Conv_overloaded_1_start),
	.Conv_overloaded_1_ready (ClassifierPipeline_inst_Conv_overloaded_1_ready),
	.Conv_overloaded_1_threadID (ClassifierPipeline_inst_Conv_overloaded_1_threadID),
	.Conv_overloaded_2_start (ClassifierPipeline_inst_Conv_overloaded_2_start),
	.Conv_overloaded_2_ready (ClassifierPipeline_inst_Conv_overloaded_2_ready),
	.Conv_overloaded_2_threadID (ClassifierPipeline_inst_Conv_overloaded_2_threadID),
	.Conv_overloaded_3_start (ClassifierPipeline_inst_Conv_overloaded_3_start),
	.Conv_overloaded_3_ready (ClassifierPipeline_inst_Conv_overloaded_3_ready),
	.Conv_overloaded_3_threadID (ClassifierPipeline_inst_Conv_overloaded_3_threadID),
	.FC_start (ClassifierPipeline_inst_FC_start),
	.FC_ready (ClassifierPipeline_inst_FC_ready),
	.FC_threadID (ClassifierPipeline_inst_FC_threadID),
	.MaxComp_start (ClassifierPipeline_inst_MaxComp_start),
	.MaxComp_ready (ClassifierPipeline_inst_MaxComp_ready),
	.MaxComp_threadID (ClassifierPipeline_inst_MaxComp_threadID)
);



Conv Conv_inst (
	.clk (Conv_inst_clk),
	.reset (Conv_inst_reset),
	.start (Conv_inst_start),
	.ready (Conv_inst_ready),
	.finish (Conv_inst_finish),
	.classifier_input_valid_write_en (Conv_inst_classifier_input_valid_write_en),
	.classifier_input_valid_write_data (Conv_inst_classifier_input_valid_write_data),
	.classifier_input_valid_read_data (Conv_inst_classifier_input_valid_read_data),
	.conv1_output_valid_write_en (Conv_inst_conv1_output_valid_write_en),
	.conv1_output_valid_write_data (Conv_inst_conv1_output_valid_write_data),
	.conv1_output_valid_read_data (Conv_inst_conv1_output_valid_read_data),
	.conv1_output_a0_a0_a0_clken (Conv_inst_conv1_output_a0_a0_a0_clken),
	.conv1_output_a0_a0_a0_write_en_a (Conv_inst_conv1_output_a0_a0_a0_write_en_a),
	.conv1_output_a0_a0_a0_write_data_a (Conv_inst_conv1_output_a0_a0_a0_write_data_a),
	.conv1_output_a0_a0_a0_read_en_a (Conv_inst_conv1_output_a0_a0_a0_read_en_a),
	.conv1_output_a0_a0_a0_address_a (Conv_inst_conv1_output_a0_a0_a0_address_a),
	.conv1_output_a0_a0_a0_read_data_a (Conv_inst_conv1_output_a0_a0_a0_read_data_a),
	.conv1_output_a0_a0_a1_clken (Conv_inst_conv1_output_a0_a0_a1_clken),
	.conv1_output_a0_a0_a1_write_en_a (Conv_inst_conv1_output_a0_a0_a1_write_en_a),
	.conv1_output_a0_a0_a1_write_data_a (Conv_inst_conv1_output_a0_a0_a1_write_data_a),
	.conv1_output_a0_a0_a1_read_en_a (Conv_inst_conv1_output_a0_a0_a1_read_en_a),
	.conv1_output_a0_a0_a1_address_a (Conv_inst_conv1_output_a0_a0_a1_address_a),
	.conv1_output_a0_a0_a1_read_data_a (Conv_inst_conv1_output_a0_a0_a1_read_data_a),
	.classifier_input_clken (Conv_inst_classifier_input_clken),
	.classifier_input_read_en_a (Conv_inst_classifier_input_read_en_a),
	.classifier_input_address_a (Conv_inst_classifier_input_address_a),
	.classifier_input_read_data_a (Conv_inst_classifier_input_read_data_a),
	.classifier_input_read_en_b (Conv_inst_classifier_input_read_en_b),
	.classifier_input_address_b (Conv_inst_classifier_input_address_b),
	.classifier_input_read_data_b (Conv_inst_classifier_input_read_data_b)
);



legup_register conv1_output_valid_inst (
	.clk (conv1_output_valid_inst_clk),
	.reset (conv1_output_valid_inst_reset),
	.write_en (conv1_output_valid_inst_write_en),
	.read_data (conv1_output_valid_inst_read_data),
	.write_data (conv1_output_valid_inst_write_data)
);

defparam
	conv1_output_valid_inst.width = 8,
	conv1_output_valid_inst.init_value = 8'd0;


ram_single_port conv1_output_a0_a0_a0_inst (
	.clk (conv1_output_a0_a0_a0_inst_clk),
	.reset (conv1_output_a0_a0_a0_inst_reset),
	.clken (conv1_output_a0_a0_a0_inst_clken),
	.address_a (conv1_output_a0_a0_a0_inst_address_a),
	.write_en_a (conv1_output_a0_a0_a0_inst_write_en_a),
	.write_data_a (conv1_output_a0_a0_a0_inst_write_data_a),
	.read_data_a (conv1_output_a0_a0_a0_inst_read_data_a),
	.read_en_a (conv1_output_a0_a0_a0_inst_read_en_a)
);

defparam
	conv1_output_a0_a0_a0_inst.width_a = 16,
	conv1_output_a0_a0_a0_inst.widthad_a = 10,
	conv1_output_a0_a0_a0_inst.numwords_a = 676,
	conv1_output_a0_a0_a0_inst.latency = 1,
	conv1_output_a0_a0_a0_inst.fpga_device = "PolarFire",
	conv1_output_a0_a0_a0_inst.init_file = {`MEM_INIT_DIR, "conv1_output_a0_a0_a0.mem"};


ram_single_port conv1_output_a0_a0_a1_inst (
	.clk (conv1_output_a0_a0_a1_inst_clk),
	.reset (conv1_output_a0_a0_a1_inst_reset),
	.clken (conv1_output_a0_a0_a1_inst_clken),
	.address_a (conv1_output_a0_a0_a1_inst_address_a),
	.write_en_a (conv1_output_a0_a0_a1_inst_write_en_a),
	.write_data_a (conv1_output_a0_a0_a1_inst_write_data_a),
	.read_data_a (conv1_output_a0_a0_a1_inst_read_data_a),
	.read_en_a (conv1_output_a0_a0_a1_inst_read_en_a)
);

defparam
	conv1_output_a0_a0_a1_inst.width_a = 16,
	conv1_output_a0_a0_a1_inst.widthad_a = 10,
	conv1_output_a0_a0_a1_inst.numwords_a = 676,
	conv1_output_a0_a0_a1_inst.latency = 1,
	conv1_output_a0_a0_a1_inst.fpga_device = "PolarFire",
	conv1_output_a0_a0_a1_inst.init_file = {`MEM_INIT_DIR, "conv1_output_a0_a0_a1.mem"};


Maxpool Maxpool_inst (
	.clk (Maxpool_inst_clk),
	.reset (Maxpool_inst_reset),
	.start (Maxpool_inst_start),
	.ready (Maxpool_inst_ready),
	.finish (Maxpool_inst_finish),
	.conv1_output_valid_write_en (Maxpool_inst_conv1_output_valid_write_en),
	.conv1_output_valid_write_data (Maxpool_inst_conv1_output_valid_write_data),
	.conv1_output_valid_read_data (Maxpool_inst_conv1_output_valid_read_data),
	.maxpool_output_valid_write_en (Maxpool_inst_maxpool_output_valid_write_en),
	.maxpool_output_valid_write_data (Maxpool_inst_maxpool_output_valid_write_data),
	.maxpool_output_valid_read_data (Maxpool_inst_maxpool_output_valid_read_data),
	.maxpool_output_a0_a0_a0_clken (Maxpool_inst_maxpool_output_a0_a0_a0_clken),
	.maxpool_output_a0_a0_a0_write_en_a (Maxpool_inst_maxpool_output_a0_a0_a0_write_en_a),
	.maxpool_output_a0_a0_a0_write_data_a (Maxpool_inst_maxpool_output_a0_a0_a0_write_data_a),
	.maxpool_output_a0_a0_a0_read_en_a (Maxpool_inst_maxpool_output_a0_a0_a0_read_en_a),
	.maxpool_output_a0_a0_a0_address_a (Maxpool_inst_maxpool_output_a0_a0_a0_address_a),
	.maxpool_output_a0_a0_a0_read_data_a (Maxpool_inst_maxpool_output_a0_a0_a0_read_data_a),
	.maxpool_output_a0_a0_a1_clken (Maxpool_inst_maxpool_output_a0_a0_a1_clken),
	.maxpool_output_a0_a0_a1_write_en_a (Maxpool_inst_maxpool_output_a0_a0_a1_write_en_a),
	.maxpool_output_a0_a0_a1_write_data_a (Maxpool_inst_maxpool_output_a0_a0_a1_write_data_a),
	.maxpool_output_a0_a0_a1_read_en_a (Maxpool_inst_maxpool_output_a0_a0_a1_read_en_a),
	.maxpool_output_a0_a0_a1_address_a (Maxpool_inst_maxpool_output_a0_a0_a1_address_a),
	.maxpool_output_a0_a0_a1_read_data_a (Maxpool_inst_maxpool_output_a0_a0_a1_read_data_a),
	.conv1_output_a0_a0_a0_clken (Maxpool_inst_conv1_output_a0_a0_a0_clken),
	.conv1_output_a0_a0_a0_write_en_a (Maxpool_inst_conv1_output_a0_a0_a0_write_en_a),
	.conv1_output_a0_a0_a0_write_data_a (Maxpool_inst_conv1_output_a0_a0_a0_write_data_a),
	.conv1_output_a0_a0_a0_read_en_a (Maxpool_inst_conv1_output_a0_a0_a0_read_en_a),
	.conv1_output_a0_a0_a0_address_a (Maxpool_inst_conv1_output_a0_a0_a0_address_a),
	.conv1_output_a0_a0_a0_read_data_a (Maxpool_inst_conv1_output_a0_a0_a0_read_data_a),
	.conv1_output_a0_a0_a1_clken (Maxpool_inst_conv1_output_a0_a0_a1_clken),
	.conv1_output_a0_a0_a1_write_en_a (Maxpool_inst_conv1_output_a0_a0_a1_write_en_a),
	.conv1_output_a0_a0_a1_write_data_a (Maxpool_inst_conv1_output_a0_a0_a1_write_data_a),
	.conv1_output_a0_a0_a1_read_en_a (Maxpool_inst_conv1_output_a0_a0_a1_read_en_a),
	.conv1_output_a0_a0_a1_address_a (Maxpool_inst_conv1_output_a0_a0_a1_address_a),
	.conv1_output_a0_a0_a1_read_data_a (Maxpool_inst_conv1_output_a0_a0_a1_read_data_a)
);



legup_register maxpool_output_valid_inst (
	.clk (maxpool_output_valid_inst_clk),
	.reset (maxpool_output_valid_inst_reset),
	.write_en (maxpool_output_valid_inst_write_en),
	.read_data (maxpool_output_valid_inst_read_data),
	.write_data (maxpool_output_valid_inst_write_data)
);

defparam
	maxpool_output_valid_inst.width = 8,
	maxpool_output_valid_inst.init_value = 8'd0;


ram_single_port maxpool_output_a0_a0_a0_inst (
	.clk (maxpool_output_a0_a0_a0_inst_clk),
	.reset (maxpool_output_a0_a0_a0_inst_reset),
	.clken (maxpool_output_a0_a0_a0_inst_clken),
	.address_a (maxpool_output_a0_a0_a0_inst_address_a),
	.write_en_a (maxpool_output_a0_a0_a0_inst_write_en_a),
	.write_data_a (maxpool_output_a0_a0_a0_inst_write_data_a),
	.read_data_a (maxpool_output_a0_a0_a0_inst_read_data_a),
	.read_en_a (maxpool_output_a0_a0_a0_inst_read_en_a)
);

defparam
	maxpool_output_a0_a0_a0_inst.width_a = 16,
	maxpool_output_a0_a0_a0_inst.widthad_a = 8,
	maxpool_output_a0_a0_a0_inst.numwords_a = 169,
	maxpool_output_a0_a0_a0_inst.latency = 1,
	maxpool_output_a0_a0_a0_inst.fpga_device = "PolarFire",
	maxpool_output_a0_a0_a0_inst.init_file = {`MEM_INIT_DIR, "maxpool_output_a0_a0_a0.mem"};


ram_single_port maxpool_output_a0_a0_a1_inst (
	.clk (maxpool_output_a0_a0_a1_inst_clk),
	.reset (maxpool_output_a0_a0_a1_inst_reset),
	.clken (maxpool_output_a0_a0_a1_inst_clken),
	.address_a (maxpool_output_a0_a0_a1_inst_address_a),
	.write_en_a (maxpool_output_a0_a0_a1_inst_write_en_a),
	.write_data_a (maxpool_output_a0_a0_a1_inst_write_data_a),
	.read_data_a (maxpool_output_a0_a0_a1_inst_read_data_a),
	.read_en_a (maxpool_output_a0_a0_a1_inst_read_en_a)
);

defparam
	maxpool_output_a0_a0_a1_inst.width_a = 16,
	maxpool_output_a0_a0_a1_inst.widthad_a = 8,
	maxpool_output_a0_a0_a1_inst.numwords_a = 169,
	maxpool_output_a0_a0_a1_inst.latency = 1,
	maxpool_output_a0_a0_a1_inst.fpga_device = "PolarFire",
	maxpool_output_a0_a0_a1_inst.init_file = {`MEM_INIT_DIR, "maxpool_output_a0_a0_a1.mem"};


Conv_overloaded_1 Conv_overloaded_1_inst (
	.clk (Conv_overloaded_1_inst_clk),
	.reset (Conv_overloaded_1_inst_reset),
	.start (Conv_overloaded_1_inst_start),
	.ready (Conv_overloaded_1_inst_ready),
	.finish (Conv_overloaded_1_inst_finish),
	.maxpool_output_valid_write_en (Conv_overloaded_1_inst_maxpool_output_valid_write_en),
	.maxpool_output_valid_write_data (Conv_overloaded_1_inst_maxpool_output_valid_write_data),
	.maxpool_output_valid_read_data (Conv_overloaded_1_inst_maxpool_output_valid_read_data),
	.conv2_output_valid_write_en (Conv_overloaded_1_inst_conv2_output_valid_write_en),
	.conv2_output_valid_write_data (Conv_overloaded_1_inst_conv2_output_valid_write_data),
	.conv2_output_valid_read_data (Conv_overloaded_1_inst_conv2_output_valid_read_data),
	.maxpool_output_a0_a0_a0_clken (Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_clken),
	.maxpool_output_a0_a0_a0_write_en_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_write_en_a),
	.maxpool_output_a0_a0_a0_write_data_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_write_data_a),
	.maxpool_output_a0_a0_a0_read_en_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_read_en_a),
	.maxpool_output_a0_a0_a0_address_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_address_a),
	.maxpool_output_a0_a0_a0_read_data_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_read_data_a),
	.maxpool_output_a0_a0_a1_clken (Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_clken),
	.maxpool_output_a0_a0_a1_write_en_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_write_en_a),
	.maxpool_output_a0_a0_a1_write_data_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_write_data_a),
	.maxpool_output_a0_a0_a1_read_en_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_read_en_a),
	.maxpool_output_a0_a0_a1_address_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_address_a),
	.maxpool_output_a0_a0_a1_read_data_a (Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_read_data_a),
	.conv2_output_a0_a0_a0_clken (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_clken),
	.conv2_output_a0_a0_a0_write_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_write_en_a),
	.conv2_output_a0_a0_a0_write_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_write_data_a),
	.conv2_output_a0_a0_a0_read_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_read_en_a),
	.conv2_output_a0_a0_a0_address_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_address_a),
	.conv2_output_a0_a0_a0_read_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_read_data_a),
	.conv2_output_a0_a0_a1_clken (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_clken),
	.conv2_output_a0_a0_a1_write_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_write_en_a),
	.conv2_output_a0_a0_a1_write_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_write_data_a),
	.conv2_output_a0_a0_a1_read_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_read_en_a),
	.conv2_output_a0_a0_a1_address_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_address_a),
	.conv2_output_a0_a0_a1_read_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_read_data_a),
	.conv2_output_a0_a0_a2_clken (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_clken),
	.conv2_output_a0_a0_a2_write_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_write_en_a),
	.conv2_output_a0_a0_a2_write_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_write_data_a),
	.conv2_output_a0_a0_a2_read_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_read_en_a),
	.conv2_output_a0_a0_a2_address_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_address_a),
	.conv2_output_a0_a0_a2_read_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_read_data_a),
	.conv2_output_a0_a0_a3_clken (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_clken),
	.conv2_output_a0_a0_a3_write_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_write_en_a),
	.conv2_output_a0_a0_a3_write_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_write_data_a),
	.conv2_output_a0_a0_a3_read_en_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_read_en_a),
	.conv2_output_a0_a0_a3_address_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_address_a),
	.conv2_output_a0_a0_a3_read_data_a (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_read_data_a)
);



legup_register conv2_output_valid_inst (
	.clk (conv2_output_valid_inst_clk),
	.reset (conv2_output_valid_inst_reset),
	.write_en (conv2_output_valid_inst_write_en),
	.read_data (conv2_output_valid_inst_read_data),
	.write_data (conv2_output_valid_inst_write_data)
);

defparam
	conv2_output_valid_inst.width = 8,
	conv2_output_valid_inst.init_value = 8'd0;


ram_single_port conv2_output_a0_a0_a0_inst (
	.clk (conv2_output_a0_a0_a0_inst_clk),
	.reset (conv2_output_a0_a0_a0_inst_reset),
	.clken (conv2_output_a0_a0_a0_inst_clken),
	.address_a (conv2_output_a0_a0_a0_inst_address_a),
	.write_en_a (conv2_output_a0_a0_a0_inst_write_en_a),
	.write_data_a (conv2_output_a0_a0_a0_inst_write_data_a),
	.read_data_a (conv2_output_a0_a0_a0_inst_read_data_a),
	.read_en_a (conv2_output_a0_a0_a0_inst_read_en_a)
);

defparam
	conv2_output_a0_a0_a0_inst.width_a = 16,
	conv2_output_a0_a0_a0_inst.widthad_a = 7,
	conv2_output_a0_a0_a0_inst.numwords_a = 121,
	conv2_output_a0_a0_a0_inst.latency = 1,
	conv2_output_a0_a0_a0_inst.fpga_device = "PolarFire",
	conv2_output_a0_a0_a0_inst.init_file = {`MEM_INIT_DIR, "conv2_output_a0_a0_a0.mem"};


ram_single_port conv2_output_a0_a0_a1_inst (
	.clk (conv2_output_a0_a0_a1_inst_clk),
	.reset (conv2_output_a0_a0_a1_inst_reset),
	.clken (conv2_output_a0_a0_a1_inst_clken),
	.address_a (conv2_output_a0_a0_a1_inst_address_a),
	.write_en_a (conv2_output_a0_a0_a1_inst_write_en_a),
	.write_data_a (conv2_output_a0_a0_a1_inst_write_data_a),
	.read_data_a (conv2_output_a0_a0_a1_inst_read_data_a),
	.read_en_a (conv2_output_a0_a0_a1_inst_read_en_a)
);

defparam
	conv2_output_a0_a0_a1_inst.width_a = 16,
	conv2_output_a0_a0_a1_inst.widthad_a = 7,
	conv2_output_a0_a0_a1_inst.numwords_a = 121,
	conv2_output_a0_a0_a1_inst.latency = 1,
	conv2_output_a0_a0_a1_inst.fpga_device = "PolarFire",
	conv2_output_a0_a0_a1_inst.init_file = {`MEM_INIT_DIR, "conv2_output_a0_a0_a1.mem"};


ram_single_port conv2_output_a0_a0_a2_inst (
	.clk (conv2_output_a0_a0_a2_inst_clk),
	.reset (conv2_output_a0_a0_a2_inst_reset),
	.clken (conv2_output_a0_a0_a2_inst_clken),
	.address_a (conv2_output_a0_a0_a2_inst_address_a),
	.write_en_a (conv2_output_a0_a0_a2_inst_write_en_a),
	.write_data_a (conv2_output_a0_a0_a2_inst_write_data_a),
	.read_data_a (conv2_output_a0_a0_a2_inst_read_data_a),
	.read_en_a (conv2_output_a0_a0_a2_inst_read_en_a)
);

defparam
	conv2_output_a0_a0_a2_inst.width_a = 16,
	conv2_output_a0_a0_a2_inst.widthad_a = 7,
	conv2_output_a0_a0_a2_inst.numwords_a = 121,
	conv2_output_a0_a0_a2_inst.latency = 1,
	conv2_output_a0_a0_a2_inst.fpga_device = "PolarFire",
	conv2_output_a0_a0_a2_inst.init_file = {`MEM_INIT_DIR, "conv2_output_a0_a0_a2.mem"};


ram_single_port conv2_output_a0_a0_a3_inst (
	.clk (conv2_output_a0_a0_a3_inst_clk),
	.reset (conv2_output_a0_a0_a3_inst_reset),
	.clken (conv2_output_a0_a0_a3_inst_clken),
	.address_a (conv2_output_a0_a0_a3_inst_address_a),
	.write_en_a (conv2_output_a0_a0_a3_inst_write_en_a),
	.write_data_a (conv2_output_a0_a0_a3_inst_write_data_a),
	.read_data_a (conv2_output_a0_a0_a3_inst_read_data_a),
	.read_en_a (conv2_output_a0_a0_a3_inst_read_en_a)
);

defparam
	conv2_output_a0_a0_a3_inst.width_a = 16,
	conv2_output_a0_a0_a3_inst.widthad_a = 7,
	conv2_output_a0_a0_a3_inst.numwords_a = 121,
	conv2_output_a0_a0_a3_inst.latency = 1,
	conv2_output_a0_a0_a3_inst.fpga_device = "PolarFire",
	conv2_output_a0_a0_a3_inst.init_file = {`MEM_INIT_DIR, "conv2_output_a0_a0_a3.mem"};


Conv_overloaded_2 Conv_overloaded_2_inst (
	.clk (Conv_overloaded_2_inst_clk),
	.reset (Conv_overloaded_2_inst_reset),
	.start (Conv_overloaded_2_inst_start),
	.ready (Conv_overloaded_2_inst_ready),
	.finish (Conv_overloaded_2_inst_finish),
	.conv2_output_valid_write_en (Conv_overloaded_2_inst_conv2_output_valid_write_en),
	.conv2_output_valid_write_data (Conv_overloaded_2_inst_conv2_output_valid_write_data),
	.conv2_output_valid_read_data (Conv_overloaded_2_inst_conv2_output_valid_read_data),
	.conv3_output_valid_write_en (Conv_overloaded_2_inst_conv3_output_valid_write_en),
	.conv3_output_valid_write_data (Conv_overloaded_2_inst_conv3_output_valid_write_data),
	.conv3_output_valid_read_data (Conv_overloaded_2_inst_conv3_output_valid_read_data),
	.conv3_output_a0_a0_a0_clken (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_clken),
	.conv3_output_a0_a0_a0_write_en_a (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_en_a),
	.conv3_output_a0_a0_a0_write_data_a (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_data_a),
	.conv3_output_a0_a0_a0_read_en_a (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_en_a),
	.conv3_output_a0_a0_a0_address_a (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_address_a),
	.conv3_output_a0_a0_a0_read_data_a (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_data_a),
	.conv3_output_a0_a0_a0_write_en_b (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_en_b),
	.conv3_output_a0_a0_a0_write_data_b (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_data_b),
	.conv3_output_a0_a0_a0_read_en_b (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_en_b),
	.conv3_output_a0_a0_a0_address_b (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_address_b),
	.conv3_output_a0_a0_a0_read_data_b (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_data_b),
	.conv2_output_a0_a0_a0_clken (Conv_overloaded_2_inst_conv2_output_a0_a0_a0_clken),
	.conv2_output_a0_a0_a0_write_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a0_write_en_a),
	.conv2_output_a0_a0_a0_write_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a0_write_data_a),
	.conv2_output_a0_a0_a0_read_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a0_read_en_a),
	.conv2_output_a0_a0_a0_address_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a0_address_a),
	.conv2_output_a0_a0_a0_read_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a0_read_data_a),
	.conv2_output_a0_a0_a1_clken (Conv_overloaded_2_inst_conv2_output_a0_a0_a1_clken),
	.conv2_output_a0_a0_a1_write_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a1_write_en_a),
	.conv2_output_a0_a0_a1_write_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a1_write_data_a),
	.conv2_output_a0_a0_a1_read_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a1_read_en_a),
	.conv2_output_a0_a0_a1_address_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a1_address_a),
	.conv2_output_a0_a0_a1_read_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a1_read_data_a),
	.conv2_output_a0_a0_a2_clken (Conv_overloaded_2_inst_conv2_output_a0_a0_a2_clken),
	.conv2_output_a0_a0_a2_write_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a2_write_en_a),
	.conv2_output_a0_a0_a2_write_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a2_write_data_a),
	.conv2_output_a0_a0_a2_read_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a2_read_en_a),
	.conv2_output_a0_a0_a2_address_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a2_address_a),
	.conv2_output_a0_a0_a2_read_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a2_read_data_a),
	.conv2_output_a0_a0_a3_clken (Conv_overloaded_2_inst_conv2_output_a0_a0_a3_clken),
	.conv2_output_a0_a0_a3_write_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a3_write_en_a),
	.conv2_output_a0_a0_a3_write_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a3_write_data_a),
	.conv2_output_a0_a0_a3_read_en_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a3_read_en_a),
	.conv2_output_a0_a0_a3_address_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a3_address_a),
	.conv2_output_a0_a0_a3_read_data_a (Conv_overloaded_2_inst_conv2_output_a0_a0_a3_read_data_a)
);



legup_register conv3_output_valid_inst (
	.clk (conv3_output_valid_inst_clk),
	.reset (conv3_output_valid_inst_reset),
	.write_en (conv3_output_valid_inst_write_en),
	.read_data (conv3_output_valid_inst_read_data),
	.write_data (conv3_output_valid_inst_write_data)
);

defparam
	conv3_output_valid_inst.width = 8,
	conv3_output_valid_inst.init_value = 8'd0;


ram_dual_port conv3_output_a0_a0_a0_inst (
	.clk (conv3_output_a0_a0_a0_inst_clk),
	.reset (conv3_output_a0_a0_a0_inst_reset),
	.clken (conv3_output_a0_a0_a0_inst_clken),
	.address_a (conv3_output_a0_a0_a0_inst_address_a),
	.write_en_a (conv3_output_a0_a0_a0_inst_write_en_a),
	.write_data_a (conv3_output_a0_a0_a0_inst_write_data_a),
	.read_data_a (conv3_output_a0_a0_a0_inst_read_data_a),
	.read_en_a (conv3_output_a0_a0_a0_inst_read_en_a),
	.address_b (conv3_output_a0_a0_a0_inst_address_b),
	.write_en_b (conv3_output_a0_a0_a0_inst_write_en_b),
	.write_data_b (conv3_output_a0_a0_a0_inst_write_data_b),
	.read_data_b (conv3_output_a0_a0_a0_inst_read_data_b),
	.read_en_b (conv3_output_a0_a0_a0_inst_read_en_b)
);

defparam
	conv3_output_a0_a0_a0_inst.width_a = 16,
	conv3_output_a0_a0_a0_inst.widthad_a = 9,
	conv3_output_a0_a0_a0_inst.numwords_a = 324,
	conv3_output_a0_a0_a0_inst.width_b = 16,
	conv3_output_a0_a0_a0_inst.widthad_b = 9,
	conv3_output_a0_a0_a0_inst.numwords_b = 324,
	conv3_output_a0_a0_a0_inst.latency = 1,
	conv3_output_a0_a0_a0_inst.fpga_device = "PolarFire",
	conv3_output_a0_a0_a0_inst.init_file = {`MEM_INIT_DIR, "conv3_output_a0_a0_a0.mem"};


Conv_overloaded_3 Conv_overloaded_3_inst (
	.clk (Conv_overloaded_3_inst_clk),
	.reset (Conv_overloaded_3_inst_reset),
	.start (Conv_overloaded_3_inst_start),
	.ready (Conv_overloaded_3_inst_ready),
	.finish (Conv_overloaded_3_inst_finish),
	.conv3_output_valid_write_en (Conv_overloaded_3_inst_conv3_output_valid_write_en),
	.conv3_output_valid_write_data (Conv_overloaded_3_inst_conv3_output_valid_write_data),
	.conv3_output_valid_read_data (Conv_overloaded_3_inst_conv3_output_valid_read_data),
	.conv4_output_valid_write_en (Conv_overloaded_3_inst_conv4_output_valid_write_en),
	.conv4_output_valid_write_data (Conv_overloaded_3_inst_conv4_output_valid_write_data),
	.conv4_output_valid_read_data (Conv_overloaded_3_inst_conv4_output_valid_read_data),
	.conv4_output_a0_a0_a0_clken (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_clken),
	.conv4_output_a0_a0_a0_write_en_a (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_en_a),
	.conv4_output_a0_a0_a0_write_data_a (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_data_a),
	.conv4_output_a0_a0_a0_read_en_a (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_en_a),
	.conv4_output_a0_a0_a0_address_a (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_address_a),
	.conv4_output_a0_a0_a0_read_data_a (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_data_a),
	.conv4_output_a0_a0_a0_write_en_b (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_en_b),
	.conv4_output_a0_a0_a0_write_data_b (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_data_b),
	.conv4_output_a0_a0_a0_read_en_b (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_en_b),
	.conv4_output_a0_a0_a0_address_b (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_address_b),
	.conv4_output_a0_a0_a0_read_data_b (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_data_b),
	.conv3_output_a0_a0_a0_clken (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_clken),
	.conv3_output_a0_a0_a0_write_en_a (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_en_a),
	.conv3_output_a0_a0_a0_write_data_a (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_data_a),
	.conv3_output_a0_a0_a0_read_en_a (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_en_a),
	.conv3_output_a0_a0_a0_address_a (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_address_a),
	.conv3_output_a0_a0_a0_read_data_a (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_data_a),
	.conv3_output_a0_a0_a0_write_en_b (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_en_b),
	.conv3_output_a0_a0_a0_write_data_b (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_data_b),
	.conv3_output_a0_a0_a0_read_en_b (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_en_b),
	.conv3_output_a0_a0_a0_address_b (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_address_b),
	.conv3_output_a0_a0_a0_read_data_b (Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_data_b)
);



legup_register conv4_output_valid_inst (
	.clk (conv4_output_valid_inst_clk),
	.reset (conv4_output_valid_inst_reset),
	.write_en (conv4_output_valid_inst_write_en),
	.read_data (conv4_output_valid_inst_read_data),
	.write_data (conv4_output_valid_inst_write_data)
);

defparam
	conv4_output_valid_inst.width = 8,
	conv4_output_valid_inst.init_value = 8'd0;


ram_dual_port conv4_output_a0_a0_a0_inst (
	.clk (conv4_output_a0_a0_a0_inst_clk),
	.reset (conv4_output_a0_a0_a0_inst_reset),
	.clken (conv4_output_a0_a0_a0_inst_clken),
	.address_a (conv4_output_a0_a0_a0_inst_address_a),
	.write_en_a (conv4_output_a0_a0_a0_inst_write_en_a),
	.write_data_a (conv4_output_a0_a0_a0_inst_write_data_a),
	.read_data_a (conv4_output_a0_a0_a0_inst_read_data_a),
	.read_en_a (conv4_output_a0_a0_a0_inst_read_en_a),
	.address_b (conv4_output_a0_a0_a0_inst_address_b),
	.write_en_b (conv4_output_a0_a0_a0_inst_write_en_b),
	.write_data_b (conv4_output_a0_a0_a0_inst_write_data_b),
	.read_data_b (conv4_output_a0_a0_a0_inst_read_data_b),
	.read_en_b (conv4_output_a0_a0_a0_inst_read_en_b)
);

defparam
	conv4_output_a0_a0_a0_inst.width_a = 16,
	conv4_output_a0_a0_a0_inst.widthad_a = 7,
	conv4_output_a0_a0_a0_inst.numwords_a = 98,
	conv4_output_a0_a0_a0_inst.width_b = 16,
	conv4_output_a0_a0_a0_inst.widthad_b = 7,
	conv4_output_a0_a0_a0_inst.numwords_b = 98,
	conv4_output_a0_a0_a0_inst.latency = 1,
	conv4_output_a0_a0_a0_inst.fpga_device = "PolarFire",
	conv4_output_a0_a0_a0_inst.init_file = {`MEM_INIT_DIR, "conv4_output_a0_a0_a0.mem"};


FC FC_inst (
	.clk (FC_inst_clk),
	.reset (FC_inst_reset),
	.start (FC_inst_start),
	.ready (FC_inst_ready),
	.finish (FC_inst_finish),
	.conv4_output_valid_write_en (FC_inst_conv4_output_valid_write_en),
	.conv4_output_valid_write_data (FC_inst_conv4_output_valid_write_data),
	.conv4_output_valid_read_data (FC_inst_conv4_output_valid_read_data),
	.fc_output_valid_write_en (FC_inst_fc_output_valid_write_en),
	.fc_output_valid_write_data (FC_inst_fc_output_valid_write_data),
	.fc_output_valid_read_data (FC_inst_fc_output_valid_read_data),
	.conv4_output_a0_a0_a0_clken (FC_inst_conv4_output_a0_a0_a0_clken),
	.conv4_output_a0_a0_a0_write_en_a (FC_inst_conv4_output_a0_a0_a0_write_en_a),
	.conv4_output_a0_a0_a0_write_data_a (FC_inst_conv4_output_a0_a0_a0_write_data_a),
	.conv4_output_a0_a0_a0_read_en_a (FC_inst_conv4_output_a0_a0_a0_read_en_a),
	.conv4_output_a0_a0_a0_address_a (FC_inst_conv4_output_a0_a0_a0_address_a),
	.conv4_output_a0_a0_a0_read_data_a (FC_inst_conv4_output_a0_a0_a0_read_data_a),
	.conv4_output_a0_a0_a0_write_en_b (FC_inst_conv4_output_a0_a0_a0_write_en_b),
	.conv4_output_a0_a0_a0_write_data_b (FC_inst_conv4_output_a0_a0_a0_write_data_b),
	.conv4_output_a0_a0_a0_read_en_b (FC_inst_conv4_output_a0_a0_a0_read_en_b),
	.conv4_output_a0_a0_a0_address_b (FC_inst_conv4_output_a0_a0_a0_address_b),
	.conv4_output_a0_a0_a0_read_data_b (FC_inst_conv4_output_a0_a0_a0_read_data_b),
	.fc_output_clken (FC_inst_fc_output_clken),
	.fc_output_write_en_a (FC_inst_fc_output_write_en_a),
	.fc_output_write_data_a (FC_inst_fc_output_write_data_a),
	.fc_output_read_en_a (FC_inst_fc_output_read_en_a),
	.fc_output_address_a (FC_inst_fc_output_address_a),
	.fc_output_read_data_a (FC_inst_fc_output_read_data_a)
);



legup_register fc_output_valid_inst (
	.clk (fc_output_valid_inst_clk),
	.reset (fc_output_valid_inst_reset),
	.write_en (fc_output_valid_inst_write_en),
	.read_data (fc_output_valid_inst_read_data),
	.write_data (fc_output_valid_inst_write_data)
);

defparam
	fc_output_valid_inst.width = 8,
	fc_output_valid_inst.init_value = 8'd0;


ram_single_port fc_output_inst (
	.clk (fc_output_inst_clk),
	.reset (fc_output_inst_reset),
	.clken (fc_output_inst_clken),
	.address_a (fc_output_inst_address_a),
	.write_en_a (fc_output_inst_write_en_a),
	.write_data_a (fc_output_inst_write_data_a),
	.read_data_a (fc_output_inst_read_data_a),
	.read_en_a (fc_output_inst_read_en_a)
);

defparam
	fc_output_inst.width_a = 16,
	fc_output_inst.widthad_a = 4,
	fc_output_inst.numwords_a = 10,
	fc_output_inst.latency = 1,
	fc_output_inst.fpga_device = "PolarFire",
	fc_output_inst.init_file = {`MEM_INIT_DIR, "fc_output.mem"};


MaxComp MaxComp_inst (
	.clk (MaxComp_inst_clk),
	.reset (MaxComp_inst_reset),
	.start (MaxComp_inst_start),
	.ready (MaxComp_inst_ready),
	.finish (MaxComp_inst_finish),
	.fc_output_valid_write_en (MaxComp_inst_fc_output_valid_write_en),
	.fc_output_valid_write_data (MaxComp_inst_fc_output_valid_write_data),
	.fc_output_valid_read_data (MaxComp_inst_fc_output_valid_read_data),
	.fc_output_clken (MaxComp_inst_fc_output_clken),
	.fc_output_write_en_a (MaxComp_inst_fc_output_write_en_a),
	.fc_output_write_data_a (MaxComp_inst_fc_output_write_data_a),
	.fc_output_read_en_a (MaxComp_inst_fc_output_read_en_a),
	.fc_output_address_a (MaxComp_inst_fc_output_address_a),
	.fc_output_read_data_a (MaxComp_inst_fc_output_read_data_a),
	.output_digit (MaxComp_inst_output_digit),
	.output_digit_ready (MaxComp_inst_output_digit_ready),
	.output_digit_valid (MaxComp_inst_output_digit_valid)
);



always @(*) begin
	ClassifierPipeline_inst_clk = clk;
end
always @(*) begin
	ClassifierPipeline_inst_reset = reset;
end
always @(*) begin
	ClassifierPipeline_inst_start = start;
end
always @(posedge clk) begin
	if ((reset | ClassifierPipeline_inst_start)) begin
		ClassifierPipeline_inst_finish_reg <= 1'd0;
	end
	if (ClassifierPipeline_inst_finish) begin
		ClassifierPipeline_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	Conv_inst_clk = clk;
end
always @(*) begin
	Conv_inst_reset = reset;
end
always @(*) begin
	Conv_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_Conv_threadID == 16'd0)) begin
		Conv_inst_start = ClassifierPipeline_inst_Conv_start;
	end
end
always @(*) begin
	Conv_inst_classifier_input_valid_read_data = classifier_input_valid_read_data;
end
always @(*) begin
	Conv_inst_conv1_output_valid_read_data = conv1_output_valid_inst_read_data;
end
always @(*) begin
	Conv_inst_conv1_output_a0_a0_a0_read_data_a = conv1_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_inst_conv1_output_a0_a0_a1_read_data_a = conv1_output_a0_a0_a1_inst_read_data_a;
end
always @(*) begin
	Conv_inst_classifier_input_read_data_a = classifier_input_read_data_a;
end
always @(*) begin
	Conv_inst_classifier_input_read_data_b = classifier_input_read_data_b;
end
always @(posedge clk) begin
	if ((reset | Conv_inst_start)) begin
		Conv_inst_finish_reg <= 1'd0;
	end
	if (Conv_inst_finish) begin
		Conv_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	conv1_output_valid_inst_clk = clk;
end
always @(*) begin
	conv1_output_valid_inst_reset = reset;
end
always @(*) begin
	conv1_output_valid_inst_write_en = (Conv_inst_conv1_output_valid_write_en | Maxpool_inst_conv1_output_valid_write_en);
end
always @(*) begin
	conv1_output_valid_inst_write_data = (Conv_inst_conv1_output_valid_write_data | Maxpool_inst_conv1_output_valid_write_data);
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_clk = clk;
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_reset = reset;
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_clken = (Conv_inst_conv1_output_a0_a0_a0_clken | Maxpool_inst_conv1_output_a0_a0_a0_clken);
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_address_a = (Conv_inst_conv1_output_a0_a0_a0_address_a | Maxpool_inst_conv1_output_a0_a0_a0_address_a);
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_write_en_a = (Conv_inst_conv1_output_a0_a0_a0_write_en_a | Maxpool_inst_conv1_output_a0_a0_a0_write_en_a);
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_write_data_a = (Conv_inst_conv1_output_a0_a0_a0_write_data_a | Maxpool_inst_conv1_output_a0_a0_a0_write_data_a);
end
always @(*) begin
	conv1_output_a0_a0_a0_inst_read_en_a = (Conv_inst_conv1_output_a0_a0_a0_read_en_a | Maxpool_inst_conv1_output_a0_a0_a0_read_en_a);
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_clk = clk;
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_reset = reset;
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_clken = (Conv_inst_conv1_output_a0_a0_a1_clken | Maxpool_inst_conv1_output_a0_a0_a1_clken);
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_address_a = (Conv_inst_conv1_output_a0_a0_a1_address_a | Maxpool_inst_conv1_output_a0_a0_a1_address_a);
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_write_en_a = (Conv_inst_conv1_output_a0_a0_a1_write_en_a | Maxpool_inst_conv1_output_a0_a0_a1_write_en_a);
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_write_data_a = (Conv_inst_conv1_output_a0_a0_a1_write_data_a | Maxpool_inst_conv1_output_a0_a0_a1_write_data_a);
end
always @(*) begin
	conv1_output_a0_a0_a1_inst_read_en_a = (Conv_inst_conv1_output_a0_a0_a1_read_en_a | Maxpool_inst_conv1_output_a0_a0_a1_read_en_a);
end
always @(*) begin
	Maxpool_inst_clk = clk;
end
always @(*) begin
	Maxpool_inst_reset = reset;
end
always @(*) begin
	Maxpool_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_Maxpool_threadID == 16'd0)) begin
		Maxpool_inst_start = ClassifierPipeline_inst_Maxpool_start;
	end
end
always @(*) begin
	Maxpool_inst_conv1_output_valid_read_data = conv1_output_valid_inst_read_data;
end
always @(*) begin
	Maxpool_inst_maxpool_output_valid_read_data = maxpool_output_valid_inst_read_data;
end
always @(*) begin
	Maxpool_inst_maxpool_output_a0_a0_a0_read_data_a = maxpool_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Maxpool_inst_maxpool_output_a0_a0_a1_read_data_a = maxpool_output_a0_a0_a1_inst_read_data_a;
end
always @(*) begin
	Maxpool_inst_conv1_output_a0_a0_a0_read_data_a = conv1_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Maxpool_inst_conv1_output_a0_a0_a1_read_data_a = conv1_output_a0_a0_a1_inst_read_data_a;
end
always @(posedge clk) begin
	if ((reset | Maxpool_inst_start)) begin
		Maxpool_inst_finish_reg <= 1'd0;
	end
	if (Maxpool_inst_finish) begin
		Maxpool_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	maxpool_output_valid_inst_clk = clk;
end
always @(*) begin
	maxpool_output_valid_inst_reset = reset;
end
always @(*) begin
	maxpool_output_valid_inst_write_en = (Maxpool_inst_maxpool_output_valid_write_en | Conv_overloaded_1_inst_maxpool_output_valid_write_en);
end
always @(*) begin
	maxpool_output_valid_inst_write_data = (Maxpool_inst_maxpool_output_valid_write_data | Conv_overloaded_1_inst_maxpool_output_valid_write_data);
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_clk = clk;
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_reset = reset;
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_clken = (Maxpool_inst_maxpool_output_a0_a0_a0_clken | Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_clken);
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_address_a = (Maxpool_inst_maxpool_output_a0_a0_a0_address_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_address_a);
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_write_en_a = (Maxpool_inst_maxpool_output_a0_a0_a0_write_en_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_write_en_a);
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_write_data_a = (Maxpool_inst_maxpool_output_a0_a0_a0_write_data_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_write_data_a);
end
always @(*) begin
	maxpool_output_a0_a0_a0_inst_read_en_a = (Maxpool_inst_maxpool_output_a0_a0_a0_read_en_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_read_en_a);
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_clk = clk;
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_reset = reset;
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_clken = (Maxpool_inst_maxpool_output_a0_a0_a1_clken | Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_clken);
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_address_a = (Maxpool_inst_maxpool_output_a0_a0_a1_address_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_address_a);
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_write_en_a = (Maxpool_inst_maxpool_output_a0_a0_a1_write_en_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_write_en_a);
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_write_data_a = (Maxpool_inst_maxpool_output_a0_a0_a1_write_data_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_write_data_a);
end
always @(*) begin
	maxpool_output_a0_a0_a1_inst_read_en_a = (Maxpool_inst_maxpool_output_a0_a0_a1_read_en_a | Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_read_en_a);
end
always @(*) begin
	Conv_overloaded_1_inst_clk = clk;
end
always @(*) begin
	Conv_overloaded_1_inst_reset = reset;
end
always @(*) begin
	Conv_overloaded_1_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_Conv_overloaded_1_threadID == 16'd0)) begin
		Conv_overloaded_1_inst_start = ClassifierPipeline_inst_Conv_overloaded_1_start;
	end
end
always @(*) begin
	Conv_overloaded_1_inst_maxpool_output_valid_read_data = maxpool_output_valid_inst_read_data;
end
always @(*) begin
	Conv_overloaded_1_inst_conv2_output_valid_read_data = conv2_output_valid_inst_read_data;
end
always @(*) begin
	Conv_overloaded_1_inst_maxpool_output_a0_a0_a0_read_data_a = maxpool_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_1_inst_maxpool_output_a0_a0_a1_read_data_a = maxpool_output_a0_a0_a1_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_1_inst_conv2_output_a0_a0_a0_read_data_a = conv2_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_1_inst_conv2_output_a0_a0_a1_read_data_a = conv2_output_a0_a0_a1_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_1_inst_conv2_output_a0_a0_a2_read_data_a = conv2_output_a0_a0_a2_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_1_inst_conv2_output_a0_a0_a3_read_data_a = conv2_output_a0_a0_a3_inst_read_data_a;
end
always @(posedge clk) begin
	if ((reset | Conv_overloaded_1_inst_start)) begin
		Conv_overloaded_1_inst_finish_reg <= 1'd0;
	end
	if (Conv_overloaded_1_inst_finish) begin
		Conv_overloaded_1_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	conv2_output_valid_inst_clk = clk;
end
always @(*) begin
	conv2_output_valid_inst_reset = reset;
end
always @(*) begin
	conv2_output_valid_inst_write_en = (Conv_overloaded_1_inst_conv2_output_valid_write_en | Conv_overloaded_2_inst_conv2_output_valid_write_en);
end
always @(*) begin
	conv2_output_valid_inst_write_data = (Conv_overloaded_1_inst_conv2_output_valid_write_data | Conv_overloaded_2_inst_conv2_output_valid_write_data);
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_clk = clk;
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_reset = reset;
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_clken = (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_clken | Conv_overloaded_2_inst_conv2_output_a0_a0_a0_clken);
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_address_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_address_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a0_address_a);
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_write_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_write_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a0_write_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_write_data_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_write_data_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a0_write_data_a);
end
always @(*) begin
	conv2_output_a0_a0_a0_inst_read_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a0_read_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a0_read_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_clk = clk;
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_reset = reset;
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_clken = (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_clken | Conv_overloaded_2_inst_conv2_output_a0_a0_a1_clken);
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_address_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_address_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a1_address_a);
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_write_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_write_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a1_write_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_write_data_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_write_data_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a1_write_data_a);
end
always @(*) begin
	conv2_output_a0_a0_a1_inst_read_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a1_read_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a1_read_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_clk = clk;
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_reset = reset;
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_clken = (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_clken | Conv_overloaded_2_inst_conv2_output_a0_a0_a2_clken);
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_address_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_address_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a2_address_a);
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_write_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_write_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a2_write_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_write_data_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_write_data_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a2_write_data_a);
end
always @(*) begin
	conv2_output_a0_a0_a2_inst_read_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a2_read_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a2_read_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_clk = clk;
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_reset = reset;
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_clken = (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_clken | Conv_overloaded_2_inst_conv2_output_a0_a0_a3_clken);
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_address_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_address_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a3_address_a);
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_write_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_write_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a3_write_en_a);
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_write_data_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_write_data_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a3_write_data_a);
end
always @(*) begin
	conv2_output_a0_a0_a3_inst_read_en_a = (Conv_overloaded_1_inst_conv2_output_a0_a0_a3_read_en_a | Conv_overloaded_2_inst_conv2_output_a0_a0_a3_read_en_a);
end
always @(*) begin
	Conv_overloaded_2_inst_clk = clk;
end
always @(*) begin
	Conv_overloaded_2_inst_reset = reset;
end
always @(*) begin
	Conv_overloaded_2_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_Conv_overloaded_2_threadID == 16'd0)) begin
		Conv_overloaded_2_inst_start = ClassifierPipeline_inst_Conv_overloaded_2_start;
	end
end
always @(*) begin
	Conv_overloaded_2_inst_conv2_output_valid_read_data = conv2_output_valid_inst_read_data;
end
always @(*) begin
	Conv_overloaded_2_inst_conv3_output_valid_read_data = conv3_output_valid_inst_read_data;
end
always @(*) begin
	Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_data_a = conv3_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_data_b = conv3_output_a0_a0_a0_inst_read_data_b;
end
always @(*) begin
	Conv_overloaded_2_inst_conv2_output_a0_a0_a0_read_data_a = conv2_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_2_inst_conv2_output_a0_a0_a1_read_data_a = conv2_output_a0_a0_a1_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_2_inst_conv2_output_a0_a0_a2_read_data_a = conv2_output_a0_a0_a2_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_2_inst_conv2_output_a0_a0_a3_read_data_a = conv2_output_a0_a0_a3_inst_read_data_a;
end
always @(posedge clk) begin
	if ((reset | Conv_overloaded_2_inst_start)) begin
		Conv_overloaded_2_inst_finish_reg <= 1'd0;
	end
	if (Conv_overloaded_2_inst_finish) begin
		Conv_overloaded_2_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	conv3_output_valid_inst_clk = clk;
end
always @(*) begin
	conv3_output_valid_inst_reset = reset;
end
always @(*) begin
	conv3_output_valid_inst_write_en = (Conv_overloaded_2_inst_conv3_output_valid_write_en | Conv_overloaded_3_inst_conv3_output_valid_write_en);
end
always @(*) begin
	conv3_output_valid_inst_write_data = (Conv_overloaded_2_inst_conv3_output_valid_write_data | Conv_overloaded_3_inst_conv3_output_valid_write_data);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_clk = clk;
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_reset = reset;
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_clken = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_clken | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_clken);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_address_a = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_address_a | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_address_a);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_write_en_a = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_en_a | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_en_a);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_write_data_a = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_data_a | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_data_a);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_read_en_a = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_en_a | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_en_a);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_address_b = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_address_b | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_address_b);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_write_en_b = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_en_b | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_en_b);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_write_data_b = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_write_data_b | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_write_data_b);
end
always @(*) begin
	conv3_output_a0_a0_a0_inst_read_en_b = (Conv_overloaded_2_inst_conv3_output_a0_a0_a0_read_en_b | Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_en_b);
end
always @(*) begin
	Conv_overloaded_3_inst_clk = clk;
end
always @(*) begin
	Conv_overloaded_3_inst_reset = reset;
end
always @(*) begin
	Conv_overloaded_3_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_Conv_overloaded_3_threadID == 16'd0)) begin
		Conv_overloaded_3_inst_start = ClassifierPipeline_inst_Conv_overloaded_3_start;
	end
end
always @(*) begin
	Conv_overloaded_3_inst_conv3_output_valid_read_data = conv3_output_valid_inst_read_data;
end
always @(*) begin
	Conv_overloaded_3_inst_conv4_output_valid_read_data = conv4_output_valid_inst_read_data;
end
always @(*) begin
	Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_data_a = conv4_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_data_b = conv4_output_a0_a0_a0_inst_read_data_b;
end
always @(*) begin
	Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_data_a = conv3_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	Conv_overloaded_3_inst_conv3_output_a0_a0_a0_read_data_b = conv3_output_a0_a0_a0_inst_read_data_b;
end
always @(posedge clk) begin
	if ((reset | Conv_overloaded_3_inst_start)) begin
		Conv_overloaded_3_inst_finish_reg <= 1'd0;
	end
	if (Conv_overloaded_3_inst_finish) begin
		Conv_overloaded_3_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	conv4_output_valid_inst_clk = clk;
end
always @(*) begin
	conv4_output_valid_inst_reset = reset;
end
always @(*) begin
	conv4_output_valid_inst_write_en = (Conv_overloaded_3_inst_conv4_output_valid_write_en | FC_inst_conv4_output_valid_write_en);
end
always @(*) begin
	conv4_output_valid_inst_write_data = (Conv_overloaded_3_inst_conv4_output_valid_write_data | FC_inst_conv4_output_valid_write_data);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_clk = clk;
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_reset = reset;
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_clken = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_clken | FC_inst_conv4_output_a0_a0_a0_clken);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_address_a = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_address_a | FC_inst_conv4_output_a0_a0_a0_address_a);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_write_en_a = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_en_a | FC_inst_conv4_output_a0_a0_a0_write_en_a);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_write_data_a = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_data_a | FC_inst_conv4_output_a0_a0_a0_write_data_a);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_read_en_a = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_en_a | FC_inst_conv4_output_a0_a0_a0_read_en_a);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_address_b = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_address_b | FC_inst_conv4_output_a0_a0_a0_address_b);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_write_en_b = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_en_b | FC_inst_conv4_output_a0_a0_a0_write_en_b);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_write_data_b = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_write_data_b | FC_inst_conv4_output_a0_a0_a0_write_data_b);
end
always @(*) begin
	conv4_output_a0_a0_a0_inst_read_en_b = (Conv_overloaded_3_inst_conv4_output_a0_a0_a0_read_en_b | FC_inst_conv4_output_a0_a0_a0_read_en_b);
end
always @(*) begin
	FC_inst_clk = clk;
end
always @(*) begin
	FC_inst_reset = reset;
end
always @(*) begin
	FC_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_FC_threadID == 16'd0)) begin
		FC_inst_start = ClassifierPipeline_inst_FC_start;
	end
end
always @(*) begin
	FC_inst_conv4_output_valid_read_data = conv4_output_valid_inst_read_data;
end
always @(*) begin
	FC_inst_fc_output_valid_read_data = fc_output_valid_inst_read_data;
end
always @(*) begin
	FC_inst_conv4_output_a0_a0_a0_read_data_a = conv4_output_a0_a0_a0_inst_read_data_a;
end
always @(*) begin
	FC_inst_conv4_output_a0_a0_a0_read_data_b = conv4_output_a0_a0_a0_inst_read_data_b;
end
always @(*) begin
	FC_inst_fc_output_read_data_a = fc_output_inst_read_data_a;
end
always @(posedge clk) begin
	if ((reset | FC_inst_start)) begin
		FC_inst_finish_reg <= 1'd0;
	end
	if (FC_inst_finish) begin
		FC_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	fc_output_valid_inst_clk = clk;
end
always @(*) begin
	fc_output_valid_inst_reset = reset;
end
always @(*) begin
	fc_output_valid_inst_write_en = (FC_inst_fc_output_valid_write_en | MaxComp_inst_fc_output_valid_write_en);
end
always @(*) begin
	fc_output_valid_inst_write_data = (FC_inst_fc_output_valid_write_data | MaxComp_inst_fc_output_valid_write_data);
end
always @(*) begin
	fc_output_inst_clk = clk;
end
always @(*) begin
	fc_output_inst_reset = reset;
end
always @(*) begin
	fc_output_inst_clken = (FC_inst_fc_output_clken | MaxComp_inst_fc_output_clken);
end
always @(*) begin
	fc_output_inst_address_a = (FC_inst_fc_output_address_a | MaxComp_inst_fc_output_address_a);
end
always @(*) begin
	fc_output_inst_write_en_a = (FC_inst_fc_output_write_en_a | MaxComp_inst_fc_output_write_en_a);
end
always @(*) begin
	fc_output_inst_write_data_a = (FC_inst_fc_output_write_data_a | MaxComp_inst_fc_output_write_data_a);
end
always @(*) begin
	fc_output_inst_read_en_a = (FC_inst_fc_output_read_en_a | MaxComp_inst_fc_output_read_en_a);
end
always @(*) begin
	MaxComp_inst_clk = clk;
end
always @(*) begin
	MaxComp_inst_reset = reset;
end
always @(*) begin
	MaxComp_inst_start = 1'd0;
	if ((ClassifierPipeline_inst_MaxComp_threadID == 16'd0)) begin
		MaxComp_inst_start = ClassifierPipeline_inst_MaxComp_start;
	end
end
always @(*) begin
	MaxComp_inst_fc_output_valid_read_data = fc_output_valid_inst_read_data;
end
always @(*) begin
	MaxComp_inst_fc_output_read_data_a = fc_output_inst_read_data_a;
end
always @(*) begin
	MaxComp_inst_output_digit_ready = classifier_output_ready;
end
always @(posedge clk) begin
	if ((reset | MaxComp_inst_start)) begin
		MaxComp_inst_finish_reg <= 1'd0;
	end
	if (MaxComp_inst_finish) begin
		MaxComp_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = ClassifierPipeline_inst_ready;
end
always @(*) begin
	finish = ClassifierPipeline_inst_finish;
end
always @(*) begin
	classifier_input_valid_write_en = Conv_inst_classifier_input_valid_write_en;
end
always @(*) begin
	classifier_input_valid_write_data = Conv_inst_classifier_input_valid_write_data;
end
always @(*) begin
	classifier_input_clken = Conv_inst_classifier_input_clken;
end
always @(*) begin
	classifier_input_read_en_a = Conv_inst_classifier_input_read_en_a;
end
always @(*) begin
	classifier_input_address_a = Conv_inst_classifier_input_address_a;
end
always @(*) begin
	classifier_input_read_en_b = Conv_inst_classifier_input_read_en_b;
end
always @(*) begin
	classifier_input_address_b = Conv_inst_classifier_input_address_b;
end
always @(*) begin
	classifier_output = MaxComp_inst_output_digit;
end
always @(*) begin
	classifier_output_valid = MaxComp_inst_output_digit_valid;
end

endmodule
`timescale 1 ns / 1 ns
module legup_split_mult_signed_16_16_32_1
(
	clock,
	aclr,
	clken,
	dataa,
	datab,
	result
);

parameter [4:0] widtha = 5'd16;
parameter [4:0] widthb = 5'd16;
parameter [5:0] widthp = 6'd32;
parameter  pipeline = 1'd1;
parameter  representation = "SIGNED";
parameter  preserve_module_hierarchy = 1'd0;

input  clock;
input  aclr;
input  clken;
input [15:0] dataa;
input [15:0] datab;
output reg [31:0] result;
reg [15:0] lhs_in_15_0;
reg [15:0] rhs_in_15_0;
reg [31:0] mul_0_wire;
reg [31:0] mul_result_slice_31_0;


always @(*) begin
	lhs_in_15_0 = dataa[15:0];
end
always @(*) begin
	rhs_in_15_0 = datab[15:0];
end
always @(*) begin
	mul_0_wire = ($signed(lhs_in_15_0) * $signed(rhs_in_15_0));
end
always @(posedge clock) begin
	if (aclr) begin
		mul_result_slice_31_0 <= 'd0;
	end
	if ((~(aclr) & clken)) begin
		mul_result_slice_31_0 <= mul_0_wire;
	end
end
always @(*) begin
	result = mul_result_slice_31_0;
end
/*   %17 = mul i32 %12, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
endmodule
`timescale 1 ns / 1 ns
module Conv
(
	clk,
	reset,
	start,
	ready,
	finish,
	classifier_input_valid_write_en,
	classifier_input_valid_write_data,
	classifier_input_valid_read_data,
	conv1_output_valid_write_en,
	conv1_output_valid_write_data,
	conv1_output_valid_read_data,
	conv1_output_a0_a0_a0_clken,
	conv1_output_a0_a0_a0_write_en_a,
	conv1_output_a0_a0_a0_write_data_a,
	conv1_output_a0_a0_a0_read_en_a,
	conv1_output_a0_a0_a0_address_a,
	conv1_output_a0_a0_a0_read_data_a,
	conv1_output_a0_a0_a1_clken,
	conv1_output_a0_a0_a1_write_en_a,
	conv1_output_a0_a0_a1_write_data_a,
	conv1_output_a0_a0_a1_read_en_a,
	conv1_output_a0_a0_a1_address_a,
	conv1_output_a0_a0_a1_read_data_a,
	classifier_input_clken,
	classifier_input_read_en_a,
	classifier_input_address_a,
	classifier_input_read_data_a,
	classifier_input_read_en_b,
	classifier_input_address_b,
	classifier_input_read_data_b
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_Conv_BB_while_body_1 = 4'd1;
parameter [3:0] LEGUP_F_Conv_BB_while_body_backedge_2 = 4'd2;
parameter [3:0] LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3 = 4'd3;
parameter [3:0] LEGUP_F_Conv_BB_for_cond7_preheader_4 = 4'd4;
parameter [3:0] LEGUP_F_Conv_BB_for_cond10_preheader_5 = 4'd5;
parameter [3:0] LEGUP_F_Conv_BB_for_cond10_preheader_6 = 4'd6;
parameter [3:0] LEGUP_F_Conv_BB_for_cond64_preheader_7 = 4'd7;
parameter [3:0] LEGUP_F_Conv_BB_for_cond64_preheader_8 = 4'd8;
parameter [3:0] LEGUP_F_Conv_BB_for_cond64_preheader_9 = 4'd9;
parameter [3:0] LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_10 = 4'd10;
parameter [3:0] LEGUP_F_Conv_BB_for_inc95_11 = 4'd11;
parameter [3:0] LEGUP_F_Conv_BB_for_end97_12 = 4'd12;
parameter [3:0] LEGUP_F_Conv_BB_for_end97_13 = 4'd13;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  classifier_input_valid_write_en;
output reg [7:0] classifier_input_valid_write_data;
input [7:0] classifier_input_valid_read_data;
output reg  conv1_output_valid_write_en;
output reg [7:0] conv1_output_valid_write_data;
input [7:0] conv1_output_valid_read_data;
output reg  conv1_output_a0_a0_a0_clken;
output reg  conv1_output_a0_a0_a0_write_en_a;
output reg [15:0] conv1_output_a0_a0_a0_write_data_a;
output  conv1_output_a0_a0_a0_read_en_a;
output reg [9:0] conv1_output_a0_a0_a0_address_a;
input [15:0] conv1_output_a0_a0_a0_read_data_a;
output reg  conv1_output_a0_a0_a1_clken;
output reg  conv1_output_a0_a0_a1_write_en_a;
output reg [15:0] conv1_output_a0_a0_a1_write_data_a;
output  conv1_output_a0_a0_a1_read_en_a;
output reg [9:0] conv1_output_a0_a0_a1_address_a;
input [15:0] conv1_output_a0_a0_a1_read_data_a;
output reg  classifier_input_clken;
output reg  classifier_input_read_en_a;
output reg [9:0] classifier_input_address_a;
input [15:0] classifier_input_read_data_a;
output  classifier_input_read_en_b;
output [9:0] classifier_input_address_b;
input [15:0] classifier_input_read_data_b;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;
reg [7:0] Conv_while_body_0;
reg [7:0] Conv_while_body_1;
reg [7:0] Conv_while_body_2;
reg [7:0] Conv_while_body_and134;
reg  Conv_while_body_tobool4;
reg [31:0] Conv_cond7_preheader_r_0151;
reg [31:0] Conv_cond7_preheader_r_0151_reg;
reg [30:0] Conv_cond7_preheader_bit_select6;
reg [28:0] Conv_cond7_preheader_bit_select4;
reg [27:0] Conv_cond7_preheader_bit_select2;
reg [31:0] Conv_cond7_preheader_bit_concat7;
reg [31:0] Conv_cond7_preheader_bit_concat5;
reg [31:0] Conv_cond7_preheader_bit_concat3;
reg [31:0] Conv_cond7_preheader_sr_add;
reg [31:0] Conv_cond7_preheader_sr_add15;
reg [31:0] Conv_cond7_preheader_sr_add15_reg;
reg [31:0] Conv_ond10_preheader_c_0150;
reg [31:0] Conv_ond10_preheader_c_0150_reg;
reg [31:0] Conv_ond10_preheader_3;
reg [31:0] Conv_ond10_preheader_3_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_ond10_preheader_scevgep5;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_ond10_preheader_scevgep5_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_ond10_preheader_scevgep4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_ond10_preheader_scevgep4_reg;
reg [15:0] Conv_ond64_preheader_4;
reg [15:0] Conv_ond64_preheader_4_reg;
reg  Conv_ond64_preheader_5;
reg  Conv_ond64_preheader_5_reg;
reg [15:0] Conv_ond64_preheader_1;
reg [15:0] Conv_ond64_preheader_6;
reg [15:0] Conv_ond64_preheader_6_reg;
reg  Conv_ond64_preheader_7;
reg  Conv_ond64_preheader_7_reg;
reg [15:0] Conv_ond64_preheader_ref_tmp84_1;
reg [31:0] Conv_ond64_preheader_8;
reg [31:0] Conv_ond64_preheader_8_reg;
reg  Conv_ond64_preheader_exitcond7;
reg  Conv_ond64_preheader_exitcond7_reg;
reg [35:0] Conv_for_body26_9;
reg [35:0] Conv_for_body26_9_reg;
reg [35:0] Conv_for_body26_10;
reg [35:0] Conv_for_body26_10_reg;
reg [31:0] Conv_for_body26_n_0145;
reg [31:0] Conv_for_body26_n_0145_reg;
reg [31:0] Conv_for_body26_m_0144;
reg [31:0] Conv_for_body26_m_0144_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep;
reg [15:0] Conv_for_body26_11;
reg [15:0] Conv_for_body26_12;
reg [31:0] Conv_for_body26_13;
reg [31:0] Conv_for_body26_14;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_data_3_i_i;
reg [15:0] Conv_for_body26_15;
reg [15:0] Conv_for_body26_16;
reg [31:0] Conv_for_body26_17;
reg [31:0] Conv_for_body26_18;
reg [35:0] Conv_for_body26_19;
reg [15:0] Conv_for_body26_bit_select1;
reg [15:0] Conv_for_body26_bit_select1_reg;
reg [15:0] Conv_for_body26_20;
reg [15:0] Conv_for_body26_21;
reg [31:0] Conv_for_body26_22;
reg [31:0] Conv_for_body26_23;
reg [35:0] Conv_for_body26_24;
reg [15:0] Conv_for_body26_bit_select;
reg [15:0] Conv_for_body26_bit_select_reg;
reg  Conv_for_body26_cmp52;
reg [31:0] Conv_for_body26_add53;
reg [31:0] Conv_for_body26_add53_var0;
reg  Conv_for_body26_not_cmp54;
reg [31:0] Conv_for_body26_bit_concat;
reg [31:0] Conv_for_body26_cond59;
reg [31:0] Conv_for_inc95_26;
reg  Conv_for_inc95_exitcond10;
reg  _ZL13conv1_weights_a0_a0_a0_clken;
reg [3:0] _ZL13conv1_weights_a0_a0_a0_address_a;
wire [15:0] _ZL13conv1_weights_a0_a0_a0_read_data_a;
reg  _ZL13conv1_weights_a0_a0_a0_read_en_a;
reg  _ZL13conv1_weights_a1_a0_a0_clken;
reg [3:0] _ZL13conv1_weights_a1_a0_a0_address_a;
wire [15:0] _ZL13conv1_weights_a1_a0_a0_read_data_a;
reg  _ZL13conv1_weights_a1_a0_a0_read_en_a;
reg  for_loop__digit_recognition_h_56_21_valid_bit_0;
wire  for_loop__digit_recognition_h_56_21_state_stall_0;
reg  for_loop__digit_recognition_h_56_21_state_enable_0;
reg  for_loop__digit_recognition_h_56_21_valid_bit_1;
wire  for_loop__digit_recognition_h_56_21_state_stall_1;
reg  for_loop__digit_recognition_h_56_21_state_enable_1;
reg  for_loop__digit_recognition_h_56_21_valid_bit_2;
wire  for_loop__digit_recognition_h_56_21_state_stall_2;
reg  for_loop__digit_recognition_h_56_21_state_enable_2;
reg  for_loop__digit_recognition_h_56_21_valid_bit_3;
wire  for_loop__digit_recognition_h_56_21_state_stall_3;
reg  for_loop__digit_recognition_h_56_21_state_enable_3;
reg  for_loop__digit_recognition_h_56_21_II_counter;
reg  for_loop__digit_recognition_h_56_21_start;
reg  for_loop__digit_recognition_h_56_21_activate_pipeline;
reg [35:0] Conv_for_body26_9_reg_stage3;
reg [35:0] Conv_for_body26_10_reg_stage3;
reg [31:0] Conv_for_body26_m_0144_reg_stage1;
reg [15:0] Conv_for_body26_12_reg_stage2;
reg [31:0] Conv_for_body26_13_reg_stage1;
reg [31:0] Conv_for_body26_14_reg_stage1;
reg [35:0] Conv_for_body26_19_reg_stage4;
reg [15:0] Conv_for_body26_21_reg_stage2;
reg [35:0] Conv_for_body26_24_reg_stage4;
reg [31:0] Conv_for_body26_add53_var0_reg_stage1;
reg [31:0] Conv_for_body26_cond59_reg_stage2;
reg [31:0] for_loop__digit_recognition_h_56_21_inductionVar_stage0;
reg  for_loop__digit_recognition_h_56_21_pipeline_exit_cond;
reg  for_loop__digit_recognition_h_56_21_active;
reg  for_loop__digit_recognition_h_56_21_begin_pipeline;
reg  for_loop__digit_recognition_h_56_21_epilogue;
reg  for_loop__digit_recognition_h_56_21_pipeline_finish;
reg  for_loop__digit_recognition_h_56_21_pipeline_finishing;
reg  for_loop__digit_recognition_h_56_21_only_last_stage_enabled;
reg [2:0] for_loop__digit_recognition_h_56_21_num_active_iterations;
reg  for_loop__digit_recognition_h_56_21_inserting_new_iteration;
reg  for_loop__digit_recognition_h_56_21_pipeline_finish_reg;
reg  for_loop__digit_recognition_h_56_21_in_first_iteration_stage0;
reg  for_loop__digit_recognition_h_56_21_in_first_iteration_stage1;
reg  for_loop__digit_recognition_h_56_21_in_first_iteration_stage2;
wire  Conv_cond7_preheader_bit_concat7_bit_select_operand_2;
wire [2:0] Conv_cond7_preheader_bit_concat5_bit_select_operand_2;
wire [3:0] Conv_cond7_preheader_bit_concat3_bit_select_operand_2;
wire [1:0] Conv_ond64_preheader_5_op1_temp;
wire [1:0] Conv_ond64_preheader_7_op1_temp;
reg  conv1_output_a0_a0_a0_clken_sequential_cond;
reg  conv1_output_a0_a0_a1_clken_sequential_cond;
reg [15:0] _ZL13conv1_weights_a0_a0_a0_read_data_wire_a;
reg  _ZL13conv1_weights_a0_a0_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv1_weights_a0_a0_a0_address_a_reg;
reg  _ZL13conv1_weights_a0_a0_a0_address_a_reg_enable;
reg [15:0] classifier_input_read_data_wire_a;
reg  classifier_input_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_10_clock;
reg  legup_split_mult_signed_16_16_32_10_aclr;
reg  legup_split_mult_signed_16_16_32_10_clken;
reg [15:0] legup_split_mult_signed_16_16_32_10_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_10_datab;
wire [31:0] legup_split_mult_signed_16_16_32_10_result;
reg [31:0] legup_mult_Conv_for_body26_17_out_actual;
reg [31:0] legup_mult_Conv_for_body26_17_out;
reg  legup_mult_Conv_for_body26_17_en;
reg  legup_mult_Conv_for_body26_17_en_pipeline_cond;
reg [15:0] _ZL13conv1_weights_a1_a0_a0_read_data_wire_a;
reg  _ZL13conv1_weights_a1_a0_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv1_weights_a1_a0_a0_address_a_reg;
reg  _ZL13conv1_weights_a1_a0_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_11_clock;
reg  legup_split_mult_signed_16_16_32_11_aclr;
reg  legup_split_mult_signed_16_16_32_11_clken;
reg [15:0] legup_split_mult_signed_16_16_32_11_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_11_datab;
wire [31:0] legup_split_mult_signed_16_16_32_11_result;
reg [31:0] legup_mult_Conv_for_body26_22_out_actual;
reg [31:0] legup_mult_Conv_for_body26_22_out;
reg  legup_mult_Conv_for_body26_22_en;
reg  legup_mult_Conv_for_body26_22_en_pipeline_cond;
wire [30:0] Conv_for_body26_bit_concat_bit_select_operand_0;

/*   %17 = mul i32 %12, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_10 (
	.clock (legup_split_mult_signed_16_16_32_10_clock),
	.aclr (legup_split_mult_signed_16_16_32_10_aclr),
	.clken (legup_split_mult_signed_16_16_32_10_clken),
	.dataa (legup_split_mult_signed_16_16_32_10_dataa),
	.datab (legup_split_mult_signed_16_16_32_10_datab),
	.result (legup_split_mult_signed_16_16_32_10_result)
);

defparam
	legup_split_mult_signed_16_16_32_10.widtha = 16,
	legup_split_mult_signed_16_16_32_10.widthb = 16,
	legup_split_mult_signed_16_16_32_10.widthp = 32,
	legup_split_mult_signed_16_16_32_10.pipeline = 1,
	legup_split_mult_signed_16_16_32_10.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_10.preserve_module_hierarchy = 0;

/*   %22 = mul i32 %21, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_11 (
	.clock (legup_split_mult_signed_16_16_32_11_clock),
	.aclr (legup_split_mult_signed_16_16_32_11_aclr),
	.clken (legup_split_mult_signed_16_16_32_11_clken),
	.dataa (legup_split_mult_signed_16_16_32_11_dataa),
	.datab (legup_split_mult_signed_16_16_32_11_datab),
	.result (legup_split_mult_signed_16_16_32_11_result)
);

defparam
	legup_split_mult_signed_16_16_32_11.widtha = 16,
	legup_split_mult_signed_16_16_32_11.widthb = 16,
	legup_split_mult_signed_16_16_32_11.widthp = 32,
	legup_split_mult_signed_16_16_32_11.pipeline = 1,
	legup_split_mult_signed_16_16_32_11.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_11.preserve_module_hierarchy = 0;



// @_ZL13conv1_weights.a0.a0.a0 = internal unnamed_addr constant [9 x i16] [i16 -5964, i16 2722, i16 10185, i16 -5947, i16 7897, i16 7504, i16 -1286, i16 7953, i16 7181]
rom_single_port _ZL13conv1_weights_a0_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv1_weights_a0_a0_a0_clken ),
	.address_a( _ZL13conv1_weights_a0_a0_a0_address_a ),
	.read_data_a( _ZL13conv1_weights_a0_a0_a0_read_data_a )
);
defparam _ZL13conv1_weights_a0_a0_a0.width_a = 16;
defparam _ZL13conv1_weights_a0_a0_a0.widthad_a = 4;
defparam _ZL13conv1_weights_a0_a0_a0.numwords_a = 9;
defparam _ZL13conv1_weights_a0_a0_a0.latency = 1;
defparam _ZL13conv1_weights_a0_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv1_weights_a0_a0_a0.mem"};



// @_ZL13conv1_weights.a1.a0.a0 = internal unnamed_addr constant [9 x i16] [i16 9030, i16 4063, i16 1501, i16 -3259, i16 8236, i16 7337, i16 -9760, i16 -10733, i16 -3857]
rom_single_port _ZL13conv1_weights_a1_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv1_weights_a1_a0_a0_clken ),
	.address_a( _ZL13conv1_weights_a1_a0_a0_address_a ),
	.read_data_a( _ZL13conv1_weights_a1_a0_a0_read_data_a )
);
defparam _ZL13conv1_weights_a1_a0_a0.width_a = 16;
defparam _ZL13conv1_weights_a1_a0_a0.widthad_a = 4;
defparam _ZL13conv1_weights_a1_a0_a0.numwords_a = 9;
defparam _ZL13conv1_weights_a1_a0_a0.latency = 1;
defparam _ZL13conv1_weights_a1_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv1_weights_a1_a0_a0.mem"};


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
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_F_Conv_BB_for_cond10_preheader_5:
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_6;
LEGUP_F_Conv_BB_for_cond10_preheader_6:
		next_state = LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_10;
LEGUP_F_Conv_BB_for_cond64_preheader_7:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_8;
LEGUP_F_Conv_BB_for_cond64_preheader_8:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_9;
LEGUP_F_Conv_BB_for_cond64_preheader_9:
	if ((fsm_stall == 1'd0) && (Conv_ond64_preheader_exitcond7_reg == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_inc95_11;
	else if ((fsm_stall == 1'd0) && (Conv_ond64_preheader_exitcond7_reg == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_5;
LEGUP_F_Conv_BB_for_cond7_preheader_4:
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_5;
LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3:
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_for_end97_12:
		next_state = LEGUP_F_Conv_BB_for_end97_13;
LEGUP_F_Conv_BB_for_end97_13:
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
LEGUP_F_Conv_BB_for_inc95_11:
	if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond10 == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_end97_12;
	else if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond10 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd1))
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3;
LEGUP_F_Conv_BB_while_body_backedge_2:
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_10:
	if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_7;
	else if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_7;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
		Conv_while_body_0 = classifier_input_valid_read_data;
end
always @(*) begin
		Conv_while_body_1 = conv1_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_2 = (Conv_while_body_1 ^ 8'd1);
end
always @(*) begin
		Conv_while_body_and134 = (Conv_while_body_2 & Conv_while_body_0);
end
always @(*) begin
		Conv_while_body_tobool4 = (Conv_while_body_and134 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_11) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond10 == 1'd0))) */ begin
		Conv_cond7_preheader_r_0151 = Conv_for_inc95_26;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_11) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond10 == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
end
always @(*) begin
		Conv_cond7_preheader_bit_select6 = Conv_cond7_preheader_r_0151_reg[30:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_select4 = Conv_cond7_preheader_r_0151_reg[28:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_select2 = Conv_cond7_preheader_r_0151_reg[27:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_concat7 = {Conv_cond7_preheader_bit_select6[30:0], Conv_cond7_preheader_bit_concat7_bit_select_operand_2};
end
always @(*) begin
		Conv_cond7_preheader_bit_concat5 = {Conv_cond7_preheader_bit_select4[28:0], Conv_cond7_preheader_bit_concat5_bit_select_operand_2[2:0]};
end
always @(*) begin
		Conv_cond7_preheader_bit_concat3 = {Conv_cond7_preheader_bit_select2[27:0], Conv_cond7_preheader_bit_concat3_bit_select_operand_2[3:0]};
end
always @(*) begin
		Conv_cond7_preheader_sr_add = (Conv_cond7_preheader_bit_concat7 + Conv_cond7_preheader_bit_concat5);
end
always @(*) begin
		Conv_cond7_preheader_sr_add15 = (Conv_cond7_preheader_bit_concat3 + Conv_cond7_preheader_sr_add);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4)) begin
		Conv_cond7_preheader_sr_add15_reg <= Conv_cond7_preheader_sr_add15;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_ond10_preheader_c_0150 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_9) & (fsm_stall == 1'd0)) & (Conv_ond64_preheader_exitcond7_reg == 1'd0))) */ begin
		Conv_ond10_preheader_c_0150 = Conv_ond64_preheader_8_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_ond10_preheader_c_0150_reg <= Conv_ond10_preheader_c_0150;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_9) & (fsm_stall == 1'd0)) & (Conv_ond64_preheader_exitcond7_reg == 1'd0))) begin
		Conv_ond10_preheader_c_0150_reg <= Conv_ond10_preheader_c_0150;
	end
end
always @(*) begin
		Conv_ond10_preheader_3 = (Conv_cond7_preheader_sr_add15_reg + Conv_ond10_preheader_c_0150_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5)) begin
		Conv_ond10_preheader_3_reg <= Conv_ond10_preheader_3;
	end
end
always @(*) begin
		Conv_ond10_preheader_scevgep5 = (1'd0 + (2 * Conv_ond10_preheader_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6)) begin
		Conv_ond10_preheader_scevgep5_reg <= Conv_ond10_preheader_scevgep5;
	end
end
always @(*) begin
		Conv_ond10_preheader_scevgep4 = (1'd0 + (2 * Conv_ond10_preheader_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6)) begin
		Conv_ond10_preheader_scevgep4_reg <= Conv_ond10_preheader_scevgep4;
	end
end
always @(*) begin
		Conv_ond64_preheader_4 = (Conv_for_body26_bit_select1_reg + 16'd2);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_7)) begin
		Conv_ond64_preheader_4_reg <= Conv_ond64_preheader_4;
	end
end
always @(*) begin
		Conv_ond64_preheader_5 = ($signed(Conv_ond64_preheader_4) > $signed({14'd0,Conv_ond64_preheader_5_op1_temp}));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_7)) begin
		Conv_ond64_preheader_5_reg <= Conv_ond64_preheader_5;
	end
end
always @(*) begin
		Conv_ond64_preheader_1 = (Conv_ond64_preheader_5_reg ? Conv_ond64_preheader_4_reg : 16'd0);
end
always @(*) begin
		Conv_ond64_preheader_6 = (Conv_for_body26_bit_select_reg + $signed(-16'd3));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_7)) begin
		Conv_ond64_preheader_6_reg <= Conv_ond64_preheader_6;
	end
end
always @(*) begin
		Conv_ond64_preheader_7 = ($signed(Conv_ond64_preheader_6) > $signed({14'd0,Conv_ond64_preheader_7_op1_temp}));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_7)) begin
		Conv_ond64_preheader_7_reg <= Conv_ond64_preheader_7;
	end
end
always @(*) begin
		Conv_ond64_preheader_ref_tmp84_1 = (Conv_ond64_preheader_7_reg ? Conv_ond64_preheader_6_reg : 16'd0);
end
always @(*) begin
		Conv_ond64_preheader_8 = (Conv_ond10_preheader_c_0150_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_7)) begin
		Conv_ond64_preheader_8_reg <= Conv_ond64_preheader_8;
	end
end
always @(*) begin
		Conv_ond64_preheader_exitcond7 = (Conv_ond64_preheader_8 == 32'd26);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_7)) begin
		Conv_ond64_preheader_exitcond7_reg <= Conv_ond64_preheader_exitcond7;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_valid_bit_2 & for_loop__digit_recognition_h_56_21_in_first_iteration_stage2)) begin
		Conv_for_body26_9 = Conv_for_body26_9_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage2)) & for_loop__digit_recognition_h_56_21_state_enable_3)) begin
		Conv_for_body26_9 = Conv_for_body26_24;
	end
	else if (((for_loop__digit_recognition_h_56_21_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage2)) & ~(for_loop__digit_recognition_h_56_21_state_enable_3))) begin
		Conv_for_body26_9 = Conv_for_body26_24_reg_stage4;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_9 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_2) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_valid_bit_2 & for_loop__digit_recognition_h_56_21_in_first_iteration_stage2)) begin
		Conv_for_body26_10 = Conv_for_body26_10_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage2)) & for_loop__digit_recognition_h_56_21_state_enable_3)) begin
		Conv_for_body26_10 = Conv_for_body26_19;
	end
	else if (((for_loop__digit_recognition_h_56_21_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage2)) & ~(for_loop__digit_recognition_h_56_21_state_enable_3))) begin
		Conv_for_body26_10 = Conv_for_body26_19_reg_stage4;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_10 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_2) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_valid_bit_0 & for_loop__digit_recognition_h_56_21_in_first_iteration_stage0)) begin
		Conv_for_body26_n_0145 = Conv_for_body26_n_0145_reg;
	end
	else if ((for_loop__digit_recognition_h_56_21_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage0))) begin
		Conv_for_body26_n_0145 = Conv_for_body26_add53_var0_reg_stage1;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_n_0145 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_valid_bit_0 & for_loop__digit_recognition_h_56_21_in_first_iteration_stage0)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_m_0144_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage0)) & for_loop__digit_recognition_h_56_21_state_enable_1)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59;
	end
	else if (((for_loop__digit_recognition_h_56_21_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_in_first_iteration_stage0)) & ~(for_loop__digit_recognition_h_56_21_state_enable_1))) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_m_0144 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
end
always @(*) begin
		Conv_for_body26_scevgep2 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_11 = _ZL13conv1_weights_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_12 = $signed(Conv_for_body26_11);
end
always @(*) begin
		Conv_for_body26_13 = (Conv_ond10_preheader_c_0150_reg + Conv_for_body26_n_0145);
end
always @(*) begin
		Conv_for_body26_14 = (Conv_cond7_preheader_r_0151_reg + Conv_for_body26_m_0144);
end
always @(*) begin
		Conv_for_body26_data_3_i_i = (0 + ((56 * Conv_for_body26_14_reg_stage1) + (2 * Conv_for_body26_13_reg_stage1)));
end
always @(*) begin
		Conv_for_body26_15 = classifier_input_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_16 = $signed(Conv_for_body26_15);
end
always @(*) begin
	Conv_for_body26_17 = legup_mult_Conv_for_body26_17_out;
end
always @(*) begin
		Conv_for_body26_18 = $signed(Conv_for_body26_17);
end
always @(*) begin
		Conv_for_body26_19 = (Conv_for_body26_10_reg_stage3 + $signed({{4{Conv_for_body26_18[31]}},Conv_for_body26_18}));
end
always @(*) begin
		Conv_for_body26_bit_select1 = Conv_for_body26_19[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_3) begin
		Conv_for_body26_bit_select1_reg <= Conv_for_body26_bit_select1;
	end
end
always @(*) begin
		Conv_for_body26_20 = _ZL13conv1_weights_a1_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_21 = $signed(Conv_for_body26_20);
end
always @(*) begin
	Conv_for_body26_22 = legup_mult_Conv_for_body26_22_out;
end
always @(*) begin
		Conv_for_body26_23 = $signed(Conv_for_body26_22);
end
always @(*) begin
		Conv_for_body26_24 = (Conv_for_body26_9_reg_stage3 + $signed({{4{Conv_for_body26_23[31]}},Conv_for_body26_23}));
end
always @(*) begin
		Conv_for_body26_bit_select = Conv_for_body26_24[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_3) begin
		Conv_for_body26_bit_select_reg <= Conv_for_body26_bit_select;
	end
end
always @(*) begin
		Conv_for_body26_cmp52 = (Conv_for_body26_n_0145 == 32'd2);
end
always @(*) begin
		Conv_for_body26_add53 = (Conv_for_body26_n_0145 + 32'd1);
end
always @(*) begin
		Conv_for_body26_add53_var0 = (Conv_for_body26_cmp52 ? 32'd0 : Conv_for_body26_add53);
end
always @(*) begin
		Conv_for_body26_not_cmp54 = (Conv_for_body26_add53_var0_reg_stage1 == 32'd0);
end
always @(*) begin
		Conv_for_body26_bit_concat = {Conv_for_body26_bit_concat_bit_select_operand_0[30:0], Conv_for_body26_not_cmp54};
end
always @(*) begin
		Conv_for_body26_cond59 = (Conv_for_body26_bit_concat + Conv_for_body26_m_0144_reg_stage1);
end
always @(*) begin
		Conv_for_inc95_26 = (Conv_cond7_preheader_r_0151_reg + 32'd1);
end
always @(*) begin
		Conv_for_inc95_exitcond10 = (Conv_for_inc95_26 == 32'd26);
end
always @(*) begin
	_ZL13conv1_weights_a0_a0_a0_clken = _ZL13conv1_weights_a0_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv1_weights_a0_a0_a0_address_a = _ZL13conv1_weights_a0_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		_ZL13conv1_weights_a0_a0_a0_address_a = (Conv_for_body26_scevgep2 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv1_weights_a0_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		_ZL13conv1_weights_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv1_weights_a1_a0_a0_clken = _ZL13conv1_weights_a1_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv1_weights_a1_a0_a0_address_a = _ZL13conv1_weights_a1_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		_ZL13conv1_weights_a1_a0_a0_address_a = (Conv_for_body26_scevgep >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv1_weights_a1_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		_ZL13conv1_weights_a1_a0_a0_read_en_a = 1'd1;
	end
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_state_stall_0)) begin
		for_loop__digit_recognition_h_56_21_valid_bit_0 <= (for_loop__digit_recognition_h_56_21_II_counter & for_loop__digit_recognition_h_56_21_start);
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_valid_bit_0 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_state_stall_0 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_state_enable_0 = (for_loop__digit_recognition_h_56_21_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_state_stall_1)) begin
		for_loop__digit_recognition_h_56_21_valid_bit_1 <= for_loop__digit_recognition_h_56_21_state_enable_0;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_valid_bit_1 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_state_stall_1 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_state_enable_1 = (for_loop__digit_recognition_h_56_21_valid_bit_1 & ~(for_loop__digit_recognition_h_56_21_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_state_stall_2)) begin
		for_loop__digit_recognition_h_56_21_valid_bit_2 <= for_loop__digit_recognition_h_56_21_state_enable_1;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_valid_bit_2 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_state_stall_2 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_state_enable_2 = (for_loop__digit_recognition_h_56_21_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_state_stall_3)) begin
		for_loop__digit_recognition_h_56_21_valid_bit_3 <= for_loop__digit_recognition_h_56_21_state_enable_2;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_valid_bit_3 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_state_stall_3 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_state_enable_3 = (for_loop__digit_recognition_h_56_21_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_state_stall_3));
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_II_counter <= 1'd1;
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_start = (for_loop__digit_recognition_h_56_21_activate_pipeline | ((for_loop__digit_recognition_h_56_21_active & ~(for_loop__digit_recognition_h_56_21_epilogue)) & ~(for_loop__digit_recognition_h_56_21_pipeline_exit_cond)));
	if (reset) begin
		for_loop__digit_recognition_h_56_21_start = 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_activate_pipeline = (((fsm_stall == 1'd0) & for_loop__digit_recognition_h_56_21_begin_pipeline) & ~(for_loop__digit_recognition_h_56_21_active));
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_2) begin
		Conv_for_body26_9_reg_stage3 <= Conv_for_body26_9;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_2) begin
		Conv_for_body26_10_reg_stage3 <= Conv_for_body26_10;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		Conv_for_body26_m_0144_reg_stage1 <= Conv_for_body26_m_0144;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_1) begin
		Conv_for_body26_12_reg_stage2 <= Conv_for_body26_12;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		Conv_for_body26_13_reg_stage1 <= Conv_for_body26_13;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		Conv_for_body26_14_reg_stage1 <= Conv_for_body26_14;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_3) begin
		Conv_for_body26_19_reg_stage4 <= Conv_for_body26_19;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_1) begin
		Conv_for_body26_21_reg_stage2 <= Conv_for_body26_21;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_3) begin
		Conv_for_body26_24_reg_stage4 <= Conv_for_body26_24;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		Conv_for_body26_add53_var0_reg_stage1 <= Conv_for_body26_add53_var0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_1) begin
		Conv_for_body26_cond59_reg_stage2 <= Conv_for_body26_cond59;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_inductionVar_stage0 <= 0;
	end
	if (for_loop__digit_recognition_h_56_21_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_inductionVar_stage0 <= 0;
	end
	if ((for_loop__digit_recognition_h_56_21_II_counter & for_loop__digit_recognition_h_56_21_state_enable_0)) begin
		for_loop__digit_recognition_h_56_21_inductionVar_stage0 <= (for_loop__digit_recognition_h_56_21_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_pipeline_exit_cond = (for_loop__digit_recognition_h_56_21_state_enable_0 & (for_loop__digit_recognition_h_56_21_inductionVar_stage0 == 8));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_active <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_active <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_active <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_6) & (fsm_stall == 1'd0))) begin
		for_loop__digit_recognition_h_56_21_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_epilogue <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_pipeline_exit_cond & for_loop__digit_recognition_h_56_21_active)) begin
		for_loop__digit_recognition_h_56_21_epilogue <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_pipeline_finish = (for_loop__digit_recognition_h_56_21_pipeline_finishing | for_loop__digit_recognition_h_56_21_pipeline_finish_reg);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_pipeline_finishing = ((for_loop__digit_recognition_h_56_21_epilogue | for_loop__digit_recognition_h_56_21_pipeline_exit_cond) & for_loop__digit_recognition_h_56_21_only_last_stage_enabled);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_only_last_stage_enabled = ((for_loop__digit_recognition_h_56_21_num_active_iterations == 1'd1) & for_loop__digit_recognition_h_56_21_state_enable_3);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_num_active_iterations <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_inserting_new_iteration & ~(for_loop__digit_recognition_h_56_21_state_enable_3))) begin
		for_loop__digit_recognition_h_56_21_num_active_iterations <= (for_loop__digit_recognition_h_56_21_num_active_iterations + 1'd1);
	end
	if ((~(for_loop__digit_recognition_h_56_21_inserting_new_iteration) & for_loop__digit_recognition_h_56_21_state_enable_3)) begin
		for_loop__digit_recognition_h_56_21_num_active_iterations <= (for_loop__digit_recognition_h_56_21_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_inserting_new_iteration = ((~(for_loop__digit_recognition_h_56_21_state_stall_0) & for_loop__digit_recognition_h_56_21_II_counter) & for_loop__digit_recognition_h_56_21_start);
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_pipeline_finish_reg <= for_loop__digit_recognition_h_56_21_pipeline_finish;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		for_loop__digit_recognition_h_56_21_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_0) begin
		for_loop__digit_recognition_h_56_21_in_first_iteration_stage1 <= for_loop__digit_recognition_h_56_21_in_first_iteration_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_state_enable_1) begin
		for_loop__digit_recognition_h_56_21_in_first_iteration_stage2 <= for_loop__digit_recognition_h_56_21_in_first_iteration_stage1;
	end
end
assign Conv_cond7_preheader_bit_concat7_bit_select_operand_2 = 1'd0;
assign Conv_cond7_preheader_bit_concat5_bit_select_operand_2 = 3'd0;
assign Conv_cond7_preheader_bit_concat3_bit_select_operand_2 = 4'd0;
assign Conv_ond64_preheader_5_op1_temp = 16'd0;
assign Conv_ond64_preheader_7_op1_temp = 16'd0;
always @(*) begin
	conv1_output_a0_a0_a0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	conv1_output_a0_a0_a1_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	_ZL13conv1_weights_a0_a0_a0_read_data_wire_a = _ZL13conv1_weights_a0_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv1_weights_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv1_weights_a0_a0_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv1_weights_a0_a0_a0_address_a_reg_enable) begin
		_ZL13conv1_weights_a0_a0_a0_address_a_reg <= _ZL13conv1_weights_a0_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv1_weights_a0_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_state_enable_0;
end
always @(*) begin
	classifier_input_read_data_wire_a = classifier_input_read_data_a;
end
always @(*) begin
	classifier_input_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_state_stall_2);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clken = legup_mult_Conv_for_body26_17_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_dataa = Conv_for_body26_12_reg_stage2;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_datab = Conv_for_body26_16;
end
always @(*) begin
	legup_mult_Conv_for_body26_17_out_actual = legup_split_mult_signed_16_16_32_10_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_17_out = $signed(legup_mult_Conv_for_body26_17_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_17_en = legup_mult_Conv_for_body26_17_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_17_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_state_stall_3);
end
always @(*) begin
	_ZL13conv1_weights_a1_a0_a0_read_data_wire_a = _ZL13conv1_weights_a1_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv1_weights_a1_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv1_weights_a1_a0_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv1_weights_a1_a0_a0_address_a_reg_enable) begin
		_ZL13conv1_weights_a1_a0_a0_address_a_reg <= _ZL13conv1_weights_a1_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv1_weights_a1_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clken = legup_mult_Conv_for_body26_22_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_dataa = Conv_for_body26_21_reg_stage2;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_datab = Conv_for_body26_16;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_out_actual = legup_split_mult_signed_16_16_32_11_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_out = $signed(legup_mult_Conv_for_body26_22_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_22_en = legup_mult_Conv_for_body26_22_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_state_stall_3);
end
assign Conv_for_body26_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	classifier_input_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		classifier_input_valid_write_en = 1'd1;
	end
end
always @(*) begin
	classifier_input_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		classifier_input_valid_write_data = 8'd0;
	end
end
always @(*) begin
	conv1_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		conv1_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv1_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		conv1_output_valid_write_data = 8'd1;
	end
end
always @(*) begin
	conv1_output_a0_a0_a0_clken = conv1_output_a0_a0_a0_clken_sequential_cond;
end
always @(*) begin
	conv1_output_a0_a0_a0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		conv1_output_a0_a0_a0_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv1_output_a0_a0_a0_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		conv1_output_a0_a0_a0_write_data_a = Conv_ond64_preheader_1;
	end
end
assign conv1_output_a0_a0_a0_read_en_a = 1'd0;
always @(*) begin
	conv1_output_a0_a0_a0_address_a = 10'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		conv1_output_a0_a0_a0_address_a = (Conv_ond10_preheader_scevgep5_reg >>> 1'd1);
	end
end
always @(*) begin
	conv1_output_a0_a0_a1_clken = conv1_output_a0_a0_a1_clken_sequential_cond;
end
always @(*) begin
	conv1_output_a0_a0_a1_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		conv1_output_a0_a0_a1_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv1_output_a0_a0_a1_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		conv1_output_a0_a0_a1_write_data_a = Conv_ond64_preheader_ref_tmp84_1;
	end
end
assign conv1_output_a0_a0_a1_read_en_a = 1'd0;
always @(*) begin
	conv1_output_a0_a0_a1_address_a = 10'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		conv1_output_a0_a0_a1_address_a = (Conv_ond10_preheader_scevgep4_reg >>> 1'd1);
	end
end
always @(*) begin
	classifier_input_clken = classifier_input_clken_pipeline_cond;
end
always @(*) begin
	classifier_input_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_state_enable_1) begin
		classifier_input_read_en_a = 1'd1;
	end
end
always @(*) begin
	classifier_input_address_a = 10'd0;
	if (for_loop__digit_recognition_h_56_21_valid_bit_1) begin
		classifier_input_address_a = (Conv_for_body26_data_3_i_i >>> 1'd1);
	end
end
assign classifier_input_read_en_b = 1'd0;
assign classifier_input_address_b = 10'd0;

endmodule
`timescale 1 ns / 1 ns
module Maxpool
(
	clk,
	reset,
	start,
	ready,
	finish,
	conv1_output_valid_write_en,
	conv1_output_valid_write_data,
	conv1_output_valid_read_data,
	maxpool_output_valid_write_en,
	maxpool_output_valid_write_data,
	maxpool_output_valid_read_data,
	maxpool_output_a0_a0_a0_clken,
	maxpool_output_a0_a0_a0_write_en_a,
	maxpool_output_a0_a0_a0_write_data_a,
	maxpool_output_a0_a0_a0_read_en_a,
	maxpool_output_a0_a0_a0_address_a,
	maxpool_output_a0_a0_a0_read_data_a,
	maxpool_output_a0_a0_a1_clken,
	maxpool_output_a0_a0_a1_write_en_a,
	maxpool_output_a0_a0_a1_write_data_a,
	maxpool_output_a0_a0_a1_read_en_a,
	maxpool_output_a0_a0_a1_address_a,
	maxpool_output_a0_a0_a1_read_data_a,
	conv1_output_a0_a0_a0_clken,
	conv1_output_a0_a0_a0_write_en_a,
	conv1_output_a0_a0_a0_write_data_a,
	conv1_output_a0_a0_a0_read_en_a,
	conv1_output_a0_a0_a0_address_a,
	conv1_output_a0_a0_a0_read_data_a,
	conv1_output_a0_a0_a1_clken,
	conv1_output_a0_a0_a1_write_en_a,
	conv1_output_a0_a0_a1_write_data_a,
	conv1_output_a0_a0_a1_read_en_a,
	conv1_output_a0_a0_a1_address_a,
	conv1_output_a0_a0_a1_read_data_a
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_Maxpool_BB_while_body_1 = 4'd1;
parameter [3:0] LEGUP_F_Maxpool_BB_while_body_backedge_2 = 4'd2;
parameter [3:0] LEGUP_F_Maxpool_BB_for_cond7_preheader_preheader_3 = 4'd3;
parameter [3:0] LEGUP_F_Maxpool_BB_for_cond7_preheader_4 = 4'd4;
parameter [3:0] LEGUP_F_Maxpool_BB_for_body9_5 = 4'd5;
parameter [3:0] LEGUP_F_Maxpool_BB_for_body9_6 = 4'd6;
parameter [3:0] LEGUP_F_Maxpool_BB_for_cond47_preheader_7 = 4'd7;
parameter [3:0] LEGUP_F_Maxpool_BB_for_cond47_preheader_8 = 4'd8;
parameter [3:0] LEGUP_pipeline_wait_for_loop__digit_recognition_h_101_17_9 = 4'd9;
parameter [3:0] LEGUP_F_Maxpool_BB_for_inc61_10 = 4'd10;
parameter [3:0] LEGUP_F_Maxpool_BB_for_end63_11 = 4'd11;
parameter [3:0] LEGUP_F_Maxpool_BB_for_end63_12 = 4'd12;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  conv1_output_valid_write_en;
output reg [7:0] conv1_output_valid_write_data;
input [7:0] conv1_output_valid_read_data;
output reg  maxpool_output_valid_write_en;
output reg [7:0] maxpool_output_valid_write_data;
input [7:0] maxpool_output_valid_read_data;
output reg  maxpool_output_a0_a0_a0_clken;
output reg  maxpool_output_a0_a0_a0_write_en_a;
output reg [15:0] maxpool_output_a0_a0_a0_write_data_a;
output  maxpool_output_a0_a0_a0_read_en_a;
output reg [7:0] maxpool_output_a0_a0_a0_address_a;
input [15:0] maxpool_output_a0_a0_a0_read_data_a;
output reg  maxpool_output_a0_a0_a1_clken;
output reg  maxpool_output_a0_a0_a1_write_en_a;
output reg [15:0] maxpool_output_a0_a0_a1_write_data_a;
output  maxpool_output_a0_a0_a1_read_en_a;
output reg [7:0] maxpool_output_a0_a0_a1_address_a;
input [15:0] maxpool_output_a0_a0_a1_read_data_a;
output reg  conv1_output_a0_a0_a0_clken;
output  conv1_output_a0_a0_a0_write_en_a;
output [15:0] conv1_output_a0_a0_a0_write_data_a;
output reg  conv1_output_a0_a0_a0_read_en_a;
output reg [9:0] conv1_output_a0_a0_a0_address_a;
input [15:0] conv1_output_a0_a0_a0_read_data_a;
output reg  conv1_output_a0_a0_a1_clken;
output  conv1_output_a0_a0_a1_write_en_a;
output [15:0] conv1_output_a0_a0_a1_write_data_a;
output reg  conv1_output_a0_a0_a1_read_en_a;
output reg [9:0] conv1_output_a0_a0_a1_address_a;
input [15:0] conv1_output_a0_a0_a1_read_data_a;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;
reg [7:0] Maxpool_while_body_0;
reg [7:0] Maxpool_while_body_1;
reg [7:0] Maxpool_while_body_2;
reg [7:0] Maxpool_while_body_and88;
reg  Maxpool_while_body_tobool4;
reg [31:0] Maxpool_cond7_preheader_r_0104;
reg [31:0] Maxpool_cond7_preheader_r_0104_reg;
reg [29:0] Maxpool_cond7_preheader_bit_select12;
reg [28:0] Maxpool_cond7_preheader_bit_select10;
reg [30:0] Maxpool_cond7_preheader_bit_select8;
reg [31:0] Maxpool_cond7_preheader_bit_concat13;
reg [31:0] Maxpool_cond7_preheader_bit_concat11;
reg [31:0] Maxpool_cond7_preheader_sr_add;
reg [31:0] Maxpool_cond7_preheader_sr_add9;
reg [31:0] Maxpool_cond7_preheader_sr_add9_reg;
reg [31:0] Maxpool_cond7_preheader_bit_concat9;
reg [31:0] Maxpool_cond7_preheader_bit_concat9_reg;
reg [31:0] Maxpool_for_body9_c_0103;
reg [31:0] Maxpool_for_body9_c_0103_reg;
reg [30:0] Maxpool_for_body9_bit_select6;
reg [31:0] Maxpool_for_body9_3;
reg [31:0] Maxpool_for_body9_3_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Maxpool_for_body9_scevgep3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Maxpool_for_body9_scevgep3_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Maxpool_for_body9_scevgep;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Maxpool_for_body9_scevgep_reg;
reg [31:0] Maxpool_for_body9_bit_concat7;
reg [31:0] Maxpool_for_body9_bit_concat7_reg;
reg [31:0] Maxpool_ond47_preheader_4;
reg [31:0] Maxpool_ond47_preheader_4_reg;
reg  Maxpool_ond47_preheader_exitcond1;
reg  Maxpool_ond47_preheader_exitcond1_reg;
reg [15:0] Maxpool_for_body15_max_sroa_7_0;
reg [15:0] Maxpool_for_body15_max_sroa_7_0_reg;
reg [15:0] Maxpool_for_body15_max_sroa_0_0;
reg [15:0] Maxpool_for_body15_max_sroa_0_0_reg;
reg [31:0] Maxpool_for_body15_n_0101;
reg [31:0] Maxpool_for_body15_n_0101_reg;
reg [31:0] Maxpool_for_body15_m_0100;
reg [31:0] Maxpool_for_body15_m_0100_reg;
reg [31:0] Maxpool_for_body15_5;
reg [31:0] Maxpool_for_body15_6;
reg [30:0] Maxpool_for_body15_bit_select4;
reg [28:0] Maxpool_for_body15_bit_select2;
reg [27:0] Maxpool_for_body15_bit_select;
reg [31:0] Maxpool_for_body15_bit_concat5;
reg [31:0] Maxpool_for_body15_bit_concat3;
reg [31:0] Maxpool_for_body15_bit_concat1;
reg [31:0] Maxpool_for_body15_sr_add13;
reg [31:0] Maxpool_for_body15_sr_add14;
reg [31:0] Maxpool_for_body15_7;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Maxpool_for_body15_8;
reg [15:0] Maxpool_for_body15_9;
reg  Maxpool_for_body15_10;
reg [15:0] Maxpool_for_body15_sroa_speculated6;
reg [15:0] Maxpool_for_body15_sroa_speculated6_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Maxpool_for_body15_11;
reg [15:0] Maxpool_for_body15_12;
reg  Maxpool_for_body15_13;
reg [15:0] Maxpool_for_body15_sroa_speculated;
reg [15:0] Maxpool_for_body15_sroa_speculated_reg;
reg  Maxpool_for_body15_cmp32;
reg [31:0] Maxpool_for_body15_add35;
reg [31:0] Maxpool_for_body15_add35_var0;
reg  Maxpool_for_body15_not_cmp37;
reg [31:0] Maxpool_for_body15_bit_concat;
reg [31:0] Maxpool_for_body15_cond42;
reg [31:0] Maxpool_for_inc61_15;
reg  Maxpool_for_inc61_exitcond5;
reg  for_loop__digit_recognition_h_101_17_valid_bit_0;
wire  for_loop__digit_recognition_h_101_17_state_stall_0;
reg  for_loop__digit_recognition_h_101_17_state_enable_0;
reg  for_loop__digit_recognition_h_101_17_valid_bit_1;
wire  for_loop__digit_recognition_h_101_17_state_stall_1;
reg  for_loop__digit_recognition_h_101_17_state_enable_1;
reg  for_loop__digit_recognition_h_101_17_valid_bit_2;
wire  for_loop__digit_recognition_h_101_17_state_stall_2;
reg  for_loop__digit_recognition_h_101_17_state_enable_2;
reg  for_loop__digit_recognition_h_101_17_valid_bit_3;
wire  for_loop__digit_recognition_h_101_17_state_stall_3;
reg  for_loop__digit_recognition_h_101_17_state_enable_3;
reg  for_loop__digit_recognition_h_101_17_II_counter;
reg  for_loop__digit_recognition_h_101_17_start;
reg  for_loop__digit_recognition_h_101_17_activate_pipeline;
reg [15:0] Maxpool_for_body15_max_sroa_7_0_reg_stage3;
reg [15:0] Maxpool_for_body15_max_sroa_0_0_reg_stage3;
reg [31:0] Maxpool_for_body15_m_0100_reg_stage1;
reg [31:0] Maxpool_for_body15_5_reg_stage1;
reg [31:0] Maxpool_for_body15_bit_concat1_reg_stage1;
reg [31:0] Maxpool_for_body15_sr_add13_reg_stage1;
reg [31:0] Maxpool_for_body15_7_reg_stage2;
reg [15:0] Maxpool_for_body15_sroa_speculated6_reg_stage4;
reg [15:0] Maxpool_for_body15_sroa_speculated_reg_stage4;
reg [31:0] Maxpool_for_body15_add35_var0_reg_stage1;
reg [31:0] Maxpool_for_body15_cond42_reg_stage2;
reg [31:0] for_loop__digit_recognition_h_101_17_inductionVar_stage0;
reg  for_loop__digit_recognition_h_101_17_pipeline_exit_cond;
reg  for_loop__digit_recognition_h_101_17_active;
reg  for_loop__digit_recognition_h_101_17_begin_pipeline;
reg  for_loop__digit_recognition_h_101_17_epilogue;
reg  for_loop__digit_recognition_h_101_17_pipeline_finish;
reg  for_loop__digit_recognition_h_101_17_pipeline_finishing;
reg  for_loop__digit_recognition_h_101_17_only_last_stage_enabled;
reg [2:0] for_loop__digit_recognition_h_101_17_num_active_iterations;
reg  for_loop__digit_recognition_h_101_17_inserting_new_iteration;
reg  for_loop__digit_recognition_h_101_17_pipeline_finish_reg;
reg  for_loop__digit_recognition_h_101_17_in_first_iteration_stage0;
reg  for_loop__digit_recognition_h_101_17_in_first_iteration_stage1;
reg  for_loop__digit_recognition_h_101_17_in_first_iteration_stage2;
wire [1:0] Maxpool_cond7_preheader_bit_concat13_bit_select_operand_2;
wire [2:0] Maxpool_cond7_preheader_bit_concat11_bit_select_operand_2;
wire  Maxpool_cond7_preheader_bit_concat9_bit_select_operand_2;
wire  Maxpool_for_body9_bit_concat7_bit_select_operand_2;
reg  maxpool_output_a0_a0_a0_clken_sequential_cond;
reg  maxpool_output_a0_a0_a1_clken_sequential_cond;
wire  Maxpool_for_body15_bit_concat5_bit_select_operand_2;
wire [2:0] Maxpool_for_body15_bit_concat3_bit_select_operand_2;
wire [3:0] Maxpool_for_body15_bit_concat1_bit_select_operand_2;
reg [15:0] conv1_output_a0_a0_a0_read_data_wire_a;
reg  conv1_output_a0_a0_a0_clken_pipeline_cond;
reg [15:0] conv1_output_a0_a0_a1_read_data_wire_a;
reg  conv1_output_a0_a0_a1_clken_pipeline_cond;
wire [30:0] Maxpool_for_body15_bit_concat_bit_select_operand_0;


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
		next_state = LEGUP_F_Maxpool_BB_while_body_1;
LEGUP_F_Maxpool_BB_for_body9_5:
		next_state = LEGUP_F_Maxpool_BB_for_body9_6;
LEGUP_F_Maxpool_BB_for_body9_6:
		next_state = LEGUP_pipeline_wait_for_loop__digit_recognition_h_101_17_9;
LEGUP_F_Maxpool_BB_for_cond47_preheader_7:
		next_state = LEGUP_F_Maxpool_BB_for_cond47_preheader_8;
LEGUP_F_Maxpool_BB_for_cond47_preheader_8:
	if ((fsm_stall == 1'd0) && (Maxpool_ond47_preheader_exitcond1_reg == 1'd1))
		next_state = LEGUP_F_Maxpool_BB_for_inc61_10;
	else if ((fsm_stall == 1'd0) && (Maxpool_ond47_preheader_exitcond1_reg == 1'd0))
		next_state = LEGUP_F_Maxpool_BB_for_body9_5;
LEGUP_F_Maxpool_BB_for_cond7_preheader_4:
		next_state = LEGUP_F_Maxpool_BB_for_body9_5;
LEGUP_F_Maxpool_BB_for_cond7_preheader_preheader_3:
		next_state = LEGUP_F_Maxpool_BB_for_cond7_preheader_4;
LEGUP_F_Maxpool_BB_for_end63_11:
		next_state = LEGUP_F_Maxpool_BB_for_end63_12;
LEGUP_F_Maxpool_BB_for_end63_12:
		next_state = LEGUP_F_Maxpool_BB_while_body_backedge_2;
LEGUP_F_Maxpool_BB_for_inc61_10:
	if ((fsm_stall == 1'd0) && (Maxpool_for_inc61_exitcond5 == 1'd1))
		next_state = LEGUP_F_Maxpool_BB_for_end63_11;
	else if ((fsm_stall == 1'd0) && (Maxpool_for_inc61_exitcond5 == 1'd0))
		next_state = LEGUP_F_Maxpool_BB_for_cond7_preheader_4;
LEGUP_F_Maxpool_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (Maxpool_while_body_tobool4 == 1'd1))
		next_state = LEGUP_F_Maxpool_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (Maxpool_while_body_tobool4 == 1'd0))
		next_state = LEGUP_F_Maxpool_BB_for_cond7_preheader_preheader_3;
LEGUP_F_Maxpool_BB_while_body_backedge_2:
		next_state = LEGUP_F_Maxpool_BB_while_body_1;
LEGUP_pipeline_wait_for_loop__digit_recognition_h_101_17_9:
	if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_101_17_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Maxpool_BB_for_cond47_preheader_7;
	else if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_101_17_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Maxpool_BB_for_cond47_preheader_7;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
		Maxpool_while_body_0 = conv1_output_valid_read_data;
end
always @(*) begin
		Maxpool_while_body_1 = maxpool_output_valid_read_data;
end
always @(*) begin
		Maxpool_while_body_2 = (Maxpool_while_body_1 ^ 8'd1);
end
always @(*) begin
		Maxpool_while_body_and88 = (Maxpool_while_body_2 & Maxpool_while_body_0);
end
always @(*) begin
		Maxpool_while_body_tobool4 = (Maxpool_while_body_and88 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_Maxpool_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Maxpool_cond7_preheader_r_0104 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Maxpool_BB_for_inc61_10) & (fsm_stall == 1'd0)) & (Maxpool_for_inc61_exitcond5 == 1'd0))) */ begin
		Maxpool_cond7_preheader_r_0104 = Maxpool_for_inc61_15;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Maxpool_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Maxpool_cond7_preheader_r_0104_reg <= Maxpool_cond7_preheader_r_0104;
	end
	if ((((cur_state == LEGUP_F_Maxpool_BB_for_inc61_10) & (fsm_stall == 1'd0)) & (Maxpool_for_inc61_exitcond5 == 1'd0))) begin
		Maxpool_cond7_preheader_r_0104_reg <= Maxpool_cond7_preheader_r_0104;
	end
end
always @(*) begin
		Maxpool_cond7_preheader_bit_select12 = Maxpool_cond7_preheader_r_0104_reg[29:0];
end
always @(*) begin
		Maxpool_cond7_preheader_bit_select10 = Maxpool_cond7_preheader_r_0104_reg[28:0];
end
always @(*) begin
		Maxpool_cond7_preheader_bit_select8 = Maxpool_cond7_preheader_r_0104_reg[30:0];
end
always @(*) begin
		Maxpool_cond7_preheader_bit_concat13 = {Maxpool_cond7_preheader_bit_select12[29:0], Maxpool_cond7_preheader_bit_concat13_bit_select_operand_2[1:0]};
end
always @(*) begin
		Maxpool_cond7_preheader_bit_concat11 = {Maxpool_cond7_preheader_bit_select10[28:0], Maxpool_cond7_preheader_bit_concat11_bit_select_operand_2[2:0]};
end
always @(*) begin
		Maxpool_cond7_preheader_sr_add = (Maxpool_cond7_preheader_r_0104_reg + Maxpool_cond7_preheader_bit_concat13);
end
always @(*) begin
		Maxpool_cond7_preheader_sr_add9 = (Maxpool_cond7_preheader_bit_concat11 + Maxpool_cond7_preheader_sr_add);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond7_preheader_4)) begin
		Maxpool_cond7_preheader_sr_add9_reg <= Maxpool_cond7_preheader_sr_add9;
	end
end
always @(*) begin
		Maxpool_cond7_preheader_bit_concat9 = {Maxpool_cond7_preheader_bit_select8[30:0], Maxpool_cond7_preheader_bit_concat9_bit_select_operand_2};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond7_preheader_4)) begin
		Maxpool_cond7_preheader_bit_concat9_reg <= Maxpool_cond7_preheader_bit_concat9;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Maxpool_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Maxpool_for_body9_c_0103 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_8) & (fsm_stall == 1'd0)) & (Maxpool_ond47_preheader_exitcond1_reg == 1'd0))) */ begin
		Maxpool_for_body9_c_0103 = Maxpool_ond47_preheader_4_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Maxpool_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Maxpool_for_body9_c_0103_reg <= Maxpool_for_body9_c_0103;
	end
	if ((((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_8) & (fsm_stall == 1'd0)) & (Maxpool_ond47_preheader_exitcond1_reg == 1'd0))) begin
		Maxpool_for_body9_c_0103_reg <= Maxpool_for_body9_c_0103;
	end
end
always @(*) begin
		Maxpool_for_body9_bit_select6 = Maxpool_for_body9_c_0103_reg[30:0];
end
always @(*) begin
		Maxpool_for_body9_3 = (Maxpool_cond7_preheader_sr_add9_reg + Maxpool_for_body9_c_0103_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_body9_5)) begin
		Maxpool_for_body9_3_reg <= Maxpool_for_body9_3;
	end
end
always @(*) begin
		Maxpool_for_body9_scevgep3 = (1'd0 + (2 * Maxpool_for_body9_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_body9_6)) begin
		Maxpool_for_body9_scevgep3_reg <= Maxpool_for_body9_scevgep3;
	end
end
always @(*) begin
		Maxpool_for_body9_scevgep = (1'd0 + (2 * Maxpool_for_body9_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_body9_6)) begin
		Maxpool_for_body9_scevgep_reg <= Maxpool_for_body9_scevgep;
	end
end
always @(*) begin
		Maxpool_for_body9_bit_concat7 = {Maxpool_for_body9_bit_select6[30:0], Maxpool_for_body9_bit_concat7_bit_select_operand_2};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_body9_5)) begin
		Maxpool_for_body9_bit_concat7_reg <= Maxpool_for_body9_bit_concat7;
	end
end
always @(*) begin
		Maxpool_ond47_preheader_4 = (Maxpool_for_body9_c_0103_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		Maxpool_ond47_preheader_4_reg <= Maxpool_ond47_preheader_4;
	end
end
always @(*) begin
		Maxpool_ond47_preheader_exitcond1 = (Maxpool_ond47_preheader_4 == 32'd13);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		Maxpool_ond47_preheader_exitcond1_reg <= Maxpool_ond47_preheader_exitcond1;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_101_17_valid_bit_2 & for_loop__digit_recognition_h_101_17_in_first_iteration_stage2)) begin
		Maxpool_for_body15_max_sroa_7_0 = Maxpool_for_body15_max_sroa_7_0_reg;
	end
	else if (((for_loop__digit_recognition_h_101_17_valid_bit_2 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage2)) & for_loop__digit_recognition_h_101_17_state_enable_3)) begin
		Maxpool_for_body15_max_sroa_7_0 = Maxpool_for_body15_sroa_speculated;
	end
	else if (((for_loop__digit_recognition_h_101_17_valid_bit_2 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage2)) & ~(for_loop__digit_recognition_h_101_17_state_enable_3))) begin
		Maxpool_for_body15_max_sroa_7_0 = Maxpool_for_body15_sroa_speculated_reg_stage4;
	end
	else /* if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) */ begin
		Maxpool_for_body15_max_sroa_7_0 = -16'd32768;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_2) begin
		Maxpool_for_body15_max_sroa_7_0_reg <= Maxpool_for_body15_max_sroa_7_0;
	end
	if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) begin
		Maxpool_for_body15_max_sroa_7_0_reg <= Maxpool_for_body15_max_sroa_7_0;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_101_17_valid_bit_2 & for_loop__digit_recognition_h_101_17_in_first_iteration_stage2)) begin
		Maxpool_for_body15_max_sroa_0_0 = Maxpool_for_body15_max_sroa_0_0_reg;
	end
	else if (((for_loop__digit_recognition_h_101_17_valid_bit_2 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage2)) & for_loop__digit_recognition_h_101_17_state_enable_3)) begin
		Maxpool_for_body15_max_sroa_0_0 = Maxpool_for_body15_sroa_speculated6;
	end
	else if (((for_loop__digit_recognition_h_101_17_valid_bit_2 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage2)) & ~(for_loop__digit_recognition_h_101_17_state_enable_3))) begin
		Maxpool_for_body15_max_sroa_0_0 = Maxpool_for_body15_sroa_speculated6_reg_stage4;
	end
	else /* if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) */ begin
		Maxpool_for_body15_max_sroa_0_0 = -16'd32768;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_2) begin
		Maxpool_for_body15_max_sroa_0_0_reg <= Maxpool_for_body15_max_sroa_0_0;
	end
	if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) begin
		Maxpool_for_body15_max_sroa_0_0_reg <= Maxpool_for_body15_max_sroa_0_0;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_101_17_valid_bit_0 & for_loop__digit_recognition_h_101_17_in_first_iteration_stage0)) begin
		Maxpool_for_body15_n_0101 = Maxpool_for_body15_n_0101_reg;
	end
	else if ((for_loop__digit_recognition_h_101_17_valid_bit_0 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage0))) begin
		Maxpool_for_body15_n_0101 = Maxpool_for_body15_add35_var0_reg_stage1;
	end
	else /* if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) */ begin
		Maxpool_for_body15_n_0101 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_n_0101_reg <= Maxpool_for_body15_n_0101;
	end
	if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) begin
		Maxpool_for_body15_n_0101_reg <= Maxpool_for_body15_n_0101;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_101_17_valid_bit_0 & for_loop__digit_recognition_h_101_17_in_first_iteration_stage0)) begin
		Maxpool_for_body15_m_0100 = Maxpool_for_body15_m_0100_reg;
	end
	else if (((for_loop__digit_recognition_h_101_17_valid_bit_0 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage0)) & for_loop__digit_recognition_h_101_17_state_enable_1)) begin
		Maxpool_for_body15_m_0100 = Maxpool_for_body15_cond42;
	end
	else if (((for_loop__digit_recognition_h_101_17_valid_bit_0 & ~(for_loop__digit_recognition_h_101_17_in_first_iteration_stage0)) & ~(for_loop__digit_recognition_h_101_17_state_enable_1))) begin
		Maxpool_for_body15_m_0100 = Maxpool_for_body15_cond42_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) */ begin
		Maxpool_for_body15_m_0100 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_m_0100_reg <= Maxpool_for_body15_m_0100;
	end
	if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) begin
		Maxpool_for_body15_m_0100_reg <= Maxpool_for_body15_m_0100;
	end
end
always @(*) begin
		Maxpool_for_body15_5 = (Maxpool_for_body9_bit_concat7_reg + Maxpool_for_body15_n_0101);
end
always @(*) begin
		Maxpool_for_body15_6 = (Maxpool_cond7_preheader_bit_concat9_reg + Maxpool_for_body15_m_0100);
end
always @(*) begin
		Maxpool_for_body15_bit_select4 = Maxpool_for_body15_6[30:0];
end
always @(*) begin
		Maxpool_for_body15_bit_select2 = Maxpool_for_body15_6[28:0];
end
always @(*) begin
		Maxpool_for_body15_bit_select = Maxpool_for_body15_6[27:0];
end
always @(*) begin
		Maxpool_for_body15_bit_concat5 = {Maxpool_for_body15_bit_select4[30:0], Maxpool_for_body15_bit_concat5_bit_select_operand_2};
end
always @(*) begin
		Maxpool_for_body15_bit_concat3 = {Maxpool_for_body15_bit_select2[28:0], Maxpool_for_body15_bit_concat3_bit_select_operand_2[2:0]};
end
always @(*) begin
		Maxpool_for_body15_bit_concat1 = {Maxpool_for_body15_bit_select[27:0], Maxpool_for_body15_bit_concat1_bit_select_operand_2[3:0]};
end
always @(*) begin
		Maxpool_for_body15_sr_add13 = (Maxpool_for_body15_bit_concat5 + Maxpool_for_body15_bit_concat3);
end
always @(*) begin
		Maxpool_for_body15_sr_add14 = (Maxpool_for_body15_bit_concat1_reg_stage1 + Maxpool_for_body15_sr_add13_reg_stage1);
end
always @(*) begin
		Maxpool_for_body15_7 = (Maxpool_for_body15_5_reg_stage1 + Maxpool_for_body15_sr_add14);
end
always @(*) begin
		Maxpool_for_body15_8 = (1'd0 + (2 * Maxpool_for_body15_7_reg_stage2));
end
always @(*) begin
		Maxpool_for_body15_9 = conv1_output_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Maxpool_for_body15_10 = ($signed(Maxpool_for_body15_9) > $signed(Maxpool_for_body15_max_sroa_0_0_reg_stage3));
end
always @(*) begin
		Maxpool_for_body15_sroa_speculated6 = (Maxpool_for_body15_10 ? Maxpool_for_body15_9 : Maxpool_for_body15_max_sroa_0_0_reg_stage3);
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_3) begin
		Maxpool_for_body15_sroa_speculated6_reg <= Maxpool_for_body15_sroa_speculated6;
	end
end
always @(*) begin
		Maxpool_for_body15_11 = (1'd0 + (2 * Maxpool_for_body15_7_reg_stage2));
end
always @(*) begin
		Maxpool_for_body15_12 = conv1_output_a0_a0_a1_read_data_wire_a;
end
always @(*) begin
		Maxpool_for_body15_13 = ($signed(Maxpool_for_body15_12) > $signed(Maxpool_for_body15_max_sroa_7_0_reg_stage3));
end
always @(*) begin
		Maxpool_for_body15_sroa_speculated = (Maxpool_for_body15_13 ? Maxpool_for_body15_12 : Maxpool_for_body15_max_sroa_7_0_reg_stage3);
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_3) begin
		Maxpool_for_body15_sroa_speculated_reg <= Maxpool_for_body15_sroa_speculated;
	end
end
always @(*) begin
		Maxpool_for_body15_cmp32 = (Maxpool_for_body15_n_0101 == 32'd1);
end
always @(*) begin
		Maxpool_for_body15_add35 = (Maxpool_for_body15_n_0101 + 32'd1);
end
always @(*) begin
		Maxpool_for_body15_add35_var0 = (Maxpool_for_body15_cmp32 ? 32'd0 : Maxpool_for_body15_add35);
end
always @(*) begin
		Maxpool_for_body15_not_cmp37 = (Maxpool_for_body15_add35_var0_reg_stage1 == 32'd0);
end
always @(*) begin
		Maxpool_for_body15_bit_concat = {Maxpool_for_body15_bit_concat_bit_select_operand_0[30:0], Maxpool_for_body15_not_cmp37};
end
always @(*) begin
		Maxpool_for_body15_cond42 = (Maxpool_for_body15_bit_concat + Maxpool_for_body15_m_0100_reg_stage1);
end
always @(*) begin
		Maxpool_for_inc61_15 = (Maxpool_cond7_preheader_r_0104_reg + 32'd1);
end
always @(*) begin
		Maxpool_for_inc61_exitcond5 = (Maxpool_for_inc61_15 == 32'd13);
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_101_17_state_stall_0)) begin
		for_loop__digit_recognition_h_101_17_valid_bit_0 <= (for_loop__digit_recognition_h_101_17_II_counter & for_loop__digit_recognition_h_101_17_start);
	end
	if (reset) begin
		for_loop__digit_recognition_h_101_17_valid_bit_0 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_101_17_state_stall_0 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_101_17_state_enable_0 = (for_loop__digit_recognition_h_101_17_valid_bit_0 & ~(for_loop__digit_recognition_h_101_17_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_101_17_state_stall_1)) begin
		for_loop__digit_recognition_h_101_17_valid_bit_1 <= for_loop__digit_recognition_h_101_17_state_enable_0;
	end
	if (reset) begin
		for_loop__digit_recognition_h_101_17_valid_bit_1 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_101_17_state_stall_1 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_101_17_state_enable_1 = (for_loop__digit_recognition_h_101_17_valid_bit_1 & ~(for_loop__digit_recognition_h_101_17_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_101_17_state_stall_2)) begin
		for_loop__digit_recognition_h_101_17_valid_bit_2 <= for_loop__digit_recognition_h_101_17_state_enable_1;
	end
	if (reset) begin
		for_loop__digit_recognition_h_101_17_valid_bit_2 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_101_17_state_stall_2 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_101_17_state_enable_2 = (for_loop__digit_recognition_h_101_17_valid_bit_2 & ~(for_loop__digit_recognition_h_101_17_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_101_17_state_stall_3)) begin
		for_loop__digit_recognition_h_101_17_valid_bit_3 <= for_loop__digit_recognition_h_101_17_state_enable_2;
	end
	if (reset) begin
		for_loop__digit_recognition_h_101_17_valid_bit_3 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_101_17_state_stall_3 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_101_17_state_enable_3 = (for_loop__digit_recognition_h_101_17_valid_bit_3 & ~(for_loop__digit_recognition_h_101_17_state_stall_3));
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_101_17_II_counter <= 1'd1;
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_start = (for_loop__digit_recognition_h_101_17_activate_pipeline | ((for_loop__digit_recognition_h_101_17_active & ~(for_loop__digit_recognition_h_101_17_epilogue)) & ~(for_loop__digit_recognition_h_101_17_pipeline_exit_cond)));
	if (reset) begin
		for_loop__digit_recognition_h_101_17_start = 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_activate_pipeline = (((fsm_stall == 1'd0) & for_loop__digit_recognition_h_101_17_begin_pipeline) & ~(for_loop__digit_recognition_h_101_17_active));
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_2) begin
		Maxpool_for_body15_max_sroa_7_0_reg_stage3 <= Maxpool_for_body15_max_sroa_7_0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_2) begin
		Maxpool_for_body15_max_sroa_0_0_reg_stage3 <= Maxpool_for_body15_max_sroa_0_0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_m_0100_reg_stage1 <= Maxpool_for_body15_m_0100;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_5_reg_stage1 <= Maxpool_for_body15_5;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_bit_concat1_reg_stage1 <= Maxpool_for_body15_bit_concat1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_sr_add13_reg_stage1 <= Maxpool_for_body15_sr_add13;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_1) begin
		Maxpool_for_body15_7_reg_stage2 <= Maxpool_for_body15_7;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_3) begin
		Maxpool_for_body15_sroa_speculated6_reg_stage4 <= Maxpool_for_body15_sroa_speculated6;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_3) begin
		Maxpool_for_body15_sroa_speculated_reg_stage4 <= Maxpool_for_body15_sroa_speculated;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		Maxpool_for_body15_add35_var0_reg_stage1 <= Maxpool_for_body15_add35_var0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_1) begin
		Maxpool_for_body15_cond42_reg_stage2 <= Maxpool_for_body15_cond42;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_101_17_inductionVar_stage0 <= 0;
	end
	if (for_loop__digit_recognition_h_101_17_activate_pipeline) begin
		for_loop__digit_recognition_h_101_17_inductionVar_stage0 <= 0;
	end
	if ((for_loop__digit_recognition_h_101_17_II_counter & for_loop__digit_recognition_h_101_17_state_enable_0)) begin
		for_loop__digit_recognition_h_101_17_inductionVar_stage0 <= (for_loop__digit_recognition_h_101_17_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_pipeline_exit_cond = (for_loop__digit_recognition_h_101_17_state_enable_0 & (for_loop__digit_recognition_h_101_17_inductionVar_stage0 == 3));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_101_17_active <= 1'd0;
	end
	if (for_loop__digit_recognition_h_101_17_activate_pipeline) begin
		for_loop__digit_recognition_h_101_17_active <= 1'd1;
	end
	if (for_loop__digit_recognition_h_101_17_pipeline_finishing) begin
		for_loop__digit_recognition_h_101_17_active <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop__digit_recognition_h_101_17_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_Maxpool_BB_for_body9_6) & (fsm_stall == 1'd0))) begin
		for_loop__digit_recognition_h_101_17_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_101_17_epilogue <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_101_17_pipeline_exit_cond & for_loop__digit_recognition_h_101_17_active)) begin
		for_loop__digit_recognition_h_101_17_epilogue <= 1'd1;
	end
	if (for_loop__digit_recognition_h_101_17_pipeline_finishing) begin
		for_loop__digit_recognition_h_101_17_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_pipeline_finish = (for_loop__digit_recognition_h_101_17_pipeline_finishing | for_loop__digit_recognition_h_101_17_pipeline_finish_reg);
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_pipeline_finishing = ((for_loop__digit_recognition_h_101_17_epilogue | for_loop__digit_recognition_h_101_17_pipeline_exit_cond) & for_loop__digit_recognition_h_101_17_only_last_stage_enabled);
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_only_last_stage_enabled = ((for_loop__digit_recognition_h_101_17_num_active_iterations == 1'd1) & for_loop__digit_recognition_h_101_17_state_enable_3);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_101_17_num_active_iterations <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_101_17_inserting_new_iteration & ~(for_loop__digit_recognition_h_101_17_state_enable_3))) begin
		for_loop__digit_recognition_h_101_17_num_active_iterations <= (for_loop__digit_recognition_h_101_17_num_active_iterations + 1'd1);
	end
	if ((~(for_loop__digit_recognition_h_101_17_inserting_new_iteration) & for_loop__digit_recognition_h_101_17_state_enable_3)) begin
		for_loop__digit_recognition_h_101_17_num_active_iterations <= (for_loop__digit_recognition_h_101_17_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_101_17_inserting_new_iteration = ((~(for_loop__digit_recognition_h_101_17_state_stall_0) & for_loop__digit_recognition_h_101_17_II_counter) & for_loop__digit_recognition_h_101_17_start);
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_101_17_pipeline_finish_reg <= for_loop__digit_recognition_h_101_17_pipeline_finish;
	if (reset) begin
		for_loop__digit_recognition_h_101_17_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop__digit_recognition_h_101_17_activate_pipeline) begin
		for_loop__digit_recognition_h_101_17_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_activate_pipeline) begin
		for_loop__digit_recognition_h_101_17_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		for_loop__digit_recognition_h_101_17_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_0) begin
		for_loop__digit_recognition_h_101_17_in_first_iteration_stage1 <= for_loop__digit_recognition_h_101_17_in_first_iteration_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_101_17_state_enable_1) begin
		for_loop__digit_recognition_h_101_17_in_first_iteration_stage2 <= for_loop__digit_recognition_h_101_17_in_first_iteration_stage1;
	end
end
assign Maxpool_cond7_preheader_bit_concat13_bit_select_operand_2 = 2'd0;
assign Maxpool_cond7_preheader_bit_concat11_bit_select_operand_2 = 3'd0;
assign Maxpool_cond7_preheader_bit_concat9_bit_select_operand_2 = 1'd0;
assign Maxpool_for_body9_bit_concat7_bit_select_operand_2 = 1'd0;
always @(*) begin
	maxpool_output_a0_a0_a0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	maxpool_output_a0_a0_a1_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign Maxpool_for_body15_bit_concat5_bit_select_operand_2 = 1'd0;
assign Maxpool_for_body15_bit_concat3_bit_select_operand_2 = 3'd0;
assign Maxpool_for_body15_bit_concat1_bit_select_operand_2 = 4'd0;
always @(*) begin
	conv1_output_a0_a0_a0_read_data_wire_a = conv1_output_a0_a0_a0_read_data_a;
end
always @(*) begin
	conv1_output_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_101_17_state_stall_3);
end
always @(*) begin
	conv1_output_a0_a0_a1_read_data_wire_a = conv1_output_a0_a0_a1_read_data_a;
end
always @(*) begin
	conv1_output_a0_a0_a1_clken_pipeline_cond = ~(for_loop__digit_recognition_h_101_17_state_stall_3);
end
assign Maxpool_for_body15_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	conv1_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_end63_11)) begin
		conv1_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv1_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_end63_11)) begin
		conv1_output_valid_write_data = 8'd0;
	end
end
always @(*) begin
	maxpool_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_end63_11)) begin
		maxpool_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	maxpool_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_end63_11)) begin
		maxpool_output_valid_write_data = 8'd1;
	end
end
always @(*) begin
	maxpool_output_a0_a0_a0_clken = maxpool_output_a0_a0_a0_clken_sequential_cond;
end
always @(*) begin
	maxpool_output_a0_a0_a0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		maxpool_output_a0_a0_a0_write_en_a = 1'd1;
	end
end
always @(*) begin
	maxpool_output_a0_a0_a0_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		maxpool_output_a0_a0_a0_write_data_a = Maxpool_for_body15_sroa_speculated6_reg;
	end
end
assign maxpool_output_a0_a0_a0_read_en_a = 1'd0;
always @(*) begin
	maxpool_output_a0_a0_a0_address_a = 8'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		maxpool_output_a0_a0_a0_address_a = (Maxpool_for_body9_scevgep3_reg >>> 1'd1);
	end
end
always @(*) begin
	maxpool_output_a0_a0_a1_clken = maxpool_output_a0_a0_a1_clken_sequential_cond;
end
always @(*) begin
	maxpool_output_a0_a0_a1_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		maxpool_output_a0_a0_a1_write_en_a = 1'd1;
	end
end
always @(*) begin
	maxpool_output_a0_a0_a1_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		maxpool_output_a0_a0_a1_write_data_a = Maxpool_for_body15_sroa_speculated_reg;
	end
end
assign maxpool_output_a0_a0_a1_read_en_a = 1'd0;
always @(*) begin
	maxpool_output_a0_a0_a1_address_a = 8'd0;
	if ((cur_state == LEGUP_F_Maxpool_BB_for_cond47_preheader_7)) begin
		maxpool_output_a0_a0_a1_address_a = (Maxpool_for_body9_scevgep_reg >>> 1'd1);
	end
end
always @(*) begin
	conv1_output_a0_a0_a0_clken = conv1_output_a0_a0_a0_clken_pipeline_cond;
end
assign conv1_output_a0_a0_a0_write_en_a = 1'd0;
assign conv1_output_a0_a0_a0_write_data_a = 16'd0;
always @(*) begin
	conv1_output_a0_a0_a0_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_101_17_state_enable_2) begin
		conv1_output_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv1_output_a0_a0_a0_address_a = 10'd0;
	if (for_loop__digit_recognition_h_101_17_valid_bit_2) begin
		conv1_output_a0_a0_a0_address_a = (Maxpool_for_body15_8 >>> 1'd1);
	end
end
always @(*) begin
	conv1_output_a0_a0_a1_clken = conv1_output_a0_a0_a1_clken_pipeline_cond;
end
assign conv1_output_a0_a0_a1_write_en_a = 1'd0;
assign conv1_output_a0_a0_a1_write_data_a = 16'd0;
always @(*) begin
	conv1_output_a0_a0_a1_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_101_17_state_enable_2) begin
		conv1_output_a0_a0_a1_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv1_output_a0_a0_a1_address_a = 10'd0;
	if (for_loop__digit_recognition_h_101_17_valid_bit_2) begin
		conv1_output_a0_a0_a1_address_a = (Maxpool_for_body15_11 >>> 1'd1);
	end
end

endmodule
`timescale 1 ns / 1 ns
module Conv_overloaded_1
(
	clk,
	reset,
	start,
	ready,
	finish,
	maxpool_output_valid_write_en,
	maxpool_output_valid_write_data,
	maxpool_output_valid_read_data,
	conv2_output_valid_write_en,
	conv2_output_valid_write_data,
	conv2_output_valid_read_data,
	maxpool_output_a0_a0_a0_clken,
	maxpool_output_a0_a0_a0_write_en_a,
	maxpool_output_a0_a0_a0_write_data_a,
	maxpool_output_a0_a0_a0_read_en_a,
	maxpool_output_a0_a0_a0_address_a,
	maxpool_output_a0_a0_a0_read_data_a,
	maxpool_output_a0_a0_a1_clken,
	maxpool_output_a0_a0_a1_write_en_a,
	maxpool_output_a0_a0_a1_write_data_a,
	maxpool_output_a0_a0_a1_read_en_a,
	maxpool_output_a0_a0_a1_address_a,
	maxpool_output_a0_a0_a1_read_data_a,
	conv2_output_a0_a0_a0_clken,
	conv2_output_a0_a0_a0_write_en_a,
	conv2_output_a0_a0_a0_write_data_a,
	conv2_output_a0_a0_a0_read_en_a,
	conv2_output_a0_a0_a0_address_a,
	conv2_output_a0_a0_a0_read_data_a,
	conv2_output_a0_a0_a1_clken,
	conv2_output_a0_a0_a1_write_en_a,
	conv2_output_a0_a0_a1_write_data_a,
	conv2_output_a0_a0_a1_read_en_a,
	conv2_output_a0_a0_a1_address_a,
	conv2_output_a0_a0_a1_read_data_a,
	conv2_output_a0_a0_a2_clken,
	conv2_output_a0_a0_a2_write_en_a,
	conv2_output_a0_a0_a2_write_data_a,
	conv2_output_a0_a0_a2_read_en_a,
	conv2_output_a0_a0_a2_address_a,
	conv2_output_a0_a0_a2_read_data_a,
	conv2_output_a0_a0_a3_clken,
	conv2_output_a0_a0_a3_write_en_a,
	conv2_output_a0_a0_a3_write_data_a,
	conv2_output_a0_a0_a3_read_en_a,
	conv2_output_a0_a0_a3_address_a,
	conv2_output_a0_a0_a3_read_data_a
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_Conv_BB_while_body_1 = 4'd1;
parameter [3:0] LEGUP_F_Conv_BB_while_body_backedge_2 = 4'd2;
parameter [3:0] LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3 = 4'd3;
parameter [3:0] LEGUP_F_Conv_BB_for_cond7_preheader_4 = 4'd4;
parameter [3:0] LEGUP_F_Conv_BB_for_body12_5 = 4'd5;
parameter [3:0] LEGUP_F_Conv_BB_for_body12_6 = 4'd6;
parameter [3:0] LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_1_7 = 4'd7;
parameter [3:0] LEGUP_F_Conv_BB_for_body66_8 = 4'd8;
parameter [3:0] LEGUP_F_Conv_BB_for_body66_9 = 4'd9;
parameter [3:0] LEGUP_F_Conv_BB_for_body66_10 = 4'd10;
parameter [3:0] LEGUP_F_Conv_BB_for_inc95_11 = 4'd11;
parameter [3:0] LEGUP_F_Conv_BB_for_end97_12 = 4'd12;
parameter [3:0] LEGUP_F_Conv_BB_for_end97_13 = 4'd13;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  maxpool_output_valid_write_en;
output reg [7:0] maxpool_output_valid_write_data;
input [7:0] maxpool_output_valid_read_data;
output reg  conv2_output_valid_write_en;
output reg [7:0] conv2_output_valid_write_data;
input [7:0] conv2_output_valid_read_data;
output reg  maxpool_output_a0_a0_a0_clken;
output  maxpool_output_a0_a0_a0_write_en_a;
output [15:0] maxpool_output_a0_a0_a0_write_data_a;
output reg  maxpool_output_a0_a0_a0_read_en_a;
output reg [7:0] maxpool_output_a0_a0_a0_address_a;
input [15:0] maxpool_output_a0_a0_a0_read_data_a;
output reg  maxpool_output_a0_a0_a1_clken;
output  maxpool_output_a0_a0_a1_write_en_a;
output [15:0] maxpool_output_a0_a0_a1_write_data_a;
output reg  maxpool_output_a0_a0_a1_read_en_a;
output reg [7:0] maxpool_output_a0_a0_a1_address_a;
input [15:0] maxpool_output_a0_a0_a1_read_data_a;
output reg  conv2_output_a0_a0_a0_clken;
output reg  conv2_output_a0_a0_a0_write_en_a;
output reg [15:0] conv2_output_a0_a0_a0_write_data_a;
output  conv2_output_a0_a0_a0_read_en_a;
output reg [6:0] conv2_output_a0_a0_a0_address_a;
input [15:0] conv2_output_a0_a0_a0_read_data_a;
output reg  conv2_output_a0_a0_a1_clken;
output reg  conv2_output_a0_a0_a1_write_en_a;
output reg [15:0] conv2_output_a0_a0_a1_write_data_a;
output  conv2_output_a0_a0_a1_read_en_a;
output reg [6:0] conv2_output_a0_a0_a1_address_a;
input [15:0] conv2_output_a0_a0_a1_read_data_a;
output reg  conv2_output_a0_a0_a2_clken;
output reg  conv2_output_a0_a0_a2_write_en_a;
output reg [15:0] conv2_output_a0_a0_a2_write_data_a;
output  conv2_output_a0_a0_a2_read_en_a;
output reg [6:0] conv2_output_a0_a0_a2_address_a;
input [15:0] conv2_output_a0_a0_a2_read_data_a;
output reg  conv2_output_a0_a0_a3_clken;
output reg  conv2_output_a0_a0_a3_write_en_a;
output reg [15:0] conv2_output_a0_a0_a3_write_data_a;
output  conv2_output_a0_a0_a3_read_en_a;
output reg [6:0] conv2_output_a0_a0_a3_address_a;
input [15:0] conv2_output_a0_a0_a3_read_data_a;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;
reg [7:0] Conv_while_body_0;
reg [7:0] Conv_while_body_1;
reg [7:0] Conv_while_body_2;
reg [7:0] Conv_while_body_and134;
reg  Conv_while_body_tobool4;
reg [31:0] Conv_cond7_preheader_r_0151;
reg [31:0] Conv_cond7_preheader_r_0151_reg;
reg [30:0] Conv_cond7_preheader_bit_select14;
reg [28:0] Conv_cond7_preheader_bit_select12;
reg [31:0] Conv_cond7_preheader_bit_concat15;
reg [31:0] Conv_cond7_preheader_bit_concat13;
reg [31:0] Conv_cond7_preheader_sr_add;
reg [31:0] Conv_cond7_preheader_sr_add32;
reg [31:0] Conv_cond7_preheader_sr_add32_reg;
reg [31:0] Conv_for_body12_c_0150;
reg [31:0] Conv_for_body12_c_0150_reg;
reg [31:0] Conv_for_body12_3;
reg [31:0] Conv_for_body12_3_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep13_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep12;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep12_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep11;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep11_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep10;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep10_reg;
reg [35:0] Conv_for_body26_4;
reg [35:0] Conv_for_body26_4_reg;
reg [35:0] Conv_for_body26_5;
reg [35:0] Conv_for_body26_5_reg;
reg [35:0] Conv_for_body26_6;
reg [35:0] Conv_for_body26_6_reg;
reg [35:0] Conv_for_body26_7;
reg [35:0] Conv_for_body26_7_reg;
reg [35:0] Conv_for_body26_8;
reg [35:0] Conv_for_body26_8_reg;
reg [35:0] Conv_for_body26_9;
reg [35:0] Conv_for_body26_9_reg;
reg [35:0] Conv_for_body26_10;
reg [35:0] Conv_for_body26_10_reg;
reg [35:0] Conv_for_body26_11;
reg [35:0] Conv_for_body26_11_reg;
reg [31:0] Conv_for_body26_n_0145;
reg [31:0] Conv_for_body26_n_0145_reg;
reg [31:0] Conv_for_body26_m_0144;
reg [31:0] Conv_for_body26_m_0144_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep8;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep7;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep6;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep5;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep;
reg [15:0] Conv_for_body26_12;
reg [15:0] Conv_for_body26_13;
reg [31:0] Conv_for_body26_14;
reg [31:0] Conv_for_body26_15;
reg [29:0] Conv_for_body26_bit_select10;
reg [28:0] Conv_for_body26_bit_select8;
reg [31:0] Conv_for_body26_bit_concat11;
reg [31:0] Conv_for_body26_bit_concat9;
reg [31:0] Conv_for_body26_sr_add35;
reg [31:0] Conv_for_body26_sr_add36;
reg [31:0] Conv_for_body26_16;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_17;
reg [15:0] Conv_for_body26_18;
reg [15:0] Conv_for_body26_19;
reg [31:0] Conv_for_body26_20;
reg [31:0] Conv_for_body26_21;
reg [35:0] Conv_for_body26_22;
reg [15:0] Conv_for_body26_bit_select7;
reg [15:0] Conv_for_body26_bit_select7_reg;
reg [15:0] Conv_for_body26_23;
reg [15:0] Conv_for_body26_24;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_25;
reg [15:0] Conv_for_body26_26;
reg [15:0] Conv_for_body26_27;
reg [31:0] Conv_for_body26_28;
reg [31:0] Conv_for_body26_29;
reg [35:0] Conv_for_body26_30;
reg [15:0] Conv_for_body26_bit_select6;
reg [15:0] Conv_for_body26_bit_select6_reg;
reg [15:0] Conv_for_body26_31;
reg [15:0] Conv_for_body26_32;
reg [31:0] Conv_for_body26_33;
reg [31:0] Conv_for_body26_34;
reg [35:0] Conv_for_body26_35;
reg [15:0] Conv_for_body26_bit_select5;
reg [15:0] Conv_for_body26_bit_select5_reg;
reg [15:0] Conv_for_body26_36;
reg [15:0] Conv_for_body26_37;
reg [31:0] Conv_for_body26_38;
reg [31:0] Conv_for_body26_39;
reg [35:0] Conv_for_body26_40;
reg [15:0] Conv_for_body26_bit_select4;
reg [15:0] Conv_for_body26_bit_select4_reg;
reg [15:0] Conv_for_body26_41;
reg [15:0] Conv_for_body26_42;
reg [31:0] Conv_for_body26_43;
reg [31:0] Conv_for_body26_44;
reg [35:0] Conv_for_body26_45;
reg [15:0] Conv_for_body26_bit_select3;
reg [15:0] Conv_for_body26_bit_select3_reg;
reg [15:0] Conv_for_body26_46;
reg [15:0] Conv_for_body26_47;
reg [31:0] Conv_for_body26_48;
reg [31:0] Conv_for_body26_49;
reg [35:0] Conv_for_body26_50;
reg [15:0] Conv_for_body26_bit_select2;
reg [15:0] Conv_for_body26_bit_select2_reg;
reg [15:0] Conv_for_body26_51;
reg [15:0] Conv_for_body26_52;
reg [31:0] Conv_for_body26_53;
reg [31:0] Conv_for_body26_54;
reg [35:0] Conv_for_body26_55;
reg [15:0] Conv_for_body26_bit_select1;
reg [15:0] Conv_for_body26_bit_select1_reg;
reg [15:0] Conv_for_body26_56;
reg [15:0] Conv_for_body26_57;
reg [31:0] Conv_for_body26_58;
reg [31:0] Conv_for_body26_59;
reg [35:0] Conv_for_body26_60;
reg [15:0] Conv_for_body26_bit_select;
reg [15:0] Conv_for_body26_bit_select_reg;
reg  Conv_for_body26_cmp52;
reg [31:0] Conv_for_body26_add53;
reg [31:0] Conv_for_body26_add53_var0;
reg  Conv_for_body26_not_cmp54;
reg [31:0] Conv_for_body26_bit_concat;
reg [31:0] Conv_for_body26_cond59;
reg [15:0] Conv_for_body66_62;
reg [15:0] Conv_for_body66_63;
reg [15:0] Conv_for_body66_63_reg;
reg  Conv_for_body66_64;
reg [15:0] Conv_for_body66_1;
reg [15:0] Conv_for_body66_65;
reg [15:0] Conv_for_body66_66;
reg [15:0] Conv_for_body66_66_reg;
reg  Conv_for_body66_67;
reg [15:0] Conv_for_body66_ref_tmp84_1;
reg [15:0] Conv_for_body66_68;
reg [15:0] Conv_for_body66_69;
reg [15:0] Conv_for_body66_69_reg;
reg  Conv_for_body66_70;
reg [15:0] Conv_for_body66_183;
reg [15:0] Conv_for_body66_71;
reg [15:0] Conv_for_body66_72;
reg [15:0] Conv_for_body66_72_reg;
reg  Conv_for_body66_73;
reg [15:0] Conv_for_body66_ref_tmp84_3;
reg [31:0] Conv_for_body66_74;
reg [31:0] Conv_for_body66_74_reg;
reg  Conv_for_body66_exitcond21;
reg  Conv_for_body66_exitcond21_reg;
reg [31:0] Conv_for_inc95_75;
reg  Conv_for_inc95_exitcond26;
reg  _ZL13conv2_weights_a0_a0_a0_clken;
reg [3:0] _ZL13conv2_weights_a0_a0_a0_address_a;
wire [15:0] _ZL13conv2_weights_a0_a0_a0_read_data_a;
reg  _ZL13conv2_weights_a0_a0_a0_read_en_a;
reg  _ZL13conv2_weights_a0_a1_a0_clken;
reg [3:0] _ZL13conv2_weights_a0_a1_a0_address_a;
wire [15:0] _ZL13conv2_weights_a0_a1_a0_read_data_a;
reg  _ZL13conv2_weights_a0_a1_a0_read_en_a;
reg  _ZL13conv2_weights_a1_a0_a0_clken;
reg [3:0] _ZL13conv2_weights_a1_a0_a0_address_a;
wire [15:0] _ZL13conv2_weights_a1_a0_a0_read_data_a;
reg  _ZL13conv2_weights_a1_a0_a0_read_en_a;
reg  _ZL13conv2_weights_a1_a1_a0_clken;
reg [3:0] _ZL13conv2_weights_a1_a1_a0_address_a;
wire [15:0] _ZL13conv2_weights_a1_a1_a0_read_data_a;
reg  _ZL13conv2_weights_a1_a1_a0_read_en_a;
reg  _ZL13conv2_weights_a2_a0_a0_clken;
reg [3:0] _ZL13conv2_weights_a2_a0_a0_address_a;
wire [15:0] _ZL13conv2_weights_a2_a0_a0_read_data_a;
reg  _ZL13conv2_weights_a2_a0_a0_read_en_a;
reg  _ZL13conv2_weights_a2_a1_a0_clken;
reg [3:0] _ZL13conv2_weights_a2_a1_a0_address_a;
wire [15:0] _ZL13conv2_weights_a2_a1_a0_read_data_a;
reg  _ZL13conv2_weights_a2_a1_a0_read_en_a;
reg  _ZL13conv2_weights_a3_a0_a0_clken;
reg [3:0] _ZL13conv2_weights_a3_a0_a0_address_a;
wire [15:0] _ZL13conv2_weights_a3_a0_a0_read_data_a;
reg  _ZL13conv2_weights_a3_a0_a0_read_en_a;
reg  _ZL13conv2_weights_a3_a1_a0_clken;
reg [3:0] _ZL13conv2_weights_a3_a1_a0_address_a;
wire [15:0] _ZL13conv2_weights_a3_a1_a0_read_data_a;
reg  _ZL13conv2_weights_a3_a1_a0_read_en_a;
reg  for_loop__digit_recognition_h_56_21_1_valid_bit_0;
wire  for_loop__digit_recognition_h_56_21_1_state_stall_0;
reg  for_loop__digit_recognition_h_56_21_1_state_enable_0;
reg  for_loop__digit_recognition_h_56_21_1_valid_bit_1;
wire  for_loop__digit_recognition_h_56_21_1_state_stall_1;
reg  for_loop__digit_recognition_h_56_21_1_state_enable_1;
reg  for_loop__digit_recognition_h_56_21_1_valid_bit_2;
wire  for_loop__digit_recognition_h_56_21_1_state_stall_2;
reg  for_loop__digit_recognition_h_56_21_1_state_enable_2;
reg  for_loop__digit_recognition_h_56_21_1_valid_bit_3;
wire  for_loop__digit_recognition_h_56_21_1_state_stall_3;
reg  for_loop__digit_recognition_h_56_21_1_state_enable_3;
reg  for_loop__digit_recognition_h_56_21_1_valid_bit_4;
wire  for_loop__digit_recognition_h_56_21_1_state_stall_4;
reg  for_loop__digit_recognition_h_56_21_1_state_enable_4;
reg  for_loop__digit_recognition_h_56_21_1_II_counter;
reg  for_loop__digit_recognition_h_56_21_1_start;
reg  for_loop__digit_recognition_h_56_21_1_activate_pipeline;
reg [35:0] Conv_for_body26_4_reg_stage4;
reg [35:0] Conv_for_body26_5_reg_stage4;
reg [35:0] Conv_for_body26_6_reg_stage4;
reg [35:0] Conv_for_body26_7_reg_stage4;
reg [35:0] Conv_for_body26_8_reg_stage4;
reg [35:0] Conv_for_body26_9_reg_stage4;
reg [35:0] Conv_for_body26_10_reg_stage4;
reg [35:0] Conv_for_body26_11_reg_stage4;
reg [31:0] Conv_for_body26_m_0144_reg_stage1;
reg [15:0] Conv_for_body26_13_reg_stage2;
reg [15:0] Conv_for_body26_13_reg_stage3;
reg [31:0] Conv_for_body26_14_reg_stage1;
reg [31:0] Conv_for_body26_bit_concat9_reg_stage1;
reg [31:0] Conv_for_body26_sr_add35_reg_stage1;
reg [31:0] Conv_for_body26_16_reg_stage2;
reg [35:0] Conv_for_body26_22_reg_stage5;
reg [15:0] Conv_for_body26_24_reg_stage2;
reg [15:0] Conv_for_body26_24_reg_stage3;
reg [35:0] Conv_for_body26_30_reg_stage5;
reg [15:0] Conv_for_body26_32_reg_stage2;
reg [15:0] Conv_for_body26_32_reg_stage3;
reg [35:0] Conv_for_body26_35_reg_stage5;
reg [15:0] Conv_for_body26_37_reg_stage2;
reg [15:0] Conv_for_body26_37_reg_stage3;
reg [35:0] Conv_for_body26_40_reg_stage5;
reg [15:0] Conv_for_body26_42_reg_stage2;
reg [15:0] Conv_for_body26_42_reg_stage3;
reg [35:0] Conv_for_body26_45_reg_stage5;
reg [15:0] Conv_for_body26_47_reg_stage2;
reg [15:0] Conv_for_body26_47_reg_stage3;
reg [35:0] Conv_for_body26_50_reg_stage5;
reg [15:0] Conv_for_body26_52_reg_stage2;
reg [15:0] Conv_for_body26_52_reg_stage3;
reg [35:0] Conv_for_body26_55_reg_stage5;
reg [15:0] Conv_for_body26_57_reg_stage2;
reg [15:0] Conv_for_body26_57_reg_stage3;
reg [35:0] Conv_for_body26_60_reg_stage5;
reg [31:0] Conv_for_body26_add53_var0_reg_stage1;
reg [31:0] Conv_for_body26_cond59_reg_stage2;
reg [31:0] for_loop__digit_recognition_h_56_21_1_inductionVar_stage0;
reg  for_loop__digit_recognition_h_56_21_1_pipeline_exit_cond;
reg  for_loop__digit_recognition_h_56_21_1_active;
reg  for_loop__digit_recognition_h_56_21_1_begin_pipeline;
reg  for_loop__digit_recognition_h_56_21_1_epilogue;
reg  for_loop__digit_recognition_h_56_21_1_pipeline_finish;
reg  for_loop__digit_recognition_h_56_21_1_pipeline_finishing;
reg  for_loop__digit_recognition_h_56_21_1_only_last_stage_enabled;
reg [2:0] for_loop__digit_recognition_h_56_21_1_num_active_iterations;
reg  for_loop__digit_recognition_h_56_21_1_inserting_new_iteration;
reg  for_loop__digit_recognition_h_56_21_1_pipeline_finish_reg;
reg  for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0;
reg  for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage1;
reg  for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage2;
reg  for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3;
wire  Conv_cond7_preheader_bit_concat15_bit_select_operand_2;
wire [2:0] Conv_cond7_preheader_bit_concat13_bit_select_operand_2;
reg [15:0] _ZL13conv2_weights_a0_a0_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a0_a0_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a0_a0_a0_address_a_reg;
reg  _ZL13conv2_weights_a0_a0_a0_address_a_reg_enable;
wire [1:0] Conv_for_body26_bit_concat11_bit_select_operand_2;
wire [2:0] Conv_for_body26_bit_concat9_bit_select_operand_2;
reg [15:0] maxpool_output_a0_a0_a0_read_data_wire_a;
reg  maxpool_output_a0_a0_a0_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_10_clock;
reg  legup_split_mult_signed_16_16_32_10_aclr;
reg  legup_split_mult_signed_16_16_32_10_clken;
reg [15:0] legup_split_mult_signed_16_16_32_10_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_10_datab;
wire [31:0] legup_split_mult_signed_16_16_32_10_result;
reg [31:0] legup_mult_Conv_for_body26_20_out_actual;
reg [31:0] legup_mult_Conv_for_body26_20_out;
reg  legup_mult_Conv_for_body26_20_en;
reg  legup_mult_Conv_for_body26_20_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a0_a1_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a0_a1_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a0_a1_a0_address_a_reg;
reg  _ZL13conv2_weights_a0_a1_a0_address_a_reg_enable;
reg [15:0] maxpool_output_a0_a0_a1_read_data_wire_a;
reg  maxpool_output_a0_a0_a1_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_11_clock;
reg  legup_split_mult_signed_16_16_32_11_aclr;
reg  legup_split_mult_signed_16_16_32_11_clken;
reg [15:0] legup_split_mult_signed_16_16_32_11_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_11_datab;
wire [31:0] legup_split_mult_signed_16_16_32_11_result;
reg [31:0] legup_mult_Conv_for_body26_28_out_actual;
reg [31:0] legup_mult_Conv_for_body26_28_out;
reg  legup_mult_Conv_for_body26_28_en;
reg  legup_mult_Conv_for_body26_28_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a1_a0_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a1_a0_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a1_a0_a0_address_a_reg;
reg  _ZL13conv2_weights_a1_a0_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_12_clock;
reg  legup_split_mult_signed_16_16_32_12_aclr;
reg  legup_split_mult_signed_16_16_32_12_clken;
reg [15:0] legup_split_mult_signed_16_16_32_12_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_12_datab;
wire [31:0] legup_split_mult_signed_16_16_32_12_result;
reg [31:0] legup_mult_Conv_for_body26_33_out_actual;
reg [31:0] legup_mult_Conv_for_body26_33_out;
reg  legup_mult_Conv_for_body26_33_en;
reg  legup_mult_Conv_for_body26_33_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a1_a1_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a1_a1_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a1_a1_a0_address_a_reg;
reg  _ZL13conv2_weights_a1_a1_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_13_clock;
reg  legup_split_mult_signed_16_16_32_13_aclr;
reg  legup_split_mult_signed_16_16_32_13_clken;
reg [15:0] legup_split_mult_signed_16_16_32_13_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_13_datab;
wire [31:0] legup_split_mult_signed_16_16_32_13_result;
reg [31:0] legup_mult_Conv_for_body26_38_out_actual;
reg [31:0] legup_mult_Conv_for_body26_38_out;
reg  legup_mult_Conv_for_body26_38_en;
reg  legup_mult_Conv_for_body26_38_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a2_a0_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a2_a0_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a2_a0_a0_address_a_reg;
reg  _ZL13conv2_weights_a2_a0_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_14_clock;
reg  legup_split_mult_signed_16_16_32_14_aclr;
reg  legup_split_mult_signed_16_16_32_14_clken;
reg [15:0] legup_split_mult_signed_16_16_32_14_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_14_datab;
wire [31:0] legup_split_mult_signed_16_16_32_14_result;
reg [31:0] legup_mult_Conv_for_body26_43_out_actual;
reg [31:0] legup_mult_Conv_for_body26_43_out;
reg  legup_mult_Conv_for_body26_43_en;
reg  legup_mult_Conv_for_body26_43_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a2_a1_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a2_a1_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a2_a1_a0_address_a_reg;
reg  _ZL13conv2_weights_a2_a1_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_15_clock;
reg  legup_split_mult_signed_16_16_32_15_aclr;
reg  legup_split_mult_signed_16_16_32_15_clken;
reg [15:0] legup_split_mult_signed_16_16_32_15_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_15_datab;
wire [31:0] legup_split_mult_signed_16_16_32_15_result;
reg [31:0] legup_mult_Conv_for_body26_48_out_actual;
reg [31:0] legup_mult_Conv_for_body26_48_out;
reg  legup_mult_Conv_for_body26_48_en;
reg  legup_mult_Conv_for_body26_48_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a3_a0_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a3_a0_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a3_a0_a0_address_a_reg;
reg  _ZL13conv2_weights_a3_a0_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_16_clock;
reg  legup_split_mult_signed_16_16_32_16_aclr;
reg  legup_split_mult_signed_16_16_32_16_clken;
reg [15:0] legup_split_mult_signed_16_16_32_16_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_16_datab;
wire [31:0] legup_split_mult_signed_16_16_32_16_result;
reg [31:0] legup_mult_Conv_for_body26_53_out_actual;
reg [31:0] legup_mult_Conv_for_body26_53_out;
reg  legup_mult_Conv_for_body26_53_en;
reg  legup_mult_Conv_for_body26_53_en_pipeline_cond;
reg [15:0] _ZL13conv2_weights_a3_a1_a0_read_data_wire_a;
reg  _ZL13conv2_weights_a3_a1_a0_clken_pipeline_cond;
reg [3:0] _ZL13conv2_weights_a3_a1_a0_address_a_reg;
reg  _ZL13conv2_weights_a3_a1_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_17_clock;
reg  legup_split_mult_signed_16_16_32_17_aclr;
reg  legup_split_mult_signed_16_16_32_17_clken;
reg [15:0] legup_split_mult_signed_16_16_32_17_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_17_datab;
wire [31:0] legup_split_mult_signed_16_16_32_17_result;
reg [31:0] legup_mult_Conv_for_body26_58_out_actual;
reg [31:0] legup_mult_Conv_for_body26_58_out;
reg  legup_mult_Conv_for_body26_58_en;
reg  legup_mult_Conv_for_body26_58_en_pipeline_cond;
wire [30:0] Conv_for_body26_bit_concat_bit_select_operand_0;
wire [1:0] Conv_for_body66_64_op1_temp;
reg  conv2_output_a0_a0_a0_clken_sequential_cond;
wire [1:0] Conv_for_body66_67_op1_temp;
reg  conv2_output_a0_a0_a1_clken_sequential_cond;
wire [1:0] Conv_for_body66_70_op1_temp;
reg  conv2_output_a0_a0_a2_clken_sequential_cond;
wire [1:0] Conv_for_body66_73_op1_temp;
reg  conv2_output_a0_a0_a3_clken_sequential_cond;

/*   %17 = mul i32 %12, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_10 (
	.clock (legup_split_mult_signed_16_16_32_10_clock),
	.aclr (legup_split_mult_signed_16_16_32_10_aclr),
	.clken (legup_split_mult_signed_16_16_32_10_clken),
	.dataa (legup_split_mult_signed_16_16_32_10_dataa),
	.datab (legup_split_mult_signed_16_16_32_10_datab),
	.result (legup_split_mult_signed_16_16_32_10_result)
);

defparam
	legup_split_mult_signed_16_16_32_10.widtha = 16,
	legup_split_mult_signed_16_16_32_10.widthb = 16,
	legup_split_mult_signed_16_16_32_10.widthp = 32,
	legup_split_mult_signed_16_16_32_10.pipeline = 1,
	legup_split_mult_signed_16_16_32_10.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_10.preserve_module_hierarchy = 0;

/*   %22 = mul i32 %21, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_11 (
	.clock (legup_split_mult_signed_16_16_32_11_clock),
	.aclr (legup_split_mult_signed_16_16_32_11_aclr),
	.clken (legup_split_mult_signed_16_16_32_11_clken),
	.dataa (legup_split_mult_signed_16_16_32_11_dataa),
	.datab (legup_split_mult_signed_16_16_32_11_datab),
	.result (legup_split_mult_signed_16_16_32_11_result)
);

defparam
	legup_split_mult_signed_16_16_32_11.widtha = 16,
	legup_split_mult_signed_16_16_32_11.widthb = 16,
	legup_split_mult_signed_16_16_32_11.widthp = 32,
	legup_split_mult_signed_16_16_32_11.pipeline = 1,
	legup_split_mult_signed_16_16_32_11.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_11.preserve_module_hierarchy = 0;

/*   %33 = mul i32 %32, %19, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_12 (
	.clock (legup_split_mult_signed_16_16_32_12_clock),
	.aclr (legup_split_mult_signed_16_16_32_12_aclr),
	.clken (legup_split_mult_signed_16_16_32_12_clken),
	.dataa (legup_split_mult_signed_16_16_32_12_dataa),
	.datab (legup_split_mult_signed_16_16_32_12_datab),
	.result (legup_split_mult_signed_16_16_32_12_result)
);

defparam
	legup_split_mult_signed_16_16_32_12.widtha = 16,
	legup_split_mult_signed_16_16_32_12.widthb = 16,
	legup_split_mult_signed_16_16_32_12.widthp = 32,
	legup_split_mult_signed_16_16_32_12.pipeline = 1,
	legup_split_mult_signed_16_16_32_12.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_12.preserve_module_hierarchy = 0;

/*   %38 = mul i32 %37, %27, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_13 (
	.clock (legup_split_mult_signed_16_16_32_13_clock),
	.aclr (legup_split_mult_signed_16_16_32_13_aclr),
	.clken (legup_split_mult_signed_16_16_32_13_clken),
	.dataa (legup_split_mult_signed_16_16_32_13_dataa),
	.datab (legup_split_mult_signed_16_16_32_13_datab),
	.result (legup_split_mult_signed_16_16_32_13_result)
);

defparam
	legup_split_mult_signed_16_16_32_13.widtha = 16,
	legup_split_mult_signed_16_16_32_13.widthb = 16,
	legup_split_mult_signed_16_16_32_13.widthp = 32,
	legup_split_mult_signed_16_16_32_13.pipeline = 1,
	legup_split_mult_signed_16_16_32_13.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_13.preserve_module_hierarchy = 0;

/*   %43 = mul i32 %42, %19, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_14 (
	.clock (legup_split_mult_signed_16_16_32_14_clock),
	.aclr (legup_split_mult_signed_16_16_32_14_aclr),
	.clken (legup_split_mult_signed_16_16_32_14_clken),
	.dataa (legup_split_mult_signed_16_16_32_14_dataa),
	.datab (legup_split_mult_signed_16_16_32_14_datab),
	.result (legup_split_mult_signed_16_16_32_14_result)
);

defparam
	legup_split_mult_signed_16_16_32_14.widtha = 16,
	legup_split_mult_signed_16_16_32_14.widthb = 16,
	legup_split_mult_signed_16_16_32_14.widthp = 32,
	legup_split_mult_signed_16_16_32_14.pipeline = 1,
	legup_split_mult_signed_16_16_32_14.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_14.preserve_module_hierarchy = 0;

/*   %48 = mul i32 %47, %27, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_15 (
	.clock (legup_split_mult_signed_16_16_32_15_clock),
	.aclr (legup_split_mult_signed_16_16_32_15_aclr),
	.clken (legup_split_mult_signed_16_16_32_15_clken),
	.dataa (legup_split_mult_signed_16_16_32_15_dataa),
	.datab (legup_split_mult_signed_16_16_32_15_datab),
	.result (legup_split_mult_signed_16_16_32_15_result)
);

defparam
	legup_split_mult_signed_16_16_32_15.widtha = 16,
	legup_split_mult_signed_16_16_32_15.widthb = 16,
	legup_split_mult_signed_16_16_32_15.widthp = 32,
	legup_split_mult_signed_16_16_32_15.pipeline = 1,
	legup_split_mult_signed_16_16_32_15.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_15.preserve_module_hierarchy = 0;

/*   %53 = mul i32 %52, %19, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_16 (
	.clock (legup_split_mult_signed_16_16_32_16_clock),
	.aclr (legup_split_mult_signed_16_16_32_16_aclr),
	.clken (legup_split_mult_signed_16_16_32_16_clken),
	.dataa (legup_split_mult_signed_16_16_32_16_dataa),
	.datab (legup_split_mult_signed_16_16_32_16_datab),
	.result (legup_split_mult_signed_16_16_32_16_result)
);

defparam
	legup_split_mult_signed_16_16_32_16.widtha = 16,
	legup_split_mult_signed_16_16_32_16.widthb = 16,
	legup_split_mult_signed_16_16_32_16.widthp = 32,
	legup_split_mult_signed_16_16_32_16.pipeline = 1,
	legup_split_mult_signed_16_16_32_16.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_16.preserve_module_hierarchy = 0;

/*   %58 = mul i32 %57, %27, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_17 (
	.clock (legup_split_mult_signed_16_16_32_17_clock),
	.aclr (legup_split_mult_signed_16_16_32_17_aclr),
	.clken (legup_split_mult_signed_16_16_32_17_clken),
	.dataa (legup_split_mult_signed_16_16_32_17_dataa),
	.datab (legup_split_mult_signed_16_16_32_17_datab),
	.result (legup_split_mult_signed_16_16_32_17_result)
);

defparam
	legup_split_mult_signed_16_16_32_17.widtha = 16,
	legup_split_mult_signed_16_16_32_17.widthb = 16,
	legup_split_mult_signed_16_16_32_17.widthp = 32,
	legup_split_mult_signed_16_16_32_17.pipeline = 1,
	legup_split_mult_signed_16_16_32_17.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_17.preserve_module_hierarchy = 0;



// @_ZL13conv2_weights.a0.a0.a0 = internal unnamed_addr constant [9 x i16] [i16 -175, i16 -1695, i16 3460, i16 -1208, i16 -2781, i16 -1948, i16 550, i16 2510, i16 -491]
rom_single_port _ZL13conv2_weights_a0_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a0_a0_a0_clken ),
	.address_a( _ZL13conv2_weights_a0_a0_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a0_a0_a0_read_data_a )
);
defparam _ZL13conv2_weights_a0_a0_a0.width_a = 16;
defparam _ZL13conv2_weights_a0_a0_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a0_a0_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a0_a0_a0.latency = 1;
defparam _ZL13conv2_weights_a0_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a0_a0_a0.mem"};



// @_ZL13conv2_weights.a0.a1.a0 = internal unnamed_addr constant [9 x i16] [i16 9134, i16 10650, i16 9750, i16 -2356, i16 8704, i16 -1165, i16 -2310, i16 -9537, i16 -4904]
rom_single_port _ZL13conv2_weights_a0_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a0_a1_a0_clken ),
	.address_a( _ZL13conv2_weights_a0_a1_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a0_a1_a0_read_data_a )
);
defparam _ZL13conv2_weights_a0_a1_a0.width_a = 16;
defparam _ZL13conv2_weights_a0_a1_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a0_a1_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a0_a1_a0.latency = 1;
defparam _ZL13conv2_weights_a0_a1_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a0_a1_a0.mem"};



// @_ZL13conv2_weights.a1.a0.a0 = internal unnamed_addr constant [9 x i16] [i16 1488, i16 -3057, i16 2519, i16 2426, i16 -3239, i16 4905, i16 5917, i16 227, i16 4750]
rom_single_port _ZL13conv2_weights_a1_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a1_a0_a0_clken ),
	.address_a( _ZL13conv2_weights_a1_a0_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a1_a0_a0_read_data_a )
);
defparam _ZL13conv2_weights_a1_a0_a0.width_a = 16;
defparam _ZL13conv2_weights_a1_a0_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a1_a0_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a1_a0_a0.latency = 1;
defparam _ZL13conv2_weights_a1_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a1_a0_a0.mem"};



// @_ZL13conv2_weights.a1.a1.a0 = internal unnamed_addr constant [9 x i16] [i16 -2422, i16 1624, i16 890, i16 -2686, i16 -371, i16 4923, i16 3555, i16 4287, i16 1210]
rom_single_port _ZL13conv2_weights_a1_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a1_a1_a0_clken ),
	.address_a( _ZL13conv2_weights_a1_a1_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a1_a1_a0_read_data_a )
);
defparam _ZL13conv2_weights_a1_a1_a0.width_a = 16;
defparam _ZL13conv2_weights_a1_a1_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a1_a1_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a1_a1_a0.latency = 1;
defparam _ZL13conv2_weights_a1_a1_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a1_a1_a0.mem"};



// @_ZL13conv2_weights.a2.a0.a0 = internal unnamed_addr constant [9 x i16] [i16 5410, i16 1582, i16 -1509, i16 -2904, i16 -5611, i16 7270, i16 -8932, i16 -1614, i16 6957]
rom_single_port _ZL13conv2_weights_a2_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a2_a0_a0_clken ),
	.address_a( _ZL13conv2_weights_a2_a0_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a2_a0_a0_read_data_a )
);
defparam _ZL13conv2_weights_a2_a0_a0.width_a = 16;
defparam _ZL13conv2_weights_a2_a0_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a2_a0_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a2_a0_a0.latency = 1;
defparam _ZL13conv2_weights_a2_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a2_a0_a0.mem"};



// @_ZL13conv2_weights.a2.a1.a0 = internal unnamed_addr constant [9 x i16] [i16 1525, i16 -619, i16 4922, i16 1714, i16 -2811, i16 -8037, i16 1725, i16 -3532, i16 -8411]
rom_single_port _ZL13conv2_weights_a2_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a2_a1_a0_clken ),
	.address_a( _ZL13conv2_weights_a2_a1_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a2_a1_a0_read_data_a )
);
defparam _ZL13conv2_weights_a2_a1_a0.width_a = 16;
defparam _ZL13conv2_weights_a2_a1_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a2_a1_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a2_a1_a0.latency = 1;
defparam _ZL13conv2_weights_a2_a1_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a2_a1_a0.mem"};



// @_ZL13conv2_weights.a3.a0.a0 = internal unnamed_addr constant [9 x i16] [i16 3210, i16 -3536, i16 1225, i16 8279, i16 1838, i16 -4832, i16 5026, i16 -4789, i16 -5914]
rom_single_port _ZL13conv2_weights_a3_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a3_a0_a0_clken ),
	.address_a( _ZL13conv2_weights_a3_a0_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a3_a0_a0_read_data_a )
);
defparam _ZL13conv2_weights_a3_a0_a0.width_a = 16;
defparam _ZL13conv2_weights_a3_a0_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a3_a0_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a3_a0_a0.latency = 1;
defparam _ZL13conv2_weights_a3_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a3_a0_a0.mem"};



// @_ZL13conv2_weights.a3.a1.a0 = internal unnamed_addr constant [9 x i16] [i16 -740, i16 268, i16 1017, i16 1947, i16 -4367, i16 1141, i16 -977, i16 -5892, i16 -3274]
rom_single_port _ZL13conv2_weights_a3_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv2_weights_a3_a1_a0_clken ),
	.address_a( _ZL13conv2_weights_a3_a1_a0_address_a ),
	.read_data_a( _ZL13conv2_weights_a3_a1_a0_read_data_a )
);
defparam _ZL13conv2_weights_a3_a1_a0.width_a = 16;
defparam _ZL13conv2_weights_a3_a1_a0.widthad_a = 4;
defparam _ZL13conv2_weights_a3_a1_a0.numwords_a = 9;
defparam _ZL13conv2_weights_a3_a1_a0.latency = 1;
defparam _ZL13conv2_weights_a3_a1_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv2_weights_a3_a1_a0.mem"};


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
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_F_Conv_BB_for_body12_5:
		next_state = LEGUP_F_Conv_BB_for_body12_6;
LEGUP_F_Conv_BB_for_body12_6:
		next_state = LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_1_7;
LEGUP_F_Conv_BB_for_body66_10:
	if ((fsm_stall == 1'd0) && (Conv_for_body66_exitcond21_reg == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_inc95_11;
	else if ((fsm_stall == 1'd0) && (Conv_for_body66_exitcond21_reg == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_body12_5;
LEGUP_F_Conv_BB_for_body66_8:
		next_state = LEGUP_F_Conv_BB_for_body66_9;
LEGUP_F_Conv_BB_for_body66_9:
		next_state = LEGUP_F_Conv_BB_for_body66_10;
LEGUP_F_Conv_BB_for_cond7_preheader_4:
		next_state = LEGUP_F_Conv_BB_for_body12_5;
LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3:
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_for_end97_12:
		next_state = LEGUP_F_Conv_BB_for_end97_13;
LEGUP_F_Conv_BB_for_end97_13:
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
LEGUP_F_Conv_BB_for_inc95_11:
	if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond26 == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_end97_12;
	else if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond26 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd1))
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3;
LEGUP_F_Conv_BB_while_body_backedge_2:
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_1_7:
	if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_1_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_body66_8;
	else if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_1_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_body66_8;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
		Conv_while_body_0 = maxpool_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_1 = conv2_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_2 = (Conv_while_body_1 ^ 8'd1);
end
always @(*) begin
		Conv_while_body_and134 = (Conv_while_body_2 & Conv_while_body_0);
end
always @(*) begin
		Conv_while_body_tobool4 = (Conv_while_body_and134 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_11) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond26 == 1'd0))) */ begin
		Conv_cond7_preheader_r_0151 = Conv_for_inc95_75;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_11) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond26 == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
end
always @(*) begin
		Conv_cond7_preheader_bit_select14 = Conv_cond7_preheader_r_0151_reg[30:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_select12 = Conv_cond7_preheader_r_0151_reg[28:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_concat15 = {Conv_cond7_preheader_bit_select14[30:0], Conv_cond7_preheader_bit_concat15_bit_select_operand_2};
end
always @(*) begin
		Conv_cond7_preheader_bit_concat13 = {Conv_cond7_preheader_bit_select12[28:0], Conv_cond7_preheader_bit_concat13_bit_select_operand_2[2:0]};
end
always @(*) begin
		Conv_cond7_preheader_sr_add = (Conv_cond7_preheader_r_0151_reg + Conv_cond7_preheader_bit_concat15);
end
always @(*) begin
		Conv_cond7_preheader_sr_add32 = (Conv_cond7_preheader_bit_concat13 + Conv_cond7_preheader_sr_add);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4)) begin
		Conv_cond7_preheader_sr_add32_reg <= Conv_cond7_preheader_sr_add32;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_for_body12_c_0150 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_body66_10) & (fsm_stall == 1'd0)) & (Conv_for_body66_exitcond21_reg == 1'd0))) */ begin
		Conv_for_body12_c_0150 = Conv_for_body66_74_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_for_body12_c_0150_reg <= Conv_for_body12_c_0150;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_body66_10) & (fsm_stall == 1'd0)) & (Conv_for_body66_exitcond21_reg == 1'd0))) begin
		Conv_for_body12_c_0150_reg <= Conv_for_body12_c_0150;
	end
end
always @(*) begin
		Conv_for_body12_3 = (Conv_cond7_preheader_sr_add32_reg + Conv_for_body12_c_0150_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_5)) begin
		Conv_for_body12_3_reg <= Conv_for_body12_3;
	end
end
always @(*) begin
		Conv_for_body12_scevgep13 = (1'd0 + (2 * Conv_for_body12_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_scevgep13_reg <= Conv_for_body12_scevgep13;
	end
end
always @(*) begin
		Conv_for_body12_scevgep12 = (1'd0 + (2 * Conv_for_body12_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_scevgep12_reg <= Conv_for_body12_scevgep12;
	end
end
always @(*) begin
		Conv_for_body12_scevgep11 = (1'd0 + (2 * Conv_for_body12_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_scevgep11_reg <= Conv_for_body12_scevgep11;
	end
end
always @(*) begin
		Conv_for_body12_scevgep10 = (1'd0 + (2 * Conv_for_body12_3_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_scevgep10_reg <= Conv_for_body12_scevgep10;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_4 = Conv_for_body26_4_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_4 = Conv_for_body26_60;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_4 = Conv_for_body26_60_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_4 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_4_reg <= Conv_for_body26_4;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_4_reg <= Conv_for_body26_4;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_5 = Conv_for_body26_5_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_5 = Conv_for_body26_55;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_5 = Conv_for_body26_55_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_5 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_5_reg <= Conv_for_body26_5;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_5_reg <= Conv_for_body26_5;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_6 = Conv_for_body26_6_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_6 = Conv_for_body26_50;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_6 = Conv_for_body26_50_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_6 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_6_reg <= Conv_for_body26_6;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_6_reg <= Conv_for_body26_6;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_7 = Conv_for_body26_7_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_7 = Conv_for_body26_45;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_7 = Conv_for_body26_45_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_7 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_7_reg <= Conv_for_body26_7;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_7_reg <= Conv_for_body26_7;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_8 = Conv_for_body26_8_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_8 = Conv_for_body26_40;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_8 = Conv_for_body26_40_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_8 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_8_reg <= Conv_for_body26_8;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_8_reg <= Conv_for_body26_8;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_9 = Conv_for_body26_9_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_9 = Conv_for_body26_35;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_9 = Conv_for_body26_35_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_9 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_10 = Conv_for_body26_10_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_10 = Conv_for_body26_30;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_10 = Conv_for_body26_30_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_10 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) begin
		Conv_for_body26_11 = Conv_for_body26_11_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		Conv_for_body26_11 = Conv_for_body26_22;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		Conv_for_body26_11 = Conv_for_body26_22_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_11 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_11_reg <= Conv_for_body26_11;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_11_reg <= Conv_for_body26_11;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_0 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0)) begin
		Conv_for_body26_n_0145 = Conv_for_body26_n_0145_reg;
	end
	else if ((for_loop__digit_recognition_h_56_21_1_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0))) begin
		Conv_for_body26_n_0145 = Conv_for_body26_add53_var0_reg_stage1;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_n_0145 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_1_valid_bit_0 & for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_m_0144_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0)) & for_loop__digit_recognition_h_56_21_1_state_enable_1)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59;
	end
	else if (((for_loop__digit_recognition_h_56_21_1_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0)) & ~(for_loop__digit_recognition_h_56_21_1_state_enable_1))) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_m_0144 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
end
always @(*) begin
		Conv_for_body26_scevgep8 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep7 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep6 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep5 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep4 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep3 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep2 = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep = (1'd0 + (2 * for_loop__digit_recognition_h_56_21_1_inductionVar_stage0));
end
always @(*) begin
		Conv_for_body26_12 = _ZL13conv2_weights_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_13 = $signed(Conv_for_body26_12);
end
always @(*) begin
		Conv_for_body26_14 = (Conv_for_body12_c_0150_reg + Conv_for_body26_n_0145);
end
always @(*) begin
		Conv_for_body26_15 = (Conv_cond7_preheader_r_0151_reg + Conv_for_body26_m_0144);
end
always @(*) begin
		Conv_for_body26_bit_select10 = Conv_for_body26_15[29:0];
end
always @(*) begin
		Conv_for_body26_bit_select8 = Conv_for_body26_15[28:0];
end
always @(*) begin
		Conv_for_body26_bit_concat11 = {Conv_for_body26_bit_select10[29:0], Conv_for_body26_bit_concat11_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_for_body26_bit_concat9 = {Conv_for_body26_bit_select8[28:0], Conv_for_body26_bit_concat9_bit_select_operand_2[2:0]};
end
always @(*) begin
		Conv_for_body26_sr_add35 = (Conv_for_body26_15 + Conv_for_body26_bit_concat11);
end
always @(*) begin
		Conv_for_body26_sr_add36 = (Conv_for_body26_bit_concat9_reg_stage1 + Conv_for_body26_sr_add35_reg_stage1);
end
always @(*) begin
		Conv_for_body26_16 = (Conv_for_body26_14_reg_stage1 + Conv_for_body26_sr_add36);
end
always @(*) begin
		Conv_for_body26_17 = (1'd0 + (2 * Conv_for_body26_16_reg_stage2));
end
always @(*) begin
		Conv_for_body26_18 = maxpool_output_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_19 = $signed(Conv_for_body26_18);
end
always @(*) begin
	Conv_for_body26_20 = legup_mult_Conv_for_body26_20_out;
end
always @(*) begin
		Conv_for_body26_21 = $signed(Conv_for_body26_20);
end
always @(*) begin
		Conv_for_body26_22 = (Conv_for_body26_11_reg_stage4 + $signed({{4{Conv_for_body26_21[31]}},Conv_for_body26_21}));
end
always @(*) begin
		Conv_for_body26_bit_select7 = Conv_for_body26_22[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select7_reg <= Conv_for_body26_bit_select7;
	end
end
always @(*) begin
		Conv_for_body26_23 = _ZL13conv2_weights_a0_a1_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_24 = $signed(Conv_for_body26_23);
end
always @(*) begin
		Conv_for_body26_25 = (1'd0 + (2 * Conv_for_body26_16_reg_stage2));
end
always @(*) begin
		Conv_for_body26_26 = maxpool_output_a0_a0_a1_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_27 = $signed(Conv_for_body26_26);
end
always @(*) begin
	Conv_for_body26_28 = legup_mult_Conv_for_body26_28_out;
end
always @(*) begin
		Conv_for_body26_29 = $signed(Conv_for_body26_28);
end
always @(*) begin
		Conv_for_body26_30 = (Conv_for_body26_10_reg_stage4 + $signed({{4{Conv_for_body26_29[31]}},Conv_for_body26_29}));
end
always @(*) begin
		Conv_for_body26_bit_select6 = Conv_for_body26_30[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select6_reg <= Conv_for_body26_bit_select6;
	end
end
always @(*) begin
		Conv_for_body26_31 = _ZL13conv2_weights_a1_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_32 = $signed(Conv_for_body26_31);
end
always @(*) begin
	Conv_for_body26_33 = legup_mult_Conv_for_body26_33_out;
end
always @(*) begin
		Conv_for_body26_34 = $signed(Conv_for_body26_33);
end
always @(*) begin
		Conv_for_body26_35 = (Conv_for_body26_9_reg_stage4 + $signed({{4{Conv_for_body26_34[31]}},Conv_for_body26_34}));
end
always @(*) begin
		Conv_for_body26_bit_select5 = Conv_for_body26_35[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select5_reg <= Conv_for_body26_bit_select5;
	end
end
always @(*) begin
		Conv_for_body26_36 = _ZL13conv2_weights_a1_a1_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_37 = $signed(Conv_for_body26_36);
end
always @(*) begin
	Conv_for_body26_38 = legup_mult_Conv_for_body26_38_out;
end
always @(*) begin
		Conv_for_body26_39 = $signed(Conv_for_body26_38);
end
always @(*) begin
		Conv_for_body26_40 = (Conv_for_body26_8_reg_stage4 + $signed({{4{Conv_for_body26_39[31]}},Conv_for_body26_39}));
end
always @(*) begin
		Conv_for_body26_bit_select4 = Conv_for_body26_40[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select4_reg <= Conv_for_body26_bit_select4;
	end
end
always @(*) begin
		Conv_for_body26_41 = _ZL13conv2_weights_a2_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_42 = $signed(Conv_for_body26_41);
end
always @(*) begin
	Conv_for_body26_43 = legup_mult_Conv_for_body26_43_out;
end
always @(*) begin
		Conv_for_body26_44 = $signed(Conv_for_body26_43);
end
always @(*) begin
		Conv_for_body26_45 = (Conv_for_body26_7_reg_stage4 + $signed({{4{Conv_for_body26_44[31]}},Conv_for_body26_44}));
end
always @(*) begin
		Conv_for_body26_bit_select3 = Conv_for_body26_45[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select3_reg <= Conv_for_body26_bit_select3;
	end
end
always @(*) begin
		Conv_for_body26_46 = _ZL13conv2_weights_a2_a1_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_47 = $signed(Conv_for_body26_46);
end
always @(*) begin
	Conv_for_body26_48 = legup_mult_Conv_for_body26_48_out;
end
always @(*) begin
		Conv_for_body26_49 = $signed(Conv_for_body26_48);
end
always @(*) begin
		Conv_for_body26_50 = (Conv_for_body26_6_reg_stage4 + $signed({{4{Conv_for_body26_49[31]}},Conv_for_body26_49}));
end
always @(*) begin
		Conv_for_body26_bit_select2 = Conv_for_body26_50[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select2_reg <= Conv_for_body26_bit_select2;
	end
end
always @(*) begin
		Conv_for_body26_51 = _ZL13conv2_weights_a3_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_52 = $signed(Conv_for_body26_51);
end
always @(*) begin
	Conv_for_body26_53 = legup_mult_Conv_for_body26_53_out;
end
always @(*) begin
		Conv_for_body26_54 = $signed(Conv_for_body26_53);
end
always @(*) begin
		Conv_for_body26_55 = (Conv_for_body26_5_reg_stage4 + $signed({{4{Conv_for_body26_54[31]}},Conv_for_body26_54}));
end
always @(*) begin
		Conv_for_body26_bit_select1 = Conv_for_body26_55[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select1_reg <= Conv_for_body26_bit_select1;
	end
end
always @(*) begin
		Conv_for_body26_56 = _ZL13conv2_weights_a3_a1_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_57 = $signed(Conv_for_body26_56);
end
always @(*) begin
	Conv_for_body26_58 = legup_mult_Conv_for_body26_58_out;
end
always @(*) begin
		Conv_for_body26_59 = $signed(Conv_for_body26_58);
end
always @(*) begin
		Conv_for_body26_60 = (Conv_for_body26_4_reg_stage4 + $signed({{4{Conv_for_body26_59[31]}},Conv_for_body26_59}));
end
always @(*) begin
		Conv_for_body26_bit_select = Conv_for_body26_60[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_bit_select_reg <= Conv_for_body26_bit_select;
	end
end
always @(*) begin
		Conv_for_body26_cmp52 = (Conv_for_body26_n_0145 == 32'd2);
end
always @(*) begin
		Conv_for_body26_add53 = (Conv_for_body26_n_0145 + 32'd1);
end
always @(*) begin
		Conv_for_body26_add53_var0 = (Conv_for_body26_cmp52 ? 32'd0 : Conv_for_body26_add53);
end
always @(*) begin
		Conv_for_body26_not_cmp54 = (Conv_for_body26_add53_var0_reg_stage1 == 32'd0);
end
always @(*) begin
		Conv_for_body26_bit_concat = {Conv_for_body26_bit_concat_bit_select_operand_0[30:0], Conv_for_body26_not_cmp54};
end
always @(*) begin
		Conv_for_body26_cond59 = (Conv_for_body26_bit_concat + Conv_for_body26_m_0144_reg_stage1);
end
always @(*) begin
		Conv_for_body66_62 = (Conv_for_body26_bit_select7_reg + 16'd3);
end
always @(*) begin
		Conv_for_body66_63 = (Conv_for_body66_62 + Conv_for_body26_bit_select6_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_8)) begin
		Conv_for_body66_63_reg <= Conv_for_body66_63;
	end
end
always @(*) begin
		Conv_for_body66_64 = ($signed(Conv_for_body66_63_reg) > $signed({14'd0,Conv_for_body66_64_op1_temp}));
end
always @(*) begin
		Conv_for_body66_1 = (Conv_for_body66_64 ? Conv_for_body66_63_reg : 16'd0);
end
always @(*) begin
		Conv_for_body66_65 = (Conv_for_body26_bit_select5_reg + 16'd73);
end
always @(*) begin
		Conv_for_body66_66 = (Conv_for_body66_65 + Conv_for_body26_bit_select4_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_8)) begin
		Conv_for_body66_66_reg <= Conv_for_body66_66;
	end
end
always @(*) begin
		Conv_for_body66_67 = ($signed(Conv_for_body66_66_reg) > $signed({14'd0,Conv_for_body66_67_op1_temp}));
end
always @(*) begin
		Conv_for_body66_ref_tmp84_1 = (Conv_for_body66_67 ? Conv_for_body66_66_reg : 16'd0);
end
always @(*) begin
		Conv_for_body66_68 = (Conv_for_body26_bit_select3_reg + 16'd34);
end
always @(*) begin
		Conv_for_body66_69 = (Conv_for_body66_68 + Conv_for_body26_bit_select2_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_8)) begin
		Conv_for_body66_69_reg <= Conv_for_body66_69;
	end
end
always @(*) begin
		Conv_for_body66_70 = ($signed(Conv_for_body66_69_reg) > $signed({14'd0,Conv_for_body66_70_op1_temp}));
end
always @(*) begin
		Conv_for_body66_183 = (Conv_for_body66_70 ? Conv_for_body66_69_reg : 16'd0);
end
always @(*) begin
		Conv_for_body66_71 = (Conv_for_body26_bit_select1_reg + $signed(-16'd29));
end
always @(*) begin
		Conv_for_body66_72 = (Conv_for_body66_71 + Conv_for_body26_bit_select_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_8)) begin
		Conv_for_body66_72_reg <= Conv_for_body66_72;
	end
end
always @(*) begin
		Conv_for_body66_73 = ($signed(Conv_for_body66_72_reg) > $signed({14'd0,Conv_for_body66_73_op1_temp}));
end
always @(*) begin
		Conv_for_body66_ref_tmp84_3 = (Conv_for_body66_73 ? Conv_for_body66_72_reg : 16'd0);
end
always @(*) begin
		Conv_for_body66_74 = (Conv_for_body12_c_0150_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_8)) begin
		Conv_for_body66_74_reg <= Conv_for_body66_74;
	end
end
always @(*) begin
		Conv_for_body66_exitcond21 = (Conv_for_body66_74 == 32'd11);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_8)) begin
		Conv_for_body66_exitcond21_reg <= Conv_for_body66_exitcond21;
	end
end
always @(*) begin
		Conv_for_inc95_75 = (Conv_cond7_preheader_r_0151_reg + 32'd1);
end
always @(*) begin
		Conv_for_inc95_exitcond26 = (Conv_for_inc95_75 == 32'd11);
end
always @(*) begin
	_ZL13conv2_weights_a0_a0_a0_clken = _ZL13conv2_weights_a0_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a0_a0_a0_address_a = _ZL13conv2_weights_a0_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a0_a0_a0_address_a = (Conv_for_body26_scevgep8 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a0_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a0_a1_a0_clken = _ZL13conv2_weights_a0_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a0_a1_a0_address_a = _ZL13conv2_weights_a0_a1_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a0_a1_a0_address_a = (Conv_for_body26_scevgep7 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a0_a1_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a0_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a1_a0_a0_clken = _ZL13conv2_weights_a1_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a1_a0_a0_address_a = _ZL13conv2_weights_a1_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a1_a0_a0_address_a = (Conv_for_body26_scevgep6 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a1_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a1_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a1_a1_a0_clken = _ZL13conv2_weights_a1_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a1_a1_a0_address_a = _ZL13conv2_weights_a1_a1_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a1_a1_a0_address_a = (Conv_for_body26_scevgep5 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a1_a1_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a1_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a2_a0_a0_clken = _ZL13conv2_weights_a2_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a2_a0_a0_address_a = _ZL13conv2_weights_a2_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a2_a0_a0_address_a = (Conv_for_body26_scevgep4 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a2_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a2_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a2_a1_a0_clken = _ZL13conv2_weights_a2_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a2_a1_a0_address_a = _ZL13conv2_weights_a2_a1_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a2_a1_a0_address_a = (Conv_for_body26_scevgep3 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a2_a1_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a2_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a3_a0_a0_clken = _ZL13conv2_weights_a3_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a3_a0_a0_address_a = _ZL13conv2_weights_a3_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a3_a0_a0_address_a = (Conv_for_body26_scevgep2 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a3_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a3_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv2_weights_a3_a1_a0_clken = _ZL13conv2_weights_a3_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv2_weights_a3_a1_a0_address_a = _ZL13conv2_weights_a3_a1_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a3_a1_a0_address_a = (Conv_for_body26_scevgep >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv2_weights_a3_a1_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		_ZL13conv2_weights_a3_a1_a0_read_en_a = 1'd1;
	end
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_1_state_stall_0)) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_0 <= (for_loop__digit_recognition_h_56_21_1_II_counter & for_loop__digit_recognition_h_56_21_1_start);
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_0 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_1_state_stall_0 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_state_enable_0 = (for_loop__digit_recognition_h_56_21_1_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_1_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_1_state_stall_1)) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_1 <= for_loop__digit_recognition_h_56_21_1_state_enable_0;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_1 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_1_state_stall_1 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_state_enable_1 = (for_loop__digit_recognition_h_56_21_1_valid_bit_1 & ~(for_loop__digit_recognition_h_56_21_1_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_1_state_stall_2)) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_2 <= for_loop__digit_recognition_h_56_21_1_state_enable_1;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_2 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_1_state_stall_2 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_state_enable_2 = (for_loop__digit_recognition_h_56_21_1_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_1_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_1_state_stall_3)) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_3 <= for_loop__digit_recognition_h_56_21_1_state_enable_2;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_3 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_1_state_stall_3 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_state_enable_3 = (for_loop__digit_recognition_h_56_21_1_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_1_state_stall_3));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_1_state_stall_4)) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_4 <= for_loop__digit_recognition_h_56_21_1_state_enable_3;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_valid_bit_4 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_1_state_stall_4 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_state_enable_4 = (for_loop__digit_recognition_h_56_21_1_valid_bit_4 & ~(for_loop__digit_recognition_h_56_21_1_state_stall_4));
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_1_II_counter <= 1'd1;
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_start = (for_loop__digit_recognition_h_56_21_1_activate_pipeline | ((for_loop__digit_recognition_h_56_21_1_active & ~(for_loop__digit_recognition_h_56_21_1_epilogue)) & ~(for_loop__digit_recognition_h_56_21_1_pipeline_exit_cond)));
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_start = 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_activate_pipeline = (((fsm_stall == 1'd0) & for_loop__digit_recognition_h_56_21_1_begin_pipeline) & ~(for_loop__digit_recognition_h_56_21_1_active));
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_4_reg_stage4 <= Conv_for_body26_4;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_5_reg_stage4 <= Conv_for_body26_5;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_6_reg_stage4 <= Conv_for_body26_6;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_7_reg_stage4 <= Conv_for_body26_7;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_8_reg_stage4 <= Conv_for_body26_8;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_9_reg_stage4 <= Conv_for_body26_9;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_10_reg_stage4 <= Conv_for_body26_10;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_3) begin
		Conv_for_body26_11_reg_stage4 <= Conv_for_body26_11;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_m_0144_reg_stage1 <= Conv_for_body26_m_0144;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_13_reg_stage2 <= Conv_for_body26_13;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_13_reg_stage3 <= Conv_for_body26_13_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_14_reg_stage1 <= Conv_for_body26_14;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_bit_concat9_reg_stage1 <= Conv_for_body26_bit_concat9;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_sr_add35_reg_stage1 <= Conv_for_body26_sr_add35;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_16_reg_stage2 <= Conv_for_body26_16;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_22_reg_stage5 <= Conv_for_body26_22;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_24_reg_stage2 <= Conv_for_body26_24;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_24_reg_stage3 <= Conv_for_body26_24_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_30_reg_stage5 <= Conv_for_body26_30;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_32_reg_stage2 <= Conv_for_body26_32;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_32_reg_stage3 <= Conv_for_body26_32_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_35_reg_stage5 <= Conv_for_body26_35;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_37_reg_stage2 <= Conv_for_body26_37;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_37_reg_stage3 <= Conv_for_body26_37_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_40_reg_stage5 <= Conv_for_body26_40;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_42_reg_stage2 <= Conv_for_body26_42;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_42_reg_stage3 <= Conv_for_body26_42_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_45_reg_stage5 <= Conv_for_body26_45;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_47_reg_stage2 <= Conv_for_body26_47;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_47_reg_stage3 <= Conv_for_body26_47_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_50_reg_stage5 <= Conv_for_body26_50;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_52_reg_stage2 <= Conv_for_body26_52;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_52_reg_stage3 <= Conv_for_body26_52_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_55_reg_stage5 <= Conv_for_body26_55;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_57_reg_stage2 <= Conv_for_body26_57;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		Conv_for_body26_57_reg_stage3 <= Conv_for_body26_57_reg_stage2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_4) begin
		Conv_for_body26_60_reg_stage5 <= Conv_for_body26_60;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		Conv_for_body26_add53_var0_reg_stage1 <= Conv_for_body26_add53_var0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		Conv_for_body26_cond59_reg_stage2 <= Conv_for_body26_cond59;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_inductionVar_stage0 <= 0;
	end
	if (for_loop__digit_recognition_h_56_21_1_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_1_inductionVar_stage0 <= 0;
	end
	if ((for_loop__digit_recognition_h_56_21_1_II_counter & for_loop__digit_recognition_h_56_21_1_state_enable_0)) begin
		for_loop__digit_recognition_h_56_21_1_inductionVar_stage0 <= (for_loop__digit_recognition_h_56_21_1_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_pipeline_exit_cond = (for_loop__digit_recognition_h_56_21_1_state_enable_0 & (for_loop__digit_recognition_h_56_21_1_inductionVar_stage0 == 8));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_active <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_1_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_1_active <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_1_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_1_active <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_6) & (fsm_stall == 1'd0))) begin
		for_loop__digit_recognition_h_56_21_1_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_epilogue <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_1_pipeline_exit_cond & for_loop__digit_recognition_h_56_21_1_active)) begin
		for_loop__digit_recognition_h_56_21_1_epilogue <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_1_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_1_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_pipeline_finish = (for_loop__digit_recognition_h_56_21_1_pipeline_finishing | for_loop__digit_recognition_h_56_21_1_pipeline_finish_reg);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_pipeline_finishing = ((for_loop__digit_recognition_h_56_21_1_epilogue | for_loop__digit_recognition_h_56_21_1_pipeline_exit_cond) & for_loop__digit_recognition_h_56_21_1_only_last_stage_enabled);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_only_last_stage_enabled = ((for_loop__digit_recognition_h_56_21_1_num_active_iterations == 1'd1) & for_loop__digit_recognition_h_56_21_1_state_enable_4);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_num_active_iterations <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_1_inserting_new_iteration & ~(for_loop__digit_recognition_h_56_21_1_state_enable_4))) begin
		for_loop__digit_recognition_h_56_21_1_num_active_iterations <= (for_loop__digit_recognition_h_56_21_1_num_active_iterations + 1'd1);
	end
	if ((~(for_loop__digit_recognition_h_56_21_1_inserting_new_iteration) & for_loop__digit_recognition_h_56_21_1_state_enable_4)) begin
		for_loop__digit_recognition_h_56_21_1_num_active_iterations <= (for_loop__digit_recognition_h_56_21_1_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_1_inserting_new_iteration = ((~(for_loop__digit_recognition_h_56_21_1_state_stall_0) & for_loop__digit_recognition_h_56_21_1_II_counter) & for_loop__digit_recognition_h_56_21_1_start);
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_1_pipeline_finish_reg <= for_loop__digit_recognition_h_56_21_1_pipeline_finish;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_1_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_1_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_1_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_0) begin
		for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage1 <= for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_1) begin
		for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage2 <= for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage3 <= for_loop__digit_recognition_h_56_21_1_in_first_iteration_stage2;
	end
end
assign Conv_cond7_preheader_bit_concat15_bit_select_operand_2 = 1'd0;
assign Conv_cond7_preheader_bit_concat13_bit_select_operand_2 = 3'd0;
always @(*) begin
	_ZL13conv2_weights_a0_a0_a0_read_data_wire_a = _ZL13conv2_weights_a0_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a0_a0_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a0_a0_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a0_a0_a0_address_a_reg <= _ZL13conv2_weights_a0_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a0_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
assign Conv_for_body26_bit_concat11_bit_select_operand_2 = 2'd0;
assign Conv_for_body26_bit_concat9_bit_select_operand_2 = 3'd0;
always @(*) begin
	maxpool_output_a0_a0_a0_read_data_wire_a = maxpool_output_a0_a0_a0_read_data_a;
end
always @(*) begin
	maxpool_output_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_3);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clken = legup_mult_Conv_for_body26_20_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_dataa = Conv_for_body26_13_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_datab = Conv_for_body26_19;
end
always @(*) begin
	legup_mult_Conv_for_body26_20_out_actual = legup_split_mult_signed_16_16_32_10_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_20_out = $signed(legup_mult_Conv_for_body26_20_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_20_en = legup_mult_Conv_for_body26_20_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_20_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a0_a1_a0_read_data_wire_a = _ZL13conv2_weights_a0_a1_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a0_a1_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a0_a1_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a0_a1_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a0_a1_a0_address_a_reg <= _ZL13conv2_weights_a0_a1_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a0_a1_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	maxpool_output_a0_a0_a1_read_data_wire_a = maxpool_output_a0_a0_a1_read_data_a;
end
always @(*) begin
	maxpool_output_a0_a0_a1_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_3);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clken = legup_mult_Conv_for_body26_28_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_dataa = Conv_for_body26_24_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_datab = Conv_for_body26_27;
end
always @(*) begin
	legup_mult_Conv_for_body26_28_out_actual = legup_split_mult_signed_16_16_32_11_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_28_out = $signed(legup_mult_Conv_for_body26_28_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_28_en = legup_mult_Conv_for_body26_28_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_28_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a1_a0_a0_read_data_wire_a = _ZL13conv2_weights_a1_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a1_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a1_a0_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a1_a0_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a1_a0_a0_address_a_reg <= _ZL13conv2_weights_a1_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a1_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_clken = legup_mult_Conv_for_body26_33_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_dataa = Conv_for_body26_32_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_datab = Conv_for_body26_19;
end
always @(*) begin
	legup_mult_Conv_for_body26_33_out_actual = legup_split_mult_signed_16_16_32_12_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_33_out = $signed(legup_mult_Conv_for_body26_33_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_33_en = legup_mult_Conv_for_body26_33_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_33_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a1_a1_a0_read_data_wire_a = _ZL13conv2_weights_a1_a1_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a1_a1_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a1_a1_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a1_a1_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a1_a1_a0_address_a_reg <= _ZL13conv2_weights_a1_a1_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a1_a1_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_clken = legup_mult_Conv_for_body26_38_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_dataa = Conv_for_body26_37_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_datab = Conv_for_body26_27;
end
always @(*) begin
	legup_mult_Conv_for_body26_38_out_actual = legup_split_mult_signed_16_16_32_13_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_38_out = $signed(legup_mult_Conv_for_body26_38_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_38_en = legup_mult_Conv_for_body26_38_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_38_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a2_a0_a0_read_data_wire_a = _ZL13conv2_weights_a2_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a2_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a2_a0_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a2_a0_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a2_a0_a0_address_a_reg <= _ZL13conv2_weights_a2_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a2_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_14_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_14_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_14_clken = legup_mult_Conv_for_body26_43_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_14_dataa = Conv_for_body26_42_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_14_datab = Conv_for_body26_19;
end
always @(*) begin
	legup_mult_Conv_for_body26_43_out_actual = legup_split_mult_signed_16_16_32_14_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_43_out = $signed(legup_mult_Conv_for_body26_43_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_43_en = legup_mult_Conv_for_body26_43_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_43_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a2_a1_a0_read_data_wire_a = _ZL13conv2_weights_a2_a1_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a2_a1_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a2_a1_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a2_a1_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a2_a1_a0_address_a_reg <= _ZL13conv2_weights_a2_a1_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a2_a1_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_15_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_15_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_15_clken = legup_mult_Conv_for_body26_48_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_15_dataa = Conv_for_body26_47_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_15_datab = Conv_for_body26_27;
end
always @(*) begin
	legup_mult_Conv_for_body26_48_out_actual = legup_split_mult_signed_16_16_32_15_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_48_out = $signed(legup_mult_Conv_for_body26_48_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_48_en = legup_mult_Conv_for_body26_48_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_48_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a3_a0_a0_read_data_wire_a = _ZL13conv2_weights_a3_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a3_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a3_a0_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a3_a0_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a3_a0_a0_address_a_reg <= _ZL13conv2_weights_a3_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a3_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_16_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_16_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_16_clken = legup_mult_Conv_for_body26_53_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_16_dataa = Conv_for_body26_52_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_16_datab = Conv_for_body26_19;
end
always @(*) begin
	legup_mult_Conv_for_body26_53_out_actual = legup_split_mult_signed_16_16_32_16_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_53_out = $signed(legup_mult_Conv_for_body26_53_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_53_en = legup_mult_Conv_for_body26_53_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_53_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
always @(*) begin
	_ZL13conv2_weights_a3_a1_a0_read_data_wire_a = _ZL13conv2_weights_a3_a1_a0_read_data_a;
end
always @(*) begin
	_ZL13conv2_weights_a3_a1_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_1);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv2_weights_a3_a1_a0_address_a_reg <= 4'd0;
	end
	if (_ZL13conv2_weights_a3_a1_a0_address_a_reg_enable) begin
		_ZL13conv2_weights_a3_a1_a0_address_a_reg <= _ZL13conv2_weights_a3_a1_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv2_weights_a3_a1_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_1_state_enable_0;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_17_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_17_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_17_clken = legup_mult_Conv_for_body26_58_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_17_dataa = Conv_for_body26_57_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_17_datab = Conv_for_body26_27;
end
always @(*) begin
	legup_mult_Conv_for_body26_58_out_actual = legup_split_mult_signed_16_16_32_17_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_58_out = $signed(legup_mult_Conv_for_body26_58_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_58_en = legup_mult_Conv_for_body26_58_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_58_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_1_state_stall_4);
end
assign Conv_for_body26_bit_concat_bit_select_operand_0 = 31'd0;
assign Conv_for_body66_64_op1_temp = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign Conv_for_body66_67_op1_temp = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a1_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign Conv_for_body66_70_op1_temp = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a2_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign Conv_for_body66_73_op1_temp = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a3_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	maxpool_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		maxpool_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	maxpool_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		maxpool_output_valid_write_data = 8'd0;
	end
end
always @(*) begin
	conv2_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		conv2_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv2_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_12)) begin
		conv2_output_valid_write_data = 8'd1;
	end
end
always @(*) begin
	maxpool_output_a0_a0_a0_clken = maxpool_output_a0_a0_a0_clken_pipeline_cond;
end
assign maxpool_output_a0_a0_a0_write_en_a = 1'd0;
assign maxpool_output_a0_a0_a0_write_data_a = 16'd0;
always @(*) begin
	maxpool_output_a0_a0_a0_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		maxpool_output_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	maxpool_output_a0_a0_a0_address_a = 8'd0;
	if (for_loop__digit_recognition_h_56_21_1_valid_bit_2) begin
		maxpool_output_a0_a0_a0_address_a = (Conv_for_body26_17 >>> 1'd1);
	end
end
always @(*) begin
	maxpool_output_a0_a0_a1_clken = maxpool_output_a0_a0_a1_clken_pipeline_cond;
end
assign maxpool_output_a0_a0_a1_write_en_a = 1'd0;
assign maxpool_output_a0_a0_a1_write_data_a = 16'd0;
always @(*) begin
	maxpool_output_a0_a0_a1_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_1_state_enable_2) begin
		maxpool_output_a0_a0_a1_read_en_a = 1'd1;
	end
end
always @(*) begin
	maxpool_output_a0_a0_a1_address_a = 8'd0;
	if (for_loop__digit_recognition_h_56_21_1_valid_bit_2) begin
		maxpool_output_a0_a0_a1_address_a = (Conv_for_body26_25 >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a0_clken = conv2_output_a0_a0_a0_clken_sequential_cond;
end
always @(*) begin
	conv2_output_a0_a0_a0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a0_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a0_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a0_write_data_a = Conv_for_body66_1;
	end
end
assign conv2_output_a0_a0_a0_read_en_a = 1'd0;
always @(*) begin
	conv2_output_a0_a0_a0_address_a = 7'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a0_address_a = (Conv_for_body12_scevgep13_reg >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a1_clken = conv2_output_a0_a0_a1_clken_sequential_cond;
end
always @(*) begin
	conv2_output_a0_a0_a1_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a1_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a1_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a1_write_data_a = Conv_for_body66_ref_tmp84_1;
	end
end
assign conv2_output_a0_a0_a1_read_en_a = 1'd0;
always @(*) begin
	conv2_output_a0_a0_a1_address_a = 7'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a1_address_a = (Conv_for_body12_scevgep11_reg >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a2_clken = conv2_output_a0_a0_a2_clken_sequential_cond;
end
always @(*) begin
	conv2_output_a0_a0_a2_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a2_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a2_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a2_write_data_a = Conv_for_body66_183;
	end
end
assign conv2_output_a0_a0_a2_read_en_a = 1'd0;
always @(*) begin
	conv2_output_a0_a0_a2_address_a = 7'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a2_address_a = (Conv_for_body12_scevgep12_reg >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a3_clken = conv2_output_a0_a0_a3_clken_sequential_cond;
end
always @(*) begin
	conv2_output_a0_a0_a3_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a3_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a3_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a3_write_data_a = Conv_for_body66_ref_tmp84_3;
	end
end
assign conv2_output_a0_a0_a3_read_en_a = 1'd0;
always @(*) begin
	conv2_output_a0_a0_a3_address_a = 7'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_body66_9)) begin
		conv2_output_a0_a0_a3_address_a = (Conv_for_body12_scevgep10_reg >>> 1'd1);
	end
end

endmodule
`timescale 1 ns / 1 ns
module Conv_overloaded_2
(
	clk,
	reset,
	start,
	ready,
	finish,
	conv2_output_valid_write_en,
	conv2_output_valid_write_data,
	conv2_output_valid_read_data,
	conv3_output_valid_write_en,
	conv3_output_valid_write_data,
	conv3_output_valid_read_data,
	conv3_output_a0_a0_a0_clken,
	conv3_output_a0_a0_a0_write_en_a,
	conv3_output_a0_a0_a0_write_data_a,
	conv3_output_a0_a0_a0_read_en_a,
	conv3_output_a0_a0_a0_address_a,
	conv3_output_a0_a0_a0_read_data_a,
	conv3_output_a0_a0_a0_write_en_b,
	conv3_output_a0_a0_a0_write_data_b,
	conv3_output_a0_a0_a0_read_en_b,
	conv3_output_a0_a0_a0_address_b,
	conv3_output_a0_a0_a0_read_data_b,
	conv2_output_a0_a0_a0_clken,
	conv2_output_a0_a0_a0_write_en_a,
	conv2_output_a0_a0_a0_write_data_a,
	conv2_output_a0_a0_a0_read_en_a,
	conv2_output_a0_a0_a0_address_a,
	conv2_output_a0_a0_a0_read_data_a,
	conv2_output_a0_a0_a1_clken,
	conv2_output_a0_a0_a1_write_en_a,
	conv2_output_a0_a0_a1_write_data_a,
	conv2_output_a0_a0_a1_read_en_a,
	conv2_output_a0_a0_a1_address_a,
	conv2_output_a0_a0_a1_read_data_a,
	conv2_output_a0_a0_a2_clken,
	conv2_output_a0_a0_a2_write_en_a,
	conv2_output_a0_a0_a2_write_data_a,
	conv2_output_a0_a0_a2_read_en_a,
	conv2_output_a0_a0_a2_address_a,
	conv2_output_a0_a0_a2_read_data_a,
	conv2_output_a0_a0_a3_clken,
	conv2_output_a0_a0_a3_write_en_a,
	conv2_output_a0_a0_a3_write_data_a,
	conv2_output_a0_a0_a3_read_en_a,
	conv2_output_a0_a0_a3_address_a,
	conv2_output_a0_a0_a3_read_data_a
);

parameter [4:0] LEGUP_0 = 5'd0;
parameter [4:0] LEGUP_F_Conv_BB_while_body_1 = 5'd1;
parameter [4:0] LEGUP_F_Conv_BB_while_body_backedge_2 = 5'd2;
parameter [4:0] LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3 = 5'd3;
parameter [4:0] LEGUP_F_Conv_BB_for_cond7_preheader_4 = 5'd4;
parameter [4:0] LEGUP_F_Conv_BB_for_cond10_preheader_5 = 5'd5;
parameter [4:0] LEGUP_F_Conv_BB_for_body12_6 = 5'd6;
parameter [4:0] LEGUP_F_Conv_BB_for_body12_7 = 5'd7;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_8 = 5'd8;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_9 = 5'd9;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_10 = 5'd10;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_11 = 5'd11;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_12 = 5'd12;
parameter [4:0] LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_2_13 = 5'd13;
parameter [4:0] LEGUP_F_Conv_BB_for_inc92_14 = 5'd14;
parameter [4:0] LEGUP_F_Conv_BB_for_inc95_15 = 5'd15;
parameter [4:0] LEGUP_F_Conv_BB_for_end97_16 = 5'd16;
parameter [4:0] LEGUP_F_Conv_BB_for_end97_17 = 5'd17;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  conv2_output_valid_write_en;
output reg [7:0] conv2_output_valid_write_data;
input [7:0] conv2_output_valid_read_data;
output reg  conv3_output_valid_write_en;
output reg [7:0] conv3_output_valid_write_data;
input [7:0] conv3_output_valid_read_data;
output reg  conv3_output_a0_a0_a0_clken;
output reg  conv3_output_a0_a0_a0_write_en_a;
output reg [15:0] conv3_output_a0_a0_a0_write_data_a;
output  conv3_output_a0_a0_a0_read_en_a;
output reg [8:0] conv3_output_a0_a0_a0_address_a;
input [15:0] conv3_output_a0_a0_a0_read_data_a;
output  conv3_output_a0_a0_a0_write_en_b;
output [15:0] conv3_output_a0_a0_a0_write_data_b;
output  conv3_output_a0_a0_a0_read_en_b;
output [8:0] conv3_output_a0_a0_a0_address_b;
input [15:0] conv3_output_a0_a0_a0_read_data_b;
output reg  conv2_output_a0_a0_a0_clken;
output  conv2_output_a0_a0_a0_write_en_a;
output [15:0] conv2_output_a0_a0_a0_write_data_a;
output reg  conv2_output_a0_a0_a0_read_en_a;
output reg [6:0] conv2_output_a0_a0_a0_address_a;
input [15:0] conv2_output_a0_a0_a0_read_data_a;
output reg  conv2_output_a0_a0_a1_clken;
output  conv2_output_a0_a0_a1_write_en_a;
output [15:0] conv2_output_a0_a0_a1_write_data_a;
output reg  conv2_output_a0_a0_a1_read_en_a;
output reg [6:0] conv2_output_a0_a0_a1_address_a;
input [15:0] conv2_output_a0_a0_a1_read_data_a;
output reg  conv2_output_a0_a0_a2_clken;
output  conv2_output_a0_a0_a2_write_en_a;
output [15:0] conv2_output_a0_a0_a2_write_data_a;
output reg  conv2_output_a0_a0_a2_read_en_a;
output reg [6:0] conv2_output_a0_a0_a2_address_a;
input [15:0] conv2_output_a0_a0_a2_read_data_a;
output reg  conv2_output_a0_a0_a3_clken;
output  conv2_output_a0_a0_a3_write_en_a;
output [15:0] conv2_output_a0_a0_a3_write_data_a;
output reg  conv2_output_a0_a0_a3_read_en_a;
output reg [6:0] conv2_output_a0_a0_a3_address_a;
input [15:0] conv2_output_a0_a0_a3_read_data_a;
reg [4:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [4:0] next_state;
wire  fsm_stall;
reg [7:0] Conv_while_body_0;
reg [7:0] Conv_while_body_1;
reg [7:0] Conv_while_body_2;
reg [7:0] Conv_while_body_and134;
reg  Conv_while_body_tobool4;
reg [31:0] Conv_cond7_preheader_r_0151;
reg [31:0] Conv_cond7_preheader_r_0151_reg;
reg [29:0] Conv_cond7_preheader_bit_select14;
reg [26:0] Conv_cond7_preheader_bit_select12;
reg [31:0] Conv_cond7_preheader_bit_concat15;
reg [31:0] Conv_cond7_preheader_bit_concat13;
reg [31:0] Conv_cond7_preheader_sr_add;
reg [31:0] Conv_cond7_preheader_sr_add_reg;
reg [31:0] Conv_ond10_preheader_c_0150;
reg [31:0] Conv_ond10_preheader_c_0150_reg;
reg [29:0] Conv_ond10_preheader_bit_select10;
reg [31:0] Conv_ond10_preheader_bit_concat11;
reg [31:0] Conv_ond10_preheader_3;
reg [31:0] Conv_ond10_preheader_3_reg;
reg [31:0] Conv_for_body12_od_0149;
reg [31:0] Conv_for_body12_od_0149_reg;
reg [28:0] Conv_for_body12_bit_select8;
reg [31:0] Conv_for_body12_4;
reg [31:0] Conv_for_body12_4_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep13_reg;
reg [31:0] Conv_for_body12_bit_concat9;
reg [31:0] Conv_for_body12_sr_add23;
reg [31:0] Conv_for_body12_sr_add23_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_arrayidx68;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_arrayidx68_reg;
reg [15:0] Conv_ond64_preheader_5;
reg [15:0] Conv_ond64_preheader_6;
reg [15:0] Conv_ond64_preheader_newEarly_14;
reg [15:0] Conv_ond64_preheader_newEarly_14_reg;
reg [15:0] Conv_ond64_preheader_newEarly_17;
reg [15:0] Conv_ond64_preheader_newEarly_17_reg;
reg [15:0] Conv_ond64_preheader_newCurOp_17;
reg [15:0] Conv_ond64_preheader_newCurOp_17_reg;
reg  Conv_ond64_preheader_7;
reg  Conv_ond64_preheader_7_reg;
reg [15:0] Conv_ond64_preheader_1;
reg [31:0] Conv_ond64_preheader_8;
reg [31:0] Conv_ond64_preheader_8_reg;
reg  Conv_ond64_preheader_exitcond9;
reg  Conv_ond64_preheader_exitcond9_reg;
reg [35:0] Conv_for_body26_9;
reg [35:0] Conv_for_body26_9_reg;
reg [35:0] Conv_for_body26_10;
reg [35:0] Conv_for_body26_10_reg;
reg [35:0] Conv_for_body26_11;
reg [35:0] Conv_for_body26_11_reg;
reg [35:0] Conv_for_body26_12;
reg [35:0] Conv_for_body26_12_reg;
reg [31:0] Conv_for_body26_n_0145;
reg [31:0] Conv_for_body26_n_0145_reg;
reg [31:0] Conv_for_body26_m_0144;
reg [31:0] Conv_for_body26_m_0144_reg;
reg [31:0] Conv_for_body26_13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep;
reg [15:0] Conv_for_body26_14;
reg [15:0] Conv_for_body26_15;
reg [31:0] Conv_for_body26_16;
reg [31:0] Conv_for_body26_17;
reg [30:0] Conv_for_body26_bit_select2;
reg [28:0] Conv_for_body26_bit_select;
reg [31:0] Conv_for_body26_bit_concat3;
reg [31:0] Conv_for_body26_bit_concat1;
reg [31:0] Conv_for_body26_sr_add26;
reg [31:0] Conv_for_body26_sr_add27;
reg [31:0] Conv_for_body26_18;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_19;
reg [15:0] Conv_for_body26_20;
reg [15:0] Conv_for_body26_21;
reg [31:0] Conv_for_body26_22;
reg [31:0] Conv_for_body26_23;
reg [35:0] Conv_for_body26_24;
reg [15:0] Conv_for_body26_bit_select7;
reg [15:0] Conv_for_body26_bit_select7_reg;
reg [15:0] Conv_for_body26_25;
reg [15:0] Conv_for_body26_26;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_27;
reg [15:0] Conv_for_body26_28;
reg [15:0] Conv_for_body26_29;
reg [31:0] Conv_for_body26_30;
reg [31:0] Conv_for_body26_31;
reg [35:0] Conv_for_body26_32;
reg [15:0] Conv_for_body26_bit_select6;
reg [15:0] Conv_for_body26_bit_select6_reg;
reg [15:0] Conv_for_body26_33;
reg [15:0] Conv_for_body26_34;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_35;
reg [15:0] Conv_for_body26_36;
reg [15:0] Conv_for_body26_37;
reg [31:0] Conv_for_body26_38;
reg [31:0] Conv_for_body26_39;
reg [35:0] Conv_for_body26_40;
reg [15:0] Conv_for_body26_bit_select5;
reg [15:0] Conv_for_body26_bit_select5_reg;
reg [15:0] Conv_for_body26_41;
reg [15:0] Conv_for_body26_42;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_43;
reg [15:0] Conv_for_body26_44;
reg [15:0] Conv_for_body26_45;
reg [31:0] Conv_for_body26_46;
reg [31:0] Conv_for_body26_47;
reg [35:0] Conv_for_body26_48;
reg [15:0] Conv_for_body26_bit_select4;
reg [15:0] Conv_for_body26_bit_select4_reg;
reg  Conv_for_body26_cmp52;
reg [31:0] Conv_for_body26_add53;
reg [31:0] Conv_for_body26_add53_var0;
reg  Conv_for_body26_not_cmp54;
reg [31:0] Conv_for_body26_bit_concat;
reg [31:0] Conv_for_body26_cond59;
reg [31:0] Conv_for_inc92_50;
reg  Conv_for_inc92_exitcond17;
reg [31:0] Conv_for_inc95_51;
reg  Conv_for_inc95_exitcond19;
reg  _ZL13conv3_weights_a0_a0_a0_clken;
reg [5:0] _ZL13conv3_weights_a0_a0_a0_address_a;
wire [15:0] _ZL13conv3_weights_a0_a0_a0_read_data_a;
reg  _ZL13conv3_weights_a0_a0_a0_read_en_a;
reg  _ZL13conv3_weights_a0_a1_a0_clken;
reg [5:0] _ZL13conv3_weights_a0_a1_a0_address_a;
wire [15:0] _ZL13conv3_weights_a0_a1_a0_read_data_a;
reg  _ZL13conv3_weights_a0_a1_a0_read_en_a;
reg  _ZL13conv3_weights_a0_a2_a0_clken;
reg [5:0] _ZL13conv3_weights_a0_a2_a0_address_a;
wire [15:0] _ZL13conv3_weights_a0_a2_a0_read_data_a;
reg  _ZL13conv3_weights_a0_a2_a0_read_en_a;
reg  _ZL13conv3_weights_a0_a3_a0_clken;
reg [5:0] _ZL13conv3_weights_a0_a3_a0_address_a;
wire [15:0] _ZL13conv3_weights_a0_a3_a0_read_data_a;
reg  _ZL13conv3_weights_a0_a3_a0_read_en_a;
reg  _ZL10conv3_bias_clken;
reg [1:0] _ZL10conv3_bias_address_a;
wire [15:0] _ZL10conv3_bias_read_data_a;
reg  _ZL10conv3_bias_read_en_a;
reg  for_loop__digit_recognition_h_56_21_2_valid_bit_0;
wire  for_loop__digit_recognition_h_56_21_2_state_stall_0;
reg  for_loop__digit_recognition_h_56_21_2_state_enable_0;
reg  for_loop__digit_recognition_h_56_21_2_valid_bit_1;
wire  for_loop__digit_recognition_h_56_21_2_state_stall_1;
reg  for_loop__digit_recognition_h_56_21_2_state_enable_1;
reg  for_loop__digit_recognition_h_56_21_2_valid_bit_2;
wire  for_loop__digit_recognition_h_56_21_2_state_stall_2;
reg  for_loop__digit_recognition_h_56_21_2_state_enable_2;
reg  for_loop__digit_recognition_h_56_21_2_valid_bit_3;
wire  for_loop__digit_recognition_h_56_21_2_state_stall_3;
reg  for_loop__digit_recognition_h_56_21_2_state_enable_3;
reg  for_loop__digit_recognition_h_56_21_2_valid_bit_4;
wire  for_loop__digit_recognition_h_56_21_2_state_stall_4;
reg  for_loop__digit_recognition_h_56_21_2_state_enable_4;
reg  for_loop__digit_recognition_h_56_21_2_II_counter;
reg  for_loop__digit_recognition_h_56_21_2_start;
reg  for_loop__digit_recognition_h_56_21_2_activate_pipeline;
reg [35:0] Conv_for_body26_9_reg_stage4;
reg [35:0] Conv_for_body26_10_reg_stage4;
reg [35:0] Conv_for_body26_11_reg_stage4;
reg [35:0] Conv_for_body26_12_reg_stage4;
reg [31:0] Conv_for_body26_m_0144_reg_stage1;
reg [31:0] Conv_for_body26_13_reg_stage1;
reg [15:0] Conv_for_body26_15_reg_stage3;
reg [31:0] Conv_for_body26_16_reg_stage1;
reg [31:0] Conv_for_body26_bit_concat1_reg_stage1;
reg [31:0] Conv_for_body26_sr_add26_reg_stage1;
reg [31:0] Conv_for_body26_18_reg_stage2;
reg [35:0] Conv_for_body26_24_reg_stage5;
reg [15:0] Conv_for_body26_26_reg_stage3;
reg [35:0] Conv_for_body26_32_reg_stage5;
reg [15:0] Conv_for_body26_34_reg_stage3;
reg [35:0] Conv_for_body26_40_reg_stage5;
reg [15:0] Conv_for_body26_42_reg_stage3;
reg [35:0] Conv_for_body26_48_reg_stage5;
reg [31:0] Conv_for_body26_add53_var0_reg_stage1;
reg [31:0] Conv_for_body26_cond59_reg_stage2;
reg [31:0] for_loop__digit_recognition_h_56_21_2_inductionVar_stage0;
reg  for_loop__digit_recognition_h_56_21_2_pipeline_exit_cond;
reg  for_loop__digit_recognition_h_56_21_2_active;
reg  for_loop__digit_recognition_h_56_21_2_begin_pipeline;
reg  for_loop__digit_recognition_h_56_21_2_epilogue;
reg  for_loop__digit_recognition_h_56_21_2_pipeline_finish;
reg  for_loop__digit_recognition_h_56_21_2_pipeline_finishing;
reg  for_loop__digit_recognition_h_56_21_2_only_last_stage_enabled;
reg [2:0] for_loop__digit_recognition_h_56_21_2_num_active_iterations;
reg  for_loop__digit_recognition_h_56_21_2_inserting_new_iteration;
reg  for_loop__digit_recognition_h_56_21_2_pipeline_finish_reg;
reg  for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0;
reg  for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage1;
reg  for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage2;
reg  for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3;
wire [1:0] Conv_cond7_preheader_bit_concat15_bit_select_operand_2;
wire [4:0] Conv_cond7_preheader_bit_concat13_bit_select_operand_2;
wire [1:0] Conv_ond10_preheader_bit_concat11_bit_select_operand_2;
wire [2:0] Conv_for_body12_bit_concat9_bit_select_operand_2;
reg [15:0] _ZL10conv3_bias_read_data_wire_a;
reg  _ZL10conv3_bias_clken_sequential_cond;
wire [1:0] Conv_ond64_preheader_7_op1_temp;
reg  conv3_output_a0_a0_a0_clken_sequential_cond;
reg [15:0] _ZL13conv3_weights_a0_a0_a0_read_data_wire_a;
reg  _ZL13conv3_weights_a0_a0_a0_clken_pipeline_cond;
reg [5:0] _ZL13conv3_weights_a0_a0_a0_address_a_reg;
reg  _ZL13conv3_weights_a0_a0_a0_address_a_reg_enable;
wire  Conv_for_body26_bit_concat3_bit_select_operand_2;
wire [2:0] Conv_for_body26_bit_concat1_bit_select_operand_2;
reg [15:0] conv2_output_a0_a0_a0_read_data_wire_a;
reg  conv2_output_a0_a0_a0_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_10_clock;
reg  legup_split_mult_signed_16_16_32_10_aclr;
reg  legup_split_mult_signed_16_16_32_10_clken;
reg [15:0] legup_split_mult_signed_16_16_32_10_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_10_datab;
wire [31:0] legup_split_mult_signed_16_16_32_10_result;
reg [31:0] legup_mult_Conv_for_body26_22_out_actual;
reg [31:0] legup_mult_Conv_for_body26_22_out;
reg  legup_mult_Conv_for_body26_22_en;
reg  legup_mult_Conv_for_body26_22_en_pipeline_cond;
reg [15:0] _ZL13conv3_weights_a0_a1_a0_read_data_wire_a;
reg  _ZL13conv3_weights_a0_a1_a0_clken_pipeline_cond;
reg [5:0] _ZL13conv3_weights_a0_a1_a0_address_a_reg;
reg  _ZL13conv3_weights_a0_a1_a0_address_a_reg_enable;
reg [15:0] conv2_output_a0_a0_a1_read_data_wire_a;
reg  conv2_output_a0_a0_a1_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_11_clock;
reg  legup_split_mult_signed_16_16_32_11_aclr;
reg  legup_split_mult_signed_16_16_32_11_clken;
reg [15:0] legup_split_mult_signed_16_16_32_11_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_11_datab;
wire [31:0] legup_split_mult_signed_16_16_32_11_result;
reg [31:0] legup_mult_Conv_for_body26_30_out_actual;
reg [31:0] legup_mult_Conv_for_body26_30_out;
reg  legup_mult_Conv_for_body26_30_en;
reg  legup_mult_Conv_for_body26_30_en_pipeline_cond;
reg [15:0] _ZL13conv3_weights_a0_a2_a0_read_data_wire_a;
reg  _ZL13conv3_weights_a0_a2_a0_clken_pipeline_cond;
reg [5:0] _ZL13conv3_weights_a0_a2_a0_address_a_reg;
reg  _ZL13conv3_weights_a0_a2_a0_address_a_reg_enable;
reg [15:0] conv2_output_a0_a0_a2_read_data_wire_a;
reg  conv2_output_a0_a0_a2_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_12_clock;
reg  legup_split_mult_signed_16_16_32_12_aclr;
reg  legup_split_mult_signed_16_16_32_12_clken;
reg [15:0] legup_split_mult_signed_16_16_32_12_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_12_datab;
wire [31:0] legup_split_mult_signed_16_16_32_12_result;
reg [31:0] legup_mult_Conv_for_body26_38_out_actual;
reg [31:0] legup_mult_Conv_for_body26_38_out;
reg  legup_mult_Conv_for_body26_38_en;
reg  legup_mult_Conv_for_body26_38_en_pipeline_cond;
reg [15:0] _ZL13conv3_weights_a0_a3_a0_read_data_wire_a;
reg  _ZL13conv3_weights_a0_a3_a0_clken_pipeline_cond;
reg [5:0] _ZL13conv3_weights_a0_a3_a0_address_a_reg;
reg  _ZL13conv3_weights_a0_a3_a0_address_a_reg_enable;
reg [15:0] conv2_output_a0_a0_a3_read_data_wire_a;
reg  conv2_output_a0_a0_a3_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_13_clock;
reg  legup_split_mult_signed_16_16_32_13_aclr;
reg  legup_split_mult_signed_16_16_32_13_clken;
reg [15:0] legup_split_mult_signed_16_16_32_13_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_13_datab;
wire [31:0] legup_split_mult_signed_16_16_32_13_result;
reg [31:0] legup_mult_Conv_for_body26_46_out_actual;
reg [31:0] legup_mult_Conv_for_body26_46_out;
reg  legup_mult_Conv_for_body26_46_en;
reg  legup_mult_Conv_for_body26_46_en_pipeline_cond;
wire [30:0] Conv_for_body26_bit_concat_bit_select_operand_0;

/*   %17 = mul i32 %12, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_10 (
	.clock (legup_split_mult_signed_16_16_32_10_clock),
	.aclr (legup_split_mult_signed_16_16_32_10_aclr),
	.clken (legup_split_mult_signed_16_16_32_10_clken),
	.dataa (legup_split_mult_signed_16_16_32_10_dataa),
	.datab (legup_split_mult_signed_16_16_32_10_datab),
	.result (legup_split_mult_signed_16_16_32_10_result)
);

defparam
	legup_split_mult_signed_16_16_32_10.widtha = 16,
	legup_split_mult_signed_16_16_32_10.widthb = 16,
	legup_split_mult_signed_16_16_32_10.widthp = 32,
	legup_split_mult_signed_16_16_32_10.pipeline = 1,
	legup_split_mult_signed_16_16_32_10.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_10.preserve_module_hierarchy = 0;

/*   %22 = mul i32 %21, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_11 (
	.clock (legup_split_mult_signed_16_16_32_11_clock),
	.aclr (legup_split_mult_signed_16_16_32_11_aclr),
	.clken (legup_split_mult_signed_16_16_32_11_clken),
	.dataa (legup_split_mult_signed_16_16_32_11_dataa),
	.datab (legup_split_mult_signed_16_16_32_11_datab),
	.result (legup_split_mult_signed_16_16_32_11_result)
);

defparam
	legup_split_mult_signed_16_16_32_11.widtha = 16,
	legup_split_mult_signed_16_16_32_11.widthb = 16,
	legup_split_mult_signed_16_16_32_11.widthp = 32,
	legup_split_mult_signed_16_16_32_11.pipeline = 1,
	legup_split_mult_signed_16_16_32_11.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_11.preserve_module_hierarchy = 0;

/*   %33 = mul i32 %32, %19, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_12 (
	.clock (legup_split_mult_signed_16_16_32_12_clock),
	.aclr (legup_split_mult_signed_16_16_32_12_aclr),
	.clken (legup_split_mult_signed_16_16_32_12_clken),
	.dataa (legup_split_mult_signed_16_16_32_12_dataa),
	.datab (legup_split_mult_signed_16_16_32_12_datab),
	.result (legup_split_mult_signed_16_16_32_12_result)
);

defparam
	legup_split_mult_signed_16_16_32_12.widtha = 16,
	legup_split_mult_signed_16_16_32_12.widthb = 16,
	legup_split_mult_signed_16_16_32_12.widthp = 32,
	legup_split_mult_signed_16_16_32_12.pipeline = 1,
	legup_split_mult_signed_16_16_32_12.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_12.preserve_module_hierarchy = 0;

/*   %38 = mul i32 %37, %27, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_13 (
	.clock (legup_split_mult_signed_16_16_32_13_clock),
	.aclr (legup_split_mult_signed_16_16_32_13_aclr),
	.clken (legup_split_mult_signed_16_16_32_13_clken),
	.dataa (legup_split_mult_signed_16_16_32_13_dataa),
	.datab (legup_split_mult_signed_16_16_32_13_datab),
	.result (legup_split_mult_signed_16_16_32_13_result)
);

defparam
	legup_split_mult_signed_16_16_32_13.widtha = 16,
	legup_split_mult_signed_16_16_32_13.widthb = 16,
	legup_split_mult_signed_16_16_32_13.widthp = 32,
	legup_split_mult_signed_16_16_32_13.pipeline = 1,
	legup_split_mult_signed_16_16_32_13.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_13.preserve_module_hierarchy = 0;



// @_ZL13conv3_weights.a0.a0.a0 = internal unnamed_addr constant [36 x i16] [i16 4975, i16 2523, i16 1577, i16 74, i16 218, i16 1389, i16 862, i16 1639, i16 2762, i16 -5438, i16 -7304, i16 -15740, i16 -1...
rom_single_port _ZL13conv3_weights_a0_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv3_weights_a0_a0_a0_clken ),
	.address_a( _ZL13conv3_weights_a0_a0_a0_address_a ),
	.read_data_a( _ZL13conv3_weights_a0_a0_a0_read_data_a )
);
defparam _ZL13conv3_weights_a0_a0_a0.width_a = 16;
defparam _ZL13conv3_weights_a0_a0_a0.widthad_a = 6;
defparam _ZL13conv3_weights_a0_a0_a0.numwords_a = 36;
defparam _ZL13conv3_weights_a0_a0_a0.latency = 1;
defparam _ZL13conv3_weights_a0_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv3_weights_a0_a0_a0.mem"};



// @_ZL13conv3_weights.a0.a1.a0 = internal unnamed_addr constant [36 x i16] [i16 -45, i16 -2066, i16 3934, i16 5112, i16 1316, i16 2389, i16 -2595, i16 2392, i16 -4292, i16 -2810, i16 4574, i16 -599, i16...
rom_single_port _ZL13conv3_weights_a0_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv3_weights_a0_a1_a0_clken ),
	.address_a( _ZL13conv3_weights_a0_a1_a0_address_a ),
	.read_data_a( _ZL13conv3_weights_a0_a1_a0_read_data_a )
);
defparam _ZL13conv3_weights_a0_a1_a0.width_a = 16;
defparam _ZL13conv3_weights_a0_a1_a0.widthad_a = 6;
defparam _ZL13conv3_weights_a0_a1_a0.numwords_a = 36;
defparam _ZL13conv3_weights_a0_a1_a0.latency = 1;
defparam _ZL13conv3_weights_a0_a1_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv3_weights_a0_a1_a0.mem"};



// @_ZL13conv3_weights.a0.a2.a0 = internal unnamed_addr constant [36 x i16] [i16 -641, i16 -320, i16 -1737, i16 4638, i16 824, i16 204, i16 36, i16 10637, i16 7288, i16 6800, i16 4050, i16 649, i16 3500,...
rom_single_port _ZL13conv3_weights_a0_a2_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv3_weights_a0_a2_a0_clken ),
	.address_a( _ZL13conv3_weights_a0_a2_a0_address_a ),
	.read_data_a( _ZL13conv3_weights_a0_a2_a0_read_data_a )
);
defparam _ZL13conv3_weights_a0_a2_a0.width_a = 16;
defparam _ZL13conv3_weights_a0_a2_a0.widthad_a = 6;
defparam _ZL13conv3_weights_a0_a2_a0.numwords_a = 36;
defparam _ZL13conv3_weights_a0_a2_a0.latency = 1;
defparam _ZL13conv3_weights_a0_a2_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv3_weights_a0_a2_a0.mem"};



// @_ZL13conv3_weights.a0.a3.a0 = internal unnamed_addr constant [36 x i16] [i16 2825, i16 2792, i16 -432, i16 2284, i16 -1343, i16 -5801, i16 10743, i16 4103, i16 1350, i16 7765, i16 3643, i16 655, i16 ...
rom_single_port _ZL13conv3_weights_a0_a3_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv3_weights_a0_a3_a0_clken ),
	.address_a( _ZL13conv3_weights_a0_a3_a0_address_a ),
	.read_data_a( _ZL13conv3_weights_a0_a3_a0_read_data_a )
);
defparam _ZL13conv3_weights_a0_a3_a0.width_a = 16;
defparam _ZL13conv3_weights_a0_a3_a0.widthad_a = 6;
defparam _ZL13conv3_weights_a0_a3_a0.numwords_a = 36;
defparam _ZL13conv3_weights_a0_a3_a0.latency = 1;
defparam _ZL13conv3_weights_a0_a3_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv3_weights_a0_a3_a0.mem"};



// @_ZL10conv3_bias = internal unnamed_addr constant [4 x i16] [i16 -32, i16 78, i16 69, i16 40], align 2
rom_single_port _ZL10conv3_bias (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL10conv3_bias_clken ),
	.address_a( _ZL10conv3_bias_address_a ),
	.read_data_a( _ZL10conv3_bias_read_data_a )
);
defparam _ZL10conv3_bias.width_a = 16;
defparam _ZL10conv3_bias.widthad_a = 2;
defparam _ZL10conv3_bias.numwords_a = 4;
defparam _ZL10conv3_bias.latency = 1;
defparam _ZL10conv3_bias.init_file = {`MEM_INIT_DIR, "_ZL10conv3_bias.mem"};


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
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_F_Conv_BB_for_body12_6:
		next_state = LEGUP_F_Conv_BB_for_body12_7;
LEGUP_F_Conv_BB_for_body12_7:
		next_state = LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_2_13;
LEGUP_F_Conv_BB_for_cond10_preheader_5:
		next_state = LEGUP_F_Conv_BB_for_body12_6;
LEGUP_F_Conv_BB_for_cond64_preheader_10:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_11;
LEGUP_F_Conv_BB_for_cond64_preheader_11:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_12;
LEGUP_F_Conv_BB_for_cond64_preheader_12:
	if ((fsm_stall == 1'd0) && (Conv_ond64_preheader_exitcond9_reg == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_inc92_14;
	else if ((fsm_stall == 1'd0) && (Conv_ond64_preheader_exitcond9_reg == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_body12_6;
LEGUP_F_Conv_BB_for_cond64_preheader_8:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_9;
LEGUP_F_Conv_BB_for_cond64_preheader_9:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_10;
LEGUP_F_Conv_BB_for_cond7_preheader_4:
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_5;
LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3:
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_for_end97_16:
		next_state = LEGUP_F_Conv_BB_for_end97_17;
LEGUP_F_Conv_BB_for_end97_17:
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
LEGUP_F_Conv_BB_for_inc92_14:
	if ((fsm_stall == 1'd0) && (Conv_for_inc92_exitcond17 == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_inc95_15;
	else if ((fsm_stall == 1'd0) && (Conv_for_inc92_exitcond17 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_5;
LEGUP_F_Conv_BB_for_inc95_15:
	if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond19 == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_end97_16;
	else if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond19 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd1))
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3;
LEGUP_F_Conv_BB_while_body_backedge_2:
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_2_13:
	if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_2_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_8;
	else if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_2_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_8;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
		Conv_while_body_0 = conv2_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_1 = conv3_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_2 = (Conv_while_body_1 ^ 8'd1);
end
always @(*) begin
		Conv_while_body_and134 = (Conv_while_body_2 & Conv_while_body_0);
end
always @(*) begin
		Conv_while_body_tobool4 = (Conv_while_body_and134 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_15) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond19 == 1'd0))) */ begin
		Conv_cond7_preheader_r_0151 = Conv_for_inc95_51;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_15) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond19 == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
end
always @(*) begin
		Conv_cond7_preheader_bit_select14 = Conv_cond7_preheader_r_0151_reg[29:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_select12 = Conv_cond7_preheader_r_0151_reg[26:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_concat15 = {Conv_cond7_preheader_bit_select14[29:0], Conv_cond7_preheader_bit_concat15_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_cond7_preheader_bit_concat13 = {Conv_cond7_preheader_bit_select12[26:0], Conv_cond7_preheader_bit_concat13_bit_select_operand_2[4:0]};
end
always @(*) begin
		Conv_cond7_preheader_sr_add = (Conv_cond7_preheader_bit_concat15 + Conv_cond7_preheader_bit_concat13);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4)) begin
		Conv_cond7_preheader_sr_add_reg <= Conv_cond7_preheader_sr_add;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_ond10_preheader_c_0150 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_inc92_14) & (fsm_stall == 1'd0)) & (Conv_for_inc92_exitcond17 == 1'd0))) */ begin
		Conv_ond10_preheader_c_0150 = Conv_for_inc92_50;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_ond10_preheader_c_0150_reg <= Conv_ond10_preheader_c_0150;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_inc92_14) & (fsm_stall == 1'd0)) & (Conv_for_inc92_exitcond17 == 1'd0))) begin
		Conv_ond10_preheader_c_0150_reg <= Conv_ond10_preheader_c_0150;
	end
end
always @(*) begin
		Conv_ond10_preheader_bit_select10 = Conv_ond10_preheader_c_0150_reg[29:0];
end
always @(*) begin
		Conv_ond10_preheader_bit_concat11 = {Conv_ond10_preheader_bit_select10[29:0], Conv_ond10_preheader_bit_concat11_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_ond10_preheader_3 = (Conv_cond7_preheader_sr_add_reg + Conv_ond10_preheader_bit_concat11);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5)) begin
		Conv_ond10_preheader_3_reg <= Conv_ond10_preheader_3;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5) & (fsm_stall == 1'd0))) begin
		Conv_for_body12_od_0149 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_12) & (fsm_stall == 1'd0)) & (Conv_ond64_preheader_exitcond9_reg == 1'd0))) */ begin
		Conv_for_body12_od_0149 = Conv_ond64_preheader_8_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5) & (fsm_stall == 1'd0))) begin
		Conv_for_body12_od_0149_reg <= Conv_for_body12_od_0149;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_12) & (fsm_stall == 1'd0)) & (Conv_ond64_preheader_exitcond9_reg == 1'd0))) begin
		Conv_for_body12_od_0149_reg <= Conv_for_body12_od_0149;
	end
end
always @(*) begin
		Conv_for_body12_bit_select8 = Conv_for_body12_od_0149_reg[28:0];
end
always @(*) begin
		Conv_for_body12_4 = (Conv_ond10_preheader_3_reg + Conv_for_body12_od_0149_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_4_reg <= Conv_for_body12_4;
	end
end
always @(*) begin
		Conv_for_body12_scevgep13 = (1'd0 + (2 * Conv_for_body12_4_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_7)) begin
		Conv_for_body12_scevgep13_reg <= Conv_for_body12_scevgep13;
	end
end
always @(*) begin
		Conv_for_body12_bit_concat9 = {Conv_for_body12_bit_select8[28:0], Conv_for_body12_bit_concat9_bit_select_operand_2[2:0]};
end
always @(*) begin
		Conv_for_body12_sr_add23 = (Conv_for_body12_od_0149_reg + Conv_for_body12_bit_concat9);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_sr_add23_reg <= Conv_for_body12_sr_add23;
	end
end
always @(*) begin
		Conv_for_body12_arrayidx68 = (1'd0 + (2 * Conv_for_body12_od_0149_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_arrayidx68_reg <= Conv_for_body12_arrayidx68;
	end
end
always @(*) begin
		Conv_ond64_preheader_5 = _ZL10conv3_bias_read_data_wire_a;
end
always @(*) begin
		Conv_ond64_preheader_6 = (Conv_ond64_preheader_5 + Conv_for_body26_bit_select7_reg);
end
always @(*) begin
		Conv_ond64_preheader_newEarly_14 = (Conv_for_body26_bit_select6_reg + Conv_for_body26_bit_select5_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		Conv_ond64_preheader_newEarly_14_reg <= Conv_ond64_preheader_newEarly_14;
	end
end
always @(*) begin
		Conv_ond64_preheader_newEarly_17 = (Conv_ond64_preheader_6 + Conv_for_body26_bit_select4_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_9)) begin
		Conv_ond64_preheader_newEarly_17_reg <= Conv_ond64_preheader_newEarly_17;
	end
end
always @(*) begin
		Conv_ond64_preheader_newCurOp_17 = (Conv_ond64_preheader_newEarly_17_reg + Conv_ond64_preheader_newEarly_14_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_10)) begin
		Conv_ond64_preheader_newCurOp_17_reg <= Conv_ond64_preheader_newCurOp_17;
	end
end
always @(*) begin
		Conv_ond64_preheader_7 = ($signed(Conv_ond64_preheader_newCurOp_17) > $signed({14'd0,Conv_ond64_preheader_7_op1_temp}));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_10)) begin
		Conv_ond64_preheader_7_reg <= Conv_ond64_preheader_7;
	end
end
always @(*) begin
		Conv_ond64_preheader_1 = (Conv_ond64_preheader_7_reg ? Conv_ond64_preheader_newCurOp_17_reg : 16'd0);
end
always @(*) begin
		Conv_ond64_preheader_8 = (Conv_for_body12_od_0149_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		Conv_ond64_preheader_8_reg <= Conv_ond64_preheader_8;
	end
end
always @(*) begin
		Conv_ond64_preheader_exitcond9 = (Conv_ond64_preheader_8 == 32'd4);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		Conv_ond64_preheader_exitcond9_reg <= Conv_ond64_preheader_exitcond9;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) begin
		Conv_for_body26_9 = Conv_for_body26_9_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_2_state_enable_4)) begin
		Conv_for_body26_9 = Conv_for_body26_48;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_2_state_enable_4))) begin
		Conv_for_body26_9 = Conv_for_body26_48_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_9 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) begin
		Conv_for_body26_10 = Conv_for_body26_10_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_2_state_enable_4)) begin
		Conv_for_body26_10 = Conv_for_body26_40;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_2_state_enable_4))) begin
		Conv_for_body26_10 = Conv_for_body26_40_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_10 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) begin
		Conv_for_body26_11 = Conv_for_body26_11_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_2_state_enable_4)) begin
		Conv_for_body26_11 = Conv_for_body26_32;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_2_state_enable_4))) begin
		Conv_for_body26_11 = Conv_for_body26_32_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_11 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_11_reg <= Conv_for_body26_11;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_11_reg <= Conv_for_body26_11;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) begin
		Conv_for_body26_12 = Conv_for_body26_12_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & for_loop__digit_recognition_h_56_21_2_state_enable_4)) begin
		Conv_for_body26_12 = Conv_for_body26_24;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_56_21_2_state_enable_4))) begin
		Conv_for_body26_12 = Conv_for_body26_24_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_12 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_12_reg <= Conv_for_body26_12;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_12_reg <= Conv_for_body26_12;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_2_valid_bit_0 & for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0)) begin
		Conv_for_body26_n_0145 = Conv_for_body26_n_0145_reg;
	end
	else if ((for_loop__digit_recognition_h_56_21_2_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0))) begin
		Conv_for_body26_n_0145 = Conv_for_body26_add53_var0_reg_stage1;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_n_0145 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_2_valid_bit_0 & for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_m_0144_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0)) & for_loop__digit_recognition_h_56_21_2_state_enable_1)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59;
	end
	else if (((for_loop__digit_recognition_h_56_21_2_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0)) & ~(for_loop__digit_recognition_h_56_21_2_state_enable_1))) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_m_0144 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
end
always @(*) begin
		Conv_for_body26_13 = (Conv_for_body12_sr_add23_reg + for_loop__digit_recognition_h_56_21_2_inductionVar_stage0);
end
always @(*) begin
		Conv_for_body26_scevgep4 = (1'd0 + (2 * Conv_for_body26_13_reg_stage1));
end
always @(*) begin
		Conv_for_body26_scevgep3 = (1'd0 + (2 * Conv_for_body26_13_reg_stage1));
end
always @(*) begin
		Conv_for_body26_scevgep2 = (1'd0 + (2 * Conv_for_body26_13_reg_stage1));
end
always @(*) begin
		Conv_for_body26_scevgep = (1'd0 + (2 * Conv_for_body26_13_reg_stage1));
end
always @(*) begin
		Conv_for_body26_14 = _ZL13conv3_weights_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_15 = $signed(Conv_for_body26_14);
end
always @(*) begin
		Conv_for_body26_16 = (Conv_ond10_preheader_c_0150_reg + Conv_for_body26_n_0145);
end
always @(*) begin
		Conv_for_body26_17 = (Conv_cond7_preheader_r_0151_reg + Conv_for_body26_m_0144);
end
always @(*) begin
		Conv_for_body26_bit_select2 = Conv_for_body26_17[30:0];
end
always @(*) begin
		Conv_for_body26_bit_select = Conv_for_body26_17[28:0];
end
always @(*) begin
		Conv_for_body26_bit_concat3 = {Conv_for_body26_bit_select2[30:0], Conv_for_body26_bit_concat3_bit_select_operand_2};
end
always @(*) begin
		Conv_for_body26_bit_concat1 = {Conv_for_body26_bit_select[28:0], Conv_for_body26_bit_concat1_bit_select_operand_2[2:0]};
end
always @(*) begin
		Conv_for_body26_sr_add26 = (Conv_for_body26_17 + Conv_for_body26_bit_concat3);
end
always @(*) begin
		Conv_for_body26_sr_add27 = (Conv_for_body26_bit_concat1_reg_stage1 + Conv_for_body26_sr_add26_reg_stage1);
end
always @(*) begin
		Conv_for_body26_18 = (Conv_for_body26_16_reg_stage1 + Conv_for_body26_sr_add27);
end
always @(*) begin
		Conv_for_body26_19 = (1'd0 + (2 * Conv_for_body26_18_reg_stage2));
end
always @(*) begin
		Conv_for_body26_20 = conv2_output_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_21 = $signed(Conv_for_body26_20);
end
always @(*) begin
	Conv_for_body26_22 = legup_mult_Conv_for_body26_22_out;
end
always @(*) begin
		Conv_for_body26_23 = $signed(Conv_for_body26_22);
end
always @(*) begin
		Conv_for_body26_24 = (Conv_for_body26_12_reg_stage4 + $signed({{4{Conv_for_body26_23[31]}},Conv_for_body26_23}));
end
always @(*) begin
		Conv_for_body26_bit_select7 = Conv_for_body26_24[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_bit_select7_reg <= Conv_for_body26_bit_select7;
	end
end
always @(*) begin
		Conv_for_body26_25 = _ZL13conv3_weights_a0_a1_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_26 = $signed(Conv_for_body26_25);
end
always @(*) begin
		Conv_for_body26_27 = (1'd0 + (2 * Conv_for_body26_18_reg_stage2));
end
always @(*) begin
		Conv_for_body26_28 = conv2_output_a0_a0_a1_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_29 = $signed(Conv_for_body26_28);
end
always @(*) begin
	Conv_for_body26_30 = legup_mult_Conv_for_body26_30_out;
end
always @(*) begin
		Conv_for_body26_31 = $signed(Conv_for_body26_30);
end
always @(*) begin
		Conv_for_body26_32 = (Conv_for_body26_11_reg_stage4 + $signed({{4{Conv_for_body26_31[31]}},Conv_for_body26_31}));
end
always @(*) begin
		Conv_for_body26_bit_select6 = Conv_for_body26_32[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_bit_select6_reg <= Conv_for_body26_bit_select6;
	end
end
always @(*) begin
		Conv_for_body26_33 = _ZL13conv3_weights_a0_a2_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_34 = $signed(Conv_for_body26_33);
end
always @(*) begin
		Conv_for_body26_35 = (1'd0 + (2 * Conv_for_body26_18_reg_stage2));
end
always @(*) begin
		Conv_for_body26_36 = conv2_output_a0_a0_a2_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_37 = $signed(Conv_for_body26_36);
end
always @(*) begin
	Conv_for_body26_38 = legup_mult_Conv_for_body26_38_out;
end
always @(*) begin
		Conv_for_body26_39 = $signed(Conv_for_body26_38);
end
always @(*) begin
		Conv_for_body26_40 = (Conv_for_body26_10_reg_stage4 + $signed({{4{Conv_for_body26_39[31]}},Conv_for_body26_39}));
end
always @(*) begin
		Conv_for_body26_bit_select5 = Conv_for_body26_40[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_bit_select5_reg <= Conv_for_body26_bit_select5;
	end
end
always @(*) begin
		Conv_for_body26_41 = _ZL13conv3_weights_a0_a3_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_42 = $signed(Conv_for_body26_41);
end
always @(*) begin
		Conv_for_body26_43 = (1'd0 + (2 * Conv_for_body26_18_reg_stage2));
end
always @(*) begin
		Conv_for_body26_44 = conv2_output_a0_a0_a3_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_45 = $signed(Conv_for_body26_44);
end
always @(*) begin
	Conv_for_body26_46 = legup_mult_Conv_for_body26_46_out;
end
always @(*) begin
		Conv_for_body26_47 = $signed(Conv_for_body26_46);
end
always @(*) begin
		Conv_for_body26_48 = (Conv_for_body26_9_reg_stage4 + $signed({{4{Conv_for_body26_47[31]}},Conv_for_body26_47}));
end
always @(*) begin
		Conv_for_body26_bit_select4 = Conv_for_body26_48[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_bit_select4_reg <= Conv_for_body26_bit_select4;
	end
end
always @(*) begin
		Conv_for_body26_cmp52 = (Conv_for_body26_n_0145 == 32'd2);
end
always @(*) begin
		Conv_for_body26_add53 = (Conv_for_body26_n_0145 + 32'd1);
end
always @(*) begin
		Conv_for_body26_add53_var0 = (Conv_for_body26_cmp52 ? 32'd0 : Conv_for_body26_add53);
end
always @(*) begin
		Conv_for_body26_not_cmp54 = (Conv_for_body26_add53_var0_reg_stage1 == 32'd0);
end
always @(*) begin
		Conv_for_body26_bit_concat = {Conv_for_body26_bit_concat_bit_select_operand_0[30:0], Conv_for_body26_not_cmp54};
end
always @(*) begin
		Conv_for_body26_cond59 = (Conv_for_body26_bit_concat + Conv_for_body26_m_0144_reg_stage1);
end
always @(*) begin
		Conv_for_inc92_50 = (Conv_ond10_preheader_c_0150_reg + 32'd1);
end
always @(*) begin
		Conv_for_inc92_exitcond17 = (Conv_for_inc92_50 == 32'd9);
end
always @(*) begin
		Conv_for_inc95_51 = (Conv_cond7_preheader_r_0151_reg + 32'd1);
end
always @(*) begin
		Conv_for_inc95_exitcond19 = (Conv_for_inc95_51 == 32'd9);
end
always @(*) begin
	_ZL13conv3_weights_a0_a0_a0_clken = _ZL13conv3_weights_a0_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv3_weights_a0_a0_a0_address_a = _ZL13conv3_weights_a0_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a0_a0_address_a = (Conv_for_body26_scevgep4 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a1_a0_clken = _ZL13conv3_weights_a0_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv3_weights_a0_a1_a0_address_a = _ZL13conv3_weights_a0_a1_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a1_a0_address_a = (Conv_for_body26_scevgep3 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a1_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a2_a0_clken = _ZL13conv3_weights_a0_a2_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv3_weights_a0_a2_a0_address_a = _ZL13conv3_weights_a0_a2_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a2_a0_address_a = (Conv_for_body26_scevgep2 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a2_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a2_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a3_a0_clken = _ZL13conv3_weights_a0_a3_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv3_weights_a0_a3_a0_address_a = _ZL13conv3_weights_a0_a3_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a3_a0_address_a = (Conv_for_body26_scevgep >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a3_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		_ZL13conv3_weights_a0_a3_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL10conv3_bias_clken = _ZL10conv3_bias_clken_sequential_cond;
end
always @(*) begin
	_ZL10conv3_bias_address_a = 'dx;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		_ZL10conv3_bias_address_a = (Conv_for_body12_arrayidx68_reg >>> 1'd1);
	end
end
always @(*) begin
	_ZL10conv3_bias_read_en_a = 'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		_ZL10conv3_bias_read_en_a = 1'd1;
	end
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_2_state_stall_0)) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_0 <= (for_loop__digit_recognition_h_56_21_2_II_counter & for_loop__digit_recognition_h_56_21_2_start);
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_0 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_2_state_stall_0 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_state_enable_0 = (for_loop__digit_recognition_h_56_21_2_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_2_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_2_state_stall_1)) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_1 <= for_loop__digit_recognition_h_56_21_2_state_enable_0;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_1 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_2_state_stall_1 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_state_enable_1 = (for_loop__digit_recognition_h_56_21_2_valid_bit_1 & ~(for_loop__digit_recognition_h_56_21_2_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_2_state_stall_2)) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_2 <= for_loop__digit_recognition_h_56_21_2_state_enable_1;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_2 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_2_state_stall_2 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_state_enable_2 = (for_loop__digit_recognition_h_56_21_2_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_2_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_2_state_stall_3)) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_3 <= for_loop__digit_recognition_h_56_21_2_state_enable_2;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_3 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_2_state_stall_3 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_state_enable_3 = (for_loop__digit_recognition_h_56_21_2_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_2_state_stall_3));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_2_state_stall_4)) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_4 <= for_loop__digit_recognition_h_56_21_2_state_enable_3;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_valid_bit_4 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_2_state_stall_4 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_state_enable_4 = (for_loop__digit_recognition_h_56_21_2_valid_bit_4 & ~(for_loop__digit_recognition_h_56_21_2_state_stall_4));
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_2_II_counter <= 1'd1;
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_start = (for_loop__digit_recognition_h_56_21_2_activate_pipeline | ((for_loop__digit_recognition_h_56_21_2_active & ~(for_loop__digit_recognition_h_56_21_2_epilogue)) & ~(for_loop__digit_recognition_h_56_21_2_pipeline_exit_cond)));
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_start = 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_activate_pipeline = (((fsm_stall == 1'd0) & for_loop__digit_recognition_h_56_21_2_begin_pipeline) & ~(for_loop__digit_recognition_h_56_21_2_active));
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_9_reg_stage4 <= Conv_for_body26_9;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_10_reg_stage4 <= Conv_for_body26_10;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_11_reg_stage4 <= Conv_for_body26_11;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_3) begin
		Conv_for_body26_12_reg_stage4 <= Conv_for_body26_12;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_m_0144_reg_stage1 <= Conv_for_body26_m_0144;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_13_reg_stage1 <= Conv_for_body26_13;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		Conv_for_body26_15_reg_stage3 <= Conv_for_body26_15;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_16_reg_stage1 <= Conv_for_body26_16;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_bit_concat1_reg_stage1 <= Conv_for_body26_bit_concat1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_sr_add26_reg_stage1 <= Conv_for_body26_sr_add26;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		Conv_for_body26_18_reg_stage2 <= Conv_for_body26_18;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_24_reg_stage5 <= Conv_for_body26_24;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		Conv_for_body26_26_reg_stage3 <= Conv_for_body26_26;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_32_reg_stage5 <= Conv_for_body26_32;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		Conv_for_body26_34_reg_stage3 <= Conv_for_body26_34;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_40_reg_stage5 <= Conv_for_body26_40;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		Conv_for_body26_42_reg_stage3 <= Conv_for_body26_42;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_4) begin
		Conv_for_body26_48_reg_stage5 <= Conv_for_body26_48;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		Conv_for_body26_add53_var0_reg_stage1 <= Conv_for_body26_add53_var0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		Conv_for_body26_cond59_reg_stage2 <= Conv_for_body26_cond59;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_inductionVar_stage0 <= 0;
	end
	if (for_loop__digit_recognition_h_56_21_2_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_2_inductionVar_stage0 <= 0;
	end
	if ((for_loop__digit_recognition_h_56_21_2_II_counter & for_loop__digit_recognition_h_56_21_2_state_enable_0)) begin
		for_loop__digit_recognition_h_56_21_2_inductionVar_stage0 <= (for_loop__digit_recognition_h_56_21_2_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_pipeline_exit_cond = (for_loop__digit_recognition_h_56_21_2_state_enable_0 & (for_loop__digit_recognition_h_56_21_2_inductionVar_stage0 == 8));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_active <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_2_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_2_active <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_2_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_2_active <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		for_loop__digit_recognition_h_56_21_2_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_epilogue <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_2_pipeline_exit_cond & for_loop__digit_recognition_h_56_21_2_active)) begin
		for_loop__digit_recognition_h_56_21_2_epilogue <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_2_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_2_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_pipeline_finish = (for_loop__digit_recognition_h_56_21_2_pipeline_finishing | for_loop__digit_recognition_h_56_21_2_pipeline_finish_reg);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_pipeline_finishing = ((for_loop__digit_recognition_h_56_21_2_epilogue | for_loop__digit_recognition_h_56_21_2_pipeline_exit_cond) & for_loop__digit_recognition_h_56_21_2_only_last_stage_enabled);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_only_last_stage_enabled = ((for_loop__digit_recognition_h_56_21_2_num_active_iterations == 1'd1) & for_loop__digit_recognition_h_56_21_2_state_enable_4);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_num_active_iterations <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_2_inserting_new_iteration & ~(for_loop__digit_recognition_h_56_21_2_state_enable_4))) begin
		for_loop__digit_recognition_h_56_21_2_num_active_iterations <= (for_loop__digit_recognition_h_56_21_2_num_active_iterations + 1'd1);
	end
	if ((~(for_loop__digit_recognition_h_56_21_2_inserting_new_iteration) & for_loop__digit_recognition_h_56_21_2_state_enable_4)) begin
		for_loop__digit_recognition_h_56_21_2_num_active_iterations <= (for_loop__digit_recognition_h_56_21_2_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_2_inserting_new_iteration = ((~(for_loop__digit_recognition_h_56_21_2_state_stall_0) & for_loop__digit_recognition_h_56_21_2_II_counter) & for_loop__digit_recognition_h_56_21_2_start);
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_2_pipeline_finish_reg <= for_loop__digit_recognition_h_56_21_2_pipeline_finish;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_2_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_2_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_2_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_0) begin
		for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage1 <= for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_1) begin
		for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage2 <= for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage3 <= for_loop__digit_recognition_h_56_21_2_in_first_iteration_stage2;
	end
end
assign Conv_cond7_preheader_bit_concat15_bit_select_operand_2 = 2'd0;
assign Conv_cond7_preheader_bit_concat13_bit_select_operand_2 = 5'd0;
assign Conv_ond10_preheader_bit_concat11_bit_select_operand_2 = 2'd0;
assign Conv_for_body12_bit_concat9_bit_select_operand_2 = 3'd0;
always @(*) begin
	_ZL10conv3_bias_read_data_wire_a = _ZL10conv3_bias_read_data_a;
end
always @(*) begin
	_ZL10conv3_bias_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign Conv_ond64_preheader_7_op1_temp = 16'd0;
always @(*) begin
	conv3_output_a0_a0_a0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	_ZL13conv3_weights_a0_a0_a0_read_data_wire_a = _ZL13conv3_weights_a0_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv3_weights_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv3_weights_a0_a0_a0_address_a_reg <= 6'd0;
	end
	if (_ZL13conv3_weights_a0_a0_a0_address_a_reg_enable) begin
		_ZL13conv3_weights_a0_a0_a0_address_a_reg <= _ZL13conv3_weights_a0_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_2_state_enable_1;
end
assign Conv_for_body26_bit_concat3_bit_select_operand_2 = 1'd0;
assign Conv_for_body26_bit_concat1_bit_select_operand_2 = 3'd0;
always @(*) begin
	conv2_output_a0_a0_a0_read_data_wire_a = conv2_output_a0_a0_a0_read_data_a;
end
always @(*) begin
	conv2_output_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_3);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clken = legup_mult_Conv_for_body26_22_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_dataa = Conv_for_body26_15_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_datab = Conv_for_body26_21;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_out_actual = legup_split_mult_signed_16_16_32_10_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_out = $signed(legup_mult_Conv_for_body26_22_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_22_en = legup_mult_Conv_for_body26_22_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_4);
end
always @(*) begin
	_ZL13conv3_weights_a0_a1_a0_read_data_wire_a = _ZL13conv3_weights_a0_a1_a0_read_data_a;
end
always @(*) begin
	_ZL13conv3_weights_a0_a1_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv3_weights_a0_a1_a0_address_a_reg <= 6'd0;
	end
	if (_ZL13conv3_weights_a0_a1_a0_address_a_reg_enable) begin
		_ZL13conv3_weights_a0_a1_a0_address_a_reg <= _ZL13conv3_weights_a0_a1_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a1_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_2_state_enable_1;
end
always @(*) begin
	conv2_output_a0_a0_a1_read_data_wire_a = conv2_output_a0_a0_a1_read_data_a;
end
always @(*) begin
	conv2_output_a0_a0_a1_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_3);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clken = legup_mult_Conv_for_body26_30_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_dataa = Conv_for_body26_26_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_datab = Conv_for_body26_29;
end
always @(*) begin
	legup_mult_Conv_for_body26_30_out_actual = legup_split_mult_signed_16_16_32_11_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_30_out = $signed(legup_mult_Conv_for_body26_30_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_30_en = legup_mult_Conv_for_body26_30_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_30_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_4);
end
always @(*) begin
	_ZL13conv3_weights_a0_a2_a0_read_data_wire_a = _ZL13conv3_weights_a0_a2_a0_read_data_a;
end
always @(*) begin
	_ZL13conv3_weights_a0_a2_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv3_weights_a0_a2_a0_address_a_reg <= 6'd0;
	end
	if (_ZL13conv3_weights_a0_a2_a0_address_a_reg_enable) begin
		_ZL13conv3_weights_a0_a2_a0_address_a_reg <= _ZL13conv3_weights_a0_a2_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a2_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_2_state_enable_1;
end
always @(*) begin
	conv2_output_a0_a0_a2_read_data_wire_a = conv2_output_a0_a0_a2_read_data_a;
end
always @(*) begin
	conv2_output_a0_a0_a2_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_3);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_clken = legup_mult_Conv_for_body26_38_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_dataa = Conv_for_body26_34_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_datab = Conv_for_body26_37;
end
always @(*) begin
	legup_mult_Conv_for_body26_38_out_actual = legup_split_mult_signed_16_16_32_12_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_38_out = $signed(legup_mult_Conv_for_body26_38_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_38_en = legup_mult_Conv_for_body26_38_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_38_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_4);
end
always @(*) begin
	_ZL13conv3_weights_a0_a3_a0_read_data_wire_a = _ZL13conv3_weights_a0_a3_a0_read_data_a;
end
always @(*) begin
	_ZL13conv3_weights_a0_a3_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv3_weights_a0_a3_a0_address_a_reg <= 6'd0;
	end
	if (_ZL13conv3_weights_a0_a3_a0_address_a_reg_enable) begin
		_ZL13conv3_weights_a0_a3_a0_address_a_reg <= _ZL13conv3_weights_a0_a3_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv3_weights_a0_a3_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_2_state_enable_1;
end
always @(*) begin
	conv2_output_a0_a0_a3_read_data_wire_a = conv2_output_a0_a0_a3_read_data_a;
end
always @(*) begin
	conv2_output_a0_a0_a3_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_3);
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_clken = legup_mult_Conv_for_body26_46_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_dataa = Conv_for_body26_42_reg_stage3;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_datab = Conv_for_body26_45;
end
always @(*) begin
	legup_mult_Conv_for_body26_46_out_actual = legup_split_mult_signed_16_16_32_13_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_46_out = $signed(legup_mult_Conv_for_body26_46_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_46_en = legup_mult_Conv_for_body26_46_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_46_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_2_state_stall_4);
end
assign Conv_for_body26_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	conv2_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv2_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv2_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv2_output_valid_write_data = 8'd0;
	end
end
always @(*) begin
	conv3_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv3_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv3_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv3_output_valid_write_data = 8'd1;
	end
end
always @(*) begin
	conv3_output_a0_a0_a0_clken = conv3_output_a0_a0_a0_clken_sequential_cond;
end
always @(*) begin
	conv3_output_a0_a0_a0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_11)) begin
		conv3_output_a0_a0_a0_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv3_output_a0_a0_a0_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_11)) begin
		conv3_output_a0_a0_a0_write_data_a = Conv_ond64_preheader_1;
	end
end
assign conv3_output_a0_a0_a0_read_en_a = 1'd0;
always @(*) begin
	conv3_output_a0_a0_a0_address_a = 9'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_11)) begin
		conv3_output_a0_a0_a0_address_a = (Conv_for_body12_scevgep13_reg >>> 1'd1);
	end
end
assign conv3_output_a0_a0_a0_write_en_b = 1'd0;
assign conv3_output_a0_a0_a0_write_data_b = 16'd0;
assign conv3_output_a0_a0_a0_read_en_b = 1'd0;
assign conv3_output_a0_a0_a0_address_b = 9'd0;
always @(*) begin
	conv2_output_a0_a0_a0_clken = conv2_output_a0_a0_a0_clken_pipeline_cond;
end
assign conv2_output_a0_a0_a0_write_en_a = 1'd0;
assign conv2_output_a0_a0_a0_write_data_a = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a0_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		conv2_output_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a0_address_a = 7'd0;
	if (for_loop__digit_recognition_h_56_21_2_valid_bit_2) begin
		conv2_output_a0_a0_a0_address_a = (Conv_for_body26_19 >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a1_clken = conv2_output_a0_a0_a1_clken_pipeline_cond;
end
assign conv2_output_a0_a0_a1_write_en_a = 1'd0;
assign conv2_output_a0_a0_a1_write_data_a = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a1_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		conv2_output_a0_a0_a1_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a1_address_a = 7'd0;
	if (for_loop__digit_recognition_h_56_21_2_valid_bit_2) begin
		conv2_output_a0_a0_a1_address_a = (Conv_for_body26_27 >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a2_clken = conv2_output_a0_a0_a2_clken_pipeline_cond;
end
assign conv2_output_a0_a0_a2_write_en_a = 1'd0;
assign conv2_output_a0_a0_a2_write_data_a = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a2_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		conv2_output_a0_a0_a2_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a2_address_a = 7'd0;
	if (for_loop__digit_recognition_h_56_21_2_valid_bit_2) begin
		conv2_output_a0_a0_a2_address_a = (Conv_for_body26_35 >>> 1'd1);
	end
end
always @(*) begin
	conv2_output_a0_a0_a3_clken = conv2_output_a0_a0_a3_clken_pipeline_cond;
end
assign conv2_output_a0_a0_a3_write_en_a = 1'd0;
assign conv2_output_a0_a0_a3_write_data_a = 16'd0;
always @(*) begin
	conv2_output_a0_a0_a3_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_2_state_enable_2) begin
		conv2_output_a0_a0_a3_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv2_output_a0_a0_a3_address_a = 7'd0;
	if (for_loop__digit_recognition_h_56_21_2_valid_bit_2) begin
		conv2_output_a0_a0_a3_address_a = (Conv_for_body26_43 >>> 1'd1);
	end
end

endmodule
`timescale 1 ns / 1 ns
module Conv_overloaded_3
(
	clk,
	reset,
	start,
	ready,
	finish,
	conv3_output_valid_write_en,
	conv3_output_valid_write_data,
	conv3_output_valid_read_data,
	conv4_output_valid_write_en,
	conv4_output_valid_write_data,
	conv4_output_valid_read_data,
	conv4_output_a0_a0_a0_clken,
	conv4_output_a0_a0_a0_write_en_a,
	conv4_output_a0_a0_a0_write_data_a,
	conv4_output_a0_a0_a0_read_en_a,
	conv4_output_a0_a0_a0_address_a,
	conv4_output_a0_a0_a0_read_data_a,
	conv4_output_a0_a0_a0_write_en_b,
	conv4_output_a0_a0_a0_write_data_b,
	conv4_output_a0_a0_a0_read_en_b,
	conv4_output_a0_a0_a0_address_b,
	conv4_output_a0_a0_a0_read_data_b,
	conv3_output_a0_a0_a0_clken,
	conv3_output_a0_a0_a0_write_en_a,
	conv3_output_a0_a0_a0_write_data_a,
	conv3_output_a0_a0_a0_read_en_a,
	conv3_output_a0_a0_a0_address_a,
	conv3_output_a0_a0_a0_read_data_a,
	conv3_output_a0_a0_a0_write_en_b,
	conv3_output_a0_a0_a0_write_data_b,
	conv3_output_a0_a0_a0_read_en_b,
	conv3_output_a0_a0_a0_address_b,
	conv3_output_a0_a0_a0_read_data_b
);

parameter [4:0] LEGUP_0 = 5'd0;
parameter [4:0] LEGUP_F_Conv_BB_while_body_1 = 5'd1;
parameter [4:0] LEGUP_F_Conv_BB_while_body_backedge_2 = 5'd2;
parameter [4:0] LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3 = 5'd3;
parameter [4:0] LEGUP_F_Conv_BB_for_cond7_preheader_4 = 5'd4;
parameter [4:0] LEGUP_F_Conv_BB_for_cond10_preheader_5 = 5'd5;
parameter [4:0] LEGUP_F_Conv_BB_for_body12_6 = 5'd6;
parameter [4:0] LEGUP_F_Conv_BB_for_body12_7 = 5'd7;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_8 = 5'd8;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_9 = 5'd9;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_10 = 5'd10;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_11 = 5'd11;
parameter [4:0] LEGUP_F_Conv_BB_for_cond64_preheader_12 = 5'd12;
parameter [4:0] LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_3_13 = 5'd13;
parameter [4:0] LEGUP_F_Conv_BB_for_inc92_14 = 5'd14;
parameter [4:0] LEGUP_F_Conv_BB_for_inc95_15 = 5'd15;
parameter [4:0] LEGUP_F_Conv_BB_for_end97_16 = 5'd16;
parameter [4:0] LEGUP_F_Conv_BB_for_end97_17 = 5'd17;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  conv3_output_valid_write_en;
output reg [7:0] conv3_output_valid_write_data;
input [7:0] conv3_output_valid_read_data;
output reg  conv4_output_valid_write_en;
output reg [7:0] conv4_output_valid_write_data;
input [7:0] conv4_output_valid_read_data;
output reg  conv4_output_a0_a0_a0_clken;
output reg  conv4_output_a0_a0_a0_write_en_a;
output reg [15:0] conv4_output_a0_a0_a0_write_data_a;
output  conv4_output_a0_a0_a0_read_en_a;
output reg [6:0] conv4_output_a0_a0_a0_address_a;
input [15:0] conv4_output_a0_a0_a0_read_data_a;
output  conv4_output_a0_a0_a0_write_en_b;
output [15:0] conv4_output_a0_a0_a0_write_data_b;
output  conv4_output_a0_a0_a0_read_en_b;
output [6:0] conv4_output_a0_a0_a0_address_b;
input [15:0] conv4_output_a0_a0_a0_read_data_b;
output reg  conv3_output_a0_a0_a0_clken;
output  conv3_output_a0_a0_a0_write_en_a;
output [15:0] conv3_output_a0_a0_a0_write_data_a;
output reg  conv3_output_a0_a0_a0_read_en_a;
output reg [8:0] conv3_output_a0_a0_a0_address_a;
input [15:0] conv3_output_a0_a0_a0_read_data_a;
output  conv3_output_a0_a0_a0_write_en_b;
output [15:0] conv3_output_a0_a0_a0_write_data_b;
output reg  conv3_output_a0_a0_a0_read_en_b;
output reg [8:0] conv3_output_a0_a0_a0_address_b;
input [15:0] conv3_output_a0_a0_a0_read_data_b;
reg [4:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [4:0] next_state;
wire  fsm_stall;
reg [7:0] Conv_while_body_0;
reg [7:0] Conv_while_body_1;
reg [7:0] Conv_while_body_2;
reg [7:0] Conv_while_body_and134;
reg  Conv_while_body_tobool4;
reg [31:0] Conv_cond7_preheader_r_0151;
reg [31:0] Conv_cond7_preheader_r_0151_reg;
reg [27:0] Conv_cond7_preheader_bit_select17;
reg [31:0] Conv_cond7_preheader_sr_negate;
reg [30:0] Conv_cond7_preheader_bit_select19;
reg [31:0] Conv_cond7_preheader_bit_concat20;
reg [31:0] Conv_cond7_preheader_bit_concat18;
reg [31:0] Conv_cond7_preheader_sr_add;
reg [31:0] Conv_cond7_preheader_sr_add_reg;
reg [31:0] Conv_ond10_preheader_c_0150;
reg [31:0] Conv_ond10_preheader_c_0150_reg;
reg [30:0] Conv_ond10_preheader_bit_select15;
reg [31:0] Conv_ond10_preheader_bit_concat16;
reg [31:0] Conv_ond10_preheader_3;
reg [31:0] Conv_ond10_preheader_3_reg;
reg [31:0] Conv_for_body12_od_0149;
reg [31:0] Conv_for_body12_od_0149_reg;
reg [28:0] Conv_for_body12_bit_select13;
reg [31:0] Conv_for_body12_4;
reg [31:0] Conv_for_body12_4_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_scevgep13_reg;
reg [31:0] Conv_for_body12_bit_concat14;
reg [31:0] Conv_for_body12_sr_add23;
reg [31:0] Conv_for_body12_sr_add23_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_arrayidx68;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body12_arrayidx68_reg;
reg [15:0] Conv_ond64_preheader_5;
reg [15:0] Conv_ond64_preheader_6;
reg [15:0] Conv_ond64_preheader_newEarly_14;
reg [15:0] Conv_ond64_preheader_newEarly_14_reg;
reg [15:0] Conv_ond64_preheader_newEarly_17;
reg [15:0] Conv_ond64_preheader_newEarly_17_reg;
reg [15:0] Conv_ond64_preheader_newCurOp_17;
reg [15:0] Conv_ond64_preheader_newCurOp_17_reg;
reg  Conv_ond64_preheader_7;
reg  Conv_ond64_preheader_7_reg;
reg [15:0] Conv_ond64_preheader_1;
reg [31:0] Conv_ond64_preheader_8;
reg [31:0] Conv_ond64_preheader_8_reg;
reg  Conv_ond64_preheader_exitcond9;
reg  Conv_ond64_preheader_exitcond9_reg;
reg [35:0] Conv_for_body26_9;
reg [35:0] Conv_for_body26_9_reg;
reg [35:0] Conv_for_body26_10;
reg [35:0] Conv_for_body26_10_reg;
reg [35:0] Conv_for_body26_11;
reg [35:0] Conv_for_body26_11_reg;
reg [35:0] Conv_for_body26_12;
reg [35:0] Conv_for_body26_12_reg;
reg [31:0] Conv_for_body26_n_0145;
reg [31:0] Conv_for_body26_n_0145_reg;
reg [31:0] Conv_for_body26_m_0144;
reg [31:0] Conv_for_body26_m_0144_reg;
reg [31:0] Conv_for_body26_13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_scevgep;
reg [15:0] Conv_for_body26_14;
reg [15:0] Conv_for_body26_15;
reg [31:0] Conv_for_body26_16;
reg [29:0] Conv_for_body26_bit_select;
reg [31:0] Conv_for_body26_17;
reg [29:0] Conv_for_body26_bit_select6;
reg [26:0] Conv_for_body26_bit_select4;
reg [31:0] Conv_for_body26_bit_concat8;
reg [31:0] Conv_for_body26_bit_concat7;
reg [31:0] Conv_for_body26_bit_concat5;
reg [31:0] Conv_for_body26_sr_add26;
reg [31:0] Conv_for_body26_18;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_19;
reg [15:0] Conv_for_body26_20;
reg [15:0] Conv_for_body26_21;
reg [31:0] Conv_for_body26_22;
reg [31:0] Conv_for_body26_23;
reg [35:0] Conv_for_body26_24;
reg [15:0] Conv_for_body26_bit_select12;
reg [15:0] Conv_for_body26_bit_select12_reg;
reg [15:0] Conv_for_body26_25;
reg [15:0] Conv_for_body26_26;
reg [31:0] Conv_for_body26_bit_concat3;
reg [31:0] Conv_for_body26_27;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_28;
reg [15:0] Conv_for_body26_29;
reg [15:0] Conv_for_body26_30;
reg [31:0] Conv_for_body26_31;
reg [31:0] Conv_for_body26_32;
reg [35:0] Conv_for_body26_33;
reg [15:0] Conv_for_body26_bit_select11;
reg [15:0] Conv_for_body26_bit_select11_reg;
reg [15:0] Conv_for_body26_34;
reg [15:0] Conv_for_body26_35;
reg [31:0] Conv_for_body26_bit_concat2;
reg [31:0] Conv_for_body26_36;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_37;
reg [15:0] Conv_for_body26_38;
reg [15:0] Conv_for_body26_39;
reg [31:0] Conv_for_body26_40;
reg [31:0] Conv_for_body26_41;
reg [35:0] Conv_for_body26_42;
reg [15:0] Conv_for_body26_bit_select10;
reg [15:0] Conv_for_body26_bit_select10_reg;
reg [15:0] Conv_for_body26_43;
reg [15:0] Conv_for_body26_44;
reg [31:0] Conv_for_body26_bit_concat1;
reg [31:0] Conv_for_body26_45;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_46;
reg [15:0] Conv_for_body26_47;
reg [15:0] Conv_for_body26_48;
reg [31:0] Conv_for_body26_49;
reg [31:0] Conv_for_body26_50;
reg [35:0] Conv_for_body26_51;
reg [15:0] Conv_for_body26_bit_select9;
reg [15:0] Conv_for_body26_bit_select9_reg;
reg  Conv_for_body26_cmp52;
reg [31:0] Conv_for_body26_add53;
reg [31:0] Conv_for_body26_add53_var0;
reg  Conv_for_body26_not_cmp54;
reg [31:0] Conv_for_body26_bit_concat;
reg [31:0] Conv_for_body26_cond59;
reg [31:0] Conv_for_inc92_53;
reg  Conv_for_inc92_exitcond17;
reg [31:0] Conv_for_inc95_54;
reg  Conv_for_inc95_exitcond19;
reg  _ZL13conv4_weights_a0_a0_a0_clken;
reg [4:0] _ZL13conv4_weights_a0_a0_a0_address_a;
wire [15:0] _ZL13conv4_weights_a0_a0_a0_read_data_a;
reg  _ZL13conv4_weights_a0_a0_a0_read_en_a;
reg  _ZL13conv4_weights_a0_a1_a0_clken;
reg [4:0] _ZL13conv4_weights_a0_a1_a0_address_a;
wire [15:0] _ZL13conv4_weights_a0_a1_a0_read_data_a;
reg  _ZL13conv4_weights_a0_a1_a0_read_en_a;
reg  _ZL13conv4_weights_a0_a2_a0_clken;
reg [4:0] _ZL13conv4_weights_a0_a2_a0_address_a;
wire [15:0] _ZL13conv4_weights_a0_a2_a0_read_data_a;
reg  _ZL13conv4_weights_a0_a2_a0_read_en_a;
reg  _ZL13conv4_weights_a0_a3_a0_clken;
reg [4:0] _ZL13conv4_weights_a0_a3_a0_address_a;
wire [15:0] _ZL13conv4_weights_a0_a3_a0_read_data_a;
reg  _ZL13conv4_weights_a0_a3_a0_read_en_a;
reg  _ZL10conv4_bias_clken;
reg  _ZL10conv4_bias_address_a;
wire [15:0] _ZL10conv4_bias_read_data_a;
reg  _ZL10conv4_bias_read_en_a;
reg  for_loop__digit_recognition_h_56_21_3_valid_bit_0;
wire  for_loop__digit_recognition_h_56_21_3_state_stall_0;
reg  for_loop__digit_recognition_h_56_21_3_state_enable_0;
reg  for_loop__digit_recognition_h_56_21_3_valid_bit_1;
wire  for_loop__digit_recognition_h_56_21_3_state_stall_1;
reg  for_loop__digit_recognition_h_56_21_3_state_enable_1;
reg  for_loop__digit_recognition_h_56_21_3_valid_bit_2;
wire  for_loop__digit_recognition_h_56_21_3_state_stall_2;
reg  for_loop__digit_recognition_h_56_21_3_state_enable_2;
reg  for_loop__digit_recognition_h_56_21_3_valid_bit_3;
wire  for_loop__digit_recognition_h_56_21_3_state_stall_3;
reg  for_loop__digit_recognition_h_56_21_3_state_enable_3;
reg  for_loop__digit_recognition_h_56_21_3_valid_bit_4;
wire  for_loop__digit_recognition_h_56_21_3_state_stall_4;
reg  for_loop__digit_recognition_h_56_21_3_state_enable_4;
reg  for_loop__digit_recognition_h_56_21_3_valid_bit_5;
wire  for_loop__digit_recognition_h_56_21_3_state_stall_5;
reg  for_loop__digit_recognition_h_56_21_3_state_enable_5;
reg [1:0] for_loop__digit_recognition_h_56_21_3_II_counter;
reg  for_loop__digit_recognition_h_56_21_3_start;
reg  for_loop__digit_recognition_h_56_21_3_activate_pipeline;
reg [35:0] Conv_for_body26_9_reg_stage2;
reg [35:0] Conv_for_body26_10_reg_stage2;
reg [35:0] Conv_for_body26_11_reg_stage1;
reg [35:0] Conv_for_body26_11_reg_stage2;
reg [35:0] Conv_for_body26_12_reg_stage1;
reg [35:0] Conv_for_body26_12_reg_stage2;
reg [31:0] Conv_for_body26_m_0144_reg_stage0;
reg [31:0] Conv_for_body26_13_reg_stage0;
reg [15:0] Conv_for_body26_15_reg_stage1;
reg [31:0] Conv_for_body26_bit_concat8_reg_stage0;
reg [31:0] Conv_for_body26_sr_add26_reg_stage0;
reg [31:0] Conv_for_body26_18_reg_stage1;
reg [35:0] Conv_for_body26_24_reg_stage2;
reg [15:0] Conv_for_body26_26_reg_stage1;
reg [31:0] Conv_for_body26_bit_concat3_reg_stage0;
reg [31:0] Conv_for_body26_27_reg_stage1;
reg [35:0] Conv_for_body26_33_reg_stage2;
reg [15:0] Conv_for_body26_35_reg_stage1;
reg [15:0] Conv_for_body26_35_reg_stage2;
reg [31:0] Conv_for_body26_bit_concat2_reg_stage0;
reg [31:0] Conv_for_body26_36_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_37_reg_stage1;
reg [35:0] Conv_for_body26_42_reg_stage3;
reg [15:0] Conv_for_body26_44_reg_stage1;
reg [15:0] Conv_for_body26_44_reg_stage2;
reg [31:0] Conv_for_body26_bit_concat1_reg_stage0;
reg [31:0] Conv_for_body26_45_reg_stage1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] Conv_for_body26_46_reg_stage1;
reg [35:0] Conv_for_body26_51_reg_stage3;
reg [31:0] Conv_for_body26_add53_var0_reg_stage0;
reg [31:0] Conv_for_body26_cond59_reg_stage1;
reg [31:0] for_loop__digit_recognition_h_56_21_3_inductionVar_stage0;
reg  for_loop__digit_recognition_h_56_21_3_pipeline_exit_cond;
reg  for_loop__digit_recognition_h_56_21_3_active;
reg  for_loop__digit_recognition_h_56_21_3_begin_pipeline;
reg  for_loop__digit_recognition_h_56_21_3_epilogue;
reg  for_loop__digit_recognition_h_56_21_3_pipeline_finish;
reg  for_loop__digit_recognition_h_56_21_3_pipeline_finishing;
reg  for_loop__digit_recognition_h_56_21_3_only_last_stage_enabled;
reg [2:0] for_loop__digit_recognition_h_56_21_3_num_active_iterations;
reg  for_loop__digit_recognition_h_56_21_3_inserting_new_iteration;
reg  for_loop__digit_recognition_h_56_21_3_pipeline_finish_reg;
reg  for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0;
reg  for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1;
wire  Conv_cond7_preheader_bit_concat20_bit_select_operand_2;
wire [3:0] Conv_cond7_preheader_bit_concat18_bit_select_operand_2;
wire  Conv_ond10_preheader_bit_concat16_bit_select_operand_2;
wire [2:0] Conv_for_body12_bit_concat14_bit_select_operand_2;
reg [15:0] _ZL10conv4_bias_read_data_wire_a;
reg  _ZL10conv4_bias_clken_sequential_cond;
wire [1:0] Conv_ond64_preheader_7_op1_temp;
reg  conv4_output_a0_a0_a0_clken_sequential_cond;
reg [15:0] _ZL13conv4_weights_a0_a0_a0_read_data_wire_a;
reg  _ZL13conv4_weights_a0_a0_a0_clken_pipeline_cond;
reg [4:0] _ZL13conv4_weights_a0_a0_a0_address_a_reg;
reg  _ZL13conv4_weights_a0_a0_a0_address_a_reg_enable;
wire [1:0] Conv_for_body26_bit_concat8_bit_select_operand_2;
wire [1:0] Conv_for_body26_bit_concat7_bit_select_operand_2;
wire [4:0] Conv_for_body26_bit_concat5_bit_select_operand_2;
reg [15:0] conv3_output_a0_a0_a0_read_data_wire_a;
reg  conv3_output_a0_a0_a0_clken_pipeline_cond;
reg  legup_split_mult_signed_16_16_32_10_clock;
reg  legup_split_mult_signed_16_16_32_10_aclr;
reg  legup_split_mult_signed_16_16_32_10_clken;
reg [15:0] legup_split_mult_signed_16_16_32_10_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_10_datab;
wire [31:0] legup_split_mult_signed_16_16_32_10_result;
reg [31:0] legup_mult_Conv_for_body26_22_out_actual;
reg [31:0] legup_mult_Conv_for_body26_22_out;
reg  legup_mult_Conv_for_body26_22_en;
reg  legup_mult_Conv_for_body26_22_en_pipeline_cond;
reg [15:0] _ZL13conv4_weights_a0_a1_a0_read_data_wire_a;
reg  _ZL13conv4_weights_a0_a1_a0_clken_pipeline_cond;
reg [4:0] _ZL13conv4_weights_a0_a1_a0_address_a_reg;
reg  _ZL13conv4_weights_a0_a1_a0_address_a_reg_enable;
wire [1:0] Conv_for_body26_bit_concat3_bit_select_operand_2;
reg [15:0] conv3_output_a0_a0_a0_read_data_wire_b;
reg  legup_split_mult_signed_16_16_32_11_clock;
reg  legup_split_mult_signed_16_16_32_11_aclr;
reg  legup_split_mult_signed_16_16_32_11_clken;
reg [15:0] legup_split_mult_signed_16_16_32_11_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_11_datab;
wire [31:0] legup_split_mult_signed_16_16_32_11_result;
reg [31:0] legup_mult_Conv_for_body26_31_out_actual;
reg [31:0] legup_mult_Conv_for_body26_31_out;
reg  legup_mult_Conv_for_body26_31_en;
reg  legup_mult_Conv_for_body26_31_en_pipeline_cond;
reg [15:0] _ZL13conv4_weights_a0_a2_a0_read_data_wire_a;
reg  _ZL13conv4_weights_a0_a2_a0_clken_pipeline_cond;
reg [4:0] _ZL13conv4_weights_a0_a2_a0_address_a_reg;
reg  _ZL13conv4_weights_a0_a2_a0_address_a_reg_enable;
wire [1:0] Conv_for_body26_bit_concat2_bit_select_operand_2;
reg  legup_split_mult_signed_16_16_32_12_clock;
reg  legup_split_mult_signed_16_16_32_12_aclr;
reg  legup_split_mult_signed_16_16_32_12_clken;
reg [15:0] legup_split_mult_signed_16_16_32_12_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_12_datab;
wire [31:0] legup_split_mult_signed_16_16_32_12_result;
reg [31:0] legup_mult_Conv_for_body26_40_out_actual;
reg [31:0] legup_mult_Conv_for_body26_40_out;
reg  legup_mult_Conv_for_body26_40_en;
reg  legup_mult_Conv_for_body26_40_en_pipeline_cond;
reg [15:0] _ZL13conv4_weights_a0_a3_a0_read_data_wire_a;
reg  _ZL13conv4_weights_a0_a3_a0_clken_pipeline_cond;
reg [4:0] _ZL13conv4_weights_a0_a3_a0_address_a_reg;
reg  _ZL13conv4_weights_a0_a3_a0_address_a_reg_enable;
wire [1:0] Conv_for_body26_bit_concat1_bit_select_operand_2;
reg  legup_split_mult_signed_16_16_32_13_clock;
reg  legup_split_mult_signed_16_16_32_13_aclr;
reg  legup_split_mult_signed_16_16_32_13_clken;
reg [15:0] legup_split_mult_signed_16_16_32_13_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_13_datab;
wire [31:0] legup_split_mult_signed_16_16_32_13_result;
reg [31:0] legup_mult_Conv_for_body26_49_out_actual;
reg [31:0] legup_mult_Conv_for_body26_49_out;
reg  legup_mult_Conv_for_body26_49_en;
reg  legup_mult_Conv_for_body26_49_en_pipeline_cond;
wire [30:0] Conv_for_body26_bit_concat_bit_select_operand_0;

/*   %17 = mul i32 %12, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_10 (
	.clock (legup_split_mult_signed_16_16_32_10_clock),
	.aclr (legup_split_mult_signed_16_16_32_10_aclr),
	.clken (legup_split_mult_signed_16_16_32_10_clken),
	.dataa (legup_split_mult_signed_16_16_32_10_dataa),
	.datab (legup_split_mult_signed_16_16_32_10_datab),
	.result (legup_split_mult_signed_16_16_32_10_result)
);

defparam
	legup_split_mult_signed_16_16_32_10.widtha = 16,
	legup_split_mult_signed_16_16_32_10.widthb = 16,
	legup_split_mult_signed_16_16_32_10.widthp = 32,
	legup_split_mult_signed_16_16_32_10.pipeline = 1,
	legup_split_mult_signed_16_16_32_10.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_10.preserve_module_hierarchy = 0;

/*   %22 = mul i32 %21, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_11 (
	.clock (legup_split_mult_signed_16_16_32_11_clock),
	.aclr (legup_split_mult_signed_16_16_32_11_aclr),
	.clken (legup_split_mult_signed_16_16_32_11_clken),
	.dataa (legup_split_mult_signed_16_16_32_11_dataa),
	.datab (legup_split_mult_signed_16_16_32_11_datab),
	.result (legup_split_mult_signed_16_16_32_11_result)
);

defparam
	legup_split_mult_signed_16_16_32_11.widtha = 16,
	legup_split_mult_signed_16_16_32_11.widthb = 16,
	legup_split_mult_signed_16_16_32_11.widthp = 32,
	legup_split_mult_signed_16_16_32_11.pipeline = 1,
	legup_split_mult_signed_16_16_32_11.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_11.preserve_module_hierarchy = 0;

/*   %33 = mul i32 %32, %19, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_12 (
	.clock (legup_split_mult_signed_16_16_32_12_clock),
	.aclr (legup_split_mult_signed_16_16_32_12_aclr),
	.clken (legup_split_mult_signed_16_16_32_12_clken),
	.dataa (legup_split_mult_signed_16_16_32_12_dataa),
	.datab (legup_split_mult_signed_16_16_32_12_datab),
	.result (legup_split_mult_signed_16_16_32_12_result)
);

defparam
	legup_split_mult_signed_16_16_32_12.widtha = 16,
	legup_split_mult_signed_16_16_32_12.widthb = 16,
	legup_split_mult_signed_16_16_32_12.widthp = 32,
	legup_split_mult_signed_16_16_32_12.pipeline = 1,
	legup_split_mult_signed_16_16_32_12.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_12.preserve_module_hierarchy = 0;

/*   %38 = mul i32 %37, %27, !dbg !17048, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17029, !legup.pipeline.avail_time !17049, !legup.pipeline.stage !17029*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_13 (
	.clock (legup_split_mult_signed_16_16_32_13_clock),
	.aclr (legup_split_mult_signed_16_16_32_13_aclr),
	.clken (legup_split_mult_signed_16_16_32_13_clken),
	.dataa (legup_split_mult_signed_16_16_32_13_dataa),
	.datab (legup_split_mult_signed_16_16_32_13_datab),
	.result (legup_split_mult_signed_16_16_32_13_result)
);

defparam
	legup_split_mult_signed_16_16_32_13.widtha = 16,
	legup_split_mult_signed_16_16_32_13.widthb = 16,
	legup_split_mult_signed_16_16_32_13.widthp = 32,
	legup_split_mult_signed_16_16_32_13.pipeline = 1,
	legup_split_mult_signed_16_16_32_13.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_13.preserve_module_hierarchy = 0;



// @_ZL13conv4_weights.a0.a0.a0 = internal unnamed_addr constant [18 x i16] [i16 -1831, i16 -3739, i16 -7948, i16 1036, i16 -2108, i16 -2999, i16 573, i16 2347, i16 1113, i16 5521, i16 -60, i16 2555, i16...
rom_single_port _ZL13conv4_weights_a0_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv4_weights_a0_a0_a0_clken ),
	.address_a( _ZL13conv4_weights_a0_a0_a0_address_a ),
	.read_data_a( _ZL13conv4_weights_a0_a0_a0_read_data_a )
);
defparam _ZL13conv4_weights_a0_a0_a0.width_a = 16;
defparam _ZL13conv4_weights_a0_a0_a0.widthad_a = 5;
defparam _ZL13conv4_weights_a0_a0_a0.numwords_a = 18;
defparam _ZL13conv4_weights_a0_a0_a0.latency = 1;
defparam _ZL13conv4_weights_a0_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv4_weights_a0_a0_a0.mem"};



// @_ZL13conv4_weights.a0.a1.a0 = internal unnamed_addr constant [18 x i16] [i16 -1920, i16 -5322, i16 4762, i16 -5459, i16 2092, i16 10562, i16 -5501, i16 1677, i16 8453, i16 6095, i16 2806, i16 4636, i...
rom_single_port _ZL13conv4_weights_a0_a1_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv4_weights_a0_a1_a0_clken ),
	.address_a( _ZL13conv4_weights_a0_a1_a0_address_a ),
	.read_data_a( _ZL13conv4_weights_a0_a1_a0_read_data_a )
);
defparam _ZL13conv4_weights_a0_a1_a0.width_a = 16;
defparam _ZL13conv4_weights_a0_a1_a0.widthad_a = 5;
defparam _ZL13conv4_weights_a0_a1_a0.numwords_a = 18;
defparam _ZL13conv4_weights_a0_a1_a0.latency = 1;
defparam _ZL13conv4_weights_a0_a1_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv4_weights_a0_a1_a0.mem"};



// @_ZL13conv4_weights.a0.a2.a0 = internal unnamed_addr constant [18 x i16] [i16 -265, i16 -3667, i16 -4715, i16 6389, i16 7146, i16 1252, i16 6157, i16 2006, i16 -1624, i16 685, i16 4912, i16 4014, i16 ...
rom_single_port _ZL13conv4_weights_a0_a2_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv4_weights_a0_a2_a0_clken ),
	.address_a( _ZL13conv4_weights_a0_a2_a0_address_a ),
	.read_data_a( _ZL13conv4_weights_a0_a2_a0_read_data_a )
);
defparam _ZL13conv4_weights_a0_a2_a0.width_a = 16;
defparam _ZL13conv4_weights_a0_a2_a0.widthad_a = 5;
defparam _ZL13conv4_weights_a0_a2_a0.numwords_a = 18;
defparam _ZL13conv4_weights_a0_a2_a0.latency = 1;
defparam _ZL13conv4_weights_a0_a2_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv4_weights_a0_a2_a0.mem"};



// @_ZL13conv4_weights.a0.a3.a0 = internal unnamed_addr constant [18 x i16] [i16 7032, i16 4967, i16 1109, i16 3353, i16 2702, i16 2645, i16 6095, i16 -5803, i16 -5072, i16 1794, i16 -983, i16 -1891, i16...
rom_single_port _ZL13conv4_weights_a0_a3_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL13conv4_weights_a0_a3_a0_clken ),
	.address_a( _ZL13conv4_weights_a0_a3_a0_address_a ),
	.read_data_a( _ZL13conv4_weights_a0_a3_a0_read_data_a )
);
defparam _ZL13conv4_weights_a0_a3_a0.width_a = 16;
defparam _ZL13conv4_weights_a0_a3_a0.widthad_a = 5;
defparam _ZL13conv4_weights_a0_a3_a0.numwords_a = 18;
defparam _ZL13conv4_weights_a0_a3_a0.latency = 1;
defparam _ZL13conv4_weights_a0_a3_a0.init_file = {`MEM_INIT_DIR, "_ZL13conv4_weights_a0_a3_a0.mem"};



// @_ZL10conv4_bias = internal unnamed_addr constant [2 x i16] [i16 87, i16 2], align 2
rom_single_port _ZL10conv4_bias (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL10conv4_bias_clken ),
	.address_a( _ZL10conv4_bias_address_a ),
	.read_data_a( _ZL10conv4_bias_read_data_a )
);
defparam _ZL10conv4_bias.width_a = 16;
defparam _ZL10conv4_bias.widthad_a = 1;
defparam _ZL10conv4_bias.numwords_a = 2;
defparam _ZL10conv4_bias.latency = 1;
defparam _ZL10conv4_bias.init_file = {`MEM_INIT_DIR, "_ZL10conv4_bias.mem"};


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
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_F_Conv_BB_for_body12_6:
		next_state = LEGUP_F_Conv_BB_for_body12_7;
LEGUP_F_Conv_BB_for_body12_7:
		next_state = LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_3_13;
LEGUP_F_Conv_BB_for_cond10_preheader_5:
		next_state = LEGUP_F_Conv_BB_for_body12_6;
LEGUP_F_Conv_BB_for_cond64_preheader_10:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_11;
LEGUP_F_Conv_BB_for_cond64_preheader_11:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_12;
LEGUP_F_Conv_BB_for_cond64_preheader_12:
	if ((fsm_stall == 1'd0) && (Conv_ond64_preheader_exitcond9_reg == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_inc92_14;
	else if ((fsm_stall == 1'd0) && (Conv_ond64_preheader_exitcond9_reg == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_body12_6;
LEGUP_F_Conv_BB_for_cond64_preheader_8:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_9;
LEGUP_F_Conv_BB_for_cond64_preheader_9:
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_10;
LEGUP_F_Conv_BB_for_cond7_preheader_4:
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_5;
LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3:
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_for_end97_16:
		next_state = LEGUP_F_Conv_BB_for_end97_17;
LEGUP_F_Conv_BB_for_end97_17:
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
LEGUP_F_Conv_BB_for_inc92_14:
	if ((fsm_stall == 1'd0) && (Conv_for_inc92_exitcond17 == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_inc95_15;
	else if ((fsm_stall == 1'd0) && (Conv_for_inc92_exitcond17 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond10_preheader_5;
LEGUP_F_Conv_BB_for_inc95_15:
	if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond19 == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_end97_16;
	else if ((fsm_stall == 1'd0) && (Conv_for_inc95_exitcond19 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_4;
LEGUP_F_Conv_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd1))
		next_state = LEGUP_F_Conv_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (Conv_while_body_tobool4 == 1'd0))
		next_state = LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3;
LEGUP_F_Conv_BB_while_body_backedge_2:
		next_state = LEGUP_F_Conv_BB_while_body_1;
LEGUP_pipeline_wait_for_loop__digit_recognition_h_56_21_3_13:
	if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_3_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_8;
	else if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_56_21_3_pipeline_finish == 1'd1))
		next_state = LEGUP_F_Conv_BB_for_cond64_preheader_8;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
		Conv_while_body_0 = conv3_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_1 = conv4_output_valid_read_data;
end
always @(*) begin
		Conv_while_body_2 = (Conv_while_body_1 ^ 8'd1);
end
always @(*) begin
		Conv_while_body_and134 = (Conv_while_body_2 & Conv_while_body_0);
end
always @(*) begin
		Conv_while_body_tobool4 = (Conv_while_body_and134 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_15) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond19 == 1'd0))) */ begin
		Conv_cond7_preheader_r_0151 = Conv_for_inc95_54;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_preheader_3) & (fsm_stall == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_inc95_15) & (fsm_stall == 1'd0)) & (Conv_for_inc95_exitcond19 == 1'd0))) begin
		Conv_cond7_preheader_r_0151_reg <= Conv_cond7_preheader_r_0151;
	end
end
always @(*) begin
		Conv_cond7_preheader_bit_select17 = Conv_cond7_preheader_r_0151_reg[27:0];
end
always @(*) begin
		Conv_cond7_preheader_sr_negate = (32'd0 - Conv_cond7_preheader_r_0151_reg);
end
always @(*) begin
		Conv_cond7_preheader_bit_select19 = Conv_cond7_preheader_sr_negate[30:0];
end
always @(*) begin
		Conv_cond7_preheader_bit_concat20 = {Conv_cond7_preheader_bit_select19[30:0], Conv_cond7_preheader_bit_concat20_bit_select_operand_2};
end
always @(*) begin
		Conv_cond7_preheader_bit_concat18 = {Conv_cond7_preheader_bit_select17[27:0], Conv_cond7_preheader_bit_concat18_bit_select_operand_2[3:0]};
end
always @(*) begin
		Conv_cond7_preheader_sr_add = (Conv_cond7_preheader_bit_concat20 + Conv_cond7_preheader_bit_concat18);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4)) begin
		Conv_cond7_preheader_sr_add_reg <= Conv_cond7_preheader_sr_add;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_ond10_preheader_c_0150 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_inc92_14) & (fsm_stall == 1'd0)) & (Conv_for_inc92_exitcond17 == 1'd0))) */ begin
		Conv_ond10_preheader_c_0150 = Conv_for_inc92_53;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond7_preheader_4) & (fsm_stall == 1'd0))) begin
		Conv_ond10_preheader_c_0150_reg <= Conv_ond10_preheader_c_0150;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_inc92_14) & (fsm_stall == 1'd0)) & (Conv_for_inc92_exitcond17 == 1'd0))) begin
		Conv_ond10_preheader_c_0150_reg <= Conv_ond10_preheader_c_0150;
	end
end
always @(*) begin
		Conv_ond10_preheader_bit_select15 = Conv_ond10_preheader_c_0150_reg[30:0];
end
always @(*) begin
		Conv_ond10_preheader_bit_concat16 = {Conv_ond10_preheader_bit_select15[30:0], Conv_ond10_preheader_bit_concat16_bit_select_operand_2};
end
always @(*) begin
		Conv_ond10_preheader_3 = (Conv_cond7_preheader_sr_add_reg + Conv_ond10_preheader_bit_concat16);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5)) begin
		Conv_ond10_preheader_3_reg <= Conv_ond10_preheader_3;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5) & (fsm_stall == 1'd0))) begin
		Conv_for_body12_od_0149 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_12) & (fsm_stall == 1'd0)) & (Conv_ond64_preheader_exitcond9_reg == 1'd0))) */ begin
		Conv_for_body12_od_0149 = Conv_ond64_preheader_8_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_Conv_BB_for_cond10_preheader_5) & (fsm_stall == 1'd0))) begin
		Conv_for_body12_od_0149_reg <= Conv_for_body12_od_0149;
	end
	if ((((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_12) & (fsm_stall == 1'd0)) & (Conv_ond64_preheader_exitcond9_reg == 1'd0))) begin
		Conv_for_body12_od_0149_reg <= Conv_for_body12_od_0149;
	end
end
always @(*) begin
		Conv_for_body12_bit_select13 = Conv_for_body12_od_0149_reg[28:0];
end
always @(*) begin
		Conv_for_body12_4 = (Conv_ond10_preheader_3_reg + Conv_for_body12_od_0149_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_4_reg <= Conv_for_body12_4;
	end
end
always @(*) begin
		Conv_for_body12_scevgep13 = (1'd0 + (2 * Conv_for_body12_4_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_7)) begin
		Conv_for_body12_scevgep13_reg <= Conv_for_body12_scevgep13;
	end
end
always @(*) begin
		Conv_for_body12_bit_concat14 = {Conv_for_body12_bit_select13[28:0], Conv_for_body12_bit_concat14_bit_select_operand_2[2:0]};
end
always @(*) begin
		Conv_for_body12_sr_add23 = (Conv_for_body12_od_0149_reg + Conv_for_body12_bit_concat14);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_sr_add23_reg <= Conv_for_body12_sr_add23;
	end
end
always @(*) begin
		Conv_for_body12_arrayidx68 = (1'd0 + (2 * Conv_for_body12_od_0149_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_body12_6)) begin
		Conv_for_body12_arrayidx68_reg <= Conv_for_body12_arrayidx68;
	end
end
always @(*) begin
		Conv_ond64_preheader_5 = _ZL10conv4_bias_read_data_wire_a;
end
always @(*) begin
		Conv_ond64_preheader_6 = (Conv_ond64_preheader_5 + Conv_for_body26_bit_select12_reg);
end
always @(*) begin
		Conv_ond64_preheader_newEarly_14 = (Conv_for_body26_bit_select11_reg + Conv_for_body26_bit_select10_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		Conv_ond64_preheader_newEarly_14_reg <= Conv_ond64_preheader_newEarly_14;
	end
end
always @(*) begin
		Conv_ond64_preheader_newEarly_17 = (Conv_ond64_preheader_6 + Conv_for_body26_bit_select9_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_9)) begin
		Conv_ond64_preheader_newEarly_17_reg <= Conv_ond64_preheader_newEarly_17;
	end
end
always @(*) begin
		Conv_ond64_preheader_newCurOp_17 = (Conv_ond64_preheader_newEarly_17_reg + Conv_ond64_preheader_newEarly_14_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_10)) begin
		Conv_ond64_preheader_newCurOp_17_reg <= Conv_ond64_preheader_newCurOp_17;
	end
end
always @(*) begin
		Conv_ond64_preheader_7 = ($signed(Conv_ond64_preheader_newCurOp_17) > $signed({14'd0,Conv_ond64_preheader_7_op1_temp}));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_10)) begin
		Conv_ond64_preheader_7_reg <= Conv_ond64_preheader_7;
	end
end
always @(*) begin
		Conv_ond64_preheader_1 = (Conv_ond64_preheader_7_reg ? Conv_ond64_preheader_newCurOp_17_reg : 16'd0);
end
always @(*) begin
		Conv_ond64_preheader_8 = (Conv_for_body12_od_0149_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		Conv_ond64_preheader_8_reg <= Conv_ond64_preheader_8;
	end
end
always @(*) begin
		Conv_ond64_preheader_exitcond9 = (Conv_ond64_preheader_8 == 32'd2);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		Conv_ond64_preheader_exitcond9_reg <= Conv_ond64_preheader_exitcond9;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_3_valid_bit_3 & for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) begin
		Conv_for_body26_9 = Conv_for_body26_9_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & for_loop__digit_recognition_h_56_21_3_state_enable_5)) begin
		Conv_for_body26_9 = Conv_for_body26_51;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & ~(for_loop__digit_recognition_h_56_21_3_state_enable_5))) begin
		Conv_for_body26_9 = Conv_for_body26_51_reg_stage3;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_9 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_9_reg <= Conv_for_body26_9;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_3_valid_bit_3 & for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) begin
		Conv_for_body26_10 = Conv_for_body26_10_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & for_loop__digit_recognition_h_56_21_3_state_enable_5)) begin
		Conv_for_body26_10 = Conv_for_body26_42;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & ~(for_loop__digit_recognition_h_56_21_3_state_enable_5))) begin
		Conv_for_body26_10 = Conv_for_body26_42_reg_stage3;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_10 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_10_reg <= Conv_for_body26_10;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_3_valid_bit_2 & for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) begin
		Conv_for_body26_11 = Conv_for_body26_11_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & for_loop__digit_recognition_h_56_21_3_state_enable_4)) begin
		Conv_for_body26_11 = Conv_for_body26_33;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & ~(for_loop__digit_recognition_h_56_21_3_state_enable_4))) begin
		Conv_for_body26_11 = Conv_for_body26_33_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_11 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_11_reg <= Conv_for_body26_11;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_11_reg <= Conv_for_body26_11;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_3_valid_bit_2 & for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) begin
		Conv_for_body26_12 = Conv_for_body26_12_reg;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & for_loop__digit_recognition_h_56_21_3_state_enable_4)) begin
		Conv_for_body26_12 = Conv_for_body26_24;
	end
	else if (((for_loop__digit_recognition_h_56_21_3_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1)) & ~(for_loop__digit_recognition_h_56_21_3_state_enable_4))) begin
		Conv_for_body26_12 = Conv_for_body26_24_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_12 = 36'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_12_reg <= Conv_for_body26_12;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_12_reg <= Conv_for_body26_12;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_3_valid_bit_0 & for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0)) begin
		Conv_for_body26_n_0145 = Conv_for_body26_n_0145_reg;
	end
	else if ((for_loop__digit_recognition_h_56_21_3_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0))) begin
		Conv_for_body26_n_0145 = Conv_for_body26_add53_var0_reg_stage0;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_n_0145 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_n_0145_reg <= Conv_for_body26_n_0145;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_56_21_3_valid_bit_0 & for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0)) begin
		Conv_for_body26_m_0144 = Conv_for_body26_m_0144_reg;
	end
	else if ((for_loop__digit_recognition_h_56_21_3_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0))) begin
		Conv_for_body26_m_0144 = Conv_for_body26_cond59_reg_stage1;
	end
	else /* if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) */ begin
		Conv_for_body26_m_0144 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		Conv_for_body26_m_0144_reg <= Conv_for_body26_m_0144;
	end
end
always @(*) begin
		Conv_for_body26_13 = (Conv_for_body12_sr_add23_reg + for_loop__digit_recognition_h_56_21_3_inductionVar_stage0);
end
always @(*) begin
		Conv_for_body26_scevgep4 = (1'd0 + (2 * Conv_for_body26_13_reg_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep3 = (1'd0 + (2 * Conv_for_body26_13_reg_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep2 = (1'd0 + (2 * Conv_for_body26_13_reg_stage0));
end
always @(*) begin
		Conv_for_body26_scevgep = (1'd0 + (2 * Conv_for_body26_13_reg_stage0));
end
always @(*) begin
		Conv_for_body26_14 = _ZL13conv4_weights_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_15 = $signed(Conv_for_body26_14);
end
always @(*) begin
		Conv_for_body26_16 = (Conv_ond10_preheader_c_0150_reg + Conv_for_body26_n_0145);
end
always @(*) begin
		Conv_for_body26_bit_select = Conv_for_body26_16[29:0];
end
always @(*) begin
		Conv_for_body26_17 = (Conv_cond7_preheader_r_0151_reg + Conv_for_body26_m_0144);
end
always @(*) begin
		Conv_for_body26_bit_select6 = Conv_for_body26_17[29:0];
end
always @(*) begin
		Conv_for_body26_bit_select4 = Conv_for_body26_17[26:0];
end
always @(*) begin
		Conv_for_body26_bit_concat8 = {Conv_for_body26_bit_select[29:0], Conv_for_body26_bit_concat8_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_for_body26_bit_concat7 = {Conv_for_body26_bit_select6[29:0], Conv_for_body26_bit_concat7_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_for_body26_bit_concat5 = {Conv_for_body26_bit_select4[26:0], Conv_for_body26_bit_concat5_bit_select_operand_2[4:0]};
end
always @(*) begin
		Conv_for_body26_sr_add26 = (Conv_for_body26_bit_concat7 + Conv_for_body26_bit_concat5);
end
always @(*) begin
		Conv_for_body26_18 = (Conv_for_body26_bit_concat8_reg_stage0 + Conv_for_body26_sr_add26_reg_stage0);
end
always @(*) begin
		Conv_for_body26_19 = (1'd0 + (2 * Conv_for_body26_18_reg_stage1));
end
always @(*) begin
		Conv_for_body26_20 = conv3_output_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_21 = $signed(Conv_for_body26_20);
end
always @(*) begin
	Conv_for_body26_22 = legup_mult_Conv_for_body26_22_out;
end
always @(*) begin
		Conv_for_body26_23 = $signed(Conv_for_body26_22);
end
always @(*) begin
		Conv_for_body26_24 = (Conv_for_body26_12_reg_stage2 + $signed({{4{Conv_for_body26_23[31]}},Conv_for_body26_23}));
end
always @(*) begin
		Conv_for_body26_bit_select12 = Conv_for_body26_24[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_4) begin
		Conv_for_body26_bit_select12_reg <= Conv_for_body26_bit_select12;
	end
end
always @(*) begin
		Conv_for_body26_25 = _ZL13conv4_weights_a0_a1_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_26 = $signed(Conv_for_body26_25);
end
always @(*) begin
		Conv_for_body26_bit_concat3 = {Conv_for_body26_bit_select[29:0], Conv_for_body26_bit_concat3_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_for_body26_27 = (Conv_for_body26_sr_add26_reg_stage0 + Conv_for_body26_bit_concat3_reg_stage0);
end
always @(*) begin
		Conv_for_body26_28 = (1'd0 + (2 * Conv_for_body26_27_reg_stage1));
end
always @(*) begin
		Conv_for_body26_29 = conv3_output_a0_a0_a0_read_data_wire_b;
end
always @(*) begin
		Conv_for_body26_30 = $signed(Conv_for_body26_29);
end
always @(*) begin
	Conv_for_body26_31 = legup_mult_Conv_for_body26_31_out;
end
always @(*) begin
		Conv_for_body26_32 = $signed(Conv_for_body26_31);
end
always @(*) begin
		Conv_for_body26_33 = (Conv_for_body26_11_reg_stage2 + $signed({{4{Conv_for_body26_32[31]}},Conv_for_body26_32}));
end
always @(*) begin
		Conv_for_body26_bit_select11 = Conv_for_body26_33[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_4) begin
		Conv_for_body26_bit_select11_reg <= Conv_for_body26_bit_select11;
	end
end
always @(*) begin
		Conv_for_body26_34 = _ZL13conv4_weights_a0_a2_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_35 = $signed(Conv_for_body26_34);
end
always @(*) begin
		Conv_for_body26_bit_concat2 = {Conv_for_body26_bit_select[29:0], Conv_for_body26_bit_concat2_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_for_body26_36 = (Conv_for_body26_sr_add26_reg_stage0 + Conv_for_body26_bit_concat2_reg_stage0);
end
always @(*) begin
		Conv_for_body26_37 = (1'd0 + (2 * Conv_for_body26_36_reg_stage1));
end
always @(*) begin
		Conv_for_body26_38 = conv3_output_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_39 = $signed(Conv_for_body26_38);
end
always @(*) begin
	Conv_for_body26_40 = legup_mult_Conv_for_body26_40_out;
end
always @(*) begin
		Conv_for_body26_41 = $signed(Conv_for_body26_40);
end
always @(*) begin
		Conv_for_body26_42 = (Conv_for_body26_10_reg_stage2 + $signed({{4{Conv_for_body26_41[31]}},Conv_for_body26_41}));
end
always @(*) begin
		Conv_for_body26_bit_select10 = Conv_for_body26_42[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_5) begin
		Conv_for_body26_bit_select10_reg <= Conv_for_body26_bit_select10;
	end
end
always @(*) begin
		Conv_for_body26_43 = _ZL13conv4_weights_a0_a3_a0_read_data_wire_a;
end
always @(*) begin
		Conv_for_body26_44 = $signed(Conv_for_body26_43);
end
always @(*) begin
		Conv_for_body26_bit_concat1 = {Conv_for_body26_bit_select[29:0], Conv_for_body26_bit_concat1_bit_select_operand_2[1:0]};
end
always @(*) begin
		Conv_for_body26_45 = (Conv_for_body26_sr_add26_reg_stage0 + Conv_for_body26_bit_concat1_reg_stage0);
end
always @(*) begin
		Conv_for_body26_46 = (1'd0 + (2 * Conv_for_body26_45_reg_stage1));
end
always @(*) begin
		Conv_for_body26_47 = conv3_output_a0_a0_a0_read_data_wire_b;
end
always @(*) begin
		Conv_for_body26_48 = $signed(Conv_for_body26_47);
end
always @(*) begin
	Conv_for_body26_49 = legup_mult_Conv_for_body26_49_out;
end
always @(*) begin
		Conv_for_body26_50 = $signed(Conv_for_body26_49);
end
always @(*) begin
		Conv_for_body26_51 = (Conv_for_body26_9_reg_stage2 + $signed({{4{Conv_for_body26_50[31]}},Conv_for_body26_50}));
end
always @(*) begin
		Conv_for_body26_bit_select9 = Conv_for_body26_51[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_5) begin
		Conv_for_body26_bit_select9_reg <= Conv_for_body26_bit_select9;
	end
end
always @(*) begin
		Conv_for_body26_cmp52 = (Conv_for_body26_n_0145 == 32'd2);
end
always @(*) begin
		Conv_for_body26_add53 = (Conv_for_body26_n_0145 + 32'd1);
end
always @(*) begin
		Conv_for_body26_add53_var0 = (Conv_for_body26_cmp52 ? 32'd0 : Conv_for_body26_add53);
end
always @(*) begin
		Conv_for_body26_not_cmp54 = (Conv_for_body26_add53_var0_reg_stage0 == 32'd0);
end
always @(*) begin
		Conv_for_body26_bit_concat = {Conv_for_body26_bit_concat_bit_select_operand_0[30:0], Conv_for_body26_not_cmp54};
end
always @(*) begin
		Conv_for_body26_cond59 = (Conv_for_body26_bit_concat + Conv_for_body26_m_0144_reg_stage0);
end
always @(*) begin
		Conv_for_inc92_53 = (Conv_ond10_preheader_c_0150_reg + 32'd1);
end
always @(*) begin
		Conv_for_inc92_exitcond17 = (Conv_for_inc92_53 == 32'd7);
end
always @(*) begin
		Conv_for_inc95_54 = (Conv_cond7_preheader_r_0151_reg + 32'd1);
end
always @(*) begin
		Conv_for_inc95_exitcond19 = (Conv_for_inc95_54 == 32'd7);
end
always @(*) begin
	_ZL13conv4_weights_a0_a0_a0_clken = _ZL13conv4_weights_a0_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv4_weights_a0_a0_a0_address_a = _ZL13conv4_weights_a0_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a0_a0_address_a = (Conv_for_body26_scevgep4 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a1_a0_clken = _ZL13conv4_weights_a0_a1_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv4_weights_a0_a1_a0_address_a = _ZL13conv4_weights_a0_a1_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a1_a0_address_a = (Conv_for_body26_scevgep3 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a1_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a1_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a2_a0_clken = _ZL13conv4_weights_a0_a2_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv4_weights_a0_a2_a0_address_a = _ZL13conv4_weights_a0_a2_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a2_a0_address_a = (Conv_for_body26_scevgep2 >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a2_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a2_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a3_a0_clken = _ZL13conv4_weights_a0_a3_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL13conv4_weights_a0_a3_a0_address_a = _ZL13conv4_weights_a0_a3_a0_address_a_reg;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a3_a0_address_a = (Conv_for_body26_scevgep >>> 1'd1);
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a3_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		_ZL13conv4_weights_a0_a3_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL10conv4_bias_clken = _ZL10conv4_bias_clken_sequential_cond;
end
always @(*) begin
	_ZL10conv4_bias_address_a = 'dx;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		_ZL10conv4_bias_address_a = (Conv_for_body12_arrayidx68_reg >>> 1'd1);
	end
end
always @(*) begin
	_ZL10conv4_bias_read_en_a = 'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_8)) begin
		_ZL10conv4_bias_read_en_a = 1'd1;
	end
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_3_state_stall_0)) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_0 <= (for_loop__digit_recognition_h_56_21_3_II_counter[1] & for_loop__digit_recognition_h_56_21_3_start);
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_0 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_3_state_stall_0 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_state_enable_0 = (for_loop__digit_recognition_h_56_21_3_valid_bit_0 & ~(for_loop__digit_recognition_h_56_21_3_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_3_state_stall_1)) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_1 <= for_loop__digit_recognition_h_56_21_3_state_enable_0;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_1 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_3_state_stall_1 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_state_enable_1 = (for_loop__digit_recognition_h_56_21_3_valid_bit_1 & ~(for_loop__digit_recognition_h_56_21_3_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_3_state_stall_2)) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_2 <= for_loop__digit_recognition_h_56_21_3_state_enable_1;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_2 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_3_state_stall_2 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_state_enable_2 = (for_loop__digit_recognition_h_56_21_3_valid_bit_2 & ~(for_loop__digit_recognition_h_56_21_3_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_3_state_stall_3)) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_3 <= for_loop__digit_recognition_h_56_21_3_state_enable_2;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_3 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_3_state_stall_3 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_state_enable_3 = (for_loop__digit_recognition_h_56_21_3_valid_bit_3 & ~(for_loop__digit_recognition_h_56_21_3_state_stall_3));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_3_state_stall_4)) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_4 <= for_loop__digit_recognition_h_56_21_3_state_enable_3;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_4 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_3_state_stall_4 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_state_enable_4 = (for_loop__digit_recognition_h_56_21_3_valid_bit_4 & ~(for_loop__digit_recognition_h_56_21_3_state_stall_4));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_56_21_3_state_stall_5)) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_5 <= for_loop__digit_recognition_h_56_21_3_state_enable_4;
	end
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_valid_bit_5 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_56_21_3_state_stall_5 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_state_enable_5 = (for_loop__digit_recognition_h_56_21_3_valid_bit_5 & ~(for_loop__digit_recognition_h_56_21_3_state_stall_5));
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_3_II_counter <= {for_loop__digit_recognition_h_56_21_3_II_counter[0], for_loop__digit_recognition_h_56_21_3_II_counter[1]};
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_II_counter <= 2'd1;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_start = (for_loop__digit_recognition_h_56_21_3_activate_pipeline | ((for_loop__digit_recognition_h_56_21_3_active & ~(for_loop__digit_recognition_h_56_21_3_epilogue)) & ~(for_loop__digit_recognition_h_56_21_3_pipeline_exit_cond)));
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_start = 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_activate_pipeline = (((fsm_stall == 1'd0) & for_loop__digit_recognition_h_56_21_3_begin_pipeline) & ~(for_loop__digit_recognition_h_56_21_3_active));
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_9_reg_stage2 <= Conv_for_body26_9;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_10_reg_stage2 <= Conv_for_body26_10;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_11_reg_stage1 <= Conv_for_body26_11;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_11_reg_stage2 <= Conv_for_body26_11_reg_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_12_reg_stage1 <= Conv_for_body26_12;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_12_reg_stage2 <= Conv_for_body26_12_reg_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_m_0144_reg_stage0 <= Conv_for_body26_m_0144;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_13_reg_stage0 <= Conv_for_body26_13;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_15_reg_stage1 <= Conv_for_body26_15;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_bit_concat8_reg_stage0 <= Conv_for_body26_bit_concat8;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_sr_add26_reg_stage0 <= Conv_for_body26_sr_add26;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		Conv_for_body26_18_reg_stage1 <= Conv_for_body26_18;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_4) begin
		Conv_for_body26_24_reg_stage2 <= Conv_for_body26_24;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_26_reg_stage1 <= Conv_for_body26_26;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_bit_concat3_reg_stage0 <= Conv_for_body26_bit_concat3;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		Conv_for_body26_27_reg_stage1 <= Conv_for_body26_27;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_4) begin
		Conv_for_body26_33_reg_stage2 <= Conv_for_body26_33;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_35_reg_stage1 <= Conv_for_body26_35;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_35_reg_stage2 <= Conv_for_body26_35_reg_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_bit_concat2_reg_stage0 <= Conv_for_body26_bit_concat2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		Conv_for_body26_36_reg_stage1 <= Conv_for_body26_36;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_37_reg_stage1 <= Conv_for_body26_37;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_5) begin
		Conv_for_body26_42_reg_stage3 <= Conv_for_body26_42;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_44_reg_stage1 <= Conv_for_body26_44;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		Conv_for_body26_44_reg_stage2 <= Conv_for_body26_44_reg_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_bit_concat1_reg_stage0 <= Conv_for_body26_bit_concat1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		Conv_for_body26_45_reg_stage1 <= Conv_for_body26_45;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		Conv_for_body26_46_reg_stage1 <= Conv_for_body26_46;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_5) begin
		Conv_for_body26_51_reg_stage3 <= Conv_for_body26_51;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_0) begin
		Conv_for_body26_add53_var0_reg_stage0 <= Conv_for_body26_add53_var0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		Conv_for_body26_cond59_reg_stage1 <= Conv_for_body26_cond59;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_inductionVar_stage0 <= 0;
	end
	if (for_loop__digit_recognition_h_56_21_3_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_3_inductionVar_stage0 <= 0;
	end
	if ((for_loop__digit_recognition_h_56_21_3_II_counter[1] & for_loop__digit_recognition_h_56_21_3_state_enable_1)) begin
		for_loop__digit_recognition_h_56_21_3_inductionVar_stage0 <= (for_loop__digit_recognition_h_56_21_3_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_pipeline_exit_cond = (for_loop__digit_recognition_h_56_21_3_state_enable_0 & (for_loop__digit_recognition_h_56_21_3_inductionVar_stage0 == 8));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_active <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_3_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_3_active <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_3_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_3_active <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_Conv_BB_for_body12_7) & (fsm_stall == 1'd0))) begin
		for_loop__digit_recognition_h_56_21_3_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_epilogue <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_3_pipeline_exit_cond & for_loop__digit_recognition_h_56_21_3_active)) begin
		for_loop__digit_recognition_h_56_21_3_epilogue <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_3_pipeline_finishing) begin
		for_loop__digit_recognition_h_56_21_3_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_pipeline_finish = (for_loop__digit_recognition_h_56_21_3_pipeline_finishing | for_loop__digit_recognition_h_56_21_3_pipeline_finish_reg);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_pipeline_finishing = ((for_loop__digit_recognition_h_56_21_3_epilogue | for_loop__digit_recognition_h_56_21_3_pipeline_exit_cond) & for_loop__digit_recognition_h_56_21_3_only_last_stage_enabled);
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_only_last_stage_enabled = ((for_loop__digit_recognition_h_56_21_3_num_active_iterations == 1'd1) & for_loop__digit_recognition_h_56_21_3_state_enable_5);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_num_active_iterations <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_56_21_3_inserting_new_iteration & ~(for_loop__digit_recognition_h_56_21_3_state_enable_5))) begin
		for_loop__digit_recognition_h_56_21_3_num_active_iterations <= (for_loop__digit_recognition_h_56_21_3_num_active_iterations + 1'd1);
	end
	if ((~(for_loop__digit_recognition_h_56_21_3_inserting_new_iteration) & for_loop__digit_recognition_h_56_21_3_state_enable_5)) begin
		for_loop__digit_recognition_h_56_21_3_num_active_iterations <= (for_loop__digit_recognition_h_56_21_3_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_56_21_3_inserting_new_iteration = ((~(for_loop__digit_recognition_h_56_21_3_state_stall_0) & for_loop__digit_recognition_h_56_21_3_II_counter[1]) & for_loop__digit_recognition_h_56_21_3_start);
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_56_21_3_pipeline_finish_reg <= for_loop__digit_recognition_h_56_21_3_pipeline_finish;
	if (reset) begin
		for_loop__digit_recognition_h_56_21_3_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop__digit_recognition_h_56_21_3_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_3_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_activate_pipeline) begin
		for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_56_21_3_state_enable_1) begin
		for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage1 <= for_loop__digit_recognition_h_56_21_3_in_first_iteration_stage0;
	end
end
assign Conv_cond7_preheader_bit_concat20_bit_select_operand_2 = 1'd0;
assign Conv_cond7_preheader_bit_concat18_bit_select_operand_2 = 4'd0;
assign Conv_ond10_preheader_bit_concat16_bit_select_operand_2 = 1'd0;
assign Conv_for_body12_bit_concat14_bit_select_operand_2 = 3'd0;
always @(*) begin
	_ZL10conv4_bias_read_data_wire_a = _ZL10conv4_bias_read_data_a;
end
always @(*) begin
	_ZL10conv4_bias_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign Conv_ond64_preheader_7_op1_temp = 16'd0;
always @(*) begin
	conv4_output_a0_a0_a0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	_ZL13conv4_weights_a0_a0_a0_read_data_wire_a = _ZL13conv4_weights_a0_a0_a0_read_data_a;
end
always @(*) begin
	_ZL13conv4_weights_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv4_weights_a0_a0_a0_address_a_reg <= 5'd0;
	end
	if (_ZL13conv4_weights_a0_a0_a0_address_a_reg_enable) begin
		_ZL13conv4_weights_a0_a0_a0_address_a_reg <= _ZL13conv4_weights_a0_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_3_state_enable_1;
end
assign Conv_for_body26_bit_concat8_bit_select_operand_2 = 2'd0;
assign Conv_for_body26_bit_concat7_bit_select_operand_2 = 2'd0;
assign Conv_for_body26_bit_concat5_bit_select_operand_2 = 5'd0;
always @(*) begin
	conv3_output_a0_a0_a0_read_data_wire_a = conv3_output_a0_a0_a0_read_data_a;
end
always @(*) begin
	conv3_output_a0_a0_a0_clken_pipeline_cond = (~(for_loop__digit_recognition_h_56_21_3_state_stall_3) | ~(for_loop__digit_recognition_h_56_21_3_state_stall_4));
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clken = legup_mult_Conv_for_body26_22_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_dataa = Conv_for_body26_15_reg_stage1;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_datab = Conv_for_body26_21;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_out_actual = legup_split_mult_signed_16_16_32_10_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_out = $signed(legup_mult_Conv_for_body26_22_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_22_en = legup_mult_Conv_for_body26_22_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_22_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_4);
end
always @(*) begin
	_ZL13conv4_weights_a0_a1_a0_read_data_wire_a = _ZL13conv4_weights_a0_a1_a0_read_data_a;
end
always @(*) begin
	_ZL13conv4_weights_a0_a1_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv4_weights_a0_a1_a0_address_a_reg <= 5'd0;
	end
	if (_ZL13conv4_weights_a0_a1_a0_address_a_reg_enable) begin
		_ZL13conv4_weights_a0_a1_a0_address_a_reg <= _ZL13conv4_weights_a0_a1_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a1_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_3_state_enable_1;
end
assign Conv_for_body26_bit_concat3_bit_select_operand_2 = 2'd1;
always @(*) begin
	conv3_output_a0_a0_a0_read_data_wire_b = conv3_output_a0_a0_a0_read_data_b;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clken = legup_mult_Conv_for_body26_31_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_dataa = Conv_for_body26_26_reg_stage1;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_datab = Conv_for_body26_30;
end
always @(*) begin
	legup_mult_Conv_for_body26_31_out_actual = legup_split_mult_signed_16_16_32_11_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_31_out = $signed(legup_mult_Conv_for_body26_31_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_31_en = legup_mult_Conv_for_body26_31_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_31_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_4);
end
always @(*) begin
	_ZL13conv4_weights_a0_a2_a0_read_data_wire_a = _ZL13conv4_weights_a0_a2_a0_read_data_a;
end
always @(*) begin
	_ZL13conv4_weights_a0_a2_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv4_weights_a0_a2_a0_address_a_reg <= 5'd0;
	end
	if (_ZL13conv4_weights_a0_a2_a0_address_a_reg_enable) begin
		_ZL13conv4_weights_a0_a2_a0_address_a_reg <= _ZL13conv4_weights_a0_a2_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a2_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_3_state_enable_1;
end
assign Conv_for_body26_bit_concat2_bit_select_operand_2 = -2'd2;
always @(*) begin
	legup_split_mult_signed_16_16_32_12_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_clken = legup_mult_Conv_for_body26_40_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_dataa = Conv_for_body26_35_reg_stage2;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_12_datab = Conv_for_body26_39;
end
always @(*) begin
	legup_mult_Conv_for_body26_40_out_actual = legup_split_mult_signed_16_16_32_12_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_40_out = $signed(legup_mult_Conv_for_body26_40_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_40_en = legup_mult_Conv_for_body26_40_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_40_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_5);
end
always @(*) begin
	_ZL13conv4_weights_a0_a3_a0_read_data_wire_a = _ZL13conv4_weights_a0_a3_a0_read_data_a;
end
always @(*) begin
	_ZL13conv4_weights_a0_a3_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL13conv4_weights_a0_a3_a0_address_a_reg <= 5'd0;
	end
	if (_ZL13conv4_weights_a0_a3_a0_address_a_reg_enable) begin
		_ZL13conv4_weights_a0_a3_a0_address_a_reg <= _ZL13conv4_weights_a0_a3_a0_address_a;
	end
end
always @(*) begin
	_ZL13conv4_weights_a0_a3_a0_address_a_reg_enable = for_loop__digit_recognition_h_56_21_3_state_enable_1;
end
assign Conv_for_body26_bit_concat1_bit_select_operand_2 = -2'd1;
always @(*) begin
	legup_split_mult_signed_16_16_32_13_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_clken = legup_mult_Conv_for_body26_49_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_dataa = Conv_for_body26_44_reg_stage2;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_13_datab = Conv_for_body26_48;
end
always @(*) begin
	legup_mult_Conv_for_body26_49_out_actual = legup_split_mult_signed_16_16_32_13_result;
end
always @(*) begin
	legup_mult_Conv_for_body26_49_out = $signed(legup_mult_Conv_for_body26_49_out_actual);
end
always @(*) begin
	legup_mult_Conv_for_body26_49_en = legup_mult_Conv_for_body26_49_en_pipeline_cond;
end
always @(*) begin
	legup_mult_Conv_for_body26_49_en_pipeline_cond = ~(for_loop__digit_recognition_h_56_21_3_state_stall_5);
end
assign Conv_for_body26_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	conv3_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv3_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv3_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv3_output_valid_write_data = 8'd0;
	end
end
always @(*) begin
	conv4_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv4_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv4_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_end97_16)) begin
		conv4_output_valid_write_data = 8'd1;
	end
end
always @(*) begin
	conv4_output_a0_a0_a0_clken = conv4_output_a0_a0_a0_clken_sequential_cond;
end
always @(*) begin
	conv4_output_a0_a0_a0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_11)) begin
		conv4_output_a0_a0_a0_write_en_a = 1'd1;
	end
end
always @(*) begin
	conv4_output_a0_a0_a0_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_11)) begin
		conv4_output_a0_a0_a0_write_data_a = Conv_ond64_preheader_1;
	end
end
assign conv4_output_a0_a0_a0_read_en_a = 1'd0;
always @(*) begin
	conv4_output_a0_a0_a0_address_a = 7'd0;
	if ((cur_state == LEGUP_F_Conv_BB_for_cond64_preheader_11)) begin
		conv4_output_a0_a0_a0_address_a = (Conv_for_body12_scevgep13_reg >>> 1'd1);
	end
end
assign conv4_output_a0_a0_a0_write_en_b = 1'd0;
assign conv4_output_a0_a0_a0_write_data_b = 16'd0;
assign conv4_output_a0_a0_a0_read_en_b = 1'd0;
assign conv4_output_a0_a0_a0_address_b = 7'd0;
always @(*) begin
	conv3_output_a0_a0_a0_clken = conv3_output_a0_a0_a0_clken_pipeline_cond;
end
assign conv3_output_a0_a0_a0_write_en_a = 1'd0;
assign conv3_output_a0_a0_a0_write_data_a = 16'd0;
always @(*) begin
	conv3_output_a0_a0_a0_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		conv3_output_a0_a0_a0_read_en_a = 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		conv3_output_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv3_output_a0_a0_a0_address_a = 9'd0;
	if (for_loop__digit_recognition_h_56_21_3_valid_bit_2) begin
		conv3_output_a0_a0_a0_address_a = (Conv_for_body26_19 >>> 1'd1);
	end
	if (for_loop__digit_recognition_h_56_21_3_valid_bit_3) begin
		conv3_output_a0_a0_a0_address_a = (Conv_for_body26_37_reg_stage1 >>> 1'd1);
	end
end
assign conv3_output_a0_a0_a0_write_en_b = 1'd0;
assign conv3_output_a0_a0_a0_write_data_b = 16'd0;
always @(*) begin
	conv3_output_a0_a0_a0_read_en_b = 1'd0;
	if (for_loop__digit_recognition_h_56_21_3_state_enable_2) begin
		conv3_output_a0_a0_a0_read_en_b = 1'd1;
	end
	if (for_loop__digit_recognition_h_56_21_3_state_enable_3) begin
		conv3_output_a0_a0_a0_read_en_b = 1'd1;
	end
end
always @(*) begin
	conv3_output_a0_a0_a0_address_b = 9'd0;
	if (for_loop__digit_recognition_h_56_21_3_valid_bit_2) begin
		conv3_output_a0_a0_a0_address_b = (Conv_for_body26_28 >>> 1'd1);
	end
	if (for_loop__digit_recognition_h_56_21_3_valid_bit_3) begin
		conv3_output_a0_a0_a0_address_b = (Conv_for_body26_46_reg_stage1 >>> 1'd1);
	end
end

endmodule
`timescale 1 ns / 1 ns
module FC
(
	clk,
	reset,
	start,
	ready,
	finish,
	conv4_output_valid_write_en,
	conv4_output_valid_write_data,
	conv4_output_valid_read_data,
	fc_output_valid_write_en,
	fc_output_valid_write_data,
	fc_output_valid_read_data,
	conv4_output_a0_a0_a0_clken,
	conv4_output_a0_a0_a0_write_en_a,
	conv4_output_a0_a0_a0_write_data_a,
	conv4_output_a0_a0_a0_read_en_a,
	conv4_output_a0_a0_a0_address_a,
	conv4_output_a0_a0_a0_read_data_a,
	conv4_output_a0_a0_a0_write_en_b,
	conv4_output_a0_a0_a0_write_data_b,
	conv4_output_a0_a0_a0_read_en_b,
	conv4_output_a0_a0_a0_address_b,
	conv4_output_a0_a0_a0_read_data_b,
	fc_output_clken,
	fc_output_write_en_a,
	fc_output_write_data_a,
	fc_output_read_en_a,
	fc_output_address_a,
	fc_output_read_data_a
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_FC_BB_while_body_1 = 4'd1;
parameter [3:0] LEGUP_F_FC_BB_while_body_backedge_2 = 4'd2;
parameter [3:0] LEGUP_F_FC_BB_for_body_preheader_3 = 4'd3;
parameter [3:0] LEGUP_F_FC_BB_for_body_4 = 4'd4;
parameter [3:0] LEGUP_pipeline_wait_for_loop__digit_recognition_h_134_13_5 = 4'd5;
parameter [3:0] LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6 = 4'd6;
parameter [3:0] LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_7 = 4'd7;
parameter [3:0] LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_8 = 4'd8;
parameter [3:0] LEGUP_F_FC_BB_for_end38_9 = 4'd9;
parameter [3:0] LEGUP_F_FC_BB_for_end38_10 = 4'd10;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  conv4_output_valid_write_en;
output reg [7:0] conv4_output_valid_write_data;
input [7:0] conv4_output_valid_read_data;
output reg  fc_output_valid_write_en;
output reg [7:0] fc_output_valid_write_data;
input [7:0] fc_output_valid_read_data;
output reg  conv4_output_a0_a0_a0_clken;
output  conv4_output_a0_a0_a0_write_en_a;
output [15:0] conv4_output_a0_a0_a0_write_data_a;
output reg  conv4_output_a0_a0_a0_read_en_a;
output reg [6:0] conv4_output_a0_a0_a0_address_a;
input [15:0] conv4_output_a0_a0_a0_read_data_a;
output  conv4_output_a0_a0_a0_write_en_b;
output [15:0] conv4_output_a0_a0_a0_write_data_b;
output reg  conv4_output_a0_a0_a0_read_en_b;
output reg [6:0] conv4_output_a0_a0_a0_address_b;
input [15:0] conv4_output_a0_a0_a0_read_data_b;
output reg  fc_output_clken;
output reg  fc_output_write_en_a;
output reg [15:0] fc_output_write_data_a;
output  fc_output_read_en_a;
output reg [3:0] fc_output_address_a;
input [15:0] fc_output_read_data_a;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;
reg [7:0] FC_while_body_0;
reg [7:0] FC_while_body_1;
reg [7:0] FC_while_body_2;
reg [7:0] FC_while_body_and55;
reg  FC_while_body_tobool4;
reg [31:0] FC_for_body_od_062;
reg [31:0] FC_for_body_od_062_reg;
reg [27:0] FC_for_body_bit_select10;
reg [26:0] FC_for_body_bit_select8;
reg [31:0] FC_for_body_bit_concat11;
reg [31:0] FC_for_body_bit_concat9;
reg [31:0] FC_for_body_sr_add;
reg [31:0] FC_for_body_sr_add9;
reg [31:0] FC_for_body_sr_add9_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body_arrayidx32;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body_arrayidx32_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body_data_i_i56;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body_data_i_i56_reg;
reg [38:0] FC_for_body9_accumulated_value_sroa_0_0_accumulate;
reg [38:0] FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg;
reg [31:0] FC_for_body9_c_061;
reg [31:0] FC_for_body9_c_061_reg;
reg [31:0] FC_for_body9_r_060;
reg [31:0] FC_for_body9_r_060_reg;
reg [27:0] FC_for_body9_bit_select3;
reg [30:0] FC_for_body9_bit_select1;
reg [31:0] FC_for_body9_3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body9_scevgep1;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body9_scevgep;
reg [31:0] FC_for_body9_bit_concat7;
reg [31:0] FC_for_body9_sr_negate;
reg [30:0] FC_for_body9_bit_select5;
reg [31:0] FC_for_body9_bit_concat6;
reg [31:0] FC_for_body9_bit_concat4;
reg [31:0] FC_for_body9_sr_add11;
reg [31:0] FC_for_body9_4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body9_5;
reg [15:0] FC_for_body9_6;
reg [15:0] FC_for_body9_7;
reg [15:0] FC_for_body9_8;
reg [15:0] FC_for_body9_9;
reg [31:0] FC_for_body9_10;
reg [31:0] FC_for_body9_11;
reg [38:0] FC_for_body9_12;
reg [31:0] FC_for_body9_bit_concat2;
reg [31:0] FC_for_body9_13;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] FC_for_body9_14;
reg [15:0] FC_for_body9_15;
reg [15:0] FC_for_body9_16;
reg [15:0] FC_for_body9_17;
reg [15:0] FC_for_body9_18;
reg [31:0] FC_for_body9_19;
reg [31:0] FC_for_body9_20;
reg [38:0] FC_for_body9_21;
reg [15:0] FC_for_body9_bit_select;
reg [15:0] FC_for_body9_bit_select_reg;
reg  FC_for_body9_cmp19;
reg [31:0] FC_for_body9_add;
reg [31:0] FC_for_body9_add_var0;
reg  FC_for_body9_not_cmp20;
reg [31:0] FC_for_body9_bit_concat;
reg [31:0] FC_for_body9_cond25;
reg [15:0] FC_9EEEEcvyEv_exit_23;
reg [15:0] FC_9EEEEcvyEv_exit_add34;
reg [31:0] FC_9EEEEcvyEv_exit_24;
reg [31:0] FC_9EEEEcvyEv_exit_24_reg;
reg  FC_9EEEEcvyEv_exit_exitcond;
reg  FC_9EEEEcvyEv_exit_exitcond_reg;
reg  _ZL10fc_weights_a0_a0_a0_clken;
reg [8:0] _ZL10fc_weights_a0_a0_a0_address_a;
wire [15:0] _ZL10fc_weights_a0_a0_a0_read_data_a;
reg  _ZL10fc_weights_a0_a0_a0_read_en_a;
reg  _ZL10fc_weights_a1_a0_a0_clken;
reg [8:0] _ZL10fc_weights_a1_a0_a0_address_a;
wire [15:0] _ZL10fc_weights_a1_a0_a0_read_data_a;
reg  _ZL10fc_weights_a1_a0_a0_read_en_a;
reg  _ZL7fc_bias_clken;
reg [3:0] _ZL7fc_bias_address_a;
wire [15:0] _ZL7fc_bias_read_data_a;
reg  _ZL7fc_bias_read_en_a;
reg  for_loop__digit_recognition_h_134_13_valid_bit_0;
wire  for_loop__digit_recognition_h_134_13_state_stall_0;
reg  for_loop__digit_recognition_h_134_13_state_enable_0;
reg  for_loop__digit_recognition_h_134_13_valid_bit_1;
wire  for_loop__digit_recognition_h_134_13_state_stall_1;
reg  for_loop__digit_recognition_h_134_13_state_enable_1;
reg  for_loop__digit_recognition_h_134_13_valid_bit_2;
wire  for_loop__digit_recognition_h_134_13_state_stall_2;
reg  for_loop__digit_recognition_h_134_13_state_enable_2;
reg  for_loop__digit_recognition_h_134_13_valid_bit_3;
wire  for_loop__digit_recognition_h_134_13_state_stall_3;
reg  for_loop__digit_recognition_h_134_13_state_enable_3;
reg  for_loop__digit_recognition_h_134_13_valid_bit_4;
wire  for_loop__digit_recognition_h_134_13_state_stall_4;
reg  for_loop__digit_recognition_h_134_13_state_enable_4;
reg  for_loop__digit_recognition_h_134_13_II_counter;
reg  for_loop__digit_recognition_h_134_13_start;
reg  for_loop__digit_recognition_h_134_13_activate_pipeline;
reg [38:0] FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg_stage4;
reg [31:0] FC_for_body9_r_060_reg_stage1;
reg [31:0] FC_for_body9_3_reg_stage1;
reg [31:0] FC_for_body9_bit_concat7_reg_stage1;
reg [31:0] FC_for_body9_sr_add11_reg_stage1;
reg [31:0] FC_for_body9_4_reg_stage2;
reg [15:0] FC_for_body9_9_reg_stage3;
reg [31:0] FC_for_body9_bit_concat2_reg_stage1;
reg [31:0] FC_for_body9_13_reg_stage2;
reg [15:0] FC_for_body9_18_reg_stage3;
reg [38:0] FC_for_body9_21_reg_stage5;
reg [31:0] FC_for_body9_add_var0_reg_stage1;
reg [31:0] FC_for_body9_cond25_reg_stage2;
reg [31:0] for_loop__digit_recognition_h_134_13_inductionVar_stage0;
reg  for_loop__digit_recognition_h_134_13_pipeline_exit_cond;
reg  for_loop__digit_recognition_h_134_13_active;
reg  for_loop__digit_recognition_h_134_13_begin_pipeline;
reg  for_loop__digit_recognition_h_134_13_epilogue;
reg  for_loop__digit_recognition_h_134_13_pipeline_finish;
reg  for_loop__digit_recognition_h_134_13_pipeline_finishing;
reg  for_loop__digit_recognition_h_134_13_only_last_stage_enabled;
reg [2:0] for_loop__digit_recognition_h_134_13_num_active_iterations;
reg  for_loop__digit_recognition_h_134_13_inserting_new_iteration;
reg  for_loop__digit_recognition_h_134_13_pipeline_finish_reg;
reg  for_loop__digit_recognition_h_134_13_in_first_iteration_stage0;
reg  for_loop__digit_recognition_h_134_13_in_first_iteration_stage1;
reg  for_loop__digit_recognition_h_134_13_in_first_iteration_stage2;
reg  for_loop__digit_recognition_h_134_13_in_first_iteration_stage3;
wire [3:0] FC_for_body_bit_concat11_bit_select_operand_2;
wire [4:0] FC_for_body_bit_concat9_bit_select_operand_2;
wire  FC_for_body9_bit_concat7_bit_select_operand_2;
wire  FC_for_body9_bit_concat6_bit_select_operand_2;
wire [3:0] FC_for_body9_bit_concat4_bit_select_operand_2;
reg [15:0] conv4_output_a0_a0_a0_read_data_wire_a;
reg  conv4_output_a0_a0_a0_clken_pipeline_cond;
reg [15:0] _ZL10fc_weights_a0_a0_a0_read_data_wire_a;
reg  _ZL10fc_weights_a0_a0_a0_clken_pipeline_cond;
reg [8:0] _ZL10fc_weights_a0_a0_a0_address_a_reg;
reg  _ZL10fc_weights_a0_a0_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_10_clock;
reg  legup_split_mult_signed_16_16_32_10_aclr;
reg  legup_split_mult_signed_16_16_32_10_clken;
reg [15:0] legup_split_mult_signed_16_16_32_10_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_10_datab;
wire [31:0] legup_split_mult_signed_16_16_32_10_result;
reg [31:0] legup_mult_FC_for_body9_10_out_actual;
reg [31:0] legup_mult_FC_for_body9_10_out;
reg  legup_mult_FC_for_body9_10_en;
reg  legup_mult_FC_for_body9_10_en_pipeline_cond;
wire  FC_for_body9_bit_concat2_bit_select_operand_2;
reg [15:0] conv4_output_a0_a0_a0_read_data_wire_b;
reg [15:0] _ZL10fc_weights_a1_a0_a0_read_data_wire_a;
reg  _ZL10fc_weights_a1_a0_a0_clken_pipeline_cond;
reg [8:0] _ZL10fc_weights_a1_a0_a0_address_a_reg;
reg  _ZL10fc_weights_a1_a0_a0_address_a_reg_enable;
reg  legup_split_mult_signed_16_16_32_11_clock;
reg  legup_split_mult_signed_16_16_32_11_aclr;
reg  legup_split_mult_signed_16_16_32_11_clken;
reg [15:0] legup_split_mult_signed_16_16_32_11_dataa;
reg [15:0] legup_split_mult_signed_16_16_32_11_datab;
wire [31:0] legup_split_mult_signed_16_16_32_11_result;
reg [31:0] legup_mult_FC_for_body9_19_out_actual;
reg [31:0] legup_mult_FC_for_body9_19_out;
reg  legup_mult_FC_for_body9_19_en;
reg  legup_mult_FC_for_body9_19_en_pipeline_cond;
wire [30:0] FC_for_body9_bit_concat_bit_select_operand_0;
reg [15:0] _ZL7fc_bias_read_data_wire_a;
reg  _ZL7fc_bias_clken_sequential_cond;
reg  fc_output_clken_sequential_cond;

/*   %17 = mul i32 %12, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_10 (
	.clock (legup_split_mult_signed_16_16_32_10_clock),
	.aclr (legup_split_mult_signed_16_16_32_10_aclr),
	.clken (legup_split_mult_signed_16_16_32_10_clken),
	.dataa (legup_split_mult_signed_16_16_32_10_dataa),
	.datab (legup_split_mult_signed_16_16_32_10_datab),
	.result (legup_split_mult_signed_16_16_32_10_result)
);

defparam
	legup_split_mult_signed_16_16_32_10.widtha = 16,
	legup_split_mult_signed_16_16_32_10.widthb = 16,
	legup_split_mult_signed_16_16_32_10.widthp = 32,
	legup_split_mult_signed_16_16_32_10.pipeline = 1,
	legup_split_mult_signed_16_16_32_10.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_10.preserve_module_hierarchy = 0;

/*   %22 = mul i32 %21, %16, !dbg !17054, !MSB !17013, !LSB !17002, !extendFrom !17013, !legup.pipeline.start_time !17038, !legup.pipeline.avail_time !17055, !legup.pipeline.stage !17038*/
legup_split_mult_signed_16_16_32_1 legup_split_mult_signed_16_16_32_11 (
	.clock (legup_split_mult_signed_16_16_32_11_clock),
	.aclr (legup_split_mult_signed_16_16_32_11_aclr),
	.clken (legup_split_mult_signed_16_16_32_11_clken),
	.dataa (legup_split_mult_signed_16_16_32_11_dataa),
	.datab (legup_split_mult_signed_16_16_32_11_datab),
	.result (legup_split_mult_signed_16_16_32_11_result)
);

defparam
	legup_split_mult_signed_16_16_32_11.widtha = 16,
	legup_split_mult_signed_16_16_32_11.widthb = 16,
	legup_split_mult_signed_16_16_32_11.widthp = 32,
	legup_split_mult_signed_16_16_32_11.pipeline = 1,
	legup_split_mult_signed_16_16_32_11.representation = "SIGNED",
	legup_split_mult_signed_16_16_32_11.preserve_module_hierarchy = 0;



// @_ZL10fc_weights.a0.a0.a0 = internal unnamed_addr constant [490 x i16] [i16 -1357, i16 2921, i16 3831, i16 2538, i16 -60, i16 1582, i16 249, i16 -3119, i16 3034, i16 -526, i16 -3334, i16 -4688, i16 21...
rom_single_port _ZL10fc_weights_a0_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL10fc_weights_a0_a0_a0_clken ),
	.address_a( _ZL10fc_weights_a0_a0_a0_address_a ),
	.read_data_a( _ZL10fc_weights_a0_a0_a0_read_data_a )
);
defparam _ZL10fc_weights_a0_a0_a0.width_a = 16;
defparam _ZL10fc_weights_a0_a0_a0.widthad_a = 9;
defparam _ZL10fc_weights_a0_a0_a0.numwords_a = 490;
defparam _ZL10fc_weights_a0_a0_a0.latency = 1;
defparam _ZL10fc_weights_a0_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL10fc_weights_a0_a0_a0.mem"};



// @_ZL10fc_weights.a1.a0.a0 = internal unnamed_addr constant [490 x i16] [i16 -819, i16 797, i16 -465, i16 996, i16 -1394, i16 814, i16 209, i16 1960, i16 1973, i16 286, i16 -3165, i16 -4010, i16 -2569,...
rom_single_port _ZL10fc_weights_a1_a0_a0 (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL10fc_weights_a1_a0_a0_clken ),
	.address_a( _ZL10fc_weights_a1_a0_a0_address_a ),
	.read_data_a( _ZL10fc_weights_a1_a0_a0_read_data_a )
);
defparam _ZL10fc_weights_a1_a0_a0.width_a = 16;
defparam _ZL10fc_weights_a1_a0_a0.widthad_a = 9;
defparam _ZL10fc_weights_a1_a0_a0.numwords_a = 490;
defparam _ZL10fc_weights_a1_a0_a0.latency = 1;
defparam _ZL10fc_weights_a1_a0_a0.init_file = {`MEM_INIT_DIR, "_ZL10fc_weights_a1_a0_a0.mem"};



// @_ZL7fc_bias = internal unnamed_addr constant [10 x i16] [i16 -51, i16 -50, i16 46, i16 39, i16 -91, i16 -128, i16 -56, i16 64, i16 -17, i16 -39], align 2
rom_single_port _ZL7fc_bias (
	.clk( clk ),
	.reset( reset ),
	.clken( _ZL7fc_bias_clken ),
	.address_a( _ZL7fc_bias_address_a ),
	.read_data_a( _ZL7fc_bias_read_data_a )
);
defparam _ZL7fc_bias.width_a = 16;
defparam _ZL7fc_bias.widthad_a = 4;
defparam _ZL7fc_bias.numwords_a = 10;
defparam _ZL7fc_bias.latency = 1;
defparam _ZL7fc_bias.init_file = {`MEM_INIT_DIR, "_ZL7fc_bias.mem"};


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
		next_state = LEGUP_F_FC_BB_while_body_1;
LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6:
		next_state = LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_7;
LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_7:
		next_state = LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_8;
LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_8:
	if ((fsm_stall == 1'd0) && (FC_9EEEEcvyEv_exit_exitcond_reg == 1'd1))
		next_state = LEGUP_F_FC_BB_for_end38_9;
	else if ((fsm_stall == 1'd0) && (FC_9EEEEcvyEv_exit_exitcond_reg == 1'd0))
		next_state = LEGUP_F_FC_BB_for_body_4;
LEGUP_F_FC_BB_for_body_4:
		next_state = LEGUP_pipeline_wait_for_loop__digit_recognition_h_134_13_5;
LEGUP_F_FC_BB_for_body_preheader_3:
		next_state = LEGUP_F_FC_BB_for_body_4;
LEGUP_F_FC_BB_for_end38_10:
		next_state = LEGUP_F_FC_BB_while_body_backedge_2;
LEGUP_F_FC_BB_for_end38_9:
		next_state = LEGUP_F_FC_BB_for_end38_10;
LEGUP_F_FC_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (FC_while_body_tobool4 == 1'd1))
		next_state = LEGUP_F_FC_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (FC_while_body_tobool4 == 1'd0))
		next_state = LEGUP_F_FC_BB_for_body_preheader_3;
LEGUP_F_FC_BB_while_body_backedge_2:
		next_state = LEGUP_F_FC_BB_while_body_1;
LEGUP_pipeline_wait_for_loop__digit_recognition_h_134_13_5:
	if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_134_13_pipeline_finish == 1'd1))
		next_state = LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6;
	else if ((fsm_stall == 1'd0) && (for_loop__digit_recognition_h_134_13_pipeline_finish == 1'd1))
		next_state = LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
		FC_while_body_0 = conv4_output_valid_read_data;
end
always @(*) begin
		FC_while_body_1 = fc_output_valid_read_data;
end
always @(*) begin
		FC_while_body_2 = (FC_while_body_1 ^ 8'd1);
end
always @(*) begin
		FC_while_body_and55 = (FC_while_body_2 & FC_while_body_0);
end
always @(*) begin
		FC_while_body_tobool4 = (FC_while_body_and55 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_FC_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		FC_for_body_od_062 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_8) & (fsm_stall == 1'd0)) & (FC_9EEEEcvyEv_exit_exitcond_reg == 1'd0))) */ begin
		FC_for_body_od_062 = FC_9EEEEcvyEv_exit_24_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_FC_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		FC_for_body_od_062_reg <= FC_for_body_od_062;
	end
	if ((((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_8) & (fsm_stall == 1'd0)) & (FC_9EEEEcvyEv_exit_exitcond_reg == 1'd0))) begin
		FC_for_body_od_062_reg <= FC_for_body_od_062;
	end
end
always @(*) begin
		FC_for_body_bit_select10 = FC_for_body_od_062_reg[27:0];
end
always @(*) begin
		FC_for_body_bit_select8 = FC_for_body_od_062_reg[26:0];
end
always @(*) begin
		FC_for_body_bit_concat11 = {FC_for_body_bit_select10[27:0], FC_for_body_bit_concat11_bit_select_operand_2[3:0]};
end
always @(*) begin
		FC_for_body_bit_concat9 = {FC_for_body_bit_select8[26:0], FC_for_body_bit_concat9_bit_select_operand_2[4:0]};
end
always @(*) begin
		FC_for_body_sr_add = (FC_for_body_od_062_reg + FC_for_body_bit_concat11);
end
always @(*) begin
		FC_for_body_sr_add9 = (FC_for_body_bit_concat9 + FC_for_body_sr_add);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_FC_BB_for_body_4)) begin
		FC_for_body_sr_add9_reg <= FC_for_body_sr_add9;
	end
end
always @(*) begin
		FC_for_body_arrayidx32 = (1'd0 + (2 * FC_for_body_od_062_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_FC_BB_for_body_4)) begin
		FC_for_body_arrayidx32_reg <= FC_for_body_arrayidx32;
	end
end
always @(*) begin
		FC_for_body_data_i_i56 = (1'd0 + (2 * FC_for_body_od_062_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_FC_BB_for_body_4)) begin
		FC_for_body_data_i_i56_reg <= FC_for_body_data_i_i56;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_134_13_valid_bit_3 & for_loop__digit_recognition_h_134_13_in_first_iteration_stage3)) begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate = FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg;
	end
	else if (((for_loop__digit_recognition_h_134_13_valid_bit_3 & ~(for_loop__digit_recognition_h_134_13_in_first_iteration_stage3)) & for_loop__digit_recognition_h_134_13_state_enable_4)) begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate = FC_for_body9_21;
	end
	else if (((for_loop__digit_recognition_h_134_13_valid_bit_3 & ~(for_loop__digit_recognition_h_134_13_in_first_iteration_stage3)) & ~(for_loop__digit_recognition_h_134_13_state_enable_4))) begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate = FC_for_body9_21_reg_stage5;
	end
	else /* if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) */ begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate = 39'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_3) begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg <= FC_for_body9_accumulated_value_sroa_0_0_accumulate;
	end
	if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg <= FC_for_body9_accumulated_value_sroa_0_0_accumulate;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_134_13_valid_bit_0 & for_loop__digit_recognition_h_134_13_in_first_iteration_stage0)) begin
		FC_for_body9_c_061 = FC_for_body9_c_061_reg;
	end
	else if ((for_loop__digit_recognition_h_134_13_valid_bit_0 & ~(for_loop__digit_recognition_h_134_13_in_first_iteration_stage0))) begin
		FC_for_body9_c_061 = FC_for_body9_add_var0_reg_stage1;
	end
	else /* if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) */ begin
		FC_for_body9_c_061 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_c_061_reg <= FC_for_body9_c_061;
	end
	if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) begin
		FC_for_body9_c_061_reg <= FC_for_body9_c_061;
	end
end
always @(*) begin
	if ((for_loop__digit_recognition_h_134_13_valid_bit_0 & for_loop__digit_recognition_h_134_13_in_first_iteration_stage0)) begin
		FC_for_body9_r_060 = FC_for_body9_r_060_reg;
	end
	else if (((for_loop__digit_recognition_h_134_13_valid_bit_0 & ~(for_loop__digit_recognition_h_134_13_in_first_iteration_stage0)) & for_loop__digit_recognition_h_134_13_state_enable_1)) begin
		FC_for_body9_r_060 = FC_for_body9_cond25;
	end
	else if (((for_loop__digit_recognition_h_134_13_valid_bit_0 & ~(for_loop__digit_recognition_h_134_13_in_first_iteration_stage0)) & ~(for_loop__digit_recognition_h_134_13_state_enable_1))) begin
		FC_for_body9_r_060 = FC_for_body9_cond25_reg_stage2;
	end
	else /* if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) */ begin
		FC_for_body9_r_060 = 32'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_r_060_reg <= FC_for_body9_r_060;
	end
	if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) begin
		FC_for_body9_r_060_reg <= FC_for_body9_r_060;
	end
end
always @(*) begin
		FC_for_body9_bit_select3 = FC_for_body9_r_060[27:0];
end
always @(*) begin
		FC_for_body9_bit_select1 = FC_for_body9_c_061[30:0];
end
always @(*) begin
		FC_for_body9_3 = (FC_for_body_sr_add9_reg + for_loop__digit_recognition_h_134_13_inductionVar_stage0);
end
always @(*) begin
		FC_for_body9_scevgep1 = (1'd0 + (2 * FC_for_body9_3_reg_stage1));
end
always @(*) begin
		FC_for_body9_scevgep = (1'd0 + (2 * FC_for_body9_3_reg_stage1));
end
always @(*) begin
		FC_for_body9_bit_concat7 = {FC_for_body9_bit_select1[30:0], FC_for_body9_bit_concat7_bit_select_operand_2};
end
always @(*) begin
		FC_for_body9_sr_negate = (32'd0 - FC_for_body9_r_060);
end
always @(*) begin
		FC_for_body9_bit_select5 = FC_for_body9_sr_negate[30:0];
end
always @(*) begin
		FC_for_body9_bit_concat6 = {FC_for_body9_bit_select5[30:0], FC_for_body9_bit_concat6_bit_select_operand_2};
end
always @(*) begin
		FC_for_body9_bit_concat4 = {FC_for_body9_bit_select3[27:0], FC_for_body9_bit_concat4_bit_select_operand_2[3:0]};
end
always @(*) begin
		FC_for_body9_sr_add11 = (FC_for_body9_bit_concat6 + FC_for_body9_bit_concat4);
end
always @(*) begin
		FC_for_body9_4 = (FC_for_body9_bit_concat7_reg_stage1 + FC_for_body9_sr_add11_reg_stage1);
end
always @(*) begin
		FC_for_body9_5 = (1'd0 + (2 * FC_for_body9_4_reg_stage2));
end
always @(*) begin
		FC_for_body9_6 = conv4_output_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		FC_for_body9_7 = $signed(FC_for_body9_6);
end
always @(*) begin
		FC_for_body9_8 = _ZL10fc_weights_a0_a0_a0_read_data_wire_a;
end
always @(*) begin
		FC_for_body9_9 = $signed(FC_for_body9_8);
end
always @(*) begin
	FC_for_body9_10 = legup_mult_FC_for_body9_10_out;
end
always @(*) begin
		FC_for_body9_11 = $signed(FC_for_body9_10);
end
always @(*) begin
		FC_for_body9_12 = (FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg_stage4 + $signed({{7{FC_for_body9_11[31]}},FC_for_body9_11}));
end
always @(*) begin
		FC_for_body9_bit_concat2 = {FC_for_body9_bit_select1[30:0], FC_for_body9_bit_concat2_bit_select_operand_2};
end
always @(*) begin
		FC_for_body9_13 = (FC_for_body9_sr_add11_reg_stage1 + FC_for_body9_bit_concat2_reg_stage1);
end
always @(*) begin
		FC_for_body9_14 = (1'd0 + (2 * FC_for_body9_13_reg_stage2));
end
always @(*) begin
		FC_for_body9_15 = conv4_output_a0_a0_a0_read_data_wire_b;
end
always @(*) begin
		FC_for_body9_16 = $signed(FC_for_body9_15);
end
always @(*) begin
		FC_for_body9_17 = _ZL10fc_weights_a1_a0_a0_read_data_wire_a;
end
always @(*) begin
		FC_for_body9_18 = $signed(FC_for_body9_17);
end
always @(*) begin
	FC_for_body9_19 = legup_mult_FC_for_body9_19_out;
end
always @(*) begin
		FC_for_body9_20 = $signed(FC_for_body9_19);
end
always @(*) begin
		FC_for_body9_21 = (FC_for_body9_12 + $signed({{7{FC_for_body9_20[31]}},FC_for_body9_20}));
end
always @(*) begin
		FC_for_body9_bit_select = FC_for_body9_21[29:14];
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_4) begin
		FC_for_body9_bit_select_reg <= FC_for_body9_bit_select;
	end
end
always @(*) begin
		FC_for_body9_cmp19 = (FC_for_body9_c_061 == 32'd6);
end
always @(*) begin
		FC_for_body9_add = (FC_for_body9_c_061 + 32'd1);
end
always @(*) begin
		FC_for_body9_add_var0 = (FC_for_body9_cmp19 ? 32'd0 : FC_for_body9_add);
end
always @(*) begin
		FC_for_body9_not_cmp20 = (FC_for_body9_add_var0_reg_stage1 == 32'd0);
end
always @(*) begin
		FC_for_body9_bit_concat = {FC_for_body9_bit_concat_bit_select_operand_0[30:0], FC_for_body9_not_cmp20};
end
always @(*) begin
		FC_for_body9_cond25 = (FC_for_body9_bit_concat + FC_for_body9_r_060_reg_stage1);
end
always @(*) begin
		FC_9EEEEcvyEv_exit_23 = _ZL7fc_bias_read_data_wire_a;
end
always @(*) begin
		FC_9EEEEcvyEv_exit_add34 = (FC_9EEEEcvyEv_exit_23 + FC_for_body9_bit_select_reg);
end
always @(*) begin
		FC_9EEEEcvyEv_exit_24 = (FC_for_body_od_062_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6)) begin
		FC_9EEEEcvyEv_exit_24_reg <= FC_9EEEEcvyEv_exit_24;
	end
end
always @(*) begin
		FC_9EEEEcvyEv_exit_exitcond = (FC_9EEEEcvyEv_exit_24 == 32'd10);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6)) begin
		FC_9EEEEcvyEv_exit_exitcond_reg <= FC_9EEEEcvyEv_exit_exitcond;
	end
end
always @(*) begin
	_ZL10fc_weights_a0_a0_a0_clken = _ZL10fc_weights_a0_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL10fc_weights_a0_a0_a0_address_a = _ZL10fc_weights_a0_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		_ZL10fc_weights_a0_a0_a0_address_a = (FC_for_body9_scevgep1 >>> 1'd1);
	end
end
always @(*) begin
	_ZL10fc_weights_a0_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		_ZL10fc_weights_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL10fc_weights_a1_a0_a0_clken = _ZL10fc_weights_a1_a0_a0_clken_pipeline_cond;
end
always @(*) begin
	_ZL10fc_weights_a1_a0_a0_address_a = _ZL10fc_weights_a1_a0_a0_address_a_reg;
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		_ZL10fc_weights_a1_a0_a0_address_a = (FC_for_body9_scevgep >>> 1'd1);
	end
end
always @(*) begin
	_ZL10fc_weights_a1_a0_a0_read_en_a = 'd0;
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		_ZL10fc_weights_a1_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	_ZL7fc_bias_clken = _ZL7fc_bias_clken_sequential_cond;
end
always @(*) begin
	_ZL7fc_bias_address_a = 'dx;
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6)) begin
		_ZL7fc_bias_address_a = (FC_for_body_arrayidx32_reg >>> 1'd1);
	end
end
always @(*) begin
	_ZL7fc_bias_read_en_a = 'd0;
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_6)) begin
		_ZL7fc_bias_read_en_a = 1'd1;
	end
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_134_13_state_stall_0)) begin
		for_loop__digit_recognition_h_134_13_valid_bit_0 <= (for_loop__digit_recognition_h_134_13_II_counter & for_loop__digit_recognition_h_134_13_start);
	end
	if (reset) begin
		for_loop__digit_recognition_h_134_13_valid_bit_0 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_134_13_state_stall_0 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_134_13_state_enable_0 = (for_loop__digit_recognition_h_134_13_valid_bit_0 & ~(for_loop__digit_recognition_h_134_13_state_stall_0));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_134_13_state_stall_1)) begin
		for_loop__digit_recognition_h_134_13_valid_bit_1 <= for_loop__digit_recognition_h_134_13_state_enable_0;
	end
	if (reset) begin
		for_loop__digit_recognition_h_134_13_valid_bit_1 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_134_13_state_stall_1 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_134_13_state_enable_1 = (for_loop__digit_recognition_h_134_13_valid_bit_1 & ~(for_loop__digit_recognition_h_134_13_state_stall_1));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_134_13_state_stall_2)) begin
		for_loop__digit_recognition_h_134_13_valid_bit_2 <= for_loop__digit_recognition_h_134_13_state_enable_1;
	end
	if (reset) begin
		for_loop__digit_recognition_h_134_13_valid_bit_2 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_134_13_state_stall_2 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_134_13_state_enable_2 = (for_loop__digit_recognition_h_134_13_valid_bit_2 & ~(for_loop__digit_recognition_h_134_13_state_stall_2));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_134_13_state_stall_3)) begin
		for_loop__digit_recognition_h_134_13_valid_bit_3 <= for_loop__digit_recognition_h_134_13_state_enable_2;
	end
	if (reset) begin
		for_loop__digit_recognition_h_134_13_valid_bit_3 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_134_13_state_stall_3 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_134_13_state_enable_3 = (for_loop__digit_recognition_h_134_13_valid_bit_3 & ~(for_loop__digit_recognition_h_134_13_state_stall_3));
end
always @(posedge clk) begin
	if (~(for_loop__digit_recognition_h_134_13_state_stall_4)) begin
		for_loop__digit_recognition_h_134_13_valid_bit_4 <= for_loop__digit_recognition_h_134_13_state_enable_3;
	end
	if (reset) begin
		for_loop__digit_recognition_h_134_13_valid_bit_4 <= 1'd0;
	end
end
assign for_loop__digit_recognition_h_134_13_state_stall_4 = 1'd0;
always @(*) begin
	for_loop__digit_recognition_h_134_13_state_enable_4 = (for_loop__digit_recognition_h_134_13_valid_bit_4 & ~(for_loop__digit_recognition_h_134_13_state_stall_4));
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_134_13_II_counter <= 1'd1;
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_start = (for_loop__digit_recognition_h_134_13_activate_pipeline | ((for_loop__digit_recognition_h_134_13_active & ~(for_loop__digit_recognition_h_134_13_epilogue)) & ~(for_loop__digit_recognition_h_134_13_pipeline_exit_cond)));
	if (reset) begin
		for_loop__digit_recognition_h_134_13_start = 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_activate_pipeline = (((fsm_stall == 1'd0) & for_loop__digit_recognition_h_134_13_begin_pipeline) & ~(for_loop__digit_recognition_h_134_13_active));
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_3) begin
		FC_for_body9_accumulated_value_sroa_0_0_accumulate_reg_stage4 <= FC_for_body9_accumulated_value_sroa_0_0_accumulate;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_r_060_reg_stage1 <= FC_for_body9_r_060;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_3_reg_stage1 <= FC_for_body9_3;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_bit_concat7_reg_stage1 <= FC_for_body9_bit_concat7;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_sr_add11_reg_stage1 <= FC_for_body9_sr_add11;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		FC_for_body9_4_reg_stage2 <= FC_for_body9_4;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_2) begin
		FC_for_body9_9_reg_stage3 <= FC_for_body9_9;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_bit_concat2_reg_stage1 <= FC_for_body9_bit_concat2;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		FC_for_body9_13_reg_stage2 <= FC_for_body9_13;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_2) begin
		FC_for_body9_18_reg_stage3 <= FC_for_body9_18;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_4) begin
		FC_for_body9_21_reg_stage5 <= FC_for_body9_21;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		FC_for_body9_add_var0_reg_stage1 <= FC_for_body9_add_var0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		FC_for_body9_cond25_reg_stage2 <= FC_for_body9_cond25;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_134_13_inductionVar_stage0 <= 0;
	end
	if (for_loop__digit_recognition_h_134_13_activate_pipeline) begin
		for_loop__digit_recognition_h_134_13_inductionVar_stage0 <= 0;
	end
	if ((for_loop__digit_recognition_h_134_13_II_counter & for_loop__digit_recognition_h_134_13_state_enable_0)) begin
		for_loop__digit_recognition_h_134_13_inductionVar_stage0 <= (for_loop__digit_recognition_h_134_13_inductionVar_stage0 + 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_pipeline_exit_cond = (for_loop__digit_recognition_h_134_13_state_enable_0 & (for_loop__digit_recognition_h_134_13_inductionVar_stage0 == 48));
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_134_13_active <= 1'd0;
	end
	if (for_loop__digit_recognition_h_134_13_activate_pipeline) begin
		for_loop__digit_recognition_h_134_13_active <= 1'd1;
	end
	if (for_loop__digit_recognition_h_134_13_pipeline_finishing) begin
		for_loop__digit_recognition_h_134_13_active <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_begin_pipeline = 1'd0;
	if (reset) begin
		for_loop__digit_recognition_h_134_13_begin_pipeline = 1'd0;
	end
	if (((cur_state == LEGUP_F_FC_BB_for_body_4) & (fsm_stall == 1'd0))) begin
		for_loop__digit_recognition_h_134_13_begin_pipeline = 1'd1;
	end
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_134_13_epilogue <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_134_13_pipeline_exit_cond & for_loop__digit_recognition_h_134_13_active)) begin
		for_loop__digit_recognition_h_134_13_epilogue <= 1'd1;
	end
	if (for_loop__digit_recognition_h_134_13_pipeline_finishing) begin
		for_loop__digit_recognition_h_134_13_epilogue <= 1'd0;
	end
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_pipeline_finish = (for_loop__digit_recognition_h_134_13_pipeline_finishing | for_loop__digit_recognition_h_134_13_pipeline_finish_reg);
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_pipeline_finishing = ((for_loop__digit_recognition_h_134_13_epilogue | for_loop__digit_recognition_h_134_13_pipeline_exit_cond) & for_loop__digit_recognition_h_134_13_only_last_stage_enabled);
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_only_last_stage_enabled = ((for_loop__digit_recognition_h_134_13_num_active_iterations == 1'd1) & for_loop__digit_recognition_h_134_13_state_enable_4);
end
always @(posedge clk) begin
	if (reset) begin
		for_loop__digit_recognition_h_134_13_num_active_iterations <= 1'd0;
	end
	if ((for_loop__digit_recognition_h_134_13_inserting_new_iteration & ~(for_loop__digit_recognition_h_134_13_state_enable_4))) begin
		for_loop__digit_recognition_h_134_13_num_active_iterations <= (for_loop__digit_recognition_h_134_13_num_active_iterations + 1'd1);
	end
	if ((~(for_loop__digit_recognition_h_134_13_inserting_new_iteration) & for_loop__digit_recognition_h_134_13_state_enable_4)) begin
		for_loop__digit_recognition_h_134_13_num_active_iterations <= (for_loop__digit_recognition_h_134_13_num_active_iterations - 1'd1);
	end
end
always @(*) begin
	for_loop__digit_recognition_h_134_13_inserting_new_iteration = ((~(for_loop__digit_recognition_h_134_13_state_stall_0) & for_loop__digit_recognition_h_134_13_II_counter) & for_loop__digit_recognition_h_134_13_start);
end
always @(posedge clk) begin
	for_loop__digit_recognition_h_134_13_pipeline_finish_reg <= for_loop__digit_recognition_h_134_13_pipeline_finish;
	if (reset) begin
		for_loop__digit_recognition_h_134_13_pipeline_finish_reg <= 1'd0;
	end
	if (for_loop__digit_recognition_h_134_13_activate_pipeline) begin
		for_loop__digit_recognition_h_134_13_pipeline_finish_reg <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_activate_pipeline) begin
		for_loop__digit_recognition_h_134_13_in_first_iteration_stage0 <= 1'd1;
	end
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		for_loop__digit_recognition_h_134_13_in_first_iteration_stage0 <= 1'd0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_0) begin
		for_loop__digit_recognition_h_134_13_in_first_iteration_stage1 <= for_loop__digit_recognition_h_134_13_in_first_iteration_stage0;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_1) begin
		for_loop__digit_recognition_h_134_13_in_first_iteration_stage2 <= for_loop__digit_recognition_h_134_13_in_first_iteration_stage1;
	end
end
always @(posedge clk) begin
	if (for_loop__digit_recognition_h_134_13_state_enable_2) begin
		for_loop__digit_recognition_h_134_13_in_first_iteration_stage3 <= for_loop__digit_recognition_h_134_13_in_first_iteration_stage2;
	end
end
assign FC_for_body_bit_concat11_bit_select_operand_2 = 4'd0;
assign FC_for_body_bit_concat9_bit_select_operand_2 = 5'd0;
assign FC_for_body9_bit_concat7_bit_select_operand_2 = 1'd0;
assign FC_for_body9_bit_concat6_bit_select_operand_2 = 1'd0;
assign FC_for_body9_bit_concat4_bit_select_operand_2 = 4'd0;
always @(*) begin
	conv4_output_a0_a0_a0_read_data_wire_a = conv4_output_a0_a0_a0_read_data_a;
end
always @(*) begin
	conv4_output_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_134_13_state_stall_3);
end
always @(*) begin
	_ZL10fc_weights_a0_a0_a0_read_data_wire_a = _ZL10fc_weights_a0_a0_a0_read_data_a;
end
always @(*) begin
	_ZL10fc_weights_a0_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_134_13_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL10fc_weights_a0_a0_a0_address_a_reg <= 9'd0;
	end
	if (_ZL10fc_weights_a0_a0_a0_address_a_reg_enable) begin
		_ZL10fc_weights_a0_a0_a0_address_a_reg <= _ZL10fc_weights_a0_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL10fc_weights_a0_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_134_13_state_enable_1;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_clken = legup_mult_FC_for_body9_10_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_dataa = FC_for_body9_7;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_10_datab = FC_for_body9_9_reg_stage3;
end
always @(*) begin
	legup_mult_FC_for_body9_10_out_actual = legup_split_mult_signed_16_16_32_10_result;
end
always @(*) begin
	legup_mult_FC_for_body9_10_out = $signed(legup_mult_FC_for_body9_10_out_actual);
end
always @(*) begin
	legup_mult_FC_for_body9_10_en = legup_mult_FC_for_body9_10_en_pipeline_cond;
end
always @(*) begin
	legup_mult_FC_for_body9_10_en_pipeline_cond = ~(for_loop__digit_recognition_h_134_13_state_stall_4);
end
assign FC_for_body9_bit_concat2_bit_select_operand_2 = 1'd1;
always @(*) begin
	conv4_output_a0_a0_a0_read_data_wire_b = conv4_output_a0_a0_a0_read_data_b;
end
always @(*) begin
	_ZL10fc_weights_a1_a0_a0_read_data_wire_a = _ZL10fc_weights_a1_a0_a0_read_data_a;
end
always @(*) begin
	_ZL10fc_weights_a1_a0_a0_clken_pipeline_cond = ~(for_loop__digit_recognition_h_134_13_state_stall_2);
end
always @(posedge clk) begin
	if ((reset | finish)) begin
		_ZL10fc_weights_a1_a0_a0_address_a_reg <= 9'd0;
	end
	if (_ZL10fc_weights_a1_a0_a0_address_a_reg_enable) begin
		_ZL10fc_weights_a1_a0_a0_address_a_reg <= _ZL10fc_weights_a1_a0_a0_address_a;
	end
end
always @(*) begin
	_ZL10fc_weights_a1_a0_a0_address_a_reg_enable = for_loop__digit_recognition_h_134_13_state_enable_1;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clock = clk;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_aclr = reset;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_clken = legup_mult_FC_for_body9_19_en;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_dataa = FC_for_body9_16;
end
always @(*) begin
	legup_split_mult_signed_16_16_32_11_datab = FC_for_body9_18_reg_stage3;
end
always @(*) begin
	legup_mult_FC_for_body9_19_out_actual = legup_split_mult_signed_16_16_32_11_result;
end
always @(*) begin
	legup_mult_FC_for_body9_19_out = $signed(legup_mult_FC_for_body9_19_out_actual);
end
always @(*) begin
	legup_mult_FC_for_body9_19_en = legup_mult_FC_for_body9_19_en_pipeline_cond;
end
always @(*) begin
	legup_mult_FC_for_body9_19_en_pipeline_cond = ~(for_loop__digit_recognition_h_134_13_state_stall_4);
end
assign FC_for_body9_bit_concat_bit_select_operand_0 = 31'd0;
always @(*) begin
	_ZL7fc_bias_read_data_wire_a = _ZL7fc_bias_read_data_a;
end
always @(*) begin
	_ZL7fc_bias_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	fc_output_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	conv4_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_FC_BB_for_end38_9)) begin
		conv4_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	conv4_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_FC_BB_for_end38_9)) begin
		conv4_output_valid_write_data = 8'd0;
	end
end
always @(*) begin
	fc_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_FC_BB_for_end38_9)) begin
		fc_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	fc_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_FC_BB_for_end38_9)) begin
		fc_output_valid_write_data = 8'd1;
	end
end
always @(*) begin
	conv4_output_a0_a0_a0_clken = conv4_output_a0_a0_a0_clken_pipeline_cond;
end
assign conv4_output_a0_a0_a0_write_en_a = 1'd0;
assign conv4_output_a0_a0_a0_write_data_a = 16'd0;
always @(*) begin
	conv4_output_a0_a0_a0_read_en_a = 1'd0;
	if (for_loop__digit_recognition_h_134_13_state_enable_2) begin
		conv4_output_a0_a0_a0_read_en_a = 1'd1;
	end
end
always @(*) begin
	conv4_output_a0_a0_a0_address_a = 7'd0;
	if (for_loop__digit_recognition_h_134_13_valid_bit_2) begin
		conv4_output_a0_a0_a0_address_a = (FC_for_body9_5 >>> 1'd1);
	end
end
assign conv4_output_a0_a0_a0_write_en_b = 1'd0;
assign conv4_output_a0_a0_a0_write_data_b = 16'd0;
always @(*) begin
	conv4_output_a0_a0_a0_read_en_b = 1'd0;
	if (for_loop__digit_recognition_h_134_13_state_enable_2) begin
		conv4_output_a0_a0_a0_read_en_b = 1'd1;
	end
end
always @(*) begin
	conv4_output_a0_a0_a0_address_b = 7'd0;
	if (for_loop__digit_recognition_h_134_13_valid_bit_2) begin
		conv4_output_a0_a0_a0_address_b = (FC_for_body9_14 >>> 1'd1);
	end
end
always @(*) begin
	fc_output_clken = fc_output_clken_sequential_cond;
end
always @(*) begin
	fc_output_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_7)) begin
		fc_output_write_en_a = 1'd1;
	end
end
always @(*) begin
	fc_output_write_data_a = 16'd0;
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_7)) begin
		fc_output_write_data_a = FC_9EEEEcvyEv_exit_add34;
	end
end
assign fc_output_read_en_a = 1'd0;
always @(*) begin
	fc_output_address_a = 4'd0;
	if ((cur_state == LEGUP_F_FC_BB_ZNK5legup10ap_num_refIRNS_6ap_numILj39EEEEcvyEv_exit_7)) begin
		fc_output_address_a = (FC_for_body_data_i_i56_reg >>> 1'd1);
	end
end

endmodule
`timescale 1 ns / 1 ns
module MaxComp
(
	clk,
	reset,
	start,
	ready,
	finish,
	fc_output_valid_write_en,
	fc_output_valid_write_data,
	fc_output_valid_read_data,
	fc_output_clken,
	fc_output_write_en_a,
	fc_output_write_data_a,
	fc_output_read_en_a,
	fc_output_address_a,
	fc_output_read_data_a,
	output_digit,
	output_digit_ready,
	output_digit_valid
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_MaxComp_BB_while_body_1 = 3'd1;
parameter [2:0] LEGUP_F_MaxComp_BB_while_body_backedge_2 = 3'd2;
parameter [2:0] LEGUP_F_MaxComp_BB_for_body_preheader_3 = 3'd3;
parameter [2:0] LEGUP_F_MaxComp_BB_for_body_4 = 3'd4;
parameter [2:0] LEGUP_F_MaxComp_BB_for_body_5 = 3'd5;
parameter [2:0] LEGUP_F_MaxComp_BB_for_end_6 = 3'd6;
parameter [2:0] LEGUP_F_MaxComp_BB_for_end_7 = 3'd7;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  fc_output_valid_write_en;
output reg [7:0] fc_output_valid_write_data;
input [7:0] fc_output_valid_read_data;
output  fc_output_clken;
output  fc_output_write_en_a;
output [15:0] fc_output_write_data_a;
output reg  fc_output_read_en_a;
output reg [3:0] fc_output_address_a;
input [15:0] fc_output_read_data_a;
output reg [3:0] output_digit;
input  output_digit_ready;
output reg  output_digit_valid;
reg [2:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [2:0] next_state;
reg  fsm_stall;
reg [7:0] MaxComp_while_body_0;
reg  MaxComp_while_body_tobool;
reg [3:0] MaxComp_for_body_digit_0;
reg [3:0] MaxComp_for_body_digit_0_reg;
reg [15:0] MaxComp_for_body_max_0;
reg [15:0] MaxComp_for_body_max_0_reg;
reg [31:0] MaxComp_for_body_1;
reg [31:0] MaxComp_for_body_1_reg;
reg [3:0] MaxComp_for_body_bit_select;
reg [3:0] MaxComp_for_body_bit_select_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] MaxComp_for_body_data_2_i_i2_i;
reg [15:0] MaxComp_for_body_2;
reg  MaxComp_for_body_3;
reg [3:0] MaxComp_for_body_digit_0_var0;
reg [3:0] MaxComp_for_body_digit_0_var0_reg;
reg [15:0] MaxComp_for_body_max_0_var1;
reg [15:0] MaxComp_for_body_max_0_var1_reg;
reg [31:0] MaxComp_for_body_4;
reg [31:0] MaxComp_for_body_4_reg;
reg  MaxComp_for_body_exitcond;
reg  MaxComp_for_body_exitcond_reg;
reg [31:0] MaxComp_for_end_bit_concat1;
reg [63:0] MaxComp_for_end_bit_concat;
wire [15:0] MaxComp_for_end_bit_concat1_bit_select_operand_0;
wire [59:0] MaxComp_for_end_bit_concat_bit_select_operand_0;
reg  classifier_output_LEGUP_F_MaxComp_BB_for_end_6_not_accessed_due_to_stall_a;
reg  classifier_output_LEGUP_F_MaxComp_BB_for_end_6_stalln_reg;
reg  classifier_output_LEGUP_F_MaxComp_BB_for_end_6_enable_cond_a;
reg  fc_output_inst_port_a_receiver_clk;
reg  fc_output_inst_port_a_receiver_reset;
reg  fc_output_inst_port_a_receiver_op_start;
reg  fc_output_inst_port_a_receiver_user_enable;
reg [15:0] fc_output_inst_port_a_receiver_data_in;
wire [15:0] fc_output_inst_port_a_receiver_data_out;
reg [15:0] fc_output_inst_port_a_receiver_in;


data_receiver_fifo fc_output_inst_port_a_receiver (
	.clk (fc_output_inst_port_a_receiver_clk),
	.reset (fc_output_inst_port_a_receiver_reset),
	.op_start (fc_output_inst_port_a_receiver_op_start),
	.user_enable (fc_output_inst_port_a_receiver_user_enable),
	.data_in (fc_output_inst_port_a_receiver_data_in),
	.data_out (fc_output_inst_port_a_receiver_data_out)
);

defparam
	fc_output_inst_port_a_receiver.latency = 1,
	fc_output_inst_port_a_receiver.data_width = 16;


/* Unsynthesizable Statements */
/* synthesis translate_off */
always @(posedge clk)
	if (!fsm_stall) begin
	if ((cur_state == LEGUP_F_MaxComp_BB_for_end_6)) begin
		$write("Highest confidence: %5d, digit-%d\n", $signed(MaxComp_for_end_bit_concat1), $signed(MaxComp_for_end_bit_concat));
		// to fix quartus warning
		if (reset == 1'b0 && ^(MaxComp_for_end_bit_concat1) === 1'bX) finish <= 0;
		if (reset == 1'b0 && ^(MaxComp_for_end_bit_concat) === 1'bX) finish <= 0;
	end
end
/* synthesis translate_on */
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
		next_state = LEGUP_F_MaxComp_BB_while_body_1;
LEGUP_F_MaxComp_BB_for_body_4:
		next_state = LEGUP_F_MaxComp_BB_for_body_5;
LEGUP_F_MaxComp_BB_for_body_5:
	if ((fsm_stall == 1'd0) && (MaxComp_for_body_exitcond_reg == 1'd1))
		next_state = LEGUP_F_MaxComp_BB_for_end_6;
	else if ((fsm_stall == 1'd0) && (MaxComp_for_body_exitcond_reg == 1'd0))
		next_state = LEGUP_F_MaxComp_BB_for_body_4;
LEGUP_F_MaxComp_BB_for_body_preheader_3:
		next_state = LEGUP_F_MaxComp_BB_for_body_4;
LEGUP_F_MaxComp_BB_for_end_6:
		next_state = LEGUP_F_MaxComp_BB_for_end_7;
LEGUP_F_MaxComp_BB_for_end_7:
		next_state = LEGUP_F_MaxComp_BB_while_body_backedge_2;
LEGUP_F_MaxComp_BB_while_body_1:
	if ((fsm_stall == 1'd0) && (MaxComp_while_body_tobool == 1'd1))
		next_state = LEGUP_F_MaxComp_BB_while_body_backedge_2;
	else if ((fsm_stall == 1'd0) && (MaxComp_while_body_tobool == 1'd0))
		next_state = LEGUP_F_MaxComp_BB_for_body_preheader_3;
LEGUP_F_MaxComp_BB_while_body_backedge_2:
		next_state = LEGUP_F_MaxComp_BB_while_body_1;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	fsm_stall = 1'd0;
	if ((((cur_state == LEGUP_F_MaxComp_BB_for_end_6) & ~(output_digit_ready)) & (classifier_output_LEGUP_F_MaxComp_BB_for_end_6_not_accessed_due_to_stall_a | classifier_output_LEGUP_F_MaxComp_BB_for_end_6_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
end
always @(*) begin
		MaxComp_while_body_0 = fc_output_valid_read_data;
end
always @(*) begin
		MaxComp_while_body_tobool = (MaxComp_while_body_0 == 8'd0);
end
always @(*) begin
	if (((cur_state == LEGUP_F_MaxComp_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		MaxComp_for_body_digit_0 = 4'd0;
	end
	else /* if ((((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0)) & (MaxComp_for_body_exitcond_reg == 1'd0))) */ begin
		MaxComp_for_body_digit_0 = MaxComp_for_body_digit_0_var0;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_MaxComp_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		MaxComp_for_body_digit_0_reg <= MaxComp_for_body_digit_0;
	end
	if ((((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0)) & (MaxComp_for_body_exitcond_reg == 1'd0))) begin
		MaxComp_for_body_digit_0_reg <= MaxComp_for_body_digit_0;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_MaxComp_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		MaxComp_for_body_max_0 = -16'd32768;
	end
	else /* if ((((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0)) & (MaxComp_for_body_exitcond_reg == 1'd0))) */ begin
		MaxComp_for_body_max_0 = MaxComp_for_body_max_0_var1;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_MaxComp_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		MaxComp_for_body_max_0_reg <= MaxComp_for_body_max_0;
	end
	if ((((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0)) & (MaxComp_for_body_exitcond_reg == 1'd0))) begin
		MaxComp_for_body_max_0_reg <= MaxComp_for_body_max_0;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_MaxComp_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		MaxComp_for_body_1 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0)) & (MaxComp_for_body_exitcond_reg == 1'd0))) */ begin
		MaxComp_for_body_1 = MaxComp_for_body_4_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_MaxComp_BB_for_body_preheader_3) & (fsm_stall == 1'd0))) begin
		MaxComp_for_body_1_reg <= MaxComp_for_body_1;
	end
	if ((((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0)) & (MaxComp_for_body_exitcond_reg == 1'd0))) begin
		MaxComp_for_body_1_reg <= MaxComp_for_body_1;
	end
end
always @(*) begin
		MaxComp_for_body_bit_select = MaxComp_for_body_1_reg[3:0];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_4)) begin
		MaxComp_for_body_bit_select_reg <= MaxComp_for_body_bit_select;
	end
end
always @(*) begin
		MaxComp_for_body_data_2_i_i2_i = (1'd0 + (2 * MaxComp_for_body_1_reg));
end
always @(*) begin
	MaxComp_for_body_2 = fc_output_inst_port_a_receiver_data_out;
end
always @(*) begin
		MaxComp_for_body_3 = ($signed(MaxComp_for_body_2) > $signed(MaxComp_for_body_max_0_reg));
end
always @(*) begin
		MaxComp_for_body_digit_0_var0 = (MaxComp_for_body_3 ? MaxComp_for_body_bit_select_reg : MaxComp_for_body_digit_0_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_5)) begin
		MaxComp_for_body_digit_0_var0_reg <= MaxComp_for_body_digit_0_var0;
	end
end
always @(*) begin
		MaxComp_for_body_max_0_var1 = (MaxComp_for_body_3 ? MaxComp_for_body_2 : MaxComp_for_body_max_0_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_5)) begin
		MaxComp_for_body_max_0_var1_reg <= MaxComp_for_body_max_0_var1;
	end
end
always @(*) begin
		MaxComp_for_body_4 = (MaxComp_for_body_1_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_4)) begin
		MaxComp_for_body_4_reg <= MaxComp_for_body_4;
	end
end
always @(*) begin
		MaxComp_for_body_exitcond = (MaxComp_for_body_4 == 32'd10);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_4)) begin
		MaxComp_for_body_exitcond_reg <= MaxComp_for_body_exitcond;
	end
end
always @(*) begin
		MaxComp_for_end_bit_concat1 = {MaxComp_for_end_bit_concat1_bit_select_operand_0[15:0], MaxComp_for_body_max_0_var1_reg[15:0]};
end
always @(*) begin
		MaxComp_for_end_bit_concat = {MaxComp_for_end_bit_concat_bit_select_operand_0[59:0], MaxComp_for_body_digit_0_var0_reg[3:0]};
end
assign MaxComp_for_end_bit_concat1_bit_select_operand_0 = 16'd0;
assign MaxComp_for_end_bit_concat_bit_select_operand_0 = 60'd0;
always @(posedge clk) begin
	classifier_output_LEGUP_F_MaxComp_BB_for_end_6_not_accessed_due_to_stall_a <= ((fsm_stall & output_digit_valid) & ~(output_digit_ready));
end
always @(posedge clk) begin
	classifier_output_LEGUP_F_MaxComp_BB_for_end_6_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	classifier_output_LEGUP_F_MaxComp_BB_for_end_6_enable_cond_a = ((cur_state == LEGUP_F_MaxComp_BB_for_end_6) & (classifier_output_LEGUP_F_MaxComp_BB_for_end_6_not_accessed_due_to_stall_a | classifier_output_LEGUP_F_MaxComp_BB_for_end_6_stalln_reg));
end
always @(*) begin
	fc_output_inst_port_a_receiver_clk = clk;
end
always @(*) begin
	fc_output_inst_port_a_receiver_reset = reset;
end
always @(*) begin
	fc_output_inst_port_a_receiver_op_start = ((cur_state == LEGUP_F_MaxComp_BB_for_body_4) & (fsm_stall == 1'd0));
end
always @(*) begin
	fc_output_inst_port_a_receiver_user_enable = ((cur_state == LEGUP_F_MaxComp_BB_for_body_5) & (fsm_stall == 1'd0));
end
always @(*) begin
	fc_output_inst_port_a_receiver_data_in = fc_output_inst_port_a_receiver_in;
end
always @(*) begin
	fc_output_inst_port_a_receiver_in = fc_output_read_data_a;
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
end
always @(*) begin
	fc_output_valid_write_en = 1'd0;
	if ((cur_state == LEGUP_F_MaxComp_BB_for_end_6)) begin
		fc_output_valid_write_en = 1'd1;
	end
end
always @(*) begin
	fc_output_valid_write_data = 1'd0;
	if ((cur_state == LEGUP_F_MaxComp_BB_for_end_6)) begin
		fc_output_valid_write_data = 8'd0;
	end
end
assign fc_output_clken = 1'd1;
assign fc_output_write_en_a = 1'd0;
assign fc_output_write_data_a = 16'd0;
always @(*) begin
	fc_output_read_en_a = 1'd0;
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_4)) begin
		fc_output_read_en_a = 1'd1;
	end
end
always @(*) begin
	fc_output_address_a = 4'd0;
	if ((cur_state == LEGUP_F_MaxComp_BB_for_body_4)) begin
		fc_output_address_a = (MaxComp_for_body_data_2_i_i2_i >>> 1'd1);
	end
end
always @(*) begin
	output_digit = 4'd0;
	if ((cur_state == LEGUP_F_MaxComp_BB_for_end_6)) begin
		output_digit = MaxComp_for_body_digit_0_var0_reg;
	end
end
always @(*) begin
	output_digit_valid = 1'd0;
	if (classifier_output_LEGUP_F_MaxComp_BB_for_end_6_enable_cond_a) begin
		output_digit_valid = 1'd1;
	end
end

endmodule
`timescale 1 ns / 1 ns
module ClassifierPipeline
(
	clk,
	reset,
	start,
	ready,
	finish,
	Conv_start,
	Conv_ready,
	Conv_threadID,
	Maxpool_start,
	Maxpool_ready,
	Maxpool_threadID,
	Conv_overloaded_1_start,
	Conv_overloaded_1_ready,
	Conv_overloaded_1_threadID,
	Conv_overloaded_2_start,
	Conv_overloaded_2_ready,
	Conv_overloaded_2_threadID,
	Conv_overloaded_3_start,
	Conv_overloaded_3_ready,
	Conv_overloaded_3_threadID,
	FC_start,
	FC_ready,
	FC_threadID,
	MaxComp_start,
	MaxComp_ready,
	MaxComp_threadID
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_1 = 4'd1;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_3 = 4'd3;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_5 = 4'd5;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_7 = 4'd7;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_9 = 4'd9;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_11 = 4'd11;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_13 = 4'd13;
parameter [3:0] LEGUP_F_ClassifierPipeline_BB_entry_15 = 4'd15;
parameter [3:0] LEGUP_function_call_2 = 4'd2;
parameter [3:0] LEGUP_function_call_4 = 4'd4;
parameter [3:0] LEGUP_function_call_6 = 4'd6;
parameter [3:0] LEGUP_function_call_8 = 4'd8;
parameter [3:0] LEGUP_function_call_10 = 4'd10;
parameter [3:0] LEGUP_function_call_12 = 4'd12;
parameter [3:0] LEGUP_function_call_14 = 4'd14;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  Conv_start;
input  Conv_ready;
output reg [15:0] Conv_threadID;
output reg  Maxpool_start;
input  Maxpool_ready;
output reg [15:0] Maxpool_threadID;
output reg  Conv_overloaded_1_start;
input  Conv_overloaded_1_ready;
output reg [15:0] Conv_overloaded_1_threadID;
output reg  Conv_overloaded_2_start;
input  Conv_overloaded_2_ready;
output reg [15:0] Conv_overloaded_2_threadID;
output reg  Conv_overloaded_3_start;
input  Conv_overloaded_3_ready;
output reg [15:0] Conv_overloaded_3_threadID;
output reg  FC_start;
input  FC_ready;
output reg [15:0] FC_threadID;
output reg  MaxComp_start;
input  MaxComp_ready;
output reg [15:0] MaxComp_threadID;
reg [3:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [3:0] next_state;
wire  fsm_stall;


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
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_1;
LEGUP_F_ClassifierPipeline_BB_entry_1:
		next_state = LEGUP_function_call_2;
LEGUP_F_ClassifierPipeline_BB_entry_11:
		next_state = LEGUP_function_call_12;
LEGUP_F_ClassifierPipeline_BB_entry_13:
		next_state = LEGUP_function_call_14;
LEGUP_F_ClassifierPipeline_BB_entry_15:
		next_state = LEGUP_0;
LEGUP_F_ClassifierPipeline_BB_entry_3:
		next_state = LEGUP_function_call_4;
LEGUP_F_ClassifierPipeline_BB_entry_5:
		next_state = LEGUP_function_call_6;
LEGUP_F_ClassifierPipeline_BB_entry_7:
		next_state = LEGUP_function_call_8;
LEGUP_F_ClassifierPipeline_BB_entry_9:
		next_state = LEGUP_function_call_10;
LEGUP_function_call_10:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_11;
LEGUP_function_call_12:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_13;
LEGUP_function_call_14:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_15;
LEGUP_function_call_2:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_3;
LEGUP_function_call_4:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_5;
LEGUP_function_call_6:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_7;
LEGUP_function_call_8:
		next_state = LEGUP_F_ClassifierPipeline_BB_entry_9;
default:
	next_state = cur_state;
endcase

end
assign fsm_stall = 1'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_15)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if (reset) begin
		Conv_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_1)) begin
		Conv_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_2) & ~(fsm_stall))) begin
		Conv_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_1)) begin
		Conv_threadID <= 16'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		Maxpool_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_3)) begin
		Maxpool_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_4) & ~(fsm_stall))) begin
		Maxpool_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_3)) begin
		Maxpool_threadID <= 16'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		Conv_overloaded_1_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_5)) begin
		Conv_overloaded_1_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_6) & ~(fsm_stall))) begin
		Conv_overloaded_1_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_5)) begin
		Conv_overloaded_1_threadID <= 16'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		Conv_overloaded_2_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_7)) begin
		Conv_overloaded_2_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_8) & ~(fsm_stall))) begin
		Conv_overloaded_2_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_7)) begin
		Conv_overloaded_2_threadID <= 16'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		Conv_overloaded_3_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_9)) begin
		Conv_overloaded_3_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_10) & ~(fsm_stall))) begin
		Conv_overloaded_3_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_9)) begin
		Conv_overloaded_3_threadID <= 16'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		FC_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_11)) begin
		FC_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_12) & ~(fsm_stall))) begin
		FC_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_11)) begin
		FC_threadID <= 16'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		MaxComp_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_13)) begin
		MaxComp_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_14) & ~(fsm_stall))) begin
		MaxComp_start <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_ClassifierPipeline_BB_entry_13)) begin
		MaxComp_threadID <= 16'd0;
	end
end

endmodule
