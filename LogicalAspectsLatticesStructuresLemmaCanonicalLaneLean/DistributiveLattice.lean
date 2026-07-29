import canonicalLaneMathlib.AdmissibleClass
import LatticeStructure

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure DistributiveLatticePackage extends LatticePackage where
  distribJoinMeet : ∀ a b c : carrier, join a (meet b c) = meet (join a b) (join a c)

structure DistributiveLatticeEvidence (D : DistributiveLatticePackage) extends LatticeEvidence D.toLatticePackage where
  distribJoinMeetClosed : D.distribJoinMeet

def DistributiveLatticeClosed (D : DistributiveLatticePackage) : Prop :=
  LatticeClosed D.toLatticePackage ∧ D.distribJoinMeet

theorem distributive_lattice_closed_from_evidence (D : DistributiveLatticePackage) (E : DistributiveLatticeEvidence D) : DistributiveLatticeClosed D := by
  exact And.intro (lattice_closed_from_evidence D.toLatticePackage E.toLatticeEvidence) E.distribJoinMeetClosed

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
