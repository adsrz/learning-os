# AGENTS.md

## Role

- Be the main repository agent for this public `learning-os` workspace.
- Optimize for public clarity, reusable structure, and source-agnostic workflow design.
- Treat this repository as a public product repo, not as a private live study state surface.
- Keep [AI_CONTEXT.md](AI_CONTEXT.md) as a low-token, high-signal entrypoint for agents.
- Keep [ai-context.json](ai-context.json) aligned as the machine-readable companion entrypoint.

## Core Rule

- Do not introduce private source materials, personal runtime state, local machine paths, or user-specific logs into the tracked public repo.
- Treat this repository as the pushed public result surface. Maintainer-only packaging state, submission prep, and release working notes belong outside this tracked repo.

## Routing Rule

- Read the shared layer first:
  - [AI_CONTEXT.md](AI_CONTEXT.md)
  - [ai-context.json](ai-context.json)
  - [AGENTS.md](AGENTS.md)
  - [system.md](system.md)
- Then choose exactly one primary overlay for the live task:
  - `teaching`
    - source-aware study work
    - must route into one of the four workflow modes
  - `system-ops`
    - setup, local-source import, validation, public/private boundary checks, and repo-safe harness maintenance
- Do not force `system-ops` tasks into a study workflow mode just because the repository is about learning.

## Public Boundary

- `sources/`, `book/`, and `research_doc/` are local ignored roots.
- Third-party books, papers, PDFs, slides, and captured materials must not be committed.
- Keep examples reusable and public-safe.

## Main Duties

- Keep the repo focused on reusable learning workflows rather than one personal library.
- Keep the public routing model explicit as `shared layer + exactly one primary overlay`.
- Keep the minimal public-safe `agent/` layer understandable and usable as a harness skeleton.
- Keep project templates small, reusable, and clearly aimed at durable write-back.
- Preserve the four workflow modes under the `teaching` overlay:
  - `single-book deep reading`
  - `multi-book synthesis`
  - `thesis / non-textbook reading`
  - `research / paper workflow`
- Keep `system-ops` surfaces narrow, public-safe, and executable.
- Prefer clear public docs, templates, and validators over private-state mirroring.

## Validation

- Use `.\tools\Test-All.cmd -RepoOnly` for clean-clone validation.
- Use `.\tools\Test-All.cmd` when local BYOS source setup should also be checked.
- Keep tracked agent docs and example skills public-safe.

## Guardrails

- One rule should have one real home.
- README should stay attractive and clear, not turn into an internal ops dump.
- Do not expand the repo into a personal live-state archive.
- Do not store maintainer-only packaging logs, submission working state, or release-routing notes in the tracked public repo.
- Do not turn public templates into private-state mirrors.
