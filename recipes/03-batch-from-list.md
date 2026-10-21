# 03 · Batch from a list or CSV (20–500 assets)

**Law:** N items is **one** wait, not N waits. FLORA runs generations concurrently; a six-item batch fired together finishes in ~16 s vs ~150 s one-by-one (measured by the FLORA team).

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

Have a CSV? Attach it and say *"one image per row, column 'description' is the subject, column 'sku' is the label"*.

## What happens under the hood
1. One `flora_create_generations` call with up to 20 items (bigger lists → several calls)
2. Every `run_id` saved
3. One `flora_list_generations` poll for the whole batch, max(15, 2 × runs) seconds apart
4. Per-item outcome: done / failed (and whether failure is retryable)

## Gotchas
- A timed-out call may still have started runs. The agent must read history before re-firing — otherwise you pay twice.
- Polling faster than the rule returns 429s. Not a bug; slow down.
- Want the results tidy? *"Arrange them in a 5-column grid on the canvas"* → `flora_arrange_canvas`.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
