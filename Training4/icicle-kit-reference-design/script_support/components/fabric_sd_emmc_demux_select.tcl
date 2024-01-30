# Exporting core fabric_sd_emmc_demux_select to TCL
# Exporting Create HDL core command for module fabric_sd_emmc_demux_select
create_hdl_core -file {hdl/fabric_sd_emmc_demux_select.v} -module {fabric_sd_emmc_demux_select} -library {work} -package {}
# Exporting BIF information of  HDL core command for module fabric_sd_emmc_demux_select
hdl_core_add_bif -hdl_core_name {fabric_sd_emmc_demux_select} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APBslave} -signal_map {\
"PADDR:paddr" \
"PENABLE:penable" \
"PWRITE:pwrite" \
"PRDATA:prdata" \
"PWDATA:pwdata" \
"PREADY:pready" \
"PSLVERR:pslverr" \
"PSELx:psel" }
