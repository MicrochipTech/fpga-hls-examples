/*
 * msdelay.c
 *
 *  Created on: Feb 23, 2016
 *      Author: badal.nilawar
 */
//#include "sys_config_mss_clocks.h"
//#include "mss_timer/mss_timer.h"

#include "../../riscv_hal/riscv_hal.h"
#include "../../hw_platform.h"

extern volatile uint32_t timerdone;
extern volatile uint32_t g_100ms_count1;
extern volatile uint32_t g_ms_count;

void msdelay(uint32_t tms)
{
    g_ms_count = tms;
    g_100ms_count1 = 0;
    timerdone = 1;
    while(timerdone != 0)
	{
		//busy wait loop
	}

}
