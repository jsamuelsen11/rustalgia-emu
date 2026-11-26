---
title: "PlayStation 1: family survey"
roadmap_item: R1-18
status: draft
date: 2026-11-22
---

# PlayStation 1: family survey

## Summary

This note asks which emulators matter for the PlayStation 1 family, what each one does,
what legal exposure the family carries, and how hard the family is to emulate.

Nineteen emulators, of about thirty found, are compared in one table.
DuckStation is the most used, and [Mednafen's module][mdf-psx] is the base of [Beetle PSX][lr-bpsx] and OpenEmu;
most open-source emulators are walled, and only [ares][ares-site], [SwanStation][swan],
and a few small projects are open.

The legal picture is milder than for later consoles: games are not encrypted,
the Sony hardware patents found have expired or were withdrawn, and Sony shipped [PCSX ReARMed][rearmed],
a GPL emulator, in its own PlayStation Classic.
The live risks are the BIOS, which Rustalgia may not obtain, and the subchannel data that some PAL discs check.

For Rustalgia, the family is easy to run and hard to run exactly,
because no clean document describes the disc controller, the video decoder, or most timing ([R0-05][r005-ps]).
The note recommends adding a Mednafen study to the [roadmap's two PlayStation 1 studies][studies],
testing against [ps1-tests][ps1tests] and console measurements,
and building firmware support around the user's own dump.

## Scope

- Question: which emulators are popular or respected for the PlayStation 1 family, and for each, what are its status,
  licence, tier, techniques, and hosts; what legal exposure does the family carry; and how hard is it to emulate?
- Covered: the PlayStation (SCPH models), the PS one, the Net Yaroze, and the PocketStation where emulators model it,
  as [R1-06][r106-home] lists them ([add-ons][r106-addons]).
  The PlayStation 1 hardware inside the PlayStation 2 belongs to [R1-19][surveys].
  How the hardware works is in [R1-02][r102]; the law in [R0-02][r002]; the hubs in [R0-05][r005-ps].
  This note cites those sections and does not repeat them.
- Researched on 2026-11-22 by three research agents, who read every source as raw text and quoted only from it;
  one pass of fresh verifiers, who saw only this note, checked each claim against its source,
  and a fix pass re-fetched and applied their findings (research log).
- Every emulator was read from prose and repository metadata only, whatever its tier.
  No emulator source file, issue, pull request, BIOS reimplementation, firmware, game, or key was opened,
  and the tainted reference was opened in no form, even where a README links it.
- Markers follow the [research guide][guide].
  Wikipedia is tertiary and named wherever a fact rests on it.
  The [Emulation General wiki][egw-ps1], which the [register][register] calls a lead, is marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, installs, frontends), respect
  (tested accuracy claims, or use as a reference), or history (it shaped the family, or the maker made it).
- Status is the repository's archived flag and last push from `gh api repos/OWNER/REPO`, read on 2026-11-22,
  and the latest release where the project's own prose or site names one.
- The guard blocked the releases endpoint for some walled and closed repositories during research,
  though not for Avocado at verification (research log), so release data comes from the projects' prose and sites.
- Each tier was checked against the [register][register], as ADR 0006 requires when a survey covers a source
  ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  No existing line's licence or tier changed.
  Two lines have new evidence: Debian's copyright file gives Mednafen as GPL-2.0-or-later
  (see Mednafen below),
  and PSoXide's README calls PCSX-Redux GPL-2.0-or-later, a third party's claim; both stay walled until re-evaluated.
- ADR 0006's rule for an emulator that "mainly uses" the tainted document is applied to one that names it as its only
  or main documentation, as starpsx, Trapezoid, ProjectPSX, and Pokket do, and to PSoXide,
  which rewrote several parts from it ([ADR 0006, "Sources that are not emulators"][adr6-kinds]).
- Every replacement BIOS or high-level BIOS found is closed wherever it is hosted
  ([ADR 0006, "Closed tier"][adr6-closed]):
  [OpenBIOS][openbios], the PCSX family's HLE BIOS, [ePSXe's][epsxe] and [FPse's][fpse],
  [XEBRA's][xebra-en] built-in OS ROM, and PSoXide's HLE kernel.
  A project that holds one keeps its own tier for its other files.

### The emulators compared

Key: push is the last push to the repository; "dump" means the user supplies a BIOS image;
"HLE" means the emulator provides BIOS services itself; "repl." means it ships or loads a replacement BIOS; Win, Mac,
Lin, and And name hosts; "lr" is a libretro core.

| Emulator | Tier | Licence | Status | CPU | BIOS | Hosts |
|---|---|---|---|---|---|---|
| DuckStation | closed | CC BY-NC-ND 4.0 | push 2026-11-22 | recompiler | dump | Win, Mac, Lin, And |
| SwanStation | open | GPL-3.0 | push 2026-10-24 | recompiler | dump or repl. | lr |
| Mednafen PSX | walled | GPL-2.0 | 1.32.1, 2024-04-05 | not stated | dump, per region | Win, Mac, Lin (lead) |
| Beetle PSX, PSX HW | walled | GPL-2.0 | push 2026-11-20 | interpreter, lightrec | dump or repl. | lr |
| PCSX ReARMed | walled | GPL-2.0 | push 2026-11-22 | ARM recompiler, lightrec | dump or HLE | lr, ARM handhelds |
| PCSX-Redux | walled | GPL-2.0 | push 2026-11-22 | recompiler, interpreter | dump or repl. | Win, Mac, Lin, web |
| ePSXe | closed | proprietary | 2.0.18, 2025-12-23 | not stated | dump or HLE | Win, Mac, Lin, And |
| FPse | closed | proprietary | Play, 2025-06-23 | not stated | dump or HLE | And |
| XEBRA | closed | proprietary | build 2022-11-06 | not stated | dump or repl. | PC, And |
| ares | open | ISC | v148, 2026-05-30 | no recompiler since v145 | not stated | Win, Mac, Lin |
| Avocado | walled | GPL-2.0 | push 2023-09-19 | not stated | dump | Win, Mac, Lin, And |
| Rustation | walled | GPL-2.0-or-later | ended; push 2026-06-16 | not stated | dump | not stated |
| MiSTer PSX | walled | GPL-2.0 | push 2026-11-14 | FPGA | dump | MiSTer |
| no$psx | closed (lead) | none (lead) | not read | not read | not read | Win (lead) |
| pSX | closed | none | 1.13, by 2013 | not stated | dump | Win, Lin |
| PCSX-Reloaded | walled | GPL, version mixed | 1.9.95, 2013-08-26 | not stated | dump or HLE | PC, consoles |
| Connectix VGS | closed | proprietary | 1.4.1, 2000-10-11 | recompiler | own BIOS | Mac OS, Win |
| bleem! | closed | proprietary | 1.6b, 2001-08-16 | not stated | not settled | Win, Dreamcast |
| Sony's emulators | closed | maker's | PS3, PSP, Vita, PS4, PS5 | not stated | maker's | Sony hardware |

Sources by row: each project's README, site, or store page as cited in its paragraph below;
GPL-2.0 means GPL-2.0 with neither "only" nor "or later" stated, as the register records it.

### Emulators that put accuracy first

- [Mednafen's PlayStation module][mdf-psx] is the reference that others build on:
  Beetle PSX is "a port/fork of Mednafen's PSX module"
  ([libretro, "Beetle PSX"][lr-bpsx]), and OpenEmu's PlayStation core is Mednafen (OpenEmu README).
  Its documentation asks for SCPH-5500, SCPH-5501, and SCPH-5502 BIOS images, one for each region,
  and says "Do not rename other revisions/regions of the BIOS to match the expected filenames"
  ([Mednafen, "Sony PlayStation"][mdf-psx], "Valid as of 1.32.1").
- The same page offers checks on what the user supplies:
  one blacklists "known bad BIOS dumps" and BIOS versions that do not match the emulated region,
  and one checks that a disc's Q subchannel data looks like that of a commercially released disc
  (same, `psx.bios_sanity` and `psx.cd_sanity`).
  It has a debugger and warns of games "hitting hardware in ways that may not be correctly emulated" (same).
- Mednafen's latest release is 1.32.1 of 5 April 2024, and its notes improve the sound chip's reverb in 1.26.1
  ([Mednafen home page][mdf]).
  Its prose names no test results (a search of the PlayStation page, the documentation index, and the home page).
  Its home page says only GPLv2, so the register keeps it walled ([R0-05, "PlayStation family"][r005-ps]).
  Wikipedia says "or later", citing the project's old site as read in 2012
  ([Wikipedia, "Mednafen"][w-mdf]; tertiary),
  and Debian's copyright file for 1.32.1 puts the files as a whole under GPL-2+ and only some other cores,
  such as the SNES one, under GPL-2 ([Debian, mednafen copyright][deb-mdf]; secondary).
  That supports re-evaluating the Mednafen and Beetle lines; it does not yet change them.
- Beetle PSX and Beetle PSX HW add disc formats, upscaling, OpenGL and Vulkan renderers, and PGXP,
  a geometry precision enhancement by iCatButler ([libretro, "Beetle PSX HW"][lr-bpsxhw]).
  The docs call the software renderer "the most accurate",
  offer an optional recompiler that is "Much faster than interpreter, but CPU timing is less accurate"
  (lightrec, by [its README][lightrec]),
  and expose how many CPU cycles run before the GPU and DMA are checked, 128 by default (same).
  Without a BIOS file the cores load OpenBIOS, PCSX-Redux's replacement (same).
- XEBRA, by Dr. Hell, was written to show that timing matters.
  Its Japanese guide says it was built as a demonstration of reproducing the hardware's timing,
  which emulators around 2000 ignored for speed, and that some timing is approximated,
  so a few games need a per-game cache setting ([XEBRA guide][xebra-ja]; the note's own translation).
  Its English page says "XEBRA contains a compatible OS ROM image, but if you already have an official OS ROM image,
  you should use it" ([XEBRA, English page][xebra-en]); that built-in image is closed.
- The author's research page says the work came from experiments on an SCPH-7000 driven from a PC,
  and warns that the documents it lists contain errors even where they seem to excerpt official manuals
  ([Dr. Hell, PlayStation research][drhell-ps1]; own translation); one, PADUA, is closed in the register.
  The download bundles the replacement OS ROM (inference from that page), so it is closed and not linked.
- ares's PlayStation core is listed as experimental on its site ([ares][ares-site]).
  Release v148 refactored the core onto libco threads and worked on memory-control, disc, DMA, video decoder, GPU,
  and timer timing, and v145 removed the recompiler "once accuracy is more up to scratch"
  ([v148][ares-148] and [v145][ares-145] release notes).
  Its compatibility list marks titles completable, in-game, starts, nothing, or unknown, by version
  ([ares, PlayStation list][ares-compat]).
  The pages read do not say whether it needs a BIOS.
- Avocado calls itself "A Modern PlayStation 1 emulator", requires a BIOS from a console, and lists its own faults:
  sound hard-synced to 60 Hz and a timer that can stop games booting ([Avocado README][avocado]).
  Its author also wrote [ps1-tests][ps1tests]; its changelog ends on 16 November 2021, and its last push was in 2023.
- The MiSTer core reimplements the console in an FPGA.
  Its README rates the CPU, GPU, interrupts, geometry engine, video decoder, disc, and timers each at "90%",
  and notes that some games crash when seeking is faster than the console's ([PSX_MiSTer README][mister]).
  It is here as a second implementation from the hardware side; FPGA hosts belong to [R3-07 and R3-12][phase3].
- Rustation, in Rust, now says "This project is no longer being developed" and names rustation-ng as its successor
  ([Rustation README][rustation]).
  Its author runs tests on a console and keeps them in a repository with no licence, which is closed
  (`github.com/simias/psx-hardware-tests`, not linked); its results are usable.
  The guard's Rustation pattern also blocks rustation-ng, walled until evaluated.

### Emulators that put playability first

- DuckStation is the most-starred PlayStation 1 emulator found, with 11,044 stars
  (GitHub search for "psx emulator" by stars, 2026-11-22),
  and its Android app shows "1M+" downloads ([Google Play][ds-play]).
  It is closed, so only its README and contributing guide were read, and its repository is not linked.
- Its README describes a project "focusing on playability, speed, and long-term maintainability.
  The goal is to be as accurate as possible while maintaining performance suitable for low-end devices"
  (README, blob `2f72de90`).
  It lists a CPU recompiler for x86-64, 32-bit and 64-bit ARM, and RISC-V,
  renderers on five graphics interfaces and in software, upscaling, PGXP, texture replacement,
  widescreen and frame-rate patches, a debugger with a GDB server, and a fast boot that skips the BIOS's start screen.
  A BIOS from a PlayStation 1 or 2 is required, and the README names a tool for dumping one (same).
- Its licence changed in September 2024.
  It was GPL until 1 September, then the PolyForm Strict licence, then CC BY-NC-ND from 13 September
  ([GamingOnLinux, 16 September 2024][gol]; secondary).
  The author's statement there says the change was a deterrent to others who stripped his copyright,
  and that prior contributors approved it (same).
  The contributing guide now says "You are not permitted to publish modified versions of this repository"
  (CONTRIBUTING, blob `f6264352`).
  The earlier GPL version is not in the article; GPL-3.0 is from memory, consistent with its fork below.
- The Android app seemed to end in March 2026 and returned, rewritten, in November 2026
  ([Android Authority, 11 March 2026][aa-mar] and [3 November 2026][aa-nov], in captures; secondary).
  The beta page says the rewrite needs Android 7 and forbids redistribution of its APK ([DuckStation beta][ds-beta]).
  Desktop builds are for Windows, macOS 13.3 and later, and Linux (README).
- SwanStation is "a hard fork and open-source Libretro core implementation of DuckStation"
  ([SwanStation README][swan], blob `27aeebde`), under GPL-3.0 by its licence file.
  It falls back to OpenBIOS when no BIOS is given, emulates the disc controller's region check by default,
  and claims it "Passes amidog's CPU and GTE tests in both interpreter and recompiler modes,
  partial passing of CPX tests", with no log published (same). libretro's post of 16 July 2020 announced the core under
  DuckStation's name, with a required BIOS and no HLE BIOS, and now carries SwanStation's name
  ([libretro blog][lr-blog]); a libretro member believed the rename separates it from the standalone emulator
  ([libretro forum][lr-forum]; lead).
  So SwanStation stems from DuckStation's code before the licence change (inference).
- PCSX ReARMed is "yet another PCSX fork based on the PCSX-Reloaded project" with an ARM recompiler by Ari64,
  lightrec for other hosts, a NEON GPU by Exophase, and "BIOS HLE emulation (most games run without proprietary BIOS)"
  ([ReARMed README][rearmed], blob `dd731d75`).
  It was made for the Pandora handheld, with builds for other ARM handhelds
  ([notaz's page][notaz]).
  libretro's page says the HLE BIOS "decreases the level of compatibility", and that its cache emulation,
  needed by three Formula One games, is full only in the interpreter ([libretro, "PCSX ReARMed"][lr-rearmed]).
  It is in RetroArch and Lemuroid ([RetroArch, "PlayStation"][ra-ps1]; [Lemuroid README][lemuroid]).
- ePSXe is proprietary, with an open plug-in interface, and has had a high-level BIOS since 1.9.25
  ([Wikipedia, "EPSXe"][w-epsxe]; tertiary, with a citation-needed tag).
  Its site lists 2.0.18 for Windows on 23 December 2025, 2.0.5 for Linux and macOS in 2016,
  and 2.0.19 for Android in May 2026 ([ePSXe][epsxe]; [ePSXe for Android][epsxe-and]).
  The paid Android app shows "1M+" downloads ([Google Play][epsxe-play]).
- FPse, begun in 2001 as an ARM port of the PC emulator FPSE and now an Android app,
  recommends a BIOS image and switches to its own HLE mode without one ([FPse FAQ][fpse]).
  Its paid app shows "500K+" downloads and was last updated on 23 June 2025 ([Google Play][fpse-play]).

### Emulators for debugging and development

- [PCSX-Redux][redux] is "yet another fork of the Playstation emulator, PCSX", aimed at debugging
  ([PCSX-Redux README][redux], blob `ed581875`).
  It has a recompiler for x86-64, experimental on 64-bit ARM, an interpreter, software and OpenGL renderers,
  a MIPS debugger, a VRAM viewer, and Lua scripting (README), and a GDB server ([PCSX-Redux documentation][redux-docs]).
  Its browser build "runs the CPU interpreter only and boots OpenBIOS" (README).
- OpenBIOS lives in `pcsx-redux/nugget`, which the register closes.
  Its prose page says it "has been rewritten based off the reverse engineering of a dump of the BIOS of an american
  SCPH-7001 machine", and that "this code has been written using disassembly and reverse engineering of a retail bios
  the author dumped from a second hand console", relying on Connectix and Sega v Accolade ([OpenBIOS page][openbios]).
  That origin is a second reason, beside the closed-tier test, why Rustalgia reads none of it and ships none of it.
- no$psx is a proprietary debugger-emulator by the author of the Nocash specification
  (from memory), which also handles the PocketStation ([Emulation General, "PlayStation emulators"][egw-ps1]; lead).
  Its page, `problemkaputt.de/psx.htm`, is not linked: the fetch was refused
  (research log), and the register now closes it.
- pSX, by 2013, ran on Windows and Linux with "An R3000 debugger" and asked for a user's `SCPH1001.bin`
  ([pSX home page][psx-cap], 2013 capture); it is closed freeware and inactive (Emulation General; lead).

### Historical emulators

- Connectix's Virtual Game Station ran on Mac OS from January 1999,
  with a Windows version unfinished at the time of the injunction;
  its recompiling CPU emulator was written by Eric Traut
  ([Wikipedia, "Connectix Virtual Game Station"][w-vgs]; tertiary; [Sony v Connectix][connectix]).
  It shipped its own BIOS, which the court found "does not contain any of Sony's copyrighted material",
  though its engineers used Sony's during development (Sony v Connectix).
- The bleem!
  emulator ran on Windows 95 and 98 from March 1999, used the PC's 3D hardware for higher resolutions,
  and was ported to the Dreamcast (as Bleemcast!) for three games ([Wikipedia, "Bleem!"][w-bleem]; tertiary).
  How it handled the BIOS is not settled by any source read; that it needed none is from memory.
- PCSX, from 1999, was a plug-in emulator whose development stopped in 2003; PCSX-df and PCSX-Reloaded continued it,
  and PCSX-Reloaded's last release is 1.9.95 of 2013 ([Wikipedia, "PCSX-Reloaded"][w-pcsxr]; tertiary).
  Its mirror's README recommends its internal HLE BIOS ([PCSX-Reloaded mirror README][pcsxr]).
  Its licence evidence is mixed: the mirror's copy is GPL-3.0, Wikipedia names no version,
  and ReARMed carries the GPL-2.0 text; the register walls it until one licence is shown.

### Sony's own emulators

- The PSP runs PS one Classics from firmware 3.00 ([Wikipedia, "PlayStation Portable"][w-psp]; tertiary).
  All PlayStation 3 models emulate the PlayStation in software ([Wikipedia, "PlayStation 3 models"][w-ps3m]; tertiary).
  The Vita runs most PS one Classics, and in Japan a PocketStation application
  ([Wikipedia, "PlayStation Vita"][w-vita], [Wikipedia, "PocketStation"][w-pocket]; tertiary).
- PlayStation Plus Premium offers original PlayStation games on the PS4 and PS5 with save-anywhere and rewind
  ([PlayStation Blog, 16 May 2022][psb-2022]),
  and a 2024 title adds "up-rendering" and video filters ([PlayStation Blog, 9 October 2024][psb-2024]).
  Who wrote that emulator is not stated in any maker prose found.
- The PlayStation Classic of 2018 runs PCSX ReARMed.
  Sony's open-source page for it lists "PCSX ReARMed", and says "This program is licensed under the GPLv2.
  In compliance with the license, the source code of the program is made available to you from here"
  ([Sony's OSS index][oss-index] and [ReARMed page][oss-rearmed], 2018 captures).
  ReARMed's README says the fork was used "without any coordination or even notification"
  ([ReARMed README][rearmed]);
  the press found it from the licence list on the console ([Ars Technica][ars]; [TechCrunch][tc]; secondary).
  The source archive, under `doc.dl.playstation.net/doc/content/dam/corporate/eula/psclassic-oss/`, is not linked:
  it is code, walled in the register.
- The Classic's licence bars reverse engineering of its software and circumvention of its security,
  and lets third-party terms prevail for their components ([PS Classic licence][classic-lic]).
- libretro names region-free BIOS images that come from the PSP and the PS3
  ([libretro, "Beetle PSX HW"][lr-bpsxhw]); they are maker firmware, which Rustalgia may not obtain.

### Newer and Rust emulators

| Emulator | Language | Tier | Licence | Why walled, or note |
|---|---|---|---|---|
| [starpsx][starpsx] | Rust | walled | GPL-3.0 | names psx-spx as its PlayStation documentation |
| [Trapezoid][trapezoid] | Rust | walled | MIT | "Most of the documentation" from psx-spx |
| [PSoXide][psoxide] | Rust | walled | GPL-2.0; README: or later | not clean-room; parts from psx-spx; HLE closed |
| [CoffeePSX][coffee] | Rust | open | GPL-3.0 | archived on GitHub; moved to Codeberg |
| [psx-rs][psxrs] | Rust | open | GPL-3.0 | no documentation named; last push 2021 |
| [ProjectPSX][projectpsx] | C# | walled | MIT | "mainly used" the Nocash document |
| [psxe][psxe] | C | open | MIT | no documentation named |
| [eNGE][enge] | JavaScript | walled | MIT | holds tests ported from a closed kit, in a folder not known |
| [lightrec][lightrec] | C | walled | LGPL-2.1 | a recompiler library, not an emulator |

- Sources: each project's README, read raw; licences from its licence endpoint.
  The tainted reference's addresses in these READMEs were not followed.
- starpsx, with 331 stars, needs a user's BIOS and tests against SCPH-1001;
  its component table says its CPU "Passes most test ROMs", without naming them ([starpsx README][starpsx]).
- CoffeePSX, by the author of jgenesis, is "Currently implemented using a plain interpreter",
  with a wgpu renderer "up to 16x native" and no accurate DMA, GPU, or video decoder timing yet
  ([CoffeePSX README][coffee]).
- PSoXide is "**Largely written with agentic coding.**" and boots games with its own HLE kernel,
  so "no BIOS is needed or accepted"; it says it used PCSX-Redux as a "parity oracle" early on,
  that it "is not a clean-room implementation as a whole",
  and that several subsystems were rewritten from psx-spx and console measurements ([PSoXide README][psoxide]).
- psxe tells users they "can either get one from the internet" or dump a BIOS
  ([psxe README][psxe]),
  and eNGE, which runs in a browser, says it is checked by tests ported from ps1-tests and from OpenBIOS's kit,
  which is closed ([eNGE README][enge]); finding the folder would need a listing of its code,
  so the whole repository is walled as a precaution until that folder can be registered closed.
- lightrec calls itself a "MIPS-to-everything dynamic recompiler for PlayStation emulators", used by ReARMed and Beetle
  ([lightrec README][lightrec]).
  Its licence file is LGPL-2.1, and whether its files say "or later" was not checked,
  so it is walled like `nukeykt/nuked-opm` in the register.

### PocketStation, Net Yaroze, and the PS one

- Pokket is an open-source PocketStation core, "as cycle-accurate as possible"
  ([libretro, "PokketStation"][lr-pokket]), for libretro, Windows, the Vita, and the web.
  Its README says "**Neither package contains a PocketStation BIOS.**",
  that it uses psx-spx for the PlayStation and the PocketStation, and that its test data comes from a real device
  ([Pokket README][pokket]).
  It is walled by the register's rule for the tainted document.
- no$psx and XEBRA also handle the PocketStation (Emulation General; lead), and Sony made its own for the Vita in Japan.
- The Net Yaroze has different boot ROMs, no regional lock-out, a key disc, and an access card in memory card port 1
  ([Wikipedia, "Net Yaroze"][w-yaroze]; tertiary).
  No emulator prose read names a Net Yaroze mode (search of the READMEs and pages above and Emulation General's list).
- The PS one has the late hardware in a smaller case ([R1-06][r106-home]);
  no emulator read treats it as a separate system.
  Hardware revisions appear in emulators only as BIOS versions: Mednafen's per-region images,
  DuckStation's acceptance of "any hardware version or region" with possible mismatches (README),
  and starpsx's tested SCPH-1001.

### Frontends and stores

- RetroArch, open tier, offers Beetle PSX, Beetle PSX HW, and PCSX ReARMed,
  and says "Netplay works only with PCSX ReARMed"
  ([RetroArch, "PlayStation"][ra-ps1]); its Android app shows "5M+" downloads ([Google Play][ra-play]).
  On the App Store, "JIT is not enabled", so recompilers cannot run as such
  ([libretro, "RetroArch on iOS"][lr-ios]); which PlayStation cores it ships there was not confirmed.
- Lemuroid (Android, GPL-3.0) uses PCSX ReARMed and shows "5M+" downloads
  ([Lemuroid README][lemuroid]; [Google Play][lemuroid-play]).
  OpenEmu (macOS) uses Mednafen and has no licence file or licence statement, so it is closed
  (OpenEmu README, not linked because the repository is closed; [Wikipedia, "OpenEmu"][w-openemu] says BSD; tertiary).
  Provenance (iOS, tvOS) lists the PlayStation and a Mednafen core ([Provenance][prov]; [App Store][prov-store]).
  Delta's user guide does not mention the PlayStation ([Delta User Guide][delta]).
- Apple's rules now say "retro game console and PC emulator apps can offer to download games"
  ([App Review Guidelines][apple], 4.7).
  Gamma, a PlayStation 1 emulator with no licence stated, reached the App Store in May 2024,
  free with advertising and in-app purchases, and runs games without BIOS files
  ([MacRumors][macrumors]; secondary; [App Store][gamma]); its engine is not named anywhere read.

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Protection is physical and is not encryption,
  though GameMasters repeats the claim that the console reads "encrypted data"
  ([Sony v GameMasters][gamemasters]) and R1-06 quotes Wikipedia's word for the Net Yaroze ([R1-06][r106-home]).
  Sony's patent checks a wobble in the disc's table of contents ([R1-02][r102-media])
  and then says "the system compares a logo and/or license data stored in memory of the machine with the contents of
  predetermined memory or storage locations on the disc" ([US 6,304,971][us6304971]).
  The patent says this display makes a copier misrepresent a copy as licensed, under trade mark law (same) —
  the design that [Sega v Accolade][r002-logo] met.
  So a BIOS that boots a disc draws a Sony licence screen from the BIOS and the disc,
  and a replacement or high-level path need draw none (inference; [R0-02 option 16][r002-o16]).
- Lock-out cases are about devices on the console.
  GameMasters found that a cheat device whose second function was to play other regions' discs replaced the console's
  operating system during a disc swap ([Sony v GameMasters][gamemasters]); R0-02 records the holding
  ([R0-02, "Console checks"][r002-checks]).
  In Stevens, Australia's High Court allowed the mod-chip seller's appeal;
  McHugh J wrote that the access code "was not a 'technological protection measure' for the purposes of the Act"
  ([Stevens v Sony][stevens], at 107),
  and the current wording excludes a measure that "controls geographic market segmentation"
  ([R0-02, "Australia and South Korea"][r002-au]).
  The drive's region string is therefore something an emulator reports, as [R1-06][r106-home] records (inference).
- The BIOS is Sony's copyright, and Connectix is the family's own precedent ([R0-02, "Connectix and Bleem"][r002-cb]).
  The opinion adds facts: the engineers bought a console and extracted its BIOS,
  observed it running and disassembled parts of it, and Sony declined to help ([Sony v Connectix][connectix]).
  Its holding protects that intermediate copying, and the product shipped its own BIOS (same);
  it says nothing about a user's dump (inference, as R0-02 notes).
- Projects split three ways, as in [R0-02's options 4 and 5][r002-o4]
  ([R0-02, "How projects handle firmware"][r002-how]):
  a user's dump (DuckStation, Mednafen, Avocado, starpsx, pSX, Pokket for the PocketStation);
  a replacement that ships or loads by default (SwanStation and Beetle with OpenBIOS, XEBRA, VGS); and a high-level BIOS
  (ReARMed, PCSX-Reloaded, ePSXe, FPse, PSoXide).
- Dumping and kit guidance touches [R0-02 option 7][r002-o7].
  DuckStation's README and its store page name dumping tools; psxe points users to "the internet";
  PCSX-Redux tells developers to convert Sony's PsyQ libraries and says "You might find them pre-compiled online"
  ([PCSX-Redux README][redux]); that PsyQ is Sony's kit is from memory.
- LibCrypt is "a protection scheme included on some PAL region PlayStation 1 discs", first used in October 1998,
  which keeps altered data in the Q subchannel of some sectors
  ([Redump, "LibCrypt"][redump-lc], 2026 capture; how the sectors are altered is not recorded here).
  The page also points to SBI downloads, which were not followed.
  Emulators take that data from an SBI file beside the image or from an image that carries subchannels
  (DuckStation README; [libretro, "Beetle PSX HW"][lr-bpsxhw]; [Avocado README][avocado]).
  The MiSTer README says such games "will not work if it's not circumvented" ([PSX_MiSTer README][mister]).
  No decision on whether LibCrypt is an access control, or an SBI file a means around it, was found
  (web searches for LibCrypt with circumvention, DMCA, and court terms, 2026-11-22);
  a project that ships or links SBI files could face a trafficking claim if it is (inference, recorded as a risk).
- Enforcement since 2001 is thin.
  After Bleem closed in November 2001
  ([The Register][reg-2001]; secondary)
  and Connectix sold its emulator to Sony,
  web searches on 2026-11-22 found no rights holder's takedown of a PlayStation 1 emulator or BIOS site,
  and R0-02 found no notice from Sony against a PlayStation emulator, or naming a console BIOS file, in GitHub's archive
  ([R0-02, "Takedown history"][r002-take]).
  Google removed ePSXe from Google Play for a "malicious behavior policy violation" in October 2016
  and restored it within a week, by the project's account ([ePSXe][epsxe]).
  Sony was among the rights holders whose requests removed titles from Vimm's Lair, a game-copy site not linked here
  ([Kotaku, 7 June 2024][kotaku]; secondary).
- R0-02 found no Sony statement on emulators as such
  ([R0-02, "Makers' statements"][r002-stmt]),
  but its conduct is that of a user: the Classic ships a community GPL emulator, the PSP and PS3 carry PS1 emulators,
  and its blog advertises rewind and save-anywhere in its own (inference from the findings above).
- Of the Sony patents on the hardware cited by R1-02 and R1-06, four show "Expired - Lifetime" on Google Patents:
  [US 6,304,971][us6304971] (anticipated expiry 2015-11-13), [US 5,793,376][us5793376] (2015-11-30),
  [EP 0715277][ep0715277] (2015-11-20), and [US 5,850,540][us5850540] (2015-12-15);
  [EP 0715276][ep0715276] and [EP 1280150][ep1280150] show "Withdrawn".
  So [R0-02 option 12][r002-o12] fits the family; Google's status is not a legal conclusion.
- Names: DuckStation's README and Gamma's listing name Sony's marks and disclaim affiliation
  ([R0-02 option 14][r002-o14]);
  paid apps (ePSXe, FPse) and Gamma's advertising and in-app purchases bear on [R0-02 option 8][r002-o8].
- Of R0-02's options, 1 (no encryption), 4 and 5 (firmware), 7 (guides), 8 (money), 12
  (expired patents), 14 (names), and 16 (boot logos) apply to this family (inference).

### How hard the family is to emulate

- To run most games is a solved problem on modest hardware: ReARMed was built for the Pandora,
  and Sony shipped it on the Classic's quad Cortex-A35 at 1.5 GHz
  ([Wikipedia, "PlayStation Classic"][w-classic]; tertiary, its clock cited to a video review).
- To run them exactly is not.
  R1-02 left open the CPU's TLB, the disc controller's processor, the sound chip's envelopes,
  and the interrupt and DMA layout ([R1-02, "Open questions"][r102-open]), and recommends hardware tests as the oracle
  ([R1-02, "Recommendation"][r102-rec]).
  The emulators' own notes agree on where the difficulty lies: disc seek timing (MiSTer), DMA and video decoder timing
  (ares v148; CoffeePSX),
  the CPU's cache (ReARMed's Formula One games), and the geometry engine's transfer delays (MiSTer).
- The documentation problem is the hardest part.
  Four projects above name the tainted reference as their documentation and PSoXide rewrote parts from it;
  Rustation names it and Mednafen's code
  ([R0-05, "PlayStation family"][r005-ps]);
  and the open older document, Walker's, says its author studied emulators of the time, Bleem among them,
  to learn how the console worked ([Walker][walker], "Introduction").
  An emulator's behaviour may therefore rest on the tainted document at one remove (inference).
- The disc controller's own processor, which [R1-02][r102-open] left to this survey, has no clean source.
  The only lead found is a forum thread on dumping its firmware,
  so its facts come from firmware analysis and are not recorded ([ADR 0006, "In every tier"][adr6-every]).
  What a game sees of the controller is its command timing, which [ps1-tests][ps1tests] measures ([R1-02][r102-media]).
- Enhancement and accuracy pull apart.
  PGXP, upscaling, overclocking, widescreen hacks, and fast boot appear in DuckStation, [SwanStation][swan], Beetle,
  [ReARMed][rearmed], and [eNGE][enge],
  and Beetle's documentation calls its hardware renderers less accurate than its software one
  (sources above; [R1-02, "Accurate or enhanced 3D"][r102-3d]).

### Tests and published results

| Suite | Tier | Oracle | Covers | Emulator results |
|---|---|---|---|---|
| [ps1-tests][ps1tests] | open | not stated; logs read as a console's | eight areas, CD to timers | none |
| AmiDog's tests | closed archives | console (lead); GTE: his simulation | CPU, CPX, GPU, GTE | user wiki (lead) |
| [SingleStepTests r3000][sst] | open | the ares interpreter | a file per CPU instruction | none; ares by design |
| [240p test suite][240p] | open | not stated; display tests | display | none |
| Rustation's console tests | closed | console, by its author | not read | none |

- Sources: each suite's README or pages;
  tiers from the [register][register]. ps1-tests' logs are discussed in [R1-02, "Tests and their oracles"][r102-tests];
  its README publishes no table of emulator results, and none was found in the emulators' prose.
- AmiDog's GTE test compares results "with a software simulation" and takes hours on a console
  ([AmiDog, GTE test][amidog-gte]); his CPU page offers a CPU test and a CPX test ([AmiDog, CPU tests][amidog-cpu]).
  His wiki stays open despite its non-commercial text licence, because ADR 0006 tests community references by origin
  ([ADR 0006, "Sources that are not emulators"][adr6-kinds]).
- SingleStepTests' README says it "only tests the basic functionality of the valid MIPS encodings",
  with exceptions disabled and no coprocessor tests ([SingleStepTests r3000 README][sst]).
- The only published comparison is a user wiki's table of AmiDog's tests, tagged out of date,
  which also says ePSXe "deliberately targeted these tests" and that a developer edited the page in its favour
  ([Emulation General, "PS1 Tests"][egw-tests]; lead).
  It scores a console booted from an Xplorer cartridge at 291 points, and gives, among others,
  FPse 5 and ePSXe for Android 229, and these totals, not relied on here:

| Emulator (version in the CPU table) | Points of 291 |
|---|---|
| XEBRA 2021.10.31 | 260 |
| ePSXe 2.0.0 and 2.0.2 | 260 |
| Mednafen 1.21.1 | 246 |
| DuckStation 0.1.9429 | 237 |
| PS3 emulator 4.65 | 161 |
| PCSX-Reloaded 2015-01-28 | 144 |
| MAME 0.246 | 101 |
| PCSX ReARMed r22 | 46 |
| pSX 1.13 | 9 |

- The same page says that at least SCPH-7000 and later consoles fail one GPU register test,
  so the oracle depends on the console's revision (same; lead).

## Options and trade-offs

The options answer four separate questions, and the recommendation takes one answer to each.

### Which emulators the PlayStation 1 studies cover

- **What:** keep the roadmap's two studies, DuckStation ([R1-40][studies]) and PCSX-Redux ([R1-41][studies]);
  add a study of [Mednafen's module][mdf-psx];
  or replace PCSX-Redux with it. [ares][ares-site]'s core falls to [R1-60][studies] either way.
- **Costs:** DuckStation can be studied only from prose and behaviour; [PCSX-Redux][redux] and Mednafen are walled,
  so their code needs a reader session unless Mednafen's "or later" is confirmed; a third study adds one item.
- **Gains:** DuckStation is the most used and PCSX-Redux has the best tools;
  Mednafen is the accuracy reference that [Beetle][lr-bpsx] and OpenEmu build on,
  and its documentation describes checks on the BIOS and disc data that the user supplies.
- **Used by:** the [roadmap][studies], which lists R1-40 and R1-41.

### Which oracles the PlayStation 1 core is tested against

- **What:** [ps1-tests][ps1tests]' published results; Rustalgia's own console measurements in [R5-12][phase5];
  [SingleStepTests r3000][sst]; [AmiDog's tests][amidog-cpu]; or another emulator's output.
- **Costs:** ps1-tests' origin is unstated, and its README builds it with PSn00bSDK,
  which the register closes for parts "lifted as-is from Sony libraries",
  so its binaries may carry such code (inference); console measurements need hardware and time;
  SingleStepTests and another emulator only reproduce an emulator; AmiDog's archives are closed,
  so only his results can be used.
- **Gains:** ps1-tests is open and runnable, and its logs answered, at least in part, six gaps in [R1-02][r102-tests];
  console measurements are clean by construction.
- **Used by:** [eNGE][enge] (ps1-tests), [starpsx][starpsx]
  (unnamed test ROMs), [SwanStation][swan] (AmiDog), [PSoXide][psoxide] (PCSX-Redux traces).

### How firmware is handled

- **What:** require a user's BIOS; write Rustalgia's own high-level services; or load another project's replacement.
- **Costs:** a user's dump has no settled lawful route
  ([R0-02 option 4][r002-o4]);
  high-level services lose compatibility, by [libretro's account of ReARMed][lr-rearmed];
  every replacement found is closed tier, and [OpenBIOS][openbios] came from disassembly.
- **Gains:** a user's dump gives the console's behaviour, including the licence screen;
  own services need nothing from Sony.
- **Used by:** see "Legal exposure"; [R2-12][phase2] weighs the routes.

### Subchannel data on protected PAL discs

- **What:** read subchannel data only from the user's own image, also accept separate SBI files, or support neither.
- **Costs:** without the data, protected games hang or crash
  (DuckStation README, not linked);
  a separate file may be argued to be a means around a check
  (see "Legal exposure"); support for neither drops more than a hundred PAL games ([Redump, "LibCrypt"][redump-lc]).
- **Gains:** images with subchannels need no extra file;
  never shipping or linking SBI files removes the conduct a trafficking claim would rely on (inference).
- **Used by:** DuckStation reads both; [Beetle][lr-bpsxhw] and [Avocado][avocado] read SBI files;
  [Mednafen][mdf-psx] checks the subchannel data present.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** keep R1-40 and R1-41, and add a study of [Mednafen's PlayStation module][mdf-psx],
  read by a reader session while it is walled, or directly if a re-evaluation opens it.
  It is the base of Beetle and of OpenEmu's core and documents its own checks,
  while DuckStation teaches only by prose and behaviour.
- **Oracles:** test against [ps1-tests][ps1tests]' published results first and [R5-12][phase5]'s console measurements
  for the gaps, use [SingleStepTests r3000][sst] only as a regression aid, and treat the wiki's AmiDog table as a lead.
  A test's origin is the measurement,
  and the only published emulator scores rest on a wiki that reports edits by a developer whose emulator it scored.
- **Firmware:** support the user's own BIOS as the accurate path,
  add Rustalgia's own high-level services later where clean sources describe them, and never ship, bundle,
  or load by default another project's replacement.
  This matches [R1-02's recommendation][r102-rec]
  and keeps the project's own boot path free of a Sony licence screen (inference).
- **Subchannel data:** read it when the user's image carries it,
  and decide separate SBI files with [R2-11][phase2] and R0-02's risks; never ship, link, or describe how to make one,
  and cite the Redump page, which points to SBI downloads, only for its description.

## Implications for Rustalgia

- [R1-40][studies] should scope DuckStation to its prose and observed behaviour,
  and R1-41 to a reader session's description of [PCSX-Redux][redux]'s debugger and structure; a Mednafen study,
  if the owner adds it, feeds [R2-03][phase2]'s scheduling and [R2-12][phase2]'s firmware decisions.
- [R5-12][phase5] should cover what this survey found no clean source for: disc seek timing,
  DMA and video decoder timing, cache behaviour, and the role of each chip on the board.
- [R2-11][phase2] should handle images that carry subchannel data, for LibCrypt discs, with R0-02's risk in mind.
- iOS App Store builds cannot use a recompiler, so the core's interpreter must reach full speed on an iPhone,
  which [R3-01][phase3] and [R5-07][phase5] can measure; the Classic shows a recompiling emulator, not an interpreter,
  on a 1.5 GHz Cortex-A35 (inference).
- [R6-01][phase6] can weigh the PocketStation separately: it needs its own BIOS from the user,
  and the only emulator studied that models it closely, [Pokket][pokket], is walled.

## Open questions

- Which processor runs the disc controller?
  Public-domain photographs on Wikimedia Commons name the boards' Sony parts,
  such as CXD1199BQ and CXD2516Q on an SCPH-1000 and CXD1815Q and CXD2545Q on an SCPH-5001
  ([SCPH-1000 board][c-1000]; [SCPH-5001 board][c-5001]),
  but no page read says which part holds the controller's processor or what core it is.
  A datasheet for each part number would answer it, then [R5-12][phase5] on a board;
  psxrev's wiki may help once its prose can be read ([R0-05][r005-ps]).
- Is Mednafen's PlayStation module, in Mednafen's own files, GPL-2.0 "or later" as Debian records?
  Reading the licence notices in Mednafen's release, which is prose but sits under a walled path,
  in a reader session or after the owner re-evaluates the line.
- How do current emulators score on [ps1-tests][ps1tests]?
  Running the suite through [R5-05][phase5]'s headless runner against each emulator's binary, which observes behaviour.

## Sources

Every source below was read on 2026-11-22, as raw text, unless an entry says otherwise.
Repository READMEs are pinned by the blob read; Wikipedia links are pinned to the revision read.
Closed and tainted addresses are in code spans, with the reason.

Repository documents:

- [ADR 0006][adr6]; [research guide][guide]; [research roadmap][roadmap]; [source register][register].
- [R0-02, legal baseline][r002]; [R0-05, "PlayStation family"][r005-ps]; [R1-02, primer][r102];
  [R1-06, catalogue][r106-home].

Emulator projects, prose only:

- DuckStation: README (blob `2f72de90`) and CONTRIBUTING
  (blob `f6264352`)
  at `github.com/stenzek/duckstation`, not linked because the repository is closed; [Android beta page][ds-beta];
  [Google Play listing][ds-play].
- [SwanStation README][swan] (blob `27aeebde`);
  [libretro, "New PlayStation1 core SwanStation now available for RetroArch!"][lr-blog];
  [libretro forum thread][lr-forum] (lead).
- [Mednafen home page][mdf]; [Mednafen, "Sony PlayStation"][mdf-psx], last updated 19 March 2024, valid as of 1.32.1.
- libretro documentation: ["Beetle PSX"][lr-bpsx], ["Beetle PSX HW"][lr-bpsxhw], ["PCSX ReARMed"][lr-rearmed],
  ["pokketstation"][lr-pokket], ["RetroArch on iOS"][lr-ios]; [RetroArch, "PlayStation"][ra-ps1].
- [PCSX ReARMed README][rearmed] (blob `dd731d75`); [notaz's ReARMed page][notaz]; [PCSX-Reloaded mirror README][pcsxr]
  (blob `50713d2a`).
- [PCSX-Redux README][redux] (blob `ed581875`); [PCSX-Redux documentation][redux-docs]; [OpenBIOS page][openbios],
  read to the end of its legality section; OpenBIOS itself, in `pcsx-redux/nugget`, is closed and was not opened.
- [ePSXe home page][epsxe]; [ePSXe for Android][epsxe-and]; [ePSXe on Google Play][epsxe-play]; [FPse FAQ][fpse];
  [FPse on Google Play][fpse-play].
- [Dr. Hell, PlayStation research][drhell-ps1]; [XEBRA guide][xebra-ja], afterword dated 2018-07-09;
  [XEBRA, English page][xebra-en].
- [ares home page][ares-site]; [ares PlayStation compatibility list][ares-compat]; ares release notes [v148][ares-148]
  (2026-05-30) and [v145][ares-145] (2025-07-09).
- [Avocado README][avocado] (blob `1a48bb47`); [Rustation README][rustation]
  (blob `73750ee9`); [PSX_MiSTer README][mister] (blob `e3007672`).
- [pSX home page][psx-cap], capture of 2013-07-19 21:05:42; the live host timed out (research log).
- Newer projects' READMEs: [starpsx][starpsx]
  (blob `03e0b826`),
  [Trapezoid][trapezoid] (`a138858f`), [PSoXide][psoxide] (`e5372b35`), [CoffeePSX][coffee] (`14043268`),
  [psx-rs][psxrs] (`6d4844b7`), [ProjectPSX][projectpsx] (`f701ae46`), [psxe][psxe]
  (`96ba4c1806c65f09a0413b671c7206d047a1cb24`), [eNGE][enge] (`5026b79c`), [lightrec][lightrec] (`849ec292`),
  [Pokket][pokket] (`cb83b2bd`).
- `problemkaputt.de/psx.htm`, the no$psx page, not linked and not opened: the fetch was refused (research log).
  The tainted reference's addresses, linked from several READMEs, were not followed.

Frontends and stores:

- [Lemuroid README][lemuroid] (blob `c080a6d1`); OpenEmu README at `github.com/OpenEmu/OpenEmu`
  (blob `9db9ecaf`), not linked because the repository is closed; [Provenance][prov]; [Delta User Guide][delta].
- Google Play: [RetroArch][ra-play]; [Lemuroid][lemuroid-play].
- App Store: [Provenance][prov-store]; [Gamma][gamma].
- Apple, [App Review Guidelines][apple], section 4.7.

Sony:

- [Sony's PlayStation Classic OSS index][oss-index] (capture of 2018-12-11) and its [ReARMed page][oss-rearmed]
  (capture of 2018-12-03); [PS Classic System Software Licence Agreement][classic-lic], Australian page.
- PlayStation Blog: [16 May 2022][psb-2022]; [9 October 2024][psb-2024].

Courts and patents:

- [Sony v Connectix][connectix], 203 F.3d 596 (9th Cir. 2000); [Sony v GameMasters][gamemasters], 87 F.Supp.2d 976
  (N.D. Cal. 1999); [Stevens v Kabushiki Kaisha Sony Computer Entertainment][stevens], [2005] HCA 58.
- Google Patents, status pages: [US 6,304,971 B1][us6304971]; [US 5,793,376 A][us5793376]; [US 5,850,540 A][us5850540];
  [EP 0715277 A2][ep0715277]; [EP 0715276 A2][ep0715276]; [EP 1280150 A2][ep1280150].

References and tests:

- [Walker's compilation][walker], "Introduction".
- [Redump wiki, "LibCrypt"][redump-lc], capture of 2026-06-15, last modified 17 February 2026;
  the live page returned HTTP 404 (research log).
- [ps1-tests][ps1tests] (README blob `c92fabaf`); [SingleStepTests r3000][sst]
  (blob `bf120ccc`);
  [240p test suite][240p] (blob `b00d9a7a`); AmiDog's [CPU tests][amidog-cpu]
  (modified 2013-12-31) and [GTE test][amidog-gte] (2013-09-07) pages.
- `github.com/simias/psx-hardware-tests`, metadata only, not linked: it has no licence and is closed.

Wikipedia (tertiary):

- ["Connectix Virtual Game Station"][w-vgs]; ["Bleem!"][w-bleem]; ["PCSX-Reloaded"][w-pcsxr]; ["EPSXe"][w-epsxe];
  ["Mednafen"][w-mdf]; ["OpenEmu"][w-openemu].
- Debian, [mednafen copyright file][deb-mdf], package 1.32.1+dfsg-3 in unstable (secondary).
- Wikimedia Commons file pages, public domain by their author: [SCPH-1000 board][c-1000]; [SCPH-5001 board][c-5001].
- ["PlayStation Classic"][w-classic]; ["PlayStation Portable"][w-psp]; ["PlayStation 3 models"][w-ps3m];
  ["PlayStation Vita"][w-vita]; ["PocketStation"][w-pocket], used only for its Vita sentence,
  because the article cites the tainted reference for hardware; ["Net Yaroze"][w-yaroze].

Press and wikis (secondary, or leads):

- [GamingOnLinux, 16 September 2024][gol]; [Android Authority, 11 March 2026][aa-mar], capture of 2026-08-08,
  and [3 November 2026][aa-nov], capture of 2026-11-05.
- [Ars Technica, 9 November 2018][ars]; [TechCrunch, 9 November 2018][tc]; [MacRumors, 13 May 2024][macrumors].
- [The Register, 19 November 2001][reg-2001]; [Kotaku, 7 June 2024][kotaku].
- Emulation General wiki (leads): ["PlayStation emulators"][egw-ps1], revision 152329 (2026-11-18);
  ["PS1 Tests"][egw-tests], revision 139373 (2026-03-01).

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-kinds]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#sources-that-are-not-emulators
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[adr6-every]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#in-every-tier
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
[r002-cb]: R0-02-legal-baseline.md#connectix-and-bleem
[r002-checks]: R0-02-legal-baseline.md#console-checks-and-use-after-circumvention
[r002-au]: R0-02-legal-baseline.md#australia-and-south-korea
[r002-stmt]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-how]: R0-02-legal-baseline.md#how-projects-handle-firmware-and-games
[r002-logo]: R0-02-legal-baseline.md#boot-logos
[r002-take]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-o12]: R0-02-legal-baseline.md#12-read-expired-patents-only-as-documentation
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r005-ps]: R0-05-source-map.md#playstation-family
[r102]: R1-02-primer-32-and-64-bit.md
[r102-media]: R1-02-primer-32-and-64-bit.md#media-protection-and-firmware
[r102-tests]: R1-02-primer-32-and-64-bit.md#tests-and-their-oracles
[r102-3d]: R1-02-primer-32-and-64-bit.md#accurate-or-enhanced-3d
[r102-rec]: R1-02-primer-32-and-64-bit.md#recommendation
[r102-open]: R1-02-primer-32-and-64-bit.md#open-questions
[r106-home]: R1-06-catalogue-32-and-64-bit.md#home-consoles
[r106-addons]: R1-06-catalogue-32-and-64-bit.md#add-ons-and-expansion-cards
[ds-beta]: https://downloads.duckstation.org/android-testing/
[ds-play]: https://play.google.com/store/apps/details?id=com.github.stenzek.duckstation
[gol]: https://www.gamingonlinux.com/2024/09/playstation-1-emulator-duckstation-changes-license-for-no-commercial-use-and-no-derivatives/
[aa-mar]: https://web.archive.org/web/20260808010503/https://www.androidauthority.com/duckstation-ends-android-support-3648430/
[aa-nov]: https://web.archive.org/web/20261105171631/https://www.androidauthority.com/duckstation-ps1-emulator-android-updates-3731072/
[swan]: https://github.com/libretro/swanstation
[lr-blog]: https://www.libretro.com/index.php/new-playstation1-core-duckstation-now-available-for-retroarch/
[lr-forum]: https://forums.libretro.com/t/duckstation-in-retroarch-is-called-swanstation-now/32068
[mdf]: https://mednafen.github.io/
[mdf-psx]: https://mednafen.github.io/documentation/psx.html
[lr-bpsx]: https://docs.libretro.com/library/beetle_psx/
[lr-bpsxhw]: https://docs.libretro.com/library/beetle_psx_hw/
[lr-rearmed]: https://docs.libretro.com/library/pcsx_rearmed/
[lr-pokket]: https://docs.libretro.com/library/pokketstation/
[lr-ios]: https://docs.libretro.com/guides/install-ios/
[ra-ps1]: https://www.retroarch.com/ps1.html
[rearmed]: https://github.com/notaz/pcsx_rearmed
[notaz]: http://notaz.gp2x.de/pcsx_rearmed.php
[pcsxr]: https://github.com/mirror/pcsxr
[redux]: https://github.com/pcsx-redux/pcsx-redux
[redux-docs]: https://pcsx-redux.consoledev.net/
[openbios]: https://pcsx-redux.consoledev.net/openbios/
[epsxe]: https://www.epsxe.com/
[epsxe-and]: http://www.epsxe.com/android/
[epsxe-play]: https://play.google.com/store/apps/details?id=com.epsxe.ePSXe
[fpse]: http://www.fpsece.net/faq.html
[fpse-play]: https://play.google.com/store/apps/details?id=com.emulator.fpse
[drhell-ps1]: https://drhell.web.fc2.com/ps1/
[xebra-ja]: https://drhell.web.fc2.com/ps1/xebra/index.html
[xebra-en]: https://drhell.web.fc2.com/ps1/xebra/index2.html
[ares-site]: https://ares-emu.net/
[ares-compat]: https://ares-emu.net/compatibility/sony-playstation
[ares-148]: https://github.com/ares-emulator/ares/releases/tag/v148
[ares-145]: https://github.com/ares-emulator/ares/releases/tag/v145
[avocado]: https://github.com/JaCzekanski/Avocado
[rustation]: https://github.com/simias/rustation
[mister]: https://github.com/MiSTer-devel/PSX_MiSTer
[psx-cap]: https://web.archive.org/web/20130719210542/http://psxemulator.gazaxian.com:80/
[starpsx]: https://github.com/kaezrr/starpsx
[trapezoid]: https://github.com/Amjad50/Trapezoid
[psoxide]: https://github.com/EBonura/PSoXide-emulator
[coffee]: https://github.com/jsgroth/CoffeePSX
[psxrs]: https://github.com/marcosatti/psx-rs
[projectpsx]: https://github.com/BluestormDNA/ProjectPSX
[psxe]: https://github.com/allkern/psxe
[enge]: https://github.com/kootstra-rene/enge-js
[lightrec]: https://github.com/pcercuei/lightrec
[pokket]: https://github.com/mentalfoundry/Pokket
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[lemuroid-play]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[ra-play]: https://play.google.com/store/apps/details?id=com.retroarch
[prov]: https://provenance-emu.com/
[prov-store]: https://apps.apple.com/us/app/provenance-app/id1596862805
[delta]: https://faq.deltaemulator.com/
[apple]: https://developer.apple.com/app-store/review/guidelines/
[gamma]: https://apps.apple.com/us/app/gamma-ps-1-game-emulator/id6499106870
[macrumors]: https://www.macrumors.com/2024/05/13/gamma-ps1-emulator-released-iphone/
[oss-index]: https://web.archive.org/web/20181211205456/https://doc.dl.playstation.net/doc/psclassic-oss/
[oss-rearmed]: https://web.archive.org/web/20181203063030/https://doc.dl.playstation.net/doc/psclassic-oss/PCSX_ReARMed.html
[classic-lic]: https://www.playstation.com/en-au/legal/ps-classic-system-software-license-agreement/
[psb-2022]: https://blog.playstation.com/2022/05/16/all-new-playstation-plus-game-lineup-assassins-creed-valhalla-demons-souls-ghost-of-tsushima-directors-cut-nba-2k22-and-more-join-the-service/
[psb-2024]: https://blog.playstation.com/2024/10/09/playstation-plus-game-catalog-for-october-dead-island-2-two-point-campus-gris-return-to-monkey-island-and-more/
[ars]: https://arstechnica.com/gaming/2018/11/sony-using-open-source-emulator-for-playstation-classic-plug-and-play/
[tc]: https://techcrunch.com/2018/11/09/sonys-playstation-classic-uses-an-open-source-emulator-to-play-its-games/
[connectix]: https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html
[gamemasters]: https://static.case.law/f-supp-2d/87/cases/0976-01.json
[stevens]: https://www.wipo.int/wipolex/en/text/580968
[us6304971]: https://patents.google.com/patent/US6304971B1/en
[us5793376]: https://patents.google.com/patent/US5793376A/en
[us5850540]: https://patents.google.com/patent/US5850540A/en
[ep0715277]: https://patents.google.com/patent/EP0715277A2/en
[ep0715276]: https://patents.google.com/patent/EP0715276A2/en
[ep1280150]: https://patents.google.com/patent/EP1280150A2/en
[walker]: https://hitmen.c02.at/files/docs/psx/psx.pdf
[redump-lc]: https://web.archive.org/web/20260615204347/http://wiki.redump.org/index.php?title=LibCrypt
[ps1tests]: https://github.com/JaCzekanski/ps1-tests
[deb-mdf]: https://metadata.ftp-master.debian.org/changelogs//main/m/mednafen/unstable_copyright
[c-1000]: https://commons.wikimedia.org/wiki/File:Sony-PlayStation-SCPH-1000-Motherboard-Top.jpg
[c-5001]: https://commons.wikimedia.org/wiki/File:PSX-SCPH-5001-Motherboard.jpg
[sst]: https://github.com/SingleStepTests/r3000
[240p]: https://github.com/filipalac/240ptestsuite-ps1
[amidog-cpu]: https://psx.amidog.se/doku.php?id=psx:download:cpu
[amidog-gte]: https://psx.amidog.se/doku.php?id=psx:download:gte
[reg-2001]: https://www.theregister.com/2001/11/19/playstation_emulator_developer_bleem_folds/
[kotaku]: https://kotaku.com/vimms-roms-sega-sony-nintendo-dmca-removed-ios-delta-1851526609
[egw-ps1]: https://emulation.gametechwiki.com/index.php?title=PlayStation_emulators&oldid=152329
[egw-tests]: https://emulation.gametechwiki.com/index.php?title=PS1_Tests&oldid=139373
[w-vgs]: https://en.wikipedia.org/?oldid=1385919106
[w-bleem]: https://en.wikipedia.org/?oldid=1384928103
[w-pcsxr]: https://en.wikipedia.org/?oldid=1365273645
[w-epsxe]: https://en.wikipedia.org/?oldid=1370812565
[w-mdf]: https://en.wikipedia.org/?oldid=1320067215
[w-openemu]: https://en.wikipedia.org/?oldid=1361063123
[w-classic]: https://en.wikipedia.org/?oldid=1386316834
[w-psp]: https://en.wikipedia.org/?oldid=1386849836
[w-ps3m]: https://en.wikipedia.org/?oldid=1387117343
[w-vita]: https://en.wikipedia.org/?oldid=1386319237
[w-pocket]: https://en.wikipedia.org/?oldid=1386958093
[w-yaroze]: https://en.wikipedia.org/?oldid=1378707385
