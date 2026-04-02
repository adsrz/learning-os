# Public Setup

This is a `system-ops` path, not a `teaching` workflow packet.

## Clean Clone

After cloning the repository, run:

```powershell
.\tools\Test-All.cmd -RepoOnly
```

This checks the public-safe repo surface only.

## Using Your Own Sources

1. Read [bring-your-own-sources.md](bring-your-own-sources.md).
2. Edit or copy [source-manifest.template.json](source-manifest.template.json) for your own study setup.
3. Import your files:

```powershell
.\tools\Import-LocalSources.cmd -SourceRoot C:\path\to\your\files
```

4. Validate the local setup:

```powershell
.\tools\Test-All.cmd
```

## Open Demo

If you want to see the public repo shape before importing any private materials, start with [demo-source.md](../samples/open/demo-source.md).
