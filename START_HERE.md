# Start here

Maestro Spine is not a framework to install. It is a copyable operating
contract for production agentic workflows.

Start with one file, run one real decision through it, then add skills only
when the work deserves more rigor.

## Who this is for

Use Maestro Spine if you already use AI agents for production work and want a
portable discipline for:

- source-truth checks before action
- clearer acceptance gates
- fewer unsupported claims
- role discipline between orchestrators, builders, and reviewers
- lightweight review loops for important deliverables

It is best for operators, founders, product leads, engineering leads, and small
teams that already feel the pain of context drift, shallow reviews, and
AI-written work that looks done before it is proved done.

## Who this is not for

This is not a hosted product, an agent runtime, a SaaS app, or a tutorial on how
to use AI tools from scratch. It will not create a memory system, run background
agents, configure credentials, or make an unsupported tool behave like Claude
Code.

The repo gives you portable rules, skill skeletons, and setup patterns. Your
own tools still run the work.

## Pick your path

**Path A - Read the rulebook.**
Read [`AGENTS.md`](./AGENTS.md). Use this when you only want the operating
contract and do not want to copy anything yet.

**Path B - Add the contract to one repo.**
Copy `AGENTS.md` into a project that already uses AI coding or research tools.
This is the recommended first install.

**Path C - Add the skill skeletons.**
Copy skills after Path B, when you want explicit stage gates or standalone
advisory gates for important work.

## Ten-minute install

Clone the repo:

```bash
git clone https://github.com/ahmadalkabra/maestro-spine.git
```

Copy the operating contract into one project without overwriting an existing
contract:

```bash
cp -n maestro-spine/AGENTS.md /path/to/your/repo/AGENTS.md
```

If the command prints no output but your target already had an `AGENTS.md`, the
file was not replaced. Diff and merge the contract manually.

If you use Claude Code, also copy the Claude-side conventions:

```bash
cp -n maestro-spine/CLAUDE.md /path/to/your/repo/CLAUDE.md
```

Open the copied files and replace the project-specific placeholders: tone,
tool/vendor list, project list, and any local approval gates that do not match
your environment.

## First successful run

Open a fresh AI session inside the project where you copied `AGENTS.md`, then
ask:

```text
Using this repo's AGENTS.md, help me decide whether to ship a public pricing
claim that says our product is "best-in-class." Name the source truth to check,
the acceptance gate, the smallest next action, and the evidence that would
prove PASS, BLOCK, or NEEDS DECISION.
```

A good first result should:

- name the active task and repo
- identify the source-truth files or commands to check
- state the user, job, outcome, and acceptance gate
- reject or downgrade unsupported comparative claims
- recommend the smallest useful next action
- say what evidence would prove PASS, BLOCK, or NEEDS DECISION
- avoid claiming the work is done without verification

If the agent gives generic productivity advice, does not mention source truth,
or starts building without an evidence gate, the contract is not being applied
yet.

## Add the skills later

The root contract is tool-independent. The included skill skeletons use
Claude-style skill conventions and live under `skills/`.

To install them for Claude-style skill systems:

```bash
mkdir -p ~/.claude/skills
rsync -av maestro-spine/skills/ ~/.claude/skills/
find ~/.claude/skills -maxdepth 2 -name SKILL.md | sort
```

This installs the seven-stage Sprint Spine plus standalone advisory gates such
as `office-hours`, `ceo-review`, `sprint-autoplan`, `cso`, `design-review`, and
`codex-adversarial`.

If you use another agent tool, adapt the skill frontmatter, directory layout,
and invocation style to that tool. The operating pattern travels; the Claude
skill format may not.

## Verify the repo surface

From the `maestro-spine` repo:

```bash
scripts/check-install-surface.sh
```

This checks that the public install surface has the expected files, skill
skeletons, prompt templates, and no unresolved onboarding placeholders.

## Read next

After the first run:

- [`docs/install.md`](./docs/install.md) for full install and adaptation notes
- [`docs/operating-model.md`](./docs/operating-model.md) for the full loop and
  the opt-in skill discipline
- [`docs/global-brain.md`](./docs/global-brain.md) if you want curated memory
  propagation across projects
