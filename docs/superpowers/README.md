# Superpowers documents

## Purpose

This folder holds the working documents for changes to the repository itself, such as its tooling.
They come from the brainstorm, plan, and build workflow that the AI agent follows.
They record why something was built the way it was and how it was built.

Product knowledge does not go here.
Research, requirements, decisions, and roadmaps have their own folders.

## Layout

| Folder | Holds | Written |
|---|---|---|
| `specs/` | Designs: what to build and why, as agreed with the owner | Before any work starts |
| `plans/` | Implementation plans: the tasks and checks that carry out a design | After the design is approved |

Each plan names the design it implements.

## Conventions

- Files are named `YYYY-MM-DD-<topic>-design.md` for a design and `YYYY-MM-DD-<topic>.md` for a plan.
  The date is the day the document was started.
- These documents are exempt from structure contracts, because their shape follows the workflow that produces them.
  Every other check still applies: formatting, line length, spelling, prose, and links.
- A design is kept current.
  When the thing it describes changes, the design is updated in the same pull request.
- A plan is a record.
  Once its work is merged it is not updated, and its unticked checkboxes are left as they were.
- In a design, an item marked **(call)** was decided by the author.
  Everything else was decided by the owner.
