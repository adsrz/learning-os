# System Detail

## Purpose

- Define the public file responsibilities.
- Define the public shared-layer and primary-overlay routing surfaces.
- Keep the public/private boundary explicit.
- Explain how the repo stays reusable without bundling copyrighted source materials.
- Keep the agent-harness identity explicit at the public surface.
- Keep maintainer-only packaging state outside the pushed public result.

## Public File Responsibilities

- `README.md`
  - product-facing entry point for the public repo and its AI harness identity
- `AI_CONTEXT.md`
  - low-token, high-signal shared-layer entrypoint for AI agents opening the repo
- `ai-context.json`
  - machine-readable shared-layer contract for AI onboarding
- `AGENTS.md`
  - public routing rule for `shared layer + exactly one primary overlay`
- `task-router.json`
  - machine-readable task routing contract from task type to primary overlay, workflow mode, and skill
- `writeback-map.json`
  - machine-readable write-back contract for `teaching` workflow modes
- `LICENSE`
  - MIT license for the repository code and original public content
- `system.md`
  - high-level identity and stable principles
- `agent/README.md`
  - minimal public-safe agent surface for the harness
- `agent/skills/index.json`
  - machine-readable registry of public-safe skills
- `agent/skills/repo-ops-and-validation/SKILL.md`
  - public-safe `system-ops` skill for setup, validation, boundary checks, and repo-safe maintenance
- `agent/skills/*/SKILL.md`
  - example public-safe skill surfaces that show how bounded agent work should run inside one primary overlay
- `docs/ai-harness.md`
  - public explanation of the harness layer and why it is not just a study repo
- `docs/agent-architecture.md`
  - public architecture of shared layer, overlay routing, validation, and write-back
- `docs/run-with-codex.md`
  - operator-facing guide for using the harness with Codex
- `docs/demo-flow.md`
  - public-safe example flow from source intake to durable write-back
- `templates/README.md`
  - public index for the available local write-back template families
- `templates/project-template/*`
  - minimal reusable write-back targets for single-book and other core local projects
- `templates/multi-book-project-template/*`
  - minimal reusable write-back targets for bounded local multi-book synthesis projects
- `examples/*`
  - worked public-safe packets that show the result after a bounded harness pass
- `docs/architecture.md`
  - public repo architecture and the split between shared layer, primary overlays, and local BYOS surfaces
- `docs/workflow-modes.md`
  - workflow-mode overview for the `teaching` overlay
- `docs/public-setup.md`
  - operator-facing `system-ops` setup path for this public repo
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
- maintainer-only owner bundles and release-routing notes that live outside the public repo
- local project areas copied from `templates/project-template/` or `templates/multi-book-project-template/`
- generated local artifacts beyond tracked placeholders
- personal runtime logs
- personal memory/state files
- local absolute machine paths
- maintainer-only packaging logs, submission working state, and release-prep notes

## License Boundary

- The repository code and original public documentation are MIT-licensed.
- Third-party books, papers, PDFs, slides, images, and other source materials are not included and are not covered by the repository license.
