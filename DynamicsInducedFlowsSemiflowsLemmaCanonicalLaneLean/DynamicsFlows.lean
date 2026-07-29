import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean

structure SemiflowSpace where
  carrier : Type
  time : Type
  transition : time → carrier → carrier
  semigroupProperty : ∀ (t s : time) (x : carrier), transition (t + s) x = transition t (transition s x)

structure InducedFlow where
  space : SemiflowSpace
  basePoint : space.carrier
  inducedMap : space.time → space.carrier
  inducedProperty : ∀ (t : space.time), inducedMap t = space.transition t basePoint

def trivialSemiflowSpace : SemiflowSpace := {
  carrier := Unit
  time := Nat
  transition := fun _ _ => ()
  semigroupProperty := by
    intro t s x
    rfl
}

def trivialInducedFlow : InducedFlow := {
  space := trivialSemiflowSpace
  basePoint := ()
  inducedMap := fun _ => ()
  inducedProperty := by
    intro t
    rfl
}

structure FlowsSemiflowsAdmissibleObject where
  semiflow : SemiflowSpace
  flow : InducedFlow
  flowFromSemiflow : flow.space = semiflow

def trivialFlowsSemiflowsObject : FlowsSemiflowsAdmissibleObject := {
  semiflow := trivialSemiflowSpace
  flow := trivialInducedFlow
  flowFromSemiflow := rfl
}

end DynamicsInducedFlowsSemiflowsLemmaCanonicalLaneLean
end HautevilleHouse