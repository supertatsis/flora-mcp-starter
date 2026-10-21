# 04 · Refine until it's right (without burning money)

**Law:** re-running the same prompt is not a refinement. Name the defect, change the prompt, stop when the defect stops moving.

## Prompt
```
Generate a single white ceramic mug on a plain black surface. Handle pointing right, top-down bird's-eye view, no other objects.
Then follow https://raw.githubusercontent.com/florafauna-ai/flora-mcp-skills/main/skills/flora-refine-loop/SKILL.md : judge the result against that description, name the specific defect, fix the prompt, and repeat. Max 3 rounds, quote each round.
```

## How to tell the skill fired
- It should **refuse** a bare "try again" and ask what "right" means.
- It uses a free vision judge to score each candidate — the judging is $0; only generations cost.
- It stops early when the same defect survives a real prompt change (e.g. clock hands — models are bad at these) and hands you options instead of round 4.

---
*Need a FLORA account? [Sign up free](https://refer.flora.ai/Tatiana) — referral link, $2.50 of usage included on the free plan.*
