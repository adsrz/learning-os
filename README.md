<div align="right">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">简体中文</a>
</div>

# Learning OS

`Type: AI Harness` `Mode: Local-First` `Sources: BYOS` `License: MIT`

An AI-native, local-first learning harness for deep reading, synthesis, thesis-style reading, and research workflows.

`Learning OS` is not just a study repo. It is a harness: it gives an AI agent explicit source boundaries, workflow routing, validation gates, and durable write-back so long-horizon learning can stay structured instead of collapsing into generic chat.

The public promise is simple: turn a source you own locally into durable study state instead of restarting from zero every chat.

Prefer a packaged snapshot over `git clone`? See [Releases](https://github.com/adsrz/learning-os/releases).
Looking for what is next or how to help? See [ROADMAP.md](ROADMAP.md), [CONTRIBUTING.md](CONTRIBUTING.md), and [Issues](https://github.com/adsrz/learning-os/issues).

This public cut also makes a few packaging lessons explicit:

- show one durable output before asking visitors to read deeper architecture
- document the portable `pwsh` path only after it has been locally verified
- keep one public validation workflow instead of duplicating release signals
- keep maintainer routing and release working state out of the tracked public repo

For AI agents that need the shortest high-signal entrypoint, start with [AI_CONTEXT.md](AI_CONTEXT.md). If a machine-readable entrypoint is better, use [ai-context.json](ai-context.json).

## 60-Second Proof

Run the clean-clone checks:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

On Windows, the convenience wrapper still works:

```powershell
.\tools\Test-All.cmd -RepoOnly
```

Then inspect one worked result:

- [samples/open/demo-source.md](samples/open/demo-source.md)
- [examples/research-intake-packet/project.md](examples/research-intake-packet/project.md)
- [examples/research-intake-packet/session-log.md](examples/research-intake-packet/session-log.md)
- [examples/research-intake-packet/open-questions.md](examples/research-intake-packet/open-questions.md)
- [examples/research-intake-packet/distinctions.md](examples/research-intake-packet/distinctions.md)

Visible outcome:

```text
project.md        -> workflow_mode: research / paper workflow
session-log.md    -> what_changed: source classified and first durable packet state created
open-questions.md -> what minimum evidence should a research-intake packet capture?
distinctions.md   -> source arrival is not the same thing as study packet readiness
```

That is the core proof surface of the repo: one open sample goes in, and a reusable packet with workflow ownership, session state, open questions, and distinctions comes out.

In one glance, the difference from prompt-only chat is this:

```text
prompt-only chat -> one answer in chat history
Learning OS      -> project.md + session-log.md + open-questions.md + distinctions.md
```

## Quick View

```text
Shared layer -> AI_CONTEXT.md / ai-context.json / AGENTS.md
Overlay      -> teaching or system-ops
Routing      -> task-router.json
Execution    -> public-safe skills under agent/skills
Validation   -> pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
Write-back   -> local packet files for teaching work
```

## Portable CLI Path

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
$SOURCE_ROOT = "/absolute/path/to/your/files" # or C:\path\to\your\files on Windows
pwsh -NoProfile -File ./tools/Import-LocalSources.ps1 -SourceRoot $SOURCE_ROOT
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1
```

Windows `.cmd` wrappers are included, but the documented primary path uses `pwsh` so the repo does not read as Windows-only.

Proof, not copy: the repo-only validation is already exercised through the local Windows shell, through `pwsh`, and in GitHub Actions on Ubuntu and Windows via [repo-only-validation.yml](.github/workflows/repo-only-validation.yml).

## Why This Is An AI Harness

Most AI study setups are just prompts pointed at a pile of notes.

`Learning OS` adds the missing harness layer:

- `Source intake`
  The system expects explicit source manifests and local source roots instead of implicit context blobs.
- `Workflow routing`
  Reading modes are routed differently for single-book work, synthesis, thesis-style reading, and research intake.
- `Validation gates`
  Repo-safe checks and public/private boundaries are part of the operating model, not an afterthought.
- `Durable write-back`
  The useful output is not only the chat response. It is the updated project state, distinctions, open questions, and reusable notes.
- `Local-first operation`
  The system is designed to run against your own files and your own lawfully obtained sources.

## Routing Model

The harness exposes two primary overlays:

- `Teaching overlay`
  Owns source-aware learning work. Once the task is in this overlay, route it into one of the four workflow modes.
- `System-ops overlay`
  Owns setup, local-source import, validation, public/private boundary checks, and repo-safe harness maintenance.

That split is important: not every task should be flattened into a study pass.

## Teaching Workflow Modes

The harness currently ships with four reusable workflow modes:

- `Single-book deep reading`
  One primary source, slow mechanism-first reading, cumulative write-back.
- `Multi-book synthesis`
  Several sources routed into one structured program without flattening them into one book.
- `Thesis / non-textbook reading`
  Argument-heavy or theory-first books that need a different reading protocol from textbook-style study.
- `Research / paper workflow`
  Papers, reports, captured articles, and intake pipelines that need classification before study.

These are reference workflows, not a fixed canon. The harness is source-agnostic.

## Harness Loop

```text
Bring your own sources -> classify and map local materials -> route by workflow mode -> run the agentic study pass -> validate -> write back durable state
```

## How The Agent Layer Works

The public repo now ships with a minimal `agent` layer instead of only high-level docs.

- [AI_CONTEXT.md](AI_CONTEXT.md)
  The shortest AI-optimized entrypoint for understanding the repo.
- [ai-context.json](ai-context.json)
  Machine-readable repo context for agent onboarding.
- [task-router.json](task-router.json)
  Machine-readable routing contract from task type to primary overlay, workflow mode, and skill.
- [writeback-map.json](writeback-map.json)
  Machine-readable write-back contract for `teaching` workflow modes.
- [agent/README.md](agent/README.md)
  Explains the public-safe execution surface.
- [agent/skills/repo-ops-and-validation/SKILL.md](agent/skills/repo-ops-and-validation/SKILL.md)
  A minimal `system-ops` skill for setup, validation, boundary checks, and repo-safe maintenance.
- [agent/skills/workflow-routed-study-pass/SKILL.md](agent/skills/workflow-routed-study-pass/SKILL.md)
  A minimal skill that shows how to run one bounded, source-aware study pass.
- [agent/skills/research-source-intake/SKILL.md](agent/skills/research-source-intake/SKILL.md)
  A more concrete intake skill for papers, reports, and captured articles.
- [docs/run-with-codex.md](docs/run-with-codex.md)
  Shows how to use this repo with Codex as an actual harness.

## Start In Two Lanes

### Starter lane: see a result in about 5 minutes

1. Run the public checks:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

2. Follow the shortest walkthrough:
   - [docs/demo-flow.md](docs/demo-flow.md)
   - [Paste-first prompt](docs/demo-flow.md#suggested-first-prompt)
3. Inspect the open sample and worked packet side by side:
   - [samples/open/demo-source.md](samples/open/demo-source.md)
   - [examples/research-intake-packet](examples/research-intake-packet)
4. When you are ready to try your own files:

```powershell
$SOURCE_ROOT = "/absolute/path/to/your/files" # or C:\path\to\your\files on Windows
pwsh -NoProfile -File ./tools/Import-LocalSources.ps1 -SourceRoot $SOURCE_ROOT
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1
```

### Architecture lane: understand how the harness is built

- [docs/run-with-codex.md](docs/run-with-codex.md)
- [docs/ai-harness.md](docs/ai-harness.md)
- [docs/agent-architecture.md](docs/agent-architecture.md)
- [docs/public-setup.md](docs/public-setup.md)
- [docs/bring-your-own-sources.md](docs/bring-your-own-sources.md)
- [docs/workflow-modes.md](docs/workflow-modes.md)
- [CHANGELOG.md](CHANGELOG.md)

## Roadmap And Contribution

If the repo makes sense and you want to extend it, use these public-facing entrypoints:

- [ROADMAP.md](ROADMAP.md)
  See the next public gaps with the highest leverage.
- [CONTRIBUTING.md](CONTRIBUTING.md)
  See what kinds of changes fit the public harness.
- [Issues](https://github.com/adsrz/learning-os/issues)
  Report bugs, propose workflow ideas, or suggest a public-safe case study.

Right now the most valuable public contributions are:

- a stronger non-finance case study
- cross-platform polish around the verified `pwsh` path
- sharper comparisons against prompt-only study workflows
- onboarding improvements that reduce time-to-first-result

## Repo Map

- [system.md](system.md)
  Public identity and operating principles.
- [CHANGELOG.md](CHANGELOG.md)
  Public release history.
- [ROADMAP.md](ROADMAP.md)
  Near-term public-facing priorities.
- [CONTRIBUTING.md](CONTRIBUTING.md)
  Contribution rules and validation expectations.
- [system_detail.md](system_detail.md)
  Public/private boundary rules and file responsibilities.
- [agent/README.md](agent/README.md)
  Minimal public-safe agent layer for the harness.
- [agent/skills/repo-ops-and-validation/SKILL.md](agent/skills/repo-ops-and-validation/SKILL.md)
  Public-safe `system-ops` skill for setup and boundary-sensitive repo work.
- [templates/project-template](templates/project-template)
  Minimal reusable project skeleton for durable write-back.
- [examples/research-intake-packet](examples/research-intake-packet)
  A worked public-safe example packet after one bounded harness pass.
- [examples/single-book-packet](examples/single-book-packet)
  A worked source-owned packet for `single-book deep reading`.
- [examples/multi-book-packet](examples/multi-book-packet)
  A worked packet that preserves overlap and tension across two sources.
- [docs/ai-harness.md](docs/ai-harness.md)
  What makes this project a harness rather than a generic study repo.
- [docs/agent-architecture.md](docs/agent-architecture.md)
  The harness loop and public-facing agent architecture.
- [docs/run-with-codex.md](docs/run-with-codex.md)
  How to operate the repo as a Codex-driven harness.
- [docs/demo-flow.md](docs/demo-flow.md)
  A real public-safe flow from source intake to write-back.
- [docs/architecture.md](docs/architecture.md)
  How the repo is split into harness, examples, and local-source layers.
- [docs/workflow-modes.md](docs/workflow-modes.md)
  The four supported learning modes.
- [docs/examples](docs/examples)
  Example mode write-ups you can adapt.
- [docs/source-manifest.template.json](docs/source-manifest.template.json)
  Template for mapping your own sources into the local layout.
- [tools](tools)
  Validation and local-source import helpers.

## Public Boundary

This public repository does **not** include third-party books, papers, PDFs, slides, or proprietary study materials.

You are expected to bring your own lawfully obtained sources.

That boundary is deliberate:

- it keeps the repo safer to publish and easier to share
- it keeps the harness reusable beyond one private library
- it lets the same operating model work across finance, economics, philosophy, policy, ML, and other reading-heavy domains

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE).

Third-party books, papers, PDFs, slides, and other source materials are not included and are not covered by this repository license.
