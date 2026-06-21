#!/usr/bin/env bash
set -euo pipefail

VERSION=$(python - <<'PYVER'
from pathlib import Path
import re
text = Path('install.rdf').read_text(encoding='utf-8')
m = re.search(r'<em:version>([^<]+)</em:version>', text)
if not m:
    raise SystemExit('Could not find em:version in install.rdf')
print(m.group(1))
PYVER
)

OUT="dist/Epstripe_${VERSION}.xpi"
mkdir -p dist
rm -f "$OUT"

zip -r "$OUT"   install.rdf   chrome.manifest   icon.png   preview.png   LICENSE   LICENSE_xpDefault_colored_buttons_MPL2.txt   XPDEFAULT_COLORED_BUTTONS_SOURCE.txt   EPSTRIPE_SOURCE_NOTES.txt   EPSTRIPE_RELEASE_NOTES.txt   chrome   -x '*.DS_Store' -x '*/__pycache__/*' -x '*~'

unzip -t "$OUT"
sha256sum "$OUT"
