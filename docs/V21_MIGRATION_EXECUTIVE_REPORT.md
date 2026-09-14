# Workflow v2.1 Retroactive Migration — Executive Report

Paper: *When Supplier Competition Worsens Policy Coordination: Procurement Rents and Regional Industrial-Policy Specialization*  
Repository: `ryotamatsuki/supplier-competition-regional-policy-coordination`  
Date: 2026-09-15

## Certification verdict

`WORKFLOW V2.1 CERTIFIED`  
`FORMAL VERIFICATION PASS`  
`STAGE 4A PASS`  
`STAGE 7.5A PASS`  
`THEORY REFREEZE CERTIFIED`

Certification identifier: `P2-IO-THEORY-CERTIFIED-V21-2026-09-15-v1`.

This record certifies, rather than economically replaces, `P2-IO-THEORY-FREEZE-2026-09-15-v1`.

## Why migration was required

The paper had already reached a submission-ready manuscript state under an earlier internal workflow. Theory Paper Research Pipeline v2.1 requires three gates that had not been formally closed before the existing freeze: Stage 4A Independent Mathematical Adversarial Certification, Stage 7.5A Generality / Quantifier Red-Team, and an embedded Formal Verification Gate.

## What was certified

The migration independently reconstructed the upper-stage government game, exact pure and mixed equilibrium correspondence including equality cases, the coordinated fixed-instrument benchmark, threshold ordering, strict wedge expansion, and the eventual competition-induced equilibrium reversal.

A targeted Lean 4/mathlib development certifies the proof-critical upper-stage algebra and logical bridges. Lower-stage order-statistic and auction-theory results remain explicit imported hypotheses: Lean does not pretend to prove DRHR rent monotonicity, iid order-statistic convergence, revenue equivalence, or reserve-case probability theory from first principles.

## Formal environment

- Lean: `leanprover/lean4:v4.32.1`
- mathlib tag: `v4.32.1`
- pinned mathlib revision: `520045ab14e26149ee970e2e617ca04b09bde5d6`
- build: `lake build SupplierCompetitionPolicy`
- axiom audit: `lake env lean Main.lean`

The hardened certification run produced a nonempty theorem-level `#print axioms` report. Every audited proof-critical theorem depends only on the standard Lean/mathlib logical foundations `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or project-specific axiom appears.

## CI incident and repair

The migration deliberately rejected two false-green hazards. First, CI was hardened to build the explicit Lean library target. Second, imported `#print axioms` output was found insufficient as evidence, so the audit entrypoint was changed to issue theorem-level `#print axioms` directly and CI was made fail-closed on empty reports, missing expected theorem names, Lean errors, or `sorryAx`.

## Theory drift

None. No player, strategy, timing, payoff, distributional primitive, incidence parameter, equilibrium concept, coordinated benchmark, threshold, headline theorem, or robustness margin was intentionally changed.

## Downstream status

Stage 8/9/10 regressions, the v2.1 independent certification regression, figure generation, LaTeX build, reference/box-warning gate, administrative template build, claim/traceability checks, and bounded Stage 11 hostile re-audit all pass. No certification regression was found.

The project is therefore cleared to resume canonical Stage 14 / 15 submission QA and freeze, subject only to live journal-portal and factual author-metadata/declaration checks.