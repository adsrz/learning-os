# Templates

This folder exposes the public-safe template families for durable local write-back.

Copy the template that matches your workflow mode into your own local project area outside the tracked public repo.

## Template Families

### `project-template`

- best fit for `single-book deep reading`
- also works as the minimal kernel for `research / paper workflow`
- keeps the durable core small:
  - `project.md`
  - `session-log.md`
  - `open-questions.md`
  - `distinctions.md`
- the public-safe sync now also keeps `current_frontier`, `frontier_state`, and `resume_support_note` explicit in `session-log.md`
- `open-questions.md` now distinguishes active `live` questions from lighter `watch` follow-ups

### `multi-book-project-template`

- best fit for `multi-book synthesis`
- keeps source leadership and forward route structure explicit without exporting private live-state machinery
- extends the durable core with:
  - `module-map.md`
  - `source-registry.json`
- the public-safe sync now keeps `current_frontier`, `frontier_state`, `lead_source`, and `supporting_sources` explicit in `session-log.md`
- `open-questions.md` now keeps `lead source` and `next best check` visible on live synthesis questions

### `thesis-project-template`

- best fit for `thesis / non-textbook reading`
- keeps thesis-first route geometry explicit without exporting the full private adjunct stack
- extends the durable core with:
  - `module-map.md`
  - `thesis-map.md`
- the public-safe sync now keeps `current_frontier`, `frontier_state`, and thesis-packet routing explicit in `session-log.md`
- `open-questions.md` now keeps `claim type` and `next best check` visible on live thesis questions

## Boundary Note

- These templates are public-safe abstractions, not a full private study workspace export.
- Keep the copied project folder in your own local project area, not inside the tracked public repo.
