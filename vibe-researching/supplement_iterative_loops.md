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
