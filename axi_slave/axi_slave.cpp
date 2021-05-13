#include "axi_slave.h"
#include <stdio.h>

#pragma LEGUP interface variable(slave_memory) type(axi_slave)
volatile struct SlaveLayout slave_memory;

void calc_kernel() {
#pragma LEGUP function top
    slave_memory.sum_result = (uint64)slave_memory.a + (uint64)slave_memory.b +
                              slave_memory.arr[0] + slave_memory.arr[1] +
                              slave_memory.arr[2] + slave_memory.arr[3] +
                              slave_memory.arr[4] + slave_memory.arr[5] +
                              slave_memory.arr[6] + slave_memory.arr[7];
    slave_memory.xor_result = slave_memory.a ^ slave_memory.b ^
                              slave_memory.arr[0] ^ slave_memory.arr[1] ^
                              slave_memory.arr[2] ^ slave_memory.arr[3] ^
                              slave_memory.arr[4] ^ slave_memory.arr[5] ^
                              slave_memory.arr[6] ^ slave_memory.arr[7];
    slave_memory.or_result = slave_memory.a | slave_memory.b |
                             slave_memory.arr[0] | slave_memory.arr[1] |
                             slave_memory.arr[2] | slave_memory.arr[3] |
                             slave_memory.arr[4] | slave_memory.arr[5] |
                             slave_memory.arr[6] | slave_memory.arr[7];
}

int main() {

    slave_memory.a = 0xffffffff;
    slave_memory.b = 0x01010101;
    slave_memory.arr[0] = 0x1f;
    slave_memory.arr[1] = 0x1f;
    slave_memory.arr[2] = 0x17;
    slave_memory.arr[3] = 0x27;
    slave_memory.arr[4] = 0x21;
    slave_memory.arr[5] = 0xe2;
    slave_memory.arr[6] = 0xe3;
    slave_memory.arr[7] = 0x04;

    calc_kernel();

    printf("sum_result = %llx\n", slave_memory.sum_result);
    printf("xor_result = %x\n", slave_memory.xor_result);
    printf("or_result = %x\n", slave_memory.or_result);

    if (slave_memory.sum_result == 0x101010366 &&
        slave_memory.xor_result == 0xfefefeea &&
        slave_memory.or_result == 0xffffffff) {
        printf("PASS\n");
        return 0;
    } else {
        printf("FAIL\n");
        return 1;
    }
}
