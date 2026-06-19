# [GLOBAL] decision tag — cross-project propagation

*When you run more than one project under the same operating contract, decisions in one project frequently affect the others. The `[GLOBAL]` tag is the mechanism that surfaces those decisions across projects automatically.*

---

## The mechanism

1. **Tag at origin.** A decision made in one project that affects (or could affect) other projects gets tagged `[GLOBAL]` in the originating project's `DECISIONS-LOG.md`.

   Example log entry:

   ```
   2026-01-15 [GLOBAL] Sprint Spine invocation discipline reversed from auto-fire to opt-in.
   Rationale: process ceremony was outweighing signal on routine work. Default: lean
   main-thread judgment. Opt-in via explicit /sprint-* invocation. Logged in [project]
   DECISIONS-LOG, propagates to all projects.
   ```

2. **Surface at session start.** At session start in every project, grep all sibling `DECISIONS-LOG.md` files for `[GLOBAL]` tags within a recent window (default: ~30 days).

3. **Propagate.** Surface relevant `[GLOBAL]` decisions at the top of the new session before any work begins. The operator sees the decision once per session in each project, until the decision ages out of the window.

## Why this rule exists

The failure mode the tag prevents: a decision made in project A is never seen in project B until project B independently re-derives it (often differently, sometimes contradictorily). The same vendor adoption, framework reversal, or tone calibration gets re-litigated in each project, and the projects drift apart on decisions the operator already made.

The tag makes the decision portable. The session-start grep makes the propagation automatic.

## What counts as a `[GLOBAL]` decision

- **Environment changes** — plugin install/uninstall, MCP server configuration, global rule edits.
- **Methodology reversals** — changes to the operating contract, the Sprint Spine invocation discipline, the verification stack.
- **Cross-project vendor decisions** — vendor adoptions or rejections that affect multiple projects.
- **Tone or quality bar shifts** — calibrations that should propagate (e.g., anti-slop threshold tightening, jargon-budget revisions).

What does NOT count:

- Project-specific implementation choices that do not affect other projects.
- Routine status updates.
- Deliverable-level decisions (those belong in the deliverable's own lifecycle artifacts, not in `DECISIONS-LOG.md`).

## How to apply

When making a decision that might affect another project, ask one question: *if a sibling project's CoS opened a session tomorrow, would this decision change how they should operate?* If yes, tag it `[GLOBAL]`.

Two false positives are cheaper than one false negative. If you are unsure, tag it; the session-start grep surfaces it once, the operator can dismiss it if irrelevant in the sibling project.

## Worked example

**Scenario.** Project A's operator decides to switch from one external research tool to another after the first tool's pricing model changes mid-month. The decision is logged in project A's `DECISIONS-LOG.md`:

```
2026-02-20 [GLOBAL] Switched from research tool X to research tool Y for primary
research routing. Rationale: tool X's per-query pricing model changed 2026-02-18,
breaks our cost-per-deliverable budget. Tool Y retains flat-rate pricing.
All projects should default to tool Y until further notice.
```

**Next session in project B.** Session-start grep finds the `[GLOBAL]` tag dated within the 30-day window, surfaces:

> Recent [GLOBAL] decision from project A (2026-02-20): switched research tool X → Y. Default research routing should use tool Y in this project too. Acknowledge or override before proceeding with research-heavy work.

Project B's operator either acknowledges (default behavior changes here too) or overrides with rationale ("this project still uses tool X because Z"). Either way, the decision is visible and resolved, not silently drifted.

## Anti-pattern — tag absence

The common failure: a decision that should propagate is logged without the `[GLOBAL]` tag because the operator is focused on the single-project context where the decision was made. The session-start grep misses it. Three weeks later, the sibling project's operator independently makes a different decision on the same question.

The fix is a habit: at end-of-decision, ask the *"would this change how a sibling project operates"* question and add the tag if yes. A weekly retro that scans recent DECISIONS-LOG entries can catch missed tags before too much drift accumulates.

## Anti-pattern — tag inflation

The inverse failure: every decision gets `[GLOBAL]`-tagged out of caution, and the session-start grep returns ten irrelevant items. The operator ignores them after the third session and the mechanism dies.

The fix is the same one-question test: *if a sibling project's CoS opened a session tomorrow, would this decision change how they should operate?* When the honest answer is no, do not tag.

## Related conventions

- [`brain-first-lookup.md`](./brain-first-lookup.md) — `[GLOBAL]`-tagged decisions are part of every project's brain, surfaced by the session-start grep.
- [`verification-iron-rule.md`](./verification-iron-rule.md) — `[GLOBAL]` decisions older than the freshness window need re-verification before being acted on.

## Where this rule lives in the skills

Session-start propagation is implemented as a grep routine in each project's CoS startup checklist; the tag itself is a convention applied at decision-log time, not a skill that fires automatically.

---

## Document control

- 2026-05-20 — Initial public scaffold.
