# Demo Flow

This is the simplest public-safe way to understand how `Learning OS` works from source intake to durable write-back.

## Goal

Show one realistic harness loop without depending on a private book library.

## Fastest Path

If you only want one first success path, do this:

1. Run the clean-clone checks:

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

2. Open the included source:
   - [samples/open/demo-source.md](../samples/open/demo-source.md)
3. Copy the first prompt below:
   - [Suggested First Prompt](#suggested-first-prompt)
4. Compare your result with the worked packet:
   - [examples/research-intake-packet/project.md](../examples/research-intake-packet/project.md)
   - [examples/research-intake-packet/session-log.md](../examples/research-intake-packet/session-log.md)
   - [examples/research-intake-packet/open-questions.md](../examples/research-intake-packet/open-questions.md)
   - [examples/research-intake-packet/distinctions.md](../examples/research-intake-packet/distinctions.md)

If that path makes sense, the public harness is already doing its job.

## Suggested First Prompt

If you want one bounded first pass with the included open sample, use a prompt like this:

```text
Treat samples/open/demo-source.md as the only in-scope source.
Route the task into teaching, choose the correct workflow mode, and produce the first durable packet state for a new local project folder.
Write back into project.md, session-log.md, open-questions.md, and distinctions.md.
Keep the pass bounded and do not claim any unseen local source inspection.
```

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

That is also the practical delta from prompt-only chat: the harness preserves routing, continuity, open questions, and distinctions instead of leaving only one answer in chat history.

## After The First Pass

1. Create a local project from the template:
   - copy [templates/project-template](../templates/project-template)
   - keep that copied folder in your own local project area, not in the tracked public repo
   - rename it for your actual packet or demo project
2. Run the first bounded pass again, now against your own material.
   - let the agent route the task into `teaching`
   - let it choose the correct workflow mode for your source
3. Run a bounded intake pass when the material needs classification first.
   - use [agent/skills/research-source-intake/SKILL.md](../agent/skills/research-source-intake/SKILL.md)
4. Route into a bounded study pass.
   - use [agent/skills/workflow-routed-study-pass/SKILL.md](../agent/skills/workflow-routed-study-pass/SKILL.md)
5. Write the durable result back into:
   - `project.md`
   - `session-log.md`
   - `open-questions.md`
   - `distinctions.md`
6. Compare your result with the worked public-safe example:
   - [examples/research-intake-packet](../examples/research-intake-packet)
   - [examples/single-book-packet](../examples/single-book-packet)
   - [examples/multi-book-packet](../examples/multi-book-packet)
   - [examples/thesis-reading-packet](../examples/thesis-reading-packet)

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

If you want a clearly non-finance comparison, inspect [samples/open/policy-brief-sample.md](../samples/open/policy-brief-sample.md) next to [examples/thesis-reading-packet](../examples/thesis-reading-packet).

## Why This Matters

The point of the harness is not only to answer a question.

The point is to turn source work into durable, reusable project state.
