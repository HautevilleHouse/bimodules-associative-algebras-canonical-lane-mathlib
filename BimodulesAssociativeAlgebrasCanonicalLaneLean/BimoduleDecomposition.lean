import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BimodulesAssociativeAlgebrasCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleDecompositionPackage (A : AssociativeAlgebra R) (B : AssociativeAlgebra S) where
  simpleSubbimodules : List (Bimodule A B)
  decompositionProperties : Prop
  uniquenessOfSimpleFactors : Prop
  finiteLength : Prop

structure BimoduleDecompositionEvidence {A : AssociativeAlgebra R} {B : AssociativeAlgebra S}
    (Pkg : BimoduleDecompositionPackage A B) where
  decompositionPropertiesClosed : Pkg.decompositionProperties
  uniquenessOfSimpleFactorsClosed : Pkg.uniquenessOfSimpleFactors
  finiteLengthClosed : Pkg.finiteLength

def BimoduleDecompositionClosed {A : AssociativeAlgebra R} {B : AssociativeAlgebra S}
    (Pkg : BimoduleDecompositionPackage A B) : Prop :=
  Pkg.simpleSubbimodules.length = 0 ∨ (
    Pkg.decompositionProperties ∧ Pkg.uniquenessOfSimpleFactors ∧ Pkg.finiteLength)

theorem bimodule_decomposition_closed_from_evidence
    {A : AssociativeAlgebra R} {B : AssociativeAlgebra S}
    (Pkg : BimoduleDecompositionPackage A B) (E : BimoduleDecompositionEvidence Pkg) :
    BimoduleDecompositionClosed Pkg := by
  by_cases h : Pkg.simpleSubbimodules.length = 0
  · exact Or.inl h
  · exact Or.inr (And.intro E.decompositionPropertiesClosed
      (And.intro E.uniquenessOfSimpleFactorsClosed E.finiteLengthClosed))

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse