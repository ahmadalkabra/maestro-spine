---
name: design-review
description: Scored visual-design QA on a live or rendered UI — produces a Design Score AND a dedicated AI-Slop grade, then a fix loop. Opt-in via explicit invocation. Layers a Lighthouse-style audit + screenshots + an accessibility pass into one integrated scored rubric (extends text anti-slop scoring to visual UI). Use to QA a rendered page/component before ship, or to grade a design against a premium bar. Distinct from a quick qualitative critique — this one scores.
---

> **Opt-in skill.** Invoke explicitly to score a *rendered* UI. Pairs with the [Anti-Slop Flag List](../../docs/anti-slop-flag-list.md) — this skill extends the text anti-slop discipline to visual UI. Requires rendered evidence (a screenshot or a live page), not a description — code-reading is not design QA.

## When to use

- **design-review** → score a *rendered* UI (live URL or built component) before ship; grade a design against a premium bar with an explicit fix loop.
- A quick qualitative read with no score → a plain design critique, not this.
- If nothing is rendered, render it first. A design QA scored from code-reading is not credible.

The orchestrator dispatches one design specialist; single pass.

## Process

1. **First impression (squint test).** Open the rendered page; narrate the first three things the eye goes to and whether they match the intended hierarchy. Capture a screenshot as evidence.
2. **10-category scorecard** (0–10 each, against "what a 10 looks like"): typography · layout/spacing · color & contrast (WCAG AA) · visual hierarchy · motion (state-change under ~200ms; honors prefers-reduced-motion) · accessibility (44px targets, focus states, alt text) · responsive (mobile / tablet / desktop viewports) · interaction-flow / goodwill · cross-page consistency · **AI-slop** (generic-default tells: system-ui fonts, purple-on-white, generic blue gradients, uncustomized utility-framework defaults).
3. **Two headline grades:**
   - **Design Score** — weighted A–F across categories 1–9.
   - **AI-Slop grade** — A–F, standalone (category 10). The visual analog of the text anti-slop flag list.
4. **Evidence:** a Lighthouse-style audit for perf / a11y / best-practices numbers; screenshots per viewport; console errors.
5. **Fix loop:** for each finding, state impact + the concrete fix; apply (or route to the builder), re-render, re-score. Record a before/after.

## Output

A scored design-QA report:
- **Design Score: <A–F>** · **AI-Slop grade: <A–F>**
- Per-category 0–10 grid with the one specific gap each
- Top-3 fixes, each with impact + rendered before/after
- Audit numbers (perf / a11y / best-practices)
- **Verdict:** SHIP / FIX-FIRST / BLOCK

## Gate

An AI-Slop grade of **D or F is a FIX-FIRST block** — generic-default aesthetics do not ship. A Design Score below the project's bar routes back to the builder with the specific category gaps named.

## Document control

- 2026-06-01 — Initial public scaffold.
