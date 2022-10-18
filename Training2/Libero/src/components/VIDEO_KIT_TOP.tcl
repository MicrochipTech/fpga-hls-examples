# Creating SmartDesign VIDEO_KIT_TOP
set sd_name {VIDEO_KIT_TOP}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_XMASTER} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_XMASTER} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAMERA_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_CLK_EN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_INCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMIO_PD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD2} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD3} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD4} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD5} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD6} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD7} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_enable_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {hdmi_clk} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {horz_sync_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {line_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {vert_sync_o} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM2_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM2_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM2_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {B_out_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT_0} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {G_out_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {R_out_o} -port_direction {OUT} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[63:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAM_INCK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAM1_XMASTER} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CAM2_XMASTER} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMIO_PD} -value {GND}
# Add CCC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CCC} -instance_name {CCC_0}



# Add Disp_controller_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Disp_controller} -instance_name {Disp_controller_0}



# Add IMX334_IF_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMX334_IF_TOP} -instance_name {IMX334_IF_TOP_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX334_IF_TOP_0:c1_frame_start_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX334_IF_TOP_0:c2_frame_start_o}



# Add Memory_Read_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Memory_Read} -instance_name {Memory_Read_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Memory_Read_0:horz_resl_i_0} -value {0000000111000000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Memory_Read_0:v_pan_i_0} -value {001101011000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Memory_Read_0:h_pan_i_0} -value {011010100000}



# Add Memory_Write_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Memory_Write} -instance_name {Memory_Write_0}



# Add PF_DDR4_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR4_C0} -instance_name {PF_DDR4_C0_0}



# Add PROC_SUBSYSTEM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PROC_SUBSYSTEM} -instance_name {PROC_SUBSYSTEM_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PROC_SUBSYSTEM_0:HDMI_RST}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PROC_SUBSYSTEM_0:GPIO_OUT_0}



# Add Reset_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Reset} -instance_name {Reset_0}



# Add UART_interface_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_interface} -instance_name {UART_interface_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_interface_0:bayer_edge_sel_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_interface_0:pip_mode_sel_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_interface_0:status_i} -value {1010}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_interface_0:h_pan_c2_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_interface_0:v_pan_c2_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_interface_0:bayer_format2_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {UART_interface_0:alpha_hdmi_o}



# Add Video_arbiter_top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Video_arbiter_top} -instance_name {Video_arbiter_top_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_req_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_data_valid_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_req_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_data_valid_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r2_req_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r3_req_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_done_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_ack_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_done_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_ack_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r2_data_valid_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r2_ack_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r2_done_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r3_data_valid_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r3_ack_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r3_done_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_burst_size_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_wstart_addr_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_burst_size_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_wstart_addr_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r2_rstart_addr_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r2_burst_size_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r3_rstart_addr_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:r3_burst_size_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w2_data_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Video_arbiter_top_0:w3_data_i} -value {GND}



# Add video_pipelining_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {video_pipelining} -instance_name {video_pipelining_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {video_pipelining_0:mode_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_pipelining_0:frame_start_address2_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "PF_DDR4_C0_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG" "PF_DDR4_C0_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RST" "PROC_SUBSYSTEM_0:CAM1_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "IMX334_IF_TOP_0:CAM1_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "IMX334_IF_TOP_0:CAM1_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_SCL" "PROC_SUBSYSTEM_0:CAM1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_SDA" "PROC_SUBSYSTEM_0:CAM1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_RST" "PROC_SUBSYSTEM_0:CAM2_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_RX_CLK_N" "IMX334_IF_TOP_0:CAM2_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_RX_CLK_P" "IMX334_IF_TOP_0:CAM2_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_SCL" "PROC_SUBSYSTEM_0:CAM2_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_SDA" "PROC_SUBSYSTEM_0:CAM2_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAMERA_CLK" "IMX334_IF_TOP_0:CAMERA_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_CLK_EN" "PROC_SUBSYSTEM_0:GPIO_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "PF_DDR4_C0_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0:OUT0_FABCLK_0_0" "Disp_controller_0:SYS_CLK_I" "Memory_Read_0:disp_clk" "Memory_Read_0:disp_clk_i" "Reset_0:CLK_1" "hdmi_clk" "video_pipelining_0:SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0:OUT1_FABCLK_0_0" "PF_DDR4_C0_0:PLL_REF_CLK" "PROC_SUBSYSTEM_0:PCLK" "Reset_0:CLK_2" "UART_interface_0:sys_clk_i" "video_pipelining_0:sys_clk_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0:PLL_LOCK_0" "video_pipelining_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0:PLL_LOCK_0_0" "video_pipelining_0:B_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0:REF_CLK_0" "CLK_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CCC_0:REF_CLK_0_0" "Memory_Read_0:sys_clk_i" "Memory_Write_0:ddr_clock_i" "Memory_Write_0:ddr_clock_i_0" "PF_DDR4_C0_0:SYS_CLK" "Reset_0:CLK_0" "Video_arbiter_top_0:sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0" "PF_DDR4_C0_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N" "PF_DDR4_C0_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "PF_DDR4_C0_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "PF_DDR4_C0_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:DATA_ENABLE_O" "video_pipelining_0:ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:DATA_TRIGGER_O" "Memory_Read_0:read_en_i" "Memory_Read_0:read_en_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:EXT_SYNC_SIGNAL_I" "video_pipelining_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:FRAME_END_O" "Memory_Read_0:frame_end_i" "Memory_Read_0:frame_end_i_0" "video_pipelining_0:eof_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:H_SYNC_O" "horz_sync_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:RESETN_I" "Reset_0:FABRIC_RESET_N_1" "video_pipelining_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:V_SYNC_O" "vert_sync_o" "video_pipelining_0:vsync_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_SCL" "PROC_SUBSYSTEM_0:HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"HDMI_SDA" "PROC_SUBSYSTEM_0:HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ARST_N" "IMX334_IF_TOP_0:INIT_DONE" "Reset_0:AUTOCALIB_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:CAMCLK_RESET_N" "Memory_Write_0:reset_i_0" "Memory_Write_0:reset_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLOCK" "Memory_Write_0:parallel_clk_i_0" "Memory_Write_0:parallel_clk_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:TRNG_RST_N" "PROC_SUBSYSTEM_0:TRNG_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_frame_valid_o" "Memory_Write_0:frame_valid_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_line_valid_o" "Memory_Write_0:data_valid_i_0" "line_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c2_frame_valid_o" "Memory_Write_0:frame_valid_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c2_line_valid_o" "Memory_Write_0:data_valid_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:bayer_dvalid_o" "video_pipelining_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:bayer_dvalid_o_0" "video_pipelining_0:DATA_VALID_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:ddr_data_valid_i" "Video_arbiter_top_0:r0_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:ddr_data_valid_i_0" "Video_arbiter_top_0:r1_data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:frame_active_d_o" "video_pipelining_0:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_ackn_i" "Video_arbiter_top_0:r0_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_ackn_i_0" "Video_arbiter_top_0:r1_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_done_i" "Video_arbiter_top_0:r0_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_done_i_0" "Video_arbiter_top_0:r1_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_req_o" "Video_arbiter_top_0:r0_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_req_o_0" "Video_arbiter_top_0:r1_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:reset_i" "Memory_Write_0:reset_i" "Reset_0:FABRIC_RESET_N" "Video_arbiter_top_0:reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:rdata_rdy_o_0" "Video_arbiter_top_0:w0_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:rdata_rdy_o_1" "Video_arbiter_top_0:w1_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_ackn_i_0" "Video_arbiter_top_0:w0_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_ackn_i_1" "Video_arbiter_top_0:w1_ack_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_done_i_0" "Video_arbiter_top_0:w0_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_done_i_1" "Video_arbiter_top_0:w1_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_req_o_0" "Video_arbiter_top_0:w0_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_req_o_1" "Video_arbiter_top_0:w1_req_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT" "PF_DDR4_C0_0:ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:CTRLR_READY" "Video_arbiter_top_0:ddr_ctrl_ready" "video_pipelining_0:D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:PLL_LOCK" "video_pipelining_0:C" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD4" "SHIELD4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD5" "SHIELD5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD6" "SHIELD6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SHIELD7" "SHIELD7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:SYS_RESET_N" "PROC_SUBSYSTEM_0:reset" "Reset_0:FABRIC_RESET_N_2" "UART_interface_0:reset_i" "video_pipelining_0:reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:APB_CLK" "video_pipelining_0:pclk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:APB_Reset" "video_pipelining_0:preset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RX" "UART_interface_0:RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Reset_0:DEVICE_INIT_DONE" "video_pipelining_0:A_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Reset_0:PLL_LOCK_0" "video_pipelining_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Reset_0:PLL_LOCK_2" "video_pipelining_0:Y_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TX" "UART_interface_0:TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:pip_select_o" "video_pipelining_0:source_select_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_enable_o" "video_pipelining_0:data_enable_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "PF_DDR4_C0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "PF_DDR4_C0_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"B_out_o" "video_pipelining_0:B_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "IMX334_IF_TOP_0:CAM1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "IMX334_IF_TOP_0:CAM1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_RXD" "IMX334_IF_TOP_0:CAM2_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM2_RXD_N" "IMX334_IF_TOP_0:CAM2_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM_N" "PF_DDR4_C0_0:DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "PF_DDR4_C0_0:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "PF_DDR4_C0_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "PF_DDR4_C0_0:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Disp_controller_0:H_RES_O" "Memory_Read_0:horz_resl_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_OUT_0" "video_pipelining_0:prediction" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"G_out_o" "video_pipelining_0:G_out_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_data_out_o" "Memory_Write_0:data_i_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c2_data_out_o" "Memory_Write_0:data_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:bayer_data_o" "video_pipelining_0:DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:bayer_data_o_0" "video_pipelining_0:DATA_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:beats_to_read_o" "Video_arbiter_top_0:r0_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:beats_to_read_o_0" "Video_arbiter_top_0:r1_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:frame_start_addr_i" "video_pipelining_0:frame_start_address1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:h_pan_i" "UART_interface_0:h_pan_c1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:h_shift_i" "video_pipelining_0:h_shift_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_start_addr_o" "Video_arbiter_top_0:r0_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:read_start_addr_o_0" "Video_arbiter_top_0:r1_rstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:v_pan_i" "UART_interface_0:v_pan_c1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:v_shift_i" "video_pipelining_0:v_shift_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Read_0:wdata_i" "Memory_Read_0:wdata_i_0" "Video_arbiter_top_0:rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:beats_to_write_o_0" "Video_arbiter_top_0:w0_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:beats_to_write_o_1" "Video_arbiter_top_0:w1_burst_size_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:display_frame_addr_o_0" "video_pipelining_0:frame_start_address1_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:display_frame_addr_o_1" "video_pipelining_0:frame_start_address2_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:rdata_o_0" "Video_arbiter_top_0:w0_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:rdata_o_1" "Video_arbiter_top_0:w1_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_start_addr_o_0" "Video_arbiter_top_0:w0_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Memory_Write_0:write_start_addr_o_1" "Video_arbiter_top_0:w1_wstart_addr_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"R_out_o" "video_pipelining_0:R_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:alpha_o" "video_pipelining_0:alpha_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:bayer_format0_o" "video_pipelining_0:BAYER_FORMAT_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:bayer_format1_o" "video_pipelining_0:BAYER_FORMAT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:bgain_o" "video_pipelining_0:b_gain_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:brightness_o" "video_pipelining_0:brightness_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:contrast_o" "video_pipelining_0:contrast_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:ggain_o" "video_pipelining_0:g_gain_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:h_shift_o" "video_pipelining_0:h_shift_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:rgain_o" "video_pipelining_0:r_gain_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:step_o" "video_pipelining_0:step_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"UART_interface_0:v_shift_o" "video_pipelining_0:v_shift_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:AXI4slave0" "Video_arbiter_top_0:M_AXI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PROC_SUBSYSTEM_0:APBmslave9" "video_pipelining_0:APB_IF" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign VIDEO_KIT_TOP
generate_component -component_name ${sd_name}
