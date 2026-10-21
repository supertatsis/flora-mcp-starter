# 05 · Hero → out-of-home, at night

**Measured (21 Oct 2026):** 3 placements on Nano Banana Pro image-to-image, fired at once · **$0.54** (3 × $0.18) · **all three done 35 s after submit**.

<img src="https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17bdr699t5hzhnvtd6annk7qn8gqsb0-0.png" width="520" alt="Glass facade screen at night">

| Bus shelter, rain | Metro platform |
|---|---|
| ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m173zved4h8vezw208z3gq7wt98gp4kd-0.png) | ![](https://media.flora.ai/node-inputs/2026/10/21/px7ewxkd7hftt3sq4x5a3jztkn7v9ptc/gen-m17d6n12mtwtr9dz72smwt3h758gqkda-0.png) |

Judge pass ($0.004, same call as the batch check): **facade PASS, metro PASS, bus shelter FAIL** — "artwork cropped: floor reflection and light streaks removed, can enlarged within the frame." Two of three reproduced the hero faithfully; one re-composed it. That ratio is typical for generative placement, and it's why there are three here and not four: the fourth would have been the re-roll.

## The prompt to give your agent
```
Place the hero, unaltered and uncropped, as (a) a backlit bus-shelter panel on a rain-wet street at night, (b) a large portrait screen on a minimalist glass facade at night with one passer-by for scale, (c) a poster on an empty metro platform wall. Square-on, 35mm film grain, realistic, no added text. Fire all three as one batch; quote first; then judge each against the hero and flag any that altered the artwork.
```

## Per-placement prompt (facade, what was actually sent)
```
Photograph of a large portrait digital screen on the glass facade of a minimalist modern building at night, displaying the reference image EXACTLY, unaltered and uncropped. The screen's spectral light reflects in the glass and on the wet pavement below; one silhouetted passer-by for scale; deep blue night, light haze. Square-on view from street level. Shot on 35mm film, fine grain, realistic, no added text.
```

## Preview vs sign-off
These are **previews**: convincing for a deck, not pixel-exact. When the artwork is already approved and must not change, use the official `flora-mockup-deck` skill, which composites the artwork rather than regenerating it, and `flora-image-resize` for 1:1 / 4:5 / 9:16 social cuts:
```
Follow https://raw.githubusercontent.com/florafauna-ai/flora-mcp-skills/main/skills/flora-mockup-deck/SKILL.md with the hero. Don't touch the artwork. Quote first; deliver a FLORA Deck.
```

## Gotchas
- "EXACTLY, unaltered and uncropped" in caps helps but is not a guarantee — judge every placement.
- Night + wet surfaces hide the seams generative placement leaves in daylight. If a daytime mockup looks fake, that's often why.
- Placements aren't re-rollable individually without paying again; approve the hero before placing.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan. The whole campaign on this page fits inside it.*
