# Creating SmartDesign IMX334_IF_TOP
set sd_name {IMX334_IF_TOP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRNG_RST_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CAMCLK_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAMERA_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PARALLEL_CLOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {c1_frame_start_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {c1_frame_valid_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {c1_line_valid_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {c1_data_out_o} -port_direction {OUT} -port_range {[7:0]}


# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add CORERESET_PF_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C1} -instance_name {CORERESET_PF_C1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:FPGA_POR_N} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C1_0:PLL_POWERDOWN_B}



# Add CORERESET_PF_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C2} -instance_name {CORERESET_PF_C2_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:FPGA_POR_N} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:PLL_POWERDOWN_B}



# Add CSI2_RXDecoder_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {mipicsi2rxdecoderPF_C0} -instance_name {CSI2_RXDecoder_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CSI2_RXDecoder_0:data_out_o} -pin_slices {[9:2]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CSI2_RXDecoder_0:frame_end_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CSI2_RXDecoder_0:line_end_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CSI2_RXDecoder_0:line_start_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CSI2_RXDecoder_0:ecc_error_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CSI2_RXDecoder_0:data_type_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CSI2_RXDecoder_0:word_count_o}



# Add PF_CCC_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C2} -instance_name {PF_CCC_C2_0}



# Add PF_IOD_GENERIC_RX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAM_IOD_TIP_TOP} -instance_name {PF_IOD_GENERIC_RX_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:SKIP_TRNG} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:RESTART_TRNG} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:HS_SEL} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:HS_IO_CLK_PAUSE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:CLK_TRAIN_ERROR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:CLK_TRAIN_DONE}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "TRNG_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "CORERESET_PF_C1_0:PLL_LOCK" "CORERESET_PF_C2_0:PLL_LOCK" "PF_CCC_C2_0:PLL_LOCK_0" "PF_IOD_GENERIC_RX_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "PF_IOD_GENERIC_RX_C0_0:TRAINING_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARST_N" "PF_IOD_GENERIC_RX_C0_0:ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "PF_IOD_GENERIC_RX_C0_0:RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "PF_IOD_GENERIC_RX_C0_0:RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAMCLK_RESET_N" "CORERESET_PF_C1_0:FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAMERA_CLK" "CORERESET_PF_C2_0:CLK" "CSI2_RXDecoder_0:CAM_CLOCK_I" "PF_CCC_C2_0:REF_CLK_0" "PF_IOD_GENERIC_RX_C0_0:RX_CLK_G" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:CLK" "CSI2_RXDecoder_0:PARALLEL_CLOCK_I" "PARALLEL_CLOCK" "PF_CCC_C2_0:OUT0_FABCLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:EXT_RST_N" "CORERESET_PF_C2_0:EXT_RST_N" "PF_IOD_GENERIC_RX_C0_0:training_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C1_0:INIT_DONE" "CORERESET_PF_C2_0:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C2_0:FABRIC_RESET_N" "CSI2_RXDecoder_0:RESET_n_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L0_LP_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L0_LP_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L0_LP_DATA_N_I" "PF_IOD_GENERIC_RX_C0_0:L0_LP_DATA_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L1_LP_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L1_LP_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L1_LP_DATA_N_I" "PF_IOD_GENERIC_RX_C0_0:L1_LP_DATA_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L2_LP_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L2_LP_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L2_LP_DATA_N_I" "PF_IOD_GENERIC_RX_C0_0:L2_LP_DATA_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L3_LP_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L3_LP_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L3_LP_DATA_N_I" "PF_IOD_GENERIC_RX_C0_0:L3_LP_DATA_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:frame_start_o" "c1_frame_start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:frame_valid_o" "c1_frame_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:line_valid_o" "c1_line_valid_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "PF_IOD_GENERIC_RX_C0_0:RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "PF_IOD_GENERIC_RX_C0_0:RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L0_HS_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L0_RXD_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L1_HS_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L1_RXD_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L2_HS_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L2_RXD_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:L3_HS_DATA_I" "PF_IOD_GENERIC_RX_C0_0:L3_RXD_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI2_RXDecoder_0:data_out_o[9:2]" "c1_data_out_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign IMX334_IF_TOP
generate_component -component_name ${sd_name}
