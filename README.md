# Rustalgia-EMU

🦀 Rustalgia is an open-source, Rust-powered, multi-console emulator bringing generations of gaming back to life.
Built with a focus on accuracy, performance, modular architecture, and cross-platform support.
Relive the classics, rewritten in Rust. 🎮

## Status

Rustalgia is in its planning phase.
The repository holds documentation and the tooling that checks it; there is no emulator code yet.

## Repository layout

| Path | Holds |
|---|---|
| `docs/research/emulators/` | Studies of existing emulators |
| `docs/research/topics/` | Studies of hardware, techniques, platforms, and policy |
| `docs/research/spikes/` | Reports on throwaway experiments |
| `docs/requirements/` | One requirement per file, named `REQ-NNNN-<slug>.md` |
| `docs/adr/` | Architecture decision records, named `NNNN-<slug>.md` |
| `docs/roadmap/` | Roadmaps, starting with the [research roadmap](docs/roadmap/research.md) |
| `docs/superpowers/` | Design documents and implementation plans for the repository itself |
| `.config/` | Tool versions, tasks, git hooks, and every tool's configuration |
| `.github/` | CI workflows, Dependabot, issue and pull request templates, and contributor policies |

## Development

This repository uses [mise](https://mise.jdx.dev/) to install its tools and run its checks.
The only thing to install by hand is mise.

### Setup

```sh
mise install
```

This installs every tool at the version recorded in `.config/mise.lock` and installs the git hooks.

### Tasks

| Command | Does |
|---|---|
| `mise run fmt` | Rewrites files with every formatter |
| `mise run fmt:check` | Fails if a formatter would change a file |
| `mise run lint` | Runs every linter, including internal link checks |
| `mise run links` | Checks internal and external links |
| `mise run security` | Scans for secrets and audits the CI workflows |
| `mise run check` | Runs every CI check except the pull request title, without changing files |
| `mise run pin` | Pins GitHub Actions to commit SHAs |

Each tool also has its own task, such as `mise run lint:vale`.
Run `mise tasks` to list them.

### What gets checked

| Check | Tool |
|---|---|
| Markdown formatting and lint | rumdl |
| Markdown line length, including tables and code blocks | `lint:line-length` |
| Mermaid diagrams parse | merman |
| Document structure | mdschema, through `lint:contracts` |
| Prose | Vale |
| Spelling | typos |
| Links and heading anchors | lychee |
| YAML, JSON, and TOML formatting | dprint |
| Whitespace, line endings, and line length | editorconfig-checker |
| Shell scripts | shellcheck, shfmt |
| CI workflows | actionlint, zizmor |
| Secrets | betterleaks |
| Commit messages and pull request titles | committed |

No line in a tracked text file may be longer than 120 characters.

### Document structure

Every Markdown file under `docs/` must match a structure contract.
The one exemption is `docs/superpowers/`, which holds free-form design documents and plans.
A contract fixes the folder, the frontmatter fields, and the order of the sections for one type of document.
The contracts live in `.config/mdschema/`.

A document in the wrong folder, with a missing or extra section, or with an unknown frontmatter field fails the check.
A new type of document needs a new contract in the same change.

### Git hooks

| Hook | Runs |
|---|---|
| pre-commit | Formatters, then linters, then security scans, on the staged files |
| commit-msg | The commit message check |
| pre-push | `mise run check`, and a secret scan of the commits being pushed |

Formatters fix what they can and stage the result.
Do not skip the hooks with `--no-verify`; CI runs the same checks and blocks the merge.

### Commits and pull requests

Commit messages and pull request titles follow [Conventional Commits](https://www.conventionalcommits.org/),
with a lower-case subject of at most 72 characters:

```text
docs: add research note on cycle-accurate timing
```

Changes reach `main` through pull requests.
Pull requests are squash-merged, so the title becomes the commit on `main`.

### Continuous integration

Each pull request runs the `format`, `lint`, `links`, `security`, and `pr-title` jobs.
The `gate` job passes when all of them succeed, and it is the one check a merge requires.
A weekly job rechecks external links.

## License

Rustalgia is licensed under the GNU General Public License v3.0.
See [LICENSE](LICENSE).
