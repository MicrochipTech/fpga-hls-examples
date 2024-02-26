/*
 * vector_add_soc.cpp
 *
 *  Created on: May 3, 2022
 *      Author: Siu Pak Mok
 */

#include <stdio.h>

#include <hls/hls_alloc.h>

#define SIZE 16

// Choose which interface to compile
// Possible Values: AXI_TARGET_MEMCPY, AXI_TARGET_DMA, AXI_INITIATOR
#define AXI_TARGET_MEMCPY 0
#define AXI_TARGET_DMA 1
#define AXI_INITIATOR 2

#ifndef INTERFACE
#define INTERFACE AXI_TARGET_MEMCPY
#endif

// The core logic of this example
void vector_add_sw(int *a, int *b, int *result) {
    for (int i = 0; i < SIZE; i++) {
        result[i] = a[i] + b[i];
    }
}

// AXI4 Target Interface for Pointer Argument
// -----------------------------------------------------------------------------
//
// **Syntax**
//
/*    #pragma HLS interface argument(<arg_name>) type(axi_target) \
//                          num_elements(<int>) dma(true|false)   \
//                          requires_copy_in(true|false)
*/
// **Description**
//
// This pragma specifies the AXI4 target interface type for a pointer
// (including array, struct, class types) argument.
//
// When the AXI4 target interface is used, the "memories" for storing the data
// is inside the SmartHLS-generated RTL module rather than outside. The logic
// outside of SmartHLS module is responsible for initializing and/or retrieving
// the memory content before and/or after the execution of SmartHLS module.
//
// When dma is true, the Microprocessor Subsystem (MSS) would use DMA transfer
// function to move the data to the accelerator. This option will not change the
// generated RTL. It will only change the behaviour of the generated software.
//
// **Parameters**
//
// Name              Optional    Description
// -----------------------------------------------------------------------------
// argument             N        Argument name
// type                 N        Interface type
// num_elements         Y        Specifies the number of elements of the
// argument array.
//                               Can override the array size in the argument.
// dma                  Y        Specifies the transfer method (Default: false)
// requries_copy_in     Y        Always copy in the data onto the accelerator
//                               buffer
//                               Useful when the accelerator does partial update
//                               to the memory (Default: false)
// -----------------------------------------------------------------------------
#if INTERFACE == AXI_TARGET_MEMCPY
void vector_add_axi_target_memcpy(int *a, int *b, int *result) {
#pragma HLS function top
#pragma HLS interface control type(axi_target)
#pragma HLS interface argument(a) type(axi_target) num_elements(SIZE)
#pragma HLS interface argument(b) type(axi_target) num_elements(SIZE)
#pragma HLS interface argument(result) type(axi_target) num_elements(SIZE)
    vector_add_sw(a, b, result);
}
#endif

#if INTERFACE == AXI_TARGET_DMA
void vector_add_axi_target_dma(int *a, int *b, int *result) {
#pragma HLS function top
#pragma HLS interface control type(axi_target)
#pragma HLS interface argument(a) type(axi_target) dma(true) num_elements(SIZE)
#pragma HLS interface argument(b) type(axi_target) dma(true) num_elements(SIZE)
#pragma HLS interface argument(result) type(axi_target) dma(true)              \
    num_elements(SIZE)
    vector_add_sw(a, b, result);
}
#endif

// AXI4 Initiator Interface for Pointer Argument
// -----------------------------------------------------------------------------
//
// **Syntax**
//
/*   #pragma HLS interface argument(<arg_name>) type(axi_initiator) \
//                         ptr_addr_interface(<simple|axi_target>)  \
//                         num_elements(<int>)
*/
// **Description**
//
// This pragma specifies the AXI4 initiator interface type for a pointer
// (including array, struct, class types) argument.
//
// Name              Optional    Description
// -----------------------------------------------------------------------------
// argument             N        Argument name
// type                 N        Interface type
// num_elements         Y        Specifies the number of elements of the
// argument array.
//                               Can override the array size in the argument.
// ptr_addr_interface   Y        Specifies the interface type for setting the
//                               base address of the accessing memory.
//                               Default is simple, but changes to the default
//                               set by interface default if defined.
// -----------------------------------------------------------------------------
#if INTERFACE == AXI_INITIATOR
void vector_add_axi_initiator(int *a, int *b, int *result) {
// Note that both the control and ptr_addr_interface are redundant since the
// default is already axi_target
#pragma HLS function top
#pragma HLS interface default type(axi_target)
#pragma HLS interface control type(axi_target)
#pragma HLS interface argument(a) type(axi_initiator)                          \
    ptr_addr_interface(axi_target) num_elements(SIZE)
#pragma HLS interface argument(b) type(axi_initiator) num_elements(SIZE)
#pragma HLS interface argument(result) type(axi_initiator) num_elements(SIZE)
    vector_add_sw(a, b, result);
}
#endif

bool compareVectors(int *a, int *b) {
    for (int i = 0; i < SIZE; i++) {
        if (a[i] != b[i])
            return false;
    }
    return true;
}

int main() {

    // Allocating memory from DDR memory
    int *a = (int *)hls_malloc(SIZE * sizeof(int));
    int *b = (int *)hls_malloc(SIZE * sizeof(int));
    int *result_hw = (int *)hls_malloc(SIZE * sizeof(int));
    int *result_sw = (int *)hls_malloc(SIZE * sizeof(int));

    // Initialize the arrays
    for (int i = 0; i < SIZE; i++) {
        a[i] = i;
        b[i] = i + i;
        result_hw[i] = 0;
        result_sw[i] = 1;
    }

    // Call software version of vector add then hardware
    vector_add_sw(a, b, result_sw);
#if INTERFACE == AXI_TARGET_MEMCPY
    vector_add_axi_target_memcpy(a, b, result_hw);
#elif INTERFACE == AXI_TARGET_DMA
    vector_add_axi_target_dma(a, b, result_hw);
#else
    vector_add_axi_initiator(a, b, result_hw);
#endif

    // Compare the results
    bool match = compareVectors(result_sw, result_hw);

    if (match) {
        printf("RESULT: PASS\n");
    } else {
        printf("RESULT: FAIL\n");
    }

    // Free the allocated memory using hls_free
    hls_free(a);
    hls_free(b);
    hls_free(result_sw);
    hls_free(result_hw);

    // Return 0 on pass
    return match == false;
}

