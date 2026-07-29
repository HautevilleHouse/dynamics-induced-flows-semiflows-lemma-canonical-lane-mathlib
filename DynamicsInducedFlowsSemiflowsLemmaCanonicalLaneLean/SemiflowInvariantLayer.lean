import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.DynamicsObjects

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure SemiflowInvariantCertificate where
  pair : FlowSemiflowPair
  invariantSet : Set StateSpace
  forwardInvariant : Prop
  backwardInvariant : Prop
  semiflowInvariant : Prop
  forwardInvariantProof : forwardInvariant
  backwardInvariantProof : backwardInvariant
  semiflowInvariantProof : semiflowInvariant

def sourceSemiflowInvariantCertificate : SemiflowInvariantCertificate := {
  pair := primitivePair
  invariantSet := Set.univ
  forwardInvariant := InducedFlow primitivePair
  backwardInvariant := True
  semiflowInvariant := InducedSemiflow primitivePair
  forwardInvariantProof := primitive_pair_induced_flow_checked
  backwardInvariantProof := trivial
  semiflowInvariantProof := primitive_pair_induced_semiflow_checked
}

def SemiflowInvariantClosed (C : SemiflowInvariantCertificate) : Prop :=
  C.forwardInvariant ∧ C.backwardInvariant ∧ C.semiflowInvariant

theorem source_semiflow_invariant_closed :
    SemiflowInvariantClosed sourceSemiflowInvariantCertificate := by
  exact And.intro sourceSemiflowInvariantCertificate.forwardInvariantProof
    (And.intro sourceSemiflowInvariantCertificate.backwardInvariantProof
      sourceSemiflowInvariantCertificate.semiflowInvariantProof)

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
