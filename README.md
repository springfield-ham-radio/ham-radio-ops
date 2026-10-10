# ham-radio-ops

Umbrella repo for the [springfield-ham-radio](https://github.com/springfield-ham-radio) organization. It holds the [mani](https://manicli.com/) workspace config and shared Cursor rules. It does not contain application code.

Clone this repo, then clone the other repositories as siblings (the paths in `mani.yaml`). `.github` is not in `mani.yaml`.

## Repositories

| Repository | Description |
| --- | --- |
| [ham-radio-ops](https://github.com/springfield-ham-radio/ham-radio-ops) | Workspace mani config and shared Cursor rules for Springfield Ham Radio |
| [ham-radio-ui](https://github.com/springfield-ham-radio/ham-radio-ui) | Ham radio management application |
| [ham-radio-driver](https://github.com/springfield-ham-radio/ham-radio-driver) | Ham radio serial protocol driver for Springfield |
| [ham-radio-api](https://github.com/springfield-ham-radio/ham-radio-api) | Ham radio protocol API types and schemas for Springfield |
| [ham-radio-registry](https://github.com/springfield-ham-radio/ham-radio-registry) | Radio module registry for Springfield ham radio packages |
| [ham-radio-utils](https://github.com/springfield-ham-radio/ham-radio-utils) | Shared utilities for Springfield ham radio packages |
| [ham-radio-sniffer](https://github.com/springfield-ham-radio/ham-radio-sniffer) | Serial sniffer for Springfield ham radio protocol debugging |
| [ham-radio-docs](https://github.com/springfield-ham-radio/ham-radio-docs) | HamBench documentation site |
| [radio-module-kenwood](https://github.com/springfield-ham-radio/radio-module-kenwood) | Radio module for Kenwood TH-F6 and TH-D74 ham radios (DSL JSON configs) |
| [radio-module-baofeng](https://github.com/springfield-ham-radio/radio-module-baofeng) | Radio module for Baofeng UV-5R series ham radios |
| [radio-module-catalog](https://github.com/springfield-ham-radio/radio-module-catalog) | Official index of installable Springfield Ham Radio modules for the desktop app |
| [.github](https://github.com/springfield-ham-radio/.github) | Org-wide issue templates and community files |

## Local workspace

`prepare.sh` expects Node.js 24+ and Rust (`cargo`, for ham-radio-ui / Tauri).

With mani installed, from this repo:

```sh
mani sync --sync-gitignore=false
./prepare.sh
```

`./prepare.sh` checks for `node` and `cargo`, syncs the mani projects without writing them into `.gitignore`, then runs `mani run prepare` (each Node project's own `./prepare.sh`).

Without mani, clone the siblings next to this repo:

```sh
git clone https://github.com/springfield-ham-radio/ham-radio-api.git
git clone https://github.com/springfield-ham-radio/ham-radio-utils.git
git clone https://github.com/springfield-ham-radio/ham-radio-driver.git
git clone https://github.com/springfield-ham-radio/ham-radio-registry.git
git clone https://github.com/springfield-ham-radio/ham-radio-ui.git
git clone https://github.com/springfield-ham-radio/ham-radio-docs.git
git clone https://github.com/springfield-ham-radio/ham-radio-sniffer.git
git clone https://github.com/springfield-ham-radio/radio-module-baofeng.git
git clone https://github.com/springfield-ham-radio/radio-module-kenwood.git
git clone https://github.com/springfield-ham-radio/radio-module-catalog.git
git clone https://github.com/springfield-ham-radio/.github.git
```

## Files

- `mani.yaml` — project list (URLs, sibling paths, `node` tags) and tasks: `update-all` (`git pull`), `node-install-all` (`yarn install`), `prepare` (`./prepare.sh` in each Node project), `node-build-all` (`yarn build`), `prune-local-branches` (delete merged local branches). `ham-radio-sniffer` and `radio-module-catalog` have no `node` tag. Tasks marked parallel run across their targets at once.
- `prepare.sh` — toolchain check, then `mani sync` and `mani run prepare`.
- `update` — runs `gitr pull`, `yr install`, and `yr build`.
- `.gitignore` — ignores `.DS_Store` and local memory/UI scratch files. Sibling clones stay outside this repo.
- `.editorconfig` — UTF-8, LF, 2-space indent, final newline.
- `.cursor/rules/` — shared Cursor rules for this workspace.
- `skills-lock.json` — lockfile for the skills under `.cursor/skills/`.

## License

[MIT](LICENSE). Copyright (c) 2026 Bryan Hunt.
