# maestro-spine

*A portable operating contract for production agentic workflows: claim hygiene, gated delivery, role discipline, and review loops.*

---

## What this is

`maestro-spine` is a portable operating contract for AI-assisted work that needs evidence, ownership, and review. It gives you a repo-level rulebook, the opt-in **Sprint Spine** delivery loop, confidence-tagged claims, brain-first lookup, role discipline, and receipt-based review. The goal is simple: make agent output easier to trust, inspect, and adapt.

The repo is a public skeleton adapted from Garry Tan's MIT-licensed `gstack`/`gbrain` and scrubbed so the parts that travel can be copied without carrying private project context. Clone it for the working files.

**Start here.** New to this? Read [`START_HERE.md`](./START_HERE.md). Don't adopt the whole system. Copy `AGENTS.md` into one repo, skim [`docs/operating-model.md`](./docs/operating-model.md) to see how the loop runs, and install only the skills you actually need. An easy first adoption is not the full system — it is one rulebook, one gate, and one project where agent output currently needs more discipline.

**Lineage.** Maestro Spine is an applied synthesis. It adapts the staged agent-workflow and brain-first patterns from Garry Tan's MIT-licensed [gstack](https://github.com/garrytan/gstack) and [gbrain](https://github.com/garrytan/gbrain), and it adapts established operating disciplines — gated product-development workflows, OKR and forecasting confidence vocabulary, and empirical-evidence review practices — into an AI-agent execution loop. The repo's contribution is the specific agent-operations assembly: Sprint Spine labels and gates, enforcement mechanics, `[GLOBAL]` decision tags, Global Brain propagation, Chief-of-Staff role discipline, and operator-defined gates. The primitives — staged gates, confidence tags, brain-first lookup — are not claimed as novel; the contribution is the opinionated packaging and the enforcement that makes them hold. See [`ACKNOWLEDGMENTS.md`](./ACKNOWLEDGMENTS.md) for what derives from where, and [`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md) for the upstream MIT notices.

## What this isn't

This is not a SaaS platform, not a framework you import, and not a beginner course. There is no install wizard, hosted runtime, or community Discord. The repo is a set of skill skeletons and rule documents you copy into your own stack and adapt. The discipline is the substance; the skeletons are scaffolding.

This is also not a complete operating environment. Real deployments usually include project-specific orchestration, domain-tuned roles, local runtime choices, and accumulated decision history. None of that is here. What is here is the methodology layer that travels.

Use it when production agentic workflows need more than tool calls: source truth, role discipline, memory boundaries, review gates, and proof that the work is actually done.

## Install

For the full walkthrough, see [`docs/install.md`](./docs/install.md). Three install paths, depending on what you want.

**Path A — Read the rulebook only.** Read [`AGENTS.md`](./AGENTS.md). That's the contract. If you adopt nothing else from this repo, adopt the rules in that file.

**Path B — Copy the rulebook into a single project.**

```bash
git clone https://github.com/ahmadalkabra/maestro-spine.git
cp -n maestro-spine/AGENTS.md /path/to/your/repo/AGENTS.md
cp -n maestro-spine/CLAUDE.md /path/to/your/repo/CLAUDE.md   # if you use Claude Code
```

Open both files in your repo, replace the placeholder identity lines (tone, vendor list, project list) with your own, and start your next AI session. Tools will read these at session start. `cp -n` avoids silently overwriting existing local contracts; if a target file already exists, diff and merge manually.

**Path C — Install the skill skeletons.**

```bash
git clone https://github.com/ahmadalkabra/maestro-spine.git
mkdir -p ~/.claude/skills
rsync -av --ignore-existing maestro-spine/skills/ ~/.claude/skills/
```

This installs the seven-stage Sprint Spine (`sprint-think` → `sprint-reflect`) plus the standalone advisory gates that run *outside* the pipeline: `office-hours` (pressure-test a raw idea), `ceo-review` (a sharp go/no-go on something already scoped), `sprint-autoplan` (the multi-lens planning escalation), `cso` (full-codebase security audit), `design-review` (scored visual QA), and `codex-adversarial` (cross-model review).

`--ignore-existing` avoids silently overwriting same-named local skills; diff and merge manually if you already have customized skill files.

The skills are opt-in by design (see the invocation discipline note in each `SKILL.md` header). Default = lean main-thread judgment; invoke explicitly when a deliverable warrants the rigor. The skeletons are shaped for Claude-style skill systems — adapt the front-matter and invocation conventions for other tools.

After install, run:

```bash
cd maestro-spine
scripts/check-install-surface.sh
```

Then read [`docs/operating-model.md`](./docs/operating-model.md) for how the loop runs end to end and [`docs/global-brain.md`](./docs/global-brain.md) for sharing curated operating memory across projects.

## What's NOT here

This repo deliberately omits the parts of a full operating environment that are not safe or useful to publish:

- **Project data and project-specific code.** Your live projects stay behind their own walls.
- **Project-specific orchestrator roles.** A real project may use a named lead, specialist agents, or domain-specific prompts. None of that is here. The generic pattern is in [`AGENTS.md`](./AGENTS.md).
- **Runtime tooling.** Long-running handoffs, background review, and async continuity depend on the operator's environment. This repo stays runtime-agnostic.
- **Memory contents.** The methodology layer for memory (file structure, indexing convention, brain-first lookup rule) is in [`docs/brain-first-lookup.md`](./docs/brain-first-lookup.md). The actual memory files are project-private.
- **Specialist prompt definitions.** The pattern (specialist per claim class, dispatched by an orchestrator) is in [`AGENTS.md`](./AGENTS.md). Specific prompts, tone, and dispatch triggers belong in the adopting project.

The line: this repo holds **what travels**. Each adopting project holds **what's tuned**.

## The author

I'm Ahmad Alkabra, a senior product leader and AI-native builder working across AI-native product systems, applied software, and operating-model design.

Maestro Spine is part of my operating system for AI-native product work: a portable way to keep agentic work source-backed, reviewable, owned, and honest about what is known.

**LinkedIn:** [Ahmad Alkabra](https://www.linkedin.com/in/aalkabra) · **X:** [@ahmadalkabra](https://x.com/ahmadalkabra)

## License

Code and documentation are released under the [MIT License](./LICENSE) — copy, adapt, and build on them freely. Attribution is appreciated: see [`NOTICE`](./NOTICE) for the convention on the *maestro-spine* and *Sprint Spine* names. This project itself adapts upstream MIT-licensed work — see [`ACKNOWLEDGMENTS.md`](./ACKNOWLEDGMENTS.md) and [`THIRD_PARTY_NOTICES.md`](./THIRD_PARTY_NOTICES.md).
