import canonicalLaneMathlib.AdmissibleClass

/-!
# Representation Theorems Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure RepresentationTheoremPackage {A : AdmittedLatticeObject}
    (D : DistributiveModularPackage A) where
  stoneRepresentation : Prop
  birkhoffRepresentation : Prop
  subdirectlyIrreducibleDecomposition : Prop
  closedUnderRepresentation : Prop

structure RepresentationTheoremEvidence {A : AdmittedLatticeObject}
    {D : DistributiveModularPackage A} (R : RepresentationTheoremPackage D) where
  stoneRepresentationClosed : R.stoneRepresentation
  birkhoffRepresentationClosed : R.birkhoffRepresentation
  subdirectlyIrreducibleDecompositionClosed : R.subdirectlyIrreducibleDecomposition
  closedUnderRepresentationClosed : R.closedUnderRepresentation

def RepresentationTheoremClosed {A : AdmittedLatticeObject}
    {D : DistributiveModularPackage A} (R : RepresentationTheoremPackage D) : Prop :=
  R.stoneRepresentation ∧ R.birkhoffRepresentation ∧ R.subdirectlyIrreducibleDecomposition ∧ R.closedUnderRepresentation

theorem representation_theorem_closed_from_evidence
    {A : AdmittedLatticeObject} {D : DistributiveModularPackage A}
    (R : RepresentationTheoremPackage D) (E : RepresentationTheoremEvidence R) :
    RepresentationTheoremClosed R := by
  exact And.intro E.stoneRepresentationClosed
    (And.intro E.birkhoffRepresentationClosed
      (And.intro E.subdirectlyIrreducibleDecompositionClosed E.closedUnderRepresentationClosed))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse