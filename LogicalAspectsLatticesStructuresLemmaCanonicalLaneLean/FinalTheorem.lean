import canonicalLaneMathlib.AdmissibleClass
import LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean.BridgeLemmas
import LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

def ConstrainedLatticeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lattice_endgame (A : AdmissibleClass) : ConstrainedLatticeClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
