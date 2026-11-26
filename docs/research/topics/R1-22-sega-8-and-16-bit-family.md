---
title: "Sega Master System, Game Gear, and Genesis: family survey"
roadmap_item: R1-22
status: draft
date: 2026-11-26
---

# Sega Master System, Game Gear, and Genesis: family survey

## Summary

This note asks which emulators matter for Sega's 8-bit and 16-bit family, from the SG-1000 to the Genesis
(Mega Drive) with its Sega CD (Mega CD) and 32X, what legal exposure the family carries, and how hard it is to emulate.

Twenty-four projects are compared in one table.
The most used cores, [Genesis Plus GX][lr-gpgx]
(inference from the frontends that ship it)
and [PicoDrive][lr-pico] for the 32X, are non-commercial and so closed, yet they power the main frontends.
The respected projects are open tier: [BlastEm][blastem-site] and [jgenesis][jgenesis] run every add-on,
[Exodus][exodus] claimed in 2015 the only cycle-exact video core,
and [Gearsystem][gearsystem] publishes passing Z80 and video-chip test screens.

The legal exposure is low: the games are not encrypted (inference),
and the Sega CD is the only system for which every emulator that states a rule needs the user's BIOS.
No Sega takedown of an emulator was found,
but Sega would not bundle GPL software with its games and asked libretro to relicense
([Vice][vice]; secondary), a risk for a GPL-3.0 project.

For Rustalgia, the family is a good early target with open-tier references and hardware-checked tests,
though none for the Sega CD or 32X; named Genesis games need timing finer than a line, which answers [R1-01][r101-rec].
The note recommends studies of jgenesis, BlastEm, and Gearsystem, hardware-referenced oracles,
optional boot ROMs except the Sega CD's, with the 32X route left to [R2-12][phase2],
and catch-up exact to the bus cycle.

## Scope

- Question: which emulators are popular or respected for the SG-1000 and SC-3000, Mark III and Master System, Game Gear,
  Genesis with its models, Sega CD, 32X, and Pico, and for each, what are its status, licence, tier, techniques,
  and hosts; what legal exposure does the family carry; and how hard is it to emulate?
- Covered: every system in [R1-05][r105-3rd]'s Sega rows, with the [add-ons][r105-add] and [handhelds][r105-hand];
  the Saturn and Dreamcast belong to [R1-23][surveys]; System C, System 18, Mega-Tech,
  and Mega Play boards fall within [R1-25][r125]'s roadmap scope, though its note does not cover them yet.
  How the hardware works is in [R1-01][r101-mem] and, for the 32X's SH-2s, [R1-02][r102-pipe]; the law in [R0-02][r002];
  the hubs in [R0-05][r005-sega].
  This note cites those sections and does not repeat them.
- Researched on 2026-11-26 by three research agents, each on one slice, who read every quoted source as raw text;
  the writer fetched eight pages again to close gaps; one verification pass by fresh verifiers, then a fix pass,
  check each claim against its source (research log).
- Every emulator was read from prose and repository metadata only, whatever its tier.
  No emulator source file, issue, or pull request was opened, and no BIOS download, SMS Power BIOS page, game copy,
  or SMS Power attachment was opened; TASVideos's firmware page, which lists file names and hashes, was read.
- Markers follow the [research guide][guide].
  Wikipedia is tertiary and named wherever a fact rests on it.
  The Emulation General wiki pages ([Master System and Game Gear][egw-sms], [Genesis][egw-md]) are marked "(lead)";
  their raw text mentions no leak, and each is pinned to its own revision in Sources.
  A statement that nothing was found records a search, not proof of absence.
  Nothing here is legal advice.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, store installs, frontends), respect
  (tested accuracy claims, or use as a reference by other projects), or history (it shaped the family).
- Status is the archived flag, last push, and latest release from GitHub metadata, read on 2026-11-26.
  The guard blocked the releases of Genesis Plus GX, which is closed, and of [BizHawk][bizhawk], which is walled,
  so BizHawk's dates come from [TASVideos][tv-history] and Genesis Plus GX has no release recorded (research log).
- Each tier was checked against the [register][register] ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  No licence on an existing line changed: `ekeeke/Genesis-Plus-GX` keeps its non-commercial text,
  BizHawk its mixed licences, [ares][ares] ISC, [jgenesis][jgenesis] GPL-3.0, BlastEm "version 3
  or higher" ([README][blastem-readme]), and [Exodus][exodus] MIT.
  GPGX's licence file quotes the Nuked OPN2 notice with "or
  (at your option) any later version", a second copy at second hand, so the `nukeykt/nuked-opn2` line keeps its wording.
- Precedents applied: no licence means closed; a bare GPL-2.0 text is walled; a licence file beats a README;
  a replacement BIOS or boot code is closed inside any repository
  ([ADR 0006, "Closed tier"][adr6-closed]);
  closed repositories are named in code spans, not linked; closed freeware gets a line for its site only.
- Process calls settled for this survey:
  - Non-commercial licences are closed, so `ekeeke/Genesis-Plus-GX`, its two libretro forks,
    the three [PicoDrive][lr-pico] repositories, and OpenEmu's and Delta's wrappers of them are closed.
  - BizHawk stays walled; its Genplus-gx and PicoDrive32x cores are closed inside it
    (inference from its core table and those cores' licences; the paths were not read).
  - [ClownMDEmu][clown-core] is walled because ADR 0006 names AGPL-3.0 as walled,
    though the GNU list lets AGPL-3.0 code be combined with GPL-3.0 code (from memory); the ADR governs.
  - [Meka][meka] is walled, not closed: its site states a "BSD-like" licence, but no licence file was found at the root,
    a wiki lead calls it non-commercial, and it credits a third-party Z80 core.
  - The libretro [SMS Plus GX port][smsplus-lr] is walled: its README says "GPLv2 or later",
    its licence file is the bare GPL-2.0 text by the research pass
    (the fix pass could not reopen it), and it names a bundled core as "GPLv2 licensed", an unresolved mix.
  - The MAME-derived ROM decryption code
    that ares's licence file names is closed by the rule [R1-25][r125] applied to decryption code;
    its path is not known, so the written rule applies and ares otherwise stays open.
  - [Sega Retro][sr-gens] answers curl's default agent with the article page,
    though it shows a bot check to browser agents
    (tested locally with curl 7.81.0),
    so its live pages are cited; three captures a research agent read are not,
    because the research guide cites a capture only when the live page is gone (research log).
  - A Wikipedia article that mentions only leaks of a playtest, as "Nintendo Switch Online" does, is not closed,
    following [R1-24][r124]'s call; this note cites "Nintendo Classics" instead.
  - [SMS Power][sms-hb]'s homebrew pages are registered one page at a time,
    because its index also lists fan ports of commercial games, which were not opened.

### The emulators compared

Key: "8-bit" means the SG-1000 family, Master System, and Game Gear; MD the Genesis; CD the Sega CD;
"all" adds the 32X and Pico; "lr" a libretro core; a release is given where its metadata or site could be read,
else the last push.

| Project | Systems | Tier | Licence | Release or push | Firmware | Hosts |
|---|---|---|---|---|---|---|
| Genesis Plus GX | 8-bit, MD, CD, Pico | closed | non-commercial | push 2026-11-11 | CD dump only | GC, Wii, lr |
| BlastEm | all | open | GPL-3.0-or-later | 1.0.0, 2026-09-11 | not stated | Win, Mac, Lin, web, lr |
| jgenesis | all but Pico | open | GPL-3.0 | v0.15.1, 2026-11-23 | CD dump; 32X not stated | Win, Lin, web |
| ares | all but Pico | open | ISC | v148, 2026-05-30 | not stated | Win, Mac, Lin |
| Exodus | MD | open | MIT | 2.1, 2018-08-30 | not stated | Win |
| PicoDrive | all | closed | non-commercial | v2.05, 2025-05-31 | CD dump; no 32X file | lr, handhelds |
| Kega Fusion | all | closed | binary only | 3.64, 2010-03-07 | not stated | Win, Mac, Lin |
| Gens | MD, CD, 32X | none | GPL (from memory) | 2.14, 2006-05-20 | CD and 32X dumps | Win, DOS, Lin |
| `Gens/GS II` | MD | closed | none found | push 2019-12-28 | not read | not read |
| Regen | 8-bit, MD | closed | binary only | 0.972, 2009-10-25 | not stated | Win, Lin |
| ClownMDEmu | MD, CD | walled | AGPL-3.0-or-later | push 2026-11-09 | not stated | standalone, web, lr |
| Mednafen | SMS, GG, MD | walled | GPLv2 | 1.32.1, 2024-04-05 | CD setting | not read |
| BizHawk | all but Pico | walled | MIT own code; mixed | 2.11.1, 2026-05-01 | user dumps | Win, Lin |
| MD.emu | SMS, MD, CD | walled | GPL-3.0 file; core unread | Play, 2026-03-17 | CD dump | And |
| Gearsystem | 8-bit | open | GPL-3.0 | 3.9.26, 2026-11-20 | optional | Win, Mac, Lin, BSD, lr |
| Meka | 8-bit, SF-7000 | walled | "BSD-like" by site | 2025-08-17 | lead: altered BIOS | Win, Lin, Mac |
| Emulicious | SMS, GG | closed | binary, non-commercial | post 2026-03-19 | not stated | any Java host |
| MasterGear | 8-bit | closed | binary only | 4.9, 2021-03-31 | not stated | Win, Lin, And |
| SMS Plus GX (lr) | SMS, GG | walled | GPLv2 or later; mixed | push 2026-11-23 | optional | lr |
| Mesen 2, MesenCE | 8-bit | open | GPL-3.0-or-later | 2.2.1, 2026-06-05 | not stated | Win, Mac, Lin |
| Dega | SMS, GG | none | not found | 1.12, 2004-04-14 | not stated | Win, Lin, Xbox |
| Snepulator | 8-bit | open | MIT | push 2026-11-22 | not read | Lin |
| gears | GG | open | MIT | push 2026-10-09 | none | web |
| Cega | 8-bit | walled | MPL-2.0 (lead) | not read | not read | not read |

Sources by row: each project's README, licence file, site, store listing, or release metadata,
as its paragraph below cites; tiers from the [register][register]
or this note's new lines. "none" in the tier column means no repository was found to register.

### Accuracy-focused Genesis emulators

- BlastEm, by Michael Pavone, reached 1.0.0 on 11 September 2026 after 0.6.2 in 2019, with nightly builds between
  ([changelog][blastem-changes]; [announcement][blastem-ann]).
  Its 1.0.0 announcement says "my original goal for a 1.0 release was to support all the systems that Kega Fusion did,
  and that goal has largely been achieved", adding Sega CD and 32X, CD 32X titles, the Pico, and the Yamaha Copera,
  whose extra hardware the author says he reverse engineered ([announcement][blastem-ann]).
  Its site says it "was the first emulator to properly run Titan's impressive Overdrive 2 demo"
  ([BlastEm site][blastem-site]).
- Its x86 dynamic recompilers stay the default on x86 hosts; 1.0.0 adds 68000, Z80,
  and SH-2 cores generated from a domain-specific language, for now emitted
  as an interpreter in C ([announcement][blastem-ann]).
  It synchronises components on demand, which "can provide perfect synchronization for most components,
  but since the Z80 can steal cycles from the 68000 at unpredictable times 68000/Z80 synchronization is imperfect",
  with a default limit of 3420 master-clock cycles, one line ([README][blastem-readme]).
- The README gives master clocks of 53693175 Hz for NTSC and 53203395 Hz for PAL,
  and a 3390 Hz low-pass default "supposedly" present on some models ([README][blastem-readme]).
  The PAL figure differs from the 53.203424 MHz that [R1-01][r101-68k] and jgenesis use;
  twelve times the PAL colour subcarrier of 4.43361875 MHz gives 53.203425 MHz
  (calculated; the subcarrier value is from memory), so BlastEm's figure is about 30 Hz low.
- Its changelog records model selection for model-specific quirks, an optional YM2612 "ladder effect",
  emulation of YM2612 pan "leakage", cycle-exact multiply and divide, and fixes checked against Nemesis's video test ROM
  ([changelog][blastem-changes]; version boundaries approximate).
  It has a command-line debugger and the GDB remote protocol ([README][blastem-readme]).
  No BIOS file is named in its README, changelog, announcement, or [libretro page][lr-blastem] (searched).
- It runs on Linux, macOS, Windows, and, as an experiment, the web
  ([changelog][blastem-changes], 1.0.0), and through libretro ([libretro][lr-blastem]).
  Its announcement says "BlastEm today is made up of 100% artisanal AI-free code and I intend to keep it that way",
  the author's policy, not a licence term (inference).
- [jgenesis][jgenesis], in Rust, 418 stars, has made 39 releases since 2023-09-04 ([release metadata][jg-releases]).
  It covers the SVP, both Overdrive demos, the Master System's FM unit, and, from v0.14.0, the Genesis, Sega CD,
  and 32X together (README; release notes).
  Its notes record a region-matched Sega CD BIOS as required (v0.4.0),
  a pure-interpreter SH-2 with cache and basic memory timing (v0.8.0),
  a full pass of VDPFIFOTesting and fixes for most SMSVDPTest tests (v0.10.0),
  and fixes from the `testpico` ROM (v0.11.0), whose author and host were not found ([release notes][jg-releases]).
  No release note states a 32X BIOS rule (searched "BIOS", "boot", "firmware", "security").
- Its wiki page ["Tricky-to-Emulate Games"][jg-tricky], last edited 2026-08-04,
  is the family's best list of game-level difficulty; "How hard the family is to emulate" uses it.
  The roadmap already holds a study of jgenesis ([R1-62][studies]).
- [ares][ares], 1870 stars, is "an open-source multi-system emulator with a focus on accuracy and preservation",
  forked from higan on 25 March 2020 ([ares, "About"][ares-about]).
  It lists every system here but the Pico as supported, and the LaserActive's Mega LD as experimental.
  Its notes record a cached interpreter in place of the 32X recompiler (v122),
  an "accuracy" video core by default "at the expense of performance" (v123), Mode 1 (v124), Z80 bus fixes (v125),
  and the SC-3000 (v145) ([ares releases][ares-rel]).
  Its [compatibility lists][ares-compat] rate 1442 of 1449 Mega Drive, 389 of 407 Mega CD,
  and 63 of 67 32X entries completable, most of them marked "Unverified",
  which the site defines as expected but not played to completion.
  Its firmware rule was not found in prose (release notes searched for "bios" and "firmware").
- [Exodus][exodus], MIT since 23 January 2024, was released as 2.1 on 30 August 2018 and no later release was found
  ([Exodus, 2.1][exodus-21]; [MIT post][exodus-mit])
  and covers the Mega Drive; it needs the Visual C++ 2017 x64 runtime, so it runs on Windows (inference).
  Its 2.0 post says "Exodus is the only Mega Drive emulator that has a cycle-exact VDP core",
  and claims a YM2612 core written from the author's own reverse engineering of the chip in 2008
  ([Exodus 2.0][exodus-20]).
  A 2024 post says it checks bus requests between instructions, where most emulators check "at fixed points,
  usually thousands of cycles in length" ([Exodus, "Yet another blog"][exodus-blog]; read up to its first listing).
  Its author, Nemesis, wrote VDPFIFOTesting and the sprite overflow test, which BlastEm credits
  (inference that this is why it is respected).

### Genesis Plus GX and PicoDrive

- Genesis Plus GX, by Eke-Eke, 977 stars, pushed 2026-11-11, began from Charles MacDonald's Genesis Plus 1.2a
  (`ekeeke/Genesis-Plus-GX` README; libretro says 1.3).
  It claims "100% compatibility" with Genesis, Sega CD, Master System, Game Gear, and SG-1000 software,
  "including all unlicensed or pirate known dumps" (README),
  and libretro adds the Pico and says "Keep in mind that 32X games are not supported"
  ([libretro, "Genesis Plus GX"][lr-gpgx]).
- Its licence file begins with MacDonald's copyright of 1998 to 2003, Eke-Eke's of 2007 to 2026,
  and "Some portions copyright Nicola Salmoria and the MAME team",
  and its condition is "Redistributions may not be sold, nor may they be used in a commercial product or activity"
  (licence endpoint of the repository).
  Mednafen says its own Genesis code took from "Genesis Plus GX(old GPL-licensed version)"
  and replaced its "GPL-incompatible CPU and sound emulation cores"
  ([Mednafen, "Sega Genesis"][mdfn-md]),
  so an older GPGX was GPL-licensed in part; the date of the change was not found.
- Firmware, by libretro's table: the three regional Sega CD BIOSes are required for their regions' games,
  the Mega Drive boot ROM (the TMSS code, by inference), three Master System BIOSes,
  and the Game Gear BIOS are optional and load only when a core option for the system boot ROM is set,
  and lock-on cartridge images are optional ([libretro, "Genesis Plus GX"][lr-gpgx]).
  That page links SMS Power's closed BIOSes page and download links for a lock-on ROM, none followed.
- Its options pick Master System, Master System II, or Game Gear hardware, MAME's fast or Nuked's cycle-accurate YM2413,
  and an LCD ghosting filter for the Game Gear and Nomad (same page).
  It runs natively on the GameCube and Wii, and in RetroArch, BizHawk, and OpenEmu (README);
  its wiki is a repository folder, which the guard blocks, so its techniques were not read (research log).
  The forks `libretro/Genesis-Plus-GX` (98 stars) and `libretro/Genesis-Plus-GX-Wide` (29) carry the same terms.
- PicoDrive began as Dave's PicoDrive 0.30 for Pocket PC;
  notaz says "The Sega/Mega CD code is roughly based on Stéphane Dallongeville's Gens" and credits MAME's YM2612
  ([notaz, old PicoDrive page][pico-old]),
  and Sega Retro says its CD and 32X support used Gens code ([Sega Retro, "PicoDrive"][sr-pico]).
  Its licence file, the same in `notaz/picodrive`, `irixxxx/picodrive`, and `libretro/picodrive`,
  is MAME-style with the same no-sale clause, and libretro's licence table lists it as "MAME (Non-commercial)"
  ([libretro licences][lr-lic]).
- Most development is in irixxxx's fork, whose latest release is v2.05 of 2025-05-31;
  the README claims most of Sega's consumer hardware "up to and including the 32X", SH-2 recompilers for MIPS, Arm64,
  RISC-V, and PowerPC, and says "PicoDrive was the first software to properly emulate Virtua Racing and its SVP chip"
  (`irixxxx/picodrive` README; release metadata).
  notaz's page says it focuses on performance on Arm and is "mostly used as a libretro core" ([notaz][pico]);
  it used the Cyclone and DrZ80 assembly cores, and its SVP code is BSD-licensed ([notaz, SVP][pico-svp]).
- libretro lists only the three Sega CD BIOSes, as required, and no 32X file
  ([libretro, "PicoDrive"][lr-pico]),
  so PicoDrive runs the 32X without a user's 32X boot ROMs (inference); how is not known,
  because the guard blocked its platform readme, and that it carries its own boot code is from memory.
  If so, that code is closed as system software; the repository is closed anyway.
- Its libretro page names 32X games with faults, among them Brutal Unleashed and WWF Raw;
  its README links an `archive.org` item of 32X game versions, and its SVP page links Samsung DSP sample files;
  neither was opened, and both are closed below.

### Historical Genesis emulators

- Gens, by Stéphane Dallongeville, last released 2.14 on 2006-05-20,
  ran Sega CD and 32X games "if provided with the respective BIOS files",
  and was the first emulator with Sega CD save states ([Sega Retro, "Gens"][sr-gens]).
  It was used for tool-assisted speedruns, and the page lists forks, among them Gens Re-Recording, Gens/GS,
  and Gens KMod (same).
  No Gens repository was found; its GPL licence is from memory,
  though Mednafen's use of its YM2612 code in a module of "GPLed
  or GPL-compatible alternatives" implies a GPL-compatible licence ([Mednafen, "Sega Genesis"][mdfn-md]; inference).
  `GerbilSoft/gens-gs-ii`, last pushed 2019, shows no licence and so is closed (metadata).
- Kega Fusion, by Steve Snake, runs the SG-1000, SC-3000, SF-7000, Master System, Game Gear, Genesis, SVP, Pico,
  Sega CD, and 32X on Windows, macOS on Intel, and Linux; its site counts 1,292,934 downloads of the Windows 3.64 build
  ([Kega Fusion page][kega]).
  Sega Retro dates 3.64 to 2010-03-07, places it after KGen and Kega Lazarus, says it puts accuracy above speed,
  and recommends its "Perfect Sync" option for Mega CD games ([Sega Retro, "Kega Fusion"][sr-kega]).
  BlastEm's announcement says missing Sega CD
  and 32X support was a main reason people cite "for sticking to Kega Fusion" ([BlastEm 1.0.0][blastem-ann]).
- Regen, by AamirM, "an accuracy focused emulator", ran the Genesis, Master System, Game Gear, SC-3000, and SG-1000,
  with the Sega CD and 32X planned ([Regen page, 2019 capture][regen]); its last release was 0.972 of 2009-10-25,
  with Musashi and RAZE cores, the SVP, and a 68000 debugger ([Sega Retro, "Regen"][sr-regen]).
  The author's site is gone, so the capture is cited.

### Other Genesis emulators

- ClownMDEmu, by Clownacy, AGPL-3.0-or-later, has a core, a standalone frontend in SDL3 and Dear ImGui with a web build,
  and a libretro frontend ([core README][clown-core]; [frontend README][clown-fe]).
  Its rules say "No emulation components should be taken from other emulators or libraries",
  with its own 68000 and YM2612, and it calls itself "a more high-level emulator than accuracy-focussed alternatives",
  outputting video a line at a time ([core README][clown-core]).
  Its blog dates v1.6.12 to 17 September 2026 ([blog][clown-blog]; lead).
- Mednafen's Genesis module "should still be considered experimental", with 68000 timing bugs and an inaccurate YM2612,
  and "Sega 32X and Sega CD are not currently supported"; a CD BIOS setting exists,
  but its Sega CD emulation is "currently nonfunctional" ([Mednafen, "Sega Genesis"][mdfn-md]).
  Its Master System and Game Gear modules are "based off of SMS Plus" and "a low-priority system" for maintenance
  ([Mednafen, "Sega Master System"][mdfn-sms]; ["Game Gear"][mdfn-gg]).
- BizHawk, 2831 stars, lists "Genesis + 32X + CD" ([README][bizhawk]) and runs its Genesis titles through the Genplus-gx
  and PicoDrive32x cores; its notes add TMSS as an enhancement and wire GPGX in for the Master System, Game Gear,
  and SG-1000 in 2.10 ([TASVideos, release history][tv-history]).
  TASVideos lists three Mega CD BIOS images for it and says the files "are not distributed with BizHawk"
  ([TASVideos, "Firmwares"][tv-fw]).
  Its bespoke SMSHawk core is marked accuracy-focused and acceptable for TASVideos submissions ([README][bizhawk]).

### Master System, Game Gear, and SG-1000 emulators

- [Gearsystem][gearsystem], by Ignacio Sanchez, GPL-3.0, 401 stars, released 3.9.26 on 2026-11-20,
  its fifth release since 11 October (release metadata).
  It covers the Mark III, Master System, Game Gear, SG-1000, and Othello Multivision, the YM2413, many mappers,
  link cables, the Light Phaser and Paddle, rewind and run-ahead, a debugger, and an MCP server
  for AI debugging (README).
  "Gearsystem can run with or without a BIOS" (README),
  and libretro calls the BIOS files optional ([libretro][lr-gearsystem]); it runs on Windows, macOS, Linux, and BSD,
  and through libretro on phones and consoles (README).
- Its README shows screenshots of [ZEXALL][gs-zexall] with every visible line "OK"
  and of three pages of [VDPTEST][gs-vdp] on Gearsystem 3.9.0 with every line "Ok.", covering data, counters,
  interrupts, and sprites (observed); it states no result in words.
- [Meka][meka], by Omar Cornut, first released on 3 April 1999, 357 stars, released meka-20250817
  (README; release metadata).
  It adds the SF-7000 and the Mark III's FM unit,
  and calls itself among the most exhaustive Sega 8-bit emulators for obscure games and peripherals,
  with debugging and reverse-engineering tools (README).
  It credits Marat Fayzullin's Z80 core "with modifications" and Okazaki's EMU2413,
  which its 2025 release updated to use "the real YM2413 instrument ROM patches" (README; release notes).
  Its [site][meka-site] calls it "free software distributed under a BSD-like license";
  a wiki says it ships a version of the 1.3 BIOS altered to skip its check ([Emulation General][egw-sms]; lead).
- [Emulicious][emulicious], closed freeware for Java hosts,
  covers the Master System and Game Gear beside the Game Boy and MSX,
  and "aims for precision and accurate emulation" with a reverse-stepping debugger, profiler,
  and VS Code integration (site).
  Its [licence][emulicious-lic] grants binary use "for non-commercial purposes",
  and its [news][emulicious-news] of 2026-03-19 added SMS peripherals and earlier YM2413 test-mode work.
  ZEXALL-SMS v0.21 writes to its debug console, a sign of use by developers (inference).
- [MasterGear][mastergear], by Marat Fayzullin since 1996, is at 4.9 of 2021-03-31;
  its source "is not available to the general public"
  (same page), and it sells on Google Play for $4.99 with "10K+" downloads ([Google Play][mg-play]).
- SMS Plus, by Charles MacDonald, is the parent of SMS Plus GX and of Mednafen's 8-bit modules
  ([libretro, "SMS Plus GX"][lr-smsplus]; [Mednafen][mdfn-sms]);
  MacDonald's site no longer offers it ([MacDonald's pages][dreamjam]).
  `ekeeke/smsplus-gx` has no README or licence and is closed;
  the libretro port [smsplus-gx][smsplus-lr] updates its FM and Z80 cores and makes the BIOS optional.
  MacDonald's own terms for SMS Plus were not found in prose.
- Mesen 2's 2.1.0 added the Game Gear and Master System, "including support for the SG-1000 and ColecoVision"
  ([2.1.0 release notes][mesen2-210]);
  [MesenCE][mesence] continues the archived repository
  ([Mesen 2 README][mesen2]); the [Mesen site][mesen-site] shows 2.2.1.
  Its SMS firmware, test, and FM handling were not found in its documentation.
- Dega, by Dave, was the TASVideos emulator for Master System and Game Gear movies before BizHawk
  ([TASVideos, "Emulator resources"][tv-res]; ["MMV"][tv-mmv]);
  its last release, 1.12 of 2004-04-14, came with source, and it was ported to Linux and the Xbox
  ([Sega Retro, "Dega"][sr-dega]).
  No licence was found; `SteveMaddison/dega`, a Pandora port with no licence, is closed.
- Newer projects: [Snepulator][snepulator], MIT, for Linux, covers the SG-1000, Master System, Game Gear,
  and ColecoVision and bundles a JSON reader "For SST Tests"; [gears][gears], MIT,
  a Rust Game Gear emulator with a web build, says its Z80 "passes z80test
  (1.0 only), zexall, and FUSE tests" (READMEs).
  [Jolly Good Emulation][jgemu] lists Cega for the 8-bit systems; its README was blocked as unregistered,
  and its MPL-2.0 licence is a lead. libretro's [Emux SMS][lr-emux] requires the Master System BIOS.

### Frontends and phone apps

- libretro's licence table lists Genesis Plus GX and PicoDrive as non-commercial, beside ClownMDEmu, Gearsystem,
  and Emux SMS ([libretro licences][lr-lic]); BlastEm and SMS Plus GX have core pages but no row there
  ([BlastEm][lr-blastem]; [SMS Plus GX][lr-smsplus]);
  RetroArch's Android build has "5M+" installs ([Google Play][ra-play]) and it is on the App Store and Steam
  ([RetroArch platforms][ra-platforms]).
- Genesis Plus GX runs the Sega systems, and PicoDrive the 32X, in [OpenEmu][openemu]
  (observed in its data file),
  [Provenance][provenance], and [Delta][delta],
  whose 2.0 of 22 October 2026 made "Sega Genesis games are now playable in Delta"
  ([release notes][delta-notes])
  through `rileytestut/GPGXDeltaCore`, which has no licence;
  [Lemuroid][lemuroid] uses Genesis Plus GX alone and has "5M+" installs ([Google Play][lemuroid-play]).
- Provenance began as a Genesis emulator for iOS in 2016 and sells a "Provenance Plus ($3.99/mo)" subscription (README);
  its App Store listing is free with in-app purchases ([App Store][prov-app]).
- MD.emu, by Robert Broglia, sells for $4.99 with "100K+" installs and describes itself
  as "based on portions of Genesis Plus/Gens/Picodrive/Mednafen", with Sega CD in beta needing a regional BIOS
  ([Google Play][mdemu-play]); its site calls it "a highly modified fork of Genesis Plus" ([MD.emu page][mdemu-site]).
  It is part of the walled [emu-ex-plus-alpha][emu-ex] repository, whose MD.emu folder the guard blocked.

### Sega's own emulation

- Sega Genesis Classics, by Sega and D3T on Unity,
  ran from 2010 on Windows to a Steam hub of 28 April 2016 "supporting ROM hacks" through the Steam Workshop,
  and was delisted everywhere on 6 December 2024 ([Wikipedia, "Sega Genesis Classics"][wp-classics]; tertiary).
- The Genesis Mini of 2019 "includes 42 games made available through emulation software by M2",
  and the Mini 2 of 2022 adds Sega CD games and a choice of original Genesis or Genesis 2 sound;
  Sega had dropped AtGames, whose 2017 Flashback "was critically panned"
  ([Wikipedia, "Sega Genesis Mini"][wp-mini]; tertiary).
  M2 also made the Switch SEGA AGES series, including Mega Play and System C-2 versions
  ([Wikipedia, "Sega Ages"][wp-ages]; tertiary), boards within [R1-25][r125]'s scope that its note does not yet cover.
- Nintendo added the Genesis to Switch Online on 25 October 2021, its only third-party system,
  with 51 games by April 2025 ([Wikipedia, "Nintendo Classics"][wp-nc]; [Nintendo store][nso]);
  the emulator's developer was not found.
- None of these describes its emulator's internals, and no Sega firmware download was found.

### Legal exposure

This section builds on [R0-02][r002] and repeats none of it; it is not legal advice.

- Encryption: no source read describes encryption of this family's games,
  so [R0-02 option 1][r002-o1] applies (inference).
  The 32X has a "security program at the expected location in ROM"
  ([jgenesis v0.10.0][jg-releases]),
  checked by its boot code (inference),
  and the Sega CD's disc security code is still undescribed by any registered source
  ([R1-01, "Boot ROMs and firmware"][r101-boot]).
- Firmware: the SG-1000, SC-3000, Mark III, and first Game Gear have no BIOS,
  while export Master Systems and later Game Gears check the header ([R1-01][r101-boot]; [R1-05][r105-3rd]).
  Every emulator here that states a rule, except Emux SMS, makes those BIOSes and the Genesis's TMSS code optional;
  Genesis Plus GX, PicoDrive, jgenesis, MD.emu, BizHawk, and Gens require a user's Sega CD BIOS.
  That is [R0-02 option 4][r002-o4] for the Sega CD only, under ["Firmware and back-up copies"][r002-fw].
- The 32X splits projects: Gens needed the user's 32X BIOS, PicoDrive lists none, and the others state no rule.
  A boot replacement would be [option 5][r002-o5]; no project documents one in prose read, and Meka's altered BIOS,
  if it exists, would be a copy of Sega's firmware inside a repository (lead).
- Dumping: TASVideos says users can dump the BIOS "if you know how"
  ([TASVideos, "Firmwares"][tv-fw]),
  and the 240p suite's devlog says flash carts "can now dump the BIOS"
  ([240p 1.23 post][240p-123]); no guide was opened, and [option 7][r002-o7] applies.
- Boot notices: the TMSS message and Sega v Accolade are in [R0-02, "Boot logos"][r002-logos]
  and ["Emulator cases and boot logos"][r002-tm]; later Game Gears show a licence notice too ([R1-01][r101-lock]).
  Genesis Plus GX runs no boot ROM unless the user sets it, so by default it draws no Sega message (inference),
  [option 16][r002-o16].
- Enforcement: no Sega notice, suit, or letter against an emulator was found
  (searches of press and of the file names of [GitHub's DMCA repository][dmca]; its one Sega notice, of 2019,
  concerns the source of a mobile game ([notice][dmca-sega]));
  R0-02's ["Takedown and enforcement history"][r002-td] has no Sega row.
- One dispute on record is libretro's 2014 post that Hyperkin's Retron 5 used Genesis Plus GX,
  "licensed under a non-commercial license.
  It can therefore not be sold as, or part of, a commercial product", and that "None of the authors were contacted"
  ([libretro, "Retron5"][retron]); no outcome was found.
- Licence risks, recorded as findings: paid apps carry the non-commercial cores,
  MD.emu at $4.99 and Provenance beside a subscription,
  and whether that is a "commercial product or activity" was not tested (inference);
  PicoDrive's CD code is based on GPL Gens under a non-commercial licence
  (from memory for Gens's licence);
  and Genesis Plus GX moved from a partly GPL version to its current terms ([Mednafen][mdfn-md]).
- Maker statements: in 2017 libretro said Sega had approached it about using RetroArch for Sega Forever,
  but "demanded we relicense our program to something that would strip us of all our rights",
  and Sega's marketing chief said "we can't bundle GPL software with Sega proprietary games,
  because we lose certain rights within the games" ([Vice][vice], relaying a Eurogamer interview; secondary).
  This is a maker's statement on using a GPL emulator, an addition to [R0-02's makers' statements][r002-makers];
  recorded as a risk, it means Sega would not bundle a GPL-3.0 Rustalgia, and it is the second dispute on record.
  Sega Europe said in 2016 that the Steam Workshop let it allow ROM hacks with "a little bit of control on what's going
  on" ([MCV/DEVELOP][mcv]; secondary).
- Marks and imagery: Plutiedev tells homebrew makers "Don't use Sega branding!"
  while allowing a statement of compatibility
  ([Plutiedev, "Commercial homebrew guidelines"][pl-guide]; lead);
  [options 14 and 15][r002-o14] and Sega's streaming guideline ([R0-02][r002-img]) apply.

### How hard the family is to emulate

- The hardware is in [R1-01][r101-mem]'s Sega sections: shared buses with bus requests, video DMA,
  the video chip's legacy modes, the YM2612 and YM2413, and interrupt timing.
  The SH-2 pipeline and caches are in [R1-02][r102-cache].
- jgenesis's list names games that need specific behaviour ([jgenesis, "Tricky-to-Emulate Games"][jg-tricky]):
  - Genesis: Gargoyles relies on TAS never writing to memory,
    and "does not work on the Model 3 Genesis actual hardware because that model does allow TAS to lock the bus";
    Earthworm Jim on the YM2612's busy flag, which differs from the YM3438's; Clue and Sol-Deace on video FIFO timing;
    The Legend of Galahad on the 68000's stall during DMA; Fatal Rewind on interrupt order;
    Pac-Man 2 on a one-cycle 68000 delay on each Z80-side access; Virtua Racing on the SVP.
  - Sega CD: Silpheed is "Extremely sensitive to timing accuracy between the two 68000s due to sloppy code around word
    RAM handoffs"; Time Gal on drive read delay.
  - 32X: BC Racers needs "semi-accurate emulation of SH-2 CPU cache and SH-2 memory access timing";
    Brutal Unleashed close synchronisation of the two SH-2s at the communication ports;
    WWF Raw and Pitfall the write-through cache; Virtua Fighter undocumented SH7604 division-unit mirrors; X-Men:
    Mind Games its saturation.
- So named games need timing finer than a line: FIFO slots, DMA stalls, and the per-access 68000 delay
  (inference from the list),
  which answers [R1-01's recommendation][r101-rec] that the Genesis use per-line timing until a title needs more.
  The Titan Overdrive demos test the same areas (inference):
  BlastEm's site says it was the first to run Overdrive 2 properly,
  and its 0.4.0 removed the remaining "YOUR EMULATOR SUX" text from Overdrive by adjusting the 68000's DMA block
  ([changelog][blastem-changes]).
- Projects choose different granularity: Exodus checks bus requests between instructions; BlastEm syncs on demand,
  with a forced full sync at least once a line; PicoDrive puts speed first with recompilers;
  and Kega offers "Perfect Sync" (sources above).
  The prose read does not describe the scheduling of ares or ClownMDEmu.
- Revisions matter: TAS writes back on the Model 3 VA2; VSRAM grew from 40 to 64 words from Model 2 VA4;
  YM2612 status bits and stereo outputs differ by model; AtGames clones lack SSG-EG;
  and the Nomad has a faster I/O pull-up that breaks Decap Attack ([Plutiedev, "Hardware issues"][pl-issues]; lead).
  BlastEm and the Mini 2 offer model choices (above).
- Zero-length video DMA, which [R1-01][r101-open] left open, is still unsettled by a test.
  Sega Retro says a 68000-to-VRAM length of 0 transfers 65,536 words because the VDP decrements before checking,
  while CRAM and VSRAM copies stop at their ends
  ([Sega Retro, "DMA"][sr-dma], revision 700745, which cites no source),
  Plutiedev agrees and says old Sonic hacks broke on emulators that skipped it
  ([Plutiedev][pl-issues]; lead),
  and Sega Retro's comparison table marks Exodus, Kega Fusion, Gens/GS, Gens/GS II,
  and MESS as handling it and does not mark Genesis Plus GX
  ([Sega Retro, "Comparison of Sega Mega Drive emulators"][sr-compare], revision 959203, which cites no source).
- The Sega CD's word RAM is handed between its two 68000s, and it boots from cartridge (Mode 1) or disc (Mode 2)
  ([MegaDrive Wiki, "Mega CD"][mdw-mcd]);
  the 32X's video hardware is a double frame buffer, so its SH-2s do all drawing ([MegaDrive Wiki, "32X"][mdw-32x]).
  Only seven projects here run the 32X, which marks it as the family's hardest part (inference).

### Tests and published results

| Test | Systems | Oracle | Tier | Published results |
|---|---|---|---|---|
| [68k BCD verifier][bcd] | Genesis 68000 | Model 1 and Model 3 VA2 consoles | open | six pass, about twenty fail |
| VDPFIFOTesting | Genesis video | hardware; some tests flaky on it | walled host | Exodus 121 of 122; jgenesis full |
| [Sprite overflow test][sr-sprite] | Genesis video | not stated | files closed | screenshots only |
| [240p Test Suite][240p] | Genesis, Sega CD, 32X port | hardware, display tests | open | none as pass or fail |
| [ZEXALL-SMS][zexall-sms] | Z80 in Sega systems | real SMS, Mark III, Genesis 2 | walled | Gearsystem (screens) |
| [SMSVDPTest][vdptest] | SMS video | not stated | page open; ROM unread | Gearsystem; jgenesis fixes |
| [SingleStepTests m68000][sst-68k] | 68000 | MAME's microcoded core | open | none found |
| [z80test][z80test] | Z80 | a real Spectrum | open | gears (1.0 only); gears also cites zexall |

- The BCD verifier tests every input of the three packed BCD instructions against data from a Model 1,
  and lists BlastEm, BizHawk, Exodus, Genesis Plus GX, higan, and Mednafen as passing, and Gens and its derivatives,
  Genesis Plus, Kega Fusion, PicoDrive, and Regen among those failing ([README][bcd]; undated).
- VDPFIFOTesting's author says "a couple of the tests fail intermittently on the real hardware",
  that Exodus scored 121 of 122, and that "Most other Mega Drive emulators will only score around 20 or so" in 2015
  ([Exodus 2.0][exodus-20]); jgenesis "now fully passes" it ([v0.10.0][jg-releases]).
  It is served from `nemesis.exodusemulator.com`, not opened, whose licence was not read.
- Nemesis's sprite test page has an empty hardware-results section ([Sega Retro][sr-sprite]).
- ZEXALL-SMS's maintainer ran it "on a real SMS and noted the results",
  and v0.20 says all tests should pass on the "normal" Z80s in Sega systems,
  after finding unstable flag patterns on a Mark III and a Genesis 2
  ([zexall-sms README][zexall-sms]; [SMS Power][zexall-page]).
  Its licence file is the bare GPL-2.0 text, so it is walled; running its build is observation.
- The 240p suite has Genesis and Sega CD builds at 1.32
  ([1.32 post][240p-132]),
  with Sega CD RAM and BIOS identification tests and a controller test "tested on Model 1 and Model 2 systems";
  for PAL it relied in part on MiSTer, an FPGA core ([1.23 post][240p-123]).
  A user reports running its Sega CD RAM tests on two consoles
  (comment on the same post; lead), but no published pass list was found.
  A 32X port, `Dasutin/32X240pTestSuite`, GPL-2.0 by search metadata, was not read.
- SMS Power's technical list names more SMS tests by MacDonald, FluBBa, Enri, and others,
  whose oracles and licences were not read ([SMS Power, technical homebrew][sms-hb]).
- No hardware-referenced test with published results was found for the Sega CD, the 32X, or the YM2612 and SN76489
  (GitHub repository searches for "test rom mega drive", "32x test", and "mega cd test"; the pages above);
  the 1.23 post names MDFourier, an audio-comparison tool, whose prose was not read.
  No published SingleStepTests result for a Genesis emulator was found.

## Options and trade-offs

The options answer four separate questions, and the recommendation takes one answer to each.

### Which emulators the roadmap studies

- **What:** keep [R1-62][studies] for [jgenesis][jgenesis], and add studies of [BlastEm][blastem-site],
  [Gearsystem][gearsystem], [Exodus][exodus], or none; [ares][ares] ([R1-60][studies])
  and [BizHawk][bizhawk] ([R1-64][studies]) are already on the roadmap.
- **Costs:** each study is a session's work; Exodus needs Windows (inference) and has had no release since 2018;
  BlastEm's code is under Mercurial at its own host, which refuses CI runners (link checker configuration).
- **Gains:** all four are open tier; jgenesis is Rust and covers every add-on;
  BlastEm syncs on demand and was the first to run Overdrive 2 properly,
  and 1.0.0 added cores generated from a domain-specific language; Gearsystem has published passing 8-bit tests;
  Exodus claimed in 2015 the only cycle-exact video core.
- **Used by:** the roadmap's practice of one study per leading open emulator.

### Which oracles the family's cores are tested against

- **What:** hardware-referenced programs
  (the [BCD verifier][bcd], [ZEXALL-SMS][zexall-sms], VDPFIFOTesting, [z80test][z80test], the [240p suite][240p]);
  emulator-generated vectors ([SingleStepTests][sst-68k]); game lists ([ares][ares-compat]);
  or new tests run on consoles.
- **Costs:** the hardware programs cover few areas, VDPFIFOTesting is flaky on hardware by its author's account,
  ZEXALL-SMS is walled, and the Sega CD and 32X have no tests with published results;
  new tests need consoles and flash carts.
- **Gains:** the BCD verifier and ZEXALL-SMS name the consoles that were run, and published results give baselines;
  vectors give coverage; game lists catch regressions.
- **Used by:** Gearsystem (ZEXALL, VDPTEST); jgenesis (VDPFIFOTesting, testpico); BlastEm (Nemesis's and flamewing's).

### How firmware and boot notices are handled

- **What:** require no boot ROM for the SG-1000 to Genesis and start from post-boot state;
  accept the user's BIOS and TMSS images as an option; require the user's Sega CD BIOS;
  and for the 32X require dumps or write a boot replacement.
- **Costs:** running an export Master System or later Game Gear without its BIOS leaves the state that BIOS sets,
  which no hardware test read confirms, though the Mark III and SG-1000 have no BIOS ([R1-01][r101-boot]);
  a 32X replacement must be written from open prose and is untested by any project read.
- **Gains:** nearly all software runs without firmware, as Genesis Plus GX and Gearsystem show;
  no Sega notice is drawn unless the user supplies TMSS; the Sega CD route matches every emulator that states a rule.
- **Used by:** Genesis Plus GX, Gearsystem, BizHawk, and jgenesis (optional or user dumps); PicoDrive (no 32X file).

### Which timing granularity the Genesis needs

- **What:** per line with catch-up, R1-01's default; sync on demand with a forced full sync each line (BlastEm);
  bus requests checked at each instruction (Exodus); or catch-up exact to the bus cycle of each interaction,
  as [R1-01][r101-rec] proposes for other systems.
- **Costs:** per line misses FIFO-timed games and DMA stalls (inference);
  per-instruction checks still delay bus requests; exact catch-up needs per-access timestamps across the 68000, Z80,
  video chip, and, for the 32X, two SH-2s.
- **Gains:** per line is fast; exact catch-up meets jgenesis's list
  and the Overdrive demos without lockstep cost (inference).
- **Used by:** BlastEm (on demand); Exodus (per instruction); Kega Fusion ("Perfect Sync", undescribed).

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** keep jgenesis's study, R1-62, as the family's main study, and add BlastEm and Gearsystem,
  read directly as open-tier sources; read Exodus's prose when video timing is designed in [R2-04][phase2].
- **Oracles:** adopt the BCD verifier, ZEXALL-SMS run as a binary, z80test,
  and VDPFIFOTesting within its author's caveat as acceptance tests, run as binaries, which ADR 0006 allows,
  though the host's licence is unread; SingleStepTests as a development check; ares's lists as regression aids;
  and plan Sega CD and 32X tests with [R2-15][phase2].
- **Firmware:** no boot ROM required for the SG-1000, SC-3000, Mark III, first Game Gear, and Genesis,
  with the user's images optional; for export Master Systems and later Game Gears,
  start from post-boot state only once a hardware test confirms it, as [R1-01][r101-rec] asks,
  and run the user's BIOS until then; the user's Sega CD BIOS required; the 32X route decided with [R2-12][phase2];
  no Sega notice drawn by default.
- **Timing:** catch-up exact to the bus cycle for the Genesis and its add-ons,
  replacing per line in R1-01's recommendation for this family, because named games fail at coarser units.

## Implications for Rustalgia

- If the owner accepts the timing recommendation, [R2-03][phase2] places synchronisation points at each interaction
  (shared-bus access, port, or handoff)
  between the 68000, Z80, and video chip, and between the Sega CD's two 68000s and the 32X's two SH-2s,
  because jgenesis's list names games that need them.
- [R2-01][phase2] can compare [BlastEm][blastem-site]'s generated cores with [jgenesis][jgenesis]'s interpreters
  and [PicoDrive][lr-pico]'s SH-2 recompilers, read from prose only for PicoDrive, which is closed.
- [R2-12][phase2] must decide the 32X boot route and, with R2-15,
  confirm the post-boot state of export Master Systems and later Game Gears,
  the two firmware questions this family leaves.
- [R2-15][phase2] should adopt the hardware-referenced tests above and fill the Sega CD and 32X gap with new tests.
- Rustalgia must never ship or adapt Genesis Plus GX or PicoDrive code, though nearly every frontend carries them,
  and [R0-03][r003]'s store plan should note that the family's popular cores forbid commercial use.
- Revisions should be selectable per model, at least for TAS, the YM2612 against the YM3438, VSRAM size
  (a lead),
  and the low-pass filter (which BlastEm says is "supposedly" present), as [R1-01's recommendation][r101-rec] proposes.

## Open questions

- Does a Genesis video DMA of length zero transfer 65,536 words on hardware?
  A test ROM run on a console that DMAs a zero length into VRAM, CRAM, and VSRAM and reads them back; [R2-15][phase2].
- What state does an export Master System or later Game Gear leave after its BIOS runs?
  A test ROM booted through the BIOS on each model that dumps the registers and memory it reads; [R2-15][phase2].
- How do [PicoDrive][lr-pico] and [Kega Fusion][kega] start the 32X without a user's boot ROM?
  Whether they do can be observed by running the libretro PicoDrive core on homebrew 32X software with no BIOS,
  as [ADR 0006][adr6] allows for closed programs
  (not run in this survey); how they do it is in closed code, so only that run and the prose answer it.
- Does Meka's repository ship altered Sega firmware?
  A reader session's file listing of `ocornut/meka`, once its walled line merges, would show the path to close.

## Sources

Every source below was read on 2026-11-26, as raw text, unless an entry says otherwise.
Repository READMEs are read at their default branch on that date; Wikipedia and Sega Retro links name the revision read.
Closed addresses are in code spans, with the reason.

Repository documents:

- [ADR 0006][adr6]; [research guide][guide]; [research roadmap][roadmap]; [source register][register].
- [R0-02, legal baseline][r002]; [R0-03, licence strategy][r003];
  [R0-05, "Sega, arcade, Xbox, and other systems"][r005-sega]; [R1-01, primer][r101-mem]; [R1-02, primer][r102-pipe];
  [R1-05, catalogue][r105-4th]; [R1-24][r124]; [R1-25][r125].

Genesis emulators, prose only:

- BlastEm: [site][blastem-site]; [1.0.0 announcement][blastem-ann], 2026-09-11; [changelog][blastem-changes];
  [README at tip][blastem-readme], last change 2026-11-25; [libretro/blastem][blastem-lr], metadata.
- [jgenesis README][jgenesis]; [releases][jg-releases], v0.15.1; ["Tricky-to-Emulate Games"][jg-tricky],
  last edited 2026-08-04.
- [ares README][ares]; [site][ares-site], v148; ["About"][ares-about]; [releases][ares-rel];
  [compatibility lists][ares-compat], v148.
- Exodus: [README][exodus]; ["Exodus 2.0 released"][exodus-20], 2015-04-30; ["Exodus 2.1"][exodus-21], 2018-08-30;
  ["Now MIT licensed"][exodus-mit], 2024-01-23; ["Yet another blog"][exodus-blog], 2024-01-26, read to its listing.
- `github.com/ekeeke/Genesis-Plus-GX`, `github.com/libretro/Genesis-Plus-GX`,
  and `github.com/libretro/Genesis-Plus-GX-Wide`: README, licence endpoint, and metadata; not linked, non-commercial.
- `github.com/notaz/picodrive`, `github.com/irixxxx/picodrive`, `github.com/libretro/picodrive`,
  and `github.com/OpenEmu/picodrive`: README, licence file, and metadata; not linked, non-commercial.
- PicoDrive pages by notaz: [project page][pico]; [old page][pico-old]; [SVP][pico-svp].
- [Kega Fusion page][kega], 2014-06-20; Sega Retro: ["Kega Fusion"][sr-kega], revision 1173364; ["Gens"][sr-gens],
  revision 402822; ["Regen"][sr-regen], revision 579123; ["PicoDrive"][sr-pico], revision 661895.
- [Regen page][regen], capture of 2019-12-21 16:22:51, the live site being gone.
- `github.com/GerbilSoft/gens-gs-ii`, metadata; not linked, no licence.
- ClownMDEmu: [core README][clown-core]; [frontend README][clown-fe]; [blog tag page][clown-blog] (lead).
- Mednafen: [home page][mdfn], 1.32.1; ["Sega Genesis"][mdfn-md], ["Sega Master System"][mdfn-sms],
  and ["Game Gear"][mdfn-gg], last updated 2024-03-19.
- [BizHawk README][bizhawk]; TASVideos: [release history][tv-history], last edited 2026-05-31; ["Firmwares"][tv-fw],
  last edited 2025-09-10; ["Emulator resources"][tv-res]; ["MMV"][tv-mmv].

8-bit emulators, prose only:

- [Gearsystem README][gearsystem], 3.9.26; screenshots [ZEXALL][gs-zexall] and [VDPTEST][gs-vdp] (observed);
  [libretro, "Gearsystem"][lr-gearsystem], last updated 2026-11-03.
- [Meka README][meka], meka-20250817; [Meka site][meka-site].
- Emulicious: [site][emulicious]; [licence][emulicious-lic]; [news][emulicious-news].
- [MasterGear][mastergear]; [MasterGear on Google Play][mg-play], updated 2026-08-27.
- [libretro, "SMS Plus GX"][lr-smsplus], last updated 2026-10-22; [libretro/smsplus-gx README][smsplus-lr];
  `github.com/ekeeke/smsplus-gx`, metadata, not linked, no licence; [MacDonald's pages][dreamjam], index.
- [Mesen 2 README][mesen2], 2.1.1; [Mesen 2 2.1.0 release notes][mesen2-210]; [MesenCE][mesence], 2.2.1;
  [Mesen site][mesen-site].
- Sega Retro, ["Dega"][sr-dega], revision 402747; `github.com/SteveMaddison/dega`, metadata, not linked, no licence;
  `sourceforge.net/projects/dega` returned 403 (research log).
- [Snepulator README][snepulator]; [gears README][gears]; [Jolly Good Emulation][jgemu];
  [libretro, "Emux SMS"][lr-emux], last updated 2026-10-22; [libretro/emux][emux], metadata.
- Emulation General wiki: ["Master System/Game Gear emulators"][egw-sms], revision 152451,
  and ["Sega Genesis emulators"][egw-md], revision 151260 (lead).

Frontends and apps:

- libretro documentation: ["Genesis Plus GX"][lr-gpgx], ["PicoDrive"][lr-pico], ["BlastEm"][lr-blastem],
  and ["ClownMDEmu"][lr-clown], last updated 2026-10-22; [licences table][lr-lic], last updated 2026-11-23.
  The Genesis Plus GX page links SMS Power's BIOSes page and lock-on ROM downloads, not followed.
- [RetroArch platforms][ra-platforms]; [RetroArch on Google Play][ra-play]; [OpenEmu][openemu], 2.4.1,
  and its data file; `github.com/OpenEmu/GenesisPlus-Core`, metadata, not linked.
- [Delta README][delta]; [Delta release notes][delta-notes], 2.0.2; `github.com/rileytestut/GPGXDeltaCore`, metadata,
  not linked.
- [Provenance README][provenance]; [Provenance on the App Store][prov-app]; [Lemuroid README][lemuroid];
  [Lemuroid on Google Play][lemuroid-play]; [MD.emu on Google Play][mdemu-play]; [MD.emu page][mdemu-site];
  [emu-ex-plus-alpha][emu-ex], metadata.

Sega and press:

- Wikipedia: ["Sega Genesis Classics"][wp-classics], revision 1368867530; ["Sega Genesis Mini"][wp-mini],
  revision 1378865000; ["Sega Ages"][wp-ages], revision 1336991267; ["Nintendo Classics"][wp-nc], revision 1387538380.
- [Nintendo store, "SEGA Genesis – Nintendo Switch Online"][nso].
- [libretro, "RetroArch, Libretro core license violations by Hyperkin's Retron5"][retron], 2014-09-19.
- [Vice, "Sega Forever's shoddy ports"][vice], 2017-06-28; [MCV/DEVELOP, Sega Europe on modding][mcv], 2016-06-03.
- [GitHub DMCA repository][dmca], file names; [2019-10-21 Sega notice][dmca-sega].
- [Plutiedev, "Hardware issues"][pl-issues]; [Plutiedev, "Commercial homebrew guidelines"][pl-guide].

Hardware references and tests:

- Sega Retro: ["Sega Mega Drive/DMA"][sr-dma], revision 700745; ["Comparison of Sega Mega Drive emulators"][sr-compare],
  revision 959203; ["Sprite Masking and Overflow Test ROM"][sr-sprite], revision 792957.
- MegaDrive Wiki: ["Mega CD"][mdw-mcd], revision 688; ["32X"][mdw-32x], revision 539.
- [68k BCD verifier README][bcd]; [240p Test Suite][240p]; 240p devlog:
  ["240p Test Suite for Genesis/Mega Drive and Sega/Mega CD 1.23"][240p-123], 2022-01-22; [the 1.32 post][240p-132].
- [ZEXALL-SMS on SMS Power][zexall-page]; [zexall-sms README][zexall-sms]; [SMSVDPTest on SMS Power][vdptest];
  [SMS Power, technical homebrew][sms-hb]; [SingleStepTests m68000][sst-68k]; [z80test][z80test].
- `nemesis.exodusemulator.com`, not opened: hosts test ROMs whose licence was not read.

Not opened, and closed in the register:

- `www.smspower.org/maxim/Documents/YM2413ApplicationManual`: a maker's manual hosted by others, cited by jgenesis.
- `archive.org/details/doom-32x-all-versions`: linked by PicoDrive's README; by its name, copies of a game.
- `notaz.gp2x.de/misc/sdsp_ari_fixed.zip` and its two siblings: Samsung DSP samples hosted by others.
- `www.smspower.org/meka/gamepack.zip`: an unlabelled zip on Meka's home page that may hold games.

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r002-makers]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-logos]: R0-02-legal-baseline.md#boot-logos
[r002-tm]: R0-02-legal-baseline.md#emulator-cases-and-boot-logos
[r002-td]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r002-img]: R0-02-legal-baseline.md#imagery-and-makers-guidelines
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r003]: R0-03-licence-strategy.md
[r005-sega]: R0-05-source-map.md#sega-arcade-xbox-and-other-systems
[r101-mem]: R1-01-primer-8-and-16-bit.md#sega-memory
[r101-68k]: R1-01-primer-8-and-16-bit.md#the-68000
[r101-boot]: R1-01-primer-8-and-16-bit.md#boot-roms-and-firmware
[r101-lock]: R1-01-primer-8-and-16-bit.md#lock-out
[r101-rec]: R1-01-primer-8-and-16-bit.md#recommendation
[r101-open]: R1-01-primer-8-and-16-bit.md#open-questions
[r102-pipe]: R1-02-primer-32-and-64-bit.md#pipelines-and-delay-slots
[r102-cache]: R1-02-primer-32-and-64-bit.md#caches-and-segments
[r105-3rd]: R1-05-catalogue-8-and-16-bit.md#third-generation-home-consoles
[r105-4th]: R1-05-catalogue-8-and-16-bit.md#fourth-generation-home-consoles
[r105-add]: R1-05-catalogue-8-and-16-bit.md#add-ons-that-act-as-systems
[r105-hand]: R1-05-catalogue-8-and-16-bit.md#handhelds
[r124]: R1-24-xbox-family.md
[r125]: R1-25-arcade-family.md
[blastem-site]: https://www.retrodev.com/blastem/
[blastem-ann]: https://www.retrodev.com/blastem/announce_1.0.0.html
[blastem-changes]: https://www.retrodev.com/blastem/changes.html
[blastem-readme]: https://www.retrodev.com/repos/blastem/raw-file/tip/README
[blastem-lr]: https://github.com/libretro/blastem
[jgenesis]: https://github.com/jsgroth/jgenesis
[jg-releases]: https://github.com/jsgroth/jgenesis/releases
[jg-tricky]: https://github.com/jsgroth/jgenesis/wiki/Tricky%E2%80%90to%E2%80%90Emulate-Games
[ares]: https://github.com/ares-emulator/ares
[ares-site]: https://ares-emu.net/
[ares-about]: https://ares-emu.net/about
[ares-rel]: https://github.com/ares-emulator/ares/releases
[ares-compat]: https://ares-emu.net/compatibility
[exodus]: https://github.com/RogerSanders/Exodus
[exodus-20]: https://www.exodusemulator.com/about/news/29-exodus-2-0-released-project-now-open-source
[exodus-21]: https://www.exodusemulator.com/about/news/37-exodus-2-1-release
[exodus-mit]: https://www.exodusemulator.com/about/news/39-return-to-active-development-now-mit-licensed
[exodus-blog]: https://www.exodusemulator.com/about/news/40-yet-another-blog
[pico]: https://notaz.gp2x.de/pico.php
[pico-old]: https://notaz.gp2x.de/pico_old.php
[pico-svp]: https://notaz.gp2x.de/svp.php
[kega]: https://www.carpeludum.com/kega-fusion/
[sr-kega]: https://segaretro.org/Kega_Fusion
[sr-gens]: https://segaretro.org/Gens
[sr-regen]: https://segaretro.org/Regen
[sr-pico]: https://segaretro.org/PicoDrive
[sr-dega]: https://segaretro.org/Dega
[regen]: https://web.archive.org/web/20191221162251/http://aamirm.hacking-cult.org/www/regen.html
[clown-core]: https://github.com/Clownacy/clownmdemu-core
[clown-fe]: https://github.com/Clownacy/clownmdemu-frontend
[clown-blog]: https://clownacy.wordpress.com/tag/clownmdemu/
[mdfn]: https://mednafen.github.io/
[mdfn-md]: https://mednafen.github.io/documentation/md.html
[mdfn-sms]: https://mednafen.github.io/documentation/sms.html
[mdfn-gg]: https://mednafen.github.io/documentation/gg.html
[bizhawk]: https://github.com/TASEmulators/BizHawk
[tv-history]: https://tasvideos.org/Bizhawk/ReleaseHistory
[tv-fw]: https://tasvideos.org/Bizhawk/Firmwares
[tv-res]: https://tasvideos.org/EmulatorResources
[tv-mmv]: https://tasvideos.org/EmulatorResources/MMV
[gearsystem]: https://github.com/drhelius/Gearsystem
[gs-zexall]: http://www.geardome.com/files/gearsystem/zexall.png
[gs-vdp]: http://www.geardome.com/files/gearsystem/vdptest10.png
[lr-gearsystem]: https://docs.libretro.com/library/gearsystem/
[meka]: https://github.com/ocornut/meka
[meka-site]: https://www.smspower.org/meka/
[emulicious]: https://emulicious.net/
[emulicious-lic]: https://emulicious.net/License.txt
[emulicious-news]: https://emulicious.net/news/
[mastergear]: http://fms.komkon.org/MG/
[mg-play]: https://play.google.com/store/apps/details?id=com.fms.mg
[lr-smsplus]: https://docs.libretro.com/library/smsplus/
[smsplus-lr]: https://github.com/libretro/smsplus-gx
[dreamjam]: http://dreamjam.co.uk/emuviews/
[mesen2]: https://github.com/SourMesen/Mesen2
[mesen2-210]: https://github.com/SourMesen/Mesen2/releases/tag/2.1.0
[mesence]: https://github.com/nesdev-org/MesenCE
[mesen-site]: https://www.mesen.ca/
[snepulator]: https://github.com/JoppyFurr/Snepulator
[gears]: https://github.com/anisse/gears
[jgemu]: https://jgemu.gitlab.io/
[lr-emux]: https://docs.libretro.com/library/emux_sms/
[emux]: https://github.com/libretro/emux
[egw-sms]: https://emulation.gametechwiki.com/index.php/Master_System/Game_Gear_emulators
[egw-md]: https://emulation.gametechwiki.com/index.php/Sega_Genesis_emulators
[lr-gpgx]: https://docs.libretro.com/library/genesis_plus_gx/
[lr-pico]: https://docs.libretro.com/library/picodrive/
[lr-blastem]: https://docs.libretro.com/library/blastem/
[lr-clown]: https://docs.libretro.com/library/clownmdemu/
[lr-lic]: https://docs.libretro.com/development/licenses/
[ra-platforms]: https://www.retroarch.com/?page=platforms
[ra-play]: https://play.google.com/store/apps/details?id=com.retroarch
[openemu]: https://openemu.org/
[delta]: https://github.com/rileytestut/Delta
[delta-notes]: https://faq.deltaemulator.com/release-notes
[provenance]: https://github.com/Provenance-Emu/Provenance
[prov-app]: https://apps.apple.com/us/app/provenance-app/id1596862805
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[lemuroid-play]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[mdemu-play]: https://play.google.com/store/apps/details?id=com.explusalpha.MdEmu
[mdemu-site]: https://www.explusalpha.com/contents/md-emu
[emu-ex]: https://github.com/Rakashazi/emu-ex-plus-alpha
[wp-classics]: https://en.wikipedia.org/w/index.php?oldid=1368867530
[wp-mini]: https://en.wikipedia.org/w/index.php?oldid=1378865000
[wp-ages]: https://en.wikipedia.org/w/index.php?oldid=1336991267
[wp-nc]: https://en.wikipedia.org/w/index.php?oldid=1387538380
[nso]: https://www.nintendo.com/us/store/products/sega-genesis-nintendo-switch-online-switch/
[retron]: https://www.libretro.com/index.php/retroarch-license-violations/
[vice]: https://www.vice.com/en/article/sega-forevers-shoddy-ports-leave-sega-on-the-defensive-about-emulation/
[mcv]: https://www.mcvuk.com/business-news/publishing/modding-can-reenergise-retro-gaming-says-sega-europe/
[dmca]: https://github.com/github/dmca
[dmca-sega]: https://github.com/github/dmca/blob/master/2019/10/2019-10-21-sega.md
[pl-issues]: https://plutiedev.com/hardware-issues
[pl-guide]: https://plutiedev.com/guidelines
[sr-dma]: https://segaretro.org/Sega_Mega_Drive/DMA
[sr-compare]: https://segaretro.org/Comparison_of_Sega_Mega_Drive_emulators
[sr-sprite]: https://segaretro.org/Sprite_Masking_and_Overflow_Test_ROM
[mdw-mcd]: https://md.railgun.works/index.php?title=Mega_CD
[mdw-32x]: https://md.railgun.works/index.php?title=32X
[bcd]: https://github.com/flamewing/68k-bcd-verifier
[240p]: https://github.com/ArtemioUrbina/240pTestSuite
[240p-123]:
  https://artemiourbina.itch.io/240p-test-suite/devlog/337805/240p-test-suite-for-genesismega-drive-and-segamega-cd-123
[240p-132]:
https://artemiourbina.itch.io/240p-test-suite/devlog/1478648/new-versions-of-the-240p-test-suite-for-wii-gc-snes-genesis-and-sega-cd
[zexall-page]: https://www.smspower.org/Homebrew/ZEXALL-SMS
[zexall-sms]: https://github.com/maxim-zhao/zexall-sms
[vdptest]: https://www.smspower.org/Homebrew/SMSVDPTest-SMS
[sms-hb]: https://www.smspower.org/Homebrew/Index?q=$:Type=Technical
[sst-68k]: https://github.com/SingleStepTests/m68000
[z80test]: https://github.com/raxoft/z80test
