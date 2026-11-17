---
title: Example roadmap
status: draft
date: 2026-11-17
---

# Example roadmap

This file is the template for a roadmap.
A roadmap lists work to be done, in order, with what each piece depends on.
It holds no findings and no decisions; it points to the documents that do.
The examples below are illustrative.

To use this template:

1. Copy this file to `docs/roadmap/<name>.md`.
   The name is one or two words in lower case, such as `development.md`.
2. Choose a letter for the item IDs that no other roadmap uses.
   The research roadmap uses `R`.
3. Fill in the frontmatter.
   No other fields are allowed.
4. Replace the guidance in every section with your content.
   Keep the headings and their order.
5. Delete everything between the title and the "Goal" heading.
6. Add the new roadmap to the table in `docs/roadmap/README.md`.
7. Run `mise run check`.

| Field | Rule |
|---|---|
| `title` | The roadmap's name, ending in "roadmap". The same text as the heading above. |
| `status` | `draft` when you open the pull request. Only the owner sets `approved`. |
| `date` | The day the status last changed, as `YYYY-MM-DD`. |

The other status values, and who sets each one, are defined under "Status" in `docs/README.md`.

## Goal

**Purpose:** say what is true when the roadmap is finished.

**Write:** the end state, as something that can be checked, and the reason it matters.

**Leave out:** how the work will be done, and goals that belong to a later roadmap.

**Length:** two to four sentences.

**Example:**

> Every requirement for the first release is written, reviewed, and approved.
> It ends when a developer can start building from the requirements without asking what was meant.

## Scope

**Purpose:** set what the roadmap covers, and how its items work.

**Write:**

- What is covered, as a short list.
- A "How items work" subsection: what one item produces, where the output goes, what "done" means,
  and when an item may start.

**Leave out:** the items themselves.

**Length:** one list for what is covered, and four to six bullets for how items work.

**Example:**

> - Requirements for the emulation core, the user interface, and each host platform.
>
> How items work:
>
> - Each item produces one requirement in `docs/requirements/`.
> - An item is done when its requirement is merged with the status `approved`.
> - An item starts only when the items it depends on are done.

## Milestones

**Purpose:** list the work, in the order it can be done.

**Write:**

- One subsection for each phase, with a heading in the form "Phase N: name".
- Under each phase, one line saying when the phase is done.
- One checkbox line for each item: its ID in bold, what it delivers, and "Depends on" with the IDs it needs.

An ID is the roadmap's letter, the phase number, a hyphen, and two digits, such as `D1-03`.
IDs are never reused or renumbered.
A dropped item is struck through, not deleted.

**Leave out:** dates and estimates, unless the owner asks for them.
Order and dependencies carry the plan.

**Length:** one line for each item.
An item that needs a paragraph is too big; split it.

**Example:**

### Phase 1: core requirements

Done when every item that has not been dropped is done.

- [ ] **D1-01** Requirements for save states.
- [ ] **D1-02** Requirements for rewind.
      Depends on D1-01.
- [ ] ~~**D1-03** Requirements for a feature that was dropped.~~

## Out of scope

**Purpose:** stop the roadmap growing by naming what it will not do.

**Write:** each thing a reader might expect to find here and will not, with where it belongs instead.

**Leave out:** things nobody would expect.

**Length:** three to six bullets.

**Example:**

> - Choosing an architecture.
>   That follows the requirements, in ADRs.
> - Requirements for releases after the first.
>   They get their own roadmap.

## Risks and open questions

**Purpose:** show what could derail the plan, and what is not yet known.

**Write:** one bullet for each risk, with the item or rule that deals with it,
and one bullet for each open question about the roadmap itself.

**Leave out:** risks to the product.
Those belong in research notes and ADRs.

**Length:** three to eight bullets.

**Example:**

> - **Requirements may conflict.**
>   The last phase includes a review that looks for conflicts.
> - Should host platforms each get their own phase?
>   Decide after phase 1.
