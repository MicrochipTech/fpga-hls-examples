# Exporting core MIV_IHCIA to TCL
# Exporting Create HDL core command for module MIV_IHCIA
create_hdl_core -file {hdl/miv_ihcia.v} -module {MIV_IHCIA} -library {work} -package {}
# Exporting BIF information of  HDL core command for module MIV_IHCIA
hdl_core_add_bif -hdl_core_name {MIV_IHCIA} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APB_SLAVE} -signal_map {\
"PADDR:paddr" \
"PENABLE:penable" \
"PWRITE:pwrite" \
"PRDATA:prdata" \
"PWDATA:pwdata" \
"PREADY:pready" \
"PSLVERR:pslverr" \
"PSELx:psel" }
