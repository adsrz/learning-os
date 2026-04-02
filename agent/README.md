# Agent Layer

This folder exposes the minimal public-safe `agent layer` of `Learning OS`.

The goal is not to mirror a private live study workspace. The goal is to show the execution surface that makes this repository an AI harness instead of a generic study repo.

## What Is Included

- a root-level [AGENTS.md](../AGENTS.md) that defines the public operating boundary
- example public-safe skills under [skills](skills)
- docs that explain how to run the harness with Codex

## What Is Not Included

This public repo does **not** include:

- private source libraries
- personal runtime state
- local machine paths
- personal logs or memory files
- the full private skill stack that may exist in a live workspace

## Minimal Execution Model

The public harness is intentionally small:

1. map your own local materials into ignored source roots
2. pick the workflow mode that fits the task
3. run a bounded study pass with explicit source boundaries
4. validate assumptions
5. write back durable outputs into your own local project structure or fork

## Start Here

- [skills/workflow-routed-study-pass/SKILL.md](skills/workflow-routed-study-pass/SKILL.md)
- [../docs/run-with-codex.md](../docs/run-with-codex.md)
- [../docs/agent-architecture.md](../docs/agent-architecture.md)
