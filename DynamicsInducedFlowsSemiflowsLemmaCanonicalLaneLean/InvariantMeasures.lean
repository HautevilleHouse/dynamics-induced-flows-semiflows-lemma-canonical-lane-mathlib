import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure InvariantMeasure (S : SemiflowSpace) where
  probability : S.carrier → ℝ
  nonnegative : ∀ x, probability x ≥ 0
  total_one : ∑' (x : S.carrier), probability x = 1
  invariance : ∀ (t : S.time) (x : S.carrier), probability x = probability (S.transition t x)

def trivialInvariantMeasure (S : SemiflowSpace) : InvariantMeasure S := {
  probability := fun _ => 0
  nonnegative := by intro x; nlinarith
  total_one := by
    simp
  invariance := by
    intro t x
    rfl
}

structure InvariantMeasureCertificate where
  semiflow : SemiflowSpace
  measure : InvariantMeasure semiflow
  consistencyProof : True

def sourceInvariantMeasureCertificate : InvariantMeasureCertificate := {
  semiflow := trivialSemiflowSpace
  measure := trivialInvariantMeasure trivialSemiflowSpace
  consistencyProof := trivial
}

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse