import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BimodulesAssociativeAlgebrasCanonicalLaneLean.BimoduleAlgebra

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleHomPackage (R : Type u) [Ring R] (M N : BimoduleAlgebraPackage R) where
  hom : Type v
  isLinear_left : Prop
  isLinear_right : Prop

structure BimoduleHomEvidence (R : Type u) [Ring R] (M N : BimoduleAlgebraPackage R) (H : BimoduleHomPackage R M N) where
  linearLeftOk : H.isLinear_left
  linearRightOk : H.isLinear_right

def BimoduleHomClosed (R : Type u) [Ring R] (M N : BimoduleAlgebraPackage R) (H : BimoduleHomPackage R M N) : Prop :=
  H.isLinear_left ∧ H.isLinear_right

theorem bimodule_hom_closed_from_evidence (R : Type u) [Ring R] (M N : BimoduleAlgebraPackage R) (H : BimoduleHomPackage R M N) (E : BimoduleHomEvidence R M N H) :
  BimoduleHomClosed R M N H := by
  exact And.intro E.linearLeftOk E.linearRightOk

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse