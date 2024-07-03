////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, Microchip Corporation
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL MICROCHIP CORPORATIONM BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// APACHE LICENSE
// Copyright (c) 2022, Microchip Corporation 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
module frame_controls_gen
  (
   input                sys_clk_i,
   input                resetn_i,
   input                encoder_en_i, //from MSS GPIO
   input                frame_start_i,
   input      [15:0]    hres_i,
   input      [15:0]    vres_i,
   input                data_valid_i,
   input      [7:0]     data_r_i,
   input      [7:0]     data_g_i,
   input      [7:0]     data_b_i,   
   output reg           data_valid_r1_o, //registering for scaler to RBG2YCB timing
   output reg [7:0]     data_r_r1_o, 
   output reg [7:0]     data_g_r1_o,
   output reg [7:0]     data_b_r1_o,
   output               frame_start_r1_o, //to reset scaler IP
   output reg [15:0]    h_scale_factor_o,
   output reg [15:0]    v_scale_factor_o,
   output reg           encoder_en_o,
   output reg           frame_start_encoder_o,
   output               eof_encoder_o
 ); 

/************************************************************************
    Local parameters
*************************************************************************/

/************************************************************************
    Register/Wire Declarations
*************************************************************************/
reg [15:0]  hres_eof;
reg [15:0]  vres_eof;
reg         res_change;
reg [19:0]  frame_start_sr;
wire        frame_start_re;
/************************************************************************
	Module Instantiations
*************************************************************************/

/************************************************************************
    Top level output port assignments
    delay1  eof_encoder_o
    delay4  encoder_en_o
    delay18 frame_start_encoder_o
*************************************************************************/
assign frame_start_r1_o  = frame_start_sr[0];
assign eof_encoder_o     = (frame_start_sr[0] | frame_start_sr[1]) & encoder_en_o;
assign frame_start_encoder_o = frame_start_sr[19] | frame_start_sr[18];
/************************************************************************
	Internal assignments			 
*************************************************************************/
assign frame_start_re = frame_start_sr[0] & (~frame_start_i);     
/************************************************************************
    latch encoder en on frame start
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (~resetn_i)
    encoder_en_o  <= 0;
  else if (res_change && frame_start_sr[2]) //to regenerate sps&pps
    encoder_en_o  <= 0;
  else if ( frame_start_sr[3] & (~frame_start_sr[4]) )
    encoder_en_o  <= encoder_en_i;
/************************************************************************
    H scale factors 1920x1072 , 1280x720, 960x544,  640x480 and 432x240
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)  
    h_scale_factor_o    <= 1535;
  else if (frame_start_i)
    if (hres_i == 1920)  
      h_scale_factor_o  <=  1023;
    else if (hres_i == 1280)   
      h_scale_factor_o  <=  1535;
    else if (hres_i == 960)  
      h_scale_factor_o  <=  2046; 
    else if (hres_i == 640)
      h_scale_factor_o  <=  3070;
    else //432
      h_scale_factor_o  <=  4548;      
         
/************************************************************************
    V scale factors
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    v_scale_factor_o    <= 1534;
  else if (frame_start_i)
    if (vres_i == 1072)   
      v_scale_factor_o  <= 1030; 
    else if (vres_i == 720)   
      v_scale_factor_o  <= 1534;
    else if (vres_i == 544)   
      v_scale_factor_o  <= 2031;
    else if (vres_i == 480)
      v_scale_factor_o  <= 2031;
    else //240
      v_scale_factor_o  <= 4603;
      
/************************************************************************
    Process to register on frame start
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)  
  begin
    hres_eof   <= 1280;
    vres_eof   <= 720;
    res_change <= 1'b0;
  end
  else if (frame_start_i)
  begin
    hres_eof   <= hres_i;
    vres_eof   <= vres_i;
    if ((hres_eof != hres_i) || (vres_eof != vres_i))
      res_change  <= 1'b1;
    else
      res_change  <= 1'b0;  
  end
/************************************************************************
    Process to register signals
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)  
  begin
    frame_start_sr  <= 0;   
    data_valid_r1_o <= 0;
    data_r_r1_o     <= 0;
    data_g_r1_o     <= 0;
    data_b_r1_o     <= 0;
  end   
  else
  begin
    frame_start_sr  <= {frame_start_sr[18:0],frame_start_i};
    data_valid_r1_o <= data_valid_i;
    data_r_r1_o     <= data_r_i;
    data_g_r1_o     <= data_g_i;
    data_b_r1_o     <= data_b_i;
  end

endmodule