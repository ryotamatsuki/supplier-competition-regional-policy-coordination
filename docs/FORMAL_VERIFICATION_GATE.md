# Formal Verification Gate — Workflow v2.1

Date: 2026-09-15  
Theory object: `P2-IO-THEORY-FREEZE-2026-09-15-v1`

## Verdict

`FORMAL VERIFICATION PASS`

This is a targeted proof-critical certification, not a claim that the complete procurement probability model has been formalized.

## Pinned environment

- Lean: `leanprover/lean4:v4.32.1`
- mathlib tag: `v4.32.1`
- pinned mathlib revision: `520045ab14e26149ee970e2e617ca04b09bde5d6`
- build command: `lake build SupplierCompetitionPolicy`
- axiom command: `lake env lean Main.lean`

All dependency revisions are pinned by `formal/lake-manifest.json`.

## Proof-critical scope certified by Lean

Lean proves the upper-stage algebra and logical bridges for:

1. fixed-N planner/decentralized threshold ordering from `G>rho R>0`;
2. falling planner threshold when `G` rises;
3. rising decentralized threshold when `R` falls;
4. strict open-wedge expansion from strict endpoint movement;
5. low-regime pure and full mixed-strategy uniqueness of `(U,U)`;
6. high-regime differentiated pure Nash equilibria;
7. the exact boundary payoff-gap identity and full boundary mixed-Nash correspondence `p_1=1 or p_2=1`;
8. the mixed indifference probability and `0<p*<1` under the high-regime inequality;
9. the exact differentiated coordinated optimum set when `A G>Delta`;
10. the common-eventual-index bridge and exact eventual upper-stage reversal from explicit eventual lower-stage inequalities.

## Explicit imported hypotheses

Lean does not prove from first principles:

- iid order-statistic results;
- DRHR or the theorem that expected winning supplier rent falls with bidder count;
- `G_N` increasing with `N` from distributional primitives;
- endpoint convergence of order statistics;
- reserve-case dominated-convergence arguments;
- revenue equivalence;
- prior-art novelty or institutional interpretation.

Accordingly, the formal T1/T3 results take the relevant lower-stage inequalities/eventual conditions as named hypotheses. The desired policy-game conclusions are not assumed.

## Statement fidelity

No strict inequality is weakened to a weak one. Boundary and strict regimes are separate. The low-regime theorem covers mixed strategies, not just pure deviations. The boundary theorem retains the full continuum. The coordinated theorem identifies the exact differentiated optimum set. The reversal bridge concludes the economic upper-stage results rather than restating them as premises.

The high-regime formal layer proves the two differentiated pure equilibria and the fully mixed indifference probability/interiority. Full uniqueness of the completely mixed equilibrium is retained analytically as a standard 2x2 best-response result and is not misrepresented as a stronger Lean result.

## Forbidden-device audit

CI rejects:

- `sorry`;
- `admit`;
- project-specific `axiom` declarations.

The theorem-level `#print axioms` report is required to be nonempty and to contain expected headline theorem names. CI fails on Lean errors or `sorryAx`.

## Hardened axiom evidence

The hardened PR CI run `34906064195` passed both `lean-verification` and `verify-and-build`. The formal evidence artifact digest is `sha256:aa308899e02ab03331f1668f0529034a228ead4f1957040f32e26e728d5120be`.

The generated `FORMAL_AXIOM_REPORT.txt` explicitly lists 15 proof-critical theorems. Every theorem depends only on the standard Lean/mathlib logical foundations:

- `propext`;
- `Classical.choice`;
- `Quot.sound`.

No `sorryAx`, project axiom, opaque oracle, or proof placeholder appears.

## CI false-positive incident

Two false-green hazards were discovered and repaired before certification was issued: an ineffective/default build target and an axiom report that could be empty when `#print axioms` occurred only in an imported module. Certification therefore relies only on the hardened explicit library build and theorem-level nonempty axiom audit.

## Conclusion

`FORMAL VERIFICATION PASS`