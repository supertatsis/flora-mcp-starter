# 01 · Your first image

**Measured (21 Oct 2026):** Nano Banana 2.1 · **$0.052** · **25 s** from submit to done.

![Coffee dripper, first image](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17dxrsrf9n2mzcxepkfazxnw98gq4cw-0.png)

## Prompt
```
Create a FLORA project called "Starter test".
Quote the cost of one 1:1 image: "a matte black ceramic pour-over coffee dripper on a warm grey seamless backdrop, soft softbox from camera left, subtle contact shadow, 85mm, centred, no props".
Show me the USD price and the model you picked. Only generate after I say yes, then give me the canvas link.
```

## What happened
1. `flora_list_workspaces` → two workspaces came back, so the agent asked which to bill (balances differ: $0.66 vs $441).
2. `flora_create_project` → empty canvas.
3. `flora_create_generations` with `quote: true` → $0.052, quote valid 5 minutes.
4. Approval → same call without `quote`. `charged_cost` came back `0` at submit and `0.052` once complete.
5. `flora_list_generations` with the `run_id` → image URL + `canvas_url`.

## Gotchas
- The quote is an estimate and expires in 5 minutes; the final charge matched it exactly here.
- `charged_cost: 0` in the submit response is not "free" — it's "not finished yet". Read it again after completion.
- Failed runs aren't charged. A retry is a new run and is billed again.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
