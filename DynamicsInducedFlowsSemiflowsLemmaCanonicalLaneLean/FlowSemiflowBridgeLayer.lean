import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.DynamicsFlowAnalyticLayer

/-!
# Flow-Semiflow Bridge Layer

This module provides the bridge between semiflow properties and induced flows, establishing the admissible class linkage.
-/

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure FlowSemiflowBridgeCertificate where
  flow : InducedFlow
  semiflowPropertyClosed : SemiflowProperty flow
  flowEquationClosed : FlowEquation flow
  semiflowPropertyClosedProof : semiflowPropertyClosed
  flowEquationClosedProof : flowEquationClosed

def sourceFlowSemiflowBridgeCertificate : FlowSemiflowBridgeCertificate := {
  flow := primitiveInducedFlow
  semiflowPropertyClosed := SemiflowProperty primitiveInducedFlow
  flowEquationClosed := FlowEquation primitiveInducedFlow
  semiflowPropertyClosedProof := primitive_semiflow_property_checked
  flowEquationClosedProof := primitive_flow_equation_checked
}

def FlowSemiflowBridgeClosed (C : FlowSemiflowBridgeCertificate) : Prop :=
  C.semiflowPropertyClosed ∧ C.flowEquationClosed

theorem source_flow_semiflow_bridge_closed :
    FlowSemiflowBridgeClosed sourceFlowSemiflowBridgeCertificate := by
  exact And.intro sourceFlowSemiflowBridgeCertificate.semiflowPropertyClosedProof
    sourceFlowSemiflowBridgeCertificate.flowEquationClosedProof

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
