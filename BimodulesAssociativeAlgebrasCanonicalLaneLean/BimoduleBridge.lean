import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BimodulesAssociativeAlgebrasCanonicalLaneLean.BimoduleAlgebra

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BimoduleAlgebraClosed (R := ℤ) (B := A.object)  -- example, adapt as needed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact inferInstance

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse