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

module AXI4_STREAM_DATA_GENERATOR(ACLK, RSTN, TREADY, TDEST, TID, TKEEP, TLAST, TVALID, TSTRB, TDATA, PCLK, PRESETN, PENABLE, PSEL, PADDR, PWRITE, PWDATA, PRDATA, PREADY, PSLVERR );

input PCLK;
input PRESETN;
input PENABLE;
input PSEL;
input PWRITE;
input [31:0] PADDR;
input [31:0] PWDATA;
output PREADY;
output PSLVERR;
output [31:0] PRDATA;

input ACLK, RSTN, TREADY;

output   [1:0]   TDEST;
output   [7:0]   TID;
output   [3:0]   TKEEP, TSTRB;
output   TLAST,  TVALID;
output   [31:0]  TDATA;

    wire ENABLE_GEN;
    wire ENABLE_FSM;
    wire [31:0] TX_SIZE;
    wire RESETN_INTERNAL;
    
    
    AXI4_STREAM_DATA_GENERATOR_ABP_Reg  TRANS_SIZE (
        .pclk(PCLK),
        .presetn(PRESETN & RESETN_INTERNAL),
        .psel(PSEL),
        .pwrite(PWRITE),
        .pwdata(PWDATA),
        .pslverr(PSLVERR),
        .pready(PREADY),
        .prdata(PRDATA),
        .trans_size(TX_SIZE),
        .paddr(PADDR),
        .start(ENABLE_FSM),
        .reset_generator(RESETN_INTERNAL)
    );
    
    AXI4_STREAM_DATA_GENERATOR_FSM FSM (
        .clk(ACLK),
        .rst_n(RSTN & RESETN_INTERNAL),
        .start(ENABLE_FSM),
        .ready(TREADY),
        .en(ENABLE_GEN)
    );
    
    AXI4_STREAM_DATA_GENERATOR_gen generator (
        .clk(ACLK),
        .rst_n(RSTN & RESETN_INTERNAL),
        .en(ENABLE_GEN),
        .tdata(TDATA),
        .tvalid(TVALID),
        .tlast(TLAST),
        .trans_size(TX_SIZE),
        .tkeep(TKEEP),
        .tstrb(TSTRB),
        .tdest(TDEST),
        .tid(TID),
        .tready(TREADY)
    );
    
endmodule