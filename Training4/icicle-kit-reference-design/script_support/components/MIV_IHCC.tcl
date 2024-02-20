# Exporting core MIV_IHCC to TCL
# Exporting Create HDL core command for module MIV_IHCC
create_hdl_core -file {hdl/miv_ihcc.v} -module {MIV_IHCC} -library {work} -package {}
# Exporting BIF information of  HDL core command for module MIV_IHCC
hdl_core_add_bif -hdl_core_name {MIV_IHCC} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {A_SIDE} -signal_map {\
"PADDR:a_paddr" \
"PENABLE:a_penable" \
"PWRITE:a_pwrite" \
"PRDATA:a_prdata" \
"PWDATA:a_pwdata" \
"PREADY:a_pready" \
"PSLVERR:a_pslverr" \
"PSELx:a_psel" }
hdl_core_add_bif -hdl_core_name {MIV_IHCC} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {B_SIDE} -signal_map {\
"PADDR:b_paddr" \
"PENABLE:b_penable" \
"PWRITE:b_pwrite" \
"PRDATA:b_prdata" \
"PWDATA:b_pwdata" \
"PREADY:b_pready" \
"PSLVERR:b_pslverr" \
"PSELx:b_psel" }
