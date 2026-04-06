# Bring Your Own Sources

## Principle

This repository is designed for `BYOS`:

- bring your own books
- bring your own papers
- bring your own reports
- keep them local and ignored

## Local Source Roots

The public repo expects local source materials under ignored directories such as:

- `sources/books/`
- `sources/research/`

Legacy-compatible local roots such as `book/` and `research_doc/` may also be used during migration, but the public repo treats them as ignored local-only surfaces.

Keep new local materials inside those ignored roots.

Do not create ad hoc top-level folders for imported books, papers, or scratch bundles. If a new persistent root is genuinely needed, add it deliberately together with `.gitignore` and the public setup docs instead of relying on an accidental drop.

## What Not To Commit

- copyrighted books
- proprietary PDFs
- papers or slides without redistribution rights
- local source manifests that expose private file hashes or transport fingerprints
- personal runtime state and execution logs

## Legal Boundary

Users should obtain their own lawful copies of any third-party source materials.

This repository does not grant rights to third-party books, papers, PDFs, slides, or captured materials.
