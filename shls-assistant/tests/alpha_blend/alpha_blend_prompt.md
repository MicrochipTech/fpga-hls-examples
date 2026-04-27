# SmartHLS Alpha Blend Project Prompt

Create a complete SmartHLS project for implementing an alpha blending operation
for two RGB images.

**project directory:** `shls-assistant/tests/alpha_blend`
-Generate all the files under `shls-assistant/tests/alpha_blend/work`.
-**Do not browse the file system outside the current working directory for reference code or patterns.** All SmartHLS implementation knowledge must
come exclusively from the `smarthls_info` MCP tool. Do not use Glob, Grep, or Read tools to search parent directories or unrelated projects for
examples.

- Input images: `polarfire.bmp` and `toronto.bmp` (compared against `golden_output.bmp`).
  Note: properly source these input files in the c++ implementation
- Use 24-bit RGB pixel type with 8 bits per color channel
- Default configuration: 1920x1080 full HD images
- Define input image filenames and golden output reference filename

## Core Alpha Blending Function

- Use FIFO streaming interfaces for input and output
- Input FIFO contains structure with both image channels and alpha value
- Output FIFO contains blended RGB result
- Enable full pipelining for maximum throughput

**Alpha Blending Algorithm:**

- Alpha value ranges from 0 to 255
- Convert alpha to 16-bit value
- For each color channel (R, G, B) separately:
  - Calculate weighted blend: (channel1 × (256 - alpha) + channel2 × alpha)
  - Right-shift result by 8 bits to normalize
- Output the blended RGB value

## Testbench Requirements

**Main Testing Function:**

- Initialize FIFO interfaces
- Read two input .bmp images and one golden reference output
- Allocate memory for the output image
- Perform sanity check test:
  - Verify output matches expected result
- Process full image test:
  - Set alpha value (support testing at 50% blend level)
  - Iterate through all pixels in both images
  - Extract RGB channels from each pixel
  - Compare with golden reference pixel-by-pixel
  - Write output image to file for visual verification
- Report PASS or FAIL status

**Error Handling:**

- Return appropriate error codes for file I/O failures
- Validate intermediate results against expected values
- Report specific failures with diagnostic information

## Expected Behavior

- Process pixels individually in a fully pipelined streaming fashion
- Perform alpha compositing with hardware-friendly integer arithmetic (no floating-point)
- Achieve bit-accurate results matching golden reference
- Support configurable alpha values for different blend ratios
- Handle both small test images and full HD images

## Performance Goals

- Minimal FIFO depth for low latency
- Efficient bit manipulation using arbitrary precision types
- No memory bottlenecks - pure streaming operation

