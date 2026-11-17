# Example design

- **Date:** 2026-11-17
- **Status:** Draft, awaiting owner approval
- **Scope:** One line on what this design covers

This file is the template for a design.
A design records what to build and why, for a change to the repository itself, as agreed with the owner.
Nothing is built until the owner approves it.
The examples below are illustrative.

To use this template:

1. A design is written at the end of a brainstorming conversation with the owner, not before it.
2. Copy this file to `docs/designs/YYYY-MM-DD-<topic>-design.md`, using the day the design was started.
3. Replace the guidance in every section with your content.
   Designs have no structure contract, so add sections the work needs; do not drop the ones below.
4. Delete everything between the three lines under the title and the "Intent" heading.
5. Mark each item the author decided with **(call)**.
   Unmarked items were decided by the owner.
6. Run `mise run check`.

The status line has three values: "Draft, awaiting owner approval", "Approved", and "Superseded by" with a path.
A design is kept current: when the thing it describes changes, the design changes in the same pull request.

## Intent

**Purpose:** say what problem this solves and why it matters, in the owner's terms.

**Write:** the situation, the problem, and what success looks like to the owner.

**Leave out:** the solution.

**Length:** one or two short paragraphs.

**Example:**

> AI agents write the documents and the owner reviews them.
> The tooling must catch everything a machine can catch, so review time goes to substance.

## Goals

**Purpose:** list what must be true when the work is done.

**Write:** one bullet for each outcome, each one checkable.

**Leave out:** tasks and tools.
A goal is a result, not a step.

**Length:** three to seven bullets.

**Example:**

> - Every check has one definition, used identically by local hooks and CI.
> - A document that breaks its type's structure cannot reach `main`.

## Non-goals

**Purpose:** name what this work deliberately does not do.

**Write:** each thing a reader might assume is included and is not.

**Leave out:** things nobody would assume.

**Length:** two to six bullets.

**Example:**

> - Rust, application, or build tooling.
> - Document or section word limits.

## Anti-goals

**Purpose:** name the outcomes that would make the work a failure even if it technically works.

**Write:** each outcome to avoid, in a form that can be checked.

**Leave out:** general cautions with no test.

**Length:** two to five bullets.

**Example:**

> - A check that exists in a hook but not in CI, or the reverse.
> - A gate that has never been shown to fail.

## Design

**Purpose:** describe what will be built, in enough detail that a builder never has to ask the owner.

**Write:**

- One subsection for each part of the solution.
- The decisions, with their reasons.
  Mark the author's own decisions with **(call)**.
- Tables for mappings, such as which tool does which job.
  A Mermaid diagram for flows.
- Known limits, stated plainly.

**Leave out:** step-by-step instructions.
Those go in the plan.

**Length:** as long as the decisions need.
Each decision is stated once.

**Example:**

> ### Single owners
>
> Each rule has one owner.
> The overlapping rule in the other tool is switched off.
>
> **(call)** External links are checked at push and in CI, not at commit.

## Proof

**Purpose:** say how we will know it works.

**Write:** what will be demonstrated, including what must be shown to fail.

**Leave out:** the commands.
Those go in the plan.

**Length:** a short list.

**Example:**

> - Each check is fed a deliberately broken sample and must reject it.
> - A pull request with a failing check cannot be merged.

## Left to the builder

**Purpose:** mark the choices the builder is free to make.

**Write:** each open choice, so the builder knows it is theirs and need not ask.

**Leave out:** anything the owner would want a say in.
That belongs in the Design section.

**Length:** a short list.
Write "Nothing" if every choice is made.

**Example:**

> - Cache locations, and the matching `.gitignore` entries.
> - Splitting the work into one pull request or several.
