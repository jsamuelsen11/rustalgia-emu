---
title: "NES and SNES: family survey"
roadmap_item: R1-15
status: draft
date: 2026-11-22
---

# NES and SNES: family survey

## Summary

This note asks which emulators of the NES and SNES families are popular or respected, what each one's status, licence,
tier, techniques, and hosts are, and what legal exposure and difficulty the two families carry.

For the NES, the respected open-tier emulators are Mesen 2, now continued as MesenCE,
and Nestopia JG through its libretro port, with ares, TetaNES, BeesNES, and TriCNES beside them; FCEUX, puNES, Mednafen,
and the QuickNES line are walled, Nintendulator is closed, and BizHawk is walled.
For the SNES, the accuracy line runs from bsnes through higan to ares, all open tier, with Mesen 2 beside them; Snes9x,
the most widely shipped SNES emulator, is closed by its non-commercial licence.

Neither family encrypts its games, and no takedown found names an NES or SNES emulator,
so both sit under [`R0-02`][r0-02] option 1.
The exposure that remains is firmware: the Famicom Disk System BIOS, the SNES sound unit's 64-byte boot ROM,
and the internal ROMs of the DSP-n, ST01x, and Cx4 chips,
which third parties read by decapping or by running code on the chips.
Two cases bear on how Rustalgia is built: a Rust NES emulator that relicensed after taking in code from GPL emulators,
and a community fork that bans AI-generated code.

The note recommends AccuracyCoin and the hardware-referenced suites as the NES acceptance oracle,
Rustalgia's own FDS boot path and coprocessor high-level emulation written from observed behaviour,
and two changes to the emulator studies; the owner decides.
This note is not legal advice.

## Scope

- Question: which NES and SNES emulators are popular or respected, and for each, what are its status, licence, tier,
  techniques, and hosts; and what are the families' legal exposure and difficulty?
- Covered: the NES and Famicom with their regional variants and famiclones, the Famicom Disk System (FDS),
  the SNES and Super Famicom with the Satellaview, the SuFami Turbo, and the cartridge coprocessors,
  and the Super Game Boy as SNES cartridge hardware.
  [`R1-05`][r1-05-addons] also places the Family Computer Network System here;
  no evidence on its emulation was gathered, and it is left to [`R1-26`][fam] if no emulator for it is found.
- Left to other items: how the hardware works to [`R1-01`][r1-01] and the list of models to [`R1-05`][r1-05];
  the Super Game Boy's Game Boy side to [`R1-10`][fam]; each emulator's internals to its study
  ([`R1-50`, `R1-51`, `R1-60`, `R1-61`, `R1-64`, `R1-67`][studies]);
  frontends as projects to [`R1-63`][studies], [`R1-65`][studies], and [`R1-66`][studies]; the law to [`R0-02`][r0-02].
- Researched on 2026-11-22.
  Status comes from the GitHub REST API
  (repository, licence, and releases endpoints) on that date, and stars are a rough sign of popularity.
- How claims were checked: four research agents read every page as raw text, with curl or a wiki's raw export,
  and copied quotations from those copies; the writer checked Flathub's install counts, release tags,
  and several pages again.
  One verification pass of fresh verifiers, who saw only this note, then fetched the sources and tested each claim,
  and a fix pass applied their findings.
- No emulator's source files, issues, or pull requests were opened, in any tier, and nothing was cloned;
  emulators are read from prose only, as the process calls below settle.
  No firmware, game, key, or leaked material was opened or obtained.

Process calls settled here, and listed in the pull request:

- Family surveys read emulators from prose and repository metadata only, whatever their tier;
  the emulator studies read code where [ADR 0006][adr6] allows.
- A distribution's or store's licence summary, such as Debian's copyright file or Flathub's metadata,
  does not establish "or later"; it is recorded beside the project's own statement as supporting evidence.
  So FCEUX, puNES, Mednafen, FCEUmm, the QuickNES line, and the legacy Nestopia UE repository stay walled.
- A repository with no licence file detected
  and no licence stated in its prose is closed under ADR 0006's "there is no licence",
  as the register already did for `dillonb/n64`: Nintendulator, NintendulatorNRS, and OpenEmu.
- A project that says it incorporates code derived from walled projects is "a mix the project has not resolved",
  so walled, whatever its own licence: RustyNES.
- The Emulation General Wiki's NES and SNES emulator pages mention leaked source or a leaked BIOS,
  so they are closed as a precaution ([ADR 0006, "Sources that are not emulators"][adr6-kinds]);
  they were read before that was seen, their facts are marked "(lead)", and their addresses are in code spans.
- fullsnes stays in a code span, as in [`R1-01`][r1-01], because it holds a disassembly of the sound boot ROM;
  its CIC pseudo-code, CIC instruction set, and Cx4 data ROM sections were not read and are not to be opened.
- High-level emulation of a coprocessor's ROM inside an open-tier emulator is closed under ADR 0006,
  but its folders cannot be named without a file listing, which this survey does not take.
  The emulator studies list those folders and add closed path lines before reading code.
- No open line is added for the NES MiSTer core: the guard applies every restricted line that matches,
  so the owner-wide walled line for `mister-devel/` would still block it.
- GitHub's takedown archive, registered as `other`, may be searched by code search;
  the ban on searching inside repositories concerns sources.
- A re-check that finds no change in licence or tier leaves the register line and its date as they are;
  the re-check is recorded in this note ("Register re-checks").
- An app published only as a store binary has no source address to register;
  its store listing is covered by the existing `other` line for Google Play, and the note gives its tier by ADR 0006.
- A register line whose tier rests on another repository's README stays walled until its own prose is read:
  `jgemu/nestopia` and `jgemu/bsnes`, whose GitLab pages the guard blocked during this survey.

## Findings

### How the emulators were chosen

- The [NESdev wiki's "Accuracy"][nes-acc] page names Mesen, Nintendulator, and Nestopia as "best-of-breed emulators".
  Its ["Emulators"][nes-emus] page lists BizHawk, FCEUX, higan, Mesen, Nestopia UE,
  and Nintendulator among popular ones, and puNES, TetaNES, and BeesNES as under development.
- [TASVideos][tas-res] prefers BizHawk and FCEUX for NES and FDS movies, and BizHawk and lsnes for the SNES;
  it accepts no movies from Snes9x or ZSNES.
- Flathub install totals on 2026-11-22: RetroArch 5,737,544; Snes9x 487,746; Nestopia 118,929; bsnes 118,421;
  ZSNES 2 105,134; ares 64,231; puNES 38,144
  ([Flathub statistics API][flathub-stats], one record for each app ID: `org.libretro.RetroArch`, `com.snes9x.Snes9x`,
  `ca._0ldsk00l.Nestopia`, `dev.bsnes.bsnes`, `io.github.xyproto.zsnes`, `dev.ares.ares`,
  and `io.github.punesemu.puNES`).

### NES and Famicom emulators

Status and licence, with the tier checked against [the register][register]:

| Emulator | Licence; tier | Status; latest release | Stars |
|---|---|---|---|
| [Mesen 2][mesen2], [MesenCE][mesence] | GPL-3.0-or-later; open | MesenCE 2.2.1, 2026-06-05; 2 archived | 2,411; 678 |
| Nestopia JG ([libretro port][lr-nestopia-repo]) | GPL-2.0-or-later; open | active; 2.0.0, 2026-09-13 | 81 |
| [Nestopia UE][nestopia-ue] (legacy Windows) | GPL-2.0 file; walled | 1.99.0, last win32 build, 2026-09-13 | 958 |
| [FCEUX][fceux] | GPL-2.0, "or later" unstated; walled | active; 2.8.0, 2026-11-21 | 1,586 |
| [puNES][punes] | GPL-2.0, "or later" unstated; walled | v0.111, 2024-02-25; core work in WIP builds | 824 |
| [Nintendulator][nintendulator] | none found; closed | 0.980 release; 0.985 beta, 2026-08-22 | 59 |
| NintendulatorNRS | none found; closed | build of 2026-11-06 | — |
| [BizHawk][bizhawk] | MIT own code, mixed repository; walled | active; 2.11.1, 2026-05-01 | 2,826 |
| [ares][ares] | ISC; open | active; v148, 2026-05-30 | 1,868 |
| [TetaNES][tetanes] | MIT or Apache-2.0; open | active; 0.18.0, 2026-11-20 | 277 |
| [BeesNES][beesnes] | MIT; open | active; no releases | 116 |
| [TriCNES][tricnes] | MIT; open | 1.0.1, 2025-04-01 | 575 |
| [RustyNES][rustynes] | GPL-3.0-or-later, derived code; walled | 3.7.1, 2026-11-16 | 10 |
| Mednafen ([NES module][mednafen-nes]) | GPLv2, "or later" unstated; walled | 1.32.1, 2024-04-05 | — |
| FCEUmm ([libretro][lr-fceumm]) | GPL-2.0, "or later" unstated; walled | libretro core, pushed 2026-11-22 | 159 |
| QuickNES, [quickerNES][quickernes] | GPL-2.0, "or later" unstated; walled | archived 2013; fork active | 27; 15 |

Techniques and hosts, as each project states them:

| Emulator | Accuracy approach and revisions | Hosts |
|---|---|---|
| Mesen 2, MesenCE | options for revision behaviours; debugger | Windows, macOS, Linux; libretro (0.9.9, MesenCE) |
| Nestopia JG | "cycle accurate" | Windows, macOS, Linux, libretro |
| FCEUX | NTSC, PAL, hybrid, Dendy ([site][fceux-site]); TAS, Lua | Windows, macOS, Linux packages |
| puNES | CPU/PPU alignment option (0.108); 418 mappers | Windows, Linux, BSD |
| Nintendulator | hardware quirks; mappers as DLLs | Windows |
| BizHawk NesHawk | accuracy-focused C# core | Windows, Linux |
| ares | "trade speed for code clarity" | Windows, macOS, Linux, BSD |
| TetaNES | NTSC, PAL, Dendy; 30-odd mappers | Windows, macOS, Linux, web |
| BeesNES | sub-cycle CPU and APU | Windows ([NESdev][nes-emus]); macOS (lead) |
| TriCNES | NTSC only; no audio | Windows (.NET) |
| RustyNES | master clock, PPU per half CPU cycle | desktop, web, Android, iOS, libretro |

**Mesen.**
Mesen 2's repository is "an archive of Mesen as it was around version 2.1.1 in mid-2025",
and points to [MesenCE][mesence], which calls itself "a community-managed fork,
created to maintain and expand this emulator into the future"; it covers the NES, SNES, Game Boy family, GBA, PC Engine,
Master System and Game Gear, and WonderSwan ([Mesen 2 README][mesen2], MesenCE README).
MesenCE 2.2.0 lists "Improved CPU/APU/PPU accuracy (passes 11 more AccuracyCoin tests)" and better PAL and FDS accuracy
([MesenCE 2.2.0 release][mesence-220]).
The Mesen 0.9.9 documentation, the only manual found, offers options for revision behaviours:
MMC3A against MMC3B/C interrupts, top-loader and AV Famicom input ports, early-model `0x2004` and palette reads,
no PPU reset as on the Famicom, and random CPU/PPU alignment,
of which it warns "some test roms may randomily fail from one reset to another"
([Mesen, "Emulation settings"][mesen-emu]).
FDS games need the user's BIOS file ([Mesen, "Getting Started"][mesen-gs]). libretro has two cores:
one forked from Mesen 0.9.9 ([libretro Mesen][lr-mesen]; the fork's parent on GitHub is [Mesen][mesen1]),
whose README says "Using version 0.9.9 of Mesen is not recommended", and "A port of MesenCE to the libretro API",
under GPL-3.0 ([libretro Mesen2][lr-mesen2]).

**MesenCE's contribution terms.**
Its CONTRIBUTING file says that contributions are licensed under MIT and "may not be based on GPL code",
that the project may relicense "under a more permissive license, such as MIT",
and that "AI-generated code is prohibited." ([MesenCE][mesence], `CONTRIBUTING.md`).
The tier stays open, because the code is GPL-3.0-or-later today (inference from [ADR 0006][adr6]'s open test).

**Nestopia.**
Martin Freij's original was last released on 2008-07-11 (Wikipedia, ["Nestopia"][wp-nestopia]).
The core now lives in Nestopia JG, at Jolly Good Emulation
([Jolly Good][jgemu]);
the legacy repository "no longer maintains the core emulator" ([Nestopia UE README][nestopia-ue]).
The libretro port describes "a cycle accurate emulator for the NES/Famicom" and states "Nestopia JG (GPL-2.0-or-later)",
with nes_ntsc under LGPL-2.1-or-later, so the port is open tier
([libretro Nestopia README][lr-nestopia-repo]);
the upstream repository at Jolly Good stays walled until its own prose is read, because the guard blocked it.
The 1.99.0 changelog, a backport of 2.0.0,
claims "Passed 144/144 AccuracyCoin tests" and "Passed 156/156 TASVideos Test Suite"
([Nestopia UE site][nestopia-site]).
The legacy repository's `COPYING` is plain GPLv2, and its own prose does not say "or later";
Debian reads the files as GPL-2.0+ ([Debian copyright][deb-nestopia]), which the process call above does not count,
so that repository is walled.

**FCEUX.**
It "features solid emulation accuracy and state of the art tools for power users",
and its README adds "But you might like Mesen more" ([FCEUX README][fceux]).
It merges FCE Ultra and its forks; FCE Ultra kept FCE's non-commercial terms until 0.80 in June 2002,
when it was "re-licensed under the GNU GPL" ([FCEUX history][fceux-ver]).
Its [site][fceux-site] lists NTSC, PAL, NTSC-PAL hybrid, and Dendy modes.
`COPYING` is plain GPLv2 and no FCEUX page read says "or later", while [Debian][deb-fceux] reads GPL-2+.

**puNES.**
It supports 418 iNES and NES 2.0 mapper numbers and 169 UNIF boards
(counted from its README's tables),
0.108 added a CPU/PPU alignment option at power-up
([puNES v0.108][punes-108]), and 0.111 rewrote every mapper and the FDS support ([puNES v0.111][punes-111]).
Its README warns that "new bugs may have been introduced" in work-in-progress builds ([puNES README][punes]).
`COPYING` is GPLv2 and Flathub lists "GPL-2.0" ([Flathub puNES][flathub-punes]); nothing says "or later".

**Nintendulator and NintendulatorNRS.**
Quietust's site says the goal was "to emulate the NES down to its hardware quirks",
that it emulates "a variety of special cases that most other emulators neglect to handle",
and that mappers are external DLLs ([Nintendulator][nintendulator]).
The site calls it "open source" but states no licence
(searched for "licen", "GPL", and "copyright"),
and GitHub detects none for `github.com/quietust/nintendulator`, so it is closed.
NintendulatorNRS, a fork for rare mappers, Famiclone chipsets,
and bootleg carts according to the Emulation General Wiki (lead),
is published only as a 7z build in a directory listing, `symphoniae.com/nrs/NintendulatorNRS/`, with no licence,
so it is closed.

**BizHawk.**
Its README calls NesHawk one of its "bespoke emulation cores written in C#" and marks it as accuracy-focused
and "acceptable on TASVideos"; quickerNES is its fast core ([BizHawk README][bizhawk]).
Its own code is MIT, and "anything outside /src isn't ours" (same README), which the register records as walled.
2.11.1 fixed DMC DMA conflicts with controllers, and 2.10 replaced QuickNES with quickerNES
([BizHawk release history][tas-bizhawk]).

**ares and higan.** ares "is a descendant of higan and bsnes, and focuses on accuracy and preservation"
([ares README][ares]).
Its compatibility list rates 2,212 of 2,243 NES and Famicom titles and 226 of 237 FDS titles completable
([ares compatibility][ares-compat]), a game-completion record and not a test result.
No ares page read says how it handles the FDS BIOS
(README, site, and wiki page list). [higan][higan] is dormant: last push 2025-09-01.

**TetaNES.**
A Rust emulator on wgpu that "is a fairly accurate emulator that can play most NES titles",
with a separate core crate and a libretro core "not yet in RetroArch's Online Updater";
its mappers cover about 98.2 % of NesCartDB's games by its own table ([TetaNES README][tetanes]).

**BeesNES and TriCNES.**
BeesNES aims to be "sub-cycle–accurate", says "Hacks are to be avoided", and models NTSC, PAL, Dendy, PAL-M,
and PAL-N timing ([BeesNES README][beesnes]).
TriCNES, by the author of AccuracyCoin, has "a focus on test-driven accuracy" ([TriCNES README][tricnes]).

**RustyNES.**
It claims "AccuracyCoin 147/147" and an exact match of the nestest log ([RustyNES README][rustynes]).
Its README states that it "incorporates code derived from Mesen2 (GPL-3.0-or-later) and, for a few subsystems,
from puNES, FCEUX and Nestopia UE", which it labels GPL-2.0-or-later
(its own claim; Rustalgia records those three as walled);
that an earlier version labelled that code "oracle cross-checks" under MIT and Apache-2.0, "which was wrong";
and that it was relicensed "after a NESdev community review".
It also says its reference emulators "are black-box oracles" whose "source is never read", and that it is "AI-assisted"
(same README).
Its provenance documents (three, plus a NOTICE file and an ADR on relicensing) were not read:
the guard admits only a repository's README, licence, and contributing files,
though ADR 0006 counts documentation as prose.

**Mednafen, FCEUmm, and the QuickNES line.**
"Mednafen's NES/Famicom emulation is based off of FCE Ultra", and its documentation lists per-game MMC3 interrupt hacks
([Mednafen NES][mednafen-nes]).
FCEUmm is CaH4e3's fork of FCE Ultra for "a lot of new mappers including some obscure mappers"
([libretro FCEUmm][lr-fceumm]).
QuickNES began in 2004 from the CPU and sound cores of blargg's Game_Music_Emu
([libretro QuickNES][lr-quicknes]);
quickerNES puts performance first and "Improve accuracy, if possible" last,
for "headless re-recording for TASing and botting" ([quickerNES README][quickernes]).

**Historical emulators.**
NESticle (1997) "was the first freeware NES emulator" and the NES emulator of choice in the 1990s;
its source was copied from its author's computer without permission
(Wikipedia, ["NESticle"][wp-nesticle]), so it exists only as a leak and is never to be read.
NESdev credits fwNES with popularising the FDS file format and Marat Fayzullin's iNES with the iNES format,
and names Famtasia as the "First emulator to be supported by TASVideos" ([NESdev, "Emulators"][nes-emus]).

### SNES and Super Famicom emulators

| Emulator | Licence; tier | Status; latest release | Stars |
|---|---|---|---|
| [bsnes][bsnes] | GPL-3.0-or-later; open | maintained; nightly 2026-05-23, v115 2020-03-20 | 2,020 |
| [higan][higan] | GPL-3.0-or-later; open | dormant; v115 pre-release 2020-08-16, v110 2020-03-20 | 1,365 |
| [ares][ares] | ISC, MAME part BSD-3-Clause; open | active; v148, 2026-05-30 | 1,868 |
| [Mesen 2][mesen2], MesenCE | GPL-3.0-or-later; open | as above | as above |
| [bsnes-hd][bsnes-hd] | GPL-3.0; open | beta 10.6, 2021-06-17 | 710 |
| [bsnes-mercury][mercury] | GPL-3.0; open | libretro fork of higan; pushed 2026-09-04 | 50 |
| bsnes-jg ([mirror][bsnes-jg]) | GPL-3.0-or-later; open | pushed 2026-11-11 | 8 |
| Snes9x | own non-commercial licence; closed | 1.63, 2024-07-10 ([Wikipedia][wp-snes9x]) | — |
| [Mednafen][mednafen-snes] (snes, snes_faust) | GPLv2, "or later" unstated; walled | 1.32.1, 2024-04-05 | — |
| [BizHawk][bizhawk] | MIT own code, mixed; walled | BSNESv115+, Snes9x, Faust ([history][tas-bizhawk]) | as above |
| ZSNES; [ZSNES 2][zsnes2] | GPL-2.0; walled | discontinued 2007; fork 2.3.8, 2026-10-23 | 276 |
| [Super ZSNES][zsnes-site] | none stated; closed | v0.321, 2026 | — |
| no$sns | none; closed | v1.6, 2016-03-21 | — |

**bsnes, higan, and ares.**
The project began on 2004-10-14 as bsnes, became higan in 2012,
and was revived as bsnes "as a spin-off of higan" on 2019-02-22; ares forked from higan on 2020-03-25
([ares, "About"][ares-about]).
bsnes "focuses on performance, features, and ease of use", with "Low-level emulation of all SNES coprocessors
(DSP-n, ST-01n, Cx4)",
"Optional high-level emulation of most SNES coprocessors", a Super Game Boy through SameBoy, Satellaview emulation,
HD Mode 7, and overclocking ([bsnes README][bsnes]). higan has "an uncompromising focus on accuracy
and code readability" ([higan README][higan]). ares rates 3,107 of 3,108 SNES titles completable,
262 of 292 Satellaview titles, and 11 of 13 SuFami Turbo titles ([ares compatibility][ares-compat]).

**What their author said about accuracy.**
Near wrote in 2011 that bsnes synchronised the S-CPU 21,477,272 times a second where ZSNES did so 600,000 times,
and that ZSNES and Snes9x kept lists of about fifty popular games whose timing they tweaked
([Ars Technica, 2011][ars2011]).
In 2021: "every officially licensed SNES title is fully playable",
"cycle-level accuracy for nearly every component of the SNES.
The sole exception is the PPUs", and bsnes keeps "unsatisfying per-game hacks" for raster effects
([Ars Technica, 2021][ars2021]).
The method he describes is hardware test programs that align to exact clock cycles with the H and V counters
(same article).

**bsnes forks.** [bsnes-hd][bsnes-hd] adds HD Mode 7, widescreen, and 24-bit colour maths,
a fork that "focuses on HD and visual output". [bsnes-mercury][mercury] restores optional HLE of coprocessors,
"defaults to LLE", and keeps the ST-0011 and ST-0018 LLE. bsnes-jg, a fork of bsnes v115,
removes "accuracy-reducing hacks", and needs firmware "for DSP3, ST011, and ST018 in all cases"
([bsnes-jg README][bsnes-jg]).

**Snes9x.**
Snes9x began in 1997 from Snes96 and Snes97, and Wikipedia lists official ports from MS-DOS to Android
(Wikipedia, ["Snes9x"][wp-snes9x]).
Its licence permits use "for non-commercial purposes", and says "Commercial use includes, but is not limited to,
charging money for Snes9x or software derived from Snes9x"
(`LICENSE` of the libretro fork, `github.com/libretro/snes9x`, read as the licence file of a closed repository).
So it is closed, and its code can be neither read nor included
(inference from ADR 0006).
libretro's Snes9x 2010 core gives "more favorable performance thresholds at the cost of accuracy"
([libretro Snes9x 2010][lr-snes9x2010]).

**Mesen 2's SNES core.**
Mesen-S, its predecessor, "has been merged into Mesen" and "has stability and accuracy issues"
([Mesen-S README][mesen-s]).
Mesen 2.1.0 added the ST018 ([Mesen 2.1.0][mesen2-210]).
The SNESdev wiki's ["Tricky-to-emulate games"][sd-tricky] is "a list of various emulation bugs encountered during the
development of Mesen-S".
Whether Mesen 2 falls back to HLE without coprocessor files is not stated in the prose read
(from memory, it asks for the file).

**Mednafen.**
Its "snes" module "is a fork of bsnes v0.059"
([Mednafen SNES][mednafen-snes]);
the experimental "snes_faust" module's "Timing is approximate", and it runs the DSP-1 and DSP-2 by HLE
([Mednafen snes_faust][mednafen-faust]).

**ZSNES.**
ZSNES, mostly x86 assembly, ran from 1997 to 1.51 in 2007; it was GPL-2.0-or-later from 2001 and GPL-2.0-only from 1.50
(Wikipedia, ["ZSNES"][wp-zsnes]).
The modern fork reports that its port from assembly to C has been reached, and gives its licence as "GPL2"
([ZSNES 2 README][zsnes2]), so it is walled.
Super ZSNES, released on 2026-04-27 by the two original developers, is a rewrite from scratch that runs on the GPU
(Wikipedia, ["ZSNES"][wp-zsnes]; [Super ZSNES][zsnes-site]).
Its site offers binaries for Windows, macOS, Linux, Android, and iOS, a Patreon, a warranty disclaimer,
and a notice of copyright by ZEMU Software Inc., but no licence and no source
([Super ZSNES][zsnes-site]), so it is closed, and its download folder, `zsnes.com/files`, has a closed line.

**no$sns.**
Martin Korth's emulator is free binaries with no licence, "100% assembler code",
covering most coprocessors and the Satellaview, with a debugger ([capture of its page][nossns]); it is closed.

### Frontends, mobile, and web

- [RetroArch][retroarch] (GPL-3.0, open) is the hub for most cores; libretro documents cores for [Mesen][lr-mesen],
  [Nestopia][lr-nestopia], [FCEUmm][lr-fceumm], [QuickNES][lr-quicknes], [RustyNES][lr-rustynes], [bsnes][lr-bsnes],
  and [Snes9x][lr-snes9x], among others.
  It is on Windows, macOS, Linux, Android, iOS, Xbox, and homebrew console ports
  ([RetroArch platforms][ra-platforms]), with "5M+" downloads on Google Play ([Google Play][play-ra]).
- libretro's licence page says non-commercial cores "MAY NOT BE SOLD,
  NOR MAY THEY BE USED IN A COMMERCIAL PRODUCT OR ACTIVITY WITHOUT COPYRIGHT HOLDERS' APPROVAL",
  and lists every Snes9x core among them ([libretro][lr-licences]).
  The Snes9x core is free DLC for RetroArch on Steam ([Steam][steam-ra]).
- Free apps that ship a Snes9x core: Lemuroid
  (GPL-3.0, open),
  with FCEUmm for the NES ([Lemuroid][lemuroid]) and "5M+" downloads ([Google Play][play-lemuroid]); Delta
  (AGPL-3.0, walled),
  which uses Nestopia and Snes9x (Wikipedia, ["Delta"][wp-delta]) and has Patreon benefits
  ([Delta release notes][delta-notes]);
  Provenance (walled), whose optional subscription costs "$3.99 per month"
  ([Provenance FAQ][prov-faq])
  and whose wiki lists "LicenseRef-Snes9x" and calls Provenance BSD-3-Clause
  ([Provenance licences][prov-lic]);
  OpenEmu, with Nestopia, FCEUX, bsnes, and Snes9x
  (OpenEmu README, `github.com/OpenEmu/OpenEmu`, closed);
  and Snes9x EX+ (walled), "10M+" ([Google Play][play-snes9xex]).
- The same developer's NES.emu, "based on FCEUX", sells for $3.99 with "100K+" downloads ([Google Play][play-nesemu]).
  That the free price of Snes9x EX+ follows from the Snes9x licence is inference;
  no statement was found on the explusalpha.com pages or the two Play listings.
- NostalgiaNes, an app that "Contains ads", says it is "based on FCEUX" and has "5M+" downloads;
  its listing states no licence and links no source
  ([Google Play][play-nostalgia]), so it is closed by ADR 0006's "there is no licence" (inference).
  An ad-supported binary that names GPL-2.0 FCEUX as its basis
  but publishes no source is an open GPL question in the family, recorded as a finding (inference).
- On the web, [EmulatorJS][ejs] (GPL-3.0, open) uses FCEUmm and Snes9x as its default NES and SNES cores
  ([EmulatorJS cores][ejs-cores]),
  and [JSNES][jsnes] (Apache-2.0, open) claims
  that "it passes all 134 tests in the bundled copy of the AccuracyCoin accuracy test ROM".

### Official emulators by Nintendo

- NESdev lists Nintendo's NES emulators: one in Animal Crossing, the Classic NES Series for the GBA,
  the Virtual Console on Wii, Wii U, and 3DS, Heritage for NES Remix, Kachikachi for the NES Classic and Famicom Mini,
  and the Switch NES app; PocketNES, by third parties, was "Used commercially for some emulated re-releases by Atlus,
  Jaleco, and Konami" ([NESdev, "Emulators"][nes-emus]).
- Nintendo European Research & Development says it was "one of the main contributors to the software" of the NES
  Classic, and that it developed the SNES Classic's "software stack", including "Super FX support"
  ([NERD, NES Classic][nerd-nes]; [NERD, SNES Classic][nerd-snes]).
  The Switch NES and SNES apps build on those emulators
  ([NERD, NSO NES][nerd-nso-nes]; [NERD, NSO SNES][nerd-nso-snes]).
- On the NES Classic, "not all known mappers were included with the emulation engine"
  (Wikipedia, ["NES Classic Edition"][wp-nesclassic]).
  Nintendo published the open-source components of both Classic consoles; the emulator is not among them
  ([Nintendo OSS page, capture][nintendo-oss]; that the emulator is absent is inference).
- The Emulation General Wiki's table scores Nintendo's emulators low on AccuracyCoin: 94 of 125 for the NES Classic,
  9 to 17 of 125 for the Virtual Console (`emulation.gametechwiki.com`, NES emulators page, revision 152124; lead).

### Firmware

| Firmware | Needed for | What emulators do |
|---|---|---|
| FDS BIOS, 8 KiB | every FDS game | every one read needs the user's dump |
| S-SMP boot ROM (IPL), 64 bytes | every SNES game | no file asked for (bsnes, Snes9x) |
| DSP-n, ST010, ST011, ST018 ROMs; Cx4 data ROM | about two dozen games | LLE with user files, or HLE |
| Super Game Boy SNES program | Super Game Boy | user's file (bsnes, Mesen-S) |
| BS-X; SuFami Turbo BIOS | Satellaview; SuFami Turbo | user's file, optional in Snes9x |

- The FDS BIOS "controls the Famicom at power-on and reset, dispatches the NMI and IRQ,
  and offers an API for accessing the data on disk" ([NESdev, "FDS BIOS"][nes-fdsbios]).
  Mesen, FCEUX, Mednafen, Nestopia, FCEUmm, RustyNES, and NES.emu need the user's FDS BIOS,
  which all but Mesen and NES.emu name `disksys.rom`
  ([Mesen][mesen-gs]; [FCEUX][fceux-fds]; [Mednafen][mednafen-nes]; [libretro Nestopia][lr-nestopia];
  [libretro FCEUmm][lr-fceumm]; [libretro RustyNES][lr-rustynes]; [NES.emu][play-nesemu]),
  and the NES MiSTer core needs "the official,
  unpatched FDS BIOS" ([NES_MiSTer][nes-mister]). puNES has an option to fast-forward the BIOS, so it runs one
  (inference from [puNES v0.108][punes-108]); the prose read for ares, Nintendulator, and TetaNES does not say.
  No emulator read ships a replacement or emulates the BIOS at a high level.
- FreeDiskSysROM, LGPL-3.0, sets out to be a replacement "that can be freely redistributed",
  and says emulators "historically require a dump" (README, `github.com/jamesathey/FreeDiskSysROM`).
  As a firmware reimplementation it is closed under [ADR 0006][adr6-closed], whatever its licence.
- The SNES sound CPU's boot ROM is covered by [`R1-01`][r1-01-fw].
  Neither the bsnes nor the Snes9x core asks the user for it
  ([libretro bsnes][lr-bsnes]; [libretro Snes9x][lr-snes9x], firmware tables),
  so each carries its own copy or a replacement (inference).
- The coprocessor ROMs came from third parties.
  Near wrote that the DSP-n and ST010/ST011 program ROMs were read by decapping and "an electron microscope",
  and that "we raised over $2,500"; the DSP-n data ROMs were dumped through the chips' own commands,
  the Cx4 program sits in the game's ROM and its data ROM was dumped through a flaw in that program,
  and the ST018 was dumped through its debug commands from a cartridge ([byuu, 2012][byuunews]; lead).
  The 2011 article describes the decapping method ([Ars Technica][ars2011]).
  An owner cannot read the decapped program ROMs with cartridge tools, and the other images need code run on the chip,
  not a cartridge dumper (inference from the same post),
  so [`R0-02`][r0-02-o4] option 4 is in practice a third-party copy for the program ROMs.
- The other route is HLE, which bsnes, bsnes-mercury, bsnes-jg, and Mednafen's snes_faust offer for some chips
  ([bsnes][bsnes]; [bsnes-mercury][mercury]; [bsnes-jg][bsnes-jg]; [Mednafen][mednafen-faust]).
  Wikipedia says only that ZSNES emulated several chips "at some level" ([Wikipedia, "ZSNES"][wp-zsnes]).
  Near wrote that HLE ignores timing,
  and that of the chips emulated that way only the DSP-1 and DSP-2 gave exact results ([byuu][byuunews]; lead).
  Another project's HLE of a coprocessor ROM is closed ([ADR 0006][adr6-closed]).
- higan's documentation says that "co-processor firmware cannot legally be distributed,
  so you'll need to obtain copies of the relevant firmware data yourself" ([higan, "Importing"][higan-import]).
- The Super Game Boy program, BS-X, and SuFami Turbo BIOS are cartridge ROMs, which an owner can dump like a game
  (inference; [`R1-05`][r1-05-addons]).
  bsnes requires the Super Game Boy image and BS-X.bin and treats the coprocessor files as optional
  ([libretro bsnes][lr-bsnes]).

### Legal exposure

This builds on [`R0-02`][r0-02], cited by section.

- **Encryption.**
  Neither family's games are encrypted; the checks are the lock-out chips and the FDS licence check
  ([`R1-01`, "Lock-out"][r1-01-lock]).
  No § 1201 claim against an emulator of an unencrypted system was found
  ([`R0-02`, "Which systems the claims concern"][r0-02-which]), so option 1 applies ([`R0-02`][r0-02-o1]).
- **The lock-out as an access control.**
  In 1992 the Federal Circuit wrote "Nintendo's 10NES program thus controls access to the NES",
  and held that "Atari could lawfully deprocess Nintendo's 10NES chips to learn their unprotected ideas and processes",
  but that reverse engineering must be "untainted by the purloined copy of the 10NES program"
  ([Atari v Nintendo][atari]).
  That was before § 1201, and whether a lock-out is a measure under it is undecided ([`R0-02`][r0-02-undecided]).
  An emulator that runs no CIC program needs none (inference), and the NES image header describes no CIC program
  (inference from [NESdev, "NES 2.0"][nes-nes2]); no SNES image-format page was read on this point.
- **Cheats.**
  The Game Genie case concerned NES games ([Galoob v Nintendo][galoob]); [`R0-02`][r0-02-deriv] records the holding.
- **Patents.**
  The CIC patents ([US 4,799,635][us4799635], [US 5,070,479][us5070479]),
  Macronix's patent on a third-party cartridge circuit that passes the lock-out
  ([US 5,004,232][us5004232]),
  the mapper patent ([US 4,949,298][us4949298]), the DMA and video patents
  ([US 5,291,189][us5291189], [US 5,327,158][us5327158]),
  and Sony's SNES audio patents ([US 5,086,475][us5086475], [US 5,761,643][us5761643]) show
  as expired on Google Patents, which says its status is not a legal conclusion.
  Expired patents are open under option 12 ([`R0-02`][r0-02-o12]), whoever holds them;
  the residual patent risk is the system-agnostic emulation patents in [`R0-02`, "Patents on emulation"][r0-02-patents].
- **Firmware.**
  The firmware above raises options 4 and 5 ([`R0-02`][r0-02-o4], [option 5][r0-02-o5]).
  The S-DD1 was first emulated with "graphics packs" of decompressed game data
  (Wikipedia, ["List of Super NES enhancement chips"][wp-chips]), a game-copy exposure of the past (inference).
- **Boot logos.**
  The FDS BIOS checks that a licence message is present before running a game,
  and the drive takes only disks moulded with "NINTENDO"
  ([`R1-05`][r1-05-addons]; [NESdev, "Family Computer Disk System"][nes-fds]).
  The message is a file on the disk ([NESdev, "FDS BIOS"][nes-fdsbios]),
  so a boot path that makes no comparison needs no copy of it,
  the shape [`R0-02`, "Boot logos"][r0-02-logos] gives for the Game Boy (inference),
  so option 16 applies ([`R0-02`][r0-02-o16]).
  The NESdev description of the check rests partly on BIOS analysis
  (inference from its references), so only what a player sees is recorded here.
- **Takedowns.**
  A code search of [GitHub's takedown archive][dmca] on 2026-11-22 for "snes9x", "zsnes", "bsnes", "Super Famicom",
  "Super NES", and "Super Nintendo" found nothing; "SNES" gave 40 hits, of which one is relevant:
  a private author's notice about his own tool's leaked source; "higan" gave only unrelated notices
  (research log, repeated by the verification pass, which also found nothing for "nestopia", "fceux", "nesticle",
  and "NES emulator").
  [`R0-02`][r0-02-reached] found none against bsnes either,
  and a web search for NES emulator notices found only other systems'.
- **A store removal.**
  John NES and John SNES left Google Play, by their developer's account "due to alleged trademark infringement",
  after a complaint by an agent of Nintendo of America ([John emulators][john]).
  Web Archive captures put the removal between 2018 and 2019 (calculated from the capture dates).
  The successor drops both names (inference), which fits option 14 ([`R0-02`][r0-02-o14]);
  the case is new to [`R0-02`, "Design rights, stores, and project names"][r0-02-stores].
- **Maker statements.**
  Nintendo's former page said that if vintage titles "are available far and wide,
  it undermines the value of this intellectual property"
  ([Nintendo, 2017 capture][nintendo-legal]); [`R0-02`][r0-02-makers] records the current page.
  Nintendo sells these games through its own emulators
  (see "Official emulators by Nintendo"),
  and Wikipedia cites the Virtual Console as one of its reasons for opposing piracy of old games
  (Wikipedia, ["Virtual Console"][wp-vc]).
- **Licences in the family.**
  Snes9x's non-commercial licence reaches many free apps and stores; no complaint by its authors was found
  (web searches, research log; a search cannot be repeated exactly).
  RustyNES shows provenance failing in a public, AI-assisted Rust project,
  and MesenCE shows a project banning AI-generated code;
  both bear on [`R0-06`][r0-06-others] and [`R0-03`][r0-03-contrib] (inference).
- **Japan.**
  The Famicom has no lock-out chip, and the FDS check is a licence-message check;
  no source says whether Japan's rules on technological measures
  ([`R0-02`, "Japan"][r0-02-japan]) reach it, which is recorded as a risk.

### Difficulty and tests

[`R1-01`][r1-01] sets out what the hardware asks; this section adds the family's test record.

- NESdev's list of tricky games has 57 entries, some covering several games,
  among them Battletoads for "fairly precise CPU and PPU timing", Punch-Out!!'s MMC2, and StarTropics,
  whose corruption "might not be possible to emulate correctly with current knowledge"
  ([NESdev, "Tricky-to-emulate games"][nes-tricky]; counted from its list).
- The mapper grid documents 526 of 768 numbers in the first three NES 2.0 planes, many of them bootleg boards
  ([NESdev, "Mapper"][nes-mapper]; counted from the grid),
  and NES 2.0's 12-bit field allows 4,096 (calculated from [NESdev, "NES 2.0"][nes-nes2]).
  The wiki allocates a number to whoever has a hardware implementation,
  or an emulator implementation with a sketch of the hardware, and cites emulator source among its references
  (same "Mapper" page).
- DMC DMA can add reads of the controller and `0x2007`, and "The 2A07 fixes these extra read problems,
  but the mechanism is not yet understood" ([NESdev, "DMA"][nes-dma]).
- The SNES list of tricky games names ActRaiser 2
  and Tales of Phantasia among games needing the sound CPU stepped "1 cycle at a time,
  rather than 1 instruction at a time" ([SNESdev, "Tricky-to-emulate games"][sd-tricky]).
  Console revisions cannot all be told apart by software:
  "There is no known method to programmatically detect 1-CHIP consoles",
  and the page cites ares's source for one revision's timing change ([SNESdev, "Version differences"][sd-version]).
- Supafaust recommends at least a dual-core CPU at 1200 MHz for Super FX, SA-1, and Cx4 games
  ([Supafaust README][supafaust]),
  and NERD says its Super FX support brought Yoshi's Island and the Star Fox games to emulation
  for the first time ([NERD][nerd-snes]), so the coprocessors set the performance bar on phones (inference).

Test suites and their oracles:

| Suite | System | Oracle | Published results |
|---|---|---|---|
| [AccuracyCoin][accoin], 147 tests | NES | hardware, RP2A03G and RP2C02G | none in the suite |
| TASVideos table, 156 tests | NES | tests' own checks | 2026 page |
| [nestest][nes-tests] | NES CPU | Nintendulator's log | — |
| [65x02][sst65x02], [65816][sst65816], [spc700][sstspc] vectors | CPUs | emulators; 65816 not stated | none |
| [gilyon snes-tests][gilyon] | 65C816, SPC700 | author's generator | none |
| [undisbeliever snes-test-roms][undis] | SNES | compared on a console ([`R0-05`][r0-05]) | none |
| TASVideos SNES table, 59 tests | SNES | tests' checks, Nintendo's programs | 2014 |

- AccuracyCoin "was designed for an NTSC console with an RP2A03G CPU and RP2C02G PPU";
  it has 147 tests and publishes no emulator results ([AccuracyCoin README][accoin]).
  Results quoted against 125, 139, 141, 144, or 147 tests come from different versions and are not comparable.
- The projects' own AccuracyCoin claims are given with each emulator above.
  The Emulation General Wiki's table, a user-edited lead, gives against 147: Nestopia JG and UE 145, BeesNES 145,
  MesenCE 143, NintendulatorNRS 133, BizHawk NesHawk 130, ares 123, Nintendulator 109, puNES 102, FCEUX 84;
  and against 144: the NES MiSTer core 144 (`emulation.gametechwiki.com`, NES emulators page, revision 152124; lead).
- [TASVideos's NES table][tas-nes] says it "may contain out of date information"; Nestopia 1.53.1, Mesen,
  and BizHawk score 156 of 156, puNES 153, Nintendulator 133, QuickNES 108, and FCEUX 75 to 84.
  Real consoles with flash carts score 123 to 132, so a full score means agreement with the tests' expectations,
  not with one console (inference).
- [TASVideos's SNES table][tas-snes] of 2014 scores higan v094 and lsnes 59 of 59, BizHawk 55, Snes9x 1.53 53,
  and ZSNES 1.51 42; 30 of its tests are Nintendo's own programs, which [`R0-05`][r0-05] says must not be used,
  so only the reported results are cited.
- gilyon's CPU test does "not test" cycle counts, interrupts, or registers ([gilyon cputest][gilyon-cpu]).
  No current per-emulator SNES result table was found (one web search, and the hubs' test pages).

### Register re-checks

ADR 0006 asks a family survey to check again the tier of each emulator it covers ([ADR 0006][adr6-eval]).

- Confirmed with no change: bsnes, higan, ares, Mesen 2, MesenCE, TetaNES, BizHawk, Snes9x
  (through the libretro fork's licence file),
  Delta, the NES MiSTer core (`mister-devel/`), the Nintendulator site, RetroArch, Mednafen's site, AccuracyCoin,
  gilyon, undisbeliever, and the SingleStepTests sets.
  The guard blocked GitHub metadata for BizHawk, Delta, and Snes9x during verification,
  so their lines rest on the research pass and their prose.
- Mednafen still says only "GNU GPLv2" ([Mednafen][mednafen]), while Debian reads GPL-2+ ([Debian][deb-mednafen]);
  it stays walled under the process call above.
- Provenance's licence file, read again through GitHub's licence endpoint,
  still bars the project's name and branding from commercial redistributions, so the walled line stands;
  its wiki calls it "BSD 3-Clause License" and leaves that clause out ([Provenance][prov-lic]).
- gilyon's test READMEs show its expected values come from the author's generator
  ([gilyon cputest][gilyon-cpu]);
  the register's note predates that, and the line is left, because neither licence nor tier changed.

## Options and trade-offs

### Emulator studies as the roadmap lists them

- **What:** keep [`R1-50`][studies] bsnes, `R1-51` Snes9x, `R1-60` ares, `R1-61` Mesen, `R1-64` BizHawk,
  and `R1-67` TetaNES as written.
- **Costs:** Snes9x is closed, so `R1-51` cannot read code; BizHawk is walled and needs a reader session; Nestopia JG,
  among the open-tier NES cores with the highest reported results, has no study.
- **Gains:** no roadmap change.
- **Used by:** the roadmap as approved.

### Emulator studies with two changes

- **What:** mark [`R1-51`][studies] as documentation and behaviour only, as `R1-40` DuckStation is,
  and add a study of Nestopia JG.
- **Costs:** one more study; Nestopia's history lies in walled repositories, so the study reads the open libretro port,
  or the upstream once its own licence file confirms the port's statement.
- **Gains:** every NES study can read code where [ADR 0006][adr6] allows; Mesen and Nestopia,
  two of the lines that lead the test results, are both covered.
- **Used by:** the roadmap already does this for DuckStation.

### AccuracyCoin and hardware-referenced suites as the NES oracle

- **What:** accept NES behaviour when [AccuracyCoin][accoin] and the TASVideos-listed suites pass on the RP2A03G
  and RP2C02G default; for the SNES, [undisbeliever][undis] and [gilyon][gilyon], plus the tricky-games lists.
- **Costs:** AccuracyCoin targets one revision; gilyon's expected values come from its author's generator,
  and the TASVideos-listed suites rest on their own checks, which real consoles fail in part;
  the SNES has no current hardware-referenced suite of AccuracyCoin's breadth.
- **Gains:** AccuracyCoin and undisbeliever are referenced to consoles, not to another emulator,
  and results can be stated against a pinned version.
- **Used by:** TriCNES, RustyNES, and MesenCE report AccuracyCoin results, as do Nestopia and JSNES.

### A reference emulator's output as the oracle

- **What:** compare Rustalgia's traces or frames with a respected emulator's output, run as a program.
- **Costs:** encodes that emulator's errors; running a walled or closed emulator is allowed, reading it is not.
- **Gains:** covers games and chips that no test suite covers, such as the coprocessors.
- **Used by:** RustyNES, which calls its references "black-box oracles"; nestest's log is Nintendulator's
  ([NESdev, "Emulator tests"][nes-tests]).

### FDS: the user's BIOS

- **What:** require the user's FDS BIOS, as every emulator read does.
- **Costs:** no decision makes the user's copy lawful ([`R0-02`][r0-02-o4]); FDS games do not run without it.
- **Gains:** exact behaviour, with no reimplementation to write.
- **Used by:** Mesen, FCEUX, Nestopia, Mednafen, RustyNES, and the NES MiSTer core.

### FDS: Rustalgia's own boot path and disk calls

- **What:** write a replacement from hardware descriptions and tests, showing only what the disk loads,
  with the user's BIOS as an option.
- **Costs:** the work; the NESdev BIOS page rests partly on BIOS analysis, so each behaviour needs a test;
  others' replacements are closed.
- **Gains:** option 5's position ([`R0-02`][r0-02-o5]); FDS games run without maker code.
- **Used by:** no emulator read; FreeDiskSysROM (closed) aims at it.

### SNES coprocessors: LLE with the user's chip images

- **What:** emulate the DSP-n, ST01x, and Cx4 data ROM from images the user supplies.
- **Costs:** the DSP-n and ST010/ST011 program ROMs came from third-party decapping,
  so the user's copy of those is in practice someone else's; about two dozen games need them.
- **Gains:** exact timing and results.
- **Used by:** higan, bsnes-jg, and bsnes and bsnes-mercury by default.

### SNES coprocessors: Rustalgia's own HLE

- **What:** write each chip's behaviour from observed inputs and outputs and the chip's documented interface.
- **Costs:** timing is lost, and Near counted only two chips as bit-perfect under HLE (lead);
  the ST011 and ST018 games may need LLE.
- **Gains:** no maker code; the games run for users without the images.
- **Used by:** bsnes, bsnes-mercury, bsnes-jg, and Mednafen offer HLE, which is closed to Rustalgia.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** the two changes.
  Snes9x's licence closes its code, and Nestopia JG is among the open-tier NES lines with the strongest published
  results.
- **Oracle:** AccuracyCoin and the hardware-referenced suites as acceptance, pinned by version and revision,
  with a reference emulator's output as a diagnostic only.
  AccuracyCoin and undisbeliever were checked on consoles, while an emulator's output carries its errors.
- **FDS:** Rustalgia's own boot path as the default and the user's BIOS as an option, as [`R0-02`][r0-02-o5] recommends
  (option 5).
  The disk supplies the licence message, so the boot path needs no copy of it.
- **Coprocessors:** Rustalgia's own HLE as the default, with LLE from user images as an option, and the ST011 and ST018,
  for which bsnes-mercury has no HLE, left to LLE until their behaviour is measured (the DSP-3 may join them).
  The program ROMs came from decapping, and nobody else's HLE may be read.
- **Sound boot ROM:** a replacement written from the observed upload behaviour, as [`R0-02`][r0-02-o5] recommends
  (option 5),
  within [`R1-01`][r1-01-fw]'s rule that it be written from hardware descriptions and tests; it feeds [`R2-12`][ph2].

## Implications for Rustalgia

- Both families sit under [`R0-02`][r0-02-o1] option 1, so they suit early work in [`R6-01`][ph6] (inference);
  the FDS and the coprocessor chips are the parts that need firmware decisions in [`R2-12`][ph2].
- The roadmap's emulator studies need the changes above,
  and each study of an open-tier SNES emulator must first list and close its coprocessor HLE folders in the register.
- The test oracle choice feeds the quality targets ([`R6-02`][ph6]) and test tooling ([`R2-15`][ph2]).
- [RustyNES][rustynes]'s relicensing and [MesenCE][mesence]'s ban on AI-generated code are evidence
  for [`R0-06`][r0-06]'s controls and for the contribution rules of [`R0-03`][r0-03-contrib].
- A non-affiliation statement and a name free of "NES" and "SNES" meet the one store removal found (inference);
  this feeds the store work in [`R3-03` and `R3-06`][ph3].
- The feature baseline ([`R1-92`][synth]) should note that respected NES emulators expose revision options and
  that SNES ones offer HD Mode 7, run-ahead, and overclocking.

## Open questions

- Which folders of [bsnes][bsnes], [higan][higan], [ares][ares], and [Mesen][mesen2] hold coprocessor HLE,
  and do Mesen 2 and ares fall back to HLE?
  The studies [`R1-50`, `R1-60`, and `R1-61`][studies], from a file listing.
- How do the open-tier SNES emulators score on [gilyon][gilyon]'s and [undisbeliever][undis]'s suites today?
  A spike that runs them ([phase 5][ph5]).
- Do bsnes and Snes9x carry a copy of the sound unit's 64-byte boot ROM, or a replacement?
  The emulator studies.

## Sources

Every source below was read on 2026-11-22, as raw text, unless an entry says otherwise.
Addresses in code spans are closed and are not to be opened.

Repositories (README, licence, and metadata through the GitHub API; release pages as named):

- [AccuracyCoin][accoin] (README blob `699da69`); [TriCNES][tricnes] (README blob `594ce08`); [BeesNES][beesnes]
  (README blob `2d05067`); [RustyNES][rustynes] (README blob `3345188`); [TetaNES][tetanes] (README blob `8bd7ac8`).
- [Mesen 2][mesen2] (README blob `31385b4`), [Mesen 2.1.0 release][mesen2-210], [Mesen][mesen1]
  (README blob `a122c7e`),
  [Mesen-S][mesen-s], [MesenCE][mesence]
  (README blob `c74467a`, `CONTRIBUTING.md`), [MesenCE 2.2.0 release][mesence-220].
- [FCEUX][fceux] (README blob `ad127a3`); [puNES][punes]
  (README blob `fc5eedc`), [puNES v0.111][punes-111] and [v0.108][punes-108] releases.
- [Nestopia UE][nestopia-ue] (README blob `4b1936f`); [libretro Nestopia][lr-nestopia-repo] (README blob `6ae5cde`).
- [BizHawk][bizhawk]; [quickerNES][quickernes]; [NES_MiSTer][nes-mister]; [ares][ares]
  (README blob `1055dc0`);
  [higan][higan] (README blob `753c592`); [bsnes][bsnes]
  (README blob `1f2aca7`);
  [bsnes-hd][bsnes-hd]; [bsnes-mercury][mercury]; [bsnes-jg][bsnes-jg]
  (README blob `05babbc`); [Supafaust][supafaust]; [ZSNES 2][zsnes2] (README blob `4b4eb6b`).
  The guard blocked README pins for the walled and newly registered repositories in this group.
- [gilyon snes-tests][gilyon] (README blob `058d3df`) and its [cputest README][gilyon-cpu];
  [undisbeliever snes-test-roms][undis]; [SingleStepTests 65x02][sst65x02] (README blob `0b14454`), [65816][sst65816]
  (README blob `f3e2782`), and [spc700][sstspc].
- [RetroArch][retroarch] (README blob `5aba369`); [Lemuroid][lemuroid]; [EmulatorJS][ejs]; [JSNES][jsnes]
  (README blob `7bd6971`).
- Closed repositories, prose only: `github.com/quietust/nintendulator` (metadata), `github.com/libretro/snes9x`
  (`LICENSE` blob `ca6de27`),
  `github.com/OpenEmu/OpenEmu` (README blob `9db9eca`), and `github.com/jamesathey/FreeDiskSysROM` (README).
- Closed web pages, read before they were closed: `symphoniae.com/nrs/NintendulatorNRS/`
  (directory index),
  and `https://emulation.gametechwiki.com/index.php/Nintendo_Entertainment_System_emulators`
  (revision 152124, 2026-11-13), closed as a precaution because it mentions leaked source.

Project sites and documentation:

- [libretro Mesen2][lr-mesen2] (port of MesenCE).
- mesen.ca: ["Getting Started"][mesen-gs] and ["Emulation settings"][mesen-emu] (documentation of 0.9.9).
- FCEUX: [home][fceux-site], [version history][fceux-ver], ["Famicom Disk System"][fceux-fds].
- [Nestopia UE site][nestopia-site] (news of 2026-09-13); [Jolly Good Emulation][jgemu].
- [Nintendulator][nintendulator] (beta of 2026-08-22).
- [Super ZSNES][zsnes-site] (v0.321).
- Mednafen: [home][mednafen], [NES][mednafen-nes], [SNES][mednafen-snes], and [snes_faust][mednafen-faust]
  (documentation valid as of 1.32.1).
- ares: [compatibility][ares-compat], ["About"][ares-about].
- [higan, "Importing"][higan-import].
- [no$sns][nossns], in the Web Archive capture of 2026-11-03 10:00:25, because the live page refuses scripts.
- libretro documentation (pages of October 2026): [Mesen][lr-mesen], [Nestopia][lr-nestopia], [FCEUmm][lr-fceumm],
  [QuickNES][lr-quicknes], [RustyNES][lr-rustynes], [bsnes][lr-bsnes], [Snes9x][lr-snes9x],
  [Snes9x 2010][lr-snes9x2010], [licences][lr-licences].
- [RetroArch platforms][ra-platforms]; [Delta release notes][delta-notes];
  [Provenance, "Open Source Licenses"][prov-lic] and [FAQ][prov-faq]; [EmulatorJS cores][ejs-cores];
  [John emulators, removal notice][john] (undated).
- [byuu, "SNES coprocessors: the future has arrived"][byuunews] (2012-03-06; a personal blog, so a lead).

Community references (raw wikitext, with the revision read):

- NESdev wiki: ["Emulator tests"][nes-tests] (24686), ["Emulators"][nes-emus] (23831), ["Accuracy"][nes-acc] (23181),
  ["Tricky-to-emulate games"][nes-tricky] (24630), ["Mapper"][nes-mapper] (24625), ["NES 2.0"][nes-nes2] (24464),
  ["DMA"][nes-dma] (23450), ["FDS BIOS"][nes-fdsbios] (24615), ["Family Computer Disk System"][nes-fds] (24640).
- SNESdev wiki: ["Tricky-to-emulate games"][sd-tricky] (1221), ["Version differences"][sd-version] (1328).
- TASVideos: ["EmulatorResources"][tas-res] (edited 2026-11-13), ["NESAccuracyTests"][tas-nes]
  (edited 2026-09-15),
  ["SNESAccuracyTests"][tas-snes] (edited 2014-10-27), [BizHawk release history][tas-bizhawk] (edited 2026-05-31).

Tertiary and press:

- Wikipedia, with the revision read: ["NESticle"][wp-nesticle] (1386318118), ["Nestopia"][wp-nestopia] (1376313437),
  ["NES Classic Edition"][wp-nesclassic] (1386306036), ["Snes9x"][wp-snes9x] (1375488534), ["ZSNES"][wp-zsnes]
  (1357902263), ["Delta"][wp-delta] (1381633316), ["Virtual Console"][wp-vc] (1386423035), and
  ["List of Super NES enhancement chips"][wp-chips] (1365140998).
- Ars Technica, ["Accuracy takes power"][ars2011] (2011-08-09)
  and ["How SNES emulators got a few pixels from complete perfection"][ars2021] (2021-06-28), both by Near.

Maker material, law, and patents:

- Nintendo European Research & Development: [NES Classic][nerd-nes] (November 2016), [SNES Classic][nerd-snes]
  (September 2017), [NSO NES][nerd-nso-nes] (September 2018), [NSO SNES][nerd-nso-snes] (September 2019).
- [Nintendo OSS page][nintendo-oss], capture of 2026-11-11 00:17:28; [Nintendo legal page][nintendo-legal],
  capture of 2017-01-01 22:59:39.
- [Atari v Nintendo][atari], 975 F.2d 832 (Federal Circuit, 1992); [Galoob v Nintendo][galoob], 964 F.2d 965
  (Ninth Circuit, 1992).
- Google Patents: [US 4,799,635][us4799635], [US 5,070,479][us5070479], [US 5,004,232][us5004232],
  [US 4,949,298][us4949298], [US 5,291,189][us5291189], [US 5,327,158][us5327158], [US 5,086,475][us5086475],
  [US 5,761,643][us5761643].
- [GitHub's takedown archive][dmca], searched 2026-11-22.

Stores and packagers:

- Google Play: [RetroArch][play-ra], [Lemuroid][play-lemuroid], [NES.emu][play-nesemu], [Snes9x EX+][play-snes9xex],
  [NostalgiaNes][play-nostalgia]; [Steam, RetroArch][steam-ra].
- [Flathub statistics API][flathub-stats]
  (`flathub.org/api/v2/stats/` followed by each app ID named in the findings); [Flathub, puNES][flathub-punes].
- Debian copyright files: [FCEUX][deb-fceux], [Mednafen][deb-mednafen], [Nestopia][deb-nestopia].

Project documents:

- [`R0-02`][r0-02], [`R0-03`][r0-03], [`R0-05`][r0-05], [`R0-06`][r0-06], [`R1-01`][r1-01], and [`R1-05`][r1-05].
- [ADR 0006][adr6], [the source register][register], and [the research roadmap][roadmap].

[r0-02]: R0-02-legal-baseline.md
[r0-02-which]: R0-02-legal-baseline.md#which-systems-the-claims-concern
[r0-02-undecided]: R0-02-legal-baseline.md#questions-no-court-was-found-to-have-decided
[r0-02-deriv]: R0-02-legal-baseline.md#derivative-works-loading-and-ownership
[r0-02-patents]: R0-02-legal-baseline.md#patents-on-emulation
[r0-02-logos]: R0-02-legal-baseline.md#boot-logos
[r0-02-reached]: R0-02-legal-baseline.md#who-has-been-reached
[r0-02-stores]: R0-02-legal-baseline.md#design-rights-stores-and-project-names
[r0-02-makers]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r0-02-japan]: R0-02-legal-baseline.md#japan
[r0-02-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r0-02-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r0-02-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r0-02-o12]: R0-02-legal-baseline.md#12-read-expired-patents-only-as-documentation
[r0-02-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r0-02-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r0-03]: R0-03-licence-strategy.md
[r0-03-contrib]: R0-03-licence-strategy.md#contributions-written-by-agents
[r0-05]: R0-05-source-map.md
[r0-06]: R0-06-provenance-controls.md
[r0-06-others]: R0-06-provenance-controls.md#how-other-projects-treat-and-record-ai-involvement
[r1-01]: R1-01-primer-8-and-16-bit.md
[r1-01-fw]: R1-01-primer-8-and-16-bit.md#boot-roms-and-firmware
[r1-01-lock]: R1-01-primer-8-and-16-bit.md#lock-out
[r1-05]: R1-05-catalogue-8-and-16-bit.md
[r1-05-addons]: R1-05-catalogue-8-and-16-bit.md#add-ons-that-act-as-systems
[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-kinds]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#sources-that-are-not-emulators
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[register]: ../../../.claude/hooks/source-register.txt
[roadmap]: ../../roadmap/research.md
[fam]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[synth]: ../../roadmap/research.md#landscape-synthesis
[ph2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[ph3]: ../../roadmap/research.md#phase-3-host-platforms
[ph5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[ph6]: ../../roadmap/research.md#phase-6-synthesis
[accoin]: https://github.com/100thCoin/AccuracyCoin
[tricnes]: https://github.com/100thCoin/TriCNES
[beesnes]: https://github.com/L-Spiro/BeesNES
[rustynes]: https://github.com/doublegate/RustyNES
[tetanes]: https://github.com/lukexor/tetanes
[mesen2]: https://github.com/SourMesen/Mesen2
[mesen2-210]: https://github.com/SourMesen/Mesen2/releases/tag/2.1.0
[mesen1]: https://github.com/SourMesen/Mesen
[mesen-s]: https://github.com/SourMesen/Mesen-S
[mesence]: https://github.com/nesdev-org/MesenCE
[mesence-220]: https://github.com/nesdev-org/MesenCE/releases/tag/2.2.0
[mesen-gs]: https://www.mesen.ca/docs/gettingstarted.html
[mesen-emu]: https://www.mesen.ca/docs/configuration/emulation.html
[fceux]: https://github.com/TASEmulators/fceux
[fceux-site]: https://fceux.com/web/home.html
[fceux-ver]: https://fceux.com/web/version.html
[fceux-fds]: https://fceux.com/web/help/FamicomDiskSystem.html
[punes]: https://github.com/punesemu/puNES
[punes-111]: https://github.com/punesemu/puNES/releases/tag/v0.111
[punes-108]: https://github.com/punesemu/puNES/releases/tag/v0.108
[nestopia-ue]: https://github.com/0ldsk00l/nestopia
[nestopia-site]: http://0ldsk00l.ca/nestopia/
[lr-nestopia-repo]: https://github.com/libretro/nestopia
[jgemu]: https://jgemu.gitlab.io/
[nintendulator]: https://www.qmtpro.com/~nes/nintendulator/
[bizhawk]: https://github.com/TASEmulators/BizHawk
[tas-bizhawk]: https://tasvideos.org/BizHawk/ReleaseHistory
[quickernes]: https://github.com/ToolAssisted-run/chimera-core-quickernes
[nes-mister]: https://github.com/MiSTer-devel/NES_MiSTer
[ares]: https://github.com/ares-emulator/ares
[ares-compat]: https://ares-emu.net/compatibility
[ares-about]: https://ares-emu.net/about
[higan]: https://github.com/higan-emu/higan
[higan-import]: https://higan.readthedocs.io/en/stable/guides/import/
[bsnes]: https://github.com/bsnes-emu/bsnes
[bsnes-hd]: https://github.com/DerKoun/bsnes-hd
[mercury]: https://github.com/libretro/bsnes-mercury
[bsnes-jg]: https://github.com/libretro/bsnes-jg
[supafaust]: https://github.com/libretro/supafaust
[zsnes2]: https://github.com/xyproto/zsnes
[zsnes-site]: https://www.zsnes.com/
[mednafen]: https://mednafen.github.io/
[mednafen-nes]: https://mednafen.github.io/documentation/nes.html
[mednafen-snes]: https://mednafen.github.io/documentation/snes.html
[mednafen-faust]: https://mednafen.github.io/documentation/snes_faust.html
[nossns]: https://web.archive.org/web/20261103100025/https://problemkaputt.de/sns.htm
[byuunews]: https://byuunews.blogspot.com/2012/03/snes-coprocessors-future-has-arrived.html
[ars2011]: https://arstechnica.com/gaming/2011/08/accuracy-takes-power-one-mans-3ghz-quest-to-build-a-perfect-snes-emulator/
[ars2021]: https://arstechnica.com/gaming/2021/06/how-snes-emulators-got-a-few-pixels-from-complete-perfection/
[lr-mesen]: https://docs.libretro.com/library/mesen/
[lr-mesen2]: https://docs.libretro.com/library/mesen2/
[lr-nestopia]: https://docs.libretro.com/library/nestopia/
[lr-fceumm]: https://docs.libretro.com/library/fceumm/
[lr-quicknes]: https://docs.libretro.com/library/quicknes/
[lr-rustynes]: https://docs.libretro.com/library/rustynes/
[lr-bsnes]: https://docs.libretro.com/library/bsnes/
[lr-snes9x]: https://docs.libretro.com/library/snes9x/
[lr-snes9x2010]: https://docs.libretro.com/library/snes9x_2010/
[lr-licences]: https://docs.libretro.com/development/licenses/
[retroarch]: https://github.com/libretro/RetroArch
[ra-platforms]: https://www.retroarch.com/platforms.html
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[prov-lic]: https://wiki.provenance-emu.com/legal/open-source-licenses
[prov-faq]: https://provenance-emu.com/faq/
[delta-notes]: https://faq.deltaemulator.com/release-notes
[ejs]: https://github.com/EmulatorJS/EmulatorJS
[ejs-cores]: https://emulatorjs.org/docs4devs/cores/
[jsnes]: https://github.com/bfirsh/jsnes
[john]: https://sites.google.com/site/johnemulators/john-nes-and-john-snes-has-been-removed-from-google-play
[play-ra]: https://play.google.com/store/apps/details?id=com.retroarch
[play-lemuroid]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[play-nesemu]: https://play.google.com/store/apps/details?id=com.explusalpha.NesEmu
[play-snes9xex]: https://play.google.com/store/apps/details?id=com.explusalpha.Snes9xPlus
[play-nostalgia]: https://play.google.com/store/apps/details?id=com.nostalgiaemulators.neslite
[steam-ra]: https://store.steampowered.com/app/1118310/RetroArch/
[flathub-stats]: https://flathub.org/api/v2/stats/dev.bsnes.bsnes
[flathub-punes]: https://flathub.org/api/v2/appstream/io.github.punesemu.puNES
[deb-fceux]: https://metadata.ftp-master.debian.org/changelogs/main/f/fceux/unstable_copyright
[deb-mednafen]: https://metadata.ftp-master.debian.org/changelogs/main/m/mednafen/unstable_copyright
[deb-nestopia]: https://metadata.ftp-master.debian.org/changelogs/main/n/nestopia/unstable_copyright
[nes-tests]: https://www.nesdev.org/w/index.php?title=Emulator_tests&oldid=24686
[nes-emus]: https://www.nesdev.org/w/index.php?title=Emulators&oldid=23831
[nes-acc]: https://www.nesdev.org/w/index.php?title=Accuracy&oldid=23181
[nes-tricky]: https://www.nesdev.org/w/index.php?title=Tricky-to-emulate_games&oldid=24630
[nes-mapper]: https://www.nesdev.org/w/index.php?title=Mapper&oldid=24625
[nes-nes2]: https://www.nesdev.org/w/index.php?title=NES_2.0&oldid=24464
[nes-dma]: https://www.nesdev.org/w/index.php?title=DMA&oldid=23450
[nes-fdsbios]: https://www.nesdev.org/w/index.php?title=FDS_BIOS&oldid=24615
[nes-fds]: https://www.nesdev.org/w/index.php?title=Family_Computer_Disk_System&oldid=24640
[sd-tricky]: https://snes.nesdev.org/w/index.php?title=Tricky-to-emulate_games&oldid=1221
[sd-version]: https://snes.nesdev.org/w/index.php?title=Version_differences&oldid=1328
[tas-res]: https://tasvideos.org/EmulatorResources
[tas-nes]: https://tasvideos.org/EmulatorResources/NESAccuracyTests
[tas-snes]: https://tasvideos.org/EmulatorResources/SNESAccuracyTests
[gilyon]: https://github.com/gilyon/snes-tests
[gilyon-cpu]: https://github.com/gilyon/snes-tests/blob/main/cputest/README.md
[undis]: https://github.com/undisbeliever/snes-test-roms
[sst65x02]: https://github.com/SingleStepTests/65x02
[sst65816]: https://github.com/SingleStepTests/65816
[sstspc]: https://github.com/SingleStepTests/spc700
[wp-nesticle]: https://en.wikipedia.org/w/index.php?title=NESticle&oldid=1386318118
[wp-nestopia]: https://en.wikipedia.org/w/index.php?title=Nestopia&oldid=1376313437
[wp-nesclassic]: https://en.wikipedia.org/w/index.php?title=NES_Classic_Edition&oldid=1386306036
[wp-snes9x]: https://en.wikipedia.org/w/index.php?title=Snes9x&oldid=1375488534
[wp-zsnes]: https://en.wikipedia.org/w/index.php?title=ZSNES&oldid=1357902263
[wp-delta]: https://en.wikipedia.org/w/index.php?title=Delta_(emulator)&oldid=1381633316
[wp-vc]: https://en.wikipedia.org/w/index.php?title=Virtual_Console&oldid=1386423035
[wp-chips]: https://en.wikipedia.org/w/index.php?title=List_of_Super_NES_enhancement_chips&oldid=1365140998
[nerd-nes]: https://www.nerd.nintendo.com/emulation/2016/11/11/NES_mini.html
[nerd-snes]: https://www.nerd.nintendo.com/emulation/2017/09/29/SNES_mini.html
[nerd-nso-nes]: https://www.nerd.nintendo.com/emulation/2018/09/19/NSO_NES.html
[nerd-nso-snes]: https://www.nerd.nintendo.com/emulation/2019/09/05/NSO_SNES.html
[nintendo-oss]: https://web.archive.org/web/20261111001728/https://support.nintendo.com/jp/oss/index.html
[nintendo-legal]: https://web.archive.org/web/20170101225939/http://www.nintendo.com/corp/legal.jsp
[atari]: https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html
[galoob]: https://law.resource.org/pub/us/case/reporter/F2/964/964.F2d.965.91-16205.html
[us4799635]: https://patents.google.com/patent/US4799635A/en
[us5070479]: https://patents.google.com/patent/US5070479A/en
[us5004232]: https://patents.google.com/patent/US5004232A/en
[us4949298]: https://patents.google.com/patent/US4949298A/en
[us5291189]: https://patents.google.com/patent/US5291189A/en
[us5327158]: https://patents.google.com/patent/US5327158A/en
[us5086475]: https://patents.google.com/patent/US5086475A/en
[us5761643]: https://patents.google.com/patent/US5761643A/en
[dmca]: https://github.com/github/dmca
