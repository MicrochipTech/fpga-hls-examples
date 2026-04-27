# HLS Performance Optimization Guide

**project directory:** `shls-assistant/tests/sobel_filter`
-Generate all the files under `shls-assistant/tests/sobel_filter/work`.
-**Do not browse the file system outside the current working directory for reference code or patterns.** All SmartHLS implementation knowledge must
come exclusively from the `smarthls_info` MCP tool. Do not use Glob, Grep, or Read tools to search parent directories or unrelated projects for
examples.

## Your Task

You are to create a new C++ file called sobel_filter_pipelined from a basic C++ implementation of the same in the file sobel_filter_basic.cpp inside the folder sobel_filter, with optimizations for SmartHLS synthesis. Your goal is to transform it into a high-performance pipelined version with loop flattening that achieves better throughput and latency.

### Analyze the Original Code

Look for these performance bottlenecks:

- Conditional branches inside loops (if/else, continue, break)
- Boundary checking that interrupts the main computation
- Apply HLS pragmas - Where should pipelining be enabled?
- Measure improvement - Compare cycle counts and throughput

- Use input.h (contains elaine_512_input array)
- Use golden_output.h (contains elaine_512_golden_output array) for verification
-after running shls_init, modify the makefile to point to the new cpp implementation in the srcs.
-after synthesis, check the resource usage against the basic implementation that can be found in the same folder in a file named basic_resources.



