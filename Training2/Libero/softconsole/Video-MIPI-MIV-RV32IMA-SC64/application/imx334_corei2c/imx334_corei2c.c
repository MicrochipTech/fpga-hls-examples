#include <stdio.h>
#include "imx334_corei2c.h"

extern gpio_instance_t g_gpio_out;

extern i2c_instance_t g_i2c_instance_cam1;
static i2c_instance_t * sensor1_i2c = &g_i2c_instance_cam1;
extern i2c_instance_t g_i2c_instance_cam2;
static i2c_instance_t * sensor2_i2c = &g_i2c_instance_cam2;

static uint8_t tx_buffer[64];
static uint16_t write_length;
static i2c_status_t status;

static i2c_status_t sensor_i2c_write(uint8_t i2c_ch_sel, uint16_t data_reg, uint8_t data) {
	tx_buffer[0] = data_reg >> 8;
	tx_buffer[1] = data_reg & 0xff;
	tx_buffer[2] = data;// >> 8;
	write_length = sizeof(data_reg) + sizeof(data);


		I2C_write(sensor1_i2c, IMX334_1_DEV_REG, (const uint8_t *) tx_buffer,
					write_length, I2C_RELEASE_BUS );
			status = I2C_wait_complete(sensor1_i2c, I2C_NO_TIMEOUT );

			tx_buffer[0] = data_reg >> 8;
			tx_buffer[1] = data_reg & 0xff;
			tx_buffer[2] = data;
			write_length = sizeof(data_reg) + sizeof(data);
		I2C_write(sensor2_i2c, IMX334_2_DEV_REG, (const uint8_t *) tx_buffer,
					write_length, I2C_RELEASE_BUS );
			status = I2C_wait_complete(sensor2_i2c, I2C_NO_TIMEOUT );

	return status;
}
static i2c_status_t sensor_i2c_write_gain(uint8_t i2c_ch_sel, uint16_t data_reg, uint8_t data) {
	if (i2c_ch_sel==1){

	tx_buffer[0] = data_reg >> 8;
	tx_buffer[1] = data_reg & 0xff;
	tx_buffer[2] = data;// >> 8;
	write_length = sizeof(data_reg) + sizeof(data);

	I2C_write(sensor1_i2c, IMX334_1_DEV_REG, (const uint8_t *) tx_buffer,write_length, I2C_RELEASE_BUS );
    status = I2C_wait_complete(sensor1_i2c, I2C_NO_TIMEOUT );

	}
	else if
	(i2c_ch_sel==2){

	tx_buffer[0] = data_reg >> 8;
	tx_buffer[1] = data_reg & 0xff;
	tx_buffer[2] = data;
	write_length = sizeof(data_reg) + sizeof(data);
	I2C_write(sensor2_i2c, IMX334_2_DEV_REG, (const uint8_t *) tx_buffer,write_length, I2C_RELEASE_BUS );
	status = I2C_wait_complete(sensor2_i2c, I2C_NO_TIMEOUT );
	}
	return status;
}

void imx334_cam_init()
{
	I2C_init( sensor1_i2c, COREI2C_IMX1_BASE_ADDR, IMX334_1_DEV_REG, I2C_PCLK_DIV_256 );
	I2C_init( sensor2_i2c, COREI2C_IMX2_BASE_ADDR, IMX334_2_DEV_REG, I2C_PCLK_DIV_256 );
	GPIO_set_output(&g_gpio_out, CAM1_RST, 0u);
	GPIO_set_output(&g_gpio_out, CAM2_RST, 0u);
	msdelay(100);
	GPIO_set_output(&g_gpio_out, CAM1_RST, 1u); // Bring camera out of reset
	GPIO_set_output(&g_gpio_out, CAM2_RST, 1u); // Bring camera out of reset
	msdelay(100);
	GPIO_set_output(&g_gpio_out, CAM_CLK_EN, 1u); //Enable Cam clock from FPGA
	msdelay(100);
}

void imx334_cam_reginit( uint8_t i2c_ch_sel)
{
	uint32_t i;

	sensor_i2c_write(i2c_ch_sel, 0x3000, 0x01);// STANDBY MODE enabled
	sensor_i2c_write(i2c_ch_sel, 0x3018, 0x04);//WINMODE
	sensor_i2c_write(i2c_ch_sel, 0x3030, 0xCA);//VMAX
	sensor_i2c_write(i2c_ch_sel, 0x3031, 0x08);//VMAX
	sensor_i2c_write(i2c_ch_sel, 0x3032, 0x00);//VMAX
	sensor_i2c_write(i2c_ch_sel, 0x3034, 0x4C);//HMAX
	sensor_i2c_write(i2c_ch_sel, 0x3035, 0x04);//HMAX
#if CAM_CONFIG_4K_1_2M
	sensor_i2c_write(i2c_ch_sel, 0x302C, 0x30);//TRIM_START
	sensor_i2c_write(i2c_ch_sel, 0x302D, 0x00);//TRIM_START
	sensor_i2c_write(i2c_ch_sel, 0x302E, 0x00);//HNUM
	sensor_i2c_write(i2c_ch_sel, 0x302F, 0x0F);//HNUM
	sensor_i2c_write(i2c_ch_sel, 0x3074, 0xB0);//AREA3_ST_ADR_1
	sensor_i2c_write(i2c_ch_sel, 0x3075, 0x00);//AREA3_ST_ADR_1
	sensor_i2c_write(i2c_ch_sel, 0x308E, 0xB1);//AREA3_ST_ADR_2
	sensor_i2c_write(i2c_ch_sel, 0x308F, 0x00);//AREA3_ST_ADR_2
	sensor_i2c_write(i2c_ch_sel, 0x3076, 0x70);//AREA3_WIDTH_1
	sensor_i2c_write(i2c_ch_sel, 0x3077, 0x08);//AREA3_WIDTH_1
	sensor_i2c_write(i2c_ch_sel, 0x3090, 0x70);//AREA3_WIDTH_2
	sensor_i2c_write(i2c_ch_sel, 0x3091, 0x08);//AREA3_WIDTH_2
	sensor_i2c_write(i2c_ch_sel, 0x3308, 0x70);//Y_OUT_SIZE
	sensor_i2c_write(i2c_ch_sel, 0x3309, 0x08);//Y_OUT_SIZE
	sensor_i2c_write(i2c_ch_sel, 0x30C6, 0x00);//BLACK_OFSET_ADR
	sensor_i2c_write(i2c_ch_sel, 0x30C7, 0x00);//BLACK_OFSET_ADR
	sensor_i2c_write(i2c_ch_sel, 0x30CE, 0x00);//UNRD_LINE_MAX
	sensor_i2c_write(i2c_ch_sel, 0x30CF, 0x00);//UNRD_LINE_MAX
	sensor_i2c_write(i2c_ch_sel, 0x30D8, 0x20);//UNREAD_ED_ADR
	sensor_i2c_write(i2c_ch_sel, 0x30D9, 0x12);//UNREAD_ED_ADR
	sensor_i2c_write(i2c_ch_sel, 0x304C, 0x00);//OPB_SIZE_V-OPTICAL BLACK
#else
	sensor_i2c_write(i2c_ch_sel, 0x302C, 0xF0);//TRIM_START
	sensor_i2c_write(i2c_ch_sel, 0x302D, 0x03);//TRIM_START
	sensor_i2c_write(i2c_ch_sel, 0x302E, 0x80);//HNUM
	sensor_i2c_write(i2c_ch_sel, 0x302F, 0x07);//HNUM
	sensor_i2c_write(i2c_ch_sel, 0x3074, 0xCC);//AREA3_ST_ADR_1
	sensor_i2c_write(i2c_ch_sel, 0x3075, 0x02);//AREA3_ST_ADR_1
	sensor_i2c_write(i2c_ch_sel, 0x308E, 0xCD);//AREA3_ST_ADR_2
	sensor_i2c_write(i2c_ch_sel, 0x308F, 0x02);//AREA3_ST_ADR_2
	sensor_i2c_write(i2c_ch_sel, 0x3076, 0x38);//AREA3_WIDTH_1
	sensor_i2c_write(i2c_ch_sel, 0x3077, 0x04);//AREA3_WIDTH_1
	sensor_i2c_write(i2c_ch_sel, 0x3090, 0x38);//AREA3_WIDTH_2
	sensor_i2c_write(i2c_ch_sel, 0x3091, 0x04);//AREA3_WIDTH_2
	sensor_i2c_write(i2c_ch_sel, 0x3308, 0x38);//Y_OUT_SIZE
	sensor_i2c_write(i2c_ch_sel, 0x3309, 0x04);//Y_OUT_SIZE
	sensor_i2c_write(i2c_ch_sel, 0x30C6, 0x00);//BLACK_OFSET_ADR
	sensor_i2c_write(i2c_ch_sel, 0x30C7, 0x00);//BLACK_OFSET_ADR
	sensor_i2c_write(i2c_ch_sel, 0x30CE, 0x00);//UNRD_LINE_MAX
	sensor_i2c_write(i2c_ch_sel, 0x30CF, 0x00);//UNRD_LINE_MAX
	sensor_i2c_write(i2c_ch_sel, 0x30D8, 0x18);//UNREAD_ED_ADR
	sensor_i2c_write(i2c_ch_sel, 0x30D9, 0x0A);//UNREAD_ED_ADR
	sensor_i2c_write(i2c_ch_sel, 0x304C, 0x00);//OPB_SIZE_V-OPTICAL BLACK
#endif

	sensor_i2c_write(i2c_ch_sel, 0x304E, 0x00);//H_REVERSE
	sensor_i2c_write(i2c_ch_sel, 0x304F, 0x00);//V_REVERSE
	sensor_i2c_write(i2c_ch_sel, 0x3050, 0x0);//ADBIT-0-10BIT/ 1-12BIT

	sensor_i2c_write(i2c_ch_sel, 0x30B6, 0x00);//UNREAD_PARAM5
	sensor_i2c_write(i2c_ch_sel, 0x30B7, 0x00);//UNREAD_PARAM5
	sensor_i2c_write(i2c_ch_sel, 0x3116, 0x08);//UNREAD_PARAM6
	sensor_i2c_write(i2c_ch_sel, 0x3117, 0x00);//UNREAD_PARAM6

	/*Change this if slave mode is used*/
	sensor_i2c_write(i2c_ch_sel, 0x31A0, 0x20);//XVS,XHS output tied to ground
	sensor_i2c_write(i2c_ch_sel, 0x31A1, 0x0F);//XVS,XHS output tied to ground
#if CAM_CONFIG_4K_1_2M
	/*1188 Mbps*/
	sensor_i2c_write(i2c_ch_sel, 0x300C, 0x42);//BC_WAIT_TIME
	sensor_i2c_write(i2c_ch_sel, 0x300D, 0x2E);//CP_WAIT_TIME
	sensor_i2c_write(i2c_ch_sel, 0x314C, 0xB0);//INCKSEL1
	sensor_i2c_write(i2c_ch_sel, 0x314D, 0x00);//INCKSEL1
	sensor_i2c_write(i2c_ch_sel, 0x315A, 0x02);//INCKSEL2
	sensor_i2c_write(i2c_ch_sel, 0x3168, 0x8F);//INCKSEL3
	sensor_i2c_write(i2c_ch_sel, 0x316A, 0x7E);//INCKSEL4
	sensor_i2c_write(i2c_ch_sel, 0x319E, 0x01);//SYS_MODE
#else
	/*500Mbps*/
	sensor_i2c_write(i2c_ch_sel, 0x300C, 0x3B);//BC_WAIT_TIME
	sensor_i2c_write(i2c_ch_sel, 0x300D, 0x29);//CP_WAIT_TIME
	sensor_i2c_write(i2c_ch_sel, 0x314C, 0x29);//INCKSEL1
	sensor_i2c_write(i2c_ch_sel, 0x314D, 0x01);//INCKSEL1
	sensor_i2c_write(i2c_ch_sel, 0x315A, 0x0A);//INCKSEL2
	sensor_i2c_write(i2c_ch_sel, 0x3168, 0xA0);//INCKSEL3
	sensor_i2c_write(i2c_ch_sel, 0x316A, 0x7E);//INCKSEL4
	sensor_i2c_write(i2c_ch_sel, 0x319E, 0x02);//SYS_MODE
#endif
	sensor_i2c_write(i2c_ch_sel, 0x3199, 0x00);//HADD,VADD - 0 All pix scan, 3-2/2binning
	sensor_i2c_write(i2c_ch_sel, 0x319D, 0x00);//MDBIT-0-10bit,1-12bit

	sensor_i2c_write(i2c_ch_sel, 0x31DD, 0x03);//VALID_EXPAND
	sensor_i2c_write(i2c_ch_sel, 0x3300, 0x00);//TCYCLE

	sensor_i2c_write(i2c_ch_sel, 0x341C, 0xFF);//ADBIT1 FFh-10bit, 47h-12bit
	sensor_i2c_write(i2c_ch_sel, 0x341D, 0x01);//ADBIT1 01h-10bit, 00h-12bit

#if CAM_CONFIG_lane
	sensor_i2c_write(i2c_ch_sel, 0x3A01, 0x03);//4 LANE_MODE
#else
	sensor_i2c_write(i2c_ch_sel, 0x3A01, 0x07);//8 LANE_MODE
#endif
	sensor_i2c_write(i2c_ch_sel, 0x3A18, 0x7F);//TCLKPOST
	sensor_i2c_write(i2c_ch_sel, 0x3A19, 0x00);//TCLKPOST
	sensor_i2c_write(i2c_ch_sel, 0x3A1A, 0x37);//TCLKPPREPARE
	sensor_i2c_write(i2c_ch_sel, 0x3A1B, 0x00);//TCLKPREPARE
	sensor_i2c_write(i2c_ch_sel, 0x3A1C, 0x37);//TCLKTRAIL
	sensor_i2c_write(i2c_ch_sel, 0x3A1D, 0x00);//TCLKTRAIL
	sensor_i2c_write(i2c_ch_sel, 0x3A1E, 0xF7);//TCLKZERO
	sensor_i2c_write(i2c_ch_sel, 0x3A1F, 0x00);//TCLKZERO
	sensor_i2c_write(i2c_ch_sel, 0x3A20, 0x3F);//THSPREPARE
	sensor_i2c_write(i2c_ch_sel, 0x3A21, 0x00);//THSPREPARE
	sensor_i2c_write(i2c_ch_sel, 0x3A20, 0x6F);//THSZERO
	sensor_i2c_write(i2c_ch_sel, 0x3A21, 0x00);//THSZERO
	sensor_i2c_write(i2c_ch_sel, 0x3A20, 0x3F);//THSTRAIL
	sensor_i2c_write(i2c_ch_sel, 0x3A21, 0x00);//THSTRAIL
	sensor_i2c_write(i2c_ch_sel, 0x3A20, 0x5F);//THSEXIT
	sensor_i2c_write(i2c_ch_sel, 0x3A21, 0x00);//THSEXIT
	sensor_i2c_write(i2c_ch_sel, 0x3A20, 0x2F);//TLPX
	sensor_i2c_write(i2c_ch_sel, 0x3A21, 0x00);//TLPX
	/*Crop Window settings*/

	/* Pattern generator settings*/
#if CAMERA_PATTERN_GEN_EN
	sensor_i2c_write(i2c_ch_sel, 0x3148, 0x10);// TEST_CLK_EN_MIPI
	sensor_i2c_write(i2c_ch_sel, 0x3280, 0x00);// DIG_CLP_MODE
	sensor_i2c_write(i2c_ch_sel, 0x329C, 0x01);// TPG_Enable_DUOUT
	sensor_i2c_write(i2c_ch_sel, 0x329E, 0x0B);// Pattern select
	sensor_i2c_write(i2c_ch_sel, 0x32A0, 0x13);// TPG color width
	sensor_i2c_write(i2c_ch_sel, 0x3302, 0x00);// Black level MSB
	sensor_i2c_write(i2c_ch_sel, 0x3303, 0x00);// Black level LSB
	sensor_i2c_write(i2c_ch_sel, 0x336C, 0x01);// WRJ_OPEN
#endif

	/*Additional settings for All scan mode */
	sensor_i2c_write(i2c_ch_sel, 0x3078, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3079, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x307A, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x307B, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3080, 0x02);//0xFE if inverted vertical readout
	sensor_i2c_write(i2c_ch_sel, 0x3081, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3082, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3083, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3088, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3094, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3095, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3096, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x309B, 0x02);//0xFE if inverted vertical readout
	sensor_i2c_write(i2c_ch_sel, 0x309C, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x309D, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x309E, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x30A4, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x30A5, 0x00);
	/*End of additional settings for all scan mode*/


	/*Additional Mandatory Settings*/
	sensor_i2c_write(i2c_ch_sel, 0x3288, 0x21);
	sensor_i2c_write(i2c_ch_sel, 0x328A, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3414, 0x05);
	sensor_i2c_write(i2c_ch_sel, 0x3416, 0x18);
	sensor_i2c_write(i2c_ch_sel, 0x35AC, 0x0E);
	sensor_i2c_write(i2c_ch_sel, 0x3648, 0x01);
	sensor_i2c_write(i2c_ch_sel, 0x364A, 0x04);
	sensor_i2c_write(i2c_ch_sel, 0x364C, 0x04);
	sensor_i2c_write(i2c_ch_sel, 0x3678, 0x01);
	sensor_i2c_write(i2c_ch_sel, 0x367C, 0x31);
	sensor_i2c_write(i2c_ch_sel, 0x367E, 0x31);
	sensor_i2c_write(i2c_ch_sel, 0x3708, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3714, 0x01);
	sensor_i2c_write(i2c_ch_sel, 0x3715, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3716, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3717, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x371C, 0x3D);
	sensor_i2c_write(i2c_ch_sel, 0x371D, 0x3F);
	sensor_i2c_write(i2c_ch_sel, 0x372C, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x372D, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x372E, 0x46);
	sensor_i2c_write(i2c_ch_sel, 0x372F, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3730, 0x89);
	sensor_i2c_write(i2c_ch_sel, 0x3731, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3732, 0x08);
	sensor_i2c_write(i2c_ch_sel, 0x3733, 0x01);
	sensor_i2c_write(i2c_ch_sel, 0x3734, 0xFE);
	sensor_i2c_write(i2c_ch_sel, 0x3735, 0x05);
	sensor_i2c_write(i2c_ch_sel, 0x375D, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x375E, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x375F, 0x61);
	sensor_i2c_write(i2c_ch_sel, 0x3760, 0x06);
	sensor_i2c_write(i2c_ch_sel, 0x3768, 0x1B);
	sensor_i2c_write(i2c_ch_sel, 0x3769, 0x1B);
	sensor_i2c_write(i2c_ch_sel, 0x376A, 0x1A);
	sensor_i2c_write(i2c_ch_sel, 0x376B, 0x19);
	sensor_i2c_write(i2c_ch_sel, 0x376C, 0x18);
	sensor_i2c_write(i2c_ch_sel, 0x376D, 0x14);
	sensor_i2c_write(i2c_ch_sel, 0x376E, 0x0F);
	sensor_i2c_write(i2c_ch_sel, 0x3776, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3777, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x3778, 0x46);
	sensor_i2c_write(i2c_ch_sel, 0x3779, 0x00);
	sensor_i2c_write(i2c_ch_sel, 0x377A, 0x08);
	sensor_i2c_write(i2c_ch_sel, 0x377B, 0x01);
	sensor_i2c_write(i2c_ch_sel, 0x377C, 0x45);
	sensor_i2c_write(i2c_ch_sel, 0x377D, 0x01);
	sensor_i2c_write(i2c_ch_sel, 0x377E, 0x23);
	sensor_i2c_write(i2c_ch_sel, 0x377F, 0x02);
	sensor_i2c_write(i2c_ch_sel, 0x3780, 0xD9);
	sensor_i2c_write(i2c_ch_sel, 0x3781, 0x03);
	sensor_i2c_write(i2c_ch_sel, 0x3782, 0xF5);
	sensor_i2c_write(i2c_ch_sel, 0x3783, 0x06);
	sensor_i2c_write(i2c_ch_sel, 0x3784, 0xA5);
	sensor_i2c_write(i2c_ch_sel, 0x3788, 0x0F);
	sensor_i2c_write(i2c_ch_sel, 0x378A, 0xD9);
	sensor_i2c_write(i2c_ch_sel, 0x378B, 0x03);
	sensor_i2c_write(i2c_ch_sel, 0x378C, 0xEB);
	sensor_i2c_write(i2c_ch_sel, 0x378D, 0x05);
	sensor_i2c_write(i2c_ch_sel, 0x378E, 0x87);
	sensor_i2c_write(i2c_ch_sel, 0x378F, 0x06);
	sensor_i2c_write(i2c_ch_sel, 0x3790, 0xF5);
	sensor_i2c_write(i2c_ch_sel, 0x3792, 0x43);
	sensor_i2c_write(i2c_ch_sel, 0x3794, 0x7A);
	sensor_i2c_write(i2c_ch_sel, 0x3796, 0xA1);
	sensor_i2c_write(i2c_ch_sel, 0x37B0, 0x37);// Xmaster pin high = 37h, else 36h
	sensor_i2c_write(i2c_ch_sel, 0x3E04, 0x0E);
	/*End of additional mandatory settings */

	sensor_i2c_write(i2c_ch_sel, 0x30E8, 0x30);// Gain setting LSB
	sensor_i2c_write(i2c_ch_sel, 0x30E9, 0x00);// Gain setting MSB
	sensor_i2c_write(i2c_ch_sel, 0x3E04, 0x0E);// Mandatory value as per data sheet
	sensor_i2c_write(i2c_ch_sel, 0x3002, 0x00);// Master mode
	msdelay(1000);

	sensor_i2c_write(i2c_ch_sel, 0x3000, 0x00);// STANDBY mode disabled
	//sensor_i2c_write_bits(0x301A, 0x0004, 1);  	//Enable Streaming
	for(i = 0; i < 50000; i++);
}


void gain_setting( uint8_t i2c_ch_sel,uint16_t in_gain)
{
sensor_i2c_write_gain(i2c_ch_sel, 0x30E8, in_gain);// Gain setting LSB
sensor_i2c_write_gain(i2c_ch_sel, 0x30E9, 0);// Gain setting MSB

}

