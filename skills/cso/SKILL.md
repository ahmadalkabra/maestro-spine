---
name: cso
description: Chief-Security-Officer full-codebase security audit (NOT a single-diff review, NOT device hardening). Opt-in via explicit invocation. Orchestrates a SAST scanner + your standard code-review pass + cross-model adversarial review along an OWASP-Top-10 + STRIDE + supply-chain + LLM/AI-security phase structure, then a false-positive verification pass. Use before a security-sensitive launch, for a periodic codebase audit, or when handling money / regulated / personal data.
---

> **Opt-in skill.** Invoke explicitly for a full-codebase security audit. Distinct from a single-PR security review (use your code-review pass for that) and from device/machine hardening (a different concern entirely). Pairs with the [Verification Iron Rule](../../docs/verification-iron-rule.md): every finding gets active verification — quote the vulnerable line or downgrade it.

## When to use

- **cso** → full-codebase security audit: pre-launch, periodic, or any code handling money / regulated / personal data.
- A single PR/diff at merge time → your standard code-review pass, not this.
- Hardening the machine/host (OS, ports, services) → a device-hardening pass, not this.

The orchestrator dispatches one security specialist; it never relays findings as verified without fresh evidence.

## Process — phased codebase audit (orchestrates existing tools)

Run the phases relevant to the codebase; skip what doesn't apply. Each phase pairs a tool with a manual lens:

1. **Architecture + stack model** — components, trust boundaries, data flows, external surfaces.
2. **Attack-surface census** — entry points: routes, APIs, webhooks, file uploads, auth flows, admin paths.
3. **Secrets archaeology** — scan history and config for committed secrets, keys, tokens.
4. **Dependency supply chain** — lockfile + advisory audit; flag known-CVE dependencies.
5. **SAST sweep** — run a static-analysis scanner across the codebase; triage by severity.
6. **OWASP Top 10 (A01–A10)** — per category, targeted search + review: broken access control, crypto failures, injection (SQL / shell / LLM-prompt), insecure design, misconfiguration, vulnerable components, auth failures, integrity failures, logging gaps, SSRF.
7. **STRIDE threat model** — per component: Spoofing / Tampering / Repudiation / Info-disclosure / DoS / Elevation.
8. **LLM / AI-security** — prompt-injection surfaces, tool-permission blast radius, untrusted-content-as-instructions on the product's own AI surfaces.
9. **CI/CD + infra** — pipeline permissions, deploy secrets, repo visibility, branch protection.
10. **Cross-model adversarial pass** — pipe the highest-risk findings through [codex-adversarial](../codex-adversarial/SKILL.md) for a second engine.
11. **False-positive filtering + active verification** — for each candidate, quote the vulnerable `file:line` and confirm it's reachable/exploitable, or downgrade it. No vibes (Verification Iron Rule).

## Output

A findings report:
- **Verdict** — PASS / PASS_WITH_FINDINGS / BLOCK (any verified critical ⇒ BLOCK)
- Findings table: severity · OWASP/STRIDE category · `file:line` · verified? · fix
- Top-3 must-fix, each with its exploit path
- Supply-chain + secrets summary
- Convergence note — which layer caught what (SAST vs cross-model vs manual)

For public or regulated products, end at an operator approval gate before any disclosure or fix-deploy.

## Gate

A verified CRITICAL finding BLOCKS launch/ship until fixed or explicitly risk-accepted by the operator (logged). Unverified findings are flagged, not blocking — but must be verified or downgraded, never relayed as confirmed.

## Document control

- 2026-06-01 — Initial public scaffold.
