import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure LatticePackage where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  joinAssoc : ∀ a b c : carrier, join (join a b) c = join a (join b c)
  meetAssoc : ∀ a b c : carrier, meet (meet a b) c = meet a (meet b c)
  joinComm : ∀ a b : carrier, join a b = join b a
  meetComm : ∀ a b : carrier, meet a b = meet b a
  absorptionJoinMeet : ∀ a b : carrier, join a (meet a b) = a
  absorptionMeetJoin : ∀ a b : carrier, meet a (join a b) = a

structure LatticeEvidence (L : LatticePackage) where
  joinAssocClosed : L.joinAssoc
  meetAssocClosed : L.meetAssoc
  joinCommClosed : L.joinComm
  meetCommClosed : L.meetComm
  absorptionJoinMeetClosed : L.absorptionJoinMeet
  absorptionMeetJoinClosed : L.absorptionMeetJoin

def LatticeClosed (L : LatticePackage) : Prop :=
  L.joinAssoc ∧ L.meetAssoc ∧ L.joinComm ∧ L.meetComm ∧ L.absorptionJoinMeet ∧ L.absorptionMeetJoin

theorem lattice_closed_from_evidence (L : LatticePackage) (E : LatticeEvidence L) : LatticeClosed L := by
  exact And.intro E.joinAssocClosed (And.intro E.meetAssocClosed (And.intro E.joinCommClosed
    (And.intro E.meetCommClosed (And.intro E.absorptionJoinMeetClosed E.absorptionMeetJoinClosed))))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
