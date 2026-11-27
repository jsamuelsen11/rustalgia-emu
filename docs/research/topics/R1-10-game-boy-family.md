---
title: "Game Boy and Game Boy Color: family survey"
roadmap_item: R1-10
status: approved
date: 2026-11-26
---

# Game Boy and Game Boy Color: family survey

## Summary

This note asks which emulators of the Game Boy, Game Boy Color, and Super Game Boy are popular or respected,
how each is built, licensed, and run, what legal exposure the family carries, and how hard it is to emulate.

Accuracy is led by a small group.
On the [GB Emulator Shootout][shootout], [docboy][docboy], [Emulicious][emulicious], [SameBoy][sb],
and [Beaten Dying Moon][bdm] pass nearly every test; of these only SameBoy (Expat) and docboy (MIT) are open source,
and of those two only SameBoy also models the Super Game Boy, the Game Boy Advance in Color mode,
and selectable revisions.
Popularity lies with [mGBA][mgba], the [Gambatte][lr-gambatte] core in [RetroArch][retroarch] and [Delta][delta],
and paid Android apps; Gambatte, long the reference, is now closed at its origin and walled in its forks.

The family carries low legal exposure.
Its games are not encrypted, the lock-out is a logo comparison that a boot-ROM-less emulator never makes,
and the takedown notices found concern sites that offered game copies, not an emulator's code.
The open risk is firmware data: per-game colour tables derived from Nintendo's firmware,
which no hardware test confirms.

Difficulty sits in the video chip's variable drawing time, mid-line effects, revision differences,
and the Super Game Boy's split between a Game Boy chip and a SNES program.

The note recommends keeping SameBoy ([`R1-30`][studies]), narrowing Gambatte ([`R1-31`][studies]) to prose,
a post-boot start with no boot ROM, selectable revisions modelled to the dot,
and the [Mooneye Test Suite][mooneye] and other hardware-referenced suites as the oracle; the owner decides.
This note is not legal advice.

## Scope

- Question: which Game Boy family emulators are popular or respected, what are each one's status, licence, tier,
  techniques, and hosts, and what are the family's legal exposure and difficulty?
- Covered: the Game Boy (DMG) and its Pocket and Light revisions (MGB), the Game Boy Color (CGB),
  and the Super Game Boy and Super Game Boy 2 as SNES add-ons running Game Boy hardware;
  the Game Boy Advance only in Game Boy mode (AGB), where an emulator models it.
  Hardware is left to the primer ([R1-01][r1-01]) and catalogue ([R1-05][r1-05]), the law to [R0-02][r0-02],
  the Game Boy Advance to [`R1-11`][surveys], and the Super Game Boy's SNES side to [`R1-15`][surveys].
- Researched on 2026-11-22.
  Three research agents gathered evidence, one each for dedicated emulators, multi-system and mobile emulators,
  and law and difficulty; the note was written from their records,
  one verification pass of fresh verifiers checked every claim against its source,
  and a fix pass applied their findings.
- How claims were checked: pages were fetched as raw text with curl or the GitHub API,
  and quotations come from that text.
  Status figures (release tags and dates, last push, stars, archived flag) come from GitHub's repository metadata,
  read through its API on 2026-11-22, and carry no marker; store figures are from the store listing on the same day.
  Shootout counts per suite were counted by script from the page's raw HTML; the page's own totals are authoritative.
- Emulators were read from prose only, in every tier, including the open one: README, licence, website, documentation,
  and release notes.
  No emulator's source file, issue, or pull request was opened, nothing was cloned or downloaded,
  and no emulator repository was searched.
  No boot ROM, firmware, game, or key was opened; logo bytes, boot ROM hashes,
  and colour tables printed by some pages are not recorded.

## Findings

### How the emulators were chosen

- An emulator is included for popularity (stars, store installs or ratings, inclusion in a frontend) or for respect
  (a published test result, listing by a documentation hub, or citation by other emulators),
  and historical and official emulators are included where they shaped the family.
- The gbdev hub's list, [awesome-gbdev][awesome], names [BGB][bgb], [SameBoy][sb], [Mooneye GB][mooneye-gb],
  [mGBA][mgba], [binjgb][binjgb], [Gambatte][gambatte-libretro], MetroBoy
  (closed; address in Sources), [GBE+][gbeplus], and [Emulicious][emulicious] under "Emulators".
  The [GB Emulator Shootout][shootout] runs 18 emulators, which adds [docboy][docboy], [Beaten Dying Moon][bdm],
  [GSE][gse], [Gambatte-Speedrun][gsr], [GameRoy][gameroy], [VBA-M][vbam], [VisualBoyAdvance][vba-wp], [PyBoy][pyboy],
  Emmy, [Goomba Color][goomba], [NO$GMB][nocash], [KiGB][kigb], and [ares][ares].
- Emmy is left out: its site serves only a script application with no prose (research log).
  Names found only in a community wiki's table, such as hhugboy and Coffee GB, were not evaluated.

### The emulators at a glance

Hosts: W Windows, M macOS, L Linux, B BSD, A Android, i iOS, web a browser, lr a libretro core.
Shootout: passed of the tests run, from the page header; "not run" means the emulator is not in the table.
Tiers are those of [the register][register] after this note's re-check; for an emulator with no repository,
the tier is this note's, by [ADR 0006][adr6]'s closed test
(no licence or no source), and the register lists only its site, as open prose.

| Emulator | Tier, licence | Latest release; last push | Stars | Hosts | Shootout |
|---|---|---|---|---|---|
| [docboy][docboy] | open, MIT | 1.3, 2026-06-20; 2026-11-13 | 35 | W L A lr | 258/261 |
| [Emulicious][emulicious] | closed, non-commercial binary | news post 2026-03-19 | - | W M L (Java) | 254/261 |
| [SameBoy][sb] | open, Expat | v1.0.5, 2026-11-02; 2026-11-02 | 2,247 | W M L i, watchOS, lr | 253/264 |
| [Beaten Dying Moon][bdm] | closed, none | none shown | - | W M web | 247/264 |
| [GSE][gse] | walled, MPL-2.0 with GPL-2.0 core | not readable; 2026-07-14 | 44 | W M L A | 218/264 |
| [BGB][bgb] | closed, freeware | 1.6.7, 2026-11-05 | - | W, Wine | 205/264 |
| [Gambatte-Speedrun][gsr] | walled, GPL-2.0 | not readable; 2024-04-28 | 103 | W M | 169/207 |
| [mGBA][mgba] | open, MPL-2.0 | 0.10.5, 2025-03-09; 2026-11-22 | 7,624 | W M L B, consoles, lr | 150/264 |
| [GameRoy][gameroy] | open, MIT or Apache-2.0 | v0.3.1, 2023-09-02; 2026-11-22 | 314 | W L A web | 149/167 |
| [binjgb][binjgb] | open, MIT | v0.1.11, 2021-08-21; 2026-11-16 | 615 | W M L web | 144/207 |
| [VBA-M][vbam] | walled, GPL-2.0 | v2.2.3, 2025-10-25; 2026-11-22 | 3,954 | W M L A lr | 110/207 |
| [PyBoy][pyboy] | open, LGPL-3.0 | v2.9.0, 2026-10-30; 2026-10-30 | 5,241 | Python | 91/261 |
| [ares][ares] | open, ISC | v148, 2026-05-30; 2026-11-22 | 1,868 | W M L B | 26/261 |
| [Gearboy][gearboy] | open, GPL-3.0 | 3.8.22, 2026-11-20; 2026-11-22 | 1,226 | W M L B lr | not run |
| [MesenCE][mesence] | open, GPL-3.0-or-later | 2.2.1, 2026-06-05; 2026-11-15 | 678 | W M L lr | not run |
| [BizHawk][bizhawk] | walled, mixed | 2.11.1, 2026-05-01 | 2,826 | W L | not run |
| [Mednafen][mednafen] | walled, GPL-2.0 | 1.32.1, 2024-04-05 | - | W, source | not run |
| [rboy][rboy] | open, MIT | none; 2026-07-26 | 664 | not stated | not run |
| [Mooneye GB][mooneye-gb] | open, GPL-3.0 | v0.1.0, 2015-09-27; 2023-03-16 | 967 | W L, from source | not run |
| [GBE+][gbeplus] | walled, GPL-2.0 | not readable; 2026-10-01 | 601 | not read | not run |
| [GiiBiiAdvance][giibii] | walled, GPL-2.0 | not readable; 2026-01-25 | 210 | not read | not run |
| GateBoy (MetroBoy) | closed, none | 2025-02-23 | 1,182 | not read | not run |
| IronBoy | closed, none | 2026-08-28 | 417 | W M L web | not run |
| Gambatte (original) | closed, "taken private" | 2021-07-06 | 402 | W M L B | not run |
| [VisualBoyAdvance][vba-wp] | walled, GPL-2.0 | 1.7.2, 2004-05-25 | - | many ports | 40/206 |
| [NO$GMB][nocash] | closed, freeware and shareware | 2.5, undated | - | DOS, W | 44/205 |
| [KiGB][kigb] | closed, none | v2.05, 2008-06-11 | - | W L, DOS | 31/207 |
| [Goomba Color][goomba] | closed, none | 2019-05-04 | - | GBA, DS | 47/205 |
| [VGB][vgb] | closed, source not public | 6.0, 2021-11-07 | - | W L A | not run |

- The source guard refuses the releases endpoint of walled repositories
  (research log),
  so the last push stands in; the releases of BizHawk, Mednafen, VisualBoyAdvance, BGB, KiGB, VGB,
  and Goomba Color come from their own pages
  ([TASVideos, "Bizhawk/ReleaseHistory"][tv-bizhawk-rel]; [Mednafen][mednafen]; [Wikipedia, "VisualBoyAdvance"][vba-wp];
  [BGB history][bgb-history]; [KiGB][kigb]; [VGB][vgb]; [Goomba Color][goomba]).
- The repositories of GateBoy, IronBoy, and the original Gambatte are closed,
  so their addresses are given in Sources as code spans:
  `github.com/aappleby/metroboy` and `github.com/chiplis/ironboy` have no licence,
  and the original Gambatte's README reads in full "This project has been taken private.
  Sorry for the inconvenience."

### Accuracy-led emulators

- SameBoy is the open-tier leader.
  Its features page claims "T-cycle accurate emulation of LCD timing effects" and "Sample-accurate sound emulation,
  downsampled from 2MHz", and lists DMG, MGB, CGB, and "GBC-Mode Game Boy Advance and Game Boy Player (AGB)",
  with "accurate high level emulation of Super Game Boy (SGB; NTSC and PAL) and Super Game Boy 2 (SGB2)"
  ([SameBoy features][sb-feat]).
  It emulates the differences between revisions and lets the user switch between them
  (same page); which Color revisions it offers is not stated on the pages read.
  It follows the BESS save-state format, emulates the link cable, infrared, camera, printer, and other accessories,
  and has a text debugger with back-stepping and tick counting (same page).
  Its README claims passes of all of blargg's, Mooneye's,
  and Wilbert Pol's tests, "(Some tests require the original boot ROMs)"
  ([SameBoy README][sb]),
  and its automation page reports that version 1.0.5 booted "2790 out of 2791 games",
  judged by screenshots after 40 and 120 seconds
  ([SameBoy automation][sb-auto]), which is a compatibility check, not a hardware oracle (inference).
  It also runs on watchOS, and its iOS app is on the App Store ([SameBoy home][sb-site]; [SameBoy README][sb]).
  GameRoy credits SameBoy's source as what let it build a cycle-accurate video chip ([GameRoy README][gameroy]).
- docboy is a C++17 emulator of the DMG and CGB, claiming an M-cycle-accurate CPU,
  a T-cycle-accurate video chip with a pixel FIFO, and modelled memory buses for read and write conflicts
  ([docboy README][docboy]).
  It builds without a boot ROM by default (same page).
  It tops the shootout, failing `cgb-acid-hell`, one SameSuite sound test, and one clock-latch test
  (counted from the [shootout][shootout]).
- Beaten Dying Moon, by Matt Currie, offers the widest revision list found: DMG-CPU 0, A, B, and C, MGB, SGB, SGB2,
  CPU CGB 0 to E, and CPU AGB (observed in [its web build][bdm-demo]).
  No source or licence was found ([BDM][bdm]).
  Its own results page reports passes of every listed blargg, Mooneye, Wilbert Pol, and acid test,
  with fails only in Color runs of six Mealybug window tests and in twelve SameSuite tests
  ([BDM test results][bdm-tests]; counted).
  The Mealybug expected images come from this emulator
  ([Mealybug README][mealybug]), so its Mealybug passes are partly circular (inference).
- Emulicious is freeware "for PERSONAL USE only", granted "in binary form, for non-commercial purposes"
  ([Emulicious licence][emulicious-lic]), with no source.
  It runs on any system with Java SE, also emulates Sega's 8-bit systems and the MSX,
  and offers a debugger with reverse stepping, a profiler, a tracer,
  and remote debugging from an editor ([Emulicious][emulicious]).
  It points users to the shootout for its accuracy (same page).
- BGB is the long-standing closed debugger-emulator, first released in 2001, with 1.6.7 on 2026-11-05
  ([BGB history][bgb-history]).
  It runs on Windows and under Wine ([BGB][bgb]),
  and its manual claims "clock exact timing of LCD behavior/state changes" and initial RAM values "random
  but with specific bit patterns" ([BGB manual][bgb-manual]).
  It offers an "Emulate as in reality" mode beside a troubleshooting mode with deliberate inaccuracies, detects Pocket,
  SGB2, Game Boy Advance, and Game Boy Player modes, and needs no boot ROM (same page).
- Gambatte was built "based on hundreds of corner case hardware tests" ([gambatte-libretro README][gambatte-libretro]).
  Its SourceForge page gives GPLv2, registration in 2007, and a move to GitHub on 2013-02-24
  ([Gambatte on SourceForge][gambatte-sf]); the GitHub original is now private.
  The forks are walled: [gambatte-libretro][gambatte-libretro], active, states version 2 with no "or later",
  and [gambatte-core][gambatte-core] is the speedrunning fork's core, which GSE also uses;
  the Gambatte-Speedrun frontend now says it is superseded ([Gambatte-Speedrun][gsr]; [GSE README][gse]).
  Mooneye GB's README calls Gambatte and BGB from version 1.5 highly accurate,
  but says they are not documented well enough to serve developers as references ([Mooneye GB README][mooneye-gb]).
- Gambatte-Speedrun claims "Timing parity with official consoles
  (bootroms required ...)",
  emulates the SGB2 platform's frame rate, and needs the DMG
  and CGB boot ROMs to run Gambatte's own hardware tests ([Gambatte-Speedrun][gsr]).
  Its successor, GSE, uses the Gambatte core for Game Boy and Mesen's core for the Game Boy Advance,
  emulates the Game Boy Player and SGB2 reset timing, requires boot ROM files, and runs on Windows, macOS, Linux,
  and Android ([GSE README][gse]).
  GSE says BizHawk shares the same core for tool-assisted runs (same page).

### Research and reference emulators

- Mooneye GB's goals "are accuracy and documentation", through test programs run on hardware;
  it does not aim at Color support, a debugger, or a good interface,
  warns that it "Doesn't work properly without a boot ROM", and says it lags behind hardware research
  ([Mooneye GB README][mooneye-gb]).
  Its own table shows 63 of 75 acceptance tests passing, with boot, video-timing, and serial fails (counted, same page).
  Its tests moved to the [Mooneye Test Suite][mooneye].
- GateBoy, in the closed MetroBoy repository,
  is a "gate-level simulation" of the DMG reverse-engineered from die photographs,
  with every standard cell except the CPU, which is "my current best guess"; it runs at 6 to 8 frames a second,
  with a faster variant, LogicBoy, above 60 (MetroBoy README, address in Sources).
- [GBE+][gbeplus] aims to emulate "as much of the Game Boy as possible, including various peripherals and accessories",
  and also the Pokémon Mini ([GBE+ README][gbeplus]).
  [GiiBiiAdvance][giibii] says it "isn't meant to be used for playing", claims the first complete camera emulation,
  ([GiiBiiAdvance README][giibii]);
  its repository also holds the Cycle-Accurate Game Boy Docs, by [the register][register]'s line for it,
  a walled path not opened.

### Other dedicated emulators

- Gearboy, in C++ under GPL-3.0, releases often and lists MBC1 to MBC7, HuC-1 and HuC-3, MMM01, TAMA5,
  and many unlicensed mappers, LCD ghosting, run-ahead, rewind, a debugger, and a server for AI-assisted debugging
  ([Gearboy README][gearboy]).
  It runs with or without a boot ROM, and its libretro core reaches Android, iOS, seven consoles,
  and several handheld systems (same page; [libretro, Gearboy][lr-gearboy]).
  No test result is published, and the shootout does not run it (same page; [shootout][shootout]).
- binjgb calls its Color support "Hacky-but-passable" and its Super Game Boy support "Mostly-there",
  claims cycle accuracy, and runs in the browser through WebAssembly ([binjgb README][binjgb]).
  Its test-results file was not read: the guard refused it before registration (research log).
- GameRoy is a Rust emulator of the DMG only that paces by clock frequency rather than frames
  and reports test results from the c-sp collection, including Mealybug 15 of 25
  ([GameRoy README][gameroy]).
  [rboy][rboy] is a Rust Color emulator that claims correct instructions and timings, with no releases
  ([rboy README][rboy]).
  IronBoy, in Rust with no licence, targets the DMG alone and builds for the web (IronBoy README, address in Sources).
- PyBoy is a Python emulator whose README links reinforcement-learning agents trained on Pokémon,
  and offers a fast mode "to allow less accurate emulation, in exchange for performance" ([PyBoy README][pyboy]).
  Its stars come from that use (inference).

### Multi-system emulators

- mGBA supports "Game Boy and Game Boy Color games", the camera and printer, a local link cable, and a long mapper list,
  with partial Super Game Boy support ([mGBA README][mgba]; [mGBA FAQ][mgba-faq]).
  Its FAQ says "Most games work but there are still plenty of bugs" ([mGBA FAQ][mgba-faq]).
  It runs on Windows, macOS, Linux, FreeBSD, the 3DS, Switch, Wii, and Vita, with no official Android or iOS build,
  and as libretro and OpenEmu cores (same page).
  The libretro core offers Game Boy, Super Game Boy, Color, and Advance models and optional boot ROM files
  ([libretro, mGBA][lr-mgba]).
- VisualBoyAdvance emulated the GB, GBC, GBA, SGB, and SGB2, and development of the original stopped in 2004
  ([Wikipedia, "VisualBoyAdvance"][vba-wp]).
  VBA-M merged its forks ([Wikipedia][vba-wp]) and still releases; its licence file is the plain GPL version 2 text,
  while Wikipedia's infobox says GPL-3.0, and the file governs ([VBA-M][vbam]; inference).
  For the original, SourceForge gives "GPLv2" and Wikipedia's infobox "GPL-2.0-or-later"
  ([VisualBoyAdvance on SourceForge][vba-sf]; [Wikipedia][vba-wp]);
  with no licence statement read in the project's own prose,
  the or-later question is unresolved and the original stays walled.
  Android builds arrived in nightly builds on 2026-08-13 ([VBA-M site][vbam-site]).
  Its libretro page lists Game Boy, Color, and Super Game Boy modes,
  and a hack for colourised patched games that "relies on inaccurate vram and palette access"
  ([libretro, VBA-M][lr-vbam]).
- higan emulates the Super Game Boy, Game Boy, Color, Advance, and Game Boy Player
  ([higan README][higan]).
  ares forked higan in 2020 to add newer systems, and focuses "on accuracy and preservation"
  ([ares README][ares]; [ares site][ares-site]);
  it loads the Super Game Boy from the user's SNES cartridge image (from memory; no page read says so).
  Its compatibility list runs to 81 pages for the Game Boy and 70 for the Color; on the first page of each,
  all 20 Game Boy titles are completable, and of 20 Color titles 3 are completable, 10 completable but unverified,
  and 7 in-game (counted, same site).
  Its shootout score of 1 of 97 Mooneye tests sits against those lists; the page gives no reason,
  and whether the core or the harness fails was not established.
  A local run would need an ares build, which this survey's no-download rule excludes;
  the cause does not bear on this note's recommendations (inference).
- bsnes offers "True Super Game Boy emulation (using the SameBoy core by Lior Halphon)"
  ([bsnes README][bsnes]),
  and its libretro core requires the SGB1 or SGB2 SNES cartridge image ([libretro, bsnes][lr-bsnes]).
- MesenCE, the community fork of the archived Mesen 2, supports "Game Boy (GB/SGB/GBC)" and runs on Windows, Linux,
  macOS, and SteamOS ([MesenCE README][mesence]).
  Its libretro port handles the Super Game Boy
  ([libretro, Mesen2][lr-mesen2]),
  and the older Mesen-S core lists every boot ROM and SGB cartridge file as optional ([libretro, Mesen-S][lr-mesens]).
  Whether Mesen runs the Super Game Boy with no user file was not established.
- BizHawk offers Gambatte, its own C# core GBHawk, and SameBoy for Game Boy and Color,
  with BSNES and Gambatte for the Super Game Boy ([BizHawk README][bizhawk]).
  TASVideos calls its frontend "the preferred emulator for submissions to TASVideos in most cases",
  because "accuracy has been valued over performance"
  ([TASVideos, "Bizhawk"][tv-bizhawk]),
  and its emulator table lists BizHawk and lsnes as preferred for the family
  ([TASVideos, "EmulatorResources"][tv-emures]; the table's meaning is inferred from the page's headings).
  macOS has only old ports (BizHawk README).
- Mednafen's Game Boy module "is based off of VisualBoy Advance", has no Super Game Boy, and lists no boot ROM setting
  ([Mednafen, "Game Boy"][mednafen-gb]); that it runs with no boot ROM is inference.

### Frontends and mobile apps

| App | Tier | Game Boy core | Hosts | Popularity |
|---|---|---|---|---|
| [RetroArch][retroarch] | open | several cores | most desktop, mobile, and console hosts | 5M+ Play downloads |
| [Delta][delta] | walled, AGPL-3.0 | Gambatte | iOS, iPadOS, macOS, visionOS | 28,397 App Store ratings |
| [Provenance][provenance] | walled | Gambatte, Mednafen | iOS, tvOS, macOS | 758 App Store ratings |
| [Lemuroid][lemuroid] | open, GPL-3.0 | Gambatte | Android | 5M+ Play downloads |
| [GBC.emu][gbcemu] | walled, mixed | Gambatte | Android, Linux | 50K+ Play downloads, $2.99 |
| [EmulatorJS][emulatorjs] | open, GPL-3.0 | Gambatte, mGBA | web | 4,361 stars |
| [OpenEmu][openemu] | closed, no licence file | Gambatte | macOS | 17,883 stars |
| [My OldBoy!][myoldboy] | closed | own | Android | 500K+ paid, 5M+ lite |
| [Pizza Boy C][pizzaboy] | closed | own | Android | 500K+ Play downloads |

- Popularity figures: [Google Play][play-retroarch], [App Store][as-delta], [App Store][as-prov],
  [Google Play][play-lemuroid], [Google Play][play-gbcemu], the table's Play pages, and repository metadata.
- RetroArch's Game Boy cores include Gambatte, SameBoy, Gearboy, mGBA, VBA-M, TGB Dual, Mesen, and bsnes
  (libretro core pages listed in Sources).
  The Gambatte page offers official boot ROMs as optional, Game Boy, Color, and Advance modes,
  colouring with Color or Super Game Boy palettes, and frame mixing for games that rely on LCD ghosting
  ([libretro, Gambatte][lr-gambatte]).
  [TGB Dual][lr-tgbdual] is a GPLv2 emulator described by its link-cable support;
  its libretro repository has no licence file and is walled ([tgbdual-libretro README][tgbdual]).
  RetroArch's site says its Play build has not been updated in over a year,
  but the listing shows an update on 2026-10-30
  ([RetroArch platforms][retroarch]; [Google Play, RetroArch][play-retroarch]).
- Delta calls itself "the spiritual successor to GBA4iOS" ([Delta README][delta]).
  Version 2.0 added custom palettes for original Game Boy games and experimental support for a cartridge reader
  ([Delta release notes][delta-notes]); its store listing gives 2.0.1 on 2026-11-05 ([App Store, Delta][as-delta]).
  Its Game Boy core repository, `github.com/rileytestut/gbcdeltacore`, has no licence and is closed.
- [Provenance][provenance] bundles more than 60 cores under many licences and sells a subscription for sync
  ([Provenance README][provenance]); its store listing gives 3.3.0 on 2026-01-29 ([App Store, Provenance][as-prov]).
- [Lemuroid][lemuroid] is GPL-3.0-or-later on F-Droid, which flags that it downloads emulators from GitHub
  ([F-Droid, Lemuroid][fdroid-lemuroid]);
  [EmulatorJS][emulatorjs] makes Gambatte its default Game Boy core ([EmulatorJS, Game Boy][ejs-gb]).
- GBC.emu says it is "based on Gambatte" and can report the hardware as a Game Boy Advance ([GBC.emu][gbcemu]);
  its repository's licence file is GPL-3.0
  ([EX emulators repository][exalpha]; research log, not re-checked in the fix pass because the guard blocked it),
  while the Gambatte core is version 2, or later not stated, so the mix is unresolved and walled,
  by the BizHawk precedent in [the register][register] (inference).
- OpenEmu's README calls it open source, but the repository has no licence file and its site states none;
  Wikipedia's infobox says BSD ([OpenEmu][openemu]; [Wikipedia, "OpenEmu"][openemu-wp]).
  It is recorded as closed until a licence is found, by the precedent of the original Gambatte.
  Its Game Boy core is a Jolly Good fork of Gambatte on GitLab, which was not evaluated:
  the guard read the GitLab API path as an unregistered repository (research log).
- My OldBoy!
  claims "Fast emulation with ARM assembly code", link play over Bluetooth or Wi-Fi, the camera and printer,
  and Super Game Boy palettes ([Google Play, My OldBoy!][myoldboy]).
  Pizza Boy C claims it "Passes Blargg's accuracy test suite", which was not checked
  ([Google Play, Pizza Boy C][pizzaboy]).
  [SameBoy for iOS][as-sameboy] has 113 ratings, and the closed iOS apps found by an App Store search,
  such as Manic EMU and Gamuroid, have 10,000 to 18,000 ratings each with cores not stated
  ([App Store search][itunes-search]).

### Historical and official emulators

- VGB, by Marat Fayzullin, began in 1995 and claims to be "the first usable videogame emulator available";
  its source was public until version 0.8, after which "VGB source code is no longer public",
  and its author says others built emulators on that code ([VGB][vgb]).
- NO$GMB, at version 2.5, is a DOS and Windows emulator and debugger "entirely written in assembler language" ([NO$GMB,
  archived copy][nocash]).
  Its monochrome and Super Game Boy parts are freeware, and its Color part is shareware (same page).
- KiGB claims to be "the most compatible and accurate GB/GBC/SGB emulator ever" after testing over 6,000 games
  and demos ([KiGB][kigb]).
  The gbdev wiki says it fares "about as poorly as no$gmb on various test ROMs"
  ([gbdev wiki, "KiGB"][gg8-kigb]), and it scores lowest of the emulators the shootout runs bar ares.
- Goomba Color runs Game Boy Color games on the Game Boy Advance, the DS, and the Game Boy Micro;
  its page offers source archives with no licence stated, so it is closed,
  by ADR 0006's no-licence test and the precedent of the original Gambatte ([Goomba Color][goomba]).
- Nintendo's own emulators are documented only by features.
  The 3DS Virtual Console sold Game Boy and Color games from 2011 to its close on 2023-03-27,
  and its Pokémon releases replaced the link cable with local wireless play ([Wikipedia, "Virtual Console"][vc-wp]).
  Game Boy and Color games joined Nintendo Switch Online in February 2023, with Game Boy, Pocket,
  and Color screen styles, suspend points, and online two-player play
  ([Nintendo, archived copy][nso]; [Wikipedia, "Nintendo Switch Online"][nso-wp]).
  Pokémon Stadium's "GB Tower" ran Game Boy games on the Nintendo 64,
  and Pan Docs says it alone verifies the header's global checksum
  (Pan Docs, "The Cartridge Header", not linked because the page holds the boot logo's bytes; address in Sources).
  Nintendo also patented an emulator of the family for low-power devices, now expired ([US 6,672,963][us6672963]).

### Techniques across the family

- Timing claims fall into four levels (inference from the findings above): per T-cycle or dot for the video chip
  (SameBoy, docboy, BGB's "clock exact"),
  cycle-accurate without a stated unit (binjgb, GameRoy), gate level (GateBoy), and none stated (mGBA, Gearboy, VBA-M).
  No emulator read claims a recompiler; My OldBoy!, NO$GMB, and early BGB name assembly code ([NO$GMB,
  archived copy][nocash]; [BGB history][bgb-history], version 0.32).
- Boot ROMs are handled in three ways (inference):
  - Ship a replacement: SameBoy alone, for every model it emulates ([SameBoy features][sb-feat]).
    The libretro page calls them "reverse engineered" boot ROMs "baked into the core itself"
    ([libretro, SameBoy][lr-sb]).
  - Start from post-boot state and accept the user's file optionally: BGB, Gambatte, Gearboy, mGBA, VBA-M, docboy,
    EmulatorJS, and Mesen-S, with KiGB simulating the Color boot; Mednafen offers no file at all.
  - Require the user's file: Mooneye GB in practice, Gambatte-Speedrun for timing parity, and GSE.
- The Super Game Boy is modelled in two ways.
  SameBoy and Gearboy emulate its SNES side at a high level,
  Gearboy reading the default palette and border from the user's SGB cartridge image when given one
  ([libretro, Gearboy][lr-gearboy]).
  bsnes runs the SNES program from the user's cartridge image and pairs it with SameBoy
  ([libretro, bsnes][lr-bsnes]);
  higan and ares do the same (from memory). mGBA's `sgb_bios.bin`, "Super Game Boy BIOS",
  is the Game Boy side's 256-byte boot ROM, not the SNES program
  (inference from the hash on [libretro, mGBA][lr-mgba] matching the SGB boot ROM's in
  [GB: Complete Technical Reference][gbctr], table 8.1; neither hash is recorded here).
- Revisions: Beaten Dying Moon lists 14 models, SameBoy lets the user switch revisions, BGB detects Pocket and SGB2,
  and the frontends' cores offer only DMG, Color, Advance, and Super Game Boy modes.
- Enhancements common to the leaders are colour correction
  (six modes in SameBoy),
  frame blending, audio filters, rewind, and scalers ([SameBoy features][sb-feat]; [libretro, Gambatte][lr-gambatte]).
  No measurement of the DMG LCD's frame blending was found among the pages read,
  so each emulator's blending is its own model, as [R1-01][r1-01-video] found.

### Test suites, oracles, and published results

- [R1-01][r1-01-tests] lists the [Mooneye Test Suite][mooneye] as a hardware-referenced suite:
  it is run by its author on every SoC revision,
  with an "emulator-only" class whose cases are hard to verify on hardware.
  This survey adds three more: [gbmicrotest][gbmicrotest], "checked on real hardware
  (version DMG-CPU-08 I believe)";
  [AGE][age], whose test names give the devices verified; and the acid tests, with photographs of consoles
  ([dmg-acid2][dmg-acid2]; [cgb-acid2][cgb-acid2]; [cgb-acid-hell][cgb-acid-hell]).
- Mooneye's focus "is on DMG/MGB/SGB/SGB2, so not all tests pass on CGB/AGB/AGS"
  ([Mooneye Test Suite][mooneye]),
  and [GB: Complete Technical Reference][gbctr] focuses on models before the Color,
  so the Color has the thinner oracle (inference).
- [SameSuite][samesuite] was written "to aid the development of SameBoy"
  ([SameSuite README][samesuite]),
  and its sound folder's README states results on hardware by revision:
  CPU-CGB-E passes all tests and CPU-CGB-D all but one ([SameSuite sound README][samesuite-apu]).
  Its other folders state no oracle (research log: their README addresses returned 404).
- Mealybug's expected screenshots come from the author's emulator, with photographs of devices beside them
  ([Mealybug README][mealybug]).
  blargg's tests state no oracle; their readme says the code runs as it does on the author's development cartridge
  (blargg readme, closed mirror in Sources), which implies hardware runs (inference).
- Several blargg results depend on the model:
  Mooneye GB's author notes that `cpu_instrs` fails on MGB and SGB2 hardware, `oam_bug-2` on every CGB, AGB, and AGS,
  and `cgb_sound-2` test 3 on early Color revisions ([Mooneye GB README][mooneye-gb]).
- The shootout's per-suite counts for the emulators most relevant to Rustalgia, counted from [its page][shootout]
  (updated 2026-06-04; emulator versions not shown), whose harness is in [its repository][shootout-repo]:

| Emulator | blargg (51) | Mooneye (97) | SameSuite (68) | Mealybug, DMG (24) | acid (3) |
|---|---|---|---|---|---|
| docboy | 51 | 97 | 65 of 66 run | 24 | 2 |
| Emulicious | 51 | 97 | 66 of 66 run | 17 | 3 |
| SameBoy | 51 | 97 | 67 | 15 | 3 |
| Beaten Dying Moon | 51 | 97 | 54 | 24 | 3 |
| GSE | 47 | 96 | 42 | 12 | 3 |
| BGB | 49 | 81 | 54 | 2 | 2 |
| mGBA | 45 | 87 | 10 | 1 | 2 |
| binjgb | 47 | 85 | 3 of 11 run | 1 | 2 |
| VBA-M | 43 | 56 | 4 of 11 run | 0 | 2 |

- SameBoy's fails are one Super Game Boy test in SameSuite, one in CasualPokePlayer's suite,
  and nine Mealybug tests of mid-line `LCDC` and `SCY` changes (observed in the shootout table).
- Older results exist only for old versions: the gbdev wiki's blargg table covers BGB 1.5, Gambatte 0.5.5, KiGB 2.05,
  MESS 0.140, NO$GMB 2.5b, and VBA-M 1.8.0
  ([gbdev wiki, "Test ROMs"][gg8-tests]),
  and TASVideos' blargg table, last edited 2023-07-11, gives BGB 1.5.3, Gambatte,
  and BizHawk 42 of 47 and Gearboy 0.5 38 ([TASVideos, "GBAccuracyTests"][tv-gbacc]).

### Register re-check

- The re-check that [ADR 0006][adr6-eval] asks of a family survey found one licence change and one tier change.
  SameBoy's licence file now opens "All files and directories in this repository,
  except for the iOS and HexFiend directories, are licensed under the Expat License"
  ([SameBoy licence][sb-lic]),
  so the HexFiend folder, whose terms the file does not state, is now walled beside the iOS folder.
  Goomba Color's source archives move from walled to closed, as set out above.
- SameBoy ships replacement boot ROMs for every model
  ([SameBoy features][sb-feat])
  in a `BootROMs` folder, the path that [Pan Docs, "Power Up Sequence"][pd-boot] links at a pinned commit;
  ADR 0006 closes them inside an open repository, and [the register][register] now closes that folder at `master`,
  at the pinned commit, and in libretro's fork at its default branch, `buildbot`.
  The guard matches literal prefixes, so the folder at any other commit is not yet closed by a pattern.
- Every other line re-checked holds: Mooneye GB, Mooneye Test Suite, Mealybug, the acid tests, SameSuite, gbmicrotest,
  AGE, the shootout, gambatte-core, gambatte-libretro, the closed original Gambatte, GiiBiiAdvance, GBE+, MetroBoy,
  mGBA, bsnes, higan, ares, Mesen, RetroArch, Delta, BizHawk, and Provenance.
  SameSuite's line names no oracle; this note records the sound folder's hardware oracle above.
  This survey's process call is to change a line only when its licence or tier has changed,
  so a line's date stays that of its last evaluation that changed something.

### Legal exposure

- No encryption: none of the Pan Docs pages cited in Sources mentions encryption or scrambling
  (searched for "encrypt" and "scrambl"),
  and games are plain ROM; the gates are the logo comparison and header checksum
  ([Pan Docs, "Power Up Sequence"][pd-boot]; [R1-01, "Lock-out"][r1-01-lockout]).
  So the family falls under [R0-02's option 1][r0-02-o1] (inference).
- The patent on the logo check, [US 5,134,391][us5134391], is shown as expired since 2010,
  with family litigation noted but not identified;
  Nintendo's emulation patents [US 6,672,963][us6672963] and [US 7,445,551][us7445551] are expired,
  as [R0-02][r0-02-patents] calculated.
- Takedowns: the Game Boy rows of [R0-02's table][r0-02-takedown] stand.
  Nintendo's notices of 2014 against the GBA4iOS site, 2015 against a browser emulator site,
  and 2020 against launcher pages each list Game Boy or Color titles and allege access to game copies,
  not the emulator's code ([GitHub DMCA, 2014-05-13][dmca-2014]; [2015-07-06][dmca-2015]; [2020-04-08][dmca-2020]).
  The store removals in R0-02's rows were voluntary or for copying another app, not for game copies.
- Two store rows have moved since [R0-02][r0-02-takedown].
  Pizza Boy C is on Google Play again, updated 2026-11-16
  ([Google Play, Pizza Boy C][pizzaboy]),
  and an iGBA listing first released 2024-04-13 is live at version 2.18.0
  ([App Store, iGBA][as-igba]);
  that it is the app Apple removed that weekend rests on its name and date (inference),
  and why it returned was not found.
  Apple's guidelines allow "retro game console and PC emulator apps" to offer games, at the developer's responsibility
  ([App Review Guidelines][apple-guide], 4.7).
- Boot ROMs cannot be dumped by a cartridge program under normal conditions:
  "The cartridge ROM has no chance of executing any instructions before the boot ROM is unmapped"
  ([GB: Complete Technical Reference][gbctr], chapter 8).
  The known dumps took die inspection or clock glitching
  (same chapter, section 8.2; also [Gekkio, "Dumping the Super Game Boy 2 boot ROM"][gekkio-sgb2], lead),
  so [R0-02's option 4][r0-02-o4] asks more of a user here than on consoles whose BIOS a program can read (inference).
- The Super Game Boy has two firmware parts: the 256-byte boot ROM in its Game Boy chip,
  and the SNES program on the cartridge, which itself verifies the logo and checksum
  ([Pan Docs, "Power Up Sequence"][pd-boot]; [Pan Docs, "SGB Functions"][pd-sgb]).
  Emulators that run the SNES program need the user's cartridge image, an option 4 path.
- Firmware data in a replacement is the family's open risk.
  SameBoy's Color boot ROM claims "Complete support for
  (and documentation of)
  *all* game-specific palettes in the CGB boot ROM"
  ([SameBoy README][sb]),
  and Gambatte offers game-specific Color and Super Game Boy palettes
  ([libretro, Gambatte][lr-gambatte]);
  those tables come from Nintendo's firmware, the latter from the SNES program, no hardware test of them was found
  ([R1-01][r1-01-boot]), and whether such a table is protected expression was not found decided (inference).
- The logo stays as [R0-02][r0-02-logos] left it: a path that makes no comparison holds no copy,
  and SameBoy's support for "games with a non-Nintendo logo in the header"
  ([SameBoy README][sb]) fits option 16's drawing of what the game supplies (inference).
- Projects' own statements tell users to own their games, or disclaim any tie to Nintendo: BGB's manual,
  [Emulicious's downloads page][emulicious-dl], VGB, mGBA's site footer, BizHawk's README,
  and the Play listings of My OldBoy!
  and GBC.emu (pages listed in Sources; observed).

### How hard the family is to emulate

- The video chip's drawing period runs "Between 172 and 289 dots", lengthened by scroll, the window, and each object,
  so interrupt timing depends on what is drawn (inference)
  ([Pan Docs, "Rendering"][pd-rend]); [R1-01][r1-01-video] gives the frame and FIFO model.
  The object penalty's timing at one edge "is not confirmed" ([Pan Docs, "Pixel FIFO"][pd-fifo]).
  The Mealybug results above show mid-line register changes are where the leaders still differ.
- Revisions differ in ways software sees.
  The DMG's spurious `STAT` interrupt breaks two games on the Color
  ([Pan Docs, "STAT"][pd-stat]);
  OAM corruption affects the DMG but not the Color or Advance
  ([Pan Docs, "OAM Corruption Bug"][pd-oambug]);
  one unused range reads differently by CGB revision
  ([Pan Docs, "Memory Map"][pd-map]);
  models before the CGB-D read the scroll Y once per bitplane
  ([Pan Docs, "Scrolling"][pd-scroll]);
  and sound quirks differ by revision, one breaking a game on CGB-02 ([Pan Docs, "Audio Details"][pd-audiodet]).
- Double speed doubles the CPU, timer, serial, and object DMA but not the video chip, HDMA, or sound,
  and the switch stalls the CPU for 2050 M-cycles with an open question about interrupts during the pause
  ([Pan Docs, "CGB Registers"][pd-cgb]).
- The Super Game Boy needs the SNES program or a model of it.
  The original runs about 2.4 % fast on NTSC units and 1.5 % on PAL units,
  while the SGB2 has its own crystal and runs at the correct speed ([Pan Docs, "SGB Functions"][pd-sgb]).
- Post-boot state differs by model, and for the Super Game Boy and Color some timer and video values are unknown
  because the boot's duration "depends on the header's contents"
  ([Pan Docs, "Power Up Sequence"][pd-boot]),
  so a boot-ROM-less emulator cannot match those models' first frames exactly from the tables (inference);
  SameBoy's note that some tests need the original boot ROMs points the same way ([SameBoy README][sb]).
- Compared with [R1-05][r1-05]'s other systems, the family is small and well documented,
  with hardware oracles for most behaviour; the leaders' near-full passes show the target can be met (inference).

## Options and trade-offs

### Which emulators the studies cover

- **What:** keep the roadmap's [SameBoy][sb] ([`R1-30`][studies])
  and [Gambatte][gambatte-libretro] ([`R1-31`][studies]) studies,
  and decide whether to add [docboy][docboy] or [Gearboy][gearboy].
- **Costs:** Gambatte's origin is closed and its forks walled,
  so its study is prose only and its own hardware tests cannot be read; each added study costs a note.
- **Gains:** SameBoy is open, leads the open tier, and documents its findings; docboy is open and tops the shootout;
  Gearboy is open, popular, and widely ported.
- **Used by:** the roadmap's list; [TASVideos][tv-emures] and the [shootout][shootout] as outside judges.

### Accuracy target and test oracles

- **What:** aim at every documented revision with the video chip at dot granularity and the CPU per machine cycle,
  as docboy claims, judged by hardware-referenced suites
  ([Mooneye][mooneye], [gbmicrotest][gbmicrotest], [AGE][age], acid photographs,
  [SameSuite][samesuite-apu]'s sound folder), with [Mealybug][mealybug] and blargg as checks; or aim at running games,
  judged by agreement with another emulator.
- **Costs:** dot granularity costs host time and the Color oracle is thin (inference);
  agreement with an emulator inherits its errors, as Mealybug's emulator-made images show.
- **Gains:** the hardware suites cover the monochrome models well and the Color partly;
  the [shootout][shootout] runs Mooneye, SameSuite, and the acid tests, though not gbmicrotest or AGE,
  so those results compare.
- **Used by:** the shootout; the README claims of SameBoy and [Mooneye GB][mooneye-gb].

### How to start a game

- **What:** start from post-boot state, accept the user's boot ROM optionally, require it, or write a replacement.
- **Costs:** post-boot start cannot match some Super Game Boy and Color timings and omits colourisation;
  requiring a file asks for a hardware dump; a replacement is work that must come from hardware descriptions alone.
- **Gains:** post-boot start ships nothing of Nintendo's and holds no logo;
  an optional file passes the tests that need the original; a replacement shows the boot animation.
- **Used by:** most emulators read start post-boot; [GSE][gse] requires the file; SameBoy ships a replacement.

### Colouring monochrome games on the Color

- **What:** reproduce the boot ROM's per-game palettes, offer one default palette set, or let the user choose palettes.
- **Costs:** per-game tables are firmware-derived and untested on hardware;
  a default set looks different for those games.
- **Gains:** a default or user choice holds no firmware data.
- **Used by:** SameBoy and Gambatte reproduce the tables; [Delta][delta-notes] offers custom palettes.

### Super Game Boy

- **What:** model the SNES side at a high level inside the Game Boy core,
  or run the SNES program in the SNES core that [`R1-15`][surveys] studies.
- **Costs:** a high-level model departs from the program's behaviour, and its built-in borders, palettes,
  and sound effects are firmware data held in the SNES program
  ([Pan Docs, "SGB Functions"][pd-sgb]); running the program needs the user's image.
- **Gains:** the first needs no file for the Game Boy side; the second matches the console.
- **Used by:** SameBoy and Gearboy, Gearboy reading borders and palettes from the user's image
  ([libretro, Gearboy][lr-gearboy]); [bsnes][bsnes], [higan][higan], and [ares][ares].

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** keep `R1-30` SameBoy as the full study, narrow `R1-31` Gambatte to its walled forks' prose and results,
  and add [docboy][docboy] as a study, since it is open and leads the [shootout][shootout].
  Gearboy is better covered by [`R1-92`][synthesis]'s feature baseline, where its breadth of mappers and ports matters.
- **Oracles:** adopt the hardware-referenced suites as the acceptance oracle,
  track the shootout's suites so results compare with other emulators,
  and record a [Mealybug][mealybug] pass as agreement with [Beaten Dying Moon][bdm].
  The hardware suites were run on consoles, while Mealybug's images come from one emulator.
- **Starting a game:** start from post-boot state by default, choosing the model by revision,
  with the user's boot ROM as an optional path for the tests that need it, and no replacement at first.
  A post-boot start is the boot-ROM-less form of [R0-02's recommendation][r0-02-rec],
  a replacement with the user's dump optional: it holds no logo and no firmware data,
  and what it cannot match is the boot timing of the Super Game Boy and Color and the boot ROM's colourisation,
  which the palette choice below replaces.
- **Colouring:** offer one default palette set and user choice,
  and reproduce no per-game table until a hardware test confirms one.
- **Super Game Boy:** model the SNES side's commands at a high level with no built-in borders or palettes,
  reading them from the user's SGB cartridge image when given, as Gearboy does, and otherwise drawing none;
  leave running the SNES program to the SNES core and `R1-15`, with the user's cartridge image.
- **Accuracy target:** model every documented revision of the DMG, MGB, SGB, SGB2, CGB 0 to E, and AGB selectably,
  with the video chip at dot granularity and the CPU per machine cycle,
  aiming at full passes of the hardware-referenced suites;
  the leaders' full passes of Mooneye and near-full passes of the acid tests on the shootout show that part can be met,
  while gbmicrotest and AGE results for them were not read.

## Implications for Rustalgia

- The studies recommended above feed [`R1-30`][studies], [`R1-31`][studies], and a possible [docboy][docboy] study,
  and their evidence feeds [`R1-90`][synthesis].
- A dot-level video chip and per-machine-cycle CPU, with selectable revisions, feed [`R2-01`][phase2],
  [`R2-03`][phase2], and [`R2-04`][phase2], and the quality targets in [`R6-02`][phase6].
- The post-boot start, the optional boot ROM,
  and the palette choice feed [`R2-12`][phase2] and the firmware ADR that [R1-01][r1-01-impl] anticipates.
- The test oracles feed [`R2-15`][phase2], with the [shootout][shootout] as a way to publish comparable results.
- The Super Game Boy split ties this family's core to the SNES core, which [`R2-10`][phase2]'s core boundary must allow.
- Store presence of Game Boy emulators, including GPL-licensed ones, bears on [`R3-03` and `R3-06`][phase3].

## Open questions

- How does the DMG LCD blend successive frames, as measured?
  A measurement of a console, which no source read holds.
- Do the boot ROM's per-game Color palettes match what hardware shows?
  A hardware test of the tables.

## Sources

Every source below was read on 2026-11-22.
Pan Docs was read at commit `f7f7b064f4de36cf9cb1372d1937e8e662a065cb`,
and repositories at their default branch on that date unless a pin is given.

Emulators, open tier:

- SameBoy: [README][sb], [licence file][sb-lic], [home page][sb-site], [features][sb-feat],
  [automation results][sb-auto] (version 1.0.5); release v1.0.5.
- [docboy README][docboy]; [GameRoy README][gameroy]; [rboy README][rboy]; [PyBoy README][pyboy];
  [binjgb README][binjgb]; [Gearboy README][gearboy] (release 3.8.22); [Mooneye GB README][mooneye-gb].
- [mGBA README][mgba] and [FAQ][mgba-faq]
  (release 0.10.5);
  [higan README][higan]; [ares README][ares] and [site][ares-site] (v148); [bsnes README][bsnes];
  [MesenCE README][mesence] (2.2.1); [RetroArch platforms page][retroarch] (1.22.2); [Lemuroid README][lemuroid];
  [EmulatorJS README][emulatorjs] and [Game Boy page][ejs-gb].

Emulators, walled tier (prose only):

- [gambatte-libretro README][gambatte-libretro]; [gambatte-core README][gambatte-core]; [Gambatte-Speedrun README][gsr];
  [GSE README][gse]; [Gambatte on SourceForge][gambatte-sf] (last update 2019-05-07).
- [VBA-M README][vbam] and [site][vbam-site] (v2.2.3); [VisualBoyAdvance on SourceForge][vba-sf];
  [GBE+ README][gbeplus]; [GiiBiiAdvance README][giibii]; [tgbdual-libretro README][tgbdual]; [BizHawk README][bizhawk];
  [Mednafen home][mednafen] and ["Game Boy" documentation][mednafen-gb] (1.32.1);
  [Delta README][delta] and [release notes][delta-notes]; [Provenance README][provenance];
  [GBC.emu page][gbcemu] and [EX emulators repository][exalpha]; [Goomba Color][goomba].

Emulators, closed tier (prose only; repositories not linked):

- [BGB home][bgb], [manual][bgb-manual], and [history][bgb-history] (1.6.7); [Emulicious home][emulicious],
  [licence][emulicious-lic], and [downloads page][emulicious-dl]; [Beaten Dying Moon][bdm], [web build][bdm-demo],
  and [test results][bdm-tests]; [KiGB][kigb] (v2.05); [VGB][vgb] (6.0); [NO$GMB][nocash],
  archived copy of 2026-10-30 15:14:08, the live host refusing automated requests; [OpenEmu site][openemu].
- Repositories with no licence: `github.com/sinamas/gambatte` (README only), `github.com/aappleby/metroboy`
  (README only),
  `github.com/chiplis/ironboy` (README only), `github.com/openemu/openemu`
  (README only), `github.com/rileytestut/gbcdeltacore` (metadata only).

Tests and results:

- [Mooneye Test Suite README][mooneye] (commit `31510e12`); [Mealybug Tearoom README][mealybug]
  (commit `70e88fb9`);
  [dmg-acid2][dmg-acid2]; [cgb-acid2][cgb-acid2]; [cgb-acid-hell][cgb-acid-hell];
  [SameSuite][samesuite] and its [sound README][samesuite-apu]; [gbmicrotest][gbmicrotest]; [AGE test ROMs][age].
- blargg's tests, read through the readme files of the closed mirror `github.com/retrio/gb-test-roms`.
- [GB Emulator Shootout][shootout], page updated 2026-06-04, and its [repository][shootout-repo] (commit `e7e6d807`).
- [gbdev wiki, "Test ROMs"][gg8-tests] (revision 938, 2020-03-31) and ["KiGB"][gg8-kigb]
  (revision 701, 2016-08-29),
  read through the raw export; [TASVideos, "GBAccuracyTests"][tv-gbacc]
  (last edited 2023-07-11),
  ["EmulatorResources"][tv-emures] (last edited 2026-11-13), ["Bizhawk"][tv-bizhawk] (2026-05-03),
  and ["Bizhawk/ReleaseHistory"][tv-bizhawk-rel] (2026-05-31).

References:

- Pan Docs: ["Power Up Sequence"][pd-boot], ["Rendering"][pd-rend], ["Pixel FIFO"][pd-fifo], ["STAT"][pd-stat],
  ["OAM Corruption Bug"][pd-oambug], ["Memory Map"][pd-map], ["Scrolling"][pd-scroll], ["Audio Details"][pd-audiodet],
  ["CGB Registers"][pd-cgb], ["SGB Functions"][pd-sgb]; and "The Cartridge Header",
  `src/The_Cartridge_Header.md` at the same commit, not linked because it holds the boot logo's bytes,
  as in [R1-01][r1-01].
- Gekkio, [GB: Complete Technical Reference][gbctr], revision 199 (2026-11-06);
  ["Dumping the Super Game Boy 2 boot ROM"][gekkio-sgb2]
  (2015, a personal blog, so a lead), read with code blocks set aside.
- [awesome-gbdev][awesome]; [libretro core pages][lr-index]: [Gambatte][lr-gambatte], [SameBoy][lr-sb],
  [Gearboy][lr-gearboy] (2026-11-03), [mGBA][lr-mgba], [VBA-M][lr-vbam], [TGB Dual][lr-tgbdual], [bsnes][lr-bsnes]
  (2026-10-24), [Mesen2][lr-mesen2], [Mesen-S][lr-mesens]; the pages without a date given were last updated 2026-10-22.
- Wikipedia: ["VisualBoyAdvance"][vba-wp] (1351614330), ["OpenEmu"][openemu-wp] (1361063123),
  ["Virtual Console"][vc-wp] (1386423035), ["Nintendo Switch Online"][nso-wp] (1384839693).

Maker material, law, and stores:

- Nintendo, ["Game Boy – Nintendo Switch Online"][nso], archived copy of 2023-12-10 11:37:07.
- Patents: [US 5,134,391][us5134391], [US 6,672,963][us6672963], [US 7,445,551][us7445551].
- GitHub DMCA archive: [the archive][dmca]; notices of [2014-05-13][dmca-2014], [2015-07-06][dmca-2015],
  and [2020-04-08][dmca-2020].
- Apple, [App Review Guidelines][apple-guide] (last updated 2026-10-16).
- Store listings: [App Store, Delta][as-delta]; [App Store, Provenance][as-prov]; [App Store, iGBA][as-igba];
  [App Store, SameBoy][as-sameboy]; [App Store search][itunes-search]; [Google Play, RetroArch][play-retroarch];
  [Google Play, GBC.emu][play-gbcemu]; [Google Play, My OldBoy!][myoldboy]; [Google Play, Pizza Boy C][pizzaboy];
  [Google Play, Lemuroid][play-lemuroid]; [F-Droid, Lemuroid][fdroid-lemuroid].

Project documents:

- [R0-02][r0-02], [R1-01][r1-01], [R1-05][r1-05]; [ADR 0006][adr6]; [the source register][register];
  [the research roadmap][roadmap]; [the research guide][guide].

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[register]: ../../../.claude/hooks/source-register.txt
[roadmap]: ../../roadmap/research.md
[guide]: ../README.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[synthesis]: ../../roadmap/research.md#landscape-synthesis
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[r0-02]: R0-02-legal-baseline.md
[r0-02-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r0-02-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r0-02-rec]: R0-02-legal-baseline.md#recommendation
[r0-02-logos]: R0-02-legal-baseline.md#boot-logos
[r0-02-takedown]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r0-02-patents]: R0-02-legal-baseline.md#patents-on-emulation
[r1-01]: R1-01-primer-8-and-16-bit.md
[r1-01-video]: R1-01-primer-8-and-16-bit.md#video
[r1-01-boot]: R1-01-primer-8-and-16-bit.md#boot-roms-and-firmware
[r1-01-impl]: R1-01-primer-8-and-16-bit.md#implications-for-rustalgia
[r1-01-lockout]: R1-01-primer-8-and-16-bit.md#lock-out
[r1-01-tests]: R1-01-primer-8-and-16-bit.md#tests-and-their-oracles
[r1-05]: R1-05-catalogue-8-and-16-bit.md
[sb]: https://github.com/LIJI32/SameBoy
[sb-lic]: https://github.com/LIJI32/SameBoy/blob/master/LICENSE
[sb-site]: https://sameboy.github.io/
[sb-feat]: https://sameboy.github.io/features/
[sb-auto]: https://sameboy.github.io/automation_frame/
[docboy]: https://github.com/Docheinstein/docboy
[gameroy]: https://github.com/Rodrigodd/gameroy
[rboy]: https://github.com/mvdnes/rboy
[pyboy]: https://github.com/Baekalfen/PyBoy
[binjgb]: https://github.com/binji/binjgb
[gearboy]: https://github.com/drhelius/Gearboy
[mooneye-gb]: https://github.com/Gekkio/mooneye-gb
[mgba]: https://github.com/mgba-emu/mgba
[mgba-faq]: https://mgba.io/faq.html
[higan]: https://github.com/higan-emu/higan
[ares]: https://github.com/ares-emulator/ares
[ares-site]: https://ares-emu.net/
[bsnes]: https://github.com/bsnes-emu/bsnes
[mesence]: https://github.com/nesdev-org/MesenCE
[retroarch]: https://www.retroarch.com/platforms.html
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[emulatorjs]: https://github.com/EmulatorJS/EmulatorJS
[ejs-gb]: https://emulatorjs.org/docs/systems/nintendo-game-boy
[gambatte-libretro]: https://github.com/libretro/gambatte-libretro
[gambatte-core]: https://github.com/pokemon-speedrunning/gambatte-core
[gsr]: https://github.com/pokemon-speedrunning/gambatte-speedrun
[gse]: https://github.com/CasualPokePlayer/GSE
[gambatte-sf]: https://sourceforge.net/projects/gambatte
[vbam]: https://github.com/visualboyadvance-m/visualboyadvance-m
[vbam-site]: https://www.visualboyadvance-m.org/
[vba-sf]: https://sourceforge.net/projects/vba
[gbeplus]: https://github.com/shonumi/gbe-plus
[giibii]: https://github.com/AntonioND/giibiiadvance
[tgbdual]: https://github.com/libretro/tgbdual-libretro
[bizhawk]: https://github.com/TASEmulators/BizHawk
[mednafen]: https://mednafen.github.io/
[mednafen-gb]: https://mednafen.github.io/documentation/gb.html
[delta]: https://github.com/rileytestut/Delta
[delta-notes]: https://faq.deltaemulator.com/release-notes
[provenance]: https://github.com/Provenance-Emu/Provenance
[gbcemu]: https://www.explusalpha.com/contents/gbc-emu
[exalpha]: https://github.com/Rakashazi/emu-ex-plus-alpha
[goomba]: https://www.dwedit.org/gba/goombacolor.php
[bgb]: https://bgb.bircd.org/
[bgb-manual]: https://bgb.bircd.org/manual.html
[bgb-history]: https://bgb.bircd.org/history.html
[emulicious]: https://emulicious.net/
[emulicious-lic]: https://emulicious.net/License.txt
[emulicious-dl]: https://emulicious.net/downloads/
[bdm]: https://mattcurrie.com/bdm/
[bdm-demo]: https://mattcurrie.com/bdm-demo/
[bdm-tests]: https://mattcurrie.com/bdm-demo/test-results.html
[kigb]: http://kigb.emuunlim.com/
[vgb]: https://fms.komkon.org/VGB/
[nocash]: http://web.archive.org/web/20261030151408/http://problemkaputt.de/gmb.htm
[openemu]: https://openemu.org/
[mooneye]: https://github.com/Gekkio/mooneye-test-suite/blob/31510e12eea6286d36eea060a6adde755e1067aa/README.markdown
[mealybug]: https://github.com/mattcurrie/mealybug-tearoom-tests/blob/70e88fb90b59d19dfbb9c3ac36c64105202bb1f4/README.md
[dmg-acid2]: https://github.com/mattcurrie/dmg-acid2
[cgb-acid2]: https://github.com/mattcurrie/cgb-acid2
[cgb-acid-hell]: https://github.com/mattcurrie/cgb-acid-hell
[samesuite]: https://github.com/LIJI32/SameSuite
[samesuite-apu]: https://github.com/LIJI32/SameSuite/blob/master/apu/README.md
[gbmicrotest]: https://github.com/aappleby/gbmicrotest
[age]: https://github.com/c-sp/age-test-roms
[shootout]: https://gbdev.io/GBEmulatorShootout/
[shootout-repo]: https://github.com/gbdev/GBEmulatorShootout
[gg8-tests]: https://gbdev.gg8.se/wiki/articles/Test_ROMs
[gg8-kigb]: https://gbdev.gg8.se/wiki/articles/KiGB
[tv-gbacc]: https://tasvideos.org/EmulatorResources/GBAccuracyTests
[tv-emures]: https://tasvideos.org/EmulatorResources
[tv-bizhawk]: https://tasvideos.org/Bizhawk
[tv-bizhawk-rel]: https://tasvideos.org/Bizhawk/ReleaseHistory
[pd-boot]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Power_Up_Sequence.md
[pd-rend]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Rendering.md
[pd-fifo]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/pixel_fifo.md
[pd-stat]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/STAT.md
[pd-oambug]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/OAM_Corruption_Bug.md
[pd-map]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Memory_Map.md
[pd-scroll]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Scrolling.md
[pd-audiodet]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/Audio_details.md
[pd-cgb]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/CGB_Registers.md
[pd-sgb]: https://github.com/gbdev/pandocs/blob/f7f7b064f4de36cf9cb1372d1937e8e662a065cb/src/SGB_Functions.md
[gbctr]: https://gekkio.fi/files/gb-docs/gbctr.pdf
[gekkio-sgb2]: https://gekkio.fi/blog/2015/dumping-the-super-game-boy-2-boot-rom/
[awesome]: https://github.com/gbdev/awesome-gbdev
[lr-index]: https://docs.libretro.com/
[lr-gambatte]: https://docs.libretro.com/library/gambatte/
[lr-sb]: https://docs.libretro.com/library/sameboy/
[lr-gearboy]: https://docs.libretro.com/library/gearboy/
[lr-mgba]: https://docs.libretro.com/library/mgba/
[lr-vbam]: https://docs.libretro.com/library/vba_m/
[lr-tgbdual]: https://docs.libretro.com/library/tgb_dual/
[lr-bsnes]: https://docs.libretro.com/library/bsnes/
[lr-mesen2]: https://docs.libretro.com/library/mesen2/
[lr-mesens]: https://docs.libretro.com/library/mesen-s/
[vba-wp]: https://en.wikipedia.org/w/index.php?title=VisualBoyAdvance&oldid=1351614330
[openemu-wp]: https://en.wikipedia.org/w/index.php?title=OpenEmu&oldid=1361063123
[vc-wp]: https://en.wikipedia.org/w/index.php?title=Virtual_Console&oldid=1386423035
[nso-wp]: https://en.wikipedia.org/w/index.php?title=Nintendo_Switch_Online&oldid=1384839693
[nso]: https://web.archive.org/web/20231210113707/https://www.nintendo.com/us/whatsnew/get-a-taste-of-old-school-portable-power-with-game-boy-nintendo-switch-online/
[us5134391]: https://patents.google.com/patent/US5134391A/en
[us6672963]: https://patents.google.com/patent/US6672963B1/en
[us7445551]: https://patents.google.com/patent/US7445551B1/en
[dmca]: https://github.com/github/dmca
[dmca-2014]: https://github.com/github/dmca/blob/master/2014/2014-05-13-Nintendo.md
[dmca-2015]: https://github.com/github/dmca/blob/master/2015/2015-07-06-nintendo.md
[dmca-2020]: https://github.com/github/dmca/blob/master/2020/04/2020-04-08-Nintendo.md
[apple-guide]: https://developer.apple.com/app-store/review/guidelines/
[as-delta]: https://apps.apple.com/app/id1048524688
[as-prov]: https://apps.apple.com/app/id1596862805
[as-igba]: https://apps.apple.com/app/id6482993626
[as-sameboy]: https://apps.apple.com/app/id6496971295
[itunes-search]: https://itunes.apple.com/search?term=game+boy+emulator&entity=software
[play-retroarch]: https://play.google.com/store/apps/details?id=com.retroarch
[play-gbcemu]: https://play.google.com/store/apps/details?id=com.explusalpha.GbcEmu
[play-lemuroid]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[myoldboy]: https://play.google.com/store/apps/details?id=com.fastemulator.gbc
[pizzaboy]: https://play.google.com/store/apps/details?id=it.dbtecno.pizzaboy
[fdroid-lemuroid]: https://f-droid.org/packages/com.swordfish.lemuroid/
