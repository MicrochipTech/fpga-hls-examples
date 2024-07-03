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

module MIV_IHCIA (
    input wire logic        pclk,
    input wire logic        presetn,
    input wire logic        penable,
    input wire logic        psel,
    input wire logic [3:0]  paddr,
    input wire logic        pwrite,
    input wire logic [9:0]  pwdata,
    output     logic [9:0]  prdata,
    output     logic        pready,
    output     logic        pslverr,
    
    input      logic        CH0_MSG_PRESENT_IRQ,
    input      logic        CH0_ACK_IRQ,
    input      logic        CH1_MSG_PRESENT_IRQ,
    input      logic        CH1_ACK_IRQ,
    input      logic        CH2_MSG_PRESENT_IRQ,
    input      logic        CH2_ACK_IRQ,
    input      logic        CH3_MSG_PRESENT_IRQ,
    input      logic        CH3_ACK_IRQ,
    input      logic        CH4_MSG_PRESENT_IRQ,
    input      logic        CH4_ACK_IRQ,
    output     logic        IRQ  
    );       
    
    localparam IP_VERSION = 1;
    
    wire [9:0] irqs;
    reg [9:0] control;
    reg ch0_irq, ch1_irq, ch2_irq, ch3_irq, ch4_irq;
    
    assign pslverr = 0;    
    assign IRQ = (ch0_irq || ch1_irq || ch2_irq || ch3_irq || ch4_irq);
    assign irqs = {CH4_ACK_IRQ, CH4_MSG_PRESENT_IRQ, CH3_ACK_IRQ, CH3_MSG_PRESENT_IRQ, CH2_ACK_IRQ, CH2_MSG_PRESENT_IRQ, CH1_ACK_IRQ, CH1_MSG_PRESENT_IRQ, CH0_ACK_IRQ, CH0_MSG_PRESENT_IRQ};
    
    always @(posedge pclk) begin
        if (!presetn) begin
            prdata <= 0;
            pready <= 0;
            control <= 10'h3FF;
        end else begin
            if (psel) begin
                case (paddr[3:0])
                    4'b0: begin
                        if (!pwrite) begin
                            prdata <= IP_VERSION;
                            pready <= 1;
                        end
                    end
                    4'b100: begin
                        if (!pwrite) begin
                            prdata <= control;
                            pready <= 1;
                        end else if (pwrite) begin
                            control <= pwdata[9:0];
                            prdata <= 0;
                            pready <= 1;
                        end
                    end
                    4'b1000: begin
                        if (!pwrite) begin
                            prdata <= irqs;
                            pready <= 1;
                        end
                    end
                endcase 
            end else begin
                prdata <= 0;
                pready <= 0;
            end
        end                
    end
    
    always @(*) begin
        ch0_irq <= 0;
        ch1_irq <= 0;
        ch2_irq <= 0;
        ch3_irq <= 0;
        ch4_irq <= 0;
        if ((control[0] && irqs[0]) || (control[1] && irqs[1])) begin
            ch0_irq <= 1;
        end
        if ((control[2] && irqs[2]) || (control[3] && irqs[3])) begin
            ch1_irq <= 1;
        end
        if ((control[4] && irqs[4]) || (control[5] && irqs[5])) begin
            ch2_irq <= 1;
        end
        if ((control[6] && irqs[6]) || (control[7] && irqs[7])) begin
            ch3_irq <= 1;
        end
        if ((control[8] && irqs[8]) || (control[9] && irqs[9])) begin
            ch4_irq <= 1;
        end
    end

endmodule
