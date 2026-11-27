# Topic studies

## Purpose

A topic study answers one research question about hardware, a technique, a platform, or policy.
It sets out the options and their trade-offs, and recommends one where a design choice remains.

## Layout

One file for each item of the [research roadmap](../../roadmap/research.md) that asks for a topic study.

| File | Answers |
|---|---|
| [R0-01](R0-01-clean-room-policy.md) | Which sources may be read, and how notes are taken |
| [R0-02](R0-02-legal-baseline.md) | What law and enforcement history constrain an emulator project |
| [R0-03](R0-03-licence-strategy.md) | How Rustalgia holds its licence, reaches app stores, and takes contributions and dependencies |
| [R0-04](R0-04-glossary-and-conventions.md) | Which terms need fixed meanings, and what a note may quote and tabulate |
| [R0-05](R0-05-source-map.md) | Where each system's documentation lives, and each hub's licence, origin, and tier |
| [R0-06](R0-06-provenance-controls.md) | What can record and control where agent-written work comes from |
| [R1-01](R1-01-primer-8-and-16-bit.md) | How 8-bit and 16-bit consoles and handhelds work, and what that asks of an emulator |
| [R1-02](R1-02-primer-32-and-64-bit.md) | How the 32-bit and 64-bit machines work, and what that asks of an emulator |
| [R1-03](R1-03-primer-sixth-generation.md) | How the sixth era's machines work, and what that asks of an emulator |
| [R1-04](R1-04-primer-modern.md) | How modern consoles work, and what that asks of an emulator |
| [R1-05](R1-05-catalogue-8-and-16-bit.md) | Which consoles and handhelds the 8-bit and 16-bit era sold, and their hardware and sources |
| [R1-06](R1-06-catalogue-32-and-64-bit.md) | Which consoles and handhelds the 32-bit and 64-bit era sold, and their hardware and sources |
| [R1-07](R1-07-catalogue-sixth-generation.md) | Every console and handheld of the sixth-generation era, with sources |
| [R1-08](R1-08-catalogue-modern.md) | Which consoles and handhelds were sold from the seventh generation on, and their hardware |
| [R1-10](R1-10-game-boy-family.md) | Which Game Boy and Game Boy Color emulators matter, how they work, and the family's risks |
| [R1-11](R1-11-game-boy-advance-family.md) | Which Game Boy Advance emulators matter, and the family's legal exposure and difficulty |
| [R1-12](R1-12-nintendo-ds-family.md) | Which DS and DSi emulators matter, how they work, and the family's legal exposure and difficulty |
| [R1-13](R1-13-nintendo-3ds-family.md) | Which emulators matter for the Nintendo 3DS family, its legal exposure, and how hard it is |
| [R1-14](R1-14-nintendo-switch-family.md) | Which Switch and Switch 2 emulators matter, and how exposed and hard the family is |
| [R1-15](R1-15-nes-and-snes-family.md) | Which NES and SNES emulators matter, how they work, and the families' legal exposure and difficulty |
| [R1-16](R1-16-nintendo-64-family.md) | Which Nintendo 64 emulators matter, how they work, and the family's legal exposure and difficulty |
| [R1-17](R1-17-gamecube-wii-wii-u-family.md) | Which GameCube, Wii, and Wii U emulators matter, and the family's legal exposure and difficulty |
| [R1-18](R1-18-playstation-1-family.md) | Which emulators the PlayStation 1 family has, and its legal exposure and difficulty |
| [R1-19](R1-19-playstation-2-family.md) | Which PlayStation 2 emulators matter, how they work, and the family's legal exposure and difficulty |
| [R1-20](R1-20-psp-and-vita-family.md) | Which PSP and Vita emulators matter, how they work, and the family's legal exposure and difficulty |
| [R1-21](R1-21-playstation-3-4-5-family.md) | Which PS3, PS4, and PS5 emulators matter, and the family's legal exposure and difficulty |
| [R1-24](R1-24-xbox-family.md) | Which Xbox, Xbox 360, and later emulators matter, and the family's legal exposure and difficulty |
| [R1-25](R1-25-arcade-family.md) | Which arcade emulators matter, how they work, and the family's legal exposure and difficulty |
| [R1-26](R1-26-other-consoles-family.md) | Which other console and handheld emulators matter, and the family's legal exposure and difficulty |

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
