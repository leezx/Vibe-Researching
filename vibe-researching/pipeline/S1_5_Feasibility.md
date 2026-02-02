# S1.5 — Feasibility Bounding (Hard Constraints)

## Purpose

Before translating vibe into a concrete scientific abstraction, the search space must be **explicitly bounded by feasibility**.

This step enforces a simple but critical rule:

> A top-tier idea that you cannot execute is not an idea — it is a distraction.

The goal here is not to lower ambition, but to **align ambition with irreversible constraints**.

---

## Why this step is mandatory

LLMs are extremely good at expanding idea space.
They are also extremely bad at respecting *your* physical constraints unless forced.

Without an explicit feasibility-bounding step:
- vibe drifts toward experimental or data types you cannot produce,
- abstraction becomes detached from execution,
- weeks are lost on ideas that die at implementation.

This is especially dangerous for computational-only projects.

---

## What “feasibility” means here

Feasibility is not about time or motivation.  
It is about **irreversible capability constraints**.

You must explicitly fix:

### 1. What you cannot do (hard no)
Examples:
- wet-lab experiments
- new data generation
- certain imaging modalities
- proprietary or inaccessible datasets

### 2. What you are fluent in (hard yes)
Examples:
- scRNA-seq
- bulk RNA-seq
- ATAC-seq
- DepMap / TCGA
- specific public consortia datasets
- specific analysis paradigms you can execute without ramp-up

### 3. What you can realistically combine
Not all data combinations are symmetric.  
Some integrations are routine; others are research projects by themselves.

---

## Output of this step

This step should produce a **feasibility envelope**:

- allowed data types
- allowed perturbation types (in silico only, public perturbations, etc.)
- allowed validation standards (computational only, cross-dataset consistency, etc.)

This envelope is **binding** for all subsequent idea development.

---

## GPT usage (strictly constrained)

GPT is used here as a **constraint enforcer**, not an ideator.

### Canonical prompt

```text
Here are my irreversible constraints for this project:

Hard no (cannot do):
{LIST}

Hard yes (data / methods I am fluent in):
{LIST}

Soft yes (possible but costly):
{LIST}

Task:
1) Based on current top-tier work in {FIELD}, enumerate the kinds of research questions that are STILL viable within these constraints.
2) Explicitly exclude ideas that would implicitly require violating them.
3) Do NOT propose experimental extensions or “future work” at this stage.