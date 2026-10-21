# 02 · Product photo → 5-second video

**Measured (21 Oct 2026):** Kling 2.5 Turbo Pro, 5 s, image-to-video · **$0.294** · **88 s** from submit to done. That's 5.7× the cost of the still it animated.

Source still below → **[▶ watch the 5-second MP4](https://media.flora.ai/node-inputs/2026/10/21/anonymous/24da6ee1-56ab-445e-a863-e9bee4d1d622.mp4?tr=orig)** (GitHub can't embed external video, so it opens in a new tab).

<img src="https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17dxrsrf9n2mzcxepkfazxnw98gq4cw-0.png" width="360" alt="Source still: coffee dripper">

## Prompt
```
Take the first image and animate it into a 5-second clip: slow 20° orbit around the dripper, studio lighting unchanged, nothing added to the scene.
Tell me the model and USD price before running. After it finishes, give me the canvas link and the MP4.
```

## What happened
1. `flora_list_models` with `model_id: i2v-kling-2.5` → the image input field is `image_url` (singular) and `duration` is `"5"` or `"10"`.
2. Quote → $0.294.
3. `flora_create_generations` with the FLORA-hosted image URL in `params.image_url`.
4. Polled every ~15–30 s; completed at 88 s (estimate said 150).

## Model price ladder (image-to-video, 5 s, as listed on this account)
| Model | Est. cost |
|---|---|
| Boreal | $0.11 |
| HeyGen Video 1.0 | $0.17 |
| **Kling 2.5 Turbo Pro** (used) | $0.29 |
| MiniMax H3 Max | $0.48 |
| Kling 3.0 Pro | $0.71 |
| Seedance 2.5 | $2.48 |

Pick from this ladder deliberately — the default the agent reaches for may be the $2.48 one.

## Gotchas
- Image inputs must be FLORA-hosted or allow-listed URLs. The URL returned by a previous generation works directly; an arbitrary CDN link usually doesn't — upload with `flora_create_asset` first.
- Video is where the free $2.50 disappears. Quote first, every time.
- Want 9:16 / 1:1 versions of the same clip? Ask for `flora-video-resize`; it reframes generatively instead of cropping.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
