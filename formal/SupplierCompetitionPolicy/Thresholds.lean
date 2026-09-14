import SupplierCompetitionPolicy.Basic

namespace SupplierCompetitionPolicy

theorem planner_threshold_lt_decentralized
    {Delta rho R G : ℝ}
    (hDelta : 0 < Delta) (hrho : 0 < rho) (hR : 0 < R)
    (hGap : rho * R < G) :
    plannerThreshold Delta G < decentralizedThreshold Delta rho R := by
  have hLocal : 0 < rho * R := mul_pos hrho hR
  have hG : 0 < G := lt_trans hLocal hGap
  unfold plannerThreshold decentralizedThreshold
  apply (div_lt_div_iff₀ hG hLocal).2
  exact mul_lt_mul_of_pos_left hGap hDelta

theorem planner_threshold_falls
    {Delta Gnow Gnext : ℝ}
    (hDelta : 0 < Delta) (hGnow : 0 < Gnow) (hRise : Gnow < Gnext) :
    plannerThreshold Delta Gnext < plannerThreshold Delta Gnow := by
  have hGnext : 0 < Gnext := lt_trans hGnow hRise
  unfold plannerThreshold
  apply (div_lt_div_iff₀ hGnext hGnow).2
  exact mul_lt_mul_of_pos_left hRise hDelta

theorem decentralized_threshold_rises
    {Delta rho Rnow Rnext : ℝ}
    (hDelta : 0 < Delta) (hrho : 0 < rho)
    (hRnext : 0 < Rnext) (hFall : Rnext < Rnow) :
    decentralizedThreshold Delta rho Rnow <
      decentralizedThreshold Delta rho Rnext := by
  have hRnow : 0 < Rnow := lt_trans hRnext hFall
  have hNow : 0 < rho * Rnow := mul_pos hrho hRnow
  have hNext : 0 < rho * Rnext := mul_pos hrho hRnext
  have hDen : rho * Rnext < rho * Rnow := mul_lt_mul_of_pos_left hFall hrho
  unfold decentralizedThreshold
  apply (div_lt_div_iff₀ hNow hNext).2
  exact mul_lt_mul_of_pos_left hDen hDelta

end SupplierCompetitionPolicy
