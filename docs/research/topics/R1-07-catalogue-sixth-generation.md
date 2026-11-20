---
title: "The sixth generation and the move to programmable graphics: catalogue"
roadmap_item: R1-07
status: draft
date: 2026-11-20
---

# The sixth generation and the move to programmable graphics: catalogue

## Summary

This note asks which dedicated consoles and handhelds belong to the era of the sixth-generation primer,
and what hardware, protection, firmware, and sources each has.
It lists the seven home systems and three handheld families that this note places here by the roadmap's survey rule
(Dreamcast, PlayStation 2, GameCube, Xbox, Wii, Wii U, Xbox 360; PSP, PlayStation Vita, and the Nintendo 3DS family),
with their models and combined units, and 22 rows of minor, educational,
and boundary systems first sold from 2000 to 2011.
Emulator hosts and cancelled systems are listed apart.
Every major system here protects its software in some way: the Dreamcast by its disc format, scrambled executables,
and region lock-out; the PlayStation 2 by copy protection in its drive and MagicGate memory cards;
the GameCube by disc authentication and an XOR-encrypted disc and IPL; the Xbox, Wii,
and Xbox 360 by boot chains that start in a chip and check hashes or signatures;
and the Wii U by cryptographic engines in a security processor, though no source read describes its boot
(rows below; the grouping is the note's).
For the minor systems Wikipedia is the only source found, apart from Sega Retro's page on the Advanced Pico Beena.
No maker document was found for the era's main GPUs among the hubs read and the register's maker lines;
the register lists one paper by staff of the PICA200's maker, which was not read (research log).
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of this era were sold, and for each, what are its maker, release,
  processor, video, audio, media, protection, firmware, survey, class, and sources?
- Covered: the systems whose family surveys depend on `R1-03`
  (`R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22` for the Dreamcast, and `R1-23` for the Xbox and Xbox 360),
  their models and combined units, and the minor home and handheld systems sold in the same years.
  How the hardware works is left to the primer (`R1-03`); each family's emulators to its survey; the law on encryption,
  firmware, and keys to `R0-02`; each hub's evaluation to `R0-05`.
  The roadmap's host classes, PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles,
  are listed only as emulator hosts, left to `R3-07` and `R3-12`
  (roadmap, "Hardware primers"); this note also treats PC-based home systems and Linux handhelds as hosts (inference).
- Researched on 2026-11-20 against the Wikipedia revisions and hub pages listed in Sources.
- How claims were checked: two research agents, one for home systems and one for handhelds,
  read every page as raw text on 2026-11-20, Wikipedia through its raw wikitext;
  no value here comes from a summarising tool.
  One independent verification pass has run so far: seven verifiers, each taking a part of the note,
  fetched the sources again and tested each claim and quotation.
  Each of their findings was checked against the raw source once more before the text was changed;
  the corrections were applied, and the claims they could not check are listed in the pull request.
  Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed.
  Markers follow the research guide (`docs/research/README.md`,
  "Claim status"): "(inference)" marks reasoning, "(from memory)" a claim no fetched page confirmed,
  "(research log)" an event while gathering the evidence,
  and "(lead)" a fact from a personal site that the register marks as a lead (Comstedt and Copetti), not relied on.
  A Wikipedia article's opening paragraphs are called its "opening", to keep "lead" for the marker.
  A statement that nothing was found names what was searched;
  "not stated" and "not established" in a table mean the system's article and its hub, where one is named,
  give no value.
- What was not opened: firmware, BIOS or IPL images, key and exploit pages, bootloader listings, games,
  maker manuals hosted by others, and emulator code.
  One fuse page, Free60's, was opened during research before it was found to show a console's key material;
  nothing from it is recorded or cited, and it was not opened again.
  Where a hub page described a security mechanism, only its prose paragraphs were read, and no key value was recorded.

## Findings

### How the catalogue is built

- An era holds the systems whose family survey depends on its primer (roadmap, "Hardware primers").
  That rule puts in this era three systems that Wikipedia's infoboxes place in the seventh and eighth generations,
  the Wii, Wii U, and Xbox 360, and the PSP, Vita, and 3DS families; it leaves the PlayStation 3 to `R1-04`
  (roadmap, `R1-21`).
- Where a survey depends on more than one primer
  (`R1-13`, `R1-19`, `R1-22`, `R1-23`),
  this note takes only the survey's systems sold in the years of this era; that tie-break is the note's own rule.
- Systems that no survey names are placed here by their years of sale, 1998 to 2013, unless `R1-05` already lists them.
  `R1-06` (its draft, on its branch) also lists five of them, the GP32, N-Gage, Tapwave Zodiac, Leapster, and Gizmondo;
  they are kept here only as flagged overlaps, and the owner decides which catalogue keeps them ("Boundary cases").
- A row is one machine or one compatible family;
  the handheld identity table gives each model its own row because their release dates differ.
  Revisions, regional models, and combined units, meaning a console built into another consumer device,
  are listed under the machine they run.
- "Class": D is a dedicated console, "D (variants)" a row of its models, and "D (toy)" a toy sold as one;
  "combined" a dedicated console inside another device;
  "add-on" a unit attached to a console to run another system's games;
  "boundary" a case the owner's rule does not settle, with the other kind of device in parentheses.
- "Survey" names the family survey whose title includes the system or its family; a dash means none does.
- "Hub" names the best source other than Wikipedia, as registered, preferring an open-tier hub to a lead;
  a dash means Wikipedia was the only one found.
- Regions: NA North America, US United States, EU Europe, PAL the PAL markets, UK United Kingdom, JP Japan,
  KR South Korea, CN China, HK Hong Kong, AU Australia, BR Brazil, MX Mexico, CA Canada.

### Home consoles

Identity (each system's Wikipedia article, infobox):

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Dreamcast (Katana) | Sega | JP 1998-11-27; NA 1999-09-09; EU 1999-10-14; AU 1999-11-30 | R1-22 | Comstedt (lead) |
| PlayStation 2 | Sony Computer Entertainment | JP 2000-03-04; NA 2000-10-26; EU 2000-11-24 | R1-19 | ps2tek |
| GameCube (Dolphin, DOL) | Nintendo (ArtX, IBM chips) | JP 2001-09-14; NA 2001-11-18; EU 2002-05-03 | R1-17 | YAGCD |
| Xbox | Microsoft | NA 2001-11-15; JP 2002-02-22; PAL 2002-03-14 | R1-23 | XboxDevWiki |
| Wii (Revolution, RVL) | Nintendo | NA 2006-11-19; JP 2006-12-02; AU 2006-12-07; EU 2006-12-08 | R1-17 | WiiBrew |
| Xbox 360 (Xenon) | Microsoft | NA 2005-11-22; EU 2005-12-02; JP 2005-12-10 | R1-23 | Free60 |
| Wii U (Project Café) | Nintendo | NA 2012-11-18; EU 2012-11-30; JP 2012-12-08 | R1-17 | WiiUBrew |

Hardware (each system's Wikipedia article, infobox and "Hardware" or specifications article; hubs as in the bullets):

| System | CPU | Video | Audio | Media |
|---|---|---|---|---|
| Dreamcast | Hitachi SH-4, 200 MHz | NEC PowerVR2, 100 MHz | Yamaha AICA with an ARM7 | GD-ROM, CD-ROM |
| PlayStation 2 | Emotion Engine, 294.912 MHz; IOP | Graphics Synthesizer, 4 MiB eDRAM | SPU2 | DVD, CD |
| GameCube | IBM Gekko, 486 MHz | ATI (ArtX) Flipper, 162 MHz | Macronix DSP in Flipper | GameCube Game Disc |
| Xbox | Intel Pentium III class, 733 MHz | Nvidia NV2A, 233 MHz | Nvidia MCPX audio unit | DVD-ROM, hard drive |
| Wii | IBM Broadway, 729 MHz | ATI Hollywood, 243 MHz | Macronix DSP | Wii disc, GameCube disc |
| Xbox 360 | IBM Xenon, 3 cores, 3.2 GHz | ATI Xenos, 500 MHz, 10 MiB eDRAM | not established | DVD, hard drive |
| Wii U | IBM Espresso, 3 cores, about 1.24 GHz | Latte: GX2 and a Wii-mode GX | DSP in Latte | Wii U disc, Wii disc |

Protection and firmware (sources in the bullets below):

| System | Protection | Firmware |
|---|---|---|
| Dreamcast | GD-ROM format; scrambled executables; regional lock-out | system ROM and flash |
| PlayStation 2 | copy protection and region lock in the drive; MagicGate memory cards | BIOS of up to 4 MiB |
| GameCube | disc barcode and drive-side decoding | IPL in an RTC/IPL chip, XOR-encrypted |
| Xbox | MCPX boot ROM; chain of trust; signed executables; locked hard drive | 256 KiB flash, NT-based kernel |
| Wii | encrypted, hashed, signed disc partitions; checked boot chain on Starlet | IOS on Starlet; System Menu |
| Xbox 360 | loader in the CPU; encrypted chain, checked by signature and hash; eFuses | hypervisor and kernel |
| Wii U | region lock; AES and SHA-1 engines in Latte's security processor; eFuses | Wii U system software; Wii mode |

- Dreamcast: memory is 16 MiB main, 8 MiB video, and 2 MiB sound;
  the SH-4 has 8 KiB instruction and 16 KiB data caches and a 128-bit graphics-oriented FPU;
  the PowerVR2 can use deferred shading; the AICA has 64 voices
  (Wikipedia, "Dreamcast", "Hardware"; Comstedt, "Hardware", lead).
  Sega Retro names the graphics chip PowerVR CLX2 (Sega Retro, "Sega Dreamcast/Technical specifications").
- The GD-ROM holds up to 1 GB in a double-density area around a single-density one
  (Wikipedia, "GD-ROM", "Specification").
  The console unscrambles a GD-ROM's executable in memory,
  and its disc security was undone through its support for the MIL-CD format, by an exploit released in June 2000
  (same article, "Dreamcast console").
  The console also has regional lock-out (Wikipedia, "Dreamcast", "Game library").
- Sega Retro's technical page gives a 2 MB system ROM and 128 KB of flash, citing Sega documents hosted on Sega Retro,
  which the register closes; those figures rest on closed material and are not relied on here
  (Sega Retro, technical specifications, citations).
  The Flycast core's documentation lists the Dreamcast BIOS as optional and offers a high-level BIOS
  (libretro documentation, "Flycast").
- PlayStation 2: the Emotion Engine is 294.912 MHz in Wikipedia's specifications article and in ps2tek
  (ps2tek, "EE Architecture");
  a 299 MHz figure for later consoles appears untagged in "PlayStation 2", "Hardware",
  and tagged "Failed verification" in the specifications article, and is not used.
  Sources disagree on the Graphics Synthesizer:
  147.456 MHz in the specifications article and the body of "PlayStation 2", and 150 MHz in that article's infobox
  (Wikipedia, "PlayStation 2 technical specifications"; "PlayStation 2", "Hardware" and infobox).
- The PlayStation 2's input and output processor is a MIPS R3000A-class processor,
  36.864 MHz in PS2 mode and 33.8688 MHz for PlayStation games, and the SPU2 is two PlayStation-style sound cores
  (Wikipedia, "PlayStation 2 technical specifications", "I/O processor" and "Audio"; ps2tek, overview,
  which calls the processor a "Duplicate of the PSX's CPU").
  The SCPH-7500x replaced it with a PowerPC-based core with 4 MiB of RAM
  (Wikipedia, "PlayStation 2 models", "Slimline case designs").
- The PlayStation 2's disc drive is "region-locked with copy protection"
  (Wikipedia, "PlayStation 2 technical specifications", "Optical disc drive"),
  and its CDVD block is "Also responsible for MagicGate decryption" (ps2tek, overview).
  Its BIOS region is 4 MiB, seen by both processors (ps2tek, memory maps).
  The libretro documentation for the LRPS2 core states
  that "it requires a set of real BIOS images dumped from your Playstation 2 console" (libretro documentation, "LRPS2").
- GameCube: memory is 24 MiB of 1T-SRAM, 3 MiB in Flipper,
  and 16 MiB of DRAM used as a buffer for audio and the disc drive;
  the disc is a Matsushita-designed miniDVD-based format of up to 1.5 GB
  (Wikipedia, "GameCube", infobox, "Hardware", and "Technical specifications").
  YAGCD says a barcode authenticates the disc in the drive,
  and that the disc's content is XORed with a constant stream that the drive controller removes;
  the IPL in its RTC/IPL chip is also XORed with a constant stream, which decryption logic in Flipper removes
  (YAGCD, chapter 2, sections 2.4, 2.7, 2.8, and 2.8.1).
  Dolphin's core documentation says a BIOS is not needed for most games (libretro documentation, "Dolphin").
- Xbox: memory is 64 MiB of unified DDR SDRAM, and the hard drive holds 8 or 10 GB formatted to 8 GB
  (Wikipedia, "Xbox technical specifications").
  The NV2A is northbridge and GPU, part of Nvidia's NV20 family, with three known revisions tied to board revisions
  (XboxDevWiki, "NV2A").
  XboxDevWiki describes no chain of trust for the MCPX X2,
  and for later revisions a chain from the hidden MCPX boot ROM through a decrypted second-stage loader to a kernel
  that runs only signed executables; MCPX 1.1 adds a flash boot loader,
  which the ROM checks by a hash and which then decrypts the second-stage loader
  (XboxDevWiki, "Boot Process", "Chain of trust").
  The kernel sits in a 256 KiB flash ROM (same page), and the console unlocks its hard drive at boot
  (Wikipedia, "Xbox (console)", "Modding").
  The xemu emulator needs an MCPX boot ROM image, a flash image, and a hard-disk image,
  and currently cannot boot games with an unmodified retail flash image, because some DRM functions are not implemented
  (xemu documentation, "Required Files").
- Wii: memory is 24 MiB of 1T-SRAM and 64 MiB of GDDR3, with 512 MiB of flash
  (Wikipedia, "Wii", infobox), which WiiBrew calls NAND (WiiBrew, "Hardware").
  Starlet, an ARM926EJ-S at 243 MHz inside Hollywood, handles input, output, and security, and the DSP runs at 121.5 MHz
  (WiiBrew, "Hardware" and "Hardware/Starlet").
  The boot chain starts in a mask ROM on Starlet, which checks boot1 by hash, and boot1 checks boot2 by signature;
  IOS and the System Menu are checked when installed, not at launch (WiiBrew, "Boot process").
  Disc partitions are encrypted and hashed in a four-level SHA-1 tree whose top table is signed,
  and the page also describes unencrypted discs (WiiBrew, "Wii disc").
  Each title names the IOS version it runs on, and GameCube mode runs MIOS (Wikipedia, "Wii system software", "IOS").
- Xbox 360: each Xenon core runs two threads and has a VMX128 vector unit, and the cores share 1 MiB of L2 cache;
  memory is 512 MiB of unified GDDR3 (Wikipedia, "Xbox 360 technical specifications"; Free60, "Xenon (CPU)").
  Xenos has unified shaders and a 10 MiB eDRAM die made by NEC (same article; Free60, "Xenos (GPU)").
  Sources disagree on its lineage: Wikipedia's "Xenos
  (graphics chip)" bases it on the R400 family, and its specifications article and Free60 relate it to the R500.
  A first-stage loader inside the CPU decrypts the next loader and checks its signature, and later loaders,
  each checked against a known hash, lead to the hypervisor and kernel (Free60, "Boot process").
  The CPU holds 768 bits of eFuse-based one-time-programmable memory
  (Wikipedia, "Xenon (processor)"),
  and the hypervisor handles encryption and memory protection (Free60, "Hypervisor" and "360 System Software").
  No source read says whether the audio format XMA is decoded by dedicated hardware;
  the specifications article names XMA and Dolby Digital 5.1 only.
- Wii U: memory is 2 GiB of DDR3, half reserved for the system, and Latte holds 32 MiB of eDRAM,
  figures that Wikipedia marks as unconfirmed by the makers
  (Wikipedia, "Wii U", "Console", note "Unconfirmed hardware");
  WiiUBrew gives 1243.125 MHz for Espresso and 549.999 MHz for the GPU, citing a researcher's social-media posts
  (WiiUBrew, "Hardware").
  The Latte chip holds a GX2 GPU and a GX GPU for Wii games (Wikipedia, "Wii U", "Console").
  The GamePad receives its display as video streamed from the console (Wikipedia, "Wii U GamePad", "Features").
  The console is region locked (Wikipedia, "Wii U", "Games").

Models and combined units (Wikipedia: "Dreamcast", "Models"; "PlayStation 2 models"; "PSX (digital video recorder)";
"GameCube", "Technical specifications"
and "Panasonic Q"; "Game Boy Player"; "Wii"; "Xbox 360 technical specifications"):

| Unit | Maker | Release | Runs | Class |
|---|---|---|---|---|
| Dreamcast models (R7, Divers 2000 CX-1, editions) | Sega | 1998 to 2001 | Dreamcast | D (variants); CX-1 combined |
| PlayStation 2, original case (SCPH-10000 to 500xx) | Sony | 2000 to 2004 | PlayStation 2 | D |
| PlayStation 2 slimline (SCPH-700xx to 9000x) | Sony | EU 2004-10-29 to 2013 | PlayStation 2 | D |
| PSX digital video recorder (DESR models) | Sony | JP 2003-12-13 | PlayStation 2 | combined |
| VOD10PS2 car DVD player | Audiovox | US 2009 | PlayStation 2 | combined |
| BRAVIA KDL-22PX300 television | Sony | EU 2010 | PlayStation 2 | combined |
| GameCube DOL-001, DOL-101 | Nintendo | 2001; 2004-05 | GameCube | D (variants) |
| Q | Panasonic | JP 2001-12-14 | GameCube, DVD, CD | combined |
| Game Boy Player (DOL-017) | Nintendo | JP 2003-03-21; EU 2003-06-20; NA 2003-06-24 | Game Boy family | add-on |
| Wii RVL-001, RVL-101, Wii Mini (RVL-201), Korean model | Nintendo | 2006 to 2013 | Wii | D (variants) |
| Xbox 360 boards (Xenon to Winchester); 360 S; 360 E | Microsoft | 2005-11 to 2014-08 | Xbox 360 | D (variants) |

- The Divers 2000 CX-1 is a Dreamcast built into a television (Wikipedia, "Dreamcast", "Models").
- The first two Japanese PlayStation 2 models played DVDs through encrypted player software copied to a memory card
  (Wikipedia, "PlayStation 2 models", "Original case design").
  SCPH-7900x merges the Emotion Engine, its memory, the SPU2, and the input and output processor into one chip,
  and late SCPH-9000x consoles carry a revised BIOS that closes a memory-card exploit,
  a statement Wikipedia marks as needing a citation (same article, "Slimline case designs").
- The PSX merges the Emotion Engine and Graphics Synthesizer into one chip, runs PlayStation and PlayStation 2 games,
  and was the first device with the XrossMediaBar (Wikipedia, "PSX (digital video recorder)", "Features").
- YAGCD says the Panasonic Q's GameCube part seems to match the second GameCube board, with a different drive
  (YAGCD, section 2.2.2); Wikipedia gives its price as ¥39,800 (Wikipedia, "GameCube", "Panasonic Q").
- The Game Boy Player needs a boot disc that is region-locked, although the unit itself is not
  (Wikipedia, "Game Boy Player", "Design and features"),
  and it uses hardware nearly identical to a Game Boy Advance rather than emulating one
  (same article, opening), so it is listed for `R1-11` as well.
- The Wii Mini drops GameCube support, Wi-Fi, the SD slot, and 480p and component output,
  and Korean Wii consoles do not play GameCube discs (Wikipedia, "Wii", "Wii Mini" and "Backward compatibility").
- Wikipedia lists twelve Xbox 360 board revisions with their chip process sizes: the Trinity board of June 2010,
  for the 360 S, first merges processor and GPU into one chip,
  and the Winchester board of August 2014 puts the eDRAM on the main die and "patches 'Reset Glitch Hack'"
  (Wikipedia, "Xbox 360 technical specifications", "List of revisions").

### Minor and educational home systems

Every row rests on the Wikipedia article on the system, unless it names another source.

| System (other names) | Maker | First release | CPU | Media | Class |
|---|---|---|---|---|---|
| Nuon | VM Labs; Samsung, Toshiba, RCA, Motorola devices | 2000-07 | four MPEs, 54 or 108 MHz | DVD | combined |
| XaviXPORT (Domyos Interactive System) | SSD Company | US 2004 | 6502 or 65C816 in cartridge | cartridge | D |
| V.Smile (Motion, PC Pal; Pocket handhelds) | VTech | 2004-08-04 | Sunplus SPG200, 27 MHz | cartridge | D |
| V.Smile Baby | VTech | 2006 | not stated | cartridge | D |
| Advanced Pico Beena (Beena Lite) | Sega Toys | JP 2005-08-06 | ARM7TDMI, 81 MHz | book cartridge | D |
| E-kara (Pro, N, Mix) | Takara; Hasbro (US) | JP 2000-10-20; US 2001-10-06 | not stated | song cartridge | D (toy) |
| Game Wave | ZAPiT Games | CA 2005-10 | Mediamatics 8611 | DVD-ROM | combined |
| V.Flash (V.Smile Pro) | VTech | 2006-09 | ARM9 (LSI Logic) | CD in a case | D |
| HyperScan | Mattel | NA 2006-10-23 | Sunplus SPG290, 108 MHz | CD-ROM and RFID cards | D |
| ClickStart | LeapFrog | 2007 | not stated | cartridge | D |
| Zeebo | Zeebo Inc., with Qualcomm | BR 2009-05-25; MX 2009-11-14 | Qualcomm MSM, ARM11, 528 MHz | download | D |

- Nuon devices have four 128-bit VLIW processors, each with local memory and no floating point, 32 MiB of DRAM,
  and 512 KiB of sound memory (Wikipedia, "Nuon (DVD technology)", "Specification");
  eight games were officially released (same article, "Games").
  The article describes no protection or firmware, by a search for "protect", "lock", "encrypt", "security", "firmware",
  and "BIOS" (research log).
- The XaviXPORT puts the processor in each cartridge
  (Wikipedia, "Xavix", "Hardware");
  Wikipedia's list of home consoles says "8-bit,16-bit and 32-bit (depending on game cartridge)" instead
  (Wikipedia, "List of home video game consoles").
- The V.Smile Pocket of 2004-09-10 is a handheld V.Smile, and all Smartridge titles run across the V.Smile line,
  but V.Smile Baby cartridges and consoles are not compatible with the rest
  (Wikipedia, "V.Smile", "V.Smile Pocket and V.Smile Cyber Pocket", "Games",
  and "V.Smile Baby Infant Development System").
- The Advanced Pico Beena's chip is the Applause Technologies AP2010, with 128 KiB of on-chip ROM and 16 KiB of RAM,
  from the chip maker's archived catalogue; its external SDRAM, which Sega Retro labels 16MB from linked datasheets,
  comes to 16 Mbit (2 MiB) by the bank layout the page gives
  (Sega Retro, "Advanced Pico Beena"; calculated from the layout).
  Sales figures differ: Wikipedia's article gives both a Sega claim of over 350,000 Beena consoles (opening)
  and a 2010 Sega estimate of 4.1 million, with a 2011 end
  ("Advanced Pico Beena");
  Sega Retro gives more than 350,000 by May 2008 and production to 2013 (Wikipedia, "Sega Pico"; Sega Retro, same page).
- The V.Flash's discs are ISO 9660 CDs in plastic shells "without any copy protection mechanism other than a simple
  sensor in the case jacket" (Wikipedia, "V.Flash", "CDs").
- Zeebo sold games by download over cellular networks, 3G falling back to EDGE or GPRS,
  which the article reports as the company's stated way "to circumvent piracy"
  (Wikipedia, "Zeebo", opening and "Technical specifications");
  Brazilian units came with three built-in games and Mexican units with five (same article, "Games").
- The HyperScan's cards hold 96 bytes of user memory each (Wikipedia, "HyperScan", "Hardware").
- E-kara's main unit is the microphone; its article names no processor
  (Wikipedia, "E-kara", "Karaoke functions" and infobox).
- Protection is described for none of these systems other than the V.Flash, Zeebo, and the V.Smile,
  by a search of each article listed for "protect", "lock", "encrypt", and "security" (research log).
  The V.Smile's article says its consoles are apparently not region-locked although their BIOS appears region-specific
  (Wikipedia, "V.Smile", "Region protection and inter-compatibility").

### Handhelds

Identity (each system's Wikipedia article, infobox and model sections):

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| PSP-1000 (PSP) | Sony | JP 2004-12-12; NA 2005-03-24; EU, AU 2005-09-01 | R1-20 | YAPSPD; vfpu-docs |
| PSP-2000; PSP-3000 | Sony | HK 2007-08-30; 2008-10 | R1-20 | Copetti (lead) |
| PSP Go (N1000) | Sony | 2009-10 | R1-20 | Copetti (lead) |
| PSP Street (E1000) | Sony | EU 2011-10-26 | R1-20 | — |
| Vita PCH-1000 (Wi-Fi, 3G) | Sony | JP 2011-12-17; NA 2012-02-15 (note); EU 2012-02-22 | R1-20 | Copetti (lead) |
| PlayStation Vita PCH-2000 | Sony | JP 2013-10-10; EU 2014-02-07; NA 2014-05-06 | R1-20 | Copetti (lead) |
| PlayStation TV (PS Vita TV) | Sony | JP 2013-11-14; NA 2014-10-15; EU, AU 2014-11-14 | R1-20 | Copetti (lead) |
| Nintendo 3DS (CTR-001) | Nintendo | JP 2011-02-26; EU 2011-03-25; NA 2011-03-27 | R1-13 | 3dbrew |
| 3DS XL (LL; SPR-001); iQue 3DS XL | Nintendo; iQue | JP, EU 2012-07-28; CN 2012-12 | R1-13 | 3dbrew |
| Nintendo 2DS (FTR-001) | Nintendo | NA, EU, AU 2013-10-12; JP 2016-02-27 | R1-13 | 3dbrew |
| New 3DS (KTR-001); XL (RED-001) | Nintendo | JP 2014-10-11; AU 2014-11-21; EU 2015-01-06 (note) | R1-13 | 3dbrew |
| New 2DS XL (JAN-001) | Nintendo | AU 2017-06-15; JP 2017-07-13; NA, EU 2017-07-28 | R1-13 | 3dbrew |

- The Vita's first North American date was a bundle at some retailers, with the nationwide launch on 2012-02-22
  (Wikipedia, "PlayStation Vita", infobox note);
  the New 3DS's first European sale was a bundle for Club Nintendo members
  (Wikipedia, "New Nintendo 3DS", "Release"),
  and its retail release in Europe and North America was 2015-02-13 (Wikipedia, "Nintendo 3DS", "New Nintendo 3DS").
- The 3DS's signal processor runs at 134 MHz (3dbrew, "Hardware", table).

Hardware:

| System | CPU | Video | Audio | Media |
|---|---|---|---|---|
| PSP | Allegrex and Media Engine (MIPS32), 1 to 333 MHz | 166 MHz, 2 MiB eDRAM | 2 PCM channels (lead) | UMD, MS Duo |
| PSP Go | as PSP | as PSP | as PSP | 16 GB flash, Memory Stick Micro |
| PlayStation Vita | 4 Cortex-A9; PSP-family MIPS (lead) | SGX543MP4+ | not established | Vita card, memory card |
| 3DS, 3DS XL, 2DS | 2 ARM11, 268 MHz; ARM946; ARM7TDMI (lead) | PICA200, 268 MHz | DSP; DS unit (lead) | cards; SD |
| New 3DS family | four ARM11 MPCore, up to 804 MHz | PICA200 | as 3DS | as 3DS; microSD |

Sources: Wikipedia, "PlayStation Portable hardware", "PlayStation Vita", and "New Nintendo 3DS"; 3dbrew, "Hardware";
Copetti for the cells marked (lead).

Protection and firmware:

| System | Protection | Firmware |
|---|---|---|
| PSP | Sony-signed code; AES-encrypted UMD; boot ROM in the main chip (lead); region-free | XMB, last 6.61 (2015) |
| PlayStation Vita | security blocks and TrustZone (lead); region-free | kernel with FreeBSD and NetBSD parts |
| 3DS family | boot ROM checks; signed, AES-CTR-encrypted titles (lead); region lock | four FIRM modes; 11.17.0-50 |

Sources: Copetti for the cells marked (lead); Wikipedia, "Region lock" and each system-software article.

- PSP: memory is 32 MiB, doubled to 64 MiB from the PSP-2000,
  beside 4 MiB of eDRAM split between the GPU and the Media Engine
  (Wikipedia, "PlayStation Portable", "PSP-1000"; "PlayStation Portable hardware", "Memory").
  Licensed software was held to 222 MHz until system software 3.50,
  released in May 2007 by one article and confirmed by Sony on 2007-06-22 by the other,
  which adds that the change does not affect games already released
  (Wikipedia, "PlayStation Portable", "PSP-1000"; "PlayStation Portable hardware", "CPU").
  Wikipedia's hardware article gives the clock range as 1 to 333 MHz, as YAPSPD does, while Copetti gives 33 to 333 MHz
  (Wikipedia, "PlayStation Portable hardware", "CPU"; YAPSPD, chapter 2.1; Copetti, "PlayStation Portable Architecture",
  lead).
- The PSP's vector unit has no public maker documentation: "Sony did not release any public documentation
  (nor SDK/toolchain) for the Sony PSP", and vfpu-docs gives a test for each statement it makes (vfpu-docs README).
- PSP games are region-free while UMD films are region-coded (Wikipedia, "Region lock").
  Copetti describes a hidden 4 KB boot ROM in the main chip
  ("Operating System", "Architecture and design"),
  a boot that continues from NAND flash
  ("Boot process"),
  and a chain of trust and security blocks for decryption and drive control ("Anti-Piracy and Homebrew")
  (Copetti, PSP; lead).
  PPSSPP needs no firmware: "No BIOS file required to play, PPSSPP is an 'HLE' emulator." (PPSSPP README).
- The PSP Go has no UMD drive and adds Bluetooth; the PSP Street has no Wi-Fi
  (Wikipedia, "PlayStation Portable", "PSP Go (N1000)" and "PSP Street (E1000)").
- PlayStation Vita: memory is 512 MB plus 128 MB of video memory; the screen is 960 × 544,
  OLED on the PCH-1000 and LCD on the PCH-2000 (Wikipedia, "PlayStation Vita", "Hardware" and "Revised model").
  The processor clock is not settled: Wikipedia gives an "officially supported maximum of 444 MHz",
  and Copetti says it runs "at a clock speed of up to 500 MHz"
  (same article, "Hardware"; Copetti, "PlayStation Vita Architecture", "The main CPU"; lead).
  Copetti says the main chip also holds a MIPS core of the PSP's family, used for PSP and PlayStation games
  (same article, "One last CPU"; lead).
- Every Vita game released is region-free (Wikipedia, "Region lock").
  No source read describes Vita card encryption or its signing scheme; the Vita Development Wiki, registered open,
  answered every request with a bot challenge (research log).
- The PlayStation TV has the Vita's processor, GPU, and memory, outputs over HDMI, is controlled by a DualShock 3 or 4,
  and does not run Vita games that need the touch screen, rear pad, microphone, or camera
  (Wikipedia, "PlayStation TV", infobox; "PlayStation Vita", "PlayStation TV").
- Nintendo 3DS: 3dbrew gives the ARM11 cores at twice the ARM9's clock,
  one core running the system and the other the application, and 6 MB of VRAM in the SoC
  (3dbrew, "Hardware", table and "SoC").
  3dbrew attributes two of these statements to "official documents" without saying which
  (same page, "SoC" and footnotes).
  Copetti adds an ARM7TDMI in the SoC for DS and Game Boy Advance modes (Copetti, "Nintendo 3DS Architecture"; lead).
- Sources disagree on the 3DS's internal storage,
  2 GB in Wikipedia's 3DS article and 1 GB for the 3DS and 3DS XL in 3dbrew's table
  (Wikipedia, "Nintendo 3DS", infobox; 3dbrew, "Hardware", "Specifications").
- The PICA200 has programmable vertex and geometry stages and a fixed-function fragment stage
  (Wikipedia, "PICA200", "Overview"; 3dbrew, "Hardware", "GPU", for the programmable stages only).
- Three sources disagree on the 3DS signal processor's family: 3dbrew lists a CEVA TeakLite, Copetti a TeakLite II,
  and Teakra's author says its processor is "likely the original Teak"
  (3dbrew, "Hardware"; Copetti, 3DS, "Audio"; Teakra README).
  Teakra thanks GBATEK's Teak section, which the register closes because GBATEK says it rests on leaked files
  (Teakra README; register, the GBATEK DSi Teak lines).
  Copetti says each 3DS program bundles a DSP firmware written by Nintendo and uploads it at run time
  (Copetti, 3DS, "Audio"; lead).
- The 3DS has four firmware modes: NATIVE_FIRM, SAFE_MODE_FIRM, TWL_FIRM for DS and DSi games,
  and AGB_FIRM for Game Boy Advance Virtual Console games (Wikipedia, "Nintendo 3DS system software", "Firmware").
  Its region lock "strictly applies to all software designed for it", with one application excepted,
  while DS games stay region-free apart from those that cannot run on earlier DS models (Wikipedia, "Region lock").
  Copetti reports, from 3dbrew, that boot ROMs check each firmware partition and that game data is signed
  and encrypted with AES in counter mode (Copetti, 3DS, "Boot process" and "Anti-Piracy and Homebrew"; lead).
  Azahar describes itself as a high-level 3DS emulator (Azahar README).
- New 3DS models run at 804 MHz for the Home Menu and for titles that set a flag, and at 268 MHz otherwise;
  the 2 MB L2 cache is listed as optional, with its use described on other 3dbrew pages
  (3dbrew, "Hardware", table and paragraphs after it);
  Wikipedia's infobox gives them 256 MB of memory and 10 MB of VRAM, the VRAM figure unconfirmed by 3dbrew
  (Wikipedia, "New Nintendo 3DS", infobox).
  Some titles run only on New models (Wikipedia, "Nintendo 3DS", "New Nintendo 3DS").
- The iQue 3DS XL was the only 3DS model sold in China and had no physical games
  (Wikipedia, "Nintendo 3DS", "iQue 3DS XL").

### Other dedicated handhelds

Every row rests on the Wikipedia article on the system, unless it names another source.
The first five rows are also in the `R1-06` draft, and the owner decides which catalogue keeps them ("Boundary cases").

| System (other names) | Maker | First release | CPU | Media | Class |
|---|---|---|---|---|---|
| GP32 (overlap with `R1-06`) | Game Park | KR 2001-11-23 | Samsung S3C2400X01 (ARM9) | SmartMedia | D |
| N-Gage; N-Gage QD (overlap) | Nokia | 2003-10-07; 2004 | ARM, 104 MHz | MultiMediaCard | boundary (phone) |
| Tapwave Zodiac 1, 2 (overlap) | Tapwave | 2003-11-01 | Motorola i.MX-1 (ARM9) | SD, MMC | boundary (PDA) |
| Leapster; L-Max; Leapster2 (overlap) | LeapFrog | 2003-10-07; 2004; 2008-07-01 | ARCtangent, 96 MHz | cartridge | D |
| Gizmondo (overlap) | Tiger Telematics | UK 2005-03-19 | Samsung S3C2440 (ARM9) | SD, MMC | D |
| GameKing (GM-218, GM-219, GM-220, GM-222) | Timetop | 2004-09 | 65C02 | cartridge | D |
| digiBlast | Nikko | end of 2005 | not established | cartridge | D |
| Pixter (Color, Pocket, Multi-Media) | Fisher-Price | 2000 | Sunplus 6502; Color: ARM7TDMI, 70 MHz | cartridge | D |
| Didj; Leapster Explorer | LeapFrog | 2008-08-22; NA 2010 | LF-1000 (ARM9), 393 MHz; ARM9 | cartridge, download | D |
| LeapPad Explorer | LeapFrog | 2011 | not established | download | boundary (tablet) |
| Pocket Dream Console; Mi2 | Conny; Planet Interactive | JP 2006-08-03; 2009-10 | SPG240; MIPS | built-in | boundary |

- digiBlast rests on "List of commercial failures in video game consoles", which has the only description found.
  The GameKing list is partial: the article also describes a GM-221 (Wikipedia, "GameKing").
  Pixter's processors come from a table in its article that cites a personal page
  (Wikipedia, "Pixter"), and Rehco designed it for Mattel and its subsidiary Fisher-Price (same article).
  The Mi2 also sold games for download from September 2010 (Wikipedia, "Mi2 (console)").
  The Pocket Dream Console was created by Conny in 2004 and released in Japan in 2006
  (Wikipedia, "Pocket Dream Console").
- The N-Gage's infobox names an ARM920T and its text an "ARM4T architecture" processor at 104 MHz,
  running Symbian OS 6.1 (Wikipedia, "N-Gage"); "N-Gage 2.0", planned from 2005 and released in April 2008,
  was a service on Nokia phones, not hardware (same article, "N-Gage 2.0").
- The Tapwave Zodiac runs Palm OS 5, with Tapwave's own programming interfaces for graphics and sound;
  its sales are given as "50,000+" in its infobox and as fewer than 200,000 in a generation table
  (Wikipedia, "Tapwave Zodiac"; "Sixth generation of video game consoles", "Sales").
- The Gizmondo ran Windows CE; a cheaper model was sold to show advertisements, but the service never launched;
  Wikipedia places it in the seventh generation (Wikipedia, "Gizmondo").
- The Leapster runs MQX and Macromedia Flash content; the Leapster Explorer runs Didj cartridges but not Leapster ones
  (Wikipedia, "Leapster"; "Leapster Explorer").
- digiBlast's only description found calls its hardware "similar to the Game Boy Advance"
  (Wikipedia, "List of commercial failures in video game consoles", "digiBlast"); no article of its own was found.
- The Juice Box (Mattel, 2004) is a children's video player and is left out (Wikipedia, "Juice Box").
- GP32 games came on SmartMedia cards encrypted to run only from those cards, or tied to the console
  (Wikipedia, "GP32");
  pirated N-Gage games ran on other Nokia phones of the period (Wikipedia, "N-Gage", "Reception and legacy").
  No other protection is described for the N-Gage, Zodiac, Gizmondo, Leapster, or Didj,
  by a search of each article for "protect", "encrypt", "lock", and "DRM" (research log).

### Emulator hosts, PC-based systems, and cancelled systems

- PC-based home systems, listed as hosts: DISCover, a technology for booting PCs into games like a console,
  shown at E3 2003 (Wikipedia, "DISCover"); the EVO Smart Console of 2008, an Athlon PC running Linux or Windows
  (Wikipedia, "EVO Smart Console").
- Microconsoles, listed as hosts: Ouya (2013-06-25; Nvidia Tegra 3; Android) and the OnLive Game System
  (pre-orders from 2010-11-17; a cloud-streaming client) (Wikipedia, "Ouya"; "OnLive").
- Linux and Android handhelds, listed as hosts: the GP2X of 2005 and its successors GP2X Wiz and Caanoo,
  the Dingoo A320 of 2009, whose own software includes emulators, the Pandora of 2010,
  the Game Gadget and Neo Geo X of 2012, the GCW Zero of 2013, the Xperia Play phone of 2011,
  the Nvidia Shield Portable of 2013, and JXD's handhelds (Wikipedia, articles on each).
  The Dingoo's own system is a variant of μC/OS-II, and a Linux port, Dingux, runs on it (Wikipedia, "Dingoo").
  The Neo Geo X runs Neo Geo games by emulation
  (Wikipedia, "Neo Geo X"),
  which makes it a retro "mini" console, a host class of the roadmap (roadmap, "Hardware primers").
- Cancelled, and left out: the Indrema L600 and Phantom (home); XGP, Red Jade, and Panasonic's Jungle (handheld)
  (Wikipedia, "List of home video game consoles", cancelled systems; articles on each).
- Arcade boards built on these consoles belong to `R1-24`: Wikipedia says the Dreamcast shared hardware with NAOMI,
  and XboxDevWiki lists Chihiro with the Xbox (Wikipedia, "Dreamcast", opening; XboxDevWiki, Main Page).

### Boundary cases

| System | Wikipedia generation | Rule that disagrees | Placed |
|---|---|---|---|
| Wii; Xbox 360; PSP | seventh | generation | here, by survey (`R1-17`, `R1-23`, `R1-20`) |
| Wii U; Vita; 3DS family | eighth | generation | here, by survey (`R1-17`, `R1-20`, `R1-13`) |
| New 2DS XL | eighth | years of sale (2017) | here, by survey `R1-13` |
| PlayStation 3 | seventh | GPU and years | not here: `R1-04`, by survey `R1-21` |
| Xbox 360 | seventh | `R1-23` depends on `R1-03` and `R1-04` | here; the `R1-08` draft leaves it to this catalogue |
| PlayStation TV | Wikipedia: "Microconsole" | owner's host rule | with the Vita, flagged |
| Dreamcast VMU | sixth | memory card, not a console | with the Dreamcast (from `R1-05`) |
| GameKing | sixth, by category | 8-bit processor | here, by years (from `R1-05`) |
| Pokémon mini; Cybiko | sixth | 8-bit or 16-bit | not here: `R1-05` |
| V.Smile Pocket | sixth | a handheld V.Smile | here, with the V.Smile (`R1-06` left it open) |
| GP32; N-Gage; Zodiac; Gizmondo; Leapster | sixth or seventh | also in the `R1-06` draft | here, flagged overlaps |
| Game Boy Player | sixth | add-on with Game Boy Advance hardware | here, also relevant to `R1-11` |

- The PlayStation TV runs Vita game cards and the Vita's system software on the Vita's processor and GPU
  (Wikipedia, "PlayStation TV", infobox),
  and Copetti describes it as the original model's motherboard adapted for use at home
  (Copetti, Vita, "Models and variants"; lead); that it is a Vita variant rather than a microconsole is an inference.
- The `R1-06` draft lists the GP32, N-Gage, Zodiac, Leapster, and Gizmondo in its handheld tables,
  so both catalogues list them; this note keeps them only as flagged overlaps, and one placement is the owner's choice
  (`R1-06` draft, "Other dedicated 32-bit handhelds, 2001 to 2005").
- The `R1-05` catalogue lists Cybiko and Pokémon Mini and leaves the GameKing and the VMU to this note
  (`R1-05`, "Boundary cases").

### Patterns across the catalogue

- PowerPC runs four of the seven home systems: IBM's Gekko, Broadway, Espresso, and Xenon
  (Wikipedia, "GameCube", "Wii", "Wii U", and "Xbox 360 technical specifications"; the grouping is the note's).
  The Wii's graphics descend from the GameCube's, and the Wii U keeps a GX unit for Wii games
  (Wikipedia, "Wii", "Console"; "Wii U", "Console").
- A security processor separate from the game processor appears in the Wii and Wii U
  (Starlet and its successor Starbuck in Latte)
  and the 3DS (the ARM9) (WiiBrew, "Hardware/Starlet"; WiiUBrew, "Hardware"; Copetti, 3DS, "The security processor",
  lead).
- Backward compatibility puts an earlier system's hardware inside a later one:
  the PlayStation 2's input and output processor and sound cores, the Wii's GameCube mode, the Wii U's Wii mode, and,
  by Copetti, the 3DS's ARM7TDMI for DS and Game Boy Advance modes and the Vita's MIPS core for PSP games (lead)
  (rows and findings above).
- Four major home systems have a boot path whose first stage is code inside a chip: the Xbox's MCPX ROM,
  the Wii's mask ROM on Starlet, and the Xbox 360's loader in the CPU, each checking what follows, and the GameCube,
  whose IPL is decrypted by logic in Flipper.
  The Wii U has a security processor with cryptographic engines, but no source read describes its boot path;
  the PlayStation 2 protects discs in the drive and memory cards through MagicGate;
  the Dreamcast relies on its disc format, scrambled executables, and region lock-out
  (findings above; the comparison is an inference).
- Emulators' need for firmware differs by system, by their own documentation:
  required for the PlayStation 2 (LRPS2) and for low-level Xbox emulation (xemu),
  optional for the Dreamcast (Flycast) and for most GameCube games (Dolphin), and not needed for the PSP (PPSSPP).
  For the Wii, Wii U, and Xbox 360 no documentation read says, the Xenia README included;
  that their emulators run without firmware is from memory.
- Combined units are common: a GameCube with a DVD player, a Dreamcast in a television,
  PlayStation 2s in a video recorder, a car DVD player, and a television, and Nuon inside DVD players and a set-top box
  (rows above; Wikipedia, "Nuon (DVD technology)").

### Coverage of sources

- An open-tier hub other than Wikipedia covers the PlayStation 2 (ps2tek), GameCube (YAGCD), Xbox (XboxDevWiki), Wii
  (WiiBrew), Wii U (WiiUBrew), Xbox 360 (Free60), PSP (YAPSPD, vfpu-docs), and the 3DS (3dbrew), and Comstedt's
  Dreamcast pages and Copetti's articles serve as leads; their tiers are in the register and `R0-05`.
- ps2tek states no origin for its facts; YAGCD's author says it comes from games, patents, and public documents;
  WiiBrew bars leaked kit content, and WiiUBrew forbids leaked information (register lines for each).
- Every minor home system and every other dedicated handheld rests on Wikipedia alone,
  apart from Sega Retro's page on the Advanced Pico Beena.
- Hubs that refused automated requests: the Vita Development Wiki and psdevwiki's PSP pages
  (bot challenges), GBATEK's 3DS sound page (HTTP 403), and 3dbrew after its first page (research log).
- No maker document was found for the PowerVR2, Graphics Synthesizer, Flipper, NV2A, Hollywood, Xenos, Latte,
  PSP graphics, or SGX543, among the hubs above and the register's maker lines (research log).
  For the PICA200 the register lists a paper by staff of its maker, DMP, which was not read (register; `R0-05`).
  Sony's archived PSP specification page and Nintendo's 3DS specification pages are maker material that is not
  yet registered, so they are not cited.
- The only Nuon emulator found is in a repository the register does not list, and the guard blocked its README
  (research log).

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study, or limit study to the systems the surveys name.
- **Costs:** studying every row adds about 30 studies, most resting on Wikipedia; surveys only leaves out Nuon,
  the XaviXPORT, the Beena, the V.Smile line, and the other minor home systems,
  and leaves the other handhelds to `R1-25`, which does not depend on `R1-03`.
- **Gains:** every row studied gives the widest choice for `R6-01`; surveys only keeps the research finite.
- **Used by:** the roadmap today, whose surveys that depend on `R1-03` name Nintendo, Sony, Microsoft, and Sega only.

### One target per family, or one per model

- **What:** treat a family (PSP models, 3DS models, Xbox 360 boards) as one target,
  or treat models whose processors or clocks differ, such as the New 3DS, as separate ones.
- **Costs:** one per family hides per-title clock and cache modes;
  one per model multiplies work for machines whose differences are ports and cases.
- **Gains:** one per family matches how titles were written; one per model matches what a user owns.
- **Used by:** none found; 3dbrew documents the original and New 3DS on one page and records the New 3DS clock mode
  as a flag each title sets.

### Placing the 32-bit handhelds of 2001 to 2008

- **What:** keep the GP32, N-Gage, Zodiac, Gizmondo, and Leapster here, move them to `R1-06`,
  or give `R1-25` a dependency on `R1-02` or `R1-03`.
- **Costs:** here or in `R1-06`, each needs one placement; a new dependency changes the roadmap.
- **Gains:** a single placement avoids duplicate rows; a dependency gives them a primer.
- **Used by:** this catalogue and the `R1-06` draft, which both list them; this note flags them for the owner.

### Treating combined units and the PlayStation TV

- **What:** list a console inside another device as a variant of its game hardware, or as a separate system;
  and treat the PlayStation TV as a Vita variant or as a microconsole.
- **Costs:** a variant row can hide firmware that differs; a microconsole rule removes a device that runs Vita games.
- **Gains:** variants keep the catalogue to the hardware a game sees.
- **Used by:** this catalogue, for both.

### Systems whose only source is Wikipedia

- **What:** accept Wikipedia's figures for catalogue rows, seek maker material and patents, or measure on hardware.
- **Costs:** Wikipedia disagrees with itself or with hubs on several rows
  (the PlayStation 2's GPU clock, the 3DS's storage, the Beena's sales);
  no maker document was found for the minor systems in their articles or the register's maker lines
  (research log), apart from the chip maker's catalogue that Sega Retro cites for the Beena, which was not read.
- **Gains:** Wikipedia is complete enough to identify the machines.
- **Used by:** this catalogue, for identification and catalogue-level values only.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is the owner's decision, informed by the scope `R6-01` proposes;
  the survey column shows which have an emulator survey behind them.
- Every major system here except the Dreamcast encrypts, signs, or authenticates its software,
  so the legal exposure that `R0-02` records for encrypted systems reaches most of this era
  ("Anti-circumvention law in the United States"; "Firmware, keys, and game copies")
  (inference); how the Dreamcast's disc format and scrambled executables stand under `R0-02` is open.
  This feeds `R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22`, and `R1-23`, and their dependency on `R0-02`,
  which the roadmap states only for `R1-23`.
- Firmware needs differ: some emulators require dumped images, some take them as optional,
  and the PSP's runs without them, while for the Wii, Wii U, and Xbox 360 it is from memory; this feeds `R2-12`.
- Backward-compatible hardware inside later systems ties `R1-13` and `R1-19` to the `R1-02` era,
  as the roadmap's dependencies now say (inference); the Vita's MIPS core (lead) would tie `R1-20` the same way,
  which the roadmap does not state.
- Systems resting on Wikipedia alone need a better source before a study relies on them;
  this feeds `R1-25` for the handhelds, while the minor home systems have no survey (Open questions).

## Open questions

- Do the GP32, N-Gage, Zodiac, Gizmondo, and Leapster belong in this catalogue or in `R1-06`, which both list them?
  A decision for the owner.
- Is the PlayStation TV a Vita variant or a microconsole under the owner's rule?
  A decision for the owner.
- Does `R1-25`, or a new survey, cover the minor home and educational systems, which no survey names?
  A decision for the owner.
- Is the Xbox 360's XMA audio decoded by dedicated hardware?
  A family survey (`R1-23`) or the primer (`R1-03`).
- What are the 3DS's internal storage, the New 3DS's VRAM, the Vita's processor clock, the Wii U's memory and clocks,
  and the PlayStation 2's GPU clock, from a primary source?
  The primer and the family surveys.
- How does the Wii U boot, and how are Vita game cards encrypted and signed, as public sources describe it?
  WiiUBrew and the Vita Development Wiki, if a session can reach it.
- What processors do E-kara, ClickStart, digiBlast, the V.Smile Baby, and the LeapPad Explorer use?
  No page read gives one; Wikipedia gives a processor only for a later LeapPad model.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext from `https://en.wikipedia.org/w/index.php?title=<Article>&action=raw`;
each pin is the revision ID.

Wikipedia, generations and lists:

- "Sixth generation of video game consoles" 1386505550; "Seventh generation of video game consoles" 1386320369;
  "List of home video game consoles" 1386685039; "List of handheld game consoles" 1384273411;
  "Template:Video game consoles" 1386365370; "Region lock" 1384605268;
  "List of commercial failures in video game consoles" 1384334190.

Wikipedia, home consoles and models:

- "Dreamcast" 1386172458; "GD-ROM" 1383605234; "VMU" 1379027676.
- "PlayStation 2" 1386205170; "PlayStation 2 technical specifications" 1355643867; "PlayStation 2 models" 1386181656;
  "PSX (digital video recorder)" 1371119147.
- "GameCube" 1386636021; "Game Boy Player" 1385936501.
- "Xbox (console)" 1386021612; "Xbox technical specifications" 1373212195; "Xbox system software" 1386323584.
- "Wii" 1386550313; "Wii system software" 1386323257.
- "Wii U" 1386323270; "Wii U GamePad" 1386633511.
- "Xbox 360" 1386323476; "Xbox 360 technical specifications" 1386323517; "Xenos
  (graphics chip)" 1310013980; "Xenon (processor)" 1384566304.

Wikipedia, minor home systems, hosts, and cancelled systems:

- "Nuon (DVD technology)" 1383941718; "Xavix" 1369487232; "V.Smile" 1385799892; "Sega Pico" 1379636195;
  "E-kara" 1386089717; "DISCover" 1368493851; "Game Wave Family Entertainment System" 1355021547;
  "HyperScan" 1369672075; "V.Flash" 1386322900; "Zeebo" 1384449469; "EVO Smart Console" 1379482821;
  "ClickStart" 1385502996; "Indrema" 1356610021; "Phantom Entertainment" 1384604844; "Ouya" 1386318623;
  "OnLive" 1386318547.

Wikipedia, handhelds:

- "PlayStation Portable" 1386784394; "PlayStation Portable hardware" 1369000148;
  "PlayStation Portable system software" 1386316486; "Universal Media Disc" 1384150684.
- "PlayStation Vita" 1386319237; "PlayStation Vita system software" 1386315935; "PlayStation TV" 1383612262.
- "Nintendo 3DS" 1386371150; "Nintendo 2DS" 1386358545; "New Nintendo 3DS" 1385688872; "New Nintendo 2DS XL" 1385689193;
  "Nintendo 3DS system software" 1384604386; "PICA200" 1358581711.
- "GP32" 1379015467; "N-Gage" 1386180025; "Tapwave Zodiac" 1372920485; "Gizmondo" 1386173978; "Leapster" 1385502801;
  "Leapster Explorer" 1368862108; "LeapFrog Didj" 1381158352; "LeapPad" 1384908069; "GameKing" 1353051015;
  "Pixter" 1379566018; "Juice Box" 1381500242; "Pocket Dream Console" 1377687431; "Mi2 (console)" 1354286867.
- "GP2X" 1385314903; "GP2X Wiz" 1377361946; "Caanoo" 1354286783; "Dingoo" 1379337765; "Pandora (computer)" 1382382856;
  "Game Gadget" 1353062161; "Neo Geo X" 1377484786; "GCW Zero" 1366037317; "Nvidia Shield Portable" 1381277348;
  "Xperia Play" 1385402596; "JXD" 1359557491; "XGP" 1363167423; "Red Jade" 1379733819; "Jungle (console)" 1384331938.

Hubs and references:

- Comstedt, "Dreamcast Programming", index and "Hardware": `http://mc.pp.se/dc/`, `http://mc.pp.se/dc/hw.html`;
  last modified 2004-05-01 and 2016-08-07.
- Sega Retro, "Sega Dreamcast/Technical specifications" and "Advanced Pico Beena", raw wikitext:
  `https://segaretro.org/index.php?title=Advanced_Pico_Beena&action=raw` and sibling page;
  revisions 1099046 and 1118364.
- ps2tek: `https://psi-rockin.github.io/ps2tek/`; repository commit `1c916606`.
- Yet Another GameCube Documentation, index and chapter 2: `http://hitmen.c02.at/files/yagcd/yagcd/index.html`;
  last modified 2006-12-23.
- XboxDevWiki, "Main Page", "MCPX", "NV2A", "Boot Process", raw wikitext:
  `https://xboxdevwiki.net/index.php?title=Boot_Process&action=raw` and sibling pages; revisions 7423, 7417, 6894,
  and 7377.
- WiiBrew, "Hardware", "Hardware/Starlet", "Boot process", "Wii disc", raw wikitext:
  `https://wiibrew.org/w/index.php?title=Hardware&action=raw` and sibling pages; revisions 123708, 118313, 121228,
  and 122714.
- WiiUBrew, "Hardware", raw wikitext: `https://wiiubrew.org/w/index.php?title=Hardware&action=raw`; revision 4831.
- Free60, "Xenon (CPU)", "Xenos (GPU)", "Boot process", "Hypervisor", "360 System Software": `https://free60.org/`;
  source repository commit `f3d099ff`.
- Yet another PlayStationPortable Documentation, index and chapters 2 and 3: `http://hitmen.c02.at/files/yapspd/`;
  last modified 2006-12-23.
- vfpu-docs README: `https://raw.githubusercontent.com/pspdev/vfpu-docs/master/README.md`; commit `f283bbb8`.
- 3dbrew, "Hardware", raw wikitext: `https://www.3dbrew.org/w/index.php?title=Hardware&action=raw`;
  revision not obtained.
- R. Copetti, "PlayStation Portable Architecture", "Nintendo 3DS Architecture", and "PlayStation Vita Architecture"
  (part 1):
  `https://www.copetti.org/writings/consoles/playstation-portable/` and sibling pages;
  latest changelog entries 2026-02-03, 2025-08-08, and 2024-11-10.

Emulator documentation, prose only:

- libretro documentation, "Flycast", "Dolphin", and "LRPS2":
  `https://docs.libretro.com/library/flycast/` and sibling pages; the pages show no version.
- xemu, "Required Files": `https://xemu.app/docs/required-files/`; the page shows no version.
- Xenia README: `https://raw.githubusercontent.com/xenia-project/xenia/master/README.md`; commit `95a5c3ee`.
- PPSSPP README: `https://raw.githubusercontent.com/hrydgard/ppsspp/master/README.md`;
  the quoted line confirmed at commit `77106069`.
- Azahar README: `https://raw.githubusercontent.com/azahar-emu/azahar/master/README.md`;
  the cited sentence confirmed at commit `cf42aef2`.
- Teakra README: `https://raw.githubusercontent.com/wwylele/teakra/master/README.md`; commit `3d697a18`.

Project documents:

- The research roadmap, "Hardware primers" and the family surveys: `docs/roadmap/research.md`.
- The research guide, "Claim status": `docs/research/README.md`.
- The legal baseline, `R0-02`: `docs/research/topics/R0-02-legal-baseline.md`.
- The 8-bit and 16-bit catalogue, `R1-05`: `docs/research/topics/R1-05-catalogue-8-and-16-bit.md`, on `main`.
- The 32-bit and 64-bit catalogue draft, `R1-06`: `docs/research/topics/R1-06-catalogue-32-and-64-bit.md`,
  branch `docs/r1-06-catalogue-32-64-bit`.
- The modern catalogue draft, `R1-08`: branch `docs/r1-08-catalogue-modern`.
- The source register: `.claude/hooks/source-register.txt`.
