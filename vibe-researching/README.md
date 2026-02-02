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
