# Topic studies

## Purpose

A topic study answers one research question about hardware, a technique, a platform, or policy.
It sets out the options and their trade-offs without choosing between them.

## Layout

One file for each item of the [research roadmap](../../roadmap/research.md) that asks for a topic study.

| File | Answers |
|---|---|
| [R0-01](R0-01-clean-room-policy.md) | Which sources may be read, and how notes are taken |
| [R0-02](R0-02-legal-baseline.md) | What law and enforcement history constrain an emulator project |

## Conventions

- Files are named `R<phase>-<nn>-<slug>.md`, and start from [`_template.md`](_template.md).
- Every claim says how it was checked.
  A claim from memory is marked "(from memory)".
- A note on law or policy says that it is not legal advice.
- Sources are opened only as [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) allows.
- The status values are defined in [the documentation guide](../../README.md#status).
