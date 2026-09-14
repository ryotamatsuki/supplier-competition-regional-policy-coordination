# Formal axiom audit

Date: 2026-09-15  
Certified theory: `P2-IO-THEORY-FREEZE-2026-09-15-v1`

## Pinned environment

- Lean: `leanprover/lean4:v4.32.1`
- mathlib tag: `v4.32.1`
- pinned mathlib revision: `520045ab14e26149ee970e2e617ca04b09bde5d6`
- build command: `lake build SupplierCompetitionPolicy`
- axiom command: `lake env lean Main.lean`

## Acceptance rule

The formal gate rejects:

- `sorry`;
- `admit`;
- project-specific `axiom` declarations;
- Lean errors in the axiom audit;
- an empty axiom report;
- a report missing expected proof-critical theorem names;
- `sorryAx`.

Standard Lean/mathlib logical foundations are acceptable.

## Hardened certification evidence

PR workflow run: `34906064195`  
PR branch head at the hardened run: `728e82256fd914dcbf3748747f6c2122bd9b7211`  
GitHub pull-request merge-ref commit recorded by Actions: `d0067543e0a4c3821372d452d66bb85be6b646be`  
Formal evidence artifact digest: `sha256:aa308899e02ab03331f1668f0529034a228ead4f1957040f32e26e728d5120be`

The generated `FORMAL_AXIOM_REPORT.txt` explicitly audited the following proof-critical theorems:

- `planner_threshold_lt_decentralized`
- `planner_threshold_falls`
- `decentralized_threshold_rises`
- `strict_wedge_expansion`
- `pureNash_iff_UU_of_low`
- `pureNash_UD_of_high`
- `pureNash_DU_of_high`
- `boundary_mixedNash_iff`
- `mixed_probability_indifference`
- `mixed_probability_in_unit`
- `planner_gain_iff`
- `planner_optimum_iff_differentiated`
- `eventual_condition_bridge`
- `eventual_reversal_exact`
- `eventual_reversal_mixed`

Every audited theorem depends only on:

- `propext`;
- `Classical.choice`;
- `Quot.sound`.

No `sorryAx` or project-specific axiom appears.

## CI hardening incident

An earlier implementation could appear green without providing trustworthy theorem-level axiom evidence. The migration audit caught this by inspecting the generated artifact rather than trusting job color alone. CI was then hardened to build the explicit Lean library target, use `set -euo pipefail`, issue theorem-level `#print axioms` from `Main.lean`, require a nonempty report, require named theorem entries, and fail on Lean errors or `sorryAx`.

Only the hardened run is accepted as certification evidence.

## Verdict

`AXIOM AUDIT PASS`
