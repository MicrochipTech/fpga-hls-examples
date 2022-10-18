//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_async.v

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

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_async (
                       rclk,
                       wclk,
                       reset_rclk,
					   reset_wclk,
                       we,
                       re,
                       re_top,
                       full,
                       afull,
                       wrcnt,
                       empty,
                       aempty,
                       rdcnt,
                       underflow,
                       overflow,
                       dvld,
                       wack,
                       memwaddr,
                       memwe,
                       memraddr,
                       memre
                       );


   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter WRITE_WIDTH      = 32;
   parameter WRITE_DEPTH      = 10;
   parameter FULL_WRITE_DEPTH = 1024;
   parameter READ_WIDTH       = 32;
   parameter READ_DEPTH       = 10;
   parameter VAR_ASPECT_WRDEPTH = 10;
   parameter VAR_ASPECT_RDDEPTH = 10;
   parameter FULL_READ_DEPTH  = 1024;
   parameter PREFETCH         = 0;
   parameter FWFT             = 0;
   parameter WCLK_HIGH        = 1;
   parameter RCLK_HIGH        = 1;
   parameter RESET_LOW        = 1;
   parameter WRITE_LOW        = 1;
   parameter READ_LOW         = 1;
   parameter AF_FLAG_STATIC   = 1;
   parameter AE_FLAG_STATIC   = 1;
   parameter AFULL_VAL        = 1020;
   parameter AEMPTY_VAL       = 4;
   parameter ESTOP            = 1;
   parameter FSTOP            = 1;
   parameter PIPE             = 1;
   parameter REGISTER_RADDR   = 1;
   parameter READ_DVALID      = 1;
   parameter WRITE_ACK        = 1;
   parameter OVERFLOW_EN      = 1; 
   parameter UNDERFLOW_EN     = 1; 
   parameter WRCNT_EN         = 1; 
   parameter RDCNT_EN         = 1; 
   
   parameter NUM_STAGES       = 2; ///To select the number of synchonizer  stages -----------AI 
  // parameter SYNC_RESET       = 0;
   localparam WDEPTH_CAL      = (WRITE_DEPTH == 0) ? WRITE_DEPTH : (WRITE_DEPTH-1); 
   localparam RDEPTH_CAL      = (READ_DEPTH == 0)  ? READ_DEPTH  : (READ_DEPTH-1); 
   //localparam HIGH_FREQUENCY = (FWFT == 1 || PREFETCH == 1) ? 0 : 0;
   localparam HIGH_FREQUENCY =  0;

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------
   
   //--------
   // Inputs
   //--------
   input                       rclk;                   // read clock
   input                       wclk;                   // write clock
   input                       reset_rclk;                  // reset
   input                       reset_wclk;                  // reset
                                                        
   input                       we;                     // write enable to fifo
   input                       re;                     // read enable to fifo
   input                       re_top;                 // Top level read enable to fifo

   //---------
   // Outputs
   //---------
   output                      full;                   // full status flag
   output                      afull;                  // almost full status flag
   output [WRITE_DEPTH:0]      wrcnt;                  // number of elements remaining in write domain
                                                        
   output                      empty;                  // empty status flag
   output                      aempty;                 // almost empty status flag
   output [READ_DEPTH:0]       rdcnt;                  // number of elements remaining in read domain
                                                        
   output                      underflow;              // underflow status flag
   output                      overflow;               // overflow status flag
   output                      dvld;                   // dvld status flag
   output                      wack;                   // wack status flag

   output [WDEPTH_CAL:0]       memwaddr;               // memory write address
   output                      memwe;                  // memory write enable
   output [RDEPTH_CAL:0]       memraddr;               // memory read address
   output                      memre;                  // memory read enable

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg [WRITE_DEPTH : 0]          wptr;
   reg [WRITE_DEPTH : 0]          wptr_fwft;
   reg [READ_DEPTH  : 0]          rptr;
   reg [READ_DEPTH  : 0]          rptr_fwft;
   reg [WRITE_DEPTH:0]            wrcnt_r;
   reg [READ_DEPTH:0]             rdcnt_r;
   reg                            full_r;
   reg                            afull_r;
   reg                            empty_r;
   reg                            aempty_r;
   reg [WDEPTH_CAL:0]             memwaddr_r;
   reg [RDEPTH_CAL:0]             memraddr_r;
   reg                            dvld_r;
   reg                            dvld_r2;
   reg                            underflow_r;
   reg                            wack_r;
   reg                            overflow_r;
   reg [WRITE_DEPTH : 0]          wptr_bin_sync2;
   reg [READ_DEPTH  : 0]          rptr_bin_sync2;
   reg [READ_DEPTH  : 0]          rptr_bin_sync2_fwft;
   reg [VAR_ASPECT_WRDEPTH : 0]   wptrsync_shift;
   reg [VAR_ASPECT_RDDEPTH : 0]   rptrsync_shift;
   reg [VAR_ASPECT_RDDEPTH : 0]   rptrsync_shift_fwft;
   reg  [WRITE_DEPTH : 0]         wptr_gray;
   reg  [READ_DEPTH  : 0]         rptr_gray;
   reg  [READ_DEPTH  : 0]         rptr_gray_fwft;
   reg                            empty_r_fwft;
   reg                            aempty_r_fwft;
   reg                            full_reg;
   reg                            empty_reg;
   reg                            we_p_r;
   reg                            re_p_d1;
   reg                            re_p_d2;

   wire [WRITE_DEPTH : 0]         wptr_gray_sync;
   wire [READ_DEPTH  : 0]         rptr_gray_sync;
   wire [READ_DEPTH  : 0]         rptr_gray_sync_fwft;
   wire [WRITE_DEPTH : 0]         wptr_bin_sync;
   wire [READ_DEPTH  : 0]         rptr_bin_sync;
   wire [READ_DEPTH  : 0]         rptr_bin_sync_fwft;
   wire [WRITE_DEPTH:0]           afthreshi;
   wire [READ_DEPTH:0]            aethreshi;
   
   //wire [WRITE_DEPTH:0]           wdiff_bus;
   //wire [READ_DEPTH:0]            rdiff_bus;
   
   reg [WRITE_DEPTH:0]           wdiff_bus;
   reg [READ_DEPTH:0]            rdiff_bus;
   
   //wire [WRITE_DEPTH:0]           wdiff_bus_fwft;
   //wire [READ_DEPTH:0]            rdiff_bus_fwft;
   
   reg [WRITE_DEPTH:0]            wdiff_bus_fwft;
   reg [READ_DEPTH:0]             rdiff_bus_fwft;
   wire                           fulli;
   wire                           almostfulli;
   wire                           emptyi;
   wire                           emptyi_fwft;
   wire                           almostemptyi;
   wire                           almostemptyi_assert;
   wire                           almostemptyi_deassert;
   wire                           almostemptyi_fwft;
   wire                           we_p_xor;
   wire                           fulli_fstop;     
   wire                           fulli_fstop_assert;     
   wire                           fulli_fstop_deassert;     
   wire                           emptyi_estop;  
   wire                           aresetn;
  // wire                           sresetn;
   wire                           re_p;
   wire                           re_top_p;
   wire                           we_p;
   wire                           almostfulli_assert;
   wire                           almostfulli_deassert;
   wire                           pos_rclk;
   wire                           pos_wclk;
   wire                           we_i;
   wire                           re_i;
   
   
 
   
   // --------------------------------------------------------------------------
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // ||                                                                      ||
   // ||                     Start - of - Code                                ||
   // ||                                                                      ||
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // --------------------------------------------------------------------------

   // --------------------------------------------------------------------------
   // clocks and enables
   // --------------------------------------------------------------------------
   assign pos_rclk  = RCLK_HIGH ? rclk  : ~rclk;
   assign pos_wclk  = WCLK_HIGH ? wclk  : ~wclk;
  

   assign full      = full_r;
   assign afull     = afull_r;
   assign empty     = empty_r;
   assign aempty    = aempty_r;
   assign underflow = underflow_r;
   assign wack      = wack_r;
   assign overflow  = overflow_r;
   assign memwaddr  = memwaddr_r;
   assign memraddr  = memraddr_r;
   assign wrcnt     = wrcnt_r;
   assign rdcnt     = rdcnt_r;
   

   // --------------------------------------------------------------------------
   // Read and Write enables
   // --------------------------------------------------------------------------
   generate 
      if (FWFT == 0 && PREFETCH == 0)  begin
         assign re_p  = READ_LOW  ? (~re) : (re);
         assign we_p  = WRITE_LOW ? (~we) : (we);
      end
   endgenerate
   generate
      if ((FWFT == 1 || PREFETCH == 1) && PIPE == 1)  begin
         assign re_p  = re;
         assign re_top_p  = READ_LOW  ? (~re_top) : (re_top);
         assign we_p  = WRITE_LOW ? (~we) : (we);
      end
   endgenerate

   assign we_i  = we_p & !full_r ;
   assign re_i  = re_p & !empty_r;

   assign dvld  = (REGISTER_RADDR==2) ? dvld_r2 : 
	          ((REGISTER_RADDR == 1 && PREFETCH == 0) ? dvld_r : re_i);

   // --------------------------------------------------------------------------
   // Full FIFO flags
   // --------------------------------------------------------------------------
   generate 
      if (FWFT == 0 && PREFETCH == 0)  begin
         assign fulli  = we_p ? (wdiff_bus >= (FULL_WRITE_DEPTH-1)) : 
                                (wdiff_bus >= (FULL_WRITE_DEPTH));     
      end
   endgenerate

   generate
      if ((FWFT == 1 || PREFETCH == 1) && PIPE == 1)  begin
         assign fulli  = we_p ? (wdiff_bus_fwft >= (FULL_WRITE_DEPTH-1)) : 
                                (wdiff_bus_fwft >= (FULL_WRITE_DEPTH));     
      end
   endgenerate

   assign fulli_fstop_assert    = ((wdiff_bus[WRITE_DEPTH - 1:0]  == (FULL_WRITE_DEPTH-1)) && !full_r && we_p)  ? 1'b1 : 1'b0;      
   assign fulli_fstop_deassert  = ((we_p && full_r) || (wdiff_bus < FULL_WRITE_DEPTH-1)) ? 1'b1 : 1'b0;      
   assign fulli_fstop = fulli_fstop_assert  ? 1'b1 : (fulli_fstop_deassert ? 1'b0 : full_r);      

   // --------------------------------------------------------------------------
   // Empty FIFO flags
   // --------------------------------------------------------------------------
   generate 
   
   if(HIGH_FREQUENCY == 1) begin
     assign emptyi = ((rdiff_bus == 2) & re_p & re_p_d1) | ((rdiff_bus == 1) & (re_p | re_p_d1)) | (rdiff_bus == 0);
   end else begin
     assign emptyi = (rdiff_bus <= 1);   
   end

   endgenerate
   
   
   assign emptyi_estop = re_p ? (rdiff_bus == 1) : (rdiff_bus <= 0);   
   assign emptyi_fwft = (rdiff_bus_fwft <= 1);   

   // --------------------------------------------------------------------------
   // Difference between write pointer and read pointer.
   // Modiying the pointer logic for HIGH frequency
   // --------------------------------------------------------------------------
   generate 
   
   //if( HIGH_FREQUENCY == 1) begin
   //    always@(posedge pos_wclk /*or negedge aresetn*/) 
   //       wdiff_bus <= (wptr -rptrsync_shift);
   //    always@(posedge pos_rclk)
   //        rdiff_bus <= (wptrsync_shift - rptr);
   //end else begin
   //    always@(*) wdiff_bus = (wptr - rptrsync_shift);
   //    always@(*) rdiff_bus = (wptrsync_shift - rptr);
   //end
   //endgenerate


   // SAR-66987 - DCFIFO RTL Enhancement for performance
   if( HIGH_FREQUENCY == 1) begin
       always@(posedge pos_wclk or negedge reset_wclk) begin
          if (!reset_wclk) begin
            wdiff_bus <= 'h0;
          end else begin
            wdiff_bus <= (wptr -rptrsync_shift);
          end
       end
       
       always@(posedge pos_rclk or negedge reset_rclk) begin
           if (!reset_rclk) begin
             rdiff_bus <= 'h0; 
           end else begin
             rdiff_bus <= (wptrsync_shift - rptr);
           end
       end
   end else begin
       always@(*) wdiff_bus = (wptr - rptrsync_shift);
       always@(*) rdiff_bus = (wptrsync_shift - rptr);
   end
   endgenerate

   //assign rdiff_bus = (wptrsync_shift - rptr); 
   //assign wdiff_bus = (wptr - rptrsync_shift); 

generate
   if (HIGH_FREQUENCY == 1) begin
     always@(posedge pos_wclk or negedge reset_wclk) begin
          if (!reset_wclk) begin
              wdiff_bus_fwft <= 'h0;
          end else begin
              wdiff_bus_fwft <= (wptr - rptrsync_shift_fwft); 
          end
     end

     always@(posedge pos_rclk or negedge reset_rclk) begin
          if (!reset_rclk) begin
              rdiff_bus_fwft <= 'h0;
          end else begin
              rdiff_bus_fwft <= (wptrsync_shift - rptr_fwft); 
          end
      end
   
  end else begin
     always@(*) rdiff_bus_fwft = (wptrsync_shift - rptr_fwft); 
     always@(*) wdiff_bus_fwft = (wptr - rptrsync_shift_fwft); 
  end
endgenerate

     //assign rdiff_bus_fwft = (wptrsync_shift - rptr_fwft); 
     //assign wdiff_bus_fwft = (wptr - rptrsync_shift_fwft); 

   // --------------------------------------------------------------------------
   // Set threshold values
   // --------------------------------------------------------------------------
   assign afthreshi    =  AF_FLAG_STATIC ? (AFULL_VAL-1)  : FULL_WRITE_DEPTH;
   assign aethreshi    =  AE_FLAG_STATIC ? AEMPTY_VAL : 2;

   // --------------------------------------------------------------------------
   // Generate almost flags
   // --------------------------------------------------------------------------
   generate 
      if (FWFT == 0 && PREFETCH == 0)  begin
         //assign almostfulli           =  wdiff_bus >= afthreshi;
         assign almostfulli_assert    =  we_p & (wdiff_bus >= afthreshi);
         assign almostfulli_deassert  =  (wdiff_bus <= afthreshi);
         //assign almostemptyi_assert   =  (aethreshi >= rdiff_bus);    
         assign almostemptyi_assert   =  re_p & (aethreshi >= rdiff_bus);
         assign almostemptyi_deassert =  (aethreshi <= rdiff_bus) & aempty;  
         //assign almostemptyi          =  almostemptyi_deassert ? 1'b0 : (almostemptyi_assert ? 1'b1 : aempty);
         
         if (HIGH_FREQUENCY == 1) begin
          assign almostemptyi          =  (aethreshi >= rdiff_bus); //almostemptyi_deassert ? 1'b0 : (almostemptyi_assert ? 1'b1 : aempty);
        end else begin
          assign almostemptyi          =  almostemptyi_deassert ? 1'b0 : (almostemptyi_assert ? 1'b1 : aempty);
          assign almostfulli           =  almostfulli_assert    ? 1'b1 : (almostfulli_deassert? 1'b0 : afull );
        end

      end
   endgenerate

   generate
      if ((FWFT == 1 || PREFETCH == 1) && PIPE == 1)  begin
         //assign almostfulli  =  wdiff_bus_fwft >= afthreshi;
         assign almostfulli_assert    =  we_p & (wdiff_bus_fwft >= afthreshi);
         assign almostfulli_deassert  =  (wdiff_bus_fwft <= afthreshi);
         assign almostfulli           =  almostfulli_assert ? 1'b1 : (almostfulli_deassert? 1'b0 : afull );

         //***HARI***assign almostemptyi_assert   =  (aethreshi+1 >= rdiff_bus_fwft) && re_top_p;  
         assign almostemptyi_assert   =  (aethreshi +1 >= rdiff_bus_fwft) && re_top_p;  
         //***HARI***assign almostemptyi_deassert =  (aethreshi+1 < rdiff_bus_fwft);  
         assign almostemptyi_deassert =  (aethreshi +1 <= rdiff_bus_fwft) & aempty;  
         //***HARI***assign almostemptyi          =  almostemptyi_deassert ? 1'b0 : (almostemptyi_assert ? 1'b1 : aempty_r); 
         assign almostemptyi          =  almostemptyi_deassert ? 1'b0 : (almostemptyi_assert ? 1'b1 : aempty); 
         assign almostemptyi_fwft     =  aethreshi >= rdiff_bus_fwft;
      end
   endgenerate


   // --------------------------------------------------------------------------
   // Instance::Sync Write gray pointer
   // --------------------------------------------------------------------------
   ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_NstagesSync #(
                .NUM_STAGES(NUM_STAGES),
                .ADDRWIDTH(WRITE_DEPTH)
               // .SYNC_RESET       (SYNC_RESET     )		
                )
                Wr_corefifo_NstagesSync(
                              .clk     (pos_rclk),
                              .rstn    (reset_rclk),
                              .inp     (wptr_gray),
                              .sync_out(wptr_gray_sync)
                              );
   
   // --------------------------------------------------------------------------
   // Instance::Sync Read gray pointer
   // --------------------------------------------------------------------------
   ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_NstagesSync #(
                .NUM_STAGES(NUM_STAGES),
                .ADDRWIDTH(READ_DEPTH)
               // .SYNC_RESET       (SYNC_RESET     )		
                )
                Rd_corefifo_NstagesSync(
                              .clk     (pos_wclk),
                              .rstn    (reset_wclk),
                              .inp     (rptr_gray),
                              .sync_out(rptr_gray_sync)
                              );

   // --------------------------------------------------------------------------
   // Instance::Read gray-to-binary conversion logic
   // --------------------------------------------------------------------------
   ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_grayToBinConv #(
                   .ADDRWIDTH(READ_DEPTH)
                   )
                   Rd_corefifo_grayToBinConv(
                                    .gray_in(rptr_gray_sync),
                                    .bin_out(rptr_bin_sync)
                                    );

   // --------------------------------------------------------------------------
   // Instance::Write gray-to-binary conversion logic
   // --------------------------------------------------------------------------
   ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_grayToBinConv #(
                   .ADDRWIDTH(WRITE_DEPTH)
                   )
                   Wr_corefifo_grayToBinConv(
                                    .gray_in(wptr_gray_sync),
                                    .bin_out(wptr_bin_sync)
                                    );



   // --------------------------------------------------------------------------
   // Register the binary write pointer value
   // --------------------------------------------------------------------------
   // History::SAR#60021 - Added reset
   // --------------------------------------------------------------------------
   always @(posedge pos_rclk or negedge reset_rclk)
     begin
        if(!reset_rclk) begin
          wptr_bin_sync2  <= 'h0;
        end
        else begin	     
          wptr_bin_sync2 <= wptr_bin_sync;
        end
     end
   
   // --------------------------------------------------------------------------
   // Register the binary read pointer value
   // --------------------------------------------------------------------------
   // History::SAR#60021 - Added reset
   // --------------------------------------------------------------------------
   always @(posedge pos_wclk or negedge reset_wclk)
     begin
        if(!reset_wclk) begin
          rptr_bin_sync2  <= 'h0;
        end
        else begin
     	  rptr_bin_sync2 <= rptr_bin_sync;
        end
     end


   // --------------------------------------------------------------------------
   // Instance::Sync Read gray pointer
   // --------------------------------------------------------------------------
   ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_NstagesSync #(
                .NUM_STAGES(NUM_STAGES),
                .ADDRWIDTH(READ_DEPTH)
              //  .SYNC_RESET       (SYNC_RESET     )		
                )
                Rd_corefifo_NstagesSync_fwft(
                              .clk     (pos_wclk),
                              .rstn    (reset_wclk),
                              .inp     (rptr_gray_fwft),
                              .sync_out(rptr_gray_sync_fwft)
                              );

   // --------------------------------------------------------------------------
   // Instance::Read gray-to-binary conversion logic
   // --------------------------------------------------------------------------
   ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_grayToBinConv #(
                   .ADDRWIDTH(READ_DEPTH)
                   )
                   Rd_grayToBinConv_fwft(
                                    .gray_in(rptr_gray_sync_fwft),
                                    .bin_out(rptr_bin_sync_fwft)
                                    );

   // --------------------------------------------------------------------------
   // Register the binary read pointer value
   // --------------------------------------------------------------------------
   // History::SAR#60021 - Added reset
   // --------------------------------------------------------------------------
   always @(posedge pos_wclk or negedge reset_wclk)  
     begin
        if(!reset_wclk) begin
          rptr_bin_sync2_fwft  <= 'h0;
        end
        else begin
     	  rptr_bin_sync2_fwft <= rptr_bin_sync_fwft;
        end
     end


   // --------------------------------------------------------------------------
   // For variable aspect ratios
   // The variable aspect logic is handled by shifting the required bits of the
   // read/write pointer so that they are of the same width. 
   // --------------------------------------------------------------------------
    always @(wptr_bin_sync2 or rptr_bin_sync2)
    begin
       if (WRITE_DEPTH > READ_DEPTH) begin
            rptrsync_shift <= rptr_bin_sync2<<(WRITE_DEPTH - READ_DEPTH);
            wptrsync_shift <= wptr_bin_sync2>>(WRITE_DEPTH - READ_DEPTH);
       end
       else if (READ_DEPTH > WRITE_DEPTH) begin
            rptrsync_shift <= rptr_bin_sync2>>(READ_DEPTH - WRITE_DEPTH);
            wptrsync_shift <= wptr_bin_sync2<<(READ_DEPTH - WRITE_DEPTH);
       end
       else begin
            rptrsync_shift <= rptr_bin_sync2;
            wptrsync_shift <= wptr_bin_sync2;
       end
    end

    always @(wptr_bin_sync2 or rptr_bin_sync2_fwft)
    begin
       if (WRITE_DEPTH > READ_DEPTH) begin
            rptrsync_shift_fwft <= rptr_bin_sync2_fwft<<(WRITE_DEPTH - READ_DEPTH);
       end
       else if (READ_DEPTH > WRITE_DEPTH) begin
            rptrsync_shift_fwft <= rptr_bin_sync2_fwft>>(READ_DEPTH - WRITE_DEPTH);
       end
       else begin
            rptrsync_shift_fwft <= rptr_bin_sync2_fwft;
       end
    end

    always @(posedge pos_rclk or negedge reset_rclk)
    begin
       if (!reset_rclk) begin
          dvld_r2    <= 0;
          empty_reg  <= 1'b1;
          re_p_d1    <= 'h0;
          re_p_d2    <= 'h0;
       end
       else begin
          dvld_r2   <= dvld_r;
          empty_reg <= empty;
          re_p_d1   <= re_p;
          re_p_d2   <= re_p_d1;
       end
    end

    always @(posedge pos_wclk or negedge reset_wclk)  
      begin
         if(!reset_wclk) begin
           full_reg  <= 1'b0;
           we_p_r  <= 1'b0;  
         end
         else begin
           full_reg <= full;
           we_p_r <= we_p;
         end
      end 

    assign we_p_xor = we_p ^ we_p_r; 

    // --------------------------------------------------------------------------    
    // Update the pointer values based in ESTOP and FSTOP parameters.
    // Generate the status flags - Empty/Full/Almost Empty/ Almost Full
    // Generate the data handshaking flags - DVLD/WACK
    // Generate error count flags - Underflow/Overflow
    // Generate control signals to the external memory
    // --------------------------------------------------------------------------    
 
   genvar k;
   generate 

         if(ESTOP == 1 && FSTOP == 1) begin  

            // --------------------------------------------------------------------------
            // Write pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_wclk or negedge reset_wclk) begin
               if (!reset_wclk) begin
                  wptr <= 'h0;
                  wptr_gray <= 'h0;
               end
               else if(we_i == 1'b1) begin                               
                  wptr <= wptr + 1;
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
               else begin    
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
            end
   
            // --------------------------------------------------------------------------
            // Read pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_rclk or negedge reset_rclk) begin
               if (!reset_rclk) begin
                  rptr <= 'h0;
                  rptr_gray <= 'h0;
               end
               else if(re_i == 1'b1) begin          
                  rptr <= rptr + 1;
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
               else begin 
	          rptr_gray <= (rptr>>1) ^ rptr;
               end
            end

            always @(posedge pos_rclk or negedge reset_rclk) begin
               if (!reset_rclk) begin
                  rptr_fwft <= 'h0;
                  rptr_gray_fwft <= 'h0;
               end
               else if(re_top_p == 1'b1 && !empty_r_fwft && (FWFT == 1 || PREFETCH == 1)) begin          
                  rptr_fwft <= rptr_fwft + 1;
		  rptr_gray_fwft <= (rptr_fwft>>1) ^ rptr_fwft;
               end
               else begin 
	          rptr_gray_fwft <= (rptr_fwft>>1) ^ rptr_fwft;
               end
            end

            // Generation of empty, almost empty, read data valid flags and read count on read clock
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    empty_r   <= 1'b1;
                    empty_r_fwft   <= 1'b1;
                    aempty_r_fwft  <= 1'b1;
                    aempty_r  <= 1'b1;
                    dvld_r    <= 1'b0;
                    rdcnt_r   <= 'h0;
                    underflow_r <= 1'b0;
                 end
                 else begin
                    if((re_p & (rdiff_bus == 1))) begin  
                         empty_r   <= 1'b1;          
                    end
                    else if((!re_p & (rdiff_bus == 1))) begin
                         empty_r   <= 1'b0;        
                    end
                    else begin
                         empty_r   <= emptyi;          
                    end  

                    aempty_r  <= almostemptyi;
                    aempty_r_fwft  <= almostemptyi_fwft;

                    if((re_top_p & (rdiff_bus_fwft == 1))) begin  
                         empty_r_fwft   <= 1'b1;          
                    end
                    else if((!re_top_p & (rdiff_bus_fwft == 1))) begin
                         empty_r_fwft   <= 1'b0;          
                    end
                    else begin
                         empty_r_fwft   <= emptyi_fwft;          
                    end  
		      
	      	    if(RDCNT_EN == 1 && FWFT == 0 && PREFETCH == 0) begin
                       rdcnt_r   <= rdiff_bus;
	            end
	            else if(RDCNT_EN == 1 && (FWFT == 1 || PREFETCH == 1)) begin
                       rdcnt_r   <= rdiff_bus_fwft;
	            end
	            else begin
                       rdcnt_r  <= rdcnt_r;
	            end

                    if(re_i == 1'b1 && READ_DVALID == 1'b1) begin
                       dvld_r  <= 1'b1;                       
                    end
                    else begin
                       dvld_r  <= 1'b0;            
                    end

                    if(re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1 && FWFT == 0 && PREFETCH == 0) begin
                       underflow_r <= 1'b1;
                    end
                    else if(re_top_p == 1'b1 && empty_r_fwft == 1'b1 && UNDERFLOW_EN == 1 && (FWFT == 1 || PREFETCH == 1)) begin
                       underflow_r <= 1'b1;
                    end
                    else begin
                       underflow_r <= 1'b0;
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)            

            // Generation of full, almost full, write acknowledge flags and write count on write clock
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    full_r   <= 1'b0;
                    afull_r  <= 1'b0;
                    wack_r   <= 1'b0;
                    wrcnt_r  <= 'h0;                    
                    overflow_r <= 1'b0;
                 end
                 else begin
                    full_r   <= FSTOP ? fulli : fulli_fstop;    
                    afull_r  <= almostfulli;
                    if(WRCNT_EN == 1 && FWFT == 0 && PREFETCH == 0) begin  
                       wrcnt_r  <= wdiff_bus;
                    end
                    else if(WRCNT_EN == 1 && (FWFT == 1 || PREFETCH == 1)) begin  
                       wrcnt_r  <= wdiff_bus_fwft;
                    end
		    else begin
                       wrcnt_r  <= wrcnt_r;
		    end

                    if(we_i == 1'b1 && WRITE_ACK == 1) begin
                       wack_r  <= 1'b1;                       
                    end
                    else begin
                       wack_r  <= 1'b0;                       
                    end

                    if(we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1) begin   
                       overflow_r <= 1'b1;
                    end
                    else begin
                       overflow_r <= 1'b0;
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)
            
            // Generation of write address to external memory
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    memwaddr_r <= 'h0;
                 end
                 else begin
                    if(we_i == 1'b1) begin    
                       if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                          memwaddr_r <= 'h0;
			  end else begin
                          memwaddr_r <= memwaddr_r + 1;
                       end
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)

            // Generation of read address to external memory
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    memraddr_r <= 'h0;
                 end
                 else begin
                    if(re_i == 1'b1) begin         
                       if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                          memraddr_r <= 'h0;
			  end else begin
                          memraddr_r <= memraddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)

            // Generation of write/read enable to external memory
    	    assign memwe = we_i;
            assign memre = re_i;   

         end
         else if(ESTOP == 1 && FSTOP == 0) begin  
            // --------------------------------------------------------------------------
            // Write pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_wclk or negedge reset_wclk) begin
               if (!reset_wclk) begin
                  wptr <= 'h0;
                  wptr_gray <='h0;
               end 
               else if(we_p == 1'b1) begin     
                  wptr <= wptr + 1;
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
               else begin
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
            end
   
            // --------------------------------------------------------------------------
            // Read pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_rclk or negedge reset_rclk) begin
               if (!reset_rclk ) begin
                  rptr <= 'h0;
                  rptr_gray <= 'h0;
               end
               else if(re_i == 1'b1) begin 
                  rptr <= rptr + 1;
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
               else begin
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
            end

            // Generation of empty, almost empty, read data valid flags and read count on read clock
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    empty_r   <= 1'b1;
                    aempty_r  <= 1'b1;
                    dvld_r    <= 1'b0;
                    rdcnt_r   <= 'h0;                    
                    underflow_r <= 1'b0;
                 end
                 else begin
                    if((re_p & (rdiff_bus == 1))) begin  
                         empty_r   <= 1'b1;          
                    end
                    else if((!re_p & (rdiff_bus == 1))) begin
                         empty_r   <= 1'b0;          
                    end
                    else begin
                         empty_r   <= emptyi;          
                    end  

                    aempty_r  <= almostemptyi;
		   
	   	    if(RDCNT_EN == 1) begin
                       rdcnt_r   <= rdiff_bus;
	            end
	            else begin
                       rdcnt_r  <= rdcnt_r;
	            end

                    if(re_i == 1'b1 && READ_DVALID == 1'b1) begin
                       dvld_r  <= 1'b1;                       
                    end
                    else begin
                       dvld_r  <= 1'b0;                       
                    end

                    if(re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1) begin
                       underflow_r <= 1'b1;
                    end
                    else begin
                       underflow_r <= 1'b0;
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)            

            // Generation of full, almost full, write acknowledge flags and write count on write clock
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    full_r   <= 1'b0;
                    afull_r  <= 1'b0;
                    wack_r   <= 1'b0;
                    wrcnt_r  <= 'h0;                    
                    overflow_r <= 1'b0;
                 end
                 else begin
                    full_r   <= fulli_fstop;  
                    afull_r  <= almostfulli;

                    if(we_p == 1'b1 && WRITE_ACK == 1) begin
                       wack_r  <= 1'b1;                       
                    end
                    else begin
                       wack_r  <= 1'b0;                       
                    end
        
		    if(WRCNT_EN == 1) begin
                      wrcnt_r  <= wdiff_bus;
	            end
		    else begin
                      wrcnt_r  <= wrcnt_r;
		    end

                    if(we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1) begin
                       overflow_r <= 1'b1;
                    end
                    else begin
                       overflow_r <= 1'b0;
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)
            
            // Generation of write address to external memory
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    memwaddr_r <= 'h0;
                 end
                 else begin
                    if(we_p == 1'b1) begin         
                       if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                          memwaddr_r <= 'h0;
			  end else begin
                         memwaddr_r <= memwaddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)

            // Generation of read address to external memory
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    memraddr_r <= 'h0;
                 end
                 else begin
                    if(re_i == 1'b1) begin       
                       if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                          memraddr_r <= 'h0;
		       end else begin
                          memraddr_r <= memraddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)
  
            // Generation of write/read enable to external memory
	    assign memwe = we_p;  
            assign memre = re_i;   

         end
         else if(ESTOP == 0 && FSTOP == 1) begin  
            // --------------------------------------------------------------------------
            // Write pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_wclk or negedge reset_wclk) begin
               if (!reset_wclk) begin
                  wptr <= 'h0;
                  wptr_gray <= 'h0;
               end
               else if(we_i == 1'b1) begin   
                  wptr <= wptr + 1;
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
               else begin  
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
            end
   
            // --------------------------------------------------------------------------
            // Read pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_rclk or negedge reset_rclk) begin
               if (!reset_rclk) begin
                  rptr <= 'h0;
                  rptr_gray <= 'h0;
               end
               else if(re_p == 1'b1) begin   
                  rptr <= rptr + 1;
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
               else begin  
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
            end

            // Generation of empty, almost empty, read data valid flags and read count on read clock
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    empty_r   <= 1'b1;
                    aempty_r  <= 1'b1;
                    dvld_r    <= 1'b0;
                    rdcnt_r   <= 'h0;                    
                    underflow_r <= 1'b0;
                 end
                 else begin
                    empty_r   <= emptyi;  
                    aempty_r  <= almostemptyi;
		    if(RDCNT_EN == 1) begin
                      rdcnt_r   <= rdiff_bus;
	            end
		    else begin
                      rdcnt_r  <= rdcnt_r;
		    end

                    if(re_p == 1'b1 && READ_DVALID == 1'b1) begin
                       dvld_r  <= 1'b1;                       
                    end
                    else begin
                       dvld_r  <= 1'b0;                       
                    end

                    if(re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1) begin
                       underflow_r <= 1'b1;
                    end
                    else begin
                       underflow_r <= 1'b0;
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)            

            // Generation of full, almost full, write acknowledge flags and write count on write clock
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    full_r   <= 1'b0;
                    afull_r  <= 1'b0;
                    wack_r   <= 1'b0;
                    wrcnt_r  <= 'h0;                    
                    overflow_r <= 1'b0;
                 end
                 else begin
                    full_r   <= fulli;
                    afull_r  <= almostfulli;
 
		    if(WRCNT_EN == 1) begin  
                      wrcnt_r  <= wdiff_bus;
	            end
		    else begin
                      wrcnt_r  <= wrcnt_r;
		    end

                    if(we_i == 1'b1 && WRITE_ACK == 1) begin
                       wack_r  <= 1'b1;                       
                    end
                    else begin
                       wack_r  <= 1'b0;                       
                    end

                    if(we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1) begin
                       overflow_r <= 1'b1;
                    end
                    else begin
                       overflow_r <= 1'b0;
                    end 
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)
            
            // Generation of write address to external memory
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    memwaddr_r <= 'h0;
                 end 
                 else begin       
                    if(we_i == 1'b1) begin 
                       if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                          memwaddr_r <= 'h0;
			  end else begin
                          memwaddr_r <= memwaddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)

            // Generation of read address to external memory
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    memraddr_r <= 'h0;
                 end
                 else begin
                    if(re_p == 1'b1) begin  
                       if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                          memraddr_r <= 'h0;
			  end else begin
                          memraddr_r <= memraddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)

            // Generation of write/read enable to external memory
    	    assign memwe = we_i;    
            assign memre = re_p;     


         end
         else if(ESTOP == 0 && FSTOP == 0) begin  
            // --------------------------------------------------------------------------
            // Write pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_wclk or negedge reset_wclk) begin
               if (!reset_wclk) begin
                  wptr <= 'h0;
                  wptr_gray <= 'h0;
               end
               else if(we_p == 1'b1) begin
                  wptr <= wptr + 1;
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
               else begin 
		  wptr_gray <= (wptr>>1) ^ wptr;
               end
            end
   
            // --------------------------------------------------------------------------
            // Read pointer Binary counter
            // --------------------------------------------------------------------------
            always @(posedge pos_rclk or negedge reset_rclk) begin
               if (!reset_rclk) begin
                  rptr <= 'h0;
                  rptr_gray <= 'h0;
               end
               else if(re_p == 1'b1) begin
                  rptr <= rptr + 1;
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
               else begin 
		  rptr_gray <= (rptr>>1) ^ rptr;
               end
            end

            // Generation of empty, almost empty, read data valid flags and read count on read clock
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    empty_r   <= 1'b1;
                    aempty_r  <= 1'b1;
                    dvld_r    <= 1'b0;
                    rdcnt_r   <= 'h0;                    
                    underflow_r <= 1'b0;
                 end
                 else begin
                    empty_r   <= emptyi_estop;
                    aempty_r  <= almostemptyi;
		    if(RDCNT_EN == 1) begin
                      rdcnt_r   <= rdiff_bus;
	            end
		    else begin
                      rdcnt_r  <= rdcnt_r;
		    end

                    if(re_p == 1'b1 && READ_DVALID == 1'b1) begin
                       dvld_r  <= 1'b1;                       
                    end
                    else begin
                       dvld_r  <= 1'b0;                       
                    end

                    if(re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1) begin
                       underflow_r <= 1'b1;
                    end
                    else begin
                       underflow_r <= 1'b0;
                    end
                   end
              end // always @ (posedge pos_rclk or negedge aresetn)            

            // Generation of full, almost full, write acknowledge flags and write count on write clock
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    full_r   <= 1'b0;
                    afull_r  <= 1'b0;
                    wack_r   <= 1'b0;
                    wrcnt_r  <= 'h0;                    
                    overflow_r <= 1'b0;
                 end
                 else begin
                    full_r   <= fulli_fstop;       
                    afull_r  <= almostfulli;
		    if(WRCNT_EN == 1) begin
                      wrcnt_r  <= wdiff_bus;
	            end
		    else begin
                      wrcnt_r  <= wrcnt_r;
		    end

                    if(we_p == 1'b1 && WRITE_ACK == 1) begin
                       wack_r  <= 1'b1;                       
                    end
                    else begin
                       wack_r  <= 1'b0;                       
                    end

                    if(we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1) begin
                       overflow_r <= 1'b1;
                    end
                    else begin
                       overflow_r <= 1'b0;
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)
            
            // Generation of write address to external memory
            always @(posedge pos_wclk or negedge reset_wclk)
              begin
                 if(!reset_wclk) begin
                    memwaddr_r <= 'h0;
                 end
                 else begin
                    if(we_p == 1'b1) begin     
                       if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                          memwaddr_r <= 'h0;
			  end else begin
                          memwaddr_r <= memwaddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_wclk or negedge aresetn)

            // Generation of read address to external memory
            always @(posedge pos_rclk or negedge reset_rclk)
              begin
                 if(!reset_rclk) begin
                    memraddr_r <= 'h0;
                 end
                 else begin
                    if(re_p == 1'b1) begin   
                       if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                          memraddr_r <= 'h0;
			  end else begin
                          memraddr_r <= memraddr_r + 1;
		       end
                    end
                 end
              end // always @ (posedge pos_rclk or negedge aresetn)
  
            // Generation of write/read enable to external memory
    	    assign memwe = we_p;      
            assign memre = re_p; 


         end // if (ESTOP == 0 && FSTOP == 0)            
   endgenerate
      
endmodule // corefifo_async

   // --------------------------------------------------------------------------
   //                             End - of - Code
   // --------------------------------------------------------------------------
