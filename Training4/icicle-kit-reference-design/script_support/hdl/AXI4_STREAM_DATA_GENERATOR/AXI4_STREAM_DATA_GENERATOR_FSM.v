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

module AXI4_STREAM_DATA_GENERATOR_FSM(
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire ready,
    output reg en
    );

    reg [1:0] state_reg, state_nxt;
    
    localparam [1:0]
        init = 2'b00,
        running = 2'b01,
        holding = 2'b11;

    
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) state_reg <= init;                           // on reset go to intial state
        else state_reg <= state_nxt;                            // otherwise next state
    end
    
    
    always @* begin
        state_nxt = state_reg;
        en = 1'b0;
        
        case(state_reg)
            init:                                               // initial state:
                begin
                    if (start) begin                            // only leave this state if start is asserted
                        state_nxt = running;                    // regardless of other states
                        en = 1'b1;
                    end else begin                              
                        state_nxt = init;  
                        en =  1'b0;                     
                    end                                         
                end
            running:                                            // running state
                begin
                    if (start && ready) begin                   // stay in the running state only if
                        state_nxt = running;                    // start and ready are asserted
                        en = 1'b1;
                    end 
                    else if (!start) begin                      // if start is deasserted return to initial state
                        state_nxt = init;                       
                        en = 1'b0;
                    end
                    else begin                                  // any other case go to holding state
                        state_nxt = holding;
                        en = 1'b0;
                    end
                end           
            holding:                                            // holding state
                begin
                    if (!start) begin                           // if start input is deasserted go to initial state
                        state_nxt = init;                   
                        en = 1'b0;
                    end else if (start && ready) begin          // go to running state if start & ready are asserted
                        state_nxt = running;                    // ie. when target is ready for new data
                        en = 1'b1;
                    end else begin                              
                        state_nxt = holding;                    // otherwise stay in holding state
                        en = 1'b0;
                    end
                end
            default:                                            // go to inital state
                begin
                    state_nxt = init;
                    en = 1'b0;
                end        
        endcase        
    end    

endmodule
