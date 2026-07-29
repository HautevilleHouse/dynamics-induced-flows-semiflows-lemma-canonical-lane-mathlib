import DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean.SemiflowEndomorphismLayer

/-!
# Theorem Statement Layer

This module internalizes the theorem-facing object for the dynamics induced flows and semiflows lemma.
-/

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  semiflowEndomorphismClosed : Prop
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository
  theoremName := sourceRepository
  theoremObject := sourceDescription
  classicalBoundary := sourceTheoremBoundary.claimBoundary
  semiflowEndomorphismClosed := SemiflowEndomorphismClosed sourceSemiflowEndomorphismCertificate
  carriedRemainder := "classical source boundary carried by formalizationCertificate"
}

def DynamicsFlowsLemmaInternalized : Prop :=
  sourceTheoremStatement.sourceKey = sourceRepository ∧
  sourceTheoremStatement.semiflowEndomorphismClosed

theorem dynamics_flows_lemma_internalized_checked :
    DynamicsFlowsLemmaInternalized := by
  exact And.intro rfl source_semiflow_endomorphism_closed

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse
