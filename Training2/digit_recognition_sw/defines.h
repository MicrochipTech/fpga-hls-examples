#ifndef __DEFINES_H__
#define __DEFINES_H__

#include <hls/ap_int.hpp>

// Data type used throughout the CNN.
using DType = hls::ap_int<16>;

// Tensor type representing the inputs and outputs of layers.
template <unsigned SIZE, unsigned DEPTH>
using Tensor = DType [SIZE][SIZE][DEPTH];

#endif
