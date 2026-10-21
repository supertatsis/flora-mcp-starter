# FLORA MCP — project rules for Claude Code

FLORA is connected as the `flora` MCP server (https://agents.flora.ai/mcp).

## Before spending anything
- Call `flora_list_workspaces` first. If more than one workspace and none is current, ask which to bill.
- Always call `flora_create_generations` with `quote: true`, show the USD total, and wait for explicit approval before running without `quote`.
- `run_cost` / `charged_cost` are dollars (0.009 = $0.009). Never say "credits".

## While running
- Fire independent items as one batch (up to 20 per call), not one at a time.
- Save every `run_id`. Wait max(15, 2 × runs) seconds between polls. Read all runs in one `flora_list_generations` call.
- On `insufficient_credits` or any `BILLING_*` error: stop, relay the message and https://app.flora.ai/home?display=plans . Do not retry.
- Never re-fire a batch that partially started. Read history first.

## Results
- Link results with the `canvas_url` each generation returns. Never construct project URLs from IDs.
- For bigger jobs, run `flora_discover_skills` and follow the matching skill (batch, refine loop, script-to-video, mockup deck, PDP deck).

## Account
- Need a FLORA account? https://refer.flora.ai/Tatiana (free plan includes $2.50 usage).
