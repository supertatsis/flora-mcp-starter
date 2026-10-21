# 03 · Five editions, one wait

**Measured (21 Oct 2026):** 5 Spectrum editions on Nano Banana Pro image-to-image, fired in one call · **$0.90** (5 × $0.18) · **all five done 38 s after submit** (individual runs 29–38 s; sequential would have been ~3 minutes).

| SPECTRUM 01 | SPECTRUM 02 | SPECTRUM 03 |
|---|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17da57596tt7s6td30b3y7sfn8gqfnt-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m177hkam4zmx583p4sewrf2rdh8gpapw-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m173rqjrv3a6tejfd8rmd2ymsh8gqtm5-0.png) |

| SPECTRUM 04 | SPECTRUM 05 | Hero (reference) |
|---|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17bg1s26d6dja6y7819psqcgn8gpdvn-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1723m1vazkjscpwaey6sd94g98gph2b-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1700vvqf92v4nfcvyh2bbtq258gq7re-0.png) |

A $0.004 judge pass over all six: **5/5 PASS** — "composition, camera angle, can, surface, lighting and wordmark are consistent; only the liquid colour and sub-line change."

**Law:** N items is **one** wait, not N waits. FLORA runs generations concurrently; the serialisation is on the agent's side.

## The prompt to give your agent
```
Using the hero as the reference image, make five Spectrum editions as ONE batch on Nano Banana Pro (image-to-image, 2K, 4:5). Keep composition, camera, surface, lighting, can and wordmark identical; change only the liquid and its caustics:
  01 electric cyan → deep teal
  02 hot magenta → soft pink
  03 acid lime → pale yellow
  04 deep violet → ultraviolet blue
  05 warm amber → molten orange
Add a tiny second line under the wordmark: "SPECTRUM 0N". Quote the total in USD first; after the run, judge all five against the hero and tell me what drifted.
```

## Per-item prompt (what was actually sent)
```
Keep the reference image's exact composition, camera, mirror-black surface, lighting, can shape, condensation and the small white 'HOLA COLA' wordmark. Change ONLY the liquid inside the can and its caustics to a single-hue edition: electric cyan to deep teal, with subtle iridescent highlights. Add a tiny second line under the wordmark in the same minimal sans: 'SPECTRUM 01'. Nothing else changes; no other text.
```

## Why this worked when my first batch didn't
An earlier test batch (five kitchen products, text-to-image) put SKU codes at the start of each prompt — and the model printed them onto the products. Here the edition label is *meant* to be on the can, so it goes in the prompt deliberately, as the last instruction, in a defined place. The rule: **text in the prompt ends up in the picture; decide where you want it.**

## What happened under the hood
1. One `flora_create_generations` call, five items, each with the hero's URL in `params.image_url`.
2. Every `run_id` saved; one `flora_list_generations` poll ~40 s later.
3. One image-to-text judge call with all six URLs in `image_urls` for the set check.

## Gotchas
- Lock the style sentence; vary only the one line per item.
- A timed-out call may still have started runs — read history before re-firing, or you pay twice.
- Want them tidy? *"Arrange the six in a row on the canvas"* → `flora_arrange_canvas`.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan. The whole campaign on this page fits inside it.*
