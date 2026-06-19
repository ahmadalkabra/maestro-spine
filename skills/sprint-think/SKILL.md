---
name: sprint-think
description: Stage 1 of the Sprint Spine. Opt-in via explicit `/sprint-think` invocation, not auto-fire. For deliverables that warrant rigor — regulatory submissions, investor pitches, contracts, public-facing comms. Default lean main-thread judgment for everything else. Produces a THINK.md via 6 forcing questions when warranted.
---

> **Opt-in skill.** Per the global Sprint Spine invocation discipline: default = lean main-thread judgment; invoke explicitly when deliverable rigor warrants.
>
> **Conventions referenced:** Verification Iron Rule (Q5 rigor bar per claim class), Confidence Tags rubric, Brain-First Lookup (check existing context before framing). Full conventions in `../../docs/`.

## When to use

Invoked by the orchestrator when the operator asks for a deliverable and no `THINK.md` exists next to it. Fires **before** `sprint-plan`. Skipped only if the operator types the explicit override "Skip Think, I know what I want" — log that override in the project's `STATUS.md`.

The orchestrator does not answer the Think questions. The orchestrator dispatches a Framing specialist (domain-appropriate sub-agent) to produce the Think.

## Process

1. Read the operator's literal request. Copy it into the Think as the stated ask.
2. Dispatch a Framing specialist sub-agent with the request and the Think template. The specialist answers the six forcing questions (plus an optional seventh for tooling work):
   - **Q1 — Who is this for?** Name the specific reader (role, context, prior knowledge, what they care about, what bores them). No named reader → stop and ask the operator.
   - **Q2 — What decision does this unblock?** The reader walks away and does what? "They will be informed" is rejected — every deliverable moves a decision.
   - **Q3 — Strongest evidence someone will use this?** Not "would find useful" — "would notice if it disappeared." Weak evidence → recommend scope reduction.
   - **Q4 — What does a 10/10 version look like?** Concrete traits per dimension (content, rigor, structure, depth, voice). "Good research memo" is not a 10/10 — name the specific one-sentence outcome.
   - **Q5 — Rigor bar per claim class.** State the split up front: which claim classes are `Confirmed` (primary source cited), `Projected` (model + assumption), `Aspirational` (goal, labeled).
   - **Q6 — Jargon budget.** Low / Medium / High. Reader-calibrated. Words outside the budget are flagged in Review.
   - **Q7 (optional, for tooling / CLI / data-product Frames only) — NOI (Non-Obvious Insight).** What is the *secret identity* of this thing — the non-obvious capability that justifies it existing as its own deliverable? Skip Q7 entirely for non-tooling deliverables.
3. Specialist also runs the **office-hours-style framing pushback** — challenge the framing itself before answering Q1-Q7. Three capability-extraction questions:
   - "Is this even the right deliverable shape, or would a different artifact (memo vs deck vs spec vs PRD vs decision pack) serve the named reader better?"
   - "What would the reader want that you are NOT planning to give them — and why?"
   - "What capability does the operator actually have that this deliverable is leaning on (a meeting on the calendar, a relationship, a system already running) — and is the deliverable shaped to use that capability?"
4. Specialist lists the reader's top 3 likely objections — these feed the Audience auditor in Stage 4.
5. The orchestrator reviews the Think for completeness (all six-plus-optional-seven questions answered, reader named, 10/10 concrete). If complete, the orchestrator signs and timestamps it.
6. Store the Think next to the deliverable (same directory as the target artifact).

## Output

`THINK.md` in the deliverable's directory. One page. Signed by the orchestrator. Dated YYYY-MM-DD. This file is the input to `sprint-plan` and the scoring reference for `sprint-test`.

## Gate

**Gate 1:** THINK.md must be signed before `sprint-plan` starts. A Think missing any of the six forcing questions, missing a named reader in Q1, missing concrete 10/10 traits in Q4, or missing the office-hours pushback does not pass. Q7 NOI is optional and only required for tooling/CLI/data-product Frames. Override language: the operator types "Skip Think, I know what I want" — the orchestrator honors it and logs the override in STATUS.md. Nothing else bypasses the gate.

## Quick-fix exemption

Edits under 200 words of text or under 20 lines of code bypass this stage. STATUS updates, internal tool calls, and routine lookups also bypass.
