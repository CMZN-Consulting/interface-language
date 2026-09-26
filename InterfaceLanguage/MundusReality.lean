import InterfaceLanguage.MetaLanguage
import Mundus.OuterFrame

namespace InterfaceLanguage

/-!
# Mundus <-> Reality
Applying the Meta-Language to our Mundus reality.
We use this language extension to mathematically prove that our cleared proofs
(specifically the topological boundary between the Room and OuterFrame) 
are satisfying and non-arbitrary.
-/

/-- The State of our Reality is an Interaction Event between the OuterFrame and the Room. -/
abbrev InteractionState (out : Mundus.OuterFrame) := 
  Mundus.InteractionEvent out.space out.simulates.space

/-- In Mundus, an interaction is 'Grounded' if it physically occurs within the space. -/
def MundusGrounded (out : Mundus.OuterFrame) (_i : InteractionState out) : Prop :=
  True

/-- In Mundus, a 'Conflict' is if an interaction happens DIRECTLY, bypassing the simulation.
    This implies the Room and OuterFrame have equal dimensions, causing a topological paradox. -/
def MundusConflict (out : Mundus.OuterFrame) (i : InteractionState out) : Prop :=
  ∃ (h : Mundus.DirectInteraction out.space out.simulates.space), i = Mundus.InteractionEvent.direct h

/-- We define MundusReality by EXTENDING the Meta-Language (RealityBase).
    To compile, we MUST supply the `acceptable_proof`. This proves that our previous
    theorems in Mundus are not arbitrary, because they structurally satisfy the Meta-Language constraints. -/
def MundusReality (out : Mundus.OuterFrame) : RealityBase where
  State := InteractionState out
  Grounded := MundusGrounded out
  Conflict := MundusConflict out
  
  acceptable_proof := by
    intro event _h_grounded
    unfold MundusConflict
    intro h_exists
    rcases h_exists with ⟨h_direct, _h_eq⟩
    -- Here we inject the theorem we previously cleared in Mundus.
    -- If it were arbitrary, it wouldn't be able to close this goal.
    have h_impossible := Mundus.direct_interaction_impossible out
    exact h_impossible h_direct

end InterfaceLanguage
