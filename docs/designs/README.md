# Designs

## Purpose

A design records what to build and why, as agreed with the owner, for a change to the repository itself.
The tooling that checks these documents is one example.
A design is written before any work starts, and nothing is built until the owner approves it.

Product knowledge does not go here.
Research, requirements, decisions, and roadmaps have their own folders.

## Layout

One file for each design.
The plan that carries it out is in [`docs/plans/`](../plans/README.md).

## Conventions

- Files are named `YYYY-MM-DD-<topic>-design.md`.
  The date is the day the design was started.
- Designs are exempt from structure contracts, because their shape follows the workflow that produces them.
  Every other check still applies: formatting, line length, spelling, prose, and links.
- A change to a design's intent or goals is a new design; the old one is marked as superseded.
- A design is kept current.
  When the thing it describes changes, the design is updated in the same pull request.
- An item marked **(call)** was decided by the author.
  Everything else was decided by the owner.
- Designs come from the brainstorming skill of the Superpowers plugin for Claude Code.
  The skill's default folder is `docs/superpowers/specs/`; this repository uses `docs/designs/` instead.
