# Per-client configs

| Client | File / command |
|---|---|
| Claude (web & desktop) | No file. Settings → Connectors → Add custom connector → paste `https://agents.flora.ai/mcp` |
| Claude Code | `claude-code.sh` |
| ChatGPT | No file. App directory → FLORA → Connect |
| Codex | `codex.config.toml` → `~/.codex/config.toml` |
| Cursor | `mcp.json` → `.cursor/mcp.json` (project) or `~/.cursor/mcp.json` (global) |
| VS Code | `vscode.mcp.json` → `.vscode/mcp.json` |
| Windsurf / Zed / other | `mcp.json` in that client's MCP config location |

Headless (CI, scripts): add header `Authorization: Bearer <FLORA_API_KEY>` instead of OAuth. Keys are created in FLORA under workspace settings.

Need an account? https://refer.flora.ai/Tatiana (referral link, free plan works for MCP).
