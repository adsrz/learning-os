# AI Harness

`Learning OS` is a study system, but its core identity is more specific than that: it is an `AI-native learning harness`.

## What That Means

The important unit is not a single answer from a model. The important unit is a controlled loop:

1. sources enter through explicit local roots and manifests
2. the work is routed by workflow mode
3. the agent operates inside those boundaries
4. validation gates check repo-safe and setup-safe assumptions
5. the useful result is written back into durable project state

Without that loop, this would mostly collapse into a generic chat-assisted note-taking setup.

## Why It Is Not Just A Study Repo

A normal study repo usually gives you:

- files
- notes
- maybe some scripts

This harness adds:

- `source awareness`
  The agent should know what kind of source it is working with and where it came from.
- `mode-specific routing`
  Single-book reading, synthesis, thesis-style reading, and research intake do not share one flat prompt.
- `validation`
  Clean-clone checks and public/private boundaries are part of the system contract.
- `durable continuity`
  The system is built to preserve state across long study arcs instead of treating each turn as disposable.

## Public Repo Constraint

This public repo intentionally keeps third-party source materials out of tracked history.

That is not a missing feature. It is part of the harness design:

- the public repo stays reusable
- the legal boundary stays clearer
- the same harness can run across many domains with user-supplied sources

## Reading Order

If you want to understand the project as a harness, start here:

- [agent-architecture.md](agent-architecture.md)
- [architecture.md](architecture.md)
- [workflow-modes.md](workflow-modes.md)
- [public-setup.md](public-setup.md)
