import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

abbrev Time := ℝ
abbrev StateSpace := Fin 3 → ℝ
abbrev Flow := Time → StateSpace → StateSpace
abbrev Semiflow := Time → StateSpace → StateSpace

def zeroFlow : Flow := fun _ _ => fun i => 0
def zeroSemiflow : Semiflow := fun _ _ => fun i => 0

structure DynamicsOperators where
  timeDerivative : (Time → StateSpace) → (Time → StateSpace)
  generator : (StateSpace → StateSpace) → (StateSpace → StateSpace)
  semiflowGenerator : (StateSpace → StateSpace) → (StateSpace → StateSpace)
  flowOperator : Flow
  semiflowOperator : Semiflow
  flowSemiflowConsistency : ∀ x : StateSpace, flowOperator 0 x = semiflowOperator 0 x

def primitiveDynamicsOperators : DynamicsOperators := {
  timeDerivative := fun _ => fun _ => fun i => 0
  generator := fun f x => f x
  semiflowGenerator := fun f x => f x
  flowOperator := zeroFlow
  semiflowOperator := zeroSemiflow
  flowSemiflowConsistency := by intro x; ext i; rfl
}

structure FlowSemiflowPair where
  flow : Flow
  semiflow : Semiflow
  operators : DynamicsOperators
  consistency : ∀ x, flow 0 x = semiflow 0 x

def primitivePair : FlowSemiflowPair := {
  flow := zeroFlow
  semiflow := zeroSemiflow
  operators := primitiveDynamicsOperators
  consistency := primitiveDynamicsOperators.flowSemiflowConsistency
}

def InducedFlow (p : FlowSemiflowPair) : Prop :=
  ∀ (x : StateSpace) (t s : Time), p.flow t (p.flow s x) = p.flow (t + s) x

def InducedSemiflow (p : FlowSemiflowPair) : Prop :=
  ∀ (x : StateSpace) (t s : Time), 0 ≤ t → 0 ≤ s → p.semiflow t (p.semiflow s x) = p.semiflow (t + s) x

def FlowSemiflowLemma (p : FlowSemiflowPair) : Prop :=
  InducedFlow p ∧ InducedSemiflow p

theorem primitive_pair_induced_flow_checked :
    InducedFlow primitivePair := by
  intro x t s; ext i; rfl

theorem primitive_pair_induced_semiflow_checked :
    InducedSemiflow primitivePair := by
  intro x t s ht hs; ext i; rfl

theorem primitive_pair_flow_semiflow_lemma_checked :
    FlowSemiflowLemma primitivePair := by
  exact And.intro primitive_pair_induced_flow_checked primitive_pair_induced_semiflow_checked

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
