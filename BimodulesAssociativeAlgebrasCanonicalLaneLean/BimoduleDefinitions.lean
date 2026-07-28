import canonicalLaneMathlib.Algebra

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure AlgebraPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  isRing : IsRing carrier
  isModule : IsModule carrier
  isAssociative : IsAssociative multiplication

structure BimodulePackage (R S : AlgebraPackage) where
  carrier : Type u
  leftAction : R.carrier → carrier → carrier
  rightAction : carrier → S.carrier → carrier
  isBimodule : IsBimodule leftAction rightAction

structure BalancedMap (M : BimodulePackage R S) (N : BimodulePackage S T) (P : BimodulePackage R T) where
  map : M.carrier × N.carrier → P.carrier
  balanced : ∀ m n s, map (m, leftAction N s n) = map (rightAction M s m, n)
  bilinear : IsBilinear map

def BimoduleWitnessClosed (O : BimodulePackage R S) : Prop := True

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse