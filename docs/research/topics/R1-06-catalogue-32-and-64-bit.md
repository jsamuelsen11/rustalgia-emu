---
title: "The 32-bit and 64-bit era: catalogue"
roadmap_item: R1-06
status: draft
date: 2026-11-20
---

# The 32-bit and 64-bit era: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold in the 32-bit and 64-bit era as the roadmap draws it,
and what hardware, protection, firmware, and sources each has.
It lists 12 home consoles with their variants, 7 add-ons and expansion cards, the Virtual Boy,
the Game Boy Advance and Nintendo DS families, and 7 other 32-bit handhelds of 2001 to 2005,
with one emulator host and the cancelled machines flagged.
An open-tier hardware reference beyond Wikipedia was found for the Nintendo 64, the Game Boy Advance, DS, and DSi,
the Virtual Boy, and the 3DO; the PC-FX and Saturn have Mednafen's open documentation, and the P/ECE its maker's page.
The PlayStation 1 has a patent by Sony staff for its disc check,
and no open-tier hardware reference free of the tainted document was used here, although `R0-05` names open candidates.
The Jaguar rests on Wikipedia, libretro's documentation, and leads; the other home consoles and handhelds on Wikipedia.
Two facts matter most to Rustalgia: every home console here names built-in firmware or a boot stage
that the project may not obtain, except the Playdia, which Wikipedia says has no BIOS, and the iQue Player,
for which no page read describes any; and the era's protection takes three forms, physical marks on discs,
chips in cartridges, and cryptographic signatures or encryption
(inference from the rows), the last of which brings keys into scope for `R0-02`.
Five of the other handhelds also appear in the `R1-07` catalogue; which catalogue keeps them is the owner's decision.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of the 32-bit and 64-bit era were sold, and for each,
  what are its maker, release, processor, video, audio, media, protection, firmware, survey, and sources?
- Covered: home consoles of the fifth generation and their add-ons; the Virtual Boy; the Game Boy Advance, DS,
  and DSi families; and other 32-bit handhelds sold from 2001 to 2005, three of them of a class the owner has to settle,
  as "How the catalogue is built" defines the era.
  How the hardware works is left to the primer (`R1-02`); each family's emulators to its survey
  (`R1-11`, `R1-12`, `R1-16`, `R1-18`, `R1-22`);
  the law on protection, firmware, and keys to `R0-02`; each hub's evaluation to `R0-05`.
  The Dreamcast, 3DS, PlayStation 2, PSP, and sixth-generation systems belong to `R1-07`,
  by the roadmap's rule as proposed in pull request #22 (see "How the catalogue is built").
  PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles are emulator hosts,
  left to `R3-07` and `R3-12`.
- Researched on 2026-11-20 against the Wikipedia revisions and hub pages listed in Sources.
- How claims were checked: on 2026-11-20 two research agents, one for home consoles and one for handhelds,
  read every page as raw text, Wikipedia through its raw wikitext and PDFs through text extraction or,
  for two patent front pages, as page images
  (research log); no value here comes from a summarising tool unless it is marked "(secondary)".
  One independent verification pass has run so far: six verifiers, each taking a part of the note,
  fetched the sources again and tested 271 claims and quotations.
  Each finding was checked against the source once more before the text was changed; corrections were applied,
  findings that the source did not bear out were kept as written,
  and the claims the pass could not check are listed in the pull request.
  Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed. "(inference)" marks reasoning, "(from memory)" a claim no fetched page confirmed,
  and "(lead)" a claim found only in a forum, a chat, a video, or a personal blog, and not relied on;
  Copetti's articles, a personal site that the register calls a lead, are treated as such.
  A statement that nothing was found records the searches made, not proof of absence.
- Notation: memory sizes that sources give in "KB" or "MB" are written in KiB or MiB,
  because chip sizes are powers of two (inference); media capacities and clocks are as each source gives them.
  No firmware, BIOS, boot ROM, disassembly, game, key, maker manual hosted by others, or emulator code was opened,
  and the tainted PlayStation reference was not opened in any form.

## Findings

### How the catalogue is built

- The roadmap's rule is "An era holds the systems whose family survey depends on its primer"
  (roadmap, "Hardware primers").
  Pull request #22, not yet merged, proposes a second sentence, which this note applies as the roadmap's rule:
  "Where a survey depends on more than one primer, each of its systems belongs to the era of its own generation,
  and the survey depends on the other primers for the hardware that its systems contain or carry over"
  (`docs/roadmap/research.md` on branch `docs/roadmap-era-tiebreak`).
- `R1-11` (Game Boy Advance), `R1-12` (Nintendo DS and DSi), `R1-16` (Nintendo 64), and `R1-18`
  (PlayStation 1) depend on `R1-02` alone (roadmap, "System family surveys").
  `R1-22` (Sega) depends on `R1-01`, `R1-02`, and `R1-03`, so by the proposed rule the Saturn is here,
  the Master System, Game Gear, and Genesis are in `R1-05`, and the Dreamcast is in `R1-07`.
  `R1-13` (3DS) and `R1-19` (PlayStation 2) depend on `R1-02` and `R1-03`, so the 3DS and PlayStation 2 are in `R1-07`;
  that the hardware they carry over is the DS's and the PlayStation 1's is an inference.
- For systems no survey names, this catalogue falls back on the fifth generation as Wikipedia lists it
  ("Fifth generation of video game consoles"),
  and for handhelds on a 32-bit processor sold from 2001 to 2005, a window that is this note's own rule.
- The `R1-07` catalogue, in progress on branch `docs/r1-07-catalogue-sixth-generation`, also lists the GP32, N-Gage,
  Zodiac, Leapster, and Gizmondo, so both catalogues hold them; which one keeps them is a decision for the owner
  (Open questions).
- By that rule the Nintendo DSi (2008) is here, because `R1-12` names it,
  although Wikipedia places the DS family in the seventh generation
  ("Nintendo DS", infobox); the PSP (2004) is not, because `R1-20` depends on `R1-03` (roadmap).
- A row is one machine or one compatible family.
  Revisions, regional models, licensed models, and combined units are folded into the row of the machine they run.
- "Survey" names the family survey whose title includes the system, or the system it is a model
  or add-on of; "(inference)" marks a survey that does not name the system, and a dash means none does.
- "Hub" names the best source other than Wikipedia, with its tier in the register and "lead" where it is one;
  a dash means Wikipedia was the only source found.
- Regions: NA North America, UK United Kingdom, JP Japan, KR South Korea, CN China, SG Singapore.

### Home consoles

Identity, with the hub where one exists:

| System (other names) | Maker | First release | Survey | Hub (tier) |
|---|---|---|---|---|
| PlayStation 1 (PlayStation, PS one) | Sony | JP 1994-12-03; NA 1995-09-09 | R1-18 | patent by Sony staff (open) |
| Nintendo 64 (Hyundai Comboy 64) | Nintendo | JP 1996-06-23; NA 1996-09-29 | R1-16 | N64brew (open) |
| iQue Player | iQue (Nintendo and Wei Yen) | CN 2003-11-18 | R1-16 (inference) | — |
| Sega Saturn (Samsung Saturn) | Sega | JP 1994-11-22; NA 1995-05-11 | R1-22 | Copetti (open; lead) |
| 3DO (Interactive Multiplayer) | The 3DO Company; licensees | NA 1993-10-04; JP 1994-03-20 | — | 3DO Dev Repo (open) |
| Atari Jaguar | Atari Corporation | NA 1993-11-23 | — | — |
| PC-FX | NEC, with Hudson Soft | JP 1994-12-23 | — | Mednafen documentation (open) |
| Amiga CD32 | Commodore | 1993-09-17 | R1-25 (inference) | — |
| FM Towns Marty (Marty 2, Car Marty) | Fujitsu | JP 1993-02-20 | R1-25 (inference) | — |
| Playdia | Bandai | JP 1994-09-23 | — | — |
| Casio Loopy | Casio | JP 1995-10-19 | — | — |
| Pippin (ATMARK, @WORLD, KMP 2000) | Apple; Bandai and Katz Media | JP 1996 | R1-25 (inference) | — |

Hardware:

| System | CPU and clock | Video | Audio |
|---|---|---|---|
| PlayStation 1 | MIPS R3051-class core, 33.8688 MHz | Sony GPU; GTE; MDEC | SPU, 24 ADPCM voices |
| Nintendo 64 | NEC VR4300, 93.75 MHz | RCP (RSP and RDP), 62.5 MHz | RSP software; DAC |
| iQue Player | R4300i-class core, 140.625 MHz | RCP, 62.5 MHz | "ADPCM 64" |
| Sega Saturn | 2 × Hitachi SH-2, 28.6 MHz; SH-1; 68EC000 | VDP1 and VDP2 | Yamaha YMF292 SCSP |
| 3DO | ARM60, 12.5 MHz | Madam, with cel engine | DSP in Clio |
| Atari Jaguar | 68000, 13.295 MHz; Tom and Jerry, 26.591 MHz | Tom: object processor, blitter | Jerry DSP |
| PC-FX | NEC V810, 21.475 MHz | HuC6270, HuC6271 | 2 ADPCM, 6 sample channels |
| Amiga CD32 | 68EC020, 14.18 or 14.32 MHz | AGA, Akiko | 4 × 8-bit PCM |
| FM Towns Marty | 386SX, 16 MHz | Fujitsu custom | YM2612, RF5c68 |
| Playdia | Toshiba TMP87C800F, 8 MHz | AK8000 | AK8000 |
| Casio Loopy | Hitachi SH7021, 16 MHz | 512 colours | 4 × 12-bit PCM |
| Pippin | PowerPC 603, 66 MHz | 640 × 480 | 16-bit, 44 kHz |

Media, protection, and firmware:

| System | Media | Protection or lock-out | Firmware |
|---|---|---|---|
| PlayStation 1 | CD-ROM XA; memory card | wobble signal on disc; region | 512 KiB BIOS ROM |
| Nintendo 64 | Game Pak; Controller Pak | CIC chip checked by PIF; cartridge shape | PIF; IPL3 on cartridge |
| iQue Player | memory card | per-console encryption | not described |
| Sega Saturn | CD-ROM; cartridge slot | ring of data outside program area; region | firmware ROM, by region group |
| 3DO | CD-ROM | RSA-signed executables, by one source | firmware ROM per model |
| Atari Jaguar | ROM cartridge | encrypted header (lead) | boot ROM |
| PC-FX | CD-ROM | none described | BIOS 1.00 |
| Amiga CD32 | CD-ROM, ISO 9660 | none described | Kickstart 3.1 and CD32 ROM |
| FM Towns Marty | CD-ROM; 3.5-inch floppy | none described | BIOS |
| Playdia | CD-ROM (QIS) | none described | no BIOS, by Wikipedia |
| Casio Loopy | ROM cartridge | none described | internal mask ROM (lead) |
| Pippin | CD-ROM | RSA disc signatures | ROM; operating system on disc |

- Sources by row: each row rests on the system's Wikipedia article, read raw,
  unless a finding below names another source;
  the PlayStation 1 hardware values are from "PlayStation technical specifications",
  the CD32 sound row from "Amiga CD32", "Specifications", and the Jaguar's boot ROM from libretro's documentation,
  "Virtual Jaguar".
- PlayStation 1.
  A patent by Ken Kutaragi and Tetsuya Hirano describes the disc check:
  "The security code is stored through modulating an offset of the physical position of a plurality of data bits from a
  nominal track position" (US 6,304,971, abstract; priority 1994-11-18).
  Its front page names no assignee and gives both inventors in care of Sony Corporation;
  Google Patents gives its original assignee as "Individual" and its current one as Sony Interactive Entertainment,
  so it counts here as maker material by Sony staff (inference).
  Wikipedia says the signal also encodes the region and puts it in the pregap
  ("PlayStation (console)", "Copy protection system");
  another article puts the region code in the lead-in
  ("PlayStation models", "Debugging units"),
  and Copetti puts it in the table of contents in the lead-in, with a four-letter region string
  (Copetti, "PlayStation Architecture", "Anti-piracy / Region Lock"; lead).
  The last digit of the model number gives the region: 0 Japan, 1 North America, 2 PAL, 3 Asia
  ("PlayStation models", "Region codes", which cites a Sony service manual not opened).
- Wikipedia's PlayStation specification page cites the tainted Nocash document for one value, the CD-ROM's data buffer
  ("PlayStation technical specifications", reference list, read raw); this catalogue does not use that value.
  The processor's description differs between articles: "LSI CoreWare CW33000-based" in the specification page,
  "LSI LR333x0" in the fifth-generation comparison.
- PlayStation 1 variants (Wikipedia, "PlayStation models"):
  - Revision C hardware (late 1995) replaced the GPU's dual-ported VRAM with SGRAM
    ("Revisions", which cites a video);
    "Debugging units" adds, citing nothing, that it blends faster and fixes minor bugs of the older silicon.
  - The PS one (JP 2000-07-07) has the late hardware in a smaller case, with no serial or parallel port.
  - Debug units have a reprogrammed CD controller that treats any disc with a data track as licensed
    ("Debugging units").
  - The Net Yaroze kit (JP 1996-06, from the article's opening section) has different boot ROMs, no region lock,
    and "a different encryption scheme", and boots programs sent over serial only with a key disc and an access card
    ("Net Yaroze", "Contents").
- Nintendo 64.
  N64brew describes the processor as a slightly modified VR4300 with six pins moved,
  and records the processor-revision values read on retail units and on the iQue Player (N64brew, "VR4300").
  A Nintendo patent describes the peripheral interface as handling the controllers
  and checking the cartridge's security chip:
  it is used "for performing game authenticating security checks continuously during game play"
  (US 6,190,257, abstract, read from the Patent Office's front page).
  N64brew says the PIF holds the first two boot stages,
  and that each lock-out chip variant pairs with a third boot stage in the cartridge ROM whose checksum the second stage
  tests, so an emulator must select the variant per game (N64brew, "PIF-NUS", "CIC-NUS"; the selection is an inference).
  Region is set by cartridge shape and an NTSC or PAL lock-out chip ("Nintendo 64 Game Pak", "Regional lockout").
- Nintendo and Silicon Graphics were the original assignees of US 6,239,810, on the coprocessor,
  whose earliest priority date is 1995-11-22; Nintendo is the current assignee (front page; Google Patents record).
- iQue Player.
  "Newly purchased titles were loaded to memory cards as encrypted files
  and re-encrypted on first launch using a console-specific private key" ("iQue Player", "Games").
  BroadOn developed its cryptographic security system; games were loaded at kiosks,
  and from October 2004 over USB from a PC (same article).
- Sega Saturn.
  Copetti describes a ring of non-standard data outside the program area, checked once by the SH-1 in the drive
  ("Sega Saturn Architecture", "Anti-Piracy & Homebrew"; lead, whose sources for this section are unregistered).
  Its account of the boot ROM cites a Sega boot ROM manual that was not opened, so those details are not relied on
  (same article, "Operating System").
  Mednafen needs one firmware image for Japanese games and one for North American and European games,
  and detects region from the game header with a database of exceptions (Mednafen documentation, "Sega Saturn").
  Japanese variants by Hitachi (Hi-Saturn) and JVC (V-Saturn) exist
  ("Sega Saturn", "Technical specifications");
  their dates and model numbers were not found, because Sega Retro served a bot check (research log).
- 3DO.
  The licensed models are Panasonic's FZ-1, FZ-10, and ROBO changer, GoldStar's GDO-101, GDO-101M, GDO-202, and GDO-203,
  Sanyo's TRY, Samsung's DMB-800, and Creative's 3DO Blaster card ("3DO", "Licensed systems"; "3DO Blaster").
  The 3DO Company's patents describe the cel engine:
  "Linked lists of spryte control blocks are prepared in memory and traversed by a spryte rendering engine"
  (US 5,596,693, abstract); others cover display lists and intensity effects (US 5,502,462; US 5,572,235).
- 3DO protection is disputed between sources.
  Wikipedia says the system has neither regional lockout nor copy protection ("3DO", "Hardware").
  The 3DO Development Repo says that the 3DO Company signed executables and the operating system with 512-bit RSA,
  so that retail and arcade systems would not run unlicensed software
  ("documentation/encryption", paraphrased; its key pages were not opened).
  An international application by the 3DO Company and CagEnt Technologies, filed in 1997 with priority from 1996-05-31,
  describes a copy-protected disc with a radial wobble
  (WO 97/45836, abstract and Google Patents record); whether any product used it is not shown (inference).
- 3DO firmware differs by model: libretro's Opera core lists firmware images by model, among them patched images
  (libretro docs, "Opera"),
  and a missing kanji font in some models' firmware breaks a few Japanese games ("3DO", "Hardware").
- Atari Jaguar.
  Early units made by IBM have an analogue-input converter and hardware bugs that later IBM and JVC units fix,
  and a memory-controller flaw limits running code from RAM on the custom processors
  ("Atari Jaguar", "Technical specifications").
  libretro's Virtual Jaguar core carries the console's boot ROM (libretro docs, "Virtual Jaguar").
  That the boot ROM verifies an encrypted cartridge header is known only from search-result summaries of forum threads
  and a disassembly-based blog (secondary; lead), none opened.
  Hasbro's 1999 release says "it has released all rights that it may have to the vintage Atari hardware platform,
  the Jaguar"; it lets developers publish Jaguar software without a licence agreement and keeps its trade marks,
  and it does not mention patents or the public domain
  (Hasbro Interactive release of 1999-05-14, fan transcription; lead).
- PC-FX.
  Mednafen's documentation names BIOS version 1.00 as the image it needs and recommends,
  and says it emulates the motion decoder's run-length and JPEG-like modes (Mednafen documentation, "PC-FX").
  Wikipedia says the console has no polygon processor by design ("PC-FX", "History").
- Amiga CD32.
  Games use ISO 9660 level 2 mode 1; the machine runs most CDTV titles, and a hidden boot menu selects 50 or 60 Hz,
  which some games need ("Amiga CD32", "Hardware", "Software").
  It was sold in Europe, Australia, Canada, and Brazil
  (same article, opening section),
  and not in the United States, because of an import injunction (same article, "History").
- FM Towns Marty: its infobox names Towns OS as the operating system without saying where it is stored,
  and its floppy disks are formatted from the BIOS's interface ("FM Towns Marty").
- Wikipedia says the Playdia has no BIOS or menu and shows a blue screen when started without a disc ("Playdia");
  whether its 8-bit microcontroller holds internal ROM is not stated.
  That processor gives it to this era by generation only (see "Boundary cases").
- Casio Loopy: a built-in thermal printer makes colour stickers ("Casio Loopy").
  That its processor has internal mask ROM
  that has not been dumped is known only from a search-result summary of emulator comments (secondary; lead).
- Pippin.
  "RSA's public/private key system was used to create the authentication system on the Pippin platform"
  ("Apple Pippin", "System software");
  a developer dongle bypasses it, and the KMP 2000 lacks the check
  (same article, "Developer marketing" and "Technical specifications").
  The article gives two first-release dates: JP 1996-04-21 in its infobox,
  and March 1996 in its model table (ATMARK) and its history.
  The operating system, based on System 7.5.2, is on each disc rather than in the console (same article).

### Add-ons and expansion cards

| Add-on | Base | First release | Adds | Firmware | Survey |
|---|---|---|---|---|---|
| 64DD | Nintendo 64 | JP 1999-12 | disk drive with a 32-bit coprocessor | IPL ROM in the drive | R1-16 (inference) |
| Jaguar CD | Atari Jaguar | 1995-09-21 | 2× CD drive | CD BIOS | — |
| PocketStation | PlayStation 1 | JP 1999-01-23 | ARM7T, 32 × 32 LCD | not described | R1-18 (inference) |
| 3DO Blaster | PC (ISA) | 1994 | a 3DO on a card | as 3DO | — |
| PC-FXGA | PC (ISA, PC-9800) | not found | PC-FX plus HuC6273 3D chip | not described | — |
| Game Boy Player | GameCube | JP 2003-03-21 | GBA hardware | boot disc | R1-11 (inference) |
| 32X | Genesis | NA 1994-11-21 | 2 × SH-2 | not checked | R1-22 |

- The 64DD's date is 1999-12-11 by Wikipedia's infobox and 1999-12-01 by N64brew and Copetti
  ("64DD"; N64brew, "64DD"; Copetti, "Nintendo 64 Architecture").
  It reads 64 MB magnetic disks, has a 32-bit coprocessor for disk operations and a real-time clock,
  and was sold in Japan only; the Randnet service ran from 1999-12-13 to 2001-02-28 ("64DD", "Hardware", "Randnet").
  Disk software carries no lock-out chip, and the drive's firmware completes the secure boot (N64brew, "CIC-NUS").
- Jaguar CD discs use a format based on audio CD rather than CD-ROM data modes, up to 790 MB
  ("Atari Jaguar CD", "Technicals");
  the article gives the release date without a region. libretro's Virtual Jaguar core compiles the boot ROM
  and both CD BIOS images into itself
  (libretro docs, "Virtual Jaguar");
  those images are maker material that others host, which ADR 0001's kinds table makes closed (inference),
  and the repository is not registered.
- The PocketStation is a PlayStation memory card with a screen, an ARM7T processor at up to 7.995 MHz, 2 KiB SRAM,
  128 KiB flash, infrared, and a clock; its software comes from PlayStation discs ("PocketStation").
  It is both a handheld and a peripheral; no survey names it.
- The 3DO Blaster needs a Sound Blaster and a CD drive with a Panasonic interface ("3DO Blaster").
  The PC-FXGA comes as ISA and PC-9800 boards and adds a 3D chip that the console lacks ("PC-FX", "PC-FXGA").
- "Rather than emulating a GBA system, the Game Boy Player uses physical hardware nearly identical to that of a GBA"
  ("Game Boy Player", opening section); it needs a region-locked boot disc.
  Its GameCube side belongs to `R1-07`.
- The 32X is catalogued in `R1-05` as an add-on to the Genesis
  (Mega Drive),
  whose survey `R1-22` depends on `R1-01`, `R1-02`, and `R1-03`;
  by the rule proposed in #22 the Genesis belongs to `R1-05`,
  and the 32X is listed here only because its processors are 32-bit.
- Online cartridges and services: the Saturn's Net Link modem (1996)
  ("Sega Net Link") and the 64DD's Randnet are peripherals, not systems.

### Handhelds of the Nintendo families

Identity:

| System (other names) | Maker | First release | Survey | Hub (tier) |
|---|---|---|---|---|
| Virtual Boy | Nintendo | JP 1995-07-21; NA 1995-08-14 | — | Sacred Tech Scroll (open) |
| Game Boy Advance (iQue GBA) | Nintendo | JP 2001-03-21; NA 2001-06-11 | R1-11 | GBATEK copy (open) |
| Game Boy Advance SP (AGS-001, AGS-101) | Nintendo | JP 2003-02-14; NA 2003-03-23 | R1-11 | GBATEK copy (open) |
| Game Boy Micro | Nintendo | JP 2005-09-13; NA 2005-09-19 | R1-11 | GBATEK copy (open) |
| Nintendo DS (iQue DS) | Nintendo | NA 2004-11-21; JP 2004-12-02 | R1-12 | GBATEK copy (open) |
| DS Lite (iQue DS Lite) | Nintendo | JP 2006-03-02; NA 2006-06-11 | R1-12 | GBATEK copy (open) |
| Nintendo DSi (iQue DSi) | Nintendo | JP 2008-11-01; NA 2009-04-05 | R1-12 | DSiBrew (open) |
| DSi XL (DSi LL) | Nintendo | JP 2009-11-21; NA 2010-03-28 | R1-12 | DSiBrew (open) |

Hardware:

| System | CPU and clock | Display | Audio | Firmware or lock-out |
|---|---|---|---|---|
| Virtual Boy | NEC V810 (NVC), 20 MHz | 384 × 224 per eye, red | 6 channels | none found |
| Game Boy Advance | ARM7TDMI, 2^24 Hz; SM83-class core | 240 × 160 | 4 PSG and 2 PCM | 16 KiB BIOS; logo check |
| GBA SP | as GBA | as GBA, lit | as GBA | as GBA |
| Game Boy Micro | as GBA; SM83 present but unusable | 240 × 160, 2 in. | as GBA | as GBA |
| Nintendo DS | ARM946E-S, 67 MHz; ARM7TDMI, 33 MHz | 2 × 256 × 192; 2D, 3D | 16 channels | BIOS; encrypted cards |
| DS Lite | as DS | as DS | as DS | as DS |
| Nintendo DSi | ARM9 at 67 or 134 MHz; ARM7; Teak DSP | as DS; 2 cameras | as DS, new codec | NAND software; RSA |
| DSi XL | as DSi | 4.2 in. screens | as DSi | as DSi |

- Sources by row: the Virtual Boy row rests on the Sacred Tech Scroll;
  the Game Boy Advance and DS rows on GBATEK's "GBA Technical Data", "DS Technical Data",
  their "Sound" and "Internal Memory" sections, and the bullets below; the DSi rows on DSiBrew, "Hardware",
  which calls the codec "possibly a TI codec"; the Game Boy Micro's processor cell on "Game Boy Micro",
  "Design and specifications"; dates and screen sizes on each system's Wikipedia article.
- Virtual Boy.
  The Sacred Tech Scroll gives a modified V810 called NVC with a 16-bit bus, six sound channels,
  and a reset address inside the game pak's ROM
  (Sacred Tech Scroll, "CPU", "VSU", "System Reset", "ROM Format"), so no console firmware runs (inference).
  Its pak header holds a title, maker code, game code, and version, and the document describes no logo, checksum,
  or other check (same, "ROM Header"; that there is no lock-out is an inference from that).
  Each eye's display is a column of red LEDs swept by an oscillating mirror, from Reflection Technology
  (same, display overview).
  The link port allows two units to communicate, but no commercial game used it (same, "Communication Port").
- Game Boy Advance.
  GBATEK gives the system clock as 16.78 MHz, defined as 16 × 1024 × 1024 Hz
  (GBATEK, `mgba-emu/gbatek` copy, "LCD Dimensions and Timings", "System Clock"),
  and says "The GBA's separate 8bit/32bit CPU modes cannot be operated simultaneously"
  (same copy, "GBA Technical Data").
  Wikipedia gives four rounded values for the same clock across its three articles,
  and names the 8-bit core the Sharp SM83 ("Game Boy Advance", "Hardware").
  A frame is 228 lines and 280,896 cycles; that gives 59.7275 Hz
  (calculated from the rates),
  where GBATEK writes "ca. 59.737" (GBATEK copy, "LCD Dimensions and Timings", "Vertical Dimensions"; inference:
  a slip in the source).
- GBA cartridges have no save-type field: "Nintendo didn't include a backup-type entry in the ROM header"
  (GBATEK copy, "GBA Cart Backup IDs");
  save types are EEPROM, SRAM, and flash of several sizes, identified by strings in the ROM (same section).
- The GBA BIOS compares the compressed logo in the cartridge header with its own copy and locks up on a mismatch;
  multiboot images carry the same header (GBATEK copy, "GBA Cartridge Header").
  The logo's bytes are firmware and game data and are not recorded here.
  No region check is described in that section,
  and the three GBA articles carry Wikipedia's "Regionless game consoles" category (inference from the two absences).
- GBATEK says "there seems to be no way to detect SPs by software",
  and that the Game Boy Micro's main RAM is slightly slower and cannot be sped up through the memory-control register
  (GBATEK copy, "GBA SP Notes", "Gameboy Micro").
  The Micro plays only Game Boy Advance paks;
  its Game Boy processor is present but lacks the other hardware older games need
  ("Game Boy Micro", "Software and hardware", "Design and specifications").
- Nintendo DS.
  GBATEK gives a bus clock of 33.513982 MHz with the ARM9 at twice it
  (GBATEK copy, "DS Memory Timings", "System Clock"),
  and says "the real 66MHz can be used only with cache and tcm,
  all other memory and I/O accesses are delayed to the 33MHz bus clock" (same copy, "DS Technical Data").
  Wikipedia's infobox gives "256 MB" of flash where its text and GBATEK give 256 KiB of firmware flash
  ("Nintendo DS", infobox and "Hardware"; GBATEK copy, "Internal Memory").
- DS cards use an encrypted bus.
  The BIOS loads a "secure area" with commands encrypted by a scheme keyed by the game code,
  and later transfers are scrambled by a seeded stream; Download Play programs need an RSA signature
  (GBATEK copy, "DS Cartridge Secure Area", "KEY1 - Gamecode / Idcode Encryption",
  "DS Encryption by Random Seed (KEY2)", "DS Wifi Nintendo DS Download Play"; Copetti's Nintendo DS article,
  "Anti-Piracy and Homebrew", which cites GBATEK; lead).
  No table or seed is recorded here.
- DS cards are region-free, except that iQue DS games do not run on DS units of other regions
  ("Nintendo DS", "China");
  "Regional division" gives missing Chinese glyphs as the reason and says, marked "Citation needed",
  that the DSi and 3DS lift the restriction, and GBATEK reports a firmware-version check (GBATEK copy, "iQue Notes").
- The DS plays Game Boy Advance paks in its second slot, not Game Boy or Game Boy Color paks
  ("Nintendo DS", "Compatibility"); the DSi has no such slot (GBATEK copy, "GBA Slot").
- Nintendo DSi.
  Its ARM9 switches between 67.03 MHz in DS mode and 134.06 MHz in DSi mode
  (GBATEK copy, `SCFG_CLK`); DSiBrew names a CEVA XpertTeak signal processor at 133 MHz (DSiBrew, "Hardware").
  GBATEK's Teak sections are closed in the register and were not read.
  The system software is on 256 MiB of eMMC NAND, with an SD card slot
  (DSiBrew, "Hardware"; GBATEK copy, "DSi SD/MMC Internal NAND Layout").
- "DSi carts are using an extended cart header (1000h bytes), with RSA signature
  (making it problematic to run unlicensed/homebrew code)" (GBATEK copy, "DSi Basic Differences to NDS").
  The DSi is region-locked for its own software and not for DS cards,
  though a note in the same article says IGN found a DSi-enhanced card region-locked
  ("Nintendo DSi", "Software library"),
  and DSiBrew lists two board revisions of the DSi and one of the DSi XL (DSiBrew, "Hardware Revisions").
- GBATEK calls the iQue Game Boy Advance "essentially same as" Nintendo's,
  and gives the iQue DS a larger firmware chip holding simplified Chinese characters
  (GBATEK copy, "iQue Notes", "Internal Memory").

### Other dedicated 32-bit handhelds, 2001 to 2005

Identity:

| System (other names) | Maker | First release | Class | Hub |
|---|---|---|---|---|
| GP32 | Game Park | KR 2001-11-23 | dedicated | — |
| P/ECE (PIECE) | Aquaplus | JP 2001-11-30 | dedicated | Aquaplus site (open) |
| N-Gage, N-Gage QD | Nokia | 2003-10-07; QD 2004-05-26 | phone; owner's call | — |
| Tapwave Zodiac 1, 2 | Tapwave | NA 2003-10 or 2003-11-01; UK, SG 2004-10 | PDA; owner's call | — |
| Leapster, L-Max | LeapFrog | 2003-10-07; L-Max 2004 | dedicated | — |
| Gizmondo | Tiger Telematics | UK 2005-03-19; NA 2005-10-22 | dedicated | — |
| GP2X (F-200) | GamePark Holdings | KR 2005-11-10 | host or dedicated; owner's call | — |

Hardware:

| System | CPU and clock | Display | Media | Software platform |
|---|---|---|---|---|
| GP32 | Samsung S3C2400 (ARM9), 133 MHz | 320 × 240 | SmartMedia | firmware runs only encrypted software |
| P/ECE | Epson S1C33209, 24 MHz | 128 × 88, 4 greys | download over USB | Aquaplus kernel |
| N-Gage | ARM, 104 MHz | 176 × 208 | MultiMediaCard | Symbian OS 6.1 |
| Tapwave Zodiac | Motorola i.MX1 (ARM9), 200 MHz | 480 × 320; ATI Imageon W4200 | SD, MMC | Palm OS 5.2T |
| Leapster | ARCTangent, 96 MHz | 160 × 160, touch | cartridge | MQX; Flash content |
| Gizmondo | Samsung S3C2440 (ARM9), 400 MHz | 320 × 240; Nvidia GoForce 3D 4500 | SD, MMC | Windows CE |
| GP2X | ARM920T and ARM940T, 200 MHz | 320 × 240 | SD | Linux |

- Every row rests on the system's Wikipedia article except the P/ECE's,
  which rests on the Japanese Wikipedia article "PIECE" and Aquaplus's own product page.
  The GP32 and Leapster articles carry a "More citations needed" banner.
  The Zodiac article disagrees with itself: its infobox gives 2003-11-01,
  and its text and timeline say that direct shipping began in October 2003, with United States retail from June 2004
  ("Tapwave Zodiac").
- "The GP32's original firmware only supported running encrypted games and tools"
  ("GP32", "Software", "Homebrew"); commercial games were tied to the card's or the console's identifier (same).
  Its specification table gives 44.1 kHz 16-bit stereo sound with software mixing of four or more channels
  (same article).
- Aquaplus's product page says anyone may develop, distribute, and sell P/ECE software without permission or fees,
  and that Aquaplus publishes its kernel, library, and application sources, keeps their copyright,
  and lets them be modified and redistributed only as programs for the P/ECE,
  provided that the documentation names the source files used and tells users that Aquaplus is not liable
  for faults the program causes (Aquaplus, P/ECE product introduction, read in Japanese; the summary is the note's own).
  Its footer forbids other use of the site's data without the rights holder's permission (same page).
- Wikipedia reports that the N-Gage was a Series 60 Symbian phone with no added gaming hardware,
  and that pirated games for it ran on other phones of the period ("N-Gage");
  the Zodiac is a Palm OS device with a 2D graphics accelerator ("Tapwave Zodiac").
  Whether either is a dedicated game device is the owner's call (Options).
- The Leapster uses an ARCTangent core, which no other system in this catalogue uses
  (rows above), and runs Flash content ("Leapster").
- GamePro gave the Gizmondo's sales as fewer than 25,000 units overall, without saying where;
  United States figures were not released ("Gizmondo").
  Its specification list gives a built-in speaker and a stereo headset socket, and no sound chip (same).
- Wikipedia says the GP2X is "commonly used to run emulators"
  ("GP2X", opening section);
  it is neither a PC nor an Android device, so the owner's host rule does not settle it (inference).
- The V.Smile Pocket (2004) is a handheld V.Smile ("V.Smile"); its processor is 16-bit
  (from memory), so it would go with the V.Smile console in `R1-07` or with `R1-05` (inference).
  The LeapFrog Didj (2008, ARM9), Dingoo A320
  (2009, XBurst, a MIPS design),
  and GP2X Wiz (2009) are handhelds after 2005
  ("LeapFrog Didj"; "Dingoo"; "List of handheld game consoles"),
  outside this catalogue's window; that the first two are 32-bit is an inference from their processor families,
  and the Wiz's word size is from memory.

### Emulator hosts and cancelled machines

- The PlayStation Classic (2018-12-03) runs PlayStation games in an emulator on a MediaTek system with four Cortex-A35
  cores ("PlayStation (console)", "PlayStation Classic").
  It is an emulator host, left to `R3-07` and `R3-12`.
- The Panasonic M2, designed by The 3DO Company with two PowerPC 602 processors, was cancelled as a console in 1997,
  shipped in 1998 in two multimedia players, and was used in a Konami arcade board
  ("Panasonic M2", "Use in other hardware", which is marked "citation needed").
- Cancelled: the Super NES CD-ROM and Sony's hybrid ("Super NES CD-ROM"), the Atari Panther
  ("Atari Panther"),
  the Jaguar Duo ("Atari Jaguar"), the Sega Neptune
  ("Fifth generation of video game consoles", "Other consoles"),
  the Saturn with a built-in modem ("Sega Saturn"), and the Konix Multisystem ("Konix Multisystem").
  Three of these are not of this era by their articles: the Panther is fourth-generation and was planned as 16-bit,
  the Konix has a 16-bit 8086, and the Super NES CD-ROM is an add-on to a 16-bit console.
  They are listed because the Panther and Konix articles name the Jaguar as successor or relative,
  and the Super NES CD-ROM article covers Sony's hybrid, named "PlayStation"
  (same articles); whether `R1-05` should hold them is the owner's call.
- Arcade boards built from these consoles appear in the articles read: the Aleck 64
  (Nintendo 64),
  ST-V (Saturn), CoJag (Jaguar), American Laser Games' 3DO boards, Konami's M2 board, and the CUBO CD32
  (each base system's article).
  `R1-24` depends on `R1-01` only (roadmap).

### Boundary cases

| System | Word-size rule | Wikipedia generation | Placed here as |
|---|---|---|---|
| Game Boy Advance family | 32-bit | sixth | here, by survey `R1-11` |
| Nintendo DS and DSi | 32-bit | seventh | here, by survey `R1-12` |
| Virtual Boy | 32-bit | fifth | here, by generation |
| Playdia | 8-bit | fifth | here, by generation; `R1-05` left it here |
| PC-FX, Amiga CD32 | 32-bit | fifth | here |
| FM Towns Marty | 32-bit core, 16-bit bus | fifth (category fourth) | here |
| 32X | 32-bit | fifth | row in `R1-05`, an add-on to the Genesis |
| CD-i | 16-bit bus | fourth | row in `R1-05`, flagged there for this era |
| Super A'Can; CPS Changer | 16-bit | fifth | rows in `R1-05` |
| PocketStation | 32-bit | fifth | add-on row here |
| PSP | 32-bit (from memory) | seventh | not here: `R1-07`, by survey `R1-20` |
| Dreamcast and its VMU | 32-bit; 8-bit | sixth | not here: `R1-07`, by generation under the rule proposed in #22 |
| 3DS; PlayStation 2 | not checked | not checked | not here: `R1-07`, under the rule proposed in #22 |
| Nuon | 32-bit scalars and registers | sixth | not here: `R1-07` |
| iQue Player | 64-bit (from memory) | fifth | here, as a Nintendo 64 derivative |

- The sources for each placement are the roadmap's survey dependencies, the rule proposed in #22,
  and each system's Wikipedia article, including "Dreamcast", "VMU", "CD-i", and "CP System" (Sources).
  Wikipedia's generation for the GBA, DS, DSi, PocketStation, and iQue Player is from their infoboxes;
  the Super A'Can and CPS Changer appear in the fifth-generation article's gallery
  and carry the fourth-generation category, and `R1-05` keeps them by word size.
  The Marty's bus and category are from "FM Towns Marty", the Nuon's word size from "Nuon
  (DVD technology)",
  and the Dreamcast's 32-bit SH-4 from "Dreamcast"; word sizes for the Playdia, CD-i, and VMU are from `R1-05`,
  and the PSP's is from memory.
- `R1-24` (arcade) and `R1-25` (other handhelds and home computers) depend on `R1-01` only,
  so the computer-derived consoles and the other handhelds here have no survey whose primer covers them
  (roadmap; inference).

### Patterns across the catalogue

- Processor families: MIPS runs the PlayStation 1, Nintendo 64, and iQue Player; Hitachi's SuperH runs the Saturn,
  the 32X, and the Casio Loopy; Arm cores run the 3DO, the Game Boy Advance and DS families, the PocketStation,
  and five of the seven other handhelds; PowerPC runs the Pippin and the M2; the 68000 family runs the Jaguar, the CD32,
  and the Saturn's sound processor; NEC's V810 runs the Virtual Boy and the PC-FX
  (rows above; the grouping is the note's).
- Two machines reuse earlier chips: the PC-FX uses the HuC6270 video chip
  ("PC-FX", infobox and "Technical specifications"),
  which `R1-05` lists in its PC Engine row, and the Game Boy Advance carries a Game Boy processor for older games
  (GBATEK copy).
- Protection takes three forms (inference from the rows): physical marks checked in the drive
  (the PlayStation 1's wobble, the Saturn's ring);
  a chip in each cartridge checked by the console (the Nintendo 64); and cryptographic signatures or encryption
  (the 3DO by one source, the Pippin, the iQue Player, the DS and DSi cards, the GP32, and the Jaguar by leads only).
  For the last form, booting retail software in the original way needs keys, which notes never hold (`R0-04`).
  The last form is not new to this era: `R1-05` records the NTSC Atari 7800's cartridge signature.
- Firmware: every home console row except the Playdia and the iQue Player names firmware or a boot stage,
  and so do the 64DD, Jaguar CD, PC-FXGA, Game Boy Advance, and DS families;
  the Virtual Boy is the only system found to start in cartridge ROM
  (rows above; the Virtual Boy point is an inference from its reset address).
- Disc images do not carry the PlayStation 1's wobble or the Saturn's ring
  (inference from where the marks sit),
  so an emulator reports the drive's result instead of reading the mark (inference).

### Coverage of sources

- PlayStation 1: the maker patent covers the disc check only.
  No open-tier hardware reference free of the tainted document was used here; the open candidates `R0-05` names,
  Walker's compilation and the text files of 1999 to 2000 by Doomed and bITmASTER, were not opened by this catalogue,
  nor was Amidog's wiki, which the register opens for its text
  (research log), and Wikipedia's specification page cites the tainted document for one value.
  Copetti's article is a lead whose sources for its region and boot sections are a video, a modification project,
  a tutorial, and a BIOS translation that it links on the psxdev.net forum, which the register opens as a lead.
- Nintendo 64: N64brew (open) and two maker patents; N64brew links a copy of NEC's VR4300 manual that it hosts,
  which is maker material hosted by others and was not opened, and its PIF page holds secret keys, which were not read.
- Saturn: Copetti (lead), Mednafen's documentation
  (open prose of a walled emulator),
  and Wikipedia; Sega Retro served a bot check and the Yabause wiki refused access (research log).
- 3DO: maker patents and the 3DO Development Repo (open).
  That site also indexes 3DO Company documents dated 1993; Portfolio operating-system source for the 3DO,
  uploaded in 2022 with no origin stated, and for the M2, which its pages say came from a former M2 engineer's archives;
  and key pages; none was opened, and the register has no closed lines for those paths
  (research log; decision in the pull request).
- Jaguar, PC-FX, CD32, Marty, Playdia, Loopy, Pippin: Wikipedia, Mednafen's and libretro's documentation, and leads.
  No maker document for any of their custom chips was searched for on Renesas, NXP, or IBM hosts (research log).
- Game Boy Advance, DS, DSi: GBATEK, read in the open `mgba-emu/gbatek` copy because the author's site returned HTTP 403
  (research log); DSiBrew; Arm's own records for the ARM7TDMI and ARM946E-S manuals, metadata only.
  The copy holds GBATEK's DSi Teak and BPTWL sections,
  which the register closes at the author's site but not in the copy (research log; decision in the pull request).
- Other handhelds: Wikipedia alone, and Aquaplus's page for the P/ECE.

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study, or study only the systems that `R1-11`, `R1-12`, `R1-16`, `R1-18`,
  and `R1-22` name and keep the rest as rows.
- **Costs:** every row adds 16 studies for rows that no survey names,
  or 23 counting the rows whose survey is only an inference, most of them resting on Wikipedia
  (counted from the rows above);
  surveys only leaves out the 3DO, Jaguar, PC-FX, Virtual Boy, and every other handheld here, among others.
- **Gains:** every row gives `R6-01` the widest choice; surveys only keeps the research finite.
- **Used by:** the roadmap today, by the surveys it lists (inference).

### A survey for the systems no survey names

- **What:** let `R1-25` cover the unnamed consoles and handhelds and make it depend on `R1-02`, add surveys for the 3DO,
  Jaguar, and others, or leave them in the catalogue only.
- **Costs:** a wide `R1-25` mixes computers, consoles, and phones; new surveys add roadmap items;
  catalogue only leaves them without an emulator survey.
- **Gains:** each settles where the Virtual Boy, 3DO, and Jaguar are studied.
- **Used by:** the roadmap's wording, which leaves it open.

### What counts as a dedicated game device

- **What:** count a phone or PDA sold for games
  (N-Gage, Zodiac) and an open handheld (GP2X) as dedicated consoles, as emulator hosts, or as neither.
- **Costs:** as consoles, they bring whole operating systems
  (Symbian, Palm OS, Linux) into scope; as hosts, their commercial games have no target.
- **Gains:** a rule the next catalogues can reuse.
- **Used by:** this catalogue lists them and leaves the class open.

### Firmware for systems that need it

- **What:** for each firmware row, run user-supplied firmware, emulate its services at a high level,
  or start from the state firmware leaves.
- **Costs:** user-supplied firmware has no settled lawful route
  (`R0-02`, Summary and "Firmware, keys, and game copies");
  high-level emulation needs a description of the services,
  which for the Saturn is known here only from Copetti's account, which cites a Sega manual that was not opened.
- **Gains:** the three routes differ by system; the Virtual Boy needs none (inference).
- **Used by:** Mednafen and libretro cores ask for firmware images (their documentation); `R2-12` weighs the routes.

### Systems whose protection is cryptographic

- **What:** emulate them only with decrypted or unsigned software, require the user to supply keys, or leave them out.
- **Costs:** `R0-02` records the exposure of each route; the iQue Player re-encrypts each title for one console.
- **Gains:** the first two keep the systems in scope; leaving them out removes the question.
- **Used by:** this catalogue records which systems use signatures or encryption and decides nothing.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is a decision for `R6-01`;
  the survey column shows which rows will have an emulator survey behind them.
- Nearly every home console here needs firmware the project may not obtain (ADR 0001; `R0-02`).
  Whether each can run from its post-boot state or a high-level replacement feeds `R2-12` (inference).
- Cryptographic protection, met earlier in the NTSC Atari 7800's cartridge signature (`R1-05`),
  becomes common in this era.
  The DS, DSi, iQue Player, Pippin, and GP32 rows bring keys and signatures into scope for `R0-02` and
  for the firmware ADR that `R6-03` may propose (inference).
- The PlayStation 1, which the owner wants, has no open hardware hub free of the tainted document in this catalogue;
  `R1-02` and `R1-18` must take one of the routes in `R0-05`, option 8.
- The 3DO Development Repo and the `mgba-emu/gbatek` copy each hold material that the register does not close;
  this feeds a register change and the guard work.

## Open questions

- Does `R1-25` cover the consoles and handhelds no survey names, and should it depend on `R1-02`?
  A decision for the owner.
- Are the N-Gage, Zodiac, and GP2X dedicated game devices or emulator hosts?
  A decision for the owner.
- The GP32, N-Gage, Zodiac, Leapster, and Gizmondo are listed both here and in the `R1-07` catalogue.
  Which catalogue keeps them, and do the handhelds of 2001 to 2005 belong to this era or the next?
  A decision for the owner.
- Should `R1-05` hold the Atari Panther, the Konix Multisystem, and the Super NES CD-ROM?
  A decision for the owner.
- Where does the PlayStation 1's wobble signal sit, and which region strings does the drive check?
  `R1-02` and `R1-18`, from a source that is not tainted.
- Does the Jaguar boot ROM check an encrypted cartridge header, and did any 3DO product use the wobble patent?
  A registered source or a later pass.
- What are the dates and model numbers of the Hi-Saturn, V-Saturn, and Samsung Saturn, and the PC-FXGA's release date?
  A later pass, if Sega Retro or another hub answers.
- What sound hardware do the GP2X and Gizmondo use, and in which countries was the Leapster sold?
  Their articles give only stereo output, a built-in speaker,
  and sale in nine countries directly and seven more for teaching ("GP2X"; "Gizmondo"; "Leapster").
- Which maker hosts still serve manuals for the SH7021, PowerPC 603, 68EC020, V810, and VR4300?
  `R1-02`.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext from `https://en.wikipedia.org/w/index.php?title=<Article>&action=raw`;
each pin is the revision ID.
Five pinned revisions are dated 2026-11-20, the day of reading: "Game Boy Advance", "Nintendo DSi",
"PlayStation Portable", "Amiga CD32", and "Apple Pippin"; the verification pass read every article at its pinned ID.

Wikipedia, home consoles and add-ons:

- "Fifth generation of video game consoles" 1384599937; "List of home video game consoles" 1386685039.
- "PlayStation (console)" 1386319193; "PlayStation technical specifications" 1362538225;
  "PlayStation models" 1386181677; "Net Yaroze" 1378707385; "PocketStation" 1382885501.
- "Nintendo 64" 1386077971; "Nintendo 64 Game Pak" 1386318295; "64DD" 1386308027; "iQue Player" 1355022059.
- "Sega Saturn" 1384300813; "Sega Net Link" 1364854330; "32X" 1385340621.
- "3DO" 1383977414; "3DO Blaster" 1374925870; "Panasonic M2" 1381859043.
- "Atari Jaguar" 1386053059; "Atari Jaguar CD" 1371086294; "PC-FX" 1352943842; "Amiga CD32" 1386758766;
  "FM Towns Marty" 1379254432; "Playdia" 1385569273; "Casio Loopy" 1377306489; "Apple Pippin" 1386811011.
- "Dreamcast" 1386172458; "VMU" 1379027676; "CD-i" 1384443552; "CP System" 1385997383.
- "Nuon (DVD technology)" 1383941718; "Super NES CD-ROM" 1386184486; "Atari Panther" 1336176915;
  "Konix Multisystem" 1382575305; "Super A'Can" 1378214813.

Wikipedia, handhelds:

- "Virtual Boy" 1384432040; "Game Boy Advance" 1386719051; "Game Boy Advance SP" 1382257211;
  "Game Boy Micro" 1372511713; "Game Boy Player" 1385936501; "IQue" 1386607666.
- "Nintendo DS" 1384607359; "Nintendo DSi" 1386756319; "PlayStation Portable" 1386784394.
- "GP32" 1379015467; "GP2X" 1385314903; "N-Gage" 1386180025; "Tapwave Zodiac" 1372920485; "Gizmondo" 1386173978;
  "Leapster" 1385502801; "LeapFrog Didj" 1381158352; "V.Smile" 1385799892; "Dingoo" 1379337765;
  "List of handheld game consoles" 1384273411.
- Japanese Wikipedia, "PIECE" 110504604: `https://ja.wikipedia.org/w/index.php?title=PIECE&action=raw`;
  the research agent's revision query failed (research log), and the ID was taken by the verification pass.

Hubs and references:

- N64brew wiki, "Nintendo 64" (revision 192), "64DD" (5543), "Reality Coprocessor" (5481), "VR4300" (5928), "CIC-NUS"
  (5619), "PIF-NUS" (5759, opening only), "Game Pak" (5144): `https://n64brew.dev/wiki/VR4300?action=raw` and sibling
  pages.
- GBATEK, Markdown copy in mGBA's repository, `gba.md` and `ds.md`, commit `64b5087a`,
  "Extracted from no$gba version 3.06":
  `https://raw.githubusercontent.com/mgba-emu/gbatek/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md`
  and `ds.md` beside it; the DSi Teak and BPTWL sections were not read.
- DSiBrew, "Hardware" (revision 2099901) and "System Menu" (2099609):
  `https://dsibrew.org/w/index.php?title=Hardware&action=raw`.
- Sacred Tech Scroll, Virtual Boy: `http://perfectkiosk.net/stsvb.html`.
- 3DO Development Repo, "start", "documentation/hardware", "documentation/hardware_revisions", "documentation/patents",
  "documentation/encryption", "software/emulation", "software/operating_systems", index pages only:
  `https://3dodev.com/_export/raw/documentation/encryption` and sibling pages.
- Mednafen documentation, "PC-FX", "Sony PlayStation", "Sega Saturn", "Valid as of 1.32.1":
  `https://mednafen.github.io/documentation/pcfx.html` and sibling pages.
- libretro documentation, "Virtual Jaguar", "Opera", "Beetle PC-FX", "PUAE":
  `https://docs.libretro.com/library/opera/` and sibling pages.
- R. Copetti, "PlayStation Architecture", "Nintendo 64 Architecture", "Sega Saturn Architecture",
  and the Nintendo DS and Game Boy Advance articles (leads):
  `https://www.copetti.org/writings/consoles/playstation/` and sibling pages.
- Arm documentation service, records for DDI 0210C and DDI 0201D, metadata only:
  `https://documentation-service.arm.com/documentation/ddi0201/d`.
- Aquaplus, P/ECE product introduction, in Japanese: `https://aquaplus.jp/piece/intr.html`.
- Hasbro Interactive release of 1999-05-14, fan transcription (lead):
  `https://mail.atariage.com/Jaguar/archives/HasbroRights.html`.

Patents, front pages and abstracts:

- US 6,304,971 (Kutaragi and Hirano; Sony): `https://patents.google.com/patent/US6304971B1/en`.
- US 6,239,810 and US 6,190,257 (Nintendo; the first with Silicon Graphics), read from the Patent Office's front pages:
  `https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6239810` and sibling documents.
- US 5,502,462, US 5,572,235, US 5,596,693, and WO 97/45836
  (The 3DO Company; WO 97/45836 with CagEnt Technologies):
  `https://patents.google.com/patent/US5596693A/en` and sibling pages.

Project documents:

- The research roadmap, `docs/roadmap/research.md`, and its era rule as proposed in pull request #22
  (branch `docs/roadmap-era-tiebreak`); `R0-02`; `R0-04`; `R0-05`; ADR 0001; the source register.
- `R1-05`, merged to `main` in pull request #19 and not yet on this branch.
- The `R1-07` catalogue, in progress on branch `docs/r1-07-catalogue-sixth-generation`, for its handheld rows only.
