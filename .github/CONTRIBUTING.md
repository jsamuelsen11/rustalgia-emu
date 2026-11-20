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

## How work flows

AI agents write this repository, and the owner decides.
The templates are built for that: an agent writes for a reviewer who is short of time,
and the owner briefs an agent that starts with no memory.

1. The owner opens a **task** issue.
   It states the outcome, the acceptance criteria, what is out of scope, and when to stop and ask.
2. The owner adds the `agent-ready` label.
   No agent starts on an issue without it.
3. The agent works on a branch and opens a pull request that follows the template.
   A pull request opened through the API does not receive the template, so the agent reads the file and follows it.
4. When a choice belongs to the owner, the agent does not make it.
   It opens a **decision** issue, or lists the question under "Decisions for you" in the pull request,
   and carries on with whatever does not depend on the answer.
5. The owner reviews and merges.
   Nothing reaches `main` any other way, and no agent approves or merges a pull request.

An agent that opens an issue through the API writes the same headings as the matching form.

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

- One logical change, with a purpose that fits in one sentence.
  Split unrelated work into separate pull requests.
- The owner's questions first.
  Every choice the author made that was the owner's to make is listed, with a recommended answer.
- A map for the reviewer: which files need careful reading, and which are mechanical.
- Evidence, not assurance: the commands that were run and what they printed.
- A plain list of what was not verified.
- Every change to a check or a control under `.github/`, `.config/`, or `.claude/`, with its reason.
- An ADR for any decision that is hard to reverse.

## Reporting problems

Use the issue templates.
Report security vulnerabilities privately, as described in the [security policy](SECURITY.md).
