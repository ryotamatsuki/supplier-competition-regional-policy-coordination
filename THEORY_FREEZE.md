# Paper 2 — Canonical Theory Freeze

**Freeze ID:** `P2-IO-THEORY-FREEZE-2026-09-15-v1`

## Frozen primitives

Two regional governments choose `U` or `D`. `U` yields direct local premium `Delta>0`; `D` is the complementary supplier-side activity. A differentiated profile activates a procurement continuation with `N>=2` exogenous suppliers whose iid private costs are drawn from a continuous distribution `F` with positive density on compact support `[c_0,c_bar]`. Suppliers are risk neutral, the canonical mechanism is efficient second-price reverse procurement, and the baseline assumes guaranteed trade `v>c_bar` and DRHR.

Define `m_N=E[C_{1:N}]`, `s_N=E[C_{2:N}]`, `R_N=s_N-m_N`, `B_N=v-s_N`, and `G_N=v-m_N=B_N+R_N`. The D-region government internalizes `rho in (0,1]` of supplier rent and, in the baseline, no buyer-side surplus (`sigma=0`). The coordinated benchmark values full real surplus.

The decentralized threshold is `A_N^N=Delta/(rho R_N)` and the coordinated threshold is `A_N^P=Delta/G_N`.

Under the frozen assumptions, `G_{N+1}>G_N`; under DRHR, the established auction result gives `R_{N+1}<R_N` and `R_N->0`. Hence `A_{N+1}^P<A_N^P` while `A_{N+1}^N>A_N^N`. The inefficient-duplication interval `W_N=(A_N^P,A_N^N)` strictly expands. If `A(v-c_0)>Delta`, sufficiently large `N` yields coordinated differentiation `{(U,D),(D,U)}` and unique decentralized duplication `(U,U)`.

## Novelty boundary

The paper does **not** claim as new: bidder-rent dissipation, DRHR monotonicity of `R_N`, divergence between private/social bidder-count incentives, local-government concern for local supplier profits, the fixed-`N` incomplete-capture switch, or Paper 1's binary threshold wedge. At fixed `N`, set `G^{P1}=A G_N` and `lambda_N=rho R_N/G_N`; the fixed-market switching logic maps into Paper 1. Paper 2's novelty begins with the comparative static in `N` and the resulting change in the exact policy-equilibrium set.

## Frozen theory rule

Stage 8 may repair statements, proofs, interpretation, disclosures, references, figures, and exposition, but may not add endogenous entry, supplier investment, bargaining, vertical integration, multiple buyers, taxes/transfers, heterogeneous regions, continuous policy portfolios, endogenous `A`, endogenous `rho`, common values, asymmetric supplier distributions, collusion, or risk aversion.