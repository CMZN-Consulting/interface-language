# InterfaceLanguage

A small Lean 4 development that declares a meta-language for a reality an agent works in: what a state is, when a state is in conflict, what a valid trace is, and a schedule of work, recreation and sleep. It builds on `mundus`. It is the first declaration of these notions, written on 2026-09-26 and 2026-09-27, and it is kept as that record.

## Status and limits

Read this before citing anything here.

- **What the build shows.** `lake build` is green with no `sorry`. The theorems are true as stated and small. A green build says that the declarations type-check. It does not verify proof acceptability, training routines or interaction limits, which an earlier text of this page claimed.
- **What is declared and not defined** (an audit of 2026-10-01 read every file). `BaseModel` and `Train` are axioms, and no theorem mentions training. `BurnsOut` is defined as `False` and `MundusGrounded` as `True`, for every argument. `Needs`, `EntropyShapingJob` and `PeerInteraction` hold six fields of type `True`. `fulfilled_means_no_burnout` does not use its hypothesis. `RealityBase` accepts a reality in which nothing is ever in conflict.
- **The two statements for each burden** in `Composition.lean` are not independent proofs, which an earlier header claimed. For the first burden the second statement follows from the first; for the second, the two are the two directions of one definition; for the third, the first statement is `¬ False`.
- **What the docstrings are.** They describe what the declarations are meant to stand for. Where a docstring and this section differ, this section is the measured one. Nothing in this repository is a claim about the inner state of any model.
- **What comes next.** A rewrite in which these notions are defined rather than declared is in progress. It will be published after an audit by a second, independent reader.

## Build

Lean 4, `v4.31.0`, pinned in `lean-toolchain`.

```sh
lake build
```

The build needs `mundus` and `memory-artifact` checked out beside this repository.

## License

MIT License
