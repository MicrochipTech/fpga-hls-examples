#ifndef INTERRUPT_GENERATOR_H
#define INTERRUPT_GENERATOR_H

#include <hls/ap_int.hpp>

// Target interrupt period is now 20 cycles (instead of 1 second)
#define INTERRUPT_PERIOD_CYCLES 19  // 0-19 = 20 cycles

// Function declaration for the interrupt generator
void interrupt_generator(hls::ap_uint<1> &interrupt_out);

#endif // INTERRUPT_GENERATOR_H 
