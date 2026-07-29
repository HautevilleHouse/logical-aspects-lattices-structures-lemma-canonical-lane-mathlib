import canonicalLaneMathlib.AdmissibleClass
import DistributiveLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure DistributiveLawLemmaPackage (D : DistributiveLatticePackage) where
  distribMeetJoin : ∀ a b c : D.carrier, meet a (join b c) = join (meet a b) (meet a c)
  proof : distribMeetJoin

structure DistributiveLawLemmaEvidence (D : DistributiveLatticePackage) (P : DistributiveLawLemmaPackage D) where
  distribMeetJoinClosed : P.distribMeetJoin

def DistributiveLawLemmaClosed (D : DistributiveLatticePackage) (P : DistributiveLawLemmaPackage D) : Prop :=
  DistributiveLatticeClosed D ∧ P.distribMeetJoin

theorem distributive_law_lemma_closed_from_evidence (D : DistributiveLatticePackage) (P : DistributiveLawLemmaPackage D) (E : DistributiveLawLemmaEvidence D P) : DistributiveLawLemmaClosed D P := by
  exact And.intro (distributive_lattice_closed_from_evidence D (by
    exact { distribJoinMeetClosed := ?_, toLatticeEvidence := ?_ })) E.distribMeetJoinClosed
  sorry

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
