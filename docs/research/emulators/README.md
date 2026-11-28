# Emulator studies

## Purpose

An emulator study records what one existing emulator does, why it works, and what Rustalgia should learn from it.
It never copies the emulator's code.

## Layout

One file for each item of the [research roadmap](../../roadmap/research.md) that asks for an emulator study,
named for the item.
The roadmap lists the studies; this guide does not repeat the list.
Each study builds on the family survey for its system, under [topic studies](../topics/README.md),
which records the emulator's licence, tier, closed parts, and hazards.

## Conventions

- Files are named `R<phase>-<nn>-<slug>.md`, and start from [`_template.md`](_template.md).
- Every claim says how it was checked.
  A claim from memory is marked "(from memory)".
- The [research guide](../README.md#conventions) sets the rules for sources, claim markers, quoting,
  constants and tables, notation, and descriptions of algorithms.
- A study describes architecture at the level of its parts, in sentences, tables, and diagrams.
  It holds no code, no listings, and no pseudo-code.
- Sources are opened only as [ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md) allows.
  A replacement BIOS, boot ROM, or other system software inside an emulator is closed, whatever the emulator's tier.
- Terms of art are used as the [glossary](../../glossary/terms.md) defines them.
- The status values are defined in [the documentation guide](../../README.md#status).
