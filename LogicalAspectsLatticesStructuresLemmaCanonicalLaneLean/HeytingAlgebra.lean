import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure HeytingAlgebra (A : Type u) [LatticeOrderStructure A] where
  top : A
  bot : A
  implies : A → A → A
  topMeet : ∀ x : A, meet top x = x
  botJoin : ∀ x : A, join bot x = x
  impliesPartialOrder : ∀ x y : A, implies x y = top ↔ x ≤ y
  modusPonens : ∀ x y : A, meet x (implies x y) = meet x y
  currying : ∀ x y z : A, implies (meet x y) z = implies x (implies y z)

def HeytingAlgebraClosed (H : HeytingAlgebra A) : Prop :=
  H.topMeet ∧ H.botJoin ∧ H.impliesPartialOrder ∧ H.modusPonens ∧ H.currying

structure HeytingAlgebraEvidence (H : HeytingAlgebra A) where
  topMeetClosed : H.topMeet
  botJoinClosed : H.botJoin
  impliesPartialOrderClosed : H.impliesPartialOrder
  modusPonensClosed : H.modusPonens
  curryingClosed : H.currying

theorem heyting_algebra_closed_from_evidence (H : HeytingAlgebra A) (E : HeytingAlgebraEvidence H) : HeytingAlgebraClosed H := by
  exact And.intro E.topMeetClosed
    (And.intro E.botJoinClosed
      (And.intro E.impliesPartialOrderClosed
        (And.intro E.modusPonensClosed E.curryingClosed)))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse