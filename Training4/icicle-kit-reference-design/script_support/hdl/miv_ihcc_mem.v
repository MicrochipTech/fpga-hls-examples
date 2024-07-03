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

module miv_ihcc_mem #(parameter MESSAGE_DEPTH = 1) (
    input wire logic            clk,
    input wire logic            resetn,
    input wire logic            wr,
    input wire logic            rd,
    input wire logic [1:0]      wr_sel,
    input wire logic [1:0]      rd_sel,
    input wire logic [31:0]     wdata,
    output wire logic           wr_ready,
    output wire logic [31:0]    rdata,
    output wire logic           rvalid
    );                      
    
    //-----------------------------------------------------------------------------
    // Parameters
    //-----------------------------------------------------------------------------
    
    
    //-----------------------------------------------------------------------------
    // Signal Declarations
    //-----------------------------------------------------------------------------
    logic  [31:0]     register[MESSAGE_DEPTH];
    logic  [(MESSAGE_DEPTH - 1):0]     wr_en;
    reg   [31:0]     read_data;
    reg                rd_valid;
    

    //-----------------------------------------------------------------------------
    // Assignments
    //-----------------------------------------------------------------------------
    assign rdata = read_data;
    assign rvalid = rd_valid;
    
    // logic
    genvar mbx_reg;
    generate  
        for (mbx_reg = 0; mbx_reg <= (MESSAGE_DEPTH - 1); mbx_reg++) begin : gen_mbx_regs

            assign wr_en[mbx_reg] = wr & (wr_sel == mbx_reg[2:0]);

            always @(posedge clk)
            begin
                if(wr_en[mbx_reg])
                    register[mbx_reg] <= wdata;
            end

        end
    endgenerate

    assign wr_ready = 1'b1; // can always accept writes in this implemnetation when operand (wr data) is valid
    
      //read mux
    always @*
    begin
        read_data = 32'b0;
        rd_valid = 1'b0;
        for(int i = 0; i <= MESSAGE_DEPTH - 1; i++) 
        begin
          if(rd & (rd_sel == i[2:0])) begin
                read_data = register[i];
                rd_valid = 1'b1;
            end
        end
    end
        
endmodule
