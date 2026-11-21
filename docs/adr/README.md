# Architecture decision records

## Purpose

An architecture decision record (ADR) holds one decision that is hard to reverse, the options that were weighed,
and what follows from it.
Research notes map options; an ADR chooses between them.

## Layout

One file for each decision, numbered in the order the decisions were made.

| File | Decides |
|---|---|
| [0001](0001-restrict-reading-by-licence-tier.md) | Which sources may be read, by licence tier; superseded by 0006 |
| [0002](0002-license-under-gpl-3-0-or-later.md) | The licence's versions: GPL-3.0-or-later |
| [0003](0003-permit-conveying-through-app-stores.md) | A section 7 permission for app stores |
| [0004](0004-take-contributions-on-the-outbound-licence.md) | The terms contributions are made on |
| [0005](0005-dual-license-the-project-documents.md) | The documents' licence: GPL or CC BY-SA 4.0 |
| [0006](0006-read-sources-by-tier-under-a-compatibility-test.md) | Which sources may be read, by tier, under a licence compatibility test |

## Conventions

- Files are named `NNNN-<slug>.md`, and start from [`_template.md`](_template.md).
- One ADR records one decision.
- An approved ADR is never rewritten.
  A new ADR replaces it, and the old one becomes `superseded`.
- The status values are defined in [the documentation guide](../README.md#status).
