# The operating model

*The loop, the spine, the discipline. This is how the methodology runs end to end.*

---

## Why a loop, not an agent

The mental model most people start with is *AI agent writes the work, operator reviews it*. That model collapses under load. It fails the moment you run multiple projects in parallel. It fails harder the moment one of those projects has to defend every claim it makes to an external party.

What replaces that mental model is a loop — a gated deliverable pipeline that every output moves through, with the same discipline applied whether the deliverable is a spec, a memo, a deck, a code change, or a regulator-facing document. The loop has a name: the **Sprint Spine**. Seven stages, six gates.

```
Think  →G1→  Plan  →G2→  Build  →G3→  Review  →G4→  Test  →G5→  Ship  →G6→  Reflect
```

Each stage has a stop condition. You do not ship Build until Review passes. You do not open Review until Plan locks the open questions. You do not start Plan until Think has named the reader and the decision the artifact is supposed to unblock.

## The seven stages

**Think (Stage 1).** Frame the deliverable. Six forcing questions, plus an optional seventh for tooling work: who is this for, what decision does it unblock, what is the strongest evidence someone will use it, what does a 10/10 version look like, what is the rigor bar per claim class, what is the jargon budget. Office-hours framing pushback runs before the questions get answered, to catch deliverable-shape misalignment early. Output is a `THINK.md` next to the deliverable.

**Plan (Stage 2).** One specialist reviews the Think doc and drafts a section-by-section outline with per-section 10/10 target traits, a test matrix, a scope mode (Expansion / Selective Expansion / Hold Scope / Reduction), a risk register, and a classified list of open questions (must-fix / should-fix / acceptable-risk). Output is a `PLAN.md`.

**Build (Stage 3).** Specialist builders write the artifact, one per section. Every factual claim carries an inline confidence tag (`Confirmed` / `Projected` / `Aspirational`). A `BUILD-NOTES.md` captures decisions, what is still open, what was tried and failed, and what was skipped per scope. The orchestrator does not build — that is a role violation (see [CoS Role Discipline](#chief-of-staff-role-discipline)). The orchestrator dispatches builders and packages output.

**Review (Stage 4).** One primary specialist, matched to the deliverable type, reads the artifact independently of whoever built it. Findings are classified must-fix / should-fix / acceptable-risk. External-facing deliverables also get a mechanical pass: the Audience auditor runs an anti-slop scan against the [Anti-Slop Flag List](./anti-slop-flag-list.md) with a numeric threshold. Output is a `REVIEW.md` with one of four completion states: DONE, DONE_WITH_CONCERNS, BLOCKED, NEEDS_CONTEXT.

**Test (Stage 5).** Optional. For deliverables where the quality bar warrants score-then-iterate (regulatory submissions, investor pitches, contracts), a Boomerang agent scores each section 0-10 against its pre-stated 10/10 target. Average must hit eight, every section must hit six, or the artifact returns to Build with a targeted gap list. Most routine deliverables skip this stage.

**Ship (Stage 6).** The orchestrator commits the artifact alongside its lifecycle companions (THINK, PLAN, BUILD-NOTES, REVIEW, TEST) — where local repo policy permits commits; otherwise it prepares the commit package and asks first — writes the commit message, asks once about push, and reports a three-bullet summary. No deck walkthroughs in chat.

**Reflect (Stage 7).** Drift sweep over docs that reference the new artifact: cited line numbers still resolve, section headers still exist, named claims still match. Update STATUS, DECISIONS-LOG, and memory entries that cite the artifact. Append one structured learning record to a project-level `learnings.jsonl` so the next cycle on a similar deliverable starts smarter.

## The six gates

Each gate has a single pass condition:

| Gate | Condition |
|---|---|
| **G1 — Frame complete** | THINK.md exists, signed, all six forcing questions answered, reader named, 10/10 traits concrete. |
| **G2 — Plan ratified** | All must-fix open questions resolved. Should-fix items logged as known limitations. |
| **G3 — Claim-tag scan** | Every numeric / cited / regulatory / competitive claim in the artifact carries a confidence tag or inline primary-source citation. One untagged claim auto-rejects. |
| **G4 — Review state** | Review state is DONE or DONE_WITH_CONCERNS. BLOCKED routes back to Build. |
| **G5 — Boomerang pass** | When Test ran: average score ≥ 8, every section ≥ 6. When Test was skipped: the gate is a no-op. |
| **G6 — Ship sanity** | Commit references the passing Review and Test artifacts. A commit without lifecycle companions is a role-discipline breach. |

## What runs alongside the spine

A few load-bearing pieces operate alongside the staged loop. None of them are gates; all of them are the discipline that lets the gates do their work.

### Chief-of-Staff Role Discipline

The orchestrator never produces deliverable content — five legitimate work products (in [`../AGENTS.md`](../AGENTS.md)); everything else dispatches. This is **build≠judge**, not a taboo: an orchestrator that authors and gates its own work is its own judge. It coheres with a lean, one-accountable-lead model — **accountability is not authorship**; the lead owns dispatch / gates / state / merge, the specialist authors the deliverable under independent review. The moment the orchestrator starts authoring it collapses back into the single-agent cognitive load it was meant to relieve — and CoS-non-authorship is the form of build≠judge that avoids the authorship-attribution and receipt-gate machinery a CoS-authoring model would require (the breach is observable in the turn).

A lightweight preflight fires before the orchestrator writes anything, asking: am I about to write deliverable content, is there a Think doc upstream, should I dispatch a specialist instead. If yes-yes-yes, stop and dispatch.

### The shared rulebook

A tool-agnostic `AGENTS.md` at the repo root. One file, one contract, read by every AI tool in the stack. Tools change; the contract holds.

### Verification stack

Three rules that operate together:

- **Verification Iron Rule.** Nothing is done because an agent says it is. Project state files are stale by default; re-verify by reading the source. Full rule in [`verification-iron-rule.md`](./verification-iron-rule.md).
- **Confidence Tags.** Every quantitative or comparative claim labeled `Confirmed`, `Projected`, or `Aspirational`. Full rubric in [`confidence-tags.md`](./confidence-tags.md).
- **Anti-Slop Flag List.** Mechanically scored at Review for external-facing deliverables. Full list in [`anti-slop-flag-list.md`](./anti-slop-flag-list.md).

### Brain-first lookup

Before any external API call, check the local brain first: STATUS, DECISIONS-LOG, MEMORY, prior session transcripts, project context. External fetches happen only when the brain did not answer, and load-bearing external fetches get saved back. The exception is freshness: for inherently current or high-risk facts — legal, financial, security, regulatory — brain-first means check local context for framing, then verify against the live primary source before relying on it. Full rule in [`brain-first-lookup.md`](./brain-first-lookup.md).

### Cross-project decision propagation

Decisions tagged `[GLOBAL]` in one project's DECISIONS-LOG surface in every other project at session start. The mechanism is in [`global-decision-tag.md`](./global-decision-tag.md).

### Standalone advisory gates

Not everything is a pipeline. A few skills run *outside* the spine as opt-in advisory gates — they end at a verdict or a call, they do not produce a pipeline artifact:

- **office-hours** — pressure-test a raw, unvalidated idea (*should this exist?*) before any deliverable is framed. Ends at pursue / refine / kill plus a one-week experiment. Distinct from `sprint-think`, which frames an already-approved deliverable.
- **ceo-review** — a sharp founder go/no-go on something already on the table, when you want the call without running the full Plan pipeline.
- **cso** — a full-codebase security audit (OWASP / STRIDE / supply-chain), distinct from a single-diff review.
- **design-review** — scored visual QA on a rendered UI: a Design Score plus a dedicated AI-slop grade.

Stage 2 also has a heavier escalation: **`/sprint-autoplan`** runs CEO → design → eng → DevEx review in sequence and auto-resolves mechanical convergent findings, surfacing only the decisions that need the operator. Reserved for deliverables that genuinely earn multi-lens review.

### Wrong-problem audit — challenge the premise first

The most expensive failure in an agentic stack is not a bad answer to the question; it is polished work aimed at the *wrong* question. Before deploying depth — a research pass, a review panel, a build — the orchestrator runs a three-question audit on the task itself:

1. **What is the real failure mode, in one line?** If you cannot name a concrete, costly failure, there may be nothing to build.
2. **What is the smallest effective fix?** Name it before reaching for the larger one.
3. **Is the solution larger than the problem?** If the proposed machinery dwarfs the failure it addresses, cut scope.

This gates the rest of the loop: a reviewer must be allowed to *kill* a plan, not merely refine it, and a v2 → v3 → v4 that keeps adding controls is the signal to stop and re-audit the premise — not to add a v5. It pairs with, but is distinct from, the `office-hours` gate: office-hours asks *should this exist at all?*; the wrong-problem audit asks *am I about to solve the right thing, at the right size?* The audit passes only when the failure mode, the smallest effective fix, and the scope ceiling are each written in one sentence — if you cannot, you are not ready to build. It is the cheap insurance against building rigorously in the wrong direction.

### Agent discipline — lean by default, armed at the gates

The default is one accountable lead doing the work in the main thread, with **zero standing fleet** of agents. A subagent spins up only for a bounded job: noisy, context-heavy isolated work; genuinely parallel work with disjoint ownership; or independent review — and for independent adversarial review, a *different model* usually improves blind-spot diversity over a same-model persona, which shares the same blind spots.

The inverse failure is just as real: **lean is not tool-starved.** On meaningful work — anything customer-facing, high-stakes, architectural, or repeated-failure — under-using the arsenal (specialist reviews, cross-model adversarial passes, the standalone gates above) is as much a miss as firing a fleet at everything. The cue is the work, not the mood: *think / research / plan* on real stakes is the signal to deploy depth; trivial or reversible work stays lean. Effort tracks stakes in both directions.

## A concrete arc

Picture a high-stakes external memo moving through the loop end to end. Think dispatches a Framing specialist to answer the six questions — the reader is named (the specific external decision-maker who has to act on it), the decision the memo must unblock is named (whether to approve the next milestone), the 10/10 outcome is a one-sentence target. Plan dispatches one specialist to surface open questions and apply the standing 10/10 dimensions. Build drafts the artifact, one section at a time, with every numeric and factual claim tagged inline. Review runs an independent specialist against the same questions, and the Audience auditor scores the anti-slop count. Test scores each section against its Plan-defined 10/10 target. Ship commits, pushes, and reports a three-bullet summary. Reflect logs the lessons into the project's learnings file.

Seven stages. The Think doc and the Reflect note take only a few minutes each. The gates are what produce a memo that survives external scrutiny.

That is the loop. It is the part most agent-stack diagrams skip.

---

## Document control

- 2026-05-20 — Initial public scaffold.
- 2026-06-01 — Added the "Standalone advisory gates" subsection (office-hours, ceo-review, cso, design-review) and the `/sprint-autoplan` multi-lens escalation note.
- 2026-06-17 — Added "Wrong-problem audit — challenge the premise first" and "Agent discipline — lean by default, armed at the gates" (zero standing fleet · cross-model review · lean ≠ tool-starved · stakes-calibrated arsenal cue).
