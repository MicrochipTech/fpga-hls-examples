
# TODO. Parametrize address, data, id and user widths

proc create_axim_mirror_ifce {sd_name axi_name} {
    puts "create_axim_mirror_ifce..."
    puts "sd_name:${sd_name}"
    puts "axi_name:${axi_name}"

    # Initiator Interface
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arvalid -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awvalid -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_bready -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_rready -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_wlast -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_wvalid -port_direction IN
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_araddr -port_direction IN -port_range {[37:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arburst -port_direction IN -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arcache -port_direction IN -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arid -port_direction IN -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arlen -port_direction IN -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arlock -port_direction IN -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arprot -port_direction IN -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arqos -port_direction IN -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arregion -port_direction IN -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arsize -port_direction IN -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_aruser -port_direction IN -port_range {[0:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awaddr -port_direction IN -port_range {[37:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awburst -port_direction IN -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awcache -port_direction IN -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awid -port_direction IN -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awlen -port_direction IN -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awlock -port_direction IN -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awprot -port_direction IN -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awqos -port_direction IN -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awregion -port_direction IN -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awsize -port_direction IN -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awuser -port_direction IN -port_range {[0:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_wdata -port_direction IN -port_range {[63:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_wstrb -port_direction IN -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_wuser -port_direction IN -port_range {[0:0]}

    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_arready -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_awready -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_bvalid -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_rlast -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_rvalid -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_wready -port_direction OUT
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_bid -port_direction OUT -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_bresp -port_direction OUT -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_buser -port_direction OUT -port_range {[0:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_rdata -port_direction OUT -port_range {[63:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_rid -port_direction OUT -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_rresp -port_direction OUT -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_initiator_ruser -port_direction OUT -port_range {[0:0]}

    # Target Interface
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_arready -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_awready -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_bvalid -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_rlast -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_rvalid -port_direction IN
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_wready -port_direction IN
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_bid -port_direction IN -port_range {[8:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_bresp -port_direction IN -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_buser -port_direction IN -port_range {[0:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_rdata -port_direction IN -port_range {[63:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_rid -port_direction IN -port_range {[8:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_rresp -port_direction IN -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_ruser -port_direction IN -port_range {[0:0]}

    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_arvalid -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_awvalid -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_bready -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_rready -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_wlast -port_direction OUT
    sd_create_scalar_port -sd_name ${sd_name} -port_name ${axi_name}axi_target_wvalid -port_direction OUT
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_araddr -port_direction OUT -port_range {[31:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arburst -port_direction OUT -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arcache -port_direction OUT -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arid -port_direction OUT -port_range {[8:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arlen -port_direction OUT -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arlock -port_direction OUT -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arprot -port_direction OUT -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arqos -port_direction OUT -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arregion -port_direction OUT -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_arsize -port_direction OUT -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_aruser -port_direction OUT -port_range {[0:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awaddr -port_direction OUT -port_range {[31:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awburst -port_direction OUT -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awcache -port_direction OUT -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awid -port_direction OUT -port_range {[8:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awlen -port_direction OUT -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awlock -port_direction OUT -port_range {[1:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awprot -port_direction OUT -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awqos -port_direction OUT -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awregion -port_direction OUT -port_range {[3:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awsize -port_direction OUT -port_range {[2:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_awuser -port_direction OUT -port_range {[0:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_wdata -port_direction OUT -port_range {[63:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_wstrb -port_direction OUT -port_range {[7:0]}
    sd_create_bus_port    -sd_name ${sd_name} -port_name ${axi_name}axi_target_wuser -port_direction OUT -port_range {[0:0]}


    # Create top level Bus interface Ports
    sd_create_bif_port \
        -sd_name ${sd_name} \
        -port_name ${axi_name}axi_initiator \
        -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} \
        -port_bif_role {mirroredMaster} \
        -port_bif_mapping [subst {\
            "AWID:${axi_name}axi_initiator_awid" \
            "AWADDR:${axi_name}axi_initiator_awaddr" \
            "AWLEN:${axi_name}axi_initiator_awlen" \
            "AWSIZE:${axi_name}axi_initiator_awsize" \
            "AWBURST:${axi_name}axi_initiator_awburst" \
            "AWLOCK:${axi_name}axi_initiator_awlock" \
            "AWCACHE:${axi_name}axi_initiator_awcache" \
            "AWPROT:${axi_name}axi_initiator_awprot" \
            "AWQOS:${axi_name}axi_initiator_awqos" \
            "AWREGION:${axi_name}axi_initiator_awregion" \
            "AWVALID:${axi_name}axi_initiator_awvalid" \
            "AWREADY:${axi_name}axi_initiator_awready" \
            "WDATA:${axi_name}axi_initiator_wdata" \
            "WSTRB:${axi_name}axi_initiator_wstrb" \
            "WLAST:${axi_name}axi_initiator_wlast" \
            "WVALID:${axi_name}axi_initiator_wvalid" \
            "WREADY:${axi_name}axi_initiator_wready" \
            "BID:${axi_name}axi_initiator_bid" \
            "BRESP:${axi_name}axi_initiator_bresp" \
            "BVALID:${axi_name}axi_initiator_bvalid" \
            "BREADY:${axi_name}axi_initiator_bready" \
            "ARID:${axi_name}axi_initiator_arid" \
            "ARADDR:${axi_name}axi_initiator_araddr" \
            "ARLEN:${axi_name}axi_initiator_arlen" \
            "ARSIZE:${axi_name}axi_initiator_arsize" \
            "ARBURST:${axi_name}axi_initiator_arburst" \
            "ARLOCK:${axi_name}axi_initiator_arlock" \
            "ARCACHE:${axi_name}axi_initiator_arcache" \
            "ARPROT:${axi_name}axi_initiator_arprot" \
            "ARQOS:${axi_name}axi_initiator_arqos" \
            "ARREGION:${axi_name}axi_initiator_arregion" \
            "ARVALID:${axi_name}axi_initiator_arvalid" \
            "ARREADY:${axi_name}axi_initiator_arready" \
            "RID:${axi_name}axi_initiator_rid" \
            "RDATA:${axi_name}axi_initiator_rdata" \
            "RRESP:${axi_name}axi_initiator_rresp" \
            "RLAST:${axi_name}axi_initiator_rlast" \
            "RVALID:${axi_name}axi_initiator_rvalid" \
            "RREADY:${axi_name}axi_initiator_rready" \
            "AWUSER:${axi_name}axi_initiator_awuser" \
            "WUSER:${axi_name}axi_initiator_wuser" \
            "BUSER:${axi_name}axi_initiator_buser" \
            "ARUSER:${axi_name}axi_initiator_aruser" \
            "RUSER:${axi_name}axi_initiator_ruser" \
        }] 

    sd_create_bif_port \
        -sd_name ${sd_name} \
        -port_name ${axi_name}axi_target \
        -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} \
        -port_bif_role {mirroredSlave} \
        -port_bif_mapping [subst {\
            "AWID:${axi_name}axi_target_awid" \
            "AWADDR:${axi_name}axi_target_awaddr" \
            "AWLEN:${axi_name}axi_target_awlen" \
            "AWSIZE:${axi_name}axi_target_awsize" \
            "AWBURST:${axi_name}axi_target_awburst" \
            "AWLOCK:${axi_name}axi_target_awlock" \
            "AWCACHE:${axi_name}axi_target_awcache" \
            "AWPROT:${axi_name}axi_target_awprot" \
            "AWQOS:${axi_name}axi_target_awqos" \
            "AWREGION:${axi_name}axi_target_awregion" \
            "AWVALID:${axi_name}axi_target_awvalid" \
            "AWREADY:${axi_name}axi_target_awready" \
            "WDATA:${axi_name}axi_target_wdata" \
            "WSTRB:${axi_name}axi_target_wstrb" \
            "WLAST:${axi_name}axi_target_wlast" \
            "WVALID:${axi_name}axi_target_wvalid" \
            "WREADY:${axi_name}axi_target_wready" \
            "BID:${axi_name}axi_target_bid" \
            "BRESP:${axi_name}axi_target_bresp" \
            "BVALID:${axi_name}axi_target_bvalid" \
            "BREADY:${axi_name}axi_target_bready" \
            "ARID:${axi_name}axi_target_arid" \
            "ARADDR:${axi_name}axi_target_araddr" \
            "ARLEN:${axi_name}axi_target_arlen" \
            "ARSIZE:${axi_name}axi_target_arsize" \
            "ARBURST:${axi_name}axi_target_arburst" \
            "ARLOCK:${axi_name}axi_target_arlock" \
            "ARCACHE:${axi_name}axi_target_arcache" \
            "ARPROT:${axi_name}axi_target_arprot" \
            "ARQOS:${axi_name}axi_target_arqos" \
            "ARREGION:${axi_name}axi_target_arregion" \
            "ARVALID:${axi_name}axi_target_arvalid" \
            "ARREADY:${axi_name}axi_target_arready" \
            "RID:${axi_name}axi_target_rid" \
            "RDATA:${axi_name}axi_target_rdata" \
            "RRESP:${axi_name}axi_target_rresp" \
            "RLAST:${axi_name}axi_target_rlast" \
            "RVALID:${axi_name}axi_target_rvalid" \
            "RREADY:${axi_name}axi_target_rready" \
            "AWUSER:${axi_name}axi_target_awuser" \
            "WUSER:${axi_name}axi_target_wuser" \
            "BUSER:${axi_name}axi_target_buser" \
            "ARUSER:${axi_name}axi_target_aruser" \
            "RUSER:${axi_name}axi_target_ruser" \
        }] 
        
    sd_mark_pins_unused -sd_name ${sd_name} -pin_names ${axi_name}axi_initiator
    sd_mark_pins_unused -sd_name ${sd_name} -pin_names ${axi_name}axi_target
    puts "create_axim_mirror_ifce: Done"
}


