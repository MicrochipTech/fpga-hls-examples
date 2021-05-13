#ifndef __AXI_SLAVE_H__
#define __AXI_SLAVE_H__

#include <legup/types.h>

struct SlaveLayout {
    uint8 arr[8];
    uint32 a;
    uint32 b;
    uint64 sum_result;
    uint32 xor_result;
    uint32 or_result;
};

#endif // __AXI_SLAVE_H__
