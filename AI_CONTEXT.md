# AI Context

This file is the shortest safe entrypoint for an AI agent opening `Learning OS`.

Machine-readable companion:

- [ai-context.json](ai-context.json)
- [task-router.json](task-router.json)
- [writeback-map.json](writeback-map.json)
- [agent/skills/index.json](agent/skills/index.json)

## Identity

- `repo_type`: AI-native, local-first learning harness
- `primary_goal`: run source-aware study workflows and preserve durable write-back
- `not_this`: not a private source archive, not a generic chat notebook, not a public redistribution repo
- `packet_model`: shared layer plus exactly one primary overlay

## Audience Split

- `human_proof_reader`: start with [README.md](README.md) and [docs/demo-flow.md](docs/demo-flow.md) if you want proof before architecture.
- `ai_agent_router`: start with this file, then the machine contracts and overlay docs.

## Fast Read Order

Read in this order when context is limited:

1. [AGENTS.md](AGENTS.md)
2. [system.md](system.md)
3. [agent/README.md](agent/README.md)
4. [docs/agent-architecture.md](docs/agent-architecture.md)
5. [docs/run-with-codex.md](docs/run-with-codex.md)

If you only need the public proof surface, read [README.md](README.md) and [docs/demo-flow.md](docs/demo-flow.md) before the deeper architecture docs.

If the task is about setup or local sources, also read:

6. [agent/skills/repo-ops-and-validation/SKILL.md](agent/skills/repo-ops-and-validation/SKILL.md)
7. [docs/public-setup.md](docs/public-setup.md)
8. [docs/bring-your-own-sources.md](docs/bring-your-own-sources.md)

If the task is about real packet shape or write-back, also read:

9. [templates/project-template/README.md](templates/project-template/README.md)
10. [examples/research-intake-packet](examples/research-intake-packet)
11. [examples/single-book-packet](examples/single-book-packet)
12. [examples/multi-book-packet](examples/multi-book-packet)

## Core Contract

- primary overlay must be explicit
- sources must be explicit
- workflow mode must be explicit for teaching tasks
- local/private boundaries must stay explicit
- write-back matters as much as the explanation
- bounded passes are preferred over vague, over-broadened chat

## Primary Overlays

- `teaching`
  - source-aware learning work
  - routes into one workflow mode
- `system-ops`
  - setup
  - local source import
  - validation
  - public/private boundary checks
  - repo-safe harness maintenance

## Teaching Workflow Modes

- `single-book deep reading`
- `multi-book synthesis`
- `thesis / non-textbook reading`
- `research / paper workflow`

## Key Agent Surfaces

- [agent/skills/repo-ops-and-validation/SKILL.md](agent/skills/repo-ops-and-validation/SKILL.md)
- [agent/skills/workflow-routed-study-pass/SKILL.md](agent/skills/workflow-routed-study-pass/SKILL.md)
- [agent/skills/research-source-intake/SKILL.md](agent/skills/research-source-intake/SKILL.md)

## Machine Contracts

- [task-router.json](task-router.json)
- [writeback-map.json](writeback-map.json)
- [agent/skills/index.json](agent/skills/index.json)

## Durable Write-Back Targets

The preferred write-back shape is:

- `project.md`
- `session-log.md`
- `open-questions.md`
- `distinctions.md`

These targets belong in your local project area, usually copied from [templates/project-template](templates/project-template). They are not tracked write-back files inside this public repo.

See [templates/project-template](templates/project-template).

## Hard Boundaries

Do not commit:

- `sources/`
- `book/`
- `research_doc/`
- private books, papers, PDFs, slides, or captured materials
- personal runtime state
- local absolute machine paths
- maintainer-only packaging state or release working notes

## First Commands

Clean-clone validation:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

Local source import:

```powershell
$SOURCE_ROOT = "/absolute/path/to/your/files" # or C:\path\to\your\files on Windows
pwsh -NoProfile -File ./tools/Import-LocalSources.ps1 -SourceRoot $SOURCE_ROOT
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1
```

Windows `.cmd` wrappers still exist, but the primary public command path is `pwsh`.

## If You Only Remember One Thing

This repo is not finished when the agent produces an answer.

It is finished when the task has a clear overlay owner, a clear source boundary, and either a durable write-back target or a validated repo-safe result.
