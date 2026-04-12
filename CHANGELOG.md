# Changelog

## Unreleased - 2026-04-12

Public top-surface maintenance after `v0.1.1`.

### Highlights

- clearer proof-first audience split across `README.md`, `README.zh-CN.md`, and `AI_CONTEXT.md`
- `docs/run-with-codex.md` now leads with the proof lane before the deeper architecture lane
- `tools/Test-PublicSetup.ps1` now rejects `memory.md` references on public top surfaces

### Why This Pass Exists

- the `Sharper Demo Pack` lane was the highest-leverage next public packet after the boundary-hardening case
- this pass tightens time-to-first-result without adding a new architecture surface or a second public system-evolution case

### Non-Goals

- no change to the BYOS boundary
- no new public control-surface document family
- no maintainer-only release state inside the tracked public repo

## v0.1.1 - 2026-04-02

Second public release of `Learning OS`, focused on making the post-`v0.1.0` public direction visible instead of leaving it split across `main`, issues, and roadmap notes.

### Highlights

- minimal community-entry surfaces: `CONTRIBUTING.md`, `ROADMAP.md`, and issue templates
- explicit `prompt-only chat` versus `Learning OS` comparison in the top README surfaces
- visible command-proof matrix for the verified `pwsh` path and Windows convenience wrapper
- a first clearly non-finance public-safe example: `policy-brief-sample.md` plus `examples/thesis-reading-packet`

### Why This Release Exists

- `v0.1.0` proved the harness shape
- this release proves the next public-facing step after `v0.1.0`
- the repo now has clearer participation surfaces, clearer proof surfaces, and a stronger example mix

### Included Surfaces

- community entry: `CONTRIBUTING.md`, `ROADMAP.md`, `.github/ISSUE_TEMPLATE/`
- comparison and proof: `README.md`, `README.zh-CN.md`, `docs/public-setup.md`, `docs/demo-flow.md`
- non-finance thesis-reading example: `samples/open/policy-brief-sample.md`, `examples/thesis-reading-packet/`, `docs/examples/thesis-reading.md`

### Non-Goals

- no change to the BYOS boundary
- no maintainer-only state inside the tracked public repo
- no explosion of new onboarding lanes or example families in one batch

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
