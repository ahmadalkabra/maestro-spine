#!/usr/bin/env bash
# Check the Maestro Spine onboarding/install surface. This is not an installer.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail=0

check_file() {
  if [ ! -f "$1" ]; then
    echo "missing: $1" >&2
    fail=1
  else
    echo "ok: $1"
  fi
}

check_dir() {
  if [ ! -d "$1" ]; then
    echo "missing: $1" >&2
    fail=1
  else
    echo "ok: $1"
  fi
}

check_search_tool() {
  if command -v rg >/dev/null 2>&1; then
    echo "ok: rg"
  elif command -v grep >/dev/null 2>&1; then
    echo "ok: grep fallback"
  else
    echo "missing required command: rg or grep" >&2
    fail=1
  fi
}

search_matches() {
  if command -v rg >/dev/null 2>&1; then
    rg -n "$@"
  else
    grep -En "$@"
  fi
}

search_has_match() {
  if command -v rg >/dev/null 2>&1; then
    rg -n "$@" >/dev/null
  else
    grep -En "$@" >/dev/null
  fi
}

echo "== required files =="
check_file "README.md"
check_file "START_HERE.md"
check_file "AGENTS.md"
check_file "CLAUDE.md"
check_file "ACKNOWLEDGMENTS.md"
check_file "THIRD_PARTY_NOTICES.md"
check_file "LICENSE"
check_file "NOTICE"
check_file "docs/install.md"
check_file "docs/operating-model.md"
check_file "docs/global-brain.md"

echo
echo "== skill skeletons =="
for d in \
  skills/sprint-think \
  skills/sprint-plan \
  skills/sprint-build \
  skills/sprint-review \
  skills/sprint-test \
  skills/sprint-ship \
  skills/sprint-reflect \
  skills/office-hours \
  skills/ceo-review \
  skills/sprint-autoplan \
  skills/cso \
  skills/design-review \
  skills/codex-adversarial
do
  check_dir "$d"
  check_file "$d/SKILL.md"
done

echo
echo "== codex-adversarial prompt templates =="
for f in \
  skills/codex-adversarial/prompts/code-adversarial.md \
  skills/codex-adversarial/prompts/design-review.md \
  skills/codex-adversarial/prompts/doc-pressure-test.md
do
  check_file "$f"
done

echo
echo "== command preflight =="
check_search_tool

if command -v rg >/dev/null 2>&1 || command -v grep >/dev/null 2>&1; then
  echo
  echo "== unresolved install placeholders =="
  if search_matches "ESSAY_URL|TODO_INSTALL|PLACEHOLDER_INSTALL|<insert|\\[insert" \
    README.md START_HERE.md docs/install.md CLAUDE.md skills/codex-adversarial/SKILL.md
  then
    echo "placeholder residue found" >&2
    fail=1
  else
    echo "ok: no install placeholder residue"
  fi

  echo
  echo "== tool-shape disclosure =="
  if search_has_match "Claude-style|tool-independent|adapt" README.md START_HERE.md docs/install.md; then
    echo "ok: Claude/tool-agnostic boundary is disclosed"
  else
    echo "missing Claude/tool-agnostic disclosure" >&2
    fail=1
  fi
fi

echo
if [ "$fail" -eq 0 ]; then
  echo "install surface: PASS"
else
  echo "install surface: BLOCK" >&2
fi

exit "$fail"
