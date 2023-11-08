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

module ddr_write_controller_enc #(parameter g_DDR_AXI_AWIDTH = 32) (
    input              reset_i,       //System Reset
    input              sys_clk_i,     // System clock
    input              wrclk_reset_i, //Write clock reset
    input              wrclk_i,       //Write clock 
    input      [11:0]  fifo_count_i,  //Fifo count
    input              eof_i,         //End of Frame
    
    //from apb wrapper
    input              encoder_en_i,  //enable or start
    input              clr_intr_i,    //clear interrupt from apb

    input              write_ackn_i,  //Write Acknowledgement
    input              write_done_i,  //Write Done
    input      [9:0]   frame_ddr_addr_i, //Frame address to write
    output             fifo_reset_o,  //fifo reset
    
    output wire        read_fifo_o,    //Read Request to FIFO
    output wire        frm_interrupt_o,//interrupt to MSS
    
    //to apb wrapper
    output wire [1:0]  frame_idx_o, //frame index
    output wire [31:0] frame_size_o, //Frame Size
    
    //to arbiter
    output wire                        write_req_o, //Write Request to DDR
    output wire [g_DDR_AXI_AWIDTH-1:0] write_start_addr_o, //DDR memory address to write data
    output wire [7:0]                  write_length_o  //Write Burst size

    );

  localparam  IDLE = 2'b00,
              WRITE_REQUESTING = 2'b01,
              WRITING = 2'b10;

  reg  [1:0]   s_state;
  reg          s_eof_wrclk;
  reg  [9:0]   s_eof_sync_reg;
  reg          s_eof_reg;
  wire         s_set_eof_reg;
  reg          s_clr_eof_reg;
  reg          s_write_req;
  reg          s_read_fifo;
  wire[g_DDR_AXI_AWIDTH-1:0] s_write_start_addr;
  reg [8:0]   s_counter;
  reg [8:0]   s_count_max;
  reg [19:0]   s_line_counter;
  reg          s_frm_intr;
  reg [1:0]    s_clr_intr_r;//double flop
  reg [1:0]    s_frame_index;
  wire[1:0]    s_disp_frame_index;
  reg          s_last_data_in_frame;
  reg [31:0]   s_frame_size;
  reg [31:0]   s_frame_size_out;
  reg          encoder_en_dly1;

assign write_req_o          = s_write_req;
assign write_start_addr_o   = s_write_start_addr;
assign write_length_o       = s_count_max - 1'b1;
assign read_fifo_o          = s_read_fifo;
assign frame_size_o         = s_frame_size_out ;
assign frame_idx_o          = s_disp_frame_index;
assign frm_interrupt_o      = s_frm_intr;
assign fifo_reset_o         = ~(encoder_en_i & (~ encoder_en_dly1));
assign s_disp_frame_index   = s_frame_index - 1'b1 ;
assign s_write_start_addr   = {frame_ddr_addr_i[9:0], s_frame_index, s_line_counter};
assign s_set_eof_reg        = s_eof_sync_reg[9] & (~s_eof_sync_reg[8]) ; //neg edge

/*------------------------------------------------------------------------
-- Name       : EOF_SYNC
-- Description: Process to delay signal and find rising edge
------------------------------------------------------------------------*/
  always @( posedge wrclk_i or  negedge wrclk_reset_i)
  begin
    if (!wrclk_reset_i)   
      s_eof_wrclk <= 1'b0;
    else
      s_eof_wrclk <= eof_i;
  end
/*------------------------------------------------------------------------
-- Name       : INTR_GEN
-- Description: Process to generate and clear interrupt
------------------------------------------------------------------------*/
  always @ (posedge sys_clk_i or negedge reset_i)
  begin
	if (!reset_i) begin
      s_frm_intr           <= 1'b0;
    end 
    else begin
      if (s_clr_eof_reg && encoder_en_i) begin
        if (s_frame_size != 0)       
          s_frm_intr     <= 1'b1;
      end
      else if (s_clr_intr_r[1]) begin
        s_frm_intr     <= 1'b0;
      end    
    end
  end  
/*------------------------------------------------------------------------
-- Name       : SIGNAL_DELAY
-- Description: Process to delay signal and find rising edge
------------------------------------------------------------------------*/
  always @ (posedge sys_clk_i or negedge reset_i)
  begin
	if (!reset_i) begin
		s_eof_sync_reg     <= 0 ;
		s_eof_reg          <= 1'b0 ;
        encoder_en_dly1    <= 1'b0 ;
        s_clr_intr_r       <= 0;
	end
	else begin
		s_eof_sync_reg     <= {s_eof_sync_reg[8:0], s_eof_wrclk | eof_i} ;
        encoder_en_dly1    <= encoder_en_i;
        s_clr_intr_r       <= {s_clr_intr_r[0],clr_intr_i};
        
		if (s_set_eof_reg)      s_eof_reg <= 1'b1;
		else if (s_clr_eof_reg) s_eof_reg <= 1'b0;
	end
  end

/*------------------------------------------------------------------------
-- Name       : Write_FSM_PROC
-- Description: FSM implements Write operations
------------------------------------------------------------------------*/
  always @ (posedge sys_clk_i or negedge reset_i)
  begin
	if (!reset_i) begin
		s_state              <= IDLE;
		s_write_req          <= 1'b0;
		s_read_fifo          <= 1'b0;
		s_count_max          <= 0 ;
		s_counter            <= 0 ;        
		s_frame_index        <= 2'd0 ;
		s_line_counter       <= 20'd0 ;
		s_last_data_in_frame <= 1'b0 ;
		s_clr_eof_reg        <= 1'b0;
		s_frame_size         <= 32'd0 ;
		s_frame_size_out     <= 32'd0 ;
    end
	else begin                         
		case({s_state})
			IDLE : begin
				s_write_req <= 1'b0 ;
				s_read_fifo <= 1'b0 ;
				s_counter   <= 0 ;		
                s_clr_eof_reg <=  s_eof_reg & (fifo_count_i == 0) & (~s_clr_eof_reg) ;  

				if (s_clr_eof_reg && encoder_en_i) begin
					s_frame_index    <=  s_frame_index + 1'b1 ;
					s_frame_size_out <=  s_frame_size ;
					s_frame_size     <= 0 ;
					s_line_counter   <= 0 ;
                end
                else if (encoder_en_i == 0) begin
                    s_frame_size     <= 0 ;
                    s_frame_size_out <= 0 ;
                    s_line_counter   <= 0 ;
                    s_frame_index    <= 0 ;
				end
          
				if (!s_clr_eof_reg && ((s_eof_reg && (|fifo_count_i)) || (|fifo_count_i[11:4]))) begin
                    if (fifo_count_i > 256)
                      s_count_max <= 9'd256 ; //max 256 burst length
                    else  
					  s_count_max <= fifo_count_i[8:0] ;
					s_state       <= WRITE_REQUESTING ;
					s_last_data_in_frame <= s_eof_reg ;
				end   
			end
			WRITE_REQUESTING : begin
				if(write_ackn_i) begin
					s_write_req <= 1'b0;
					s_state     <= WRITING;
				end
				else begin
					s_write_req <= 1'b1 ;
				end
			end
			WRITING : begin
				if(write_done_i) begin     
					s_read_fifo    <= 1'b0;
					s_state        <= IDLE;
					s_clr_eof_reg  <= s_last_data_in_frame;
					s_line_counter <= s_line_counter + {s_count_max, 3'b000} ;
					s_frame_size   <= s_frame_size + {s_count_max, 3'b000} ;
				end
				else if(s_counter >= s_count_max) begin
					s_read_fifo <= 1'b0;
				end
				else begin
					s_counter   <= s_counter + 1'b1;
					s_read_fifo <= 1'b1;
				end
			end
			default : s_state <= IDLE;
		endcase
	end
end

endmodule

