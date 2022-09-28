/*
 * imx334_corei2c.h
 *
 *  Created on: 18-Feb-2019
 *      Author: I30392
 */

#ifndef APPLICATION_IMX334_COREI2C_IMX334_COREI2C_H_
#define APPLICATION_IMX334_COREI2C_IMX334_COREI2C_H_


#include "../../drivers/CoreI2C/core_i2c.h"
#include "../../drivers/CoreGPIO/core_gpio.h"
#include "../../hw_platform.h"

/*Pattern generator in camera - 1-enabled/0-disabled*/
/*If enabled, overrides all other camera settings*/
#define CAMERA_PATTERN_GEN_EN		0

/*Camera Configuration-
 * 0 - 500Mbps data rate, 1080p resolution
 * 1 - 1188Mbps data rate, 4k resolution */
#define CAM_CONFIG_4K_1_2M	1

/*Number of lane
* 1 - four lane
* 0 - eight lane  */
#define CAM_CONFIG_lane 1

#define CAM1_RST GPIO_8
#define CAM2_RST GPIO_7
#define CAM_CLK_EN GPIO_9
/*I2C Addresses*/
#define IMX334_1_DEV_REG  (0x1A )	//After adjusting for shift
#define IMX334_2_DEV_REG  (0x10)	//After adjusting for shift

void imx334_cam_reginit(uint8_t );
void imx334_cam_init(void);
void gain_setting( uint8_t i2c_ch_sel,uint16_t in_gain);

#endif /* APPLICATION_IMX334_COREI2C_IMX334_COREI2C_H_ */
