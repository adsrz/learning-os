# Research Source Intake

Use this skill when a new paper, report, captured article, or other long-form research source enters the local workspace and needs to be classified before study.

This is a public-safe example of a more concrete harness skill.

## Goal

Turn a raw source arrival into a controlled intake result:

- identify what the source is
- decide whether it belongs to `research / paper workflow` or another workflow mode
- make the source boundary explicit
- propose the first durable write-back

## When To Use It

Trigger this skill when:

- the user has imported a new paper or report
- a captured article needs routing
- the study agent should decide whether the source belongs in a research intake lane or another project
- the source exists locally but has not been turned into a structured packet yet

## Inputs

- the user request
- the source manifest entry, if present
- the local file or local metadata, if present
- any visible abstract, title page, or captured text

## Core Intake Questions

1. What is the source?
   - paper, report, article, note, or another type
2. What is the likely workflow owner?
   - `research / paper workflow`
   - `single-book deep reading`
   - `multi-book synthesis`
   - `thesis / non-textbook reading`
3. What evidence supports that routing?
4. What was actually inspected locally?
5. What is the next durable write-back target?

## Suggested Output Shape

Return these sections:

- `Source classification`
- `Workflow routing`
- `Evidence inspected`
- `Boundary note`
- `Suggested write-back`
- `Next study packet`

## Public-Safe Guardrails

- Do not invent file contents that were not inspected.
- If only metadata was visible, say so explicitly.
- Do not commit the underlying private source into tracked history.
- Keep the intake output reusable and repo-safe.
