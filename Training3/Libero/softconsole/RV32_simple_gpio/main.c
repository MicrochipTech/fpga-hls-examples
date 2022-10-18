#include <stdio.h> // sprintf()
#include <stdlib.h> // strtol()
#include "SinCosTables.h"
#include "hal.h"
#include "riscv_hal.h"
#include "hw_platform.h"
#include "drivers/CoreUARTapb/core_uart_apb.h"
#include "drivers/CoreI2C/core_i2c.h"
#include "drivers/CoreGPIO/core_gpio.h"
#include "application/hdmi_config/hdmi_tx.h"


// SmartHLS Wide Multiplier AXI Target Memory Map Layout
struct wide_mult {
    uint32_t run;

    // DDR related control signals
    uint32_t base_addr;
    uint32_t error;

    // Result is 256 bit signed
    uint32_t result0;
    uint32_t result1;
    uint32_t result2;
    uint32_t result3;
    uint32_t result4;
    uint32_t result5;
    uint32_t result6;
    uint32_t result7;

    // A is 128 bit signed
    uint32_t A0;
    uint32_t A1;
    uint32_t A2;
    uint32_t A3;
    // B is 64  bit unsigned
    uint32_t B0;
    uint32_t B1;
    // C is 64  bit signed
    uint32_t C0;
    uint32_t C1;
    // D is 128 bit signed
    uint32_t D0;
    uint32_t D1;
    uint32_t D2;
    uint32_t D3;
    // E is 128 bit signed
    uint32_t E0;
    uint32_t E1;
    uint32_t E2;
    uint32_t E3;

    // Extra padding as SmartHLS expects AXI target memory map
    // to be aligned to AXI Target 64-bit data bus width
    uint32_t padding;
};

// SmartHLS Wide Multiplier AXI Target Base Address
#define SHLS_WIDE_MULT_BASE_ADDR        0x61000000UL

// SmartHLS Wide Multiplier DDR Memory Layout
struct wide_mult_ddr {
    // A is 128 bit signed
    uint32_t A0;
    uint32_t A1;
    uint32_t A2;
    uint32_t A3;
    // B is 64  bit unsigned
    uint32_t B0;
    uint32_t B1;
    // C is 64  bit signed
    uint32_t C0;
    uint32_t C1;
    // D is 128 bit signed
    uint32_t D0;
    uint32_t D1;
    uint32_t D2;
    uint32_t D3;
    // E is 128 bit signed
    uint32_t E0;
    uint32_t E1;
    uint32_t E2;
    uint32_t E3;
    // result is 256 bit signed
    uint32_t result0;
    uint32_t result1;
    uint32_t result2;
    uint32_t result3;
    uint32_t result4;
    uint32_t result5;
    uint32_t result6;
    uint32_t result7;
};

// DDR AXI Target Base Address
#define DDR_BASE_ADDR                   0x62000000UL


/******************************************************************************
 * CoreUARTapb instance data.
 *****************************************************************************/
UART_instance_t g_uart;
uint8_t UART_Buffer[256+1];

/******************************************************************************
 * I2C instance data.
 *****************************************************************************/
i2c_instance_t g_i2c_instance_hdmi;

/******************************************************************************
 * GPIO instance data.
 *****************************************************************************/
gpio_instance_t g_gpio0;

/******************************************************************************
 * serial print function.
 *****************************************************************************/
void print(uint8_t *string)
{
	UART_polled_tx_string(&g_uart, string);
}

/******************************************************************************
 * This message will be transmitted over the UART at startup.
 *****************************************************************************/
uint8_t g_message[] =
"\r\n\r\n SmartHLS Training 3 v1.0 2021-05-20 MCHP\r\n\r\n";



/*==============================================================================
  Validate the input hex value .
 */
uint8_t validate_input_hex(uint8_t ascii_input)
{
    uint8_t valid_key = 0u;

    if(((ascii_input >= 'A') && (ascii_input <= 'F')) ||        \
       ((ascii_input >= 'a') && (ascii_input <= 'f')) ||        \
       ((ascii_input >= '0') && (ascii_input <= '9')))
    {
        valid_key = 1u;
    }
    else
    {
        valid_key = 0u;
    }
    return valid_key;
}


// Special Characters for UART
#define BACKSPACE  8u
#define ENTER     13u

/*==============================================================================
  Function to read data from UART terminal and stored it.
 */
uint16_t get_data_from_uart
(
    uint8_t* dst_ptr,
    uint16_t dst_size,
    const uint8_t* msg,
    uint16_t msg_size
)
{
    uint8_t complete = 0u;
    uint8_t rx_buff[1];
    uint8_t rx_size = 0u;
    uint16_t count = 0u;

    UART_send(&g_uart, msg, msg_size);


    /* Read the key size sent by user and store it. */
    while(!complete)
    {
        rx_size = UART_get_rx(&g_uart, rx_buff, sizeof(rx_buff));
        if(rx_size > 0u)
        {
            /* terminate when user presses enter */
            if(ENTER == rx_buff[0])
            {
                dst_ptr[count] = '\0';
                count++;
                complete = 1u;
            }
            else if(BACKSPACE == rx_buff[0])
            {
            	if (count > 0) {
            		count--;
            	}
            }
            else if(validate_input_hex(rx_buff[0]) != 1u)
            {
                UART_send(&g_uart, rx_buff, sizeof(rx_buff));
                const uint8_t error_msg[] = "\r\n Invalid input.\r\n ";
                UART_send(&g_uart, error_msg, sizeof(error_msg));
                UART_send(&g_uart, msg, msg_size);
                complete = 0u;
            }
            else
            {
                dst_ptr[count] = rx_buff[0];
                count++;

                UART_send(&g_uart, rx_buff, sizeof(rx_buff));

                if(count == dst_size)
                {
                   complete = 1u;
                }
            }
        }
    }

    return count;
}

// Read hex input from UART terminal.
int32_t get_user_input(const int8_t *msg, uint16_t msg_len) {
    uint8_t readbuf[100];
    uint16_t size = 100;
    uint16_t count = get_data_from_uart(readbuf, size, msg, msg_len);
    print("\r\n");
    print(readbuf);
    print("\r\n");

    return strtol(readbuf, NULL, 16);
}

// Run wide multiply accelerator for a single input from the UART terminal and
// output the result.
void run_single_multiply() {
	// Get inputs from the UART terminal
	// A is 128	bit signed
	// B is 64 	bit unsigned
	// C is 64 	bit signed
	// D is 128	bit signed
	// E is 128	bit signed
	struct wide_mult wm;
	wm.A0 = get_user_input("Enter A0: ", 11);
	wm.A1 = get_user_input("Enter A1: ", 11);
	wm.A2 = get_user_input("Enter A2: ", 11);
	wm.A3 = get_user_input("Enter A3: ", 11);
	wm.B0 = get_user_input("Enter B0: ", 11);
	wm.B1 = get_user_input("Enter B1: ", 11);
	wm.C0 = get_user_input("Enter C0: ", 11);
	wm.C1 = get_user_input("Enter C1: ", 11);
	wm.D0 = get_user_input("Enter D0: ", 11);
	wm.D1 = get_user_input("Enter D1: ", 11);
	wm.D2 = get_user_input("Enter D2: ", 11);
	wm.D3 = get_user_input("Enter D3: ", 11);
	wm.E0 = get_user_input("Enter E0: ", 11);
	wm.E1 = get_user_input("Enter E1: ", 11);
	wm.E2 = get_user_input("Enter E2: ", 11);
	wm.E3 = get_user_input("Enter E3: ", 11);

	const int BUF_LEN = 100;
	char buf[BUF_LEN];
	snprintf(buf, BUF_LEN, "Sending the inputs (hex):\r\n"
		"A: %x %x %x %x\r\n"
		"B: %x %x\r\n"
		"C: %x %x\r\n"
		"D: %x %x %x %x\r\n"
		"E: %x %x %x %x\r\n",
		wm.A3, wm.A2, wm.A1, wm.A0,
		wm.B1, wm.B0,
		wm.C1, wm.C0,
		wm.D3, wm.D2, wm.D1, wm.D0,
		wm.E3, wm.E2, wm.E1, wm.E0);
	print(buf);

	print("Writing inputs to SmartHLS accelerator over AXI\r\n");
	volatile struct wide_mult *wm_accel_addr =
			(volatile struct wide_mult *) SHLS_WIDE_MULT_BASE_ADDR;
	wm_accel_addr->A0 = wm.A0;
	wm_accel_addr->A1 = wm.A1;
	wm_accel_addr->A2 = wm.A2;
	wm_accel_addr->A3 = wm.A3;
	wm_accel_addr->B0 = wm.B0;
	wm_accel_addr->B1 = wm.B1;
	wm_accel_addr->C0 = wm.C0;
	wm_accel_addr->C1 = wm.C1;
	wm_accel_addr->D0 = wm.D0;
	wm_accel_addr->D1 = wm.D1;
	wm_accel_addr->D2 = wm.D2;
	wm_accel_addr->D3 = wm.D3;
	wm_accel_addr->E0 = wm.E0;
	wm_accel_addr->E1 = wm.E1;
	wm_accel_addr->E2 = wm.E2;
	wm_accel_addr->E3 = wm.E3;
	print("Starting SmartHLS accelerator\r\n");
	wm_accel_addr->run = 1;

	print("Waiting for SmartHLS accelerator to finish\r\n");
	while (wm_accel_addr->run);

	print("Reading result from SmartHLS accelerator over AXI:\r\n");
	wm.result0 = wm_accel_addr->result0;
	wm.result1 = wm_accel_addr->result1;
	wm.result2 = wm_accel_addr->result2;
	wm.result3 = wm_accel_addr->result3;
	wm.result4 = wm_accel_addr->result4;
	wm.result5 = wm_accel_addr->result5;
	wm.result6 = wm_accel_addr->result6;
	wm.result7 = wm_accel_addr->result7;

	snprintf(buf, BUF_LEN, "Result (hex): %x %x %x %x %x %x %x %x\r\n",
		wm.result7, wm.result6, wm.result5, wm.result4,
		wm.result3, wm.result2, wm.result1, wm.result0);
	print(buf);
}

void run_burst_multiply() {

	// 5 test inputs
	#define NUM_BURST 5
	const uint32_t A3[NUM_BURST]      = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
	const uint32_t A2[NUM_BURST]      = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
	const uint32_t A1[NUM_BURST]      = {0x00000002, 0x00000000, 0x00000000, 0x00000002, 0x00000002};
	const uint32_t A0[NUM_BURST]      = {0x4CB016EA, 0x000186A0, 0x000F4240, 0x4CB016EA, 0x4CB016EA};
	const uint32_t B1[NUM_BURST]      = {0x00000002, 0x00000000, 0x00000000, 0x00000002, 0x00000002};
	const uint32_t B0[NUM_BURST]      = {0x4CB016EA, 0x00087A23, 0x0054C563, 0x4CB016EA, 0x4CB016EA};
	const uint32_t C1[NUM_BURST]      = {0x00000000, 0x00000000, 0x00000000, 0x61234567, 0x71234567};
	const uint32_t C0[NUM_BURST]      = {0x00000001, 0x001608A0, 0x00DC5640, 0x80000000, 0x80000000};
	const uint32_t D3[NUM_BURST]      = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
	const uint32_t D2[NUM_BURST]      = {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
	const uint32_t D1[NUM_BURST]      = {0x00000002, 0x00000000, 0x00000000, 0x00000002, 0x00000002};
	const uint32_t D0[NUM_BURST]      = {0x4CB016EA, 0x0000000A, 0x00000064, 0x4CB016EA, 0x4CB016EA};
	const uint32_t E3[NUM_BURST]      = {0x80000000, 0x00000000, 0x00000000, 0x71234567, 0x71234567};
	const uint32_t E2[NUM_BURST]      = {0x00000000, 0x00000000, 0x00000000, 0x89ABCDEF, 0x89ABCDEF};
	const uint32_t E1[NUM_BURST]      = {0x80000000, 0x00000000, 0x00000000, 0xFFFFFFFF, 0xFFFFFFFF};
	const uint32_t E0[NUM_BURST]      = {0x00000000, 0x05F5E478, 0x3B9AECB8, 0xFFFFFFFE, 0xFFFFFFFE};
	const uint32_t result7[NUM_BURST] = {0xFFFFFFFF, 0x00000000, 0x00000000, 0x082509C5, 0x0B0C7AA5};
	const uint32_t result6[NUM_BURST] = {0xFFFFFFFF, 0x00000000, 0x00000000, 0xDD467A31, 0x4087E648};
	const uint32_t result5[NUM_BURST] = {0xFFFFFFFF, 0x00000000, 0x00000000, 0x5835A072, 0x192A179A};
	const uint32_t result4[NUM_BURST] = {0xFFFFFFFF, 0x00000000, 0x00000000, 0x2FECBAFD, 0xAFECBAFD};
	const uint32_t result3[NUM_BURST] = {0xC0000002, 0x00000000, 0x00000000, 0xDB24408E, 0xCDFFD7E1};
	const uint32_t result2[NUM_BURST] = {0x4CB016EA, 0x00087A28, 0x0054DB76, 0xAFF1F66D, 0xE4BCF7DB};
	const uint32_t result1[NUM_BURST] = {0x40000004, 0xA6DDD93B, 0xD29B88E9, 0x035C559D, 0xA35C559D};
	const uint32_t result0[NUM_BURST] = {0x99602DD4, 0xFED54CE0, 0xD0EAB340, 0x4CB016EA, 0x4CB016EA};


	// Expected results from modelsim testbench:
	// Test 1:
	// A: 0000000000000000000000024CB016EA B: 000000024CB016EA C: 0000000000000001 D: 0000000000000000000000024CB016EA E: 80000000000000008000000000000000
	// Expected: FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000024CB016EA4000000499602DD4, Actual: FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000024CB016EA4000000499602DD4
	// Matched!
	// Test 2:
	// A: 000000000000000000000000000186A0 B: 0000000000087A23 C: 00000000001608A0 D: 0000000000000000000000000000000A E: 00000000000000000000000005F5E478
	// Expected: 000000000000000000000000000000000000000000087A28A6DDD93BFED54CE0, Actual: 000000000000000000000000000000000000000000087A28A6DDD93BFED54CE0
	// Matched!
	// Test 3:
	// A: 000000000000000000000000000F4240 B: 000000000054C563 C: 0000000000DC5640 D: 00000000000000000000000000000064 E: 0000000000000000000000003B9AECB8
	// Expected: 00000000000000000000000000000000000000000054DB76D29B88E9D0EAB340, Actual: 00000000000000000000000000000000000000000054DB76D29B88E9D0EAB340
	// Matched!
	// Test 4:
	// A: 0000000000000000000000024CB016EA B: 000000024CB016EA C: 6123456780000000 D: 0000000000000000000000024CB016EA E: 7123456789ABCDEFFFFFFFFFFFFFFFFE
	// Expected: 082509C5DD467A315835A0722FECBAFDDB24408EAFF1F66D035C559D4CB016EA, Actual: 082509C5DD467A315835A0722FECBAFDDB24408EAFF1F66D035C559D4CB016EA
	// Matched!
	// Test 5:
	// A: 0000000000000000000000024CB016EA B: 000000024CB016EA C: 7123456780000000 D: 0000000000000000000000024CB016EA E: 7123456789ABCDEFFFFFFFFFFFFFFFFE
	// Expected: 0B0C7AA54087E648192A179AAFECBAFDCDFFD7E1E4BCF7DBA35C559D4CB016EA, Actual: 0B0C7AA54087E648192A179AAFECBAFDCDFFD7E1E4BCF7DBA35C559D4CB016EA
	// Matched!


	print("Writing inputs to DDR\r\n");
	volatile struct wide_mult_ddr *ddr_addr =
			(volatile struct wide_mult_ddr *) DDR_BASE_ADDR;

	for (uint32_t i = 0; i < NUM_BURST; i++) {
		ddr_addr->A0 = A0[i];
		ddr_addr->A1 = A1[i];
		ddr_addr->A2 = A2[i];
		ddr_addr->A3 = A3[i];
		ddr_addr->B0 = B0[i];
		ddr_addr->B1 = B1[i];
		ddr_addr->C0 = C0[i];
		ddr_addr->C1 = C1[i];
		ddr_addr->D0 = D0[i];
		ddr_addr->D1 = D1[i];
		ddr_addr->D2 = D2[i];
		ddr_addr->D3 = D3[i];
		ddr_addr->E0 = E0[i];
		ddr_addr->E1 = E1[i];
		ddr_addr->E2 = E2[i];
		ddr_addr->E3 = E3[i];
		ddr_addr->result0 = i;
		ddr_addr->result1 = i;
		ddr_addr->result2 = i;
		ddr_addr->result3 = i;
		ddr_addr->result4 = i;
		ddr_addr->result5 = i;
		ddr_addr->result6 = i;
		ddr_addr->result7 = i;
		ddr_addr++;
	}

	print("Starting SmartHLS accelerator\r\n");
	volatile struct wide_mult *wm_accel_addr =
			(volatile struct wide_mult *) SHLS_WIDE_MULT_BASE_ADDR;
	wm_accel_addr->base_addr = DDR_BASE_ADDR;
	wm_accel_addr->run = NUM_BURST;

	print("Waiting for SmartHLS accelerator to finish\r\n");
	while (wm_accel_addr->run);

	print("Reading results from DDR\r\n");
	ddr_addr = (volatile struct wide_mult_ddr *) DDR_BASE_ADDR;
	const int BUF_LEN = 200;
	char buf[BUF_LEN];

	for (uint32_t i = 0; i < NUM_BURST; i++) {
		snprintf(buf, BUF_LEN, "Inputs (hex) from DDR for run %d:\r\n"
			"A: %x %x %x %x\r\n"
			"B: %x %x\r\n"
			"C: %x %x\r\n"
			"D: %x %x %x %x\r\n"
			"E: %x %x %x %x\r\n", i,
			ddr_addr->A3, ddr_addr->A2, ddr_addr->A1, ddr_addr->A0,
			ddr_addr->B1, ddr_addr->B0,
			ddr_addr->C1, ddr_addr->C0,
			ddr_addr->D3, ddr_addr->D2, ddr_addr->D1, ddr_addr->D0,
			ddr_addr->E3, ddr_addr->E2, ddr_addr->E1, ddr_addr->E0);
		print(buf);

		snprintf(buf, BUF_LEN,"Result (hex) from DDR for run %d:\r\n"
				"%x %x %x %x %x %x %x %x\r\n", i,
				ddr_addr->result7, ddr_addr->result6, ddr_addr->result5,
				ddr_addr->result4, ddr_addr->result3, ddr_addr->result2,
				ddr_addr->result1, ddr_addr->result0);
		print(buf);

		snprintf(buf, BUF_LEN,"Expected result (hex) for run %d:\r\n"
				"%x %x %x %x %x %x %x %x\r\n", i,
				result7[i], result6[i], result5[i],
				result4[i], result3[i], result2[i],
				result1[i], result0[i]);
		print(buf);

		if (ddr_addr->result7 != result7[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 7, i,
					result7[i], ddr_addr->result7);
			print(buf);
		}
		if (ddr_addr->result6 != result6[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 6, i,
					result6[i], ddr_addr->result6);
			print(buf);
		}
		if (ddr_addr->result5 != result5[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 5, i,
					result5[i], ddr_addr->result5);
			print(buf);
		}
		if (ddr_addr->result4 != result4[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 4, i,
					result4[i], ddr_addr->result4);
			print(buf);
		}
		if (ddr_addr->result3 != result3[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 3, i,
					result3[i], ddr_addr->result3);
			print(buf);
		}
		if (ddr_addr->result2 != result2[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 2, i,
					result2[i], ddr_addr->result2);
			print(buf);
		}
		if (ddr_addr->result1 != result1[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 1, i,
					result1[i], ddr_addr->result1);
			print(buf);
		}
		if (ddr_addr->result0 != result0[i]) {
			snprintf(buf, BUF_LEN,"Mismatched result (hex) for result %d run %d:\r\n"
					"Expected: %x, Got: %x\r\n", 0, i,
					result0[i], ddr_addr->result0);
			print(buf);
		}

		print("\r\n");

		ddr_addr++;
	}
}

// GPIO Pin used to control Display Controller start_output_i
#define	START_DISPLAY_GPIO GPIO_0

/******************************************************************************
 * Local macros.
 *****************************************************************************/
#define clear		UART_polled_tx_string(&g_uart, "\033[2J\033[H")

/******************************************************************************
 * Local functions.
 *****************************************************************************/

void Init(void);
void print(uint8_t *string);


/******************************************************************************
 * main function.
 *****************************************************************************/ 
int main( void )
{
	uint8_t key[1];

    uint8_t stop_test = 0;

	Init();

    // Transmit UART message at startup
	print( g_message );

	// Enable Output Video Signal Generation
	GPIO_set_output(&g_gpio0, START_DISPLAY_GPIO, 1);

	// ADV7513 HDMI Transmitter setup
	HDMI_tx_setup();


	// Run Wide Multiplier loop
	while (1) {
		uint32_t mode =
				get_user_input("Enter mode (1 for single, 2 for burst): ", 41);
		if (mode == 1) {
			run_single_multiply();
		} else {
			run_burst_multiply();
		}
	}

}

//-----------------------------------------------------------------------------
// Roto Zoom LegUp accelerator

// output display size
#define x_size 640
#define y_size 480
#define x_size_div2 x_size/2
#define y_size_div2 y_size/2

#define texture_size 512	// Texture width=height
#define texture_size_div2 texture_size/2


// aspect ratio correction (512x512 -> 640x480)
#define texture_size_div2_arx_corrected texture_size_div2*x_size/texture_size
#define texture_size_div2_ary_corrected texture_size_div2*y_size/texture_size

// SmartHLS Texture Mapper AXI Target Addresses
#define reg_AX                          0x60040000UL
#define reg_AY                          0x60040004UL
#define reg_BX                          0x60040008UL
#define reg_BY                          0x6004000CUL
#define reg_DX1DY                       0x60040010UL
#define reg_DY1DY                       0x60040014UL
#define reg_DX2DY                       0x60040018UL
#define reg_DY2DY                       0x6004001CUL

/******************************************************************************
 * Global variables.
 *****************************************************************************/
uint32_t g_frame_counter = 0;
uint8_t g_toggle = 0;
uint32_t g_10ms_count = 0;

int g_scale = 1024;		// 1024 = 1.0 (bigger value => downscaled texture display)
uint8_t  g_scale_flag = 0;
int g_angle = 0;		// 0...359

// texture-space coordinates (screen):
//
// 0/0+
// +
//     A..B
//     .  .
//     .  .
//     C..D

void rotate_points(void)
{

	// x & y start vectors with aspect ratio correction
	int scaled_vect1 = (g_scale * texture_size_div2_arx_corrected) >>10;
	int scaled_vect2 = (g_scale * texture_size_div2_ary_corrected) >>10;

	// generate four rotated corner points
	// Note: texture image data is vertically flipped (bmp image conversion issue),
	// correct by defining A & C + B & D Points in different y order (swap)

	int A_x_rot = (-scaled_vect1*g_cos_table[g_angle] - scaled_vect2*g_sin_table[g_angle])>>15;
	int A_y_rot = (-scaled_vect1*g_sin_table[g_angle] + scaled_vect2*g_cos_table[g_angle])>>15;

	int B_x_rot = (scaled_vect1*g_cos_table[g_angle] - scaled_vect2*g_sin_table[g_angle])>>15;
	int B_y_rot = (scaled_vect1*g_sin_table[g_angle] + scaled_vect2*g_cos_table[g_angle])>>15;

	int C_x_rot = (-scaled_vect1*g_cos_table[g_angle] + scaled_vect2*g_sin_table[g_angle])>>15;
	int C_y_rot = (-scaled_vect1*g_sin_table[g_angle] - scaled_vect2*g_cos_table[g_angle])>>15;

	int D_x_rot = (scaled_vect1*g_cos_table[g_angle] + scaled_vect2*g_sin_table[g_angle])>>15;
	int D_y_rot = (scaled_vect1*g_sin_table[g_angle] - scaled_vect2*g_cos_table[g_angle])>>15;

	uint32_t AX = (texture_size_div2+A_x_rot);
	uint32_t AY = (texture_size_div2+A_y_rot);

	uint32_t BX = (texture_size_div2+B_x_rot);
	uint32_t BY = (texture_size_div2+B_y_rot);

	uint32_t CX = (texture_size_div2+C_x_rot);
	uint32_t CY = (texture_size_div2+C_y_rot);

	uint32_t DX = (texture_size_div2+D_x_rot);
	uint32_t DY = (texture_size_div2+D_y_rot);

	// update registers
	*((uint32_t volatile *) reg_AX) = AX<<16;
	*((uint32_t volatile *) reg_AY) = AY<<16;
	*((uint32_t volatile *) reg_BX) = BX<<16;
	*((uint32_t volatile *) reg_BY) = BY<<16;
	*((int32_t volatile *) reg_DX1DY) = (((int32_t)CX-(int32_t)AX)<<16)/y_size;
	*((int32_t volatile *) reg_DY1DY) = (((int32_t)CY-(int32_t)AY)<<16)/y_size;
	*((int32_t volatile *) reg_DX2DY) = (((int32_t)DX-(int32_t)BX)<<16)/y_size;
	*((int32_t volatile *) reg_DY2DY) = (((int32_t)DY-(int32_t)BY)<<16)/y_size;

#if 1
	// rotate
	g_angle += 1;
	if (g_angle == 360) g_angle = 0;

	// scale out/in
	if (g_scale_flag==0)
	{
		g_scale+=16;
		if (g_scale >1024+2048) g_scale_flag = 1;
	}
	else {
		g_scale-=16;
		if (g_scale <1024-512) g_scale_flag = 0;
	}
#endif

}

/******************************************************************************
 * Interrupt Service functions.
 *****************************************************************************/

/*------------------------------------------------------------------------------
 * Count the number of elapsed milliseconds (SysTick_Handler is called every
 * 10mS so the resolution will be 10ms). Rolls over every 49 days or so...
 *
 * Should be safe to read g_10ms_count from elsewhere.

  Update Sept. 2022:

  1.) Added signal_synchronizer before CPU_SYS\EXT_IRQ input, to avoid crashing
      of soft MIV CPU
  2.) Disabled Systick Interrupt in SoftConsole project to avoid missed EXT_IRQ
      interrupts (leading to incorrect output frames)

  Prior to change 1, the Rotozoom would stop working after a few seconds and
  the UART/MiV became unresponsive at the same time.

  Even with the fix of change 1, there were still some distorted frames. Making
  change 2 fixes these so that the demo runs the same as before. This is the 
  easiest solution to have a stable demo. It could probably be fixed more
  elegantly by using the “Vectored Interrupts” option of the MIV_RV32 core.

  These problems were in the design from the beginning, but only showed up
  recently after certain components were updated to the latest Libero versions,
  for example PF_CCC.
 */
#if 0
void SysTick_Handler( void )
{
    g_10ms_count += 10;

     /*
      * For neatness, if we roll over, reset cleanly back to 0 so the count
      * always goes up in proper 10s.
      */
    if(g_10ms_count < 10) g_10ms_count = 0;

}
#endif

// EXT_IRQ Input (high active) ->  Display Frame Start Interrupt Handler
void External_IRQHandler()
{
	GPIO_set_output(&g_gpio0, GPIO_1, 1);		// For Debug: indicate that ISR is running

	g_frame_counter++;
	rotate_points();

	GPIO_set_output(&g_gpio0, GPIO_1, 0);		// For Debug: indicate end of ISR

}

// EXT_SYS_IRQ[0] Input (high active) -> HDMI-TX I2C Interrupt Handler
void MSYS_E10_IRQHandler()
{
	I2C_isr(&g_i2c_instance_hdmi);
}

// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
// Setup functions

void Init(void)
{

    // Disable interrupts in general.
    HAL_disable_interrupts();

    // Initialize the CoreGPIO driver with the base address of the CoreGPIO
    // instance to use and the initial state of the outputs.
    GPIO_init(&g_gpio0, COREGPIO_OUT_BASE_ADDR, GPIO_APB_32_BITS_BUS);

	// Initialize CoreI2C
	I2C_init( &g_i2c_instance_hdmi, COREI2C0_BASE_ADDR, 0x01, I2C_PCLK_DIV_256 );

	// Initialize CoreUARTapb with its base address, baud value, and line
    // configuration.
	UART_init( &g_uart, COREUARTAPB0_BASE_ADDR, BAUD_VALUE_115200, (DATA_8_BITS | NO_PARITY) );

  // See comment above for SysTick_Handler, this was disabled due to distorted output frames
  // SysTick_Config(SYS_CLK_FREQ/100);		// SysTick Period = 10ms

    __enable_external_irq();			// External_IRQHandler, Display Frame Start (VSYNC)
    __enable_sys_ext_irq(SYS_EI_0);		// MSYS_E10_IRQHandler, HDMI I2C
    HAL_enable_interrupts();

}

// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

