import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean

structure BooleanAlgebra (A : Type u) [HeytingAlgebra A] where
  complement : A → A
  complementMeet : ∀ x : A, meet x (complement x) = bot
  complementJoin : ∀ x : A, join x (complement x) = top
  deMorganJoin : ∀ x y : A, complement (join x y) = meet (complement x) (complement y)
  deMorganMeet : ∀ x y : A, complement (meet x y) = join (complement x) (complement y)

def BooleanAlgebraClosed (B : BooleanAlgebra A) : Prop :=
  B.complementMeet ∧ B.complementJoin ∧ B.deMorganJoin ∧ B.deMorganMeet

structure BooleanAlgebraEvidence (B : BooleanAlgebra A) where
  complementMeetClosed : B.complementMeet
  complementJoinClosed : B.complementJoin
  deMorganJoinClosed : B.deMorganJoin
  deMorganMeetClosed : B.deMorganMeet

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebra A) (E : BooleanAlgebraEvidence B) : BooleanAlgebraClosed B := by
  exact And.intro E.complementMeetClosed
    (And.intro E.complementJoinClosed
      (And.intro E.deMorganJoinClosed E.deMorganMeetClosed))

end LogicalAspectsLatticesStructuresLemmaCanonicalLaneLean
end HautevilleHouse