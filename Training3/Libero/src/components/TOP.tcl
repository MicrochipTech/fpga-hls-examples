# Creating SmartDesign TOP
set sd_name {TOP}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK27_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BG} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_TX_PD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED1_RED} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED2_RED} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED3_ORG} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED4_ORG} -port_direction {OUT}
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
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_CLK_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_DE_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_HSYNC_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VIDEO_VSYNC_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {HDMI_SDA} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM_N} -port_direction {OUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {VIDEO_B_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {VIDEO_G_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {VIDEO_R_o} -port_direction {OUT} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[63:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {HDMI_TX_PD} -value {GND}
# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add CLOCK_RESET_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCK_RESET} -instance_name {CLOCK_RESET_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CLOCK_RESET_0:DDR4_PLL_LOCK} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CLOCK_RESET_0:DDR4_CTRLR_READY} -value {VCC}



# Add counter_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {counter} -instance_name {counter_1}
# Exporting Parameters of instance counter_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {counter_1} -params {\
"bitwidth:6" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {counter_1}
sd_update_instance -sd_name ${sd_name} -instance_name {counter_1}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {counter_1:counter_out} -pin_slices {[4:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {counter_1:counter_out[4:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {counter_1:counter_out} -pin_slices {[5:5]}



# Add CPU_SYS_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CPU_SYS} -instance_name {CPU_SYS_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CPU_SYS_0:GPIO_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CPU_SYS_0:GPIO_OUT} -pin_slices {[1:1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CPU_SYS_0:HDMI_RSTN_o}



# Add DISPLAY_CONTROLLER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DISPLAY_CONTROLLER} -instance_name {DISPLAY_CONTROLLER_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DISPLAY_CONTROLLER_0:DISP_CLK_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DISPLAY_CONTROLLER_0:TPG_H_BLANK_START_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DISPLAY_CONTROLLER_0:beats_to_read_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DISPLAY_CONTROLLER_0:horz_resl_i} -value {0000001010000000}



# Add LEGUP_PROCESSING_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LEGUP_PROCESSING} -instance_name {LEGUP_PROCESSING_0}



# Add PF_DDR4_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DDR4_C0} -instance_name {PF_DDR4_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:PLL_LOCK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_DDR4_C0_0:CTRLR_READY}



# Add signal_synchronizer_0 instance
# This is added between the 25.2 MHz Display Controller and 50 MHz CPU_SYS (MiV)
# External Interrupt input (EXT_IRQ) to solve an issue of the MiV becoming unresponsive
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {signal_synchronizer} -hdl_file {hdl\signal_synchronizer.v} -instance_name {signal_synchronizer_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "PF_DDR4_C0_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:A" "CLOCK_RESET_0:HDMI_CLK_RESETN_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:B" "CPU_SYS_0:GPIO_OUT[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "DISPLAY_CONTROLLER_0:start_output_i" "LED4_ORG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG" "PF_DDR4_C0_0:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "PF_DDR4_C0_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0" "PF_DDR4_C0_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N" "PF_DDR4_C0_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "PF_DDR4_C0_0:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK27_i" "CLOCK_RESET_0:CLK27_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:CLK100_RESETN_o" "DISPLAY_CONTROLLER_0:resetn_i" "LEGUP_PROCESSING_0:RESETN_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:CLK100_o" "DISPLAY_CONTROLLER_0:ddr_clk_i" "LEGUP_PROCESSING_0:CLK_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:CLK50_RESETN_o" "CPU_SYS_0:RESETN_i" "PF_DDR4_C0_0:SYS_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:CLK50_o" "CPU_SYS_0:CLK_i" "LEGUP_PROCESSING_0:CPU_AXI4m_CLK" "PF_DDR4_C0_0:PLL_REF_CLK" "signal_synchronizer_0:clk_dst" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:EXT_RST_N" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:HDMI_CLK_o" "DISPLAY_CONTROLLER_0:disp_clk_i" "VIDEO_CLK_o" "counter_1:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_RESET_0:INIT_DONE" "counter_1:reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:EXT_IRQ" "signal_synchronizer_0:signal_dst" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:GPIO_OUT[1:1]" "LED2_RED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:HDMI_SCL" "HDMI_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:HDMI_SDA" "HDMI_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:UART_RX_i" "UART_RX_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:UART_TX_o" "UART_TX_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS_N" "PF_DDR4_C0_0:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:DISP_DE_o" "VIDEO_DE_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:DISP_HSYNC_o" "VIDEO_HSYNC_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:DISP_VSYNC_o" "VIDEO_VSYNC_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:FIFO_WE" "LEGUP_PROCESSING_0:output_fifo_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:TPG_DATA_TRIGGER_START_o" "LEGUP_PROCESSING_0:Process_Start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:TPG_DATA_TRIGGER_o" "LEGUP_PROCESSING_0:fifo_ready_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:TPG_FRAME_END_o" "counter_1:enable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:TPG_VSYNC_START_o" "signal_synchronizer_0:signal_src" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED1_RED" "counter_1:counter_out[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED3_ORG" "LEGUP_PROCESSING_0:processing_phase_running" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LEGUP_PROCESSING_0:DDR_CLK" "PF_DDR4_C0_0:SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT" "PF_DDR4_C0_0:ODT" }
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
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DDR4_C0_0:WE_N" "WE_N" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "PF_DDR4_C0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "PF_DDR4_C0_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:DISP_BLUE_o" "VIDEO_B_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:DISP_GREEN_o" "VIDEO_G_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:DISP_RED_o" "VIDEO_R_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISPLAY_CONTROLLER_0:wdata_i" "LEGUP_PROCESSING_0:output_fifo" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM_N" "PF_DDR4_C0_0:DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "PF_DDR4_C0_0:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "PF_DDR4_C0_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "PF_DDR4_C0_0:DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CPU_SYS_0:AXI4_MSTR" "LEGUP_PROCESSING_0:CPU_AXI4m" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LEGUP_PROCESSING_0:AXI4mslave0" "PF_DDR4_C0_0:AXI4slave0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign TOP
generate_component -component_name ${sd_name}
