---
title: "The 32-bit and 64-bit era: primer"
roadmap_item: R1-02
status: draft
date: 2026-11-20
---

# The 32-bit and 64-bit era: primer

## Summary

This note asks how the consoles and handhelds of the 32-bit and 64-bit era work, and what that asks of an emulator.
Every worked example runs several programmable processors at different clocks that share memory,
and on three of them graphics or sound depends on a coprocessor or a DSP,
and on the Nintendo 64 that coprocessor runs programs the game supplies.
Caches become visible to software: on the Saturn they decide whether some games run at all.
Two points matter most to Rustalgia:
the Nintendo 64's choice between low-level and high-level emulation of its signal processor shapes the whole core,
and for the PlayStation 1 no clean source was found for the geometry engine's exact arithmetic,
the GPU's dither and timing, or the sound chip's reverb, so those wait on hardware tests or the owner's choice of route.
This note is not legal advice.

## Scope

- Question: how do the machines of the 32-bit and 64-bit era work, and what does that ask of an emulator?
- Worked examples: the Game Boy Advance, the Nintendo DS and DSi, the Nintendo 64, the PlayStation 1, and the Saturn,
  whose family surveys (`R1-11`, `R1-12`, `R1-16`, `R1-18`, `R1-22`) depend on this item;
  and the DS and PlayStation 1 hardware inside the 3DS and the PlayStation 2,
  because `R1-13` and `R1-19` depend on it too.
  The 3DO, Jaguar, PC-FX, and Virtual Boy appear where they differ in kind.
- Left to other items: every system of the era and its hardware in one row each (`R1-06`); the Dreamcast (`R1-03`);
  the law on firmware, keys, and lock-outs (`R0-02`); techniques in depth (`R2-01` to `R2-15`); the emulators themselves
  (`R1-30` onward).
- Researched on 2026-11-20.
- How claims were checked: research agents fetched every source on 2026-11-20 as raw text
  (wiki pages through their raw export, repository files at a pinned commit where one was shown, PDFs converted to text)
  and copied quotations from that text.
  A second, independent pass fetched the sources again and tested each claim and quotation;
  its corrections were checked against the sources and applied,
  and the claims it could not check are listed in the pull request. "(secondary)" marks a claim that rests on a summary
  or on another party's account, "(from memory)" one that no fetched page confirmed, "(inference)" reasoning,
  and "(lead)" a fact from a hub that `R0-05` labels a lead, which is not relied on without another source.
  Wikipedia is a tertiary source, named wherever a fact rests on it.
  A statement that nothing was found says what was searched, and records a search, not proof of absence.
- PlayStation 1 facts name their route, as `R0-05` option 8 lists them: an older document with a stated origin,
  a maker's patent or datasheet, a hardware test, open-tier emulator documentation, or a tertiary source.
  The tainted reference was not opened, and no fact here is known only from it.
- No emulator source code, firmware, BIOS image, boot code, decompilation, key, game, or leaked material was opened.
  From emulator projects, only README files, documentation, and test-suite prose were read.

## Findings

### What accuracy means here

- The era moves the hard part of emulation from timing alone to timing plus arithmetic.
  Three of the five worked examples have a programmable processor beside the main CPU whose output is graphics or sound:
  the Nintendo 64's signal processor runs graphics and audio "microcode",
  the PlayStation 1's geometry coprocessor does fixed-point transforms, and the Saturn's control unit holds a DSP
  (N64brew, "Reality Signal Processor"; Sony patent EP0715277A2, description of the graphic module; Copetti,
  Saturn article, lead).
- One N64 test suite sorts its tests by the accuracy they need: some need accurate time,
  and its "cycle" tests need a cycle-accurate emulator,
  which its author says "wouldn't be implementable by a dynamic recompiler"
  (n64-systemtest, `Cargo.toml` feature comments, read as prose).
  That marks a line that the era's emulators already have to choose a side of (inference).

### Processors

#### Makers' manuals

- Arm serves the manuals for the ARM7TDMI (DDI 0029G), the ARM946E-S (DDI 0201D), and the ARM9E-S core
  (DDI 0165B),
  each marked non-confidential, each under the notice that no part of the information "may be adapted
  or reproduced in any material form except with the prior written permission of the copyright holder"
  (each manual, page ii).
  What that means for a software model is open, as `R0-05` records ("Processor and chip makers' manuals").
- Renesas serves the SH-1, SH-2, and SH-DSP software manual
  (revision 5.00, 2004)
  under a notice that forbids reproduction without written consent (front matter, notice items 2 and 11).
  It covers the core, pipeline, and instructions; the hardware manual of the Saturn's SH7604, with its cache, divider,
  timers, and DMA controller, was not found on a Renesas host
  (a web search for it found only third-party copies, not opened).
- NEC published the VR4300 series' main figures itself in a 1997 news release, read in an archived copy: 133 MHz,
  a 32-bit bus, an on-chip MMU and floating point, and a 16 KB instruction and 8 KB data cache
  (NEC news release 97/11/14-01-01, capture of 2020-07-10).
  The full user's manual was found only on third-party hosts, which `R0-05` closes.
- No maker-hosted manual was found for the PlayStation 1's CPU core, the NEC V810, the Jaguar's custom processors,
  the 3DO's ARM60, or the 68EC020 (searches of the makers' hosts and the hubs;
  NXP's address for the 68020 manual returned 404).
  For these cores a primer rests on community references, patents, and tests.

#### Pipelines and delay slots

- The families of the era differ in what the programmer sees of the pipeline.
  MIPS I, the PlayStation 1's architecture, has a load delay slot and a branch delay slot;
  SuperH has a delay slot on unconditional branches; ARM has none (Wikipedia, "MIPS architecture" and "Delay slot").
- The ARM7TDMI has three stages, so an instruction that reads the program counter sees it two instructions ahead,
  and it has one bus for code and data (ARM DDI 0029G, sections 1.1.1 and 1.1.2).
  The ARM9E-S inside the DS's ARM946E-S has five stages, separate code and data buses, and interlocks:
  a dependent instruction after a word load waits one cycle, and after a byte, halfword, or unaligned load two
  (ARM DDI 0165B, sections 1.1.1, 1.1.3, and 8.12.1).
  DS ARM9 time therefore depends on instruction order, not only on which instructions run (inference).
- The SH-2 has five stages; its delayed branches take the target from the register as it was
  before the slot instruction ran; a branch in a delay slot raises an illegal-slot exception;
  a load whose result the next instruction uses stalls the pipeline,
  and the multiplier and memory accesses compete with fetches
  (Renesas SH-1/SH-2/SH-DSP software manual, section 4 and sections 7.1.1 to 7.2.3).
  The basic instructions take one cycle and a 32-by-32 multiply two to four (same manual, table 1.1).
- The Nintendo 64's VR4300 shows no load delay to the programmer.
  It stalls one cycle when the next instruction "appears to use the result of the load",
  comparing register fields rather than actual use, so some independent pairs stall too
  (N64brew, "VR4300", "Load Delay Interlock").
  A cycle-exact core needs that over-eager rule; a functional one does not (inference).

#### Game Boy Advance

- The Game Boy Advance runs an ARM7TDMI at 16.78 MHz, in 32-bit ARM or 16-bit Thumb state,
  and keeps an 8-bit CPU for Game Boy and Game Boy Color cartridges (GBATEK, mGBA's copy, "GBA Technical Data").
  The Game Boy Advance survey (`R1-11`) therefore needs the Game Boy processor from `R1-01` as well.
- Arm's timing model counts non-sequential, sequential, internal, and coprocessor cycles for each instruction,
  and multiply time depends on the operand's top bytes (ARM DDI 0029G, table 6-23).
  GBATEK gives the same table.
  On the Game Boy Advance these cycles are then stretched by the wait states of whatever memory they touch
  (see "Memory, buses, and save media").
- The pipeline is visible to software: reads of unused memory return the most recently prefetched opcode,
  and reads of the BIOS from outside it return the last opcode the BIOS fetched
  (GBATEK, "Reading from BIOS Memory" and "Reading from Unused Memory").
  An emulator's open-bus value therefore depends on its pipeline model (inference).

#### Nintendo DS and DSi

- The DS pairs an ARM946E-S at 66 MHz with an ARM7TDMI at 33 MHz (16 MHz in Game Boy Advance mode)
  (GBATEK, "DS Technical Data").
  Only the ARM9 has tightly coupled memories (32 KiB for code, 16 KiB for data), caches
  (8 KiB instruction, 4 KiB data, 4-way, 32-byte lines),
  and a protection unit (GBATEK, "DS Memory Control - Cache and TCM").
  Arm's manual makes these sizes implementation choices, so the DS figures rest on GBATEK, not on Arm (ARM DDI 0201D).
- The ARM9 runs at twice the 33.51 MHz bus clock,
  but outside its caches and tightly coupled memories its opcode fetches are "always N32 + 3 waits",
  and GBATEK estimates its real speed there at 8 to 16 MHz (GBATEK, "DS Memory Timings").
  Whether an emulator models the caches decides how fast the ARM9 appears to games (inference).

#### Nintendo 64

- The CPU is a slightly modified NEC VR4300,
  a 64-bit MIPS III core at 93.75 MHz with a floating-point unit and a system coprocessor holding an MMU and TLB;
  retail units report revision 1.0 or 2.2 (N64brew, "VR4300").
- The chip departs from its manual in documented cases: a 32-bit arithmetic shift right fills from the upper 32 bits,
  multiply and divide with inputs that are not sign-extended give results consistent with wider operands,
  and early units have a floating-point multiplication bug (N64brew, "VR4300", "Known Bugs").
  The page does not name its test method.
  A core written from the maker's manual alone would be wrong in these cases (inference).
- The signal processor (RSP) is a cut-down MIPS core at 62.5 MHz with 4 KB each of instruction and data memory,
  no multiply or divide, no 64-bit or unaligned loads, no exceptions,
  and a vector unit of 32 registers of eight 16-bit lanes with a 48-bit accumulator per lane
  (N64brew, "Reality Signal Processor" and "RSP/CPU Core").
  It issues one scalar and one vector instruction per cycle,
  vector results arrive after four cycles and loads after three, and the pipeline stalls to enforce them
  (N64brew, "RSP/CPU Pipeline", which describes effects as seen by software).
- Graphics and audio on the Nintendo 64 are programs that games send to this core.
  Emulating the core instruction by instruction, or replacing known programs with host code,
  is the system's central choice (see "Options and trade-offs").
- A static recompiler exists that turns Nintendo 64 functions into C,
  given symbol data that usually comes from a disassembly or decompilation,
  and it handles branch delay slots "by duplicating instructions as necessary" (N64Recomp README).
  ADR 0001 closes decompilations, so this route needs per-game material the project may not read (inference).

#### PlayStation 1

- Maker's patent: Sony's 1994 application describes the console's CPU as a 32-bit RISC processor
  that "includes a command cache and a scratch pad memory", beside 2 MB of main RAM and a 512 KB ROM given as examples
  (EP0715277A2, description of the main controller module).
  The patent says "may be" and "for example" for the CPU type and sizes.
- Maker's patent: the same application describes the geometry transformation engine (GTE)
  as a coprocessor of the CPU doing coordinate transforms, lighting, vectors, and matrices in fixed point,
  at about 1.5 million flat-shaded polygons a second (EP0715277A2 and EP0715276A2).
  The patents do not give its arithmetic in detail.
- Older document: Joshua Walker's compilation of 2000 gives the clock as 33.8688 MHz and the memory map with cached
  and uncached mirrors of RAM and the BIOS at `0xBFC00000` (Walker, "The R3000A" and "The PSX Memory Map").
  Its cache paragraphs read like a processor family manual's,
  and it calls the 1 KB at `0x1F800000` both a data cache and a scratchpad,
  which the patent's wording does not support (inference); its stated method is
  that its author "poked at emulators" (`R0-05`).
- Older document with a stated method:
  Doomed's geometry document of 2000 says "Most of this is the result of experiment, so not all info might be correct",
  and gives cycle counts for each command and a rule that reading a coprocessor register
  while a command runs stalls the CPU (Doomed, `gte.txt`; reproduced in Walker's GTE chapter).
- Hardware test: AmiDog reports from his own tests that division by zero gives results consistent with a divider
  that works one bit at a time, that the most negative number divided by minus one returns without an exception,
  and that "there are games out there which relies on this undefined behavior" (AmiDog's PSX wiki, `psx:cpu:division`).
  He also reports that the geometry engine decodes 64 functions, not only the documented ones
  (`psx:gte:opcodes`; his flag explanation is stated as a guess).
  His test archives are closed; their results are usable.
- No clean source was found for the exact core variant and its system-coprocessor deviations, cache refill timing,
  the write buffer, bus timing per region beyond the test below, or the geometry engine's register formats, saturation,
  and flags beyond the experimental documents
  (searches of the hubs in `R0-05`, Google Patents, and AmiDog's wiki,
  whose page on load-delay corner cases does not exist).
  These are the parts of a PlayStation 1 processor model that wait on the owner's choice of route (`R0-05`, option 8).

#### Saturn and 32X

- The Saturn has two SH-2s at about 28.6 MHz sharing one bus, a 68EC000 for sound, an SH-1 controlling the disc drive,
  and a system control unit with a DSP (Wikipedia, "Sega Saturn", technical specifications).
  Charles MacDonald, testing on a Saturn,
  gives the CPU clock as 26.8465875 MHz or 28.63636 MHz depending on the display width chosen,
  shared with the video chips and the control unit
  (MacDonald, "Sega Saturn hardware notes", "NTSC Saturn timing"; lead).
- MacDonald relays from a Sega manual
  that writes to two address ranges trigger each SH-2's timer input to signal the other, and says he has not tried it
  (same notes, "SH-2 Memory Map", note 4).
  That manual is closed maker material, so the fact rests on a lead relaying a closed source.

#### Others, and what they share

- The 3DO runs an ARM60 at 12.5 MHz, with a "matrix engine" in its MADAM chip for fixed-point matrix multiplies,
  started by a register write and polled by the CPU
  (3DO Development Repo wiki, `hardware/opera/madam/matrix_engine`; Wikipedia, "3DO").
  The wiki states no origin, and its other pages index 3DO's own documents, which are closed.
- The Virtual Boy's V810-family CPU has a 1 KiB instruction cache and no branch delay slot;
  a taken branch costs three cycles, and the reference marks many timings as needing research
  (Sacred Tech Scroll, "CPU - NVC/V810 Family Microprocessor").
  Mednafen's Virtual Boy and PC-FX modules offer a fast mode without cache emulation and an accurate one with it,
  and say that even then "the pipeline isn't correctly and fully emulated"
  (Mednafen documentation, `vb.html` and `pcfx.html`).
- The Jaguar has a 68000 at 13.295 MHz and two custom 32-bit RISC processors at 26.591 MHz,
  one in each of its "Tom" and "Jerry" chips, and a memory-controller flaw that limits running their code from main RAM
  (Wikipedia, "Atari Jaguar"; the article quotes a closed Atari manual).
  No open source was found for their pipelines (web search and the hubs in `R0-05`).

### Memory, buses, and save media

#### One pool or several

- The Nintendo 64 has one pool of main memory, 4 MiB of RDRAM,
  reached by the CPU and every part of the reality co-processor; the Expansion Pak adds a second 4 MiB
  (N64brew, "RDRAM" and "Expansion Pak").
  Software finds the Expansion Pak by writing and reading back at 1 MiB steps,
  so emulated memory must stop answering past its configured size (N64brew, "RDRAM", "Expansion Pak Detection").
- The Saturn splits 2 MB of CPU work RAM into a low and a high block of 1 MB at different addresses,
  and gives each video chip and the sound side its own memory (MacDonald, "SH-2 Memory Map"; lead).
  Which bus each block sits on rests on Copetti's article, which cites Sega's closed manuals for that chapter (lead).
- The PlayStation 1 has three separate memories: 2 MiB of main RAM, 1 MB of video RAM on the graphics chip,
  and 512 KB of sound RAM (Wikipedia, "PlayStation technical specifications", citing a 1995 magazine; tertiary).
  The sources disagree on the main RAM's type: Wikipedia says EDO DRAM, Walker "four 512k 60ns SRAM chips"
  (Walker, "Memory"); no clean primary source was found to settle it.
- The DS has 4 MiB of main RAM shared by both CPUs, 32 KiB of work RAM that can be split between them,
  64 KiB for the ARM7 alone, nine video RAM banks whose addresses registers set, and memories on no CPU bus at all,
  such as the 3D engine's polygon RAM and 256 KiB of firmware flash
  (GBATEK, "DS Memory Maps" and "DS Memory Control - VRAM").
  When the shared work RAM belongs wholly to one CPU,
  the ARM9 reads undefined data there and the ARM7 reads mirrors of its own work RAM
  (GBATEK, "DS Memory Control - WRAM").
  Each CPU therefore needs its own map and its own fallback for unmapped addresses.

#### Caches and segments

- The Nintendo 64 and PlayStation 1 CPUs both use the MIPS segments: one window of RAM is cached, another uncached,
  and the user segment goes through the TLB (N64brew, "Memory map"; Walker, "The PSX Memory Map" and "Virtual Memory").
- On the Nintendo 64 only RDRAM accepts cached accesses;
  elsewhere "cache requests are ignored ... and they will thus freeze the CPU requiring a hard reset"
  (N64brew, "Memory map").
  Unmapped physical ranges are also ignored, so a read never completes and the CPU locks up (same page).
  The faithful result is a hang, not an open-bus value (inference).
- On the PlayStation 1, the 1 KB data memory serves as a fixed scratchpad at `0x1F800000`
  (older document: Walker, "The PSX Memory Map"; tertiary: Wikipedia, citing a Sony manual that `R0-05` closes).
  Whether the core has a TLB at all was not settled: Walker describes a 64-entry TLB and does not say how he checked it,
  his bibliography names a processor family manual, and no clean source says either way.
  A hardware test would settle it.
- Each Saturn SH-2 selects, by the top three address bits, cached access, cache-through access, a purge area,
  direct access to its cache tags and data, or its on-chip registers
  (MacDonald, "SH-2 Memory Map", lead; Yabause wiki, "SH-2 CPU").
  The two CPUs have no hardware cache coherency: shared data "should be read/written using cache-through addresses"
  (Yabause wiki, "SH-2 CPU").
- Saturn games have coherency bugs that the hardware hides, "due to the effects of instruction fetches on the cache",
  and Mednafen keeps a per-game list of cache modes because full cache emulation costs too much host time
  (Mednafen documentation, `ss.html`, "Cache Mode").
  On this system, cache emulation is a correctness question, not only a timing one.
- The DS ARM9's DMA cannot reach its tightly coupled memories,
  so software drains the write buffer and cleans the cache around each transfer (GBATEK, "DS DMA Transfers").
  A game that forgets to may depend on stale data, which only a cache model reproduces (inference).

#### Buses and wait states

- The Game Boy Advance's regions differ in width and speed: internal work RAM is 32-bit with single-cycle access,
  external work RAM 16-bit with 3, 3, and 6 cycles for 8-, 16-, and 32-bit accesses by default, and cartridge ROM 16-bit
  (GBATEK, "Address Bus Width and CPU Read/Write Access Widths").
  A 32-bit access to a 16-bit region takes two bus cycles.
- Cartridge ROM wait states are set by software, separately for the first and the following accesses,
  and a non-sequential access is forced at each 128 KiB boundary (GBATEK, `WAITCNT` and "GBA Cartridge ROM").
  The cartridge latches the low address bits and counts them up itself on sequential accesses
  (same section), which is why sequential access is cheaper.
- A prefetch buffer of eight halfwords fetches ROM opcodes while the CPU is not using the bus,
  and with prefetch off some opcodes take a non-sequential fetch instead (GBATEK, "GBA GamePak Prefetch").
  Exact Game Boy Advance timing needs a prefetch model (inference).
- On the Nintendo 64 the CPU reaches everything through the RCP,
  which ignores the access size for its registers and the external buses:
  byte and halfword writes store the CPU's whole shifted bus word, and 64-bit reads freeze the console
  (N64brew, "Memory map").
  Its cartridge bus carries 16-bit data in two timing "domains" set by registers,
  and reading it where no device answers returns the low half of the address in both halves of the word
  (N64brew, "Parallel Interface", "Domains" and "Open bus behavior").
- Hardware test: measured on a console, a PlayStation 1 CPU access costs about one cycle to the scratchpad,
  about five to main RAM, and far more to the 8-bit BIOS ROM (ps1-tests, `cpu/access-time/psx.log`).
  The log does not state the console model; that it was made on hardware is inferred from the suite.
  Another log shows byte and halfword writes to many I/O registers arriving
  as 32-bit writes of the CPU's whole register (`cpu/io-access-bitwidth/psx.log`).
  The expected values' origin is not stated for the suite as a whole (`R0-05`).

#### DMA

- The Game Boy Advance has four DMA channels with fixed priority; the CPU stops while one runs;
  only the fourth reads cartridge ROM, and two feed the sound FIFOs (GBATEK, "GBA DMA Transfers").
  Their cost follows the same wait states as the CPU's accesses.
- The DS has four channels for each CPU;
  the ARM9 keeps running during DMA only while it works in its caches or tightly coupled memories
  (GBATEK, "DS DMA Transfers").
  The DSi adds four more for each CPU, and their priority against the old ones is unknown
  (GBATEK, "DSi New DMA (NDMA)").
  A hardware test would settle what an emulator now has to guess (inference).
- The Nintendo 64 has a DMA engine for each interface: the cartridge bus, the serial bus to the controller chip,
  the signal processor's memories, and audio and video fetches
  (N64brew, "Reality Signal Processor/Interface", "Serial Interface", and "Memory map").
  Cartridge DMA splits at RAM page boundaries and has misalignment bugs that leave holes in RAM,
  which N64brew describes while saying that "the *actual* process implemented in the hardware is unknown"
  (N64brew, "Parallel Interface").
- The signal processor's memories are single-ported with "no bus arbiter":
  if the CPU and the RSP or its DMA touch them at once, one side's access is lost or corrupted
  (N64brew, "Reality Signal Processor/Interface", "DMEM and IMEM").
  Emulators normally serialise these accesses (inference).
- Older document and hardware test: the PlayStation 1 has seven DMA channels, for the video decoder in and out,
  the graphics chip, the disc drive, the sound chip, an expansion port, and clearing the ordering table,
  and the graphics channel can follow a linked list
  (Walker, "DMA"; Doomed, `system.txt`, "DMA"; ps1-tests README lists tests of list walking and of splitting transfers).
  Doomed marks several control bits as unknown.

#### Save media

- The Nintendo 64 cartridge offers serial EEPROM through the controller chip's channel,
  or SRAM or FlashRAM on the cartridge bus (N64brew, "PIF-NUS", "Joybus Protocol", and "Flash").
  Its header has no save-type field, and "emulators normally work using a game database
  which matches games using checksum to find out which savetype and controllers are expected by the game"
  (N64brew, "ROM Header").
  An emulator needs that database, whose terms `R0-03` governs (inference).
- The Game Boy Advance has four save kinds: SRAM or FRAM on an 8-bit bus, serial EEPROM driven by DMA,
  flash from several makers with different identifiers, or none (GBATEK, "GBA Cart Backup" sections).
  "Nintendo didn't include a backup-type entry in the ROM header",
  so detection is by an identifier string that Nintendo's library places in the ROM, or by heuristics
  (GBATEK, "GBA Cart Backup IDs").
- DS cartridges save to an SPI chip on the card's serial bus, EEPROM or flash of several sizes,
  and GBATEK describes how emulators guess the type from the commands a game sends
  (GBATEK, "DS Cartridge Backup", "Detection (in emulators)").
  The DSi adds a 256 MB internal eMMC (GBATEK, "DSi SD/MMC Internal NAND Layout").
- Older document: the PlayStation 1 memory card holds 128 KB in 16 blocks of 8 KB, the first a directory,
  and shares the serial protocol and pins with the controllers
  (Walker, "Memory cards"; its bibliography credits other authors whose methods are not stated).
  No clean source was found for the card's command protocol and timing.
- Mednafen warns that save states and in-game memory-card saves "do not mix well"
  (Mednafen documentation, `psx.html`): restoring a state also rolls back the card.
  Whether save media belong to a save state is a design choice (`R2-08`).
- The Saturn keeps 32 KiB of battery-backed RAM on odd bytes only,
  and its cartridge slot takes backup-RAM cartridges or RAM-expansion cartridges of 1 MiB or 4 MiB
  that some games require (MacDonald, "SH-2 Memory Map", lead; Yabause wiki,
  "Backup RAM Cartridge" and "DRAM Cartridge").
  Mednafen chooses the cartridge for each game from a list, because some games crash with a RAM cartridge inserted
  (Mednafen, `ss.html`).

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
  (N64brew, "Reality Display Processor/Pipeline"; GBATEK, `DISP3DCNT` and `SWAP_BUFFERS`),
  while the PlayStation 1 and Saturn draw in the order software gives, as the findings below say.

#### PlayStation 1

- Older document with a stated method:
  Doomed's GPU and geometry texts say most of their content "is the result of experiment"
  (Doomed, `gpu.txt`, "About this document"; `gte.txt`, "Disclaimer").
  Walker's compilation reproduces the GPU text closely (Walker, GPU chapter).
  Most of what follows rests on these, with Sony's patent US 5,793,376 where it agrees.
- The GPU owns 1 MiB of frame buffer, addressed as a 1024 by 512 grid of 16-bit pixels rather than linearly,
  in which display areas, drawing areas, textures, and colour tables all live
  (Doomed, `gpu.txt`, "The Frame Buffer"; US 5,793,376, description).
  An emulator that renders on a host GPU must still keep this one shared surface coherent (inference).
- It draws triangles and quadrilaterals, flat or Gouraud-shaded, textured or not, and rectangles and lines;
  a four-point polygon is drawn as two triangles, and it does not draw a polygon's right-most column and bottom row
  (Doomed, `gpu.txt`, "Primitives").
- Visibility comes from order: the GPU draws packets as given, and software sorts them through an ordering table
  (Doomed, `gpu.txt`; Walker, GPU chapter).
  Semi-transparency reads the frame-buffer pixel and combines it in one of four modes (Doomed, "Semi Transparency").
- With dithering on, the GPU computes colour at 24 bits and dithers when it writes 15 bits
  (Doomed, "Drawing Environment"; the patent describes the display modes).
  In 24-bit display mode the frame buffer is shown as a bitmap that the GPU cannot draw into (US 5,793,376).
- Texture coordinates are interpolated linearly in screen space,
  which Wikipedia says "The Sony PlayStation made extensive use of" because it supported only affine mapping in hardware
  (Wikipedia, "Texture mapping", uncited there; tertiary).
  The geometry engine returns integer screen coordinates with no fraction (Doomed, `gte.txt`, perspective transform).
  Together these give the console's characteristic texture warping and vertex jitter (inference).
- No clean source was found for the dither matrix, whether textures are point-sampled,
  the exact fill rule beyond the edge rule above, the limits on primitive size, or the GPU's drawing time
  (searches of Doomed's texts, Walker, the patent, ps1-tests, and Wikipedia).
  A primer cannot state these without a hardware test or a decision on `R0-05` option 8.

#### Nintendo 64

- Nintendo and Silicon Graphics' patent describes the coprocessor as a programmable signal processor with a vector unit
  and a display processor that rasterises triangles and rectangles with texture, colour combining, blending,
  and anti-aliasing (US 6,331,856, description).
- "The code running on the RSP is usually called 'microcode', but it's a standard MIPS program"
  (N64brew, "Reality Signal Processor"; inner quotes made single).
  Games send display lists to that program,
  which transforms and lights vertices and sends triangle commands to the display processor (RDP)
  (same page; US 6,331,856).
  Some games used their own microcode
  (Wikipedia, "Nintendo 64"; tertiary),
  so an emulator that replaces known microcode with host code must recognise each one (inference).
- The RDP has four pipeline modes: one-cycle and two-cycle, which run texture, combiner,
  and blender once or twice per pixel, and copy and fill (N64brew, "Reality Display Processor").
  It rasterises with a coverage value for each pixel, optionally corrects texture coordinates for perspective,
  samples a 4 KiB texture memory, filters, combines colours, tests alpha and coverage, compares depth, blends,
  and dithers 8-bit channels to 5 bits for 16-bit images
  (N64brew, "Reality Display Processor/Pipeline", "1-Cycle Pipeline").
  The coverage and dither stages have no direct equivalent in a host GPU's fixed functions (inference).
- Coordinates are fixed point: triangle edges carry two fraction bits,
  and "In COPY and FILL mode the fractional bits are ignored and the lower-right bounds are inclusive"
  (N64brew, "Reality Display Processor/Commands").
- The video interface filters the image it scans out: it anti-aliases from the coverage values and can de-dither,
  for which it "looks at the 8 neighbors around each pixel and perform an error correction"
  (N64brew, "Video Interface").
  The output a player sees is the frame buffer plus this filter, so an emulator needs both (inference).
- paraLLEl-RDP renders the RDP with compute shaders on a host GPU
  and "aims to be bitexact with the Angrylion-Plus reference renderer where possible" (paraLLEl-RDP README).
  Its reference is an emulator that the register closes, not hardware,
  so bit-exactness to it is agreement with one emulator (inference).

#### Saturn

- VDP1 draws sprites, polygons, and lines into one of two frame buffers,
  which are swapped or erased at frame boundaries, and leaves priority and most other effects to VDP2
  (Yabause wiki, "VDP1").
  Its commands are 32-byte tables in its own memory: normal, scaled, and distorted sprites, polygons, polylines,
  and lines (MacDonald, "Saturn VDP1 hardware notes", from his own tests; lead).
- Secondary sources agree that VDP1 maps textures forward,
  stepping across the texture and writing pixels onto the quadrilateral, so some pixels are drawn twice,
  which spoils half-transparency on distorted sprites
  (Sega Retro, "VDP1 (Saturn)", "Overview"; Copetti, Saturn article, lead).
  Sega Retro cites a Sega manual for this, so the rule rests on secondary sources relaying a closed one.
- VDP1 has no visible-surface hardware, so geometry must arrive in the right order,
  and Sega's library sorted polygons by approximate depth
  (Copetti, Saturn article, "An introduction to the visibility problem"; lead).
- VDP1's drawing time is visible to games:
  Mednafen slows VDP1 command execution for some titles when the SH-2s access it
  (Mednafen documentation, `ss.html`),
  and the Ymir emulator's notes count frame-buffer erase cycles and list games that use rare features
  (Ymir `docs/dev-notes`, open tier, read as prose).

#### Game Boy Advance and DS

- The Game Boy Advance draws a 240 by 160 picture from four background layers, tiled or bitmap, and 128 objects
  (GBATEK, "Video" summary and the `DISPCNT` mode table).
  Objects have a budget of 1210 cycles a line, or 954 when software may reach object memory during horizontal blank
  (GBATEK, "Maximum Number of Sprites per Line").
  Rotation layers copy their reference points to internal registers at vertical blank
  (GBATEK, "Internal Reference Point Registers"), so a write in mid-frame takes effect from a later line (inference).
- The DS has two 2D engines, each much like the Game Boy Advance's, and engine A adds a 3D layer (GBATEK, "DS Video").
  The 3D hardware is a fixed-point geometry engine, whose vertex and polygon memories swap at vertical blank,
  and a rendering engine that draws line by line: "There's only the 48-line cache
  (not a full 192-line framebuffer to store the whole rendered image)" (GBATEK, "DS 3D Overview").
  The limits are 2048 polygons and 6144 vertices a frame (same section).
  A renderer that draws whole frames cannot show what the hardware shows when a line is overloaded (inference).
- "Quads are natively handled and not converted to triangles,
  which is a bit of a problem as modern GPUs only support triangles"
  (melonDS blog, "The DS GPU and its fun quirks"; lead).
  The rasteriser fills one span per line between two edges, and depth is a Z or a W buffer chosen each frame
  (same post; GBATEK, `SWAP_BUFFERS`).
  polyrastertest records the DS's exact rasterisation, from data captured on a New 3DS XL in DS mode
  (polyrastertest README), so its oracle is a 3DS running in DS mode, not a DS.
- melonDS's hardware renderer uses the host GPU's triangles,
  "so the behaviour of the DS can't be replicated completely faithfully"
  (melonDS blog, "Introducing the compute renderer"; lead),
  and upscaling the 3D layer needs the 2D compositor to keep several layer values per pixel
  (melonDS blog, "Hardware rendering, the fun"; lead).

#### Others

- In PlayStation 1 mode the PlayStation 2's processors emulate the graphics chip: "In PSX mode,
  the EE and GS work together to emulate the PSX GPU"
  (ps2tek, "BIOS PlayStation Compatibility"),
  so the PlayStation 2 is not a second PlayStation 1 graphics chip (inference).
- The Jaguar's Tom chip holds a programmable 32-bit processor and an object processor that builds each line from a list,
  and the PC-FX has no polygon hardware and decodes compressed video frames instead
  (Wikipedia, "Atari Jaguar" and "PC-FX"; tertiary).

### Audio

- The era's sound hardware comes in kinds that an emulator models differently
  (inference from the findings below):
  sample players with their own RAM, decoders, envelopes, and effects
  (PlayStation 1, Saturn, DS);
  programmable processors whose software makes the sound
  (Nintendo 64, Jaguar, 3DO); and the Game Boy Advance's mix of the Game Boy's channels with sample FIFOs.

#### PlayStation 1

- Maker's patent: Sony's application describes a "sound processing unit
  or so-called SPU" with its own 512 KB sound buffer, fed by the CPU and by the disc decoder (EP1280150A2, description).
  Its samples are 16-byte blocks holding 28 four-bit ADPCM samples and a parameter area with a shift, a filter choice,
  and loop flags, and one of four predictive filters is chosen per block (same).
  The patent says the block was designed so that one decoder serves both Sony's format and CD-ROM XA audio,
  and contrasts it with an older 9-byte, 16-sample block (same).
- Maker's patent: each of 24 voices has its own pitch, a choice of sample or noise, an ADSR envelope, and two volumes;
  the mixer adds a separately controlled 16-bit input from the disc,
  and a reverberation unit mixes in delayed copies of the sum (EP1280150A2).
- CD-ROM XA audio has rates of 37.8 kHz and 18.9 kHz
  (Philips US 5,483,619, read as the patent office copy),
  and Walker describes a drive mode that sends XA sectors to the sound path and a filter command
  that plays only the sectors of one file and channel (Walker, CD-ROM chapter).
  Disc timing therefore reaches the audio mix (inference).
- No clean source was found for the reverb algorithm, the interpolation between samples, the envelope rate tables,
  or when the sound-RAM interrupt fires (searches of the patent family, Doomed, Walker, and ps1-tests).

#### Saturn

- The SCSP (Yamaha YMF292) has 32 slots,
  each playing 8- or 16-bit PCM from sound RAM or acting as an FM operator modulated by other slots,
  a programmable effects DSP that works through a ring buffer in sound RAM, and three timers
  (Yabause wiki, "SCSP"; Sega Retro, "Saturn Custom Sound Processor", which cites Yamaha and Sega documents).
  It has no hardware decompression; later games decoded compressed audio in software on the sound CPU
  (Sega Retro, same).
- It runs at 22.58 MHz with its 68EC000 at 11.29 MHz, 512 and 256 times 44.1 kHz
  (Sega Retro, "Sega Saturn/Technical specifications"; calculated),
  and MacDonald says it does not follow the PLL setting that changes the CPUs' clock
  (MacDonald, "NTSC Saturn timing"; lead).
  Sound therefore needs its own time base in the scheduler (inference).

#### Nintendo 64

- The Nintendo 64 has no synthesis hardware:
  its audio interface only fetches 16-bit stereo samples from RAM by DMA at a programmed rate
  and sends them to the converter; decoding and mixing are done by the CPU or by microcode on the signal processor
  (N64brew, "Audio Interface"; US 6,331,856,
  which describes audio command lists built on the CPU and run by synthesis microcode).
  Audio on this system is therefore as much an emulation of the signal processor as graphics is (inference).
- The rate is the video clock divided by one more than a register value,
  and the audio interrupt fires when a transfer starts, not when it ends;
  the interface holds no sample memory of its own, so DMA progresses as samples reach the converter
  (N64brew, "Audio Interface").
- The audio interface has a hardware fault:
  a transfer whose last sample ends exactly on an 8 KiB boundary advances the next buffer's address by `0x2000`
  (N64brew, "Audio Interface").
  The original converter interpolates between samples (N64brew, "Audio DAC").

#### Game Boy Advance and DS

- The Game Boy Advance keeps the four Game Boy Color channels and adds two "direct sound" channels
  that play signed 8-bit samples from FIFOs, refilled by DMA when half empty, at a rate a timer sets
  (GBATEK, "GBA Sound Controller" and "GBA Sound Channel A and B - DMA Sound"; The Audio Advance, "Direct Sound").
  The output is a PWM stream whose rate and depth a register selects, 9-bit at 32.768 kHz by default
  (GBATEK, `SOUNDBIAS`).
- The DS has 16 channels under the ARM7, each playing 8- or 16-bit PCM or IMA-ADPCM,
  six with square waves and two with noise; each channel's rate is a timer at half the bus clock
  (GBATEK, "DS Sound Hardware").
  GBATEK documents rounding and clipping in the DS's ADPCM that differ from the textbook algorithm,
  and channels start one, three, or eleven samples late by kind (GBATEK, "IMA-ADPCM Format" and "DS Sound Notes").

#### Others

- The 3DO's sound is a custom DSP in its CLIO chip;
  the 3DO Company's patent describes a processor that restarts its program at each sample,
  568 clock ticks per sample in its example (WO 94/16383, description; 3DO Development Repo wiki, `opera/dsp`).
- The Jaguar makes sound in software on its "Jerry" chip's 32-bit processor (Wikipedia, "Atari Jaguar"; tertiary).

### Timing, synchronisation, and input

#### Clocks and frames

- Each worked example runs at least two programmable processors that share memory or a bus, at different clocks
  (inference from the findings above):
  the DS's ARM9 at twice its bus clock beside an ARM7, the Nintendo 64's CPU at 1.5 times the signal processor's clock,
  the Saturn's two SH-2s beside a 68EC000 on the sound side's own clock,
  and the PlayStation 1's CPU beside sound and video chips with their own memories.
  A scheduler for the era interleaves several processors, not one CPU and its peripherals.
- The Game Boy Advance's system clock is 16.78 MHz
  (exactly 2^24 Hz);
  a line is 308 dots of four cycles and a frame 228 lines, about 59.737 Hz
  (GBATEK, "Horizontal Dimensions" and "Vertical Dimensions").
  In Game Boy Advance mode a DS runs at half its 33.51 MHz bus clock, about 16.76 MHz,
  slightly slower than a Game Boy Advance, which GBATEK marks "probably" (GBATEK, "DS Backwards-compatible GBA-Mode").
- The DS bus clock is 33.513982 MHz; the dot clock is a sixth of it, and a frame of 263 lines runs at 59.8261 Hz
  (GBATEK, "DS Display Dimensions / Timings").
  Its line counter is writable, so that linked consoles can synchronise their displays (same).
- The Nintendo 64's CPU runs at 93.75 MHz, 1.5 times the 62.5 MHz clock of its co-processor,
  while its video clock comes from a crystal at four times the colour subcarrier and differs by region
  (N64brew, "Clock Timing").
  Video timing is programmed by software through the video interface's registers, not fixed
  (N64brew, "Video Interface"), and the audio rate follows the video clock (see "Audio").
- Maker's patent: Sony's 1993 patent describes a PlayStation 1 CPU that runs partly from its cache so
  that it can release the system bus to a controller moving drawing commands and compressed images
  (US 5,850,540, description).
  Exact frame timing, lines per frame, cycles per line, and dot-clock frequencies have no clean source found
  (searches of Walker, Doomed, AmiDog's wiki, whose page on the counters does not exist, and ps1-tests).

#### Interrupts and inter-processor signalling

- Each DS CPU has its own interrupt registers,
  and the two signal each other through a small register with an interrupt request and through two 16-word FIFOs
  (GBATEK, "DS Interrupts" and "DS Inter Process Communication (IPC)").
  The ARM9's divider and square-root unit take a fixed number of bus cycles, and results read early are wrong,
  so games poll a busy flag (GBATEK, "DS Maths").
  An emulator that returns results at once still has to report the busy flag sensibly (inference).
- Hardware test: the PlayStation 1 has four counters,
  one counting horizontal retraces and one a system clock divided by eight,
  and a test log shows the first counting 263 per frame on an NTSC console
  (ps1-tests, `timers/psx.log`; Walker and Doomed describe the counters as older documents).
  The interrupt controller's layout, DMA priority and timing, the line on which vertical blank interrupts,
  and the disc and sound interrupts have no clean source beyond Walker and Doomed (same searches).

#### Input and peripherals

- Nintendo 64 controllers and cartridge EEPROMs use the Joybus protocol run by the console's PIF microcontroller:
  the CPU writes a command frame into 64 bytes of PIF RAM and a DMA read makes the PIF run the whole exchange
  (N64brew, "Serial Interface", "PIF-NUS", and "Joybus Protocol").
  The controller reports a signed byte per stick axis, and the accessory port takes the Controller Pak, the Rumble Pak,
  and the Transfer Pak, which carries a Game Boy cartridge (N64brew, "Controller Pak", "Rumble Pak", "Transfer Pak").
- The Saturn's system manager is a 4-bit Hitachi microcontroller with its own program ROM that switches the second SH-2,
  the 68000, and the disc block on and off, keeps time, changes the system clock, and polls the controllers
  (Yabause wiki, "SMPC"; MacDonald, lead).
  Its firmware is a ROM the project does not read, so an emulator models it by its behaviour (inference).
- Older document: PlayStation 1 controllers and memory cards share one serial bus with a select line per port,
  a 250 kHz clock, and an acknowledge pulse from the device after each byte (Walker, "Controllers").
  The DualShock adds two sticks and two motors; the Multitap gives four controllers on one port
  (Wikipedia, "DualShock" and "PlayStation Multitap"; tertiary).
  The link cable's register-level behaviour has no clean source found.

### Media, protection, and firmware

The law on firmware, keys, and lock-outs is in `R0-02`
("Firmware, keys, and game copies" and "Anti-circumvention law in the United States");
this section records what the hardware does.
No firmware, boot code, or key was opened, and firmware bytes are not recorded.

#### Kinds of firmware

- The firmware an emulator of this era meets falls into four kinds
  (inference from the findings below):
  a BIOS for the main CPU (PlayStation 1, Saturn, Game Boy Advance, DS, PC-FX, 3DO);
  firmware for a drive controller on its own processor
  (the PlayStation 1's disc controller, the Saturn's SH-1);
  firmware for a lock-out microcontroller
  (the Nintendo 64's PIF and the cartridge's CIC); and boot ROMs that verify the next stage (DSi).

#### PlayStation 1

- Older document: the CPU reaches the disc controller through four byte-wide ports,
  and the controller runs commands asynchronously, some answering at once and delivering their real result by a second,
  queued interrupt (Doomed, `cdinfo.txt`; repeated in Walker, "The CD-ROM").
  Its modes select double speed, XA audio streaming, sector size, and a file and channel filter (same).
  Doomed's prose uses names from Sony's library for the commands, so it may draw on
  that library's documentation (inference).
- Older document: the BIOS is 512 KiB at `0xBFC00000`, the reset vector,
  and its services are reached by jumping to one of three call tables with a function number in a register
  (Walker, "Memory Map" and appendix B; Doomed, `system.txt`).
  An emulator that runs games without the BIOS must provide these services itself (inference).
- Maker's patent: Sony's patent describes a security code stored
  as a radial wobble of the pits in the disc's lead-in area, a 22.05 kHz carrier keyed on and off,
  read from the tracking error signal, and checked before a second check of licence data
  (US 6,304,971, detailed description, FIG. 1 to FIG. 5).
  An ordinary drive reads the data but not the wobble
  (Wikipedia, "PlayStation (console)", "Copy protection system"; tertiary),
  so a disc image does not hold it and an emulator accepts the image in its place (inference).
  Where on the disc the wobble lies is unresolved: the patent's embodiment says the table-of-contents area,
  Wikipedia the pregap.
- No clean source was found for the BIOS boot sequence, the executable format,
  the disc controller's own processor and command timings, or the subchannel protection used on some PAL discs
  (searches of Walker, Doomed, AmiDog's wiki index, Mednafen's prose, and Wikipedia; the last is from memory).

#### Saturn

- The Saturn's double-speed drive is run by its own SH-1
  (Wikipedia, "Sega Saturn"),
  and the disc block holds up to 202 raw sectors, 200 of them reachable from the CPUs, filters sectors into buffers,
  and can feed a video card (Yabause wiki, "CDBlock").
  After reset its four command registers read the letters of "CDBLOCK" (same page).
- Only the first 16 sectors of a Saturn game disc can be read until the disc block and the BIOS approve it;
  audio discs and other formats are unlocked at once (Yabause wiki, "CDBlock", "Authenticating and unlocking CD").
  Sega's patents describe checking a mark formed by pits near the disc's edge against reference data,
  and a boot sector holding a disc identifier and a security code (EP 0 682 341 and US 5,371,792).
  As with the PlayStation 1, an image cannot hold the physical mark (inference).

#### Nintendo 64

- The PIF on the board is a Sharp SM5 microcontroller with its own firmware;
  it holds the first two boot stages for the CPU in a 1984-byte ROM, which the CPU reads one serial transfer at a time,
  so the first stage copies the second into the signal processor's memory to run it
  (N64brew, "PIF-NUS", "Internal ROMs and RAM" and "Console startup").
  The PIF locks its ROM before the game runs.
- Each cartridge holds a CIC, also an SM5,
  which sends the PIF an identifier marking region and 64DD use and a checksum of the boot code in the cartridge;
  a cartridge boots only with the boot code its CIC expects
  (N64brew, "CIC-NUS", "Boot sequence"; "PIF-NUS", "Console startup").
  After boot the game must talk to the PIF within about five seconds,
  and the PIF and CIC keep exchanging data while powered, so removing the cartridge halts the CPU (same pages).
- An emulator that boots a game without the PIF's firmware must reproduce what the boot leaves behind (inference);
  libdragon ships an open boot stage for homebrew (N64brew, "Initial Program Load", read for this point only).
  N64brew describes one CIC variant's challenge only by reference to a reimplementation from dumped firmware,
  and no clean description was found.

#### Game Boy Advance and DS

- The Game Boy Advance cartridge header carries a compressed Nintendo logo that the BIOS compares with its own copy,
  locking up on a mismatch, a fixed byte, and a checksum (GBATEK, "GBA Cartridge Header").
  The same header format serves programs loaded into RAM over the link cable (same section).
  The bytes of the logo are not recorded; `R0-02` covers the logo ("Firmware, keys, and game copies").
- The DS has a 4 KiB BIOS for the ARM9, a 16 KiB BIOS for the ARM7,
  and firmware in a serial flash of 256 KiB that holds settings, Wi-Fi calibration, and the menu's code
  (GBATEK, "DS Firmware Serial Flash Memory" and "DS Firmware Header"; melonDS FAQ).
  Only the BIOS can read its own protected regions (GBATEK, "DS Memory Control - BIOS").
- DS cartridges are read with 8-byte commands in three phases, the second and third encrypted,
  and the boot code's first block is checked after decryption
  (GBATEK, "DS Cartridge Protocol" and "DS Cartridge Secure Area").
  The encryption needs data held in the BIOS
  (GBATEK, KEY1 section),
  so a dump that is not decrypted cannot be run without it (inference);
  `R0-02` records why keys and their handling matter.
- The PlayStation 2's input-output processor is the PlayStation 1's CPU,
  with the geometry engine and video decoder kept for compatibility;
  from model SCPH-7500x it was replaced by a PowerPC-based part that emulates it
  (Wikipedia, "PlayStation 2 technical specifications"; tertiary).
  Two PlayStation 2 hardware generations therefore run PlayStation 1 games by different means (inference).
- The 3DS's mode register selects 3DS, DS or DSi, or Game Boy Advance mode;
  in Game Boy Advance mode the cartridge is served from the 3DS's RAM and registers emulate the save chip and clock
  (GBATEK, 3DS part, `ARM7_CNT`).
  The 3DS runs DS and DSi software but not DS software that needs the Game Boy Advance slot (Wikipedia, "Nintendo 3DS").

#### Others

### Tests and their oracles

- The Nintendo 64 has open tests run on a console: krom's tests "on a real N64 using a 64drive Cartridge",
  under the Unlicense (`R0-05`, "Test suites"; PeterLemon/N64 README). n64-systemtest covers coprocessor registers,
  exceptions, and the TLB and is deprecated in favour of nemu64-test; neither states where its expected values came from
  (n64-systemtest README; `R0-05`).
- The DS has polyrastertest, recorded on a New 3DS XL in DS mode
  (polyrastertest README),
  and the Game Boy Advance has open suites whose READMEs do not state hardware verification (`R0-05`, "Test suites").
- The ARM7TDMI vectors are generated by an emulator and do not yet record cycle counts
  (SingleStepTests arm7tdmi README);
  no vectors were found for the ARM946E-S, the SH-2, or the V810 (register and `R0-05`).
- So for most of this era the oracle is a console the project would need to run tests on,
  or another emulator (inference).

## Options and trade-offs

The options answer separate questions and can be combined.

### Low-level or high-level emulation of microcode and DSPs

- **What:** run the Nintendo 64's signal processor, the Saturn's control-unit DSP,
  and sound DSPs instruction by instruction, or recognise the programs games load and replace them with host code.
- **Costs:** low-level costs host time and needs the processor documented; high-level needs each program recognised,
  and games with their own microcode break it.
- **Gains:** low-level runs any program as the hardware does; high-level is fast and can raise resolution.
- **Used by:** paraLLEl-RDP renders the display processor on the host GPU at the low level;
  Mednafen lists cache and timing workarounds per game where it does not go to full detail.

### Interpreter, cached interpreter, or recompiler

- **What:** how the main CPUs run: one instruction at a time, from decoded blocks, or translated to host code.
- **Costs:** a recompiler loses timing detail that some tests need
  ("wouldn't be implementable by a dynamic recompiler");
  an interpreter may be too slow for the Saturn's two CPUs on a phone (inference).
- **Gains:** a recompiler reaches full speed on weak hosts.
- **Used by:** Mednafen's Virtual Boy and PC-FX modules offer a fast and an accurate CPU mode
  (see the findings); `R2-01` and `R3-01` take the question up.

### Cache emulation

- **What:** model the SH-2, DS ARM9, and Nintendo 64 caches; model data caches only; or ignore caches.
- **Costs:** full models cost host time; partial ones break games with coherency bugs the hardware hides.
- **Gains:** correctness for those games, and exact timing.
- **Used by:** Mednafen's Saturn module chooses per game from a list.

### Accurate or enhanced 3D

- **What:** reproduce the hardware's fixed-point results, edge rules, and dithering,
  or render on the host GPU with higher resolution and precision.
- **Costs:** accurate rendering on a host GPU needs compute shaders or software;
  enhancement changes what games show and breaks effects that depend on exact pixels (inference).
- **Gains:** fidelity to the hardware, or a sharper image.
- **Used by:** paraLLEl-RDP aims at bit-exactness with an emulator's renderer;
  melonDS offers a host-GPU renderer that it says cannot be fully faithful.

### How PlayStation 1 facts are sourced

- **What:** `R0-05`'s option 8 routes: older documents with stated origins, makers' patents, hardware tests,
  or open-tier emulator documentation and code.
- **Costs:** the older documents say they rest on experiment and "hearsay"; patents give design, not exact behaviour;
  tests need hardware; emulator code may itself rest on the tainted reference, and reading it concedes access.
- **Gains:** each route names its source; a test's origin is the measurement.
- **Used by:** this note uses the first three; the gaps it lists are where none of them reached.

### Firmware: required, replaced, or emulated at a high level

- **What:** ask the user for a BIOS, ship an independently written replacement, or provide the services in the emulator;
  for the Nintendo 64, reproduce what the PIF's boot leaves behind.
- **Costs:** `R0-02`'s options 4 to 6 record the legal side;
  replacements are closed-tier material under ADR 0001 when they are another project's,
  and high-level services differ in what games can observe.
- **Gains:** no maker code is shipped by the second and third.
- **Used by:** Mednafen requires a BIOS for the PlayStation 1, Saturn,
  and PC-FX and emulates the Game Boy Advance BIOS at a high level by default; Ymir requires the Saturn BIOS
  (Mednafen documentation, "Firmware/BIOS"; Ymir README).

## Implications for Rustalgia

- A scheduler for these systems interleaves several processors at different clocks,
  two of them identical on the Saturn and two of different architecture versions on the DS.
  This feeds `R2-03` and an ADR on the core's time base.
- The Nintendo 64's graphics and audio are programs on its signal processor,
  so the choice between low-level and high-level emulation of that processor shapes the whole core.
  This feeds `R1-16`, `R2-04`, and `R2-05`.
- Caches decide correctness on the Saturn and timing on the DS and Nintendo 64.
  Whether to model them feeds `R1-12`, `R1-16`, `R1-22`, and the quality targets (`R6-02`).
- The PlayStation 1 has gaps no clean source covers: the geometry engine's exact arithmetic,
  the GPU's dither and timing, frame timing, the sound chip's reverb and interpolation,
  the memory card and disc protocols.
  `R1-18` cannot fill them from the sources found;
  a hardware-test spike would be the route that leaves the least doubt (inference).
- Save types and cartridges are chosen from game databases on the Nintendo 64 and Saturn
  and by heuristics on the Game Boy Advance and DS.
  The database's origin and licence feed `R0-03` and `R2-11`.
- Firmware and disc protection differ in kind across the era; the routes are `R0-02`'s options 4 to 6,
  and the technique is `R2-12`.
- The 3DS and PlayStation 2 contain the DS and PlayStation 1 hardware,
  so cores written for this era can be reused by `R1-13` and `R1-19`, with the bridges this note describes.

## Open questions

- Does the PlayStation 1 CPU implement a TLB, and what is its main RAM type?
  A hardware test, or a decision on `R0-05` option 8.
- What are the PlayStation 1 GPU's dither matrix, fill rules, primitive limits, and drawing times,
  and the geometry engine's exact arithmetic and flags?
  Hardware tests; no clean document was found.
- What is the PlayStation 1 memory card's command protocol and the link cable's behaviour?
  Not found in any clean source.
- What are the Saturn control unit's DSP instruction set and the SCSP DSP's instruction set and envelope rates?
  The Yabause wiki refused automated access; a later read or `R1-22`.
- What is the priority between the DSi's old and new DMA channels?
  GBATEK marks it unknown; a hardware test.
- What do the Jaguar's custom processors do in their pipelines?
  No open source was found.
- Should the project honour ps1-bare-metal's request that AI agents not use it?
  A decision for the owner.

## Sources

Every source below was read on 2026-11-20.
For repositories, the commit given is the one read, where it was shown.

Makers' manuals, releases, and patents:

- Arm, Technical Reference Manuals DDI 0029G (ARM7TDMI, 2001), DDI 0201D
  (ARM946E-S, 2007),
  and DDI 0165B (ARM9E-S): `https://documentation-service.arm.com/static/5e8e1323fd977155116a3129`
  and sibling documents.
- Renesas, SH-1/SH-2/SH-DSP Software Manual, revision 5.00 (2004):
  `https://www.renesas.com/en/document/mas/sh-1sh-2sh-dsp-software-manual`.
- NEC, news release 97/11/14-01-01, VR4300 series specifications, archived copy of 2020-07-10 17:35:20:
  `https://web.archive.org/web/20200710173520/http://www.nec.co.jp/press/en/9711/1401-01.html`.
- Sony, EP0715277A2, EP0715276A2, EP1280150A2, US 5,793,376, US 5,850,540, and US 6,304,971;
  Nintendo and Silicon Graphics, US 6,331,856: `https://patents.google.com/patent/EP0715277A2/en` and sibling pages.
- Philips, US 5,483,619, patent office copy: `https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5483619`.
- The 3DO Company, WO 94/16383: `https://patents.google.com/patent/WO1994016383A1/en`.
- Sega, EP 0 682 341 and US 5,371,792: `https://patents.google.com/patent/EP0682341B1/en` and sibling page.

References and research:

- GBATEK, mGBA's copy, `gba.md`, `ds.md`, and `3ds.md`, commit `64b5087a` (2026-07-29):
  `https://raw.githubusercontent.com/mgba-emu/gbatek/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/ds.md` and sibling files.
- N64brew wiki, pages named in the findings, revisions of 2023 to 2026:
  `https://n64brew.dev/w/index.php?title=VR4300&action=raw` and sibling pages.
- J. Walker, "Everything You Have Always Wanted to Know about the Playstation", version 1.1 (2000):
  `http://hitmen.c02.at/files/docs/psx/psx.pdf`.
- Doomed, `system.txt`, `gpu.txt`, `gte.txt`, `spu.txt`, and `cdinfo.txt`
  (1999 to 2000): `http://hitmen.c02.at/files/docs/psx/system.txt` and sibling files.
- AmiDog's PSX wiki, `psx:cpu:division`, `psx:gte:opcodes`, `psx:gte:flags`:
  `https://psx.amidog.se/doku.php?id=psx:cpu:division` and sibling pages.
- ps2tek, commit `1c916606` (2022-01-27): `https://psi-rockin.github.io/ps2tek/`.
- Sacred Tech Scroll (Virtual Boy): `http://perfectkiosk.net/stsvb.html`.
- C. MacDonald, Sega Saturn hardware notes
  (last updated 2004-04-27)
  and Saturn VDP1 hardware notes (2003), lead, through the author's document index,
  because the VDP1 notes ask not to be linked directly: `http://www.dreamjam.co.uk/emuviews/docindex.php`.
- Yabause wiki, "SH-2 CPU", "SCU", "SMPC", "CDBlock", "VDP1", "VDP2", "SCSP", "Backup RAM Cartridge", "DRAM Cartridge"
  (revisions of 2008 to 2018): `https://wiki.yabause.org/index.php5?title=SCU` and sibling pages.
- Sega Retro, "VDP1 (Saturn)", "Saturn Custom Sound Processor", "Sega Saturn/Technical specifications":
  `https://segaretro.org/index.php?title=VDP1_(Saturn)&action=raw` and sibling pages.
- 3DO Development Repo wiki, hardware, memory mappings, matrix engine, VDL and cel processors, DSP,
  and encryption index: `https://3dodev.com/documentation/hardware` and sibling pages.
- The Audio Advance, "Direct Sound": `http://belogic.com/gba/directsound.shtml`.
- melonDS blog, posts of 2018-10-27, 2021-05-01, and 2025-12-01, lead:
  `https://melonds.kuribo64.net/comments.php?id=56` and sibling posts.
- DSiBrew, "Stage1" and "NAND": `https://dsibrew.org/wiki/Stage1` and sibling page.
- R. Copetti, Saturn, PlayStation, and Nintendo 64 articles, lead, commit `55b15767`:
  `https://raw.githubusercontent.com/flipacholas/Architecture-of-consoles/master/articles/sega-saturn.Rmd.md`
  and siblings.

Emulator and tool documentation, prose only:

- Mednafen documentation, PlayStation, Saturn, PC-FX, Virtual Boy, and Game Boy Advance pages
  (updated 2024-03-19): `https://mednafen.github.io/documentation/psx.html` and sibling pages.
- paraLLEl-RDP README: `https://raw.githubusercontent.com/Themaister/parallel-rdp/master/README.md`.
- N64Recomp README, commit `598ce208`: `https://github.com/N64Recomp/N64Recomp`.
- Ymir README and `docs/dev-notes`, commit `0fdabbdd`: `https://github.com/ymir-emu/ymir`.
- melonDS FAQ: `https://melonds.kuribo64.net/faq.php`.

Tests:

- SingleStepTests arm7tdmi README, commit `e3097d88`: `https://github.com/SingleStepTests/arm7tdmi`.
- ps1-tests, README and result logs, commit `f727802f`: `https://github.com/JaCzekanski/ps1-tests`.
- n64-systemtest README and `Cargo.toml`, commit `196f5421`: `https://github.com/lemmy-64/n64-systemtest`.
- PeterLemon/N64 README, commit `7085543e`: `https://github.com/PeterLemon/N64`.
- polyrastertest readme, commit `6fd29def`: `https://github.com/Jaklyy/PolyRasterTest`.

Tertiary:

- Wikipedia, revisions of May to November 2026, articles "MIPS architecture", "Delay slot", "Texture mapping",
  "PlayStation technical specifications", "PlayStation (console)", "PlayStation 2 technical specifications",
  "DualShock", "PlayStation Multitap", "Nintendo 64", "Nintendo 3DS", "Sega Saturn", "3DO", "Atari Jaguar", "PC-FX":
  `https://en.wikipedia.org/w/index.php?title=Nintendo_64&action=raw` and sibling pages.
