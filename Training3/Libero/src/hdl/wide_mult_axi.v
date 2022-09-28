// ----------------------------------------------------------------------------
// Smart High-Level Synthesis Tool Version 2022.1
// Copyright (c) 2015-2022 Microchip Technology Inc. All Rights Reserved.
// For support, please contact: smarthls@microchip.com
// Date: Mon May  2 10:33:40 2022
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEMORY_CONTROLLER_DATA_SIZE 256
// Number of RAM elements: 72
`define MEMORY_CONTROLLER_TAG_SIZE 9
`define MEM_INIT_DIR "../simulation/"
//   %r = alloca i256, align 8, !MSB !9938, !LSB !9939, !extendFrom !9938
`define TAG_wide_mult_axi_orig_entry_r `MEMORY_CONTROLLER_TAG_SIZE'd2
`define TAG_wide_mult_axi_orig_entry_r_a {`TAG_wide_mult_axi_orig_entry_r, 23'd0}
//   %ref.tmp = alloca i256, align 8, !MSB !9938, !LSB !9939, !extendFrom !9938
`define TAG_wide_mult_axi_orig_entry_ref_tmp `MEMORY_CONTROLLER_TAG_SIZE'd3
`define TAG_wide_mult_axi_orig_entry_ref_tmp_a {`TAG_wide_mult_axi_orig_entry_ref_tmp, 23'd0}
/* synthesis translate_off */
// For Microsemi, the simulation directory is different from
// the synthesis directory for memory initialization files.
`undef MEM_INIT_DIR
`define MEM_INIT_DIR "../rtl/mem_init/"
/* synthesis translate_on */

`timescale 1 ns / 1 ns
module wide_mult_axi_top
(
	clk,
	reset,
	start,
	ready,
	finish,
	initiator_ar_addr,
	initiator_ar_ready,
	initiator_ar_valid,
	initiator_ar_burst,
	initiator_ar_size,
	initiator_ar_len,
	initiator_r_data,
	initiator_r_ready,
	initiator_r_valid,
	initiator_r_resp,
	initiator_r_last,
	initiator_aw_addr,
	initiator_aw_ready,
	initiator_aw_valid,
	initiator_aw_burst,
	initiator_aw_size,
	initiator_aw_len,
	initiator_w_data,
	initiator_w_ready,
	initiator_w_valid,
	initiator_w_strb,
	initiator_w_last,
	initiator_b_resp,
	initiator_b_resp_ready,
	initiator_b_resp_valid,
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
output reg [31:0] initiator_ar_addr;
input  initiator_ar_ready;
output reg  initiator_ar_valid;
output reg [1:0] initiator_ar_burst;
output reg [2:0] initiator_ar_size;
output reg [7:0] initiator_ar_len;
input [31:0] initiator_r_data;
output reg  initiator_r_ready;
input  initiator_r_valid;
input [1:0] initiator_r_resp;
input  initiator_r_last;
output reg [31:0] initiator_aw_addr;
input  initiator_aw_ready;
output reg  initiator_aw_valid;
output reg [1:0] initiator_aw_burst;
output reg [2:0] initiator_aw_size;
output reg [7:0] initiator_aw_len;
output reg [31:0] initiator_w_data;
input  initiator_w_ready;
output reg  initiator_w_valid;
output reg [3:0] initiator_w_strb;
output reg  initiator_w_last;
input [1:0] initiator_b_resp;
output reg  initiator_b_resp_ready;
input  initiator_b_resp_valid;
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
reg  wide_mult_axi_inst_clk;
reg  wide_mult_axi_inst_reset;
reg  wide_mult_axi_inst_start;
wire  wide_mult_axi_inst_ready;
wire  wide_mult_axi_inst_finish;
wire  wide_mult_axi_inst_wide_mult_axi_orig_start;
reg  wide_mult_axi_inst_wide_mult_axi_orig_finish;
reg  wide_mult_axi_inst_wide_mult_axi_orig_ready;
wire  wide_mult_axi_inst_data_read_start;
reg  wide_mult_axi_inst_data_read_finish;
reg  wide_mult_axi_inst_data_read_ready;
wire  wide_mult_axi_inst_data_write_start;
reg  wide_mult_axi_inst_data_write_finish;
reg  wide_mult_axi_inst_data_write_ready;
reg  wide_mult_axi_inst_finish_reg;
reg  wide_mult_axi_orig_inst_clk;
reg  wide_mult_axi_orig_inst_reset;
reg  wide_mult_axi_orig_inst_start;
wire  wide_mult_axi_orig_inst_ready;
wire  wide_mult_axi_orig_inst_finish;
wire  wide_mult_axi_orig_inst_wide_mult_start;
reg  wide_mult_axi_orig_inst_wide_mult_finish;
wire  wide_mult_axi_orig_inst_wide_mult_ready;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_axi_orig_inst_wide_mult_agg_result;
wire [127:0] wide_mult_axi_orig_inst_wide_mult_A_val;
wire [63:0] wide_mult_axi_orig_inst_wide_mult_B_val;
wire [63:0] wide_mult_axi_orig_inst_wide_mult_C_val;
wire [127:0] wide_mult_axi_orig_inst_wide_mult_D_val;
wire [127:0] wide_mult_axi_orig_inst_wide_mult_E_val;
wire  wide_mult_axi_orig_inst_data_run_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_run_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_run_read_data;
wire  wide_mult_axi_orig_inst_data_A0_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_A0_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_A0_read_data;
wire  wide_mult_axi_orig_inst_data_A1_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_A1_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_A1_read_data;
wire  wide_mult_axi_orig_inst_data_A2_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_A2_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_A2_read_data;
wire  wide_mult_axi_orig_inst_data_A3_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_A3_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_A3_read_data;
wire  wide_mult_axi_orig_inst_data_B0_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_B0_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_B0_read_data;
wire  wide_mult_axi_orig_inst_data_B1_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_B1_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_B1_read_data;
wire  wide_mult_axi_orig_inst_data_C0_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_C0_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_C0_read_data;
wire  wide_mult_axi_orig_inst_data_C1_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_C1_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_C1_read_data;
wire  wide_mult_axi_orig_inst_data_D0_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_D0_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_D0_read_data;
wire  wide_mult_axi_orig_inst_data_D1_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_D1_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_D1_read_data;
wire  wide_mult_axi_orig_inst_data_D2_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_D2_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_D2_read_data;
wire  wide_mult_axi_orig_inst_data_D3_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_D3_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_D3_read_data;
wire  wide_mult_axi_orig_inst_data_E0_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_E0_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_E0_read_data;
wire  wide_mult_axi_orig_inst_data_E1_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_E1_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_E1_read_data;
wire  wide_mult_axi_orig_inst_data_E2_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_E2_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_E2_read_data;
wire  wide_mult_axi_orig_inst_data_E3_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_E3_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_E3_read_data;
wire  wide_mult_axi_orig_inst_memory_controller_0_clken;
wire  wide_mult_axi_orig_inst_memory_controller_0_write_en_a;
wire [255:0] wide_mult_axi_orig_inst_memory_controller_0_write_data_a;
wire  wide_mult_axi_orig_inst_memory_controller_0_read_en_a;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_axi_orig_inst_memory_controller_0_address_a;
wire [1:0] wide_mult_axi_orig_inst_memory_controller_0_size_a;
reg [255:0] wide_mult_axi_orig_inst_memory_controller_0_read_data_a;
wire  wide_mult_axi_orig_inst_memory_controller_0_write_en_b;
wire [255:0] wide_mult_axi_orig_inst_memory_controller_0_write_data_b;
wire  wide_mult_axi_orig_inst_memory_controller_0_read_en_b;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_axi_orig_inst_memory_controller_0_address_b;
wire [1:0] wide_mult_axi_orig_inst_memory_controller_0_size_b;
reg [255:0] wide_mult_axi_orig_inst_memory_controller_0_read_data_b;
wire  wide_mult_axi_orig_inst_data_result0_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result0_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result0_read_data;
wire  wide_mult_axi_orig_inst_data_result1_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result1_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result1_read_data;
wire  wide_mult_axi_orig_inst_data_result2_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result2_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result2_read_data;
wire  wide_mult_axi_orig_inst_data_result3_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result3_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result3_read_data;
wire  wide_mult_axi_orig_inst_data_result4_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result4_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result4_read_data;
wire  wide_mult_axi_orig_inst_data_result5_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result5_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result5_read_data;
wire  wide_mult_axi_orig_inst_data_result6_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result6_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result6_read_data;
wire  wide_mult_axi_orig_inst_data_result7_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_result7_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_result7_read_data;
wire  wide_mult_axi_orig_inst_data_base_addr_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_base_addr_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_base_addr_read_data;
wire [31:0] wide_mult_axi_orig_inst_initiator_ar_addr;
reg  wide_mult_axi_orig_inst_initiator_ar_ready;
wire  wide_mult_axi_orig_inst_initiator_ar_valid;
wire [1:0] wide_mult_axi_orig_inst_initiator_ar_burst;
wire [2:0] wide_mult_axi_orig_inst_initiator_ar_size;
wire [7:0] wide_mult_axi_orig_inst_initiator_ar_len;
reg [31:0] wide_mult_axi_orig_inst_initiator_r_data;
wire  wide_mult_axi_orig_inst_initiator_r_ready;
reg  wide_mult_axi_orig_inst_initiator_r_valid;
reg [1:0] wide_mult_axi_orig_inst_initiator_r_resp;
reg  wide_mult_axi_orig_inst_initiator_r_last;
wire [31:0] wide_mult_axi_orig_inst_initiator_aw_addr;
reg  wide_mult_axi_orig_inst_initiator_aw_ready;
wire  wide_mult_axi_orig_inst_initiator_aw_valid;
wire [1:0] wide_mult_axi_orig_inst_initiator_aw_burst;
wire [2:0] wide_mult_axi_orig_inst_initiator_aw_size;
wire [7:0] wide_mult_axi_orig_inst_initiator_aw_len;
wire [31:0] wide_mult_axi_orig_inst_initiator_w_data;
reg  wide_mult_axi_orig_inst_initiator_w_ready;
wire  wide_mult_axi_orig_inst_initiator_w_valid;
wire [3:0] wide_mult_axi_orig_inst_initiator_w_strb;
wire  wide_mult_axi_orig_inst_initiator_w_last;
reg [1:0] wide_mult_axi_orig_inst_initiator_b_resp;
wire  wide_mult_axi_orig_inst_initiator_b_resp_ready;
reg  wide_mult_axi_orig_inst_initiator_b_resp_valid;
wire  wide_mult_axi_orig_inst_data_error_write_en;
wire [31:0] wide_mult_axi_orig_inst_data_error_write_data;
reg [31:0] wide_mult_axi_orig_inst_data_error_read_data;
reg  wide_mult_axi_orig_inst_finish_reg;
reg  data_run_inst_clk;
reg  data_run_inst_reset;
reg  data_run_inst_write_en;
wire [31:0] data_run_inst_read_data;
reg [31:0] data_run_inst_write_data;
reg  data_A0_inst_clk;
reg  data_A0_inst_reset;
reg  data_A0_inst_write_en;
wire [31:0] data_A0_inst_read_data;
reg [31:0] data_A0_inst_write_data;
reg  data_A1_inst_clk;
reg  data_A1_inst_reset;
reg  data_A1_inst_write_en;
wire [31:0] data_A1_inst_read_data;
reg [31:0] data_A1_inst_write_data;
reg  data_A2_inst_clk;
reg  data_A2_inst_reset;
reg  data_A2_inst_write_en;
wire [31:0] data_A2_inst_read_data;
reg [31:0] data_A2_inst_write_data;
reg  data_A3_inst_clk;
reg  data_A3_inst_reset;
reg  data_A3_inst_write_en;
wire [31:0] data_A3_inst_read_data;
reg [31:0] data_A3_inst_write_data;
reg  data_B0_inst_clk;
reg  data_B0_inst_reset;
reg  data_B0_inst_write_en;
wire [31:0] data_B0_inst_read_data;
reg [31:0] data_B0_inst_write_data;
reg  data_B1_inst_clk;
reg  data_B1_inst_reset;
reg  data_B1_inst_write_en;
wire [31:0] data_B1_inst_read_data;
reg [31:0] data_B1_inst_write_data;
reg  data_C0_inst_clk;
reg  data_C0_inst_reset;
reg  data_C0_inst_write_en;
wire [31:0] data_C0_inst_read_data;
reg [31:0] data_C0_inst_write_data;
reg  data_C1_inst_clk;
reg  data_C1_inst_reset;
reg  data_C1_inst_write_en;
wire [31:0] data_C1_inst_read_data;
reg [31:0] data_C1_inst_write_data;
reg  data_D0_inst_clk;
reg  data_D0_inst_reset;
reg  data_D0_inst_write_en;
wire [31:0] data_D0_inst_read_data;
reg [31:0] data_D0_inst_write_data;
reg  data_D1_inst_clk;
reg  data_D1_inst_reset;
reg  data_D1_inst_write_en;
wire [31:0] data_D1_inst_read_data;
reg [31:0] data_D1_inst_write_data;
reg  data_D2_inst_clk;
reg  data_D2_inst_reset;
reg  data_D2_inst_write_en;
wire [31:0] data_D2_inst_read_data;
reg [31:0] data_D2_inst_write_data;
reg  data_D3_inst_clk;
reg  data_D3_inst_reset;
reg  data_D3_inst_write_en;
wire [31:0] data_D3_inst_read_data;
reg [31:0] data_D3_inst_write_data;
reg  data_E0_inst_clk;
reg  data_E0_inst_reset;
reg  data_E0_inst_write_en;
wire [31:0] data_E0_inst_read_data;
reg [31:0] data_E0_inst_write_data;
reg  data_E1_inst_clk;
reg  data_E1_inst_reset;
reg  data_E1_inst_write_en;
wire [31:0] data_E1_inst_read_data;
reg [31:0] data_E1_inst_write_data;
reg  data_E2_inst_clk;
reg  data_E2_inst_reset;
reg  data_E2_inst_write_en;
wire [31:0] data_E2_inst_read_data;
reg [31:0] data_E2_inst_write_data;
reg  data_E3_inst_clk;
reg  data_E3_inst_reset;
reg  data_E3_inst_write_en;
wire [31:0] data_E3_inst_read_data;
reg [31:0] data_E3_inst_write_data;
reg  memory_controller_0_inst_clk;
reg  memory_controller_0_inst_reset;
reg  memory_controller_0_inst_memory_controller_clken;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_0_inst_memory_controller_address_a;
reg  memory_controller_0_inst_memory_controller_read_en_a;
reg [1:0] memory_controller_0_inst_memory_controller_size_a;
reg  memory_controller_0_inst_memory_controller_write_en_a;
reg [255:0] memory_controller_0_inst_memory_controller_write_data_a;
wire [255:0] memory_controller_0_inst_memory_controller_read_data_reg_a;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_0_inst_memory_controller_address_b;
reg  memory_controller_0_inst_memory_controller_read_en_b;
reg [1:0] memory_controller_0_inst_memory_controller_size_b;
reg  memory_controller_0_inst_memory_controller_write_en_b;
reg [255:0] memory_controller_0_inst_memory_controller_write_data_b;
wire [255:0] memory_controller_0_inst_memory_controller_read_data_reg_b;
reg  data_result0_inst_clk;
reg  data_result0_inst_reset;
reg  data_result0_inst_write_en;
wire [31:0] data_result0_inst_read_data;
reg [31:0] data_result0_inst_write_data;
reg  data_result1_inst_clk;
reg  data_result1_inst_reset;
reg  data_result1_inst_write_en;
wire [31:0] data_result1_inst_read_data;
reg [31:0] data_result1_inst_write_data;
reg  data_result2_inst_clk;
reg  data_result2_inst_reset;
reg  data_result2_inst_write_en;
wire [31:0] data_result2_inst_read_data;
reg [31:0] data_result2_inst_write_data;
reg  data_result3_inst_clk;
reg  data_result3_inst_reset;
reg  data_result3_inst_write_en;
wire [31:0] data_result3_inst_read_data;
reg [31:0] data_result3_inst_write_data;
reg  data_result4_inst_clk;
reg  data_result4_inst_reset;
reg  data_result4_inst_write_en;
wire [31:0] data_result4_inst_read_data;
reg [31:0] data_result4_inst_write_data;
reg  data_result5_inst_clk;
reg  data_result5_inst_reset;
reg  data_result5_inst_write_en;
wire [31:0] data_result5_inst_read_data;
reg [31:0] data_result5_inst_write_data;
reg  data_result6_inst_clk;
reg  data_result6_inst_reset;
reg  data_result6_inst_write_en;
wire [31:0] data_result6_inst_read_data;
reg [31:0] data_result6_inst_write_data;
reg  data_result7_inst_clk;
reg  data_result7_inst_reset;
reg  data_result7_inst_write_en;
wire [31:0] data_result7_inst_read_data;
reg [31:0] data_result7_inst_write_data;
reg  data_base_addr_inst_clk;
reg  data_base_addr_inst_reset;
reg  data_base_addr_inst_write_en;
wire [31:0] data_base_addr_inst_read_data;
reg [31:0] data_base_addr_inst_write_data;
reg  data_error_inst_clk;
reg  data_error_inst_reset;
reg  data_error_inst_write_en;
wire [31:0] data_error_inst_read_data;
reg [31:0] data_error_inst_write_data;
reg  wide_mult_inst_clk;
reg  wide_mult_inst_reset;
reg  wide_mult_inst_start;
wire  wide_mult_inst_ready;
wire  wide_mult_inst_finish;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_inst_agg_result;
reg [127:0] wide_mult_inst_A_val;
reg [63:0] wide_mult_inst_B_val;
reg [63:0] wide_mult_inst_C_val;
reg [127:0] wide_mult_inst_D_val;
reg [127:0] wide_mult_inst_E_val;
wire  wide_mult_inst_memory_controller_0_clken;
wire  wide_mult_inst_memory_controller_0_write_en_a;
wire [255:0] wide_mult_inst_memory_controller_0_write_data_a;
wire  wide_mult_inst_memory_controller_0_read_en_a;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_inst_memory_controller_0_address_a;
wire [1:0] wide_mult_inst_memory_controller_0_size_a;
reg [255:0] wide_mult_inst_memory_controller_0_read_data_a;
wire  wide_mult_inst_memory_controller_0_write_en_b;
wire [255:0] wide_mult_inst_memory_controller_0_write_data_b;
wire  wide_mult_inst_memory_controller_0_read_en_b;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_inst_memory_controller_0_address_b;
wire [1:0] wide_mult_inst_memory_controller_0_size_b;
reg [255:0] wide_mult_inst_memory_controller_0_read_data_b;
reg  wide_mult_inst_finish_reg;
reg  data_read_inst_clk;
reg  data_read_inst_reset;
reg  data_read_inst_start;
wire  data_read_inst_ready;
wire  data_read_inst_finish;
reg [31:0] data_read_inst_s_ar_addr;
wire  data_read_inst_axi_s_ar_ready;
reg  data_read_inst_axi_s_ar_valid;
wire  data_read_inst_data_result4_write_en;
wire [31:0] data_read_inst_data_result4_write_data;
reg [31:0] data_read_inst_data_result4_read_data;
wire  data_read_inst_data_result3_write_en;
wire [31:0] data_read_inst_data_result3_write_data;
reg [31:0] data_read_inst_data_result3_read_data;
wire  data_read_inst_data_result6_write_en;
wire [31:0] data_read_inst_data_result6_write_data;
reg [31:0] data_read_inst_data_result6_read_data;
wire  data_read_inst_data_result5_write_en;
wire [31:0] data_read_inst_data_result5_write_data;
reg [31:0] data_read_inst_data_result5_read_data;
wire  data_read_inst_data_A0_write_en;
wire [31:0] data_read_inst_data_A0_write_data;
reg [31:0] data_read_inst_data_A0_read_data;
wire  data_read_inst_data_result7_write_en;
wire [31:0] data_read_inst_data_result7_write_data;
reg [31:0] data_read_inst_data_result7_read_data;
wire  data_read_inst_data_A2_write_en;
wire [31:0] data_read_inst_data_A2_write_data;
reg [31:0] data_read_inst_data_A2_read_data;
wire  data_read_inst_data_A1_write_en;
wire [31:0] data_read_inst_data_A1_write_data;
reg [31:0] data_read_inst_data_A1_read_data;
wire  data_read_inst_data_B0_write_en;
wire [31:0] data_read_inst_data_B0_write_data;
reg [31:0] data_read_inst_data_B0_read_data;
wire  data_read_inst_data_A3_write_en;
wire [31:0] data_read_inst_data_A3_write_data;
reg [31:0] data_read_inst_data_A3_read_data;
wire  data_read_inst_data_C0_write_en;
wire [31:0] data_read_inst_data_C0_write_data;
reg [31:0] data_read_inst_data_C0_read_data;
wire  data_read_inst_data_B1_write_en;
wire [31:0] data_read_inst_data_B1_write_data;
reg [31:0] data_read_inst_data_B1_read_data;
wire  data_read_inst_data_D0_write_en;
wire [31:0] data_read_inst_data_D0_write_data;
reg [31:0] data_read_inst_data_D0_read_data;
wire  data_read_inst_data_C1_write_en;
wire [31:0] data_read_inst_data_C1_write_data;
reg [31:0] data_read_inst_data_C1_read_data;
wire  data_read_inst_data_D2_write_en;
wire [31:0] data_read_inst_data_D2_write_data;
reg [31:0] data_read_inst_data_D2_read_data;
wire  data_read_inst_data_D1_write_en;
wire [31:0] data_read_inst_data_D1_write_data;
reg [31:0] data_read_inst_data_D1_read_data;
wire  data_read_inst_data_E0_write_en;
wire [31:0] data_read_inst_data_E0_write_data;
reg [31:0] data_read_inst_data_E0_read_data;
wire  data_read_inst_data_D3_write_en;
wire [31:0] data_read_inst_data_D3_write_data;
reg [31:0] data_read_inst_data_D3_read_data;
wire  data_read_inst_data_E2_write_en;
wire [31:0] data_read_inst_data_E2_write_data;
reg [31:0] data_read_inst_data_E2_read_data;
wire  data_read_inst_data_E1_write_en;
wire [31:0] data_read_inst_data_E1_write_data;
reg [31:0] data_read_inst_data_E1_read_data;
wire  data_read_inst_data_E3_write_en;
wire [31:0] data_read_inst_data_E3_write_data;
reg [31:0] data_read_inst_data_E3_read_data;
wire  data_read_inst_data_ctrl_write_en;
wire  data_read_inst_data_ctrl_write_data;
reg  data_read_inst_data_ctrl_read_data;
reg [1:0] data_read_inst_s_ar_burst;
reg [2:0] data_read_inst_s_ar_size;
reg [7:0] data_read_inst_s_ar_len;
wire  data_read_inst_data_base_addr_write_en;
wire [31:0] data_read_inst_data_base_addr_write_data;
reg [31:0] data_read_inst_data_base_addr_read_data;
wire  data_read_inst_data_run_write_en;
wire [31:0] data_read_inst_data_run_write_data;
reg [31:0] data_read_inst_data_run_read_data;
wire  data_read_inst_data_result0_write_en;
wire [31:0] data_read_inst_data_result0_write_data;
reg [31:0] data_read_inst_data_result0_read_data;
wire  data_read_inst_data_error_write_en;
wire [31:0] data_read_inst_data_error_write_data;
reg [31:0] data_read_inst_data_error_read_data;
wire  data_read_inst_data_result2_write_en;
wire [31:0] data_read_inst_data_result2_write_data;
reg [31:0] data_read_inst_data_result2_read_data;
wire  data_read_inst_data_result1_write_en;
wire [31:0] data_read_inst_data_result1_write_data;
reg [31:0] data_read_inst_data_result1_read_data;
wire [63:0] data_read_inst_s_r_data;
reg  data_read_inst_axi_s_r_ready;
wire  data_read_inst_axi_s_r_valid;
wire [1:0] data_read_inst_s_r_resp;
wire  data_read_inst_s_r_last;
reg  data_read_inst_finish_reg;
reg  data_ctrl_inst_clk;
reg  data_ctrl_inst_reset;
reg  data_ctrl_inst_write_en;
wire  data_ctrl_inst_read_data;
wire  data_ctrl_inst_write_data;
reg  data_write_inst_clk;
reg  data_write_inst_reset;
reg  data_write_inst_start;
wire  data_write_inst_ready;
wire  data_write_inst_finish;
reg [31:0] data_write_inst_s_aw_addr;
wire  data_write_inst_axi_s_aw_ready;
reg  data_write_inst_axi_s_aw_valid;
reg [63:0] data_write_inst_s_w_data;
wire  data_write_inst_axi_s_w_ready;
reg  data_write_inst_axi_s_w_valid;
reg [1:0] data_write_inst_s_aw_burst;
reg [2:0] data_write_inst_s_aw_size;
reg [7:0] data_write_inst_s_aw_len;
reg [7:0] data_write_inst_s_w_strb;
reg  data_write_inst_s_w_last;
wire  data_write_inst_data_ctrl_write_en;
wire  data_write_inst_data_ctrl_write_data;
wire  data_write_inst_data_ctrl_read_data;
wire  data_write_inst_data_run_write_en;
wire [31:0] data_write_inst_data_run_write_data;
reg [31:0] data_write_inst_data_run_read_data;
wire  data_write_inst_data_error_write_en;
wire [31:0] data_write_inst_data_error_write_data;
reg [31:0] data_write_inst_data_error_read_data;
wire  data_write_inst_data_result1_write_en;
wire [31:0] data_write_inst_data_result1_write_data;
reg [31:0] data_write_inst_data_result1_read_data;
wire  data_write_inst_data_result3_write_en;
wire [31:0] data_write_inst_data_result3_write_data;
reg [31:0] data_write_inst_data_result3_read_data;
wire  data_write_inst_data_result5_write_en;
wire [31:0] data_write_inst_data_result5_write_data;
reg [31:0] data_write_inst_data_result5_read_data;
wire  data_write_inst_data_result7_write_en;
wire [31:0] data_write_inst_data_result7_write_data;
reg [31:0] data_write_inst_data_result7_read_data;
wire  data_write_inst_data_A1_write_en;
wire [31:0] data_write_inst_data_A1_write_data;
reg [31:0] data_write_inst_data_A1_read_data;
wire  data_write_inst_data_A3_write_en;
wire [31:0] data_write_inst_data_A3_write_data;
reg [31:0] data_write_inst_data_A3_read_data;
wire  data_write_inst_data_B1_write_en;
wire [31:0] data_write_inst_data_B1_write_data;
reg [31:0] data_write_inst_data_B1_read_data;
wire  data_write_inst_data_C1_write_en;
wire [31:0] data_write_inst_data_C1_write_data;
reg [31:0] data_write_inst_data_C1_read_data;
wire  data_write_inst_data_D1_write_en;
wire [31:0] data_write_inst_data_D1_write_data;
reg [31:0] data_write_inst_data_D1_read_data;
wire  data_write_inst_data_D3_write_en;
wire [31:0] data_write_inst_data_D3_write_data;
reg [31:0] data_write_inst_data_D3_read_data;
wire  data_write_inst_data_E1_write_en;
wire [31:0] data_write_inst_data_E1_write_data;
reg [31:0] data_write_inst_data_E1_read_data;
wire  data_write_inst_data_E3_write_en;
wire [31:0] data_write_inst_data_E3_write_data;
reg [31:0] data_write_inst_data_E3_read_data;
wire  data_write_inst_data_base_addr_write_en;
wire [31:0] data_write_inst_data_base_addr_write_data;
reg [31:0] data_write_inst_data_base_addr_read_data;
wire  data_write_inst_data_result0_write_en;
wire [31:0] data_write_inst_data_result0_write_data;
reg [31:0] data_write_inst_data_result0_read_data;
wire  data_write_inst_data_result2_write_en;
wire [31:0] data_write_inst_data_result2_write_data;
reg [31:0] data_write_inst_data_result2_read_data;
wire  data_write_inst_data_result4_write_en;
wire [31:0] data_write_inst_data_result4_write_data;
reg [31:0] data_write_inst_data_result4_read_data;
wire  data_write_inst_data_result6_write_en;
wire [31:0] data_write_inst_data_result6_write_data;
reg [31:0] data_write_inst_data_result6_read_data;
wire  data_write_inst_data_A0_write_en;
wire [31:0] data_write_inst_data_A0_write_data;
reg [31:0] data_write_inst_data_A0_read_data;
wire  data_write_inst_data_A2_write_en;
wire [31:0] data_write_inst_data_A2_write_data;
reg [31:0] data_write_inst_data_A2_read_data;
wire  data_write_inst_data_B0_write_en;
wire [31:0] data_write_inst_data_B0_write_data;
reg [31:0] data_write_inst_data_B0_read_data;
wire  data_write_inst_data_C0_write_en;
wire [31:0] data_write_inst_data_C0_write_data;
reg [31:0] data_write_inst_data_C0_read_data;
wire  data_write_inst_data_D0_write_en;
wire [31:0] data_write_inst_data_D0_write_data;
reg [31:0] data_write_inst_data_D0_read_data;
wire  data_write_inst_data_D2_write_en;
wire [31:0] data_write_inst_data_D2_write_data;
reg [31:0] data_write_inst_data_D2_read_data;
wire  data_write_inst_data_E0_write_en;
wire [31:0] data_write_inst_data_E0_write_data;
reg [31:0] data_write_inst_data_E0_read_data;
wire  data_write_inst_data_E2_write_en;
wire [31:0] data_write_inst_data_E2_write_data;
reg [31:0] data_write_inst_data_E2_read_data;
wire [1:0] data_write_inst_s_b_resp;
reg  data_write_inst_s_b_resp_ready;
wire  data_write_inst_s_b_resp_valid;
reg  data_write_inst_finish_reg;


wide_mult_axi wide_mult_axi_inst (
	.clk (wide_mult_axi_inst_clk),
	.reset (wide_mult_axi_inst_reset),
	.start (wide_mult_axi_inst_start),
	.ready (wide_mult_axi_inst_ready),
	.finish (wide_mult_axi_inst_finish),
	.wide_mult_axi_orig_start (wide_mult_axi_inst_wide_mult_axi_orig_start),
	.wide_mult_axi_orig_finish (wide_mult_axi_inst_wide_mult_axi_orig_finish),
	.wide_mult_axi_orig_ready (wide_mult_axi_inst_wide_mult_axi_orig_ready),
	.data_read_start (wide_mult_axi_inst_data_read_start),
	.data_read_finish (wide_mult_axi_inst_data_read_finish),
	.data_read_ready (wide_mult_axi_inst_data_read_ready),
	.data_write_start (wide_mult_axi_inst_data_write_start),
	.data_write_finish (wide_mult_axi_inst_data_write_finish),
	.data_write_ready (wide_mult_axi_inst_data_write_ready)
);



wide_mult_axi_orig wide_mult_axi_orig_inst (
	.clk (wide_mult_axi_orig_inst_clk),
	.reset (wide_mult_axi_orig_inst_reset),
	.start (wide_mult_axi_orig_inst_start),
	.ready (wide_mult_axi_orig_inst_ready),
	.finish (wide_mult_axi_orig_inst_finish),
	.wide_mult_start (wide_mult_axi_orig_inst_wide_mult_start),
	.wide_mult_finish (wide_mult_axi_orig_inst_wide_mult_finish),
	.wide_mult_ready (wide_mult_axi_orig_inst_wide_mult_ready),
	.wide_mult_agg_result (wide_mult_axi_orig_inst_wide_mult_agg_result),
	.wide_mult_A_val (wide_mult_axi_orig_inst_wide_mult_A_val),
	.wide_mult_B_val (wide_mult_axi_orig_inst_wide_mult_B_val),
	.wide_mult_C_val (wide_mult_axi_orig_inst_wide_mult_C_val),
	.wide_mult_D_val (wide_mult_axi_orig_inst_wide_mult_D_val),
	.wide_mult_E_val (wide_mult_axi_orig_inst_wide_mult_E_val),
	.data_run_write_en (wide_mult_axi_orig_inst_data_run_write_en),
	.data_run_write_data (wide_mult_axi_orig_inst_data_run_write_data),
	.data_run_read_data (wide_mult_axi_orig_inst_data_run_read_data),
	.data_A0_write_en (wide_mult_axi_orig_inst_data_A0_write_en),
	.data_A0_write_data (wide_mult_axi_orig_inst_data_A0_write_data),
	.data_A0_read_data (wide_mult_axi_orig_inst_data_A0_read_data),
	.data_A1_write_en (wide_mult_axi_orig_inst_data_A1_write_en),
	.data_A1_write_data (wide_mult_axi_orig_inst_data_A1_write_data),
	.data_A1_read_data (wide_mult_axi_orig_inst_data_A1_read_data),
	.data_A2_write_en (wide_mult_axi_orig_inst_data_A2_write_en),
	.data_A2_write_data (wide_mult_axi_orig_inst_data_A2_write_data),
	.data_A2_read_data (wide_mult_axi_orig_inst_data_A2_read_data),
	.data_A3_write_en (wide_mult_axi_orig_inst_data_A3_write_en),
	.data_A3_write_data (wide_mult_axi_orig_inst_data_A3_write_data),
	.data_A3_read_data (wide_mult_axi_orig_inst_data_A3_read_data),
	.data_B0_write_en (wide_mult_axi_orig_inst_data_B0_write_en),
	.data_B0_write_data (wide_mult_axi_orig_inst_data_B0_write_data),
	.data_B0_read_data (wide_mult_axi_orig_inst_data_B0_read_data),
	.data_B1_write_en (wide_mult_axi_orig_inst_data_B1_write_en),
	.data_B1_write_data (wide_mult_axi_orig_inst_data_B1_write_data),
	.data_B1_read_data (wide_mult_axi_orig_inst_data_B1_read_data),
	.data_C0_write_en (wide_mult_axi_orig_inst_data_C0_write_en),
	.data_C0_write_data (wide_mult_axi_orig_inst_data_C0_write_data),
	.data_C0_read_data (wide_mult_axi_orig_inst_data_C0_read_data),
	.data_C1_write_en (wide_mult_axi_orig_inst_data_C1_write_en),
	.data_C1_write_data (wide_mult_axi_orig_inst_data_C1_write_data),
	.data_C1_read_data (wide_mult_axi_orig_inst_data_C1_read_data),
	.data_D0_write_en (wide_mult_axi_orig_inst_data_D0_write_en),
	.data_D0_write_data (wide_mult_axi_orig_inst_data_D0_write_data),
	.data_D0_read_data (wide_mult_axi_orig_inst_data_D0_read_data),
	.data_D1_write_en (wide_mult_axi_orig_inst_data_D1_write_en),
	.data_D1_write_data (wide_mult_axi_orig_inst_data_D1_write_data),
	.data_D1_read_data (wide_mult_axi_orig_inst_data_D1_read_data),
	.data_D2_write_en (wide_mult_axi_orig_inst_data_D2_write_en),
	.data_D2_write_data (wide_mult_axi_orig_inst_data_D2_write_data),
	.data_D2_read_data (wide_mult_axi_orig_inst_data_D2_read_data),
	.data_D3_write_en (wide_mult_axi_orig_inst_data_D3_write_en),
	.data_D3_write_data (wide_mult_axi_orig_inst_data_D3_write_data),
	.data_D3_read_data (wide_mult_axi_orig_inst_data_D3_read_data),
	.data_E0_write_en (wide_mult_axi_orig_inst_data_E0_write_en),
	.data_E0_write_data (wide_mult_axi_orig_inst_data_E0_write_data),
	.data_E0_read_data (wide_mult_axi_orig_inst_data_E0_read_data),
	.data_E1_write_en (wide_mult_axi_orig_inst_data_E1_write_en),
	.data_E1_write_data (wide_mult_axi_orig_inst_data_E1_write_data),
	.data_E1_read_data (wide_mult_axi_orig_inst_data_E1_read_data),
	.data_E2_write_en (wide_mult_axi_orig_inst_data_E2_write_en),
	.data_E2_write_data (wide_mult_axi_orig_inst_data_E2_write_data),
	.data_E2_read_data (wide_mult_axi_orig_inst_data_E2_read_data),
	.data_E3_write_en (wide_mult_axi_orig_inst_data_E3_write_en),
	.data_E3_write_data (wide_mult_axi_orig_inst_data_E3_write_data),
	.data_E3_read_data (wide_mult_axi_orig_inst_data_E3_read_data),
	.memory_controller_0_clken (wide_mult_axi_orig_inst_memory_controller_0_clken),
	.memory_controller_0_write_en_a (wide_mult_axi_orig_inst_memory_controller_0_write_en_a),
	.memory_controller_0_write_data_a (wide_mult_axi_orig_inst_memory_controller_0_write_data_a),
	.memory_controller_0_read_en_a (wide_mult_axi_orig_inst_memory_controller_0_read_en_a),
	.memory_controller_0_address_a (wide_mult_axi_orig_inst_memory_controller_0_address_a),
	.memory_controller_0_size_a (wide_mult_axi_orig_inst_memory_controller_0_size_a),
	.memory_controller_0_read_data_a (wide_mult_axi_orig_inst_memory_controller_0_read_data_a),
	.memory_controller_0_write_en_b (wide_mult_axi_orig_inst_memory_controller_0_write_en_b),
	.memory_controller_0_write_data_b (wide_mult_axi_orig_inst_memory_controller_0_write_data_b),
	.memory_controller_0_read_en_b (wide_mult_axi_orig_inst_memory_controller_0_read_en_b),
	.memory_controller_0_address_b (wide_mult_axi_orig_inst_memory_controller_0_address_b),
	.memory_controller_0_size_b (wide_mult_axi_orig_inst_memory_controller_0_size_b),
	.memory_controller_0_read_data_b (wide_mult_axi_orig_inst_memory_controller_0_read_data_b),
	.data_result0_write_en (wide_mult_axi_orig_inst_data_result0_write_en),
	.data_result0_write_data (wide_mult_axi_orig_inst_data_result0_write_data),
	.data_result0_read_data (wide_mult_axi_orig_inst_data_result0_read_data),
	.data_result1_write_en (wide_mult_axi_orig_inst_data_result1_write_en),
	.data_result1_write_data (wide_mult_axi_orig_inst_data_result1_write_data),
	.data_result1_read_data (wide_mult_axi_orig_inst_data_result1_read_data),
	.data_result2_write_en (wide_mult_axi_orig_inst_data_result2_write_en),
	.data_result2_write_data (wide_mult_axi_orig_inst_data_result2_write_data),
	.data_result2_read_data (wide_mult_axi_orig_inst_data_result2_read_data),
	.data_result3_write_en (wide_mult_axi_orig_inst_data_result3_write_en),
	.data_result3_write_data (wide_mult_axi_orig_inst_data_result3_write_data),
	.data_result3_read_data (wide_mult_axi_orig_inst_data_result3_read_data),
	.data_result4_write_en (wide_mult_axi_orig_inst_data_result4_write_en),
	.data_result4_write_data (wide_mult_axi_orig_inst_data_result4_write_data),
	.data_result4_read_data (wide_mult_axi_orig_inst_data_result4_read_data),
	.data_result5_write_en (wide_mult_axi_orig_inst_data_result5_write_en),
	.data_result5_write_data (wide_mult_axi_orig_inst_data_result5_write_data),
	.data_result5_read_data (wide_mult_axi_orig_inst_data_result5_read_data),
	.data_result6_write_en (wide_mult_axi_orig_inst_data_result6_write_en),
	.data_result6_write_data (wide_mult_axi_orig_inst_data_result6_write_data),
	.data_result6_read_data (wide_mult_axi_orig_inst_data_result6_read_data),
	.data_result7_write_en (wide_mult_axi_orig_inst_data_result7_write_en),
	.data_result7_write_data (wide_mult_axi_orig_inst_data_result7_write_data),
	.data_result7_read_data (wide_mult_axi_orig_inst_data_result7_read_data),
	.data_base_addr_write_en (wide_mult_axi_orig_inst_data_base_addr_write_en),
	.data_base_addr_write_data (wide_mult_axi_orig_inst_data_base_addr_write_data),
	.data_base_addr_read_data (wide_mult_axi_orig_inst_data_base_addr_read_data),
	.initiator_ar_addr (wide_mult_axi_orig_inst_initiator_ar_addr),
	.initiator_ar_ready (wide_mult_axi_orig_inst_initiator_ar_ready),
	.initiator_ar_valid (wide_mult_axi_orig_inst_initiator_ar_valid),
	.initiator_ar_burst (wide_mult_axi_orig_inst_initiator_ar_burst),
	.initiator_ar_size (wide_mult_axi_orig_inst_initiator_ar_size),
	.initiator_ar_len (wide_mult_axi_orig_inst_initiator_ar_len),
	.initiator_r_data (wide_mult_axi_orig_inst_initiator_r_data),
	.initiator_r_ready (wide_mult_axi_orig_inst_initiator_r_ready),
	.initiator_r_valid (wide_mult_axi_orig_inst_initiator_r_valid),
	.initiator_r_resp (wide_mult_axi_orig_inst_initiator_r_resp),
	.initiator_r_last (wide_mult_axi_orig_inst_initiator_r_last),
	.initiator_aw_addr (wide_mult_axi_orig_inst_initiator_aw_addr),
	.initiator_aw_ready (wide_mult_axi_orig_inst_initiator_aw_ready),
	.initiator_aw_valid (wide_mult_axi_orig_inst_initiator_aw_valid),
	.initiator_aw_burst (wide_mult_axi_orig_inst_initiator_aw_burst),
	.initiator_aw_size (wide_mult_axi_orig_inst_initiator_aw_size),
	.initiator_aw_len (wide_mult_axi_orig_inst_initiator_aw_len),
	.initiator_w_data (wide_mult_axi_orig_inst_initiator_w_data),
	.initiator_w_ready (wide_mult_axi_orig_inst_initiator_w_ready),
	.initiator_w_valid (wide_mult_axi_orig_inst_initiator_w_valid),
	.initiator_w_strb (wide_mult_axi_orig_inst_initiator_w_strb),
	.initiator_w_last (wide_mult_axi_orig_inst_initiator_w_last),
	.initiator_b_resp (wide_mult_axi_orig_inst_initiator_b_resp),
	.initiator_b_resp_ready (wide_mult_axi_orig_inst_initiator_b_resp_ready),
	.initiator_b_resp_valid (wide_mult_axi_orig_inst_initiator_b_resp_valid),
	.data_error_write_en (wide_mult_axi_orig_inst_data_error_write_en),
	.data_error_write_data (wide_mult_axi_orig_inst_data_error_write_data),
	.data_error_read_data (wide_mult_axi_orig_inst_data_error_read_data)
);



wide_mult_axi_hls_register data_run_inst (
	.clk (data_run_inst_clk),
	.reset (data_run_inst_reset),
	.write_en (data_run_inst_write_en),
	.read_data (data_run_inst_read_data),
	.write_data (data_run_inst_write_data)
);

defparam
	data_run_inst.width = 32,
	data_run_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_A0_inst (
	.clk (data_A0_inst_clk),
	.reset (data_A0_inst_reset),
	.write_en (data_A0_inst_write_en),
	.read_data (data_A0_inst_read_data),
	.write_data (data_A0_inst_write_data)
);

defparam
	data_A0_inst.width = 32,
	data_A0_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_A1_inst (
	.clk (data_A1_inst_clk),
	.reset (data_A1_inst_reset),
	.write_en (data_A1_inst_write_en),
	.read_data (data_A1_inst_read_data),
	.write_data (data_A1_inst_write_data)
);

defparam
	data_A1_inst.width = 32,
	data_A1_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_A2_inst (
	.clk (data_A2_inst_clk),
	.reset (data_A2_inst_reset),
	.write_en (data_A2_inst_write_en),
	.read_data (data_A2_inst_read_data),
	.write_data (data_A2_inst_write_data)
);

defparam
	data_A2_inst.width = 32,
	data_A2_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_A3_inst (
	.clk (data_A3_inst_clk),
	.reset (data_A3_inst_reset),
	.write_en (data_A3_inst_write_en),
	.read_data (data_A3_inst_read_data),
	.write_data (data_A3_inst_write_data)
);

defparam
	data_A3_inst.width = 32,
	data_A3_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_B0_inst (
	.clk (data_B0_inst_clk),
	.reset (data_B0_inst_reset),
	.write_en (data_B0_inst_write_en),
	.read_data (data_B0_inst_read_data),
	.write_data (data_B0_inst_write_data)
);

defparam
	data_B0_inst.width = 32,
	data_B0_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_B1_inst (
	.clk (data_B1_inst_clk),
	.reset (data_B1_inst_reset),
	.write_en (data_B1_inst_write_en),
	.read_data (data_B1_inst_read_data),
	.write_data (data_B1_inst_write_data)
);

defparam
	data_B1_inst.width = 32,
	data_B1_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_C0_inst (
	.clk (data_C0_inst_clk),
	.reset (data_C0_inst_reset),
	.write_en (data_C0_inst_write_en),
	.read_data (data_C0_inst_read_data),
	.write_data (data_C0_inst_write_data)
);

defparam
	data_C0_inst.width = 32,
	data_C0_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_C1_inst (
	.clk (data_C1_inst_clk),
	.reset (data_C1_inst_reset),
	.write_en (data_C1_inst_write_en),
	.read_data (data_C1_inst_read_data),
	.write_data (data_C1_inst_write_data)
);

defparam
	data_C1_inst.width = 32,
	data_C1_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_D0_inst (
	.clk (data_D0_inst_clk),
	.reset (data_D0_inst_reset),
	.write_en (data_D0_inst_write_en),
	.read_data (data_D0_inst_read_data),
	.write_data (data_D0_inst_write_data)
);

defparam
	data_D0_inst.width = 32,
	data_D0_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_D1_inst (
	.clk (data_D1_inst_clk),
	.reset (data_D1_inst_reset),
	.write_en (data_D1_inst_write_en),
	.read_data (data_D1_inst_read_data),
	.write_data (data_D1_inst_write_data)
);

defparam
	data_D1_inst.width = 32,
	data_D1_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_D2_inst (
	.clk (data_D2_inst_clk),
	.reset (data_D2_inst_reset),
	.write_en (data_D2_inst_write_en),
	.read_data (data_D2_inst_read_data),
	.write_data (data_D2_inst_write_data)
);

defparam
	data_D2_inst.width = 32,
	data_D2_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_D3_inst (
	.clk (data_D3_inst_clk),
	.reset (data_D3_inst_reset),
	.write_en (data_D3_inst_write_en),
	.read_data (data_D3_inst_read_data),
	.write_data (data_D3_inst_write_data)
);

defparam
	data_D3_inst.width = 32,
	data_D3_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_E0_inst (
	.clk (data_E0_inst_clk),
	.reset (data_E0_inst_reset),
	.write_en (data_E0_inst_write_en),
	.read_data (data_E0_inst_read_data),
	.write_data (data_E0_inst_write_data)
);

defparam
	data_E0_inst.width = 32,
	data_E0_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_E1_inst (
	.clk (data_E1_inst_clk),
	.reset (data_E1_inst_reset),
	.write_en (data_E1_inst_write_en),
	.read_data (data_E1_inst_read_data),
	.write_data (data_E1_inst_write_data)
);

defparam
	data_E1_inst.width = 32,
	data_E1_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_E2_inst (
	.clk (data_E2_inst_clk),
	.reset (data_E2_inst_reset),
	.write_en (data_E2_inst_write_en),
	.read_data (data_E2_inst_read_data),
	.write_data (data_E2_inst_write_data)
);

defparam
	data_E2_inst.width = 32,
	data_E2_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_E3_inst (
	.clk (data_E3_inst_clk),
	.reset (data_E3_inst_reset),
	.write_en (data_E3_inst_write_en),
	.read_data (data_E3_inst_read_data),
	.write_data (data_E3_inst_write_data)
);

defparam
	data_E3_inst.width = 32,
	data_E3_inst.init_value = 32'd0;


memory_controller_0 memory_controller_0_inst (
	.clk (memory_controller_0_inst_clk),
	.reset (memory_controller_0_inst_reset),
	.memory_controller_clken (memory_controller_0_inst_memory_controller_clken),
	.memory_controller_address_a (memory_controller_0_inst_memory_controller_address_a),
	.memory_controller_read_en_a (memory_controller_0_inst_memory_controller_read_en_a),
	.memory_controller_size_a (memory_controller_0_inst_memory_controller_size_a),
	.memory_controller_write_en_a (memory_controller_0_inst_memory_controller_write_en_a),
	.memory_controller_write_data_a (memory_controller_0_inst_memory_controller_write_data_a),
	.memory_controller_read_data_reg_a (memory_controller_0_inst_memory_controller_read_data_reg_a),
	.memory_controller_address_b (memory_controller_0_inst_memory_controller_address_b),
	.memory_controller_read_en_b (memory_controller_0_inst_memory_controller_read_en_b),
	.memory_controller_size_b (memory_controller_0_inst_memory_controller_size_b),
	.memory_controller_write_en_b (memory_controller_0_inst_memory_controller_write_en_b),
	.memory_controller_write_data_b (memory_controller_0_inst_memory_controller_write_data_b),
	.memory_controller_read_data_reg_b (memory_controller_0_inst_memory_controller_read_data_reg_b)
);



wide_mult_axi_hls_register data_result0_inst (
	.clk (data_result0_inst_clk),
	.reset (data_result0_inst_reset),
	.write_en (data_result0_inst_write_en),
	.read_data (data_result0_inst_read_data),
	.write_data (data_result0_inst_write_data)
);

defparam
	data_result0_inst.width = 32,
	data_result0_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result1_inst (
	.clk (data_result1_inst_clk),
	.reset (data_result1_inst_reset),
	.write_en (data_result1_inst_write_en),
	.read_data (data_result1_inst_read_data),
	.write_data (data_result1_inst_write_data)
);

defparam
	data_result1_inst.width = 32,
	data_result1_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result2_inst (
	.clk (data_result2_inst_clk),
	.reset (data_result2_inst_reset),
	.write_en (data_result2_inst_write_en),
	.read_data (data_result2_inst_read_data),
	.write_data (data_result2_inst_write_data)
);

defparam
	data_result2_inst.width = 32,
	data_result2_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result3_inst (
	.clk (data_result3_inst_clk),
	.reset (data_result3_inst_reset),
	.write_en (data_result3_inst_write_en),
	.read_data (data_result3_inst_read_data),
	.write_data (data_result3_inst_write_data)
);

defparam
	data_result3_inst.width = 32,
	data_result3_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result4_inst (
	.clk (data_result4_inst_clk),
	.reset (data_result4_inst_reset),
	.write_en (data_result4_inst_write_en),
	.read_data (data_result4_inst_read_data),
	.write_data (data_result4_inst_write_data)
);

defparam
	data_result4_inst.width = 32,
	data_result4_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result5_inst (
	.clk (data_result5_inst_clk),
	.reset (data_result5_inst_reset),
	.write_en (data_result5_inst_write_en),
	.read_data (data_result5_inst_read_data),
	.write_data (data_result5_inst_write_data)
);

defparam
	data_result5_inst.width = 32,
	data_result5_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result6_inst (
	.clk (data_result6_inst_clk),
	.reset (data_result6_inst_reset),
	.write_en (data_result6_inst_write_en),
	.read_data (data_result6_inst_read_data),
	.write_data (data_result6_inst_write_data)
);

defparam
	data_result6_inst.width = 32,
	data_result6_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_result7_inst (
	.clk (data_result7_inst_clk),
	.reset (data_result7_inst_reset),
	.write_en (data_result7_inst_write_en),
	.read_data (data_result7_inst_read_data),
	.write_data (data_result7_inst_write_data)
);

defparam
	data_result7_inst.width = 32,
	data_result7_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_base_addr_inst (
	.clk (data_base_addr_inst_clk),
	.reset (data_base_addr_inst_reset),
	.write_en (data_base_addr_inst_write_en),
	.read_data (data_base_addr_inst_read_data),
	.write_data (data_base_addr_inst_write_data)
);

defparam
	data_base_addr_inst.width = 32,
	data_base_addr_inst.init_value = 32'd0;


wide_mult_axi_hls_register data_error_inst (
	.clk (data_error_inst_clk),
	.reset (data_error_inst_reset),
	.write_en (data_error_inst_write_en),
	.read_data (data_error_inst_read_data),
	.write_data (data_error_inst_write_data)
);

defparam
	data_error_inst.width = 32,
	data_error_inst.init_value = 32'd0;


wide_mult wide_mult_inst (
	.clk (wide_mult_inst_clk),
	.reset (wide_mult_inst_reset),
	.start (wide_mult_inst_start),
	.ready (wide_mult_inst_ready),
	.finish (wide_mult_inst_finish),
	.agg_result (wide_mult_inst_agg_result),
	.A_val (wide_mult_inst_A_val),
	.B_val (wide_mult_inst_B_val),
	.C_val (wide_mult_inst_C_val),
	.D_val (wide_mult_inst_D_val),
	.E_val (wide_mult_inst_E_val),
	.memory_controller_0_clken (wide_mult_inst_memory_controller_0_clken),
	.memory_controller_0_write_en_a (wide_mult_inst_memory_controller_0_write_en_a),
	.memory_controller_0_write_data_a (wide_mult_inst_memory_controller_0_write_data_a),
	.memory_controller_0_read_en_a (wide_mult_inst_memory_controller_0_read_en_a),
	.memory_controller_0_address_a (wide_mult_inst_memory_controller_0_address_a),
	.memory_controller_0_size_a (wide_mult_inst_memory_controller_0_size_a),
	.memory_controller_0_read_data_a (wide_mult_inst_memory_controller_0_read_data_a),
	.memory_controller_0_write_en_b (wide_mult_inst_memory_controller_0_write_en_b),
	.memory_controller_0_write_data_b (wide_mult_inst_memory_controller_0_write_data_b),
	.memory_controller_0_read_en_b (wide_mult_inst_memory_controller_0_read_en_b),
	.memory_controller_0_address_b (wide_mult_inst_memory_controller_0_address_b),
	.memory_controller_0_size_b (wide_mult_inst_memory_controller_0_size_b),
	.memory_controller_0_read_data_b (wide_mult_inst_memory_controller_0_read_data_b)
);



data_read data_read_inst (
	.clk (data_read_inst_clk),
	.reset (data_read_inst_reset),
	.start (data_read_inst_start),
	.ready (data_read_inst_ready),
	.finish (data_read_inst_finish),
	.s_ar_addr (data_read_inst_s_ar_addr),
	.axi_s_ar_ready (data_read_inst_axi_s_ar_ready),
	.axi_s_ar_valid (data_read_inst_axi_s_ar_valid),
	.data_result4_write_en (data_read_inst_data_result4_write_en),
	.data_result4_write_data (data_read_inst_data_result4_write_data),
	.data_result4_read_data (data_read_inst_data_result4_read_data),
	.data_result3_write_en (data_read_inst_data_result3_write_en),
	.data_result3_write_data (data_read_inst_data_result3_write_data),
	.data_result3_read_data (data_read_inst_data_result3_read_data),
	.data_result6_write_en (data_read_inst_data_result6_write_en),
	.data_result6_write_data (data_read_inst_data_result6_write_data),
	.data_result6_read_data (data_read_inst_data_result6_read_data),
	.data_result5_write_en (data_read_inst_data_result5_write_en),
	.data_result5_write_data (data_read_inst_data_result5_write_data),
	.data_result5_read_data (data_read_inst_data_result5_read_data),
	.data_A0_write_en (data_read_inst_data_A0_write_en),
	.data_A0_write_data (data_read_inst_data_A0_write_data),
	.data_A0_read_data (data_read_inst_data_A0_read_data),
	.data_result7_write_en (data_read_inst_data_result7_write_en),
	.data_result7_write_data (data_read_inst_data_result7_write_data),
	.data_result7_read_data (data_read_inst_data_result7_read_data),
	.data_A2_write_en (data_read_inst_data_A2_write_en),
	.data_A2_write_data (data_read_inst_data_A2_write_data),
	.data_A2_read_data (data_read_inst_data_A2_read_data),
	.data_A1_write_en (data_read_inst_data_A1_write_en),
	.data_A1_write_data (data_read_inst_data_A1_write_data),
	.data_A1_read_data (data_read_inst_data_A1_read_data),
	.data_B0_write_en (data_read_inst_data_B0_write_en),
	.data_B0_write_data (data_read_inst_data_B0_write_data),
	.data_B0_read_data (data_read_inst_data_B0_read_data),
	.data_A3_write_en (data_read_inst_data_A3_write_en),
	.data_A3_write_data (data_read_inst_data_A3_write_data),
	.data_A3_read_data (data_read_inst_data_A3_read_data),
	.data_C0_write_en (data_read_inst_data_C0_write_en),
	.data_C0_write_data (data_read_inst_data_C0_write_data),
	.data_C0_read_data (data_read_inst_data_C0_read_data),
	.data_B1_write_en (data_read_inst_data_B1_write_en),
	.data_B1_write_data (data_read_inst_data_B1_write_data),
	.data_B1_read_data (data_read_inst_data_B1_read_data),
	.data_D0_write_en (data_read_inst_data_D0_write_en),
	.data_D0_write_data (data_read_inst_data_D0_write_data),
	.data_D0_read_data (data_read_inst_data_D0_read_data),
	.data_C1_write_en (data_read_inst_data_C1_write_en),
	.data_C1_write_data (data_read_inst_data_C1_write_data),
	.data_C1_read_data (data_read_inst_data_C1_read_data),
	.data_D2_write_en (data_read_inst_data_D2_write_en),
	.data_D2_write_data (data_read_inst_data_D2_write_data),
	.data_D2_read_data (data_read_inst_data_D2_read_data),
	.data_D1_write_en (data_read_inst_data_D1_write_en),
	.data_D1_write_data (data_read_inst_data_D1_write_data),
	.data_D1_read_data (data_read_inst_data_D1_read_data),
	.data_E0_write_en (data_read_inst_data_E0_write_en),
	.data_E0_write_data (data_read_inst_data_E0_write_data),
	.data_E0_read_data (data_read_inst_data_E0_read_data),
	.data_D3_write_en (data_read_inst_data_D3_write_en),
	.data_D3_write_data (data_read_inst_data_D3_write_data),
	.data_D3_read_data (data_read_inst_data_D3_read_data),
	.data_E2_write_en (data_read_inst_data_E2_write_en),
	.data_E2_write_data (data_read_inst_data_E2_write_data),
	.data_E2_read_data (data_read_inst_data_E2_read_data),
	.data_E1_write_en (data_read_inst_data_E1_write_en),
	.data_E1_write_data (data_read_inst_data_E1_write_data),
	.data_E1_read_data (data_read_inst_data_E1_read_data),
	.data_E3_write_en (data_read_inst_data_E3_write_en),
	.data_E3_write_data (data_read_inst_data_E3_write_data),
	.data_E3_read_data (data_read_inst_data_E3_read_data),
	.data_ctrl_write_en (data_read_inst_data_ctrl_write_en),
	.data_ctrl_write_data (data_read_inst_data_ctrl_write_data),
	.data_ctrl_read_data (data_read_inst_data_ctrl_read_data),
	.s_ar_burst (data_read_inst_s_ar_burst),
	.s_ar_size (data_read_inst_s_ar_size),
	.s_ar_len (data_read_inst_s_ar_len),
	.data_base_addr_write_en (data_read_inst_data_base_addr_write_en),
	.data_base_addr_write_data (data_read_inst_data_base_addr_write_data),
	.data_base_addr_read_data (data_read_inst_data_base_addr_read_data),
	.data_run_write_en (data_read_inst_data_run_write_en),
	.data_run_write_data (data_read_inst_data_run_write_data),
	.data_run_read_data (data_read_inst_data_run_read_data),
	.data_result0_write_en (data_read_inst_data_result0_write_en),
	.data_result0_write_data (data_read_inst_data_result0_write_data),
	.data_result0_read_data (data_read_inst_data_result0_read_data),
	.data_error_write_en (data_read_inst_data_error_write_en),
	.data_error_write_data (data_read_inst_data_error_write_data),
	.data_error_read_data (data_read_inst_data_error_read_data),
	.data_result2_write_en (data_read_inst_data_result2_write_en),
	.data_result2_write_data (data_read_inst_data_result2_write_data),
	.data_result2_read_data (data_read_inst_data_result2_read_data),
	.data_result1_write_en (data_read_inst_data_result1_write_en),
	.data_result1_write_data (data_read_inst_data_result1_write_data),
	.data_result1_read_data (data_read_inst_data_result1_read_data),
	.s_r_data (data_read_inst_s_r_data),
	.axi_s_r_ready (data_read_inst_axi_s_r_ready),
	.axi_s_r_valid (data_read_inst_axi_s_r_valid),
	.s_r_resp (data_read_inst_s_r_resp),
	.s_r_last (data_read_inst_s_r_last)
);



wide_mult_axi_hls_register data_ctrl_inst (
	.clk (data_ctrl_inst_clk),
	.reset (data_ctrl_inst_reset),
	.write_en (data_ctrl_inst_write_en),
	.read_data (data_ctrl_inst_read_data),
	.write_data (data_ctrl_inst_write_data)
);

defparam
	data_ctrl_inst.width = 1,
	data_ctrl_inst.init_value = 1'd0;


data_write data_write_inst (
	.clk (data_write_inst_clk),
	.reset (data_write_inst_reset),
	.start (data_write_inst_start),
	.ready (data_write_inst_ready),
	.finish (data_write_inst_finish),
	.s_aw_addr (data_write_inst_s_aw_addr),
	.axi_s_aw_ready (data_write_inst_axi_s_aw_ready),
	.axi_s_aw_valid (data_write_inst_axi_s_aw_valid),
	.s_w_data (data_write_inst_s_w_data),
	.axi_s_w_ready (data_write_inst_axi_s_w_ready),
	.axi_s_w_valid (data_write_inst_axi_s_w_valid),
	.s_aw_burst (data_write_inst_s_aw_burst),
	.s_aw_size (data_write_inst_s_aw_size),
	.s_aw_len (data_write_inst_s_aw_len),
	.s_w_strb (data_write_inst_s_w_strb),
	.s_w_last (data_write_inst_s_w_last),
	.data_ctrl_write_en (data_write_inst_data_ctrl_write_en),
	.data_ctrl_write_data (data_write_inst_data_ctrl_write_data),
	.data_ctrl_read_data (data_write_inst_data_ctrl_read_data),
	.data_run_write_en (data_write_inst_data_run_write_en),
	.data_run_write_data (data_write_inst_data_run_write_data),
	.data_run_read_data (data_write_inst_data_run_read_data),
	.data_error_write_en (data_write_inst_data_error_write_en),
	.data_error_write_data (data_write_inst_data_error_write_data),
	.data_error_read_data (data_write_inst_data_error_read_data),
	.data_result1_write_en (data_write_inst_data_result1_write_en),
	.data_result1_write_data (data_write_inst_data_result1_write_data),
	.data_result1_read_data (data_write_inst_data_result1_read_data),
	.data_result3_write_en (data_write_inst_data_result3_write_en),
	.data_result3_write_data (data_write_inst_data_result3_write_data),
	.data_result3_read_data (data_write_inst_data_result3_read_data),
	.data_result5_write_en (data_write_inst_data_result5_write_en),
	.data_result5_write_data (data_write_inst_data_result5_write_data),
	.data_result5_read_data (data_write_inst_data_result5_read_data),
	.data_result7_write_en (data_write_inst_data_result7_write_en),
	.data_result7_write_data (data_write_inst_data_result7_write_data),
	.data_result7_read_data (data_write_inst_data_result7_read_data),
	.data_A1_write_en (data_write_inst_data_A1_write_en),
	.data_A1_write_data (data_write_inst_data_A1_write_data),
	.data_A1_read_data (data_write_inst_data_A1_read_data),
	.data_A3_write_en (data_write_inst_data_A3_write_en),
	.data_A3_write_data (data_write_inst_data_A3_write_data),
	.data_A3_read_data (data_write_inst_data_A3_read_data),
	.data_B1_write_en (data_write_inst_data_B1_write_en),
	.data_B1_write_data (data_write_inst_data_B1_write_data),
	.data_B1_read_data (data_write_inst_data_B1_read_data),
	.data_C1_write_en (data_write_inst_data_C1_write_en),
	.data_C1_write_data (data_write_inst_data_C1_write_data),
	.data_C1_read_data (data_write_inst_data_C1_read_data),
	.data_D1_write_en (data_write_inst_data_D1_write_en),
	.data_D1_write_data (data_write_inst_data_D1_write_data),
	.data_D1_read_data (data_write_inst_data_D1_read_data),
	.data_D3_write_en (data_write_inst_data_D3_write_en),
	.data_D3_write_data (data_write_inst_data_D3_write_data),
	.data_D3_read_data (data_write_inst_data_D3_read_data),
	.data_E1_write_en (data_write_inst_data_E1_write_en),
	.data_E1_write_data (data_write_inst_data_E1_write_data),
	.data_E1_read_data (data_write_inst_data_E1_read_data),
	.data_E3_write_en (data_write_inst_data_E3_write_en),
	.data_E3_write_data (data_write_inst_data_E3_write_data),
	.data_E3_read_data (data_write_inst_data_E3_read_data),
	.data_base_addr_write_en (data_write_inst_data_base_addr_write_en),
	.data_base_addr_write_data (data_write_inst_data_base_addr_write_data),
	.data_base_addr_read_data (data_write_inst_data_base_addr_read_data),
	.data_result0_write_en (data_write_inst_data_result0_write_en),
	.data_result0_write_data (data_write_inst_data_result0_write_data),
	.data_result0_read_data (data_write_inst_data_result0_read_data),
	.data_result2_write_en (data_write_inst_data_result2_write_en),
	.data_result2_write_data (data_write_inst_data_result2_write_data),
	.data_result2_read_data (data_write_inst_data_result2_read_data),
	.data_result4_write_en (data_write_inst_data_result4_write_en),
	.data_result4_write_data (data_write_inst_data_result4_write_data),
	.data_result4_read_data (data_write_inst_data_result4_read_data),
	.data_result6_write_en (data_write_inst_data_result6_write_en),
	.data_result6_write_data (data_write_inst_data_result6_write_data),
	.data_result6_read_data (data_write_inst_data_result6_read_data),
	.data_A0_write_en (data_write_inst_data_A0_write_en),
	.data_A0_write_data (data_write_inst_data_A0_write_data),
	.data_A0_read_data (data_write_inst_data_A0_read_data),
	.data_A2_write_en (data_write_inst_data_A2_write_en),
	.data_A2_write_data (data_write_inst_data_A2_write_data),
	.data_A2_read_data (data_write_inst_data_A2_read_data),
	.data_B0_write_en (data_write_inst_data_B0_write_en),
	.data_B0_write_data (data_write_inst_data_B0_write_data),
	.data_B0_read_data (data_write_inst_data_B0_read_data),
	.data_C0_write_en (data_write_inst_data_C0_write_en),
	.data_C0_write_data (data_write_inst_data_C0_write_data),
	.data_C0_read_data (data_write_inst_data_C0_read_data),
	.data_D0_write_en (data_write_inst_data_D0_write_en),
	.data_D0_write_data (data_write_inst_data_D0_write_data),
	.data_D0_read_data (data_write_inst_data_D0_read_data),
	.data_D2_write_en (data_write_inst_data_D2_write_en),
	.data_D2_write_data (data_write_inst_data_D2_write_data),
	.data_D2_read_data (data_write_inst_data_D2_read_data),
	.data_E0_write_en (data_write_inst_data_E0_write_en),
	.data_E0_write_data (data_write_inst_data_E0_write_data),
	.data_E0_read_data (data_write_inst_data_E0_read_data),
	.data_E2_write_en (data_write_inst_data_E2_write_en),
	.data_E2_write_data (data_write_inst_data_E2_write_data),
	.data_E2_read_data (data_write_inst_data_E2_read_data),
	.s_b_resp (data_write_inst_s_b_resp),
	.s_b_resp_ready (data_write_inst_s_b_resp_ready),
	.s_b_resp_valid (data_write_inst_s_b_resp_valid)
);



always @(*) begin
	wide_mult_axi_inst_clk = clk;
end
always @(*) begin
	wide_mult_axi_inst_reset = reset;
end
always @(*) begin
	wide_mult_axi_inst_start = start;
end
always @(*) begin
	wide_mult_axi_inst_wide_mult_axi_orig_finish = (~(wide_mult_axi_orig_inst_start) & wide_mult_axi_orig_inst_finish_reg);
end
always @(*) begin
	wide_mult_axi_inst_wide_mult_axi_orig_ready = wide_mult_axi_orig_inst_ready;
end
always @(*) begin
	wide_mult_axi_inst_data_read_finish = data_read_inst_finish;
end
always @(*) begin
	wide_mult_axi_inst_data_read_ready = data_read_inst_ready;
end
always @(*) begin
	wide_mult_axi_inst_data_write_finish = data_write_inst_finish;
end
always @(*) begin
	wide_mult_axi_inst_data_write_ready = data_write_inst_ready;
end
always @(posedge clk) begin
	if ((reset | wide_mult_axi_inst_start)) begin
		wide_mult_axi_inst_finish_reg <= 1'd0;
	end
	if (wide_mult_axi_inst_finish) begin
		wide_mult_axi_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	wide_mult_axi_orig_inst_clk = clk;
end
always @(*) begin
	wide_mult_axi_orig_inst_reset = reset;
end
always @(*) begin
	wide_mult_axi_orig_inst_start = (start | data_write_inst_data_ctrl_write_en);
end
always @(*) begin
	wide_mult_axi_orig_inst_wide_mult_finish = (~(wide_mult_inst_start) & wide_mult_inst_finish_reg);
end
always @(*) begin
	wide_mult_axi_orig_inst_data_run_read_data = data_run_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_A0_read_data = data_A0_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_A1_read_data = data_A1_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_A2_read_data = data_A2_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_A3_read_data = data_A3_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_B0_read_data = data_B0_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_B1_read_data = data_B1_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_C0_read_data = data_C0_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_C1_read_data = data_C1_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_D0_read_data = data_D0_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_D1_read_data = data_D1_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_D2_read_data = data_D2_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_D3_read_data = data_D3_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_E0_read_data = data_E0_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_E1_read_data = data_E1_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_E2_read_data = data_E2_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_E3_read_data = data_E3_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_memory_controller_0_read_data_a = memory_controller_0_inst_memory_controller_read_data_reg_a;
end
always @(*) begin
	wide_mult_axi_orig_inst_memory_controller_0_read_data_b = memory_controller_0_inst_memory_controller_read_data_reg_b;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result0_read_data = data_result0_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result1_read_data = data_result1_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result2_read_data = data_result2_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result3_read_data = data_result3_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result4_read_data = data_result4_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result5_read_data = data_result5_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result6_read_data = data_result6_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_result7_read_data = data_result7_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_base_addr_read_data = data_base_addr_inst_read_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_ar_ready = initiator_ar_ready;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_r_data = initiator_r_data;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_r_valid = initiator_r_valid;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_r_resp = initiator_r_resp;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_r_last = initiator_r_last;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_aw_ready = initiator_aw_ready;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_w_ready = initiator_w_ready;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_b_resp = initiator_b_resp;
end
always @(*) begin
	wide_mult_axi_orig_inst_initiator_b_resp_valid = initiator_b_resp_valid;
end
always @(*) begin
	wide_mult_axi_orig_inst_data_error_read_data = data_error_inst_read_data;
end
always @(posedge clk) begin
	if ((reset | wide_mult_axi_orig_inst_start)) begin
		wide_mult_axi_orig_inst_finish_reg <= 1'd0;
	end
	if (wide_mult_axi_orig_inst_finish) begin
		wide_mult_axi_orig_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	data_run_inst_clk = clk;
end
always @(*) begin
	data_run_inst_reset = reset;
end
always @(*) begin
	data_run_inst_write_en = ((wide_mult_axi_orig_inst_data_run_write_en | data_read_inst_data_run_write_en) | data_write_inst_data_run_write_en);
end
always @(*) begin
	data_run_inst_write_data = ((wide_mult_axi_orig_inst_data_run_write_data | data_read_inst_data_run_write_data) | data_write_inst_data_run_write_data);
end
always @(*) begin
	data_A0_inst_clk = clk;
end
always @(*) begin
	data_A0_inst_reset = reset;
end
always @(*) begin
	data_A0_inst_write_en = ((wide_mult_axi_orig_inst_data_A0_write_en | data_read_inst_data_A0_write_en) | data_write_inst_data_A0_write_en);
end
always @(*) begin
	data_A0_inst_write_data = ((wide_mult_axi_orig_inst_data_A0_write_data | data_read_inst_data_A0_write_data) | data_write_inst_data_A0_write_data);
end
always @(*) begin
	data_A1_inst_clk = clk;
end
always @(*) begin
	data_A1_inst_reset = reset;
end
always @(*) begin
	data_A1_inst_write_en = ((wide_mult_axi_orig_inst_data_A1_write_en | data_read_inst_data_A1_write_en) | data_write_inst_data_A1_write_en);
end
always @(*) begin
	data_A1_inst_write_data = ((wide_mult_axi_orig_inst_data_A1_write_data | data_read_inst_data_A1_write_data) | data_write_inst_data_A1_write_data);
end
always @(*) begin
	data_A2_inst_clk = clk;
end
always @(*) begin
	data_A2_inst_reset = reset;
end
always @(*) begin
	data_A2_inst_write_en = ((wide_mult_axi_orig_inst_data_A2_write_en | data_read_inst_data_A2_write_en) | data_write_inst_data_A2_write_en);
end
always @(*) begin
	data_A2_inst_write_data = ((wide_mult_axi_orig_inst_data_A2_write_data | data_read_inst_data_A2_write_data) | data_write_inst_data_A2_write_data);
end
always @(*) begin
	data_A3_inst_clk = clk;
end
always @(*) begin
	data_A3_inst_reset = reset;
end
always @(*) begin
	data_A3_inst_write_en = ((wide_mult_axi_orig_inst_data_A3_write_en | data_read_inst_data_A3_write_en) | data_write_inst_data_A3_write_en);
end
always @(*) begin
	data_A3_inst_write_data = ((wide_mult_axi_orig_inst_data_A3_write_data | data_read_inst_data_A3_write_data) | data_write_inst_data_A3_write_data);
end
always @(*) begin
	data_B0_inst_clk = clk;
end
always @(*) begin
	data_B0_inst_reset = reset;
end
always @(*) begin
	data_B0_inst_write_en = ((wide_mult_axi_orig_inst_data_B0_write_en | data_read_inst_data_B0_write_en) | data_write_inst_data_B0_write_en);
end
always @(*) begin
	data_B0_inst_write_data = ((wide_mult_axi_orig_inst_data_B0_write_data | data_read_inst_data_B0_write_data) | data_write_inst_data_B0_write_data);
end
always @(*) begin
	data_B1_inst_clk = clk;
end
always @(*) begin
	data_B1_inst_reset = reset;
end
always @(*) begin
	data_B1_inst_write_en = ((wide_mult_axi_orig_inst_data_B1_write_en | data_read_inst_data_B1_write_en) | data_write_inst_data_B1_write_en);
end
always @(*) begin
	data_B1_inst_write_data = ((wide_mult_axi_orig_inst_data_B1_write_data | data_read_inst_data_B1_write_data) | data_write_inst_data_B1_write_data);
end
always @(*) begin
	data_C0_inst_clk = clk;
end
always @(*) begin
	data_C0_inst_reset = reset;
end
always @(*) begin
	data_C0_inst_write_en = ((wide_mult_axi_orig_inst_data_C0_write_en | data_read_inst_data_C0_write_en) | data_write_inst_data_C0_write_en);
end
always @(*) begin
	data_C0_inst_write_data = ((wide_mult_axi_orig_inst_data_C0_write_data | data_read_inst_data_C0_write_data) | data_write_inst_data_C0_write_data);
end
always @(*) begin
	data_C1_inst_clk = clk;
end
always @(*) begin
	data_C1_inst_reset = reset;
end
always @(*) begin
	data_C1_inst_write_en = ((wide_mult_axi_orig_inst_data_C1_write_en | data_read_inst_data_C1_write_en) | data_write_inst_data_C1_write_en);
end
always @(*) begin
	data_C1_inst_write_data = ((wide_mult_axi_orig_inst_data_C1_write_data | data_read_inst_data_C1_write_data) | data_write_inst_data_C1_write_data);
end
always @(*) begin
	data_D0_inst_clk = clk;
end
always @(*) begin
	data_D0_inst_reset = reset;
end
always @(*) begin
	data_D0_inst_write_en = ((wide_mult_axi_orig_inst_data_D0_write_en | data_read_inst_data_D0_write_en) | data_write_inst_data_D0_write_en);
end
always @(*) begin
	data_D0_inst_write_data = ((wide_mult_axi_orig_inst_data_D0_write_data | data_read_inst_data_D0_write_data) | data_write_inst_data_D0_write_data);
end
always @(*) begin
	data_D1_inst_clk = clk;
end
always @(*) begin
	data_D1_inst_reset = reset;
end
always @(*) begin
	data_D1_inst_write_en = ((wide_mult_axi_orig_inst_data_D1_write_en | data_read_inst_data_D1_write_en) | data_write_inst_data_D1_write_en);
end
always @(*) begin
	data_D1_inst_write_data = ((wide_mult_axi_orig_inst_data_D1_write_data | data_read_inst_data_D1_write_data) | data_write_inst_data_D1_write_data);
end
always @(*) begin
	data_D2_inst_clk = clk;
end
always @(*) begin
	data_D2_inst_reset = reset;
end
always @(*) begin
	data_D2_inst_write_en = ((wide_mult_axi_orig_inst_data_D2_write_en | data_read_inst_data_D2_write_en) | data_write_inst_data_D2_write_en);
end
always @(*) begin
	data_D2_inst_write_data = ((wide_mult_axi_orig_inst_data_D2_write_data | data_read_inst_data_D2_write_data) | data_write_inst_data_D2_write_data);
end
always @(*) begin
	data_D3_inst_clk = clk;
end
always @(*) begin
	data_D3_inst_reset = reset;
end
always @(*) begin
	data_D3_inst_write_en = ((wide_mult_axi_orig_inst_data_D3_write_en | data_read_inst_data_D3_write_en) | data_write_inst_data_D3_write_en);
end
always @(*) begin
	data_D3_inst_write_data = ((wide_mult_axi_orig_inst_data_D3_write_data | data_read_inst_data_D3_write_data) | data_write_inst_data_D3_write_data);
end
always @(*) begin
	data_E0_inst_clk = clk;
end
always @(*) begin
	data_E0_inst_reset = reset;
end
always @(*) begin
	data_E0_inst_write_en = ((wide_mult_axi_orig_inst_data_E0_write_en | data_read_inst_data_E0_write_en) | data_write_inst_data_E0_write_en);
end
always @(*) begin
	data_E0_inst_write_data = ((wide_mult_axi_orig_inst_data_E0_write_data | data_read_inst_data_E0_write_data) | data_write_inst_data_E0_write_data);
end
always @(*) begin
	data_E1_inst_clk = clk;
end
always @(*) begin
	data_E1_inst_reset = reset;
end
always @(*) begin
	data_E1_inst_write_en = ((wide_mult_axi_orig_inst_data_E1_write_en | data_read_inst_data_E1_write_en) | data_write_inst_data_E1_write_en);
end
always @(*) begin
	data_E1_inst_write_data = ((wide_mult_axi_orig_inst_data_E1_write_data | data_read_inst_data_E1_write_data) | data_write_inst_data_E1_write_data);
end
always @(*) begin
	data_E2_inst_clk = clk;
end
always @(*) begin
	data_E2_inst_reset = reset;
end
always @(*) begin
	data_E2_inst_write_en = ((wide_mult_axi_orig_inst_data_E2_write_en | data_read_inst_data_E2_write_en) | data_write_inst_data_E2_write_en);
end
always @(*) begin
	data_E2_inst_write_data = ((wide_mult_axi_orig_inst_data_E2_write_data | data_read_inst_data_E2_write_data) | data_write_inst_data_E2_write_data);
end
always @(*) begin
	data_E3_inst_clk = clk;
end
always @(*) begin
	data_E3_inst_reset = reset;
end
always @(*) begin
	data_E3_inst_write_en = ((wide_mult_axi_orig_inst_data_E3_write_en | data_read_inst_data_E3_write_en) | data_write_inst_data_E3_write_en);
end
always @(*) begin
	data_E3_inst_write_data = ((wide_mult_axi_orig_inst_data_E3_write_data | data_read_inst_data_E3_write_data) | data_write_inst_data_E3_write_data);
end
always @(*) begin
	memory_controller_0_inst_clk = clk;
end
always @(*) begin
	memory_controller_0_inst_reset = reset;
end
always @(*) begin
	memory_controller_0_inst_memory_controller_clken = (wide_mult_axi_orig_inst_memory_controller_0_clken | wide_mult_inst_memory_controller_0_clken);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_address_a = (wide_mult_axi_orig_inst_memory_controller_0_address_a | wide_mult_inst_memory_controller_0_address_a);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_read_en_a = (wide_mult_axi_orig_inst_memory_controller_0_read_en_a | wide_mult_inst_memory_controller_0_read_en_a);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_size_a = (wide_mult_axi_orig_inst_memory_controller_0_size_a | wide_mult_inst_memory_controller_0_size_a);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_write_en_a = (wide_mult_axi_orig_inst_memory_controller_0_write_en_a | wide_mult_inst_memory_controller_0_write_en_a);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_write_data_a = (wide_mult_axi_orig_inst_memory_controller_0_write_data_a | wide_mult_inst_memory_controller_0_write_data_a);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_address_b = (wide_mult_axi_orig_inst_memory_controller_0_address_b | wide_mult_inst_memory_controller_0_address_b);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_read_en_b = (wide_mult_axi_orig_inst_memory_controller_0_read_en_b | wide_mult_inst_memory_controller_0_read_en_b);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_size_b = (wide_mult_axi_orig_inst_memory_controller_0_size_b | wide_mult_inst_memory_controller_0_size_b);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_write_en_b = (wide_mult_axi_orig_inst_memory_controller_0_write_en_b | wide_mult_inst_memory_controller_0_write_en_b);
end
always @(*) begin
	memory_controller_0_inst_memory_controller_write_data_b = (wide_mult_axi_orig_inst_memory_controller_0_write_data_b | wide_mult_inst_memory_controller_0_write_data_b);
end
always @(*) begin
	data_result0_inst_clk = clk;
end
always @(*) begin
	data_result0_inst_reset = reset;
end
always @(*) begin
	data_result0_inst_write_en = ((wide_mult_axi_orig_inst_data_result0_write_en | data_read_inst_data_result0_write_en) | data_write_inst_data_result0_write_en);
end
always @(*) begin
	data_result0_inst_write_data = ((wide_mult_axi_orig_inst_data_result0_write_data | data_read_inst_data_result0_write_data) | data_write_inst_data_result0_write_data);
end
always @(*) begin
	data_result1_inst_clk = clk;
end
always @(*) begin
	data_result1_inst_reset = reset;
end
always @(*) begin
	data_result1_inst_write_en = ((wide_mult_axi_orig_inst_data_result1_write_en | data_read_inst_data_result1_write_en) | data_write_inst_data_result1_write_en);
end
always @(*) begin
	data_result1_inst_write_data = ((wide_mult_axi_orig_inst_data_result1_write_data | data_read_inst_data_result1_write_data) | data_write_inst_data_result1_write_data);
end
always @(*) begin
	data_result2_inst_clk = clk;
end
always @(*) begin
	data_result2_inst_reset = reset;
end
always @(*) begin
	data_result2_inst_write_en = ((wide_mult_axi_orig_inst_data_result2_write_en | data_read_inst_data_result2_write_en) | data_write_inst_data_result2_write_en);
end
always @(*) begin
	data_result2_inst_write_data = ((wide_mult_axi_orig_inst_data_result2_write_data | data_read_inst_data_result2_write_data) | data_write_inst_data_result2_write_data);
end
always @(*) begin
	data_result3_inst_clk = clk;
end
always @(*) begin
	data_result3_inst_reset = reset;
end
always @(*) begin
	data_result3_inst_write_en = ((wide_mult_axi_orig_inst_data_result3_write_en | data_read_inst_data_result3_write_en) | data_write_inst_data_result3_write_en);
end
always @(*) begin
	data_result3_inst_write_data = ((wide_mult_axi_orig_inst_data_result3_write_data | data_read_inst_data_result3_write_data) | data_write_inst_data_result3_write_data);
end
always @(*) begin
	data_result4_inst_clk = clk;
end
always @(*) begin
	data_result4_inst_reset = reset;
end
always @(*) begin
	data_result4_inst_write_en = ((wide_mult_axi_orig_inst_data_result4_write_en | data_read_inst_data_result4_write_en) | data_write_inst_data_result4_write_en);
end
always @(*) begin
	data_result4_inst_write_data = ((wide_mult_axi_orig_inst_data_result4_write_data | data_read_inst_data_result4_write_data) | data_write_inst_data_result4_write_data);
end
always @(*) begin
	data_result5_inst_clk = clk;
end
always @(*) begin
	data_result5_inst_reset = reset;
end
always @(*) begin
	data_result5_inst_write_en = ((wide_mult_axi_orig_inst_data_result5_write_en | data_read_inst_data_result5_write_en) | data_write_inst_data_result5_write_en);
end
always @(*) begin
	data_result5_inst_write_data = ((wide_mult_axi_orig_inst_data_result5_write_data | data_read_inst_data_result5_write_data) | data_write_inst_data_result5_write_data);
end
always @(*) begin
	data_result6_inst_clk = clk;
end
always @(*) begin
	data_result6_inst_reset = reset;
end
always @(*) begin
	data_result6_inst_write_en = ((wide_mult_axi_orig_inst_data_result6_write_en | data_read_inst_data_result6_write_en) | data_write_inst_data_result6_write_en);
end
always @(*) begin
	data_result6_inst_write_data = ((wide_mult_axi_orig_inst_data_result6_write_data | data_read_inst_data_result6_write_data) | data_write_inst_data_result6_write_data);
end
always @(*) begin
	data_result7_inst_clk = clk;
end
always @(*) begin
	data_result7_inst_reset = reset;
end
always @(*) begin
	data_result7_inst_write_en = ((wide_mult_axi_orig_inst_data_result7_write_en | data_read_inst_data_result7_write_en) | data_write_inst_data_result7_write_en);
end
always @(*) begin
	data_result7_inst_write_data = ((wide_mult_axi_orig_inst_data_result7_write_data | data_read_inst_data_result7_write_data) | data_write_inst_data_result7_write_data);
end
always @(*) begin
	data_base_addr_inst_clk = clk;
end
always @(*) begin
	data_base_addr_inst_reset = reset;
end
always @(*) begin
	data_base_addr_inst_write_en = ((wide_mult_axi_orig_inst_data_base_addr_write_en | data_read_inst_data_base_addr_write_en) | data_write_inst_data_base_addr_write_en);
end
always @(*) begin
	data_base_addr_inst_write_data = ((wide_mult_axi_orig_inst_data_base_addr_write_data | data_read_inst_data_base_addr_write_data) | data_write_inst_data_base_addr_write_data);
end
always @(*) begin
	data_error_inst_clk = clk;
end
always @(*) begin
	data_error_inst_reset = reset;
end
always @(*) begin
	data_error_inst_write_en = ((wide_mult_axi_orig_inst_data_error_write_en | data_read_inst_data_error_write_en) | data_write_inst_data_error_write_en);
end
always @(*) begin
	data_error_inst_write_data = ((wide_mult_axi_orig_inst_data_error_write_data | data_read_inst_data_error_write_data) | data_write_inst_data_error_write_data);
end
always @(*) begin
	wide_mult_inst_clk = clk;
end
always @(*) begin
	wide_mult_inst_reset = reset;
end
always @(*) begin
	wide_mult_inst_start = wide_mult_axi_orig_inst_wide_mult_start;
end
always @(*) begin
	wide_mult_inst_agg_result = wide_mult_axi_orig_inst_wide_mult_agg_result;
end
always @(*) begin
	wide_mult_inst_A_val = wide_mult_axi_orig_inst_wide_mult_A_val;
end
always @(*) begin
	wide_mult_inst_B_val = wide_mult_axi_orig_inst_wide_mult_B_val;
end
always @(*) begin
	wide_mult_inst_C_val = wide_mult_axi_orig_inst_wide_mult_C_val;
end
always @(*) begin
	wide_mult_inst_D_val = wide_mult_axi_orig_inst_wide_mult_D_val;
end
always @(*) begin
	wide_mult_inst_E_val = wide_mult_axi_orig_inst_wide_mult_E_val;
end
always @(*) begin
	wide_mult_inst_memory_controller_0_read_data_a = memory_controller_0_inst_memory_controller_read_data_reg_a;
end
always @(*) begin
	wide_mult_inst_memory_controller_0_read_data_b = memory_controller_0_inst_memory_controller_read_data_reg_b;
end
always @(posedge clk) begin
	if ((reset | wide_mult_inst_start)) begin
		wide_mult_inst_finish_reg <= 1'd0;
	end
	if (wide_mult_inst_finish) begin
		wide_mult_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	data_read_inst_clk = clk;
end
always @(*) begin
	data_read_inst_reset = reset;
end
always @(*) begin
	data_read_inst_start = wide_mult_axi_inst_data_read_start;
end
always @(*) begin
	data_read_inst_s_ar_addr = axi_s_ar_addr;
end
always @(*) begin
	data_read_inst_axi_s_ar_valid = axi_s_ar_valid;
end
always @(*) begin
	data_read_inst_data_result4_read_data = data_result4_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result3_read_data = data_result3_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result6_read_data = data_result6_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result5_read_data = data_result5_inst_read_data;
end
always @(*) begin
	data_read_inst_data_A0_read_data = data_A0_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result7_read_data = data_result7_inst_read_data;
end
always @(*) begin
	data_read_inst_data_A2_read_data = data_A2_inst_read_data;
end
always @(*) begin
	data_read_inst_data_A1_read_data = data_A1_inst_read_data;
end
always @(*) begin
	data_read_inst_data_B0_read_data = data_B0_inst_read_data;
end
always @(*) begin
	data_read_inst_data_A3_read_data = data_A3_inst_read_data;
end
always @(*) begin
	data_read_inst_data_C0_read_data = data_C0_inst_read_data;
end
always @(*) begin
	data_read_inst_data_B1_read_data = data_B1_inst_read_data;
end
always @(*) begin
	data_read_inst_data_D0_read_data = data_D0_inst_read_data;
end
always @(*) begin
	data_read_inst_data_C1_read_data = data_C1_inst_read_data;
end
always @(*) begin
	data_read_inst_data_D2_read_data = data_D2_inst_read_data;
end
always @(*) begin
	data_read_inst_data_D1_read_data = data_D1_inst_read_data;
end
always @(*) begin
	data_read_inst_data_E0_read_data = data_E0_inst_read_data;
end
always @(*) begin
	data_read_inst_data_D3_read_data = data_D3_inst_read_data;
end
always @(*) begin
	data_read_inst_data_E2_read_data = data_E2_inst_read_data;
end
always @(*) begin
	data_read_inst_data_E1_read_data = data_E1_inst_read_data;
end
always @(*) begin
	data_read_inst_data_E3_read_data = data_E3_inst_read_data;
end
always @(*) begin
	data_read_inst_data_ctrl_read_data = data_ctrl_inst_read_data;
end
always @(*) begin
	data_read_inst_s_ar_burst = axi_s_ar_burst;
end
always @(*) begin
	data_read_inst_s_ar_size = axi_s_ar_size;
end
always @(*) begin
	data_read_inst_s_ar_len = axi_s_ar_len;
end
always @(*) begin
	data_read_inst_data_base_addr_read_data = data_base_addr_inst_read_data;
end
always @(*) begin
	data_read_inst_data_run_read_data = data_run_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result0_read_data = data_result0_inst_read_data;
end
always @(*) begin
	data_read_inst_data_error_read_data = data_error_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result2_read_data = data_result2_inst_read_data;
end
always @(*) begin
	data_read_inst_data_result1_read_data = data_result1_inst_read_data;
end
always @(*) begin
	data_read_inst_axi_s_r_ready = axi_s_r_ready;
end
always @(posedge clk) begin
	if ((reset | data_read_inst_start)) begin
		data_read_inst_finish_reg <= 1'd0;
	end
	if (data_read_inst_finish) begin
		data_read_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	data_ctrl_inst_clk = clk;
end
always @(*) begin
	data_ctrl_inst_reset = ((reset | data_write_inst_data_ctrl_write_en) | start);
end
always @(*) begin
	data_ctrl_inst_write_en = wide_mult_axi_orig_inst_finish;
end
assign data_ctrl_inst_write_data = 1'd1;
always @(*) begin
	data_write_inst_clk = clk;
end
always @(*) begin
	data_write_inst_reset = reset;
end
always @(*) begin
	data_write_inst_start = wide_mult_axi_inst_data_write_start;
end
always @(*) begin
	data_write_inst_s_aw_addr = axi_s_aw_addr;
end
always @(*) begin
	data_write_inst_axi_s_aw_valid = axi_s_aw_valid;
end
always @(*) begin
	data_write_inst_s_w_data = axi_s_w_data;
end
always @(*) begin
	data_write_inst_axi_s_w_valid = axi_s_w_valid;
end
always @(*) begin
	data_write_inst_s_aw_burst = axi_s_aw_burst;
end
always @(*) begin
	data_write_inst_s_aw_size = axi_s_aw_size;
end
always @(*) begin
	data_write_inst_s_aw_len = axi_s_aw_len;
end
always @(*) begin
	data_write_inst_s_w_strb = axi_s_w_strb;
end
always @(*) begin
	data_write_inst_s_w_last = axi_s_w_last;
end
always @(*) begin
	data_write_inst_data_run_read_data = data_run_inst_read_data;
end
always @(*) begin
	data_write_inst_data_error_read_data = data_error_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result1_read_data = data_result1_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result3_read_data = data_result3_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result5_read_data = data_result5_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result7_read_data = data_result7_inst_read_data;
end
always @(*) begin
	data_write_inst_data_A1_read_data = data_A1_inst_read_data;
end
always @(*) begin
	data_write_inst_data_A3_read_data = data_A3_inst_read_data;
end
always @(*) begin
	data_write_inst_data_B1_read_data = data_B1_inst_read_data;
end
always @(*) begin
	data_write_inst_data_C1_read_data = data_C1_inst_read_data;
end
always @(*) begin
	data_write_inst_data_D1_read_data = data_D1_inst_read_data;
end
always @(*) begin
	data_write_inst_data_D3_read_data = data_D3_inst_read_data;
end
always @(*) begin
	data_write_inst_data_E1_read_data = data_E1_inst_read_data;
end
always @(*) begin
	data_write_inst_data_E3_read_data = data_E3_inst_read_data;
end
always @(*) begin
	data_write_inst_data_base_addr_read_data = data_base_addr_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result0_read_data = data_result0_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result2_read_data = data_result2_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result4_read_data = data_result4_inst_read_data;
end
always @(*) begin
	data_write_inst_data_result6_read_data = data_result6_inst_read_data;
end
always @(*) begin
	data_write_inst_data_A0_read_data = data_A0_inst_read_data;
end
always @(*) begin
	data_write_inst_data_A2_read_data = data_A2_inst_read_data;
end
always @(*) begin
	data_write_inst_data_B0_read_data = data_B0_inst_read_data;
end
always @(*) begin
	data_write_inst_data_C0_read_data = data_C0_inst_read_data;
end
always @(*) begin
	data_write_inst_data_D0_read_data = data_D0_inst_read_data;
end
always @(*) begin
	data_write_inst_data_D2_read_data = data_D2_inst_read_data;
end
always @(*) begin
	data_write_inst_data_E0_read_data = data_E0_inst_read_data;
end
always @(*) begin
	data_write_inst_data_E2_read_data = data_E2_inst_read_data;
end
always @(*) begin
	data_write_inst_s_b_resp_ready = axi_s_b_resp_ready;
end
always @(posedge clk) begin
	if ((reset | data_write_inst_start)) begin
		data_write_inst_finish_reg <= 1'd0;
	end
	if (data_write_inst_finish) begin
		data_write_inst_finish_reg <= 1'd1;
	end
end
always @(*) begin
	ready = wide_mult_axi_inst_ready;
end
always @(*) begin
	finish = wide_mult_axi_inst_finish;
end
always @(*) begin
	initiator_ar_addr = wide_mult_axi_orig_inst_initiator_ar_addr;
end
always @(*) begin
	initiator_ar_valid = wide_mult_axi_orig_inst_initiator_ar_valid;
end
always @(*) begin
	initiator_ar_burst = wide_mult_axi_orig_inst_initiator_ar_burst;
end
always @(*) begin
	initiator_ar_size = wide_mult_axi_orig_inst_initiator_ar_size;
end
always @(*) begin
	initiator_ar_len = wide_mult_axi_orig_inst_initiator_ar_len;
end
always @(*) begin
	initiator_r_ready = wide_mult_axi_orig_inst_initiator_r_ready;
end
always @(*) begin
	initiator_aw_addr = wide_mult_axi_orig_inst_initiator_aw_addr;
end
always @(*) begin
	initiator_aw_valid = wide_mult_axi_orig_inst_initiator_aw_valid;
end
always @(*) begin
	initiator_aw_burst = wide_mult_axi_orig_inst_initiator_aw_burst;
end
always @(*) begin
	initiator_aw_size = wide_mult_axi_orig_inst_initiator_aw_size;
end
always @(*) begin
	initiator_aw_len = wide_mult_axi_orig_inst_initiator_aw_len;
end
always @(*) begin
	initiator_w_data = wide_mult_axi_orig_inst_initiator_w_data;
end
always @(*) begin
	initiator_w_valid = wide_mult_axi_orig_inst_initiator_w_valid;
end
always @(*) begin
	initiator_w_strb = wide_mult_axi_orig_inst_initiator_w_strb;
end
always @(*) begin
	initiator_w_last = wide_mult_axi_orig_inst_initiator_w_last;
end
always @(*) begin
	initiator_b_resp_ready = wide_mult_axi_orig_inst_initiator_b_resp_ready;
end
always @(*) begin
	axi_s_aw_ready = data_write_inst_axi_s_aw_ready;
end
always @(*) begin
	axi_s_w_ready = data_write_inst_axi_s_w_ready;
end
always @(*) begin
	axi_s_b_resp = data_write_inst_s_b_resp;
end
always @(*) begin
	axi_s_b_resp_valid = data_write_inst_s_b_resp_valid;
end
always @(*) begin
	axi_s_ar_ready = data_read_inst_axi_s_ar_ready;
end
always @(*) begin
	axi_s_r_data = data_read_inst_s_r_data;
end
always @(*) begin
	axi_s_r_valid = data_read_inst_axi_s_r_valid;
end
always @(*) begin
	axi_s_r_resp = data_read_inst_s_r_resp;
end
always @(*) begin
	axi_s_r_last = data_read_inst_s_r_last;
end

endmodule
`timescale 1 ns / 1 ns
module memory_controller_0
(
	clk,
	reset,
	memory_controller_clken,
	memory_controller_address_a,
	memory_controller_address_b,
	memory_controller_read_en_a,
	memory_controller_read_en_b,
	memory_controller_write_en_a,
	memory_controller_write_en_b,
	memory_controller_write_data_a,
	memory_controller_write_data_b,
	memory_controller_size_a,
	memory_controller_size_b,
	memory_controller_read_data_reg_a,
	memory_controller_read_data_reg_b
);

parameter latency = 1;

parameter ram_latency = latency;

integer j;

input clk;
input reset;
input memory_controller_clken;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
input memory_controller_read_en_a;
input memory_controller_write_en_a;
input  [256-1:0]  memory_controller_write_data_a;
input [1:0] memory_controller_size_a;
output reg [256-1:0] memory_controller_read_data_reg_a;
reg [256-1:0] memory_controller_read_data_prev_a;
reg [256-1:0] memory_controller_read_data_a;

reg memory_controller_read_en_reg_a[0:0];
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
input memory_controller_read_en_b;
input memory_controller_write_en_b;
input  [256-1:0]  memory_controller_write_data_b;
input [1:0] memory_controller_size_b;
output reg [256-1:0] memory_controller_read_data_reg_b;
reg [256-1:0] memory_controller_read_data_prev_b;
reg [256-1:0] memory_controller_read_data_b;

reg memory_controller_read_en_reg_b[0:0];

reg [0:0] wide_mult_axi_orig_entry_r_address_a;
reg [0:0] wide_mult_axi_orig_entry_r_address_b;
reg wide_mult_axi_orig_entry_r_write_en_a;
reg wide_mult_axi_orig_entry_r_write_en_b;
reg [255:0] wide_mult_axi_orig_entry_r_write_data_a;
reg [255:0] wide_mult_axi_orig_entry_r_write_data_b;
wire [255:0] wide_mult_axi_orig_entry_r_read_data_a;
wire [255:0] wide_mult_axi_orig_entry_r_read_data_b;

wire [255:0] wide_mult_axi_orig_entry_r_read_data;
assign wide_mult_axi_orig_entry_r_read_data_a = wide_mult_axi_orig_entry_r_read_data;
assign wide_mult_axi_orig_entry_r_read_data_b = wide_mult_axi_orig_entry_r_read_data;

//   %r = alloca i256, align 8, !MSB !9938, !LSB !9939, !extendFrom !9938
wide_mult_axi_mem_controller_register wide_mult_axi_orig_entry_r (
	.clk(clk),
	.reset(reset),
	.write_en_a(wide_mult_axi_orig_entry_r_write_en_a),
	.write_en_b(wide_mult_axi_orig_entry_r_write_en_b),
	.write_data_a(wide_mult_axi_orig_entry_r_write_data_a),
	.write_data_b(wide_mult_axi_orig_entry_r_write_data_b),
	.read_data(wide_mult_axi_orig_entry_r_read_data),
	.byte_en_a(1'b1),
	.byte_en_b(1'b1)
);
defparam wide_mult_axi_orig_entry_r.width = 256;
defparam wide_mult_axi_orig_entry_r.init_value = 256'd0;
defparam wide_mult_axi_orig_entry_r.latency = latency;
defparam wide_mult_axi_orig_entry_r.byte_en_width = 1;
defparam wide_mult_axi_orig_entry_r.byte_size = 256;


reg [0:0] wide_mult_axi_orig_entry_ref_tmp_address_a;
reg [0:0] wide_mult_axi_orig_entry_ref_tmp_address_b;
reg wide_mult_axi_orig_entry_ref_tmp_write_en_a;
reg wide_mult_axi_orig_entry_ref_tmp_write_en_b;
reg [255:0] wide_mult_axi_orig_entry_ref_tmp_write_data_a;
reg [255:0] wide_mult_axi_orig_entry_ref_tmp_write_data_b;
wire [255:0] wide_mult_axi_orig_entry_ref_tmp_read_data_a;
wire [255:0] wide_mult_axi_orig_entry_ref_tmp_read_data_b;

wire [255:0] wide_mult_axi_orig_entry_ref_tmp_read_data;
assign wide_mult_axi_orig_entry_ref_tmp_read_data_a = wide_mult_axi_orig_entry_ref_tmp_read_data;
assign wide_mult_axi_orig_entry_ref_tmp_read_data_b = wide_mult_axi_orig_entry_ref_tmp_read_data;

//   %ref.tmp = alloca i256, align 8, !MSB !9938, !LSB !9939, !extendFrom !9938
wide_mult_axi_mem_controller_register wide_mult_axi_orig_entry_ref_tmp (
	.clk(clk),
	.reset(reset),
	.write_en_a(wide_mult_axi_orig_entry_ref_tmp_write_en_a),
	.write_en_b(wide_mult_axi_orig_entry_ref_tmp_write_en_b),
	.write_data_a(wide_mult_axi_orig_entry_ref_tmp_write_data_a),
	.write_data_b(wide_mult_axi_orig_entry_ref_tmp_write_data_b),
	.read_data(wide_mult_axi_orig_entry_ref_tmp_read_data),
	.byte_en_a(1'b1),
	.byte_en_b(1'b1)
);
defparam wide_mult_axi_orig_entry_ref_tmp.width = 256;
defparam wide_mult_axi_orig_entry_ref_tmp.init_value = 256'd0;
defparam wide_mult_axi_orig_entry_ref_tmp.latency = latency;
defparam wide_mult_axi_orig_entry_ref_tmp.byte_en_width = 1;
defparam wide_mult_axi_orig_entry_ref_tmp.byte_size = 256;

wire [`MEMORY_CONTROLLER_TAG_SIZE-1:0] tag_a;
assign tag_a = memory_controller_address_a[`MEMORY_CONTROLLER_ADDR_SIZE-1:`MEMORY_CONTROLLER_ADDR_SIZE-`MEMORY_CONTROLLER_TAG_SIZE];
wire [`MEMORY_CONTROLLER_TAG_SIZE-1:0] tag_b;
assign tag_b = memory_controller_address_b[`MEMORY_CONTROLLER_ADDR_SIZE-1:`MEMORY_CONTROLLER_ADDR_SIZE-`MEMORY_CONTROLLER_TAG_SIZE];

reg [2:0] select_not_struct_a;

wire select_wide_mult_axi_orig_entry_r_a;
assign select_wide_mult_axi_orig_entry_r_a = (tag_a == `TAG_wide_mult_axi_orig_entry_r);
reg [ram_latency:0] select_wide_mult_axi_orig_entry_r_reg_a;
wire [255:0] memory_controller_wide_mult_axi_orig_entry_r_read_data_a;
assign memory_controller_wide_mult_axi_orig_entry_r_read_data_a = {256{ select_wide_mult_axi_orig_entry_r_reg_a[ram_latency]}} & wide_mult_axi_orig_entry_r_read_data_a;

wire select_wide_mult_axi_orig_entry_ref_tmp_a;
assign select_wide_mult_axi_orig_entry_ref_tmp_a = (tag_a == `TAG_wide_mult_axi_orig_entry_ref_tmp);
reg [ram_latency:0] select_wide_mult_axi_orig_entry_ref_tmp_reg_a;
wire [255:0] memory_controller_wide_mult_axi_orig_entry_ref_tmp_read_data_a;
assign memory_controller_wide_mult_axi_orig_entry_ref_tmp_read_data_a = {256{ select_wide_mult_axi_orig_entry_ref_tmp_reg_a[ram_latency]}} & wide_mult_axi_orig_entry_ref_tmp_read_data_a;

always @(*)
begin
	wide_mult_axi_orig_entry_r_address_a = memory_controller_address_a [1-1+5:5] & {1{select_wide_mult_axi_orig_entry_r_a}};
	wide_mult_axi_orig_entry_r_write_en_a = memory_controller_write_en_a & select_wide_mult_axi_orig_entry_r_a;
	wide_mult_axi_orig_entry_r_write_data_a [256-1:0] = memory_controller_write_data_a[256-1:0];
	wide_mult_axi_orig_entry_ref_tmp_address_a = memory_controller_address_a [1-1+5:5] & {1{select_wide_mult_axi_orig_entry_ref_tmp_a}};
	wide_mult_axi_orig_entry_ref_tmp_write_en_a = memory_controller_write_en_a & select_wide_mult_axi_orig_entry_ref_tmp_a;
	wide_mult_axi_orig_entry_ref_tmp_write_data_a [256-1:0] = memory_controller_write_data_a[256-1:0];
end

always @(*)
begin
	select_not_struct_a [2:0] = 3'b0 | {5{select_wide_mult_axi_orig_entry_r_reg_a[ram_latency]}} | {5{select_wide_mult_axi_orig_entry_ref_tmp_reg_a[ram_latency]}};
	memory_controller_read_data_prev_a = memory_controller_read_data_reg_a & { 256{!memory_controller_read_en_reg_a[0]}};
	memory_controller_read_data_a = 1'b0  | memory_controller_wide_mult_axi_orig_entry_r_read_data_a | memory_controller_wide_mult_axi_orig_entry_ref_tmp_read_data_a;
end

always @(*)
begin
	memory_controller_read_data_reg_a <= memory_controller_read_data_a;
	memory_controller_read_en_reg_a[0] <= memory_controller_read_en_a;
end

always @(posedge clk)
if (memory_controller_clken)
for (j = 0; j < ram_latency; j=j+1)
begin
	select_wide_mult_axi_orig_entry_r_reg_a[j+1] <= select_wide_mult_axi_orig_entry_r_reg_a[j];
	select_wide_mult_axi_orig_entry_ref_tmp_reg_a[j+1] <= select_wide_mult_axi_orig_entry_ref_tmp_reg_a[j];
end

always @(*)
begin
	select_wide_mult_axi_orig_entry_r_reg_a[0] <= select_wide_mult_axi_orig_entry_r_a;
	select_wide_mult_axi_orig_entry_ref_tmp_reg_a[0] <= select_wide_mult_axi_orig_entry_ref_tmp_a;
end


reg [2:0] select_not_struct_b;

wire select_wide_mult_axi_orig_entry_r_b;
assign select_wide_mult_axi_orig_entry_r_b = (tag_b == `TAG_wide_mult_axi_orig_entry_r);
reg [ram_latency:0] select_wide_mult_axi_orig_entry_r_reg_b;
wire [255:0] memory_controller_wide_mult_axi_orig_entry_r_read_data_b;
assign memory_controller_wide_mult_axi_orig_entry_r_read_data_b = {256{ select_wide_mult_axi_orig_entry_r_reg_b[ram_latency]}} & wide_mult_axi_orig_entry_r_read_data_b;

wire select_wide_mult_axi_orig_entry_ref_tmp_b;
assign select_wide_mult_axi_orig_entry_ref_tmp_b = (tag_b == `TAG_wide_mult_axi_orig_entry_ref_tmp);
reg [ram_latency:0] select_wide_mult_axi_orig_entry_ref_tmp_reg_b;
wire [255:0] memory_controller_wide_mult_axi_orig_entry_ref_tmp_read_data_b;
assign memory_controller_wide_mult_axi_orig_entry_ref_tmp_read_data_b = {256{ select_wide_mult_axi_orig_entry_ref_tmp_reg_b[ram_latency]}} & wide_mult_axi_orig_entry_ref_tmp_read_data_b;

always @(*)
begin
	wide_mult_axi_orig_entry_r_address_b = memory_controller_address_b [1-1+5:5] & {1{select_wide_mult_axi_orig_entry_r_b}};
	wide_mult_axi_orig_entry_r_write_en_b = memory_controller_write_en_b & select_wide_mult_axi_orig_entry_r_b;
	wide_mult_axi_orig_entry_r_write_data_b [256-1:0] = memory_controller_write_data_b[256-1:0];
	wide_mult_axi_orig_entry_ref_tmp_address_b = memory_controller_address_b [1-1+5:5] & {1{select_wide_mult_axi_orig_entry_ref_tmp_b}};
	wide_mult_axi_orig_entry_ref_tmp_write_en_b = memory_controller_write_en_b & select_wide_mult_axi_orig_entry_ref_tmp_b;
	wide_mult_axi_orig_entry_ref_tmp_write_data_b [256-1:0] = memory_controller_write_data_b[256-1:0];
end

always @(*)
begin
	select_not_struct_b [2:0] = 3'b0 | {5{select_wide_mult_axi_orig_entry_r_reg_b[ram_latency]}} | {5{select_wide_mult_axi_orig_entry_ref_tmp_reg_b[ram_latency]}};
	memory_controller_read_data_prev_b = memory_controller_read_data_reg_b & { 256{!memory_controller_read_en_reg_b[0]}};
	memory_controller_read_data_b = 1'b0  | memory_controller_wide_mult_axi_orig_entry_r_read_data_b | memory_controller_wide_mult_axi_orig_entry_ref_tmp_read_data_b;
end

always @(*)
begin
	memory_controller_read_data_reg_b <= memory_controller_read_data_b;
	memory_controller_read_en_reg_b[0] <= memory_controller_read_en_b;
end

always @(posedge clk)
if (memory_controller_clken)
for (j = 0; j < ram_latency; j=j+1)
begin
	select_wide_mult_axi_orig_entry_r_reg_b[j+1] <= select_wide_mult_axi_orig_entry_r_reg_b[j];
	select_wide_mult_axi_orig_entry_ref_tmp_reg_b[j+1] <= select_wide_mult_axi_orig_entry_ref_tmp_reg_b[j];
end

always @(*)
begin
	select_wide_mult_axi_orig_entry_r_reg_b[0] <= select_wide_mult_axi_orig_entry_r_b;
	select_wide_mult_axi_orig_entry_ref_tmp_reg_b[0] <= select_wide_mult_axi_orig_entry_ref_tmp_b;
end

endmodule

`timescale 1 ns / 1 ns
module wide_mult
(
	clk,
	reset,
	start,
	ready,
	finish,
	agg_result,
	A_val,
	B_val,
	C_val,
	D_val,
	E_val,
	memory_controller_0_clken,
	memory_controller_0_write_en_a,
	memory_controller_0_write_data_a,
	memory_controller_0_read_en_a,
	memory_controller_0_address_a,
	memory_controller_0_size_a,
	memory_controller_0_read_data_a,
	memory_controller_0_write_en_b,
	memory_controller_0_write_data_b,
	memory_controller_0_read_en_b,
	memory_controller_0_address_b,
	memory_controller_0_size_b,
	memory_controller_0_read_data_b
);

parameter [5:0] LEGUP_0 = 6'd0;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_1 = 6'd1;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_2 = 6'd2;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_3 = 6'd3;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_4 = 6'd4;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_5 = 6'd5;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_6 = 6'd6;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_7 = 6'd7;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_8 = 6'd8;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_9 = 6'd9;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_10 = 6'd10;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_11 = 6'd11;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_12 = 6'd12;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_13 = 6'd13;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_14 = 6'd14;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_15 = 6'd15;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_16 = 6'd16;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_17 = 6'd17;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_18 = 6'd18;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_19 = 6'd19;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_20 = 6'd20;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_21 = 6'd21;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_22 = 6'd22;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_23 = 6'd23;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_24 = 6'd24;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_25 = 6'd25;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_26 = 6'd26;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_27 = 6'd27;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_28 = 6'd28;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_29 = 6'd29;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_30 = 6'd30;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_31 = 6'd31;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_32 = 6'd32;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_33 = 6'd33;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_34 = 6'd34;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_35 = 6'd35;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_36 = 6'd36;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_37 = 6'd37;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_38 = 6'd38;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_39 = 6'd39;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_40 = 6'd40;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_41 = 6'd41;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_42 = 6'd42;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_43 = 6'd43;
parameter [5:0] LEGUP_F_wide_mult_BB_entry_44 = 6'd44;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] agg_result;
input [127:0] A_val;
input [63:0] B_val;
input [63:0] C_val;
input [127:0] D_val;
input [127:0] E_val;
output reg  memory_controller_0_clken;
output reg  memory_controller_0_write_en_a;
output reg [255:0] memory_controller_0_write_data_a;
output reg  memory_controller_0_read_en_a;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_0_address_a;
output reg [1:0] memory_controller_0_size_a;
input [255:0] memory_controller_0_read_data_a;
output  memory_controller_0_write_en_b;
output [255:0] memory_controller_0_write_data_b;
output  memory_controller_0_read_en_b;
output [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_0_address_b;
output [1:0] memory_controller_0_size_b;
input [255:0] memory_controller_0_read_data_b;
reg [5:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [5:0] next_state;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] agg_result_reg;
reg [127:0] A_val_reg;
reg [63:0] B_val_reg;
reg [63:0] C_val_reg;
reg [127:0] D_val_reg;
reg [127:0] E_val_reg;
wire  fsm_stall;
reg [63:0] wide_mult_entry_0;
reg [127:0] wide_mult_entry_1;
reg [191:0] wide_mult_entry_2;
reg [190:0] wide_mult_entry_3;
reg [127:0] wide_mult_entry_4;
reg [127:0] wide_mult_entry_4_reg;
reg [191:0] wide_mult_entry_5;
reg [63:0] wide_mult_entry_6;
reg [63:0] wide_mult_entry_6_reg;
reg [191:0] wide_mult_entry_7;
reg [255:0] wide_mult_entry_8;
reg [127:0] wide_mult_entry_9;
reg [127:0] wide_mult_entry_bit_concat;
reg [129:0] wide_mult_entry_10;
reg [129:0] wide_mult_entry_10_reg;
reg [255:0] wide_mult_entry_11;
reg  legup_mult_signed_128_64_17_0_clock;
reg  legup_mult_signed_128_64_17_0_aclr;
reg  legup_mult_signed_128_64_17_0_clken;
reg [127:0] legup_mult_signed_128_64_17_0_dataa;
reg [63:0] legup_mult_signed_128_64_17_0_datab;
wire [191:0] legup_mult_signed_128_64_17_0_result;
reg [191:0] legup_mult_wide_mult_entry_2_out_actual;
reg [191:0] legup_mult_wide_mult_entry_2_out;
reg  legup_mult_wide_mult_entry_2_en;
reg  legup_mult_wide_mult_entry_2_en_sequential_cond;
wire [127:0] wide_mult_entry_bit_concat_bit_select_operand_0;
wire [63:0] wide_mult_entry_bit_concat_bit_select_operand_4;
reg  legup_mult_signed_192_64_25_1_clock;
reg  legup_mult_signed_192_64_25_1_aclr;
reg  legup_mult_signed_192_64_25_1_clken;
reg [191:0] legup_mult_signed_192_64_25_1_dataa;
reg [63:0] legup_mult_signed_192_64_25_1_datab;
wire [255:0] legup_mult_signed_192_64_25_1_result;
reg [255:0] legup_mult_wide_mult_entry_8_out_actual;
reg [255:0] legup_mult_wide_mult_entry_8_out;
reg  legup_mult_wide_mult_entry_8_en;
reg  legup_mult_wide_mult_entry_8_en_sequential_cond;
reg  memory_controller_0_clken_sequential_cond;

/*   %2 = mul i192 %1, %0, !dbg !9947, !MSB !9941, !LSB !9948, !extendFrom !9941*/
wide_mult_axi_legup_mult legup_mult_signed_128_64_17_0 (
	.clock (legup_mult_signed_128_64_17_0_clock),
	.aclr (legup_mult_signed_128_64_17_0_aclr),
	.clken (legup_mult_signed_128_64_17_0_clken),
	.dataa (legup_mult_signed_128_64_17_0_dataa),
	.datab (legup_mult_signed_128_64_17_0_datab),
	.result (legup_mult_signed_128_64_17_0_result)
);

defparam
	legup_mult_signed_128_64_17_0.widtha = 128,
	legup_mult_signed_128_64_17_0.widthb = 64,
	legup_mult_signed_128_64_17_0.widthp = 192,
	legup_mult_signed_128_64_17_0.pipeline = 17,
	legup_mult_signed_128_64_17_0.representation = "SIGNED";

/*   %8 = mul i256 %7, %6, !dbg !9969, !MSB !9966, !LSB !9942, !extendFrom !9966*/
wide_mult_axi_legup_mult legup_mult_signed_192_64_25_1 (
	.clock (legup_mult_signed_192_64_25_1_clock),
	.aclr (legup_mult_signed_192_64_25_1_aclr),
	.clken (legup_mult_signed_192_64_25_1_clken),
	.dataa (legup_mult_signed_192_64_25_1_dataa),
	.datab (legup_mult_signed_192_64_25_1_datab),
	.result (legup_mult_signed_192_64_25_1_result)
);

defparam
	legup_mult_signed_192_64_25_1.widtha = 192,
	legup_mult_signed_192_64_25_1.widthb = 64,
	legup_mult_signed_192_64_25_1.widthp = 256,
	legup_mult_signed_192_64_25_1.pipeline = 25,
	legup_mult_signed_192_64_25_1.representation = "SIGNED";


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
		next_state = LEGUP_F_wide_mult_BB_entry_1;
LEGUP_F_wide_mult_BB_entry_1:
		next_state = LEGUP_F_wide_mult_BB_entry_2;
LEGUP_F_wide_mult_BB_entry_10:
		next_state = LEGUP_F_wide_mult_BB_entry_11;
LEGUP_F_wide_mult_BB_entry_11:
		next_state = LEGUP_F_wide_mult_BB_entry_12;
LEGUP_F_wide_mult_BB_entry_12:
		next_state = LEGUP_F_wide_mult_BB_entry_13;
LEGUP_F_wide_mult_BB_entry_13:
		next_state = LEGUP_F_wide_mult_BB_entry_14;
LEGUP_F_wide_mult_BB_entry_14:
		next_state = LEGUP_F_wide_mult_BB_entry_15;
LEGUP_F_wide_mult_BB_entry_15:
		next_state = LEGUP_F_wide_mult_BB_entry_16;
LEGUP_F_wide_mult_BB_entry_16:
		next_state = LEGUP_F_wide_mult_BB_entry_17;
LEGUP_F_wide_mult_BB_entry_17:
		next_state = LEGUP_F_wide_mult_BB_entry_18;
LEGUP_F_wide_mult_BB_entry_18:
		next_state = LEGUP_F_wide_mult_BB_entry_19;
LEGUP_F_wide_mult_BB_entry_19:
		next_state = LEGUP_F_wide_mult_BB_entry_20;
LEGUP_F_wide_mult_BB_entry_2:
		next_state = LEGUP_F_wide_mult_BB_entry_3;
LEGUP_F_wide_mult_BB_entry_20:
		next_state = LEGUP_F_wide_mult_BB_entry_21;
LEGUP_F_wide_mult_BB_entry_21:
		next_state = LEGUP_F_wide_mult_BB_entry_22;
LEGUP_F_wide_mult_BB_entry_22:
		next_state = LEGUP_F_wide_mult_BB_entry_23;
LEGUP_F_wide_mult_BB_entry_23:
		next_state = LEGUP_F_wide_mult_BB_entry_24;
LEGUP_F_wide_mult_BB_entry_24:
		next_state = LEGUP_F_wide_mult_BB_entry_25;
LEGUP_F_wide_mult_BB_entry_25:
		next_state = LEGUP_F_wide_mult_BB_entry_26;
LEGUP_F_wide_mult_BB_entry_26:
		next_state = LEGUP_F_wide_mult_BB_entry_27;
LEGUP_F_wide_mult_BB_entry_27:
		next_state = LEGUP_F_wide_mult_BB_entry_28;
LEGUP_F_wide_mult_BB_entry_28:
		next_state = LEGUP_F_wide_mult_BB_entry_29;
LEGUP_F_wide_mult_BB_entry_29:
		next_state = LEGUP_F_wide_mult_BB_entry_30;
LEGUP_F_wide_mult_BB_entry_3:
		next_state = LEGUP_F_wide_mult_BB_entry_4;
LEGUP_F_wide_mult_BB_entry_30:
		next_state = LEGUP_F_wide_mult_BB_entry_31;
LEGUP_F_wide_mult_BB_entry_31:
		next_state = LEGUP_F_wide_mult_BB_entry_32;
LEGUP_F_wide_mult_BB_entry_32:
		next_state = LEGUP_F_wide_mult_BB_entry_33;
LEGUP_F_wide_mult_BB_entry_33:
		next_state = LEGUP_F_wide_mult_BB_entry_34;
LEGUP_F_wide_mult_BB_entry_34:
		next_state = LEGUP_F_wide_mult_BB_entry_35;
LEGUP_F_wide_mult_BB_entry_35:
		next_state = LEGUP_F_wide_mult_BB_entry_36;
LEGUP_F_wide_mult_BB_entry_36:
		next_state = LEGUP_F_wide_mult_BB_entry_37;
LEGUP_F_wide_mult_BB_entry_37:
		next_state = LEGUP_F_wide_mult_BB_entry_38;
LEGUP_F_wide_mult_BB_entry_38:
		next_state = LEGUP_F_wide_mult_BB_entry_39;
LEGUP_F_wide_mult_BB_entry_39:
		next_state = LEGUP_F_wide_mult_BB_entry_40;
LEGUP_F_wide_mult_BB_entry_4:
		next_state = LEGUP_F_wide_mult_BB_entry_5;
LEGUP_F_wide_mult_BB_entry_40:
		next_state = LEGUP_F_wide_mult_BB_entry_41;
LEGUP_F_wide_mult_BB_entry_41:
		next_state = LEGUP_F_wide_mult_BB_entry_42;
LEGUP_F_wide_mult_BB_entry_42:
		next_state = LEGUP_F_wide_mult_BB_entry_43;
LEGUP_F_wide_mult_BB_entry_43:
		next_state = LEGUP_F_wide_mult_BB_entry_44;
LEGUP_F_wide_mult_BB_entry_44:
		next_state = LEGUP_0;
LEGUP_F_wide_mult_BB_entry_5:
		next_state = LEGUP_F_wide_mult_BB_entry_6;
LEGUP_F_wide_mult_BB_entry_6:
		next_state = LEGUP_F_wide_mult_BB_entry_7;
LEGUP_F_wide_mult_BB_entry_7:
		next_state = LEGUP_F_wide_mult_BB_entry_8;
LEGUP_F_wide_mult_BB_entry_8:
		next_state = LEGUP_F_wide_mult_BB_entry_9;
LEGUP_F_wide_mult_BB_entry_9:
		next_state = LEGUP_F_wide_mult_BB_entry_10;
default:
	next_state = cur_state;
endcase

end
always @(posedge clk) begin
	if ((start & ready)) begin
		agg_result_reg <= agg_result;
	end
end
always @(posedge clk) begin
	if ((start & ready)) begin
		A_val_reg <= A_val;
	end
end
always @(posedge clk) begin
	if ((start & ready)) begin
		B_val_reg <= B_val;
	end
end
always @(posedge clk) begin
	if ((start & ready)) begin
		C_val_reg <= C_val;
	end
end
always @(posedge clk) begin
	if ((start & ready)) begin
		D_val_reg <= D_val;
	end
end
always @(posedge clk) begin
	if ((start & ready)) begin
		E_val_reg <= E_val;
	end
end
assign fsm_stall = 1'd0;
always @(*) begin
		wide_mult_entry_0 = $signed(C_val_reg);
end
always @(*) begin
		wide_mult_entry_1 = $signed(E_val_reg);
end
always @(*) begin
	wide_mult_entry_2 = legup_mult_wide_mult_entry_2_out;
end
always @(*) begin
		wide_mult_entry_3 = ($signed(wide_mult_entry_2) >>> 192'd1);
end
always @(*) begin
		wide_mult_entry_4 = $signed(D_val_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_1)) begin
		wide_mult_entry_4_reg <= wide_mult_entry_4;
	end
end
always @(*) begin
		wide_mult_entry_5 = ($signed({{1{wide_mult_entry_3[190]}},wide_mult_entry_3}) + $signed({{64{wide_mult_entry_4_reg[127]}},wide_mult_entry_4_reg}));
end
always @(*) begin
		wide_mult_entry_6 = $signed(C_val_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_1)) begin
		wide_mult_entry_6_reg <= wide_mult_entry_6;
	end
end
always @(*) begin
		wide_mult_entry_7 = $signed(wide_mult_entry_5);
end
always @(*) begin
	wide_mult_entry_8 = legup_mult_wide_mult_entry_8_out;
end
always @(*) begin
		wide_mult_entry_9 = $signed(A_val_reg);
end
always @(*) begin
		wide_mult_entry_bit_concat = {{wide_mult_entry_bit_concat_bit_select_operand_0[127:0], B_val_reg[63:0]}, wide_mult_entry_bit_concat_bit_select_operand_4[63:0]};
end
always @(*) begin
		wide_mult_entry_10 = ({2'd0,wide_mult_entry_bit_concat} + $signed({{2{wide_mult_entry_9[127]}},wide_mult_entry_9}));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_1)) begin
		wide_mult_entry_10_reg <= wide_mult_entry_10;
	end
end
always @(*) begin
		wide_mult_entry_11 = ($signed({{126{wide_mult_entry_10_reg[129]}},wide_mult_entry_10_reg}) + wide_mult_entry_8);
end
always @(*) begin
	legup_mult_signed_128_64_17_0_clock = clk;
end
always @(*) begin
	legup_mult_signed_128_64_17_0_aclr = reset;
end
always @(*) begin
	legup_mult_signed_128_64_17_0_clken = legup_mult_wide_mult_entry_2_en;
end
always @(*) begin
	legup_mult_signed_128_64_17_0_dataa = wide_mult_entry_1;
end
always @(*) begin
	legup_mult_signed_128_64_17_0_datab = wide_mult_entry_0;
end
always @(*) begin
	legup_mult_wide_mult_entry_2_out_actual = legup_mult_signed_128_64_17_0_result;
end
always @(*) begin
	legup_mult_wide_mult_entry_2_out = $signed(legup_mult_wide_mult_entry_2_out_actual);
end
always @(*) begin
	legup_mult_wide_mult_entry_2_en = legup_mult_wide_mult_entry_2_en_sequential_cond;
end
always @(*) begin
	legup_mult_wide_mult_entry_2_en_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign wide_mult_entry_bit_concat_bit_select_operand_0 = 128'd0;
assign wide_mult_entry_bit_concat_bit_select_operand_4 = 64'd0;
always @(*) begin
	legup_mult_signed_192_64_25_1_clock = clk;
end
always @(*) begin
	legup_mult_signed_192_64_25_1_aclr = reset;
end
always @(*) begin
	legup_mult_signed_192_64_25_1_clken = legup_mult_wide_mult_entry_8_en;
end
always @(*) begin
	legup_mult_signed_192_64_25_1_dataa = wide_mult_entry_7;
end
always @(*) begin
	legup_mult_signed_192_64_25_1_datab = wide_mult_entry_6_reg;
end
always @(*) begin
	legup_mult_wide_mult_entry_8_out_actual = legup_mult_signed_192_64_25_1_result;
end
always @(*) begin
	legup_mult_wide_mult_entry_8_out = $signed(legup_mult_wide_mult_entry_8_out_actual);
end
always @(*) begin
	legup_mult_wide_mult_entry_8_en = legup_mult_wide_mult_entry_8_en_sequential_cond;
end
always @(*) begin
	legup_mult_wide_mult_entry_8_en_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	memory_controller_0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_44)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(*) begin
	memory_controller_0_clken = memory_controller_0_clken_sequential_cond;
end
always @(*) begin
	memory_controller_0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_43)) begin
		memory_controller_0_write_en_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_0_write_data_a = 256'd0;
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_43)) begin
		memory_controller_0_write_data_a = wide_mult_entry_11;
	end
end
always @(*) begin
	memory_controller_0_read_en_a = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_43)) begin
		memory_controller_0_read_en_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_0_address_a = 0;
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_43)) begin
		memory_controller_0_address_a = agg_result_reg;
	end
end
always @(*) begin
	memory_controller_0_size_a = 2'd0;
	if ((cur_state == LEGUP_F_wide_mult_BB_entry_43)) begin
		memory_controller_0_size_a = 2'd0;
	end
end
assign memory_controller_0_write_en_b = 1'd0;
assign memory_controller_0_write_data_b = 256'd0;
assign memory_controller_0_read_en_b = 1'd0;
assign memory_controller_0_address_b = 0;
assign memory_controller_0_size_b = 2'd0;

endmodule
`timescale 1 ns / 1 ns
module wide_mult_axi
(
	clk,
	reset,
	start,
	ready,
	finish,
	wide_mult_axi_orig_start,
	wide_mult_axi_orig_finish,
	wide_mult_axi_orig_ready,
	data_read_start,
	data_read_finish,
	data_read_ready,
	data_write_start,
	data_write_finish,
	data_write_ready
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_wide_mult_axi_BB_entry_1 = 3'd1;
parameter [2:0] LEGUP_F_wide_mult_axi_BB_entry_3 = 3'd3;
parameter [2:0] LEGUP_F_wide_mult_axi_BB_entry_5 = 3'd5;
parameter [2:0] LEGUP_F_wide_mult_axi_BB_entry_7 = 3'd7;
parameter [2:0] LEGUP_function_call_2 = 3'd2;
parameter [2:0] LEGUP_function_call_4 = 3'd4;
parameter [2:0] LEGUP_function_call_6 = 3'd6;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  wide_mult_axi_orig_start;
input  wide_mult_axi_orig_finish;
input  wide_mult_axi_orig_ready;
output reg  data_read_start;
input  data_read_finish;
input  data_read_ready;
output reg  data_write_start;
input  data_write_finish;
input  data_write_ready;
reg [2:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [2:0] next_state;
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
		next_state = LEGUP_F_wide_mult_axi_BB_entry_1;
LEGUP_F_wide_mult_axi_BB_entry_1:
		next_state = LEGUP_function_call_2;
LEGUP_F_wide_mult_axi_BB_entry_3:
		next_state = LEGUP_function_call_4;
LEGUP_F_wide_mult_axi_BB_entry_5:
		next_state = LEGUP_function_call_6;
LEGUP_F_wide_mult_axi_BB_entry_7:
		next_state = LEGUP_0;
LEGUP_function_call_2:
	if ((fsm_stall == 1'd0) && (wide_mult_axi_orig_finish == 1'd1))
		next_state = LEGUP_F_wide_mult_axi_BB_entry_3;
LEGUP_function_call_4:
		next_state = LEGUP_F_wide_mult_axi_BB_entry_5;
LEGUP_function_call_6:
		next_state = LEGUP_F_wide_mult_axi_BB_entry_7;
default:
	next_state = cur_state;
endcase

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
	ready = wide_mult_axi_orig_ready;
end
always @(posedge clk) begin
	finish <= wide_mult_axi_orig_finish;
end
always @(*) begin
	if (reset) begin
		wide_mult_axi_orig_start = 1'd0;
	end
	else if ((cur_state == LEGUP_F_wide_mult_axi_BB_entry_1)) begin
		wide_mult_axi_orig_start = 1'd1;
	end
	else /* if (((cur_state == LEGUP_function_call_2) & ~(fsm_stall))) */ begin
		wide_mult_axi_orig_start = 1'd0;
	end
end
always @(*) begin
	data_read_start = 1'd1;
	if (reset) begin
		data_read_start = 1'd0;
	end
end
always @(*) begin
	data_write_start = 1'd1;
	if (reset) begin
		data_write_start = 1'd0;
	end
end

endmodule
`timescale 1 ns / 1 ns
module wide_mult_axi_orig
(
	clk,
	reset,
	start,
	ready,
	finish,
	wide_mult_start,
	wide_mult_finish,
	wide_mult_ready,
	wide_mult_agg_result,
	wide_mult_A_val,
	wide_mult_B_val,
	wide_mult_C_val,
	wide_mult_D_val,
	wide_mult_E_val,
	data_run_write_en,
	data_run_write_data,
	data_run_read_data,
	data_A0_write_en,
	data_A0_write_data,
	data_A0_read_data,
	data_A1_write_en,
	data_A1_write_data,
	data_A1_read_data,
	data_A2_write_en,
	data_A2_write_data,
	data_A2_read_data,
	data_A3_write_en,
	data_A3_write_data,
	data_A3_read_data,
	data_B0_write_en,
	data_B0_write_data,
	data_B0_read_data,
	data_B1_write_en,
	data_B1_write_data,
	data_B1_read_data,
	data_C0_write_en,
	data_C0_write_data,
	data_C0_read_data,
	data_C1_write_en,
	data_C1_write_data,
	data_C1_read_data,
	data_D0_write_en,
	data_D0_write_data,
	data_D0_read_data,
	data_D1_write_en,
	data_D1_write_data,
	data_D1_read_data,
	data_D2_write_en,
	data_D2_write_data,
	data_D2_read_data,
	data_D3_write_en,
	data_D3_write_data,
	data_D3_read_data,
	data_E0_write_en,
	data_E0_write_data,
	data_E0_read_data,
	data_E1_write_en,
	data_E1_write_data,
	data_E1_read_data,
	data_E2_write_en,
	data_E2_write_data,
	data_E2_read_data,
	data_E3_write_en,
	data_E3_write_data,
	data_E3_read_data,
	memory_controller_0_clken,
	memory_controller_0_write_en_a,
	memory_controller_0_write_data_a,
	memory_controller_0_read_en_a,
	memory_controller_0_address_a,
	memory_controller_0_size_a,
	memory_controller_0_read_data_a,
	memory_controller_0_write_en_b,
	memory_controller_0_write_data_b,
	memory_controller_0_read_en_b,
	memory_controller_0_address_b,
	memory_controller_0_size_b,
	memory_controller_0_read_data_b,
	data_result0_write_en,
	data_result0_write_data,
	data_result0_read_data,
	data_result1_write_en,
	data_result1_write_data,
	data_result1_read_data,
	data_result2_write_en,
	data_result2_write_data,
	data_result2_read_data,
	data_result3_write_en,
	data_result3_write_data,
	data_result3_read_data,
	data_result4_write_en,
	data_result4_write_data,
	data_result4_read_data,
	data_result5_write_en,
	data_result5_write_data,
	data_result5_read_data,
	data_result6_write_en,
	data_result6_write_data,
	data_result6_read_data,
	data_result7_write_en,
	data_result7_write_data,
	data_result7_read_data,
	data_base_addr_write_en,
	data_base_addr_write_data,
	data_base_addr_read_data,
	initiator_ar_addr,
	initiator_ar_ready,
	initiator_ar_valid,
	initiator_ar_burst,
	initiator_ar_size,
	initiator_ar_len,
	initiator_r_data,
	initiator_r_ready,
	initiator_r_valid,
	initiator_r_resp,
	initiator_r_last,
	initiator_aw_addr,
	initiator_aw_ready,
	initiator_aw_valid,
	initiator_aw_burst,
	initiator_aw_size,
	initiator_aw_len,
	initiator_w_data,
	initiator_w_ready,
	initiator_w_valid,
	initiator_w_strb,
	initiator_w_last,
	initiator_b_resp,
	initiator_b_resp_ready,
	initiator_b_resp_valid,
	data_error_write_en,
	data_error_write_data,
	data_error_read_data
);

parameter [5:0] LEGUP_0 = 6'd0;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_entry_1 = 6'd1;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2 = 6'd2;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_4 = 6'd4;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5 = 6'd5;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_6 = 6'd6;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7 = 6'd7;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_8 = 6'd8;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_9 = 6'd9;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_10 = 6'd10;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_11 = 6'd11;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_12 = 6'd12;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_13 = 6'd13;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_14 = 6'd14;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_15 = 6'd15;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_16 = 6'd16;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_17 = 6'd17;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_18 = 6'd18;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_19 = 6'd19;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_20 = 6'd20;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_21 = 6'd21;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_22 = 6'd22;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_23 = 6'd23;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_25 = 6'd25;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_26 = 6'd26;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_27 = 6'd27;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_28 = 6'd28;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_29 = 6'd29;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_30 = 6'd30;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_31 = 6'd31;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_32 = 6'd32;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_body_33 = 6'd33;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_end_34 = 6'd34;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_for_end_35 = 6'd35;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_36 = 6'd36;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_37 = 6'd37;
parameter [5:0] LEGUP_F_wide_mult_axi_orig_BB_cleanup_38 = 6'd38;
parameter [5:0] LEGUP_function_call_3 = 6'd3;
parameter [5:0] LEGUP_function_call_24 = 6'd24;

input  clk;
input  reset;
input  start;
output reg  ready;
output reg  finish;
output reg  wide_mult_start;
input  wide_mult_finish;
input  wide_mult_ready;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] wide_mult_agg_result;
output reg [127:0] wide_mult_A_val;
output reg [63:0] wide_mult_B_val;
output reg [63:0] wide_mult_C_val;
output reg [127:0] wide_mult_D_val;
output reg [127:0] wide_mult_E_val;
output reg  data_run_write_en;
output reg [31:0] data_run_write_data;
input [31:0] data_run_read_data;
output  data_A0_write_en;
output [31:0] data_A0_write_data;
input [31:0] data_A0_read_data;
output  data_A1_write_en;
output [31:0] data_A1_write_data;
input [31:0] data_A1_read_data;
output  data_A2_write_en;
output [31:0] data_A2_write_data;
input [31:0] data_A2_read_data;
output  data_A3_write_en;
output [31:0] data_A3_write_data;
input [31:0] data_A3_read_data;
output  data_B0_write_en;
output [31:0] data_B0_write_data;
input [31:0] data_B0_read_data;
output  data_B1_write_en;
output [31:0] data_B1_write_data;
input [31:0] data_B1_read_data;
output  data_C0_write_en;
output [31:0] data_C0_write_data;
input [31:0] data_C0_read_data;
output  data_C1_write_en;
output [31:0] data_C1_write_data;
input [31:0] data_C1_read_data;
output  data_D0_write_en;
output [31:0] data_D0_write_data;
input [31:0] data_D0_read_data;
output  data_D1_write_en;
output [31:0] data_D1_write_data;
input [31:0] data_D1_read_data;
output  data_D2_write_en;
output [31:0] data_D2_write_data;
input [31:0] data_D2_read_data;
output  data_D3_write_en;
output [31:0] data_D3_write_data;
input [31:0] data_D3_read_data;
output  data_E0_write_en;
output [31:0] data_E0_write_data;
input [31:0] data_E0_read_data;
output  data_E1_write_en;
output [31:0] data_E1_write_data;
input [31:0] data_E1_read_data;
output  data_E2_write_en;
output [31:0] data_E2_write_data;
input [31:0] data_E2_read_data;
output  data_E3_write_en;
output [31:0] data_E3_write_data;
input [31:0] data_E3_read_data;
output reg  memory_controller_0_clken;
output reg  memory_controller_0_write_en_a;
output reg [255:0] memory_controller_0_write_data_a;
output reg  memory_controller_0_read_en_a;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_0_address_a;
output reg [1:0] memory_controller_0_size_a;
input [255:0] memory_controller_0_read_data_a;
output  memory_controller_0_write_en_b;
output [255:0] memory_controller_0_write_data_b;
output  memory_controller_0_read_en_b;
output [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_0_address_b;
output [1:0] memory_controller_0_size_b;
input [255:0] memory_controller_0_read_data_b;
output reg  data_result0_write_en;
output reg [31:0] data_result0_write_data;
input [31:0] data_result0_read_data;
output reg  data_result1_write_en;
output reg [31:0] data_result1_write_data;
input [31:0] data_result1_read_data;
output reg  data_result2_write_en;
output reg [31:0] data_result2_write_data;
input [31:0] data_result2_read_data;
output reg  data_result3_write_en;
output reg [31:0] data_result3_write_data;
input [31:0] data_result3_read_data;
output reg  data_result4_write_en;
output reg [31:0] data_result4_write_data;
input [31:0] data_result4_read_data;
output reg  data_result5_write_en;
output reg [31:0] data_result5_write_data;
input [31:0] data_result5_read_data;
output reg  data_result6_write_en;
output reg [31:0] data_result6_write_data;
input [31:0] data_result6_read_data;
output reg  data_result7_write_en;
output reg [31:0] data_result7_write_data;
input [31:0] data_result7_read_data;
output  data_base_addr_write_en;
output [31:0] data_base_addr_write_data;
input [31:0] data_base_addr_read_data;
output reg [31:0] initiator_ar_addr;
input  initiator_ar_ready;
output reg  initiator_ar_valid;
output reg [1:0] initiator_ar_burst;
output reg [2:0] initiator_ar_size;
output reg [7:0] initiator_ar_len;
input [31:0] initiator_r_data;
output reg  initiator_r_ready;
input  initiator_r_valid;
input [1:0] initiator_r_resp;
input  initiator_r_last;
output reg [31:0] initiator_aw_addr;
input  initiator_aw_ready;
output reg  initiator_aw_valid;
output reg [1:0] initiator_aw_burst;
output reg [2:0] initiator_aw_size;
output reg [7:0] initiator_aw_len;
output reg [31:0] initiator_w_data;
input  initiator_w_ready;
output reg  initiator_w_valid;
output reg [3:0] initiator_w_strb;
output reg  initiator_w_last;
input [1:0] initiator_b_resp;
output reg  initiator_b_resp_ready;
input  initiator_b_resp_valid;
output reg  data_error_write_en;
output reg [31:0] data_error_write_data;
input [31:0] data_error_read_data;
reg [5:0] cur_state/* synthesis syn_encoding="onehot" */;
reg [5:0] next_state;
reg  fsm_stall;
reg [31:0] wide_mult_axi_orig_entry_0;
reg [31:0] wide_mult_axi_orig_entry_0_reg;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_1;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_2;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_3;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_4;
reg [127:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_concat29;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_5;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_6;
reg [63:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_concat28;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_7;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_8;
reg [63:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_concat27;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_9;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_10;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_11;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_12;
reg [127:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_concat26;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_13;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_14;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_15;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_16;
reg [127:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_concat25;
reg [255:0] wide_mult_axi_orig_EEcvyEv_exit525_17;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select24;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select23;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select22;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select21;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select20;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select19;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select18;
reg [31:0] wide_mult_axi_orig_EEcvyEv_exit525_bit_select17;
reg [31:0] wide_mult_axi_orig_for_body_lr_ph_18;
reg [31:0] wide_mult_axi_orig_for_body_lr_ph_18_reg;
reg [31:0] wide_mult_axi_orig_for_body_lr_ph_19;
reg [31:0] wide_mult_axi_orig_for_body_lr_ph_19_reg;
reg [1:0] wide_mult_axi_orig_for_body_error_0;
reg [1:0] wide_mult_axi_orig_for_body_error_0_reg;
reg [31:0] wide_mult_axi_orig_for_body_i_0703;
reg [31:0] wide_mult_axi_orig_for_body_i_0703_reg;
reg [26:0] wide_mult_axi_orig_for_body_bit_select15;
reg [25:0] wide_mult_axi_orig_for_body_bit_select13;
reg [31:0] wide_mult_axi_orig_for_body_bit_concat16;
reg [31:0] wide_mult_axi_orig_for_body_bit_concat14;
reg [31:0] wide_mult_axi_orig_for_body_sr_add;
reg [31:0] wide_mult_axi_orig_for_body_addr_0;
reg [31:0] wide_mult_axi_orig_for_body_20;
reg [31:0] wide_mult_axi_orig_for_body_20_reg;
reg [31:0] wide_mult_axi_orig_for_body_21;
reg [31:0] wide_mult_axi_orig_for_body_21_reg;
reg [31:0] wide_mult_axi_orig_for_body_24;
reg [31:0] wide_mult_axi_orig_for_body_24_reg;
reg [31:0] wide_mult_axi_orig_for_body_27;
reg [31:0] wide_mult_axi_orig_for_body_27_reg;
reg [31:0] wide_mult_axi_orig_for_body_30;
reg [127:0] wide_mult_axi_orig_for_body_bit_concat12;
reg [127:0] wide_mult_axi_orig_for_body_bit_concat12_reg;
reg [31:0] wide_mult_axi_orig_for_body_33;
reg [31:0] wide_mult_axi_orig_for_body_33_reg;
reg [31:0] wide_mult_axi_orig_for_body_36;
reg [63:0] wide_mult_axi_orig_for_body_bit_concat11;
reg [63:0] wide_mult_axi_orig_for_body_bit_concat11_reg;
reg [31:0] wide_mult_axi_orig_for_body_39;
reg [31:0] wide_mult_axi_orig_for_body_39_reg;
reg [31:0] wide_mult_axi_orig_for_body_42;
reg [63:0] wide_mult_axi_orig_for_body_bit_concat10;
reg [63:0] wide_mult_axi_orig_for_body_bit_concat10_reg;
reg [31:0] wide_mult_axi_orig_for_body_45;
reg [31:0] wide_mult_axi_orig_for_body_45_reg;
reg [31:0] wide_mult_axi_orig_for_body_48;
reg [31:0] wide_mult_axi_orig_for_body_48_reg;
reg [31:0] wide_mult_axi_orig_for_body_51;
reg [31:0] wide_mult_axi_orig_for_body_51_reg;
reg [31:0] wide_mult_axi_orig_for_body_54;
reg [127:0] wide_mult_axi_orig_for_body_bit_concat9;
reg [127:0] wide_mult_axi_orig_for_body_bit_concat9_reg;
reg [31:0] wide_mult_axi_orig_for_body_57;
reg [31:0] wide_mult_axi_orig_for_body_57_reg;
reg [31:0] wide_mult_axi_orig_for_body_60;
reg [31:0] wide_mult_axi_orig_for_body_60_reg;
reg [31:0] wide_mult_axi_orig_for_body_63;
reg [31:0] wide_mult_axi_orig_for_body_63_reg;
reg [31:0] wide_mult_axi_orig_for_body_66;
reg [127:0] wide_mult_axi_orig_for_body_bit_concat8;
reg [255:0] wide_mult_axi_orig_for_body_r_val13;
reg [31:0] wide_mult_axi_orig_for_body_bit_select7;
reg [31:0] wide_mult_axi_orig_for_body_bit_select6;
reg [31:0] wide_mult_axi_orig_for_body_bit_select6_reg;
reg [31:0] wide_mult_axi_orig_for_body_bit_select5;
reg [31:0] wide_mult_axi_orig_for_body_bit_select5_reg;
reg [31:0] wide_mult_axi_orig_for_body_bit_select4;
reg [31:0] wide_mult_axi_orig_for_body_bit_select4_reg;
reg [31:0] wide_mult_axi_orig_for_body_bit_select3;
reg [31:0] wide_mult_axi_orig_for_body_bit_select3_reg;
reg [31:0] wide_mult_axi_orig_for_body_bit_select2;
reg [31:0] wide_mult_axi_orig_for_body_bit_select2_reg;
reg [31:0] wide_mult_axi_orig_for_body_bit_select1;
reg [31:0] wide_mult_axi_orig_for_body_bit_select1_reg;
reg [31:0] wide_mult_axi_orig_for_body_bit_select;
reg [31:0] wide_mult_axi_orig_for_body_bit_select_reg;
reg [1:0] wide_mult_axi_orig_for_body_69;
reg [1:0] wide_mult_axi_orig_for_body_70;
reg [1:0] wide_mult_axi_orig_for_body_70_reg;
reg [31:0] wide_mult_axi_orig_for_body_71;
reg [31:0] wide_mult_axi_orig_for_body_71_reg;
reg  wide_mult_axi_orig_for_body_exitcond;
reg  wide_mult_axi_orig_for_body_exitcond_reg;
reg [1:0] wide_mult_axi_orig_for_end_bit_concat;
reg [255:0] memory_controller_0_read_data_a_out_actual;
reg  memory_controller_0_clken_sequential_cond;
wire [4:0] wide_mult_axi_orig_for_body_bit_concat16_bit_select_operand_2;
wire [5:0] wide_mult_axi_orig_for_body_bit_concat14_bit_select_operand_2;
reg  initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a;
reg  initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg;
reg  initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a;
reg  initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a;
reg  initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg;
reg  initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a;
reg  initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a;
reg  initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg;
reg  initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a;
reg  initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a;
reg  initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg;
reg  initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a;
reg  initiator_r_data_consumed_valid;
reg [31:0] initiator_r_data_consumed_data;
reg  initiator_r_data_consumed_taken;
reg  initiator_r_resp_consumed_valid;
reg  initiator_r_resp_consumed_taken;
reg  initiator_r_last_consumed_valid;
reg  initiator_r_last_consumed_taken;
reg  initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a;
reg  initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg;
reg  initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a;
reg  initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a;
reg  initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg;
reg  initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a;
reg  initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a;
reg  initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg;
reg  initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a;
reg  initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a;
reg  initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg;
reg  initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg;
reg  initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg;
reg  initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg;
reg  initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a;
reg  initiator_b_resp_consumed_valid;
reg [1:0] initiator_b_resp_consumed_data;
reg  initiator_b_resp_consumed_taken;
wire [29:0] wide_mult_axi_orig_for_end_bit_concat_bit_select_operand_0;


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
		next_state = LEGUP_F_wide_mult_axi_orig_BB_entry_1;
LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2:
		next_state = LEGUP_function_call_3;
LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_4:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5;
LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_6;
LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_6:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_36;
LEGUP_F_wide_mult_axi_orig_BB_cleanup_38:
		next_state = LEGUP_0;
LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_36:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_37;
LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_37:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_cleanup_38;
LEGUP_F_wide_mult_axi_orig_BB_entry_1:
	if ((fsm_stall == 1'd0) && (wide_mult_axi_orig_entry_0 == 32'd0))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_cleanup_38;
	else if ((fsm_stall == 1'd0) && (wide_mult_axi_orig_entry_0 == 32'd1))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2;
	else if ((fsm_stall == 1'd0) && (wide_mult_axi_orig_entry_0 != 32'd0) && (wide_mult_axi_orig_entry_0 != 32'd1))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7;
LEGUP_F_wide_mult_axi_orig_BB_for_body_10:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_11;
LEGUP_F_wide_mult_axi_orig_BB_for_body_11:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_12;
LEGUP_F_wide_mult_axi_orig_BB_for_body_12:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_13;
LEGUP_F_wide_mult_axi_orig_BB_for_body_13:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_14;
LEGUP_F_wide_mult_axi_orig_BB_for_body_14:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_15;
LEGUP_F_wide_mult_axi_orig_BB_for_body_15:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_16;
LEGUP_F_wide_mult_axi_orig_BB_for_body_16:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_17;
LEGUP_F_wide_mult_axi_orig_BB_for_body_17:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_18;
LEGUP_F_wide_mult_axi_orig_BB_for_body_18:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_19;
LEGUP_F_wide_mult_axi_orig_BB_for_body_19:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_20;
LEGUP_F_wide_mult_axi_orig_BB_for_body_20:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_21;
LEGUP_F_wide_mult_axi_orig_BB_for_body_21:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_22;
LEGUP_F_wide_mult_axi_orig_BB_for_body_22:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_23;
LEGUP_F_wide_mult_axi_orig_BB_for_body_23:
		next_state = LEGUP_function_call_24;
LEGUP_F_wide_mult_axi_orig_BB_for_body_25:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_26;
LEGUP_F_wide_mult_axi_orig_BB_for_body_26:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_27;
LEGUP_F_wide_mult_axi_orig_BB_for_body_27:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_28;
LEGUP_F_wide_mult_axi_orig_BB_for_body_28:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_29;
LEGUP_F_wide_mult_axi_orig_BB_for_body_29:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_30;
LEGUP_F_wide_mult_axi_orig_BB_for_body_30:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_31;
LEGUP_F_wide_mult_axi_orig_BB_for_body_31:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_32;
LEGUP_F_wide_mult_axi_orig_BB_for_body_32:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_33;
LEGUP_F_wide_mult_axi_orig_BB_for_body_33:
	if ((fsm_stall == 1'd0) && (wide_mult_axi_orig_for_body_exitcond_reg == 1'd1))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_end_34;
	else if ((fsm_stall == 1'd0) && (wide_mult_axi_orig_for_body_exitcond_reg == 1'd0))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_8;
LEGUP_F_wide_mult_axi_orig_BB_for_body_8:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_9;
LEGUP_F_wide_mult_axi_orig_BB_for_body_9:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_10;
LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_8;
LEGUP_F_wide_mult_axi_orig_BB_for_end_34:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_end_35;
LEGUP_F_wide_mult_axi_orig_BB_for_end_35:
		next_state = LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_36;
LEGUP_function_call_24:
	if ((fsm_stall == 1'd0) && (wide_mult_finish == 1'd1))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_for_body_25;
LEGUP_function_call_3:
	if ((fsm_stall == 1'd0) && (wide_mult_finish == 1'd1))
		next_state = LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_4;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	fsm_stall = 1'd0;
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_ar_ready)) & (initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_ar_ready)) & (initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_ar_ready)) & (initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_ar_ready)) & (initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23) & ~(initiator_r_data_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23) & ~(initiator_r_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23) & ~(initiator_r_last_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & ~(initiator_aw_ready)) & (initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & ~(initiator_aw_ready)) & (initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & ~(initiator_aw_ready)) & (initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & ~(initiator_aw_ready)) & (initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & ~(initiator_w_ready)) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & ~(initiator_w_ready)) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & ~(initiator_w_ready)) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg))) begin
		fsm_stall = 1'd1;
	end
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & ~(initiator_b_resp_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
end
always @(*) begin
		wide_mult_axi_orig_entry_0 = data_run_read_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_entry_1)) begin
		wide_mult_axi_orig_entry_0_reg <= wide_mult_axi_orig_entry_0;
	end
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_1 = data_A0_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_2 = data_A1_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_3 = data_A2_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_4 = data_A3_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_concat29 = {{{wide_mult_axi_orig_EEcvyEv_exit525_4[31:0], wide_mult_axi_orig_EEcvyEv_exit525_3[31:0]}, wide_mult_axi_orig_EEcvyEv_exit525_2[31:0]}, wide_mult_axi_orig_EEcvyEv_exit525_1[31:0]};
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_5 = data_B0_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_6 = data_B1_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_concat28 = {wide_mult_axi_orig_EEcvyEv_exit525_6[31:0], wide_mult_axi_orig_EEcvyEv_exit525_5[31:0]};
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_7 = data_C0_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_8 = data_C1_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_concat27 = {wide_mult_axi_orig_EEcvyEv_exit525_8[31:0], wide_mult_axi_orig_EEcvyEv_exit525_7[31:0]};
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_9 = data_D0_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_10 = data_D1_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_11 = data_D2_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_12 = data_D3_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_concat26 = {{{wide_mult_axi_orig_EEcvyEv_exit525_12[31:0], wide_mult_axi_orig_EEcvyEv_exit525_11[31:0]}, wide_mult_axi_orig_EEcvyEv_exit525_10[31:0]}, wide_mult_axi_orig_EEcvyEv_exit525_9[31:0]};
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_13 = data_E0_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_14 = data_E1_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_15 = data_E2_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_16 = data_E3_read_data;
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_concat25 = {{{wide_mult_axi_orig_EEcvyEv_exit525_16[31:0], wide_mult_axi_orig_EEcvyEv_exit525_15[31:0]}, wide_mult_axi_orig_EEcvyEv_exit525_14[31:0]}, wide_mult_axi_orig_EEcvyEv_exit525_13[31:0]};
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_17 = memory_controller_0_read_data_a_out_actual[255:0];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select24 = wide_mult_axi_orig_EEcvyEv_exit525_17[31:0];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select23 = wide_mult_axi_orig_EEcvyEv_exit525_17[63:32];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select22 = wide_mult_axi_orig_EEcvyEv_exit525_17[95:64];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select21 = wide_mult_axi_orig_EEcvyEv_exit525_17[127:96];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select20 = wide_mult_axi_orig_EEcvyEv_exit525_17[159:128];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select19 = wide_mult_axi_orig_EEcvyEv_exit525_17[191:160];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select18 = wide_mult_axi_orig_EEcvyEv_exit525_17[223:192];
end
always @(*) begin
		wide_mult_axi_orig_EEcvyEv_exit525_bit_select17 = wide_mult_axi_orig_EEcvyEv_exit525_17[255:224];
end
always @(*) begin
		wide_mult_axi_orig_for_body_lr_ph_18 = data_base_addr_read_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7)) begin
		wide_mult_axi_orig_for_body_lr_ph_18_reg <= wide_mult_axi_orig_for_body_lr_ph_18;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_lr_ph_19 = (wide_mult_axi_orig_for_body_lr_ph_18 + 32'd64);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7)) begin
		wide_mult_axi_orig_for_body_lr_ph_19_reg <= wide_mult_axi_orig_for_body_lr_ph_19;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7) & (fsm_stall == 1'd0))) begin
		wide_mult_axi_orig_for_body_error_0 = 2'd0;
	end
	else /* if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (fsm_stall == 1'd0)) & (wide_mult_axi_orig_for_body_exitcond_reg == 1'd0))) */ begin
		wide_mult_axi_orig_for_body_error_0 = wide_mult_axi_orig_for_body_70;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7) & (fsm_stall == 1'd0))) begin
		wide_mult_axi_orig_for_body_error_0_reg <= wide_mult_axi_orig_for_body_error_0;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (fsm_stall == 1'd0)) & (wide_mult_axi_orig_for_body_exitcond_reg == 1'd0))) begin
		wide_mult_axi_orig_for_body_error_0_reg <= wide_mult_axi_orig_for_body_error_0;
	end
end
always @(*) begin
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7) & (fsm_stall == 1'd0))) begin
		wide_mult_axi_orig_for_body_i_0703 = 32'd0;
	end
	else /* if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (fsm_stall == 1'd0)) & (wide_mult_axi_orig_for_body_exitcond_reg == 1'd0))) */ begin
		wide_mult_axi_orig_for_body_i_0703 = wide_mult_axi_orig_for_body_71_reg;
	end
end
always @(posedge clk) begin
	if (((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_lr_ph_7) & (fsm_stall == 1'd0))) begin
		wide_mult_axi_orig_for_body_i_0703_reg <= wide_mult_axi_orig_for_body_i_0703;
	end
	if ((((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (fsm_stall == 1'd0)) & (wide_mult_axi_orig_for_body_exitcond_reg == 1'd0))) begin
		wide_mult_axi_orig_for_body_i_0703_reg <= wide_mult_axi_orig_for_body_i_0703;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select15 = wide_mult_axi_orig_for_body_i_0703_reg[26:0];
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select13 = wide_mult_axi_orig_for_body_i_0703_reg[25:0];
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat16 = {wide_mult_axi_orig_for_body_bit_select15[26:0], wide_mult_axi_orig_for_body_bit_concat16_bit_select_operand_2[4:0]};
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat14 = {wide_mult_axi_orig_for_body_bit_select13[25:0], wide_mult_axi_orig_for_body_bit_concat14_bit_select_operand_2[5:0]};
end
always @(*) begin
		wide_mult_axi_orig_for_body_sr_add = (wide_mult_axi_orig_for_body_bit_concat16 + wide_mult_axi_orig_for_body_bit_concat14);
end
always @(*) begin
		wide_mult_axi_orig_for_body_addr_0 = (wide_mult_axi_orig_for_body_lr_ph_18_reg + wide_mult_axi_orig_for_body_sr_add);
end
always @(*) begin
		wide_mult_axi_orig_for_body_20 = (wide_mult_axi_orig_for_body_lr_ph_19_reg + wide_mult_axi_orig_for_body_sr_add);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		wide_mult_axi_orig_for_body_20_reg <= wide_mult_axi_orig_for_body_20;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_21 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		wide_mult_axi_orig_for_body_21_reg <= wide_mult_axi_orig_for_body_21;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_24 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9)) begin
		wide_mult_axi_orig_for_body_24_reg <= wide_mult_axi_orig_for_body_24;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_27 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10)) begin
		wide_mult_axi_orig_for_body_27_reg <= wide_mult_axi_orig_for_body_27;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_30 = initiator_r_data_consumed_data;
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat12 = {{{wide_mult_axi_orig_for_body_30[31:0], wide_mult_axi_orig_for_body_27_reg[31:0]}, wide_mult_axi_orig_for_body_24_reg[31:0]}, wide_mult_axi_orig_for_body_21_reg[31:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11)) begin
		wide_mult_axi_orig_for_body_bit_concat12_reg <= wide_mult_axi_orig_for_body_bit_concat12;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_33 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12)) begin
		wide_mult_axi_orig_for_body_33_reg <= wide_mult_axi_orig_for_body_33;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_36 = initiator_r_data_consumed_data;
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat11 = {wide_mult_axi_orig_for_body_36[31:0], wide_mult_axi_orig_for_body_33_reg[31:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13)) begin
		wide_mult_axi_orig_for_body_bit_concat11_reg <= wide_mult_axi_orig_for_body_bit_concat11;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_39 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14)) begin
		wide_mult_axi_orig_for_body_39_reg <= wide_mult_axi_orig_for_body_39;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_42 = initiator_r_data_consumed_data;
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat10 = {wide_mult_axi_orig_for_body_42[31:0], wide_mult_axi_orig_for_body_39_reg[31:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15)) begin
		wide_mult_axi_orig_for_body_bit_concat10_reg <= wide_mult_axi_orig_for_body_bit_concat10;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_45 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16)) begin
		wide_mult_axi_orig_for_body_45_reg <= wide_mult_axi_orig_for_body_45;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_48 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17)) begin
		wide_mult_axi_orig_for_body_48_reg <= wide_mult_axi_orig_for_body_48;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_51 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18)) begin
		wide_mult_axi_orig_for_body_51_reg <= wide_mult_axi_orig_for_body_51;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_54 = initiator_r_data_consumed_data;
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat9 = {{{wide_mult_axi_orig_for_body_54[31:0], wide_mult_axi_orig_for_body_51_reg[31:0]}, wide_mult_axi_orig_for_body_48_reg[31:0]}, wide_mult_axi_orig_for_body_45_reg[31:0]};
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19)) begin
		wide_mult_axi_orig_for_body_bit_concat9_reg <= wide_mult_axi_orig_for_body_bit_concat9;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_57 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20)) begin
		wide_mult_axi_orig_for_body_57_reg <= wide_mult_axi_orig_for_body_57;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_60 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21)) begin
		wide_mult_axi_orig_for_body_60_reg <= wide_mult_axi_orig_for_body_60;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_63 = initiator_r_data_consumed_data;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22)) begin
		wide_mult_axi_orig_for_body_63_reg <= wide_mult_axi_orig_for_body_63;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_66 = initiator_r_data_consumed_data;
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_concat8 = {{{wide_mult_axi_orig_for_body_66[31:0], wide_mult_axi_orig_for_body_63_reg[31:0]}, wide_mult_axi_orig_for_body_60_reg[31:0]}, wide_mult_axi_orig_for_body_57_reg[31:0]};
end
always @(*) begin
		wide_mult_axi_orig_for_body_r_val13 = memory_controller_0_read_data_a_out_actual[255:0];
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select7 = wide_mult_axi_orig_for_body_r_val13[31:0];
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select6 = wide_mult_axi_orig_for_body_r_val13[63:32];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select6_reg <= wide_mult_axi_orig_for_body_bit_select6;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select5 = wide_mult_axi_orig_for_body_r_val13[95:64];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select5_reg <= wide_mult_axi_orig_for_body_bit_select5;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select4 = wide_mult_axi_orig_for_body_r_val13[127:96];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select4_reg <= wide_mult_axi_orig_for_body_bit_select4;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select3 = wide_mult_axi_orig_for_body_r_val13[159:128];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select3_reg <= wide_mult_axi_orig_for_body_bit_select3;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select2 = wide_mult_axi_orig_for_body_r_val13[191:160];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select2_reg <= wide_mult_axi_orig_for_body_bit_select2;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select1 = wide_mult_axi_orig_for_body_r_val13[223:192];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select1_reg <= wide_mult_axi_orig_for_body_bit_select1;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_bit_select = wide_mult_axi_orig_for_body_r_val13[255:224];
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		wide_mult_axi_orig_for_body_bit_select_reg <= wide_mult_axi_orig_for_body_bit_select;
	end
end
always @(*) begin
	wide_mult_axi_orig_for_body_69 = initiator_b_resp_consumed_data;
end
always @(*) begin
		wide_mult_axi_orig_for_body_70 = (wide_mult_axi_orig_for_body_69 | wide_mult_axi_orig_for_body_error_0_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33)) begin
		wide_mult_axi_orig_for_body_70_reg <= wide_mult_axi_orig_for_body_70;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_71 = (wide_mult_axi_orig_for_body_i_0703_reg + 32'd1);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		wide_mult_axi_orig_for_body_71_reg <= wide_mult_axi_orig_for_body_71;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_body_exitcond = (wide_mult_axi_orig_for_body_71 == wide_mult_axi_orig_entry_0_reg);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		wide_mult_axi_orig_for_body_exitcond_reg <= wide_mult_axi_orig_for_body_exitcond;
	end
end
always @(*) begin
		wide_mult_axi_orig_for_end_bit_concat = {wide_mult_axi_orig_for_end_bit_concat_bit_select_operand_0[29:0], wide_mult_axi_orig_for_body_70_reg[1:0]};
end
always @(*) begin
	memory_controller_0_read_data_a_out_actual = memory_controller_0_read_data_a;
end
always @(*) begin
	memory_controller_0_clken_sequential_cond = (~(fsm_stall) & (cur_state != LEGUP_0));
end
assign wide_mult_axi_orig_for_body_bit_concat16_bit_select_operand_2 = 5'd0;
assign wide_mult_axi_orig_for_body_bit_concat14_bit_select_operand_2 = 6'd0;
always @(posedge clk) begin
	initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_ar_valid) & ~(initiator_ar_ready));
end
always @(posedge clk) begin
	initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & (initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg));
end
always @(posedge clk) begin
	initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_ar_valid) & ~(initiator_ar_ready));
end
always @(posedge clk) begin
	initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & (initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg));
end
always @(posedge clk) begin
	initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_ar_valid) & ~(initiator_ar_ready));
end
always @(posedge clk) begin
	initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & (initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg));
end
always @(posedge clk) begin
	initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_ar_valid) & ~(initiator_ar_ready));
end
always @(posedge clk) begin
	initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8) & (initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_not_accessed_due_to_stall_a | initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_stalln_reg));
end
always @(posedge clk) begin
	if (initiator_r_data_consumed_taken) begin
		initiator_r_data_consumed_valid <= 1'd0;
	end
	if ((initiator_r_ready & initiator_r_valid)) begin
		initiator_r_data_consumed_valid <= 1'd1;
	end
	if (reset) begin
		initiator_r_data_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((initiator_r_ready & initiator_r_valid)) begin
		initiator_r_data_consumed_data <= initiator_r_data;
	end
	if (reset) begin
		initiator_r_data_consumed_data <= 1'd0;
	end
end
always @(*) begin
	initiator_r_data_consumed_taken = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		initiator_r_data_consumed_taken = ~(fsm_stall);
	end
end
always @(posedge clk) begin
	if (initiator_r_resp_consumed_taken) begin
		initiator_r_resp_consumed_valid <= 1'd0;
	end
	if ((initiator_r_ready & initiator_r_valid)) begin
		initiator_r_resp_consumed_valid <= 1'd1;
	end
	if (reset) begin
		initiator_r_resp_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	initiator_r_resp_consumed_taken = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		initiator_r_resp_consumed_taken = ~(fsm_stall);
	end
end
always @(posedge clk) begin
	if (initiator_r_last_consumed_taken) begin
		initiator_r_last_consumed_valid <= 1'd0;
	end
	if ((initiator_r_ready & initiator_r_valid)) begin
		initiator_r_last_consumed_valid <= 1'd1;
	end
	if (reset) begin
		initiator_r_last_consumed_valid <= 1'd0;
	end
end
always @(*) begin
	initiator_r_last_consumed_taken = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_9)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_10)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_11)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_12)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_13)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_14)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_15)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_16)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_17)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_18)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_19)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_20)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_21)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_22)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		initiator_r_last_consumed_taken = ~(fsm_stall);
	end
end
always @(posedge clk) begin
	initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_aw_valid) & ~(initiator_aw_ready));
end
always @(posedge clk) begin
	initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & (initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg));
end
always @(posedge clk) begin
	initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_aw_valid) & ~(initiator_aw_ready));
end
always @(posedge clk) begin
	initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & (initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg));
end
always @(posedge clk) begin
	initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_aw_valid) & ~(initiator_aw_ready));
end
always @(posedge clk) begin
	initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & (initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg));
end
always @(posedge clk) begin
	initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_aw_valid) & ~(initiator_aw_ready));
end
always @(posedge clk) begin
	initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25) & (initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_not_accessed_due_to_stall_a | initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a | initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a | initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a <= ((fsm_stall & initiator_w_valid) & ~(initiator_w_ready));
end
always @(posedge clk) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a = ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33) & (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_not_accessed_due_to_stall_a | initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_stalln_reg));
end
always @(posedge clk) begin
	if (initiator_b_resp_consumed_taken) begin
		initiator_b_resp_consumed_valid <= 1'd0;
	end
	if ((initiator_b_resp_ready & initiator_b_resp_valid)) begin
		initiator_b_resp_consumed_valid <= 1'd1;
	end
	if (reset) begin
		initiator_b_resp_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((initiator_b_resp_ready & initiator_b_resp_valid)) begin
		initiator_b_resp_consumed_data <= initiator_b_resp;
	end
	if (reset) begin
		initiator_b_resp_consumed_data <= 1'd0;
	end
end
always @(*) begin
	initiator_b_resp_consumed_taken = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33)) begin
		initiator_b_resp_consumed_taken = ~(fsm_stall);
	end
end
assign wide_mult_axi_orig_for_end_bit_concat_bit_select_operand_0 = 30'd0;
always @(*) begin
	ready = (cur_state == LEGUP_0);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_cleanup_38)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if (reset) begin
		wide_mult_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_3) & ~(fsm_stall))) begin
		wide_mult_start <= 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_start <= 1'd1;
	end
	if (((cur_state == LEGUP_function_call_24) & ~(fsm_stall))) begin
		wide_mult_start <= 1'd0;
	end
end
always @(posedge clk) begin
	wide_mult_agg_result <= 0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_agg_result <= `TAG_wide_mult_axi_orig_entry_ref_tmp_a;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_agg_result <= `TAG_wide_mult_axi_orig_entry_r_a;
	end
end
always @(posedge clk) begin
	wide_mult_A_val <= 128'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_A_val <= wide_mult_axi_orig_EEcvyEv_exit525_bit_concat29;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_A_val <= wide_mult_axi_orig_for_body_bit_concat12_reg;
	end
end
always @(posedge clk) begin
	wide_mult_B_val <= 64'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_B_val <= wide_mult_axi_orig_EEcvyEv_exit525_bit_concat28;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_B_val <= wide_mult_axi_orig_for_body_bit_concat11_reg;
	end
end
always @(posedge clk) begin
	wide_mult_C_val <= 64'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_C_val <= wide_mult_axi_orig_EEcvyEv_exit525_bit_concat27;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_C_val <= wide_mult_axi_orig_for_body_bit_concat10_reg;
	end
end
always @(posedge clk) begin
	wide_mult_D_val <= 128'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_D_val <= wide_mult_axi_orig_EEcvyEv_exit525_bit_concat26;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_D_val <= wide_mult_axi_orig_for_body_bit_concat9_reg;
	end
end
always @(posedge clk) begin
	wide_mult_E_val <= 128'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_2)) begin
		wide_mult_E_val <= wide_mult_axi_orig_EEcvyEv_exit525_bit_concat25;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_23)) begin
		wide_mult_E_val <= wide_mult_axi_orig_for_body_bit_concat8;
	end
end
always @(*) begin
	data_run_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_36)) begin
		data_run_write_en = 1'd1;
	end
end
always @(*) begin
	data_run_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_cleanup_storemerge_36)) begin
		data_run_write_data = 32'd0;
	end
end
assign data_A0_write_en = 1'd0;
assign data_A0_write_data = 1'd0;
assign data_A1_write_en = 1'd0;
assign data_A1_write_data = 1'd0;
assign data_A2_write_en = 1'd0;
assign data_A2_write_data = 1'd0;
assign data_A3_write_en = 1'd0;
assign data_A3_write_data = 1'd0;
assign data_B0_write_en = 1'd0;
assign data_B0_write_data = 1'd0;
assign data_B1_write_en = 1'd0;
assign data_B1_write_data = 1'd0;
assign data_C0_write_en = 1'd0;
assign data_C0_write_data = 1'd0;
assign data_C1_write_en = 1'd0;
assign data_C1_write_data = 1'd0;
assign data_D0_write_en = 1'd0;
assign data_D0_write_data = 1'd0;
assign data_D1_write_en = 1'd0;
assign data_D1_write_data = 1'd0;
assign data_D2_write_en = 1'd0;
assign data_D2_write_data = 1'd0;
assign data_D3_write_en = 1'd0;
assign data_D3_write_data = 1'd0;
assign data_E0_write_en = 1'd0;
assign data_E0_write_data = 1'd0;
assign data_E1_write_en = 1'd0;
assign data_E1_write_data = 1'd0;
assign data_E2_write_en = 1'd0;
assign data_E2_write_data = 1'd0;
assign data_E3_write_en = 1'd0;
assign data_E3_write_data = 1'd0;
always @(*) begin
	memory_controller_0_clken = memory_controller_0_clken_sequential_cond;
end
always @(*) begin
	memory_controller_0_write_en_a = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		memory_controller_0_write_en_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_0_write_data_a = 256'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		memory_controller_0_write_data_a = wide_mult_axi_orig_EEcvyEv_exit525_17;
	end
end
always @(*) begin
	memory_controller_0_read_en_a = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_4)) begin
		memory_controller_0_read_en_a = 1'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		memory_controller_0_read_en_a = 1'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		memory_controller_0_read_en_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_0_address_a = 0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_4)) begin
		memory_controller_0_address_a = `TAG_wide_mult_axi_orig_entry_ref_tmp_a;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		memory_controller_0_address_a = `TAG_wide_mult_axi_orig_entry_r_a;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		memory_controller_0_address_a = `TAG_wide_mult_axi_orig_entry_r_a;
	end
end
always @(*) begin
	memory_controller_0_size_a = 2'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_4)) begin
		memory_controller_0_size_a = 2'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		memory_controller_0_size_a = 2'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		memory_controller_0_size_a = 2'd0;
	end
end
assign memory_controller_0_write_en_b = 1'd0;
assign memory_controller_0_write_data_b = 256'd0;
assign memory_controller_0_read_en_b = 1'd0;
assign memory_controller_0_address_b = 0;
assign memory_controller_0_size_b = 2'd0;
always @(*) begin
	data_result0_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result0_write_en = 1'd1;
	end
end
always @(*) begin
	data_result0_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result0_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select24;
	end
end
always @(*) begin
	data_result1_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result1_write_en = 1'd1;
	end
end
always @(*) begin
	data_result1_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result1_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select23;
	end
end
always @(*) begin
	data_result2_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result2_write_en = 1'd1;
	end
end
always @(*) begin
	data_result2_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result2_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select22;
	end
end
always @(*) begin
	data_result3_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result3_write_en = 1'd1;
	end
end
always @(*) begin
	data_result3_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result3_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select21;
	end
end
always @(*) begin
	data_result4_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result4_write_en = 1'd1;
	end
end
always @(*) begin
	data_result4_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result4_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select20;
	end
end
always @(*) begin
	data_result5_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result5_write_en = 1'd1;
	end
end
always @(*) begin
	data_result5_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result5_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select19;
	end
end
always @(*) begin
	data_result6_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result6_write_en = 1'd1;
	end
end
always @(*) begin
	data_result6_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result6_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select18;
	end
end
always @(*) begin
	data_result7_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result7_write_en = 1'd1;
	end
end
always @(*) begin
	data_result7_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_ZNK3hls10ap_num_refIRNS_6ap_numILj256EEEEcvyEv_exit525_5)) begin
		data_result7_write_data = wide_mult_axi_orig_EEcvyEv_exit525_bit_select17;
	end
end
assign data_base_addr_write_en = 1'd0;
assign data_base_addr_write_data = 1'd0;
always @(*) begin
	initiator_ar_addr = 0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_ar_addr = wide_mult_axi_orig_for_body_addr_0;
	end
end
always @(*) begin
	initiator_ar_valid = 1'd0;
	if (initiator_ar_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a) begin
		initiator_ar_valid = 1'd1;
	end
	if (initiator_ar_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a) begin
		initiator_ar_valid = 1'd1;
	end
	if (initiator_ar_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a) begin
		initiator_ar_valid = 1'd1;
	end
	if (initiator_ar_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_8_enable_cond_a) begin
		initiator_ar_valid = 1'd1;
	end
end
always @(*) begin
	initiator_ar_burst = 2'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_ar_burst = 2'd1;
	end
end
always @(*) begin
	initiator_ar_size = 3'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_ar_size = 3'd2;
	end
end
always @(*) begin
	initiator_ar_len = 8'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_8)) begin
		initiator_ar_len = 8'd15;
	end
end
always @(*) begin
	initiator_r_ready = (~(initiator_r_last_consumed_valid) | initiator_r_last_consumed_taken);
	if (reset) begin
		initiator_r_ready = 1'd0;
	end
	if (reset) begin
		initiator_r_ready = 1'd0;
	end
	if (reset) begin
		initiator_r_ready = 1'd0;
	end
end
always @(*) begin
	initiator_aw_addr = 0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		initiator_aw_addr = wide_mult_axi_orig_for_body_20_reg;
	end
end
always @(*) begin
	initiator_aw_valid = 1'd0;
	if (initiator_aw_addr_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a) begin
		initiator_aw_valid = 1'd1;
	end
	if (initiator_aw_burst_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a) begin
		initiator_aw_valid = 1'd1;
	end
	if (initiator_aw_size_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a) begin
		initiator_aw_valid = 1'd1;
	end
	if (initiator_aw_len_LEGUP_F_wide_mult_axi_orig_BB_for_body_25_enable_cond_a) begin
		initiator_aw_valid = 1'd1;
	end
end
always @(*) begin
	initiator_aw_burst = 2'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		initiator_aw_burst = 2'd1;
	end
end
always @(*) begin
	initiator_aw_size = 3'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		initiator_aw_size = 3'd2;
	end
end
always @(*) begin
	initiator_aw_len = 8'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_25)) begin
		initiator_aw_len = 8'd7;
	end
end
always @(*) begin
	initiator_w_data = 0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select7;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select6_reg;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select5_reg;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select4_reg;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select3_reg;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select2_reg;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select1_reg;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33)) begin
		initiator_w_data = wide_mult_axi_orig_for_body_bit_select_reg;
	end
end
always @(*) begin
	initiator_w_valid = 1'd0;
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_26_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_27_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_28_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_29_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_30_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_31_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_32_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_data_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_strb_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
	if (initiator_w_last_LEGUP_F_wide_mult_axi_orig_BB_for_body_33_enable_cond_a) begin
		initiator_w_valid = 1'd1;
	end
end
always @(*) begin
	initiator_w_strb = 4'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32)) begin
		initiator_w_strb = -4'd1;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33)) begin
		initiator_w_strb = -4'd1;
	end
end
always @(*) begin
	initiator_w_last = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_26)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_27)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_28)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_29)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_30)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_31)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_32)) begin
		initiator_w_last = 1'd0;
	end
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_body_33)) begin
		initiator_w_last = 1'd1;
	end
end
always @(*) begin
	initiator_b_resp_ready = (~(initiator_b_resp_consumed_valid) | initiator_b_resp_consumed_taken);
	if (reset) begin
		initiator_b_resp_ready = 1'd0;
	end
end
always @(*) begin
	data_error_write_en = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_end_34)) begin
		data_error_write_en = 1'd1;
	end
end
always @(*) begin
	data_error_write_data = 1'd0;
	if ((cur_state == LEGUP_F_wide_mult_axi_orig_BB_for_end_34)) begin
		data_error_write_data = {30'd0,wide_mult_axi_orig_for_end_bit_concat};
	end
end

endmodule
`timescale 1 ns / 1 ns
module data_write
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
	data_ctrl_write_en,
	data_ctrl_write_data,
	data_ctrl_read_data,
	data_run_write_en,
	data_run_write_data,
	data_run_read_data,
	data_error_write_en,
	data_error_write_data,
	data_error_read_data,
	data_result1_write_en,
	data_result1_write_data,
	data_result1_read_data,
	data_result3_write_en,
	data_result3_write_data,
	data_result3_read_data,
	data_result5_write_en,
	data_result5_write_data,
	data_result5_read_data,
	data_result7_write_en,
	data_result7_write_data,
	data_result7_read_data,
	data_A1_write_en,
	data_A1_write_data,
	data_A1_read_data,
	data_A3_write_en,
	data_A3_write_data,
	data_A3_read_data,
	data_B1_write_en,
	data_B1_write_data,
	data_B1_read_data,
	data_C1_write_en,
	data_C1_write_data,
	data_C1_read_data,
	data_D1_write_en,
	data_D1_write_data,
	data_D1_read_data,
	data_D3_write_en,
	data_D3_write_data,
	data_D3_read_data,
	data_E1_write_en,
	data_E1_write_data,
	data_E1_read_data,
	data_E3_write_en,
	data_E3_write_data,
	data_E3_read_data,
	data_base_addr_write_en,
	data_base_addr_write_data,
	data_base_addr_read_data,
	data_result0_write_en,
	data_result0_write_data,
	data_result0_read_data,
	data_result2_write_en,
	data_result2_write_data,
	data_result2_read_data,
	data_result4_write_en,
	data_result4_write_data,
	data_result4_read_data,
	data_result6_write_en,
	data_result6_write_data,
	data_result6_read_data,
	data_A0_write_en,
	data_A0_write_data,
	data_A0_read_data,
	data_A2_write_en,
	data_A2_write_data,
	data_A2_read_data,
	data_B0_write_en,
	data_B0_write_data,
	data_B0_read_data,
	data_C0_write_en,
	data_C0_write_data,
	data_C0_read_data,
	data_D0_write_en,
	data_D0_write_data,
	data_D0_read_data,
	data_D2_write_en,
	data_D2_write_data,
	data_D2_read_data,
	data_E0_write_en,
	data_E0_write_data,
	data_E0_read_data,
	data_E2_write_en,
	data_E2_write_data,
	data_E2_read_data,
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
output reg  data_ctrl_write_en;
output reg  data_ctrl_write_data;
input  data_ctrl_read_data;
output reg  data_run_write_en;
output reg [31:0] data_run_write_data;
input [31:0] data_run_read_data;
output reg  data_error_write_en;
output reg [31:0] data_error_write_data;
input [31:0] data_error_read_data;
output reg  data_result1_write_en;
output reg [31:0] data_result1_write_data;
input [31:0] data_result1_read_data;
output reg  data_result3_write_en;
output reg [31:0] data_result3_write_data;
input [31:0] data_result3_read_data;
output reg  data_result5_write_en;
output reg [31:0] data_result5_write_data;
input [31:0] data_result5_read_data;
output reg  data_result7_write_en;
output reg [31:0] data_result7_write_data;
input [31:0] data_result7_read_data;
output reg  data_A1_write_en;
output reg [31:0] data_A1_write_data;
input [31:0] data_A1_read_data;
output reg  data_A3_write_en;
output reg [31:0] data_A3_write_data;
input [31:0] data_A3_read_data;
output reg  data_B1_write_en;
output reg [31:0] data_B1_write_data;
input [31:0] data_B1_read_data;
output reg  data_C1_write_en;
output reg [31:0] data_C1_write_data;
input [31:0] data_C1_read_data;
output reg  data_D1_write_en;
output reg [31:0] data_D1_write_data;
input [31:0] data_D1_read_data;
output reg  data_D3_write_en;
output reg [31:0] data_D3_write_data;
input [31:0] data_D3_read_data;
output reg  data_E1_write_en;
output reg [31:0] data_E1_write_data;
input [31:0] data_E1_read_data;
output reg  data_E3_write_en;
output reg [31:0] data_E3_write_data;
input [31:0] data_E3_read_data;
output reg  data_base_addr_write_en;
output reg [31:0] data_base_addr_write_data;
input [31:0] data_base_addr_read_data;
output reg  data_result0_write_en;
output reg [31:0] data_result0_write_data;
input [31:0] data_result0_read_data;
output reg  data_result2_write_en;
output reg [31:0] data_result2_write_data;
input [31:0] data_result2_read_data;
output reg  data_result4_write_en;
output reg [31:0] data_result4_write_data;
input [31:0] data_result4_read_data;
output reg  data_result6_write_en;
output reg [31:0] data_result6_write_data;
input [31:0] data_result6_read_data;
output reg  data_A0_write_en;
output reg [31:0] data_A0_write_data;
input [31:0] data_A0_read_data;
output reg  data_A2_write_en;
output reg [31:0] data_A2_write_data;
input [31:0] data_A2_read_data;
output reg  data_B0_write_en;
output reg [31:0] data_B0_write_data;
input [31:0] data_B0_read_data;
output reg  data_C0_write_en;
output reg [31:0] data_C0_write_data;
input [31:0] data_C0_read_data;
output reg  data_D0_write_en;
output reg [31:0] data_D0_write_data;
input [31:0] data_D0_read_data;
output reg  data_D2_write_en;
output reg [31:0] data_D2_write_data;
input [31:0] data_D2_read_data;
output reg  data_E0_write_en;
output reg [31:0] data_E0_write_data;
input [31:0] data_E0_read_data;
output reg  data_E2_write_en;
output reg [31:0] data_E2_write_data;
input [31:0] data_E2_read_data;
output [1:0] s_b_resp;
input  s_b_resp_ready;
output reg  s_b_resp_valid;
reg  data_write_init_check_i_0;
reg [31:0] data_write_init_check_i_1;
reg [7:0] data_write_init_check_i_2;
reg  data_write_init_check_i_CaseCmpExitMask;
wire  data_write_init_check_i_3;
reg  data_write_init_check_i_exitMask_T;
reg  data_write_init_check_i_NotCondition;
reg  data_write_init_check_i_exitMask_F;
wire  data_write_init_check_i_4;
reg  data_write_init_check_i_exitMask_T2;
reg  data_write_init_check_i_NotCondition3;
reg  data_write_init_check_i_exitMask_F4;
reg [31:0] data_write_init_check_i_5;
reg [28:0] data_write_init_check_i_bit_select11;
reg [28:0] data_write_init_check_i_bit_concat12;
reg [63:0] data_write_init_check_i_9;
reg  data_write_init_check_i_bit_select2;
reg [31:0] data_write_init_check_i_bit_select1;
reg [31:0] data_write_init_check_i_bit_select;
reg [7:0] data_write_init_check_i_10;
reg [1:0] data_write_init_check_i_bit_select8;
reg [3:0] data_write_init_check_i_bit_select6;
reg  data_write_init_check_i_11;
reg  data_write_init_check_i_not_1;
reg [7:0] data_write_init_check_i_bit_concat10;
reg [31:0] data_write_init_check_i_12;
reg [3:0] data_write_init_check_i_bit_select4;
reg  data_write_init_check_i_cmp_i;
reg [5:0] data_write_init_check_i_bit_concat9;
reg  data_write_init_check_i_cmp43_i;
reg  data_write_init_check_i_and374_i;
reg [3:0] data_write_init_check_i_bit_concat7;
reg  data_write_init_check_i_13;
reg [3:0] data_write_init_check_i_bit_concat5;
reg  data_write_init_check_i_CaseCmpExitMask5;
reg  data_write_init_check_i_CaseCmpExitMask6;
reg  data_write_init_check_i_CaseCmpExitMask7;
reg  data_write_init_check_i_CaseCmpExitMask8;
reg  data_write_init_check_i_CaseCmpExitMask9;
reg  data_write_init_check_i_CaseCmpExitMask10;
reg  data_write_init_check_i_CaseCmpExitMask11;
reg  data_write_init_check_i_CaseCmpExitMask12;
reg  data_write_init_check_i_CaseCmpExitMask13;
reg  data_write_init_check_i_CaseCmpExitMask14;
reg  data_write_init_check_i_CaseCmpExitMask15;
reg  data_write_init_check_i_CaseCmpExitMask16;
reg  data_write_init_check_i_CaseCmpExitMask17;
reg  data_write_init_check_i_CaseCmpExitMask18;
reg  data_write_init_check_i_CaseCmpExitMask19;
reg  data_write_init_check_i_CaseCmpExitMask5_AndEntryM;
reg  data_write_init_check_i_CaseCmpExitMask6_AndEntryM;
reg  data_write_init_check_i_CaseCmpExitMask7_AndEntryM;
reg  data_write_init_check_i_CaseCmpExitMask8_AndEntryM;
reg  data_write_init_check_i_CaseCmpExitMask9_AndEntryM;
reg  data_write_init_check_i_CaseCmpExitMask10_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask11_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask12_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask13_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask14_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask15_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask16_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask17_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask18_AndEntry;
reg  data_write_init_check_i_CaseCmpExitMask19_AndEntry;
reg  data_write_init_check_i_exitMask_T35;
reg  data_write_init_check_i_exitMask_T38;
reg  data_write_init_check_i_exitMask_T41;
reg  data_write_init_check_i_exitMask_T44;
reg  data_write_init_check_i_exitMask_T47;
reg  data_write_init_check_i_exitMask_T50;
reg  data_write_init_check_i_exitMask_T53;
reg  data_write_init_check_i_exitMask_T56;
reg  data_write_init_check_i_exitMask_T59;
reg  data_write_init_check_i_exitMask_T62;
reg  data_write_init_check_i_exitMask_T65;
reg  data_write_init_check_i_exitMask_T68;
reg  data_write_init_check_i_exitMask_T71;
reg  data_write_init_check_i_exitMask_T74;
reg  data_write_init_check_i_bit_concat3;
reg  data_write_init_check_i_14;
reg  data_write_init_check_i_exitMask_T77;
reg  data_write_init_check_i_exitMask_T80;
reg  data_write_init_check_i_exitMask_T83;
reg  data_write_init_check_i_exitMask_T86;
reg  data_write_init_check_i_exitMask_T89;
reg  data_write_init_check_i_exitMask_T92;
reg  data_write_init_check_i_exitMask_T95;
reg  data_write_init_check_i_exitMask_T98;
reg  data_write_init_check_i_exitMask_T101;
reg  data_write_init_check_i_exitMask_T104;
reg  data_write_init_check_i_exitMask_T107;
reg  data_write_init_check_i_exitMask_T110;
reg  data_write_init_check_i_exitMask_T113;
reg  data_write_init_check_i_exitMask_T116;
reg  data_write_init_check_i_select142;
reg  data_write_init_check_i_1_var1;
reg  data_write_init_check_i_select144;
reg  data_write_init_check_i_select146;
reg [31:0] data_write_init_check_i_select132;
reg [31:0] data_write_init_check_i_select136;
reg [7:0] data_write_init_check_i_select122;
reg  data_write_init_check_i_bit_concat;
reg  data_write_init_check_i_15;
reg [7:0] data_write_init_check_i_select124;
reg [7:0] data_write_init_check_i_select126;
reg  axi_s_write_state_inferred_reg;
reg [31:0] axi_s_write_word_addr_inferred_reg;
reg [7:0] axi_s_write_count_inferred_reg;
reg  data_write_valid_bit_0;
reg  data_write_state_stall_0;
reg  data_write_state_enable_0;
reg  data_write_valid_bit_1;
reg  data_write_state_stall_1;
reg  data_write_state_enable_1;
reg  data_write_valid_bit_2;
wire  data_write_state_stall_2;
reg  data_write_state_enable_2;
reg  data_write_II_counter;
reg  data_write_init_check_i_0_reg_stage1;
reg  data_write_init_check_i_exitMask_T_reg_stage1;
reg  data_write_init_check_i_exitMask_F4_reg_stage1;
reg [28:0] data_write_init_check_i_bit_concat12_reg_stage1;
reg [31:0] data_write_init_check_i_bit_select1_reg_stage1;
reg [31:0] data_write_init_check_i_bit_select_reg_stage1;
reg [7:0] data_write_init_check_i_bit_concat10_reg_stage1;
reg  data_write_init_check_i_and374_i_reg_stage1;
reg  data_write_init_check_i_13_reg_stage1;
reg  data_write_init_check_i_14_reg_stage1;
reg  data_write_init_check_i_exitMask_T116_reg_stage1;
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
wire [2:0] data_write_init_check_i_bit_concat12_bit_select_operand_0;
reg  axi_s_w_strb_consumed_valid;
reg [7:0] axi_s_w_strb_consumed_data;
reg  axi_s_w_strb_consumed_taken;
reg  axi_s_w_last_consumed_valid;
reg  axi_s_w_last_consumed_data;
reg  axi_s_w_last_consumed_taken;
wire [23:0] data_write_init_check_i_bit_concat10_bit_select_operand_0;
wire [1:0] data_write_init_check_i_bit_concat9_bit_select_operand_0;
wire [3:0] data_write_init_check_i_bit_concat9_bit_select_operand_4;
wire [3:0] data_write_init_check_i_bit_concat7_bit_select_operand_0;
wire [27:0] data_write_init_check_i_bit_concat5_bit_select_operand_0;
wire [62:0] data_write_init_check_i_bit_concat3_bit_select_operand_0;
reg  axi_s_b_resp_data_write_state_1_not_accessed_due_to_stall_a;
reg  axi_s_b_resp_data_write_state_1_stalln_reg;
reg  axi_s_b_resp_data_write_state_1_enable_cond_a;
wire [6:0] data_write_init_check_i_bit_concat_bit_select_operand_0;


always @(*) begin
		data_write_init_check_i_0 = axi_s_write_state_inferred_reg;
end
always @(*) begin
		data_write_init_check_i_1 = axi_s_write_word_addr_inferred_reg;
end
always @(*) begin
		data_write_init_check_i_2 = axi_s_write_count_inferred_reg;
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask = (data_write_init_check_i_0 ^ 1'd1);
end
assign data_write_init_check_i_3 = ~(axi_s_aw_addr_consumed_valid);
always @(*) begin
		data_write_init_check_i_exitMask_T = (data_write_init_check_i_3 & data_write_init_check_i_CaseCmpExitMask);
end
always @(*) begin
		data_write_init_check_i_NotCondition = (data_write_init_check_i_3 ^ 1'd1);
end
always @(*) begin
		data_write_init_check_i_exitMask_F = (data_write_init_check_i_CaseCmpExitMask & data_write_init_check_i_NotCondition);
end
assign data_write_init_check_i_4 = ~(axi_s_w_data_consumed_valid);
always @(*) begin
		data_write_init_check_i_exitMask_T2 = (data_write_init_check_i_0 & data_write_init_check_i_4);
end
always @(*) begin
		data_write_init_check_i_NotCondition3 = (data_write_init_check_i_4 ^ 1'd1);
end
always @(*) begin
		data_write_init_check_i_exitMask_F4 = (data_write_init_check_i_0 & data_write_init_check_i_NotCondition3);
end
always @(*) begin
	data_write_init_check_i_5 = axi_s_aw_addr_consumed_data;
end
always @(*) begin
		data_write_init_check_i_bit_select11 = data_write_init_check_i_5[31:3];
end
always @(*) begin
		data_write_init_check_i_bit_concat12 = {data_write_init_check_i_bit_concat12_bit_select_operand_0[2:0], data_write_init_check_i_bit_select11[28:0]};
end
always @(*) begin
	data_write_init_check_i_9 = axi_s_w_data_consumed_data;
end
always @(*) begin
		data_write_init_check_i_bit_select2 = data_write_init_check_i_9[0];
end
always @(*) begin
		data_write_init_check_i_bit_select1 = data_write_init_check_i_9[31:0];
end
always @(*) begin
		data_write_init_check_i_bit_select = data_write_init_check_i_9[63:32];
end
always @(*) begin
	data_write_init_check_i_10 = axi_s_w_strb_consumed_data;
end
always @(*) begin
		data_write_init_check_i_bit_select8 = data_write_init_check_i_10[5:4];
end
always @(*) begin
		data_write_init_check_i_bit_select6 = data_write_init_check_i_10[3:0];
end
always @(*) begin
	data_write_init_check_i_11 = axi_s_w_last_consumed_data;
end
always @(*) begin
		data_write_init_check_i_not_1 = (data_write_init_check_i_11 ^ 1'd1);
end
always @(*) begin
		data_write_init_check_i_bit_concat10 = {data_write_init_check_i_bit_concat10_bit_select_operand_0[23:0], data_write_init_check_i_2[7:0]};
end
always @(*) begin
		data_write_init_check_i_12 = (data_write_init_check_i_1 + {24'd0,data_write_init_check_i_bit_concat10_reg_stage1});
end
always @(*) begin
		data_write_init_check_i_bit_select4 = data_write_init_check_i_12[3:0];
end
always @(*) begin
		data_write_init_check_i_cmp_i = (data_write_init_check_i_10 > -8'd65);
end
always @(*) begin
		data_write_init_check_i_bit_concat9 = {{data_write_init_check_i_bit_concat9_bit_select_operand_0[1:0], data_write_init_check_i_bit_select8[1:0]}, data_write_init_check_i_bit_concat9_bit_select_operand_4[3:0]};
end
always @(*) begin
		data_write_init_check_i_cmp43_i = ({2'd0,data_write_init_check_i_bit_concat9} == 8'd48);
end
always @(*) begin
		data_write_init_check_i_and374_i = (data_write_init_check_i_cmp_i & data_write_init_check_i_cmp43_i);
end
always @(*) begin
		data_write_init_check_i_bit_concat7 = {data_write_init_check_i_bit_concat7_bit_select_operand_0[3:0], data_write_init_check_i_bit_select6[3:0]};
end
always @(*) begin
		data_write_init_check_i_13 = ({4'd0,data_write_init_check_i_bit_concat7} == 8'd15);
end
always @(*) begin
		data_write_init_check_i_bit_concat5 = {data_write_init_check_i_bit_concat5_bit_select_operand_0[27:0], data_write_init_check_i_bit_select4[3:0]};
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask5 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd0);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask6 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd1);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask7 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd2);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask8 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd3);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask9 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd4);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask10 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd5);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask11 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd6);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask12 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd7);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask13 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd8);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask14 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd9);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask15 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd10);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask16 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd11);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask17 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd12);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask18 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd13);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask19 = ({28'd0,data_write_init_check_i_bit_concat5} == 32'd14);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask5_AndEntryM = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask5);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask6_AndEntryM = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask6);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask7_AndEntryM = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask7);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask8_AndEntryM = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask8);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask9_AndEntryM = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask9);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask10_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask10);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask11_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask11);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask12_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask12);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask13_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask13);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask14_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask14);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask15_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask15);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask16_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask16);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask17_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask17);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask18_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask18);
end
always @(*) begin
		data_write_init_check_i_CaseCmpExitMask19_AndEntry = (data_write_init_check_i_exitMask_F4_reg_stage1 & data_write_init_check_i_CaseCmpExitMask19);
end
always @(*) begin
		data_write_init_check_i_exitMask_T35 = (data_write_init_check_i_CaseCmpExitMask5_AndEntryM & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T38 = (data_write_init_check_i_CaseCmpExitMask6_AndEntryM & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T41 = (data_write_init_check_i_CaseCmpExitMask7_AndEntryM & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T44 = (data_write_init_check_i_CaseCmpExitMask8_AndEntryM & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T47 = (data_write_init_check_i_CaseCmpExitMask9_AndEntryM & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T50 = (data_write_init_check_i_CaseCmpExitMask10_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T53 = (data_write_init_check_i_CaseCmpExitMask11_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T56 = (data_write_init_check_i_CaseCmpExitMask12_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T59 = (data_write_init_check_i_CaseCmpExitMask13_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T62 = (data_write_init_check_i_CaseCmpExitMask14_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T65 = (data_write_init_check_i_CaseCmpExitMask15_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T68 = (data_write_init_check_i_CaseCmpExitMask16_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T71 = (data_write_init_check_i_CaseCmpExitMask17_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T74 = (data_write_init_check_i_CaseCmpExitMask18_AndEntry & data_write_init_check_i_13_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_bit_concat3 = {data_write_init_check_i_bit_concat3_bit_select_operand_0[62:0], data_write_init_check_i_bit_select2};
end
always @(*) begin
		data_write_init_check_i_14 = (data_write_init_check_i_bit_concat3 != 64'd0);
end
always @(*) begin
		data_write_init_check_i_exitMask_T77 = (data_write_init_check_i_CaseCmpExitMask5_AndEntryM & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T80 = (data_write_init_check_i_CaseCmpExitMask6_AndEntryM & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T83 = (data_write_init_check_i_CaseCmpExitMask7_AndEntryM & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T86 = (data_write_init_check_i_CaseCmpExitMask8_AndEntryM & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T89 = (data_write_init_check_i_CaseCmpExitMask9_AndEntryM & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T92 = (data_write_init_check_i_CaseCmpExitMask10_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T95 = (data_write_init_check_i_CaseCmpExitMask11_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T98 = (data_write_init_check_i_CaseCmpExitMask12_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T101 = (data_write_init_check_i_CaseCmpExitMask13_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T104 = (data_write_init_check_i_CaseCmpExitMask14_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T107 = (data_write_init_check_i_CaseCmpExitMask15_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T110 = (data_write_init_check_i_CaseCmpExitMask16_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T113 = (data_write_init_check_i_CaseCmpExitMask17_AndEntry & data_write_init_check_i_and374_i_reg_stage1);
end
always @(*) begin
		data_write_init_check_i_exitMask_T116 = (data_write_init_check_i_exitMask_F4 & data_write_init_check_i_11);
end
always @(*) begin
		data_write_init_check_i_select142 = (data_write_init_check_i_0 | data_write_init_check_i_NotCondition);
end
always @(*) begin
		data_write_init_check_i_1_var1 = (data_write_init_check_i_exitMask_T2 | data_write_init_check_i_not_1);
end
always @(*) begin
		data_write_init_check_i_select144 = (data_write_init_check_i_0 & data_write_init_check_i_1_var1);
end
always @(*) begin
		data_write_init_check_i_select146 = (data_write_init_check_i_0 ? data_write_init_check_i_select144 : data_write_init_check_i_select142);
end
always @(*) begin
		data_write_init_check_i_select132 = (data_write_init_check_i_exitMask_T_reg_stage1 ? data_write_init_check_i_1 : {3'd0,data_write_init_check_i_bit_concat12_reg_stage1});
end
always @(*) begin
		data_write_init_check_i_select136 = (data_write_init_check_i_0_reg_stage1 ? data_write_init_check_i_1 : data_write_init_check_i_select132);
end
always @(*) begin
		data_write_init_check_i_select122 = (data_write_init_check_i_exitMask_T ? data_write_init_check_i_2 : 8'd0);
end
always @(*) begin
		data_write_init_check_i_bit_concat = {data_write_init_check_i_bit_concat_bit_select_operand_0[6:0], data_write_init_check_i_exitMask_T2};
end
always @(*) begin
		data_write_init_check_i_15 = (data_write_init_check_i_bit_concat ^ 8'd1);
end
always @(*) begin
		data_write_init_check_i_select124 = (data_write_init_check_i_2 + data_write_init_check_i_15);
end
always @(*) begin
		data_write_init_check_i_select126 = (data_write_init_check_i_0 ? data_write_init_check_i_select124 : data_write_init_check_i_select122);
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_write_state_inferred_reg <= 1'd0;
	end
	if ((data_write_state_enable_0 & 1'd1)) begin
		axi_s_write_state_inferred_reg <= data_write_init_check_i_select146;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_write_word_addr_inferred_reg <= 32'd0;
	end
	if ((data_write_state_enable_1 & 1'd1)) begin
		axi_s_write_word_addr_inferred_reg <= data_write_init_check_i_select136;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_write_count_inferred_reg <= 8'd0;
	end
	if ((data_write_state_enable_0 & 1'd1)) begin
		axi_s_write_count_inferred_reg <= data_write_init_check_i_select126;
	end
end
always @(posedge clk) begin
	if (~(data_write_state_stall_0)) begin
		data_write_valid_bit_0 <= (data_write_II_counter & start);
	end
	if (reset) begin
		data_write_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	data_write_state_stall_0 = 1'd0;
	if (data_write_state_stall_1) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F) & ~(axi_s_aw_addr_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F) & ~(axi_s_aw_burst_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F) & ~(axi_s_aw_size_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F) & ~(axi_s_aw_len_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F4) & ~(axi_s_w_data_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F4) & ~(axi_s_w_strb_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
	if (((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F4) & ~(axi_s_w_last_consumed_valid))) begin
		data_write_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	data_write_state_enable_0 = (data_write_valid_bit_0 & ~(data_write_state_stall_0));
end
always @(posedge clk) begin
	if (~(data_write_state_stall_1)) begin
		data_write_valid_bit_1 <= data_write_state_enable_0;
	end
	if (reset) begin
		data_write_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	data_write_state_stall_1 = 1'd0;
	if (data_write_state_stall_2) begin
		data_write_state_stall_1 = 1'd1;
	end
	if ((((data_write_valid_bit_1 & s_b_resp_valid) & ~(s_b_resp_ready)) & (axi_s_b_resp_data_write_state_1_not_accessed_due_to_stall_a | axi_s_b_resp_data_write_state_1_stalln_reg))) begin
		data_write_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	data_write_state_enable_1 = (data_write_valid_bit_1 & ~(data_write_state_stall_1));
end
always @(posedge clk) begin
	if (~(data_write_state_stall_2)) begin
		data_write_valid_bit_2 <= data_write_state_enable_1;
	end
	if (reset) begin
		data_write_valid_bit_2 <= 1'd0;
	end
end
assign data_write_state_stall_2 = 1'd0;
always @(*) begin
	data_write_state_enable_2 = (data_write_valid_bit_2 & ~(data_write_state_stall_2));
end
always @(posedge clk) begin
	data_write_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_0_reg_stage1 <= data_write_init_check_i_0;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_exitMask_T_reg_stage1 <= data_write_init_check_i_exitMask_T;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_exitMask_F4_reg_stage1 <= data_write_init_check_i_exitMask_F4;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_bit_concat12_reg_stage1 <= data_write_init_check_i_bit_concat12;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_bit_select1_reg_stage1 <= data_write_init_check_i_bit_select1;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_bit_select_reg_stage1 <= data_write_init_check_i_bit_select;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_bit_concat10_reg_stage1 <= data_write_init_check_i_bit_concat10;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_and374_i_reg_stage1 <= data_write_init_check_i_and374_i;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_13_reg_stage1 <= data_write_init_check_i_13;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_14_reg_stage1 <= data_write_init_check_i_14;
	end
end
always @(posedge clk) begin
	if (data_write_state_enable_0) begin
		data_write_init_check_i_exitMask_T116_reg_stage1 <= data_write_init_check_i_exitMask_T116;
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F)) begin
		axi_s_aw_addr_consumed_taken = ~(data_write_state_stall_0);
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F4)) begin
		axi_s_w_data_consumed_taken = ~(data_write_state_stall_0);
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F)) begin
		axi_s_aw_burst_consumed_taken = ~(data_write_state_stall_0);
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F)) begin
		axi_s_aw_size_consumed_taken = ~(data_write_state_stall_0);
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F)) begin
		axi_s_aw_len_consumed_taken = ~(data_write_state_stall_0);
	end
end
assign data_write_init_check_i_bit_concat12_bit_select_operand_0 = 3'd0;
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F4)) begin
		axi_s_w_strb_consumed_taken = ~(data_write_state_stall_0);
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
	if ((data_write_valid_bit_0 & data_write_init_check_i_exitMask_F4)) begin
		axi_s_w_last_consumed_taken = ~(data_write_state_stall_0);
	end
end
assign data_write_init_check_i_bit_concat10_bit_select_operand_0 = 24'd0;
assign data_write_init_check_i_bit_concat9_bit_select_operand_0 = 2'd0;
assign data_write_init_check_i_bit_concat9_bit_select_operand_4 = 4'd0;
assign data_write_init_check_i_bit_concat7_bit_select_operand_0 = 4'd0;
assign data_write_init_check_i_bit_concat5_bit_select_operand_0 = 28'd0;
assign data_write_init_check_i_bit_concat3_bit_select_operand_0 = 63'd0;
always @(posedge clk) begin
	axi_s_b_resp_data_write_state_1_not_accessed_due_to_stall_a <= ((data_write_state_stall_1 & s_b_resp_valid) & ~(s_b_resp_ready));
end
always @(posedge clk) begin
	axi_s_b_resp_data_write_state_1_stalln_reg <= ~(data_write_state_stall_1);
end
always @(*) begin
	axi_s_b_resp_data_write_state_1_enable_cond_a = (data_write_valid_bit_1 & (axi_s_b_resp_data_write_state_1_not_accessed_due_to_stall_a | axi_s_b_resp_data_write_state_1_stalln_reg));
end
assign data_write_init_check_i_bit_concat_bit_select_operand_0 = 7'd0;
always @(*) begin
	ready = ~(data_write_state_stall_0);
end
always @(posedge clk) begin
	finish <= data_write_state_enable_2;
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
	data_ctrl_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_CaseCmpExitMask19_AndEntry)) begin
		data_ctrl_write_en = 1'd1;
	end
end
always @(*) begin
	data_ctrl_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_CaseCmpExitMask19_AndEntry)) begin
		data_ctrl_write_data = data_write_init_check_i_14_reg_stage1;
	end
end
always @(*) begin
	data_run_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T35)) begin
		data_run_write_en = 1'd1;
	end
end
always @(*) begin
	data_run_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T35)) begin
		data_run_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_error_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T38)) begin
		data_error_write_en = 1'd1;
	end
end
always @(*) begin
	data_error_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T38)) begin
		data_error_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_result1_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T41)) begin
		data_result1_write_en = 1'd1;
	end
end
always @(*) begin
	data_result1_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T41)) begin
		data_result1_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_result3_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T44)) begin
		data_result3_write_en = 1'd1;
	end
end
always @(*) begin
	data_result3_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T44)) begin
		data_result3_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_result5_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T47)) begin
		data_result5_write_en = 1'd1;
	end
end
always @(*) begin
	data_result5_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T47)) begin
		data_result5_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_result7_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T50)) begin
		data_result7_write_en = 1'd1;
	end
end
always @(*) begin
	data_result7_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T50)) begin
		data_result7_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_A1_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T53)) begin
		data_A1_write_en = 1'd1;
	end
end
always @(*) begin
	data_A1_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T53)) begin
		data_A1_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_A3_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T56)) begin
		data_A3_write_en = 1'd1;
	end
end
always @(*) begin
	data_A3_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T56)) begin
		data_A3_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_B1_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T59)) begin
		data_B1_write_en = 1'd1;
	end
end
always @(*) begin
	data_B1_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T59)) begin
		data_B1_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_C1_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T62)) begin
		data_C1_write_en = 1'd1;
	end
end
always @(*) begin
	data_C1_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T62)) begin
		data_C1_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_D1_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T65)) begin
		data_D1_write_en = 1'd1;
	end
end
always @(*) begin
	data_D1_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T65)) begin
		data_D1_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_D3_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T68)) begin
		data_D3_write_en = 1'd1;
	end
end
always @(*) begin
	data_D3_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T68)) begin
		data_D3_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_E1_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T71)) begin
		data_E1_write_en = 1'd1;
	end
end
always @(*) begin
	data_E1_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T71)) begin
		data_E1_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_E3_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T74)) begin
		data_E3_write_en = 1'd1;
	end
end
always @(*) begin
	data_E3_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T74)) begin
		data_E3_write_data = data_write_init_check_i_bit_select1_reg_stage1;
	end
end
always @(*) begin
	data_base_addr_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T77)) begin
		data_base_addr_write_en = 1'd1;
	end
end
always @(*) begin
	data_base_addr_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T77)) begin
		data_base_addr_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_result0_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T80)) begin
		data_result0_write_en = 1'd1;
	end
end
always @(*) begin
	data_result0_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T80)) begin
		data_result0_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_result2_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T83)) begin
		data_result2_write_en = 1'd1;
	end
end
always @(*) begin
	data_result2_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T83)) begin
		data_result2_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_result4_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T86)) begin
		data_result4_write_en = 1'd1;
	end
end
always @(*) begin
	data_result4_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T86)) begin
		data_result4_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_result6_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T89)) begin
		data_result6_write_en = 1'd1;
	end
end
always @(*) begin
	data_result6_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T89)) begin
		data_result6_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_A0_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T92)) begin
		data_A0_write_en = 1'd1;
	end
end
always @(*) begin
	data_A0_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T92)) begin
		data_A0_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_A2_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T95)) begin
		data_A2_write_en = 1'd1;
	end
end
always @(*) begin
	data_A2_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T95)) begin
		data_A2_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_B0_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T98)) begin
		data_B0_write_en = 1'd1;
	end
end
always @(*) begin
	data_B0_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T98)) begin
		data_B0_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_C0_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T101)) begin
		data_C0_write_en = 1'd1;
	end
end
always @(*) begin
	data_C0_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T101)) begin
		data_C0_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_D0_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T104)) begin
		data_D0_write_en = 1'd1;
	end
end
always @(*) begin
	data_D0_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T104)) begin
		data_D0_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_D2_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T107)) begin
		data_D2_write_en = 1'd1;
	end
end
always @(*) begin
	data_D2_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T107)) begin
		data_D2_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_E0_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T110)) begin
		data_E0_write_en = 1'd1;
	end
end
always @(*) begin
	data_E0_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T110)) begin
		data_E0_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
always @(*) begin
	data_E2_write_en = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T113)) begin
		data_E2_write_en = 1'd1;
	end
end
always @(*) begin
	data_E2_write_data = 1'd0;
	if ((data_write_state_enable_1 & data_write_init_check_i_exitMask_T113)) begin
		data_E2_write_data = data_write_init_check_i_bit_select_reg_stage1;
	end
end
assign s_b_resp = 2'd0;
always @(*) begin
	s_b_resp_valid = 1'd0;
	if ((axi_s_b_resp_data_write_state_1_enable_cond_a & data_write_init_check_i_exitMask_T116_reg_stage1)) begin
		s_b_resp_valid = 1'd1;
	end
end

endmodule
`timescale 1 ns / 1 ns
module data_read
(
	clk,
	reset,
	start,
	ready,
	finish,
	s_ar_addr,
	axi_s_ar_ready,
	axi_s_ar_valid,
	data_result4_write_en,
	data_result4_write_data,
	data_result4_read_data,
	data_result3_write_en,
	data_result3_write_data,
	data_result3_read_data,
	data_result6_write_en,
	data_result6_write_data,
	data_result6_read_data,
	data_result5_write_en,
	data_result5_write_data,
	data_result5_read_data,
	data_A0_write_en,
	data_A0_write_data,
	data_A0_read_data,
	data_result7_write_en,
	data_result7_write_data,
	data_result7_read_data,
	data_A2_write_en,
	data_A2_write_data,
	data_A2_read_data,
	data_A1_write_en,
	data_A1_write_data,
	data_A1_read_data,
	data_B0_write_en,
	data_B0_write_data,
	data_B0_read_data,
	data_A3_write_en,
	data_A3_write_data,
	data_A3_read_data,
	data_C0_write_en,
	data_C0_write_data,
	data_C0_read_data,
	data_B1_write_en,
	data_B1_write_data,
	data_B1_read_data,
	data_D0_write_en,
	data_D0_write_data,
	data_D0_read_data,
	data_C1_write_en,
	data_C1_write_data,
	data_C1_read_data,
	data_D2_write_en,
	data_D2_write_data,
	data_D2_read_data,
	data_D1_write_en,
	data_D1_write_data,
	data_D1_read_data,
	data_E0_write_en,
	data_E0_write_data,
	data_E0_read_data,
	data_D3_write_en,
	data_D3_write_data,
	data_D3_read_data,
	data_E2_write_en,
	data_E2_write_data,
	data_E2_read_data,
	data_E1_write_en,
	data_E1_write_data,
	data_E1_read_data,
	data_E3_write_en,
	data_E3_write_data,
	data_E3_read_data,
	data_ctrl_write_en,
	data_ctrl_write_data,
	data_ctrl_read_data,
	s_ar_burst,
	s_ar_size,
	s_ar_len,
	data_base_addr_write_en,
	data_base_addr_write_data,
	data_base_addr_read_data,
	data_run_write_en,
	data_run_write_data,
	data_run_read_data,
	data_result0_write_en,
	data_result0_write_data,
	data_result0_read_data,
	data_error_write_en,
	data_error_write_data,
	data_error_read_data,
	data_result2_write_en,
	data_result2_write_data,
	data_result2_read_data,
	data_result1_write_en,
	data_result1_write_data,
	data_result1_read_data,
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
output  data_result4_write_en;
output [31:0] data_result4_write_data;
input [31:0] data_result4_read_data;
output  data_result3_write_en;
output [31:0] data_result3_write_data;
input [31:0] data_result3_read_data;
output  data_result6_write_en;
output [31:0] data_result6_write_data;
input [31:0] data_result6_read_data;
output  data_result5_write_en;
output [31:0] data_result5_write_data;
input [31:0] data_result5_read_data;
output  data_A0_write_en;
output [31:0] data_A0_write_data;
input [31:0] data_A0_read_data;
output  data_result7_write_en;
output [31:0] data_result7_write_data;
input [31:0] data_result7_read_data;
output  data_A2_write_en;
output [31:0] data_A2_write_data;
input [31:0] data_A2_read_data;
output  data_A1_write_en;
output [31:0] data_A1_write_data;
input [31:0] data_A1_read_data;
output  data_B0_write_en;
output [31:0] data_B0_write_data;
input [31:0] data_B0_read_data;
output  data_A3_write_en;
output [31:0] data_A3_write_data;
input [31:0] data_A3_read_data;
output  data_C0_write_en;
output [31:0] data_C0_write_data;
input [31:0] data_C0_read_data;
output  data_B1_write_en;
output [31:0] data_B1_write_data;
input [31:0] data_B1_read_data;
output  data_D0_write_en;
output [31:0] data_D0_write_data;
input [31:0] data_D0_read_data;
output  data_C1_write_en;
output [31:0] data_C1_write_data;
input [31:0] data_C1_read_data;
output  data_D2_write_en;
output [31:0] data_D2_write_data;
input [31:0] data_D2_read_data;
output  data_D1_write_en;
output [31:0] data_D1_write_data;
input [31:0] data_D1_read_data;
output  data_E0_write_en;
output [31:0] data_E0_write_data;
input [31:0] data_E0_read_data;
output  data_D3_write_en;
output [31:0] data_D3_write_data;
input [31:0] data_D3_read_data;
output  data_E2_write_en;
output [31:0] data_E2_write_data;
input [31:0] data_E2_read_data;
output  data_E1_write_en;
output [31:0] data_E1_write_data;
input [31:0] data_E1_read_data;
output  data_E3_write_en;
output [31:0] data_E3_write_data;
input [31:0] data_E3_read_data;
output  data_ctrl_write_en;
output  data_ctrl_write_data;
input  data_ctrl_read_data;
input [1:0] s_ar_burst;
input [2:0] s_ar_size;
input [7:0] s_ar_len;
output  data_base_addr_write_en;
output [31:0] data_base_addr_write_data;
input [31:0] data_base_addr_read_data;
output  data_run_write_en;
output [31:0] data_run_write_data;
input [31:0] data_run_read_data;
output  data_result0_write_en;
output [31:0] data_result0_write_data;
input [31:0] data_result0_read_data;
output  data_error_write_en;
output [31:0] data_error_write_data;
input [31:0] data_error_read_data;
output  data_result2_write_en;
output [31:0] data_result2_write_data;
input [31:0] data_result2_read_data;
output  data_result1_write_en;
output [31:0] data_result1_write_data;
input [31:0] data_result1_read_data;
output reg [63:0] s_r_data;
input  axi_s_r_ready;
output reg  axi_s_r_valid;
output [1:0] s_r_resp;
output reg  s_r_last;
reg  data_read_init_check_i_0;
reg [31:0] data_read_init_check_i_1;
reg [7:0] data_read_init_check_i_2;
reg [7:0] data_read_init_check_i_3;
reg  data_read_init_check_i_CaseCmpExitMask;
wire  data_read_init_check_i_4;
reg  data_read_init_check_i_exitMask_T;
reg  data_read_init_check_i_NotCondition;
reg  data_read_init_check_i_exitMask_F;
reg [7:0] data_read_init_check_i_5;
reg  data_read_init_check_i_6;
reg  data_read_init_check_i_not_1;
reg  data_read_init_check_i_1_var2;
reg [7:0] data_read_init_check_i_bit_concat18;
reg [31:0] data_read_init_check_i_7;
reg [3:0] data_read_init_check_i_bit_select16;
reg [3:0] data_read_init_check_i_bit_concat17;
reg  data_read_init_check_i_CaseCmpExitMask2;
reg  data_read_init_check_i_CaseCmpExitMask3;
reg  data_read_init_check_i_CaseCmpExitMask4;
reg  data_read_init_check_i_CaseCmpExitMask5;
reg  data_read_init_check_i_CaseCmpExitMask6;
reg  data_read_init_check_i_CaseCmpExitMask7;
reg  data_read_init_check_i_CaseCmpExitMask8;
reg  data_read_init_check_i_CaseCmpExitMask9;
reg  data_read_init_check_i_CaseCmpExitMask10;
reg  data_read_init_check_i_CaseCmpExitMask11;
reg  data_read_init_check_i_CaseCmpExitMask12;
reg  data_read_init_check_i_CaseCmpExitMask13;
reg  data_read_init_check_i_CaseCmpExitMask14;
reg  data_read_init_check_i_CaseCmpExitMask15;
reg  data_read_init_check_i_CaseCmpExitMask16;
reg  data_read_init_check_i_CaseCmpExitMask5_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask6_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask7_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask8_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask9_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask10_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask11_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask12_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask13_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask14_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask15_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask16_AndEntryM;
reg  data_read_init_check_i_CaseCmpExitMask2_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask3_AndEntryMa;
reg  data_read_init_check_i_CaseCmpExitMask4_AndEntryMa;
reg [31:0] data_read_init_check_i_8;
reg [31:0] data_read_init_check_i_9;
reg [63:0] data_read_init_check_i_bit_concat15;
reg [31:0] data_read_init_check_i_10;
reg [31:0] data_read_init_check_i_11;
reg [63:0] data_read_init_check_i_bit_concat14;
reg [31:0] data_read_init_check_i_12;
reg [31:0] data_read_init_check_i_13;
reg [63:0] data_read_init_check_i_bit_concat13;
reg [31:0] data_read_init_check_i_14;
reg [31:0] data_read_init_check_i_15;
reg [63:0] data_read_init_check_i_bit_concat12;
reg [31:0] data_read_init_check_i_16;
reg [31:0] data_read_init_check_i_17;
reg [63:0] data_read_init_check_i_bit_concat11;
reg [31:0] data_read_init_check_i_18;
reg [31:0] data_read_init_check_i_19;
reg [63:0] data_read_init_check_i_bit_concat10;
reg [31:0] data_read_init_check_i_20;
reg [31:0] data_read_init_check_i_21;
reg [63:0] data_read_init_check_i_bit_concat9;
reg [31:0] data_read_init_check_i_22;
reg [31:0] data_read_init_check_i_23;
reg [63:0] data_read_init_check_i_bit_concat8;
reg [31:0] data_read_init_check_i_24;
reg [31:0] data_read_init_check_i_25;
reg [63:0] data_read_init_check_i_bit_concat7;
reg [31:0] data_read_init_check_i_26;
reg [31:0] data_read_init_check_i_27;
reg [63:0] data_read_init_check_i_bit_concat6;
reg [31:0] data_read_init_check_i_28;
reg [31:0] data_read_init_check_i_bit_concat5;
reg  data_read_init_check_i_29;
reg  data_read_init_check_i_bit_concat4;
reg [31:0] data_read_init_check_i_30;
reg [28:0] data_read_init_check_i_bit_select;
reg [7:0] data_read_init_check_i_33;
reg [28:0] data_read_init_check_i_bit_concat3;
reg [31:0] data_read_init_check_i_34;
reg [31:0] data_read_init_check_i_35;
reg [63:0] data_read_init_check_i_bit_concat2;
reg [31:0] data_read_init_check_i_36;
reg [31:0] data_read_init_check_i_37;
reg [63:0] data_read_init_check_i_bit_concat1;
reg [31:0] data_read_init_check_i_38;
reg [31:0] data_read_init_check_i_39;
reg [63:0] data_read_init_check_i_bit_concat;
reg  data_read_init_check_i_ORexitM;
reg [63:0] data_read_init_check_i_select;
reg  data_read_init_check_i_ORexitM32;
reg [63:0] data_read_init_check_i_select33;
reg  data_read_init_check_i_ORexitM34;
reg [63:0] data_read_init_check_i_select35;
reg  data_read_init_check_i_ORexitM36;
reg [63:0] data_read_init_check_i_select37;
reg  data_read_init_check_i_ORexitM38;
reg [63:0] data_read_init_check_i_select39;
reg  data_read_init_check_i_ORexitM40;
reg [63:0] data_read_init_check_i_select41;
reg  data_read_init_check_i_ORexitM42;
reg [63:0] data_read_init_check_i_select43;
reg  data_read_init_check_i_select45;
reg  data_read_init_check_i_ORexitM46;
reg [63:0] data_read_init_check_i_select47;
reg  data_read_init_check_i_ORexitM48;
reg [63:0] data_read_init_check_i_select49;
reg  data_read_init_check_i_ORexitM50;
reg [63:0] data_read_init_check_i_select51;
reg [63:0] data_read_init_check_i_select53;
reg  data_read_init_check_i_ORexitM54;
reg [63:0] data_read_init_check_i_select55;
reg [63:0] data_read_init_check_i_select57;
reg [63:0] data_read_init_check_i_select59;
reg  data_read_init_check_i_select81;
reg  data_read_init_check_i_select83;
reg [31:0] data_read_init_check_i_select75;
reg [31:0] data_read_init_check_i_select77;
reg [7:0] data_read_init_check_i_select69;
reg [7:0] data_read_init_check_i_select71;
reg [7:0] data_read_init_check_i_select63;
reg [7:0] data_read_init_check_i_select65;
reg  axi_s_read_state_inferred_reg;
reg [31:0] axi_s_read_word_addr_inferred_reg;
reg [7:0] axi_s_read_burst_len_minus1_inferred_reg;
reg [7:0] axi_s_read_count_inferred_reg;
reg  data_read_valid_bit_0;
reg  data_read_state_stall_0;
reg  data_read_state_enable_0;
reg  data_read_valid_bit_1;
reg  data_read_state_stall_1;
reg  data_read_state_enable_1;
reg  data_read_valid_bit_2;
reg  data_read_state_stall_2;
reg  data_read_state_enable_2;
reg  data_read_valid_bit_3;
reg  data_read_state_stall_3;
reg  data_read_state_enable_3;
reg  data_read_valid_bit_4;
reg  data_read_state_stall_4;
reg  data_read_state_enable_4;
reg  data_read_valid_bit_5;
reg  data_read_state_stall_5;
reg  data_read_state_enable_5;
reg  data_read_II_counter;
reg  data_read_init_check_i_0_reg_stage1;
reg  data_read_init_check_i_0_reg_stage2;
reg  data_read_init_check_i_0_reg_stage3;
reg  data_read_init_check_i_0_reg_stage4;
reg  data_read_init_check_i_0_reg_stage5;
reg  data_read_init_check_i_exitMask_T_reg_stage1;
reg  data_read_init_check_i_6_reg_stage1;
reg  data_read_init_check_i_6_reg_stage2;
reg  data_read_init_check_i_6_reg_stage3;
reg  data_read_init_check_i_6_reg_stage4;
reg  data_read_init_check_i_6_reg_stage5;
reg [7:0] data_read_init_check_i_bit_concat18_reg_stage1;
reg  data_read_init_check_i_CaseCmpExitMask6_AndEntryMa_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask8_AndEntryMa_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask10_AndEntryM_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask12_AndEntryM_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask14_AndEntryM_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask16_AndEntryM_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask2_AndEntryMa_reg_stage2;
reg  data_read_init_check_i_CaseCmpExitMask4_AndEntryMa_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat15_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat14_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat13_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat12_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat11_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat10_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat9_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat8_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat7_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat6_reg_stage2;
reg [31:0] data_read_init_check_i_bit_concat5_reg_stage2;
reg  data_read_init_check_i_bit_concat4_reg_stage2;
reg [28:0] data_read_init_check_i_bit_concat3_reg_stage1;
reg [63:0] data_read_init_check_i_bit_concat2_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat1_reg_stage2;
reg [63:0] data_read_init_check_i_bit_concat_reg_stage2;
reg  data_read_init_check_i_ORexitM_reg_stage2;
reg  data_read_init_check_i_ORexitM_reg_stage3;
reg [63:0] data_read_init_check_i_select_reg_stage3;
reg  data_read_init_check_i_ORexitM32_reg_stage2;
reg [63:0] data_read_init_check_i_select33_reg_stage3;
reg  data_read_init_check_i_ORexitM34_reg_stage2;
reg  data_read_init_check_i_ORexitM34_reg_stage3;
reg [63:0] data_read_init_check_i_select35_reg_stage3;
reg  data_read_init_check_i_ORexitM36_reg_stage2;
reg [63:0] data_read_init_check_i_select37_reg_stage3;
reg  data_read_init_check_i_ORexitM38_reg_stage2;
reg  data_read_init_check_i_ORexitM38_reg_stage3;
reg [63:0] data_read_init_check_i_select39_reg_stage3;
reg  data_read_init_check_i_ORexitM40_reg_stage2;
reg [63:0] data_read_init_check_i_select41_reg_stage3;
reg  data_read_init_check_i_ORexitM42_reg_stage2;
reg  data_read_init_check_i_ORexitM42_reg_stage3;
reg [63:0] data_read_init_check_i_select43_reg_stage3;
reg  data_read_init_check_i_select45_reg_stage3;
reg  data_read_init_check_i_ORexitM46_reg_stage3;
reg  data_read_init_check_i_ORexitM46_reg_stage4;
reg [63:0] data_read_init_check_i_select47_reg_stage4;
reg [63:0] data_read_init_check_i_select49_reg_stage4;
reg  data_read_init_check_i_ORexitM50_reg_stage3;
reg  data_read_init_check_i_ORexitM50_reg_stage4;
reg [63:0] data_read_init_check_i_select51_reg_stage4;
reg [63:0] data_read_init_check_i_select53_reg_stage4;
reg  data_read_init_check_i_ORexitM54_reg_stage3;
reg  data_read_init_check_i_ORexitM54_reg_stage4;
reg  data_read_init_check_i_ORexitM54_reg_stage5;
reg [63:0] data_read_init_check_i_select55_reg_stage5;
reg [63:0] data_read_init_check_i_select57_reg_stage5;
reg  axi_s_ar_addr_consumed_valid;
reg [31:0] axi_s_ar_addr_consumed_data;
reg  axi_s_ar_addr_consumed_taken;
wire [23:0] data_read_init_check_i_bit_concat18_bit_select_operand_0;
wire [27:0] data_read_init_check_i_bit_concat17_bit_select_operand_0;
wire [31:0] data_read_init_check_i_bit_concat5_bit_select_operand_0;
wire [62:0] data_read_init_check_i_bit_concat4_bit_select_operand_0;
reg  axi_s_ar_burst_consumed_valid;
reg  axi_s_ar_burst_consumed_taken;
reg  axi_s_ar_size_consumed_valid;
reg  axi_s_ar_size_consumed_taken;
reg  axi_s_ar_len_consumed_valid;
reg [7:0] axi_s_ar_len_consumed_data;
reg  axi_s_ar_len_consumed_taken;
wire [2:0] data_read_init_check_i_bit_concat3_bit_select_operand_0;
reg  axi_s_r_data_data_read_state_5_not_accessed_due_to_stall_a;
reg  axi_s_r_data_data_read_state_5_stalln_reg;
reg  axi_s_r_data_data_read_state_5_enable_cond_a;
reg  axi_s_r_resp_data_read_state_5_not_accessed_due_to_stall_a;
reg  axi_s_r_resp_data_read_state_5_stalln_reg;
reg  axi_s_r_resp_data_read_state_5_enable_cond_a;
reg  axi_s_r_last_data_read_state_5_not_accessed_due_to_stall_a;
reg  axi_s_r_last_data_read_state_5_stalln_reg;
reg  axi_s_r_last_data_read_state_5_enable_cond_a;


always @(*) begin
		data_read_init_check_i_0 = axi_s_read_state_inferred_reg;
end
always @(*) begin
		data_read_init_check_i_1 = axi_s_read_word_addr_inferred_reg;
end
always @(*) begin
		data_read_init_check_i_2 = axi_s_read_burst_len_minus1_inferred_reg;
end
always @(*) begin
		data_read_init_check_i_3 = axi_s_read_count_inferred_reg;
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask = (data_read_init_check_i_0 ^ 1'd1);
end
assign data_read_init_check_i_4 = ~(axi_s_ar_addr_consumed_valid);
always @(*) begin
		data_read_init_check_i_exitMask_T = (data_read_init_check_i_4 & data_read_init_check_i_CaseCmpExitMask);
end
always @(*) begin
		data_read_init_check_i_NotCondition = (data_read_init_check_i_4 ^ 1'd1);
end
always @(*) begin
		data_read_init_check_i_exitMask_F = (data_read_init_check_i_CaseCmpExitMask & data_read_init_check_i_NotCondition);
end
always @(*) begin
		data_read_init_check_i_5 = (data_read_init_check_i_3 + 8'd1);
end
always @(*) begin
		data_read_init_check_i_6 = (data_read_init_check_i_3 == data_read_init_check_i_2);
end
always @(*) begin
		data_read_init_check_i_not_1 = (data_read_init_check_i_6 ^ 1'd1);
end
always @(*) begin
		data_read_init_check_i_1_var2 = (data_read_init_check_i_0 & data_read_init_check_i_not_1);
end
always @(*) begin
		data_read_init_check_i_bit_concat18 = {data_read_init_check_i_bit_concat18_bit_select_operand_0[23:0], data_read_init_check_i_3[7:0]};
end
always @(*) begin
		data_read_init_check_i_7 = (data_read_init_check_i_1 + {24'd0,data_read_init_check_i_bit_concat18_reg_stage1});
end
always @(*) begin
		data_read_init_check_i_bit_select16 = data_read_init_check_i_7[3:0];
end
always @(*) begin
		data_read_init_check_i_bit_concat17 = {data_read_init_check_i_bit_concat17_bit_select_operand_0[27:0], data_read_init_check_i_bit_select16[3:0]};
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask2 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd0);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask3 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd1);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask4 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd2);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask5 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd3);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask6 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd4);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask7 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd5);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask8 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd6);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask9 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd7);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask10 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd8);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask11 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd9);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask12 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd10);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask13 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd11);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask14 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd12);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask15 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd13);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask16 = ({28'd0,data_read_init_check_i_bit_concat17} == 32'd14);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask5_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask5);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask6_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask6);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask7_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask7);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask8_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask8);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask9_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask9);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask10_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask10);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask11_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask11);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask12_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask12);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask13_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask13);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask14_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask14);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask15_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask15);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask16_AndEntryM = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask16);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask2_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask2);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask3_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask3);
end
always @(*) begin
		data_read_init_check_i_CaseCmpExitMask4_AndEntryMa = (data_read_init_check_i_0_reg_stage1 & data_read_init_check_i_CaseCmpExitMask4);
end
always @(*) begin
		data_read_init_check_i_8 = data_result4_read_data;
end
always @(*) begin
		data_read_init_check_i_9 = data_result3_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat15 = {data_read_init_check_i_8[31:0], data_read_init_check_i_9[31:0]};
end
always @(*) begin
		data_read_init_check_i_10 = data_result6_read_data;
end
always @(*) begin
		data_read_init_check_i_11 = data_result5_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat14 = {data_read_init_check_i_10[31:0], data_read_init_check_i_11[31:0]};
end
always @(*) begin
		data_read_init_check_i_12 = data_A0_read_data;
end
always @(*) begin
		data_read_init_check_i_13 = data_result7_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat13 = {data_read_init_check_i_12[31:0], data_read_init_check_i_13[31:0]};
end
always @(*) begin
		data_read_init_check_i_14 = data_A2_read_data;
end
always @(*) begin
		data_read_init_check_i_15 = data_A1_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat12 = {data_read_init_check_i_14[31:0], data_read_init_check_i_15[31:0]};
end
always @(*) begin
		data_read_init_check_i_16 = data_B0_read_data;
end
always @(*) begin
		data_read_init_check_i_17 = data_A3_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat11 = {data_read_init_check_i_16[31:0], data_read_init_check_i_17[31:0]};
end
always @(*) begin
		data_read_init_check_i_18 = data_C0_read_data;
end
always @(*) begin
		data_read_init_check_i_19 = data_B1_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat10 = {data_read_init_check_i_18[31:0], data_read_init_check_i_19[31:0]};
end
always @(*) begin
		data_read_init_check_i_20 = data_D0_read_data;
end
always @(*) begin
		data_read_init_check_i_21 = data_C1_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat9 = {data_read_init_check_i_20[31:0], data_read_init_check_i_21[31:0]};
end
always @(*) begin
		data_read_init_check_i_22 = data_D2_read_data;
end
always @(*) begin
		data_read_init_check_i_23 = data_D1_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat8 = {data_read_init_check_i_22[31:0], data_read_init_check_i_23[31:0]};
end
always @(*) begin
		data_read_init_check_i_24 = data_E0_read_data;
end
always @(*) begin
		data_read_init_check_i_25 = data_D3_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat7 = {data_read_init_check_i_24[31:0], data_read_init_check_i_25[31:0]};
end
always @(*) begin
		data_read_init_check_i_26 = data_E2_read_data;
end
always @(*) begin
		data_read_init_check_i_27 = data_E1_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat6 = {data_read_init_check_i_26[31:0], data_read_init_check_i_27[31:0]};
end
always @(*) begin
		data_read_init_check_i_28 = data_E3_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat5 = {data_read_init_check_i_bit_concat5_bit_select_operand_0[31:0], data_read_init_check_i_28[31:0]};
end
always @(*) begin
		data_read_init_check_i_29 = data_ctrl_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat4 = {data_read_init_check_i_bit_concat4_bit_select_operand_0[62:0], data_read_init_check_i_29};
end
always @(*) begin
	data_read_init_check_i_30 = axi_s_ar_addr_consumed_data;
end
always @(*) begin
		data_read_init_check_i_bit_select = data_read_init_check_i_30[31:3];
end
always @(*) begin
	data_read_init_check_i_33 = axi_s_ar_len_consumed_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat3 = {data_read_init_check_i_bit_concat3_bit_select_operand_0[2:0], data_read_init_check_i_bit_select[28:0]};
end
always @(*) begin
		data_read_init_check_i_34 = data_base_addr_read_data;
end
always @(*) begin
		data_read_init_check_i_35 = data_run_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat2 = {data_read_init_check_i_34[31:0], data_read_init_check_i_35[31:0]};
end
always @(*) begin
		data_read_init_check_i_36 = data_result0_read_data;
end
always @(*) begin
		data_read_init_check_i_37 = data_error_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat1 = {data_read_init_check_i_36[31:0], data_read_init_check_i_37[31:0]};
end
always @(*) begin
		data_read_init_check_i_38 = data_result2_read_data;
end
always @(*) begin
		data_read_init_check_i_39 = data_result1_read_data;
end
always @(*) begin
		data_read_init_check_i_bit_concat = {data_read_init_check_i_38[31:0], data_read_init_check_i_39[31:0]};
end
always @(*) begin
		data_read_init_check_i_ORexitM = (data_read_init_check_i_CaseCmpExitMask2_AndEntryMa | data_read_init_check_i_CaseCmpExitMask3_AndEntryMa);
end
always @(*) begin
		data_read_init_check_i_select = (data_read_init_check_i_CaseCmpExitMask2_AndEntryMa_reg_stage2 ? data_read_init_check_i_bit_concat2_reg_stage2 : data_read_init_check_i_bit_concat1_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_ORexitM32 = (data_read_init_check_i_CaseCmpExitMask4_AndEntryMa | data_read_init_check_i_CaseCmpExitMask5_AndEntryMa);
end
always @(*) begin
		data_read_init_check_i_select33 = (data_read_init_check_i_CaseCmpExitMask4_AndEntryMa_reg_stage2 ? data_read_init_check_i_bit_concat_reg_stage2 : data_read_init_check_i_bit_concat15_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_ORexitM34 = (data_read_init_check_i_CaseCmpExitMask6_AndEntryMa | data_read_init_check_i_CaseCmpExitMask7_AndEntryMa);
end
always @(*) begin
		data_read_init_check_i_select35 = (data_read_init_check_i_CaseCmpExitMask6_AndEntryMa_reg_stage2 ? data_read_init_check_i_bit_concat14_reg_stage2 : data_read_init_check_i_bit_concat13_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_ORexitM36 = (data_read_init_check_i_CaseCmpExitMask8_AndEntryMa | data_read_init_check_i_CaseCmpExitMask9_AndEntryMa);
end
always @(*) begin
		data_read_init_check_i_select37 = (data_read_init_check_i_CaseCmpExitMask8_AndEntryMa_reg_stage2 ? data_read_init_check_i_bit_concat12_reg_stage2 : data_read_init_check_i_bit_concat11_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_ORexitM38 = (data_read_init_check_i_CaseCmpExitMask10_AndEntryM | data_read_init_check_i_CaseCmpExitMask11_AndEntryM);
end
always @(*) begin
		data_read_init_check_i_select39 = (data_read_init_check_i_CaseCmpExitMask10_AndEntryM_reg_stage2 ? data_read_init_check_i_bit_concat10_reg_stage2 : data_read_init_check_i_bit_concat9_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_ORexitM40 = (data_read_init_check_i_CaseCmpExitMask12_AndEntryM | data_read_init_check_i_CaseCmpExitMask13_AndEntryM);
end
always @(*) begin
		data_read_init_check_i_select41 = (data_read_init_check_i_CaseCmpExitMask12_AndEntryM_reg_stage2 ? data_read_init_check_i_bit_concat8_reg_stage2 : data_read_init_check_i_bit_concat7_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_ORexitM42 = (data_read_init_check_i_CaseCmpExitMask14_AndEntryM | data_read_init_check_i_CaseCmpExitMask15_AndEntryM);
end
always @(*) begin
		data_read_init_check_i_select43 = (data_read_init_check_i_CaseCmpExitMask14_AndEntryM_reg_stage2 ? data_read_init_check_i_bit_concat6_reg_stage2 : {32'd0,data_read_init_check_i_bit_concat5_reg_stage2});
end
always @(*) begin
		data_read_init_check_i_select45 = (data_read_init_check_i_CaseCmpExitMask16_AndEntryM_reg_stage2 ? data_read_init_check_i_bit_concat4_reg_stage2 : 64'd0);
end
always @(*) begin
		data_read_init_check_i_ORexitM46 = (data_read_init_check_i_ORexitM_reg_stage2 | data_read_init_check_i_ORexitM32_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_select47 = (data_read_init_check_i_ORexitM_reg_stage3 ? data_read_init_check_i_select_reg_stage3 : data_read_init_check_i_select33_reg_stage3);
end
always @(*) begin
		data_read_init_check_i_ORexitM48 = (data_read_init_check_i_ORexitM34_reg_stage2 | data_read_init_check_i_ORexitM36_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_select49 = (data_read_init_check_i_ORexitM34_reg_stage3 ? data_read_init_check_i_select35_reg_stage3 : data_read_init_check_i_select37_reg_stage3);
end
always @(*) begin
		data_read_init_check_i_ORexitM50 = (data_read_init_check_i_ORexitM38_reg_stage2 | data_read_init_check_i_ORexitM40_reg_stage2);
end
always @(*) begin
		data_read_init_check_i_select51 = (data_read_init_check_i_ORexitM38_reg_stage3 ? data_read_init_check_i_select39_reg_stage3 : data_read_init_check_i_select41_reg_stage3);
end
always @(*) begin
		data_read_init_check_i_select53 = (data_read_init_check_i_ORexitM42_reg_stage3 ? data_read_init_check_i_select43_reg_stage3 : data_read_init_check_i_select45_reg_stage3);
end
always @(*) begin
		data_read_init_check_i_ORexitM54 = (data_read_init_check_i_ORexitM46 | data_read_init_check_i_ORexitM48);
end
always @(*) begin
		data_read_init_check_i_select55 = (data_read_init_check_i_ORexitM46_reg_stage4 ? data_read_init_check_i_select47_reg_stage4 : data_read_init_check_i_select49_reg_stage4);
end
always @(*) begin
		data_read_init_check_i_select57 = (data_read_init_check_i_ORexitM50_reg_stage4 ? data_read_init_check_i_select51_reg_stage4 : data_read_init_check_i_select53_reg_stage4);
end
always @(*) begin
		data_read_init_check_i_select59 = (data_read_init_check_i_ORexitM54_reg_stage5 ? data_read_init_check_i_select55_reg_stage5 : data_read_init_check_i_select57_reg_stage5);
end
always @(*) begin
		data_read_init_check_i_select81 = (data_read_init_check_i_0 | data_read_init_check_i_NotCondition);
end
always @(*) begin
		data_read_init_check_i_select83 = (data_read_init_check_i_0 ? data_read_init_check_i_1_var2 : data_read_init_check_i_select81);
end
always @(*) begin
		data_read_init_check_i_select75 = (data_read_init_check_i_exitMask_T_reg_stage1 ? data_read_init_check_i_1 : {3'd0,data_read_init_check_i_bit_concat3_reg_stage1});
end
always @(*) begin
		data_read_init_check_i_select77 = (data_read_init_check_i_0_reg_stage1 ? data_read_init_check_i_1 : data_read_init_check_i_select75);
end
always @(*) begin
		data_read_init_check_i_select69 = (data_read_init_check_i_exitMask_T ? data_read_init_check_i_2 : data_read_init_check_i_33);
end
always @(*) begin
		data_read_init_check_i_select71 = (data_read_init_check_i_0 ? data_read_init_check_i_2 : data_read_init_check_i_select69);
end
always @(*) begin
		data_read_init_check_i_select63 = (data_read_init_check_i_exitMask_T ? data_read_init_check_i_3 : 8'd0);
end
always @(*) begin
		data_read_init_check_i_select65 = (data_read_init_check_i_0 ? data_read_init_check_i_5 : data_read_init_check_i_select63);
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_state_inferred_reg <= 1'd0;
	end
	if ((data_read_state_enable_0 & 1'd1)) begin
		axi_s_read_state_inferred_reg <= data_read_init_check_i_select83;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_word_addr_inferred_reg <= 32'd0;
	end
	if ((data_read_state_enable_1 & 1'd1)) begin
		axi_s_read_word_addr_inferred_reg <= data_read_init_check_i_select77;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_burst_len_minus1_inferred_reg <= 8'd0;
	end
	if ((data_read_state_enable_0 & 1'd1)) begin
		axi_s_read_burst_len_minus1_inferred_reg <= data_read_init_check_i_select71;
	end
end
always @(posedge clk) begin
	if (reset) begin
		axi_s_read_count_inferred_reg <= 8'd0;
	end
	if ((data_read_state_enable_0 & 1'd1)) begin
		axi_s_read_count_inferred_reg <= data_read_init_check_i_select65;
	end
end
always @(posedge clk) begin
	if (~(data_read_state_stall_0)) begin
		data_read_valid_bit_0 <= (data_read_II_counter & start);
	end
	if (reset) begin
		data_read_valid_bit_0 <= 1'd0;
	end
end
always @(*) begin
	data_read_state_stall_0 = 1'd0;
	if (data_read_state_stall_1) begin
		data_read_state_stall_0 = 1'd1;
	end
	if (((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F) & ~(axi_s_ar_addr_consumed_valid))) begin
		data_read_state_stall_0 = 1'd1;
	end
	if (((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F) & ~(axi_s_ar_burst_consumed_valid))) begin
		data_read_state_stall_0 = 1'd1;
	end
	if (((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F) & ~(axi_s_ar_size_consumed_valid))) begin
		data_read_state_stall_0 = 1'd1;
	end
	if (((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F) & ~(axi_s_ar_len_consumed_valid))) begin
		data_read_state_stall_0 = 1'd1;
	end
end
always @(*) begin
	data_read_state_enable_0 = (data_read_valid_bit_0 & ~(data_read_state_stall_0));
end
always @(posedge clk) begin
	if (~(data_read_state_stall_1)) begin
		data_read_valid_bit_1 <= data_read_state_enable_0;
	end
	if (reset) begin
		data_read_valid_bit_1 <= 1'd0;
	end
end
always @(*) begin
	data_read_state_stall_1 = 1'd0;
	if (data_read_state_stall_2) begin
		data_read_state_stall_1 = 1'd1;
	end
end
always @(*) begin
	data_read_state_enable_1 = (data_read_valid_bit_1 & ~(data_read_state_stall_1));
end
always @(posedge clk) begin
	if (~(data_read_state_stall_2)) begin
		data_read_valid_bit_2 <= data_read_state_enable_1;
	end
	if (reset) begin
		data_read_valid_bit_2 <= 1'd0;
	end
end
always @(*) begin
	data_read_state_stall_2 = 1'd0;
	if (data_read_state_stall_3) begin
		data_read_state_stall_2 = 1'd1;
	end
end
always @(*) begin
	data_read_state_enable_2 = (data_read_valid_bit_2 & ~(data_read_state_stall_2));
end
always @(posedge clk) begin
	if (~(data_read_state_stall_3)) begin
		data_read_valid_bit_3 <= data_read_state_enable_2;
	end
	if (reset) begin
		data_read_valid_bit_3 <= 1'd0;
	end
end
always @(*) begin
	data_read_state_stall_3 = 1'd0;
	if (data_read_state_stall_4) begin
		data_read_state_stall_3 = 1'd1;
	end
end
always @(*) begin
	data_read_state_enable_3 = (data_read_valid_bit_3 & ~(data_read_state_stall_3));
end
always @(posedge clk) begin
	if (~(data_read_state_stall_4)) begin
		data_read_valid_bit_4 <= data_read_state_enable_3;
	end
	if (reset) begin
		data_read_valid_bit_4 <= 1'd0;
	end
end
always @(*) begin
	data_read_state_stall_4 = 1'd0;
	if (data_read_state_stall_5) begin
		data_read_state_stall_4 = 1'd1;
	end
end
always @(*) begin
	data_read_state_enable_4 = (data_read_valid_bit_4 & ~(data_read_state_stall_4));
end
always @(posedge clk) begin
	if (~(data_read_state_stall_5)) begin
		data_read_valid_bit_5 <= data_read_state_enable_4;
	end
	if (reset) begin
		data_read_valid_bit_5 <= 1'd0;
	end
end
always @(*) begin
	data_read_state_stall_5 = 1'd0;
	if ((((data_read_valid_bit_5 & axi_s_r_valid) & ~(axi_s_r_ready)) & (axi_s_r_data_data_read_state_5_not_accessed_due_to_stall_a | axi_s_r_data_data_read_state_5_stalln_reg))) begin
		data_read_state_stall_5 = 1'd1;
	end
	if ((((data_read_valid_bit_5 & axi_s_r_valid) & ~(axi_s_r_ready)) & (axi_s_r_resp_data_read_state_5_not_accessed_due_to_stall_a | axi_s_r_resp_data_read_state_5_stalln_reg))) begin
		data_read_state_stall_5 = 1'd1;
	end
	if ((((data_read_valid_bit_5 & axi_s_r_valid) & ~(axi_s_r_ready)) & (axi_s_r_last_data_read_state_5_not_accessed_due_to_stall_a | axi_s_r_last_data_read_state_5_stalln_reg))) begin
		data_read_state_stall_5 = 1'd1;
	end
end
always @(*) begin
	data_read_state_enable_5 = (data_read_valid_bit_5 & ~(data_read_state_stall_5));
end
always @(posedge clk) begin
	data_read_II_counter <= 1'd1;
end
always @(posedge clk) begin
	if (data_read_state_enable_0) begin
		data_read_init_check_i_0_reg_stage1 <= data_read_init_check_i_0;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_0_reg_stage2 <= data_read_init_check_i_0_reg_stage1;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_0_reg_stage3 <= data_read_init_check_i_0_reg_stage2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_0_reg_stage4 <= data_read_init_check_i_0_reg_stage3;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_4) begin
		data_read_init_check_i_0_reg_stage5 <= data_read_init_check_i_0_reg_stage4;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_0) begin
		data_read_init_check_i_exitMask_T_reg_stage1 <= data_read_init_check_i_exitMask_T;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_0) begin
		data_read_init_check_i_6_reg_stage1 <= data_read_init_check_i_6;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_6_reg_stage2 <= data_read_init_check_i_6_reg_stage1;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_6_reg_stage3 <= data_read_init_check_i_6_reg_stage2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_6_reg_stage4 <= data_read_init_check_i_6_reg_stage3;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_4) begin
		data_read_init_check_i_6_reg_stage5 <= data_read_init_check_i_6_reg_stage4;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_0) begin
		data_read_init_check_i_bit_concat18_reg_stage1 <= data_read_init_check_i_bit_concat18;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask6_AndEntryMa_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask6_AndEntryMa;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask8_AndEntryMa_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask8_AndEntryMa;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask10_AndEntryM_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask10_AndEntryM;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask12_AndEntryM_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask12_AndEntryM;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask14_AndEntryM_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask14_AndEntryM;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask16_AndEntryM_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask16_AndEntryM;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask2_AndEntryMa_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask2_AndEntryMa;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_CaseCmpExitMask4_AndEntryMa_reg_stage2 <= data_read_init_check_i_CaseCmpExitMask4_AndEntryMa;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat15_reg_stage2 <= data_read_init_check_i_bit_concat15;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat14_reg_stage2 <= data_read_init_check_i_bit_concat14;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat13_reg_stage2 <= data_read_init_check_i_bit_concat13;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat12_reg_stage2 <= data_read_init_check_i_bit_concat12;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat11_reg_stage2 <= data_read_init_check_i_bit_concat11;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat10_reg_stage2 <= data_read_init_check_i_bit_concat10;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat9_reg_stage2 <= data_read_init_check_i_bit_concat9;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat8_reg_stage2 <= data_read_init_check_i_bit_concat8;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat7_reg_stage2 <= data_read_init_check_i_bit_concat7;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat6_reg_stage2 <= data_read_init_check_i_bit_concat6;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat5_reg_stage2 <= data_read_init_check_i_bit_concat5;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat4_reg_stage2 <= data_read_init_check_i_bit_concat4;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_0) begin
		data_read_init_check_i_bit_concat3_reg_stage1 <= data_read_init_check_i_bit_concat3;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat2_reg_stage2 <= data_read_init_check_i_bit_concat2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat1_reg_stage2 <= data_read_init_check_i_bit_concat1;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_bit_concat_reg_stage2 <= data_read_init_check_i_bit_concat;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM_reg_stage2 <= data_read_init_check_i_ORexitM;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM_reg_stage3 <= data_read_init_check_i_ORexitM_reg_stage2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select_reg_stage3 <= data_read_init_check_i_select;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM32_reg_stage2 <= data_read_init_check_i_ORexitM32;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select33_reg_stage3 <= data_read_init_check_i_select33;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM34_reg_stage2 <= data_read_init_check_i_ORexitM34;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM34_reg_stage3 <= data_read_init_check_i_ORexitM34_reg_stage2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select35_reg_stage3 <= data_read_init_check_i_select35;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM36_reg_stage2 <= data_read_init_check_i_ORexitM36;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select37_reg_stage3 <= data_read_init_check_i_select37;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM38_reg_stage2 <= data_read_init_check_i_ORexitM38;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM38_reg_stage3 <= data_read_init_check_i_ORexitM38_reg_stage2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select39_reg_stage3 <= data_read_init_check_i_select39;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM40_reg_stage2 <= data_read_init_check_i_ORexitM40;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select41_reg_stage3 <= data_read_init_check_i_select41;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_1) begin
		data_read_init_check_i_ORexitM42_reg_stage2 <= data_read_init_check_i_ORexitM42;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM42_reg_stage3 <= data_read_init_check_i_ORexitM42_reg_stage2;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select43_reg_stage3 <= data_read_init_check_i_select43;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_select45_reg_stage3 <= data_read_init_check_i_select45;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM46_reg_stage3 <= data_read_init_check_i_ORexitM46;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_ORexitM46_reg_stage4 <= data_read_init_check_i_ORexitM46_reg_stage3;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_select47_reg_stage4 <= data_read_init_check_i_select47;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_select49_reg_stage4 <= data_read_init_check_i_select49;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM50_reg_stage3 <= data_read_init_check_i_ORexitM50;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_ORexitM50_reg_stage4 <= data_read_init_check_i_ORexitM50_reg_stage3;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_select51_reg_stage4 <= data_read_init_check_i_select51;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_select53_reg_stage4 <= data_read_init_check_i_select53;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_2) begin
		data_read_init_check_i_ORexitM54_reg_stage3 <= data_read_init_check_i_ORexitM54;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_3) begin
		data_read_init_check_i_ORexitM54_reg_stage4 <= data_read_init_check_i_ORexitM54_reg_stage3;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_4) begin
		data_read_init_check_i_ORexitM54_reg_stage5 <= data_read_init_check_i_ORexitM54_reg_stage4;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_4) begin
		data_read_init_check_i_select55_reg_stage5 <= data_read_init_check_i_select55;
	end
end
always @(posedge clk) begin
	if (data_read_state_enable_4) begin
		data_read_init_check_i_select57_reg_stage5 <= data_read_init_check_i_select57;
	end
end
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
	if ((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F)) begin
		axi_s_ar_addr_consumed_taken = ~(data_read_state_stall_0);
	end
end
assign data_read_init_check_i_bit_concat18_bit_select_operand_0 = 24'd0;
assign data_read_init_check_i_bit_concat17_bit_select_operand_0 = 28'd0;
assign data_read_init_check_i_bit_concat5_bit_select_operand_0 = 32'd0;
assign data_read_init_check_i_bit_concat4_bit_select_operand_0 = 63'd0;
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
	if ((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F)) begin
		axi_s_ar_burst_consumed_taken = ~(data_read_state_stall_0);
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
	if ((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F)) begin
		axi_s_ar_size_consumed_taken = ~(data_read_state_stall_0);
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
	if ((data_read_valid_bit_0 & data_read_init_check_i_exitMask_F)) begin
		axi_s_ar_len_consumed_taken = ~(data_read_state_stall_0);
	end
end
assign data_read_init_check_i_bit_concat3_bit_select_operand_0 = 3'd0;
always @(posedge clk) begin
	axi_s_r_data_data_read_state_5_not_accessed_due_to_stall_a <= ((data_read_state_stall_5 & axi_s_r_valid) & ~(axi_s_r_ready));
end
always @(posedge clk) begin
	axi_s_r_data_data_read_state_5_stalln_reg <= ~(data_read_state_stall_5);
end
always @(*) begin
	axi_s_r_data_data_read_state_5_enable_cond_a = (data_read_valid_bit_5 & (axi_s_r_data_data_read_state_5_not_accessed_due_to_stall_a | axi_s_r_data_data_read_state_5_stalln_reg));
end
always @(posedge clk) begin
	axi_s_r_resp_data_read_state_5_not_accessed_due_to_stall_a <= ((data_read_state_stall_5 & axi_s_r_valid) & ~(axi_s_r_ready));
end
always @(posedge clk) begin
	axi_s_r_resp_data_read_state_5_stalln_reg <= ~(data_read_state_stall_5);
end
always @(*) begin
	axi_s_r_resp_data_read_state_5_enable_cond_a = (data_read_valid_bit_5 & (axi_s_r_resp_data_read_state_5_not_accessed_due_to_stall_a | axi_s_r_resp_data_read_state_5_stalln_reg));
end
always @(posedge clk) begin
	axi_s_r_last_data_read_state_5_not_accessed_due_to_stall_a <= ((data_read_state_stall_5 & axi_s_r_valid) & ~(axi_s_r_ready));
end
always @(posedge clk) begin
	axi_s_r_last_data_read_state_5_stalln_reg <= ~(data_read_state_stall_5);
end
always @(*) begin
	axi_s_r_last_data_read_state_5_enable_cond_a = (data_read_valid_bit_5 & (axi_s_r_last_data_read_state_5_not_accessed_due_to_stall_a | axi_s_r_last_data_read_state_5_stalln_reg));
end
always @(*) begin
	ready = ~(data_read_state_stall_0);
end
always @(posedge clk) begin
	finish <= data_read_state_enable_5;
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
assign data_result4_write_en = 1'd0;
assign data_result4_write_data = 1'd0;
assign data_result3_write_en = 1'd0;
assign data_result3_write_data = 1'd0;
assign data_result6_write_en = 1'd0;
assign data_result6_write_data = 1'd0;
assign data_result5_write_en = 1'd0;
assign data_result5_write_data = 1'd0;
assign data_A0_write_en = 1'd0;
assign data_A0_write_data = 1'd0;
assign data_result7_write_en = 1'd0;
assign data_result7_write_data = 1'd0;
assign data_A2_write_en = 1'd0;
assign data_A2_write_data = 1'd0;
assign data_A1_write_en = 1'd0;
assign data_A1_write_data = 1'd0;
assign data_B0_write_en = 1'd0;
assign data_B0_write_data = 1'd0;
assign data_A3_write_en = 1'd0;
assign data_A3_write_data = 1'd0;
assign data_C0_write_en = 1'd0;
assign data_C0_write_data = 1'd0;
assign data_B1_write_en = 1'd0;
assign data_B1_write_data = 1'd0;
assign data_D0_write_en = 1'd0;
assign data_D0_write_data = 1'd0;
assign data_C1_write_en = 1'd0;
assign data_C1_write_data = 1'd0;
assign data_D2_write_en = 1'd0;
assign data_D2_write_data = 1'd0;
assign data_D1_write_en = 1'd0;
assign data_D1_write_data = 1'd0;
assign data_E0_write_en = 1'd0;
assign data_E0_write_data = 1'd0;
assign data_D3_write_en = 1'd0;
assign data_D3_write_data = 1'd0;
assign data_E2_write_en = 1'd0;
assign data_E2_write_data = 1'd0;
assign data_E1_write_en = 1'd0;
assign data_E1_write_data = 1'd0;
assign data_E3_write_en = 1'd0;
assign data_E3_write_data = 1'd0;
assign data_ctrl_write_en = 1'd0;
assign data_ctrl_write_data = 1'd0;
assign data_base_addr_write_en = 1'd0;
assign data_base_addr_write_data = 1'd0;
assign data_run_write_en = 1'd0;
assign data_run_write_data = 1'd0;
assign data_result0_write_en = 1'd0;
assign data_result0_write_data = 1'd0;
assign data_error_write_en = 1'd0;
assign data_error_write_data = 1'd0;
assign data_result2_write_en = 1'd0;
assign data_result2_write_data = 1'd0;
assign data_result1_write_en = 1'd0;
assign data_result1_write_data = 1'd0;
always @(*) begin
		s_r_data = data_read_init_check_i_select59;
end
always @(*) begin
	axi_s_r_valid = 1'd0;
	if ((axi_s_r_data_data_read_state_5_enable_cond_a & data_read_init_check_i_0_reg_stage5)) begin
		axi_s_r_valid = 1'd1;
	end
	if ((axi_s_r_resp_data_read_state_5_enable_cond_a & data_read_init_check_i_0_reg_stage5)) begin
		axi_s_r_valid = 1'd1;
	end
	if ((axi_s_r_last_data_read_state_5_enable_cond_a & data_read_init_check_i_0_reg_stage5)) begin
		axi_s_r_valid = 1'd1;
	end
end
assign s_r_resp = 2'd0;
always @(*) begin
		s_r_last = data_read_init_check_i_6_reg_stage5;
end

endmodule
