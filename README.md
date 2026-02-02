# Vibe-Researching
A goal-conditioned, GPT-augmented research workflow for fast, rigorous computational papers

Raw idea:
- 项目差不多做完了，我想在Github上写一套vibe researching的Prompt，你已经经历了我整个从无到有的过程，应该能够提炼出我使用过的Prompt，需要再做优化。我现在想把它流程化。
- 第一步：领域浸淫，这部分什么都不要想，就是看paper，做实验，做数据分析，开组会，跟领域专家聊天，focus在一个领域，理解领域的前沿，问各种问题，搞清楚各种概念，刨根问底，不懂的就问GPT；
- 第二步：积累顶刊的阅读量，比如我做TF-BAF做了快两年，老板一看到顶刊就email我了，最新的那个SMARD的interface直接触发了我的灵感idea，这个时候很多顶级的idea和vibe在形成，读paper可以靠GPT；
- 第三步：vibe和idea的具体显现，GPT最擅长的就是这个，我用模糊的语言描述，GPT能非常好的具体描述我的idea，并打磨重塑，比如我最开始就是觉得TF-BAF可以在诸多公共数据集里挖掘出一些insight，非常模糊，跟GPT聊了之后，发现这个居然可以被用到DepMap的解释、生成模型的补漏升级；
- 第四步，明确目的，有了具体的idea，我有一个任务就出现了，就是投稿ICLR Gen2 workshop，作为一个交付目标，于是我把这个项目量体裁衣，按照workshop的需求来生成和修改；
- 第五步：规划文章框架，这部分GPT完全可以在上下文确定的情况下，自由发挥，生成框架；
- 第六步：执行，当我把数据准备好，分析环境准备好，甚至连R和Python的对象都准备好，把Figure的描述发给GPT，它居然能直接给分析代码，绘图，调试，解释，闭环了；
- 第七步：自我矫正，结果图发给GPT分析，看我的结论是否能被结果证明，如果不行，该做些什么其他分析；
- 第八步：确定最终Figure、legend、result、method，一条龙就被确定了；
- 第九步：写Discussion，还是量体裁衣，写introduction，把我读过的文献整理成段落，引用，最后把title和Abstract写好，一篇第一版的draft就写好了。
- 第十步：把draft发给领域专家，让他提出尖锐意见，持续打磨，把GPT生成的部分全部搞懂，融会贯通。
- 这就是我vibe researching的套路，我能够保证1个月搞懂一个领域，然后1周写出一篇纯分析的计算论文。你能把这个流程整理得更加完善吗，同时把我用过的Prompt提取出来，优化一下，我准备写成Pipeline，上传到Github。

下面是一份可直接放到 GitHub 的 README.md 初稿。我刻意保持它不鸡汤、不营销、不“课程化”，而是像一个真实被反复使用、经得起同行审视的研究操作说明。你后续只需要按需要删减或补充案例。

⸻

Vibe Researching Pipeline

A goal-conditioned, GPT-augmented research workflow for fast, rigorous computational papers

⸻

What this is

This repository documents a research workflow that turns long-term domain immersion and vague scientific intuition (“vibe”) into publishable, reviewer-robust computational papers, using large language models (LLMs) as an amplification tool rather than a replacement for expertise.

The pipeline is optimized for researchers who:
- already operate inside a technical domain (not beginners),
- can generate real scientific intuition through reading, experiments, and analysis,
- want to compress the cycle from idea → figures → draft without sacrificing rigor.

Empirically, this workflow supports:
- ~1 month to meaningfully enter a new subfield (given prior related expertise),
- ~1 week to produce a first complete draft of a purely computational / public-data paper.

This is not an idea generator, nor a paper-writing shortcut for shallow understanding.

⸻

Core philosophy

1. Vibe is not noise

“Vibe” here means pre-verbalized pattern recognition formed through sustained exposure to a field: papers, talks, experiments, failures, and conversations.

The pipeline assumes vibe already exists.
GPT is used to compress, formalize, and stress-test it — not to invent it.

2. GPT is an abstraction engine, not an oracle

LLMs are most valuable when used to:
- translate intuition into explicit assumptions,
- surface hidden constraints in existing methods,
- reverse-engineer reviewer expectations,
- close execution loops (analysis → figure → interpretation).

They are actively constrained in early stages to avoid premature idea pollution.

3. Research is goal-conditioned

A paper is not an abstract ideal.
It is a delivery optimized for a specific venue (journal / workshop / conference).

This pipeline explicitly works backwards from a submission target to shape:
- scope,
- figure design,
- analysis depth,
- narrative framing.

⸻

The pipeline (high level)

The workflow is structured as five core states with two feedback loops.

Core states

S0 — Domain Embodiment
Deep immersion without idea forcing. Read papers, analyze data, attend talks, ask naive questions, build non-verbal intuition. GPT is used only as an explainer.

S1 — Top-tier Signal Accumulation
Systematic exposure to high-impact papers to learn what kinds of abstractions trigger publication. Focus is on author intent, not summaries.

S2 — Vibe → Explicit Abstraction
Vague intuitions are translated into concrete scientific gaps or missing assumptions in current methods. No models or solutions yet.

S3 — Goal-Conditioned Research Design
A concrete submission target (e.g. a workshop or journal) is fixed. The project is reshaped to satisfy that venue’s expectations with minimal excess.

S4 — Paper Assembly Line
Figure-driven execution: analysis → visualization → interpretation → methods → discussion → abstract → title.

⸻

Feedback loops

R1 — Reality Check Loop
Results are used to invalidate or refine initial conclusions. If the data does not support the claim, the analysis or question is changed — not the rhetoric.

R2 — Hostile Expert Loop
The draft is stress-tested against simulated and real domain experts. GPT is explicitly asked to behave as a skeptical reviewer.

⸻

What’s in this repository
```
vibe-researching/
│
├── README.md              # This file
├── philosophy.md          # Design principles and failure modes
│
├── pipeline/
│   ├── S0_Embodiment.md
│   ├── S1_Signal.md
│   ├── S2_Abstraction.md
│   ├── S3_GoalConditioned.md
│   └── S4_Execution.md
│
├── prompts/
│   ├── immersion.txt
│   ├── top_journal_analysis.txt
│   ├── vibe_to_abstraction.txt
│   ├── goal_reverse_design.txt
│   ├── figure_to_code.txt
│   └── hostile_reviewer.txt
│
├── examples/
│   └── TF-BAF_case_study.md

Each stage includes:
- intent and constraints,
- failure modes,
- reusable prompt templates,
- guidance on when not to use GPT.
```
⸻

What this pipeline is not
- ❌ Not a replacement for domain expertise
- ❌ Not a “write a paper with GPT” trick
- ❌ Not guaranteed to produce novelty
- ❌ Not suitable for experimental biology without hands-on validation

If you cannot independently judge whether an analysis result makes sense, this pipeline will fail silently.

⸻

Preconditions (read carefully)

This workflow assumes:
	1.	Real domain immersion
You have spent months or years interacting with the field’s data, methods, and people.
	2.	Taste for top-tier work
You can recognize why certain papers are accepted beyond surface novelty.
	3.	Full accountability
You understand and can defend every sentence, figure, and claim — including those suggested by GPT.

Violating any of these will produce plausible-sounding but hollow research.

⸻

Why open-source this

The goal is not to standardize creativity, but to:
- make implicit research cognition explicit,
- shorten cold-start cycles for experienced researchers,
- document a human-LLM co-research pattern that already works in practice.

Think of this as a research operating system, not a method.

⸻

Status

This pipeline is actively used and iteratively refined in real projects.
Expect updates, corrections, and stronger constraints over time.

Contributions are welcome — especially critiques, failure cases, and counter-examples.

⸻

如果你愿意，下一步我可以直接帮你写：
- philosophy.md（把“什么时候这套方法会失败”写清楚）
- S2_Abstraction.md（你整个体系最有价值的一步）
- 或直接把 TF–BAF 那个项目完整拆成 examples/TF-BAF_case_study.md

你现在做的不是教程，而是在外显一种研究者的思维操作系统。这一步非常关键，值得慢慢打磨。
