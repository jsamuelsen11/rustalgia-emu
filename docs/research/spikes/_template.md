---
title: Compare three bus designs
roadmap_item: R0-00
status: draft
date: 2026-11-17
---

# Compare three bus designs

This file is the template for a spike report.
A spike is a small, throwaway experiment that answers a question reading cannot.
The report records what was tried and what was measured, so nobody has to run it again.
The examples below are illustrative and are not results.

To use this template:

1. Copy this file to `docs/research/spikes/R<phase>-<nn>-<slug>.md`, using the item's ID from the research roadmap,
   such as `R5-04-bus-designs.md`.
2. Fill in the frontmatter.
   No other fields are allowed, and `roadmap_item` must match the filename.
3. Replace the guidance in every section with your content.
   Keep the headings and their order.
4. Delete everything between the title and the first section heading.
5. Run `mise run check`.

| Field | Rule |
|---|---|
| `title` | What the spike did, starting with a verb. The same text as the heading above. |
| `roadmap_item` | The item's ID, such as `R5-04`. One report for each item. |
| `status` | `draft` when you open the pull request. Only the owner sets `approved`. |
| `date` | The day the status last changed, as `YYYY-MM-DD`. |

The other status values, and who sets each one, are defined under "Status" in `docs/README.md`.

Spike code is thrown away.
It is never merged into the product, and it uses only freely licensed test software.
Write the question before you start the experiment, not after.

## Summary

**Purpose:** give a reader who stops here the answer.

**Write:** the question, the answer, and how confident the result is.

**Leave out:** how the experiment was built.

**Length:** two to four sentences.

**Example:**

> We asked which of three ways to connect a processor core to memory is fastest in Rust.
> Static dispatch was fastest by a clear margin on both machines tested.
> The result is firm for a small core; it has not been tested on a large one.

## Question

**Purpose:** fix what the spike was meant to settle.

**Write:**

- The question, as one sentence that a measurement can answer.
- What result would count as each answer, decided before the experiment ran.
- The roadmap items or decisions waiting on it.

**Leave out:** the result.

**Length:** three to five bullets.

**Example:**

> - Question: which bus design runs a fixed test program in the least time?
> - A difference under five percent counts as no difference.
> - Waiting on this: the topic study on Rust architecture patterns, `R4-01`.

## Method

**Purpose:** let someone repeat the experiment and get the same result.

**Write:**

- What was built, in a few sentences.
- The hardware, operating system, and tool versions used.
- The exact steps and commands, in a numbered list or a code block.
- What was measured, in which unit, and how many times.
- Where the throwaway code is kept, if anywhere, and when it will be deleted.

**Leave out:** results, and the story of what went wrong along the way unless it changes how to read the result.

**Length:** enough to repeat it.
A reader should not have to ask a question.

**Example:**

> A small processor core was written three times, once for each bus design, and run against the same test program.
>
> - Machine: an x86-64 laptop and an ARM64 phone.
>   Rust 1.100.
> - Each version ran the program 100 times; the median time is reported.

## Results

**Purpose:** report what was measured, without interpretation.

**Write:** the measurements in a table, with units, and any observation that was not a number.
Say what went wrong or was left untested.

**Leave out:** what it means.
That goes in the next section.

**Length:** one table and a few lines.

**Example:**

| Design | Laptop, median | Phone, median |
|---|---|---|
| Static dispatch | 1.00 s | 2.10 s |
| Enum dispatch | 1.08 s | 2.31 s |
| Shared reference counting | 1.62 s | 3.75 s |

> The phone ran hot after the tenth run; later runs were taken after a pause.

## Implications for Rustalgia

**Purpose:** say what the result means for the work ahead.

**Write:** one bullet for each implication, tied to a result above.
Name the decision it feeds.
Say how far the result can be trusted beyond the conditions tested.

**Leave out:** decisions.
The spike informs a decision; an ADR makes it.

**Length:** two to five bullets.

**Example:**

> - Shared reference counting costs enough to rule it out for the hot path.
>   This feeds the ADR on core structure.
> - The gap between static and enum dispatch is small enough that clarity can decide between them.

## Open questions

**Purpose:** list what the spike did not settle.

**Write:** each question the spike could not settle, and the work that would answer it.

**Leave out:** questions the spike was never meant to answer.

**Length:** one line for each question.
Write "None" if there are none.

**Example:**

> - Does the result hold for a core with many more devices on the bus?
>   A larger spike would show it.
