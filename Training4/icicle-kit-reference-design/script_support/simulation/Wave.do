onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -expand -group {Test_bench_LEVEL: ports} /Test_bench/RPi_GPIO13
add wave -noupdate -expand -group {Test_bench_LEVEL: ports} /Test_bench/RPi_GPIO19
add wave -noupdate -expand -group {Test_bench_LEVEL: ports} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/MSS_WRAPPER_1/ICICLE_MSS/MSS_RESET_N_F2M
add wave -noupdate -expand -group {Test_bench_LEVEL: ports} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/MSS_WRAPPER_1/ICICLE_MSS/MSS_RESET_N_M2F 
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PCLK
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PSEL
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PENABLE
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PADDR
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PWRITE
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PWDATA
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PREADY
add wave -noupdate -expand -group {FABRIC: COREGPIO_C0 (at BaseAddress 0x4000_0100, on FIC3)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_3_PERIPHERALS_1/COREGPIO_C0/PRDATA
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/ARESETN
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/ACLK
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/AWVALID
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/AWADDR
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/AWREADY
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/ARADDR
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/ARVALID
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/ARREADY
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/BREADY
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/BVALID
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/RDATA
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/RREADY
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/RVALID
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/WDATA
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/WREADY
add wave -noupdate -expand -group {FABRIC: MSS_LSRAM (at Baseddress 0x6000_0000, on FIC0)} /Test_bench/MPFS_ICICLE_KIT_BASE_DESIGN_0/FIC_0_PERIPHERALS_1/MSS_LSRAM_inst_0/WVALID

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16493562 ps} 0} {{Cursor 2} {6098277 ps} 0}
quietly wave cursor active 2

configure wave -namecolwidth 478
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns

update
WaveRestoreZoom {5611018 ps} {7579768 ps}
