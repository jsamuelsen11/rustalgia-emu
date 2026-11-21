---
title: "The sixth generation and the move to programmable graphics: primer"
roadmap_item: R1-03
status: approved
date: 2026-11-21
---

# The sixth generation and the move to programmable graphics: primer

## Summary

This note asks how the consoles and handhelds of the roadmap's sixth era work, and what that asks of an emulator.

The era moves graphics from fixed pipelines to configurable combiners and then to programmable shaders,
and brings multi-core processors, vector units, and resident system software (inference from the findings).

Three things matter most to Rustalgia.
First, emulation here is translation: the faster guests need dynamic recompilation,
most major CPUs examined have floating-point behaviour that host defaults do not reproduce,
and graphics become host shaders generated per configuration and cached (inference from the findings).

Second, system software decides much of the design.
High-level emulation of what games call avoids firmware, and the open-tier emulators read mostly take that route.

Third, by the sources read, the Wii, Wii U, 3DS, PSP, Vita, and Xbox 360 encrypt retail content,
within the limits under [Media](#media-security-and-system-software), while GameCube, Dreamcast,
and PS2 games reach an emulator as plain images (inference, partly from silence).
This bears on [R0-02](R0-02-legal-baseline.md)'s options.

For the owner's decision, the note recommends a design for each of these points ([Recommendation](#recommendation)).
This note is not legal advice.

## Scope

- Question: how do the machines of this era work, subsystem by subsystem, and what does each part ask of an emulator?
- Covered, as worked examples: the Dreamcast, PlayStation 2, GameCube, Wii, Wii U, Xbox, Xbox 360, PSP, Vita,
  and Nintendo 3DS, the systems whose family surveys depend on this item
  ([`R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22`, `R1-23`](../../roadmap/research.md#system-family-surveys)).
  The era follows the roadmap's grouping of surveys, not console generations,
  so it includes seventh- and eighth-generation systems;
  the PlayStation 3 and later systems are [R1-04](R1-04-primer-modern.md)'s.
  [Pull request #22](https://github.com/jsamuelsen11/rustalgia-emu/pull/22) set how a survey
  that spans several primers depends on each.
- Left to other items: the catalogue of every system sold ([R1-07](R1-07-catalogue-sixth-generation.md));
  the DS and PlayStation 1 hardware inside the 3DS and PS2 ([R1-02](R1-02-primer-32-and-64-bit.md));
  the law on firmware, keys, and encryption ([R0-02](R0-02-legal-baseline.md)), cited by section name;
  each emulator in depth (the family surveys and emulator studies); techniques in depth
  ([phase 2](../../roadmap/research.md#phase-2-cross-cutting-engineering)).
- Researched on 2026-11-20, and reworked the same day to answer the open questions and link every reference.
  Wiki pages are pinned by revision and repositories by commit where the source showed one.
- How claims were checked: research agents fetched each source as raw text on 2026-11-20 and copied quotations from it.
  Two independent verification passes followed, each of nine verifiers who saw only this note:
  each fetched the sources again the same day and tested each claim and quotation.
  Each pass's findings were checked against the raw sources before the note was corrected.
  The claims the passes could not check are listed in the pull request.
- Findings added in the rework rest on pages and files fetched on 2026-11-20 as raw text,
  with each quotation confirmed in that text.
  One further independent pass, of two verifiers,
  fetched the sources of the rework's new and changed lines again and tested each claim, link, and quotation;
  its findings were checked against the raw sources before the note was corrected.
  So the rework's lines have had one independent pass, and the rest of the note two.
  On the 3dbrew and Free60 pages re-read then, hexadecimal runs of 16 or more characters were masked before display.
- Markers are those of the [research conventions](../README.md#claim-status); Wikipedia read
  as wikitext is marked "(secondary)".
  A statement that nothing was found records the searches named, not proof of absence.
- Emulator projects' documentation, data, and code are cited as implementations' accounts, not hardware facts.
  The rework read source files of open-tier emulators,
  which [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) allows, for what they model;
  nothing from them is reproduced.
  No walled or closed code, firmware, key, kit, game, leaked material, or tainted source was opened,
  apart from the one Free60 page under [Pages next to restricted material](#pages-next-to-restricted-material).
  Patents were read from the patent office's copies, by optical recognition where needed.

## Findings

### Processors

#### PlayStation 2: Emotion Engine, vector units, I/O processor

- The Emotion Engine's core is a custom MIPS core (R5900) at 294.912 MHz
  that can issue two instructions per cycle "in ideal conditions", with small caches and a 16 KiB scratchpad
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "Emotion Engine (EE)", "EE Architecture"),
  and 128-bit general registers whose full width only some instructions use (ps2tek, "EE Registers").
  The same die carries two vector units, a 10-channel DMA controller, an MPEG decoder,
  and the paths to the graphics chip and the I/O processor
  ([Wikipedia, Emotion Engine](https://en.wikipedia.org/w/index.php?oldid=1375786242), secondary;
  [Toshiba and Sony, Hot Chips 11 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.s3.1.Kunimatsu.pdf)).
  None of these can be emulated alone, because they run concurrently (inference).
- The core's FPU is single precision and, by ps2tek, departs from IEEE 754: no NaN or infinity, denormals read as zero,
  and rounding always towards zero, with a last-bit variation of which "the details on this are not well understood"
  (ps2tek, "IEEE 754 Differences"; ps2tek states no source).
  Results recorded on a console agree for addition: adding `0x7fffffff` to itself returns `0x7fffffff`
  ([ps2autotests, `tests/cpu/ee_fpu/arithmetic.expected`](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/cpu/ee_fpu/arithmetic.expected)).
  IEEE 754 reads that pattern as a NaN: its exponent field is 255 and its fraction `0x7fffff` is not zero
  (calculated from the bit fields; IEEE rule per ps2tek, "IEEE 754 Differences",
  and [Wikipedia, Single-precision floating-point format](https://en.wikipedia.org/w/index.php?oldid=1384942600),
  exponent encoding table, secondary).
- Each vector unit has 32 registers of four 32-bit floats and executes an upper and a lower instruction per cycle;
  VU0 also acts as a coprocessor inside the core's instruction stream, and VU1 runs microprograms that games upload
  (Hot Chips 11 slides; ps2tek, "VU Architecture", "VU Registers", "Vector Interface (VIF)").
  Their pipeline is exposed: "Underneath the surface, the VU is full of quirks.
  This is partially because its pipeline is exposed to the program." (ps2tek, "VU Pipelining").
  A recompiler for them models per-instruction timing as well as results (inference).
- ps2tek gives the FPU's rounding and denormal rules under "EE COP1 Floating Point Format" and "IEEE 754 Differences".
  Its words that reach the vector units are that COP1, "along with the rest of the PS2,
  only supports single-precision floats"; no vector-unit section restates the rules (observed).
- The open-tier PS2 emulator gives the vector units the same defaults as the core's FPU: exceptions off,
  denormals read as zero, results flushed to zero, and rounding by chopping.
  Its one exception is FPU division, which defaults to round-to-nearest to match its own older behaviour
  ([PCSX2, `pcsx2/Pcsx2Config.cpp`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/pcsx2/Pcsx2Config.cpp),
  observed; an implementation's account).
- That emulator's game database sets rounding and clamping per game: of 12,916 entries,
  215 set `eeRoundMode` and 418 `vuClampMode`, and more set VU0 or VU1 clamping alone
  ([PCSX2, `bin/resources/GameIndex.yaml`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/resources/GameIndex.yaml),
  tested locally: counted with ugrep 7.8.4).
  It has 43 `vuRoundMode` entries, 14 `vu0RoundMode`, and 147 `vu1RoundMode`, and every one sets nearest, negative,
  or positive rounding, none chopping (same file and tool).
  The value of each mode follows the order of `FPRoundMode` in
  [PCSX2, `common/FPControl.h`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/common/FPControl.h)
  (observed).
  These are an implementation's settings, read as data; one global setting does not fit every game (inference).
- An open PCSX2 pull request implements the PS2's arithmetic in software in its interpreters, for the core's FPU, VU0,
  and VU1 ([PCSX2 pull request #12001](https://github.com/PCSX2/pcsx2/pull/12001), open, last updated 2026-10-21;
  its file list touches `VUops.cpp` and `VUflags.cpp`), and testers there report games it fixes on VU0 and VU1.
  Its author writes: "The PS2 Div is a mess, they round to nearest by default,
  but their 'rounding' is completely custom." (comment of 2024-11-23; a lead).
- ps2autotests also holds vector-unit results recorded on a console: clipping, VU1's elementary functions,
  division timing, integer and branch tests, and, under `games`, a routine of `MULi` and `ADDi` run on VU0 in micro mode
  ([ps2autotests, `tests/vu`](https://github.com/unknownbrackets/ps2autotests/tree/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu),
  observed).
  The division results are all exact powers of two, so they say nothing about rounding (calculated).
- That routine bears on rounding in VU0's multiply and add.
  Three of its eight operations give different results under chopping and under round-to-nearest.
  Both products match chopping and not nearest; the addition matches nearest,
  one last bit above the chopped IEEE result, which fits ps2tek's "quirky" round towards zero whose last bit "may vary"
  (calculated in exact arithmetic with Python 3.14.6 from the inputs in
  [`tests/vu/games/triace.cpp`](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu/games/triace.cpp)
  and the results in
  [`triace.expected`](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu/games/triace.expected)).
  So, on these three results, VU0 rounds towards zero as ps2tek says the core's FPU does (inference);
  the tests do not cover VU1's arithmetic or the rule for the last bit.
- The core's caches are not coherent with DMA, and "Certain games are so buggy, however,
  that they require cache emulation to work" (ps2tek, "Cache Coherency").
- The I/O processor duplicates the PlayStation 1's CPU and runs slow I/O and PS1 compatibility
  (ps2tek, "PS2 Overview"),
  so it inherits the PS1's source problem, which [R1-02](R1-02-primer-32-and-64-bit.md) records
  (inference; [R0-05](R0-05-source-map.md#8-how-the-playstation-1-primer-gets-its-facts), option 8).
- From the L-chassis (SCPH-750XX) onwards, a PowerPC 405 chip, Deckard, replaces the I/O processor and SPEED,
  with 4 MiB of DDR-SDRAM: the first 2 MiB serve as the emulated I/O processor's RAM and the rest the emulator.
  The page adds: "There is some support hardware inside the PPC IOP for the emulation.
  It's not purely software emulation."
  ([psdevwiki PS2, "IOP/Deckard"](https://web.archive.org/web/20261004011318/https://www.psdevwiki.com/ps2/IOP/Deckard),
  oldid 5555, read from a capture because the live page refuses scripts;
  [Wikipedia, PlayStation 2 technical specifications](https://en.wikipedia.org/w/index.php?oldid=1355643867) agrees on
  the PowerPC part, secondary).
  The same page's compatibility-mode database comes from ROM modules, a firmware-derived origin, and is not recorded.

#### GameCube, Wii, and Wii U

- IBM describes Gekko as a PowerPC derivative at 485 MHz with a lockable half of the data cache,
  DMA from that locked cache, a write-gather pipe for graphics commands,
  and an IEEE 754 FPU that also does paired singles, two single operations per register
  ([Sandon, IBM, Hot Chips 13 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc13/2_Mon/06ibm-gekko.pdf));
  [Yet Another GameCube Documentation (YAGCD)](https://hitmen.c02.at/files/yagcd/yagcd/chap2.html) gives 486 MHz (2.1).
  Quantised loads and stores convert small integers to floats by a type and scale held in registers
  (same slides; [WiiBrew, "Paired single"](https://wiibrew.org/w/index.php?oldid=120284)),
  so a recompiler specialises on those registers or takes a slow path (inference).
- WiiBrew gives the reciprocal estimates as "Accurate to a precision of 1/4096." (WiiBrew, "Paired single").
  No maker or wiki page read gives their exact bits.
  The open-tier emulator computes both `fres` and `frsqrte` from a 32-entry table of base and decrement pairs for each,
  with special cases for zero, NaN, negative, and out-of-range inputs
  ([Dolphin, `Source/Core/Common/FloatUtils.cpp`](https://github.com/dolphin-emu/dolphin/blob/7dac5ec790496bb0b10944bcbf7eade65aad671d/Source/Core/Common/FloatUtils.cpp),
  commit `7dac5ec7`, observed; an implementation's account).
- The 2014 change that added that model says that "games depend on the implementation details,
  so make sure we match the hardware", and reports physics and graphics glitches fixed
  ([Dolphin pull request #390](https://github.com/dolphin-emu/dolphin/pull/390), 2014-05-24).
  An earlier `frsqrte` table was described as "99% accurate"
  ([Dolphin commit `59e7c193`](https://github.com/dolphin-emu/dolphin/commit/59e7c1938079503724b68d78e1e5eb552cf056b7),
  2010-01-17), and since 2023 a unit test checks the `frsqrte` model against a fixed list of known values
  ([Dolphin pull request #12259](https://github.com/dolphin-emu/dolphin/pull/12259)).
  Rustalgia can learn the method from that open-tier code and write its own; the table is not copied here.
  The hardware tests that the 2014 change planned live in
  [`dolphin-emu/hwtests`](https://github.com/dolphin-emu/hwtests), which is walled, so only its prose may be read.
- Of the open-tier emulator's 1,887 per-game settings files, 24 turn on `FPRF` and 2 more `AccurateNaNs`
  ([Dolphin, `Data/Sys/GameSettings`](https://github.com/dolphin-emu/dolphin/tree/32a2b828e20612807531592002da4e7296fd2207/Data/Sys/GameSettings),
  tested locally: counted with ugrep 7.8.4).
- Broadway (Wii) is upward-compatible with Gekko at 729 MHz
  ([WiiBrew, "Hardware/Broadway"](https://wiibrew.org/w/index.php?oldid=121256)).
  IBM and Nintendo have said that Espresso
  (Wii U)
  has three cores; its 1.243125 GHz clock is among figures that "have not been officially confirmed"
  ([Wikipedia, Espresso (processor)](https://en.wikipedia.org/w/index.php?oldid=1362404111), secondary).
- The Wii and Wii U each add an ARM processor that runs the I/O and security system software
  ([WiiBrew, "Hardware/Starlet"](https://wiibrew.org/w/index.php?oldid=118313);
  [WiiUBrew, "Hardware/Starbuck"](https://wiiubrew.org/w/index.php?oldid=4847)).
  An emulator runs that software on an emulated ARM, which needs code the project never holds,
  or reimplements its services (inference).

#### Xbox and Xbox 360

- The Xbox CPU is a 733 MHz Pentium III variant for which no datasheet exists, by XboxDevWiki,
  and the overview calls the console a standard PC extended with security additions,
  while noting departures such as a system timer 6% faster than a PC's
  ([XboxDevWiki, "CPU"](https://xboxdevwiki.net/index.php?oldid=7347),
  ["Xbox Hardware Overview"](https://xboxdevwiki.net/index.php?oldid=6007)).
- Microsoft's Xbox emulation on the Xbox 360 was software aiming at the original's exact configuration,
  though the same post says it "doesn't need to emulate things exactly right", as games ignore most exceptions
  ([Microsoft Xbox team blog, "On Backwards Compatibility"](https://learn.microsoft.com/en-us/archive/blogs/xboxteam/on-backwards-compatibility-2),
  2006).
- Microsoft gives the Xbox 360 CPU as three 3.2 GHz PowerPC cores, each "2-issue per cycle, in-order",
  with two hardware threads and a vector unit of 128 registers per thread
  ([Hot Chips 17 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf),
  "CPU Chip/PPC Core Specs"), so six guest threads need a host with as many, or interleaving (inference).
  Wikipedia says its vector unit, VMX128, is not entirely compatible with AltiVec: some integer operations were removed,
  and registers and game-oriented operations added
  ([Wikipedia, AltiVec](https://en.wikipedia.org/w/index.php?oldid=1347443903), secondary).
- AltiVec's non-Java mode flushes denormals: "If an element in a source vector register contains a denormalized value,
  the value 0 is used instead"
  ([Freescale, AltiVec Programming Environments Manual](https://www.nxp.com/docs/en/reference-manual/ALTIVECPEM.pdf),
  Rev. 3, Table 2-1, VSCR[NJ]).
  Xenia Canary starts each guest thread with VSCR's NJ bit set,
  and its comment calls non-Java mode the Xbox 360's default; its `mtvscr` lets a game change the bit,
  so the mode is switchable, not fixed
  ([xenia-canary, `src/xenia/cpu/thread_state.cc`](https://github.com/xenia-canary/xenia-canary/blob/a4ef31cdf7ceb5a1890daabd34fa281c9cd58693/src/xenia/cpu/thread_state.cc)
  and
  [`src/xenia/cpu/ppc/ppc_emit_altivec.cc`](https://github.com/xenia-canary/xenia-canary/blob/a4ef31cdf7ceb5a1890daabd34fa281c9cd58693/src/xenia/cpu/ppc/ppc_emit_altivec.cc),
  commit `a4ef31cd`, observed; an implementation's account, which does not state its source for the default).
- The same emitter notes two exceptions: `vmaddfp` flushes denormal inputs "regardless of NJM",
  which a contributor measured on POWER8 hardware, not on a console,
  and dot-product denormal outputs are always made zero (same file, observed).
  Upstream Xenia leaves `mfvscr` and `mtvscr` unimplemented
  ([Xenia, `src/xenia/cpu/ppc/ppc_emit_altivec.cc`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/cpu/ppc/ppc_emit_altivec.cc),
  commit `95a5c3ee`, observed).
- The open-tier emulator's documentation calls the CPU "a 64-bit PowerPC chip running in 32-bit mode",
  close to the PlayStation 3's PPE, and describes translating it through an intermediate form to x64
  ([Xenia, `docs/cpu.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/cpu.md);
  an implementation's account); one translator could serve both consoles (inference; [R1-04](R1-04-primer-modern.md)
  holds the PS3).

#### Dreamcast

- The Dreamcast CPU is the Hitachi SH7750 (SH-4) at 200 MHz, a 32-bit RISC core with 16-bit instructions, an MMU,
  32 single-precision floating-point registers, and 8 KiB instruction and 16 KiB data caches
  ([Comstedt, Dreamcast programming, SH-4 page](http://mc.pp.se/dc/cpu.html); a lead, dated 2000).
- The maker's manual gives the floating-point modes: two banks of sixteen registers; status bits that select the bank,
  the transfer size, and single or double precision, so one opcode means a single or a double operation by mode
  ([Renesas, SH-4 Software Manual](https://www.renesas.com/en/document/mas/sh-4-software-manual), Rev. 6.00, 6.3).
  A recompiler keys its translations on that mode (inference).
- Its inner-product and matrix instructions are approximate by design:
  "Geometric operation instructions perform approximate-value computations", discarding small partial products
  (Renesas, SH-4 Software Manual, 6.6.1), and they differ from the same sum built from separate operations (6.4).
  The manual lists errata in those instructions (6.7.2, 6.7.3) and in double-precision arithmetic
  (6.7.4, 6.7.5), and says the addition and subtraction erratum affects all SH-4 products (6.7.4).
  A host's arithmetic will not match bit for bit (inference);
  whether games depend on the exact error was not found in the Dreamcast sources listed below
  ([Open questions](#open-questions)).

#### PSP and Vita

- Sony's 2004 slides give the PSP two MIPS R4000-class cores with FPUs, one also with a vector unit (VFPU),
  the other the Media Engine, plus 4 MiB of embedded DRAM
  ([Kurose and others, Sony, Hot Chips 16 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc16/3_Tue/8_HC16_Sess8_Pres1_bw.pdf)).
- The VFPU's 128 registers are addressable singly or as rows, columns, and matrices,
  with prefixes that alter inputs and outputs;
  vfpu-docs' VFPU chapter says rounding is fixed to nearest and subnormals are flushed
  ([vfpu-docs, `docs/introduction.md`](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/docs/introduction.md)).
  Some matrix instructions forbid overlapping inputs and outputs, which give incorrect results
  (same file),
  and two instructions write the wrong output registers on every model, an error that "seems to be deterministic"
  ([`docs/bugs.md`](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/docs/bugs.md));
  the [README](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/README.md) says each
  instruction statement has a test that runs on a PSP.
  "Sony did not release any public documentation (nor SDK/toolchain) for the Sony PSP" (vfpu-docs, README).
- Games reach the Media Engine only through libraries, which the open-tier emulator has emulated at a high level
  ([PPSSPP, "The PSP Media Engine and its implementation"](https://www.ppsspp.org/docs/development/ppsspp-internals/media-engine));
  from 1.21 some run as real modules where available (same page).
- The Vita has four Cortex-A9 cores
  ([Vita Development Wiki, "Main_Processor"](https://wiki.henkaku.xyz/vita/Main_Processor)), a media subsystem of eight
  Toshiba MeP cores (same wiki, ["Venezia"](https://wiki.henkaku.xyz/vita/Venezia)), and a security processor (same
  wiki, ["Security"](https://wiki.henkaku.xyz/vita/Security)), whose services an emulator would reimplement (inference).
- The Vita runs most PSP games, but only those released digitally, because it has no UMD drive
  ([Wikipedia, PlayStation Vita](https://en.wikipedia.org/w/index.php?oldid=1386319237), "Backward compatibility",
  secondary).
- The Vita wiki's "PSP Emulator" page maps a PSP-side memory layout of scratchpad, video memory, 64 MB of main memory,
  and an interrupt manager it says serves communication between the MIPS side and Kermit, on the ARM side;
  it also describes a shared SRAM mapped on the ARM side and an LCD DMA block
  ([Vita Development Wiki, "PSP Emulator"](https://web.archive.org/web/20261022170441/https://wiki.henkaku.xyz/vita/PSP_Emulator),
  oldid 21611, last edited 2025-08-14).
  "Kermit" is the wiki's name for the Vita's main system-on-chip
  ([same wiki, "Kermit"](https://web.archive.org/web/20261022163007/https://wiki.henkaku.xyz/vita/Kermit), oldid 21635).
  Both were read from captures because the live wiki refuses scripts with a bot check.
- The "PSP Emulator" page states no origin,
  so only the existence of a MIPS side that talks to the ARM cores is recorded, and no addresses.
- So PSP software runs on a MIPS processor beside the ARM cores, served by the Vita's own system software,
  and an emulator of the Vita's PSP mode is a PSP emulator inside a Vita emulator (inference).

#### Nintendo 3DS

- The original 3DS has a dual-core ARM11 MPCore at 268 MHz, "exactly twice the clock rate of the ARM9"
  ([3dbrew, "Hardware"](https://www.3dbrew.org/w/index.php?oldid=23948)).
  The New 3DS has four cores, and those running the current application can run at 804 MHz,
  a clock the same page says was timed on a console with a long idle loop between two reads of the system tick
  (3dbrew, "Hardware"; [Wikipedia, Nintendo 3DS](https://en.wikipedia.org/w/index.php?oldid=1386371150),
  which cites that page, secondary).
- Facts that 3dbrew's "New_3DS" page takes from disassembled system modules are firmware-derived and are not recorded,
  because the note records no fact a source says it took from firmware analysis unless a hardware test confirms it.
  The "Hardware" page also cites an unnamed "Official Documentation", whose origin it does not state;
  nothing here rests on that citation.
- One ARM11 core is reserved for the operating system, and the ARM9 serves mainly DS and DSi compatibility
  (Wikipedia, Nintendo 3DS, secondary); DS-mode hardware is [R1-02](R1-02-primer-32-and-64-bit.md)'s.

#### Across the era

- Most major CPUs found here (PS2, GameCube and Wii, the Xbox 360's vector unit, Dreamcast, PSP) produce floating-point
  results host defaults will not reproduce, and vector register files (128 per thread on the Xbox 360, 128 with matrix
  views on the PSP) exceed a host's, so guest registers live in memory (inference from the findings above).
- Symmetric multi-core guests (Xbox 360, Wii U, 3DS, Vita) need the guest's memory ordering on the host; asymmetric ones
  (PS2, Wii, PSP) need synchronisation between unlike processors (inference).
- Main CPU clocks run from 200 MHz (Dreamcast) to three cores at 3.2 GHz
  (Xbox 360),
  and Wikipedia describes dynamic recompilation as common in such emulators
  ([Wikipedia, "Dynamic recompilation"](https://en.wikipedia.org/w/index.php?oldid=1386329890), secondary).
  Code that overwrites itself ([ps2tek](https://psi-rockin.github.io/ps2tek/), "Cache Coherency",
  on one game's decompressor) and microprograms uploaded through the vector interface
  (ps2tek, "Vector Interface (VIF)") appear, so a recompiler needs invalidation tied to writes into code (inference).
- No maker-hosted manual was found for the main CPUs of the PS2, GameCube, Wii, Wii U, Xbox 360,
  or PSP in the [register](../../../.claude/hooks/source-register.txt)'s sources
  or [R0-05](R0-05-source-map.md)'s search, and no single-step test vectors for any of them;
  the only SH-4 vectors found were generated with another emulator
  ([SingleStepTests sh4 README](https://github.com/SingleStepTests/sh4/blob/48975cb1a9569abb5a0cba587013ea54edf79100/README.md)).

### Memory, buses, and storage

#### PlayStation 2

- The core reaches its 32 MiB of main memory through cached, uncached, and "uncached and accelerated" windows,
  and its scratchpad only by virtual address; beside it sit the vector units' memories,
  2 MiB of I/O-processor RAM mapped into its space, 4 MiB of graphics memory, and 2 MiB of sound memory
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "Memory Map").
  A 48-entry TLB written by software maps user addresses, with a bit that redirects a page to the scratchpad
  (ps2tek, "EE COP0 Memory Management").
- Sony gives the graphics chip's embedded DRAM a 2,560-bit width
  ([Kutaragi, Sony, Hot Chips 11 keynote](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf),
  slides 11 and 12), which would let games re-read and rewrite the framebuffer cheaply (inference).
- The DMA controller moves 16 bytes at bus speed on ten channels and walks chains of tags,
  read from memory in source chain mode and from the peripheral in destination chain mode
  (ps2tek, "DMA Controller (DMAC)", "DMAC I/O", "DMAC Chain Mode");
  its address registers "update while a transfer is ongoing", and certain games rely on them changing
  (ps2tek, "DMAC I/O").
- The graphics interface takes work from three paths in fixed priority
  (ps2tek, "Graphics Interface (GIF)"),
  and ps2tek names a game that hangs on a black screen when PATH3 masking is emulated without the GIF FIFO
  (ps2tek, "GIF PATH3 Masking").
  DMA is concurrent state with arbitration, not a copy made when a register is written (inference).
- Memory cards are flash with a file system, and "Certain games do not work if the memory card is larger than expected,
  for unknown reasons" (ps2tek, "SIO2 PS2 Memcards"); they use Sony's MagicGate encryption
  ([Wikipedia, PlayStation 2 technical specifications](https://en.wikipedia.org/w/index.php?oldid=1355643867),
  secondary; ps2tek, "BIOS IOP SECRMAN - Security Manager"), which an emulator bypasses at a high level,
  because the project holds no keys (inference; [R0-02](R0-02-legal-baseline.md#firmware-keys-and-game-copies)).
- ps2autotests holds results recorded on a console for the DMA controller and the vector interface
  ([`tests/dma`](https://github.com/unknownbrackets/ps2autotests/tree/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/dma),
  observed).

#### GameCube and Wii

- The GameCube has 24 MiB of 1T-SRAM and a separate 16 MiB audio RAM on a bus YAGCD calls "by far the slowest one,
  clocked at only 81MHz" ([YAGCD](https://hitmen.c02.at/files/yagcd/yagcd/chap2.html), 2.4.2 and 2.5);
  its CPU-bus figures disagree, so none is recorded.
- The CPU sees memory through fixed cached and uncached windows, the embedded framebuffer through its own,
  and a 16 KiB region that YAGCD's map labels "L2 Cache" and its 2.1 calls a data scratchpad
  (YAGCD, 2.1 and [4.1](https://hitmen.c02.at/files/yagcd/yagcd/chap4.html)).
  Audio RAM is not mapped into the CPU's memory
  ([WiiBrew, "Memory map"](https://wiibrew.org/w/index.php?oldid=121456));
  a DMA engine and the DSP's "accelerator" reach it, with 32-byte alignment
  ([YAGCD, 5.6](https://hitmen.c02.at/files/yagcd/yagcd/chap5.html);
  [WiiBrew, "Hardware/DSP"](https://wiibrew.org/w/index.php?oldid=116811)).
- The Wii adds 64 MiB of GDDR3, and "The Wii does not have the ARAM chip; instead, DSP can access MEM1 or MEM2"
  (WiiBrew, "Memory map");
  its ARM processor can lock part of that memory against the main CPU,
  and its flash holds a file system encrypted with a per-console key
  ([WiiBrew, "Hardware/Starlet"](https://wiibrew.org/w/index.php?oldid=118313),
  ["Hardware/NAND"](https://wiibrew.org/w/index.php?oldid=121606)).
  Emulators present saves as folders, which keeps keys out (inference).

#### Wii U

- WiiUBrew describes 2 GiB of DDR3 (MEM2), 32 MiB of fast memory (MEM1), and the old framebuffer memory (MEM0)
  ([WiiUBrew, "Memory map"](https://wiiubrew.org/w/index.php?oldid=4859);
  ["Hardware"](https://wiiubrew.org/w/index.php?oldid=4831)).
  The sources disagree on what MEM1 is: WiiUBrew says 1T-SRAM, and Wikipedia says embedded DRAM on the GPU.
  Wikipedia's own footnote marks that hardware as unconfirmed: "Neither Nintendo,
  IBM nor AMD has revealed detailed specifications"
  ([Wikipedia, Wii U](https://en.wikipedia.org/w/index.php?oldid=1386323270), secondary).
  No maker statement was found that settles the cell type, and what an emulator models
  (32 MiB, its address, and its fast access) is given by WiiUBrew's memory map whatever the cell type (inference).
- Titles run under a kernel that gives each process its own address space
  ([WiiUBrew, "Cafe OS"](https://wiiubrew.org/w/index.php?oldid=4900)).
  The pages' layouts are system software's, of unstated origin, and are not recorded;
  a high-level emulator reproduces the map the kernel gives a title (inference).

#### Xbox and Xbox 360

- The Xbox has 64 MiB of memory shared by the CPU and the GPU
  ([XboxDevWiki, "Memory"](https://xboxdevwiki.net/index.php?oldid=7416)),
  a kernel closely related to Windows NT's that exports virtual-memory functions
  (XboxDevWiki, ["Kernel"](https://xboxdevwiki.net/index.php?oldid=6596)),
  and a standard IDE hard disk, locked by the console, with its own file system
  (XboxDevWiki, ["Hard Drive"](https://xboxdevwiki.net/index.php?oldid=7037),
  ["FATX"](https://xboxdevwiki.net/index.php?oldid=7419)).
- Microsoft describes the Xbox 360's 10 MiB of embedded DRAM, on a die beside the GPU's main die,
  as a way to take framebuffer and depth fill out of the unified memory
  ([Hot Chips 17 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf),
  "Architectural Choices - EDRAM", "GPU Block Diagram").
  Its CPU caches use 128-byte lines and its first-level data caches are write-through
  (same slides, "CPU Data Streaming Specs").
- Free60 describes a hypervisor that runs in real mode with paging disabled and can reach any memory,
  while user-mode code cannot reach the hypervisor's space
  ([Free60, "Hypervisor"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hypervisor.md)).
  An emulator implements the services the hypervisor and kernel give games rather than the hypervisor itself (inference;
  [Xenia's `docs/kernel.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md)
  describes that approach for the kernel).
- Earlier board revisions carry 16 MiB of NAND flash; Jasper-era bundles sold without a hard disk got 256 MiB or 512 MiB
  ([Free60, "NAND"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hardware/Console/NAND/index.md)),
  and the disk is needed for original Xbox games
  ([Free60, "HDD"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hardware/Console/HDD.md)).

#### Dreamcast

- The Dreamcast has 16 MiB of system RAM and 8 MiB of video RAM
  ([dreamcast.wiki, "Memory map"](https://dreamcast.wiki/Memory_map);
  [Comstedt, memory map](http://mc.pp.se/dc/memory.html)).
  The top three bits of each 32-bit logical address select mapping and caching over a 29-bit physical space
  (dreamcast.wiki, "Memory map"),
  and the SH7750 group's MMU has a 64-entry unified TLB
  ([Renesas, SH7750 Group User's Manual: Hardware](https://www.renesas.com/en/document/mah/sh7750-sh7750s-sh7750r-group-users-manual-hardware),
  Rev. 7.02, section 1).
  The video RAM is seen through two windows that arrange the same memory differently
  ([dreamcast.wiki, "VRAM"](https://dreamcast.wiki/VRAM)).
- The memory card, the VMU, is itself a small computer with an 8-bit Sanyo CPU and flash memory
  ([dreamcast.wiki, "VMU hardware overview"](https://dreamcast.wiki/VMU_hardware_overview)).
  Emulating saves fully means emulating a second machine; a high-level card is the alternative (inference).

#### PSP and Vita

- The PSP's CPU has no TLB ([YAPSPD, 4.3.1](https://hitmen.c02.at/files/yapspd/psp_doc/chap4.html) and
  [7.1](https://hitmen.c02.at/files/yapspd/psp_doc/chap7.html)); it has data and instruction caches, "only a 32k L1
  cache" and no second level, and no hardware coherence with DMA (YAPSPD, 4.10).
  Its 4 MiB of embedded DRAM is two 2 MiB blocks, one in the graphics chip and one in the Media Engine
  (YAPSPD, [chapter 2](https://hitmen.c02.at/files/yapspd/psp_doc/chap2.html) and the
  [chapter 3](https://hitmen.c02.at/files/yapspd/psp_doc/chap3.html) parts list), and its video memory appears mirrored
  at several offsets that change how the depth buffer reads back
  ([YAPSPD, 10.2](https://hitmen.c02.at/files/yapspd/psp_doc/chap10.html)).
  YAPSPD's [first chapter](https://hitmen.c02.at/files/yapspd/psp_doc/chap1.html) warns that it may be wrong.
- The Vita has 512 MiB of DRAM, which the wiki tentatively places on two channels, plus video memory
  ([Vita Development Wiki, "Physical Memory"](https://wiki.henkaku.xyz/vita/Physical_Memory)).

#### Nintendo 3DS

- The ARM11 cores see 128 MiB of FCRAM, 256 MiB on the New 3DS, plus video memory, DSP memory, and a shared work RAM,
  and the ARM9 sees the same plus memory of its own
  ([3dbrew, "Memory layout"](https://www.3dbrew.org/w/index.php?oldid=21472));
  Wikipedia's table gives the same two sizes
  ([Wikipedia, Nintendo 3DS](https://en.wikipedia.org/w/index.php?oldid=1386371150), secondary).
- The 3DS has three DMA systems, one used by the ARM9's code and two Arm CoreLink engines
  (3dbrew, ["NDMA Registers"](https://www.3dbrew.org/w/index.php?oldid=21618);
  ["Corelink DMA Engines"](https://www.3dbrew.org/w/index.php?oldid=21473)).
  Its NAND and SD contents are encrypted
  (3dbrew, ["Flash Filesystem"](https://www.3dbrew.org/w/index.php?oldid=23624);
  ["SD Filesystem"](https://www.3dbrew.org/w/index.php?oldid=20468)),
  so emulators present title storage decrypted by the user's own tools or as folders
  (inference; [R0-02](R0-02-legal-baseline.md#firmware-keys-and-game-copies)).

#### Patterns

- Most worked examples pair a large general pool with a small fast pool beside the GPU: the PS2's graphics DRAM,
  the GameCube and Wii embedded framebuffer, the Wii U's MEM1, the Xbox 360's embedded DRAM, the PSP's embedded DRAM,
  and the 3DS's video memory (inference from the findings above).
  The Xbox has one shared pool; the Dreamcast's, Vita's, and 3DS's video memories are not shown to be faster.
- Address translation ranges from none on the PSP, through fixed segments and block mappings, to software TLBs
  (PS2; the Dreamcast's MMU, normally disabled, by [dreamcast.wiki, "Memory map"](https://dreamcast.wiki/Memory_map))
  and kernels that give each process its own address space (Wii U) (inference from the findings above).
  Keeping caches coherent with DMA is the program's job on the PS2
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "Cache Coherency")
  and the PSP ([YAPSPD, 4.10](https://hitmen.c02.at/files/yapspd/psp_doc/chap4.html)).

### Graphics

#### How the era's graphics are documented

- No maker specification was found for any major graphics chip of the era in the
  [register](../../../.claude/hooks/source-register.txt)'s sources or [R0-05](R0-05-source-map.md)'s search, so the
  record is wikis, maker talks and patents, and emulators' writing.
- The era runs from fixed pipelines (Dreamcast, PS2, PSP) through configurable combiners
  (GameCube, Wii, Xbox)
  to programmable shaders (Xbox 360, Vita, Wii U),
  and "PICA200 is compatible with OpenGL ES 1.1." with a programmable vertex stage
  ([3dbrew, "Hardware"](https://www.3dbrew.org/w/index.php?oldid=23948); the arc is inference from the findings below).

#### PlayStation 2: Graphics Synthesizer

- The Graphics Synthesizer holds framebuffer, textures, and depth buffer together in 4 MiB of memory
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "Memory Map"),
  and ps2tek says "the GS only supports single-pass texturing and is entirely fixed-unit."
  (ps2tek, "GS Special Effects and Optimizations").
- Its blend unit has one fixed equation with selectable inputs, and "Internally,
  alpha-blending treats each color component as 9-bit.
  The output is then clamped accordingly by COLCLAMP."; with clamping off it keeps only the low bits, so results wrap
  (ps2tek, "GS Alpha Blending").
  Host blend units saturate, so wrapping and 9-bit arithmetic need shader work (inference).
- ps2tek documents techniques that rely on the memory layout,
  among them masking that a modern GPU cannot express directly: "modern GPUs mask on the byte level,
  but games can mask on the bit level,
  which requires a slow fragment shader to process the effect correctly
  if the game doesn't fully mask on the byte level." (same section).
  The memory is not linear: colour and depth formats, and 32-bit and 8-bit textures, are swizzled differently
  (same section), so a game that reads one format as another forces the emulator to convert between layouts (inference).
- The GS draws points, lines, strips, fans, triangles, and two-vertex rectangles
  (ps2tek, "GS Primitives"), and has two output circuits, each with its own display buffer (ps2tek, "I/O Maps").
  Geometry reaches it by three paths: from VU1, through VIF1, and by DMA from main memory
  (ps2tek, "Graphics Interface (GIF)").
- The open-tier PS2 emulator's game database carries per-game options for its hardware renderer,
  such as blending accuracy levels
  ([PCSX2, `bin/docs/GameIndex.pdf`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/docs/GameIndex.pdf);
  an implementation's options), so no single host configuration fits every title (inference).

#### GameCube and Wii: the texture environment

- Nintendo's patent describes a texture-environment unit of "Up to sixteen independently programmable consecutive
  stages, forming a chain of blending operations", on values it gives as "unsigned 8-bit values or signed 10-bit values
  but other implementations could provide different precisions."
  ([US 7,034,828](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7034828), Nintendo, abstract and
  column 11, of multiplexer outputs in an example embodiment; patent office copy read by optical recognition).
- The Dolphin team writes that imitating the GPU's integer arithmetic in floating point was doomed,
  because 32-bit floats lack the precision to emulate 24-bit integers
  ([Dolphin blog, "Pixel Processing Problems"](https://web.archive.org/web/20260701132119/https://dolphin-emu.org/blog/2014/03/15/pixel-processing-problems/),
  2014, capture of 2026-07-01).
- Dolphin turns each configuration into a host shader, and "shaders have to be compiled, which takes time";
  in its hybrid mode, a general shader compiled in advance renders each new configuration at once, without stutter,
  while the specialised one compiles
  ([Dolphin blog, "Ubershaders"](https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/),
  2017, capture of 2026-11-03).
- The GPU renders into "a special 2MB chunk of memory on the GPU itself, separate from the shared main memory",
  then copies frames to main memory, and some games alter frames there
  ([Dolphin blog, "To the Screen with Hybrid XFB"](https://web.archive.org/web/20260524104646/https://dolphin-emu.org/blog/2017/11/19/hybridxfb/),
  2017, capture of 2026-05-24).
  WiiBrew calls the Wii's graphics capabilities similar to the GameCube's, at a higher clock
  ([WiiBrew, "Hardware/GX"](https://wiibrew.org/w/index.php?oldid=110039)).

#### Dreamcast: tile-based rendering

- "The Tile Accelerator divides the scene into 32 by 32 pixel tiles, which can be rendered individually."
  ([Comstedt, Dreamcast programming, "PowerVR"](http://mc.pp.se/dc/pvr.html); a lead).
  A VideoLogic patent, filed in 1995 and granted in 1998, describes deciding per pixel, within screen regions,
  which surface is visible ([US 5,729,672](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5729672),
  VideoLogic, read from the patent office copy).
- Wikipedia says the method "allows for correct rendering of partially transparent polygons,
  independent of the order in which they are processed"
  ([Wikipedia, PowerVR](https://en.wikipedia.org/w/index.php?oldid=1369795331), secondary).
  A host GPU draws in submission order, so order-independent transparency must be emulated (inference).

#### Xbox: NV2A

- XboxDevWiki places the NV2A in NVIDIA's family of the GeForce3
  ([XboxDevWiki, "NV2A"](https://xboxdevwiki.net/index.php?oldid=6894)).
  Its vertex stage follows NVIDIA's vertex-program extension with some modifications,
  and its pixel stage is texture shaders plus register combiners
  (XboxDevWiki, ["NV2A/Vertex Shader"](https://xboxdevwiki.net/index.php?oldid=7422),
  ["NV2A/Pixel Combiner"](https://xboxdevwiki.net/index.php?oldid=6853)).
- NVIDIA's own extension texts describe those stages; one notes a precision detail outside its main text:
  "The fact that NV10 does the computations as 9-bit signed fixed point is not mentioned in the spec."
  ([NVIDIA, `NV_register_combiners`](https://registry.khronos.org/OpenGL/extensions/NV/NV_register_combiners.txt),
  Khronos registry).
  Matching the combiners' fixed-point arithmetic in host shaders is the NV2A's version of the GameCube's precision
  problem (inference).
- The walled-tier Xbox emulator says it emulates the original hardware at a low level
  ([xemu home page](https://xemu.app/), prose).

#### Xbox 360: Xenos and its embedded DRAM

- Microsoft gives Xenos as a 500 MHz GPU with "48 parallel shader cores (ALUs); dynamically scheduled; 32bit IEEE FLP",
  with 10 MiB of embedded DRAM meant to "Take FB/ZB fill-rate out of the equation"
  ([Hot Chips 17 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf)).
  Free60 relates it to ATI's R500 series
  ([Free60, "Xenos (GPU)"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hardware/Console/Xenos_%28GPU%29.md)).
- A developer of the open-tier emulator writes: "The Xbox 360 allows games to draw only to eDRAM — after drawing,
  resolving ... is necessary to write the result to the back buffer for presentation or to a texture
  for subsequent usage in shaders."
  ([Xenia, "Leaving No Pixel Behind"](https://xenia.jp/updates/2021/04/27/leaving-no-pixel-behind-new-render-target-cache-3x3-resolution-scaling.html),
  2021).
  The article gives the eDRAM's tile size and storage formats, and reports that 24-bit floating-point depth,
  emulated as 32-bit on the host, must survive round trips through eDRAM (same article).
  Emulating the resolve step and the console's own formats is where most of the work lies (inference).
- The article's writer states never having used Microsoft's development kit (same article).

#### PSP

- Sony's slides give a rendering engine and a surface engine at 166 MHz
  ([Hot Chips 16 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc16/3_Tue/8_HC16_Sess8_Pres1_bw.pdf)).
  YAPSPD says each command is a 32-bit word with an 8-bit command and a 24-bit argument,
  and that "Floats processed in the command-stream are 24 bits instead of 32 that are used by the CPU."
  ([YAPSPD, 11.1 and 11.2](https://hitmen.c02.at/files/yapspd/psp_doc/chap11.html)).
- The open-tier PSP emulator's change log records rendering a software depth buffer alongside the hardware renderer to
  fix lens flares in several games "efficiently"
  ([PPSSPP, README](https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md), "What's
  new in 1.19"), one case of computing on the CPU what is slow to read back from a host GPU (inference).

#### Nintendo 3DS: PICA200

- The PICA200 is driven by command buffers that write internal registers; its fragment stage is fixed,
  with six texture-combiner stages and per-pixel lighting from tables
  (3dbrew, ["GPU/Internal Registers"](https://www.3dbrew.org/w/index.php?oldid=23943),
  ["GPU/Fragment Lighting"](https://www.3dbrew.org/w/index.php?oldid=20751)).
  Its vertex shader instruction set "seems to have been heavily inspired by" Microsoft's `vs_3_0`
  ([3dbrew, "GPU/Shader Instruction Set"](https://www.3dbrew.org/w/index.php?oldid=22377)).
- 3dbrew: "The PICA200 is not IEEE-compliant.
  It has positive and negative infinities and NaN, but does not seem to have negative 0.
  Input and output subnormals are flushed to +0." (3dbrew, "GPU/Shader Instruction Set").
- In 3D mode the top screen interlaces two framebuffers by scanline
  ([3dbrew, "GPU/External Registers"](https://www.3dbrew.org/w/index.php?oldid=23708)).
  The GPU renders into tiled buffers that a transfer engine converts for display (same page).
- The developers of Citra, predecessor of the open-tier
  [Azahar](https://github.com/azahar-emu/azahar/blob/cf42aef23778d7e8bea6a468e12f53943dd87cd0/README.md), wrote in 2018
  that most PICA200 emulation had run on the CPU, and that all of it now ran on the host GPU, the guest's shader
  programs translated into host shaders
  ([Citra site archive, "Hardware Renderer Updates"](https://citra.azahar-emu.org/entry/improvements-to-hardware-renderer/)).
- 3dbrew's register list has an "Official Name" column of unstated origin, whose form suggests a maker's document
  (3dbrew, "GPU/Internal Registers"; inference).
  The names are not used here: a name from a wiki is recorded only where an emulator must match it to work,
  and no emulator needs these names.

#### Vita and Wii U

- The Vita embeds an SGX543MP4+ GPU ([Vita Development Wiki, "GPU"](https://wiki.henkaku.xyz/vita/GPU)).
  The wiki compares the GPU's kernel module with the open-source Linux PowerVR kernel module (same page).
  A user-mode library, `SceGxm`, exports the graphics functions
  (same wiki, ["SceGxm"](https://wiki.henkaku.xyz/vita/SceGxm), observed),
  so a high-level emulator implements that library over a host API (inference).
- WiiUBrew relates the Wii U's GPU to AMD's Radeon R7xx family and says:
  "While documentation perfectly matching the card is yet to be found,
  several documents can be brought together to form a reasonable picture of the register layout."
  ([WiiUBrew, "Hardware/GX2"](https://wiiubrew.org/w/index.php?oldid=3754)).
  Among those documents the page lists AMD's R6xx and R7xx register guides.
- AMD's own links to those guides redirected to a portal page that needs a script to load
  (research log), and the copies elsewhere are maker documents on third-party hosts; neither was read.
  AMD's [GPUOpen documentation page](https://gpuopen.com/amd-gpu-architecture-programming-documentation/) says its
  instruction-set manuals reach back to the Radeon R600, but none of its PDF links is an R600 or R700 document: they
  cover RDNA, CDNA, and GCN3 to Vega (observed).
  The register layout can be learned instead from the open-tier implementations, which define it in
  [Cemu, `src/Cafe/HW/Latte/ISA/LatteReg.h`](https://github.com/cemu-project/Cemu/blob/2f49c079da1d50b85cea0ed99aedda58846b3523/src/Cafe/HW/Latte/ISA/LatteReg.h)
  and
  [decaf-emu, `src/libgpu/latte/`](https://github.com/decaf-emu/decaf-emu/tree/e6c528a20a41c34e0f9eb91dd3da40f119db2dee/src/libgpu/latte)
  (file names observed in the listings; inference).

#### What host-GPU emulation needs, across the era

- Vulkan pipeline caches let compiled pipelines be reused between pipelines and between runs
  ([Khronos, `VkPipelineCache`](https://registry.khronos.org/vulkan/specs/latest/man/html/VkPipelineCache.html)),
  and an extension lets parts of a pipeline be compiled separately and linked later
  ([Khronos, `VK_EXT_graphics_pipeline_library`](https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_graphics_pipeline_library.html)),
  which bears on the stutter Dolphin describes
  ([Dolphin blog, "Ubershaders"](https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/);
  inference).
- With the fragment shader interlock extension,
  a fragment shader may read the destination by image loads and write the result by image stores,
  so blending the host cannot express can move into the shader
  ([Khronos, `VK_EXT_fragment_shader_interlock`](https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_fragment_shader_interlock.html)).
  Dual-source blending and logic operations are optional device features
  ([Khronos, `VkPhysicalDeviceFeatures`](https://registry.khronos.org/vulkan/specs/latest/man/html/VkPhysicalDeviceFeatures.html)),
  so the set of hosts that can run an accurate renderer depends on them (inference).
- The era's GPUs compute in formats hosts do not: integer texture-environment arithmetic (GameCube), 9-bit blends (PS2),
  fixed-point combiners (NV2A, by NVIDIA's account of the NV10 in
  [`NV_register_combiners`](https://registry.khronos.org/OpenGL/extensions/NV/NV_register_combiners.txt); inference),
  24-bit floats (PSP commands, Xbox 360 depth), and non-IEEE shaders (3DS) (findings above).
  Across the projects read, emulators decode the command stream, track guest graphics memory in the console's layout,
  generate host shaders per configuration, and cache them (inference from the emulator writing cited above).

### Audio

- Audio takes five forms (inference from the findings below): a DSP running a program the game or its library uploads
  (GameCube, Wii, 3DS, the Xbox's two programmable DSPs, the Dreamcast's ARM7);
  a fixed voice synthesiser (PS2, the Xbox's voice processor, the 3DS's second sound unit);
  a fixed decoder plus mixing in software (Xbox 360); a media processor reached only through system libraries
  (PSP, and by its libraries the Vita);
  and a DSP running fixed microcode from ROM
  (Wii U, by a statement in [WiiUBrew, "Hardware/DSP"](https://wiiubrew.org/w/index.php?oldid=4300) marked for
  checking).
  The first is where high-level against low-level emulation matters most.

#### GameCube and Wii

- "At the heart of the GCN audio hardware is a custom digital signal processor (DSP)
  which is largely dedicated to pitch modulation and the mixing of voices and effects data."
  ([YAGCD, 5.6](https://hitmen.c02.at/files/yagcd/yagcd/chap5.html)).
  YAGCD gives it an 81 MHz clock; Nintendo's patent describes an embodiment at 100 MHz
  ([US 6,606,689](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6606689), column 7,
  patent office copy).
- Its program is not fixed: "During system initialization, a runtime audio library is downloaded to audio DSP 156."
  (US 6,606,689, column 8).
  The open-tier emulator reimplements the common program families at a high level
  and says "LLE uses DSP ROM files to emulate the DSP's hardware behavior."
  ([Dolphin wiki, "Audio Emulation"](https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation)).
  Its replacement DSP ROM is closed in the [register](../../../.claude/hooks/source-register.txt),
  so the note gives no link to it.
- On the Wii, "ARAM does not physically exist in Wii hardware."
  ([WiiBrew, "Hardware/DSP"](https://wiibrew.org/w/index.php?oldid=116811)),
  and on the Wii U, WiiUBrew says that under Cafe OS the DSP "always runs the same microcode from ROM rather than being
  per-title", marked for checking ([WiiUBrew, "Hardware/DSP"](https://wiiubrew.org/w/index.php?oldid=4300)).
- High-level emulation does not depend on that answer: Cemu reimplements the `snd_core` AX library in host code,
  including ADPCM decoding and mixing
  ([Cemu, `src/Cafe/OS/libs/snd_core/`](https://github.com/cemu-project/Cemu/tree/2f49c079da1d50b85cea0ed99aedda58846b3523/src/Cafe/OS/libs/snd_core),
  commit `2f49c079`, observed).

#### Nintendo 3DS

- The 3DS's DSP, a Teak-family processor by
  [Teakra's README](https://github.com/wwylele/teakra/blob/3d697a18df504f4677b65129d9ab14c7c597e3eb/README.md)
  ([3dbrew's "Hardware"](https://www.3dbrew.org/w/index.php?oldid=23948) says CEVA TeakLite), runs a program the title
  supplies
  ([Citra site archive, "Accurate Audio Emulation Has Arrived"](https://citra.azahar-emu.org/entry/accurate-audio-emulation/)),
  which "requires RSA-signed DSP firmware"
  ([3dbrew, "DSP:LoadComponent"](https://www.3dbrew.org/w/index.php?oldid=15977)), and talks to the game through shared
  memory; a second sound unit can play at the same time (3dbrew,
  ["DSP Memory Region"](https://www.3dbrew.org/w/index.php?oldid=22774),
  ["DSP Services"](https://www.3dbrew.org/w/index.php?oldid=17913)).
- Citra's developers built high-level audio by tracing shared memory, modelled on the most common program,
  and found that games with another program broke
  ([Citra site archive, "HLE Audio Comes to Citra"](https://citra.azahar-emu.org/entry/hle-audio-comes-to-citra/), 2016;
  "Accurate Audio Emulation Has Arrived", 2018);
  the 2016 post credits the community's reverse engineering of the DSP firmware, a firmware-derived origin.
- Of their low-level emulator they wrote "When it comes to writing an LLE DSP emulator, it's all or nothing."
  (same post of 2018); it ships testers that run on a 3DS (Teakra, README).
  Citra kept high-level emulation as the default in 2018
  (the 2018 post),
  and Dolphin's wiki says "all sound issues need to be confirmed with LLE."
  ([Dolphin wiki, "Audio Emulation"](https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation)).

#### PlayStation 2

- The SPU2 is a sound processor of two cores with 24 voices each and 2 MiB of its own RAM,
  attached to the I/O processor with its own DMA channels
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "I/O Maps", "Memory Map").
  ps2tek names a game whose library for a custom sound module reuses one buffer for sending and receiving,
  and which needs cache emulation to boot (ps2tek, "Cache Coherency").
  Sound reaches the SPU2 through the I/O processor's modules
  (ps2tek, "BIOS IOP LIBSD - Low-level Sound Library"),
  so high-level emulation of those modules is an alternative to running them (inference).

#### Xbox and Xbox 360

- The Xbox's audio processing unit has a fixed voice processor for up to 256 voices and two programmable DSPs,
  one for effects and one for output encoding,
  and "All audio processing by the APU is typically done in 24bit PCM at 48000Hz."
  ([XboxDevWiki, "APU"](https://xboxdevwiki.net/index.php?oldid=7415)).
  The library loads the encoder's program: "The EP code is loaded by DirectSound.
  The EP is not programmable using DirectSound APIs." (same page).
  The walled-tier emulator says "Surround Sound isn't implemented in xemu yet."
  ([xemu, FAQ](https://xemu.app/docs/faq/)).
- Microsoft's block diagram places an XMA decoder in the Xbox 360's I/O chip
  ([Hot Chips 17 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf)),
  and Wikipedia says "Sound files for games are encoded using Microsoft's XMA audio format."
  ([Wikipedia, Xbox 360 technical specifications](https://en.wikipedia.org/w/index.php?oldid=1386323517), secondary).
- Microsoft calls XAudio2 "a signal processing and mixing foundation for games"
  ([Microsoft Learn, "XAudio2 Introduction"](https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-introduction),
  dated 2018-05-31), and says: "On Xbox 360, XAudio2 ships as a static library that is compiled into the main game
  executable."
  ([Microsoft Learn, "XAudio2 Versions"](https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-versions),
  dated 2018-05-31).
  With an XMA decoder as the only audio block in the diagram,
  mixing and effects run as game code on the CPU (inference).
  Xenia's audio system takes buffers of samples that guest code has already produced, and has no mixer of its own
  ([Xenia, `src/xenia/apu/audio_system.cc`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/apu/audio_system.cc),
  commit `95a5c3ee`, observed).

#### Dreamcast

- The AICA is a Yamaha sound processor related to the Saturn's SCSP, with 64 channels and an ARM7 core of its own
  ([Sega Retro, "AICA"](https://segaretro.org/index.php?oldid=1163931), secondary: the article is marked for cleanup;
  [dreamcast.wiki, "Hardware overview"](https://dreamcast.wiki/Hardware_overview)).
- KallistiOS's sound initialisation loads its own stream driver into sound RAM and "replaces the AICA program"
  ([KallistiOS, `kernel/arch/dreamcast/sound/snd_iface.c`](https://github.com/KallistiOS/KallistiOS/blob/9926b70aeafc8398675caef98813f10d15d8a329/kernel/arch/dreamcast/sound/snd_iface.c),
  commit `9926b70a`, observed).
  So at least homebrew built on KallistiOS supplies the ARM7's program from the SH-4,
  and the AICA joins the uploaded-program class (inference);
  no source read says what retail games do. [dreamcast.wiki](https://dreamcast.wiki/Hardware_overview) has no "AICA"
  page (its API reports the page missing), and [Comstedt's site](http://mc.pp.se/dc/) has none either.

#### PSP and Vita

- Games reach Vita audio through system libraries
  ([Vita Development Wiki, "SceAudio"](https://wiki.henkaku.xyz/vita/SceAudio),
  ["SceNgs"](https://wiki.henkaku.xyz/vita/SceNgs)), and PSP audio through `sceAudio` and the Media Engine's libraries
  ([PPSSPP, "The PSP Media Engine and its implementation"](https://www.ppsspp.org/docs/development/ppsspp-internals/media-engine)),
  which a high-level emulator reimplements (inference).

### Timing, synchronisation, and input

#### Processors in parallel

- Interrupt controllers route sources to two processors:
  the Wii's is "capable of routing up to 32 interrupt sources to either the Starlet, the PowerPC, or both"
  ([WiiBrew, "Hollywood/IRQs"](https://wiibrew.org/w/index.php?oldid=123514)).
- Clock ratios change with the mode: in GameCube mode on the Wii "Hollywood is now at 162 MHz,
  and Broadway is now at 486 MHz"
  ([WiiBrew, "Broadway/Clock Speed Control"](https://wiibrew.org/w/index.php?oldid=121261), a stub on a homebrew
  procedure), and the New 3DS uses its higher clock while the HOME Menu runs and otherwise only for software that asks
  in its header ([3dbrew, "Hardware"](https://www.3dbrew.org/w/index.php?oldid=23948)).
  The 3DS's clocks are exact ratios, the ARM11 at "exactly twice the clock rate of the ARM9" (3dbrew, "Hardware").
  Components therefore need a shared time base (inference).
- The PS2 core's two interrupt inputs come from the interrupt controller and the DMA controller
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), EE interrupts),
  and in PS1 mode "the IOP is underclocked to 33.8688 MHz" (ps2tek, "BIOS PlayStation Compatibility").

#### Frame timing

- ps2tek gives the PS2's raster as 262 lines per frame for NTSC and 312 for PAL,
  with a fixed count of bus cycles per line, the bus at half the core's clock
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "EE Timers", "DMA Controller (DMAC)");
  from those figures the NTSC rate is about 60.07 Hz with 262 lines, or 59.95 Hz for an interlaced field of 262.5 lines,
  which ps2tek does not state (calculated from the figures).
- The GameCube's video interface uses a 27 MHz video clock, or 54 MHz for progressive output
  ([YAGCD, 5.3](https://hitmen.c02.at/files/yagcd/yagcd/chap5.html));
  the 3DS's display timing is a divider of the GPU's 268 MHz clock
  ([3dbrew, "GPU/External Registers"](https://www.3dbrew.org/w/index.php?oldid=23708)).
- The GameCube's video interface has four display-interrupt registers that fire at programmed positions
  (YAGCD, 5.3), so games can time work against the beam even on this era's hardware (inference).
- The PS2 figures give rates that are not exactly 60 Hz or 50 Hz
  (PAL about 50.09 Hz; calculated as above),
  while YAGCD names the GameCube's modes as 60 Hz
  and 50 Hz (5.3.1); this bears on frame pacing on host displays
  ([`R2-07`](../../roadmap/research.md#phase-2-cross-cutting-engineering)).

#### Input

- On the 3DS a system module writes buttons, Circle Pad, touch, and motion into shared-memory ring buffers
  ([3dbrew, "HID Shared Memory"](https://www.3dbrew.org/w/index.php?oldid=22352)),
  so high-level emulation of input there means writing those buffers (inference).
- The GameCube polls its controller ports in hardware at a line interval tied to video,
  of which "7 is the minimum setting"
  ([YAGCD, 5.8](https://hitmen.c02.at/files/yagcd/yagcd/chap5.html);
  Nintendo's [US 6,609,977](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6609977) describes the same
  interface).
- The Wii Remote is a Bluetooth HID device with buttons, an accelerometer,
  an infrared camera that tracks up to four points, and extensions
  ([WiiBrew, "Wiimote"](https://wiibrew.org/w/index.php?oldid=123599)).
  The Wii U GamePad streams H.264 video and PCM audio over a custom 5 GHz link and runs its own firmware
  (WiiUBrew, ["GamePad"](https://wiiubrew.org/w/index.php?oldid=4886),
  ["GamePad/LVC"](https://wiiubrew.org/w/index.php?oldid=4069)).
  Neither has a host equivalent, so an emulator passes a real device through or synthesises reports (inference).
- Of SIO2, the PS2's controller port interface, ps2tek writes "A good portion of SIO2 is a mystery"
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "SIO2 Registers").
  Xbox controllers are USB: "XIDs are USB devices."
  ([XboxDevWiki, "Xbox Input Devices"](https://xboxdevwiki.net/index.php?oldid=7426)).
  Dreamcast peripherals sit on four Maple buses,
  where a port that does not answer before a timeout yields a result with all bits set
  ([Comstedt, "Maple bus"](http://mc.pp.se/dc/maplebus.html), a lead).

#### Networking

- Network hardware is built in on the Dreamcast, Xbox 360, 3DS, and PSP models other than the E1000,
  and an add-on on the GameCube and on PS2 models before the slim one
  ([dreamcast.wiki, "Hardware overview"](https://dreamcast.wiki/Hardware_overview);
  [Hot Chips 17 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf);
  Wikipedia, [PlayStation Portable](https://en.wikipedia.org/w/index.php?oldid=1386784394),
  [Nintendo 3DS](https://en.wikipedia.org/w/index.php?oldid=1386371150),
  [GameCube](https://en.wikipedia.org/w/index.php?oldid=1386636021),
  [PlayStation 2 technical specifications](https://en.wikipedia.org/w/index.php?oldid=1355643867), secondary);
  their online services have ended or changed, so networking is left out or reconnected to replacements
  (inference; [`R2-09`](../../roadmap/research.md#phase-2-cross-cutting-engineering)).

### Media, security, and system software

The law is in [R0-02](R0-02-legal-baseline.md)
(["Anti-circumvention law in the United States"](R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states),
["Firmware, keys, and game copies"](R0-02-legal-baseline.md#firmware-keys-and-game-copies)); this note records no key,
key layout, or secret value.

#### Discs and what arrives as a plain image

- The GameCube's disc content is XORed with a constant and decrypted transparently by the drive's controller
  ([YAGCD, 2.7.3](https://hitmen.c02.at/files/yagcd/yagcd/chap2.html)),
  and "Dolphin does not include the GameCube Main Menu by default, and it doesn't need it"
  ([Dolphin wiki, "GameCube Main Menu"](https://wiki.dolphin-emu.org/index.php?title=GameCube_Main_Menu)).
- The Dreamcast's GD-ROM has standard and high-density regions
  ([Comstedt, "GD-ROM"](http://mc.pp.se/dc/gdrom.html), a lead);
  at boot its ROM checks part of the disc's bootstrap byte by byte against a copy of its own
  ([Comstedt, "IP.BIN and 1ST_READ.BIN"](http://mc.pp.se/dc/ip.bin.html), a lead).
- The PS2's BIOS sets up the hardware and copies the EE kernel into RAM, and "Unlike the EE,
  the IOP does not have a monolithic kernel"
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "BIOS", "BIOS Boot Process").
- The PSP's UMD standard leaves the format of each data frame's copyright management bytes to agreement between the
  parties ([Ecma-365](https://ecma-international.org/wp-content/uploads/ECMA-365_1st_edition_june_2005.pdf), 1st
  edition, 18.3), and lets the control data carry copyright information or none (26.2.4.3).
- By the pages read, GameCube, Dreamcast, and PS2 games reach an emulator as plain images,
  and no page read says Xbox game executables are encrypted (inference, partly from silence).
- Wii, 3DS, PSP, Vita, and Xbox 360 retail content is encrypted:
  [WiiBrew, "Ticket"](https://wiibrew.org/w/index.php?oldid=121442); 3dbrew says an NCCH's extended header, ExeFS,
  and RomFS "are encrypted using 128-bit AES CTR unless the NoCrypto flag is set in ncchflag[7]"
  ([3dbrew, "NCCH"](https://www.3dbrew.org/w/index.php?oldid=23516));
  [YAPSPD, 23.1.1.1](https://hitmen.c02.at/files/yapspd/psp_doc/chap23.html) marks a UMD's `EBOOT.BIN` encrypted
  but not its `BOOT.BIN`; [Vita Development Wiki, "Security"](https://wiki.henkaku.xyz/vita/Security);
  and Free60 says "Section contents are encrypted",
  under "Program / Section content" on the page titled "File Format Speculation",
  which adds that debug XEX files can be unencrypted
  ([Free60, "XEX"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/System-Software/Formats/XEX.md)).
  The XEX page also holds a C listing under "Cryptography", which was neither read nor used.
- The Wii U encrypts its retail content too:
  Cemu's file-system layer decrypts Wii U disc images partition by partition with AES-128-CBC,
  using keys it looks up in a key cache the user supplies, and rejects an image when decryption fails
  ([Cemu, `src/Cafe/Filesystem/FST/FST.cpp`](https://github.com/cemu-project/Cemu/blob/2f49c079da1d50b85cea0ed99aedda58846b3523/src/Cafe/Filesystem/FST/FST.cpp),
  commit `2f49c079`, observed; an implementation's account).
  The file holds no key value; it was screened for 32-character hexadecimal strings before it was read.
- Citra's FAQ also says it runs encrypted 3DS games only with keys the user dumps
  ([Citra site archive, FAQ](https://citra.azahar-emu.org/wiki/faq/)).
  This sorts the systems by [R0-02](R0-02-legal-baseline.md)'s options 1 to 3 (inference);
  [option 11](#11-plain-images-only-or-content-that-the-user-decrypts) recommends one, and the choice is the owner's.

#### Boot chains and security processors

- Several systems boot through a chain of verified loaders that starts in ROM:
  the Wii and Wii U on their ARM processors, the Wii's first stage also decrypting the next
  ([WiiBrew, "Boot0"](https://wiibrew.org/w/index.php?oldid=117622) introduction;
  [WiiUBrew, "Boot process"](https://wiiubrew.org/w/index.php?oldid=3135)),
  and the 3DS from a boot ROM that checks a signed firmware image:
  the page says the header's RSA-2048 signature is checked when the boot ROM or Process9 launches a FIRM image
  ([3dbrew, "FIRM"](https://www.3dbrew.org/w/index.php?oldid=22193)).
- The Xbox boots from bootstrap code in its I/O chip, which a Microsoft patent describes
  ([US 6,907,522](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6907522), Microsoft,
  patent office copy), and the Xbox 360 from a loader inside the CPU
  ([Free60, "Boot_Process"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/System-Software/Boot_Process.md)).
  The Vita's root of trust is a separate security processor
  ([Vita Development Wiki, "Security"](https://wiki.henkaku.xyz/vita/Security)).
- Free60 writes: "In case of the Xbox 360, the hypervisor is responsible for encryption,
  decryption and the enforcement of access restrictions on memory."
  ([Free60, "Hypervisor"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hypervisor.md)).
- The open-tier emulators read boot games without the maker's boot firmware, except PCSX2, which requires a BIOS dump
  ([PCSX2, README](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/README.md)).
  The walled-tier xemu runs the Xbox's chain from a boot ROM image and a debug or modified flash image,
  as it cannot boot games with an unmodified retail one,
  plus a disk image it also offers pre-built without copyrighted content
  ([xemu, "Required Files"](https://xemu.app/docs/required-files/)).
  Citra recommends maker system files for accuracy ([Citra site archive, FAQ](https://citra.azahar-emu.org/wiki/faq/)).

#### System software that games call

- Where system software lives decides what high-level emulation replaces (inference from the sources here).
  The GameCube game carries its own operating system, which YAGCD implies
  ([YAGCD, 4](https://hitmen.c02.at/files/yagcd/yagcd/chap4.html))
  and WiiUBrew states for the Wii ([WiiUBrew, "Cafe OS"](https://wiiubrew.org/w/index.php?oldid=4900)).
  The Wii serves games from IOS, which "is not a 'hypervisor', as it runs on a dedicated, separate CPU."
  ([WiiBrew, "IOS"](https://wiibrew.org/w/index.php?oldid=123340)).
  The Wii U runs Cafe OS on the CPU and IOSU on the ARM
  (WiiUBrew, "Cafe OS", ["Boot process"](https://wiiubrew.org/w/index.php?oldid=3135)).
- The PS2 has a kernel in RAM and loadable I/O modules
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "BIOS Boot Process", "BIOS").
  The PSP imports functions from named libraries by hashed identifier
  ([YAPSPD, 26.2.2.6 and 26.2.2.10](https://hitmen.c02.at/files/yapspd/psp_doc/chap26.html)),
  3DS titles request services by name
  ([3dbrew, "Services"](https://www.3dbrew.org/w/index.php?oldid=23934)),
  and the Vita's user libraries export functions by identifier
  ([Vita Development Wiki, "SceGxm"](https://wiki.henkaku.xyz/vita/SceGxm), observed).
  The Xbox runs a kernel closely related to Windows NT's and the Xbox 360 a hypervisor and kernel
  ([XboxDevWiki, "Kernel"](https://xboxdevwiki.net/index.php?oldid=6596); Free60,
  ["Hypervisor"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hypervisor.md),
  ["Kernel"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/System-Software/Kernel.md)).
- Dynamically linked interfaces (PSP, Vita, Wii U, 3DS, Xbox 360) suit high-level emulation.
  The GameCube, Wii, and Xbox link their libraries into each game, which pushes it down to recognising library code,
  though the Xbox kernel's exports and the Wii's IOS requests are clean boundaries (inference).
- The emulators read say which they do: "No BIOS file required to play, PPSSPP is an 'HLE' emulator."
  ([PPSSPP, README](https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md)); "Play!
  uses a built-in high-level emulation BIOS."
  ([Play!, README](https://github.com/jpd002/Play-/blob/1f27232772e484bfb79364b751b84f41f4c87481/README.md));
  "Xenia implements all kernel APIs as native functions under the host."
  ([Xenia, `docs/kernel.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md)).
  Xenia's contributing guide bans Microsoft's development kits as a source
  ([Xenia, `.github/CONTRIBUTING.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/.github/CONTRIBUTING.md)).

#### Pages next to restricted material

- Open wikis here sit near maker manuals, key pages, and firmware
  ([R0-05](R0-05-source-map.md#patterns-across-the-hubs), "Patterns across the hubs").
  A research session displayed one Free60 page that lists a console's fuse values; nothing from it was used
  (research log), and the [register](../../../.claude/hooks/source-register.txt) closes it.
- The register now also closes these pages, which the research evidence names, so that the guard blocks them:
  WiiUBrew "Cafe OS/Kernel" (firmware-internal addresses); WiiBrew "Signing bug"
  (pseudo-code, citing a decompilation)
  and "Wii disc" (an unsourced decryption recipe in pseudo-code); 3dbrew "Bootloader"
  (where the boot ROM keeps its key data);
  and XboxDevWiki "Boot Process" and "MCPX ROM" (boot ROM pseudo-code and assembly) and "Xbox Game Disc"
  (drive firmwares listed for dumping).
  They are named without links because they are closed.
- These pages are not to be opened either, but the guard cannot match them, so they are named here instead,
  without links:
  - WiiUBrew "Boot0" and "Boot1": step-by-step pseudo-code of the boot ROM and loader, written from a dump;
    a pattern short enough to block them would also block the cited "Boot process".
  - The raw `index.php?title=` forms of every page above, since a register pattern cannot hold "?".
  - ps2tek's "BIOS File Structure" section, which sits on the single page with the sections cited here.
  - Free60's 1BL and CB pseudo-code pages, linked from the cited "Boot_Process" (not opened, names not recorded).
  - The Citra FAQ's guide to dumping AES keys, and Cemu's wiki page on keys (not opened).
- WiiBrew "Boot0" stays open and cited; only its link to a dump is a hazard,
  and it is not to be followed. xemu's "Required Files" stays open: its MD5 values are hashes, not keys,
  and this note records none of them.

## Options and trade-offs

The options answer separate questions and can be combined, and the answer can differ by system.
Costs and gains are the note's reasoning from the findings (inference) unless a source is named.

### 1. High-level emulation of system software

- **What:** implement the services games call (kernel functions, libraries, modules, IOS requests) as host code.
- **Costs:** each interface must be reimplemented and kept compatible with what games expect;
  libraries linked into games (GameCube, Wii, Xbox) offer no clean boundary.
- **Gains:** no boot firmware, though some features need the user's system files
  ([Citra site archive, FAQ](https://citra.azahar-emu.org/wiki/faq/)); fast.
- **Used by:** PPSSPP, Play!, Xenia, and Azahar, by their READMEs
  ([PPSSPP](https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md),
  [Play!](https://github.com/jpd002/Play-/blob/1f27232772e484bfb79364b751b84f41f4c87481/README.md),
  [Azahar](https://github.com/azahar-emu/azahar/blob/cf42aef23778d7e8bea6a468e12f53943dd87cd0/README.md)) and
  [Xenia's `docs/kernel.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md).

### 2. Low-level emulation of system software

- **What:** emulate the hardware fully and run the console's own boot code and system software, supplied by the user.
- **Costs:** needs firmware the project never holds,
  which [R0-02](R0-02-legal-baseline.md#firmware-keys-and-game-copies) records as unsettled law;
  boot chains include security processors and encryption; slower.
- **Gains:** behaviour matches the console wherever the hardware model is right.
- **Used by:** PCSX2, which requires a BIOS
  ([PCSX2, README](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/README.md));
  xemu, which requires a boot ROM image, a debug or modified flash image, and a disk image
  ([xemu, "Required Files"](https://xemu.app/docs/required-files/)).

### 3. High-level emulation of audio DSP programs

- **What:** recognise the program a game uploads to its audio DSP and reimplement its effect on the host.
- **Costs:** every program family must be identified; games with an unusual program break
  ([Citra site archive, "HLE Audio Comes to Citra"](https://citra.azahar-emu.org/entry/hle-audio-comes-to-citra/)).
- **Gains:** no DSP ROM needed; fast.
- **Used by:** Citra by default in 2018
  ([Citra site archive, "Accurate Audio Emulation Has Arrived"](https://citra.azahar-emu.org/entry/accurate-audio-emulation/));
  Dolphin by default, whose `MAIN_DSP_HLE` setting defaults to true
  ([Dolphin, `Source/Core/Core/Config/MainSettings.cpp`](https://github.com/dolphin-emu/dolphin/blob/32a2b828e20612807531592002da4e7296fd2207/Source/Core/Core/Config/MainSettings.cpp),
  commit `32a2b828`, observed).

### 4. Low-level emulation of audio DSPs

- **What:** emulate the DSP's instruction set, memory, and peripherals, and run the uploaded program.
- **Costs:** "all or nothing" by Citra's account
  ([Citra site archive, "Accurate Audio Emulation Has Arrived"](https://citra.azahar-emu.org/entry/accurate-audio-emulation/));
  on the GameCube and Wii, needs the DSP's ROMs or a replacement, which the
  [register](../../../.claude/hooks/source-register.txt) closes, and on the 3DS the program the title supplies; slow at
  first release, by Citra's account.
- **Gains:** runs any program; serves as the reference for checking high-level emulation.
- **Used by:** Dolphin; Citra, Azahar's predecessor, from 2018
  ([Dolphin wiki, "Audio Emulation"](https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation);
  [Citra site archive, "Accurate Audio Emulation Has Arrived"](https://citra.azahar-emu.org/entry/accurate-audio-emulation/)).

### 5. A specialised host shader for each guest configuration

- **What:** generate and compile a host shader for each combiner, blend, and vertex configuration a game sets.
- **Costs:** compilation stalls when a new configuration appears; a cache must be kept per game, per driver,
  and per emulator version
  ([Dolphin blog, "Ubershaders"](https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/)).
- **Gains:** fast once compiled.
- **Used by:** Dolphin (Dolphin blog, "Ubershaders"); Citra translates the guest's shader programs into host shaders
  ([Citra site archive, "Hardware Renderer Updates"](https://citra.azahar-emu.org/entry/improvements-to-hardware-renderer/)).

### 6. A general shader that interprets the configuration

- **What:** one large host shader that reads the guest's configuration as data,
  used alone or while specialised shaders compile.
- **Costs:** slower per pixel; heavy on host GPUs.
- **Gains:** no compilation stall for new configurations.
- **Used by:** Dolphin's "ubershaders", alone or in hybrid mode
  ([Dolphin blog, "Ubershaders"](https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/)).

### 7. Precision and blending: host fixed function or shader emulation

- **What:** use host blending and floating point where they agree with the guest, or emulate the guest's integer,
  wrap-around, 9-bit, and 24-bit arithmetic in shaders, including blending in the fragment shader.
- **Costs:** shader emulation is slower,
  and blending in the shader can need optional host features such as fragment-shader interlock.
- **Gains:** fixes effects that depend on the guest's arithmetic.
- **Used by:** per-game blending options in PCSX2
  ([`bin/docs/GameIndex.pdf`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/docs/GameIndex.pdf));
  Xenia's work on depth formats
  ([Xenia, "Leaving No Pixel Behind"](https://xenia.jp/updates/2021/04/27/leaving-no-pixel-behind-new-render-target-cache-3x3-resolution-scaling.html)).

### 8. Floating point: host defaults, per-game settings, or bit-exact software

- **What:** run guest arithmetic on the host FPU, adjust it by per-game rounding and clamping,
  or emulate the guest's rules exactly in software.
- **Costs:** host defaults break games; per-game settings need a database; bit-exact emulation is slow.
- **Gains:** in that order, speed, listed titles working, and correctness everywhere.
- **Used by:** PCSX2 and Dolphin use per-game settings
  ([PCSX2, `GameIndex.yaml`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/resources/GameIndex.yaml);
  [Dolphin, `GameSettings`](https://github.com/dolphin-emu/dolphin/tree/32a2b828e20612807531592002da4e7296fd2207/Data/Sys/GameSettings));
  an open PCSX2 pull request moves the PS2's arithmetic into software
  ([PCSX2 pull request #12001](https://github.com/PCSX2/pcsx2/pull/12001)).

### 9. Interpreter, block recompiler, or recompiler through an intermediate form

- **What:** interpret guest instructions; translate blocks directly to host code;
  or translate through an intermediate form with optimisation passes.
- **Costs:** an interpreter cannot keep up with the faster guests of the era;
  recompilers need invalidation for code that changes, and a back end per host architecture.
- **Gains:** in that order, simplicity, speed, and portability of optimisation.
- **Used by:** Xenia describes an intermediate form
  ([Xenia, `docs/cpu.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/cpu.md)).

### 10. Host threads for guest processors

- **What:** run each guest processor (or core, or hardware thread) on its own host thread, or interleave them on one.
- **Costs:** threads need the guest's memory ordering and atomic operations and careful synchronisation;
  interleaving is slower for symmetric multi-core guests.
- **Gains:** threads use host cores; interleaving is deterministic.
- **Used by:** Dolphin names CPU, GPU, and DSP as tasks that run well on separate threads
  ([Dolphin, FAQ](https://dolphin-emu.org/docs/faq/)).

### 11. Plain images only, or content that the user decrypts

- **What:** support only systems whose games arrive as plain images,
  or accept content the user has decrypted with their own tools.
- **Costs:** the first leaves out the Wii, Wii U, 3DS, PSP, Vita, and Xbox 360; the second is the first variant of
  [R0-02's option 3](R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key), with its risks.
- **Gains:** the first keeps the project away from decryption; the second covers the era.
- **Used by:** [R0-02](R0-02-legal-baseline.md) found no project that states it accepts only user-decrypted input,
  and records Dolphin as embedding a published key instead.

### Recommendation

These are recommendations for the owner, who decides; the pull request lists them.

- **System software (options 1 and 2):** high-level emulation as the default for every system of the era,
  at the cleanest boundary each offers: library and kernel exports on the PSP, Vita, Wii U, 3DS, and Xbox 360;
  kernel exports on the Xbox and IOS requests on the Wii; and nothing on the GameCube,
  whose games carry their own operating system.

  It needs no firmware, which the project never holds and whose law [R0-02](R0-02-legal-baseline.md) records
  as unsettled, and every open-tier emulator read takes this route except
  [PCSX2](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/README.md).

  Low-level emulation of maker firmware is not built.
  If it is ever needed, it waits for the firmware ADR named under [Implications](#implications-for-rustalgia),
  because it needs a BIOS, boot ROM, flash, or OTP image from a console,
  and the boot chains include security processors and per-console secrets.
- **Audio DSPs (options 3 and 4):** high-level emulation of DSP programs as the default on the GameCube, Wii, Wii U,
  and 3DS, as
  [Dolphin](https://github.com/dolphin-emu/dolphin/blob/32a2b828e20612807531592002da4e7296fd2207/Source/Core/Core/Config/MainSettings.cpp)
  does by default and [Citra](https://citra.azahar-emu.org/entry/accurate-audio-emulation/) did in 2018; it needs no DSP
  ROM, and the register closes the replacement ROM.
  The Xbox's two DSPs and the Dreamcast's ARM7 also run uploaded programs,
  but no source read shows high-level emulation of either working,
  so for them the choice waits for [`R1-23`](../../roadmap/research.md#system-family-surveys)
  and [`R1-22`](../../roadmap/research.md#system-family-surveys).
  A low-level DSP core comes later, as a test reference only, run where the program is legally to hand,
  since [Dolphin's wiki](https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation) says sound issues need confirming
  with low-level emulation and Citra calls it all or nothing.
- **Shaders (options 5 and 6):** specialised shaders, cached per game, driver, and emulator version,
  with a general shader standing in while they compile, as Dolphin's hybrid mode does
  ([Dolphin blog, "Ubershaders"](https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/));
  Vulkan pipeline caches and the graphics pipeline library shorten compiles.
  Specialised shaders are fastest once compiled,
  and the general shader removes compile stutter at a per-pixel cost that is acceptable only for the frames it covers.
- **Precision and blending (option 7):** host fixed function where its results match the guest's,
  and shader emulation where they differ
  (the PS2's 9-bit wrapping blends, the GameCube's integer texture environment, the NV2A's fixed-point combiners,
  24-bit depth), with fragment-shader interlock, dual-source blending,
  and logic operations detected at start-up and an exact slower path where they are missing.
  Host blend units saturate, and 32-bit floats cannot hold the 24-bit integer arithmetic
  ([Dolphin blog, "Pixel Processing Problems"](https://web.archive.org/web/20260701132119/https://dolphin-emu.org/blog/2014/03/15/pixel-processing-problems/)).
- **Floating point (option 8):** a software model of each guest's arithmetic in the interpreter,
  as exact as the published and tested behaviour allows, as the reference;
  the recompiler uses the host FPU with the guest's mode corrections
  (flush-to-zero, rounding, clamping),
  is tested against that model, and keeps per-game settings only where a measured mismatch remains.
  The exact bits are not yet known everywhere: the PS2's last bit, its division, Gekko's estimates,
  and the SH-4's approximate instructions (findings above).
  Both
  [PCSX2](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/resources/GameIndex.yaml) and
  [Dolphin](https://github.com/dolphin-emu/dolphin/tree/32a2b828e20612807531592002da4e7296fd2207/Data/Sys/GameSettings)
  carry per-game databases, with hundreds of rounding overrides in PCSX2's, and
  [PCSX2's software-arithmetic work](https://github.com/PCSX2/pcsx2/pull/12001) reports games fixed that per-game
  settings had patched (a lead).
- **Execution (option 9):** an interpreter first, as the reference,
  then a recompiler through an intermediate form for the fast guests.
  An interpreter cannot keep up with the era's faster guests,
  one intermediate form can serve the Xbox 360's and the PS3's PowerPC cores (inference from
  [Xenia, `docs/cpu.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/cpu.md)),
  and it gives one optimiser for several host back ends.
- **Threads (option 10):** deterministic interleaving on one host thread as the default for asymmetric guests
  (PS2, Wii, PSP),
  and host threads for the cores of symmetric multi-core guests
  (Xbox 360, Wii U, 3DS, Vita)
  with the guest's memory ordering, plus the GPU and DSP on their own threads
  where [Dolphin's FAQ](https://dolphin-emu.org/docs/faq/) shows that works.
  Interleaving is deterministic, which testing needs, but it is slower for symmetric guests.
- **Content (option 11):** accept content the user has decrypted with their own tools, never embed or derive keys,
  and leave decryption out of the emulator: the first variant of
  [R0-02's option 3](R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key), with its risks
  recorded there.
  Plain images alone leave out six of the ten systems
  (Wii, Wii U, 3DS, PSP, Vita, Xbox 360); the owner decides among R0-02's options.
- **AMD's R600 and R700 register guides:** this note treats the copies outside AMD's portal as closed,
  because they are maker documents on third-party hosts and the maker's release of them was not shown;
  the pull request lists this as a process call.
  AMD may have released them through X.Org (from memory); that release, if shown, would reopen them.
  Until then the Wii U GPU's register layout is learned from the open-tier Cemu and decaf-emu.

## Implications for Rustalgia

These follow from the findings (inference).

- System software is the deciding question for most of this era.
  Options 1 and 2 feed [`R2-12`](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  (firmware and system software) and an ADR on firmware; each family survey records where its system's software lives.
- Options 5 to 7 feed [`R2-05`](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  (3D hardware and shader compilation)
  and [`R4-05`](../../roadmap/research.md#phase-4-technology-stack)
  (graphics libraries);
  the optional Vulkan features they need bear on which hosts can run an accurate renderer
  ([`R3-05`, `R3-12`](../../roadmap/research.md#phase-3-host-platforms)).
- Options 8 to 10 feed [`R2-01`](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  (CPU execution)
  and [`R4-08`](../../roadmap/research.md#phase-4-technology-stack)
  (recompilation in Rust);
  the iOS limit on dynamic recompilation, [`R3-01`](../../roadmap/research.md#phase-3-host-platforms)'s subject,
  weighs hardest on this era and the next.
- Encrypted content splits the era's systems in two,
  which feeds the owner's choice among [R0-02](R0-02-legal-baseline.md)'s options 1 to 3, system by system,
  and [`R6-01`](../../roadmap/research.md#phase-6-synthesis).
- Audio DSPs that run uploaded programs feed [`R2-06`](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  (audio), with options 3 and 4; input that passes through system software, and controllers with no host equivalent,
  feed [`R2-13`](../../roadmap/research.md#phase-2-cross-cutting-engineering).

## Open questions

- Does VU1 round as VU0 does, and what rule sets the last bit after a round towards zero?
  The console results in
  [ps2autotests, `tests/vu`](https://github.com/unknownbrackets/ps2autotests/tree/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu)
  cover VU0's multiply and add only; tests run on a PS2, which the project does not own, would answer it
  ([`R1-19`](../../roadmap/research.md#system-family-surveys)).
- Do the Xbox 360's NJ default and its per-instruction flushing match Xenia Canary's model?
  Tests on an Xbox 360, which the project does not own, would answer it
  ([`R1-23`](../../roadmap/research.md#system-family-surveys)).
- Do Dreamcast games depend on the SH-4's approximate inner-product and matrix results?
  The only SH-4 test vectors found were generated by another emulator
  ([SingleStepTests sh4 README](https://github.com/SingleStepTests/sh4/blob/48975cb1a9569abb5a0cba587013ea54edf79100/README.md)),
  and the issue trackers of walled-tier Dreamcast emulators were not searched, because the guard blocks them.
  Running games against an exact model
  and comparing them with a Dreamcast would answer it ([`R1-22`](../../roadmap/research.md#system-family-surveys)).

## Sources

Every source below was read on 2026-11-20.
MediaWiki pages were read as raw wikitext unless an entry says otherwise; "rev" is the revision,
and each link goes to that revision where the wiki serves one.

This repository's documents:

- [ADR 0001, "Restrict what may be read by licence tier"](../../adr/0001-restrict-reading-by-licence-tier.md).
- [Research conventions](../README.md), [research roadmap](../../roadmap/research.md),
  and [source register](../../../.claude/hooks/source-register.txt).
- [R0-02](R0-02-legal-baseline.md), [R0-05](R0-05-source-map.md), [R1-02](R1-02-primer-32-and-64-bit.md),
  [R1-04](R1-04-primer-modern.md), and [R1-07](R1-07-catalogue-sixth-generation.md).

Maker material: conference talks, manuals, standards, and patents:

- K. Kutaragi (Sony Computer Entertainment),
  ["New Millennium for Computer Entertainment"](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf),
  keynote, Hot Chips 11 (1999).
- A. Kunimatsu and others (Toshiba, Sony),
  ["5.5 GFLOPS Vector Units for Emotion Synthesis"](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.s3.1.Kunimatsu.pdf),
  Hot Chips 11 (1999).
- P. Sandon (IBM),
  ["A PowerPC compatible processor supporting high-performance 3-D graphics"](https://old.hotchips.org/wp-content/uploads/hc_archives/hc13/2_Mon/06ibm-gekko.pdf)
  (Gekko), Hot Chips 13 (2001).
- Y. Kurose and others (Sony),
  ["A 90nm embedded DRAM single chip LSI with a 3D graphics, H.264 codec engine, and a reconfigurable processor"](https://old.hotchips.org/wp-content/uploads/hc_archives/hc16/3_Tue/8_HC16_Sess8_Pres1_bw.pdf),
  Hot Chips 16 (2004).
- Andrews and Baker (Microsoft),
  ["Xbox 360 System Architecture"](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf),
  Hot Chips 17 (2005).
- Microsoft Xbox team,
  ["On Backwards Compatibility"](https://learn.microsoft.com/en-us/archive/blogs/xboxteam/on-backwards-compatibility-2)
  (2006-03-20), archived on Microsoft Learn.
- Microsoft Learn,
  ["XAudio2 Introduction"](https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-introduction) and
  ["XAudio2 Versions"](https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-versions) (both dated
  2018-05-31).
- Freescale,
  [AltiVec Technology Programming Environments Manual](https://www.nxp.com/docs/en/reference-manual/ALTIVECPEM.pdf),
  Rev. 3 (2006), served by NXP; NXP's site answers automated requests with "not found", so the link is checked by hand.
- Renesas, [SH-4 Software Manual](https://www.renesas.com/en/document/mas/sh-4-software-manual), Rev. 6.00 (2006-09-13).
- Renesas,
  [SH7750 Group User's Manual: Hardware](https://www.renesas.com/en/document/mah/sh7750-sh7750s-sh7750r-group-users-manual-hardware),
  Rev. 7.02 (2013-09-24).
- NVIDIA,
  [`NV_register_combiners` extension specification](https://registry.khronos.org/OpenGL/extensions/NV/NV_register_combiners.txt),
  version 1.7 (2007-02-01), Khronos registry.
- Khronos, Vulkan reference pages
  [`VkPipelineCache`](https://registry.khronos.org/vulkan/specs/latest/man/html/VkPipelineCache.html),
  [`VK_EXT_fragment_shader_interlock`](https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_fragment_shader_interlock.html),
  [`VK_EXT_graphics_pipeline_library`](https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_graphics_pipeline_library.html),
  and
  [`VkPhysicalDeviceFeatures`](https://registry.khronos.org/vulkan/specs/latest/man/html/VkPhysicalDeviceFeatures.html),
  latest version on the date read.
- AMD,
  [GPUOpen architecture programming documentation](https://gpuopen.com/amd-gpu-architecture-programming-documentation/),
  for its list of documents only.
- Ecma International,
  [ECMA-365, "Data Interchange on 60 mm Read-Only ODC - Capacity: 1,8 Gbytes (UMD)"](https://ecma-international.org/wp-content/uploads/ECMA-365_1st_edition_june_2005.pdf),
  1st edition (June 2005).
- United States patents, patent office copies:
  [5,729,672](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5729672) (VideoLogic),
  [6,606,689](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6606689) (Nintendo),
  [6,609,977](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6609977) (Nintendo),
  [6,907,522](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6907522) (Microsoft),
  and [7,034,828](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7034828) (Nintendo).

Community references:

- [ps2tek](https://psi-rockin.github.io/ps2tek/), single page, commit `1c916606` (2022-01-27), also read as
  [raw HTML](https://raw.githubusercontent.com/psi-rockin/ps2tek/1c9166066c3ab9ad089a4d12088acaa9476df4b6/index.html).
- [Yet Another GameCube Documentation](https://hitmen.c02.at/files/yagcd/yagcd/index.html), chapters 1 to 6, 10, and 13
  (last revised 2006).
- [Yet Another PSP Documentation](https://hitmen.c02.at/files/yapspd/psp_doc/chap1.html), chapters 1 to 11, 23, and 26
  (last revised 2006).
- WiiBrew: ["Paired single"](https://wiibrew.org/w/index.php?oldid=120284)
  (rev 120284),
  ["Hardware/Broadway"](https://wiibrew.org/w/index.php?oldid=121256)
  (rev 121256),
  ["Hardware/Starlet"](https://wiibrew.org/w/index.php?oldid=118313)
  (rev 118313),
  ["Memory map"](https://wiibrew.org/w/index.php?oldid=121456)
  (rev 121456),
  ["Hardware/DSP"](https://wiibrew.org/w/index.php?oldid=116811)
  (rev 116811),
  ["Hardware/NAND"](https://wiibrew.org/w/index.php?oldid=121606)
  (rev 121606),
  ["Hollywood/IRQs"](https://wiibrew.org/w/index.php?oldid=123514)
  (rev 123514),
  ["Broadway/Clock Speed Control"](https://wiibrew.org/w/index.php?oldid=121261)
  (rev 121261),
  ["Hardware/GX"](https://wiibrew.org/w/index.php?oldid=110039)
  (rev 110039),
  ["Wiimote"](https://wiibrew.org/w/index.php?oldid=123599)
  (rev 123599),
  ["IOS"](https://wiibrew.org/w/index.php?oldid=123340)
  (rev 123340),
  ["Ticket"](https://wiibrew.org/w/index.php?oldid=121442)
  (rev 121442), and ["Boot0"](https://wiibrew.org/w/index.php?oldid=117622) (rev 117622).
- WiiUBrew: ["Hardware/Starbuck"](https://wiiubrew.org/w/index.php?oldid=4847)
  (rev 4847),
  ["Memory map"](https://wiiubrew.org/w/index.php?oldid=4859)
  (rev 4859),
  ["Hardware"](https://wiiubrew.org/w/index.php?oldid=4831)
  (rev 4831),
  ["Cafe OS"](https://wiiubrew.org/w/index.php?oldid=4900)
  (rev 4900),
  ["Hardware/DSP"](https://wiiubrew.org/w/index.php?oldid=4300)
  (rev 4300),
  ["Hardware/GX2"](https://wiiubrew.org/w/index.php?oldid=3754)
  (rev 3754),
  ["GamePad"](https://wiiubrew.org/w/index.php?oldid=4886)
  (rev 4886),
  ["GamePad/LVC"](https://wiiubrew.org/w/index.php?oldid=4069)
  (rev 4069), and ["Boot process"](https://wiiubrew.org/w/index.php?oldid=3135) (rev 3135).
- 3dbrew, revisions from each page's information view: ["Hardware"](https://www.3dbrew.org/w/index.php?oldid=23948)
  (rev 23948),
  ["Memory layout"](https://www.3dbrew.org/w/index.php?oldid=21472)
  (rev 21472),
  ["NDMA Registers"](https://www.3dbrew.org/w/index.php?oldid=21618)
  (rev 21618),
  ["Corelink DMA Engines"](https://www.3dbrew.org/w/index.php?oldid=21473)
  (rev 21473),
  ["Flash Filesystem"](https://www.3dbrew.org/w/index.php?oldid=23624)
  (rev 23624),
  ["SD Filesystem"](https://www.3dbrew.org/w/index.php?oldid=20468)
  (rev 20468),
  ["GPU/Internal Registers"](https://www.3dbrew.org/w/index.php?oldid=23943)
  (rev 23943),
  ["GPU/Shader Instruction Set"](https://www.3dbrew.org/w/index.php?oldid=22377)
  (rev 22377),
  ["GPU/External Registers"](https://www.3dbrew.org/w/index.php?oldid=23708)
  (rev 23708),
  ["GPU/Fragment Lighting"](https://www.3dbrew.org/w/index.php?oldid=20751)
  (rev 20751),
  ["HID Shared Memory"](https://www.3dbrew.org/w/index.php?oldid=22352)
  (rev 22352),
  ["DSP:LoadComponent"](https://www.3dbrew.org/w/index.php?oldid=15977)
  (rev 15977),
  ["DSP Memory Region"](https://www.3dbrew.org/w/index.php?oldid=22774)
  (rev 22774),
  ["DSP Services"](https://www.3dbrew.org/w/index.php?oldid=17913)
  (rev 17913),
  ["FIRM"](https://www.3dbrew.org/w/index.php?oldid=22193)
  (rev 22193),
  ["NCCH"](https://www.3dbrew.org/w/index.php?oldid=23516)
  (rev 23516), and ["Services"](https://www.3dbrew.org/w/index.php?oldid=23934) (rev 23934).
  "FIRM" and "NCCH" were read again on 2026-11-20 with long hexadecimal runs masked.
- Vita Development Wiki, read as rendered pages, and as raw wikitext where the research's first fetch was refused
  (research log):
  ["Main_Processor"](https://wiki.henkaku.xyz/vita/Main_Processor)
  (rev 21601),
  ["Venezia"](https://wiki.henkaku.xyz/vita/Venezia)
  (rev 20746),
  ["Physical Memory"](https://wiki.henkaku.xyz/vita/Physical_Memory)
  (rev 21616),
  ["GPU"](https://wiki.henkaku.xyz/vita/GPU) (rev 21670), ["SceGxm"](https://wiki.henkaku.xyz/vita/SceGxm)
  (rev 21212),
  ["SceAudio"](https://wiki.henkaku.xyz/vita/SceAudio) (rev 19499), ["SceNgs"](https://wiki.henkaku.xyz/vita/SceNgs)
  (rev 19600), and ["Security"](https://wiki.henkaku.xyz/vita/Security) (rev 20413).
  ["PSP Emulator"](https://web.archive.org/web/20261022170441/https://wiki.henkaku.xyz/vita/PSP_Emulator)
  (oldid 21611),
  capture of 2026-10-22 17:04:41, and
  ["Kermit"](https://web.archive.org/web/20261022163007/https://wiki.henkaku.xyz/vita/Kermit) (oldid 21635), capture of
  2026-10-22 16:30:07, were read from the Wayback Machine because the live page refuses scripts with a bot check.
- psdevwiki PS2, ["IOP/Deckard"](https://web.archive.org/web/20261004011318/https://www.psdevwiki.com/ps2/IOP/Deckard)
  (oldid 5555, last edited 2026-04-27),
  capture of 2026-10-04 01:13:18, read from the Wayback Machine because the live page refuses scripts
  (a challenge page with HTTP 403).
- XboxDevWiki: ["CPU"](https://xboxdevwiki.net/index.php?oldid=7347)
  (rev 7347),
  ["Xbox Hardware Overview"](https://xboxdevwiki.net/index.php?oldid=6007)
  (rev 6007),
  ["Memory"](https://xboxdevwiki.net/index.php?oldid=7416)
  (rev 7416),
  ["Kernel"](https://xboxdevwiki.net/index.php?oldid=6596)
  (rev 6596),
  ["Hard Drive"](https://xboxdevwiki.net/index.php?oldid=7037)
  (rev 7037),
  ["FATX"](https://xboxdevwiki.net/index.php?oldid=7419)
  (rev 7419),
  ["NV2A"](https://xboxdevwiki.net/index.php?oldid=6894)
  (rev 6894),
  ["NV2A/Pixel Combiner"](https://xboxdevwiki.net/index.php?oldid=6853)
  (rev 6853),
  ["NV2A/Vertex Shader"](https://xboxdevwiki.net/index.php?oldid=7422)
  (rev 7422),
  ["APU"](https://xboxdevwiki.net/index.php?oldid=7415)
  (rev 7415), and ["Xbox Input Devices"](https://xboxdevwiki.net/index.php?oldid=7426) (rev 7426).
- Free60 wiki, commit `f3d099ff` (2026-11-08):
  ["Xenos (GPU)"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hardware/Console/Xenos_%28GPU%29.md),
  ["Hypervisor"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hypervisor.md),
  ["NAND"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hardware/Console/NAND/index.md),
  ["HDD"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Hardware/Console/HDD.md),
  ["XEX"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/System-Software/Formats/XEX.md),
  ["Boot_Process"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/System-Software/Boot_Process.md),
  and
  ["Kernel"](https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/System-Software/Kernel.md).
- vfpu-docs, commit `f283bbb8` (2025-05-29):
  [README](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/README.md),
  [`docs/introduction.md`](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/docs/introduction.md),
  and [`docs/bugs.md`](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/docs/bugs.md).
- dreamcast.wiki: ["Memory map"](https://dreamcast.wiki/Memory_map) (rev 1865), ["VRAM"](https://dreamcast.wiki/VRAM)
  (rev 508),
  ["Hardware overview"](https://dreamcast.wiki/Hardware_overview)
  (rev 2944),
  and ["VMU hardware overview"](https://dreamcast.wiki/VMU_hardware_overview)
  (rev 2997); the links go to the current pages.
- M. Comstedt, [Dreamcast Programming](http://mc.pp.se/dc/): [SH-4](http://mc.pp.se/dc/cpu.html),
  [memory map](http://mc.pp.se/dc/memory.html), [PowerVR](http://mc.pp.se/dc/pvr.html),
  [Maple bus](http://mc.pp.se/dc/maplebus.html), [GD-ROM](http://mc.pp.se/dc/gdrom.html),
  and [IP.BIN and 1ST_READ.BIN](http://mc.pp.se/dc/ip.bin.html)
  (the SH-4 and memory pages dated 2000), a personal site and so a lead.
- Sega Retro, ["AICA"](https://segaretro.org/index.php?oldid=1163931) (rev 1163931).

Tests:

- ps2autotests, commit `97469ffb` (2019-11-16):
  [README](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/README.md),
  [`tests/cpu/ee_fpu/arithmetic.expected`](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/cpu/ee_fpu/arithmetic.expected),
  [`tests/vu/games/triace.cpp`](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu/games/triace.cpp)
  and
  [`triace.expected`](https://github.com/unknownbrackets/ps2autotests/blob/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu/games/triace.expected),
  and the
  [`tests/dma`](https://github.com/unknownbrackets/ps2autotests/tree/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/dma)
  and
  [`tests/vu`](https://github.com/unknownbrackets/ps2autotests/tree/97469ffbed8631277b94e28d01dabd702aa97ef3/tests/vu)
  listings.
- [SingleStepTests sh4 README](https://github.com/SingleStepTests/sh4/blob/48975cb1a9569abb5a0cba587013ea54edf79100/README.md),
  commit `48975cb1`.
- [Teakra README](https://github.com/wwylele/teakra/blob/3d697a18df504f4677b65129d9ab14c7c597e3eb/README.md),
  commit `3d697a18` (2025-08-24).

Emulator projects' documentation, data, and code (implementations' accounts):

- PCSX2, commit `84077463` (2026-11-16 in the committer's time):
  [`bin/resources/GameIndex.yaml`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/resources/GameIndex.yaml),
  [`bin/docs/GameIndex.pdf`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/bin/docs/GameIndex.pdf),
  [`README.md`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/README.md),
  [`pcsx2/Pcsx2Config.cpp`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/pcsx2/Pcsx2Config.cpp),
  and
  [`common/FPControl.h`](https://github.com/PCSX2/pcsx2/blob/840774630f7a1a456e50575df62ec0b72cc00a98/common/FPControl.h);
  [pull request #12001](https://github.com/PCSX2/pcsx2/pull/12001), its file list, and its comments, read through
  GitHub's interface for programs.
- Dolphin, commit `32a2b828` (2026-11-19 in the committer's time):
  [`Data/Sys/GameSettings`](https://github.com/dolphin-emu/dolphin/tree/32a2b828e20612807531592002da4e7296fd2207/Data/Sys/GameSettings)
  and
  [`Source/Core/Core/Config/MainSettings.cpp`](https://github.com/dolphin-emu/dolphin/blob/32a2b828e20612807531592002da4e7296fd2207/Source/Core/Core/Config/MainSettings.cpp);
  commit `7dac5ec7`:
  [`Source/Core/Common/FloatUtils.cpp`](https://github.com/dolphin-emu/dolphin/blob/7dac5ec790496bb0b10944bcbf7eade65aad671d/Source/Core/Common/FloatUtils.cpp);
  [pull request #390](https://github.com/dolphin-emu/dolphin/pull/390),
  [pull request #12259](https://github.com/dolphin-emu/dolphin/pull/12259), and
  [commit `59e7c193`](https://github.com/dolphin-emu/dolphin/commit/59e7c1938079503724b68d78e1e5eb552cf056b7), read
  through GitHub's interface for programs.
- Dolphin, [FAQ](https://dolphin-emu.org/docs/faq/); wiki,
  ["Audio Emulation"](https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation)
  (rev 177576)
  and ["GameCube Main Menu"](https://wiki.dolphin-emu.org/index.php?title=GameCube_Main_Menu)
  (rev 200620); the links go to the current pages.
- Dolphin blog, read from captures because the live posts, which still exist, refuse scripts
  (research log):
  ["Pixel Processing Problems: On the Road to Pixel Perfection"](https://web.archive.org/web/20260701132119/https://dolphin-emu.org/blog/2014/03/15/pixel-processing-problems/)
  (2014-03-15), capture of 2026-07-01 13:21:19;
  ["Ubershaders: A Ridiculous Solution to an Impossible Problem"](https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/)
  (2017-07-30), capture of 2026-11-03 20:18:59;
  ["To the Screen with Hybrid XFB"](https://web.archive.org/web/20260524104646/https://dolphin-emu.org/blog/2017/11/19/hybridxfb/)
  (2017-11-19), capture of 2026-05-24 10:46:46.
- Xenia, commit `95a5c3ee` (2026-02-18):
  [`docs/cpu.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/cpu.md),
  [`docs/kernel.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md),
  [`.github/CONTRIBUTING.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/.github/CONTRIBUTING.md),
  [`src/xenia/apu/audio_system.cc`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/apu/audio_system.cc),
  and
  [`src/xenia/cpu/ppc/ppc_emit_altivec.cc`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/cpu/ppc/ppc_emit_altivec.cc);
  ["Leaving No Pixel Behind"](https://xenia.jp/updates/2021/04/27/leaving-no-pixel-behind-new-render-target-cache-3x3-resolution-scaling.html)
  (2021-04-27).
- Xenia Canary, commit `a4ef31cd`:
  [`src/xenia/cpu/thread_state.cc`](https://github.com/xenia-canary/xenia-canary/blob/a4ef31cdf7ceb5a1890daabd34fa281c9cd58693/src/xenia/cpu/thread_state.cc)
  and
  [`src/xenia/cpu/ppc/ppc_emit_altivec.cc`](https://github.com/xenia-canary/xenia-canary/blob/a4ef31cdf7ceb5a1890daabd34fa281c9cd58693/src/xenia/cpu/ppc/ppc_emit_altivec.cc).
- Cemu, commit `2f49c079`:
  [`src/Cafe/OS/libs/snd_core/`](https://github.com/cemu-project/Cemu/tree/2f49c079da1d50b85cea0ed99aedda58846b3523/src/Cafe/OS/libs/snd_core)
  and
  [`src/Cafe/Filesystem/FST/FST.cpp`](https://github.com/cemu-project/Cemu/blob/2f49c079da1d50b85cea0ed99aedda58846b3523/src/Cafe/Filesystem/FST/FST.cpp),
  and the file name
  [`src/Cafe/HW/Latte/ISA/LatteReg.h`](https://github.com/cemu-project/Cemu/blob/2f49c079da1d50b85cea0ed99aedda58846b3523/src/Cafe/HW/Latte/ISA/LatteReg.h)
  from the repository listing.
- decaf-emu, commit `e6c528a2` (2023-11-09): the
  [`src/libgpu/latte/`](https://github.com/decaf-emu/decaf-emu/tree/e6c528a20a41c34e0f9eb91dd3da40f119db2dee/src/libgpu/latte)
  file listing only.
- KallistiOS, commit `9926b70a`:
  [`kernel/arch/dreamcast/sound/snd_iface.c`](https://github.com/KallistiOS/KallistiOS/blob/9926b70aeafc8398675caef98813f10d15d8a329/kernel/arch/dreamcast/sound/snd_iface.c).
- PPSSPP: [README](https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md),
  commit `77106069`;
  ["The PSP Media Engine and its implementation"](https://www.ppsspp.org/docs/development/ppsspp-internals/media-engine).
- Play!, [README](https://github.com/jpd002/Play-/blob/1f27232772e484bfb79364b751b84f41f4c87481/README.md),
  commit `1f272327`.
- Azahar, [README](https://github.com/azahar-emu/azahar/blob/cf42aef23778d7e8bea6a468e12f53943dd87cd0/README.md),
  commit `cf42aef2`.
- Citra site archive (archive of 2024-03-04):
  ["HLE Audio Comes to Citra"](https://citra.azahar-emu.org/entry/hle-audio-comes-to-citra/) (2016-05-20),
  ["Accurate Audio Emulation Has Arrived"](https://citra.azahar-emu.org/entry/accurate-audio-emulation/) (2018-12-07),
  ["Hardware Renderer Updates"](https://citra.azahar-emu.org/entry/improvements-to-hardware-renderer/) (2018-03-10),
  and the [FAQ](https://citra.azahar-emu.org/wiki/faq/).
- xemu, prose of a walled emulator: [home page](https://xemu.app/), [FAQ](https://xemu.app/docs/faq/),
  and ["Required Files"](https://xemu.app/docs/required-files/).

Wikipedia, raw wikitext (tertiary):

- [Emotion Engine](https://en.wikipedia.org/w/index.php?oldid=1375786242)
  (rev 1375786242),
  [PlayStation 2 technical specifications](https://en.wikipedia.org/w/index.php?oldid=1355643867)
  (rev 1355643867),
  [Espresso (processor)](https://en.wikipedia.org/w/index.php?oldid=1362404111)
  (rev 1362404111),
  [AltiVec](https://en.wikipedia.org/w/index.php?oldid=1347443903)
  (rev 1347443903),
  [Dynamic recompilation](https://en.wikipedia.org/w/index.php?oldid=1386329890)
  (rev 1386329890),
  [PlayStation Portable](https://en.wikipedia.org/w/index.php?oldid=1386784394)
  (rev 1386784394),
  [PlayStation Vita](https://en.wikipedia.org/w/index.php?oldid=1386319237)
  (rev 1386319237),
  [Nintendo 3DS](https://en.wikipedia.org/w/index.php?oldid=1386371150)
  (rev 1386371150),
  [GameCube](https://en.wikipedia.org/w/index.php?oldid=1386636021)
  (rev 1386636021),
  [Wii U](https://en.wikipedia.org/w/index.php?oldid=1386323270)
  (rev 1386323270),
  [PowerVR](https://en.wikipedia.org/w/index.php?oldid=1369795331)
  (rev 1369795331),
  [Single-precision floating-point format](https://en.wikipedia.org/w/index.php?oldid=1384942600)
  (rev 1384942600),
  and [Xbox 360 technical specifications](https://en.wikipedia.org/w/index.php?oldid=1386323517) (rev 1386323517).
