# Give your AI coding agent a 3D asset library

Gaitkit runs a public MCP server at `https://gaitkit.com/mcp` (Streamable HTTP). Once it is connected, ask your agent for
"a red pickup truck whose wheels turn" or "a beetle that walks on uneven ground": it searches the catalogue, turns your
words into knob values and writes working three.js code or hands you a GLB link. Browsing needs no key.

| Client | Setup |
|---|---|
| Claude Code | `claude mcp add --transport http gaitkit https://gaitkit.com/mcp` |
| Cursor | copy [`cursor-mcp.json`](cursor-mcp.json) to `.cursor/mcp.json` (or `~/.cursor/mcp.json`) |
| VS Code (Copilot agent mode) | copy [`vscode-mcp.json`](vscode-mcp.json) to `.vscode/mcp.json` |
| Codex CLI | `codex mcp add gaitkit --url https://gaitkit.com/mcp` |
| Claude Desktop, claude.ai, others | add `https://gaitkit.com/mcp` as a custom connector |

Tools: `search_assets` (grades its own coverage ok / poor / none), `get_asset` (size, knobs, rig, gait, file URLs, code),
`get_variant` (plain words in English or Turkish to knob values), `report_need` (log a model that is missing), `who_am_i`.

With a Gaitkit plan, send your API key so Pro download links work for the agent:
`Authorization: Bearer gk_live_…` (create keys at https://gaitkit.com/account).

Things to ask: see [`prompts.md`](prompts.md). More: https://gaitkit.com/agents and https://gaitkit.com/llms.txt.
