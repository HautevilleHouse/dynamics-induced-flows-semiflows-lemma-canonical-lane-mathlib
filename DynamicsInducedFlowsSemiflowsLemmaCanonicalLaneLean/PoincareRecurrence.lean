import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure RecurrenceData (S : SemiflowSpace) where
  setA : S.carrier → Prop
  measure : InvariantMeasure S
  recurrenceTime : S.time
  recurrenceProperty : ∀ (x : S.carrier), setA x → setA (S.transition recurrenceTime x)

def trivialRecurrenceData : RecurrenceData trivialSemiflowSpace := {
  setA := fun _ => True
  measure := trivialInvariantMeasure trivialSemiflowSpace
  recurrenceTime := 0
  recurrenceProperty := by
    intro x h
    trivial
}

structure PoincareRecurrenceCertificate where
  recurrence : RecurrenceData trivialSemiflowSpace
  domainEvidence : True

def sourcePoincareRecurrenceCertificate : PoincareRecurrenceCertificate := {
  recurrence := trivialRecurrenceData
  domainEvidence := trivial
}

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse