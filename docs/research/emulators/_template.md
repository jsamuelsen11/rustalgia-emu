---
title: Example emulator
subject: Example emulator
roadmap_item: R0-00
status: draft
date: 2026-11-17
---

# Example emulator

This file is the template for an emulator study.
An emulator study records what one existing emulator does, why it works, and what Rustalgia should learn from it.
It never copies the emulator's code.
The examples below describe an invented emulator and are not findings.

To use this template:

1. Read the clean-room policy first.
   It decides which sources you may open.
2. Copy this file to `docs/research/emulators/R<phase>-<nn>-<slug>.md`, using the item's ID from the research roadmap,
   such as `R1-32-mgba.md`.
3. Fill in the frontmatter.
   No other fields are allowed, and `roadmap_item` must match the filename.
4. Replace the guidance in every section with your content.
   Keep the headings and their order.
5. Delete everything between the title and the first section heading.
6. Run `mise run check`.

| Field | Rule |
|---|---|
| `title` | The emulator's name. The same text as the heading above. |
| `subject` | The emulator's name, exactly as its project spells it. |
| `roadmap_item` | The item's ID, such as `R1-32`. One note for each item. |
| `status` | `draft` when you open the pull request. Only the owner sets `approved`. |
| `date` | The day the status last changed, as `YYYY-MM-DD`. |

The other status values, and who sets each one, are defined under "Status" in `docs/README.md`.

Every claim says how it was checked: read in the project's documentation, observed by running the emulator,
read in its source, or recalled from memory.
A claim from memory is marked "(from memory)".

## Summary

**Purpose:** give a reader who stops here the whole picture.

**Write:** what the emulator is, what it is known for, and the two or three lessons that matter most to Rustalgia.

**Leave out:** detail, history, and anything not supported later in the note.

**Length:** three to five sentences.

**Example:**

> Example emulator runs the Example handheld on desktop and mobile, and is known for accuracy at low cost.
> Its core is a library with no user interface, which is why it has been embedded in several apps.
> The main lessons are its strict split between core and frontend, and its test suite, which runs on every change.

## Scope

**Purpose:** record what was examined, so the reader can judge the note's reach and its clean-room status.

**Write:**

- The version or commit examined, and the date.
- Each kind of source used: documentation, behaviour, source code, talks, or issue discussions.
- The emulator's licence, and whether the clean-room policy allowed its source to be read.
- What was deliberately not examined.

**Leave out:** findings.

**Length:** four to six bullets.

**Example:**

> - Version 1.4.2, examined on 2026-11-17.
> - Sources: the project's documentation, its developer blog, and behaviour observed by running it.
> - Licence: MPL-2.0.
>   The source was not read for this note.
> - Not examined: the netplay feature and the Windows installer.

## Architecture

**Purpose:** describe how the emulator is put together, at the level of its parts.

**Write:**

- The main parts and what each owns: core, frontend, platform layers.
- How time is advanced and how the parts stay in step.
- How the processor is executed: interpreter, cached interpreter, or dynamic recompilation.
- How video and audio are produced and handed to the host.
- How state is saved.
- A Mermaid diagram of the parts, when there are more than three.

**Leave out:** code, function names copied from the source, and opinion.
Opinion goes in the next two sections.

**Length:** one short paragraph or list for each bullet above that applies.

**Example:**

> The core is a library that knows nothing about windows, files, or audio devices (documentation, "Design").
> A frontend gives it input and receives finished frames and audio samples through a small set of callbacks
> (observed by embedding the core in a test program).
> The processor is interpreted; there is no recompiler (documentation, "Design").

## What works well

**Purpose:** record what to learn from, with the reason it works.

**Write:** one bullet for each strength: what it is, why it works, and how you know.

**Leave out:** praise without a mechanism.
`It is fast` is not a finding; the cause of the speed is.

**Length:** three to seven bullets.

**Example:**

> - **The core has no global state.**
>   Two games can run in one process, which makes testing simple (developer blog, "Why no globals").
> - **Every bug fix adds a test ROM.**
>   Regressions are caught before release (observed in the project's CI).

## What works poorly

**Purpose:** record what to avoid, with the cause.

**Write:** one bullet for each weakness: what it is, what causes it, and how you know.
Include what the project's own authors say they regret.

**Leave out:** complaints about taste, and problems the project has already fixed.

**Length:** three to seven bullets.
If you found none, say what you looked for.

**Example:**

> - **Save states break between versions.**
>   The format has no version field, so old saves fail silently (issue tracker, several reports).
> - **The scanline renderer cannot show mid-line effects.**
>   The author calls this the hardest thing to change later (developer blog).

## Implications for Rustalgia

**Purpose:** turn the findings into things we can act on.

**Write:** one bullet for each implication, each tied to a finding above.
Phrase it as an option or a question for a later decision, not as a decision.

**Leave out:** decisions.
The research maps options; ADRs choose between them.

**Length:** three to six bullets.

**Example:**

> - A core with no global state is an option worth carrying into the architecture phase.
> - Save-state versioning should be considered from the first format, not added later.

## Open questions

**Purpose:** list what this note could not answer.

**Write:** each question, and the roadmap item or kind of work that would answer it.

**Leave out:** questions already answered elsewhere in the research.

**Length:** one line for each question.
Write "None" if there are none.

**Example:**

> - How much does the interpreter cost in battery life on a phone?
>   A spike would answer this.

## Sources

**Purpose:** let a reader check every claim.

**Write:** a list of every source used, each with its title, its address, and the date it was read.

**Leave out:** sources you did not use, and any link to copyrighted games, firmware, or keys.

**Length:** as many lines as there are sources.

**Example:**

> - Example emulator documentation, "Design", `https://example.org/docs/design`, read 2026-11-17.
> - Example emulator developer blog, "Why no globals", `https://example.org/blog/no-globals`, read 2026-11-17.
