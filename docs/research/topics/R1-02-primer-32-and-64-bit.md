---
title: "The 32-bit and 64-bit era: primer"
roadmap_item: R1-02
status: approved
date: 2026-11-21
---

# The 32-bit and 64-bit era: primer

## Summary

This note asks how the consoles and handhelds of the 32-bit and 64-bit era work, and what that asks of an emulator.

In three of the five worked examples (DS, Nintendo 64, Saturn), processors on different clocks share memory or a bus.
On four, graphics or sound depends on a coprocessor or a DSP (inference),
and on the Nintendo 64 that coprocessor runs programs the game supplies.
Caches become visible to software: on the Saturn they decide whether some games run at all.

The Nintendo 64's choice between low-level
and high-level emulation of its signal processor shapes the whole core (inference).
The note recommends the low level as the baseline, with replacement of known microcode only as a later speed path.

For the PlayStation 1, no clean document was found for many details, but the published results of the
[ps1-tests suite](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb), whose origin
is not stated but which read as console results, answer several of them, at least in part: the GPU's dither pattern, its
fill rule for the shapes tested, drawing time by kind of primitive, the length of a frame, disc command timings, and
1,150 recorded geometry-engine cases to check an implementation against.
The note recommends hardware tests as the oracle for the rest.

This note is not legal advice.

## Scope

- Question: how do the machines of the 32-bit and 64-bit era work, and what does that ask of an emulator?
- Worked examples: the Game Boy Advance, the Nintendo DS and DSi, the Nintendo 64, the PlayStation 1, and the Saturn,
  whose family surveys ([`R1-11`](../../roadmap/research.md#system-family-surveys),
  [`R1-12`](../../roadmap/research.md#system-family-surveys),
  [`R1-16`](../../roadmap/research.md#system-family-surveys),
  [`R1-18`](../../roadmap/research.md#system-family-surveys),
  [`R1-22`](../../roadmap/research.md#system-family-surveys)) depend on this item;
  and the DS and PlayStation 1 hardware inside the 3DS and the PlayStation 2,
  because by the roadmap's rule for surveys that span several primers those systems belong to a later era,
  and [`R1-13`](../../roadmap/research.md#system-family-surveys)
  and [`R1-19`](../../roadmap/research.md#system-family-surveys) draw on this primer for the hardware they contain
  ([research roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers);
  [pull request #22](https://github.com/jsamuelsen11/rustalgia-emu/pull/22)).
  The 3DO, Jaguar, PC-FX, and Virtual Boy appear where they differ in kind.
- Left to other items: every system of the era
  and its hardware in one row each ([`R1-06`](R1-06-catalogue-32-and-64-bit.md));
  the Jaguar's custom processors in depth
  ([`R1-25`](../../roadmap/research.md#system-family-surveys), which takes the systems no other survey names);
  the Dreamcast ([`R1-03`](R1-03-primer-sixth-generation.md)); the law on firmware, keys,
  and lock-outs ([`R0-02`](R0-02-legal-baseline.md)); techniques in depth
  ([`R2-01` to `R2-15`](../../roadmap/research.md#phase-2-cross-cutting-engineering));
  the emulators themselves ([`R1-30`](../../roadmap/research.md#emulator-studies) onward);
  and the instruction sets of the Saturn control unit's DSP and the SCSP's DSP,
  and the SCSP's envelope rates ([`R1-22`](../../roadmap/research.md#system-family-surveys)):
  a primer records that they exist and are programmable.
- Researched on 2026-11-20.
- How claims were checked: research agents fetched every source on 2026-11-20 as raw text
  (wiki raw exports, repository files at a pinned commit where shown, PDFs converted to text) and quoted from it.
  Two independent verification passes ran: in each,
  nine verifiers fetched the sources again and tested the claims and quotations
  (371, then 360),
  and a fix pass checked each finding against the raw source before applying it;
  the claims they could not check are listed in the pull request.
- The open questions of those passes were then worked down on 2026-11-20.
  The [ps1-tests suite](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb)'s
  sources and result logs were read at its commit, and figures were calculated from them, including from two tests'
  frame-buffer images with a script that uses only Python's standard library (tested locally, Python 3.14.6).
  A third independent pass, of two verifiers, fetched the sources again and checked those additions,
  and their links and shape; a fix pass checked each of its findings against the raw source before applying it.
- Markers are those of the [research guide](../README.md#claim-status);
  "(lead)" marks a source the [register](../../../.claude/hooks/source-register.txt) labels a lead.
  Wikipedia is a tertiary source, named wherever a fact rests on it.
  A statement that nothing was found records a search, not proof of absence.
- PlayStation 1 facts name their route.
  [`R0-05` option 8](R0-05-source-map.md#8-how-the-playstation-1-primer-gets-its-facts) lists older documents with
  stated origins, makers' datasheets and patents, hardware tests, and open-tier emulators' code.
  This note reads no emulator code; it adds open-tier emulator documentation, test-suite sources, and tertiary sources,
  named as such.
  The tainted reference was not opened, and no fact here is known only from it.
- No emulator source code, firmware, BIOS image, boot code, decompilation, key, game, or leaked material was opened.
  From emulator projects, only README files, documentation, and test-suite prose and sources were read.

## Findings

### What accuracy means here

- The era moves the hard part of emulation from timing alone to timing plus arithmetic (inference).
  In four worked examples a processor or coprocessor beside the main CPU feeds graphics or sound:
  the Nintendo 64's signal processor runs graphics and audio "microcode",
  the PlayStation 1's geometry coprocessor does fixed-point transforms,
  the DS's geometry engine does matrix and vector multiplications, and the Saturn's control unit holds a DSP
  ([N64brew, "Reality Signal Processor"](https://n64brew.dev/wiki/Reality_Signal_Processor);
  [EP0715277A2](https://patents.google.com/patent/EP0715277A2/en), graphic module;
  [GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1), "DS 3D Overview";
  [Wikipedia, "Sega Saturn"](https://en.wikipedia.org/wiki/Sega_Saturn), tertiary).
- One N64 test suite sorts its tests by the accuracy they need: a basic set, then accurate time,
  then a cycle-accurate emulator, off by default
  ([n64-systemtest](https://github.com/lemmy-64/n64-systemtest), `Cargo.toml` feature comments, read as prose;
  see "Options and trade-offs").

### Processors

#### Makers' manuals

- Arm serves the ARM7TDMI, ARM946E-S, and ARM9E-S manuals
  ([DDI 0029G](https://documentation-service.arm.com/static/5e8e1323fd977155116a3129),
  [0201D](https://documentation-service.arm.com/static/5e8e3ee588295d1e18d3aa82),
  [0165B](https://documentation-service.arm.com/static/5e8e2f18fd977155116a77fb)),
  each marked non-confidential and under the notice that no part of the information "may be adapted
  or reproduced in any material form except with the prior written permission of the copyright holder"
  (each manual, page ii).
  What that means for a software model is open, as `R0-05` records
  ([`R0-05`, "Processor and chip makers' manuals"](R0-05-source-map.md#processor-and-chip-makers-manuals)).
- Renesas serves the
  [SH-1, SH-2, and SH-DSP software manual](https://www.renesas.com/en/document/mas/sh-1sh-2sh-dsp-software-manual)
  (revision 5.00, 2004) under notices that forbid reproduction without written consent and grant no licence (front
  matter: notice items 2 and 11, and item 6 of the Renesas Technology notice).
  It covers the core, pipeline, and instructions.
  A web search found the Saturn's SH7604 hardware manual only in third-party copies, not opened (research log).
- NEC published the VR4300 series' main figures itself in a 1997 news release, read in an archived copy: 133 MHz,
  a 32-bit bus, an on-chip MMU, high-speed floating point, and a 16 KiB instruction and 8 KiB data cache
  ([NEC news release 97/11/14-01-01](https://web.archive.org/web/20200710173520/http://www.nec.co.jp/press/en/9711/1401-01.html),
  capture of 2020-07-10).
  The full user's manual was found only on third-party hosts, which [`R0-05`](R0-05-source-map.md) closes.
- No maker-hosted manual was found for the PlayStation 1's CPU core, the V810, the Jaguar's processors, the ARM60,
  or the 68EC020 (searches of the makers' hosts and the hubs in [`R0-05`](R0-05-source-map.md); research log).

#### Pipelines and delay slots

- MIPS I has a load delay slot and a branch delay slot, and ARM no branch delay slot
  ([Wikipedia, "MIPS architecture"](https://en.wikipedia.org/wiki/MIPS_architecture) and
  ["Delay slot"](https://en.wikipedia.org/wiki/Delay_slot)).
  The PlayStation 1's CPU is R3000A-compatible
  ([Wikipedia, "PlayStation technical specifications"](https://en.wikipedia.org/wiki/PlayStation_technical_specifications)),
  a MIPS I core (from memory).
  The SH-2 has delay slots on unconditional branches and on the delayed conditional branches `BT/S` and `BF/S`
  (Renesas SH-1/SH-2/SH-DSP software manual, section 6.1).
- The ARM7TDMI has three stages, so a read of the program counter sees it two instructions ahead,
  and one bus for code and data (ARM DDI 0029G, sections 1.1.1 and 1.1.2).
  The ARM9E-S inside the DS's ARM946E-S has five stages, separate code and data buses, and interlocks:
  a dependent instruction after a word load waits one core clock cycle, and after a byte, halfword,
  or unaligned load two (ARM DDI 0165B, sections 1.1.1 to 1.1.3 and 8.12.1).
- The SH-2 has five stages; its delayed branches take the target from the register as it was
  before the slot instruction ran; a branch in a delay slot raises an illegal-slot exception.
  A load whose result the next instruction uses stalls the pipeline; memory accesses, a multiply's included,
  compete with fetches, and a multiply waits for the previous one's multiplier
  (Renesas SH-1/SH-2/SH-DSP software manual, sections 4, 6.1.1, and 7.1.1 to 7.2.3).
  Basic instructions take one CPU clock cycle and a 32-by-32 multiply two to four (same manual, table 1.1).
- The Nintendo 64's VR4300 interlocks rather than exposing a load delay slot (inference):
  it stalls one CPU clock cycle when the next instruction "appears to use the result of the load",
  comparing register fields rather than actual use, so some independent pairs stall too
  ([N64brew, "VR4300"](https://n64brew.dev/wiki/VR4300), "Load Delay Interlock").
  A cycle-exact core needs that rule; a functional one does not (inference).

#### Game Boy Advance

- The Game Boy Advance runs an ARM7TDMI at 16.78 MHz, in 32-bit ARM or 16-bit Thumb state,
  and keeps an 8-bit CPU for Game Boy and Game Boy Color cartridges
  ([GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md),
  "GBA Technical Data").
  The Game Boy Advance survey ([`R1-11`](../../roadmap/research.md#system-family-surveys))
  therefore needs the Game Boy processor from [`R1-01`](R1-01-primer-8-and-16-bit.md) as well (inference).
- Arm counts non-sequential, sequential, internal, and coprocessor cycles per instruction,
  multiply time depending on the operand's top bytes
  (ARM DDI 0029G, table 6-23; GBATEK gives the same),
  and on the Game Boy Advance memory wait states stretch them (see "Buses and wait states").
- The pipeline is visible to software: reads of unused memory return the most recently prefetched opcode,
  and reads of the BIOS from outside it return the last opcode the BIOS fetched
  (GBATEK, "Reading from BIOS Memory" and "Reading from Unused Memory").
  Open-bus values therefore depend on the pipeline model (inference).

#### Nintendo DS and DSi

- The DS pairs an ARM946E-S at 66 MHz with an ARM7TDMI at 33 MHz (16 MHz in Game Boy Advance mode)
  (GBATEK, "DS Technical Data").
  Only the ARM9 has tightly coupled memories (32 KiB for code, 16 KiB for data) and caches
  (8 KiB instruction, 4 KiB data, 4-way, 32-byte lines),
  and GBATEK says the ARM7 "probably doesn't have a Protection Unit at all"
  (GBATEK, "DS Memory Control - Cache and TCM").
  Arm leaves these sizes to the implementer (ARM DDI 0201D, section 1.1).
- The ARM9 runs at twice the 33.51 MHz bus clock,
  but outside its caches and tightly coupled memories GBATEK gives its opcode fetches as "always N32 + 3 waits",
  though the same section spares main RAM the 3-cycle penalty,
  and puts its effective bus speed there at barely 8 to 16 MHz (GBATEK, "DS Memory Timings").
  Whether the caches are modelled decides how fast the ARM9 appears to games (inference).

#### Nintendo 64

- The CPU is a slightly modified NEC VR4300, a MIPS core with a 64-bit mode at 93.75 MHz, a floating-point unit,
  and a system coprocessor holding an MMU and TLB; retail units tested so far report revision 1.0 or 2.2,
  and not every board revision has been tested (N64brew, "VR4300").
- The chip departs from its manual in documented cases: a 32-bit arithmetic shift right fills from the upper 32 bits,
  and early units have a floating-point multiplication bug.
  Multiply and divide with inputs that are not sign-extended, which the manual leaves undefined,
  give results consistent with wider operands on revision 2.2, with one division case unexplained
  (N64brew, "VR4300", "Known Bugs").
  The page names no test method; a core written from the maker's manual alone would be wrong
  or undefined in these cases (inference).
- The signal processor (RSP) is a cut-down MIPS core at 62.5 MHz with 4 KiB each of instruction and data memory,
  no exceptions, and a scalar unit with no multiply, divide, or 64-bit loads,
  and no unaligned-access instructions because ordinary loads and stores work at any address;
  its vector unit has 32 registers of eight 16-bit lanes with a 48-bit accumulator per lane
  ([N64brew, "Reality Signal Processor"](https://n64brew.dev/wiki/Reality_Signal_Processor) and its
  ["CPU Core"](https://n64brew.dev/wiki/Reality_Signal_Processor/CPU_Core) page).
- A scalar and a vector instruction issue in the same cycle when paired, with exceptions; vector-register results,
  vector loads included, are ready after four cycles and scalar loads after three,
  and the pipeline stalls to enforce this
  ([N64brew, "Reality Signal Processor/CPU Pipeline"](https://n64brew.dev/wiki/Reality_Signal_Processor/CPU_Pipeline),
  from software's point of view).
- The geometry and audio stages run as microcode that games load into this core, usually Nintendo's stock microcode,
  and the display processor rasterises in hardware (N64brew, "Reality Signal Processor").
  Running them instruction by instruction or replacing them with host code is the central choice
  (inference; see "Options and trade-offs").
- A static recompiler turns Nintendo 64 functions into C,
  given an ELF file of symbols most easily obtained from a disassembly or decompilation,
  and handles branch delay slots "by duplicating instructions as necessary"
  ([N64Recomp README](https://github.com/N64Recomp/N64Recomp)).
  [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) closes decompilations,
  so as the README stands this route needs per-game material the project may not read (inference).

#### PlayStation 1

- Maker's patent: Sony's application (priority 1994) describes the CPU as a 32-bit RISC processor
  that "includes a command cache and a scratch pad memory", beside 2 MiB of main RAM and a 512 KiB ROM given as examples
  ([EP0715277A2](https://patents.google.com/patent/EP0715277A2/en), description of the main controller module).
  The patent says "may be" and "for example" for the CPU type and sizes.
- Maker's patent: the same application describes the "geometry transfer engine" (GTE)
  as a coprocessor of the CPU doing coordinate transforms, lighting, vectors, and matrices in fixed point (EP0715277A2),
  at about 1.5 million flat-shaded polygons a second
  (EP0715277A2 and [EP0715276A2](https://patents.google.com/patent/EP0715276A2/en)).
  The patents do not give its arithmetic in detail.
- Older document: Joshua Walker's compilation of 2000 gives the clock as 33.8688 MHz,
  cached and uncached mirrors of RAM, and the BIOS at `0xBFC00000`
  ([Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf), "The R3000A" and "The PSX Memory Map").
  It describes a 1 KiB write-through data cache and, separately, a 1 KiB scratch pad at `0x1F800000`,
  in paragraphs that read like a processor family manual's (inference); the patent names only a scratch pad.
  Its author took a console apart, searched the web, and "poked at emulators",
  and calls much of it "hearsay and logical deductions" (Walker, "Introduction").
- Older document with a stated method:
  Doomed's geometry document of 2000 says "Most of this is the result of experiment, so not all info might be correct",
  and gives cycle counts for each command and a rule that reading a coprocessor register
  while a command runs stalls the CPU
  ([Doomed, `gte.txt`](https://hitmen.c02.at/files/docs/psx/gte.txt); reproduced in Walker's GTE chapter).
- Hardware test (the register records the wiki as its author's experiments; the page states no method):
  AmiDog writes that division by zero gives results consistent with a divider that works one bit at a time,
  gives a result for the most negative number divided by minus one, where some CPUs, x86 among them, raise an exception,
  and that "there are games out there which relies on this undefined behavior"
  ([AmiDog's PSX wiki, `psx:cpu:division`](https://psx.amidog.se/doku.php?id=psx:cpu:division)).
  He also reports that the geometry engine decodes 64 functions, not only the documented ones
  ([`psx:gte:opcodes`](https://psx.amidog.se/doku.php?id=psx:gte:opcodes); his flag explanation is stated as a guess,
  [`psx:gte:flags`](https://psx.amidog.se/doku.php?id=psx:gte:flags)).
- Hardware test (by inference from the suite): the ps1-tests suite records 1,150 geometry-engine cases,
  50 for each of 22 named commands and for command code `0x40`, each with all 64 input registers and the outputs
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  `gte-fuzz/gte_valid_0xc0ffee_50.log`; observed).
  Its `gte/test-all`, which the README says was generated by `gte-fuzz`, logs "Passed tests: 1150" and none failed,
  so the recorded outputs agree with the machine that log came from (inference; `gte/test-all/psx.log`).
  The cases' origin is not stated.
  An implementation written from the patents
  and Doomed's text can be checked against them without any description of the arithmetic (inference).
- No clean source was found for the exact core variant and its system-coprocessor deviations, cache refill timing,
  the write buffer beyond Walker's one line, bus timing per region beyond the test below,
  or a description of the geometry engine's register formats, saturation, and flags beyond the experimental documents
  (searches of the hubs in [`R0-05`](R0-05-source-map.md), Google Patents, and AmiDog's wiki,
  whose page on load-delay corner cases does not exist).
  The recorded cases above check an implementation of them; "Options and trade-offs" recommends how to fill the rest.

#### Saturn

- The Saturn has two SH-2s at about 28.6 MHz sharing one bus, a 68EC000 for sound, an SH-1 controlling the disc drive,
  and a system control unit with a DSP
  ([Wikipedia, "Sega Saturn"](https://en.wikipedia.org/wiki/Sega_Saturn), technical specifications).
- Charles MacDonald, testing on a Saturn, gives two software-selected CPU clocks, 26.8465875 MHz and 28.63636 MHz
  (the faster needed for 352-pixel widths),
  shared with the video chips and the control unit
  ([MacDonald, "Sega Saturn hardware notes"](http://www.dreamjam.co.uk/emuviews/docindex.php), "NTSC Saturn timing";
  lead).

#### Others, and what they share

- The 3DO runs an ARM60 at 12.5 MHz, with a matrix engine in its MADAM chip for fixed-point matrix multiplies,
  started by a register write and polled by the CPU
  ([3DO Development Repo wiki, `hardware/opera/madam/matrix_engine`](https://3dodev.com/documentation/hardware/opera/madam/matrix_engine);
  [Wikipedia, "3DO"](https://en.wikipedia.org/wiki/3DO_Interactive_Multiplayer)).
  The wiki states no origin on its [hardware hub](https://3dodev.com/documentation/hardware) or the pages cited;
  its other pages index 3DO's closed documents.
- The Virtual Boy's V810-family CPU has a 1 KiB instruction cache and no delay slot described (inference);
  a taken branch costs three cycles, and many timings are marked as needing research
  ([Sacred Tech Scroll](http://perfectkiosk.net/stsvb.html), "CPU - NVC/V810 Family Microprocessor").
  Mednafen's Virtual Boy and PC-FX modules offer a fast mode and an accurate one with cache emulation,
  saying that even then "the pipeline isn't correctly and fully emulated"
  (Mednafen documentation, [`vb.html`](https://mednafen.github.io/documentation/vb.html) and
  [`pcfx.html`](https://mednafen.github.io/documentation/pcfx.html)).
- The Jaguar has a 68000 at 13.295 MHz and two custom 32-bit RISC processors at 26.591 MHz,
  one in each of its "Tom" and "Jerry" chips, and a memory-controller flaw that limits running their code from main RAM
  ([Wikipedia, "Atari Jaguar"](https://en.wikipedia.org/wiki/Atari_Jaguar), citing a 2009 blog post for the flaw;
  tertiary, resting on a lead).
  The same article says Hasbro released the Jaguar's patents and rights into the public domain in 1999,
  citing magazines (tertiary).
  No open source was found for the processors' pipelines (web search and the hubs in [`R0-05`](R0-05-source-map.md)).

### Memory, buses, and save media

#### One pool or several

- The Nintendo 64 has one pool of main memory, 4 MiB of RDRAM, reached by the CPU and, through the reality co-processor,
  by its display, video, and DMA engines; the Expansion Pak adds a second 4 MiB
  ([N64brew, "RDRAM"](https://n64brew.dev/wiki/RDRAM), ["Expansion Pak"](https://n64brew.dev/wiki/Expansion_Pak),
  and ["Memory map"](https://n64brew.dev/wiki/Memory_map)).
  Software typically finds the Expansion Pak by writing and reading back at 1 MiB steps
  (N64brew, "RDRAM", "Expansion Pak Detection"),
  so emulated memory must stop answering past its configured size (inference).
- The Saturn splits 2 MiB of CPU work RAM into a low and a high block of 1 MiB at different addresses,
  and gives each video chip and the sound side its own memory
  ([MacDonald, "SH-2 Memory Map"](http://www.dreamjam.co.uk/emuviews/docindex.php); lead).
  Which bus each block sits on rests on [Copetti's article](https://www.copetti.org/writings/consoles/sega-saturn/),
  whose live page lists Sega's closed manuals as sources for that chapter (lead).
- The PlayStation 1 has three separate memories: 2 MiB of main RAM, 1 MiB of video RAM on the graphics chip,
  and 512 KiB of sound RAM
  ([Wikipedia, "PlayStation technical specifications"](https://en.wikipedia.org/wiki/PlayStation_technical_specifications),
  citing a 1995 magazine; tertiary).
  The sources disagree on the main RAM's type: Wikipedia says EDO DRAM, Walker "four 512k 60ns SRAM chips"
  ([Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf), "Memory").
  The chip type does not change what an emulator does; the access time does, and a test measures it below (inference).
- The DS has 4 MiB of main RAM shared by both CPUs, 32 KiB of work RAM that can be split between them,
  64 KiB for the ARM7 alone, nine video RAM banks whose addresses registers set, and memories on no CPU bus at all,
  such as the 3D engine's polygon RAM and 256 KiB of firmware flash
  ([GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  "DS Memory Maps" and "DS Memory Control - VRAM").
- When the DS's shared work RAM belongs wholly to one CPU,
  the ARM9 reads undefined data there and the ARM7 reads mirrors of its own work RAM
  (GBATEK, "DS Memory Control - WRAM").
  Each CPU therefore needs its own map and its own fallback for unmapped addresses (inference).

#### Caches and segments

- The Nintendo 64 and PlayStation 1 CPUs both use the MIPS segments: one window of RAM is cached, another uncached
  (N64brew, "Memory map"; Walker, "The PSX Memory Map" and "Memory").
- On the Nintendo 64 only RDRAM accepts cached accesses;
  elsewhere "cache requests are ignored ... and they will thus freeze the CPU requiring a hard reset"
  (N64brew, "Memory map").
  Unmapped physical ranges are also ignored, so a read never completes and the CPU locks up (same page).
  The faithful result is a hang, not an open-bus value (inference).
- On the PlayStation 1 a 1 KiB scratch pad sits at `0x1F800000`
  (older document: Walker, "The PSX Memory Map");
  that it is the data cache configured as a scratchpad rests on
  [Wikipedia, "PlayStation technical specifications"](https://en.wikipedia.org/wiki/PlayStation_technical_specifications),
  citing Sony's Net Yaroze user guide (tertiary).
- Whether the PlayStation 1 core has a TLB is not settled.
  Walker describes a 64-entry TLB without saying how he checked it,
  and his bibliography names a processor family manual.
  Wikipedia's "PlayStation technical specifications" says the system coprocessor manages memory through virtual memory,
  under a "Citation needed" tag (tertiary).
  The ps1-tests suite's `cpu/cop` test covers the enable bits of coprocessors 0 to 3, their store instructions,
  and an undefined function on coprocessors 0 and 2, not the TLB instructions
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  `cpu/cop/main.cpp` and its log; observed).
- Each Saturn SH-2 selects, by the top three address bits, cached access, cache-through access, a purge area,
  direct access to its cache tags and data, or its on-chip registers
  (MacDonald, "SH-2 Memory Map", lead; [Yabause wiki, "SH-2CPU"](https://wiki.yabause.org/index.php5?title=SH-2CPU)).
  The two CPUs have no hardware cache coherency: shared data "should be read/written using cache-through addresses"
  (Yabause wiki, "SH-2CPU", "Caveats").
- Saturn games have coherency bugs that the hardware typically hides,
  "due to the effects of instruction fetches on the cache".
  Mednafen keeps a per-game list of cache modes "to fix various logic and timing issues in games",
  and does not turn full cache emulation on for every game mainly because of its host time
  ([Mednafen documentation, `ss.html`](https://mednafen.github.io/documentation/ss.html), "Cache Mode").
  On this system, cache emulation is a correctness question, not only a timing one (inference).
- The DS ARM9's cache and tightly coupled memories sit off the system bus, so DMA cannot reach the latter,
  and software drains the write buffer before a DMA read and invalidates the cache after a DMA write
  (GBATEK, "DS DMA Transfers").
  A game that forgets to may depend on stale data, which only a cache model reproduces (inference).

#### Buses and wait states

- The Game Boy Advance's regions differ in width and speed: internal work RAM is 32-bit with single-cycle access,
  external work RAM 16-bit with 3, 3, and 6 cycles for 8-, 16-, and 32-bit accesses by default, and cartridge ROM 16-bit
  ([GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md),
  "Address Bus Width and CPU Read/Write Access Widths").
  A 32-bit access to the cartridge bus is split into two 16-bit accesses, the second always sequential
  (GBATEK, `WAITCNT`).
- Cartridge ROM wait states are set by software, separately for the first and the following accesses,
  and a non-sequential access is forced at each 128 KiB boundary (GBATEK, `WAITCNT`).
  The cartridge latches the low address bits and counts them up itself on sequential accesses
  (GBATEK, "GBA Cartridge ROM"), which is why sequential access can be cheaper (inference).
- A prefetch buffer of eight halfwords fetches ROM opcodes while the CPU is not using the bus,
  and with prefetch off some opcodes take a non-sequential fetch instead (GBATEK, "GBA GamePak Prefetch").
  Exact Game Boy Advance timing needs a prefetch model (inference).
- On the Nintendo 64 the CPU reaches everything through the RCP,
  which ignores the access size for its registers and the external buses:
  byte and halfword writes store the CPU's whole shifted bus word, and 64-bit reads freeze the console
  (N64brew, "Memory map").
  Its cartridge bus carries 16-bit data in two timing "domains" set by registers,
  and reading it where no device answers returns the low half of the address in both halves of the word
  ([N64brew, "Parallel Interface"](https://n64brew.dev/wiki/Parallel_Interface), "Domains" and "Open bus behavior").
- Hardware test (made on hardware by inference from the suite):
  a result log gives a PlayStation 1 CPU access about one cycle to the scratchpad, about five to main RAM,
  and far more to the BIOS ROM, growing with access width as from a narrow bus
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  `cpu/access-time/psx.log`; inference).
  Another log shows byte and halfword writes to many I/O registers arriving as 32-bit writes of the CPU's whole register
  (`cpu/io-access-bitwidth/psx.log`; observed).
  The suite does not state its expected values' origin ([`R0-05`](R0-05-source-map.md)).

#### DMA

- The Game Boy Advance has four DMA channels with fixed priority; the CPU stops while one runs;
  two feed the sound FIFOs, and GBATEK says only the fourth may move data to or from cartridge ROM,
  though it gives channels 1 and 2 a source in "any memory" (GBATEK, "GBA DMA Transfers").
- The DS has four channels for each CPU;
  the ARM9 keeps running during DMA only while it works in its caches or tightly coupled memories
  (GBATEK, "DS DMA Transfers").
  The DSi adds four more for each CPU, and their priority against the old ones is unknown
  (GBATEK, "DSi New DMA (NDMA)");
  [DSiBrew's "NDMA" page](https://dsibrew.org/wiki/NDMA)
  (revision 3261, 2010-11-26)
  gives an arbitration bit for the new channels, fixed or round robin, but not their priority against the old ones.
- The Nintendo 64's interfaces have their own DMA engines: the cartridge bus, the serial bus to the controller chip,
  the signal processor's memories, and audio and video fetches
  ([N64brew, "Reality Signal Processor/Interface"](https://n64brew.dev/wiki/Reality_Signal_Processor/Interface),
  ["Serial Interface"](https://n64brew.dev/wiki/Serial_Interface), "Memory map",
  and ["Video Interface"](https://n64brew.dev/wiki/Video_Interface)).
- Cartridge-to-RAM DMA, the only direction analysed in detail,
  splits at RAM page boundaries and has misalignment bugs that leave holes in RAM,
  which N64brew describes while saying that "the *actual* process implemented in the hardware is unknown"
  (N64brew, "Parallel Interface").
- The signal processor's memories are single-ported with "no bus arbiter":
  if the CPU and the RSP or its DMA touch them at once, one side's access is lost or corrupted
  (N64brew, "Reality Signal Processor/Interface", "DMEM and IMEM").
  An emulator that runs the two in turn never meets the conflict (inference).
- Older documents: the PlayStation 1 has seven DMA channels, for the video decoder in and out, the graphics chip,
  the disc drive, the sound chip, an expansion port, and clearing the ordering table,
  and the graphics channel can follow a linked list
  (Walker, "DMA"; [Doomed, `system.txt`](https://hitmen.c02.at/files/docs/psx/system.txt), "DMA").
- Hardware test (by inference from the suite): the ps1-tests suite's DMA tests each run one channel
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  the logs of `dma/chopping`, `dma/otc-test`, `dma/chain-looping`, and `dma/dpcr`, and `dma/chopping/main.cpp`;
  observed).
  In `dma/chopping`, 8,192 bytes from the CPU to video RAM on channel 2 take 2,196 CPU clock cycles
  when started at once, 22,819 in blocks of one word, falling to 2,471 in blocks of 128,
  and 16,693 to 81,926 when chopped into one-word bursts, rising with the CPU's window (`dma/chopping/psx.log`).
  In `dma/chain-looping`, a graphics linked list that points to itself never finishes and raises no interrupt,
  and CPU work beside it takes 25,632 timer ticks instead of 16,040 (`dma/chain-looping/psx.log`).
  No test runs two channels at once, so none settles the priority between them (inference).

#### Save media

- The Nintendo 64 cartridge offers serial EEPROM through the controller chip's channel,
  or SRAM or FlashRAM on the cartridge bus
  ([N64brew, "Joybus Protocol"](https://n64brew.dev/wiki/Joybus_Protocol), ["Flash"](https://n64brew.dev/wiki/Flash),
  and "Memory map"; and "PIF-NUS", closed and not linked, as "Media, protection, and firmware" explains).
  Its original header has no save-type field
  (a homebrew convention adds one),
  and "emulators normally work using a game database which matches games using checksum to find out which savetype
  and controllers are expected by the game" ([N64brew, "ROM Header"](https://n64brew.dev/wiki/ROM_Header)).
  An emulator needs that database, whose terms [`R0-03`](../../roadmap/research.md#phase-0-ground-rules) governs
  (inference).
- The Game Boy Advance has four save kinds: SRAM or FRAM on an 8-bit bus, serial EEPROM driven by DMA,
  flash from several makers with different identifiers, or none (GBATEK, "GBA Cart Backup" sections).
  "Nintendo didn't include a backup-type entry in the ROM header",
  so detection is by an identifier string that Nintendo's library places in the ROM, or by heuristics
  (GBATEK, "GBA Cart Backup IDs").
- DS cartridges save to an SPI chip on the card's serial bus, EEPROM, flash, or FRAM of several sizes,
  and GBATEK describes how an emulator can find the address width by counting the bytes a game sends
  after selecting the chip, with per-game exceptions (GBATEK, "DS Cartridge Backup", "Detection (in emulators)").
- Older document: the PlayStation 1 memory card holds 128 KiB in 16 blocks of 8 KiB, the first a directory,
  and shares the serial protocol and pins with the controllers
  (Walker, "Memory Card Format" and "Controllers"; its bibliography credits others, methods unstated).
  Walker gives the shared bus timing and the byte that selects a card (`0x81`) (Walker, "Controllers").
- Maker's patent: Sony's application, with 1994 priority, puts a microcomputer in each memory card,
  with a serial interface on the console's data, clock, and control lines and a parallel one to its flash memory,
  and has the CPU reach each card slot through a communication controller on the main bus
  ([EP0810015A2](https://patents.google.com/patent/EP0810015A2/en), description).
  It gives no command codes or timings.
  A later patent by another maker, for a device that copies PlayStation 1 saves to a computer,
  reads the card in blocks of 128 bytes in its example, but defines only its own commands to the computer
  ([US 6,386,979](https://patents.google.com/patent/US6386979B1/en), description).
- No clean source was found for the card's read and write commands
  (searches of Walker, Doomed, the ps1-tests README and file tree, which holds only `input/pad`, with no log,
  and the two patents above, found by web search).
- The Saturn keeps 32 KiB of battery-backed RAM on odd bytes only,
  and its cartridge slot takes backup-RAM cartridges or RAM-expansion cartridges of 1 MiB or 4 MiB
  (MacDonald, "SH-2 Memory Map", lead; Yabause wiki,
  ["Backup RAM Cartridge"](https://wiki.yabause.org/index.php5?title=Backup_RAM_Cartridge)
  and ["DRAM Cartridge"](https://wiki.yabause.org/index.php5?title=DRAM_Cartridge)).
  Mednafen chooses the cartridge for each game from a list,
  because some games need a RAM or ROM cartridge and some crash with a RAM cartridge inserted
  (Mednafen, `ss.html`, "Cart").

### Video

#### Three kinds of 3D hardware

- The era's 3D hardware is fixed-function and comes in three kinds that ask different things of an emulator
  (inference from the findings below):
  a polygon rasteriser fed by a geometry coprocessor
  (PlayStation 1, DS);
  a programmable signal processor that feeds a configurable rasteriser
  (Nintendo 64);
  and a sprite engine that draws distorted quadrilaterals into a frame buffer, composited by a tile engine (Saturn).
- Of the worked examples, the Nintendo 64 and the DS compare depth per pixel
  ([N64brew, "Reality Display Processor/Pipeline"](https://n64brew.dev/wiki/Reality_Display_Processor/Pipeline);
  [GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  "Depth Test" and `SWAP_BUFFERS`), while the PlayStation 1 and Saturn draw in the order software gives (below).

#### PlayStation 1

- Older documents: Doomed's GPU text says most of it "is the result of experiment"
  ([`gpu.txt`](https://hitmen.c02.at/files/docs/psx/gpu.txt), "About this document"),
  and [Walker's](https://hitmen.c02.at/files/docs/psx/psx.pdf) GPU chapter reproduces it closely.
  Most of what follows rests on these,
  with Sony's patent [US 5,793,376](https://patents.google.com/patent/US5793376A/en) where it agrees,
  and on the ps1-tests suite's results where stated.
- The GPU owns 1 MiB of frame buffer, addressed as a 1024 by 512 grid of 16-bit pixels rather than linearly,
  in which display areas, drawing areas, textures, and colour tables all live
  (Doomed, `gpu.txt`, "The Frame Buffer"; US 5,793,376, description).
  An emulator that renders on a host GPU must still keep this one shared surface coherent (inference).
- It draws triangles and quadrilaterals, flat or Gouraud-shaded, textured or not, and rectangles and lines;
  a four-point polygon is drawn as two triangles,
  and in Doomed's four-point example the right-most column and bottom row are not drawn; he did not check triangles
  (Doomed, `gpu.txt`, "Primitives").
- Visibility comes from order: the GPU draws packets as given, and software sorts them through an ordering table
  (Doomed, `gpu.txt`; Walker, GPU chapter).
  Semi-transparency reads the frame-buffer pixel and combines it in one of four modes (Doomed, "Semi Transparency").
- With dithering on, the GPU computes colour at 24 bits and dithers when it writes 15 bits
  (Doomed, "Drawing Environment"); in 24-bit display mode the GPU cannot draw into the frame buffer (US 5,793,376).
- Texture coordinates are interpolated linearly in screen space
  (affine mapping),
  and because the hardware supported only that, games subdivided polygons to hide the distortion
  ([Wikipedia, "Texture mapping"](https://en.wikipedia.org/wiki/Texture_mapping), uncited there; tertiary).
  The geometry engine returns integer screen coordinates with no fraction
  ([Doomed, `gte.txt`](https://hitmen.c02.at/files/docs/psx/gte.txt), perspective transform).
  Together these give the console's characteristic texture warping and vertex jitter (inference).

Hardware test (by inference from the suite):
the ps1-tests suite's `gpu/triangle` test draws the same Gouraud-shaded triangle twice in the frame buffer's left 320
columns, undithered in rows 16 to 222 and dithered in rows 256 to 462, and a third, larger triangle undithered to their
right, and publishes the frame buffer as an image
([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
`gpu/triangle/main.c` and `gpu/triangle/vram.png`).
The image's origin is not stated; its channels hold only multiples of 8,
so each 5-bit channel is stored shifted left by three (observed).

- Dither pattern: comparing the two copies pixel by pixel gives, for each position modulo 4,
  how often dithering raised or lowered a 5-bit channel.
  Read as an offset added to the 8-bit colour before it is cut to 5 bits, the offsets are those in the table below,
  with every estimate within 0.11 of a whole number, from about 4,300 samples per position
  (calculated from `gpu/triangle/vram.png`, leaving out channels at 0 or 31; tested locally, Python 3.14.6).
  The test draws with no drawing offset, so it cannot show whether the pattern follows frame-buffer
  or screen position (inference).

  | Row (y mod 4) | x mod 4 = 0 | 1 | 2 | 3 |
  |---|---|---|---|---|
  | 0 | -4 | 0 | -3 | +1 |
  | 1 | +2 | -2 | +3 | -1 |
  | 2 | -3 | +1 | -4 | 0 |
  | 3 | +3 | -1 | +2 | -2 |

- Fill rule, method: the same image holds three triangles, the one above, its dithered copy, and one with vertices at
  (518, 472), (1018, 472), and (768, 39), as the test's source computes them.
  Each was compared, row by row, with the span from the left edge's exact position, rounded up,
  to the last pixel before the right edge, from the top vertex's row to the row before the bottom edge.
- Fill rule, result: all 847 rows in those ranges match, and no pixel lies outside them;
  the top vertex's row holds no pixel, as its span is empty
  (calculated from `gpu/triangle/vram.png` and `main.c`; tested locally, Python 3.14.6).
  So the left edge is drawn and the right and bottom edges are not,
  which matches Doomed's four-point example (inference).
  These triangles have a horizontal bottom edge and mirror-image sides.
- Fill rule, other shapes: the suite's `gpu/quad` test tiles the 320 by 240 screen with five semi-transparent flat
  quadrilaterals, which share slanted edges and meet the screen's edges, and adds 16 squares of 16 by 16 pixels side by
  side (`gpu/quad/main.c` and `gpu/quad/vram.png`).
  In its image every pixel of the screen holds a colour blended once: none is left white and none is blended twice,
  each square covers exactly 256 pixels, and column 320 and row 240 are not drawn
  (calculated from `gpu/quad/vram.png`; tested locally, Python 3.14.6).
  So edges shared by two polygons are drawn exactly once,
  and top and left edges are drawn while right and bottom edges are not, for these slopes (inference).
- Drawing time, method: the suite's `gpu/bandwidth` test runs each operation 400 times over a 320 by 240 area
  and counts horizontal blanks (`gpu/bandwidth/main.cpp`).
- Drawing time, figures: one such operation takes about 3.0 horizontal blanks for a fill, 19.0 for a plain rectangle,
  28.6 semi-transparent, and 37.8 textured, 19.3 for a plain quadrilateral, 29.1 semi-transparent, and 99.8 textured,
  and 47.8 for a copy within video RAM (calculated as each count divided by 400, from `gpu/bandwidth/psx.log`).
  A quadrilateral a quarter or half off screen takes 14.6 or 9.9, so clipped pixels cost little (same).
  The textured semi-transparent runs take the same time as the textured ones
  (15,139 against 15,138 for rectangles, 39,938 for both quadrilaterals; same log).
  Drawing time therefore depends on the kind of primitive and texturing,
  and on semi-transparency only for untextured primitives (inference).
- Per-pixel cost: at about 2,172 system clock cycles a line
  (see "Timing, synchronisation, and input"),
  those figures over 76,800 pixels give about 0.09 system clock cycles a pixel for a fill, 0.54 for a plain rectangle,
  1.07 for a textured rectangle, and 2.82 for a textured quadrilateral (calculated).
  This is the average over a whole screen, not the cost of a single pixel or of a small polygon (inference).
- Still without a clean source: whether textures are point-sampled
  (only [Wikipedia's "Nintendo 64"](https://en.wikipedia.org/wiki/Nintendo_64) says so, citing a tutorial site;
  tertiary), and the limits on polygon size: the patent gives sprites of 1 by 1 to 256 by 256 dots,
  Doomed the fill command's maximum, and no ps1-tests case draws an over-size polygon
  (searches of Doomed's texts, Walker, the patent, the ps1-tests README's test list, and Wikipedia).

#### Nintendo 64

- Nintendo and Silicon Graphics' patent describes the coprocessor as a programmable signal processor with a vector unit
  and a display processor that rasterises triangles and rectangles with texture, colour combining, blending,
  and anti-aliasing ([US 6,331,856](https://patents.google.com/patent/US6331856B1/en), description).
- "The code running on the RSP is usually called 'microcode', but it's a standard MIPS program"
  ([N64brew, "Reality Signal Processor"](https://n64brew.dev/wiki/Reality_Signal_Processor); inner quotes made single).
  Games send display lists to that program,
  which transforms and lights vertices and sends triangle commands to the display processor (RDP)
  (same page; US 6,331,856).
  Some games used their own microcode
  ([Wikipedia, "Nintendo 64"](https://en.wikipedia.org/wiki/Nintendo_64); tertiary),
  so an emulator that replaces known microcode with host code must recognise each one (inference).
- The RDP has four pipeline modes: one-cycle and two-cycle, which run texture, combiner,
  and blender once or twice per pixel, and copy and fill
  ([N64brew, "Reality Display Processor/Pipeline"](https://n64brew.dev/wiki/Reality_Display_Processor/Pipeline)).
  It rasterises with a coverage value for each pixel, optionally corrects texture coordinates for perspective,
  samples a 4 KiB texture memory (["Reality Display Processor"](https://n64brew.dev/wiki/Reality_Display_Processor)),
  filters, combines colours, compares depth, tests alpha and coverage, blends,
  and dithers 8-bit channels to 5 bits for 16-bit images
  (N64brew, "Reality Display Processor/Pipeline", "1-Cycle Pipeline").
- The video interface filters the image it scans out: it anti-aliases from the coverage values and can de-dither,
  for which it "looks at the 8 neighbors around each pixel and perform an error correction"
  ([N64brew, "Video Interface"](https://n64brew.dev/wiki/Video_Interface)).
  An emulator needs both the frame buffer and this filter (inference).
- paraLLEl-RDP renders the RDP with compute shaders on a host GPU
  and "aims to be bitexact with the Angrylion-Plus reference renderer where possible"
  ([paraLLEl-RDP README](https://raw.githubusercontent.com/Themaister/parallel-rdp/1cecd042/README.md)).
  Its reference is an emulator the [register](../../../.claude/hooks/source-register.txt) closes,
  so bit-exactness is agreement with one emulator (inference).

#### Saturn

- VDP1 draws sprites, polygons, and lines into one of two frame buffers,
  which are swapped or erased at frame boundaries, and leaves priority and most other effects to VDP2
  ([Yabause wiki, "VDP1"](https://wiki.yabause.org/index.php5?title=VDP1);
  [Ymir](https://github.com/ymir-emu/ymir/tree/0fdabbdd41f17fd7fda58195130c3b43f7fd00e5)
  `docs/dev-notes/system-info/vdp1-erase-swap-timings.txt`).
  Its commands are 32-byte tables in its own memory
  (Yabause wiki, "VDP1"):
  normal, scaled, and distorted sprites, polygons, polylines, and lines
  ([MacDonald, "Saturn VDP1 hardware notes"](http://www.dreamjam.co.uk/emuviews/docindex.php), from his own tests;
  lead).
- VDP1 maps textures forward, from texture points onto the quadrilateral
  ([Copetti, Saturn article](https://www.copetti.org/writings/consoles/sega-saturn/), lead;
  [Sega Retro, "VDP1 (Saturn)"](https://segaretro.org/VDP1_(Saturn)), "Overview", names the term, citing a fan site).
  Some pixels are drawn twice, which applies shadow or half-transparency twice
  (Sega Retro, same, "Errata", uncited; MacDonald's VDP1 notes, from his own tests, lead);
  only Copetti ties this to forward mapping.
- VDP1 has no visible-surface hardware, so geometry must arrive in the right order,
  and Sega's library sorted polygons by approximate depth
  (Copetti, Saturn article, "An introduction to the visibility problem"; lead).
- VDP1's drawing time is visible to games (inference): as a per-game workaround,
  Mednafen slows VDP1 command execution for some titles when the SH-2s access it
  ([Mednafen documentation, `ss.html`](https://mednafen.github.io/documentation/ss.html), "Horrible Hacks").

#### Game Boy Advance and DS

- The Game Boy Advance draws a 240 by 160 picture from four background layers, tiled or bitmap, and 128 objects
  ([GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md),
  "Video" summary and the `DISPCNT` mode table).
  Objects have a budget of 1210 cycles a line, or 954 when software may reach object memory during horizontal blank
  (GBATEK, "Maximum Number of Sprites per Line"), four per dot, so system-clock cycles (inference).
- The DS has two 2D engines, each much like the Game Boy Advance's, and engine A adds a 3D layer
  (GBATEK, "DS Video" and "DS Video BG Modes / Control").
- The DS's 3D hardware is a geometry engine, whose vertex
  and polygon memories swap at the next vertical blank (`SWAP_BUFFERS`), and a rendering engine that draws line by line:
  "There's only the 48-line cache (not a full 192-line framebuffer to store the whole rendered image)"
  (GBATEK, "DS 3D Overview").
  The limits are 2048 polygons and 6144 vertices a frame (GBATEK, `RAM_COUNT`).
  A whole-frame renderer cannot show what the hardware shows when a line is overloaded (inference).
- "Quads are natively handled and not converted to triangles,
  which is a bit of a problem as modern GPUs only support triangles"
  ([melonDS blog, "The DS GPU and its fun quirks"](https://melonds.kuribo64.net/comments.php?id=56); lead).
  The rasteriser fills one span per line between two edges, and depth is a Z or a W buffer chosen each frame
  (same post; GBATEK, `SWAP_BUFFERS`).
- polyrastertest's reference data was recorded on a New 3DS XL through TWiLight Menu++,
  and its author knows of no difference from other DS models
  ([polyrastertest readme](https://github.com/Jaklyy/PolyRasterTest)), so its oracle is a 3DS.

#### Others

- In PlayStation 1 mode the PlayStation 2's processors emulate the graphics chip: "In PSX mode,
  the EE and GS work together to emulate the PSX GPU"
  ([ps2tek](https://psi-rockin.github.io/ps2tek/), "BIOS PlayStation Compatibility"),
  so the PlayStation 2 is not a second PlayStation 1 graphics chip (inference).
- The Jaguar's Tom chip holds a programmable 32-bit processor and an object processor that builds each line from a list,
  and the PC-FX has no polygon hardware and decodes compressed video frames instead
  ([Wikipedia, "Atari Jaguar"](https://en.wikipedia.org/wiki/Atari_Jaguar) and
  ["PC-FX"](https://en.wikipedia.org/wiki/PC-FX); tertiary).

### Audio

- The era's sound hardware comes in kinds that an emulator models differently
  (inference from the findings below):
  sample players with decoders (PlayStation 1, Saturn, DS), the first two with their own sound RAM, envelopes,
  and effects; programmable processors whose software makes the sound
  (Nintendo 64, Jaguar, 3DO); and the Game Boy Advance's mix of the Game Boy's channels with sample FIFOs.

#### PlayStation 1

- Maker's patent: Sony's application describes a "sound processing unit
  or so-called SPU" with its own 512 KiB sound buffer, fed by the CPU and by the disc decoder
  ([EP1280150A2](https://patents.google.com/patent/EP1280150A2/en), description).
  Its samples are 16-byte blocks holding 28 four-bit ADPCM samples and a parameter area with a shift, a filter choice,
  and loop flags, and one of four predictive filters is chosen per block (same).
  It was designed so that one decoder serves Sony's format and CD-ROM XA audio, unlike an older 9-byte,
  16-sample block (same).
- Maker's patent: each of 24 voices has its own pitch, a choice of sample or noise, an ADSR envelope, and two volumes;
  the mixer adds a separately controlled 16-bit input from the disc,
  and a reverberation unit mixes in delayed copies of the sum (EP1280150A2).
- The CD-I ADPCM levels, which CD-ROM XA players also decode, run at 37.8 kHz and 18.9 kHz
  ([Philips US 5,483,619](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5483619),
  description of FIG. 2, read as the patent office scan),
  and Walker describes a mode bit that turns ADPCM playback on and a filter command
  that plays only the sectors of one file and channel
  ([Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf), CD-ROM chapter).
  Disc timing therefore reaches the audio mix (inference).
- No clean source was found for the reverb algorithm, the interpolation between samples, the envelope rate tables,
  or when the sound-RAM interrupt fires
  (searches of the patent family, [Doomed's `spu.txt`](https://hitmen.c02.at/files/docs/psx/spu.txt), Walker,
  and [ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  whose sound tests have a result log only for `spu/memory-transfer`).

#### Saturn

- The SCSP (Yamaha YMF292) has 32 slots, each playing 8- or 16-bit PCM, normally from sound RAM, or acting as FM,
  a built-in DSP with ring-buffer registers, and three timers
  ([Yabause wiki, "SCSP"](https://wiki.yabause.org/index.php5?title=SCSP); part number from
  [Sega Retro, "Sega Saturn/Technical specifications"](https://segaretro.org/Sega_Saturn/Technical_specifications),
  which cites Sega's manuals for it).
- It runs at 22.58 MHz with its 68EC000 at 11.29 MHz, 512 and 256 times 44.1 kHz
  (Sega Retro, "Sega Saturn/Technical specifications", citing Sega's manuals; calculated),
  and MacDonald says it does not follow the PLL setting that changes the CPUs' clock
  ([MacDonald, "NTSC Saturn timing"](http://www.dreamjam.co.uk/emuviews/docindex.php); lead).
  Sound therefore needs its own time base in the scheduler (inference).

#### Nintendo 64

- The Nintendo 64 has no synthesis hardware:
  its audio interface only fetches 16-bit stereo samples from RAM by DMA at a programmed rate
  and sends them to the converter; decoding and mixing are done by the CPU or by microcode on the signal processor
  ([N64brew, "Audio Interface"](https://n64brew.dev/wiki/Audio_Interface);
  [US 6,331,856](https://patents.google.com/patent/US6331856B1/en),
  which describes audio command lists built on the CPU and run by synthesis microcode).
  Audio here is as much signal-processor emulation as graphics is (inference).
- The rate is the video clock divided by one more than a register value,
  and the audio interrupt fires when a transfer starts, not when it ends;
  the interface holds no sample memory of its own, so DMA progresses as samples reach the converter
  (N64brew, "Audio Interface").
- The audio interface has a hardware fault:
  a transfer whose last sample ends exactly on an 8 KiB boundary advances the next buffer's address by `0x2000`
  (N64brew, "Audio Interface").

#### Game Boy Advance and DS

- The Game Boy Advance keeps four channels mostly compatible with the Game Boy Color's
  and adds two "direct sound" channels that play signed 8-bit samples from FIFOs, refilled by DMA when half empty,
  at a rate a timer sets
  ([GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md), "GBA
  Sound Controller" and "GBA Sound Channel A and B - DMA Sound";
  [The Audio Advance, "Direct Sound"](https://belogic.com/gba/directsound.shtml)).
  The output is a PWM stream whose rate and depth a register selects, 9-bit at 32.768 kHz by default
  (GBATEK, `SOUNDBIAS`).
- The DS has 16 channels under the ARM7, each playing 8- or 16-bit PCM or IMA-ADPCM,
  six with square waves and two with noise; each channel's rate is a timer at half the bus clock
  ([GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  "DS Sound Hardware" and "DS Sound Channels 0..15").
  GBATEK documents rounding and clipping in the DS's ADPCM decoder that differ from the formula as written,
  and channels start one, three, or eleven samples late by kind (GBATEK, "IMA-ADPCM Format" and "DS Sound Notes").

#### Others

- The 3DO's sound is a custom DSP in its CLIO chip
  ([Wikipedia, "3DO"](https://en.wikipedia.org/wiki/3DO_Interactive_Multiplayer); tertiary);
  the 3DO Company's patent describes a processor that restarts its program every programmed number of clock ticks,
  which its example sets to one CD audio sample (568 ticks)
  ([WO 94/16383](https://patents.google.com/patent/WO1994016383A1/en), description;
  [3DO Development Repo wiki, `opera/dsp`](https://3dodev.com/documentation/hardware/opera/dsp)).
- The Jaguar's "Jerry" chip holds a 32-bit DSP for sound, with the number of channels limited by software
  ([Wikipedia, "Atari Jaguar"](https://en.wikipedia.org/wiki/Atari_Jaguar); tertiary).

### Timing, synchronisation, and input

#### Clocks and frames

- In three of the five worked examples, processors share memory or a bus on different clocks
  (inference from the findings above):
  the DS's ARM9 at twice its bus clock beside an ARM7, the Nintendo 64's CPU at 1.5 times the signal processor's clock,
  and the Saturn's two SH-2s beside a 68EC000 on the sound side's own clock.
- The PlayStation 1's CPU shares the bus with sound and video chips that have their own memories,
  whose clocks no clean source found gives
  (searches of [Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf) and
  [Doomed](https://hitmen.c02.at/files/docs/psx/system.txt)); the Game Boy Advance runs one CPU at a time.
  A scheduler for the era interleaves several processors, not one CPU and its peripherals (inference).
- The Game Boy Advance's system clock is 16.78 MHz
  (exactly 2^24 Hz);
  a line is 308 dots of four cycles and a frame 228 lines, about 59.737 Hz
  ([GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md),
  "System Clock", "Horizontal Dimensions", and "Vertical Dimensions").
  In Game Boy Advance mode a DS runs at half its 33.51 MHz bus clock, about 16.76 MHz,
  slightly slower than a Game Boy Advance, which GBATEK marks "probably"
  ([GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  "DS Backwards-compatible GBA-Mode").
- The DS bus clock is 33.513982 MHz; the dot clock is a sixth of it, and a frame of 263 lines runs at 59.8261 Hz
  (GBATEK, "DS Display Dimensions / Timings").
- The Nintendo 64's CPU runs at 93.75 MHz, 1.5 times the 62.5 MHz master clock,
  a quarter of the 250 MHz RDRAM clock from which all but video and audio derive,
  and the signal processor runs at 62.5 MHz;
  the video clock comes from a crystal at four times the colour subcarrier and differs by region
  ([N64brew, "Clock Timing"](https://n64brew.dev/wiki/Clock_Timing) and
  ["Reality Signal Processor"](https://n64brew.dev/wiki/Reality_Signal_Processor)).
  Video timing is programmed by software through the video interface's registers, not fixed
  ([N64brew, "Video Interface"](https://n64brew.dev/wiki/Video_Interface)),
  and the audio rate follows the video clock (see "Audio").
- Maker's patent: Sony's patent (priority 1993) describes a game system, not named,
  whose CPU works partly from its instruction cache and coordinate calculator so
  that it can release the system bus to a controller moving drawing commands and image data
  ([US 5,850,540](https://patents.google.com/patent/US5850540A/en), description).
- Hardware test (by inference from the suite):
  the ps1-tests suite's `timers` test resets a timer as soon as a vertical blank interrupt arrives
  and reads it at the next
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  `timers/main.c`).
  With timer 2 at the system clock divided by eight, its NTSC log gives 71,407 to 71,412 after two warm-up runs,
  so a frame is 571,256 to 571,296 system clock cycles (calculated from `timers/psx.log`).
  The same log's timer 1, clocked by horizontal blank, counts 263 a frame,
  which gives about 2,172 system clock cycles a line (calculated).
  At Walker's 33.8688 MHz that is about 59.29 Hz (calculated).
- The same log's frame values with the timer at the full system clock
  (about 112,500)
  are below one frame, because the 16-bit counter wraps several times in a frame and the test adds one wrap
  (inference from the source).
  The dot clocks the log prints are labels with no stated origin, and no clean source was found for them
  (searches of Walker, Doomed, [AmiDog's PSX wiki](https://psx.amidog.se/doku.php?id=psx:cpu:division),
  whose page on the counters does not exist, and ps1-tests).

#### Interrupts and inter-processor signalling

- Each DS CPU has its own interrupt registers,
  and the two signal each other through a small register with an interrupt request and through two 16-word FIFOs
  ([GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  "DS Interrupts" and "DS Inter Process Communication (IPC)").
  The ARM9's divider and square-root unit take a fixed number of 33.51 MHz cycles and report a busy flag,
  which GBATEK tells an interrupt handler using the unit to wait on before it returns
  (GBATEK, "DS Maths" and "IRQ Notes").
- Older documents: the PlayStation 1 has four root counters
  ([Doomed, `system.txt`](https://hitmen.c02.at/files/docs/psx/system.txt);
  [Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf), "Root Counters").
- Hardware test (by inference from the suite): a log covers three, in which timer 1, clocked by horizontal blank,
  counts 263 per frame on an NTSC system, and timer 2 can run at the system clock divided by eight
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  `timers/psx.log`).
  Another log shows a sound-RAM DMA read that times out with the channel's enable bit cleared,
  at priority 5 and at priority 0, and completes with it set (`dma/dpcr/psx.log`; observed).
- The interrupt controller's layout, the priority order between DMA channels,
  the line on which vertical blank interrupts, and the disc and sound interrupts have no clean source beyond Walker,
  Doomed, and the ps1-tests DMA tests under "DMA", which run one channel at a time (same searches).

#### Input and peripherals

- Nintendo 64 controllers and cartridge EEPROMs use the Joybus protocol run by the console's PIF microcontroller:
  the CPU writes a command frame into 64 bytes of PIF RAM and a DMA read makes the PIF run the whole exchange
  ([N64brew, "Serial Interface"](https://n64brew.dev/wiki/Serial_Interface),
  ["Joybus Protocol"](https://n64brew.dev/wiki/Joybus_Protocol), and "PIF-NUS", closed and not linked).
- The Saturn's system manager is a 4-bit Hitachi microcontroller with its own program ROM that switches the second SH-2,
  the 68000, and the disc block on and off, keeps time, changes the system clock, and polls the controllers
  ([Yabause wiki, "SMPC"](https://wiki.yabause.org/index.php5?title=SMPC);
  [MacDonald](http://www.dreamjam.co.uk/emuviews/docindex.php), lead).
- Older document: PlayStation 1 controllers and memory cards share one serial bus with a select line per port,
  a 250 kHz clock, and an acknowledge pulse from the device after each byte but the last (Walker, "Controllers").
  Walker gives the link cable's speed and wiring ("Serial I/O"); its register-level behaviour has no clean source found
  (searches of Walker, Doomed, and the ps1-tests README and file tree).

### Media, protection, and firmware

The law on firmware, keys, and lock-outs is in [`R0-02`](R0-02-legal-baseline.md)
(["Firmware, keys, and game copies"](R0-02-legal-baseline.md#firmware-keys-and-game-copies) and
["Anti-circumvention law in the United States"](R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states));
this section records what the hardware does.

#### Kinds of firmware

- The firmware an emulator of this era meets falls into four kinds
  (inference from the findings below):
  a BIOS for the main CPU (PlayStation 1, Saturn, Game Boy Advance, DS);
  firmware for a drive controller on its own processor
  (the PlayStation 1's disc controller, the Saturn's SH-1);
  firmware for a lock-out microcontroller
  (the Nintendo 64's PIF and the cartridge's CIC);
  and boot ROMs that verify the next stage
  (DSi; DSiBrew, "Stage1", at `https://dsibrew.org/wiki/Stage1`,
  given with no link because the page may list key material: the first passes' evidence does not say whether it does,
  and the page has no section headings by which that could be checked without opening it).

#### PlayStation 1

- Older document: the CPU reaches the disc controller through four byte-wide ports,
  and the controller runs commands asynchronously, some answering at once and delivering their real result by a second,
  queued interrupt ([Doomed, `cdinfo.txt`](https://hitmen.c02.at/files/docs/psx/cdinfo.txt);
  repeated in [Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf), "The CD-ROM").
  Its modes select double speed, XA audio streaming, sector size, and a file and channel filter (same).
  Doomed says much is missing and the rest may be partly wrong (`cdinfo.txt`, opening).
  Its command names are those of Sony's library, so it may draw on that library's documentation (inference).
- Hardware test (by inference from the suite):
  the ps1-tests suite's `cdrom/timing` test measures in steps of eight CPU clock cycles
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  `common/measure.hpp`).
  Its log gives acknowledgements of 24,024 to 137,104 CPU clock cycles for `CdlNop`, averaging 45,993 over 100 runs,
  with similar spreads for `Mute`, `Demute`, `Setloc`, and `Setmode` (calculated from `cdrom/timing/psx.log`).
- The same log gives a mean of about 446,100 CPU clock cycles between sectors at single speed
  and 222,300 at double speed, a ratio of about 2.007,
  which at 33.8688 MHz is about 75.9 sectors a second at single speed (calculated).
  Command timing varies widely between runs, so a fixed delay will not match it (inference).
- Older document: the BIOS is 512 KiB at `0xBFC00000`, the reset vector,
  and its services are reached by jumping to one of three call tables with a function number in a register
  (Walker, "The PSX Memory Map", "Exception Handling", and appendix B;
  [Doomed, `system.txt`](https://hitmen.c02.at/files/docs/psx/system.txt)).
  An emulator that runs games without the BIOS must provide these services itself (inference).
- The BIOS boot sequence is not recorded: it is known only from the firmware,
  and the [research guide's "Constants and tables"](../README.md#constants-and-tables) records no value known only from
  firmware; [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) closes firmware itself.
  What an emulator needs is what a game can observe after boot, which a hardware test gives (inference).
- Maker's patent: Sony's patent describes a security code stored
  as a radial wobble of the pits in the table-of-contents area, a 22.05 kHz carrier keyed on and off,
  read from the pick-up's RF signal through a band-pass filter, and checked before a second check of licence data
  ([US 6,304,971](https://patents.google.com/patent/US6304971B1/en), detailed description, FIG. 1 to FIG. 5).
  An ordinary drive reads the data but not the wobble
  ([Wikipedia, "PlayStation (console)"](https://en.wikipedia.org/wiki/PlayStation_(console)), "Copy protection system";
  tertiary), so a disc image does not hold it and an emulator accepts the image in its place (inference).
- No clean source was found for the executable format, the disc controller's own processor,
  or the subchannel protection that some PAL discs use (from memory)
  (searches of Walker, Doomed, [AmiDog's PSX wiki](https://psx.amidog.se/doku.php?id=psx:cpu:division) index,
  [Mednafen's prose](https://mednafen.github.io/documentation/psx.html), and Wikipedia;
  the [Redump](http://redump.org/) wiki returned HTTP 404 to every request on 2026-11-20, research log).
  Wikipedia's
  ["List of CD and DVD copy protection schemes"](https://en.wikipedia.org/wiki/List_of_CD_and_DVD_copy_protection_schemes)
  says only that "Some titles also use the Libcrypt mechanism to validate the disc", without describing it (tertiary).

#### Saturn

- The Saturn's double-speed drive is run by its own SH-1
  ([Wikipedia, "Sega Saturn"](https://en.wikipedia.org/wiki/Sega_Saturn)),
  and the disc block holds up to 202 raw sectors, 200 of them reachable from the CPUs, filters sectors into buffers,
  and can feed an add-on board such as the MPEG card
  ([Yabause wiki, "CDBlock"](https://wiki.yabause.org/index.php5?title=CDBlock)).
- Only the first 16 sectors of a Saturn game disc can be read until the disc block and the BIOS approve it;
  audio discs and other formats are unlocked at once (Yabause wiki, "CDBlock", "Authenticating and unlocking CD").
- Sega's patents, which do not name the Saturn,
  describe checking a pit-formed mark beside the read-in area against reference data
  ([EP 0 682 341](https://patents.google.com/patent/EP0682341B1/en), main embodiment)
  and, with 1992 priority, a boot sector holding a disc identifier and a security code
  ([US 5,371,792](https://patents.google.com/patent/US5371792A/en)).
  A standard disc image, which holds only the data sectors, does not hold the mark (inference).

#### Nintendo 64

- The PIF on the board is a Sharp SM5 microcontroller with its own firmware;
  it holds the first two boot stages for the CPU in a 1984-byte ROM, which the CPU reads one serial transfer at a time,
  so the first stage copies the second into the signal processor's memory to run it
  (N64brew, "PIF-NUS", "Internal ROMs and RAM" and "Console startup"; closed and not linked, as below).
  The PIF locks its ROM before the game runs.
- Each cartridge holds a CIC, which sends the PIF a region identifier and a checksum of the boot code in the cartridge;
  a cartridge boots only with the boot code its CIC expects (N64brew, "PIF-NUS", "Console startup").
  After boot the game must talk to the PIF within about five seconds,
  and the PIF and CIC keep exchanging data while powered, so removing the cartridge halts the CPU (same page).
- An emulator that boots a game without the PIF's firmware must reproduce what the boot leaves behind (inference).
  N64brew describes a challenge that cartridges with the CIC-NUS-6105 answer, 15 bytes each way through PIF RAM
  (N64brew, "PIF-NUS", command `0x02`).
  Its response algorithm is not recorded: it would come from firmware analysis, and N64brew's "CIC-NUS" page,
  which shows key and seed material, was not read past it.
  A boot of these games without the PIF needs that response,
  which [`R1-16`](../../roadmap/research.md#system-family-surveys) takes up (inference).
- Three N64brew pages are closed in the [register](../../../.claude/hooks/source-register.txt)
  and given here with no link: "CIC-NUS" (`https://n64brew.dev/wiki/CIC-NUS`), which shows CIC key and seed material;
  "PIF-NUS" (`https://n64brew.dev/wiki/PIF-NUS`), whose table of CICs shows a seed and a checksum value for each,
  found by the verification pass after the facts above were taken from its prose;
  and "Initial Program Load" (`https://n64brew.dev/wiki/Initial_Program_Load`),
  an annotated disassembly of the PIF boot ROM.
  Nothing from either table is used.
  Their `index.php?title=` addresses, which the source guard cannot match, are not to be opened either.

#### Game Boy Advance and DS

- The Game Boy Advance cartridge header carries a compressed Nintendo logo that the BIOS compares with its own copy,
  locking up on a mismatch, a fixed byte, and a checksum
  ([GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md),
  "GBA Cartridge Header").
  The bytes of the logo are not recorded; [`R0-02`](R0-02-legal-baseline.md) covers the logo
  (["Firmware, keys, and game copies"](R0-02-legal-baseline.md#firmware-keys-and-game-copies)).
- The DS has a 4 KiB BIOS for the ARM9, a 16 KiB BIOS for the ARM7,
  and firmware in a serial flash of 256 KiB on the Nintendo DS that holds settings, Wi-Fi calibration,
  and boot code and data ([GBATEK](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  "DS Firmware Serial Flash Memory" and "DS Firmware Header"; [melonDS FAQ](https://melonds.kuribo64.net/faq.php)).
  Only the ARM7 BIOS can read its own protected region (GBATEK, "DS Memory Control - BIOS").
- DS cartridges are read with 8-byte commands in three phases, the second and third encrypted,
  and an 8-byte identifier at the start of the secure area is checked after decryption
  (GBATEK, "DS Cartridge Protocol" and "DS Cartridge Secure Area").
  The encryption needs data held in the BIOS
  (GBATEK, "DS Memory Control - BIOS"),
  so a dump that is not decrypted cannot be run without it (inference);
  [`R0-02`](R0-02-legal-baseline.md) records why keys and their handling matter.
- The 3DS's mode register selects 3DS, DS or DSi, or Game Boy Advance mode;
  in Game Boy Advance mode the cartridge is served from the 3DS's RAM and registers emulate the save chip and clock
  (GBATEK, 3DS part, `ARM7_CNT`, "3DS Config - ARM7 Registers", and `FCRAM_MODE`).

#### Others

- The PlayStation 2's input-output processor is the PlayStation 1's CPU,
  with the geometry engine and video decoder kept for compatibility;
  from model SCPH-7500x it was replaced by a PowerPC-based part
  ([Wikipedia, "PlayStation 2 technical specifications"](https://en.wikipedia.org/wiki/PlayStation_2_technical_specifications);
  tertiary).
  Two PlayStation 2 hardware generations therefore run PlayStation 1 games by different means (inference).

### Tests and their oracles

- The Nintendo 64 has open tests run on a console: krom's tests "on a real N64 using a 64drive Cartridge",
  under the Unlicense ([`R0-05`, "Test suites and test vectors"](R0-05-source-map.md#test-suites-and-test-vectors);
  [PeterLemon/N64 README](https://github.com/PeterLemon/N64)). n64-systemtest covers coprocessor registers, exceptions,
  and the TLB and is deprecated in favour of [nemu64-test](https://github.com/thelemmy/nemu64-test);
  neither states where its expected values came from
  ([n64-systemtest README](https://github.com/lemmy-64/n64-systemtest); [`R0-05`](R0-05-source-map.md)).
- The DS has [polyrastertest](https://github.com/Jaklyy/PolyRasterTest), recorded on a 3DS
  (see "Video"),
  and the Game Boy Advance has open suites that state no source for their expected results
  ([`R0-05`, "Test suites and test vectors"](R0-05-source-map.md#test-suites-and-test-vectors)).
- The PlayStation 1 has the ps1-tests suite, whose result logs and frame-buffer images answer several questions above;
  their origin is not stated, though one log, `timer-dump/psx.log`,
  opens by saying the test needs a modified console motherboard, which supports reading the logs
  as console results (inference)
  ([ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb); observed).
- The ARM7TDMI vectors are generated by an emulator and record cycle numbers that the README calls experimental,
  not yet correct counts ([SingleStepTests arm7tdmi README](https://github.com/SingleStepTests/arm7tdmi));
  no vectors were found for the ARM946E-S, the SH-2, or the V810
  ([register](../../../.claude/hooks/source-register.txt) and [`R0-05`](R0-05-source-map.md)).
- For most of this era the oracle is a console the project would run tests on, or another emulator (inference).

## Options and trade-offs

The options answer separate questions and can be combined.
The last subsection recommends one answer to each.

### Low-level or high-level emulation of microcode and DSPs

- **What:** run the Nintendo 64's signal processor instruction by instruction,
  or recognise the programs games load and replace them with host code;
  the Saturn's control-unit DSP and the sound DSPs pose the same choice (inference).
- **Costs:** low-level costs host time and needs the processor documented; high-level needs each program recognised,
  and games with their own microcode break it (inference; see "Nintendo 64" under "Video").
- **Gains:** low-level runs any program as the hardware does; high-level is fast (inference).
- **Used by:** paraLLEl-RDP emulates the display processor at the low level, beside a low-level signal processor
  ([paraLLEl-RDP README](https://raw.githubusercontent.com/Themaister/parallel-rdp/1cecd042/README.md));
  no emulator's choice for the signal processor itself was read.

### Interpreter, cached interpreter, or recompiler

- **What:** how the main CPUs run: one instruction at a time, from decoded blocks, or translated to host code.
- **Costs:** a recompiler may lose timing detail that some tests need
  ([n64-systemtest](https://github.com/lemmy-64/n64-systemtest), `Cargo.toml`:
  "most likely this wouldn't be implementable by a dynamic recompiler");
  an interpreter may be too slow for the Saturn's two CPUs on a phone (inference).
- **Gains:** a recompiler reaches full speed on weak hosts (inference).
- **Used by:** no emulator's choice was read for this note;
  [`R2-01`](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  and [`R3-01`](../../roadmap/research.md#phase-3-host-platforms) take the question up.

### Cache emulation

- **What:** model the SH-2, DS ARM9, and Nintendo 64 caches; model data caches only; or ignore caches.
- **Costs:** on the Saturn, full models cost host time,
  and partial ones break games with coherency bugs the hardware hides
  ([Mednafen documentation, `ss.html`](https://mednafen.github.io/documentation/ss.html), "Cache Mode").
- **Gains:** fixes for "various logic and timing issues" in those games (same).
- **Used by:** Mednafen's Saturn module chooses per game from a list (same).

### Accurate or enhanced 3D

- **What:** reproduce the hardware's fixed-point results, edge rules, and dithering,
  or render on the host GPU with higher resolution and precision.
- **Costs:** accurate rendering on a host GPU needs compute shaders or software;
  enhancement changes what games show and breaks effects that depend on exact pixels (inference).
- **Gains:** fidelity to the hardware, or a sharper image.
- **Used by:** paraLLEl-RDP aims at bit-exactness with an emulator's renderer
  where possible ([README](https://raw.githubusercontent.com/Themaister/parallel-rdp/1cecd042/README.md));
  a melonDS developer says its OpenGL renderer cannot be fully faithful
  ([melonDS blog, "Introducing the compute renderer"](https://melonds.kuribo64.net/comments.php?id=143); lead).

### How PlayStation 1 facts are sourced

- **What:** the routes of [`R0-05` option 8](R0-05-source-map.md#8-how-the-playstation-1-primer-gets-its-facts)
  (see "Scope").
- **Costs:** the older documents rest on experiment, "hearsay"
  ([Walker](https://hitmen.c02.at/files/docs/psx/psx.pdf), "Introduction"),
  and emulators; patents give design, not exact behaviour (inference); tests need hardware;
  emulator code may rest on the tainted reference ([`R0-05`](R0-05-source-map.md#playstation-family)).
- **Gains:** each route names its source; a test's origin is the measurement
  ([`R0-05`, option 8](R0-05-source-map.md#8-how-the-playstation-1-primer-gets-its-facts)).
- **Used by:** this note uses the first three, including the published results of
  [ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb), with Wikipedia as
  a tertiary source and emulator documentation; the gaps in "Open questions" are where none of them reached.

### Firmware: required, replaced, or emulated at a high level

- **What:** ask the user for a BIOS, ship an independently written replacement, or provide the services in the emulator;
  for the Nintendo 64, reproduce what the PIF's boot leaves behind.
- **Costs:** [`R0-02`'s options 4](R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps)
  [and 5](R0-02-legal-baseline.md#5-replace-the-firmware) record the legal side; replacements are closed-tier material
  under [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) when they are another project's, and high-level
  services differ in what games can observe (inference).
- **Gains:** the second and third need no maker code at all; the first needs the user to supply it.
- **Used by:** Mednafen asks for BIOS images for the PlayStation 1, Saturn,
  and PC-FX and emulates the Game Boy Advance BIOS at a high level by default; Ymir requires the Saturn BIOS
  (Mednafen documentation, [`psx.html`](https://mednafen.github.io/documentation/psx.html),
  [`ss.html`](https://mednafen.github.io/documentation/ss.html),
  and [`pcfx.html`](https://mednafen.github.io/documentation/pcfx.html), "Firmware/BIOS",
  and [`gba.html`](https://mednafen.github.io/documentation/gba.html), "BIOS";
  [Ymir README](https://github.com/ymir-emu/ymir/tree/0fdabbdd41f17fd7fda58195130c3b43f7fd00e5)).

### Recommendation

The options answer six separate questions, so this subsection gives one recommendation for each,
in at most three sentences with its reasons.
The owner decides each of these; the pull request lists them.

- **Microcode and DSPs:** run the Nintendo 64's signal processor and display processor at the low level as the baseline,
  with replacement of recognised microcode only as a later, optional speed path.
  Games with their own microcode break high-level emulation,
  and [paraLLEl-RDP](https://raw.githubusercontent.com/Themaister/parallel-rdp/1cecd042/README.md) runs the display
  processor at the low level on a host GPU.
  The project's [README](../../../README.md) names accuracy first among its aims.
- **CPU execution:** start each core with an interpreter, kept as the reference,
  and add a cached interpreter or recompiler only where a measured host needs one,
  as [`R2-01`](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  and [`R3-01`](../../roadmap/research.md#phase-3-host-platforms) decide.
  [n64-systemtest](https://github.com/lemmy-64/n64-systemtest)'s authors doubt that a dynamic recompiler can pass its
  cycle-accurate tests.
- **Caches:** model the Saturn SH-2 caches fully by default,
  and the DS ARM9's caches and the Nintendo 64's cached-access rules,
  with a cheaper per-game mode only if profiling shows the need.
  On the Saturn caches decide correctness,
  and [Mednafen](https://mednafen.github.io/documentation/ss.html) turns full cache emulation on per game, from a list,
  mainly because doing so for every game costs much more host time.
- **3D:** reproduce the hardware's results by default
  (fixed point, edge rules, dither), with enhancement as an opt-in mode later.
  Enhancement changes what games show and breaks effects that depend on exact pixels,
  and the PlayStation 1's edge rule and dither pattern can now be checked against
  [ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb)' images.
- **PlayStation 1 sources:** take hardware tests as the oracle for the gaps,
  starting with ps1-tests' published results
  and then [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes)'s console measurements,
  keep the older documents and Sony's patents as the description, and read no open-tier emulator code for the console.
  A test's origin is the measurement, and ps1-tests' logs and images answered, at least in part, six gaps in this note.
  Emulator code may rest on the tainted reference, as Rustation's README says of its own
  ([`R0-05`, "PlayStation family"](R0-05-source-map.md#playstation-family)).
- **Firmware:** support firmware the user dumps as the accurate path
  ([`R0-02` option 4](R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps)),
  with Rustalgia's own high-level services where clean sources describe them,
  as [Mednafen](https://mednafen.github.io/documentation/gba.html) does for the Game Boy Advance,
  and never ship another project's replacement.
  Such a replacement is closed under [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md),
  and [`R2-12`](../../roadmap/research.md#phase-2-cross-cutting-engineering) settles the technique.

## Implications for Rustalgia

- A scheduler for these systems interleaves several processors, mostly at different clocks,
  two identical SH-2s on the Saturn and two different ARM cores on the DS (inference).
  This feeds [`R2-03`](../../roadmap/research.md#phase-2-cross-cutting-engineering) and an ADR on the core's time base.
- The Nintendo 64's geometry and audio stages are programs on its signal processor,
  so the choice between low-level and high-level emulation of that processor shapes the whole core (inference).
  This feeds [`R1-16`](../../roadmap/research.md#system-family-surveys),
  [`R2-01`](../../roadmap/research.md#phase-2-cross-cutting-engineering),
  [`R2-04`](../../roadmap/research.md#phase-2-cross-cutting-engineering),
  [`R2-05`](../../roadmap/research.md#phase-2-cross-cutting-engineering),
  and [`R2-06`](../../roadmap/research.md#phase-2-cross-cutting-engineering).
- Caches decide correctness on the Saturn
  ([Mednafen, `ss.html`](https://mednafen.github.io/documentation/ss.html)) and timing on the DS (inference).
  Whether to model them feeds [`R1-12`](../../roadmap/research.md#system-family-surveys),
  [`R1-16`](../../roadmap/research.md#system-family-surveys),
  [`R1-22`](../../roadmap/research.md#system-family-surveys),
  and the quality targets ([`R6-02`](../../roadmap/research.md#phase-6-synthesis)).
- The PlayStation 1's published test results give [`R1-18`](../../roadmap/research.md#system-family-surveys) an oracle
  for the GPU's dither, fill rule, and drawing time, frame length, disc timing, and the geometry engine;
  the rest of the gaps listed under "Open questions" need tests on a console (inference),
  which [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes) is the roadmap item to run.
- Emulators choose Nintendo 64 save types and Saturn cartridges from game databases
  ([N64brew, "ROM Header"](https://n64brew.dev/wiki/ROM_Header); Mednafen, `ss.html`, "Cart"),
  and use identifier strings or heuristics on the Game Boy Advance and DS.
  The database's origin and licence feed [`R0-03`](../../roadmap/research.md#phase-0-ground-rules)
  and [`R2-11`](../../roadmap/research.md#phase-2-cross-cutting-engineering).
- Firmware differs in kind across the era; the routes are [`R0-02`](R0-02-legal-baseline.md)'s options 4 to 6,
  and the technique is [`R2-12`](../../roadmap/research.md#phase-2-cross-cutting-engineering).
- The 3DS and PlayStation 2 contain parts of the DS and PlayStation 1 hardware
  (the PlayStation 1's CPU on early PlayStation 2 models, not its graphics chip),
  so cores written for this era may be reused in part by [`R1-13`](../../roadmap/research.md#system-family-surveys)
  and [`R1-19`](../../roadmap/research.md#system-family-surveys) (inference).
- [Wikipedia, "Atari Jaguar"](https://en.wikipedia.org/wiki/Atari_Jaguar),
  says Hasbro released the Jaguar's patents and rights into the public domain in 1999 (tertiary).
  Whether that opens Atari's own documents falls to the proposed amendment of
  [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) and to
  [`R0-05`'s option 5](R0-05-source-map.md#5-maker-documents-that-survive-only-as-third-party-copies); the reworked
  `R0-05`, in its own pull request, recommends a row that treats maker documents surviving only on third-party hosts as
  closed unless the maker's release is shown.

## Open questions

- Does the PlayStation 1 CPU implement a TLB?
  A hardware test that writes a TLB entry, reads it back, and maps a user-segment address,
  in [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes).
- What are the PlayStation 1 GPU's limits on polygon size,
  the cost of a small polygon as against the whole-screen averages under "Video",
  and does its dither follow screen or frame-buffer position?
  Hardware tests in [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes), drawing across the limits,
  at several sizes, and with a drawing offset.
- How are the PlayStation 1's interrupt controller and the priority between DMA channels laid out,
  on which line does vertical blank interrupt, and when do the disc and sound interrupts fire?
  Hardware tests in [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes) that run two channels at once.
- What are the PlayStation 1 sound chip's reverb, interpolation, and envelope rates?
  Hardware tests that record the sound chip's output, in [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes).
- What are the PlayStation 1 memory card's command protocol and the link cable's register-level behaviour?
  Sony's patent describes the card's lines but no commands
  (see "Save media");
  a test that logs the exchange on the controller port, and one with two consoles,
  in [`R5-12`](../../roadmap/research.md#phase-5-hands-on-spikes);
  [`R2-09`](../../roadmap/research.md#phase-2-cross-cutting-engineering) decides whether link play is in scope.
- What are the PlayStation 1 executable format, the disc controller's own processor,
  and the subchannel protection on some PAL discs?
  [`R2-11`](../../roadmap/research.md#phase-2-cross-cutting-engineering) for the formats and the protection,
  [`R1-18`](../../roadmap/research.md#system-family-surveys) for the processor, whose firmware is closed.
- What is the priority between the DSi's old and new DMA channels?
  GBATEK marks it unknown, and DSiBrew gives an arbitration bit for the new channels
  (fixed or round robin)
  but not their priority against the old ones; a hardware test on a DSi
  ([`R1-12`](../../roadmap/research.md#system-family-surveys)).

## Sources

Every source below was read on 2026-11-20.
For repositories, the commit given is the one read, where it was shown.
Google Patents refuses automated requests, so its links are listed in the link checker's configuration.

Makers' manuals, releases, and patents:

- Arm, Technical Reference Manuals [DDI 0029G](https://documentation-service.arm.com/static/5e8e1323fd977155116a3129)
  (ARM7TDMI, 2001),
  [DDI 0201D](https://documentation-service.arm.com/static/5e8e3ee588295d1e18d3aa82)
  (ARM946E-S, 2007),
  and [DDI 0165B](https://documentation-service.arm.com/static/5e8e2f18fd977155116a77fb) (ARM9E-S, 2000).
- Renesas, [SH-1/SH-2/SH-DSP Software Manual](https://www.renesas.com/en/document/mas/sh-1sh-2sh-dsp-software-manual),
  revision 5.00 (2004).
- NEC,
  [news release 97/11/14-01-01](https://web.archive.org/web/20200710173520/http://www.nec.co.jp/press/en/9711/1401-01.html),
  VR4300 series specifications, archived copy of 2020-07-10 17:35:20.
- Sony, [EP0715277A2](https://patents.google.com/patent/EP0715277A2/en),
  [EP0715276A2](https://patents.google.com/patent/EP0715276A2/en),
  [EP1280150A2](https://patents.google.com/patent/EP1280150A2/en),
  [US 5,793,376](https://patents.google.com/patent/US5793376A/en),
  [US 5,850,540](https://patents.google.com/patent/US5850540A/en),
  [US 6,304,971](https://patents.google.com/patent/US6304971B1/en),
  and [EP0810015A2](https://patents.google.com/patent/EP0810015A2/en)
  (filed by Sony Corporation);
  STD Manufacturing, [US 6,386,979](https://patents.google.com/patent/US6386979B1/en); Nintendo and Silicon Graphics,
  [US 6,331,856](https://patents.google.com/patent/US6331856B1/en).
- Philips, [US 5,483,619](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5483619), patent office copy.
- The 3DO Company, [WO 94/16383](https://patents.google.com/patent/WO1994016383A1/en).
- Sega, [EP 0 682 341](https://patents.google.com/patent/EP0682341B1/en)
  and [US 5,371,792](https://patents.google.com/patent/US5371792A/en).

References and research:

- [GBATEK, mGBA's copy](https://github.com/mgba-emu/gbatek/tree/64b5087aa45cd0187b8b239d77e54ee5eb2917d1),
  commit `64b5087a` (2026-07-29):
  [`gba.md`](https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md), and the DS and
  3DS chapters in `ds.md` and `3ds.md`, cited by section name with no link to the files.
  `ds.md` prints the DS cartridge encryption key bytes, as the first passes found.
  `3ds.md` covers the 3DS's cryptographic hardware (from memory, this claim only), so it was not reopened to check.
- N64brew wiki, revisions current on 2026-11-20: ["VR4300"](https://n64brew.dev/wiki/VR4300) (5928),
  ["Clock Timing"](https://n64brew.dev/wiki/Clock_Timing) (5926), ["Memory map"](https://n64brew.dev/wiki/Memory_map)
  (5763), ["RDRAM"](https://n64brew.dev/wiki/RDRAM) (5529), ["Expansion Pak"](https://n64brew.dev/wiki/Expansion_Pak)
  (5328), ["Reality Signal Processor"](https://n64brew.dev/wiki/Reality_Signal_Processor) (4813) and its
  ["/CPU Core"](https://n64brew.dev/wiki/Reality_Signal_Processor/CPU_Core) (5539),
  ["/CPU Pipeline"](https://n64brew.dev/wiki/Reality_Signal_Processor/CPU_Pipeline) (5618), and
  ["/Interface"](https://n64brew.dev/wiki/Reality_Signal_Processor/Interface) (5376),
  ["Reality Display Processor"](https://n64brew.dev/wiki/Reality_Display_Processor) (5675) and
  ["/Pipeline"](https://n64brew.dev/wiki/Reality_Display_Processor/Pipeline) (5674),
  ["Parallel Interface"](https://n64brew.dev/wiki/Parallel_Interface) (5761),
  ["Serial Interface"](https://n64brew.dev/wiki/Serial_Interface) (5663), "PIF-NUS" (5759; closed, at
  `https://n64brew.dev/wiki/PIF-NUS`, with no link because its CIC table shows seed values),
  ["Joybus Protocol"](https://n64brew.dev/wiki/Joybus_Protocol) (5942), ["Flash"](https://n64brew.dev/wiki/Flash)
  (5773), ["ROM Header"](https://n64brew.dev/wiki/ROM_Header) (5943),
  ["Video Interface"](https://n64brew.dev/wiki/Video_Interface) (5791),
  ["Audio Interface"](https://n64brew.dev/wiki/Audio_Interface) (5924); read through the raw exports.
- J. Walker,
  ["Everything You Have Always Wanted to Know about the Playstation But Were Afraid to Ask"](https://hitmen.c02.at/files/docs/psx/psx.pdf),
  version 1.1 (2000).
- Doomed, [`system.txt`](https://hitmen.c02.at/files/docs/psx/system.txt),
  [`gpu.txt`](https://hitmen.c02.at/files/docs/psx/gpu.txt), [`gte.txt`](https://hitmen.c02.at/files/docs/psx/gte.txt),
  [`spu.txt`](https://hitmen.c02.at/files/docs/psx/spu.txt),
  and [`cdinfo.txt`](https://hitmen.c02.at/files/docs/psx/cdinfo.txt) (1999 to 2000).
- AmiDog's PSX wiki, [`psx:cpu:division`](https://psx.amidog.se/doku.php?id=psx:cpu:division),
  [`psx:gte:opcodes`](https://psx.amidog.se/doku.php?id=psx:gte:opcodes),
  and [`psx:gte:flags`](https://psx.amidog.se/doku.php?id=psx:gte:flags) (last modified 2012-09-18 to 2012-10-23).
- [ps2tek](https://psi-rockin.github.io/ps2tek/), commit `1c916606` (2022-01-27).
- Guy Perfect, [Sacred Tech Scroll](http://perfectkiosk.net/stsvb.html) (Virtual Boy), 2026-05-21.
- C. MacDonald, Sega Saturn hardware notes
  (last updated 2004-04-27)
  and Saturn VDP1 hardware notes (2003), lead,
  through [the author's document index](http://www.dreamjam.co.uk/emuviews/docindex.php),
  because both ask not to be linked directly.
- Yabause wiki, ["SH-2CPU"](https://wiki.yabause.org/index.php5?title=SH-2CPU),
  ["SMPC"](https://wiki.yabause.org/index.php5?title=SMPC),
  ["CDBlock"](https://wiki.yabause.org/index.php5?title=CDBlock),
  ["VDP1"](https://wiki.yabause.org/index.php5?title=VDP1), ["SCSP"](https://wiki.yabause.org/index.php5?title=SCSP),
  ["Backup RAM Cartridge"](https://wiki.yabause.org/index.php5?title=Backup_RAM_Cartridge),
  and ["DRAM Cartridge"](https://wiki.yabause.org/index.php5?title=DRAM_Cartridge)
  (last modified 2008 to 2018), read as rendered pages because the raw export returns the main page (research log).
- Sega Retro, ["VDP1 (Saturn)"](https://segaretro.org/VDP1_(Saturn))
  (revision 1149942, 2026-08-20)
  and ["Sega Saturn/Technical specifications"](https://segaretro.org/Sega_Saturn/Technical_specifications)
  (revision 1113932, 2026-02-12),
  first read in the captures of 2026-04-29 02:37:27 and 2026-10-16 13:07:04 while the live pages served a bot check,
  then checked against the live raw pages.
- 3DO Development Repo wiki, [hardware](https://3dodev.com/documentation/hardware)
  (hub last modified 2026-02-20),
  [matrix engine](https://3dodev.com/documentation/hardware/opera/madam/matrix_engine),
  and [DSP](https://3dodev.com/documentation/hardware/opera/dsp).
  Its memory-configurations page (`https://3dodev.com/documentation/hardware/opera/memory_configurations`) embeds closed
  3DO system code, is closed in the register, and is given with no link; nothing from it is used.
- The Audio Advance, ["Direct Sound"](https://belogic.com/gba/directsound.shtml).
- melonDS blog, lead: ["The DS GPU and its fun quirks"](https://melonds.kuribo64.net/comments.php?id=56) (2018-10-27),
  and ["Introducing the compute renderer"](https://melonds.kuribo64.net/comments.php?id=143) (2021-05-01).
- DSiBrew, ["NDMA"](https://dsibrew.org/wiki/NDMA) (revision 3261, 2010-11-26), and "Stage1"
  (last edited 2024-01-22)
  at `https://dsibrew.org/wiki/Stage1`, with no link because it may list key material; it was read by the first passes,
  whose evidence does not say whether it does, and was not reopened.
- R. Copetti, Saturn article, lead,
  [commit `55b15767`](https://raw.githubusercontent.com/flipacholas/Architecture-of-consoles/55b15767fe439663dff04eceb4a3fbdc68abdd8f/articles/sega-saturn.Rmd.md),
  and [its live page](https://www.copetti.org/writings/consoles/sega-saturn/) for the source list.
- [Redump](http://redump.org/), whose wiki returned HTTP 404 to every request (research log).

Emulator and tool documentation, prose only:

- Mednafen documentation (updated 2024-03-19): [PlayStation](https://mednafen.github.io/documentation/psx.html),
  [Saturn](https://mednafen.github.io/documentation/ss.html),
  [PC-FX](https://mednafen.github.io/documentation/pcfx.html),
  [Virtual Boy](https://mednafen.github.io/documentation/vb.html),
  and [Game Boy Advance](https://mednafen.github.io/documentation/gba.html).
- [paraLLEl-RDP README](https://raw.githubusercontent.com/Themaister/parallel-rdp/1cecd042/README.md),
  commit `1cecd042`.
- [N64Recomp README](https://github.com/N64Recomp/N64Recomp), commit `598ce208`.
- [Ymir README and `docs/dev-notes`](https://github.com/ymir-emu/ymir/tree/0fdabbdd41f17fd7fda58195130c3b43f7fd00e5),
  including `system-info`, commit `0fdabbdd`.
- [melonDS FAQ](https://melonds.kuribo64.net/faq.php).

Tests:

- [SingleStepTests arm7tdmi README](https://github.com/SingleStepTests/arm7tdmi), commit `e3097d88`.
- [ps1-tests](https://github.com/JaCzekanski/ps1-tests/tree/f727802fead11f1daa7549285548392ef87749cb),
  commit `f727802f`: README; the sources `cpu/cop/main.cpp`, `gpu/triangle/main.c`, `gpu/quad/main.c`,
  `gpu/bandwidth/main.cpp`, `timers/main.c`, `dma/chopping/main.cpp`, `cdrom/timing/main.cpp`, and `common/measure.hpp`;
  the result logs of `cpu/access-time`, `cpu/io-access-bitwidth`, `cpu/cop`, `gpu/bandwidth`, `gte/test-all`,
  `gte-fuzz`, `timers`, `timer-dump`, `dma/dpcr`, `dma/chopping`, `dma/otc-test`, `dma/chain-looping`,
  and `cdrom/timing`; and the images `gpu/triangle/vram.png` and `gpu/quad/vram.png`.
- [n64-systemtest README and `Cargo.toml`](https://github.com/lemmy-64/n64-systemtest), commit `196f5421`.
- [PeterLemon/N64 README](https://github.com/PeterLemon/N64), commit `7085543e`.
- [polyrastertest readme](https://github.com/Jaklyy/PolyRasterTest), commit `6fd29def`.
- [nemu64-test](https://github.com/thelemmy/nemu64-test), commit `9a8b9f7d`, repository page only,
  named as n64-systemtest's successor.

Tertiary:

- Wikipedia, revisions current on 2026-11-20, read through the raw exports:
  ["MIPS architecture"](https://en.wikipedia.org/wiki/MIPS_architecture) (1386787582),
  ["Delay slot"](https://en.wikipedia.org/wiki/Delay_slot) (1374222988),
  ["Texture mapping"](https://en.wikipedia.org/wiki/Texture_mapping) (1382835507),
  ["PlayStation technical specifications"](https://en.wikipedia.org/wiki/PlayStation_technical_specifications)
  (1362538225), ["PlayStation (console)"](https://en.wikipedia.org/wiki/PlayStation_(console)) (1386319193),
  ["PlayStation 2 technical specifications"](https://en.wikipedia.org/wiki/PlayStation_2_technical_specifications)
  (1355643867), ["Nintendo 64"](https://en.wikipedia.org/wiki/Nintendo_64) (1386077971),
  ["Sega Saturn"](https://en.wikipedia.org/wiki/Sega_Saturn) (1384300813),
  ["3DO"](https://en.wikipedia.org/wiki/3DO_Interactive_Multiplayer) (1383977414),
  ["Atari Jaguar"](https://en.wikipedia.org/wiki/Atari_Jaguar) (1386053059),
  ["PC-FX"](https://en.wikipedia.org/wiki/PC-FX) (1352943842), and
  ["List of CD and DVD copy protection schemes"](https://en.wikipedia.org/wiki/List_of_CD_and_DVD_copy_protection_schemes)
  (1356035760).
