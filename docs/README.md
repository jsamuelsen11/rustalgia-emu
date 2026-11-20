# Documentation

## Purpose

This folder holds everything Rustalgia knows and has decided.
AI agents write the documents; the owner reviews and approves them.

## Layout

| Folder | Holds | Guide |
|---|---|---|
| `roadmap/` | What we plan to do, and in what order | [roadmap/README.md](roadmap/README.md) |
| `research/emulators/` | Studies of existing emulators | |
| `research/topics/` | Studies of hardware, techniques, platforms, and policy | [research/topics/README.md](research/topics/README.md) |
| `research/spikes/` | Reports on throwaway experiments | |
| `requirements/` | One requirement per file | |
| `adr/` | Architecture decision records | [adr/README.md](adr/README.md) |
| `designs/` | Designs for work on the repository itself: what to build and why | [designs/README.md](designs/README.md) |
| `plans/` | Implementation plans that carry out a design | [plans/README.md](plans/README.md) |
| `assets/` | Images used by the README and the documents | |

A folder gets a guide when its first document is added.

Every document folder has a `_template.md`.
Copy it to start a new document; it explains each field and section and gives an example of each.

## Conventions

### Structure contracts

Every document under `docs/` must match the structure contract for its type.
A contract fixes the folder, the filename pattern, the frontmatter fields, and the order of the sections.
The contracts live in `.config/mdschema/`, and `mise run lint:contracts` checks them.
`docs/designs/` and `docs/plans/` are exempt, apart from their guides.

### Status

Every document type uses the same words for the same states.

| Status | Meaning | Who sets it |
|---|---|---|
| `draft` | Being written or awaiting review. Do not rely on it. | The author |
| `approved` | The owner has reviewed and accepted it. It is the current truth. | The owner, by merging |
| `rejected` | Considered and turned down. Kept so the question is not reopened blindly. | The owner |
| `completed` | The work it describes is finished. | The author, when the last item is done |
| `superseded` | Replaced by a newer document, which it links to. | The author of the replacement |
| `retired` | No longer applies, and nothing replaces it. | The owner |

Which statuses a type may use:

| Type | `draft` | `approved` | `rejected` | `completed` | `superseded` | `retired` |
|---|---|---|---|---|---|---|
| Research note | yes | yes | | | yes | |
| Requirement | yes | yes | yes | | yes | yes |
| ADR | yes | yes | yes | | yes | yes |
| Roadmap | yes | yes | | yes | yes | |

A document moves forward only: `draft` to `approved`, then to an end state.
An approved document that needs a material change is replaced by a new one, and the old one becomes `superseded`.
Small corrections to an approved document are made in place.

### Dates

The `date` field is the day the document was last given its current status, written as `YYYY-MM-DD`.
