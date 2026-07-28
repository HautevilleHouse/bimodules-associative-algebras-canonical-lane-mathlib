import BimodulesAssociativeAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimodulePackage (R : Type u) [Ring R] where
  leftModule : Module R (Type v)
  rightModule : Module (Opposite R) (Type v)
  bimoduleCondition : ∀ (r : R) (m : leftModule.carrier), rightModule.smul r m = leftModule.smul r m
  bimoduleConditionProp : Prop
  bimoduleConditionClosed : bimoduleConditionProp

structure BimoduleEvidence (R : Type u) [Ring R] (B : BimodulePackage R) where
  leftModuleWellDefined : B.leftModule.isModule
  rightModuleWellDefined : B.rightModule.isModule
  bimoduleConditionClosed : B.bimoduleConditionProp

def BimoduleClosed (R : Type u) [Ring R] (B : BimodulePackage R) : Prop :=
  B.leftModule.isModule ∧ B.rightModule.isModule ∧ B.bimoduleConditionProp

theorem bimodule_closed_from_evidence (R : Type u) [Ring R] (B : BimodulePackage R) (E : BimoduleEvidence R B) :
    BimoduleClosed R B := by
  exact And.intro E.leftModuleWellDefined (And.intro E.rightModuleWellDefined E.bimoduleConditionClosed)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
