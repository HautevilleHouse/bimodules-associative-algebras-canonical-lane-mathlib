import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleAlgebraPackage (R : Type u) [Ring R] where
  leftModule : Module R ?
  rightModule : Module R ?
  bimoduleCompatibility : Prop

structure BimoduleAlgebraEvidence (R : Type u) [Ring R] (B : BimoduleAlgebraPackage R) where
  leftModuleOk : B.leftModule.isModule
  rightModuleOk : B.rightModule.isModule
  compatibilityOk : B.bimoduleCompatibility

def BimoduleAlgebraClosed (R : Type u) [Ring R] (B : BimoduleAlgebraPackage R) : Prop :=
  B.leftModule.isModule ∧ B.rightModule.isModule ∧ B.bimoduleCompatibility

theorem bimodule_algebra_closed_from_evidence (R : Type u) [Ring R] (B : BimoduleAlgebraPackage R) (E : BimoduleAlgebraEvidence R B) :
  BimoduleAlgebraClosed R B := by
  exact And.intro E.leftModuleOk (And.intro E.rightModuleOk E.compatibilityOk)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse