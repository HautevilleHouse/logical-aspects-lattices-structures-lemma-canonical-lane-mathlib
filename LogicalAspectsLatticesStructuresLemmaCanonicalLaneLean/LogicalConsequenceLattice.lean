import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

-- | Structure for a lattice of logical consequences, e.g., under a fixed theory.
structure ConsequenceLattice (T : Type) [PartialOrder T] where
  carrier : Set T
  join : T → T → T
  meet : T → T → T
  join_closure_condition : ∀ a b, a ∈ carrier → b ∈ carrier → join a b ∈ carrier
  meet_closure_condition : ∀ a b, a ∈ carrier → b ∈ carrier → meet a b ∈ carrier
  join_comm : ∀ a b, join a b = join b a
  meet_comm : ∀ a b, meet a b = meet b a
  join_assoc : ∀ a b c, join (join a b) c = join a (join b c)
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  absorption_join_meet : ∀ a b, join a (meet a b) = a
  absorption_meet_join : ∀ a b, meet a (join a b) = a

def LatticeClosure (T : Type) [PartialOrder T] (L : ConsequenceLattice T) : Prop :=
  ∀ a b, a ∈ L.carrier → b ∈ L.carrier → a ≤ b ↔ L.join a b = b

structure LatticeEvidence (T : Type) [PartialOrder T] (L : ConsequenceLattice T) where
  join_order_reflects : ∀ a b, a ∈ L.carrier → b ∈ L.carrier → (a ≤ b ↔ L.join a b = b)
  meet_order_reflects : ∀ a b, a ∈ L.carrier → b ∈ L.carrier → (a ≤ b ↔ L.meet a b = a)

theorem lattice_closed_from_evidence (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (E : LatticeEvidence T L) : LatticeClosure T L :=
  fun a b ha hb => E.join_order_reflects a b ha hb

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
