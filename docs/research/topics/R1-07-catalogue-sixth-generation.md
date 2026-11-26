---
title: "The sixth generation and the move to programmable graphics: catalogue"
roadmap_item: R1-07
status: approved
date: 2026-11-21
---

# The sixth generation and the move to programmable graphics: catalogue

## Summary

This note asks which dedicated consoles and handhelds belong to the era of the sixth-generation primer, [R1-03][r103],
and what hardware, protection, firmware, and sources each has.

It lists seven home systems, the Dreamcast, PlayStation 2, GameCube, Xbox, Wii, Wii U, and Xbox 360,
and three handheld families, the PSP, PlayStation Vita, and Nintendo 3DS, with their models and combined units.
Most are here by the roadmap's era rules; the Xbox 360 and the 3DS family are here by [pull request #22][pr22],
which set the rule for surveys that span several primers.

It adds 19 rows of minor, educational, and boundary systems first sold from 2001 to 2011.
Emulator hosts are listed apart, mostly as cross-references to [R1-08][r108]; cancelled systems are left out.

Every major home system here protects its software: by its disc format and scrambling, by checks in the drive,
or by a boot chain that starts in a chip ("Patterns across the catalogue").
The minor systems rest on Wikipedia almost alone, and no maker document read gives the figures that the sources dispute
("Coverage of sources").

The note recommends later study only of the systems that have a family survey,
leaving the minor systems to [R1-26][surveys], which the roadmap now widens to them, one emulation target per family,
and a dependency on [R0-02][r002] for R1-19 and R1-23; the owner decides.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds of this era were sold, and for each, what are its maker, release,
  processor, video, audio, media, protection, firmware, survey, class, and sources?
- Covered: the systems whose family surveys depend on [R1-03][r103]
  ([R1-13][surveys], [R1-17][surveys], [R1-19][surveys], [R1-20][surveys], [R1-23][surveys] for the Dreamcast,
  and [R1-24][surveys] for the Xbox and Xbox 360), their models and combined units,
  and the minor systems placed here by first sale ("How the catalogue is built").
- Left to other notes: how the hardware works to the primer; each family's emulators to its survey;
  the law on encryption, firmware, and keys to [R0-02][r002]; each hub's evaluation to [R0-05][r005].
  The roadmap's host classes, PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles,
  are listed only as hosts, for [R3-07][phase3] and [R3-12][phase3]
  ([roadmap, "Hardware primers"][primers]);
  this note also treats PC-based home systems and Linux handhelds as hosts (inference).
- How claims were checked: two research agents, one for home systems and one for handhelds,
  read every page as raw text on 2026-11-20, Wikipedia as raw wikitext; no value comes from a summarising tool.
- Verification: the first version had two independent verification passes,
  each of seven verifiers taking a part of the note.
  A rework the same day answered its open questions from further sources, also read as raw text,
  and one more independent pass, by two verifiers
  (claims and quotations; links and shape), fetched the sources again and tested each new or changed claim.
  Every finding was checked against the raw source before the text was changed;
  the pull request lists the claims no verifier could check.
- Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed.
  A Wikipedia article's opening paragraphs are called its "opening", to keep "lead" for the marker.
  "Not established" in a table means the system's article and its hub, where one is named, give no value.
- Markers follow the [research guide, "Claim status"][claims]. "(lead)" marks a fact found only on [Comstedt's][mc-dc]
  or [Copetti's][cop-psp] site, which the [register][register] marks as leads; it is not relied on,
  and in the Hub column it marks such a site.
- Memory sizes that sources write in KB or MB are given in KiB and MiB, reading them as binary (inference);
  storage and disc capacities keep the source's decimal unit.
- What was not opened: firmware, BIOS or IPL images, key and exploit pages, bootloader listings, games,
  maker manuals hosted by others, and emulator code.
  XboxDevWiki's boot page, which holds bootloader listings after its prose, was read for its prose only,
  and is not linked here for that reason.
  Free60's fuse page was opened during research before it was found to show a console's key material;
  nothing from it is recorded or cited, and it was not opened again (research log).
  Where a hub page described a security mechanism, only its prose was read, and no key value was recorded.
- Two pages met during the rework hold key or boot-ROM material and are named only so that no one opens them:
  the Vita Development Wiki's card authentication page, `wiki.henkaku.xyz/vita/Game_Card`, which defines key data,
  and `3dbrew.org/wiki/Memory_layout`, which describes what the boot ROMs copy and where key data sits.
  Both were met in archive captures; reading stopped when the material was seen, the copies were deleted,
  and nothing from them is used (research log).
  The register closes both, and their addresses are not links because they hold key material.

## Findings

### How the catalogue is built

- An era holds the systems whose family survey depends on its primer; where a survey depends on more than one primer,
  each of its systems belongs to the era of its own generation,
  and the survey depends on the other primers for the hardware its systems contain or carry over
  ([roadmap, "Hardware primers"][primers]).
- The first rule places here the systems of [R1-17][surveys] and [R1-20][surveys],
  whose surveys depend on no primer but [R1-03][r103],
  although Wikipedia's infoboxes put the Wii and PSP in the seventh generation and the Wii U and Vita in the eighth;
  it leaves the PlayStation 3 to [R1-04][r104] ([R1-21][surveys]).
- The second rule places the PlayStation 2 ([R1-19][surveys]), the Dreamcast ([R1-23][surveys]),
  and the Xbox ([R1-24][surveys]) here, all sixth generation by their infoboxes.
  Read alone, it does not settle the 3DS family
  ([R1-13][surveys], on [R1-02][r102] and R1-03),
  whose eighth generation matches neither primer's title, or the Xbox 360
  (R1-24, on R1-03 and R1-04), a seventh-generation system (inference).
  The change that added the rule places both here, with R1-02 for the DS hardware inside the 3DS,
  and starts R1-04 at the Xbox One ([pull request #22][pr22], "Decisions for you"); this note follows it.
- A system that no survey names goes by its first sale: to 2000 in [R1-06][r106], from 2001 to 21 November 2005,
  the day before the Xbox 360's first sale, here, and later in [R1-08][r108].
  Each device is listed in one catalogue, and the others keep a one-line cross-reference.
  This placement is a process call made for every catalogue on 2026-11-20, and the pull request lists it;
  it replaces this note's earlier window of years of sale, 1998 to 2013.
  Devices that [R1-05][r105] places stay where it places them.
- R1-08's placement keeps the V.Flash, HyperScan, and V.Smile Baby here, although all three were first sold in 2006,
  because the V.Smile Baby belongs to the V.Smile line listed here
  ([R1-08][r108], "How the catalogue is built", in its rework of 2026-11-20).
  digiBlast's only date found, the end of 2005, cannot be placed against 21 November,
  so it is listed here with that date marked approximate (the note's call; the pull request lists it).
- Nuon, E-kara, and Pixter, first sold in 2000, are listed in [R1-06][r106]
  ("Other systems first sold to 2000", in its rework of 2026-11-20) and are cross-references here.
  ClickStart, the Didj and Leapster Explorer, the LeapPad Explorer, the Pocket Dream Console, and the Mi2
  (2006 to 2011)
  belong to R1-08 by first sale, but neither R1-08 on `main` nor its rework lists them,
  by a search of each for their names; their rows stay here until it does.
- Devices that run emulators of other systems are hosts, not systems to emulate; among those this note names,
  the GP2X line, Dingoo, GCW Zero, Pandora, and Xperia Play are hosts
  (the owner's rule of dedicated consoles only, as the placement rule applies it).
  The N-Gage and Tapwave Zodiac are dedicated game devices: both run their own game software,
  and neither is sold to run other systems' games; the P/ECE, which its article calls a PDA or a handheld game console,
  is classed the same way, and the PlayStation TV is listed with the Vita family
  (the note's calls; the pull request lists them).
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
  "Hub" names the best source other than Wikipedia, as registered,
  preferring a registered reference to a registered lead; a dash means Wikipedia was the only one found.
- Regions: NA North America, US United States, EU Europe, PAL the PAL markets, UK United Kingdom, JP Japan,
  KR South Korea, CN China, HK Hong Kong, AU Australia, BR Brazil, CA Canada.

### Home consoles

Identity (each system's Wikipedia article, infobox; Katana, Xenon, and the GameCube makers from the article body):

| System (other names) | Maker | First release | Survey | Hub |
|---|---|---|---|---|
| Dreamcast (Katana) | Sega | JP 1998-11-27; NA 1999-09-09; EU 1999-10-14; AU 1999-11-30 | R1-23 | Comstedt (lead) |
| PlayStation 2 | Sony Computer Entertainment | JP 2000-03-04; NA 2000-10-26; EU 2000-11-24 | R1-19 | ps2tek |
| GameCube (Dolphin) | Nintendo (ArtX, IBM chips) | JP 2001-09-14; NA 2001-11-18; EU 2002-05-03 | R1-17 | YAGCD |
| Xbox | Microsoft | NA 2001-11-15; JP 2002-02-22; PAL 2002-03-14 | R1-24 | XboxDevWiki |
| Wii (Revolution, RVL) | Nintendo | NA 2006-11-19; JP 2006-12-02; AU 2006-12-07; EU 2006-12-08 | R1-17 | WiiBrew |
| Xbox 360 (Xenon) | Microsoft | NA 2005-11-22; EU 2005-12-02; JP 2005-12-10 | R1-24 | Free60 |
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
  ([Wikipedia, "Dreamcast"][w-dc], "Hardware"; [Comstedt, "Hardware"][mc-hw], agrees).
  Sega Retro names the graphics chip PowerVR CLX2 ([Sega Retro, "Sega Dreamcast/Technical specifications"][sr-dc]).
- The GD-ROM holds up to 1 GB in a double-density area around a single-density one
  ([Wikipedia, "GD-ROM"][w-gd-rom], "Specification").
  The console unscrambles a GD-ROM's executable in memory,
  and its disc security was undone through its support for the MIL-CD format, by an exploit released in June 2000
  (same article, "Dreamcast console").
  The console also has regional lock-out (Wikipedia, "Dreamcast", "Game library").
- Sega Retro's technical page gives a 2 MiB system ROM and 128 KiB of flash, citing Sega documents hosted on Sega Retro,
  which the register closes, so those figures are not relied on (Sega Retro, technical specifications, citations).
  The Flycast core's documentation lists the Dreamcast BIOS as optional, offers a high-level BIOS,
  and names BIOS and flash files ([libretro documentation, "Flycast"][lr-flycast]).
- PlayStation 2: the Emotion Engine is 294.912 MHz in [Wikipedia's specifications article][w-ps2-spec]
  and in [ps2tek][ps2tek] ("EE Architecture").
  A 299 MHz figure for later consoles appears untagged in [Wikipedia, "PlayStation 2"][w-ps2], "Hardware",
  and in the specifications article, untagged in its overview
  and tagged "Failed verification" in "Central processing unit"; it is not used.
- Sources disagree on the Graphics Synthesizer's clock:
  147.456 MHz in the specifications article and the body of "PlayStation 2", and 150 MHz in that article's infobox.
  No Sony document read gives it.
  Sony's own keynote rounds the Emotion Engine to "EE(300MHz)"
  ([Kutaragi, Sony, Hot Chips 11 keynote][hc11], slides 9 and 10),
  and ps2tek gives the bus clock as "~147 MHz" ("EE Timers") and as "half the rate of the EE's clock"
  ("DMA Controller (DMAC)"); half of 294.912 MHz is 147.456 MHz (calculated).
  So 150 MHz reads as a rounding of the same kind as Sony's 300 (inference);
  no page read says that the Graphics Synthesizer runs at the bus clock.
- The input and output processor is a MIPS R3000A-class processor,
  36.864 MHz in PS2 mode and 33.8688 MHz for PlayStation games, and the SPU2 is two PlayStation-style sound cores
  (specifications article, "I/O processor" and "Audio"; ps2tek, overview,
  which calls the processor a "Duplicate of the PSX's CPU").
  The SCPH-7500x replaced it with a PowerPC-based core with 4 MiB of RAM
  ([Wikipedia, "PlayStation 2 models"][w-ps2-models], "Slimline case designs").
- The disc drive is "region-locked with copy protection"
  (specifications article, "Optical disc drive"),
  and the CDVD block is "Also responsible for MagicGate decryption" (ps2tek, overview).
  The BIOS region is 4 MiB, seen by both processors (ps2tek, memory maps).
  The libretro documentation for the LRPS2 core states
  that "it requires a set of real BIOS images dumped from your Playstation 2 console"
  ([libretro documentation, "LRPS2"][lr-lrps2]).
- GameCube: memory is 24 MiB of 1T-SRAM, 3 MiB in Flipper,
  and 16 MiB of DRAM used as a buffer for audio and the disc drive;
  the disc is a Matsushita-designed miniDVD-based format of up to 1.5 GB
  ([Wikipedia, "GameCube"][w-gamecube], infobox, "Hardware", and "Technical specifications").
- [YAGCD][yagcd] says a barcode authenticates the disc in the drive,
  and that the disc's content is XORed with a constant stream that the drive controller removes;
  the IPL in its RTC/IPL chip is also XORed with a constant stream, which decryption logic in Flipper removes
  (chapter 2, sections 2.4, 2.7, 2.8, and 2.8.1).
  Dolphin's core documentation says a BIOS is not needed for most games
  ([libretro documentation, "Dolphin"][lr-dolphin]).
- Xbox: memory is 64 MiB of unified DDR SDRAM, and the hard drive holds 8 or 10 GB formatted to 8 GB
  ([Wikipedia, "Xbox technical specifications"][w-xbox-spec]).
  The NV2A is northbridge and GPU, part of Nvidia's NV20 family, with three known revisions tied to board revisions
  ([XboxDevWiki, "NV2A"][xdw-nv2a]).
- XboxDevWiki describes no chain of trust for the MCPX X2,
  and for later revisions a chain from the hidden MCPX boot ROM through a decrypted second-stage loader to a kernel
  that runs only signed executables; MCPX 1.1 adds a flash boot loader,
  which the ROM checks by a hash and which then decrypts the second-stage loader
  (XboxDevWiki, "Boot Process", "Chain of trust"; not linked, as Scope says).
  The kernel sits in a 256 KiB flash ROM (same page), and the console unlocks its hard drive at boot
  ([Wikipedia, "Xbox (console)"][w-xbox], "Modding").
- The xemu emulator needs an MCPX boot ROM image, a flash image, and a hard-disk image,
  and currently cannot boot games with an unmodified retail flash image, because some DRM functions are not implemented
  ([xemu documentation, "Required Files"][xemu], as of 2026-11-20).
- Wii: memory is 24 MiB of 1T-SRAM and 64 MiB of GDDR3, with 512 MiB of flash
  ([Wikipedia, "Wii"][w-wii], infobox), which WiiBrew calls NAND ([WiiBrew, "Hardware"][wb-hw]).
  Starlet, an ARM926EJ-S at 243 MHz inside Hollywood, handles input, output, and security, and the DSP runs at 121.5 MHz
  (WiiBrew, "Hardware" and ["Hardware/Starlet"][wb-starlet]).
- The Wii's boot chain starts in a mask ROM on Starlet, which checks boot1 by hash, and boot1 checks boot2 by signature;
  IOS and the System Menu are not checked by signature at launch,
  and the System Menu's signature is checked only when it is installed ([WiiBrew, "Boot process"][wb-boot]).
- Wii disc partitions are encrypted and hashed in a four-level SHA-1 tree whose top table is signed,
  and the page also describes unencrypted discs ([WiiBrew, "Wii disc"][wb-disc]).
  Each title names the IOS version it runs on, and GameCube mode runs MIOS
  ([Wikipedia, "Wii system software"][w-wii-sys], "IOS").
- Xbox 360: each Xenon core runs two threads and has a VMX128 vector unit, and the cores share 1 MiB of L2 cache;
  memory is 512 MiB of unified GDDR3 ([Wikipedia, "Xbox 360 technical specifications"][w-x360-spec];
  [Free60, "Xenon (CPU)"][f60-xenon]).
  Xenos has unified shaders and a 10 MiB eDRAM die made by NEC (same article; [Free60, "Xenos (GPU)"][f60-xenos]).
  Sources disagree on its lineage: [Wikipedia, "Xenos (graphics chip)"][w-xenos] bases it on the R400 family,
  and the specifications article and Free60 relate it to the R500.
- A first-stage loader inside the Xbox 360's CPU decrypts the next loader and checks its signature, and later loaders,
  checked against known hashes or, for the kernel-patch loader, by signature, lead to the hypervisor and kernel
  ([Free60, "Boot process"][f60-boot]).
  The CPU holds 768 bits of eFuse-based one-time-programmable memory
  ([Wikipedia, "Xenon (processor)"][w-xenon]),
  and the hypervisor handles encryption and memory protection
  ([Free60, "Hypervisor"][f60-hv] and ["360 System Software"][f60-sys]).
- The Xbox 360 decodes its XMA audio in hardware.
  Microsoft's block diagram of the system shows an "XMA Decoder" in its I/O chip
  ([Andrews and Baker, Microsoft, "Xbox 360 System Architecture", Hot Chips 17 (2005)][hc17], slide 5,
  "System Block Diagram").
  Microsoft's audio documentation defines `XAUDIO2_E_XMA_DECODER_ERROR`
  as "The Xbox 360 XMA hardware suffered an unrecoverable error." ([Microsoft Learn, "XAudio2 Error Codes"][xaudio2]).
  The open-tier emulator Xenia models the decoder as a device with 320 decoding contexts
  ([Xenia, `src/xenia/apu/xma_decoder.h`][xenia-xma]; observed).
  The specifications article names only XMA and Dolby Digital 5.1.
- Wii U: memory is 2 GiB of DDR3, half reserved for the system
  ([Wikipedia, "Wii U"][w-wii-u], "Console"),
  and Latte holds 32 MiB of eDRAM, a figure that, with the clocks, Wikipedia marks as unconfirmed by the makers
  (same section, note "Unconfirmed hardware").
  WiiUBrew gives 1243.125 MHz for Espresso and 549.999 MHz for the GPU, citing a researcher's social-media posts
  ([WiiUBrew, "Hardware"][wub-hw]).
- Nintendo's own specification page names an IBM Power-based multi-core processor, an AMD Radeon-based GPU,
  and 8 GB of internal flash in the Basic Set or 32 GB in the Deluxe Set, and gives no RAM size and no clocks
  ([Nintendo of America, "Wii U: Tech specs"][n-wiiu], capture of 2013-05-26 15:15:08).
- The Latte chip holds a GX2 GPU and a GX GPU for Wii games (Wikipedia, "Wii U", "Console").
  The GamePad receives its display as video streamed from the console
  ([Wikipedia, "Wii U GamePad"][w-gamepad], "Features").
  The console is region locked (Wikipedia, "Wii U", "Games").
- By [WiiUBrew's "Boot process"][wub-boot]
  (revision of 2021-08-10, which marks itself a stub),
  the Wii U boots through three hash checks, two on Starbuck, the ARM core in Latte, and one on the PowerPC:
  a mask ROM verifies the next loader, that loader verifies the ARM operating system, IOSU, and IOSU starts the PowerPC,
  whose boot ROM verifies Cafe OS.
  The page does not say it took this from a boot-ROM dump; the note records the chain only, with no addresses.
  WiiUBrew lists the security processor with AES and SHA-1 engines and eFuses (WiiUBrew, "Hardware").

Models and combined units (Wikipedia: ["Dreamcast"][w-dc], "Models"; ["PlayStation 2 models"][w-ps2-models];
["PSX (digital video recorder)"][w-psx]; ["GameCube"][w-gamecube], "Technical specifications" and "Panasonic Q";
["Game Boy Player"][w-gbp]; ["Wii"][w-wii]; ["Xbox 360 technical specifications"][w-x360-spec]):

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
  (same article, opening), so it is listed for [R1-11][surveys] as well.
- The Wii Mini drops GameCube support, Wi-Fi, the SD slot, and 480p and component output,
  and Korean Wii consoles do not play GameCube discs (Wikipedia, "Wii", "Wii Mini" and "Backward compatibility").
- Wikipedia lists twelve Xbox 360 board revisions with their chip process sizes: the Trinity board of June 2010,
  for the 360 S, first merges processor and GPU into one chip,
  and the Winchester board of August 2014 puts the eDRAM on the main die and "patches 'Reset Glitch Hack'"
  (Wikipedia, "Xbox 360 technical specifications", "List of revisions").

### Minor and educational home systems

Every row rests on the Wikipedia article on the system, unless it names another source;
the Beena's is a section of [Wikipedia, "Sega Pico"][w-sega-pico].
By first sale, the ClickStart row belongs to [R1-08][r108]; it stays here until R1-08 lists it.
Nuon (2000-07) and E-kara (JP 2000-10-20) are listed in [R1-06][r106], and Zeebo (BR 2009-05-25) in R1-08
("How the catalogue is built").

| System (other names) | Maker | First release | CPU | Media | Class |
|---|---|---|---|---|---|
| XaviXPORT (Domyos Interactive System) | SSD Company | US 2004 | 6502 or 65C816 in cartridge | cartridge | D |
| V.Smile (Motion, PC Pal; Pocket handhelds) | VTech | 2004-08-04 | Sunplus SPG200, 27 MHz | cartridge | D |
| V.Smile Baby | VTech | 2006 | not established | cartridge | D |
| Advanced Pico Beena (Beena Lite) | Sega Toys | JP 2005-08-06 | ARM7TDMI, 81 MHz | book cartridge | D |
| Game Wave | ZAPiT Games | CA 2005-10 | Mediamatics 8611 | DVD-ROM | combined |
| V.Flash (V.Smile Pro) | VTech | 2006-09 | ARM9 (LSI Logic) | CD in a case | D |
| HyperScan | Mattel | NA 2006-10-23 | Sunplus SPG290, 108 MHz | CD-ROM and RFID cards | D |
| ClickStart | LeapFrog | 2007 | not established | cartridge | D |

- The XaviXPORT puts the processor in each cartridge
  ([Wikipedia, "Xavix"][w-xavix], "Hardware");
  [Wikipedia's list of home consoles][w-home-list] says "8-bit,16-bit and 32-bit (depending on game cartridge)" instead.
- The V.Smile Pocket of 2004-09-10 is a handheld V.Smile, and all Smartridge titles run across the V.Smile line,
  but V.Smile Baby cartridges and consoles are not compatible with the rest
  ([Wikipedia, "V.Smile"][w-v-smile], "V.Smile Pocket and V.Smile Cyber Pocket", "Games",
  and "V.Smile Baby Infant Development System").
- The Advanced Pico Beena's chip is the Applause Technologies AP2010, with 128 KiB of on-chip ROM and 16 KiB of RAM,
  figures that Sega Retro attributes to the chip maker's product catalogue; its external SDRAM,
  which Sega Retro labels 16MB beside links to the chips' datasheets, comes to 16 Mbit
  (2 MiB) by the bank layout the page gives ([Sega Retro, "Advanced Pico Beena"][sr-beena]; calculated from the layout).
- Sales figures for the Beena differ:
  Wikipedia gives both a Sega claim of over 350,000 consoles and a 2010 Sega estimate of 4.1 million, with a 2011 end
  ("Sega Pico", opening and section "Advanced Pico Beena");
  Sega Retro gives more than 350,000 by May 2008 and production to 2013 (same page).
- The V.Flash's discs are ISO 9660 CDs in plastic shells "without any copy protection mechanism other than a simple
  sensor in the case jacket" ([Wikipedia, "V.Flash"][w-v-flash], "CDs").
  The HyperScan's cards hold 96 bytes of user memory each ([Wikipedia, "HyperScan"][w-hyperscan], "Hardware").
- Protection is described for none of these systems other than the V.Flash and the V.Smile,
  by a search of each article listed for "protect", "lock", "encrypt", "security", "piracy", and "copy" (research log).
  The V.Smile's article says its consoles are apparently not region-locked although their BIOS appears region-specific,
  a clause it marks as needing a citation ("V.Smile", "Region protection and inter-compatibility").

### Handhelds

Identity (each system's Wikipedia article, infobox and model sections;
3DS-family model codes from [3dbrew, "Hardware"][3db-hw], "Specifications"):

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
  ([Wikipedia, "PlayStation Vita"][w-vita], infobox note).
  The New 3DS's first European sale was a bundle for Club Nintendo members
  ([Wikipedia, "New Nintendo 3DS"][w-new3ds], "Release"),
  and its retail release in Europe and North America was 2015-02-13
  ([Wikipedia, "Nintendo 3DS"][w-3ds], "New Nintendo 3DS").
- The 3DS's signal processor runs at 134 MHz (3dbrew, "Hardware", table).

Hardware:

| System | CPU | Video | Audio | Media |
|---|---|---|---|---|
| PSP | Allegrex and Media Engine (MIPS32), 1 to 333 MHz | 166 MHz, 2 MiB eDRAM | 2 PCM channels (lead) | UMD, MS Duo |
| PSP Go | as PSP | as PSP | as PSP | 16 GB flash, Memory Stick Micro |
| PlayStation Vita | 4 Cortex-A9; PSP-family MIPS (lead) | SGX543MP4+ | stereo; no chip named | Vita card, memory card |
| 3DS, 3DS XL, 2DS | 2 ARM11, 268 MHz; ARM946; ARM7TDMI (lead) | PICA200, 268 MHz | DSP; DS unit (lead) | cards; SD |
| New 3DS family | four ARM11 MPCore, up to 804 MHz | PICA200 | as 3DS | as 3DS; microSD |

Sources: Wikipedia, ["PlayStation Portable"][w-psp], ["PlayStation Portable hardware"][w-psp-hw],
["PlayStation Vita"][w-vita], ["Nintendo 3DS"][w-3ds], and ["New Nintendo 3DS"][w-new3ds]; [3dbrew, "Hardware"][3db-hw];
Copetti ([PSP][cop-psp], [Vita][cop-vita], [3DS][cop-3ds]) for the cells marked (lead).

Protection and firmware:

| System | Protection | Firmware |
|---|---|---|
| PSP | Sony-signed code; AES-encrypted UMD; boot ROM in the main chip (lead); region-free | XMB, last 6.61 (2015) |
| PlayStation Vita | encrypted content; security blocks, hidden ROM (lead); region-free | FreeBSD, NetBSD parts |
| 3DS family | boot ROM checks; signed, AES-CTR-encrypted titles (lead); region lock | four FIRM modes; 11.17.0-50 |

Sources: Copetti for the cells marked (lead); Wikipedia, ["Region lock"][w-region-lock] and each system-software article
(["PlayStation Portable system software"][w-psp-sys], ["PlayStation Vita system software"][w-vita-sys],
["Nintendo 3DS system software"][w-3ds-sys]); the Vita's encryption as below.

- PSP: memory is 32 MiB, doubled to 64 MiB from the PSP-2000,
  beside 4 MiB of eDRAM split between the GPU and the Media Engine
  (Wikipedia, "PlayStation Portable", "PSP-1000"; "PlayStation Portable hardware", "Memory").
  Licensed software was held to 222 MHz until system software 3.50,
  released in May 2007 by one article and confirmed by Sony on 2007-06-22 by the other,
  which adds that the change does not affect games already released
  (Wikipedia, "PlayStation Portable", "PSP-1000"; "PlayStation Portable hardware", "CPU").
- Wikipedia's hardware article gives the PSP's clock range as 1 to 333 MHz, as YAPSPD does,
  while Copetti gives 33 to 333 MHz ("PlayStation Portable hardware", "CPU"; [YAPSPD][yapspd], chapter 2.1;
  [Copetti, "PlayStation Portable Architecture"][cop-psp], lead).
- The PSP's vector unit has no public maker documentation: "Sony did not release any public documentation
  (nor SDK/toolchain)
  for the Sony PSP", and vfpu-docs backs each statement of its instruction descriptions with a test run on a PSP
  ([vfpu-docs README][vfpu]).
- PSP games are region-free while UMD films are region-coded (Wikipedia, "Region lock").
  Copetti describes "a hidden, undocumented 4 KB ROM inside Tachyon", the main chip
  ("Operating System", "Architecture and design"),
  a boot that continues from NAND flash
  ("Boot process"),
  and a chain of trust and security blocks for decryption and drive control ("Anti-Piracy and Homebrew")
  (Copetti, PSP; lead).
  PPSSPP needs no firmware: "No BIOS file required to play, PPSSPP is an 'HLE' emulator." ([PPSSPP README][ppsspp]).
- The PSP Go has no UMD drive and adds Bluetooth; the PSP Street has no Wi-Fi
  (Wikipedia, "PlayStation Portable", "PSP Go (N1000)" and "PSP Street (E1000)").
- PlayStation Vita: memory is 512 MiB plus 128 MiB of video memory; the screen is 960 × 544,
  OLED on the PCH-1000 and LCD on the PCH-2000
  (Wikipedia, "PlayStation Vita", "Hardware", infobox, and "Revised model").
- Sources give two clocks for the Vita's processor.
  Wikipedia says that in 2018 a plugin "allowed the Vita's CPU to be overclocked to 494 MHz,
  above its officially supported maximum of 444 MHz"
  ("PlayStation Vita", "Hardware").
  psdevwiki gives a range of "111 MHz to 500 MHz (Clockrate can be manually changed if the handheld is modded)"
  ([psdevwiki, Vita Developer wiki, "CPU"][a-psdev-cpu], capture of 2026-03-10 09:17:44),
  which is the 500 MHz Copetti gives ([Copetti, "PlayStation Vita Architecture"][cop-vita], "The main CPU"; lead).
  So 444 MHz is the highest rate Sony supports for software,
  and up to 500 MHz is reached only on modified units (inference).
- Copetti says the main chip also holds a MIPS core of the PSP's family, used for PSP and PlayStation games
  (same article, "One last CPU"; lead).
- Every Vita game released is region-free (Wikipedia, "Region lock").
  Vita retail content is encrypted (Vita Development Wiki, "Security",
  as [R1-03, "Discs and what arrives as a plain image"][r103-discs] cites it).
  The one page found that describes the card's own authentication, among the Vita Development Wiki's archive captures,
  holds key data and was not read further (research log; Scope names the page).
- The PlayStation TV has the Vita's processor, GPU, and memory, outputs over HDMI, is controlled by a DualShock 3 or 4,
  and does not run Vita games that need the touch screen, rear pad, microphone, or camera
  ([Wikipedia, "PlayStation TV"][w-pstv], infobox; "PlayStation Vita", "PlayStation TV").
- Nintendo 3DS: 3dbrew gives the ARM11 cores at twice the ARM9's clock,
  one core running the system and the other the application, and 6 MiB of VRAM in the SoC
  (3dbrew, "Hardware", table and "SoC").
  3dbrew attributes the dual-core 268 MHz CPU and the core split to "official documents" without naming them;
  a footnote "Official Documentation" has no anchor in the table (same page, "SoC" and footnotes).
  Copetti adds an ARM7TDMI in the SoC for DS and Game Boy Advance modes
  ([Copetti, "Nintendo 3DS Architecture"][cop-3ds]; lead).
- Sources disagree on the 3DS's internal storage.
  Nintendo's specification page lists a 2 GB SD card in the box and gives no internal storage
  ([Nintendo of America, "Nintendo 3DS: Hardware specs"][n-3ds], capture of 2011-10-16 18:10:20).
  3dbrew's table names a Toshiba storage chip marked 1 GB for the 3DS and 3DS XL,
  4 GB or 2 GB parts for the New 3DS and New 3DS XL, and a 4 GB part for the New 2DS XL;
  for the 2DS it gives parts that "Changed between O3DS and N3DS parts depending on production date"
  (3dbrew, "Hardware", "Specifications").
- Wikipedia's 2 GB figure for the 3DS cites a teardown press release by IHS iSuppli
  (Wikipedia, "Nintendo 3DS", "Hardware" and its reference).
  The chip markings are the closer evidence (inference).
- The PICA200 has programmable vertex and geometry stages and a fixed-function fragment stage
  ([Wikipedia, "PICA200"][w-pica200], "Overview"; 3dbrew, "Hardware", "GPU", for the programmable stages only).
- Three sources disagree on the 3DS signal processor's family: 3dbrew lists a CEVA TeakLite, Copetti a TeakLite II,
  and Teakra's author says its processor is "likely the original Teak"
  (3dbrew, "Hardware"; Copetti, 3DS, "Audio"; [Teakra README][teakra]).
  Teakra thanks GBATEK's Teak section,
  which the [register][register] closes because GBATEK says it rests on leaked files
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
  Azahar describes itself as a high-level 3DS emulator ([Azahar README][azahar]).
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
[R1-06][r106] keeps a cross-reference row for each of the first six
("Cross-references to other catalogues", in its rework of 2026-11-20).
By first sale, the last three rows belong to [R1-08][r108]; they stay here until R1-08 lists them.
Pixter (2000) is listed in R1-06 ("How the catalogue is built").

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
| Didj; Leapster Explorer | LeapFrog | 2008-08-22; NA 2010 | LF-1000 (ARM9), 393 MHz; ARM9 | cartridge, download | D |
| LeapPad Explorer | LeapFrog | 2011-08-15 | ARM9 | cartridge, download | boundary (tablet) |
| Pocket Dream Console; Mi2 | Conny; Planet Interactive | JP 2006-08-03; 2009-10 | SPG240; MIPS | built-in | boundary |

- The P/ECE's row rests on [Japanese Wikipedia, "PIECE"][ja-piece]
  (revision 110504604, infobox; the note's own translation),
  whose opening calls it a PDA or a handheld game console, and on [Aquaplus, P/ECE product introduction][aquaplus],
  which says its software comes on CD-ROM or the web and is downloaded to the unit over USB
  (read in Japanese; the summary is the note's own).
- digiBlast rests on [Wikipedia, "List of commercial failures in video game consoles"][w-failures], "digiBlast",
  the only description found, which calls its hardware "similar to the Game Boy Advance";
  no article of its own was found by a Wikipedia title search for "DigiBlast" and "Digiblast" (research log).
- The GameKing list is partial: the article also describes a GM-221 ([Wikipedia, "GameKing"][w-gameking]).
- The Mi2 also sold games for download from September 2010 ([Wikipedia, "Mi2 (console)"][w-mi2]).
  The Pocket Dream Console was created by Conny in 2004 and released in Japan in 2006
  ([Wikipedia, "Pocket Dream Console"][w-pdc]).
  Both are marked boundary because their games are built in or downloaded, with no game media,
  which the owner's rule does not address (inference).
  [Wikipedia's article on the LeapPad Explorer][w-leappad-x] calls it a tablet (infobox).
- The N-Gage's infobox names an ARM920T and its text an "ARM4T architecture" processor at 104 MHz,
  running Symbian OS 6.1 ([Wikipedia, "N-Gage"][w-n-gage]); "N-Gage 2.0", planned from 2005 and released in April 2008,
  was a service on Nokia phones, not hardware (same article, "N-Gage 2.0").
- The Zodiac's article says it began shipping in October 2003, and its infobox gives 2003-11-01
  ([Wikipedia, "Tapwave Zodiac"][w-zodiac], opening and infobox).
  It runs Palm OS 5, with Tapwave's own programming interfaces for graphics and sound;
  its sales are given as "50,000+" in its infobox and as fewer than 200,000 in a generation table
  ([Wikipedia, "Sixth generation of video game consoles"][w-gen6], "Sales").
- The Gizmondo ran Windows CE; a cheaper model was sold to show advertisements, but the service never launched;
  Wikipedia places it in the seventh generation ([Wikipedia, "Gizmondo"][w-gizmondo]).
- The Leapster runs MQX and Macromedia Flash content; the Leapster Explorer runs Didj cartridges but not Leapster ones
  ([Wikipedia, "Leapster"][w-leapster]; ["Leapster Explorer"][w-leapster-x]).
- The Juice Box (Mattel, 2004) is a children's video player and is left out ([Wikipedia, "Juice Box"][w-juice-box]).
- GP32 retail games came on SmartMedia cards encrypted to run only from those cards,
  and downloaded games were encrypted to one console's ID
  ([Wikipedia, "GP32"][w-gp32], "Commercial");
  pirated N-Gage games ran on other Nokia phones of the period ("N-Gage", "Reception and legacy").
  No other protection is described for the N-Gage, Zodiac, Gizmondo, Leapster, or Didj,
  by a search of each article for "protect", "encrypt", "lock", and "DRM" (research log).

### Emulator hosts, PC-based systems, and cancelled systems

- PC-based home systems, listed as hosts: DISCover, a technology for booting PCs into games like a console,
  shown at E3 2003 ([Wikipedia, "DISCover"][w-discover]); the EVO Smart Console of 2008,
  an Athlon PC running Linux or Windows ([Wikipedia, "EVO Smart Console"][w-evo]).
- The OnLive Game System, a cloud-streaming client with pre-orders from 2010-11-17, is listed as a host
  ([Wikipedia, "OnLive"][w-onlive]).
- Hosts listed in [R1-08][r108], which keeps their rows: the Ouya of 2013 ([Ouya][w-ouya]),
  the GP2X of 2005 and its successors
  ([GP2X][w-gp2x], [GP2X Wiz][w-gp2x-wiz], [Caanoo][w-caanoo]),
  the Dingoo A320 of 2009, whose own software includes emulators ([Dingoo][w-dingoo]), the Pandora of 2010
  ([Pandora][w-pandora]), the Neo Geo X of 2012, the GCW Zero of 2013 ([GCW Zero][w-gcw-zero]), the Xperia Play phone of
  2011 ([Xperia Play][w-xperia-play]), the Nvidia Shield Portable of 2013 ([Nvidia Shield Portable][w-shield]), and two
  Linux and Android lines, the Game Gadget of 2012 ([Game Gadget][w-game-gadget]) and JXD's handhelds ([JXD][w-jxd])
  (all Wikipedia).
- The Neo Geo X runs Neo Geo games by emulation
  ([Wikipedia, "Neo Geo X"][w-neo-geo-x]),
  which makes it a retro "mini" console, a host class of the roadmap ([roadmap, "Hardware primers"][primers]).
- Cancelled, and left out: the Indrema L600 ([Indrema][w-indrema]) and Phantom
  ([Phantom Entertainment][w-phantom])
  (home); [XGP][w-xgp], [Red Jade][w-red-jade], and Panasonic's [Jungle][w-jungle] (handheld)
  (Wikipedia, [list of home consoles][w-home-list], cancelled systems, and the articles linked).
- Arcade boards built on these consoles belong to [R1-25][surveys]:
  Wikipedia says the [Dreamcast][w-dc] shared hardware with NAOMI (opening), and XboxDevWiki lists Chihiro with the Xbox
  ([XboxDevWiki, "Main Page"][xdw-main]).

### Boundary cases

| System | Wikipedia generation | Rule that disagrees | Placed |
|---|---|---|---|
| Wii; PSP | seventh | generation | here, by survey (R1-17, R1-20) |
| Wii U; Vita | eighth | generation | here, by survey (R1-17, R1-20) |
| 3DS family | eighth | R1-13 depends on R1-02 and R1-03 | here, by pull request #22 |
| New 2DS XL | eighth | years of sale (2017) | here, with the 3DS family |
| PlayStation 3 | seventh | GPU and years | not here: R1-04, by survey R1-21 |
| Xbox 360 | seventh | R1-24 depends on R1-03 and R1-04 | here, by pull request #22; R1-08 agrees |
| PlayStation TV | Wikipedia: "Microconsole" | owner's host rule | with the Vita family (the note's call) |
| Dreamcast VMU | sixth | memory card, not a console | with the Dreamcast (from R1-05) |
| GameKing | sixth, by category | 8-bit processor | here, by years (from R1-05) |
| Pokémon mini; Cybiko | sixth | 8-bit or 16-bit | not here: R1-05 |
| V.Smile Pocket | sixth | a handheld V.Smile | here, with the V.Smile |
| GP32, N-Gage, Zodiac, Leapster, Gizmondo | sixth or seventh | R1-06 keeps cross-references | here, by first sale |
| P/ECE | not checked | PDA or game console | here, by first sale; class D (the note's call) |
| V.Flash; HyperScan | not checked | first sold in 2006 | here, by R1-08's placement |
| digiBlast | not given | first sale "end of 2005" | here, the date approximate |
| Nuon; E-kara; Pixter | not checked | first sold in 2000 | R1-06, by first sale |
| Game Gadget; JXD | not checked | first sold after 2005 (R1-08's dates) | R1-08, as hosts |
| ClickStart; Didj to Mi2 | not checked | first sold 2006 to 2011 | R1-08 by first sale; kept here until it lists them |
| Game Boy Player | sixth | add-on with Game Boy Advance hardware | here, also relevant to R1-11 |

The roadmap items in the table are [R1-02][r102], [R1-04][r104], [R1-05][r105], [R1-06][r106], [R1-08][r108],
and the surveys [R1-11, R1-13, R1-17, R1-20, R1-21, and R1-24][surveys].

- The PlayStation TV runs Vita game cards and the Vita's system software on the Vita's processor and GPU
  ([Wikipedia, "PlayStation TV"][w-pstv], infobox),
  and Copetti describes it as the original model's motherboard adapted for use at home
  ([Copetti, Vita][cop-vita], "Models and variants"; lead).
- R1-05 lists Cybiko and Pokémon Mini and leaves the GameKing and the VMU to this note
  ([R1-05][r105], "Boundary cases").
- "Not checked" in the generation column means the note did not look up Wikipedia's generation for those rows;
  digiBlast's only description gives none.

### Patterns across the catalogue

- PowerPC runs four of the seven home systems: IBM's Gekko, Broadway, Espresso, and Xenon
  (Wikipedia, ["GameCube"][w-gamecube], ["Wii"][w-wii], ["Wii U"][w-wii-u],
  and ["Xbox 360 technical specifications"][w-x360-spec]; the grouping is the note's).
  The Wii's graphics descend from the GameCube's, and the Wii U keeps a GX unit for Wii games
  ("Wii", "Console"; "Wii U", "Console").
- A security processor separate from the game processor appears in the Wii and Wii U
  (Starlet and its successor Starbuck in Latte)
  and the 3DS (the ARM9) ([WiiBrew, "Hardware/Starlet"][wb-starlet]; [WiiUBrew, "Hardware"][wub-hw];
  [Copetti, 3DS][cop-3ds], "The security processor", lead).
- Backward compatibility puts an earlier system's hardware inside a later one:
  the PlayStation 2's input and output processor and sound cores, the Wii's GameCube mode, the Wii U's Wii mode, and,
  by Copetti, the 3DS's ARM7TDMI for DS and Game Boy Advance modes and the Vita's MIPS core for PSP games (lead)
  (rows and findings above).
- Every major home system protects its software in some way (rows above; the grouping is the note's).
  Five have a boot path whose first stage is code inside a chip: the Xbox's MCPX ROM, which decrypts or, on MCPX 1.1,
  hashes what follows (none on the MCPX X2); the Wii's mask ROM on Starlet, the Wii U's boot0 on Starbuck,
  and the Xbox 360's loader in the CPU, each checking what follows; and the GameCube,
  whose IPL is decrypted by logic in Flipper.
- The PlayStation 2 protects discs in the drive and memory cards through MagicGate;
  the Dreamcast relies on its disc format, scrambled executables, and region lock-out
  (findings above; the comparison is an inference).
- Emulators' need for firmware differs by system, by their own documentation:
  - required for the PlayStation 2 ([LRPS2][lr-lrps2]) and for low-level Xbox emulation
    ([xemu, "Required Files"][xemu]);
  - optional for the Dreamcast ([Flycast][lr-flycast]) and for most GameCube games ([Dolphin][lr-dolphin])
    (libretro documentation);
  - needed by some Wii games: Dolphin says "Some games may require files only found in a full NAND dump to work
    correctly." ([Dolphin, "NAND Usage Guide"][dolphin-nand], capture of 2026-10-23 00:17:25; the live page answers
    scripts with a bot challenge, research log);
  - optional for the Wii U's system libraries: Cemu "emulates parts of these system RPL files",
    and supplying them "can improve compatibility with some OS functions and features that Cemu doesn't emulate fully
    or correctly" ([Cemu Wiki, "System RPL Files"][cemu-rpl], "Description", revision of 2026-06-23);
  - not needed for the PSP ([PPSSPP README][ppsspp]), and for the Xbox 360 by Xenia's high-level kernel:
    "Xenia implements all kernel APIs as native functions under the host."
    ([Xenia, `docs/kernel.md`][xenia-kernel]); that it needs no firmware image is an inference.
- Combined units are common: a GameCube with a DVD player, a Dreamcast in a television,
  and PlayStation 2s in a video recorder, a car DVD player, and a television (rows above).

### Coverage of sources

- An open-tier hub other than Wikipedia covers the PlayStation 2 ([ps2tek][ps2tek]), GameCube ([YAGCD][yagcd]), Xbox
  ([XboxDevWiki][xdw-main]), Wii ([WiiBrew][wb-hw]), Wii U ([WiiUBrew][wub-hw]), Xbox 360 ([Free60][f60-xenon]), PSP
  ([YAPSPD][yapspd], [vfpu-docs][vfpu]), and the 3DS ([3dbrew][3db-hw]); [Comstedt's Dreamcast pages][mc-dc] and
  Copetti's articles ([PSP][cop-psp], [Vita][cop-vita], [3DS][cop-3ds]) serve as leads; their tiers are in the
  [register][register] and [R0-05][r005].
- ps2tek states no origin for its facts; YAGCD's author says it comes from games, patents, and public documents;
  WiiBrew bars leaked kit content, and WiiUBrew forbids leaked information (register lines for each).
- Every minor home system and every other dedicated handheld rests on Wikipedia alone among the register's hubs,
  apart from [Sega Retro's page on the Advanced Pico Beena][sr-beena] and [the P/ECE's maker's page][aquaplus]
  (research log).
- Hubs that refused automated requests: the Vita Development Wiki
  (bot challenges, its captures too),
  GBATEK's 3DS sound page (HTTP 403), and 3dbrew after its first page;
  psdevwiki's live pages answer with bot challenges, but its archive captures can be read (research log).
- No maker document for the PowerVR2, Graphics Synthesizer, Flipper, NV2A, Hollywood, Xenos, Latte, PSP graphics,
  or SGX543 is available on the hubs above or at the register's maker lines (research log).
  The [PS2 Linux site][ps2linux], registered as a copy of Sony's,
  says in its FAQ that six Sony system manuals covering the Emotion Engine, vector units,
  and Graphics Synthesizer shipped with the Linux kit, copyrighted by Sony.
  For the PICA200 the register lists a paper by staff of its maker, DMP, which was not read (register; R0-05).
- Maker material cited here: [Microsoft's Hot Chips 17 talk][hc17] and [XAudio2 documentation][xaudio2],
  [Sony's Hot Chips 11 keynote][hc11], and Nintendo's specification pages for the [3DS][n-3ds] and [Wii U][n-wiiu],
  read in archive captures (register lines for each).
  Sony's archived PSP specification page is maker material that is not yet registered, so it is not cited;
  it is evaluated when R1-20 cites it.

## Options and trade-offs

### Study every catalogued system, or only those with a survey

- **What:** give each row a later study, or limit study to the systems the surveys name.
- **Costs:** studying every row adds up to 19 studies, one for each row of the minor-home and other-handheld tables,
  most resting on Wikipedia; surveys only leaves the XaviXPORT, the Beena, the V.Smile line,
  and the other minor systems to one survey, [R1-26][surveys].
- **Gains:** every row studied gives the widest choice for [R6-01][phase6]; surveys only keeps the research finite.
- **Used by:** the roadmap, whose surveys that depend on [R1-03][r103] name Nintendo, Sony, Microsoft, and Sega only,
  and whose R1-26 takes the systems no other survey names, depending on every primer and catalogue
  ([pull request #30][pr30], merged).

### One target per family, or one per model

- **What:** treat a family (PSP models, 3DS models, Xbox 360 boards) as one target,
  or treat models whose processors or clocks differ, such as the New 3DS, as separate ones.
- **Costs:** one per family hides per-title clock and cache modes;
  one per model multiplies work for machines whose differences are ports and cases.
- **Gains:** one per family matches how titles were written; one per model matches what a user owns.
- **Used by:** none found among the surveys' roadmap entries and the hubs read;
  [3dbrew][3db-hw] documents the original and New 3DS on one page and records the New 3DS clock mode
  as a flag a title may set.

### Placing the 32-bit handhelds of 2001 to 2008

- **What:** keep the GP32, P/ECE, N-Gage, Zodiac, Gizmondo, and Leapster here, or move them to [R1-06][r106].
- **Costs:** either way each needs one placement, and the other catalogue a cross-reference.
- **Gains:** a single placement avoids duplicate rows; their survey, R1-26,
  already depends on [R1-02][r102] and R1-03 for their hardware.
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
  (the PlayStation 2's GPU clock, the 3DS's storage, the Beena's sales).
  The minor systems' articles cite maker pages and press releases
  (VTech, Mattel, Sega Toys),
  which were not followed and are not registered, and the register's maker lines hold none for these systems
  (research log); Sega Retro attributes the Beena's chip figures to the chip maker's catalogue, which was not read.
- **Gains:** Wikipedia is complete enough to identify the machines.
- **Used by:** this catalogue, for identification and catalogue-level values only.

### Recommendation

- **Study:** study only the surveyed systems, and leave the minor and educational systems to [R1-26][surveys],
  as the roadmap now does ([pull request #30][pr30], merged), instead of up to 19 studies.
  Those rows rest on Wikipedia almost alone: only the Beena also has Sega Retro, and the P/ECE its maker's page.
- **Targets:** one target per family, with model differences, such as the New 3DS clock and cache modes,
  the Xbox 360 board revisions, and the PSP's memory sizes, as modes of that target.
  3dbrew documents the original and New 3DS on one page and records the New 3DS clock mode as a flag a title sets,
  and the Xbox 360 boards differ in process and in which chips are merged
  ([Wikipedia, "Xbox 360 technical specifications"][w-x360-spec], "List of revisions").
- **32-bit handhelds:** none needed; the placement rule settles them, and R1-26 already depends on every primer.
- **Combined units:** list combined units as variants of the game hardware they run,
  and note in the row any firmware or drive that differs,
  such as the PSX's merged chip and XrossMediaBar or the Panasonic Q's drive;
  the PlayStation TV goes with the Vita family by the placement rule.
  A game sees the console hardware, which is what an emulator targets (inference).
- **Wikipedia-only systems:** accept Wikipedia for identity and catalogue-level values, marked as tertiary,
  and require maker material, a patent, a registered hub,
  or a hardware test before a study or [R6-01][phase6] relies on a figure.
  No maker document read gives the disputed figures this note checked
  (3DS storage, Wii U memory and clocks, the Graphics Synthesizer's clock),
  so the catalogue cannot wait for them; the disputes are visible where a row was checked against a second source.

## Implications for Rustalgia

- Which rows Rustalgia may emulate is the owner's decision, informed by the scope [R6-01][phase6] proposes;
  the survey column shows which have an emulator survey behind them.
- Every major system here encrypts, signs, authenticates, or scrambles its software.
  [R0-02][r002-us] records that the statute's definition of circumventing includes descrambling a scrambled work,
  so the Dreamcast's scrambled executables fall within its wording (inference).
- Among its [questions no court was found to have decided][r002-open],
  R0-02 lists whether a cartridge-era lock-out on an unencrypted game, such as a logo comparison, a lock-out chip,
  or a region check, is an access control,
  and it records that Divineo treated a disc authentication check as an access control, on the console.
  The Dreamcast's GD-ROM format check is a disc check, closer to Divineo's than to a cartridge lock-out (inference).
- That exposure feeds [R1-13][surveys], [R1-17][surveys], [R1-19][surveys], [R1-20][surveys], [R1-23][surveys],
  and [R1-24][surveys].
  R1-13, R1-17, R1-20, and R1-24 depend on R0-02 ([pull request #30][pr30] added three of them).
  Recommendation: add R0-02 to the dependencies of R1-19 and R1-23.
- Firmware needs differ: some emulators require dumped images, some take them as optional,
  and the PSP's runs without them, as does the Xbox 360's by its high-level kernel (inference);
  this feeds [R2-12][phase2].
- Backward-compatible hardware inside later systems ties R1-13 and R1-19 to [R1-02][r102],
  as the roadmap's rule for surveys that span primers states, and both depend on it.
  The PSP's processors are not carried over from an earlier system, and [R1-03][r103] covers them,
  so R1-20 needs no dependency on R1-02 (inference).
- Systems resting on Wikipedia almost alone need a better source before a study relies on them;
  this feeds [R1-26][surveys], the survey for the minor home systems and other handhelds.

## Open questions

- What processors do ClickStart, digiBlast, and the V.Smile Baby use,
  and at what clock does the original LeapPad Explorer's ARM9 run?
  Wikipedia's articles on each give none (the LeapPad Explorer's 550 MHz figure is for the LF-2000 models of July 2012).
  MAME may have drivers for some of them
  (from memory),
  but MAME is walled, so only a session the owner starts as a reader could read them,
  writing functional descriptions only; a teardown or board photograph, found and registered under [ADR 0001][adr1],
  is the other route.
  [R1-26][surveys], which takes these systems, would do that work.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext through `action=raw`; each link opens the revision read,
whose ID follows it.

Wikipedia, generations and lists:

- ["Sixth generation of video game consoles"][w-gen6] 1386505550;
  ["Seventh generation of video game consoles"][w-gen7] 1386320369;
  ["List of home video game consoles"][w-home-list] 1386685039;
  ["List of handheld game consoles"][w-handheld-list] 1384273411;
  ["Template:Video game consoles"][w-template] 1386365370; ["Region lock"][w-region-lock] 1384605268;
  ["List of commercial failures in video game consoles"][w-failures] 1384334190.

Wikipedia, home consoles and models:

- ["Dreamcast"][w-dc] 1386172458; ["GD-ROM"][w-gd-rom] 1383605234; ["VMU"][w-vmu] 1379027676.
- ["PlayStation 2"][w-ps2] 1386205170; ["PlayStation 2 technical specifications"][w-ps2-spec] 1355643867;
  ["PlayStation 2 models"][w-ps2-models] 1386181656; ["PSX (digital video recorder)"][w-psx] 1371119147.
- ["GameCube"][w-gamecube] 1386636021; ["Game Boy Player"][w-gbp] 1385936501.
- ["Xbox (console)"][w-xbox] 1386021612; ["Xbox technical specifications"][w-xbox-spec] 1373212195;
  ["Xbox system software"][w-xbox-sys] 1386323584.
- ["Wii"][w-wii] 1386550313; ["Wii system software"][w-wii-sys] 1386323257.
- ["Wii U"][w-wii-u] 1386323270; ["Wii U GamePad"][w-gamepad] 1386633511.
- ["Xbox 360"][w-xbox-360] 1386323476; ["Xbox 360 technical specifications"][w-x360-spec] 1386323517;
  ["Xenos (graphics chip)"][w-xenos] 1310013980; ["Xenon (processor)"][w-xenon] 1384566304.

Wikipedia, minor home systems, hosts, and cancelled systems:

- ["Nuon (DVD technology)"][w-nuon] 1383941718; ["Xavix"][w-xavix] 1369487232; ["V.Smile"][w-v-smile] 1385799892;
  ["Sega Pico"][w-sega-pico] 1379636195; ["E-kara"][w-e-kara] 1386089717; ["DISCover"][w-discover] 1368493851;
  ["Game Wave Family Entertainment System"][w-gamewave] 1355021547; ["HyperScan"][w-hyperscan] 1369672075;
  ["V.Flash"][w-v-flash] 1386322900; ["Zeebo"][w-zeebo] 1384449469; ["EVO Smart Console"][w-evo] 1379482821;
  ["ClickStart"][w-clickstart] 1385502996; ["Indrema"][w-indrema] 1356610021;
  ["Phantom Entertainment"][w-phantom] 1384604844; ["Ouya"][w-ouya] 1386318623; ["OnLive"][w-onlive] 1386318547.

Wikipedia, handhelds:

- ["PlayStation Portable"][w-psp] 1386784394; ["PlayStation Portable hardware"][w-psp-hw] 1369000148;
  ["PlayStation Portable system software"][w-psp-sys] 1386316486; ["Universal Media Disc"][w-umd] 1384150684.
- ["PlayStation Vita"][w-vita] 1386319237; ["PlayStation Vita system software"][w-vita-sys] 1386315935;
  ["PlayStation TV"][w-pstv] 1383612262.
- ["Nintendo 3DS"][w-3ds] 1386371150; ["Nintendo 2DS"][w-2ds] 1386358545; ["New Nintendo 3DS"][w-new3ds] 1385688872;
  ["New Nintendo 2DS XL"][w-new2dsxl] 1385689193; ["Nintendo 3DS system software"][w-3ds-sys] 1384604386;
  ["PICA200"][w-pica200] 1358581711.
- ["GP32"][w-gp32] 1379015467; ["N-Gage"][w-n-gage] 1386180025; ["Tapwave Zodiac"][w-zodiac] 1372920485;
  ["Gizmondo"][w-gizmondo] 1386173978; ["Leapster"][w-leapster] 1385502801;
  ["Leapster Explorer"][w-leapster-x] 1368862108; ["LeapFrog Didj"][w-didj] 1381158352;
  ["LeapPad"][w-leappad] 1384908069; ["LeapPad Explorer"][w-leappad-x] 1360396543; ["GameKing"][w-gameking] 1353051015;
  ["Pixter"][w-pixter] 1379566018; ["Juice Box"][w-juice-box] 1381500242; ["Pocket Dream Console"][w-pdc] 1377687431;
  ["Mi2 (console)"][w-mi2] 1354286867.
- ["GP2X"][w-gp2x] 1385314903; ["GP2X Wiz"][w-gp2x-wiz] 1377361946; ["Caanoo"][w-caanoo] 1354286783;
  ["Dingoo"][w-dingoo] 1379337765; ["Pandora (computer)"][w-pandora] 1382382856;
  ["Game Gadget"][w-game-gadget] 1353062161; ["Neo Geo X"][w-neo-geo-x] 1377484786; ["GCW Zero"][w-gcw-zero] 1366037317;
  ["Nvidia Shield Portable"][w-shield] 1381277348; ["Xperia Play"][w-xperia-play] 1385402596; ["JXD"][w-jxd] 1359557491;
  ["XGP"][w-xgp] 1363167423; ["Red Jade"][w-red-jade] 1379733819; ["Jungle (console)"][w-jungle] 1384331938.
- [Japanese Wikipedia, "PIECE"][ja-piece], read as raw wikitext; revision 110504604.

Maker material:

- [Andrews and Baker, Microsoft, "Xbox 360 System Architecture", Hot Chips 17 (2005)][hc17], slide 5;
  the conference's archive copy.
- [Kutaragi, Sony, Hot Chips 11 keynote][hc11], slides 9 and 10; the conference's archive copy.
- [Microsoft Learn, "XAudio2 Error Codes"][xaudio2]; the page is dated 2018-05-31 and was updated 2021-03-22.
- [Nintendo of America, "Nintendo 3DS: Hardware specs"][n-3ds], Wayback Machine capture of 2011-10-16 18:10:20.
- [Nintendo of America, "Wii U: Tech specs"][n-wiiu], Wayback Machine capture of 2013-05-26 15:15:08.
- [Aquaplus, P/ECE product introduction][aquaplus], in Japanese; the page shows no version.

Hubs and references:

- Comstedt, ["Dreamcast Programming"][mc-dc] index and ["Hardware"][mc-hw]; last modified 2004-05-01 and 2016-08-07.
- [Sega Retro, "Sega Dreamcast/Technical specifications"][sr-dc] and [Sega Retro, "Advanced Pico Beena"][sr-beena],
  read as raw wikitext; revisions 1099046 and 1118364.
- [ps2tek][ps2tek]; repository commit `1c916606`.
- [Yet Another GameCube Documentation][yagcd], index and chapter 2; last modified 2006-12-23.
- [XboxDevWiki, "Main Page"][xdw-main], [XboxDevWiki, "MCPX"][xdw-mcpx], and [XboxDevWiki, "NV2A"][xdw-nv2a],
  read as raw wikitext; revisions 7423, 7417, and 6894.
- XboxDevWiki, "Boot Process", read as raw wikitext for its prose only; revision 7377.
  Its address, `xboxdevwiki.net/Boot_Process`, is not linked because the page holds bootloader listings.
- [WiiBrew, "Hardware"][wb-hw], [WiiBrew, "Hardware/Starlet"][wb-starlet], [WiiBrew, "Boot process"][wb-boot],
  and [WiiBrew, "Wii disc"][wb-disc], read as raw wikitext; revisions 123708, 118313, 121228, and 122714.
- [WiiUBrew, "Hardware"][wub-hw] and [WiiUBrew, "Boot process"][wub-boot], read as raw wikitext;
  revisions 4831 and 3135.
- [Free60, "Xenon (CPU)"][f60-xenon], [Free60, "Xenos (GPU)"][f60-xenos], [Free60, "Boot process"][f60-boot],
  [Free60, "Hypervisor"][f60-hv], and [Free60, "360 System Software"][f60-sys]; source repository commit `f3d099ff`.
- [Yet another PlayStationPortable Documentation][yapspd], index and chapters 2 and 3; last modified 2006-12-23.
- [vfpu-docs README][vfpu]; commit `f283bbb8`.
- [3dbrew, "Hardware"][3db-hw], read as raw wikitext; revision 23948, last edited 2026-10-31.
- R. Copetti, ["PlayStation Portable Architecture"][cop-psp], ["Nintendo 3DS Architecture"][cop-3ds],
  and ["PlayStation Vita Architecture"][cop-vita]
  (part 1); latest changelog entries 2026-02-03, 2025-08-08, and 2024-11-10.
- [PS2 Linux site, FAQ][ps2linux]; the page shows no version.
- [psdevwiki, Vita Developer wiki, "CPU"][a-psdev-cpu], Wayback Machine capture of 2026-03-10 09:17:44; revision 8687,
  last edited 2025-07-20.

Emulator documentation, prose only:

- [libretro documentation, "Flycast"][lr-flycast], [libretro documentation, "Dolphin"][lr-dolphin],
  and [libretro documentation, "LRPS2"][lr-lrps2]; each shows "Last update" 2026-10-22.
- [xemu documentation, "Required Files"][xemu]; the page shows no version.
- [Xenia README][xenia-readme], [Xenia, `docs/kernel.md`][xenia-kernel],
  and [Xenia, `src/xenia/apu/xma_decoder.h`][xenia-xma]; commit `95a5c3ee`.
- [PPSSPP README][ppsspp]; the quoted line confirmed at commit `77106069`.
- [Azahar README][azahar]; the cited sentence confirmed at commit `cf42aef2`.
- [Teakra README][teakra]; commit `3d697a18`.
- [Dolphin, "NAND Usage Guide"][dolphin-nand], Wayback Machine capture of 2026-10-23 00:17:25;
  the live page refuses scripts.
- [Cemu Wiki, "System RPL Files"][cemu-rpl], read as raw wikitext; revision 19854 of 2026-06-23.

Project documents:

- The [research roadmap][roadmap], "Hardware primers" and the family surveys.
- The [research guide][guide], "Claim status" and "Shape and links".
- [ADR 0001][adr1], on which sources may be read.
- The legal baseline, [R0-02][r002], "Anti-circumvention law in the United States"
  and "Questions no court was found to have decided".
- The source map, [R0-05][r005].
- The sixth-generation primer, [R1-03][r103], "Discs and what arrives as a plain image",
  for its citation of the Vita Development Wiki's "Security" page.
- The 8-bit and 16-bit catalogue, [R1-05][r105].
- The 32-bit and 64-bit catalogue, [R1-06][r106].
- The modern catalogue, [R1-08][r108].
- [Pull request #22][pr22], "docs: place systems of surveys that span several primers", "Decisions for you",
  merged to `main`.
- [Pull request #30][pr30], "docs: settle the roadmap dependencies the notes found", merged to `main` on 2026-11-21.
- The [source register][register].

[adr1]: ../../adr/0001-restrict-reading-by-licence-tier.md
[claims]: ../README.md#claim-status
[guide]: ../README.md
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[primers]: ../../roadmap/research.md#hardware-primers
[r002]: R0-02-legal-baseline.md
[r002-open]: R0-02-legal-baseline.md#questions-no-court-was-found-to-have-decided
[r002-us]: R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states
[r005]: R0-05-source-map.md
[r102]: R1-02-primer-32-and-64-bit.md
[r103]: R1-03-primer-sixth-generation.md
[r103-discs]: R1-03-primer-sixth-generation.md#discs-and-what-arrives-as-a-plain-image
[r104]: R1-04-primer-modern.md
[r105]: R1-05-catalogue-8-and-16-bit.md
[r106]: R1-06-catalogue-32-and-64-bit.md
[r108]: R1-08-catalogue-modern.md
[register]: ../../../.claude/hooks/source-register.txt
[roadmap]: ../../roadmap/research.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[pr22]: https://github.com/jsamuelsen11/rustalgia-emu/pull/22
[w-dc]: https://en.wikipedia.org/w/index.php?oldid=1386172458
[mc-hw]: http://mc.pp.se/dc/hw.html
[sr-dc]: https://segaretro.org/index.php?title=Sega_Dreamcast/Technical_specifications&oldid=1099046
[w-gd-rom]: https://en.wikipedia.org/w/index.php?oldid=1383605234
[lr-flycast]: https://docs.libretro.com/library/flycast/
[ps2tek]: https://psi-rockin.github.io/ps2tek/
[w-ps2]: https://en.wikipedia.org/w/index.php?oldid=1386205170
[w-ps2-spec]: https://en.wikipedia.org/w/index.php?oldid=1355643867
[hc11]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf
[w-ps2-models]: https://en.wikipedia.org/w/index.php?oldid=1386181656
[lr-lrps2]: https://docs.libretro.com/library/lrps2/
[w-gamecube]: https://en.wikipedia.org/w/index.php?oldid=1386636021
[yagcd]: http://hitmen.c02.at/files/yagcd/yagcd/index.html
[lr-dolphin]: https://docs.libretro.com/library/dolphin/
[w-xbox-spec]: https://en.wikipedia.org/w/index.php?oldid=1373212195
[xdw-nv2a]: https://xboxdevwiki.net/index.php?title=NV2A&oldid=6894
[w-xbox]: https://en.wikipedia.org/w/index.php?oldid=1386021612
[xemu]: https://xemu.app/docs/required-files/
[w-wii]: https://en.wikipedia.org/w/index.php?oldid=1386550313
[wb-hw]: https://wiibrew.org/w/index.php?title=Hardware&oldid=123708
[wb-starlet]: https://wiibrew.org/w/index.php?title=Hardware/Starlet&oldid=118313
[wb-boot]: https://wiibrew.org/w/index.php?title=Boot_process&oldid=121228
[wb-disc]: https://wiibrew.org/w/index.php?title=Wii_disc&oldid=122714
[w-wii-sys]: https://en.wikipedia.org/w/index.php?oldid=1386323257
[w-x360-spec]: https://en.wikipedia.org/w/index.php?oldid=1386323517
[f60-xenon]: https://free60.org/Hardware/Console/Xenon_(CPU)/
[f60-xenos]: https://free60.org/Hardware/Console/Xenos_(GPU)/
[w-xenos]: https://en.wikipedia.org/w/index.php?oldid=1310013980
[f60-boot]: https://free60.org/System-Software/Boot_Process/
[w-xenon]: https://en.wikipedia.org/w/index.php?oldid=1384566304
[f60-hv]: https://free60.org/Hypervisor/
[f60-sys]: https://free60.org/System-Software/360_System_Software/
[hc17]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf
[xaudio2]: https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-error-codes
[xenia-xma]: https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/src/xenia/apu/xma_decoder.h
[w-wii-u]: https://en.wikipedia.org/w/index.php?oldid=1386323270
[wub-hw]: https://wiiubrew.org/w/index.php?title=Hardware&oldid=4831
[n-wiiu]: http://web.archive.org/web/20130526151508/http://www.nintendo.com:80/wiiu/features/tech-specs/
[w-gamepad]: https://en.wikipedia.org/w/index.php?oldid=1386633511
[wub-boot]: https://wiiubrew.org/w/index.php?title=Boot_process&oldid=3135
[w-psx]: https://en.wikipedia.org/w/index.php?oldid=1371119147
[w-gbp]: https://en.wikipedia.org/w/index.php?oldid=1385936501
[w-sega-pico]: https://en.wikipedia.org/w/index.php?oldid=1379636195
[w-nuon]: https://en.wikipedia.org/w/index.php?oldid=1383941718
[w-xavix]: https://en.wikipedia.org/w/index.php?oldid=1369487232
[w-home-list]: https://en.wikipedia.org/w/index.php?oldid=1386685039
[w-v-smile]: https://en.wikipedia.org/w/index.php?oldid=1385799892
[sr-beena]: https://segaretro.org/index.php?title=Advanced_Pico_Beena&oldid=1118364
[w-v-flash]: https://en.wikipedia.org/w/index.php?oldid=1386322900
[w-hyperscan]: https://en.wikipedia.org/w/index.php?oldid=1369672075
[w-e-kara]: https://en.wikipedia.org/w/index.php?oldid=1386089717
[3db-hw]: https://www.3dbrew.org/w/index.php?title=Hardware&oldid=23948
[w-vita]: https://en.wikipedia.org/w/index.php?oldid=1386319237
[w-new3ds]: https://en.wikipedia.org/w/index.php?oldid=1385688872
[w-3ds]: https://en.wikipedia.org/w/index.php?oldid=1386371150
[w-psp]: https://en.wikipedia.org/w/index.php?oldid=1386784394
[w-psp-hw]: https://en.wikipedia.org/w/index.php?oldid=1369000148
[w-region-lock]: https://en.wikipedia.org/w/index.php?oldid=1384605268
[w-psp-sys]: https://en.wikipedia.org/w/index.php?oldid=1386316486
[w-vita-sys]: https://en.wikipedia.org/w/index.php?oldid=1386315935
[w-3ds-sys]: https://en.wikipedia.org/w/index.php?oldid=1384604386
[yapspd]: http://hitmen.c02.at/files/yapspd/
[cop-psp]: https://www.copetti.org/writings/consoles/playstation-portable/
[vfpu]: https://github.com/pspdev/vfpu-docs/blob/f283bbb8d2ed39b6fa3414bd9f62632143b63e06/README.md
[ppsspp]: https://github.com/hrydgard/ppsspp/blob/77106069bf68fd80d4a7a5a519ae9d06b5677c4b/README.md
[cop-vita]: https://www.copetti.org/writings/consoles/playstation-vita/
[w-pstv]: https://en.wikipedia.org/w/index.php?oldid=1383612262
[cop-3ds]: https://www.copetti.org/writings/consoles/nintendo-3ds/
[n-3ds]: http://web.archive.org/web/20111016181020/http://www.nintendo.com/3ds/hardware/specs
[w-pica200]: https://en.wikipedia.org/w/index.php?oldid=1358581711
[teakra]: https://github.com/wwylele/teakra/blob/3d697a18df504f4677b65129d9ab14c7c597e3eb/README.md
[azahar]: https://github.com/azahar-emu/azahar/blob/cf42aef23778d7e8bea6a468e12f53943dd87cd0/README.md
[ja-piece]: https://ja.wikipedia.org/w/index.php?oldid=110504604
[aquaplus]: https://aquaplus.jp/piece/intr.html
[w-failures]: https://en.wikipedia.org/w/index.php?oldid=1384334190
[w-gameking]: https://en.wikipedia.org/w/index.php?oldid=1353051015
[w-pixter]: https://en.wikipedia.org/w/index.php?oldid=1379566018
[w-mi2]: https://en.wikipedia.org/w/index.php?oldid=1354286867
[w-pdc]: https://en.wikipedia.org/w/index.php?oldid=1377687431
[w-leappad-x]: https://en.wikipedia.org/w/index.php?oldid=1360396543
[w-n-gage]: https://en.wikipedia.org/w/index.php?oldid=1386180025
[w-zodiac]: https://en.wikipedia.org/w/index.php?oldid=1372920485
[w-gen6]: https://en.wikipedia.org/w/index.php?oldid=1386505550
[w-gizmondo]: https://en.wikipedia.org/w/index.php?oldid=1386173978
[w-leapster]: https://en.wikipedia.org/w/index.php?oldid=1385502801
[w-leapster-x]: https://en.wikipedia.org/w/index.php?oldid=1368862108
[w-juice-box]: https://en.wikipedia.org/w/index.php?oldid=1381500242
[w-gp32]: https://en.wikipedia.org/w/index.php?oldid=1379015467
[w-discover]: https://en.wikipedia.org/w/index.php?oldid=1368493851
[w-evo]: https://en.wikipedia.org/w/index.php?oldid=1379482821
[w-onlive]: https://en.wikipedia.org/w/index.php?oldid=1386318547
[w-neo-geo-x]: https://en.wikipedia.org/w/index.php?oldid=1377484786
[w-game-gadget]: https://en.wikipedia.org/w/index.php?oldid=1353062161
[w-jxd]: https://en.wikipedia.org/w/index.php?oldid=1359557491
[xdw-main]: https://xboxdevwiki.net/index.php?title=Main_Page&oldid=7423
[dolphin-nand]: http://web.archive.org/web/20261023001725/https://dolphin-emu.org/docs/guides/nand-usage-guide/
[cemu-rpl]: https://wiki.cemu.info/index.php?title=System_RPL_Files&oldid=19854
[xenia-kernel]: https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md
[mc-dc]: http://mc.pp.se/dc/
[ps2linux]: http://ps2-linux.tensioncore.com/faq.html
[pr30]: https://github.com/jsamuelsen11/rustalgia-emu/pull/30
[w-gen7]: https://en.wikipedia.org/w/index.php?oldid=1386320369
[w-handheld-list]: https://en.wikipedia.org/w/index.php?oldid=1384273411
[w-template]: https://en.wikipedia.org/w/index.php?oldid=1386365370
[w-vmu]: https://en.wikipedia.org/w/index.php?oldid=1379027676
[w-xbox-sys]: https://en.wikipedia.org/w/index.php?oldid=1386323584
[w-xbox-360]: https://en.wikipedia.org/w/index.php?oldid=1386323476
[w-gamewave]: https://en.wikipedia.org/w/index.php?oldid=1355021547
[w-zeebo]: https://en.wikipedia.org/w/index.php?oldid=1384449469
[w-clickstart]: https://en.wikipedia.org/w/index.php?oldid=1385502996
[w-indrema]: https://en.wikipedia.org/w/index.php?oldid=1356610021
[w-phantom]: https://en.wikipedia.org/w/index.php?oldid=1384604844
[w-ouya]: https://en.wikipedia.org/w/index.php?oldid=1386318623
[w-umd]: https://en.wikipedia.org/w/index.php?oldid=1384150684
[w-2ds]: https://en.wikipedia.org/w/index.php?oldid=1386358545
[w-new2dsxl]: https://en.wikipedia.org/w/index.php?oldid=1385689193
[w-didj]: https://en.wikipedia.org/w/index.php?oldid=1381158352
[w-leappad]: https://en.wikipedia.org/w/index.php?oldid=1384908069
[w-gp2x]: https://en.wikipedia.org/w/index.php?oldid=1385314903
[w-gp2x-wiz]: https://en.wikipedia.org/w/index.php?oldid=1377361946
[w-caanoo]: https://en.wikipedia.org/w/index.php?oldid=1354286783
[w-dingoo]: https://en.wikipedia.org/w/index.php?oldid=1379337765
[w-pandora]: https://en.wikipedia.org/w/index.php?oldid=1382382856
[w-gcw-zero]: https://en.wikipedia.org/w/index.php?oldid=1366037317
[w-shield]: https://en.wikipedia.org/w/index.php?oldid=1381277348
[w-xperia-play]: https://en.wikipedia.org/w/index.php?oldid=1385402596
[w-xgp]: https://en.wikipedia.org/w/index.php?oldid=1363167423
[w-red-jade]: https://en.wikipedia.org/w/index.php?oldid=1379733819
[w-jungle]: https://en.wikipedia.org/w/index.php?oldid=1384331938
[xdw-mcpx]: https://xboxdevwiki.net/index.php?title=MCPX&oldid=7417
[xenia-readme]: https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/README.md
[a-psdev-cpu]: https://web.archive.org/web/20260310091744/https://www.psdevwiki.com/vita/CPU
