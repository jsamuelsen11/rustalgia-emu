# Documentation tooling for the planning phase

- **Date:** 2026-11-16
- **Status:** Draft, awaiting owner approval
- **Scope:** Tooling, hooks, CI, and GitHub settings for a docs-only repository

## Intent

Rustalgia starts with a long planning phase.
AI agents write the documents; the owner drives, reviews, and decides.
The tooling is an automated gate: it catches everything a machine can catch, so review time goes to substance.

The owner's main complaint about AI-written documents is that they decay into disorganised, wordy information dumps.
Formatting tools do not address that,
so this design adds structure contracts and prose linting alongside the usual format, link, and security checks.

Items marked **(call)** were decided by the design author, not the owner.
Everything else was decided by the owner in conversation.

## Goals

- Every check has one definition, used identically by local hooks and CI.
- Every tool version is pinned and locked.
- A document that breaks its type's structure cannot reach `main`.
- A broken link, an unparsable Mermaid block, a misspelling, or a leaked secret cannot reach `main`.
- Configuration lives in `.config/` wherever the tool allows it.
- `main` accepts changes only through pull requests with passing checks.

## Non-goals

- Rust, application, or build tooling.
- Unit tests and dependency vulnerability scanning.
  The pre-push hook and CI reserve a place for them, left empty.
- Writing Claude rules, skills, or `CLAUDE.md` content.
  Those files are linted, not authored, by this work.
- Rendering Mermaid with the real engine in headless Chromium.
- Document or section word limits.

## Anti-goals

- A check that exists in a hook but not in CI, or the reverse.
- Two tools enforcing the same rule.
- A gate that has never been shown to fail.
  See [Proof](#proof).
- Config files in the repository root that could have lived elsewhere.

## Tools

All tools install through mise from `.config/mise.toml`, with a committed lockfile at `.config/mise.lock`.
The builder sets every version to `latest`; the owner pins exact versions afterwards.
Versions below were current on 2026-11-16.

| Job | Tool | Version | Config |
|---|---|---|---|
| Markdown format and lint | rumdl | 0.3.4 | `.config/rumdl.toml` |
| Mermaid blocks parse | merman-cli | 0.10.0 | none |
| Structure contracts | mdschema | 0.16.0 | `.config/mdschema/<type>.yml` |
| Prose | Vale | 3.27.0 | `.config/vale.ini`, `.config/vale/styles/` |
| Spelling | typos | 1.52.2 | `.config/typos.toml` |
| Links and anchors | lychee | 0.24.2 | `.config/lychee.toml` |
| YAML, JSON, TOML format | dprint | 0.65.0 | `.config/dprint.json` |
| Workflow correctness | actionlint | 1.7.12 | `.github/actionlint.yaml` if needed |
| Workflow security | zizmor | 1.32.0 | `.github/zizmor.yml` if needed |
| Action pinning (fixer only) | pinact | 5.0.2 | `.github/pinact.yaml` if needed |
| Secrets | betterleaks | 1.10.1 | `.config/betterleaks.toml` |
| Commit messages, PR titles | committed | 1.1.12 | `.config/committed.toml` |
| Whitespace, line endings | editorconfig-checker | 4.0.2 | `.config/editorconfig-checker.json` |
| Contract coverage | custom script | n/a | `.config/mise/tasks/` |
| Shell lint | shellcheck | 0.11.0 | flag in the mise task |
| Shell format | shfmt | 3.14.1 | reads `.editorconfig` |
| Git hooks | lefthook | 2.2.2 | `.config/lefthook.yml` |

rumdl, Vale, dprint, lefthook, and mise discover `.config/` on their own.
The others receive their config path through a flag or environment variable set in the mise task.

### Single owners

Each rule has one owner.
The overlapping rule in the other tool is switched off.

| Rule | Owner | Switched off |
|---|---|---|
| Spelling | typos | `Vale.Spelling` |
| Internal links and heading anchors | lychee | rumdl MD051, MD057 |
| Required headings | mdschema | rumdl MD043 |
| Markdown formatting | rumdl | dprint's Markdown plugin is not installed |
| Unpinned Actions | zizmor | pinact is a fix command, not a gate |

Secrets are deliberately checked twice: betterleaks before a commit leaves the machine,
and GitHub secret scanning with push protection on the server.

### Known limits

- **merman** is a reimplementation of the Mermaid parser.
  GitHub does not publish which Mermaid version it renders with.
  A diagram can pass merman and still fail to draw on GitHub.
  The owner accepted this.
- **mdschema** uses its own schema format, not JSON Schema.
  It cannot express conditional rules such as "a superseded ADR must name its replacement".
  If a contract needs one, a custom script replaces mdschema for that type.
- **Editor plugins** for typos, lychee, betterleaks, and committed will not find a config in `.config/`.
  The mise tasks are the source of truth.
- **The `gate` job** is defined in a workflow file that a pull request can edit.
  A pull request could weaken the gate and still report it as passing.
  GitHub offers protected required workflows to organisations only,
  so this repository relies on the owner reviewing every change under `.github/` and `.config/` before merging.

## Repository layout

```text
.
├── .claude/                 Claude config (CLAUDE.md lives here, not in root)
├── .config/                 mise, lefthook, and all tool config
├── .github/                 workflows, dependabot, Actions-tool config
├── docs/
│   ├── adr/
│   ├── requirements/
│   ├── research/
│   ├── roadmap/
│   └── superpowers/specs/   design documents such as this one
├── .editorconfig            must be in root
├── .gitattributes           must be in root
├── .gitignore
├── LICENSE
└── README.md
```

`.editorconfig` and `.gitattributes` are the only new root files.
Both are root-only by specification.

**(call)** `.gitattributes` forces LF line endings for all text files.
**(call)** `.editorconfig` sets UTF-8, LF, a final newline, trimmed trailing whitespace, and two-space indentation.
It also sets the 120-character maximum line length.

## Structure contracts

A contract fixes a document type's folder, frontmatter, and ordered headings.
Each contract is one mdschema file and one mise task invocation.
All four are first drafts **(call)** and are expected to change once real documents exist.

Strictness, the same for every contract:

- The document has exactly one title heading.
- The required sections are the only second-level headings allowed, in order.
- Subheadings inside a section are free.
- Frontmatter fields outside the contract are rejected.

If mdschema cannot express one of these, the coverage script enforces it.

### Coverage

Every Markdown file under `docs/` must match a contract or the exemption list.
A file that matches neither fails the gate.
This stops a document escaping its contract through a different folder or a wrong filename.

mdschema cannot check this, so a small shell script does.
It is a mise file task, linted by shellcheck and formatted by shfmt.

The exemption list starts with `docs/superpowers/**` only.

### Research notes

Three types replaced the single research note on 2026-11-17, before any note was written.
Each lives in its own folder under `docs/research/` and is named for its roadmap item: `R<phase>-<nn>-<slug>.md`,
for example `R1-32-mgba.md`.

- **Emulator study**, in `emulators/`: Summary, Scope, Architecture, What works well, What works poorly,
  Implications for Rustalgia, Open questions, Sources.
- **Topic study**, in `topics/`: Summary, Scope, Findings, Options and trade-offs, Implications for Rustalgia,
  Open questions, Sources.
- **Spike report**, in `spikes/`: Summary, Question, Method, Results, Implications for Rustalgia, Open questions.

Frontmatter for all three: `title`, `roadmap_item` (matching the filename), `status`
(`draft`, `approved`, or `superseded`), `date`.
An emulator study also has `subject`.
A roadmap item belongs to one note.
An item is ticked in the research roadmap exactly when its note is `approved` or `superseded`;
the check fails otherwise.

### Requirement: `docs/requirements/REQ-NNNN-<slug>.md`

One requirement per file.

| Frontmatter | Rule |
|---|---|
| `id` | `REQ-NNNN`, matching the filename |
| `title` | string |
| `level` | `high` or `low` |
| `priority` | `must`, `should`, or `could` |
| `status` | `draft`, `approved`, `rejected`, `superseded`, or `retired` |
| `date` | ISO date |

Headings, in order: Statement, Rationale, Acceptance criteria.
Optional, after those: Dependencies, Notes.

### ADR: `docs/adr/NNNN-<slug>.md`

| Frontmatter | Rule |
|---|---|
| `title` | string |
| `status` | `draft`, `approved`, `rejected`, `superseded`, or `retired` |
| `date` | ISO date |

Headings, in order: Context, Options considered, Decision, Consequences.

### Roadmap: `docs/roadmap/*.md`

| Frontmatter | Rule |
|---|---|
| `title` | string |
| `status` | `draft`, `approved`, `completed`, or `superseded` |
| `date` | ISO date |

Headings, in order: Goal, Scope, Milestones, Out of scope, Risks and open questions.

### Folder guide: `README.md` in any folder under `docs/`

No frontmatter.
Headings, in order: Purpose, Layout, Conventions.
`docs/README.md` defines the status values shared by every document type.

### Not under contract

`README.md` and `.claude/**` are outside `docs/` and have no contract.
`docs/superpowers/**` is exempt.
Any other document type needs a contract in the same change that adds its first document;
the coverage check enforces this.

## What each check covers

| Check | Files |
|---|---|
| rumdl, typos, lychee, merman | every Markdown file, including `.claude/`, `.config/`, `.github/` |
| Vale | every tracked file in a format Vale can read; narrowed as false positives appear |
| mdschema | the four contract folders |
| Contract coverage | every Markdown file under `docs/` |
| shellcheck, shfmt | every shell script, including mise file tasks |
| dprint | every YAML, JSON, and TOML file |
| editorconfig-checker | every tracked text file |
| actionlint, zizmor | `.github/workflows/**` |
| betterleaks | every file |

Several of these tools skip hidden directories by default.
The builder must make sure `.claude/`, `.config/`, and `.github/` are included.
`LICENSE` and lockfiles are excluded from spelling and formatting.

### Starting Vale rules

**(call)** No off-the-shelf style guide.
One small custom style with three error-level rules:

- **Filler:** words that add nothing (`basically`, `simply`, `in order to`).
- **Wordiness:** phrases with a shorter equivalent.
- **Terms:** preferred glossary terms.
  Empty until the glossary exists.

Rules are added only when a real document shows the need.

### rumdl settings

**(call)** GitHub flavour and all default rules except the three owned elsewhere.

### Line length

No line in any tracked text file is longer than 120 characters.

- In Markdown, rumdl reflows prose to fit, and the `lint:line-length` task measures every line, including tables,
  code blocks, and headings, which rumdl skips in its sentence-based reflow mode.
  A line that is one unbreakable token is exempt, and so is length that comes only from a link destination.
- editorconfig-checker owns the limit everywhere else, through `max_line_length` in `.editorconfig`.
  Outside Markdown there is no URL exemption;
  a line that cannot be shortened takes an inline `editorconfig-checker-disable-line` comment.
- **(call)** `LICENSE` and lockfiles are exempt.
- **(call)** rumdl puts one sentence on each line and breaks a longer sentence at its clauses.

The tooling pull request reformats this document and `README.md` to match.

## Tasks

Every check is a mise task.
Hooks and CI call tasks and nothing else.
**(call)** Task names:

| Task | Does |
|---|---|
| `fmt` | rewrites files: rumdl, dprint, shfmt |
| `fmt:check` | fails if `fmt` would change anything |
| `lint` | rumdl, merman, mdschema, contract coverage, Vale, typos, editorconfig-checker, actionlint, shellcheck |
| `links` | lychee, internal and external |
| `links:offline` | lychee, internal links and anchors only |
| `security` | betterleaks, zizmor |
| `check` | `fmt:check`, `lint`, `links`, `security` |
| `pin` | pinact: pin and update Action SHAs |

Each tool also has its own task (`lint:rumdl`, `lint:vale`, and so on) so hooks can run them in parallel
and pass staged files.
Tasks are defined inline in `.config/mise.toml`.
A task that needs real scripting, such as contract coverage, is a file under `.config/mise/tasks/`.

## Hooks

Lefthook runs the hook's groups in order, with the members of each group in parallel.
`piped: true` stops later groups when an earlier one fails.

| Hook | Group | Members | Files |
|---|---|---|---|
| pre-commit | format | rumdl, dprint, shfmt, with `stage_fixed` | staged |
| pre-commit | lint | every `lint:*` task, `links:offline` | staged |
| pre-commit | security | betterleaks, zizmor | staged |
| commit-msg | | committed | the message |
| pre-push | | `check` over the whole repository | all |
| pre-push | | betterleaks over the commits being pushed | range |
| pre-push | reserved | unit tests, vulnerability scan | empty for now |

**(call)** External links are checked at push and in CI, not at commit,
so a slow or failing third-party site cannot block a local commit.

The builder reads the lefthook 2.1 and 2.2 changelogs before writing the config,
in case a newer feature fits this pattern better than groups.

## CI

One workflow runs on pull requests and on pushes to `main`.

| Job | Runs |
|---|---|
| `format` | `mise run fmt:check` |
| `lint` | `mise run lint` |
| `links` | `mise run links` |
| `security` | `mise run security`, betterleaks over the PR's commits |
| `pr-title` | committed against the PR title |
| `gate` | depends on every job above; passes only if all of them succeeded |

`gate` is the only check the ruleset requires.
A job added later is listed in `gate`'s `needs`, in the same pull request, and the ruleset never changes.

`gate` always runs and fails if any job it depends on failed, was cancelled, or was skipped.
GitHub treats a skipped required check as passing, so this must be explicit.
It is a few lines of shell, not a third-party action.

- mise installs through `jdx/mise-action`, using the lockfile.
- **(call)** The PR title is checked with `committed` rather than a third-party action,
  so one config governs both commit messages and titles.
  The title reaches the step through an environment variable, never through inline expression expansion.
  The workflow also triggers on title edits.
  If `committed` cannot read a message from standard input or a file,
  fall back to `amannn/action-semantic-pull-request`.
- Every action is pinned to a commit SHA.
  Workflows default to `permissions: contents: read`.
  `pull_request_target` is not used.
- **(call)** A weekly scheduled run of `links` catches external links that rot without any change to the repository.

## GitHub settings

These are applied with the GitHub API after the tooling pull request merges,
because required checks must exist before a ruleset can require them.
The builder shows the owner the exact payloads before applying them.

**Ruleset on `main` (call for each value):**

- Pull request required, zero approvals (a sole owner cannot approve their own).
- Required status check: `gate`.
- Branch must be up to date before merging.
- Linear history required.
- Force pushes and branch deletion blocked.
- No bypass actors, including the owner.
  Consequence: if CI itself breaks, the fix goes through a pull request or the ruleset is switched off by hand.

**Repository settings (call for each value):**

- Squash merge only, with the PR title as the commit subject.
- Head branches deleted on merge.
- Secret scanning and push protection on.
- Dependabot alerts on.

**Outside contributors (call for each value):**

Only accounts with write access can push or merge, and the owner is the only one.
A stranger can still fork, open issues, and open pull requests.

- Workflow runs from any outside contributor need the owner's approval.
- The default workflow token is read-only.
- Pull requests are limited to collaborators, if GitHub offers that setting for this repository.
  The builder verifies before relying on it.
- Code-owner review is not required.
  A sole owner cannot approve their own pull request, so it would block every merge.

**Dependabot:** `.github/dependabot.yml` updates GitHub Actions weekly,
with conventional-commit prefixes. mise tool versions are not covered by Dependabot and are updated by hand.

## Proof

Each gate is shown to fail before it is trusted.
For every check, the builder feeds it a deliberately broken sample and records that it exits non-zero:

- a Markdown file with a lint error and one needing reformatting
- a Mermaid block with a syntax error
- one document per contract with a missing heading, an extra second-level heading, a bad frontmatter value,
  and an unknown frontmatter field
- a Markdown file under `docs/` that matches no contract
- a shell script with a shellcheck warning
- a filler word under `docs/`
- a misspelling
- a broken relative link and a broken heading anchor
- a badly indented YAML file
- a workflow with an unpinned action and one with a syntax error
- a fake secret
- a non-conventional commit message

Samples are not committed.
If lychee does not catch broken internal links or anchors offline,
rumdl MD051 and MD057 are switched back on and this document is updated.

The final proof is the tooling pull request itself passing `gate`,
then a second pull request showing that a failing check blocks the merge.

## Left to the builder

- Exact mise backends for merman and mdschema, which have no registry short name.
- Whether the local mise (2026.7.7) is new enough; upgrading it needs the owner's go-ahead.
- Cache locations for lychee and Vale, and the matching `.gitignore` entries.
- Whether lefthook installs itself through a mise hook or a documented command.
- The wording of a short setup section in `README.md`.
- Splitting the work into one pull request or several.
