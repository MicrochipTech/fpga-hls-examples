# Creating SmartDesign video_processing
set sd_name {video_processing}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {encoder_en_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_start_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {encoder_en_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {eof_encoder_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_start_encoder_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {B_CONST_I} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {COMMON_CONST_I} -port_direction {IN} -port_range {[19:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_I} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {G_CONST_I} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {R_CONST_I} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {hres_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {vres_i} -port_direction {IN} -port_range {[15:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_B_O} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_G_O} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_R_O} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {y_o} -port_direction {OUT} -port_range {[31:0]}


sd_create_pin_slices -sd_name ${sd_name} -pin_name {hres_i} -pin_slices {[12:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {vres_i} -pin_slices {[12:0]}
# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {AND2_0:B}



# Add Bayer_Interpolation_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Bayer_Interpolation_C0} -instance_name {Bayer_Interpolation_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Bayer_Interpolation_C0_0:BAYER_FORMAT} -value {10}



# Add frame_controls_gen_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {frame_controls_gen} -hdl_file {hdl\frame_controls_gen.v} -instance_name {frame_controls_gen_0}



# Add Gamma_Correction_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Gamma_Correction_C0} -instance_name {Gamma_Correction_C0_0}



# Add Image_Enhancement_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_0:ENABLE_I} -value {VCC}



# Add IMAGE_SCALER_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMAGE_SCALER_C0} -instance_name {IMAGE_SCALER_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {IMAGE_SCALER_C0_0:HORZ_RES_IN_I} -value {0011110000000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {IMAGE_SCALER_C0_0:VERT_RES_IN_I} -value {0010000111000}



# Add intensity_average_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {intensity_average} -hdl_file {hdl\intensity_average.vhd} -instance_name {intensity_average_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "Bayer_Interpolation_C0_0:RESETN_I" "Gamma_Correction_C0_0:RESETN_I" "Image_Enhancement_C0_0:RESETN_I" "RESETN_I" "frame_controls_gen_0:resetn_i" "intensity_average_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "frame_controls_gen_0:frame_start_r1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "IMAGE_SCALER_C0_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:DATA_VALID_I" "DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:EOF_I" "frame_controls_gen_0:frame_start_i" "frame_start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:EOF_O" "intensity_average_0:frame_end_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:RGB_VALID_O" "Gamma_Correction_C0_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:SYS_CLK_I" "Gamma_Correction_C0_0:SYS_CLK_I" "IMAGE_SCALER_C0_0:IP_CLK_I" "IMAGE_SCALER_C0_0:SYS_CLK_I" "Image_Enhancement_C0_0:SYS_CLK_I" "SYS_CLK_I" "frame_controls_gen_0:sys_clk_i" "intensity_average_0:SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_O" "frame_controls_gen_0:data_valid_r1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:DATA_VALID_O" "Image_Enhancement_C0_0:DATA_VALID_I" "intensity_average_0:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_VALID_I" "Image_Enhancement_C0_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_VALID_O" "frame_controls_gen_0:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"encoder_en_i" "frame_controls_gen_0:encoder_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"encoder_en_o" "frame_controls_gen_0:encoder_en_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"eof_encoder_o" "frame_controls_gen_0:eof_encoder_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_controls_gen_0:frame_start_encoder_o" "frame_start_encoder_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"B_CONST_I" "Image_Enhancement_C0_0:B_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:B_O" "Gamma_Correction_C0_0:BLUE_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:DATA_I" "DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:G_O" "Gamma_Correction_C0_0:GREEN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:R_O" "Gamma_Correction_C0_0:RED_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COMMON_CONST_I" "Image_Enhancement_C0_0:COMMON_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_B_O" "frame_controls_gen_0:data_b_r1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_G_O" "frame_controls_gen_0:data_g_r1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_R_O" "frame_controls_gen_0:data_r_r1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"G_CONST_I" "Image_Enhancement_C0_0:G_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:BLUE_O" "Image_Enhancement_C0_0:B_I" "intensity_average_0:b_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:GREEN_O" "Image_Enhancement_C0_0:G_I" "intensity_average_0:g_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:RED_O" "Image_Enhancement_C0_0:R_I" "intensity_average_0:r_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_B_I" "Image_Enhancement_C0_0:B_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_B_O" "frame_controls_gen_0:data_b_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_G_I" "Image_Enhancement_C0_0:G_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_G_O" "frame_controls_gen_0:data_g_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_R_I" "Image_Enhancement_C0_0:R_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:DATA_R_O" "frame_controls_gen_0:data_r_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:HORZ_RES_OUT_I" "hres_i[12:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:SCALE_FACTOR_HORZ_I" "frame_controls_gen_0:h_scale_factor_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:SCALE_FACTOR_VERT_I" "frame_controls_gen_0:v_scale_factor_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMAGE_SCALER_C0_0:VERT_RES_OUT_I" "vres_i[12:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:R_CONST_I" "R_CONST_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_controls_gen_0:hres_i" "hres_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_controls_gen_0:vres_i" "vres_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"intensity_average_0:y_o" "y_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign video_processing
generate_component -component_name ${sd_name}
