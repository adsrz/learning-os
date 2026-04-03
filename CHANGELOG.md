# Changelog

## v0.1.0 - 2026-04-02

First public release of `Learning OS` as an AI-native, local-first learning harness.

### Highlights

- result-first public README with a visible `input -> command -> durable output` proof path
- worked public-safe packets for `research`, `single-book`, and `multi-book` flows
- machine-readable agent entrypoints and routing contracts
- repo-only validation for clean clones
- `pwsh`-first documented command path, with Windows `.cmd` wrappers kept as convenience entrypoints

### Experience Reflected In This Release

- `proof before architecture`
  Show a concrete packet outcome before asking new visitors to read the deeper harness split.
- `portable commands only when verified`
  Promote the `pwsh` path only after the actual script entrypoint has been tested locally.
- `one release-facing validation signal`
  Keep one public repo-only workflow instead of stacking near-duplicate CI surfaces.
- `public result, private maintainer state`
  Keep release working memory and maintainer routing outside the tracked public repo.

### Included Surfaces

- shared layer: `AI_CONTEXT.md`, `ai-context.json`, `AGENTS.md`, `system.md`
- routing and write-back contracts: `task-router.json`, `writeback-map.json`
- public-safe skills under `agent/skills/`
- worked examples and open samples
- validation and BYOS import helpers under `tools/`

### Non-Goals

- no third-party books, papers, PDFs, slides, or proprietary study materials
- no maintainer-only project state or release working notes inside the tracked public repo
