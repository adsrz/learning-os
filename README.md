# Learning OS

Local-first learning infrastructure for deep reading, multi-source synthesis, thesis-style reading, and research workflows.

`Learning OS` is not a notes dump and not a personal vault template. It is a reusable operating model for people who want a study system with continuity, structure, and explicit source handling.

## Why It Exists

Most study repos are good at storing notes and bad at running a learning process.

This repo is designed to make these things first-class:

- stable project continuity across long study arcs
- source-aware reading workflows instead of generic note capture
- reusable distinctions, evidence, and open questions
- validation-backed repo hygiene
- bring-your-own-sources operation without bundling copyrighted materials

## Workflow Modes

- `Single-book deep reading`
  One primary source, slow mechanism-first reading, cumulative write-back.
- `Multi-book synthesis`
  Several sources routed into one structured learning program without flattening them into one book.
- `Thesis / non-textbook reading`
  Books that are argument-heavy, essay-like, or theory-first rather than textbook-first.
- `Research / paper workflow`
  Papers, reports, captured articles, and intake pipelines that need classification before study.

The included examples are reference implementations of these modes. They are not the only supported subjects and not the only source set you can use.

## What You Can Do With It

- run the repo as a public-safe learning framework
- clone it and explore the workflow without any private source bundle
- plug in your own lawfully obtained books, papers, and long-form materials
- adapt the project structure to finance, economics, philosophy, policy, ML, or other serious reading domains

## Quick Start

Run the repo-only checks:

```powershell
.\tools\Test-All.cmd -RepoOnly
```

Read the public setup guide:

- [public-setup.md](docs/public-setup.md)
- [bring-your-own-sources.md](docs/bring-your-own-sources.md)
- [workflow-modes.md](docs/workflow-modes.md)

Try the included open sample:

- [demo-source.md](samples/open/demo-source.md)

When you are ready to use your own materials, import them into the local ignored source roots:

```powershell
.\tools\Import-LocalSources.cmd -SourceRoot C:\path\to\your\files
.\tools\Test-PublicSetup.cmd
```

## Repo Structure

- [system.md](system.md)
  Public identity and operating principles.
- [system_detail.md](system_detail.md)
  File responsibilities and public/private boundary rules.
- [docs/architecture.md](docs/architecture.md)
  How the system is split into core, examples, and local source layers.
- [docs/workflow-modes.md](docs/workflow-modes.md)
  The four supported learning modes.
- [docs/examples](docs/examples)
  Example mode write-ups you can adapt.
- [docs/source-manifest.template.json](docs/source-manifest.template.json)
  Template for mapping your own sources into the local layout.
- [tools](tools)
  Repo checks and local source import helpers.

## Public Boundary

This public repository does **not** include third-party books, papers, PDFs, slides, or proprietary study materials.

You are expected to bring your own lawfully obtained sources.

This is deliberate:

- it keeps the repo legally safer and easier to share
- it keeps the framework source-agnostic instead of tying it to one private library
- it makes the project reusable for far more domains than the original example set

## Examples, Not Limits

The private workspace that inspired this repo includes example implementations of:

- derivatives as `single-book deep reading`
- fixed income as `multi-book synthesis`
- thesis-style reading as `non-textbook reading`
- paper and report intake as `research workflow`

In the public repo, those examples are treated as mode references, not as a required canon.

## Validation

Repo-only validation:

```powershell
.\tools\Test-All.cmd -RepoOnly
```

Local setup validation after importing your own sources:

```powershell
.\tools\Test-All.cmd
```

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE).

Third-party books, papers, PDFs, slides, and other source materials are not included and are not covered by this repository license.
