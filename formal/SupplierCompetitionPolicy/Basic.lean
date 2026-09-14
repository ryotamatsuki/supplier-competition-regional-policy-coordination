import Mathlib

namespace SupplierCompetitionPolicy

inductive Action where
  | U
  | D
deriving DecidableEq, Repr

abbrev Profile := Action × Action

def payoff (Delta A rho B R : ℝ) (self other : Action) : ℝ :=
  match self, other with
  | .U, .U => Delta
  | .U, .D => Delta + A * B
  | .D, .U => A * rho * R
  | .D, .D => 0

def IsPureNash (Delta A rho B R : ℝ) (p : Profile) : Prop :=
  (∀ a, payoff Delta A rho B R p.1 p.2 ≥ payoff Delta A rho B R a p.2) ∧
  (∀ a, payoff Delta A rho B R p.2 p.1 ≥ payoff Delta A rho B R a p.1)

def plannerValue (Delta A G : ℝ) (p : Profile) : ℝ :=
  match p with
  | (.U, .U) => 2 * Delta
  | (.U, .D) => Delta + A * G
  | (.D, .U) => Delta + A * G
  | (.D, .D) => 0

def IsPlannerOptimum (Delta A G : ℝ) (p : Profile) : Prop :=
  ∀ q, plannerValue Delta A G p ≥ plannerValue Delta A G q

def plannerThreshold (Delta G : ℝ) : ℝ := Delta / G

def decentralizedThreshold (Delta rho R : ℝ) : ℝ := Delta / (rho * R)

def InOpenInterval (l u x : ℝ) : Prop := l < x ∧ x < u

def mixedU (Delta A B p : ℝ) : ℝ :=
  Delta + (1 - p) * A * B

def mixedD (A rho R p : ℝ) : ℝ :=
  p * A * rho * R

/-- `q` is the probability assigned to U. Positive-probability actions must be optimal. -/
def IsMixedBestResponse (uU uD q : ℝ) : Prop :=
  0 ≤ q ∧ q ≤ 1 ∧
  (0 < q → uD ≤ uU) ∧
  (q < 1 → uU ≤ uD)

def IsMixedNash (Delta A rho B R p1 p2 : ℝ) : Prop :=
  IsMixedBestResponse (mixedU Delta A B p2) (mixedD A rho R p2) p1 ∧
  IsMixedBestResponse (mixedU Delta A B p1) (mixedD A rho R p1) p2

def mixedProbability (Delta A rho B R : ℝ) : ℝ :=
  (Delta + A * B) / (A * (B + rho * R))

end SupplierCompetitionPolicy
