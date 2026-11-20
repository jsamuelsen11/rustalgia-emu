---
title: "8-bit and 16-bit consoles and handhelds: catalogue"
roadmap_item: R1-05
status: draft
date: 2026-11-20
---

# 8-bit and 16-bit consoles and handhelds: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold in the 8-bit and 16-bit era, and what hardware,
protection, firmware, and sources each has.
It lists about 100 machines and families, from the processor-less consoles of 1972 to 8-bit handhelds sold in 2001,
and groups more than 1,000 first-generation rebadges by the game chip they share.
Only the systems that the roadmap's family surveys name have an open-tier hardware reference beyond Wikipedia;
for most of the rest, Wikipedia is the only source found, and no maker document was located for most of their chips.
Two facts matter most to Rustalgia: about half the machines with a processor need a firmware image
that the project may not obtain, and the era's boundary is unclear for a dozen systems,
which the owner's rule has to place.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of the 8-bit and 16-bit era were sold, and for each,
  what are its maker, release, processor, video, audio, media, protection, firmware, survey, and sources?
- Covered: home consoles of the first to fourth generations, add-ons that act as systems, and handhelds,
  as the era is defined in "How the catalogue is built" below.
  How the hardware works is left to the primer (`R1-01`); each family's emulators to its survey
  (`R1-10` to `R1-25`); the law on lock-outs and firmware to `R0-02`; each hub's evaluation to `R0-05`.
  PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles are emulator hosts,
  left to `R3-07` and `R3-12`.
- Researched on 2026-11-20 against the Wikipedia revisions and hub pages listed in Sources.
- How claims were checked: three research agents each covered a share of the era and read every page as raw text,
  Wikipedia through its raw wikitext; no value here comes from a summarising tool unless it is marked "(secondary)".
  A second, independent pass fetched the sources again and tested each claim; its corrections were applied.
  Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed.
  Counts marked "(counted from the raw table)" were made by script over Wikipedia's wikitext. "(inference)" marks
  reasoning, and "(from memory)" a claim no fetched page confirmed.
  A statement that nothing was found records the searches made, not proof of absence.
- Notation: memory sizes that sources give in "KB" are written in KiB, because chip sizes are powers of two (inference);
  clocks are as each source gives them.
  No firmware, BIOS, boot ROM, disassembly, game, maker manual hosted by others, or emulator code was opened.

## Findings

### How the catalogue is built

- The roadmap's title is a rule by processor word size, and its surveys add a rule by family:
  an era holds the systems whose family survey depends on its primer (roadmap, "Hardware primers").
  Wikipedia uses a third rule, by generation, and disagrees with both at the edges (see "Boundary cases").
- A row is one machine or one compatible family.
  Revisions, regional models, rebadges, and combined units are folded into the row of the machine they run,
  with their names in the identity table.
- "Survey" names the family survey whose title includes the system.
  "R1-25 (inference)" marks a console built from a home computer, which "Other handhelds and home computers" may cover.
  A dash means no survey's title names the system; whether `R1-25` covers such a handheld is open (Open questions).
- "Hub" names the best open-tier source other than Wikipedia, as registered;
  a dash means Wikipedia was the only source found.
- Regions: NA North America, EU Europe, UK United Kingdom, JP Japan, KR South Korea, BR Brazil, AU Australia, TW Taiwan,
  CN China.

### First generation: dedicated consoles

Every row rests on the Wikipedia article on the system or series, unless it names another source.

| System or series | Maker | First release | Game logic | Models |
|---|---|---|---|---|
| Odyssey | Magnavox, by Sanders Associates | NA 1972-09; UK 1973; EU 1974 | discrete transistors and diodes | 1 |
| Odyssey dedicated series | Magnavox; Philips | NA, EU 1975 to 1978 | TI, GI, National chips by model | 11 |
| Home Pong | Atari; Sears Tele-Games | NA 1975 | custom Atari chip per family | 9 |
| TV Tennis Electrotennis | Epoch | JP 1975-09-12 | not stated; Magnavox licence | 1 |
| Telstar series | Coleco | NA 1976 | GI AY-3-8500 family; one MOS chip | 14 |
| Color TV-Game | Nintendo, with Mitsubishi | JP 1977-06-01 | Mitsubishi chips | 5 |
| Video Pinball | Atari | NA 1977 | microcontroller with RAM | 3 |
| Telstar Arcade | Coleco | NA 1977-08 | MOS MPS-7600 in each cartridge | 1 |
| PC-50x family | Soundic and many brands | EU 1977 to early 1980s | GI chip in each cartridge | many |
| Discrete-logic cartridge units | Philips, Interton, others | EU 1975 to 1978 | logic in each cartridge | several |

- The Odyssey has no processor and no stored program; its game cards rewire its logic
  (Wikipedia, "Magnavox Odyssey", "Design").
  Its designer's patents describe generating symbols "by voltage controlled delay of pulses and coincidence gating"
  (US 3,659,285, abstract; also US 3,728,480).
- PC-50x consoles have no central processor:
  "all the games are implemented thanks to the individual chips in the cartridges,
  all based on the chip family AY-3-8xxx of General Instrument" (Wikipedia, "PC-50x family", lead).
- Telstar Arcade cartridges each hold a MOS microcontroller "capable of storing 512 words of ROM"
  (Wikipedia, "Coleco Telstar Arcade", lead).
- Wikipedia's list of first-generation consoles holds 1,036 released rows from 340 maker names
  (counted from the raw table).
  Another article speaks of "more than 900" first-generation consoles
  (Wikipedia, "List of home video game consoles", introduction).
  The rows group by the game chip they name:

| Chip family | Rows | Chip maker |
|---|---|---|
| GI AY-3-8500 (8500 PAL, 8500-1 NTSC) | 372, and 10 with a second chip | General Instrument |
| GI AY-3-8610, -8600, -8550, -8510, -8512, -8700, -8710, -8760 | about 70 | General Instrument (inference) |
| PC-50x cartridges (GI AY-3-8xxx) | 97 | General Instrument |
| TI TMS-1965N, TMS-1955 | 32 | Texas Instruments (inference from the prefix) |
| National MM-57105N, MM-57186N | about 23 | National Semiconductor |
| MOS MPS-7600 series | 18 | MOS Technology |
| Atari custom chips | about 16 | Atari |
| Mitsubishi M58816P and others | 5 | Mitsubishi |
| Soviet К145ИК17 | 9 | not stated |
| F-4301, NTL-600, SN76410N, MSL9320 | about 21 | not stated |
| Discrete logic (TTL, 7400, DTL, CMOS) | 36 | none |
| Not given | 311 | — |

- The counts are of rows in one table and depend on its wording (counted from the raw table).
  The AY-3-8500 alone is said to be used in "at least two hundred different consoles" (Wikipedia, "AY-3-8500").
  It runs from a nominal 2.0 MHz clock, and colour needs a companion AY-3-8515 (same article).
- No General Instrument datasheet for the family was found on a maker or successor host.

### Second generation: home consoles

Identity, with the hub where one exists:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Channel F (VES; licensed EU models) | Fairchild; Zircon from 1979 | NA 1976-11; JP 1977-10 | — | — |
| Studio II (licensed clones) | RCA | NA 1977 | — | — |
| 2600 (VCS; Atari 2800 in JP) | Atari | NA 1977-09; EU 1978; JP, BR 1983 | — | — |
| Astrocade (Bally Professional Arcade) | Bally | NA 1977-12 by mail; 1978-01 retail | — | — |
| 1292 APVS / VC 4000 (25 variants) | Radofin; Interton | EU, AU 1978 | — | — |
| APF-MP1000 (Imagination Machine) | APF Electronics | NA 1978-10 | — | — |
| Champion 2711 | Unisonic | NA 1978; JP 1979 | — | — |
| Odyssey 2 (Videopac G7000) | Magnavox; Philips | NA, EU 1978; JP 1982; BR 1983 | — | — |
| Super Vision 8000 (TV Jack 8000) | Bandai | 1979-12 (JP, inference) | — | — |
| Intellivision (many licensed models) | Mattel; INTV from 1984 | NA 1979 test, 1980; EU, JP 1982 | — | — |
| Cassette Vision (and Jr.) | Epoch | JP 1981-07-30 | — | — |
| CreatiVision (Laser 2001 compatible) | VTech | 1981 or 1982; EU, AU, JP | — | — |
| Arcadia 2001 (38 variants) | Emerson | NA 1982-05; JP 1982 | — | — |
| ColecoVision (CBS ColecoVision) | Coleco | NA 1982-08; EU 1983-07 | — | — |
| 5200 | Atari | NA 1982-10 | — | — |
| Vectrex (Kōsokusen in JP) | GCE; Milton Bradley | NA 1982-10; EU, JP 1983 | — | — |
| Compact Vision TV Boy | Gakken | JP 1983-10 | — | — |

Hardware:

| System | CPU | Video | Audio | Firmware |
|---|---|---|---|---|
| Channel F | Fairchild F8 (3850 + 3851), 1.79 MHz | 2 KiB frame buffer, 8 colours | 3 beeps | 2 KiB in two 3851s |
| Studio II | RCA 1802, 1.76 or 1.78 MHz | CDP1861, 64 × 32 | beeps | 2 KiB: games, interpreter |
| 2600 | MOS 6507, 1.19 MHz | TIA, no frame buffer | TIA, 2 channels | none |
| Astrocade | Z80, 1.789 MHz | custom, 160 × 102 at 2 bits | custom, 3 square + noise | 8 KiB, built-in games |
| 1292 APVS / VC 4000 | Signetics 2650A, 0.887 MHz | Signetics 2636 | basic | none stated |
| APF-MP1000 | Motorola 6800, 0.895 MHz | MC6847, 256 × 192 | 1 channel | ROM with a game |
| Champion 2711 | GI CP1610 | GI AY-3-8800 (video and sound) | in the AY-3-8800 | two built-in games |
| Odyssey 2 | Intel 8048, 5.37 MHz NTSC | Intel 8244/8245 | in the 8244/8245 | 1 KiB in the 8048 |
| Super Vision 8000 | NEC D780C-1 (Z80 clone), 3.58 MHz | AMI S68047 | GI AY-3-8910 | not stated |
| Intellivision | GI CP1610, about 1.79 MHz NTSC | STIC (AY-3-8900) | GI AY-3-8914 | Exec, plus graphics ROM |
| Cassette Vision | NEC µPD777C or µPD778 in cartridge | in the console | beeper | none recorded |
| CreatiVision | 6502, 2 MHz | TI TMS9918/9929 | TI SN76489 | not stated |
| Arcadia 2001 | Signetics 2650 | Signetics 2637 | beeper and noise | none |
| ColecoVision | Z80A, 3.58 MHz | TI TMS9928A/9929A | TI SN76489 | 8 KiB BIOS |
| 5200 | 6502C (SALLY), 1.79 MHz | ANTIC and GTIA | POKEY | 2 KiB BIOS |
| Vectrex | Motorola 68A09, 1.5 MHz | analogue vector CRT | GI AY-3-8912 | 8 KiB, with a game |
| TV Boy | Motorola MC6801, 4 MHz, in cartridge | MC6847 | not stated | not stated |

- The Channel F's start-up code, shared routines, and two games sit in 2 KiB of ROM in two 3851 chips;
  the same article also writes "3580" and "3581", which its hardware section and the article on the F8 contradict
  (Wikipedia, "Fairchild Channel F", "Hardware"; "Fairchild F8").
  The patents of its maker and of the licensor of its prototype describe a display memory read out in step with the
  scan, and its cartridge connector (US 4,026,555 and US 4,095,791, abstracts).
- The 2600 "lacks a framebuffer" and its games build each line in step with the television's beam
  (Wikipedia, "Atari 2600", "Hardware").
  Its video chip has three versions, for NTSC, PAL, and SECAM, with palettes of 128, 104, and 8 colours,
  so games were published per region (Wikipedia, "Atari 2600 hardware"; "Television Interface Adaptor").
  Cartridges larger than its 4 KiB window use bank switching (Wikipedia, "Atari 2600", "Hardware").
  Atari's patent of 1976 describes moving objects by per-object position counters
  (US 4,112,422, abstract); that it describes the TIA is an inference from its inventors and date.
- The Studio II's ROM holds five games and a BIOS "featuring an interpreter for the custom programming language
  that cartridges are written in" (Wikipedia, "RCA Studio II", "Hardware").
- The Astrocade's video chip transforms data that a program writes to the ROM address space and stores the result in RAM
  (Wikipedia, "Astrocade", technical section);
  the chips are shared with Midway arcade boards such as Gorf (same article).
- The Intellivision's processor runs 10-bit instruction words, which General Instrument made 10-bit ROMs to hold
  (Wikipedia, "General Instrument CP1600").
  Its Exec is 4,096 words of 10 bits, plus a 2 KiB graphics ROM;
  the Intellivision II changed the Exec "in an attempt to lock out third-party games"
  (Wikipedia, "Intellivision", "Hardware specifications" and "Intellivision II").
- ColecoVision's BIOS pauses first-party games on start-up for 12.7 s on NTSC units and 3.3 s in the PAL and SECAM BIOS,
  so the firmware differs by region; its Expansion Module #1 is a complete 2600 (Wikipedia, "ColecoVision", "Hardware").
- The 5200 shares its chips with Atari's 8-bit computers but is not software compatible,
  because registers sit at other addresses (Wikipedia, "Atari 5200").
  Atari's patent of 1979 describes a graphics generator that fetches display instructions from memory
  (US 4,296,476, abstract); its tie to ANTIC is an inference from the inventors and date.
- The Vectrex draws on its built-in screen with "an all-analog design using two integrators: X and Y",
  and reads its controllers through the sound chip (Wikipedia, "Vectrex").
- Wikipedia gives three North American release dates for the Odyssey 2, September 1978, December 1978,
  and February 1979, in three articles
  ("Magnavox Odyssey 2"; "List of home video game consoles"; "Second generation of video game consoles").

### Third generation: home consoles

Identity:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Famicom / NES (Comboy KR) | Nintendo | JP 1983-07-15; NA 1985-10-18; EU 1986-09-01 | R1-15 | NESdev wiki |
| Famiclones (Dendy, Pegasus, Micro Genius) | various | 1986 to 1992; RU, PL, Asia | R1-15 | NESdev wiki |
| SG-1000 (SC-3000; SG-1000 II) | Sega | JP 1983-07-15; AU 1983-11 | — | SMS Power |
| Mark III / Master System | Sega; Tectoy, Samsung | JP 1985-10-20; NA 1986; EU 1987; BR 1989 | R1-22 | SMS Power |
| 7800 ProSystem | Atari Corp., by GCC | NA 1986-05; EU 1987 | — | — |
| XEGS | Atari Corp. | NA 1987 | R1-25 (inference) | — |
| PV-1000 | Casio | JP 1983-10 | — | — |
| Super Cassette Vision | Epoch | JP 1984-07-17; EU 1984 | — | — |
| My Vision | Nichibutsu | JP 1983 | — | — |
| Videopac+ G7400 (Jopac) | Philips | 1983 | — | — |
| Pyūta Jr. | Tomy | JP 1983 | R1-25 (inference) | — |
| Dina (Personal Arcade) | Bit Corporation | 1986 | — | — |
| Socrates | VTech | 1988 | — | — |
| Action Max; Video Challenger | Worlds of Wonder; Takara | 1987 | — | — |
| Interactive Vision | View-Master | 1989 | — | — |
| Zemmix | Daewoo | KR 1985 to 1995 | R1-25 (inference) | — |
| GX4000 | Amstrad | EU 1990-09 | R1-25 (inference) | — |
| C64 Games System | Commodore | 1990-12 | R1-25 (inference) | — |

Hardware:

| System | CPU | Video | Audio | Firmware |
|---|---|---|---|---|
| Famicom / NES | Ricoh 2A03, 1.789773 MHz; 2A07 PAL | Ricoh 2C02; 2C07 PAL | in the CPU chip | none |
| Dendy | UMC UA6527P, 1.773448 MHz | clone of the PPU | in the CPU chip | none |
| SG-1000 | Z80A, 3.58 MHz | TI TMS9918A | TI SN76489AN | none |
| Master System | Z80A, 3.58 MHz NTSC; 3.55 PAL | VDP from the TMS9918 | PSG in VDP; YM2413 in JP | BIOS (export) |
| 7800 | SALLY (6502), 1.79 or 1.19 MHz | MARIA, display lists | TIA; POKEY on some games | 4 KiB NTSC, 16 KiB PAL |
| XEGS | 6502C, 1.79 MHz | ANTIC and GTIA | POKEY | not confirmed |
| PV-1000 | Z80, 3.579 MHz | NEC D65010G031 | in the video chip | not stated |
| Super Cassette Vision | NEC µPD7801G, 4 MHz | EPOCH TV-1 | NEC µPD1771C | not stated |
| My Vision | not given | not given | not given | not stated |
| Videopac+ G7400 | Intel 8048, 5.91 MHz | 8245 + Thomson EF9340/9341 | in the 8245 | in the 8048 |
| Pyūta Jr. | TI TMS9995 | TI TMS9918 | TI SN76489AN | not stated |
| Socrates | Z80A, 3.57 MHz | custom | not stated | not stated |
| Action Max | Hitachi HD401010 | VHS tape | VHS tape | not stated |
| GX4000 | Z80, 4 MHz | CPC Plus ASIC | GI AY-3-8912 | not stated |

- The NES's master clock is divided by 12 on NTSC consoles and by 16 on PAL consoles,
  and the Dendy divides the PAL clock by 15; Brazilian and Argentine clones use still other master clocks
  (NESdev wiki, "Cycle reference chart").
  A clone is therefore its own timing target, not a rebadge (inference).
- "The frontloading NES has a CIC Lockout Chip, a microcontroller that performs a proprietary handshake,
  as an anticompetitive measure.
  The Famicom and toploading NES consoles do not contain this chip." (NESdev wiki, "CIC lockout chip").
  Nintendo's patent describes matching devices in console and cartridge that hold the console in reset
  if their results disagree (US 4,799,635, abstract).
- Export Master Systems carry a BIOS that checks the cartridge header:
  "The BIOS in non-Japanese Master Systems requires a valid header
  and later Game Gears will also not run software without one." (SMS Power, "ROM Header").
  The header begins with the 8-byte identifier `TMR SEGA`, recorded here because the check requires it
  (same page); the Mark III and every SG-1000 have no BIOS (SMS Power, "BIOS").
- The Master System's Z80 runs at the master crystal divided by 15, 3,579,540 Hz on NTSC and 3,546,893 Hz on PAL
  (SMS Power, "Clock Rate").
  Japanese models add a YM2413 FM chip (Wikipedia, "Master System", infobox).
- The 7800 plays almost every 2600 cartridge; its processor slows to 1.19 MHz when it reaches the TIA or the 6532
  (Wikipedia, "Atari 7800", "Technical specifications").
  A cartridge signature check in its BIOS is known only from memory; the article read does not mention it.
- The SG-1000, ColecoVision, CreatiVision, Pyūta Jr., and the Zemmix line share Texas Instruments' video chip family,
  and the Master System's video chip extends it (Wikipedia, articles on each system; "Master System", infobox).
- The video-tape consoles play analogue tape and score a light gun against it,
  so the console itself holds little to emulate (inference from Wikipedia, "Action Max" and "Video Challenger").
- Wikipedia lists the BBC Bridge Companion (1985) and LJN Video Art (1987) as third-generation consoles
  but has no article on either under the names tried ("Third generation of video game consoles", gallery).

### Fourth generation: home consoles

Identity:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Mega Drive / Genesis | Sega; Tectoy, Samsung, Majesco | JP 1988-10-29; NA 1989-08 | R1-22 | Plutiedev |
| PC Engine / TurboGrafx-16 (Duo, Shuttle) | NEC, Hudson Soft | JP 1987-10-30; NA 1989-08-29; EU 1989 | — | — |
| SuperGrafx | NEC | JP 1989-12-08 | — | — |
| Super Famicom / SNES | Nintendo | JP 1990-11-21; NA 1991-08-23; EU 1992 | R1-15 | SNESdev wiki |
| Neo Geo AES (MVS arcade) | SNK | JP 1990-04-26; NA 1991 | R1-24 for MVS (inference) | NeoGeo wiki |
| Neo Geo CD, CDZ | SNK | JP 1994-09-09; EU 1994-12; NA 1996-01-15 | — | NeoGeo wiki |
| TeraDrive | IBM, with Sega | JP 1991-05-31 | R1-22 (inference) | — |
| CDTV | Commodore | NA, UK 1991-03 | R1-25 (inference) | — |
| CD-i (players by many makers) | Philips | NA 1991-12-03; JP 1992; EU 1992 | — | — |
| Video Information System | Tandy | NA 1992 (from memory) | R1-25 (inference) | — |
| Sega Pico (Kids Computer Pico) | Sega Toys | JP 1993-06; NA 1994-11; EU 1994 | — | — |
| LaserActive | Pioneer | JP 1993-08-20; NA 1993-09-13 | — | — |
| CPS Changer | Capcom | JP 1994-11 | R1-24 | — |
| Super A'Can | Funtech | TW, CN 1995-10-25 | — | — |

Hardware:

| System | CPU | Video | Audio | Firmware |
|---|---|---|---|---|
| Mega Drive | 68000, 7.67 MHz; Z80, 3.58 MHz | Sega VDP (YM7101) | YM2612; PSG in VDP | TMSS boot ROM from 1991 |
| PC Engine | Hudson HuC6280, 7.16 MHz | HuC6270 and HuC6260 | in the CPU chip | none (HuCard) |
| SuperGrafx | HuC6280A | two HuC6270, HuC6202, HuC6260 | in the CPU chip | none |
| Super Famicom | Ricoh 5A22 (65C816), 3.58 MHz peak | S-PPU1 and S-PPU2 | S-SMP: SPC700, S-DSP | none in the console |
| Neo Geo AES | 68000, 12 MHz; Z80, 4 MHz | LSPC | Yamaha YM2610 | system ROM |
| Neo Geo CD | 68000, 12 MHz; Z80, 4 MHz | as the AES | YM2610 without ADPCM-B; CD audio | CD system ROM |
| TeraDrive | 80286; 68000; Z80 | Mega Drive and PC | Mega Drive | PC BIOS and Mega Drive |
| CDTV | 68000, 7.16 MHz NTSC | Amiga chip set | Amiga Paula | 256 KiB Kickstart |
| CD-i | Philips SCC68070, 15.5 MHz | SCC66470; later MCD 212 | MCD 221, ADPCM | CD-RTOS in ROM |
| Video Information System | AMD 80286, 12 MHz | Cirrus Logic | Yamaha YMF262 | not checked |
| Sega Pico | 68000, 7.6 MHz | from the Mega Drive | SN76489; NEC µPD7759 | not checked |
| LaserActive | in each PAC module | module and LaserDisc | module and LaserDisc | in each module |
| CPS Changer | 68000, 10 MHz; Z80, 3.579 MHz | CPS-1 board | YM2151; OKI6295 | the arcade board's |
| Super A'Can | 68000, 10.738635 MHz | UMC UM6618 | UMC UM6619, 16 PCM channels | not checked |

- The Mega Drive's 68000 and Z80 derive from one crystal (Wikipedia, "Sega Genesis", "Technical specifications").
  Exact rates of 7.670454 MHz and 3.579545 MHz on NTSC appear on Sega Retro,
  which cites a Sega service manual that it hosts and that the register closes, so they rest on a closed source
  (Sega Retro, "Sega Mega Drive/Technical specifications").
- From 1991 the Mega Drive's Trademark Security System checks the cartridge before showing a licence message
  (Wikipedia, "Sega Genesis", "Trademark Security System and Sega v. Accolade").
  "If it doesn't find the initial "SEGA" text in this field, systems with TMSS will refuse to boot the game."
  (Plutiedev, "ROM header").
  `R0-02` records the law on this check, in "Trade marks and branding, recorded as risks".
- A Super Famicom processor cycle takes 6, 8, or 12 cycles of a 945/44 MHz master clock on NTSC consoles,
  depending on the address, which gives the quoted 3.58, 2.68, and 1.79 MHz (SNESdev wiki, "Timing").
  A lock-out chip in console and cartridge separates PAL from Japanese and North American systems
  (Wikipedia, "Super Nintendo Entertainment System", "Regional lockout").
- Super Famicom cartridges can carry coprocessors that their games cannot run without, such as the Super FX and SA-1
  (Wikipedia, "Super Nintendo Entertainment System", "Enhancement chips"); `R1-15` lists them.
- North American HuCards "reverse eight of these pins as a region lockout method"
  (Wikipedia, "TurboGrafx-16", "Technical specifications").
  No PC Engine hub could be reached: the one community wiki tried failed on every address form (research log).
- The Neo Geo's master clock is 24 MHz on the arcade board and 24.167829 MHz on the home console,
  so the two run at different speeds (NeoGeo Development Wiki, "Clock").
  Every Neo Geo has a system ROM, and late cartridges carry a chip that unscrambles graphics data
  (NeoGeo Development Wiki, "System ROM"; "NEO-CMC");
  that wiki points to MAME's source, which is walled, for the details.
- CD-i is a disc format and a player platform; Philips and its licensees made the players,
  and the comparison table marks them free of regional lock-out
  (Wikipedia, "CD-i"; "Fourth generation of video game consoles", "Other consoles").

### Add-ons that act as systems

| Add-on | Base | First release | Adds | Firmware | Survey |
|---|---|---|---|---|---|
| Famicom Disk System | Famicom | JP 1986-02-21 | disk drive, RAM, wavetable channel | 8 KiB BIOS | R1-15 |
| Family Computer Network System | Famicom | JP 1988-09 | modem, ROM cards | not checked | R1-15 |
| CD-ROM² / TurboGrafx-CD | PC Engine | JP 1988-12-04; NA 1989-11 | CD drive, ADPCM, CD audio | System Card | — |
| Super CD-ROM²; Arcade Card | PC Engine | JP 1991; 1994-03-12 | more buffer RAM | System Card 3.0 | — |
| Mega CD / Sega CD | Mega Drive | JP 1991-12-12; NA 1992-10-15 | 68000, ASIC, Ricoh PCM | 1 Mbit boot ROM | R1-22 |
| Super Game Boy (and 2) | Super Famicom | JP, NA 1994-06; EU 1994-09 | a Game Boy | SNES-side BIOS | R1-10, R1-15 |
| Satellaview | Super Famicom | JP 1995-04-23 | satellite receiver | 1 MiB ROM, BS-X | R1-15 |
| SuFami Turbo | Super Famicom | JP 1996 | two mini-cartridge slots | 256 KiB BIOS | R1-15 |
| 32X | Mega Drive | NA 1994-11-21; JP 1994-12-03 | two SH-2, frame buffer | not checked | R1-22 |

- The Disk System's 8 KiB BIOS loads files from disk and checks that a licence message is present before running a game;
  some titles bypassed the check (NESdev wiki, "FDS BIOS").
  Disks also carry a moulded "NINTENDO" relief that the drive requires (Wikipedia, "Famicom Disk System").
- The Mega CD adds a second 68000 at 12.5 MHz, a scaling and rotation ASIC, and an eight-channel PCM chip
  (Wikipedia, "Sega CD", "Technical specifications"),
  and can also start a program from cartridge without its BIOS (Plutiedev, "Using the Sub-CPU in mode 1").
- "The SGB cartridge contains a fully featured gameboy
  (with CPU, Video & Audio controllers),
  but without LCD screen and without joypad buttons." (fullsnes, "SNES Cart Super Gameboy").
  Its Game Boy clock comes from the Super Famicom's, at 4.2955 MHz on NTSC units, about 2.4 % fast;
  the Super Game Boy 2 has its own crystal (Pan Docs, "SGB Functions"; Wikipedia, "Super Game Boy").
- Much Satellaview content was broadcast and survives only on recovered memory packs
  (Wikipedia, "Satellaview"); fullsnes documents its receiver ports and formats in its own chapters (fullsnes, index).
- Bandai's Datach barcode reader (1992)
  and Codemasters' Aladdin Deck Enhancer (1992) change how cartridges are built rather than adding a processor
  (Wikipedia, "Datach"; "Aladdin Deck Enhancer"); this catalogue treats them as media.
- The 32X has 32-bit processors on a 16-bit console; Wikipedia places it in the fifth generation
  ("32X", infobox), and Sega Retro's figures for it cite Sega manuals that the register closes.

### Handhelds

Identity:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Microvision | Milton Bradley | 1979-11 | — | — |
| Game & Watch (class) | Nintendo | 1980-04-28 | — | — |
| Select-A-Game | Entex | 1981 | — | — |
| Adventure Vision (tabletop) | Entex | 1982-08 | — | — |
| Computer Mah-jong Yakuman | Nintendo | JP 1983-10-18 | — | — |
| PVS / Super Micro | Palmtex | 1984 | — | — |
| Game Pocket Computer | Epoch | JP 1984 | — | — |
| Digi Casse | Bandai | JP 1984; EU 1986 | — | — |
| Game Boy (DMG; Pocket, Light) | Nintendo | JP 1989-04-21; NA 1989-07-31; EU 1990-09-28 | R1-10 | Pan Docs |
| Lynx (Lynx II) | Atari Corp., by Epyx | NA 1989-09-01; EU, JP 1990 | — | — |
| Game Gear (Kids Gear) | Sega; Majesco re-release | JP 1990-10-06; NA 1991-04; UK 1991-06-29 | R1-22 | SMS Power |
| TurboExpress (PC Engine GT); LT | NEC | JP, NA 1990-12; LT JP 1991-12-13 | — | — |
| Gamate | Bit Corporation | 1990 | — | — |
| Game Master (Systema 2000) | Hartung | DE 1990 | — | — |
| Barcode Battler | Epoch | JP 1991-03 | — | — |
| Supervision (QS-800, SV-100) | Watara | 1992 | — | — |
| Mega Duck (Cougar Boy) | Welback Holdings | 1993 | — | — |
| Mega Jet (no screen) | Sega | JP 1993-07 rental; 1994-03-10 retail | R1-22 | Sega Retro |
| Design Master Denshi Mangajuku | Bandai | JP 1995-03-03 | — | — |
| R-Zone | Tiger | 1995 | — | — |
| Nomad | Sega of America | NA 1995-10 | R1-22 | Sega Retro |
| Game.com (Pocket Pro) | Tiger | NA 1997-09-12 | — | — |
| Game Boy Color | Nintendo | JP 1998-10-21; NA 1998-11-18; EU 1998-11-23 | R1-10 | Pan Docs |
| Neo Geo Pocket; Color; New Color | SNK | JP 1998-10-28; Color NA 1999-08-06 | — | NgpCraft |
| WonderSwan; Color; SwanCrystal | Bandai | JP 1999-03-04; 2000-12-09; 2002-07-12 | — | WSdev wiki |
| Pocket Challenge V2 | Benesse | not found | — | WSdev wiki |
| Cybiko | Cybiko Inc. | NA 2000-04 | — | — |
| Pokémon Mini | Nintendo, with Epson | NA 2001-11-16; JP 2001-12-14 | — | — |

Hardware:

| System | CPU | Display | Audio | Firmware or lock-out |
|---|---|---|---|---|
| Microvision | Intel 8021 or TI TMS1100 in cartridge | 16 × 16 LCD | piezo | none; mask ROM per game |
| Game & Watch | Sharp SM5xx | segment LCD | beeper | mask ROM per unit |
| Select-A-Game | in each cartridge, type not stated | 7 × 16 VFD | not stated | none |
| Adventure Vision | Intel 8048, 733 kHz | 150 × 40 LEDs, spun mirror | NS COP411L | ROMs in both chips |
| Game Pocket Computer | NEC µPD78C06, 6 MHz | 75 × 64 | 1 channel | built-in software |
| Game Boy | Sharp SM83, 4.194304 MHz | 160 × 144, 4 shades | 4 channels | boot ROM with logo check |
| Lynx | VL65NC02, up to 4 MHz | 160 × 102, blitter | 4 channels | 512-byte boot ROM |
| Game Gear | Z80, 3.5 or 3.579545 MHz | 160 × 144 of 160 × 146 | SN76489 | none, then a header BIOS |
| TurboExpress | HuC6280, 7.16 MHz | values conflict | 6 wavetable channels | none (HuCard) |
| Gamate | 6502-based UMC or NCR chip | 160 × 152, 4 greys | GI AY-3-8910 | 2 KiB internal ROM |
| Game Master | NEC µPD7810 | 61 × 64 | 1-bit | not stated |
| Supervision | 65C02, 4 MHz | 160 × 160, frame buffer | 2 tone, noise, DMA | not stated |
| Mega Duck | Sharp SM83, 4.194304 MHz | 160 × 144 | 4 channels | not stated |
| Design Master | Hitachi H8/3334, 7.63 MHz | 160 × 150, touch | not stated | not stated |
| Nomad | 68000 | colour LCD and AV out | Mega Drive | regional lock-out |
| Game.com | Sharp SM8521, 10 MHz | 200 × 160, touch | 2 wave, noise, PCM | not stated |
| Game Boy Color | Sharp SM83, up to 8.388608 MHz | 160 × 144, 15-bit colour | 4 channels | boot ROM, half-logo check |
| Neo Geo Pocket | Toshiba TLCS-900/H, 6.144 MHz; Z80 | 160 × 152 | T6W28 and DACs | 64 KiB BIOS ROM |
| WonderSwan | NEC V30MZ, 3.072 MHz | 224 × 144 | 4 wavetable channels | boot ROM; handshake |
| Cybiko | Hitachi H8S/2241, 11.0592 MHz | 160 × 100 | not stated | not stated |
| Pokémon Mini | Epson S1C88, 4 MHz | 96 × 64 | 1 square channel | 4 KiB BIOS ROM |

- The Game Boy's boot ROM shows the logo from the cartridge header, compares it with its own copy,
  and checks the header checksum: "If either of these checks fail, the boot ROM locks up,
  and control is never passed to the cartridge ROM." (Pan Docs, "Power Up Sequence"; emphasis dropped).
  The Game Boy Color's boot ROM checks only the top half of the logo (Pan Docs, "The Cartridge Header").
  The logo's bytes are firmware and game data and are not recorded here.
- The first Game Gear has no BIOS, and later models refuse software without a valid header (SMS Power, "BIOS").
  The panel is 160 × 146 dots, and Master System mode scales 240 of each line's 256 pixels three to two
  (SMS Power, "Game Gear LCD").
  Its processor clock is 3.5 MHz by Wikipedia and 3.579545 MHz by Sega Retro;
  no primary statement of the clock was found ("Game Gear", infobox; Sega Retro, "Sega Game Gear").
- WonderSwan models use three versions of one system chip (WSdev wiki, "SoC").
  A cartridge must complete a handshake with it,
  and "The boot ROM will refuse to boot the cartridge if this bit is not set; on the WonderSwan Color,
  it will refuse to start the system at all." (WSdev wiki, "Cartridge connector").
  Its display runs at about 75.47 Hz from 159 lines of 256 cycles (WSdev wiki, "Timing").
- The Lynx's Mikey chip holds the processor, sound, and "512 bytes of bootstrap and game-card loading ROM",
  and Suzy is a blitter with sprite scaling (Wikipedia, "Atari Lynx").
  How the boot stage checks a cartridge is not stated on any page read;
  search results point to forum discussions that were not opened.
- The TurboExpress article gives two display sizes and lists video chips of the SuperGrafx,
  so it is not cited for video values (Wikipedia, "TurboExpress").
- The Neo Geo Pocket's specification table carries an "unreferenced section" banner on the page itself
  (Wikipedia, "Neo Geo Pocket").
  NgpCraft, a developer reference under the MIT licence, is the only Neo Geo Pocket hub found;
  it states no origin for its facts and no rule on leaked material (its README and licence file).
- Five handhelds carry their processor or their screen in each cartridge:
  the Microvision and Select-A-Game the processor, and the Digi Casse and R-Zone the screen;
  the Palmtex unit carries a screen overlay, ROM, and RAM in each cartridge (Wikipedia, articles on each).
- The Mega Duck uses a Game Boy processor and sound,
  with games mostly by two publishers later re-released for the Game Boy (Wikipedia, "Mega Duck").

### Boundary cases

| System | Word-size rule | Wikipedia generation | Placed here as |
|---|---|---|---|
| Game Boy Color | 8-bit: R1-05 | fifth | R1-05, by survey `R1-10` |
| Neo Geo Pocket | 16-bit core, 32-bit registers | fifth | R1-05, by `R1-25` (inference) |
| WonderSwan line | 16-bit: R1-05 | sixth | R1-05, by `R1-25` (inference) |
| Game.com; Pokémon Mini | 8-bit: R1-05 | not placed; sixth | R1-05 |
| Nomad; Mega Jet | 16-bit: R1-05 | fifth | R1-05, by survey `R1-22` |
| Super A'Can; CPS Changer | 16-bit: R1-05 | fifth | R1-05 |
| Neo Geo CD | 16-bit: R1-05 | fifth | R1-05 |
| CD-i | 32-bit registers, 16-bit bus | fourth | R1-05; flagged for `R1-06` |
| 32X | 32-bit: R1-06 | fifth | add-on row here; `R1-22` depends on both |
| Videopac+ G7400 | 8-bit | third | R1-05 |
| Virtual Boy | 32-bit: R1-06 | fifth | not here: `R1-06` |
| Playdia | 8-bit: R1-05 | fifth | not here: listed by `R1-06` |
| Amiga CD32; FM Towns Marty; PC-FX | 32-bit: R1-06 | fifth | not here: `R1-06` |
| Cybiko; GameKing; Dreamcast VMU | 8-bit | sixth or none | Cybiko here; the others `R1-07` |

- The sources for each placement are the system's Wikipedia article, its `generation` field read raw,
  and the roadmap's survey dependencies; the CD-i's register widths are from memory.
- The Dreamcast VMU is a memory card that runs small games (Wikipedia, "VMU") and is listed with the Dreamcast.
  The GameKing of 2003 or 2004 (the two articles differ) is an 8-bit cartridge handheld sold in the sixth generation
  (Wikipedia, "GameKing"; "List of handheld game consoles").

### Patterns across the catalogue

- Processor families recur.
  The 6502 family runs the 2600, 5200, 7800, NES, CreatiVision, Lynx, Supervision, Gamate, and PC Engine,
  and the Super Famicom's 65C816 extends it.
  The Z80 runs the Astrocade, ColecoVision, SG-1000, Master System, Game Gear, PV-1000, Socrates, GX4000,
  and the Zemmix line, and the sound side of the Mega Drive, Neo Geo, and Neo Geo Pocket.
  The 68000 runs the Mega Drive, Mega CD, Neo Geo, CDTV, Sega Pico, CPS Changer, and Super A'Can.
  Sharp's SM83 runs the Game Boy, Game Boy Color, and Mega Duck
  (each system's row and its source; the grouping is the note's).
- Sound chips recur: the SN76489 in at least seven systems,
  and General Instrument's AY-3-891x family in the Intellivision, Super Vision 8000, Vectrex, Gamate, and GX4000
  (rows above).
- Signetics' 2650 runs two families of rebadged consoles,
  the VC 4000 group with 25 named variants and the Arcadia 2001 group with 38
  (Wikipedia, "1292 Advanced Programmable Video System"; "Arcadia 2001"; variants counted from the raw tables).
- Eight systems put the processor or the screen in each cartridge: the Telstar Arcade, PC-50x, Cassette Vision, TV Boy,
  Microvision, Select-A-Game, Digi Casse, and R-Zone (rows above).
  For these, a dump of a "cartridge" is a microcontroller's mask ROM or no data at all (inference).
- Firmware is needed by about 30 of the rows: the Channel F, Studio II, Astrocade, APF-MP1000, Champion 2711, Odyssey 2,
  Intellivision, ColecoVision, 5200, Vectrex, 7800, export Master Systems, later Game Gears, TMSS Mega Drives,
  the Disk System, Mega CD, CD-ROM², Neo Geo AES and CD, Satellaview, SuFami Turbo, Super Game Boy, CD-i, CDTV,
  Game Boy, Game Boy Color, Lynx, Neo Geo Pocket, WonderSwan, and Pokémon Mini
  (rows above; whether the console can be emulated without it is left to `R1-01` and `R2-12`).
- Lock-outs found: the NES and Super Famicom lock-out chips, the Game Boy logo check,
  the export Master System and later Game Gear header check, TMSS, the Disk System's licence check and moulding,
  the Intellivision II's changed Exec, the TurboGrafx pin reversal, the WonderSwan handshake,
  and Neo Geo graphics scrambling (rows and findings above).
  None was found for most second-generation consoles, by a search of each fetched article for "lock-out", "lockout",
  "copy protect", the stem of "authentication", "security chip", "header", and "signature".

### Coverage of sources

- An open-tier hub other than Wikipedia covers the NES family (NESdev wiki), the Super Famicom and its add-ons
  (SNESdev wiki, fullsnes),
  the Game Boy family (Pan Docs), the SG-1000, Master System, and Game Gear (SMS Power), the Mega Drive and Mega CD
  (Plutiedev; Sega Retro's articles),
  the Neo Geo (NeoGeo Development Wiki), the WonderSwan (WSdev wiki), and the Neo Geo Pocket (NgpCraft).
  Their tiers and evaluations are in `R0-05` and the register.
- Every other row rests on Wikipedia alone, apart from the patents named above for the Odyssey, Channel F, 2600, 5200,
  and NES.
  That covers every first- and second-generation console, the 7800, the PC Engine family, the CD-i, and 20 handhelds.
- Sega Retro's technical pages for the Master System, Mega Drive, Mega CD,
  and 32X cite Sega manuals hosted on Sega Retro, which the register closes;
  their figures need an open source before a note relies on them
  (Sega Retro, technical specification pages, citations read raw).
- Community sites were found for the Intellivision, Channel F, Astrocade, Atari 7800,
  and CD-i whose prose pages were read but which are not yet evaluated; the pull request lists them.
  Several host firmware, disassemblies, or maker documents, which ADR 0001 closes (research log).
- No maker datasheet was found on a maker or successor host for most chips in the rows above,
  among them the General Instrument game and sound chips, the CP1610, the F8, the 1802, the 2650,
  the TIA and its successors, the 8048 and 8244, and the TMS9918 family.
  `R0-05` reports the same gap for the Z80, 6502, and NEC parts ("Processor and chip makers' manuals").
- Processor test sets in the register cover the 6502 family, Z80, 68000, SM83, HuC6280, SPC700, and 8086 family;
  none was found for the F8, 1802, CP1610, 8048, 2650, 6800, 6809, TLCS-900/H, SM8521, or S1C88
  (register; `R0-05`, "Test suites and test vectors").

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study, or limit study to the systems the surveys name and keep the rest as rows.
- **Costs:** every row means about 100 more studies, most resting on Wikipedia; surveys only leaves out the Atari, NEC,
  SNK, Bandai, and first-generation machines.
- **Gains:** every row studied gives the widest choice for `R6-01`; surveys only keeps the research finite.
- **Used by:** the roadmap today, whose surveys name Nintendo, Sega, arcade, and "other" families only.

### One target per chip family, or one per model

- **What:** treat a clone family (AY-3-8500 rebadges, VC 4000 variants, Arcadia variants, famiclones) as one target,
  or treat each model with its own timing as a target.
- **Costs:** one per family misses clones with their own clocks, such as the Dendy;
  one per model multiplies work for machines whose differences are cases and labels.
- **Gains:** one per family matches how the hardware was shared; one per model matches what a user owns.
- **Used by:** the NESdev wiki, which gives clone clocks their own columns.

### A survey for the systems no survey names

- **What:** read `R1-25` as covering every unnamed console and handheld, add surveys for Atari, NEC, and SNK,
  or leave these systems in the catalogue only.
- **Costs:** a wide `R1-25` mixes computers and consoles; new surveys add roadmap items;
  catalogue only leaves them without an emulator survey.
- **Gains:** each choice settles where the PC Engine, Lynx, Neo Geo, and WonderSwan are studied.
- **Used by:** the roadmap's present wording, which leaves the question open.

### How a boundary system is placed

- **What:** place each system by processor word size, by Wikipedia's generation, or by the survey that covers it.
- **Costs:** word size splits the 32X from its host; generation moves the Game Boy Color out of its survey's primer;
  survey placement leaves unsurveyed systems without a rule.
- **Gains:** word size predicts the processor work; generation matches common usage;
  survey placement matches the roadmap's dependencies.
- **Used by:** this catalogue uses the survey placement and falls back on word size, as the boundary table shows.

### Sources for systems with Wikipedia alone

- **What:** accept Wikipedia's figures for catalogue rows, seek maker documents and patents for each chip,
  or measure on hardware.
- **Costs:** Wikipedia contradicts itself on several rows
  (the Studio II clock, the Odyssey 2 date, the Channel F part numbers, the TurboExpress display);
  maker documents were not found for most chips; measurement needs hardware.
- **Gains:** Wikipedia is complete enough for a catalogue; maker documents and tests are what a study can rely on.
- **Used by:** this catalogue, for identification only.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is a decision for `R6-01`,
  and the catalogue's survey column shows which rows will have an emulator survey behind them.
- About 30 rows need firmware that the project may not obtain (ADR 0001; `R0-02`, "Firmware, keys, and game copies").
  Whether each can run without it, from its post-boot state or a replacement, feeds `R2-12` and an ADR on firmware.
- Lock-outs differ in kind, from a header string to a challenge in a chip; `R0-02` records which are untested in court,
  and each family survey records how emulators handle them.
- Clone and regional timing variants are separate targets in the sources;
  this feeds the system scope proposal and the quality targets (`R6-02`).
- Systems that rest on Wikipedia alone need a better source before a study relies on them;
  this feeds `R1-25` and any new survey the owner adds.

## Open questions

- Does `R1-25` cover the consoles and handhelds that no survey names, or do Atari, NEC, SNK, and Bandai need surveys?
  A decision for the owner.
- Where do the Neo Geo Pocket, WonderSwan, Pokémon Mini, CD-i, and 32X belong when the rules disagree?
  A decision for the owner, recorded in the roadmap.
- What are the Game Gear's processor clock, the Studio II's clock, and the Odyssey 2's North American release date,
  from a primary source?
  `R1-22`, or a maker document if one is found.
- How does the Lynx boot stage check a cartridge, and does the 7800 BIOS check a signature?
  No page read says; a survey or a registered community source.
- Which maker hosts, if any, still serve datasheets for the General Instrument, Fairchild, RCA, Signetics,
  and Texas Instruments chips?
  `R1-01` and later primers.
- What are the release years and regions of the Pocket Challenge V2, the BBC Bridge Companion, and LJN Video Art?
  A later pass with sources beyond Wikipedia.
- What is the hardware of the My Vision, the Select-A-Game cartridges, the Palmtex unit, the Digi Casse, and the R-Zone?
  No page read gives the processor.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext from `https://en.wikipedia.org/w/index.php?title=<Article>&action=raw`;
each pin is the revision ID, or, where the API refused, the time the page was last modified (GMT).

Wikipedia, first and second generation:

- "First generation of video game consoles" 1383362694; "Second generation of video game consoles" 1386367484;
  "List of first generation home video game consoles" 1386346200; "List of home video game consoles" 1386685039.
- "Magnavox Odyssey" 1385452685; "Odyssey series" 1381540098; "Pong" 1386429289; "Coleco Telstar series" 1384754340;
  "Coleco Telstar Arcade" 1386273222; "Color TV-Game" 1384325574; "TV Tennis Electrotennis" 1382481043.
- "AY-3-8500" 1355333866; "Interton Video 2000" 1386007626; "PC-50x family" 1359169771;
  "Philips Tele-Game series" 1376920344; "Video Pinball series" 1372408465; "Turnir" 1376289238.
- "Fairchild Channel F" 1385111024; "Fairchild F8" 1364486939; "RCA Studio II" 1384562059; "Atari 2600" 1386797711;
  "Atari 2600 hardware" 1384141830; "Television Interface Adaptor" 1386648231; "Astrocade" 1386364772.
- "Interton Video Computer 4000" 1353555008; "1292 Advanced Programmable Video System" 1370109834;
  "APF-MP1000" 1337111658; "APF Imagination Machine" 1378543303; "Unisonic Products Corporation" 1359605329.
- "Magnavox Odyssey 2" 1384362011; "Philips Videopac+ G7400" 1367076000; "Bandai Super Vision 8000" 1364164517;
  "Intellivision" 1384387529; "General Instrument CP1600" 1372435639; "Entertainment Computer System" 1385314431.
- "Cassette Vision" 1375473899; "VTech CreatiVision" 1383969050; "Arcadia 2001" 1352938983; "ColecoVision" 1369186567;
  "Atari 5200" 1382706947; "Vectrex" 1386579084; "Gakken Compact Vision TV Boy" 1352892594.

Wikipedia, third and fourth generation and add-ons (last modified, GMT):

- "Nintendo Entertainment System" 2026-11-17 07:11; "Nintendo Entertainment System models" 2026-11-08 21:47;
  "Famicom Disk System" 2026-10-20 01:08; "Family Computer Network System" 2026-11-17 05:04;
  "Aladdin Deck Enhancer" 2026-07-08 06:51; "Datach" 2026-11-11 14:17; "Dendy" 2026-08-22 19:08.
- "Master System" 2026-11-19 12:47; "SG-1000" 2026-11-16 10:51; "Atari 7800" 2026-11-07 18:09;
  "Atari XEGS" 2026-11-04 22:22; "Sega Genesis" 2026-11-19 02:30; "Sega CD" 2026-11-12 21:53; "32X" 2026-11-12 21:52;
  "TeraDrive" 2026-09-14 21:52; "Sega Pico" 2026-10-11 02:23.
- "Super Nintendo Entertainment System" 2026-11-03 18:24; "Satellaview" 2026-11-10 17:21;
  "Super Game Boy" 2026-11-08 00:35; "SuFami Turbo" 2026-03-28 10:18; "TurboGrafx-16" 2026-11-10 09:16;
  "PC Engine SuperGrafx" 2026-06-29 03:02; "TurboDuo" 2026-11-10 09:19.
- "Neo Geo" 2026-11-09 02:17; "Neo Geo CD" 2026-10-16 15:44; "CD-i" 2026-11-08 06:48; "CDTV" 2026-08-19 21:00;
  "LaserActive" 2026-10-21 10:24; "Video Information System" 2026-09-29 04:51; "CP System" 2026-11-16 08:45;
  "Super A'Can" 2026-10-03 14:38.
- "PV-1000" 2026-05-19 08:52; "Super Cassette Vision" 2026-10-15 00:27; "My Vision" 2026-09-13 16:14;
  "Action Max" 2026-05-07 04:25; "Video Challenger" 2026-05-07 17:38; "VTech Socrates" 2026-11-12 21:55;
  "View-Master Interactive Vision" 2026-11-08 20:43; "GX4000" 2026-05-07 04:29;
  "Commodore 64 Games System" 2026-10-09 15:36; "Zemmix" 2026-08-11 09:08; "Tomy Tutor" 2026-08-19 02:44.
- "Playdia" 2026-11-14 00:12; "Amiga CD32" 2026-11-20 11:04; "FM Towns Marty" 2026-10-08 22:00;
  "PC-FX" 2026-05-07 04:48; "Third generation of video game consoles" 2026-11-17 07:52;
  "Fourth generation of video game consoles" 2026-11-01 17:39.

Wikipedia, handhelds:

- "Microvision" 1385146804; "Game Boy" 1384325969; "Game Boy Color" 1385096333; "Atari Lynx" 1385284173;
  "Game Gear" 1377875769; "TurboExpress" 1352943257; "Genesis Nomad" 1383503066; "Watara Supervision" 1354286936.
- "Mega Duck" 1358166547; "Game.com" 1376576838; "Neo Geo Pocket" 1367573321; "WonderSwan" 1386225880;
  "WonderSwan Color" 1370985057; "SwanCrystal" 1378611770; "Virtual Boy" 1384432040; "Pokémon Mini" 1384550005.
- "Gamate" 1361186075; "Game Master (console)" 1358643549; "Entex Select-A-Game" 1365296496;
  "Entex Adventure Vision" 1384756979; "Palmtex Portable Videogame System" 1353834548;
  "Epoch Game Pocket Computer" 1371116714; "Digi Casse" 1352940508; "R-Zone" 1353050445.
- "Game & Watch" 1384130215; "Computer Mah-jong Yakuman" 1342316737; "Cybiko" 1364470227;
  "Design Master Denshi Mangajuku" 1352944195; "GameKing" 1353051015; "VMU" 1379027676; "Barcode Battler" 1354183831;
  "List of handheld game consoles" 1384273411.

Hubs:

- NESdev wiki, "Cycle reference chart", "CIC lockout chip", "FDS BIOS", read as raw wikitext:
  `https://www.nesdev.org/w/index.php?title=CIC_lockout_chip&action=raw` and sibling pages.
- SNESdev wiki, "Timing": `https://snes.nesdev.org/w/index.php?title=Timing&action=raw`.
- fullsnes, index and chapters on the Super Game Boy, Satellaview, and SuFami Turbo:
  `https://problemkaputt.de/fullsnes.htm`, marked "Copyright 2012".
- Pan Docs, "Specifications", "Power Up Sequence", "The Cartridge Header", "SGB Functions", commit `f7f7b064`:
  `https://raw.githubusercontent.com/gbdev/pandocs/master/src/Power_Up_Sequence.md` and sibling files.
- SMS Power!, "Clock Rate", "BIOS", "ROM Header", "Game Gear LCD", read as page source:
  `https://www.smspower.org/Development/ROMHeader?action=source` and sibling pages.
- Plutiedev, "ROM header" and "Using the Sub-CPU in mode 1": `https://plutiedev.com/rom-header` and sibling pages.
- Sega Retro, technical specification pages for the Mega Drive, Master System, Mega CD, and 32X, and the Game Gear,
  Mega Jet, and Nomad articles; Sega Game Gear last edited 2026-10-14:
  `https://segaretro.org/index.php?title=Sega_Game_Gear&action=raw` and sibling pages.
- NeoGeo Development Wiki, "Clock", "System ROM", "NEO-CMC", "Category:CD systems":
  `https://wiki.neogeodev.org/index.php?title=Clock&action=raw` and sibling pages.
- WSdev wiki, "SoC", "Timing", "Boot ROM", "Cartridge connector", "ROM header", front page last edited 2026-09-10:
  `https://ws.nesdev.org/w/index.php?title=Cartridge_connector&action=raw` and sibling pages.
- Sacred Tech Scroll, Virtual Boy: `http://perfectkiosk.net/stsvb.html`.
- NgpCraft, NGPC Dev Wiki, README and licence file, last pushed 2026-11-03: `https://github.com/tixul/NgpCraft_dev_ref`.

Patents, front pages and abstracts:

- US 3,659,285 and US 3,728,480 (Sanders Associates):
  `https://patents.google.com/patent/US3659285/en` and `https://patents.google.com/patent/US3728480/en`.
- US 4,026,555 (Alpex Computer) and US 4,095,791 (Fairchild):
  `https://patents.google.com/patent/US4026555/en` and `https://patents.google.com/patent/US4095791/en`.
- US 4,112,422 and US 4,296,476 (Atari):
  `https://patents.google.com/patent/US4112422/en` and `https://patents.google.com/patent/US4296476/en`.
- US 4,799,635 (Nintendo): `https://patents.google.com/patent/US4799635A/en`.

Project documents:

- The research roadmap, `docs/roadmap/research.md`; `R0-02`; `R0-05`; ADR 0001; the source register.
