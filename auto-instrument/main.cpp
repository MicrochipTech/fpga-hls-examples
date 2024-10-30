#include <iostream>
#include <csignal>
#include <hls/streaming.hpp>
#include <hls/hls_alloc.h>


// The maximum number of elements `fifo1` can hold.
#define FIFO1_DEPTH 256
// The maximum number of elements `fifo2` can hold.
#define FIFO2_DEPTH 256
// The maximum number of elements `fifo3` can hold.
#define FIFO3_DEPTH 256
// The maximum number of elements `fifo4` can hold.
#define FIFO4_DEPTH 256

/*
Write elements to `fifo` at a rate of 1 element per clock-cycle. 
@param go A volatile unsigned char reference that controls the loop execution.
@param fifo A reference to an hls::FIFO of int type where elements are written.
*/
void producer(volatile unsigned char& go, hls::FIFO<int>& fifo) {
    #pragma HLS loop pipeline
    short int counter { 0b0 };
    while (go) {
        /*
        Suppose we only write one time to the FIFO. Then, we get the following schedule:
        * Clock-cycle 1: Load the value of `go`
        * Clock-cycle 2: Goto loop beginning if `go` is 1
        * Clock-cycle 3: Write to `fifo`
        * Clock-cycle 3: Load the value of `go`
        * Clock-cycle 4: Goto loop beginning if `go` is 1
        
        Notice that this schedule will only write to the FIFO once every *two* clock-cycles. But then `fifo` will eventually become empty, since the `fifoToFifo` function reads one element per clock-cycle from it. But, if we write to the FIFO twice, we'll get the following schedule:
        * Clock-cycle 1: Load the value of `go`
        * Clock-cycle 2: Goto loop beginning if `go` is 1
        * Clock-cycle 3: Write to `fifo`
        * Clock-cycle 3: Load the value of `go`
        * Clock-cycle 4: Write to `fifo`
        * Clock-cycle 4: Goto loop beginning if `go` is 1
        
        Thus, we're effectively writing one element to `fifo` per clock cycle, as desired.
        */
        fifo.write(0xFEED0000 | counter++);
        fifo.write(0xFEED0000 | counter++);
    }
    fifo.write(0x0FF);
}

/*
Wait for the first element to appear in `inputFifo`, then begin a delay of (in theory) `delay` clock-cycles. After the delay expires, transfer elements from `inputFifo` to `outputFifo` at a rate of 1 element per clock-cycle.
@param inputFifo A reference to an hls::FIFO of int type from which elements are read.
@param outputFifo A reference to an hls::FIFO of int type to which elements are written.
@param delay An unsigned long long int specifying the delay in clock-cycles. 
*/
void fifoToFifo(hls::FIFO<int>& inputFifo, hls::FIFO<int>& outputFifo, unsigned long long int delay) {
    #pragma HLS function replicate

    // Wait until the first element appears in `inputFifo`.
    #pragma HLS loop pipeline
    while(inputFifo.empty());

    // Induce a delay of (in theory) `delay` clock-cycles. 
    #pragma HLS loop pipeline
    for (unsigned long long int i { 0 }; i < delay; i++) {
        printf("Stall...\n");  // `printf` is a nice way to avoid the loop being optimized away.
    }

    // Transfer elements from `inputFifo` to `outputFifo` at a rate of 1 element per clock-cycle. 
    #pragma HLS loop pipeline
    int inputElement;
    while ((inputElement = inputFifo.read()) != 0x0FF) {
        outputFifo.write(inputElement);
    }
    outputFifo.write(0x0FF);
}

/*
Wait for the first element to appear in `fifo`, then begin a delay of (in theory) `delay` clock-cycles. After the delay expires, consume elements from `fifo` at a rate of 1 element per clock-cycle.
@param fifo A reference to an hls::FIFO of int type from which elements are read.
@param delay An unsigned long long int specifying the delay in clock-cycles. 
*/
void consumer(hls::FIFO<int>& fifo, unsigned long long int delay) {
    // Wait until the first element appears in `inputFifo`.
    #pragma HLS loop pipeline
    while(fifo.empty());

    // Induce a delay of (in theory) `delay` clock-cycles.
    #pragma HLS loop pipeline
    for (unsigned long long int i { 0 }; i < delay; i++) {
        printf("Stall...\n");  // `printf` is a nice way to avoid the loop being optimized away.
    }

    // Consume elements from `fifo` at a rate of 1 element per clock-cycle.
    #pragma HLS loop pipeline
    while(fifo.read() != 0x0FF);
}
 

/*
Produce the "waterflow" design as specified in the README.
@param go A volatile unsigned char reference that controls the loop execution.
@param delay1 An unsigned long long int specifying the delay for the first fifoToFifo function.
@param delay2 An unsigned long long int specifying the delay for the second fifoToFifo function.
@param delay3 An unsigned long long int specifying the delay for the third fifoToFifo function.
@param delay4 An unsigned long long int specifying the delay for the consumer function.
*/
void hlsModule(volatile unsigned char& go,
              unsigned long long int delay1,
              unsigned long long int delay2,
              unsigned long long int delay3,
              unsigned long long int delay4) {
    #pragma HLS function dataflow top
    #pragma HLS interface default type(axi_target)

    // FIFO declarations
    hls::FIFO<int> fifo1(FIFO1_DEPTH);
    hls::FIFO<int> fifo2(FIFO2_DEPTH);
    hls::FIFO<int> fifo3(FIFO3_DEPTH);
    hls::FIFO<int> fifo4(FIFO4_DEPTH);
 
    // The following functions will be run in a dataflow fashion.
    producer(go, fifo1);
    fifoToFifo(fifo1, fifo2, delay1);
    fifoToFifo(fifo2, fifo3, delay2);
    fifoToFifo(fifo3, fifo4, delay3);
    consumer(fifo4, delay4);
}


// The following code is inserted by the preprocessor if we are cross-compiling (generating the `.elf` executable)
#ifndef __SYNTHESIS__
#include "hls_output/accelerator_drivers/auto-instrument_accelerator_driver.h"


/* 
The virtual address for the accelerator on-chip memory.
Under the "AXI4 Target Interface Address Map" of "hls_output/reports/summary.hls.dataflow.rpt", you can add the "Address Offset" of a memory to this virtual address to get the actual address of that memory. 
We use this address to modify the `go` AXI4 Target memory when the user sends SIGINT (Ctrl + C) to the executable. 
*/
void* virtualAddress;

/*
Signal handler for SIGINT. Writes 0 to the `go` memory, which effectively "resets" the accelerator.
@param signal An integer representing the signal number.
*/
void reset(int signal) {
    printf("\nCaught SIGINT (Ctrl + C). Stopping the hardware accelerator. This executable will exit on its own.\n");
    unsigned char go { 0 };
    hlsModule_memcpy_write_go(&go, 1, virtualAddress);
}
 
int main(int argc, char** argv) {
    if (argc != 5) {
        printf("usage: %s delay1 delay2 delay3 delay4\n", argv[0]);
        exit(-1);
    }

    /*
    The following code uses driver functions to perform the following
    * Set up the virtual address for the on-chip memory
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
#endif