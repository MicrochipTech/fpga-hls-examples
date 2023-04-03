#ifndef LEGUP_WRAP_H
#define LEGUP_WRAP_H

#if 0
#ifndef USE_AP
#define USE_AP
#endif
#endif

#define sobel_filter_COSIM_WRAPPER()                                           \
  static int num_calls = 0;                                                    \
  if (hls::verify()) {                                                         \
    hls::Scanner<8> out_var_io0("sobel_filter_out_var.out.hw.dat", num_calls,  \
                                1);                                            \
    for (int i20 = 0; i20 <= 511; i20 += 1)                                    \
      for (int i21 = 0; i21 <= 511; i21 += 1) {                                \
        out_var_io0.scan<8>(out[i20][i21]);                                    \
      }                                                                        \
    out_var_io0.close();                                                       \
    if (1)                                                                     \
      hls::logVerify("sobel_filter", num_calls);                               \
  } else {                                                                     \
    if (1)                                                                     \
      hls::logCollect("sobel_filter", num_calls);                              \
    hls::Printer<8> in_var_io("sobel_filter_in_var.in.sw.dat", num_calls, 1);  \
    for (int i0 = 0; i0 <= 511; i0 += 1)                                       \
      for (int i1 = 0; i1 <= 511; i1 += 1) {                                   \
        in_var_io.print<8>(in[i0][i1]);                                        \
      }                                                                        \
    in_var_io.close();                                                         \
    hls::Printer<8> out_var_io("sobel_filter_out_var.in.sw.dat", num_calls,    \
                               1);                                             \
    for (int i10 = 0; i10 <= 511; i10 += 1)                                    \
      for (int i11 = 0; i11 <= 511; i11 += 1) {                                \
        out_var_io.print<8>(out[i10][i11]);                                    \
      }                                                                        \
    out_var_io.close();                                                        \
    sobel_filter_original();                                                   \
  }                                                                            \
  hls::updateCalls("sobel_filter", num_calls);

#include "hls/cosim.hpp"
#endif
