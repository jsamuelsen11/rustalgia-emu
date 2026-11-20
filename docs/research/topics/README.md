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
| [R0-04](R0-04-glossary-and-conventions.md) | Which terms need fixed meanings, and what a note may quote and tabulate |
| [R0-05](R0-05-source-map.md) | Where each system's documentation lives, and each hub's licence, origin, and tier |
| [R0-06](R0-06-provenance-controls.md) | What can record and control where agent-written work comes from |
| [R1-03](R1-03-primer-sixth-generation.md) | How the sixth era's machines work, and what that asks of an emulator |

## Conventions

- Files are named `R<phase>-<nn>-<slug>.md`, and start from [`_template.md`](_template.md).
- Every claim says how it was checked.
  A claim from memory is marked "(from memory)".
- The [research guide](../README.md#conventions) sets the rules for sources, claim markers, quoting,
  constants and tables, notation, and descriptions of algorithms.
- Terms of art are used as the [glossary](../../glossary/terms.md) defines them.
- A note on law or policy says that it is not legal advice.
- Sources are opened only as [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) allows.
- The status values are defined in [the documentation guide](../../README.md#status).
