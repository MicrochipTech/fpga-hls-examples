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

module miv_ihcc_irqs (
    input wire logic            clk,
    input wire logic            resetn,
    input wire logic            wr_a,
    input wire logic            rd_a,
    input wire logic            wr_b,
    input wire logic            rd_b,
    input wire logic [5:0]      wdata_a,
    input wire logic [5:0]      wdata_b,
    output wire logic [5:0]    rdata_a,
    output wire logic [5:0]    rdata_b,
    output wire logic           rvalid_a,
    output wire logic           rvalid_b,
    output wire logic           mp_irq_a,
    output wire logic           mp_irq_b,
    output wire logic           ack_irq_a,
    output wire logic           ack_irq_b
    );    
    
    reg A_MP;   // bit 1
    reg A_MPIE; // bit 2
    reg A_ACK; // bit 4
    reg A_AIE; // bit 5
            
    reg B_MP;   // bit 1
    reg B_MPIE; // bit 2
    reg B_ACK; // bit 4
    reg B_AIE; // bit 5
    
    reg [5:0] data_out_a;
    reg [5:0] data_out_b;
    
    reg irq_a_mp;
    reg irq_b_mp;
    
    reg irq_a_ack;
    reg irq_b_ack;
    
    reg valid_a;
    reg valid_b;
    
    assign rdata_a = data_out_a;
    assign rdata_b = data_out_b;
    
    assign mp_irq_a = irq_a_mp;
    assign mp_irq_b = irq_b_mp;
    
    assign ack_irq_a = irq_a_ack;
    assign ack_irq_b = irq_b_ack;
    
    assign rvalid_a = valid_a;
    assign rvalid_b = valid_b;
           
    
    always @(posedge clk) begin
        if (!resetn) begin
            A_MP <= 0;
            A_MPIE <= 0;
            A_ACK <= 0;
            A_AIE <= 0;
            B_MP <= 0;
            B_MPIE <= 0;
            B_ACK <= 0;
            B_AIE <= 0;
            data_out_a <= 0;
            data_out_b <= 0;
            valid_a <= 0;
            valid_b <= 0;
        end
        if (wr_a && resetn) begin
            A_AIE <= wdata_a[5];
            A_ACK <= wdata_a[4];
            B_ACK <= wdata_a[3];
            A_MPIE <= wdata_a[2];
            A_MP <= wdata_a[1];
            B_MP <= wdata_a[0];
            valid_a <= 0;
        end else if (rd_a && resetn) begin 
            data_out_a <= {A_AIE, A_ACK, B_ACK, A_MPIE, A_MP, B_MP};
            valid_a <= 1;
        end else begin
            valid_a <= 0;
        end
        
        if (wr_b && resetn) begin
            B_AIE <= wdata_b[5];
            B_ACK <= wdata_b[4];
            A_ACK <= wdata_b[3];
            B_MPIE <= wdata_b[2];
            B_MP <= wdata_b[1];
            A_MP <= wdata_b[0];
            valid_b <= 0;
        end else if (rd_b && resetn) begin 
            data_out_b <= {B_AIE, B_ACK, A_ACK, B_MPIE, B_MP, A_MP};
            valid_b <= 1;
        end else begin 
            valid_b <= 0;
        end
    end
    
    always @(*) begin
        irq_a_mp <= 0;
        irq_b_mp <= 0;
        if (A_MP && A_MPIE) begin
            irq_a_mp <= 1;
        end
        if (B_MP && B_MPIE) begin
            irq_b_mp <= 1;
        end
    end
    
    always @(*) begin
        irq_a_ack <= 0;
        irq_b_ack <= 0;
        if (A_ACK && A_AIE) begin
            irq_b_ack <= 1;
        end
        if (B_ACK && B_AIE) begin
            irq_a_ack <= 1;
        end
    end
endmodule
