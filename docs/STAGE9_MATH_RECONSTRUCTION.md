# Stage 9 — Independent Mathematical Reconstruction

Theory freeze: `P2-IO-THEORY-FREEZE-2026-09-15-v1`

## Verdict
`PASS — NO THEORY DEFECT FOUND`

The Stage 8 manuscript was reconstructed from primitives rather than relying on its stated propositions.

## 1. Government game
For a differentiated profile, the lead/buyer-side region receives `Delta + A B_N` and the supplier-side region receives `A rho R_N`. Hence the 2x2 payoff matrix in the canonical manuscript follows from the procurement continuation.

Against D, U is a strict best response because `Delta + A B_N > 0`. Against U, the payoff comparison is `Delta` versus `A rho R_N`, giving the exact threshold

`A_N^N = Delta/(rho R_N)`.

## 2. Boundary correspondence
At `A rho R_N = Delta`, if the opponent chooses U with probability p,

`u(U;p)-u(D;p) = (1-p)(Delta + A B_N)`.

Therefore U is uniquely optimal for every `p<1`, and both actions are best responses only at `p=1`. Mutual best response gives the full boundary Nash set

`{(p1,p2) in [0,1]^2 : p1=1 or p2=1}`.

The Stage 8 repair is exact.

## 3. High-regime mixed equilibrium
For `A rho R_N > Delta`, indifference yields

`p_N^* = (Delta + A B_N) / [A(B_N + rho R_N)]`.

Because

`1-p_N^* = (A rho R_N-Delta)/[A(B_N+rho R_N)] > 0`,

this is the unique completely mixed equilibrium. The two differentiated pure equilibria also exist; no semi-mixed equilibrium survives because best responses to pure actions are strict in this regime.

## 4. Coordinated benchmark
Procurement payment is an internal transfer. Real aggregate values are

- `V(U,U)=2 Delta`,
- `V(U,D)=V(D,U)=Delta + A G_N`,
- `V(D,D)=0`.

Thus `A_N^P=Delta/G_N`. Since `G_N=B_N+R_N > rho R_N`, the fixed-N ordering `A_N^P<A_N^N` is correct.

## 5. T1 and T2
Adding an iid supplier strictly lowers the expected minimum cost for a nondegenerate continuous distribution, so `G_{N+1}>G_N`. Under the maintained DRHR prior-art result, `R_{N+1}<R_N`. Hence

`A_{N+1}^P<A_N^P` and `A_{N+1}^N>A_N^N`.

Both endpoints of `W_N=(A_N^P,A_N^N)` move strictly outward, proving `W_N subsetneq W_{N+1}`.

## 6. T3
Compact support with positive density gives `C_{1:N}->c0` almost surely; therefore `G_N->v-c0`. The imported DRHR result gives `R_N->0`. If `A(v-c0)>Delta`, eventually `A G_N>Delta` while `A rho R_N<Delta`, yielding planner differentiation and unique decentralized `(U,U)`.

## 7. Reserve robustness
For `v>c0`, both first and second order statistics converge a.s. to `c0`. The reserve-truncated supplier rent satisfies

`0 <= r_N^R <= C_{2:N}-C_{1:N} <= cbar-c0`.

Dominated convergence gives `R_N^R->0`; bounded convergence gives `G_N^R->v-c0`. The manuscript correctly does not claim one-step rent monotonicity with a reserve.

## 8. Independent regression
`verification/stage9_verify.py` independently checks the boundary identity, high-regime mixed equilibrium, Uniform threshold movements, the manuscript’s `A=5` regime transition, general incidence algebra, and exact Uniform reserve-limit formulas.

No statement weakening, hidden assumption, or proof-by-numerics was introduced.