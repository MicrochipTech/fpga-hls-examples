# 170MHz clock for HLS
set_clock_groups -name {clk_grp_hls} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT2 } ]
