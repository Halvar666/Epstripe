#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$ROOT_DIR/src"
DIST_DIR="$ROOT_DIR/dist"

if [[ ! -f "$SRC_DIR/install.rdf" ]]; then
  echo "Error: src/install.rdf not found." >&2
  exit 1
fi

VERSION="$(sed -n 's|.*<em:version>\([^<]*\)</em:version>.*|\1|p' "$SRC_DIR/install.rdf" | head -n1)"
NAME="$(sed -n 's|.*<em:name>\([^<]*\)</em:name>.*|\1|p' "$SRC_DIR/install.rdf" | head -n1)"

if [[ -z "$VERSION" || -z "$NAME" ]]; then
  echo "Error: unable to read theme name/version from install.rdf." >&2
  exit 1
fi

OUT="$DIST_DIR/${NAME}_${VERSION}.xpi"
SHA="$OUT.sha256"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

(
  cd "$SRC_DIR"
  find . -type f \
    ! -name '.DS_Store' \
    ! -name 'Thumbs.db' \
    ! -name '*~' \
    -print0 \
    | sort -z \
    | xargs -0 zip -q -9 "$OUT"
)

sha256sum "$OUT" > "$SHA"

echo "Built: $OUT"
echo "SHA256: $(cut -d' ' -f1 "$SHA")"
