import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean.LogicalConsequenceLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure KripkeFrame (W : Type) where
  relation : W → W → Prop
  reflexive : ∀ w, relation w w
  transitive : ∀ w u v, relation w u → relation u v → relation w v

structure KripkeLattice (W : Type) (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (K : KripkeFrame W) where
  valuation : W → T → Prop
  persistence : ∀ w v, K.relation w v → ∀ p, valuation w p → valuation v p
  lattice_satisfaction : ∀ w, (valuation w).carrier ⊆ L.carrier
  and_condition : ∀ w p q, valuation w (L.meet p q) ↔ valuation w p ∧ valuation w q
  or_condition : ∀ w p q, valuation w (L.join p q) ↔ valuation w p ∨ valuation w q

structure KripkeEvidence (W : Type) (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (K : KripkeFrame W) (KL : KripkeLattice W T L K) where
  persistence_closed : ∀ w v, K.relation w v → ∀ p, KL.valuation w p → KL.valuation v p
  and_closed : ∀ w p q, KL.valuation w (L.meet p q) ↔ KL.valuation w p ∧ KL.valuation w q
  or_closed : ∀ w p q, KL.valuation w (L.join p q) ↔ KL.valuation w p ∨ KL.valuation w q

def KripkeLatticeClosure (W : Type) (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (K : KripkeFrame W) (KL : KripkeLattice W T L K) : Prop :=
  ∀ w v, K.relation w v → ∀ p, KL.valuation w p → KL.valuation v p

theorem kripke_lattice_closed_from_evidence (W : Type) (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (K : KripkeFrame W) (KL : KripkeLattice W T L K) (E : KripkeEvidence W T L K KL) : KripkeLatticeClosure W T L K KL :=
  E.persistence_closed

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
