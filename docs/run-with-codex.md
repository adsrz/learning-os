# Run With Codex

This repo is designed to work as a local-first `AI harness`, not just as a static documentation set.

## What Codex Should See

When you open this repository in Codex, the important public surfaces are:

- [AI_CONTEXT.md](../AI_CONTEXT.md)
- [AGENTS.md](../AGENTS.md)
- [system.md](../system.md)
- [system_detail.md](../system_detail.md)
- [agent/README.md](../agent/README.md)
- [agent/skills/workflow-routed-study-pass/SKILL.md](../agent/skills/workflow-routed-study-pass/SKILL.md)
- [agent/skills/research-source-intake/SKILL.md](../agent/skills/research-source-intake/SKILL.md)
- [templates/project-template/README.md](../templates/project-template/README.md)
- [docs/agent-architecture.md](agent-architecture.md)

Those files tell Codex:

- this is an AI harness
- the repo is local-first
- private source materials must stay out of tracked history
- workflow routing matters
- durable write-back matters

`AI_CONTEXT.md` is the preferred first read when you want the lowest-context-cost entrypoint.

## Suggested Setup

1. Clone the repo.
2. Run:

```powershell
.\tools\Test-All.cmd -RepoOnly
```

3. Add your own lawfully obtained materials through the local ignored roots.
4. Import them:

```powershell
.\tools\Import-LocalSources.cmd -SourceRoot C:\path\to\your\files
```

5. Validate the local setup:

```powershell
.\tools\Test-PublicSetup.cmd
```

6. Copy the project template into your own local `projects/` area so the agent has a clear write-back target.
7. Compare your first packet against the worked public-safe example:
   - [examples/research-intake-packet](../examples/research-intake-packet)
   - [examples/single-book-packet](../examples/single-book-packet)
   - [examples/multi-book-packet](../examples/multi-book-packet)

## Suggested Prompt Pattern

Use prompts that tell Codex to operate as a harnessed agent, not as a generic assistant.

Examples:

- `Use the workflow-routed study pass skill and help me set up a single-book deep reading packet for this source.`
- `Route this task as multi-book synthesis and tell me which sources are actually in scope before answering.`
- `Run a bounded research-workflow pass on the imported paper and propose durable write-back.`
- `Use the research-source-intake skill to classify this imported report, then tell me which template files should receive the first write-back.`

## Expected Behavior

Codex should:

- identify the workflow mode first
- make source boundaries explicit
- avoid pretending unread local material was inspected
- keep the pass bounded and auditable
- produce outputs that can survive beyond chat

## Non-Goal

This public repo is not a full private study workspace export.

It is a public-safe harness skeleton that users can clone, understand, and extend with their own local materials and project folders.
