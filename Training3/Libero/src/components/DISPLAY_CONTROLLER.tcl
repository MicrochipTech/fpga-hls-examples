# Creating SmartDesign DISPLAY_CONTROLLER
set sd_name {DISPLAY_CONTROLLER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIFO_WE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {disp_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {resetn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {start_output_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {DISP_CLK_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DISP_DE_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DISP_HSYNC_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DISP_VSYNC_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPG_DATA_TRIGGER_START_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPG_DATA_TRIGGER_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPG_FRAME_END_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPG_H_BLANK_START_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPG_VSYNC_START_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {horz_resl_i} -port_direction {IN} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {wdata_i} -port_direction {IN} -port_range {[63:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {DISP_BLUE_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DISP_GREEN_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DISP_RED_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {beats_to_read_o} -port_direction {OUT} -port_range {[15:0]}


# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add COREFIFO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {COREFIFO_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:EMPTY}



# Add data_unpacker_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_unpacker} -hdl_file {hdl\data_unpacker.vhd} -instance_name {data_unpacker_0}



# Add delay_chain_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {delay_chain} -instance_name {delay_chain_0}
# Exporting Parameters of instance delay_chain_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {delay_chain_0} -params {\
"BITWIDTH:2" \
"DELAY:4" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {delay_chain_0}
sd_update_instance -sd_name ${sd_name} -instance_name {delay_chain_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {delay_chain_0:data} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {delay_chain_0:data} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {delay_chain_0:q} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {delay_chain_0:q} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {delay_chain_0:enable} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {delay_chain_0:reset_state} -value {11}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add top_sync_vg_pattern_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {top_sync_vg_pattern} -hdl_file {hdl\top_sync_vg_pattern.v} -instance_name {top_sync_vg_pattern_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:TPG_FV_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:TPG_VSYNC_POL_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:pattern_i} -value {00000010}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:TPG_RED_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:TPG_GREEN_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:TPG_BLUE_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {top_sync_vg_pattern_0:TPG_HRES_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "resetn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "COREFIFO_C0_0:RESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:DVLD" "data_unpacker_0:fifo_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:RCLOCK" "data_unpacker_0:disp_clk_i" "delay_chain_0:clk" "disp_clk_i" "top_sync_vg_pattern_0:clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:RE" "data_unpacker_0:fifo_read_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:WCLOCK" "ddr_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:WE" "FIFO_WE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISP_CLK_o" "top_sync_vg_pattern_0:TPG_CLK_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISP_DE_o" "data_unpacker_0:data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISP_HSYNC_o" "delay_chain_0:q[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISP_VSYNC_o" "delay_chain_0:q[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_0:A" "TPG_FRAME_END_o" "top_sync_vg_pattern_0:TPG_FRAME_END_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TPG_DATA_TRIGGER_START_o" "top_sync_vg_pattern_0:TPG_DATA_TRIGGER_START_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TPG_DATA_TRIGGER_o" "top_sync_vg_pattern_0:TPG_DATA_TRIGGER_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TPG_H_BLANK_START_o" "top_sync_vg_pattern_0:TPG_H_BLANK_START_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TPG_VSYNC_START_o" "top_sync_vg_pattern_0:TPG_VSYNC_START_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:read_en_i" "top_sync_vg_pattern_0:TPG_DE_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:reset_i" "delay_chain_0:reset_n" "start_output_i" "top_sync_vg_pattern_0:resetb_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_chain_0:data[0:0]" "top_sync_vg_pattern_0:TPG_VSYNC_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"delay_chain_0:data[1:1]" "top_sync_vg_pattern_0:TPG_HSYNC_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:DATA" "wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:Q" "data_unpacker_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DISP_BLUE_o" "DISP_GREEN_o" "DISP_RED_o" "data_unpacker_0:data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"beats_to_read_o" "data_unpacker_0:beats_to_read_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_unpacker_0:horz_resl_i" "horz_resl_i" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign DISPLAY_CONTROLLER
generate_component -component_name ${sd_name}
