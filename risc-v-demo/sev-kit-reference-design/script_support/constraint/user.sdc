# Reset path to ALn hence ignoring
#set_false_path -from [ get_pins { Video_Pipeline_0/IMX334_IF_TOP_0/PF_IOD_GENERIC_RX_C0_0/PF_IOD_0/COREBCLKSCLKALIGN_0/PF_IOD_GENERIC_RX_C0_TR_0/genblk1.U_ICB_BCLKSCLKALIGN/RX_CLK_ALIGN_DONE/CLK } ]
# 125MHz clock used in AXI interconnect, FIC1 and LPDDR memory access
set_clock_groups -name {clk_grp_fic1} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
# APB clock
set_clock_groups -name {clk_grp_fab_apb} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
# I2C clock for camera data given to MSS block
#commented out the line below, as it seems to be setting clock groups but there is only 1 clock group given, so it basically shouldn't do anything
#set_clock_groups -name {clk_grp_i2c} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_2/CLK } ]
#cam clocks
set_clock_groups -name {clk_grp_cam_ccc_o0} -asynchronous -group [ get_clocks { Video_Pipeline_0/IMX334_IF_TOP_0/PF_CCC_C2_0/PF_CCC_C2_0/pll_inst_0/OUT0 } ]
set_clock_groups -name {clk_grp_cam_ccc_ydiv0} -asynchronous -group [ get_clocks {Video_Pipeline_0/IMX334_IF_TOP_0/PF_IOD_GENERIC_RX_C0_0/PF_IOD_0/PF_CLK_DIV_FIFO/I_CDD/Y_DIV } ]

# scale factors are mostly static and will change only on frame start
set_false_path -from [ get_pins { Video_Pipeline_0/video_processing_0/frame_controls_gen_0/h_scale_factor_o* } ]
set_false_path -from [ get_pins { Video_Pipeline_0/video_processing_0/frame_controls_gen_0/v_scale_factor_o* } ]
