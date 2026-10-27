#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$ROOT/llvm"
DST="$ROOT/llvm-project/llvm"

if [[ ! -d "$SRC" || ! -d "$DST" ]]; then
    echo "Error: source or destination directory does not exist." >&2
    exit 1
fi

cp -av "$SRC/." "$DST/"

echo "MiniToyRISCV files copied into llvm-project/llvm."
