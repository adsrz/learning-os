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

## Fast Read Order

Read in this order when context is limited:

1. [AGENTS.md](AGENTS.md)
2. [system.md](system.md)
3. [agent/README.md](agent/README.md)
4. [docs/agent-architecture.md](docs/agent-architecture.md)
5. [docs/run-with-codex.md](docs/run-with-codex.md)

If the task is about setup or local sources, also read:

6. [docs/public-setup.md](docs/public-setup.md)
7. [docs/bring-your-own-sources.md](docs/bring-your-own-sources.md)

If the task is about real packet shape or write-back, also read:

8. [templates/project-template/README.md](templates/project-template/README.md)
9. [examples/research-intake-packet](examples/research-intake-packet)
10. [examples/single-book-packet](examples/single-book-packet)
11. [examples/multi-book-packet](examples/multi-book-packet)

## Core Contract

- sources must be explicit
- workflow mode must be explicit
- local/private boundaries must stay explicit
- write-back matters as much as the explanation
- bounded passes are preferred over vague, over-broadened chat

## Workflow Modes

- `single-book deep reading`
- `multi-book synthesis`
- `thesis / non-textbook reading`
- `research / paper workflow`

## Key Agent Surfaces

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
.\tools\Test-All.cmd -RepoOnly
```

Local source import:

```powershell
.\tools\Import-LocalSources.cmd -SourceRoot C:\path\to\your\files
.\tools\Test-PublicSetup.cmd
```

## If You Only Remember One Thing

This repo is not finished when the agent produces an answer.

It is finished when the answer has a clear workflow owner, a clear source boundary, and a durable write-back target.
