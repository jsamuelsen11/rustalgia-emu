---
title: "Arcade hardware: family survey"
roadmap_item: R1-25
status: draft
date: 2026-11-25
---

# Arcade hardware: family survey

## Summary

This note asks which emulators matter for arcade hardware of every era, what each one does,
what legal exposure the family carries, and how hard it is to emulate.

[MAME][mame-gh] is the reference for almost every board, and it is walled:
its licence texts still disagree on "or later", so its code is open to Rustalgia only through a reader session.
The best-known alternative, FinalBurn Neo, is closed by its non-commercial licence,
as are every libretro core built on MAME before 2016 and every historical dedicated emulator found.
The open-tier projects are narrower; among them are [Supermodel][supermodel] for Sega's Model 3,
the FPGA cores of [jtcores][jtcores], [Dolphin][dolphin] for the Triforce, PCSX2 forks for PS2-based boards,
[OpenParrot][openparrot] for PC-based boards, and [Hypseus Singe][hypseus] for laserdisc games.

Legal exposure centres on encrypted programs and on the sets users must find.
Many boards decrypt their code with keys kept alive by a battery, and MAME and FinalBurn Neo decrypt them,
with key data in their sources or in the sets they ask for (from memory).
No suit against MAME or FinalBurn Neo was found, and the one notice to MAME found,
a cease and desist by Wikipedia's account, removed two games at their current rights holder's request;
the other actions found concern a commercial licence, PC-board game pages, and counterfeit cabinets.

For Rustalgia, the family is the widest in the roadmap, with over a thousand boards and their custom chips,
and no published table of any emulator's results against a hardware test suite was found.
The note recommends taking up unencrypted 2D boards that share chips with consoles first, the Neo Geo MVS above all,
accepting only user-supplied sets with no decryption keys, studying MAME through a reader session,
and treating PC-based boards as out of scope for emulation.

## Scope

- Question: which emulators are popular or respected for arcade hardware, and for each, what are its status, licence,
  tier, techniques, and hosts; what legal exposure does the family carry; and how hard is it to emulate?
- Covered: discrete-logic and early microprocessor boards, the 8-bit and 16-bit boards, the 3D boards,
  boards built on consoles and PCs, and laserdisc games.
  No catalogue lists arcade boards, so "The boards this note covers" sets them out briefly by era and maker.
  The shared chips are in the primers
  ([R1-01][r101], [R1-02][r102], [R1-03][r103], [R1-04][r104]),
  the console emulators behind Triforce and System 246 in [R1-17][r117] and [R1-19][r119],
  the PS3 behind System 357 in [R1-21][r121], which has no arcade content, and the law in [R0-02][r002].
- Researched on 2026-11-25 by three research agents, one each for MAME and FinalBurn Neo, the other board emulators,
  and law and difficulty, who read every source as raw text and quoted only from it;
  the writer checked gaps with further fetches, one pass of fresh verifiers checked each claim against its source,
  and a fix pass applied their findings (research log).
- Every emulator was read from its prose and repository metadata only, whatever its tier.
  No emulator source file, issue, pull request, DAT file, ROM set list, key or key table, BIOS, game, CHD,
  or dumping guide was opened, and no site offering ROMs, BIOS sets, or keys was followed.
  Two closed sites were opened in error before the register closed them, and are recorded here as breaches:
  ElSemi's `nebula.emulatronia.com`, read in three captures
  (2012, 2022, and 2026),
  whose 2012 front page says it links decryption tables; and a 2013 capture of `www.kawaks.org`,
  which invites visitors to download ROMs.
  No key data or ROM was seen, nothing was followed, and the copies were deleted (research log).
- Markers follow the [research guide][guide].
  Claims that rest on Wikipedia or on press are marked "secondary", and Wikipedia is named wherever a fact rests on it.
  Pages of the [Emulation General wiki][egw], a lead in the [register][register],
  were checked for "leak" before use and are marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, installs, stores, frontends), respect
  (use as a reference, or accuracy backed by hardware), or history.
  Status is the archived flag and last push from GitHub metadata read on 2026-11-25
  (some show 2026-11-26 in UTC),
  the latest release from the releases endpoint,
  and releases from the project's own site where the guard blocked that endpoint.
- Each tier was checked against the [register][register]
  ([ADR 0006, "Evaluating a new source"][adr6-eval]),
  in the arcade part of the source map ([R0-05][r005-arc]) and the lines of earlier surveys.
  No existing line's tier or licence changed.
  MAME's home page now says only "GNU General Public License, 2 (GPL-2.0)",
  a fourth wording beside the three that the register's line records, so the line stands as walled
  ([MAME home page][mame-home]).
  FinalBurn Neo's licence endpoint still returns LICENSE.md, a pointer to the full text, which the guard blocks;
  it stays closed on the register's earlier reading (observed).
  [Flycast][flycast], [Dolphin][dolphin], [Play!][play], [PCSX2][pcsx2], [PCEE2][pcee2], [jtcores][jtcores],
  [SiliconRE][siliconre], and [RPCS3][rpcs3] are unchanged (licence metadata).
  One existing line no longer fits every case: `mister-devel/`, walled per core, covers Arcade-Cave,
  whose GPL-3.0 licence makes it open; the guard applies the walled prefix line, so its code stays walled in practice.
- Process calls settled here (ADR 0006 tests; precedents of earlier surveys):
  - Every MAME derivative from before release 0.172 carries MAME's old non-commercial terms and is closed,
    as is any core whose repository has no licence file (MAME 2000, 2010, 2015, FB Alpha 2012).
  - Current MAME and its forks are walled.
    The libretro MAME 2016 core's licence file says "or later",
    but it defers to file headers and comes from a walled upstream, so it is walled too.
  - Every replacement BIOS or boot code is closed wherever it sits: the Universe BIOS that MAME offers as a choice,
    Flycast's high-level BIOS, and `ps2homebrew-arcade/proverb`, an "alternative bootloader"
    for arcade PS2 boards (metadata).
    Their paths are unknown, so the written rule applies inside open repositories.
  - Decryption code and key data are closed inside any repository, since keys are never obtained, used, or stored
    ([ADR 0006, "Context"][adr6-context]);
    this extends ADR 0006's closed test, which names firmware and system software but not decryption routines.
  - Freeware with no source (Nebula, Kawaks, ElSemi's emulators, Demul) is closed and gets no repository line;
    sites that link decryption tables, invite ROM downloads, or download game files are closed,
    and other closed emulators' sites are open.
  - Loaders for PC-based boards count as emulators of the board's I/O, though they run the game's own code.
  - Addresses with "?" cannot be matched by the guard; the register closes their path forms instead.

### The boards this note covers

No catalogue in this repository lists arcade boards;
[R1-05][r105] to [R1-07][r107] name only the MVS and boards built from consoles, and leave them here.
This table sets out the boards named in the evidence by era, with its source in the third column.

| Era | Boards | Source | Main emulators |
|---|---|---|---|
| Discrete logic, 1970s | TTL boards | [Arcade video game][w-arcade] | MAME (from memory) |
| Early microprocessor | Gun Fight (1975), vector boards | [Arcade video game][w-arcade] | MAME |
| 8-bit and 16-bit | Namco, Konami, Taito, CPS-1 to CPS-3, System 16 and 32, MVS | the emulators' prose | MAME, FBNeo |
| Console-derived | ST-V, CoJag, Aleck64, Konami M2 | [R1-06][r106] | MAME |
| 3D, custom | Model 1, 2, 3; Namco System 22, 23 | [Sega][w-sega], [Namco][w-namco] | Supermodel, MAME |
| 3D, console-derived | NAOMI, Atomiswave, Hikaru, Triforce, Chihiro | [Sega][w-sega] | Flycast, Demul, Dolphin |
| PS2- and PS3-based | Namco System 246, 256; 357 (from memory) | [Namco][w-namco] | PCSX2x6, RPCS3 |
| PC | Type X; Lindbergh, RingEdge, Nu, ALLS; N2, ES1 | [Taito][w-typex], [Sega][w-sega], [Namco][w-namco] | loaders |
| Laserdisc | Dragon's Lair and others | ["Interactive film"][w-film] | Hypseus Singe |

- Sega's list gives Model 1 the System 32's NEC V60 with a custom graphics board; Model 2, developed with GE Aerospace,
  Compu-Scene 3D graphics and an Intel i960; and Model 3 a PowerPC,
  "Released in multiple 'steps' with improving specifications"
  (Wikipedia, ["List of Sega arcade system boards"][w-sega]; secondary).
  It calls Hikaru a "Custom modified version of NAOMI hardware" and Chihiro "Based on Xbox architecture" (same);
  no Chihiro emulator was surveyed here; Chihiro belongs with the Xbox in [R1-24][roadmap].
- Namco's list gives System 22 a 68020, two TMS32025 DSPs at 49.152 MHz "although the exact number of DSPs may vary",
  and Namco's TR3 renderer; System 23 an IDT R4650 with PowerVR chips; and System 246 a PS2 base with a security dongle
  (Wikipedia, ["List of Namco arcade system boards"][w-namco]; secondary).
  System 357 is absent from that list; that it is PS3-based is from memory.
- The Atomiswave is Sammy's board "based on Sega's Dreamcast console", with interchangeable cartridges
  (Wikipedia, ["Atomiswave"][w-atomi]; secondary).
- NAOMI shares the Dreamcast's architecture, copies a GD-ROM to DIMM RAM at boot, and can join 3 or 4 boards;
  Lindbergh runs a version of MontaVista Linux, Nu Windows Embedded 8, and ALLS Windows 10 IoT
  ([Sega list][w-sega]; secondary).
  Taito's Type X runs "Windows XP Embedded" (Wikipedia, ["Taito Type X"][w-typex]; secondary).

### The emulators compared

Key: "push" is the last push; "sets" means the user supplies MAME-format ROM and BIOS sets; Win, Mac, Lin, And,
iOS name hosts, "PC" means Windows, macOS, and Linux, and "Pi" the Raspberry Pi; "lr" is a libretro core;
"AW" is the Atomiswave.

| Emulator | Tier | Licence | Status | Boards | Firmware | Hosts |
|---|---|---|---|---|---|---|
| [MAME][mame-gh] | walled | GPL-2.0, texts disagree | 0.289, 2026-07-31 | nearly all | sets; UniBIOS choice | Win; lr |
| MAME 2000 to 2015 cores | closed | old MAME non-commercial | frozen snapshots | as their MAME | sets | lr |
| [HBMAME][hbmame] | walled | GPL-2.0, no "or later" | active | homebrew, hacks | sets | Win |
| [MAMEUI][mameui], [GroovyMAME][groovymame] | walled | GPL-2.0, no "or later" | active | as MAME | sets | Win |
| [MAME4droid][mame4droid] | walled | GPL-2.0 | v1.41.2, 2026-09-16, on 0.289 | as MAME | sets | And |
| [MAME4iOS][mame4ios] | walled | GPL-2.0 | 2022.5, 2022-12-12; sets of 0.238 | as MAME | sets | iOS, tvOS, Mac |
| FinalBurn Neo | closed | non-commercial | nightly; push 2026-11-26 | 2D boards, consoles | sets | Win, Mac, SDL, lr |
| Nebula, Kawaks | closed | freeware | 2.25b; 1.65 (lead) | CPS-1, CPS-2, Neo Geo | sets and tables | Win |
| Model 2 and CPS3 emulators | closed | none | 1.1a, 2014; 1.0a, 2007 (lead) | Model 2; CPS-3 | sets | Win |
| Raine | closed | none found | push 2026-11-11 | Taito and others (from memory) | not stated | not stated |
| [Supermodel][supermodel] | open | GPL-3.0 | v0.4 build, 2026-11-25 | Model 3; Model 1, 2 | sets | PC |
| [Demul][demul-site] | closed | none | 0.7 WIP, 2018-04-28 | NAOMI, Hikaru, others | BIOS sets | Win |
| [Flycast][flycast] | walled | bare GPL-2.0 | v2.7, 2026-08-14 | NAOMI, AW | sets; HLE | PC, And, Xbox, Switch, lr |
| [Dolphin][dolphin] | open | GPL-2.0-or-later | 2609b, 2026-11-07 | Triforce | Segaboot optional | PC, And |
| [PCSX2x6][pcsx2x6] | open | GPL-3.0 | v0.2.20, 2026-07-25 | System 246, 256 | BIOS and dongle | not stated |
| [PCEE2][pcee2] | open | GPL-3.0-or-later | push 2026-11-25 | System 246, 256 | BIOS and dongle | lr |
| [PCSX2 Reliquary][reliquary] | open | GPL-3.0 | v1.10.0, 2026-10-16 | Python 1, 2 | BIOS; user keys | not stated |
| [TeknoParrot][tekno] | closed | proprietary, paid | active | PC and others | game files | Win, Lin, And |
| [OpenParrot][openparrot] | open | GPL-3.0 | push 2026-09-11 | PC boards | game files | not stated |
| Lindbergh Loader | closed | non-commercial | v2.1.4, 2026-02-24 | Lindbergh | game files | Lin |
| [Hypseus Singe][hypseus] | open | GPL-3.0-or-later | v3.0.2, 2026-08-30 | laserdisc | ROMs, video | PC, Pi |
| [jtcores][jtcores] | open | GPL-3.0 | push 2026-11-25 | 1250+ titles | sets | MiSTer, Pocket |

Sources by row: each project's README, licence file, site, or Flathub entry, as cited in its paragraph below.

### MAME

- [MAME][mame-gh] has 10,752 stars and 2,675 forks, and was pushed on 2026-11-26 (metadata).
  Its latest release is 0.289 of 31 July 2026, after 0.288 of 29 May 2026
  ([MAME, release page][mame-rel]; [home page][mame-home]);
  the "what's new" files for 0.290 to 0.292 return HTTP 404 (observed).
- It began with "MAME 0.1 released" on 5 February 1997 ([MAME, history][mame-hist]).
  The history page dates FD1094 decryption to release 0.88 (2004), "CPS2 decryption fully implemented" to 0.112 (2007),
  CPS-3 decryption to 0.116u2 (2007), its recompiler engine to 0.126, and the MESS merger to 0.162 (2015).
- Its stated aim is documentation: "The source code to MAME serves as this documentation"
  ([MAME docs, "What is MAME"][mame-what]).
  Wikipedia calls the approach "incremental", says bootlegs are often emulated first,
  and that protection microcontrollers are emulated, citing the decapped one of Bubble Bobble
  ([Wikipedia, "MAME"][w-mame]; secondary).
- Licence: COPYING grants "version 2, as provided in docs/legal/GPL-2.0",
  while the [legal page][mame-legal] gives "version 2 or later" from release 0.172
  and the [documentation][mame-lic] "GPL-2.0+", with "over 90% including core files" under the 3-Clause BSD licence.
  COPYING dedicates the software lists of the hash directory to the public domain under CC0;
  the guard walls every non-prose path, so they stay unread (research log).
- Scheduling is by timeslice: a CPU that defers a bus access "eats all the remaining cycles of the timeslice"
  and retries after the next global synchronisation event ([MAME docs, "CPU devices"][mame-cpu]).
  That finer interleave can be requested per driver is from memory.
- MAME has a recompiler framework: a front end
  and recompiler specific to the emulated device emit an intermediate language,
  which back ends independent of that device, but possibly "specific to the host system", translate
  ([MAME docs, "UML architecture"][mame-uml]).
  Recompiling cores run by default and can be turned off or forced onto a portable C back end
  ([MAME docs, command line][mame-cli]);
  libretro says it has native back ends for x86 and, "since 0.274", arm64 ([libretro arcade guide][lr-arcade]).
  Which processors it recompiles is from memory (MIPS III, PowerPC, SH-2, SH-4, among others).
- It requires sets: parent and clone sets, BIOS sets "such as the Neo-Geo arcade hardware",
  device sets for chips such as "the Namco 51xx custom I/O chip", and CHDs for "hard disks, CD-ROMs, DVDs,
  and LaserDiscs"; "MAME will change sets as needed to keep things as accurate as possible"
  ([MAME docs, "About ROMs and Sets"][mame-sets]).
  A BIOS is chosen with an option whose documented example selects the third-party Universe BIOS
  ([MAME docs, command line][mame-cli]),
  and the FAQ records a new Universe BIOS version added between 0.171 and 0.172 ([MAME FAQ][mame-faq]).
- Where its key data lives is not stated in any prose read.
  That its source holds key tables for many schemes, and that some sets carry dumped key files, is from memory;
  Rustalgia records only that MAME decrypts these boards and asks for sets.
- It has an interactive debugger ([MAME docs, debugger][mame-dbg]), and its command line offers a GDB stub, Lua scripts,
  and the bgfx renderer with its screen chains ([MAME docs, command line][mame-cli]); user bugs go to MAME Testers
  ([MAME docs, contributing][mame-contrib]).
  Official binaries are for Windows on x64 and Arm64; other systems build it from the source packages
  ([MAME, release page][mame-rel]).

### MAME's libretro cores and forks

- libretro's MAME snapshots need sets from 0.37b5, 0.78, 0.139, 0.160, 0.174, or the latest
  ([libretro arcade guide][lr-arcade]).
  Those before 0.172 are closed: MAME 2003-Plus is "licensed under the classic MAME Non-Commercial license"
  (its licence file),
  and libretro's [licence table][lr-lic] gives non-commercial or MAME terms for MAME 2000, 2010, and FB Alpha 2012,
  which have no licence file (observed).
  MAME 2015 has no row there and no licence file (HTTP 404); it is closed as a snapshot from before 0.172.
- MAME 2003-Plus "prioritizes 1) usability and frontend integration, 2) performance, and 3) compatibility"
  ([libretro, MAME 2003-Plus][lr-m2003p]);
  the arcade guide calls MAME 2000 "the fastest arcade core" and "the most inaccurate"
  ([libretro arcade guide][lr-arcade]),
  and [its own page][lr-m2000] "the fastest of the libretro cores" with "the worst accuracy and compatibility".
- The current core, [libretro/mame][lr-mame], keeps upstream's COPYING, so it is walled;
  [MAME 2016][lr-mame2016] is walled as "How the survey chose" settles.
- [HBMAME][hbmame] is "Home Brew MAME",
  whose purposes are "to preserve homebrew games written for arcade machines or arcade emulators"
  and "to include worthwhile hacks of arcade games"; its COPYING is GPL-2.0 with no "or later",
  and a [libretro port][lr-hbmame] keeps it.
  Its own site is closed as a precaution because its sets are hacks of commercial games (inference).
- [MAMEUI][mameui] and [GroovyMAME][groovymame] carry MAME's COPYING unchanged, so they are walled;
  GroovyMAME is "aimed at CRT monitors" (metadata); its wiki was blocked as unregistered,
  and that it drives them at 15 kHz is from memory.
- [MAME4droid][mame4droid] is "an Android port of the MAME 0.289 emulator",
  with its own rollback and lockstep netplay "Built from scratch" (README); its latest release is 1.41.2 of 2026-09-16
  (releases).
  Its licence file is a bare GPL-2.0 text and its README says "or later", but it ports walled MAME, so it is walled.
- [MAME4iOS][mame4ios] runs on iOS, iPadOS, tvOS, and macOS, as separate apps for sets of 0.238 and 0.139u1 (README);
  its latest release is 2022.5 of 2022-12-12 (releases); the 0.139u1 build predates MAME's relicensing
  and is closed (inference), at a path not known.

### FinalBurn Neo and its line

- FinalBurn Neo (`finalburnneo/FBNeo`, closed) is "an Emulator for Arcade Games & Select Consoles.
  It is based on the emulators FinalBurn and old versions of MAME"; it names CPS-1, CPS-2, CPS-3, Neo Geo,
  and Sega System 16 among its boards (README).
  It has 1,581 stars and was pushed on 2026-11-26; the guard blocked its releases (metadata; research log).
- Its LICENSE.md only points to the full licence in `src/license.txt`,
  which the guard blocks (observed). libretro quotes its terms: "Redistributions may not be sold,
  nor may they be used in a commercial product or activity" and "You may not ask
  for donations to support your work on any project that uses the FB Neo source code" ([libretro, FBNeo][lr-fbneo]).
  That it also binds users to the old MAME terms rests on the register's earlier reading of the licence text.
- libretro says FBNeo aims at accuracy as MAME does, that each is more accurate on some boards,
  and that FBNeo "doesn't mind including 'quality of life' hacks", such as skipping the CPS-3 installation screen
  ([libretro, FBNeo][lr-fbneo]).
  Its libretro core supports run-ahead, netplay, RetroAchievements, and rewind,
  and emulates consoles from the ColecoVision to the Mega Drive and the Neo Geo CD (same); it "doesn't support 3D games"
  ([libretro arcade guide][lr-arcade]).
- It needs matching sets, including BIOS and microcontroller sets such as `neogeo` and `pgm`;
  "you are supposed to dump your own games", and it accepts a bought Universe BIOS ([libretro, FBNeo][lr-fbneo]).
  Its prose says nothing on keys; that its source holds key data is from memory.
- The README says its developers left FB Alpha over "a controversy".
  In 2019 the Capcom Home Arcade, made by Koch Media, ran CPS-1 and CPS-2 games on FB Alpha;
  Barry Harris said "FBAlpha has been licensed by Capcom Home Arcade",
  and a contributor wrote "I'm considering pulling out all of the code I wrote and ported for FBA"
  ([Kotaku][kotaku-cha]; secondary).
  FB Alpha's site in 2008 recorded releases "Matched all sets to MAME 0.124u1"
  ([FB Alpha site, 2009 capture][fba-site]).
  That FinalBurn began around 2000 is from memory.

### Makers' own emulation

- No arcade maker's in-house emulator is described in any prose read; makers have commissioned or licensed outside ones.
  Wikipedia says some companies "have even hired MAME developers to create emulators for their old properties",
  naming the Taito Legends pack ([Wikipedia, "MAME"][w-mame]; secondary).
  Capcom's licensee ran FB Alpha in the Capcom Home Arcade
  ([Kotaku][kotaku-cha]; secondary), and the Neo Geo X ran Neo Geo games by emulation ([R1-07][r107]).
  Hamster's and Capcom's own reissues of arcade games run on emulation (from memory).

### Historical dedicated emulators

- ElSemi's site, closed, says "NEBULA is an emulator for the hardware found in the CAPCOM CPS2 boards",
  needing "the ROM images of the board and also a decryption table for these ROMs",
  and that it offers links to the tables only (`nebula.emulatronia.com`, 2012 capture, front page).
  Its last builds were Nebula 2.25b, Model 2 Emulator 1.1a, CPS3 Emulator 1.0a, and an Xbox build of the last,
  made with Microsoft's kit by its author's note (2022 capture); the domain now shows spam (2026 capture; observed).
  The Emulation General wiki also dates Model 2 Emulator 1.1a to 2 January 2014 (["Model 2 Emulator"][egw-m2]; lead).
- The Model 2 Emulator's 0.9 notes (2008) say its texture mapping "works the same way the real hardware does"
  (same capture);
  an unofficial 1.1c of 2024 fixes networking (Emulation General wiki, ["Model 2 Emulator"][egw-m2]; lead).
- WinKawaks covered CPS-1, CPS-2, and the Neo Geo MVS from 2001, closed and Windows-only (search results; lead).
  A 2013 capture of `www.kawaks.org`, opened in error
  (see Scope), invites visitors to "download the roms", so the site is closed.
- Raine, an emulator of Taito and other boards
  (from memory),
  has 97 stars and was pushed on 2026-11-11, but no licence file or statement was found, so `zelurker/raine` is closed;
  its [site][raine-site] stopped posting news in 2015.

### Supermodel

- [Supermodel][supermodel] is the "Official repository of the Sega Model 3 arcade emulator", with 703 stars,
  pushed on 2026-11-25 (metadata).
  Its GitHub releases are automated v0.4 builds, the latest `v0.4-20261125-git-739ef99` of 2026-11-25 (releases);
  Flathub shows 1,744,394 installs and a build "0.3a-20261025-git-1481545" of 2026-10-25 ([Flathub][fh-supermodel]).
  Its site, `supermodel3.com`, does not resolve: "We lost our web hosting and have no backup of the recent forum"
  (README; research log).
- Its licence file is a header "distributed
  as free software under the terms of the GNU General Public License" followed by the GPL version 3 text;
  Model 1 and Model 2 support are "based on code from MAME ... made available under the BSD 3-Clause License"
  (README; `Docs/LICENSE.txt`).
  It is open; no line existed, so one is added.
- Its origin: "What is known so far has been painstakingly reverse engineered from scratch" (README).
- It loads MAME-compatible sets by checksum, defaults the PowerPC to "66 MHz for Step 1.0,
  100 MHz for Step 1.5 and 166 MHz for Step 2.x games",
  skips idle loops in a way that "saves host CPU time without changing emulated timing",
  and runs the PowerPC and rendering, sound, and the drive board on three threads (`Docs/README.txt`).
  "The actual Model 3 refresh rate is 57.524 Hz" (same); the manual does not say whether the PowerPC is recompiled.
- It credits MAME's authors "for the interface to and decryption code for the Sega 315-5881 protection device" (same),
  so the repository holds decryption code (inference); that per-game key values sit in its game list is from memory.
  It claims no test results: "most games run well, however there may be some minor visual issues" (same).

### NAOMI, Atomiswave, and Hikaru: Demul and Flycast

- [Demul][demul-site], whose team names Wind as main coder,
  first released on 25 November 2006 and last posted a "0.7 WIP" on 28 April 2018; it is closed,
  with no licence and a binary for Windows only; its menu links `p1pkin/demul` as its "bug tracker (github)",
  a Google Code export last pushed in 2017 (site; metadata).
  Its notes say its romsets are "in sync with current MAME" (site).
  Its notes record an SH-4 interpreter and recompiler,
  "most of the protection/encryption formats for the arcade systems",
  NAOMI GD-ROM sets that "now require security PIC dumps", and Model 3 work suspended for Supermodel (site).
- [Flycast][flycast], "derived from reicast", runs Dreamcast, NAOMI, NAOMI 2, and Atomiswave games,
  and System SP per its store listing; it has 2,676 stars and was pushed on 2026-11-24 (README; metadata).
  Flathub shows v2.7 of 2026-08-14 and 537,245 installs ([Flathub][fh-flycast]); Google Play shows "100K+ Downloads"
  ([Google Play][gp-flycast]).
  Its licence file is the bare GPL version 2 text, so it is walled, as its register line says.
- Hosts are Windows, Linux, macOS, Android, Xbox, and Nintendo Switch; iOS was dropped (README).
  It also runs as a libretro core, and libretro lists NAOMI and Atomiswave BIOS sets as optional
  and a "HLE BIOS" option, and loads NAOMI GD-ROM games as "MAME zip + chd" ([libretro, Flycast][lr-flycast]).
  The high-level BIOS is closed system software.
  That cartridge decryption takes its key from the security chip dump in the user's set is from memory.
- Its parent [Reicast][reicast] is archived under the 3-Clause BSD licence and points users to Flycast;
  its predecessor nullDC (`skmp/nullDC-v1`) has no licence and is closed.
  The roadmap's [R1-52][studies] covers Flycast.

### Dolphin's Triforce support

- "Triforce support was added to Dolphin in 2512-395"; the wiki rates games such as F-Zero AX,
  Mario Kart Arcade GP 1 and 2, and Virtua Striker 4 at 4 ([Dolphin wiki, "Triforce"][dolphin-wiki-tri]).
  The board is "a retail GameCube board, with a microcontroller-based 'Media Board'" (same).
- Its announcement credits crediar's fork,
  says each game has "a corresponding security key that must be inserted into the Triforce unit",
  and that some parts are "still hardcoded", such as each game's JVS devices;
  Segaboot is optional and comes from the user's own disc files ([Dolphin, "Rise of the Triforce"][dolphin-tri]).
  It links a dumping guide, not followed.
- Its oracle is hardware: users who own "fully operational Triforce cabinets" came forward "to help us run hardware
  tests", and for one game "finding hardware for this game has proven impossible, so we've had to reverse engineer the
  game" ([Dolphin, progress report 2603][dolphin-2603]).
  R1-17 covers Dolphin itself ([R1-17][r117]).

### Boards built on the PS2 and PS3

- [PCSX2x6][pcsx2x6] is a GPL-3.0 fork of PCSX2 "for NAMCO System 246 and 256 emulation" (metadata), with 207 stars;
  its site reports "89% of the game library playable!" and says it "does not require MagicGate or any form of security.
  User only needs to dump their game security dongle" ([PCSX2x6 site][pcsx2x6-site]).
  The site hosts BIOS, game, and dongle dumping pages, not opened; the register closes the first two.
  It sends System 147 and 148 users to Iris and Konami Python users to Reliquary (same, FAQ).
- [PCEE2][pcee2] runs those boards in libretro with PCSX2x6's code, from a dongle image, a bootloader, and a board BIOS
  (README; [R1-19][r119]);
  its README links a PCSX2x6 collection on the Internet Archive that R1-19's register line closes, not followed;
  [Play!][play]'s dev log added "Preliminary Namco System 246 support" in 0.61 (2023-06-27)
  and System 256 in 0.62 ([purei.org][purei]).
- [PCSX2 Reliquary][reliquary] is a GPL-3.0 fork "focused on properly modeling security flows,
  PlayStation 2 arcade hardware, and accuracy focused compatibility work",
  with Konami Python 1 and 2 support and "Optional Mechacon security paths ... skipped if not provided";
  it has a README section on key material, not read (README; research log).
- The [RPCS3][rpcs3] README does not mention arcade boards; that it runs some System 357 games is from memory,
  and its wiki and compatibility pages were walled or refused scripts (research log).

### PC-based boards: loaders and TeknoParrot

- These boards run x86 Windows or Linux, so their games run as native code on a PC
  ([R1-04][r104-x86] for the processor); the loaders supply the I/O boards, dongles, and system calls they expect.
  [OpenParrot][openparrot], GPL-3.0, "Open Source version of TeknoParrot",
  detects a game by its executable's PE CRC or a byte pattern
  and loads its library into the original executable (README);
  that it patches the game's code in memory is an inference.
- [TeknoParrot][tekno] calls itself "The Definitive Arcade Preservation Platform" and says "TeknoParrot is an emulator.
  Game files are not included."
  It now lists released emulation of the ST-V, Hikaru, Model 3, and Taito Type Zero beside PC games,
  and "Most of these games require a Premium subscription", from "$5.99 USD/month" ([TeknoParrot][tekno]).
  Its terms forbid users to "Reverse engineer or modify the software" ([terms][tekno-terms]).
  Its download page offers an experimental 2.0 for Windows, Linux, and Android (same).
  It is closed; `teknogods/TeknoParrot` shows no licence, and the old interface repository is gone (metadata).
  An October 2026 update announced CPS-1 to CPS-3 and Neo Geo support ([Arcade emulators][egw-arc]; lead).
- The Lindbergh Loader (`lindbergh-loader/lindbergh-loader`) "emulates the SEGA Lindbergh,
  allowing games to run on modern Linux computers to be used as replacement hardware for broken Lindbergh systems";
  its licence is "Attribution-NonCommercial-ShareAlike 4.0 International", so it is closed (README; licence file).
- JConfig for Type X games, Segatools for Sega's Nu and ALLS, and spice2x for Konami's PC games are leads
  (Emulation General wiki, ["Taito Type X and variants"][egw-typex] and ["Arcade emulators"][egw-arc]);
  `Soyandroid/segatools` shows no licence and is closed (metadata).
  The same wiki says Ultra Loader bundles Supermodel, Flycast, Dolphin, and other cores (lead);
  whether any paid loader meets those cores' licences was not found.

### Laserdisc games

- Daphne was "an arcade laserdisc emulator" (`www.daphne-emu.com/site3/`, home page).
  Its FAQ index asks whether a valid DVD must stay in the drive after DaphneLoader has auto-downloaded Dragon's Lair,
  so DaphneLoader downloaded game files and checked for the user's DVD (FAQ index; inference).
  A site whose tool downloads game files is closed, so its address is not linked and no FAQ answer was opened.
  Its licence was not found; that it was GPL is from memory.
- [Hypseus Singe][hypseus] is "a fork of Matt Ownby's Daphne", under GPL version 3 "or
  (at your option)
  any later version", with Singe and Singe 2 support and light guns, on Windows, macOS, Linux, and the Raspberry Pi;
  "Open development of Daphne, by Matt Ownby, ceased several years ago", and it reserves the mark "Hypseus" (README).
- [DirkSimple][dirksimple], zlib-licensed, "uses the original footage from the supported games but not their ROMs.
  The game logic has been implemented from scratch in Lua", and runs as a libretro core (README).
  MAME emulated its first laserdisc game in 0.127 ([MAME, history][mame-hist]).

### FPGA cores

- [jtcores][jtcores] holds "FPGA cores compatible with multiple arcade game machines
  and KiCAD schematics of arcade games", "Working on MiSTer FPGA/Analogue Pocket" (metadata).
  Its README claims "1250+ supported titles" in September 2026 and says "Some core have KiCAD schematics
  for the arcade PCB" (quoted as written); it tests in simulation with private regression data,
  and "Most cores are released early for patrons" (README).
- Its binaries live in `jotego/jtbin`, which has no licence file and is closed; its MRA files build ROMs from MAME sets,
  and that some carry decryption key bytes is from memory.
- MiSTer's arcade cores vary: [Arcade-Cave][mister-cave] is GPL-3.0, so open;
  [Irem M72][mister-m72] has a bare GPL-2.0 file and [Robotron][mister-robotron] mixed per-file notices, so both walled;
  `MiSTer-devel/Arcade-Galaga_MiSTer` has no licence and is closed (metadata; READMEs).
  The Robotron and Galaga READMEs send users to a ROM guide on the MiSTer wiki, not opened.

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Arcade programs and screens were held copyrightable early.
  In [Williams v Artic][williams] (Third Circuit, 1982) a copied Defender program in ROM infringed,
  and memory devices were held a "copy" in which the work is "fixed"; [Stern v Kaufman][stern]
  (Second Circuit, 1982) upheld Konami's audiovisual registration for Scramble.
  With [Midway v Artic][r002-deriv], dumped arcade ROMs are copies (inference).
- MAME agrees: "You are not permitted to make copies of software without the copyright owner's permission"
  ([MAME FAQ][mame-faq]);
  on ROMs for an owned board, "This is unclear and depends on where you live" ([MAME legal][mame-legal]).
  The FAQ names licensed sources, such as Neo Geo sets once sold by Humble Bundle and DotEmu ([MAME FAQ][mame-faq]).
- Encryption is anti-bootleg.
  CPS-2 games "must be decrypted via a decryption key stored on the main board's battery-backed memory",
  the "suicide battery", and Capcom used it "to prevent software piracy"; "In January 2007,
  the encryption method was fully reverse-engineered by Andreas Naive and Nicola Salmoria"
  ([Wikipedia, "CP System II"][w-cps2]; secondary).
  CPS-3 keeps "the per-game key stored in battery-backed SRAM" in a security cartridge
  ([Wikipedia, "CP System III"][w-cps3]; secondary),
  and Capcom's Kabuki CPU keeps "a few bits saved in memory"
  ([Hackaday][hackaday-kabuki]; lead),
  and Wikipedia names Neo Geo encryption beside CPS-2 and CPS-3 among the schemes MAME's developers reverse engineered
  ([Wikipedia, "MAME"][w-mame]; secondary); the other schemes named in this note are from memory or project prose.
- No decision was found on whether board encryption "effectively controls access" under § 1201
  ([R0-02, "The statute"][r002-1201]);
  since a game cannot run until its program is decrypted with the board's key,
  the encryption reads as an access control under the statute's definition (inference).
  The Copyright Office exempted programs behind obsolete dongles in its 2003, 2006, and 2010 rules
  ([2003][co-2003]; [2006][co-2006]; [2010][co-2010]);
  the 2012 and 2015 pages do not mention dongles (observed), and exemptions never covered tools
  ([R0-02, "The triennial exemptions"][r002-trien]).
  Capcom ended CPS-2 battery replacements on 28 February 2019
  ([Wikipedia, "CP System II"][w-cps2], citing Capcom's notice, which refused scripts; secondary; research log).
- Keys follow [R0-02, "Keys"][r002-keys]: no court decision on a key's status was found.
  MAME and FinalBurn Neo practise [R0-02 option 3][r002-o3]'s second variant, decryption in the emulator,
  and Nebula [option 2][r002-o2], decryption in the emulator with tables the user fetches separately
  (sections above; inference).
- Firmware: the BIOS sets are the makers' code, so MAME, FinalBurn Neo, Demul,
  and the PS2-board forks follow [option 4][r002-o4]; MAME and FinalBurn Neo also accept the Universe BIOS,
  a third party's replacement ([option 5][r002-o5]), which is closed for Rustalgia.
  Boards print their maker's notice from ROM: Williams' copyright line was stored but never shown
  (Williams v Artic), so a game's own boot draws its logo ([option 16][r002-o16]; inference).
- Enforcement found touches games and commerce, not emulators.
  At exA-Arcadia's request MAME 0.240 removed two CV1000 games
  ([whatsnew 0.240][mame-240]);
  Wikipedia calls the request a cease and desist of 30 December 2021, citing a forum post
  ([Wikipedia, "MAME"][w-mame]; secondary; the forum post is a lead).
  Taito's 2024 notice took down 78 TeknoParrot compatibility pages,
  saying its games "were not to be distributed online" and that "emulator
  or something similar was used to extract the data"
  ([Taito notice][dmca-taito]);
  GitHub found no valid anti-circumvention claim, and the repository now returns HTTP 451 (observed).
  SNK's 2026 notice named the release files of a static recompilation of an Xbox 360 game,
  and GitHub first gave the owner a chance to make changes
  ([SNK notice][dmca-snk]); the repository is still public (metadata).
  A search of GitHub's notice file names, done by the research pass and not repeated, found none naming MAME, FinalBurn,
  or the Neo Geo, consistent with [R0-02, "Who has been reached"][r002-who] (research log).
- The actions found concern commerce.
  In 2013 SNK Playmore ended the Neo Geo X licence and promised "decisive measures" for its marks
  ([Siliconera][siliconera]; secondary);
  Ultracade's former owner was indicted in 2009 over counterfeit game packs
  ([Gamasutra][gamasutra-ultracade]; secondary);
  and in 2017 a family business faced 14 felony charges over cabinets holding Galaga and Pac-Man
  ([Arcade Heroes][arcadeheroes]; lead).
  The FB Alpha dispute suggests that one developer alone cannot license a non-commercial emulator with many authors
  (inference from [Kotaku][kotaku-cha] and the licence text);
  MAME's legal page says "There is no central copyright authority you can license the code from"
  ([MAME legal][mame-legal]).
- Names: "MAME" is "a registered trademark of Gregory Ember", and the legal page forbids earning donations from the mark
  ([MAME legal][mame-legal]); SNK enforces "NEOGEO" and "SNK" ([Siliconera][siliconera]); see [option 14][r002-o14].
- Patents: boards launched by 2001, up to Model 3, NAOMI, and System 246, are past a 20-year term from filing
  ([R0-02, "Terms"][r002-terms]; calculated).
  PC-era boards may carry patents in force (inference); they were not searched,
  since the recommendation leaves those boards out of scope.
  Konami's 2005 suit over In the Groove's dance-game patents and trade marks settled in 2006,
  with Konami taking the series' rights (Wikipedia, ["In the Groove"][w-itg]; secondary).
- Of R0-02's options, 1 fits unencrypted boards; 2 and 3 the encrypted ones; 4, 5, and 16 the BIOS boards; 7,
  since MAME's FAQ says copies need the copyright owner's permission; 8, given the non-commercial licences,
  paid loaders, and jtcores' early access; 10; 11 to 13 for PC-era boards; and 14 and 15 (inference).
  Most rights holders are Japanese, so Japan's law weighs more here ([R0-02, "Japan"][r002-jp]; inference).

### How hard the family is to emulate

- Breadth is the first cost: MAME emulates "well over a thousand different arcade system boards"
  ([Wikipedia, "MAME"][w-mame]; secondary).
  [SiliconRE][siliconre], walled, lists custom chips traced from die photographs by maker: Capcom, Konami
  (with "Security" chips), Namco (mostly under embargo), Sega, SNK, and Taito (README).
- Protection microcontrollers often need decapping: for Taito's C-Chip,
  "sending the unlock command to the chip didn't yield the desired effect",
  and after decapping a ROM took "about three hours" ([Hackaday][hackaday-decap]; lead).
  MAME's FAQ says decapping became affordable outside high-end laboratories only lately ([MAME FAQ][mame-faq]).
- The 2D boards share processors and sound chips with consoles: the 68000, Z80, and YM2610 of the Neo Geo,
  whose MVS refreshes at 59.1856 Hz ([R1-01, "What accuracy means here"][r101-acc]), whose cartridges set wait states
  ([R1-01, "The 68000"][r101-68k]),
  and whose YM2610 mixes its outputs on the board
  ([R1-01, "Sega and others"][r101-snd]);
  the Neo Geo system ROM's routines are called by games
  ([R1-01, "Boot ROMs and firmware"][r101-fw]), so emulating it needs the user's BIOS or a replacement.
- The 3D boards add DSPs and custom pipelines
  (the table above),
  the problem [R1-02][r102-dsp] sets out for microcode and DSPs, and the Model 1 DSP program has known bad bits
  ([MAME home page][mame-home]).
  Several boards link cabinets: Model 2 networking, NAOMI multiboard, and F-Zero AX's multi-cabinet play,
  which Dolphin does not yet run ([Dolphin, "Rise of the Triforce"][dolphin-tri]).
- Peripherals are board-specific: JVS I/O, card readers ([Demul][demul-site]), force feedback drive boards
  ([Supermodel][supermodel]), touchscreens, and light guns.
  Console-based boards reuse console cores, such as the Dreamcast's
  ([R1-03, "Dreamcast"][r103-dc]), and add security, media boards, and I/O.
- Media come in many forms: ROM chips, GD-ROMs copied to DIMM RAM, hard disks, and laserdiscs, which MAME stores as CHDs
  ([MAME docs, "About ROMs and Sets"][mame-sets]).

### Tests and published results

- No published table of any arcade emulator's results against a hardware test suite was found.
  Searched: MAME, FinalBurn Neo, Supermodel, Flycast, Demul, Dolphin's Triforce posts, and the loaders' prose;
  and the web for Neo Geo test programs and MDFourier against MAME (research log).
- The oracles in use are recordings of real boards.
  MAME Testers asks for "a sound recording of the real PCB or a technical information",
  warns that on the Neo Geo "many original graphic 'bugs' have been confirmed",
  and rules that "Comparisons of home console ports of arcade games to the arcade originals are NOT valid proof"
  ([MAME Testers FAQ][mt-faq]; [rules][mt-rules]).
  FinalBurn Neo wants "a video of the PCB (meaning real hardware)" for bug reports
  ([libretro, FBNeo][lr-fbneo]), and Dolphin used owners' cabinets ([2603][dolphin-2603]).
- The 240p Test Suite has a Neo Geo MVS, AES, and CD port, tested on hardware with flash carts,
  though "the monoscope in this version has a warning and has yet to be checked for full precision"
  ([240p devlog][240p-ng]; [240p Test Suite][240p]).
- Its author compared "about a dozen CPS1 PCBs" and found two audio signatures,
  which jotego's schematic-derived filters "matched the hardware measurements closely" ([RetroRGB][retrorgb]; lead).
  He adds that VRAM writes during display work in MAME but crash the board,
  and that emulators start RAM filled where the hardware leaves it for the game to set (same; lead).
- Other checks refer to emulators: MAME's `-validate` checks internal consistency
  ([command line][mame-cli]),
  a closed tool, `firewave/mame_regtest`, mass-tests MAME's drivers
  (README; that it compares their output with earlier MAME releases is from memory),
  and the 68000 single-step tests were "Generated using the microcoded core in MAME"
  ([SingleStepTests m68000 README][sst-m68000]; [R1-01, "Tests and their oracles"][r101-tests]).
  MAME marks each machine's status green, amber, or red ([MAME docs, UI][mame-ui]).
- Games' own service menus and power-on tests are an oracle any board owner can run (inference).

## Options and trade-offs

### Which emulators the arcade studies cover

- **What:** the roadmap's [R1-54][studies] studies [MAME][mame-gh] and [R1-52][studies] [Flycast][flycast];
  both are walled.
  The open choices are [Supermodel][supermodel], [jtcores][jtcores], [Dolphin][dolphin]'s Triforce code,
  and the PCSX2 forks.
- **Costs:** a walled study reads prose only, unless the owner starts a reader session,
  which writes functional descriptions only
  ([ADR 0006, "Walled tier"][adr6-walled])
  and must avoid MAME's key data, since keys are never obtained or used ([ADR 0006, "Context"][adr6-context]).
- **Gains:** MAME is the reference for nearly every board, and Supermodel and jtcores are open,
  with jtcores' schematics drawn from boards.
- **Used by:** FinalBurn Neo, Supermodel, [Demul][demul-site], and jtcores all take sets, code, or research from MAME
  (sections above).

### Which oracles the arcade work is tested against

- **What:** recordings of real boards and games' own test modes, the [240p Suite][240p] on an MVS,
  and Rustalgia's own measurements; MAME's behaviour as a comparison only.
- **Costs:** boards are scarce and differ by revision, as the CPS-1 audio signatures show; recordings need equipment.
- **Gains:** the only hardware oracles found; MAME as an oracle carries its bugs, as the 68000 tests' README warns.
- **Used by:** [MAME Testers][mt-faq], FinalBurn Neo, Dolphin, and jtcores (sections above).

### How encrypted boards are handled

- **What:** leave them out ([R0-02 option 1][r002-o1]); accept only sets the user has decrypted
  ([option 3][r002-o3]'s first variant); or decrypt with user keys ([option 2][r002-o2]); never ship keys.
- **Costs:** leaving them out drops CPS-2, CPS-3, NAOMI, the encrypted MVS cartridges, and many System 16 games
  (from memory, for System 16);
  decrypted-only input needs tools that Rustalgia must not link; user keys are the conduct R0-02's filings attack.
- **Gains:** the first two keep decryption code and keys out of the project; MAME's decryption has drawn no action.
- **Used by:** MAME and FinalBurn Neo decrypt; Nebula decrypted with tables the user fetched
  ([option 2][r002-o2]); Azahar's decrypted-only model ([R0-02 option 3][r002-o3]) is the console precedent.

### How BIOS sets are handled

- **What:** the user's own BIOS set ([option 4][r002-o4]) or Rustalgia's own replacement for a board's system ROM
  ([option 5][r002-o5]).
- **Costs:** a replacement Neo Geo system ROM must provide routines games call, and the known one is closed.
- **Gains:** a user set is the accurate path, and every emulator found for BIOS boards accepts it.
- **Used by:** MAME, FinalBurn Neo, Demul, Flycast (or its closed HLE), and PCSX2x6.

### Which boards come first

- **What:** 2D boards sharing chips with consoles, taking first their unencrypted games
  (on the Neo Geo MVS, CPS-1, and early System 16);
  console-based boards through their console cores; custom 3D boards; PC-based boards.
- **Costs:** 2D first defers the 3D boards; PC boards would need a Windows and Linux compatibility layer,
  not a console emulator, and the paid loaders show a market Rustalgia would not join.
- **Gains:** the MVS reuses the AES work of [R1-05][r105] and the primer's 68000, Z80, and YM2610.
- **Used by:** FinalBurn Neo covers the 2D boards; [TeknoParrot][tekno] and [OpenParrot][openparrot] the PC boards.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** keep R1-54 for MAME as a reader-session study, briefed to skip key data and set lists;
  keep R1-52 for Flycast; read Supermodel and jtcores as open references when a board needs them.
- **Oracles:** adopt real-board recordings, game test modes, and the 240p Suite's Neo Geo port,
  plan a measurement spike like [R5-12][phase5] before any arcade accuracy target, and use MAME for regression only.
- **Encryption:** take up encrypted boards only after [R6-01][phase6], under option 3's first variant, with no keys,
  key tables, or links to decryption tools.
- **Firmware:** support user BIOS sets; never load another project's replacement; write one only if a board needs it.
- **Order:** start with the unencrypted games of the Neo Geo MVS and other 2D boards,
  reach console-based boards through their console cores, and leave PC-based boards out of scope for emulation.

## Implications for Rustalgia

- [R2-11][phase2] needs a set format that matches files by checksum and handles parents, clones, BIOS and device sets,
  and CHDs, because MAME, FinalBurn Neo, Supermodel, Demul, Flycast, and jtcores load MAME-format sets.
- [R2-12][phase2] should treat board BIOS sets as user files and log their version,
  and record that replacement system ROMs, the Universe BIOS among them, are closed.
- [R2-03][phase2] must schedule several processors and DSPs per board, and [R2-09][phase2] may need cabinet links,
  as Model 2, NAOMI, and Triforce show.
- [R2-15][phase2] should plan board measurements,
  since no published table of any emulator's results against a hardware test suite was found.
- Every brief for arcade work must forbid key, key-table, and set-list pages, the Supermodel and MAME decryption files,
  and ROM, BIOS, and CHD sites; the register's new block closes the addresses found.
- [R6-01][phase6] can weigh the MVS with the AES of [R1-05][r105], and the console-based boards with their consoles.

## Open questions

- Would a court treat anti-bootleg board encryption as a measure that "effectively controls access" under § 1201?
  The statute's definition points to yes
  (Legal exposure; inference),
  but no ruling on such a scheme was found; only a decision on a comparable scheme would settle it.
- Which System 357 games does [RPCS3][rpcs3] run?
  Its compatibility list refused scripts, and a 2026-10-27 capture shows only its first page,
  which names no arcade board (observed); searching the list for each System 357 title by hand,
  in [R1-21][r121]'s follow-up, would answer it.

## Sources

Every source below was read on 2026-11-25, as raw text, unless an entry says otherwise.
READMEs and metadata were read through GitHub's API; Wikipedia links are pinned to the revision read;
closed addresses are in code spans, with the reason.

- Repository documents: [ADR 0006][adr6]; [research guide][guide]; [research roadmap][roadmap];
  [source register][register]; [R0-02][r002]; [R0-05][r005-arc]; [R1-01][r101]; [R1-02][r102]; [R1-03][r103];
  [R1-04][r104]; [R1-05][r105]; [R1-06][r106]; [R1-07][r107]; [R1-17][r117]; [R1-19][r119]; [R1-21][r121].
- MAME: [repository][mame-gh] (COPYING at blob 7f5bf1b1, README, metadata); site: [home][mame-home],
  [legal][mame-legal], [release][mame-rel], [history][mame-hist], [whatsnew 0.240][mame-240]; 0.289 docs:
  [licence][mame-lic], [What is MAME][mame-what], [sets][mame-sets], [FAQ][mame-faq], [CPU][mame-cpu], [UML][mame-uml],
  [command line][mame-cli], [contributing][mame-contrib], [debugger][mame-dbg], [UI][mame-ui].
- MAME forks: READMEs and licence files of [libretro/mame][lr-mame], [MAME 2016][lr-mame2016], [HBMAME][hbmame],
  [HBMAME for libretro][lr-hbmame], [MAMEUI][mameui], [GroovyMAME][groovymame], [MAME4droid][mame4droid],
  and [MAME4iOS][mame4ios], with releases for the last two.
  Licence files pinned by blob: libretro/mame COPYING ed91193d; MAME 2016 LICENSE.md 284f2dd0; HBMAME COPYING 6fcbc829;
  MAME4droid LICENSE d159169d.
  Closed, not linked: `libretro/mame2000-libretro`, `libretro/mame2003-libretro`, `libretro/mame2003-plus-libretro`,
  `libretro/mame2010-libretro`, `libretro/mame2015-libretro`, `libretro/fbalpha2012`, and `libretro/FBNeo`,
  non-commercial or with no licence; HBMAME's site `hbmame.1emulation.com`, not opened.
- libretro documentation: [arcade guide][lr-arcade] (last updated 2026-07-19); [licences][lr-lic]
  (last updated 2026-11-23);
  [FBNeo][lr-fbneo]; [MAME 2003-Plus][lr-m2003p]; [MAME 2000][lr-m2000]; [Flycast][lr-flycast].
- FinalBurn Neo, closed, not linked: `finalburnneo/FBNeo`, README, LICENSE.md
  (blob 83251524), and metadata; its full licence text, `src/license.txt`, was blocked by the guard.
  [FB Alpha site][fba-site], capture of 2009-03-14 06:18:43.
- Closed, not linked: `nebula.emulatronia.com`, which links decryption tables, in captures of 2012-01-06 16:32:45,
  2022-04-24 03:31:00, and 2026-08-22 03:00:39; `www.kawaks.org`, which invites ROM downloads, 2013-03-12 05:21:00;
  both opened in error, as Scope records.
  Raine: [site][raine-site]; `zelurker/raine`, closed, README and metadata.
- Board emulators: [Supermodel][supermodel] README
  (blob 42d52f2f),
  `Docs/README.txt`, `Docs/LICENSE.txt`, and releases, and [Flathub][fh-supermodel]; [Demul site][demul-site]
  (home, FAQ, downloads, team);
  `p1pkin/demul`, closed, metadata; [Flycast][flycast] README and LICENSE
  (blob d159169d),
  [Flathub][fh-flycast], [Google Play][gp-flycast]; [Reicast][reicast] LICENSE
  (blob 78947d59); `skmp/nullDC-v1`, closed, README.
- Dolphin: [repository][dolphin], metadata and tags; [wiki, "Triforce"][dolphin-wiki-tri], oldid 196558,
  capture of 2026-11-23 18:42:50; ["Rise of the Triforce"][dolphin-tri], capture of 2026-02-16 19:57:27;
  [progress report 2603][dolphin-2603], capture of 2026-03-14 04:42:39.
- PS2 and PS3 boards: [PCSX2x6][pcsx2x6] and its [site][pcsx2x6-site]; [PCEE2][pcee2];
  [Play!][play] and [purei.org][purei] dev log; [PCSX2 Reliquary][reliquary] and its releases;
  [PCSX2][pcsx2] and [RPCS3][rpcs3] metadata, and the RPCS3 README
  (blob 6e59bdb5);
  [RPCS3 compatibility list][rpcs3-compat], capture of 2026-10-27 17:56:59; `ps2homebrew-arcade/proverb`, closed,
  metadata.
- PC-based boards: [TeknoParrot][tekno] home, download, and subscription pages, and [terms][tekno-terms];
  [OpenParrot][openparrot]; `teknogods/TeknoParrot`, `Soyandroid/segatools`, and `lindbergh-loader/lindbergh-loader`,
  closed, README, licence, or metadata.
- Laserdisc: Daphne's site, closed and not linked because its loader downloaded game files:
  `www.daphne-emu.com/site3/` and its FAQ index, questions only; [Hypseus Singe][hypseus] README, LICENSE
  (blob 94a04532), and releases; [DirkSimple][dirksimple] README and LICENSE.txt (blob 81fff812).
- FPGA: [jtcores][jtcores] README, LICENSE
  (blob 9cecc1d4),
  and metadata; [Arcade-Cave][mister-cave]; [Irem M72][mister-m72]; [Robotron][mister-robotron];
  `jotego/jtbin` and `MiSTer-devel/Arcade-Galaga_MiSTer`, closed, README and metadata.
- Tests: [MAME Testers FAQ][mt-faq] (2014-09-18) and [rules][mt-rules] (2019-05-29);
  [240p Test Suite][240p] and its [Neo Geo devlog][240p-ng] (2023-03-01); [RetroRGB][retrorgb] (2024-03-12);
  `firewave/mame_regtest`, closed, README, whose later parts hold configuration listings, so only its opening counts;
  [SingleStepTests m68000 README][sst-m68000] (blob 5995cd9f).
- Law and enforcement: [Williams v Artic][williams]; [Stern v Kaufman][stern];
  Copyright Office rules of [2003][co-2003], [2006][co-2006], and [2010][co-2010];
  GitHub notices of [Taito][dmca-taito] (2024-06-04) and [SNK][dmca-snk] (2026-09-11),
  and `FluffyQuack/rexglue-MetalSlugXX`, closed, metadata; [Kotaku][kotaku-cha] (2019-04-19); [Siliconera][siliconera]
  (2013-10-08); [Gamasutra][gamasutra-ultracade] (2009-08-06); [Arcade Heroes][arcadeheroes] (2017-08-11).
- Chips and research: [SiliconRE][siliconre] README;
  Hackaday on [Kabuki][hackaday-kabuki] (2014-12-12) and [decapping][hackaday-decap] (2018-04-12).
  Not opened, as key or BIOS hazards: `cps2shock.emu-france.info`, `andreasnaive.blogspot.com`,
  `arcadehacker.blogspot.com`, `64darksoft.blogspot.com`, `junkerhq.net/xrgb/index.php?title=CPS-III`,
  and `unibios.free.fr`.
- Wikipedia: ["MAME"][w-mame] 1386317062; ["CP System II"][w-cps2] 1377634070; ["CP System III"][w-cps3] 1359653799;
  ["List of Sega arcade system boards"][w-sega] 1386808998; ["List of Namco arcade system boards"][w-namco] 1374740489;
  ["Atomiswave"][w-atomi] 1385968635; ["Arcade video game"][w-arcade] 1384315289; ["Taito Type X"][w-typex] 1383934694;
  ["Interactive film"][w-film] 1386301979; ["In the Groove"][w-itg] 1385483555.
- Emulation General wiki, leads: [main page][egw] (revision 151681); ["Model 2 Emulator"][egw-m2]
  (revision 110729);
  ["Arcade emulators"][egw-arc] (revision 152401); ["Taito Type X and variants"][egw-typex] (revision 133139).

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[adr6-walled]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#walled-tier
[adr6-context]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#context
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-deriv]: R0-02-legal-baseline.md#derivative-works-loading-and-ownership
[r002-1201]: R0-02-legal-baseline.md#the-statute
[r002-trien]: R0-02-legal-baseline.md#the-triennial-exemptions
[r002-jp]: R0-02-legal-baseline.md#japan
[r002-keys]: R0-02-legal-baseline.md#keys
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r002-terms]: R0-02-legal-baseline.md#terms
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o2]: R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys
[r002-o3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r005-arc]: R0-05-source-map.md#sega-arcade-xbox-and-other-systems
[r101]: R1-01-primer-8-and-16-bit.md
[r101-acc]: R1-01-primer-8-and-16-bit.md#what-accuracy-means-here
[r101-68k]: R1-01-primer-8-and-16-bit.md#the-68000
[r101-snd]: R1-01-primer-8-and-16-bit.md#sega-and-others
[r101-fw]: R1-01-primer-8-and-16-bit.md#boot-roms-and-firmware
[r101-tests]: R1-01-primer-8-and-16-bit.md#tests-and-their-oracles
[r102]: R1-02-primer-32-and-64-bit.md
[r102-dsp]: R1-02-primer-32-and-64-bit.md#low-level-or-high-level-emulation-of-microcode-and-dsps
[r103]: R1-03-primer-sixth-generation.md
[r103-dc]: R1-03-primer-sixth-generation.md#dreamcast
[r104]: R1-04-primer-modern.md
[r104-x86]: R1-04-primer-modern.md#x86-64-in-the-playstation-4-and-5-and-the-xbox-one-and-series
[r105]: R1-05-catalogue-8-and-16-bit.md
[r106]: R1-06-catalogue-32-and-64-bit.md
[r107]: R1-07-catalogue-sixth-generation.md
[r117]: R1-17-gamecube-wii-wii-u-family.md
[r119]: R1-19-playstation-2-family.md
[r121]: R1-21-playstation-3-4-5-family.md
[sst-m68000]: https://github.com/SingleStepTests/m68000
[mame-gh]: https://github.com/mamedev/mame
[mame-home]: https://www.mamedev.org/
[mame-legal]: https://www.mamedev.org/legal.html
[mame-rel]: https://www.mamedev.org/release.html
[mame-hist]: https://www.mamedev.org/history.html
[mame-240]: https://www.mamedev.org/releases/whatsnew_0240.txt
[mame-lic]: https://docs.mamedev.org/license.html
[mame-what]: https://docs.mamedev.org/whatis.html
[mame-sets]: https://docs.mamedev.org/usingmame/aboutromsets.html
[mame-faq]: https://docs.mamedev.org/usingmame/commonissues.html
[mame-cpu]: https://docs.mamedev.org/techspecs/cpu_device.html
[mame-uml]: https://docs.mamedev.org/techspecs/uml_architecture.html
[mame-cli]: https://docs.mamedev.org/commandline/commandline-all.html
[mame-contrib]: https://docs.mamedev.org/contributing/index.html
[mame-dbg]: https://docs.mamedev.org/debugger/index.html
[mame-ui]: https://docs.mamedev.org/usingmame/ui.html
[lr-mame]: https://github.com/libretro/mame
[lr-mame2016]: https://github.com/libretro/mame2016-libretro
[lr-hbmame]: https://github.com/libretro/hbmame-libretro
[hbmame]: https://github.com/Robbbert/hbmame
[mameui]: https://github.com/Robbbert/mameui
[groovymame]: https://github.com/antonioginer/GroovyMAME
[mame4droid]: https://github.com/seleuco/MAME4droid-Current
[mame4ios]: https://github.com/yoshisuga/MAME4iOS
[lr-arcade]: https://docs.libretro.com/guides/arcade-getting-started/
[lr-lic]: https://docs.libretro.com/development/licenses/
[lr-fbneo]: https://docs.libretro.com/library/fbneo/
[lr-m2003p]: https://docs.libretro.com/library/mame2003_plus/
[lr-m2000]: https://docs.libretro.com/library/mame2000/
[lr-flycast]: https://docs.libretro.com/library/flycast/
[fba-site]: https://web.archive.org/web/20090314061843/http://fba.emuunlim.com/
[raine-site]: http://raine.1emulation.com/
[supermodel]: https://github.com/trzy/Supermodel
[fh-supermodel]: https://flathub.org/apps/com.supermodel3.Supermodel
[demul-site]: http://demul.emulation64.com/
[flycast]: https://github.com/flyinghead/flycast
[fh-flycast]: https://flathub.org/apps/org.flycast.Flycast
[gp-flycast]: https://play.google.com/store/apps/details?id=com.flycast.emulator
[reicast]: https://github.com/skmp/reicast-emulator
[dolphin]: https://github.com/dolphin-emu/dolphin
[dolphin-wiki-tri]: https://web.archive.org/web/20261123184250/https://wiki.dolphin-emu.org/index.php?title=Triforce
[dolphin-tri]: https://web.archive.org/web/20260216195727/https://dolphin-emu.org/blog/2026/02/16/rise-of-the-triforce/
[dolphin-2603]: https://web.archive.org/web/20260314044239/https://dolphin-emu.org/blog/2026/03/12/dolphin-progress-report-release-2603/
[pcsx2x6]: https://github.com/PS2Homebrew-arcade/pcsx2x6
[pcsx2x6-site]: https://ps2homebrew-arcade.github.io/pcsx2x6/
[pcee2]: https://github.com/WizzardSK/pcee2-libretro
[play]: https://github.com/jpd002/Play-
[purei]: https://purei.org/
[pcsx2]: https://github.com/PCSX2/pcsx2
[rpcs3]: https://github.com/RPCS3/rpcs3
[rpcs3-compat]: https://web.archive.org/web/20261027175659/https://rpcs3.net/compatibility
[reliquary]: https://github.com/DiscoStarslayer/pcsx2-reliquary
[tekno]: https://teknoparrot.com/en/
[tekno-terms]: https://teknoparrot.com/terms-of-service.html
[openparrot]: https://github.com/teknogods/OpenParrot
[hypseus]: https://github.com/DirtBagXon/hypseus-singe
[dirksimple]: https://github.com/icculus/DirkSimple
[jtcores]: https://github.com/jotego/jtcores
[mister-cave]: https://github.com/MiSTer-devel/Arcade-Cave_MiSTer
[mister-m72]: https://github.com/MiSTer-devel/Arcade-IremM72_MiSTer
[mister-robotron]: https://github.com/MiSTer-devel/Arcade-Robotron_MiSTer
[mt-faq]: https://mametesters.org/faq.html
[mt-rules]: https://mametesters.org/rules.html
[240p]: https://github.com/ArtemioUrbina/240pTestSuite
[240p-ng]: https://artemiourbina.itch.io/240p-test-suite/devlog/496347/240p-test-suite-for-neo-geo-mvs-aes-and-ngcd
[retrorgb]: https://retrorgb.com/exploring-ccps-and-the-cps-arcade-platform-emulation-challenges-and-audio-analysis.html
[williams]: https://law.resource.org/pub/us/case/reporter/F2/685/685.F2d.870.81-2407.html
[stern]: https://law.resource.org/pub/us/case/reporter/F2/669/669.F2d.852.81-7411.1674.html
[co-2003]: https://www.copyright.gov/1201/2003/index.html
[co-2006]: https://www.copyright.gov/1201/2006/
[co-2010]: https://www.copyright.gov/1201/2010/
[dmca-taito]: https://github.com/github/dmca/blob/master/2024/06/2024-06-04-taito.md
[dmca-snk]: https://github.com/github/dmca/blob/master/2026/09/2026-09-11-snk.md
[kotaku-cha]: https://kotaku.com/the-emulator-in-capcoms-home-arcade-is-stirring-controv-1834156759
[siliconera]: https://www.siliconera.com/neogeo-x-debacle-snk-playmore-tommos-statements/
[gamasutra-ultracade]: https://www.gamedeveloper.com/game-platforms/in-depth-exploring-ultracade-s-alleged-counterfeit-arcade-game-racket
[arcadeheroes]: https://arcadeheroes.com/2017/08/11/law-watch-six-charged-making-counterfeit-pac-man-games-man-arrested-living-arcade-games/
[siliconre]: https://github.com/furrtek/SiliconRE
[hackaday-kabuki]: https://hackaday.com/2014/12/12/reverse-engineering-capcoms-crypto-cpu/
[hackaday-decap]: https://hackaday.com/2018/04/12/dumping-arcade-roms-the-hard-way/
[w-mame]: https://en.wikipedia.org/w/index.php?oldid=1386317062
[w-cps2]: https://en.wikipedia.org/w/index.php?oldid=1377634070
[w-cps3]: https://en.wikipedia.org/w/index.php?oldid=1359653799
[w-sega]: https://en.wikipedia.org/w/index.php?oldid=1386808998
[w-namco]: https://en.wikipedia.org/w/index.php?oldid=1374740489
[w-atomi]: https://en.wikipedia.org/w/index.php?oldid=1385968635
[w-arcade]: https://en.wikipedia.org/w/index.php?oldid=1384315289
[w-typex]: https://en.wikipedia.org/w/index.php?oldid=1383934694
[w-film]: https://en.wikipedia.org/w/index.php?oldid=1386301979
[w-itg]: https://en.wikipedia.org/w/index.php?oldid=1385483555
[egw]: https://emulation.gametechwiki.com/index.php/Main_Page
[egw-m2]: https://emulation.gametechwiki.com/index.php/Model_2_Emulator
[egw-arc]: https://emulation.gametechwiki.com/index.php/Arcade_emulators
[egw-typex]: https://emulation.gametechwiki.com/index.php/Taito_Type_X_and_variants
