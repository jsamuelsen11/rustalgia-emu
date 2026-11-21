---
title: "The 32-bit and 64-bit era: primer"
roadmap_item: R1-02
status: draft
date: 2026-11-20
---

# The 32-bit and 64-bit era: primer

## Summary

This note asks how the consoles and handhelds of the 32-bit and 64-bit era work, and what that asks of an emulator.
In three of the five worked examples
(DS, Nintendo 64, Saturn),
processors on different clocks share memory or a bus; on four, graphics or sound depends on a coprocessor
or a DSP (inference), and on the Nintendo 64 that coprocessor runs programs the game supplies.
Caches become visible to software: on the Saturn they decide whether some games run at all.
Two points matter most to Rustalgia:
the Nintendo 64's choice between low-level
and high-level emulation of its signal processor shapes the whole core (inference),
and for the PlayStation 1 no clean source was found for the geometry engine's exact arithmetic,
the GPU's dither and timing, or the sound chip's reverb, so those wait on hardware tests or the owner's choice of route.
This note is not legal advice.

## Scope

- Question: how do the machines of the 32-bit and 64-bit era work, and what does that ask of an emulator?
- Worked examples: the Game Boy Advance, the Nintendo DS and DSi, the Nintendo 64, the PlayStation 1, and the Saturn,
  whose family surveys (`R1-11`, `R1-12`, `R1-16`, `R1-18`, `R1-22`) depend on this item;
  and the DS and PlayStation 1 hardware inside the 3DS and the PlayStation 2,
  because by the roadmap's rule for surveys that span several primers those systems belong to a later era,
  and `R1-13` and `R1-19` draw on this primer for the hardware they contain
  (research roadmap, "Hardware primers"; pull request #22).
  The 3DO, Jaguar, PC-FX, and Virtual Boy appear where they differ in kind.
- Left to other items: every system of the era and its hardware in one row each (`R1-06`); the Dreamcast (`R1-03`);
  the law on firmware, keys, and lock-outs (`R0-02`); techniques in depth (`R2-01` to `R2-15`); the emulators themselves
  (`R1-30` onward).
- Researched on 2026-11-20.
- How claims were checked: research agents fetched every source on 2026-11-20 as raw text
  (wiki raw exports, repository files at a pinned commit where shown, PDFs converted to text) and quoted from it.
  Two independent verification passes have run so far: in each,
  nine verifiers fetched the sources again and tested the claims and quotations
  (371, then 360),
  and a fix pass checked each finding against the raw source before applying it;
  the claims they could not check are listed in the pull request.
  Markers are those of `docs/research/README.md`; "(lead)" marks a source the register labels a lead.
  Wikipedia is a tertiary source, named wherever a fact rests on it.
  A statement that nothing was found records a search, not proof of absence.
- PlayStation 1 facts name their route.
  `R0-05` option 8 lists older documents with stated origins, makers' datasheets and patents, hardware tests,
  and open-tier emulators' code; this note reads no emulator code and adds open-tier emulator documentation
  and tertiary sources, named as such.
  The tainted reference was not opened, and no fact here is known only from it.
- No emulator source code, firmware, BIOS image, boot code, decompilation, key, game, or leaked material was opened.
  From emulator projects, only README files, documentation, and test-suite prose were read.

## Findings

### What accuracy means here

- The era moves the hard part of emulation from timing alone to timing plus arithmetic (inference).
  In four worked examples a processor or coprocessor beside the main CPU feeds graphics or sound:
  the Nintendo 64's signal processor runs graphics and audio "microcode",
  the PlayStation 1's geometry coprocessor does fixed-point transforms,
  the DS's geometry engine does matrix and vector multiplications, and the Saturn's control unit holds a DSP
  (N64brew, "Reality Signal Processor"; EP0715277A2, graphic module; GBATEK, "DS 3D Overview"; Wikipedia, "Sega Saturn",
  tertiary).
- One N64 test suite sorts its tests by the accuracy they need: a basic set, then accurate time,
  then a cycle-accurate emulator, off by default
  (n64-systemtest, `Cargo.toml` feature comments, read as prose; see "Options and trade-offs").

### Processors

#### Makers' manuals

- Arm serves the ARM7TDMI, ARM946E-S, and ARM9E-S manuals
  (DDI 0029G, 0201D, 0165B),
  each marked non-confidential and under the notice that no part of the information "may be adapted
  or reproduced in any material form except with the prior written permission of the copyright holder"
  (each manual, page ii).
  What that means for a software model is open, as `R0-05` records ("Processor and chip makers' manuals").
- Renesas serves the SH-1, SH-2, and SH-DSP software manual
  (revision 5.00, 2004)
  under notices that forbid reproduction without written consent and grant no licence
  (front matter: notice items 2 and 11, and item 6 of the Renesas Technology notice).
  It covers the core, pipeline, and instructions;
  a web search found the Saturn's SH7604 hardware manual only in third-party copies, not opened (research log).
- NEC published the VR4300 series' main figures itself in a 1997 news release, read in an archived copy: 133 MHz,
  a 32-bit bus, an on-chip MMU, high-speed floating point, and a 16 KiB instruction and 8 KiB data cache
  (NEC news release 97/11/14-01-01, capture of 2020-07-10).
  The full user's manual was found only on third-party hosts, which `R0-05` closes.
- No maker-hosted manual was found for the PlayStation 1's CPU core, the V810, the Jaguar's processors, the ARM60,
  or the 68EC020 (searches of the makers' hosts and the hubs in `R0-05`; research log).

#### Pipelines and delay slots

- MIPS I has a load delay slot and a branch delay slot, and ARM no branch delay slot
  (Wikipedia, "MIPS architecture" and "Delay slot");
  the PlayStation 1's CPU is R3000A-compatible (Wikipedia, "PlayStation technical specifications"), a MIPS I core
  (from memory).
  The SH-2 has delay slots on unconditional branches and on the delayed conditional branches `BT/S` and `BF/S`
  (Renesas SH-1/SH-2/SH-DSP software manual, section 6.1).
- The ARM7TDMI has three stages, so a read of the program counter sees it two instructions ahead,
  and one bus for code and data (ARM DDI 0029G, sections 1.1.1 and 1.1.2).
  The ARM9E-S inside the DS's ARM946E-S has five stages, separate code and data buses, and interlocks:
  a dependent instruction after a word load waits one core clock cycle, and after a byte, halfword,
  or unaligned load two (ARM DDI 0165B, sections 1.1.1 to 1.1.3 and 8.12.1).
- The SH-2 has five stages; its delayed branches take the target from the register as it was
  before the slot instruction ran; a branch in a delay slot raises an illegal-slot exception;
  a load whose result the next instruction uses stalls the pipeline; memory accesses, a multiply's included,
  compete with fetches, and a multiply waits for the previous one's multiplier
  (Renesas SH-1/SH-2/SH-DSP software manual, sections 4, 6.1.1, and 7.1.1 to 7.2.3).
  Basic instructions take one CPU clock cycle and a 32-by-32 multiply two to four (same manual, table 1.1).
- The Nintendo 64's VR4300 interlocks rather than exposing a load delay slot (inference):
  it stalls one CPU clock cycle when the next instruction "appears to use the result of the load",
  comparing register fields rather than actual use, so some independent pairs stall too
  (N64brew, "VR4300", "Load Delay Interlock").
  A cycle-exact core needs that rule; a functional one does not (inference).

#### Game Boy Advance

- The Game Boy Advance runs an ARM7TDMI at 16.78 MHz, in 32-bit ARM or 16-bit Thumb state,
  and keeps an 8-bit CPU for Game Boy and Game Boy Color cartridges (GBATEK, mGBA's copy, "GBA Technical Data").
  The Game Boy Advance survey (`R1-11`) therefore needs the Game Boy processor from `R1-01` as well (inference).
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
  (N64brew, "Reality Signal Processor" and its "CPU Core" page).
  A scalar and a vector instruction issue in the same cycle when paired, with exceptions; vector-register results,
  vector loads included, are ready after four cycles and scalar loads after three,
  and the pipeline stalls to enforce this
  (N64brew, "Reality Signal Processor/CPU Pipeline", from software's point of view).
- The geometry and audio stages run as microcode that games load into this core, usually Nintendo's stock microcode,
  and the display processor rasterises in hardware (N64brew, "Reality Signal Processor").
  Running them instruction by instruction or replacing them with host code is the central choice
  (inference; see "Options and trade-offs").
- A static recompiler turns Nintendo 64 functions into C,
  given an ELF file of symbols most easily obtained from a disassembly or decompilation,
  and handles branch delay slots "by duplicating instructions as necessary" (N64Recomp README).
  ADR 0001 closes decompilations, so as the README stands this route needs per-game material the project may not read
  (inference).

#### PlayStation 1

- Maker's patent: Sony's application (priority 1994) describes the CPU as a 32-bit RISC processor
  that "includes a command cache and a scratch pad memory", beside 2 MiB of main RAM and a 512 KiB ROM given as examples
  (EP0715277A2, description of the main controller module).
  The patent says "may be" and "for example" for the CPU type and sizes.
- Maker's patent: the same application describes the "geometry transfer engine" (GTE)
  as a coprocessor of the CPU doing coordinate transforms, lighting, vectors, and matrices in fixed point (EP0715277A2),
  at about 1.5 million flat-shaded polygons a second (EP0715277A2 and EP0715276A2).
  The patents do not give its arithmetic in detail.
- Older document: Joshua Walker's compilation of 2000 gives the clock as 33.8688 MHz,
  cached and uncached mirrors of RAM, and the BIOS at `0xBFC00000` (Walker, "The R3000A" and "The PSX Memory Map").
  It describes a 1 KiB write-through data cache and, separately, a 1 KiB scratch pad at `0x1F800000`,
  in paragraphs that read like a processor family manual's (inference); the patent names only a scratch pad.
  Its author took a console apart, searched the web, and "poked at emulators",
  and calls much of it "hearsay and logical deductions" (Walker, "Introduction").
- Older document with a stated method:
  Doomed's geometry document of 2000 says "Most of this is the result of experiment, so not all info might be correct",
  and gives cycle counts for each command and a rule that reading a coprocessor register
  while a command runs stalls the CPU (Doomed, `gte.txt`; reproduced in Walker's GTE chapter).
- Hardware test (the register records the wiki as its author's experiments; the page states no method):
  AmiDog writes that division by zero gives results consistent with a divider that works one bit at a time,
  gives a result for the most negative number divided by minus one, where some CPUs, x86 among them, raise an exception,
  and that "there are games out there which relies on this undefined behavior" (AmiDog's PSX wiki, `psx:cpu:division`).
  He also reports that the geometry engine decodes 64 functions, not only the documented ones
  (`psx:gte:opcodes`; his flag explanation is stated as a guess, `psx:gte:flags`).
- No clean source was found for the exact core variant and its system-coprocessor deviations, cache refill timing,
  the write buffer beyond Walker's one line, bus timing per region beyond the test below,
  or the geometry engine's register formats, saturation, and flags beyond the experimental documents
  (searches of the hubs in `R0-05`, Google Patents, and AmiDog's wiki,
  whose page on load-delay corner cases does not exist).
  They wait on the owner's choice of route (`R0-05`, option 8).

#### Saturn

- The Saturn has two SH-2s at about 28.6 MHz sharing one bus, a 68EC000 for sound, an SH-1 controlling the disc drive,
  and a system control unit with a DSP (Wikipedia, "Sega Saturn", technical specifications).
  Charles MacDonald, testing on a Saturn, gives two software-selected CPU clocks, 26.8465875 MHz and 28.63636 MHz
  (the faster needed for 352-pixel widths),
  shared with the video chips and the control unit
  (MacDonald, "Sega Saturn hardware notes", "NTSC Saturn timing"; lead).

#### Others, and what they share

- The 3DO runs an ARM60 at 12.5 MHz, with a matrix engine in its MADAM chip for fixed-point matrix multiplies,
  started by a register write and polled by the CPU
  (3DO Development Repo wiki, `hardware/opera/madam/matrix_engine`; Wikipedia, "3DO").
  The wiki states no origin; its other pages index 3DO's closed documents.
- The Virtual Boy's V810-family CPU has a 1 KiB instruction cache and no delay slot described (inference);
  a taken branch costs three cycles, and many timings are marked as needing research
  (Sacred Tech Scroll, "CPU - NVC/V810 Family Microprocessor").
  Mednafen's Virtual Boy and PC-FX modules offer a fast mode and an accurate one with cache emulation,
  saying that even then "the pipeline isn't correctly and fully emulated"
  (Mednafen documentation, `vb.html` and `pcfx.html`).
- The Jaguar has a 68000 at 13.295 MHz and two custom 32-bit RISC processors at 26.591 MHz,
  one in each of its "Tom" and "Jerry" chips, and a memory-controller flaw that limits running their code from main RAM
  (Wikipedia, "Atari Jaguar", citing a 2009 blog post for the flaw; tertiary, resting on a lead).
  No open source was found for their pipelines (web search and the hubs in `R0-05`).

### Memory, buses, and save media

#### One pool or several

- The Nintendo 64 has one pool of main memory, 4 MiB of RDRAM, reached by the CPU and, through the reality co-processor,
  by its display, video, and DMA engines; the Expansion Pak adds a second 4 MiB
  (N64brew, "RDRAM", "Expansion Pak", and "Memory map").
  Software typically finds the Expansion Pak by writing and reading back at 1 MiB steps
  (N64brew, "RDRAM", "Expansion Pak Detection"),
  so emulated memory must stop answering past its configured size (inference).
- The Saturn splits 2 MiB of CPU work RAM into a low and a high block of 1 MiB at different addresses,
  and gives each video chip and the sound side its own memory (MacDonald, "SH-2 Memory Map"; lead).
  Which bus each block sits on rests on Copetti's article,
  whose live page lists Sega's closed manuals as sources for that chapter (lead).
- The PlayStation 1 has three separate memories: 2 MiB of main RAM, 1 MiB of video RAM on the graphics chip,
  and 512 KiB of sound RAM (Wikipedia, "PlayStation technical specifications", citing a 1995 magazine; tertiary).
  The sources disagree on the main RAM's type: Wikipedia says EDO DRAM, Walker "four 512k 60ns SRAM chips"
  (Walker, "Memory"); no clean primary source was found to settle it.
- The DS has 4 MiB of main RAM shared by both CPUs, 32 KiB of work RAM that can be split between them,
  64 KiB for the ARM7 alone, nine video RAM banks whose addresses registers set, and memories on no CPU bus at all,
  such as the 3D engine's polygon RAM and 256 KiB of firmware flash
  (GBATEK, "DS Memory Maps" and "DS Memory Control - VRAM").
  When the shared work RAM belongs wholly to one CPU,
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
  that it is the data cache configured as a scratchpad rests on Wikipedia, citing a closed Sony manual (tertiary).
  Whether the core has a TLB is not settled: Walker describes a 64-entry TLB without saying how he checked it,
  his bibliography names a processor family manual, and no clean source says either way.
  A hardware test would settle it (inference).
- Each Saturn SH-2 selects, by the top three address bits, cached access, cache-through access, a purge area,
  direct access to its cache tags and data, or its on-chip registers
  (MacDonald, "SH-2 Memory Map", lead; Yabause wiki, "SH-2CPU").
  The two CPUs have no hardware cache coherency: shared data "should be read/written using cache-through addresses"
  (Yabause wiki, "SH-2CPU", "Caveats").
- Saturn games have coherency bugs that the hardware typically hides,
  "due to the effects of instruction fetches on the cache", and Mednafen keeps a per-game list of cache modes,
  mainly because full cache emulation costs much more host time (Mednafen documentation, `ss.html`, "Cache Mode").
  On this system, cache emulation is a correctness question, not only a timing one (inference).
- The DS ARM9's cache and tightly coupled memories sit off the system bus, so DMA cannot reach the latter,
  and software drains the write buffer before a DMA read and invalidates the cache after a DMA write
  (GBATEK, "DS DMA Transfers").
  A game that forgets to may depend on stale data, which only a cache model reproduces (inference).

#### Buses and wait states

- The Game Boy Advance's regions differ in width and speed: internal work RAM is 32-bit with single-cycle access,
  external work RAM 16-bit with 3, 3, and 6 cycles for 8-, 16-, and 32-bit accesses by default, and cartridge ROM 16-bit
  (GBATEK, "Address Bus Width and CPU Read/Write Access Widths").
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
  (N64brew, "Parallel Interface", "Domains" and "Open bus behavior").
- Hardware test (made on hardware by inference from the suite):
  a result log gives a PlayStation 1 CPU access about one cycle to the scratchpad, about five to main RAM,
  and far more to the BIOS ROM, growing with access width as from a narrow bus
  (ps1-tests, `cpu/access-time/psx.log`; inference).
  Another log shows byte and halfword writes to many I/O registers arriving as 32-bit writes of the CPU's whole register
  (`cpu/io-access-bitwidth/psx.log`; observed).
  The suite does not state its expected values' origin (`R0-05`).

#### DMA

- The Game Boy Advance has four DMA channels with fixed priority; the CPU stops while one runs;
  two feed the sound FIFOs, and GBATEK says only the fourth may move data to or from cartridge ROM,
  though it gives channels 1 and 2 a source in "any memory" (GBATEK, "GBA DMA Transfers").
- The DS has four channels for each CPU;
  the ARM9 keeps running during DMA only while it works in its caches or tightly coupled memories
  (GBATEK, "DS DMA Transfers").
  The DSi adds four more for each CPU, and their priority against the old ones is unknown
  (GBATEK, "DSi New DMA (NDMA)").
- The Nintendo 64's interfaces have their own DMA engines: the cartridge bus, the serial bus to the controller chip,
  the signal processor's memories, and audio and video fetches
  (N64brew, "Reality Signal Processor/Interface", "Serial Interface", "Memory map", and "Video Interface").
  Cartridge-to-RAM DMA, the only direction analysed in detail,
  splits at RAM page boundaries and has misalignment bugs that leave holes in RAM,
  which N64brew describes while saying that "the *actual* process implemented in the hardware is unknown"
  (N64brew, "Parallel Interface").
- The signal processor's memories are single-ported with "no bus arbiter":
  if the CPU and the RSP or its DMA touch them at once, one side's access is lost or corrupted
  (N64brew, "Reality Signal Processor/Interface", "DMEM and IMEM").
  An emulator that runs the two in turn never meets the conflict (inference).
- Older documents: the PlayStation 1 has seven DMA channels, for the video decoder in and out, the graphics chip,
  the disc drive, the sound chip, an expansion port, and clearing the ordering table,
  and the graphics channel can follow a linked list (Walker, "DMA"; Doomed, `system.txt`, "DMA").

#### Save media

- The Nintendo 64 cartridge offers serial EEPROM through the controller chip's channel,
  or SRAM or FlashRAM on the cartridge bus (N64brew, "PIF-NUS", "Joybus Protocol", "Flash", and "Memory map").
  Its original header has no save-type field
  (a homebrew convention adds one),
  and "emulators normally work using a game database which matches games using checksum to find out which savetype
  and controllers are expected by the game" (N64brew, "ROM Header").
  An emulator needs that database, whose terms `R0-03` governs (inference).
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
  No clean source was found for the card's read and write commands;
  Walker gives the shared bus timing and the byte that selects a card (`0x81`)
  (searches of Walker, Doomed, and the ps1-tests README).
- The Saturn keeps 32 KiB of battery-backed RAM on odd bytes only,
  and its cartridge slot takes backup-RAM cartridges or RAM-expansion cartridges of 1 MiB or 4 MiB
  (MacDonald, "SH-2 Memory Map", lead; Yabause wiki, "Backup RAM Cartridge" and "DRAM Cartridge").
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
  (N64brew, "Reality Display Processor/Pipeline"; GBATEK, "Depth Test" and `SWAP_BUFFERS`),
  while the PlayStation 1 and Saturn draw in the order software gives (below).

#### PlayStation 1

- Older documents: Doomed's GPU text says most of it "is the result of experiment"
  (`gpu.txt`, "About this document"), and Walker's GPU chapter reproduces it closely.
  Most of what follows rests on these, with Sony's patent US 5,793,376 where it agrees.
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
  (Wikipedia, "Texture mapping", uncited there; tertiary).
  The geometry engine returns integer screen coordinates with no fraction (Doomed, `gte.txt`, perspective transform).
  Together these give the console's characteristic texture warping and vertex jitter (inference).
- No clean source was found for the dither matrix, whether textures are point-sampled
  (only Wikipedia's "Nintendo 64" says so, citing a tutorial site; tertiary),
  the exact fill rule beyond the edge rule above, the limits on polygon size
  (the patent gives sprites of 1 by 1 to 256 by 256 dots, Doomed the fill command's maximum),
  or the GPU's drawing time (searches of Doomed's texts, Walker, the patent, ps1-tests, and Wikipedia).
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
  and blender once or twice per pixel, and copy and fill (N64brew, "Reality Display Processor/Pipeline").
  It rasterises with a coverage value for each pixel, optionally corrects texture coordinates for perspective,
  samples a 4 KiB texture memory ("Reality Display Processor"), filters, combines colours, compares depth,
  tests alpha and coverage, blends, and dithers 8-bit channels to 5 bits for 16-bit images
  (N64brew, "Reality Display Processor/Pipeline", "1-Cycle Pipeline").
- The video interface filters the image it scans out: it anti-aliases from the coverage values and can de-dither,
  for which it "looks at the 8 neighbors around each pixel and perform an error correction"
  (N64brew, "Video Interface").
  An emulator needs both the frame buffer and this filter (inference).
- paraLLEl-RDP renders the RDP with compute shaders on a host GPU
  and "aims to be bitexact with the Angrylion-Plus reference renderer where possible" (paraLLEl-RDP README).
  Its reference is an emulator the register closes, so bit-exactness is agreement with one emulator (inference).

#### Saturn

- VDP1 draws sprites, polygons, and lines into one of two frame buffers,
  which are swapped or erased at frame boundaries, and leaves priority and most other effects to VDP2
  (Yabause wiki, "VDP1"; Ymir `docs/dev-notes/system-info/vdp1-erase-swap-timings.txt`).
  Its commands are 32-byte tables in its own memory
  (Yabause wiki, "VDP1"):
  normal, scaled, and distorted sprites, polygons, polylines, and lines
  (MacDonald, "Saturn VDP1 hardware notes", from his own tests; lead).
- VDP1 maps textures forward, from texture points onto the quadrilateral
  (Copetti, Saturn article, lead; Sega Retro, "VDP1 (Saturn)", "Overview", names the term, citing a fan site).
  Some pixels are drawn twice, which applies shadow or half-transparency twice
  (Sega Retro, same, "Errata", uncited; MacDonald's VDP1 notes, from his own tests, lead);
  only Copetti ties this to forward mapping.
- VDP1 has no visible-surface hardware, so geometry must arrive in the right order,
  and Sega's library sorted polygons by approximate depth
  (Copetti, Saturn article, "An introduction to the visibility problem"; lead).
- VDP1's drawing time is visible to games (inference): as a per-game workaround,
  Mednafen slows VDP1 command execution for some titles when the SH-2s access it
  (Mednafen documentation, `ss.html`, "Horrible Hacks").

#### Game Boy Advance and DS

- The Game Boy Advance draws a 240 by 160 picture from four background layers, tiled or bitmap, and 128 objects
  (GBATEK, "Video" summary and the `DISPCNT` mode table).
  Objects have a budget of 1210 cycles a line, or 954 when software may reach object memory during horizontal blank
  (GBATEK, "Maximum Number of Sprites per Line"), four per dot, so system-clock cycles (inference).
- The DS has two 2D engines, each much like the Game Boy Advance's, and engine A adds a 3D layer
  (GBATEK, "DS Video" and "DS Video BG Modes / Control").
  The 3D hardware is a geometry engine, whose vertex
  and polygon memories swap at the next vertical blank (`SWAP_BUFFERS`), and a rendering engine that draws line by line:
  "There's only the 48-line cache (not a full 192-line framebuffer to store the whole rendered image)"
  (GBATEK, "DS 3D Overview").
  The limits are 2048 polygons and 6144 vertices a frame (GBATEK, `RAM_COUNT`).
  A whole-frame renderer cannot show what the hardware shows when a line is overloaded (inference).
- "Quads are natively handled and not converted to triangles,
  which is a bit of a problem as modern GPUs only support triangles"
  (melonDS blog, "The DS GPU and its fun quirks"; lead).
  The rasteriser fills one span per line between two edges, and depth is a Z or a W buffer chosen each frame
  (same post; GBATEK, `SWAP_BUFFERS`).
  polyrastertest's reference data was recorded on a New 3DS XL through TWiLight Menu++,
  and its author knows of no difference from other DS models (polyrastertest readme), so its oracle is a 3DS.

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
  sample players with decoders (PlayStation 1, Saturn, DS), the first two with their own sound RAM, envelopes,
  and effects; programmable processors whose software makes the sound
  (Nintendo 64, Jaguar, 3DO); and the Game Boy Advance's mix of the Game Boy's channels with sample FIFOs.

#### PlayStation 1

- Maker's patent: Sony's application describes a "sound processing unit
  or so-called SPU" with its own 512 KiB sound buffer, fed by the CPU and by the disc decoder
  (EP1280150A2, description).
  Its samples are 16-byte blocks holding 28 four-bit ADPCM samples and a parameter area with a shift, a filter choice,
  and loop flags, and one of four predictive filters is chosen per block (same).
  It was designed so that one decoder serves Sony's format and CD-ROM XA audio, unlike an older 9-byte,
  16-sample block (same).
- Maker's patent: each of 24 voices has its own pitch, a choice of sample or noise, an ADSR envelope, and two volumes;
  the mixer adds a separately controlled 16-bit input from the disc,
  and a reverberation unit mixes in delayed copies of the sum (EP1280150A2).
- The CD-I ADPCM levels, which CD-ROM XA players also decode, run at 37.8 kHz and 18.9 kHz
  (Philips US 5,483,619, description of FIG. 2, read as the patent office scan),
  and Walker describes a mode bit that turns ADPCM playback on and a filter command
  that plays only the sectors of one file and channel (Walker, CD-ROM chapter).
  Disc timing therefore reaches the audio mix (inference).
- No clean source was found for the reverb algorithm, the interpolation between samples, the envelope rate tables,
  or when the sound-RAM interrupt fires (searches of the patent family, Doomed, Walker, and ps1-tests).

#### Saturn

- The SCSP (Yamaha YMF292) has 32 slots, each playing 8- or 16-bit PCM, normally from sound RAM, or acting as FM,
  a built-in DSP with ring-buffer registers, and three timers
  (Yabause wiki, "SCSP"; part number from Sega Retro, "Sega Saturn/Technical specifications").
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
  at a rate a timer sets (GBATEK, "GBA Sound Controller" and "GBA Sound Channel A and B - DMA Sound"; The Audio Advance,
  "Direct Sound").
  The output is a PWM stream whose rate and depth a register selects, 9-bit at 32.768 kHz by default
  (GBATEK, `SOUNDBIAS`).
- The DS has 16 channels under the ARM7, each playing 8- or 16-bit PCM or IMA-ADPCM,
  six with square waves and two with noise; each channel's rate is a timer at half the bus clock
  (GBATEK, "DS Sound Hardware" and "DS Sound Channels 0..15").
  GBATEK documents rounding and clipping in the DS's ADPCM decoder that differ from the formula as written,
  and channels start one, three, or eleven samples late by kind (GBATEK, "IMA-ADPCM Format" and "DS Sound Notes").

#### Others

- The 3DO's sound is a custom DSP in its CLIO chip
  (Wikipedia, "3DO"; tertiary);
  the 3DO Company's patent describes a processor that restarts its program every programmed number of clock ticks,
  which its example sets to one CD audio sample (568 ticks)
  (WO 94/16383, description; 3DO Development Repo wiki, `opera/dsp`).
- The Jaguar's "Jerry" chip holds a 32-bit DSP for sound, with the number of channels limited by software
  (Wikipedia, "Atari Jaguar"; tertiary).

### Timing, synchronisation, and input

#### Clocks and frames

- In three of the five worked examples, processors share memory or a bus on different clocks
  (inference from the findings above):
  the DS's ARM9 at twice its bus clock beside an ARM7, the Nintendo 64's CPU at 1.5 times the signal processor's clock,
  and the Saturn's two SH-2s beside a 68EC000 on the sound side's own clock.
  The PlayStation 1's CPU shares the bus with sound and video chips that have their own memories,
  whose clocks no clean source found gives (searches of Walker and Doomed); the Game Boy Advance runs one CPU at a time.
  A scheduler for the era interleaves several processors, not one CPU and its peripherals (inference).
- The Game Boy Advance's system clock is 16.78 MHz
  (exactly 2^24 Hz);
  a line is 308 dots of four cycles and a frame 228 lines, about 59.737 Hz
  (GBATEK, "System Clock", "Horizontal Dimensions", and "Vertical Dimensions").
  In Game Boy Advance mode a DS runs at half its 33.51 MHz bus clock, about 16.76 MHz,
  slightly slower than a Game Boy Advance, which GBATEK marks "probably" (GBATEK, "DS Backwards-compatible GBA-Mode").
- The DS bus clock is 33.513982 MHz; the dot clock is a sixth of it, and a frame of 263 lines runs at 59.8261 Hz
  (GBATEK, "DS Display Dimensions / Timings").
- The Nintendo 64's CPU runs at 93.75 MHz, 1.5 times the 62.5 MHz master clock,
  a quarter of the 250 MHz RDRAM clock from which all but video and audio derive,
  and the signal processor runs at 62.5 MHz;
  the video clock comes from a crystal at four times the colour subcarrier and differs by region
  (N64brew, "Clock Timing" and "Reality Signal Processor").
  Video timing is programmed by software through the video interface's registers, not fixed
  (N64brew, "Video Interface"), and the audio rate follows the video clock (see "Audio").
- Maker's patent: Sony's patent (priority 1993) describes a game system, not named,
  whose CPU works partly from its instruction cache and coordinate calculator so
  that it can release the system bus to a controller moving drawing commands and image data (US 5,850,540, description).
  Exact frame timing beyond the line count and frame length the timer log below measures, cycles per line,
  and dot-clock frequencies have no clean source found
  (searches of Walker, Doomed, AmiDog's wiki, whose page on the counters does not exist, and ps1-tests,
  whose timer log prints dot clocks as labels with no stated origin).

#### Interrupts and inter-processor signalling

- Each DS CPU has its own interrupt registers,
  and the two signal each other through a small register with an interrupt request and through two 16-word FIFOs
  (GBATEK, "DS Interrupts" and "DS Inter Process Communication (IPC)").
  The ARM9's divider and square-root unit take a fixed number of 33.51 MHz cycles and report a busy flag,
  which GBATEK tells an interrupt handler using the unit to wait on before it returns
  (GBATEK, "DS Maths" and "IRQ Notes").
- Older documents: the PlayStation 1 has four root counters (Doomed, `system.txt`; Walker, "Root Counters").
  Hardware test (by inference from the suite): a log covers three, in which timer 1, clocked by horizontal blank,
  counts 263 per frame on an NTSC system, and timer 2 can run at the system clock divided by eight
  (ps1-tests, `timers/psx.log`).
  The interrupt controller's layout, DMA priority and timing, the line on which vertical blank interrupts,
  and the disc and sound interrupts have no clean source beyond Walker, Doomed, and ps1-tests' `dma/chopping` test
  (same searches).

#### Input and peripherals

- Nintendo 64 controllers and cartridge EEPROMs use the Joybus protocol run by the console's PIF microcontroller:
  the CPU writes a command frame into 64 bytes of PIF RAM and a DMA read makes the PIF run the whole exchange
  (N64brew, "Serial Interface", "PIF-NUS", and "Joybus Protocol").
- The Saturn's system manager is a 4-bit Hitachi microcontroller with its own program ROM that switches the second SH-2,
  the 68000, and the disc block on and off, keeps time, changes the system clock, and polls the controllers
  (Yabause wiki, "SMPC"; MacDonald, lead).
- Older document: PlayStation 1 controllers and memory cards share one serial bus with a select line per port,
  a 250 kHz clock, and an acknowledge pulse from the device after each byte but the last (Walker, "Controllers").
  Walker gives the link cable's speed and wiring ("Serial I/O"); its register-level behaviour has no clean source found
  (searches of Walker, Doomed, and the ps1-tests README).

### Media, protection, and firmware

The law on firmware, keys, and lock-outs is in `R0-02`
("Firmware, keys, and game copies" and "Anti-circumvention law in the United States");
this section records what the hardware does.

#### Kinds of firmware

- The firmware an emulator of this era meets falls into four kinds
  (inference from the findings below):
  a BIOS for the main CPU (PlayStation 1, Saturn, Game Boy Advance, DS);
  firmware for a drive controller on its own processor
  (the PlayStation 1's disc controller, the Saturn's SH-1);
  firmware for a lock-out microcontroller
  (the Nintendo 64's PIF and the cartridge's CIC); and boot ROMs that verify the next stage (DSi; DSiBrew, "Stage1").

#### PlayStation 1

- Older document: the CPU reaches the disc controller through four byte-wide ports,
  and the controller runs commands asynchronously, some answering at once and delivering their real result by a second,
  queued interrupt (Doomed, `cdinfo.txt`; repeated in Walker, "The CD-ROM").
  Its modes select double speed, XA audio streaming, sector size, and a file and channel filter (same).
  Doomed says much is missing and the rest may be partly wrong (`cdinfo.txt`, opening).
  Its command names are those of Sony's library, so it may draw on that library's documentation (inference).
- Older document: the BIOS is 512 KiB at `0xBFC00000`, the reset vector,
  and its services are reached by jumping to one of three call tables with a function number in a register
  (Walker, "The PSX Memory Map", "Exception Handling", and appendix B; Doomed, `system.txt`).
  An emulator that runs games without the BIOS must provide these services itself (inference).
- Maker's patent: Sony's patent describes a security code stored
  as a radial wobble of the pits in the table-of-contents area, a 22.05 kHz carrier keyed on and off,
  read from the pick-up's RF signal through a band-pass filter, and checked before a second check of licence data
  (US 6,304,971, detailed description, FIG. 1 to FIG. 5).
  An ordinary drive reads the data but not the wobble
  (Wikipedia, "PlayStation (console)", "Copy protection system"; tertiary),
  so a disc image does not hold it and an emulator accepts the image in its place (inference).
- No clean source was found for the BIOS boot sequence, the executable format,
  the disc controller's own processor and command timings, or the subchannel protection that some PAL discs use
  (from memory) (searches of Walker, Doomed, AmiDog's wiki index, Mednafen's prose, and Wikipedia).

#### Saturn

- The Saturn's double-speed drive is run by its own SH-1
  (Wikipedia, "Sega Saturn"),
  and the disc block holds up to 202 raw sectors, 200 of them reachable from the CPUs, filters sectors into buffers,
  and can feed an add-on board such as the MPEG card (Yabause wiki, "CDBlock").
- Only the first 16 sectors of a Saturn game disc can be read until the disc block and the BIOS approve it;
  audio discs and other formats are unlocked at once (Yabause wiki, "CDBlock", "Authenticating and unlocking CD").
  Sega's patents, which do not name the Saturn,
  describe checking a pit-formed mark beside the read-in area against reference data
  (EP 0 682 341, main embodiment)
  and, with 1992 priority, a boot sector holding a disc identifier and a security code (US 5,371,792).
  A standard disc image, which holds only the data sectors, does not hold the mark (inference).

#### Nintendo 64

- The PIF on the board is a Sharp SM5 microcontroller with its own firmware;
  it holds the first two boot stages for the CPU in a 1984-byte ROM, which the CPU reads one serial transfer at a time,
  so the first stage copies the second into the signal processor's memory to run it
  (N64brew, "PIF-NUS", "Internal ROMs and RAM" and "Console startup").
  The PIF locks its ROM before the game runs.
- Each cartridge holds a CIC, which sends the PIF a region identifier and a checksum of the boot code in the cartridge;
  a cartridge boots only with the boot code its CIC expects (N64brew, "PIF-NUS", "Console startup").
  After boot the game must talk to the PIF within about five seconds,
  and the PIF and CIC keep exchanging data while powered, so removing the cartridge halts the CPU (same page).
- An emulator that boots a game without the PIF's firmware must reproduce what the boot leaves behind (inference).
  N64brew describes the 6105 and 7105 challenge as 15 bytes each way through PIF RAM but gives no response algorithm,
  and no clean description of it was found
  (N64brew, "PIF-NUS", command `0x02`; its "CIC-NUS" page was not read past the key material it shows).

#### Game Boy Advance and DS

- The Game Boy Advance cartridge header carries a compressed Nintendo logo that the BIOS compares with its own copy,
  locking up on a mismatch, a fixed byte, and a checksum (GBATEK, "GBA Cartridge Header").
  The bytes of the logo are not recorded; `R0-02` covers the logo ("Firmware, keys, and game copies").
- The DS has a 4 KiB BIOS for the ARM9, a 16 KiB BIOS for the ARM7,
  and firmware in a serial flash of 256 KiB on the Nintendo DS that holds settings, Wi-Fi calibration,
  and boot code and data (GBATEK, "DS Firmware Serial Flash Memory" and "DS Firmware Header"; melonDS FAQ).
  Only the ARM7 BIOS can read its own protected region (GBATEK, "DS Memory Control - BIOS").
- DS cartridges are read with 8-byte commands in three phases, the second and third encrypted,
  and an 8-byte identifier at the start of the secure area is checked after decryption
  (GBATEK, "DS Cartridge Protocol" and "DS Cartridge Secure Area").
  The encryption needs data held in the BIOS
  (GBATEK, "DS Memory Control - BIOS"),
  so a dump that is not decrypted cannot be run without it (inference);
  `R0-02` records why keys and their handling matter.
- The 3DS's mode register selects 3DS, DS or DSi, or Game Boy Advance mode;
  in Game Boy Advance mode the cartridge is served from the 3DS's RAM and registers emulate the save chip and clock
  (GBATEK, 3DS part, `ARM7_CNT`, "3DS Config - ARM7 Registers", and `FCRAM_MODE`).

#### Others

- The PlayStation 2's input-output processor is the PlayStation 1's CPU,
  with the geometry engine and video decoder kept for compatibility;
  from model SCPH-7500x it was replaced by a PowerPC-based part
  (Wikipedia, "PlayStation 2 technical specifications"; tertiary).
  Two PlayStation 2 hardware generations therefore run PlayStation 1 games by different means (inference).

### Tests and their oracles

- The Nintendo 64 has open tests run on a console: krom's tests "on a real N64 using a 64drive Cartridge",
  under the Unlicense (`R0-05`, "Test suites"; PeterLemon/N64 README). n64-systemtest covers coprocessor registers,
  exceptions, and the TLB and is deprecated in favour of nemu64-test; neither states where its expected values came from
  (n64-systemtest README; `R0-05`).
- The DS has polyrastertest, recorded on a 3DS
  (see "Video"),
  and the Game Boy Advance has open suites that state no source for their expected results (`R0-05`, "Test suites").
- The ARM7TDMI vectors are generated by an emulator and record cycle numbers that the README calls experimental,
  not yet correct counts (SingleStepTests arm7tdmi README); no vectors were found for the ARM946E-S, the SH-2,
  or the V810 (register and `R0-05`).
- For most of this era the oracle is a console the project would run tests on, or another emulator (inference).

## Options and trade-offs

The options answer separate questions and can be combined.

### Low-level or high-level emulation of microcode and DSPs

- **What:** run the Nintendo 64's signal processor instruction by instruction,
  or recognise the programs games load and replace them with host code;
  the Saturn's control-unit DSP and the sound DSPs pose the same choice (inference).
- **Costs:** low-level costs host time and needs the processor documented; high-level needs each program recognised,
  and games with their own microcode break it (inference; see "Nintendo 64" under "Video").
- **Gains:** low-level runs any program as the hardware does; high-level is fast (inference).
- **Used by:** paraLLEl-RDP emulates the display processor at the low level, beside a low-level signal processor
  (paraLLEl-RDP README); no emulator's choice for the signal processor itself was read.

### Interpreter, cached interpreter, or recompiler

- **What:** how the main CPUs run: one instruction at a time, from decoded blocks, or translated to host code.
- **Costs:** a recompiler may lose timing detail that some tests need
  (n64-systemtest, `Cargo.toml`: "most likely this wouldn't be implementable by a dynamic recompiler");
  an interpreter may be too slow for the Saturn's two CPUs on a phone (inference).
- **Gains:** a recompiler reaches full speed on weak hosts (inference).
- **Used by:** no emulator's choice was read for this note; `R2-01` and `R3-01` take the question up.

### Cache emulation

- **What:** model the SH-2, DS ARM9, and Nintendo 64 caches; model data caches only; or ignore caches.
- **Costs:** on the Saturn, full models cost host time,
  and partial ones break games with coherency bugs the hardware hides (Mednafen documentation, `ss.html`, "Cache Mode").
- **Gains:** fixes for "various logic and timing issues" in those games (same).
- **Used by:** Mednafen's Saturn module chooses per game from a list (same).

### Accurate or enhanced 3D

- **What:** reproduce the hardware's fixed-point results, edge rules, and dithering,
  or render on the host GPU with higher resolution and precision.
- **Costs:** accurate rendering on a host GPU needs compute shaders or software;
  enhancement changes what games show and breaks effects that depend on exact pixels (inference).
- **Gains:** fidelity to the hardware, or a sharper image.
- **Used by:** paraLLEl-RDP aims at bit-exactness with an emulator's renderer where possible (README);
  a melonDS developer says its OpenGL renderer cannot be fully faithful
  (melonDS blog, "Introducing the compute renderer"; lead).

### How PlayStation 1 facts are sourced

- **What:** `R0-05`'s option 8 routes (see "Scope").
- **Costs:** the older documents rest on experiment, "hearsay"
  (Walker, "Introduction"),
  and emulators; patents give design, not exact behaviour (inference); tests need hardware;
  emulator code may rest on the tainted reference (`R0-05`).
- **Gains:** each route names its source; a test's origin is the measurement (`R0-05`, option 8).
- **Used by:** this note uses the first three, Wikipedia as a tertiary source, and emulator documentation;
  the gaps it lists are where none of them reached.

### Firmware: required, replaced, or emulated at a high level

- **What:** ask the user for a BIOS, ship an independently written replacement, or provide the services in the emulator;
  for the Nintendo 64, reproduce what the PIF's boot leaves behind.
- **Costs:** `R0-02`'s options 4 and 5 record the legal side;
  replacements are closed-tier material under ADR 0001 when they are another project's,
  and high-level services differ in what games can observe (inference).
- **Gains:** the second and third need no maker code at all; the first needs the user to supply it.
- **Used by:** Mednafen asks for BIOS images for the PlayStation 1, Saturn,
  and PC-FX and emulates the Game Boy Advance BIOS at a high level by default; Ymir requires the Saturn BIOS
  (Mednafen documentation, `psx.html`, `ss.html`, and `pcfx.html`, "Firmware/BIOS", and `gba.html`, "BIOS"; Ymir
  README).

## Implications for Rustalgia

- A scheduler for these systems interleaves several processors, mostly at different clocks,
  two identical SH-2s on the Saturn and two different ARM cores on the DS (inference).
  This feeds `R2-03` and an ADR on the core's time base.
- The Nintendo 64's geometry and audio stages are programs on its signal processor,
  so the choice between low-level and high-level emulation of that processor shapes the whole core (inference).
  This feeds `R1-16`, `R2-01`, `R2-04`, `R2-05`, and `R2-06`.
- Caches decide correctness on the Saturn (Mednafen, `ss.html`) and timing on the DS (inference).
  Whether to model them feeds `R1-12`, `R1-16`, `R1-22`, and the quality targets (`R6-02`).
- The PlayStation 1 has gaps no clean source covers: the geometry engine's exact arithmetic,
  the GPU's dither and timing, frame timing, the sound chip's reverb and interpolation, the memory card protocol,
  and the disc controller's timings.
  `R1-18` cannot fill them from the sources found; a hardware-test spike would leave the least doubt (inference).
- Emulators choose Nintendo 64 save types and Saturn cartridges from game databases
  (N64brew, "ROM Header"; Mednafen, `ss.html`, "Cart"),
  and use identifier strings or heuristics on the Game Boy Advance and DS.
  The database's origin and licence feed `R0-03` and `R2-11`.
- Firmware differs in kind across the era; the routes are `R0-02`'s options 4 to 6, and the technique is `R2-12`.
- The 3DS and PlayStation 2 contain parts of the DS and PlayStation 1 hardware
  (the PlayStation 1's CPU on early PlayStation 2 models, not its graphics chip),
  so cores written for this era may be reused in part by `R1-13` and `R1-19` (inference).

## Open questions

- Does the PlayStation 1 CPU implement a TLB, and what is its main RAM type?
  A hardware test, or a decision on `R0-05` option 8.
- What are the PlayStation 1 GPU's dither matrix, fill rules, polygon size limits, and drawing times,
  and the geometry engine's exact arithmetic and flags?
  Hardware tests; no clean document was found.
- What is the PlayStation 1 memory card's command protocol and the link cable's behaviour?
  Not found in Walker, Doomed, or the ps1-tests README.
- What are the Saturn control unit's DSP instruction set and the SCSP DSP's instruction set and envelope rates?
  The Yabause wiki's "SCU" and "SCSP" pages do not give them; `R1-22`.
- What is the priority between the DSi's old and new DMA channels?
  GBATEK marks it unknown; a hardware test.
- What do the Jaguar's custom processors do in their pipelines?
  No open source was found.

## Sources

Every source below was read on 2026-11-20.
For repositories, the commit given is the one read, where it was shown.

Makers' manuals, releases, and patents:

- Arm, Technical Reference Manuals DDI 0029G (ARM7TDMI, 2001), DDI 0201D (ARM946E-S, 2007), and DDI 0165B
  (ARM9E-S, 2000):
  `https://documentation-service.arm.com/static/5e8e1323fd977155116a3129`,
  `https://documentation-service.arm.com/static/5e8e3ee588295d1e18d3aa82`,
  and `https://documentation-service.arm.com/static/5e8e2f18fd977155116a77fb`.
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
- N64brew wiki, revisions current on 2026-11-20: "VR4300" (5928), "Clock Timing" (5926), "Memory map" (5763), "RDRAM"
  (5529), "Expansion Pak" (5328), "Reality Signal Processor" (4813) and its "/CPU Core" (5539), "/CPU Pipeline" (5618),
  and "/Interface" (5376), "Reality Display Processor" (5675) and "/Pipeline" (5674), "Parallel Interface" (5761),
  "Serial Interface" (5663), "PIF-NUS" (5759), "Joybus Protocol" (5942), "Flash" (5773), "ROM Header" (5943), "Video
  Interface" (5791), "Audio Interface" (5924): `https://n64brew.dev/w/index.php?title=VR4300&action=raw` and sibling
  pages.
- J. Walker, "Everything You Have Always Wanted to Know about the Playstation
  But Were Afraid to Ask", version 1.1 (2000): `http://hitmen.c02.at/files/docs/psx/psx.pdf`.
- Doomed, `system.txt`, `gpu.txt`, `gte.txt`, `spu.txt`, and `cdinfo.txt`
  (1999 to 2000): `http://hitmen.c02.at/files/docs/psx/system.txt` and sibling files.
- AmiDog's PSX wiki, `psx:cpu:division`, `psx:gte:opcodes`, `psx:gte:flags`
  (last modified 2012-09-18 to 2012-10-23): `https://psx.amidog.se/doku.php?id=psx:cpu:division` and sibling pages.
- ps2tek, commit `1c916606` (2022-01-27): `https://psi-rockin.github.io/ps2tek/`.
- Guy Perfect, Sacred Tech Scroll (Virtual Boy), 2026-05-21: `http://perfectkiosk.net/stsvb.html`.
- C. MacDonald, Sega Saturn hardware notes
  (last updated 2004-04-27)
  and Saturn VDP1 hardware notes (2003), lead, through the author's document index,
  because both ask not to be linked directly: `http://www.dreamjam.co.uk/emuviews/docindex.php`.
- Yabause wiki, "SH-2CPU", "SCU", "SMPC", "CDBlock", "VDP1", "VDP2", "SCSP", "Backup RAM Cartridge", "DRAM Cartridge"
  (last modified 2008 to 2018),
  read as rendered pages because the raw export returns the main page
  (research log): `https://wiki.yabause.org/index.php5?title=SCU` and siblings.
- Sega Retro, "VDP1 (Saturn)" and "Sega Saturn/Technical specifications", which now serve a bot check,
  checked against the captures of 2026-04-29 02:37:27 and 2026-10-16 13:07:04:
  `https://segaretro.org/index.php?title=VDP1_(Saturn)&action=raw` and sibling page.
- 3DO Development Repo wiki, hardware, memory mappings, matrix engine, VDL and cel processors, DSP, and encryption index
  (hub last modified 2026-02-20): `https://3dodev.com/documentation/hardware` and sibling pages.
- The Audio Advance, "Direct Sound": `http://belogic.com/gba/directsound.shtml`.
- melonDS blog, posts of 2018-10-27, 2021-05-01, and 2025-12-01, lead:
  `https://melonds.kuribo64.net/comments.php?id=56`, `?id=143`, and `?id=241`.
- DSiBrew, "Stage1" (last edited 2024-01-22): `https://dsibrew.org/wiki/Stage1`.
- R. Copetti, Saturn article, lead, commit `55b15767`, and its live page's source list:
  `https://raw.githubusercontent.com/flipacholas/Architecture-of-consoles/55b15767fe439663dff04eceb4a3fbdc68abdd8f/articles/sega-saturn.Rmd.md`
  and `https://www.copetti.org/writings/consoles/sega-saturn/`.

Emulator and tool documentation, prose only:

- Mednafen documentation, PlayStation, Saturn, PC-FX, Virtual Boy, and Game Boy Advance pages
  (updated 2024-03-19): `https://mednafen.github.io/documentation/psx.html` and sibling pages.
- paraLLEl-RDP README, commit `1cecd042`:
  `https://raw.githubusercontent.com/Themaister/parallel-rdp/1cecd042/README.md`.
- N64Recomp README, commit `598ce208`: `https://github.com/N64Recomp/N64Recomp`.
- Ymir README and `docs/dev-notes`, including `system-info`, commit `0fdabbdd`: `https://github.com/ymir-emu/ymir`.
- melonDS FAQ: `https://melonds.kuribo64.net/faq.php`.

Tests:

- SingleStepTests arm7tdmi README, commit `e3097d88`: `https://github.com/SingleStepTests/arm7tdmi`.
- ps1-tests, README and result logs, commit `f727802f`: `https://github.com/JaCzekanski/ps1-tests`.
- n64-systemtest README and `Cargo.toml`, commit `196f5421`: `https://github.com/lemmy-64/n64-systemtest`.
- PeterLemon/N64 README, commit `7085543e`: `https://github.com/PeterLemon/N64`.
- polyrastertest readme, commit `6fd29def`: `https://github.com/Jaklyy/PolyRasterTest`.

Tertiary:

- Wikipedia, revisions current on 2026-11-20: "MIPS architecture" (1386787582), "Delay slot" (1374222988),
  "Texture mapping" (1382835507), "PlayStation technical specifications" (1362538225), "PlayStation (console)"
  (1386319193), "PlayStation 2 technical specifications" (1355643867), "Nintendo 64" (1386077971), "Sega Saturn"
  (1384300813), "3DO" (1383977414), "Atari Jaguar" (1386053059), "PC-FX" (1352943842):
  `https://en.wikipedia.org/w/index.php?title=Nintendo_64&action=raw` and sibling pages.
