import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BimodulesAssociativeAlgebrasCanonicalLaneLean.BimoduleAnalyticProof

namespace HautevilleHouse
namespace BimodulesAssociativeAlgebrasCanonicalLaneLean

structure BimoduleCategoryEvidenceTerms {A : AssociativeAlgebra R} {B : AssociativeAlgebra S}
    (C : BimoduleAnalyticCertificate A B) where
  abelianCategory : C.abelianCategory
  exactSequences : C.exactSequences
  fiveLemma : C.fiveLemma
  schurLemma : C.schurLemma
  bimoduleCategoryClosed : BimoduleCategoryClosed A B

def BimoduleAnalyticCertificate.evidenceTerms {A : AssociativeAlgebra R} {B : AssociativeAlgebra S}
    (C : BimoduleAnalyticCertificate A B) : BimoduleCategoryEvidenceTerms C :=
  {
    abelianCategory := C.abelianCategoryClosed
    exactSequences := C.exactSequencesClosed
    fiveLemma := C.fiveLemmaClosed
    schurLemma := C.schurLemmaClosed
    bimoduleCategoryClosed := bimodule_category_closed_from_evidence A B C.categoryEvidence
  }

end BimodulesAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse