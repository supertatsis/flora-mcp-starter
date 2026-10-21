# 01 · The hero: one image that sets the world

**Measured (21 Oct 2026):** Nano Banana Pro, 2K, 4:5, image-to-image from a reference can · **$0.18** · **34 s** from submit to done.

<img src="https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m1700vvqf92v4nfcvyh2bbtq258gq7re-0.png" width="520" alt="Hola Cola hero — transparent can of spectral liquid on mirror-black glass">

## What went in
A reference image of the product (my own transparent-can concept, generated earlier on a FLORA canvas) and one prompt. The reference carries the can shape, transparency, condensation and the holographic liquid; the prompt sets the world and swaps the wordmark.

```
Use the reference can exactly for its shape, transparency, condensation and the holographic spectral liquid inside. REPLACE the script wordmark with a small, minimal, geometric uppercase sans-serif 'HOLA COLA' printed in white on the can, nothing else written.
Editorial hero: the single can standing on a seamless mirror-black glass surface, perfectly centred, slight low angle. One soft overhead strip light; the spectral liquid throws cyan-magenta-lime caustics onto the black surface in front of the can. Background a very dark grey-lavender haze. Minimalist, futuristic, premium, quiet; fine film grain; no splashes, no extra props, no other text.
```

## The prompt to give your agent
```
Create a FLORA project called "Hola Cola". Use <this image URL> as the reference and quote one 2K 4:5 hero on Nano Banana Pro (image-to-image) with the prompt above. Show me the USD price; only generate after I approve, then give me the canvas link.
```

## What happened under the hood
1. `flora_list_workspaces` → two workspaces, agent asks which to bill.
2. `flora_create_project`.
3. `flora_list_models` with `model_id: i2i-gemini-3-pro` → the image input is `image_url`; `resolution` takes `1K/2K/4K`; `aspect_ratio` takes `4:5`.
4. `flora_create_generations` with `quote: true` → $0.18. Approval → run.
5. `flora_list_generations` → image + `canvas_url`.

## The second candidate (same price, different world)
I ran one alternative to choose from — top-down, airy, refrigerated haze. Same reference, same model, $0.18:

<img src="https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17bnbvkgtkt4qxmwqwsh0x0ph8gpnct-0.png" width="420" alt="Alternative hero — top-down on pale lavender">

Two candidates for $0.36 and a human choosing is cheaper than one candidate and three blind re-rolls.

## Gotchas
- **A reference image beats a paragraph.** Describing "transparent can with holographic liquid" from scratch gives you a different can every time; passing `image_url` locks it.
- "Replace the wordmark" works on Nano Banana Pro; it rendered clean geometric type on a curved transparent surface in one go. Cheaper models tend to garble text on curved surfaces.
- 2K costs the same as 1K on this model; 4K too. Ask for 2K by default — it's what the OOH mockups and video are built from.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan. The whole campaign on this page fits inside it.*
