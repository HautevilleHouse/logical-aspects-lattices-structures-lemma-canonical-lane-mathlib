import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LogicAspectsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse