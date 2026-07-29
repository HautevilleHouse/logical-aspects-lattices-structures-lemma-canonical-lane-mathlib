import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure LatticeOrderStructure (A : Type u) where
  join : A → A → A
  meet : A → A → A
  joinAssociative : ∀ x y z : A, join (join x y) z = join x (join y z)
  meetAssociative : ∀ x y z : A, meet (meet x y) z = meet x (meet y z)
  joinCommutative : ∀ x y : A, join x y = join y x
  meetCommutative : ∀ x y : A, meet x y = meet y x
  absorptionJoinMeet : ∀ x y : A, join x (meet x y) = x
  absorptionMeetJoin : ∀ x y : A, meet x (join x y) = x

def LatticeOrderClosed (L : LatticeOrderStructure A) : Prop :=
  L.joinAssociative ∧ L.meetAssociative ∧ L.joinCommutative ∧ L.meetCommutative ∧ L.absorptionJoinMeet ∧ L.absorptionMeetJoin

structure LatticeOrderEvidence (L : LatticeOrderStructure A) where
  joinAssociativeClosed : L.joinAssociative
  meetAssociativeClosed : L.meetAssociative
  joinCommutativeClosed : L.joinCommutative
  meetCommutativeClosed : L.meetCommutative
  absorptionJoinMeetClosed : L.absorptionJoinMeet
  absorptionMeetJoinClosed : L.absorptionMeetJoin

theorem lattice_order_closed_from_evidence (L : LatticeOrderStructure A) (E : LatticeOrderEvidence L) : LatticeOrderClosed L := by
  exact And.intro E.joinAssociativeClosed
    (And.intro E.meetAssociativeClosed
      (And.intro E.joinCommutativeClosed
        (And.intro E.meetCommutativeClosed
          (And.intro E.absorptionJoinMeetClosed E.absorptionMeetJoinClosed))))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse