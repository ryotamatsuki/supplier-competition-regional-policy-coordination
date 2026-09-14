# Formal axiom audit

Toolchain: `leanprover/lean4:v4.32.1`  
mathlib tag: `v4.32.1`  
Pinned mathlib revision: `520045ab14e26149ee970e2e617ca04b09bde5d6`

`SupplierCompetitionPolicy/Audit.lean` runs `#print axioms` on every proof-critical theorem included in the v2.1 migration.

Acceptance rule:

- no `sorry` or `admit`;
- no project-specific `axiom` declaration;
- no `sorryAx` in the generated axiom report;
- standard Lean/mathlib logical axioms are acceptable.

The CI job writes `formal/FORMAL_AXIOM_REPORT.txt` from a fresh Lean run and fails if `sorryAx` is present. The exact CI run and commit SHA are recorded by GitHub Actions.
