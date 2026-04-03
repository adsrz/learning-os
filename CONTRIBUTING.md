# Contributing to Learning OS

Thanks for considering a contribution.

`Learning OS` is a public AI harness, not a mirror of a private study workspace. The best contributions make the public harness easier to understand, run, validate, or adapt without weakening the BYOS boundary.

## Good Contribution Types

- public-safe examples that do not require proprietary sources
- documentation that makes the first 5 minutes clearer
- portability fixes for the documented `pwsh` path
- validation improvements for repo-only checks
- workflow comparisons that clarify why a harness is useful
- case-study style writeups that show a durable packet outcome

## Out Of Scope

Please do not submit:

- third-party books, papers, PDFs, slides, or proprietary study materials
- private maintainer routing, working memory, or release prep notes
- personal runtime logs, machine paths, or local state dumps
- changes that make the repo depend on one private source library

## Before You Open A PR

1. Check [README.md](README.md) and [docs/demo-flow.md](docs/demo-flow.md) to confirm the current public flow.
2. Check [ROADMAP.md](ROADMAP.md) to see which public-facing gaps are already known.
3. If the change is non-trivial, open or comment on an issue first so the public surface does not drift in three directions at once.

## Submission Guidelines

- Keep the repo readable as an `AI harness`, not a generic notes dump.
- Preserve the public/private boundary described in [system_detail.md](system_detail.md).
- Prefer small, testable changes with a visible outcome.
- If behavior or commands changed, update the relevant public docs in the same patch.
- If you add or change a command path, keep `pwsh` as the primary documented path unless a different path has been verified and intentionally adopted.

## Validation

Run the repo-only checks before asking for review:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

If your change touches local-source import or setup behavior, also run:

```powershell
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1
```

## Example Contributions We Would Welcome

- a stronger non-finance public example
- cross-platform polish around the `pwsh` path
- a sharper comparison between this harness and prompt-only study workflows
- a public-safe case study that shows durable write-back on a real open source

## Review Standard

The bar is not only "does it work?"

The bar is also:

- does it make the repo easier to try quickly
- does it strengthen the proof that durable write-back is the point
- does it stay public-safe and source-agnostic

If you are unsure whether something belongs in the public repo, open an issue first.
