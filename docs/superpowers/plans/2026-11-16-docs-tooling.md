# Documentation Tooling Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL:
> Use superpowers:subagent-driven-development (recommended)
> or superpowers:executing-plans to implement this plan task-by-task.
> Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Gate every document in this repository with pinned, automated format, lint, structure, link,
and security checks, run identically by git hooks and GitHub Actions.

**Architecture:** Every check is a mise task defined in `.config/mise.toml`.
Lefthook and one GitHub Actions workflow call those tasks and nothing else.
A single `gate` job is the only required check on `main`.

**Tech Stack:** mise, lefthook, rumdl, merman-cli, mdschema, Vale, typos, lychee, dprint, actionlint, zizmor, pinact,
betterleaks, committed, editorconfig-checker, shellcheck, shfmt, GitHub Actions, GitHub rulesets.

**Spec:** `docs/superpowers/specs/2026-11-16-docs-tooling-design.md`

## Global Constraints

- Config lives in `.config/` unless the tool cannot read it from there.
  New root files: `.editorconfig` and `.gitattributes` only.
- Every tool version in `.config/mise.toml` is `latest`; the owner pins exact versions afterwards.
  The resolved versions are locked in `.config/mise.lock` so hooks and CI use the same ones.
- No line in any tracked text file exceeds 120 characters.
  Exempt: a line that is one unbreakable URL, `LICENSE`, lockfiles.
- Each rule has one owner: typos owns spelling, lychee owns links and anchors, mdschema owns headings,
  rumdl owns Markdown formatting, zizmor owns unpinned Actions.
- Hooks and CI invoke `mise run <task>` only.
  No tool is called directly from `lefthook.yml` or a workflow.
- Hidden directories `.claude/`, `.config/`, and `.github/` are checked like any other.
- Commits follow Conventional Commits.
  Never commit with `--no-verify`.
- Proof samples live in the session scratchpad, never in the repository.
- Nothing on the owner's machine outside this repository is upgraded or changed without asking the owner.
- GitHub settings are changed only in Task 10, after the owner has seen the exact payloads.
- Tool flags and schema syntax in this plan come from documentation, not a test run.
  Each task starts by reading the tool's `--help`.
  Where reality differs, follow the tool and note the difference in the commit body.

## Review Focus

1. **Hidden directories skipped.**
   A Markdown file in `.claude/` with a lint error must fail `lint`.
   Tested in Task 3.
2. **A task called with no matching files.**
   `mise run lint:actionlint` with no workflows, or a hook run where no staged file matches,
   must pass without scanning unrelated files or erroring.
   Tested in Tasks 3 and 7.
3. **Filenames with spaces.**
   A staged file named `docs/research/two words.md` must reach each tool as one argument.
   Tested in Task 8.
4. **A skipped or cancelled CI job.**
   `gate` must fail when a job it needs is skipped.
   Tested in Task 9.
5. **A pull request with a read-only token and no secrets**, such as one from Dependabot or a fork.
   Every job must still be able to pass.
   Tested in Task 9.

## File Structure

| Path | Responsibility |
|---|---|
| `.config/mise.toml` | Tool pins, environment variables, every task |
| `.config/mise.lock` | Locked tool versions and checksums |
| `.config/mise/tasks/lint/contracts` | Shell script: contract coverage check |
| `.config/lefthook.yml` | Hooks; calls mise tasks only |
| `.config/rumdl.toml` | Markdown lint and format rules |
| `.config/dprint.json` | YAML, JSON, TOML formatting |
| `.config/mdschema/{research,requirement,adr,roadmap}.yml` | One contract each |
| `.config/vale.ini`, `.config/vale/styles/Rustalgia/*.yml` | Prose rules |
| `.config/typos.toml`, `.config/lychee.toml`, `.config/betterleaks.toml` | One tool each |
| `.config/committed.toml`, `.config/editorconfig-checker.json` | One tool each |
| `.github/workflows/ci.yml` | Pull request and push checks, `gate` |
| `.github/workflows/links.yml` | Weekly external link check |
| `.github/dependabot.yml` | Weekly Actions updates |
| `.editorconfig`, `.gitattributes`, `.gitignore` | Root files |
| `README.md` | Adds a short setup section |

Task names, used by every later task:

- Aggregates: `fmt`, `fmt:check`, `lint`, `links`, `links:offline`, `security`, `check`, `pin`.
- Per tool: `fmt:rumdl`, `fmt:dprint`, `fmt:shfmt`, `lint:rumdl`, `lint:merman`, `lint:mdschema`, `lint:contracts`,
  `lint:vale`, `lint:typos`, `lint:editorconfig`, `lint:actionlint`, `lint:shellcheck`, `security:betterleaks`,
  `security:zizmor`, `commit-msg`.
- Every per-tool task accepts file paths after `--`.
  With none, it checks every tracked file it applies to.
- `fmt:*` tasks accept `--check` as the first argument and then fail instead of writing.

---

### Task 1: Toolchain and root files

**Files:**

- Modify: `.config/mise.toml`, `.gitignore`
- Create: `.config/mise.lock`, `.editorconfig`, `.gitattributes`

**Interfaces:**

- Produces: every tool on `PATH` inside `mise exec`; `.editorconfig` values used by Tasks 2, 3, and 4.

- [ ] **Step 1: Check the local mise.** Run `mise --version`.
  The spec recorded 2026.7.7.
  If any tool below fails to resolve because mise is too old, stop and ask the owner before upgrading.

- [ ] **Step 2: List the tools in `.config/mise.toml`.** Every version is `latest`.
  The owner pins exact versions afterwards.

```toml
[tools]
rumdl = "latest"
lefthook = "latest"
lychee = "latest"
vale = "latest"
typos = "latest"
dprint = "latest"
actionlint = "latest"
zizmor = "latest"
pinact = "latest"
betterleaks = "latest"
committed = "latest"
editorconfig-checker = "latest"
shellcheck = "latest"
shfmt = "latest"
"aqua:Latias94/merman" = "latest"
"aqua:jackchuka/mdschema" = "latest"
```

If an `aqua:` entry does not resolve, use the `github:` backend with the same owner and repository.

- [ ] **Step 3: Lock and install.**
  Run `mise install` then `mise lock`.
  Expected: `.config/mise.lock` exists and lists all sixteen tools.

- [ ] **Step 4: Verify each binary.**
  Run each tool's version command through `mise exec --`.
  Expected: sixteen version strings matching the lockfile.
  The merman binary is `merman-cli`.

- [ ] **Step 5: Write `.editorconfig`.**
  `root = true`; for `[*]`: `charset = utf-8`, `end_of_line = lf`, `insert_final_newline = true`,
  `trim_trailing_whitespace = true`, `indent_style = space`, `indent_size = 2`, `max_line_length = 120`.
  For `[LICENSE]` and `[*.lock]`: `max_line_length = off`.

- [ ] **Step 6: Write `.gitattributes`.** One rule: `* text=auto eol=lf`.

- [ ] **Step 7: Extend `.gitignore`.**
      Add `.lycheecache` and Vale's sync output directory if Task 5 creates one.

- [ ] **Step 8: Commit.**
      `build: pin documentation toolchain`

---

### Task 2: Formatters

**Files:**

- Create: `.config/rumdl.toml`, `.config/dprint.json`
- Modify: `.config/mise.toml`, and every existing file the formatters change

**Interfaces:**

- Produces: `fmt`, `fmt:check`, `fmt:rumdl`, `fmt:dprint`.

- [ ] **Step 1: Write proof samples in the scratchpad.**
  A Markdown file with a 200-character prose line and inconsistent list markers; a YAML file indented with four spaces;
  a TOML file with unaligned spacing.

- [ ] **Step 2: Write `.config/rumdl.toml`.** GitHub flavour.
  `MD013` line length 120, applied to tables and code blocks, with reflow enabled.
  Use the sentence-per-line reflow mode if it also honours the 120 cap; otherwise the mode that wraps at 120.
  Disable `MD043`, `MD051`, `MD057`.
  All other default rules stay on.

- [ ] **Step 3: Write `.config/dprint.json`.**
  Plugins: JSON, TOML, and `pretty_yaml`.
  No Markdown plugin.
  Line width 120.
  Exclude `**/*.lock`.
  Pin each plugin by version and checksum.

- [ ] **Step 4: Add the tasks.**
  `fmt:rumdl` runs `rumdl fmt`, or `rumdl check` without fixing when given `--check`.
  `fmt:dprint` runs `dprint fmt` or `dprint check`.
  `fmt` and `fmt:check` depend on the per-tool tasks.

- [ ] **Step 5: Prove failure.**
  Run `mise run fmt:check -- <each sample>`.
  Expected: non-zero exit for all three.

- [ ] **Step 6: Prove the fix.**
  Run `mise run fmt -- <each sample>` then `fmt:check` again.
  Expected: exit 0, and no line over 120 characters.

- [ ] **Step 7: Format the repository.**
  Run `mise run fmt`, then `mise run fmt:check`.
  Expected: exit 0.
  Read the diff of the spec and this plan to confirm the meaning is unchanged.

- [ ] **Step 8: Commit.**
      `build: add markdown and data formatters`

---

### Task 3: Markdown, spelling, and whitespace lint

**Files:**

- Create: `.config/typos.toml`, `.config/editorconfig-checker.json`
- Modify: `.config/mise.toml`

**Interfaces:**

- Consumes: `.config/rumdl.toml` from Task 2.

- Produces: `lint:rumdl`, `lint:merman`, `lint:typos`, `lint:editorconfig`,
  and a `lint` aggregate that later tasks extend.

- [ ] **Step 1: Write proof samples.**
  A Markdown file with a skipped heading level;
  one with a Mermaid block containing `graph TD; A-->` and nothing after the arrow; one containing `recieve`;
  a text file with a tab indent and a 130-character line;
  a copy of the first sample placed under a `.claude/` directory inside a throwaway git repository.

- [ ] **Step 2: Add `lint:rumdl`.** `rumdl check` with no fixing.

- [ ] **Step 3: Add `lint:merman`.**
  `merman-cli lint --markdown` over Markdown files.
  Confirm from `--help` that a syntax error gives a non-zero exit; if the flag set differs, use what the tool documents.

- [ ] **Step 4: Add `lint:typos`.**
  Config at `.config/typos.toml`, passed with `--config`.
  Exclude `LICENSE` and `*.lock`.
  Include hidden files.

- [ ] **Step 5: Add `lint:editorconfig`.**
  Config at `.config/editorconfig-checker.json`, passed with `-config`.
  Exclude `LICENSE` and `*.lock`.

- [ ] **Step 6: Prove failure.** Run each task against its sample.
      Expected: non-zero exit for all four.

- [ ] **Step 7: Prove hidden directories are covered.**
  In the throwaway repository, run `lint:rumdl` with no file arguments.
  Expected: the `.claude/` file is reported.

- [ ] **Step 8: Prove the empty case.**
  Run `mise run lint:merman -- LICENSE`.
  Expected: exit 0, no scan of other files.

- [ ] **Step 9: Run on the repository.** `mise run lint`.
  Expected: exit 0.
  Fix real findings in the files; add an exclusion only for a false positive, with a comment saying why.

- [ ] **Step 10: Commit.**
      `build: add markdown, spelling, and whitespace lint`

---

### Task 4: Structure contracts and coverage

**Files:**

- Create: `.config/mdschema/research.yml`, `requirement.yml`, `adr.yml`, `roadmap.yml`
- Create: `.config/mise/tasks/lint/contracts`
- Modify: `.config/mise.toml`

**Interfaces:**

- Produces: `lint:mdschema`, `lint:contracts`, `lint:shellcheck`, `fmt:shfmt`; all join `lint` or `fmt`.

Contract table.
Field values and heading order are copied from the spec.

- **`research.yml`**, glob `docs/research/*.md`
  - Frontmatter: `title`, `subject`, `status` (`draft`, `reviewed`), `date`.
  - Headings: Summary, Scope, What works well, What works poorly, Implications for Rustalgia, Open questions, Sources.

- **`requirement.yml`**, glob `docs/requirements/REQ-[0-9][0-9][0-9][0-9]-*.md`
  - Frontmatter: `id`, `title`, `level` (`high`, `low`), `priority` (`must`, `should`, `could`), `status`
    (`proposed`, `accepted`, `rejected`, `superseded`), `date`.
  - Headings: Statement, Rationale, Acceptance criteria, then optional Dependencies, Notes.

- **`adr.yml`**, glob `docs/adr/[0-9][0-9][0-9][0-9]-*.md`
  - Frontmatter: `title`, `status` (`proposed`, `accepted`, `rejected`, `deprecated`, `superseded`), `date`.
  - Headings: Context, Options considered, Decision, Consequences.

- **`roadmap.yml`**, glob `docs/roadmap/*.md`
  - Frontmatter: `title`, `status` (`draft`, `active`, `completed`, `superseded`), `date`.
  - Headings: Goal, Scope, Milestones, Out of scope, Risks and open questions.

- [ ] **Step 1: Write proof samples.**
  For each of the four types, one valid document and five invalid variants: a missing required heading,
  an extra second-level heading, a status outside the allowed set, an unknown frontmatter field, and two title headings.
  Add a valid document with third-level headings inside a section.
  Add `docs/notes/stray.md`, `docs/adr/no-number.md`, and a requirement whose `id` differs from its filename.

- [ ] **Step 2: Write the four schemas.**
  Read mdschema's schema reference first.
  Every listed frontmatter field is required; `date` uses the date format; `id` matches `REQ-NNNN`.

- [ ] **Step 3: Add `lint:mdschema`.**
  One `mdschema check <glob> --schema <file>` per contract.
  With file arguments, check each file against the schema whose glob it matches and ignore the rest.

- [ ] **Step 4: Write `lint/contracts`.** A POSIX shell mise file task.
  For each Markdown file under `docs/` (from arguments, or `git ls-files` when none):
  - pass if it matches a contract glob or the exemption `docs/superpowers/**`;
  - otherwise print the path and the list of valid locations, and exit 1 at the end.
  - It also enforces any strictness rule from Step 5 that mdschema could not,
    and the requirement `id` matching its filename.

- [ ] **Step 5: Prove failure.**
  Run `lint:mdschema` and `lint:contracts` over the samples.
  Expected: every valid document passes, including the one with third-level headings;
  every invalid variant fails in one of the two tasks.
  For any variant that passes both, add the rule to the script and rerun.

- [ ] **Step 6: Add `lint:shellcheck` and `fmt:shfmt`.**
  Both cover `.config/mise/tasks/**`. shfmt takes no style flags, so it reads `.editorconfig`.

- [ ] **Step 7: Prove shell checks.**
  A scratchpad script with an unquoted `$1` fails `lint:shellcheck`.
  `lint:shellcheck` and `fmt:shfmt -- --check` pass on `lint/contracts`.

- [ ] **Step 8: Run on the repository.** `mise run lint`.
      Expected: exit 0.

- [ ] **Step 9: Commit.**
      `build: add document structure contracts`

---

### Task 5: Prose lint

**Files:**

- Create: `.config/vale.ini`, `.config/vale/styles/Rustalgia/Filler.yml`, `Wordiness.yml`, `Terms.yml`
- Create: `.config/vale/styles/config/vocabularies/Rustalgia/accept.txt`
- Modify: `.config/mise.toml`

**Interfaces:**

- Produces: `lint:vale`, joined to `lint`.

- [ ] **Step 1: Write proof samples.**
  A Markdown file containing "basically" and "in order to"; a YAML file with the same words in a comment.

- [ ] **Step 2: Write `.config/vale.ini`.**
  `StylesPath = vale/styles`, `MinAlertLevel = error`, `Vocab = Rustalgia`.
  One `[*]` section: `BasedOnStyles = Rustalgia`, `Vale.Spelling = NO`.
  No packages.

- [ ] **Step 3: Write the three rules, all `level: error`.**
  - `Filler.yml`: `existence` rule.
    Tokens: basically, simply, just, very, really, actually, quite, obviously, clearly, of course, needless to say,
    it should be noted that, it is important to note that.
  - `Wordiness.yml`: `substitution` rule.
    Pairs: in order to → to; due to the fact that → because; at this point in time → now; in the event that → if;
    a number of → several; is able to → can; has the ability to → can; with regard to → about; for the purpose of → for;
    prior to → before.
  - `Terms.yml`: `substitution` rule with an empty swap map and a comment saying the glossary fills it.

- [ ] **Step 4: Add `lint:vale`.**
      With no arguments, pass every tracked file except `LICENSE` and `*.lock`.

- [ ] **Step 5: Prove failure.**
  Expected: both samples fail, and the output names `Rustalgia.Filler` and `Rustalgia.Wordiness`.

- [ ] **Step 6: Run on the repository.** `mise run lint:vale`.
  Fix findings by rewriting the sentence.
  Do not weaken a rule to make the spec or this plan pass.

- [ ] **Step 7: Commit.** `build: add prose lint`

---

### Task 6: Links

**Files:**

- Create: `.config/lychee.toml`
- Modify: `.config/mise.toml`

**Interfaces:**

- Produces: `links`, `links:offline`.

- [ ] **Step 1: Write proof samples.**
  In a throwaway directory: a Markdown file linking to a missing sibling file;
  one linking to `other.md#no-such-heading` where `other.md` exists; one linking to `https://example.invalid/`.

- [ ] **Step 2: Write `.config/lychee.toml`.**
  Fragment checking on, hidden files included, cache on with the location under `.lycheecache`, three retries,
  and `429` accepted.
  Exclude nothing else.

- [ ] **Step 3: Add the tasks.**
  Both pass `--config .config/lychee.toml`.
  `links:offline` adds `--offline`.
  `links:offline` joins `lint`; `links` does not.

- [ ] **Step 4: Prove failure.**
  `links:offline` fails the first two samples and passes the third.
  `links` fails all three.

- [ ] **Step 5: Fallback.**
  If `links:offline` misses the broken file or anchor, re-enable rumdl `MD051` and `MD057` in `.config/rumdl.toml`,
  update the single-owner table in the spec, and rerun Step 4 with `lint:rumdl`.

- [ ] **Step 6: Run on the repository.** `mise run links`.
      Expected: exit 0.

- [ ] **Step 7: Commit.** `build: add link checking`

---

### Task 7: Secrets, workflow checks, and commit messages

**Files:**

- Create: `.config/betterleaks.toml`, `.config/committed.toml`
- Modify: `.config/mise.toml`

**Interfaces:**

- Produces: `security:betterleaks`, `security:zizmor`, `security`, `lint:actionlint`, `commit-msg`, `pin`, and `check`.

- `security:betterleaks` takes an optional first argument `--range <git-range>` to scan commits instead of files.

- `commit-msg` takes one argument: a path to a file holding the message.

- [ ] **Step 1: Write proof samples.**
  A file containing a string shaped like a GitHub personal access token
  (`ghp_` plus 36 characters);
  a workflow with `uses: actions/checkout@v4`; a workflow with an undefined `needs:` target; two message files:
  `fixed stuff` and `docs: add research note`.

- [ ] **Step 2: Write `.config/betterleaks.toml`.** Extend the default rules.
      No allowlist.

- [ ] **Step 3: Add `security:betterleaks`.** Passes `--config` explicitly.
  File mode scans the given paths or the working tree; range mode scans the given commits.

- [ ] **Step 4: Add `security:zizmor` and `lint:actionlint`.** Both target `.github/workflows/`.
  Both exit 0 when that directory is absent or empty.
  `lint:actionlint` joins `lint`.

- [ ] **Step 5: Write `.config/committed.toml`.** `style = "conventional"`.
  Add `commit-msg`, which runs `committed --config .config/committed.toml --commit-file <path>`.

- [ ] **Step 6: Add `pin`.** Runs `pinact run`.
      Not part of `check`.

- [ ] **Step 7: Add `check`.**
      Depends on `fmt:check`, `lint`, `links`, `security`.

- [ ] **Step 8: Prove failure.**
  The fake token fails `security:betterleaks`.
  The unpinned workflow fails `security:zizmor`.
  The broken `needs:` fails `lint:actionlint`.
  `fixed stuff` fails `commit-msg`; the conventional message passes.

- [ ] **Step 9: Prove the empty case.**
  With no `.github/workflows/`, `security:zizmor` and `lint:actionlint` exit 0.

- [ ] **Step 10: Run on the repository.** `mise run check`.
      Expected: exit 0.

- [ ] **Step 11: Commit.**
      `build: add secret, workflow, and commit-message checks`

---

### Task 8: Git hooks

**Files:**

- Modify: `.config/lefthook.yml` (replace the example comments entirely), `.config/mise.toml`

**Interfaces:**

- Consumes: every task name from Tasks 2 to 7.

- [ ] **Step 1: Read the lefthook 2.1 and 2.2 changelogs.**
  If a newer feature expresses "sequential groups, parallel members" better than `group`,
  use it and say so in the commit body.

- [ ] **Step 2: Write `.config/lefthook.yml` to this shape.**

```yaml
pre-commit:
  piped: true
  jobs:
    - name: format
      group:
        parallel: true
        jobs:
          - name: rumdl
            glob: "*.md"
            run: mise run fmt:rumdl -- {staged_files}
            stage_fixed: true
          # dprint (yml, yaml, json, jsonc, toml) and shfmt (.config/mise/tasks/**) follow the same pattern
    - name: lint
      group:
        parallel: true
        jobs: [] # one job per lint:* task, plus links:offline, each with the glob its tool applies to
    - name: security
      group:
        parallel: true
        jobs: [] # security:betterleaks on all staged files; security:zizmor on .github/workflows/**
commit-msg:
  jobs:
    - run: mise run commit-msg -- {1}
pre-push:
  jobs:
    - name: check
      run: mise run check
    - name: secrets-in-range
      run: mise run security:betterleaks -- --range {push_range}
    # reserved: unit tests, dependency vulnerability scan
```

Fill in every job.
Use the placeholder lefthook documents for the pushed commit range; if there is none,
compute it in the task from the upstream branch, falling back to `origin/main..HEAD`.

- [ ] **Step 3: Install hooks on `mise install`.**
  Add a mise `postinstall` hook that runs `lefthook install`.
  Run it once now.

- [ ] **Step 4: Prove pre-commit blocks.**
  On a throwaway branch, stage the misspelling sample as `docs/research/typo.md` and commit.
  Expected: the commit is refused and the security group does not run.

- [ ] **Step 5: Prove formatting is re-staged.**
  Stage a valid research note with a 200-character line.
  Expected: the commit succeeds and the committed file has no line over 120.

- [ ] **Step 6: Prove spaces in filenames.**
  Stage a valid research note named `docs/research/two words.md`.
  Expected: the commit succeeds, and each lint job's output shows that one file.

- [ ] **Step 7: Prove commit-msg blocks.**
  Commit a clean change with the message `fixed stuff`.
  Expected: refused.

- [ ] **Step 8: Prove pre-push runs.** Run `lefthook run pre-push`.
      Expected: `check` runs and exits 0.

- [ ] **Step 9: Delete the throwaway branch, then commit on the working branch.** `build: add git hooks`

---

### Task 9: CI, Dependabot, and the pull request

**Files:**

- Create: `.github/workflows/ci.yml`, `.github/workflows/links.yml`, `.github/dependabot.yml`
- Modify: `README.md`

**Interfaces:**

- Consumes: `fmt:check`, `lint`, `links`, `security`, `security:betterleaks -- --range`, `commit-msg`.
- Produces: a status check named `gate`, required by Task 10.
- [ ] **Step 1: Write `ci.yml`.**
  - Triggers: `pull_request` with types `opened`, `synchronize`, `reopened`, `edited`; `push` to `main`.
  - Top level: `permissions: contents: read`; concurrency grouped by ref, cancelling superseded runs.
  - Jobs `format`, `lint`, `links`, `security`: check out with full history and no persisted credentials,
    install with `jdx/mise-action`, run the matching task.
    `security` also runs `mise run security:betterleaks -- --range <base>..<head>` on pull requests.
  - Job `pr-title`: on pull requests, write the title to a file from an `env:` variable
    and run `mise run commit-msg -- <file>`.
    On other events the step exits 0.
    The title never appears inside a `run:` script as a `${{ }}` expression.
  - Job `gate`: `needs` all five, `if: always()`, and this step:

```yaml
- name: Require every job to have succeeded
  env:
    RESULTS: ${{ join(needs.*.result, ' ') }}
  run: |
    for result in $RESULTS; do
      if [ "$result" != "success" ]; then
        echo "A required job did not succeed: $RESULTS"
        exit 1
      fi
    done
```

- [ ] **Step 2: Write `links.yml`.**
  Weekly `schedule` plus `workflow_dispatch`; one job running `mise run links`; `permissions: contents: read`.

- [ ] **Step 3: Write `dependabot.yml`.**
      Ecosystem `github-actions`, weekly, commit message prefix `ci`.

- [ ] **Step 4: Pin and check.**
  Run `mise run pin`, then `mise run check`.
  Expected: every `uses:` is a commit SHA with a version comment; `lint:actionlint` and `security:zizmor` exit 0.

- [ ] **Step 5: Add a "Development" section to `README.md`.**
  Three facts: run `mise install` once; run `mise run check` before pushing; `mise run fmt` fixes formatting.

- [ ] **Step 6: Commit and open the pull request.**
  Commit as `ci: add documentation checks`.
  Push the branch and open a pull request titled `build: add documentation tooling`.
  Ask the owner before pushing.

- [ ] **Step 7: Prove CI passes.** Expected: all six jobs succeed.

- [ ] **Step 8: Prove `gate` fails on a failed job.**
  On a second branch, add a misspelling through the GitHub API,
  so the commit never passes through a local hook and `--no-verify` is not needed.
  Open a pull request.
  Expected: `lint` fails and `gate` fails.

- [ ] **Step 9: Prove `gate` fails on a skipped job.**
  On the same second branch, add `if: false` to the `links` job.
  Expected: `links` is skipped and `gate` fails.
  Close this pull request without merging.

- [ ] **Step 10: Prove a read-only token is enough.**
  Confirm from the run logs that no job used a secret or a write permission.

- [ ] **Step 11: Hand the tooling pull request to the owner to merge.**

---

### Task 10: GitHub settings

**Files:** none.
This task changes repository settings through the GitHub API.

**Interfaces:**

- Consumes: the `gate` check, which must have run at least once on `main`.

- [ ] **Step 1: Show the owner every payload below and wait for a yes.**

- [ ] **Step 2: Repository settings.**
      `PATCH /repos/jsamuelsen11/rustalgia-emu`

```json
{
  "allow_squash_merge": true,
  "allow_merge_commit": false,
  "allow_rebase_merge": false,
  "squash_merge_commit_title": "PR_TITLE",
  "squash_merge_commit_message": "PR_BODY",
  "delete_branch_on_merge": true,
  "security_and_analysis": {
    "secret_scanning": { "status": "enabled" },
    "secret_scanning_push_protection": { "status": "enabled" }
  }
}
```

- [ ] **Step 3: Dependabot alerts.**
      `PUT /repos/jsamuelsen11/rustalgia-emu/vulnerability-alerts`

- [ ] **Step 4: Actions permissions.**
  - `PUT .../actions/permissions/workflow` with `default_workflow_permissions: read`
    and `can_approve_pull_request_reviews: false`.
  - Require approval for workflow runs from all outside contributors.
    Find the current endpoint in the GitHub REST documentation; if there is none,
    give the owner the exact settings page and option.

- [ ] **Step 5: Limit pull requests to collaborators.**
  Check the GitHub documentation for this setting.
  If it exists for a public personal repository, show the owner the call and apply it.
  If not, tell the owner and record that in the spec.

- [ ] **Step 6: Create the ruleset.**
      `POST /repos/jsamuelsen11/rustalgia-emu/rulesets`

```json
{
  "name": "main",
  "target": "branch",
  "enforcement": "active",
  "bypass_actors": [],
  "conditions": { "ref_name": { "include": ["~DEFAULT_BRANCH"], "exclude": [] } },
  "rules": [
    { "type": "deletion" },
    { "type": "non_fast_forward" },
    { "type": "required_linear_history" },
    {
      "type": "pull_request",
      "parameters": {
        "required_approving_review_count": 0,
        "dismiss_stale_reviews_on_push": false,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_review_thread_resolution": false,
        "allowed_merge_methods": ["squash"]
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "strict_required_status_checks_policy": true,
        "required_status_checks": [{ "context": "gate" }]
      }
    }
  ]
}
```

- [ ] **Step 7: Prove direct pushes are refused.**
  From a clean `main`, attempt `git push origin main` with an empty commit.
  Expected: rejected by the ruleset.
  Reset the local commit.

- [ ] **Step 8: Prove a failing pull request cannot merge.**
  Open a pull request that adds a misspelling through the GitHub API.
  Expected: the merge button is blocked while `gate` is failing.
  Close it.

- [ ] **Step 9: Read the settings back.**
  `GET` the repository, the ruleset, and the Actions permissions.
  Expected: every value matches the payloads.
  Report the result to the owner.
