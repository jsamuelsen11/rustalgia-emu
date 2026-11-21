---
title: "8-bit and 16-bit consoles and handhelds: catalogue"
roadmap_item: R1-05
status: approved
date: 2026-11-21
---

# 8-bit and 16-bit consoles and handhelds: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold in the 8-bit and 16-bit era, and what hardware,
protection, firmware, and sources each has.

It lists about 100 machines and families, from the processor-less consoles of 1972 to handhelds sold as late as 2002.
It also groups the more than 1,000 first-generation consoles that
[Wikipedia lists](https://en.wikipedia.org/w/index.php?title=List_of_first_generation_home_video_game_consoles&oldid=1386346200),
many of them rebadges, by the game chip they share.

Beyond Wikipedia, open-tier hubs cover the surveyed families and a few others; patents,
[Sega's own page](https://web.archive.org/web/20261007070751/https://www.sega.jp/history/hard/gamegear/),
and a [1978 trade newsletter](https://www.worldradiohistory.com/Archive-TV-Digest/70s/1978/TV-Digest-1978-09.pdf) settle
several conflicts.

The fact that matters most to Rustalgia:
about 40 of the roughly 70 rows that name a processor have built-in firmware the project may not obtain
(counted from the rows below).

About 20 systems sit at the era's edges.
A system with a survey goes with its survey, and a device without one by its first sale.
The Pokémon Mini and Cybiko stay here because [R1-07](R1-07-catalogue-sixth-generation.md) leaves them to this note,
and the Pocket Challenge V2 stays with the WonderSwan line.

The note recommends four new family surveys, for Atari, NEC, SNK, and Bandai,
and later study only of systems that have a survey; the owner decides.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of the 8-bit and 16-bit era were sold, and for each,
  what are its maker, release, processor, video, audio, media, protection, firmware, survey, and sources?
- Covered: home consoles of the first to fourth generations, add-ons that act as systems, and handhelds,
  as the era is defined in "How the catalogue is built" below.
- Left to other items: how the hardware works to the primer ([R1-01](R1-01-primer-8-and-16-bit.md));
  each family's emulators to its survey
  ([R1-10](../../roadmap/research.md#system-family-surveys) to
  [R1-25](../../roadmap/research.md#system-family-surveys)); the law on lock-outs and firmware to
  [R0-02](R0-02-legal-baseline.md); each hub's evaluation to [R0-05](R0-05-source-map.md).
  PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles are emulator hosts,
  left to [R3-07](../../roadmap/research.md#phase-3-host-platforms)
  and [R3-12](../../roadmap/research.md#phase-3-host-platforms).
- Researched on 2026-11-20 against the Wikipedia revisions and hub pages listed in Sources.
- How claims were checked: three research agents each covered a share of the era and read every page as raw text,
  Wikipedia through its raw wikitext; no value here comes from a summarising tool unless it is marked "(secondary)".
  Two independent verification passes, one after the other,
  fetched the sources again and tested each claim and quotation.
  A rework pass on the same date then answered the open questions from the sources named in each finding,
  fetched as raw text with curl.
  A third independent pass checked the reworked note: one verifier tested its claims and quotations,
  another its links and shape.
  Each finding of the three passes was checked against the source once more before the text was changed;
  their corrections were applied, the claims they could not check are listed in the pull request,
  and the raw copies were deleted when the work was done.
- Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed unless a finding says so.
  Counts marked "(counted from the raw table)" were made by script over Wikipedia's wikitext. "(inference)" marks
  reasoning, and "(from memory)" a claim no fetched page confirmed.
  A statement that nothing was found records the searches made, not proof of absence.
- Notation: memory sizes that sources give in "KB" are written in KiB, because chip sizes are powers of two (inference);
  clocks are as each source gives them.
- No firmware, BIOS, boot ROM, game, maker manual hosted by others, or emulator code was opened.
  One page read by the first pass, SMS Power's "BIOSes", carries excerpts of a BIOS disassembly in its own text;
  the [register](../../../.claude/hooks/source-register.txt) now closes it, and nothing here rests on it.

## Findings

### How the catalogue is built

- The roadmap's title is a rule by processor word size, and its surveys add a rule by family:
  an era holds the systems whose family survey depends on its primer
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers)).
  Wikipedia uses a third rule, by generation, and disagrees with both at the edges.
  "Boundary cases" below settles which rule wins.
- A row is one machine or one compatible family.
  Revisions, regional models, rebadges, and combined units are folded into the row of the machine they run,
  with their names in the identity table.
- A device placed in another catalogue keeps one cross-reference row here, so that each device is listed once.
- "Survey" names the family survey whose title includes the system, or the system it is a model
  or add-on of. "(inference)" marks a survey that does not name the system;
  "R1-25 (inference)" marks a console built from a home computer.
  A dash means no survey's title names the system,
  so it falls to [R1-25](../../roadmap/research.md#system-family-surveys), "Other consoles, handhelds,
  and home computers: the systems that no other survey names";
  "Options and trade-offs" recommends four family surveys for some of them.
- "Hub" names the best open-tier source other than Wikipedia, as registered;
  a dash means Wikipedia was the only source found.
- Regions: NA North America, EU Europe, UK United Kingdom, DE Germany, RU Russia, PL Poland, JP Japan, KR South Korea,
  BR Brazil, AU Australia, HK Hong Kong, TW Taiwan, CN China.

### First generation: dedicated consoles

Every row rests on the Wikipedia article on the system or series, unless it names another source.

| System or series | Maker | First release | Game logic | Models |
|---|---|---|---|---|
| Odyssey | Magnavox, by Sanders Associates | NA 1972-09; UK 1973; EU 1974 | discrete transistors and diodes | 1 |
| Odyssey dedicated series | Magnavox; Philips | NA, EU 1975 to 1978 | TI, GI, National chips by model | 13 |
| Home Pong | Atari; Sears Tele-Games | NA 1975 | mostly custom Atari chips | 9 |
| TV Tennis Electrotennis | Epoch | JP 1975-09-12 | not stated; Magnavox licence | 1 |
| Telstar series | Coleco | NA 1976 | GI AY-3-8500 family; one MOS chip | 14, with the Arcade |
| Color TV-Game | Nintendo, with Mitsubishi | JP 1977-06-01 | not stated | 5 |
| Video Pinball | Atari | NA 1977 | microcontroller with RAM | 3 |
| Telstar Arcade | Coleco | NA 1977-08 | MOS MPS-7600 in each cartridge | 1 |
| PC-50x family | Soundic and many brands | EU 1977 to early 1980s | GI chip in each cartridge | many |
| Discrete-logic cartridge units | Philips, Interton, others | EU 1975 to 1976 | logic in each cartridge | several |

- Exceptions to the one-article rule:
  - the Odyssey series counts 9 Magnavox and 4 Philips models
    (["Odyssey series"](https://en.wikipedia.org/w/index.php?title=Odyssey_series&oldid=1381540098));
  - the Home Pong models and chips are from the list of first-generation consoles,
    counting its Pong rows and leaving out Video Pinball, which has its own row, and two other Atari units;
    some Atari-branded units there use General Instrument chips;
  - the Magnavox licence for TV Tennis is from
    ["First generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=First_generation_of_video_game_consoles&oldid=1383362694).
- Video Pinball's article calls its chip a microcontroller in "Gameplay" and "Pong-on-a-chip" in its lead.
  The Telstar series' count of 14 includes the Telstar Arcade, which also has its own row.
- The Odyssey is built from discrete diode-transistor logic, and its game cards act as switches on that logic
  (Wikipedia, ["Magnavox Odyssey"](https://en.wikipedia.org/w/index.php?title=Magnavox_Odyssey&oldid=1385452685),
  "Design"); that it has no processor and no stored program is an inference from that.
  Its designer's patent describes generating symbols by voltage-controlled delay of pulses and coincidence gating
  ([US 3,659,285](https://patents.google.com/patent/US3659285/en), front page,
  read at the [Patent Office](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/3659285)).
- PC-50x consoles have no central processor:
  "all the games are implemented thanks to the individual chips in the cartridges,
  all based on the chip family AY-3-8xxx of General Instrument"
  (Wikipedia, ["PC-50x family"](https://en.wikipedia.org/w/index.php?title=PC-50x_family&oldid=1359169771), lead).
- Telstar Arcade cartridges each hold a MOS microcontroller "capable of storing 512 words of ROM" (Wikipedia,
  ["Coleco Telstar Arcade"](https://en.wikipedia.org/w/index.php?title=Coleco_Telstar_Arcade&oldid=1386273222), lead).
- Wikipedia's list of first-generation consoles holds 1,036 released rows from 340 maker names
  (["List of first generation home video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_first_generation_home_video_game_consoles&oldid=1386346200);
  counted from the raw table).
  Another article speaks of "more than 900" first-generation consoles (Wikipedia,
  ["List of home video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_home_video_game_consoles&oldid=1386685039),
  section "List of home video game consoles").
  The rows group by the game chip they name:

| Chip family | Rows | Chip maker |
|---|---|---|
| GI AY-3-8500 (8500 PAL, 8500-1 NTSC) | 372, and 10 with a second chip | General Instrument |
| GI AY-3-8610, -8600, -8550, -8510, -8512, -8700, -8710, -8760 | about 77 | General Instrument (inference) |
| PC-50x cartridges (GI AY-3-8xxx) | 97 | General Instrument |
| TI TMS-1965N, TMS-1955 | 32 | Texas Instruments (inference from the prefix) |
| National MM-57105N, MM-57186N | about 23 | National Semiconductor |
| MOS MPS-7600 series | 18 | MOS Technology |
| Atari custom chips | 18 | Atari |
| Mitsubishi M58816P and others | 5 | Mitsubishi (inference from the prefix) |
| Soviet К145ИК17 | 9 | not stated |
| F-4301, NTL-600, SN76410N, MSL9320 | about 21 | not stated |
| Discrete logic or CMOS logic (TTL, 7400, DTL, CMOS) | 36 | none |
| Not given | 311 | — |

- The counts are of rows in one table and depend on its wording
  (counted from the raw table); six rows that name only Texas Instruments or Tesla fall in no group.
  The AY-3-8500 alone was "used in hundreds of different consoles"
  (Wikipedia, ["AY-3-8500"](https://en.wikipedia.org/w/index.php?title=AY-3-8500&oldid=1355333866), lead).
  It runs from a nominal 2.0 MHz clock, and colour needs a companion AY-3-8515 (same article).
- No General Instrument datasheet for the family was found among the pages read.
  Microchip, a General Instrument spin-off that sold the AY-3-8910 under its own brand for a few years (Wikipedia,
  ["General Instrument AY-3-8910"](https://en.wikipedia.org/w/index.php?title=General_Instrument_AY-3-8910&oldid=1375275795),
  lead), refused a scripted request for its AY-3-8910 page (HTTP 403 at `microchip.com/en-us/product/AY-3-8910`;
  research log; see "Coverage of sources").

### Second generation: home consoles

Every row rests on the Wikipedia article on the system, unless a finding below names another source.
The 2600's 1979 Japanese date is from
["Cassette Vision"](https://en.wikipedia.org/w/index.php?title=Cassette_Vision&oldid=1375473899), the APF's sound from
["APF Imagination Machine"](https://en.wikipedia.org/w/index.php?title=APF_Imagination_Machine&oldid=1378543303), and
the Champion 2711's sale in the United States and, from 1979, in Japan from
["Unisonic Products Corporation"](https://en.wikipedia.org/w/index.php?title=Unisonic_Products_Corporation&oldid=1359605329).

Identity, with the hub where one exists:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Channel F (VES; licensed EU models) | Fairchild; Zircon from 1979 | NA 1976-11; JP 1977-10 | — | — |
| Studio II (licensed clones) | RCA | NA 1977 | — | — |
| 2600 (VCS; Atari 2800 in JP) | Atari | NA c. 1977-09; EU 1978; JP 1979 (Epoch), 1983; BR 1983 | — | — |
| Astrocade (Bally Professional Arcade) | Bally | NA 1977-12 by mail; 1978-01 retail | — | — |
| 1292 APVS / VC 4000 (25 variants) | Radofin; Interton | EU 1978; AU 1979 | — | — |
| APF-MP1000 (Imagination Machine) | APF Electronics | NA 1978-10 | — | — |
| Champion 2711 | Unisonic | NA 1978; JP 1979 | — | — |
| Odyssey 2 (Videopac G7000) | Magnavox; Philips | NA 1978-09 to dealers; EU 1978; JP 1982; BR 1983 | — | — |
| Super Vision 8000 (TV Jack 8000) | Bandai | 1979-12 (JP, inference) | — | — |
| Intellivision (many licensed models) | Mattel; INTV from 1984 | NA 1979 test, 1980; UK 1980 or 1981; JP 1982 | — | — |
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
| Studio II | RCA 1802, 1.76 MHz | CDP1861, 64 × 32 | beeps | 2 KiB: games, interpreter |
| 2600 | MOS 6507, 1.19 MHz | TIA, no frame buffer | TIA, 2 channels | none |
| Astrocade | Z80, 1.789 MHz | custom, 160 × 102 at 2 bits | custom, 3 square + noise | 8 KiB, built-in games |
| 1292 APVS / VC 4000 | Signetics 2650A, 0.887 MHz | Signetics 2636 | basic | none stated |
| APF-MP1000 | Motorola 6800, 0.895 MHz | MC6847, 256 × 192 | 1 channel | ROM with a game |
| Champion 2711 | GI CP1610 | GI AY-3-8800 (video and sound) | in the AY-3-8800 | two built-in games |
| Odyssey 2 | Intel 8048, 5.37 MHz NTSC | Intel 8244/8245 | in the 8244/8245 | 1 KiB in the 8048 |
| Super Vision 8000 | NEC D780C-1 (Z80 clone), 3.58 MHz | AMI S68047 | GI AY-3-8910 | not stated |
| Intellivision | GI CP1610, about 1.79 MHz NTSC | STIC (AY-3-8900) | GI AY-3-8914 | Exec, plus graphics ROM |
| Cassette Vision | NEC µPD777C or µPD778 in cartridge | from the cartridge chip; NTSC out | beeper | none recorded |
| CreatiVision | 6502, 2 MHz | TI TMS9918/9929 | TI SN76489 | not stated |
| Arcadia 2001 | Signetics 2650 | Signetics 2637 | beeper and noise | none |
| ColecoVision | Z80A, 3.58 MHz | TI TMS9928A/9929A | TI SN76489 | 8 KiB BIOS |
| 5200 | 6502C (SALLY), 1.79 MHz | ANTIC and GTIA | POKEY | 2 KiB BIOS |
| Vectrex | Motorola 68A09, 1.5 MHz | analogue vector CRT | GI AY-3-8912 | 8 KiB, with a game |
| TV Boy | Motorola MC6801, 4 MHz, in cartridge | MC6847 | not stated | not stated |

- The Channel F's start-up code, shared routines, and two games sit in 2 KiB of ROM in two 3851 chips
  (Wikipedia, ["Fairchild Channel F"](https://en.wikipedia.org/w/index.php?title=Fairchild_Channel_F&oldid=1385111024),
  "Design").
- Fairchild's patent settles the part numbers:
  the console uses "a Fairchild F8 3850 central processing unit (CPU)
  and two F8 3851 program storage units (PSU) with each of the PSUs containing 1024 bytes of the program",
  and its processor clock is 1.8 MHz, "derived from a 3.58 MHz signal"
  ([US 4,095,791](https://patents.google.com/patent/US4095791A/en), description of the preferred embodiment).
- The article's "3580" and "3581" cite White and de Boer (2016), p. 25, in "Cartridges", and Buchsbaum and Mauro (1979),
  p. 294, in "Technical specifications"; neither book was read.
  The table's 1.79 MHz is consistent with the patent's 3.58 MHz halved (inference).
- The patents of the Channel F's maker
  and of the licensor of its prototype describe a display memory read out in step with the scan,
  and its cartridge connector ([US 4,026,555](https://patents.google.com/patent/US4026555/en) and US 4,095,791,
  abstracts).
- The 2600 "was designed without a frame buffer" and its games build each line in step with the television's beam
  (Wikipedia, ["Atari 2600"](https://en.wikipedia.org/w/index.php?title=Atari_2600&oldid=1386797711), "Hardware").
  Only its video chip differs between NTSC and PAL units, and SECAM units add an adapter board; the palettes are 128,
  104, and 8 colours (Wikipedia,
  ["Atari 2600 hardware"](https://en.wikipedia.org/w/index.php?title=Atari_2600_hardware&oldid=1384141830);
  ["Television Interface Adaptor"](https://en.wikipedia.org/w/index.php?title=Television_Interface_Adaptor&oldid=1386648231)).
  Games were developed and published separately for each region (Wikipedia, "Atari 2600", "Graphics").
  Cartridges larger than its 4 KiB window use bank switching, up to 64 KiB
  (Wikipedia, "Atari 2600 hardware", "Technical specifications").
- Atari's patent, filed in 1976, describes horizontal motion by per-object position counters,
  with vertical motion done by the processor
  ([US 4,112,422](https://patents.google.com/patent/US4112422/en), abstract);
  that it describes the TIA is an inference from its inventors and date.
- The Studio II's ROM holds five games and a BIOS "featuring an interpreter for the custom programming language
  that cartridges are written in", and its sound is simple beeps
  (Wikipedia, ["RCA Studio II"](https://en.wikipedia.org/w/index.php?title=RCA_Studio_II&oldid=1384562059), "Design").
  Its clock is 1.76 MHz in the article's "Technical specifications", which cites Buchsbaum and Mauro (1979),
  pp. 292–294, as the article gives them (secondary); the infobox's 1.78 MHz has no citation.
- No maker document was found for the Studio II's video chip.
  Renesas, the successor of RCA's chip line (from memory), has no product page for the CDP1861
  (HTTP 404 at `renesas.com/en/products/cdp1861`).
  The datasheet that ["RCA CDP1861"](https://en.wikipedia.org/w/index.php?title=RCA_CDP1861&oldid=1356046971) links is
  an archive copy on a third-party host, which was not opened: maker material that others host, with no sign the maker
  released it, is closed ([ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md), "Sources that are not
  emulators").
- The Astrocade's video chip transforms data that a program writes to the ROM address space and stores the result in RAM
  (Wikipedia, ["Astrocade"](https://en.wikipedia.org/w/index.php?title=Astrocade&oldid=1386364772), "Description");
  the chips are shared with Midway arcade boards such as Gorf (same article).
- The Intellivision's processor runs 10-bit instruction words, which General Instrument made 10-bit ROMs to hold
  (Wikipedia,
  ["General Instrument CP1600"](https://en.wikipedia.org/w/index.php?title=General_Instrument_CP1600&oldid=1372435639)).
  Its Exec is 4,096 words of 10 bits, plus a 2 KiB graphics ROM;
  the Intellivision II changed the Exec "in an attempt to lock out third-party games"
  (Wikipedia, ["Intellivision"](https://en.wikipedia.org/w/index.php?title=Intellivision&oldid=1384387529),
  "Hardware specifications" and "Intellivision II").
- ColecoVision's BIOS pauses first-party games on start-up for 12.7 s on NTSC units and 3.3 s in the PAL and SECAM BIOS,
  so the firmware differs by region.
  Its Expansion Module #1 is in effect a 2600 built around a reverse-engineered copy of the TIA
  (Wikipedia, ["ColecoVision"](https://en.wikipedia.org/w/index.php?title=ColecoVision&oldid=1369186567), "Hardware").
- The 5200 shares its chips with Atari's 8-bit computers but is not software compatible: among other differences,
  some registers sit at other addresses and a 2 KiB operating system replaces the computers' 10 KiB one
  (Wikipedia, ["Atari 5200"](https://en.wikipedia.org/w/index.php?title=Atari_5200&oldid=1382706947),
  "Differences from Atari 8-bit computers").
  Atari's patent of 1979 describes a graphics generator that fetches display instructions from memory
  ([US 4,296,476](https://patents.google.com/patent/US4296476/en), abstract);
  its tie to ANTIC is an inference from the inventors and date.
- The Vectrex draws on its built-in screen with "an all-analog design using two integrators: X and Y",
  and reads its controllers through the sound chip
  (Wikipedia, ["Vectrex"](https://en.wikipedia.org/w/index.php?title=Vectrex&oldid=1386579084)).
- The Odyssey 2 was shipping to North American dealers by 25 September 1978:
  "Magnavox has started shipping $180 Odyssey 2 video game to dealers."
  ([*Television Digest*, vol. 18 no. 39, 25 September 1978](https://www.worldradiohistory.com/Archive-TV-Digest/70s/1978/TV-Digest-1978-09.pdf),
  p. 12).
  The source gives shipments to dealers, not a retail date.
  ["Magnavox Odyssey 2"](https://en.wikipedia.org/w/index.php?title=Magnavox_Odyssey_2&oldid=1384362011) cites the same
  item for its September 1978; the February 1979 in
  ["Second generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Second_generation_of_video_game_consoles&oldid=1386367484)
  sits in an uncited table cell and is dropped.
  The Intellivision's 1979 test and 1980 launch are from that second article's table.

### Third generation: home consoles

Every row rests on the system's Wikipedia article, unless a finding names another source.
The NES and Dendy processor clocks and chip names are from the NESdev wiki,
["Cycle reference chart"](https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433),
and the Master System's clocks from SMS Power, ["Clock Rate"](https://www.smspower.org/Development/ClockRate).
The My Vision's hardware is from the Japanese article's specification list, which carries no citation.

Identity:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Famicom / NES (Comboy KR) | Nintendo | JP 1983-07-15; NA 1985-10-18; EU 1986-09-01 | [R1-15](../../roadmap/research.md#system-family-surveys) | NESdev wiki |
| Famiclones (Dendy, Pegasus, Micro Genius) | various | PL 1991; RU 1992; Asia | [R1-15](../../roadmap/research.md#system-family-surveys) (inference) | NESdev wiki |
| SG-1000 (SC-3000; SG-1000 II) | Sega | JP 1983-07-15; AU 1983-11 | — | SMS Power |
| Mark III / Master System | Sega; Tectoy, Samsung | JP 1985-10-20; NA 1986; EU 1987; BR 1989 | [R1-22](../../roadmap/research.md#system-family-surveys) | SMS Power |
| 7800 ProSystem | Atari Corp., by GCC | NA 1986-05; EU 1987 | — | — |
| XEGS | Atari Corp. | 1987 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |
| PV-1000 | Casio | JP 1983-10 | — | — |
| Super Cassette Vision | Epoch | JP 1984-07-17; EU 1984 | — | — |
| My Vision | Nichibutsu | JP 1983 | — | — |
| Videopac+ G7400 (Jopac) | Philips | 1983 | — | — |
| Pyūta Jr. | Tomy | JP 1983 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |
| Dina (Personal Arcade) | Bit Corporation | 1986 | — | — |
| BBC Bridge Companion | Heber | UK 1985 | — | — |
| Video Art | LJN | 1987 | — | — |
| Socrates | VTech | 1988 | — | — |
| Action Max; Video Challenger | Worlds of Wonder; Takara | 1987 | — | — |
| Interactive Vision | View-Master | 1989 | — | — |
| Zemmix | Daewoo | KR 1985 to 1995 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |
| GX4000 | Amstrad | EU 1990-09 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |
| C64 Games System | Commodore | 1990-12 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |

Hardware:

| System | CPU | Video | Audio | Firmware |
|---|---|---|---|---|
| Famicom / NES | Ricoh 2A03, 1.789773 MHz; 2A07 PAL | Ricoh 2C02; 2C07 PAL | in the CPU chip | none |
| Dendy | UMC UA6527P, 1.773448 MHz | clone of the PPU | in the CPU chip | none |
| SG-1000 | Z80A, 3.58 MHz | TI TMS9918A | TI SN76489AN | none |
| Master System | Z80A, 3.58 MHz NTSC; 3.55 PAL | Sega VDP | SN76489 via VDP; YM2413 in JP | BIOS; check on export |
| 7800 | SALLY (6502), 1.79 or 1.19 MHz NTSC | MARIA, display lists | TIA; POKEY on some games | 4 KiB; PAL 16 KiB |
| XEGS | 6502C, 1.79 MHz | ANTIC and GTIA | POKEY | ROM with Missile Command |
| PV-1000 | Z80, 3.579 MHz | NEC D65010G031 | in the video chip | not stated |
| Super Cassette Vision | NEC µPD7801G, 4 MHz | EPOCH TV-1 | NEC µPD1771C | not stated |
| My Vision | NEC µPD780C (Z80), 2.68465 MHz | TI TMS9918A | GI AY-3-8910 | not stated |
| Videopac+ G7400 | Intel 8048, 5.91 MHz | 8245 + Thomson EF9340/9341 | 1 channel | 1 KiB ROM |
| Pyūta Jr. | TI TMS9995 (inference) | TI TMS9918 (inference) | TI SN76489AN (inference) | not stated |
| Dina | Z80 | TI TMS9928A | not stated | a built-in game; a changed boot screen |
| BBC Bridge Companion | Z80A, 3.579 MHz | TI TMS9129NL | not stated | 16 KiB ROM |
| Video Art | Motorola 6800-based EF6805 | Thomson EF9367P | not stated | not checked |
| Socrates | Z80A, 3.57 MHz | custom | not stated | not stated |
| Action Max | HD401010 | VHS tape | VHS tape | not stated |
| GX4000 | Z80, 4 MHz | CPC Plus ASIC | GI AY-3-8912 | not stated |

- The NES's master clock is divided by 12 on NTSC consoles and by 16 on PAL consoles,
  and the Dendy divides the PAL clock by 15; Brazilian and Argentine clones use still other master clocks
  (NESdev wiki, ["Cycle reference chart"](https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433)).
  A clone is therefore its own timing target, not a rebadge (inference).
- "The frontloading NES has a CIC Lockout Chip, a microcontroller that performs a proprietary handshake,
  as an anticompetitive measure.
  The Famicom and toploading NES consoles do not contain this chip."
  (NESdev wiki, ["CIC lockout chip"](https://www.nesdev.org/w/index.php?title=CIC_lockout_chip&oldid=24095)).
  Nintendo's patent describes matching devices in console and cartridge that hold the console in reset
  if their results disagree ([US 4,799,635](https://patents.google.com/patent/US4799635A/en), abstract).
- Export Master Systems carry a BIOS that checks the cartridge header:
  "The BIOS in non-Japanese Master Systems requires a valid header
  and later Game Gears will also not run software without one."
  (SMS Power, ["ROM Header"](https://www.smspower.org/Development/ROMHeader)).
  The header begins with the 8-byte identifier `TMR SEGA`, recorded here because the check requires it
  (same page);
  the Mark III and every SG-1000 have no BIOS (SMS Power, ["BIOS"](https://www.smspower.org/Development/BIOS)).
- The Master System's Z80 runs at the master crystal divided by 15, 3,579,540 Hz on NTSC and 3,546,893 Hz on PAL
  (SMS Power, ["Clock Rate"](https://www.smspower.org/Development/ClockRate)).
  Japanese models add a YM2413 FM chip, and the SN76489 sound reaches the output through the VDP
  (Wikipedia, ["Master System"](https://en.wikipedia.org/w/index.php?title=Master_System&oldid=1386607587), infobox).
  By the account of Hideki Sato that Wikipedia reports, Sega redesigned the console, with a video chip of its own,
  because the SG-1000's TMS9918A lacked the power for the games Sega wanted (Wikipedia, "Master System", "Mark III").
- The 7800 can run almost all 2600 cartridges
  (Wikipedia, ["Atari 7800"](https://en.wikipedia.org/w/index.php?title=Atari_7800&oldid=1384315726), lead);
  on NTSC units its processor slows to 1.19 MHz when it reaches the TIA or the 6532 ("Technical specifications").
  The NTSC BIOS checks a digital signature stored on each cartridge against one it computes from the ROM,
  and runs the cartridge in 7800 mode only if they match;
  PAL units lack the signature check and tell 2600 cartridges apart by heuristics
  (same article, "Digitally signed cartridges").
  The PAL unit's 16 KiB ROM includes a built-in game ("Technical specifications").
- How the signature is computed and what the PAL heuristics are would come from analysis of the BIOS (inference),
  or from Atari's signing software, which the article says "was eventually found
  and released at Classic Gaming Expo in 2001" ("Game development").
  Neither is sought or recorded: the first is firmware,
  and the second is maker material with no sign that Atari released it,
  which [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) closes;
  see also the research guide's [constants convention](../README.md#constants-and-tables).
- The XEGS ships with Missile Command built in
  (Wikipedia, ["Atari XEGS"](https://en.wikipedia.org/w/index.php?title=Atari_XEGS&oldid=1383793263), "Games").
- The SG-1000, ColecoVision, CreatiVision, Dina, BBC Bridge Companion, My Vision,
  and Pyūta Jr. use Texas Instruments' TMS9918 video chip family
  (Wikipedia, articles on each system; for the Pyūta Jr., the Tomy Tutor's infobox, an inference for the console).
- The My Vision runs an NEC µPD780C, a Z80-compatible processor, at 2.68465 MHz, with a TMS9918A, an AY-3-8910,
  2 KiB of RAM, and 16 KiB of video RAM (Japanese Wikipedia,
  ["マイビジョン"](https://ja.wikipedia.org/w/index.php?title=%E3%83%9E%E3%82%A4%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B3&oldid=108997077),
  "仕様"; uncited list).
  The English article's category "Z80-based video game consoles" agrees.
- The Dina's start-up screen replaces the ColecoVision's with its maker's name,
  so it carries a changed ColecoVision BIOS (inference from Wikipedia,
  ["Dina (console)"](https://en.wikipedia.org/w/index.php?title=Dina_%28console%29&oldid=1353018547), "Software").
- The Action Max and Video Challenger score a light gun against a tape played on the owner's video recorder,
  so the console itself holds little to emulate
  (inference from Wikipedia, ["Action Max"](https://en.wikipedia.org/w/index.php?title=Action_Max&oldid=1352940996) and
  ["Video Challenger"](https://en.wikipedia.org/w/index.php?title=Video_Challenger&oldid=1353018784)); the Interactive
  Vision adds its own graphics and games over the tape (Wikipedia,
  ["View-Master Interactive Vision"](https://en.wikipedia.org/w/index.php?title=View-Master_Interactive_Vision&oldid=1384550636)).
- The Video Art's article names its EF6805 and EF9367P and no sound chip
  (Wikipedia, ["LJN Video Art"](https://en.wikipedia.org/w/index.php?title=LJN_Video_Art&oldid=1353018644)).
  The board photographs it cites, an [Internet Archive upload](https://archive.org/details/centerofboardbottom),
  list the EF6805R2P, the EF9367P, NEC D41416C-15 memory, 74-series logic, a regulator,
  and a Thomson TSGB01019ACP that the uploader could not identify; none is a sound chip (item description; observed).
  Whether the Video Art makes sound, and through which part, stays open.
- ["BBC Bridge Companion"](https://en.wikipedia.org/w/index.php?title=BBC_Bridge_Companion&oldid=1359829232) names no
  sound hardware.
  The [board photograph](https://commons.wikimedia.org/wiki/File:BBC-bridge-companion-pcb.jpg) in its "History" shows a
  Z80A, a Z80 PIO, the TMS9129NL, a 2 KiB static RAM, two EPROMs, two TMS4416 video RAMs, and an RF modulator, and no
  sound chip on the side shown (observed).
  Any sound would then come from the processor through the PIO or the video output stage (inference).

### Fourth generation: home consoles

Identity:

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Mega Drive / Genesis | Sega; Tectoy, Samsung, Majesco | JP 1988-10-29; NA 1989-08 | [R1-22](../../roadmap/research.md#system-family-surveys) | Plutiedev |
| PC Engine / TurboGrafx-16 (Duo, Shuttle) | NEC, Hudson Soft | JP 1987-10-30; NA 1989-08-29; EU 1989 | — | — |
| SuperGrafx | NEC | JP 1989-12-08 | — | — |
| Super Famicom / SNES | Nintendo | JP 1990-11-21; NA 1991-08-23; EU 1992 | [R1-15](../../roadmap/research.md#system-family-surveys) | SNESdev wiki |
| Neo Geo AES (MVS arcade) | SNK | JP 1990-04-26; NA 1991, doubted | [R1-24](../../roadmap/research.md#system-family-surveys) for MVS (inference) | NeoGeo wiki |
| Neo Geo CD, CDZ | SNK | JP 1994-09-09; EU 1994-12; NA 1996-01-15 | — | NeoGeo wiki |
| TeraDrive | IBM, with Sega | JP 1991-05-31 | [R1-22](../../roadmap/research.md#system-family-surveys) (inference) | — |
| CDTV | Commodore | NA 1991 (shown 03, launched 04); UK 1991 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |
| CD-i (players by many makers) | Philips | NA 1991-12-03; JP 1992; EU 1992 | — | — |
| Video Information System | Tandy | 1992 | [R1-25](../../roadmap/research.md#system-family-surveys) (inference) | — |
| Sega Pico (Kids Computer Pico) | Sega Toys | JP 1993-06; NA 1994-11; EU 1994 | — | — |
| LaserActive | Pioneer | JP 1993-08-20; NA 1993-09-13 | — | — |
| CPS Changer | Capcom | JP 1994-11 | [R1-24](../../roadmap/research.md#system-family-surveys) (inference) | — |
| Super A'Can | Funtech | TW, CN 1995-10-25 | — | — |

Hardware:

| System | CPU | Video | Audio | Firmware |
|---|---|---|---|---|
| Mega Drive | 68000, 7.6 MHz; Z80, 3.58 MHz | Sega VDP (YM7101) | YM2612; PSG in VDP | TMSS check from 1991 |
| PC Engine | Hudson HuC6280, 7.16 MHz | HuC6270 and HuC6260 | in the CPU chip | not stated |
| SuperGrafx | HuC6280A | two HuC6270, HuC6202, HuC6260 | in the CPU chip | not stated |
| Super Famicom | Ricoh 5A22 (65C816), 3.58 MHz peak | S-PPU1 and S-PPU2 | S-SMP: SPC700, S-DSP | not stated |
| Neo Geo AES | 68000, 12 MHz; Z80, 4 MHz | LSPC | Yamaha YM2610 | system ROM |
| Neo Geo CD | 68000, 12 MHz; Z80, 4 MHz | as the AES | YM2610 without ADPCM-B; CD audio | CD system ROM |
| TeraDrive | 80286; 68000; Z80 | Mega Drive and PC | Mega Drive | not stated |
| CDTV | 68000, 7 MHz | Amiga OCS, ECS | 4 channels, 8-bit | AmigaOS 1.3 |
| CD-i | Philips SCC68070, 15.5 MHz | SCC66470, MCD 212 | MCD 221, ADPCM | CD-RTOS |
| Video Information System | AMD 80286, 12 MHz | Cirrus Logic | Yamaha YMF262 | not checked |
| Sega Pico | 68000, 7.6 MHz | from the Mega Drive | SN76489; NEC µPD7759 | not checked |
| LaserActive | not stated; PAC modules | not stated | not stated | not stated |
| CPS Changer | 68000, 10 MHz; Z80, 3.579 MHz | CPS-1 board | YM2151; OKI6295 | not stated |
| Super A'Can | 68000, 10.738635 MHz | UMC UM6618 | UMC UM6619, 16 PCM channels | not checked |

- Wikipedia gives the Mega Drive's 68000 as 7.6 MHz and its Z80 as 3.58 MHz
  (["Sega Genesis"](https://en.wikipedia.org/w/index.php?title=Sega_Genesis&oldid=1386540687), infobox).
  Exact rates of 7.670454 MHz and 3.579545 MHz on NTSC appear on Sega Retro,
  whose master-clock line cites a Sega service manual that it hosts and
  that the [register](../../../.claude/hooks/source-register.txt) closes, so they rest on a closed source (Sega Retro,
  ["Sega Mega Drive/Technical specifications"](https://segaretro.org/Sega_Mega_Drive/Technical_specifications)).
- From 1991 the Mega Drive's Trademark Security System checks the cartridge before showing a licence message
  (Wikipedia, "Sega Genesis", "Trademark Security System and Sega v. Accolade").
  "If it doesn't find the initial 'SEGA' text in this field, systems with TMSS will refuse to boot the game."
  (Plutiedev, ["ROM header"](https://plutiedev.com/rom-header)).
  [R0-02](R0-02-legal-baseline.md) records the law on this check, in
  ["Trade marks and branding, recorded as risks"](R0-02-legal-baseline.md#trade-marks-and-branding-recorded-as-risks).
- A Super Famicom processor cycle takes 6, 8, or 12 cycles of a 945/44 MHz master clock on NTSC consoles,
  depending on the address and the fast-ROM setting, which gives the quoted 3.58, 2.68, and 1.79 MHz
  (SNESdev wiki, ["Timing"](https://snes.nesdev.org/w/index.php?title=Timing&oldid=1467)).
  A lock-out chip in console and cartridge separates PAL from Japanese and North American systems (Wikipedia,
  ["Super Nintendo Entertainment System"](https://en.wikipedia.org/w/index.php?title=Super_Nintendo_Entertainment_System&oldid=1383614888),
  "Regional lockout").
- Super Famicom cartridges can carry coprocessors, such as the Super FX and SA-1
  (Wikipedia, "Super Nintendo Entertainment System", "Enhancement chips");
  that a game needs its chip to run is an inference,
  and [R1-15](../../roadmap/research.md#system-family-surveys) is the survey to list them.
- The Neo Geo CD's YM2610 lacks the ADPCM-B channels
  (NeoGeo Development Wiki, ["YM2610"](https://wiki.neogeodev.org/index.php?title=YM2610)).
- North American HuCards "reverse eight of these pins as a region lockout method"
  (Wikipedia, ["TurboGrafx-16"](https://en.wikipedia.org/w/index.php?title=TurboGrafx-16&oldid=1384843861),
  "Technical specifications").
- No PC Engine hub was found.
  The community wiki tried, Archaic Pixels
  (no link: the domain no longer serves the wiki), returns HTTP 500 or no connection in 2026 (research log).
  Its main page captured on 2025-03-19 holds only a redirect to another page, and the one of 2025-12-07 a "One moment,
  please..." page; the capture index runs to 2026-10-07, which returns HTTP 500 (observed).
  The last capture of the wiki itself, of 2023-10-03, states no licence in its footer,
  and its "About" and "General disclaimer" pages have no captures,
  so its licence and the origin of its facts cannot be evaluated; it stays unregistered and is not cited.
  No other PC Engine hub is in the [register](../../../.claude/hooks/source-register.txt)
  or in [R0-05](R0-05-source-map.md)'s tables.
- The Neo Geo's master clock is 24 MHz on the arcade board and 24.167829 MHz on the home console,
  so the two run at different speeds (NeoGeo Development Wiki,
  ["Clock"](https://wiki.neogeodev.org/index.php?title=Clock)).
  Every Neo Geo has a system ROM, and late cartridges carry a chip that unscrambles graphics data
  (NeoGeo Development Wiki, ["System ROM"](https://wiki.neogeodev.org/index.php?title=System_ROM);
  ["NEO-CMC"](https://wiki.neogeodev.org/index.php?title=NEO-CMC)); that wiki points to MAME's source, which is walled,
  for the details.
  Wikipedia marks the AES's North American date of 1991 as needing a citation and suggests 1990
  (["Neo Geo"](https://en.wikipedia.org/w/index.php?title=Neo_Geo&oldid=1384602234), infobox).
- CD-i is a disc format and a player platform; Philips and its licensees made the players,
  and the comparison table marks them free of regional lock-out
  (Wikipedia, ["CD-i"](https://en.wikipedia.org/w/index.php?title=CD-i&oldid=1384443552);
  ["Fourth generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Fourth_generation_of_video_game_consoles&oldid=1383231353),
  "Other consoles").
- The CDTV was shown in North America in March 1991 and launched in April
  (Wikipedia, ["CDTV"](https://en.wikipedia.org/w/index.php?title=CDTV&oldid=1370221495)).
  Two of the LaserActive's PAC modules each add compatibility with one platform, Sega's and NEC's;
  others add karaoke and computer control, and the article names no processor
  (Wikipedia, ["LaserActive"](https://en.wikipedia.org/w/index.php?title=LaserActive&oldid=1381290213)).

### Add-ons that act as systems

Sources by row:

- the Disk System from the NESdev wiki
  (["FDS BIOS"](https://www.nesdev.org/w/index.php?title=FDS_BIOS&oldid=24615)) and Wikipedia;
- the PC Engine add-ons from Wikipedia,
  ["TurboGrafx-16"](https://en.wikipedia.org/w/index.php?title=TurboGrafx-16&oldid=1384843861),
  with ADPCM and CD audio from the fourth-generation comparison table;
- the Super Game Boy's firmware cell from
  [Pan Docs](https://github.com/gbdev/pandocs/blob/f7f7b064/src/SGB_Functions.md), the Satellaview's from Wikipedia, and
  the SuFami Turbo's from [fullsnes](https://web.archive.org/web/20261105224518/https://problemkaputt.de/fullsnes.htm),
  read in an archive capture because the live site refuses scripts;
- the rest from each add-on's Wikipedia article.

Every survey in this table is an inference from the survey of the base system.

| Add-on | Base | First release | Adds | Firmware | Survey |
|---|---|---|---|---|---|
| Famicom Disk System | Famicom | JP 1986-02-21 | disk drive, RAM, wavetable channel | 8 KiB BIOS | [R1-15](../../roadmap/research.md#system-family-surveys) |
| Family Computer Network System | Famicom | JP 1988-09 | modem, ROM cards | not checked | [R1-15](../../roadmap/research.md#system-family-surveys) |
| CD-ROM² / TurboGrafx-CD | PC Engine | JP 1988-12-04; NA 1989-11 | CD drive, ADPCM, CD audio | System Card | — |
| Super CD-ROM²; Arcade Card | PC Engine | JP 1991; 1994-03-12 | more buffer RAM | System Card 3.0 | — |
| Mega CD / Sega CD | Mega Drive | JP 1991-12-12; NA 1992-10-15 | 68000, ASIC, Ricoh PCM | 1 Mbit boot ROM | [R1-22](../../roadmap/research.md#system-family-surveys) |
| Super Game Boy (and 2) | Super Famicom | JP, NA 1994-06; EU 1994-09 | Game Boy | SNES program | [R1-10](../../roadmap/research.md#system-family-surveys), [R1-15](../../roadmap/research.md#system-family-surveys) |
| Satellaview | Super Famicom | JP 1995-04-23 | satellite receiver | BS-X program | [R1-15](../../roadmap/research.md#system-family-surveys) |
| SuFami Turbo | Super Famicom | JP 1996 | two mini-cartridge slots | BIOS ROM in adaptor, 256 KiB | [R1-15](../../roadmap/research.md#system-family-surveys) |
| 32X | Mega Drive | NA 1994-11-21; JP 1994-12-03 | two SH-2, 256 KiB video RAM | not checked | [R1-22](../../roadmap/research.md#system-family-surveys) |

- The Disk System's 8 KiB BIOS loads files from disk and checks that a licence message is present before running a game;
  some titles bypassed the check (NESdev wiki,
  ["FDS BIOS"](https://www.nesdev.org/w/index.php?title=FDS_BIOS&oldid=24615)).
  Disks also carry a recessed "NINTENDO" moulding that the drive requires
  (Wikipedia, ["Famicom Disk System"](https://en.wikipedia.org/w/index.php?title=Famicom_Disk_System&oldid=1381100509)).
- The Mega CD adds a second 68000 at 12.5 MHz, a scaling and rotation ASIC, and a Ricoh RF5C164 sound chip
  (Wikipedia, ["Sega CD"](https://en.wikipedia.org/w/index.php?title=Sega_CD&oldid=1385340710),
  "Technical specifications"), which the fourth-generation comparison table gives eight PCM channels (Wikipedia,
  ["Fourth generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Fourth_generation_of_video_game_consoles&oldid=1383231353),
  "Other consoles").
  It can also start a program from cartridge without its BIOS
  (Plutiedev, ["Using the Sub-CPU in mode 1"](https://plutiedev.com/subcpu-in-mode1)).
- The Super Game Boy cartridge holds a Game Boy system on a chip, the ICD2 bridge,
  and "a system software ROM that runs on the SNES"
  (Pan Docs, ["SGB Functions"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/SGB_Functions.md),
  "More Technical Description"). fullsnes's chip list agrees
  ("plus SNES SGB BIOS"; [fullsnes](https://web.archive.org/web/20261105224518/https://problemkaputt.de/fullsnes.htm),
  "SNES Cart Super Gameboy", capture).
  Its Game Boy clock comes from the Super Famicom's, at 4.2955 MHz on NTSC units, about 2.4 % fast;
  the Super Game Boy 2 has its own crystal
  (Pan Docs, "SGB Functions"; Wikipedia,
  ["Super Game Boy"](https://en.wikipedia.org/w/index.php?title=Super_Game_Boy&oldid=1384385701)).
- "The required system cartridge, *BS-X* ...,
  functions both as an interactive menu for the Satellaview service and as a standalone game"
  (Wikipedia, ["Satellaview"](https://en.wikipedia.org/w/index.php?title=Satellaview&oldid=1384890138),
  "Technical specifications").
  Most Satellaview content was lost when the service closed; some has been recovered, partly from memory packs
  (same article).
- The SuFami Turbo adaptor "contains the BIOS ROM, and two slots for 'mini-carts'",
  and its BIOS ROM is "always 256Kbytes" (fullsnes, "SNES Cart Sufami Turbo General Notes", capture).
  ["SuFami Turbo"](https://en.wikipedia.org/w/index.php?title=SuFami_Turbo&oldid=1345812760) does not mention a BIOS.
  fullsnes's chapters that summarise BIOS functions describe firmware and were not read.
- Bandai's Datach barcode reader (1992) and Camerica's Aladdin Deck Enhancer, developed with Codemasters (1992),
  change how cartridges are built rather than adding a processor
  (Wikipedia, ["Datach"](https://en.wikipedia.org/w/index.php?title=Datach&oldid=1385030981);
  ["Aladdin Deck Enhancer"](https://en.wikipedia.org/w/index.php?title=Aladdin_Deck_Enhancer&oldid=1363131517));
  this catalogue treats them as media.
- The 32X has 32-bit processors on a 16-bit console; Wikipedia places it in the fifth generation
  (["32X"](https://en.wikipedia.org/w/index.php?title=32X&oldid=1385340621), infobox),
  and Sega Retro's figures for it cite Sega manuals
  that the [register](../../../.claude/hooks/source-register.txt) closes
  (["Sega 32X/Technical specifications"](https://segaretro.org/Sega_32X/Technical_specifications)).
  It stays here as a Mega Drive add-on, and [R1-06](R1-06-catalogue-32-and-64-bit.md) keeps a cross-reference to it.

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
| Game Boy (DMG; Pocket, Light) | Nintendo | JP 1989-04-21; NA 1989-07-31; EU 1990-09-28 | [R1-10](../../roadmap/research.md#system-family-surveys) | Pan Docs |
| Lynx (Lynx II) | Atari Corp., by Epyx | NA 1989-09-01; EU, JP 1990 | — | — |
| Game Gear (Kids Gear) | Sega; Majesco re-release | JP 1990-10-06; NA, EU 1991-04 | [R1-22](../../roadmap/research.md#system-family-surveys) | SMS Power |
| TurboExpress (PC Engine GT); LT | NEC | JP, NA 1990-12; LT JP 1991-12-13 | — | — |
| Gamate | Bit Corporation | early 1990s | — | — |
| Game Master (Systema 2000) | Hartung | DE 1990 | — | — |
| Barcode Battler | Epoch | JP 1991-03 | — | — |
| Supervision (QS-800, SV-100) | Watara | 1992 | — | — |
| Mega Duck (Cougar Boy) | Welback Holdings | 1993 | — | — |
| Mega Jet (no screen) | Sega | JP 1993-07 rental; 1994-03-10 retail | [R1-22](../../roadmap/research.md#system-family-surveys) (inference) | Sega Retro |
| Design Master Denshi Mangajuku | Bandai | JP 1995-03-03 | — | — |
| R-Zone | Tiger | 1995 | — | — |
| Nomad | Sega of America | NA 1995-10 | [R1-22](../../roadmap/research.md#system-family-surveys) (inference) | Sega Retro |
| Game.com (Pocket Pro) | Tiger | NA 1997-09-12 | — | — |
| Game Boy Color | Nintendo | JP 1998-10-21; NA 1998-11-18; EU 1998-11-23 | [R1-10](../../roadmap/research.md#system-family-surveys) | Pan Docs |
| Neo Geo Pocket; Color; New Color | SNK | JP 1998-10-28; Color NA 1999-08-06 | — | NgpCraft |
| WonderSwan; Color; SwanCrystal | Bandai | JP 1999-03-04; 2000-12-09; 2002-07-12 | — | WSdev wiki |
| Pocket Challenge V2 | Benesse, with Koto | JP 2002 | — | WSdev wiki |
| Cybiko | Cybiko Inc. | NA 2000-04 | — | — |
| Pokémon Mini | Nintendo; The Pokémon Company | NA 2001-11-16; JP 2001-12-14 | — | — |

Hardware:

| System | CPU | Display | Audio | Firmware or lock-out |
|---|---|---|---|---|
| Microvision | Intel 8021 or TI TMS1100 in cartridge | 16 × 16 LCD | piezo | none; mask ROM per game |
| Game & Watch | Sharp SM5xx | segment LCD | melody ROM in some MCUs | ROM in the MCU, per game |
| Select-A-Game | in each cartridge; HD38800 in one | 7 × 16 VFD | not stated | none |
| Adventure Vision | Intel 8048, 733 kHz | 150 × 40 LEDs, spun mirror | NS COP411L | ROMs in both chips |
| Game Pocket Computer | NEC µPD78C06, 6 MHz | 75 × 64 | 1 channel | built-in software |
| Game Boy | Sharp SM83 core; 4.194304 MHz master | 160 × 144, 4 shades | 4 channels | boot ROM with logo check |
| Lynx | VL65NC02 (Lynx I), up to 4 MHz | 160 × 102, blitter | 4 channels | 512-byte boot ROM |
| Game Gear | Z80A, 3.58 MHz | 160 × 144 of 160 × 146 | SN76489 | none, then a header BIOS |
| TurboExpress | HuC6280, 7.16 MHz | 336 × 221 colour dots | 6 wavetable channels | not stated; HuCard pins |
| Gamate | 6502-based UMC or NCR chip | 160 × 152, 4 greys | GI AY-3-8910 | 2 KiB, listed as ROM on a RAM part |
| Game Master | NEC µPD7810 | 61 × 64 | 1-bit | not stated |
| Supervision | 65C02 or 65SC02, 4 MHz | 160 × 160, frame buffer | 2 tone, noise, DMA | not stated |
| Mega Duck | Sharp SM83, 4.194304 MHz master | 160 × 144 | 4 channels | not stated |
| Design Master | Hitachi H8/3334, 7.63 MHz | 160 × 150, touch | not stated | not stated |
| Nomad | 68000 | colour LCD and AV out | Mega Drive | regional lock-out |
| Game.com | Sharp SM8521, 10 MHz | 200 × 160, touch | 2 wave, noise, PCM | built-in Solitaire, system software |
| Game Boy Color | Sharp SM83 core, up to 8.388608 MHz | 160 × 144, 15-bit colour | 4 channels | boot ROM, half-logo |
| Neo Geo Pocket | Toshiba TLCS-900/H, 6.144 MHz; Z80 | 160 × 152 | T6W28 and DACs | 64 KiB BIOS ROM |
| WonderSwan | NEC V30MZ, 3.072 MHz | 224 × 144 | 4 PCM channels | boot ROM; handshake |
| Pocket Challenge V2 | NEC V30MZ | not checked | not checked | not checked |
| Cybiko | Hitachi H8S/2241, 11.0592 MHz; AT90S2313 | 160 × 100 | not stated | 512 KiB flash ROM |
| Pokémon Mini | Epson S1C88, 4 MHz | 96 × 64 | a speaker | 4 KiB BIOS ROM |

- The Game Boy's boot ROM shows the logo from the cartridge header, compares it with its own copy,
  and checks the header checksum: "If either of these checks fail, the boot ROM locks up,
  and control is never passed to the cartridge ROM."
  (Pan Docs, ["Power Up Sequence"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/Power_Up_Sequence.md);
  emphasis dropped).
  The Game Boy Color's boot ROM checks only the top half of the logo
  (Pan Docs, ["The Cartridge Header"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/The_Cartridge_Header.md)).
  The logo's bytes are firmware and game data and are not recorded here.
- Wikipedia names the Game Boy's processor the Sharp SM83,
  and Pan Docs calls it a Sharp CPU "speculated to be" an SM83 core; 4.194304 MHz is the master clock,
  of which the system clock is a quarter
  (Pan Docs, ["Specifications"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/Specifications.md)).
- The first Game Gear has no BIOS, and later revisions have one
  (SMS Power, ["BIOS"](https://www.smspower.org/Development/BIOS)).
  Those later Game Gears also refuse software without a valid header
  (SMS Power, ["ROM Header"](https://www.smspower.org/Development/ROMHeader)), which begins `TMR SEGA`.
- When the BIOS arrived, and where it looks for the header, are given only on SMS Power's "BIOSes" page,
  which carries BIOS disassembly listings and attaches BIOS images; the register closes it, so it is not linked,
  and those details are not recorded.
  - SMS Power's BIOS-replacement page is closed too, as replacement system software, and is not linked.
  - Its hosted Game Gear service manual is maker material hosted by others,
    closed by [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md); it was not opened.
- The panel is 160 × 146 dots, and Master System mode scales 240 of each line's 256 pixels three to two
  (SMS Power, ["Game Gear LCD"](https://www.smspower.org/Development/GGLCD)).
- Sega's own hardware history page gives the Game Gear's processor as "Z80A(3.58MHz)", its display as 480 × 146 dots,
  and its release as 1990-10-06
  ([Sega, "ゲームギア"](https://web.archive.org/web/20261007070751/https://www.sega.jp/history/hard/gamegear/),
  specification table).
  This settles the 3.5 MHz of Wikipedia's
  ["Game Gear"](https://en.wikipedia.org/w/index.php?title=Game_Gear&oldid=1377875769) against the 3.579545 MHz of
  [Sega Retro](https://segaretro.org/Game_Gear) in favour of the 3.58 MHz rounding; the exact rate is not on Sega's
  page.
  The 480 dots are three times SMS Power's 160 (inference: the colour sub-pixels counted separately).
  Japanese Wikipedia gives the same "Z80A（3.58MHz）", citing the same page
  (["ゲームギア"](https://ja.wikipedia.org/w/index.php?title=%E3%82%B2%E3%83%BC%E3%83%A0%E3%82%AE%E3%82%A2&oldid=111465393),
  specifications).
- WonderSwan models use three versions of one system chip
  (WSdev wiki, ["SoC"](https://ws.nesdev.org/w/index.php?title=SoC&oldid=752)).
  A cartridge must complete a handshake with it,
  and "The boot ROM will refuse to boot the cartridge if this bit is not set; on the WonderSwan Color,
  it will refuse to start the system at all."
  (WSdev wiki, ["Cartridge connector"](https://ws.nesdev.org/w/index.php?title=Cartridge_connector&oldid=471)).
  By default its display runs at about 75.47 Hz from 159 lines of 256 cycles of the 3.072 MHz clock
  (WSdev wiki, ["Timing"](https://ws.nesdev.org/w/index.php?title=Timing&oldid=645)).
- Benesse's Pocket Challenge V2, an educational device sold through its correspondence courses,
  was released in 2002 with an NEC V30 MZ processor (Japanese Wikipedia,
  ["ポケットチャレンジ"](https://ja.wikipedia.org/w/index.php?title=%E3%83%9D%E3%82%B1%E3%83%83%E3%83%88%E3%83%81%E3%83%A3%E3%83%AC%E3%83%B3%E3%82%B8&oldid=107760478),
  infobox, citing a capture of Koto's products page, which was not read).
  The Japanese "WonderSwan" article says it appears to be a WonderSwan OEM made with Koto,
  and that its cartridges run on a WonderSwan
  (["ワンダースワン"](https://ja.wikipedia.org/w/index.php?title=%E3%83%AF%E3%83%B3%E3%83%80%E3%83%BC%E3%82%B9%E3%83%AF%E3%83%B3&oldid=111759139);
  the paraphrase is the note's).
  The WSdev wiki has no page of its own on it, but its pages on the mapper, keypad, boot ROM,
  and internal EEPROM cover it (the wiki's own search, 2026-11-20), so it keeps that hub.
- The Lynx's Mikey chip holds the processor, sound, and "512 bytes of bootstrap and game-card loading ROM",
  and Suzy is a blitter with sprite scaling
  (Wikipedia, ["Atari Lynx"](https://en.wikipedia.org/w/index.php?title=Atari_Lynx&oldid=1385284173)).
  How the boot stage checks a cartridge would come from analysis of that ROM (inference),
  so it is not sought or recorded (the research guide's [constants convention](../README.md#constants-and-tables)).
  A family survey can record how emulators deal with such checks, for example by starting from a post-boot state.
- The TurboExpress's English infobox gives "336×221 pixels", and an uncited list gives 400 × 270
  (Wikipedia, ["TurboExpress"](https://en.wikipedia.org/w/index.php?title=TurboExpress&oldid=1352943257)).
  The Japanese article gives "336×221=74,256画素（RGBを別カウントした数値）", picture elements counting R, G,
  and B separately
  (["PCエンジンGT"](https://ja.wikipedia.org/w/index.php?title=PC%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%B3GT&oldid=110948000),
  specifications; the translation is the note's).
  The English infobox gives the same figure without saying so, and that the two agree is an inference.
  Both English values are uncited; the 400 × 270 is dropped because neither other figure supports it,
  and the panel's count in whole pixels is not stated.
- The English article also lists two HuC6270A video chips, the SuperGrafx's pair (inference),
  so it is not cited for video values.
  Its LT model's date is from
  ["TurboGrafx-16"](https://en.wikipedia.org/w/index.php?title=TurboGrafx-16&oldid=1384843861), where HuCards' reversed
  pins act as a regional lock-out.
- The Neo Geo Pocket's specification table carries an unreferenced-section banner dated July 2025
  (Wikipedia, ["Neo Geo Pocket"](https://en.wikipedia.org/w/index.php?title=Neo_Geo_Pocket&oldid=1367573321)).
  [NgpCraft](https://github.com/tixul/NgpCraft_dev_ref), a developer reference under the MIT licence,
  is the only Neo Geo Pocket hub that the research agents' web searches
  and [R0-05](R0-05-source-map.md)'s tables turned up
  (research log); it states no origin for its facts and no rule on leaked material (its README and licence file).
- The Palmtex and R-Zone cartridges each hold the processor and the screen, the Digi Casse's the screen
  (Wikipedia, articles on each).
  For the R-Zone: "The R-Zone has no microprocessor or memory.
  Those components are contained in a microcontroller inside the game cartridge"
  (Wikipedia, ["R-Zone"](https://en.wikipedia.org/w/index.php?title=R-Zone&oldid=1353050445)).
  Tiger's patent, which the article cites,
  says "the microprocessor 42 and image screen 31 are mounted in the cassette 28", and names no type
  ([US 5,683,297](https://patents.google.com/patent/US5683297A/en), description of a preferred embodiment).
- Select-A-Game cartridges carry the processor too.
  The [Handheld Museum](https://www.handheldmuseum.com/Entex/SAG.htm) gives one type, "CPU: Space Invader 2 cartridge:
  Hitachi HD38800-A31", and says each game's processor is in its cartridge;
  the other five cartridges' types are not on the page,
  and its photograph of the console's inside shows the display and controls, with no processor (observed).
  Its scans of maker manuals are closed and were not opened.
- The Gamate's article gives no release date, only a lifespan of 1990 to 1994,
  and lists its 2 KiB "ROM" on a part it names as a static RAM
  (Wikipedia, ["Gamate"](https://en.wikipedia.org/w/index.php?title=Gamate&oldid=1361186075)).
  The Game.com has Solitaire built in, and the Cybiko a 512 KiB flash ROM and a second, Atmel processor
  (Wikipedia, ["Game.com"](https://en.wikipedia.org/w/index.php?title=Game.com&oldid=1376576838);
  ["Cybiko"](https://en.wikipedia.org/w/index.php?title=Cybiko&oldid=1364470227)).
- The Mega Duck uses a Game Boy processor and sound; all its games but the pack-in were made by one developer,
  Thin Chen Enterprise, under two brand names, and later re-released for the Game Boy without Nintendo's licence
  (Wikipedia, ["Mega Duck"](https://en.wikipedia.org/w/index.php?title=Mega_Duck&oldid=1358166547)).

### Boundary cases

The placement rule, a process call settled in this note:

- A system that has a survey goes by the roadmap: "An era holds the systems whose family survey depends on its primer",
  and "Where a survey depends on more than one primer, each of its systems belongs to the era of its own generation"
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers)).
  The Game Boy Color stays here by the first sentence, because its survey, R1-10, depends on R1-01 alone.
  An add-on or model is folded into the row of the machine it extends.
- A device without a survey goes by its first sale:
  up to 2000 in [R1-06](R1-06-catalogue-32-and-64-bit.md) for the fifth-generation consoles and the 32-bit handhelds,
  from 2001 to 21 November 2005 in [R1-07](R1-07-catalogue-sixth-generation.md),
  and later in [R1-08](R1-08-catalogue-modern.md).
  The cut-off is the day before the Xbox 360's first sale, in North America on 22 November 2005
  (Wikipedia, ["Xbox 360"](https://en.wikipedia.org/w/index.php?title=Xbox_360&oldid=1386323476), infobox);
  the reworked drafts of R1-06, R1-07, and R1-08 of 2026-11-20 state the same ranges.
  The 8-bit and 16-bit handhelds first sold up to 2000 stay here.
- A home console up to 2000 with no survey goes by Wikipedia's generation field.
  Where an infobox and a category disagree, word size breaks the tie.
- A device that a neighbouring catalogue leaves to this note stays here, with its placement flagged,
  so that no device goes unlisted: the reworked R1-07 lists the Pokémon Mini and Cybiko as "not here:
  R1-05" and keeps devices where this note places them.
  The Pocket Challenge V2 of 2002 stays with the WonderSwan line, as a likely OEM model of it (see "Handhelds").

| System | Word-size rule | Wikipedia generation | Placed in |
|---|---|---|---|
| Game Boy Color | 8-bit | fifth | R1-05, with its survey [R1-10](../../roadmap/research.md#system-family-surveys) |
| Neo Geo Pocket | 16-bit core ("16/32-bit" in a table) | fifth | R1-05: 16-bit handheld of 1998 |
| WonderSwan line | 16-bit | sixth | R1-05: 16-bit handheld of 1999 |
| Game.com | 8-bit | fifth | R1-05: 8-bit handheld of 1997 |
| Pocket Challenge V2 | 16-bit (V30MZ) | none; first sold 2002 | R1-05, with the WonderSwan line; flagged |
| Cybiko | "32-bit" in a press title; H8S | sixth | R1-05, left here by R1-07; flagged for R1-06 |
| Pokémon Mini | 8-bit | sixth | R1-05, left here by R1-07; first sold 2001, flagged |
| Nomad; Mega Jet | 16-bit | fifth (Nomad); none (Mega Jet) | R1-05: Genesis models, [R1-22](../../roadmap/research.md#system-family-surveys) |
| 32X | 32-bit | fifth | R1-05: Genesis add-on; cross-reference in [R1-06](R1-06-catalogue-32-and-64-bit.md) |
| Super A'Can | 16-bit | fifth; category fourth | R1-05: word size breaks the tie |
| CPS Changer | 16-bit | fourth by category | R1-05 |
| CD-i | 32-bit registers, 16-bit bus | fourth | R1-05 |
| Videopac+ G7400 | 8-bit | third | R1-05 |
| Virtual Boy | 32-bit | fifth | [R1-06](R1-06-catalogue-32-and-64-bit.md) |
| Playdia | 8-bit | fifth | [R1-06](R1-06-catalogue-32-and-64-bit.md), by generation |
| Amiga CD32; PC-FX | 32-bit | fifth | [R1-06](R1-06-catalogue-32-and-64-bit.md) |
| FM Towns Marty | 32-bit inside, 16-bit bus | fifth; category fourth | [R1-06](R1-06-catalogue-32-and-64-bit.md): word size breaks the tie |
| GameKing | 8-bit | sixth | [R1-07](R1-07-catalogue-sixth-generation.md): first sold 2003 or 2004 |
| Dreamcast VMU | 8-bit | none | [R1-07](R1-07-catalogue-sixth-generation.md), with the Dreamcast |

- The sources for each placement are the system's Wikipedia article, its `generation` field read raw,
  and the roadmap's survey dependencies.
  Exceptions: the Mega Jet has no article of its own
  (it redirects to ["Genesis Nomad"](https://en.wikipedia.org/w/index.php?title=Genesis_Nomad&oldid=1383503066)),
  and the CPS Changer's article, ["CP System"](https://en.wikipedia.org/w/index.php?title=CP_System&oldid=1385997383),
  has no generation field, only a fourth-generation category;
  the Super A'Can's and FM Towns Marty's infoboxes say fifth while their categories say fourth.
- The CD-i's register widths are from memory.
  The Cybiko's article gives a sixth-generation field and category and an H8S processor,
  and the list of handhelds cites an IGN article titled "New 32-bit Handheld System on the Block"
  (["Cybiko"](https://en.wikipedia.org/w/index.php?title=Cybiko&oldid=1364470227), infobox;
  ["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_handheld_game_consoles&oldid=1384273411),
  Cybiko row; the IGN article was not read).
  By that title the rule would send it to R1-06, which does not list it; it stays here, flagged, until R1-06 takes it.
  That the H8S has a 16-bit ALU with 32-bit registers is from memory.
- The Dreamcast VMU is a memory card that runs small games
  (Wikipedia, ["VMU"](https://en.wikipedia.org/w/index.php?title=VMU&oldid=1379027676))
  and is listed with the Dreamcast.
  The GameKing of 2003 or 2004 (the two articles differ) is an 8-bit cartridge handheld sold in the sixth generation
  (Wikipedia, ["GameKing"](https://en.wikipedia.org/w/index.php?title=GameKing&oldid=1353051015);
  ["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_handheld_game_consoles&oldid=1384273411)).
  The Pokémon Mini (NA 2001-11-16, JP 2001-12-14) is an 8-bit S1C88 handheld with a 4 KiB BIOS ROM
  (Wikipedia, ["Pokémon Mini"](https://en.wikipedia.org/w/index.php?title=Pok%C3%A9mon_Mini&oldid=1384550005),
  infobox and "Design and specifications"); by first sale it belongs to [R1-07](R1-07-catalogue-sixth-generation.md),
  which leaves it here.

### Patterns across the catalogue

- Processor families recur.
  The 6502 family runs the 2600, 5200, 7800, NES, CreatiVision, Lynx, Supervision, and Gamate;
  the PC Engine's HuC6280 and the Super Famicom's 65C816 descend from it
  (from memory: neither system's article says so).
- The Z80 runs the Astrocade, ColecoVision, SG-1000, Master System, Game Gear, PV-1000, Socrates, GX4000,
  and the Zemmix line, and the sound side of the Mega Drive, Neo Geo, and Neo Geo Pocket.
  The 68000 runs the Mega Drive, Mega CD, Neo Geo, CDTV, Sega Pico, CPS Changer, and Super A'Can.
- Sharp's SM83 runs the Game Boy, Game Boy Color, and Mega Duck
  (each system's row and its source; the grouping is the note's).
- Sound chips recur: the SN76489 in the CreatiVision, ColecoVision, SG-1000, Master System, Game Gear, Sega Pico,
  and Mega Drive, where it sits in the video chip
  (rows above; ["Master System"](https://en.wikipedia.org/w/index.php?title=Master_System&oldid=1386607587) and
  ["Sega Genesis"](https://en.wikipedia.org/w/index.php?title=Sega_Genesis&oldid=1386540687), infoboxes).
  General Instrument's AY-3-891x family is in the Intellivision, Super Vision 8000, My Vision, Vectrex, Gamate,
  and GX4000 (rows above).
- Signetics' 2650 runs two families of rebadged consoles,
  the VC 4000 group with 25 named variants of "identical computational hardware" whose cartridge slots differ,
  so cartridges do not always interchange, and the Arcadia 2001 group with 38 (Wikipedia,
  ["1292 Advanced Programmable Video System"](https://en.wikipedia.org/w/index.php?title=1292_Advanced_Programmable_Video_System&oldid=1370109834);
  ["Arcadia 2001"](https://en.wikipedia.org/w/index.php?title=Arcadia_2001&oldid=1352938983); variants counted from the
  raw tables).
- Nine systems put the processor, the game chip, or the screen in each cartridge: the Telstar Arcade, PC-50x,
  Cassette Vision, TV Boy, Microvision, Select-A-Game, Palmtex unit, Digi Casse, and R-Zone (rows above).
  For these, a dump of a "cartridge" is a microcontroller's mask ROM or no data at all (inference).
- About 40 rows name built-in code in their firmware cell,
  counting a console and its add-ons separately and leaving out code that is the game itself, as on the Microvision
  (counted from the rows above).
  Whether each can be emulated without its firmware is left to [R1-01](R1-01-primer-8-and-16-bit.md)
  and [R2-12](../../roadmap/research.md#phase-2-cross-cutting-engineering).
- Lock-outs found: the NES and Super Famicom lock-out chips, the Game Boy logo check,
  the export Master System and later Game Gear header check, TMSS, the NTSC 7800's cartridge signature,
  the Disk System's licence check and moulding, the Intellivision II's changed Exec, the TurboGrafx pin reversal,
  the WonderSwan handshake, and the Nomad's regional lock-out (rows and findings above).
- Neo Geo cartridge scrambling of graphics, and on one version sound data,
  is protection of game data rather than a lock-out
  (inference from NeoGeo Development Wiki, ["NEO-CMC"](https://wiki.neogeodev.org/index.php?title=NEO-CMC)).
  None was found for the other second-generation consoles, by a search of each article for "lock-out", "lockout",
  "lock out", "copy protect", "authentication", "security chip", "header", and "signature".

### Coverage of sources

- An open-tier hub other than Wikipedia covers the NES family
  ([NESdev wiki](https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433)),
  the Super Famicom and its add-ons ([SNESdev wiki](https://snes.nesdev.org/w/index.php?title=Timing&oldid=1467),
  [fullsnes](https://web.archive.org/web/20261105224518/https://problemkaputt.de/fullsnes.htm)), the Game Boy family
  ([Pan Docs](https://github.com/gbdev/pandocs/blob/f7f7b064/src/Specifications.md)),
  the SG-1000, Master System, and Game Gear
  ([SMS Power](https://www.smspower.org/Development/ClockRate)),
  the Mega Drive and Mega CD ([Plutiedev](https://plutiedev.com/rom-header);
  [Sega Retro](https://segaretro.org/Sega_Mega_Drive/Technical_specifications)'s articles), the Neo Geo
  ([NeoGeo Development Wiki](https://wiki.neogeodev.org/index.php?title=Clock)),
  the WonderSwan ([WSdev wiki](https://ws.nesdev.org/w/index.php?title=SoC&oldid=752)),
  and the Neo Geo Pocket ([NgpCraft](https://github.com/tixul/NgpCraft_dev_ref)).
  Their tiers and evaluations are in [R0-05](R0-05-source-map.md)
  and the [register](../../../.claude/hooks/source-register.txt).
- Beyond Wikipedia, the other rows draw on:
  - patents for the Odyssey, Channel F, 2600, 5200, NES, and R-Zone;
  - [Sega's hardware history page](https://web.archive.org/web/20261007070751/https://www.sega.jp/history/hard/gamegear/)
    for the Game Gear's clock;
  - [*Television Digest*](https://www.worldradiohistory.com/Archive-TV-Digest/70s/1978/TV-Digest-1978-09.pdf)
    for the Odyssey 2's first shipments;
  - the [Handheld Museum](https://www.handheldmuseum.com/Entex/SAG.htm) for one Select-A-Game processor;
  - Japanese Wikipedia for the My Vision, TurboExpress, and Pocket Challenge V2;
  - board photographs for the Video Art and BBC Bridge Companion.
- Every other value rests on Wikipedia alone: every first- and second-generation console apart from those sources;
  every third- and fourth-generation console except the NES, Master System, SG-1000, Mega Drive, Super Famicom,
  and Neo Geo families; the PC Engine add-ons, the 32X, and the Family Computer Network System; and 17 handhelds
  (counted from the rows above).
- Sega Retro's technical pages for the Master System, Mega Drive, Mega CD, and 32X
  ([Master System](https://segaretro.org/Sega_Master_System/Technical_specifications),
  [Mega Drive](https://segaretro.org/Sega_Mega_Drive/Technical_specifications),
  [Mega-CD](https://segaretro.org/Sega_Mega-CD/Technical_specifications),
  [32X](https://segaretro.org/Sega_32X/Technical_specifications)) cite Sega manuals hosted on Sega Retro,
  which the register closes; their figures need an open source before a note relies on them (citations read raw).
  Sega Retro served a bot check to the rework's scripted requests
  (research log),
  so the rework did not re-read them; a later scripted request on the same date returned the 32X page (observed).
- Community sites were found for the Intellivision, Channel F, Astrocade, Atari 7800, CD-i, and Pokémon Mini,
  and their prose pages were read, but nothing here rests on them (research log).
  - VESWiki, Bally Alley, and icdia are named without links: they host firmware, disassemblies, ROMs,
    or maker documents, which [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) closes,
    and the [register](../../../.claude/hooks/source-register.txt) now closes all three.
  - The Intellivision Wiki, AtariAge, Pong-Story, 20th Century Video Games, 7800.8bitdev.org,
    and pokemon-mini.net are not evaluated, so they are not linked or cited;
    their evaluation goes to the family surveys recommended below
    and to [R1-25](../../roadmap/research.md#system-family-surveys),
    and pokemon-mini.net's to [R1-07](R1-07-catalogue-sixth-generation.md) with the Pokémon Mini.
- Of the chip makers' successors that answered a probe on 2026-11-20,
  only Renesas still serves a datasheet for a part in these rows; Microchip refused scripted requests.
  - Renesas's [CDP1802A product page](https://www.renesas.com/en/products/cdp1802a) shows the part as "Active"
    and links the CDP1802AC/3 datasheet, served as a PDF; the datasheet was not read for this note.
  - Renesas has no page for the CDP1861 (HTTP 404 at `renesas.com/en/products/cdp1861`).
  - Texas Instruments has no product page for the SN76489, SN76489AN, or TMS9918A (HTTP 404 at `ti.com/product/<part>`).
  - NXP has no part page for the Signetics 2650 (HTTP 404 at `nxp.com/part/SCN2650`).
  - onsemi redirects the Fairchild F8 3850's part address, `onsemi.com/products/F3850`, to its general products page.
  - Microchip refused the request for the General Instrument AY-3-8910
    (HTTP 403 at `microchip.com/en-us/product/AY-3-8910`; research log),
    and a web search limited to `microchip.com` on 2026-11-20 returned no page for the part,
    so no Microchip-hosted datasheet was found.
  - General Instrument's spin-off of Microchip is from
    ["General Instrument AY-3-8910"](https://en.wikipedia.org/w/index.php?title=General_Instrument_AY-3-8910&oldid=1375275795);
    the other successions (Intersil to Renesas, Signetics to NXP, Fairchild to onsemi) are from memory.
- No maker datasheet was found for the other chips in the rows above, among them the CP1610, the 2650,
  the TIA and its successors, the 8048 and 8244, and the TMS9918 family (research log, and the probes above).
  [R0-05](R0-05-source-map.md) found no maker-hosted manual with a readable notice for the Z80, 6502, and NEC parts,
  though it records a maker-served 65C816 datasheet
  (["Processor and chip makers' manuals"](R0-05-source-map.md#processor-and-chip-makers-manuals)).
- Processor test sets in the register cover the 6502 family, Z80, 68000, SM83, HuC6280, SPC700, and 8086 family;
  a TLCS-900/H set exists, closed for want of a licence, with its results usable.
  None was found for the F8, 1802, CP1610, 8048, 2650, 6800, 6809, or SM8521
  (register; [R0-05](R0-05-source-map.md),
  ["Test suites and test vectors"](R0-05-source-map.md#test-suites-and-test-vectors)).

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study, or limit study to the systems the surveys name and keep the rest as rows.
- **Costs:** every row means about 100 studies;
  about 70 rows name no survey and 7 more name [R1-25](../../roadmap/research.md#system-family-surveys) only by
  inference, most resting on Wikipedia (counted from the rows above).
  Surveys only leaves out every first- and second-generation console and most third- and fourth-generation
  and handheld rows, among them the Atari, NEC, SNK, and Bandai machines.
- **Gains:** every row studied gives the widest choice for [R6-01](../../roadmap/research.md#phase-6-synthesis);
  surveys only keeps the research finite.
- **Used by:** the [roadmap](../../roadmap/research.md#system-family-surveys) today, whose surveys for this era
  (those that depend on [R1-01](R1-01-primer-8-and-16-bit.md)) name Nintendo, Sega, arcade, and "other" families only.

### One target per chip family, or one per model

- **What:** treat a clone family (AY-3-8500 rebadges, VC 4000 variants, Arcadia variants, famiclones) as one target,
  or treat each model with its own timing as a target.
- **Costs:** one per family misses clones with their own clocks, such as the Dendy;
  one per model multiplies work for machines whose differences are cases and labels.
- **Gains:** one per family matches how the hardware was shared; one per model matches what a user owns.
- **Used by:** the [NESdev wiki](https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433),
  which gives clone clocks their own columns.

### Family surveys for some of the systems no survey names

- **What:** leave every unnamed console and handheld to [R1-25](../../roadmap/research.md#system-family-surveys),
  or add family surveys for Atari, NEC, SNK, and Bandai and leave the rest there.
- **Costs:** [R1-25](../../roadmap/research.md#system-family-surveys) alone mixes home computers with whole console
  families; new surveys add roadmap items.
- **Gains:** R1-25 alone keeps the roadmap short; family surveys give the PC Engine, Lynx, Neo Geo,
  and WonderSwan lines a study of their own.
- **Used by:** the [roadmap](../../roadmap/research.md#system-family-surveys),
  whose R1-25 covers "the systems that no other survey names".

### How a boundary system is placed

- **What:** place each system by processor word size, by Wikipedia's generation, or by the survey that covers it.
- **Costs:** word size splits the 32X from its host; generation moves the Game Boy Color out of its survey's primer;
  survey placement leaves unsurveyed systems without a rule.
- **Gains:** word size predicts the processor work; generation matches Wikipedia's generation articles;
  survey placement matches the roadmap's dependencies.
- **Used by:** this catalogue, which applies them in the order "Boundary cases" sets out, after first sale.
  The [roadmap](../../roadmap/research.md#hardware-primers) sets the rule for systems with a survey.

### Sources for systems with Wikipedia alone

- **What:** accept Wikipedia's figures for catalogue rows, seek maker documents and patents for each chip,
  or measure on hardware.
- **Costs:** Wikipedia contradicted itself on four rows
  (the Studio II clock, the Odyssey 2 date, the Channel F part numbers, the TurboExpress display);
  maker documents were not found for most chips; measurement needs hardware.
- **Gains:** Wikipedia is complete enough for a catalogue; maker documents and tests are what a study can rely on.
- **Used by:** this catalogue, for identification and catalogue-level hardware values; no study relies on them.

### Recommendation

- **Study:** study only the systems that have a family survey, counting the four surveys recommended next,
  and keep the other rows as catalogue entries that [R6-01](../../roadmap/research.md#phase-6-synthesis) can pull in.
  Most rows beyond the surveys rest on Wikipedia alone, so a study of each would have no source it could rely on.
- **Targets:** one target per chip family, with a model as its own target where a source records its own timing,
  such as the Dendy's divide-by-15 clock
  ([NESdev wiki](https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433)).
  The VC 4000 group's variants share "identical computational hardware" and differ in cartridge slot,
  while the sources give clone clocks their own columns; the AY-3-8500's PAL and NTSC parts are two targets.
- **Surveys:** add four family surveys: Atari (2600, 5200, 7800, Lynx); NEC
  (PC Engine, SuperGrafx, CD-ROM², TurboExpress);
  SNK (Neo Geo AES and CD, Neo Geo Pocket,
  with the MVS left to [R1-24](../../roadmap/research.md#system-family-surveys)); and Bandai
  (the WonderSwan line, with the Pocket Challenge V2).
  Leave the other unnamed systems to [R1-25](../../roadmap/research.md#system-family-surveys),
  as the roadmap's wording already does: among them the SG-1000, CD-i, Sega Pico, LaserActive, Super A'Can,
  the other Z80 and 6502 machines, the Mega Duck, and the first- and second-generation consoles.
  - The reason: these four are the largest console families with no survey,
    14 rows with an open-tier hub or a processor test set behind them
    (Atari 4, NEC 5, SNK 3, Bandai 2; counted from the rows above).
    About 15 other such rows are scattered single systems,
    which R1-25 can take without mixing whole families into a survey of home computers.
  - The cost is four new roadmap items in phase 1.
- **Boundaries:** none needed from the owner: the rule in "Boundary cases" is a process call,
  settled in this note and listed in the pull request.
- **Sources:** use Wikipedia for catalogue rows only, read raw and pinned to a revision,
  and rest a study on a maker document, an expired patent, an open-tier hub, or a test on hardware the project owns.
  Of Wikipedia's four internal conflicts, a patent settled the Channel F and a trade newsletter the Odyssey 2;
  Japanese Wikipedia settled the TurboExpress, and the Studio II rests on the cited figure (secondary).
  Sega's page settled the Game Gear, a conflict between Wikipedia and Sega Retro.
  In the Studio II, Odyssey 2, and TurboExpress cases the value dropped was uncited.
  Maker documents hosted by others stay closed,
  as [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) already rules,
  and the [register](../../../.claude/hooks/source-register.txt) already lists patents as open maker material.

## Implications for Rustalgia

- [R6-01](../../roadmap/research.md#phase-6-synthesis) proposes which rows Rustalgia emulates,
  and the choice is the owner's; the catalogue's survey column shows
  which rows will have an emulator survey behind them.
- About 40 rows name built-in firmware that the project may not obtain
  ([ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md); [R0-02](R0-02-legal-baseline.md),
  ["Firmware, keys, and game copies"](R0-02-legal-baseline.md#firmware-keys-and-game-copies)).
  Whether each can run without it, from its post-boot state or a replacement,
  feeds [R2-12](../../roadmap/research.md#phase-2-cross-cutting-engineering) and,
  through [R6-03](../../roadmap/research.md#phase-6-synthesis), any ADR on firmware (inference).
- Lock-outs differ in kind, from a header string to a signature or a challenge in a chip.
  [R0-02](R0-02-legal-baseline.md) records that no § 1201 decision on a cartridge-era lock-out was found,
  and that Sega v Accolade and Atari v Nintendo addressed such lock-outs under copyright and trade mark law.
  A family survey can record how emulators handle them.
- The sources record clone and regional timing variants separately, so each is its own target (inference);
  this feeds the system scope proposal and the quality targets ([R6-02](../../roadmap/research.md#phase-6-synthesis)).
- Systems that rest on Wikipedia alone need a better source before a study relies on them;
  this feeds [R1-25](../../roadmap/research.md#system-family-surveys) and the four surveys recommended above,
  if the owner adds them.

## Open questions

- Does the BBC Bridge Companion make sound, and through which part?
  Its article names none, and its board photograph shows no sound chip on the side shown; the other side of the board,
  or a reader session on the walled MiSTer core's documentation,
  in [R1-25](../../roadmap/research.md#system-family-surveys).
- What is the LJN Video Art's sound source, and what is its Thomson TSGB01019ACP?
  The board photographs' uploader could not identify that part; its markings in a Thomson data book,
  or a reader session on MAME's prose documentation, in [R1-25](../../roadmap/research.md#system-family-surveys).
- What processors are in the other five Select-A-Game cartridges, and in the Palmtex and R-Zone cartridges?
  No page read names a type, and the [Handheld Museum](https://www.handheldmuseum.com/Entex/SAG.htm)'s photograph of the
  Select-A-Game's inside shows only the console, which holds none; chip markings on photographs of opened cartridges, in
  [R1-25](../../roadmap/research.md#system-family-surveys).
- What processor does the Digi Casse use?
  Its article's fields are empty, and none of the pages it cites that were read names one:
  the [Handheld Museum page](https://www.handheldmuseum.com/Bandai/DigiCasseA.htm),
  and the Pad and Pixel and Game Medium pages, which are unregistered and were read as prose only
  (research log); board inspection, in [R1-25](../../roadmap/research.md#system-family-surveys).

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext through `action=raw`; each link opens the revision read,
whose ID follows it.

Wikipedia, first and second generation:

- ["First generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=First_generation_of_video_game_consoles&oldid=1383362694)
  1383362694;
  ["Second generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Second_generation_of_video_game_consoles&oldid=1386367484)
  1386367484;
  ["List of first generation home video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_first_generation_home_video_game_consoles&oldid=1386346200)
  1386346200;
  ["List of home video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_home_video_game_consoles&oldid=1386685039)
  1386685039.
- ["Magnavox Odyssey"](https://en.wikipedia.org/w/index.php?title=Magnavox_Odyssey&oldid=1385452685) 1385452685;
  ["Odyssey series"](https://en.wikipedia.org/w/index.php?title=Odyssey_series&oldid=1381540098) 1381540098;
  ["Pong"](https://en.wikipedia.org/w/index.php?title=Pong&oldid=1386429289) 1386429289;
  ["Coleco Telstar series"](https://en.wikipedia.org/w/index.php?title=Coleco_Telstar_series&oldid=1384754340)
  1384754340;
  ["Coleco Telstar Arcade"](https://en.wikipedia.org/w/index.php?title=Coleco_Telstar_Arcade&oldid=1386273222)
  1386273222; ["Color TV-Game"](https://en.wikipedia.org/w/index.php?title=Color_TV-Game&oldid=1384325574) 1384325574;
  ["TV Tennis Electrotennis"](https://en.wikipedia.org/w/index.php?title=TV_Tennis_Electrotennis&oldid=1382481043)
  1382481043.
- ["AY-3-8500"](https://en.wikipedia.org/w/index.php?title=AY-3-8500&oldid=1355333866) 1355333866;
  ["Interton Video 2000"](https://en.wikipedia.org/w/index.php?title=Interton_Video_2000&oldid=1386007626) 1386007626;
  ["PC-50x family"](https://en.wikipedia.org/w/index.php?title=PC-50x_family&oldid=1359169771) 1359169771;
  ["Philips Tele-Game series"](https://en.wikipedia.org/w/index.php?title=Philips_Tele-Game_series&oldid=1376920344)
  1376920344; ["Video Pinball series"](https://en.wikipedia.org/w/index.php?title=Video_Pinball_series&oldid=1372408465)
  1372408465; ["Turnir"](https://en.wikipedia.org/w/index.php?title=Turnir&oldid=1376289238) 1376289238.
- ["Fairchild Channel F"](https://en.wikipedia.org/w/index.php?title=Fairchild_Channel_F&oldid=1385111024) 1385111024;
  ["Fairchild F8"](https://en.wikipedia.org/w/index.php?title=Fairchild_F8&oldid=1364486939) 1364486939;
  ["RCA Studio II"](https://en.wikipedia.org/w/index.php?title=RCA_Studio_II&oldid=1384562059) 1384562059;
  ["RCA CDP1861"](https://en.wikipedia.org/w/index.php?title=RCA_CDP1861&oldid=1356046971) 1356046971;
  ["Atari 2600"](https://en.wikipedia.org/w/index.php?title=Atari_2600&oldid=1386797711) 1386797711;
  ["Atari 2600 hardware"](https://en.wikipedia.org/w/index.php?title=Atari_2600_hardware&oldid=1384141830) 1384141830;
  ["Television Interface Adaptor"](https://en.wikipedia.org/w/index.php?title=Television_Interface_Adaptor&oldid=1386648231)
  1386648231; ["Astrocade"](https://en.wikipedia.org/w/index.php?title=Astrocade&oldid=1386364772) 1386364772.
- ["Interton Video Computer 4000"](https://en.wikipedia.org/w/index.php?title=Interton_Video_Computer_4000&oldid=1353555008)
  1353555008;
  ["1292 Advanced Programmable Video System"](https://en.wikipedia.org/w/index.php?title=1292_Advanced_Programmable_Video_System&oldid=1370109834)
  1370109834; ["APF-MP1000"](https://en.wikipedia.org/w/index.php?title=APF-MP1000&oldid=1337111658) 1337111658;
  ["APF Imagination Machine"](https://en.wikipedia.org/w/index.php?title=APF_Imagination_Machine&oldid=1378543303)
  1378543303;
  ["Unisonic Products Corporation"](https://en.wikipedia.org/w/index.php?title=Unisonic_Products_Corporation&oldid=1359605329)
  1359605329.
- ["Magnavox Odyssey 2"](https://en.wikipedia.org/w/index.php?title=Magnavox_Odyssey_2&oldid=1384362011) 1384362011;
  ["Philips Videopac+ G7400"](https://en.wikipedia.org/w/index.php?title=Philips_Videopac%2B_G7400&oldid=1367076000)
  1367076000;
  ["Bandai Super Vision 8000"](https://en.wikipedia.org/w/index.php?title=Bandai_Super_Vision_8000&oldid=1364164517)
  1364164517; ["Intellivision"](https://en.wikipedia.org/w/index.php?title=Intellivision&oldid=1384387529) 1384387529;
  ["General Instrument CP1600"](https://en.wikipedia.org/w/index.php?title=General_Instrument_CP1600&oldid=1372435639)
  1372435639;
  ["Entertainment Computer System"](https://en.wikipedia.org/w/index.php?title=Entertainment_Computer_System&oldid=1385314431)
  1385314431.
- ["Cassette Vision"](https://en.wikipedia.org/w/index.php?title=Cassette_Vision&oldid=1375473899) 1375473899;
  ["VTech CreatiVision"](https://en.wikipedia.org/w/index.php?title=VTech_CreatiVision&oldid=1383969050) 1383969050;
  ["Arcadia 2001"](https://en.wikipedia.org/w/index.php?title=Arcadia_2001&oldid=1352938983) 1352938983;
  ["ColecoVision"](https://en.wikipedia.org/w/index.php?title=ColecoVision&oldid=1369186567) 1369186567;
  ["Atari 5200"](https://en.wikipedia.org/w/index.php?title=Atari_5200&oldid=1382706947) 1382706947;
  ["Vectrex"](https://en.wikipedia.org/w/index.php?title=Vectrex&oldid=1386579084) 1386579084;
  ["Gakken Compact Vision TV Boy"](https://en.wikipedia.org/w/index.php?title=Gakken_Compact_Vision_TV_Boy&oldid=1352892594)
  1352892594.

Wikipedia, third and fourth generation and add-ons:

- ["Nintendo Entertainment System"](https://en.wikipedia.org/w/index.php?title=Nintendo_Entertainment_System&oldid=1386206850)
  1386206850;
  ["Nintendo Entertainment System models"](https://en.wikipedia.org/w/index.php?title=Nintendo_Entertainment_System_models&oldid=1384562285)
  1384562285; ["Famicom Disk System"](https://en.wikipedia.org/w/index.php?title=Famicom_Disk_System&oldid=1381100509)
  1381100509;
  ["Family Computer Network System"](https://en.wikipedia.org/w/index.php?title=Family_Computer_Network_System&oldid=1386190728)
  1386190728;
  ["Aladdin Deck Enhancer"](https://en.wikipedia.org/w/index.php?title=Aladdin_Deck_Enhancer&oldid=1363131517)
  1363131517; ["Datach"](https://en.wikipedia.org/w/index.php?title=Datach&oldid=1385030981) 1385030981;
  ["Dendy"](https://en.wikipedia.org/w/index.php?title=Dendy&oldid=1370722756) 1370722756.
- ["Master System"](https://en.wikipedia.org/w/index.php?title=Master_System&oldid=1386607587) 1386607587;
  ["SG-1000"](https://en.wikipedia.org/w/index.php?title=SG-1000&oldid=1386011328) 1386011328;
  ["Atari 7800"](https://en.wikipedia.org/w/index.php?title=Atari_7800&oldid=1384315726) 1384315726;
  ["Atari XEGS"](https://en.wikipedia.org/w/index.php?title=Atari_XEGS&oldid=1383793263) 1383793263;
  ["Sega Genesis"](https://en.wikipedia.org/w/index.php?title=Sega_Genesis&oldid=1386540687) 1386540687;
  ["Sega CD"](https://en.wikipedia.org/w/index.php?title=Sega_CD&oldid=1385340710) 1385340710;
  ["32X"](https://en.wikipedia.org/w/index.php?title=32X&oldid=1385340621) 1385340621;
  ["TeraDrive"](https://en.wikipedia.org/w/index.php?title=TeraDrive&oldid=1374925864) 1374925864;
  ["Sega Pico"](https://en.wikipedia.org/w/index.php?title=Sega_Pico&oldid=1379636195) 1379636195.
- ["Super Nintendo Entertainment System"](https://en.wikipedia.org/w/index.php?title=Super_Nintendo_Entertainment_System&oldid=1383614888)
  1383614888; ["Satellaview"](https://en.wikipedia.org/w/index.php?title=Satellaview&oldid=1384890138) 1384890138;
  ["Super Game Boy"](https://en.wikipedia.org/w/index.php?title=Super_Game_Boy&oldid=1384385701) 1384385701;
  ["SuFami Turbo"](https://en.wikipedia.org/w/index.php?title=SuFami_Turbo&oldid=1345812760) 1345812760;
  ["TurboGrafx-16"](https://en.wikipedia.org/w/index.php?title=TurboGrafx-16&oldid=1384843861) 1384843861;
  ["PC Engine SuperGrafx"](https://en.wikipedia.org/w/index.php?title=PC_Engine_SuperGrafx&oldid=1361623105) 1361623105;
  ["TurboDuo"](https://en.wikipedia.org/w/index.php?title=TurboDuo&oldid=1384844068) 1384844068.
- ["Neo Geo"](https://en.wikipedia.org/w/index.php?title=Neo_Geo&oldid=1384602234) 1384602234;
  ["Neo Geo CD"](https://en.wikipedia.org/w/index.php?title=Neo_Geo_CD&oldid=1380573033) 1380573033;
  ["CD-i"](https://en.wikipedia.org/w/index.php?title=CD-i&oldid=1384443552) 1384443552;
  ["CDTV"](https://en.wikipedia.org/w/index.php?title=CDTV&oldid=1370221495) 1370221495;
  ["LaserActive"](https://en.wikipedia.org/w/index.php?title=LaserActive&oldid=1381290213) 1381290213;
  ["Video Information System"](https://en.wikipedia.org/w/index.php?title=Video_Information_System&oldid=1377392993)
  1377392993; ["CP System"](https://en.wikipedia.org/w/index.php?title=CP_System&oldid=1385997383) 1385997383;
  ["Super A'Can"](https://en.wikipedia.org/w/index.php?title=Super_A%27Can&oldid=1378214813) 1378214813.
- ["PV-1000"](https://en.wikipedia.org/w/index.php?title=PV-1000&oldid=1354986519) 1354986519;
  ["Super Cassette Vision"](https://en.wikipedia.org/w/index.php?title=Super_Cassette_Vision&oldid=1380309796)
  1380309796; ["My Vision"](https://en.wikipedia.org/w/index.php?title=My_Vision&oldid=1374699443) 1374699443;
  ["Action Max"](https://en.wikipedia.org/w/index.php?title=Action_Max&oldid=1352940996) 1352940996;
  ["Video Challenger"](https://en.wikipedia.org/w/index.php?title=Video_Challenger&oldid=1353018784) 1353018784;
  ["VTech Socrates"](https://en.wikipedia.org/w/index.php?title=VTech_Socrates&oldid=1385341106) 1385341106;
  ["View-Master Interactive Vision"](https://en.wikipedia.org/w/index.php?title=View-Master_Interactive_Vision&oldid=1384550636)
  1384550636; ["GX4000"](https://en.wikipedia.org/w/index.php?title=GX4000&oldid=1352941564) 1352941564;
  ["Commodore 64 Games System"](https://en.wikipedia.org/w/index.php?title=Commodore_64_Games_System&oldid=1379370511)
  1379370511; ["Zemmix"](https://en.wikipedia.org/w/index.php?title=Zemmix&oldid=1368826364) 1368826364;
  ["Tomy Tutor"](https://en.wikipedia.org/w/index.php?title=Tomy_Tutor&oldid=1370097527) 1370097527;
  ["Dina (console)"](https://en.wikipedia.org/w/index.php?title=Dina_%28console%29&oldid=1353018547) 1353018547;
  ["BBC Bridge Companion"](https://en.wikipedia.org/w/index.php?title=BBC_Bridge_Companion&oldid=1359829232) 1359829232;
  ["LJN Video Art"](https://en.wikipedia.org/w/index.php?title=LJN_Video_Art&oldid=1353018644) 1353018644.
- ["Playdia"](https://en.wikipedia.org/w/index.php?title=Playdia&oldid=1385569273) 1385569273;
  ["Amiga CD32"](https://en.wikipedia.org/w/index.php?title=Amiga_CD32&oldid=1386758766) 1386758766;
  ["FM Towns Marty"](https://en.wikipedia.org/w/index.php?title=FM_Towns_Marty&oldid=1379254432) 1379254432;
  ["PC-FX"](https://en.wikipedia.org/w/index.php?title=PC-FX&oldid=1352943842) 1352943842;
  ["Third generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Third_generation_of_video_game_consoles&oldid=1386211087)
  1386211087;
  ["Fourth generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Fourth_generation_of_video_game_consoles&oldid=1383231353)
  1383231353.

Wikipedia, handhelds:

- ["Microvision"](https://en.wikipedia.org/w/index.php?title=Microvision&oldid=1385146804) 1385146804;
  ["Game Boy"](https://en.wikipedia.org/w/index.php?title=Game_Boy&oldid=1384325969) 1384325969;
  ["Game Boy Color"](https://en.wikipedia.org/w/index.php?title=Game_Boy_Color&oldid=1385096333) 1385096333;
  ["Atari Lynx"](https://en.wikipedia.org/w/index.php?title=Atari_Lynx&oldid=1385284173) 1385284173;
  ["Game Gear"](https://en.wikipedia.org/w/index.php?title=Game_Gear&oldid=1377875769) 1377875769;
  ["TurboExpress"](https://en.wikipedia.org/w/index.php?title=TurboExpress&oldid=1352943257) 1352943257;
  ["Genesis Nomad"](https://en.wikipedia.org/w/index.php?title=Genesis_Nomad&oldid=1383503066) 1383503066;
  ["Watara Supervision"](https://en.wikipedia.org/w/index.php?title=Watara_Supervision&oldid=1354286936) 1354286936.
- ["Mega Duck"](https://en.wikipedia.org/w/index.php?title=Mega_Duck&oldid=1358166547) 1358166547;
  ["Game.com"](https://en.wikipedia.org/w/index.php?title=Game.com&oldid=1376576838) 1376576838;
  ["Neo Geo Pocket"](https://en.wikipedia.org/w/index.php?title=Neo_Geo_Pocket&oldid=1367573321) 1367573321;
  ["WonderSwan"](https://en.wikipedia.org/w/index.php?title=WonderSwan&oldid=1386225880) 1386225880;
  ["WonderSwan Color"](https://en.wikipedia.org/w/index.php?title=WonderSwan_Color&oldid=1370985057) 1370985057;
  ["SwanCrystal"](https://en.wikipedia.org/w/index.php?title=SwanCrystal&oldid=1378611770) 1378611770;
  ["Virtual Boy"](https://en.wikipedia.org/w/index.php?title=Virtual_Boy&oldid=1384432040) 1384432040;
  ["Pokémon Mini"](https://en.wikipedia.org/w/index.php?title=Pok%C3%A9mon_Mini&oldid=1384550005) 1384550005.
- ["Gamate"](https://en.wikipedia.org/w/index.php?title=Gamate&oldid=1361186075) 1361186075;
  ["Game Master (console)"](https://en.wikipedia.org/w/index.php?title=Game_Master_%28console%29&oldid=1358643549)
  1358643549; ["Entex Select-A-Game"](https://en.wikipedia.org/w/index.php?title=Entex_Select-A-Game&oldid=1365296496)
  1365296496;
  ["Entex Adventure Vision"](https://en.wikipedia.org/w/index.php?title=Entex_Adventure_Vision&oldid=1384756979)
  1384756979;
  ["Palmtex Portable Videogame System"](https://en.wikipedia.org/w/index.php?title=Palmtex_Portable_Videogame_System&oldid=1353834548)
  1353834548;
  ["Epoch Game Pocket Computer"](https://en.wikipedia.org/w/index.php?title=Epoch_Game_Pocket_Computer&oldid=1371116714)
  1371116714; ["Digi Casse"](https://en.wikipedia.org/w/index.php?title=Digi_Casse&oldid=1352940508) 1352940508;
  ["R-Zone"](https://en.wikipedia.org/w/index.php?title=R-Zone&oldid=1353050445) 1353050445.
- ["Game & Watch"](https://en.wikipedia.org/w/index.php?title=Game_%26_Watch&oldid=1384130215) 1384130215;
  ["Computer Mah-jong Yakuman"](https://en.wikipedia.org/w/index.php?title=Computer_Mah-jong_Yakuman&oldid=1342316737)
  1342316737; ["Cybiko"](https://en.wikipedia.org/w/index.php?title=Cybiko&oldid=1364470227) 1364470227;
  ["Design Master Denshi Mangajuku"](https://en.wikipedia.org/w/index.php?title=Design_Master_Denshi_Mangajuku&oldid=1352944195)
  1352944195; ["GameKing"](https://en.wikipedia.org/w/index.php?title=GameKing&oldid=1353051015) 1353051015;
  ["VMU"](https://en.wikipedia.org/w/index.php?title=VMU&oldid=1379027676) 1379027676;
  ["Barcode Battler"](https://en.wikipedia.org/w/index.php?title=Barcode_Battler&oldid=1354183831) 1354183831;
  ["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_handheld_game_consoles&oldid=1384273411)
  1384273411.
- ["General Instrument AY-3-8910"](https://en.wikipedia.org/w/index.php?title=General_Instrument_AY-3-8910&oldid=1375275795)
  1375275795; ["Xbox 360"](https://en.wikipedia.org/w/index.php?title=Xbox_360&oldid=1386323476) 1386323476.

Japanese Wikipedia, read raw the same way (titles: My Vision, Game Gear, PC Engine GT, Pocket Challenge, WonderSwan):

- ["マイビジョン"](https://ja.wikipedia.org/w/index.php?title=%E3%83%9E%E3%82%A4%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B3&oldid=108997077)
  108997077;
  ["ゲームギア"](https://ja.wikipedia.org/w/index.php?title=%E3%82%B2%E3%83%BC%E3%83%A0%E3%82%AE%E3%82%A2&oldid=111465393)
  111465393;
  ["PCエンジンGT"](https://ja.wikipedia.org/w/index.php?title=PC%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%B3GT&oldid=110948000)
  110948000;
  ["ポケットチャレンジ"](https://ja.wikipedia.org/w/index.php?title=%E3%83%9D%E3%82%B1%E3%83%83%E3%83%88%E3%83%81%E3%83%A3%E3%83%AC%E3%83%B3%E3%82%B8&oldid=107760478)
  107760478;
  ["ワンダースワン"](https://ja.wikipedia.org/w/index.php?title=%E3%83%AF%E3%83%B3%E3%83%80%E3%83%BC%E3%82%B9%E3%83%AF%E3%83%B3&oldid=111759139)
  111759139.

Hubs:

- NESdev wiki, ["Cycle reference chart"](https://www.nesdev.org/w/index.php?title=Cycle_reference_chart&oldid=24433)
  revision 24433, ["CIC lockout chip"](https://www.nesdev.org/w/index.php?title=CIC_lockout_chip&oldid=24095) 24095,
  ["FDS BIOS"](https://www.nesdev.org/w/index.php?title=FDS_BIOS&oldid=24615) 24615, read as raw wikitext.
- SNESdev wiki, ["Timing"](https://snes.nesdev.org/w/index.php?title=Timing&oldid=1467), revision 1467,
  read as raw wikitext.
- fullsnes, chapters "SNES Cart Super Gameboy", "SNES Cart Sufami Turbo General Notes", and the Satellaview chapter.
  The live page, [fullsnes](https://problemkaputt.de/fullsnes.htm), refuses scripts
  (HTTP 403), so the rework read the
  [Wayback capture of 2026-11-05 22:45:18 UTC](https://web.archive.org/web/20261105224518/https://problemkaputt.de/fullsnes.htm);
  the first pass read the live page.
- Pan Docs, commit `f7f7b064`: ["Specifications"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/Specifications.md),
  ["Power Up Sequence"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/Power_Up_Sequence.md),
  ["The Cartridge Header"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/The_Cartridge_Header.md),
  ["SGB Functions"](https://github.com/gbdev/pandocs/blob/f7f7b064/src/SGB_Functions.md).
- SMS Power!, read as page source: ["Clock Rate"](https://www.smspower.org/Development/ClockRate),
  ["BIOS"](https://www.smspower.org/Development/BIOS), ["ROM Header"](https://www.smspower.org/Development/ROMHeader),
  and ["Game Gear LCD"](https://www.smspower.org/Development/GGLCD).
  The "BIOSes" page, `https://www.smspower.org/Development/BIOSes`, was read by the first pass and is no longer used
  (no link: it carries BIOS disassembly listings and attaches BIOS images, and the register closes it).
- Plutiedev, ["ROM header"](https://plutiedev.com/rom-header)
  and ["Using the Sub-CPU in mode 1"](https://plutiedev.com/subcpu-in-mode1).
- Sega Retro, technical specification pages
  for the [Mega Drive](https://segaretro.org/Sega_Mega_Drive/Technical_specifications),
  [Master System](https://segaretro.org/Sega_Master_System/Technical_specifications),
  [Mega-CD](https://segaretro.org/Sega_Mega-CD/Technical_specifications),
  and [32X](https://segaretro.org/Sega_32X/Technical_specifications),
  and the [Mega Jet](https://segaretro.org/Mega_Jet), [Nomad](https://segaretro.org/Nomad),
  and [Game Gear](https://segaretro.org/Game_Gear) articles, read by the first pass
  (research log); the site served a bot check to the rework's scripted requests, and a later one returned the page.
- NeoGeo Development Wiki, ["Clock"](https://wiki.neogeodev.org/index.php?title=Clock) revision 9305,
  ["System ROM"](https://wiki.neogeodev.org/index.php?title=System_ROM) 6391,
  ["NEO-CMC"](https://wiki.neogeodev.org/index.php?title=NEO-CMC) 9366,
  ["YM2610"](https://wiki.neogeodev.org/index.php?title=YM2610) 9251, read as raw wikitext;
  the links open the current page, because the wiki refuses scripted requests for old revisions.
- WSdev wiki, ["SoC"](https://ws.nesdev.org/w/index.php?title=SoC&oldid=752) revision 752,
  ["Timing"](https://ws.nesdev.org/w/index.php?title=Timing&oldid=645) 645,
  ["Cartridge connector"](https://ws.nesdev.org/w/index.php?title=Cartridge_connector&oldid=471) 471,
  read as raw wikitext.
- NgpCraft, [NGPC Dev Wiki](https://github.com/tixul/NgpCraft_dev_ref), README and licence file, last pushed 2026-11-03.

Makers, archives, and collectors:

- Sega,
  ["ゲームギア ｜セガ SEGA"](https://web.archive.org/web/20261007070751/https://www.sega.jp/history/hard/gamegear/)
  (Game Gear), in the site section "セガハード大百科" (Sega hardware encyclopaedia), "ハード概要", specification table,
  footer "©SEGA".
  The [live page](https://sega.jp/history/hard/gamegear/) refuses scripts
  (HTTP 403), so it was read in the Wayback capture of 2026-10-07 07:07:51 UTC.
- [*Television Digest*, vol. 18 no. 39, 25 September 1978](https://www.worldradiohistory.com/Archive-TV-Digest/70s/1978/TV-Digest-1978-09.pdf),
  p. 12 (PDF page 46), from the World Radio History archive, read through its text layer.
- Renesas, [CDP1802A product page](https://www.renesas.com/en/products/cdp1802a);
  the other makers' addresses probed are given in "Coverage of sources".
- Handheld Museum, ["Entex Select-a-Game"](https://www.handheldmuseum.com/Entex/SAG.htm),
  its ["Guts"](https://www.handheldmuseum.com/Guts/index.html) photograph of the same console,
  and ["Bandai Digi Casse A"](https://www.handheldmuseum.com/Bandai/DigiCasseA.htm);
  no licence or copyright notice on the pages read.
- Board photographs:
  ["BBC-bridge-companion-pcb.jpg"](https://commons.wikimedia.org/wiki/File:BBC-bridge-companion-pcb.jpg) on Wikimedia
  Commons (CC BY-SA 3.0), and ["LJN VideoArt Main Board Pictures"](https://archive.org/details/centerofboardbottom) on
  the Internet Archive, its photographs and item description (no licence stated).

Patents (front pages, abstracts, and for US 4,095,791 and US 5,683,297 the description):

- [US 3,659,285](https://patents.google.com/patent/US3659285/en)
  (Sanders Associates);
  the second pass read the assignees of this and the patents below from the Patent Office's front pages,
  [for example that of US 3,659,285](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/3659285).
- [US 4,026,555](https://patents.google.com/patent/US4026555/en)
  (Alpex Computer) and [US 4,095,791](https://patents.google.com/patent/US4095791A/en) (Fairchild).
- [US 4,112,422](https://patents.google.com/patent/US4112422/en)
  and [US 4,296,476](https://patents.google.com/patent/US4296476/en) (Atari).
- [US 4,799,635](https://patents.google.com/patent/US4799635A/en) (Nintendo).
- [US 5,683,297](https://patents.google.com/patent/US5683297A/en) (Tiger), cited by "R-Zone".

The community sites named in "Coverage of sources" were read on their prose pages only and nothing rests on them,
so they are not listed.

Project documents:

- The [research roadmap](../../roadmap/research.md); [R0-02](R0-02-legal-baseline.md); [R0-05](R0-05-source-map.md);
  [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md);
  the [source register](../../../.claude/hooks/source-register.txt); the [research guide](../README.md).
