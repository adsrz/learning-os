<div align="right">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">简体中文</a>
</div>

# Learning OS

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)
![Local First](https://img.shields.io/badge/Model-Local--First-1f6feb)
![Sources](https://img.shields.io/badge/Sources-BYOS-0a7f5a)
![Status](https://img.shields.io/badge/Status-Public%20Skeleton-black)

一个面向深度阅读、跨书综合、论述型阅读与研究工作流的 `local-first` 学习操作系统。

`Learning OS` 不是笔记堆，也不是私人知识库模板。它更像一套可复用的学习协议：强调连续性、结构化、显式 source 管理，以及带验证的仓库卫生。

## 这个项目解决什么问题

大多数学习仓库能存笔记，但很难真正承载一条严肃、长期的学习流程。

`Learning OS` 把这些能力放到了第一层：

- 支持长期学习弧线的连续性管理
- 按 source 组织的工作流，而不是泛化的笔记采集
- 可复用的 distinctions、evidence 与 open questions
- 不打包受版权保护材料的 public-safe 分享方式
- 支持在不同领域下 `BYOS` 使用，也就是自带自己的学习资料

## 支持的工作流模式

当前公开版提供 4 种可复用模式：

- `Single-book deep reading`
  单一主 source，慢速、机制优先、持续写回。
- `Multi-book synthesis`
  多个 source 进入同一学习项目，但不会被粗暴压扁成一本书。
- `Thesis / non-textbook reading`
  适用于论述性强、文章型、理论先行，而不是标准教材型的阅读对象。
- `Research / paper workflow`
  适用于论文、报告、抓取文章等需要先 intake 和分类的材料。

这些模式是参考工作流，不是固定书单。系统本身是 `source-agnostic` 的。

## 它和普通学习仓库有什么不同

- `从设计上就是 public-safe`
  仓库可以公开传播，而不需要重新分发第三方书籍或论文。
- `BYOS`
  使用你自己合法获得的资料，并将它们映射到本地忽略目录中。
- `协议优先`
  这个仓库围绕可重复执行的学习流程设计，而不是围绕某个单一学科或某套固定书单。
- `示例驱动`
  示例不是装饰，它们展示了这套协议如何落到真实的严肃学习项目上。

## 快速开始

先运行公开仓库检查：

```powershell
.\tools\Test-All.cmd -RepoOnly
```

然后阅读这些说明：

- [docs/public-setup.md](docs/public-setup.md)
- [docs/bring-your-own-sources.md](docs/bring-your-own-sources.md)
- [docs/workflow-modes.md](docs/workflow-modes.md)

你也可以先看开放示例：

- [samples/open/demo-source.md](samples/open/demo-source.md)

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
- [docs/architecture.md](docs/architecture.md)
  仓库如何拆分成 core、examples 和 local source layers。
- [docs/workflow-modes.md](docs/workflow-modes.md)
  四种支持的学习模式。
- [docs/examples](docs/examples)
  可直接改造的模式示例说明。
- [docs/source-manifest.template.json](docs/source-manifest.template.json)
  用于把你自己的 source 映射到本地布局中的模板。
- [tools](tools)
  校验与本地 source 导入工具。

## 示例不是限制

启发这个公开仓库的私有工作区里，包含过这些参考实现：

- 衍生品学习作为 `single-book deep reading`
- 固收学习作为 `multi-book synthesis`
- 论述型阅读作为 `non-textbook reading`
- 论文和报告 intake 作为 `research workflow`

在公开版里，这些都只是工作流参考，不是必须使用的私有语料库。

## Public Boundary

这个公开仓库 **不包含** 第三方书籍、论文、PDF、幻灯片或其他专有学习材料。

你需要自带你自己合法获得的 source。

这样设计是有意的：

- 它让仓库更安全地公开发布
- 它让框架不被某一套私有资料绑死
- 它让同一套协议能够用于金融、经济、哲学、政策、机器学习等重阅读领域

## 验证

只验证公开仓库部分：

```powershell
.\tools\Test-All.cmd -RepoOnly
```

导入你自己的 source 之后，做完整验证：

```powershell
.\tools\Test-All.cmd
```

## 许可证

本仓库采用 [MIT License](LICENSE)。

第三方书籍、论文、PDF、幻灯片和其他 source materials 不包含在仓库中，也不受本仓库许可覆盖。
