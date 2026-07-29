import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean.LogicalConsequenceLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure DeductionLattice (T : Type) [PartialOrder T] (L : ConsequenceLattice T) where
  implication : T → T → T
  deduction_theorem_holds : ∀ a b, a ∈ L.carrier → b ∈ L.carrier → (implication a b ∈ L.carrier ↔ a ≤ b)
  modus_ponens : ∀ a b, a ∈ L.carrier → implication a b ∈ L.carrier → b ∈ L.carrier

structure DeductionEvidence (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (D : DeductionLattice T L) where
  deduction_closed : ∀ a b, a ∈ L.carrier → b ∈ L.carrier → D.implication a b ∈ L.carrier
  modus_ponens_closed : ∀ a b, a ∈ L.carrier → D.implication a b ∈ L.carrier → b ∈ L.carrier

def DeductionLatticeClosure (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (D : DeductionLattice T L) : Prop :=
  ∀ a b, a ∈ L.carrier → b ∈ L.carrier → D.implication a b ∈ L.carrier

theorem deduction_lattice_closed_from_evidence (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (D : DeductionLattice T L) (E : DeductionEvidence T L D) : DeductionLatticeClosure T L D :=
  E.deduction_closed

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
