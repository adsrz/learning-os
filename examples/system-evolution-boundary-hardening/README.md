# System-Evolution Case: Boundary Hardening

This is the first public system-evolution case for `Learning OS`.

It shows how the harness reacted to a concrete boundary-drift signal without exporting private maintainer state.

## Signal

The sibling public-boundary audit exposed that the public repo still had contract drift in two places:

- repo-only validation did not yet block tracked `owner.md` drift or stale private-owner path references
- setup guidance still left room for imported materials to land outside the established ignored roots

This was not mainly a landing-page problem. It was a harness contract problem: the public repo could look fine while drifting away from the stricter `study -> public artifact` boundary model.

## Diagnosis

The right patch home was the boundary and validation surface, not the homepage:

- [.gitignore](../../.gitignore)
- [tools/Test-PublicSetup.ps1](../../tools/Test-PublicSetup.ps1)
- [docs/bring-your-own-sources.md](../../docs/bring-your-own-sources.md)
- [docs/public-setup.md](../../docs/public-setup.md)
- [system_detail.md](../../system_detail.md)
- [agent/skills/repo-ops-and-validation/SKILL.md](../../agent/skills/repo-ops-and-validation/SKILL.md)

That patch home keeps the boundary executable instead of relying on maintainer memory.

## Patch

The hardening pass did three things:

- made the root admission boundary explicit so imported materials stay under established ignored roots such as `sources/`, `book/`, and `research_doc/`
- taught the repo-only boundary validator to reject tracked `owner.md` drift and stale private-owner path references on public-facing surfaces
- aligned the public setup and repo-ops docs with the stricter boundary model

The underlying public patch landed in commit `f46f65e` (`Sync public boundary hardening from study`).

## Validation

Run:

```powershell
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1 -RepoOnly
pwsh -NoProfile -File ./tools/Test-Lint.ps1
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

These checks matter because the proof is behavioral, not rhetorical: the repo should fail if boundary-sensitive files drift back toward maintainer-only surfaces or if source-admission guidance starts permitting unsafe roots again.

## Durable Result

After the fix:

- repo-only validation guards against `owner.md` drift and stale private-owner references
- source-admission docs keep imported materials inside existing ignored roots
- the public repo now shows one concrete example of the harness improving its own contracts, not only producing study packets

## Why This Stays Public-Safe

This case uses repo-visible validators, docs, and tracked public files only.

It does not export private owner bundles, release-prep notes, or internal maintainer routing.
