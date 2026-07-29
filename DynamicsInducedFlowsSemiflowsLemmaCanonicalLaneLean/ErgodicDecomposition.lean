import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure ErgodicComponent (S : SemiflowSpace) where
  support : S.carrier → Prop
  measure : InvariantMeasure S
  ergodicity : ∀ (A : S.carrier → Prop), (∀ t, A = (S.transition t) '' A) → measure.probability A = 0 ∨ measure.probability A = 1

structure ErgodicDecomposition (S : SemiflowSpace) where
  components : List (ErgodicComponent S)
  decompositionProperty : ∑ (c : components), c.measure.total_one = 1

def trivialErgodicComponent : ErgodicComponent trivialSemiflowSpace := {
  support := fun _ => True
  measure := trivialInvariantMeasure trivialSemiflowSpace
  ergodicity := by
    intro A h
    left
    exact trivialInvariantMeasure trivialSemiflowSpace |>.nonnegative (A := ?_) undefined
}

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse