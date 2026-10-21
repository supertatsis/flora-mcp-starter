# FLORA + Claude / ChatGPT: your first 30 minutes

You connected [FLORA](https://refer.flora.ai/Tatiana)'s MCP server to Claude, ChatGPT, Cursor or Codex. Now what?

This is the "now what". Every recipe here was run for real, with the cost in US dollars and the time it took written down — so you know what the free $2.50 buys you before you spend it.

> **Affiliate disclosure:** links to FLORA in this repo are my referral link. If you sign up and later pay, I earn a commission at no extra cost to you. Everything works identically via flora.ai.

---

## Connecting (30 seconds — skip if done)

Tell your agent: *"Connect the FLORA MCP server at https://agents.flora.ai/mcp"* — or in Claude, Settings → Connectors → Add custom connector → paste the URL. Sign in when the browser opens. That's it; no API key.

ChatGPT: FLORA is in the app directory, click Connect. Claude Code: `claude mcp add --transport http flora https://agents.flora.ai/mcp`. Cursor / VS Code / Codex: copy the file from [`configs/`](configs/).

No account yet? **[Create one free](https://refer.flora.ai/Tatiana)** — MCP works on the free plan and every new workspace gets $2.50 of usage.

Check it worked: *"List my FLORA workspaces. Don't generate anything."*

---

## What things actually cost (measured, October 2026)

| Recipe | What you get | Model | Cost | Wall time |
|---|---|---|---|---|
| [01 · First image](recipes/01-first-image.md) | one studio product shot | Nano Banana 2.1 | $0.052 | 25 s |
| [03 · Batch of 5 (+1)](recipes/03-batch-from-list.md) | six consistent PDP shots, fired at once | Nano Banana 2.1 | $0.312 | 25 s for all six |
| [04 · Refine loop](recipes/04-refine-loop.md) | fix a named defect, stop when right | Flux 2 Klein 4B + Haiku judge | $0.010 | 2 rounds |
| [02 · Photo → video](recipes/02-product-photo-to-video.md) | 5-second clip from the first image | Kling 2.5 Turbo Pro | $0.294 | 88 s |
| [05 · OOH mockups](recipes/05-mockup-deck.md) | creative placed on 4 out-of-home surfaces | Nano Banana 2.1 (i2i) | $0.208 | 20 s for all four |

**Total spent for all five recipes: $0.83** (the first image is one of the six in the batch; the two QA judge passes cost $0.004 together). The free $2.50 covers all of them three times over — as long as nobody picks the $2.48 video model by accident.

Every number above came from a real run on my account. Prices are FLORA's published per-model rates — the same in the app and over MCP. Output images are in each recipe.

---

## The five prompts to run first

Each one makes the agent **quote in USD and wait for your OK** before spending anything.

```
1. List my FLORA workspaces and the image models I can use, with estimated cost per image. Don't generate anything yet.
```
```
2. Create a FLORA project called "First test". Quote one 1:1 image of "a matte black ceramic coffee dripper on a warm grey seamless backdrop, soft key from camera left, 85mm". Only generate after I approve.
```
```
3. Here are 5 products: [paste list]. One PDP shot each, identical studio setup. Fire them all at once as a batch, quote the total first, then tell me what failed and why.
```
```
4. Judge the last image against the brief, name the single biggest defect, fix only that, re-run once. Max 3 rounds.
```
```
5. Animate the first image into a 5-second clip, slow orbit, nothing added. Quote first.
```

More in [`prompts/`](prompts/).

---

## Four rules that save your credit

- **Quote first.** `flora_create_generations` with `quote: true`, then approval. If the agent talks in "credits" instead of dollars, it's ignoring FLORA's rules.
- **Batch, don't queue.** N items is one wait, not N waits. FLORA runs generations concurrently; the serialisation is on the agent's side.
- **Judge for free, generate reluctantly.** Image-to-text judges cost $0. Re-rolling the same prompt costs full price and teaches nothing.
- **Never re-fire a partial batch.** A timed-out call may have started runs. Read history before retrying.

Drop [`CLAUDE.md`](CLAUDE.md) into any project and Claude Code follows these automatically.

---

## Links

- 🌱 **Sign up:** https://refer.flora.ai/Tatiana *(referral)*
- 📚 Official MCP docs: https://docs.flora.ai/mcp
- 🧠 Official skills (the recipes build on these): https://github.com/florafauna-ai/flora-mcp-skills
- 💬 FLORA Discord: https://discord.gg/METuPywABf

*Independent, community-maintained. Not affiliated with or endorsed by FLORA beyond the affiliate programme. Tool names and prices verified against the live server in October 2026 — if something breaks, check [docs.flora.ai/mcp](https://docs.flora.ai/mcp) first, then open an issue.*

MIT licensed. PRs welcome, especially recipes with measured numbers.
