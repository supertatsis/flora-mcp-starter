# 04 · Refine until right — and know when to stop

**Measured (21 Oct 2026):** 2 rounds on Nano Banana Pro · **$0.362** (2 × $0.18 + 2 × $0.001 judge) · stopped by the rule, not by the budget.

**Law:** re-running the same prompt is not a refinement. Name the defect, change the prompt, and **stop when the same defect survives a real prompt change** — that's a model limitation, not a bad roll.

## What happened
| Round | Change | Judge verdict | Cost |
|---|---|---|---|
| 1 | hero prompt (recipe 01) | **fail** — caustics "streak to the frame edges"; wordmark "bold rounded, not thin geometric"; also flagged condensation and bubbles *that I'd asked for* | $0.181 |
| 2 | "set wordmark in a THIN light geometric sans; confine caustics to a pool in front of the can; nothing else changes" | **fail** — caustics "still reach the frame edges"; wordmark "not clearly thin" | $0.181 |

Same defect twice → stop. I kept **round 1** as the hero: the wide caustic is the best thing in the frame, and the judge was enforcing a goal I'd written too tightly.

Round 1 · ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1700vvqf92v4nfcvyh2bbtq258gq7re-0.png) Round 2 · ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17c8fsv9zq30h1zmbr5365s1s8gqeqc-0.png)

## Two lessons that cost $0.36
1. **The judge grades the goal you wrote, not the picture you wanted.** It failed condensation because my goal text didn't mention condensation. Write the goal to include everything you *do* want, or the loop will try to remove it.
2. **Stop on a repeated defect.** The official `flora-refine-loop` skill says exactly this and it held: round 3 would have been $0.18 for a differently-wrong image.

## The prompt to give your agent
```
Judge the hero against this goal: <paste goal>. Name the single biggest defect, change only that in the prompt, re-run once on the same model, judge again. If the same defect comes back, stop and show me both rounds. Max 3 rounds; quote each.
```

## Judge details
- Model: `i2t-claude-haiku-5-5`, **$0.001 per look**, 6–10 s. The official skill lists Gemini Flash judges as free; on this account they're $0.0045–$0.05 — check `flora_list_models` `type: text`.
- Parameter is **`image_urls`, plural, array**. Singular is silently ignored and the judge rules blind.
- Prompt shape: *describe first, then verdict*, JSON out, strip fences before parsing.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan. The whole campaign on this page fits inside it.*
