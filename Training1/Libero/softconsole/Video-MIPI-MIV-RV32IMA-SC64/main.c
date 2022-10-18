/*******************************************************************************
 * (c) Copyright 2016-2017 Microsemi SoC Products Group. All rights reserved.
 * 
 * This SoftConsole Video project for MIPI sensor configuration and interfacing with GUI
 *
 * Please refer README.TXT in the root folder of this project for more details.
 */
#include "riscv_hal/riscv_hal.h"
#include "drivers/CoreGPIO/core_gpio.h"
#include "drivers/CoreUARTapb/core_uart_apb.h"
#include "drivers/CoreI2c/core_i2c.h"
#include "hal/hal.h"
#include "application/imx334_corei2c/imx334_corei2c.h"
#include "application/hdmi_config/hdmi_tx.h"

/* Camera configuration (Data rate, resolution) and pattern generator
 * can be selected in imx334_corei2c.h file.
 * */

#define LED1 GPIO_0
#define LED2 GPIO_1
#define LED3 GPIO_2
#define LED4 GPIO_3

//#define F_End GPIO_31

#define MIPI_TRNG_RST GPIO_4

#define ALPHA_ADDR			0x70009000
#define RGB_SUM_ADDR		0x70009038
#define RGB_SUM_ADDR1		0x7000903C
#define R_GAIN_ADDR  		0x70009020
#define G_GAIN_ADDR			0x70009024
#define B_GAIN_ADDR			0x70009028
#define CONTRAST_ADDR		0x70009030
#define BRIGHTNESS_ADDR		0x70009034
#define ALPHA_ADDR			0x70009000

#define R_CONST_ADDR  		0x70009004
#define G_CONST_ADDR		0x70009008
#define B_CONST_ADDR		0x7000900C
#define SECOND_CONST_ADDR 	0x70009010

volatile uint32_t g_10ms_count;

volatile uint32_t timerdone = 0;
volatile uint32_t g_100ms_count1;
volatile uint32_t g_ms_count;
static void set_bgr_gain( int r_gain ,int g_gain,int b_gain,int brightness,int contrast);
static void auto_brightness( uint32_t div);
static void gain_cal(uint32_t total_average);
static void gain_cal1(uint32_t total_average1);


i2c_instance_t g_i2c_instance_hdmi;
i2c_instance_t g_i2c_instance_cam1;
i2c_instance_t g_i2c_instance_cam2;
/*-----------------------------------------------------------------------------
 * GPIO instance data.
 */

gpio_instance_t g_gpio_out;


/*-----------------------------------------------------------------------------
 * Global state counter.
 */
uint32_t g_state = 1;

volatile uint32_t rx_tmr_done = 0;
volatile uint32_t rx_ms_count1;
volatile uint32_t rx_ms_count;
uint32_t t_ms_count = 0;

uint16_t contrast;
uint16_t brightness;
uint16_t r_gain, b_gain, g_gain;
uint16_t r_const, b_const, g_const;
uint32_t second_const,contrast_scl,total_sum;

const uint32_t hdim = 1920;
const uint32_t vdim = 1080;

static uint16_t in_gain = 80,in_gain1 = 80;
/*-----------------------------------------------------------------------------
 * UART handler specific.
 */
uint32_t i = 0;
uint32_t process_data = 0;

static uint8_t counter = 0;

/*-----------------------------------------------------------------------------
 * System Tick interrupt handler
 */
void SysTick_Handler(void) {

//	g_state = (~g_state) & 0x01;

	if(timerdone == 1)
	{
		g_100ms_count1 += 1;
		if(g_ms_count <= g_100ms_count1)
			timerdone = 0;
	}

}

void External_30_IRQHandler(void) {

	I2C_isr(&g_i2c_instance_cam2);
}

void External_29_IRQHandler(void) {

	I2C_isr(&g_i2c_instance_cam1);
}

void External_28_IRQHandler(void) {

	I2C_isr(&g_i2c_instance_hdmi);
}

/*-----------------------------------------------------------------------------
 * main
 */
uint32_t a;

int main(int argc, char **argv) {
    volatile  uint32_t counter;
    uint8_t state;

    counter = 0;
    state = 0;

    GPIO_init(&g_gpio_out, COREGPIO_OUT_BASE_ADDR, GPIO_APB_32_BITS_BUS);

	GPIO_set_output(&g_gpio_out, LED1, 1);

	PLIC_init();

    SysTick_Config(SYS_CLK_FREQ / 1000);///100msec delay

    PLIC_SetPriority(I2C_CAM1_IRQn, 1);

    PLIC_EnableIRQ(I2C_CAM1_IRQn);

    PLIC_SetPriority(HDMI_I2C_IRQn, 1);

    PLIC_EnableIRQ(HDMI_I2C_IRQn);

    PLIC_SetPriority(I2C_CAM2_IRQn, 1);

    PLIC_EnableIRQ(I2C_CAM2_IRQn);
    HAL_enable_interrupts();

	GPIO_set_output(&g_gpio_out, MIPI_TRNG_RST, 0u);
    GPIO_set_output(&g_gpio_out, LED2, 1);
	HDMI_tx_init();

#if 1
	GPIO_set_output(&g_gpio_out, CAM1_RST, 1u);
	GPIO_set_output(&g_gpio_out, CAM2_RST, 1u);
	GPIO_set_output(&g_gpio_out, CAM_CLK_EN, 0u);
    imx334_cam_init();
    imx334_cam_reginit(1u);
#endif
    GPIO_set_output(&g_gpio_out, LED3, 1);
	msdelay(100);
	GPIO_set_output(&g_gpio_out, MIPI_TRNG_RST, 1u);
    GPIO_set_output(&g_gpio_out, LED4, 1);

    uint32_t div = (hdim*vdim*2);
    uint32_t div1 = (hdim*vdim*2)/9;
	do {
		msdelay(30);
		auto_brightness(div);


		counter = counter +1;
		if (counter <16){
			GPIO_set_output(&g_gpio_out, LED1, 0);
		}
		else{
			GPIO_set_output(&g_gpio_out, LED1, 1);
		}
		if (counter ==32){
			counter =0;
		}

	} while (1);


    return 0;
}

/**********************************************************/
/**********************FUNCTION CALLS**********************/
/**********************************************************/



void set_bgr_gain(int r_gain ,int g_gain,int b_gain,int brightness,int contrast)
{
	int contrast_scl = (325*(contrast+128) / (387 - contrast))>>5u;
	int r_const = (r_gain * contrast_scl)/10;
	int b_const = (b_gain * contrast_scl)/10;
	int g_const = (g_gain * contrast_scl/10);
	int second_const = 128 * (brightness - ((128*contrast_scl)/10));

	*(volatile int*) R_CONST_ADDR = r_const;
	*(volatile int*) G_CONST_ADDR = g_const;
	*(volatile int*) B_CONST_ADDR = b_const;
	*(volatile int*) SECOND_CONST_ADDR = second_const;
}


void auto_brightness(uint32_t div){




	r_gain = (uint16_t)(*(volatile int*) R_GAIN_ADDR);
	g_gain = (uint16_t)(*(volatile int*) G_GAIN_ADDR);
	b_gain = (uint16_t)(*(volatile int*) B_GAIN_ADDR);
	contrast = *(volatile int*) CONTRAST_ADDR;//8;//Range 3 - 30 (divided by 10 in later steps)
	brightness = *(volatile int*) BRIGHTNESS_ADDR;
	set_bgr_gain(r_gain,g_gain,b_gain,brightness,contrast);


	uint32_t total_sum =  (uint32_t)(*(volatile int*) RGB_SUM_ADDR);
	uint32_t total_average = total_sum/div;
	uint32_t total_sum1 =  (uint32_t)(*(volatile int*) RGB_SUM_ADDR1);
	uint32_t total_average1 = total_sum1/(div/9);

	gain_cal(total_average);
	gain_cal1(total_average1);

}

void gain_cal(uint32_t total_average){
	//////////////////////////////////////////////////////
	const int16_t good_average=100;
	const int16_t hysteresis=4;
	int16_t step;
		if(total_average < (good_average - hysteresis))
			step = 1;
		else
			if(total_average > (good_average + hysteresis))
				step = -1;
			else
				step = 0;

		in_gain = in_gain + step;

		if(in_gain < 5)
			in_gain = 5;
		else
			if(in_gain >= 100)
				in_gain = 100;
	///////////////////////////////////////////////////////////
	gain_setting(1u,in_gain);
}
//
void gain_cal1(uint32_t total_average1){

	int16_t step1;
	const int16_t good_average=100;
	const int16_t hysteresis=4;
		if(total_average1 < (good_average - hysteresis))
			step1 = 1;
		else
			if(total_average1 > (good_average + hysteresis))
				step1 = -1;
			else
				step1 = 0;

		in_gain1 = in_gain1 + step1;

		if(in_gain1 < 5)
			in_gain1 = 5;
		else
			if(in_gain1 >= 100)
				in_gain1 = 100;
	///////////////////////////////////////////////////////////
	 gain_setting(2u,in_gain1);
}
//
