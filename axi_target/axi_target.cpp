#include "axi_target.h"
#include <stdio.h>

#pragma HLS interface variable(target_memory) type(axi_slave)
struct TargetLayout target_memory;

void calc_kernel() {
#pragma HLS function top
    target_memory.sum_result = (uint64)target_memory.a + (uint64)target_memory.b +
                              target_memory.arr[0] + target_memory.arr[1] +
                              target_memory.arr[2] + target_memory.arr[3] +
                              target_memory.arr[4] + target_memory.arr[5] +
                              target_memory.arr[6] + target_memory.arr[7];
    target_memory.xor_result = target_memory.a ^ target_memory.b ^
                              target_memory.arr[0] ^ target_memory.arr[1] ^
                              target_memory.arr[2] ^ target_memory.arr[3] ^
                              target_memory.arr[4] ^ target_memory.arr[5] ^
                              target_memory.arr[6] ^ target_memory.arr[7];
    target_memory.or_result = target_memory.a | target_memory.b |
                             target_memory.arr[0] | target_memory.arr[1] |
                             target_memory.arr[2] | target_memory.arr[3] |
                             target_memory.arr[4] | target_memory.arr[5] |
                             target_memory.arr[6] | target_memory.arr[7];
}

int main() {

    target_memory.a = 0xffffffff;
    target_memory.b = 0x01010101;
    target_memory.arr[0] = 0x1f;
    target_memory.arr[1] = 0x1f;
    target_memory.arr[2] = 0x17;
    target_memory.arr[3] = 0x27;
    target_memory.arr[4] = 0x21;
    target_memory.arr[5] = 0xe2;
    target_memory.arr[6] = 0xe3;
    target_memory.arr[7] = 0x04;

    calc_kernel();

    printf("sum_result = %llx\n", target_memory.sum_result);
    printf("xor_result = %x\n", target_memory.xor_result);
    printf("or_result = %x\n", target_memory.or_result);

    if (target_memory.sum_result == 0x101010366 &&
        target_memory.xor_result == 0xfefefeea &&
        target_memory.or_result == 0xffffffff) {
        printf("PASS\n");
        return 0;
    } else {
        printf("FAIL\n");
        return 1;
    }
}
