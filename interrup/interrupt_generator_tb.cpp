#include "interrupt_generator.h"
#include <iostream>

int main() {
    hls::ap_uint<1> interrupt_out;
    
    std::cout << "Testing interrupt generator (20-cycle period)..." << std::endl;
    
    const int SIMULATION_CYCLES = 50;
    int interrupt_count = 0;
    int expected_cycles[2] = {19, 39};
    bool test_passed = true;
    
    std::cout << "Cycle\tOutput\tStatus" << std::endl;
    std::cout << "-----\t------\t------" << std::endl;
    
    for (int cycle = 0; cycle < SIMULATION_CYCLES; cycle++) {
        interrupt_generator(interrupt_out);
        
        std::cout << cycle << "\t" << (int)interrupt_out;
        
        if (interrupt_out == 1) {
            interrupt_count++;
            std::cout << "\t<-- Interrupt " << interrupt_count;
            
            if (interrupt_count <= 2) {
                if (cycle == expected_cycles[interrupt_count - 1]) {
                    std::cout << " OK";
                } else {
                    std::cout << " FAIL (expected cycle " << expected_cycles[interrupt_count - 1] << ")";
                    test_passed = false;
                }
            }
        }
        std::cout << std::endl;
        
        if (interrupt_count >= 2 && cycle > expected_cycles[1] + 5) {
            break;
        }
    }
    
    std::cout << "\nTotal interrupts: " << interrupt_count << std::endl;
    
    if (interrupt_count == 2 && test_passed) {
        std::cout << "SUCCESS: Test passed!" << std::endl;
        return 0;
    } else {
        std::cout << "FAILURE: Test failed!" << std::endl;
        return 1;
    }
} 