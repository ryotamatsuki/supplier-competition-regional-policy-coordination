# Formal Statement Traceability

This document maps manuscript claims to the targeted Lean proof core. Formalization is intentionally limited to the policy-game algebra and logical bridges.

| Manuscript object | Lean object | Formal status | Nonformal input retained |
|---|---|---|---|
| Binary actions / payoff matrix | `Action`, `Profile`, payoff definitions in `Basic` | encoded | economic interpretation of `U/D` |
| Pure Nash predicate | `IsPureNash` | encoded | none |
| Low-regime full uniqueness | `low_mixedNash_iff_UU`, `pureNash_iff_UU_of_low` | proved | `B_N>0`, low-rent inequality |
| High-regime differentiated pure NE | `pureNash_UD_of_high`, `pureNash_DU_of_high` | proved | high-rent inequality |
| Boundary payoff identity | `boundary_gap_identity` | proved | threshold equality |
| Full boundary mixed correspondence | `boundary_mixedNash_iff` | proved | probabilities in `[0,1]` |
| Mixed equilibrium probability | `mixedProbability`, `mixed_probability_indifference`, `mixed_probability_in_unit` | indifference and interiority proved | high-rent inequality; full high-regime all-strategy uniqueness remains analytic |
| Planner switching condition | `planner_gain_iff`, `planner_condition_of_threshold` | proved | positive `G` for division |
| Exact differentiated coordinated optimum | `planner_optimum_iff_differentiated` | proved | `A G>Delta` |
| Fixed-N threshold ordering | `planner_threshold_lt_decentralized` | proved conditional on `rho R<G` | decomposition `G=B+R`, `B>0`, `rho<=1` supplies premise analytically |
| T1 planner threshold falls | `planner_threshold_falls` | proved | lower-stage `G_N<G_{N+1}` |
| T1 decentralized threshold rises | `decentralized_threshold_rises` | proved | lower-stage `R_{N+1}<R_N` under DRHR |
| T2 strict wedge expansion | `strict_wedge_expansion` | proved | strict endpoint inequalities and current wedge nonemptiness |
| T3 common eventual regime | `eventual_condition_bridge` | proved | eventual lower-stage inequalities |
| T3 exact planner/pure-Nash reversal | `eventual_reversal_exact` | proved | eventual inequalities and positivity |
| T3 full mixed uniqueness on decentralized side | `eventual_reversal_mixed` | proved | eventual low-rent inequality |
| Reserve convergence | not formalized | analytic PASS | order-statistic convergence + dominated convergence |
| DRHR rent theorem | not formalized | imported prior art | auction-theory theorem |

## Fidelity rule

The formal layer certifies implications from named lower-stage hypotheses. It does not claim that Lean proved the auction/probability source of those hypotheses. This prevents a conditional upper-stage proof from being presented as a formal proof of the entire economic model.

No theorem assumes its policy-game conclusion. Strict/equality cases are not collapsed. No planner conclusion is encoded as a premise. Division positivity is explicit.