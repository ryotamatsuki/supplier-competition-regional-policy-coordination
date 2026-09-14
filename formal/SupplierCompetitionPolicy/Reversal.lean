import SupplierCompetitionPolicy.Nash
import SupplierCompetitionPolicy.Planner

namespace SupplierCompetitionPolicy

open Action

theorem eventual_condition_bridge
    {Delta A rho : ℝ} {G R : ℕ → ℝ}
    (hPlanner : ∃ NP, ∀ N ≥ NP, Delta < A * G N)
    (hNash : ∃ NN, ∀ N ≥ NN, A * rho * R N < Delta) :
    ∃ Nbar, ∀ N ≥ Nbar,
      Delta < A * G N ∧ A * rho * R N < Delta := by
  rcases hPlanner with ⟨NP, hP⟩
  rcases hNash with ⟨NN, hN⟩
  refine ⟨max NP NN, ?_⟩
  intro N hNbar
  constructor
  · exact hP N (le_trans (le_max_left NP NN) hNbar)
  · exact hN N (le_trans (le_max_right NP NN) hNbar)

theorem eventual_reversal_exact
    {Delta A rho : ℝ} {B G R : ℕ → ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A)
    (hB : ∀ N, 0 < B N) (hG : ∀ N, 0 < G N)
    (hPlanner : ∃ NP, ∀ N ≥ NP, Delta < A * G N)
    (hNash : ∃ NN, ∀ N ≥ NN, A * rho * R N < Delta) :
    ∃ Nbar, ∀ N ≥ Nbar,
      (∀ p : Profile,
        IsPlannerOptimum Delta A (G N) p ↔ p = (U, D) ∨ p = (D, U)) ∧
      (∀ p : Profile,
        IsPureNash Delta A rho (B N) (R N) p ↔ p = (U, U)) := by
  rcases eventual_condition_bridge hPlanner hNash with ⟨Nbar, hbar⟩
  refine ⟨Nbar, ?_⟩
  intro N hN
  have hc := hbar N hN
  constructor
  · intro p
    exact planner_optimum_iff_differentiated hDelta hA (hG N) hc.1 p
  · intro p
    exact pureNash_iff_UU_of_low hDelta hA (hB N) hc.2 p

theorem eventual_reversal_mixed
    {Delta A rho : ℝ} {B R : ℕ → ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A)
    (hB : ∀ N, 0 < B N)
    (hNash : ∃ NN, ∀ N ≥ NN, A * rho * R N < Delta) :
    ∃ NN, ∀ N ≥ NN, ∀ p1 p2 : ℝ,
      0 ≤ p1 → p1 ≤ 1 → 0 ≤ p2 → p2 ≤ 1 →
      (IsMixedNash Delta A rho (B N) (R N) p1 p2 ↔ p1 = 1 ∧ p2 = 1) := by
  rcases hNash with ⟨NN, hN⟩
  refine ⟨NN, ?_⟩
  intro N hNN p1 p2 hp10 hp11 hp20 hp21
  exact low_mixedNash_iff_UU hDelta hA (hB N) (hN N hNN)
    hp10 hp11 hp20 hp21

end SupplierCompetitionPolicy
