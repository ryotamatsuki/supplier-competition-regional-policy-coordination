# Stage 4A — Theorem Certificates

Canonical theory: `P2-IO-THEORY-FREEZE-2026-09-15-v1`  
Certification target: `P2-IO-THEORY-CERTIFIED-V21-2026-09-15-v1`

## T0 — Exact Nash equilibrium correspondence

**Domain.** `Delta>0`, `A>0`, `0<rho<=1`, `B_N>0`, `R_N>0`; two players with strategy set `{U,D}`; mixed strategies represented by `p_i=Pr(U)` in `[0,1]`.

**Statement.** Let `L_N=A rho R_N`.

- `L_N<Delta`: the full mixed Nash set is `{(1,1)}`.
- `L_N=Delta`: the full mixed Nash set is `{(p_1,p_2): p_1=1 or p_2=1}`.
- `L_N>Delta`: pure Nash equilibria are `(U,D)` and `(D,U)`; the fully mixed symmetric equilibrium has `p_N^*=(Delta+A B_N)/(A(B_N+rho R_N))` with `0<p_N^*<1`.

**Dependencies.** Payoff matrix only; no DRHR required.  
**Analytic proof.** PASS.  
**Python verification.** PASS.  
**Lean status.** Low-regime full mixed uniqueness, boundary full correspondence, high-regime differentiated pure equilibria, mixed indifference equation and interiority are proved.  
**Unsupported assumptions.** None beyond stated positivity/domain restrictions.  
**Counterexample search.** Equality case specifically attacked; no collapse into neighboring strict regimes.  
**Remaining nonformalized economics.** Interpretation of `U`, `D`, `B_N`, `R_N`, `rho`.

## T1 — Competition–coordination divergence

**Domain.** `N>=2`; `Delta>0`; `0<rho<=1`; `G_N,G_{N+1},R_N,R_{N+1}>0`; lower-stage inequalities `G_{N+1}>G_N` and `R_{N+1}<R_N`.

**Statement.** `A_{N+1}^P<A_N^P` and `A_{N+1}^N>A_N^N`, where `A_N^P=Delta/G_N` and `A_N^N=Delta/(rho R_N)`.

**Dependencies.** `G` increase from order-statistic competition; `R` decline imported under DRHR.  
**Analytic proof.** PASS.  
**Python verification.** PASS.  
**Lean status.** PASS conditional on the two lower-stage inequalities.  
**Unsupported assumptions.** Lean does not prove DRHR implies rent decline.  
**Prior-art dependency.** Rent decline under DRHR is prior auction theory, not claimed as novel.  
**Counterexample search.** Non-DRHR continuous distributions can violate `R_{N+1}<R_N`.  
**Remaining nonformalized economics.** Distributional derivation of `G_N` and `R_N`.

## T2 — Strict wedge expansion

**Domain.** Same positivity/domain conditions as T1 plus nonempty current wedge `A_N^P<A_N^N`.

**Statement.** For `W_N=(A_N^P,A_N^N)`, `W_N` is a strict subset of `W_{N+1}`. For every `A in W_N`, the full Nash equilibrium is unique duplication `(U,U)` while the coordinated benchmark strictly prefers differentiation.

**Dependencies.** Fixed-N ordering `G_N>rho R_N`; T0; T1.  
**Analytic proof.** PASS.  
**Python verification.** PASS.  
**Lean status.** Endpoint movement plus interval-membership implication and properness are proved; equilibrium implications are proved separately and traceably.  
**Unsupported assumptions.** None beyond T1 imported lower-stage inequalities.  
**Counterexample search.** Weak endpoint movement would not imply strict nesting; strict inequalities are preserved.  
**Remaining nonformalized economics.** Lower-stage auction origins of endpoints.

## T3 — Eventual competition-induced equilibrium reversal

**Domain.** Baseline compact-support iid procurement environment; `N>=2`; `Delta>0`, `A>0`, `0<rho<=1`; guaranteed trade; `A(v-c_0)>Delta`; DRHR for rent convergence/monotonicity.

**Statement.** There exists a finite `N_0` such that for all `N>=N_0`, the coordinated optimum set is exactly `{(U,D),(D,U)}` while the full Nash equilibrium set is exactly `{(U,U)}`.

**Dependencies.** `G_N->v-c_0`; `R_N->0`; T0; exact planner characterization.  
**Analytic proof.** PASS.  
**Python verification.** PASS on representative families and bridge logic.  
**Lean status.** Upper-stage eventual bridge and exact equilibrium conclusions are proved from explicit eventual hypotheses.  
**Unsupported assumptions.** Lean does not prove the order-statistic limits from distributional primitives.  
**Counterexample search.** If `A(v-c_0)<=Delta`, eventual planner differentiation need not occur.  
**Remaining nonformalized economics.** Probability convergence and DRHR-to-rent-limit bridge.

## T4 — Reserve-case eventual reversal

**Domain.** Trade may fail; reserve value `v` satisfies `v>c_0`; iid continuous distribution with positive mass arbitrarily near `c_0`; same upper-stage positivity/incidence restrictions.

**Statement.** Stepwise rent monotonicity is not claimed. However `G_N^R->v-c_0` and `R_N^R->0`; if `A(v-c_0)>Delta`, the same eventual coordinated-differentiation / decentralized-duplication reversal follows.

**Dependencies.** Order-statistic convergence and dominated convergence.  
**Analytic proof.** PASS.  
**Python verification.** PASS; Uniform `[0,1]`, `v=0.1` explicitly confirms that reserve rent can initially rise.  
**Lean status.** The upper-stage eventual bridge is covered by the same formal theorem once eventual inequalities are supplied; reserve probability theory is not formalized.  
**Unsupported assumptions.** No monotone reserve-rent path is assumed.  
**Counterexample search.** Stepwise monotonicity falsified and therefore excluded from theorem language.  
**Remaining nonformalized economics.** Reserve-order-statistic convergence.

## Certificate conclusion

All five certificates pass within their stated domains. Formal and analytic provenance are intentionally separated: Lean certifies the policy-game logic, while lower-stage auction/probability facts remain explicit inputs.