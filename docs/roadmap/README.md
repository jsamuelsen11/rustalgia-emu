# Roadmaps

## Purpose

A roadmap lists work to be done, in order, with what each piece depends on.
It answers "what is next, and what is blocking it".
It does not hold findings or decisions; those go in research notes, requirements, and ADRs.

## Layout

| File | Covers |
|---|---|
| [research.md](research.md) | Everything to learn before requirements and architecture are written |

Later roadmaps, such as development and release, are added as their own files.

Every roadmap has the same sections, in this order:

| Section | Holds |
|---|---|
| Goal | What is true when the roadmap is finished |
| Scope | What the roadmap covers, and how its items work |
| Milestones | The phases and their items |
| Out of scope | What the roadmap deliberately leaves out |
| Risks and open questions | What could go wrong, and what is not yet known |

## Conventions

### Frontmatter

| Field | Value |
|---|---|
| `title` | The roadmap's name |
| `status` | `draft`, `approved`, `completed`, or `superseded` |
| `date` | The day the roadmap was given its current status |

The status values are defined in [the documentation guide](../README.md#status).
For a roadmap they mean:

- `draft`: the plan is still being shaped.
  Do not start work from it.
- `approved`: the owner has accepted the plan.
  Work follows it.
- `completed`: every item is done.
- `superseded`: a newer roadmap replaces it.

### Items

- Each item is one line with a checkbox and a stable ID, such as `R1-32`.
- The letter names the roadmap and the first digit names the phase.
  `R` is the research roadmap.
- IDs are never reused or renumbered.
  A dropped item is struck through, not deleted.
- An item names the items it depends on.
  It starts only when they are done.
- An item is ticked in the same pull request that delivers its output.

### Changing an approved roadmap

Adding, dropping, or reordering items is a normal pull request; the roadmap stays `approved`.
A change to the Goal or the Scope means a new roadmap, and the old one becomes `superseded`.
