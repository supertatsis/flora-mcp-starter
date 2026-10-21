# FLORA × Claude / ChatGPT — MCP starter kit

Run [FLORA](https://refer.flora.ai/Tatiana) (50+ image, video, audio and 3D models on one canvas) straight from Claude, Claude Code, ChatGPT, Codex, Cursor or VS Code — with working configs, copy-paste prompts and tested workflow recipes.

> **Affiliate disclosure:** links to FLORA in this repo are my referral link. If you sign up and later pay, I earn a commission at no extra cost to you. Everything here works identically if you go to flora.ai directly.

---

## 0. You need a FLORA account (free)

MCP access works from the free plan. Every new workspace gets **$2.50 of usage** to try it, and API/MCP are included on Starter and up.

👉 **[Create a free FLORA account](https://refer.flora.ai/Tatiana)** — takes about a minute, no card needed to start.

---

## 1. Connect FLORA to your agent (2 minutes)

FLORA's MCP server is hosted — nothing to install, no API key. First call opens a browser tab to sign in.

| | |
|---|---|
| **Server URL** | `https://agents.flora.ai/mcp` (no trailing slash) |
| **Transport** | Streamable HTTP |
| **Auth** | OAuth with your FLORA account (or `Authorization: Bearer <api-key>` for headless use) |
| **Server name** | `flora` |

### Claude (web & desktop)
1. Copy `https://agents.flora.ai/mcp`
2. Settings → **Connectors** → **Add custom connector** ([direct link](https://claude.ai/settings/connectors?modal=add-custom-connector))
3. Paste the URL, leave the OAuth fields empty, click **Connect**, sign in to FLORA
4. In a chat, open the **+** menu and turn the FLORA connector on

### Claude Code
```bash
claude mcp add --transport http flora https://agents.flora.ai/mcp
```
Or install the official plugin, which adds the server **and** FLORA's skills in one go:
```bash
claude plugin marketplace add florafauna-ai/flora-mcp-skills
claude plugin install flora-mcp-skills@flora
```

### ChatGPT
FLORA is in the ChatGPT app directory — search **FLORA**, click **Connect**, sign in.

### Codex
```bash
codex mcp add flora --transport http https://agents.flora.ai/mcp
```

### Cursor / VS Code / Windsurf / Zed / any MCP client
Copy [`configs/mcp.json`](configs/mcp.json):
```json
{
  "mcpServers": {
    "flora": {
      "type": "http",
      "url": "https://agents.flora.ai/mcp"
    }
  }
}
```
Per-client files live in [`configs/`](configs/).

### Check it works
Ask your agent:

> List my FLORA workspaces. Don't generate anything.

If it answers with a workspace name, you're connected.

---

## 2. First five prompts (copy-paste)

Each one is safe: FLORA's server makes the agent **quote the cost in USD first** and wait for your OK before spending anything.

```
1. List my FLORA workspaces and the models I can use for image generation, with estimated cost per image. Don't generate anything yet.
```
```
2. Create a new FLORA project called "Starter test". Quote the cost of one 1:1 image of "a matte black ceramic coffee dripper on a warm grey seamless backdrop, soft key from camera left, 85mm". Only generate after I approve.
```
```
3. Take that image and animate it into a 5-second product video, slow orbit. Quote first.
```
```
4. Here are 6 products: [paste list]. One PDP shot each, identical studio setup. Fire them all at once as a batch, quote the total first, then show me what failed and why.
```
```
5. List the Techniques in my workspace and tell me which ones work on an image I already have.
```

More in [`prompts/`](prompts/).

---

## 3. Recipes

| Recipe | What you get |
|---|---|
| [01 · First image](recipes/01-first-image.md) | Workspace → project → quote → generate → result on canvas |
| [02 · Product photo → video](recipes/02-product-photo-to-video.md) | Upload your own photo, animate it |
| [03 · Batch from a list or CSV](recipes/03-batch-from-list.md) | 20–500 consistent assets, one wait instead of N |
| [04 · Refine until right](recipes/04-refine-loop.md) | Stop re-rolling blindly; fix the named defect |
| [05 · Campaign mockup deck](recipes/05-mockup-deck.md) | One ad creative → OOH placements + social resizes |

Every recipe is built on FLORA's own tested skills: [florafauna-ai/flora-mcp-skills](https://github.com/florafauna-ai/flora-mcp-skills). Ask your agent to *"Read https://raw.githubusercontent.com/florafauna-ai/flora-mcp-skills/main/skills/flora-batch-generate/SKILL.md and follow it"* for zero-install use.

---

## 4. Rules the agent follows (so you can hold it to them)

- **Quote first, in USD.** `quote: true` on `flora_create_generations`, then approval, then run.
- **Stop on billing errors.** `insufficient_credits` / `BILLING_*` → stop, don't retry.
- **Poll slowly, in one call.** Save every `run_id`; wait ≥15 s between polls; read all runs with one `flora_list_generations`.
- **Never re-fire a partial batch.** Read history before retrying.
- **Open results via `canvas_url`.** Never build project links from IDs.

Copy [`CLAUDE.md`](CLAUDE.md) into any project to give Claude Code these rules automatically.

---

## 5. Pricing in one paragraph

Generations are billed per run in US dollars at FLORA's published model rates — the same rates as in the app. The Free plan includes $2.50 to try MCP; paid plans start at Starter. Current numbers: [flora.ai/pricing](https://refer.flora.ai/Tatiana).

---

## Links

- 🌱 **Sign up:** https://refer.flora.ai/Tatiana *(referral)*
- 📚 Official MCP docs: https://docs.flora.ai/mcp
- 🧠 Official skills repo: https://github.com/florafauna-ai/flora-mcp-skills
- 💬 FLORA Discord: https://discord.gg/METuPywABf

*This is an independent, community-maintained guide. Not affiliated with or endorsed by FLORA beyond the affiliate programme. Tool names verified against the live server in October 2026 — if something stops working, check [docs.flora.ai/mcp](https://docs.flora.ai/mcp) first.*

MIT licensed. PRs welcome — especially new recipes with measured numbers.
