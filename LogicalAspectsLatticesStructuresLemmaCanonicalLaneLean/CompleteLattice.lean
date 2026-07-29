import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure CompleteLattice (A : Type u) [LatticeOrderStructure A] where
  Inf : Set A → A
  Sup : Set A → A
  infGlb : ∀ (S : Set A), isGreatestLowerBound (Inf S) S
  supLub : ∀ (S : Set A), isLeastUpperBound (Sup S) S
  infEmpty : Inf ∅ = top
  supEmpty : Sup ∅ = bot

def CompleteLatticeClosed (C : CompleteLattice A) : Prop :=
  C.infGlb ∧ C.supLub ∧ C.infEmpty ∧ C.supEmpty

structure CompleteLatticeEvidence (C : CompleteLattice A) where
  infGlbClosed : C.infGlb
  supLubClosed : C.supLub
  infEmptyClosed : C.infEmpty
  supEmptyClosed : C.supEmpty

theorem complete_lattice_closed_from_evidence (C : CompleteLattice A) (E : CompleteLatticeEvidence C) : CompleteLatticeClosed C := by
  exact And.intro E.infGlbClosed
    (And.intro E.supLubClosed
      (And.intro E.infEmptyClosed E.supEmptyClosed))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse