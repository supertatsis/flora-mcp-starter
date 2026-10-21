#!/usr/bin/env bash
# Add FLORA's hosted MCP server to Claude Code (OAuth sign-in on first call)
claude mcp add --transport http flora https://agents.flora.ai/mcp

# Optional: official plugin = server + skills in one
# claude plugin marketplace add florafauna-ai/flora-mcp-skills
# claude plugin install flora-mcp-skills@flora
