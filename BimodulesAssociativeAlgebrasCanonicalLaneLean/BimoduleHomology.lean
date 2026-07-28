import BimodulesAssociativeAlgebrasCanonicalLaneLean.MoritaContext

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleHomologyPackage {C : BimoduleCategoryPackage}
    {T : TensorProductBimodulePackage C} {M : MoritaContextPackage C T} where
  chainComplex : Type u
  homologyDefined : Prop
  longExactSequence : Prop
  spectralSequenceConvergence : Prop

structure BimoduleHomologyEvidence {C : BimoduleCategoryPackage}
    {T : TensorProductBimodulePackage C} {M : MoritaContextPackage C T}
    (H : BimoduleHomologyPackage C T M) where
  homologyDefinedClosed : H.homologyDefined
  longExactSequenceClosed : H.longExactSequence
  spectralSequenceConvergenceClosed : H.spectralSequenceConvergence

def BimoduleHomologyClosed {C : BimoduleCategoryPackage}
    {T : TensorProductBimodulePackage C} {M : MoritaContextPackage C T}
    (H : BimoduleHomologyPackage C T M) : Prop :=
  H.homologyDefined ∧ H.longExactSequence ∧ H.spectralSequenceConvergence

theorem bimodule_homology_closed_from_evidence
    {C : BimoduleCategoryPackage} {T : TensorProductBimodulePackage C}
    {M : MoritaContextPackage C T} (H : BimoduleHomologyPackage C T M)
    (E : BimoduleHomologyEvidence H) : BimoduleHomologyClosed H := by
  exact And.intro E.homologyDefinedClosed
    (And.intro E.longExactSequenceClosed E.spectralSequenceConvergenceClosed)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse