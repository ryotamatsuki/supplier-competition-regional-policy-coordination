# Workflow-v2.1 Downstream Revalidation

## Purpose

All post-freeze artifacts were treated as provisionally stale until Stage 4A, Stage 7.5A, and the Formal Verification Gate closed.

## Revalidation results

- Stage 8 proof-critical Python regression: PASS.
- Stage 9 independent mathematical/referee regression: PASS.
- Stage 10 submission preflight: PASS.
- v2.1 independent certification regression: PASS.
- Uniform regime figure regeneration: PASS.
- Anonymous manuscript LaTeX build: PASS.
- unresolved-reference/citation and box-warning gate: PASS.
- administrative template builds: PASS.
- proof-critical Lean build: PASS.
- forbidden placeholder/project-axiom scan: PASS.
- theorem-level nonempty axiom audit: PASS.
- claim-to-formal statement traceability: PASS.
- theory-drift check: PASS; no scientific manuscript change was introduced by the migration.

The hardened PR run `34906064195` passed both CI jobs before certification documentation was finalized. Subsequent documentation-only commits must also pass PR CI before merge.

## Claim-register revalidation

The certification preserves the exact distinction between imported auction comparative statics and newly derived regional-policy conclusions. In particular:

- `G_N` increasing is not attributed to DRHR;
- `R_N` decreasing is not claimed for arbitrary continuous `F`;
- reserve-rent decline is eventual rather than stepwise;
- the general-incidence `sigma>0` condition remains conditional;
- fixed-N threshold wedge logic is not presented as Paper 2 novelty.

## Submission status

Scientific authorization is restored after v2.1 certification. Remaining canonical Stage 14/15 work is administrative/live-external only: current journal portal/fee verification, factual author metadata and declarations, final immutable submission freeze, and actual submission only on explicit user instruction.