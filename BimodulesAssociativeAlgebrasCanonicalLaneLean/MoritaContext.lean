import canonicalLaneMathlib.Morita

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure MoritaContextPackage (R S : AlgebraPackage) where
  P : BimodulePackage R S
  Q : BimodulePackage S R
  unitLeft : P ⊗[S] Q ≅ R
  unitRight : Q ⊗[R] P ≅ S
  isEquivalence : IsMoritaEquivalence P Q unitLeft unitRight

structure MoritaContextEvidence (R S : AlgebraPackage) (M : MoritaContextPackage R S) where
  unitLeftClosed : M.unitLeft
  unitRightClosed : M.unitRight
  isEquivalenceClosed : M.isEquivalence

def MoritaContextClosed (R S : AlgebraPackage) (M : MoritaContextPackage R S) : Prop :=
  M.unitLeft ∧ M.unitRight ∧ M.isEquivalence

theorem morita_context_closed_from_evidence (R S : AlgebraPackage) (M : MoritaContextPackage R S) (E : MoritaContextEvidence R S M) : MoritaContextClosed R S M := by
  exact And.intro E.unitLeftClosed (And.intro E.unitRightClosed E.isEquivalenceClosed)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse