# Global Brain: Shared Operating Memory Across Projects

Project-local memory is useful, but it creates silos. When you run several projects through cwd-scoped agents (such as Claude Code and similar coding-agent harnesses), each project only loads its own memory — so the same *universal operating lessons* get relearned, re-derived, and re-saved project by project, drifting slightly each time.

A **global brain** fixes that: a curated, manifest-controlled set of cross-project operating lessons that is *generated into* each project — without letting any project re-author it locally.

This document is the methodology. The companion skeleton script is [`../scripts/sync-global-brain.sh`](../scripts/sync-global-brain.sh). It pairs with [`brain-first-lookup.md`](./brain-first-lookup.md) (check memory before fetching) and [`global-decision-tag.md`](./global-decision-tag.md) (propagate cross-project *decisions*); this doc propagates durable cross-project *operating lessons*.

---

## 1. Problem

Cwd-scoped agents key their memory to the working directory. That's the right default for project facts — but it means anything *universal* (how you verify claims, how you handle secrets, how the orchestrator should behave, how you route research) is invisible to every project except the one it was written in. The symptoms:

- The same feedback gets re-saved in three projects, each phrased a little differently.
- A lesson learned the hard way in Project A never reaches Project B.
- A new project starts with none of the operating discipline the others accumulated.

The naive fix — copy every memory into every project — is worse: it floods each project with irrelevant context and creates cross-project noise. **The real fix is curation before propagation.**

## 2. Principle

> Propagate only **durable operating lessons**, never **project facts**.

A global memory is something that would be true and useful in *any* of your projects: a verification rule, a security default, a communication preference, a dispatch pattern. A project fact — a customer, a deadline, a domain-specific note, a decision specific to one codebase — must stay local. The hardest discipline is resisting *false universality*: a lesson that is genuinely useful in two related projects is often a **domain port**, not a universal rule (see §5).

## 3. Architecture

```
CANONICAL GLOBAL SET            (one curated home: meta-workspace/brain/global/)
        │  one file per lesson, each with provenance: source, date, scope
        ▼
  global-brain.manifest         (explicit allowlist of what propagates)
        ▼
  sync-global-brain.sh          (copy + generate; --dry-run / --check)
        ▼
  projects/<project>/memory/_global/   (generated, read-only inside the project)
        │  + a generated _global/INDEX.md (titles + one-line descriptions)
        ▼
  projects/<project>/MEMORY.md  links to _global/INDEX.md (does NOT duplicate it)
```

Invariants that make the pattern sound:

- **Curated, not blindly auto-harvested.** A human (or a review step) decides what is universal.
- **Provenance on every item** — source, date, and scope, so a reader can judge and re-date it.
- **Generated and read-only inside projects.** The `_global/` copies are build output. Agents must not hand-edit them; the canonical set is the only place to edit.
- **Link, don't duplicate.** Each project's `MEMORY.md` links to `_global/INDEX.md` so the project index stays small and the global set has a single rendering.
- **Drift is detectable.** A `--check` mode compares each project's generated copies against canonical and fails on divergence — run it before important work.
- **Clean regeneration, not append.** Removing a lesson from canonical must remove the generated copies everywhere (regenerate from scratch or use tombstones — never append-only).

## 4. Routing rule

When you learn a new universal lesson, it goes **upstream** to the canonical global set, then you re-sync — you never fork a local copy into one project. Encode this as a standing rule in your top-level agent instructions:

> A new memory that is not project-specific is saved to the canonical global set (tagged `scope: global`), added to the manifest, and propagated by re-running the sync. Project-specific memories stay in the project's own dir. Never re-author a universal lesson inside a single project.

Without this rule the silo re-forms one well-intentioned local save at a time.

## 5. Admission criteria — three categories

The distinction that keeps the brain mature (and prevents the most dangerous mistake — treating domain-specific knowledge as universal agent policy):

| Category | What it is | Propagates to |
|---|---|---|
| **`global/`** | Universal operating lessons — verification discipline, security defaults, communication style, orchestrator role, tool routing | **Every** project |
| **`domain-packs/`** | Optional reusable *domain fluency* — a body of knowledge useful to a family of related projects but not universal | Only projects that opt into that pack |
| **`project-local/`** | Facts, decisions, customers, and context specific to one project | **Never** — stays put |

The test for `global/`: *would this be true and useful with no edits in a project that shares nothing with this one?* If it needs domain context to make sense, it's a domain pack. If it names a specific customer/decision/fact, it's project-local.

## 6. Safety gates

The sync is a propagation mechanism — one bad memory can leak everywhere, so it carries gates:

- **PII / secret denylist scan** before sync — refuse to propagate anything matching a denylist (emails, keys, tokens, machine usernames, internal hostnames). One contaminated global memory would otherwise reach every project.
- **Freshness** — sensitive rules carry a `last_reviewed` note; a stale universal rule is wrong everywhere at once.
- **Conflict detection** — `--check` flags duplicate ids and same-category/title collisions so two global memories can't quietly contradict.
- **Project override convention** — a project may intentionally differ from a global default; the local override wins **but must state its reason**, so divergence is deliberate, not accidental.
- **Generated-file warning** — every generated `_global/` file and index carries a "do not edit; managed by sync" banner.
- **Check mode** — `--check` is the pre-flight: detect drift before you rely on the brain for important work.

## 7. Skeleton script

[`../scripts/sync-global-brain.sh`](../scripts/sync-global-brain.sh) is a sanitized, dependency-light Bash skeleton: reads the manifest, copies the curated set into each project's `_global/`, regenerates `INDEX.md`, refreshes the linked section in each project's `MEMORY.md`, and supports `--dry-run`, `--check`, typed exit codes, and a denylist-scan placeholder. It is intentionally boring — copies + a manifest + a check mode are portable and agent-friendly. (Symlinks are fragile across machines; central retrieval is elegant but fails when the agent only sees cwd-local context.) Adapt the config block (paths, project list, denylist) to your setup.

## 8. Anti-patterns

- **The memory dump** — propagating everything instead of a curated set. Floods every project with noise; defeats the point.
- **Hand-editing generated files** — editing a project's `_global/` copy instead of canonical. The next sync silently overwrites it.
- **Stale universal rules** — never reviewing global lessons, so an outdated rule degrades every project simultaneously.
- **Domain knowledge mislabeled global** — promoting a domain-specific lesson into universal agent policy. Keep domain fluency in a domain pack, not the global brain.
- **Append-only deletion** — removing a lesson from canonical but leaving generated copies behind. Always regenerate cleanly.

---

## Document control

- 2026-05-20 — Initial public scaffold.
- 2026-06-01 — Reviewed against a representative cross-project sync workflow; methodology current (denylist scan, `--check` drift detection, and manifest curation).
