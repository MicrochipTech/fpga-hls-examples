/*
 * hdmi_config.c
 *
 *  Created on: Jan 20, 2016
 *      Author: Microsemi
 */

#include <stdio.h>
#include "hdmi_tx.h"

extern gpio_instance_t g_gpio_out;
extern i2c_instance_t g_i2c_instance_hdmi;
static i2c_instance_t * this_i2c = &g_i2c_instance_hdmi;

static uint8_t tx_buffer[16];

static const uint8_t iic_hdmi_out_config[IIC_HDMI_OUT_CONFIG_LEN][2] =
{
	{0xF9, 0x00}, // Fixed I2C Addr

	// Power-up the Tx (HPD must be high)
	{0x41, 0x10}, // all circuits powered up 0x41[6] , sync adjustment disabled 0x41[1]

	// Fixed registers that must be set on power up
	{0x98, 0x03}, // ADI Recommended Write - IMP
	{0x9A, 0xE0}, // ADI Recommended Write - IMP
	{0x9C, 0x30}, // ADI Recommended Write - IMP
	{0x9D, 0x61}, // Set clock divide-no clock division & 0x9d[1:0] = '01'
	{0xA2, 0xA4}, // ADI Recommended Write - IMP
	{0xA3, 0xA4}, // ADI Recommended Write - IMP
	{0xE0, 0xD0}, // ADI Recommended Write - IMP
	{0xF9, 0x00}, // ADI Recommended Write - IMP
	{0xDE, 0x10}, // ADI Recommended Write - 0xDE[3] = '0'  Normal TMDS Clock

	{0x94, 0x00}, // Disable All Interrupts
	{0xA1, 0x40}, // 0xA1[6] - Monitor Sense monitoring disabled, Channels 0,1,2 and clock driver power up

	{0xBA, 0x60}, // Programmable delay for input video clock = 011 = no delay

	{0xD6, 0xC0}, //HPD is always high [7:6], soft TMDS clock on disabled [4], video input and clock not gated[0]


	// Set up the video input mode
	{0x15, 0x00}, // Input YCbCr 4:2:2 with embedded syncs
	//Set video output format
	//{0x16, 0x38},                         //    R0x16[ 7] = Output Video Format = 0 (4:4:4)
                                        //    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
                                        //    R0x16[3:2] = Input video Style = 10 (style 1)
                                        //    R0x16[  1] = DDR Input Edge = 0 (falling edge)
                                        //    ROx16[  0] = Output Color Space = 4 (RGB)

	{0x16, 0x30},                         //    R0x16[ 7] = Output Video Format = 0 (4:4:4)
	                                        //    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
	                                        //    R0x16[3:2] = Input video Style = 10 (style 1)
	                                        //    R0x16[  1] = DDR Input Edge = 0 (falling edge)
	                                        //    ROx16[  0] = Output Color Space = 4 (RGB)

	// Set up the video output mode
	{0x17, 0x02}, // Vsync polarity = high, Hsync Polarity = high, Aspect ration = 16:9 and DE generator disabled

	{0xD0, 0x30},  // Delay adjust for negative DDR capture = disabled,   R0xD0[1] = 0;sync adjustment then DE generation

	{0x18, 0x00}, // Color space conversion
	                                      //    R0x18[  7] = CSC enable = 1 (CSC enabled)
	                                      //    R0x18[6:5] = CSC Scaling Factor = 10 (+/- 4.0, -16384 - 16380)
	                                      //    R0x18[4:0] = CSC coefficient A1[12:8]
	{0x40, 0x80}, // General Control packet enable
	{0x48, 0x00}, // Video Input Justification
	                                      //    R0x48[8:7] = Video Input Justification = 10 (left justified)
	{0x49, 0xA8}, // Bit trimming mode = 101010 (truncate)
	{0x4C, 0x00}, // Color Depth = 0000 (color depth not indicated)
	{0x55, 0x00},  // Set RGB in AVinfo Frame //    R0x55[6:5] = Output Format = 00 (RGB)
	{0x56, 0x08},                           //    R0x56[5:4] = Picture Aspect Ratio = 00 (no data)
	                                      //    R0x56[3:0] = Active Format Aspect Ratio = 1000 (Same as Aspect Ratio 16:9)
	{0xAF, 0x06}, // Set HDMI Mode
	                                      //    R0xAF[  7] = HDCP Enable = 0 (HDCP disabled)
	                                      //    R0xAF[  4] = Frame Encryption = 0 (Current frame NOT HDCP encrypted)
	                                      //    R0xAF[3:2] = 01 (fixed)
	                                      //    R0xAF[  1] = HDMI/DVI Mode Select = 1 (HDMI Mode)


};

#define IIC_HDMI_OUT_EMBEDDED_SYNC_CONFIG_LEN  (6)
static const uint8_t iic_hdmi_out_embedded_sync_config[IIC_HDMI_OUT_EMBEDDED_SYNC_CONFIG_LEN][2] =
{
   //
   // Configure for 1080p60 16-bit bus embedded syncs
   //
   {0x30, 0x1B}, // Hsync placement = 0001011000 (0x58) = 88
   {0x31, 0x82}, // Hsync duration  = 0000101100 (0x2C) = 44
   {0x32, 0x80}, //
   {0x33, 0x14}, // Vsync placement = 0000000100 (0x04) =  4
   {0x34, 0x05}, // Vsync duration  = 0000000101 (0x05) =  5
   {0x17, 0x00}  // VSync Polarity = 0(high), HSync Polarity = 0(high)
};

static i2c_status_t hdmi_i2c_tx_write(uint8_t i2c_div_address, uint8_t data_reg, uint8_t data)
{
	uint8_t write_length;
	i2c_status_t status;
	if(data_reg){
		tx_buffer[0] = data_reg;
		tx_buffer[1] = data;
		write_length = sizeof(data_reg) + sizeof(data);
	}else{
	tx_buffer[0] = data;
	write_length = sizeof(data);
	}

    I2C_write(this_i2c, i2c_div_address, (const uint8_t *)tx_buffer, write_length, I2C_RELEASE_BUS );

    status = I2C_wait_complete( this_i2c, I2C_NO_TIMEOUT );
	return status;
}

static i2c_status_t hdmi_i2c_tx_read(uint8_t i2c_div_address, uint8_t data_reg, uint8_t *readdata, uint8_t readlen)
{
	i2c_status_t status;
	I2C_write_read( this_i2c, i2c_div_address, &data_reg, 1, readdata, readlen, I2C_RELEASE_BUS);
    status = I2C_wait_complete( this_i2c, I2C_NO_TIMEOUT );
	return status;
}

void HDMI_tx_init()
{
	uint8_t read_buffer[IIC_HDMI_OUT_CONFIG_LEN][2];
    uint32_t inc, i;
	uint8_t read_data;

	I2C_init( this_i2c, COREI2C_BASE_ADDR, 0x01, I2C_PCLK_DIV_256 );

/*	GPIO_set_output(&g_gpio_out, GPIO_9, 0u);
	msdelay(5);
	GPIO_set_output(&g_gpio_out, GPIO_9, 1u); // hdmi reset*/

    msdelay(1);
//I2C MUX selection
/*    if(hdmi_i2c_tx_write(I2C_MUX_ADDR,0,0x04) == I2C_SUCCESS)
    {
      //printf("transaction successful\n");
    }*/

   	//Configure ADV7511 Core Registers
   	for(inc = 0; inc < IIC_HDMI_OUT_CONFIG_LEN; ++inc)
   	{
		if(hdmi_i2c_tx_write(I2C_HDMI_OUT_ADDR, iic_hdmi_out_config[inc][0], iic_hdmi_out_config[inc][1]) == I2C_SUCCESS)
    	{
			//printf("transaction successful\n");
    	}

 		if(hdmi_i2c_tx_read(I2C_HDMI_OUT_ADDR, iic_hdmi_out_config[inc][0], &read_data, 1) == I2C_SUCCESS)
   		{
 			read_buffer[inc][0] = iic_hdmi_out_config[inc][0];
 			read_buffer[inc][1] = read_data;
   	    	//printf("transaction successful\n");
   		}

	}

}

