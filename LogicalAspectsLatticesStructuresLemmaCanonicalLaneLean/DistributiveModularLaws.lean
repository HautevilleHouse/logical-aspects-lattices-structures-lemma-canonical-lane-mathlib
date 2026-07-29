import canonicalLaneMathlib.AdmissibleClass

/-!
# Distributive and Modular Laws Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure DistributiveModularPackage (A : AdmittedLatticeObject) where
  distributiveLaw : Prop
  modularLaw : Prop
  distributivityFromAxioms : Prop
  modularityFromAxioms : Prop
  latticeStructureClosed : Prop

structure DistributiveModularEvidence {A : AdmittedLatticeObject}
    (P : DistributiveModularPackage A) where
  distributiveLawClosed : P.distributiveLaw
  modularLawClosed : P.modularLaw
  distributivityFromAxiomsClosed : P.distributivityFromAxioms
  modularityFromAxiomsClosed : P.modularityFromAxioms
  latticeStructureClosed : P.latticeStructureClosed

def DistributiveModularClosed {A : AdmittedLatticeObject}
    (P : DistributiveModularPackage A) : Prop :=
  P.distributiveLaw ∧ P.modularLaw ∧ P.distributivityFromAxioms ∧ P.modularityFromAxioms ∧ P.latticeStructureClosed

theorem distributive_modular_closed_from_evidence
    {A : AdmittedLatticeObject} (P : DistributiveModularPackage A)
    (E : DistributiveModularEvidence P) : DistributiveModularClosed P := by
  exact And.intro E.distributiveLawClosed
    (And.intro E.modularLawClosed
      (And.intro E.distributivityFromAxiomsClosed
        (And.intro E.modularityFromAxiomsClosed E.latticeStructureClosed)))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse