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
