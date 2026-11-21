---
title: "The sixth generation and the move to programmable graphics: catalogue"
roadmap_item: R1-07
status: draft
date: 2026-11-20
---

# The sixth generation and the move to programmable graphics: catalogue

## Summary

This note asks which dedicated consoles and handhelds belong to the era of the sixth-generation primer,
[R1-03](R1-03-primer-sixth-generation.md), and what hardware, protection, firmware, and sources each has.

It lists seven home systems and three handheld families: the Dreamcast, PlayStation 2, GameCube, Xbox, Wii, Wii U,
and Xbox 360, and the PSP, PlayStation Vita, and Nintendo 3DS family.
Most are here by the roadmap's era rules;
the Xbox 360 and the 3DS family are here by [pull request #22](https://github.com/jsamuelsen11/rustalgia-emu/pull/22),
which set the rule for surveys that span several primers.
The note adds their models and combined units, and 22 rows of minor, educational,
and boundary systems first sold from 2000 to 2011.
Emulator hosts and cancelled systems are listed apart,
most of them as cross-references to [R1-08](R1-08-catalogue-modern.md).

Every major home system here protects its software in some way (rows below; the grouping is the note's):

- the Dreamcast by its disc format, scrambled executables, and region lock-out;
- the PlayStation 2 by copy protection in its drive and MagicGate memory cards;
- the GameCube by disc authentication and an XOR-encrypted disc and IPL;
- the Xbox by a chain from its MCPX boot ROM
  (none on the MCPX X2)
  that decrypts each stage, checks the flash loader by hash on MCPX 1.1, and runs only signed executables;
- the Wii, Wii U, and Xbox 360 by boot chains that start in a chip and check hashes or signatures.

For the minor systems, Wikipedia is the only source found among the register's hubs,
apart from Sega Retro's page on the Advanced Pico Beena and the maker's own page for the P/ECE (research log).
No maker document for the era's main GPUs is available on the hubs read or at the register's maker lines.
The registered PS2 Linux site says Sony's system manuals, the Graphics Synthesizer's among them,
shipped with its Linux kit, and the register lists one paper by staff of the PICA200's maker, which was not read
(research log).
Nintendo's own specification pages for the 3DS and Wii U, read in archive captures, settle none of the disputed figures.

The note recommends later study only of the systems that have a family survey,
with the minor systems given to one widened [R1-25](../../roadmap/research.md#system-family-surveys),
and one emulation target per family; the owner decides.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of this era were sold, and for each, what are its maker, release,
  processor, video, audio, media, protection, firmware, survey, class, and sources?
- Covered: the systems whose family surveys depend on [R1-03](R1-03-primer-sixth-generation.md)
  ([R1-13](../../roadmap/research.md#system-family-surveys), [R1-17](../../roadmap/research.md#system-family-surveys),
  [R1-19](../../roadmap/research.md#system-family-surveys), [R1-20](../../roadmap/research.md#system-family-surveys),
  [R1-22](../../roadmap/research.md#system-family-surveys) for the Dreamcast,
  and [R1-23](../../roadmap/research.md#system-family-surveys) for the Xbox and Xbox 360),
  their models and combined units, and the minor home and handheld systems placed here by first sale
  ("How the catalogue is built").
  How the hardware works is left to the primer; each family's emulators to its survey; the law on encryption, firmware,
  and keys to [R0-02](R0-02-legal-baseline.md); each hub's evaluation to [R0-05](R0-05-source-map.md).
  The roadmap's host classes, PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles,
  are listed only as emulator hosts, left to [R3-07](../../roadmap/research.md#phase-3-host-platforms)
  and [R3-12](../../roadmap/research.md#phase-3-host-platforms)
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers));
  this note also treats PC-based home systems and Linux handhelds as hosts (inference).
- Researched on 2026-11-20 against the Wikipedia revisions and hub pages listed in Sources.
- How claims were checked: two research agents, one for home systems and one for handhelds,
  read every page as raw text on 2026-11-20, Wikipedia through its raw wikitext;
  no value here comes from a summarising tool.
  Two independent verification passes ran, each of seven verifiers taking a part of the note;
  each verifier fetched the sources again and tested each claim and quotation.
  Each finding was checked against the raw source once more before the text was changed; the corrections were applied,
  and the pull request lists the claims the verifiers could not check.
  A rework on the same day answered the note's open questions from further sources, each fetched as raw text,
  and the pull request that applied it lists each answer and its check.
- How claims are marked: Wikipedia is a tertiary source, and a value with no hub named rests on the article's own text,
  whose citations were not followed.
  Markers follow the [research guide, "Claim status"](../README.md#claim-status): "(inference)" marks reasoning, "(from
  memory)" a claim no fetched page confirmed, "(research log)" an event while gathering the evidence, and "(lead)" a
  fact found only on Comstedt's or Copetti's site, which the register marks as leads; not relied on.
  In the Hub column, "(lead)" marks such a site.
  A Wikipedia article's opening paragraphs are called its "opening", to keep "lead" for the marker.
  A statement that nothing was found names what was searched;
  "not established" in a table means the system's article and its hub, where one is named, give no value.
  Memory sizes that sources write in KB or MB are given in KiB and MiB, reading them as binary (inference);
  storage and disc capacities keep the source's decimal unit.
- What was not opened: firmware, BIOS or IPL images, key and exploit pages, bootloader listings, games,
  maker manuals hosted by others, and emulator code.
  XboxDevWiki's boot page, which holds bootloader listings after its prose, was read for its prose only,
  and is not linked here for that reason.
  One fuse page, Free60's, was opened during research before it was found to show a console's key material;
  nothing from it is recorded or cited, and it was not opened again (research log).
  Where a hub page described a security mechanism, only its prose paragraphs were read, and no key value was recorded.
- Pages met during the rework that hold key or boot-ROM material, and are named here only so that no one opens them:
  the Vita Development Wiki's card authentication page, `wiki.henkaku.xyz/vita/Game_Card`, which defines key data,
  and 3dbrew's `3dbrew.org/wiki/Memory_layout`, which describes what the boot ROMs copy and where key data sits.
  Both were met in archive captures; reading stopped when the material was seen, the copies were deleted,
  nothing from them is used, and the [source register](../../../.claude/hooks/source-register.txt) closes both
  (research log).
  Their addresses are not links because they hold key material.

## Findings

### How the catalogue is built

- An era holds the systems whose family survey depends on its primer; where a survey depends on more than one primer,
  each of its systems belongs to the era of its own generation,
  and the survey depends on the other primers for the hardware its systems contain or carry over
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers)).
- The first rule places here the systems of [R1-17](../../roadmap/research.md#system-family-surveys)
  and [R1-20](../../roadmap/research.md#system-family-surveys),
  whose surveys depend on [R1-03](R1-03-primer-sixth-generation.md) alone,
  although Wikipedia's infoboxes put the Wii and PSP in the seventh generation and the Wii U and Vita in the eighth;
  it leaves the PlayStation 3 to [R1-04](R1-04-primer-modern.md)
  (roadmap, [R1-21](../../roadmap/research.md#system-family-surveys)).
- The second rule places the PlayStation 2 ([R1-19](../../roadmap/research.md#system-family-surveys)), the Dreamcast
  ([R1-22](../../roadmap/research.md#system-family-surveys)), and the Xbox
  ([R1-23](../../roadmap/research.md#system-family-surveys)) here, all sixth generation by their infoboxes.
  Read alone, it does not settle the 3DS family
  ([R1-13](../../roadmap/research.md#system-family-surveys), on [R1-02](R1-02-primer-32-and-64-bit.md) and R1-03),
  whose eighth generation matches neither primer's title, or the Xbox 360
  (R1-23, on R1-03 and R1-04), a seventh-generation system (inference).
  The change that added the rule places both here, with R1-02 for the DS hardware inside the 3DS,
  and starts R1-04 at the Xbox One ([pull request #22](https://github.com/jsamuelsen11/rustalgia-emu/pull/22),
  "Decisions for you"); this note follows it.
- A system that no survey names goes by its first sale: to 2000 in [R1-06](R1-06-catalogue-32-and-64-bit.md),
  from 2001 to 21 November 2005, the day before the Xbox 360's first sale, in this note,
  and later in [R1-08](R1-08-catalogue-modern.md).
  Each device is listed in one catalogue, and the others keep a one-line cross-reference row.
  This is the placement rule the project settled for every catalogue on 2026-11-20;
  it replaces this note's earlier window of years of sale, 1998 to 2013.
  Devices that [R1-05](R1-05-catalogue-8-and-16-bit.md) places stay where it places them.
- The rule names the V.Flash and the HyperScan for this note, although both were first sold in 2006
  (rows below),
  and they stay here as it names them. digiBlast's only date found, the end of 2005,
  cannot be placed against 21 November, so it is listed here with that date marked approximate (inference).
  The V.Smile Baby (2006) stays with the V.Smile line, as R1-08's own placement work proposes.
- By first sale, Nuon, E-kara, and Pixter (2000) belong to R1-06, and ClickStart, the Didj and Leapster Explorer,
  the LeapPad Explorer, the Pocket Dream Console, and the Mi2 (2006 to 2011) to R1-08.
  Neither catalogue lists them on 2026-11-20, by a search of each for their names, so their rows stay here,
  with the catalogue that takes them named above each table, until that catalogue lists them.
- Devices that run emulators of other systems are hosts, not systems to emulate; among those this note names,
  the GP2X line, Dingoo, GCW Zero, Pandora, and Xperia Play are hosts
  (the owner's rule of dedicated consoles only, as the placement rule applies it).
  The N-Gage and Tapwave Zodiac are dedicated game devices: both run their own game software,
  and neither is sold to run other systems' games (same rule).
  The PlayStation TV is listed with the Vita family (same rule).
- A row is one machine or one compatible family;
  in the handheld identity table most models get their own row because their release dates differ,
  and models released close together share one.
  Revisions, regional models, and combined units, meaning a console built into another consumer device,
  are listed under the machine they run.
- "Class": D is a dedicated console, "D (variants)" a row of its models, and "D (toy)" a toy sold as one;
  "combined" a dedicated console inside another device;
  "add-on" a unit attached to a console to run another system's games;
  "boundary" a case the owner's rule does not settle, with the other kind of device in parentheses, or,
  where there is none, a reason in the bullets.
- "Survey" names the family survey whose title includes the system or its family; a dash means none does.
- "Hub" names the best source other than Wikipedia, as registered,
  preferring a registered reference to a registered lead; a dash means Wikipedia was the only one found.
- Regions: NA North America, US United States, EU Europe, PAL the PAL markets, UK United Kingdom, JP Japan,
  KR South Korea, CN China, HK Hong Kong, AU Australia, BR Brazil, CA Canada.

### Home consoles

Identity (each system's Wikipedia article, infobox; Katana, Xenon, and the GameCube makers from the article body):

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Dreamcast (Katana) | Sega | JP 1998-11-27; NA 1999-09-09; EU 1999-10-14; AU 1999-11-30 | R1-22 | Comstedt (lead) |
| PlayStation 2 | Sony Computer Entertainment | JP 2000-03-04; NA 2000-10-26; EU 2000-11-24 | R1-19 | ps2tek |
| GameCube (Dolphin) | Nintendo (ArtX, IBM chips) | JP 2001-09-14; NA 2001-11-18; EU 2002-05-03 | R1-17 | YAGCD |
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
| Xbox 360 | IBM Xenon, 3 cores, 3.2 GHz | Xenos, 500 MHz, 10 MiB eDRAM | XMA decoder in I/O chip | DVD, hard drive |
| Wii U | IBM Espresso, 3 cores, about 1.24 GHz | Latte: GX2 and a Wii-mode GX | DSP in Latte | Wii U disc, Wii disc |

Protection and firmware (sources in the bullets below):

| System | Protection | Firmware |
|---|---|---|
| Dreamcast | GD-ROM format; scrambled executables; regional lock-out | BIOS and flash images |
| PlayStation 2 | copy protection and region lock in the drive; MagicGate memory cards | BIOS of up to 4 MiB |
| GameCube | disc barcode and drive-side decoding | IPL in an RTC/IPL chip, XOR-encrypted |
| Xbox | MCPX boot ROM; chain of trust, none on X2; signed executables; locked drive | 256 KiB flash, NT-based kernel |
| Wii | encrypted, hashed, signed disc partitions; checked boot chain on Starlet | IOS on Starlet; System Menu |
| Xbox 360 | loader in the CPU; encrypted chain, checked by signature and hash; eFuses | hypervisor and kernel |
| Wii U | region lock; boot ROMs (Starbuck, Espresso) check hashes; AES, SHA-1 units; eFuses | IOSU; Cafe OS; Wii mode |

- Dreamcast: memory is 16 MiB main, 8 MiB video, and 2 MiB sound;
  the SH-4 has 8 KiB instruction and 16 KiB data caches and a 128-bit graphics-oriented FPU;
  the PowerVR2 can use deferred shading; the AICA has 64 voices
  (Wikipedia, ["Dreamcast"](https://en.wikipedia.org/w/index.php?title=Dreamcast&oldid=1386172458), "Hardware";
  [Comstedt, "Hardware"](http://mc.pp.se/dc/hw.html), agrees).
  Sega Retro names the graphics chip PowerVR CLX2
  ([Sega Retro, "Sega Dreamcast/Technical specifications"](https://segaretro.org/index.php?title=Sega_Dreamcast/Technical_specifications&oldid=1099046)).
- The GD-ROM holds up to 1 GB in a double-density area around a single-density one
  (Wikipedia, ["GD-ROM"](https://en.wikipedia.org/w/index.php?title=GD-ROM&oldid=1383605234), "Specification").
  The console unscrambles a GD-ROM's executable in memory,
  and its disc security was undone through its support for the MIL-CD format, by an exploit released in June 2000
  (same article, "Dreamcast console").
  The console also has regional lock-out (Wikipedia, "Dreamcast", "Game library").
- Sega Retro's technical page gives a 2 MiB system ROM and 128 KiB of flash, citing Sega documents hosted on Sega Retro,
  which the register closes; those figures rest on closed material and are not relied on here
  (Sega Retro, technical specifications, citations).
  The Flycast core's documentation lists the Dreamcast BIOS as optional, offers a high-level BIOS,
  and names BIOS and flash files ([libretro documentation, "Flycast"](https://docs.libretro.com/library/flycast/)).
- PlayStation 2: the Emotion Engine is 294.912 MHz in Wikipedia's specifications article and in ps2tek
  ([ps2tek, "EE Architecture"](https://psi-rockin.github.io/ps2tek/));
  a 299 MHz figure for later consoles appears untagged in
  ["PlayStation 2"](https://en.wikipedia.org/w/index.php?title=PlayStation_2&oldid=1386205170), "Hardware", and in the
  specifications article untagged in its overview and tagged "Failed verification" in "Central processing unit"; it is
  not used.
- Sources disagree on the Graphics Synthesizer's clock:
  147.456 MHz in the specifications article and the body of "PlayStation 2", and 150 MHz in that article's infobox
  (Wikipedia,
  ["PlayStation 2 technical specifications"](https://en.wikipedia.org/w/index.php?title=PlayStation_2_technical_specifications&oldid=1355643867);
  "PlayStation 2", "Hardware" and infobox).
  No Sony document read gives it.
  Sony's own keynote rounds the Emotion Engine to "EE(300MHz)"
  ([Kutaragi, Sony, Hot Chips 11 keynote](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf),
  slides 9 and 10), and ps2tek gives the bus clock as "~147 MHz" ("EE Timers") and as "half the rate of the EE's clock"
  ("DMA Controller (DMAC)"); half of 294.912 MHz is 147.456 MHz (calculated).
  So 150 MHz reads as a rounding of the same kind as Sony's 300 (inference);
  no page read says that the Graphics Synthesizer runs at the bus clock.
- The PlayStation 2's input and output processor is a MIPS R3000A-class processor,
  36.864 MHz in PS2 mode and 33.8688 MHz for PlayStation games, and the SPU2 is two PlayStation-style sound cores
  (Wikipedia, "PlayStation 2 technical specifications", "I/O processor" and "Audio"; ps2tek, overview,
  which calls the processor a "Duplicate of the PSX's CPU").
  The SCPH-7500x replaced it with a PowerPC-based core with 4 MiB of RAM (Wikipedia,
  ["PlayStation 2 models"](https://en.wikipedia.org/w/index.php?title=PlayStation_2_models&oldid=1386181656), "Slimline
  case designs").
- The PlayStation 2's disc drive is "region-locked with copy protection"
  (Wikipedia, "PlayStation 2 technical specifications", "Optical disc drive"),
  and its CDVD block is "Also responsible for MagicGate decryption" (ps2tek, overview).
  Its BIOS region is 4 MiB, seen by both processors (ps2tek, memory maps).
  The libretro documentation for the LRPS2 core states
  that "it requires a set of real BIOS images dumped from your Playstation 2 console"
  ([libretro documentation, "LRPS2"](https://docs.libretro.com/library/lrps2/)).
- GameCube: memory is 24 MiB of 1T-SRAM, 3 MiB in Flipper,
  and 16 MiB of DRAM used as a buffer for audio and the disc drive;
  the disc is a Matsushita-designed miniDVD-based format of up to 1.5 GB
  (Wikipedia, ["GameCube"](https://en.wikipedia.org/w/index.php?title=GameCube&oldid=1386636021), infobox, "Hardware",
  and "Technical specifications").
  YAGCD says a barcode authenticates the disc in the drive,
  and that the disc's content is XORed with a constant stream that the drive controller removes;
  the IPL in its RTC/IPL chip is also XORed with a constant stream, which decryption logic in Flipper removes
  ([YAGCD](http://hitmen.c02.at/files/yagcd/yagcd/index.html), chapter 2, sections 2.4, 2.7, 2.8, and 2.8.1).
  Dolphin's core documentation says a BIOS is not needed for most games
  ([libretro documentation, "Dolphin"](https://docs.libretro.com/library/dolphin/)).
- Xbox: memory is 64 MiB of unified DDR SDRAM, and the hard drive holds 8 or 10 GB formatted to 8 GB (Wikipedia,
  ["Xbox technical specifications"](https://en.wikipedia.org/w/index.php?title=Xbox_technical_specifications&oldid=1373212195)).
  The NV2A is northbridge and GPU, part of Nvidia's NV20 family, with three known revisions tied to board revisions
  ([XboxDevWiki, "NV2A"](https://xboxdevwiki.net/index.php?title=NV2A&oldid=6894)).
- XboxDevWiki describes no chain of trust for the MCPX X2,
  and for later revisions a chain from the hidden MCPX boot ROM through a decrypted second-stage loader to a kernel
  that runs only signed executables; MCPX 1.1 adds a flash boot loader,
  which the ROM checks by a hash and which then decrypts the second-stage loader
  (XboxDevWiki, "Boot Process", "Chain of trust"; not linked, as Scope says).
  The kernel sits in a 256 KiB flash ROM (same page), and the console unlocks its hard drive at boot
  (Wikipedia, ["Xbox (console)"](https://en.wikipedia.org/w/index.php?title=Xbox_%28console%29&oldid=1386021612),
  "Modding").
  The xemu emulator needs an MCPX boot ROM image, a flash image, and a hard-disk image,
  and currently cannot boot games with an unmodified retail flash image, because some DRM functions are not implemented
  ([xemu documentation, "Required Files"](https://xemu.app/docs/required-files/)).
- Wii: memory is 24 MiB of 1T-SRAM and 64 MiB of GDDR3, with 512 MiB of flash
  (Wikipedia, ["Wii"](https://en.wikipedia.org/w/index.php?title=Wii&oldid=1386550313), infobox),
  which WiiBrew calls NAND ([WiiBrew, "Hardware"](https://wiibrew.org/w/index.php?title=Hardware&oldid=123708)).
  Starlet, an ARM926EJ-S at 243 MHz inside Hollywood, handles input, output, and security, and the DSP runs at 121.5 MHz
  (WiiBrew, "Hardware" and ["Hardware/Starlet"](https://wiibrew.org/w/index.php?title=Hardware/Starlet&oldid=118313)).
  The boot chain starts in a mask ROM on Starlet, which checks boot1 by hash, and boot1 checks boot2 by signature;
  IOS and the System Menu are not checked by signature at launch,
  and the System Menu's signature is checked only when it is installed
  ([WiiBrew, "Boot process"](https://wiibrew.org/w/index.php?title=Boot_process&oldid=121228)).
  Disc partitions are encrypted and hashed in a four-level SHA-1 tree whose top table is signed,
  and the page also describes unencrypted discs
  ([WiiBrew, "Wii disc"](https://wiibrew.org/w/index.php?title=Wii_disc&oldid=122714)).
  Each title names the IOS version it runs on, and GameCube mode runs MIOS
  (Wikipedia, ["Wii system software"](https://en.wikipedia.org/w/index.php?title=Wii_system_software&oldid=1386323257),
  "IOS").
- Xbox 360: each Xenon core runs two threads and has a VMX128 vector unit, and the cores share 1 MiB of L2 cache;
  memory is 512 MiB of unified GDDR3 (Wikipedia,
  ["Xbox 360 technical specifications"](https://en.wikipedia.org/w/index.php?title=Xbox_360_technical_specifications&oldid=1386323517);
  [Free60, "Xenon (CPU)"](https://free60.org/Hardware/Console/Xenon_(CPU)/)).
  Xenos has unified shaders and a 10 MiB eDRAM die made by NEC
  (same article; [Free60, "Xenos (GPU)"](https://free60.org/Hardware/Console/Xenos_(GPU)/)).
  Sources disagree on its lineage: Wikipedia's
  ["Xenos (graphics chip)"](https://en.wikipedia.org/w/index.php?title=Xenos_%28graphics_chip%29&oldid=1310013980) bases
  it on the R400 family, and its specifications article and Free60 relate it to the R500.
- A first-stage loader inside the Xbox 360's CPU decrypts the next loader and checks its signature, and later loaders,
  checked against known hashes or, for the kernel-patch loader, by signature, lead to the hypervisor and kernel
  ([Free60, "Boot process"](https://free60.org/System-Software/Boot_Process/)).
  The CPU holds 768 bits of eFuse-based one-time-programmable memory
  (Wikipedia, ["Xenon (processor)"](https://en.wikipedia.org/w/index.php?title=Xenon_%28processor%29&oldid=1384566304)),
  and the hypervisor handles encryption and memory protection
  ([Free60, "Hypervisor"](https://free60.org/Hypervisor/) and
  ["360 System Software"](https://free60.org/System-Software/360_System_Software/)).
- The Xbox 360 decodes its XMA audio in hardware.
  Microsoft's block diagram of the system shows an "XMA Decoder" in its I/O chip
  ([Andrews and Baker, Microsoft, "Xbox 360 System Architecture", Hot Chips 17 (2005)](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf),
  slide 5, "System Block Diagram").
  Microsoft's audio documentation defines `XAUDIO2_E_XMA_DECODER_ERROR`
  as "The Xbox 360 XMA hardware suffered an unrecoverable error."
  ([Microsoft Learn, "XAudio2 Error Codes"](https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-error-codes)).
  The open-tier emulator Xenia models the decoder as a device with its own register file and 320 decoding contexts
  ([Xenia, `src/xenia/apu/xma_decoder.h`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/apu/xma_decoder.h);
  an implementation's account).
  Wikipedia's specifications article names only XMA and Dolby Digital 5.1.
- Wii U: memory is 2 GiB of DDR3, half reserved for the system
  (Wikipedia, ["Wii U"](https://en.wikipedia.org/w/index.php?title=Wii_U&oldid=1386323270), "Console"),
  and Latte holds 32 MiB of eDRAM, a figure that, with the clocks, Wikipedia marks as unconfirmed by the makers
  (same section, note "Unconfirmed hardware");
  WiiUBrew gives 1243.125 MHz for Espresso and 549.999 MHz for the GPU, citing a researcher's social-media posts
  ([WiiUBrew, "Hardware"](https://wiiubrew.org/w/index.php?title=Hardware&oldid=4831)).
  Nintendo's own specification page names an IBM Power-based multi-core processor, an AMD Radeon-based GPU,
  and 8 GB of internal flash in the Basic Set or 32 GB in the Deluxe Set, and gives no RAM size and no clocks
  ([Nintendo of America, "Wii U: Tech specs"](http://web.archive.org/web/20130526151508/http://www.nintendo.com:80/wiiu/features/tech-specs/),
  capture of 2013-05-26 15:15:08).
- The Latte chip holds a GX2 GPU and a GX GPU for Wii games (Wikipedia, "Wii U", "Console").
  The GamePad receives its display as video streamed from the console
  (Wikipedia, ["Wii U GamePad"](https://en.wikipedia.org/w/index.php?title=Wii_U_GamePad&oldid=1386633511), "Features").
  The console is region locked (Wikipedia, "Wii U", "Games").
- The Wii U boots on the ARM core in Latte, Starbuck, by WiiUBrew's account
  ([WiiUBrew, "Boot process"](https://wiiubrew.org/w/index.php?title=Boot_process&oldid=3135), revision of 2021-08-10;
  the page marks itself a stub):
  1. A mask ROM, boot0, loads boot1 and checks its SHA-1 hash against the hash in its header.
  2. boot1, in the first block of NAND, loads IOSU and checks it the same way.
  3. IOSU, the operating system on the ARM core, loads Cafe OS and starts the PowerPC.
  4. The Espresso boot ROM checks Cafe OS's SHA-1 hash against the hash in its header.

  The page does not say it took these steps from a boot-ROM dump, so they are recorded as a description of the chain,
  with no addresses or contents.
  WiiUBrew lists the security processor with AES and SHA-1 engines and eFuses (WiiUBrew, "Hardware").

Models and combined units (Wikipedia: "Dreamcast", "Models"; "PlayStation 2 models";
["PSX (digital video recorder)"](https://en.wikipedia.org/w/index.php?title=PSX_%28digital_video_recorder%29&oldid=1371119147);
"GameCube", "Technical specifications" and "Panasonic Q";
["Game Boy Player"](https://en.wikipedia.org/w/index.php?title=Game_Boy_Player&oldid=1385936501); "Wii"; "Xbox 360
technical specifications"):

| Unit | Maker | Release | Runs | Class |
|---|---|---|---|---|
| Dreamcast models (R7, Divers 2000 CX-1, editions) | Sega | 1998 to 2001 | Dreamcast | D (variants); CX-1 combined |
| PlayStation 2, original case (SCPH-10000 to 500xx) | Sony | 2000 to 2004 | PlayStation 2 | D |
| PlayStation 2 slimline (SCPH-700xx to 9000x) | Sony | 2004-10-29 to 2013 | PlayStation 2 | D |
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
  (same article, opening), so it is listed for [R1-11](../../roadmap/research.md#system-family-surveys) as well.
- The Wii Mini drops GameCube support, Wi-Fi, the SD slot, and 480p and component output,
  and Korean Wii consoles do not play GameCube discs (Wikipedia, "Wii", "Wii Mini" and "Backward compatibility").
- Wikipedia lists twelve Xbox 360 board revisions with their chip process sizes: the Trinity board of June 2010,
  for the 360 S, first merges processor and GPU into one chip,
  and the Winchester board of August 2014 puts the eDRAM on the main die and "patches 'Reset Glitch Hack'"
  (Wikipedia, "Xbox 360 technical specifications", "List of revisions").

### Minor and educational home systems

Every row rests on the Wikipedia article on the system, unless it names another source;
the Beena's is a section of ["Sega Pico"](https://en.wikipedia.org/w/index.php?title=Sega_Pico&oldid=1379636195).
By first sale, the Nuon and E-kara rows belong to R1-06 and the ClickStart row to R1-08;
they stay here until those catalogues list them ("How the catalogue is built").

| System (other names) | Maker | First release | CPU | Media | Class |
|---|---|---|---|---|---|
| Nuon | VM Labs; Samsung, Toshiba, RCA, Motorola | 2000-07 | four MPEs, 54 or 108 MHz | DVD | combined |
| XaviXPORT (Domyos Interactive System) | SSD Company | US 2004 | 6502 or 65C816 in cartridge | cartridge | D |
| V.Smile (Motion, PC Pal; Pocket handhelds) | VTech | 2004-08-04 | Sunplus SPG200, 27 MHz | cartridge | D |
| V.Smile Baby | VTech | 2006 | not established | cartridge | D |
| Advanced Pico Beena (Beena Lite) | Sega Toys | JP 2005-08-06 | ARM7TDMI, 81 MHz | book cartridge | D |
| E-kara (Pro, N, Mix) | Takara | JP 2000-10-20; US 2001-10-06 | not established | song cartridge | D (toy) |
| Game Wave | ZAPiT Games | CA 2005-10 | Mediamatics 8611 | DVD-ROM | combined |
| V.Flash (V.Smile Pro) | VTech | 2006-09 | ARM9 (LSI Logic) | CD in a case | D |
| HyperScan | Mattel | NA 2006-10-23 | Sunplus SPG290, 108 MHz | CD-ROM and RFID cards | D |
| ClickStart | LeapFrog | 2007 | not established | cartridge | D |

- Zeebo (Zeebo Inc., with Qualcomm; BR 2009-05-25) is listed in R1-08, which keeps its row.
- Nuon devices have four 128-bit VLIW processors, each with local memory and no floating point, 32 MiB of DRAM,
  and 512 KiB of sound memory (Wikipedia,
  ["Nuon (DVD technology)"](https://en.wikipedia.org/w/index.php?title=Nuon_%28DVD_technology%29&oldid=1383941718),
  "Specification"); eight games were officially released (same article, "Games").
  The article describes no protection or firmware, by a search for "protect", "lock", "encrypt", "security", "firmware",
  and "BIOS" (research log).
- The XaviXPORT puts the processor in each cartridge
  (Wikipedia, ["Xavix"](https://en.wikipedia.org/w/index.php?title=Xavix&oldid=1369487232), "Hardware");
  Wikipedia's list of home consoles says "8-bit,16-bit and 32-bit (depending on game cartridge)" instead (Wikipedia,
  ["List of home video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_home_video_game_consoles&oldid=1386685039)).
- The V.Smile Pocket of 2004-09-10 is a handheld V.Smile, and all Smartridge titles run across the V.Smile line,
  but V.Smile Baby cartridges and consoles are not compatible with the rest
  (Wikipedia, ["V.Smile"](https://en.wikipedia.org/w/index.php?title=V.Smile&oldid=1385799892),
  "V.Smile Pocket and V.Smile Cyber Pocket", "Games", and "V.Smile Baby Infant Development System").
- The Advanced Pico Beena's chip is the Applause Technologies AP2010, with 128 KiB of on-chip ROM and 16 KiB of RAM,
  figures that Sega Retro attributes to the chip maker's product catalogue; its external SDRAM,
  which Sega Retro labels 16MB beside links to the chips' datasheets, comes to 16 Mbit
  (2 MiB) by the bank layout the page gives
  ([Sega Retro, "Advanced Pico Beena"](https://segaretro.org/index.php?title=Advanced_Pico_Beena&oldid=1118364);
  calculated from the layout).
- Sales figures for the Beena differ:
  Wikipedia gives both a Sega claim of over 350,000 consoles and a 2010 Sega estimate of 4.1 million, with a 2011 end
  (Wikipedia, "Sega Pico", opening and section "Advanced Pico Beena");
  Sega Retro gives more than 350,000 by May 2008 and production to 2013 (Sega Retro, same page).
- The V.Flash's discs are ISO 9660 CDs in plastic shells "without any copy protection mechanism other than a simple
  sensor in the case jacket" (Wikipedia,
  ["V.Flash"](https://en.wikipedia.org/w/index.php?title=V.Flash&oldid=1386322900), "CDs").
- The HyperScan's cards hold 96 bytes of user memory each
  (Wikipedia, ["HyperScan"](https://en.wikipedia.org/w/index.php?title=HyperScan&oldid=1369672075), "Hardware").
- E-kara's main unit is the microphone; its article names no processor
  (Wikipedia, ["E-kara"](https://en.wikipedia.org/w/index.php?title=E-kara&oldid=1386089717),
  "Karaoke functions" and infobox), and Hasbro sold it in the United States (same article, opening).
- Protection is described for none of these systems other than the V.Flash and the V.Smile,
  by a search of each article listed for "protect", "lock", "encrypt", "security", "piracy", and "copy" (research log).
  The V.Smile's article says its consoles are apparently not region-locked although their BIOS appears region-specific,
  a clause it marks as needing a citation (Wikipedia, "V.Smile", "Region protection and inter-compatibility").

### Handhelds

Identity (each system's Wikipedia article, infobox and model sections;
3DS-family model codes from [3dbrew, "Hardware"](https://www.3dbrew.org/w/index.php?title=Hardware&oldid=23948),
"Specifications"):

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
  (Wikipedia, ["PlayStation Vita"](https://en.wikipedia.org/w/index.php?title=PlayStation_Vita&oldid=1386319237),
  infobox note); the New 3DS's first European sale was a bundle for Club Nintendo members
  (Wikipedia, ["New Nintendo 3DS"](https://en.wikipedia.org/w/index.php?title=New_Nintendo_3DS&oldid=1385688872),
  "Release"), and its retail release in Europe and North America was 2015-02-13
  (Wikipedia, ["Nintendo 3DS"](https://en.wikipedia.org/w/index.php?title=Nintendo_3DS&oldid=1386371150),
  "New Nintendo 3DS").
- The 3DS's signal processor runs at 134 MHz (3dbrew, "Hardware", table).

Hardware:

| System | CPU | Video | Audio | Media |
|---|---|---|---|---|
| PSP | Allegrex and Media Engine (MIPS32), 1 to 333 MHz | 166 MHz, 2 MiB eDRAM | 2 PCM channels (lead) | UMD, MS Duo |
| PSP Go | as PSP | as PSP | as PSP | 16 GB flash, Memory Stick Micro |
| PlayStation Vita | 4 Cortex-A9; PSP-family MIPS (lead) | SGX543MP4+ | stereo; no chip named | Vita card, memory card |
| 3DS, 3DS XL, 2DS | 2 ARM11, 268 MHz; ARM946; ARM7TDMI (lead) | PICA200, 268 MHz | DSP; DS unit (lead) | cards; SD |
| New 3DS family | four ARM11 MPCore, up to 804 MHz | PICA200 | as 3DS | as 3DS; microSD |

Sources: Wikipedia,
["PlayStation Portable"](https://en.wikipedia.org/w/index.php?title=PlayStation_Portable&oldid=1386784394),
["PlayStation Portable hardware"](https://en.wikipedia.org/w/index.php?title=PlayStation_Portable_hardware&oldid=1369000148),
"PlayStation Vita", "Nintendo 3DS", and "New Nintendo 3DS"; 3dbrew, "Hardware"; Copetti for the cells marked (lead).

Protection and firmware:

| System | Protection | Firmware |
|---|---|---|
| PSP | Sony-signed code; AES-encrypted UMD; boot ROM in the main chip (lead); region-free | XMB, last 6.61 (2015) |
| PlayStation Vita | encrypted content; security blocks, hidden ROM (lead); region-free | FreeBSD, NetBSD parts |
| 3DS family | boot ROM checks; signed, AES-CTR-encrypted titles (lead); region lock | four FIRM modes; 11.17.0-50 |

Sources: Copetti for the cells marked (lead); Wikipedia,
["Region lock"](https://en.wikipedia.org/w/index.php?title=Region_lock&oldid=1384605268)
and each system-software article
(["PlayStation Portable system software"](https://en.wikipedia.org/w/index.php?title=PlayStation_Portable_system_software&oldid=1386316486),
["PlayStation Vita system software"](https://en.wikipedia.org/w/index.php?title=PlayStation_Vita_system_software&oldid=1386315935),
["Nintendo 3DS system software"](https://en.wikipedia.org/w/index.php?title=Nintendo_3DS_system_software&oldid=1384604386));
the Vita's encryption as below.

- PSP: memory is 32 MiB, doubled to 64 MiB from the PSP-2000,
  beside 4 MiB of eDRAM split between the GPU and the Media Engine
  (Wikipedia, "PlayStation Portable", "PSP-1000"; "PlayStation Portable hardware", "Memory").
  Licensed software was held to 222 MHz until system software 3.50,
  released in May 2007 by one article and confirmed by Sony on 2007-06-22 by the other,
  which adds that the change does not affect games already released
  (Wikipedia, "PlayStation Portable", "PSP-1000"; "PlayStation Portable hardware", "CPU").
- Wikipedia's hardware article gives the PSP's clock range as 1 to 333 MHz, as YAPSPD does,
  while Copetti gives 33 to 333 MHz (Wikipedia, "PlayStation Portable hardware", "CPU";
  [YAPSPD](http://hitmen.c02.at/files/yapspd/), chapter 2.1;
  [Copetti, "PlayStation Portable Architecture"](https://www.copetti.org/writings/consoles/playstation-portable/),
  lead).
- The PSP's vector unit has no public maker documentation: "Sony did not release any public documentation
  (nor SDK/toolchain)
  for the Sony PSP", and vfpu-docs backs each statement of its instruction descriptions with a test run on a PSP
  ([vfpu-docs README](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/README.md)).
- PSP games are region-free while UMD films are region-coded (Wikipedia, "Region lock").
  Copetti describes "a hidden, undocumented 4 KB ROM inside Tachyon", the main chip
  ("Operating System", "Architecture and design"),
  a boot that continues from NAND flash
  ("Boot process"),
  and a chain of trust and security blocks for decryption and drive control ("Anti-Piracy and Homebrew")
  (Copetti, PSP; lead).
  PPSSPP needs no firmware: "No BIOS file required to play, PPSSPP is an 'HLE' emulator."
  ([PPSSPP README](https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md)).
- The PSP Go has no UMD drive and adds Bluetooth; the PSP Street has no Wi-Fi
  (Wikipedia, "PlayStation Portable", "PSP Go (N1000)" and "PSP Street (E1000)").
- PlayStation Vita: memory is 512 MiB plus 128 MiB of video memory; the screen is 960 × 544,
  OLED on the PCH-1000 and LCD on the PCH-2000
  (Wikipedia, "PlayStation Vita", "Hardware", infobox, and "Revised model").
  The processor clock is not settled: Wikipedia gives an "officially supported maximum of 444 MHz",
  and Copetti says it runs "at a clock speed of up to 500 MHz" (same article, "Hardware";
  [Copetti, "PlayStation Vita Architecture"](https://www.copetti.org/writings/consoles/playstation-vita/), "The main
  CPU"; lead).
  Copetti says the main chip also holds a MIPS core of the PSP's family, used for PSP and PlayStation games
  (same article, "One last CPU"; lead).
- Every Vita game released is region-free (Wikipedia, "Region lock").
  Vita retail content is encrypted (Vita Development Wiki, "Security",
  as [R1-03](R1-03-primer-sixth-generation.md) cites it in "Boot chains and security processors").
  The card's own authentication is described only on a page that holds key data, which this project does not read
  (research log; Scope names the page).
- The PlayStation TV has the Vita's processor, GPU, and memory, outputs over HDMI, is controlled by a DualShock 3 or 4,
  and does not run Vita games that need the touch screen, rear pad, microphone, or camera
  (Wikipedia, ["PlayStation TV"](https://en.wikipedia.org/w/index.php?title=PlayStation_TV&oldid=1383612262), infobox;
  "PlayStation Vita", "PlayStation TV").
- Nintendo 3DS: 3dbrew gives the ARM11 cores at twice the ARM9's clock,
  one core running the system and the other the application, and 6 MiB of VRAM in the SoC
  (3dbrew, "Hardware", table and "SoC").
  3dbrew attributes the dual-core 268 MHz CPU and the core split to "official documents" without naming them;
  a footnote "Official Documentation" has no anchor in the table (same page, "SoC" and footnotes).
  Copetti adds an ARM7TDMI in the SoC for DS and Game Boy Advance modes
  ([Copetti, "Nintendo 3DS Architecture"](https://www.copetti.org/writings/consoles/nintendo-3ds/); lead).
- Sources disagree on the 3DS's internal storage.
  Nintendo's specification page lists a 2 GB SD card in the box and gives no internal storage
  ([Nintendo of America, "Nintendo 3DS: Hardware specs"](http://web.archive.org/web/20111016181020/http://www.nintendo.com/3ds/hardware/specs),
  capture of 2011-10-16 18:10:20).
  3dbrew's table names a Toshiba storage chip marked 1 GB for the 3DS and 3DS XL,
  4 GB or 2 GB parts for the New 3DS and New 3DS XL, and a 4 GB part for the New 2DS XL;
  for the 2DS it gives parts that "Changed between O3DS and N3DS parts depending on production date"
  (3dbrew, "Hardware", "Specifications").
  Wikipedia's 2 GB figure cites a teardown press release by IHS iSuppli
  (Wikipedia, "Nintendo 3DS", "Hardware" and its reference).
  The chip markings are the closer evidence (inference).
- The PICA200 has programmable vertex and geometry stages and a fixed-function fragment stage
  (Wikipedia, ["PICA200"](https://en.wikipedia.org/w/index.php?title=PICA200&oldid=1358581711), "Overview"; 3dbrew,
  "Hardware", "GPU", for the programmable stages only).
- Three sources disagree on the 3DS signal processor's family: 3dbrew lists a CEVA TeakLite, Copetti a TeakLite II,
  and Teakra's author says its processor is "likely the original Teak"
  (3dbrew, "Hardware"; Copetti, 3DS, "Audio";
  [Teakra README](https://github.com/wwylele/teakra/blob/3d697a18df504f4677b65129d9ab14c7c597e3eb/README.md)).
  Teakra thanks GBATEK's Teak section, which the register closes because GBATEK says it rests on leaked files
  (Teakra README; register, the GBATEK DSi Teak lines).
  Copetti says each 3DS program bundles a DSP firmware written by Nintendo and uploads it at run time
  (Copetti, 3DS, "Audio"; lead).
- The 3DS has four firmware modes: NATIVE_FIRM, SAFE_MODE_FIRM, TWL_FIRM for DS and DSi games,
  and AGB_FIRM for Game Boy Advance Virtual Console games (Wikipedia, "Nintendo 3DS system software", "Firmware").
  Its region lock "strictly applies to all software designed for it", with one application excepted;
  the article says the DSi locks only games that cannot run on earlier DS models,
  and does not say how a 3DS treats DS games (Wikipedia, "Region lock").
- Copetti reports, from 3dbrew, that the Boot9 ROM checks the firmware partitions' signatures in turn until one passes,
  and that game data is signed and encrypted with AES in counter mode
  (Copetti, 3DS, "Boot process" and "Anti-Piracy and Homebrew"; lead).
  Azahar describes itself as a high-level 3DS emulator
  ([Azahar README](https://github.com/azahar-emu/azahar/blob/cf42aef23778d7e8bea6a468e12f53943dd87cd0/README.md)).
- New 3DS models run at 804 MHz for the Home Menu and for titles that set a flag, and at 268 MHz otherwise;
  the 2 MiB L2 cache is listed as optional, with its use described on other 3dbrew pages
  (3dbrew, "Hardware", table and paragraphs after it).
  Wikipedia's infobox gives them 256 MiB of memory and 10 MiB of VRAM; the VRAM line has no reference,
  and 3dbrew gives 6 MB of VRAM within the SoC with no split by model, so the 10 MiB figure is unconfirmed
  (Wikipedia, "New Nintendo 3DS", infobox; 3dbrew, "Hardware").
  Some titles run only on New models (Wikipedia, "Nintendo 3DS", "New Nintendo 3DS").
- The iQue 3DS XL was the only 3DS model sold in China and had no physical games
  (Wikipedia, "Nintendo 3DS", "iQue 3DS XL").

### Other dedicated handhelds

Every row rests on the Wikipedia article on the system, unless it names another source.
R1-06 keeps a cross-reference row for each of the first six.
By first sale, the Pixter row belongs to R1-06 and the last three rows to R1-08;
they stay here until those catalogues list them ("How the catalogue is built").

| System (other names) | Maker | First release | CPU | Media | Class |
|---|---|---|---|---|---|
| GP32 | Game Park | KR 2001-11-23 | Samsung S3C2400X01 (ARM9) | SmartMedia | D |
| P/ECE (PIECE) | Aquaplus | JP 2001-11-30 | Epson S1C33209, 24 MHz | download over USB | D |
| N-Gage; N-Gage QD | Nokia | 2003-10-07; 2004 | ARM, 104 MHz | MultiMediaCard | D |
| Tapwave Zodiac 1, 2 | Tapwave | 2003-10 or 2003-11-01 (note) | i.MX-1 (ARM9) | SD, MMC | D |
| Leapster; L-Max; Leapster2 | LeapFrog | 2003-10-07; 2004; 2008-07-01 | ARCtangent, 96 MHz | cartridge | D |
| Gizmondo | Tiger Telematics | UK 2005-03-19 | Samsung S3C2440 (ARM9) | SD, MMC | D |
| GameKing (GM-218, GM-219, GM-220, GM-222) | Timetop | 2004-09 | 65C02 | cartridge | D |
| digiBlast | Nikko | end of 2005 | not established | cartridge | D |
| Pixter (Color, Pocket, Multi-Media) | Fisher-Price | 2000 | Sunplus 6502; Color: ARM7TDMI, 70 MHz | cartridge | D |
| Didj; Leapster Explorer | LeapFrog | 2008-08-22; NA 2010 | LF-1000 (ARM9), 393 MHz; ARM9 | cartridge, download | D |
| LeapPad Explorer | LeapFrog | 2011-08-15 | ARM9 | cartridge, download | boundary (tablet) |
| Pocket Dream Console; Mi2 | Conny; Planet Interactive | JP 2006-08-03; 2009-10 | SPG240; MIPS | built-in | boundary |

- The P/ECE's row rests on
  [Japanese Wikipedia, "PIECE"](https://ja.wikipedia.org/w/index.php?title=PIECE&oldid=110504604) (revision 110504604,
  infobox; the note's own translation), whose opening calls it a PDA or a handheld game console, and on
  [Aquaplus, P/ECE product introduction](https://aquaplus.jp/piece/intr.html), which says its software comes on CD-ROM
  or the web and is downloaded to the unit over USB (read in Japanese; the summary is the note's own).
- digiBlast rests on
  ["List of commercial failures in video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_commercial_failures_in_video_game_consoles&oldid=1384334190),
  which has the only description found.
  The GameKing list is partial: the article also describes a GM-221
  (Wikipedia, ["GameKing"](https://en.wikipedia.org/w/index.php?title=GameKing&oldid=1353051015)).
  Pixter's processors come from a table in its article that cites a personal page
  (Wikipedia, ["Pixter"](https://en.wikipedia.org/w/index.php?title=Pixter&oldid=1379566018)),
  and Rehco designed it for Mattel and its subsidiary Fisher-Price (same article).
- The Mi2 also sold games for download from September 2010
  (Wikipedia, ["Mi2 (console)"](https://en.wikipedia.org/w/index.php?title=Mi2_%28console%29&oldid=1354286867)).
  The Pocket Dream Console was created by Conny in 2004 and released in Japan in 2006 (Wikipedia,
  ["Pocket Dream Console"](https://en.wikipedia.org/w/index.php?title=Pocket_Dream_Console&oldid=1377687431)).
  Both are marked boundary because their games are built in or downloaded, with no game media,
  which the owner's rule does not address (inference).
  Wikipedia's article on the LeapPad Explorer calls it a tablet
  (Wikipedia, ["LeapPad Explorer"](https://en.wikipedia.org/w/index.php?title=LeapPad_Explorer&oldid=1360396543),
  infobox).
- The N-Gage's infobox names an ARM920T and its text an "ARM4T architecture" processor at 104 MHz,
  running Symbian OS 6.1 (Wikipedia, ["N-Gage"](https://en.wikipedia.org/w/index.php?title=N-Gage&oldid=1386180025));
  "N-Gage 2.0", planned from 2005 and released in April 2008, was a service on Nokia phones, not hardware
  (same article, "N-Gage 2.0").
- The Zodiac's article says it began shipping in October 2003, and its infobox gives 2003-11-01
  (Wikipedia, ["Tapwave Zodiac"](https://en.wikipedia.org/w/index.php?title=Tapwave_Zodiac&oldid=1372920485),
  opening and infobox).
  The Tapwave Zodiac runs Palm OS 5, with Tapwave's own programming interfaces for graphics and sound;
  its sales are given as "50,000+" in its infobox and as fewer than 200,000 in a generation table
  (Wikipedia, "Tapwave Zodiac";
  ["Sixth generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Sixth_generation_of_video_game_consoles&oldid=1386505550),
  "Sales").
- The Gizmondo ran Windows CE; a cheaper model was sold to show advertisements, but the service never launched;
  Wikipedia places it in the seventh generation
  (Wikipedia, ["Gizmondo"](https://en.wikipedia.org/w/index.php?title=Gizmondo&oldid=1386173978)).
- The Leapster runs MQX and Macromedia Flash content; the Leapster Explorer runs Didj cartridges but not Leapster ones
  (Wikipedia, ["Leapster"](https://en.wikipedia.org/w/index.php?title=Leapster&oldid=1385502801);
  ["Leapster Explorer"](https://en.wikipedia.org/w/index.php?title=Leapster_Explorer&oldid=1368862108)).
- digiBlast's only description found calls its hardware "similar to the Game Boy Advance"
  (Wikipedia, "List of commercial failures in video game consoles", "digiBlast");
  no article of its own was found by a Wikipedia title search for "DigiBlast" and "Digiblast" (research log).
- The Juice Box (Mattel, 2004) is a children's video player and is left out
  (Wikipedia, ["Juice Box"](https://en.wikipedia.org/w/index.php?title=Juice_Box&oldid=1381500242)).
- GP32 retail games came on SmartMedia cards encrypted to run only from those cards,
  and downloaded games were encrypted to one console's ID
  (Wikipedia, ["GP32"](https://en.wikipedia.org/w/index.php?title=GP32&oldid=1379015467), "Commercial");
  pirated N-Gage games ran on other Nokia phones of the period (Wikipedia, "N-Gage", "Reception and legacy").
  No other protection is described for the N-Gage, Zodiac, Gizmondo, Leapster, or Didj,
  by a search of each article for "protect", "encrypt", "lock", and "DRM" (research log).

### Emulator hosts, PC-based systems, and cancelled systems

- PC-based home systems, listed as hosts: DISCover, a technology for booting PCs into games like a console,
  shown at E3 2003 (Wikipedia, ["DISCover"](https://en.wikipedia.org/w/index.php?title=DISCover&oldid=1368493851));
  the EVO Smart Console of 2008, an Athlon PC running Linux or Windows
  (Wikipedia, ["EVO Smart Console"](https://en.wikipedia.org/w/index.php?title=EVO_Smart_Console&oldid=1379482821)).
- The OnLive Game System, a cloud-streaming client with pre-orders from 2010-11-17, is listed as a host
  (Wikipedia, ["OnLive"](https://en.wikipedia.org/w/index.php?title=OnLive&oldid=1386318547)).
- Hosts listed in R1-08, which keeps their rows: the Ouya of 2013,
  the GP2X of 2005 and its successors GP2X Wiz and Caanoo, the Dingoo A320 of 2009,
  whose own software includes emulators, the Pandora of 2010, the Neo Geo X of 2012, the GCW Zero of 2013,
  the Xperia Play phone of 2011, and the Nvidia Shield Portable of 2013 (Wikipedia, articles on each).
  The Neo Geo X runs Neo Geo games by emulation
  (Wikipedia, ["Neo Geo X"](https://en.wikipedia.org/w/index.php?title=Neo_Geo_X&oldid=1377484786)),
  which makes it a retro "mini" console, a host class of the roadmap
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers)).
- Linux and Android handhelds listed here as hosts: the Game Gadget of 2012 and JXD's handhelds
  (Wikipedia, ["Game Gadget"](https://en.wikipedia.org/w/index.php?title=Game_Gadget&oldid=1353062161);
  ["JXD"](https://en.wikipedia.org/w/index.php?title=JXD&oldid=1359557491)).
- Cancelled, and left out: the Indrema L600 and Phantom (home); XGP, Red Jade, and Panasonic's Jungle (handheld)
  (Wikipedia, "List of home video game consoles", cancelled systems; articles on each).
- Arcade boards built on these consoles belong to [R1-24](../../roadmap/research.md#system-family-surveys):
  Wikipedia says the Dreamcast shared hardware with NAOMI, and XboxDevWiki lists Chihiro with the Xbox
  (Wikipedia, "Dreamcast", opening;
  [XboxDevWiki, "Main Page"](https://xboxdevwiki.net/index.php?title=Main_Page&oldid=7423)).

### Boundary cases

| System | Wikipedia generation | Rule that disagrees | Placed |
|---|---|---|---|
| Wii; PSP | seventh | generation | here, by survey (R1-17, R1-20) |
| Wii U; Vita | eighth | generation | here, by survey (R1-17, R1-20) |
| 3DS family | eighth | R1-13 depends on R1-02 and R1-03 | here, by pull request #22 |
| New 2DS XL | eighth | years of sale (2017) | here, with the 3DS family |
| PlayStation 3 | seventh | GPU and years | not here: R1-04, by survey R1-21 |
| Xbox 360 | seventh | R1-23 depends on R1-03 and R1-04 | here, by pull request #22; R1-08 agrees |
| PlayStation TV | Wikipedia: "Microconsole" | owner's host rule | with the Vita family, by the placement rule |
| Dreamcast VMU | sixth | memory card, not a console | with the Dreamcast (from R1-05) |
| GameKing | sixth, by category | 8-bit processor | here, by years (from R1-05) |
| Pokémon mini; Cybiko | sixth | 8-bit or 16-bit | not here: R1-05 |
| V.Smile Pocket | sixth | a handheld V.Smile | here, with the V.Smile |
| GP32, P/ECE, N-Gage, Zodiac, Leapster, Gizmondo | sixth or seventh | in R1-06 too | here, by first sale |
| V.Flash; HyperScan | not checked | first sold in 2006 | here, as the placement rule names them |
| digiBlast | not given | first sale "end of 2005" | here, the date approximate (inference) |
| Nuon; E-kara; Pixter | not checked | first sold in 2000 | R1-06 by first sale; kept here until it lists them |
| ClickStart; Didj to Mi2 | not checked | first sold 2006 to 2011 | R1-08 by first sale; kept here until it lists them |
| Game Boy Player | sixth | add-on with Game Boy Advance hardware | here, also relevant to R1-11 |

- The PlayStation TV runs Vita game cards and the Vita's system software on the Vita's processor and GPU
  (Wikipedia, "PlayStation TV", infobox),
  and Copetti describes it as the original model's motherboard adapted for use at home
  (Copetti, Vita, "Models and variants"; lead).
- R1-06 lists the GP32, N-Gage, Zodiac, Leapster, and Gizmondo in its handheld tables
  ([R1-06](R1-06-catalogue-32-and-64-bit.md), "Other dedicated 32-bit handhelds, 2001 to 2005");
  by the placement rule this note keeps their rows and R1-06 keeps cross-references.
- R1-05 lists Cybiko and Pokémon Mini and leaves the GameKing and the VMU to this note
  ([R1-05](R1-05-catalogue-8-and-16-bit.md), "Boundary cases").
- "Not checked" in the generation column means the note did not look up Wikipedia's generation for those rows,
  nor for the P/ECE; digiBlast's only description gives none.

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
- Five major home systems have a boot path whose first stage is code inside a chip: the Xbox's MCPX ROM,
  which decrypts or, on MCPX 1.1, hashes what follows
  (none on the MCPX X2);
  the Wii's mask ROM on Starlet, the Wii U's boot0 on Starbuck, and the Xbox 360's loader in the CPU,
  each checking what follows; and the GameCube, whose IPL is decrypted by logic in Flipper.
  The PlayStation 2 protects discs in the drive and memory cards through MagicGate;
  the Dreamcast relies on its disc format, scrambled executables, and region lock-out
  (findings above; the comparison is an inference).
- Emulators' need for firmware differs by system, by their own documentation:
  - required for the PlayStation 2 (LRPS2) and for low-level Xbox emulation (xemu)
    (libretro documentation, "LRPS2"; xemu documentation, "Required Files");
  - optional for the Dreamcast (Flycast) and for most GameCube games (Dolphin)
    (libretro documentation, "Flycast"; libretro documentation, "Dolphin");
  - optional for some Wii games: Dolphin says "Some games may require files only found in a full NAND dump to work
    correctly."
    ([Dolphin, "NAND Usage Guide"](http://web.archive.org/web/20261023001725/https://dolphin-emu.org/docs/guides/nand-usage-guide/),
    capture of 2026-10-23 00:17:25; the live page answers scripts with a bot challenge);
  - optional for the Wii U's system libraries: Cemu "emulates parts of these system RPL files",
    and supplying them "can improve compatibility with some OS functions and features that Cemu doesn't emulate fully
    or correctly" ([Cemu Wiki, "System RPL Files"](https://wiki.cemu.info/index.php?title=System_RPL_Files&oldid=19854),
    "Description", revision of 2026-06-23);
  - not needed for the PSP (PPSSPP README), and for the Xbox 360 by Xenia's high-level kernel:
    "Xenia implements all kernel APIs as native functions under the host."
    ([Xenia, `docs/kernel.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md));
    that it needs no firmware image is an inference.
- Combined units are common: a GameCube with a DVD player, a Dreamcast in a television,
  PlayStation 2s in a video recorder, a car DVD player, and a television, and Nuon inside DVD players and a set-top box
  (rows above; Wikipedia, "Nuon (DVD technology)").

### Coverage of sources

- An open-tier hub other than Wikipedia covers the PlayStation 2 (ps2tek), GameCube (YAGCD), Xbox (XboxDevWiki), Wii
  (WiiBrew), Wii U (WiiUBrew), Xbox 360 (Free60), PSP (YAPSPD, vfpu-docs), and the 3DS (3dbrew);
  [Comstedt's Dreamcast pages](http://mc.pp.se/dc/) and Copetti's articles serve as leads; their tiers are in the
  [register](../../../.claude/hooks/source-register.txt) and [R0-05](R0-05-source-map.md).
- ps2tek states no origin for its facts; YAGCD's author says it comes from games, patents, and public documents;
  WiiBrew bars leaked kit content, and WiiUBrew forbids leaked information (register lines for each).
- Every minor home system and every other dedicated handheld rests on Wikipedia alone among the register's hubs,
  apart from Sega Retro's page on the Advanced Pico Beena (research log); the P/ECE also has its maker's page.
- Hubs that refused automated requests: the Vita Development Wiki and psdevwiki's PSP pages
  (bot challenges), GBATEK's 3DS sound page (HTTP 403), and 3dbrew after its first page (research log).
- No maker document for the PowerVR2, Graphics Synthesizer, Flipper, NV2A, Hollywood, Xenos, Latte, PSP graphics,
  or SGX543 is available on the hubs above or at the register's maker lines (research log).
  The PS2 Linux site, registered as a copy of Sony's, says six Sony system manuals covering the Emotion Engine,
  vector units, and Graphics Synthesizer shipped with the Linux kit, copyrighted by Sony
  ([PS2 Linux site, FAQ](http://ps2-linux.tensioncore.com/faq.html)).
  For the PICA200 the register lists a paper by staff of its maker, DMP, which was not read (register; R0-05).
- Maker material cited here: Microsoft's Hot Chips 17 talk and XAudio2 documentation, Sony's Hot Chips 11 keynote,
  and Nintendo's specification pages for the 3DS and Wii U, read in archive captures (register lines for each).
  Sony's archived PSP specification page is maker material that is not yet registered, so it is not cited;
  it is evaluated when R1-20 cites it.
- The only Nuon emulator found, NuanceResurrection, is closed tier by its licence and its replacement BIOS routines;
  its README and licence were read as prose (register).
  Its licence lets the original author's code be redistributed only unmodified and not for profit,
  with later changes under BSD-3-Clause, and its README says it was "developed in a clean room setting,
  using only the Nuon SDK architecture documentation", an assembler, a disassembler, and tools of its own,
  and that it ships its own BIOS routines
  (NuanceResurrection, `License.txt` and README; not linked, as a closed source).

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study, or limit study to the systems the surveys name.
- **Costs:** studying every row adds up to 22 studies, one for each row of the minor-home and other-handheld tables,
  most resting on Wikipedia; surveys only leaves out Nuon, the XaviXPORT, the Beena, the V.Smile line,
  and the other minor home systems, and leaves the other handhelds to
  [R1-25](../../roadmap/research.md#system-family-surveys), which does not depend on
  [R1-03](R1-03-primer-sixth-generation.md).
- **Gains:** every row studied gives the widest choice for [R6-01](../../roadmap/research.md#phase-6-synthesis);
  surveys only keeps the research finite.
- **Used by:** the roadmap today, whose surveys that depend on R1-03 name Nintendo, Sony, Microsoft, and Sega only.

### One target per family, or one per model

- **What:** treat a family (PSP models, 3DS models, Xbox 360 boards) as one target,
  or treat models whose processors or clocks differ, such as the New 3DS, as separate ones.
- **Costs:** one per family hides per-title clock and cache modes;
  one per model multiplies work for machines whose differences are ports and cases.
- **Gains:** one per family matches how titles were written; one per model matches what a user owns.
- **Used by:** none found among the surveys' roadmap entries and the hubs read;
  3dbrew documents the original and New 3DS on one page and records the New 3DS clock mode as a flag a title may set.

### Placing the 32-bit handhelds of 2001 to 2008

- **What:** keep the GP32, P/ECE, N-Gage, Zodiac, Gizmondo, and Leapster here,
  move them to [R1-06](R1-06-catalogue-32-and-64-bit.md),
  or give R1-25 a dependency on [R1-02](R1-02-primer-32-and-64-bit.md) or R1-03.
- **Costs:** here or in R1-06, each needs one placement; a new dependency changes the roadmap.
- **Gains:** a single placement avoids duplicate rows; a dependency gives them a primer.
- **Used by:** this catalogue, which keeps their rows by the placement rule, while R1-06 keeps cross-references.

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
  the minor systems' articles cite maker pages and press releases
  (VM Labs for Nuon, VTech, Mattel, Sega Toys),
  which were not followed and are not registered; the register's maker lines hold none for these systems
  (research log); Sega Retro attributes the Beena's chip figures to the chip maker's catalogue, which was not read.
- **Gains:** Wikipedia is complete enough to identify the machines.
- **Used by:** this catalogue, for identification and catalogue-level values only.

### Recommendation

- **Study:** study only the surveyed systems, and give the minor and educational systems one survey by widening R1-25,
  as the roadmap change proposed in [pull request #30](https://github.com/jsamuelsen11/rustalgia-emu/pull/30) does,
  instead of up to 22 studies.
  Those rows rest on Wikipedia alone, and the only emulator found for any of them, Nuon's, is closed tier.
- **Targets:** one target per family, with model differences, such as the New 3DS clock and cache modes,
  the Xbox 360 board revisions, and the PSP's memory sizes, as modes of that target.
  3dbrew documents the original and New 3DS on one page and records the New 3DS clock mode as a flag a title sets,
  and the Xbox 360 boards differ in process and in which chips are merged
  (Wikipedia, "Xbox 360 technical specifications", "List of revisions").
- **32-bit handhelds:** none needed; the placement rule settles them,
  and the dependency for R1-25 is taken up in the recommendation on study.
- **Combined units:** list combined units as variants of the game hardware they run,
  and note in the row any firmware or drive that differs,
  such as the PSX's merged chip and XrossMediaBar or the Panasonic Q's drive;
  the PlayStation TV goes with the Vita family by the placement rule.
  A game sees the console hardware, which is what an emulator targets.
- **Wikipedia-only systems:** accept Wikipedia for identity and catalogue-level values, marked as tertiary,
  and require maker material, a patent, a registered hub, or a hardware test before a study or R6-01 relies on a figure.
  The makers published none of the disputed figures this note checked
  (3DS storage, Wii U memory and clocks, the Graphics Synthesizer's clock),
  so the catalogue cannot wait for them; the disputes are visible because each row was checked against a second source.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is the owner's decision,
  informed by the scope [R6-01](../../roadmap/research.md#phase-6-synthesis) proposes;
  the survey column shows which have an emulator survey behind them.
- Every major system here encrypts, signs, authenticates, or scrambles its software.
  [R0-02](R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states) records
  that the statute's definition of circumventing includes descrambling a scrambled work,
  so the Dreamcast's scrambled executables fall within its wording (inference).
  Whether a format or lock-out check on an unencrypted game is an access control is among the
  [questions no court was found to have decided](R0-02-legal-baseline.md#questions-no-court-was-found-to-have-decided),
  which reaches the Dreamcast's GD-ROM format check (inference).
- That exposure feeds [R1-13](../../roadmap/research.md#system-family-surveys),
  [R1-17](../../roadmap/research.md#system-family-surveys), [R1-19](../../roadmap/research.md#system-family-surveys),
  [R1-20](../../roadmap/research.md#system-family-surveys), [R1-22](../../roadmap/research.md#system-family-surveys),
  and [R1-23](../../roadmap/research.md#system-family-surveys).
  Recommendation: give all six a dependency on R0-02.
  R1-23 has one already, [pull request #30](https://github.com/jsamuelsen11/rustalgia-emu/pull/30) proposes it
  for R1-13, R1-17, and R1-20, and R1-19 and R1-22 remain.
- Firmware needs differ: some emulators require dumped images, some take them as optional,
  and the PSP's runs without them, as does the Xbox 360's by its high-level kernel (inference);
  this feeds [R2-12](../../roadmap/research.md#phase-2-cross-cutting-engineering).
- Backward-compatible hardware inside later systems ties R1-13 and R1-19 to [R1-02](R1-02-primer-32-and-64-bit.md),
  as the roadmap's rule for surveys that span primers states.
  The PSP's MIPS cores and the Vita's PSP-family MIPS core (lead) tie R1-20 to R1-02 in the same way (inference).
  Recommendation: add R1-02 to R1-20's dependencies, which pull request #30 does not propose.
- Systems resting on Wikipedia alone need a better source before a study relies on them;
  this feeds [R1-25](../../roadmap/research.md#system-family-surveys),
  recommended above as the survey for the minor home systems and other handhelds.

## Open questions

- What is the Vita's main processor clock: Wikipedia's "officially supported maximum of 444 MHz",
  or Copetti's "up to 500 MHz" (lead)?
  A reachable copy of the Vita Development Wiki's "Main_Processor" page would answer it,
  or a clock measurement on a Vita, which the project does not own;
  the live wiki and its only archive capture answer with a bot challenge,
  and no Sony specification page with a clock was found in the Wayback Machine's index of Sony's Vita pages
  (research log).
- What processors do E-kara, ClickStart, digiBlast, and the V.Smile Baby use,
  and at what clock does the original LeapPad Explorer's ARM9 run?
  Wikipedia's articles on each give none
  (E-kara's infobox leaves its processor fields empty,
  and the LeapPad Explorer's 550 MHz figure is for the LF-2000 models of July 2012).
  MAME's drivers would answer it, but MAME is walled, so only a session the owner starts as a reader could read them,
  writing functional descriptions only; a registered teardown or board photograph is the other route.
  The survey that takes these systems, [R1-25](../../roadmap/research.md#system-family-surveys) as recommended,
  would do that work.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext through `action=raw`; each link opens the revision read,
whose ID follows it.

Wikipedia, generations and lists:

- ["Sixth generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Sixth_generation_of_video_game_consoles&oldid=1386505550)
  1386505550;
  ["Seventh generation of video game consoles"](https://en.wikipedia.org/w/index.php?title=Seventh_generation_of_video_game_consoles&oldid=1386320369)
  1386320369;
  ["List of home video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_home_video_game_consoles&oldid=1386685039)
  1386685039;
  ["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_handheld_game_consoles&oldid=1384273411)
  1384273411;
  ["Template:Video game consoles"](https://en.wikipedia.org/w/index.php?title=Template:Video_game_consoles&oldid=1386365370)
  1386365370; ["Region lock"](https://en.wikipedia.org/w/index.php?title=Region_lock&oldid=1384605268) 1384605268;
  ["List of commercial failures in video game consoles"](https://en.wikipedia.org/w/index.php?title=List_of_commercial_failures_in_video_game_consoles&oldid=1384334190)
  1384334190.

Wikipedia, home consoles and models:

- ["Dreamcast"](https://en.wikipedia.org/w/index.php?title=Dreamcast&oldid=1386172458) 1386172458;
  ["GD-ROM"](https://en.wikipedia.org/w/index.php?title=GD-ROM&oldid=1383605234) 1383605234;
  ["VMU"](https://en.wikipedia.org/w/index.php?title=VMU&oldid=1379027676) 1379027676.
- ["PlayStation 2"](https://en.wikipedia.org/w/index.php?title=PlayStation_2&oldid=1386205170) 1386205170;
  ["PlayStation 2 technical specifications"](https://en.wikipedia.org/w/index.php?title=PlayStation_2_technical_specifications&oldid=1355643867)
  1355643867; ["PlayStation 2 models"](https://en.wikipedia.org/w/index.php?title=PlayStation_2_models&oldid=1386181656)
  1386181656;
  ["PSX (digital video recorder)"](https://en.wikipedia.org/w/index.php?title=PSX_%28digital_video_recorder%29&oldid=1371119147)
  1371119147.
- ["GameCube"](https://en.wikipedia.org/w/index.php?title=GameCube&oldid=1386636021) 1386636021;
  ["Game Boy Player"](https://en.wikipedia.org/w/index.php?title=Game_Boy_Player&oldid=1385936501) 1385936501.
- ["Xbox (console)"](https://en.wikipedia.org/w/index.php?title=Xbox_%28console%29&oldid=1386021612) 1386021612;
  ["Xbox technical specifications"](https://en.wikipedia.org/w/index.php?title=Xbox_technical_specifications&oldid=1373212195)
  1373212195; ["Xbox system software"](https://en.wikipedia.org/w/index.php?title=Xbox_system_software&oldid=1386323584)
  1386323584.
- ["Wii"](https://en.wikipedia.org/w/index.php?title=Wii&oldid=1386550313) 1386550313;
  ["Wii system software"](https://en.wikipedia.org/w/index.php?title=Wii_system_software&oldid=1386323257) 1386323257.
- ["Wii U"](https://en.wikipedia.org/w/index.php?title=Wii_U&oldid=1386323270) 1386323270;
  ["Wii U GamePad"](https://en.wikipedia.org/w/index.php?title=Wii_U_GamePad&oldid=1386633511) 1386633511.
- ["Xbox 360"](https://en.wikipedia.org/w/index.php?title=Xbox_360&oldid=1386323476) 1386323476;
  ["Xbox 360 technical specifications"](https://en.wikipedia.org/w/index.php?title=Xbox_360_technical_specifications&oldid=1386323517)
  1386323517;
  ["Xenos (graphics chip)"](https://en.wikipedia.org/w/index.php?title=Xenos_%28graphics_chip%29&oldid=1310013980)
  1310013980; ["Xenon (processor)"](https://en.wikipedia.org/w/index.php?title=Xenon_%28processor%29&oldid=1384566304)
  1384566304.

Wikipedia, minor home systems, hosts, and cancelled systems:

- ["Nuon (DVD technology)"](https://en.wikipedia.org/w/index.php?title=Nuon_%28DVD_technology%29&oldid=1383941718)
  1383941718; ["Xavix"](https://en.wikipedia.org/w/index.php?title=Xavix&oldid=1369487232) 1369487232;
  ["V.Smile"](https://en.wikipedia.org/w/index.php?title=V.Smile&oldid=1385799892) 1385799892;
  ["Sega Pico"](https://en.wikipedia.org/w/index.php?title=Sega_Pico&oldid=1379636195) 1379636195;
  ["E-kara"](https://en.wikipedia.org/w/index.php?title=E-kara&oldid=1386089717) 1386089717;
  ["DISCover"](https://en.wikipedia.org/w/index.php?title=DISCover&oldid=1368493851) 1368493851;
  ["Game Wave Family Entertainment System"](https://en.wikipedia.org/w/index.php?title=Game_Wave_Family_Entertainment_System&oldid=1355021547)
  1355021547; ["HyperScan"](https://en.wikipedia.org/w/index.php?title=HyperScan&oldid=1369672075) 1369672075;
  ["V.Flash"](https://en.wikipedia.org/w/index.php?title=V.Flash&oldid=1386322900) 1386322900;
  ["Zeebo"](https://en.wikipedia.org/w/index.php?title=Zeebo&oldid=1384449469) 1384449469;
  ["EVO Smart Console"](https://en.wikipedia.org/w/index.php?title=EVO_Smart_Console&oldid=1379482821) 1379482821;
  ["ClickStart"](https://en.wikipedia.org/w/index.php?title=ClickStart&oldid=1385502996) 1385502996;
  ["Indrema"](https://en.wikipedia.org/w/index.php?title=Indrema&oldid=1356610021) 1356610021;
  ["Phantom Entertainment"](https://en.wikipedia.org/w/index.php?title=Phantom_Entertainment&oldid=1384604844)
  1384604844; ["Ouya"](https://en.wikipedia.org/w/index.php?title=Ouya&oldid=1386318623) 1386318623;
  ["OnLive"](https://en.wikipedia.org/w/index.php?title=OnLive&oldid=1386318547) 1386318547.

Wikipedia, handhelds:

- ["PlayStation Portable"](https://en.wikipedia.org/w/index.php?title=PlayStation_Portable&oldid=1386784394) 1386784394;
  ["PlayStation Portable hardware"](https://en.wikipedia.org/w/index.php?title=PlayStation_Portable_hardware&oldid=1369000148)
  1369000148;
  ["PlayStation Portable system software"](https://en.wikipedia.org/w/index.php?title=PlayStation_Portable_system_software&oldid=1386316486)
  1386316486; ["Universal Media Disc"](https://en.wikipedia.org/w/index.php?title=Universal_Media_Disc&oldid=1384150684)
  1384150684.
- ["PlayStation Vita"](https://en.wikipedia.org/w/index.php?title=PlayStation_Vita&oldid=1386319237) 1386319237;
  ["PlayStation Vita system software"](https://en.wikipedia.org/w/index.php?title=PlayStation_Vita_system_software&oldid=1386315935)
  1386315935; ["PlayStation TV"](https://en.wikipedia.org/w/index.php?title=PlayStation_TV&oldid=1383612262) 1383612262.
- ["Nintendo 3DS"](https://en.wikipedia.org/w/index.php?title=Nintendo_3DS&oldid=1386371150) 1386371150;
  ["Nintendo 2DS"](https://en.wikipedia.org/w/index.php?title=Nintendo_2DS&oldid=1386358545) 1386358545;
  ["New Nintendo 3DS"](https://en.wikipedia.org/w/index.php?title=New_Nintendo_3DS&oldid=1385688872) 1385688872;
  ["New Nintendo 2DS XL"](https://en.wikipedia.org/w/index.php?title=New_Nintendo_2DS_XL&oldid=1385689193) 1385689193;
  ["Nintendo 3DS system software"](https://en.wikipedia.org/w/index.php?title=Nintendo_3DS_system_software&oldid=1384604386)
  1384604386; ["PICA200"](https://en.wikipedia.org/w/index.php?title=PICA200&oldid=1358581711) 1358581711.
- ["GP32"](https://en.wikipedia.org/w/index.php?title=GP32&oldid=1379015467) 1379015467;
  ["N-Gage"](https://en.wikipedia.org/w/index.php?title=N-Gage&oldid=1386180025) 1386180025;
  ["Tapwave Zodiac"](https://en.wikipedia.org/w/index.php?title=Tapwave_Zodiac&oldid=1372920485) 1372920485;
  ["Gizmondo"](https://en.wikipedia.org/w/index.php?title=Gizmondo&oldid=1386173978) 1386173978;
  ["Leapster"](https://en.wikipedia.org/w/index.php?title=Leapster&oldid=1385502801) 1385502801;
  ["Leapster Explorer"](https://en.wikipedia.org/w/index.php?title=Leapster_Explorer&oldid=1368862108) 1368862108;
  ["LeapFrog Didj"](https://en.wikipedia.org/w/index.php?title=LeapFrog_Didj&oldid=1381158352) 1381158352;
  ["LeapPad"](https://en.wikipedia.org/w/index.php?title=LeapPad&oldid=1384908069) 1384908069;
  ["LeapPad Explorer"](https://en.wikipedia.org/w/index.php?title=LeapPad_Explorer&oldid=1360396543) 1360396543;
  ["GameKing"](https://en.wikipedia.org/w/index.php?title=GameKing&oldid=1353051015) 1353051015;
  ["Pixter"](https://en.wikipedia.org/w/index.php?title=Pixter&oldid=1379566018) 1379566018;
  ["Juice Box"](https://en.wikipedia.org/w/index.php?title=Juice_Box&oldid=1381500242) 1381500242;
  ["Pocket Dream Console"](https://en.wikipedia.org/w/index.php?title=Pocket_Dream_Console&oldid=1377687431) 1377687431;
  ["Mi2 (console)"](https://en.wikipedia.org/w/index.php?title=Mi2_%28console%29&oldid=1354286867) 1354286867.
- ["GP2X"](https://en.wikipedia.org/w/index.php?title=GP2X&oldid=1385314903) 1385314903;
  ["GP2X Wiz"](https://en.wikipedia.org/w/index.php?title=GP2X_Wiz&oldid=1377361946) 1377361946;
  ["Caanoo"](https://en.wikipedia.org/w/index.php?title=Caanoo&oldid=1354286783) 1354286783;
  ["Dingoo"](https://en.wikipedia.org/w/index.php?title=Dingoo&oldid=1379337765) 1379337765;
  ["Pandora (computer)"](https://en.wikipedia.org/w/index.php?title=Pandora_%28computer%29&oldid=1382382856) 1382382856;
  ["Game Gadget"](https://en.wikipedia.org/w/index.php?title=Game_Gadget&oldid=1353062161) 1353062161;
  ["Neo Geo X"](https://en.wikipedia.org/w/index.php?title=Neo_Geo_X&oldid=1377484786) 1377484786;
  ["GCW Zero"](https://en.wikipedia.org/w/index.php?title=GCW_Zero&oldid=1366037317) 1366037317;
  ["Nvidia Shield Portable"](https://en.wikipedia.org/w/index.php?title=Nvidia_Shield_Portable&oldid=1381277348)
  1381277348; ["Xperia Play"](https://en.wikipedia.org/w/index.php?title=Xperia_Play&oldid=1385402596) 1385402596;
  ["JXD"](https://en.wikipedia.org/w/index.php?title=JXD&oldid=1359557491) 1359557491;
  ["XGP"](https://en.wikipedia.org/w/index.php?title=XGP&oldid=1363167423) 1363167423;
  ["Red Jade"](https://en.wikipedia.org/w/index.php?title=Red_Jade&oldid=1379733819) 1379733819;
  ["Jungle (console)"](https://en.wikipedia.org/w/index.php?title=Jungle_%28console%29&oldid=1384331938) 1384331938.
- [Japanese Wikipedia, "PIECE"](https://ja.wikipedia.org/w/index.php?title=PIECE&oldid=110504604), read as raw wikitext;
  revision 110504604.

Maker material:

- [Andrews and Baker, Microsoft, "Xbox 360 System Architecture", Hot Chips 17 (2005)](https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf),
  slide 5; the conference's archive copy.
- [Kutaragi, Sony, Hot Chips 11 keynote](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf),
  slides 9 and 10; the conference's archive copy.
- [Microsoft Learn, "XAudio2 Error Codes"](https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-error-codes);
  the page is dated 2018-05-31 and was updated 2021-03-22.
- [Nintendo of America, "Nintendo 3DS: Hardware specs"](http://web.archive.org/web/20111016181020/http://www.nintendo.com/3ds/hardware/specs),
  Wayback Machine capture of 2011-10-16 18:10:20.
- [Nintendo of America, "Wii U: Tech specs"](http://web.archive.org/web/20130526151508/http://www.nintendo.com:80/wiiu/features/tech-specs/),
  Wayback Machine capture of 2013-05-26 15:15:08.
- [Aquaplus, P/ECE product introduction](https://aquaplus.jp/piece/intr.html), in Japanese; the page shows no version.

Hubs and references:

- Comstedt, ["Dreamcast Programming"](http://mc.pp.se/dc/) index and ["Hardware"](http://mc.pp.se/dc/hw.html);
  last modified 2004-05-01 and 2016-08-07.
- [Sega Retro, "Sega Dreamcast/Technical specifications"](https://segaretro.org/index.php?title=Sega_Dreamcast/Technical_specifications&oldid=1099046)
  and [Sega Retro, "Advanced Pico Beena"](https://segaretro.org/index.php?title=Advanced_Pico_Beena&oldid=1118364), read
  as raw wikitext; revisions 1099046 and 1118364.
- [ps2tek](https://psi-rockin.github.io/ps2tek/); repository commit `1c916606`.
- [Yet Another GameCube Documentation](http://hitmen.c02.at/files/yagcd/yagcd/index.html), index and chapter 2;
  last modified 2006-12-23.
- [XboxDevWiki, "Main Page"](https://xboxdevwiki.net/index.php?title=Main_Page&oldid=7423),
  [XboxDevWiki, "MCPX"](https://xboxdevwiki.net/index.php?title=MCPX&oldid=7417),
  and [XboxDevWiki, "NV2A"](https://xboxdevwiki.net/index.php?title=NV2A&oldid=6894), read as raw wikitext;
  revisions 7423, 7417, and 6894.
- XboxDevWiki, "Boot Process", read as raw wikitext for its prose only; revision 7377.
  Its address, `xboxdevwiki.net/Boot_Process`, is not linked because the page holds bootloader listings.
- [WiiBrew, "Hardware"](https://wiibrew.org/w/index.php?title=Hardware&oldid=123708),
  [WiiBrew, "Hardware/Starlet"](https://wiibrew.org/w/index.php?title=Hardware/Starlet&oldid=118313),
  [WiiBrew, "Boot process"](https://wiibrew.org/w/index.php?title=Boot_process&oldid=121228),
  and [WiiBrew, "Wii disc"](https://wiibrew.org/w/index.php?title=Wii_disc&oldid=122714), read as raw wikitext;
  revisions 123708, 118313, 121228, and 122714.
- [WiiUBrew, "Hardware"](https://wiiubrew.org/w/index.php?title=Hardware&oldid=4831)
  and [WiiUBrew, "Boot process"](https://wiiubrew.org/w/index.php?title=Boot_process&oldid=3135), read as raw wikitext;
  revisions 4831 and 3135.
- [Free60, "Xenon (CPU)"](https://free60.org/Hardware/Console/Xenon_(CPU)/),
  [Free60, "Xenos (GPU)"](https://free60.org/Hardware/Console/Xenos_(GPU)/),
  [Free60, "Boot process"](https://free60.org/System-Software/Boot_Process/),
  [Free60, "Hypervisor"](https://free60.org/Hypervisor/),
  and [Free60, "360 System Software"](https://free60.org/System-Software/360_System_Software/);
  source repository commit `f3d099ff`.
- [Yet another PlayStationPortable Documentation](http://hitmen.c02.at/files/yapspd/), index and chapters 2 and 3;
  last modified 2006-12-23.
- [vfpu-docs README](https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/README.md);
  commit `f283bbb8`.
- [3dbrew, "Hardware"](https://www.3dbrew.org/w/index.php?title=Hardware&oldid=23948), read as raw wikitext;
  revision 23948, last edited 2026-10-31.
- R. Copetti, ["PlayStation Portable Architecture"](https://www.copetti.org/writings/consoles/playstation-portable/),
  ["Nintendo 3DS Architecture"](https://www.copetti.org/writings/consoles/nintendo-3ds/),
  and ["PlayStation Vita Architecture"](https://www.copetti.org/writings/consoles/playstation-vita/)
  (part 1); latest changelog entries 2026-02-03, 2025-08-08, and 2024-11-10.
- [PS2 Linux site, FAQ](http://ps2-linux.tensioncore.com/faq.html); the page shows no version.

Emulator documentation, prose only:

- [libretro documentation, "Flycast"](https://docs.libretro.com/library/flycast/),
  [libretro documentation, "Dolphin"](https://docs.libretro.com/library/dolphin/),
  and [libretro documentation, "LRPS2"](https://docs.libretro.com/library/lrps2/); each shows "Last update" 2026-10-22.
- [xemu documentation, "Required Files"](https://xemu.app/docs/required-files/); the page shows no version.
- [Xenia README](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/README.md),
  [Xenia, `docs/kernel.md`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md),
  and
  [Xenia, `src/xenia/apu/xma_decoder.h`](https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/apu/xma_decoder.h);
  commit `95a5c3ee`.
- [PPSSPP README](https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md);
  the quoted line confirmed at commit `77106069`.
- [Azahar README](https://github.com/azahar-emu/azahar/blob/cf42aef23778d7e8bea6a468e12f53943dd87cd0/README.md);
  the cited sentence confirmed at commit `cf42aef2`.
- [Teakra README](https://github.com/wwylele/teakra/blob/3d697a18df504f4677b65129d9ab14c7c597e3eb/README.md);
  commit `3d697a18`.
- [Dolphin, "NAND Usage Guide"](http://web.archive.org/web/20261023001725/https://dolphin-emu.org/docs/guides/nand-usage-guide/),
  Wayback Machine capture of 2026-10-23 00:17:25; the live page refuses scripts.
- [Cemu Wiki, "System RPL Files"](https://wiki.cemu.info/index.php?title=System_RPL_Files&oldid=19854),
  read as raw wikitext; revision 19854 of 2026-06-23.
- NuanceResurrection, `License.txt` and README, read as raw files: `https://github.com/andkrau/NuanceResurrection`;
  not linked, because the register closes it.

Project documents:

- The [research roadmap](../../roadmap/research.md), "Hardware primers" and the family surveys.
- The [research guide](../README.md), "Claim status" and "Shape and links".
- [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md), on which sources may be read.
- The legal baseline, [R0-02](R0-02-legal-baseline.md),
  "Anti-circumvention law in the United States" and "Questions no court was found to have decided".
- The source map, [R0-05](R0-05-source-map.md).
- The sixth-generation primer, [R1-03](R1-03-primer-sixth-generation.md),
  for its citation of the Vita Development Wiki's "Security" page.
- The 8-bit and 16-bit catalogue, [R1-05](R1-05-catalogue-8-and-16-bit.md).
- The 32-bit and 64-bit catalogue, [R1-06](R1-06-catalogue-32-and-64-bit.md).
- The modern catalogue, [R1-08](R1-08-catalogue-modern.md).
- [Pull request #22](https://github.com/jsamuelsen11/rustalgia-emu/pull/22), "docs:
  place systems of surveys that span several primers", "Decisions for you", merged to `main`.
- [Pull request #30](https://github.com/jsamuelsen11/rustalgia-emu/pull/30), "docs:
  settle the roadmap dependencies the notes found", open on 2026-11-20.
- The [source register](../../../.claude/hooks/source-register.txt).
