#Constrain TCK
create_clock -name {TCK} -period 33.33 [ get_ports { TCK } ]
create_generated_clock -name {CCC_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -multiply_by 50 -divide_by 9 -source [ get_pins { CCC_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { CCC_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
##HDMI clk
set_input_delay 2 -max  -clock { CLK_IN } [ get_ports { RX CAM1_SCL CAM1_SDA CAM2_SCL CAM2_SDA } ]
set_input_delay 1 -min  -clock { CLK_IN } [ get_ports { RX CAM1_SCL CAM1_SDA CAM2_SCL CAM2_SDA } ]
set_output_delay 2 -max  -clock { CLK_IN } [ get_ports { TX CAMERA_CLK CAM1_RST CAM1_SCL CAM1_SDA CAM2_RST CAM2_SCL CAM2_SDA CAM_CLK_EN GPIO_OUT_0[0] GPIO_OUT_0[1] GPIO_OUT_0[2] GPIO_OUT_0[3] } ]
set_output_delay 1 -min  -clock { CLK_IN } [ get_ports { TX CAMERA_CLK CAM1_RST CAM1_SCL CAM1_SDA CAM2_RST CAM2_SCL CAM2_SDA CAM_CLK_EN GPIO_OUT_0[0] GPIO_OUT_0[1] GPIO_OUT_0[2] GPIO_OUT_0[3] } ]
#Setup time of 1ns and hold time of 0.7ns for HDMI signals to ADV7511 with respect to HDMI_CLK
set_false_path -to [ get_cells { PROC_SUBSYSTEM_0/COREI2C_C0_0/COREI2C_C0_0/BCLK_ff0 } ]
set_min_delay 2.1 -from [ get_clocks { CCC_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ] -to [ get_pins { PROC_SUBSYSTEM_0/COREI2C_C0_0/COREI2C_C0_0/BCLK_ff0/D } ]

#27MHZ On-board CLK_IN is an independent clock domain and does not have any CDC path
set_clock_groups -name {clk_grp_clk_in} -asynchronous -group [ get_clocks { CLK_IN } ]
set_clock_groups -name {clk_grp_cam1_clk} -asynchronous -group [ get_clocks { CAM1_RX_CLK_P } ]
set_clock_groups -name {clk_grp_cam2_clk} -asynchronous -group [ get_clocks { CAM2_RX_CLK_P } ]
set_clock_groups -name {clk_grp_miv_tck} -asynchronous -group [ get_clocks { TCK } ]
set_clock_groups -name {clk_grp_cam_ccc_c0o1} -asynchronous -group [ get_clocks { CCC_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
##IMX
set_clock_groups -name {clk_grp_cam_ccc_o0} -asynchronous -group [ get_clocks { IMX334_IF_TOP_0/PF_CCC_C2_0/PF_CCC_C2_0/pll_inst_0/OUT0 } ]
set_clock_groups -name {clk_grp_cam_ccc_ydiv0} -asynchronous -group [ get_clocks { IMX334_IF_TOP_0/PF_IOD_GENERIC_RX_C0_0/PF_IOD_0/PF_CLK_DIV_FIFO/I_CDD/Y_DIV } ]
set_clock_groups -name {clk_grp_cam_ccc_ydiv1} -asynchronous -group [ get_clocks { IMX334_IF_TOP_0/PF_IOD_GENERIC_RX_C0_1/PF_IOD_0/PF_CLK_DIV_FIFO/I_CDD/Y_DIV } ]
##CCC
set_clock_groups -name {clk_grp_cam_ccc_c0o0} -asynchronous -group [ get_clocks { CCC_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
set_clock_groups -name {clk_grp_cam_ccc_c1o0} -asynchronous -group [ get_clocks { CCC_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
##DDR
set_clock_groups -name {clk_grp_cam_ddr_o1} -asynchronous -group [ get_clocks { PF_DDR4_C0_0/CCC_0/pll_inst_0/OUT1 } ]
set_clock_groups -name {clk_grp_cam_ddr_o2} -asynchronous -group [ get_clocks { PF_DDR4_C0_0/CCC_0/pll_inst_0/OUT2 } ]
set_clock_groups -name {clk_grp_cam_ddr_o0} -asynchronous -group [ get_clocks { PF_DDR4_C0_0/CCC_0/pll_inst_0/OUT0 } ]
set_clock_groups -name {clk_grp_cam_ddr_o3} -asynchronous -group [ get_clocks { PF_DDR4_C0_0/CCC_0/pll_inst_0/OUT3 } ]
