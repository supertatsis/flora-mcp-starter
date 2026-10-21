# 01 · Your first image (≈ 2 minutes, usually under $0.10)

**Goal:** go from a connected agent to one image sitting on a FLORA canvas, without surprises on the bill.

## Prompt
```
Create a FLORA project called "Starter test".
Quote the cost of one 1:1 image: "a matte black ceramic pour-over coffee dripper on a warm grey seamless backdrop, soft softbox from camera left, subtle contact shadow, 85mm, centred, no props".
Show me the USD price and the model you picked. Only generate after I say yes, then give me the canvas link.
```

## What happens under the hood
1. `flora_list_workspaces` → picks or asks which workspace to bill
2. `flora_create_project` → empty canvas
3. `flora_list_models` → chooses a text-to-image model, reads `estimated_cost_usd`
4. `flora_create_generations` with `quote: true` → shows you the price
5. You approve → same call without `quote`
6. `flora_list_generations` with the `run_id` → result + `canvas_url`

## Gotchas
- If the agent quotes in "credits", it's ignoring FLORA's rules. Ask for USD.
- Failed runs are not charged. A retry is a new run and is billed again.
- Results open at the `canvas_url` returned — the agent should never invent a project URL.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
