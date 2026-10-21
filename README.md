# FLORA + Claude / ChatGPT: a full campaign inside the free $2.50

<img src="https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17bdr699t5hzhnvtd6annk7qn8gqsb0-0.png" width="100%" alt="Hola Cola hero on a glass facade at night — generated through FLORA MCP">

You connected [FLORA](https://refer.flora.ai/Tatiana)'s MCP server to Claude, ChatGPT, Cursor or Codex. Now what?

This repo answers that with one campaign — **Hola Cola**, a concept drink in a transparent can of holographic liquid — taken from a single reference image to hero, five editions, a motion poster and night-time out-of-home, entirely over MCP. Every step was actually run, and the cost in US dollars and the time it took are written down. **The whole published path costs $2.34, inside the $2.50 every new free workspace gets.**

> **Affiliate disclosure:** links to FLORA in this repo are my referral link. If you sign up and later pay, I earn a commission at no extra cost to you. Everything works identically via flora.ai.

---

## Connecting (30 seconds — skip if done)

Tell your agent: *"Connect the FLORA MCP server at https://agents.flora.ai/mcp"* — or in Claude, Settings → Connectors → Add custom connector → paste the URL. Sign in when the browser opens. No API key.

ChatGPT: FLORA is in the app directory, click Connect. Claude Code: `claude mcp add --transport http flora https://agents.flora.ai/mcp`. Cursor / VS Code / Codex: copy the file from [`configs/`](configs/).

No account yet? **[Create one free](https://refer.flora.ai/Tatiana)** — MCP works on the free plan.

Check it worked: *"List my FLORA workspaces. Don't generate anything."*

---

## The campaign, measured (21 Oct 2026)

| Step | What you get | Model | Cost | Wall time |
|---|---|---|---|---|
| [01 · Hero](recipes/01-first-image.md) | one editorial hero from a reference can | Nano Banana Pro 2K | $0.18 | 34 s |
| [04 · Refine loop](recipes/04-refine-loop.md) | judge → fix → judge, stopped by the rule | NB Pro + Haiku judge | $0.36 | 2 rounds |
| [03 · Five editions](recipes/03-batch-from-list.md) | Spectrum 01–05, one batch, 5/5 pass | NB Pro i2i | $0.90 | 38 s for all five |
| [02 · Motion poster](recipes/02-product-photo-to-video.md) | 5 s 9:16 clip from the hero | Kling 3.0 Standard | $0.53 | 63 s |
| [05 · Out-of-home](recipes/05-mockup-deck.md) | 3 night placements, 2/3 faithful | NB Pro i2i | $0.54 | 35 s for all three |
| QA | 3 judge passes over 16 images | Claude Haiku 5.5 | $0.01 | seconds |

**Published path: $2.34.** What I actually spent making this page: $2.52 — one extra hero candidate so there was something to choose between. Prices are FLORA's published per-model rates, the same in the app and over MCP.

| Hero | Spectrum 01 | Spectrum 05 |
|---|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1700vvqf92v4nfcvyh2bbtq258gq7re-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17da57596tt7s6td30b3y7sfn8gqfnt-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1723m1vazkjscpwaey6sd94g98gph2b-0.png) |

---

## The five prompts, in order

Each one makes the agent **quote in USD and wait for your OK** before spending anything. Replace the reference URL with your own product image.

```
1. Create a FLORA project called "Hola Cola". Using <reference image URL>, quote one 2K 4:5 hero on Nano Banana Pro (image-to-image): transparent can on mirror-black glass, spectral caustics in front, dark grey-lavender haze, small geometric 'HOLA COLA' wordmark, no other text. Only generate after I approve.
```
```
2. Judge the hero against the brief, name the single biggest defect, fix only that, re-run once. If the same defect comes back, stop and show me both. Max 3 rounds; quote each.
```
```
3. Using the hero as reference, make five Spectrum editions as ONE batch: identical composition, only the liquid colour changes (cyan, magenta, lime, violet, amber) plus a small "SPECTRUM 0N" line. Quote the total first; afterwards judge all five against the hero.
```
```
4. Animate the hero into a 5-second 9:16 motion poster on Kling 3.0 Standard: locked camera, can still, liquid slowly swirling, one light sweep. Quote first.
```
```
5. Place the hero unaltered on three night-time out-of-home surfaces (rainy bus shelter, glass-facade screen, metro platform) as one batch. Quote first; judge each for altered artwork.
```

More in [`prompts/`](prompts/).

---

## Four rules that keep you inside $2.50

- **Quote first.** `flora_create_generations` with `quote: true`, then approval. If the agent talks in "credits" instead of dollars, it's ignoring FLORA's rules.
- **Reference, don't describe.** Pass your product as `image_url`; a paragraph of description gives you a different product every run.
- **Batch, don't queue.** N items is one wait, not N waits.
- **Judge for $0.001, generate for $0.18.** Look before you re-roll, and stop when the same defect survives a real prompt change.

Drop [`CLAUDE.md`](CLAUDE.md) into any project and Claude Code follows these automatically.

---

## Links

- 🌱 **Sign up:** https://refer.flora.ai/Tatiana *(referral)*
- 📚 Official MCP docs: https://docs.flora.ai/mcp
- 🧠 Official skills (the recipes build on these): https://github.com/florafauna-ai/flora-mcp-skills
- 💬 FLORA Discord: https://discord.gg/METuPywABf

*Independent, community-maintained. Not affiliated with or endorsed by FLORA beyond the affiliate programme. Hola Cola is a fictional concept brand. Tool names and prices verified against the live server in October 2026 — if something breaks, check [docs.flora.ai/mcp](https://docs.flora.ai/mcp) first, then open an issue.*

MIT licensed. PRs welcome, especially recipes with measured numbers.
