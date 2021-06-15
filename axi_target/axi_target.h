#ifndef __AXI_TARGET_H__
#define __AXI_TARGET_H__

#include <cstdint>

struct TargetLayout {
    uint8_t  arr[8];
    uint32_t a;
    uint32_t b;
    uint64_t sum_result;
    uint32_t xor_result;
    uint32_t or_result;
};

#endif // __AXI_TARGET_H__
