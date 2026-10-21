# 05 · One creative → out-of-home mockups

**Measured (21 Oct 2026):** 4 placements on Nano Banana 2.1 image-to-image, fired at once · **$0.208** (4 × $0.052) + $0.002 QA · **all four done 20 s after submit**.

Source: the dripper hero from recipe 01, passed as a canvas reference (`reference_node_ids`), not re-described.

| Gable end | Bus shelter |
|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m172gpqe9t4t8m1p2wrtvr2jed8gpnbq-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17b9967q0tdhws8p7p5fpz5ms8gq8n2-0.png) |

| Metro platform | Construction hoarding |
|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17b0zd8mndyr9nm289pnnm5k98gpter-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m171s0x2gqgpde2ek59vbhyf418gqd6b-0.png) |

## The honest result: good previews, not faithful reproductions
A $0.002 judge pass comparing each mockup to the original:

> 2 (gable end): placement correct; FAIL — fold creases and wrinkle shading overlaid on the artwork.
> 3 (bus shelter): placement correct; FAIL — square artwork **stretched to the portrait panel**, proportions changed.
> 4 (metro): placement correct; FAIL — stretched to landscape.
> 5 (hoarding): placement correct; FAIL — stretched vertically, crop enlarged.

So: **a generative "place this poster" prompt gets you a convincing client preview for $0.05 a placement, but it does not reproduce the artwork pixel-for-pixel.** The model re-draws it to fit the surface. If the creative has already been signed off, that's a problem.

The official `flora-mockup-deck` skill exists precisely for this: it reproduces the artwork exactly (no regeneration) and uses `flora-image-resize` for the 1:1 / 4:5 / 9:16 social versions. Use the prompt below for sign-off-grade work; use the shortcut above when you need a quick "what would it look like" for a deck.

## Prompt (sign-off grade)
```
Here's our campaign key visual: <attach or paste a public URL>.
Follow https://raw.githubusercontent.com/florafauna-ai/flora-mcp-skills/main/skills/flora-mockup-deck/SKILL.md :
mock it up square-on on a gable end, a transit platform, a bus shelter and a construction hoarding, plus 1:1, 4:5 and 9:16 social resizes. Don't touch the artwork. Quote first; deliver a FLORA Deck.
```

## Prompt (quick preview, what we ran)
```
Use the dripper image on the canvas as the reference. Place it exactly as-is, unaltered, as a large printed poster on (a) the gable end of a brick building, (b) a bus shelter panel, (c) a metro platform wall, (d) a construction hoarding. Square-on, daylight, realistic, no text added. Fire all four at once; quote first.
```

## Gotchas
- "Exactly as-is, unaltered" in the prompt is not a guarantee; the judge caught distortion in all four.
- Placements are not re-rollable individually without paying again — approve the master creative before placing.
- Need a PDF instead of a FLORA Deck? Ask for the annotated A4 PDF delivery.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
