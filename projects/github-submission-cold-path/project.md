# Project

## Identity

- `project_name`: GitHub Submission Cold Path
- `workflow_mode`: cold-path ops / public submission
- `primary_goal`: keep the public repo legible, AI-friendly, and release-safe without polluting the hot study lane
- `current_frontier`: preserve the key public claims, packaging decisions, and durable GitHub-facing state in one stable owner

## Source Scope

- `in_scope_sources`: `README.md`, `README.zh-CN.md`, `AI_CONTEXT.md`, `ai-context.json`, `task-router.json`, `writeback-map.json`, `system.md`, `system_detail.md`, `docs/run-with-codex.md`, `docs/architecture.md`, `agent/skills/index.json`, public-safe examples
- `out_of_scope_sources`: the private `study` workspace, local source libraries, copyrighted source bundles, personal runtime logs, GitHub metrics that are not yet durable product decisions
- `source_boundary_notes`: this cold path owns only the public repo and its release-safe positioning; it must not imply inspection of unread private materials or external analytics

## Operating Notes

- `durable_outputs_to_keep`: public positioning, metadata intent, AI entrypoints, release-safe promises, unresolved packaging questions
- `validation_requirements`: `.\tools\Test-All.cmd -RepoOnly` should pass; the public/private boundary should stay explicit; public-facing claims should stay synchronized across README, AI context, and machine contracts
- `write_back_targets`: `session-log.md`, `open-questions.md`, `distinctions.md`, `submission-record.md`
