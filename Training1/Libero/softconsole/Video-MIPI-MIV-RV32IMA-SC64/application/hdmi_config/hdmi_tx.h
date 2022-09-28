/*
 * hdmi_config.h
 *
 *  Created on: Jan 20, 2016
 *      Author: Microsemi
 *  Modified on: Jan 05, 2017
 *  	Author: Microsemi
 */

#ifndef HDMI_TX_H_
#define HDMI_TX_H_

#include "../../drivers/CoreI2C/core_i2c.h"
#include "../../drivers/CoreGPIO/core_gpio.h"
#include "../../hw_platform.h"


#define I2C_MUX_ADDR (0xE0 >> 1)
#define IO_EXP_ADDR (0x40 >> 1)
#define I2C_HDMI_OUT_ADDR (0x72 >> 1)
#define I2C_HDMI_IN_ADDR (0x98 >> 1)
#define I2C_VCS_ADDR (0xCA >> 1)

#define IIC_HDMI_OUT_CONFIG_LEN  (41)

void HDMI_tx_init(void);

#endif /* HDMI_TX_H_ */
