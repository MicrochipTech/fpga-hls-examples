#ifndef AXI4_TARGET_H_
#define AXI4_TARGET_H_

#include <cstdint>

struct TargetLayout {
	uint32_t run;
	uint32_t result0;
	uint32_t result1;
	uint32_t result2;
	uint32_t result3;
	uint32_t result4;
	uint32_t result5;
	uint32_t result6;
	uint32_t result7;
	uint32_t A0;
	uint32_t A1;
	uint32_t A2;
	uint32_t A3;
	uint32_t B0;
	uint32_t B1;
	uint32_t C0;
	uint32_t C1;
	uint32_t D0;
	uint32_t D1;
	uint32_t D2;
	uint32_t D3;
	uint32_t E0;
	uint32_t E1;
	uint32_t E2;
	uint32_t E3;
	uint32_t padding;
};

#endif /* AXI4_TARGET_H_ */
