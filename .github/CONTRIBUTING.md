# Contributing to Rustalgia

Rustalgia is in its planning phase.
Most contributions right now are documents: research, requirements, architecture decisions, and roadmaps.

## Before you start

- Search the issues for existing work on the same topic.
- Open an issue before a large change, so the direction is agreed before the work is done.
- Read the Development section of the [README](../README.md) for setup, tasks, and checks.

## Legal ground rules

These protect the project and are not negotiable.

- Never commit, attach, or link ROMs, BIOS files, firmware, encryption keys, save states, memory dumps,
  or other copyrighted material.
- Never copy code from another emulator or from leaked sources.
  Describe behaviour from public documentation, hardware tests, and your own observation.
- Cite your sources in research notes.
- Your contribution is licensed under the [GNU General Public License v3.0](../LICENSE).

## Making a change

1. Create a branch from `main`.
2. Run `mise install` once to install the tools and the git hooks.
3. Make the change.
   Put new documents in the folder for their type; each type has a structure contract.
4. Run `mise run check`.
5. Open a pull request and fill in the template.

Commit messages and pull request titles follow [Conventional Commits](https://www.conventionalcommits.org/).
Pull requests are squash-merged, so the title becomes the commit on `main`.

## What a good pull request looks like

- One logical change.
  Split unrelated work into separate pull requests.
- A summary that says what changed and why.
- Evidence that it works, or a clear statement of what was not verified.
- An ADR for any decision that is hard to reverse.

## Reporting problems

Use the issue templates.
Report security vulnerabilities privately, as described in the [security policy](SECURITY.md).
