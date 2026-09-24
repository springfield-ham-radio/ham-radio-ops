#!/bin/sh
set -eu

cd "$(dirname "$0")"

missing=0

check_cmd() {
  name="$1"
  hint="$2"

  if command -v "$name" >/dev/null 2>&1; then
    version="$("$name" --version 2>/dev/null | head -n 1)"
    printf 'ok: %s (%s)\n' "$name" "$version"
  else
    printf 'missing: %s\n' "$name" >&2
    printf '  %s\n' "$hint" >&2
    missing=1
  fi
}

check_cmd node "Install Node.js 24+ (see https://nodejs.org/) or use nvm with the version in each package's .nvmrc."
check_cmd cargo "Install Rust via rustup: https://rustup.rs/ (needed for ham-radio-ui / Tauri)."

if [ "$missing" -ne 0 ]; then
  printf '\nInstall the missing tools, then re-run ./prepare.sh\n' >&2
  exit 1
fi

# Sibling clones live outside this repo; do not write them into .gitignore.
mani sync --sync-gitignore=false
mani run prepare
