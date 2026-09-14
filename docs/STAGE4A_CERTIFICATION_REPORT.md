# Stage 4A — Independent Mathematical Adversarial Certification

Date: 2026-09-15  
Canonical theory object: `P2-IO-THEORY-FREEZE-2026-09-15-v1`

## Verdict

`STAGE 4A PASS`

## Clean-room reconstruction

For a government facing `D`, choosing `U` yields `Delta + A B_N` while choosing `D` yields zero. Under `Delta>0`, `A>0`, and `B_N>0`, `U` is therefore a strict best response to `D`.

Against `U`, the payoff difference `D-U` is `A rho R_N - Delta`. Hence the decentralized threshold is exactly

`A_N^N = Delta/(rho R_N)`.

For the coordinated fixed-instrument benchmark, `(U,U)` yields `2 Delta` and either differentiated profile yields `Delta + A G_N`. The exact switching condition is `A G_N > Delta`, equivalently `A>A_N^P=Delta/G_N` when `G_N>0`.

## Exact Nash correspondence

Let `L_N=A rho R_N`.

- If `L_N<Delta`, `U` is a strict best response to both opponent actions. The full mixed Nash set is the singleton `(p_1,p_2)=(1,1)`.
- If `L_N=Delta`, the mixed payoff gap is `u(U;p)-u(D;p)=(1-p)(Delta+A B_N)`. Thus `U` is strict for `p<1` and both actions are best replies at `p=1`. The full mixed Nash set is exactly `{(p_1,p_2) in [0,1]^2 : p_1=1 or p_2=1}`.
- If `L_N>Delta`, `(U,D)` and `(D,U)` are pure Nash equilibria. The unique fully mixed symmetric indifference probability is `p_N^*=(Delta+A B_N)/(A(B_N+rho R_N))`, and `0<p_N^*<1` follows from positivity and `A rho R_N>Delta`.

No equality case is collapsed into a strict regime.

## Planner / coordinated benchmark

If `A G_N<Delta`, `(U,U)` is uniquely optimal. If `A G_N=Delta`, `(U,U)`, `(U,D)`, and `(D,U)` tie and `(D,D)` is inferior. If `A G_N>Delta`, the exact coordinated optimum set is `{(U,D),(D,U)}`.

The manuscript terminology is therefore correctly restricted to a coordinated benchmark / coordinated optimum within the fixed instrument set; no unrestricted first-best claim is certified.

## Fixed-N threshold ordering

Since `G_N=B_N+R_N`, `B_N>0`, `R_N>0`, and `0<rho<=1`,

`G_N > rho R_N > 0`.

Therefore

`A_N^P=Delta/G_N < Delta/(rho R_N)=A_N^N`.

## Comparative statics and T1/T2

The audit keeps lower-stage auction results separate from upper-stage logic.

- `G_{N+1}>G_N` holds under the maintained iid nondegenerate order-statistic environment and does not require DRHR.
- `R_{N+1}<R_N` is not universal and is imported under DRHR from prior auction theory.

Given those lower-stage facts,

`A_{N+1}^P<A_N^P` and `A_{N+1}^N>A_N^N`.

Hence the open wedge `W_N=(A_N^P,A_N^N)` is strictly nested in `W_{N+1}`. Every `A in W_N` gives unique Nash duplication `(U,U)` while the coordinated benchmark strictly prefers differentiation.

## T3 asymptotic attack

Under compact support with positive density near `c_0`, `C_{1:N}->c_0`; therefore `G_N->v-c_0`. Under DRHR, `R_N->0`. If `A(v-c_0)>Delta`, there is a finite planner index after which `A G_N>Delta`, and a finite decentralized index after which `A rho R_N<Delta`. Taking the larger index yields exact eventual reversal.

The formal Lean bridge intentionally imports those eventual inequalities rather than pretending to formalize the probability convergence.

## Boundary stress tests

- `N=2`: all finite-N algebra remains valid.
- `rho=1`: all statements remain valid.
- `rho->0+`: `A_N^N` diverges; the model requires `rho>0` and makes no theorem at `rho=0`.
- `A=A_N^P` and `A=A_N^N`: equality cases are explicitly separated.
- guaranteed trade `v>bar c` implies `B_N>0`.

## Reserve / trade-failure audit

With reserve/trade failure,

`G_N^R = E[(v-C_{1:N})_+]`

still rises with `N`, but

`R_N^R = integral_{c0}^v N F(c)(1-F(c))^(N-1) dc`

need not decline stepwise. Uniform `[0,1]` with `v=0.1` gives an increasing sequence for small `N`, so no stepwise reserve-rent monotonicity is certified.

Nevertheless, when `v>c_0` and the lower endpoint is approached by order statistics, `C_{1:N},C_{2:N}->c_0` and dominated convergence gives `R_N^R->0`; therefore the reserve-case reversal result is eventual only.

## Final Stage 4A conclusion

No falsification of T0–T4 survives under their stated assumptions. No theorem requires a hidden stronger assumption than the recorded distributional, incidence, positivity, or asymptotic conditions.

`STAGE 4A PASS`