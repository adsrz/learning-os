# Architecture

## Public Repo Shape

`Learning OS` is split into four layers:

1. `AI harness layer`
   - system identity
   - harness doctrine
   - source routing
   - agent architecture
   - minimal public-safe agent skills
2. `operator and validation layer`
   - setup docs
   - validators
   - import helpers
   - public/private boundary enforcement
3. `reference workflow layer`
   - example write-ups for the four workflow modes
   - open demo material
4. `local BYOS layer`
   - user-owned books, papers, and research materials
   - intentionally ignored by Git

## Design Goal

The repo should still be understandable on a clean clone, but more powerful once the user adds their own source materials and runs the harness against them.

## Harness Core

The project should read as an `AI harness`, not merely as a study repo:

- sources are explicit
- workflow routing is explicit
- validation is explicit
- durable write-back is explicit
- the public execution layer is explicit

## Non-Goal

This repository is not a public redistribution channel for copyrighted books or papers.
