import SupplierCompetitionPolicy.Thresholds

namespace SupplierCompetitionPolicy

theorem wedge_membership_inclusion
    {Lnow Unow Lnext Unext x : ℝ}
    (hL : Lnext < Lnow) (hU : Unow < Unext)
    (hx : InOpenInterval Lnow Unow x) :
    InOpenInterval Lnext Unext x := by
  exact ⟨lt_trans hL hx.1, lt_trans hx.2 hU⟩

theorem wedge_strict_witness
    {Lnow Unow Lnext Unext : ℝ}
    (hL : Lnext < Lnow) (hWidth : Lnow < Unow) (hU : Unow < Unext) :
    ∃ x, InOpenInterval Lnext Unext x ∧ ¬ InOpenInterval Lnow Unow x := by
  refine ⟨(Lnext + Lnow) / 2, ?_, ?_⟩
  · constructor <;> nlinarith
  · intro hx
    nlinarith [hx.1]

theorem strict_wedge_expansion
    {Lnow Unow Lnext Unext : ℝ}
    (hL : Lnext < Lnow) (hWidth : Lnow < Unow) (hU : Unow < Unext) :
    (∀ x, InOpenInterval Lnow Unow x → InOpenInterval Lnext Unext x) ∧
    (∃ x, InOpenInterval Lnext Unext x ∧ ¬ InOpenInterval Lnow Unow x) := by
  constructor
  · intro x hx
    exact wedge_membership_inclusion hL hU hx
  · exact wedge_strict_witness hL hWidth hU

end SupplierCompetitionPolicy
