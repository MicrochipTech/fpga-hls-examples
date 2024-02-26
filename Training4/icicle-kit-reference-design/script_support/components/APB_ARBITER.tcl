# Exporting core APB_ARBITER to TCL
# Exporting Create HDL core command for module APB_ARBITER
create_hdl_core -file {hdl/apb_arbiter.v} -module {APB_ARBITER} -library {work} -package {}
# Exporting BIF information of  HDL core command for module APB_ARBITER
hdl_core_add_bif -hdl_core_name {APB_ARBITER} -bif_definition {APB:AMBA:AMBA2:mirroredMaster} -bif_name {APB_MMASTER} -signal_map {\
"PADDR:in_paddr" \
"PENABLE:in_penable" \
"PWRITE:in_pwrite" \
"PRDATA:in_prdata" \
"PWDATA:in_pwdata" \
"PREADY:in_pready" \
"PSLVERR:in_pslverr" \
"PSELx:in_psel" }
hdl_core_add_bif -hdl_core_name {APB_ARBITER} -bif_definition {APB:AMBA:AMBA2:master} -bif_name {APB_MASTER_low} -signal_map {\
"PADDR:out_low_paddr" \
"PENABLE:out_low_penable" \
"PWRITE:out_low_pwrite" \
"PRDATA:out_low_prdata" \
"PWDATA:out_low_pwdata" \
"PREADY:out_low_pready" \
"PSLVERR:out_low_pslverr" \
"PSELx:out_low_psel" }
hdl_core_add_bif -hdl_core_name {APB_ARBITER} -bif_definition {APB:AMBA:AMBA2:master} -bif_name {APB_MASTER_high} -signal_map {\
"PADDR:out_high_paddr" \
"PENABLE:out_high_penable" \
"PWRITE:out_high_pwrite" \
"PRDATA:out_high_prdata" \
"PWDATA:out_high_pwdata" \
"PREADY:out_high_pready" \
"PSLVERR:out_high_pslverr" \
"PSELx:out_high_psel" }
