# 03 · Batch from a list (5 products, one wait)

**Measured (21 Oct 2026):** 5 products + 1 hero on Nano Banana 2.1, fired in one call · **$0.312** (6 × $0.052) · **all six done 25 s after submit**. Individual runs took 16–25 s, so sequential would have been ~2 minutes.

| PO-01 | WB-04 | AP-09 |
|---|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17bkmzaqtdt4xfsyxdsn6ge858gqzpn-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m174386vbe3p5959z04s9h515s8gqfv0-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m178svvhr2m7z2d1aqzb7n7jhs8gq8c4-0.png) |

| CB-02 | SB-03 |
|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17br6jjkxd7spz8sezk3ec5cn8gp269-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17dd1nkbzyq3grbsemh8fq3rh8gpr97-0.png) |

**Law:** N items is **one** wait, not N waits. FLORA runs generations concurrently; the serialisation is on the agent's side.

## Prompt
```
Read https://raw.githubusercontent.com/florafauna-ai/flora-mcp-skills/main/skills/flora-batch-generate/SKILL.md and follow it for these products:

  PO-01  matte black ceramic pour-over coffee dripper
  WB-04  brushed steel insulated water bottle
  AP-09  folded oatmeal linen apron
  CB-02  rectangular walnut cutting board
  SB-03  stack of three speckled stoneware bowls

One consistent studio style across all five: seamless warm-grey backdrop, soft softbox from camera left, subtle contact shadow, 85mm, centred, no props.
Quote the total in USD first. After the run, list what failed and why.
```

## The gotcha we paid for: SKU codes end up printed on the product
The first run put the SKU in each prompt ("PO-01: a matte black…"). A $0.002 QA pass with an image-to-text judge (Claude Haiku 5.5, six images in one call) found:

> 2. Matte black dripper … with an **embossed SKU code** on the base. FAIL.
> 3. Brushed steel bottle … with a **printed SKU across the lower body**. FAIL.
> 4. Folded linen apron **with a hang tag** carrying printed text. FAIL.
> 5. Walnut board shot low and off-axis, darker gradient band across the bottom. FAIL.
> 6. Stack of bowls … clean seamless backdrop. PASS.

Three of five had the label rendered onto the product. **Keep SKUs in your own bookkeeping, not in the prompt** — or add "no text, no labels, no tags" to the style sentence. Lighting direction and backdrop tone were consistent across all six, so the style lock worked; only the per-item line leaked.

## What happened
1. One `flora_create_generations` call with six items (max 20 per call).
2. Every `run_id` saved.
3. One `flora_list_generations` poll ~20 s later → all six complete.
4. One `i2t` judge call over all six URLs (`image_urls` array) for the QA above.

## Gotchas
- A timed-out call may still have started runs. Read history before re-firing or you pay twice.
- Polling faster than max(15, 2 × runs) seconds returns 429s.
- Want the results tidy? *"Arrange them in a grid on the canvas"* → `flora_arrange_canvas`.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
