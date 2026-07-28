import BimodulesAssociativeAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BimoduleWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse
