# Exporting core apb3_if to TCL
# Exporting Create HDL core command for module apb3_if
create_hdl_core -file {hdl/apb_wrapper.vhd} -module {apb3_if} -library {work} -package {}
# Exporting BIF information of  HDL core command for module apb3_if
hdl_core_add_bif -hdl_core_name {apb3_if} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APB_IF} -signal_map {\
"PADDR:paddr_i" \
"PSELx:psel_i" \
"PENABLE:penable_i" \
"PWRITE:pwrite_i" \
"PRDATA:prdata_o" \
"PWDATA:pwdata_i" \
"PREADY:pready_o" \
"PSLVERR:pslverr_o" }
