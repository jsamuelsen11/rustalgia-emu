---
title: Run every check as a mise task
status: draft
date: 2026-11-17
---

# Run every check as a mise task

This file is the template for an architecture decision record (ADR).
An ADR records one decision that is hard to reverse, the options that were weighed, and what follows from it.
The examples below are illustrative and describe this repository's tooling.

To use this template:

1. Copy this file to `docs/adr/NNNN-<slug>.md`.
   `NNNN` is the next unused four-digit number, starting at `0001`.
   The slug is the title in lower case with hyphens, such as `0001-run-every-check-as-a-mise-task.md`.
2. Fill in the frontmatter.
   No other fields are allowed.
3. Replace the guidance in every section with your content.
   Keep the headings and their order.
4. Delete everything between the title and the first section heading.
5. Run `mise run check`.

| Field | Rule |
|---|---|
| `title` | The decision, as a statement starting with a verb. The same text as the heading above. |
| `status` | `draft` when you open the pull request. Only the owner sets `approved` or `rejected`. |
| `date` | The day the status last changed, as `YYYY-MM-DD`. |

One ADR records one decision.
If you are deciding two things, write two ADRs.
An approved ADR is never rewritten.
A new ADR replaces it, and the old one becomes `superseded`.

## Context

**Purpose:** let a reader who was not there understand why a decision was needed.

**Write:**

- The problem, in one or two sentences.
- Why it must be decided now, and what is blocked until it is.
- Each constraint an answer must satisfy, with the path of the requirement or research note it comes from.
- What is already decided and is not being reopened.

**Leave out:** the options, your preference, and any history that does not change the choice.

**Length:** two or three short paragraphs, or one paragraph and a list of constraints.

**Example:**

> Checks run in two places: git hooks on a developer's machine, and CI on every pull request.
> If the two run different commands, a change can pass locally and fail in CI, or the reverse.
> The first hooks cannot be written until this is settled.
>
> Constraints:
>
> - Every check has one definition (`docs/designs/2026-11-16-docs-tooling-design.md`, Goals).
> - Tool versions are pinned in one place.
> - Configuration stays in `.config/`.

## Options considered

**Purpose:** show that real alternatives were weighed, and on what evidence.

**Write:** one subsection for each option, with the option's name as its heading.
Include "do nothing" when that is a real possibility.
Give every option the same four parts: what it is, for, against, and evidence.

**Leave out:** options nobody would choose, listed only to be knocked down.
Two real options is the minimum.

**Length:** four short bullets for each option.

**Example:**

### Call each tool directly from the hooks and from CI

- **What:** `lefthook.yml` and the workflow each contain the full command for every tool.
- **For:** nothing extra to learn; each file can be read on its own.
- **Against:** every command and flag exists twice, so the two copies drift.
- **Evidence:** the constraint "every check has one definition" rules this out.

### Define each check as a mise task, and call the tasks

- **What:** each check is a task in `.config/mise.toml`.
  Hooks and CI run `mise run <task>` and nothing else.
- **For:** one definition for each check; the tool versions come from the same file.
- **Against:** one more layer to read through when a check fails.
- **Evidence:** a trial showed that inline tasks cannot receive file arguments, so tasks must be script files.

## Decision

**Purpose:** state the choice so that it cannot be misread.

**Write:**

- The chosen option, in one sentence that starts with "We will".
- The deciding factors, most important first.
- What would have to change for this decision to be revisited.

**Leave out:** a repeat of the options, and anything that is a consequence instead of a reason.

**Length:** one sentence, then two to four bullets.

**Example:**

> We will define every check as a mise task and call only those tasks from hooks and CI.
>
> - It is the one option that gives each check a single definition.
> - Tool versions and tasks live in the same file, so they cannot disagree.
>
> Revisit this if mise can no longer run on one of the platforms we build on.

## Consequences

**Purpose:** make the costs visible, so nobody is surprised by them later.

**Write:**

- What becomes easier.
- What becomes harder, and what we give up.
- The work this creates: documents to update, requirements to write, decisions that now need making.
- Each risk, and the sign that would tell us it has arrived.

**Leave out:** benefits already given as reasons in the Decision section.

**Length:** four to eight bullets.
Include at least one cost; a decision with no cost has not been examined.

**Example:**

> - Easier: adding a check means adding one task and listing it in one aggregate.
> - Harder: a failing check is read through `mise run`, which adds a line of output to interpret.
> - Work created: each tool needs a task script under `.config/mise/tasks/`.
> - Risk: a contributor calls a tool directly in a workflow.
>   Sign: a `run:` line that does not start with `mise run`.
