#ifndef __WEIGHTS_H__
#define __WEIGHTS_H__

// This file holds the weights and biases used for each layer.

#include "defines.h"

// This pragma is needed as the hex values used to initialize the weights
// and biases are 32-bit int literals while the array stores 16-bit ints.
// The Wnarrowing warning warns when these literals get narrowed to
// 16-bit and can be safely ignored.
#pragma GCC diagnostic ignored "-Wnarrowing"

const short conv1_weights[2][1][9] = {
    {{0xE8B4, 0x0AA2, 0x27C9, 0xE8C5, 0x1ED9, 0x1D50, 0xFAFA, 0x1F11, 0x1C0D}},
    {{0x2346, 0x0FDF, 0x05DD, 0xF345, 0x202C, 0x1CA9, 0xD9E0, 0xD613, 0xF0EF}}};
const short conv1_bias[2] = {0x0002, 0xFFFD};

const short conv2_weights[4][2][9] = {
    {{0xFF51, 0xF961, 0x0D84, 0xFB48, 0xF523, 0xF864, 0x0226, 0x09CE, 0xFE15},
     {0x23AE, 0x299A, 0x2616, 0xF6CC, 0x2200, 0xFB73, 0xF6FA, 0xDABF, 0xECD8}},

    {{0x05D0, 0xF40F, 0x09D7, 0x097A, 0xF359, 0x1329, 0x171D, 0x00E3, 0x128E},
     {0xF68A, 0x0658, 0x037A, 0xF582, 0xFE8D, 0x133B, 0x0DE3, 0x10BF, 0x04BA}},

    {{0x1522, 0x062E, 0xFA1B, 0xF4A8, 0xEA15, 0x1C66, 0xDD1C, 0xF9B2, 0x1B2D},
     {0x05F5, 0xFD95, 0x133A, 0x06B2, 0xF505, 0xE09B, 0x06BD, 0xF234, 0xDF25}},

    {{0x0C8A, 0xF230, 0x04C9, 0x2057, 0x072E, 0xED20, 0x13A2, 0xED4B, 0xE8E6},
     {0xFD1C, 0x010C, 0x03F9, 0x079B, 0xEEF1, 0x0475, 0xFC2F, 0xE8FC, 0xF336}}};

const short conv2_bias[4] = {0x0003, 0x0049, 0x0022, 0xFFE3};

const short conv3_weights[4][4][9] = {
    {{0x136F, 0x09DB, 0x0629, 0x004A, 0x00DA, 0x056D, 0x035E, 0x0667, 0x0ACA},
     {0xFFD3, 0xF7EE, 0x0F5E, 0x13F8, 0x0524, 0x0955, 0xF5DD, 0x0958, 0xEF3C},
     {0xFD7F, 0xFEC0, 0xF937, 0x121E, 0x0338, 0x00CC, 0x0024, 0x298D, 0x1C78},
     {0x0B09, 0x0AE8, 0xFE50, 0x08EC, 0xFAC1, 0xE957, 0x29F7, 0x1007, 0x0546}},

    {{0xEAC2, 0xE378, 0xC284, 0xF8B2, 0xD5C3, 0xC0F1, 0xF44A, 0xE318, 0xDF4D},
     {0xF506, 0x11DE, 0xFDA9, 0xFCC5, 0xEFF1, 0xFDD3, 0xF7DE, 0x0622, 0x099D},
     {0x1A90, 0x0FD2, 0x0289, 0x0DAC, 0x012A, 0x1094, 0x24AE, 0x0A0D, 0x0547},
     {0x1E55, 0x0E3B, 0x028F, 0x101C, 0x035F, 0x0D1E, 0x0C43, 0x0722, 0xF4C1}},

    {{0x013F, 0xEDF7, 0x0649, 0xF83A, 0xF4F6, 0xE2D0, 0x077C, 0xF789, 0x0E37},
     {0x1202, 0x0952, 0x0F45, 0xFED2, 0x0F84, 0x0E35, 0x100A, 0x1057, 0x12D7},
     {0x271D, 0x0617, 0xE57F, 0x1CB3, 0xF55A, 0xEABC, 0xF7A4, 0x0819, 0xF7A9},
     {0x03CB, 0x1864, 0x2CF5, 0xEBF0, 0x0D85, 0x047E, 0x008F, 0x033B, 0xEEDA}},

    {{0x0BE2, 0x056F, 0x09BA, 0x12D4, 0x1182, 0xF82C, 0x1673, 0x1240, 0x0F7E},
     {0xF86B, 0xFC2C, 0x0D3A, 0xFA59, 0x011E, 0x02DA, 0x0C2E, 0x1031, 0x049F},
     {0xE236, 0xF264, 0xFAE6, 0xEAD0, 0xF869, 0xF997, 0xF4F0, 0x0EF0, 0x1F84},
     {0xC6DD, 0x0152, 0xF42A, 0xE3F9, 0xCF9D, 0x0F96, 0xEC21, 0xEBBF, 0x0F50}}};

const short conv3_bias[4] = {0xFFE0, 0x004E, 0x0045, 0x0028};

const short conv4_weights[2][4][9] = {
    {{0xF8D9, 0xF165, 0xE0F4, 0x040C, 0xF7C4, 0xF449, 0x023D, 0x092B, 0x0459},
     {0xF880, 0xEB36, 0x129A, 0xEAAD, 0x082C, 0x2942, 0xEA83, 0x068D, 0x2105},
     {0xFEF7, 0xF1AD, 0xED95, 0x18F5, 0x1BEA, 0x04E4, 0x180D, 0x07D6, 0xF9A8},
     {0x1B78, 0x1367, 0x0455, 0x0D19, 0x0A8E, 0x0A55, 0x17CF, 0xE955, 0xEC30}},

    {{0x1591, 0xFFC4, 0x09FB, 0xFE3D, 0x0D77, 0xF2C4, 0xEB9E, 0xDA6B, 0xF0E9},
     {0x17CF, 0x0AF6, 0x121C, 0x1B62, 0x1309, 0x10CD, 0x385D, 0x238F, 0xF1FD},
     {0x02AD, 0x1330, 0x0FAE, 0xF89A, 0xF269, 0x1A50, 0x1511, 0x0669, 0x107B},
     {0x0702, 0xFC29, 0xF89D, 0xEEBC, 0xE7BE, 0x0758, 0xE061, 0xEA01, 0xEF76}}};

const short conv4_bias[2] = {0x0057, 0x0002};

const short fc_weights[2][10][7 * 7] = {
    {{0xfab3, 0x0b69, 0x0ef7, 0x09ea, 0xffc4, 0x062e, 0x00f9, 0xf3d1, 0x0bda,
      0xfdf2, 0xf2fa, 0xedb0, 0x088c, 0xfc39, 0x0c29, 0x0725, 0xff87, 0xee28,
      0xf8b3, 0xeec9, 0x0925, 0x1894, 0xf77c, 0xe71e, 0xec49, 0xe9a7, 0x0111,
      0x073d, 0x1642, 0x0448, 0xedea, 0x016f, 0xf24c, 0x03d0, 0xf7a3, 0x135c,
      0x04bf, 0x04f3, 0xfa63, 0x0a2e, 0x0731, 0xf406, 0x02c7, 0x0378, 0xf5fd,
      0xf7d2, 0xf2c8, 0x005a, 0xe5cb},
     {0xede7, 0xe9d9, 0xfeb0, 0x099e, 0xf8c8, 0x0b88, 0x0343, 0xfecb, 0xf93a,
      0x0c3f, 0x10ac, 0x0297, 0xf54f, 0xf3fc, 0x0314, 0xf266, 0xf778, 0x14e8,
      0xf1ad, 0xfc07, 0xf95d, 0xf6a0, 0xeae1, 0xf950, 0x0258, 0xfb14, 0xf524,
      0xdfba, 0xf715, 0x0229, 0x0367, 0x0338, 0xfd91, 0xfdf1, 0xeadd, 0xfab2,
      0xfc3b, 0xfdec, 0xf477, 0xf285, 0xee04, 0x046d, 0x0662, 0x0a8c, 0xfd2d,
      0xfad0, 0xfeb4, 0x078d, 0x024c},
     {0xeed8, 0xee64, 0x050d, 0xfdc6, 0xfd93, 0x0233, 0xfcc5, 0xf0a9, 0xefcd,
      0xfdb1, 0xf9f0, 0x0878, 0x008c, 0x079f, 0x0707, 0x02b8, 0xff10, 0x08d6,
      0x05e4, 0xfceb, 0x07bb, 0x005e, 0x11f5, 0x0d9e, 0xf894, 0x004f, 0x0118,
      0x072f, 0x03af, 0x1176, 0x07a1, 0x0dba, 0x0446, 0xed65, 0x01de, 0x0d4f,
      0xfd6d, 0xfc00, 0x0518, 0x0728, 0x006d, 0xf132, 0xfd26, 0xf3c0, 0xf773,
      0xf272, 0x04ab, 0xfcbb, 0xfd84},
     {0xea2f, 0xebbf, 0x075b, 0x0067, 0x0e3f, 0x08e6, 0x0f86, 0xf3ef, 0xf4fd,
      0x098e, 0x0a17, 0x0cd4, 0x1463, 0x0908, 0xe75e, 0xf4c5, 0x04c7, 0x0b23,
      0x0165, 0xf654, 0xfca5, 0xee89, 0xfa17, 0xf7fe, 0xfe5f, 0xf35b, 0xf009,
      0x013b, 0xf64e, 0xf5a8, 0xf99b, 0xfc6b, 0x0130, 0x0b61, 0x0498, 0x0d44,
      0x00c8, 0xf643, 0x0538, 0x0ea8, 0x0812, 0x0e57, 0x0f8d, 0x17ce, 0x1957,
      0x02b9, 0x038f, 0x0c81, 0xfb14},
     {0x0074, 0xfd68, 0xf614, 0xe78b, 0x0060, 0x03e1, 0x0552, 0x1987, 0x0ade,
      0x120d, 0x0056, 0xfbdc, 0xf556, 0xfad9, 0x0481, 0x11fd, 0xefc7, 0xf0c6,
      0xff81, 0x0b03, 0xf9b8, 0x030f, 0x06c5, 0xf92a, 0xfd5a, 0x109d, 0x11f1,
      0xf513, 0xf265, 0xe77c, 0xfadf, 0x0796, 0xf50a, 0xffce, 0xfcc7, 0xeecf,
      0xf812, 0xfb82, 0xef3e, 0x0288, 0xeb19, 0xf30e, 0xf588, 0x01c8, 0xf3be,
      0x01fc, 0xf056, 0x07cd, 0xf2a7},
     {0xfcc7, 0xfc53, 0x0f32, 0xf87c, 0xefb8, 0xfbb2, 0xfad8, 0x0662, 0xfb35,
      0x0c4a, 0x0807, 0xf9b3, 0xee7d, 0xe5a7, 0xf2ea, 0x0838, 0x0b9d, 0x046d,
      0xf829, 0xf847, 0xf55a, 0x02a3, 0xfeb7, 0xf78a, 0xfada, 0xfbba, 0xfdcf,
      0xf9db, 0xf8bd, 0xfcee, 0xf3ca, 0x0a1a, 0x0677, 0x0875, 0x0fef, 0x04f9,
      0x0f4d, 0x090d, 0x020b, 0xfa21, 0x0422, 0x08be, 0x061a, 0x16a0, 0x0a8c,
      0x1203, 0x0f96, 0x0c7f, 0x0b5d},
     {0x0eea, 0xf8ec, 0xfcdb, 0xf573, 0xe81d, 0xf32a, 0xe2f9, 0x0b26, 0xfcc8,
      0x082e, 0xf6cc, 0xf7c2, 0xed75, 0xe2df, 0x0c2e, 0x15c5, 0xf7c0, 0x0045,
      0xfbfb, 0xf921, 0x0cdf, 0x15f6, 0xff1c, 0xf7cf, 0xfa64, 0x05c4, 0xfe16,
      0x0303, 0xf6a1, 0x08b8, 0xf99f, 0xfe06, 0xf8b2, 0x063b, 0x13cd, 0xf8e1,
      0xfdf1, 0x03b2, 0x093e, 0x0221, 0x06d9, 0xfb5d, 0xf48e, 0x08f1, 0x0139,
      0xed88, 0x002b, 0xfcc2, 0xe90c},
     {0x0621, 0xfe7e, 0x08f2, 0x09fc, 0x11fb, 0x025c, 0x1143, 0x094f, 0xf9f8,
      0x13ed, 0x0485, 0x1147, 0x0453, 0x0b95, 0x00f9, 0xf55d, 0x0014, 0xf5e3,
      0xf79c, 0x0e14, 0x0eb9, 0xf8dc, 0xfdf5, 0xea67, 0xefc9, 0x0701, 0x06d4,
      0x0317, 0x04bc, 0xfec3, 0x090e, 0xfde6, 0x049d, 0xfb53, 0xf888, 0xec7d,
      0xfe11, 0xf5b2, 0x00b7, 0xf2fa, 0xe7b3, 0xfa99, 0xf9f6, 0xf403, 0xfd1f,
      0xf87b, 0xebe8, 0xf342, 0xeec6},
     {0x0455, 0xffc7, 0x0c71, 0xe826, 0x025e, 0x05e1, 0xff9c, 0xf22b, 0xfc8b,
      0xfaf8, 0xfb5d, 0x042a, 0x023b, 0x0ae8, 0xfe37, 0xfad4, 0x036d, 0x0d63,
      0xfe70, 0xf7b1, 0x05d4, 0xef87, 0x15d4, 0x1004, 0xffb8, 0xfca7, 0x08bc,
      0xe556, 0xf128, 0xff0b, 0x0be4, 0xfc8a, 0xfade, 0xf20d, 0xf4ef, 0xf32f,
      0x0bc4, 0xf7fe, 0x0389, 0x0667, 0x0d11, 0xf787, 0xf1d1, 0xedfb, 0x0c52,
      0x0086, 0x1295, 0x049b, 0x10d8},
     {0x0ebf, 0xfc49, 0x0645, 0x08cb, 0x05bd, 0xf736, 0x011e, 0xf64c, 0xfbdf,
      0xe942, 0xfbfc, 0x06ce, 0x0256, 0x0ab5, 0xfde4, 0xf4f7, 0xeeb0, 0x0c52,
      0x08f2, 0x0b3e, 0x0cbd, 0x0660, 0xf2f4, 0xeff0, 0xff0b, 0x032a, 0x049b,
      0xfc5a, 0xe599, 0xf1c3, 0xf676, 0x0558, 0x1371, 0xf382, 0xecee, 0xfe40,
      0xee77, 0xf4ae, 0x0f76, 0xf406, 0xef9f, 0x059e, 0xf641, 0x12a9, 0x0a2c,
      0xfd3e, 0xf226, 0xfb52, 0xf45b}},

    {{0xfccd, 0x031d, 0xfe2f, 0x03e4, 0xfa8e, 0x032e, 0x00d1, 0x07a8, 0x07b5,
      0x011e, 0xf3a3, 0xf056, 0xf5f7, 0xfbda, 0x094c, 0x0944, 0xf14a, 0x00e5,
      0xfb57, 0xfd50, 0x1995, 0x0f46, 0x0812, 0xfd7b, 0xf4ef, 0xf885, 0x09e7,
      0x1227, 0x045e, 0x104a, 0x0455, 0xffc1, 0x0a1c, 0xf42f, 0x1450, 0x0909,
      0x0dd6, 0x089e, 0x15ec, 0x0f1a, 0x031d, 0x0952, 0xf482, 0x09f7, 0xedf2,
      0xf001, 0xdd1d, 0xe15d, 0xec6f},
     {0xe82d, 0x0aa2, 0xff5d, 0x155b, 0x0b43, 0x1bc3, 0xff1c, 0xf471, 0xf44f,
      0x1091, 0x0e7c, 0x0e2a, 0x03ff, 0xf926, 0xfba7, 0xf704, 0xfb6c, 0x028f,
      0xfa9d, 0x07b4, 0x0269, 0xf3d2, 0x00e2, 0xf370, 0x0f32, 0x0dde, 0x0feb,
      0x08cf, 0x06d4, 0x0bc1, 0xf70a, 0x0569, 0x1d65, 0x1682, 0x036c, 0x036a,
      0xfb04, 0xfdbb, 0x1527, 0xf93b, 0xfcdc, 0xf621, 0xfdab, 0x0404, 0xf71d,
      0x0661, 0xffd1, 0xf997, 0xf033},
     {0xfa8e, 0xf8ed, 0xfe8b, 0xfa4c, 0xf5b4, 0xf63d, 0x0e4c, 0xea9a, 0x020c,
      0xf713, 0xfe56, 0x0162, 0x0eb6, 0x0c61, 0xf9d6, 0xf92a, 0xf1af, 0xfc02,
      0x0a80, 0x0260, 0x145c, 0x1694, 0x0411, 0xf5fa, 0xf133, 0x0e3c, 0x04d2,
      0x0fa7, 0x0ac9, 0x061d, 0xf93e, 0x0d27, 0xf74a, 0x096f, 0x076f, 0x0e03,
      0x0f43, 0x0b5c, 0x049f, 0x02c9, 0xf8d9, 0xfc9e, 0xf54e, 0x037e, 0xfa64,
      0x05a6, 0xe714, 0xd7e2, 0xbac1},
     {0xe04b, 0xf5d4, 0x046d, 0xf41e, 0x011b, 0x0481, 0x0d40, 0xeb81, 0x01a2,
      0x0b48, 0x0962, 0xfb42, 0x04a4, 0x0066, 0xf8f5, 0xf378, 0x0427, 0x0c17,
      0x0064, 0xf622, 0xf8c5, 0x0002, 0xed3e, 0x0b6b, 0x021b, 0xf7bc, 0x03c0,
      0xfe93, 0xfa0a, 0xf7e3, 0xf5d1, 0xfbde, 0xf579, 0xf6f8, 0xfd61, 0xfd2f,
      0xf82b, 0xfc95, 0xf7b3, 0xf550, 0xf93d, 0x0ea0, 0xfa3c, 0xf929, 0xfae2,
      0xfa0b, 0x0226, 0xfeb8, 0x069e},
     {0xf409, 0x08bd, 0x0716, 0x05d6, 0x12dc, 0x1c43, 0x029d, 0x154e, 0x000d,
      0x05d3, 0xf85b, 0x0f30, 0x06af, 0x1ce9, 0x0354, 0x0153, 0x025a, 0xf345,
      0x06f0, 0x1084, 0x02ae, 0xffa2, 0xfa6c, 0x004e, 0xfe73, 0x07c0, 0x01fe,
      0x0236, 0xf785, 0x0523, 0xf00c, 0xeca0, 0xfa49, 0x0485, 0x051b, 0xebbb,
      0x0559, 0xf25e, 0x06d2, 0x0186, 0xf992, 0xf825, 0xf889, 0x0dc4, 0x0094,
      0xfbfc, 0xffe0, 0x02b6, 0xfafd},
     {0x048f, 0x0bf8, 0x0335, 0x165b, 0xfbfc, 0xe704, 0xf778, 0x01c0, 0xf932,
      0x100f, 0x0b19, 0xf530, 0xd030, 0xe0d1, 0xf4a0, 0x065f, 0x02ff, 0x074b,
      0xeeda, 0xee9c, 0xe57e, 0x0038, 0xfb24, 0xfee9, 0xffe2, 0xfcbf, 0xf270,
      0xf145, 0xff0a, 0xf328, 0xffdc, 0xf4b4, 0x0a20, 0xf98b, 0x097c, 0xf5dc,
      0xfb7e, 0xfff5, 0x0010, 0xffe2, 0x0c65, 0x104a, 0xfaaa, 0xf82e, 0xfe28,
      0xe947, 0xfd91, 0xfa38, 0x0efc},
     {0x0c7b, 0x0965, 0x036f, 0x1639, 0x0c95, 0x0c39, 0xfd4b, 0x08b6, 0x0c89,
      0xfa08, 0xfb24, 0x0867, 0xf1e9, 0xefa4, 0x0437, 0x04c0, 0x0d1f, 0x0518,
      0xf68f, 0xfd03, 0xea89, 0x0d17, 0xfbb6, 0x16d6, 0x0537, 0xf904, 0xf6ea,
      0x013c, 0xfa8d, 0x10fe, 0x0727, 0x0cf4, 0x0934, 0xf3b9, 0x05ac, 0xfc80,
      0x0e82, 0x0008, 0x1cc5, 0x04bc, 0xfcd1, 0x01eb, 0xf302, 0xff46, 0xe97f,
      0xdc45, 0xd9b4, 0xdd6a, 0xf161},
     {0xe663, 0xf42f, 0xf769, 0xf8a4, 0xf988, 0xff0f, 0x0467, 0xeb46, 0x00f3,
      0xf24d, 0xe7dd, 0xf4ff, 0xfe53, 0x012c, 0x065f, 0xf3f3, 0x0fd4, 0x04b8,
      0x0406, 0x08f9, 0xfaaa, 0xfe6a, 0xf6de, 0x0e65, 0x0ea5, 0x019a, 0x0c39,
      0xfb9e, 0xf9c9, 0xf019, 0xf8cd, 0x073e, 0x0951, 0x0811, 0xfe47, 0x0519,
      0xf686, 0xec52, 0x0030, 0xfb49, 0x0d4e, 0xe2f6, 0x1708, 0x0708, 0x0b9c,
      0x1c64, 0x1e2f, 0x0eba, 0x0e63},
     {0x0a5d, 0x00ff, 0x06d0, 0xfc46, 0xf4e6, 0xeb4d, 0xfe00, 0x0596, 0x044a,
      0x0234, 0x06db, 0x0942, 0x056c, 0xfee8, 0xe9d2, 0x0414, 0xfa19, 0xfa66,
      0x0100, 0x0107, 0x01b1, 0x02c0, 0xf85a, 0x0127, 0x02c2, 0xefd6, 0xf2ae,
      0xf969, 0x1660, 0x07a8, 0xf965, 0x0174, 0x024a, 0xf1d7, 0xf974, 0x0b0d,
      0x0ef5, 0x1347, 0x007f, 0x092e, 0xf62f, 0xfc0f, 0xf46e, 0x0a5c, 0x0158,
      0xf058, 0xf04a, 0xf456, 0x0163},
     {0x14de, 0xfab7, 0xf82c, 0xf658, 0xee08, 0xedff, 0xf38d, 0x09af, 0xf963,
      0x0c25, 0x03e7, 0x0acf, 0xf611, 0xff4d, 0x08f8, 0x018d, 0x0372, 0xf37e,
      0x0769, 0x1000, 0x0598, 0x0575, 0xf9b0, 0x11c1, 0xfa8e, 0xe9f8, 0x0413,
      0x0d13, 0xf01e, 0xff7e, 0xf59e, 0xf011, 0xfc51, 0x10dd, 0x12d6, 0xea97,
      0xf327, 0xf896, 0xeb00, 0xf720, 0xfd3a, 0x0807, 0x0f99, 0xffe3, 0xfee3,
      0x104a, 0x087f, 0x0c69, 0x19c8}}};

const short fc_bias[10] = {0xFFCD, 0xFFCE, 0x002E, 0x0027, 0xFFA5,
                           0xFF80, 0xFFC8, 0x0040, 0xFFEF, 0xFFD9};

#pragma GCC diagnostic warning "-Wnarrowing"

#endif