---
name: sprint-autoplan
description: Opt-in multi-perspective planning gauntlet — the heavier alternative to sprint-plan's single-specialist default. Runs the relevant review lenses SEQUENTIALLY (CEO → Design → Eng → DevEx, never parallel), auto-resolving convergent findings and surfacing only the decisions that genuinely need the operator. Use when a deliverable explicitly warrants multi-lens rigor (investor pitch, regulatory submission, public launch artifact, architecture-heavy build).
---

> **Opt-in skill.** The escalation from `sprint-plan`. This is NOT the default and must not auto-fire — multi-lens review is a cost, justified only when the deliverable earns it.

## When to use

`sprint-plan` dispatches ONE specialist by default (the lean path). Use `sprint-autoplan` instead when multiple review lenses would each materially change the plan:
- investor pitch / regulatory submission / public launch artifact / contract
- architecture-heavy build touching multiple concerns

The orchestrator dispatches the lenses; it does not perform the reviews itself.

## Process

1. Read `THINK.md` and the draft `PLAN.md`. Identify which lenses are RELEVANT — don't run a lens that doesn't apply (a backend build has no design surface; a writing-only memo has no DevEx surface).
2. **Run the relevant lenses SEQUENTIALLY, never parallel** — each later lens sees the prior lens's output, so the plan compounds rather than fragments:
   - **CEO/founder** — 10-star reframe, scope mode, prioritization, killer assumption (per [ceo-review](../ceo-review/SKILL.md)).
   - **Design** — UI-scope gate first (exit if no UI surface); design rubric; mockup-before-approve where UI exists (per [design-review](../design-review/SKILL.md)).
   - **Eng** — architecture, edge cases, test plan (affected paths + a regression rule), performance.
   - **DevEx** — only for developer-facing API / CLI / SDK / docs: time-to-first-working-call + the friction map.
3. **Auto-resolve intermediate findings**, classifying each:
   - **Mechanical** — one defensible answer (naming, DRY consolidation, an obvious omission). Decide silently; log it.
   - **Taste** — defensible either way. Decide WITH a stated recommendation; surface at the final gate, not mid-stream.
   - **User-Challenge** — the lenses think the operator's stated direction should change. NEVER auto-decide. Carry to the final gate framed with the cost of being wrong.
   Tiebreakers: choose completeness, do the whole thing, pragmatic over clever, DRY, explicit over implicit, bias to action.
4. Merge all lens outputs into ONE consolidated `PLAN.md`, with Taste decisions and User-Challenges collected for the gate.

## Output

One consolidated `PLAN.md` plus a final-gate summary:
- **Mechanical decisions** — already applied (FYI, no action).
- **Taste decisions** — each with the call + one-line why (overridable).
- **User-Challenges** — each as a single decision carrying the cost of being wrong.

Every surfaced item carries a recommendation; the operator answers only the User-Challenges plus any Taste override.

## Gate

**Gate 2 (multi-lens variant):** advances to `sprint-build` once the consolidated `PLAN.md` exists and any User-Challenges are resolved. An unresolved User-Challenge makes the plan NEEDS_CONTEXT — surface the single decision, do not proceed.

## Document control

- 2026-06-01 — Initial public scaffold.
