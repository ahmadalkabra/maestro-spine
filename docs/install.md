# Install and adaptation guide

Maestro Spine has two layers:

1. A tool-independent operating contract in `AGENTS.md`.
2. Optional Claude-style skill skeletons in `skills/`.

Install the contract first. Add skills only after the contract helps on a real
task.

## Path A - Read only

Read [`../AGENTS.md`](../AGENTS.md). This path is enough if you want to borrow
the rules without modifying a project.

Use it to evaluate whether the operating style fits:

- source truth before claims
- acceptance gates before build
- explicit PASS / BLOCK / NEEDS DECISION closeout
- one matched reviewer instead of default reviewer panels
- reflection only when it creates durable learning

## Path B - One project

Copy the contract into one project without overwriting an existing local
contract:

```bash
git clone https://github.com/ahmadalkabra/maestro-spine.git
cp -n maestro-spine/AGENTS.md /path/to/your/repo/AGENTS.md
```

For Claude Code, also copy:

```bash
cp -n maestro-spine/CLAUDE.md /path/to/your/repo/CLAUDE.md
```

If the target file already exists, `cp -n` leaves it untouched. Diff and merge
the contract manually instead of replacing local instructions blindly.

Then edit the copied files in your project:

- replace identity and tone defaults
- list the tools your environment actually exposes
- name approval-gated actions for your context
- remove any project categories that do not apply
- keep the source-truth and verification rules intact

Restart or open a fresh AI session in that repo after copying. Most tools read
repo-level instruction files at session start.

## Path C - Claude-style skills

The skill skeletons are shaped for Claude-style skill systems. They are
optional.

```bash
git clone https://github.com/ahmadalkabra/maestro-spine.git
mkdir -p ~/.claude/skills
rsync -av --ignore-existing maestro-spine/skills/ ~/.claude/skills/
find ~/.claude/skills -maxdepth 2 -name SKILL.md | sort
```

`--ignore-existing` avoids overwriting same-named local skills. If you already
have customized skills with matching names, diff and merge them manually.

Expected output includes the Sprint Spine skills:

```text
.../sprint-think/SKILL.md
.../sprint-plan/SKILL.md
.../sprint-build/SKILL.md
.../sprint-review/SKILL.md
.../sprint-test/SKILL.md
.../sprint-ship/SKILL.md
.../sprint-reflect/SKILL.md
```

It also includes standalone advisory gates:

```text
.../office-hours/SKILL.md
.../ceo-review/SKILL.md
.../sprint-autoplan/SKILL.md
.../cso/SKILL.md
.../design-review/SKILL.md
.../codex-adversarial/SKILL.md
```

The skills are opt-in. Do not run the full chain for every task. Use the full
Sprint Spine for work where the added rigor is worth the overhead: public
claims, investor materials, regulated submissions, launch decisions, complex
code changes, or high-stakes strategy.

## Adapting to other tools

`AGENTS.md` is the portable part. The skill directory format is not guaranteed
to work unchanged outside Claude-style skill systems.

When adapting to another agent tool:

- keep the stage intent and gates
- rewrite frontmatter to match the target tool
- map explicit invocation names to the target tool's skill mechanism
- preserve the opt-in rule
- preserve the source-truth and verification rules
- remove Claude-specific dispatch language if the target tool does not support
  sub-agents

Do not claim a tool is supported until you have run a fresh-session smoke test
inside that tool.

## First-run verification

After copying `AGENTS.md`, ask a fresh agent session:

```text
Using this repo's AGENTS.md, help me decide whether to ship a public pricing
claim that says our product is "best-in-class." Name source truth, acceptance
gate, smallest next action, and evidence needed for PASS / BLOCK / NEEDS
DECISION.
```

PASS looks like:

- the agent names the active repo or task
- the agent checks or proposes source truth before answering
- the agent states an acceptance gate
- the agent challenges unsupported comparative language
- the agent names the smallest useful next action
- the agent says how it will verify the result
- the agent does not invent tool support or claim completion without evidence

BLOCK looks like:

- generic productivity advice
- no source-truth check
- no acceptance gate
- auto-running the whole Sprint Spine for a small task
- accepting "best-in-class" without evidence or a claim downgrade
- acting as if Claude-style skills are available in another tool without an
  adaptation step

## Troubleshooting

**The agent ignores `AGENTS.md`.**
Open a fresh session in the repo root and confirm the tool reads repo-level
instruction files. Some tools require a specific filename or manual context
attachment.

**The agent overuses the Sprint Spine.**
Re-read the opt-in rule in [`operating-model.md`](./operating-model.md). Default
mode is lean main-thread judgment. Use the full chain only when the deliverable
warrants it.

**The skills do not appear.**
Check the target directory:

```bash
find ~/.claude/skills -maxdepth 2 -name SKILL.md | sort
```

If your tool is not Claude-style, adapt the skill format instead of copying the
directory blindly.

**The install feels too abstract.**
Run only Path B first. One repo, one real decision, one acceptance gate. Add the
skills after that first win.

## Repo surface check

From this repo:

```bash
scripts/check-install-surface.sh
```

The script verifies required onboarding files, skill skeletons, prompt
templates, and unresolved placeholder residue in the install surface.
