import SupplierCompetitionPolicy.Basic

namespace SupplierCompetitionPolicy

open Action

theorem planner_gain_iff
    {Delta A G : ℝ} :
    plannerValue Delta A G (U, D) > plannerValue Delta A G (U, U) ↔
      A * G > Delta := by
  change Delta + A * G > 2 * Delta ↔ A * G > Delta
  constructor <;> intro h <;> linarith

theorem planner_condition_of_threshold
    {Delta A G : ℝ}
    (hG : 0 < G) (hA : plannerThreshold Delta G < A) :
    Delta < A * G := by
  unfold plannerThreshold at hA
  exact (div_lt_iff₀ hG).1 hA

theorem planner_UD_optimal_of_high
    {Delta A G : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hG : 0 < G)
    (hHigh : Delta < A * G) :
    IsPlannerOptimum Delta A G (U, D) := by
  intro q
  rcases q with ⟨a, b⟩
  cases a <;> cases b <;> simp [plannerValue] <;>
    nlinarith [mul_pos hA hG]

theorem planner_DU_optimal_of_high
    {Delta A G : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hG : 0 < G)
    (hHigh : Delta < A * G) :
    IsPlannerOptimum Delta A G (D, U) := by
  intro q
  rcases q with ⟨a, b⟩
  cases a <;> cases b <;> simp [plannerValue] <;>
    nlinarith [mul_pos hA hG]

theorem planner_optimum_iff_differentiated
    {Delta A G : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hG : 0 < G)
    (hHigh : Delta < A * G) (p : Profile) :
    IsPlannerOptimum Delta A G p ↔ p = (U, D) ∨ p = (D, U) := by
  constructor
  · intro h
    rcases p with ⟨a, b⟩
    cases a <;> cases b
    · exfalso
      have hh := h (U, D)
      simp [plannerValue] at hh
      linarith
    · exact Or.inl rfl
    · exact Or.inr rfl
    · exfalso
      have hh := h (U, D)
      simp [plannerValue] at hh
      nlinarith [mul_pos hA hG]
  · intro h
    rcases h with h | h
    · subst p
      exact planner_UD_optimal_of_high hDelta hA hG hHigh
    · subst p
      exact planner_DU_optimal_of_high hDelta hA hG hHigh

end SupplierCompetitionPolicy
