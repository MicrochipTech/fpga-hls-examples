# Exporting core ddr_rw_arbiter to TCL
# Exporting Create HDL core command for module ddr_rw_arbiter
create_hdl_core -file {hdl/ddr_rw_arbiter.v} -module {ddr_rw_arbiter} -library {work} -package {}
# Exporting BIF information of  HDL core command for module ddr_rw_arbiter
hdl_core_add_bif -hdl_core_name {ddr_rw_arbiter} -bif_definition {AXI4:AMBA:AMBA4:mirroredSlave} -bif_name {M_AXI} -signal_map {\
"AWID:awid" \
"AWADDR:awaddr" \
"AWLEN:awlen" \
"AWSIZE:awsize" \
"AWBURST:awburst" \
"AWLOCK:awlock" \
"AWCACHE:awcache" \
"AWPROT:awprot" \
"AWVALID:awvalid" \
"AWREADY:awready" \
"WDATA:wdata" \
"WSTRB:wstrb" \
"WLAST:wlast" \
"WVALID:wvalid" \
"WREADY:wready" \
"BID:bid" \
"BRESP:bresp" \
"BVALID:bvalid" \
"BREADY:bready" \
"ARID:arid" \
"ARADDR:araddr" \
"ARLEN:arlen" \
"ARSIZE:arsize" \
"ARBURST:arburst" \
"ARLOCK:arlock" \
"ARCACHE:arcache" \
"ARPROT:arprot" \
"ARVALID:arvalid" \
"ARREADY:arready" \
"RID:rid" \
"RDATA:rdata" \
"RRESP:rresp" \
"RLAST:rlast" \
"RVALID:rvalid" \
"RREADY:rready" }
