import SupplierCompetitionPolicy.Basic

namespace SupplierCompetitionPolicy

open Action

theorem pureNash_UU_of_low
    {Delta A rho B R : ℝ}
    (hLow : A * rho * R < Delta) :
    IsPureNash Delta A rho B R (U, U) := by
  constructor
  · intro a
    cases a with
    | U => simp [payoff]
    | D =>
        simp [payoff]
        linarith
  · intro a
    cases a with
    | U => simp [payoff]
    | D =>
        simp [payoff]
        linarith

theorem pureNash_iff_UU_of_low
    {Delta A rho B R : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hLow : A * rho * R < Delta) (p : Profile) :
    IsPureNash Delta A rho B R p ↔ p = (U, U) := by
  constructor
  · intro h
    rcases p with ⟨a, b⟩
    cases a <;> cases b
    · rfl
    · exfalso
      have h2 := h.2 U
      simp [payoff] at h2
      linarith
    · exfalso
      have h1 := h.1 U
      simp [payoff] at h1
      linarith
    · exfalso
      have h1 := h.1 U
      simp [payoff] at h1
      nlinarith [mul_pos hA hB]
  · intro hp
    subst p
    exact pureNash_UU_of_low hLow

theorem pureNash_UD_of_high
    {Delta A rho B R : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hHigh : Delta < A * rho * R) :
    IsPureNash Delta A rho B R (U, D) := by
  constructor
  · intro a
    cases a with
    | U => simp [payoff]
    | D =>
        simp [payoff]
        nlinarith [mul_pos hA hB]
  · intro a
    cases a with
    | U =>
        simp [payoff]
        linarith
    | D => simp [payoff]

theorem pureNash_DU_of_high
    {Delta A rho B R : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hHigh : Delta < A * rho * R) :
    IsPureNash Delta A rho B R (D, U) := by
  constructor
  · intro a
    cases a with
    | U =>
        simp [payoff]
        linarith
    | D => simp [payoff]
  · intro a
    cases a with
    | U => simp [payoff]
    | D =>
        simp [payoff]
        nlinarith [mul_pos hA hB]

theorem boundary_gap_identity
    {Delta A rho B R p : ℝ}
    (hEq : A * rho * R = Delta) :
    mixedU Delta A B p - mixedD A rho R p =
      (1 - p) * (Delta + A * B) := by
  rw [← hEq]
  simp [mixedU, mixedD]
  ring

theorem boundary_U_strict_if_opponent_not_pure_U
    {Delta A rho B R p : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hEq : A * rho * R = Delta) (hp : p < 1) :
    mixedD A rho R p < mixedU Delta A B p := by
  have h1 : 0 < 1 - p := by linarith
  have h2 : 0 < Delta + A * B := by nlinarith [mul_pos hA hB]
  have hprod : 0 < (1 - p) * (Delta + A * B) := mul_pos h1 h2
  have hid := boundary_gap_identity (B := B) (p := p) hEq
  nlinarith

theorem boundary_U_weak_if_probability
    {Delta A rho B R p : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hEq : A * rho * R = Delta) (hp : p ≤ 1) :
    mixedD A rho R p ≤ mixedU Delta A B p := by
  have h1 : 0 ≤ 1 - p := by linarith
  have h2 : 0 < Delta + A * B := by nlinarith [mul_pos hA hB]
  have hprod : 0 ≤ (1 - p) * (Delta + A * B) :=
    mul_nonneg h1 (le_of_lt h2)
  have hid := boundary_gap_identity (B := B) (p := p) hEq
  nlinarith

theorem boundary_mixedBR_iff
    {Delta A rho B R p q : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hEq : A * rho * R = Delta)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) (hp0 : 0 ≤ p) (hp1 : p ≤ 1) :
    IsMixedBestResponse (mixedU Delta A B p) (mixedD A rho R p) q ↔
      q = 1 ∨ p = 1 := by
  constructor
  · intro hbr
    by_cases hq : q = 1
    · exact Or.inl hq
    · right
      by_contra hp
      have hplt : p < 1 := lt_of_le_of_ne hp1 hp
      have hqlt : q < 1 := lt_of_le_of_ne hq1 hq
      have hstrict :=
        boundary_U_strict_if_opponent_not_pure_U
          hDelta hA hB hEq hplt
      have hwrong := hbr.2.2.2 hqlt
      linarith
  · intro hor
    rcases hor with hq | hp
    · subst q
      refine ⟨by norm_num, by norm_num, ?_, ?_⟩
      · intro _
        exact boundary_U_weak_if_probability hDelta hA hB hEq hp1
      · intro h
        norm_num at h
    · subst p
      have heqpay :
          mixedU Delta A B 1 = mixedD A rho R 1 := by
        simp [mixedU, mixedD]
        linarith
      refine ⟨hq0, hq1, ?_, ?_⟩
      · intro _
        linarith
      · intro _
        linarith

theorem boundary_mixedNash_iff
    {Delta A rho B R p1 p2 : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hEq : A * rho * R = Delta)
    (hp10 : 0 ≤ p1) (hp11 : p1 ≤ 1) (hp20 : 0 ≤ p2) (hp21 : p2 ≤ 1) :
    IsMixedNash Delta A rho B R p1 p2 ↔ p1 = 1 ∨ p2 = 1 := by
  constructor
  · intro h
    exact (boundary_mixedBR_iff hDelta hA hB hEq hp10 hp11 hp20 hp21).1 h.1
  · intro h
    constructor
    · exact (boundary_mixedBR_iff hDelta hA hB hEq hp10 hp11 hp20 hp21).2 h
    · apply (boundary_mixedBR_iff hDelta hA hB hEq hp20 hp21 hp10 hp11).2
      exact h.elim Or.inr Or.inl

theorem mixed_probability_indifference
    {Delta A rho B R : ℝ}
    (hA : A ≠ 0) (hSum : B + rho * R ≠ 0) :
    mixedU Delta A B (mixedProbability Delta A rho B R) =
      mixedD A rho R (mixedProbability Delta A rho B R) := by
  unfold mixedProbability mixedU mixedD
  field_simp [hA, hSum]
  ring

theorem mixed_probability_in_unit
    {Delta A rho B R : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hrho : 0 < rho)
    (hB : 0 < B) (hR : 0 < R) (hHigh : Delta < A * rho * R) :
    0 < mixedProbability Delta A rho B R ∧
      mixedProbability Delta A rho B R < 1 := by
  have hrR : 0 < rho * R := mul_pos hrho hR
  have hSum : 0 < B + rho * R := by linarith
  have hDen : 0 < A * (B + rho * R) := mul_pos hA hSum
  have hNum : 0 < Delta + A * B := by nlinarith [mul_pos hA hB]
  constructor
  · exact div_pos hNum hDen
  · unfold mixedProbability
    apply (div_lt_iff₀ hDen).2
    nlinarith [mul_pos hA hB, mul_pos hA hrR]

theorem low_gap_identity
    {Delta A rho B R p : ℝ} :
    mixedU Delta A B p - mixedD A rho R p =
      p * (Delta - A * rho * R) +
      (1 - p) * (Delta + A * B) := by
  simp [mixedU, mixedD]
  ring

theorem low_U_strict_for_any_opponent
    {Delta A rho B R p : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hLow : A * rho * R < Delta) (hp0 : 0 ≤ p) (hp1 : p ≤ 1) :
    mixedD A rho R p < mixedU Delta A B p := by
  by_cases hp : p = 0
  · subst p
    simp [mixedU, mixedD]
    nlinarith [mul_pos hA hB]
  · have hppos : 0 < p := lt_of_le_of_ne hp0 (Ne.symm hp)
    have hfirst : 0 < p * (Delta - A * rho * R) :=
      mul_pos hppos (by linarith)
    have hsecond : 0 ≤ (1 - p) * (Delta + A * B) := by
      apply mul_nonneg
      · linarith
      · nlinarith [mul_pos hA hB]
    have hid := low_gap_identity (Delta := Delta) (A := A) (rho := rho)
      (B := B) (R := R) (p := p)
    nlinarith

theorem low_mixedBR_iff_pureU
    {Delta A rho B R p q : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hLow : A * rho * R < Delta)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) (hp0 : 0 ≤ p) (hp1 : p ≤ 1) :
    IsMixedBestResponse (mixedU Delta A B p) (mixedD A rho R p) q ↔ q = 1 := by
  have hstrict := low_U_strict_for_any_opponent hDelta hA hB hLow hp0 hp1
  constructor
  · intro hbr
    by_contra hq
    have hqlt : q < 1 := lt_of_le_of_ne hq1 hq
    have hwrong := hbr.2.2.2 hqlt
    linarith
  · intro hq
    subst q
    refine ⟨by norm_num, by norm_num, ?_, ?_⟩
    · intro _
      linarith
    · intro h
      norm_num at h

theorem low_mixedNash_iff_UU
    {Delta A rho B R p1 p2 : ℝ}
    (hDelta : 0 < Delta) (hA : 0 < A) (hB : 0 < B)
    (hLow : A * rho * R < Delta)
    (hp10 : 0 ≤ p1) (hp11 : p1 ≤ 1) (hp20 : 0 ≤ p2) (hp21 : p2 ≤ 1) :
    IsMixedNash Delta A rho B R p1 p2 ↔ p1 = 1 ∧ p2 = 1 := by
  constructor
  · intro h
    constructor
    · exact (low_mixedBR_iff_pureU hDelta hA hB hLow hp10 hp11 hp20 hp21).1 h.1
    · exact (low_mixedBR_iff_pureU hDelta hA hB hLow hp20 hp21 hp10 hp11).1 h.2
  · rintro ⟨h1, h2⟩
    constructor
    · exact (low_mixedBR_iff_pureU hDelta hA hB hLow hp10 hp11 hp20 hp21).2 h1
    · exact (low_mixedBR_iff_pureU hDelta hA hB hLow hp20 hp21 hp10 hp11).2 h2

end SupplierCompetitionPolicy
