---
title: "Home computers: catalogue"
roadmap_item: R1-09
status: approved
date: 2026-11-26
---

# Home computers: catalogue

## Summary

This note asks which home computers games were sold for, and what hardware, firmware, and sources each has,
so that [R1-27][fam] knows what it surveys.

It lists about 70 machines and families from the 1977 trinity to the last new lines of 1992, grouped as North American,
British, Japanese, continental European, and 16-bit and 32-bit machines,
with minor machines in short rows and a note on Eastern Bloc clones.
Eight consoles built from home computers stay in [R1-05][r105] and [R1-06][r106] and are cross-referenced here.

Firmware matters most to Rustalgia.
Nearly every row boots from a ROM that holds its BASIC or operating system, and few rights holders have said anything:
Amstrad allows its own CPC and Spectrum code to be shared, Cloanto licenses the Commodore and Amiga ROMs commercially,
the MSX Association holds the MSX copyrights and has licensed only official products,
and Sharp's X68000 system software was released free in 2000.
Every open replacement found, from C-BIOS to EmuTOS, is closed to the project because it reimplements system software.

The note settles the boundary as a process call: IBM PC compatibles, DOS, and the classic Macintosh are boundary cases,
outside R1-27, while the PC-9801, FM Towns, and X68000 are in.
It recommends that R1-27 study nine families in depth: the Commodore 8-bit line, the Amiga, the ZX Spectrum,
the Apple II, the Atari 8-bit and ST lines, the Amstrad CPC, MSX, and the BBC Micro; the owner decides.
Including DOS would add a platform with 8,462 games in [MobyGames][moby], about a fifth of the home-computer total.

## Scope

- Question: which home computers were sold with games as a main use, and for each, what are its maker, first sale,
  processor, video, sound, memory, media, firmware and its status, and best sources?
- Covered: home computers of every region, as "How the catalogue is built" defines them, with IBM PC compatibles, DOS,
  the classic Macintosh, and later machines as boundary cases.
  Left to other items: emulators to [R1-27][fam];
  the consoles built from home computers to [R1-05][r105] and [R1-06][r106]; emulator hosts, retro "mini" computers,
  and FPGA boxes to [R3-07][hosts] and [R3-12][hosts]; firmware engineering to [R2-12][eng]; the law,
  beyond whether each firmware has been published or licensed, to [R0-02][r002].
- Researched on 2026-11-26 by three research agents, for North American and British machines with the PC and Mac,
  for Japanese and continental machines, and for the boundary, firmware rights, and hubs.
  They read every page as raw text, Wikipedia as raw wikitext pinned to a revision, and quoted only from it.
  The writer worked from their evidence and the repository's notes;
  one pass of fresh verifiers checked the claims and quotations against their sources,
  and a fix pass applied their findings.
- Every Wikipedia article read was searched for "leak"; two that mention leaked material are closed
  as a precaution (Sources).
  No emulator source file, issue, or pull request, no firmware, ROM, game, or key,
  and no maker manual hosted by others was opened.
  One closed site was opened in error: the index of Antoine Miné's Thomson pages at `mine.perso.lip6.fr/mess`,
  which links ROM and game downloads; nothing was followed or relied on, and the copy was deleted (research log).
- Wikipedia is tertiary: a value with no other source named rests on the article's text,
  whose citations were not followed unless a finding says so.
  Markers follow the [research guide][guide]; a statement that nothing was found records the searches made.
  Memory that sources give in "KB" is written in KiB, disk capacities keep the source's unit,
  and clocks are as each source gives them.
  This note is not legal advice.

## Findings

### How the catalogue is built

- A home computer here is a microcomputer line sold to homes,
  in which games were a main use and were sold commercially in quantity, first sold from 1977 to the early 1990s.
  Wikipedia dates the class from 1977, lists its common uses as word processing, games, and programming,
  and has it vanish "by the early 1990s in the US" and by the mid-1990s in Europe
  ([Wikipedia, "Home computer"][w-home]);
  its timeline ends with the MSX turbo R, Atari Falcon, and Amiga 1200, of 1991 and 1992.
  The rule is a process call settled in this note.
- A row is one machine or one compatible family, as in [R1-05][r105-built].
  Models and regional variants that run the same hardware are modes of one target, named in the row;
  a model with its own chips, ROM, or timing gets its own hardware line.
  A device already in a console catalogue keeps its row there, with a cross-reference here.
- "Games" is the number MobyGames lists
  for the platform, from a capture of its platform list of 2026-09-12 ([MobyGames][moby]).
  It counts database entries, a game on several platforms counts on each, and it is a rough size;
  a dash means the list has no such platform.
- In the hardware tables a dash means no source read gives the value.
  Regions: NA North America, UK United Kingdom, EU Europe, DE Germany, ES Spain, FR France, JP Japan, KR South Korea.
- Every row rests on the Wikipedia article on the machine and its models, pinned in Sources,
  unless a bullet names another source; Japanese and French Wikipedia are used for machines of those markets.

### North America

| Machine (models folded in) | Maker | First sale | Games |
|---|---|---|---|
| Apple II (II+, IIe, IIc, IIc Plus) | Apple Computer | NA 1977-06-10 | 2,995 |
| Apple IIGS | Apple Computer | NA 1986-09-15 | 220 |
| PET (CBM) | Commodore | NA 1977-01 (infobox) | 834 |
| VIC-20 | Commodore | JP 1980; NA, EU 1981 | 968 |
| Commodore 64 | Commodore | NA 1982-08 | 5,750 |
| Commodore 128 | Commodore | 1985-01 | 30 |
| Commodore 16 and Plus/4 | Commodore | 1984 | 514 |
| Atari 8-bit (400, 800; XL; XE) | Atari Inc.; Atari Corp. from 1984 | NA 1979-11 | 2,229 |
| TRS-80 Model I, III, and 4 | Tandy (Radio Shack) | NA 1977-08-03; Model 4 1983-04-26 | 1,407 |
| TRS-80 Color Computer (CoCo 2, 3) | Tandy; made by Motorola | NA 1980-09 | 1,122 |
| TRS-80 MC-10 (Matra Alice in FR) | Tandy | NA 1983 | 14 |
| TI-99/4 and TI-99/4A | Texas Instruments | NA 1979-10; 99/4A 1981-06 | 245 |

| Machine | CPU and clock | Video; sound | RAM | Media |
|---|---|---|---|---|
| Apple II | 6502, 1.023 MHz; 65C02 later | lo-res, hi-res; 1-bit | 16 KiB to 1.125 MiB | cassette, 140 KB disk |
| Apple IIGS | 65C816, 2.8 MHz | 320 × 200, 640 × 200; Ensoniq ES5503, 32 voices | 256 KiB to 8 MiB | 800 KB disk |
| PET | 6502, 1 MHz | monochrome PETSCII; none or beeper | 4 to 96 KiB | cassette, 5.25-, 8-inch floppy |
| VIC-20 | 6502, 1.108 MHz PAL, 1.02 MHz NTSC | MOS VIC, with 3 square and 1 noise voice | 5 KiB | cassette, floppy |
| C64 | 6510 or 8500, 1.023 MHz NTSC, 0.985 MHz PAL | VIC-II, 320 × 200, sprites; SID | 64 KiB | cassette, floppy |
| C128 | 8502, 1 or 2 MHz; Z80, 4 MHz | VIC-II E and 8563 (80 columns); SID | 128 KiB | cassette, floppy |
| C16, Plus/4 | 7501 or 8501, 1.76 MHz | TED, 320 × 200, 121 colours, 2 voices | 16 or 64 KiB | cassette, floppy |
| Atari 8-bit | 6502B or SALLY, 1.79 MHz NTSC, 1.77 MHz PAL | ANTIC, CTIA or GTIA; POKEY | 8 to 128 KiB | cartridge |
| TRS-80 I to 4 | Z80, 1.774 MHz (I); Z80A, 4 MHz (4) | 64 × 16 text, semigraphics; tones | 4 to 128 KiB | — |
| CoCo | 6809E, 0.895 or 1.79 MHz | MC6847 VDG; 6-bit DAC | 4 to 512 KiB | — |
| MC-10 | MC6803, 0.89 MHz | MC6847 | 4 KiB, to 20 KiB | — |
| TI-99/4A | TMS9900 (16-bit), 3 MHz | TMS9918A (TMS9929 PAL); TMS9919 | 16 KiB video | cartridge, cassette, floppy |

- Apple II models: II+ 1979-06, IIe 1983-01, IIc 1984-04-24; the IIc Plus could run at 4 MHz,
  and the series was made until 1993.
  The Apple III of 1980 was mainly a business machine and is left out (inference).
- The C128's C64 and CP/M modes are modes of one target (inference).
  The VIC-20, C64, and Atari 8-bit lines have their own PAL and NTSC clocks, as R1-05 found for consoles.
- Atari 8-bit: the 400 and 800 of 1979, the XL of 1983, and the XE of 1985,
  with RAM from 8 KiB to the 130XE's 128 KiB and peripherals on the SIO bus
  ([Wikipedia, "Atari 8-bit computers"][w-atari8]);
  Atari BASIC revision C is built into later 800XL and all XE models ([Wikipedia, "Atari BASIC"][w-ataribasic]).
  The Atari 400 Mini of 2024 is a host for [R3-12][hosts] (the same article).
- The TRS-80 Model 4 runs a Model III mode (inference); the Model III of 1980 has no article of its own,
  and the CoCo 2 of 1983 and CoCo 3 of 1986 are dated from memory.
- At the June 1983 CES, TI said only cartridges with a TI-licensed lock-out chip would work,
  and units made from August 1983 may carry it ([Wikipedia, "TI-99/4A"][w-ti99]): the one home-computer lock-out found.

### Britain

| Machine (models folded in) | Maker | First sale | Games |
|---|---|---|---|
| ZX80 | Sinclair Research | UK 1980-01-29 | 15 |
| ZX81 (Timex Sinclair 1000, 1500) | Sinclair; made by Timex | UK 1981-03-05 | 311 |
| ZX Spectrum (16K, 48K, +) | Sinclair; Amstrad from 1986 | UK 1982-04-23; DE 1983; US 1983-11 | 3,679 |
| ZX Spectrum 128 and +2 | Sinclair and Investrónica; Amstrad | ES 1985-09; UK 1986-01 | in Spectrum |
| ZX Spectrum +2A and +3 | Amstrad | 1987 (+3) | in Spectrum |
| Timex Sinclair 2068 | Timex | US 1983-11 | 14 |
| Sinclair QL | Sinclair Research | UK 1984-01-12 | 69 |
| Acorn Atom | Acorn | UK 1980-03 | 38 |
| BBC Micro (A, B, B+; Master) | Acorn, for the BBC | UK 1981-12-01; Master 1986 | 1,373 |
| Acorn Electron | Acorn | UK 1983-08-25 | 686 |
| Amstrad CPC (464, 664, 6128; Plus) | Amstrad; Schneider in DE | UK 1984; Plus 1990 | 2,364 |
| Amstrad PCW | Amstrad | UK 1985-09 | 126 |
| Dragon 32 and 64 | Dragon Data | UK 1982-08 | 677 |
| Oric-1 and Atmos | Tangerine | UK 1982-09-01 | 138 |
| SAM Coupé | Miles Gordon Technology | UK 1989 | 29 |
| Enterprise 64 and 128 | Intelligent Software | 1985-06-23 | 31 |

| Machine | CPU and clock | Video; sound | RAM | Media |
|---|---|---|---|---|
| ZX80, ZX81 | Z80 (mostly NEC μPD780C-1), 3.25 MHz | monochrome | 1 KiB, to 16 KiB (80), 64 KiB (81) | cassette |
| Spectrum | Z80A; 3.5469 MHz (128) | ULA, 256 × 192; beeper; AY-3-8912 (128) | 16 to 128 KiB | tape, Microdrive, disk |
| TS 2068 | Z80A, 3.5 MHz | Timex SCLD; beeper and AY-3-8912 | 48 KiB | cassette |
| QL | 68008 | ZX8301; Intel 8049 for sound | 128 KiB | Microdrive |
| Atom | 6502, 1 MHz | MC6847 (from memory) | 2 to 12 KiB | cassette, 100 KB floppy |
| BBC Micro | 6502, 2 MHz; 65SC12 in the Master | 6845, SAA5050 teletext; SN76489 | 16 to 512 KiB | cassette, floppy |
| Electron | 6502A, 2 MHz (ROM), 1 MHz (RAM) | Ferranti ULA; tone and noise | 32 KiB | cassette, floppy, cartridge |
| CPC | Z80A, 4 MHz | 6845, gate array, up to 640 × 200; AY-3-8912 | 64 or 128 KiB | cassette, 3-inch floppy |
| PCW | Z80 | 720 × 256 monochrome | 256 KiB to 1 MiB | 3-inch, 3.5-inch floppy |
| Dragon | 6809E, 0.89 MHz | MC6847; 1-bit | 32 or 64 KiB | — |
| Oric | 6502A, 1 MHz | HCS 10017 ULA, 240 × 200, 8 colours; AY-3-8912 | 16 or 48 KiB | cassette, floppy |
| SAM Coupé | Z80B, 6 MHz | VGT-200 ASIC; Philips SAA1099, 6 voices | 256 or 512 KiB | 3.5-inch floppy, cassette |
| Enterprise | Z80A, 4 MHz | Nick, 256 colours; Dave, 3 voices, noise, stereo | 64 or 128 KiB | cartridge (BASIC) |

- The 128 was "jointly developed by Sinclair Research and Investrónica", came out in Spain before Britain,
  and pages its 32 KiB ROM and 128 KiB RAM ([Sinclair Wiki, "ZX Spectrum 128"][sw-128]).
  Some 48K and 128K games fail on the +2A and +3
  ([Wikipedia, "ZX Spectrum"][w-zx]),
  so the 48K, the 128, and the +2A/+3 are three targets, and the TS 2068, with its own chip
  and ROM, a fourth (inference).
- On 16K and 48K machines the ULA delays the Z80's accesses to `0x4000` to `0x7FFF`,
  by 6 T-states at the first contended cycle
  ([Sinclair Wiki, "Contended memory"][sw-cont]): the hub reaches timing depth.
- The QL was aimed at business, and whether games were a main use is doubtful (inference);
  the PCW was "not designed for video games, although several graphical games exist"
  ([Wikipedia, "Amstrad PCW"][w-pcw]).
  Both stay as short rows.
- The SAM Coupé was designed with a compatibility mode for the 48K Spectrum
  ([Wikipedia, "SAM Coupé"](https://en.wikipedia.org/w/index.php?oldid=1355666749));
  the Dragons closely resemble the TRS-80 Color Computer
  ([Wikipedia, "Dragon 32/64"](https://en.wikipedia.org/w/index.php?oldid=1371935270)),
  and the Oric Atmos of 1984 succeeds the Oric-1
  ([Wikipedia, "Oric"](https://en.wikipedia.org/w/index.php?oldid=1386181021)).
  The Enterprise's catalogue holds about 40 games
  ([Wikipedia, "Enterprise"][w-ent]),
  and [the Electron's article](https://en.wikipedia.org/w/index.php?oldid=1386167866) claims about 1,400,
  marked "citation needed".

### Japan and the MSX standard

| Machine (models folded in) | Maker | First sale | Games |
|---|---|---|---|
| MSX1 | ASCII's standard; 22 makers named | JP 1983-10-21; worldwide | 1,501 (all MSX) |
| MSX2 | several makers | 1985, worldwide | in MSX |
| MSX2+ | Sony, Sanyo, Panasonic | JP 1988-10-21 | in MSX |
| MSX turbo R (FS-A1ST, FS-A1GT) | Panasonic | JP 1990 | in MSX |
| Sharp MZ-80K line (80K, 80A, 700, 800, 1500) | Sharp | JP 1978; EU 1979 | 142 |
| Sharp MZ-80B line (80B, 2000, 2200, 2500) | Sharp | JP 1981 | 147 |
| Sharp X1 (turbo, turbo Z, twin) | Sharp | JP 1982 | 400 |
| NEC PC-6001 (mkII, SR, PC-6601; TREK in NA) | NEC | JP 1981-11-10 | 149 |
| NEC PC-8801 (mkII SR, FH, MH, FA; PC-88VA) | NEC | JP 1981 | 690 |
| Fujitsu FM-7 (FM-NEW7, FM77, FM77AV line) | Fujitsu | JP 1982-11; also ES | 418 |

| Machine | CPU and clock | Video; sound | RAM | Media |
|---|---|---|---|---|
| MSX1 | Z80A, 3.58 MHz | TMS9918 family, 16 KiB video; AY-3-8910 | 8 KiB minimum | cartridge, cassette, floppy |
| MSX2 | Z80A, 3.58 MHz | Yamaha V9938, 128 KiB video; YM2149 | 64 KiB minimum, mapped | as MSX1 |
| MSX2+ | Z80-compatible, 3.58 MHz | V9958; YM2413 and Y8950 optional | commonly 64 KiB | as MSX1 |
| turbo R | R800, 7.16 MHz, and Z80-compatible, 3.58 MHz | V9958; YM2149, YM2413, 8-bit PCM | 256 or 512 KiB | as MSX1 |
| MZ-80K line | Sharp LH0080A (Z80A-compatible) | SN76489 on the MZ-800 | 48 KiB (80K) | cassette; Quick Disk |
| MZ-80B line | Z80; Z80B, 6 MHz on the MZ-2500 | 320 × 200 (80B); YM2203 (2500) | — | — |
| X1 | Z80A, 4 MHz | PCG characters; AY-3-8910 or YM2149, later YM2151 | 64 KiB | cassette, floppy |
| PC-6001 | NEC μPD780C-1, 3.9936 MHz | M5C6847P-1 (MC6847 clone); AY-3-8910 | 16 to 32 KiB | cartridge, cassette |
| PC-8801 | μPD780C-1, 4 MHz; μPD70008, 8 MHz from FH | 640 × 200; YM2203 from mkII SR, YM2608 from FA | 64 KiB | — |
| FM-7 | two 68B09, 2 MHz | 640 × 200, 8 colours; AY-3-8910; YM2203 from FM77AV | 64 or 128 KiB | cassette, 5.25-inch |

- The MSX rows are from the standard's tables
  ([Wikipedia, "MSX"][w-msx], "System specifications")
  and the MSX Resource Center wiki ([MSX1][msx-1], [MSX2][msx-2], [MSX2+][msx-2p], [MSX turbo R][msx-tr]).
  The wiki says "no MSX2+ system was manufactured or sold outside Japan",
  where Wikipedia names upgrades in Europe and Brazil; Wikipedia ends turbo R production in 1993 and the wiki in 1994,
  neither with a citation.
- The R800 is a superset of the Z80 with multiply instructions, run at 7.159 MHz from a 28.6363 MHz oscillator,
  and its undocumented flags differ, so it fails ZEXALL
  ([MSX Resource Center wiki, "ASCII R800"][msx-r800]): a CPU target of its own.
- The SG-1000, Memotech MTX, Tatung Einstein, and ColecoVision resemble MSX1 but none is fully compatible.
  Among MSX machines, putting one model's BIOS in another can give wrong keyboard scan codes
  ([Wikipedia, "MSX"][w-msx]).
- The MZ line up to the MZ-2200 of 1983 and the X1 hold no language in ROM and load BASIC from tape
  ([Wikipedia, "Sharp MZ"][w-mz]; [Wikipedia, "Sharp X1"][w-x1]);
  the MZ-700 is "More-or-less fully compatible" with the MZ-80K, and the MZ-3500 and 5500 are another architecture.
  The X1 twin of 1987 holds a PC Engine, which is in [R1-05][r105].
- The PC-6001's clock is 3.8 MHz in English Wikipedia; Japanese gives 3.9936 MHz uncited for the PC-6001,
  and the same figure for the mkII citing ASCII of October 1983, which the table keeps
  ([Wikipedia, "PC-6000 series"][w-pc6001]; [Japanese Wikipedia, "PC-6000シリーズ"][ja-pc6001]).
- English Wikipedia calls the PC-8801, FM-7, X1, and MSX the "four major Japanese home computers of the 1980s"
  ([Wikipedia, "PC-8800 series"][w-pc88]); the PC-88VA of 1987 has a 16-bit μPD9002 at 8 MHz.
  The FM77AV of 1985 shows 4,096 colours ([Wikipedia, "FM-7"][w-fm7]); the FM-11 is a business machine, left out
  (from memory).

### Continental Europe

| Machine (models folded in) | Maker | First sale | Games |
|---|---|---|---|
| Thomson TO line (TO7, TO7/70, TO9, TO8, TO8D, TO9+) | Thomson | FR 1982-12-01 | 111 |
| Thomson MO line (MO5, MO5E, MO5NR, MO6; Prodest PC128) | Thomson; Olivetti in Italy | FR 1984 | 91 |

| Machine | CPU and clock | Video; sound | RAM | Media |
|---|---|---|---|---|
| TO7 | 6809, 1 MHz | 320 × 200, 8 colours, 2 per 8 × 1; sound by extension | 8 to 32 KiB, 16 KiB video | MEMO7, tape |
| TO8, TO9, TO9+ | 6809E, 1 MHz | EF9369 palette; 1-bit and 6-bit DAC (TO8) | 128 to 512 KiB | — |
| MO5 | 6809E, 1 MHz | EFGJ03L gate array; 1-bit | 32 KiB, 16 KiB video | cassette, cartridge |
| MO6 | 6809E, 1 MHz | EF9369 | 128 KiB | — |

- The Thomson rows merge English and French Wikipedia, keeping French where they differ:
  the TO7's ROM is 4 KiB in English and 6 KiB in French, its RAM 22 KiB in English,
  and the TO8 has BASIC 512 in ROM by French
  ([Wikipedia, "Thomson TO7"][w-to7]; [French Wikipedia, "Thomson TO7"][fr-to7];
  [French Wikipedia, "Thomson TO8"][fr-to8]).
- The MO and TO lines are not compatible with each other, so two targets
  (from memory; no article read says so);
  the MO6 is mostly compatible with the MO5, and the Italian Prodest PC128 is an MO6 with its own ROM and keyboard,
  a regional mode ([French Wikipedia, "Thomson MO6"][fr-mo6]); the TO16 is a PC compatible, outside the line
  (from memory).
- The MO5, TO7/70, and MO5NR equipped the Plan informatique pour tous, a school scheme abandoned in 1989,
  and Exelvision was among its suppliers ([French Wikipedia, "Plan informatique pour tous"][fr-pipt]).
- Micronique's Hector has no article in English or French under the names tried, and is not catalogued.

### 16-bit and 32-bit machines

| Machine (models folded in) | Maker | First sale | Games |
|---|---|---|---|
| Amiga, OCS (A1000, A500, A2000) | Commodore; Escom 1995 to 1996 | NA 1985-07-23; A500 NL 1987-04 | 3,993 (all) |
| Amiga, ECS (A3000, A600; ECS from memory) | Commodore | A3000 1990-06; A600 1992-03 | in Amiga |
| Amiga, AGA (A1200, A4000) | Commodore | 1992-10-21 | in Amiga |
| Atari ST (520ST, 1040ST, Mega; STE) | Atari Corp. | NA 1985-06; STE late 1989 | 2,527 (all) |
| Atari TT030 | Atari Corp. | 1990 | in ST |
| Atari Falcon030 | Atari Corp. | 1992 | in ST |
| Acorn Archimedes | Acorn | UK 1987-06 | 249 (Acorn 32-bit) |
| Sharp X68000 (to X68030) | Sharp | JP 1987-03-28 | 480 |
| NEC PC-9801 | NEC | JP 1982-10 | 1,448 (PC-98) |
| Fujitsu FM Towns (Towns II) | Fujitsu | JP 1989-03; announced 1989-02-28 | 509 |

| Machine | CPU and clock | Video; sound | RAM | Media |
|---|---|---|---|---|
| Amiga OCS | 68000, 7.16 MHz NTSC, 7.09 MHz PAL | Agnus, Denise; Paula, 4 × 8-bit | 256 KiB to 1 MiB | 880 KB floppy |
| Amiga ECS | 68030, 16 or 25 MHz (A3000); 68000 (A600) | ECS; Paula | — | floppy |
| Amiga AGA | 68EC020, 14 MHz; 68EC030 or 68040, 25 MHz | AGA; Paula | 2 MiB (A1200) | floppy |
| ST, STE | 68000, 8 MHz | up to 640 × 400; YM2149F; STE: blitter, 8-bit DMA PCM | 512 KiB to 4 MiB | — |
| TT030 | 68030, 32 MHz, 16 MHz bus | TT Shifter; YM2149 and STE PCM | — | — |
| Falcon030 | 68030, 16 MHz; 56001 DSP, 32 MHz | VIDEL; 16-bit DMA sound and PSG | — | — |
| Archimedes | ARM2, 8 MHz (from memory) | MEMC, VIDC1, IOC; 8 sound channels | 512 KiB to 16 MiB | — |
| X68000 | 68000, 10 MHz; 16 MHz (XVI); 68EC030, 25 MHz | Sharp-Hudson chips; YM2151, MSM6258 | — | 1.2 MB floppy |
| PC-9801 | 8086, 5 MHz (first model) | two μPD7220; beeper; FM by board | 128 to 640 KiB | — |
| FM Towns | i386DX, 16 MHz | up to 720 × 512, sprites; YM2612-class FM, RF5C68 PCM | — | CD-ROM |

- Amiga: OCS has three custom chips, with the blitter and copper in Agnus
  ([Wikipedia, "Amiga Original Chip Set"][w-ocs]); the line sold about 4.91 million ([Wikipedia, "Amiga"][w-amiga]).
  The A1000 loaded Kickstart from floppy, and later models carry it in ROM ([Wikipedia, "Kickstart (Amiga)"][w-kick]).
  OCS, ECS, and AGA are three chipset levels, with models as modes within each (inference).
- ST line: the STE adds a 4,096-colour palette and PCM at four rates from 6,258 to 50,066 Hz,
  and its joystick ports were reused on the Jaguar, a sentence the article marks "citation needed"
  ([Wikipedia, "Atari ST"][w-st]; [Wikipedia, "Atari TT030"][w-tt]);
  the Falcon's analogue joystick ports are compatible with the STE's and the Jaguar's
  ([Wikipedia, "Atari Falcon"][w-falcon]).
- Archimedes: Arthur, then RISC OS 2 and 3
  ([Wikipedia, "Acorn Archimedes"][w-arc]);
  later Acorn machines such as the Risc PC fall outside the dates (from memory).
- X68000: Japan only, 130,000 units by September 1991, citing LOGiN ([Japanese Wikipedia, "X68000"][ja-x68k]).
  Two conflicts stay recorded: 32 sprites per scan line in English and 16 in Japanese Wikipedia,
  and 128 KiB of BIOS ROM in English against 256 KiB of IPL and BIOS ROM in Japanese,
  each beside a 768 KiB character-generator ROM ([Wikipedia, "X68000"][w-x68k]).
- PC-9801: sound came on C-bus boards, the -26 with the YM2203 and the -86 of 1993 with the YM2608;
  the line ran to 2003-09-30 with Pentium PC-9821 models ([Wikipedia, "PC-98"][w-pc98]).
- FM Towns: every model has a CD-ROM drive; English Wikipedia gives release on 1989-02-28,
  which Japanese calls the announcement,
  and Japanese quotes Fujitsu's magazine FUJITSU of July 1994 that the machine appeared in March 1989 (secondary);
  production ended in 1997 ([Wikipedia, "FM Towns"][w-towns]; [Japanese Wikipedia, "FM TOWNS"][ja-towns]).
  Its ROM holds MS-DOS 3.1 as well as Fujitsu's code
  (Japanese article), and a minimal MS-DOS in ROM starts Towns OS from CD-ROM (English article).

### Minor machines

These rows sold few games or are known from Wikipedia alone, so they are grouped in one table to keep the note short.

| Machine | Maker, first sale | CPU; video; sound | Games |
|---|---|---|---|
| Coleco Adam | Coleco, NA 1983-10 | Z80A, 3.58 MHz; TMS9928A; SN76489AN | 39 |
| Mattel Aquarius | Mattel, NA 1983-06 | Z80A, 3.5 MHz; TEA1002; one voice | 21 |
| Exidy Sorcerer | Exidy, NA 1978-04-28 | Z80, 2.1 MHz; 64 × 30 characters; none | 83 |
| Ohio Scientific | Ohio Scientific, from 1977 | 6502 | 160 |
| Spectravideo SV-318, SV-328 | Spectravideo | — | 35 |
| Jupiter Ace | Jupiter Cantab, UK 1982-09-22 | Z80; Forth in ROM | 40 |
| Camputers Lynx | Camputers, UK 1983-03 | Z80A, 4 or 6 MHz; 6845; 6-bit DAC | 18 |
| Memotech MTX | Memotech, UK 1983 | Z80A; TMS9929A or 9928A; SN76489A | 28 |
| Tatung Einstein | Tatung of Taiwan, UK 1984 | Z80A, 4 MHz; TMS9129; AY-3-8910 | 36 |
| NEC PC-8001 | NEC, JP 1979 | μPD780C-1, 4 MHz; μPD3301; beeper | 149 |
| Fujitsu FM-8 | Fujitsu with Casio, JP 1981-05 | 68A09, 1.2 MHz, and 6809; 640 × 200; beeper | — |
| Sord M5 | Sord and Takara, JP 1982-11; UK, KR | Z80A, 3.58 MHz; TMS9918; SN76489 | 25 |
| Tomy Tutor (Pyūta) | Tomy, made by Matsushita, JP 1982-09 | TMS9995; TMS9918; SN76489AN | 19 |
| Toshiba Pasopia (5, 7) | Toshiba, JP 1981 | Z80A, 4 MHz | 39 |
| Bandai RX-78 | Bandai, JP 1983-07 | Sharp LH0080A (Z80A); SN76489 | 5 |
| Casio PV-2000 | Casio, JP (from memory) | — | — |
| Sony SMC-777; Mitsubishi MULTI8 | JP 1983-11-01; JP 1983-09 | — | 30; 8 |
| EXL 100 | Exelvision, FR 1984 | TMS 7020; TMS 3556; TMS 5220 speech | 9 |
| Matra Alice | Matra and Hachette, FR 1983 | 6803; MC6847 | 8 |
| Philips VG5000 | Philips, made by Radiotechnique, FR 1984-10-01 | Z80; EF9345; one voice | 21 |
| Philips P2000 | Philips Austria, 1980-03 | Z80, 2.5 MHz; SAA5050 teletext | 70 |

- The Adam runs ColecoVision cartridges with the console's chips and OS-7
  ([Wikipedia, "Coleco Adam"][w-adam]),
  and the Aquarius' infobox names the Intellivision as its predecessor ([Wikipedia, "Mattel Aquarius"][w-aquarius]).
- Ohio Scientific's article has no hardware fields but names the 6502 of its first board,
  and Microsoft's BASIC README names OSI as a target ([microsoft/BASIC-M6502][msbasic]).
  The PV-2000 has no article read; the Japanese ぴゅう太 article names it only in a see-also line.
  The Spectravideo models are the MSX's predecessor ([Wikipedia, "MSX"][w-msx]).
- The Tomy Tutor's date is from [Japanese Wikipedia, "ぴゅう太"][ja-pyuta],
  and the SMC-777 and MULTI8 rest on Japanese Wikipedia alone
  ([SMC-777][ja-smc]; [MULTI8][ja-multi8]); the Hitachi Basic Master is named in the MSX article only.
  The RX-78's article gives it a console generation, "Third" ([Wikipedia, "Bandai RX-78"][w-rx78]).
- The Matra Alice "was a clone of the TRS-80 MC-10"
  ([Wikipedia, "Matra Alice"](https://en.wikipedia.org/w/index.php?oldid=1351078333)),
  so a mode of that target (inference).
  The VG5000's 300,000 sales in 1984 rest on an internal Philips report,
  though its article calls the machine unsuccessful
  ([Wikipedia, "Philips VG5000"](https://en.wikipedia.org/w/index.php?oldid=1379793913)),
  and the P2000 gained popularity in the Netherlands
  ([Wikipedia, "Philips P2000"](https://en.wikipedia.org/w/index.php?oldid=1335977782)).

### Eastern Bloc machines

These are a boundary note, not rows: they are many, most rest on Wikipedia alone, and most are clones of rows above.

| Machine | Origin, first sale | CPU | Relation |
|---|---|---|---|
| Pentagon | USSR, 1989 | Z80 family, 3.5 MHz, 7 MHz turbo | Spectrum clone, with TR-DOS |
| Didaktik | Czechoslovakia | — | Spectrum clone |
| Agat | USSR, 1983 | 6502, 1 MHz | Apple II-like, not fully compatible (from memory) |
| Pravetz 82 | Bulgaria, 1983 | 6502, 1 MHz | Apple II clone |
| Elektronika BK-0010 and 0011 | USSR, 1985 | K1801VM1 (PDP-11 family) | original design |
| Vector-06C | USSR, 1987 | KR580VM80A (8080 clone) | original design |
| Robotron KC 85/2 to /4 | East Germany, 1985 | U880 (Z80 clone) | original design |
| Galaksija | Yugoslavia, 1983 | Z80A | build-it-yourself, published in a magazine |

- [Wikipedia's list of Spectrum clones][w-zxclones] runs to 348 lines of wikitext;
  that Pentagon timing differs from Sinclair's is from memory only.
- A clone is a variant of the system it copies, as [R1-08][r108] rules,
  and one with its own timing is its own target (inference).

### Consoles built from home computers

| Console | Catalogued in | Host family here |
|---|---|---|
| Atari XEGS | [R1-05][r105] | Atari 8-bit |
| C64 Games System | [R1-05][r105] | Commodore 64 |
| GX4000 | [R1-05][r105] | Amstrad CPC Plus |
| CDTV | [R1-05][r105] | Amiga, OCS and ECS |
| Zemmix | [R1-05][r105] | MSX |
| Pyūta Jr. | [R1-05][r105] | Tomy Tutor |
| Amiga CD32 | [R1-06][r106] | Amiga, AGA |
| FM Towns Marty | [R1-06][r106] | FM Towns |

- R1-05 marks the first six "R1-26 (inference)", and R1-06 places the CD32 and Marty with [R1-26][fam];
  both were written before the roadmap gave home computers to R1-27.
- Placement, a process call settled here: each console keeps its catalogue row, and R1-27 surveys it with its host,
  as a mode of the host's target or one with a changed ROM (inference).
  The device that came first carries the family: the SC-3000, the computer form of the SG-1000,
  stays in R1-05's SG-1000 row, while the Pyūta Jr., the console form of the Tomy Tutor, joins the Tutor's family.
- The 5200 shares its chips with the Atari 8-bit computers but not their software ([R1-05][r105]),
  so it stays a console with its own target; the Adam and Aquarius, linked to the ColecoVision and Intellivision,
  stay rows here.
- The ZX Spectrum Next of 2017 is placed under R1-27 in one table of [R1-08][r108] and under R1-26 in another;
  this note settles it as a model of the Spectrum family for R1-27, with 72 MobyGames entries of its own.

### Boundary cases

- IBM PC compatibles.
  The PC of 1981-08-12 had an 8088, MDA or CGA, and a 1-bit speaker; IBM documented it fully,
  and compatibles needed a clean-room BIOS because copying IBM's infringed
  ([Wikipedia, "IBM Personal Computer"][w-ibmpc]).
  The PCjr of 1984, with an SN76489, and the Tandy 1000 of 1984, whose infobox calls it a home computer,
  were PCs sold to homes ([Wikipedia, "IBM PCjr"][w-pcjr]; [Wikipedia, "Tandy 1000"][w-t1000]).
  The line between business and home machines "vanished completely
  once IBM PC compatibles became commonly used in the home" ([Wikipedia, "Home computer"][w-home]).
- DOS.
  Microsoft released MS-DOS 1.25, 2.0, and 4.0 and GW-BASIC under MIT
  ([microsoft/MS-DOS][msdos]; [microsoft/GW-BASIC][gwbasic]);
  "According to program manager Rich Turner,
  the other versions could not be open-sourced due to third-party licensing restrictions"
  ([Wikipedia, "MS-DOS"][w-msdos]).
  Games mostly needed a true graphics mode and machine-dependent tricks, and each maker had its own OEM MS-DOS
  ([Wikipedia, "IBM PC compatible"][w-compat]).
  DOSBox "has become the de facto standard for running DOS games" ([Wikipedia, "DOSBox"][w-dosbox]).
- Classic Macintosh.
  The Mac of 1984-01-24 had a 68000 at 7.8336 MHz and a 64 KiB ROM holding QuickDraw
  ([Wikipedia, "Macintosh 128K"][w-mac]),
  and Apple licensed its ROMs to clone makers from 1995 to 1997 ([Wikipedia, "Classic Mac OS"][w-macos]).
  John Sculley said Apple sold "computers for use in the home",
  and in 1990 Apple reportedly kept joysticks off two low-cost Macs so they would not be seen as game machines
  ([Wikipedia, "Home computer"][w-home]).
  Cloanto records that Apple "successfully opposed the use of original Mac ROMs" on Amiga emulation boards
  ([Cloanto KB 13-122][kb-122]).
- Later Japanese PCs.
  The PC-9801 and FM Towns are x86 machines but not IBM compatibles,
  and the PC-98 line ran to Pentium-class PC-9821 models ([Wikipedia, "PC-98"][w-pc98]).
- Other edges: the Apple III and FM-11 are business machines, left out; the QL and PCW stay as short rows.
  Retro "mini" computers and FPGA boxes that run emulators are hosts for [R3-12][hosts], as R1-08 rules.

| What DOS would cost | DOS and the PC | Largest home computer |
|---|---|---|
| MobyGames entries | DOS 8,462; PC Booter 270 | C64 5,750 |
| Processors | 8088 to the 486 and Pentium | one family per row |
| Video | CGA, EGA, Tandy and PCjr, VGA, SVGA and VESA | one chip set per target |
| Sound | PC speaker, SN76496, AdLib, Sound Blaster, Gravis, MT-32 | one or two chips |
| Firmware | many BIOS vendors; DOS 5 and 6 unreleased | one ROM per model |

- The home-computer platforms in this note sum to about 39,600 MobyGames entries, so DOS is about a fifth of their sum
  (calculated from the capture);
  Macintosh's 23,522 run to 2029 and cannot be split into classic and modern ([MobyGames][moby]).
- The sound cards and the range of processors are from memory;
  the video standards and the PCjr and Tandy sound are from the articles above.
  A 1986 survey of planned games gave 31 for the IBM PC against 43 for the C64 and 48 for the Apple II
  ([Wikipedia, "Atari 8-bit computers"][w-atari8], secondary).

### Firmware and its availability

| Family | Firmware in ROM | Published or licensed by the rights holder | Replacement (tier) |
|---|---|---|---|
| Apple II | monitor; Integer BASIC or Applesoft | none found | — |
| Commodore 8-bit | KERNAL; BASIC 1.0 to 7.0 | licensed to Cloanto (C64 Forever) | `mega65/open-roms` (closed) |
| Amiga | Kickstart | licensed to Cloanto (Amiga Forever) | AROS Kickstart (closed) |
| Atari 8-bit | OS; Atari BASIC | none found; one community claim (lead) | AltirraOS (closed) |
| Atari ST line | TOS, with GEM | none found; GEM released under GPL-2.0-only | EmuTOS (closed) |
| TRS-80, CoCo, MC-10 | Level I or II BASIC; Color BASIC | none found | — |
| TI-99/4A | monitor, GPL interpreter, GROM | licensed to Classic99 | — |
| Sinclair | Sinclair BASIC | Amstrad's part only, by permission | OpenSE BASIC (closed) |
| Acorn 8-bit | MOS; BBC BASIC | none found | — |
| Archimedes | Arthur; RISC OS 2 and 3 | none; RISC OS 5 is Apache-2.0 but does not fit | — |
| Amstrad CPC, PCW | firmware; Locomotive BASIC; AMSDOS | Amstrad's part only, by permission | — |
| SAM Coupé | SAM BASIC | by permission to SimCoupé | — |
| MSX | MSX-BIOS; MSX BASIC | licensed only for official products | C-BIOS (closed) |
| Sharp MZ, X1 | monitor or IPL only | none found | — |
| X68000 | IPL and BIOS | released free in 2000; terms not read | — |
| NEC, Fujitsu | N88-BASIC; F-BASIC; Towns ROM | none found | — |
| Thomson; others | BASIC 1.0; ROM BASICs | none found | — |

- Apple.
  Apple v Franklin was the first US appellate holding that ROM code could be copyrighted, on the Apple II's ROMs
  ([Wikipedia, "Apple Computer, Inc. v. Franklin Computer Corp."][w-franklin]; [R0-02][r002-fw] cites the opinion).
  Applesoft derives from Microsoft's 6502 BASIC
  ([Wikipedia, "Applesoft BASIC"][w-applesoft]),
  whose version 1.1 source Microsoft released under MIT in 2025 for the Apple II, PET, OSI,
  and KIM-1 ([microsoft/BASIC-M6502][msbasic]); that is the generic version, not the ROMs Apple
  or Commodore shipped (inference).
  Apple let the Computer History Museum release the 1978 Apple II DOS source "for non-commercial use"
  ([Computer History Museum][chm]);
  it is disk software, not the ROM, and its non-commercial terms make the released code closed under [ADR 0006][adr6],
  while the post stays open as prose.
- Commodore and Amiga.
  Cloanto says the Amiga files and "the older CBM 8-bit system ROMs
  (PET/CBM, C64, etc.),
  are copyrighted works owned and published by Amiga, and may only be used or distributed under license",
  and that its licences, confirmed in 2011 and 2026, include the right to sublicense ([Cloanto KB 13-122][kb-122]).
  Amiga Forever's Plus Edition carries ROMs and system disks from 0.7 to 3.X ([Cloanto KB 13-114][kb-114]).
  Wikipedia says Cloanto bought the AmigaOS copyrights in 2012
  ([Wikipedia, "Amiga Forever"][w-af]); Cloanto's own page is preferred, so it is recorded as a licensee.
  Hyperion's AmigaOS 4.1 update 4 adds official 3.x ROMs ([Wikipedia, "Amiga"][w-amiga]).
  The Commander X16's ROM licence says "The X16 project has a license to use this code in the context of the X16
  computer" of the Commodore KERNAL and BASIC, and sends other users to Cloanto ([X16 ROM licence][x16-lic]).
- Atari.
  Wikipedia reports community agreement that Atari authorised the 800 ROM with the Xformer 2.5 emulator,
  citing a news page and Usenet (lead; [Wikipedia, "Atari 8-bit computers"][w-atari8]).
  Altirra "Contains reimplemented versions of OS, BASIC, and handler ROMs" ([Altirra][altirra]),
  so its builds and source downloads, which hold AltirraOS, are closed in the register.
  Caldera released GEM's source under GPL-2.0-only in 1999
  ([Wikipedia, "GEM"][w-gem]);
  EmuTOS says "There is no code written by Atari in EmuTOS"
  (home page capture; closed, not linked: `emutos.sourceforge.io`).
- Tandy is believed to have blocked a CoCo clone's US sales over copying of its ROM code
  ([Wikipedia, "TRS-80 Color Computer"][w-coco]).
  Classic99's README calls it an "Open source
  (but restrictive license)
  emulator including ROMs licensed by Texas Instruments", with the terms in a manual in the repository
  ([tursilion/classic99][classic99]); the guard blocked the manual, as the repository's register line has not merged
  (research log).
- Sinclair and Amstrad.
  "As Sinclair had never owned the copyright to the language, Amstrad had to arrange a new license with Nine Tiles"
  ([Wikipedia, "Sinclair BASIC"][w-sbasic]).
  The same article lists replacement ROMs, among them OpenSE BASIC, published as open source in 2011;
  as firmware replacements they are closed, and no address of theirs was opened.
  Amstrad's Cliff Lawson wrote that Amstrad is "happy for you to redistribute copies of our copyrighted code as long
  as a) copyright messages are not changed and b) either in the program
  or the documentation you acknowledge that" Amstrad holds the copyright,
  that "Some of the CPC ROM code is copyright Locomotive Software",
  and that the stance covers Spectrum code "for which Amstrad holds the copyright"
  ([Lawson's CPC page][lawson]); [R0-05][r005-other] records a 1999 post to the same effect.
  Finding: the permission covers Amstrad's own code only, no Nine Tiles or Locomotive statement was found,
  and permission is not a licence document.
- Acorn.
  RISC OS 5 has been Apache-2.0 since October 2018, under RISC OS Developments
  ([RISC OS Open, "Licences"][rool-lic]; [RISC OS Open news][rool-2018]),
  but Wikipedia's table gives the Archimedes' ARMv2 machines Acorn's versions only, to 3.1x
  ([Wikipedia, "RISC OS"][w-riscos]).
  RISC OS 4 was offered for non-commercial emulators for £5 in 2008, for the later Risc PC class
  ([Wikipedia, "History of RISC OS"][w-riscos-hist]).
  A director of RISC OS Developments wrote in 2020 that the rights in the older Acorn ROMs are still held by someone
  (lead: RISC OS Open forum, not linked; paraphrased).
- SimCoupé's README thanks Andy Wright for "Permission to distribute the SAM ROMs" ([simonowen/simcoupe][simcoupe]).
- MSX.
  "This is the only official MSX emulator as all MSX copyrights are maintained by the MSX Association",
  of MSXPLAYer in 2001, and the GR8BIT kit of 2011 was "licensed by the MSX Licensing Corporation"
  ([Wikipedia, "MSX"][w-msx]); no licence is stated for the 1chipMSX.
  C-BIOS is BSD-2-Clause, ships with openMSX, blueMSX, and RuMSX, and says "There is no cassette support yet.
  There is no disk support yet.
  There is no BASIC yet." (home page capture; closed, not linked: `cbios.sourceforge.net`).
- Sharp.
  Japanese Wikipedia says the X68000's OS, tools,
  and BIOS were released free (無償公開) in 2000 through a NIFTY-SERVE users' forum, with Sharp's goodwill,
  in an uncited line ([Japanese Wikipedia, "X68000"][ja-x68k]); English Wikipedia calls them public domain,
  citing a web article ([Wikipedia, "X68000"][w-x68k]).
  "Public domain" is unconfirmed, and the site that hosts the files is closed.
- NEC sued Epson in 1987 over the PC-286's BIOS; Epson sold a model with a clean-room BIOS,
  and NEC added a check for Epson's BIOS to its operating systems ([Wikipedia, "PC-98"][w-pc98]).
- Searched and not found: statements by Apple, Tandy, Atari, Acorn's successors on the 8-bit ROMs, Thomson, NEC,
  Fujitsu, Locomotive Software, and Nine Tiles, and a public MSX Licensing Corporation page
  (each article's raw text and web searches, 2026-11-26);
  Oric, Dragon, and Enterprise were searched in their articles only.

### Patterns across the catalogue

- Processors: the 6502 family runs the Apple II, Commodore 8-bit, Atari 8-bit, Acorn 8-bit, and Oric rows;
  the Z80 the TRS-80, Sinclair, CPC, PCW, MSX, MZ, X1, NEC 8-bit, SAM, Enterprise, and most minor rows;
  the 6809 the CoCo, Dragon, FM-7, and Thomson rows; the 68000 family the Amiga, ST, X68000, QL, and Mac
  (rows above; grouping the note's).
- Chips shared with consoles: the TMS9918 family in MSX1, the TI-99/4A, Adam, MTX, Einstein, Sord M5, and Tomy Tutor;
  the AY-3-8910 family in MSX, the CPC, Spectrum 128, ST, Oric, X1, FM-7, and PC-6001;
  the SN76489 family in the BBC Micro, TI-99/4A, PCjr, Tandy 1000, MZ-800, Adam, MTX, Sord M5, Tomy Tutor, and RX-78;
  the MC6847 in the CoCo, Dragon, MC-10, and PC-6001; Yamaha FM in the X1, X68000, PC-88, PC-98, FM77AV, and FM Towns.
  R1-05 and R1-06 list the same chips in the ColecoVision, SG-1000, and Mega Drive.
- Every row but the MZ line, the X1, and the X68000 boots into BASIC, Forth, or an operating system in ROM,
  the Amiga 1000 loads Kickstart from floppy, and the FM Towns's ROM starts Towns OS from CD-ROM;
  and most BASICs descend from Microsoft's; Commodore licensed it in 1977 "on a 'pay once, no royalties' basis"
  ([Wikipedia, "Commodore BASIC"][w-cbasic]).
- Regional clocks differ on the VIC-20, C64, Atari 8-bit, and Amiga, and regional ROMs on MSX, the Prodest PC128,
  and the TS 2068; MSX alone of the rows fixes each generation's hardware in a standard
  (inference; [MSX Resource Center wiki, "MSX1"][msx-1] and ["MSX2"][msx-2]),
  with a BIOS that hides the differences ([MSX Resource Center wiki, "MSX-BIOS"][msx-bios]).

### Coverage of sources

| Family | Best source beyond Wikipedia | Tier | Tests in the register |
|---|---|---|---|
| ZX Spectrum | [Sinclair Wiki][sw-128] | open | z80test, from a real 48K |
| Commodore 8-bit | [C64-Wiki][c64w] | open | 6502 functional tests |
| Atari 8-bit | [Altirra Hardware Reference Manual][altirra-hrm] | open, new | 6502 functional tests |
| BBC Micro, Electron | [BeebWiki][beebwiki] | open, new | 6502 functional tests |
| MSX | [MSX Resource Center wiki][msx-1]; [MSX Assembly Page][map] | open; MAP partly closed | SingleStepTests Z80 |
| PC-9801 | [UNDOCUMENTED 9801/9821 Vol.2][undoc98] | open, new | SingleStepTests 8086 |
| X68000 | Sharp's service manual, not read | open, new | SingleStepTests m68000 |
| Amiga | none open | — | vAmiga Test Suite, needs Kickstart |
| Apple II | none for the hardware; BASIC (open) and DOS (closed) code | — | 6502 functional tests |
| all others | Wikipedia only | — | by processor |

- The Sinclair Wiki, C64-Wiki, MSX Resource Center wiki, and MSX Assembly Page keep their R0-05 tiers
  ([R0-05][r005-other]; [register][register]).
  C64-Wiki now returns an error page to scripted raw requests, so its VIC page was read in a capture
  ([C64-Wiki, "VIC"][c64w-vic]); that page points to Christian Bauer's VIC-II document, not yet evaluated.
  The error page carries a line of instructions aimed at automated agents, which was ignored: a hazard for briefs.
- The Altirra manual covers the 400 to the XEGS and gives "114 machine cycles for each scan line";
  its author says its information comes from "both official and unofficial sources,
  and some of it has been determined by hand through testing on a real, still functioning Atari 800XL", and allows free,
  non-commercial redistribution in verbatim form ([Altirra Hardware Reference Manual][altirra-hrm]).
  Its appendix F is a database of firmware revisions with checksums, for identifying a dump only;
  it was not read beyond the chapter list.
  It is open as a community reference with no claim of confidential origin;
  facts it takes from Atari's manuals need a second source, as R0-05 settled for such hubs.
- BeebWiki states no licence or origin;
  its category of documentation supplied with Acorn computers is maker material hosted by others,
  closed by [ADR 0006][adr6] with a register line; its `index.php?title=` form cannot be matched.
- The UNDOCUMENTED 9801 pages say their content came from repeated experiment and their own analysis,
  under a notice with no grant; entries resting on analysis of the BIOS need a hardware test before a note records them
  ([UNDOCUMENTED 9801/9821 Vol.2][undoc98], preface).
- Sharp began distributing the X68000 service manual, for the CZ-634C and CZ-644C, free in its GALAPAGOS STORE in 2015,
  with schematics and block diagrams ([INTERNET Watch][iwatch]); the store, now COCORO BOOKS, still lists it at ¥0
  ([Sharp's store page][gal], checked 2026-11-26).
  Sharp's posting of MZ-80 manuals in 2012 rests on [Wikipedia, "Sharp MZ"][w-mz], with its address a lead.
- The MSX Assembly Page hosts its own articles beside a disassembly of the MSX system ROMs, a BIOS listing,
  ASCII's handbooks, and chip makers' manuals and datasheets; those files and folders are closed,
  MAP's own pages inside the chip folders with them as a precaution, and its other pages stay open
  (its resources index; a tier call).
- The AmigaOS documentation wiki covers AmigaOS 4, not the classic chipset, under Hyperion's reserved rights
  ([AmigaOS Documentation Wiki][amigaos-wiki]);
  no successor's release of the Amiga Hardware Reference Manual was found, so hosted copies stay closed.
- Closed, not linked, because they offer games, firmware, or maker material hosted by others: World of Spectrum,
  Spectrum Computing, World of SAM, CPCWiki, Macintosh Repository, Bombjack, `retropc.net`'s X68000 folder,
  `amigadev.grimore.org`, `files.commodore.software`, `dcexel.free.fr`, and `alice32.free.fr`.
  CPCWiki's policy page refused scripts (HTTP 403), and search results show it linking ROM downloads (lead).
- Every other row rests on Wikipedia alone; Thierry Nouspikel's TI-99/4A pages were found in search only (lead).

## Options and trade-offs

### Where the boundary falls

- **What:** keep [R1-27][fam] to the machines "How the catalogue is built" defines, leaving IBM PC compatibles, DOS,
  and the classic Mac to a separate item if wanted; or add DOS, or the PC and the Mac, to R1-27.
- **Costs:** leaving DOS out leaves its 8,462 games to other projects;
  adding it brings processors from the 8088 to the Pentium, five or more video standards, six or more sound devices,
  many BIOS vendors, and a DOS whose game-era versions are unreleased.
  The Mac adds a ROM Apple never released and a library MobyGames cannot split from macOS.
- **Gains:** leaving them out keeps R1-27 to machines with one hardware set per target;
  adding DOS covers the largest single game platform of the era found.
- **Used by:** Wikipedia's class, which ends where PC compatibles entered the home
  ([Wikipedia, "Home computer"][w-home]).

### Which computers R1-27 covers in depth

- **What:** survey every row's emulators, or nine families in depth
  (Commodore 8-bit, Amiga, ZX Spectrum, Apple II, Atari 8-bit, Atari ST, Amstrad CPC, MSX, BBC Micro and Electron)
  and the rest briefly.
- **Costs:** every row means about 70 rows' worth of emulators, most for machines with Wikipedia alone;
  the nine leave out the Japanese lines, about 3,900 [MobyGames][moby] entries for the PC-88, PC-98, X68000, FM Towns,
  FM-7, and X1.
- **Gains:** the nine hold about 29,700 of the 39,600 entries
  (calculated from the rows) and every family with an open hub except the PC-9801.
- **Used by:** [R1-05][r105-rec], which recommended study only for systems with a survey.

### One target per family, per standard, or per model

- **What:** one target per compatible family with models as modes; one per standard where one exists, as on MSX;
  or one per model.
- **Costs:** per family hides models with their own chips or ROMs,
  such as the Spectrum 128 and +3 or the Amiga's three chipsets;
  per model multiplies work for models that differ only in RAM or case.
- **Gains:** per family matches how software was sold; per standard matches MSX's definitions;
  per model matches what a user owns.
- **Used by:** the MSX Resource Center wiki, which defines each generation by its required hardware
  ([MSX Resource Center wiki, "MSX2"][msx-2]).

### How firmware is handled

- **What:** ask users for firmware from a machine they own; ship it where a rights holder allows
  (CPC, Spectrum, SAM); write Rustalgia's own replacement firmware; or start games without firmware.
- **Costs:** user-supplied firmware leaves most rows unusable without the hardware;
  shipping rests on permissions that cover part of each ROM and are not licences,
  and puts non-free files beside a GPL-3.0 program (inference); a replacement is a large clean-room effort,
  and every existing one is closed to the project, so it can only be run; most home-computer games call ROM routines,
  so few start without firmware (inference).
- **Gains:** user-supplied firmware is exact and needs no permission; shipping would make three families work,
  if the permissions covered the whole ROM and reached Rustalgia; a replacement can be distributed freely,
  as C-BIOS and EmuTOS show.
- **Used by:** C-BIOS with openMSX and blueMSX; EmuTOS; AltirraOS; [SimCoupé][simcoupe],
  which ships the SAM ROMs by permission.

### Recommendation

- **Boundary:** keep IBM PC compatibles and DOS
  (with the PCjr and Tandy 1000)
  and the classic Mac out of R1-27, and add a separate item for DOS only if the owner wants it,
  knowing it is the largest single platform of the era found.
  Keep the whole PC-98 line, PC-9821 models included, and the FM Towns and X68000,
  because they are Japan's home computers of the era and not PC compatibles;
  the PC-9821's Pentium-class models can rank low within the line.
- **Depth:** have R1-27 survey the nine families in depth and record the other rows' emulators briefly,
  so that [R6-01][synth] can pull in any row;
  the nine hold about three-quarters of the games counted and almost every open source found.
  The PC-9801 and X68000 come next, as the only other rows with an open source beyond Wikipedia: a hub for the PC-9801,
  and Sharp's service manual for the X68000.
- **Targets:** one target per family, with models and regional variants as modes,
  and a separate target where a source records its own chips, ROM, or timing: the Spectrum 48K, 128, +2A/+3,
  and TS 2068; OCS, ECS, and AGA; the ST, TT, and Falcon; each MSX generation; and the R800 as a CPU of its own.
- **Firmware:** take user-supplied firmware as the default, record the permitted cases for [R2-12][eng] to weigh,
  and leave a replacement of Rustalgia's own to R2-12; no existing replacement may be read, only run.

## Implications for Rustalgia

- The boundary recommendation fixes [R1-27][fam]'s scope; if the owner wants DOS,
  the roadmap needs a new phase 1 item and an x86 PC primer (inference).
- Almost no row's firmware is freely licensed, so [R2-12][eng] and, through [R6-03][synth],
  any ADR on firmware decide whether Rustalgia asks users for it, ships permitted files, or writes its own.
- The [glossary][gloss] defines BIOS, boot ROM, and system software for consoles;
  this note applies the closed test to home-computer ROMs by analogy,
  and a later glossary change would make that explicit.
- Shared chips (TMS9918, AY-3-8910, SN76489, MC6847, Z80, 6502, 68000) link these rows to the console families,
  so a component written for one can serve both (inference); this feeds [R6-01][synth]'s order.
- The PAL and NTSC clocks and regional ROMs become targets or modes in the quality targets ([R6-02][synth]).

## Open questions

- On what terms did Sharp release the X68000's system software and BIOS in 2000?
  No page read shows them; a copy of the release notice on a host that does not offer the files, in [R1-27][fam].
- Have Locomotive Software and Nine Tiles, or their successors, allowed their BASICs to be shared?
  No statement was found; a written enquiry to each, for [R2-12][eng].
- On what terms does Classic99's manual license the emulator and TI's ROMs?
  The guard blocks the manual until the register line merges; reading it then, in [R1-27][fam].
- How many sprites per scan line does the X68000 show, and how large is its BIOS ROM?
  The Wikipedias disagree; Sharp's free service manual, in [R1-27][fam].

## Sources

Every source below was read on 2026-11-26 as raw text, unless an entry says otherwise.
Wikipedia links are pinned to the revision read; repository metadata, READMEs,
and licence files were read through GitHub's API; closed addresses are in code spans, with the reason.

- Repository documents: [ADR 0006][adr6]; [research guide][guide]; [research roadmap][fam]; [source register][register];
  [R0-02][r002-fw]; [R0-05][r005-other]; [R1-05][r105]; [R1-06][r106]; [R1-08][r108].
- [MobyGames, "List of All Video Game Platforms"][moby], capture of 2026-09-12 23:35:45; the live site refused scripts.
- English Wikipedia, cited in the text: [Home computer][w-home]; [Atari BASIC][w-ataribasic];
  [Atari 8-bit computers][w-atari8]; [TRS-80 Color Computer][w-coco]; [TI-99/4A][w-ti99]; [Coleco Adam][w-adam];
  [Mattel Aquarius][w-aquarius]; [MSX][w-msx]; [ZX Spectrum][w-zx]; [Amstrad PCW][w-pcw];
  [Enterprise (computer)][w-ent]; [Sharp MZ][w-mz]; [Sharp X1][w-x1]; [PC-6000 series][w-pc6001];
  [PC-8800 series][w-pc88]; [FM-7][w-fm7]; [Bandai RX-78][w-rx78]; [Thomson TO7][w-to7]; [Thomson MO5][w-mo5];
  [Amiga Original Chip Set][w-ocs]; [Amiga][w-amiga]; [Kickstart (Amiga)][w-kick]; [Atari ST][w-st];
  [Atari TT030][w-tt]; [Atari Falcon][w-falcon]; [Acorn Archimedes][w-arc]; [X68000][w-x68k]; [PC-98][w-pc98];
  [FM Towns][w-towns]; [List of ZX Spectrum clones][w-zxclones]; [IBM Personal Computer][w-ibmpc]; [IBM PCjr][w-pcjr];
  [Tandy 1000][w-t1000]; [MS-DOS][w-msdos]; [IBM PC compatible][w-compat]; [DOSBox][w-dosbox]; [Macintosh 128K][w-mac];
  [Classic Mac OS][w-macos]; [Applesoft BASIC][w-applesoft];
  [Apple Computer, Inc. v. Franklin Computer Corp.][w-franklin]; [Amiga Forever][w-af];
  [GEM (desktop environment)][w-gem]; [Sinclair BASIC][w-sbasic]; [RISC OS][w-riscos];
  [History of RISC OS][w-riscos-hist]; [Commodore BASIC][w-cbasic].
- English Wikipedia, behind the table rows: [Apple II](https://en.wikipedia.org/w/index.php?oldid=1384147801);
  [Apple II Plus](https://en.wikipedia.org/w/index.php?oldid=1383193078);
  [Apple IIe](https://en.wikipedia.org/w/index.php?oldid=1382435637);
  [Apple IIc](https://en.wikipedia.org/w/index.php?oldid=1387644363);
  [Apple IIGS](https://en.wikipedia.org/w/index.php?oldid=1381017598);
  [Apple III](https://en.wikipedia.org/w/index.php?oldid=1381371525);
  [Commodore PET](https://en.wikipedia.org/w/index.php?oldid=1382907092);
  [VIC-20](https://en.wikipedia.org/w/index.php?oldid=1387643612);
  [Commodore 64](https://en.wikipedia.org/w/index.php?oldid=1386170881);
  [Commodore 128](https://en.wikipedia.org/w/index.php?oldid=1382849891);
  [Plus/4](https://en.wikipedia.org/w/index.php?oldid=1386238265);
  [Commodore 16](https://en.wikipedia.org/w/index.php?oldid=1383988662);
  [TRS-80](https://en.wikipedia.org/w/index.php?oldid=1385708436);
  [TRS-80 Model 4](https://en.wikipedia.org/w/index.php?oldid=1380042865);
  [TRS-80 MC-10](https://en.wikipedia.org/w/index.php?oldid=1362271256);
  [ZX80](https://en.wikipedia.org/w/index.php?oldid=1376223300);
  [ZX81](https://en.wikipedia.org/w/index.php?oldid=1387242003);
  [Timex Sinclair 2068](https://en.wikipedia.org/w/index.php?oldid=1338871647);
  [Sinclair QL](https://en.wikipedia.org/w/index.php?oldid=1386183623);
  [Acorn Atom](https://en.wikipedia.org/w/index.php?oldid=1365313147);
  [BBC Micro](https://en.wikipedia.org/w/index.php?oldid=1386169392);
  [BBC Master](https://en.wikipedia.org/w/index.php?oldid=1375718873);
  [Acorn Electron](https://en.wikipedia.org/w/index.php?oldid=1386167866);
  [Amstrad CPC](https://en.wikipedia.org/w/index.php?oldid=1386168523);
  [Dragon 32/64](https://en.wikipedia.org/w/index.php?oldid=1371935270);
  [Oric (computer)](https://en.wikipedia.org/w/index.php?oldid=1386181021);
  [SAM Coupé](https://en.wikipedia.org/w/index.php?oldid=1355666749);
  [Jupiter Ace](https://en.wikipedia.org/w/index.php?oldid=1386176582);
  [Camputers Lynx](https://en.wikipedia.org/w/index.php?oldid=1386170186);
  [Memotech MTX](https://en.wikipedia.org/w/index.php?oldid=1384756932);
  [Tatung Einstein](https://en.wikipedia.org/w/index.php?oldid=1369980602);
  [Exidy Sorcerer](https://en.wikipedia.org/w/index.php?oldid=1382613696);
  [Ohio Scientific](https://en.wikipedia.org/w/index.php?oldid=1387562531);
  [Spectravideo](https://en.wikipedia.org/w/index.php?oldid=1376233996);
  [Amiga 1000](https://en.wikipedia.org/w/index.php?oldid=1384596802);
  [Amiga 500](https://en.wikipedia.org/w/index.php?oldid=1371405836);
  [Amiga 2000](https://en.wikipedia.org/w/index.php?oldid=1373603146);
  [Amiga 3000](https://en.wikipedia.org/w/index.php?oldid=1372660311);
  [Amiga 600](https://en.wikipedia.org/w/index.php?oldid=1385570136);
  [Amiga 1200](https://en.wikipedia.org/w/index.php?oldid=1382052994);
  [Amiga 4000](https://en.wikipedia.org/w/index.php?oldid=1346189070);
  [PC-8000 series](https://en.wikipedia.org/w/index.php?oldid=1376461575);
  [FM-8](https://en.wikipedia.org/w/index.php?oldid=1381020625);
  [Sord M5](https://en.wikipedia.org/w/index.php?oldid=1336096389);
  [Tomy Tutor](https://en.wikipedia.org/w/index.php?oldid=1370097527);
  [Toshiba Pasopia](https://en.wikipedia.org/w/index.php?oldid=1335981327);
  [Thomson TO8](https://en.wikipedia.org/w/index.php?oldid=1366024990);
  [Thomson MO6](https://en.wikipedia.org/w/index.php?oldid=1354378017);
  [Thomson TO9](https://en.wikipedia.org/w/index.php?oldid=1352664726);
  [EXL 100](https://en.wikipedia.org/w/index.php?oldid=1372521991);
  [Matra Alice](https://en.wikipedia.org/w/index.php?oldid=1351078333);
  [Philips VG5000](https://en.wikipedia.org/w/index.php?oldid=1379793913);
  [Philips P2000](https://en.wikipedia.org/w/index.php?oldid=1335977782);
  [Pentagon](https://en.wikipedia.org/w/index.php?oldid=1357714365);
  [Didaktik](https://en.wikipedia.org/w/index.php?oldid=1378808518);
  [Agat](https://en.wikipedia.org/w/index.php?oldid=1373750743);
  [Pravetz 82](https://en.wikipedia.org/w/index.php?oldid=1385986806);
  [Electronika BK](https://en.wikipedia.org/w/index.php?oldid=1386734280);
  [Vector-06C](https://en.wikipedia.org/w/index.php?oldid=1370708047);
  [KC 85](https://en.wikipedia.org/w/index.php?oldid=1386483235);
  [Galaksija](https://en.wikipedia.org/w/index.php?oldid=1359755101).
- Japanese Wikipedia: [PC-6000シリーズ][ja-pc6001]; [ぴゅう太][ja-pyuta]; [SMC-777][ja-smc]; [MULTI8][ja-multi8];
  [X68000][ja-x68k]; [FM TOWNS][ja-towns].
- French Wikipedia: [Thomson TO7][fr-to7]; [Thomson TO8][fr-to8]; [Thomson MO6][fr-mo6];
  [Plan informatique pour tous][fr-pipt].
- Closed as a precaution, because each mentions leaked material, and not linked: `en.wikipedia.org/wiki/Atari_TOS`
  (revision 1383479724; "EmuTOS" redirects to it)
  and `en.wikipedia.org/wiki/AmigaOS`
  (revision 1387260107); their `index.php?title=` and `oldid` forms cannot be matched by the guard.
- Hubs: [Sinclair Wiki, "ZX Spectrum 128"][sw-128] (revision 2403) and ["Contended memory"][sw-cont]
  (revision 1840);
  [C64-Wiki][c64w] main page, last edited 2026-01-17; [C64-Wiki, "VIC"][c64w-vic], capture of 2026-11-15 08:24:11;
  MSX Resource Center wiki, [MSX1][msx-1], [MSX2][msx-2], [MSX2+][msx-2p], [MSX turbo R][msx-tr],
  [ASCII R800][msx-r800], and [MSX-BIOS][msx-bios], each linked at its oldid; [MSX Assembly Page][map] resources index
  (no date shown);
  [BeebWiki][beebwiki] main page (oldid 4892, last edited 2025-06-13);
  [UNDOCUMENTED 9801/9821 Vol.2][undoc98] index and preface
  (notice of 1991 to 2021, no edition date);
  [AmigaOS Documentation Wiki][amigaos-wiki] main page (last edited 2025-09-03) and copyrights page.
- Altirra: [home page][altirra] (Altirra 4.40); [Altirra Hardware Reference Manual][altirra-hrm], 2026-01-02 edition,
  front matter, introduction, notice, and chapter list; downloads listed, not opened.
- Makers and rights holders: [microsoft/BASIC-M6502][msbasic]
  (README, licence, metadata; archived);
  [microsoft/MS-DOS][msdos] (README, licence, metadata; archived); [microsoft/GW-BASIC][gwbasic]
  (licence, metadata; archived);
  [Computer History Museum, "Apple II DOS Source Code"][chm] (2013-11-12); [Cloanto KB 13-122][kb-122]
  (updated 2026-06-06)
  and [KB 13-114][kb-114] (updated 2021-03-10); [RISC OS Open, "Licences"][rool-lic]
  (no date shown);
  [RISC OS Open news, "RISC OS is open for business!"][rool-2018] (2018-10-22); [Cliff Lawson's CPC page][lawson],
  capture of 2008-05-10 13:15:26; [INTERNET Watch][iwatch] (2015-01-13);
  [Sharp's store page for the X68000 service manual][gal].
- Licence texts and emulator prose: [NetBSD copy of the Commander X16 ROM licence][x16-lic]
  (no date shown);
  [simonowen/simcoupe][simcoupe] README (pushed 2026-08-30); [tursilion/classic99][classic99] README and metadata
  (pushed 2026-10-25).
- Closed, read once in captures and not linked: C-BIOS's home page, `cbios.sourceforge.net`,
  capture of 2026-11-13 09:59:29; EmuTOS's home page, `emutos.sourceforge.io`, capture of 2026-09-17 05:35:47.
  Opened in error, closed: `mine.perso.lip6.fr/mess/index.html.en`;
  its older address `www.di.ens.fr/~mine/mess` holds "~", which no register pattern can carry,
  so the written rule closes it.
- Leads, not linked: RISC OS Open forum thread "Copyright status of Acorn ROMs?" (2020-12-02).

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[guide]: ../README.md#claim-status
[gloss]: ../../glossary/terms.md
[register]: ../../../.claude/hooks/source-register.txt
[fam]: ../../roadmap/research.md#system-family-surveys
[hosts]: ../../roadmap/research.md#phase-3-host-platforms
[eng]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[synth]: ../../roadmap/research.md#phase-6-synthesis
[r002]: R0-02-legal-baseline.md
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r005-other]: R0-05-source-map.md#sega-arcade-xbox-and-other-systems
[r105]: R1-05-catalogue-8-and-16-bit.md
[r105-built]: R1-05-catalogue-8-and-16-bit.md#how-the-catalogue-is-built
[r105-rec]: R1-05-catalogue-8-and-16-bit.md#recommendation
[r106]: R1-06-catalogue-32-and-64-bit.md
[r108]: R1-08-catalogue-modern.md
[moby]: https://web.archive.org/web/20260912233545/https://www.mobygames.com/platform/
[w-home]: https://en.wikipedia.org/w/index.php?oldid=1386175028
[w-ataribasic]: https://en.wikipedia.org/w/index.php?oldid=1333991426
[w-atari8]: https://en.wikipedia.org/w/index.php?oldid=1383793230
[w-coco]: https://en.wikipedia.org/w/index.php?oldid=1371726824
[w-ti99]: https://en.wikipedia.org/w/index.php?oldid=1367639263
[w-adam]: https://en.wikipedia.org/w/index.php?oldid=1373605585
[w-aquarius]: https://en.wikipedia.org/w/index.php?oldid=1387510023
[w-msx]: https://en.wikipedia.org/w/index.php?oldid=1386179551
[w-zx]: https://en.wikipedia.org/w/index.php?oldid=1386188469
[w-pcw]: https://en.wikipedia.org/w/index.php?oldid=1386168538
[w-ent]: https://en.wikipedia.org/w/index.php?oldid=1378417046
[w-mz]: https://en.wikipedia.org/w/index.php?oldid=1353008725
[w-x1]: https://en.wikipedia.org/w/index.php?oldid=1379499540
[w-pc6001]: https://en.wikipedia.org/w/index.php?oldid=1357010388
[w-pc88]: https://en.wikipedia.org/w/index.php?oldid=1376225543
[w-fm7]: https://en.wikipedia.org/w/index.php?oldid=1381721335
[w-rx78]: https://en.wikipedia.org/w/index.php?oldid=1386892545
[w-to7]: https://en.wikipedia.org/w/index.php?oldid=1352659165
[w-mo5]: https://en.wikipedia.org/w/index.php?oldid=1354377386
[w-ocs]: https://en.wikipedia.org/w/index.php?oldid=1352751241
[w-amiga]: https://en.wikipedia.org/w/index.php?oldid=1386885155
[w-kick]: https://en.wikipedia.org/w/index.php?oldid=1386486593
[w-st]: https://en.wikipedia.org/w/index.php?oldid=1387466668
[w-tt]: https://en.wikipedia.org/w/index.php?oldid=1387271691
[w-falcon]: https://en.wikipedia.org/w/index.php?oldid=1386169073
[w-arc]: https://en.wikipedia.org/w/index.php?oldid=1373786163
[w-x68k]: https://en.wikipedia.org/w/index.php?oldid=1369021790
[w-pc98]: https://en.wikipedia.org/w/index.php?oldid=1386347726
[w-towns]: https://en.wikipedia.org/w/index.php?oldid=1386568389
[w-zxclones]: https://en.wikipedia.org/w/index.php?oldid=1384603146
[w-ibmpc]: https://en.wikipedia.org/w/index.php?oldid=1374134150
[w-pcjr]: https://en.wikipedia.org/w/index.php?oldid=1386175363
[w-t1000]: https://en.wikipedia.org/w/index.php?oldid=1384327514
[w-msdos]: https://en.wikipedia.org/w/index.php?oldid=1384383488
[w-compat]: https://en.wikipedia.org/w/index.php?oldid=1386883376
[w-dosbox]: https://en.wikipedia.org/w/index.php?oldid=1383073352
[w-mac]: https://en.wikipedia.org/w/index.php?oldid=1383313915
[w-macos]: https://en.wikipedia.org/w/index.php?oldid=1386883304
[w-applesoft]: https://en.wikipedia.org/w/index.php?oldid=1266160706
[w-franklin]: https://en.wikipedia.org/w/index.php?oldid=1354839017
[w-af]: https://en.wikipedia.org/w/index.php?oldid=1380488276
[w-gem]: https://en.wikipedia.org/w/index.php?oldid=1375552631
[w-sbasic]: https://en.wikipedia.org/w/index.php?oldid=1375760377
[w-riscos]: https://en.wikipedia.org/w/index.php?oldid=1384605392
[w-riscos-hist]: https://en.wikipedia.org/w/index.php?oldid=1386174875
[w-cbasic]: https://en.wikipedia.org/w/index.php?oldid=1371916645
[ja-pc6001]: https://ja.wikipedia.org/w/index.php?oldid=111571075
[ja-pyuta]: https://ja.wikipedia.org/w/index.php?oldid=108109627
[ja-smc]: https://ja.wikipedia.org/w/index.php?oldid=110579555
[ja-multi8]: https://ja.wikipedia.org/w/index.php?oldid=107374134
[ja-x68k]: https://ja.wikipedia.org/w/index.php?oldid=111390795
[ja-towns]: https://ja.wikipedia.org/w/index.php?oldid=111748182
[fr-to7]: https://fr.wikipedia.org/w/index.php?oldid=241216607
[fr-to8]: https://fr.wikipedia.org/w/index.php?oldid=238106352
[fr-mo6]: https://fr.wikipedia.org/w/index.php?oldid=240535392
[fr-pipt]: https://fr.wikipedia.org/w/index.php?oldid=238259611
[sw-128]: https://sinclair.wiki.zxnet.co.uk/wiki/ZX_Spectrum_128
[sw-cont]: https://sinclair.wiki.zxnet.co.uk/wiki/Contended_memory
[c64w]: https://www.c64-wiki.com/wiki/Main_Page
[c64w-vic]: https://web.archive.org/web/20261115082411/https://www.c64-wiki.com/wiki/VIC
[msx-1]: https://www.msx.org/wiki/index.php?oldid=118712
[msx-2]: https://www.msx.org/wiki/index.php?oldid=120078
[msx-2p]: https://www.msx.org/wiki/index.php?oldid=120580
[msx-tr]: https://www.msx.org/wiki/index.php?oldid=120589
[msx-r800]: https://www.msx.org/wiki/index.php?oldid=119459
[msx-bios]: https://www.msx.org/wiki/index.php?oldid=40507
[map]: http://map.grauw.nl/resources/
[beebwiki]: https://beebwiki.mdfs.net/Main_Page
[undoc98]: https://www.webtech.co.jp/company/doc/undocumented_mem/
[amigaos-wiki]: https://wiki.amigaos.net/wiki/Main_Page
[altirra]: https://www.virtualdub.org/altirra.html
[altirra-hrm]: https://www.virtualdub.org/downloads/Altirra%20Hardware%20Reference%20Manual.pdf
[msbasic]: https://github.com/microsoft/BASIC-M6502
[msdos]: https://github.com/microsoft/MS-DOS
[gwbasic]: https://github.com/microsoft/GW-BASIC
[chm]: https://computerhistory.org/blog/apple-ii-dos-source-code/
[kb-122]: https://www.amigaforever.com/kb/13-122
[kb-114]: https://www.amigaforever.com/kb/13-114
[rool-lic]: https://www.riscosopen.org/content/documents/licences
[rool-2018]: https://www.riscosopen.org/news/articles/2018/10/22/risc-os-is-open-for-business
[lawson]: https://web.archive.org/web/20080510131526/http://web.ukonline.co.uk/cliff.lawson/cpchomec.htm
[iwatch]: https://internet.watch.impress.co.jp/docs/news/683361.html
[gal]: https://galapagosstore.com/web/book/detail/sstb-B215-1215000-sm-cz-634c
[x16-lic]: https://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/licenses/commander-x16-rom-license
[simcoupe]: https://github.com/simonowen/simcoupe
[classic99]: https://github.com/tursilion/classic99
