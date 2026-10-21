# 04 · Refine until it's right (without burning money)

**Measured (21 Oct 2026):** goal met in **2 rounds** · **$0.010 total** (2 × $0.004 Flux 2 Klein 4B + 2 × $0.001 Claude Haiku 5.5 judge) · 8 s per generation, 6–70 s per judge call (the second judge call queued).

**Law:** re-running the same prompt is not a refinement. Name the defect, change the prompt, stop when the defect stops moving.

## Goal
> A single white ceramic mug on a plain black surface. Handle points RIGHT. Top-down bird's-eye view. No other objects, no text.

## What happened
| Round | Prompt | Judge verdict | Cost |
|---|---|---|---|
| 1 | "a white ceramic mug on a black surface" | **fail** — "camera angle is side/eye-level, not top-down"; "black textured fabric with lint specks rather than a plain surface" | $0.005 |
| 2 | round 1 + judge's fix: "…plain seamless matte black surface, handle pointing right. Straight top-down bird's-eye view looking directly down. No fabric texture, no lint…" | **pass** — 0 defects | $0.005 |

Round 1 · ![](https://media.flora.ai/node-inputs/2026/10/21/anonymous/1abfb003-0b9e-468c-823f-1d8dd424ff4c.png) Round 2 · ![](https://media.flora.ai/node-inputs/2026/10/21/anonymous/55cd096d-1e26-40be-9097-1d64ba2861a1.png)

## Prompt
```
Generate a single white ceramic mug on a plain black surface. Handle pointing right, top-down bird's-eye view, no other objects.
Then follow https://raw.githubusercontent.com/florafauna-ai/flora-mcp-skills/main/skills/flora-refine-loop/SKILL.md : judge the result against that description, name the specific defect, fix the prompt, and repeat. Max 3 rounds, quote each round.
```

## What we learned that the official skill doesn't say
- The official skill lists Gemini Flash judges as **0 credits**. On this account they were $0.0045–$0.05. The cheapest image-to-text model was **Claude Haiku 5.5 at $0.001** — use `flora_list_models` with `type: text` and check `estimated_cost_usd` rather than trusting a list.
- For `i2t` models the image parameter is **`image_urls` (plural, array)**. Singular `image_url` is accepted and silently ignored — the judge then rules blind and passes everything.
- Make the judge **describe before it rules** (`observed` field first). It caught the lint-on-fabric defect that a verdict-only prompt would have missed.
- Tune the prompt on a $0.004 model, then run the final on the expensive one. GPT Image / Seedream Pro are 40× the price.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
