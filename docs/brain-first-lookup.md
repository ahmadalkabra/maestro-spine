# Brain-First Lookup

*Before any external API call, check the local brain first. External calls are expensive; the local brain often has the answer — but only if checked.*

---

## The rule

Before any external API call (web search, scrape, plugin fetch, MCP request), check the local brain first:

1. Project `STATUS.md` — current state of the project
2. Project `DECISIONS-LOG.md` — prior decisions, especially `[GLOBAL]`-tagged
3. Project `MEMORY.md` index or auto-memory directory
4. Prior session transcripts (if your tool exposes them — Claude Code stores them under `~/.claude/projects/`)
5. Project `context/` — source-of-truth context files

**Then** fetch externally if the local brain did not answer. **And** save load-bearing external fetches back to the brain so the next session does not re-fetch.

## Why this rule exists

External calls are expensive on every dimension: rate limits, tokens, latency, sometimes monetary cost. The local brain often has the answer — the same regulator page does not need to be fetched four times in the same week, the same vendor decision does not need to be re-derived from scratch.

The default failure mode is *agent reaches for `WebFetch` instead of grepping `DECISIONS-LOG.md` first*. This rule reverses the default.

## How to apply

When you need an entity, decision, fact, or definition:

1. **Try a session-recall tool first** for *"did we discuss this in a prior session?"* (Claude Code's `session-recall` skill is one such tool; equivalent tools exist in other harnesses.)
2. **Try a cross-project search** for *"is this discussed in another project?"* — relevant when you run more than one project under the same operating contract.
3. **Grep the current project's state surfaces** for the term — STATUS, DECISIONS-LOG, MEMORY, context.
4. **If nothing**, fetch externally per your tool's research routing.
5. **Save back** to memory or context if the external fetch produced a load-bearing fact.

## Worked example

**Without the rule.** An agent is asked: *what was our position on adopting framework Y?* The agent immediately fires a web search for *"framework Y best practices"* and assembles a synthesis from blog posts. The synthesis may or may not match the operator's actual prior decision — which lived in `DECISIONS-LOG.md` from three months ago, signed off and `[GLOBAL]`-tagged.

**With the rule.** The agent greps `DECISIONS-LOG.md` for *"framework Y"* first, finds the prior decision with rationale, surfaces it as context, and asks the operator: *"prior decision says X, dated YYYY-MM-DD; should we re-evaluate or proceed on the prior decision?"* The external fetch happens only if the operator says re-evaluate.

## Anti-pattern — external-first reach

The common failure: an agent receives a question that the local brain has already answered, and fires `firecrawl scrape` (or equivalent) without checking the relevant ledger first. If the answer is already verified and ledger-logged, the external call is wasted.

Same pattern bites on: vendor decisions (already in DECISIONS-LOG), team-member context (in the operating-contract files), framework state (in the memory index), regulator threshold values (in a verification ledger if the project keeps one).

## Anti-pattern — brain-as-ground-truth

The inverse failure: the agent finds the answer in the brain and relays it as freshly verified. The brain's answer is **context, not ground truth**. The [Verification Iron Rule](./verification-iron-rule.md) applies to the brain's answer just as it applies to any sub-agent report. Brain-first means *check the brain first*, not *trust the brain unconditionally*.

The right pattern is: brain-first lookup, then verification check (is the brain entry within its freshness window, or does it need re-verification before being relayed).

## Related conventions

- [`verification-iron-rule.md`](./verification-iron-rule.md) — applies to brain-lookup results.
- [`global-decision-tag.md`](./global-decision-tag.md) — `[GLOBAL]`-tagged decisions in one project's DECISIONS-LOG are part of every project's brain.

## Where this rule lives in the skills

Brain-first lookup is a standing rule that applies before any external research step. The Sprint Spine Stage 1 (Think) session-start routine and Stage 2 (Plan) research routine both invoke brain-first lookup before any external fetch.

---

## Document control

- 2026-05-20 — Initial public scaffold.
