import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LogicalAspectsLatticesStructuresLemmaSpace where
  carrier : Type
  structure : Set (carrier → carrier → carrier → carrier)

structure LogicalAspectsLatticesStructuresLemmaAdmittedObject where
  space : LogicalAspectsLatticesStructuresLemmaSpace
  latticesStructure : Prop
  logicalAspectsSatisfied : Prop
  structuresLemmaCondition : Prop
  conclusion : structuresLemmaCondition

structure LogicalAspectsLatticesStructuresLemmaEndgameState where
  object : LogicalAspectsLatticesStructuresLemmaAdmittedObject

def LogicalAspectsLatticesStructuresLemmaWitnessClosed (O : LogicalAspectsLatticesStructuresLemmaAdmittedObject) : Prop :=
  O.structuresLemmaCondition

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse