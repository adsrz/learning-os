# Public Setup

This is a `system-ops` path, not a `teaching` workflow packet.

The primary documented command path uses `pwsh` so the public repo does not read as Windows-only. Windows `.cmd` wrappers remain available as convenience entrypoints.

## Clean Clone

After cloning the repository, run:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

This checks the public-safe repo surface only.

## Command Proof Matrix

| Path | Role | What is actually proven |
| --- | --- | --- |
| `pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly` | primary documented repo-only path | proven in the local Windows shell, proven in local `pwsh`, and exercised in GitHub Actions on Ubuntu and Windows via [repo-only-validation.yml](../.github/workflows/repo-only-validation.yml) |
| `.\tools\Test-All.cmd -RepoOnly` | Windows convenience wrapper | available for Windows convenience, but intentionally not the primary documented path |
| `pwsh -NoProfile -File ./tools/Test-All.ps1` | hydrated local BYOS validation | local-only path after you import your own sources |

## Using Your Own Sources

1. Read [bring-your-own-sources.md](bring-your-own-sources.md).
2. Edit or copy [source-manifest.template.json](source-manifest.template.json) for your own study setup.
3. Import your files:

```powershell
$SOURCE_ROOT = "/absolute/path/to/your/files" # or C:\path\to\your\files on Windows
pwsh -NoProfile -File ./tools/Import-LocalSources.ps1 -SourceRoot $SOURCE_ROOT
```

4. Validate the local setup:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1
```

Imported sources should stay under the existing ignored local roots such as `sources/`, `book/`, or `research_doc/`. Do not leave new top-level source folders in the repo root.

## Open Demo

If you want to see the public repo shape before importing any private materials, start with [demo-source.md](../samples/open/demo-source.md).
