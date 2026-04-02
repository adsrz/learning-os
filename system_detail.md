# System Detail

## Purpose

- Define the public file responsibilities.
- Keep the public/private boundary explicit.
- Explain how the repo stays reusable without bundling copyrighted source materials.
- Keep the agent-harness identity explicit at the public surface.

## Public File Responsibilities

- `README.md`
  - product-facing entry point for the public repo and its AI harness identity
- `AI_CONTEXT.md`
  - low-token, high-signal entrypoint for AI agents opening the repo
- `ai-context.json`
  - machine-readable repo contract for AI onboarding
- `task-router.json`
  - machine-readable task routing contract from task type to workflow mode and skill
- `writeback-map.json`
  - machine-readable write-back contract by workflow mode
- `LICENSE`
  - MIT license for the repository code and original public content
- `system.md`
  - high-level identity and stable principles
- `agent/README.md`
  - minimal public-safe agent surface for the harness
- `agent/skills/index.json`
  - machine-readable registry of public-safe skills
- `agent/skills/*/SKILL.md`
  - example public-safe skill surfaces that show how bounded agent work should run
- `docs/ai-harness.md`
  - public explanation of the harness layer and why it is not just a study repo
- `docs/agent-architecture.md`
  - public architecture of source intake, routing, validation, and write-back
- `docs/run-with-codex.md`
  - operator-facing guide for using the harness with Codex
- `docs/demo-flow.md`
  - public-safe example flow from source intake to durable write-back
- `templates/project-template/*`
  - minimal reusable write-back targets for local projects
- `examples/*`
  - worked public-safe packets that show the result after a bounded harness pass
- `docs/architecture.md`
  - public repo architecture and layer split
- `docs/workflow-modes.md`
  - workflow-mode overview
- `docs/public-setup.md`
  - operator-facing setup path for this public repo
- `docs/bring-your-own-sources.md`
  - public boundary and local source import rules
- `docs/source-manifest.template.json`
  - template that maps source ids to expected local paths and workflow modes
- `docs/examples/`
  - public-safe example descriptions of the supported workflow modes
- `samples/open/`
  - open sample materials that let clean clones explore the system without private inputs
- `tools/Test-Lint.ps1`
  - repo-safe deterministic lint gate
- `tools/Test-PublicSetup.ps1`
  - public setup and local source-root validation
- `tools/Test-All.ps1`
  - single-command validation entry point
- `tools/Import-LocalSources.ps1`
  - helper for copying or moving user-owned local materials into ignored local source roots
- `.github/workflows/*.yml`
  - repo-visible CI for clean-clone validation

## Private Boundary

These surfaces are intentionally local-only and must stay out of tracked history:

- `sources/`
- `book/`
- `research_doc/`
- generated local artifacts beyond tracked placeholders
- personal runtime logs
- personal memory/state files
- local absolute machine paths

## License Boundary

- The repository code and original public documentation are MIT-licensed.
- Third-party books, papers, PDFs, slides, images, and other source materials are not included and are not covered by the repository license.
