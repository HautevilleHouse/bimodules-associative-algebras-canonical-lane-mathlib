import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleAdmittedObject where
  ring : Type u
  ringOps : Ring ring
  carrier : Type v
  leftAction : ring → carrier → carrier
  rightAction : ring → carrier → carrier
  bimoduleAxioms : Prop
  conclusion : bimoduleAxioms

structure AdmissibleClass where
  object : BimoduleAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def BimoduleWitnessClosed (O : BimoduleAdmittedObject) : Prop :=
  O.bimoduleAxioms

def admittedClosure (A : AdmissibleClass) : Prop :=
  BimoduleWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
