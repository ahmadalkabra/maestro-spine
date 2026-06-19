---
name: sprint-build
description: 'Stage 3 of the Sprint Spine. Opt-in via explicit invocation. Produces the deliverable artifact (with optional BUILD-NOTES.md when warranted). For code work, a mandatory build workflow runs (acceptance criteria → spec → architecture review → test). Default for non-code: lean main-thread drafting; specialist dispatch only when the deliverable explicitly warrants it.'
---

> **Opt-in skill.** Per the global Sprint Spine invocation discipline: default = lean main-thread drafting; specialist dispatch when warranted.

## When to use

Invoked by the orchestrator after `sprint-plan` passes Gate 2. Runs before `sprint-review`. This is where the deliverable content actually gets written — decks, memos, plans, code.

**Hard rule:** The orchestrator does not build. The orchestrator dispatches specialist builders per section. Writing content directly from the orchestrator seat is a role breach — see [CoS Role Discipline](../../AGENTS.md#chief-of-staff-role-discipline).

## Process

1. Read `THINK.md` and `PLAN.md` as inputs. The plan's section outline, per-section 10/10 targets, scope mode, and rigor bar govern the build.
2. For each section in the plan, dispatch a specialist builder. Builder grants: read access to THINK + PLAN, write access to the artifact and BUILD-NOTES.md.
3. Builder writes to the plan, not to their interpretation. Deviations return to `sprint-plan`, not freelance changes.
4. **Every factual claim carries a confidence tag inline:** `Confirmed` (primary source cited — URL, document, page), `Projected` (model + assumption stated), `Aspirational` (goal, labeled as such). Untagged claims auto-fail Gate 3. Full rubric: [`../../docs/confidence-tags.md`](../../docs/confidence-tags.md).
5. Builder appends to `BUILD-NOTES.md` a context block per section:
   - **Decisions** — what was decided and why
   - **Remaining** — what is still open
   - **Tried** — what failed, with reason
   - **Skipped** — what was out of scope per the plan
6. The orchestrator collects completed sections and packages the artifact plus BUILD-NOTES.md for Review.

## Preflight — CoS role-breach self-check

Before this skill fires, the orchestrator runs a four-question self-check to catch the role breach this skill is designed to prevent:

1. **Is this deliverable content?** (Anything that goes in front of the operator or an external party as a deliverable.)
2. **Does a THINK.md exist for this deliverable?**
3. **Does a PLAN.md exist with specialist OQs converged?**
4. **Am I (the orchestrator) the right author for this content class?** Match the deliverable's primary claim class to its specialist. If the right author is NOT the orchestrator → dispatch the specialist. Do not write the content yourself.

If the self-check flags a breach: stop the in-flight content production, surface one line to the operator (*"I caught myself about to write [deliverable class]. The right specialist is [X]. Dispatching now."*), and dispatch.

## Output

The deliverable artifact (memo, deck, plan, spec, code — whatever was scoped) plus `BUILD-NOTES.md` in the same directory. BUILD-NOTES.md is the handoff record that makes Review mechanical.

## Gate

**Gate 3 — Claim-tag gate:** A mechanical scan runs over the artifact. Every numeric claim, cited entity, regulatory reference, market sizing statement, and competitive assertion must carry a `Confirmed` / `Projected` / `Aspirational` tag or an inline primary-source citation. One untagged claim auto-rejects the artifact back to Build with the specific line flagged. No judgment, no exceptions.
