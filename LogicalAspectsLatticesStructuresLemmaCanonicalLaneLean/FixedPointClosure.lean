import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean.LogicalConsequenceLattice

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure FixedPointStructure (T : Type) [PartialOrder T] (L : ConsequenceLattice T) where
  closureOperator : T → T
  monotone : ∀ a b, a ≤ b → closureOperator a ≤ closureOperator b
  idempotent : ∀ a, closureOperator (closureOperator a) = closureOperator a
  extensive : ∀ a, a ≤ closureOperator a

structure FixedPointEvidence (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (F : FixedPointStructure T L) where
  closureOperator_closed : ∀ a, F.closureOperator a ∈ L.carrier
  least_fixedpoint : ∀ a, (L.carrier).Filter (λ x => F.closureOperator x = x) Nonempty
  closureOperator_meets_lattice : ∀ a, LatticeClosure T L → F.closureOperator a ∈ L.carrier

def FixedPointClosure (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (F : FixedPointStructure T L) : Prop :=
  ∀ a, F.closureOperator a ∈ L.carrier

theorem fixed_point_closed_from_evidence (T : Type) [PartialOrder T] (L : ConsequenceLattice T) (F : FixedPointStructure T L) (E : FixedPointEvidence T L F) : FixedPointClosure T L F :=
  E.closureOperator_closed

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
