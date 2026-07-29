import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure DistributiveLattice (A : Type u) where
  join : A → A → A
  meet : A → A → A
  distribJoinMeet : ∀ x y z : A, join x (meet y z) = meet (join x y) (join x z)
  distribMeetJoin : ∀ x y z : A, meet x (join y z) = join (meet x y) (meet x z)

def DistributiveLatticeClosed (D : DistributiveLattice A) : Prop :=
  D.distribJoinMeet ∧ D.distribMeetJoin

structure DistributiveLatticeEvidence (D : DistributiveLattice A) where
  distribJoinMeetClosed : D.distribJoinMeet
  distribMeetJoinClosed : D.distribMeetJoin

theorem distributive_lattice_closed_from_evidence (D : DistributiveLattice A) (E : DistributiveLatticeEvidence D) : DistributiveLatticeClosed D := by
  exact And.intro E.distribJoinMeetClosed E.distribMeetJoinClosed

structure ModularLattice (A : Type u) [LatticeOrderStructure A] where
  modularLaw : ∀ x y z : A, x ≤ z → join x (meet y z) = meet (join x y) z

def ModularLatticeClosed (M : ModularLattice A) : Prop :=
  M.modularLaw

structure ModularLatticeEvidence (M : ModularLattice A) where
  modularLawClosed : M.modularLaw

theorem modular_lattice_closed_from_evidence (M : ModularLattice A) (E : ModularLatticeEvidence M) : ModularLatticeClosed M := by
  exact E.modularLawClosed

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse