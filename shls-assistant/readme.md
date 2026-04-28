# SmartHLS Coding Assistant - Claude Code Plugin

A comprehensive AI-powered coding assistant for SmartHLS development that
integrates Claude Code with a Model Context Protocol (MCP) server to provide
intelligent assistance for FPGA development using SmartHLS.

## Table of Contents

- [SmartHLS Coding Assistant - Claude Code Plugin](#smarthls-coding-assistant---claude-code-plugin)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [What Is This Example?](#what-is-this-example)
  - [Prerequisites](#prerequisites)
  - [Installation and Setup](#installation-and-setup)
    - [1. Clone the HLS Libraries](#1-clone-the-hls-libraries)
    - [2. Configure System Environment Variables](#2-configure-system-environment-variables)
    - [3. Install Claude Code](#3-install-claude-code)
      - [Setting the Anthropic API Key](#setting-the-anthropic-api-key)
    - [4. Install the SmartHLS Coding Assistant Claude Code Plugin](#4-install-the-smarthls-coding-assistant-claude-code-plugin)
      - [Step 1: Launch Claude Code](#step-1-launch-claude-code)
      - [Step 2: Add the SmartHLS Marketplace and Plugin](#step-2-add-the-smarthls-marketplace-and-plugin)
      - [Step 3: Run SmartHLS Plugin Additional Setup](#step-3-run-smarthls-plugin-additional-setup)
  - [Verifying the shls-mcp connection](#verifying-the-shls-mcp-connection)
    - [1. Check the Plugin Indicator (Do Not Skip)](#1-check-the-plugin-indicator-do-not-skip)
    - [2. Test shls-mcp functionality](#2-test-shls-mcp-functionality)
    - [3. Check the shls-mcp logs](#3-check-the-shls-mcp-logs)
  - [Using Claude Code with SmartHLS](#using-claude-code-with-smarthls)
  - [Test Examples](#test-examples)
    - [1. Vector Addition](#1-vector-addition)
    - [2. Alpha Blend](#2-alpha-blend)
    - [3. Sobel Filter Optimization](#3-sobel-filter-optimization)
    - [4. Polar to Cartesian Coordinate Conversion](#4-polar-to-cartesian-coordinate-conversion)
    - [5. SHA256 Hash Function](#5-sha256-hash-function)
  - [How to Run the Examples](#how-to-run-the-examples)
  - [Updating Plugin](#updating-plugin)
  - [Troubleshooting](#troubleshooting)
    - [Plugin Not Visible After `/reload-plugin`](#plugin-not-visible-after-reload-plugin)
    - [`shls-mcp` Not Connected After Plugin Setup](#shls-mcp-not-connected-after-plugin-setup)
    - [SmartHLS Command Not Found](#smarthls-command-not-found)
    - [Library Not Found Errors](#library-not-found-errors)
    - [API Key Issues](#api-key-issues)
  - [Terms of Use](#terms-of-use)

---

> **Note:** This example is in the Advanced section because users are expected
> to be familiar with Claude Code. Please familiarize yourself with Claude Code
> before proceeding.

---

## Overview

This project provides an AI-powered development environment for SmartHLS FPGA
development. It combines:

- **Claude Code** -- Anthropic's agentic coding assistant and CLI for writing
  and iterating on code.
- **MCP (Model Context Protocol)** -- Communication layer between Claude Code
  and the SmartHLS MCP server, which includes a RAG system.
- **RAG (Retrieval-Augmented Generation)** -- A technique where an AI model
  retrieves relevant external documents from a vectorized database to generate
  answers using that retrieved context.

The system enables natural language interaction with Claude Code to generate,
optimize, and test SmartHLS C++ code for FPGA implementation.

---

## What Is This Example?

This example shows how to use Anthropic's Claude Code to assist with SmartHLS
FPGA development tasks. Instead of manually writing HLS code and running
synthesis commands, you can:

1. Describe what you want to implement in natural language.
2. Claude Code generates SmartHLS C++ code with SmartHLS-specific pragmas.
3. Claude Code automatically runs compilation, co-simulation, and synthesis.
4. Get feedback and iterate on designs quickly.

The system uses a RAG-based approach with SmartHLS documentation embedded using
[IBM's Granite embedding model](https://www.ibm.com/granite/docs/models/embedding),
providing context-aware code generation that follows SmartHLS best practices.

The SmartHLS assistant is distributed as a Claude Code plugin with an
`shls` skill that can access the SmartHLS MCP server. Plugins allow users to
invoke it from any project folder.

---

## Prerequisites

Before starting, ensure you have the following installed:

- **Windows 10/11** (PowerShell required) or **Linux**
- **Python 3.10 -- 3.12**
- **UV** (Python package and project manager)
- **SmartHLS** (Microchip's High-Level Synthesis tool)
- **Microchip Libero SoC** (for synthesis and implementation)
- **Claude Code**
  ([installation guide](https://code.claude.com/docs) -- if you are using
  Windows, use the GitBash + Claude Code option)
- **Git**
- **Anthropic API Key** ([get one here](https://platform.claude.com/settings/keys))

---

## Installation and Setup

### 1. Clone the Repository and HLS Libraries

```console
git clone -b shls_assistant https://github.com/MicrochipTech/fpga-hls-examples.git
```

Clone the HLS libraries repository into the `shls-assistant` directory. The
examples in this project use these libraries.

```console
cd fpga-hls-examples/shls-assistant
```

```console
git clone https://github.com/MicrochipTech/fpga-hls-libraries
```

### 2. Configure System Environment Variables

Set the following environment variables so that SmartHLS, Libero, and the
simulator tools are accessible from the command line. Adjust the paths to match
your actual installation directories.

For example, in powershell:

```powershell
$env:LIBERO_PATH   = "C:\Microchip\Libero_SoC_2025.2"
$env:LIBERO_BIN    = "$env:LIBERO_PATH\Libero_SoC\Designer\bin"
$env:QUESTASIM_BIN = "$env:LIBERO_PATH\Libero_SoC\QuestaSim_Pro\win64"
$env:MODELSIM_BIN  = "$env:LIBERO_PATH\Libero_SoC\ModelSim_Pro\win32acoem"
$env:SHLS_ROOT_DIR = "$env:LIBERO_PATH\SmartHLS\SmartHLS"
$env:SMARTHLS_BIN  = "$env:SHLS_ROOT_DIR\bin"
$env:SHLS_LIB_PATH = "<path/to/fpga-hls-libraries>"
```

After setting the variables, **close and reopen PowerShell** (or any terminal)
so the new values take effect.

**Notes:**

- Replace `<path/to/fpga-hls-libraries>` in `$SHLS_LIB_PATH` with the full path
  to the directory where you cloned this repository from the previous step.
- Adjust all paths based on where Libero SoC is installed in your system.

### 3. Install Claude Code

Download and install [Claude Code](https://claude.ai/download) if you have not
already done so, and follow the installation instructions.

#### Setting the Anthropic API Key

You have two options:

  1. Create a system environment variable to place your Anthropic Key

on Linux

  ```console
  ANTHROPIC_API_KEY = "sk-..."
  ```
on Windows 

```powershell
$env:ANTHROPIC_API_KEY = "sk-..."
   ```

  2. Add the key in your `.claude/settings.local.json` file:

  ```json
  {
    "env": {
      "ANTHROPIC_API_KEY": "sk-...",
    }
  }
  ```

**Note:** If the API key is missing or invalid, the `shls-mcp` server will fail to start.

### 4. Install the SmartHLS Coding Assistant Claude Code Plugin

Claude Code can be launched from the terminal CLI or using the VS Code
extension. Both methods provide full plugin integration.

#### Step 1: Launch Claude Code

```console
claude
```

#### Step 2: Add the SmartHLS Marketplace and Plugin

Enter the plugin menu:

```text
/plugin
```

Navigate to **Marketplaces** and add a new marketplace. In the input box, enter
the following GitHub URL:

```text
https://github.com/MicrochipTech/fpga-hls-examples#shls_assistant
```

Press `<Enter>`, then select **Browse Plugins**. The SmartHLS Coding Assistant
plugin will appear. Select it and install it for `user` scope. Press
`<Escape>` until you return to the Claude Code prompt, then run:

```text
/reload-plugin
```

#### Step 3: Run SmartHLS Plugin Additional Setup

The following command prompts Claude Code to run a script that downloads the IBM Granite embedding model from Hugging Face and the `shls-mcp` executable from GitHub
artifacts, placing them in the appropriate locations.

```text
/shls_plugin_setup 2025.2.1
```

---

## Verifying the shls-mcp connection

### 1. Check the Plugin Indicator (Do Not Skip)

In Claude Code, verify the plugin and the `shls-mcp` server are enabled and connected
by running `/plugin` command and navigating to **Installed** menu.

```console
   shls_coding_assistant Plugin - mchp_hls_marketplace  ·  ✔ enabled
    └ shls_mcp MCP · ✔ connected
```

If it is not connected try reconnecting by running `/mcp` and select the `shls-mcp`
plugin and hit `<Enter>` and reconnect.

For more information, see the [Claude Code plugin documentation](https://code.claude.com/docs/en/discover-plugins).

### 2. Test shls-mcp functionality

Ask Claude Code a SmartHLS-specific question:

```text
What is the syntax for loop pipelining in SmartHLS?
```

Claude Code should load the `shls` skill from the plugin. If the MCP is
working, Claude Code will retrieve and cite SmartHLS documentation.

### 3. Check the shls-mcp logs

If there are issues, check the shls-mcp server log file located in the
`$HOME/.claude/plugins/data/shls_coding_assistant-mchp_hls_marketplace/shls-mcp` directory.

Additionally, every shls-mcp query and its result is automatically logged to a file called `shls-assistant-rag-log.md` in your current working directory. This log is useful for:

- Verifying that the shls-mcp server is retrieving relevant SmartHLS documentation
- Debugging unexpected or incomplete responses from the assistant
- Reviewing the raw RAG context that Claude Code used to generate its answers

Open the file to inspect timestamped entries showing the query sent and the full result returned by the shls-mcp server.

---

## Using Claude Code with SmartHLS

Once Claude Code is running and the shls-mcp is connected, you can:

**Generate SmartHLS projects:**

```text
Create a SmartHLS function following this prompt: @my-shls-function-spec.md
```

**Ask documentation questions:**

```text
How do I use FIFO streaming interfaces in SmartHLS?
```

**Debug synthesis issues:**

```text
I'm getting a memory aliasing error during synthesis. How can I fix this?
```

**Optimize existing code:**

```text
Optimize the loop in @my_smarthls_code.cpp for better throughput.
```

or

```text
Optimize my code in @my_smarthls_code.cpp to reduce area.
```

**Run SmartHLS commands:**

```text
Initialize a new SmartHLS project in the current directory and run co-simulation
```

Claude Code will automatically execute the appropriate commands and provide
feedback on results. The following sections demonstrate more comprehensive examples.

---

## Test Examples

The `tests` directory contains several example projects that demonstrate
different SmartHLS Coding Assistant capabilities. Each example includes:

- A **prompt file** that describes the implementation requirements.
- **Input files** (required by some examples).
- A **`work` directory** where the LLM's HLS C++ implementation and other generated
  files are placed. You can delete this directory to rerun a prompt from
  scratch.

You can read the prompt files to understand what each example is trying to
achieve.

### 1. Vector Addition

A simple vector addition example that demonstrates basic SmartHLS functionality
with pipelining.

**What it demonstrates:**

- Simple prompt to generate a simple HLS C++ code.
- The assistant should use `#pragma HLS loop pipeline`
- Show the agentic flow of the assistant

### 2. Alpha Blend

Image processing application that performs alpha blending (compositing) of two
RGB images.

**What it demonstrates:**

- How prompts can include references to input and output image filenames
- The use of FIFO streaming (`hls::FIFO<T>`)
- Use fixed-point arithmetic
- Bit manipulation for RGB channels
- File I/O in the testbench

**Input files:**

- `polarfire.bmp` -- First input image
- `toronto.bmp` -- Second input image
- `golden_output.bmp` -- Expected result for verification

### 3. Sobel Filter Optimization

Performance optimization exercise that transforms an existing implementation of a
basic Sobel edge detection filter into a high-performance pipelined version.

**What it demonstrates:**

- Performance optimization over existing code
- Comparison of resource usage against a baseline

**Files:**

- `sobel_filter_basic.cpp` -- Original unoptimized implementation
- `input.h` -- Test input image (elaine_512)
- `golden_output.h` -- Expected output for verification
- `basic_resources` -- Resource usage baseline

### 4. Polar to Cartesian Coordinate Conversion

Coordinate system conversion functions using fixed-point arithmetic and the
SmartHLS math library.

**What it demonstrates:**

- How the assistant reuses the `hls::math` functions from the SmartHLS GitHub library.
- Fixed-point arithmetic (`ap_fixpt`, `ap_ufixpt`)
- Handling two top-level functions
- How to add testcases in the prompt

### 5. SHA256 Hash Function

Complete SHA256 cryptographic hash function implementation following the
FIPS 180-4 standard, optimized for FPGA synthesis.

**What it demonstrates:**

- Complex cryptographic algorithm implementation
- A more detailed prompt with specific algorithmic descriptions to reduce the
  variability of the code implementation.
- How to provide specific test cases in the prompt that will be part of the main()
  function for verification.

---

## How to Run the Examples

Each example follows a similar workflow:

1. **Clean the project directory** -- Remove the `work` directory if it exists
   from a previous run.
2. **Launch Claude Code** -- Start Claude Code as described in the setup
   sections above and verify that the shls-mcp connects. Use the `/mcp` command.
3. **Run the prompt** -- Reference the prompt file, for example:

  ```console
  > @tests/vector_add/vector_add_prompt.md
  ```

1. **The assistant will do the following:**
   - Generate the HLS C++ code
   - Run `shls init` to initialize the SmartHLS project.
   - Update the Makefile to add necessary library paths if using
     `fpga-hls-libraries`.
   - Run co-simulation.
   - Run RTL synthesis, only if co-simulation passes.
   - Generate a summary report.
  
2. **Review the results** -- Check the generated files:
   - `<project_name>.cpp` -- Generated implementation
   - `config.tcl` -- SmartHLS configuration
   - `Makefile` -- Build configuration
   - `shls-cosim-output.log` -- Co-simulation results
   - `hls_output/reports` -- SmartHLS compiler reports

3. **Iterate if needed** -- If there are errors or you want to optimize
   further, provide feedback to the assistant. For example:

   ```text
   > The latency is too high. Can you add loop pipelining to reduce it?
   ```

   The assistant will modify the code and rerun the workflow automatically.

## Updating Plugin

If you already have the plugin installed in Claude Code and you would like to
update the plugin to the latest version. Navigate to the installed plugins section
of Claude Code and enter into the `shls_coding_assistant` plugin. Then select 
the `Update now` option.

For each new release of the SmartHLS Coding Assistant plugin, run the following
command to refresh required artifacts and complete setup:

```console
> /shls_plugin_setup 2025.2.3
```

In this case you would be updating to version 2025.2.3. The command will throw an error if you try to setup with incompatible release version. If you have SmartHLS 2025.2 install in your laptop, only mcp from release-assets with 2025.2.x are compatible.

---

## Troubleshooting


### Plugin Not Visible After `/reload-plugin`

**Problem:** After running `/reload-plugin`, the SmartHLS plugin does not
appear under `/plugin` > Installed.

**Solutions:**

1. Re-add the marketplace and reinstall the plugin.
2. Run `/reload-plugin` again after reinstalling.
3. If the plugin is still not visible, fully exit and relaunch Claude Code.

### `shls-mcp` Not Connected After Plugin Setup

**Problem:** After running `/shls_plugin_setup`, the shls-mcp server shows as
disconnected or missing.

**Solutions:**

1. Verify that the `ANTHROPIC_API_KEY` environment variable is set with a
   valid API key (see
   [Set the Anthropic API Key](#5-set-the-anthropic-api-key)).
2. Navigate to `/plugin` ==> Installed, find `shls_coding_assistant`, expand it,
   and manually reconnect the shls-mcp.
3. Check `shls-server.log` in the `shls-mcp` directory for startup errors.
4. Verify the `shls-mcp` executable was downloaded. If the file is missing,
   re-run `/shls_plugin_setup`.
5. If the `shls-mcp` still fails to connect, try removing and adding the
   marketplace and redo the full setup again.

### SmartHLS Command Not Found

**Problem:** The `shls` command is not recognized.

**Solutions:**

1. Verify LiberoSoC and SmartHLS are installed.
2. Double check the PATH and environment variables (see
   [Configure System Environment Variables](#2-configure-system-environment-variables)).
3. Close and reopen PowerShell so the updated PATH takes effect.
4. Verify with `Get-Command shls` on Windows or `which shls` on Linux.

### Library Not Found Errors

**Problem:** `fatal error: 'math/include/hls_sin.hpp' file not found`

**Solutions:**

1. Make sure the fpga-hls-libraries repo has been cloned.
2. Verify the `SHLS_LIB_PATH` environment variable is set correctly.
3. Check that the generated Makefile includes:

   ```makefile
   SHLS_LIBRARY = ../fpga-hls-libraries
   USER_CXX_FLAG+=-I$(SHLS_LIBRARY)
   ```

### API Key Issues

**Problem:** "ANTHROPIC_API_KEY is not defined"

**Solutions:**

1. Check that the `ANTHROPIC_API_KEY` environment variable is set.
2. Ensure there are no extra spaces or quotes around the key.
3. Verify the API key is valid at the
   [Anthropic Console](https://console.anthropic.com/).
4. Restart the `shls-mcp` server (restart Claude Code).

**Additional info:** See [additional_context](./docs/additional_context.md) for more details about the prominent terms used in this document.

---

## Terms of Use

Use of the SmartHLS Coding Assistant is subject to the
[Terms of Use](terms_of_use.md). Please review the code it generates, as LLM
output may not always be accurate.

---

**Happy coding with the SmartHLS Assistant!**
