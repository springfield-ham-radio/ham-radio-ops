---
name: hambench-architecture
description: >-
  Decide which HamBench repository owns a change, using the package map in
  ham-radio-docs. Use when editing HamBench code, radio modules, or the
  packages ham-radio-api, ham-radio-utils, ham-radio-driver,
  ham-radio-registry, ham-radio-ui, ham-radio-sniffer, ham-radio-docs,
  radio-module-baofeng, radio-module-kenwood, or radio-module-catalog.
---

# HamBench architecture

Before editing, identify the owning repository. Read `ham-radio-docs/docs/developer/index.md` for the current package table. Read `ham-radio-docs/docs/developer/architecture-overview.md` when the change crosses layers or you need to see how the packages connect.

## Package map

| Repository | Owns |
| --- | --- |
| `ham-radio-api` | Types and schemas (protocol DSL, memory map, serial config, stations, antennas) |
| `ham-radio-utils` | Memory-map codec, band plan, license mapping, validation |
| `ham-radio-driver` | Serial driver that executes protocol steps |
| `ham-radio-registry` | Load and validate radio configs; official catalog types |
| `ham-radio-ui` | HamBench desktop app |
| `ham-radio-sniffer` | Headless serial bridge |
| `radio-module-baofeng`, `radio-module-kenwood` | JSON radio modules |
| `radio-module-catalog` | Published module list (GitHub Release zips, not npm) |
| `ham-radio-docs` | User guide and developer docs |

Put the change in the repository that already owns that responsibility. A new radio is a JSON module plus a `radio-module-catalog` entry. The desktop app interprets modules; do not add a per-radio TypeScript driver.

## Documentation

Update docs in the same change. Follow `ham-radio-docs/docs/developer/documentation.md`: one primary page per concept, user guide for operators, developer docs for schemas and APIs, link instead of duplicating.

- **Architecture** (new repository, moved responsibility, changed layer relationship): update the package table in `ham-radio-docs/docs/developer/index.md` and the layer description in `ham-radio-docs/docs/developer/architecture-overview.md`.
- **User-facing behavior** (install, radio modules, Import/Write, channels, CAT, stations, antennas, sniffer, license): update the matching page under `ham-radio-docs/docs/guide/`.

After doc edits, run `yarn build` in `ham-radio-docs` so VitePress dead-link checks pass.
