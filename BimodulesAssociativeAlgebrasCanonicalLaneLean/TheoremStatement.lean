import BimodulesAssociativeAlgebrasCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedBimoduleStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "bimodules-associative-algebras-canonical-lane",
    theoremName := "BimodulesAssociativeAlgebrasCanonicalLane",
    theoremObject := "Bimodule associated algebras constrained closure",
    classicalBoundary := "unrestricted classical closure carried",
    constrainedBimoduleStatement := "manifold-constrained theorem certificate internalized",
    certificateLane := "bimodule_constrained",
    carriedRemainder := "classical closure remains outside"
  }

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse