---
title: "The 32-bit and 64-bit era: catalogue"
roadmap_item: R1-06
status: draft
date: 2026-11-20
---

# The 32-bit and 64-bit era: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold in the 32-bit and 64-bit era
as the [research roadmap][roadmap] draws it, and what hardware, protection, firmware, and sources each has.

It lists 12 home consoles with their variants, two other home systems first sold in 2000
(Nuon players and the E-kara),
5 add-ons and expansion cards, the Virtual Boy, the Game Boy Advance and Nintendo DS families, and the Pixter.
Devices first sold from 2001 that no survey names, such as the GP32, N-Gage, and Gizmondo, are listed once,
in [R1-07][r107] or [R1-08][r108], and appear here only as cross-references.

An open-tier hardware reference beyond Wikipedia was found for the Nintendo 64, the Game Boy Advance, DS, and DSi,
the Virtual Boy, and the 3DO; the PC-FX and Saturn have Mednafen's open documentation.
The PlayStation 1 has a patent for its disc check whose inventors give Sony Corporation's address,
and no open-tier hardware reference free of the tainted document was used here,
although [R0-05][r005] names open candidates.
The Jaguar rests on Wikipedia, libretro's documentation, and leads; the other home consoles on Wikipedia.

Two facts matter most to Rustalgia.
Every one of the 12 home consoles names built-in firmware or a boot stage that the project may not obtain,
except the Playdia, which Wikipedia says has no BIOS although its microcontrollers carry ROM, and the iQue Player,
for which no page read describes any.
The era's protection takes three forms: physical marks on discs, chips in cartridges,
and cryptographic signatures or encryption
(inference from the rows), the last of which brings keys into scope for [R0-02][r002].

The recommendations below plan firmware around high-level replacement or the post-boot state,
and emulate a check's outcome rather than hold keys.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of the 32-bit and 64-bit era were sold, and for each,
  what are its maker, release, processor, video, audio, media, protection, firmware, survey, and sources?
- Covered: home consoles of the fifth generation and their add-ons; the Virtual Boy; the Game Boy Advance, DS,
  and DSi families; and other devices first sold up to the end of 2000 that no survey names,
  as "How the catalogue is built" defines the era.
  How the hardware works is left to the primer ([R1-02][r102]); each family's emulators to its survey
  ([R1-11, R1-12, R1-16, R1-18, and R1-22][surveys]);
  the law on protection, firmware, and keys to [R0-02][r002]; each hub's evaluation to [R0-05][r005].
  The Dreamcast, 3DS, PlayStation 2, PSP, sixth-generation systems,
  and devices first sold from 2001 that no survey names belong to [R1-07][r107] or [R1-08][r108].
  PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles are emulator hosts,
  left to [R3-07][phase3] and [R3-12][phase3] ([roadmap, "Hardware primers"][primers]).
- Researched on 2026-11-20 against the Wikipedia revisions and hub pages listed in Sources.
- How claims were checked: on 2026-11-20 two research agents, one for home consoles and one for handhelds,
  read every page as raw text, Wikipedia through its raw wikitext and PDFs through text extraction or,
  for two patent front pages, as page images
  (research log); no value here comes from a summarising tool unless it is marked "(secondary)".
- Two independent verification passes have run: in the first, six verifiers, each taking a part of the note,
  fetched the sources again and tested 271 claims and quotations; in the second, seven verifiers tested 324
  (research log).
  Each finding was checked against the source once more before the text was changed, and corrections were applied;
  the claims neither pass could check were listed in the pull request.
  A later pass on the same day answered the note's open questions from the sources added below,
  each fetched as raw text, with every quotation confirmed against it (research log).
- Markers: Wikipedia is a tertiary source, and a value with no hub named rests on the article's own text,
  whose citations were not followed. "(inference)" marks reasoning, "(from memory)" a claim no fetched page confirmed,
  and "(lead)" a claim found only in a forum, a chat, a video, or a personal blog, and not relied on;
  Copetti's articles, a personal site that the [register][register] calls a lead, are treated as such.
  A statement that nothing was found records the searches made, not proof of absence.
- Notation: memory sizes that sources give in "KB" or "MB" are written in KiB or MiB,
  because chip sizes are powers of two (inference); media capacities and clocks are as each source gives them.
- Not opened: no firmware, BIOS, boot ROM, disassembly, game, maker manual hosted by others, or emulator code,
  and the tainted PlayStation reference in no form.
  Three cited pages also print key or seed material: N64brew's "PIF-NUS", read for its opening only, its "CIC-NUS",
  and the KEY2 section of the GBATEK copy; none of it was used or recorded (research log).

## Findings

### How the catalogue is built

- The roadmap's rule is "An era holds the systems whose family survey depends on its primer".
  [Pull request #22][pr22] added a second sentence: "Where a survey depends on more than one primer,
  each of its systems belongs to the era of its own generation,
  and the survey depends on the other primers for the hardware that its systems contain or carry over"
  ([roadmap, "Hardware primers"][primers]).
- [R1-11][surveys] (Game Boy Advance), R1-12 (Nintendo DS and DSi), R1-16 (Nintendo 64), and R1-18
  (PlayStation 1) depend on [R1-02][r102] alone ([roadmap, "System family surveys"][surveys]).
  R1-22 (Sega) depends on [R1-01][r101], R1-02, and [R1-03][r103], so by that rule the Saturn is here,
  the Master System, Game Gear, and Genesis are in [R1-05][r105], and the Dreamcast is in [R1-07][r107].
  R1-13 (3DS) and R1-19 (PlayStation 2) depend on R1-02 and R1-03, so the PlayStation 2, sixth-generation
  ([Wikipedia, "PlayStation 2"][w-ps2], infobox), is in R1-07.
  The 3DS is eighth-generation ([Wikipedia, "Nintendo 3DS"][w-3ds], infobox), which neither primer covers;
  R1-07 places it there, following the description of #22 ([R1-07, "How the catalogue is built"][r107-built]).
- By the survey rule the Nintendo DSi (2008) is here, because R1-12 names it,
  although Wikipedia places the DS family in the seventh generation
  ([Wikipedia, "Nintendo DS"][w-ds], infobox); the PSP (2004) is not, because R1-20 depends on R1-03 (roadmap).
- A model of a surveyed family stays with its family, so the iQue Player stays here with the Nintendo 64,
  whose games it runs in a re-encrypted form ([Wikipedia, "iQue Player"][w-ique]).
  The Game Boy Player is a GameCube add-on, so R1-07 lists it (a process call of this pass).
- A system that no survey names is placed by its first sale: to the end of 2000 here, from 2001 to 21 November 2005,
  the Xbox 360's first sale, in [R1-07][r107], and later in [R1-08][r108]
  (the project's rule for every catalogue, set on 2026-11-20).
  Each device is listed in one catalogue; the others carry a one-line cross-reference.
- A device that runs emulators of other systems is a host, not a system to emulate;
  the N-Gage and Tapwave Zodiac are dedicated game devices,
  because each runs its own game software and neither is sold to run other systems' games, and the GP2X line is a host
  (the owner's rule as applied on 2026-11-20).
- A row is one machine or one compatible family.
  Revisions, regional models, licensed models, and combined units are folded into the row of the machine they run.
- "Survey" names the family survey whose title includes the system, or the system it is a model
  or add-on of; "(inference)" marks a survey that does not name the system, and a dash means none does.
- "Hub" names the best source other than Wikipedia,
  with its tier in the [register][register] and "lead" where it is one;
  a dash means Wikipedia was the only source found.
- Regions: NA North America, UK United Kingdom, JP Japan, KR South Korea, CN China, SG Singapore.

### Home consoles

Identity, with the hub where one exists:

| System (other names) | Maker | First release | Survey | Hub (tier) |
|---|---|---|---|---|
| PlayStation 1 (PlayStation, PS one) | Sony | JP 1994-12-03; NA 1995-09-09 | R1-18 | Sony inventors' patent (open) |
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
| 3DO | ARM60, 12.5 MHz | Madam; cel engine | DSP in Clio |
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
| PlayStation 1 | CD-ROM XA; memory card | wobble code in the disc's TOC area; region | 512 KiB BIOS ROM |
| Nintendo 64 | Game Pak; Controller Pak | CIC chip checked by PIF; cartridge shape | PIF; IPL3 on cartridge |
| iQue Player | memory card | per-console encryption | not described |
| Sega Saturn | CD-ROM; cartridge slot | ring outside program area (lead); region | firmware ROM, by region group |
| 3DO | CD-ROM | RSA-signed executables, by one source | firmware ROM per model |
| Atari Jaguar | ROM cartridge | encrypted software (Wikipedia, tertiary) | boot ROM |
| PC-FX | CD-ROM | none described | BIOS 1.00 |
| Amiga CD32 | CD-ROM, ISO 9660 | none described | Kickstart 3.1 and CD32 ROM |
| FM Towns Marty | CD-ROM; 3.5-inch floppy | none described | BIOS |
| Playdia | CD-ROM (QIS) | none described | no BIOS, by Wikipedia; ROM in its CPU |
| Casio Loopy | ROM cartridge | none described | 2 MiB ROM; mask ROM in CPU (lead) |
| Pippin | CD-ROM | RSA disc signatures | ROM; operating system on disc |

- Sources by row: each row rests on the system's Wikipedia article, read raw,
  unless a finding below names another source.
  The PlayStation 1 hardware values are from [Wikipedia, "PlayStation technical specifications"][w-psspec],
  the CD32 sound row from [Wikipedia, "Amiga CD32"][w-cd32], "Specifications",
  and the Jaguar's boot ROM from [libretro's documentation, "Virtual Jaguar"][lr-vj].

PlayStation 1:

- A patent by Ken Kutaragi and Tetsuya Hirano describes the disc check:
  "The security code is stored through modulating an offset of the physical position of a plurality of data bits from a
  nominal track position" ([US 6,304,971][us6304971], abstract; priority 1994-11-18).
  Its front page names no assignee and gives both inventors in care of Sony Corporation;
  Google Patents gives its original assignee as "Individual" and its current ones as Sony Interactive Entertainment
  and Sony Network Entertainment Platform, so it counts here as maker material by Sony staff (inference).
- The same patent places the code: "the system performs an initial check to determine whether
  or not the disc contains a 'wobbled' code in the TOC (Table of Contents) area of the disc"
  (US 6,304,971, detailed description).
  It repeats the code several times in that area, on a 22.05 kHz carrier, half the CD sampling rate,
  keyed in NRZ format (same).
- On a compact disc the table of contents is held in the subcode of the lead-in
  ([Wikipedia, "Compact Disc Digital Audio"][w-cdda], "Data structure"),
  so the code sits in the lead-in (inference from the two sources).
  That agrees with [Wikipedia, "PlayStation models"][w-psmodels], "Debugging units",
  which puts the region code in the lead-in, and with Copetti's account
  ([Copetti, "PlayStation Architecture"][cop-ps], "Anti-piracy / Region Lock"; lead).
  [Wikipedia, "PlayStation (console)"][w-ps], "Copy protection system", which puts the signal in the pregap,
  is the outlier.
- The patent says the code "depends on the particular country in which the disc is to be sold",
  and its examples are placeholders for Japan, the United States, and Europe, not the strings a drive checks
  (US 6,304,971, detailed description).
  No clean source read gives those strings: they were searched for in the patent's full text,
  in [Walker's compilation][walker], whose glossary names SCEI, SCEA,
  and SCEE only as companies and whose country codes are for memory-card file names, in [Doomed's "cdinfo.txt"][doomed],
  and in the two Wikipedia articles above.
  A value known only from firmware or a tainted source is not recorded, and an emulator does not need it,
  because it reports the drive's result ("Patterns across the catalogue").
  Copetti's four-letter region string is a lead with that limit.
- The last digit of the model number gives the region: 0 Japan, 1 North America, 2 PAL, 3 Asia
  ([Wikipedia, "PlayStation models"][w-psmodels], "Region codes", which cites a Sony service manual not opened).
- [Wikipedia's specification page][w-psspec] cites the tainted Nocash document for one value, the CD-ROM's data buffer
  (reference list, read raw); this catalogue does not record that value.
  A search of Walker's compilation and Doomed's text for "buffer" found GPU, DMA, and TLB buffers only.
  The processor's description differs between articles: "LSI CoreWare CW33000-based" in the specification page,
  "LSI LR333x0" in [the fifth-generation comparison][w-fifth].
- Variants ([Wikipedia, "PlayStation models"][w-psmodels]):
  - Revision C hardware (late 1995) replaced the GPU's dual-ported VRAM with SGRAM
    ("Revisions", which cites a video);
    "Debugging units" adds, citing nothing, that it blends faster and fixes minor bugs of the older silicon.
  - The PS one (JP 2000-07-07) has the late hardware in a smaller case, with no serial or parallel port.
  - Debug units have a reprogrammed CD controller that treats any disc with a data track as licensed
    ("Debugging units").
  - The Net Yaroze kit (JP 1996-06, from the article's opening section) has different boot ROMs, no region lock,
    and "a different encryption scheme", and boots programs sent over serial only with a key disc and an access card
    ([Wikipedia, "Net Yaroze"][w-yaroze], "Contents").

Nintendo 64 and iQue Player:

- N64brew describes the processor as a slightly modified VR4300 with six pins moved,
  and records the processor-revision values read on retail units and on the iQue Player
  ([N64brew, "VR4300"][n64-vr4300]).
- A Nintendo patent describes the peripheral interface as handling the controllers
  and checking the cartridge's security chip:
  it is used "for performing game authenticating security checks continuously during game play"
  ([US 6,190,257][us6190257], abstract, read from the Patent Office's front page).
- N64brew says that each lock-out chip variant pairs with a third boot stage in the cartridge ROM,
  which the PIF verifies by checksum while the processor runs the second stage,
  so an emulator must select the variant per game (N64brew, "CIC-NUS"; the selection is an inference).
  The page's address, `n64brew.dev/wiki/CIC-NUS`, is given without a link because the page prints a boot secret.
- Region is set by cartridge shape and an NTSC or PAL lock-out chip
  ([Wikipedia, "Nintendo 64 Game Pak"][w-gamepak], "Regional lockout").
- Nintendo and Silicon Graphics were the original assignees of [US 6,239,810][us6239810], on the coprocessor,
  whose earliest priority date is 1995-11-22
  (front page); Google Patents lists Nintendo, RPX, and Morgan Stanley as its current assignees.
- iQue Player: "Newly purchased titles were loaded to memory cards as encrypted files
  and re-encrypted on first launch using a console-specific private key" ([Wikipedia, "iQue Player"][w-ique], "Games").
  BroadOn developed its cryptographic security system; games were loaded at kiosks,
  and from October 2004 over USB from a PC (same article).

Sega Saturn:

- Copetti describes a ring of non-standard data outside the program area, checked once by the SH-1 in the drive
  ([Copetti, "Sega Saturn Architecture"][cop-ss], "Anti-Piracy & Homebrew"; lead,
  whose sources for this section are unregistered).
  Its account of the boot ROM cites a Sega boot ROM manual that was not opened, so those details are not relied on
  (same article, "Operating System").
- Mednafen needs one firmware image for Japanese games and one for North American and European games,
  and detects region from the game header with a database of exceptions
  ([Mednafen documentation, "Sega Saturn"][mdf-ss]).
- Licensed models, from [Japanese Wikipedia, "セガサターン"][ja-saturn], "バリエーション"
  (the summary is the note's own translation):
  - V-Saturn (Victor, JVC): RG-JX1, also sold as RG-JX1 (X) and (Y), released on 1994-11-22,
    the Saturn's own launch day; the RG-JX2 (X), (Y), and (Z) followed on 1996-06-07.
  - Hi-Saturn (Hitachi): the multimedia player MMP-1, also MMP-1-1 and MMP-1-2, released on 1995-04-01 at 64,800 yen,
    with an expansion card for its cartridge slot that adds Video CD and Photo CD playback;
    the MMP-11 followed in October 1996, and a smaller in-car model with navigation, the MMP-1000NV, on 1995-12-06.
  - Samsung Saturn (South Korea): SPC-SATURN, SPC-ST, and SPC-ST2, released in February 1995,
    with the same region setting as Japan's, so that Japanese Saturn software runs on it.

3DO:

- The licensed models are Panasonic's FZ-1, FZ-10, and ROBO changer, GoldStar's GDO-101, GDO-101M, GDO-202, and GDO-203,
  Sanyo's TRY, Samsung's DMB-800, and Creative's 3DO Blaster card
  ([Wikipedia, "3DO"][w-3do], "Licensed systems"; [Wikipedia, "3DO Blaster"][w-blaster]).
- The 3DO Company's patents describe the cel engine:
  "Linked lists of spryte control blocks are prepared in memory and traversed by a spryte rendering engine"
  ([US 5,596,693][us5596693], abstract);
  others cover display lists and intensity effects ([US 5,502,462][us5502462]; [US 5,572,235][us5572235]).
- Protection is disputed between sources.
  Wikipedia says the system has neither regional lockout nor copy protection ("3DO", "Hardware").
  The [3DO Development Repo][3do-enc] says that the 3DO Company signed executables
  and the operating system with 512-bit RSA, so that retail and arcade systems would not run unlicensed software
  ("documentation/encryption", paraphrased; its key pages were not opened).
- An international application by the 3DO Company and CagEnt Technologies, filed in 1997 with priority from 1996-05-31,
  describes a copy-protected disc with a radial wobble ([WO 97/45836][wo9745836], abstract and Google Patents record).
  Its United States counterpart is [US 5,809,006][us5809006] (CagEnt Technologies, same priority).
  No product is shown to have used it (Open questions).
- Firmware differs by model: libretro's Opera core lists firmware images by model, among them patched images
  ([libretro documentation, "Opera"][lr-opera]),
  and a missing kanji font in some models' firmware breaks a few Japanese games ([Wikipedia, "3DO"][w-3do], "Hardware").
- The Development Repo describes Portfolio's features without saying where Portfolio is stored
  ([3DO Development Repo, "software/operating_systems"][3do-os]),
  and Wikipedia lists a multitasking operating system and firmware per model, also without a location ("3DO").
  That the operating system is a signed file loaded like an executable is an inference from the signing statement above.

Atari Jaguar:

- Early units made by IBM have an analogue-input converter and hardware bugs that later IBM and JVC units fix,
  and a memory-controller flaw limits running code from RAM on the custom processors
  ([Wikipedia, "Atari Jaguar"][w-jaguar], "Technical specifications").
- [libretro's Virtual Jaguar core][lr-vj] carries the console's boot ROM.
- A retail unit boots only encrypted software, by inference from Wikipedia's list of homebrew games:
  it says that early homebrew CDs were not encrypted, and so needed a bypass cartridge or a booting program to run
  ([Wikipedia, "List of Atari Jaguar homebrew games"][w-jaghb], lead section; paraphrased).
  The article adds that encryption material for both cartridge and CD software was released between 2001 and 2003,
  so that software can run without development hardware (same; paraphrased).
  Its citations concern keys and were not opened, and their addresses are not recorded.
  What the boot ROM checks beyond that is known only from disassembly-based leads, which this note does not use.
  A [Google Patents][gpatents] search for assignee "Atari" with cartridge and encryption, authentication,
  or signature terms, priority before 1997, returned only Atari, Inc. graphics patents of 1979 to 1984.
- Hasbro's 1999 release says "it has released all rights that it may have to the vintage Atari hardware platform,
  the Jaguar"; it lets developers publish Jaguar software without a licence agreement and keeps its trade marks,
  and it does not mention patents or the public domain
  ([Hasbro Interactive release of 1999-05-14][hasbro], fan transcription; lead).
  The lead of [Wikipedia, "Atari Jaguar"][w-jaguar] says instead
  that Hasbro released the Jaguar patents into the public domain in 1999; the two disagree.

Other home consoles:

- PC-FX: [Mednafen's documentation][mdf-pcfx] names BIOS version 1.00 as the image it needs and recommends,
  and says it emulates the motion decoder's run-length and JPEG-like modes ("PC-FX").
  Wikipedia says the console has no polygon processor by design ([Wikipedia, "PC-FX"][w-pcfx], "History").
- Amiga CD32: games use ISO 9660 level 2 mode 1; the machine runs most CDTV titles,
  and a hidden boot menu selects 50 or 60 Hz, which some games need
  ([Wikipedia, "Amiga CD32"][w-cd32], "Hardware", "Software").
  It was sold in Europe, Australia, Canada, and Brazil
  (same article, opening section),
  and not in the United States, because of an import injunction (same article, "History").
- FM Towns Marty: its infobox names Towns OS as the operating system without saying where it is stored,
  and its floppy disks are formatted from the BIOS's interface ([Wikipedia, "FM Towns Marty"][w-marty]).
- Playdia: Wikipedia says it has no BIOS or menu and shows a blue screen when started without a disc
  ([Wikipedia, "Playdia"][w-playdia]);
  its "Hardware" list gives 8 kb of ROM in the Toshiba microcontroller and 16 kb in an NEC one,
  without saying what that ROM holds.
  It is placed here by its first sale (see "Boundary cases").
- Casio Loopy: a built-in thermal printer makes colour stickers, and the console has 2 MB of ROM
  ([Wikipedia, "Casio Loopy"][w-loopy], infobox and opening section).
  That its processor has internal mask ROM
  that has not been dumped is known only from a search-result summary of emulator comments (secondary; lead).
- Pippin: "RSA's public/private key system was used to create the authentication system on the Pippin platform"
  ([Wikipedia, "Apple Pippin"][w-pippin], "System software");
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
| 3DO Blaster | PC (ISA) | 1994 | a 3DO on a card | as 3DO (inference) | — |
| PC-FXGA | PC (PC-9800, DOS/V) | JP 1995-12-08; DOS/V 1996-06 | PC-FX plus HuC6273 3D chip | not described | — |

- Sources by row: each add-on's Wikipedia article, and the PC-FXGA's dates from Japanese Wikipedia;
  the 64DD's firmware cell from [N64brew, "64DD"][n64-64dd], "Physical Memory Map",
  and the Jaguar CD's from [libretro's "Virtual Jaguar"][lr-vj].
- Cross-references: the Game Boy Player
  (GameCube add-on, JP 2003-03-21)
  is listed in [R1-07][r107], and its survey R1-11 is an inference only; the 32X
  (Genesis add-on, NA 1994-11-21, two SH-2 processors)
  is listed in [R1-05][r105], with the Genesis, whose survey R1-22 puts it in that era.
- The 64DD's date is 1999-12-11 by Wikipedia's infobox and 1999-12-01 by N64brew and Copetti
  ([Wikipedia, "64DD"][w-64dd]; [N64brew, "64DD"][n64-64dd]; [Copetti, "Nintendo 64 Architecture"][cop-n64]; lead).
  It reads 64 MB magnetic disks, has a 32-bit coprocessor for disk operations and a real-time clock,
  and was sold in Japan only; the Randnet service ran from 1999-12-13 to 2001-02-28
  ("64DD", opening section, "Hardware", "Randnet").
  Disk software carries no lock-out chip, and the drive's firmware completes the secure boot (N64brew, "CIC-NUS").
- Jaguar CD discs use a format based on audio CD rather than CD-ROM data modes, up to 790 MB, whose incompatibility,
  the article says, foils casual piracy
  ([Wikipedia, "Atari Jaguar CD"][w-jagcd], "Technicals");
  the article gives the release date without a region. [libretro's Virtual Jaguar core][lr-vj] compiles the boot ROM
  and both CD BIOS images into itself; those images are firmware, which the project never obtains
  ([ADR 0001, "Context"][adr-context]),
  whatever Hasbro's 1999 release means for them, and the repository is not registered.
- The PocketStation is a PlayStation memory card with a screen, an ARM7T processor at up to 7.995 MHz, 2 KiB SRAM,
  128 KiB flash, infrared, and a clock; its software usually comes on PlayStation discs,
  and can also be downloaded through the console to a memory card ([Wikipedia, "PocketStation"][w-pocket], "Software").
  It is both a handheld and a peripheral; no survey names it.
- The 3DO Blaster needs a Sound Blaster and a CD drive with a Panasonic interface
  ([Wikipedia, "3DO Blaster"][w-blaster]).
- The PC-FXGA adds a 3D chip that the console lacks ([Wikipedia, "PC-FX"][w-pcfx], "PC-FXGA").
  Its PC-9800 board was released on 1995-12-08 and its DOS/V (ISA) board in June 1996;
  a PCI version was announced and never made
  ([Japanese Wikipedia, "PC-FX"][ja-pcfx], "発売後" and "チップセットについて";
  the summary is the note's own translation).
  The same section gives a PC-FX board for the 98CanBe (FX-98IF) and a SCSI adapter, both from 1995-03-17.
- Online hardware: the Saturn's Net Link modem (1996)
  ([Wikipedia, "Sega Net Link"][w-netlink])
  and the 64DD's modem cartridge are peripherals, and Randnet a service, not systems ("64DD", "Randnet").

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
| Nintendo DSi | ARM9 at 66 or 133 MHz; ARM7; Teak DSP | as DS; 2 cameras | as DS, new codec | NAND software; RSA |
| DSi XL | as DSi | 4.2 in. screens | as DSi | as DSi |

- Sources by row: the Virtual Boy row rests on the [Sacred Tech Scroll][sts];
  the Game Boy Advance and DS rows on GBATEK's "GBA Technical Data", "DS Technical Data",
  their "Sound" and "Internal Memory" sections, and the bullets below, except the DS processor clocks,
  from [Wikipedia, "Nintendo DS"][w-ds], infobox, where GBATEK's table gives 66 MHz;
  the DSi rows on [DSiBrew, "Hardware"][dsibrew], which calls the codec "possibly a TI codec";
  the Game Boy Micro's processor cell on [Wikipedia, "Game Boy Micro"][w-micro], "Design and specifications";
  dates and screen sizes on each system's Wikipedia article.
- GBATEK was read in the open `mgba-emu/gbatek` copy at commit `64b5087a`: its [GBA chapter][gbatek-gba] is linked,
  and its DS chapter (`ds.md`) is cited by section name without a link,
  because that file also prints the DS cartridge encryption seeds.

Virtual Boy:

- The [Sacred Tech Scroll][sts] gives a modified V810 called NVC with a 16-bit bus, six sound channels,
  and a reset address inside the game pak's ROM
  ("CPU", "VSU", "System Reset", "ROM Format"), so no console firmware runs (inference).
- Its pak header holds a title, maker code, game code, and version, and the document describes no logo, checksum,
  or other check (same, "ROM Header"; that there is no lock-out is an inference from that).
- Each eye's display is a column of red LEDs swept by an oscillating mirror, from Reflection Technology
  (same, display overview).
  The link port allows two units to communicate, but no commercial game used it (same, "Communication Port").

Game Boy Advance family:

- GBATEK gives the system clock as 16.78 MHz, defined as 16 × 1024 × 1024 Hz
  ([GBATEK copy][gbatek-gba], "LCD Dimensions and Timings", "System Clock"),
  and says "The GBA's separate 8bit/32bit CPU modes cannot be operated simultaneously"
  (same copy, "GBA Technical Data").
  Wikipedia gives four rounded values for the same clock across its three articles,
  and names the 8-bit core the Sharp SM83 ([Wikipedia, "Game Boy Advance"][w-gba], "Hardware").
- A frame is 228 lines and 280,896 cycles; that gives 59.7275 Hz
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
  ([Wikipedia, "Game Boy Micro"][w-micro], "Software and hardware", "Design and specifications").

Nintendo DS family:

- GBATEK gives a bus clock of 33.513982 MHz with the ARM9 at twice it
  (GBATEK copy, DS chapter, "DS Memory Timings", "System Clock"),
  and says "the real 66MHz can be used only with cache and tcm,
  all other memory and I/O accesses are delayed to the 33MHz bus clock" (same chapter, "DS Technical Data").
  Wikipedia's infobox gives "256 MB" of flash where its text and GBATEK give 256 KiB of firmware flash
  ([Wikipedia, "Nintendo DS"][w-ds], infobox and "Hardware"; GBATEK copy, "Internal Memory").
- DS cards use an encrypted bus.
  The BIOS loads a "secure area" with commands encrypted by a scheme keyed by the game code,
  and later transfers are scrambled by a seeded stream; Download Play programs need an RSA signature
  (GBATEK copy, DS chapter, "DS Cartridge Secure Area", "KEY1 - Gamecode / Idcode Encryption",
  the title of "DS Encryption by Random Seed (KEY2)", whose first subsection lists seed values and was not read,
  "DS Wifi Nintendo DS Download Play"; [Copetti's Nintendo DS article][cop-nds], "Anti-Piracy and Homebrew",
  which cites GBATEK; lead).
  No table or seed is recorded here.
- DS cards are region-free, except that iQue DS games do not run on DS units of other regions
  ([Wikipedia, "Nintendo DS"][w-ds], "China");
  "Regional division" gives missing Chinese glyphs as the reason and says, marked "Citation needed",
  that the DSi and 3DS lift the restriction, and GBATEK reports a firmware-version check (GBATEK copy, "iQue Notes").
- The DS plays Game Boy Advance paks in its second slot, not Game Boy or Game Boy Color paks
  ("Nintendo DS", "Compatibility"); the DSi has no such slot (GBATEK copy, "GBA Slot").
- The DSi's ARM9 runs at 133 MHz in DSi mode and 66 MHz in DS mode, beside a CEVA XpertTeak signal processor at 133 MHz
  ([DSiBrew, "Hardware"][dsibrew]); Wikipedia gives the ARM9 as 133 MHz ([Wikipedia, "Nintendo DSi"][w-dsi], infobox).
  GBATEK's Teak sections are closed in the register and were not read.
  The system software is on eMMC NAND of 240 MB, plus 16 MB that DSiBrew takes to be reserved for wear levelling,
  with an SD card slot (DSiBrew, "Hardware").
- GBATEK says DSi cards carry an extended header with an RSA signature, which hinders unlicensed code
  (GBATEK copy, DS chapter, "DSi Basic Differences to NDS"; read by the research agent and the first pass,
  not by the second, because the file also prints seed values).
- The DSi is region-locked for its own software and not for DS cards,
  though a note in the same article says IGN found a DSi-enhanced card region-locked
  ([Wikipedia, "Nintendo DSi"][w-dsi], "Software library"),
  and DSiBrew lists two board revisions of the DSi and one of the DSi XL (DSiBrew, "Hardware Revisions").
- GBATEK calls the iQue Game Boy Advance "essentially same as" Nintendo's,
  and gives the iQue DS a larger firmware chip holding simplified Chinese characters
  (GBATEK copy, "iQue Notes", "Internal Memory").

### Other systems first sold to 2000

| System (other names) | Maker | First release | CPU | Media | Class |
|---|---|---|---|---|---|
| Nuon | VM Labs; Samsung, Toshiba, RCA, Motorola devices | 2000-07 | four Nuon MPEs, 54 or 108 MHz | DVD | combined |
| E-kara | Takara (Hasbro in the US) | JP 2000-10-20; NA 2001-10-06 | not named | song cartridge | toy |
| Pixter and its models | Rehco; Fisher-Price | 2000 | 6502-based; Color: ARM7TDMI, 70 MHz | cartridge | handheld |

- [R1-07][r107] first listed these three; they are here because each was first sold in 2000.
  None has a survey or a hub.
- Nuon is a technology built into DVD players and one set-top box, not a console of its own: Samsung, Toshiba,
  and RCA sold Nuon DVD players, and Motorola a set-top box ([Wikipedia, "Nuon (DVD technology)"][w-nuon], "History").
  Its processors are four 128-bit VLIW media processing elements operating on scalars of at most 32 bits,
  with no hardware floating point, beside a microcontroller, 32 MB of DRAM, 512 KB of sound RAM,
  and 24 KB of programmable ROM (same, "Specification").
  By November 2004 no Nuon player was shipping (same, "History").
- The E-kara's main unit is a microphone, and songs and some games come on cartridges inserted into it
  ([Wikipedia, "E-kara"][w-ekara], opening section and "Karaoke functions"); its infobox names no processor.
- The Pixter is a children's touchscreen drawing handheld, marketed from 2000 to 2007
  ([Wikipedia, "Pixter"][w-pixter], opening section).
  Its model table gives a Sunplus system-on-chip based on a 6502 for the original, Plus, 2.0, and Pocket models,
  and a Sharp LH75411 for the Pixter Color, with a 70 MHz ARM7TDMI; the table cites a personal page for the processors
  (same, "Models").
- No protection is described for any of the three, by a search of each article for "protect", "encrypt", "region",
  and "BIOS" (research log).

### Cross-references to other catalogues

| Device | First sale | Listed in |
|---|---|---|
| GP32 | KR 2001-11-23 | [R1-07][r107] |
| P/ECE (PIECE) | JP 2001-11-30 | R1-07 |
| N-Gage, N-Gage QD | 2003-10-07 | R1-07 |
| Tapwave Zodiac | 2003-10 | R1-07 |
| Leapster, L-Max | 2003-10-07 | R1-07 |
| V.Smile Pocket | 2004 | R1-07, with the V.Smile |
| Gizmondo | UK 2005-03-19 | R1-07 |
| GP2X line | KR 2005-11-10 | R1-07 and [R1-08][r108], as emulator hosts |
| LeapFrog Didj | 2008 | R1-08 |
| Dingoo A320 | 2009 | R1-08, as an emulator host |
| Game Boy Player | JP 2003-03-21 | R1-07 |
| 32X | NA 1994-11-21 | [R1-05][r105], with the Genesis |

- First-sale dates are from each device's Wikipedia article as read for this note
  ([GP32][w-gp32]; [N-Gage][w-ngage]; [Tapwave Zodiac][w-zodiac]; [Leapster][w-leapster]; [V.Smile][w-vsmile];
  [Gizmondo][w-gizmondo]; [GP2X][w-gp2x]; [LeapFrog Didj][w-didj]; [Dingoo][w-dingoo]; [Game Boy Player][w-gbp];
  [32X][w-32x]), and the P/ECE's from [Japanese Wikipedia, "PIECE"][ja-piece].
- Placement follows the first-sale rule in "How the catalogue is built".

### Emulator hosts and cancelled machines

- The PlayStation Classic (2018-12-03) runs PlayStation games in an emulator on a MediaTek system with four Cortex-A35
  cores ([Wikipedia, "PlayStation (console)"][w-ps], "PlayStation Classic").
  It is an emulator host, left to [R3-07][phase3] and R3-12.
- The Panasonic M2, designed by The 3DO Company with two PowerPC 602 processors, was cancelled as a console in 1997,
  shipped in 1998 in two multimedia players, and was used in a Konami arcade board
  ([Wikipedia, "Panasonic M2"][w-m2], "Use in other hardware", where the players' sentence is marked "citation needed").
- Cancelled, and left out of every catalogue, because a catalogue lists systems that were sold
  ([roadmap, "Hardware primers"][primers]):
  the Super NES CD-ROM and Sony's hybrid ([Wikipedia, "Super NES CD-ROM"][w-snescd]), the Atari Panther
  ([Wikipedia, "Atari Panther"][w-panther]),
  the Jaguar Duo ([Wikipedia, "Atari Jaguar"][w-jaguar]), the Sega Neptune
  ([Wikipedia, "Fifth generation of video game consoles"][w-fifth], "Other consoles"),
  the Saturn with a built-in modem ([Wikipedia, "Sega Saturn"][w-saturn]), and the Konix Multisystem
  ([Wikipedia, "Konix Multisystem"][w-konix]).
  They are named here because the Panther and Konix articles name the Jaguar as successor or relative,
  and the Super NES CD-ROM article covers Sony's hybrid, named "PlayStation" (same articles).
  Three are not of this era by their articles: the Panther is fourth-generation and was planned as 16-bit,
  at one point as 32-bit, the Konix has a 16-bit 8086, and the Super NES CD-ROM is an add-on to a 16-bit console.
- Arcade boards built from these consoles appear in the articles read: the Aleck 64
  (Nintendo 64),
  ST-V (Saturn), CoJag (Jaguar), American Laser Games' 3DO boards, Konami's M2 board, and the CUBO CD32
  (each base system's article).
  [R1-24][surveys] depends on R1-01 only (roadmap).

### Boundary cases

| System | Word-size rule | Wikipedia generation | Placed here as |
|---|---|---|---|
| Game Boy Advance family | 32-bit | sixth | here, by survey R1-11 |
| Nintendo DS and DSi | 32-bit | seventh | here, by survey R1-12 |
| iQue Player | 64-bit | fifth | here, as a Nintendo 64 model (survey R1-16, inference) |
| Virtual Boy | 32-bit | fifth | here, by first sale |
| Playdia | 8-bit | fifth | here, by first sale; R1-05 left it here |
| PC-FX, Amiga CD32 | 32-bit | fifth | here, by first sale |
| FM Towns Marty | 32-bit core, 16-bit bus | fifth (category fourth) | here, by first sale |
| PocketStation | 32-bit | fifth | add-on row here, by first sale |
| Nuon | 128-bit MPEs; 32-bit scalars | sixth | here, by first sale |
| 32X | 32-bit | fifth | row in R1-05, an add-on to the Genesis |
| CD-i | 16-bit bus | fourth | row in R1-05 |
| Super A'Can; CPS Changer | 16-bit | fifth | rows in R1-05 |
| PSP | 32-bit (MIPS32; inference) | seventh | not here: R1-07, by survey R1-20 |
| Dreamcast and its VMU | 32-bit; 8-bit | sixth | not here: R1-07, by generation under the rule of #22 |
| 3DS; PlayStation 2 | not checked | eighth; sixth | not here: R1-07, as R1-07 records |

- The sources for each placement are the roadmap's survey dependencies, the rule of [#22][pr22], the first-sale rule,
  and each system's Wikipedia article, including [Wikipedia, "Dreamcast"][w-dreamcast], ["VMU"][w-vmu], ["CD-i"][w-cdi],
  and ["CP System"][w-cps].
  Wikipedia's generation for the GBA, DS, DSi, PocketStation, and iQue Player is from their infoboxes;
  the [Super A'Can][w-acan] and CPS Changer appear in the fifth-generation article's gallery
  and carry the fourth-generation category, and [R1-05][r105] keeps them by word size.
- The Marty's bus and category are from "FM Towns Marty", the Nuon's word size from "Nuon
  (DVD technology)",
  the Dreamcast's 32-bit SH-4 from "Dreamcast", the iQue Player's from "iQue Player", "Technical details",
  and the GBA's and DS's from the GBATEK copy; word sizes for the Playdia, CD-i, and VMU are from R1-05,
  and the PSP's is inferred from "MIPS32" in [its infobox][w-psp].
- [R1-24 and R1-25][surveys] (arcade; other handhelds and home computers) depend on [R1-01][r101] only,
  so the computer-derived consoles and the other systems here have no survey whose primer covers them
  (roadmap; inference).
- The fifth-generation article's gallery also names Koei's PasoGo (JP 1996), a handheld for the game of Go
  ([Wikipedia, "Fifth generation of video game consoles"][w-fifth], "Other handhelds");
  it has no English article, its hardware was not found, and so it has no row here or in R1-05.

### Patterns across the catalogue

- Processor families: MIPS runs the PlayStation 1, Nintendo 64, and iQue Player;
  Hitachi's SuperH runs the Saturn and the Casio Loopy; Arm cores run the 3DO, the Game Boy Advance and DS families,
  the PocketStation, and the Pixter Color; PowerPC runs the Pippin and the M2; the 68000 family runs the Jaguar,
  the CD32, and the Saturn's sound processor; NEC's V810 runs the Virtual Boy and the PC-FX
  (rows above; the grouping is the note's).
- Two machines reuse earlier chips: the PC-FX uses the HuC6270 video chip
  ([Wikipedia, "PC-FX"][w-pcfx], infobox and "Technical specifications"),
  which [R1-05][r105] lists in its PC Engine row, and the Game Boy Advance carries a Game Boy processor for older games
  ([GBATEK copy][gbatek-gba]).
- Protection takes three forms (inference from the rows): physical marks checked in the drive
  (the PlayStation 1's wobble, the Saturn's ring);
  a chip in each cartridge checked by the console (the Nintendo 64); and cryptographic signatures or encryption
  (the 3DO by one source, the Pippin, the iQue Player, the DS and DSi cards, and the Jaguar by a tertiary source).
  For the last form, booting retail software in the original way needs keys, which notes never hold ([R0-04][r004]).
  The last form is not new to this era: R1-05 records the NTSC Atari 7800's cartridge signature.
  The Jaguar CD's disc format deters copying by incompatibility rather than by a check (inference).
- Firmware: every one of the 12 home consoles names firmware or a boot stage except the Playdia,
  whose ROM is not described, and the iQue Player; so do the 64DD, Jaguar CD, Game Boy Advance, and DS families.
  The Virtual Boy is the only system found to start in cartridge ROM
  (rows above; the Virtual Boy point is an inference from its reset address).
- Disc images do not carry the PlayStation 1's wobble or the Saturn's ring,
  because both sit outside the user data that an image holds
  (inference from where the marks sit),
  so an emulator reports the drive's result instead of reading the mark (inference).

### Coverage of sources

- PlayStation 1: the maker patent covers the disc check only.
  No open-tier hardware reference free of the tainted document was used for hardware facts here;
  [R0-05][r005] names open candidates,
  [Walker's compilation][walker] and the text files of 1999 to 2000 by Doomed and bITmASTER.
  Walker's compilation and [Doomed's "cdinfo.txt"][doomed] were searched for this note's region-string
  and buffer questions only; Amidog's wiki, which the [register][register] opens for its text, was not opened
  (research log).
  Wikipedia's specification page cites the tainted document for one value.
- Copetti's PlayStation article is a lead whose sources for its region and boot sections are a video,
  a modification project, a tutorial, and a BIOS translation credited to psxdev and hosted on emudev.org,
  which the register opens as a lead.
- Nintendo 64: [N64brew][n64-vr4300] (open) and two maker patents.
  N64brew links a copy of NEC's VR4300 manual that it hosts,
  which is maker material hosted by others and was not opened.
  Its PIF page (`n64brew.dev/wiki/PIF-NUS`) holds secret keys and its CIC page prints a boot secret;
  neither was recorded, and both are now closed in the register, so the guard blocks them.
- Saturn: [Copetti][cop-ss] (lead), [Mednafen's documentation][mdf-ss]
  (open prose of a walled emulator),
  and English and [Japanese Wikipedia][ja-saturn]; Sega Retro served a bot check and the Yabause wiki refused access
  (research log).
  No archive capture of either was needed.
- 3DO: maker patents and the [3DO Development Repo][3do-start] (open).
  That site also indexes 3DO Company documents dated 1993; Portfolio operating-system source for the 3DO,
  uploaded in 2022 with no origin stated, and for the M2, which its pages say came from a former M2 engineer's archives;
  and key pages.
  None was opened, and those paths are now closed in the register, beside its existing lines for the site's source, ROM,
  and kit pages and a GitHub copy of Portfolio source (research log).
- Jaguar, PC-FX, CD32, Marty, Playdia, Loopy, Pippin: Wikipedia, Mednafen's and libretro's documentation, and leads.
- Makers' own manuals for the custom-chip processors were found, and left to [R1-02][r102] to read:
  - Renesas serves the [SH7020 and SH7021 hardware manual][ren-sh7021], Rev.3.0 of 1998.09
    (Casio Loopy), confirmed by its title page.
  - Renesas serves the [µPD70732 data sheet][ren-v810]
    (V810: Virtual Boy, PC-FX),
    which points to the V810 family's hardware and architecture manuals, U10661E and U10082E;
    a site-restricted web search did not find those on Renesas.
  - NXP serves the [MC68020 and MC68EC020 user's manual][nxp-68020]
    (Motorola, first edition; Amiga CD32)
    and the [MPC603e user's manual][nxp-603e] (MPC603EUM/AD, Rev 3, Q2/02; Pippin), confirmed by their title pages.
    The second describes how the 603e differs from the MPC603,
    so it covers the Pippin's 603 only through those differences. nxp.com returns a "Page not available" page to
    scripted requests, so the link checker skips it (research log).
  - No Renesas document for the VR4300 was found; a site-restricted search found only the VR4111 manual,
    which names VR4300 as a trademark.
- Game Boy Advance, DS, DSi: GBATEK, read in the open `mgba-emu/gbatek` copy because the author's site returned HTTP 403
  (research log);
  [DSiBrew][dsibrew]; [Arm's own records][arm-0210] for the ARM7TDMI and [ARM946E-S][arm-0201] manuals, metadata only.
  The copy holds GBATEK's DSi Teak and BPTWL sections, which the register closes at the author's site,
  and a KEY2 section that lists seed values; the guard cannot close sections of one file, so none of them is opened,
  by the written rule ("Options and trade-offs", Recommendation).
- Nuon, E-kara, Pixter: Wikipedia alone.

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study,
  or study only the systems that [R1-11, R1-12, R1-16, R1-18, and R1-22][surveys] name and keep the rest as rows.
- **Costs:** every row adds 12 studies for rows that no survey names,
  or 18 counting the rows whose survey is only an inference, most of them resting on Wikipedia
  (counted from the rows above); surveys only leaves out the 3DO, Jaguar, PC-FX, Virtual Boy, and Nuon, among others.
- **Gains:** every row gives [R6-01][phase6] the widest choice; surveys only keeps the research finite.
- **Used by:** the roadmap today, by the surveys it lists (inference).

### A survey for the systems no survey names

- **What:** let [R1-25][surveys] cover the unnamed consoles and make it depend on [R1-02][r102],
  add surveys for the 3DO, Jaguar, and others, or leave them in the catalogue only.
- **Costs:** a wide R1-25 mixes computers, consoles, and phones; new surveys add roadmap items;
  catalogue only leaves them without an emulator survey.
- **Gains:** each settles where the Virtual Boy, 3DO, and Jaguar are studied.
- **Used by:** the roadmap's wording, which names other handhelds but not consoles (inference).

### Firmware for systems that need it

- **What:** for each firmware row, run user-supplied firmware, emulate its services at a high level,
  or start from the state firmware leaves.
- **Costs:** user-supplied firmware has no settled lawful route
  ([R0-02][r002], Summary and ["Firmware, keys, and game copies"][r002-fw]);
  high-level emulation needs a description of the services,
  which for the Saturn is known here only from Copetti's account, which cites a Sega manual that was not opened.
- **Gains:** the three routes differ by system; the Virtual Boy needs none (inference).
- **Used by:** Mednafen's [PC-FX][mdf-pcfx], [PlayStation][mdf-psx],
  and [Saturn][mdf-ss] modules and libretro's [Opera][lr-opera] and [Beetle PC-FX][lr-pcfx] cores ask
  for firmware images; [libretro's Virtual Jaguar][lr-vj] embeds them and also offers a high-level BIOS;
  [R2-12][phase2] will weigh the routes.

### Systems whose protection is cryptographic

- **What:** emulate them only with decrypted or unsigned software, require the user to supply keys, or leave them out.
- **Costs:** [R0-02][r002] records the exposure of each route; the iQue Player re-encrypts each title for one console.
- **Gains:** the first two keep the systems in scope; leaving them out removes the question.
- **Used by:** this catalogue records which systems use signatures or encryption.

### Recommendation

- **Study every row, or only surveyed ones:** study only the systems a survey names,
  and let [R6-01][phase6] add any other row it chooses.
  The rows with no survey rest mostly on Wikipedia
  ("Coverage of sources"),
  keeping research to the surveyed families keeps it finite, and the owner's stated target, the PlayStation 1,
  has a survey ([roadmap, "Scope"][roadmap-scope]).
- **A survey for the rest:** keep them in the catalogue only, with no new survey and no change to R1-25 now;
  add a survey, or R1-02 as a dependency of R1-25, only for a system R6-01 selects.
  Most of these rows rest on Wikipedia alone, a wide R1-25 would mix computers, consoles, and phones,
  and with the 2001 to 2005 handhelds placed in R1-07, what is left here is the Virtual Boy and a few home systems.
- **Firmware:** plan each firmware row around a high-level replacement or a start from the post-boot state,
  with user-supplied firmware an optional route only if [R2-12][phase2] and [R0-02][r002] settle a lawful one.
  The project may not obtain firmware
  ([ADR 0001][adr]),
  user-supplied firmware has no settled lawful route (R0-02),
  and libretro's Virtual Jaguar shows a working high-level BIOS for at least one system; the Virtual Boy needs none,
  and R2-12 chooses per system.
- **Cryptographic protection:** emulate the check's outcome, run software that is already decrypted or unsigned,
  and never require, request, or hold keys; leave a system out only where nothing can run without per-console keys,
  which on this note's evidence means the iQue Player.
  Notes never hold keys ([R0-04][r004]),
  the note already treats disc marks the same way by reporting the drive's result,
  and R0-02 records the exposure of each route.
- **The GBATEK copy's DSi Teak and BPTWL sections:** for the proposed amendment of ADR 0001,
  treat the pages of a source whose author names leaked material as their source as closed,
  and the rest of the source by its tier, so that those sections stay closed and the rest of the copy stays open.
  The guard cannot carve sections out of one file, so until then the closure rests on the written rule.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is a decision for [R6-01][phase6];
  the survey column shows which rows will have an emulator survey behind them.
- Nearly every home console here needs firmware the project may not obtain ([ADR 0001][adr]; [R0-02][r002]).
  Whether each can run from its post-boot state or a high-level replacement feeds [R2-12][phase2] (inference).
- Cryptographic protection, met earlier in the NTSC Atari 7800's cartridge signature ([R1-05][r105]),
  appears on several systems in this era: the DS and DSi cards, the iQue Player, the Pippin, the 3DO by one source,
  and the Jaguar by a tertiary source (inference from the rows).
  These rows bring keys and signatures into scope for R0-02 and for the firmware ADR
  that [R6-03][phase6] may propose (inference).
- The PlayStation 1, which the owner wants
  ([roadmap, "Scope"][roadmap-scope]),
  has no open hardware hub free of the tainted document in this catalogue;
  this feeds the decision on [R0-05, option 8][r005-opt8], for [R1-02][r102] and R1-18.
- The 3DO Development Repo's key, maker-document,
  and source paths and N64brew's PIF and CIC pages are now closed in the [register][register], each with a guard test;
  the GBATEK copy's DSi Teak, BPTWL, and KEY2 sections stay unopened by the written rule,
  pending the proposed amendment of ADR 0001.

## Open questions

- Did any 3DO product use the radial-wobble disc of WO 97/45836 and US 5,809,006?
  Examining a pressed disc of an M2-based product, hardware the project does not own,
  or a maker document that names the scheme, would answer it.
- Is the 3DO's operating system stored on disc, in ROM, or split between them?
  [R2-12][phase2], from 3DO maker patents or an open-tier emulator's prose documentation.
- What services does the Saturn's firmware provide to games?
  [R1-22][surveys] or R2-12, from MacDonald's Saturn hardware notes, cited by his document index, and Mednafen's prose.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext; each link and pin is the revision read.
Six pinned revisions are dated 2026-11-20, the day of reading: "Game Boy Advance", "Nintendo DSi",
"PlayStation Portable", "Amiga CD32", and "Apple Pippin" in English, and "PC-FX" in Japanese;
the first verification pass read every English article at its pinned revision.

Wikipedia, home consoles and add-ons:

- ["Fifth generation of video game consoles"][w-fifth] 1384599937;
  ["List of home video game consoles"][w-homelist] 1386685039.
- ["PlayStation (console)"][w-ps] 1386319193; ["PlayStation technical specifications"][w-psspec] 1362538225;
  ["PlayStation models"][w-psmodels] 1386181677; ["Net Yaroze"][w-yaroze] 1378707385;
  ["PocketStation"][w-pocket] 1382885501; ["Compact Disc Digital Audio"][w-cdda] 1385472206.
- ["Nintendo 64"][w-n64] 1386077971; ["Nintendo 64 Game Pak"][w-gamepak] 1386318295; ["64DD"][w-64dd] 1386308027;
  ["iQue Player"][w-ique] 1355022059.
- ["Sega Saturn"][w-saturn] 1384300813; ["Sega Net Link"][w-netlink] 1364854330; ["32X"][w-32x] 1385340621.
- ["3DO"][w-3do] 1383977414; ["3DO Blaster"][w-blaster] 1374925870; ["Panasonic M2"][w-m2] 1381859043.
- ["Atari Jaguar"][w-jaguar] 1386053059; ["Atari Jaguar CD"][w-jagcd] 1371086294;
  ["List of Atari Jaguar homebrew games"][w-jaghb] 1386857183, whose revision API time stamp, 2026-11-21T01:37Z,
  is in UTC.
- ["PC-FX"][w-pcfx] 1352943842; ["Amiga CD32"][w-cd32] 1386758766; ["FM Towns Marty"][w-marty] 1379254432;
  ["Playdia"][w-playdia] 1385569273; ["Casio Loopy"][w-loopy] 1377306489; ["Apple Pippin"][w-pippin] 1386811011.
- ["Nuon (DVD technology)"][w-nuon] 1383941718; ["E-kara"][w-ekara] 1386089717.
- ["Dreamcast"][w-dreamcast] 1386172458; ["VMU"][w-vmu] 1379027676; ["CD-i"][w-cdi] 1384443552;
  ["CP System"][w-cps] 1385997383; ["PlayStation 2"][w-ps2] 1386205170; ["Nintendo 3DS"][w-3ds] 1386371150,
  both read by the second pass.
- ["Super NES CD-ROM"][w-snescd] 1386184486; ["Atari Panther"][w-panther] 1336176915;
  ["Konix Multisystem"][w-konix] 1382575305; ["Super A'Can"][w-acan] 1378214813.

Wikipedia, handhelds:

- ["Virtual Boy"][w-vb] 1384432040; ["Game Boy Advance"][w-gba] 1386719051; ["Game Boy Advance SP"][w-gbasp] 1382257211;
  ["Game Boy Micro"][w-micro] 1372511713; ["Game Boy Player"][w-gbp] 1385936501; ["IQue"][w-iqueco] 1386607666.
- ["Nintendo DS"][w-ds] 1384607359; ["Nintendo DSi"][w-dsi] 1386756319; ["PlayStation Portable"][w-psp] 1386784394.
- ["Pixter"][w-pixter] 1379566018.
- For the cross-references: ["GP32"][w-gp32] 1379015467; ["GP2X"][w-gp2x] 1385314903; ["N-Gage"][w-ngage] 1386180025;
  ["Tapwave Zodiac"][w-zodiac] 1372920485; ["Gizmondo"][w-gizmondo] 1386173978; ["Leapster"][w-leapster] 1385502801;
  ["LeapFrog Didj"][w-didj] 1381158352; ["V.Smile"][w-vsmile] 1385799892; ["Dingoo"][w-dingoo] 1379337765;
  ["List of handheld game consoles"][w-handlist] 1384273411.

Japanese Wikipedia (translations are the note's own):

- ["セガサターン"][ja-saturn] 111794107, "バリエーション", which the "Hiサターン" and "Vサターン" titles redirect to.
- ["PC-FX"][ja-pcfx] 111840249, "発売後" and "チップセットについて".
- ["PIECE"][ja-piece] 110504604; the research agent's revision query failed
  (research log), and the ID was taken by the verification pass.

Hubs and references:

- N64brew wiki, ["64DD"][n64-64dd] (revision 5543) and ["VR4300"][n64-vr4300] (5928).
  Its "CIC-NUS" (5619) and "PIF-NUS" (5759, opening only) pages,
  `n64brew.dev/wiki/CIC-NUS` and `n64brew.dev/wiki/PIF-NUS`, are not linked because they print key or seed material.
- GBATEK, Markdown copy in mGBA's repository, commit `64b5087a`, "Extracted from no$gba version 3.06":
  [`gba.md`][gbatek-gba], and `ds.md` beside it, not linked because it prints the DS cartridge encryption seeds;
  the DSi Teak and BPTWL sections were not read.
- [DSiBrew, "Hardware"][dsibrew] (revision 2099901).
- [Sacred Tech Scroll, Virtual Boy][sts].
- 3DO Development Repo, index pages only: ["start"][3do-start], ["documentation/hardware"][3do-hw],
  ["documentation/hardware_revisions"][3do-hwrev], ["documentation/patents"][3do-pat],
  ["documentation/encryption"][3do-enc], ["software/emulation"][3do-emu], ["software/operating_systems"][3do-os],
  last modified 2026-08-04, 2026-02-20, 2023-01-15, 2022-11-07, 2022-11-07, 2026-03-02, and 2022-11-07;
  read through their raw exports.
- Mednafen documentation, ["PC-FX"][mdf-pcfx], ["Sony PlayStation"][mdf-psx], ["Sega Saturn"][mdf-ss],
  "Valid as of 1.32.1".
- libretro documentation, ["Virtual Jaguar"][lr-vj], ["Opera"][lr-opera], ["Beetle PC-FX"][lr-pcfx],
  each last updated 2026-10-22.
- R. Copetti (leads): ["PlayStation Architecture"][cop-ps], ["Nintendo 64 Architecture"][cop-n64],
  ["Sega Saturn Architecture"][cop-ss], ["Nintendo DS Architecture"][cop-nds],
  and ["Game Boy Advance Architecture"][cop-gba], modified 2026-08-19, 2026-08-19, 2026-10-31, 2026-06-10,
  and 2026-10-04.
- J. Walker, ["Everything You Have Always Wanted to Know about the Playstation But Were Afraid to Ask"][walker],
  version 1.1, appendix D and the memory-card chapter, read through text extraction.
- Doomed, ["cdinfo.txt"][doomed].
- Arm documentation service, records for [DDI 0210C][arm-0210] and [DDI 0201D][arm-0201], metadata only.
- Renesas, ["SH7020 and SH7021 Hardware Manual"][ren-sh7021] and ["µPD70732 data sheet"][ren-v810], title pages.
- NXP, ["MC68020 MC68EC020 Microprocessors User's Manual"][nxp-68020]
  and ["MPC603e RISC Microprocessor User's Manual"][nxp-603e], title pages and, for the second,
  its section on the differences from the MPC603.
- [Hasbro Interactive release of 1999-05-14][hasbro], fan transcription (lead).

Patents, front pages, abstracts, and for US 6,304,971 the full text:

- [US 6,304,971][us6304971] (Kutaragi and Hirano, c/o Sony Corporation; no assignee on its face).
- [US 6,239,810][us6239810] and [US 6,190,257][us6190257]
  (Nintendo; the first with Silicon Graphics), read from the Patent Office's front pages.
- [US 5,502,462][us5502462], [US 5,572,235][us5572235], [US 5,596,693][us5596693], [WO 97/45836][wo9745836],
  and [US 5,809,006][us5809006] (The 3DO Company; the last two with or by CagEnt Technologies);
  a [Google Patents][gpatents] search for Atari cartridge-authentication patents.

Project documents:

- The [research roadmap][roadmap] and its era rule from [pull request #22][pr22], merged to `main` on 2026-11-20;
  [R0-02][r002]; [R0-04][r004]; [R0-05][r005]; [ADR 0001][adr]; the [source register][register].
- [R1-05][r105], [R1-07][r107], and [R1-08][r108], on `main`, for their rows and placements.

[roadmap]: ../../roadmap/research.md
[roadmap-scope]: ../../roadmap/research.md#scope
[primers]: ../../roadmap/research.md#hardware-primers
[surveys]: ../../roadmap/research.md#system-family-surveys
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[pr22]: https://github.com/jsamuelsen11/rustalgia-emu/pull/22
[adr]: ../../adr/0001-restrict-reading-by-licence-tier.md
[adr-context]: ../../adr/0001-restrict-reading-by-licence-tier.md#context
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-fw]: R0-02-legal-baseline.md#firmware-keys-and-game-copies
[r004]: R0-04-glossary-and-conventions.md
[r005]: R0-05-source-map.md
[r005-opt8]: R0-05-source-map.md#8-how-the-playstation-1-primer-gets-its-facts
[r101]: R1-01-primer-8-and-16-bit.md
[r102]: R1-02-primer-32-and-64-bit.md
[r103]: R1-03-primer-sixth-generation.md
[r105]: R1-05-catalogue-8-and-16-bit.md
[r107]: R1-07-catalogue-sixth-generation.md
[r107-built]: R1-07-catalogue-sixth-generation.md#how-the-catalogue-is-built
[r108]: R1-08-catalogue-modern.md
[w-fifth]: https://en.wikipedia.org/w/index.php?oldid=1384599937
[w-homelist]: https://en.wikipedia.org/w/index.php?oldid=1386685039
[w-ps]: https://en.wikipedia.org/w/index.php?oldid=1386319193
[w-psspec]: https://en.wikipedia.org/w/index.php?oldid=1362538225
[w-psmodels]: https://en.wikipedia.org/w/index.php?oldid=1386181677
[w-yaroze]: https://en.wikipedia.org/w/index.php?oldid=1378707385
[w-pocket]: https://en.wikipedia.org/w/index.php?oldid=1382885501
[w-cdda]: https://en.wikipedia.org/w/index.php?oldid=1385472206
[w-n64]: https://en.wikipedia.org/w/index.php?oldid=1386077971
[w-gamepak]: https://en.wikipedia.org/w/index.php?oldid=1386318295
[w-64dd]: https://en.wikipedia.org/w/index.php?oldid=1386308027
[w-ique]: https://en.wikipedia.org/w/index.php?oldid=1355022059
[w-saturn]: https://en.wikipedia.org/w/index.php?oldid=1384300813
[w-netlink]: https://en.wikipedia.org/w/index.php?oldid=1364854330
[w-32x]: https://en.wikipedia.org/w/index.php?oldid=1385340621
[w-3do]: https://en.wikipedia.org/w/index.php?oldid=1383977414
[w-blaster]: https://en.wikipedia.org/w/index.php?oldid=1374925870
[w-m2]: https://en.wikipedia.org/w/index.php?oldid=1381859043
[w-jaguar]: https://en.wikipedia.org/w/index.php?oldid=1386053059
[w-jagcd]: https://en.wikipedia.org/w/index.php?oldid=1371086294
[w-jaghb]: https://en.wikipedia.org/w/index.php?oldid=1386857183
[w-pcfx]: https://en.wikipedia.org/w/index.php?oldid=1352943842
[w-cd32]: https://en.wikipedia.org/w/index.php?oldid=1386758766
[w-marty]: https://en.wikipedia.org/w/index.php?oldid=1379254432
[w-playdia]: https://en.wikipedia.org/w/index.php?oldid=1385569273
[w-loopy]: https://en.wikipedia.org/w/index.php?oldid=1377306489
[w-pippin]: https://en.wikipedia.org/w/index.php?oldid=1386811011
[w-nuon]: https://en.wikipedia.org/w/index.php?oldid=1383941718
[w-ekara]: https://en.wikipedia.org/w/index.php?oldid=1386089717
[w-dreamcast]: https://en.wikipedia.org/w/index.php?oldid=1386172458
[w-vmu]: https://en.wikipedia.org/w/index.php?oldid=1379027676
[w-cdi]: https://en.wikipedia.org/w/index.php?oldid=1384443552
[w-cps]: https://en.wikipedia.org/w/index.php?oldid=1385997383
[w-ps2]: https://en.wikipedia.org/w/index.php?oldid=1386205170
[w-3ds]: https://en.wikipedia.org/w/index.php?oldid=1386371150
[w-snescd]: https://en.wikipedia.org/w/index.php?oldid=1386184486
[w-panther]: https://en.wikipedia.org/w/index.php?oldid=1336176915
[w-konix]: https://en.wikipedia.org/w/index.php?oldid=1382575305
[w-acan]: https://en.wikipedia.org/w/index.php?oldid=1378214813
[w-vb]: https://en.wikipedia.org/w/index.php?oldid=1384432040
[w-gba]: https://en.wikipedia.org/w/index.php?oldid=1386719051
[w-gbasp]: https://en.wikipedia.org/w/index.php?oldid=1382257211
[w-micro]: https://en.wikipedia.org/w/index.php?oldid=1372511713
[w-gbp]: https://en.wikipedia.org/w/index.php?oldid=1385936501
[w-iqueco]: https://en.wikipedia.org/w/index.php?oldid=1386607666
[w-ds]: https://en.wikipedia.org/w/index.php?oldid=1384607359
[w-dsi]: https://en.wikipedia.org/w/index.php?oldid=1386756319
[w-psp]: https://en.wikipedia.org/w/index.php?oldid=1386784394
[w-pixter]: https://en.wikipedia.org/w/index.php?oldid=1379566018
[w-gp32]: https://en.wikipedia.org/w/index.php?oldid=1379015467
[w-gp2x]: https://en.wikipedia.org/w/index.php?oldid=1385314903
[w-ngage]: https://en.wikipedia.org/w/index.php?oldid=1386180025
[w-zodiac]: https://en.wikipedia.org/w/index.php?oldid=1372920485
[w-gizmondo]: https://en.wikipedia.org/w/index.php?oldid=1386173978
[w-leapster]: https://en.wikipedia.org/w/index.php?oldid=1385502801
[w-didj]: https://en.wikipedia.org/w/index.php?oldid=1381158352
[w-vsmile]: https://en.wikipedia.org/w/index.php?oldid=1385799892
[w-dingoo]: https://en.wikipedia.org/w/index.php?oldid=1379337765
[w-handlist]: https://en.wikipedia.org/w/index.php?oldid=1384273411
[ja-saturn]: https://ja.wikipedia.org/w/index.php?oldid=111794107
[ja-pcfx]: https://ja.wikipedia.org/w/index.php?oldid=111840249
[ja-piece]: https://ja.wikipedia.org/w/index.php?oldid=110504604
[n64-64dd]: https://n64brew.dev/wiki/64DD
[n64-vr4300]: https://n64brew.dev/wiki/VR4300
[gbatek-gba]: https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md
[dsibrew]: https://dsibrew.org/w/index.php?title=Hardware&oldid=2099901
[sts]: http://perfectkiosk.net/stsvb.html
[3do-start]: https://3dodev.com/start
[3do-hw]: https://3dodev.com/documentation/hardware
[3do-hwrev]: https://3dodev.com/documentation/hardware_revisions
[3do-pat]: https://3dodev.com/documentation/patents
[3do-enc]: https://3dodev.com/documentation/encryption
[3do-emu]: https://3dodev.com/software/emulation
[3do-os]: https://3dodev.com/software/operating_systems
[mdf-pcfx]: https://mednafen.github.io/documentation/pcfx.html
[mdf-psx]: https://mednafen.github.io/documentation/psx.html
[mdf-ss]: https://mednafen.github.io/documentation/ss.html
[lr-vj]: https://docs.libretro.com/library/virtual_jaguar/
[lr-opera]: https://docs.libretro.com/library/opera/
[lr-pcfx]: https://docs.libretro.com/library/beetle_pc_fx/
[cop-ps]: https://www.copetti.org/writings/consoles/playstation/
[cop-n64]: https://www.copetti.org/writings/consoles/nintendo-64/
[cop-ss]: https://www.copetti.org/writings/consoles/sega-saturn/
[cop-nds]: https://www.copetti.org/writings/consoles/nintendo-ds/
[cop-gba]: https://www.copetti.org/writings/consoles/game-boy-advance/
[walker]: https://hitmen.c02.at/files/docs/psx/psx.pdf
[doomed]: https://hitmen.c02.at/files/docs/psx/cdinfo.txt
[arm-0210]: https://documentation-service.arm.com/documentation/ddi0210/c
[arm-0201]: https://documentation-service.arm.com/documentation/ddi0201/d
[ren-sh7021]: https://www.renesas.com/en/document/mah/superh-risc-engine-sh7020-and-sh7021-hd6437020-hd6477021-hd6437021-hd6417021
[ren-v810]: https://www.renesas.com/en/document/dst/upd70732-data-sheet
[nxp-68020]: https://www.nxp.com/docs/en/data-sheet/MC68020UM.pdf
[nxp-603e]: https://www.nxp.com/docs/en/reference-manual/MPC603EUM.pdf
[hasbro]: https://mail.atariage.com/Jaguar/archives/HasbroRights.html
[us6304971]: https://patents.google.com/patent/US6304971B1/en
[us6239810]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6239810
[us6190257]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6190257
[us5502462]: https://patents.google.com/patent/US5502462A/en
[us5572235]: https://patents.google.com/patent/US5572235A/en
[us5596693]: https://patents.google.com/patent/US5596693A/en
[wo9745836]: https://patents.google.com/patent/WO1997045836A1/en
[us5809006]: https://patents.google.com/patent/US5809006A/en
[gpatents]: https://patents.google.com/
