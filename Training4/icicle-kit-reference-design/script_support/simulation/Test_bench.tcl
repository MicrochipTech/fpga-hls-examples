# Create SmartDesign Test Bench
set sd_tb_name {Test_bench}
new_testbench_file_for_design -type {SmartDesignTestBench} -name ${sd_tb_name} -SetAsActiveStimulus 1 -source {MPFS_ICICLE_KIT_BASE_DESIGN} -library {work} 

# Add clk gen components
create_and_configure_core -core_vlnv {Actel:Simulation:CLK_GEN:*} -component_name {CLK_GEN_125MHz} -params {"CLK_PERIOD:8000" "DUTY_CYCLE:50"} 
sd_instantiate_component -sd_name ${sd_tb_name} -component_name {CLK_GEN_125MHz} -instance_name {} 
create_and_configure_core -core_vlnv {Actel:Simulation:CLK_GEN:*} -component_name {CLK_GEN_50MHz} -params {"CLK_PERIOD:20000" "DUTY_CYCLE:50"} 
sd_instantiate_component -sd_name ${sd_tb_name} -component_name {CLK_GEN_50MHz} -instance_name {} 
create_and_configure_core -core_vlnv {Actel:Simulation:RESET_GEN:*} -component_name {RESET_GEN_C0} -params {"DELAY:1000" "LOGIC_LEVEL:0"} 
sd_instantiate_component -sd_name ${sd_tb_name} -component_name {RESET_GEN_C0} -instance_name {} 

# Make connections
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"RESET_GEN_C0_0:RESET" "MPFS_ICICLE_KIT_BASE_DESIGN_0:SW4"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"CLK_GEN_125MHz_0:CLK" "MPFS_ICICLE_KIT_BASE_DESIGN_0:REFCLK"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"CLK_GEN_125MHz_0:CLK" "MPFS_ICICLE_KIT_BASE_DESIGN_0:REFCLK_N"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"CLK_GEN_50MHz_0:CLK" "MPFS_ICICLE_KIT_BASE_DESIGN_0:REF_CLK_50MHz"} 
sd_invert_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:REFCLK_N"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX0_P" "MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX0_N"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX0_P" "MPFS_ICICLE_KIT_BASE_DESIGN_0:REF_CLK_PAD_P"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX0_P" "MPFS_ICICLE_KIT_BASE_DESIGN_0:REF_CLK_PAD_N"} 
sd_connect_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX0_P" "MPFS_ICICLE_KIT_BASE_DESIGN_0:REFCLK_N"} 

# Invert pins
sd_invert_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX0_N"} 
sd_invert_pins -sd_name ${sd_tb_name} -pin_names {"MPFS_ICICLE_KIT_BASE_DESIGN_0:REF_CLK_PAD_N"} 

# Tie off pins
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CAN_0_RXBUS_F2M} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CAN_1_RXBUS} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD0_P} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD1_N} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD1_P} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD2_N} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD2_P} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD3_N} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD3_P} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_RXD0_N} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_CLK} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_1_RXD_F2M} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DIR} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SW1} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_NXT} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SW3} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SW2} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_0_RXD_F2M} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_2_RXD_F2M} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX1_N} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_3_RXD_F2M} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_RX1_P} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:mBUS_I2C_SCL} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:mBUS_I2C_SDA} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:mBUS_UART_RX} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:COREUART_RX} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:mBUS_INT} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:COREI2C_C0_SDA} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO27} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO26} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO25} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO24} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO23} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO22} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO19} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO17} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:COREI2C_C0_SCL} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SPI_1_DI} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SPI_1_CLK} -value {GND} 
sd_connect_pins_to_constant -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SPI_1_SS0} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:QSPI_DATA_0} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:QSPI_DATA_1} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:QSPI_DATA_2} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:QSPI_DATA_3} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:QSPI_SEL} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:QSPI_CLK} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_ID_SC} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_ID_SD} -value {GND} 

# Promote pins to top level
sd_connect_pin_to_port -sd_name ${sd_tb_name} -pin_name {MPFS_ICICLE_KIT_BASE_DESIGN_0:SDIO_SW_SEL1} -port_name {} 

sd_connect_pin_to_port -sd_name ${sd_tb_name} -pin_name {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO13} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_tb_name} -pin_name {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO19} -port_name {} 

# Mark outputs unused
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SDIO_SW_SEL0} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CAN_1_TX_EBL_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD3_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:I2C_1_SDA} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_TX1_P} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD3_P} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:I2C_1_SCL} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:LED2} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CKE} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MAC_1_MDC} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:LED1} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:ODT} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MAC_1_MDIO} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_STP} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CAN_1_TXBUS} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CK} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_CMODE4} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:LED3} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CS} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_3_TXD_M2F} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_RESETN} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA1} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:LED0} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_CMODE3} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_CMODE6} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA0} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CK_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_1_TXD_M2F} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_CMODE5} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA3} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD0_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_ULPI_RESET} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_0_TXD_M2F} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_SRESET} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA2} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD0_P} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_CMODE7} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA5} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD1_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:MMUART_2_TXD_M2F} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_PLLMODE} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA4} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD1_P} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:VSC_8662_OSCEN} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA7} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CAN_0_TXBUS_M2F} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD2_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_TX0_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:USB_DATA6} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CAN_0_TX_EBL_M2F} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIESS_LANE_TXD2_P} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_TX0_P} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RESET_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SGMII_TX1_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:DM} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:DQS_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:DQS} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:DQ} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:CA} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SDIO_SW_EN_N} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:mBUS_UART_TX} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPi_GPIO12} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPI_GPIO16} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPI_GPIO20} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:RPI_GPIO21} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_CLK_EMMC_CLK} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_CMD_EMMC_CMD} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_DATA0_EMMC_DATA0} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_DATA1_EMMC_DATA1} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_DATA2_EMMC_DATA2} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_DATA3_EMMC_DATA3} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_POW_EMMC_DATA4} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_VOLT_SEL_EMMC_DATA5} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_VOLT_EN_EMMC_DATA6} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_VOLT_CMD_DIR_EMMC_DATA7} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_VOLT_DIR_1_3_EMMC_UNUSED} 
sd_mark_pins_unused -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_VOLT_DIR_0_EMMC_UNUSED} 
sd_mark_pins_unused -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:COREUART_TX}
sd_mark_pins_unused -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:mBUS_PWM} 
sd_mark_pins_unused -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SPI_1_DO} 
sd_mark_pins_unused -sd_name {Test_bench} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:PCIE_1_PERST_N} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_CD_EMMC_STRB} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_tb_name} -pin_names {MPFS_ICICLE_KIT_BASE_DESIGN_0:SD_WP_EMMC_RSTN} -value {GND} 

# Generate smart design
generate_component -component_name ${sd_tb_name} -recursive 0 

# Import stimulus files
build_design_hierarchy 
organize_tool_files -tool {SIM_PRESYNTH} -file "$project_dir/component/Actel/Simulation/CLK_GEN/1.0.1/CLK_GEN.v" -file "$project_dir/component/work/CLK_GEN_125MHz/CLK_GEN_125MHz.v" -file "$project_dir/component/work/CLK_GEN_50MHz/CLK_GEN_50MHz.v" -file "$project_dir/component/Actel/Simulation/RESET_GEN/1.0.1/RESET_GEN.v" -file "$project_dir/component/work/RESET_GEN_C0/RESET_GEN_C0.v" -file "$project_dir/component/work/Test_bench/Test_bench.v" -module {MPFS_ICICLE_KIT_BASE_DESIGN::work} -input_type {stimulus} 
organize_tool_files -tool {SIM_POSTSYNTH}  -file "$project_dir/component/Actel/Simulation/CLK_GEN/1.0.1/CLK_GEN.v" -file "$project_dir/component/work/CLK_GEN_125MHz/CLK_GEN_125MHz.v" -file "$project_dir/component/work/CLK_GEN_50MHz/CLK_GEN_50MHz.v" -file "$project_dir/component/Actel/Simulation/RESET_GEN/1.0.1/RESET_GEN.v" -file "$project_dir/component/work/RESET_GEN_C0/RESET_GEN_C0.v" -file "$project_dir/component/work/Test_bench/Test_bench.v" -module {MPFS_ICICLE_KIT_BASE_DESIGN::work} -input_type {stimulus} 
import_files \
         -convert_EDN_to_HDL 0 \
         -library {work} \
         -simulation "$local_dir/script_support/simulation/Wave.do" -simulation "$local_dir/script_support/simulation/ICICLE_MSS_PFSOC_MSS_FIC0_user.bfm" -simulation "$local_dir/script_support/simulation/ICICLE_MSS_PFSOC_MSS_FIC3_user.bfm"
         
# Configure simulation options
set_modelsim_options  -include_do_file 1 -included_do_file "${project_dir}/simulation/Wave.do" -sim_runtime "10us"
