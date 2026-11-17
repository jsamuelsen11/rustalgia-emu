# Example Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL:
> use superpowers:subagent-driven-development (recommended)
> or superpowers:executing-plans to implement this plan task-by-task.
> Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** One sentence on what this plan builds.

**Architecture:** Two or three sentences on the approach.

**Tech Stack:** The tools and libraries the work uses.

**Spec:** `docs/designs/YYYY-MM-DD-<topic>-design.md`

This file is the template for an implementation plan.
A plan breaks an approved design into tasks, each with the checks that prove it works.
It is written for a builder who has seen neither the repository nor the design.

To use this template:

1. Write a plan only after its design is approved.
   The writing-plans skill produces it.
2. Copy this file to `docs/plans/YYYY-MM-DD-<topic>.md`, using the day the plan was started.
3. Replace the guidance in every section with your content.
4. Delete this explanation, from "This file is the template" to the "Global Constraints" heading.
5. Run `mise run check`.

A plan is a record.
Once its work is merged it is not updated, and its unticked checkboxes are left as they were.

## Global Constraints

**Purpose:** carry the design's project-wide rules, so every task inherits them.

**Write:** one line for each rule, with exact values copied from the design.

**Leave out:** rules that apply to one task.
Those go in that task.

**Length:** as many lines as there are rules.

**Example:**

> - Config lives in `.config/` unless the tool cannot read it from there.
> - No line in any tracked text file exceeds 120 characters.

## Review Focus

**Purpose:** point the final reviewer at what the tasks' own checks are weakest on.

**Write:** up to five inputs or conditions the design implies but no task tests directly, most likely first.
For each, name the input and the behaviour a reasonable person would expect,
then add its check to the task that owns it.

**Leave out:** anything a task already proves.

**Length:** up to five numbered lines.

**Example:**

> 1. **Filenames with spaces.**
>    A staged file with a space in its name must reach each tool as one argument.

## File Structure

**Purpose:** fix which files exist and what each is responsible for, before the tasks are written.

**Write:** a table of every file created or changed, with its one responsibility.
List any names that later tasks rely on, such as task or function names.

**Leave out:** file contents.

**Length:** one row for each file.

**Example:**

| Path | Responsibility |
|---|---|
| `.config/mise.toml` | Tool versions and every task |
| `.config/lefthook.yml` | Hooks; calls mise tasks only |

## Tasks

**Purpose:** give the builder the whole job as small, checkable pieces.

**Write:** one subsection for each task, in the order they are done.
Each task has:

- **Files:** the exact paths it creates or changes.
- **Interfaces:** what it uses from earlier tasks, and what later tasks rely on from it.
- **Steps:** checkbox lines, each one action with a result that can be checked.
  Write the failing check first, then the change, then the check passing, then the commit.
- For every step that runs a command, the command and the output that means it passed.

**Leave out:** code the builder can write from the signature and the test, and steps that decide nothing.

**Length:** a task is the smallest unit with its own check.
A plan several times longer than its design is too long.

**Example:**

### Task 1: Link checking

**Files:**

- Create: `.config/lychee.toml`
- Modify: `.config/mise.toml`

**Interfaces:**

- Produces: the `links` and `links:offline` tasks.
- [ ] **Step 1: Write proof samples.**
      A file linking to a missing sibling, and one linking to a missing heading.
- [ ] **Step 2: Add the tasks.**
      Both pass `--config .config/lychee.toml`.
- [ ] **Step 3: Prove failure.**
      Run `mise run links:offline` on each sample.
      Expected: non-zero exit for both.
- [ ] **Step 4: Run on the repository.** `mise run links`.
      Expected: exit 0.
- [ ] **Step 5: Commit.** `build: add link checking`
