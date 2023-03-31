#ifndef LEGUP_WRAP_H
#define LEGUP_WRAP_H

#if 0
#ifndef USE_AP
#define USE_AP
#endif
#endif

#define top_function_COSIM_WRAPPER()                                           \
  static int num_calls = 0;                                                    \
  decltype(top_function_original()) return_val;                                \
  if (hls::verify()) {                                                         \
    int return_val_transfers;                                                  \
    static hls::Scanner<32> return_val_io0(                                    \
        "top_function_return_val.out.hw.dat", num_calls, 0);                   \
    return_val_io0.scanTransfers(return_val_transfers);                        \
    { return_val_io0.scan<32>(return_val); }                                   \
    if (1)                                                                     \
      hls::logVerify("top_function", num_calls);                               \
  } else {                                                                     \
    if (1)                                                                     \
      hls::logCollect("top_function", num_calls);                              \
    static hls::Printer<32> n_io("top_function_n.in.sw.dat", num_calls, 0);    \
    n_io.printTransfers(1);                                                    \
    { n_io.print<32>(n); }                                                     \
    return_val = top_function_original();                                      \
    static hls::Printer<32> return_val_io(                                     \
        "top_function_return_val.out.sw.dat", num_calls, 0);                   \
    return_val_io.printTransfers(1);                                           \
    { return_val_io.print<32>(return_val); }                                   \
  }                                                                            \
  hls::updateCalls("top_function", num_calls);                                 \
  return return_val;

#include "hls/cosim.hpp"
#endif
