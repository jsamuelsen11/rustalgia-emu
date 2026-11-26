---
title: "PlayStation 2: family survey"
roadmap_item: R1-19
status: draft
date: 2026-11-25
---

# PlayStation 2: family survey

## Summary

This note asks which emulators matter for the PlayStation 2 family, what each one does,
what legal exposure the family carries, and how hard the family is to emulate.

[PCSX2][pcsx2] dominates: it is open tier, active since 2001, and the base of most widely used PS2 emulators,
including the libretro cores and the ARM64 fork [ARMSX2][armsx2].
[Play!][play] is the only mature emulator with its own code base, and its built-in high-level BIOS is closed tier.

The legal picture turns on the BIOS and on store conduct, not on encryption:
retail games reach an emulator as plain images, every emulator found but Play!
and PS5SX2 asks for a user's BIOS dump, and no action by Sony against a PS2 emulator was found.

For Rustalgia, the family needs recompilers for several processors and a graphics chip
that host GPUs do not express directly.
The note recommends keeping the roadmap's PCSX2 and Play!
studies, testing against [ps2autotests][ps2at], whose results come from a console,
and building firmware support around the user's own dump while leaving MagicGate, DVD video, and KELF files out.

## Scope

- Question: which emulators are popular or respected for the PlayStation 2 family, and for each, what are its status,
  licence, tier, techniques, and hosts; what legal exposure does the family carry; and how hard is it to emulate?
- Covered: every SCPH model, original and slim, and the PSX video recorder
  (DESR models), as [R1-07][r107-home] lists them, with PlayStation 1 compatibility only as PS2 emulators model it.
  The Namco System 246 family and other PS2-based arcade boards belong to [R1-25][surveys] and appear here only
  as features of emulators.
  How the hardware works is in [R1-03][r103-ee] and, for the PlayStation 1 parts, [R1-02][r102];
  the PS1 emulators are in [R1-18][r118]; the law is in [R0-02][r002].
  This note cites those and does not repeat them.
- Researched on 2026-11-25 by three research agents, one each for emulators, distribution, and law and difficulty,
  who read every source as raw text and quoted only from it; the writer checked gaps with further fetches,
  one pass of fresh verifiers checked each claim against its source, and a fix pass applied their findings
  (research log).
- Every emulator was read from prose and repository metadata only, whatever its tier.
  No emulator source file, issue, pull request, BIOS reimplementation, firmware, game, key, or dumping guide was opened,
  and the tainted PlayStation reference was opened in no form, even where a page links it.
  One page found to describe decrypted Sony emulator files and a key script, `psdevwiki.com/ps3/PS2_Emulation`,
  is closed as a key hazard; its copy was deleted and nothing from it is used.
- Markers follow the [research guide][guide].
  Wikipedia is tertiary and named wherever a fact rests on it.
  The [Emulation General wiki][egw-ps2], a lead in the [register][register], is marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, installs, store and frontend presence), respect
  (tested accuracy claims, or use as a base by others), or history (it shaped the family, or the maker made it).
- Status is the repository's archived flag and last push from `gh api repos/OWNER/REPO`, read on 2026-11-25,
  and the latest release from the releases endpoint or, where the guard blocked it, from the project's own site.
  Some metadata already shows 2026-11-26 in UTC.
- Each tier was checked against the [register][register], as ADR 0006 requires when a survey covers a source
  ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  No existing line's tier changed.
  One licence field changed: [pcsx2.net][pcsx2-ip] now says its own material is "copyright PCSX2 under the MIT License",
  where the register said "none stated".
  Play!'s licence file is still the two-clause BSD text,
  though GitHub's metadata reads NOASSERTION and [libretro's page][lr-play] says MIT; the licence file wins.
- Every replacement or high-level BIOS found is closed wherever it is hosted
  ([ADR 0006, "Closed tier"][adr6-closed]):
  Play!'s built-in BIOS, `TamaribaEmu/OpenPS2BIOS` as shipped by PS5SX2, and fps2bios,
  which [PCSX2's PS1 page][pcsx2-psx] cites without saying what it is (a free PS2 BIOS, from memory).
  Their paths inside the open repositories that hold them are not known from prose,
  so the register cannot yet close them by path; no listing was read to find them.
- Closed repositories are named in code spans, never linked.
  Closed phone apps get no register line of their own; the store lines cover their listings.

### The emulators compared

Key: push is the last push to the repository; "dump" means the user supplies a BIOS image;
"HLE" means the emulator provides BIOS services itself; "repl." means it ships a replacement BIOS; Win, Mac, Lin, And,
and iOS name hosts; "lr" is a libretro core.

| Emulator | Tier | Licence | Status | CPU | BIOS | Hosts |
|---|---|---|---|---|---|---|
| PCSX2 | open | GPL-3.0 | 2.8.2, 2026-09-04 | x86-64 recompilers | dump | Win, Mac, Lin |
| LRPS2 | open | GPL-3.0 | push 2026-11-25 | PCSX2's; arm64 in progress | dump | lr |
| PCEE2 | open | GPL-3.0-or-later | push 2026-11-25; no releases | PCSX2's | dump | lr |
| ARMSX2 | open | GPL-3.0 | 2.9.7, 2026-11-26 | arm64 recompilers | dump | And, iOS, ARM64 desktops |
| XBSX2 | open | GPL-3.0 | push 2026-11-01 | PCSX2's | dump | Xbox (UWP) |
| PS5SX2 | open; BIOS closed | GPL-3.0-or-later | push 2026-11-24 | PCSX2's | dump or repl. | jailbroken PS5 |
| Play! | open; HLE closed | BSD-2-Clause | 0.74, 2026-03-02 | JIT | HLE only | Win, Mac, Lin, And, iOS, web, lr |
| DobieStation | open | GPL-3.0 | push 2021-07-25 | not stated | dump | Win, Mac, Lin |
| Iris | open | MIT | 0.20-alpha, 2026-03-01 | interpreter | dump | Win, Mac, Lin |
| hpsx64 | open | GPL-3.0 | v0500, 2026-09-19 | not stated | not stated | Win |
| AetherSX2 | closed | CC BY-NC-ND 4.0 | ended 2023; delisted 2024 | not stated | dump | And |
| NetherSX2 | closed | patch of AetherSX2 | 2.2n, 2025-12-25 | AetherSX2's | dump | And |
| DamonPS2 | closed | proprietary | 6.4.0, 2026-11-01 | not stated | dump | And |
| orbum | open | GPL3 by README | archived; push 2018-10-10 | not stated | dump | not stated |
| Sony's emulators | closed | maker's | PS3, PS4, PS5 | hybrid, then software | maker's | Sony hardware |

Sources by row: each project's README, site, store page, or Flathub entry, as cited in its paragraph below;
GPL-3.0 means a licence file with neither "only" nor "or later" in the repository's own text.

### PCSX2

- [PCSX2][pcsx2] has 16,151 stars and 2,480 forks, the most of any PS2 emulator found;
  its last stable release is v2.8.2 of 2026-09-04, and nightly pre-releases run to v2.9.192 of 2026-11-23 (metadata).
  On Flathub it shows 1,340,121 installs ([Flathub, PCSX2][fh-pcsx2]).
  Its 2.0 announcement says it "passed 100 million downloads" ([PCSX2 2.0][pcsx2-20]).
- It began "Around the middle of 2001", by the authors of the PS1 emulator PCSX
  ([Refraction, "The History of PCSX2"][pcsx2-hist], 2010, in a 2017 capture).
  The README describes it as "using a combination of MIPS CPU Interpreters,
  Recompilers and a Virtual Machine which manages hardware states and PS2 system memory",
  with "more than 2500 titles tested" ([PCSX2 README][pcsx2]).
  The 2.0 release added fast memory access to its EE and VU recompilers, merged its plug-ins into the core,
  and set floating-point clamping automatically ([PCSX2 2.0][pcsx2-20]).
- Its licence history is mixed but always open.
  The licence file is the GPL v3 text, and the site says "Unless otherwise stated,
  all components of the PCSX2 emulator are licensed under the GNU General Public License Version 3.0+"
  ([PCSX2, "Trademark and Copyright"][pcsx2-ip]).
  In 2021 the project wrote that "PCSX2's core code is LGPLv3 licensed, which is compatible with the GPLv3 license",
  with three GPL parts that made the whole GPLv3
  ([PCSX2, "AetherSX2 brings PCSX2 to mobile"][pcsx2-aether]),
  while Wikipedia says GPL-3.0-or-later from 0.9.7 in 2009 ([Wikipedia, "PCSX2"][w-pcsx2]; tertiary).
  When the core moved from LGPL to GPL was not found in any prose read.
- Graphics are its largest area of work.
  It renders through Direct3D 11 and 12, Vulkan, OpenGL, and software, which "Renders graphics on your CPU,
  instead of your GPU, for maximum accuracy" ([PCSX2, "General" settings][pcsx2-gen]), and through Metal on macOS
  ([PCSX2, "Requirements"][pcsx2-req]).
  Release 2.8 makes Direct3D 12 "now at parity with Vulkan" and adds rasterizer-ordered views and integer depth writes
  ([PCSX2 2.8.0][pcsx2-28]); the settings page, which calls Direct3D 12 the least accurate, predates it.
- It offers upscaling, texture replacement, RetroAchievements, and per-game automatic fixes
  ([PCSX2 2.0][pcsx2-20]), and a debugger for the R5900 and R3000 ([PCSX2, "Debugger"][pcsx2-dbg]).
  Its settings expose the timing and arithmetic approximations as named options: EE cycle rate and skip, instant VU1,
  VU1 on its own thread, and EE and VU rounding and clamping ([PCSX2, "Performance"][pcsx2-perf]).
- Hosts are Windows 10 and later, macOS 11 and later, and Linux by AppImage or Flatpak, on an x86-64 CPU with SSE4.1;
  on M-series Macs "PCSX2 runs via the translation layer Rosetta 2" ([PCSX2, "Requirements"][pcsx2-req]).
  ARMSX2's README says upstream ships an ARM64 interpreter build but recompiles only to x86-64 ([ARMSX2][armsx2]);
  the asset names of the five latest releases name no arm64 build (observed), so the interpreter build is not confirmed.
  PCSX2 itself has no Android, iOS, or console build.
- It requires a BIOS: "a BIOS dump from a legitimately-owned PS2 console is required to use the emulator" (README),
  and its BIOS page, which [R0-02][r002-how] quotes, says "no open-source alternative exists".
  That page, `pcsx2.net/docs/setup/gather`, is a dumping guide, closed here, and was not opened again.
  From memory, PCSX2 handles a few I/O processor services itself, such as host file access; this was not checked.

### Other PCSX2 lineages

- LRPS2 is libretro's "heavily modified hard fork" of PCSX2,
  whose repository `libretro/ps2` now redirects to [libretro/parallel-ps2][lrps2] (metadata, 90 stars, push 2026-11-25).
  Its documentation says "This core does not work natively on ARM hardware" and needs real BIOS images
  ([libretro, "LRPS2"][lr-lrps2], last updated 2026-10-22), as does [RetroArch's PS2 page][ra-ps2].
  Its README now leads with an AArch64 port, with estimated coverage of about 89 % for the EE recompiler,
  98 % for the IOP, and 70 % for VU1, and a VU1 recompiler taken from ARMSX2 ([LRPS2 README][lrps2]).
  The libretro build server already lists the core for Android arm64, iOS, and tvOS
  (observed, [libretro nightly builds][buildbot], 2026-11-25); whether those builds run was not established.
- The same README describes a software model of the PS2's floating point, with no NaN or infinity, chopped rounding,
  and the adder's and multiplier's truncations,
  "validated against the reference implementation from PCSX2's own research (31.9 million cross-checked cases)"
  ([LRPS2 README][lrps2]).
  It claims byte-exact results against hardware for the operations covered, but shows no hardware oracle.
  It also describes an "HLE hook" on the IOP's module imports;
  that high-level part is closed by rule as system software, and its extent is not known from prose (inference).
- [paraLLEl-GS][pgs], by Themaister, is a GS renderer on Vulkan compute shaders, LGPL-3.0, used by LRPS2, PCEE2,
  and Iris. libretro says it aims "to be as accurate as the software renderer"
  and "uses no per-game specific rendering fixes" ([libretro blog, LRPS2][lr-blog], 2025-01-05).
- PCEE2 is a second libretro core, "a libretro port of current upstream PCSX2", and experimental
  ([libretro, "PCEE2"][lr-pcee2]); its repository was created on 2026-06-05 (metadata).
  Its README says "GPL-3.0+, same as PCSX2", that it is not endorsed by the PCSX2 team,
  that iOS builds have never run because JIT "needs an entitlement a stock install does not grant",
  and that Namco System 246 and 256 games run with board code from another project, PCSX2x6 ([PCEE2 README][pcee2]).
  The README links a game collection on a web archive for those boards, which is closed and was not opened.
- [ARMSX2][armsx2] is a "Native ARM64 JIT Fork of PCSX2", created on 2025-08-11, with 2,584 stars (metadata).
  It claims EE, VU, and IOP recompilers "fully complete with extensive unit test framework",
  an "Enhanced interpreter with no known accuracy divergence tested against real ps2 hardware",
  hardware-accurate floating point, and its own Adreno and Mali drivers, and publishes no test results (README).
  It says "However, we still use AI for development." (README).
  It runs on Android 8 and later on arm64, on iOS 18 with a sideloaded JIT enabler, on Apple Silicon Macs, Linux ARM64,
  and Windows 11 on ARM ([ARMSX2, "System requirements"][armsx2-req]), and needs a user's BIOS.
  Its Google Play listing shows "500K+" downloads and a rebase on "the latest PCSX2 2.7 core"
  ([Google Play][armsx2-gp]).
  Its team calls Pontos's Android port of PCSX2 "the same source material we originally built this entire project
  around" ([Time Extension, October 2025][timeext], quoting the team; secondary).
  That port is by inference `pontos2024/PCSX2_ARM64`, which PSX2 forks and which has no licence file (metadata).
  ARMSX2 stays open: its repository is a GitHub fork of PCSX2 with the GPL-3.0 licence file (metadata),
  and no prose of its own says it holds the port's code.
  If it does, the code taken from an unlicensed repository would be walled, which is a risk for its study.
- [XBSX2][xbsx2] is a fork of PCSX2 "adapted for UWP/Xbox environments",
  recommended on Xbox Series consoles and limited on Xbox One, and needs a dumped BIOS (README).
- [PS5SX2][ps5sx2] runs PCSX2 "natively on a jailbroken PS5", with Vulkan through a modified driver,
  up to 6 times native resolution, and online play through an emulated network adapter (README).
  It needs a helper payload that "jailbreaks PS5SX2 when it starts", and says "Without one, PS5SX2 offers OpenPS2BIOS,
  an experimental open-source BIOS it ships" (README).
  That BIOS is closed, as is `lineage-shell/lineage-ps2-for-ps5`, described in search metadata as a PS2 system menu.
- [EmuCoreX][emucorex], an Android frontend on "a PCSX2-derived emulation core" (README),
  with "100K+" downloads and in-app purchases
  ([Google Play][emucorex-gp]),
  and [TabStationToo][tabst], PCSX2 compiled to WebAssembly, are further GPL-3.0 ports by their licence metadata.
  `DiscoStarslayer/pcsx2-reliquary`, a fork aimed at "security flows" and MagicGate, needs user key files
  ([Emulation General, "PlayStation 2 emulators"][egw-ps2]; lead);
  it was not opened and is left unregistered, so walled, with a key hazard to check before any evaluation.

### Play

- [Play!][play] has been written by Jean-Philip Desjardins since 2006
  (licence file), with 2,739 stars, a last push on 2026-10-26, and no GitHub releases (metadata).
  Flathub's latest release is 0.74 of 2026-03-02, with 56,654 installs
  ([Flathub, Play!][fh-play]);
  the project's devlog last posted 0.68 on 2024-12-03 ([purei.org][purei]);
  its Google Play app shows "1M+" downloads and was last updated on 2 June 2025 ([Google Play][play-gp]).
- "Play!
  uses a built-in high-level emulation BIOS.
  Using an external BIOS file is not necessary or possible." ([Play! README][play]).
  That component is closed by rule, and the rest of the repository stays open.
  Its site adds "Easy configuration.
  No custom settings to fix specific games." ([purei.org, "About"][purei-about]).
- It runs on Windows, macOS, Linux, Android, iOS, and the web, uses JIT code generation,
  and on iOS crashes without JIT (README).
  Its web build cannot invalidate its JIT cache when games load EE modules,
  and has no control of the floating-point environment (README).
  The libretro core is OpenGL only and "still experimental but promising" ([libretro, "Play!"][lr-play]).
- Playable counts grew from "the milestone of 600 playable games" in 0.54 (2022) to "Over 930 games confirmed to be
  playable" in 0.61 (2023), which also added preliminary Namco System 246 support; 0.62 added System 256
  ([purei.org][purei]).
  Its compatibility tracker is a repository of issues and was not opened.

### Accuracy work and new emulators

- [DobieStation][dobie] is "A young PS2 emulator with plans for an optimized Android port, as well as a fast, accurate,
  and easy-to-use PC port", which says some titles go in-game and that it is "Not intended for general use" (README).
  It needs a dumped BIOS and has an option to skip the boot animation (README).
  It is not archived, but its last push was on 2021-07-25 (metadata).
  Its author also wrote [ps2tek][ps2tek], the open hub that R1-03 relies on.
  Emulation General calls it "focused on accuracy, and therefore inherently slower than Play!
  or PCSX2" (lead).
- [Iris][iris] is an MIT-licensed PS2 emulator begun in 2024, with a Vulkan GS renderer up to 16 times supersampling,
  paraLLEl-GS, and "Feature-packed debugger" (README).
  It runs the EE by interpreter, with recompilers for the EE and VUs listed as future work (README).
  Its README says it was the first PS2 emulator to boot the PSX video recorder's BIOS,
  which stops at error screens after the boot animation, and aims at PS2-based arcade boards, the DVD player, and Linux.
- hpsx64, the "Highly-Experimental Playstation Simulator for x64 based systems",
  is a GPL-3.0 Windows project on SourceForge that publishes source releases only, the latest v0500 on 2026-09-19
  ([SourceForge metadata][hpsx64]);
  that it covers both the PS1 and the PS2 is from memory, as the metadata names neither,
  and its project page refused scripts (research log).

| Emulator | Language | Tier | Licence | Note |
|---|---|---|---|---|
| [RustEE][rustee] | Rust | open | MIT | README is images and a weekly EE and bus test badge |
| [PS2e][ps2e] | Rust | open | MIT | x86-64 recompilers for EE, IOP, VU1; software GS; needs a BIOS |
| [ps2rs][ps2rs] | Rust | open | MIT | no stars; last push 2026-01-03 |
| [Cosmic Station][cosmic] | Kotlin, C++ | open | MIT | Android only, from scratch; last push 2024-07-23 |
| [MoeStation][moe] | C++ | open | MIT | last push 2023-03-31 |
| `ollef/pups2` | Rust | closed | none | no licence; not linked |

- Sources: each repository's metadata and, for RustEE, PS2e, and Iris, its README;
  none of those READMEs names the tainted reference or ps2tek (observed).
- PS2e says its regression check is that "a screenshot from a fixed cycle count is bit-identical run to run",
  that "VU1 has no timing model", and that a 4 MiB BIOS such as SCPH-50000 "is required and not included"
  ([PS2e README][ps2e]).

### Closed apps on Android

- AetherSX2, by Tahlreth, was "based on an LGPL licensed emulator for PC
  (that's us!)",
  in PCSX2's words, which say the developer promised to drop the GPL parts so that "the emulator will be entirely LGPL"
  ([PCSX2, "AetherSX2 brings PCSX2 to mobile"][pcsx2-aether], 2021-11-24).
  Its store listing put the app under the "Creative Commons Attribution-NonCommercial-NoDerivatives International
  License" and required "A BIOS image" dumped from the user's console ([Google Play, 2022 capture][aether-gp22]).
  No source release by its developer was found (web searches, 2026-11-25).
- Its site announced "AetherSX2 development is indefinitely suspended." between 2022-12-07 and 2023-01-04,
  blaming impersonation and death threats ([AetherSX2 site, 2023 capture][aether-site]).
  The listing reached "5M+" downloads and later "Contains ads", against the FAQ's promise of no ads
  ([Google Play, 2024 capture][aether-gp24]; [AetherSX2 FAQ, 2023 capture][aether-faq]);
  captures return 404 from 2024-03-11, so it left Google Play between 2024-03-07 and 2024-03-11, for a reason not found
  (observed, Wayback index of the listing).
- NetherSX2, `Trixarian/NetherSX2-patch`
  (2,809 stars),
  redistributes modified AetherSX2 build 4248 APKs to remove ad services, fix RetroAchievements, and re-sign the app;
  a "Classic" variant patches build 3668 (README; metadata).
  Its Unlicense covers only the patch author's files, so the repository is closed: it carries a closed,
  no-derivatives program (inference from the listing's licence).
  Rehosted builds sit at `AetherSX2-backup/AetherSX2-builds`, which is closed.
- DamonPS2 is commercial: its repository's licence file calls it "commercial software.
  All rights are reserved!" (`damonplay/DamonPS2`, closed).
  PCSX2's statement of 2018 says its game database "contained patches that were specific to PCSX2",
  with matching disc strings and "graphical output that mirrors GSdx"
  ([PCSX2, DamonPS2 statement][pcsx2-damon], 11 January 2018).
  Its free app now shows "10M+" downloads, ads, and in-app purchases, claims "more than 90%" of PS2 games,
  and says "Due to legal restrictions, we will not provide any game ROM and BIOS image to players."
  ([Google Play, DamonPS2][damon-gp]).
- Name-borrowing and paid clones are common, such as an "AetherSX2 Emulator" not by Tahlreth
  (observed, Google Play search for "ps2 emulator")
  and PSX2 at $4.99, a fork of `PCSX2_ARM64`
  ([Google Play][psx2-gp]);
  ARMSX2's team warned users "to NOT fall for the trap" of PSX2 ([Time Extension][timeext]; secondary).

### Historical emulators

- orbum is a GPL3 PS2 emulator by its README, with no licence file, archived and last pushed in 2018,
  which asks for `scph10000.bin` in a BIOS folder ([orbum README][orbum]); the README's licence statement keeps it open.
- NeutrinoSX2 (GPLv2) and PS2emu (proprietary) are early Windows projects known only from [Emulation General][egw-ps2]
  (lead); their sites were not opened.
  MAME's PS2 driver is "at skeleton stage" (same; lead).
- PCSX2's first release was on 2002-03-23
  ([Wikipedia, "PCSX2"][w-pcsx2]; tertiary);
  its history credits the VU and EE recompilers of 0.9.1
  (June 2006) to Zerofrog and major GSdx improvements after 0.9.4 to Gabest ([Refraction][pcsx2-hist]).

### Sony's own emulators

- On the PlayStation 3, European 60 GB (CECHC)
  and CECHE 80 GB models replaced the Emotion Engine with "an emulated version via the Cell Broadband Engine"
  while keeping the Graphics Synthesizer, and the 40 GB and later models lack PS2 compatibility
  ([Wikipedia, "PlayStation 3 models"][w-ps3m]; tertiary).
  The first models carried both PS2 chips (from memory).
  PS2 Classics were on sale for the PS3 by October 2011 (same).
- On the PS4, Sony's blog announced eight PS2 games "in up-rendered 1080p" with Trophies, Remote Play, and Share Play
  ([PlayStation Blog, 4 December 2015][psb-2015]); the post never uses the word emulator (observed, text search).
  PS4 releases also play on the PS5 ([Wikipedia, "List of downloadable PlayStation 2 games"][w-ps2dl]; tertiary),
  and PlayStation Plus Premium carries them with "improved frame rates and higher-quality resolution"
  ([PlayStation Blog, 16 May 2022][psb-2022]).
  Who wrote these emulators, and their names, are not in any maker prose found.

### Frontends, stores, and hosts

- RetroArch has three PS2 cores, LRPS2, PCEE2, and Play!
  ([libretro, "PCEE2"][lr-pcee2]),
  and none is offered as a Steam add-on: the 65 cores listed
  for [RetroArch on Steam][ra-steam] include no PS2 core (observed).
  Steam store searches for PCSX2 and for PS2 emulators returned no items (observed, 2026-11-25).
- On iOS, Apple bars apps that "download, install,
  or execute code which introduces or changes features or functionality of the app"
  ([App Review Guidelines][apple], 2.5.2)
  and grants JIT only to alternative browser engines in the European Union
  ([Apple, "Alternative browser engines"][apple-browser]).
  libretro writes "JIT is not enabled on the App Store version of RetroArch" ([libretro, "RetroArch on iOS"][lr-ios]).
  So every working iOS route found needs JIT from a jailbreak, a debugger, or a sideloading tool: Play!
  (README), ARMSX2 with LiveContainer and StikDebug ([ARMSX2, "iOS installation"][armsx2-ios]), and Provenance's Play!
  core, "only playable with JIT" ([Provenance README][prov]).
- App Store apps that claim the PS2, such as "iPSX2", "an experimental PlayStation 2 emulator"
  ([App Store][as-ipsx2]),
  were not verified, and none says how it runs at speed without JIT;
  one named "AetherSX2" is a guide app by an unrelated seller ([App Store][as-aether]).
- OpenEmu's PCSX2 plug-in, `OpenEmu/PCSX2-Core`, has no licence file and is closed;
  whether OpenEmu ships it was not established
  (search of [openemu.org][openemu] and its release pages, which render by script).

### PlayStation 1 mode and the PSX

- PCSX2 says "PCSX2 can run some PSX (PS1) games but this feature is highly experimental and not intended
  for general use", recommends DuckStation, and needs a BIOS older than version 2.20 for it
  ([PCSX2, "Backwards Compatibility"][pcsx2-psx]).
- The same page links the tainted reference under its own heading and points to fps2bios,
  so its account of how the hardware runs PS1 games is not relied on
  (it may rest on the tainted document at one remove; inference).
  The page does not make PCSX2 walled: ADR 0006's rule is for an emulator that mainly uses the tainted document
  ([ADR 0006, "Sources that are not emulators"][adr6-kinds]), and this is one page of many.
- Play!
  has no PS1 mode (Emulation General; lead), and no other PS2 emulator read describes one.
  The PS1 side of the family is therefore best served by the PS1 emulators in [R1-18][r118] (inference).
- From the SCPH-7500x, a PowerPC part replaces the I/O processor ([R1-03][r103-ee]),
  and Emulation General says only earlier BIOS images run PS1 games in PCSX2 (lead),
  which agrees with PCSX2's version limit.
- The PSX video recorder appears only in Iris, which boots its BIOS partly
  (Iris README, above); no other emulator read models it.

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Protection is in the drive, not in the image.
  An English court described PS2 consoles and games as having "a two part copy protection system",
  one part in the console and one on the disc,
  and recorded as undisputed that Sony's system is "a copy-protection means"
  ([Sony v Ball][ball], Laddie J, 2004, summary judgment);
  R0-02 cites the case only on territory ([R0-02, "The United Kingdom"][r002-uk]).
  The same judgment holds that "RAM containing a copy of Sony's copyright work is a reproduction in material form"
  (same), which would reach an emulator's RAM copy of an unlicensed game or BIOS (inference; first instance only).
- In the United States, Divineo held modchips and a hard-disk loader for the PS2 to be circumvention devices,
  with a minimum statutory award of $2,002,400 for about 10,012 devices, enhanced to $3,750,200 in total
  ([Sony v Divineo][divineo]; [R0-02, "Console checks"][r002-checks]).
  Sony's own Japanese manuals label the disc check: 「本機にはアクセスコントロールが施されています。」,
  and go on to say that the law forbids distributing a device or program that disables it
  ([SCPH-90000 manual][man90000]; [SCPH-15000 manual][man15000]; the note's own translation),
  which matches Japan's ban on such tools ([R0-02, "Japan"][r002-jp]) (inference).
- Games reach an emulator as plain images ([R1-03][r103-disc]), so [R0-02 option 1][r002-o1] fits retail play.
  The keyed parts are MagicGate memory cards and DVD player software, KELF files, and perhaps some arcade security
  (inference; Play! and PCEE2 run System 246 games with no key files, by their prose):
  Sony's manual calls MagicGate its "著作権保護技術" (copyright protection technology)
  ([SCPH-90000 manual][man90000]),
  and the CDVD block is "Also responsible for MagicGate decryption" ([ps2tek][ps2tek], overview).
  PCSX2's memory cards are plain files and its page never mentions MagicGate
  ([PCSX2, "Memory cards"][pcsx2-mc]), so a file-level card avoids keys (inference).
- The boot logo comes from the disc: the BIOS runs a logo program stored on pressed discs
  ([Copetti, "PlayStation 2 Architecture"][copetti]) (lead).
  Its sources likely include drive firmware analysis, so no detail is recorded.
  An emulator with a fast boot draws none, and one that boots the BIOS draws what the disc supplies
  ([R0-02 option 16][r002-o16]; inference).
- The BIOS is Sony's copyright ([R0-02, "Firmware and back-up copies"][r002-fw]).
  Projects split as [R0-02's options 4 and 5][r002-o4] describe: a user's dump
  (PCSX2 and its forks, DobieStation, Iris, orbum, PS2e, AetherSX2, DamonPS2),
  a high-level BIOS (Play!), and a shipped replacement (PS5SX2's OpenPS2BIOS).
  A Sony manual forbids analysing "製品本体内部のチップ等に含まれるプログラム等著作物"
  (copyrighted works such as programs in the product's chips)
  without permission ([SCPH-15000 manual][man15000]); it is a handling notice, not a signed licence (inference).
- Dumping guides touch [R0-02 option 7][r002-o7]: PCSX2's BIOS page recommends softmods and a dumping tool
  ([R0-02, "How projects handle firmware"][r002-how]),
  and ARMSX2's README links its own guide, which is closed here (`armsx2.net/docs/dumping-bios`, not linked).
  PS5SX2 needs a jailbreak payload on the PS5, conduct that R0-02's anti-circumvention findings concern
  ([R0-02, "Console checks"][r002-checks]; inference).
- Enforcement is between emulator projects. "the PCSX2 Team submitted a DMCA takedown
  for the 'DamonPS2' app on the Google Play Store.
  The developer took down the emulator before the DMCA had a chance to go through"
  ([PCSX2, DamonPS2 statement][pcsx2-damon]).
  The app is back on Google Play with "10M+" downloads ([Google Play, DamonPS2][damon-gp]).
  AetherSX2 ended by its developer's decision and left the store for a reason not found;
  no source for its PCSX2-derived binary was found, so its compliance with PCSX2's licence is an unresolved risk,
  and no takedown of NetherSX2's redistribution was found (sections above).
  Web searches on 2026-11-25 found no action by Sony against a PS2 emulator,
  and R0-02's search of GitHub's notices found none from Sony against a PlayStation emulator or naming a BIOS file
  ([R0-02, "Who has been reached"][r002-who]).
- Sony uses PS2 emulation in its own products (section above) and has made no statement on emulators as such
  ([R0-02, "Makers' statements"][r002-stmt]).
  Its 2001 network service adds console and disc identifiers:
  "DNAS authenticates user IDs and manages copy protection for digital content on the network"
  ([Sony, DNAS release][dnas]), which bears on online play ([R2-09][phase2]).
- PS2 hardware patents filed from 1999 to 2001 would have expired by about 2021 on a 20-year term (calculated).
  Sony's later filings on emulating the PS2 on the PS3's Cell were found by web search only, as titles and numbers:
  register mapping, US7813909B2 (filed 2007, priority 2006) and its continuation US8392171B2
  (search, 2026-11-25; lead),
  and clock management, fragment translation, speculative translation, and emulation enhancement
  (US7770050B2, US8234514B2, US8060356B2, US8433555B2, US8621443B2, EP2040163A1; a verifier's search, research log;
  lead).
  A 2007 filing runs to about 2027 on a 20-year term before any adjustment (calculated),
  so [R0-02 options 11 to 13][r002-o13] stay open for these until their status is read.
  Google Patents refused scripts, so no claim or status was read.
- Of R0-02's options, 1, 4, 5, 7, 8 (paid clones and DamonPS2), 9
  (store conduct),
  11 to 13, 14, and 16 apply, and 2 and 3 only to MagicGate, KELF, DVD video, and arcade security (inference).
  For option 14, PCSX2 disclaims any link to Sony
  ([PCSX2, "Trademark and Copyright"][pcsx2-ip]; [R0-02 option 14][r002-o14]),
  and store clones borrow emulators' names more than Sony's ("Closed apps on Android", above; inference).

### How hard the family is to emulate

- The family needs recompilers.
  PCSX2's minimum is an x86-64 CPU with a PassMark single-thread rating of 1500 and two cores,
  and its heavy tier asks for AVX2 and six cores,
  with the warning "CPUs that only meet Moderate requirements will struggle with complex games
  that pushed the PS2 hardware to its limits" ([PCSX2, "Requirements"][pcsx2-req]).
  Play!
  crashes on iOS without JIT ([Play! README][play]).
  So an interpreter-only core does not reach full speed on current phones (inference; [R1-03 option 9][r103-o9]).
- Timing is coarse-grained but shared.
  PCSX2's account of threading VU1 says typical emulation runs the EE and times the other units from its cycles,
  that a threaded VU1 breaks GS signalling so that "The game in this case will likely hang",
  and that "on the PS2 games can't be as cycle-critical as they are with older systems"
  ([PCSX2 wiki, "Threading VU1"][wiki-mtvu], 2015, in a 2025 capture).
  The SPU2 is also a clock: "Without at least basic SPU2 emulation, no games will boot at all."
  ([PCSX2 wiki, SPU2 page][wiki-spu2]).
- Game-specific behaviour is documented in [ps2tek][ps2tek]:
  Harry Potter and the Prisoner of Azkaban needs edge-triggered timer interrupts,
  WRC 4 needs instruction-cache emulation, and main memory takes "around 40 EE cycles", nondeterministically
  ("EE Timers", "EE COP0 Caches").
  Memory cards larger than 8 MB break some games; PCSX2 agrees that "8MB is the most compatible option"
  ([PCSX2, "Memory cards"][pcsx2-mc]).
  Of SIO2, ps2tek says its behaviour "has to be inferred from how programs use it" ("SIO2 Registers").
- Floating point differs from every host: "Multiplying two numbers on the FPU, VU,
  and an x86 processor can give you 3 different results all differing by a couple of bits!"
  ([PCSX2 wiki, "Floating-Point"][wiki-fp], 2015).
  R1-03 records the per-game rounding and clamping this forces
  ([R1-03 option 8][r103-o8]);
  LRPS2's software model is the only one found with published cross-checks, and its oracle is PCSX2's research,
  not a console; a PCSX2 pull request ([R1-03 option 8][r103-o8]) and ARMSX2 (README) also claim exact arithmetic.
- The vector units' clock is disputed. ps2tek gives them the EE's 294.912 MHz
  ("VU Architecture"),
  while PCSX2's wiki says "VU1 runs at half the clock speed of the EE" ([PCSX2 wiki, "Threading VU1"][wiki-mtvu]).
  The Toshiba and Sony slides show the VU pipeline in step with the core's in coprocessor mode
  and give 150 million vectors a second for geometry transformation at 300 MHz
  ([Hot Chips 11 slides][hc11]);
  if a transform takes four cycles of a 4-wide unit and the figure counts both units,
  that rate needs both at the core's clock (calculated; the assumptions are not in the slides).
- The Graphics Synthesizer is the costliest part.
  PCSX2 writes "The PS2's GS is known
  for being difficult to emulate due to how different it is from the PC hardware we use today",
  and that accurate blending needs large numbers of slow barriers ([PCSX2 2.8.0][pcsx2-28]).
  "GPU performance is based largely on upscaling level and blending accuracy"
  ([PCSX2, "Requirements"][pcsx2-req]).
  psdevwiki gives the GS clock as 147.456 MHz, half the EE's, which answers R1-07's question on a wiki's word
  ([psdevwiki, "Graphics Synthesizer"][pdw-gs], revision 5540; [R1-07][r107-home]).
- PCSX2's own talk at FOSDEM 2021 framed the puzzle: "After all, the CPU is a simple RISC, with a simplified FPU.
  The GPU, the fabled 'Graphics Synthesizer', only draws scenes - no shaders." ([FOSDEM 2021, PCSX2 talk][fosdem]).
  The difficulty is the number of concurrent units and their arbitration, as R1-03 found ([R1-03][r103-mem]; inference).
- Models differ: the Emotion Engine has six chip revisions, the last merging the RAM, IOP,
  and SPU2 in the 790xx and 900xx slims
  ([psdevwiki, "Emotion Engine"][pdw-ee]);
  early boards derive 393.216 MHz for the EE and RAM from an 18.432 MHz crystal,
  and those with the first GS feed it 294.912 MHz from a second generator
  ([psdevwiki, "Clocks"][pdw-clk]); and LRPS2 advises against the SCPH-10000 BIOS ([libretro, "LRPS2"][lr-lrps2]).

### Tests and published results

| Suite | Tier | Oracle | Covers | Emulator results |
|---|---|---|---|---|
| [ps2autotests][ps2at] | open | console, by its README | EE, FPU, SIMD, VU, DMA, VIF, GS, IOP, kernels | none found |
| [PCSX2 GS dump runner][pcsx2-gsdr] | open | an earlier PCSX2 build | GS dumps | none published |
| [PCSX2 compatibility list][pcsx2-compat] | open | users' play | games | PCSX2 only |
| ARMSX2 and LRPS2 checks | open | console (claimed); own interpreter | recompilers, floats | not published |

- ps2autotests is "A set of test programs run on a PS2, with accompanying results",
  and "A test that has run accurately will produce the same data as contained in the `.expected` file."
  ([ps2autotests README][ps2at]).
  At commit `97469ffb` it holds 78 result files, 16 of them for the I/O processor's kernel and 10 for the EE's
  (observed, tree listing, as [R1-03][r103-ee] read the same tree; the suite is a test suite, not an emulator),
  which can serve as an oracle for any high-level BIOS (inference).
  It is built with ps2sdk, which is walled, and was last pushed in 2019 (metadata).
- No emulator's results on ps2autotests were found
  (web search for the suite with PCSX2, Play!, and DobieStation, and the prose read).
- The GS dump runner compares "a large number of GS dumps
  and output any differences found with pictures" between a baseline and a modified build
  ([PCSX2, "GS dump runner"][pcsx2-gsdr]), so it detects regressions only (inference).
- No public GS hardware tests exist, by paraLLEl-GS's author:
  "Extremely detailed hardware tests would need to be written to reverse the exact behavior.
  To my knowledge, such tests don't exist, at least not publicly." ([paraLLEl-GS README][pgs]).
- PCSX2's list showed "Perfect - 1.23%" and "Playable - 98.36%" when rendered on 2026-11-25
  ([PCSX2 compatibility][pcsx2-compat]).
  Emulation General's counts, not relied on,
  give Sony's PS3 emulator 2,250 of 2,682 games and its PS4 emulator 748 of 1,299 ([Emulation General][egw-ps2]; lead).

## Options and trade-offs

The options answer five separate questions, and the recommendation takes one answer to each.

### Which emulators the PlayStation 2 studies cover

- **What:** keep the roadmap's studies of [PCSX2][pcsx2] ([R1-42][studies]) and [Play!][play] ([R1-43][studies]);
  add a third of [DobieStation][dobie] or [Iris][iris]; or fold the ARM64 lineages, [ARMSX2][armsx2] and [LRPS2][lrps2],
  into the PCSX2 study.
- **Costs:** Play!'s distinctive part, its high-level BIOS, is closed, so R1-43 can study only its other parts;
  DobieStation has not moved since 2021 and Iris is young; ARMSX2 and LRPS2 change weekly.
- **Gains:** PCSX2 is open, dominant, and the base of most widely used emulators; Play!
  is the one independent code base with a JIT on every host, iOS and the web included.
  ARMSX2 and LRPS2 show recompilers for ARM64, which Rustalgia's phone targets need.
- **Used by:** the [roadmap][studies].

### Which oracles the PlayStation 2 core is tested against

- **What:** [ps2autotests][ps2at]'s console results; new console measurements; PCSX2's output as a reference;
  or compatibility lists.
- **Costs:** ps2autotests is small, old, and silent on VU1 arithmetic and GS output; the project owns no PS2
  ([R1-03, "Open questions"][r103-open]);
  PCSX2 and its forks reproduce an emulator, with per-game settings; compatibility lists measure play, not behaviour.
- **Gains:** ps2autotests is open, runnable, and console-generated, including kernel behaviour; PCSX2 is open,
  so its results can be compared freely as a regression aid.
- **Used by:** PCSX2 (its list and dump runner); LRPS2 (its own interpreter and PCSX2's float research).

### How firmware is handled

- **What:** require a user's BIOS; write Rustalgia's own high-level services, as Play!
  did; or load a replacement.
- **Costs:** a user's dump has no settled lawful route
  ([R0-02 option 4][r002-o4]);
  own services are a large job with no clean description of the kernel beyond [ps2tek][ps2tek]
  and ps2autotests' results; every replacement found is closed.
- **Gains:** a dump gives the console's behaviour, including the disc's boot logo;
  own services need nothing from Sony and boot faster.
- **Used by:** PCSX2 and its forks (dump); Play!
  (high-level); [PS5SX2][ps5sx2] (replacement).

### How the Graphics Synthesizer is rendered

- **What:** a hardware renderer with per-game fixes, as PCSX2; a compute-shader renderer, as [paraLLEl-GS][pgs];
  or a software renderer.
- **Costs:** per-game fixes are data tuned by hand and blending accuracy costs barriers
  ([PCSX2 2.8.0][pcsx2-28]);
  compute rendering needs Vulkan-class compute and is not bit-exact by its author's account;
  software is slow at upscaled resolutions.
- **Gains:** hardware renderers run on weak GPUs; compute rendering uses no per-game fixes
  ([LRPS2 blog][lr-blog]);
  software is the most accurate renderer available, though not bit-exact by paraLLEl-GS's author
  ([paraLLEl-GS README][pgs]).
- **Used by:** PCSX2 and its forks; LRPS2, PCEE2, and Iris; PCSX2's and PS2e's software renderers.

### Keyed features: MagicGate, DVD video, KELF, and arcade security

- **What:** leave them out; accept keys the user supplies; or emulate them with keys held by the project.
- **Costs:** leaving them out drops DVD playback, a few memory-card behaviours,
  and perhaps some arcade security features (inference); user keys bring [R0-02 options 2 and 3][r002-o2];
  project-held keys are barred.
- **Gains:** leaving them out keeps every key and key page away from the project; retail games do not need them.
- **Used by:** PCSX2 (plain file cards); the Reliquary fork (user key files, a lead).

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** keep R1-42 and R1-43, scope R1-42 to include the ARM64 recompilers of ARMSX2 and LRPS2,
  and scope R1-43 to everything but the closed BIOS. paraLLEl-GS is a standalone renderer, not PCSX2 code
  ([paraLLEl-GS README][pgs]), so it belongs to the GS work in [R2-05][phase2] rather than to R1-42.
  DobieStation and Iris stay as open references to read when a question needs them, with no study of their own.
- **Oracles:** test against [ps2autotests][ps2at] first, plan console measurements for VU1 arithmetic, timing,
  and the GS, as [R5-12][phase5] does for the PS1, and use PCSX2 only as a regression comparison.
  It is the only open suite whose results come from a console.
- **Firmware:** support the user's own BIOS as the accurate path; consider Rustalgia's own high-level kernel later,
  checked against ps2autotests' kernel results; never ship or load another project's replacement.
- **Graphics:** plan two paths, a software or compute renderer aimed at exactness as the reference,
  checked against the console measurements the Oracles point plans, and a faster hardware path for weak devices,
  because the hosts span phones and desktops.
- **Keyed features:** leave them out; emulate memory cards as files and run retail games from plain images.

## Implications for Rustalgia

- [R2-01][phase2] must plan recompilers for the EE, the VUs, and the IOP from the start,
  and [R3-01][phase3] must settle whether any iOS build without JIT can run PS2 games; every route found needs JIT
  ([Play! README][play]).
- [R2-12][phase2] should treat the PS2 BIOS as a set of user files, of more than one image,
  and log the model and version, because emulators restrict which versions work
  ([PCSX2's PS1 mode][pcsx2-psx]; [LRPS2's SCPH-10000 advice][lr-lrps2]).
- [R2-05][phase2] and [R2-15][phase2] should take the GS as their hardest case: no public hardware tests exist,
  so a measurement spike is needed before any accuracy target for it can be set in [R6-02][phase6].
- [R2-09][phase2] should note DNAS before planning online play for PS2 games ([Sony, DNAS release][dnas]).
- [R6-01][phase6] can weigh the PSX video recorder and PS2-based arcade boards apart from the core console:
  only [Iris][iris] models the first, and the boards belong to [R1-25][surveys].

## Open questions

- Does VU1 round as VU0 does, and what sets the last bit after a round towards zero?
  For rounding, [ps2autotests][ps2at] covers only a VU0 routine of `MULi` and `ADDi` ([R1-03][r103-ee]);
  tests run on a PS2 would answer it.
- Do the vector units run at the EE's clock or half of it?
  A timing test on a PS2 that counts VU cycles against an EE timer would answer it.
- What does the GS do, bit for bit, in interpolation, blending, and anti-aliasing?
  No public tests exist ([paraLLEl-GS README][pgs]); a measurement suite run on a console would answer it.
- Are Sony's PS2-on-PS3 emulation patents found by search still in force, and when do they expire?
  Reading each number's status and term, never its claims,
  in the USPTO's Patent Center and the EPO Register would answer it; neither was reachable by script in this pass.
- Do the ARM64 builds of LRPS2 and PCEE2 on libretro's build server run on Android and iOS?
  Running them on devices in [R3-04][phase3] and [R3-01][phase3] would answer it.

## Sources

Every source below was read on 2026-11-25, as raw text, unless an entry says otherwise.
READMEs and metadata were read through GitHub's API; Wikipedia links are pinned to the revision read;
closed addresses are in code spans, with the reason.

- Repository documents: [ADR 0006][adr6]; [research guide][guide]; [research roadmap][roadmap];
  [source register][register]; [R0-02][r002]; [R1-02][r102]; [R1-03][r103-ee]; [R1-07][r107-home]; [R1-18][r118].
- PCSX2: [README][pcsx2], metadata, and releases v2.9.188 to v2.9.192; [Trademark and Copyright][pcsx2-ip];
  [Requirements][pcsx2-req]; [General settings][pcsx2-gen]; [Backwards Compatibility][pcsx2-psx],
  read without following its references; [Debugger][pcsx2-dbg]; [GS dump runner][pcsx2-gsdr]; [Memory cards][pcsx2-mc];
  [Performance][pcsx2-perf]; [compatibility list][pcsx2-compat], rendered in a browser.
- PCSX2 blog: [2.0][pcsx2-20] (2024-07-12); [2.8.0][pcsx2-28] (2026-08-28); [AetherSX2][pcsx2-aether] (2021-11-24);
  [DamonPS2][pcsx2-damon] (2018-01-11); [history][pcsx2-hist], capture of 2017-01-22 03:20:12.
- PCSX2 wiki, in captures because the live host refuses scripts: [floating point][wiki-fp]
  (revision 38350); [Threading VU1][wiki-mtvu] (revision 38302); [SPU2][wiki-spu2] (revision 38354).
- FOSDEM 2021: [PCSX2 talk][fosdem], schedule page.
- PCSX2 lineages: [LRPS2 README][lrps2], README blob `43ce73ea`, at the last push of 2026-11-25;
  libretro pages [LRPS2][lr-lrps2] (2026-10-22), [PCEE2][lr-pcee2], [Play!][lr-play], and [RetroArch on iOS][lr-ios];
  [libretro blog][lr-blog] (2025-01-05); [RetroArch, PS2][ra-ps2]; [nightly builds][buildbot];
  READMEs of [paraLLEl-GS][pgs], [PCEE2][pcee2] (blob `56bd7522`), [ARMSX2][armsx2]
  (blob `567b76fa`),
  [XBSX2][xbsx2], [PS5SX2][ps5sx2], and [EmuCoreX][emucorex];
  ARMSX2's [requirements][armsx2-req] and [iOS][armsx2-ios] pages; [TabStationToo][tabst], metadata.
  READMEs without a blob were read at the last push their metadata gives.
- Closed, not linked: `pontos2024/PCSX2_ARM64`, `TamaribaEmu/OpenPS2BIOS`, `lineage-shell/lineage-ps2-for-ps5`,
  `OpenEmu/PCSX2-Core`, `Trixarian/NetherSX2-patch`, `Trixarian/NetherSX2-classic`, `AetherSX2-backup/AetherSX2-builds`,
  `damonplay/DamonPS2`, and `ollef/pups2`, by metadata, credits, or README;
  the dumping guides `pcsx2.net/docs/setup/gather`, `armsx2.net/docs/dumping-bios`, and `armsx2.net/docs/dumping-discs`,
  and the PCEE2 README's game collection, not opened.
  `DiscoStarslayer/pcsx2-reliquary` is named only, unregistered, with a key hazard.
- Other emulators: [Play! README][play]; [purei.org][purei] and its [About page][purei-about]; [DobieStation][dobie];
  [Iris][iris]; [hpsx64 metadata][hpsx64]; [orbum][orbum]; [RustEE][rustee]; [PS2e][ps2e]; [ps2rs][ps2rs];
  [Cosmic Station][cosmic]; [MoeStation][moe].
- AetherSX2, in captures: [listing, 2022-11-01 18:32:16][aether-gp22]; [listing, 2024-03-06 05:56:41][aether-gp24];
  [site, 2023-01-04 10:56:03][aether-site]; [FAQ, 2023-01-04 19:14:10][aether-faq].
  Its APK folder, `www.aethersx2.com/archive/`, holds a closed app's binaries and was not opened.
- Stores: Google Play, [ARMSX2][armsx2-gp], [Play!][play-gp], [DamonPS2][damon-gp], [PSX2][psx2-gp],
  and [EmuCoreX][emucorex-gp]; Flathub, [PCSX2][fh-pcsx2] and [Play!][fh-play]; [RetroArch on Steam][ra-steam];
  App Store, ["AetherSX2"][as-aether] and ["iPSX2"][as-ipsx2]; [Provenance README][prov]; [OpenEmu][openemu].
- Searches: web searches of 2026-11-25 for AetherSX2's source, Sony actions, emulator results on ps2autotests,
  and Sony's emulation patents; Google Patents queries, refused for scripts; Google Play and Steam store searches.
- Apple: [App Review Guidelines][apple]
  (last updated 2026-10-16), 2.5.2 and 4.7; [alternative browser engines][apple-browser].
- Sony: PlayStation Blog, [4 December 2015][psb-2015] and [16 May 2022][psb-2022]; [DNAS release][dnas] (2001);
  Japanese PS2 manuals, [SCPH-15000][man15000]
  (PDF modified 2003-01-31) and [SCPH-90000][man90000] (2007-11-21), text confirmed with pdftotext.
- Courts: [Sony Computer Entertainment v Ball][ball] [2004] EWHC 1738 (Ch);
  [Sony Computer Entertainment America v Divineo][divineo], 457 F. Supp.
  2d 957 (2006).
- References and tests: [ps2tek][ps2tek]; [ps2autotests][ps2at], commit `97469ffbed8631277b94e28d01dabd702aa97ef3`;
  psdevwiki PS2 in captures, [Emotion Engine][pdw-ee] (oldid 5539), [Clocks][pdw-clk]
  (oldid 4412),
  and [Graphics Synthesizer][pdw-gs] (revision 5540); [Hot Chips 11 slides][hc11]; [Copetti][copetti] (lead).
- Press, wikis, and Wikipedia: [Time Extension, October 2025][timeext] (secondary);
  [Emulation General, "PlayStation 2 emulators"][egw-ps2], revision 152563, whose raw text names no leak (lead);
  Wikipedia (tertiary), ["PCSX2"][w-pcsx2], ["PlayStation 3 models"][w-ps3m],
  and ["List of downloadable PlayStation 2 games"][w-ps2dl].

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-kinds]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#sources-that-are-not-emulators
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-uk]: R0-02-legal-baseline.md#the-united-kingdom
[r002-jp]: R0-02-legal-baseline.md#japan
[r002-checks]: R0-02-legal-baseline.md#console-checks-and-use-after-circumvention
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r002-stmt]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-how]: R0-02-legal-baseline.md#how-projects-handle-firmware-and-games
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o2]: R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o13]: R0-02-legal-baseline.md#13-leave-patented-features-out-until-expiry
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r102]: R1-02-primer-32-and-64-bit.md
[r103-ee]: R1-03-primer-sixth-generation.md#playstation-2-emotion-engine-vector-units-io-processor
[r103-mem]: R1-03-primer-sixth-generation.md#playstation-2
[r103-disc]: R1-03-primer-sixth-generation.md#discs-and-what-arrives-as-a-plain-image
[r103-o8]: R1-03-primer-sixth-generation.md#8-floating-point-host-defaults-per-game-settings-or-bit-exact-software
[r103-o9]: R1-03-primer-sixth-generation.md#9-interpreter-block-recompiler-or-recompiler-through-an-intermediate-form
[r103-open]: R1-03-primer-sixth-generation.md#open-questions
[r107-home]: R1-07-catalogue-sixth-generation.md#home-consoles
[r118]: R1-18-playstation-1-family.md
[pcsx2]: https://github.com/PCSX2/pcsx2
[pcsx2-ip]: https://pcsx2.net/intellectualproperty
[pcsx2-req]: https://pcsx2.net/docs/setup/requirements
[pcsx2-gen]: https://pcsx2.net/docs/configuration/general
[pcsx2-psx]: https://pcsx2.net/docs/advanced/psx
[pcsx2-dbg]: https://pcsx2.net/docs/advanced/debugger
[pcsx2-gsdr]: https://pcsx2.net/docs/advanced/gsdumprunner
[pcsx2-mc]: https://pcsx2.net/docs/configuration/memcards
[pcsx2-perf]: https://pcsx2.net/docs/troubleshooting/performance
[pcsx2-compat]: https://pcsx2.net/compat/
[pcsx2-20]: https://pcsx2.net/blog/2024/pcsx2-2-release
[pcsx2-28]: https://pcsx2.net/blog/2026/pcsx2-2.8
[pcsx2-aether]: https://pcsx2.net/blog/2021/aethersx2-brings-pcsx2-to-mobile
[pcsx2-damon]: https://pcsx2.net/blog/2018/the-pcsx2-teams-statement-regarding-the-damonps2-emulator
[pcsx2-hist]: https://web.archive.org/web/20170122032012/http://pcsx2.net/developer-blog/90-the-history-of-pcsx2.html
[wiki-fp]: https://web.archive.org/web/20251116184110/https://wiki.pcsx2.net/PCSX2_Documentation/Nightmare_on_Floating-Point_Street
[wiki-mtvu]: https://web.archive.org/web/20250813221414/https://wiki.pcsx2.net/PCSX2_Documentation/Threading_VU1
[wiki-spu2]: https://web.archive.org/web/20250813041857/https://wiki.pcsx2.net/PCSX2_Documentation/SPU2_is_more_than_just_sound!
[fosdem]: https://archive.fosdem.org/2021/schedule/event/pcsx2/
[fh-pcsx2]: https://flathub.org/apps/net.pcsx2.PCSX2
[lrps2]: https://github.com/libretro/parallel-ps2
[lr-lrps2]: https://docs.libretro.com/library/lrps2/
[lr-blog]: https://www.libretro.com/index.php/lrps2-the-new-playstation2-core-with-a-brand-new-lle-renderer/
[ra-ps2]: https://www.retroarch.com/ps2.html
[buildbot]: https://buildbot.libretro.com/nightly/
[pgs]: https://github.com/Arntzen-Software/parallel-gs
[pcee2]: https://github.com/WizzardSK/pcee2-libretro
[lr-pcee2]: https://docs.libretro.com/library/pcee2/
[armsx2]: https://github.com/ARMSX2/ARMSX2
[armsx2-req]: https://armsx2.net/docs/system-requirements
[armsx2-ios]: https://armsx2.net/docs/ios-installation
[armsx2-gp]: https://play.google.com/store/apps/details?id=come.nanodata.armsx2
[xbsx2]: https://github.com/XboxEmulationHub/XBSX2
[ps5sx2]: https://github.com/swordpdf/PS5SX2
[tabst]: https://github.com/TabStationToo/TabStationToo
[emucorex-gp]: https://play.google.com/store/apps/details?id=com.sbro.emucorex
[play]: https://github.com/jpd002/Play-
[purei]: https://purei.org/
[purei-about]: https://purei.org/about.php
[emucorex]: https://github.com/sashkinbro/EmuCoreX
[openemu]: https://openemu.org/
[play-gp]: https://play.google.com/store/apps/details?id=com.virtualapplications.play
[fh-play]: https://flathub.org/apps/org.purei.Play
[lr-play]: https://docs.libretro.com/library/play/
[dobie]: https://github.com/PSI-Rockin/DobieStation
[iris]: https://github.com/allkern/iris
[hpsx64]: https://sourceforge.net/rest/p/hpsx64/
[orbum]: https://github.com/marcosatti/orbum
[rustee]: https://github.com/cakehonolulu/RustEE
[ps2e]: https://github.com/yuias/PS2e
[ps2rs]: https://github.com/ihor-tarasov/ps2rs
[cosmic]: https://github.com/shadergz/cosmic-station
[moe]: https://github.com/ladystarbreeze/moestation
[aether-gp22]: https://web.archive.org/web/20221101183216/https://play.google.com/store/apps/details?id=xyz.aethersx2.android
[aether-gp24]: https://web.archive.org/web/20240306055641/https://play.google.com/store/apps/details?id=xyz.aethersx2.android
[aether-site]: https://web.archive.org/web/20230104105603/https://www.aethersx2.com/
[aether-faq]: https://web.archive.org/web/20230104191410/https://www.aethersx2.com/faq.html
[damon-gp]: https://play.google.com/store/apps/details?id=com.damonplay.damonps2.free
[psx2-gp]: https://play.google.com/store/apps/details?id=com.izzy2lost.psx2
[timeext]: https://www.timeextension.com/news/2025/10/wed-like-to-warn-you-to-not-fall-for-the-trap-new-android-ps2-emulator-accused-of-being-vibe-coded-rip-off
[ra-steam]: https://store.steampowered.com/app/1118310/RetroArch/
[apple]: https://developer.apple.com/app-store/review/guidelines/
[apple-browser]: https://developer.apple.com/support/alternative-browser-engines/
[lr-ios]: https://docs.libretro.com/guides/install-ios/
[prov]: https://github.com/Provenance-Emu/Provenance
[as-aether]: https://apps.apple.com/app/id6811866034
[as-ipsx2]: https://apps.apple.com/app/id6805684708
[psb-2015]: https://blog.playstation.com/2015/12/04/fan-favorite-ps2-games-launching-on-ps4-tomorrow/
[psb-2022]: https://blog.playstation.com/2022/05/16/all-new-playstation-plus-game-lineup-assassins-creed-valhalla-demons-souls-ghost-of-tsushima-directors-cut-nba-2k22-and-more-join-the-service/
[dnas]: https://sonyinteractive.com/en/press-releases/2001/dynamic-network-authentication-system-for-playstation2-to-begin-commercial-service/
[man15000]: https://www.jp.playstation.com/content/dam/global_pdc/en/corporate/support/manuals/ps2-docs/JA_SCPH-15000_WEB.pdf
[man90000]: https://www.jp.playstation.com/content/dam/global_pdc/en/corporate/support/manuals/ps2-docs/JA_SCPH-90000CB_1_WEB.pdf
[ball]: https://caselaw.nationalarchives.gov.uk/ewhc/ch/2004/1738
[divineo]: https://static.case.law/f-supp-2d/457/cases/0957-01.json
[ps2tek]: https://psi-rockin.github.io/ps2tek/
[ps2at]: https://github.com/unknownbrackets/ps2autotests
[pdw-ee]: https://web.archive.org/web/20260713141850/https://www.psdevwiki.com/ps2/Emotion_Engine
[pdw-clk]: https://web.archive.org/web/20251117215551/https://www.psdevwiki.com/ps2/Clocks
[pdw-gs]: https://web.archive.org/web/20260630012020/https://www.psdevwiki.com/ps2/Graphics_Synthesizer
[hc11]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.s3.1.Kunimatsu.pdf
[copetti]: https://www.copetti.org/writings/consoles/playstation-2/
[egw-ps2]: https://emulation.gametechwiki.com/index.php/PlayStation_2_emulators
[w-pcsx2]: https://en.wikipedia.org/w/index.php?oldid=1378415699
[w-ps3m]: https://en.wikipedia.org/w/index.php?oldid=1387117343
[w-ps2dl]: https://en.wikipedia.org/w/index.php?oldid=1387344787
