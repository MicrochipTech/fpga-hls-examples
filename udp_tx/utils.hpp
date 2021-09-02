#ifndef __UTILS_H__
#define __UTILS_H__


#include <hls/ap_int.hpp>
using namespace hls;

#ifndef printd
#define printd
#endif

static inline ap_uint<16> ByteSwap16(ap_uint<16> input) {
    return (input(7, 0), input(15, 8));
}

static inline ap_uint<32> ByteSwap32(ap_uint<32> input) {
    return (input(7, 0), input(15, 8), input(23, 16), input(31, 24));
}

static inline ap_uint<64> ByteSwap64(ap_uint<64> input) {
    return (input(7, 0), input(15, 8), input(23, 16), input(31, 24),
            input(39, 32), input(47, 40), input(55, 48), input(63, 56));
}

static inline ap_uint<4> CountBits(ap_uint<8> keep) {
    int i = 0;
    ap_uint<4> count = 0;
#pragma unroll
    for (i = 0; i < 8; i++)
        count += keep[i];
    return count;
}

static inline ap_uint<8> Length2Keep(ap_uint<4> length) {
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

static inline ap_uint<4> Keep2Length(ap_uint<8> keep) {
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

static inline ap_uint<64> Keep2Mask(ap_uint<8> keep) {
    switch (keep) {
    case 0x01:
        return 0x0FF;
    case 0x03:
        return 0x0FFFF;
    case 0x07:
        return 0x0FFFFFF;
    case 0x0F:
        return 0x0FFFFFFFF;
    case 0x1F:
        return 0x0FFFFFFFFFF;
    case 0x3F:
        return 0x0FFFFFFFFFFFF;
    case 0x7F:
        return 0x0FFFFFFFFFFFFFF;
    case 0xFF:
        return 0xFFFFFFFFFFFFFFFF;
    default:
        return 0x0;
    }
}

#define xstr(a) str(a)
#define str(a) #a
#define Compare(A, B, width, error_count)                                      \
    {                                                                          \
        if (A != B) {                                                          \
            printf("Error: " xstr(A) " (%0" xstr(width) "llx) != " xstr(       \
                       B) " (%0" xstr(width) "llx).\n",                        \
                   A.to_uint64(), B.to_uint64());                              \
            error_count++;                                                     \
        }                                                                      \
    }

#endif
