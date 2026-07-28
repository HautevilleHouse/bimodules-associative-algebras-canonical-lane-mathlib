import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure AssociativeAlgebra (R : Type u) [CommRing R] where
  carrier : Type v
  algebraMap : R → carrier
  mul : carrier → carrier → carrier
  add : carrier → carrier → carrier
  zero : carrier
  one : carrier
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  add_comm : ∀ a b : carrier, add a b = add b a
  add_assoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  zero_add : ∀ a : carrier, add zero a = a
  add_zero : ∀ a : carrier, add a zero = a
  add_left_neg : ∀ a : carrier, ∃ b : carrier, add a b = zero
  left_distrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  one_mul : ∀ a : carrier, mul one a = a
  mul_one : ∀ a : carrier, mul a one = a
  algebraMap_mul : ∀ r s : R, algebraMap (r * s) = mul (algebraMap r) (algebraMap s)
  algebraMap_add : ∀ r s : R, algebraMap (r + s) = add (algebraMap r) (algebraMap s)
  algebraMap_one : algebraMap 1 = one

def AlgebraClosed (A : AssociativeAlgebra R) : Prop :=
  A.mul_assoc ∧ A.add_comm ∧ A.add_assoc ∧ A.zero_add ∧ A.add_zero ∧
  A.left_distrib ∧ A.right_distrib ∧ A.one_mul ∧ A.mul_one ∧
  A.algebraMap_mul ∧ A.algebraMap_add ∧ A.algebraMap_one

structure Bimodule (A : AssociativeAlgebra R) (B : AssociativeAlgebra S) where
  carrier : Type w
  leftAction : A.carrier → carrier → carrier
  rightAction : carrier → B.carrier → carrier
  add : carrier → carrier → carrier
  zero : carrier
  add_comm : ∀ x y : carrier, add x y = add y x
  add_assoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  zero_add : ∀ x : carrier, add zero x = x
  add_zero : ∀ x : carrier, add x zero = x
  left_action_mul : ∀ a b : A.carrier, ∀ x : carrier, leftAction (A.mul a b) x = leftAction a (leftAction b x)
  right_action_mul : ∀ a b : B.carrier, ∀ x : carrier, rightAction x (B.mul a b) = rightAction (rightAction x a) b
  left_action_add : ∀ a : A.carrier, ∀ x y : carrier, leftAction a (add x y) = add (leftAction a x) (leftAction a y)
  right_action_add : ∀ a : B.carrier, ∀ x y : carrier, rightAction (add x y) a = add (rightAction x a) (rightAction y a)
  compatibility : ∀ a : A.carrier, ∀ x : carrier, ∀ b : B.carrier, leftAction a (rightAction x b) = rightAction (leftAction a x) b

def BimoduleClosed (M : Bimodule A B) : Prop :=
  M.add_comm ∧ M.add_assoc ∧ M.zero_add ∧ M.add_zero ∧
  M.left_action_mul ∧ M.right_action_mul ∧ M.left_action_add ∧ M.right_action_add ∧ M.compatibility

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse