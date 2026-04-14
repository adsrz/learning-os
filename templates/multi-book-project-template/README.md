# Multi-Book Project Template

This folder is a minimal public-safe template for `multi-book synthesis`.

Copy it when several sources should stay visible inside one bounded local project instead of being flattened into one source-owned packet.

This template is for durable study write-back. It is not the target surface for `system-ops` tasks such as setup, validation, or public boundary checks.

## Included Files

- `project.md`
  Stable project identity, workflow owner, and explicit core-source registry.
- `session-log.md`
  Running record of meaningful synthesis passes.
- `open-questions.md`
  Active unresolved synthesis and source-routing questions.
- `distinctions.md`
  Durable overlap, tension, and routing distinctions worth reusing.
- `module-map.md`
  Forward route map for the bounded synthesis program.
- `source-registry.json`
  Tool-facing local source registry for the project's core sources.

## Suggested Usage

1. Copy this folder into your own local project area outside the tracked public repo.
2. Rename the folder for the actual project.
3. Fill in `project.md`, `source-registry.json`, and `module-map.md` first.
4. Run bounded synthesis passes against your own sources.
5. Keep source overlap and source-specific tension visible in the local project files instead of leaving them only in chat.
