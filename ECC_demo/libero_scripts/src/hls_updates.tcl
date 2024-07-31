set sd_name {top}
source ./common.tcl

# Paths
set rootPrjAbsPath [file normalize [file dirname [info script]]/../..]

# Clear unused attribute on pins
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {RTG4FCCCECALIB_C0_0:CCC_0_LOCK}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {RTG4FCCCECALIB_C0_0:CCC_0_GL0}

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DB_DETECT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SB_CORRECT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}

# HLS module
source $rootPrjAbsPath/SmartHLS_Project/hls_output/scripts/libero/create_hdl_plus.tcl
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {RAM_OP_top} -instance_name {RAM_OP_top_0}

# UART related modules
create_links -hdl_source {./src/uart_regs/rtl/uart_regs_backend.vhd}
create_links -hdl_source {./src/uart_regs/rtl/uart_rx.vhd}
create_links -hdl_source {./src/uart_regs/rtl/uart_tx.vhd}
create_links -hdl_source {./src/uart_regs/generated/uart_regs.vhd}
create_links -hdl_source {./src/src_hdl/hls_control.v}
create_links -hdl_source {./src/src_hdl/data_register.v}
build_design_hierarchy

# HLS control module
create_hdl_core -file {./src/src_hdl/hls_control.v} -module {hls_control} -library {work}
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {hls_control} -instance_name {hls_control_0}

# data registers
create_hdl_core -file {./src/src_hdl/data_register.v} -module {data_register} -library {work}
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {data_register} -instance_name {read_data_reg}
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {data_register} -instance_name {sum_reg}
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {data_register} -instance_name {sb_count_reg}
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {data_register} -instance_name {db_count_reg}
sd_configure_core_instance -sd_name ${sd_name} -instance_name {read_data_reg} -params {N:8}
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {read_data_reg}
sd_update_instance -sd_name ${sd_name} -instance_name {read_data_reg}

# SLE
sd_instantiate_macro -sd_name ${sd_name} -macro_name {SLE} -instance_name {SLE_SB}
sd_instantiate_macro -sd_name ${sd_name} -macro_name {SLE} -instance_name {SLE_DB}
sd_invert_pins -sd_name ${sd_name} -pin_names {SLE_SB:Q}
sd_invert_pins -sd_name ${sd_name} -pin_names {SLE_DB:Q}

# UART interface
create_hdl_core -file {./src/uart_regs/generated/uart_regs.vhd} -module {uart_regs} -library {work}
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {uart_regs} -instance_name {uart_reg_ifce}
sd_configure_core_instance -sd_name ${sd_name} -instance_name {uart_reg_ifce} \
    -params {baud_rate:115200} \
    -params {clk_hz:80000000} \
    -validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {uart_reg_ifce}
sd_invert_pins -sd_name ${sd_name} -pin_names {uart_reg_ifce:rst}
sd_update_instance -sd_name ${sd_name} -instance_name {uart_reg_ifce}

# clk = RTG4FCCCECALIB_C0_0:CCC_0_GL0
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "RAM_OP_top_0:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "sb_count_reg:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "db_count_reg:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "read_data_reg:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "sum_reg:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "uart_reg_ifce:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "hls_control_0:clk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "SLE_SB:CLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_GL0" "SLE_DB:CLK"}

# resetn = RTG4FCCCECALIB_C0_0:CCC_0_LOCK
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_LOCK" "RAM_OP_top_0:resetn"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_LOCK" "sb_count_reg:resetn"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_LOCK" "db_count_reg:resetn"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_LOCK" "read_data_reg:resetn"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_LOCK" "sum_reg:resetn"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RTG4FCCCECALIB_C0_0:CCC_0_LOCK" "uart_reg_ifce:rst"}

# pins between HLS module and uart_reg_ifce
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:cmd" "uart_reg_ifce:cmd"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:WB_EN" "uart_reg_ifce:WB_EN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:ram_addr" "uart_reg_ifce:ram_addr"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:write_data" "uart_reg_ifce:write_data"}

#pins between HLS module and registers
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:sb_count_write_en" "sb_count_reg:data_in_en"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:sb_count_write_data" "sb_count_reg:data_in"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:db_count_write_en" "db_count_reg:data_in_en"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:db_count_write_data" "db_count_reg:data_in"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:read_data_write_en" "read_data_reg:data_in_en"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:read_data_write_data" "read_data_reg:data_in"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:sum_out_write_en" "sum_reg:data_in_en"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:sum_out_write_data" "sum_reg:data_in"}

# pins between HLS module and SLEs
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:sb_correct_write_en" "SLE_SB:EN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:sb_correct_write_data" "SLE_SB:D"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:db_detect_write_en" "SLE_DB:EN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:db_detect_write_data" "SLE_DB:D"}

# pins between registers and uart_reg_ifce
sd_connect_pins -sd_name ${sd_name} -pin_names {"sb_count_reg:data_out" "uart_reg_ifce:sb_count"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"db_count_reg:data_out" "uart_reg_ifce:db_count"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"read_data_reg:data_out" "uart_reg_ifce:read_data"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"sum_reg:data_out" "uart_reg_ifce:sum_out"}

# HLS control module pins
sd_connect_pins -sd_name ${sd_name} -pin_names {"uart_reg_ifce:start" "hls_control_0:uart_start"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:start" "hls_control_0:hls_start"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"RAM_OP_top_0:finish" "hls_control_0:hls_finish"}

# unused pins in HLS module
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {RAM_OP_top_0:ready}

# constant pins in SLE
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_SB:ADn} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_SB:ALn} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_SB:LAT} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_SB:SD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_SB:SLn} -value {VCC}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_DB:ADn} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_DB:ALn} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_DB:LAT} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_DB:SD} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SLE_DB:SLn} -value {VCC}

# i/o ports
sd_connect_pins -sd_name ${sd_name} -pin_names {"uart_reg_ifce:uart_rx" "RX"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"uart_reg_ifce:uart_tx" "TX"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLE_SB:Q" "SB_CORRECT"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"SLE_DB:Q" "DB_DETECT"}

# reset canvas layout
sd_reset_layout -sd_name ${sd_name}
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign top
generate_component -component_name ${sd_name}

# # update constraints
# # -------------------------------------------------------------------------------------------
# # Derive SDC constraints from the design and the configured cores generated constraints
# derive_constraints_sdc

# # -------------------------------------------------------------------------------------------
# # Link user SDC constraints (not expressed by the derived constraints)
# # and optionally associate to Synthesis, Place and Route and Timing Verification as needed
# # Below is an example

# organize_tool_files -tool {SYNTHESIZE} \
#     -file ../Libero_Project/constraint/top_derived_constraints.sdc \
#     -module {top::work} \
#     -input_type {constraint}
# organize_tool_files -tool {PLACEROUTE} \
#     -file ../Libero_Project/constraint/top_derived_constraints.sdc \
#     -file ../Libero_Project/constraint/io/io_constraints.pdc \
#     -module {top::work} \
#     -input_type {constraint}
# organize_tool_files -tool {VERIFYTIMING} \
#     -file ../Libero_Project/constraint/top_derived_constraints.sdc \
#     -module {top::work} \
#     -input_type {constraint}

# ## run_tool -name {CONSTRAINT_MANAGEMENT} 
# run_tool_wrapper "run_tool -name {CONSTRAINT_MANAGEMENT} 
# "

# save_project