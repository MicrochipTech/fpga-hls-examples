#ifndef __UTILS_H__
#define __UTILS_H__

#include <legup/bit_level_operations.h>
#include <legup/types.h>

static inline uint16 ByteSwap16(uint16 input) {
    return legup_bit_concat_2(legup_bit_select(input, 7, 0), 8,
                              legup_bit_select(input, 15, 8), 8);
}

static inline uint32 ByteSwap32(uint32 input) {
    return legup_bit_concat_4(
        legup_bit_select(input, 7, 0), 8, legup_bit_select(input, 15, 8), 8,
        legup_bit_select(input, 23, 16), 8, legup_bit_select(input, 31, 24), 8);
}

static inline uint64 ByteSwap64(uint64 input) {
    return legup_bit_concat_8(
        legup_bit_select(input, 7, 0), 8, legup_bit_select(input, 15, 8), 8,
        legup_bit_select(input, 23, 16), 8, legup_bit_select(input, 31, 24), 8,
        legup_bit_select(input, 39, 32), 8, legup_bit_select(input, 47, 40), 8,
        legup_bit_select(input, 55, 48), 8, legup_bit_select(input, 63, 56), 8);
}

static inline uint8 Length2Keep(uint4 length) {
    switch (length) {
    case 1:
        return 0x01;
    case 2:
        return 0x03;
    case 3:
        return 0x07;
    case 4:
        return 0x0F;
    case 5:
        return 0x1F;
    case 6:
        return 0x3F;
    case 7:
        return 0x7F;
    default:
        return 0xFF;
    }
}

static inline uint4 Keep2Length(uint8 keep) {
    switch (keep) {
    case 0x01:
        return 1;
    case 0x03:
        return 2;
    case 0x07:
        return 3;
    case 0x0F:
        return 4;
    case 0x1F:
        return 5;
    case 0x3F:
        return 6;
    case 0x7F:
        return 7;
    case 0xFF:
        return 8;
    default:
        return 0;
    }
}

static inline uint64 Keep2Mask(uint8 keep) {
    switch (keep) {
    case 0x01:
        return 0xFF;
    case 0x03:
        return 0xFFFF;
    case 0x07:
        return 0xFFFFFF;
    case 0x0F:
        return 0xFFFFFFFF;
    case 0x1F:
        return 0xFFFFFFFFFF;
    case 0x3F:
        return 0xFFFFFFFFFFFF;
    case 0x7F:
        return 0xFFFFFFFFFFFFFF;
    case 0xFF:
        return 0xFFFFFFFFFFFFFFFF;
    default:
        return 0x0;
    }
}

#endif
