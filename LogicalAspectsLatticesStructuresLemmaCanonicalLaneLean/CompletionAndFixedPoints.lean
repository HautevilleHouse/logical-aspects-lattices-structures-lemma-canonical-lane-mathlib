import canonicalLaneMathlib.AdmissibleClass

/-!
# Completion and Fixed-Point Package
-/

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure CompletionFixedPointPackage {A : AdmittedLatticeObject}
    (D : DistributiveModularPackage A) where
  dedekindMacNeilleCompletion : Prop
  knasterTarskiFixedPoint : Prop
  closureOperatorExistence : Prop
  galoisConnectionAdjoint : Prop

structure CompletionFixedPointEvidence {A : AdmittedLatticeObject}
    {D : DistributiveModularPackage A} (C : CompletionFixedPointPackage D) where
  dedekindMacNeilleCompletionClosed : C.dedekindMacNeilleCompletion
  knasterTarskiFixedPointClosed : C.knasterTarskiFixedPoint
  closureOperatorExistenceClosed : C.closureOperatorExistence
  galoisConnectionAdjointClosed : C.galoisConnectionAdjoint

def CompletionFixedPointClosed {A : AdmittedLatticeObject}
    {D : DistributiveModularPackage A} (C : CompletionFixedPointPackage D) : Prop :=
  C.dedekindMacNeilleCompletion ∧ C.knasterTarskiFixedPoint ∧ C.closureOperatorExistence ∧ C.galoisConnectionAdjoint

theorem completion_fixed_point_closed_from_evidence
    {A : AdmittedLatticeObject} {D : DistributiveModularPackage A}
    (C : CompletionFixedPointPackage D) (E : CompletionFixedPointEvidence C) :
    CompletionFixedPointClosed C := by
  exact And.intro E.dedekindMacNeilleCompletionClosed
    (And.intro E.knasterTarskiFixedPointClosed
      (And.intro E.closureOperatorExistenceClosed E.galoisConnectionAdjointClosed))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse