#include <iostream>
#include <csignal>
#include <hls/streaming.hpp>
#include <hls/hls_alloc.h>

// FIFO depths:
#define FIFO1_DEPTH 256
#define FIFO2_DEPTH 256
#define FIFO3_DEPTH 256
#define FIFO4_DEPTH 256

//------------------------------------------------------------------------------
// Write data to `fifo` at a rate of 1 element per clock-cycle.
// Arguments: 
//  go: controls the loop execution (1 = run, 0 = stop)
//  fifo: a reference to an hls::FIFO of int type where elements are written.
void producer(volatile unsigned char& go, hls::FIFO<int>& fifo) {
    short int counter = 0b0;
    #pragma HLS loop pipeline
    while (go) {
        // We write twice to the FIFO to overlap the loading of the "go" variable.
        // Even though the II=2 for this function we effectively write one word
        // every cycle, as if we had II=1
        fifo.write(0xFEED0000 | counter++);
        fifo.write(0xFEED0000 | counter++);
    }
    // Special flag that indicates the end of the program. This flag will propagate
    // through the pipeline.
    fifo.write(0x0FF); 
}

//------------------------------------------------------------------------------
// Wait for the first element to appear in `inputFifo`, then wait for `delay` 
// clock-cycles before start forwarding elements from `inputFifo` to `outputFifo`
// at a rate of 1 element per clock-cycle.
void fifoToFifo(hls::FIFO<int>& inputFifo, hls::FIFO<int>& outputFifo, unsigned long long int delay) {
    #pragma HLS function replicate

    // Wait until the first element appears in `inputFifo`.
    #pragma HLS loop pipeline
    while(inputFifo.empty());

    // Induce a delay of `delay` clock-cycles. 
    #pragma HLS loop pipeline
    for (unsigned long long int i { 0 }; i < delay; i++) {
        // `printf` is a nice way to avoid the loop being optimized away, however,
        // it only executes in software, in hardware it is ignored.
        printf("Stall...\n");  
    }

    // Forward dat from `inputFifo` to `outputFifo` until the end-of-program flag is reached.
    int inputElement;
    #pragma HLS loop pipeline
    while ((inputElement = inputFifo.read()) != 0x0FF) {
        outputFifo.write(inputElement);
    }
    outputFifo.write(0x0FF);
}

//------------------------------------------------------------------------------
// Wait for the first element to appear in `fifo`, then wait for `delay` clock-cycles
// before start reading the fifo and drop the contents.
void consumer(hls::FIFO<int>& fifo, unsigned long long int delay) {
    // Wait until the first element appears in `inputFifo`.
    #pragma HLS loop pipeline
    while(fifo.empty());

    // Induce a delay of `delay` clock-cycles.
    #pragma HLS loop pipeline
    for (unsigned long long int i { 0 }; i < delay; i++) {
        // `printf` is a nice way to avoid the loop being optimized away, however,
        // it only executes in software, in hardware it is ignored.
        printf("Stall...\n");
    }

    #pragma HLS loop pipeline
    while(fifo.read() != 0x0FF); // Until the end-of-program flag is reached
}
 

//------------------------------------------------------------------------------
// Design pipeline - top-level HLS module
void hlsModule(volatile unsigned char& go,
              unsigned long long int delay1,
              unsigned long long int delay2,
              unsigned long long int delay3,
              unsigned long long int delay4) {
    #pragma HLS function dataflow top
    #pragma HLS interface default type(axi_target)

    hls::FIFO<int> fifo1(FIFO1_DEPTH);
    hls::FIFO<int> fifo2(FIFO2_DEPTH);
    hls::FIFO<int> fifo3(FIFO3_DEPTH);
    hls::FIFO<int> fifo4(FIFO4_DEPTH);
 
    producer(go, fifo1);
    fifoToFifo(fifo1, fifo2, delay1);
    fifoToFifo(fifo2, fifo3, delay2);
    fifoToFifo(fifo3, fifo4, delay3);
    consumer(fifo4, delay4);
}


//------------------------------------------------------------------------------
// When compiling for RISC-V CPU (i.e. not generating hardware)
#ifndef __SYNTHESIS__
#include "hls_output/accelerator_drivers/auto-instrument_accelerator_driver.h"

// The virtual base address for the HLS module in the RISC-V memory.
// This is initialized by the hlsModule_setup() function
void* virtualAddress;

// Signal handler for SIGINT. Writes 0 to the `go` argument, which effectively 
// "stops" the HLS module.
void reset(int signal) {
    printf("\nCaught SIGINT (Ctrl + C). Stopping the HLS module.\n");
    unsigned char go = 0;
    hlsModule_memcpy_write_go(&go, 1, virtualAddress);
}
 
int main(int argc, char** argv) {
    if (argc != 5) {
        printf("usage: %s delay1 delay2 delay3 delay4\n", argv[0]);
        exit(-1);
    }

    // The following code uses driver functions to perform the following
    // * Set up the virtual address for the on-chip memory
    * Write 1 to `go` and all delay values (this will launch the accelerator)
    */
    virtualAddress = hlsModule_setup();
    if (virtualAddress == NULL) {
        printf("%s: Error: Could not set up virtual address.\n", argv[0]);
        exit(-1);
    }
    unsigned char go { 1 };
    signal(SIGINT, reset);
    printf("Starting the pipeline. Send SIGINT (Ctrl + C) anytime to stop the hardware accelerator.\n");
    hlsModule_write_input_and_start(&go, atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4]), virtualAddress);
    hlsModule_join_and_read_output(virtualAddress);
    hlsModule_teardown();
}
#endif // __SYNTHESIS__