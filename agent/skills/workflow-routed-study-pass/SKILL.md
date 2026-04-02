# Workflow-Routed Study Pass

Use this skill when you want Codex to run a bounded, source-aware study pass inside `Learning OS`.

This is a public-safe example skill. It shows the harness contract without depending on any private source bundle or personal runtime state.

## Goal

Run one study pass that is:

- explicit about what sources are in scope
- explicit about which workflow mode owns the task
- bounded enough to stay auditable
- structured enough to produce durable outputs beyond chat

## Inputs

- the user task
- the local source manifest, if present
- the local source roots, if present
- the workflow mode implied by the task:
  - `single-book deep reading`
  - `multi-book synthesis`
  - `thesis / non-textbook reading`
  - `research / paper workflow`

## Operating Rules

1. Identify the workflow mode first.
   - Do not flatten every task into one generic reading prompt.
2. Keep source boundaries explicit.
   - If a source was not inspected locally, say so.
   - If a claim is inferred from metadata or user description, label it as an inference.
3. Prefer local-first operation.
   - Use mapped local materials before broadening outward.
4. Keep the pass bounded.
   - Do not pretend one turn replaced cumulative project state.
5. Produce durable outputs.
   - Summaries, distinctions, open questions, and routing decisions should have a clear write-back destination.

## Suggested Pass Shape

1. Read the task.
2. Determine the workflow mode.
3. Determine which local sources are actually in scope.
4. State the working boundary:
   - what was read
   - what was not read
   - what the current pass is trying to accomplish
5. Execute the study pass.
6. Return:
   - explanation or synthesis
   - source boundary note
   - suggested durable write-back

## Public-Safe Guardrails

- Do not commit private books, papers, PDFs, or captured materials.
- Do not write personal runtime state into tracked files.
- Do not leak local machine paths unless the user explicitly wants a local path reference.
- Keep example outputs reusable for other users when writing tracked public docs.
