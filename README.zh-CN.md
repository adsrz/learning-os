<div align="right">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">简体中文</a>
</div>

# Learning OS

`Type: AI Harness` `Mode: Local-First` `Sources: BYOS` `License: MIT`

一个面向深度阅读、综合学习、论述型阅读与研究工作流的 `AI-native`、`local-first` 学习 harness。

`Learning OS` 不只是一个学习仓库。它本质上是一层 harness：给 AI agent 明确的 source 边界、工作流路由、验证 gate 与 durable write-back，让长期学习不会退化成一次性的泛化聊天。

这个 public repo 想给出的承诺很简单：把你本地拥有的 source 变成可持续写回的学习状态，而不是每轮聊天都从零开始。

如果你更想直接下载一个可发布快照，而不是先 `git clone`，可以看 [Releases](https://github.com/adsrz/learning-os/releases)。
这次 public cut 的重点是：先给你一个看得见的 durable output、一条验证过的 `pwsh` 路径，以及一条严格的 public/private 边界。

如果是 AI agent 需要用最短路径快速读懂仓库，先看 [AI_CONTEXT.md](AI_CONTEXT.md)。如果更适合 machine-readable 入口，就直接读 [ai-context.json](ai-context.json)。

## 从这里开始

如果你想在大约 5 分钟内判断这个 repo 是否真的有用，先做这三步：

1. 先跑 clean-clone 检查：

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
```

在 Windows 上，也可以继续用便捷 wrapper：

```powershell
.\tools\Test-All.cmd -RepoOnly
```

2. 打开最短演示路径：

- [docs/demo-flow.md](docs/demo-flow.md)
- [首条可直接复制的 prompt](docs/demo-flow.md#suggested-first-prompt)

3. 把一个开放 sample 和一个 worked packet 对照着看：

- [samples/open/demo-source.md](samples/open/demo-source.md)
- [examples/research-intake-packet/project.md](examples/research-intake-packet/project.md)
- [examples/research-intake-packet/session-log.md](examples/research-intake-packet/session-log.md)
- [examples/research-intake-packet/open-questions.md](examples/research-intake-packet/open-questions.md)
- [examples/research-intake-packet/distinctions.md](examples/research-intake-packet/distinctions.md)

预期结果大致是这样：

```text
project.md        -> workflow_mode: research / paper workflow
session-log.md    -> what_changed: source 完成初步分类并形成第一轮 durable packet state
open-questions.md -> research-intake packet 至少要捕捉什么证据?
distinctions.md   -> source arrival 不等于 study packet readiness
```

这就是仓库最核心的 proof surface：一个开放 sample 进入系统，出来的是带有 workflow owner、session state、open questions 与 distinctions 的可复用 packet。

如果只用一眼说明它和 prompt-only chat 的差别，可以看这张表：

| 维度 | Prompt-only chat | Learning OS |
| --- | --- | --- |
| 输出 | 留下一次性的聊天回答 | 留下 `project.md`、`session-log.md`、`open-questions.md`、`distinctions.md` |
| 连续性 | 下次需要手动重建上下文 | packet state 会继续保留下来 |
| 路由 | 一次泛化对话 | 明确先选 overlay，再选 workflow |
| 验证 | 几乎没有显式 proof | 有 repo-only checks 和边界敏感验证 |

如果你想看一条更明确的非金融路径，可以直接对照 [samples/open/policy-brief-sample.md](samples/open/policy-brief-sample.md) 和 [examples/thesis-reading-packet](examples/thesis-reading-packet)。

## 下一步

- `接入你自己的资料`
  先看 [docs/public-setup.md](docs/public-setup.md) 和 [docs/bring-your-own-sources.md](docs/bring-your-own-sources.md)，然后按下面的 `pwsh` 路径继续。
- `给 AI agent 的最短入口`
  先读 [AI_CONTEXT.md](AI_CONTEXT.md)，再读 [ai-context.json](ai-context.json)、[task-router.json](task-router.json) 和 [writeback-map.json](writeback-map.json)。
- `再看架构与参与方式`
  先读 [docs/run-with-codex.md](docs/run-with-codex.md)、[docs/ai-harness.md](docs/ai-harness.md) 和 [docs/agent-architecture.md](docs/agent-architecture.md)，再看 [ROADMAP.md](ROADMAP.md)、[CONTRIBUTING.md](CONTRIBUTING.md) 和 [Issues](https://github.com/adsrz/learning-os/issues)。

## 快速模型

```text
Shared layer -> AI_CONTEXT.md / ai-context.json / AGENTS.md
Overlay      -> teaching 或 system-ops
Routing      -> task-router.json
Execution    -> agent/skills 下的 public-safe skills
Validation   -> pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
Write-back   -> teaching 工作写回你的本地 packet 文件
```

## 可移植命令路径

```powershell
pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly
$SOURCE_ROOT = "/absolute/path/to/your/files" # Windows 上也可以改成 C:\path\to\your\files
pwsh -NoProfile -File ./tools/Import-LocalSources.ps1 -SourceRoot $SOURCE_ROOT
pwsh -NoProfile -File ./tools/Test-PublicSetup.ps1
```

仓库仍然提供 Windows `.cmd` wrapper，但对外文档把 `pwsh` 作为主路径，这样不会把项目读成一个只能在 Windows 上跑的仓库。

可移植命令的 proof 可以直接这样看：

| 路径 | 角色 | 当前 proof |
| --- | --- | --- |
| `pwsh -NoProfile -File ./tools/Test-All.ps1 -RepoOnly` | 公开默认的 repo-only 路径 | 已在本地 Windows shell、本地 `pwsh`，以及 GitHub Actions 的 Ubuntu / Windows 路径中跑过，workflow 见 [repo-only-validation.yml](.github/workflows/repo-only-validation.yml) |
| `.\tools\Test-All.cmd -RepoOnly` | Windows 便捷 wrapper | 作为 Windows convenience path 保留，但不是公开主路径 |
| `pwsh -NoProfile -File ./tools/Test-All.ps1` | 本地 BYOS 完整验证 | 属于导入你自己的 source 之后的本地路径 |

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

## 路由模型

这套 harness 暴露两个主 overlay：

- `Teaching overlay`
  负责 source-aware 的学习工作。进入这个 overlay 后，再路由到四种 workflow mode 之一。
- `System-ops overlay`
  负责 setup、本地 source 导入、validation、public/private 边界检查，以及公开仓库内的 repo-safe 维护。

这个拆分很重要：不是所有任务都应该被压成一次 study pass。

## Teaching Workflow Modes

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
  从 task type 到 primary overlay、workflow mode 和 skill 的 machine-readable 路由表。
- [writeback-map.json](writeback-map.json)
  为 `teaching` workflow modes 固定写回目标的 machine-readable contract。
- [agent/README.md](agent/README.md)
  解释公开安全的执行面。
- [agent/skills/repo-ops-and-validation/SKILL.md](agent/skills/repo-ops-and-validation/SKILL.md)
  一个最小 `system-ops` skill，用来处理 setup、validation、边界检查和 repo-safe 维护。
- [agent/skills/workflow-routed-study-pass/SKILL.md](agent/skills/workflow-routed-study-pass/SKILL.md)
  一个最小 skill，展示如何跑一次 bounded、source-aware 的 study pass。
- [agent/skills/research-source-intake/SKILL.md](agent/skills/research-source-intake/SKILL.md)
  一个更具体的 intake skill，用来处理论文、报告和抓取文章。
- [docs/run-with-codex.md](docs/run-with-codex.md)
  说明如何把这个仓库真正当成 Codex harness 来运行。

## Roadmap 与参与入口

如果你已经读懂这个 repo，想继续参与扩展，先看这几个公开入口：

- [ROADMAP.md](ROADMAP.md)
  看当前最值得补的 public-facing 缺口。
- [CONTRIBUTING.md](CONTRIBUTING.md)
  看什么类型的改动适合这个 public harness。
- [Issues](https://github.com/adsrz/learning-os/issues)
  报 bug、提 workflow idea，或者建议新的 public-safe case study。

当前最有价值的公开贡献大致是：

- 在 policy brief example 之外再补更多 public-safe case study
- 围绕已验证 `pwsh` 路径的跨平台打磨
- 更直接地对比 prompt-only study workflow
- 进一步压缩首次上手所需时间的 onboarding 改进

## 仓库结构

- [system.md](system.md)
  项目的公开身份与运行原则。
- [CHANGELOG.md](CHANGELOG.md)
  对外发布历史。
- [ROADMAP.md](ROADMAP.md)
  近期 public-facing 优先项。
- [CONTRIBUTING.md](CONTRIBUTING.md)
  贡献规则与验证要求。
- [system_detail.md](system_detail.md)
  public/private 边界规则与文件职责。
- [agent/README.md](agent/README.md)
  harness 的最小公开 agent layer。
- [agent/skills/repo-ops-and-validation/SKILL.md](agent/skills/repo-ops-and-validation/SKILL.md)
  面向 setup 和边界敏感仓库工作的公开 `system-ops` skill。
- [templates/project-template](templates/project-template)
  用于 durable write-back 的最小项目骨架。
- [examples/research-intake-packet](examples/research-intake-packet)
  一轮 bounded harness pass 之后的公开示例 packet。
- [examples/single-book-packet](examples/single-book-packet)
  一个 `single-book deep reading` 的 source-owned 示例 packet。
- [examples/multi-book-packet](examples/multi-book-packet)
  一个保留 source overlap 与 tension 的 `multi-book synthesis` 示例 packet。
- [examples/thesis-reading-packet](examples/thesis-reading-packet)
  一个 `thesis / non-textbook reading` 的非金融示例 packet。
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
