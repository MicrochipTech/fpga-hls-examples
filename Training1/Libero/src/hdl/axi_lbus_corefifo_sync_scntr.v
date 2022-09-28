//--=================================================================================================
//-- File Name                           : axi_lbus_corefifo_sync_scntr.v

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

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_corefifo_sync_scntr (
    clk,
    reset,
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
    memre,
    empty_top_fwft   

);

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter WRITE_WIDTH      = 18;
   parameter WRITE_DEPTH      = 10;
   parameter FULL_WRITE_DEPTH = 1024;
   parameter READ_WIDTH       = 18;
   parameter READ_DEPTH       = WRITE_DEPTH;
   parameter FULL_READ_DEPTH  = 1024;
   parameter PREFETCH         = 1;
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
   parameter READ_DVALID      = 1;
   parameter WRITE_ACK        = 1;
   parameter OVERFLOW_EN      = 1; 
   parameter UNDERFLOW_EN     = 1; 
   parameter WRCNT_EN         = 1; 
   parameter RDCNT_EN         = 1; 
   parameter ECC              = 1;
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
    input                    re_top;                   // read enable to fifo
    input                    empty_top_fwft;    

   //---------
   // Outputs
   //---------
    output                   full;                 // full status flag
    output                   afull;                // almost full status flag
    output [WRITE_DEPTH:0]   wrcnt;                // number of elements remaining in write domain

    output                   empty;                // empty status flag
    output                   aempty;               // almost empty status flag
    output [READ_DEPTH:0]    rdcnt;                // number of elements remaining in read domain

    output                   underflow;            // underflow status flag
    output                   overflow;             // overflow status flag
    output                   dvld;                 // dvld status flag
    output                   wack;                 // wack status flag

    output [WDEPTH_CAL:0]    memwaddr;             // memory write address
    output                   memwe;                // memory write enable
    output [RDEPTH_CAL:0]    memraddr;             // memory read address
    output                   memre;                // memory read enable
    
   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
    wire                     full;
    wire                     afull;
    reg    [WRITE_DEPTH:0]   wrcnt;
    wire                     empty;
    wire                     aempty;
    wire                     aempty_fwft;
    reg    [READ_DEPTH:0]    rdcnt;
    wire   [WDEPTH_CAL:0]    memwaddr;
    wire                     memwe;
    wire   [RDEPTH_CAL:0]    memraddr;
    wire                     memre;

    reg                      full_r;
    reg                      full_reg;
    reg                      afull_r;
    reg                      empty_r;
    reg                      empty_r_fwft;
    reg                      empty_top_fwft_r;
    reg                      aempty_r;
    reg                      aempty_r_fwft;
    reg    [WDEPTH_CAL:0]    memwaddr_r;
    reg    [RDEPTH_CAL:0]    memraddr_r;
    reg                      dvld_r;
    reg                      dvld_r2;
    reg                      underflow_r;
    reg                      wack_r;
    reg                      overflow_r;
    reg    [READ_DEPTH:0]    sc_r;
    reg    [READ_DEPTH:0]    sc_r_fwft;
    reg                      almostemptyi;
    reg                      re_p_d1; 

    wire   [WRITE_DEPTH:0]   afthreshi;
    wire   [READ_DEPTH:0]    aethreshi;
    wire                     fulli;
    wire                     almostfulli;
    wire                     almostfulli_assert;   
    wire                     almostfulli_deassert; 
    wire                     fulli_assert; 
    wire                     fulli_deassert; 
    wire                     emptyi;
    wire                     emptyi_fwft;
    wire                     we_p;
    wire                     re_p;
    wire                     we_i;
    wire                     re_i;
    wire                     pos_clk;
    wire                     neg_reset;
    wire                     re_top_p;
    wire                     aresetn;



   assign pos_clk   =  WCLK_HIGH  ? clk    : ~clk; 
   assign aresetn =  RESET_LOW  ? ~reset : reset;


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

   assign       we_i = we_p & !full_r ;
   assign       re_i = re_p & !empty_r;


   assign full      = full_r;
   assign afull     = afull_r;
   assign empty     = empty_r;
   assign aempty    = aempty_r;
   assign aempty_fwft = aempty_r;
   assign underflow = underflow_r;
   assign wack      = wack_r;
   assign dvld      = (REGISTER_RADDR==2) ? dvld_r2 : 
	              ((REGISTER_RADDR == 1 && PREFETCH == 0) ? dvld_r : re_i);
   assign overflow  = overflow_r;
   assign memwaddr  = memwaddr_r;
   assign memraddr  = memraddr_r;
   assign memwe     = we_i;
   assign memre     = re_i;    

       
   always @(negedge aresetn or posedge pos_clk)  
     begin
        if (!aresetn ) begin
           wrcnt <= {WRITE_DEPTH{1'b0}};
        end
        else if (WRCNT_EN && PREFETCH == 0 && FWFT == 0) begin
           wrcnt <= sc_r; 
        end
        else if (WRCNT_EN && (PREFETCH == 1 || FWFT == 1)) begin
           wrcnt <= sc_r_fwft; 
        end
        else begin
           wrcnt <= {WRITE_DEPTH{1'b0}};
        end
     end
       
   always @(negedge aresetn or posedge pos_clk)
     begin
        if (!aresetn) begin
           rdcnt <= {READ_DEPTH{1'b0}};
        end
        else if (RDCNT_EN && PREFETCH == 0 && FWFT == 0) begin
           rdcnt <= sc_r; 
        end
        else if (RDCNT_EN && (PREFETCH == 1 || FWFT == 1)) begin
           rdcnt <= sc_r_fwft; 
        end
       else begin
          rdcnt <= {READ_DEPTH{1'b0}};
       end
     end

generate 
 if ( ECC == 1 && PIPE == 2 )  
   begin 
     reg empty_f;
    
     assign emptyi    =  (( sc_r == 1) & re_i ); 

     always @(negedge aresetn or posedge pos_clk)
       begin
         if (!aresetn) 
           empty_f <= 1'b1;        
         else if (re_i ^ we_i)  
           empty_f <= emptyi ;
       end

     always @(posedge pos_clk or negedge aresetn)
       if (!aresetn)
         empty_r <= 1'b1; 
       else
         empty_r <= emptyi ? 1'b1 : empty_f;
   end 
 else 
   begin
      assign       emptyi    =  ( sc_r == 1) & !we_i & re_i;

      always @(posedge pos_clk or negedge aresetn)
        if (!aresetn) 
          empty_r <= 1'b1; 
        else if(re_i ^ we_i)
          empty_r <= emptyi;
   end  
 endgenerate 


    always @(negedge aresetn or posedge pos_clk)
    begin
       if (!aresetn) begin
           sc_r <= 0;
       end
       else if ( we_i ^ re_i) begin
	   if(we_i == 1'b1) begin
             sc_r <= (sc_r + 1); 
           end
	   else if(re_i == 1'b1) begin
             sc_r <= (sc_r - 1); 
	   end
       end
    end

   always @(negedge aresetn or posedge pos_clk)
     begin
        if (!aresetn) begin
           sc_r_fwft <= 0;
        end
        else if ( we_i ^ ((re_top_p & empty_top_fwft & !empty_top_fwft_r) || (re_top_p & !empty_top_fwft) )) begin  
	     if(we_i == 1'b1) begin
               sc_r_fwft <= (sc_r_fwft + 1); 
             end
	     else if(((re_top_p & empty_top_fwft & !empty_top_fwft_r) || (re_top_p & !empty_top_fwft) )) begin  
               sc_r_fwft <= (sc_r_fwft - 1); 
	     end
        end
    end

   assign emptyi_fwft  =  ( sc_r_fwft  == 'h0);  
   
      
   generate
      if (FWFT == 0 && PREFETCH == 0)  begin

      assign afthreshi =  AF_FLAG_STATIC ? AFULL_VAL-1  : FULL_WRITE_DEPTH;     
      assign aethreshi =  AE_FLAG_STATIC ? AEMPTY_VAL   : 2;   

      always @(*)
      begin         
        almostemptyi =  (( sc_r <= aethreshi) & !we_i & re_i) | ( (sc_r+1 < aethreshi) & we_i & !re_i);          
      end

      assign almostfulli  =  ((sc_r >= (afthreshi)) & we_i & !re_i) | ( (sc_r-1 > afthreshi) & !we_i & re_i);
      assign fulli        =  ( sc_r == (FULL_WRITE_DEPTH-1)) & we_i & !re_i ;
      end
   endgenerate

   generate
      if ((FWFT == 1 || PREFETCH == 1) && PIPE == 1)  begin

      assign afthreshi =  AF_FLAG_STATIC ? AFULL_VAL    : FULL_WRITE_DEPTH;     
      assign aethreshi =  AE_FLAG_STATIC ? AEMPTY_VAL   : 2;   

   always @(posedge pos_clk or negedge aresetn)
     begin
        if (!aresetn) begin
           almostemptyi <= 1'b1;
        end 
        else begin
           if((sc_r_fwft >= aethreshi) && we_i & !re_top_p) begin
              almostemptyi <= 1'b0;
           end
           else if((sc_r_fwft-1 <= aethreshi) && sc_r_fwft > 0 && !we_i & re_top_p) begin   
              almostemptyi <= 1'b1;
           end
        end
     end

         assign almostfulli_assert    =  ((sc_r_fwft >= (afthreshi-1)) & we_i & !(re_top_p & !empty_r_fwft));  
         assign almostfulli_deassert  =  ( (sc_r_fwft <= afthreshi) & !we_i & (re_top_p & !empty_r_fwft));     
         assign almostfulli  =  almostfulli_assert ? 1'b1 : (almostfulli_deassert ? 1'b0 : afull_r); 

         assign fulli_assert   =  ( sc_r_fwft >= (FULL_WRITE_DEPTH-1)) & we_i & !(re_top_p & !empty_r_fwft);  
         assign fulli_deassert =  ( sc_r_fwft < (FULL_WRITE_DEPTH-1 )) & !we_i & (re_top_p & !empty_r_fwft);  
         assign fulli          =  fulli_deassert ? 1'b0 : (fulli_assert ? 1'b1 : full_r);  
      end
   endgenerate

   always @(posedge pos_clk or negedge aresetn)
     begin
        if (!aresetn) begin
           dvld_r2  <= 1'b0;
           full_reg <= 1'b0;
           re_p_d1  <= 'h0;
           empty_top_fwft_r <= 1'b1;
        end
        else begin
           dvld_r2  <= dvld_r;
           full_reg <= full_r;
           re_p_d1  <= re_p;
           empty_top_fwft_r <= empty_top_fwft;  
        end
     end
  
    always @(posedge pos_clk or negedge aresetn)
    begin
        if (!aresetn) begin
            empty_r_fwft<= 1'b1;
            aempty_r_fwft    <= 1'b1;
            dvld_r      <= 1'b0;
            underflow_r <= 1'b0;
        end
        else begin

            if (we_i ^  ((re_top_p &  empty_top_fwft & !empty_top_fwft_r)|| (re_top_p & !empty_top_fwft)))  
                empty_r_fwft <= emptyi_fwft;

            if ((we_i ^ (re_top_p &  !empty_r_fwft)))
              aempty_r_fwft <= almostemptyi;


            if (re_i == 1'b1 && READ_DVALID == 1 && (FWFT == 0 && PREFETCH == 0))
               dvld_r <= 1'b1;
            else if ((re_top_p &  !empty_r_fwft) && READ_DVALID == 1 && (FWFT == 1 || PREFETCH == 1))  
               dvld_r <= 1'b1;
            else
               dvld_r <= 1'b0;

            if ( re_p == 1'b1 && empty_r == 1'b1 && UNDERFLOW_EN == 1 && (FWFT == 0 && PREFETCH == 0))
               underflow_r <= 1'b1;
            else if ( re_top_p == 1'b1 && empty_top_fwft == 1'b1 && UNDERFLOW_EN == 1  && (FWFT == 1 || PREFETCH == 1))  
              underflow_r <= 1'b1;
            else
              underflow_r <= 1'b0;

        end
    end

   generate
      if (FWFT == 0 && PREFETCH == 0)  begin

         always @(posedge pos_clk or negedge aresetn)
         begin
          if (!aresetn) begin
            aempty_r    <= 1'b1;
          end
          else begin
            if ((we_i ^ re_i)) begin  
                aempty_r <= almostemptyi;
            end
          end
         end

       always @(posedge pos_clk or negedge aresetn)
       begin
        if (!aresetn) begin
            full_r     <= 1'b0;
            afull_r    <= 1'b0;
            wack_r     <= 1'b0;
            overflow_r <= 1'b0;
        end
        else begin
            if (we_i ^ re_i) begin
               full_r  <= fulli;
            end

            if ((we_i ^ re_i))
               afull_r <= almostfulli;

            if (we_i == 1'b1 && WRITE_ACK == 1)
               wack_r <= 1'b1;
            else
               wack_r <= 1'b0;

            if ( we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1)
               overflow_r <= 1'b1; 
            else
               overflow_r <= 1'b0;

        end
       end

      end
   endgenerate

   generate
      if ((FWFT == 1 || PREFETCH == 1) && PIPE == 1)  begin
         always @(*)
         begin
           aempty_r = almostemptyi;
         end

         always @(posedge pos_clk or negedge aresetn)
         begin
           if (!aresetn) begin
            full_r     <= 1'b0;
            afull_r    <= 1'b0;
            wack_r     <= 1'b0;
            overflow_r <= 1'b0;
           end
           else begin
            if ((we_i ^ (re_top_p &  !empty_r_fwft)) ) begin
               if (we_i == 1'b1 && !(re_top_p &  !empty_r_fwft)) begin 
                 full_r  <= fulli;
               end 
               else if (we_i == 1'b0 && (re_top_p &  !empty_r_fwft)) begin 
                 full_r  <= 1'b0;
               end 
            end

            if ((we_i ^ (re_top_p &  !empty_r_fwft)))
               afull_r <= almostfulli;

            if (we_i == 1'b1 && WRITE_ACK == 1)
               wack_r <= 1'b1;
            else
               wack_r <= 1'b0;

            if ( we_p == 1'b1 && full_r == 1'b1 && OVERFLOW_EN == 1)
               overflow_r <= 1'b1;
            else
               overflow_r <= 1'b0;


        end
    end

     end
   endgenerate
        
   always @(posedge pos_clk or negedge aresetn )
     begin
        if ( !aresetn ) begin
           memwaddr_r <= 'h0;
        end
        else begin
           if ( we_i == 1'b1) begin
              if(memwaddr_r == (FULL_WRITE_DEPTH-1)) begin
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
           memraddr_r <= 'h0;
        end
        else begin
	   if ( re_i == 1'b1) begin
              if(memraddr_r == (FULL_READ_DEPTH-1)) begin
                memraddr_r <= 'h0;
	      end else begin
                memraddr_r <= memraddr_r + 1;
              end
           end
        end
     end

endmodule
