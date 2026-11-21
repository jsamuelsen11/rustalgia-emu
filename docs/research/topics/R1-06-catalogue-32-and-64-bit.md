---
title: "The 32-bit and 64-bit era: catalogue"
roadmap_item: R1-06
status: approved
date: 2026-11-21
---

# The 32-bit and 64-bit era: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold in the 32-bit and 64-bit era
as the [research roadmap][roadmap] draws it, and what hardware, protection, firmware, and sources each has.

It lists 12 home consoles with their variants, two other home systems first sold in 2000
(Nuon players and the E-kara),
5 add-ons and expansion cards, the Virtual Boy, the Game Boy Advance and Nintendo DS families, and the Pixter.
Devices first sold from 2001 that no survey names, such as the GP32, N-Gage, and Gizmondo,
are listed in [R1-07][r107] or [R1-08][r108] and appear here only as cross-references.

Sources are uneven.
Open hubs beyond Wikipedia cover the Nintendo 64, the Nintendo handhelds, the Virtual Boy, and the 3DO;
[Mednafen's documentation][mdf-ss] covers the PC-FX and Saturn.
The PlayStation 1 rests on a [Sony patent][us6304971] and two older open documents for its disc check,
and the Jaguar on Wikipedia and [libretro's documentation][lr-vj].

Firmware matters most to Rustalgia.
Every home console here names built-in firmware or a boot stage that the project may not obtain, except the Playdia,
which Wikipedia says has no BIOS, and the iQue Player, for which no page read describes any.

Protection comes next.
It takes three forms: physical marks on discs, chips in cartridges, and cryptographic signatures or encryption
(inference from the rows); the last brings keys into scope for [R0-02][r002].

The recommendations plan firmware around high-level replacement or the post-boot state,
and emulate a check's outcome rather than hold keys.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of the 32-bit and 64-bit era were sold, and for each,
  what are its maker, release, processor, video, audio, media, protection, firmware, survey, and sources?
- Covered: home consoles of the fifth generation and their add-ons; the Virtual Boy; the Game Boy Advance, DS,
  and DSi families; and other devices first sold up to the end of 2000 that no family survey names,
  as ["How the catalogue is built"](#how-the-catalogue-is-built) defines the era.
- Left to other notes: how the hardware works to the primer, [R1-02][r102]; each family's emulators to its survey
  ([roadmap, "System family surveys"][surveys]);
  the law on protection, firmware, and keys to [R0-02][r002]; each hub's evaluation to [R0-05][r005].
- Left to other catalogues: the Dreamcast, 3DS, PlayStation 2, PSP, other sixth-generation systems,
  and devices first sold from 2001 that no survey names, to [R1-07][r107] or [R1-08][r108].
  PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles are emulator hosts,
  left to [R3-07 and R3-12][phase3] ([roadmap, "Hardware primers"][primers]).
- How claims were checked: on 2026-11-20 two research agents read every page as raw text,
  Wikipedia through its raw wikitext and PDFs through text extraction or, for patent pages, as page images
  (research log); no value comes from a summarising tool unless marked "(secondary)".
- Three independent verification passes have run, each fetching the sources again:
  six verifiers tested 271 claims and quotations, seven tested 324, and two checked, in 76 entries,
  the rework that answered the note's questions (research log).
  Each finding was checked against the source again before the text changed;
  claims no pass could check are listed in the pull request.
- Markers follow the [research guide][guide].
  Wikipedia is a tertiary source, and a value with no hub named rests on the article's own text,
  whose citations were not followed; Copetti's articles, a personal site that the [register][register] calls a lead,
  are treated as leads.
- Notation: memory sizes that sources give in "KB" or "MB" are written in KiB or MiB,
  because chip sizes are powers of two (inference); media capacities and clocks are as each source gives them.
- Not opened: no firmware, BIOS, boot ROM, disassembly, game, maker manual hosted by others, or emulator code,
  and the tainted PlayStation reference in no form.
  N64brew's "PIF-NUS" and "CIC-NUS" and the GBATEK copy's KEY2 section print key or seed material;
  none of it was used or recorded (research log).

## Findings

### How the catalogue is built

- The roadmap's rule is "An era holds the systems whose family survey depends on its primer".
  [Pull request #22][pr22] added: "Where a survey depends on more than one primer,
  each of its systems belongs to the era of its own generation,
  and the survey depends on the other primers for the hardware that its systems contain or carry over"
  ([roadmap, "Hardware primers"][primers]).
- [R1-11, R1-12, R1-16, and R1-18][surveys]
  (Game Boy Advance, Nintendo DS and DSi, Nintendo 64, PlayStation 1)
  depend on no primer but [R1-02][r102] ([roadmap, "System family surveys"][surveys]).
- R1-22 (Sega) depends on [R1-01][r101], R1-02, and [R1-03][r103], so by #22 the Saturn is here, the Master System,
  Game Gear, and Genesis are in [R1-05][r105], and the Dreamcast is in [R1-07][r107].
  R1-13 (3DS) and R1-19 (PlayStation 2) depend on R1-02 and R1-03; the sixth-generation PlayStation 2
  ([Wikipedia, "PlayStation 2"][w-ps2], infobox)
  and the eighth-generation 3DS ([Wikipedia, "Nintendo 3DS"][w-3ds], infobox) are in R1-07
  ([R1-07, "How the catalogue is built"][r107-built]).
- By the survey rule the Nintendo DSi (2008) is here, because R1-12 names it,
  although Wikipedia places the DS family in the seventh generation
  ([Wikipedia, "Nintendo DS"][w-ds], infobox); the PSP is not, because R1-20 depends on R1-03 (roadmap).
- A model of a surveyed family stays with its family, so the iQue Player stays here with the Nintendo 64,
  whose games it runs in a re-encrypted form ([Wikipedia, "iQue Player"][w-ique]).
  The Game Boy Player is a GameCube add-on, so R1-07 lists it (a process call of this note).
- A system that no family survey names is placed by its first sale: to the end of 2000 here;
  from 2001 to 21 November 2005, the day before the Xbox 360's first sale, in [R1-07][r107]; later in [R1-08][r108]
  (the project's rule for every catalogue, set on 2026-11-20).
  Each device is listed in one catalogue; the others carry a one-line cross-reference.
- [R1-25][surveys] covers "the systems that no other survey names" and depends on every primer and catalogue
  (roadmap, as [pull request #30][pr30] set it), so it is the survey for those rows.
- A device that runs emulators of other systems is a host, not a system to emulate.
  The N-Gage and Tapwave Zodiac are dedicated game devices,
  because each runs its own game software and neither is sold to run other systems' games; the GP2X line is a host
  (the owner's rule as applied on 2026-11-20).
- A row is one machine or one compatible family; revisions and licensed models are folded into it.
- "Survey" names the family survey whose title includes the system, or the system it is a model
  or add-on of; "(inference)" marks a family survey that does not name the system, and R1-25 takes the rest.
- "Hub" names the best source other than Wikipedia, with its tier in the [register][register];
  a dash means Wikipedia was the only source found.
- Regions: NA North America, UK United Kingdom, JP Japan, KR South Korea, CN China, SG Singapore.

### Home consoles

Identity, with the hub where one exists:

| System (other names) | Maker | First release | Survey | Hub (tier) |
|---|---|---|---|---|
| PlayStation 1 (PS one) | Sony | JP 1994-12-03; NA 1995-09-09 | [R1-18][surveys] | [Sony patent][us6304971] (open) |
| Nintendo 64 (Hyundai Comboy 64) | Nintendo | JP 1996-06-23; NA 1996-09-29 | R1-16 | [N64brew][n64-vr4300] (open) |
| iQue Player | iQue (Nintendo and Wei Yen) | CN 2003-11-18 | R1-16 (inference) | — |
| Sega Saturn (Samsung Saturn) | Sega | JP 1994-11-22; NA 1995-05-11 | R1-22 | [Copetti][cop-ss] (open; lead) |
| 3DO | The 3DO Company | NA 1993-10-04; JP 1994-03-20 | R1-25 | [3DO Development Repo][3do-start] (open) |
| Atari Jaguar | Atari Corporation | NA 1993-11-23 | R1-25 | — |
| PC-FX | NEC, with Hudson Soft | JP 1994-12-23 | R1-25 | [Mednafen documentation][mdf-pcfx] (open) |
| Amiga CD32 | Commodore | 1993-09-17 | R1-25 | — |
| FM Towns Marty (Marty 2, Car Marty) | Fujitsu | JP 1993-02-20 | R1-25 | — |
| Playdia | Bandai | JP 1994-09-23 | R1-25 | — |
| Casio Loopy | Casio | JP 1995-10-19 | R1-25 | — |
| Pippin (ATMARK, @WORLD, KMP 2000) | Apple; Bandai and Katz Media | JP 1996 | R1-25 | — |

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
| 3DO | CD-ROM | RSA-signed executables, by one source | CPU ROM; firmware per model |
| Atari Jaguar | ROM cartridge | encrypted software (inference from Wikipedia) | boot ROM |
| PC-FX | CD-ROM | none described | BIOS 1.00 |
| Amiga CD32 | CD-ROM, ISO 9660 | none described | Kickstart 3.1 and CD32 ROM |
| FM Towns Marty | CD-ROM; 3.5-inch floppy | none described | BIOS |
| Playdia | CD-ROM (QIS) | none described | no BIOS, by Wikipedia; ROM in its CPU |
| Casio Loopy | ROM cartridge | none described | 2 MiB ROM; mask ROM in CPU (lead) |
| Pippin | CD-ROM | RSA disc signatures | ROM; operating system on disc |

- Sources by row: each system's Wikipedia article, unless a finding below names another source.
  The PlayStation 1 hardware values are from [Wikipedia, "PlayStation technical specifications"][w-psspec],
  the CD32 sound row from [Wikipedia, "Amiga CD32"][w-cd32], "Specifications",
  and the Jaguar's boot ROM from [libretro's documentation, "Virtual Jaguar"][lr-vj].

PlayStation 1:

- A patent by Ken Kutaragi and Tetsuya Hirano describes the disc check:
  "The security code is stored through modulating an offset of the physical position of a plurality of data bits from a
  nominal track position" ([US 6,304,971][us6304971], abstract; priority 1994-11-18).
  Its front page gives both inventors in care of Sony Corporation,
  and a Certificate of Correction of 2002-12-24 adds Sony Computer Entertainment Inc. as assignee
  (same, final page), so it is maker material.
- The same patent places the code: "the system performs an initial check to determine whether
  or not the disc contains a 'wobbled' code in the TOC (Table of Contents) area of the disc"
  (US 6,304,971, detailed description).
  It repeats the code several times in that area, on a 22.05 kHz carrier, half the CD sampling rate,
  keyed in NRZ format (same).
- On a compact disc the table of contents is held in the subcode of the lead-in
  ([Wikipedia, "Compact Disc Digital Audio"][w-cdda], "Data structure"),
  so the code sits in the lead-in (inference from the two sources).
  [Wikipedia, "PlayStation models"][w-psmodels], "Debugging units", agrees, as does [Copetti's account][cop-ps]
  ("Anti-piracy / Region Lock"; lead);
  [Wikipedia, "PlayStation (console)"][w-ps], "Copy protection system", which puts the signal in the pregap,
  is the outlier.
- The patent says the code "depends on the particular country in which the disc is to be sold",
  and its examples are placeholders for Japan, the United States, and Europe (same, detailed description).
- Two older documents give the drive's side.
  The drive's ID command returns status bytes and then "4 letters of ID (SCEx)",
  which are the "SCEx ASCII string from the CD"
  ([Walker's compilation][walker], CD-ROM command 1A; [Doomed, "cdinfo.txt"][doomed], same command).
  Both are older documents whose host the [register][register] opens, noting that Walker denies using Sony documents.
- So the string is four ASCII letters beginning "SCE".
  That the fourth letter is I, A, or E, for Sony's Japanese, American, and European companies,
  is an inference from Walker's glossary, which names SCEI, SCEA, and SCEE as companies (Walker, appendix D).
  An emulated drive returns the string in its reply to the ID command, so [R1-18][surveys] needs its form
  (inference from the two documents).
- [Wikipedia's specification page][w-psspec] cites the tainted Nocash document for one value, the CD-ROM's data buffer;
  this catalogue does not record it.
  Neither Walker nor Doomed gives a size for that buffer; both mention a CD sector buffer without one
  (a search of both for "buffer").
- Variants ([Wikipedia, "PlayStation models"][w-psmodels]):
  - Revision C hardware (late 1995) replaced the GPU's dual-ported VRAM with SGRAM ("Revisions", which cites a video).
  - The PS one (JP 2000-07-07) has the late hardware in a smaller case, with no serial or parallel port.
  - Debug units have a reprogrammed CD controller that treats any disc with a data track as licensed
    ("Debugging units").
  - The Net Yaroze kit (JP 1996-06) has different boot ROMs, no region lock, and "a different encryption scheme"
    ([Wikipedia, "Net Yaroze"][w-yaroze], "Contents").

Nintendo 64 and iQue Player:

- [N64brew][n64-vr4300] describes the processor as a slightly modified VR4300 with six pins moved,
  and records the processor-revision values read on retail units and on the iQue Player ("VR4300").
- A Nintendo patent describes the peripheral interface as handling the controllers
  and checking the cartridge's security chip:
  it is used "for performing game authenticating security checks continuously during game play"
  ([US 6,190,257][us6190257], abstract, front page).
- N64brew says that each lock-out chip variant pairs with a third boot stage in the cartridge ROM,
  which the PIF verifies by checksum while the processor runs the second stage,
  so an emulator must select the variant per game ("CIC-NUS"; the selection is an inference).
  The page's address, `n64brew.dev/wiki/CIC-NUS`, is given without a link because the page prints a boot secret.
- Region is set by cartridge shape and an NTSC or PAL lock-out chip
  ([Wikipedia, "Nintendo 64 Game Pak"][w-gamepak], "Regional lockout").
- iQue Player: "Newly purchased titles were loaded to memory cards as encrypted files
  and re-encrypted on first launch using a console-specific private key" ([Wikipedia, "iQue Player"][w-ique], "Games").

Sega Saturn:

- [Copetti][cop-ss] describes a ring of non-standard data outside the program area,
  checked once by the SH-1 in the drive
  ("Anti-Piracy & Homebrew"; lead, whose sources for this section are unregistered).
  Its account of the boot ROM cites a Sega manual that was not opened, so it is not relied on.
- Mednafen needs one firmware image for Japanese games and one for North American and European games,
  and detects region from the game header ([Mednafen documentation, "Sega Saturn"][mdf-ss]).
- Licensed models ([Japanese Wikipedia, "セガサターン"][ja-saturn], "バリエーション"; the note's own translation):
  - V-Saturn (Victor): RG-JX1, released on 1994-11-22, the Saturn's launch day; the RG-JX2 followed on 1996-06-07.
  - Hi-Saturn (Hitachi): the multimedia player MMP-1, released on 1995-04-01,
    with its own card in the Saturn's expansion slot that adds Video CD and Photo CD playback;
    an in-car model with navigation, the MMP-1000NV, followed on 1995-12-06.
  - Samsung Saturn (South Korea), released in February 1995, with the same region setting as Japan's,
    so that Japanese Saturn software runs on it.

3DO:

- Licensed models came from Panasonic, GoldStar, Sanyo, Samsung, and Creative, whose 3DO Blaster is a PC card
  ([Wikipedia, "3DO"][w-3do], "Licensed systems").
- The 3DO Company's patents describe the cel engine
  ([US 5,596,693][us5596693], abstract),
  display lists, and intensity effects ([US 5,502,462][us5502462]; [US 5,572,235][us5572235]).
- Protection is disputed.
  Wikipedia says the system has neither regional lockout nor copy protection
  ("3DO", "Hardware");
  the 3DO Development Repo's encryption index says that the 3DO Company signed executables
  and the operating system with 512-bit RSA, so that retail and arcade systems would not run unlicensed software
  (`3dodev.com/documentation/encryption`, paraphrased; not linked, because it links key archives,
  and its key pages were not opened).
- An international application by the 3DO Company and CagEnt Technologies, filed in 1997 with priority from 1996-05-31,
  describes a copy-protected disc with a radial wobble ([WO 97/45836][wo9745836], abstract and Google Patents record).
  [US 5,809,006][us5809006], by CagEnt, has the same title and was filed on 1996-05-31
  (front page);
  that the international application claims it was not rechecked, because Google Patents refused the request
  (research log).
  No product is shown to have used it ([Open questions](#open-questions)).
- Firmware differs by model: libretro's Opera core lists firmware images by model, among them patched images
  ([libretro documentation, "Opera"][lr-opera]),
  and a kanji font missing from "the English language console firmware" breaks a few Japanese games
  ([Wikipedia, "3DO"][w-3do], "Hardware").
- The 3DO Company's architecture application describes a CPU ROM that is mapped at address zero on reset,
  some of whose routines are copied into system memory,
  and makes the built-in CD drive the main route by which software for the CPU is loaded
  ([WO 94/10641][wo9410641], filed 1992-11-02, "Operation"; paraphrased,
  because the text extraction scrambles the word order).
- The Development Repo's operating-system page lists Portfolio's features without saying where Portfolio is stored
  (`3dodev.com/software/operating_systems`, not linked, because it serves closed source archives),
  and Wikipedia lists a multitasking operating system, also without a location ("3DO").
  So the 3DO boots from a console ROM and loads the rest from disc
  (inference from the application); which parts of Portfolio sit in the ROM is open.

Atari Jaguar:

- A memory-controller flaw limits running code from RAM on the custom processors
  ([Wikipedia, "Atari Jaguar"][w-jaguar], "Technical specifications").
- [libretro's documentation][lr-vj] says that its Virtual Jaguar core carries the console's boot ROM.
- A retail unit boots only encrypted software, by inference from Wikipedia's list of homebrew games,
  which says that early homebrew CDs were not encrypted, and so needed a bypass cartridge or a booting program
  ([Wikipedia, "List of Atari Jaguar homebrew games"][w-jaghb], lead section; paraphrased).
- The article adds that encryption material for both cartridge and CD software was released between 2001 and 2003,
  so that software can run without development hardware (same; paraphrased).
  Its citations concern keys and were not opened, and their addresses are not recorded.
- What the boot ROM checks is known only from disassembly-based leads, not used here (research log).
  A [Google Patents][gpatents] search for assignee "Atari" with cartridge and encryption, authentication,
  or signature terms, priority before 1997, returned only Atari, Inc. graphics patents of 1979 to 1984 (research log).
- Hasbro's 1999 release says "it has released all rights that it may have to the vintage Atari hardware platform,
  the Jaguar", and does not mention patents or the public domain
  ([Hasbro Interactive release of 1999-05-14][hasbro], fan transcription; lead);
  the lead of [Wikipedia, "Atari Jaguar"][w-jaguar] says that Hasbro released the patents into the public domain.

Other home consoles:

- PC-FX: [Mednafen's documentation][mdf-pcfx] names BIOS version 1.00 as the image it needs ("PC-FX").
  Wikipedia says the console has no polygon processor by design ([Wikipedia, "PC-FX"][w-pcfx], "History").
- Amiga CD32: games use ISO 9660 level 2 mode 1, the machine runs most CDTV titles,
  and a hidden boot menu selects 50 or 60 Hz
  ([Wikipedia, "Amiga CD32"][w-cd32], "Hardware", "Software");
  it was not sold in the United States, because of an import injunction ("History").
- FM Towns Marty: its infobox names Towns OS without saying where it is stored ([Wikipedia, "FM Towns Marty"][w-marty]).
- Playdia: Wikipedia says it has no BIOS or menu and shows a blue screen when started without a disc;
  its "Hardware" list gives ROM in its two microcontrollers without saying what it holds
  ([Wikipedia, "Playdia"][w-playdia]).
- Casio Loopy: a built-in thermal printer makes colour stickers, and the console has 2 MB of ROM
  ([Wikipedia, "Casio Loopy"][w-loopy], infobox).
  That its processor has internal mask ROM
  that has not been dumped is known only from a search-result summary of emulator comments (secondary; lead).
- Pippin: "RSA's public/private key system was used to create the authentication system on the Pippin platform"
  ([Wikipedia, "Apple Pippin"][w-pippin], "System software");
  a developer dongle bypasses it, and the KMP 2000 lacks the check ("Developer marketing", "Technical specifications").
  The infobox gives JP 1996-04-21 and the model table March 1996.
  The operating system, based on System 7.5.2, is on each disc rather than in the console (same article).

### Add-ons and expansion cards

| Add-on | Base | First release | Adds | Firmware | Survey |
|---|---|---|---|---|---|
| 64DD | Nintendo 64 | JP 1999-12 | disk drive, 32-bit coprocessor | IPL ROM in drive | [R1-16][surveys] (inference) |
| Jaguar CD | Atari Jaguar | 1995-09-21 | 2× CD drive | CD BIOS | R1-25 |
| PocketStation | PlayStation 1 | JP 1999-01-23 | ARM7T, 32 × 32 LCD | not described | R1-18 (inference) |
| 3DO Blaster | PC (ISA) | 1994 | a 3DO on a card | as 3DO (inference) | R1-25 |
| PC-FXGA | PC (PC-9800, DOS/V) | JP 1995-12-08; DOS/V 1996-06 | PC-FX plus HuC6273 3D chip | not described | R1-25 |

- Sources by row: each add-on's Wikipedia article, and the PC-FXGA's dates from Japanese Wikipedia;
  the 64DD's firmware cell from [N64brew, "64DD"][n64-64dd], "Physical Memory Map",
  and the Jaguar CD's from [libretro's "Virtual Jaguar"][lr-vj].
- The 64DD's date is 1999-12-11 by Wikipedia's infobox and 1999-12-01 by N64brew and Copetti
  ([Wikipedia, "64DD"][w-64dd]; [N64brew, "64DD"][n64-64dd]; [Copetti, "Nintendo 64 Architecture"][cop-n64]; lead).
  It reads 64 MB magnetic disks and was sold in Japan only ("64DD", "Hardware").
  Disk software carries no lock-out chip, and the drive's firmware completes the secure boot (N64brew, "CIC-NUS").
- Jaguar CD discs use a format based on audio CD rather than CD-ROM data modes, whose incompatibility, the article says,
  foils casual piracy ([Wikipedia, "Atari Jaguar CD"][w-jagcd], "Technicals").
- [libretro's documentation][lr-vj] says that its Virtual Jaguar core compiles the boot ROM
  and both CD BIOS images into itself; those images are firmware, which the project never obtains
  ([ADR 0001, "Context"][adr-context]), and the core's repository is not registered.
- The PocketStation is a PlayStation memory card with a screen, an ARM7T processor, and infrared;
  its software usually comes on PlayStation discs ([Wikipedia, "PocketStation"][w-pocket], "Software").
- The 3DO Blaster needs a Sound Blaster and a CD drive with a Panasonic interface
  ([Wikipedia, "3DO Blaster"][w-blaster]).
- The PC-FXGA adds a 3D chip that the console lacks ([Wikipedia, "PC-FX"][w-pcfx], "PC-FXGA").
  Its PC-9800 board was released on 1995-12-08 and its DOS/V (ISA) board in June 1996;
  a PCI version was announced and never made
  ([Japanese Wikipedia, "PC-FX"][ja-pcfx], "発売後" and "チップセットについて"; the note's own translation).
- The Saturn's [Net Link modem][w-netlink] and the 64DD's modem cartridge are peripherals, not systems.

### Handhelds of the Nintendo families

Identity:

| System (other names) | Maker | First release | Survey | Hub (tier) |
|---|---|---|---|---|
| Virtual Boy | Nintendo | JP 1995-07-21; NA 1995-08-14 | [R1-25][surveys] | [Sacred Tech Scroll][sts] (open) |
| Game Boy Advance (iQue GBA) | Nintendo | JP 2001-03-21; NA 2001-06-11 | R1-11 | [GBATEK copy][gbatek-gba] (open) |
| Game Boy Advance SP (AGS-001, AGS-101) | Nintendo | JP 2003-02-14; NA 2003-03-23 | R1-11 | GBATEK copy (open) |
| Game Boy Micro | Nintendo | JP 2005-09-13; NA 2005-09-19 | R1-11 | GBATEK copy (open) |
| Nintendo DS (iQue DS) | Nintendo | NA 2004-11-21; JP 2004-12-02 | R1-12 | GBATEK copy (open) |
| DS Lite (iQue DS Lite) | Nintendo | JP 2006-03-02; NA 2006-06-11 | R1-12 | GBATEK copy (open) |
| Nintendo DSi (iQue DSi) | Nintendo | JP 2008-11-01; NA 2009-04-05 | R1-12 | [DSiBrew][dsibrew] (open) |
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
  the Game Boy Advance and DS rows on [GBATEK][gbatek-gba]'s "GBA Technical Data" and "DS Technical Data",
  except the DS processor clocks, from [Wikipedia, "Nintendo DS"][w-ds], infobox, where GBATEK gives 66 MHz;
  the DSi rows on [DSiBrew, "Hardware"][dsibrew]; dates and screen sizes on each system's Wikipedia article.
- GBATEK was read in the open `mgba-emu/gbatek` copy at commit `64b5087a`: its [GBA chapter][gbatek-gba] is linked,
  and its DS chapter (`ds.md`) is cited by section name without a link,
  because that file also prints the DS cartridge encryption seeds.

Virtual Boy:

- The [Sacred Tech Scroll][sts] gives a modified V810 called NVC with a 16-bit bus, six sound channels,
  and a reset address inside the game pak's ROM ("CPU", "VSU", "System Reset"), so no console firmware runs (inference).
- Its pak header holds a title, maker code, game code, and version, and the document describes no logo, checksum,
  or other check ("ROM Header"; that there is no lock-out is an inference from that).

Game Boy Advance family:

- [GBATEK][gbatek-gba] gives the system clock as 16 × 1024 × 1024 Hz
  ("System Clock"),
  and says "The GBA's separate 8bit/32bit CPU modes cannot be operated simultaneously" ("GBA Technical Data").
  Wikipedia names the 8-bit core the Sharp SM83 ([Wikipedia, "Game Boy Advance"][w-gba], "Hardware").
- A frame is 228 lines and 280,896 cycles, which gives 59.7275 Hz
  (calculated from the rates),
  where GBATEK writes "ca. 59.737" ("Vertical Dimensions"; inference: a slip in the source).
- GBA cartridges have no save-type field: "Nintendo didn't include a backup-type entry in the ROM header"
  ("GBA Cart Backup IDs"); save types are identified by strings in the ROM (same section).
- The GBA BIOS compares the compressed logo in the cartridge header with its own copy and locks up on a mismatch
  ("GBA Cartridge Header"); the logo's bytes are not recorded here.
  No region check is described there, and the three GBA articles carry Wikipedia's "Regionless game consoles" category
  (inference from the two absences).
- GBATEK says "there seems to be no way to detect SPs by software" ("GBA SP Notes").
  The Game Boy Micro plays only Game Boy Advance paks; its Game Boy processor lacks the other hardware older games need
  ([Wikipedia, "Game Boy Micro"][w-micro], "Software and hardware").

Nintendo DS family:

- GBATEK gives a bus clock of 33.513982 MHz with the ARM9 at twice it,
  and says "the real 66MHz can be used only with cache and tcm,
  all other memory and I/O accesses are delayed to the 33MHz bus clock"
  (DS chapter, "System Clock", "DS Technical Data").
- DS cards use an encrypted bus: the BIOS loads a "secure area" with commands encrypted by a scheme keyed by the game
  code, later transfers are scrambled by a seeded stream, and Download Play programs need an RSA signature (DS chapter,
  "DS Cartridge Secure Area", "KEY1 - Gamecode / Idcode Encryption", the title of the KEY2 section, not read, and "DS
  Wifi Nintendo DS Download Play").
  No table or seed is recorded here.
- DS cards are region-free, except that iQue DS games do not run on DS units of other regions
  ([Wikipedia, "Nintendo DS"][w-ds], "China"), and GBATEK reports a firmware-version check ("iQue Notes").
- The DS plays Game Boy Advance paks in its second slot ("Nintendo DS", "Compatibility"); the DSi has no such slot
  (GBATEK, "GBA Slot").
- The DSi's ARM9 runs at 133 MHz in DSi mode and 66 MHz in DS mode, beside a CEVA XpertTeak signal processor,
  and its system software is on eMMC NAND, with an SD card slot ([DSiBrew, "Hardware"][dsibrew]).
  GBATEK's Teak sections are closed in the register and were not read.
- GBATEK says DSi cards carry an extended header with an RSA signature, which hinders unlicensed code
  ("DSi Basic Differences to NDS"; read by the research agent and the first pass, not since,
  because the file also prints seed values).
- The DSi is region-locked for its own software and not for DS cards
  ([Wikipedia, "Nintendo DSi"][w-dsi], "Software library").

### Other systems first sold to 2000

| System (other names) | Maker | First release | CPU | Media | Survey |
|---|---|---|---|---|---|
| Nuon | VM Labs; device makers | 2000-07 | four Nuon MPEs, 54 or 108 MHz | DVD | [R1-25][surveys] |
| E-kara | Takara (Hasbro in the US) | JP 2000-10-20; NA 2001-10-06 | not named | song cartridge | R1-25 |
| Pixter and its models | Rehco; Mattel | 2000 | 6502-based; Color: ARM7TDMI, 70 MHz | cartridge | R1-25 |

- [R1-07][r107] first listed these three; they are here because each was first sold in 2000.
  None has a hub beyond Wikipedia.
- Nuon is a technology built into DVD players and one set-top box, not a console of its own: Samsung, Toshiba,
  and RCA sold Nuon DVD players, and Motorola a set-top box ([Wikipedia, "Nuon (DVD technology)"][w-nuon], "History").
  Its four 128-bit VLIW media processing elements operate on scalars of at most 32 bits,
  beside 32 MiB of DRAM and 512 KiB of sound RAM (same, "Specification").
  By November 2004 no Nuon player was shipping (same, "History").
- The E-kara's main unit is a microphone, and songs and some games come on cartridges inserted into it
  ([Wikipedia, "E-kara"][w-ekara], opening section and "Karaoke functions"); its infobox names no processor.
- The Pixter is a children's touchscreen drawing handheld ([Wikipedia, "Pixter"][w-pixter], opening section).
  Its model table gives a 6502-based Sunplus chip for most models and a Sharp LH75411, an ARM7TDMI,
  for the Pixter Color, citing a personal page (same, "Models").
- No protection is described for any of the three, by a search of each article for "protect", "encrypt", "region",
  and "BIOS".

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
| LeapFrog Didj | 2008 | R1-07, until R1-08 lists it |
| Dingoo A320 | 2009 | R1-08, as an emulator host |
| Game Boy Player | JP 2003-03-21 | R1-07 |
| 32X | NA 1994-11-21 | [R1-05][r105], with the Genesis |

- First-sale dates are from each device's Wikipedia article as read for this note
  ([GP32][w-gp32]; [N-Gage][w-ngage]; [Tapwave Zodiac][w-zodiac]; [Leapster][w-leapster]; [V.Smile][w-vsmile];
  [Gizmondo][w-gizmondo]; [GP2X][w-gp2x]; [LeapFrog Didj][w-didj]; [Dingoo][w-dingoo]; [Game Boy Player][w-gbp];
  [32X][w-32x]), and the P/ECE's from [Japanese Wikipedia, "PIECE"][ja-piece].
- Placement follows the first-sale rule in ["How the catalogue is built"](#how-the-catalogue-is-built).

### Emulator hosts and cancelled machines

- The PlayStation Classic (2018-12-03) runs PlayStation games in an emulator
  ([Wikipedia, "PlayStation (console)"][w-ps], "PlayStation Classic"); it is a host, left to [R3-07][phase3].
- The Panasonic M2, with two PowerPC 602 processors,
  was cancelled as a console in 1997 and used in a Konami arcade board
  ([Wikipedia, "Panasonic M2"][w-m2], "Use in other hardware").
- A catalogue lists systems that were sold
  ([roadmap, "Hardware primers"][primers]),
  so cancelled machines, such as the Super NES CD-ROM, Atari Panther, Konix Multisystem, and Sega Neptune, have no row
  ([Wikipedia, "Super NES CD-ROM"][w-snescd]; ["Atari Panther"][w-panther]; ["Konix Multisystem"][w-konix];
  [the fifth-generation article][w-fifth], "Other consoles").
- Arcade boards built from these consoles, such as the ST-V, CoJag, Aleck 64, and Konami's M2 board,
  belong to [R1-24][surveys] (each base system's article).

### Boundary cases

| System | Word-size rule | Wikipedia generation | Placed here as |
|---|---|---|---|
| Game Boy Advance family | 32-bit | sixth | here, by survey [R1-11][surveys] |
| Nintendo DS and DSi | 32-bit | seventh | here, by survey R1-12 |
| iQue Player | 64-bit | fifth | here, as a Nintendo 64 model (survey R1-16, inference) |
| Virtual Boy | 32-bit | fifth | here, by first sale |
| Playdia | 8-bit | fifth | here, by first sale; [R1-05][r105] left it here |
| PC-FX, Amiga CD32 | 32-bit | fifth | here, by first sale |
| FM Towns Marty | 32-bit core, 16-bit bus | fifth (category fourth) | here, by first sale |
| PocketStation | 32-bit | fifth | add-on row here, by first sale |
| Nuon | 128-bit MPEs; 32-bit scalars | sixth | here, by first sale |

- Placements rest on the roadmap's survey dependencies, the rule of [#22][pr22], and the first-sale rule;
  generations and word sizes on each system's Wikipedia article, the GBA's and DS's word size on [GBATEK][gbatek-gba],
  and the Playdia's on R1-05.
- Systems of other eras that sources place near this one are listed where they are catalogued: the 32X, CD-i,
  Super A'Can, and CPS Changer in R1-05, and the PSP, Dreamcast and its VMU, 3DS, and PlayStation 2 in [R1-07][r107],
  each as that note records ([Wikipedia, "Dreamcast"][w-dreamcast]; ["VMU"][w-vmu]; ["CD-i"][w-cdi];
  ["CP System"][w-cps]; ["Super A'Can"][w-acan]; ["PlayStation Portable"][w-psp]).

### Patterns across the catalogue

- Processor families repeat: MIPS in the Sony and Nintendo 64 machines, SuperH in the Saturn and Loopy,
  Arm in the 3DO and the Nintendo handhelds, and the V810 in the Virtual Boy and PC-FX (rows above).
- Protection takes three forms (inference from the rows):
  - physical marks checked in the drive: the PlayStation 1's wobble and the Saturn's ring;
  - a chip in each cartridge checked by the console: the Nintendo 64;
  - cryptographic signatures or encryption: the 3DO by one source, the Pippin, the iQue Player, the DS and DSi cards,
    and the Jaguar by inference from Wikipedia.
- For the last form, booting retail software in the original way needs keys, which notes never hold ([R0-04][r004]).
  The form is not new to this era: R1-05 records the NTSC Atari 7800's cartridge signature.
  The Jaguar CD's disc format deters copying by incompatibility rather than by a check (inference).
- Firmware: every one of the 12 home consoles names firmware or a boot stage except the Playdia,
  whose ROM is not described, and the iQue Player; so do the 64DD, Jaguar CD, Game Boy Advance, and DS families.
  The Virtual Boy is the only system found to start in cartridge ROM
  (rows above; the Virtual Boy point is an inference from its reset address).
- Disc images do not carry the PlayStation 1's wobble or the Saturn's ring,
  because both sit outside the user data that an image holds
  (inference from where the marks sit),
  so an emulator reports the drive's result instead of reading the mark,
  and for the PlayStation 1 that result carries the region string (inference).

### Coverage of sources

- PlayStation 1: the maker patent, [Walker's compilation][walker],
  and [Doomed's "cdinfo.txt"][doomed] cover the disc check only;
  the two documents were searched for the region string and the buffer alone.
  No open-tier hardware reference free of the tainted document was used for hardware facts here,
  although [R0-05][r005] names open candidates.
- Nintendo 64: [N64brew][n64-vr4300] (open) and two maker patents.
  N64brew's copy of NEC's VR4300 manual is maker material hosted by others and was not opened.
  Its PIF page holds secret keys and its CIC page prints a boot secret; neither was recorded,
  and the register now closes both.
- Saturn: [Copetti][cop-ss] (lead), [Mednafen's documentation][mdf-ss]
  (open prose of a walled emulator), and English and [Japanese Wikipedia][ja-saturn].
  Sega Retro served a bot check; the Yabause wiki refused access during research and answered on a recheck,
  and its main page links no BIOS page (research log).
- 3DO: maker patents and the [3DO Development Repo][3do-start] (open).
  The site also indexes 3DO Company documents, Portfolio source for the 3DO and the M2, and key pages; none was opened,
  and the register now closes those paths.
  The guard blocks their slash-path and colon-path addresses; the query forms of the wiki software
  (`doku.php?id=`, `fetch.php?media=`, and N64brew's `index.php?title=`) pass it, a gap left to a guard task.
- Jaguar, PC-FX, CD32, Marty, Playdia, Loopy, Pippin: Wikipedia,
  [Mednafen's][mdf-pcfx] and [libretro's][lr-vj] documentation, and leads.
- Makers' manuals for the custom-chip processors were found and left to [R1-02][r102]:
  Renesas's [SH7020 and SH7021 hardware manual][ren-sh7021] (Loopy) and [µPD70732 data sheet][ren-v810] (V810),
  and NXP's [MC68020 and MC68EC020][nxp-68020] (CD32) and [MPC603e][nxp-603e] (Pippin) manuals,
  each confirmed by its title page; nxp.com refuses scripted requests, so the link checker skips it.
  The V810 data sheet points to a V805 and V810 hardware user's manual, U10661E, and to U10082E,
  which a site-restricted search did not find on Renesas, and no Renesas document for the VR4300 was found
  (research log).
- Game Boy Advance, DS, DSi: [GBATEK][gbatek-gba],
  read in the open `mgba-emu/gbatek` copy because the author's site returned HTTP 403
  (research log), and [DSiBrew][dsibrew].
  The copy holds GBATEK's DSi Teak and BPTWL sections, which the register closes at the author's site,
  and a KEY2 section that lists seed values; none of them is opened, by the written rule
  ([Recommendation](#recommendation)).
- Nuon, E-kara, Pixter: Wikipedia alone.

## Options and trade-offs

### How deeply R1-25 studies the rows it takes

- **What:** [R1-25][surveys] studies each of its rows here in full,
  or treats them at catalogue depth and studies in full only those that [R6-01][phase6] selects.
- **Costs:** in full adds 15 studies (the 12 consoles and handhelds and 3 add-ons whose survey is R1-25),
  most of them resting on Wikipedia (counted from the rows above); catalogue depth leaves the 3DO, Jaguar, PC-FX,
  Virtual Boy, and Nuon, among others, without an emulator survey.
- **Gains:** in full gives R6-01 the widest choice; catalogue depth keeps the research finite.
- **Used by:** the roadmap, which gives every unnamed system to R1-25 ([pull request #30][pr30]).

### Firmware for systems that need it

- **What:** for each firmware row, run user-supplied firmware, emulate its services at a high level,
  or start from the state firmware leaves.
- **Costs:** user-supplied firmware has no settled lawful route
  ([R0-02][r002], Summary and ["Firmware, keys, and game copies"][r002-fw]);
  high-level emulation needs a description of the services,
  which for the Saturn is known here only from [Copetti's account][cop-ss], which cites a Sega manual not opened.
- **Gains:** the three routes differ by system; the Virtual Boy needs none (inference).
- **Used by:** Mednafen's [PC-FX][mdf-pcfx], [PlayStation][mdf-psx],
  and [Saturn][mdf-ss] modules and libretro's [Opera][lr-opera] and [Beetle PC-FX][lr-pcfx] cores ask
  for firmware images; [libretro's Virtual Jaguar][lr-vj] embeds them and also offers a high-level BIOS;
  [R2-12][phase2] will weigh the routes.

### Systems whose protection is cryptographic

- **What:** emulate them only with decrypted or unsigned software, require the user to supply keys, or leave them out.
- **Costs:** [R0-02][r002] records the exposure of each route; the iQue Player re-encrypts each title for one console
  ([Wikipedia, "iQue Player"][w-ique], "Games").
- **Gains:** the first two keep the systems in scope; leaving them out removes the question.
- **Used by:** this catalogue records which systems use signatures or encryption.

### Recommendation

- **Depth of R1-25:** treat its rows here at catalogue depth, and study in full any row [R6-01][phase6] selects.
  These rows rest mostly on Wikipedia
  ([Coverage of sources](#coverage-of-sources)),
  and the systems the roadmap requires (Nintendo handhelds) and wants (PlayStation 1) all have family surveys
  ([roadmap, "Scope"][roadmap-scope]).
- **Firmware:** plan each firmware row around a high-level replacement or a start from the post-boot state,
  with user-supplied firmware an optional route only if [R2-12][phase2] and [R0-02][r002] settle a lawful one.
  The project may not obtain firmware
  ([ADR 0001][adr]),
  user-supplied firmware has no settled lawful route (R0-02),
  and [libretro's Virtual Jaguar][lr-vj] has a high-level BIOS for cartridges
  that its documentation says boots most commercial titles; the Virtual Boy needs none, and R2-12 chooses per system.
- **Cryptographic protection:** emulate the check's outcome,
  including the PlayStation 1 drive's reply with its region string, run software that is already decrypted or unsigned,
  and never require, request, or hold keys.
  Notes never hold keys ([R0-04][r004]), and R0-02 records the exposure of each route.
  Whether the iQue Player can run anything without per-console keys is open ([Open questions](#open-questions)).
- **The GBATEK copy's DSi Teak and BPTWL sections:** for the proposed amendment of ADR 0001,
  close the pages of a source whose author names leaked material as their source, and keep the rest at its tier;
  until then the closure rests on the written rule, because the guard cannot close sections of one file.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is a decision for [R6-01][phase6];
  the survey column shows which survey will study each row.
- Nearly every home console here needs firmware the project may not obtain ([ADR 0001][adr]; [R0-02][r002]).
  Whether each can run from its post-boot state or a high-level replacement feeds [R2-12][phase2] (inference).
- Cryptographic protection, met earlier in the NTSC Atari 7800's cartridge signature ([R1-05][r105]),
  appears on several systems in this era: the DS and DSi cards, the iQue Player, the Pippin, the 3DO by one source,
  and the Jaguar by inference from Wikipedia.
  These rows bring keys and signatures into scope for R0-02 and for the firmware ADR
  that [R6-03][phase6] may propose (inference).
- The PlayStation 1, which the owner wants
  ([roadmap, "Scope"][roadmap-scope]),
  has no open hardware hub free of the tainted document in this catalogue,
  beyond the drive facts of two older documents; this feeds [R0-05, option 8][r005-opt8] and [R5-12][phase5],
  for [R1-02][r102] and [R1-18][surveys].
- The 3DO Development Repo's key, document,
  and source paths and N64brew's PIF and CIC pages are now closed in the [register][register], with guard tests;
  the wiki query forms that still pass need a guard task ([Coverage of sources](#coverage-of-sources)).

## Open questions

- Did any 3DO product use the radial-wobble disc of [WO 97/45836][wo9745836] and [US 5,809,006][us5809006]?
  Examining a pressed disc of an M2-based product, hardware the project does not own,
  or a maker document that names the scheme, would answer it.
- Which parts of the 3DO's Portfolio operating system sit in the console's CPU ROM, and which load from disc?
  [R2-12][phase2], from the 3DO Company's patents or an open-tier emulator's prose documentation.
- What services does the Saturn's firmware provide to games?
  [R1-22][surveys], from [Mednafen's prose][mdf-ss], or a [phase 5][phase5] test on a console; MacDonald's Saturn notes,
  read for this, mention the boot ROM only in a memory map.
- Can the iQue Player run any title without its per-console keys, for example from a copy already decrypted?
  [R1-16][surveys], with [R0-02][r002] for the exposure;
  the one source read says only that titles are re-encrypted for one console on first launch.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext, and each link is pinned to the revision read;
six of those revisions are dated 2026-11-20
("Game Boy Advance", "Nintendo DSi", "PlayStation Portable", "Amiga CD32", "Apple Pippin", and Japanese "PC-FX").

Wikipedia, home consoles and add-ons:

- ["Fifth generation of video game consoles"][w-fifth]; ["List of home video game consoles"][w-homelist].
- ["PlayStation (console)"][w-ps]; ["PlayStation technical specifications"][w-psspec];
  ["PlayStation models"][w-psmodels]; ["Net Yaroze"][w-yaroze]; ["PocketStation"][w-pocket];
  ["Compact Disc Digital Audio"][w-cdda].
- ["Nintendo 64"][w-n64]; ["Nintendo 64 Game Pak"][w-gamepak]; ["64DD"][w-64dd]; ["iQue Player"][w-ique].
- ["Sega Saturn"][w-saturn]; ["Sega Net Link"][w-netlink]; ["32X"][w-32x].
- ["3DO"][w-3do]; ["3DO Blaster"][w-blaster]; ["Panasonic M2"][w-m2].
- ["Atari Jaguar"][w-jaguar]; ["Atari Jaguar CD"][w-jagcd]; ["List of Atari Jaguar homebrew games"][w-jaghb],
  whose revision time stamp, 2026-11-21T01:37Z, is in UTC.
- ["PC-FX"][w-pcfx]; ["Amiga CD32"][w-cd32]; ["FM Towns Marty"][w-marty]; ["Playdia"][w-playdia];
  ["Casio Loopy"][w-loopy]; ["Apple Pippin"][w-pippin].
- ["Nuon (DVD technology)"][w-nuon]; ["E-kara"][w-ekara].
- ["Dreamcast"][w-dreamcast]; ["VMU"][w-vmu]; ["CD-i"][w-cdi]; ["CP System"][w-cps]; ["PlayStation 2"][w-ps2];
  ["Nintendo 3DS"][w-3ds].
- ["Super NES CD-ROM"][w-snescd]; ["Atari Panther"][w-panther]; ["Konix Multisystem"][w-konix]; ["Super A'Can"][w-acan].

Wikipedia, handhelds:

- ["Virtual Boy"][w-vb]; ["Game Boy Advance"][w-gba]; ["Game Boy Advance SP"][w-gbasp]; ["Game Boy Micro"][w-micro];
  ["Game Boy Player"][w-gbp]; ["IQue"][w-iqueco].
- ["Nintendo DS"][w-ds]; ["Nintendo DSi"][w-dsi]; ["PlayStation Portable"][w-psp].
- ["Pixter"][w-pixter].
- For the cross-references: ["GP32"][w-gp32]; ["GP2X"][w-gp2x]; ["N-Gage"][w-ngage]; ["Tapwave Zodiac"][w-zodiac];
  ["Gizmondo"][w-gizmondo]; ["Leapster"][w-leapster]; ["LeapFrog Didj"][w-didj]; ["V.Smile"][w-vsmile];
  ["Dingoo"][w-dingoo]; ["List of handheld game consoles"][w-handlist].

Japanese Wikipedia (translations are the note's own):

- ["セガサターン"][ja-saturn], "バリエーション", which the "Hiサターン" and "Vサターン" titles redirect to.
- ["PC-FX"][ja-pcfx], "発売後" and "チップセットについて".
- ["PIECE"][ja-piece], an ID taken by the verification pass after the research agent's query failed (research log).

Hubs and references:

- N64brew wiki, ["64DD"][n64-64dd] (revision 5543) and ["VR4300"][n64-vr4300] (5928).
  Its "CIC-NUS" (5619) and "PIF-NUS" (5759, opening only) pages,
  `n64brew.dev/wiki/CIC-NUS` and `n64brew.dev/wiki/PIF-NUS`, are not linked because they print key or seed material.
- GBATEK, Markdown copy in mGBA's repository, commit `64b5087a`, "Extracted from no$gba version 3.06":
  [`gba.md`][gbatek-gba], and `ds.md` beside it, not linked because it prints the DS cartridge encryption seeds;
  the DSi Teak and BPTWL sections were not read.
- [DSiBrew, "Hardware"][dsibrew] (revision 2099901).
- [Sacred Tech Scroll, Virtual Boy][sts].
- 3DO Development Repo, index pages only, read through their raw exports: ["start"][3do-start],
  ["documentation/hardware"][3do-hw], ["documentation/hardware_revisions"][3do-hwrev],
  ["documentation/patents"][3do-pat], "documentation/encryption"
  (`3dodev.com/documentation/encryption`, not linked: it links key archives),
  ["software/emulation"][3do-emu], and "software/operating_systems"
  (`3dodev.com/software/operating_systems`, not linked: it serves closed source archives),
  last modified 2026-08-04, 2026-02-20, 2023-01-15, 2022-11-07, 2022-11-07, 2026-03-02, and 2022-11-07.
- Mednafen documentation, ["PC-FX"][mdf-pcfx], ["Sony PlayStation"][mdf-psx], ["Sega Saturn"][mdf-ss],
  "Valid as of 1.32.1".
- libretro documentation, ["Virtual Jaguar"][lr-vj], ["Opera"][lr-opera], ["Beetle PC-FX"][lr-pcfx],
  each last updated 2026-10-22.
- R. Copetti (leads): ["PlayStation Architecture"][cop-ps] and ["Nintendo 64 Architecture"][cop-n64],
  modified 2026-08-19, ["Sega Saturn Architecture"][cop-ss], 2026-10-31, and ["Nintendo DS Architecture"][cop-nds],
  2026-06-10.
- J. Walker, ["Everything You Have Always Wanted to Know about the Playstation But Were Afraid to Ask"][walker],
  version 1.1, the CD-ROM commands, appendix D, and the memory-card chapter, read through text extraction.
- Doomed, ["cdinfo.txt"][doomed], "Quick CDrom explanation".
- A. MacDonald, `sattech.txt` in the register's `dreamjam.co.uk/emuviews`
  (open; a lead), read for the BIOS only and not cited for facts.
- Renesas, ["SH7020 and SH7021 Hardware Manual"][ren-sh7021] and ["µPD70732 data sheet"][ren-v810], title pages.
- NXP, ["MC68020 MC68EC020 Microprocessors User's Manual"][nxp-68020]
  and ["MPC603e RISC Microprocessor User's Manual"][nxp-603e], title pages and, for the second,
  its section on the differences from the MPC603.
- [Hasbro Interactive release of 1999-05-14][hasbro], fan transcription (lead).

Patents, front pages, abstracts, and for US 6,304,971 the full text:

- [US 6,304,971][us6304971] (Kutaragi and Hirano, c/o Sony Corporation;
  assignee Sony Computer Entertainment Inc. by its Certificate of Correction), read from the Patent Office's copy.
- [US 6,190,257][us6190257] (Nintendo), read from the Patent Office's front page.
- [US 5,502,462][us5502462], [US 5,572,235][us5572235], [US 5,596,693][us5596693], [WO 97/45836][wo9745836],
  and [US 5,809,006][us5809006] (The 3DO Company; the last two with or by CagEnt Technologies),
  the last from the Patent Office's front page.
- [WO 94/10641][wo9410641], "Audio/Video Computer Architecture"
  (The 3DO Company), the 3DO Development Repo's copy, read through text extraction.
- A [Google Patents][gpatents] search for Atari cartridge-authentication patents.

Project documents:

- The [research roadmap][roadmap], with its era rule from [pull request #22][pr22]
  and its survey dependencies from [pull request #30][pr30], both merged to `main` on 2026-11-20; [R0-02][r002];
  [R0-04][r004]; [R0-05][r005]; [ADR 0001][adr]; the [source register][register].
- [R1-05][r105], [R1-07][r107], and [R1-08][r108], for their rows and placements.

[roadmap]: ../../roadmap/research.md
[guide]: ../README.md#claim-status
[roadmap-scope]: ../../roadmap/research.md#scope
[primers]: ../../roadmap/research.md#hardware-primers
[surveys]: ../../roadmap/research.md#system-family-surveys
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[pr22]: https://github.com/jsamuelsen11/rustalgia-emu/pull/22
[pr30]: https://github.com/jsamuelsen11/rustalgia-emu/pull/30
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
[w-fifth]: https://en.wikipedia.org/?oldid=1384599937
[w-homelist]: https://en.wikipedia.org/?oldid=1386685039
[w-ps]: https://en.wikipedia.org/?oldid=1386319193
[w-psspec]: https://en.wikipedia.org/?oldid=1362538225
[w-psmodels]: https://en.wikipedia.org/?oldid=1386181677
[w-yaroze]: https://en.wikipedia.org/?oldid=1378707385
[w-pocket]: https://en.wikipedia.org/?oldid=1382885501
[w-cdda]: https://en.wikipedia.org/?oldid=1385472206
[w-n64]: https://en.wikipedia.org/?oldid=1386077971
[w-gamepak]: https://en.wikipedia.org/?oldid=1386318295
[w-64dd]: https://en.wikipedia.org/?oldid=1386308027
[w-ique]: https://en.wikipedia.org/?oldid=1355022059
[w-saturn]: https://en.wikipedia.org/?oldid=1384300813
[w-netlink]: https://en.wikipedia.org/?oldid=1364854330
[w-32x]: https://en.wikipedia.org/?oldid=1385340621
[w-3do]: https://en.wikipedia.org/?oldid=1383977414
[w-blaster]: https://en.wikipedia.org/?oldid=1374925870
[w-m2]: https://en.wikipedia.org/?oldid=1381859043
[w-jaguar]: https://en.wikipedia.org/?oldid=1386053059
[w-jagcd]: https://en.wikipedia.org/?oldid=1371086294
[w-jaghb]: https://en.wikipedia.org/?oldid=1386857183
[w-pcfx]: https://en.wikipedia.org/?oldid=1352943842
[w-cd32]: https://en.wikipedia.org/?oldid=1386758766
[w-marty]: https://en.wikipedia.org/?oldid=1379254432
[w-playdia]: https://en.wikipedia.org/?oldid=1385569273
[w-loopy]: https://en.wikipedia.org/?oldid=1377306489
[w-pippin]: https://en.wikipedia.org/?oldid=1386811011
[w-nuon]: https://en.wikipedia.org/?oldid=1383941718
[w-ekara]: https://en.wikipedia.org/?oldid=1386089717
[w-dreamcast]: https://en.wikipedia.org/?oldid=1386172458
[w-vmu]: https://en.wikipedia.org/?oldid=1379027676
[w-cdi]: https://en.wikipedia.org/?oldid=1384443552
[w-cps]: https://en.wikipedia.org/?oldid=1385997383
[w-ps2]: https://en.wikipedia.org/?oldid=1386205170
[w-3ds]: https://en.wikipedia.org/?oldid=1386371150
[w-snescd]: https://en.wikipedia.org/?oldid=1386184486
[w-panther]: https://en.wikipedia.org/?oldid=1336176915
[w-konix]: https://en.wikipedia.org/?oldid=1382575305
[w-acan]: https://en.wikipedia.org/?oldid=1378214813
[w-vb]: https://en.wikipedia.org/?oldid=1384432040
[w-gba]: https://en.wikipedia.org/?oldid=1386719051
[w-gbasp]: https://en.wikipedia.org/?oldid=1382257211
[w-micro]: https://en.wikipedia.org/?oldid=1372511713
[w-gbp]: https://en.wikipedia.org/?oldid=1385936501
[w-iqueco]: https://en.wikipedia.org/?oldid=1386607666
[w-ds]: https://en.wikipedia.org/?oldid=1384607359
[w-dsi]: https://en.wikipedia.org/?oldid=1386756319
[w-psp]: https://en.wikipedia.org/?oldid=1386784394
[w-pixter]: https://en.wikipedia.org/?oldid=1379566018
[w-gp32]: https://en.wikipedia.org/?oldid=1379015467
[w-gp2x]: https://en.wikipedia.org/?oldid=1385314903
[w-ngage]: https://en.wikipedia.org/?oldid=1386180025
[w-zodiac]: https://en.wikipedia.org/?oldid=1372920485
[w-gizmondo]: https://en.wikipedia.org/?oldid=1386173978
[w-leapster]: https://en.wikipedia.org/?oldid=1385502801
[w-didj]: https://en.wikipedia.org/?oldid=1381158352
[w-vsmile]: https://en.wikipedia.org/?oldid=1385799892
[w-dingoo]: https://en.wikipedia.org/?oldid=1379337765
[w-handlist]: https://en.wikipedia.org/?oldid=1384273411
[ja-saturn]: https://ja.wikipedia.org/?oldid=111794107
[ja-pcfx]: https://ja.wikipedia.org/?oldid=111840249
[ja-piece]: https://ja.wikipedia.org/?oldid=110504604
[n64-64dd]: https://n64brew.dev/wiki/64DD
[n64-vr4300]: https://n64brew.dev/wiki/VR4300
[gbatek-gba]: https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md
[dsibrew]: https://dsibrew.org/w/index.php?title=Hardware&oldid=2099901
[sts]: http://perfectkiosk.net/stsvb.html
[3do-start]: https://3dodev.com/start
[3do-hw]: https://3dodev.com/documentation/hardware
[3do-hwrev]: https://3dodev.com/documentation/hardware_revisions
[3do-pat]: https://3dodev.com/documentation/patents
[3do-emu]: https://3dodev.com/software/emulation
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
[walker]: https://hitmen.c02.at/files/docs/psx/psx.pdf
[doomed]: https://hitmen.c02.at/files/docs/psx/cdinfo.txt
[ren-sh7021]: https://www.renesas.com/en/document/mah/superh-risc-engine-sh7020-and-sh7021-hd6437020-hd6477021-hd6437021-hd6417021
[ren-v810]: https://www.renesas.com/en/document/dst/upd70732-data-sheet
[nxp-68020]: https://www.nxp.com/docs/en/data-sheet/MC68020UM.pdf
[nxp-603e]: https://www.nxp.com/docs/en/reference-manual/MPC603EUM.pdf
[hasbro]: https://mail.atariage.com/Jaguar/archives/HasbroRights.html
[us6304971]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6304971
[us6190257]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6190257
[us5502462]: https://patents.google.com/patent/US5502462A/en
[us5572235]: https://patents.google.com/patent/US5572235A/en
[us5596693]: https://patents.google.com/patent/US5596693A/en
[wo9745836]: https://patents.google.com/patent/WO1997045836A1/en
[us5809006]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5809006
[wo9410641]: https://3dodev.com/_media/documentation/patents/wo09410641a1_-_audio_-_video_computer_architecture.pdf
[gpatents]: https://patents.google.com/
