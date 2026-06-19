---
name: sprint-plan
description: 'Stage 2 of the Sprint Spine. Opt-in via explicit invocation. Dispatches ONE relevant specialist (CEO / Eng / Design / DevEx review) — not a parallel reviewer panel. Use `/sprint-autoplan` if you want sequential multi-review with auto-resolution of mechanical findings. Scope modes: Expansion / Selective Expansion / Hold Scope / Reduction.'
---

> **Opt-in skill.** Per the global Sprint Spine invocation discipline: one specialist per stage, not a parallel reviewer panel.

## When to use

Invoked by the orchestrator after `sprint-think` passes Gate 1 and before `sprint-build` starts. Catches scope drift, depth miscalibration, and audience mismatch *before* any content exists.

The orchestrator dispatches; the orchestrator does not plan the deliverable content itself.

## Process

1. Read `THINK.md` as input. Copy its named reader, 10/10 targets, rigor bar, and jargon budget into the Plan template.
2. **Default mode: ONE relevant specialist, single pass.** Pick the review type that fits the deliverable:
   - **CEO / founder review** for product / strategy framing — pressure the framing toward the most ambitious version actually worth building, not just the literal ask.
   - **Engineering review** for architecture / code / specs — lock in data flow, edge cases, tests.
   - **Design review** for UI / UX deliverables — score each design dimension against a concrete bar and revise toward the top of it.
   - **DevEx review** for API / CLI / SDK / docs deliverables — time to first working call, friction points, the moment the value lands.
   - **Domain expert** for jurisdiction-specific or regulator-facing work.

   Most deliverables warrant exactly ONE of these. Do not dispatch a panel by default.

   **Opt-in: `/sprint-autoplan`** — runs CEO → design → eng → DevEx in sequence with auto-resolution of mechanical convergent findings, surfacing only taste decisions for operator input. Use this when the deliverable explicitly warrants multi-perspective review (investor pitch, regulator submission, public launch artifact).

3. The reviewer (singular) drafts a section outline and per-section 0-10 rating bar with a "what a 10 looks like" concrete statement.
4. The orchestrator merges the reviewer output into one `PLAN.md` covering:
   - Section-by-section outline with per-section 10/10 target traits
   - Test matrix: what each section must prove, what would fail it
   - **Scope mode — pick one:**
     - **Expansion** — scope intentionally grows beyond Think's stated brief because new context emerged that justifies the expansion. Reader is informed; new sections enumerated.
     - **Selective Expansion** — scope grows in one section but contracts elsewhere (zero-sum). One thing replaces another with explicit rationale.
     - **Hold Scope** — Plan delivers exactly what Think asked for. The default and most common mode.
     - **Reduction** — Think was over-scoped; the Plan deliberately pulls in clear sections with explicit rationale.
   - Risk register: top 3 ways this artifact could waste the operator's time or embarrass on review.
   - Adversarial sanity check: run cross-model adversarial review via the [codex-adversarial](../codex-adversarial/SKILL.md) skill if available; otherwise dispatch an adversarial sub-agent with an explicit adversarial prompt.
5. **Auto-resolve mechanical convergent findings.** When two or more reviewers (in `/sprint-autoplan` mode) converge on a should-fix item that is mechanical (wording tightening, rigor-tag addition, missing section header, citation gap), apply it directly without surfacing — these are obvious in hindsight. Surface only **taste decisions** (genuinely contested calls between two reasonable approaches) for operator input.
6. Classify every reviewer finding: **must-fix / should-fix / acceptable-risk**. Must-fix items block Build; should-fix items get logged as known limitations in PLAN.md; acceptable-risk is ignored.

## Output

`PLAN.md` in the deliverable's directory. Contains outline, per-section 10/10 targets, test matrix, scope mode, risk register, adversarial check output, and classified findings. Input to `sprint-build` and the scoring reference for `sprint-test`.

## Gate

**Gate 2:** All must-fix items resolved before `sprint-build` starts. Should-fix items are noted, not blocking. If a must-fix cannot be resolved without operator input, surface a single targeted question rather than advancing with the gap open.
