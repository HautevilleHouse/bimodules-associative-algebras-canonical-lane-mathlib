import BimodulesAssociativeAlgebrasCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

def ConstrainedBimoduleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bimodule_endgame (A : AdmissibleClass) :
    ConstrainedBimoduleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
