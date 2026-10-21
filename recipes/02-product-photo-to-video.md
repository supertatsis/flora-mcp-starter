# 02 · Product photo → 5-second video

**Goal:** animate a photo you already have. Video costs 30–90× a still, so the quote step matters here.

## Prompt
```
Here's a product photo: <paste a public image URL, or attach the file>.
Upload it to FLORA, then quote a 5-second 16:9 video of it: slow 20° orbit, studio lighting unchanged, nothing added to the scene.
Tell me the model and USD price before running. After it finishes, give me the canvas link and the MP4.
```

## What happens under the hood
1. `flora_create_asset` — from a URL, or `source: "signed-url"` + an upload page for a local file → `flora_complete_asset`
2. `flora_list_models` with the video `model_id` → reads the name of the image input field
3. `flora_create_generations` with `quote: true`, the asset URL in `params`
4. Approval → run → `flora_list_generations` (video runs take tens of seconds; poll ≥15 s apart)

## Gotchas
- Image inputs must be FLORA-hosted or allow-listed URLs. Upload first; don't paste random CDN links.
- If the product looks "re-imagined" rather than animated, ask for a reference-locked model or an image-to-video model with lower motion strength.
- Want 9:16 / 1:1 versions of the same clip? Ask for `flora-video-resize` — it reframes generatively instead of cropping.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
