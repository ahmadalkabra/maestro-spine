# Confidence Tags

*Every quantitative or comparative claim in a deliverable carries one of three tags. The tags force the writer to know which is which, and let the reader skip the parts that are guesses.*

---

## The three tags

| Tag | Meaning | Evidence required |
|---|---|---|
| `Confirmed` | Documented fact, verifiable now | Primary-source URL, document, or direct evidence cited inline |
| `Projected` | Modeled estimate or working hypothesis | Methodology disclosed; assumptions named inline |
| `Aspirational` | Strategic goal or target | Labeled as target, not commitment |

## When to apply

- **Every factual claim** in a deliverable, memo, deck, or external comm gets tagged explicitly.
- **Numbers, statistics, percentages, dates, named entities, regulatory positions, partnership status** all get tagged.
- **Strategic plans, roadmaps, forecasts** are marked `Projected` or `Aspirational`, never `Confirmed`.

## When NOT to apply

- Generic explanatory text where no factual claim is being made.
- Hypothetical scenarios in pre-mortems or devil's-advocate frames (the hypothetical itself is not a claim about reality).
- Internal procedural descriptions (e.g., *"the orchestrator dispatches the specialist"* — that is a procedural fact about the system, not a claim about external reality).

## Anti-pattern — secondary-source `Confirmed`

A common failure mode: a consultancy memo says *"Regulator X requires Y."* A news article echoes the consultancy. The agent tags Y as `Confirmed`. This is wrong. Secondary sources cannot upgrade a claim to `Confirmed`. The primary source (the regulator's own rulebook, with article number) is the only path to `Confirmed`.

## Worked example

A product strategy memo cites three claims:

1. *The incumbent's enterprise tier lists at $X per seat.* `Confirmed` — the vendor's public pricing page, captured inline with the date.
2. *Median time from signup to first activation is 14 days.* `Projected` — derived from the last six cohort reports; methodology and assumptions named in a footnote.
3. *The product will reach the activation threshold for its next growth tier within 18 months of launch.* `Aspirational` — labeled as target, not commitment.

A reader skimming for facts reads claim 1. A reader evaluating the model reads claim 2 with the assumptions. A reader evaluating the strategy reads claim 3 with no expectation of certainty. The tags make the right reading easy.

## Anti-pattern — tag-laundering

Watch for the inverse of secondary-source upgrade: a `Projected` claim that gets re-cited downstream as `Confirmed` because the citing document drops the tag. The fix is mechanical — citation should carry the original tag. Cross-section grep at Stage 4 Review catches the drop.

## Related conventions

- [`verification-iron-rule.md`](./verification-iron-rule.md) — `Confirmed` requires *fresh* evidence, not relayed prior verification. The verification rule and the tag system operate together.
- [`anti-slop-flag-list.md`](./anti-slop-flag-list.md) — unhedged numeric claims missing a tag are a flag class.

## Where this rule lives in the skills

The Sprint Spine Gate 3 (Claim-Tag Gate) runs a mechanical scan over the artifact. Every numeric claim, cited entity, regulatory reference, market sizing statement, and competitive assertion must carry a tag or an inline primary-source citation. One untagged claim auto-rejects the artifact back to Build with the specific line flagged. See [`../skills/sprint-build/SKILL.md`](../skills/sprint-build/SKILL.md) for the gate definition.

---

## Document control

- 2026-05-20 — Initial public scaffold.
