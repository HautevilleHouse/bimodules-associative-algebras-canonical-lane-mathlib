import canonicalLaneMathlib.TensorProduct

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure TensorProductPackage (M : BimodulePackage R S) (N : BimodulePackage S T) where
  carrier : Type u
  action : R.carrier → carrier → carrier
  actionRight : carrier → T.carrier → carrier
  universalProperty : ∀ (P : BimodulePackage R T), (M ⊗[S] N → P) ≃ BalancedMap M N P
  isBimodule : IsBimodule action actionRight

structure TensorProductEvidence (M : BimodulePackage R S) (N : BimodulePackage S T) (Tp : TensorProductPackage M N) where
  universalPropertyClosed : Tp.universalProperty
  isBimoduleClosed : Tp.isBimodule

def TensorProductClosed (M : BimodulePackage R S) (N : BimodulePackage S T) (Tp : TensorProductPackage M N) : Prop :=
  Tp.universalProperty ∧ Tp.isBimodule

theorem tensor_product_closed_from_evidence (M : BimodulePackage R S) (N : BimodulePackage S T) (Tp : TensorProductPackage M N) (E : TensorProductEvidence M N Tp) : TensorProductClosed M N Tp := by
  exact And.intro E.universalPropertyClosed E.isBimoduleClosed

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse