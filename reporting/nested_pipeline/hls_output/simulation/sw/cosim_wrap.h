#ifndef LEGUP_WRAP_H
#define LEGUP_WRAP_H

#if 0
#ifndef USE_AP
#define USE_AP
#endif
#endif

#define row_cumulative_sum_COSIM_WRAPPER()                                     \
  static int num_calls = 0;                                                    \
  if (hls::verify()) {                                                         \
    hls::Scanner<32> grid_io0("row_cumulative_sum_grid.out.hw.dat", num_calls, \
                              1);                                              \
    for (int i00 = 0; i00 <= 199; i00 += 1)                                    \
      for (int i01 = 0; i01 <= 199; i01 += 1) {                                \
        grid_io0.scan<32>(grid[i00][i01]);                                     \
      }                                                                        \
    grid_io0.close();                                                          \
    if (1)                                                                     \
      hls::logVerify("row_cumulative_sum", num_calls);                         \
  } else {                                                                     \
    if (1)                                                                     \
      hls::logCollect("row_cumulative_sum", num_calls);                        \
    hls::Printer<32> grid_io("row_cumulative_sum_grid.in.sw.dat", num_calls,   \
                             1);                                               \
    for (int i0 = 0; i0 <= 199; i0 += 1)                                       \
      for (int i1 = 0; i1 <= 199; i1 += 1) {                                   \
        grid_io.print<32>(grid[i0][i1]);                                       \
      }                                                                        \
    grid_io.close();                                                           \
    row_cumulative_sum_original();                                             \
  }                                                                            \
  hls::updateCalls("row_cumulative_sum", num_calls);

#include "hls/cosim.hpp"
#endif
