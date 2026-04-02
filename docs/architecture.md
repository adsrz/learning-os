# Architecture

## Public Repo Shape

`Learning OS` is split into five layers:

1. `shared layer`
   - AI entrypoints
   - repo identity
   - public routing rules
   - machine-readable shared contract
2. `primary overlay layer`
   - `teaching`
   - `system-ops`
   - task classification before deeper execution
3. `operator and validation layer`
   - setup docs
   - validators
   - import helpers
   - public/private boundary enforcement
4. `reference workflow layer`
    - example write-ups for the four workflow modes
    - open demo material
    - project templates for durable write-back
    - worked example packets
    - multiple open samples for synthesis demos
5. `local BYOS layer`
   - user-owned books, papers, and research materials
   - intentionally ignored by Git

## Design Goal

The repo should still be understandable on a clean clone, but more powerful once the user adds their own source materials and runs the harness against them.

## Routing Principle

The public repo now exposes a simple routing model:

- read the shared layer first
- choose exactly one primary overlay
- only then choose a workflow mode or system-ops pass shape

That keeps setup and maintenance work from being misrouted as fake study packets.

## Harness Core

The project should read as an `AI harness`, not merely as a study repo:

- shared-layer routing is explicit
- overlay choice is explicit
- sources are explicit
- workflow routing is explicit
- validation is explicit
- durable write-back is explicit
- the public execution layer is explicit

## Non-Goal

This repository is not a public redistribution channel for copyrighted books or papers.
