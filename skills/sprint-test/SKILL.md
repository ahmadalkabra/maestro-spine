---
name: sprint-test
description: "Stage 5 of the Sprint Spine. Opt-in via explicit invocation. Non-code: optional Boomerang-style scorecard against THINK.md targets. Code: test-suite execution. Most deliverables don't need a formal Test stage — apply only when the deliverable's quality bar genuinely warrants score-then-iterate (regulatory submissions, investor pitches, contracts)."
---

> **Opt-in skill.** Most routine deliverables skip this stage. Per global Sprint Spine invocation discipline.

## When to use

Invoked by the orchestrator after `sprint-review` passes Gate 4. Runs before `sprint-ship`. Closes the loop: does the live artifact match the 10/10 definition locked in Think and Plan?

The Boomerang agent is distinct from builders. May be the same agents that ran Review, or a fresh pass — the orchestrator picks based on workload.

## Process

1. Read `THINK.md`, `PLAN.md`, the live artifact, and `REVIEW.md`.
2. For each section in the Plan outline, pull the pre-stated 10/10 target trait.
3. Dispatch the Boomerang agent to score each section 0-10 against its target. Record gap and recommendation per section into a `TEST.md` (or `BOOMERANG.md`) scorecard.
4. Compute the average score across all sections.
5. Apply the pass/fail rule:
   - Average ≥ 8 AND every section ≥ 6 → **PASS**. Advance to `sprint-ship`.
   - Average < 8 OR any section < 6 → **FAIL**. Return to `sprint-build` with a targeted gap list — name the specific section and the specific gap. Not "make it better." *"Section 3 executive summary, 6/10, gap: buries the decision under a three-sentence lead. Rewrite lead as one-sentence decision statement."*
6. If a second Boomerang fails after one Build iteration, escalate to the operator as NEEDS_CONTEXT — the 10/10 target may be miscalibrated or the builder cannot close the gap without additional input.

## Output

`TEST.md` (or `BOOMERANG.md`) in the deliverable's directory. Section scorecard grid (section / target / score / gap / recommendation), average score at the bottom, pass/fail verdict. Input to `sprint-ship` on pass, input to a second `sprint-build` iteration on fail.

## Gate

**Gate 5:** Boomerang PASS (average ≥ 8, every section ≥ 6) is required before `sprint-ship`. FAIL routes to `sprint-build` with the gap list. No override — if the operator wants to ship at < 8, they state that explicitly and the orchestrator logs it in STATUS.md as a scored-below-target ship.

## Quick-fix exemption

Edits under 200 words of text or under 20 lines of code bypass this stage.
