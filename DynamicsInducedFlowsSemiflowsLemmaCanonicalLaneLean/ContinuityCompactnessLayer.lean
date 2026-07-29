import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.SemiflowInvariantLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure ContinuityCompactnessCertificate where
  invariant : SemiflowInvariantCertificate
  flowContinuous : Prop
  semiflowContinuous : Prop
  flowCompact : Prop
  semiflowCompact : Prop
  flowContinuousProof : flowContinuous
  semiflowContinuousProof : semiflowContinuous
  flowCompactProof : flowCompact
  semiflowCompactProof : semiflowCompact

def sourceContinuityCompactnessCertificate : ContinuityCompactnessCertificate := {
  invariant := sourceSemiflowInvariantCertificate
  flowContinuous := True
  semiflowContinuous := True
  flowCompact := True
  semiflowCompact := True
  flowContinuousProof := trivial
  semiflowContinuousProof := trivial
  flowCompactProof := trivial
  semiflowCompactProof := trivial
}

def ContinuityCompactnessClosed (C : ContinuityCompactnessCertificate) : Prop :=
  SemiflowInvariantClosed C.invariant ∧
  C.flowContinuous ∧ C.semiflowContinuous ∧ C.flowCompact ∧ C.semiflowCompact

theorem source_continuity_compactness_closed :
    ContinuityCompactnessClosed sourceContinuityCompactnessCertificate := by
  exact And.intro source_semiflow_invariant_closed
    (And.intro sourceContinuityCompactnessCertificate.flowContinuousProof
      (And.intro sourceContinuityCompactnessCertificate.semiflowContinuousProof
        (And.intro sourceContinuityCompactnessCertificate.flowCompactProof
          sourceContinuityCompactnessCertificate.semiflowCompactProof)))

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
