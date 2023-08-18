# Creating SmartDesign video_pipelining
set sd_name {video_pipelining}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {A_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {A} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {B_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {B} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {C} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {D} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EOF_I_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_I_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK_I_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_in} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {eof_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {hdmi_valid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mode_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pclk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {penable_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {preset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {psel_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pwrite_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ren_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {reset_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {selection_line_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {source_select_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {toggle} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {vsync_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RGB_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Y_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Y} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_enable_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {pslverr_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {BAYER_FORMAT_0} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BAYER_FORMAT_1} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {BAYER_FORMAT} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_I_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_I_1} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_I} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {alpha_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {b_gain_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {brightness_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {contrast_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_address1_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_address2_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {g_gain_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_shift_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {input1_i} -port_direction {IN} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {paddr_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {pwdata_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r_gain_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {step_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {switches_readdata} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_shift_i} -port_direction {IN} -port_range {[15:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {B_out_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_O_0} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_O_1} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_O_2} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_O} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {G_out_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {R_out_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_address1_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_start_address2_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_shift_o} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {onehot_filter_state} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {prdata_o} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_shift_o} -port_direction {OUT} -port_range {[15:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_IF} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:paddr_i" \
"PSELx:psel_i" \
"PENABLE:penable_i" \
"PWRITE:pwrite_i" \
"PRDATA:prdata_o" \
"PWDATA:pwdata_i" \
"PREADY:pready_o" \
"PSLVERR:pslverr_o" } 

# Add alpha_blend_smarthls_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {alpha_blend_smarthls_top} -instance_name {alpha_blend_smarthls_top_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {alpha_blend_smarthls_top_0:output_fifo} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {alpha_blend_smarthls_top_0:output_fifo} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {alpha_blend_smarthls_top_0:output_fifo} -pin_slices {[7:0]}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {alpha_blend_smarthls_top_0:output_fifo_axi4stream} -pin_names {alpha_blend_smarthls_top_0:output_fifo}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {alpha_blend_smarthls_top_0:output_fifo_axi4stream} -pin_names {alpha_blend_smarthls_top_0:output_fifo_ready}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {alpha_blend_smarthls_top_0:output_fifo_axi4stream} -pin_names {alpha_blend_smarthls_top_0:output_fifo_valid}
sd_invert_pins -sd_name ${sd_name} -pin_names {alpha_blend_smarthls_top_0:reset}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {alpha_blend_smarthls_top_0:start} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {alpha_blend_smarthls_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {alpha_blend_smarthls_top_0:finish}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {alpha_blend_smarthls_top_0:input_fifo_ready}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {alpha_blend_smarthls_top_0:output_fifo_ready} -value {VCC}



# Add alpha_enable_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {alpha_enable} -hdl_file {hdl/alpha_enable.vhd} -instance_name {alpha_enable_0}



# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {AND2_0:B}



# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add AND2_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_2}



# Add AND4_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND4_0}



# Add apb3_if_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {apb3_if} -instance_name {apb3_if_0}
# Exporting Parameters of instance apb3_if_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {apb3_if_0} -params {\
"g_APB3_IF_DATA_WIDTH:32" \
"g_CONST_WIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {apb3_if_0}
sd_update_instance -sd_name ${sd_name} -instance_name {apb3_if_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:mode_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:SCALAR_RESET_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:alpha_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:step_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:frame_tcount_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:HORZ_RES_IN_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:VERT_RES_IN_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:HORZ_RES_OUT_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:VERT_RES_OUT_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:SCALE_FACTOR_HORZ_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:SCALE_FACTOR_VERT_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:RED_FRAME_DDR_ADDR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:GREEN_FRAME_DDR_ADDR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:BLUE_FRAME_DDR_ADDR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:HORZ_RES_DDR_RD_OUT_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {apb3_if_0:DDR_READ_FRAME_START_ADDR_O}



# Add Bayer_Interpolation_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Bayer_Interpolation_C0} -instance_name {Bayer_Interpolation_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Bayer_Interpolation_C0_0:EOF_O}



# Add Bayer_Interpolation_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Bayer_Interpolation_C1} -instance_name {Bayer_Interpolation_C1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Bayer_Interpolation_C1_0:EOF_O}



# Add Bayer_Interpolation_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Bayer_Interpolation_C2} -instance_name {Bayer_Interpolation_C2_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:R_O} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:R_O} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:R_O} -pin_slices {[31:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:R_O} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:G_O} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:G_O} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:G_O} -pin_slices {[31:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:G_O} -pin_slices {[7:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:B_O} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:B_O} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:B_O} -pin_slices {[31:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Bayer_Interpolation_C2_0:B_O} -pin_slices {[7:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Bayer_Interpolation_C2_0:EOF_O}



# Add delay_buffer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {delay_buffer} -hdl_file {hdl/buffer.vhd} -instance_name {delay_buffer_0}



# Add delay_circuit_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {delay_circuit} -hdl_file {hdl/delay_circuit.vhd} -instance_name {delay_circuit_0}



# Add Image_Enhancement_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_0:ENABLE_I} -value {VCC}



# Add Image_Enhancement_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_1}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_1:DATA_I} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_1:DATA_I} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_1:DATA_I} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_1:ENABLE_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_1:DATA_VALID_O}



# Add Image_Enhancement_C0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_2}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_2:DATA_I} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_2:DATA_I} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_2:DATA_I} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_2:ENABLE_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_2:DATA_VALID_O}



# Add Image_Enhancement_C0_3 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_3}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_3:DATA_I} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_3:DATA_I} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_3:DATA_I} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_3:ENABLE_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_3:DATA_VALID_O}



# Add Image_Enhancement_C0_4 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_4}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_4:DATA_I} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_4:DATA_I} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C0_4:DATA_I} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_4:ENABLE_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_4:DATA_VALID_O}



# Add Image_Enhancement_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C1} -instance_name {Image_Enhancement_C1_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C1_0:DATA_I} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C1_0:DATA_I} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Image_Enhancement_C1_0:DATA_I} -pin_slices {[7:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Image_Enhancement_C1_0:ENABLE_I} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Image_Enhancement_C1_0:DATA_VALID_O}



# Add intensity_average_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {intensity_average} -hdl_file {hdl/intensity_average.vhd} -instance_name {intensity_average_0}



# Add intensity_average_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {intensity_average} -hdl_file {hdl/intensity_average.vhd} -instance_name {intensity_average_1}



# Add LegUp_Image_Filters_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {LegUp_Image_Filters} -instance_name {LegUp_Image_Filters_0}



# Add MUX_2_to_1_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {MUX_2_to_1} -hdl_file {hdl/MUX_2_to_1.vhd} -instance_name {MUX_2_to_1_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MUX_2_to_1_0:input1_i} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MUX_2_to_1_0:input1_i} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MUX_2_to_1_0:input1_i} -pin_slices {[7:0]}



# Add MUX_2_to_1_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {MUX_2_to_1} -hdl_file {hdl/MUX_2_to_1.vhd} -instance_name {MUX_2_to_1_1}



# Add pip_mode_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {pip_mode} -hdl_file {hdl/PIP_mode.vhd} -instance_name {pip_mode_0}



# Add RGB2YCbCr_smarthls_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {RGB2YCbCr_smarthls_top} -instance_name {RGB2YCbCr_smarthls_top_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:reset}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:start} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:finish}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:input_fifo_ready}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:output_fifo_ready} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:output_fifo_Cb}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RGB2YCbCr_smarthls_top_0:output_fifo_Cr}



# Add selector_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {selector} -hdl_file {hdl/selector.vhd} -instance_name {selector_0}



# Add synchronizer_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit} -hdl_file {hdl\synchronizer_circuit.vhd} -instance_name {synchronizer_0}



# Add video_fifo_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {video_fifo} -instance_name {video_fifo_0}
# Exporting Parameters of instance video_fifo_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {video_fifo_0} -params {\
"g_HALF_EMPTY_THRESHOLD:1280" \
"g_INPUT_VIDEO_DATA_BIT_WIDTH:24" \
"g_VIDEO_FIFO_AWIDTH:12" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_update_instance -sd_name ${sd_name} -instance_name {video_fifo_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wfull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rdata_rdy_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:wdata_count_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_0:rdata_count_o}



# Add video_fifo_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {video_fifo} -instance_name {video_fifo_1}
# Exporting Parameters of instance video_fifo_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {video_fifo_1} -params {\
"g_HALF_EMPTY_THRESHOLD:1280" \
"g_INPUT_VIDEO_DATA_BIT_WIDTH:24" \
"g_VIDEO_FIFO_AWIDTH:14" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {video_fifo_1}
sd_update_instance -sd_name ${sd_name} -instance_name {video_fifo_1}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {video_fifo_1:wdata_i} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {video_fifo_1:wdata_i} -pin_slices {[23:16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {video_fifo_1:wdata_i} -pin_slices {[7:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:wfull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:wdata_count_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {video_fifo_1:rdata_count_o}



# Add YCbCr2RGB_smarthls_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {YCbCr2RGB_smarthls_top} -instance_name {YCbCr2RGB_smarthls_top_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:reset}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:start} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:ready}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:finish}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:input_fifo_ready}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:output_fifo_ready} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:input_fifo_Cb} -value {10000000}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {YCbCr2RGB_smarthls_top_0:input_fifo_Cr} -value {10000000}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "AND2_2:B" "AND4_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "Bayer_Interpolation_C0_0:RESETN_I" "Bayer_Interpolation_C1_0:RESETN_I" "Image_Enhancement_C0_0:RESETN_I" "Image_Enhancement_C1_0:RESETN_I" "LegUp_Image_Filters_0:reset_n" "RESETN_I" "RGB2YCbCr_smarthls_top_0:reset" "YCbCr2RGB_smarthls_top_0:reset" "alpha_blend_smarthls_top_0:reset" "alpha_enable_0:reset_i" "delay_buffer_0:reset_i" "delay_circuit_0:reset_n" "intensity_average_0:RESETN_I" "intensity_average_1:RESETN_I" "synchronizer_0:reset_n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "LegUp_Image_Filters_0:vsync" "apb3_if_0:frame_end_i" "intensity_average_0:frame_end_i" "intensity_average_1:frame_end_i" "vsync_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "video_fifo_0:rresetn_i" "video_fifo_0:wresetn_i" "video_fifo_1:rresetn_i" "video_fifo_1:wresetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:A" "Bayer_Interpolation_C1_0:RGB_VALID_O" "Image_Enhancement_C1_0:DATA_VALID_I" "intensity_average_1:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:B" "B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "alpha_enable_0:en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_2:A" "A_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_2:Y" "Y_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:B" "B_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:C" "C" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:D" "D" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND4_0:Y" "Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:DATA_VALID_I" "DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:EOF_I" "Bayer_Interpolation_C1_0:EOF_I" "delay_buffer_0:eof_i" "eof_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:RGB_VALID_O" "RGB2YCbCr_smarthls_top_0:input_fifo_valid" "intensity_average_0:data_valid_i" "video_fifo_1:wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:SYS_CLK_I" "Bayer_Interpolation_C1_0:SYS_CLK_I" "Image_Enhancement_C0_0:SYS_CLK_I" "Image_Enhancement_C1_0:SYS_CLK_I" "LegUp_Image_Filters_0:clk" "RGB2YCbCr_smarthls_top_0:clk" "SYS_CLK_I" "YCbCr2RGB_smarthls_top_0:clk" "alpha_blend_smarthls_top_0:clk" "alpha_enable_0:sys_clk_i" "delay_buffer_0:sys_clk_i" "delay_circuit_0:sys_clk" "intensity_average_0:SYS_CLK_I" "intensity_average_1:SYS_CLK_I" "synchronizer_0:sys_clk" "video_fifo_0:rclock_i" "video_fifo_0:wclock_i" "video_fifo_1:rclock_i" "video_fifo_1:wclock_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C1_0:DATA_VALID_I" "DATA_VALID_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:DATA_VALID_I" "DATA_VALID_I_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:EOF_I" "EOF_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:RESETN_I" "Image_Enhancement_C0_1:RESETN_I" "Image_Enhancement_C0_2:RESETN_I" "Image_Enhancement_C0_3:RESETN_I" "Image_Enhancement_C0_4:RESETN_I" "RESETN_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:RGB_VALID_O" "Image_Enhancement_C0_1:DATA_VALID_I" "Image_Enhancement_C0_2:DATA_VALID_I" "Image_Enhancement_C0_3:DATA_VALID_I" "Image_Enhancement_C0_4:DATA_VALID_I" "RGB_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:SYS_CLK_I" "Image_Enhancement_C0_1:SYS_CLK_I" "Image_Enhancement_C0_2:SYS_CLK_I" "Image_Enhancement_C0_3:SYS_CLK_I" "Image_Enhancement_C0_4:SYS_CLK_I" "SYS_CLK_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_O" "delay_circuit_0:alpha_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:DATA_VALID_I" "video_fifo_1:rdata_rdy_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:DATA_VALID_O" "delay_circuit_0:img_valid_i" "video_fifo_0:ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:input_valid" "RGB2YCbCr_smarthls_top_0:output_fifo_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:output_valid" "YCbCr2RGB_smarthls_top_0:input_fifo_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:toggle" "toggle" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_0:selection_line_i" "selection_line_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_1:selection_line_i" "synchronizer_0:sync_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"YCbCr2RGB_smarthls_top_0:output_fifo_valid" "video_fifo_1:ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"alpha_blend_smarthls_top_0:input_fifo_valid" "delay_circuit_0:img_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"alpha_blend_smarthls_top_0:output_fifo_valid" "delay_circuit_0:alpha_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:pclk_i" "pclk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:preset_i" "preset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_enable_o" "ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_in" "synchronizer_0:data_in" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"hdmi_valid" "video_fifo_0:wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mode_i" "pip_mode_0:mode_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pip_mode_0:reset_i" "reset_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pip_mode_0:sys_clk_i" "sys_clk_i_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"selector_0:source_select_i" "source_select_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BAYER_FORMAT" "Bayer_Interpolation_C1_0:BAYER_FORMAT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BAYER_FORMAT_0" "Bayer_Interpolation_C0_0:BAYER_FORMAT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BAYER_FORMAT_1" "Bayer_Interpolation_C2_0:BAYER_FORMAT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"B_out_o" "alpha_blend_smarthls_top_0:output_fifo[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:B_O" "RGB2YCbCr_smarthls_top_0:input_fifo_B" "intensity_average_0:b_i" "video_fifo_1:wdata_i[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:DATA_I" "DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:G_O" "RGB2YCbCr_smarthls_top_0:input_fifo_G" "intensity_average_0:g_i" "video_fifo_1:wdata_i[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:R_O" "RGB2YCbCr_smarthls_top_0:input_fifo_R" "intensity_average_0:r_i" "video_fifo_1:wdata_i[23:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C1_0:B_O" "Image_Enhancement_C1_0:DATA_I[7:0]" "intensity_average_1:b_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C1_0:DATA_I" "DATA_I_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C1_0:G_O" "Image_Enhancement_C1_0:DATA_I[15:8]" "intensity_average_1:g_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C1_0:R_O" "Image_Enhancement_C1_0:DATA_I[23:16]" "intensity_average_1:r_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:B_O[15:8]" "Image_Enhancement_C0_3:DATA_I[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:B_O[23:16]" "Image_Enhancement_C0_2:DATA_I[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:B_O[31:24]" "Image_Enhancement_C0_1:DATA_I[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:B_O[7:0]" "Image_Enhancement_C0_4:DATA_I[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:DATA_I" "DATA_I_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:G_O[15:8]" "Image_Enhancement_C0_3:DATA_I[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:G_O[23:16]" "Image_Enhancement_C0_2:DATA_I[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:G_O[31:24]" "Image_Enhancement_C0_1:DATA_I[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:G_O[7:0]" "Image_Enhancement_C0_4:DATA_I[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:R_O[15:8]" "Image_Enhancement_C0_3:DATA_I[23:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:R_O[23:16]" "Image_Enhancement_C0_2:DATA_I[23:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:R_O[31:24]" "Image_Enhancement_C0_1:DATA_I[23:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C2_0:R_O[7:0]" "Image_Enhancement_C0_4:DATA_I[23:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_O" "Image_Enhancement_C0_1:DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_O_0" "Image_Enhancement_C0_4:DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_O_1" "Image_Enhancement_C0_3:DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_O_2" "Image_Enhancement_C0_2:DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"G_out_0" "alpha_blend_smarthls_top_0:output_fifo[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:B_CONST_I" "Image_Enhancement_C0_1:B_CONST_I" "Image_Enhancement_C0_2:B_CONST_I" "Image_Enhancement_C0_3:B_CONST_I" "Image_Enhancement_C0_4:B_CONST_I" "Image_Enhancement_C1_0:B_CONST_I" "apb3_if_0:bconst_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:COMMON_CONST_I" "Image_Enhancement_C0_1:COMMON_CONST_I" "Image_Enhancement_C0_2:COMMON_CONST_I" "Image_Enhancement_C0_3:COMMON_CONST_I" "Image_Enhancement_C0_4:COMMON_CONST_I" "Image_Enhancement_C1_0:COMMON_CONST_I" "apb3_if_0:second_const_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:DATA_I" "MUX_2_to_1_0:output_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:DATA_O" "delay_circuit_0:img_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:G_CONST_I" "Image_Enhancement_C0_1:G_CONST_I" "Image_Enhancement_C0_2:G_CONST_I" "Image_Enhancement_C0_3:G_CONST_I" "Image_Enhancement_C0_4:G_CONST_I" "Image_Enhancement_C1_0:G_CONST_I" "apb3_if_0:gconst_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:R_CONST_I" "Image_Enhancement_C0_1:R_CONST_I" "Image_Enhancement_C0_2:R_CONST_I" "Image_Enhancement_C0_3:R_CONST_I" "Image_Enhancement_C0_4:R_CONST_I" "Image_Enhancement_C1_0:R_CONST_I" "apb3_if_0:rconst_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C1_0:DATA_O" "alpha_blend_smarthls_top_0:input_fifo_channel2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:greyscale_input" "RGB2YCbCr_smarthls_top_0:output_fifo_Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:onehot_state" "onehot_filter_state" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:processing_output" "YCbCr2RGB_smarthls_top_0:input_fifo_Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LegUp_Image_Filters_0:switches" "switches_readdata" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_0:input1_i[15:8]" "YCbCr2RGB_smarthls_top_0:output_fifo_G" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_0:input1_i[23:16]" "YCbCr2RGB_smarthls_top_0:output_fifo_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_0:input1_i[7:0]" "YCbCr2RGB_smarthls_top_0:output_fifo_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_0:input2_i" "video_fifo_1:rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_1:input1_i" "video_fifo_0:rdata_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_1:input2_i" "delay_circuit_0:img_data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MUX_2_to_1_1:output_o" "alpha_blend_smarthls_top_0:input_fifo_channel1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"R_out_o" "alpha_blend_smarthls_top_0:output_fifo[23:16]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"alpha_blend_smarthls_top_0:input_fifo_alpha" "alpha_enable_0:alpha_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"alpha_enable_0:alpha_i" "alpha_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:RGB_SUM_B1" "intensity_average_0:y_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:RGB_SUM_B2" "intensity_average_1:y_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:b_gain_i" "b_gain_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:brightness_i" "brightness_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:contrast_i" "contrast_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:g_gain_i" "g_gain_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"apb3_if_0:r_gain_i" "r_gain_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_buffer_0:h_shift_i" "pip_mode_0:h_shift_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_buffer_0:h_shift_o" "h_shift_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_buffer_0:v_shift_i" "pip_mode_0:v_shift_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_buffer_0:v_shift_o" "v_shift_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_start_address1_i" "selector_0:frame_start_address1_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_start_address1_o" "selector_0:frame_start_address1_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_start_address2_i" "selector_0:frame_start_address2_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_start_address2_o" "selector_0:frame_start_address2_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"h_shift_i" "pip_mode_0:h_shift_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"input1_i" "video_fifo_0:wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pip_mode_0:step_i" "step_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"pip_mode_0:v_shift_i" "v_shift_i" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_IF" "apb3_if_0:APB_IF" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign video_pipelining
generate_component -component_name ${sd_name}
