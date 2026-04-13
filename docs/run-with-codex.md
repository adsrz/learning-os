# Run With Codex

If you downloaded `source.zip`, unzip it and open the folder as a project in Codex. That is enough to start using the repo.

## Shortest First Run

If you want the quickest proof path first:

1. Open the repo in Codex.
2. Read [demo-flow.md](demo-flow.md).
3. Compare [samples/open/demo-source.md](../samples/open/demo-source.md) with [examples/research-intake-packet](../examples/research-intake-packet).
4. If you want to verify the public surface, run:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

That path proves the public harness before you need the deeper architecture docs.

## What Codex Should Read

When you open this repository in Codex, the most important public surfaces are:

- [README.md](../README.md)
- [AI_CONTEXT.md](../AI_CONTEXT.md)
- [ai-context.json](../ai-context.json)
- [task-router.json](../task-router.json)
- [writeback-map.json](../writeback-map.json)
- [agent/skills/index.json](../agent/skills/index.json)
- [AGENTS.md](../AGENTS.md)
- [system.md](../system.md)
- [system_detail.md](../system_detail.md)
- [agent/README.md](../agent/README.md)
- [agent/skills/repo-ops-and-validation/SKILL.md](../agent/skills/repo-ops-and-validation/SKILL.md)
- [agent/skills/workflow-routed-study-pass/SKILL.md](../agent/skills/workflow-routed-study-pass/SKILL.md)
- [agent/skills/research-source-intake/SKILL.md](../agent/skills/research-source-intake/SKILL.md)
- [templates/project-template/README.md](../templates/project-template/README.md)
- [docs/architecture.md](architecture.md)
- [docs/agent-architecture.md](agent-architecture.md)

Those files tell Codex:

- what this repo is
- what it is not
- which boundaries must survive every task
- how tasks route
- where durable write-back should land

## Suggested Setup For Your Own Materials

1. Open the repo in Codex.
2. Run the repo-safe checks:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

3. Add your own lawfully obtained materials through the local ignored roots.
4. Import them:

```powershell
$SOURCE_ROOT = "/absolute/path/to/your/files" # or C:\path\to\your\files on Windows
pwsh -NoProfile -File ./tools/Import-LocalSources.ps1 -SourceRoot $SOURCE_ROOT
```

5. Validate the local setup:

```powershell
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1
```

6. Copy the project template into your own local project area so the agent has a clear write-back target.
7. Compare your first packet against the worked public-safe examples under [examples](../examples).

Windows `.cmd` wrappers still exist, but the primary documented path is `pwsh` for a more portable public surface.

## Suggested Prompt Pattern

Use prompts that tell Codex to operate as a harnessed agent, not as a generic assistant.

Examples:

- `Route this as system-ops, run the repo-ops-and-validation skill, and tell me whether the public/private boundary is still clean.`
- `Treat this as repo maintenance rather than a study pass, run the relevant validator first, then propose the smallest public-safe fix.`
- `Use the workflow-routed study pass skill and help me set up a single-book deep reading packet for this source.`
- `Route this task as multi-book synthesis and tell me which sources are actually in scope before answering.`
- `Run a bounded research-workflow pass on the imported paper and propose durable write-back.`

## Expected Behavior

Codex should:

- identify the primary overlay first
- only choose a workflow mode when the task is actually `teaching`
- make source boundaries explicit
- keep the pass bounded and auditable
- produce outputs that can survive beyond chat

## Non-Goal

This public repo is not a full private study workspace export.

It is a public-safe harness skeleton that users can open, understand, and extend with their own local materials and project folders.
