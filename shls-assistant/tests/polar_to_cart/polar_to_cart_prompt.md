# Coordinate Conversion Project

Create a SmartHLS project that implements coordinate conversion functions between
polar and cartesian coordinate systems. 

Generate all the files under a directory called "work".

**project name:**polar_to_cart

## Core Functionality

- A function to convert polar coordinates (radius, angle) to cartesian coordinates (x, y)
- A function to convert cartesian coordinates (x, y) to polar coordinates (radius, angle)

## Technical Requirements

- Use 32-bit fixed-point arithmetic with appropriate integer/fractional bit allocation
- Implement proper atan2 functionality with correct quadrant handling
- only hls_atan.hpp exists in fpga-hls libraries, so you must implement custom atan2 using atan_cordic with manual quadrant handling.
  quadrant handling
- Use efficient SmartHLS math library functions (sincos, sqrt, atan)
- Include appropriate data structures for coordinate representation
- Add comprehensive test cases including round-trip conversion validation
- Handle edge cases (zero coordinates, quadrant boundaries)
- Optimize for FPGA synthesis with proper HLS pragmas
- Include both software testing and hardware verification

## Test Cases to Implement

  1. Polar (1.0, π/4) → Cartesian: expect (0.707, 0.707) ±0.01
  2. Round-trip: Cartesian(0.707, 0.707) → Polar → Cartesian
  3. Zero coordinates: (0, 0) → (0, 0)
  4. Quadrant I: (3, 4) → (5, ~0.927 rad), radius ±0.01
  5. Quadrant II: (-3, 4) → (5, ~2.214 rad), radius ±0.01
  6. Quadrant III: (-3, -4) → (5, ~-2.214 rad), radius ±0.01
  7. Quadrant IV: (3, -4) → (5, ~-0.927 rad), radius ±0.01
  8. X-axis: Polar(5, 0) → (5, 0) ±0.01
  9. Y-axis: Polar(5, π/2) → (0, 5) ±0.01
