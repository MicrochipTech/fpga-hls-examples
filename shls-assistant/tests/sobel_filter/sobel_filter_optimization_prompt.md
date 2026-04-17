# HLS Performance Optimization Guide

**project name:**sobel_filter_pipelined

## Your Task

You are to create a new C++ file called sobel_filter_pipelined from a basic C++ implementation of the same in the file sobel_filter_basic.cpp inside the folder sobel_filter, with optimizations for SmartHLS synthesis. Your goal is to transform it into a high-performance pipelined version with loop flattening that achieves better throughput and latency.

### Analyze the Original Code

Look for these performance bottlenecks:

- Conditional branches inside loops (if/else, continue, break)
- Boundary checking that interrupts the main computation
- Apply HLS pragmas - Where should pipelining be enabled?
- Measure improvement - Compare cycle counts and throughput

-create the new cpp implementation within the same sobel_filter folder.

- Use input.h (contains elaine_512_input array)
- Use golden_output.h (contains elaine_512_golden_output array) for verification
-after running shls_init, modify the makefile to point to the new cpp implementation in the srcs.
-after synthesis, check the resource usage against the basic implementation that can be found in the same folder in a file named basic_resources.



