# Plans

## Purpose

A plan breaks an approved design into tasks, each with the checks that prove it works.
It is what the builder follows, and afterwards it is the record of how the work was done.

## Layout

One file for each plan.
Each plan names the design it implements, in [`docs/designs/`](../designs/README.md).

## Conventions

- Files are named `YYYY-MM-DD-<topic>.md`.
  The date is the day the plan was started.
- Plans are exempt from structure contracts, because their shape follows the workflow that produces them.
  Every other check still applies: formatting, line length, spelling, prose, and links.
- A plan is a record.
  Once its work is merged it is not updated, and its unticked checkboxes are left as they were.
- Plans come from the writing-plans skill of the Superpowers plugin for Claude Code.
  The skill's default folder is `docs/superpowers/plans/`; this repository uses `docs/plans/` instead.
