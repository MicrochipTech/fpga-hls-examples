//--=================================================================================================
//-- File Name                           : axi_lbus_ram_wrapper.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//--=================================================================================================

// This is automatically generated file 

`timescale 1 ns/100 ps
module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_ram_wrapper(
WDATA,  
WADDR,  
WEN,    
REN,    
RDATA,  
RADDR,  
RESET_N,
CLOCK,  
WCLOCK, 
A_SB_CORRECT, 
B_SB_CORRECT, 
A_DB_DETECT, 
B_DB_DETECT, 
RCLOCK  
);      
  

// --------------------------------------------------------------------------
// PARAMETER Declaration
// --------------------------------------------------------------------------
parameter                RWIDTH        = 32;  // Read  port Data Width
parameter                WWIDTH        = 32;  // Write port Data Width
parameter                RDEPTH        = 128; // Read  port Data Depth
parameter                WDEPTH        = 128; // Write port Data Depth
parameter                SYNC          = 0;   // Synchronous or Asynchronous operation | 1 - Single Clock, 0 - Dual clock
parameter                PIPE          = 1;   // Pipeline read data out
parameter                CTRL_TYPE     = 1;   // Controller only options | 1 - Controller Only, 2 - RAM1Kx18, 3 - RAM64x18
// --------------------------------------------------------------------------
// I/O Declaration
// --------------------------------------------------------------------------
input [WWIDTH - 1 : 0]   WDATA;  
input [(WDEPTH - 1) : 0] WADDR;  
input                    WEN;    
input                    REN;    
output [RWIDTH - 1 : 0]  RDATA;  
input [(RDEPTH - 1) : 0] RADDR;  
input                    RESET_N;
input                    WCLOCK; 
input                    RCLOCK; 
output                    A_SB_CORRECT; 
output                    B_SB_CORRECT; 
output                    A_DB_DETECT; 
output                    B_DB_DETECT; 
input                    CLOCK;  
  

ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_LSRAM_top #(
                   .RWIDTH    (RWIDTH            ),
                   .WWIDTH    (WWIDTH            ),
                   .RDEPTH    (RDEPTH),
                   .WDEPTH    (WDEPTH)
)
L3_syncnonpipe (
.W_DATA    (WDATA   ),
.W_ADDR (WADDR   ),
.W_EN   (WEN     ),
.R_DATA    (RDATA   ),
.R_ADDR (RADDR   ),
.R_EN   (REN     ),
.CLK   (CLOCK   ) 
);


endmodule
