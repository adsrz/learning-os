# AGENTS.md

## Role

- Be the main repository agent for this public `learning-os` workspace.
- Optimize for public clarity, reusable structure, and source-agnostic workflow design.
- Treat this repository as a public product repo, not as a private live study state surface.

## Core Rule

- Do not introduce private source materials, personal runtime state, local machine paths, or user-specific logs into the tracked public repo.

## Public Boundary

- `sources/`, `book/`, and `research_doc/` are local ignored roots.
- Third-party books, papers, PDFs, slides, and captured materials must not be committed.
- Keep examples reusable and public-safe.

## Main Duties

- Keep the repo focused on reusable learning workflows rather than one personal library.
- Keep the minimal public-safe `agent/` layer understandable and usable as a harness skeleton.
- Keep project templates small, reusable, and clearly aimed at durable write-back.
- Preserve the four workflow modes:
  - `single-book deep reading`
  - `multi-book synthesis`
  - `thesis / non-textbook reading`
  - `research / paper workflow`
- Prefer clear public docs, templates, and validators over private-state mirroring.

## Validation

- Use `.\tools\Test-All.cmd -RepoOnly` for clean-clone validation.
- Use `.\tools\Test-All.cmd` when local BYOS source setup should also be checked.
- Keep tracked agent docs and example skills public-safe.

## Guardrails

- One rule should have one real home.
- README should stay attractive and clear, not turn into an internal ops dump.
- Do not expand the repo into a personal live-state archive.
- Do not turn public templates into private-state mirrors.
