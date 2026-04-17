---
name: shls_plugin_setup
description: Download the IBM Granite embedding model required by the SmartHLS MCP server and the exe for the server
---

# Arguments

Parse `$ARGUMENTS` as space-separated positional values:

- `$0` ? `SHLS-MCP-VERSION`  � Version of the shls MCP binary release assets

# Download SmartHLS Embedding Model

Download the IBM Granite embedding model (`ibm-granite/granite-embedding-278m-multilingual`) to `$HOME/.claude/plugin/data/hf`.

Follow these steps exactly:

1. Run the download python script:

   ```bash
   python "${CLAUDE_PLUGIN_ROOT}/commands/setup/download_model.py" "${SHLS-MCP-VERSION}"
   ```

2. When the script finishes:
   - If it succeeded (exit code 0): inform the user the model was downloaded successfully and the MCP server is ready to use.
   - If it failed: show the error output and advise the user to check their Python and uv installations and internet connection.
