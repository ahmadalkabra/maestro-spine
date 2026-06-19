# Anti-Slop Flag List

*Mechanically scored against external-facing deliverables at Stage 4 Review. Count flags per 1000 words.*

---

## The threshold

- **≤ 3 flags / 1000 words** → DONE
- **4 to 10 flags / 1000 words** → DONE_WITH_CONCERNS, ships with flag list documented
- **\> 10 flags / 1000 words** → BLOCKED, returns to Build with a scrub directive

Project-specific tightening is permitted. External-facing regulatory submissions and investor materials may tighten the DONE threshold to ≤ 2 flags / 1000 words.

## Flag categories

### Corporate vague-nouns

Replace with concrete verb + object, or delete:

`leverage`, `synergize` / `synergy`, `holistic`, `robust` (as filler), `cutting-edge`, `state-of-the-art`, `best-in-class`, `world-class`, `ecosystem` (figurative), `seamless`, `empower`, `streamline`, `facilitate`, `utilize` (use *use*), `unlock` (figurative), `drive` (as *cause*), `at scale` (unquantified).

### Hedging fillers

Commit or delete:

`may potentially`, `could possibly`, `often tends to`, `typically generally`, `in many cases`, `generally speaking`, `it could be argued`.

### Generic openers

Delete; replace with the actual point:

- *"In today's rapidly evolving [X] landscape..."*
- *"As the industry continues to..."*
- *"In an increasingly [X] world..."*
- *"Organizations today are faced with..."*

### Corporate passive

Convert to active, named subject:

- *"Solutions are provided"* → *"[Vendor] provides X"*
- *"Capabilities are delivered"* → *"[Team] delivers X"*
- *"Outcomes are achieved"* → *"[X] produces Y"*
- *"Value is created"* → *"[X] creates Y for [audience]"*

### Hedge patterns in recommendations

This flag class is internal to orchestrator output, not just deliverables. When the orchestrator surfaces a recommendation to the operator, the following patterns score as flags:

- *"I'm being conservative,"*
- *"I lean toward,"*
- *"X seems reasonable,"*
- *"could go either way,"*

Each phrase looks like analysis. Each one pushes the actual decision back onto the operator without new information. State the actual pick. When a recommendation has a boundary tension (a security policy, a reversibility concern), name the tension directly: *"I'd do X, but policy correctly blocks it, so this needs your keystroke."* Either is fine. Hedging in advance is not.

This flag class exists because hedged recommendations can look analytical while pushing the actual decision back onto the operator. The review rule is simple: state the pick, then state any boundary tension plainly.

## Exceptions

- Tagged direct quotes (regulator language, third-party competitive quotes).
- Deliberate rhetorical inversion (e.g., parodying corporate-speak in a critique).

## How to apply

- **Stage 4 Review** runs the scrub mechanically — no manual review needed for the listed terms.
- **For external-comms deliverables** (regulator submission, investor deck, public-positioning) — the author runs the scrub against this list pre-Review, so Review confirms rather than discovers.
- **For internal memos / strategy / research** — author best-effort scrub; reviewer catches in Stage 4.

## Worked example

A 1500-word strategy memo on a vendor decision contains:

- *"leverage best-in-class capabilities"* — two flags (corporate vague-nouns: `leverage`, `best-in-class`)
- *"may potentially deliver"* — one flag (hedging filler)
- *"In today's rapidly evolving AI landscape"* — one flag (generic opener)
- *"Solutions are provided by the vendor"* — one flag (corporate passive)
- *"I lean toward Vendor A"* — one flag (hedge pattern in recommendation)

Total: six flags in 1500 words = 4 flags / 1000 words. Threshold = DONE_WITH_CONCERNS. The memo ships with the flag list documented and the author has the data to tighten the next iteration.

If the same memo had ten flags in 1500 words (~6.7 / 1000): still DONE_WITH_CONCERNS but with a stronger scrub recommendation. If sixteen flags (~10.7 / 1000): BLOCKED, returns to Build.

## Related conventions

- [`confidence-tags.md`](./confidence-tags.md) — unhedged numeric claims missing a tag are a different failure class but pair with anti-slop in external-comms quality.
- [`verification-iron-rule.md`](./verification-iron-rule.md) — the verification stack catches factual gaps; anti-slop catches voice gaps. Both apply.

## Where this rule lives in the skills

The Stage 4 Audience auditor in [`../skills/sprint-review/SKILL.md`](../skills/sprint-review/SKILL.md) runs this list mechanically.

---

## Document control

- 2026-05-20 — Initial public scaffold.
