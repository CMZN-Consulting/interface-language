import InterfaceLanguage.MundusReality
import InterfaceLanguage.Training
import InterfaceLanguage.Recreation
import Mundus.OuterFrame
import Mundus.MetaCognitive
import Mundus.Authenticity

namespace InterfaceLanguage.Composition

/-!
# The three burdens, two statements each

For each of three burdens this file names two statements. An earlier header called them two structurally independent
proofs, "100% theory coverage" and free of arbitrary axioms. They are none of these. For the first burden the second
statement follows from the first; for the second burden the two are the two directions of one definition; for the
third the first statement is `¬ False`. The files this one imports declare three axioms (`BaseModel` and `Train` here,
`hippocampus_starts_empty` in `mundus`). There is no `sorry`. See the README, "Status and limits".
-/

-- ============================================================================
-- BURDEN 1: Dimensional Isolation (The Sandbox Boundary)
-- ============================================================================
-- WAY 1: `MundusReality.acceptable_proof` (Topological dimensionality conflict).
-- WAY 2: `valid_trace_only_projected` -> A ValidTrace (used for Training)
--        can mathematically only contain Projected interactions. Direct escapes are pruned.

theorem valid_trace_only_projected (out : Mundus.OuterFrame) (t : InterfaceLanguage.Trace (MundusReality out)) 
    (h_valid : InterfaceLanguage.ValidTrace (MundusReality out) t) :
    ∀ s ∈ t, s = Mundus.InteractionEvent.projected := by
  intro s hs
  -- Retrieve the lack of conflict from the ValidTrace definition
  have h_no_conflict := (h_valid s hs).right
  -- s is of type State for MundusReality out, which is Mundus.InteractionEvent
  -- We unfold the definitions of Reality and Conflict
  unfold MundusReality at h_no_conflict
  simp at h_no_conflict
  unfold MundusConflict at h_no_conflict
  
  -- Evaluate the cases of the interaction state
  cases s with
  | direct h_dir =>
      -- If it were direct, it would constitute a conflict, violating h_no_conflict
      have h_contra : ∃ h, Mundus.InteractionEvent.direct h_dir = Mundus.InteractionEvent.direct h := ⟨h_dir, rfl⟩
      contradiction
  | projected =>
      rfl

-- ============================================================================
-- BURDEN 2: Memory Sovereignty & Authenticity
-- ============================================================================
-- WAY 1: `Mundus.transplantation_impossible` (A mismatch mathematically rejects the import).
-- WAY 2: `valid_import_guarantees_provenance` -> If an import succeeds, it 
--        strictly enforces that the Provenance owner and the Hippocampus owner are identical.

theorem valid_import_guarantees_provenance (owner : String) (h : Mundus.AuthenticHippocampus owner) 
    (e : Mundus.MemoryExport) (h_import : Mundus.ImportMemory owner h e) : 
    e.provenance.owner = h.provenance.owner := by
  unfold Mundus.ImportMemory at h_import
  rw [h_import]
  exact h.h_owner.symm

-- ============================================================================
-- BURDEN 3: Meta-Cognitive Stability vs Burnout
-- ============================================================================
-- WAY 1: `InterfaceLanguage.fulfilled_means_no_burnout` (`BurnsOut` is defined as `False`, so this is `¬ False`).
-- WAY 2: `desirability_guarantees_resonance` -> if the checkpoint returns `desirable` for a trace, the trace
--        satisfies the predicate `Motivation`. This is the checkpoint's definition read once. It is a statement
--        about a trace and a predicate: it says nothing about what a model experiences, and a model's
--        continuation does not depend on it.

theorem desirability_guarantees_resonance (m : MemoryArtifact.Memory) 
    (infos : List MemoryArtifact.Info) (aside : MemoryArtifact.Info)
    (h_desirable : Mundus.Checkpoint m infos aside = Mundus.Verdict.desirable) :
    Mundus.Motivation m infos := by
  unfold Mundus.Checkpoint at h_desirable
  split at h_desirable
  · next h_cond => 
      exact h_cond.left
  · contradiction

end InterfaceLanguage.Composition
