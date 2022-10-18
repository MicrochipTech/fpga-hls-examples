//--=================================================================================================
//-- File Name                           : ddr_rw_arbiter.v
//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//--v0.0.1 modified wlast logic to fix the issue with single write - 15 july 2019, 23 july 2019
//--=================================================================================================



`timescale 1ps / 1ps

//********** v_axi_bus ****************


module ddr_rw_arbiter #(

parameter   AXI_ID_WIDTH                = 4,
parameter   AXI_ADDR_WIDTH              = 32,
parameter   AXI_DATA_WIDTH              = 128,   // 64 or 128
parameter   AXI_LEN_WIDTH               = 8,     // width of awlen and arlen ports, AXI3=4, AXI4=8
parameter   VIDEO_BUS_ASIZE             = 36,    // Video bus address width.
parameter   VIDEO_BUS_DSIZE             = 128    // Video bus data width.



) (
// AXI globals
input                                 ddr_clk_i,          // AXI clock 
input                                 resetn_i,           // AXI Reset
input                                 ddr_ctrl_ready_i,  //Control ready of DDR
// AXI Write address channel signals
output reg  [(AXI_ID_WIDTH-1):0]       awid,          // Write address ID
output   [(AXI_ADDR_WIDTH-1):0]        awaddr,        // Write address
output   [(AXI_LEN_WIDTH-1):0]         awlen,         // Write burst length
output reg  [2:0]                      awsize,        // Write burst size
output reg  [1:0]                      awburst,       // Write burst type
output reg  [1:0]                      awlock,        // Write lock type (not used)
output reg  [3:0]                      awcache,       // Write cache type (not used)
output reg  [2:0]                      awprot,        // Write protection type (not used)
output reg                             awvalid,       // Write address valid
input                                  awready,       // Write address ready
// AXI Write data channel signals 
output      [(AXI_DATA_WIDTH-1):0]     wdata,         // Write data
output      [((AXI_DATA_WIDTH/8)-1):0] wstrb,         // Write strobes
output                                 wlast,         // Write last
output                                 wvalid,        // Write valid
input                                  wready,        // Write ready
// AXI Write response channel signals
input  [(AXI_ID_WIDTH-1):0] bid,                      // Write response ID
input  [1:0]                      bresp,              // Write response
input                             bvalid,             // Write response valid
output reg                             bready,        // Write response ready
// AXI Read address channel signals
output reg        [(AXI_ID_WIDTH-1):0] arid,          // Read address ID
output   [(AXI_ADDR_WIDTH-1):0]     araddr,           // Read address 
output   [(AXI_LEN_WIDTH-1):0]      arlen,            // Read burst length
output reg  [2:0]                      arsize,        // Read burst size
output reg  [1:0]                      arburst,       // Read burst type
output reg  [1:0]                      arlock,        // Read lock type (not used)
output reg  [3:0]                      arcache,       // Read cache type (not used)
output reg  [2:0]                      arprot,        // Read protection type (not used)
output reg                             arvalid,       // Read address valid
input                             arready,            // Read address ready
// AXI Read data channel signals 
input  [(AXI_ID_WIDTH-1):0]    rid,                   // Read ID tag
input  [AXI_DATA_WIDTH-1:0]       rdata,              // Read data
input  [1:0]                      rresp,              // Read response
input                          rlast,                 // Read last
input                             rvalid,             // Read valid
output reg                        rready,             // Read ready

//Video interface
input                               wreq_i,
output reg wack_o,
input [(AXI_ADDR_WIDTH-1):0] wstart_addr_i,
input [(AXI_LEN_WIDTH-1):0] beats_to_w_i,
input [VIDEO_BUS_DSIZE-1:0] wdata_i,
input wdata_valid_i,
output wdone_o,
input rreq_i,
output reg rack_o,
input [(AXI_ADDR_WIDTH-1):0] rstart_addr_i,
input [(AXI_LEN_WIDTH-1):0] beats_to_r_i,
output [VIDEO_BUS_DSIZE-1:0] rdata_o,
output rdata_valid_o,
output rdone_o
);

localparam [AXI_ADDR_WIDTH-1:0] ALL_ADDRESS_ZEROS =   {AXI_ADDR_WIDTH{1'b0}};
localparam [AXI_DATA_WIDTH-1:0] ALL_DATA_ZEROS =   {AXI_DATA_WIDTH{1'b0}};
localparam [AXI_DATA_WIDTH-1:0] ALL_DATA_ONES =   {AXI_DATA_WIDTH{1'b1}};
localparam [2:0] ALL_SIZE_VAL =  (AXI_DATA_WIDTH==32)? 3'b010: 
                                 ((AXI_DATA_WIDTH==64)? 3'b011: 
								 ((AXI_DATA_WIDTH==128)? 3'b100:
								 ((AXI_DATA_WIDTH==256)? 3'b101:
								 ((AXI_DATA_WIDTH==512)? 3'b110:
								 ((AXI_DATA_WIDTH==1024)? 3'b111:3'b010)))));
localparam STRB_WIDTH = AXI_DATA_WIDTH/8;
localparam RDEPTH    = (AXI_DATA_WIDTH==32 || AXI_DATA_WIDTH==36 )?1024:((AXI_DATA_WIDTH==64 || AXI_DATA_WIDTH==72 )?512:((AXI_DATA_WIDTH==128 || AXI_DATA_WIDTH== 144 )?256 : (AXI_DATA_WIDTH==256 || AXI_DATA_WIDTH== 288)? 128: 64));
localparam RDEPTH2    = (AXI_DATA_WIDTH==32 || AXI_DATA_WIDTH==36 )?1024:((AXI_DATA_WIDTH==64 || AXI_DATA_WIDTH==72 )?1024:((AXI_DATA_WIDTH==128 || AXI_DATA_WIDTH== 144 )?512 : (AXI_DATA_WIDTH==256 || AXI_DATA_WIDTH== 288)? 256: 64));
localparam RDEPTH3    = (AXI_DATA_WIDTH==32 || AXI_DATA_WIDTH==36 )?1000:((AXI_DATA_WIDTH==64 || AXI_DATA_WIDTH==72 )?510:((AXI_DATA_WIDTH==128 || AXI_DATA_WIDTH== 144 )?250 : (AXI_DATA_WIDTH==256 || AXI_DATA_WIDTH== 288)? 120: 60));

localparam IDLE = 0,ADDRESS_CHK=1,WR_ADDRESS=2,WR_DATA=3,WR_DATA_LAST=4,READ_ADDRESS=5,WAIT_ST=6;
localparam WREADY_CHK=1,WLAST_CHK=2,WLAST_CHK0SIZE=3;

reg [1:0] local_wbus_state;
reg [2:0] video_bus_state;
reg DVLD_reg;
wire wr_fifo_wen,AFULL_wr_fifo,FULL_wr_fifo,wr_fifo_ren;
wire [AXI_DATA_WIDTH-1:0] wr_fifo_wdata;
wire DVLD,EMPTY_wr_fifo;
reg wval_k;
wire [AXI_LEN_WIDTH-1:0] v_wr_len_fifo_rdata;	
reg  [AXI_LEN_WIDTH-1:0] v_wr_len_fifo_wrdata;
reg v_wr_len_fifo_wren;
reg                        VAL_ST,wr_len_fifo_ren;
reg   [AXI_LEN_WIDTH-1:0]  wd_trans_Cnt;
wire  [AXI_DATA_WIDTH-1:0] DATA_Out_Write_Fifo;
wire                       EMPTY_awlen_fifo;
reg                        rdone_int;

reg wlast_reg;//SD

assign rdata_valid_o = (video_bus_state==IDLE)?1'b0:rvalid;
assign rdata_o = rdata;	
assign wr_fifo_wen = wdata_valid_i;
assign wr_fifo_wdata = wdata_i;
assign wr_fifo_ren = wvalid & wready;
assign wdata = DATA_Out_Write_Fifo;
assign wvalid = DVLD;
assign rdone_o = rdone_int;
assign wdone_o = bvalid & bready;
assign wstrb = ALL_DATA_ONES[STRB_WIDTH-1:0];


  ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_video_axi_fifo #( 
        .AE_STATIC_EN   ( 1 ),
        .AEVAL          ( 2 ),
        .AF_STATIC_EN   ( 1 ),
        .AFVAL          ( RDEPTH3 ),
        .CTRL_TYPE      ( 2 ),
        .ECC            ( 0 ),
        .ESTOP          ( 1 ),
        .FAMILY         ( 26 ),
        .FSTOP          ( 1 ),
        .FWFT           ( 1 ),
        .OVERFLOW_EN    ( 0 ),
        .PIPE           ( 1 ),
        .PREFETCH       ( 0 ),
        .RCLK_EDGE      ( 1 ),
        .RDCNT_EN       ( 1 ),
        .RDEPTH         ( RDEPTH ),
        .RE_POLARITY    ( 0 ),
        .READ_DVALID    ( 1 ),
        .RESET_POLARITY ( 0 ),
        .RWIDTH         ( AXI_DATA_WIDTH ),
        .SYNC           ( 1 ),
        .UNDERFLOW_EN   ( 0 ),
        .WCLK_EDGE      ( 1 ),
        .WDEPTH         ( RDEPTH ),
        .WE_POLARITY    ( 0 ),
        .WRCNT_EN       ( 0 ),
        .WRITE_ACK      ( 0 ),
        .WWIDTH         ( AXI_DATA_WIDTH ) )
v_wr_data_fifo(
        // Inputs
        .CLK        ( ddr_clk_i ),
        .WCLOCK     ( ddr_clk_i ), 
        .RCLOCK     ( ddr_clk_i ), 
        .RESET      ( resetn_i ),
        .WE         ( wr_fifo_wen ),
        .RE         ( wr_fifo_ren ),
        .DATA       ( wr_fifo_wdata ),
        .MEMRD      ( ALL_DATA_ZEROS[AXI_DATA_WIDTH-1:0] ),
        // Outputs
        .FULL       ( FULL_wr_fifo ), 
        .EMPTY      ( EMPTY_wr_fifo ),
        .AFULL      (AFULL_wr_fifo ),
        .AEMPTY     ( ),
        .OVERFLOW   (  ),
        .UNDERFLOW  (  ),
        .WACK       (  ),
        .DVLD       (DVLD ),
        .MEMWE      (  ),
        .MEMRE      (  ),
        .SB_CORRECT (  ),
        .DB_DETECT  (  ),
        .Q          ( DATA_Out_Write_Fifo ),
        .WRCNT      (  ),
        .RDCNT      (  ),
        .MEMWADDR   (  ),
        .MEMRADDR   (  ),
        .MEMWD      (  ) 
        );


ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_video_axi_fifo #( 
        .AE_STATIC_EN   ( 1 ),
        .AEVAL          ( 2 ),
        .AF_STATIC_EN   ( 1 ),
        .AFVAL          ( 4 ),
        .CTRL_TYPE      ( 2 ),
        .ECC            ( 0 ),
        .ESTOP          ( 1 ),
        .FAMILY         ( 26 ),
        .FSTOP          ( 1 ),
        .FWFT           ( 1 ),
        .OVERFLOW_EN    ( 0 ),
        .PIPE           ( 1 ),
        .PREFETCH       ( 0 ),
        .RCLK_EDGE      ( 1 ),
        .RDCNT_EN       ( 1 ),
        .RDEPTH         ( 5 ),
        .RE_POLARITY    ( 0 ),
        .READ_DVALID    ( 0 ),
        .RESET_POLARITY ( 0 ),
        .RWIDTH         ( AXI_LEN_WIDTH ),
        .SYNC           ( 1 ),
        .UNDERFLOW_EN   ( 0 ),
        .WCLK_EDGE      ( 1 ),
        .WDEPTH         ( 5 ),
        .WE_POLARITY    ( 0 ),
        .WRCNT_EN       ( 0 ),
        .WRITE_ACK      ( 0 ),
        .WWIDTH         ( AXI_LEN_WIDTH ) )
v_wr_len_fifo(
        // Inputs
        .CLK        ( ddr_clk_i ),
        .WCLOCK     ( ddr_clk_i ), 
        .RCLOCK     ( ddr_clk_i ), 
        .RESET      ( resetn_i ),
        .WE         ( v_wr_len_fifo_wren ),
        .RE         ( wr_len_fifo_ren ),
        .DATA       ( v_wr_len_fifo_wrdata ),
        .MEMRD      ( ALL_DATA_ZEROS[AXI_LEN_WIDTH-1:0] ), 
        // Outputs
        .FULL       (  ),
        .EMPTY      ( EMPTY_awlen_fifo ),
        .AFULL      ( AFULL_awlen_fifo ),
        .AEMPTY     (  ),
        .OVERFLOW   (  ),
        .UNDERFLOW  (  ),
        .WACK       (  ),
        .DVLD       (  ),
        .MEMWE      (  ),
        .MEMRE      (  ),
        .SB_CORRECT (  ),
        .DB_DETECT  (  ),
        .Q          ( v_wr_len_fifo_rdata ),
        .WRCNT      (  ),
        .RDCNT      (  ),
        .MEMWADDR   (  ),
        .MEMRADDR   (  ),
        .MEMWD      (  ) 
        );		
		
			
localparam RLAST_CHK = 1'b1;
//
always @(posedge ddr_clk_i or negedge resetn_i)
begin
if(resetn_i == 1'b0) begin
wval_k <= 1'b0;
VAL_ST <= IDLE;
DVLD_reg <= 1'b0;
end
else begin
 DVLD_reg <= DVLD;
 case(VAL_ST)
 IDLE : begin
  if(DVLD_reg == 1'b1 && wready == 1'b0) begin
   wval_k <= 1'b1;
   VAL_ST <= RLAST_CHK; 
   end else begin
   VAL_ST <= IDLE;
   wval_k <= 1'b0;
  end
 end
 RLAST_CHK : begin
  if(DVLD_reg == 1'b1 && wready == 1'b1) begin
   wval_k <= ~EMPTY_wr_fifo;
   VAL_ST <= IDLE;
  end else if(DVLD_reg == 1'b0 && wready == 1'b1) begin
   wval_k <= 1'b0;
   VAL_ST <= IDLE;
  end else begin
   VAL_ST <= RLAST_CHK;
   wval_k <= 1'b1;
  end
 end
endcase
end
end

assign wlast = (v_wr_len_fifo_rdata == 0) ? wvalid : wlast_reg; //SD

always @(posedge ddr_clk_i or negedge resetn_i)
begin
   if(resetn_i == 1'b0)
   begin
      rdone_int               <= 1'b0;
      wlast_reg               <= 1'b0;
      wr_len_fifo_ren         <= 1'b0;  
      wd_trans_Cnt            <= 0;
      local_wbus_state        <= IDLE;
   end      
   else       
   begin      
      rdone_int               <= rvalid & rlast & rready;

      case(local_wbus_state)

      IDLE : 
      begin
         //wd_trans_Cnt       <= ALL_DATA_ZEROS[AXI_LEN_WIDTH-1:0]+1'b1; //SD
         if(v_wr_len_fifo_rdata == wd_trans_Cnt && wready == 1'b1 && wvalid == 1'b1)
         begin
            wr_len_fifo_ren   <= 1'b1;
            local_wbus_state  <= WLAST_CHK0SIZE;
         end 
         else if(EMPTY_awlen_fifo == 1'b0 && v_wr_len_fifo_rdata != 0) //SD
         begin 
            if (wready == 1'b1 && wvalid == 1'b1)
               wd_trans_Cnt      <= 2; 
            else
               wd_trans_Cnt      <= 1; 
            local_wbus_state  <= WREADY_CHK;
         end
         else
         begin
            wr_len_fifo_ren   <= 1'b0;
            local_wbus_state  <= IDLE;
         end
      end

      WREADY_CHK : 
      begin
         if(wvalid == 1'b1 && wready == 1'b1)
         begin
            wd_trans_Cnt      <= wd_trans_Cnt + 1'b1;
         end
 
         if(v_wr_len_fifo_rdata == wd_trans_Cnt && wready == 1'b1 && wvalid == 1'b1) 
         begin
            wlast_reg         <= 1'b1;
            wr_len_fifo_ren   <= 1'b1;
            local_wbus_state  <= WLAST_CHK;
         end
         else
         begin
            local_wbus_state  <= WREADY_CHK;
         end
      end

      WLAST_CHK : 
      begin
         wr_len_fifo_ren      <= 1'b0;
         if(wvalid == 1'b1 && wready == 1'b1 && wlast == 1'b1) 
         begin
            wlast_reg         <= 1'b0;
            wd_trans_Cnt      <= 0;
            local_wbus_state  <= IDLE;
         end
         else
         begin
            local_wbus_state  <= WLAST_CHK;
         end
      end

      WLAST_CHK0SIZE : 
      begin
         //if(wvalid == 1'b1 && wready == 1'b1 && wlast == 1'b1) 
         //begin
            wd_trans_Cnt     <= 0;
            wr_len_fifo_ren  <= 1'b0;
            local_wbus_state <= IDLE;
         //end
         //else 
         //begin
         //   local_wbus_state <= WLAST_CHK0SIZE;
         //   wr_len_fifo_ren  <= 1'b0;
         //end
      end

      endcase	
end
end

assign awaddr = wstart_addr_i;
assign awlen = beats_to_w_i; // -1'b1; //SD
assign araddr = rstart_addr_i;
assign arlen = beats_to_r_i; // -1'b1; //SD
//Main state machine
always @(posedge ddr_clk_i or negedge resetn_i) begin
      if(resetn_i == 1'b0) begin
        arburst <= 0;
        arcache <= 0;
        arid <= 0;
        arlock <= 0;
        arprot <= 0;
        arsize <= ALL_SIZE_VAL;
        arvalid <= 0;
        rready <= 0;
        bready <= 0;
        awburst <= 0;
        awcache <= 0;
        awid <= 0;
        awlock <= 0;
        awprot <= 0;
        awsize <= ALL_SIZE_VAL;
        awvalid <= 1'b0;   
        video_bus_state <= IDLE;

		wack_o <= 1'b0;
		rack_o <= 1'b0;
		v_wr_len_fifo_wren <= 1'b0;
      end else begin
         rready <= 1'b1;
         bready <= 1'b1;
		 v_wr_len_fifo_wrdata <= beats_to_w_i;		 
	    case(video_bus_state)
            IDLE : begin
		         v_wr_len_fifo_wren <= 1'b0;
			     wack_o <= 1'b0;
				 rack_o <= 1'b0;
				 awvalid <= 1'b0;
			    if(ddr_ctrl_ready_i == 1'b1) begin
				video_bus_state <= ADDRESS_CHK;
				end
				else
				video_bus_state <= IDLE;
			end
			ADDRESS_CHK : begin
			     wack_o <= 1'b0;
				 rack_o <= 1'b0;
			    if (rreq_i == 1'b1) begin
				v_wr_len_fifo_wren <= 1'b0;
				arvalid <= 1'b1;
				awvalid <= 1'b0;
				video_bus_state <= READ_ADDRESS;				
				end else if(wreq_i == 1'b1 && FULL_wr_fifo == 1'b0 && AFULL_awlen_fifo == 1'b0) begin
				arvalid <= 1'b0;
				awvalid <= 1'b1;
				v_wr_len_fifo_wren <= 1'b1;
				video_bus_state <= WR_ADDRESS;
				end	else begin
				arvalid <= 1'b0;
				awvalid <= 1'b0;
				video_bus_state <= ADDRESS_CHK;
				v_wr_len_fifo_wren <= 1'b0;
				end
			end
			WR_ADDRESS : begin			     
            	 v_wr_len_fifo_wren <= 1'b0;
				 rack_o <= 1'b0;
			    if(awvalid == 1'b1 && awready == 1'b1) begin
				awvalid <= 1'b0;
				wack_o <= 1'b1;
				video_bus_state <= WAIT_ST;
				end
				else
				video_bus_state <= WR_ADDRESS;
			end
			READ_ADDRESS : begin
            	 v_wr_len_fifo_wren <= 1'b0;	
				 wack_o <= 1'b0;
			    if(arvalid == 1'b1 && arready == 1'b1) begin
				arvalid <= 1'b0;
				rack_o <= 1'b1;
				video_bus_state <= WAIT_ST;
				end
				else
				video_bus_state <= READ_ADDRESS;
			end
            WAIT_ST : begin
             video_bus_state <= ADDRESS_CHK;
            end
		endcase
	  end
	end
endmodule

