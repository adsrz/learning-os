# Submission Record

## Canonical Public Identity

- `repo_name`: Learning OS
- `repo_type`: AI-native, local-first learning harness
- `primary_public_audience`: operators and AI agents who need a reusable BYOS harness for serious reading workflows
- `primary_public_promise`: explicit source boundaries, workflow routing, validation gates, and durable write-back
- `non_goal`: public redistribution of third-party books, papers, PDFs, slides, or proprietary source bundles

## Key Public Claims

- the repo should read as an `AI harness`, not just as a study-notes repository
- the system is `local-first` and `BYOS`
- the workflow layer is source-agnostic rather than tied to one private canon
- `MIT` covers the repository code and original public content only
- AI should have first-class entrypoints through `AI_CONTEXT.md` and `ai-context.json`

## Durable Entry Points

- `human`: `README.md`, `README.zh-CN.md`
- `AI quick read`: `AI_CONTEXT.md`
- `AI machine contract`: `ai-context.json`, `task-router.json`, `writeback-map.json`, `agent/skills/index.json`
- `operator docs`: `docs/run-with-codex.md`, `docs/public-setup.md`, `docs/bring-your-own-sources.md`
- `worked examples`: `examples/research-intake-packet`, `examples/single-book-packet`, `examples/multi-book-packet`

## GitHub Metadata Intent

- `description`: `An AI-native, local-first learning harness for deep reading, synthesis, thesis-style reading, and research workflows.`
- `topics`: `ai-harness`, `ai-agent`, `agentic-workflow`, `codex`, `local-first`, `deep-reading`, `research-workflow`, `self-study`, `study-workflow`
- `language presentation`: bilingual `README.md` and `README.zh-CN.md`

## Cold-Path Update Discipline

When a durable public claim changes, update the relevant owner surfaces together:

- `README.md` and `README.zh-CN.md`
- `AI_CONTEXT.md` and `ai-context.json`
- `task-router.json` or `writeback-map.json` if routing or write-back claims changed
- `system_detail.md` if file responsibilities or boundaries changed
- this file if repo identity, metadata intent, or public promises changed

## Exclusions

Do not store here:

- private source filenames, hashes, or manifests
- personal runtime logs or local machine paths
- vanity metrics without operational consequence
- transient drafting notes that do not change the durable public contract
