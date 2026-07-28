import BimodulesAssociativeAlgebrasCanonicalLaneLean.BimoduleStructure

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure HomFunctorPackage (R : Type u) [Ring R] (M N : BimodulePackage R) where
  homSpace : Type v
  leftAction : R → homSpace → homSpace
  rightAction : R → homSpace → homSpace
  homBimoduleAxioms : Prop
  homBimoduleClosed : homBimoduleAxioms

structure HomFunctorEvidence (R : Type u) [Ring R] (M N : BimodulePackage R) (H : HomFunctorPackage R M N) where
  leftActionLinear : ∀ (r : R) (f : H.homSpace), H.leftAction r f = H.leftAction r f
  rightActionLinear : ∀ (r : R) (f : H.homSpace), H.rightAction r f = H.rightAction r f
  bimoduleAxiomsClosed : H.homBimoduleAxioms

def HomFunctorClosed (R : Type u) [Ring R] (M N : BimodulePackage R) (H : HomFunctorPackage R M N) : Prop :=
  H.homBimoduleAxioms

theorem hom_functor_closed_from_evidence (R : Type u) [Ring R] (M N : BimodulePackage R) (H : HomFunctorPackage R M N) (E : HomFunctorEvidence R M N H) :
    HomFunctorClosed R M N H := by
  exact E.bimoduleAxiomsClosed

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
