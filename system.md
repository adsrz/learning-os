# Learning OS

## Identity

- `Learning OS` is an AI-native, local-first learning harness.
- It is designed to support durable agent-guided learning workflows rather than one-off note capture or generic chat.
- It is source-agnostic: the harness depends on source classes and workflow modes, not on one personal source bundle.
- Its operating core is `shared layer -> primary overlay -> study pass or repo-ops pass -> validation -> durable write-back or repo-safe maintenance`.

## Public Principles

- Keep the public repo reusable.
- Keep third-party source materials out of versioned history.
- Keep maintainer-only packaging state and submission prep out of the pushed public result.
- Make the repo understandable without private inputs.
- Let users plug in their own lawfully obtained materials.
- Show the harness layer clearly enough that the repo does not read as a plain notes system.

## Primary Overlays

- `teaching`
  - owns source-aware learning passes
  - routes into the supported workflow modes
- `system-ops`
  - owns setup, import, validation, boundary checks, and repo-safe harness maintenance
  - should stay small and explicit instead of hiding inside ad hoc study prompts

## Supported Modes

- `single-book deep reading`
- `multi-book synthesis`
- `thesis / non-textbook reading`
- `research / paper workflow`
