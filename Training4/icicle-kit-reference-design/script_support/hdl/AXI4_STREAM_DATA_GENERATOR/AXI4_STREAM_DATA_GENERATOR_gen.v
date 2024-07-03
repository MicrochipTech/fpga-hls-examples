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

module AXI4_STREAM_DATA_GENERATOR_gen (
                input wire clk,
                input wire rst_n,
                input en,
                input wire [31:0] trans_size,                
                output wire tlast,
                output wire tvalid,
                input  wire tready,
                output wire [1:0] tdest,                
                output wire [3:0] tkeep,
                output wire [7:0] tid,                              
                output wire [3:0]  tstrb,
                output wire [31:0] tdata
                );

    localparam
        INC = 32'b 1;
    
    localparam
        TKEEP_WIDTH = 4,
        TSTRB_WIDTH = 4;
    
    reg tlast_ff,tvalid_ff;
    reg en_reg;
    reg [31:0] tdata_ff;
	wire        txn_done;
    
	assign txn_done = tready & tvalid & tlast;
	
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            tdata_ff <= 32'b1;
            tlast_ff <= 1'b0;
            tvalid_ff <= 1'b0;
			en_reg    <= 1'b0;
        end else if ((en | en_reg) & ~txn_done) begin
		    en_reg    <= 1'b1;
            tvalid_ff <= 1'b1;
            if(tready & tvalid)begin
			  tdata_ff <= tdata_ff + INC;
			  if (tdata_ff == trans_size-1) 
                tlast_ff <= 1'b1;
            end
        end else begin 
            tdata_ff <= 32'b1;
            tlast_ff <= 1'b0;
            tvalid_ff <= 1'b0;
            en_reg    <= 1'b0;
		end 
		
    end

    assign tdest = 2'b0;
    assign tid = 8'b0;

    assign tdata = tdata_ff;
    assign tvalid = tvalid_ff;
    assign tlast = tlast_ff;

    assign tkeep = {TKEEP_WIDTH{1'b1}};
    assign tstrb = {TSTRB_WIDTH{1'b1}};

endmodule
