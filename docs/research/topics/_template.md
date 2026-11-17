---
title: Frame pacing on phones
roadmap_item: R0-00
status: draft
date: 2026-11-17
---

# Frame pacing on phones

This file is the template for a topic study.
A topic study answers one research question about hardware, a technique, a platform, or policy.
It sets out the options and their trade-offs without choosing between them.
The examples below are illustrative and are not findings.

To use this template:

1. Copy this file to `docs/research/topics/R<phase>-<nn>-<slug>.md`, using the item's ID from the research roadmap,
   such as `R2-07-sync.md`.
2. Fill in the frontmatter.
   No other fields are allowed, and `roadmap_item` must match the filename.
3. Replace the guidance in every section with your content.
   Keep the headings and their order.
4. Delete everything between the title and the first section heading.
5. Run `mise run check`.

| Field | Rule |
|---|---|
| `title` | The topic, as a short noun phrase. The same text as the heading above. |
| `roadmap_item` | The item's ID, such as `R2-07`. One note for each item. |
| `status` | `draft` when you open the pull request. Only the owner sets `approved`. |
| `date` | The day the status last changed, as `YYYY-MM-DD`. |

Every claim says how it was checked.
A claim from memory is marked "(from memory)".
A note on law or policy says that it is not legal advice.

## Summary

**Purpose:** give a reader who stops here the answer.

**Write:** the question, the short answer, and the two or three points that matter most to Rustalgia.

**Leave out:** detail and anything not supported later in the note.

**Length:** three to five sentences.

**Example:**

> This note asks how an emulator should pace frames on phones whose screens do not run at the console's rate.
> There are three workable approaches, and each trades smooth motion against audio quality or latency.
> The choice shapes the interface between the core and the host, so it has to be made early.

## Scope

**Purpose:** set the edges of the question.

**Write:**

- The question, as one sentence.
- What is covered, and what is left to another roadmap item, named by its ID.
- The date of the research, and the versions of any platform or tool it depends on.

**Leave out:** findings.

**Length:** three to five bullets.

**Example:**

> - Question: how can frames be paced when the screen and the console run at different rates?
> - Covered: iOS and Android phones.
>   Desktop displays are left to `R3-07` and `R3-08`.
> - Researched on 2026-11-17 against iOS 26 and Android 16.

## Findings

**Purpose:** state what is true, with evidence.

**Write:** the facts a reader needs, grouped under subheadings when there are more than five.
Each finding is one statement followed by its source.
Use a table for comparisons and a Mermaid diagram for flows.

**Leave out:** opinion, options, and recommendations.
Those go in the next two sections.

**Length:** as long as the facts need, with no fact stated twice.

**Example:**

> - The handheld's screen refreshes at 59.73 Hz, and phone screens refresh at 60 Hz or 120 Hz
>   (hardware documentation, "Display timing").
> - Showing each frame once on a 60 Hz screen drops a frame about every four seconds (calculated from the rates).

## Options and trade-offs

**Purpose:** set out the choices a later decision will have.

**Write:** one subsection for each option, with the option's name as its heading.
Give each the same parts: what it is, what it costs, what it gains, and who uses it.

**Leave out:** a recommendation.
If the evidence favours one option, say what the evidence is and stop there.

**Length:** four short bullets for each option.
Two options is the minimum.

**Example:**

### Follow the screen and resample the audio

- **What:** run the game slightly fast to match the screen, and stretch the audio to fit.
- **Costs:** pitch shifts by a fraction of a percent.
- **Gains:** no dropped or repeated frames.
- **Used by:** several popular emulators (from memory).

### Follow the audio and repeat frames

- **What:** run at the console's true rate and repeat a frame when the screen gets ahead.
- **Costs:** a visible stutter every few seconds.
- **Gains:** exact pitch and timing.
- **Used by:** emulators that put accuracy first (from memory).

## Implications for Rustalgia

**Purpose:** turn the findings into things we can act on.

**Write:** one bullet for each implication, each tied to a finding or an option above.
Name the decision it feeds, and the requirement or ADR it is likely to become.

**Leave out:** decisions.
The research maps options; ADRs choose between them.

**Length:** three to six bullets.

**Example:**

> - The core's interface must let the host choose which clock leads.
>   This feeds the ADR on the core boundary.
> - A measurable target for dropped frames belongs in the quality targets (`R6-02`).

## Open questions

**Purpose:** list what this note could not answer.

**Write:** each question, and the roadmap item or kind of work that would answer it.

**Leave out:** questions already answered elsewhere in the research.

**Length:** one line for each question.
Write "None" if there are none.

**Example:**

> - Do 120 Hz phone screens make the stutter invisible in practice?
>   Spike `R5-06` could measure it.

## Sources

**Purpose:** let a reader check every claim.

**Write:** a list of every source used, each with its title, its address, and the date it was read.

**Leave out:** sources you did not use, and any link to copyrighted games, firmware, or keys.

**Length:** as many lines as there are sources.

**Example:**

> - Example hardware documentation, "Display timing", `https://example.org/hardware/display`, read 2026-11-17.
