import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure Semiflow (X : Type) where
  stateSpace : X → Prop
  timeSet : Set ℝ
  flow : ℝ → X → X
  semigroup : ∀ (t s : ℝ), t ∈ timeSet → s ∈ timeSet → t + s ∈ timeSet
  flowProperty : ∀ (t s : ℝ) (x : X), t ∈ timeSet → s ∈ timeSet → flow (t + s) x = flow t (flow s x)
  continuity : ∀ (t : ℝ) (x : X), t ∈ timeSet → Continuous (λ (s : ℝ) => flow s x)

def autonomousCoupling (X : Type) (f : X → X) (F : X → X) : Prop :=
  ∀ (x : X), f x = F x

structure InducedSemiflow (X : Type) (f : X → X) where
  original : Semiflow X
  induced : Semiflow X
  coupling : autonomousCoupling X f (induced.flow 0)
  evolutionCoherence : ∀ (t : ℝ) (x : X), t ∈ original.timeSet → original.flow t x = induced.flow t x

lemma semiflow_bridge (X : Type) (f : X → X) (I : InducedSemiflow X f) :
    ∀ (t : ℝ) (x : X), t ∈ I.original.timeSet → I.original.flow t x = I.induced.flow t x :=
  I.evolutionCoherence

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse