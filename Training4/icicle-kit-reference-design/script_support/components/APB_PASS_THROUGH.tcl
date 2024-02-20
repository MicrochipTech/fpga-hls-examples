# Exporting core APB_PASS_THROUGH to TCL
# Exporting Create HDL core command for module APB_PASS_THROUGH
create_hdl_core -file {hdl/APB_PASS_THROUGH.v} -module {APB_PASS_THROUGH} -library {work} -package {}
# Exporting BIF information of  HDL core command for module APB_PASS_THROUGH
hdl_core_add_bif -hdl_core_name {APB_PASS_THROUGH} -bif_definition {APB:AMBA:AMBA2:master} -bif_name {APB_INITIATOR} -signal_map {\
"PADDR:initiator_paddr" \
"PENABLE:initiator_penable" \
"PWRITE:initiator_pwrite" \
"PRDATA:initiator_prdata" \
"PWDATA:initiator_pwdata" \
"PREADY:initiator_pready" \
"PSLVERR:initiator_pslverr" \
"PSELx:initiator_psel" }
hdl_core_add_bif -hdl_core_name {APB_PASS_THROUGH} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APB_TARGET} -signal_map {\
"PADDR:target_paddr" \
"PENABLE:target_penable" \
"PWRITE:target_pwrite" \
"PRDATA:target_prdata" \
"PWDATA:target_pwdata" \
"PREADY:target_pready" \
"PSLVERR:target_pslverr" \
"PSELx:target_psel" }
