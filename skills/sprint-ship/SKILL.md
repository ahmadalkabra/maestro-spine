---
name: sprint-ship
description: Stage 6 of the Sprint Spine. Opt-in via explicit invocation. Commits the artifact, pushes per session protocol, reports a 3-bullet summary. No deck walkthroughs in chat. For code work, follows the standard ship sequence (update the base branch, run the test suite, check coverage, push, and open the PR).
---

> **Opt-in skill.** Per global Sprint Spine invocation discipline.

## When to use

Invoked by the orchestrator after `sprint-test` passes Gate 5 (or after `sprint-review` if Test was skipped). This is the handoff to the operator — the artifact is reviewed, scored, and ready.

The orchestrator owns this stage directly. No specialist dispatch required.

## Process

1. Stage the deliverable artifact plus its lifecycle companions: `THINK.md`, `PLAN.md`, `BUILD-NOTES.md`, `REVIEW.md`, `TEST.md` (if Test ran). Use `git add` with specific paths, not `git add -A`.
2. Write the commit message. Clear subject line, no `WIP:` prefix — this is a real commit, not an auto-checkpoint. Body describes what shipped and points to the Test score (if applicable). Sign-off per project convention.
3. Run `git commit`. If a pre-commit hook fails, fix the issue and create a new commit — do not amend.
4. Ask once: "Pushing to remote?" If yes, run `git push`. If no, note the local-only ship in STATUS.md.
5. Report to the operator in chat with the Ship Summary format:
   - 3 bullets maximum, each describing what the artifact does for the named reader
   - Absolute path to the artifact
   - Test average score if Test ran (e.g., "Test avg: 8.6/10")
   - If REVIEW state was DONE_WITH_CONCERNS, prepend the concerns list above the 3 bullets
6. Update STATUS.md with the ship entry and date.

## Output

- Commit pushed (or local, per the operator's answer).
- 3-bullet Ship Summary in chat with path and Test average.
- STATUS.md updated with the ship entry.

No deck walkthroughs in chat. No "I've done the following..." preambles. The operator opens the file to see the deliverable.

## Gate

**Gate 6 — Ship gate:** Commit must reference a passing Test (when Test ran) and a Review state of DONE or DONE_WITH_CONCERNS. A commit without both artifacts present in the tree is a role-discipline breach — the orchestrator must not ship an artifact that lacks its lifecycle companions.
