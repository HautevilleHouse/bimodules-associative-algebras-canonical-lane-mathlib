import BimodulesAssociativeAlgebrasCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleCategoryPackage where
  bimoduleCollection : Type u
  morphismCollection : Type v
  compositionDefined : Prop
  identityMorphism : Prop
  associativityCondition : Prop

structure BimoduleCategoryEvidence (C : BimoduleCategoryPackage) where
  compositionDefinedClosed : C.compositionDefined
  identityMorphismClosed : C.identityMorphism
  associativityConditionClosed : C.associativityCondition

def BimoduleCategoryClosed (C : BimoduleCategoryPackage) : Prop :=
  C.compositionDefined ∧ C.identityMorphism ∧ C.associativityCondition

theorem bimodule_category_closed_from_evidence (C : BimoduleCategoryPackage)
    (E : BimoduleCategoryEvidence C) : BimoduleCategoryClosed C := by
  exact And.intro E.compositionDefinedClosed
    (And.intro E.identityMorphismClosed E.associativityConditionClosed)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse