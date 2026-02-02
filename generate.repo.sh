#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="vibe-researching"

mkdir -p "${REPO_DIR}"/{pipeline,prompts,examples}

# -----------------------
# README.md
# -----------------------
cat > "${REPO_DIR}/README.md" <<'EOF'
# Vibe Researching Pipeline
*A goal-conditioned, GPT-augmented research workflow for fast, rigorous computational papers*

## What this is

This repository documents a research workflow that turns long-term domain immersion and vague scientific intuition (“vibe”) into publishable, reviewer-robust computational papers, using large language models (LLMs) as an amplification tool rather than a replacement for expertise.

The pipeline is optimized for researchers who:
- already operate inside a technical domain (not beginners),
- can generate real scientific intuition through reading, experiments, and analysis,
- want to compress the cycle from idea → figures → draft without sacrificing rigor.

This is not an idea generator, nor a paper-writing shortcut for shallow understanding.

## Core philosophy

1) Vibe is not noise  
“Vibe” here means pre-verbalized pattern recognition formed through sustained exposure to a field: papers, talks, experiments, failures, and conversations. The pipeline assumes vibe already exists. GPT is used to compress, formalize, and stress-test it — not to invent it.

2) GPT is an abstraction engine, not an oracle  
LLMs are most valuable when used to translate intuition into explicit assumptions, surface hidden constraints, reverse-engineer reviewer expectations, and close execution loops. They are constrained in early stages to avoid premature idea pollution.

3) Research is goal-conditioned  
A paper is a delivery optimized for a specific venue (journal / workshop / conference). This pipeline works backwards from a submission target to shape scope, figure design, analysis depth, and narrative framing.

## The pipeline (high level)

Five core states with two mandatory feedback loops.

Core states:
- S0 — Domain Embodiment
- S1 — Top-tier Signal Accumulation
- S2 — Vibe → Explicit Abstraction
- S3 — Goal-Conditioned Research Design
- S4 — Paper Assembly Line (Figure-driven execution)

Feedback loops (non-optional):
- R1 — Iterative Deepening (understand-until-reproducible)
- R2 — Iterative Rewriting (draft-to-submission refinement)

See: `supplement_iterative_loops.md`

## Two critical add-ons: deep understanding + iterative rewriting

This pipeline only works if you actively prevent “LLM-induced shallow novelty”: outputs can feel new and correct while remaining poorly understood. Two add-ons are mandatory:

(1) Iterative deepening, where you repeatedly interrogate the final artifact until you can faithfully re-derive and restate it without the model; and  
(2) Iterative rewriting, where every section and figure is refined through multiple reviewer-style passes (human PI / domain experts / GPT-as-skeptical-reviewer) with explicit change objectives.

## What’s in this repository

Each stage includes:
- intent and constraints,
- failure modes,
- reusable prompt templates,
- guidance on when not to use GPT.

## Preconditions (read carefully)

This workflow assumes:
1) Real domain immersion  
2) Taste for top-tier work  
3) Full accountability: you understand and can defend every sentence, figure, and claim — including those suggested by GPT.

If you can’t explain it without GPT, you don’t own it.  
If you don’t iterate with explicit objectives, you’re not revising — you’re just rewriting.

## Status

Actively used and iteratively refined. Contributions welcome, especially critiques and failure cases.
EOF

# -----------------------
# philosophy.md
# -----------------------
cat > "${REPO_DIR}/philosophy.md" <<'EOF'
# Philosophy
Design principles and failure modes for the Vibe Researching Pipeline.

## Design principles

1) Constrain GPT early, unleash GPT late  
In early stages, GPT should behave like an explainer and abstraction editor. Premature “solutions” pollute intuition. In later stages, GPT can accelerate execution (figure-to-code) and act as an adversarial reviewer.

2) Optimize for falsifiability, not vibes  
A good vibe becomes a good project only when it is translated into an explicit claim with testable implications. Every major claim must tie to a minimal evidence path.

3) Goal-conditioned research is not scope creep  
The venue target is a constraint, not an excuse to inflate the story. Work backwards from acceptance criteria to define the smallest complete story.

4) Figure-first writing  
Narratives drift. Figures anchor. A paper is a sequence of evidence objects and their interpretation, not a sequence of clever sentences.

5) Mandatory loops: deepening + rewriting  
Two loops prevent “shallow novelty”: (A) iterative deepening until you can reproduce/teach the logic without GPT; (B) iterative rewriting with explicit objectives and reviewer-grade critique.

## Common failure modes

- LLM-induced shallow novelty: outputs feel correct but you cannot defend them.
- Rhetorical patching: rewriting wording instead of tightening evidence or boundaries.
- Scope creep: adding analyses to answer every critique, turning one paper into three.
- Over-abstraction: elegant framing without a minimal evidence path.
- Under-specification: vague claims that reviewers can interpret against you.

## Practical rules

- If you cannot restate it from scratch, pause and deepen.
- If a revision round has no objective, you’re just rewriting.
- If a claim is large, make the boundary conditions explicit.
- If a figure does not answer a question, delete it.
EOF

# -----------------------
# supplement_iterative_loops.md
# -----------------------
cat > "${REPO_DIR}/supplement_iterative_loops.md" <<'EOF'
# Supplement: Iterative Deepening & Iterative Rewriting
Two non-optional loops that prevent shallow novelty and turn first drafts into publishable work.

## A. Iterative Deepening Loop (Understand-Until-Reproducible)

### Why it matters
LLM outputs can be novel-sounding and coherent while remaining shallowly understood by the author. This creates “confidence without comprehension”.

### Definition of “done”
An artifact (idea, figure claim, method, paragraph) is understood if you can:
1) Restate it from scratch  
2) Explain assumptions and boundary conditions  
3) Predict at least one failure case  
4) Defend why the evidence supports the claim

### Prompt templates

**A1. Self-reproduction test**
Ask GPT to generate a set of probing questions + what a high-quality answer must contain (without giving full answers).

**A2. Explain-until-I-can-teach**
Force multi-layer explanation: mechanism layer, method layer, reviewer layer, plus one counterexample and a minimal test.

**A3. Blind restatement**
Ask for guiding questions only; you attempt the restatement without seeing the original.

## B. Iterative Rewriting Loop (Draft-to-Submission Refinement)

### Why it matters
No serious paper ends at draft 1. Revisions must be objective-driven and evidence-bound.

### Definition of “done”
Submission-ready means:
- hostile reviewer pass finds no obvious holes,
- claims are explicitly tied to evidence,
- limitations are acknowledged with bounded language,
- alternative explanations are addressed or scoped out.

### Prompt templates

**B1. Hostile reviewer critique**
Get the top 3 fatal critiques + hidden reviewer standards + minimal fixes.

**B2. Revision with constraints**
Revise without scope expansion, with an explicit change list.

**B3. PI-style steering**
No text rewriting; only control signals: claim size, broken evidence links, and next iteration priorities.

## Rule of thumb
If you can’t explain it without GPT, you don’t own it.  
If you don’t iterate with explicit objectives, you’re not revising — you’re just rewriting.
EOF

# -----------------------
# pipeline stage docs
# -----------------------
cat > "${REPO_DIR}/pipeline/S0_Embodiment.md" <<'EOF'
# S0 — Domain Embodiment
Goal: build non-verbal domain intuition via immersion (papers, talks, data, experiments, expert conversations) without forcing ideas.

## What GPT is allowed to do
- explain concepts, methods, plots, assumptions
- answer targeted questions
- provide alternative explanations when you ask

## What GPT is NOT allowed to do
- propose research directions unprompted
- “summarize trends” as a substitute for your exposure
- generate paper narratives

## Exit criteria
- you can parse and critique typical papers in the domain
- you know what confuses you and what is settled
- you can ask precise questions about methods and evidence
EOF

cat > "${REPO_DIR}/pipeline/S1_Signal.md" <<'EOF'
# S1 — Top-tier Signal Accumulation
Goal: learn what kinds of abstractions and evidence patterns trigger acceptance in top venues.

## Methods
- maintain a curated reading list of top-tier papers
- analyze author intent: what gap was real at the time?
- map each paper to: claim size, evidence objects, failure boundaries

## GPT usage
Use GPT to:
- infer implicit reviewer standards
- reverse-engineer paper structure
- identify the “missing abstraction” each paper introduced

## Exit criteria
- you can predict reviewer expectations for your target venue
- you can explain why a paper is top-tier beyond “it’s novel”
EOF

cat > "${REPO_DIR}/pipeline/S2_Abstraction.md" <<'EOF'
# S2 — Vibe → Explicit Abstraction
Goal: translate vague intuition into a concrete scientific gap or missing assumption with a minimal evidence path.

## Outputs
- a one-sentence missing abstraction
- the implicit assumption in mainstream methods that causes the gap
- a minimal, public-data evidence plan

## GPT usage
- allowed: abstraction, constraint surfacing, counterexamples
- forbidden: architecture-first solutioning before the gap is crisp

## Exit criteria
- you can state the gap without metaphor
- you can list at least 2 predictions that follow
- you can name the minimal evidence objects required
EOF

cat > "${REPO_DIR}/pipeline/S3_GoalConditioned.md" <<'EOF'
# S3 — Goal-Conditioned Research Design
Goal: fix a submission target and design the smallest complete story that will be accepted there.

## Outputs
- venue-aligned story skeleton
- figure plan (minimum complete set)
- analysis plan (must-have vs nice-to-have)
- explicit scope boundaries

## GPT usage
- reverse-design from venue criteria
- simulate reviewer questions specific to the venue
- enforce scope control

## Exit criteria
- you can defend why each figure must exist
- you can explain what you are NOT doing (and why)
EOF

cat > "${REPO_DIR}/pipeline/S4_Execution.md" <<'EOF'
# S4 — Paper Assembly Line (Figure-driven execution)
Goal: execute analysis and writing as an evidence production line.

## Canonical order
1) figure question
2) analysis code
3) visualization
4) interpretation (claim bounded to evidence)
5) methods (reproducible)
6) discussion (implications + limitations)
7) abstract + title

## Mandatory loops
- Reality Check: if results do not support the claim, change analysis or question, not rhetoric.
- Hostile Reviewer: repeatedly test for ambiguity and missing controls.

## Exit criteria
- every claim points to a figure/table
- every figure answers a defined question
- the paper survives a hostile reviewer pass without major holes
EOF

# -----------------------
# prompts files
# -----------------------
cat > "${REPO_DIR}/prompts/immersion.txt" <<'EOF'
I’m immersing in {DOMAIN}. Act as a “strict explainer, not an ideator”.

Rules:
1) Do NOT propose new research directions unless I explicitly ask.
2) Only explain the concept/method/figure I ask about.
3) Be precise: define assumptions, failure cases, and common confusions.

Question:
{QUESTION}
EOF

cat > "${REPO_DIR}/prompts/top_journal_analysis.txt" <<'EOF'
Analyze this paper from the author’s intent and reviewer-standards perspective.

Tasks:
1) What is the core abstraction / missing concept they introduced?
2) What “cognitive gap” existed before this paper?
3) What assumptions does the field make that this paper breaks?
4) If submitted today, would it still be accepted? Why/why not?

Paper:
{CITATION_OR_ABSTRACT}
EOF

cat > "${REPO_DIR}/prompts/vibe_to_abstraction.txt" <<'EOF'
I have a vague intuition. Do NOT jump to solutions.

Vibe (informal):
{VIBE}

Tasks:
1) Translate this into a crisp scientific gap or hypothesis.
2) Identify which assumptions in mainstream methods (e.g., {METHODS}) make them miss it.
3) Provide a minimal public-data evidence path (figures / tests), without proposing new model architectures yet.
EOF

cat > "${REPO_DIR}/prompts/goal_reverse_design.txt" <<'EOF'
My delivery target is: {VENUE}

Constraints:
- Data: {DATA_TYPES}
- No new wet lab experiments
- Timeline: {TIMELINE}
- Output: {PAPER_TYPE} (e.g., workshop tiny paper / full paper)

Reverse-design:
1) What story skeleton does this venue expect?
2) Minimum complete figure set (must-have) vs optional (nice-to-have).
3) Reviewer risk register: top likely critiques + minimal defenses.
4) Explicit scope boundaries: what we will NOT do.
EOF

cat > "${REPO_DIR}/prompts/figure_to_code.txt" <<'EOF'
We are executing Figure {N}.

Scientific question:
{QUESTION}

Available data objects (R/Python):
{OBJECTS_AND_SHAPES}

Requirements:
1) Propose the simplest analysis that answers the question (no unnecessary complexity).
2) Provide reproducible code.
3) Identify likely reviewer critiques and how to address them minimally.
EOF

cat > "${REPO_DIR}/prompts/hostile_reviewer.txt" <<'EOF'
Act as a hostile, domain-expert reviewer.

Artifact:
{TEXT_OR_FIGURE_DESCRIPTION}

Output:
1) Top 3 fatal critiques (ranked by severity).
2) The hidden reviewer standard behind each critique.
3) Minimal fixes (specific analysis/controls/boundary language).
4) Any ambiguous phrasing that could be interpreted against the authors.
EOF

# -----------------------
# examples
# -----------------------
cat > "${REPO_DIR}/examples/TF-BAF_case_study.md" <<'EOF'
# Example Case Study: TF–BAF Coupling (placeholder)

This file is a template for documenting a full end-to-end run of the pipeline on a concrete project.

## S0 — Embodiment
- Domain: chromatin remodeling (BAF/SWI-SNF), TF binding, cancer epigenetics
- Immersion artifacts: key papers, talks, datasets, confusion list

## S1 — Signal
- Top-tier triggers: interface-specific execution layers; structural biology cues; mechanistic-to-computational bridge

## S2 — Abstraction
- Missing abstraction: TF programs require context-specific chromatin execution machinery (TF–BAF coupling)
- Why mainstream generative models miss it: chromatin is absorbed as a homogeneous latent factor

## S3 — Goal-conditioned design
- Venue target: {WORKSHOP/JOURNAL}
- Minimum figure set: {FIGURE PLAN}

## S4 — Execution
- Figure-by-figure: analysis → code → plots → interpretation → methods

## Loops
- Iterative deepening: reproduction tests for every key claim
- Iterative rewriting: hostile reviewer passes + expert feedback integration
EOF

echo "✅ Repo scaffold created at: ${REPO_DIR}"
