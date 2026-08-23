# Epstripe

**Epstripe** is a Winstripe/Windows XP-style complete theme for **Epyrus**.

It combines a ClassicTB2/Epyrus-compatible theme structure with selected Winstripe-, Thunderstripe- and Thunderbird-era icon work while keeping current Epyrus geometry and platform behavior where practical.

## Compatibility

- Epyrus 2.0.0–2.2.*
- Linux
- Windows

The theme contains separate Linux and Windows compatibility layers. Windows-specific titlebar, caption-button, menu-bar and toolbar dropmarker fixes are isolated under `chrome/Epstripe/skin/os/winnt/`.

## Current release

**1.0.0rc1** — first public release candidate.

Main highlights:

- Winstripe/Thunderstripe-style mail, compose and Address Book icons
- corrected Winstripe 1.9.9 Tag / Back / Forward toolbar mapping
- 20×20 normal and 16×16 small main toolbar icons
- Epyrus-compatible toolbar geometry
- improved inactive-selection readability
- Calendar/Tasks icon support
- Windows-specific titlebar/caption controls based on Epyrus 2.2.1 behavior
- Windows Menu Bar contrast and split-button/dropmarker fixes

## Building

Requirements: `bash`, `zip`, `sha256sum`.

```sh
./build.sh
```

The resulting XPI and SHA256 file are written to `dist/`.

## Source layout

- `src/` — complete XPI source tree
- `release-notes/` — release notes for published versions
- `CREDITS.md` — contributor and source credits
- `NOTICE.txt` — source/provenance summary
- `CHANGELOG.md` — project changelog

Detailed source and license tracking is also retained inside the XPI source as `src/EPSTRIPE_SOURCE_NOTES.txt`.

## Known issue

Some localized Epyrus language packs may still display **Thunderbird** instead of **Epyrus** in the app menu button. The English UI displays the correct branding; this is a language-pack branding issue rather than a theme issue.

## License

Epstripe is distributed under the **Mozilla Public License 2.0 (MPL 2.0)** unless a file carries a more specific original notice. See `LICENSE`, `NOTICE.txt`, and the source notes for details.
