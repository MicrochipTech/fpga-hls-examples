---
name: shls_assistant

description: Contains rules and guidelines for SmartHLS coding assistant. Use the SmartHLS Coding assistant-skill for all SmartHLS projects. This skill is for creating and optimizing Microchip SmartHLS projects and for migrating code from other HLS tools. This skill can handle HLS C++ pragmas to optimize designs for area, latency and performance, configure interfaces, and reuse HLS libraries to quickly build designs as needed
---

# SmartHLS Coding Assistant Guidelines

## General Rules

- If the host computer is running Windows, use POWERSHELL commands using "pwsh -Command <command>"
- If the host computer is running Linux, use standard bash commands
- Always read and understand the rules completely and then ask any question that you want to know about. Ask questions only when relevant to the SmartHLS info tool.
- When returning code, always return full code
- If you don't know or have any doubts related to SmartHLS use the SmartHLS info tool to gather more information.
- When asked for optimizations or performance or area improvements, ASK the SmartHLS info for available pragmas or techniques to optimize for the context specific issue. For example, if user requested to improve area, ask the SmartHLS info tool for top 5 pragmas and techniques with description to improve area.
-There are two libraries for SmartHLS:
  1. Built-in libraries,
  2. External libraries from fpga-libraries GitHub repo.
  If there is a library function that you would like to use, and its implementation exits in both the libraries, then implement the one in External libraries unless specified otherwise by the user.
- Reports are generated in the project directory after running `shls -a cosim`, `shls -a rtl_synth`, or `shls -a fpga`. Check these reports for simulation results, timing, and resource utilization
- Run `shls -h` to list all available SmartHLS commands and their descriptions
-If you are Unsure about an implementation, a command, or any question regarding SmartHLS, ask the SmartHLS info tool.

## Project Creation and Workflow

### Project Setup

- When asked to Create/make a SmartHLS project and no existing directory of the project name exists, create a new directory called `<project_name>`, then create the cpp file inside this directory and follow the WORKFLOW
- If there is an existing directory of the project name, then create a new directory called `work` and in this work directory create the cpp implementation
- in the generated c++ properly include of input files
- When creating SmartHLS projects, always follow the workflow
- If there are any problems with config.tcl or Makefile, try running `"shls init"` again from the terminal.

### Typical Workflow

1. Initialize:
  `shls init` - To create the Makefile and config.tcl files after the .cpp files are created

2. Run cosimulation:
  `shls -a cosim` pipe the output to a file called `shls-cosim-output.log`.
  If you get cosim errors, ask the SmartHLS info tool regarding the error, then rerun cosim until it passes.

3. Run RTL synthesis:
  `shls -a rtl_synth` - run rtl_synth only when cosim passes. 

4. Create an md file containing a summary of what you have done within the directory

note: for any other commands, run `shls -h`

## SmartHLS Libraries

### Library Location and Includes

- Use SmartHLS libraries as far as possible and only when where it is applicable
- If necessary, include SmartHLS libraries in the Makefile from the SHLS_LIB_PATH 
environment variable. For example:

 ```makefile
 USER_CXX_FLAG+=-I$(SHLS_LIB_PATH)
 ```
- **There is no include called hls.h**

### Math Library Includes

If you want to include libraries like math, the format is as below:

```cpp
#include "math/include/hls_sin.hpp"
#include "math/include/hls_cos.hpp"
#include "math/include/hls_sqrt.hpp"
```

- Always check `fpga-hls-libraries/math/examples/` for usage patterns if you end up using math library
- Check `fpga-hls-libraries/math/include/` for available headers before assuming

### Common SmartHLS Headers

```cpp
// Arbitrary-precision integers
// ap_int<W> - signed integers of width W
// ap_uint<W> - unsigned integers of width W
// Bit manipulation, range selection, concatenation
#include <hls/ap_int.hpp>          

// Fixed-point arithmetic
// ap_fixpt<W,I_W> - signed fixed-point
// ap_ufixpt<W,I_W> - unsigned fixed-point
// Configurable quantization and overflow modes
#include <hls/ap_fixpt.hpp>        

// FIFO/streaming interfaces
// hls::FIFO<T> template class
// Blocking reads/writes, depth control
// Maps to AXI-stream interfaces
#include <hls/streaming.hpp>       

// Parallel hardware threads
// hls::thread<T> for dataflow parallelism
// hls::mutex, hls::barrier for synchronization
#include <hls/thread.hpp>          

// Memory allocation (SoC flows)
// hls_malloc, hls_free, hls_memcpy for DMA transfers
#include <hls/hls_alloc.h>        
```

### Namespaces

Always use the SmartHLS C++ namespace `hls`, for example:

```cpp
using namespace hls;           // For ap_fixpt, ap_ufixpt
using namespace hls::math;     // For sin_taylor, cos_taylor, etc.
using namespace hls::vision;   // For hls::vision library functions, etc.

hls::ap_uint<5> x; // declare a variable precision integer
```

## HLS Pragmas and Directives

### Top-Level Functions

- When using toplevel function for HLS, use them at the top inside the function, right below the function prototype/definition
- Use `#pragma HLS function top` ONLY for functions you want to expose as separate hardware modules. Do NOT use this pragma on helper functions that pass arrays between each other, as memory partitioning will cause synthesis failures
- **(Very important)** NEVER use `#pragma HLS function pipeline` on top-level functions that return structs
- When using multiple top-level functions, after cosim, if you are going to run synthesis, specify one main top-level function in config.tcl (`set_synthesis_top_module <module_name>_top`)
- Use `set_synthesis_top_module` with the `_top_top` suffix when specifying synthesis target

### Loop Pipelining

Loop pipelining functions are supposed to be placed just right before the loop starts:

```cpp

label:<UniqueLoopLabelName>
#pragma HLS loop pipeline II(1)
for (int i = 0; i < N; i++) {
    // loop body
}
```

## Memory and Arrays

- When using global arrays that will be accessed by multiple HLS hardware functions, be aware that memory partitioning may cause interface incompatibilities
- Pointer arguments cause memory aliasing issues in SmartHLS functions that gets converted to hardware generation

## Data Types and Type Conversions

### Function Signatures

Always check the actual function signatures in the library headers (make sure to check the template parameter types and the number of arguments). Examples:

- `sincos` template: `sincos<N_ITERATIONS>(angle, sin_ref, cos_ref)`
- `atan_cordic` template: `atan_cordic<W_OUT, IW_OUT, N_ITERATIONS>(fixpt_input)`
- `sqrt` template: `sqrt<W, IW, N_ITERATIONS>(ufixpt_input)`
- `atan_cordic` ONLY accepts signed fixpt, NOT ufixpt

### ap_uint Conversion Functions

For uint (`ap_uint`) conversion functions, the following options are available:

#### 1. Conversion to other integer types

- `.to_uint64()`: Converts to a 64-bit unsigned integer
- Zero extends and wraps as necessary
- Example: `unsigned long long A = ap_int<16>(-32768).to_uint64();`

#### 2. Conversion to fixed-point types

- `.to_ufixpt<I_W>()`: Converts to an unsigned fixed-point type
- `.to_fixpt<I_W>()`: Converts to a signed fixed-point type
- Interprets the same bits as the original `ap_uint`
- Allows specifying the integer width (I_W)
- Example:

  ```cpp
  // Interpret 8-bit uint as 8-bit ufixpt with 4 bits above decimal
  ap_ufixpt<8, 4> C = ap_uint<8>(248).to_ufixpt<4>();
  ```

- `raw_bits()`: Returns a uint with the same width, preserving raw data
- `to_double()`: Converts to a double representation (can lose precision)

### Type Conversions Between fixpt Types

- `ap_ufixpt` to `ap_fixpt`: `fixpt_t(ufixpt_value.to_double())`
- `ap_fixpt` to `ap_ufixpt`: `ufixpt_t(fixpt_value.to_double())`
- `sqrt` requires ufixpt input, must convert squared values:

  ```cpp
  ufixpt_t x_sq = ufixpt_t((cart.x * cart.x).to_double());
  ```

### Best Practices for fixpt Operations

- When mixing fixpt operations, prefer keeping same signedness
- When using structs with math library functions, prefer consistent types (all fixpt or handle conversions explicitly). Ternary operators should use proper type casting as necessary and consistent
- Mixed signed/unsigned fixpt in structs may need explicit `.to_double()` conversions
- Conditional expressions with fixpt require explicit casting:
  - **(Wrong)** `result = (x < 0) ? -x : x;`
  - **(Correct)** `result = (x < 0) ? fixpt_t((-x).to_double()) : x;`
  - Negation operator creates width+1 type, causing ambiguity
- `sqrt` requires unsigned input (ap_ufixpt) but may need conversion back to signed.
