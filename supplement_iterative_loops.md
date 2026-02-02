补一个 “Supplement / Addendum” 很合适，而且这两点其实是你体系里最关键的“防空转机制”。我建议在仓库里加一个独立文件，比如 `supplement_iterative_loops.md`，同时在 README 里放一个短段落链接过去。下面我先把“supple”的主文本给你（可直接粘贴），并给你一个 README 中的插入段落版本。

---

## README 可插入段落（短版）

### Two critical add-ons: deep understanding + iterative rewriting

This pipeline only works if you actively prevent “LLM-induced shallow novelty”: outputs can feel new and correct while remaining poorly understood. Two add-ons are mandatory: (1) **iterative deepening**, where you repeatedly interrogate the final artifact until you can faithfully re-derive and restate it without the model; and (2) **iterative rewriting**, where every section and figure is refined through multiple reviewer-style passes (human PI / domain experts / GPT-as-skeptical-reviewer) with explicit change objectives.

---

## `supplement_iterative_loops.md` 初稿（长版，可直接建文件）

# Supplement: Iterative Deepening & Iterative Rewriting

*Two non-optional loops that prevent shallow novelty and turn first drafts into publishable work.*

This supplement documents two add-ons that are easy to overlook because they are not “steps” in a linear pipeline. In practice, they are what separates high-throughput co-writing from real research.

---

## A. Iterative Deepening Loop (Understand-Until-Reproducible)

### Why it matters

LLM outputs can be simultaneously:

* novel-sounding,
* internally coherent,
* aligned with your vibe,
  yet still be **shallowly understood** by the human author.

This is dangerous because it creates “confidence without comprehension”. If you cannot restate, re-derive, and defend the idea without the model, you do not own the work. In research, that is a failure mode.

### Definition of “done”

An artifact (idea, figure claim, method, paragraph) is only “understood” if you can:

1. Restate it in your own words from scratch
2. Explain the assumptions and boundary conditions
3. Predict at least one failure case
4. Answer “why this evidence supports the claim” without rhetorical shortcuts

### The loop (practical)

1. Take the current artifact (figure, paragraph, method) as “final”.
2. Interrogate it with questions — either you ask, or you let GPT ask.
3. Attempt to answer from memory / first principles.
4. If you fail, you do not patch wording — you deepen understanding.
5. Repeat until you pass the “reproduction test”.

### Prompt templates

**A1. Self-reproduction test**

```text
下面是我们当前的成品（段落/结论/方法/figure claim）：
{artifact}

请你不要改写它。你的任务是：
1) 用5-8个问题来“拷打”我是否真正理解它（从假设、边界条件、反例、因果链条、统计解释等角度）
2) 每个问题后面给出你期待的“高质量回答要包含哪些要点”（不要直接给完整答案）
```

**A2. Explain-until-I-can-teach**

```text
我读懂了但还不能复述。请把下面这个点讲到我能“教别人”的程度：
{concept}

要求：
- 先给一句话版本，再给3层展开（机制层/方法层/reviewer层）
- 给一个反例（什么时候不成立）
- 最后给一个最小可检验实验/分析（public data也行）
```

**A3. Blind restatement**

```text
请把下面内容隐藏起来当成“我看不到的参考答案”，然后你只给我一个提纲式的问题列表，引导我自己复述完整逻辑：
{artifact}
```

### Common failure modes

* 只会“觉得对”，但说不出因果链条
* 能复述结论，但说不出关键假设
* 能说出方法步骤，但说不出为什么这样做
* 遇到质疑就只能换措辞，而不是补证据

---

## B. Iterative Rewriting Loop (Draft-to-Submission Refinement)

### Why it matters

No serious paper ends at draft 1. Research writing is a control system: every iteration has a goal, feedback, and a concrete change set.

PI behavior is the archetype here: they are not typing faster; they are **steering** the work through targeted critique and revision. GPT can serve as an always-available reviewer, but only if you force it into structured, adversarial evaluation.

### Definition of “done”

A section (figure / result / method / discussion) is “submission-ready” if:

* it survives a hostile reviewer pass without obvious holes,
* claims are explicitly tied to evidence,
* limitations are acknowledged without self-sabotage,
* alternative explanations have been addressed or bounded.

### The loop (practical)

1. Define the iteration objective (e.g., “reduce ambiguity”, “address reviewer X”, “tighten causal language”).
2. Run reviewer critique (GPT + human expert).
3. Convert critique into an explicit change list.
4. Revise using constraints (do not drift scope).
5. Re-run critique until marginal gains diminish.

### Prompt templates

**B1. Hostile reviewer critique (with actionable change list)**

```text
请扮演一个非常苛刻、甚至不友好的reviewer（熟悉{领域/方法}）。
这是当前的段落/图注/结果解释：
{artifact}

请输出：
1) 你最致命的3个质疑（按严重程度排序）
2) 每个质疑背后的“隐含评审标准”（他们到底在怕什么）
3) 我应该做的最小补救：新增哪个分析/对照/措辞边界（要具体可执行）
```

**B2. Revision with constraints**

```text
我要对下面内容做一轮“有方向的迭代修改”，目标是：
{objective}

约束：
- 不扩展scope
- 不引入新数据（除非你明确指出是最小必要）
- 保留核心结论，但允许更谨慎的表述

当前版本：
{artifact}

请输出：
- 修改后的版本
- 变更点清单（逐条说明你改了什么、为什么）
```

**B3. PI-style steering**

```text
请扮演PI，不写具体文字，只做“方向控制”。
给你当前稿件片段：
{artifact}

请输出：
- 这段的主张是否太大/太小
- 证据链哪里断了
- 这段最应该补的一个关键句是什么（只给句子的功能，不给句子本身）
- 下一轮迭代的优先级列表（最多5条）
```

### Common failure modes

* 无目标迭代：每一轮改了很多，但没有更接近投稿标准
* scope creep：为了堵一个质疑，把文章写成另一个项目
* rhetorical patching：只修辞，不补证据或边界条件
* “GPT自洽”幻觉：模型觉得顺，但审稿人不买账

---

## Practical rule of thumb

If you can’t explain it without GPT, you don’t own it.
If you don’t iterate with explicit objectives, you’re not revising — you’re just rewriting.

---

如果你同意这个 supple 的方向，我建议下一步把它接回主框架里：在 `pipeline/S4_Execution.md` 末尾加一个“Exit Criteria”小节，明确每个产物离开 S4 之前必须经过 A+B 两个 loop。这样你的 Pipeline 就不仅快，而且“可控”。
