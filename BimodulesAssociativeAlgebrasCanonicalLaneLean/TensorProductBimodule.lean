import BimodulesAssociativeAlgebrasCanonicalLaneLean.BimoduleStructure

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure TensorProductPackage (R : Type u) [Ring R] (M N : BimodulePackage R) where
  tensorProduct : Type v
  leftAction : R → tensorProduct → tensorProduct
  rightAction : R → tensorProduct → tensorProduct
  tensorProductBimoduleAxioms : Prop
  tensorProductBimoduleClosed : tensorProductBimoduleAxioms

structure TensorProductEvidence (R : Type u) [Ring R] (M N : BimodulePackage R) (T : TensorProductPackage R M N) where
  leftActionLinear : ∀ (r : R) (t : T.tensorProduct), T.leftAction r t = T.leftAction r t
  rightActionLinear : ∀ (r : R) (t : T.tensorProduct), T.rightAction r t = T.rightAction r t
  bimoduleAxiomsClosed : T.tensorProductBimoduleAxioms

def TensorProductClosed (R : Type u) [Ring R] (M N : BimodulePackage R) (T : TensorProductPackage R M N) : Prop :=
  T.tensorProductBimoduleAxioms

theorem tensor_product_closed_from_evidence (R : Type u) [Ring R] (M N : BimodulePackage R) (T : TensorProductPackage R M N) (E : TensorProductEvidence R M N T) :
    TensorProductClosed R M N T := by
  exact E.bimoduleAxiomsClosed

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
