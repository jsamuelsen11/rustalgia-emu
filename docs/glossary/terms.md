---
title: Glossary
status: approved
date: 2026-11-21
---

# Glossary

## Scope

This glossary fixes what Rustalgia's documents mean by the terms below.
It covers emulation, the project's own process, and the words of the source rule.
Legal terms are not defined here: their meaning is set by statute and differs by country, and `R0-02` will record it.

A definition says how this repository uses a term.
It does not claim that other usage is wrong.
Where sources use a term differently, the entry says so,
because a note that repeats a source's word may otherwise assert something the source did not mean.

When a note reports what a source says,
it keeps the source's word inside the quotation and uses the glossary's term in its own voice.

## Terms

### accuracy

How closely an emulator's observable behaviour matches that of the original hardware.
It is not one scale: a note says which behaviour is compared, and how it was measured.

- **Elsewhere:** used as a single grade, such as "high accuracy", with no stated measure;
  mGBA's author writes that there is no simple metric for it (mGBA blog, 2017).
- **See also:** [cycle accuracy](#cycle-accuracy).
- **Basis:** `R0-04`, "Vocabulary: where the terms are contested".

### BIOS

Code built into a console that stays available to games after start-up and offers them services.
Used for systems whose maker's documents or open-tier references call such code a BIOS,
such as the Game Boy Advance in GBATEK; code that only starts the machine is a [boot ROM](#boot-rom).

- **Elsewhere:** in emulator documentation, any maker code an emulator needs besides the game,
  up to a whole operating system; Pan Docs also says "SGB BIOS" for the Super Game Boy's program (`R0-04`).
- **See also:** [firmware](#firmware), [system software](#system-software).
- **Basis:** the glossary's own wording; `R0-04`, "Vocabulary: where the terms are contested";
  ADR 0006 takes this definition as its term.

### boot ROM

The program in a console's read-only memory that runs first at power-on,
hands control to a game or to [system software](#system-software), and offers no services after that.

- **Avoid:** `bootrom`.
- **See also:** [BIOS](#bios), [firmware](#firmware).
- **Basis:** Pan Docs' usage, recorded in `R0-04`; ADR 0006 takes this definition as its term.

### cached interpreter

An [interpreter](#interpreter) that decodes each block of guest code once and keeps the decoded form for reuse,
without generating host machine code.

- **Elsewhere:** Dolphin defines its own cached interpreter this way;
  what other projects mean by the name was not checked (`R0-04`).
- **Basis:** `R0-04`, "Vocabulary: where the terms are contested".

### claim marker

A parenthesis after a claim that says how it was checked.
The markers are listed in the [research guide](../research/README.md#claim-status).

- **Basis:** `R0-01`, "Scope"; the research guide.

### clean room

A way of working in which those who study a restricted source write only a description of what it does,
and others who have not seen the source write the implementation from that description.
It is evidence of independent creation, not a legal requirement.

- **See also:** [reader](#reader).
- **Basis:** `R0-01`, "Reverse engineering and the legal status of a clean room"; ADR 0001, "Context".

### closed tier

The tier of a source that is not open source; that is a decompilation or disassembly of a game or of firmware;
or that reimplements a console's BIOS, boot ROM, or system software, wherever it is hosted.
Nobody reads its code; its [prose](#prose) may be read, and the program may be observed by running it.

- **See also:** [tier](#tier).
- **Basis:** ADR 0006, "Closed tier".

### core

The part of an emulator that models one system, apart from the [frontend](#frontend).

- **Elsewhere:** a "libretro core" is a library built against the libretro interface,
  which serves "the creation of games and emulators"
  (libretro API page);
  the standard vocabulary uses "core" for a processing unit in a processor (SEVOCAB, recorded in `R0-04`).
  A note qualifies those senses, as in "processor core".
- **Basis:** the research roadmap, items `R4-01` and `R5-01`; ares' usage, recorded in `R0-04`.

### cycle

One period of a named clock.
The word is not used alone: a note names the clock, as in "master-clock cycle" or "machine cycle".

- **Elsewhere:** a clock period, a machine cycle of several clock periods,
  or a processor cycle of several master clocks, depending on the system and the reference (`R0-04`).
- **Basis:** `R0-04`, "Vocabulary: numbers, units, and names".

### cycle accuracy

A property of one emulated component:
each of its events that other components can observe happens on the correct [cycle](#cycle) of a named clock.
A note names the component and the clock, and says how the claim was tested;
it does not grade a whole emulator cycle-accurate without those three things.

- **Elsewhere:** mGBA's author separates it from "cycle-count accuracy",
  in which each component acts atomically and takes the right time,
  so that components interleave only between whole operations;
  one project reports it as a pass rate against a test suite (`R0-04`).
- **Basis:** `R0-04`, "Vocabulary: where the terms are contested".

### decompilation

Translating a compiled program back into source code in a high-level language; also the source so produced.
A decompilation of a game or of firmware is in the [closed tier](#closed-tier).

- **Elsewhere:** European Union law uses "decompilation" for acts that United States cases call disassembly (`R0-04`).
- **See also:** [disassembly](#disassembly).
- **Basis:** the standard vocabulary's entry "decompile", recorded in `R0-04`; ADR 0006, "Closed tier".

### disassembly

Translating machine code into assembly language; also the listing so produced.
A disassembly of a game or of firmware is in the [closed tier](#closed-tier).

- **See also:** [decompilation](#decompilation).
- **Basis:** the standard vocabulary's entry "disassemble", recorded in `R0-04`; ADR 0006, "Closed tier".

### dump

A file copied from a physical medium or chip; as a verb, to make one.
The word carries no claim about whether the copying was lawful.

- **Elsewhere:** 3dbrew's glossary defines it as extracting "the protected contents" of a chip or disc;
  the standard vocabulary uses it for a display of a program's execution state (`R0-04`).
- **See also:** [image](#image), [ROM image](#rom-image).
- **Basis:** `R0-04`, "Vocabulary: where the terms are contested".

### dynamic recompilation

Translating guest machine code into host machine code while the program runs, a block at a time.

- **Also:** JIT, short for `just-in-time` recompilation.
- **Elsewhere:** Dolphin treats "recompiler" as the class and a JIT as one kind;
  PPSSPP calls a JIT "also known as a Dynarec" (`R0-04`).
- **See also:** [static recompilation](#static-recompilation), [cached interpreter](#cached-interpreter).
- **Basis:** the research roadmap, items `R2-01` and `R4-08`; `R0-04`.

### emulator

A program or device that reproduces the behaviour of another system closely enough to run software written for
that system without changing it.

- **Elsewhere:** the standard vocabulary defines emulator and [simulator](#simulator) in near terms
  and cross-refers them; TASVideos calls the simulator the more exact of the two (`R0-04`).
- **Basis:** `R0-04`, "Vocabulary: where the terms are contested".

### finding

A statement of fact in a research note, with its source.
It is not an opinion, an option, or a recommendation.

- **See also:** [option](#option), [lead](#lead).
- **Basis:** the topic-study template, "Findings".

### firmware

Code, and the data it needs, that a device's maker stores in the device's own non-volatile memory to start or run it.
It is the umbrella word for a [boot ROM](#boot-rom), a [BIOS](#bios),
and the stored part of [system software](#system-software); a game and a player's save data are not firmware.

- **Elsewhere:** WiiBrew restricts it to low-level code written into a chip and says a system menu is not firmware;
  the standard vocabulary speaks of instructions and data stored apart from main storage, usually in read-only memory;
  other projects use it for all updatable system software (`R0-04`).
- **Basis:** the research roadmap, item `R2-12`; `R0-04`.

### frontend

The part of an emulator that connects a [core](#core) to the host: video, audio, input, files, and the user interface.

- **Elsewhere:** MAME uses "front-end" for a separate program that launches the emulator (`R0-04`).
- **Basis:** the research roadmap, item `R2-10`; libretro's usage, recorded in `R0-04`.

### high-level emulation

Reproducing what a component or a piece of system software does, without running its original code.
It is said of a component, not of a whole emulator.

- **Also:** HLE.
- **Elsewhere:** used for whole emulators by the Emulation General Wiki, as a grade of accuracy,
  and for kinds of renderer (`R0-04`).
- **See also:** [low-level emulation](#low-level-emulation).
- **Basis:** mGBA's usage, recorded in `R0-04`.

### homebrew

Software made, usually by hobbyists, for a console without its maker's licence.

- **Basis:** the glossary's own wording; WiiBrew's glossary uses the word without defining it.

### hub

A site or document that the developers of a system's emulators treat as a standing reference for that system.

- **Basis:** the glossary's own wording; the research roadmap, item `R0-05`, uses the word without defining it.

### image

A file that holds an exact copy of the contents of a storage medium, such as a cartridge, a disc, or a memory card.

- **See also:** [ROM image](#rom-image), [dump](#dump).
- **Basis:** MAME's and TASVideos' usage, recorded in `R0-04`; the memory card is the glossary's own addition.

### interpreter

A way of running guest code in which each instruction is decoded and carried out one at a time, every time it is met.

- **See also:** [cached interpreter](#cached-interpreter), [dynamic recompilation](#dynamic-recompilation).
- **Basis:** the standard vocabulary's entry "interpreter" (SEVOCAB); Dolphin's progress report of September 2024,
  which says an interpreter "decodes each individual instruction".

### item

One entry in a roadmap, with a stable ID such as `R1-32`.

- **Basis:** the roadmap guide, "Items".

### lead

A fact found only in a forum, a chat, a video, or a personal blog.
It is not relied on until a better source or a test confirms it.

- **Basis:** ADR 0006, "Sources that are not emulators".

### low-level emulation

Running a component's original code on a model of the hardware that it ran on.
It needs a copy of that code.

- **Also:** LLE.
- **See also:** [high-level emulation](#high-level-emulation).
- **Basis:** mGBA's usage, recorded in `R0-04`.

### open tier

The tier of a source whose licence lets its code be combined with GPL-3.0 code.
Anyone may read it; nothing is copied or ported from it.

- **See also:** [tier](#tier).
- **Basis:** ADR 0006, "Open tier".

### option

A choice that a later decision could make,
set out in a research note with its costs and gains and without a recommendation.

- **Basis:** the topic-study template, "Options and trade-offs".

### prose

A README, a licence file, a contributing guide, a wiki, a blog, release notes, and documentation.
It stops where code begins.

- **See also:** [pseudo-code](#pseudo-code).
- **Basis:** ADR 0006, "In every tier".

### provenance

The record of where a fact or a piece of code came from: which sources were consulted, by whom, and when.

- **Basis:** `R0-01`, "Source categories and their provenance"; the research roadmap, item `R0-06`.

### pseudo-code

Steps of a procedure written with assignment, branching, or loops in an informal notation.
It counts as code under ADR 0006, so research notes do not hold it;
the [research guide](../research/README.md#algorithms-and-pseudo-code) says what they hold instead.

- **Elsewhere:** the ITU's guidelines count it as software, apart from prose;
  the IETF's list of code components does not name it;
  the standard vocabulary defines pseudocode as programming constructs and natural language combined (`R0-04`).
- **Basis:** `R0-04`, "Pseudo-code and algorithm descriptions: practice"; ADR 0006, "Terms".

### reader

A session that the owner starts with `RUSTALGIA_SOURCE_ROLE=reader` to study one emulator.
It may read the code of the walled emulator it studies, and writes functional descriptions with no code and no listings.

- **Elsewhere:** the source guard lets a reader session open every walled repository; the narrower rule is ADR 0006's.
- **See also:** [writer](#writer), [walled tier](#walled-tier).
- **Basis:** ADR 0006, "Walled tier".

### research note

The document that one research roadmap item produces: an emulator study, a topic study, or a spike report.

- **Also:** note.
- **Basis:** the research roadmap, "How items work".

### ROM

Read-only memory: a chip whose contents are fixed, or those contents.
A file copied from one is a [ROM image](#rom-image).

- **Elsewhere:** in emulation, commonly a file copied from a cartridge's program chip (`R0-04`).
- **Basis:** the standard vocabulary's entry, recorded in `R0-04`.

### ROM image

A file holding a copy of the contents of one or more [ROM](#rom) chips.

- **See also:** [image](#image), [dump](#dump).
- **Basis:** MAME's usage, recorded in `R0-04`.

### save data

What a game itself stores to keep a player's progress, in non-volatile memory in the cartridge or the console,
or on a memory card.

- **Elsewhere:** called SRAM or save RAM (TASVideos, recorded in `R0-04`), and save files.
- **See also:** [save state](#save-state).
- **Basis:** PPSSPP's and TASVideos' usage, recorded in `R0-04`.

### save state

A snapshot of the whole emulated system, taken by the emulator, from which it can resume later.

- **Avoid:** `savestate`.
- **Elsewhere:** TASVideos writes `Savestate` (`R0-04`).
- **See also:** [save data](#save-data).
- **Basis:** the research roadmap, item `R2-08`; PPSSPP's and TASVideos' usage, recorded in `R0-04`.

### simulator

A word that sources use in conflicting senses.
Notes do not use it in their own voice for an emulator; where a source says "simulate",
the note says what the source means by it.

- **Elsewhere:** a near-synonym of emulator; the more exact of the two; a stand-in
  that does not run the original code (`R0-04`).
- **See also:** [emulator](#emulator).
- **Basis:** `R0-04`, "Vocabulary: where the terms are contested".

### source guard

The hook `.claude/hooks/source-guard.sh`, which refuses tool calls that would open the walled, closed,
and tainted sources in the [source register](#source-register), and code in a repository that is not registered.

- **See also:** [reader](#reader), [writer](#writer).
- **Basis:** ADR 0006, "Evaluating a new source" and "Consequences".

### source register

The file `.claude/hooks/source-register.txt`, which lists every evaluated source and its [tier](#tier).

- **Also:** register.
- **Basis:** ADR 0006, "Evaluating a new source".

### spike

A throwaway experiment that answers what reading cannot.

- **Basis:** the research roadmap, "Phase 5: hands-on spikes".

### static recompilation

Translating a guest program into host code, or into source code that is then compiled, before it runs.

- **See also:** [dynamic recompilation](#dynamic-recompilation).
- **Basis:** a recompiler's README, recorded in `R0-04`.

### system software

A console's operating system and built-in programs, whether stored in the console or updated later,
such as over a network or from removable storage.

- **Elsewhere:** often called [firmware](#firmware) or [BIOS](#bios) in emulator documentation (`R0-04`).
- **Basis:** console makers' usage, recorded in `R0-04`; ADR 0006 takes this definition as its term.

### tainted tier

The tier of a reference whose own maintainers say that it copies or paraphrases a console maker's confidential code
or documents, and of the document such a statement is about.
It is not opened at all.

- **Elsewhere:** `R0-01` and Asahi Linux use "taint" for code that copied protected expression or broke a clean room
  (`R0-01`; `R0-04`).
- **See also:** [tier](#tier).
- **Basis:** ADR 0006, "Tainted tier".

### test ROM

A program written to exercise one piece of hardware behaviour and report the result, run on hardware and on emulators.

- **See also:** [test vector](#test-vector).
- **Basis:** the research roadmap, items `R4-10` and `R5-05`; the wording is the glossary's own.

### test vector

A recorded set of inputs with the outputs or state expected for one operation, such as one processor instruction.

- **See also:** [test ROM](#test-rom).
- **Basis:** the research roadmap, item `R5-03`; the wording is the glossary's own.

### tier

One of the four classes into which ADR 0006 sorts every source by its licence and its origin: open, walled, closed,
and tainted.

- **Elsewhere:** the source register also marks repositories unrelated to consoles as `other`; they are not restricted.
- **Basis:** ADR 0006, "Decision" and "Evaluating a new source".

### walled tier

The tier of a source that is open source under a licence that does not let its code be combined with GPL-3.0 code,
or whose licence is unclear, and of any source not yet evaluated.
Only a [reader](#reader) reads its code.

- **See also:** [tier](#tier).
- **Basis:** ADR 0006, "Walled tier".

### writer

A session that was not started as a [reader](#reader); it is the default.
A writer never opens the code of a walled source.

- **Elsewhere:** in a clean room, and in `R0-01` option 4, the writer is someone who has not seen the source;
  a writer session here may have read open-tier code and walled prose.
- **Basis:** the default role in the [source guard](#source-guard); ADR 0006 defines the reader only.
