---
name: sprint-review
description: 'Stage 4 of the Sprint Spine. Opt-in via explicit invocation. Dispatches ONE specialist matched to the deliverable type — not a parallel reviewer panel. Outputs completion state: DONE, DONE_WITH_CONCERNS, BLOCKED, NEEDS_CONTEXT.'
---

> **Opt-in skill.** Per the global Sprint Spine invocation discipline: one specialist per stage.
>
> **Conventions referenced:** Anti-Slop Flag List (threshold math + flag categories), Verification Iron Rule (claim hygiene in review), Confidence Tags (per-claim labels). See `../../docs/`.

## When to use

Invoked **only when warranted** for high-stakes deliverables — public-launch artifacts, regulatory submissions, investor pitches, contract drafts. Default for routine work: the orchestrator reads carefully in main thread and ships, no formal review stage.

When invoked, the reviewer must be independent of the builder. A specialist who built section X cannot review section X.

## Process

1. Read THINK.md (if exists), PLAN.md (if exists), the artifact, and BUILD-NOTES.md (if exists). Write findings into `REVIEW.md` next to the deliverable.
2. **Dispatch ONE specialist matched to the deliverable type.** Single pass, not a panel:

   - **For code work** → Staff Engineer review. Looks for bugs, N+1 queries, injection risks, missing edge cases, error handling. For security-sensitive code, dispatch a security review instead/additionally.
   - **For UI / UX deliverables** → Senior Designer review. Scores each design dimension against a concrete bar, revises toward the top of it, flags AI slop.
   - **For API / CLI / SDK / docs** → DevEx Tester. Live-test the docs, measure time to first working call, friction points, and whether the value moment lands.
   - **For research memos / strategy / regulatory analyses** → Domain rigor auditor. Primary-source verification, claim provenance, regulatory framing.
   - **For external comms / pitches / decks** → Audience auditor. Reads as the THINK Q1 named reader. Anti-slop scan against the [Anti-Slop Flag List](../../docs/anti-slop-flag-list.md). Jargon budget check. Top-3-objections coverage.

   **Opt-in for multi-perspective:** an autoplan variant chains Staff Eng + Designer + DevEx review in sequence with auto-resolution of mechanical convergent findings. Reserved for deliverables where multi-perspective genuinely earns its cost.

3. The reviewer classifies findings: **must-fix / should-fix / acceptable-risk**.
4. Apply the anti-slop threshold mechanically (when audience review applies): ≤ 3 flags / 1000w → DONE; 4-10 → DONE_WITH_CONCERNS; > 10 → BLOCKED with scrub directive.
5. Surface findings as the overall completion state.

## Output

`REVIEW.md` in the deliverable's directory with one of four completion states:

- **DONE** — zero must-fix items, anti-slop ≤ 3 flags per 1000 words. Ships to the operator as-is after Test.
- **DONE_WITH_CONCERNS** — no must-fix items, but should-fix items or 4-10 anti-slop flags present. Ships to the operator after Test with a concerns list prepended. Honest signaling.
- **BLOCKED** — one or more must-fix items, or anti-slop > 10 flags. Cannot ship. The orchestrator returns to `sprint-build` with the must-fix list and scrub directive.
- **NEEDS_CONTEXT** — a question surfaced by a reviewer that only the operator can answer (e.g., missing scope decision, unresolved source conflict). The orchestrator surfaces the single targeted question to the operator — not the draft, not "thoughts?", just the question.

## Gate

**Gate 4:** Artifact does not reach the operator until state ≥ DONE_WITH_CONCERNS. BLOCKED routes back to Build. NEEDS_CONTEXT routes to the operator as a single question. Only DONE or DONE_WITH_CONCERNS advances to `sprint-test`.
