import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
