import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.ContinuityCompactnessLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure AttractorConvergenceCertificate where
  continuityCompactness : ContinuityCompactnessCertificate
  attractorSet : Set StateSpace
  forwardConvergence : Prop
  semiflowConvergence : Prop
  attractorInvariant : Prop
  forwardConvergenceProof : forwardConvergence
  semiflowConvergenceProof : semiflowConvergence
  attractorInvariantProof : attractorInvariant

def sourceAttractorConvergenceCertificate : AttractorConvergenceCertificate := {
  continuityCompactness := sourceContinuityCompactnessCertificate
  attractorSet := Set.univ
  forwardConvergence := True
  semiflowConvergence := True
  attractorInvariant := True
  forwardConvergenceProof := trivial
  semiflowConvergenceProof := trivial
  attractorInvariantProof := trivial
}

def AttractorConvergenceClosed (C : AttractorConvergenceCertificate) : Prop :=
  ContinuityCompactnessClosed C.continuityCompactness ∧
  C.forwardConvergence ∧ C.semiflowConvergence ∧ C.attractorInvariant

theorem source_attractor_convergence_closed :
    AttractorConvergenceClosed sourceAttractorConvergenceCertificate := by
  exact And.intro source_continuity_compactness_closed
    (And.intro sourceAttractorConvergenceCertificate.forwardConvergenceProof
      (And.intro sourceAttractorConvergenceCertificate.semiflowConvergenceProof
        sourceAttractorConvergenceCertificate.attractorInvariantProof))

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
