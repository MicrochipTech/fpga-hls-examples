//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_sync.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//--=================================================================================================

`timescale 1ns/100ps

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_sync (
                      clk,
                      reset,
                      we,
                      re,
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
   parameter READ_DVALID      = 32;
   parameter WRITE_ACK        = 32;
   parameter OVERFLOW_EN      = 1; 
   parameter UNDERFLOW_EN     = 1; 
   parameter WRCNT_EN         = 1; 
   parameter RDCNT_EN         = 1; 
   //parameter SYNC_RESET       = 0;
   localparam WDEPTH_CAL      = (WRITE_DEPTH == 0) ? WRITE_DEPTH : (WRITE_DEPTH-1); 
   localparam RDEPTH_CAL      = (READ_DEPTH == 0)  ? READ_DEPTH  : (READ_DEPTH-1); 

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------
   
   //--------
   // Inputs
   //--------
    input                    clk;                  // fifo clock
    input                    reset;                // reset
    input                    we;                   // write enable to fifo
    input                    re;                   // read enable to fifo

   //---------
   // Outputs
   //---------
   output                    full;                 // full status flag
   output                    afull;                // almost full status flag
   output [WRITE_DEPTH:0]    wrcnt;                // number of elements remaining in write domain

   output                    empty;                // empty status flag
   output                    aempty;               // almost empty status flag
   output [READ_DEPTH:0]     rdcnt;                // number of elements remaining in read domain

   output                    underflow;            // underflow status flag
   output                    overflow;             // overflow status flag
   output                    dvld;                 // dvld status flag
   output                    wack;                 // wack status flag

   output [WDEPTH_CAL:0]     memwaddr;             // memory write address
   output                    memwe;                // memory write enable
   output [RDEPTH_CAL:0]     memraddr;             // memory read address
   output                    memre;                // memory read enable

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   wire                     full;
   wire                     afull;
   wire   [WRITE_DEPTH:0]   wrcnt;
   wire                     empty;
   wire                     aempty;
   wire   [READ_DEPTH:0]    rdcnt;
   wire   [WDEPTH_CAL:0]    memwaddr;
   wire                     memwe;
   wire   [RDEPTH_CAL:0]    memraddr;
   wire                     memre;

   reg                      full_r;
   reg                      full_reg;
   reg                      afull_r;
   reg    [WRITE_DEPTH:0]   wrcnt_r;
   reg                      empty_r;
   reg                      aempty_r;
   reg    [READ_DEPTH:0]    rdcnt_r;
   reg    [WDEPTH_CAL:0]    memwaddr_r;
   reg    [RDEPTH_CAL:0]    memraddr_r;
   reg                      dvld_r;
   reg                      dvld_r2;
   reg                      underflow_r;
   reg                      wack_r;
   reg                      overflow_r;
   reg    [READ_DEPTH:0]    rptr;
   reg    [READ_DEPTH:0]    rptr_nxt;
   reg    [WRITE_DEPTH:0]   wptr;
   reg    [WRITE_DEPTH:0]   wptr_nxt;
   reg    [VAR_ASPECT_WRDEPTH:0]   wptrsync_shift; 
   reg    [VAR_ASPECT_RDDEPTH:0]   rptrsync_shift; 
   reg                      re_p_d1;

   wire   [WRITE_DEPTH:0]   afthreshi, wdiff_bus;
   wire   [READ_DEPTH:0]    aethreshi, rdiff_bus;
   wire                     fulli;
   wire                     almostfulli;
   wire                     almostfulli_assert;
   wire                     emptyi;
   wire                     almostemptyi;
   wire                     almostemptyi_assert;
   wire                     we_p;
   wire                     re_p;
   wire                     we_i;
   wire                     re_i;
   wire                     pos_clk;
   wire                     neg_reset;
   wire                     fulli_fstop;   
   wire                     emptyi_estop; 
   wire                     aresetn;
   //wire                     sresetn;

   // --------------------------------------------------------------------------
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // ||                                                                      ||
   // ||                     Start - of - Code                                ||
   // ||                                                                      ||
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // --------------------------------------------------------------------------

   // --------------------------------------------------------------------------
   // Top-level outputs
   // --------------------------------------------------------------------------
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
   // threshold values
   // --------------------------------------------------------------------------
    assign afthreshi =  AF_FLAG_STATIC ? AFULL_VAL-1  : FULL_WRITE_DEPTH;  
    //***HARI***assign aethreshi =  AE_FLAG_STATIC ? AEMPTY_VAL+1 : 0;  
    assign aethreshi =  AE_FLAG_STATIC ? AEMPTY_VAL : 2;  

   // --------------------------------------------------------------------------
   // clocks and enables
   // --------------------------------------------------------------------------
    assign pos_clk   = WCLK_HIGH ? clk    : ~clk;

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   // assign neg_reset = RESET_LOW ? ~reset : reset;----------------------commented by anurag
	  assign aresetn = RESET_LOW ? ~reset : reset;//----------------------updated by anurag
   // assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : neg_reset;-----------commented by anurag
   // assign sresetn   = (SYNC_RESET == 1) ? neg_reset : 1'b1;------------commented by anurag

   // --------------------------------------------------------------------------
   // Status flags
   // --------------------------------------------------------------------------
    assign we_p  = WRITE_LOW ? (~we) : (we);
    assign re_p  = READ_LOW  ? (~re) : (re);
    assign we_i  = we_p & !full_r;
    assign re_i  = re_p & !empty_r;
    assign wdiff_bus = wptr_nxt - rptrsync_shift;
    assign rdiff_bus = wptrsync_shift - rptr_nxt;
    assign dvld      = (REGISTER_RADDR==2) ? dvld_r2 : 
	               ((REGISTER_RADDR == 1 && PREFETCH == 0) ? dvld_r : re_i);

    always @(posedge pos_clk or negedge aresetn)
    begin
        if (!aresetn ) begin
            full_reg <= 0;
        end
        else begin
            full_reg <= full_r;
        end
    end

   // --------------------------------------------------------------------------
   // Read pointer binary counter
   // --------------------------------------------------------------------------
    always @(posedge pos_clk or negedge aresetn)
    begin
        if (!aresetn ) begin
            rptr <= 0;
        end
        else begin
            rptr <=  rptr_nxt;
        end
    end

   // --------------------------------------------------------------------------
   // Write pointer binary counter
   // --------------------------------------------------------------------------
    always @(posedge pos_clk or negedge aresetn)
    begin
        if (!aresetn ) begin
            wptr <= 0;
        end
        else begin
            wptr <= wptr_nxt;
        end
    end

    always @(posedge pos_clk or negedge aresetn)
    begin
      if(!aresetn ) begin
        re_p_d1 <= 'h0;
      end
      else begin
        re_p_d1 <= re_p;
      end
    end 

   // --------------------------------------------------------------------------
   // For variable aspect ratios
   // The variable aspect logic is handled by shifting the required bits of the
   // read/write pointer so that they are of the same width.  
   // --------------------------------------------------------------------------    
    always @(rptr_nxt or wptr_nxt)
    begin
       if (WRITE_DEPTH > READ_DEPTH) begin
            rptrsync_shift = rptr_nxt<<(WRITE_DEPTH - READ_DEPTH);
            wptrsync_shift = wptr_nxt>>(WRITE_DEPTH - READ_DEPTH);
       end
       else if (READ_DEPTH > WRITE_DEPTH) begin
            rptrsync_shift = rptr_nxt>>(READ_DEPTH - WRITE_DEPTH);
            wptrsync_shift = wptr_nxt<<(READ_DEPTH - WRITE_DEPTH);
       end
       else begin
            rptrsync_shift = rptr_nxt;
            wptrsync_shift = wptr_nxt;
       end
    end

   // --------------------------------------------------------------------------
   // Flag generation logic
   // --------------------------------------------------------------------------
   //***HARI***assign almostfulli  =  wdiff_bus >= afthreshi;
   assign almostfulli_assert    =  we_p & (wdiff_bus >= afthreshi);
   assign almostfulli_deassert  =  (wdiff_bus <= afthreshi);
   assign almostfulli           =  almostfulli_assert    ? 1'b1 : (almostfulli_deassert? 1'b0 : afull );
   
   //***HARI***assign almostemptyi =  aethreshi >= rdiff_bus;
   assign almostemptyi_assert   =  re_p & (aethreshi >= rdiff_bus);
   assign almostemptyi_deassert =  (aethreshi <= rdiff_bus) & aempty;  
   assign almostemptyi          =  almostemptyi_deassert ? 1'b0 : (almostemptyi_assert ? 1'b1 : aempty);

   assign fulli  = we_p ? (wdiff_bus >= (FULL_WRITE_DEPTH-1)) : (wdiff_bus >= (FULL_WRITE_DEPTH));      
   assign fulli_fstop  = (we_p & !full_r) ? (wdiff_bus[WRITE_DEPTH - 1:0]  == (FULL_WRITE_DEPTH-1)) :(((we_p ^ re_p) & full_r)? 1'b0 : full_r);      

   assign emptyi = (rdiff_bus <= 1);   
   assign emptyi_estop = re_p ? (rdiff_bus == 1) : (rdiff_bus <= 0); 

    always @(posedge pos_clk or negedge aresetn)
    begin
       if (!aresetn ) begin
           dvld_r2 <= 0;
       end
       else begin
           dvld_r2 <= dvld_r;
       end
    end

    // --------------------------------------------------------------------------    
    // Update the pointer values based in ESTOP and FSTOP parameters.
    // Generate the status flags - Empty/Full/Almost Empty/ Almost Full
    // Generate the data handshaking flags - DVLD/WACK
    // Generate error count flags - Underflow/Overflow
    // Generate write and read address signals to the external memory
    // --------------------------------------------------------------------------    
    genvar k;
    generate

           if (ESTOP == 1 && FSTOP == 1) begin
                /* ESTOP and FSTOP both are true */
                /* write pointer */
		
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn ) begin
                     wptr_nxt <= 0;
                  end
                  else if(we_i == 1'b1) begin
                     wptr_nxt <=  wptr_nxt + 1;
                  end
              end

                /* read pointer */
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn) begin
                     rptr_nxt <= 0;
                  end
                  else if(re_i == 1'b1) begin
                     rptr_nxt <=  rptr_nxt + 1;
                  end
              end
	
                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        empty_r     <= 1;
                        aempty_r    <= 1;
                        dvld_r      <= 0;
                        underflow_r <= 0;
                        rdcnt_r     <= 0;
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

                        aempty_r <= almostemptyi;
			if(RDCNT_EN == 1) begin
                          rdcnt_r  <= rdiff_bus;
		        end

                        if (re_i == 1'b1 && READ_DVALID == 1)
                           dvld_r <= 1'b1;
                        else
                           dvld_r <= 1'b0;

                        if (re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1)
                           underflow_r <= 1'b1;
                        else
                           underflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn ) begin
                        full_r     <= 0;
                        afull_r    <= 0;
                        wack_r     <= 0;
                        overflow_r <= 0;
                        wrcnt_r    <= 0;
                    end
                    else begin
                        full_r   <= FSTOP ? fulli : fulli_fstop; 
                        afull_r    <= almostfulli;

			if (full_r == 1'b0 && WRCNT_EN == 1) begin
                           wrcnt_r <= wdiff_bus;
			end

                        if (we_i == 1'b1 && WRITE_ACK == 1)
                           wack_r <= 1'b1;
                        else
                           wack_r <= 1'b0;

                        if (we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1)
                           overflow_r <= 1'b1;
                        else
                           overflow_r <= 1'b0;
                        end
                end

                always @(posedge pos_clk or negedge aresetn )
                begin
                    if ( !aresetn ) begin
                        memwaddr_r     <= 0;
                    end
                    else begin
        	        if (we_i == 1'b1) begin
                           if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                              memwaddr_r <= 'h0;
       	        	   end else begin
                              memwaddr_r <= memwaddr_r + 1;
                           end
                        end
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if ( !aresetn ) begin
                        memraddr_r     <= 0;
                    end
                    else begin
      		         if (re_i == 1'b1) begin
                           if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                             memraddr_r <= 'h0;
       	        	   end else begin
                             memraddr_r <= memraddr_r + 1;
			   end
			 end
                    end
                end

    	      assign memwe = we_i;
              assign memre = re_i;   


            end
            else if (ESTOP == 1 && FSTOP == 0) begin
                /* ESTOP is true and FSTOP is false */

                /* write pointer */
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn) begin
                     wptr_nxt <= 0;
                  end
                  else if(we_p == 1'b1) begin
                     wptr_nxt <=  wptr_nxt + 1;
                  end
              end

                /* read pointer */
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn ) begin
                     rptr_nxt <= 0;
                  end
                  else if(re_i == 1'b1) begin
                     rptr_nxt <=  rptr_nxt + 1;
                  end
              end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        empty_r     <= 1;
                        aempty_r    <= 1;
                        dvld_r      <= 0;
                        underflow_r <= 0;
                        rdcnt_r     <= 0;
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

                        aempty_r <= almostemptyi;
			if(RDCNT_EN == 1) begin
                          rdcnt_r  <= rdiff_bus;
		        end

                        if (re_i == 1'b1 && READ_DVALID == 1'b1)
                           dvld_r <= 1'b1;
                        else
                           dvld_r <= 1'b0;

                        if (re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1)
                           underflow_r <= 1'b1;
                        else
                           underflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        full_r <= 0;
                        afull_r <= 0;
                        wack_r <= 0;
                        overflow_r <= 0;
                        wrcnt_r <= 0;
                    end
                    else begin
                        full_r   <= fulli_fstop;  
                        afull_r <= almostfulli;
			if(WRCNT_EN == 1) begin
                          wrcnt_r <= wdiff_bus;
		        end

                        if (we_p == 1'b1 && WRITE_ACK == 1'b1)
                           wack_r <= 1'b1;
                        else
                           wack_r <= 1'b0;

                        if (we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1)
                           overflow_r <= 1'b1;
                        else
                           overflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn )
                begin
                    if (!aresetn) begin
                        memwaddr_r   <= 0;
                    end
                    else begin
			if (we_p == 1'b1) begin
                           if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                              memwaddr_r <= 'h0;
			      end else begin
                              memwaddr_r <= memwaddr_r + 1;
                           end
                        end
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                       memraddr_r    <= 0;
                    end
                    else begin
			if (re_i == 1'b1) begin
                           if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                             memraddr_r <= 'h0;
       	        	   end else begin
                             memraddr_r <= memraddr_r + 1;
                           end
                        end
                    end
                end

    	      assign memwe = we_p;
              assign memre = re_i;    
		
            end
            else if (ESTOP == 0 && FSTOP == 1) begin
                /* FSTOP is true and ESTOP is false */

                /* write pointer */

   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn) begin
                     wptr_nxt <= 0;
                  end
                  else if(we_i == 1'b1) begin
                     wptr_nxt <=  wptr_nxt + 1;
                  end
              end
	    
                /* read pointer */
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn) begin
                     rptr_nxt <= 0;
                  end
                  else if(re_p == 1'b1) begin
                     rptr_nxt <=  rptr_nxt + 1;
                  end
              end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        empty_r <= 1;
                        aempty_r <= 1;
                        dvld_r <= 0;
                        underflow_r <= 0;
                        rdcnt_r <= 0;
                    end
                    else begin
                        empty_r <= emptyi;
                        aempty_r <= almostemptyi;
			if(RDCNT_EN == 1) begin
                          rdcnt_r  <= rdiff_bus;
		        end

                        if (re_p == 1'b1 && READ_DVALID == 1'b1)
                           dvld_r <= 1'b1;
                        else
                           dvld_r <= 1'b0;

                        if ( re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1)
                           underflow_r <= 1'b1;
                        else
                           underflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        full_r <= 0;
                        afull_r <= 0;
                        wack_r <= 0;
                        overflow_r <= 0;
                        wrcnt_r <= 0;
                    end
                    else begin
                        full_r <= fulli;
                        afull_r <= almostfulli;

			if (full_r == 1'b0 && WRCNT_EN == 1) begin
                           wrcnt_r <= wdiff_bus;
			end

                        if (we_i ==1'b1 && WRITE_ACK == 1'b1)
                           wack_r <= 1'b1;
                        else
                           wack_r <= 1'b0;

                        if (we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1)
                           overflow_r <= 1'b1;
                        else
                           overflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn )
                begin
                    if ( !aresetn ) begin
                        memwaddr_r <= 0;
                    end
                    else begin
			if ( we_i == 1'b1) begin
                           if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                              memwaddr_r <= 'h0;
       	        	   end else begin
                              memwaddr_r <= memwaddr_r + 1;
                           end
                        end
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if ( !aresetn ) begin
                        memraddr_r <= 0;
                    end
                    else begin
		        if ( re_p == 1'b1) begin
                           if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                              memraddr_r <= 'h0;
       	        	   end else begin
                              memraddr_r <= memraddr_r + 1;
                           end
                        end
                    end
                end

    	      assign memwe = we_i;
	      assign memre = re_p;    
	
            end
            else if (ESTOP == 0 && FSTOP == 0) begin
                /* ESTOP and FSTOP are false */

                /* write pointer */
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn) begin
                     wptr_nxt <= 0;
                  end
                  else if(we_p == 1'b1) begin
                     wptr_nxt <=  wptr_nxt + 1;
                  end
              end
   
               /* read pointer */
   	      always @(posedge pos_clk or negedge aresetn)
              begin
                  if (!aresetn) begin
                     rptr_nxt <= 0;
                  end
                  else if(re_p == 1'b1) begin
                     rptr_nxt <=  rptr_nxt + 1;
                  end
              end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        empty_r <= 1;
                        aempty_r <= 1;
                        dvld_r <= 0;
                        underflow_r <= 0;
                        rdcnt_r <= 0;
                    end
                    else begin
                        empty_r <= emptyi_estop; 
                        aempty_r <= almostemptyi;
			if(RDCNT_EN == 1) begin
                          rdcnt_r  <= rdiff_bus;
		        end

                        if (re_p == 1'b1 && READ_DVALID == 1'b1)
                           dvld_r <= 1'b1;
                        else
                           dvld_r <= 1'b0;

                        if ( re_p ==1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1)
                           underflow_r <= 1'b1;
                        else
                           underflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if (!aresetn) begin
                        full_r <= 0;
                        afull_r <= 0;
                        wack_r <= 0;
                        overflow_r <= 0;
                        wrcnt_r <= 0;
                    end
                    else begin
                        full_r <= fulli_fstop; 
                        afull_r <= almostfulli;
			if(WRCNT_EN == 1) begin
                          wrcnt_r <= wdiff_bus;
		        end

                        if (we_p == 1'b1 && WRITE_ACK == 1'b1)
                           wack_r <= 1'b1;
                        else
                           wack_r <= 1'b0;

                        if ( we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1)
                           overflow_r <= 1'b1;
                        else
                           overflow_r <= 1'b0;
                    end
                end

                always @(posedge pos_clk or negedge aresetn )
                begin
                    if ( !aresetn ) begin
                        memwaddr_r <= 0;
                    end
                    else begin
			if ( we_p == 1'b1) begin
                           if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin    //SAR#68070
                              memwaddr_r <= 'h0;
       	        	   end else begin
                              memwaddr_r <= memwaddr_r + 1;
                           end
                        end
                    end
                end

                always @(posedge pos_clk or negedge aresetn)
                begin
                    if ( !aresetn ) begin
                        memraddr_r <= 0;
                    end
                    else begin
			if ( re_p == 1'b1) begin
                           if(memraddr_r == (FULL_READ_DEPTH-1)) begin    //SAR#68070
                              memraddr_r <= 'h0;
       	        	   end else begin
                              memraddr_r <= memraddr_r + 1;
                           end
                        end
                    end
                end

    	      assign memwe = we_p;
	      assign memre = re_p;     
		
            end
    endgenerate

endmodule // corefifo_sync

   // --------------------------------------------------------------------------
   //                             End - of - Code
   // --------------------------------------------------------------------------
