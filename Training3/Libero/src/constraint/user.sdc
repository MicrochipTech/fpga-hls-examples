create_clock -name {TCK} -period 33.33 [ get_ports { TCK } ]
create_generated_clock -name {VIDEO_CLK_o} -invert -multiply_by 2520 -divide_by 2700 -source [ get_ports { CLK27_i } ] -phase 0 [ get_ports { VIDEO_CLK_o } ]

set_input_delay 2 -max  -clock { CLK27_i } [ get_ports { HDMI_SCL HDMI_SDA UART_RX_i } ]
set_input_delay 1 -min  -clock { CLK27_i } [ get_ports { HDMI_SCL HDMI_SDA UART_RX_i } ]
set_output_delay 2 -max  -clock { CLK27_i } [ get_ports { UART_TX_o HDMI_RSTN_o HDMI_SCL HDMI_SDA } ]
set_output_delay 1 -min  -clock { CLK27_i } [ get_ports { UART_TX_o HDMI_RSTN_o HDMI_SCL HDMI_SDA } ]

#27MHZ On-board CLK_IN is an independent clock domain and does not have any CDC path
set_clock_groups -name {clk_grp_clk_in} -asynchronous -group [ get_clocks { CLK27_i } ]
set_clock_groups -name {clk_grp_hdmi_clk} -asynchronous -group [ get_clocks { VIDEO_CLK_o } ]
set_clock_groups -name {clk_grp_miv_tck} -asynchronous -group [ get_clocks { TCK } ]

#CPU System Clock
set_clock_groups -name {clk_grp_clk50} -asynchronous -group [ get_clocks { CLOCK_RESET_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
#LEGUP Processing Clock
set_clock_groups -name {clk_grp_clk100} -asynchronous -group [ get_clocks { CLOCK_RESET_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]
#Video System Clock
set_clock_groups -name {clk_grp_clk25d2} -asynchronous -group [ get_clocks { CLOCK_RESET_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
