# Repo Ops And Validation

Use this skill when the task belongs to the public repo's `system-ops` overlay rather than the `teaching` overlay.

This is a public-safe example skill. It shows how setup, validation, boundary-sensitive maintenance, and repo-safe public-surface edits should run without dragging private workspace state into the tracked repo.

## Goal

Handle one `system-ops` pass that is:

- explicit about why the task is not a study workflow packet
- explicit about the public/private boundary
- validation-first when executable checks exist
- bounded enough to stay auditable

## Use When

- clean-clone validation
- local-source import or BYOS setup
- public/private boundary check
- validator triage
- public-safe doc or tooling maintenance

## Operating Rules

1. Read the shared layer first.
2. Keep the task in the `system-ops` overlay.
   - Do not force it into `single-book`, `multi-book`, `thesis`, or `research` just because those modes already exist.
3. Prefer executable checks before advice when a validator exists.
   - `pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly`
   - `pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1 -RepoOnly`
   - `pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1`
   - Windows `.cmd` wrappers remain convenience entrypoints
4. Keep the public/private boundary explicit.
   - Do not claim a private source was inspected unless it was actually present locally.
   - Do not write maintainer-only state or local project packets into the tracked public repo.
5. If the task changes public docs, tooling, or machine contracts:
   - keep the change public-safe
   - keep JSON contracts aligned with the docs they describe
   - re-run the relevant validator before closing out

## Suggested Pass Shape

1. Classify the task as `system-ops`.
2. State the executable surface to check.
3. Run the relevant validator or setup step.
4. If a repo-safe change is needed, make the smallest clear public change.
5. Re-run the relevant check.
6. Return:
   - scope classification
   - checks run
   - boundary note
   - change summary
   - next action

## Public-Safe Guardrails

- Do not commit private books, papers, PDFs, or captured materials.
- Do not store local machine paths in tracked docs unless the path is an obvious placeholder.
- Do not create tracked `project.md`, `session-log.md`, `open-questions.md`, or `distinctions.md` outside the allowed template and example surfaces.
- Do not describe a repo-maintenance task as if it were a teaching packet.
