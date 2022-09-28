//--=================================================================================================
//-- File Name                           : axi_lbus_LSRAM_top.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//--=================================================================================================
`timescale 1 ns/100 ps
// Version: PolarFire v2.0 12.200.0.20

module ddr_rw_arbiter_C0_ddr_rw_arbiter_C0_0_LSRAM_top(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       R_EN,
       CLK
    );
parameter                RWIDTH        = 32;  // Read  port Data Width
parameter                WWIDTH        = 32;  // Write port Data Width
parameter                RDEPTH        = 128; // Read  port Data Depth
parameter                WDEPTH        = 128; // Write port Data Depth

input  [RWIDTH-1:0] W_DATA;
output [WWIDTH-1:0] R_DATA;
input  [WDEPTH-1:0] W_ADDR;//[WDEPTH-1:0] W_ADDR;
input  [RDEPTH-1:0] R_ADDR;//[RDEPTH-1:0] R_ADDR;
input  W_EN;
input  R_EN;
input  CLK;


generate if(RWIDTH == 72) begin
     wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%512-512%72-72%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, R_DATA[35], 
        R_DATA[34], R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], 
        R_DATA[29], R_DATA[28], R_DATA[27], nc1, R_DATA[26], 
        R_DATA[25], R_DATA[24], R_DATA[23], R_DATA[22], R_DATA[21], 
        R_DATA[20], R_DATA[19], R_DATA[18]}), .B_DOUT({nc2, R_DATA[17], 
        R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], nc3, R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .DB_DETECT(\DB_DETECT[0][0] ), 
        .SB_CORRECT(\SB_CORRECT[0][0] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({GND, W_DATA[35], W_DATA[34], W_DATA[33], 
        W_DATA[32], W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], 
        W_DATA[27], GND, W_DATA[26], W_DATA[25], W_DATA[24], 
        W_DATA[23], W_DATA[22], W_DATA[21], W_DATA[20], W_DATA[19], 
        W_DATA[18]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC)
        , .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, 
        W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], 
        W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], GND, W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%512-512%72-72%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({nc4, R_DATA[71], 
        R_DATA[70], R_DATA[69], R_DATA[68], R_DATA[67], R_DATA[66], 
        R_DATA[65], R_DATA[64], R_DATA[63], nc5, R_DATA[62], 
        R_DATA[61], R_DATA[60], R_DATA[59], R_DATA[58], R_DATA[57], 
        R_DATA[56], R_DATA[55], R_DATA[54]}), .B_DOUT({nc6, R_DATA[53], 
        R_DATA[52], R_DATA[51], R_DATA[50], R_DATA[49], R_DATA[48], 
        R_DATA[47], R_DATA[46], R_DATA[45], nc7, R_DATA[44], 
        R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40], R_DATA[39], 
        R_DATA[38], R_DATA[37], R_DATA[36]}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], GND, 
        W_DATA[62], W_DATA[61], W_DATA[60], W_DATA[59], W_DATA[58], 
        W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[53], W_DATA[52], 
        W_DATA[51], W_DATA[50], W_DATA[49], W_DATA[48], W_DATA[47], 
        W_DATA[46], W_DATA[45], GND, W_DATA[44], W_DATA[43], 
        W_DATA[42], W_DATA[41], W_DATA[40], W_DATA[39], W_DATA[38], 
        W_DATA[37], W_DATA[36]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end    
else if(RWIDTH == 64) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%512-512%64-64%SPEED%0%0%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, nc3, nc4, 
        nc5, nc6, nc7, R_DATA[31], R_DATA[30], R_DATA[29], R_DATA[28], 
        R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], R_DATA[23], 
        R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({R_DATA[19], 
        R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], R_DATA[14], 
        R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], R_DATA[9], 
        R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], 
        R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), .DB_DETECT(
        \DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, W_DATA[31], W_DATA[30], W_DATA[29], 
        W_DATA[28], W_DATA[27], W_DATA[26], W_DATA[25], W_DATA[24], 
        W_DATA[23], W_DATA[22], W_DATA[21], W_DATA[20]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], W_DATA[18], W_DATA[17], 
        W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%512-512%64-64%SPEED%0%1%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C1 (.A_DOUT({nc8, nc9, nc10, nc11, 
        nc12, nc13, nc14, nc15, R_DATA[63], R_DATA[62], R_DATA[61], 
        R_DATA[60], R_DATA[59], R_DATA[58], R_DATA[57], R_DATA[56], 
        R_DATA[55], R_DATA[54], R_DATA[53], R_DATA[52]}), .B_DOUT({
        R_DATA[51], R_DATA[50], R_DATA[49], R_DATA[48], R_DATA[47], 
        R_DATA[46], R_DATA[45], R_DATA[44], R_DATA[43], R_DATA[42], 
        R_DATA[41], R_DATA[40], R_DATA[39], R_DATA[38], R_DATA[37], 
        R_DATA[36], R_DATA[35], R_DATA[34], R_DATA[33], R_DATA[32]}), 
        .DB_DETECT(\DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, W_DATA[63], W_DATA[62], W_DATA[61], 
        W_DATA[60], W_DATA[59], W_DATA[58], W_DATA[57], W_DATA[56], 
        W_DATA[55], W_DATA[54], W_DATA[53], W_DATA[52]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40], W_DATA[39], 
        W_DATA[38], W_DATA[37], W_DATA[36], W_DATA[35], W_DATA[34], 
        W_DATA[33], W_DATA[32]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end 
else if(RWIDTH == 144) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%512-512%144-144%SPEED%3%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C3 (.A_DOUT({nc0, R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140], R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], nc1, 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126]}), .B_DOUT({nc2, R_DATA[125], R_DATA[124], 
        R_DATA[123], R_DATA[122], R_DATA[121], R_DATA[120], 
        R_DATA[119], R_DATA[118], R_DATA[117], nc3, R_DATA[116], 
        R_DATA[115], R_DATA[114], R_DATA[113], R_DATA[112], 
        R_DATA[111], R_DATA[110], R_DATA[109], R_DATA[108]}), 
        .DB_DETECT(\DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        W_DATA[143], W_DATA[142], W_DATA[141], W_DATA[140], 
        W_DATA[139], W_DATA[138], W_DATA[137], W_DATA[136], 
        W_DATA[135], GND, W_DATA[134], W_DATA[133], W_DATA[132], 
        W_DATA[131], W_DATA[130], W_DATA[129], W_DATA[128], 
        W_DATA[127], W_DATA[126]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], 
        W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, 
        GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, 
        W_DATA[125], W_DATA[124], W_DATA[123], W_DATA[122], 
        W_DATA[121], W_DATA[120], W_DATA[119], W_DATA[118], 
        W_DATA[117], GND, W_DATA[116], W_DATA[115], W_DATA[114], 
        W_DATA[113], W_DATA[112], W_DATA[111], W_DATA[110], 
        W_DATA[109], W_DATA[108]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%512-512%144-144%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc4, R_DATA[35], 
        R_DATA[34], R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], 
        R_DATA[29], R_DATA[28], R_DATA[27], nc5, R_DATA[26], 
        R_DATA[25], R_DATA[24], R_DATA[23], R_DATA[22], R_DATA[21], 
        R_DATA[20], R_DATA[19], R_DATA[18]}), .B_DOUT({nc6, R_DATA[17], 
        R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], nc7, R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .DB_DETECT(\DB_DETECT[0][0] ), 
        .SB_CORRECT(\SB_CORRECT[0][0] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({GND, W_DATA[35], W_DATA[34], W_DATA[33], 
        W_DATA[32], W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], 
        W_DATA[27], GND, W_DATA[26], W_DATA[25], W_DATA[24], 
        W_DATA[23], W_DATA[22], W_DATA[21], W_DATA[20], W_DATA[19], 
        W_DATA[18]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC)
        , .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, 
        W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], 
        W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], GND, W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%512-512%144-144%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({nc8, R_DATA[71], 
        R_DATA[70], R_DATA[69], R_DATA[68], R_DATA[67], R_DATA[66], 
        R_DATA[65], R_DATA[64], R_DATA[63], nc9, R_DATA[62], 
        R_DATA[61], R_DATA[60], R_DATA[59], R_DATA[58], R_DATA[57], 
        R_DATA[56], R_DATA[55], R_DATA[54]}), .B_DOUT({nc10, 
        R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], R_DATA[49], 
        R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], nc11, 
        R_DATA[44], R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40], 
        R_DATA[39], R_DATA[38], R_DATA[37], R_DATA[36]}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], GND, 
        W_DATA[62], W_DATA[61], W_DATA[60], W_DATA[59], W_DATA[58], 
        W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[53], W_DATA[52], 
        W_DATA[51], W_DATA[50], W_DATA[49], W_DATA[48], W_DATA[47], 
        W_DATA[46], W_DATA[45], GND, W_DATA[44], W_DATA[43], 
        W_DATA[42], W_DATA[41], W_DATA[40], W_DATA[39], W_DATA[38], 
        W_DATA[37], W_DATA[36]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%512-512%144-144%SPEED%2%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C2 (.A_DOUT({nc12, R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100], R_DATA[99], nc13, 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90]}), .B_DOUT({
        nc14, R_DATA[89], R_DATA[88], R_DATA[87], R_DATA[86], 
        R_DATA[85], R_DATA[84], R_DATA[83], R_DATA[82], R_DATA[81], 
        nc15, R_DATA[80], R_DATA[79], R_DATA[78], R_DATA[77], 
        R_DATA[76], R_DATA[75], R_DATA[74], R_DATA[73], R_DATA[72]}), 
        .DB_DETECT(\DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({R_ADDR[8], 
        R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        W_DATA[107], W_DATA[106], W_DATA[105], W_DATA[104], 
        W_DATA[103], W_DATA[102], W_DATA[101], W_DATA[100], W_DATA[99], 
        GND, W_DATA[98], W_DATA[97], W_DATA[96], W_DATA[95], 
        W_DATA[94], W_DATA[93], W_DATA[92], W_DATA[91], W_DATA[90]}), 
        .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, 
        W_DATA[89], W_DATA[88], W_DATA[87], W_DATA[86], W_DATA[85], 
        W_DATA[84], W_DATA[83], W_DATA[82], W_DATA[81], GND, 
        W_DATA[80], W_DATA[79], W_DATA[78], W_DATA[77], W_DATA[76], 
        W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 128) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%256-256%128-128%SPEED%0%3%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C3 (.A_DOUT({nc0, nc1, nc2, nc3, nc4, 
        nc5, nc6, nc7, R_DATA[127], R_DATA[126], R_DATA[125], 
        R_DATA[124], R_DATA[123], R_DATA[122], R_DATA[121], 
        R_DATA[120], R_DATA[119], R_DATA[118], R_DATA[117], 
        R_DATA[116]}), .B_DOUT({R_DATA[115], R_DATA[114], R_DATA[113], 
        R_DATA[112], R_DATA[111], R_DATA[110], R_DATA[109], 
        R_DATA[108], R_DATA[107], R_DATA[106], R_DATA[105], 
        R_DATA[104], R_DATA[103], R_DATA[102], R_DATA[101], 
        R_DATA[100], R_DATA[99], R_DATA[98], R_DATA[97], R_DATA[96]}), 
        .DB_DETECT(\DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, W_DATA[127], W_DATA[126], W_DATA[125], 
        W_DATA[124], W_DATA[123], W_DATA[122], W_DATA[121], 
        W_DATA[120], W_DATA[119], W_DATA[118], W_DATA[117], 
        W_DATA[116]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        W_ADDR[7], W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[115], 
        W_DATA[114], W_DATA[113], W_DATA[112], W_DATA[111], 
        W_DATA[110], W_DATA[109], W_DATA[108], W_DATA[107], 
        W_DATA[106], W_DATA[105], W_DATA[104], W_DATA[103], 
        W_DATA[102], W_DATA[101], W_DATA[100], W_DATA[99], W_DATA[98], 
        W_DATA[97], W_DATA[96]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%256-256%128-128%SPEED%0%0%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C0 (.A_DOUT({nc8, nc9, nc10, nc11, 
        nc12, nc13, nc14, nc15, R_DATA[31], R_DATA[30], R_DATA[29], 
        R_DATA[28], R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], 
        R_DATA[23], R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], 
        W_DATA[27], W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], 
        W_DATA[22], W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({
        VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], W_DATA[18], W_DATA[17], 
        W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%256-256%128-128%SPEED%0%1%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C1 (.A_DOUT({nc16, nc17, nc18, nc19, 
        nc20, nc21, nc22, nc23, R_DATA[63], R_DATA[62], R_DATA[61], 
        R_DATA[60], R_DATA[59], R_DATA[58], R_DATA[57], R_DATA[56], 
        R_DATA[55], R_DATA[54], R_DATA[53], R_DATA[52]}), .B_DOUT({
        R_DATA[51], R_DATA[50], R_DATA[49], R_DATA[48], R_DATA[47], 
        R_DATA[46], R_DATA[45], R_DATA[44], R_DATA[43], R_DATA[42], 
        R_DATA[41], R_DATA[40], R_DATA[39], R_DATA[38], R_DATA[37], 
        R_DATA[36], R_DATA[35], R_DATA[34], R_DATA[33], R_DATA[32]}), 
        .DB_DETECT(\DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, W_DATA[63], W_DATA[62], W_DATA[61], W_DATA[60], 
        W_DATA[59], W_DATA[58], W_DATA[57], W_DATA[56], W_DATA[55], 
        W_DATA[54], W_DATA[53], W_DATA[52]}), .A_REN(R_EN), .A_WEN({
        VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40], W_DATA[39], 
        W_DATA[38], W_DATA[37], W_DATA[36], W_DATA[35], W_DATA[34], 
        W_DATA[33], W_DATA[32]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%256-256%128-128%SPEED%0%2%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C2 (.A_DOUT({nc24, nc25, nc26, nc27, 
        nc28, nc29, nc30, nc31, R_DATA[95], R_DATA[94], R_DATA[93], 
        R_DATA[92], R_DATA[91], R_DATA[90], R_DATA[89], R_DATA[88], 
        R_DATA[87], R_DATA[86], R_DATA[85], R_DATA[84]}), .B_DOUT({
        R_DATA[83], R_DATA[82], R_DATA[81], R_DATA[80], R_DATA[79], 
        R_DATA[78], R_DATA[77], R_DATA[76], R_DATA[75], R_DATA[74], 
        R_DATA[73], R_DATA[72], R_DATA[71], R_DATA[70], R_DATA[69], 
        R_DATA[68], R_DATA[67], R_DATA[66], R_DATA[65], R_DATA[64]}), 
        .DB_DETECT(\DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, R_ADDR[7], 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, W_DATA[95], W_DATA[94], W_DATA[93], W_DATA[92], 
        W_DATA[91], W_DATA[90], W_DATA[89], W_DATA[88], W_DATA[87], 
        W_DATA[86], W_DATA[85], W_DATA[84]}), .A_REN(R_EN), .A_WEN({
        VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[83], W_DATA[82], W_DATA[81], 
        W_DATA[80], W_DATA[79], W_DATA[78], W_DATA[77], W_DATA[76], 
        W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72], W_DATA[71], 
        W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], W_DATA[66], 
        W_DATA[65], W_DATA[64]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if (RWIDTH == 12) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    RAM1K20 #( .RAMINDEX("core%5-5%12-12%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, nc3, 
        nc4, nc5, nc6, nc7, R_DATA[11], R_DATA[10], R_DATA[9], 
        R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], 
        R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), .B_DOUT({nc8, 
        nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26, nc27}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, 
        GND, GND, GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if (RWIDTH == 36) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%1024-1024%36-36%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, R_DATA[17], 
        R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], nc1, R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .B_DOUT({nc2, nc3, nc4, nc5, nc6, nc7, 
        nc8, nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), 
        .A_WEN({GND, GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[17], W_DATA[16], 
        W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], W_DATA[11], 
        W_DATA[10], W_DATA[9], GND, W_DATA[8], W_DATA[7], W_DATA[6], 
        W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], W_DATA[1], 
        W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%1024-1024%36-36%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({nc22, R_DATA[35], 
        R_DATA[34], R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], 
        R_DATA[29], R_DATA[28], R_DATA[27], nc23, R_DATA[26], 
        R_DATA[25], R_DATA[24], R_DATA[23], R_DATA[22], R_DATA[21], 
        R_DATA[20], R_DATA[19], R_DATA[18]}), .B_DOUT({nc24, nc25, 
        nc26, nc27, nc28, nc29, nc30, nc31, nc32, nc33, nc34, nc35, 
        nc36, nc37, nc38, nc39, nc40, nc41, nc42, nc43}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND})
        , .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND})
        , .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        GND, W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], 
        W_DATA[22], W_DATA[21], W_DATA[20], W_DATA[19], W_DATA[18]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if (RWIDTH == 32) begin
  wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%1024-1024%32-32%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, nc3, 
        R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], 
        R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], 
        R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], 
        R_DATA[0]}), .B_DOUT({nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, 
        nc12, nc13, nc14, nc15, nc16, nc17, nc18, nc19, nc20, nc21, 
        nc22, nc23}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), 
        .A_WEN({GND, GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[9], W_ADDR[8], W_ADDR[7], 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, 
        W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], W_DATA[11], 
        W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], W_DATA[6], 
        W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], W_DATA[1], 
        W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%1024-1024%32-32%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({nc24, nc25, nc26, 
        nc27, R_DATA[31], R_DATA[30], R_DATA[29], R_DATA[28], 
        R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], R_DATA[23], 
        R_DATA[22], R_DATA[21], R_DATA[20], R_DATA[19], R_DATA[18], 
        R_DATA[17], R_DATA[16]}), .B_DOUT({nc28, nc29, nc30, nc31, 
        nc32, nc33, nc34, nc35, nc36, nc37, nc38, nc39, nc40, nc41, 
        nc42, nc43, nc44, nc45, nc46, nc47}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[9], 
        R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], R_ADDR[4], 
        R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND})
        , .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND})
        , .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({W_ADDR[9], W_ADDR[8], W_ADDR[7], W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, W_DATA[31], W_DATA[30], W_DATA[29], 
        W_DATA[28], W_DATA[27], W_DATA[26], W_DATA[25], W_DATA[24], 
        W_DATA[23], W_DATA[22], W_DATA[21], W_DATA[20], W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if(RWIDTH == 288) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        \ACCESS_BUSY[0][4] , \SB_CORRECT[0][4] , \DB_DETECT[0][4] , 
        \ACCESS_BUSY[0][5] , \SB_CORRECT[0][5] , \DB_DETECT[0][5] , 
        \ACCESS_BUSY[0][6] , \SB_CORRECT[0][6] , \DB_DETECT[0][6] , 
        \ACCESS_BUSY[0][7] , \SB_CORRECT[0][7] , \DB_DETECT[0][7] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%3%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C3 (.A_DOUT({nc0, R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140], R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], nc1, 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126]}), .B_DOUT({nc2, R_DATA[125], R_DATA[124], 
        R_DATA[123], R_DATA[122], R_DATA[121], R_DATA[120], 
        R_DATA[119], R_DATA[118], R_DATA[117], nc3, R_DATA[116], 
        R_DATA[115], R_DATA[114], R_DATA[113], R_DATA[112], 
        R_DATA[111], R_DATA[110], R_DATA[109], R_DATA[108]}), 
        .DB_DETECT(\DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[143], 
        W_DATA[142], W_DATA[141], W_DATA[140], W_DATA[139], 
        W_DATA[138], W_DATA[137], W_DATA[136], W_DATA[135], GND, 
        W_DATA[134], W_DATA[133], W_DATA[132], W_DATA[131], 
        W_DATA[130], W_DATA[129], W_DATA[128], W_DATA[127], 
        W_DATA[126]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[125], 
        W_DATA[124], W_DATA[123], W_DATA[122], W_DATA[121], 
        W_DATA[120], W_DATA[119], W_DATA[118], W_DATA[117], GND, 
        W_DATA[116], W_DATA[115], W_DATA[114], W_DATA[113], 
        W_DATA[112], W_DATA[111], W_DATA[110], W_DATA[109], 
        W_DATA[108]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC)
        , .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc4, R_DATA[35], 
        R_DATA[34], R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], 
        R_DATA[29], R_DATA[28], R_DATA[27], nc5, R_DATA[26], 
        R_DATA[25], R_DATA[24], R_DATA[23], R_DATA[22], R_DATA[21], 
        R_DATA[20], R_DATA[19], R_DATA[18]}), .B_DOUT({nc6, R_DATA[17], 
        R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], nc7, R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .DB_DETECT(\DB_DETECT[0][0] ), 
        .SB_CORRECT(\SB_CORRECT[0][0] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), 
        .A_DIN({GND, W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        GND, W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], 
        W_DATA[22], W_DATA[21], W_DATA[20], W_DATA[19], W_DATA[18]}), 
        .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[17], 
        W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], GND, W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%4%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C4 (.A_DOUT({nc8, R_DATA[179], 
        R_DATA[178], R_DATA[177], R_DATA[176], R_DATA[175], 
        R_DATA[174], R_DATA[173], R_DATA[172], R_DATA[171], nc9, 
        R_DATA[170], R_DATA[169], R_DATA[168], R_DATA[167], 
        R_DATA[166], R_DATA[165], R_DATA[164], R_DATA[163], 
        R_DATA[162]}), .B_DOUT({nc10, R_DATA[161], R_DATA[160], 
        R_DATA[159], R_DATA[158], R_DATA[157], R_DATA[156], 
        R_DATA[155], R_DATA[154], R_DATA[153], nc11, R_DATA[152], 
        R_DATA[151], R_DATA[150], R_DATA[149], R_DATA[148], 
        R_DATA[147], R_DATA[146], R_DATA[145], R_DATA[144]}), 
        .DB_DETECT(\DB_DETECT[0][4] ), .SB_CORRECT(\SB_CORRECT[0][4] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[179], 
        W_DATA[178], W_DATA[177], W_DATA[176], W_DATA[175], 
        W_DATA[174], W_DATA[173], W_DATA[172], W_DATA[171], GND, 
        W_DATA[170], W_DATA[169], W_DATA[168], W_DATA[167], 
        W_DATA[166], W_DATA[165], W_DATA[164], W_DATA[163], 
        W_DATA[162]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[161], 
        W_DATA[160], W_DATA[159], W_DATA[158], W_DATA[157], 
        W_DATA[156], W_DATA[155], W_DATA[154], W_DATA[153], GND, 
        W_DATA[152], W_DATA[151], W_DATA[150], W_DATA[149], 
        W_DATA[148], W_DATA[147], W_DATA[146], W_DATA[145], 
        W_DATA[144]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC)
        , .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%6%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C6 (.A_DOUT({nc12, R_DATA[251], 
        R_DATA[250], R_DATA[249], R_DATA[248], R_DATA[247], 
        R_DATA[246], R_DATA[245], R_DATA[244], R_DATA[243], nc13, 
        R_DATA[242], R_DATA[241], R_DATA[240], R_DATA[239], 
        R_DATA[238], R_DATA[237], R_DATA[236], R_DATA[235], 
        R_DATA[234]}), .B_DOUT({nc14, R_DATA[233], R_DATA[232], 
        R_DATA[231], R_DATA[230], R_DATA[229], R_DATA[228], 
        R_DATA[227], R_DATA[226], R_DATA[225], nc15, R_DATA[224], 
        R_DATA[223], R_DATA[222], R_DATA[221], R_DATA[220], 
        R_DATA[219], R_DATA[218], R_DATA[217], R_DATA[216]}), 
        .DB_DETECT(\DB_DETECT[0][6] ), .SB_CORRECT(\SB_CORRECT[0][6] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[251], 
        W_DATA[250], W_DATA[249], W_DATA[248], W_DATA[247], 
        W_DATA[246], W_DATA[245], W_DATA[244], W_DATA[243], GND, 
        W_DATA[242], W_DATA[241], W_DATA[240], W_DATA[239], 
        W_DATA[238], W_DATA[237], W_DATA[236], W_DATA[235], 
        W_DATA[234]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[233], 
        W_DATA[232], W_DATA[231], W_DATA[230], W_DATA[229], 
        W_DATA[228], W_DATA[227], W_DATA[226], W_DATA[225], GND, 
        W_DATA[224], W_DATA[223], W_DATA[222], W_DATA[221], 
        W_DATA[220], W_DATA[219], W_DATA[218], W_DATA[217], 
        W_DATA[216]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC)
        , .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({nc16, R_DATA[71], 
        R_DATA[70], R_DATA[69], R_DATA[68], R_DATA[67], R_DATA[66], 
        R_DATA[65], R_DATA[64], R_DATA[63], nc17, R_DATA[62], 
        R_DATA[61], R_DATA[60], R_DATA[59], R_DATA[58], R_DATA[57], 
        R_DATA[56], R_DATA[55], R_DATA[54]}), .B_DOUT({nc18, 
        R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], R_DATA[49], 
        R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], nc19, 
        R_DATA[44], R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40], 
        R_DATA[39], R_DATA[38], R_DATA[37], R_DATA[36]}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[71], 
        W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], W_DATA[66], 
        W_DATA[65], W_DATA[64], W_DATA[63], GND, W_DATA[62], 
        W_DATA[61], W_DATA[60], W_DATA[59], W_DATA[58], W_DATA[57], 
        W_DATA[56], W_DATA[55], W_DATA[54]}), .A_REN(R_EN), .A_WEN({
        VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, W_DATA[53], W_DATA[52], W_DATA[51], W_DATA[50], 
        W_DATA[49], W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], 
        GND, W_DATA[44], W_DATA[43], W_DATA[42], W_DATA[41], 
        W_DATA[40], W_DATA[39], W_DATA[38], W_DATA[37], W_DATA[36]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%7%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C7 (.A_DOUT({nc20, R_DATA[287], 
        R_DATA[286], R_DATA[285], R_DATA[284], R_DATA[283], 
        R_DATA[282], R_DATA[281], R_DATA[280], R_DATA[279], nc21, 
        R_DATA[278], R_DATA[277], R_DATA[276], R_DATA[275], 
        R_DATA[274], R_DATA[273], R_DATA[272], R_DATA[271], 
        R_DATA[270]}), .B_DOUT({nc22, R_DATA[269], R_DATA[268], 
        R_DATA[267], R_DATA[266], R_DATA[265], R_DATA[264], 
        R_DATA[263], R_DATA[262], R_DATA[261], nc23, R_DATA[260], 
        R_DATA[259], R_DATA[258], R_DATA[257], R_DATA[256], 
        R_DATA[255], R_DATA[254], R_DATA[253], R_DATA[252]}), 
        .DB_DETECT(\DB_DETECT[0][7] ), .SB_CORRECT(\SB_CORRECT[0][7] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[287], 
        W_DATA[286], W_DATA[285], W_DATA[284], W_DATA[283], 
        W_DATA[282], W_DATA[281], W_DATA[280], W_DATA[279], GND, 
        W_DATA[278], W_DATA[277], W_DATA[276], W_DATA[275], 
        W_DATA[274], W_DATA[273], W_DATA[272], W_DATA[271], 
        W_DATA[270]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[269], 
        W_DATA[268], W_DATA[267], W_DATA[266], W_DATA[265], 
        W_DATA[264], W_DATA[263], W_DATA[262], W_DATA[261], GND, 
        W_DATA[260], W_DATA[259], W_DATA[258], W_DATA[257], 
        W_DATA[256], W_DATA[255], W_DATA[254], W_DATA[253], 
        W_DATA[252]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC)
        , .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%2%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C2 (.A_DOUT({nc24, R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100], R_DATA[99], nc25, 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90]}), .B_DOUT({
        nc26, R_DATA[89], R_DATA[88], R_DATA[87], R_DATA[86], 
        R_DATA[85], R_DATA[84], R_DATA[83], R_DATA[82], R_DATA[81], 
        nc27, R_DATA[80], R_DATA[79], R_DATA[78], R_DATA[77], 
        R_DATA[76], R_DATA[75], R_DATA[74], R_DATA[73], R_DATA[72]}), 
        .DB_DETECT(\DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[107], 
        W_DATA[106], W_DATA[105], W_DATA[104], W_DATA[103], 
        W_DATA[102], W_DATA[101], W_DATA[100], W_DATA[99], GND, 
        W_DATA[98], W_DATA[97], W_DATA[96], W_DATA[95], W_DATA[94], 
        W_DATA[93], W_DATA[92], W_DATA[91], W_DATA[90]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, W_DATA[89], W_DATA[88], W_DATA[87], W_DATA[86], 
        W_DATA[85], W_DATA[84], W_DATA[83], W_DATA[82], W_DATA[81], 
        GND, W_DATA[80], W_DATA[79], W_DATA[78], W_DATA[77], 
        W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%288-288%SPEED%5%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C5 (.A_DOUT({nc28, R_DATA[215], 
        R_DATA[214], R_DATA[213], R_DATA[212], R_DATA[211], 
        R_DATA[210], R_DATA[209], R_DATA[208], R_DATA[207], nc29, 
        R_DATA[206], R_DATA[205], R_DATA[204], R_DATA[203], 
        R_DATA[202], R_DATA[201], R_DATA[200], R_DATA[199], 
        R_DATA[198]}), .B_DOUT({nc30, R_DATA[197], R_DATA[196], 
        R_DATA[195], R_DATA[194], R_DATA[193], R_DATA[192], 
        R_DATA[191], R_DATA[190], R_DATA[189], nc31, R_DATA[188], 
        R_DATA[187], R_DATA[186], R_DATA[185], R_DATA[184], 
        R_DATA[183], R_DATA[182], R_DATA[181], R_DATA[180]}), 
        .DB_DETECT(\DB_DETECT[0][5] ), .SB_CORRECT(\SB_CORRECT[0][5] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, W_DATA[215], 
        W_DATA[214], W_DATA[213], W_DATA[212], W_DATA[211], 
        W_DATA[210], W_DATA[209], W_DATA[208], W_DATA[207], GND, 
        W_DATA[206], W_DATA[205], W_DATA[204], W_DATA[203], 
        W_DATA[202], W_DATA[201], W_DATA[200], W_DATA[199], 
        W_DATA[198]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[197], 
        W_DATA[196], W_DATA[195], W_DATA[194], W_DATA[193], 
        W_DATA[192], W_DATA[191], W_DATA[190], W_DATA[189], GND, 
        W_DATA[188], W_DATA[187], W_DATA[186], W_DATA[185], 
        W_DATA[184], W_DATA[183], W_DATA[182], W_DATA[181], 
        W_DATA[180]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC)
        , .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if(RWIDTH == 256) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        \ACCESS_BUSY[0][4] , \SB_CORRECT[0][4] , \DB_DETECT[0][4] , 
        \ACCESS_BUSY[0][5] , \SB_CORRECT[0][5] , \DB_DETECT[0][5] , 
        \ACCESS_BUSY[0][6] , \SB_CORRECT[0][6] , \DB_DETECT[0][6] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%3%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C3 (.A_DOUT({R_DATA[159], 
        R_DATA[158], R_DATA[157], R_DATA[156], R_DATA[155], 
        R_DATA[154], R_DATA[153], R_DATA[152], R_DATA[151], 
        R_DATA[150], R_DATA[149], R_DATA[148], R_DATA[147], 
        R_DATA[146], R_DATA[145], R_DATA[144], R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140]}), .B_DOUT({R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126], R_DATA[125], R_DATA[124], R_DATA[123], 
        R_DATA[122], R_DATA[121], R_DATA[120]}), .DB_DETECT(
        \DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[159], W_DATA[158], 
        W_DATA[157], W_DATA[156], W_DATA[155], W_DATA[154], 
        W_DATA[153], W_DATA[152], W_DATA[151], W_DATA[150], 
        W_DATA[149], W_DATA[148], W_DATA[147], W_DATA[146], 
        W_DATA[145], W_DATA[144], W_DATA[143], W_DATA[142], 
        W_DATA[141], W_DATA[140]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[139], 
        W_DATA[138], W_DATA[137], W_DATA[136], W_DATA[135], 
        W_DATA[134], W_DATA[133], W_DATA[132], W_DATA[131], 
        W_DATA[130], W_DATA[129], W_DATA[128], W_DATA[127], 
        W_DATA[126], W_DATA[125], W_DATA[124], W_DATA[123], 
        W_DATA[122], W_DATA[121], W_DATA[120]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%4%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C4 (.A_DOUT({R_DATA[199], 
        R_DATA[198], R_DATA[197], R_DATA[196], R_DATA[195], 
        R_DATA[194], R_DATA[193], R_DATA[192], R_DATA[191], 
        R_DATA[190], R_DATA[189], R_DATA[188], R_DATA[187], 
        R_DATA[186], R_DATA[185], R_DATA[184], R_DATA[183], 
        R_DATA[182], R_DATA[181], R_DATA[180]}), .B_DOUT({R_DATA[179], 
        R_DATA[178], R_DATA[177], R_DATA[176], R_DATA[175], 
        R_DATA[174], R_DATA[173], R_DATA[172], R_DATA[171], 
        R_DATA[170], R_DATA[169], R_DATA[168], R_DATA[167], 
        R_DATA[166], R_DATA[165], R_DATA[164], R_DATA[163], 
        R_DATA[162], R_DATA[161], R_DATA[160]}), .DB_DETECT(
        \DB_DETECT[0][4] ), .SB_CORRECT(\SB_CORRECT[0][4] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[199], W_DATA[198], 
        W_DATA[197], W_DATA[196], W_DATA[195], W_DATA[194], 
        W_DATA[193], W_DATA[192], W_DATA[191], W_DATA[190], 
        W_DATA[189], W_DATA[188], W_DATA[187], W_DATA[186], 
        W_DATA[185], W_DATA[184], W_DATA[183], W_DATA[182], 
        W_DATA[181], W_DATA[180]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[179], 
        W_DATA[178], W_DATA[177], W_DATA[176], W_DATA[175], 
        W_DATA[174], W_DATA[173], W_DATA[172], W_DATA[171], 
        W_DATA[170], W_DATA[169], W_DATA[168], W_DATA[167], 
        W_DATA[166], W_DATA[165], W_DATA[164], W_DATA[163], 
        W_DATA[162], W_DATA[161], W_DATA[160]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%0%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C0 (.A_DOUT({R_DATA[39], R_DATA[38], 
        R_DATA[37], R_DATA[36], R_DATA[35], R_DATA[34], R_DATA[33], 
        R_DATA[32], R_DATA[31], R_DATA[30], R_DATA[29], R_DATA[28], 
        R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], R_DATA[23], 
        R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({R_DATA[19], 
        R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], R_DATA[14], 
        R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], R_DATA[9], 
        R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], 
        R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), .DB_DETECT(
        \DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[39], W_DATA[38], 
        W_DATA[37], W_DATA[36], W_DATA[35], W_DATA[34], W_DATA[33], 
        W_DATA[32], W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], 
        W_DATA[27], W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], 
        W_DATA[22], W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({
        VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({W_DATA[19], W_DATA[18], W_DATA[17], W_DATA[16], 
        W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], W_DATA[11], 
        W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], W_DATA[6], 
        W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], W_DATA[1], 
        W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%6%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C6 (.A_DOUT({nc0, nc1, nc2, nc3, nc4, 
        nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, nc14, nc15, 
        nc16, nc17, nc18, nc19}), .B_DOUT({nc20, nc21, nc22, nc23, 
        R_DATA[255], R_DATA[254], R_DATA[253], R_DATA[252], 
        R_DATA[251], R_DATA[250], R_DATA[249], R_DATA[248], 
        R_DATA[247], R_DATA[246], R_DATA[245], R_DATA[244], 
        R_DATA[243], R_DATA[242], R_DATA[241], R_DATA[240]}), 
        .DB_DETECT(\DB_DETECT[0][6] ), .SB_CORRECT(\SB_CORRECT[0][6] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, 
        W_DATA[255], W_DATA[254], W_DATA[253], W_DATA[252], 
        W_DATA[251], W_DATA[250], W_DATA[249], W_DATA[248], 
        W_DATA[247], W_DATA[246], W_DATA[245], W_DATA[244], 
        W_DATA[243], W_DATA[242], W_DATA[241], W_DATA[240]}), .B_REN(
        VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%1%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C1 (.A_DOUT({R_DATA[79], R_DATA[78], 
        R_DATA[77], R_DATA[76], R_DATA[75], R_DATA[74], R_DATA[73], 
        R_DATA[72], R_DATA[71], R_DATA[70], R_DATA[69], R_DATA[68], 
        R_DATA[67], R_DATA[66], R_DATA[65], R_DATA[64], R_DATA[63], 
        R_DATA[62], R_DATA[61], R_DATA[60]}), .B_DOUT({R_DATA[59], 
        R_DATA[58], R_DATA[57], R_DATA[56], R_DATA[55], R_DATA[54], 
        R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], R_DATA[49], 
        R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], R_DATA[44], 
        R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40]}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[79], W_DATA[78], 
        W_DATA[77], W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], 
        W_DATA[72], W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], 
        W_DATA[67], W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], 
        W_DATA[62], W_DATA[61], W_DATA[60]}), .A_REN(R_EN), .A_WEN({
        VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({W_DATA[59], W_DATA[58], W_DATA[57], W_DATA[56], 
        W_DATA[55], W_DATA[54], W_DATA[53], W_DATA[52], W_DATA[51], 
        W_DATA[50], W_DATA[49], W_DATA[48], W_DATA[47], W_DATA[46], 
        W_DATA[45], W_DATA[44], W_DATA[43], W_DATA[42], W_DATA[41], 
        W_DATA[40]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%5%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C5 (.A_DOUT({R_DATA[239], 
        R_DATA[238], R_DATA[237], R_DATA[236], R_DATA[235], 
        R_DATA[234], R_DATA[233], R_DATA[232], R_DATA[231], 
        R_DATA[230], R_DATA[229], R_DATA[228], R_DATA[227], 
        R_DATA[226], R_DATA[225], R_DATA[224], R_DATA[223], 
        R_DATA[222], R_DATA[221], R_DATA[220]}), .B_DOUT({R_DATA[219], 
        R_DATA[218], R_DATA[217], R_DATA[216], R_DATA[215], 
        R_DATA[214], R_DATA[213], R_DATA[212], R_DATA[211], 
        R_DATA[210], R_DATA[209], R_DATA[208], R_DATA[207], 
        R_DATA[206], R_DATA[205], R_DATA[204], R_DATA[203], 
        R_DATA[202], R_DATA[201], R_DATA[200]}), .DB_DETECT(
        \DB_DETECT[0][5] ), .SB_CORRECT(\SB_CORRECT[0][5] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[239], W_DATA[238], 
        W_DATA[237], W_DATA[236], W_DATA[235], W_DATA[234], 
        W_DATA[233], W_DATA[232], W_DATA[231], W_DATA[230], 
        W_DATA[229], W_DATA[228], W_DATA[227], W_DATA[226], 
        W_DATA[225], W_DATA[224], W_DATA[223], W_DATA[222], 
        W_DATA[221], W_DATA[220]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[219], 
        W_DATA[218], W_DATA[217], W_DATA[216], W_DATA[215], 
        W_DATA[214], W_DATA[213], W_DATA[212], W_DATA[211], 
        W_DATA[210], W_DATA[209], W_DATA[208], W_DATA[207], 
        W_DATA[206], W_DATA[205], W_DATA[204], W_DATA[203], 
        W_DATA[202], W_DATA[201], W_DATA[200]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%128-128%256-256%SPEED%0%2%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C2 (.A_DOUT({R_DATA[119], 
        R_DATA[118], R_DATA[117], R_DATA[116], R_DATA[115], 
        R_DATA[114], R_DATA[113], R_DATA[112], R_DATA[111], 
        R_DATA[110], R_DATA[109], R_DATA[108], R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100]}), .B_DOUT({R_DATA[99], 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90], R_DATA[89], 
        R_DATA[88], R_DATA[87], R_DATA[86], R_DATA[85], R_DATA[84], 
        R_DATA[83], R_DATA[82], R_DATA[81], R_DATA[80]}), .DB_DETECT(
        \DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, 
        R_ADDR[6], R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({
        VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[119], W_DATA[118], 
        W_DATA[117], W_DATA[116], W_DATA[115], W_DATA[114], 
        W_DATA[113], W_DATA[112], W_DATA[111], W_DATA[110], 
        W_DATA[109], W_DATA[108], W_DATA[107], W_DATA[106], 
        W_DATA[105], W_DATA[104], W_DATA[103], W_DATA[102], 
        W_DATA[101], W_DATA[100]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, W_ADDR[6], W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[99], 
        W_DATA[98], W_DATA[97], W_DATA[96], W_DATA[95], W_DATA[94], 
        W_DATA[93], W_DATA[92], W_DATA[91], W_DATA[90], W_DATA[89], 
        W_DATA[88], W_DATA[87], W_DATA[86], W_DATA[85], W_DATA[84], 
        W_DATA[83], W_DATA[82], W_DATA[81], W_DATA[80]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

    
end
else if (RWIDTH == 576) begin
     wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        \ACCESS_BUSY[0][4] , \SB_CORRECT[0][4] , \DB_DETECT[0][4] , 
        \ACCESS_BUSY[0][5] , \SB_CORRECT[0][5] , \DB_DETECT[0][5] , 
        \ACCESS_BUSY[0][6] , \SB_CORRECT[0][6] , \DB_DETECT[0][6] , 
        \ACCESS_BUSY[0][7] , \SB_CORRECT[0][7] , \DB_DETECT[0][7] , 
        \ACCESS_BUSY[0][8] , \SB_CORRECT[0][8] , \DB_DETECT[0][8] , 
        \ACCESS_BUSY[0][9] , \SB_CORRECT[0][9] , \DB_DETECT[0][9] , 
        \ACCESS_BUSY[0][10] , \SB_CORRECT[0][10] , \DB_DETECT[0][10] , 
        \ACCESS_BUSY[0][11] , \SB_CORRECT[0][11] , \DB_DETECT[0][11] , 
        \ACCESS_BUSY[0][12] , \SB_CORRECT[0][12] , \DB_DETECT[0][12] , 
        \ACCESS_BUSY[0][13] , \SB_CORRECT[0][13] , \DB_DETECT[0][13] , 
        \ACCESS_BUSY[0][14] , \SB_CORRECT[0][14] , \DB_DETECT[0][14] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%9%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C9 (.A_DOUT({R_DATA[399], 
        R_DATA[398], R_DATA[397], R_DATA[396], R_DATA[395], 
        R_DATA[394], R_DATA[393], R_DATA[392], R_DATA[391], 
        R_DATA[390], R_DATA[389], R_DATA[388], R_DATA[387], 
        R_DATA[386], R_DATA[385], R_DATA[384], R_DATA[383], 
        R_DATA[382], R_DATA[381], R_DATA[380]}), .B_DOUT({R_DATA[379], 
        R_DATA[378], R_DATA[377], R_DATA[376], R_DATA[375], 
        R_DATA[374], R_DATA[373], R_DATA[372], R_DATA[371], 
        R_DATA[370], R_DATA[369], R_DATA[368], R_DATA[367], 
        R_DATA[366], R_DATA[365], R_DATA[364], R_DATA[363], 
        R_DATA[362], R_DATA[361], R_DATA[360]}), .DB_DETECT(
        \DB_DETECT[0][9] ), .SB_CORRECT(\SB_CORRECT[0][9] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][9] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[399], W_DATA[398], W_DATA[397], 
        W_DATA[396], W_DATA[395], W_DATA[394], W_DATA[393], 
        W_DATA[392], W_DATA[391], W_DATA[390], W_DATA[389], 
        W_DATA[388], W_DATA[387], W_DATA[386], W_DATA[385], 
        W_DATA[384], W_DATA[383], W_DATA[382], W_DATA[381], 
        W_DATA[380]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[379], 
        W_DATA[378], W_DATA[377], W_DATA[376], W_DATA[375], 
        W_DATA[374], W_DATA[373], W_DATA[372], W_DATA[371], 
        W_DATA[370], W_DATA[369], W_DATA[368], W_DATA[367], 
        W_DATA[366], W_DATA[365], W_DATA[364], W_DATA[363], 
        W_DATA[362], W_DATA[361], W_DATA[360]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%3%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C3 (.A_DOUT({R_DATA[159], 
        R_DATA[158], R_DATA[157], R_DATA[156], R_DATA[155], 
        R_DATA[154], R_DATA[153], R_DATA[152], R_DATA[151], 
        R_DATA[150], R_DATA[149], R_DATA[148], R_DATA[147], 
        R_DATA[146], R_DATA[145], R_DATA[144], R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140]}), .B_DOUT({R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126], R_DATA[125], R_DATA[124], R_DATA[123], 
        R_DATA[122], R_DATA[121], R_DATA[120]}), .DB_DETECT(
        \DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[159], W_DATA[158], W_DATA[157], 
        W_DATA[156], W_DATA[155], W_DATA[154], W_DATA[153], 
        W_DATA[152], W_DATA[151], W_DATA[150], W_DATA[149], 
        W_DATA[148], W_DATA[147], W_DATA[146], W_DATA[145], 
        W_DATA[144], W_DATA[143], W_DATA[142], W_DATA[141], 
        W_DATA[140]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[139], 
        W_DATA[138], W_DATA[137], W_DATA[136], W_DATA[135], 
        W_DATA[134], W_DATA[133], W_DATA[132], W_DATA[131], 
        W_DATA[130], W_DATA[129], W_DATA[128], W_DATA[127], 
        W_DATA[126], W_DATA[125], W_DATA[124], W_DATA[123], 
        W_DATA[122], W_DATA[121], W_DATA[120]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%11%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C11 (.A_DOUT({R_DATA[479], 
        R_DATA[478], R_DATA[477], R_DATA[476], R_DATA[475], 
        R_DATA[474], R_DATA[473], R_DATA[472], R_DATA[471], 
        R_DATA[470], R_DATA[469], R_DATA[468], R_DATA[467], 
        R_DATA[466], R_DATA[465], R_DATA[464], R_DATA[463], 
        R_DATA[462], R_DATA[461], R_DATA[460]}), .B_DOUT({R_DATA[459], 
        R_DATA[458], R_DATA[457], R_DATA[456], R_DATA[455], 
        R_DATA[454], R_DATA[453], R_DATA[452], R_DATA[451], 
        R_DATA[450], R_DATA[449], R_DATA[448], R_DATA[447], 
        R_DATA[446], R_DATA[445], R_DATA[444], R_DATA[443], 
        R_DATA[442], R_DATA[441], R_DATA[440]}), .DB_DETECT(
        \DB_DETECT[0][11] ), .SB_CORRECT(\SB_CORRECT[0][11] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][11] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[479], W_DATA[478], W_DATA[477], 
        W_DATA[476], W_DATA[475], W_DATA[474], W_DATA[473], 
        W_DATA[472], W_DATA[471], W_DATA[470], W_DATA[469], 
        W_DATA[468], W_DATA[467], W_DATA[466], W_DATA[465], 
        W_DATA[464], W_DATA[463], W_DATA[462], W_DATA[461], 
        W_DATA[460]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[459], 
        W_DATA[458], W_DATA[457], W_DATA[456], W_DATA[455], 
        W_DATA[454], W_DATA[453], W_DATA[452], W_DATA[451], 
        W_DATA[450], W_DATA[449], W_DATA[448], W_DATA[447], 
        W_DATA[446], W_DATA[445], W_DATA[444], W_DATA[443], 
        W_DATA[442], W_DATA[441], W_DATA[440]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({R_DATA[39], 
        R_DATA[38], R_DATA[37], R_DATA[36], R_DATA[35], R_DATA[34], 
        R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], R_DATA[29], 
        R_DATA[28], R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], 
        R_DATA[23], R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[39], W_DATA[38], W_DATA[37], 
        W_DATA[36], W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%13%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C13 (.A_DOUT({R_DATA[559], 
        R_DATA[558], R_DATA[557], R_DATA[556], R_DATA[555], 
        R_DATA[554], R_DATA[553], R_DATA[552], R_DATA[551], 
        R_DATA[550], R_DATA[549], R_DATA[548], R_DATA[547], 
        R_DATA[546], R_DATA[545], R_DATA[544], R_DATA[543], 
        R_DATA[542], R_DATA[541], R_DATA[540]}), .B_DOUT({R_DATA[539], 
        R_DATA[538], R_DATA[537], R_DATA[536], R_DATA[535], 
        R_DATA[534], R_DATA[533], R_DATA[532], R_DATA[531], 
        R_DATA[530], R_DATA[529], R_DATA[528], R_DATA[527], 
        R_DATA[526], R_DATA[525], R_DATA[524], R_DATA[523], 
        R_DATA[522], R_DATA[521], R_DATA[520]}), .DB_DETECT(
        \DB_DETECT[0][13] ), .SB_CORRECT(\SB_CORRECT[0][13] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][13] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[559], W_DATA[558], W_DATA[557], 
        W_DATA[556], W_DATA[555], W_DATA[554], W_DATA[553], 
        W_DATA[552], W_DATA[551], W_DATA[550], W_DATA[549], 
        W_DATA[548], W_DATA[547], W_DATA[546], W_DATA[545], 
        W_DATA[544], W_DATA[543], W_DATA[542], W_DATA[541], 
        W_DATA[540]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[539], 
        W_DATA[538], W_DATA[537], W_DATA[536], W_DATA[535], 
        W_DATA[534], W_DATA[533], W_DATA[532], W_DATA[531], 
        W_DATA[530], W_DATA[529], W_DATA[528], W_DATA[527], 
        W_DATA[526], W_DATA[525], W_DATA[524], W_DATA[523], 
        W_DATA[522], W_DATA[521], W_DATA[520]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%10%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C10 (.A_DOUT({R_DATA[439], 
        R_DATA[438], R_DATA[437], R_DATA[436], R_DATA[435], 
        R_DATA[434], R_DATA[433], R_DATA[432], R_DATA[431], 
        R_DATA[430], R_DATA[429], R_DATA[428], R_DATA[427], 
        R_DATA[426], R_DATA[425], R_DATA[424], R_DATA[423], 
        R_DATA[422], R_DATA[421], R_DATA[420]}), .B_DOUT({R_DATA[419], 
        R_DATA[418], R_DATA[417], R_DATA[416], R_DATA[415], 
        R_DATA[414], R_DATA[413], R_DATA[412], R_DATA[411], 
        R_DATA[410], R_DATA[409], R_DATA[408], R_DATA[407], 
        R_DATA[406], R_DATA[405], R_DATA[404], R_DATA[403], 
        R_DATA[402], R_DATA[401], R_DATA[400]}), .DB_DETECT(
        \DB_DETECT[0][10] ), .SB_CORRECT(\SB_CORRECT[0][10] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[439], W_DATA[438], W_DATA[437], 
        W_DATA[436], W_DATA[435], W_DATA[434], W_DATA[433], 
        W_DATA[432], W_DATA[431], W_DATA[430], W_DATA[429], 
        W_DATA[428], W_DATA[427], W_DATA[426], W_DATA[425], 
        W_DATA[424], W_DATA[423], W_DATA[422], W_DATA[421], 
        W_DATA[420]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[419], 
        W_DATA[418], W_DATA[417], W_DATA[416], W_DATA[415], 
        W_DATA[414], W_DATA[413], W_DATA[412], W_DATA[411], 
        W_DATA[410], W_DATA[409], W_DATA[408], W_DATA[407], 
        W_DATA[406], W_DATA[405], W_DATA[404], W_DATA[403], 
        W_DATA[402], W_DATA[401], W_DATA[400]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%4%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C4 (.A_DOUT({R_DATA[199], 
        R_DATA[198], R_DATA[197], R_DATA[196], R_DATA[195], 
        R_DATA[194], R_DATA[193], R_DATA[192], R_DATA[191], 
        R_DATA[190], R_DATA[189], R_DATA[188], R_DATA[187], 
        R_DATA[186], R_DATA[185], R_DATA[184], R_DATA[183], 
        R_DATA[182], R_DATA[181], R_DATA[180]}), .B_DOUT({R_DATA[179], 
        R_DATA[178], R_DATA[177], R_DATA[176], R_DATA[175], 
        R_DATA[174], R_DATA[173], R_DATA[172], R_DATA[171], 
        R_DATA[170], R_DATA[169], R_DATA[168], R_DATA[167], 
        R_DATA[166], R_DATA[165], R_DATA[164], R_DATA[163], 
        R_DATA[162], R_DATA[161], R_DATA[160]}), .DB_DETECT(
        \DB_DETECT[0][4] ), .SB_CORRECT(\SB_CORRECT[0][4] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[199], W_DATA[198], W_DATA[197], 
        W_DATA[196], W_DATA[195], W_DATA[194], W_DATA[193], 
        W_DATA[192], W_DATA[191], W_DATA[190], W_DATA[189], 
        W_DATA[188], W_DATA[187], W_DATA[186], W_DATA[185], 
        W_DATA[184], W_DATA[183], W_DATA[182], W_DATA[181], 
        W_DATA[180]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[179], 
        W_DATA[178], W_DATA[177], W_DATA[176], W_DATA[175], 
        W_DATA[174], W_DATA[173], W_DATA[172], W_DATA[171], 
        W_DATA[170], W_DATA[169], W_DATA[168], W_DATA[167], 
        W_DATA[166], W_DATA[165], W_DATA[164], W_DATA[163], 
        W_DATA[162], W_DATA[161], W_DATA[160]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%8%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C8 (.A_DOUT({R_DATA[359], 
        R_DATA[358], R_DATA[357], R_DATA[356], R_DATA[355], 
        R_DATA[354], R_DATA[353], R_DATA[352], R_DATA[351], 
        R_DATA[350], R_DATA[349], R_DATA[348], R_DATA[347], 
        R_DATA[346], R_DATA[345], R_DATA[344], R_DATA[343], 
        R_DATA[342], R_DATA[341], R_DATA[340]}), .B_DOUT({R_DATA[339], 
        R_DATA[338], R_DATA[337], R_DATA[336], R_DATA[335], 
        R_DATA[334], R_DATA[333], R_DATA[332], R_DATA[331], 
        R_DATA[330], R_DATA[329], R_DATA[328], R_DATA[327], 
        R_DATA[326], R_DATA[325], R_DATA[324], R_DATA[323], 
        R_DATA[322], R_DATA[321], R_DATA[320]}), .DB_DETECT(
        \DB_DETECT[0][8] ), .SB_CORRECT(\SB_CORRECT[0][8] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[359], W_DATA[358], W_DATA[357], 
        W_DATA[356], W_DATA[355], W_DATA[354], W_DATA[353], 
        W_DATA[352], W_DATA[351], W_DATA[350], W_DATA[349], 
        W_DATA[348], W_DATA[347], W_DATA[346], W_DATA[345], 
        W_DATA[344], W_DATA[343], W_DATA[342], W_DATA[341], 
        W_DATA[340]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[339], 
        W_DATA[338], W_DATA[337], W_DATA[336], W_DATA[335], 
        W_DATA[334], W_DATA[333], W_DATA[332], W_DATA[331], 
        W_DATA[330], W_DATA[329], W_DATA[328], W_DATA[327], 
        W_DATA[326], W_DATA[325], W_DATA[324], W_DATA[323], 
        W_DATA[322], W_DATA[321], W_DATA[320]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%6%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C6 (.A_DOUT({R_DATA[279], 
        R_DATA[278], R_DATA[277], R_DATA[276], R_DATA[275], 
        R_DATA[274], R_DATA[273], R_DATA[272], R_DATA[271], 
        R_DATA[270], R_DATA[269], R_DATA[268], R_DATA[267], 
        R_DATA[266], R_DATA[265], R_DATA[264], R_DATA[263], 
        R_DATA[262], R_DATA[261], R_DATA[260]}), .B_DOUT({R_DATA[259], 
        R_DATA[258], R_DATA[257], R_DATA[256], R_DATA[255], 
        R_DATA[254], R_DATA[253], R_DATA[252], R_DATA[251], 
        R_DATA[250], R_DATA[249], R_DATA[248], R_DATA[247], 
        R_DATA[246], R_DATA[245], R_DATA[244], R_DATA[243], 
        R_DATA[242], R_DATA[241], R_DATA[240]}), .DB_DETECT(
        \DB_DETECT[0][6] ), .SB_CORRECT(\SB_CORRECT[0][6] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[279], W_DATA[278], W_DATA[277], 
        W_DATA[276], W_DATA[275], W_DATA[274], W_DATA[273], 
        W_DATA[272], W_DATA[271], W_DATA[270], W_DATA[269], 
        W_DATA[268], W_DATA[267], W_DATA[266], W_DATA[265], 
        W_DATA[264], W_DATA[263], W_DATA[262], W_DATA[261], 
        W_DATA[260]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[259], 
        W_DATA[258], W_DATA[257], W_DATA[256], W_DATA[255], 
        W_DATA[254], W_DATA[253], W_DATA[252], W_DATA[251], 
        W_DATA[250], W_DATA[249], W_DATA[248], W_DATA[247], 
        W_DATA[246], W_DATA[245], W_DATA[244], W_DATA[243], 
        W_DATA[242], W_DATA[241], W_DATA[240]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({R_DATA[79], 
        R_DATA[78], R_DATA[77], R_DATA[76], R_DATA[75], R_DATA[74], 
        R_DATA[73], R_DATA[72], R_DATA[71], R_DATA[70], R_DATA[69], 
        R_DATA[68], R_DATA[67], R_DATA[66], R_DATA[65], R_DATA[64], 
        R_DATA[63], R_DATA[62], R_DATA[61], R_DATA[60]}), .B_DOUT({
        R_DATA[59], R_DATA[58], R_DATA[57], R_DATA[56], R_DATA[55], 
        R_DATA[54], R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], 
        R_DATA[49], R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], 
        R_DATA[44], R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40]}), 
        .DB_DETECT(\DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[79], W_DATA[78], W_DATA[77], 
        W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72], 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], W_DATA[62], 
        W_DATA[61], W_DATA[60]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[59], 
        W_DATA[58], W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54], 
        W_DATA[53], W_DATA[52], W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%12%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C12 (.A_DOUT({R_DATA[519], 
        R_DATA[518], R_DATA[517], R_DATA[516], R_DATA[515], 
        R_DATA[514], R_DATA[513], R_DATA[512], R_DATA[511], 
        R_DATA[510], R_DATA[509], R_DATA[508], R_DATA[507], 
        R_DATA[506], R_DATA[505], R_DATA[504], R_DATA[503], 
        R_DATA[502], R_DATA[501], R_DATA[500]}), .B_DOUT({R_DATA[499], 
        R_DATA[498], R_DATA[497], R_DATA[496], R_DATA[495], 
        R_DATA[494], R_DATA[493], R_DATA[492], R_DATA[491], 
        R_DATA[490], R_DATA[489], R_DATA[488], R_DATA[487], 
        R_DATA[486], R_DATA[485], R_DATA[484], R_DATA[483], 
        R_DATA[482], R_DATA[481], R_DATA[480]}), .DB_DETECT(
        \DB_DETECT[0][12] ), .SB_CORRECT(\SB_CORRECT[0][12] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][12] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[519], W_DATA[518], W_DATA[517], 
        W_DATA[516], W_DATA[515], W_DATA[514], W_DATA[513], 
        W_DATA[512], W_DATA[511], W_DATA[510], W_DATA[509], 
        W_DATA[508], W_DATA[507], W_DATA[506], W_DATA[505], 
        W_DATA[504], W_DATA[503], W_DATA[502], W_DATA[501], 
        W_DATA[500]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[499], 
        W_DATA[498], W_DATA[497], W_DATA[496], W_DATA[495], 
        W_DATA[494], W_DATA[493], W_DATA[492], W_DATA[491], 
        W_DATA[490], W_DATA[489], W_DATA[488], W_DATA[487], 
        W_DATA[486], W_DATA[485], W_DATA[484], W_DATA[483], 
        W_DATA[482], W_DATA[481], W_DATA[480]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%14%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C14 (.A_DOUT({nc0, nc1, nc2, nc3, 
        nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, nc14, 
        nc15, nc16, nc17, nc18, nc19}), .B_DOUT({nc20, nc21, nc22, 
        nc23, R_DATA[575], R_DATA[574], R_DATA[573], R_DATA[572], 
        R_DATA[571], R_DATA[570], R_DATA[569], R_DATA[568], 
        R_DATA[567], R_DATA[566], R_DATA[565], R_DATA[564], 
        R_DATA[563], R_DATA[562], R_DATA[561], R_DATA[560]}), 
        .DB_DETECT(\DB_DETECT[0][14] ), .SB_CORRECT(
        \SB_CORRECT[0][14] ), .ACCESS_BUSY(\ACCESS_BUSY[0][14] ), 
        .A_ADDR({GND, GND, GND, R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, 
        GND, GND, W_DATA[575], W_DATA[574], W_DATA[573], W_DATA[572], 
        W_DATA[571], W_DATA[570], W_DATA[569], W_DATA[568], 
        W_DATA[567], W_DATA[566], W_DATA[565], W_DATA[564], 
        W_DATA[563], W_DATA[562], W_DATA[561], W_DATA[560]}), .B_REN(
        VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%7%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C7 (.A_DOUT({R_DATA[319], 
        R_DATA[318], R_DATA[317], R_DATA[316], R_DATA[315], 
        R_DATA[314], R_DATA[313], R_DATA[312], R_DATA[311], 
        R_DATA[310], R_DATA[309], R_DATA[308], R_DATA[307], 
        R_DATA[306], R_DATA[305], R_DATA[304], R_DATA[303], 
        R_DATA[302], R_DATA[301], R_DATA[300]}), .B_DOUT({R_DATA[299], 
        R_DATA[298], R_DATA[297], R_DATA[296], R_DATA[295], 
        R_DATA[294], R_DATA[293], R_DATA[292], R_DATA[291], 
        R_DATA[290], R_DATA[289], R_DATA[288], R_DATA[287], 
        R_DATA[286], R_DATA[285], R_DATA[284], R_DATA[283], 
        R_DATA[282], R_DATA[281], R_DATA[280]}), .DB_DETECT(
        \DB_DETECT[0][7] ), .SB_CORRECT(\SB_CORRECT[0][7] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[319], W_DATA[318], W_DATA[317], 
        W_DATA[316], W_DATA[315], W_DATA[314], W_DATA[313], 
        W_DATA[312], W_DATA[311], W_DATA[310], W_DATA[309], 
        W_DATA[308], W_DATA[307], W_DATA[306], W_DATA[305], 
        W_DATA[304], W_DATA[303], W_DATA[302], W_DATA[301], 
        W_DATA[300]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[299], 
        W_DATA[298], W_DATA[297], W_DATA[296], W_DATA[295], 
        W_DATA[294], W_DATA[293], W_DATA[292], W_DATA[291], 
        W_DATA[290], W_DATA[289], W_DATA[288], W_DATA[287], 
        W_DATA[286], W_DATA[285], W_DATA[284], W_DATA[283], 
        W_DATA[282], W_DATA[281], W_DATA[280]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%2%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C2 (.A_DOUT({R_DATA[119], 
        R_DATA[118], R_DATA[117], R_DATA[116], R_DATA[115], 
        R_DATA[114], R_DATA[113], R_DATA[112], R_DATA[111], 
        R_DATA[110], R_DATA[109], R_DATA[108], R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100]}), .B_DOUT({R_DATA[99], 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90], R_DATA[89], 
        R_DATA[88], R_DATA[87], R_DATA[86], R_DATA[85], R_DATA[84], 
        R_DATA[83], R_DATA[82], R_DATA[81], R_DATA[80]}), .DB_DETECT(
        \DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[119], W_DATA[118], W_DATA[117], 
        W_DATA[116], W_DATA[115], W_DATA[114], W_DATA[113], 
        W_DATA[112], W_DATA[111], W_DATA[110], W_DATA[109], 
        W_DATA[108], W_DATA[107], W_DATA[106], W_DATA[105], 
        W_DATA[104], W_DATA[103], W_DATA[102], W_DATA[101], 
        W_DATA[100]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[99], W_DATA[98], 
        W_DATA[97], W_DATA[96], W_DATA[95], W_DATA[94], W_DATA[93], 
        W_DATA[92], W_DATA[91], W_DATA[90], W_DATA[89], W_DATA[88], 
        W_DATA[87], W_DATA[86], W_DATA[85], W_DATA[84], W_DATA[83], 
        W_DATA[82], W_DATA[81], W_DATA[80]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%576-576%SPEED%5%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C5 (.A_DOUT({R_DATA[239], 
        R_DATA[238], R_DATA[237], R_DATA[236], R_DATA[235], 
        R_DATA[234], R_DATA[233], R_DATA[232], R_DATA[231], 
        R_DATA[230], R_DATA[229], R_DATA[228], R_DATA[227], 
        R_DATA[226], R_DATA[225], R_DATA[224], R_DATA[223], 
        R_DATA[222], R_DATA[221], R_DATA[220]}), .B_DOUT({R_DATA[219], 
        R_DATA[218], R_DATA[217], R_DATA[216], R_DATA[215], 
        R_DATA[214], R_DATA[213], R_DATA[212], R_DATA[211], 
        R_DATA[210], R_DATA[209], R_DATA[208], R_DATA[207], 
        R_DATA[206], R_DATA[205], R_DATA[204], R_DATA[203], 
        R_DATA[202], R_DATA[201], R_DATA[200]}), .DB_DETECT(
        \DB_DETECT[0][5] ), .SB_CORRECT(\SB_CORRECT[0][5] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[239], W_DATA[238], W_DATA[237], 
        W_DATA[236], W_DATA[235], W_DATA[234], W_DATA[233], 
        W_DATA[232], W_DATA[231], W_DATA[230], W_DATA[229], 
        W_DATA[228], W_DATA[227], W_DATA[226], W_DATA[225], 
        W_DATA[224], W_DATA[223], W_DATA[222], W_DATA[221], 
        W_DATA[220]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[219], 
        W_DATA[218], W_DATA[217], W_DATA[216], W_DATA[215], 
        W_DATA[214], W_DATA[213], W_DATA[212], W_DATA[211], 
        W_DATA[210], W_DATA[209], W_DATA[208], W_DATA[207], 
        W_DATA[206], W_DATA[205], W_DATA[204], W_DATA[203], 
        W_DATA[202], W_DATA[201], W_DATA[200]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if (RWIDTH == 512) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        \ACCESS_BUSY[0][4] , \SB_CORRECT[0][4] , \DB_DETECT[0][4] , 
        \ACCESS_BUSY[0][5] , \SB_CORRECT[0][5] , \DB_DETECT[0][5] , 
        \ACCESS_BUSY[0][6] , \SB_CORRECT[0][6] , \DB_DETECT[0][6] , 
        \ACCESS_BUSY[0][7] , \SB_CORRECT[0][7] , \DB_DETECT[0][7] , 
        \ACCESS_BUSY[0][8] , \SB_CORRECT[0][8] , \DB_DETECT[0][8] , 
        \ACCESS_BUSY[0][9] , \SB_CORRECT[0][9] , \DB_DETECT[0][9] , 
        \ACCESS_BUSY[0][10] , \SB_CORRECT[0][10] , \DB_DETECT[0][10] , 
        \ACCESS_BUSY[0][11] , \SB_CORRECT[0][11] , \DB_DETECT[0][11] , 
        \ACCESS_BUSY[0][12] , \SB_CORRECT[0][12] , \DB_DETECT[0][12] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%4%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C4 (.A_DOUT({R_DATA[199], 
        R_DATA[198], R_DATA[197], R_DATA[196], R_DATA[195], 
        R_DATA[194], R_DATA[193], R_DATA[192], R_DATA[191], 
        R_DATA[190], R_DATA[189], R_DATA[188], R_DATA[187], 
        R_DATA[186], R_DATA[185], R_DATA[184], R_DATA[183], 
        R_DATA[182], R_DATA[181], R_DATA[180]}), .B_DOUT({R_DATA[179], 
        R_DATA[178], R_DATA[177], R_DATA[176], R_DATA[175], 
        R_DATA[174], R_DATA[173], R_DATA[172], R_DATA[171], 
        R_DATA[170], R_DATA[169], R_DATA[168], R_DATA[167], 
        R_DATA[166], R_DATA[165], R_DATA[164], R_DATA[163], 
        R_DATA[162], R_DATA[161], R_DATA[160]}), .DB_DETECT(
        \DB_DETECT[0][4] ), .SB_CORRECT(\SB_CORRECT[0][4] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[199], W_DATA[198], W_DATA[197], 
        W_DATA[196], W_DATA[195], W_DATA[194], W_DATA[193], 
        W_DATA[192], W_DATA[191], W_DATA[190], W_DATA[189], 
        W_DATA[188], W_DATA[187], W_DATA[186], W_DATA[185], 
        W_DATA[184], W_DATA[183], W_DATA[182], W_DATA[181], 
        W_DATA[180]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[179], 
        W_DATA[178], W_DATA[177], W_DATA[176], W_DATA[175], 
        W_DATA[174], W_DATA[173], W_DATA[172], W_DATA[171], 
        W_DATA[170], W_DATA[169], W_DATA[168], W_DATA[167], 
        W_DATA[166], W_DATA[165], W_DATA[164], W_DATA[163], 
        W_DATA[162], W_DATA[161], W_DATA[160]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%3%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C3 (.A_DOUT({R_DATA[159], 
        R_DATA[158], R_DATA[157], R_DATA[156], R_DATA[155], 
        R_DATA[154], R_DATA[153], R_DATA[152], R_DATA[151], 
        R_DATA[150], R_DATA[149], R_DATA[148], R_DATA[147], 
        R_DATA[146], R_DATA[145], R_DATA[144], R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140]}), .B_DOUT({R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126], R_DATA[125], R_DATA[124], R_DATA[123], 
        R_DATA[122], R_DATA[121], R_DATA[120]}), .DB_DETECT(
        \DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[159], W_DATA[158], W_DATA[157], 
        W_DATA[156], W_DATA[155], W_DATA[154], W_DATA[153], 
        W_DATA[152], W_DATA[151], W_DATA[150], W_DATA[149], 
        W_DATA[148], W_DATA[147], W_DATA[146], W_DATA[145], 
        W_DATA[144], W_DATA[143], W_DATA[142], W_DATA[141], 
        W_DATA[140]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[139], 
        W_DATA[138], W_DATA[137], W_DATA[136], W_DATA[135], 
        W_DATA[134], W_DATA[133], W_DATA[132], W_DATA[131], 
        W_DATA[130], W_DATA[129], W_DATA[128], W_DATA[127], 
        W_DATA[126], W_DATA[125], W_DATA[124], W_DATA[123], 
        W_DATA[122], W_DATA[121], W_DATA[120]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%11%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C11 (.A_DOUT({R_DATA[479], 
        R_DATA[478], R_DATA[477], R_DATA[476], R_DATA[475], 
        R_DATA[474], R_DATA[473], R_DATA[472], R_DATA[471], 
        R_DATA[470], R_DATA[469], R_DATA[468], R_DATA[467], 
        R_DATA[466], R_DATA[465], R_DATA[464], R_DATA[463], 
        R_DATA[462], R_DATA[461], R_DATA[460]}), .B_DOUT({R_DATA[459], 
        R_DATA[458], R_DATA[457], R_DATA[456], R_DATA[455], 
        R_DATA[454], R_DATA[453], R_DATA[452], R_DATA[451], 
        R_DATA[450], R_DATA[449], R_DATA[448], R_DATA[447], 
        R_DATA[446], R_DATA[445], R_DATA[444], R_DATA[443], 
        R_DATA[442], R_DATA[441], R_DATA[440]}), .DB_DETECT(
        \DB_DETECT[0][11] ), .SB_CORRECT(\SB_CORRECT[0][11] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][11] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[479], W_DATA[478], W_DATA[477], 
        W_DATA[476], W_DATA[475], W_DATA[474], W_DATA[473], 
        W_DATA[472], W_DATA[471], W_DATA[470], W_DATA[469], 
        W_DATA[468], W_DATA[467], W_DATA[466], W_DATA[465], 
        W_DATA[464], W_DATA[463], W_DATA[462], W_DATA[461], 
        W_DATA[460]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[459], 
        W_DATA[458], W_DATA[457], W_DATA[456], W_DATA[455], 
        W_DATA[454], W_DATA[453], W_DATA[452], W_DATA[451], 
        W_DATA[450], W_DATA[449], W_DATA[448], W_DATA[447], 
        W_DATA[446], W_DATA[445], W_DATA[444], W_DATA[443], 
        W_DATA[442], W_DATA[441], W_DATA[440]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%12%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C12 (.A_DOUT({nc0, nc1, nc2, nc3, 
        nc4, nc5, nc6, nc7, R_DATA[511], R_DATA[510], R_DATA[509], 
        R_DATA[508], R_DATA[507], R_DATA[506], R_DATA[505], 
        R_DATA[504], R_DATA[503], R_DATA[502], R_DATA[501], 
        R_DATA[500]}), .B_DOUT({R_DATA[499], R_DATA[498], R_DATA[497], 
        R_DATA[496], R_DATA[495], R_DATA[494], R_DATA[493], 
        R_DATA[492], R_DATA[491], R_DATA[490], R_DATA[489], 
        R_DATA[488], R_DATA[487], R_DATA[486], R_DATA[485], 
        R_DATA[484], R_DATA[483], R_DATA[482], R_DATA[481], 
        R_DATA[480]}), .DB_DETECT(\DB_DETECT[0][12] ), .SB_CORRECT(
        \SB_CORRECT[0][12] ), .ACCESS_BUSY(\ACCESS_BUSY[0][12] ), 
        .A_ADDR({GND, GND, GND, R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, W_DATA[511], W_DATA[510], W_DATA[509], 
        W_DATA[508], W_DATA[507], W_DATA[506], W_DATA[505], 
        W_DATA[504], W_DATA[503], W_DATA[502], W_DATA[501], 
        W_DATA[500]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[499], 
        W_DATA[498], W_DATA[497], W_DATA[496], W_DATA[495], 
        W_DATA[494], W_DATA[493], W_DATA[492], W_DATA[491], 
        W_DATA[490], W_DATA[489], W_DATA[488], W_DATA[487], 
        W_DATA[486], W_DATA[485], W_DATA[484], W_DATA[483], 
        W_DATA[482], W_DATA[481], W_DATA[480]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%0%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C0 (.A_DOUT({R_DATA[39], R_DATA[38], 
        R_DATA[37], R_DATA[36], R_DATA[35], R_DATA[34], R_DATA[33], 
        R_DATA[32], R_DATA[31], R_DATA[30], R_DATA[29], R_DATA[28], 
        R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], R_DATA[23], 
        R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({R_DATA[19], 
        R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], R_DATA[14], 
        R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], R_DATA[9], 
        R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], 
        R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), .DB_DETECT(
        \DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[39], W_DATA[38], W_DATA[37], 
        W_DATA[36], W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%7%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C7 (.A_DOUT({R_DATA[319], 
        R_DATA[318], R_DATA[317], R_DATA[316], R_DATA[315], 
        R_DATA[314], R_DATA[313], R_DATA[312], R_DATA[311], 
        R_DATA[310], R_DATA[309], R_DATA[308], R_DATA[307], 
        R_DATA[306], R_DATA[305], R_DATA[304], R_DATA[303], 
        R_DATA[302], R_DATA[301], R_DATA[300]}), .B_DOUT({R_DATA[299], 
        R_DATA[298], R_DATA[297], R_DATA[296], R_DATA[295], 
        R_DATA[294], R_DATA[293], R_DATA[292], R_DATA[291], 
        R_DATA[290], R_DATA[289], R_DATA[288], R_DATA[287], 
        R_DATA[286], R_DATA[285], R_DATA[284], R_DATA[283], 
        R_DATA[282], R_DATA[281], R_DATA[280]}), .DB_DETECT(
        \DB_DETECT[0][7] ), .SB_CORRECT(\SB_CORRECT[0][7] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[319], W_DATA[318], W_DATA[317], 
        W_DATA[316], W_DATA[315], W_DATA[314], W_DATA[313], 
        W_DATA[312], W_DATA[311], W_DATA[310], W_DATA[309], 
        W_DATA[308], W_DATA[307], W_DATA[306], W_DATA[305], 
        W_DATA[304], W_DATA[303], W_DATA[302], W_DATA[301], 
        W_DATA[300]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[299], 
        W_DATA[298], W_DATA[297], W_DATA[296], W_DATA[295], 
        W_DATA[294], W_DATA[293], W_DATA[292], W_DATA[291], 
        W_DATA[290], W_DATA[289], W_DATA[288], W_DATA[287], 
        W_DATA[286], W_DATA[285], W_DATA[284], W_DATA[283], 
        W_DATA[282], W_DATA[281], W_DATA[280]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%8%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C8 (.A_DOUT({R_DATA[359], 
        R_DATA[358], R_DATA[357], R_DATA[356], R_DATA[355], 
        R_DATA[354], R_DATA[353], R_DATA[352], R_DATA[351], 
        R_DATA[350], R_DATA[349], R_DATA[348], R_DATA[347], 
        R_DATA[346], R_DATA[345], R_DATA[344], R_DATA[343], 
        R_DATA[342], R_DATA[341], R_DATA[340]}), .B_DOUT({R_DATA[339], 
        R_DATA[338], R_DATA[337], R_DATA[336], R_DATA[335], 
        R_DATA[334], R_DATA[333], R_DATA[332], R_DATA[331], 
        R_DATA[330], R_DATA[329], R_DATA[328], R_DATA[327], 
        R_DATA[326], R_DATA[325], R_DATA[324], R_DATA[323], 
        R_DATA[322], R_DATA[321], R_DATA[320]}), .DB_DETECT(
        \DB_DETECT[0][8] ), .SB_CORRECT(\SB_CORRECT[0][8] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[359], W_DATA[358], W_DATA[357], 
        W_DATA[356], W_DATA[355], W_DATA[354], W_DATA[353], 
        W_DATA[352], W_DATA[351], W_DATA[350], W_DATA[349], 
        W_DATA[348], W_DATA[347], W_DATA[346], W_DATA[345], 
        W_DATA[344], W_DATA[343], W_DATA[342], W_DATA[341], 
        W_DATA[340]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[339], 
        W_DATA[338], W_DATA[337], W_DATA[336], W_DATA[335], 
        W_DATA[334], W_DATA[333], W_DATA[332], W_DATA[331], 
        W_DATA[330], W_DATA[329], W_DATA[328], W_DATA[327], 
        W_DATA[326], W_DATA[325], W_DATA[324], W_DATA[323], 
        W_DATA[322], W_DATA[321], W_DATA[320]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%6%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C6 (.A_DOUT({R_DATA[279], 
        R_DATA[278], R_DATA[277], R_DATA[276], R_DATA[275], 
        R_DATA[274], R_DATA[273], R_DATA[272], R_DATA[271], 
        R_DATA[270], R_DATA[269], R_DATA[268], R_DATA[267], 
        R_DATA[266], R_DATA[265], R_DATA[264], R_DATA[263], 
        R_DATA[262], R_DATA[261], R_DATA[260]}), .B_DOUT({R_DATA[259], 
        R_DATA[258], R_DATA[257], R_DATA[256], R_DATA[255], 
        R_DATA[254], R_DATA[253], R_DATA[252], R_DATA[251], 
        R_DATA[250], R_DATA[249], R_DATA[248], R_DATA[247], 
        R_DATA[246], R_DATA[245], R_DATA[244], R_DATA[243], 
        R_DATA[242], R_DATA[241], R_DATA[240]}), .DB_DETECT(
        \DB_DETECT[0][6] ), .SB_CORRECT(\SB_CORRECT[0][6] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[279], W_DATA[278], W_DATA[277], 
        W_DATA[276], W_DATA[275], W_DATA[274], W_DATA[273], 
        W_DATA[272], W_DATA[271], W_DATA[270], W_DATA[269], 
        W_DATA[268], W_DATA[267], W_DATA[266], W_DATA[265], 
        W_DATA[264], W_DATA[263], W_DATA[262], W_DATA[261], 
        W_DATA[260]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[259], 
        W_DATA[258], W_DATA[257], W_DATA[256], W_DATA[255], 
        W_DATA[254], W_DATA[253], W_DATA[252], W_DATA[251], 
        W_DATA[250], W_DATA[249], W_DATA[248], W_DATA[247], 
        W_DATA[246], W_DATA[245], W_DATA[244], W_DATA[243], 
        W_DATA[242], W_DATA[241], W_DATA[240]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%10%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C10 (.A_DOUT({R_DATA[439], 
        R_DATA[438], R_DATA[437], R_DATA[436], R_DATA[435], 
        R_DATA[434], R_DATA[433], R_DATA[432], R_DATA[431], 
        R_DATA[430], R_DATA[429], R_DATA[428], R_DATA[427], 
        R_DATA[426], R_DATA[425], R_DATA[424], R_DATA[423], 
        R_DATA[422], R_DATA[421], R_DATA[420]}), .B_DOUT({R_DATA[419], 
        R_DATA[418], R_DATA[417], R_DATA[416], R_DATA[415], 
        R_DATA[414], R_DATA[413], R_DATA[412], R_DATA[411], 
        R_DATA[410], R_DATA[409], R_DATA[408], R_DATA[407], 
        R_DATA[406], R_DATA[405], R_DATA[404], R_DATA[403], 
        R_DATA[402], R_DATA[401], R_DATA[400]}), .DB_DETECT(
        \DB_DETECT[0][10] ), .SB_CORRECT(\SB_CORRECT[0][10] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[439], W_DATA[438], W_DATA[437], 
        W_DATA[436], W_DATA[435], W_DATA[434], W_DATA[433], 
        W_DATA[432], W_DATA[431], W_DATA[430], W_DATA[429], 
        W_DATA[428], W_DATA[427], W_DATA[426], W_DATA[425], 
        W_DATA[424], W_DATA[423], W_DATA[422], W_DATA[421], 
        W_DATA[420]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[419], 
        W_DATA[418], W_DATA[417], W_DATA[416], W_DATA[415], 
        W_DATA[414], W_DATA[413], W_DATA[412], W_DATA[411], 
        W_DATA[410], W_DATA[409], W_DATA[408], W_DATA[407], 
        W_DATA[406], W_DATA[405], W_DATA[404], W_DATA[403], 
        W_DATA[402], W_DATA[401], W_DATA[400]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%1%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C1 (.A_DOUT({R_DATA[79], R_DATA[78], 
        R_DATA[77], R_DATA[76], R_DATA[75], R_DATA[74], R_DATA[73], 
        R_DATA[72], R_DATA[71], R_DATA[70], R_DATA[69], R_DATA[68], 
        R_DATA[67], R_DATA[66], R_DATA[65], R_DATA[64], R_DATA[63], 
        R_DATA[62], R_DATA[61], R_DATA[60]}), .B_DOUT({R_DATA[59], 
        R_DATA[58], R_DATA[57], R_DATA[56], R_DATA[55], R_DATA[54], 
        R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], R_DATA[49], 
        R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], R_DATA[44], 
        R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40]}), .DB_DETECT(
        \DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[79], W_DATA[78], W_DATA[77], 
        W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72], 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], W_DATA[62], 
        W_DATA[61], W_DATA[60]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[59], 
        W_DATA[58], W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54], 
        W_DATA[53], W_DATA[52], W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%5%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C5 (.A_DOUT({R_DATA[239], 
        R_DATA[238], R_DATA[237], R_DATA[236], R_DATA[235], 
        R_DATA[234], R_DATA[233], R_DATA[232], R_DATA[231], 
        R_DATA[230], R_DATA[229], R_DATA[228], R_DATA[227], 
        R_DATA[226], R_DATA[225], R_DATA[224], R_DATA[223], 
        R_DATA[222], R_DATA[221], R_DATA[220]}), .B_DOUT({R_DATA[219], 
        R_DATA[218], R_DATA[217], R_DATA[216], R_DATA[215], 
        R_DATA[214], R_DATA[213], R_DATA[212], R_DATA[211], 
        R_DATA[210], R_DATA[209], R_DATA[208], R_DATA[207], 
        R_DATA[206], R_DATA[205], R_DATA[204], R_DATA[203], 
        R_DATA[202], R_DATA[201], R_DATA[200]}), .DB_DETECT(
        \DB_DETECT[0][5] ), .SB_CORRECT(\SB_CORRECT[0][5] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[239], W_DATA[238], W_DATA[237], 
        W_DATA[236], W_DATA[235], W_DATA[234], W_DATA[233], 
        W_DATA[232], W_DATA[231], W_DATA[230], W_DATA[229], 
        W_DATA[228], W_DATA[227], W_DATA[226], W_DATA[225], 
        W_DATA[224], W_DATA[223], W_DATA[222], W_DATA[221], 
        W_DATA[220]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[219], 
        W_DATA[218], W_DATA[217], W_DATA[216], W_DATA[215], 
        W_DATA[214], W_DATA[213], W_DATA[212], W_DATA[211], 
        W_DATA[210], W_DATA[209], W_DATA[208], W_DATA[207], 
        W_DATA[206], W_DATA[205], W_DATA[204], W_DATA[203], 
        W_DATA[202], W_DATA[201], W_DATA[200]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%2%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C2 (.A_DOUT({R_DATA[119], 
        R_DATA[118], R_DATA[117], R_DATA[116], R_DATA[115], 
        R_DATA[114], R_DATA[113], R_DATA[112], R_DATA[111], 
        R_DATA[110], R_DATA[109], R_DATA[108], R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100]}), .B_DOUT({R_DATA[99], 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90], R_DATA[89], 
        R_DATA[88], R_DATA[87], R_DATA[86], R_DATA[85], R_DATA[84], 
        R_DATA[83], R_DATA[82], R_DATA[81], R_DATA[80]}), .DB_DETECT(
        \DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[119], W_DATA[118], W_DATA[117], 
        W_DATA[116], W_DATA[115], W_DATA[114], W_DATA[113], 
        W_DATA[112], W_DATA[111], W_DATA[110], W_DATA[109], 
        W_DATA[108], W_DATA[107], W_DATA[106], W_DATA[105], 
        W_DATA[104], W_DATA[103], W_DATA[102], W_DATA[101], 
        W_DATA[100]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[99], W_DATA[98], 
        W_DATA[97], W_DATA[96], W_DATA[95], W_DATA[94], W_DATA[93], 
        W_DATA[92], W_DATA[91], W_DATA[90], W_DATA[89], W_DATA[88], 
        W_DATA[87], W_DATA[86], W_DATA[85], W_DATA[84], W_DATA[83], 
        W_DATA[82], W_DATA[81], W_DATA[80]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%512-512%SPEED%0%9%TWO-PORT") )  
        fi_te_fi_te_0_LSRAM_top_R0C9 (.A_DOUT({R_DATA[399], 
        R_DATA[398], R_DATA[397], R_DATA[396], R_DATA[395], 
        R_DATA[394], R_DATA[393], R_DATA[392], R_DATA[391], 
        R_DATA[390], R_DATA[389], R_DATA[388], R_DATA[387], 
        R_DATA[386], R_DATA[385], R_DATA[384], R_DATA[383], 
        R_DATA[382], R_DATA[381], R_DATA[380]}), .B_DOUT({R_DATA[379], 
        R_DATA[378], R_DATA[377], R_DATA[376], R_DATA[375], 
        R_DATA[374], R_DATA[373], R_DATA[372], R_DATA[371], 
        R_DATA[370], R_DATA[369], R_DATA[368], R_DATA[367], 
        R_DATA[366], R_DATA[365], R_DATA[364], R_DATA[363], 
        R_DATA[362], R_DATA[361], R_DATA[360]}), .DB_DETECT(
        \DB_DETECT[0][9] ), .SB_CORRECT(\SB_CORRECT[0][9] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][9] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[399], W_DATA[398], W_DATA[397], 
        W_DATA[396], W_DATA[395], W_DATA[394], W_DATA[393], 
        W_DATA[392], W_DATA[391], W_DATA[390], W_DATA[389], 
        W_DATA[388], W_DATA[387], W_DATA[386], W_DATA[385], 
        W_DATA[384], W_DATA[383], W_DATA[382], W_DATA[381], 
        W_DATA[380]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[379], 
        W_DATA[378], W_DATA[377], W_DATA[376], W_DATA[375], 
        W_DATA[374], W_DATA[373], W_DATA[372], W_DATA[371], 
        W_DATA[370], W_DATA[369], W_DATA[368], W_DATA[367], 
        W_DATA[366], W_DATA[365], W_DATA[364], W_DATA[363], 
        W_DATA[362], W_DATA[361], W_DATA[360]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));


end
else if(RWIDTH == 1152) begin

    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        \ACCESS_BUSY[0][4] , \SB_CORRECT[0][4] , \DB_DETECT[0][4] , 
        \ACCESS_BUSY[0][5] , \SB_CORRECT[0][5] , \DB_DETECT[0][5] , 
        \ACCESS_BUSY[0][6] , \SB_CORRECT[0][6] , \DB_DETECT[0][6] , 
        \ACCESS_BUSY[0][7] , \SB_CORRECT[0][7] , \DB_DETECT[0][7] , 
        \ACCESS_BUSY[0][8] , \SB_CORRECT[0][8] , \DB_DETECT[0][8] , 
        \ACCESS_BUSY[0][9] , \SB_CORRECT[0][9] , \DB_DETECT[0][9] , 
        \ACCESS_BUSY[0][10] , \SB_CORRECT[0][10] , \DB_DETECT[0][10] , 
        \ACCESS_BUSY[0][11] , \SB_CORRECT[0][11] , \DB_DETECT[0][11] , 
        \ACCESS_BUSY[0][12] , \SB_CORRECT[0][12] , \DB_DETECT[0][12] , 
        \ACCESS_BUSY[0][13] , \SB_CORRECT[0][13] , \DB_DETECT[0][13] , 
        \ACCESS_BUSY[0][14] , \SB_CORRECT[0][14] , \DB_DETECT[0][14] , 
        \ACCESS_BUSY[0][15] , \SB_CORRECT[0][15] , \DB_DETECT[0][15] , 
        \ACCESS_BUSY[0][16] , \SB_CORRECT[0][16] , \DB_DETECT[0][16] , 
        \ACCESS_BUSY[0][17] , \SB_CORRECT[0][17] , \DB_DETECT[0][17] , 
        \ACCESS_BUSY[0][18] , \SB_CORRECT[0][18] , \DB_DETECT[0][18] , 
        \ACCESS_BUSY[0][19] , \SB_CORRECT[0][19] , \DB_DETECT[0][19] , 
        \ACCESS_BUSY[0][20] , \SB_CORRECT[0][20] , \DB_DETECT[0][20] , 
        \ACCESS_BUSY[0][21] , \SB_CORRECT[0][21] , \DB_DETECT[0][21] , 
        \ACCESS_BUSY[0][22] , \SB_CORRECT[0][22] , \DB_DETECT[0][22] , 
        \ACCESS_BUSY[0][23] , \SB_CORRECT[0][23] , \DB_DETECT[0][23] , 
        \ACCESS_BUSY[0][24] , \SB_CORRECT[0][24] , \DB_DETECT[0][24] , 
        \ACCESS_BUSY[0][25] , \SB_CORRECT[0][25] , \DB_DETECT[0][25] , 
        \ACCESS_BUSY[0][26] , \SB_CORRECT[0][26] , \DB_DETECT[0][26] , 
        \ACCESS_BUSY[0][27] , \SB_CORRECT[0][27] , \DB_DETECT[0][27] , 
        \ACCESS_BUSY[0][28] , \SB_CORRECT[0][28] , \DB_DETECT[0][28] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%24%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C24 (.A_DOUT({R_DATA[999], 
        R_DATA[998], R_DATA[997], R_DATA[996], R_DATA[995], 
        R_DATA[994], R_DATA[993], R_DATA[992], R_DATA[991], 
        R_DATA[990], R_DATA[989], R_DATA[988], R_DATA[987], 
        R_DATA[986], R_DATA[985], R_DATA[984], R_DATA[983], 
        R_DATA[982], R_DATA[981], R_DATA[980]}), .B_DOUT({R_DATA[979], 
        R_DATA[978], R_DATA[977], R_DATA[976], R_DATA[975], 
        R_DATA[974], R_DATA[973], R_DATA[972], R_DATA[971], 
        R_DATA[970], R_DATA[969], R_DATA[968], R_DATA[967], 
        R_DATA[966], R_DATA[965], R_DATA[964], R_DATA[963], 
        R_DATA[962], R_DATA[961], R_DATA[960]}), .DB_DETECT(
        \DB_DETECT[0][24] ), .SB_CORRECT(\SB_CORRECT[0][24] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][24] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[999], W_DATA[998], W_DATA[997], 
        W_DATA[996], W_DATA[995], W_DATA[994], W_DATA[993], 
        W_DATA[992], W_DATA[991], W_DATA[990], W_DATA[989], 
        W_DATA[988], W_DATA[987], W_DATA[986], W_DATA[985], 
        W_DATA[984], W_DATA[983], W_DATA[982], W_DATA[981], 
        W_DATA[980]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[979], 
        W_DATA[978], W_DATA[977], W_DATA[976], W_DATA[975], 
        W_DATA[974], W_DATA[973], W_DATA[972], W_DATA[971], 
        W_DATA[970], W_DATA[969], W_DATA[968], W_DATA[967], 
        W_DATA[966], W_DATA[965], W_DATA[964], W_DATA[963], 
        W_DATA[962], W_DATA[961], W_DATA[960]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%9%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C9 (.A_DOUT({R_DATA[399], 
        R_DATA[398], R_DATA[397], R_DATA[396], R_DATA[395], 
        R_DATA[394], R_DATA[393], R_DATA[392], R_DATA[391], 
        R_DATA[390], R_DATA[389], R_DATA[388], R_DATA[387], 
        R_DATA[386], R_DATA[385], R_DATA[384], R_DATA[383], 
        R_DATA[382], R_DATA[381], R_DATA[380]}), .B_DOUT({R_DATA[379], 
        R_DATA[378], R_DATA[377], R_DATA[376], R_DATA[375], 
        R_DATA[374], R_DATA[373], R_DATA[372], R_DATA[371], 
        R_DATA[370], R_DATA[369], R_DATA[368], R_DATA[367], 
        R_DATA[366], R_DATA[365], R_DATA[364], R_DATA[363], 
        R_DATA[362], R_DATA[361], R_DATA[360]}), .DB_DETECT(
        \DB_DETECT[0][9] ), .SB_CORRECT(\SB_CORRECT[0][9] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][9] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[399], W_DATA[398], W_DATA[397], 
        W_DATA[396], W_DATA[395], W_DATA[394], W_DATA[393], 
        W_DATA[392], W_DATA[391], W_DATA[390], W_DATA[389], 
        W_DATA[388], W_DATA[387], W_DATA[386], W_DATA[385], 
        W_DATA[384], W_DATA[383], W_DATA[382], W_DATA[381], 
        W_DATA[380]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[379], 
        W_DATA[378], W_DATA[377], W_DATA[376], W_DATA[375], 
        W_DATA[374], W_DATA[373], W_DATA[372], W_DATA[371], 
        W_DATA[370], W_DATA[369], W_DATA[368], W_DATA[367], 
        W_DATA[366], W_DATA[365], W_DATA[364], W_DATA[363], 
        W_DATA[362], W_DATA[361], W_DATA[360]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%15%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C15 (.A_DOUT({R_DATA[639], 
        R_DATA[638], R_DATA[637], R_DATA[636], R_DATA[635], 
        R_DATA[634], R_DATA[633], R_DATA[632], R_DATA[631], 
        R_DATA[630], R_DATA[629], R_DATA[628], R_DATA[627], 
        R_DATA[626], R_DATA[625], R_DATA[624], R_DATA[623], 
        R_DATA[622], R_DATA[621], R_DATA[620]}), .B_DOUT({R_DATA[619], 
        R_DATA[618], R_DATA[617], R_DATA[616], R_DATA[615], 
        R_DATA[614], R_DATA[613], R_DATA[612], R_DATA[611], 
        R_DATA[610], R_DATA[609], R_DATA[608], R_DATA[607], 
        R_DATA[606], R_DATA[605], R_DATA[604], R_DATA[603], 
        R_DATA[602], R_DATA[601], R_DATA[600]}), .DB_DETECT(
        \DB_DETECT[0][15] ), .SB_CORRECT(\SB_CORRECT[0][15] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][15] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[639], W_DATA[638], W_DATA[637], 
        W_DATA[636], W_DATA[635], W_DATA[634], W_DATA[633], 
        W_DATA[632], W_DATA[631], W_DATA[630], W_DATA[629], 
        W_DATA[628], W_DATA[627], W_DATA[626], W_DATA[625], 
        W_DATA[624], W_DATA[623], W_DATA[622], W_DATA[621], 
        W_DATA[620]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[619], 
        W_DATA[618], W_DATA[617], W_DATA[616], W_DATA[615], 
        W_DATA[614], W_DATA[613], W_DATA[612], W_DATA[611], 
        W_DATA[610], W_DATA[609], W_DATA[608], W_DATA[607], 
        W_DATA[606], W_DATA[605], W_DATA[604], W_DATA[603], 
        W_DATA[602], W_DATA[601], W_DATA[600]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%26%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C26 (.A_DOUT({R_DATA[1079], 
        R_DATA[1078], R_DATA[1077], R_DATA[1076], R_DATA[1075], 
        R_DATA[1074], R_DATA[1073], R_DATA[1072], R_DATA[1071], 
        R_DATA[1070], R_DATA[1069], R_DATA[1068], R_DATA[1067], 
        R_DATA[1066], R_DATA[1065], R_DATA[1064], R_DATA[1063], 
        R_DATA[1062], R_DATA[1061], R_DATA[1060]}), .B_DOUT({
        R_DATA[1059], R_DATA[1058], R_DATA[1057], R_DATA[1056], 
        R_DATA[1055], R_DATA[1054], R_DATA[1053], R_DATA[1052], 
        R_DATA[1051], R_DATA[1050], R_DATA[1049], R_DATA[1048], 
        R_DATA[1047], R_DATA[1046], R_DATA[1045], R_DATA[1044], 
        R_DATA[1043], R_DATA[1042], R_DATA[1041], R_DATA[1040]}), 
        .DB_DETECT(\DB_DETECT[0][26] ), .SB_CORRECT(
        \SB_CORRECT[0][26] ), .ACCESS_BUSY(\ACCESS_BUSY[0][26] ), 
        .A_ADDR({GND, GND, GND, R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[1079], 
        W_DATA[1078], W_DATA[1077], W_DATA[1076], W_DATA[1075], 
        W_DATA[1074], W_DATA[1073], W_DATA[1072], W_DATA[1071], 
        W_DATA[1070], W_DATA[1069], W_DATA[1068], W_DATA[1067], 
        W_DATA[1066], W_DATA[1065], W_DATA[1064], W_DATA[1063], 
        W_DATA[1062], W_DATA[1061], W_DATA[1060]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, GND, W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({W_DATA[1059], W_DATA[1058], W_DATA[1057], W_DATA[1056], 
        W_DATA[1055], W_DATA[1054], W_DATA[1053], W_DATA[1052], 
        W_DATA[1051], W_DATA[1050], W_DATA[1049], W_DATA[1048], 
        W_DATA[1047], W_DATA[1046], W_DATA[1045], W_DATA[1044], 
        W_DATA[1043], W_DATA[1042], W_DATA[1041], W_DATA[1040]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%3%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C3 (.A_DOUT({R_DATA[159], 
        R_DATA[158], R_DATA[157], R_DATA[156], R_DATA[155], 
        R_DATA[154], R_DATA[153], R_DATA[152], R_DATA[151], 
        R_DATA[150], R_DATA[149], R_DATA[148], R_DATA[147], 
        R_DATA[146], R_DATA[145], R_DATA[144], R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140]}), .B_DOUT({R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126], R_DATA[125], R_DATA[124], R_DATA[123], 
        R_DATA[122], R_DATA[121], R_DATA[120]}), .DB_DETECT(
        \DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[159], W_DATA[158], W_DATA[157], 
        W_DATA[156], W_DATA[155], W_DATA[154], W_DATA[153], 
        W_DATA[152], W_DATA[151], W_DATA[150], W_DATA[149], 
        W_DATA[148], W_DATA[147], W_DATA[146], W_DATA[145], 
        W_DATA[144], W_DATA[143], W_DATA[142], W_DATA[141], 
        W_DATA[140]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[139], 
        W_DATA[138], W_DATA[137], W_DATA[136], W_DATA[135], 
        W_DATA[134], W_DATA[133], W_DATA[132], W_DATA[131], 
        W_DATA[130], W_DATA[129], W_DATA[128], W_DATA[127], 
        W_DATA[126], W_DATA[125], W_DATA[124], W_DATA[123], 
        W_DATA[122], W_DATA[121], W_DATA[120]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%25%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C25 (.A_DOUT({R_DATA[1039], 
        R_DATA[1038], R_DATA[1037], R_DATA[1036], R_DATA[1035], 
        R_DATA[1034], R_DATA[1033], R_DATA[1032], R_DATA[1031], 
        R_DATA[1030], R_DATA[1029], R_DATA[1028], R_DATA[1027], 
        R_DATA[1026], R_DATA[1025], R_DATA[1024], R_DATA[1023], 
        R_DATA[1022], R_DATA[1021], R_DATA[1020]}), .B_DOUT({
        R_DATA[1019], R_DATA[1018], R_DATA[1017], R_DATA[1016], 
        R_DATA[1015], R_DATA[1014], R_DATA[1013], R_DATA[1012], 
        R_DATA[1011], R_DATA[1010], R_DATA[1009], R_DATA[1008], 
        R_DATA[1007], R_DATA[1006], R_DATA[1005], R_DATA[1004], 
        R_DATA[1003], R_DATA[1002], R_DATA[1001], R_DATA[1000]}), 
        .DB_DETECT(\DB_DETECT[0][25] ), .SB_CORRECT(
        \SB_CORRECT[0][25] ), .ACCESS_BUSY(\ACCESS_BUSY[0][25] ), 
        .A_ADDR({GND, GND, GND, R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[1039], 
        W_DATA[1038], W_DATA[1037], W_DATA[1036], W_DATA[1035], 
        W_DATA[1034], W_DATA[1033], W_DATA[1032], W_DATA[1031], 
        W_DATA[1030], W_DATA[1029], W_DATA[1028], W_DATA[1027], 
        W_DATA[1026], W_DATA[1025], W_DATA[1024], W_DATA[1023], 
        W_DATA[1022], W_DATA[1021], W_DATA[1020]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, GND, W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({W_DATA[1019], W_DATA[1018], W_DATA[1017], W_DATA[1016], 
        W_DATA[1015], W_DATA[1014], W_DATA[1013], W_DATA[1012], 
        W_DATA[1011], W_DATA[1010], W_DATA[1009], W_DATA[1008], 
        W_DATA[1007], W_DATA[1006], W_DATA[1005], W_DATA[1004], 
        W_DATA[1003], W_DATA[1002], W_DATA[1001], W_DATA[1000]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%18%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C18 (.A_DOUT({R_DATA[759], 
        R_DATA[758], R_DATA[757], R_DATA[756], R_DATA[755], 
        R_DATA[754], R_DATA[753], R_DATA[752], R_DATA[751], 
        R_DATA[750], R_DATA[749], R_DATA[748], R_DATA[747], 
        R_DATA[746], R_DATA[745], R_DATA[744], R_DATA[743], 
        R_DATA[742], R_DATA[741], R_DATA[740]}), .B_DOUT({R_DATA[739], 
        R_DATA[738], R_DATA[737], R_DATA[736], R_DATA[735], 
        R_DATA[734], R_DATA[733], R_DATA[732], R_DATA[731], 
        R_DATA[730], R_DATA[729], R_DATA[728], R_DATA[727], 
        R_DATA[726], R_DATA[725], R_DATA[724], R_DATA[723], 
        R_DATA[722], R_DATA[721], R_DATA[720]}), .DB_DETECT(
        \DB_DETECT[0][18] ), .SB_CORRECT(\SB_CORRECT[0][18] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][18] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[759], W_DATA[758], W_DATA[757], 
        W_DATA[756], W_DATA[755], W_DATA[754], W_DATA[753], 
        W_DATA[752], W_DATA[751], W_DATA[750], W_DATA[749], 
        W_DATA[748], W_DATA[747], W_DATA[746], W_DATA[745], 
        W_DATA[744], W_DATA[743], W_DATA[742], W_DATA[741], 
        W_DATA[740]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[739], 
        W_DATA[738], W_DATA[737], W_DATA[736], W_DATA[735], 
        W_DATA[734], W_DATA[733], W_DATA[732], W_DATA[731], 
        W_DATA[730], W_DATA[729], W_DATA[728], W_DATA[727], 
        W_DATA[726], W_DATA[725], W_DATA[724], W_DATA[723], 
        W_DATA[722], W_DATA[721], W_DATA[720]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%11%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C11 (.A_DOUT({R_DATA[479], 
        R_DATA[478], R_DATA[477], R_DATA[476], R_DATA[475], 
        R_DATA[474], R_DATA[473], R_DATA[472], R_DATA[471], 
        R_DATA[470], R_DATA[469], R_DATA[468], R_DATA[467], 
        R_DATA[466], R_DATA[465], R_DATA[464], R_DATA[463], 
        R_DATA[462], R_DATA[461], R_DATA[460]}), .B_DOUT({R_DATA[459], 
        R_DATA[458], R_DATA[457], R_DATA[456], R_DATA[455], 
        R_DATA[454], R_DATA[453], R_DATA[452], R_DATA[451], 
        R_DATA[450], R_DATA[449], R_DATA[448], R_DATA[447], 
        R_DATA[446], R_DATA[445], R_DATA[444], R_DATA[443], 
        R_DATA[442], R_DATA[441], R_DATA[440]}), .DB_DETECT(
        \DB_DETECT[0][11] ), .SB_CORRECT(\SB_CORRECT[0][11] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][11] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[479], W_DATA[478], W_DATA[477], 
        W_DATA[476], W_DATA[475], W_DATA[474], W_DATA[473], 
        W_DATA[472], W_DATA[471], W_DATA[470], W_DATA[469], 
        W_DATA[468], W_DATA[467], W_DATA[466], W_DATA[465], 
        W_DATA[464], W_DATA[463], W_DATA[462], W_DATA[461], 
        W_DATA[460]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[459], 
        W_DATA[458], W_DATA[457], W_DATA[456], W_DATA[455], 
        W_DATA[454], W_DATA[453], W_DATA[452], W_DATA[451], 
        W_DATA[450], W_DATA[449], W_DATA[448], W_DATA[447], 
        W_DATA[446], W_DATA[445], W_DATA[444], W_DATA[443], 
        W_DATA[442], W_DATA[441], W_DATA[440]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%28%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C28 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, R_DATA[1151], R_DATA[1150], 
        R_DATA[1149], R_DATA[1148], R_DATA[1147], R_DATA[1146], 
        R_DATA[1145], R_DATA[1144], R_DATA[1143], R_DATA[1142], 
        R_DATA[1141], R_DATA[1140]}), .B_DOUT({R_DATA[1139], 
        R_DATA[1138], R_DATA[1137], R_DATA[1136], R_DATA[1135], 
        R_DATA[1134], R_DATA[1133], R_DATA[1132], R_DATA[1131], 
        R_DATA[1130], R_DATA[1129], R_DATA[1128], R_DATA[1127], 
        R_DATA[1126], R_DATA[1125], R_DATA[1124], R_DATA[1123], 
        R_DATA[1122], R_DATA[1121], R_DATA[1120]}), .DB_DETECT(
        \DB_DETECT[0][28] ), .SB_CORRECT(\SB_CORRECT[0][28] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][28] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        W_DATA[1151], W_DATA[1150], W_DATA[1149], W_DATA[1148], 
        W_DATA[1147], W_DATA[1146], W_DATA[1145], W_DATA[1144], 
        W_DATA[1143], W_DATA[1142], W_DATA[1141], W_DATA[1140]}), 
        .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[1139], W_DATA[1138], 
        W_DATA[1137], W_DATA[1136], W_DATA[1135], W_DATA[1134], 
        W_DATA[1133], W_DATA[1132], W_DATA[1131], W_DATA[1130], 
        W_DATA[1129], W_DATA[1128], W_DATA[1127], W_DATA[1126], 
        W_DATA[1125], W_DATA[1124], W_DATA[1123], W_DATA[1122], 
        W_DATA[1121], W_DATA[1120]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({R_DATA[39], 
        R_DATA[38], R_DATA[37], R_DATA[36], R_DATA[35], R_DATA[34], 
        R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], R_DATA[29], 
        R_DATA[28], R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], 
        R_DATA[23], R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[39], W_DATA[38], W_DATA[37], 
        W_DATA[36], W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%19%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C19 (.A_DOUT({R_DATA[799], 
        R_DATA[798], R_DATA[797], R_DATA[796], R_DATA[795], 
        R_DATA[794], R_DATA[793], R_DATA[792], R_DATA[791], 
        R_DATA[790], R_DATA[789], R_DATA[788], R_DATA[787], 
        R_DATA[786], R_DATA[785], R_DATA[784], R_DATA[783], 
        R_DATA[782], R_DATA[781], R_DATA[780]}), .B_DOUT({R_DATA[779], 
        R_DATA[778], R_DATA[777], R_DATA[776], R_DATA[775], 
        R_DATA[774], R_DATA[773], R_DATA[772], R_DATA[771], 
        R_DATA[770], R_DATA[769], R_DATA[768], R_DATA[767], 
        R_DATA[766], R_DATA[765], R_DATA[764], R_DATA[763], 
        R_DATA[762], R_DATA[761], R_DATA[760]}), .DB_DETECT(
        \DB_DETECT[0][19] ), .SB_CORRECT(\SB_CORRECT[0][19] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][19] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[799], W_DATA[798], W_DATA[797], 
        W_DATA[796], W_DATA[795], W_DATA[794], W_DATA[793], 
        W_DATA[792], W_DATA[791], W_DATA[790], W_DATA[789], 
        W_DATA[788], W_DATA[787], W_DATA[786], W_DATA[785], 
        W_DATA[784], W_DATA[783], W_DATA[782], W_DATA[781], 
        W_DATA[780]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[779], 
        W_DATA[778], W_DATA[777], W_DATA[776], W_DATA[775], 
        W_DATA[774], W_DATA[773], W_DATA[772], W_DATA[771], 
        W_DATA[770], W_DATA[769], W_DATA[768], W_DATA[767], 
        W_DATA[766], W_DATA[765], W_DATA[764], W_DATA[763], 
        W_DATA[762], W_DATA[761], W_DATA[760]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%21%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C21 (.A_DOUT({R_DATA[879], 
        R_DATA[878], R_DATA[877], R_DATA[876], R_DATA[875], 
        R_DATA[874], R_DATA[873], R_DATA[872], R_DATA[871], 
        R_DATA[870], R_DATA[869], R_DATA[868], R_DATA[867], 
        R_DATA[866], R_DATA[865], R_DATA[864], R_DATA[863], 
        R_DATA[862], R_DATA[861], R_DATA[860]}), .B_DOUT({R_DATA[859], 
        R_DATA[858], R_DATA[857], R_DATA[856], R_DATA[855], 
        R_DATA[854], R_DATA[853], R_DATA[852], R_DATA[851], 
        R_DATA[850], R_DATA[849], R_DATA[848], R_DATA[847], 
        R_DATA[846], R_DATA[845], R_DATA[844], R_DATA[843], 
        R_DATA[842], R_DATA[841], R_DATA[840]}), .DB_DETECT(
        \DB_DETECT[0][21] ), .SB_CORRECT(\SB_CORRECT[0][21] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][21] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[879], W_DATA[878], W_DATA[877], 
        W_DATA[876], W_DATA[875], W_DATA[874], W_DATA[873], 
        W_DATA[872], W_DATA[871], W_DATA[870], W_DATA[869], 
        W_DATA[868], W_DATA[867], W_DATA[866], W_DATA[865], 
        W_DATA[864], W_DATA[863], W_DATA[862], W_DATA[861], 
        W_DATA[860]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[859], 
        W_DATA[858], W_DATA[857], W_DATA[856], W_DATA[855], 
        W_DATA[854], W_DATA[853], W_DATA[852], W_DATA[851], 
        W_DATA[850], W_DATA[849], W_DATA[848], W_DATA[847], 
        W_DATA[846], W_DATA[845], W_DATA[844], W_DATA[843], 
        W_DATA[842], W_DATA[841], W_DATA[840]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%13%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C13 (.A_DOUT({R_DATA[559], 
        R_DATA[558], R_DATA[557], R_DATA[556], R_DATA[555], 
        R_DATA[554], R_DATA[553], R_DATA[552], R_DATA[551], 
        R_DATA[550], R_DATA[549], R_DATA[548], R_DATA[547], 
        R_DATA[546], R_DATA[545], R_DATA[544], R_DATA[543], 
        R_DATA[542], R_DATA[541], R_DATA[540]}), .B_DOUT({R_DATA[539], 
        R_DATA[538], R_DATA[537], R_DATA[536], R_DATA[535], 
        R_DATA[534], R_DATA[533], R_DATA[532], R_DATA[531], 
        R_DATA[530], R_DATA[529], R_DATA[528], R_DATA[527], 
        R_DATA[526], R_DATA[525], R_DATA[524], R_DATA[523], 
        R_DATA[522], R_DATA[521], R_DATA[520]}), .DB_DETECT(
        \DB_DETECT[0][13] ), .SB_CORRECT(\SB_CORRECT[0][13] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][13] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[559], W_DATA[558], W_DATA[557], 
        W_DATA[556], W_DATA[555], W_DATA[554], W_DATA[553], 
        W_DATA[552], W_DATA[551], W_DATA[550], W_DATA[549], 
        W_DATA[548], W_DATA[547], W_DATA[546], W_DATA[545], 
        W_DATA[544], W_DATA[543], W_DATA[542], W_DATA[541], 
        W_DATA[540]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[539], 
        W_DATA[538], W_DATA[537], W_DATA[536], W_DATA[535], 
        W_DATA[534], W_DATA[533], W_DATA[532], W_DATA[531], 
        W_DATA[530], W_DATA[529], W_DATA[528], W_DATA[527], 
        W_DATA[526], W_DATA[525], W_DATA[524], W_DATA[523], 
        W_DATA[522], W_DATA[521], W_DATA[520]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%17%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C17 (.A_DOUT({R_DATA[719], 
        R_DATA[718], R_DATA[717], R_DATA[716], R_DATA[715], 
        R_DATA[714], R_DATA[713], R_DATA[712], R_DATA[711], 
        R_DATA[710], R_DATA[709], R_DATA[708], R_DATA[707], 
        R_DATA[706], R_DATA[705], R_DATA[704], R_DATA[703], 
        R_DATA[702], R_DATA[701], R_DATA[700]}), .B_DOUT({R_DATA[699], 
        R_DATA[698], R_DATA[697], R_DATA[696], R_DATA[695], 
        R_DATA[694], R_DATA[693], R_DATA[692], R_DATA[691], 
        R_DATA[690], R_DATA[689], R_DATA[688], R_DATA[687], 
        R_DATA[686], R_DATA[685], R_DATA[684], R_DATA[683], 
        R_DATA[682], R_DATA[681], R_DATA[680]}), .DB_DETECT(
        \DB_DETECT[0][17] ), .SB_CORRECT(\SB_CORRECT[0][17] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][17] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[719], W_DATA[718], W_DATA[717], 
        W_DATA[716], W_DATA[715], W_DATA[714], W_DATA[713], 
        W_DATA[712], W_DATA[711], W_DATA[710], W_DATA[709], 
        W_DATA[708], W_DATA[707], W_DATA[706], W_DATA[705], 
        W_DATA[704], W_DATA[703], W_DATA[702], W_DATA[701], 
        W_DATA[700]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[699], 
        W_DATA[698], W_DATA[697], W_DATA[696], W_DATA[695], 
        W_DATA[694], W_DATA[693], W_DATA[692], W_DATA[691], 
        W_DATA[690], W_DATA[689], W_DATA[688], W_DATA[687], 
        W_DATA[686], W_DATA[685], W_DATA[684], W_DATA[683], 
        W_DATA[682], W_DATA[681], W_DATA[680]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%10%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C10 (.A_DOUT({R_DATA[439], 
        R_DATA[438], R_DATA[437], R_DATA[436], R_DATA[435], 
        R_DATA[434], R_DATA[433], R_DATA[432], R_DATA[431], 
        R_DATA[430], R_DATA[429], R_DATA[428], R_DATA[427], 
        R_DATA[426], R_DATA[425], R_DATA[424], R_DATA[423], 
        R_DATA[422], R_DATA[421], R_DATA[420]}), .B_DOUT({R_DATA[419], 
        R_DATA[418], R_DATA[417], R_DATA[416], R_DATA[415], 
        R_DATA[414], R_DATA[413], R_DATA[412], R_DATA[411], 
        R_DATA[410], R_DATA[409], R_DATA[408], R_DATA[407], 
        R_DATA[406], R_DATA[405], R_DATA[404], R_DATA[403], 
        R_DATA[402], R_DATA[401], R_DATA[400]}), .DB_DETECT(
        \DB_DETECT[0][10] ), .SB_CORRECT(\SB_CORRECT[0][10] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[439], W_DATA[438], W_DATA[437], 
        W_DATA[436], W_DATA[435], W_DATA[434], W_DATA[433], 
        W_DATA[432], W_DATA[431], W_DATA[430], W_DATA[429], 
        W_DATA[428], W_DATA[427], W_DATA[426], W_DATA[425], 
        W_DATA[424], W_DATA[423], W_DATA[422], W_DATA[421], 
        W_DATA[420]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[419], 
        W_DATA[418], W_DATA[417], W_DATA[416], W_DATA[415], 
        W_DATA[414], W_DATA[413], W_DATA[412], W_DATA[411], 
        W_DATA[410], W_DATA[409], W_DATA[408], W_DATA[407], 
        W_DATA[406], W_DATA[405], W_DATA[404], W_DATA[403], 
        W_DATA[402], W_DATA[401], W_DATA[400]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%23%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C23 (.A_DOUT({R_DATA[959], 
        R_DATA[958], R_DATA[957], R_DATA[956], R_DATA[955], 
        R_DATA[954], R_DATA[953], R_DATA[952], R_DATA[951], 
        R_DATA[950], R_DATA[949], R_DATA[948], R_DATA[947], 
        R_DATA[946], R_DATA[945], R_DATA[944], R_DATA[943], 
        R_DATA[942], R_DATA[941], R_DATA[940]}), .B_DOUT({R_DATA[939], 
        R_DATA[938], R_DATA[937], R_DATA[936], R_DATA[935], 
        R_DATA[934], R_DATA[933], R_DATA[932], R_DATA[931], 
        R_DATA[930], R_DATA[929], R_DATA[928], R_DATA[927], 
        R_DATA[926], R_DATA[925], R_DATA[924], R_DATA[923], 
        R_DATA[922], R_DATA[921], R_DATA[920]}), .DB_DETECT(
        \DB_DETECT[0][23] ), .SB_CORRECT(\SB_CORRECT[0][23] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][23] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[959], W_DATA[958], W_DATA[957], 
        W_DATA[956], W_DATA[955], W_DATA[954], W_DATA[953], 
        W_DATA[952], W_DATA[951], W_DATA[950], W_DATA[949], 
        W_DATA[948], W_DATA[947], W_DATA[946], W_DATA[945], 
        W_DATA[944], W_DATA[943], W_DATA[942], W_DATA[941], 
        W_DATA[940]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[939], 
        W_DATA[938], W_DATA[937], W_DATA[936], W_DATA[935], 
        W_DATA[934], W_DATA[933], W_DATA[932], W_DATA[931], 
        W_DATA[930], W_DATA[929], W_DATA[928], W_DATA[927], 
        W_DATA[926], W_DATA[925], W_DATA[924], W_DATA[923], 
        W_DATA[922], W_DATA[921], W_DATA[920]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%27%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C27 (.A_DOUT({R_DATA[1119], 
        R_DATA[1118], R_DATA[1117], R_DATA[1116], R_DATA[1115], 
        R_DATA[1114], R_DATA[1113], R_DATA[1112], R_DATA[1111], 
        R_DATA[1110], R_DATA[1109], R_DATA[1108], R_DATA[1107], 
        R_DATA[1106], R_DATA[1105], R_DATA[1104], R_DATA[1103], 
        R_DATA[1102], R_DATA[1101], R_DATA[1100]}), .B_DOUT({
        R_DATA[1099], R_DATA[1098], R_DATA[1097], R_DATA[1096], 
        R_DATA[1095], R_DATA[1094], R_DATA[1093], R_DATA[1092], 
        R_DATA[1091], R_DATA[1090], R_DATA[1089], R_DATA[1088], 
        R_DATA[1087], R_DATA[1086], R_DATA[1085], R_DATA[1084], 
        R_DATA[1083], R_DATA[1082], R_DATA[1081], R_DATA[1080]}), 
        .DB_DETECT(\DB_DETECT[0][27] ), .SB_CORRECT(
        \SB_CORRECT[0][27] ), .ACCESS_BUSY(\ACCESS_BUSY[0][27] ), 
        .A_ADDR({GND, GND, GND, R_ADDR[5], R_ADDR[4], R_ADDR[3], 
        R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({W_DATA[1119], 
        W_DATA[1118], W_DATA[1117], W_DATA[1116], W_DATA[1115], 
        W_DATA[1114], W_DATA[1113], W_DATA[1112], W_DATA[1111], 
        W_DATA[1110], W_DATA[1109], W_DATA[1108], W_DATA[1107], 
        W_DATA[1106], W_DATA[1105], W_DATA[1104], W_DATA[1103], 
        W_DATA[1102], W_DATA[1101], W_DATA[1100]}), .A_REN(R_EN), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, GND, W_ADDR[5], 
        W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({W_DATA[1099], W_DATA[1098], W_DATA[1097], W_DATA[1096], 
        W_DATA[1095], W_DATA[1094], W_DATA[1093], W_DATA[1092], 
        W_DATA[1091], W_DATA[1090], W_DATA[1089], W_DATA[1088], 
        W_DATA[1087], W_DATA[1086], W_DATA[1085], W_DATA[1084], 
        W_DATA[1083], W_DATA[1082], W_DATA[1081], W_DATA[1080]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%20%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C20 (.A_DOUT({R_DATA[839], 
        R_DATA[838], R_DATA[837], R_DATA[836], R_DATA[835], 
        R_DATA[834], R_DATA[833], R_DATA[832], R_DATA[831], 
        R_DATA[830], R_DATA[829], R_DATA[828], R_DATA[827], 
        R_DATA[826], R_DATA[825], R_DATA[824], R_DATA[823], 
        R_DATA[822], R_DATA[821], R_DATA[820]}), .B_DOUT({R_DATA[819], 
        R_DATA[818], R_DATA[817], R_DATA[816], R_DATA[815], 
        R_DATA[814], R_DATA[813], R_DATA[812], R_DATA[811], 
        R_DATA[810], R_DATA[809], R_DATA[808], R_DATA[807], 
        R_DATA[806], R_DATA[805], R_DATA[804], R_DATA[803], 
        R_DATA[802], R_DATA[801], R_DATA[800]}), .DB_DETECT(
        \DB_DETECT[0][20] ), .SB_CORRECT(\SB_CORRECT[0][20] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][20] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[839], W_DATA[838], W_DATA[837], 
        W_DATA[836], W_DATA[835], W_DATA[834], W_DATA[833], 
        W_DATA[832], W_DATA[831], W_DATA[830], W_DATA[829], 
        W_DATA[828], W_DATA[827], W_DATA[826], W_DATA[825], 
        W_DATA[824], W_DATA[823], W_DATA[822], W_DATA[821], 
        W_DATA[820]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[819], 
        W_DATA[818], W_DATA[817], W_DATA[816], W_DATA[815], 
        W_DATA[814], W_DATA[813], W_DATA[812], W_DATA[811], 
        W_DATA[810], W_DATA[809], W_DATA[808], W_DATA[807], 
        W_DATA[806], W_DATA[805], W_DATA[804], W_DATA[803], 
        W_DATA[802], W_DATA[801], W_DATA[800]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%4%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C4 (.A_DOUT({R_DATA[199], 
        R_DATA[198], R_DATA[197], R_DATA[196], R_DATA[195], 
        R_DATA[194], R_DATA[193], R_DATA[192], R_DATA[191], 
        R_DATA[190], R_DATA[189], R_DATA[188], R_DATA[187], 
        R_DATA[186], R_DATA[185], R_DATA[184], R_DATA[183], 
        R_DATA[182], R_DATA[181], R_DATA[180]}), .B_DOUT({R_DATA[179], 
        R_DATA[178], R_DATA[177], R_DATA[176], R_DATA[175], 
        R_DATA[174], R_DATA[173], R_DATA[172], R_DATA[171], 
        R_DATA[170], R_DATA[169], R_DATA[168], R_DATA[167], 
        R_DATA[166], R_DATA[165], R_DATA[164], R_DATA[163], 
        R_DATA[162], R_DATA[161], R_DATA[160]}), .DB_DETECT(
        \DB_DETECT[0][4] ), .SB_CORRECT(\SB_CORRECT[0][4] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[199], W_DATA[198], W_DATA[197], 
        W_DATA[196], W_DATA[195], W_DATA[194], W_DATA[193], 
        W_DATA[192], W_DATA[191], W_DATA[190], W_DATA[189], 
        W_DATA[188], W_DATA[187], W_DATA[186], W_DATA[185], 
        W_DATA[184], W_DATA[183], W_DATA[182], W_DATA[181], 
        W_DATA[180]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[179], 
        W_DATA[178], W_DATA[177], W_DATA[176], W_DATA[175], 
        W_DATA[174], W_DATA[173], W_DATA[172], W_DATA[171], 
        W_DATA[170], W_DATA[169], W_DATA[168], W_DATA[167], 
        W_DATA[166], W_DATA[165], W_DATA[164], W_DATA[163], 
        W_DATA[162], W_DATA[161], W_DATA[160]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%8%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C8 (.A_DOUT({R_DATA[359], 
        R_DATA[358], R_DATA[357], R_DATA[356], R_DATA[355], 
        R_DATA[354], R_DATA[353], R_DATA[352], R_DATA[351], 
        R_DATA[350], R_DATA[349], R_DATA[348], R_DATA[347], 
        R_DATA[346], R_DATA[345], R_DATA[344], R_DATA[343], 
        R_DATA[342], R_DATA[341], R_DATA[340]}), .B_DOUT({R_DATA[339], 
        R_DATA[338], R_DATA[337], R_DATA[336], R_DATA[335], 
        R_DATA[334], R_DATA[333], R_DATA[332], R_DATA[331], 
        R_DATA[330], R_DATA[329], R_DATA[328], R_DATA[327], 
        R_DATA[326], R_DATA[325], R_DATA[324], R_DATA[323], 
        R_DATA[322], R_DATA[321], R_DATA[320]}), .DB_DETECT(
        \DB_DETECT[0][8] ), .SB_CORRECT(\SB_CORRECT[0][8] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[359], W_DATA[358], W_DATA[357], 
        W_DATA[356], W_DATA[355], W_DATA[354], W_DATA[353], 
        W_DATA[352], W_DATA[351], W_DATA[350], W_DATA[349], 
        W_DATA[348], W_DATA[347], W_DATA[346], W_DATA[345], 
        W_DATA[344], W_DATA[343], W_DATA[342], W_DATA[341], 
        W_DATA[340]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[339], 
        W_DATA[338], W_DATA[337], W_DATA[336], W_DATA[335], 
        W_DATA[334], W_DATA[333], W_DATA[332], W_DATA[331], 
        W_DATA[330], W_DATA[329], W_DATA[328], W_DATA[327], 
        W_DATA[326], W_DATA[325], W_DATA[324], W_DATA[323], 
        W_DATA[322], W_DATA[321], W_DATA[320]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%6%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C6 (.A_DOUT({R_DATA[279], 
        R_DATA[278], R_DATA[277], R_DATA[276], R_DATA[275], 
        R_DATA[274], R_DATA[273], R_DATA[272], R_DATA[271], 
        R_DATA[270], R_DATA[269], R_DATA[268], R_DATA[267], 
        R_DATA[266], R_DATA[265], R_DATA[264], R_DATA[263], 
        R_DATA[262], R_DATA[261], R_DATA[260]}), .B_DOUT({R_DATA[259], 
        R_DATA[258], R_DATA[257], R_DATA[256], R_DATA[255], 
        R_DATA[254], R_DATA[253], R_DATA[252], R_DATA[251], 
        R_DATA[250], R_DATA[249], R_DATA[248], R_DATA[247], 
        R_DATA[246], R_DATA[245], R_DATA[244], R_DATA[243], 
        R_DATA[242], R_DATA[241], R_DATA[240]}), .DB_DETECT(
        \DB_DETECT[0][6] ), .SB_CORRECT(\SB_CORRECT[0][6] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[279], W_DATA[278], W_DATA[277], 
        W_DATA[276], W_DATA[275], W_DATA[274], W_DATA[273], 
        W_DATA[272], W_DATA[271], W_DATA[270], W_DATA[269], 
        W_DATA[268], W_DATA[267], W_DATA[266], W_DATA[265], 
        W_DATA[264], W_DATA[263], W_DATA[262], W_DATA[261], 
        W_DATA[260]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[259], 
        W_DATA[258], W_DATA[257], W_DATA[256], W_DATA[255], 
        W_DATA[254], W_DATA[253], W_DATA[252], W_DATA[251], 
        W_DATA[250], W_DATA[249], W_DATA[248], W_DATA[247], 
        W_DATA[246], W_DATA[245], W_DATA[244], W_DATA[243], 
        W_DATA[242], W_DATA[241], W_DATA[240]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({R_DATA[79], 
        R_DATA[78], R_DATA[77], R_DATA[76], R_DATA[75], R_DATA[74], 
        R_DATA[73], R_DATA[72], R_DATA[71], R_DATA[70], R_DATA[69], 
        R_DATA[68], R_DATA[67], R_DATA[66], R_DATA[65], R_DATA[64], 
        R_DATA[63], R_DATA[62], R_DATA[61], R_DATA[60]}), .B_DOUT({
        R_DATA[59], R_DATA[58], R_DATA[57], R_DATA[56], R_DATA[55], 
        R_DATA[54], R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], 
        R_DATA[49], R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], 
        R_DATA[44], R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40]}), 
        .DB_DETECT(\DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[79], W_DATA[78], W_DATA[77], 
        W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72], 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], W_DATA[62], 
        W_DATA[61], W_DATA[60]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[59], 
        W_DATA[58], W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54], 
        W_DATA[53], W_DATA[52], W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%12%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C12 (.A_DOUT({R_DATA[519], 
        R_DATA[518], R_DATA[517], R_DATA[516], R_DATA[515], 
        R_DATA[514], R_DATA[513], R_DATA[512], R_DATA[511], 
        R_DATA[510], R_DATA[509], R_DATA[508], R_DATA[507], 
        R_DATA[506], R_DATA[505], R_DATA[504], R_DATA[503], 
        R_DATA[502], R_DATA[501], R_DATA[500]}), .B_DOUT({R_DATA[499], 
        R_DATA[498], R_DATA[497], R_DATA[496], R_DATA[495], 
        R_DATA[494], R_DATA[493], R_DATA[492], R_DATA[491], 
        R_DATA[490], R_DATA[489], R_DATA[488], R_DATA[487], 
        R_DATA[486], R_DATA[485], R_DATA[484], R_DATA[483], 
        R_DATA[482], R_DATA[481], R_DATA[480]}), .DB_DETECT(
        \DB_DETECT[0][12] ), .SB_CORRECT(\SB_CORRECT[0][12] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][12] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[519], W_DATA[518], W_DATA[517], 
        W_DATA[516], W_DATA[515], W_DATA[514], W_DATA[513], 
        W_DATA[512], W_DATA[511], W_DATA[510], W_DATA[509], 
        W_DATA[508], W_DATA[507], W_DATA[506], W_DATA[505], 
        W_DATA[504], W_DATA[503], W_DATA[502], W_DATA[501], 
        W_DATA[500]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[499], 
        W_DATA[498], W_DATA[497], W_DATA[496], W_DATA[495], 
        W_DATA[494], W_DATA[493], W_DATA[492], W_DATA[491], 
        W_DATA[490], W_DATA[489], W_DATA[488], W_DATA[487], 
        W_DATA[486], W_DATA[485], W_DATA[484], W_DATA[483], 
        W_DATA[482], W_DATA[481], W_DATA[480]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%14%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C14 (.A_DOUT({R_DATA[599], 
        R_DATA[598], R_DATA[597], R_DATA[596], R_DATA[595], 
        R_DATA[594], R_DATA[593], R_DATA[592], R_DATA[591], 
        R_DATA[590], R_DATA[589], R_DATA[588], R_DATA[587], 
        R_DATA[586], R_DATA[585], R_DATA[584], R_DATA[583], 
        R_DATA[582], R_DATA[581], R_DATA[580]}), .B_DOUT({R_DATA[579], 
        R_DATA[578], R_DATA[577], R_DATA[576], R_DATA[575], 
        R_DATA[574], R_DATA[573], R_DATA[572], R_DATA[571], 
        R_DATA[570], R_DATA[569], R_DATA[568], R_DATA[567], 
        R_DATA[566], R_DATA[565], R_DATA[564], R_DATA[563], 
        R_DATA[562], R_DATA[561], R_DATA[560]}), .DB_DETECT(
        \DB_DETECT[0][14] ), .SB_CORRECT(\SB_CORRECT[0][14] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][14] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[599], W_DATA[598], W_DATA[597], 
        W_DATA[596], W_DATA[595], W_DATA[594], W_DATA[593], 
        W_DATA[592], W_DATA[591], W_DATA[590], W_DATA[589], 
        W_DATA[588], W_DATA[587], W_DATA[586], W_DATA[585], 
        W_DATA[584], W_DATA[583], W_DATA[582], W_DATA[581], 
        W_DATA[580]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[579], 
        W_DATA[578], W_DATA[577], W_DATA[576], W_DATA[575], 
        W_DATA[574], W_DATA[573], W_DATA[572], W_DATA[571], 
        W_DATA[570], W_DATA[569], W_DATA[568], W_DATA[567], 
        W_DATA[566], W_DATA[565], W_DATA[564], W_DATA[563], 
        W_DATA[562], W_DATA[561], W_DATA[560]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%7%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C7 (.A_DOUT({R_DATA[319], 
        R_DATA[318], R_DATA[317], R_DATA[316], R_DATA[315], 
        R_DATA[314], R_DATA[313], R_DATA[312], R_DATA[311], 
        R_DATA[310], R_DATA[309], R_DATA[308], R_DATA[307], 
        R_DATA[306], R_DATA[305], R_DATA[304], R_DATA[303], 
        R_DATA[302], R_DATA[301], R_DATA[300]}), .B_DOUT({R_DATA[299], 
        R_DATA[298], R_DATA[297], R_DATA[296], R_DATA[295], 
        R_DATA[294], R_DATA[293], R_DATA[292], R_DATA[291], 
        R_DATA[290], R_DATA[289], R_DATA[288], R_DATA[287], 
        R_DATA[286], R_DATA[285], R_DATA[284], R_DATA[283], 
        R_DATA[282], R_DATA[281], R_DATA[280]}), .DB_DETECT(
        \DB_DETECT[0][7] ), .SB_CORRECT(\SB_CORRECT[0][7] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[319], W_DATA[318], W_DATA[317], 
        W_DATA[316], W_DATA[315], W_DATA[314], W_DATA[313], 
        W_DATA[312], W_DATA[311], W_DATA[310], W_DATA[309], 
        W_DATA[308], W_DATA[307], W_DATA[306], W_DATA[305], 
        W_DATA[304], W_DATA[303], W_DATA[302], W_DATA[301], 
        W_DATA[300]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[299], 
        W_DATA[298], W_DATA[297], W_DATA[296], W_DATA[295], 
        W_DATA[294], W_DATA[293], W_DATA[292], W_DATA[291], 
        W_DATA[290], W_DATA[289], W_DATA[288], W_DATA[287], 
        W_DATA[286], W_DATA[285], W_DATA[284], W_DATA[283], 
        W_DATA[282], W_DATA[281], W_DATA[280]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%16%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C16 (.A_DOUT({R_DATA[679], 
        R_DATA[678], R_DATA[677], R_DATA[676], R_DATA[675], 
        R_DATA[674], R_DATA[673], R_DATA[672], R_DATA[671], 
        R_DATA[670], R_DATA[669], R_DATA[668], R_DATA[667], 
        R_DATA[666], R_DATA[665], R_DATA[664], R_DATA[663], 
        R_DATA[662], R_DATA[661], R_DATA[660]}), .B_DOUT({R_DATA[659], 
        R_DATA[658], R_DATA[657], R_DATA[656], R_DATA[655], 
        R_DATA[654], R_DATA[653], R_DATA[652], R_DATA[651], 
        R_DATA[650], R_DATA[649], R_DATA[648], R_DATA[647], 
        R_DATA[646], R_DATA[645], R_DATA[644], R_DATA[643], 
        R_DATA[642], R_DATA[641], R_DATA[640]}), .DB_DETECT(
        \DB_DETECT[0][16] ), .SB_CORRECT(\SB_CORRECT[0][16] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][16] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[679], W_DATA[678], W_DATA[677], 
        W_DATA[676], W_DATA[675], W_DATA[674], W_DATA[673], 
        W_DATA[672], W_DATA[671], W_DATA[670], W_DATA[669], 
        W_DATA[668], W_DATA[667], W_DATA[666], W_DATA[665], 
        W_DATA[664], W_DATA[663], W_DATA[662], W_DATA[661], 
        W_DATA[660]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[659], 
        W_DATA[658], W_DATA[657], W_DATA[656], W_DATA[655], 
        W_DATA[654], W_DATA[653], W_DATA[652], W_DATA[651], 
        W_DATA[650], W_DATA[649], W_DATA[648], W_DATA[647], 
        W_DATA[646], W_DATA[645], W_DATA[644], W_DATA[643], 
        W_DATA[642], W_DATA[641], W_DATA[640]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%2%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C2 (.A_DOUT({R_DATA[119], 
        R_DATA[118], R_DATA[117], R_DATA[116], R_DATA[115], 
        R_DATA[114], R_DATA[113], R_DATA[112], R_DATA[111], 
        R_DATA[110], R_DATA[109], R_DATA[108], R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100]}), .B_DOUT({R_DATA[99], 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90], R_DATA[89], 
        R_DATA[88], R_DATA[87], R_DATA[86], R_DATA[85], R_DATA[84], 
        R_DATA[83], R_DATA[82], R_DATA[81], R_DATA[80]}), .DB_DETECT(
        \DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[119], W_DATA[118], W_DATA[117], 
        W_DATA[116], W_DATA[115], W_DATA[114], W_DATA[113], 
        W_DATA[112], W_DATA[111], W_DATA[110], W_DATA[109], 
        W_DATA[108], W_DATA[107], W_DATA[106], W_DATA[105], 
        W_DATA[104], W_DATA[103], W_DATA[102], W_DATA[101], 
        W_DATA[100]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[99], W_DATA[98], 
        W_DATA[97], W_DATA[96], W_DATA[95], W_DATA[94], W_DATA[93], 
        W_DATA[92], W_DATA[91], W_DATA[90], W_DATA[89], W_DATA[88], 
        W_DATA[87], W_DATA[86], W_DATA[85], W_DATA[84], W_DATA[83], 
        W_DATA[82], W_DATA[81], W_DATA[80]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%22%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C22 (.A_DOUT({R_DATA[919], 
        R_DATA[918], R_DATA[917], R_DATA[916], R_DATA[915], 
        R_DATA[914], R_DATA[913], R_DATA[912], R_DATA[911], 
        R_DATA[910], R_DATA[909], R_DATA[908], R_DATA[907], 
        R_DATA[906], R_DATA[905], R_DATA[904], R_DATA[903], 
        R_DATA[902], R_DATA[901], R_DATA[900]}), .B_DOUT({R_DATA[899], 
        R_DATA[898], R_DATA[897], R_DATA[896], R_DATA[895], 
        R_DATA[894], R_DATA[893], R_DATA[892], R_DATA[891], 
        R_DATA[890], R_DATA[889], R_DATA[888], R_DATA[887], 
        R_DATA[886], R_DATA[885], R_DATA[884], R_DATA[883], 
        R_DATA[882], R_DATA[881], R_DATA[880]}), .DB_DETECT(
        \DB_DETECT[0][22] ), .SB_CORRECT(\SB_CORRECT[0][22] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][22] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[919], W_DATA[918], W_DATA[917], 
        W_DATA[916], W_DATA[915], W_DATA[914], W_DATA[913], 
        W_DATA[912], W_DATA[911], W_DATA[910], W_DATA[909], 
        W_DATA[908], W_DATA[907], W_DATA[906], W_DATA[905], 
        W_DATA[904], W_DATA[903], W_DATA[902], W_DATA[901], 
        W_DATA[900]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[899], 
        W_DATA[898], W_DATA[897], W_DATA[896], W_DATA[895], 
        W_DATA[894], W_DATA[893], W_DATA[892], W_DATA[891], 
        W_DATA[890], W_DATA[889], W_DATA[888], W_DATA[887], 
        W_DATA[886], W_DATA[885], W_DATA[884], W_DATA[883], 
        W_DATA[882], W_DATA[881], W_DATA[880]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1152-1152%SPEED%5%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C5 (.A_DOUT({R_DATA[239], 
        R_DATA[238], R_DATA[237], R_DATA[236], R_DATA[235], 
        R_DATA[234], R_DATA[233], R_DATA[232], R_DATA[231], 
        R_DATA[230], R_DATA[229], R_DATA[228], R_DATA[227], 
        R_DATA[226], R_DATA[225], R_DATA[224], R_DATA[223], 
        R_DATA[222], R_DATA[221], R_DATA[220]}), .B_DOUT({R_DATA[219], 
        R_DATA[218], R_DATA[217], R_DATA[216], R_DATA[215], 
        R_DATA[214], R_DATA[213], R_DATA[212], R_DATA[211], 
        R_DATA[210], R_DATA[209], R_DATA[208], R_DATA[207], 
        R_DATA[206], R_DATA[205], R_DATA[204], R_DATA[203], 
        R_DATA[202], R_DATA[201], R_DATA[200]}), .DB_DETECT(
        \DB_DETECT[0][5] ), .SB_CORRECT(\SB_CORRECT[0][5] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[239], W_DATA[238], W_DATA[237], 
        W_DATA[236], W_DATA[235], W_DATA[234], W_DATA[233], 
        W_DATA[232], W_DATA[231], W_DATA[230], W_DATA[229], 
        W_DATA[228], W_DATA[227], W_DATA[226], W_DATA[225], 
        W_DATA[224], W_DATA[223], W_DATA[222], W_DATA[221], 
        W_DATA[220]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[219], 
        W_DATA[218], W_DATA[217], W_DATA[216], W_DATA[215], 
        W_DATA[214], W_DATA[213], W_DATA[212], W_DATA[211], 
        W_DATA[210], W_DATA[209], W_DATA[208], W_DATA[207], 
        W_DATA[206], W_DATA[205], W_DATA[204], W_DATA[203], 
        W_DATA[202], W_DATA[201], W_DATA[200]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1)); 
end
else if (RWIDTH == 1024) begin

    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        \ACCESS_BUSY[0][1] , \SB_CORRECT[0][1] , \DB_DETECT[0][1] , 
        \ACCESS_BUSY[0][2] , \SB_CORRECT[0][2] , \DB_DETECT[0][2] , 
        \ACCESS_BUSY[0][3] , \SB_CORRECT[0][3] , \DB_DETECT[0][3] , 
        \ACCESS_BUSY[0][4] , \SB_CORRECT[0][4] , \DB_DETECT[0][4] , 
        \ACCESS_BUSY[0][5] , \SB_CORRECT[0][5] , \DB_DETECT[0][5] , 
        \ACCESS_BUSY[0][6] , \SB_CORRECT[0][6] , \DB_DETECT[0][6] , 
        \ACCESS_BUSY[0][7] , \SB_CORRECT[0][7] , \DB_DETECT[0][7] , 
        \ACCESS_BUSY[0][8] , \SB_CORRECT[0][8] , \DB_DETECT[0][8] , 
        \ACCESS_BUSY[0][9] , \SB_CORRECT[0][9] , \DB_DETECT[0][9] , 
        \ACCESS_BUSY[0][10] , \SB_CORRECT[0][10] , \DB_DETECT[0][10] , 
        \ACCESS_BUSY[0][11] , \SB_CORRECT[0][11] , \DB_DETECT[0][11] , 
        \ACCESS_BUSY[0][12] , \SB_CORRECT[0][12] , \DB_DETECT[0][12] , 
        \ACCESS_BUSY[0][13] , \SB_CORRECT[0][13] , \DB_DETECT[0][13] , 
        \ACCESS_BUSY[0][14] , \SB_CORRECT[0][14] , \DB_DETECT[0][14] , 
        \ACCESS_BUSY[0][15] , \SB_CORRECT[0][15] , \DB_DETECT[0][15] , 
        \ACCESS_BUSY[0][16] , \SB_CORRECT[0][16] , \DB_DETECT[0][16] , 
        \ACCESS_BUSY[0][17] , \SB_CORRECT[0][17] , \DB_DETECT[0][17] , 
        \ACCESS_BUSY[0][18] , \SB_CORRECT[0][18] , \DB_DETECT[0][18] , 
        \ACCESS_BUSY[0][19] , \SB_CORRECT[0][19] , \DB_DETECT[0][19] , 
        \ACCESS_BUSY[0][20] , \SB_CORRECT[0][20] , \DB_DETECT[0][20] , 
        \ACCESS_BUSY[0][21] , \SB_CORRECT[0][21] , \DB_DETECT[0][21] , 
        \ACCESS_BUSY[0][22] , \SB_CORRECT[0][22] , \DB_DETECT[0][22] , 
        \ACCESS_BUSY[0][23] , \SB_CORRECT[0][23] , \DB_DETECT[0][23] , 
        \ACCESS_BUSY[0][24] , \SB_CORRECT[0][24] , \DB_DETECT[0][24] , 
        \ACCESS_BUSY[0][25] , \SB_CORRECT[0][25] , \DB_DETECT[0][25] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%24%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C24 (.A_DOUT({R_DATA[999], 
        R_DATA[998], R_DATA[997], R_DATA[996], R_DATA[995], 
        R_DATA[994], R_DATA[993], R_DATA[992], R_DATA[991], 
        R_DATA[990], R_DATA[989], R_DATA[988], R_DATA[987], 
        R_DATA[986], R_DATA[985], R_DATA[984], R_DATA[983], 
        R_DATA[982], R_DATA[981], R_DATA[980]}), .B_DOUT({R_DATA[979], 
        R_DATA[978], R_DATA[977], R_DATA[976], R_DATA[975], 
        R_DATA[974], R_DATA[973], R_DATA[972], R_DATA[971], 
        R_DATA[970], R_DATA[969], R_DATA[968], R_DATA[967], 
        R_DATA[966], R_DATA[965], R_DATA[964], R_DATA[963], 
        R_DATA[962], R_DATA[961], R_DATA[960]}), .DB_DETECT(
        \DB_DETECT[0][24] ), .SB_CORRECT(\SB_CORRECT[0][24] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][24] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[999], W_DATA[998], W_DATA[997], 
        W_DATA[996], W_DATA[995], W_DATA[994], W_DATA[993], 
        W_DATA[992], W_DATA[991], W_DATA[990], W_DATA[989], 
        W_DATA[988], W_DATA[987], W_DATA[986], W_DATA[985], 
        W_DATA[984], W_DATA[983], W_DATA[982], W_DATA[981], 
        W_DATA[980]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[979], 
        W_DATA[978], W_DATA[977], W_DATA[976], W_DATA[975], 
        W_DATA[974], W_DATA[973], W_DATA[972], W_DATA[971], 
        W_DATA[970], W_DATA[969], W_DATA[968], W_DATA[967], 
        W_DATA[966], W_DATA[965], W_DATA[964], W_DATA[963], 
        W_DATA[962], W_DATA[961], W_DATA[960]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%9%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C9 (.A_DOUT({R_DATA[399], 
        R_DATA[398], R_DATA[397], R_DATA[396], R_DATA[395], 
        R_DATA[394], R_DATA[393], R_DATA[392], R_DATA[391], 
        R_DATA[390], R_DATA[389], R_DATA[388], R_DATA[387], 
        R_DATA[386], R_DATA[385], R_DATA[384], R_DATA[383], 
        R_DATA[382], R_DATA[381], R_DATA[380]}), .B_DOUT({R_DATA[379], 
        R_DATA[378], R_DATA[377], R_DATA[376], R_DATA[375], 
        R_DATA[374], R_DATA[373], R_DATA[372], R_DATA[371], 
        R_DATA[370], R_DATA[369], R_DATA[368], R_DATA[367], 
        R_DATA[366], R_DATA[365], R_DATA[364], R_DATA[363], 
        R_DATA[362], R_DATA[361], R_DATA[360]}), .DB_DETECT(
        \DB_DETECT[0][9] ), .SB_CORRECT(\SB_CORRECT[0][9] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][9] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[399], W_DATA[398], W_DATA[397], 
        W_DATA[396], W_DATA[395], W_DATA[394], W_DATA[393], 
        W_DATA[392], W_DATA[391], W_DATA[390], W_DATA[389], 
        W_DATA[388], W_DATA[387], W_DATA[386], W_DATA[385], 
        W_DATA[384], W_DATA[383], W_DATA[382], W_DATA[381], 
        W_DATA[380]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[379], 
        W_DATA[378], W_DATA[377], W_DATA[376], W_DATA[375], 
        W_DATA[374], W_DATA[373], W_DATA[372], W_DATA[371], 
        W_DATA[370], W_DATA[369], W_DATA[368], W_DATA[367], 
        W_DATA[366], W_DATA[365], W_DATA[364], W_DATA[363], 
        W_DATA[362], W_DATA[361], W_DATA[360]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%15%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C15 (.A_DOUT({R_DATA[639], 
        R_DATA[638], R_DATA[637], R_DATA[636], R_DATA[635], 
        R_DATA[634], R_DATA[633], R_DATA[632], R_DATA[631], 
        R_DATA[630], R_DATA[629], R_DATA[628], R_DATA[627], 
        R_DATA[626], R_DATA[625], R_DATA[624], R_DATA[623], 
        R_DATA[622], R_DATA[621], R_DATA[620]}), .B_DOUT({R_DATA[619], 
        R_DATA[618], R_DATA[617], R_DATA[616], R_DATA[615], 
        R_DATA[614], R_DATA[613], R_DATA[612], R_DATA[611], 
        R_DATA[610], R_DATA[609], R_DATA[608], R_DATA[607], 
        R_DATA[606], R_DATA[605], R_DATA[604], R_DATA[603], 
        R_DATA[602], R_DATA[601], R_DATA[600]}), .DB_DETECT(
        \DB_DETECT[0][15] ), .SB_CORRECT(\SB_CORRECT[0][15] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][15] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[639], W_DATA[638], W_DATA[637], 
        W_DATA[636], W_DATA[635], W_DATA[634], W_DATA[633], 
        W_DATA[632], W_DATA[631], W_DATA[630], W_DATA[629], 
        W_DATA[628], W_DATA[627], W_DATA[626], W_DATA[625], 
        W_DATA[624], W_DATA[623], W_DATA[622], W_DATA[621], 
        W_DATA[620]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[619], 
        W_DATA[618], W_DATA[617], W_DATA[616], W_DATA[615], 
        W_DATA[614], W_DATA[613], W_DATA[612], W_DATA[611], 
        W_DATA[610], W_DATA[609], W_DATA[608], W_DATA[607], 
        W_DATA[606], W_DATA[605], W_DATA[604], W_DATA[603], 
        W_DATA[602], W_DATA[601], W_DATA[600]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%3%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C3 (.A_DOUT({R_DATA[159], 
        R_DATA[158], R_DATA[157], R_DATA[156], R_DATA[155], 
        R_DATA[154], R_DATA[153], R_DATA[152], R_DATA[151], 
        R_DATA[150], R_DATA[149], R_DATA[148], R_DATA[147], 
        R_DATA[146], R_DATA[145], R_DATA[144], R_DATA[143], 
        R_DATA[142], R_DATA[141], R_DATA[140]}), .B_DOUT({R_DATA[139], 
        R_DATA[138], R_DATA[137], R_DATA[136], R_DATA[135], 
        R_DATA[134], R_DATA[133], R_DATA[132], R_DATA[131], 
        R_DATA[130], R_DATA[129], R_DATA[128], R_DATA[127], 
        R_DATA[126], R_DATA[125], R_DATA[124], R_DATA[123], 
        R_DATA[122], R_DATA[121], R_DATA[120]}), .DB_DETECT(
        \DB_DETECT[0][3] ), .SB_CORRECT(\SB_CORRECT[0][3] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][3] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[159], W_DATA[158], W_DATA[157], 
        W_DATA[156], W_DATA[155], W_DATA[154], W_DATA[153], 
        W_DATA[152], W_DATA[151], W_DATA[150], W_DATA[149], 
        W_DATA[148], W_DATA[147], W_DATA[146], W_DATA[145], 
        W_DATA[144], W_DATA[143], W_DATA[142], W_DATA[141], 
        W_DATA[140]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[139], 
        W_DATA[138], W_DATA[137], W_DATA[136], W_DATA[135], 
        W_DATA[134], W_DATA[133], W_DATA[132], W_DATA[131], 
        W_DATA[130], W_DATA[129], W_DATA[128], W_DATA[127], 
        W_DATA[126], W_DATA[125], W_DATA[124], W_DATA[123], 
        W_DATA[122], W_DATA[121], W_DATA[120]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%25%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C25 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, R_DATA[1023], R_DATA[1022], R_DATA[1021], 
        R_DATA[1020]}), .B_DOUT({R_DATA[1019], R_DATA[1018], 
        R_DATA[1017], R_DATA[1016], R_DATA[1015], R_DATA[1014], 
        R_DATA[1013], R_DATA[1012], R_DATA[1011], R_DATA[1010], 
        R_DATA[1009], R_DATA[1008], R_DATA[1007], R_DATA[1006], 
        R_DATA[1005], R_DATA[1004], R_DATA[1003], R_DATA[1002], 
        R_DATA[1001], R_DATA[1000]}), .DB_DETECT(\DB_DETECT[0][25] ), 
        .SB_CORRECT(\SB_CORRECT[0][25] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][25] ), .A_ADDR({GND, GND, GND, R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), 
        .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, W_DATA[1023], W_DATA[1022], 
        W_DATA[1021], W_DATA[1020]}), .A_REN(R_EN), .A_WEN({GND, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[1019], 
        W_DATA[1018], W_DATA[1017], W_DATA[1016], W_DATA[1015], 
        W_DATA[1014], W_DATA[1013], W_DATA[1012], W_DATA[1011], 
        W_DATA[1010], W_DATA[1009], W_DATA[1008], W_DATA[1007], 
        W_DATA[1006], W_DATA[1005], W_DATA[1004], W_DATA[1003], 
        W_DATA[1002], W_DATA[1001], W_DATA[1000]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%18%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C18 (.A_DOUT({R_DATA[759], 
        R_DATA[758], R_DATA[757], R_DATA[756], R_DATA[755], 
        R_DATA[754], R_DATA[753], R_DATA[752], R_DATA[751], 
        R_DATA[750], R_DATA[749], R_DATA[748], R_DATA[747], 
        R_DATA[746], R_DATA[745], R_DATA[744], R_DATA[743], 
        R_DATA[742], R_DATA[741], R_DATA[740]}), .B_DOUT({R_DATA[739], 
        R_DATA[738], R_DATA[737], R_DATA[736], R_DATA[735], 
        R_DATA[734], R_DATA[733], R_DATA[732], R_DATA[731], 
        R_DATA[730], R_DATA[729], R_DATA[728], R_DATA[727], 
        R_DATA[726], R_DATA[725], R_DATA[724], R_DATA[723], 
        R_DATA[722], R_DATA[721], R_DATA[720]}), .DB_DETECT(
        \DB_DETECT[0][18] ), .SB_CORRECT(\SB_CORRECT[0][18] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][18] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[759], W_DATA[758], W_DATA[757], 
        W_DATA[756], W_DATA[755], W_DATA[754], W_DATA[753], 
        W_DATA[752], W_DATA[751], W_DATA[750], W_DATA[749], 
        W_DATA[748], W_DATA[747], W_DATA[746], W_DATA[745], 
        W_DATA[744], W_DATA[743], W_DATA[742], W_DATA[741], 
        W_DATA[740]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[739], 
        W_DATA[738], W_DATA[737], W_DATA[736], W_DATA[735], 
        W_DATA[734], W_DATA[733], W_DATA[732], W_DATA[731], 
        W_DATA[730], W_DATA[729], W_DATA[728], W_DATA[727], 
        W_DATA[726], W_DATA[725], W_DATA[724], W_DATA[723], 
        W_DATA[722], W_DATA[721], W_DATA[720]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%11%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C11 (.A_DOUT({R_DATA[479], 
        R_DATA[478], R_DATA[477], R_DATA[476], R_DATA[475], 
        R_DATA[474], R_DATA[473], R_DATA[472], R_DATA[471], 
        R_DATA[470], R_DATA[469], R_DATA[468], R_DATA[467], 
        R_DATA[466], R_DATA[465], R_DATA[464], R_DATA[463], 
        R_DATA[462], R_DATA[461], R_DATA[460]}), .B_DOUT({R_DATA[459], 
        R_DATA[458], R_DATA[457], R_DATA[456], R_DATA[455], 
        R_DATA[454], R_DATA[453], R_DATA[452], R_DATA[451], 
        R_DATA[450], R_DATA[449], R_DATA[448], R_DATA[447], 
        R_DATA[446], R_DATA[445], R_DATA[444], R_DATA[443], 
        R_DATA[442], R_DATA[441], R_DATA[440]}), .DB_DETECT(
        \DB_DETECT[0][11] ), .SB_CORRECT(\SB_CORRECT[0][11] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][11] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[479], W_DATA[478], W_DATA[477], 
        W_DATA[476], W_DATA[475], W_DATA[474], W_DATA[473], 
        W_DATA[472], W_DATA[471], W_DATA[470], W_DATA[469], 
        W_DATA[468], W_DATA[467], W_DATA[466], W_DATA[465], 
        W_DATA[464], W_DATA[463], W_DATA[462], W_DATA[461], 
        W_DATA[460]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[459], 
        W_DATA[458], W_DATA[457], W_DATA[456], W_DATA[455], 
        W_DATA[454], W_DATA[453], W_DATA[452], W_DATA[451], 
        W_DATA[450], W_DATA[449], W_DATA[448], W_DATA[447], 
        W_DATA[446], W_DATA[445], W_DATA[444], W_DATA[443], 
        W_DATA[442], W_DATA[441], W_DATA[440]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({R_DATA[39], 
        R_DATA[38], R_DATA[37], R_DATA[36], R_DATA[35], R_DATA[34], 
        R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], R_DATA[29], 
        R_DATA[28], R_DATA[27], R_DATA[26], R_DATA[25], R_DATA[24], 
        R_DATA[23], R_DATA[22], R_DATA[21], R_DATA[20]}), .B_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[39], W_DATA[38], W_DATA[37], 
        W_DATA[36], W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%19%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C19 (.A_DOUT({R_DATA[799], 
        R_DATA[798], R_DATA[797], R_DATA[796], R_DATA[795], 
        R_DATA[794], R_DATA[793], R_DATA[792], R_DATA[791], 
        R_DATA[790], R_DATA[789], R_DATA[788], R_DATA[787], 
        R_DATA[786], R_DATA[785], R_DATA[784], R_DATA[783], 
        R_DATA[782], R_DATA[781], R_DATA[780]}), .B_DOUT({R_DATA[779], 
        R_DATA[778], R_DATA[777], R_DATA[776], R_DATA[775], 
        R_DATA[774], R_DATA[773], R_DATA[772], R_DATA[771], 
        R_DATA[770], R_DATA[769], R_DATA[768], R_DATA[767], 
        R_DATA[766], R_DATA[765], R_DATA[764], R_DATA[763], 
        R_DATA[762], R_DATA[761], R_DATA[760]}), .DB_DETECT(
        \DB_DETECT[0][19] ), .SB_CORRECT(\SB_CORRECT[0][19] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][19] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[799], W_DATA[798], W_DATA[797], 
        W_DATA[796], W_DATA[795], W_DATA[794], W_DATA[793], 
        W_DATA[792], W_DATA[791], W_DATA[790], W_DATA[789], 
        W_DATA[788], W_DATA[787], W_DATA[786], W_DATA[785], 
        W_DATA[784], W_DATA[783], W_DATA[782], W_DATA[781], 
        W_DATA[780]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[779], 
        W_DATA[778], W_DATA[777], W_DATA[776], W_DATA[775], 
        W_DATA[774], W_DATA[773], W_DATA[772], W_DATA[771], 
        W_DATA[770], W_DATA[769], W_DATA[768], W_DATA[767], 
        W_DATA[766], W_DATA[765], W_DATA[764], W_DATA[763], 
        W_DATA[762], W_DATA[761], W_DATA[760]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%21%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C21 (.A_DOUT({R_DATA[879], 
        R_DATA[878], R_DATA[877], R_DATA[876], R_DATA[875], 
        R_DATA[874], R_DATA[873], R_DATA[872], R_DATA[871], 
        R_DATA[870], R_DATA[869], R_DATA[868], R_DATA[867], 
        R_DATA[866], R_DATA[865], R_DATA[864], R_DATA[863], 
        R_DATA[862], R_DATA[861], R_DATA[860]}), .B_DOUT({R_DATA[859], 
        R_DATA[858], R_DATA[857], R_DATA[856], R_DATA[855], 
        R_DATA[854], R_DATA[853], R_DATA[852], R_DATA[851], 
        R_DATA[850], R_DATA[849], R_DATA[848], R_DATA[847], 
        R_DATA[846], R_DATA[845], R_DATA[844], R_DATA[843], 
        R_DATA[842], R_DATA[841], R_DATA[840]}), .DB_DETECT(
        \DB_DETECT[0][21] ), .SB_CORRECT(\SB_CORRECT[0][21] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][21] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[879], W_DATA[878], W_DATA[877], 
        W_DATA[876], W_DATA[875], W_DATA[874], W_DATA[873], 
        W_DATA[872], W_DATA[871], W_DATA[870], W_DATA[869], 
        W_DATA[868], W_DATA[867], W_DATA[866], W_DATA[865], 
        W_DATA[864], W_DATA[863], W_DATA[862], W_DATA[861], 
        W_DATA[860]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[859], 
        W_DATA[858], W_DATA[857], W_DATA[856], W_DATA[855], 
        W_DATA[854], W_DATA[853], W_DATA[852], W_DATA[851], 
        W_DATA[850], W_DATA[849], W_DATA[848], W_DATA[847], 
        W_DATA[846], W_DATA[845], W_DATA[844], W_DATA[843], 
        W_DATA[842], W_DATA[841], W_DATA[840]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%13%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C13 (.A_DOUT({R_DATA[559], 
        R_DATA[558], R_DATA[557], R_DATA[556], R_DATA[555], 
        R_DATA[554], R_DATA[553], R_DATA[552], R_DATA[551], 
        R_DATA[550], R_DATA[549], R_DATA[548], R_DATA[547], 
        R_DATA[546], R_DATA[545], R_DATA[544], R_DATA[543], 
        R_DATA[542], R_DATA[541], R_DATA[540]}), .B_DOUT({R_DATA[539], 
        R_DATA[538], R_DATA[537], R_DATA[536], R_DATA[535], 
        R_DATA[534], R_DATA[533], R_DATA[532], R_DATA[531], 
        R_DATA[530], R_DATA[529], R_DATA[528], R_DATA[527], 
        R_DATA[526], R_DATA[525], R_DATA[524], R_DATA[523], 
        R_DATA[522], R_DATA[521], R_DATA[520]}), .DB_DETECT(
        \DB_DETECT[0][13] ), .SB_CORRECT(\SB_CORRECT[0][13] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][13] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[559], W_DATA[558], W_DATA[557], 
        W_DATA[556], W_DATA[555], W_DATA[554], W_DATA[553], 
        W_DATA[552], W_DATA[551], W_DATA[550], W_DATA[549], 
        W_DATA[548], W_DATA[547], W_DATA[546], W_DATA[545], 
        W_DATA[544], W_DATA[543], W_DATA[542], W_DATA[541], 
        W_DATA[540]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[539], 
        W_DATA[538], W_DATA[537], W_DATA[536], W_DATA[535], 
        W_DATA[534], W_DATA[533], W_DATA[532], W_DATA[531], 
        W_DATA[530], W_DATA[529], W_DATA[528], W_DATA[527], 
        W_DATA[526], W_DATA[525], W_DATA[524], W_DATA[523], 
        W_DATA[522], W_DATA[521], W_DATA[520]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%17%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C17 (.A_DOUT({R_DATA[719], 
        R_DATA[718], R_DATA[717], R_DATA[716], R_DATA[715], 
        R_DATA[714], R_DATA[713], R_DATA[712], R_DATA[711], 
        R_DATA[710], R_DATA[709], R_DATA[708], R_DATA[707], 
        R_DATA[706], R_DATA[705], R_DATA[704], R_DATA[703], 
        R_DATA[702], R_DATA[701], R_DATA[700]}), .B_DOUT({R_DATA[699], 
        R_DATA[698], R_DATA[697], R_DATA[696], R_DATA[695], 
        R_DATA[694], R_DATA[693], R_DATA[692], R_DATA[691], 
        R_DATA[690], R_DATA[689], R_DATA[688], R_DATA[687], 
        R_DATA[686], R_DATA[685], R_DATA[684], R_DATA[683], 
        R_DATA[682], R_DATA[681], R_DATA[680]}), .DB_DETECT(
        \DB_DETECT[0][17] ), .SB_CORRECT(\SB_CORRECT[0][17] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][17] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[719], W_DATA[718], W_DATA[717], 
        W_DATA[716], W_DATA[715], W_DATA[714], W_DATA[713], 
        W_DATA[712], W_DATA[711], W_DATA[710], W_DATA[709], 
        W_DATA[708], W_DATA[707], W_DATA[706], W_DATA[705], 
        W_DATA[704], W_DATA[703], W_DATA[702], W_DATA[701], 
        W_DATA[700]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[699], 
        W_DATA[698], W_DATA[697], W_DATA[696], W_DATA[695], 
        W_DATA[694], W_DATA[693], W_DATA[692], W_DATA[691], 
        W_DATA[690], W_DATA[689], W_DATA[688], W_DATA[687], 
        W_DATA[686], W_DATA[685], W_DATA[684], W_DATA[683], 
        W_DATA[682], W_DATA[681], W_DATA[680]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%10%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C10 (.A_DOUT({R_DATA[439], 
        R_DATA[438], R_DATA[437], R_DATA[436], R_DATA[435], 
        R_DATA[434], R_DATA[433], R_DATA[432], R_DATA[431], 
        R_DATA[430], R_DATA[429], R_DATA[428], R_DATA[427], 
        R_DATA[426], R_DATA[425], R_DATA[424], R_DATA[423], 
        R_DATA[422], R_DATA[421], R_DATA[420]}), .B_DOUT({R_DATA[419], 
        R_DATA[418], R_DATA[417], R_DATA[416], R_DATA[415], 
        R_DATA[414], R_DATA[413], R_DATA[412], R_DATA[411], 
        R_DATA[410], R_DATA[409], R_DATA[408], R_DATA[407], 
        R_DATA[406], R_DATA[405], R_DATA[404], R_DATA[403], 
        R_DATA[402], R_DATA[401], R_DATA[400]}), .DB_DETECT(
        \DB_DETECT[0][10] ), .SB_CORRECT(\SB_CORRECT[0][10] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][10] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[439], W_DATA[438], W_DATA[437], 
        W_DATA[436], W_DATA[435], W_DATA[434], W_DATA[433], 
        W_DATA[432], W_DATA[431], W_DATA[430], W_DATA[429], 
        W_DATA[428], W_DATA[427], W_DATA[426], W_DATA[425], 
        W_DATA[424], W_DATA[423], W_DATA[422], W_DATA[421], 
        W_DATA[420]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[419], 
        W_DATA[418], W_DATA[417], W_DATA[416], W_DATA[415], 
        W_DATA[414], W_DATA[413], W_DATA[412], W_DATA[411], 
        W_DATA[410], W_DATA[409], W_DATA[408], W_DATA[407], 
        W_DATA[406], W_DATA[405], W_DATA[404], W_DATA[403], 
        W_DATA[402], W_DATA[401], W_DATA[400]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%23%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C23 (.A_DOUT({R_DATA[959], 
        R_DATA[958], R_DATA[957], R_DATA[956], R_DATA[955], 
        R_DATA[954], R_DATA[953], R_DATA[952], R_DATA[951], 
        R_DATA[950], R_DATA[949], R_DATA[948], R_DATA[947], 
        R_DATA[946], R_DATA[945], R_DATA[944], R_DATA[943], 
        R_DATA[942], R_DATA[941], R_DATA[940]}), .B_DOUT({R_DATA[939], 
        R_DATA[938], R_DATA[937], R_DATA[936], R_DATA[935], 
        R_DATA[934], R_DATA[933], R_DATA[932], R_DATA[931], 
        R_DATA[930], R_DATA[929], R_DATA[928], R_DATA[927], 
        R_DATA[926], R_DATA[925], R_DATA[924], R_DATA[923], 
        R_DATA[922], R_DATA[921], R_DATA[920]}), .DB_DETECT(
        \DB_DETECT[0][23] ), .SB_CORRECT(\SB_CORRECT[0][23] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][23] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[959], W_DATA[958], W_DATA[957], 
        W_DATA[956], W_DATA[955], W_DATA[954], W_DATA[953], 
        W_DATA[952], W_DATA[951], W_DATA[950], W_DATA[949], 
        W_DATA[948], W_DATA[947], W_DATA[946], W_DATA[945], 
        W_DATA[944], W_DATA[943], W_DATA[942], W_DATA[941], 
        W_DATA[940]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[939], 
        W_DATA[938], W_DATA[937], W_DATA[936], W_DATA[935], 
        W_DATA[934], W_DATA[933], W_DATA[932], W_DATA[931], 
        W_DATA[930], W_DATA[929], W_DATA[928], W_DATA[927], 
        W_DATA[926], W_DATA[925], W_DATA[924], W_DATA[923], 
        W_DATA[922], W_DATA[921], W_DATA[920]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%20%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C20 (.A_DOUT({R_DATA[839], 
        R_DATA[838], R_DATA[837], R_DATA[836], R_DATA[835], 
        R_DATA[834], R_DATA[833], R_DATA[832], R_DATA[831], 
        R_DATA[830], R_DATA[829], R_DATA[828], R_DATA[827], 
        R_DATA[826], R_DATA[825], R_DATA[824], R_DATA[823], 
        R_DATA[822], R_DATA[821], R_DATA[820]}), .B_DOUT({R_DATA[819], 
        R_DATA[818], R_DATA[817], R_DATA[816], R_DATA[815], 
        R_DATA[814], R_DATA[813], R_DATA[812], R_DATA[811], 
        R_DATA[810], R_DATA[809], R_DATA[808], R_DATA[807], 
        R_DATA[806], R_DATA[805], R_DATA[804], R_DATA[803], 
        R_DATA[802], R_DATA[801], R_DATA[800]}), .DB_DETECT(
        \DB_DETECT[0][20] ), .SB_CORRECT(\SB_CORRECT[0][20] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][20] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[839], W_DATA[838], W_DATA[837], 
        W_DATA[836], W_DATA[835], W_DATA[834], W_DATA[833], 
        W_DATA[832], W_DATA[831], W_DATA[830], W_DATA[829], 
        W_DATA[828], W_DATA[827], W_DATA[826], W_DATA[825], 
        W_DATA[824], W_DATA[823], W_DATA[822], W_DATA[821], 
        W_DATA[820]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[819], 
        W_DATA[818], W_DATA[817], W_DATA[816], W_DATA[815], 
        W_DATA[814], W_DATA[813], W_DATA[812], W_DATA[811], 
        W_DATA[810], W_DATA[809], W_DATA[808], W_DATA[807], 
        W_DATA[806], W_DATA[805], W_DATA[804], W_DATA[803], 
        W_DATA[802], W_DATA[801], W_DATA[800]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%4%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C4 (.A_DOUT({R_DATA[199], 
        R_DATA[198], R_DATA[197], R_DATA[196], R_DATA[195], 
        R_DATA[194], R_DATA[193], R_DATA[192], R_DATA[191], 
        R_DATA[190], R_DATA[189], R_DATA[188], R_DATA[187], 
        R_DATA[186], R_DATA[185], R_DATA[184], R_DATA[183], 
        R_DATA[182], R_DATA[181], R_DATA[180]}), .B_DOUT({R_DATA[179], 
        R_DATA[178], R_DATA[177], R_DATA[176], R_DATA[175], 
        R_DATA[174], R_DATA[173], R_DATA[172], R_DATA[171], 
        R_DATA[170], R_DATA[169], R_DATA[168], R_DATA[167], 
        R_DATA[166], R_DATA[165], R_DATA[164], R_DATA[163], 
        R_DATA[162], R_DATA[161], R_DATA[160]}), .DB_DETECT(
        \DB_DETECT[0][4] ), .SB_CORRECT(\SB_CORRECT[0][4] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][4] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[199], W_DATA[198], W_DATA[197], 
        W_DATA[196], W_DATA[195], W_DATA[194], W_DATA[193], 
        W_DATA[192], W_DATA[191], W_DATA[190], W_DATA[189], 
        W_DATA[188], W_DATA[187], W_DATA[186], W_DATA[185], 
        W_DATA[184], W_DATA[183], W_DATA[182], W_DATA[181], 
        W_DATA[180]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[179], 
        W_DATA[178], W_DATA[177], W_DATA[176], W_DATA[175], 
        W_DATA[174], W_DATA[173], W_DATA[172], W_DATA[171], 
        W_DATA[170], W_DATA[169], W_DATA[168], W_DATA[167], 
        W_DATA[166], W_DATA[165], W_DATA[164], W_DATA[163], 
        W_DATA[162], W_DATA[161], W_DATA[160]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%8%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C8 (.A_DOUT({R_DATA[359], 
        R_DATA[358], R_DATA[357], R_DATA[356], R_DATA[355], 
        R_DATA[354], R_DATA[353], R_DATA[352], R_DATA[351], 
        R_DATA[350], R_DATA[349], R_DATA[348], R_DATA[347], 
        R_DATA[346], R_DATA[345], R_DATA[344], R_DATA[343], 
        R_DATA[342], R_DATA[341], R_DATA[340]}), .B_DOUT({R_DATA[339], 
        R_DATA[338], R_DATA[337], R_DATA[336], R_DATA[335], 
        R_DATA[334], R_DATA[333], R_DATA[332], R_DATA[331], 
        R_DATA[330], R_DATA[329], R_DATA[328], R_DATA[327], 
        R_DATA[326], R_DATA[325], R_DATA[324], R_DATA[323], 
        R_DATA[322], R_DATA[321], R_DATA[320]}), .DB_DETECT(
        \DB_DETECT[0][8] ), .SB_CORRECT(\SB_CORRECT[0][8] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][8] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[359], W_DATA[358], W_DATA[357], 
        W_DATA[356], W_DATA[355], W_DATA[354], W_DATA[353], 
        W_DATA[352], W_DATA[351], W_DATA[350], W_DATA[349], 
        W_DATA[348], W_DATA[347], W_DATA[346], W_DATA[345], 
        W_DATA[344], W_DATA[343], W_DATA[342], W_DATA[341], 
        W_DATA[340]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[339], 
        W_DATA[338], W_DATA[337], W_DATA[336], W_DATA[335], 
        W_DATA[334], W_DATA[333], W_DATA[332], W_DATA[331], 
        W_DATA[330], W_DATA[329], W_DATA[328], W_DATA[327], 
        W_DATA[326], W_DATA[325], W_DATA[324], W_DATA[323], 
        W_DATA[322], W_DATA[321], W_DATA[320]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%6%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C6 (.A_DOUT({R_DATA[279], 
        R_DATA[278], R_DATA[277], R_DATA[276], R_DATA[275], 
        R_DATA[274], R_DATA[273], R_DATA[272], R_DATA[271], 
        R_DATA[270], R_DATA[269], R_DATA[268], R_DATA[267], 
        R_DATA[266], R_DATA[265], R_DATA[264], R_DATA[263], 
        R_DATA[262], R_DATA[261], R_DATA[260]}), .B_DOUT({R_DATA[259], 
        R_DATA[258], R_DATA[257], R_DATA[256], R_DATA[255], 
        R_DATA[254], R_DATA[253], R_DATA[252], R_DATA[251], 
        R_DATA[250], R_DATA[249], R_DATA[248], R_DATA[247], 
        R_DATA[246], R_DATA[245], R_DATA[244], R_DATA[243], 
        R_DATA[242], R_DATA[241], R_DATA[240]}), .DB_DETECT(
        \DB_DETECT[0][6] ), .SB_CORRECT(\SB_CORRECT[0][6] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][6] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[279], W_DATA[278], W_DATA[277], 
        W_DATA[276], W_DATA[275], W_DATA[274], W_DATA[273], 
        W_DATA[272], W_DATA[271], W_DATA[270], W_DATA[269], 
        W_DATA[268], W_DATA[267], W_DATA[266], W_DATA[265], 
        W_DATA[264], W_DATA[263], W_DATA[262], W_DATA[261], 
        W_DATA[260]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[259], 
        W_DATA[258], W_DATA[257], W_DATA[256], W_DATA[255], 
        W_DATA[254], W_DATA[253], W_DATA[252], W_DATA[251], 
        W_DATA[250], W_DATA[249], W_DATA[248], W_DATA[247], 
        W_DATA[246], W_DATA[245], W_DATA[244], W_DATA[243], 
        W_DATA[242], W_DATA[241], W_DATA[240]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%1%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C1 (.A_DOUT({R_DATA[79], 
        R_DATA[78], R_DATA[77], R_DATA[76], R_DATA[75], R_DATA[74], 
        R_DATA[73], R_DATA[72], R_DATA[71], R_DATA[70], R_DATA[69], 
        R_DATA[68], R_DATA[67], R_DATA[66], R_DATA[65], R_DATA[64], 
        R_DATA[63], R_DATA[62], R_DATA[61], R_DATA[60]}), .B_DOUT({
        R_DATA[59], R_DATA[58], R_DATA[57], R_DATA[56], R_DATA[55], 
        R_DATA[54], R_DATA[53], R_DATA[52], R_DATA[51], R_DATA[50], 
        R_DATA[49], R_DATA[48], R_DATA[47], R_DATA[46], R_DATA[45], 
        R_DATA[44], R_DATA[43], R_DATA[42], R_DATA[41], R_DATA[40]}), 
        .DB_DETECT(\DB_DETECT[0][1] ), .SB_CORRECT(\SB_CORRECT[0][1] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][1] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[79], W_DATA[78], W_DATA[77], 
        W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72], 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], W_DATA[62], 
        W_DATA[61], W_DATA[60]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[59], 
        W_DATA[58], W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54], 
        W_DATA[53], W_DATA[52], W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%12%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C12 (.A_DOUT({R_DATA[519], 
        R_DATA[518], R_DATA[517], R_DATA[516], R_DATA[515], 
        R_DATA[514], R_DATA[513], R_DATA[512], R_DATA[511], 
        R_DATA[510], R_DATA[509], R_DATA[508], R_DATA[507], 
        R_DATA[506], R_DATA[505], R_DATA[504], R_DATA[503], 
        R_DATA[502], R_DATA[501], R_DATA[500]}), .B_DOUT({R_DATA[499], 
        R_DATA[498], R_DATA[497], R_DATA[496], R_DATA[495], 
        R_DATA[494], R_DATA[493], R_DATA[492], R_DATA[491], 
        R_DATA[490], R_DATA[489], R_DATA[488], R_DATA[487], 
        R_DATA[486], R_DATA[485], R_DATA[484], R_DATA[483], 
        R_DATA[482], R_DATA[481], R_DATA[480]}), .DB_DETECT(
        \DB_DETECT[0][12] ), .SB_CORRECT(\SB_CORRECT[0][12] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][12] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[519], W_DATA[518], W_DATA[517], 
        W_DATA[516], W_DATA[515], W_DATA[514], W_DATA[513], 
        W_DATA[512], W_DATA[511], W_DATA[510], W_DATA[509], 
        W_DATA[508], W_DATA[507], W_DATA[506], W_DATA[505], 
        W_DATA[504], W_DATA[503], W_DATA[502], W_DATA[501], 
        W_DATA[500]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[499], 
        W_DATA[498], W_DATA[497], W_DATA[496], W_DATA[495], 
        W_DATA[494], W_DATA[493], W_DATA[492], W_DATA[491], 
        W_DATA[490], W_DATA[489], W_DATA[488], W_DATA[487], 
        W_DATA[486], W_DATA[485], W_DATA[484], W_DATA[483], 
        W_DATA[482], W_DATA[481], W_DATA[480]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%14%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C14 (.A_DOUT({R_DATA[599], 
        R_DATA[598], R_DATA[597], R_DATA[596], R_DATA[595], 
        R_DATA[594], R_DATA[593], R_DATA[592], R_DATA[591], 
        R_DATA[590], R_DATA[589], R_DATA[588], R_DATA[587], 
        R_DATA[586], R_DATA[585], R_DATA[584], R_DATA[583], 
        R_DATA[582], R_DATA[581], R_DATA[580]}), .B_DOUT({R_DATA[579], 
        R_DATA[578], R_DATA[577], R_DATA[576], R_DATA[575], 
        R_DATA[574], R_DATA[573], R_DATA[572], R_DATA[571], 
        R_DATA[570], R_DATA[569], R_DATA[568], R_DATA[567], 
        R_DATA[566], R_DATA[565], R_DATA[564], R_DATA[563], 
        R_DATA[562], R_DATA[561], R_DATA[560]}), .DB_DETECT(
        \DB_DETECT[0][14] ), .SB_CORRECT(\SB_CORRECT[0][14] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][14] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[599], W_DATA[598], W_DATA[597], 
        W_DATA[596], W_DATA[595], W_DATA[594], W_DATA[593], 
        W_DATA[592], W_DATA[591], W_DATA[590], W_DATA[589], 
        W_DATA[588], W_DATA[587], W_DATA[586], W_DATA[585], 
        W_DATA[584], W_DATA[583], W_DATA[582], W_DATA[581], 
        W_DATA[580]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[579], 
        W_DATA[578], W_DATA[577], W_DATA[576], W_DATA[575], 
        W_DATA[574], W_DATA[573], W_DATA[572], W_DATA[571], 
        W_DATA[570], W_DATA[569], W_DATA[568], W_DATA[567], 
        W_DATA[566], W_DATA[565], W_DATA[564], W_DATA[563], 
        W_DATA[562], W_DATA[561], W_DATA[560]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%7%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C7 (.A_DOUT({R_DATA[319], 
        R_DATA[318], R_DATA[317], R_DATA[316], R_DATA[315], 
        R_DATA[314], R_DATA[313], R_DATA[312], R_DATA[311], 
        R_DATA[310], R_DATA[309], R_DATA[308], R_DATA[307], 
        R_DATA[306], R_DATA[305], R_DATA[304], R_DATA[303], 
        R_DATA[302], R_DATA[301], R_DATA[300]}), .B_DOUT({R_DATA[299], 
        R_DATA[298], R_DATA[297], R_DATA[296], R_DATA[295], 
        R_DATA[294], R_DATA[293], R_DATA[292], R_DATA[291], 
        R_DATA[290], R_DATA[289], R_DATA[288], R_DATA[287], 
        R_DATA[286], R_DATA[285], R_DATA[284], R_DATA[283], 
        R_DATA[282], R_DATA[281], R_DATA[280]}), .DB_DETECT(
        \DB_DETECT[0][7] ), .SB_CORRECT(\SB_CORRECT[0][7] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][7] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[319], W_DATA[318], W_DATA[317], 
        W_DATA[316], W_DATA[315], W_DATA[314], W_DATA[313], 
        W_DATA[312], W_DATA[311], W_DATA[310], W_DATA[309], 
        W_DATA[308], W_DATA[307], W_DATA[306], W_DATA[305], 
        W_DATA[304], W_DATA[303], W_DATA[302], W_DATA[301], 
        W_DATA[300]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[299], 
        W_DATA[298], W_DATA[297], W_DATA[296], W_DATA[295], 
        W_DATA[294], W_DATA[293], W_DATA[292], W_DATA[291], 
        W_DATA[290], W_DATA[289], W_DATA[288], W_DATA[287], 
        W_DATA[286], W_DATA[285], W_DATA[284], W_DATA[283], 
        W_DATA[282], W_DATA[281], W_DATA[280]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%16%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C16 (.A_DOUT({R_DATA[679], 
        R_DATA[678], R_DATA[677], R_DATA[676], R_DATA[675], 
        R_DATA[674], R_DATA[673], R_DATA[672], R_DATA[671], 
        R_DATA[670], R_DATA[669], R_DATA[668], R_DATA[667], 
        R_DATA[666], R_DATA[665], R_DATA[664], R_DATA[663], 
        R_DATA[662], R_DATA[661], R_DATA[660]}), .B_DOUT({R_DATA[659], 
        R_DATA[658], R_DATA[657], R_DATA[656], R_DATA[655], 
        R_DATA[654], R_DATA[653], R_DATA[652], R_DATA[651], 
        R_DATA[650], R_DATA[649], R_DATA[648], R_DATA[647], 
        R_DATA[646], R_DATA[645], R_DATA[644], R_DATA[643], 
        R_DATA[642], R_DATA[641], R_DATA[640]}), .DB_DETECT(
        \DB_DETECT[0][16] ), .SB_CORRECT(\SB_CORRECT[0][16] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][16] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[679], W_DATA[678], W_DATA[677], 
        W_DATA[676], W_DATA[675], W_DATA[674], W_DATA[673], 
        W_DATA[672], W_DATA[671], W_DATA[670], W_DATA[669], 
        W_DATA[668], W_DATA[667], W_DATA[666], W_DATA[665], 
        W_DATA[664], W_DATA[663], W_DATA[662], W_DATA[661], 
        W_DATA[660]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[659], 
        W_DATA[658], W_DATA[657], W_DATA[656], W_DATA[655], 
        W_DATA[654], W_DATA[653], W_DATA[652], W_DATA[651], 
        W_DATA[650], W_DATA[649], W_DATA[648], W_DATA[647], 
        W_DATA[646], W_DATA[645], W_DATA[644], W_DATA[643], 
        W_DATA[642], W_DATA[641], W_DATA[640]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%2%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C2 (.A_DOUT({R_DATA[119], 
        R_DATA[118], R_DATA[117], R_DATA[116], R_DATA[115], 
        R_DATA[114], R_DATA[113], R_DATA[112], R_DATA[111], 
        R_DATA[110], R_DATA[109], R_DATA[108], R_DATA[107], 
        R_DATA[106], R_DATA[105], R_DATA[104], R_DATA[103], 
        R_DATA[102], R_DATA[101], R_DATA[100]}), .B_DOUT({R_DATA[99], 
        R_DATA[98], R_DATA[97], R_DATA[96], R_DATA[95], R_DATA[94], 
        R_DATA[93], R_DATA[92], R_DATA[91], R_DATA[90], R_DATA[89], 
        R_DATA[88], R_DATA[87], R_DATA[86], R_DATA[85], R_DATA[84], 
        R_DATA[83], R_DATA[82], R_DATA[81], R_DATA[80]}), .DB_DETECT(
        \DB_DETECT[0][2] ), .SB_CORRECT(\SB_CORRECT[0][2] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][2] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[119], W_DATA[118], W_DATA[117], 
        W_DATA[116], W_DATA[115], W_DATA[114], W_DATA[113], 
        W_DATA[112], W_DATA[111], W_DATA[110], W_DATA[109], 
        W_DATA[108], W_DATA[107], W_DATA[106], W_DATA[105], 
        W_DATA[104], W_DATA[103], W_DATA[102], W_DATA[101], 
        W_DATA[100]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[99], W_DATA[98], 
        W_DATA[97], W_DATA[96], W_DATA[95], W_DATA[94], W_DATA[93], 
        W_DATA[92], W_DATA[91], W_DATA[90], W_DATA[89], W_DATA[88], 
        W_DATA[87], W_DATA[86], W_DATA[85], W_DATA[84], W_DATA[83], 
        W_DATA[82], W_DATA[81], W_DATA[80]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%22%0%TWO-PORT")
         )  WR_FIFO_WR_FIFO_0_LSRAM_top_R0C22 (.A_DOUT({R_DATA[919], 
        R_DATA[918], R_DATA[917], R_DATA[916], R_DATA[915], 
        R_DATA[914], R_DATA[913], R_DATA[912], R_DATA[911], 
        R_DATA[910], R_DATA[909], R_DATA[908], R_DATA[907], 
        R_DATA[906], R_DATA[905], R_DATA[904], R_DATA[903], 
        R_DATA[902], R_DATA[901], R_DATA[900]}), .B_DOUT({R_DATA[899], 
        R_DATA[898], R_DATA[897], R_DATA[896], R_DATA[895], 
        R_DATA[894], R_DATA[893], R_DATA[892], R_DATA[891], 
        R_DATA[890], R_DATA[889], R_DATA[888], R_DATA[887], 
        R_DATA[886], R_DATA[885], R_DATA[884], R_DATA[883], 
        R_DATA[882], R_DATA[881], R_DATA[880]}), .DB_DETECT(
        \DB_DETECT[0][22] ), .SB_CORRECT(\SB_CORRECT[0][22] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][22] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[919], W_DATA[918], W_DATA[917], 
        W_DATA[916], W_DATA[915], W_DATA[914], W_DATA[913], 
        W_DATA[912], W_DATA[911], W_DATA[910], W_DATA[909], 
        W_DATA[908], W_DATA[907], W_DATA[906], W_DATA[905], 
        W_DATA[904], W_DATA[903], W_DATA[902], W_DATA[901], 
        W_DATA[900]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[899], 
        W_DATA[898], W_DATA[897], W_DATA[896], W_DATA[895], 
        W_DATA[894], W_DATA[893], W_DATA[892], W_DATA[891], 
        W_DATA[890], W_DATA[889], W_DATA[888], W_DATA[887], 
        W_DATA[886], W_DATA[885], W_DATA[884], W_DATA[883], 
        W_DATA[882], W_DATA[881], W_DATA[880]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("core%64-64%1024-1024%SPEED%5%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C5 (.A_DOUT({R_DATA[239], 
        R_DATA[238], R_DATA[237], R_DATA[236], R_DATA[235], 
        R_DATA[234], R_DATA[233], R_DATA[232], R_DATA[231], 
        R_DATA[230], R_DATA[229], R_DATA[228], R_DATA[227], 
        R_DATA[226], R_DATA[225], R_DATA[224], R_DATA[223], 
        R_DATA[222], R_DATA[221], R_DATA[220]}), .B_DOUT({R_DATA[219], 
        R_DATA[218], R_DATA[217], R_DATA[216], R_DATA[215], 
        R_DATA[214], R_DATA[213], R_DATA[212], R_DATA[211], 
        R_DATA[210], R_DATA[209], R_DATA[208], R_DATA[207], 
        R_DATA[206], R_DATA[205], R_DATA[204], R_DATA[203], 
        R_DATA[202], R_DATA[201], R_DATA[200]}), .DB_DETECT(
        \DB_DETECT[0][5] ), .SB_CORRECT(\SB_CORRECT[0][5] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][5] ), .A_ADDR({GND, GND, GND, 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[239], W_DATA[238], W_DATA[237], 
        W_DATA[236], W_DATA[235], W_DATA[234], W_DATA[233], 
        W_DATA[232], W_DATA[231], W_DATA[230], W_DATA[229], 
        W_DATA[228], W_DATA[227], W_DATA[226], W_DATA[225], 
        W_DATA[224], W_DATA[223], W_DATA[222], W_DATA[221], 
        W_DATA[220]}), .A_REN(R_EN), .A_WEN({VCC, VCC}), .A_DOUT_EN(
        VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, 
        GND, GND, W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({
        W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[219], 
        W_DATA[218], W_DATA[217], W_DATA[216], W_DATA[215], 
        W_DATA[214], W_DATA[213], W_DATA[212], W_DATA[211], 
        W_DATA[210], W_DATA[209], W_DATA[208], W_DATA[207], 
        W_DATA[206], W_DATA[205], W_DATA[204], W_DATA[203], 
        W_DATA[202], W_DATA[201], W_DATA[200]}), .B_REN(VCC), .B_WEN({
        VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if(RWIDTH == 14) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%14-14%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, nc3, 
        nc4, nc5, R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .B_DOUT({nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, nc14, 
        nc15, nc16, nc17, nc18, nc19, nc20, nc21, nc22, nc23, nc24, 
        nc25}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({GND, GND, GND, GND, GND, GND, GND, R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, 
        VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        GND, GND, GND, GND, GND, W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 13) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%13-13%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, nc3, 
        nc4, nc5, nc6, R_DATA[12], R_DATA[11], R_DATA[10], R_DATA[9], 
        R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], 
        R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), .B_DOUT({nc7, 
        nc8, nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26}), .DB_DETECT(
        \DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, 
        GND, GND, GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 11) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%11-11%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, R_DATA[10], R_DATA[9], R_DATA[8], 
        R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], 
        R_DATA[2], R_DATA[1], R_DATA[0]}), .B_DOUT({nc9, nc10, nc11, 
        nc12, nc13, nc14, nc15, nc16, nc17, nc18, nc19, nc20, nc21, 
        nc22, nc23, nc24, nc25, nc26, nc27, nc28}), .DB_DETECT(
        \DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, 
        GND, GND, GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if(RWIDTH == 15) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%15-15%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], 
        R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], 
        R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], 
        R_DATA[0]}), .B_DOUT({nc5, nc6, nc7, nc8, nc9, nc10, nc11, 
        nc12, nc13, nc14, nc15, nc16, nc17, nc18, nc19, nc20, nc21, 
        nc22, nc23, nc24}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({GND, GND, GND, GND, GND, GND, GND, R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, 
        VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        GND, GND, GND, GND, GND, W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, W_DATA[14], W_DATA[13], 
        W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 16) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%16-16%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .B_DOUT({nc4, nc5, nc6, nc7, nc8, nc9, 
        nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, nc19, 
        nc20, nc21, nc22, nc23}), .DB_DETECT(\DB_DETECT[0][0] ), 
        .SB_CORRECT(\SB_CORRECT[0][0] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, GND, GND, 
        GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, GND, 
        W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], W_DATA[11], 
        W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], W_DATA[6], 
        W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], W_DATA[1], 
        W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    

end
else if(RWIDTH == 17) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%17-17%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .B_DOUT({nc3, nc4, nc5, nc6, nc7, nc8, 
        nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21, nc22}), .DB_DETECT(\DB_DETECT[0][0] ), 
        .SB_CORRECT(\SB_CORRECT[0][0] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, GND, GND, 
        GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, GND, GND, W_DATA[16], 
        W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], W_DATA[11], 
        W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], W_DATA[6], 
        W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], W_DATA[1], 
        W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 18) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%18-18%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, R_DATA[17], 
        R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], 
        R_DATA[11], R_DATA[10], R_DATA[9], nc1, R_DATA[8], R_DATA[7], 
        R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], 
        R_DATA[1], R_DATA[0]}), .B_DOUT({nc2, nc3, nc4, nc5, nc6, nc7, 
        nc8, nc9, nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({GND, GND, GND, GND, GND, GND, GND, R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND, GND}), .A_BLK_EN({VCC, 
        VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        GND, GND, GND, GND, GND, W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, 
        GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], GND, 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, GND}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, GND}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
else if(RWIDTH == 19) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%19-19%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, R_DATA[18], 
        R_DATA[17], R_DATA[16], R_DATA[15], R_DATA[14], R_DATA[13], 
        R_DATA[12], R_DATA[11], R_DATA[10], R_DATA[9], R_DATA[8], 
        R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], R_DATA[3], 
        R_DATA[2], R_DATA[1], R_DATA[0]}), .B_DOUT({nc1, nc2, nc3, nc4, 
        nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, nc14, nc15, 
        nc16, nc17, nc18, nc19, nc20}), .DB_DETECT(\DB_DETECT[0][0] ), 
        .SB_CORRECT(\SB_CORRECT[0][0] ), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, GND, GND, 
        GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND}), 
        .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, GND}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[18], W_DATA[17], 
        W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 20) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%20-20%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({R_DATA[19], 
        R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], R_DATA[14], 
        R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], R_DATA[9], 
        R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4], 
        R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), .B_DOUT({nc0, 
        nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, 
        nc13, nc14, nc15, nc16, nc17, nc18, nc19}), .DB_DETECT(
        \DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, 
        GND, GND, GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND}), .A_REN(R_EN), .A_WEN({GND, 
        GND}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(
        VCC), .B_ADDR({GND, GND, GND, GND, GND, GND, GND, W_ADDR[2], 
        W_ADDR[1], W_ADDR[0], GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], W_DATA[18], 
        W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], 
        W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], 
        W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, GND}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, GND})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 21) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%21-21%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, nc16, nc17, nc18, R_DATA[20]}), .B_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, 
        GND, GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, W_DATA[20]}), .A_REN(R_EN), 
        .A_WEN({GND, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, GND, GND, GND, GND, 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 22) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%22-22%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, nc16, nc17, R_DATA[21], R_DATA[20]}), .B_DOUT({
        R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], R_DATA[15], 
        R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], R_DATA[10], 
        R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], R_DATA[5], 
        R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(\SB_CORRECT[0][0] ), 
        .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), .A_ADDR({GND, GND, GND, GND, 
        GND, GND, R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, GND, GND, GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, W_DATA[21], W_DATA[20]}), .A_REN(R_EN)
        , .A_WEN({GND, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, GND, GND, GND, GND, 
        W_ADDR[2], W_ADDR[1], W_ADDR[0], GND, GND, GND, GND, GND}), 
        .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), 
        .B_DOUT_SRST_N(VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({
        VCC, GND, VCC}), .A_WMODE({GND, GND}), .A_BYPASS(VCC), 
        .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND}), .B_BYPASS(VCC)
        , .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 23) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%23-23%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, nc16, R_DATA[22], R_DATA[21], R_DATA[20]}), 
        .B_DOUT({R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], 
        R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], 
        R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], 
        R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], 
        R_DATA[0]}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({GND, GND, GND, GND, GND, GND, R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({GND, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, GND, GND, GND, W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], W_DATA[18], W_DATA[17], 
        W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 24) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%24-24%SPEED%0%0%TWO-PORT") )  
        fifo_test_fifo_test_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, R_DATA[23], R_DATA[22], R_DATA[21], R_DATA[20]}), 
        .B_DOUT({R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], 
        R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], 
        R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], 
        R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], 
        R_DATA[0]}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({GND, GND, GND, GND, GND, GND, R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({GND, VCC}), 
        .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), 
        .B_ADDR({GND, GND, GND, GND, GND, GND, W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], W_DATA[18], W_DATA[17], 
        W_DATA[16], W_DATA[15], W_DATA[14], W_DATA[13], W_DATA[12], 
        W_DATA[11], W_DATA[10], W_DATA[9], W_DATA[8], W_DATA[7], 
        W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], W_DATA[2], 
        W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({VCC, VCC}), 
        .B_DOUT_EN(VCC), .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), 
        .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));

end
else if(RWIDTH == 8) begin
    wire \ACCESS_BUSY[0][0] , \SB_CORRECT[0][0] , \DB_DETECT[0][0] , 
        VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("core%5-5%8-8%SPEED%0%0%TWO-PORT") )  
        WR_FIFO_WR_FIFO_0_LSRAM_top_R0C0 (.A_DOUT({nc0, nc1, nc2, nc3, 
        nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, R_DATA[7], R_DATA[6], 
        R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], 
        R_DATA[0]}), .B_DOUT({nc12, nc13, nc14, nc15, nc16, nc17, nc18, 
        nc19, nc20, nc21, nc22, nc23, nc24, nc25, nc26, nc27, nc28, 
        nc29, nc30, nc31}), .DB_DETECT(\DB_DETECT[0][0] ), .SB_CORRECT(
        \SB_CORRECT[0][0] ), .ACCESS_BUSY(\ACCESS_BUSY[0][0] ), 
        .A_ADDR({GND, GND, GND, GND, GND, GND, GND, GND, R_ADDR[2], 
        R_ADDR[1], R_ADDR[0], GND, GND, GND}), .A_BLK_EN({VCC, VCC, 
        VCC}), .A_CLK(CLK), .A_DIN({GND, GND, GND, GND, GND, GND, GND, 
        GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND}), .A_REN(R_EN), .A_WEN({GND, GND}), .A_DOUT_EN(VCC), 
        .A_DOUT_ARST_N(VCC), .A_DOUT_SRST_N(VCC), .B_ADDR({GND, GND, 
        GND, GND, GND, GND, GND, GND, W_ADDR[2], W_ADDR[1], W_ADDR[0], 
        GND, GND, GND}), .B_BLK_EN({W_EN, VCC, VCC}), .B_CLK(CLK), 
        .B_DIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, 
        GND, W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], W_DATA[3], 
        W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), .B_WEN({GND, 
        VCC}), .B_DOUT_EN(VCC), .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(
        VCC), .ECC_EN(GND), .BUSY_FB(GND), .A_WIDTH({GND, VCC, VCC}), 
        .A_WMODE({GND, GND}), .A_BYPASS(VCC), .B_WIDTH({GND, VCC, VCC})
        , .B_WMODE({GND, GND}), .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
end
endgenerate
endmodule


