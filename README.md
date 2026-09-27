# InterfaceLanguage

A structural and functional meta-language developed in Lean 4 to formally verify proof acceptability, training routines, and interaction limits for the Endurance fleet's agentic systems.

## Overview

InterfaceLanguage strictly codifies how agents parse and submit artifacts within the simulation environment. Built heavily on formal methods, this repository ensures that interactions conform strictly to operational rules set by the Outer-Frame reality constraints (dependent on the `Mundus` ontology).

## Quickstart

### Prerequisites
- [Lean 4](https://leanprover.github.io/) (`v4.31.0` specified via `lean-toolchain`)

### Build

```sh
lake build
```

## Dependencies
- `mundus` (Ontological framework)
- `memory-artifact` (Core state representation)

## License
MIT License