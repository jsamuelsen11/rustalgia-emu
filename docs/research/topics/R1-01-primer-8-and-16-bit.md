---
title: "8-bit and 16-bit consoles and handhelds: primer"
roadmap_item: R1-01
status: approved
date: 2026-11-21
---

# 8-bit and 16-bit consoles and handhelds: primer

## Summary

This note asks how the consoles and handhelds of the 8-bit and 16-bit era work, and what that asks of an emulator.

Their processors, video chips, sound chips, and cartridges run in parallel from divided clocks,
and games change hardware state part-way through a frame, a line, or an instruction,
so the order and timing of bus accesses are visible to software.
For the NES and SNES the hubs name published games that fail unless components are interleaved per line,
and often per dot or per cycle, and for the Game Boy games that depend on cycle-level quirks.

Three points matter most to Rustalgia: a machine is a set of chip revisions and a region, not one model;
colour and sound output are analogue models, for some of which the sources say no single answer is correct;
and firmware dependence ranges from none to firmware every game calls,
so the questions [`R0-02`][r0-02] records reach several systems of this era.
This note recommends a master-clock scheduler with catch-up and separate clock domains,
selectable revisions and output models, and hardware-referenced test programs as the acceptance oracle,
each with its reasons in "Options and trade-offs" for the owner to decide.

## Scope

- Question: how do the machines of the 8-bit and 16-bit era work, and what does each subsystem ask of an emulator?
- Covered: processors; memory, buses, and cartridges; video; audio; timing, synchronisation, and input; media,
  protection, and firmware.
  The worked examples are the systems of three family surveys that depend on this item: Game Boy
  and Game Boy Color ([`R1-10`][fam]), NES and SNES ([`R1-15`][fam]), and Master System, Game Gear, and Genesis
  (Mega Drive) ([`R1-22`][fam]).
  [`R1-25`][fam] (arcade) and [`R1-26`][fam]
  (other consoles and handhelds)
  and the home computers catalogue ([`R1-09`](../../roadmap/research.md#hardware-primers)) also depend on this item.
  Other systems of the era appear where they differ in kind.
- Left to other items: one row for every system sold ([`R1-05`][r1-05]); emulators of each family
  ([`R1-10`][fam] to [`R1-27`][fam]);
  arcade boards ([`R1-25`][fam]); the law on firmware, lock-outs, and logos
  ([`R0-02`][r0-02], cited by section);
  scheduling, rendering, and audio as engineering topics ([`R2-01`][ph2] to [`R2-15`][ph2]).
- Researched on 2026-11-20; most wiki pages are pinned by revision and most repositories by commit in the Sources,
  which say where a page showed none.
- How claims were checked: research agents fetched every source on 2026-11-20 as raw text and copied quotations from
  that text.
  Two independent verification passes followed, each of nine verifiers who saw only this note:
  each fetched the sources again the same day and tested each claim and quotation,
  the second pass working on the text the first pass had corrected.
  Each correction was checked against the source once more before it was applied;
  claims the passes could not check are weakened, marked, or listed in the pull request.
- A later pass the same day answered the note's open questions.
  It read fullsnes, which refuses scripts, in a Web Archive capture, and [Sega Retro][sr-spec] live,
  so the claims that rested on them alone are now checked.
  The patents are read from the patent office's copies, because Google Patents refused the verification passes.
  A third independent pass of two verifiers, one for claims and quotations and one for links and shape,
  then fetched the sources again and tested that pass's text;
  its corrections were checked against the sources and applied, so three independent verification passes have run.
- Process calls settled here, and listed in the pull request:
  - fullsnes and Pan Docs's "The Cartridge Header" are named without links,
    their addresses in code spans in the Sources,
    because fullsnes holds a disassembly of the SNES sound boot ROM and the Pan Docs page holds the boot logo's bytes;
    the conventions keep a page that holds firmware out of links, and neither part was read.
  - The Sharp datasheets and data books behind the SM83 identification are third-party copies,
    which [ADR 0001][adr1]'s order of tests closes
    ([`R0-05`][r0-05-o5], option 5),
    so the identification is cited through [Gekkio's reference][gbctr] and they are not opened or linked.
- A claim with no marker rests on the original text. "(lead)" marks a fact from a personal page
  that [`R0-05`][r0-05] labels a lead, which [the conventions][markers] treat as not relied on.
  Wikipedia is a tertiary source and is named wherever a fact rests on it alone.
  Statements that nothing was found record a search, not proof of absence.
- Open-tier emulator code ([jgenesis][jgenesis], [BlastEm][blastem], [ares][ares-dma], [bsnes][bsnes-hpp],
  and [SameBoy][sameboy-shader]) was read only to see which value an emulator uses,
  as [ADR 0001][adr1] allows for the open tier; nothing was copied, and each such finding says so.
  No firmware, boot ROM, disassembly, game, key, closed code, or tainted source was opened.
  Where a hub says a fact comes from a maker's closed manual or from firmware, the finding says so.

## Findings

### What accuracy means here

- The NESdev wiki separates accuracy, matching the console on an unknown program, from compatibility with known games,
  and says accuracy cannot be measured directly; test programs and games that rely on obscure behaviour are a good,
  though not perfect, predictor (NESdev wiki, ["Accuracy"][nes-acc]).
- Components run in parallel and many games rewrite video registers and cartridge banks several times a frame:
  "This switching must be fairly fine-grained" (NESdev wiki, ["Catch-up"][nes-catchup]).
- The Game Boy, which drives its own LCD, can pause pixel output;
  home consoles "are on a schedule imposed by the screen they are hooked up to"
  (Pan Docs, ["Rendering"][pd-rend], footnote).
- Master clocks come from three kinds of source:
  - NTSC NES and Master System consoles use multiples of the 3.579545 MHz colour subcarrier,
    and PAL models the PAL subcarrier or a crystal of their own
    (NESdev wiki, ["CPU"][nes-cpu]; SMS Power, ["Clock Rate"][sms-clockrate]).
  - The Neo Geo AES's 24.167829 MHz is not a whole multiple of a subcarrier
    (NeoGeo Development Wiki, ["Framerate"][ngd-fps], a page that says its figures need scope measurements; calculated).
  - The Game Boy's 4.194304 MHz and the WonderSwan's approximately 12.288 MHz are unrelated to television
    (Pan Docs, ["Specifications"][pd-spec]; WSdev wiki, ["Timing"][ws-timing]; inference from the rates).
- None of the frame rates found is exactly 60 Hz or 50 Hz:
  - NES NTSC 60.0988 Hz (NESdev wiki, ["Cycle reference chart"][nes-cyc]);
  - SNES NTSC 60.09880627 Hz (fullsnes, "SNES Timing Oscillators"; 21,477,270 / (262 × 1364 − 2) gives the same,
    calculated);
  - Game Boy 59.73 Hz (Pan Docs, "Specifications");
  - Neo Geo MVS 59.1856 Hz, from the same page as the AES clock (NeoGeo Development Wiki, "Framerate");
  - WonderSwan by default about 75.47 Hz (WSdev wiki, "Timing").
- A host display cannot show these rates one-to-one, so frame pacing or resampling absorbs the difference (inference).

### Processors

#### The 6502 family

- The NES CPU is a Ricoh 6502 core without decimal mode, in the RP2A03 (NTSC) or RP2A07 (PAL)
  (NESdev wiki, ["CPU"][nes-cpu], ["2A03"][nes-2a03]).
  Die-photograph research found the decimal correction disabled by removing a few transistors
  ([Breaks, "Ricoh"][breaks], in the project's English machine translation, by its folder name (observed));
  the D flag can still be set, but arithmetic stays binary (NESdev wiki, ["Status flags"][nes-flags]).
  MOS Technology patented decimal correction of its binary adder ([US 3,991,307][us3991307]).
- Every 6502 cycle is a bus read or a bus write
  (NESdev wiki, "CPU"),
  so a cycle-accurate core performs the dummy reads and writes,
  which matter where they hit registers with side effects (inference).
- The NMOS 6502's decode logic is defined for 151 of 256 opcodes; the rest do strange things,
  among them mixtures of two instructions, nothing at all, or crashing the processor
  (Wikipedia, ["MOS Technology 6502"][wp-6502]),
  and some halt the CPU until reset (NESdev wiki, ["CPU unofficial opcodes"][nes-unof]).
- NESdev says an accurate NES emulator must implement every instruction, official or not,
  and lists games that use the unofficial ones (NESdev wiki, "CPU unofficial opcodes").
  For one opcode the result "will depend on the exact model of CPU, the variations of chip manufacture,
  the power supply and the temperature"
  (Visual6502 wiki mirror on NESdev, ["6502 Opcode 8B (XAA, ANE)"][nes-xaa]),
  so an emulator picks a model of it and documents it (inference).
- WDC's datasheet lists how its CMOS W65C02S differs from the NMOS part: undefined opcodes are NOPs of defined lengths,
  one to three bytes, read-modify-write does two reads and one write instead of one read and two writes,
  D is cleared on interrupt, and an interrupt during a BRK fetch lets the BRK run first
  ([WDC W65C02S datasheet][wdc02], Table 7-1).
  A CMOS core is a different model, not an option on the NMOS one (inference).
- "65C02" names several instruction sets: the SingleStepTests suite ships separate sets for the MOS 6502, the NES 6502,
  and the Synertek, Rockwell, and WDC 65C02s
  ([SingleStepTests 65x02 README][sst-65x02]), so each system must name its variant (inference).
- The PC Engine (TurboGrafx-16)'s HuC6280 is a 65C02-based Hudson CPU with an on-chip timer, sound generator,
  and MMU of eight mapping registers giving a 2 MB physical address space in 8 KiB pages,
  and runs at 1.79 MHz or 7.16 MHz (Wikipedia, ["Hudson Soft HuC6280"][wp-huc6280], a page tagged as having one source,
  a HuC6280 hardware manual hosted by a third party,
  which is not linked or opened because ADR 0001 closes maker manuals that others host).
  MacDonald, who gives the low speed as 1.78 MHz, says the CSL and CSH instructions switch the speed,
  and reports from tests that block-transfer instructions cannot be interrupted, so an interrupt waits until one ends
  ([MacDonald, "TurboGrafx-16 Hardware Notes"][macd], sections 1 and 2; lead).
- NES games depend on cycle detail: *Battletoads* on the page-crossing penalty,
  *Cobra Triangle* on a dummy read acknowledging an APU interrupt,
  and *Spelunker* on the interrupt poll point when NMI is enabled while the vertical-blank flag is already set
  (NESdev wiki, ["Tricky-to-emulate games"][nes-tricky]).

#### The 65C816 and the SNES

- The SNES S-CPU is the Ricoh 5A22: a WDC 65C816 core plus multiply and divide units, DMA and HDMA, joypad ports,
  and interrupt timing, with a 24-bit "Bus A" and an 8-bit "Bus B"
  (SNESdev wiki, ["65C816"][sd-65816]; Wikipedia, ["Ricoh 5A22"][wp-5a22], a page tagged as having one source).
- WDC's datasheet gives the 65C816's extra cycles for 16-bit operation, a non-zero direct-page low byte, page crossing,
  and taken branches, and separate vectors for native and emulation mode
  ([WDC W65C816S datasheet][wdc816], Table 3-1 and Table 5-7 notes, Tables 5-2 and 5-3).
  The SNES resets into emulation mode
  (SNESdev wiki, ["CPU vectors"][sd-vectors]), so both modes need full timing (inference).
- On the SNES a CPU cycle takes 6, 8, or 12 master clocks by address and fast-ROM setting, internal cycles taking 6
  (SNESdev wiki, ["Timing"][sd-timing]):
  the datasheet counts cycles, and the console sets each cycle's length by the address accessed (inference).
- Revisions differ: the first 5A22 can crash when a DMA ends right before HDMA,
  and the second can fail a DMA after a recent HDMA to the display register (SNESdev wiki, ["Errata"][sd-errata]).
  The errata page cites forum threads, the open-tier higan and bsnes code, other community pages,
  and the closed SNES Development Manual, whose "Documented Problems" section ends its general references;
  these two items carry no inline citation, so they may rest on the manual and need another source (inference).
  Items it cites to higan or bsnes were probably written after reading an implementation (inference).

#### The Z80 and the SM83

- The Z80 runs the Master System (SMS Power, ["Clock Rate"][sms-clockrate],
  ["Interrupt Mechanism"][sms-interruptmechanism]), and the Game Gear, SG-1000, and ColecoVision
  (from memory),
  is the sound CPU of the Genesis ([MacDonald, "Sega Genesis hardware notes"][macd], section 2; lead),
  and runs at 4 MHz in the Neo Geo (NeoGeo Development Wiki, ["Clock"][ngd-clock]).
  The Master System divides a 53.6931 MHz crystal (NTSC) by 15 for the CPU and sound chip (SMS Power, "Clock Rate").
- The Z80's maskable interrupt has three modes, two of which read the data bus: mode 0 an instruction,
  mode 2 the low byte of a table address; with no device driving the bus,
  the value depends on the board's pull resistors
  (SMS Power, "Interrupt Mechanism"), so it is a property of the console (inference).
  The Master System wires NMI to its Pause button (SMS Power, ["Pause Button"][sms-pausebutton]).
- After SCF and CCF, flag bits 5 and 3 depend on whether the previous instruction changed the flags,
  a fact found in 2012; the behaviour differs between Zilog and some other makers' parts and on some boards is unstable
  ([z80test readme][z80test]).
- A Z80 core keeps hidden state, including an internal register called MEMPTR
  (z80test readme),
  which the SingleStepTests vectors record as WZ beside a field tracking whether the flags were modified
  and one tracking whether `LD A,I` or `LD A,R` ran last
  ([SingleStepTests z80 README][sst-z80]; that WZ is MEMPTR is from memory).
- z80test compares results with "values obtained from a real 48K Spectrum with Zilog Z80 CPU"
  (z80test readme), the only hardware-derived Z80 oracle among the test sets read (z80test, SingleStepTests z80).
- The Game Boy's core "hasn't publicly been given a name by either Sharp or Nintendo"; Gekkio reports that,
  from Sharp datasheets and data books
  (copies hosted by third parties, closed by [ADR 0001][adr1]'s order of tests ([`R0-05`][r0-05-o5], option 5),
  so not opened; see [Scope](#scope)), it has been identified as Sharp's SM83,
  "or at least something that is 100% compatible with it"
  ([Gekkio, "GB: Complete Technical Reference"][gbctr], chapter 4).
- The SM83 lacks the Z80's I/O instructions, index and alternate registers, and the DD, FD, and ED prefix groups,
  keeping most of the CB group, and adds its own loads; "The unused (-) opcodes will lock up the Game Boy CPU when used"
  (Pan Docs, ["CPU Comparison with Z80"][pd-z80]).
  It makes at most one memory access per four-clock machine cycle
  and overlaps each fetch with the previous instruction's last cycle
  (GB: Complete Technical Reference, sections 2.2 and 6.1).
- Game Boy interrupts: EI takes effect one instruction late, dispatch takes five machine cycles,
  and HALT with interrupts disabled and one pending usually reads the next byte twice,
  with exceptions after EI and before RST (Pan Docs, ["Interrupts"][pd-int], ["halt"][pd-halt]).

#### The 68000

- Motorola's manual sets a bus cycle of "four clock periods
  (eight bus cycle states)"
  plus wait states, with instruction times as total clocks and read and write counts
  ([Motorola, "M68000 User's Manual"][m68k], ninth edition, sections 5.8 and 8, on NXP's site;
  its title page conveys no patent licence).
  Multiply times depend on the operand's bits, and divide times vary by under 10% between best and worst case
  (same, section 8.3), so timing depends on data.
- Interrupts have seven levels checked between instructions, level 7 unmaskable,
  and an odd word access raises an address error (same, sections 6.3.2 and 6.3.10).
  Plutiedev says many emulators skip address errors, so bugs go unnoticed until the program runs on a console
  (Plutiedev, ["Hardware issues"][pl-issues]; lead).
- The Genesis runs the 68000 at about 7.67 MHz and the Z80 at about 3.58 MHz on NTSC, by MacDonald's notes,
  which say everything in them was checked on hardware
  ([MacDonald, "Sega Genesis hardware notes"][macd], section 1.3; lead).
  Sega Retro gives a 53.693175 MHz NTSC master clock and 53.203424 MHz PAL,
  citing a Sega service manual hosted as a closed file,
  with the 68000 and YM2612 at 7.670454 MHz and the Z80 and sound generator at 3.579545 MHz
  (Sega Retro, ["Sega Mega Drive/Technical specifications"][sr-spec]);
  these are the master clock divided by 7 and 15 (calculated from the rates).
- The same page gives the video chip 13.423294 MHz and a 6.711647 MHz pixel clock on NTSC,
  the master clock divided by 4 and 8 (calculated), with no source on those lines (observed);
  that pixel clock fits one of the chip's modes only, which the page does not say (inference).
- Plutiedev reports that on most consoles TAS does not write back, while one later Genesis board does
  (Plutiedev, "Hardware issues"; lead).
- The Neo Geo runs its 68000 at 12 MHz, and cartridge pins select wait states that some games depend on
  (NeoGeo Development Wiki, ["Clock"][ngd-clock], ["Wait cycle"][ngd-wait]).
- The Sega CD (Mega CD)'s second 68000 runs at 12.5 MHz by Sega's own data page for the Mega-CD, model HAA-2910,
  read in a 2013 capture because the live page refuses scripts ([Sega, "Mega-CD data"][segajp]); Wikipedia
  (["Sega CD"][wp-segacd]) cites the same page.
  The MegaDrive Wiki's 12 MHz is in its infobox with no reference (MegaDrive Wiki, ["Mega CD"][mdw-mcd]; observed).

#### Others, and what they share

- The Intellivision's CP1610 has 10-bit instruction words (Wikipedia, ["General Instrument CP1600"][wp-cp1600]).
- The WonderSwan's NEC V30MZ stalls for DMA
  because only the CPU's quarter of the memory-access cycle can reach the cartridge bus
  (WSdev wiki, ["NEC V30MZ"][ws-v30], ["Timing"][ws-timing]).
  Unlike the V20 and V30, it is "fully compatible with the Intel 80186's documented behaviour,
  as well as some of its undocumented behaviour", and lacks the V20's opcode extensions (WSdev wiki, "NEC V30MZ").
  So the hardware-captured V20 test set does not fit it, and the 80186 set fits at most its documented results;
  the 80186's cycle counts are a different chip's (inference).
- For the Neo Geo Pocket's TLCS-900/H no maker manual was found among Wikipedia's references,
  whose Toshiba product page was not opened, and [the register][register] closes or walls the two test sets
  (Wikipedia, ["Neo Geo Pocket"][wp-ngp]).
- On the 6502, CLI, SEI, and PLP can delay an IRQ by one instruction, while RTI takes effect at once
  (NESdev wiki, ["CPU interrupts"][nes-cpuint]),
  and the V30MZ delays interrupts after prefixes
  (WSdev wiki, ["NEC V30MZ interrupts"][ws-v30int]);
  with the SM83 and 68000 rules above, each core needs its own sampling point (inference).
- Clocks change at run time: HuC6280 speed ([MacDonald][macd]; lead), Game Boy Color double speed
  (Pan Docs, ["CGB Registers"][pd-cgbregs]),
  and SNES cycle length by address (SNESdev wiki, ["Timing"][sd-timing]); Neo Geo wait states differ by cartridge
  (NeoGeo Development Wiki, ["Wait cycle"][ngd-wait]).
  A CPU cycle is not a stable unit of time; a master clock is (inference).

### Memory, buses, and cartridges

#### Open bus and mirrors

- On the NES, "reading open bus repeats the last value that was read from the bus before this read",
  and controller ports drive only some bits, so the rest repeat the previous read, usually the address high byte,
  which some games need (NESdev wiki, ["Open bus behavior"][nes-openbus]).
- On the SNES, open bus decays in about two frames by a forum test, and the 5A22 has an internal data bus of its own
  (SNESdev wiki, ["Open bus"][sd-openbus]).
  On the Game Boy's external bus, pull-up resistors make undriven reads return 1 bits,
  unless bits were driven low shortly before ([GB: Complete Technical Reference][gbctr], "Undriven bus values").
  On the Genesis, reads of one unused range return the high byte of the next instruction fetch,
  and another range locks the machine ([MacDonald, "Sega Genesis hardware notes"][macd], section 1; lead).
  Open bus is a property of each console, not of the CPU family (inference).
- Incomplete decoding repeats memory, such as NES work RAM every 2 KiB
  (NESdev wiki, ["Mirroring"][nes-mirror]), and test programs probe the mirrors ([AccuracyCoin README][accoin]).

#### NES cartridges

- The cartridge owns `0x4020`–`0xFFFF`, sees nearly every CPU access, and routes the PPU's pattern and nametable fetches
  (NESdev wiki, ["CPU memory map"][nes-cpumap], ["PPU memory map"][nes-ppumap]).
- A "mapper" maps memory into both spaces and may add save RAM, scanline interrupts, sound, or arithmetic;
  the community numbers them in a catalogue that NES 2.0 extends
  (NESdev wiki, ["Mapper"][nes-mapper], ["NES 2.0"][nes-nes2]).
  A Nintendo patent filed in 1987 describes a cartridge controller taking bank numbers from the CPU
  ([US 4,949,298][us4949298]).
- Mappers reach into CPU timing: the MMC1 ignores the data bit of a write on the cycle after another,
  though never its reset bit, and two games depend on the two halves of that rule
  (NESdev wiki, ["MMC1"][nes-mmc1]),
  and the MMC3 counts scanlines from a PPU address line, with revisions differing (NESdev wiki, ["MMC3"][nes-mmc3]).
- Writes to some discrete mappers meet ROM driving the bus; the wiki recommends the AND of both values,
  from a forum test (NESdev wiki, ["Bus conflict"][nes-conflict]).
- The console reads its reset and interrupt vectors from the cartridge and no header
  (NESdev wiki, "CPU memory map"; that no header exists is inference).
  One purpose of NES 2.0 is removing "the need to use ROM checksums, or other information outside the header",
  for behaviour the older format did not encode
  (NESdev wiki, "NES 2.0"), so emulators rely on file headers and catalogues (inference).
- Whether a board has save RAM must be carried too: a few games misbehave if RAM appears where they expect open bus
  (NESdev wiki, ["Open bus behavior"][nes-openbus]).

#### SNES memory and coprocessors

- On the SNES, RAM and I/O mirrors sit in banks `0x00`–`0x3F` and `0x80`–`0xBF`,
  and banks `0x7E`–`0x7F` hold the whole 128 KiB of work RAM (SNESdev wiki, ["Memory map"][sd-map]).
  Sound RAM belongs to the sound CPU, which the main CPU reaches only through four ports
  (SNESdev wiki, ["S-SMP"][sd-ssmp]), at `0x2140`–`0x2143` and mirrored up to `0x217F` (fullsnes, "SNES I/O Map").
- Cartridges use LoROM, HiROM, or ExHiROM layouts, and the internal header's place varies with the layout;
  it "is not needed by the SNES hardware", and emulators locate it by checking each candidate's checksum,
  with scoring heuristics when no checksum is valid (SNESdev wiki, "Memory map", ["ROM header"][sd-header]).
- General DMA stops the CPU until it completes (SNESdev wiki, ["DMA registers"][sd-dma]), at 8 master clocks per byte
  (SNESdev wiki, ["Timing"][sd-timing]),
  and HDMA writes registers at horizontal blank on the lines its table selects (SNESdev wiki, "DMA registers").
  A Nintendo and Ricoh patent describes DMA by
  which "it is possible to change display data during the horizontal blanking period without the intervention of the
  CPU" ([US 5,291,189][us5291189]); that this is HDMA is inference.
- Cartridges add processors: the SA-1, Super FX, Cx4, DSP-n chips, and decompressors, each with its own map
  (fullsnes, "SNES Cartridges").
  fullsnes lists on-chip ROM in the DSP-n, ST01n, and Cx4 chips, and describes the DSP-n chips as NEC uPD77C25 CPUs
  (same section),
  so low-level emulation of them needs chip firmware, a closed dependency
  (inference; [`R0-02`][r0-02-fw], "Firmware, keys, and game copies").
  The SNESdev Super FX page cites the closed SNES Development Manual
  (SNESdev wiki, ["Super FX"][sd-superfx]), so facts from it need another source.

#### Game Boy memory

- The map holds two ROM windows, video, external, and work RAM, an echo range, sprite memory, I/O, and high RAM;
  the Color banks video and work RAM (Pan Docs, ["Memory Map"][pd-map]).
  Of the echo range, "Nintendo prohibits developers from using this memory range", with no source given (same page).
- One unused range reads differently on each hardware family
  (same page),
  and video memory is blocked to the CPU while the video chip uses it
  (Pan Docs, ["Accessing VRAM and OAM"][pd-vram]), so the model changes memory behaviour (inference).
- The header names the cartridge's controller; controllers add a real-time clock, rumble, flash, EEPROM,
  or an accelerometer (Pan Docs, ["MBCs"][pd-mbcs] and controller pages),
  so saves span three memory types and a clock must keep time between sessions (inference).
- During sprite DMA the original Game Boy's CPU can reach only high RAM,
  while on the Color it can reach a bus the DMA is not using
  (Pan Docs, ["OAM DMA Transfer"][pd-oamdma]);
  the DMA unit decodes addresses its own way ([GB: Complete Technical Reference][gbctr], section 9.1).

#### Sega memory

- Sega's 8-bit mapper, "used in 99% of software", switches 16 KiB slots by writes that also land in RAM
  (SMS Power, ["Mappers"][sms-mappers]);
  other mappers exist (same page), and the header has no field for them
  (observed in SMS Power, ["ROM header"][sms-romheader]), so detection needs a catalogue (inference).
  A port switches BIOS, card, cartridge, and expansion slots into one range (SMS Power, ["Port $3E"][sms-port3e]).
- The Genesis's 68000 must take the Z80's bus before touching Z80 RAM,
  and the Z80 sees 68000 space through a 32 KiB window
  ([MacDonald, "Sega Genesis hardware notes"][macd], sections 2.2 and 2.3, lead; MegaDrive Wiki,
  ["Zilog Z80"][mdw-z80]).
  Either CPU can stall the other (inference).
  How long the 68000 waits when the Z80 takes its bus was not found in that page,
  [Sega Retro's specifications page][sr-spec], MacDonald's hardware notes,
  Plutiedev's ["Hardware issues"][pl-issues] and ["Using the Z80"][pl-z80], or [jgenesis's bus comments][jgenesis-bus].
- During video DMA from 68000 memory "the 68000 is frozen"
  ([MacDonald, "Sega Genesis VDP documentation"][macd], section 11; lead),
  and a source cannot cross a 128 KiB boundary (Plutiedev, ["DMA transfer"][pl-dma]; lead); each fact rests on one lead.
- For a length of zero, MacDonald gives `0xFFFF` (same, section 11; lead) and Plutiedev 65536
  (Plutiedev, ["Hardware issues"][pl-issues]; lead).
  The open-tier emulators [jgenesis][jgenesis], [BlastEm][blastem], and [ares][ares-dma] all run 65536 transfers
  (observed in their code at the commits in the Sources; for ares, inference from its 16-bit length counter).
  Plutiedev adds that early emulators treating a zero length as no transfer made many old Sonic hacks load garbage,
  which implies consoles transfer 65536 (Plutiedev, "Hardware issues"; lead, and the implication is inference).
  No hardware test was found among the test suites in the Sources.
- Saves use battery RAM on odd bytes (Plutiedev, ["Saving progress with SRAM"][pl-sram]; lead)
  or a serial EEPROM in a few games (MacDonald, "Sega Genesis hardware notes", section 4.1; lead).
- The Sega CD's word RAM is handed between its two 68000s, changing both maps (MegaDrive Wiki, ["Mega CD"][mdw-mcd]).

#### Other systems' memory

- The WonderSwan's "SoC features an unified memory architecture"
  (WSdev wiki, ["Memory map"][ws-map]),
  and the Lynx copies cartridge data to RAM before use (Wikipedia, ["Atari Lynx"][wp-lynx]).
- Without hardware in the cartridge, an Atari 2600 game can occupy at most 4 KB of address space;
  larger games switch banks, the first 8K game being *Asteroids*, which switches two 4K segments
  (Wikipedia, ["Atari 2600"][wp-2600], the 4 KB limit in a footnote).
  The page dates *Asteroids* to 1980 in one place and 1981 in another (observed).
  The bank-switching schemes are left to [`R1-26`][fam].

### Video

#### NES

- NTSC has exactly 3 PPU dots per CPU cycle, PAL 3.2, and "Dendy" clones 3 again
  (NESdev wiki, ["Cycle reference chart"][nes-cyc]), so a game meets three timing profiles by region (inference).
  One dot is skipped on odd frames while rendering is on, so frame length depends on a register
  (NESdev wiki, ["PPU frame timing"][nes-ppuframe]).
- While rendering is on, the PPU fetches at fixed dots of each line
  (NESdev wiki, ["PPU rendering"][nes-ppurend]),
  and cartridge chips watch those fetches
  (NESdev wiki, ["MMC2"][nes-mmc2], ["MMC3"][nes-mmc3]);
  *Marble Madness* switches character banks mid-line (NESdev wiki, ["Tricky-to-emulate games"][nes-tricky]).
- After eight sprites, a bug in the overflow search gives false results
  (NESdev wiki, ["PPU sprite evaluation"][nes-spreval]),
  and sprites are prioritised among themselves before the background, which *Super Mario Bros.
  3* uses (NESdev wiki, ["PPU sprite priority"][nes-sprprio]).
  Games poll the sprite-0 hit flag to time scroll splits; *Battletoads* hangs without it on the right line
  (NESdev wiki, ["PPU registers"][nes-ppuregs], "Tricky-to-emulate games").
- "Unlike many other game consoles, the NES does not generate RGB or YUV and then encode that to composite"
  (NESdev wiki, ["NTSC video"][nes-ntsc]);
  on NTSC its artefacts change with each line and each frame, and on PAL and Dendy with each line only (same page).
- A palette entry is the colour of a large flat area
  (NESdev wiki, ["PPU palettes"][nes-pal]), so a signal model is needed to reproduce the artefacts (inference).
  The wiki concludes that "no single composite palette can match the intended display of every possible game title"
  (same page).
- NTSC pixels have an 8:7 aspect ratio on a 4:3 display (NESdev wiki, ["Overscan"][nes-overscan]).

#### SNES

- A line is normally 1364 master clocks, with short or long lines on some fields and a 40-clock refresh pause
  (SNESdev wiki, ["Timing"][sd-timing]).
- Eight background modes, changeable mid-screen; 128 sprites with per-line limits of 32 sprites and 34 slivers;
  the sprite limit drops the highest OAM indices, and the sliver limit, evaluated in reverse, the lowest
  (SNESdev wiki, ["Backgrounds"][sd-bg], ["Sprites"][sd-sprites]),
  which the wiki takes from a forum test and the open-tier bsnes code.
- Colour maths blends a main and a sub screen, and windows hide layers or the blend per line
  (SNESdev wiki, ["Color math"][sd-math], ["Windows"][sd-windows]),
  so the renderer keeps two screens per line (inference).
- 512-pixel output blurs on composite televisions, and some games rely on that to blend alternating columns
  ("pseudo hi-res") (SNESdev wiki, "Backgrounds").
- Mode 7 maps the screen to a background through a matrix of four 8.8 fixed-point values
  (SNESdev wiki, ["Mode 7 transform"][sd-mode7]),
  in an arrangement a Nintendo and Ricoh patent describes
  ([US 5,327,158][us5327158]; its link to the SNES is inference);
  pixel-exact output depends on rounding the pages read do not give (inference).
- The one-chip SNES has a sharper picture and, by a video comparison the wiki cites,
  first-line glitches in games that extend vertical blank with forced blank
  (SNESdev wiki, ["Version differences"][sd-versions]), so a correct picture is relative to a revision (inference).

#### Game Boy

- A frame is 154 lines of 456 dots (Pan Docs, ["Rendering"][pd-rend]; 456 calculated from the mode durations);
  the drawing period lengthens with scroll, window, and sprites, shortening horizontal blank
  (same page), so interrupt timing depends on what is drawn (inference).
  The chip draws through FIFOs (Pan Docs, ["Pixel FIFO"][pd-fifo]),
  the level of model that reproduces mid-line effects (inference).
- At most 10 sprites per line; overlap priority is by X in monochrome mode and by table order in Color mode
  (Pan Docs, ["OAM"][pd-oam]).
  On the original a status-register write can raise a spurious interrupt that two games need
  (Pan Docs, ["STAT"][pd-stat]).
- The Mealybug Tearoom tests check mid-line changes; their expected images come from the author's emulator,
  with photographs of devices alongside ([Mealybug Tearoom README][mealybug]).
- The Color's colours look different on an sRGB screen without correction (Pan Docs, ["Palettes"][pd-pal]).
- No measurement of how the original Game Boy's LCD blends successive frames was found:
  every Pan Docs source file at the commit read, and the text of [GB: Complete Technical Reference][gbctr],
  were searched for "ghost", "blur", "motion", and words beginning "persist".
- The open-tier [SameBoy][sameboy-shader] offers frame blending off, an even mix of the current and previous frames,
  and an "accurate" setting that gives the previous frame a weight of one third or two thirds on alternate lines
  (observed in its shader at the commit in the Sources; nothing copied).
  That is one emulator's model, not a hardware measurement.

#### Sega

- Four Sega video chips descend from the TMS9918 and treat its legacy modes differently;
  MacDonald names Master System and Game Gear games that do not work properly on the Genesis's chip
  ([MacDonald, "Sega Master System VDP documentation"][macd], sections 1 and 13; lead).
  The first chip zooms only the first four of eight sprites on a line horizontally; the rest are doubled vertically
  (same, section 10; lead).
- The Game Gear crops each Master System line to its middle 240 pixels
  and compresses them into its LCD using colour sub-elements;
  how it fits the lines vertically MacDonald could not determine, though he suggests some rows are skipped
  (same, section 14; lead).
- The Genesis caches some sprite attributes, which *Castlevania: Bloodlines* exploits
  (Plutiedev, ["Sprites"][pl-sprites]; lead).
  Colour-memory writes during display show as dots
  (MegaDrive Wiki, ["VDP"][mdw-vdp]),
  which some Sonic games hide under ripple sprites (Plutiedev, ["Sonic water"][pl-water]; lead).
- Kabuto's notes, nearly all from "running my own tests and guesswork" and partly from the web and discussions,
  give a fixed per-line pattern of memory slots and the DMA speeds that follow
  ([Kabuto, "SEGA Mega Drive / Genesis hardware notes"][pl-kabuto], on Plutiedev; lead).
- The colour DAC is not linear; Plutiedev gives approximate levels,
  notes that the die's DAC taps are evenly spaced and suggests analogue effects cause the curve,
  and says the levels differ by revision (Plutiedev, ["VDP color ramp"][pl-ramp]; lead).
- MacDonald's Genesis video document says "All the register names are taken from the manual"
  ([MacDonald, "Sega Genesis VDP documentation"][macd], section 17; lead);
  this note takes that to be Sega's closed manual (inference), so facts known only from it need a second source.

#### Others

- Hudson's patent describes the PC Engine's sixteen-per-line sprite limit:
  "the seventeenth sprite which is designated to be displayed is not displayed"
  ([US 4,951,038][us4951038]); that it is the PC Engine is inference.
  MacDonald's notes give three software-chosen dot clocks
  ([MacDonald, "TurboGrafx-16 Hardware Notes"][macd], section 6; lead)
  but swap two chip numbers relative to Wikipedia (["TurboGrafx-16"][wp-tg16]).
- The Neo Geo composes each line into line buffers from sprites that "can't be zoomed, they can only be shrunk"
  (NeoGeo Development Wiki, ["Line buffers"][ngd-lb], ["Sprites"][ngd-sprites]).
- The Atari 2600 holds one line of graphics and stops the CPU until the line ends on request
  (Wikipedia, ["Television Interface Adaptor"][wp-tia]), so CPU timing is display timing (inference).
- The WonderSwan has "no canon palette" (WSdev wiki, ["Display/Palette"][ws-pal]), and the Vectrex draws vectors
  (Wikipedia, ["Vectrex"][wp-vectrex]).

### Audio

- The era's sound hardware is of four kinds: tone generators, Yamaha FM, sample playback by a sound processor,
  and samples the CPU writes to a DAC or volume register; the last couples sound to CPU timing (inference).

#### NES

- The APU sits in the CPU chip with two pulse channels, a triangle, noise, and a sample channel
  (NESdev wiki, ["APU"][nes-apu]).
  The triangle can run above hearing, which the filters average away
  (NESdev wiki, ["APU Triangle"][nes-tri]), so naive sampling aliases (inference).
- The sample channel fetches by DMA; on NTSC a fetch during a read of a register with read side effects,
  such as a controller port, causes extra reads that can lose data, and the PAL 2A07 avoids it
  (NESdev wiki, ["APU DMC"][nes-dmc]).
  Its frame sequencer is not synchronised with video (NESdev wiki, ["APU Frame Counter"][nes-frame]).
- Mixing is non-linear: "Each channel has its own internal digital-to-analog convertor (DAC),
  implemented in a way that causes non-linearity and interaction between channels"
  (NESdev wiki, ["APU Mixer"][nes-mixer]).
- The wiki gives an approximate output level from 0.0 to 1.0, the sum of a pulse group and a group of the other three,
  credited by the page to blargg's `apu_ref.txt`, which was not read (same page).
  The pulse group is 95.88 / (8128 / (pulse1 + pulse2) + 100).
  The other group is 159.79 / (1 / (triangle / 8227 + noise / 12241 + dmc / 22638) + 100).
  The page also gives a faster form from two lookup tables, of 31 and 203 entries with adjusted numerators,
  and a rougher linear form, and takes its filters from the circuit and community analysis (same page).
- Famicom cartridges add sound chips (NESdev wiki, ["Category:Expansion audio"][nes-exp]); one outputs channels in turn,
  audible as a whine when all eight are enabled, and one runs on its own oscillator
  (NESdev wiki, ["Namco 163 audio"][nes-n163], ["VRC7 audio"][nes-vrc7]).

#### Game Boy

- Two pulse channels, a 4-bit wavetable, and noise, sequenced by a bit of the divider register,
  so writing it changes sound timing (Pan Docs, ["Audio"][pd-audio], ["Audio Details"][pd-audiodet]).
  "The length of APU ticks is not affected by CGB double speed" (Pan Docs, "Audio").
- Each channel has a DAC, the high-pass filter differs by model, and switching causes pops
  (Pan Docs, "Audio Details");
  wave memory access while the wave channel plays differs by model
  (Pan Docs, ["Audio Registers"][pd-audioreg]),
  and one length quirk by revision, breaking at least one game (Pan Docs, "Audio Details", "Obscure Behavior").

#### SNES

- The sound module is a second computer: an SPC700 core at 1.024 MHz with a 64-byte boot ROM,
  a DSP with eight sample voices, and 64 KiB of RAM (SNESdev wiki, ["S-SMP"][sd-ssmp]).
  It makes one stereo sample every 768 cycles of its own 24.576 MHz resonator (same page).
- That resonator's frequency, by the APU pinout page,
  "In practice ... varies by console and temperature and has been observed in the range 24.584218 MHz to 24.667392 MHz",
  citing a community spreadsheet, and *An American Tail: Fievel Goes West* does not work properly at the advertised
  24.576 MHz (SNESdev wiki, ["APU pinout"][sd-apupin]).
  Divided by 768, that range gives 32010.7 Hz to 32119.0 Hz (calculated);
  the S-SMP page gives 32000 Hz to 32160 Hz from a forum measurement tool,
  so the two community figures differ at the top end (calculated).
- bsnes and ares both default the sound clock to 32040 × 768 Hz, 24.60672 MHz, inside the observed range
  ([bsnes][bsnes-hpp], `sfc/system/system.hpp`, line 37; [ares][ares-sfc], `ares/sfc/system/system.hpp`, line 39;
  observed in their code; calculated). bsnes lowers it to 32000 × 768 Hz for *Rendering Ranger R2* alone,
  behind its "hotfixes" option, because the game rarely locks up at the higher rate, by its comment
  ([bsnes][bsnes-cpp], `sfc/system/system.cpp`; observed).
- The SPC700 and the DSP share RAM by time-slicing (SNESdev wiki, "S-SMP"), an arrangement a Sony patent describes
  ([US 5,761,643][us5761643], abstract; its link to the SNES is inference).
  Samples are 9-byte blocks with prediction filters
  (SNESdev wiki, ["BRR samples"][sd-brr]),
  a layout another Sony patent describes
  ([US 5,086,475][us5086475], FIG. 19 and its description; the link is inference).
- Voices pass a 4-point Gaussian interpolation
  (SNESdev wiki, ["S-DSP registers"][sd-sdsp]),
  whose fixed table appears to come from chip ROM and is not recorded here (inference).
  Echo writes into sound RAM and can overwrite other data there, including zero page (same page).
- "SPC timings are inaccurate (requires SPC to run 1 cycle at a time, rather than 1 instruction at a time)" heads a list
  of failing games (SNESdev wiki, ["Tricky-to-emulate games"][sd-tricky]).

#### Sega and others

- The SN76489 is discrete in the SG-1000 and ColecoVision and built into Sega's later video chips;
  its noise shift register is 15 or 16 bits by chip version (SMS Power, ["SN76489"][sms-sn76489]).
  Its outputs leak towards zero, and "SMS1 and Mega Drive consoles have the proper 2dB step gapping,
  whereas the SMS2 clips due to a hardware design mistake" (same page, resting on a forum thread).
  Games play samples by timed volume writes (SMS Power, ["Sample Playback"][sms-sampleplayback]).
- The YM2413 FM chip is built into the Japanese Master System and is held by the FM Sound Unit,
  an add-on for the Mark III sold in Japan from 1987
  (SMS Power, ["YM2413"][sms-ym2413]; Sega Retro, ["FM Sound Unit"][sr-fm]);
  its fixed instruments are chip ROM content, not recorded here.
- The YM2612 has six 4-operator FM channels, the sixth able to play samples through a DAC-enable register
  (Wikipedia, ["Yamaha YM2612"][wp-ym2612]; Sega Retro, ["YM2612"][sr-ym2612]),
  and outputs about 53267 samples a second on NTSC
  (calculated from 144 68000 cycles per sample in Plutiedev's ["Common YM2612 operations"][pl-ym], a lead,
  and the 53.693175 MHz master clock divided by 7; no maker figure was found among the patents and hubs this note read).
- The original chip's built-in DAC distorts quiet sounds and the YM3438 and later variants reduced it,
  so some games sound different by model (Wikipedia, "Yamaha YM2612"; Sega Retro, "YM2612").
- A Hudson patent describes six 32-step wavetable channels with stereo attenuators, noise, modulation,
  and a direct output mode ([US 4,924,744][us4924744], abstract and description of FIG. 1;
  that it is the PC Engine's chip is inference),
  the one maker description of a tone generator of the era among the patents this note lists (observed).
- The Neo Geo's YM2610 has only its SSG output analogue; FM and ADPCM pass through an external DAC,
  and the signals are mixed outside the chip
  (NeoGeo Development Wiki, ["YM2610"][ngd-ym2610]), so their relative gain is a property of the board (inference).
- The WonderSwan outputs at a fixed 24000 Hz
  (WSdev wiki, ["Sound"][ws-sound]),
  and the 2600's sound runs from a 31399 Hz base on NTSC and 31113 Hz on PAL
  (Wikipedia, ["Television Interface Adaptor"][wp-tia]), about twice its line rate (inference).

#### What audio asks of an emulator

- Native rates are not host rates, so every system needs a resampler, and multi-chip systems merge streams first
  (inference from the rates above).
  Dynamic rate control adjusts the ratio slightly so that "ideally, the audio buffer is never underrun nor overrun"
  (libretro documentation, ["Dynamic Rate Control"][drc]).
- Where sound feeds back into CPU timing, as with NES sample DMA and the SNES sound CPU,
  audio cannot be rendered afterwards from a log of writes (inference).

### Timing, synchronisation, and input

#### Scheduling

- The NESdev wiki describes interleaving one CPU cycle at a time; "catch-up",
  running the least predictable component ahead to the next possible interaction and bringing the others up to it;
  and scanline emulation, which it calls a crude form of prediction and timestamping that is not perfect
  but runs well-behaved games efficiently on emulators for old PCs or handheld devices
  (NESdev wiki, ["Catch-up"][nes-catchup]).
- Catch-up can be refined by predicting events and timestamping writes,
  and with several CPUs that interrupt each other the page describes running ahead from a checkpoint and rewinding
  as one way (same page).

#### NES

- The master clock is "six times that of the color subcarrier,
  but this frequency is about 24% higher on PAL than on NTSC"
  (NESdev wiki, ["Cycle reference chart"][nes-cyc]), so region is a machine parameter (inference).
- The CPU and PPU start each power-on in one of several relative alignments, and the page's own results,
  for the NTSC PPU only, assume one (NESdev wiki, ["PPU frame timing"][nes-ppuframe]); "At power-on,
  whether the first CPU cycle is get or put is random" (NESdev wiki, ["DMA"][nes-dma]).
  A deterministic emulator chooses both (inference).
- Reading the status register on the dot vertical blank begins suppresses that frame's NMI
  (NESdev wiki, ["NMI"][nes-nmi]).
  Sprite DMA on its own takes 513 or 514 CPU cycles, depending on alignment (NESdev wiki, "DMA").
  A halted 2A03 repeats its last read, and with sample DMA that gives joypads extra reads,
  which console models count differently (NESdev wiki, "DMA").
- AccuracyCoin tests these, and "was designed for an NTSC console with an RP2A03G CPU and RP2C02G PPU"
  ([AccuracyCoin README][accoin]),
  and its author skips some tests on other revisions and removed one that revision G consoles failed
  (same README): a hardware oracle for one revision (inference).
- The controller is a shift register read one bit per access
  (NESdev wiki, ["Standard controller"][nes-ctrl]);
  the Four Score and the Hori adapter identify themselves by a signature in four-player mode
  (NESdev wiki, ["Four player adapters"][nes-four]).
- The wiki models the Zapper's light reading as decaying "over the course of several scanlines"
  (NESdev wiki, ["Zapper"][nes-zapper]),
  so a light gun needs beam position in emulated time and a display without lag (inference).

#### SNES

- fullsnes lists the events of a frame by beam position, among them the end of vertical blank at line 0,
  its start at line 225 or 240 with the NMI and the automatic joypad read, and short and long lines
  ("SNES Timing H/V Events"); its origin for that list is not stated.
- "The S-SMP runs on its own clock, independent of the main CPU" (SNESdev wiki, ["Timing"][sd-timing]).
  The two CPUs talk through four ports, and a read on the cycle of a write returns a wrong value
  (SNESdev wiki, ["S-SMP"][sd-ssmp]), so the handshake spans two clock domains (inference).
- Several cartridge chips add their own crystals: fullsnes lists them for the DSP-n chips
  (7.600 MHz),
  the ST010, ST011, and ST018, the Cx4, the Super FX chips, the Super Game Boy 2, the Satellaview, and real-time clocks,
  while the SA-1, S-DD1, SPC7110, and Super Game Boy use the SNES master clock
  (fullsnes, "External Oscillators (in Cartridges)").
- Automatic joypad reading runs for about the first three lines of vertical blank, starting a short time after it begins
  (SNESdev wiki, ["Controller reading"][sd-ctrl]),
  and the Super Scope latches the beam counters, which games calibrate for (SNESdev wiki, ["Super Scope"][sd-scope]).
- The SNESdev multitap page rests mainly on the closed SNES Development Manual and is not used here
  (SNESdev wiki, ["Multitap"][sd-multitap]).
  The five-player adaptor is described instead from fullsnes, whose section does not state its origin
  (fullsnes, "SNES Controllers Multiplayer 5 (MP5)"; observed).
- What an emulator must present, by that section: with the latch held on,
  eight reads of data line 1 return all ones from an adaptor, and with it off, a value that is not all ones,
  which is how software finds one.
  One port, usually port 2, carries four players: two at a time on two data lines of `0x4017`,
  the pair chosen by bit 7 of the I/O port register at `0x4201`.
- Timing explains the order games use: the pair of players 2 and 3 comes first,
  since some adaptors are slow to follow that bit rising from 0 to 1,
  and one adaptor clocks player 2 whatever the bit says.
  The adaptor also has a pass-through switch (same section).

#### Game Boy

- A frame is 70224 dots at 2^22 Hz (Pan Docs, ["Specifications"][pd-spec], ["Rendering"][pd-rend];
  calculated from 154 lines of 456 dots).
  The NTSC Super Game Boy runs about 2.4% fast and the PAL one about 1.5% fast from the SNES clock,
  while the Super Game Boy 2 has its own crystal (Pan Docs, ["SGB Functions"][pd-sgb]).
- The status interrupt fires on a rising edge of the OR of its sources, so one source can block another
  (Pan Docs, ["Interrupt Sources"][pd-intsrc]),
  and the timer counts falling edges of an internal counter bit, so writing the divider can add a tick
  (Pan Docs, ["Timer Obscure Behaviour"][pd-timer]); both are circuits to model per machine cycle (inference).
- Mooneye's author ran its tests on every listed SoC revision: "in the end I only trust real hardware"
  ([Mooneye Test Suite README][mooneye]).
- A link port set to the external clock waits indefinitely for the other console's clock
  (Pan Docs, ["Serial Data Transfer (Link Cable)"][pd-serial]),
  so linked emulators synchronise two schedulers at bit-clock granularity (inference).

#### Sega

- The Genesis's video chip in its Master System mode holds the interrupt until its control port is read,
  and its line counter's reload decides which line interrupts;
  MacDonald describes the Genesis and expects the Master System and Game Gear to match,
  warning that some of it may apply to the Genesis only ([MacDonald][macd], `vdpint.txt`; lead).
  The Genesis's chip stalls the 68000 on a fifth buffered write during display
  (MacDonald, "Sega Genesis VDP documentation", section 6, quoting another researcher; lead).
- The Master System's light gun latches the horizontal counter
  (SMS Power, ["Light Phaser"][sms-lightphaser]),
  the Japanese paddle runs on its own clock (SMS Power, ["Paddle"][sms-paddle]), and region shows through port wiring
  (SMS Power, ["Region Detection"][sms-regiondetection]).
- The six-button pad relies on timing for its compatibility with the three-button protocol:
  "Do not read the controllers more than once per frame!" (Plutiedev, ["Controllers"][pl-ctrl]; lead).
- A video DMA started while the Z80 uses the 68000's bus can load garbage, so developers stop the Z80 during DMA
  (Plutiedev, ["Hardware issues"][pl-issues]; lead).

#### Others

- The PC Engine's timer runs at a fixed rate while its CPU changes speed
  ([MacDonald, "TurboGrafx-16 Hardware Notes"][macd], section 2.2; lead).
  The Neo Geo has a pixel-clock timer for raster effects (NeoGeo Development Wiki, ["Timer interrupt"][ngd-timer]).
- Some SNES cartridges and the Neo Geo MVS keep real time from their own crystals
  (fullsnes, "External Oscillators (in Cartridges)"; NeoGeo Development Wiki, ["Clock"][ngd-clock]);
  whether such clocks follow host or emulated time matters to save states and fast-forward (inference).

### Media, protection, and firmware

#### Headers

- The Game Boy header is the console's own: the boot ROM of most models checks a logo and a checksum,
  the Super Game Boy's leaving the check to its SNES program,
  and the header names the controller and Color and Super Game Boy support
  (Pan Docs, "The Cartridge Header", ["Power Up Sequence"][pd-boot]).
  The logo's bytes are not recorded here, and the header page, which holds them, is not linked.
- The SNES header serves developers and tools
  (SNESdev wiki, ["ROM header"][sd-header]),
  and copier files add 512 bytes that loaders strip (SNESdev wiki, ["ROM file formats"][sd-files]).
- The Master System header begins with the 8-byte string "TMR SEGA",
  which the export Master System and Game Gear BIOSes require
  (SMS Power, ["ROM header"][sms-romheader], "BIOSes"),
  and of the consoles only the export Master System BIOS checks its region field
  (SMS Power, "ROM header"), so emulators should not reject games on its values (inference).
  SMS Power's "BIOSes" page links BIOS files, so it is not linked here; its address is in the Sources.
- On the Genesis, "If it doesn't find the initial 'SEGA' text in this field,
  systems with TMSS will refuse to boot the game" (Plutiedev, ["ROM header reference"][pl-header]; lead).

#### Boot ROMs and firmware

- Firmware dependence falls into three groups
  (inference from the findings below; the Atari 2600, HuCard, Intellivision, and Lynx placements are from memory).
  - None, where the cartridge supplies the reset vector: NES, SNES main CPU, Atari 2600, SG-1000, PC Engine HuCard.
  - A boot ROM that checks and hands over: Game Boy family, export Master System, Genesis with TMSS, WonderSwan,
    NTSC Atari 7800.
    For the Game Boy and WonderSwan an emulator can skip it from documented post-boot state, within the limits below.
  - Firmware that games call or that loads them: Famicom Disk System, the SNES sound boot ROM, Super Game Boy,
    Satellaview, PC Engine CD, Sega CD, Neo Geo, Intellivision, Lynx.
- Nine official Game Boy boot ROMs are known by model, and games detect models by the registers they leave
  (Pan Docs, ["Power Up Sequence"][pd-boot], ["SGB Unlocking"][pd-sgbunlock]),
  so a boot-ROM-less emulator still chooses a model.
  Pan Docs says its post-boot CPU-register tables "were obtained from analysis of the boot ROM's disassemblies,
  and confirmed using Mooneye-GB tests", and its hardware-register table from Mooneye-GB tests and other testing
  (Pan Docs, "Power Up Sequence").
  The page warns that "some of it may contain errors" (same page).
- This note records those post-boot values only as far as a hardware test confirms them,
  as [the research conventions' rule on firmware-derived facts][consts] requires.
  The [Mooneye Test Suite][mooneye-tree] holds post-boot tests by model: `acceptance/boot_regs-dmg0`, `-dmgABC`, `-mgb`,
  `-sgb`, and `-sgb2`; `acceptance/boot_hwio-dmg0`, `-dmgABCmgb`, and `-S`; and `acceptance/boot_div-*`
  (observed in its tree).
- For the Color and Advance its `misc` folder holds `boot_regs-cgb`, `boot_regs-A`, `boot_hwio-C`,
  and `boot_div` tests (observed), and the README calls that folder "extra tests for CGB / AGB hardware
  that are not part of the main suite", with not all tests passing on those models
  ([Mooneye Test Suite README][mooneye]).
  So the monochrome and Super Game Boy values rest on the main suite, and the Color and Advance values on `misc` only.
- The Color's boot ROM colours monochrome games whose header names Nintendo
  as licensee from a table chosen by a checksum of the title; other games get one default palette set,
  and the player can override it at boot (Pan Docs, "Power Up Sequence").
  Pan Docs's only sources for the tables are the boot ROM's disassembly, a TCRF page
  (TCRF is walled),
  and a replacement boot ROM (closed), named here as its citations and not opened;
  no hardware test of the tables was found, so the tables are not recorded and this behaviour is stated in words.
- The SNES sound CPU starts in a 64-byte boot ROM that accepts a program by handshake
  (SNESdev wiki, ["S-SMP"][sd-ssmp], ["Booting the SPC700"][sd-boot]); every game depends on it (inference).
  "Booting the SPC700" cites a superfamicom.org article and blargg's upload code, neither opened, and fullsnes,
  which it says includes a disassembly of the boot ROM, and the S-SMP page's list of boot steps cites nothing,
  so the description traces at least partly to firmware analysis (inference).
- "The first version of the Game Gear, the Mark III and all SG-1000 and SC-3000 variants have no BIOS"
  (SMS Power, ["BIOS"][sms-bios]);
  SMS Power's account of later BIOS checks rests on disassembly, by the excerpts on its page
  (SMS Power, "BIOSes"; inference).
- The Neo Geo system ROM holds "various generic functions which can or must be used by games"
  (NeoGeo Development Wiki, ["System ROM"][ngd-sysrom]).
- WSdev documents the WonderSwan's state after its boot ROM exits, tested, by the page,
  on one Color chip with the default splash screen only
  (WSdev wiki, ["Boot ROM"][ws-boot]), from which an emulator could start (inference).
- The Famicom Disk System's BIOS provides routines games call
  (NESdev wiki, ["FDS BIOS"][nes-fdsbios]),
  so without it an emulator reimplements them, a firmware reimplementation
  (inference; [ADR 0001][adr1] closes others' versions).
  The common disk file omits the gaps and checksums of real disks
  (NESdev wiki, ["FDS file format"][nes-fdsfile], ["FDS disk format"][nes-fdsdisk]),
  which an emulator then synthesises (inference).
- NEC released System Card upgrades for the PC Engine CD along with new disc formats
  (Wikipedia, ["TurboGrafx-16"][wp-tg16]); that a game needs a given card version is inference.
  The Sega CD has a BIOS but a cartridge can drive its CPU directly
  (Wikipedia, ["Sega CD"][wp-segacd]; Plutiedev, ["Using the Sub-CPU in mode 1"][pl-subcpu]; lead),
  and Satellaview broadcasts ended in 2000 with most content lost (Wikipedia, ["Satellaview"][wp-satella]).
- The Sega CD's security code, which a disc carries for the BIOS to check, is left out:
  the only description found is unregistered, and Wikipedia's "Sega CD" says nothing of it
  (searched for "security", "region", and "protect").

#### Lock-out

- The front-loading NES's lock-out is a microcontroller in console and cartridge running one program
  (the Famicom and top-loading NES have none in the console);
  on a wrong response the console's reset line is pulsed at 1 Hz (NESdev wiki, ["CIC lockout chip"][nes-cic]).
  Nintendo's patent: "The key device and the lock device are synchronized with each other,
  executing the same arithmetic operation according to the same program" ([US 4,799,635][us4799635]).
- The SNES uses the same scheme, with a console "lock" and a cartridge "key" chip exchanging bit streams
  and the lock resetting the console on a mismatch;
  fullsnes says the same 4-bit CPU is used in NES consoles and cartridges, with slightly different code in its ROM
  (fullsnes, "SNES Cartridge CIC Lockout Chip").
  An emulator emulates neither chip (inference).
- The Game Boy compares character data held in the console with data in the cartridge
  ([US 5,134,391][us5134391]; Pan Docs, ["Power Up Sequence"][pd-boot]);
  an emulator that runs no boot ROM and makes no check holds no copy of the logo, as [`R0-02`][r0-02-tm] infers
  ("Trade marks and branding, recorded as risks").
- Later Game Gears and the Famicom Disk System check for a string or message and show a licence notice
  (SMS Power, "BIOSes"; NESdev wiki, ["FDS BIOS"][nes-fdsbios]),
  and the Genesis's TMSS checks the header for "SEGA" (see [Headers](#headers)).
- Atari required 7800 cartridges to be digitally signed,
  and the NTSC BIOS compares a signature it computes with the cartridge's, running the console as a 2600 if they differ;
  PAL consoles lack the check (Wikipedia, ["Atari 7800"][wp-7800]); no key is described here.
- TurboGrafx-16 HuCards reverse eight of their 38 pins as a region lock-out (Wikipedia, ["TurboGrafx-16"][wp-tg16]).
  Wikipedia's "Atari Lynx" says nothing of the Lynx's boot encryption
  (searched for "encrypt", "RSA", "sign", and "boot"), so it is left to [`R1-26`][fam].
- [`R0-02`][r0-02] covers the law and is not repeated: no § 1201 decision found on a cartridge-era lock-out
  (["Anti-circumvention law in the United States"][r0-02-1201]),
  the boot-logo questions (["Firmware, keys, and game copies"][r0-02-fw]), and options 4, 5, 6, and 16
  ([Options and trade-offs][r0-02-opt]).
- Open hubs hold firmware listings beside their prose (research log); none of it was used.
  The NeoGeo Development Wiki's `Security code` and `Boot process` pages hold firmware listings beside prose,
  so they are not linked and are not to be opened; [the register][register] cannot single them out,
  because their addresses carry a query.
  SMS Power's attachment folder for its development pages holds the BIOS files the "BIOSes" page links,
  so the register closes that folder.

### Open routes for the other systems

- Beyond Wikipedia, [MacDonald's notes][macd], and Hudson's patents,
  the open routes found for these systems are open-tier code and one reference.
  - [ares][ares-tree] (ISC) has cores named `pce`, `a26`, `a52`, `cv`, and `ngp`, for the PC Engine, Atari 2600,
    Atari 5200, ColecoVision, and Neo Geo Pocket
    (observed in its tree at the commit in the Sources; the systems are inferred from the names).
  - [Mesen2][mesen2] (GPL-3.0-or-later) covers the PC Engine, by its repository description.
  - [NgpCraft][ngpcraft], an MIT-licensed developer reference, describes the Neo Geo Pocket Color's TLCS-900/H CPU,
    registers, graphics, and audio, by its description; [`R1-05`][r1-05] registered it.
- Code from these is open tier: it may be read and cited as what an emulator does, and is never copied
  ([ADR 0001][adr1]).
- For the Intellivision, a GitHub repository search for "intellivision", sorted by stars
  (top ten read),
  and a community wiki ([`R1-05`][r1-05] records "an Intellivision wiki" among the sites it found) give these routes;
  each is now in [the register][register]:
  - [FreeIntv][freeintv], a libretro core, is GPL-2.0 "or
    (at your option)
    any later version" by its `LICENSE`, so open tier; it needs the user's Executive and graphics ROM images,
    by its README.
  - [jzIntv][jzintv], in a mirror last changed in 2014, states "either version 2 of the License, or
    (at your option)
    any later version" in `COPYRIGHT.txt`, though `COPYING.txt` is the plain GPL-2.0 text,
    so open tier by its own notice.
  - [BlissEmu][blissemu]'s README says only "licensed under the GPL v2", so it is walled.
  - The [Intellivision Wiki][intv-wiki] calls itself "a compilation of the technical details about the Intellivision",
    with hardware pages such as one on the STIC video chip (Main Page, revision 14936; the STIC page read raw).
    Its pages about the wiki itself, which would state a licence and origin, require a login, so it is walled,
    and its prose may be read; no page on the Executive ROM was opened,
    because R1-05 found that such sites host firmware (research log).

### Tests and their oracles

- No single-step processor test set captured from hardware was found for the 6502 family, Z80, SM83, 68000, HuC6280,
  SPC700, or TLCS-900H.
  Of the 22 repositories of the [SingleStepTests][sst-org] organisation, only the 8086, 8088, 80186, 80286, 80386,
  and V20 sets describe themselves as hardware-generated
  (repository descriptions, read through the GitHub API on 2026-11-20).
- The sets for this era's cores describe a generator or none.
  The 65x02 README says an implementation verified by use in an emulated machine generated it,
  and the 65816 description names no method; m68000 was generated with MAME's microcoded core;
  huc6280 is "Mesen-generated"; sm83, spc700, and z80 are "JSMoo-based"; tlcs900h is "Ares-based"
  (closed, read as prose only);
  GameboyCPUTests is randomly generated, its generator not named (repository descriptions; [the register][register]).
- The sm83 description says "JSMoo-based" while its README says the set was made by translating the ares core
  ([SingleStepTests sm83 README][sst-sm83]; observed).
- "Any bugs that exist in Mame's microcoded M68000 emulator will exist here too"
  ([SingleStepTests m68000 README][sst-m68000]),
  and the HuC6280 set is "only as good as Mesen" ([SingleStepTests huc6280 README][sst-huc6280]).
  Passing such a set shows agreement with that emulator (inference).
- The hardware-derived oracles found are test programs
  ([z80test][z80test], [AccuracyCoin][accoin], [Mooneye][mooneye]), plus [MacDonald's notes][macd] (lead).
  No open, hardware-referenced audio test was found beyond AccuracyCoin's NES checks
  (AccuracyCoin README; [gilyon snes-tests `spctest` README][spctest]; Mooneye README).

## Options and trade-offs

### Timing granularity

- **What:** interleave and render per frame, per line, per dot, or per cycle.
- **Costs:** finer units cost host time (inference); coarser ones break named games on the NES, SNES, and Game Boy
  (NESdev and SNESdev wikis, ["Tricky-to-emulate games"][nes-tricky] and ["Tricky-to-emulate games"][sd-tricky];
  Pan Docs, ["STAT"][pd-stat]), while no title needing finer than per-line was found among the Genesis pages read.
- **Gains:** per-line runs well-behaved NES games, imperfectly
  (NESdev wiki, ["Catch-up"][nes-catchup]);
  per-dot and per-cycle are what the timing entries in the tricky-games lists need (inference).
- **Used by:** the NESdev wiki describes per-cycle and per-scanline emulation as practised,
  and per-frame as hiding raster effects; [the family surveys][fam] record which emulators use which.

### Lockstep or catch-up

- **What:** step every component together, or run one ahead and catch the others up at points of interaction.
- **Costs:** lockstep costs speed; catch-up relies on predicting interactions, as [Scheduling](#scheduling) describes.
- **Gains:** lockstep is simple to reason about; catch-up is faster where predictions hold (inference).
- **Used by:** the NESdev wiki names one emulator for lockstep and describes the others without naming users
  (NESdev wiki, ["Catch-up"][nes-catchup]).

### Master-clock or per-component time

- **What:** count all time in system master clocks, or keep a cycle count per component.
- **Costs:** master clocks still need separate domains for the SNES sound unit and cartridge crystals;
  per-component counts convert at every interaction (inference; the cartridge crystals rest on fullsnes).
- **Gains:** master clocks follow run-time speed changes without conversion (inference).
- **Used by:** no emulator's design was read for this note;
  [bsnes][bsnes-hpp] and [ares][ares-sfc] set a sound-unit frequency of their own beside the CPU's (observed).

### Revisions and models

- **What:** one chip revision per system, or a selectable set.
- **Costs:** each revision adds behaviour to test; tests such as [AccuracyCoin][accoin] target one.
- **Gains:** revisions are visible to software on the NES, SNES, and Game Boy; for Sega,
  SMS Power reports Game Gear BIOS and Master System 2 sound differences by revision
  (["BIOS"][sms-bios], ["SN76489"][sms-sn76489]), and the other reports are leads.
- **Used by:** [Mooneye][mooneye]'s test names say which models each test should pass on;
  the SNESdev errata name revisions (SNESdev wiki, ["Errata"][sd-errata]).

### Open bus and hardware faults

- **What:** model open bus, bus conflicts, and known faults, or return fixed values and omit faults.
- **Costs:** modelling needs per-console data, some from leads; omitting breaks games that rely on the behaviour.
- **Gains:** fidelity on one side; simpler code and no reliance on lead-only data on the other (inference).
- **Used by:** Plutiedev reports that many emulators skip address errors and hardware delays, and that some early ones,
  Gens and most of its forks among them, mishandled zero-length DMA (Plutiedev, ["Hardware issues"][pl-issues]; lead).

### Test oracles

- **What:** single-step vectors generated by other emulators, or program-level tests run on hardware.
- **Costs:** generated vectors encode an emulator's errors and measure similarity to it; hardware tests cover less
  (inference; [Mooneye][mooneye] keeps an "emulator-only" class it finds hard to verify on hardware).
- **Gains:** vectors check state and, in some sets, each bus cycle, within the generator's limits;
  hardware tests check the console.
- **Used by:** the [SingleStepTests][sst-org] authors and the test-suite authors named above.

### Firmware

- **What:** for each system, start from documented post-boot state, require a user's image, or write a replacement.
- **Costs:** the Game Boy post-boot values came from boot ROM analysis and stand only
  where [Mooneye's boot tests][mooneye-tree] confirm them; user images raise [`R0-02`][r0-02-fw]'s questions;
  replacements must come from hardware descriptions and tests, since others' are closed under [ADR 0001][adr1].
- **Gains:** skipping needs no image for the Game Boy and WonderSwan, whose post-boot state is documented,
  and for the other second-group systems if their state can be established (inference);
  a replacement removes the need for an image in the third.
- **Used by:** [`R0-02`][r0-02] options [4][r0-02-o4] and [5][r0-02-o5] list projects that require an image
  or ship a replacement; [`R0-02`][r0-02] lists none for starting from post-boot state,
  and this note read no emulator's documentation on it.

### Colour and sound output

- **What:** fixed palettes and linear mixing, or signal, LCD, DAC, and filter models, possibly selectable.
- **Costs:** models cost host time (inference) and rest on community measurements;
  no single palette suits every NES game's composite output
  (NESdev wiki, ["PPU palettes"][nes-pal]),
  and none is canonical across WonderSwan models (WSdev wiki, ["Display/Palette"][ws-pal]).
- **Gains:** fidelity to what players saw and heard; selection avoids choosing one answer.
- **Used by:** the [NESdev][nes-ntsc] and [Plutiedev][pl-ramp] (lead) pages describe models,
  and Pan Docs describes the Color's departures from sRGB
  (Pan Docs, ["Palettes"][pd-pal]),
  and [SameBoy][sameboy-shader] models LCD frame blending; [the family surveys][fam] record which emulators offer them.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Timing granularity:** interleave at the finest unit each system's evidence demands.
  Use per CPU cycle and per dot for the NES, SNES, and Game Boy, where named games fail at coarser units,
  and for the Atari 2600, whose CPU waits for the end of a line so that CPU timing is display timing.
  Time the Neo Geo's timer interrupt to the dot, since it counts pixel clocks for raster effects (inference),
  and use per line only where the findings show nothing finer, as for the Genesis,
  until a title is found that needs more.
  The tricky-games lists ([NESdev][nes-tricky], [SNESdev][sd-tricky]) and Pan Docs ["STAT"][pd-stat] name failing games,
  [NESdev][nes-catchup] says per-line runs well-behaved games imperfectly,
  the 2600 and Neo Geo findings rest on ["Television Interface Adaptor"][wp-tia] and ["Timer interrupt"][ngd-timer],
  and no Genesis title needing finer than per-line was found in the pages read.
- **Lockstep or catch-up:** use catch-up whose synchronisation points fall on the exact cycle of each interaction,
  and keep a lockstep mode as a reference for tests.
  [NESdev][nes-catchup] describes catch-up refined by predicting events and timestamping writes,
  and lockstep is simple to reason about but slow; a reference mode lets one check the other (inference).
- **Master-clock or per-component time:** count time in each system's master clock,
  with separate clock domains for independent crystals: the SNES sound unit, cartridge oscillators,
  and real-time clocks.
  Make the SNES sound clock configurable, defaulting to 24.60672 MHz
  (32040 Hz output),
  inside the [measured range][sd-apupin] and the value [two][bsnes-hpp] [open-tier emulators][ares-sfc] use,
  since the nominal 24.576 MHz breaks one game and [bsnes][bsnes-cpp] lowers the rate for another.
  CPU cycle length changes at run time on the PC Engine, Game Boy Color, and SNES, and by cartridge on the Neo Geo.
- **Revisions and models:** model a selectable set of revisions,
  with one default per system chosen to match the hardware-referenced test that targets it,
  such as RP2A03G and RP2C02G for [AccuracyCoin][accoin] and [Mooneye][mooneye]'s model letters for the Game Boy.
  Revisions are visible to software on the NES, SNES, and Game Boy,
  and each hardware-referenced test targets named revisions.
- **Open bus and hardware faults:** model open bus, bus conflicts, and documented faults,
  recording each behaviour's source and marking those that rest on leads only.
  [NESdev][nes-openbus] names games that need open bus and games that fail if save RAM appears
  where open bus is expected, so fixed values break them, and the marking keeps the lead-only data visible.
- **Test oracles:** use the hardware-referenced program tests
  ([z80test][z80test], AccuracyCoin, Mooneye, and, within their stated limits,
  the [Mealybug Tearoom][mealybug] photographs) as the acceptance oracle,
  and emulator-generated single-step vectors as a development check whose pass is recorded
  as agreement with the named generator, never as proof of hardware behaviour.
  Every vector set read for this era that states its method describes an emulator, named or not, as the generator,
  and the [m68000 README][sst-m68000] says its generator's bugs carry over,
  while the program tests were run on hardware, though they cover less.
- **Firmware:** start from post-boot state where a hardware test confirms it,
  as for the Game Boy with [Mooneye's boot tests][mooneye-tree]
  and the WonderSwan within [WSdev's][ws-boot] stated limits,
  and treat systems whose games call firmware as needing a user's image
  or a replacement written from hardware descriptions and tests;
  the legal choice stays with [`R0-02`][r0-02] and [`R2-12`][ph2].
  Firmware-derived facts are admitted only where a test confirms them,
  and others' replacements are closed under [ADR 0001][adr1].
- **Colour and sound output:** offer selectable output models with a documented default per system,
  not one fixed palette or linear mix.
  [NESdev][nes-pal] says no single composite palette suits every NES game,
  [WSdev][ws-pal] says the WonderSwan has no canon palette,
  and [Plutiedev][pl-ramp] (lead) and [Pan Docs][pd-pal] report DAC and colour differences by revision and screen.

## Implications for Rustalgia

- The family surveys ([`R1-10`][fam], [`R1-15`][fam], [`R1-22`][fam]) should record each emulator's timing granularity,
  modelled revisions, and test oracles, where the findings show emulators differ; this feeds [`R1-90`][synth].
- A master-clock scheduler with separate clock domains is the design recommended above;
  the choice belongs to [`R2-03`][ph2], with [`R2-01`][ph2] for how CPU cores step.
- Rendering granularity and selectable colour models feed [`R2-04`][ph2] and the quality targets ([`R6-02`][ph6]);
  resampling and rate control feed [`R2-06`][ph2] and [`R2-07`][ph2].
- The three firmware groups set which systems need an image, a replacement, or nothing;
  this feeds [`R2-12`][ph2] and an ADR on firmware, with [`R0-02`][r0-02] as the legal input.
- Emulator-generated test vectors measure similarity to their generators,
  which bears on [`R0-06`][r0-06] and [`R2-15`][ph2].
- Hubs mix prose with firmware listings and facts from closed manuals,
  so later notes cite at page level and say when a fact rests on such material.

## Open questions

- Does a Genesis video DMA of length zero make 65536 transfers on hardware?
  A hardware test; [`R1-22`][fam].
- Could single-step vectors be captured from this era's processors?
  A bus-capture spike after [`R2-15`][ph2].
- How does the original Game Boy's LCD blend frames, as measured?
  [`R1-10`][fam], or a measurement.

## Sources

Every source below was read on 2026-11-20.

Maker material:

- Patents, read on Google Patents and then, when it refused automated requests, as the patent office's image copies,
  read by OCR: [US 3,991,307][us3991307]
  (MOS Technology);
  [US 4,949,298][us4949298], [US 4,799,635][us4799635], and [US 5,134,391][us5134391] (Nintendo);
  [US 5,291,189][us5291189] and [US 5,327,158][us5327158]
  (Nintendo and Ricoh);
  [US 4,951,038][us4951038] and [US 4,924,744][us4924744]
  (Hudson Soft); [US 5,086,475][us5086475] and [US 5,761,643][us5761643] (Sony).
- Western Design Center, [W65C02S datasheet][wdc02] (8 April 2022) and [W65C816S datasheet][wdc816] (13 March 2024).
- Motorola, ["M68000 8-/16-/32-Bit Microprocessors User's Manual"][m68k], ninth edition (1993), on NXP's site,
  which served the file to curl and refused the link checker's user agent on 2026-11-20.
- Sega, ["[セガハード大百科] メガＣＤ 各種データ"][segajp]
  (Sega hardware encyclopaedia: Mega-CD data, the note's own translation),
  read in the Web Archive capture of 16 October 2013 14:28:54 UTC, because [the live page][segajp-live] refuses scripts.

Community references (wiki pages, read as raw source, with the revision read; each link opens that revision,
except the NeoGeo Development Wiki's, which refuses revision links to scripts and opens the current page):

- NESdev wiki: ["CPU"][nes-cpu] (24046), ["CPU unofficial opcodes"][nes-unof] (23975), ["CPU interrupts"][nes-cpuint]
  (21632), ["2A03"][nes-2a03] (24459), ["Cycle reference chart"][nes-cyc] (24433), ["Status flags"][nes-flags] (22145),
  ["DMA"][nes-dma] (23450), ["Open bus behavior"][nes-openbus] (23814), ["Accuracy"][nes-acc] (23181),
  ["Catch-up"][nes-catchup] (18783), ["Tricky-to-emulate games"][nes-tricky] (24630), ["CPU memory map"][nes-cpumap]
  (24447), ["PPU memory map"][nes-ppumap] (22765), ["Bus conflict"][nes-conflict] (24010), ["Mirroring"][nes-mirror]
  (24072), ["Mapper"][nes-mapper] (24625), ["MMC1"][nes-mmc1] (24550), ["MMC2"][nes-mmc2] (22483), ["MMC3"][nes-mmc3]
  (24445), ["NES 2.0"][nes-nes2] (24464), ["PPU rendering"][nes-ppurend] (23300), ["PPU sprite evaluation"][nes-spreval]
  (22442), ["PPU sprite priority"][nes-sprprio] (22861), ["PPU registers"][nes-ppuregs] (24601),
  ["PPU frame timing"][nes-ppuframe] (24376), ["NTSC video"][nes-ntsc] (24244), ["PPU palettes"][nes-pal] (24257),
  ["Overscan"][nes-overscan] (22760), ["NMI"][nes-nmi] (23420), ["Standard controller"][nes-ctrl] (23466),
  ["Zapper"][nes-zapper] (24469), ["Four player adapters"][nes-four] (23127), ["APU"][nes-apu] (24458),
  ["APU Mixer"][nes-mixer] (24528), ["APU Frame Counter"][nes-frame] (24379), ["APU Triangle"][nes-tri] (24457),
  ["APU DMC"][nes-dmc] (24507), ["Category:Expansion audio"][nes-exp] (18360), ["VRC7 audio"][nes-vrc7] (24131),
  ["Namco 163 audio"][nes-n163] (23403), ["CIC lockout chip"][nes-cic] (24095), ["FDS BIOS"][nes-fdsbios] (24615),
  ["FDS disk format"][nes-fdsdisk] (23575), ["FDS file format"][nes-fdsfile] (22826), and the mirrored Visual6502 page
  ["Visual6502wiki/6502 Opcode 8B (XAA, ANE)"][nes-xaa] (24142).
- SNESdev wiki: ["65C816"][sd-65816] (1413), ["Timing"][sd-timing] (1467), ["Open bus"][sd-openbus] (1174),
  ["Errata"][sd-errata] (1511), ["Tricky-to-emulate games"][sd-tricky] (1221), ["S-SMP"][sd-ssmp] (1381),
  ["DMA registers"][sd-dma] (1503), ["Memory map"][sd-map] (1504), ["ROM header"][sd-header] (1545),
  ["ROM file formats"][sd-files] (858), ["CPU vectors"][sd-vectors] (535), ["Booting the SPC700"][sd-boot] (1321),
  ["Super FX"][sd-superfx] (1107), ["Backgrounds"][sd-bg] (1244), ["Sprites"][sd-sprites] (1204),
  ["Color math"][sd-math] (1387), ["Windows"][sd-windows] (1167), ["Version differences"][sd-versions] (1328),
  ["S-DSP registers"][sd-sdsp] (1428), ["BRR samples"][sd-brr] (902), ["APU pinout"][sd-apupin] (1523),
  ["Controller reading"][sd-ctrl] (942), ["Super Scope"][sd-scope] (1529), ["Mode 7 transform"][sd-mode7] (1410),
  ["Multitap"][sd-multitap] (884).
- fullsnes, Martin Korth, extracted from no$sns version 1.5, read by the research agents at its live address,
  `https://problemkaputt.de/fullsnes.htm`,
  and by the later pass in the Web Archive capture of 5 November 2026 22:45:18 UTC,
  `https://web.archive.org/web/20261105224518/https://problemkaputt.de/fullsnes.htm`,
  because the live page refuses scripts with HTTP 403; three captures since 18 October 2026 share one digest.
  Only the sections named in the findings were read; the boot ROM disassembly section was not.
  Neither address is linked, because the page holds that disassembly (see [Scope](#scope)).
- Pan Docs source files at commit `f7f7b064`: ["Rendering"][pd-rend], ["Specifications"][pd-spec],
  ["CPU Comparison with Z80"][pd-z80], ["Interrupts"][pd-int], ["halt"][pd-halt], ["CGB Registers"][pd-cgbregs],
  ["Memory Map"][pd-map], ["Accessing VRAM and OAM"][pd-vram], ["MBCs"][pd-mbcs], ["OAM DMA Transfer"][pd-oamdma],
  ["Pixel FIFO"][pd-fifo], ["OAM"][pd-oam], ["STAT"][pd-stat], ["Palettes"][pd-pal], ["Audio"][pd-audio],
  ["Audio Details"][pd-audiodet], ["Audio Registers"][pd-audioreg], ["SGB Functions"][pd-sgb],
  ["Interrupt Sources"][pd-intsrc], ["Timer Obscure Behaviour"][pd-timer],
  ["Serial Data Transfer (Link Cable)"][pd-serial], ["Power Up Sequence"][pd-boot], ["SGB Unlocking"][pd-sgbunlock],
  and "The Cartridge Header", `src/The_Cartridge_Header.md` at the same commit,
  not linked because it holds the boot logo's bytes.
- Gekkio, ["GB: Complete Technical Reference"][gbctr], revision 199 (6 November 2026).
- Breaks (emu-russia), [`BreakingNESWiki_DeepL/Ricoh.md`][breaks],
  an English machine translation of `BreakingNESWiki/Ricoh.md` by the folder's name (observed),
  published in the project's own repository, its status not stated, commit `6aee24fb`.
- SMS Power!, development pages ["Clock Rate"][sms-clockrate], ["Interrupt Mechanism"][sms-interruptmechanism],
  ["Pause Button"][sms-pausebutton], ["Mappers"][sms-mappers], ["ROM header"][sms-romheader], ["Port $3E"][sms-port3e],
  ["SN76489"][sms-sn76489], ["Sample Playback"][sms-sampleplayback], ["YM2413"][sms-ym2413],
  ["Light Phaser"][sms-lightphaser], ["Paddle"][sms-paddle], ["Region Detection"][sms-regiondetection],
  and ["BIOS"][sms-bios] (no revisions on the pages; their histories were not read).
  The "BIOSes" page, `https://www.smspower.org/Development/BIOSes`, is not linked, because it links BIOS files.
- MegaDrive Wiki, ["Zilog Z80"][mdw-z80] (269), ["Mega CD"][mdw-mcd] (688), ["VDP"][mdw-vdp] (1156).
- Sega Retro, ["Sega Mega Drive/Technical specifications"][sr-spec] (1158648), ["YM2612"][sr-ym2612] (1149913),
  ["FM Sound Unit"][sr-fm] (1152060).
- NeoGeo Development Wiki, ["Clock"][ngd-clock] (9305), ["Wait cycle"][ngd-wait] (9295),
  ["Line buffers"][ngd-lb] (5479), ["Sprites"][ngd-sprites] (8486), ["Framerate"][ngd-fps] (5921),
  ["Timer interrupt"][ngd-timer] (6443), ["YM2610"][ngd-ym2610] (9251), ["System ROM"][ngd-sysrom] (6391).
- WSdev wiki, ["NEC V30MZ"][ws-v30] (442), ["NEC V30MZ interrupts"][ws-v30int] (552), ["Timing"][ws-timing] (645),
  ["Memory map"][ws-map] (513), ["Display/Palette"][ws-pal] (514), ["Sound"][ws-sound] (751), ["Boot ROM"][ws-boot]
  (721).
- libretro documentation, ["Dynamic Rate Control"][drc].
- [NgpCraft][ngpcraft], NGPC developer reference, repository description and licence metadata.
- [Intellivision Wiki][intv-wiki], Main Page
  (revision 14936) and the STIC page, read raw; its project pages refused access without a login.

Leads:

- Charles MacDonald, technical documents, cited by [his document index][macd], as he asks:
  "TurboGrafx-16 Hardware Notes" (`pcetech.txt`), "Sega Genesis hardware notes" version 0.8 (`gen-hw.txt`),
  "Sega Genesis VDP documentation" version 1.5f (`genvdp.txt`), "Sega Master System VDP documentation" (`msvdp.txt`),
  and `vdpint.txt`.
- Plutiedev, ["Hardware issues"][pl-issues], ["DMA transfer"][pl-dma], ["Saving progress with SRAM"][pl-sram],
  ["Sprites"][pl-sprites], ["Sonic water"][pl-water], ["VDP color ramp"][pl-ramp], ["Common YM2612 operations"][pl-ym],
  ["Controllers"][pl-ctrl], ["ROM header reference"][pl-header], ["Using the Z80"][pl-z80],
  and ["Using the Sub-CPU in mode 1"][pl-subcpu].
- Kabuto, ["SEGA Mega Drive / Genesis hardware notes"][pl-kabuto], version 1.5, mirrored on Plutiedev.

Tests:

- [AccuracyCoin README][accoin], commit `20c6d23d`.
- [Mooneye Test Suite README][mooneye], and [its tree][mooneye-tree] filtered for "boot", commit `31510e12`;
  the test sources were not opened.
- [Mealybug Tearoom tests README][mealybug], commit `70e88fb9`.
- [z80test readme][z80test], commit `c490c0ca`.
- SingleStepTests READMEs for [65x02][sst-65x02] (`2f6980a2`), [z80][sst-z80]
  (`ebe1875d`, file `README.MD`),
  [m68000][sst-m68000] (`64b25311`), [huc6280][sst-huc6280] (`4ce378e0`), and [sm83][sst-sm83]
  (`f9c30210`, file `README.MD`);
  the repository description of [spc700][sst-spc700] (`67d15f49`);
  and the names and descriptions of [the organisation's][sst-org] 22 repositories, read through the GitHub API.
  The tlcs900h set (`44b3c3cb`), `https://github.com/SingleStepTests/tlcs900h`, is closed,
  so it is not linked and only its description was read.
- [gilyon snes-tests, `spctest/README.md`][spctest], commit `5ecdf555`.

Open-tier emulator code (read for the value used, not copied):

- jgenesis, [`backend/genesis-components/src/vdp.rs`][jgenesis]
  and the comments of [`backend/genesis-core/src/bus.rs`][jgenesis-bus], commit `8d1bdfba`.
- BlastEm, [`vdp.c`][blastem], changeset `ce5e85c3b219`.
- ares, [`ares/md/vdp/dma.cpp`][ares-dma], [`ares/sfc/system/system.hpp`][ares-sfc],
  and [the `ares` folder's tree][ares-tree], commit `ef33a804`.
- bsnes, [`bsnes/sfc/system/system.hpp`][bsnes-hpp] and [`bsnes/sfc/system/system.cpp`][bsnes-cpp], commit `78474e5d`.
- [Mesen2][mesen2], repository description.
- SameBoy, [`Shaders/MasterShader.fsh`][sameboy-shader], commit `ea667ad7`.
- Intellivision emulators, prose only: [FreeIntv][freeintv] `LICENSE` and README
  (commit `ef3e0fe3`),
  [jzIntv][jzintv] `COPYRIGHT.txt` and `COPYING.txt`
  (commit `d373ec28`), and [BlissEmu][blissemu] README and `LICENSE.txt` (commit `9767e463`).

Tertiary (Wikipedia, raw wikitext, with the revision read; each link opens that revision):

- ["MOS Technology 6502"][wp-6502] (1385548879), ["Ricoh 5A22"][wp-5a22] (1375573184),
  ["Hudson Soft HuC6280"][wp-huc6280] (1375176090), ["General Instrument CP1600"][wp-cp1600] (1372435639),
  ["Atari 2600"][wp-2600] (1386797711), ["Atari 7800"][wp-7800] (1384315726), ["Atari Lynx"][wp-lynx] (1385284173),
  ["Neo Geo Pocket"][wp-ngp] (1367573321), ["Sega CD"][wp-segacd] (1385340710), ["TurboGrafx-16"][wp-tg16] (1384843861),
  ["Television Interface Adaptor"][wp-tia] (1386648231), ["Vectrex"][wp-vectrex] (1386579084),
  ["Yamaha YM2612"][wp-ym2612] (1384085778), ["Satellaview"][wp-satella] (1384890138).

Project documents:

- [`R0-01`][r0-01], [`R0-02`][r0-02], [`R0-05`][r0-05], [`R0-06`][r0-06], and [`R1-05`][r1-05].
- [ADR 0001][adr1], [the source register][register], [the research conventions][conv],
  and [the research roadmap][roadmap].

[r0-01]: R0-01-clean-room-policy.md
[r0-02]: R0-02-legal-baseline.md
[r0-02-fw]: R0-02-legal-baseline.md#firmware-keys-and-game-copies
[r0-02-1201]: R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states
[r0-02-tm]: R0-02-legal-baseline.md#trade-marks-and-branding-recorded-as-risks
[r0-02-opt]: R0-02-legal-baseline.md#options-and-trade-offs
[r0-02-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r0-02-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r0-05]: R0-05-source-map.md
[r0-05-o5]: R0-05-source-map.md#5-maker-documents-that-survive-only-as-third-party-copies
[r0-06]: R0-06-provenance-controls.md
[r1-05]: R1-05-catalogue-8-and-16-bit.md
[adr1]: ../../adr/0001-restrict-reading-by-licence-tier.md
[register]: ../../../.claude/hooks/source-register.txt
[conv]: ../README.md#conventions
[markers]: ../README.md#claim-status
[consts]: ../README.md#constants-and-tables
[roadmap]: ../../roadmap/research.md
[fam]: ../../roadmap/research.md#system-family-surveys
[synth]: ../../roadmap/research.md#landscape-synthesis
[ph2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[ph6]: ../../roadmap/research.md#phase-6-synthesis
[nes-cpu]: https://www.nesdev.org/w/index.php?title=CPU&oldid=24046
[nes-unof]: https://www.nesdev.org/w/index.php?title=CPU_unofficial_opcodes&oldid=23975
[nes-cpuint]: https://www.nesdev.org/w/index.php?title=CPU_interrupts&oldid=21632
[nes-2a03]: https://www.nesdev.org/w/index.php?title=2A03&oldid=24459
[nes-cyc]: https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433
[nes-flags]: https://www.nesdev.org/w/index.php?title=Status_flags&oldid=22145
[nes-dma]: https://www.nesdev.org/w/index.php?title=DMA&oldid=23450
[nes-openbus]: https://www.nesdev.org/w/index.php?title=Open_bus_behavior&oldid=23814
[nes-acc]: https://www.nesdev.org/w/index.php?title=Accuracy&oldid=23181
[nes-catchup]: https://www.nesdev.org/w/index.php?title=Catch-up&oldid=18783
[nes-tricky]: https://www.nesdev.org/w/index.php?title=Tricky-to-emulate_games&oldid=24630
[nes-cpumap]: https://www.nesdev.org/w/index.php?title=CPU_memory_map&oldid=24447
[nes-ppumap]: https://www.nesdev.org/w/index.php?title=PPU_memory_map&oldid=22765
[nes-conflict]: https://www.nesdev.org/w/index.php?title=Bus_conflict&oldid=24010
[nes-mirror]: https://www.nesdev.org/w/index.php?title=Mirroring&oldid=24072
[nes-mapper]: https://www.nesdev.org/w/index.php?title=Mapper&oldid=24625
[nes-mmc1]: https://www.nesdev.org/w/index.php?title=MMC1&oldid=24550
[nes-mmc2]: https://www.nesdev.org/w/index.php?title=MMC2&oldid=22483
[nes-mmc3]: https://www.nesdev.org/w/index.php?title=MMC3&oldid=24445
[nes-nes2]: https://www.nesdev.org/w/index.php?title=NES_2.0&oldid=24464
[nes-ppurend]: https://www.nesdev.org/w/index.php?title=PPU_rendering&oldid=23300
[nes-spreval]: https://www.nesdev.org/w/index.php?title=PPU_sprite_evaluation&oldid=22442
[nes-sprprio]: https://www.nesdev.org/w/index.php?title=PPU_sprite_priority&oldid=22861
[nes-ppuregs]: https://www.nesdev.org/w/index.php?title=PPU_registers&oldid=24601
[nes-ppuframe]: https://www.nesdev.org/w/index.php?title=PPU_frame_timing&oldid=24376
[nes-ntsc]: https://www.nesdev.org/w/index.php?title=NTSC_video&oldid=24244
[nes-pal]: https://www.nesdev.org/w/index.php?title=PPU_palettes&oldid=24257
[nes-overscan]: https://www.nesdev.org/w/index.php?title=Overscan&oldid=22760
[nes-nmi]: https://www.nesdev.org/w/index.php?title=NMI&oldid=23420
[nes-ctrl]: https://www.nesdev.org/w/index.php?title=Standard_controller&oldid=23466
[nes-zapper]: https://www.nesdev.org/w/index.php?title=Zapper&oldid=24469
[nes-four]: https://www.nesdev.org/w/index.php?title=Four_player_adapters&oldid=23127
[nes-apu]: https://www.nesdev.org/w/index.php?title=APU&oldid=24458
[nes-mixer]: https://www.nesdev.org/w/index.php?title=APU_Mixer&oldid=24528
[nes-frame]: https://www.nesdev.org/w/index.php?title=APU_Frame_Counter&oldid=24379
[nes-tri]: https://www.nesdev.org/w/index.php?title=APU_Triangle&oldid=24457
[nes-dmc]: https://www.nesdev.org/w/index.php?title=APU_DMC&oldid=24507
[nes-exp]: https://www.nesdev.org/w/index.php?title=Category:Expansion_audio&oldid=18360
[nes-vrc7]: https://www.nesdev.org/w/index.php?title=VRC7_audio&oldid=24131
[nes-n163]: https://www.nesdev.org/w/index.php?title=Namco_163_audio&oldid=23403
[nes-cic]: https://www.nesdev.org/w/index.php?title=CIC_lockout_chip&oldid=24095
[nes-fdsbios]: https://www.nesdev.org/w/index.php?title=FDS_BIOS&oldid=24615
[nes-fdsdisk]: https://www.nesdev.org/w/index.php?title=FDS_disk_format&oldid=23575
[nes-fdsfile]: https://www.nesdev.org/w/index.php?title=FDS_file_format&oldid=22826
[nes-xaa]: https://www.nesdev.org/w/index.php?title=Visual6502wiki/6502_Opcode_8B_(XAA,_ANE)&oldid=24142
[sd-65816]: https://snes.nesdev.org/w/index.php?title=65C816&oldid=1413
[sd-timing]: https://snes.nesdev.org/w/index.php?title=Timing&oldid=1467
[sd-openbus]: https://snes.nesdev.org/w/index.php?title=Open_bus&oldid=1174
[sd-errata]: https://snes.nesdev.org/w/index.php?title=Errata&oldid=1511
[sd-tricky]: https://snes.nesdev.org/w/index.php?title=Tricky-to-emulate_games&oldid=1221
[sd-ssmp]: https://snes.nesdev.org/w/index.php?title=S-SMP&oldid=1381
[sd-dma]: https://snes.nesdev.org/w/index.php?title=DMA_registers&oldid=1503
[sd-map]: https://snes.nesdev.org/w/index.php?title=Memory_map&oldid=1504
[sd-header]: https://snes.nesdev.org/w/index.php?title=ROM_header&oldid=1545
[sd-files]: https://snes.nesdev.org/w/index.php?title=ROM_file_formats&oldid=858
[sd-vectors]: https://snes.nesdev.org/w/index.php?title=CPU_vectors&oldid=535
[sd-boot]: https://snes.nesdev.org/w/index.php?title=Booting_the_SPC700&oldid=1321
[sd-superfx]: https://snes.nesdev.org/w/index.php?title=Super_FX&oldid=1107
[sd-bg]: https://snes.nesdev.org/w/index.php?title=Backgrounds&oldid=1244
[sd-sprites]: https://snes.nesdev.org/w/index.php?title=Sprites&oldid=1204
[sd-math]: https://snes.nesdev.org/w/index.php?title=Color_math&oldid=1387
[sd-windows]: https://snes.nesdev.org/w/index.php?title=Windows&oldid=1167
[sd-versions]: https://snes.nesdev.org/w/index.php?title=Version_differences&oldid=1328
[sd-sdsp]: https://snes.nesdev.org/w/index.php?title=S-DSP_registers&oldid=1428
[sd-brr]: https://snes.nesdev.org/w/index.php?title=BRR_samples&oldid=902
[sd-apupin]: https://snes.nesdev.org/w/index.php?title=APU_pinout&oldid=1523
[sd-ctrl]: https://snes.nesdev.org/w/index.php?title=Controller_reading&oldid=942
[sd-scope]: https://snes.nesdev.org/w/index.php?title=Super_Scope&oldid=1529
[sd-mode7]: https://snes.nesdev.org/w/index.php?title=Mode_7_transform&oldid=1410
[sd-multitap]: https://snes.nesdev.org/w/index.php?title=Multitap&oldid=884
[pd-rend]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Rendering.md
[pd-spec]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Specifications.md
[pd-z80]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/CPU_Comparison_with_Z80.md
[pd-int]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Interrupts.md
[pd-halt]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/halt.md
[pd-cgbregs]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/CGB_Registers.md
[pd-map]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Memory_Map.md
[pd-vram]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Accessing_VRAM_and_OAM.md
[pd-mbcs]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/MBCs.md
[pd-oamdma]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/OAM_DMA_Transfer.md
[pd-fifo]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/pixel_fifo.md
[pd-oam]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/OAM.md
[pd-stat]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/STAT.md
[pd-pal]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Palettes.md
[pd-audio]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Audio.md
[pd-audiodet]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Audio_details.md
[pd-audioreg]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Audio_Registers.md
[pd-sgb]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/SGB_Functions.md
[pd-intsrc]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Interrupt_Sources.md
[pd-timer]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Timer_Obscure_Behaviour.md
[pd-serial]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Serial_Data_Transfer_(Link_Cable).md
[pd-boot]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Power_Up_Sequence.md
[pd-sgbunlock]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/SGB_Unlocking.md
[sms-clockrate]: https://www.smspower.org/Development/ClockRate
[sms-interruptmechanism]: https://www.smspower.org/Development/InterruptMechanism
[sms-pausebutton]: https://www.smspower.org/Development/PauseButton
[sms-mappers]: https://www.smspower.org/Development/Mappers
[sms-romheader]: https://www.smspower.org/Development/ROMHeader
[sms-port3e]: https://www.smspower.org/Development/Port3E
[sms-sn76489]: https://www.smspower.org/Development/SN76489
[sms-sampleplayback]: https://www.smspower.org/Development/SamplePlayback
[sms-ym2413]: https://www.smspower.org/Development/YM2413
[sms-lightphaser]: https://www.smspower.org/Development/LightPhaser
[sms-paddle]: https://www.smspower.org/Development/Paddle
[sms-regiondetection]: https://www.smspower.org/Development/RegionDetection
[sms-bios]: https://www.smspower.org/Development/BIOS
[mdw-z80]: https://md.railgun.works/index.php?title=Zilog_Z80&oldid=269
[mdw-mcd]: https://md.railgun.works/index.php?title=Mega_CD&oldid=688
[mdw-vdp]: https://md.railgun.works/index.php?title=VDP&oldid=1156
[sr-spec]: https://segaretro.org/index.php?title=Sega_Mega_Drive/Technical_specifications&oldid=1158648
[sr-ym2612]: https://segaretro.org/index.php?title=YM2612&oldid=1149913
[sr-fm]: https://segaretro.org/index.php?title=FM_Sound_Unit&oldid=1152060
[ngd-clock]: https://wiki.neogeodev.org/index.php?title=Clock
[ngd-wait]: https://wiki.neogeodev.org/index.php?title=Wait_cycle
[ngd-lb]: https://wiki.neogeodev.org/index.php?title=Line_buffers
[ngd-sprites]: https://wiki.neogeodev.org/index.php?title=Sprites
[ngd-fps]: https://wiki.neogeodev.org/index.php?title=Framerate
[ngd-timer]: https://wiki.neogeodev.org/index.php?title=Timer_interrupt
[ngd-ym2610]: https://wiki.neogeodev.org/index.php?title=YM2610
[ngd-sysrom]: https://wiki.neogeodev.org/index.php?title=System_ROM
[ws-v30]: https://ws.nesdev.org/w/index.php?title=NEC_V30MZ&oldid=442
[ws-v30int]: https://ws.nesdev.org/w/index.php?title=NEC_V30MZ_interrupts&oldid=552
[ws-timing]: https://ws.nesdev.org/w/index.php?title=Timing&oldid=645
[ws-map]: https://ws.nesdev.org/w/index.php?title=Memory_map&oldid=513
[ws-pal]: https://ws.nesdev.org/w/index.php?title=Display/Palette&oldid=514
[ws-sound]: https://ws.nesdev.org/w/index.php?title=Sound&oldid=751
[ws-boot]: https://ws.nesdev.org/w/index.php?title=Boot_ROM&oldid=721
[wp-6502]: https://en.wikipedia.org/w/index.php?title=MOS_Technology_6502&oldid=1385548879
[wp-5a22]: https://en.wikipedia.org/w/index.php?title=Ricoh_5A22&oldid=1375573184
[wp-huc6280]: https://en.wikipedia.org/w/index.php?title=Hudson_Soft_HuC6280&oldid=1375176090
[wp-cp1600]: https://en.wikipedia.org/w/index.php?title=General_Instrument_CP1600&oldid=1372435639
[wp-7800]: https://en.wikipedia.org/w/index.php?title=Atari_7800&oldid=1384315726
[wp-lynx]: https://en.wikipedia.org/w/index.php?title=Atari_Lynx&oldid=1385284173
[wp-ngp]: https://en.wikipedia.org/w/index.php?title=Neo_Geo_Pocket&oldid=1367573321
[wp-segacd]: https://en.wikipedia.org/w/index.php?title=Sega_CD&oldid=1385340710
[wp-tg16]: https://en.wikipedia.org/w/index.php?title=TurboGrafx-16&oldid=1384843861
[wp-tia]: https://en.wikipedia.org/w/index.php?title=Television_Interface_Adaptor&oldid=1386648231
[wp-vectrex]: https://en.wikipedia.org/w/index.php?title=Vectrex&oldid=1386579084
[wp-ym2612]: https://en.wikipedia.org/w/index.php?title=Yamaha_YM2612&oldid=1384085778
[wp-satella]: https://en.wikipedia.org/w/index.php?title=Satellaview&oldid=1384890138
[wp-2600]: https://en.wikipedia.org/w/index.php?title=Atari_2600&oldid=1386797711
[pl-issues]: https://plutiedev.com/hardware-issues
[pl-dma]: https://plutiedev.com/dma-transfer
[pl-sram]: https://plutiedev.com/saving-sram
[pl-sprites]: https://plutiedev.com/sprites
[pl-water]: https://plutiedev.com/sonic-water
[pl-ramp]: https://plutiedev.com/vdp-color-ramp
[pl-ym]: https://plutiedev.com/ym2612-operations
[pl-ctrl]: https://plutiedev.com/controllers
[pl-header]: https://plutiedev.com/rom-header
[pl-subcpu]: https://plutiedev.com/subcpu-in-mode1
[pl-z80]: https://plutiedev.com/using-the-z80
[pl-kabuto]: https://plutiedev.com/mirror/kabuto-hardware-notes
[macd]: http://dreamjam.co.uk/emuviews/docindex.php
[segajp]: https://web.archive.org/web/20131016142854/http://sega.jp/fb/segahard/mcd/data.html
[segajp-live]: https://sega.jp/fb/segahard/mcd/data.html
[gbctr]: https://gekkio.fi/files/gb-docs/gbctr.pdf
[breaks]: https://github.com/emu-russia/breaks/blob/6aee24fb08390e5e6e1188756418f1c0a11ebff6/BreakingNESWiki_DeepL/Ricoh.md
[wdc02]: https://www.westerndesigncenter.com/wdc/documentation/w65c02s.pdf
[wdc816]: https://www.westerndesigncenter.com/wdc/documentation/w65c816s.pdf
[m68k]: https://www.nxp.com/docs/en/reference-manual/MC68000UM.pdf
[drc]: https://docs.libretro.com/development/cores/dynamic-rate-control/
[accoin]: https://github.com/100thCoin/AccuracyCoin/blob/20c6d23db0595ebbb989d91507adab2020148eb8/README.md
[mooneye]: https://github.com/Gekkio/mooneye-test-suite/blob/31510e12eea6286d36eea060a6adde755e1067aa/README.markdown
[mooneye-tree]: https://github.com/Gekkio/mooneye-test-suite/tree/31510e12eea6286d36eea060a6adde755e1067aa
[mealybug]: https://github.com/mattcurrie/mealybug-tearoom-tests/blob/70e88fb90b59d19dfbb9c3ac36c64105202bb1f4/README.md
[z80test]: https://github.com/raxoft/z80test/blob/c490c0ca94f1021509f8bd656b413861bd7cfb41/readme.txt
[sst-65x02]: https://github.com/SingleStepTests/65x02/blob/2f6980a2d95757486c7bee24355c360e40e2a224/README.md
[sst-z80]: https://github.com/SingleStepTests/z80/blob/ebe1875d48f374bcfd4b505d8eb8ee751568b5f7/README.MD
[sst-m68000]: https://github.com/SingleStepTests/m68000/blob/64b253116a3de04aaac4346c43680960dc9b67e5/README.md
[sst-huc6280]: https://github.com/SingleStepTests/huc6280/blob/4ce378e04e243437e6f74dfe76c3cb7c70e45bf1/README.md
[sst-sm83]: https://github.com/SingleStepTests/sm83/blob/f9c30210245dd691661db39f5ace022c465ecc2f/README.MD
[sst-spc700]: https://github.com/SingleStepTests/spc700/tree/67d15f492b2740964abd4efd1229e0ec9c342228
[sst-org]: https://github.com/SingleStepTests
[spctest]: https://github.com/gilyon/snes-tests/blob/5ecdf555da920f0bd7b157542141965a8120186d/spctest/README.md
[jgenesis]: https://github.com/jsgroth/jgenesis/blob/8d1bdfba460b3a49b493aa00368926ea375d6074/backend/genesis-components/src/vdp.rs
[jgenesis-bus]: https://github.com/jsgroth/jgenesis/blob/8d1bdfba460b3a49b493aa00368926ea375d6074/backend/genesis-core/src/bus.rs
[blastem]: https://www.retrodev.com/repos/blastem/file/ce5e85c3b219/vdp.c
[ares-dma]: https://github.com/ares-emulator/ares/blob/ef33a8046b68d6a5c3ac3db034671f1c35b10987/ares/md/vdp/dma.cpp
[ares-sfc]: https://github.com/ares-emulator/ares/blob/ef33a8046b68d6a5c3ac3db034671f1c35b10987/ares/sfc/system/system.hpp
[ares-tree]: https://github.com/ares-emulator/ares/tree/ef33a8046b68d6a5c3ac3db034671f1c35b10987/ares
[bsnes-hpp]: https://github.com/bsnes-emu/bsnes/blob/78474e5d39f58872dc21aca18cf9eb583b147fe7/bsnes/sfc/system/system.hpp
[bsnes-cpp]: https://github.com/bsnes-emu/bsnes/blob/78474e5d39f58872dc21aca18cf9eb583b147fe7/bsnes/sfc/system/system.cpp
[mesen2]: https://github.com/SourMesen/Mesen2
[sameboy-shader]: https://github.com/LIJI32/SameBoy/blob/ea667ad79aa28409f034b1fd6da7304e1844750d/Shaders/MasterShader.fsh
[freeintv]: https://github.com/libretro/FreeIntv/blob/ef3e0fe322bec62a7f916c0bb0834c08c348d0b4/LICENSE
[jzintv]: https://github.com/lutris/jzintv/blob/d373ec286e76028b720534af318f8905ea4b7da7/COPYRIGHT.txt
[blissemu]: https://github.com/jeremiah-sypult/BlissEmu/blob/9767e4632d1a0ff1611d29338bcabc7a4a5698a7/README.md
[intv-wiki]: http://wiki.intellivision.us/index.php/Main_Page
[ngpcraft]: https://github.com/tixul/NgpCraft_dev_ref
[us3991307]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/3991307
[us4949298]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/4949298
[us4799635]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/4799635
[us5134391]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5134391
[us5291189]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5291189
[us5327158]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5327158
[us4951038]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/4951038
[us4924744]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/4924744
[us5086475]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5086475
[us5761643]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5761643
