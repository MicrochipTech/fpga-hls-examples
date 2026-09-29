#!/usr/bin/env python3
"""
PostToolUse hook — logs SmartHLS MCP RAG queries and results
to <workspace>/mcp-rag-log.md in a human-readable format.
"""

import io
import json
import sys
import os
from datetime import datetime


def main():
    data = json.load(io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8'))

    query = data.get("tool_input", {}).get("query", "N/A")
    raw_result = data.get("tool_response", {})

    # tool_response may arrive as a JSON string, a dict, or plain text
    if isinstance(raw_result, str):
        try:
            # Attempt to parse the string as JSON so we can extract the "result" field
            parsed = json.loads(raw_result)
            # If parsing succeeds and yields a dict, prefer the "result" key; fall back to the raw string
            result_text = parsed.get("result", raw_result) if isinstance(parsed, dict) else raw_result
        except (json.JSONDecodeError, ValueError):
            # Not valid JSON — treat the raw string as the result directly
            result_text = raw_result
    elif isinstance(raw_result, dict):
        # Already a dict; prefer the "result" key, otherwise pretty-print the whole dict
        result_text = raw_result.get("result", json.dumps(raw_result, indent=2))
    else:
        # Fallback for any other type (int, list, etc.)
        result_text = str(raw_result)

    # Normalise to a plain string — MCP responses can be a list of content
    # blocks [{"type": "text", "text": "..."}] or some other non-str value.
    if isinstance(result_text, list):
        parts = []
        for item in result_text:
            if isinstance(item, dict):
                parts.append(item.get("text", json.dumps(item)))
            else:
                parts.append(str(item))
        result_text = "\n".join(parts)
    elif not isinstance(result_text, str):
        result_text = str(result_text)

    # Unescape literal \n sequences into real newlines
    result_text = result_text.replace("\\n", "\n")

    # Retrieve the name of the tool used from the input data; default to "unknown" if not present
    tool_name = data.get("tool_name", "unknown")
    # Extract the short method name (last segment after __)
    method = tool_name.rsplit("__", 1)[-1] if "__" in tool_name else tool_name

    ts = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # Log to the user's current working directory
    cwd = data.get("cwd", os.getcwd())
    log_path = os.path.join(cwd, "shls-assistant-rag-log.md")

    entry = (
        f"{chr(0x2500) * 60}\n"
        f" # Query Log - {ts} \n"
        f"\n"
        f"## Query\n"
        f"{query}\n"
        f"\n"
        f"## shls_mcp response\n"
        f"\n"
        f"````verbatim\n"
        f"{result_text}\n"
        f"````\n"
        f"\n\n"
    )

    with open(log_path, "a", encoding="utf-8") as f:
        f.write(entry)


if __name__ == "__main__":
    main()
