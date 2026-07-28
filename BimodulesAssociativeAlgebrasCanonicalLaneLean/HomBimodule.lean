import canonicalLaneMathlib.Hom

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure HomBimodulePackage (M : BimodulePackage R S) (N : BimodulePackage R S) where
  carrier : Type u
  leftAction : R.carrier → carrier → carrier
  rightAction : carrier → S.carrier → carrier
  isBimodule : IsBimodule leftAction rightAction
  evaluation : carrier → M.carrier → N.carrier
  isHom : ∀ f m n, evaluation f (m + n) = evaluation f m + evaluation f n

structure HomBimoduleEvidence (M : BimodulePackage R S) (N : BimodulePackage R S) (H : HomBimodulePackage M N) where
  isBimoduleClosed : H.isBimodule
  isHomClosed : H.isHom

def HomBimoduleClosed (M : BimodulePackage R S) (N : BimodulePackage R S) (H : HomBimodulePackage M N) : Prop :=
  H.isBimodule ∧ H.isHom

theorem hom_bimodule_closed_from_evidence (M : BimodulePackage R S) (N : BimodulePackage R S) (H : HomBimodulePackage M N) (E : HomBimoduleEvidence M N H) : HomBimoduleClosed M N H := by
  exact And.intro E.isBimoduleClosed E.isHomClosed

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse