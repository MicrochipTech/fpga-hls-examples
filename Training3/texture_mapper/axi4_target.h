/*
 * axi4_target.h
 *
 *  Created on: Jan 6, 2021
 *      Author: M34934
 */

#ifndef AXI4_TARGET_H_
#define AXI4_TARGET_H_

#include <stdint.h>

#define texture_size 512	// texture frame dimensions (width=height), optimized for multiple of 2

struct TargetLayout {
	//uint64_t texture_frame[texture_size*texture_size/8];	// Offset 0x00000000
	uint32_t AX;										// Offset 0x00040000 (+ 512*512 bytes)
	uint32_t AY;										// Offset 0x00040004
	uint32_t BX;										// Offset 0x00040008
	uint32_t BY;										// Offset 0x0004000C
	int32_t DX1DY;										// Offset 0x00040010
	int32_t DY1DY;										// Offset 0x00040014
	int32_t DX2DY;										// Offset 0x00040018
	int32_t DY2DY;										// Offset 0x0004001C
//	uint32_t padding;										// 8-byte (64bit) databus padding
};

#endif /* AXI4_TARGET_H_ */
