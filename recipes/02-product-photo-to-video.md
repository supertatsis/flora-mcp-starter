# 02 · Hero still → 5-second motion poster

**Measured (21 Oct 2026):** Kling 3.0 Standard, 5 s, 9:16, image-to-video from the hero · **$0.529** · **63 s** from submit to done. 2.9× the cost of the still.

**[▶ Watch the clip](https://media.flora.ai/node-inputs/2026/10/21/anonymous/269ba451-890a-4b4d-ad52-ea5e03c4e5d6.mp4?tr=orig)** — the liquid swirls and shifts hue, bubbles rise, the caustics drift, one light sweep. Can and camera locked. (GitHub can't embed external video; it opens in a new tab.)

<img src="https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1700vvqf92v4nfcvyh2bbtq258gq7re-0.png" width="360" alt="Source still">

## The prompt to give your agent
```
Animate the hero into a 5-second 9:16 motion poster on Kling 3.0 Standard: locked camera, can perfectly still; the holographic liquid slowly swirls and shifts cyan→magenta→lime; tiny bubbles rise; caustics drift and shimmer; one slow light sweep across the can. No splashes, no text changes. Quote first.
```

## What happened under the hood
1. `flora_list_models` with `model_id: i2v-kling-v3-standard` → `image_url`, `aspect_ratio` (16:9 / 9:16 / 1:1), `duration` 3–15 s.
2. Quote → $0.529. Approval → run with the hero URL in `params.image_url`.
3. Poll ≥15 s apart; done at 63 s (estimate said 150).

## Image-to-video price ladder (5 s, as listed on this account)
| Model | Est. cost |
|---|---|
| Boreal | $0.11 |
| Kling 2.5 Turbo Pro | $0.29 |
| MiniMax H3 Max | $0.48 |
| **Kling 3.0 Standard** (used) | $0.53 |
| Kling 3.0 Pro | $0.71 |
| Seedance 2.5 | $2.48 |

Video is where a free $2.50 disappears. Pick from the ladder on purpose; the default an agent reaches for may be the $2.48 one.

## Gotchas
- "Locked camera, can still" in the prompt matters — without it, image-to-video models love to orbit.
- Image inputs must be FLORA-hosted or allow-listed URLs; a previous generation's URL works directly.
- Need 1:1 and 16:9 cuts of the same clip? Ask for `flora-video-resize` — generative reframing, not cropping.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan. The whole campaign on this page fits inside it.*
