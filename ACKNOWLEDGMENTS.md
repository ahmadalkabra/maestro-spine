# Acknowledgments

## Primary lineage — Garry Tan's gstack and gbrain

Maestro Spine adapts the staged-pipeline and brain-first operating patterns from
Garry Tan's MIT-licensed [gstack](https://github.com/garrytan/gstack) and
[gbrain](https://github.com/garrytan/gbrain), then re-expresses and extends them
with Sprint Spine naming, confidence tags, Verification Iron Rule discipline,
global decision tags, Chief-of-Staff role discipline, and operator-specific
operating gates.

Concretely, these patterns derive from gstack/gbrain:

- The **staged deliverable pipeline** (Think → Plan → Build → Review → Test →
  Ship → Reflect) adapts gstack's plan / review / ship skills and its `autoplan`
  multi-review sequence, and sits in the broader staged-and-gated tradition of
  product-development process (Robert G. Cooper's Stage-Gate®).
- The **per-stage specialist reviews** (CEO / Engineering / Design / DevEx)
  adapt gstack's `plan-ceo-review`, `plan-eng-review`, and `plan-design-review`.
- The **framing pushback** in `sprint-think` adapts gstack's `office-hours`
  diagnostic.
- The **standalone advisory gates** — `cso` (full-codebase security audit) and
  `design-review` (scored visual QA) — adapt gstack's `cso` and `design-review`
  skills.
- The **cross-model adversarial review** in `codex-adversarial` adapts gstack's
  `codex` skill.
- The **Anti-Slop Flag List** adapts gstack's slop-scan and writing-style
  discipline.
- The **Brain-First Lookup** rule adapts gbrain's premise — an agent memory that
  is checked before reaching outward.

The MIT license texts for both projects are preserved in
[`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md).

## Open conventions this builds on

- **The `AGENTS.md` convention** — the tool-agnostic, root-level operating-contract
  convention read by OpenAI Codex CLI and other agent-native tools.
- **The Agent Skills format** — the `SKILL.md` front-matter convention introduced
  by Anthropic for Claude and Claude Code. The skill files are authored for this
  repo's operating model; the format follows that spec, and install paths assume
  Claude Code as the reference host.
- **Critical-thinking lenses** — Socratic questioning, the devil's-advocate frame,
  and the pre-mortem are long-standing public-domain techniques, used here as
  labels for review passes.

## What this repo contributes

What is specific to Maestro Spine is the **assembled agent-operations system**, not the
individual paradigms it draws on. Specifically: the **Sprint Spine** stage labels
(Think → Plan → Build → Review → Test → Ship → Reflect), its six gate definitions and their
enforcement mechanics; the *application* of confidence tags as inline, gate-enforced labels on
every factual claim in an agent deliverable; the specific operational wording of the
Verification Iron Rule (project state files are stale by default; re-read the source; downgrade
explicitly); the `[GLOBAL]` decision-tag propagation mechanism; the **Global Brain**
cross-project memory-propagation pattern; the Chief-of-Staff role-discipline rule and its five
work products; and the operator-specific gates.

These choices adapt modern, established operating disciplines: gated
product-development workflows, OKR and forecasting confidence vocabulary, and
empirical-evidence review practices. Maestro Spine does not claim to invent
those categories. Its contribution is the synthesis, the specific
implementation, and the operating discipline that make them work together across
multiple AI-native projects.

None of the above implies endorsement by, or affiliation with, the named tools,
organizations, or their authors.
