# Verification Iron Rule

*Nothing is done because an agent says it is. Proof or it did not happen.*

---

## The rule

- **Never relay a claim as verified based only on a document, status file, or sub-agent report.** Produce fresh evidence (read the file, run the check, quote the source) or explicitly downgrade.
- **Project state files** (`STATUS.md`, `DECISIONS-LOG.md`, prior session claims, memory entries) are **stale by default** — context, not ground truth.
- **When downgrading:** *"I previously said X was verified; on re-check I cannot confirm, downgrading to unverified."*

## Why this rule exists

State surfaces drift faster than they are updated. A claim recorded as `Confirmed` last week may be wrong this week — a regulator updates a rulebook, a vendor pivots a feature, a partnership renegotiates a term. Relaying a stale claim as fresh truth produces compounding errors. Each downstream artifact treats the relayed claim as ground truth. The failure surfaces only when an external party (regulator, investor, customer) catches it — at which point the cost of correction is many multiples of the cost of the original verification.

The rule looks pedantic until you watch an agent confidently relay a claim from a doc that is two weeks out of date, and the downstream artifact that referenced it lands in front of an external reader.

## How to apply

Before asserting any factual claim — number, date, name, status, regulatory position, partnership claim, technical capability — ask: *did I just verify this in this session, or am I relaying from memory or a state file?*

- **If relaying:** either re-verify (open the source, run the check) or downgrade the claim explicitly.
- **For research output:** `Confirmed` tag requires primary-source citation. Secondary sources (consultancy memos, news articles, encyclopedic summaries) are `Unverified` until the primary doc is read.
- **For session-start state reads** (STATUS, DECISIONS-LOG, MEMORY): treat as context, not as evidence. Verify against the current state of the world before acting on what they say.

## What triggers a downgrade

- The original verification was more than two weeks ago.
- The artifact carrying the claim has been edited since verification (claim may have drifted).
- The claim's underlying source is a sub-agent report, not the operator's own evidence.
- An external change (regulator update, vendor pivot, partnership renegotiation) could have invalidated the prior verification.

## Worked example

**Session 1.** An agent is asked: *what is the rate limit on the vendor's enterprise API tier?* The agent fetches the vendor's published docs, locates the relevant page, verifies the number, and records in `MEMORY.md`:

> Enterprise API rate limit: N req/s (vendor docs, pricing page, verified YYYY-MM-DD).

**Session 5, two weeks later.** A new agent (or the same agent in a new session) is asked the same question. The agent reads `MEMORY.md`, sees the entry, and — without the Iron Rule — relays `Confirmed: N req/s` to the operator as if freshly verified.

**With the Iron Rule applied:** the agent treats the memory entry as context, re-opens the vendor docs (which may have changed the limit on a new plan revision), confirms the current number, and either re-stamps the memory entry or revises it. The memory file is data, not evidence. The verification is what makes the claim shippable.

## Anti-pattern — sub-agent report as evidence

A sub-agent reports back with *"I verified X."* The orchestrator relays *"X is verified."* The orchestrator never opened the source. This is the same failure as relaying a memory entry — the sub-agent's report is data, not evidence. The orchestrator must either accept the claim as `Projected` (sub-agent reports without primary-source citation) or re-verify.

The fix is structural: sub-agent reports must include primary-source citations inline; the orchestrator's re-check is opening the cited source, not re-running the sub-agent.

## Anti-pattern — restart-as-verification

When debugging a misbehaving environment, the wrong move is *"let me restart and try again."* The right move is: re-read the last three tool outputs, identify the specific hypothesis the restart tests. If no hypothesis exists, the restart is a workaround, not a fix. Verifying current live state (processes, configs, logs, file system, running services) precedes any restart.

## Anti-pattern — the reviewer as rescue

The Iron Rule turns inward. An independent reviewer — a cross-model adversarial pass, a second specialist — is in the loop precisely so claims are caught before they ship. But the reviewer is there to *confirm*, not to *rescue*. When the orchestrator ships a fast first pass and leans on the reviewer to catch its over-claims, the reviewer becomes load-bearing: it starts *correcting* the work rather than confirming it, and a genuine blocking finding is no longer the safety net succeeding — it is the first pass failing.

The fix is to run the Iron Rule on your *own* output before the handoff. Every `Confirmed` tag and every load-bearing claim gets one question — *did I verify this myself against a primary source, or is it vendor-stated, inferred, or analogy?* — and is downgraded in place (`Vendor-documented` / `Interpretive` / `Projected` / `Unverified`). The reviewer then confirms; a must-fix finding from it is logged as a first-pass miss, not a win for the process. **Self-calibrate before the handoff: the safety net is not a substitute for aim.**

## Related conventions

- [`confidence-tags.md`](./confidence-tags.md) — the `Confirmed` / `Projected` / `Aspirational` rubric the Iron Rule applies to.
- [`brain-first-lookup.md`](./brain-first-lookup.md) — when the local brain answers, the Iron Rule applies to the brain's answer too.

## Where this rule lives in the skills

The Iron Rule is a standing rule that applies across every Sprint Spine stage. It is the rigor floor for Stage 1 Think (Q5 rigor bar per claim class), Stage 3 Build (Gate 3 claim-tag scan), and Stage 4 Review (audit auditor primary-source check).

---

## Document control

- 2026-05-20 — Initial public scaffold.
- 2026-06-17 — Added "Anti-pattern — the reviewer as rescue" (self-calibrate confidence before handoff; the reviewer confirms, it does not rescue).
