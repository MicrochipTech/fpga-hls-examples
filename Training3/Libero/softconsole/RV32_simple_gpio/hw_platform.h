/*******************************************************************************
 * (c) Copyright 2017-2018 Microsemi Corporation.  All rights reserved.
 *
 * Platform definitions.
 *
 * SVN $Revision: 9857 $
 * SVN $Date: 2018-03-21 15:33:06 +0530 (Wed, 21 Mar 2018) $
 */

/*=========================================================================*//**
  @mainpage Sample file detailing how hw_platform.h should be constructed for
    the Mi-V processors

    @section intro_sec Introduction
    The  hw_platform.h is to be located in the project root directory.
    Currently this file must be hand crafted when using the Mi-V Soft processor.

    You can use this file as sample.
    Rename this file from sample_hw_platform.h to hw_platform.h and store it in
    the root folder of your project. Then customize it per your HW design.

    @section driver_configuration Project configuration Instructions
    1. Change SYS_CLK_FREQ define to frequency of Mi-V Soft processor clock
    2  Add all other core BASE addresses
    3. Add peripheral Core Interrupt to Mi-V Soft processor interrupt mappings
    4. Define MSCC_STDIO_UART_BASE_ADDR if you want a CoreUARTapb mapped to STDIO
*//*=========================================================================*/

#ifndef HW_PLATFORM_H
#define HW_PLATFORM_H

/***************************************************************************//**
 * Soft-processor clock definition
 * This is the only clock brought over from the Mi-V Soft processor Libero design.
 */

// TBD:
// Debug Start Error (DTM 3) observed when using 25MHz clock in FPGA Design
// using MIV_RV32IMC_v2.1.100, known issue: CPU clock to JTAG clock ratio min 7:1

#define SYS_CLK_FREQ                    50000000UL

/***************************************************************************//**
 * Non-memory Peripheral base addresses
 * Format of define is:
 * <corename>_<instance>_BASE_ADDR
 */

#define FRAMEBUFFER_BASE_ADDR			0x60000000UL	// Framebuffer 8-Bit/Pixel (Greysccale)

#define COREUARTAPB0_BASE_ADDR          0x70000000UL	// UART
#define COREI2C0_BASE_ADDR         		0x70001000UL	// HDMI, ADV7513
#define COREGPIO_OUT_BASE_ADDR			0x70003000UL	// GPIO Outputs
#define CORESPI_BASE_ADDR               0x70004000UL	// SPI Master




/****************************************************************************
 * Baud value to achieve a 115200 baud rate with a 50MHz system clock.
 * This value is calculated using the following equation:
 *      BAUD_VALUE = (CLOCK / (16 * BAUD_RATE)) - 1
 *****************************************************************************/
#define BAUD_VALUE_115200               ((SYS_CLK_FREQ / (16 * 115200)) - 1)
//#define BAUD_VALUE_230400               ((SYS_CLK_FREQ / (16 * 230400)) - 1)
//#define BAUD_VALUE_460800               ((SYS_CLK_FREQ / (16 * 460800)) - 1)

/***************************************************************************//**
 * User edit section- Edit sections below if required
 */
#ifdef MSCC_STDIO_THRU_CORE_UART_APB
/*
 * A base address mapping for the STDIO printf/scanf mapping to CortUARTapb
 * must be provided if it is being used
 *
 * e.g. #define MSCC_STDIO_UART_BASE_ADDR COREUARTAPB1_BASE_ADDR
 */
#define MSCC_STDIO_UART_BASE_ADDR COREUARTAPB0_BASE_ADDR

#ifndef MSCC_STDIO_UART_BASE_ADDR
#error MSCC_STDIO_UART_BASE_ADDR not defined- e.g. #define MSCC_STDIO_UART_BASE_ADDR COREUARTAPB1_BASE_ADDR
#endif

#ifndef MSCC_STDIO_BAUD_VALUE
/*
 * The MSCC_STDIO_BAUD_VALUE define should be set in your project's settings to
 * specify the baud value used by the standard output CoreUARTapb instance for
 * generating the UART's baud rate if you want a different baud rate from the
 * default of 115200 baud
 */
#define MSCC_STDIO_BAUD_VALUE           115200
#endif  /*MSCC_STDIO_BAUD_VALUE*/

#endif  /* end of MSCC_STDIO_THRU_CORE_UART_APB */
/*******************************************************************************
 * End of user edit section
 */
#endif /* HW_PLATFORM_H */


