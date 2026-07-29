import LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure LatticeSpace where
  carrier : Type
  partialOrder : PartialOrder carrier

structure LatticeAdmittedObject where
  space : LatticeSpace
  completeness : Prop
  distributivity : Prop
  conclusion : completeness ∧ distributivity

structure LatticeEndgameState where
  object : LatticeAdmittedObject

def LatticeWitnessClosed (O : LatticeAdmittedObject) : Prop :=
  O.completeness ∧ O.distributivity

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse
