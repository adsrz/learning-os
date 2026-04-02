# Agent Layer

This folder exposes the minimal public-safe `agent layer` of `Learning OS`.

The goal is not to mirror a private live study workspace. The goal is to show the execution surface that makes this repository an AI harness instead of a generic study repo.

## What Is Included

- a root-level [AGENTS.md](../AGENTS.md) that defines the public operating boundary
- a public-safe `system-ops` skill for setup, validation, and boundary checks
- example public-safe skills under [skills](skills)
- docs that explain how to run the harness with Codex
- a project template that gives the agent a durable write-back target

## What Is Not Included

This public repo does **not** include:

- private source libraries
- personal runtime state
- local machine paths
- personal logs or memory files
- the full private skill stack that may exist in a live workspace

## Minimal Execution Model

The public harness is intentionally small:

1. read the shared layer
2. choose the primary overlay that fits the task
3. if it is `teaching`, pick the workflow mode and run a bounded study pass
4. if it is `system-ops`, run a bounded setup, validation, or boundary pass
5. validate assumptions
6. write back durable outputs into your own local project structure outside the tracked public repo when the task is `teaching`

## Start Here

- [skills/repo-ops-and-validation/SKILL.md](skills/repo-ops-and-validation/SKILL.md)
- [skills/workflow-routed-study-pass/SKILL.md](skills/workflow-routed-study-pass/SKILL.md)
- [skills/research-source-intake/SKILL.md](skills/research-source-intake/SKILL.md)
- [../docs/run-with-codex.md](../docs/run-with-codex.md)
- [../docs/demo-flow.md](../docs/demo-flow.md)
- [../docs/agent-architecture.md](../docs/agent-architecture.md)
