---
id: REQ-0000
title: Save the full machine state at any moment
level: high
priority: must
status: draft
date: 2026-11-17
---

# Save the full machine state at any moment

This file is the template for a requirement.
A requirement states one thing Rustalgia must do or be, in a way that can be tested.
The example below is illustrative; it is not an accepted requirement.

To use this template:

1. Copy this file to `docs/requirements/REQ-NNNN-<slug>.md`.
   `NNNN` is the next unused four-digit number.
   The slug is a short form of the title in lower case with hyphens, such as `REQ-0001-save-state-any-moment.md`.
2. Fill in the frontmatter.
   No other fields are allowed, and `id` must match the filename.
3. Replace the guidance in every section with your content.
   Keep the headings and their order.
4. Delete everything between the title and the first section heading.
5. Run `mise run check`.

| Field | Rule |
|---|---|
| `id` | `REQ-NNNN`, the same as the start of the filename. Never reused, even if the requirement is retired. |
| `title` | What the system does, starting with a verb. The same text as the heading above. |
| `level` | `high` for what a user or the project needs. `low` for a technical detail that serves a high one. |
| `priority` | `must`, `should`, or `could`, as defined below the table. |
| `status` | `draft` when you open the pull request. Only the owner sets `approved` or `rejected`. |
| `date` | The day the status last changed, as `YYYY-MM-DD`. |

The other status values, and who sets each one, are defined under "Status" in `docs/README.md`.

Priority values:

- `must`: the product fails without it.
- `should`: important, but a release can ship without it.
- `could`: wanted if it is cheap.

One requirement per file.
If the statement contains "and", it is probably two requirements.

## Statement

**Purpose:** say exactly what is required.

**Write:** one sentence in the form "Rustalgia must ...", "should ...", or "could ...", matching the priority.
State what happens, not how it is built.
Give a number wherever one applies.

**Leave out:** the reason, the design, and words that cannot be tested, such as `fast`, `robust`, or `user-friendly`.

**Length:** one sentence.
A second is allowed only to define a term.

**Example:**

> Rustalgia must be able to save the complete state of a running game within 50 milliseconds of a request,
> at any point during play, and restore it to continue with identical behaviour.

## Rationale

**Purpose:** let a later reader judge whether the requirement still holds.

**Write:**

- Who needs this, and what goes wrong without it.
- The path of each research note, roadmap item, or higher requirement it comes from.

**Leave out:** how it will be built, and benefits that are not the reason for the requirement.

**Length:** two to four sentences, or a short list.

**Example:**

> A phone can suspend an app at any moment, and the player expects to resume where they stopped.
> Rewind and replaying recorded input for tests both depend on the same ability.
> Source: `docs/research/topics/R2-08-save-states.md`.

## Acceptance criteria

**Purpose:** define the tests that prove the requirement is met.

**Write:** a list where each item is one check with a pass or fail result.
Use the form "Given ..., when ..., then ...".
Cover the normal case, the limits, and at least one failure case.

**Leave out:** criteria that need judgement to assess, and steps that describe the implementation.

**Length:** three to seven items.
If you need more, the requirement is too large; split it.

**Example:**

> - Given a running game, when a save is requested, then a state is produced within 50 milliseconds.
> - Given a saved state, when it is restored and the same input is replayed, then every later frame is identical.
> - Given a state saved on one platform, when it is restored on another, then the game continues identically.
> - Given a damaged state file, when it is restored, then the game keeps running and the player is told why.

## Dependencies

**Purpose:** show what must exist first, and what relies on this.

**Write:** the ids of the requirements this one depends on, and of those that depend on it, with one line on each link.
Delete this section if there are none.

**Length:** one line for each link.

**Example:**

> - Needs `REQ-0003`: emulation is deterministic for a given input.
> - Needed by `REQ-0011`: rewind.

## Notes

**Purpose:** hold what a reader needs that fits nowhere else.

**Write:** open questions, known limits, and terms defined in the glossary.
Delete this section if it would be empty.

**Leave out:** design ideas.
They belong in an ADR.

**Length:** a few lines.

**Example:**

> - Open: whether the 50 millisecond limit can hold for systems with large memory.
> - "State" is defined in the glossary.
