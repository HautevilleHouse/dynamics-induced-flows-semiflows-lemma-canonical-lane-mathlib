import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.FlowSemiflowBridgeLayer

/-!
# Semiflow Endomorphism Layer

This module records the endomorphism properties of semiflows, including composition closure and generator consistency.
-/

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure SemiflowEndomorphismCertificate where
  bridge : FlowSemiflowBridgeCertificate
  generatorClosed : Prop
  compositionClosed : Prop
  generatorClosedProof : generatorClosed
  compositionClosedProof : compositionClosed

def sourceSemiflowEndomorphismCertificate : SemiflowEndomorphismCertificate := {
  bridge := sourceFlowSemiflowBridgeCertificate
  generatorClosed := SemiflowProperty sourceFlowSemiflowBridgeCertificate.flow
  compositionClosed := ∀ (f g : Semiflow) (t : Time) (x : State), sourceFlowSemiflowBridgeCertificate.flow.operators.composition f g t x = f t (g t x)
  generatorClosedProof := primitive_semiflow_property_checked
  compositionClosedProof := by intro f g t x; rfl
}

def SemiflowEndomorphismClosed (C : SemiflowEndomorphismCertificate) : Prop :=
  FlowSemiflowBridgeClosed C.bridge ∧ C.generatorClosed ∧ C.compositionClosed

theorem source_semiflow_endomorphism_closed :
    SemiflowEndomorphismClosed sourceSemiflowEndomorphismCertificate := by
  exact And.intro source_flow_semiflow_bridge_closed
    (And.intro sourceSemiflowEndomorphismCertificate.generatorClosedProof
      sourceSemiflowEndomorphismCertificate.compositionClosedProof)

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
