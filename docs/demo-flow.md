# Demo Flow

This is the simplest public-safe way to understand how `Learning OS` works from source intake to durable write-back.

## Goal

Show one realistic harness loop without depending on a private book library.

## 60-Second Proof

1. Run the clean-clone checks:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

2. Open the included source:
   - [samples/open/demo-source.md](../samples/open/demo-source.md)
3. Open the worked result:
   - [examples/research-intake-packet/project.md](../examples/research-intake-packet/project.md)
   - [examples/research-intake-packet/session-log.md](../examples/research-intake-packet/session-log.md)
   - [examples/research-intake-packet/open-questions.md](../examples/research-intake-packet/open-questions.md)
   - [examples/research-intake-packet/distinctions.md](../examples/research-intake-packet/distinctions.md)

If the repo makes sense after that comparison, the public harness is already doing its job.

## What The Result Looks Like

One open sample source can already produce a durable packet shape:

```text
demo packet/
  project.md
  session-log.md
  open-questions.md
  distinctions.md
```

The included worked packet records four kinds of durable result:

- a declared workflow owner and source boundary in `project.md`
- one concrete session transition in `session-log.md`
- reusable unanswered questions in `open-questions.md`
- stable distinctions worth carrying forward in `distinctions.md`

This is the key idea of the repo: the useful output is not only the answer in chat, but the packet state that survives after the pass.

## 5-Minute First Success

1. Start from the included open sample:
   - [samples/open/demo-source.md](../samples/open/demo-source.md)
   - [samples/open/demo-source-2.md](../samples/open/demo-source-2.md)
2. Validate the clean clone:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

3. Create a local project from the template:
   - copy [templates/project-template](../templates/project-template)
   - keep that copied folder in your own local project area, not in the tracked public repo
   - rename it for your actual packet or demo project
4. Decide the primary overlay first.
   - for source-aware learning work, use `teaching`
   - for setup, validation, or boundary checks, use `system-ops`
5. Decide the workflow owner inside `teaching`.
   - for a single open article, the likely owner is usually `research / paper workflow`
6. Run a bounded intake pass.
   - use [agent/skills/research-source-intake/SKILL.md](../agent/skills/research-source-intake/SKILL.md)
7. Route into a bounded study pass.
   - use [agent/skills/workflow-routed-study-pass/SKILL.md](../agent/skills/workflow-routed-study-pass/SKILL.md)
8. Write the durable result back into:
   - `project.md`
   - `session-log.md`
   - `open-questions.md`
   - `distinctions.md`
9. Compare your result with the worked public-safe example:
   - [examples/research-intake-packet](../examples/research-intake-packet)
   - [examples/single-book-packet](../examples/single-book-packet)
   - [examples/multi-book-packet](../examples/multi-book-packet)

## Example Outcome

A good demo pass should leave you with:

- a declared primary overlay
- a declared workflow mode
- an explicit source boundary
- one session log entry
- at least one open question
- at least one durable distinction
- a project packet that roughly resembles the worked example
- a clear sense of how `research-intake` and `single-book` packets differ

## Suggested First Prompt

If you want one bounded first pass with the included open sample, use a prompt like this:

```text
Treat samples/open/demo-source.md as the only in-scope source.
Route the task into teaching, choose the correct workflow mode, and produce the first durable packet state for a new local project folder.
Write back into project.md, session-log.md, open-questions.md, and distinctions.md.
Keep the pass bounded and do not claim any unseen local source inspection.
```

## Why This Matters

The point of the harness is not only to answer a question.

The point is to turn source work into durable, reusable project state.
