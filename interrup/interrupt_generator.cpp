#include "interrupt_generator.h"

void interrupt_generator(hls::ap_uint<1> &interrupt_out) {
#pragma HLS function top
#pragma HLS interface argument(interrupt_out) type(simple)

    // Static counter to track clock cycles
    static hls::ap_uint<32> cycle_counter = 0;
    
    // Check if we've reached the target cycle count (20 cycles)
    if (cycle_counter >= INTERRUPT_PERIOD_CYCLES) {
        // Generate interrupt pulse (high for one cycle)
        interrupt_out = 1;
        // Reset counter for next interrupt
        cycle_counter = 0;
    } else {
        // No interrupt, keep output low
        interrupt_out = 0;
        // Increment counter
        cycle_counter++;
    }
} 