# Stage 7.5A — Generality / Quantifier Red-Team Gate

Date: 2026-09-15  
Canonical theory: `P2-IO-THEORY-FREEZE-2026-09-15-v1`

## Verdict

`STAGE 7.5A PASS`

## Quantifier map

### Finite-N statements

For every `N>=2` satisfying the maintained baseline assumptions:

- the exact government-game equilibrium correspondence follows from the payoff matrix and the sign of `A rho R_N-Delta`;
- the coordinated switching condition is exactly the sign of `A G_N-Delta`;
- fixed-N ordering `A_N^P<A_N^N` uses only `Delta>0`, `B_N>0`, `R_N>0`, and `0<rho<=1` through `G_N=B_N+R_N>rho R_N`.

### Comparative-static statements

- `G_{N+1}>G_N` does not require DRHR in the maintained iid nondegenerate order-statistic environment.
- `R_{N+1}<R_N` is a DRHR-dependent imported auction result and is not asserted for arbitrary continuous `F`.
- T1 and T2 are therefore universal only over the stated DRHR baseline (or, abstractly, whenever the two lower-stage inequalities hold).

### Asymptotic statements

T3 requires `A(v-c_0)>Delta`, endpoint convergence of the first order statistic, and rent convergence to zero. It is an eventual statement: it does not claim that every finite `N` already lies in the reversal regime.

T4 is likewise eventual. No reserve/trade-failure theorem claims stepwise rent decline.

## Assumption audit

- `rho>0`: required because `A_N^N=Delta/(rho R_N)` and because the decentralized threshold is undefined at `rho=0`.
- `rho<=1`: used for baseline incidence and the fixed-N ordering `G_N>rho R_N`; several algebraic Nash statements themselves need only `rho>0`.
- `B_N>0`: used to make `U` a strict best response to `D` and for the exact boundary correspondence. Under guaranteed trade `v>bar c`, this follows from `v>C_{2:N}`.
- DRHR: required for one-step supplier-rent decline and the associated monotone decentralized threshold; not required for `G_N` increasing.
- guaranteed trade: used for the headline clean baseline, `B_N>0`, and standard decomposition; reserve robustness is handled separately.
- compact support / positive density: used in the baseline order-statistic convergence argument supporting T3.
- `A(v-c_0)>Delta`: required for eventual coordinated differentiation; without it T3 is false in general.

## Kill tests

### 1. Non-DRHR `F`

Arbitrary continuous distributions do not guarantee `R_{N+1}<R_N`. A two-cluster continuous distribution provides a counterexample. Therefore manuscript language must not say supplier competition always lowers rent without the DRHR qualifier.

### 2. Reserve/trade failure

With a binding reserve, `R_N^R` can rise over finite ranges. Uniform `[0,1]` with `v=0.1` is an explicit counterexample. The valid robustness statement is eventual `R_N^R->0`, not stepwise monotonicity.

### 3. `rho->0+`

`A_N^N` diverges. The model permits arbitrarily weak positive incidence but excludes `rho=0` from the threshold formula. No statement is generalized to zero capture.

### 4. Buyer-side capture `sigma>0`

For general local capture `L_N=rho R_N+sigma B_N`, writing `d_m=m_N-m_{N+1}>0` and `d_R=R_N-R_{N+1}>0`,

`L_N-L_{N+1}=rho d_R-sigma(d_m+d_R)`.

Thus local capture falls iff `rho>sigma(1+d_m/d_R)`. The baseline `sigma=0` is therefore economically substantive; monotonicity is not claimed for arbitrary incidence.

### 5. Arbitrary continuous `F`

`G_N` can still rise while `R_N` fails to decline. Hence T1's two threshold directions separate cleanly: the planner-side comparative static is more general than the decentralized-side one.

### 6. Finite N versus eventual N

T1/T2 are one-step finite-N results under their lower-stage inequalities. T3/T4 are asymptotic eventual results. The manuscript must not substitute “for all N” for “for sufficiently large N”.

### 7. Equality thresholds

At `A=A_N^P`, the coordinated benchmark ties `(U,U)`, `(U,D)`, and `(D,U)`. At `A=A_N^N`, the full mixed Nash correspondence is the boundary continuum `p_1=1 or p_2=1`. Any statement of uniqueness at equality would be false.

## Language audit

- “competition” means an increase in exogenous supplier count `N`, not a generic antitrust or conduct parameter.
- “strictly” is retained only where strict lower-stage or payoff inequalities have been established.
- “eventually” is used for T3/T4 and not replaced by an all-finite-N claim.
- “unique” is valid in the low decentralized regime, not at the boundary.
- “planner” is interpreted as the coordinated benchmark over the same fixed instrument set; `first best` is not used.
- “robust” is restricted to explicitly audited margins such as standard revenue equivalence or eventual reserve reversal, not common values, asymmetric bidders, risk aversion, collusion, or endogenous entry.
- “under DRHR” remains attached to the supplier-rent monotonicity result.

## Paper 1 separation

At fixed `N`, the reduced-form mapping is `G^P1=A G_N` and `lambda_N=rho R_N/G_N`. Therefore the fixed-N wedge is not Paper 2 novelty. Formalization confirms this rather than obscuring it. Paper 2's distinct theorem begins with `N` changing `G_N` and `R_N` in opposite directions and consequently changing the exact equilibrium set.

## Conclusion

All headline quantifiers match their proof scope after red-team attack. Known failure cases remain explicit boundaries rather than hidden qualifications.

`STAGE 7.5A PASS`