<div align="right">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">简体中文</a>
</div>

# Learning OS

`Type: AI Harness` `Mode: Local-First` `Sources: BYOS` `License: MIT`

一个面向深度阅读、综合学习、论述型阅读与研究工作流的 `AI-native`、`local-first` 学习 harness。

`Learning OS` 不只是一个学习仓库。它本质上是一层 harness：给 AI agent 明确的 source 边界、工作流路由、验证 gate 与 durable write-back，让长期学习不会退化成一次性的泛化聊天。

如果是 AI agent 需要用最短路径快速读懂仓库，先看 [AI_CONTEXT.md](AI_CONTEXT.md)。如果更适合 machine-readable 入口，就直接读 [ai-context.json](ai-context.json)。

如果任务是 GitHub 提交、public 包装或 release-safe 身份维护，走冷路径项目 [projects/github-submission-cold-path](projects/github-submission-cold-path)。

## 快速概览

```text
Input      -> 本地 sources 或开放 sample
Routing    -> task-router.json
Execution  -> agent/skills 下的 public-safe skills
Write-back -> project.md / session-log.md / open-questions.md / distinctions.md
Validation -> .\tools\Test-All.cmd -RepoOnly
```

## 最小命令路径

```powershell
.\tools\Test-All.cmd -RepoOnly
.\tools\Import-LocalSources.cmd -SourceRoot C:\path\to\your\files
.\tools\Test-PublicSetup.cmd
```

## 为什么它是一个 AI Harness

很多 AI 学习方案，本质上只是“一个 prompt + 一堆笔记”。

`Learning OS` 补的是缺失的 harness 层：

- `Source intake`
  系统要求显式的 source manifest 和本地 source roots，而不是把上下文含糊地塞进聊天窗口。
- `Workflow routing`
  单书精读、多书综合、论述型阅读、研究 intake 会走不同的工作流。
- `Validation gates`
  仓库安全检查和 public/private 边界本身就是系统的一部分，而不是事后补丁。
- `Durable write-back`
  真正的产出不只是一次回答，而是更新后的项目状态、distinctions、open questions 和可复用笔记。
- `Local-first operation`
  这套系统默认运行在你自己的本地文件和你自己合法获得的 sources 上。

## 它支持什么

当前 harness 提供 4 种可复用 workflow mode：

- `Single-book deep reading`
  单一主 source，慢速、机制优先、持续写回。
- `Multi-book synthesis`
  多个 source 进入同一学习项目，但不会被粗暴压扁成一本书。
- `Thesis / non-textbook reading`
  适用于论述性强或理论先行的阅读对象，不按标准教材方式处理。
- `Research / paper workflow`
  适用于论文、报告、抓取文章等需要先 intake 和分类的材料。

这些模式是参考工作流，不是固定书单。harness 本身是 `source-agnostic` 的。

## Harness Loop

```text
自带自己的 sources -> 分类并映射本地材料 -> 按 workflow mode 路由 -> 运行 agentic study pass -> 验证 -> 写回 durable state
```

## Agent Layer 怎么工作

现在公开仓库不只是文档，还带了一个最小 `agent` 层。

- [AI_CONTEXT.md](AI_CONTEXT.md)
  给 AI 快速理解仓库用的最短入口。
- [ai-context.json](ai-context.json)
  给 agent onboarding 用的 machine-readable 仓库上下文。
- [task-router.json](task-router.json)
  从 task type 到 workflow mode 和 skill 的 machine-readable 路由表。
- [writeback-map.json](writeback-map.json)
  按 workflow mode 固定写回目标的 machine-readable contract。
- [agent/README.md](agent/README.md)
  解释公开安全的执行面。
- [agent/skills/workflow-routed-study-pass/SKILL.md](agent/skills/workflow-routed-study-pass/SKILL.md)
  一个最小 skill，展示如何跑一次 bounded、source-aware 的 study pass。
- [agent/skills/research-source-intake/SKILL.md](agent/skills/research-source-intake/SKILL.md)
  一个更具体的 intake skill，用来处理论文、报告和抓取文章。
- [docs/run-with-codex.md](docs/run-with-codex.md)
  说明如何把这个仓库真正当成 Codex harness 来运行。

## 从这里开始

先运行公开仓库检查：

```powershell
.\tools\Test-All.cmd -RepoOnly
```

然后阅读核心说明：

- [docs/run-with-codex.md](docs/run-with-codex.md)
- [docs/demo-flow.md](docs/demo-flow.md)
- [docs/ai-harness.md](docs/ai-harness.md)
- [docs/agent-architecture.md](docs/agent-architecture.md)
- [docs/public-setup.md](docs/public-setup.md)
- [docs/bring-your-own-sources.md](docs/bring-your-own-sources.md)
- [docs/workflow-modes.md](docs/workflow-modes.md)

你也可以先看开放示例：

- [samples/open/demo-source.md](samples/open/demo-source.md)
- [samples/open/demo-source-2.md](samples/open/demo-source-2.md)
- [examples/research-intake-packet](examples/research-intake-packet)
- [examples/single-book-packet](examples/single-book-packet)
- [examples/multi-book-packet](examples/multi-book-packet)

当你要接入自己的资料时：

```powershell
.\tools\Import-LocalSources.cmd -SourceRoot C:\path\to\your\files
.\tools\Test-PublicSetup.cmd
```

## 仓库结构

- [system.md](system.md)
  项目的公开身份与运行原则。
- [system_detail.md](system_detail.md)
  public/private 边界规则与文件职责。
- [agent/README.md](agent/README.md)
  harness 的最小公开 agent layer。
- [templates/project-template](templates/project-template)
  用于 durable write-back 的最小项目骨架。
- [projects/github-submission-cold-path](projects/github-submission-cold-path)
  一个冷路径 project，用来记录 public 提交状态、repo 身份和包装决策，而不污染学习热路径。
- [examples/research-intake-packet](examples/research-intake-packet)
  一轮 bounded harness pass 之后的公开示例 packet。
- [examples/single-book-packet](examples/single-book-packet)
  一个 `single-book deep reading` 的 source-owned 示例 packet。
- [examples/multi-book-packet](examples/multi-book-packet)
  一个保留 source overlap 与 tension 的 `multi-book synthesis` 示例 packet。
- [docs/ai-harness.md](docs/ai-harness.md)
  解释这个项目为什么是 harness，而不是普通学习仓库。
- [docs/agent-architecture.md](docs/agent-architecture.md)
  harness loop 与公开版 agent architecture。
- [docs/run-with-codex.md](docs/run-with-codex.md)
  说明如何把这个仓库作为 Codex harness 来运行。
- [docs/demo-flow.md](docs/demo-flow.md)
  一条从 source intake 到 write-back 的真实公开流程。
- [docs/architecture.md](docs/architecture.md)
  仓库如何拆分成 harness、examples 与 local-source layers。
- [docs/workflow-modes.md](docs/workflow-modes.md)
  四种支持的学习模式。
- [docs/examples](docs/examples)
  可直接改造的模式示例说明。
- [docs/source-manifest.template.json](docs/source-manifest.template.json)
  用于把你自己的 source 映射到本地布局中的模板。
- [tools](tools)
  校验与本地 source 导入工具。

## Public Boundary

这个公开仓库 **不包含** 第三方书籍、论文、PDF、幻灯片或其他专有学习材料。

你需要自带你自己合法获得的 source。

这样设计是有意的：

- 它让仓库更安全地公开发布
- 它让 harness 不被某一套私有资料绑死
- 它让同一套运行模型能够用于金融、经济、哲学、政策、机器学习等重阅读领域

## 许可证

本仓库采用 [MIT License](LICENSE)。

第三方书籍、论文、PDF、幻灯片和其他 source materials 不包含在仓库中，也不受本仓库许可覆盖。
