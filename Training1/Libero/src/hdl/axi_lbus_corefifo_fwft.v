//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_fwft.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//--=================================================================================================

`timescale 1ns / 100ps

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_fwft (
                        wr_clk,
                        rd_clk,
                        clk,
                        reset_rclk_top,
						reset_wclk_top,
                        empty,
                        aempty,
                        rd_en,
                        fifo_rd_en,
                        fifo_empty,
                        fifo_aempty,
                        fifo_dout,
                        wr_en,
                        din,
                        fwft_dvld,
                        reg_valid,
                        dout,
                        fifo_MEMRADDR,
                        fwft_MEMRADDR
                        );

   parameter                RDEPTH          = 10;
   parameter                WWIDTH          = 10;
   parameter                RWIDTH          = 10;
   parameter                WCLK_HIGH       = 1;
   parameter                RCLK_HIGH       = 1;
   parameter                RESET_LOW       = 1;
   parameter                WRITE_LOW       = 1;
   parameter                READ_LOW        = 1;
   parameter                PREFETCH        = 0;
   parameter                FWFT            = 0;
   parameter                SYNC            = 1;

   localparam RDEPTH_CAL      = (RDEPTH == 0) ? RDEPTH  : (RDEPTH-1); 
 
   input                  wr_clk;
   input                  rd_clk;
   input                  clk;
   input                  reset_rclk_top;
   input                  reset_wclk_top;
   input                  wr_en;
   input                  rd_en;
   output                 fifo_rd_en;
   input [RWIDTH-1 : 0]   fifo_dout;
   input                  fifo_empty;
   input                  fifo_aempty;
   input [WWIDTH - 1 : 0] din;
   input [RDEPTH_CAL : 0] fifo_MEMRADDR;

   output                  empty;
   output                  aempty;
   output [RWIDTH-1 : 0]   dout;
   output                  fwft_dvld;
   output                  reg_valid;   
   output [RDEPTH_CAL : 0] fwft_MEMRADDR;
   

   reg                     fifo_valid, dout_valid, middle_valid ;
   reg [RWIDTH - 1 : 0]    middle_dout;
   
   reg [RWIDTH - 1 : 0]    dout;
   
   wire [RWIDTH - 1 : 0]   fifo_dout;
   wire                    fifo_rd_en, fifo_empty;
   wire                    update_dout, update_middle;
   
   wire [RDEPTH_CAL : 0]   fwft_MEMRADDR;
   
   reg                     fifo_empty_r;
   wire                    fwft_dvld;  
   reg                     wr_p_r;
   reg                     reg_valid;
   wire                    we_p;
   reg                     we_p_r;
   wire                    re_p;
   reg                     re_p_d;
   wire                    aresetn;
   wire                    pos_rclk;
   wire                    pos_wclk;   

   reg                     empty_r;
   reg                     reg_valid_r;
   wire                    empty1;
   wire                    empty;
   reg                     update_dout_r;

   wire                    fifo_empty_pulse;
   reg                     fifo_empty_pulse_d;
   wire                    fifo_init_pulse;
   
   wire reset_wclk;
   wire reset_rclk;

   generate
      if(SYNC == 1) begin
         assign pos_rclk  = RCLK_HIGH ? clk  : ~clk;
         assign pos_wclk  = WCLK_HIGH ? clk  : ~clk;
      end
   endgenerate

   generate
      if(SYNC == 0) begin
         assign pos_rclk  = RCLK_HIGH ? rd_clk  : ~rd_clk;
         assign pos_wclk  = WCLK_HIGH ? wr_clk  : ~wr_clk;
      end
   endgenerate

   assign we_p  = WRITE_LOW ? (~wr_en) : (wr_en);
   assign re_p  = READ_LOW  ? (~rd_en) : (rd_en); 

   assign fwft_MEMRADDR = fifo_MEMRADDR ;
   
   assign update_middle = fifo_valid & (middle_valid == update_dout);
   assign update_dout   = (fifo_valid || middle_valid) && (re_p || !dout_valid);

   assign fifo_rd_en = !(fifo_empty) && !(middle_valid && dout_valid && fifo_valid); 

   assign empty   = !dout_valid ;

   assign aempty  = fifo_aempty | empty;  
   
    
  

		 


   assign reset_rclk  = reset_rclk_top;
   assign reset_wclk  = reset_wclk_top;

   always @(posedge pos_rclk or negedge reset_rclk) begin
      if(!reset_rclk) begin
         fifo_empty_r   <= 1'b0;
         update_dout_r   <= 'h0;
      end
      else begin
         fifo_empty_r   <= fifo_empty;
         update_dout_r   <= update_dout;
      end
   end
 
   assign fifo_empty_pulse = fifo_empty_r & !fifo_empty;

   assign fifo_init_pulse = !fifo_empty_pulse_d & fifo_empty_pulse;

    always @(posedge pos_rclk or negedge reset_rclk) begin
      if(!reset_rclk) begin
         re_p_d   <= 1'b0;
      end else begin
         re_p_d   <= re_p;
      end
    end

   always @(posedge pos_rclk or negedge reset_rclk) begin
      if(!reset_rclk) begin
         fifo_empty_pulse_d   <= 1'b0;
      end
      else begin
          if (fifo_empty_pulse == 1'b1) begin
              fifo_empty_pulse_d   <= 1'b1;
          end else if (fifo_empty == 1'b0 && fifo_empty_r == 1'b0) begin
              fifo_empty_pulse_d   <= 1'b0;
          end else begin
              fifo_empty_pulse_d   <= fifo_empty_pulse_d;
          end
      end
   end

   always @(posedge pos_rclk or negedge reset_rclk) begin
      if(!reset_rclk) begin
         fifo_valid   <= 1'b0;
         middle_valid <= 1'b0;
         dout_valid   <= 1'b0;
         dout         <= 'h0;
         middle_dout  <= 'h0;
      end
      else begin
         if(update_middle) begin
            middle_dout  <= fifo_dout;
         end
         if(update_dout) begin
            dout  <= middle_valid ? middle_dout : fifo_dout;  
         end
         
         if(fifo_rd_en) begin
            fifo_valid  <= 1'b1;
         end
         else if(update_middle || update_dout) begin
            fifo_valid  <= 1'b0;
         end
         
         if(update_middle) begin
            middle_valid  <= 1'b1;
         end
         else if(update_dout) begin
            middle_valid  <= 1'b0;
         end
 
         if(update_dout) begin
            dout_valid  <= 1'b1;
         end
         else if(re_p) begin
            dout_valid  <= 1'b0;
         end
 
      end
   end      

   generate
      if(FWFT == 1) begin
           assign  fwft_dvld = dout_valid;              
      end
   endgenerate

   generate
      if(PREFETCH == 1) begin
         assign  fwft_dvld = (re_p) & dout_valid;
      end
   endgenerate
            
   always @(*) begin
      if(re_p == 1'b1) begin 
         reg_valid  = 1'b0;
      end
      else if(empty == 1'b0 && empty_r == 1'b1) begin
         reg_valid  = 1'b1;
      end
      else begin
         reg_valid  = reg_valid_r;
      end
   end      
   
   always @(posedge pos_rclk or negedge reset_rclk) begin
      if(!reset_rclk) begin
         empty_r   <= 1'b0;         
         reg_valid_r   <= 1'b0;         
      end
      else begin
         empty_r   <= empty;         
         reg_valid_r   <= reg_valid;         
      end
   end

   always @(posedge pos_wclk or negedge reset_wclk) begin
      if(!reset_wclk) begin
         we_p_r   <= 1'b0;         
      end
      else begin
         we_p_r   <= we_p;         
      end
   end

endmodule
