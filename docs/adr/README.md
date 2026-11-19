# Architecture decision records

## Purpose

An architecture decision record (ADR) holds one decision that is hard to reverse, the options that were weighed,
and what follows from it.
Research notes map options; an ADR chooses between them.

## Layout

One file for each decision, numbered in the order the decisions were made.

| File | Decides |
|---|---|
| [0001](0001-restrict-reading-by-licence-tier.md) | Which sources may be read, by licence tier |

## Conventions

- Files are named `NNNN-<slug>.md`, and start from [`_template.md`](_template.md).
- One ADR records one decision.
- An approved ADR is never rewritten.
  A new ADR replaces it, and the old one becomes `superseded`.
- The status values are defined in [the documentation guide](../README.md#status).
