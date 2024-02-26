////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021, Microchip Corporation
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
// Copyright (c) 2021, Microchip Corporation 
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

module AXI_ADDRESS_SHIM (
    input         RESETN,
    input         INITIATOR_IN_ARREADY,
    input         INITIATOR_IN_AWREADY,
    input  [3:0]  INITIATOR_IN_BID,
    input  [1:0]  INITIATOR_IN_BRESP,
    input         INITIATOR_IN_BVALID,
    input  [63:0] INITIATOR_IN_RDATA,
    input  [3:0]  INITIATOR_IN_RID,
    input         INITIATOR_IN_RLAST,
    input  [1:0]  INITIATOR_IN_RRESP,
    input         INITIATOR_IN_RVALID,
    input         INITIATOR_IN_WREADY,
    output [37:0] INITIATOR_OUT_ARADDR,
    output [1:0]  INITIATOR_OUT_ARBURST,
    output [3:0]  INITIATOR_OUT_ARID,
    output [7:0]  INITIATOR_OUT_ARLEN,
    output [1:0]  INITIATOR_OUT_ARSIZE,
    output        INITIATOR_OUT_ARVALID,
    output [37:0] INITIATOR_OUT_AWADDR,
    output [1:0]  INITIATOR_OUT_AWBURST,
    output [3:0]  INITIATOR_OUT_AWID,
    output [7:0]  INITIATOR_OUT_AWLEN,
    output [1:0]  INITIATOR_OUT_AWSIZE,
    output        INITIATOR_OUT_AWVALID,
    output        INITIATOR_OUT_BREADY,
    output        INITIATOR_OUT_RREADY,
    output [63:0] INITIATOR_OUT_WDATA,
    output        INITIATOR_OUT_WLAST,
    output [7:0]  INITIATOR_OUT_WSTRB,
    output        INITIATOR_OUT_WVALID,
    
    output         TARGET_OUT_ARREADY,
    output         TARGET_OUT_AWREADY,
    output  [3:0]  TARGET_OUT_BID,
    output  [1:0]  TARGET_OUT_BRESP,
    output         TARGET_OUT_BVALID,
    output  [63:0] TARGET_OUT_RDATA,
    output  [3:0]  TARGET_OUT_RID,
    output         TARGET_OUT_RLAST,
    output  [1:0]  TARGET_OUT_RRESP,
    output         TARGET_OUT_RVALID,
    output         TARGET_OUT_WREADY,
    input [31:0] TARGET_IN_ARADDR,
    input [1:0]  TARGET_IN_ARBURST,
    input [3:0]  TARGET_IN_ARID,
    input [7:0]  TARGET_IN_ARLEN,
    input [1:0]  TARGET_IN_ARSIZE,
    input        TARGET_IN_ARVALID,
    input [31:0] TARGET_IN_AWADDR,
    input [1:0]  TARGET_IN_AWBURST,
    input [3:0]  TARGET_IN_AWID,
    input [7:0]  TARGET_IN_AWLEN,
    input [1:0]  TARGET_IN_AWSIZE,
    input        TARGET_IN_AWVALID,
    input        TARGET_IN_BREADY,
    input        TARGET_IN_RREADY,
    input [63:0] TARGET_IN_WDATA,
    input        TARGET_IN_WLAST,
    input [7:0]  TARGET_IN_WSTRB,
    input        TARGET_IN_WVALID
);

wire WRITE_OFFSET = (RESETN && TARGET_IN_AWVALID);
wire READ_OFFSET = (RESETN && TARGET_IN_ARVALID);

assign TARGET_OUT_ARREADY = INITIATOR_IN_ARREADY;
assign TARGET_OUT_AWREADY = INITIATOR_IN_AWREADY;
assign TARGET_OUT_BID = INITIATOR_IN_BID;
assign TARGET_OUT_BRESP = INITIATOR_IN_BRESP;
assign TARGET_OUT_BVALID = INITIATOR_IN_BVALID;
assign TARGET_OUT_RDATA = INITIATOR_IN_RDATA;
assign TARGET_OUT_RID = INITIATOR_IN_RID;
assign TARGET_OUT_RLAST = INITIATOR_IN_RLAST;
assign TARGET_OUT_RRESP = INITIATOR_IN_RRESP;
assign TARGET_OUT_RVALID = INITIATOR_IN_RVALID;
assign TARGET_OUT_WREADY = INITIATOR_IN_WREADY;
assign INITIATOR_OUT_ARADDR = {1'b0, READ_OFFSET, 1'b0, READ_OFFSET, 2'b0, TARGET_IN_ARADDR};
assign INITIATOR_OUT_ARBURST = TARGET_IN_ARBURST;
assign INITIATOR_OUT_ARID = TARGET_IN_ARID;
assign INITIATOR_OUT_ARLEN = TARGET_IN_ARLEN;
assign INITIATOR_OUT_ARSIZE = TARGET_IN_ARSIZE;
assign INITIATOR_OUT_ARVALID = TARGET_IN_ARVALID;
assign INITIATOR_OUT_AWADDR = {1'b0, WRITE_OFFSET, 1'b0, WRITE_OFFSET, 2'b0, TARGET_IN_AWADDR};
assign INITIATOR_OUT_AWBURST = TARGET_IN_AWBURST;
assign INITIATOR_OUT_AWID = TARGET_IN_AWID;
assign INITIATOR_OUT_AWLEN = TARGET_IN_AWLEN;
assign INITIATOR_OUT_AWSIZE = TARGET_IN_AWSIZE;
assign INITIATOR_OUT_AWVALID = TARGET_IN_AWVALID;
assign INITIATOR_OUT_BREADY = TARGET_IN_BREADY;
assign INITIATOR_OUT_RREADY = TARGET_IN_RREADY;
assign INITIATOR_OUT_WDATA = TARGET_IN_WDATA;
assign INITIATOR_OUT_WLAST = TARGET_IN_WLAST;
assign INITIATOR_OUT_WSTRB = TARGET_IN_WSTRB;
assign INITIATOR_OUT_WVALID = TARGET_IN_WVALID;

endmodule
