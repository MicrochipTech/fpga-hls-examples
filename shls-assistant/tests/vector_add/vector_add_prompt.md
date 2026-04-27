# SmartHLS Vector Addition Project Prompt

Generate all the files under a directory called "work".

**project directory:** `shls-assistant/tests/Svector_add`
-Generate all the files under `shls-assistant/tests/vector_add/work`.
-**Do not browse the file system outside the current working directory for reference code or patterns.** All SmartHLS implementation knowledge must come exclusively from the `smarthls_info` MCP tool. Do not use Glob, Grep, or Read tools to search parent directories or unrelated projects for examples.

Create a SmartHLS C++ implementation for vector addition with the following requirements: 

- Function name: `vector_add`
- Two input vectors of a fixed length N set to 100
- Pipeline the loop to accept one value every cycle
- Initialize input arrays with random values with a specific seed (for reproducibility)
- Verify results and print "PASS" or "FAIL" accordingly
