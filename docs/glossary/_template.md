---
title: Glossary
status: draft
date: 2026-11-19
---

# Glossary

This file is the template for a glossary and for each entry in one.
A glossary fixes what the project's documents mean by their terms of art.
The entries below are illustrative.

To add a term to the glossary:

1. Copy one entry from under "Terms" below into `docs/glossary/terms.md`, at its place in alphabetical order.
2. Replace the heading with the term, in the singular and in lower case unless it is a name or an abbreviation.
3. Write the definition and the labelled lines, following the guidance below.
4. Set `date` in the frontmatter to today.
5. Run `mise run check`.

To start a second glossary file, copy this whole file to `docs/glossary/<name>.md`,
and delete everything between the title and the first section heading.

| Field | Rule |
|---|---|
| `title` | The name of the glossary. The same text as the heading above. |
| `status` | `draft` until the owner first approves it; then `approved`, with each change approved by merging. |
| `date` | The day the glossary last changed, as `YYYY-MM-DD`. |

The status values, and who sets each one, are defined under "Status" in `docs/README.md`.

| Line | Rule |
|---|---|
| The definition | One or two sentences in the project's own words, first in the entry; the first omits the term. |
| **Also:** | Optional. Other forms that documents may use, such as an abbreviation. |
| **Avoid:** | Optional. Forms that documents do not use, each in a code span. |
| **Elsewhere:** | Optional. How sources use the term differently, and the note that records it. |
| **See also:** | Optional. Links to related entries. |
| **Basis:** | Required. Where the definition comes from. |

## Scope

**Purpose:** tell a reader what the glossary covers and how to use it.

**Write:** which subjects the terms come from, what is left out and where it is recorded instead,
and how a definition here relates to usage elsewhere.

**Leave out:** definitions.

**Length:** one or two short paragraphs.

**Example:**

> This glossary fixes what Rustalgia's documents mean by the terms below.
> Legal terms are not defined here; `R0-02` will record them.

## Terms

### frame pacing

Choosing the moment at which each finished frame is shown,
so that motion looks even on a screen whose refresh rate differs from the console's.

- **Also:** pacing.
- **Avoid:** `framepacing`.
- **Elsewhere:** some emulators use the term for limiting speed only (illustrative).
- **See also:** [input latency](#input-latency).
- **Basis:** the research roadmap, item `R2-07`.

### input latency

The time between a player's action and the first frame that shows its effect.

- **Basis:** the research roadmap, item `R2-07`.
