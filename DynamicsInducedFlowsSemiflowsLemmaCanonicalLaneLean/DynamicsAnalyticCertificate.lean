import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.AttractorConvergenceLayer
import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.MathlibPDESubstrate

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure DynamicsAnalyticCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  semiflowInvariantLayerClosed : Prop
  continuityCompactnessLayerClosed : Prop
  attractorConvergenceLayerClosed : Prop
  operatorsClosedProof : operatorsClosed
  semiflowInvariantLayerClosedProof : semiflowInvariantLayerClosed
  continuityCompactnessLayerClosedProof : continuityCompactnessLayerClosed
  attractorConvergenceLayerClosedProof : attractorConvergenceLayerClosed

def sourceDynamicsAnalyticCertificate : DynamicsAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := FlowSemiflowLemma primitivePair
  semiflowInvariantLayerClosed := SemiflowInvariantClosed sourceSemiflowInvariantCertificate
  continuityCompactnessLayerClosed := ContinuityCompactnessClosed sourceContinuityCompactnessCertificate
  attractorConvergenceLayerClosed := AttractorConvergenceClosed sourceAttractorConvergenceCertificate
  operatorsClosedProof := primitive_pair_flow_semiflow_lemma_checked
  semiflowInvariantLayerClosedProof := source_semiflow_invariant_closed
  continuityCompactnessLayerClosedProof := source_continuity_compactness_closed
  attractorConvergenceLayerClosedProof := source_attractor_convergence_closed
}

def DynamicsAnalyticCertificateClosed (C : DynamicsAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.semiflowInvariantLayerClosed ∧
  C.continuityCompactnessLayerClosed ∧
  C.attractorConvergenceLayerClosed

theorem source_dynamics_analytic_certificate_closed :
    DynamicsAnalyticCertificateClosed sourceDynamicsAnalyticCertificate := by
  exact And.intro sourceDynamicsAnalyticCertificate.operatorsClosedProof
    (And.intro sourceDynamicsAnalyticCertificate.semiflowInvariantLayerClosedProof
      (And.intro sourceDynamicsAnalyticCertificate.continuityCompactnessLayerClosedProof
        sourceDynamicsAnalyticCertificate.attractorConvergenceLayerClosedProof))

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
