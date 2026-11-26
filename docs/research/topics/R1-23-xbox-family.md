---
title: "Xbox, Xbox 360, and later: family survey"
roadmap_item: R1-23
status: draft
date: 2026-11-25
---

# Xbox, Xbox 360, and later: family survey

## Summary

This note asks which emulators matter for the original Xbox, the Xbox 360, the Xbox One, and the Xbox Series X and S,
what each one does, what legal exposure the family carries, and how hard the family is to emulate.

Twenty-four projects and services are compared in one table.
For the original Xbox, [xemu][xemu] is the mature low-level emulator and the parent of every port,
and [Cxbx-Reloaded][cxbxr] the long-standing high-level one; a 2026 wave of high-level forks,
[hakuX][hakux] and [xbased][xbased] among them, runs games with no Microsoft file at all.
For the Xbox 360, [Xenia][xenia] and its forks, [Xenia Canary][canary] above all, are the only emulators that run games;
Xenia, Canary, [Xenia Edge][edge], and [XeniOS][xenios] are open tier, and some Android forks are walled or closed.
No emulator of the Xbox One or Series hardware was found, only translation layers that need decrypted dumps;
Microsoft's own backward compatibility is the family's official emulator, now also on Windows.

The legal picture differs by console.
Original Xbox games are signed, not shown to be encrypted,
and xemu boots them only through a debug or modified Microsoft flash image,
because it has not implemented the retail image's checks.
Xbox 360 executables are encrypted, and Xenia is recalled to decrypt them with an embedded common key (from memory).
Xbox One and Series games stay encrypted when installed.
No notice, suit, or letter from Microsoft against an Xbox emulator was found,
beyond a wiki's uncited claim of threats to developers (lead);
its enforcement on record is a Store policy that bars emulators from every device family,
applied to sideloaded emulators on retail consoles in 2023.

For Rustalgia, the original Xbox is the family's practical first target:
it has the family's only test suites with a hardware oracle,
the [NV2A tests][pgraph] with golden captures from a console and the [kernel test suite][kts],
and a kernel interface that can be replaced.
The note recommends studies of xemu and Xenia, a high-level kernel written only from open prose,
those two suites as oracles, the Xbox 360 second, and the Xbox One and Series not taken up.

## Scope

- Question: which emulators are popular or respected for the Xbox, Xbox 360, Xbox One, and Xbox Series X and S,
  and for each, what are its status, licence, tier, techniques, and hosts; what legal exposure does the family carry;
  and how hard is it to emulate?
- Covered: every model in [R1-07][r107-home] and [R1-08][r108-xbox],
  the Sega Chihiro arcade board only where an Xbox emulator also runs it
  ([R1-24][surveys] holds arcade hardware), and Microsoft's backward compatibility as an official emulator.
  How the hardware works is in [R1-03][r103-cpu] and [R1-04][r104-x86]; the law in [R0-02][r002];
  the hubs in [R0-05][r005-xbox].
  This note cites those sections and does not repeat them.
- Researched on 2026-11-25 by three research agents, who read every quoted source as raw text;
  then one verification pass, by three fresh verifiers each on one slice, checked each claim against its source,
  and a fix pass fetched every disputed source again before applying or declining a finding (research log).
- Every emulator was read from prose and repository metadata only, whatever its tier.
  No emulator source file, issue, pull request, or emulator wiki page was opened beyond the [Xenia FAQ][xenia-faq],
  the [Canary FAQ][canary-faq], and the [roadmap][xenia-roadmap].
  No key, fuse, CPU-key, bootloader, MCPX ROM, BIOS, HDD-image, or dumping page was opened, and no firmware, disk image,
  game, or key was downloaded.
- Markers follow the [research guide][guide].
  Wikipedia is tertiary and named wherever a fact rests on it.
  The Emulation General wiki ([Xbox One page][egw-one]) is marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.
  Nothing here is legal advice.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, store installs, frontends), respect
  (tested accuracy claims, or use as a reference by other projects), or history (it shaped the family).
- Status is the archived flag, last push, and latest release from GitHub metadata, read on 2026-11-25,
  or the project's own site where the guard blocked a call: the releases of [xemu][xemu] and [XQEMU][xqemu-site],
  which are walled (research log).
- Each tier was checked against the [register][register], as a family survey requires
  ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  No licence on an existing line changed: xemu and XQEMU are still "GPL-2.0 as a whole",
  [nxdk][nxdk] still has no root licence,
  and [Xenia][xenia] and [Canary][canary] still carry the same BSD-3-Clause text.
  GitHub reports "NOASSERTION" for Xenia and Canary but BSD-3-Clause for the byte-identical texts of [Xenia Edge][edge]
  and [XeniOS][xenios]; the cause was not found (metadata; licence files compared).
- Precedents applied without re-deciding them: a repository with no licence is closed; a bare GPL-2.0 text is walled;
  a licence file beats a README; every high-level reimplementation of a kernel
  or system software is closed inside any repository
  ([ADR 0006, "Closed tier"][adr6-closed]),
  so the table gives the tier of the rest of each repository; and a wiki page that mentions leaked source, a leaked kit,
  or a leaked BIOS is closed.
- Process calls settled for this survey:
  - [Cxbx-Reloaded][cxbxr] is walled: its COPYING is the bare GPL-2.0 text,
    and its README says its NV2A and network code are "primarily the work of the XQEMU developers",
    which is walled code.
  - `Cxbx-Reloaded/XbSymbolDatabase` is closed as a whole and not linked:
    its signatures detect "symbols across XDK builds from reverse engineered retail titles"
    (Cxbx-Reloaded README), so they are derived from Microsoft's library code.
  - Microsoft's kit libraries that games link, such as Direct3D 8 and DirectSound, are game code,
    not system software under the [glossary][glossary]'s "A console's operating system and built-in programs";
    their high-level emulation keeps the repository's tier, and only the kernel, XAM, and dashboards are closed.
  - xemu's replacement dashboard and its pre-built disk image are closed as system software.
  - [hakuX][hakux] and [xbased][xbased] are walled:
    they descend from walled xemu code and keep one file under a GPL of no stated version, the gopher64 precedent;
    [XPSemu][xpsemu], built on the hakuX core, is walled with them.
  - A Wikipedia article that mentions the 2020 leak of the original Xbox's source is closed;
    one that mentions only leaked pre-release games, product documents, or prototypes is not.
    So "Xbox system software" and "Xbox (console)" are closed, and "Xbox 360", "Xbox One", "Xbox Series X and Series S",
    and the two technical-specifications articles stay open (raw wikitext, 2026-11-25).

### The emulators compared

Key: a release is given where its metadata or site could be read, else the last push;
"user files" means the MCPX boot ROM, flash image, and hard-disk image that the user supplies;
"HLE" means the project supplies its own kernel; Win, Mac, Lin, And, and iOS name hosts.

| Project | For | Tier | Licence | Release or push | CPU | Firmware | Hosts |
|---|---|---|---|---|---|---|---|
| xemu | Xbox | walled | GPL-2.0 as a whole | 0.8.139, 2026-10-21 | QEMU's TCG | user files | Win, Mac, Lin |
| XQEMU | Xbox | walled | GPL-2.0 as a whole | push 2026-11-22 | QEMU's TCG | user files | Win; Mac, Lin from source |
| [X1 BOX][x1box] | Xbox | walled | xemu's; hakuX GPL-3.0+ | 1.3.3, 2026-11-08 | xemu, hakuX | user files; HLE | And |
| [xemu-libretro][xemu-lr] | Xbox | walled | as xemu | push 2026-11-25 | xemu | user files | libretro |
| [StrikeBox][strikebox] | Xbox | open | BSD-2-Clause | push 2019-12-15 | virtualised | user MCPX, BIOS | Win, Lin |
| Cxbx-Reloaded | Xbox | walled | GPL-2.0 | CI-585c49a, 2026-04-19 | not stated | HLE | Win; Lin by Wine |
| [Cxbx][cxbx-sf] | Xbox | walled | GPLv2 per page | 2016-09-13 | not stated | HLE | Win |
| `Dxbx` | Xbox | closed | none | push 2019-03-21 | not stated | HLE | Win |
| Xeon | Xbox | closed | proprietary | 2003 (from memory) | not stated | not stated | Win |
| hakuX | Xbox | walled | GPL-3.0+ with parts | v1.3.0, 2026-10-31 | FEX-fork JIT | HLE | And |
| xbased | Xbox | walled | GPL-3.0+ with parts | v1.2.14, 2026-11-25 | from hakuX | HLE | Win, Lin |
| XPSemu | Xbox | walled | GPL-3.0 | v3.6, 2026-11-16 | native, trapped | HLE | jailbroken PS5 |
| Xenia | 360 | open | BSD-3-Clause | v1.0.2844, 2026-02-18 | JIT to x64 | HLE | Win |
| Xenia Canary | 360 | open | BSD-3-Clause | daily, 2026-11-24 | as Xenia | HLE | Win, Lin |
| Xenia Edge | 360 | open | BSD-3-Clause | daily, 2026-11-26 | x64, Arm64 | HLE; maker's xefu | Win, Lin, Mac |
| XeniOS | 360 | open | BSD-3-Clause | 2.3.5-12324 | JIT | HLE | iOS, Mac |
| [aX360e][ax360e] | 360 | walled | no root licence | Play, 2026-10-27 | Xenia's Arm64 | HLE | And |
| [XenDroid][xendroid] | 360 | walled | no root licence | 2026-08-14 | from Edge | HLE | And |
| `X360 Mobile` | 360 | closed | none; source withheld | v0.6.6, 2026-11-20 | from Edge, Canary | HLE | And |
| [Xenon][xenon] | 360 | walled | GPL-2.0 | push 2026-11-06 | low-level | boot ROM (inference) | Win, Lin |
| [XenonRecomp][xrecomp] | 360 | open | MIT | push 2025-08-04 | static recompiler | no runtime | its output's |
| [WinDurango][windurango] | One | open | LGPL-3.0 | push 2026-11-13 | not stated | console files, HLE | Win |
| `Utsuro` | One | closed | none | 0.1.0, 2026-11-01 | FEXCore | console userland | Mac; iOS untested |
| Microsoft's emulators | Xbox, 360 | — | maker's | 2006 to 2026 | translation | maker's | 360, One, Series, PC |

Sources by row: each project's README, licence file, site, store listing, or release metadata,
as its paragraph below cites; tiers from the [register][register] or this note's new lines.
GPL-2.0 means a GPL-2.0 text with neither "only" nor "or later" settled; a name in a code span is a closed source,
not linked.

### Original Xbox: low-level emulators

- xemu calls itself "a low-level, full-system emulator which emulates the actual hardware of the Xbox"
  ([xemu, "Required Files"][xemu-req]),
  built on QEMU and continuing XQEMU, which espes began in 2012; Matt Borgerson began xemu in 2020
  ([xemu, "About"][xemu-about]).
  Its repository has 4,321 stars and was pushed on 2026-11-23 (metadata); its site gives "Version 0.8.139
  (Oct 21, 2026)" ([xemu home page][xemu-home]).
  Its licence is the QEMU text, "GPL-2.0 as a whole" with files varying; Wikipedia says GPL-2.0-or-later
  ([Wikipedia, "Xemu (emulator)"][w-xemu]; tertiary), and the licence file prevails.
- The CPU runs through QEMU's TCG translator, named in its licence file;
  that TCG is a dynamic binary translator is from memory.
  Its libretro port offers a host-FPU option for x87 code that is "Faster but may have minor inaccuracies"
  ([libretro, "xemu"][lr-xemu]).
  Unimplemented paths stop the emulator: "xemu will assert, which forces execution to stop" ([xemu FAQ][xemu-faq]).
- Graphics run on OpenGL or Vulkan; an OpenGL 4.0 GPU is the minimum
  ([xemu, "About"][xemu-about]),
  and macOS uses OpenGL because MoltenVK lacks the geometry shaders its Vulkan renderer needs
  ([libretro, "xemu"][lr-xemu]).
  It scales rendering, takes snapshots, supports four controllers, System Link,
  and the Insignia replacement for Xbox Live, and has no surround sound yet
  ([xemu home page][xemu-home]; [FAQ][xemu-faq]).
- Its developer pages cover host, guest, and graphics debugging, the last with tools such as nv2a-trace, RenderDoc,
  and Nsight ([xemu, "Graphics Debugging"][xemu-gfx]),
  and ask for test cases "as hardware tests in the PGRAPH test suite" ([xemu developer guide][xemu-dev]).
- Firmware: it needs "MCPX Boot ROM Image", "Flash ROM Image (BIOS)", and "Hard Disk Image",
  and says "The only legal way to acquire these files is to dump them from your real, physical Xbox"
  ([xemu, "Required Files"][xemu-req]).
  The FAQ asks for dumps from a version 1.0 console ([xemu FAQ][xemu-faq]).
  The next section's legal findings cover why it needs a debug or modified flash image.
- The hard-disk image is offered pre-built, "free of any copyrighted content", holding xemu-dashboard, an open dashboard
  ([xemu, "Required Files"][xemu-req]; [xemu, "Dashboard"][xemu-dash]),
  because "we can't legally ship the original Xbox dashboard" ([xemu FAQ][xemu-faq]).
  The dashboard's repository, `xemu-project/xemu-dashboard`, and the image's, `xemu-project/xemu-hdd-image`,
  are closed as system software and not linked.
- Discs must be "xiso" images ([xemu, "Disc Images"][xemu-disc]); that page links a disc-dumping guide,
  and a developer page describes disassembling the boot ROM and kernel; neither was followed (observed).
- Hosts: Windows on x86-64 and Arm64, macOS, and Linux as AppImage, Flatpak, and a PPA
  ([xemu download page][xemu-dl]); "There are currently no plans for a mobile port" ([xemu FAQ][xemu-faq]).
- [XQEMU][xqemu-site], 671 stars and still pushed (metadata),
  was the "low-level system emulator for the original Xbox and Sega Chihiro" from which xemu forked,
  and now sends users to xemu, "which makes different accuracy tradeoffs but has much better performance as-is" (site).
  Its site names Windows, macOS, and Linux, offers a Windows build, and leaves the others to build from source;
  its getting-started page lists Cromwell, a replacement BIOS and so closed, among usable images
  (observed; its address is not given, so it has no register line).
- [StrikeBox][strikebox], BSD-2-Clause and open, is "A fork of OpenXBOX by mborgerson, with a focus on LLE emulation":
  it runs the user's MCPX and BIOS dumps on a host virtualisation platform on Windows or Linux,
  with kernel debugging over a virtual serial port, and is dormant since 2019 (README; metadata).
  Its README calls other implementations "incomplete, incorrect or straight up copies of illegally obtained code",
  naming none.
  `mborgerson/OpenXBOX`, archived and without a licence, is closed; its README points to xemu.

### Original Xbox: high-level emulators

- Cxbx-Reloaded "is an emulator for running Microsoft Xbox
  (and eventually, Chihiro)
  games on Microsoft Windows and Wine"
  ([Cxbx-Reloaded README][cxbxr]);
  it needs Windows 7 or later on x64, or Wine on Linux, and Direct3D 9 with shader model 2 and 3,
  and has no stable builds (README).
  The 2016 repository, with 2,387 stars, is now named Cxbx-Reloaded-legacy,
  and a new one took the old name on 2026-04-19 (metadata; the reason was not found).
- Its site gives "Latest Build: CI-585c49a Apr 19, 2026", after 341 builds since June 2018
  ([Cxbx-Reloaded site][cxbxr-site]), so it is maintained at a low rate (inference).
- Its README says "the majority of Cxbx-R is our own work
  (Kernel, HLE, etc)",
  with the NV2A and NVNet code from XQEMU,
  and that pull requests "containing code derived from XQEMU will _not_ be approved until an agreement is reached".
  So it reimplements the kernel, recognises Microsoft's library code in each game through XbSymbolDatabase,
  and draws through XQEMU's low-level NV2A (inference from the README's credits).
  It credits the Xbox Kernel Test Suite for "accurate tests on hardware" to compare its kernel against (README).
  The README states no BIOS requirement.
- Its compatibility list, of 1,032 titles, rates 166 (16.09%) playable "to 100% completion with no major issues",
  510 in game, 273 booting, and 83 doing nothing
  ([Cxbx-Reloaded site][cxbxr-site]); reports need Discord sign-in and an administrator's approval (same).
- The original Cxbx called itself an Xbox emulator for Windows NT on
  which "Turok Evolution is currently the only playable retail game", under the category GPLv2,
  registered in 2002 and last updated in 2016
  ([Cxbx on SourceForge][cxbx-sf]);
  the Emulation General wiki says it began as an ahead-of-time compiler for Xbox executables
  (`Xbox_emulators` page; lead).
  [cxbx-shogun][shogun], a branch of the original source, has a bare GPL-2.0 licence and is walled
  (README; licence file).
- Dxbx "started out as a translation of Cxbx, world's first Xbox emulator" into Delphi, has "it's own kernel",
  and is "permanently dormant" (`PatrickvL/Dxbx` README; [Dxbx on SourceForge][dxbx-sf], last updated 2012-10-29).
  Neither shows a licence, so it is closed: a translation of GPL-2.0 code that states no licence is unresolved.
- Xeon, closed source for Windows, was the first emulator to run Halo, and only that game
  (Emulation General; lead); that it came out in 2003 and was soon abandoned is from memory.
  The wiki's download link for it points to a site that may host BIOS files, which was not opened
  (`emulator-zone.com`, closed here as a precaution).
- [hakuX][hakux], 979 stars, release v1.3.0 of 31 October 2026, says its "core runs the game's x86 code on a JIT
  (a FEX fork)
  under a reimplementation of the Xbox kernel", draws by decoding the game's push buffer into Vulkan,
  and runs the MCPX audio unit "ported from xemu"; "No BIOS, MCPX ROM or hard disk image is needed" (README).
  It warns: "If you paid for hakuX in any way, shape or form, you were scammed" (README).
  Its licence file lists xemu's audio files
  and one file under an unversioned GPL beside its own GPL-3.0-or-later code (observed).
- [xbased][xbased], 333 stars, created on 2026-11-03, with 136 releases by 2026-11-25
  (release metadata),
  "runs original Xbox games on a PC with a reimplemented Xbox kernel,
  a high-level NV2A renderer on Vulkan and an accurate MCPX audio core", started from hakuX,
  on Windows 10 or 11 and Linux AppImage (README).
  It imports xemu saves "re-signed so games accept them", and its README already names 1.2.15 downloads (README).
  Its own data lists 337 games, 325 of them playable, "reported by the developer and the community"
  ([xbased site][xbased-site]; [compatibility data][xbased-compat], updated 2026-11-22).
- [XPSemu][xpsemu], 220 stars, is "an original Xbox emulator for the PlayStation 5,
  running as a native app" that lets "the game's code run directly on the PS5's CPU"
  and takes the rest from the hakuX core (README, "Alpha 3.6").
  It needs a PS5 running the kstuff exploit and a mount tool, and installs as homebrew (README);
  the README links those jailbreak tools, which were not followed.

### Sega Chihiro in Xbox emulators

- [XPSemu][xpsemu] lists eight Chihiro games as "Playable now",
  with no Chihiro BIOS or media-board flash but three base-board files and, for CHD and GD-ROM images,
  "the game's security key as a .pic or .data file"; it credits MAME for the GD-ROM decryption (README).
  Those per-game keys make it a key hazard for any study.
- [X1 BOX][x1box] "also runs Sega Chihiro arcade games" (README); [xemu-libretro][xemu-lr] asks for the Chihiro BIOS,
  the media board's flash, and the boards' EEPROMs by MAME's file names (README);
  [XQEMU][xqemu-site] names Chihiro as a target (site); and Cxbx-Reloaded aims to run it "eventually" (above).
- MAME's own Chihiro driver is marked as not working
  (Emulation General; lead), so the arcade board itself belongs to [R1-24][surveys].

### Ports, forks, and frontends for the original Xbox

- [X1 BOX][x1box], an xemu fork, is "an original Xbox emulator for Android" with two cores:
  "xemu emulates the full console" and "hakuX is a faster core that runs fewer games";
  the xemu core needs the user's three files, and "The hakuX core does not need them" (README).
  That core, in `android/hakux/core`, "has its own built-in system software" (README), so that path is closed.
  Its licence file is xemu's, its README calls the xemu parts "mostly GNU GPL v2" and the hakuX core GPL-3.0-or-later,
  and its Play listing shows "1K+ Downloads" at "$7.99", updated on 4 November 2026
  ([X1 BOX on Google Play][x1box-play]); a free build is on GitHub (release metadata).
- The [libretro core][lr-xemu] is "A port of xemu ...
  It is experimental", built for Linux, Windows, macOS, and Android, without save states, and asks for the boot ROM,
  a modified BIOS that it names by file name, and a hard-disk image.
  Its source, [xemu-libretro][xemu-lr],
  is "currently on xemu 0.8.136-53" and writes xemu-dashboard's image when no disk is given (README),
  which carries that closed dashboard into the core. libretro's documentation also lists a hakuX core, "hakuX-lr",
  whose page was not read (observed in its navigation).
- Other xemu forks, each walled: [xemu-ps4][xemu-ps4] for a jailbroken PS4,
  which "boots the BIOS and runs Halo 2 to its title screen" at about 1 fps, from the user's boot ROM
  and flash image (README); [X-OG Mobile][xog], an "Experimental Android port of xemu"; and [xemu-uwp][xemu-uwp],
  the libretro core's parent, whose README is upstream's (metadata; READMEs).
  The Emulation General wiki lists xemu as recommended (`Xbox_emulators` page; lead).

### Xbox 360: Xenia and its forks

- [Xenia][xenia] is the "Xbox 360 Emulator Research Project", begun in 2013, with 9,862 stars (metadata).
  Its README says "All information is obtained via reverse engineering of legally purchased devices and games
  and information made public on the internet".
  Its builds go to a separate repository, `xenia-project/release-builds-windows`, which has no licence and so is closed;
  its last release is v1.0.2844-master of 18 February 2026
  (release metadata), and Xenia's site calls the branch "master (inactive)" ([Xenia download page][xenia-dl]).
- Its documents describe a JIT that "translates Xenon PowerPC code into native code runnable on the host computer"
  through an intermediate form, with an x64 back end only ([Xenia, `docs/cpu.md`][xenia-cpu]), and a kernel in which
  "Xenia implements all kernel APIs as native functions under the host", reimplementing xboxkrnl and XAM
  ([Xenia, `docs/kernel.md`][xenia-kernel]).
  That kernel and XAM are closed, at the path the document names.
- Its GPU work, by its developer's account, rests on public sources: Qualcomm's Code Aurora header release,
  the Freedreno driver, XNA Game Studio 3.1, conference talks, and reverse engineering of games, consoles,
  and Adreno 2xx devices; "contributions based on information obtained from the XDK are not allowed"
  ([Xenia, "Leaving No Pixel Behind"][xenia-2021]).
  The same article describes a Direct3D 12 back end built on rasterizer-ordered views, with 3x3 resolution scaling,
  and 1,041 of 1,404 titles playable or in game, 221 near-flawless, in April 2021;
  a 2022 post called the Vulkan back end "unmaintained" ([Xenia, "Presenting the Presentation Update"][xenia-2022]).
- Its roadmap says that output matching a console's exactly is not possible with its approach
  ([Xenia roadmap][xenia-roadmap]).
  Its FAQ says it runs on Windows, on Linux only under Wine, not on macOS, needs AVX, has weak audio,
  "will never connect to official Xbox Live servers", and "cannot run original Xbox games" ([Xenia FAQ][xenia-faq]).
  The FAQ points to a game-dumping guide in its Quickstart pages and to a container-dumping tool; neither was followed,
  and the Quickstart pages are closed here.
- [Xenia Canary][canary], "an experimental fork", is pushed and released several times a day,
  with Windows and Linux builds and 2,807 stars (metadata; README).
  Its contributing guide is the family's fullest policy:
  every fact derives from "reverse engineering legally-owned games, hardware, and tools made public by Microsoft",
  "The official Microsoft Xbox Development Kits (XDKs) are not to be used for any information added to the project",
  comments say how each fact was found, and game-specific conditionals are banned
  ([Canary contributing guide][canary-contrib]).
  Its FAQ adds that a stock console can dump games ([Canary FAQ][canary-faq]).
- [Xenia Edge][edge] is "yet another experimental fork", based on Canary,
  that claims "all known games at least get to gameplay" on "RTX 2xxx class and above" hardware, builds for Windows,
  Linux, and macOS, and refuses donations (README; a project claim with no tracker).
  It runs original Xbox games "in the same manner they are on a real console, more precisely an RGH/JTAG console,
  through xefu", Microsoft's own emulator,
  and points users to "patched" xefu builds that "have all been community patched to run other games" (README):
  third-party modified copies of Microsoft's binaries, a firmware-copy risk
  ([R0-02, "Firmware and back-up copies"][r002-fw]; inference).
  It also installs Microsoft's system files for Xbox Live Indie Games (README), and links a modding wiki for xefu,
  not followed.
- [XeniOS][xenios] is an "experimental Apple-focused fork of Xenia, currently based on Xenia Edge" (README).
  It requires iOS or iPadOS 26 and installs through SideStore with JIT enabled
  ([XeniOS, iOS guide][xenios-ios]),
  or macOS 15.0 or later ([XeniOS, Mac guide][xenios-mac]); its site is [xenios.jp][xenios-site].
  Its list counts 436 games, 167 (38%) playable ([XeniOS compatibility][xenios-compat]).
  Its FAQ page holds a game-dumping how-to, so it is closed (`xenios.jp/faq`).
- Ports of Canary: the [Netplay fork][netplay] adds online play through self-hostable "Xenia Web Services";
  [Canary UWP][uwp] runs on Xbox Developer Mode and "is not associated with the Xenia developers";
  and [xenia-android][xa] has ended in favour of [Xeo][xeo],
  a "production-ready Android port of Xenia Canary" for 64-bit Android, whose BSD licence adds its own author
  (READMEs; licence files); both repositories are archived, Xeo's since its last push of 2026-08-13 (metadata).
  Xenia's site warns that the Xbox port "is not made by or endorsed by the Xenia team"
  ([Xenia download page][xenia-dl]).
- [aX360e][ax360e] is "ported based on the `arm64-backend` branch of Xenia" with "most of the code from the xenia-canary
  project", sold at $6.99 with "1K+" downloads ([paid listing][ax360e-paid]) beside a free build with ads and "500K+",
  and says "An open-source plan is in place" ([free listing][ax360e-play]); its repository has no root licence and sends
  readers to per-file headers, so it is walled, like its author's aPS3e ([aX360e README][ax360e]; [site][ax360e-site]).
- [XenDroid][xendroid] began from aX360e and was "a complete rebase" on Edge, needs a recent Snapdragon,
  and says "If you paid for this, then you got scammed" (README); like aX360e it has no root licence.
- `Ashnar2602/X360-Mobile---OFFICIAL` publishes only builds:
  "The active emulator source tree is maintained separately and is not published here", from Edge
  and Canary code (README), so it is closed and not linked.
- libretro carries Xenia Edge as a core: "A port of Xenia Edge, an Xbox 360 emulator, to libretro", "experimental",
  for Linux, Windows, Apple-silicon macOS, and Android, under BSD, and it "does not need any BIOS or firmware"
  ([libretro, "Xenia Edge"][lr-edge]).

### Xbox 360: other approaches

- [Xenon][xenon] is an "Xbox 360 Low Level Emulator" on which "XeLL (Xenon Linux Loader), Linux (ppc64-xenon), and LK
  (Little Kernel, lk-ppc)
  are the only working programs"; its screenshots show the first boot loader running (README, observed).
  A low-level 360 needs the user's boot ROM image and, by inference, the console's NAND and its keys,
  so it is a key hazard; its site and setup pages were not opened.
  Its licence is the bare GPL-2.0 text, and it credits RPCS3, which is walled, for its PowerPC work (README).
- [XenonRecomp][xrecomp], MIT, "converts Xbox 360 executables into C++ code,
  which can then be recompiled for any platform", and "does not provide a runtime implementation" (README).
  It credits Xenia's PowerPC translator, runs Xenia's instruction tests,
  and keeps FPU denormals while VMX flushes them (README).
  Its output is built from a game's executable, so ports made with it are out of scope; its first, Unleashed Recompiled,
  is not registered and was not opened.

### Xbox One and Series

- No emulator of the Xbox One or Series hardware was found
  (searches of GitHub and the web, and the Emulation General wiki's [Xbox One page][egw-one], 2026-11-25; lead).
- [WinDurango][windurango], LGPL-3.0 and open,
  is "an Xbox One Translation Layer" that runs games of the console's game partition on Windows through UWP;
  it "has implemented most of the essential Xbox WinRT interfaces, KernelX and D3D11.X", runs Sonic Mania,
  Minecraft's Xbox One edition, and LIMBO, and needs DLLs copied from the console's own system image (README).
  Its reimplemented kernel and WinRT interfaces are closed as system software.
  The Emulation General wiki says it was formerly under GPL-3.0
  ([Xbox One page][egw-one]; lead), which would leave it open tier either way.
- `Leviidev/Utsuro`, with no licence and so closed,
  is a layer for macOS that "does not emulate the console's hardware"
  and runs "the console's own Windows-derived userland" under FEXCore, from the user's "decrypted dump" (README).
- The same wiki names other projects, XWine1, Azimuth, Mezcal, GenERA, and an AI-assisted "Scorpio Emu",
  none with public source read here ([Xbox One page][egw-one]; lead).
- The `xboxoneresearch` organisation, which [R1-04][r104-xos] deferred to this note, lists a kernel exploit,
  a flash dumper, code-execution tools for compromised consoles, and an XVD tool (organisation metadata).
  It is closed as a whole as a precaution and not linked.
  A decrypted Xbox One dump comes from such an exploit (from memory).

### Microsoft's own emulators

- Microsoft's Xbox emulation on the Xbox 360 ran translated code:
  its team blog describes "the translated native code and emulator runtime
  (PPC code in another address space)"
  and bugs from a small floating-point error and from "the emulator missing a cryptographic key"
  ([Microsoft Xbox team blog, "On Backwards Compatibility"][ms-2006], 2006).
  The same post says "Microsoft doesn't own the intellectual property in Xbox:
  it's owned by various other companies including Intel".
- The Xbox One's emulator of the Xbox 360 was announced in June 2015 with "few restrictions on what titles we can
  support" and no work by publishers, but no titles that need Kinect or other 360 accessories
  ([Xbox Wire, 2015-06-16][wire-2015]); over 100 titles launched that November ([Xbox Wire, 2015-08-05][wire-2015b]).
  In 2017 original Xbox games followed,
  and "the Xbox 360 emulator" gained the "Heutchy Method" for higher resolution "all without touching the game code"
  ([Xbox Wire, 2017-10-23][wire-2017]).
- Microsoft told Digital Foundry: "we have a VGPU - or an Xbox 360 GPU that we've recompiled into x86 -
  and we run the entire 360 OS stack";
  each game is recompiled with "Enlightenments" marking hardware writes and entry points,
  under a scheduler held to "the 360 timing", with 360 texture formats and audio in the Xbox One's silicon
  ([Digital Foundry, 2017-12-09][df-2017]; secondary, quoting Microsoft staff).
- New titles ended in 2021: "we have reached the limit of our ability to bring new games to the catalog from the past
  due to licensing, legal and technical constraints" ([Xbox Wire, 2021-11-15][wire-2021]).
  On the Series, Microsoft cites "more than 500,000 hours of testing", FPS Boost and Auto HDR,
  and a disc that must stay in the drive ([Xbox backward compatibility page][xbox-bc]).
- On Windows, "XBOX Backward Compatibility on PC launches in early release,
  starting with four classic original XBOX games", with upscaling up to four times, through the Xbox PC app,
  on Windows 11 ([Xbox Wire, 2026-07-22][wire-2026]); a later post added 21 games,
  "bringing the XBOX Backward Compatibility on PC library to 25 games" ([Xbox Wire, 2026-11-12][wire-2026b]).
  The July post does not use the word "emulation" (observed by a search of its text).
  No Xbox 360 games on Windows have been announced;
  a hidden 360 emulator reported in the PC package rests on others' analysis of Microsoft's binaries
  (a Wccftech report seen only as a search result; not relied on).
- Microsoft's Phil Spencer said in 2021 that his "hope ... is as an industry we'd work on legal emulation
  that allowed modern hardware to run any (within reason) older executable allowing someone to play any game"
  ([VGC, 2021-11-17][vgc-2021]; secondary, quoting Axios).

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Encryption differs by console.
  The original Xbox runs only signed executables and has a locked drive
  ([R1-07, "Home consoles"][r107-home]),
  the hard disk being locked by the console
  ([R1-03, memory, "Xbox and Xbox 360"][r103-mem]),
  and no page read says its executables are encrypted
  ([R1-03, "Discs and what arrives as a plain image"][r103-discs]; inference, partly from silence).
  Xbox 360 executables are encrypted and the hypervisor handles keys
  ([R1-03, "Boot chains and security processors"][r103-boot]),
  and the CPU holds eFuse one-time-programmable memory ([R1-07][r107-home]), which holds per-console keys (from memory).
  Xbox One and Series installs "remain encrypted" ([R1-04][r104-xos]).
  So [R0-02 option 1][r002-o1] fits the original Xbox in part and the later consoles not at all.
- The original Xbox's lock-out is a signature check, and xemu has not implemented it:
  "Due to key DRM functions being unimplemented,
  xemu is currently unable to boot games when using an unmodified retail BIOS.
  You must use either a debug BIOS or a modded retail BIOS that can boot unsigned software"
  ([xemu, "Required Files"][xemu-req]).
  Its FAQ, XQEMU's site, and the libretro page each name one modified retail image.
  So the working low-level path is a debug image, which Microsoft did not release to the public
  (from memory),
  or a third party's modified copy of Microsoft firmware: a firmware-copy risk and a circumvention-shaped input
  ([R0-02, "Firmware and back-up copies"][r002-fw]; [R0-02, "Console checks, and use after circumvention"][r002-checks];
  inference).
- The high-level kernels avoid every firmware file ([R0-02 option 5][r002-o5]).
  But the Xbox kernel exports key values that games use to sign saves
  (from memory),
  and xbased re-signs imported saves "so games accept them" (README),
  so these kernels are inferred to hold Microsoft key material (inference). [hakuX][hakux], [xbased][xbased],
  and [XPSemu][xpsemu] are recorded as key hazards for any study, their kernel paths are closed where known,
  and a key file's path is closed as soon as it is known.
- Xenia decrypts retail XEX files with the console-wide key, embedded in its source
  (from memory; not checked, because that would mean opening code).
  If so, Xenia and every fork follow [R0-02 option 3][r002-o3]'s second variant, an embedded published key,
  with the risk R0-02 records for Dolphin's Wii key, and the file is closed here as a precaution.
  No page read asks a Xenia user for a key, and libretro's Xenia Edge core "does not need any BIOS or firmware"
  ([libretro, "Xenia Edge"][lr-edge]).
- Xenia's FAQ answers "Why is my game in trial/demo mode?" with a link to an option for running games as fully activated
  ([Xenia FAQ][xenia-faq]; observed from the link's anchor), a licence-check bypass for trial titles.
- The Xbox One translation layers need the console's system image and decrypted games
  ([R0-02 option 4][r002-o4] and option 3), and the dump starts with a circumvention by the user (inference).
- Microsoft's terms: the Xbox Software License Terms bar copying or reverse engineering the console software
  ([R0-02, "Makers' system software and licence terms"][r002-terms]).
  Its Store Policies, version 7.20, effective 22 October 2026,
  say "10.13.10 Products that emulate a game system or game platform are not allowed on any device family"
  ([Microsoft Store Policies][store]);
  the clause dates from version 7.3 of 29 March 2017 ([change history][store-hist]).
- In April 2023 sideloaded emulators stopped launching on retail Xbox consoles;
  Microsoft told IGN its actions were "Per 10.13.10"
  ([GamesRadar, 2023-04-06][gr-2023]; secondary, quoting a statement given to IGN).
  Developer Mode still runs them, but "you cannot play retail games or run retail apps" there
  ([R1-08, "Xbox family"][r108-xbox]).
- In 2008 Microsoft banned modified Xbox 360 consoles from Xbox Live,
  saying modification "will void your warranty and result in a ban" ([Xbox Wire, 2008-11-12][wire-2008]).
- Takedowns: GitHub's archive at commit `cd00b140` holds 56 notices whose file names name Microsoft, Xbox,
  or 343 Industries, and none names an emulator or Xbox console tool
  (research log: each read, and grepped for xenia, xemu, cxbx, and emulat; the archive itself was not searched).
  Microsoft pleads § 1201 there against DRM tools, as in [2014-07-28][dmca-2014] against Xbox Music DRM code,
  and in 2026 against repositories of leaked Minecraft console source,
  where GitHub found no valid circumvention claim but other valid copyright claims ([2026-06-03][dmca-2026]).
  The Emulation General wiki says, in an uncited footnote, that many developers "received legal threats from Microsoft"
  (`Xbox_emulators` page, closed; lead).
  That extends [R0-02, "What the record shows"][r002-record].
- Criminal cases touch modding, not emulation.
  The first test of § 1201 for consoles, against a man who modified Xbox 360 drives, was dismissed mid-trial in 2010,
  after the judge had called fair use irrelevant to it ([The Register, 2010-12-03][reg-2010]; secondary).
  In 2014 four members of a group were charged with stealing "source code,
  technical specifications and related information for Microsoft's then-unreleased Xbox One gaming console"
  ([US Department of Justice, 2014-09-30][doj]).
  In England, [R v Gilham][gilham] concerned modchips that included "the Xecuter for use with the Microsoft Xbox",
  a case [R0-02, "The United Kingdom"][r002-uk] records without naming the console.
- Leaked material is the family's chief hazard for a clean room.
  The original Xbox's kernel and system source leaked in 2020
  (Wikipedia, "Xbox system software", now closed; lead),
  Xbox One material was allegedly stolen between 2011 and 2014, by the indictment above,
  and the Emulation General wiki says homebrew "typically relied on stolen XDKs" (`Xbox_emulators` page, closed; lead).
  [R0-05][r005-xbox] records that XboxDevWiki states no policy on leaked material;
  Free60's FAQ now refuses contributions from "official documentation or official developer software/hardware"
  ([Free60 FAQ][free60-faq]).
- Money and names: X1 BOX sells xemu-based code at $7.99, aX360e sells a build at $6.99, Xenia links a Patreon,
  and Xenon a Ko-fi ([R0-02 option 8][r002-o8]); scam warnings come from hakuX, XenDroid, and Xenia's site,
  and a fake "Xbox One emulator" in 2013 sent users to "complete an offer"
  ([Malwarebytes, 2013-06-26][mwb]; secondary).
  xemu disclaims affiliation with Microsoft in its FAQ footer, and many names use "Xbox" or "360"
  ([R0-02 option 14][r002-o14]).
- Patents: a title search of Google Patents for Microsoft's emulation and backward-compatibility filings found 104,
  among them US8711159B2, "VGPU: a real time GPU emulator", and US10809988B2,
  "Processor emulation using multiple translations"
  ([Google Patents][gp-1], [second][gp-2]; research log, since Google Patents refused scripts on the verification pass);
  claims were not read and terms not computed
  ([R0-02 option 11][r002-o11]), which fills the gap [R0-02, "Patents on emulation"][r002-pat] left for Microsoft.
- Boot logos: the original Xbox's start-up animation is drawn by its flash kernel and dashboard, not the game
  (from memory),
  xemu's libretro port can skip it, and no prose read mentions a logo check on any of these consoles,
  so [R0-02 option 16][r002-o16] reduces to drawing none (inference).

### How hard the family is to emulate

- The hardware is in [R1-03][r103-cpu] and [R1-04][r104-x86]; this survey adds what the emulators' prose shows.
- Original Xbox: guest x86 runs through a translator (xemu), host virtualisation (StrikeBox),
  or a JIT under a high-level kernel (hakuX), and on an x86 host natively with trapping (XPSemu).
  The NV2A's register combiners ([R1-03, "Xbox: NV2A"][r103-nv2a]) and the MCPX's two audio DSPs
  ([R1-03, audio, "Xbox and Xbox 360"][r103-audio])
  look the hardest parts (inference):
  xemu still fails NV2A tests on every host published (below) and has no surround sound,
  and hakuX ports xemu's audio unit instead of writing one.
  Games link Microsoft's libraries, so high-level emulation must recognise library code in each game,
  as Cxbx-Reloaded's symbol database does, or stop at the kernel's exports, as hakuX does
  ([R1-03][r103-sys]; inference).
- Xbox 360: three in-order PowerPC cores with VMX128, six hardware threads, and an L2 cache the GPU reads directly,
  which IBM describes as letting a core feed generated geometry to the GPU
  ([IBM, "Application-customized CPU design"][ibm], 2005);
  so CPU-to-GPU coherence through L2 has to be modelled (inference).
  Xenos draws only to 10 MiB of eDRAM, which must be resolved
  ([R1-03, "Xbox 360: Xenos"][r103-xenos]),
  and Xenia's best results needed Direct3D 12's ordered pixel access; its Vulkan path lags (above).
- Microsoft itself needed silicon support, its own scheduler, and per-title recompilation (above).
- Xbox One and Series: the guest is x86-64 on AMD GCN and RDNA graphics ([R1-04][r104-amd]),
  which the PS4 and PS5 share, but no project runs a game without the console's own system files and a decrypted dump
  (findings above), and the Game OS's interface beyond the public GDK documents is not public ([R1-04][r104-xos]).

### Tests and published results

| Suite | Tier | Oracle | Emulator results |
|---|---|---|---|
| [nxdk_pgraph_tests][pgraph] | open | golden captures from an Xbox 1.0 | xemu, 33 versions, 0.7.98 to 0.8.139 |
| [nxdk_low_level_nv2a_tests][llnv2a] | open | not stated; runs on xemu or a debug-enabled Xbox | none found |
| [xbox_kernel_test_suite][kts] | open | runs on a console | Cxbx-Reloaded compares against it; none read |
| Xenia's PowerPC tests | open | not stated | Xenia; XenonRecomp runs them |
| Compatibility lists | various | user playthroughs | xemu, Cxbx-Reloaded, xbased, Canary, XeniOS |

- Sources: each README; tiers from the [register][register] and this note's new lines.
- nxdk_pgraph_tests, MIT, holds "Various tests for nv2a rendering" (README),
  described as "Tests to verify xemu handling of various pushbuffer commands" (metadata), built on a modified nxdk.
  Its [golden results][golden], CC0-1.0, are "Output of abaire/nxdk_pgraph_tests on XBOX 1.0 hardware",
  about 111 suites, with a caution that web display may not match a console's visible output for alpha (README).
- xemu's [published runs][xemu-pgraph] compare selected versions with those captures, on several hosts:
  for 0.8.139 on Linux's software renderer, Vulkan shows "Differences from Xbox_Hardware:
  1918" with 19 failed tests and one flaky, and OpenGL 1,912 with 19 and one;
  the failures include unimplemented bump-map texture formats.
  Failures are not confined to the software renderer: for 0.8.136, an RTX 4090 failed 78 tests on Vulkan and on OpenGL,
  where the software renderer failed 59 and 52, though the GPU's OpenGL run showed fewer differences, 1,584 to 1,765.
  Older runs used GTX 1070 and Apple M3 GPUs, later ones RTX 4090, AMD, and Apple M5 GPUs,
  and 0.8.137 to 0.8.139 have software-renderer runs only.
  The pages give no total count of test images.
- The kernel suite, GPL-3.0, is "a tool for testing the xbox kernel APIs on the hardware to verify their workings",
  built with nxdk (README); its list of kernels tested is on a wiki page the guard blocked, so no result was read.
- nxdk, which builds all three, stays walled, and its README says it bundles NVIDIA's Cg compiler, a proprietary tool
  (from memory),
  and a shader tool based on NVIDIA's SDK 9.52, giving neither's licence
  ([nxdk README][nxdk]), so a test binary may carry those parts and only results are used (inference).
- Game lists: xemu's data counts 1,024 titles, 78 perfect and 835 playable
  ([xemu compatibility data][xemu-compat]);
  reporters hold a role on its Discord, and "Perfect" means completed with an experience matching hardware
  ([xemu, "Testing"][xemu-test]).
  Cxbx-Reloaded's, xbased's, XeniOS's, and Xenia's 2021 counts are above; Canary's tracker has 1,140 open issues,
  one per game, each "state-playable" needing a full playthrough with screenshots ([Canary tracker][compat]).
- No suite with a console oracle was found for the Xbox 360, One, or Series
  (the register, [R0-05][r005-tests], and GitHub searches for Xbox 360 hardware tests, 2026-11-25),
  consistent with [R1-04, "Tests and sources"][r104-tests].

## Options and trade-offs

The options answer four separate questions, and the recommendation takes one answer to each.

### Which emulators the roadmap studies

- **What:** the [roadmap][studies] has no study for this family; add a study of [xemu][xemu], of [Xenia][xenia],
  of both, or of a high-level original Xbox project such as [Cxbx-Reloaded][cxbxr] or [hakuX][hakux].
- **Costs:** xemu is walled, so its code needs a reader session; Xenia is open,
  but its kernel is closed and its decryption file a key hazard
  (from memory);
  the high-level Xbox projects are walled and their kernels closed,
  and hakuX's kernel is inferred to hold Microsoft key material (inference).
- **Gains:** xemu is the only original Xbox emulator with published comparisons against hardware captures;
  Xenia and its forks are the only Xbox 360 emulators that run games, and Xenia is open tier,
  with a documented ban on Microsoft's kit; Cxbx-Reloaded shows library recognition, and hakuX a kernel boundary on Arm.
- **Used by:** the roadmap's practice for other families, such as [R1-53][studies] for Dolphin.

### Which oracles the family's cores are tested against

- **What:** the [NV2A golden captures][golden] and the [kernel suite][kts] for the original Xbox;
  Xenia's PowerPC tests for the 360; new homebrew tests run on consoles; or game lists.
- **Costs:** a new console run needs a console that runs homebrew, which for the Xbox means a modified one
  (from memory);
  the PowerPC tests' oracle is not stated; the kernel suite's published results, a wiki list, were not read
  (guard block); game lists say nothing about why a game fails.
- **Gains:** the NV2A captures are hardware results under CC0, published per suite, and xemu's runs give a baseline;
  the kernel suite tests the boundary a high-level kernel replaces.
- **Used by:** xemu (NV2A captures); Cxbx-Reloaded (kernel suite); [XenonRecomp][xrecomp] (Xenia's tests).

### How firmware, keys, and encrypted input are handled

- **What:** a high-level kernel with no Microsoft file; the user's MCPX, flash, and disk dumps, as xemu takes;
  for the 360, only XEX files the user has decrypted, or an embedded key, as Xenia is recalled to use (from memory).
- **Costs:** a high-level kernel must be written from open prose only, given the 2020 leak, and must sign saves somehow;
  the dump route works only with debug or modified images today; decrypted input presumes the user's own decryption;
  an embedded key carries the risk [R0-02 option 3][r002-o3] records.
- **Gains:** a high-level kernel needs nothing from Microsoft and suits the clean kernel boundary
  ([R1-03, option 1][r103-o1]);
  user dumps reproduce the console exactly; decrypted input keeps every key out of Rustalgia.
- **Used by:** Cxbx-Reloaded, hakuX, and [xbased][xbased] (high-level); xemu and [StrikeBox][strikebox] (dumps); Xenia
  (embedded key, from memory).

### How far the family is pursued

- **What:** the original Xbox first and the 360 later; the 360 first; or the Xbox One and Series as well.
- **Costs:** the original Xbox needs an x86 translator, NV2A combiner precision, and the APU's DSPs;
  the 360 needs a PowerPC and VMX128 translator, eDRAM, and encrypted input, with no hardware oracle;
  the One and Series need decrypted dumps, the console's system files, and a circumvention by the user,
  and Microsoft's policy bars emulators from its stores.
- **Gains:** the original Xbox has hardware-oracle tests, an exportable kernel boundary,
  and executables not shown to be encrypted (inference); the 360 has an open-tier reference and the larger library;
  the One and Series share AMD graphics with the PS4 and PS5.
- **Used by:** every project found targets one console; [Xenia Edge][edge] alone also runs original Xbox games,
  through Microsoft's emulator.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** add two studies to the roadmap, xemu by a reader session limited to architecture,
  and Xenia by direct reading.
  Xenia's and Canary's kernel and presumed key paths are closed by this change's register lines;
  each study first registers as closed any further kernel, image, or key path it finds.
- **Oracles:** adopt the NV2A golden captures and the kernel suite as the original Xbox's oracles,
  with xemu's published runs as the baseline to beat; use game lists as regression aids only.
- **Firmware:** a high-level kernel written from open prose, with no Microsoft file and no key,
  decided with [R2-12][phase2]; accept the user's own dumps only as an option,
  and never name or recommend a modified image; for the 360, accept only XEX files the user has decrypted.
- **Scope:** the original Xbox first, then the 360; the Xbox One and Series not taken up, for [R6-01][phase6] to record,
  because no route into them exists without the console's system files and a circumvention by the user.

## Implications for Rustalgia

- [R2-12][phase2] must decide how a high-level Xbox kernel signs saves without Microsoft key material,
  because games check signatures and the projects that solve it are inferred to hold keys (Legal exposure).
- Any reader study of [xemu][xemu] or the high-level forks, such as [hakuX][hakux], must register the closed dashboard,
  kernel, and key paths first, and the guard's prefix match on `xemu-project/xemu`,
  which walls every sibling repository and blocked the results repository's README,
  needs a decision before those siblings can be evaluated.
- [R2-01][phase2] can take xemu's TCG translation and hakuX's FEX-based JIT as the two designs for guest x86,
  and [Xenia][xenia]'s intermediate-form JIT for the 360,
  whose form [R1-03's recommendation][r103-rec] already proposes to share with the PS3's PowerPC cores.
- [R2-05][phase2] should treat the NV2A's fixed-point combiners and the 360's eDRAM resolve
  as the family's two graphics problems, and count the One and Series in the shared AMD shader-translation work.
- [R2-15][phase2] should adopt the [NV2A golden captures][golden] and the [kernel suite][kts],
  because they are the family's only hardware oracles.
- Rustalgia must not publish to the Microsoft Store or Xbox under policy 10.13.10,
  a constraint for [R0-03][r003]'s store plan, and must not name modified BIOS images or link dumping guides
  ([R0-02 option 7][r002-o7]).

## Open questions

- Where in [Xenia][xenia]'s repository is the XEX key, if it is there?
  A file listing at the start of the recommended Xenia study, before any file is opened, would answer it.
- Which kernels does the [kernel test suite][kts]'s published list cover, and with what results?
  Reading its wiki page once this change's register line for the suite merges would answer it.

## Sources

Every source below was read on 2026-11-25, as raw text, unless an entry says otherwise.
Repository READMEs are read at their default branch on that date; Wikipedia links are pinned to the revision read.
Closed addresses are in code spans, with the reason.

Repository documents:

- [ADR 0006][adr6]; [glossary][glossary]; [research guide][guide]; [research roadmap][roadmap];
  [source register][register].
- [R0-02, legal baseline][r002]; [R0-03, licence strategy][r003];
  [R0-05, "Sega, arcade, Xbox, and other systems"][r005-xbox]; [R1-03, primer][r103-cpu]; [R1-04, primer][r104-x86];
  [R1-07, catalogue][r107-home]; [R1-08, catalogue][r108-xbox].

Original Xbox emulators, prose only:

- xemu: [README][xemu]; [home page][xemu-home], version 0.8.139; [About][xemu-about]; [Required Files][xemu-req];
  [FAQ][xemu-faq]; [Dashboard][xemu-dash]; [Disc Images][xemu-disc]; [download page][xemu-dl]; [Testing][xemu-test];
  [compatibility data][xemu-compat]; [developer guide][xemu-dev]; ["Graphics Debugging"][xemu-gfx].
  Its guest-debugging page, `xemu.app/docs/dev/debug/guest/`, not opened: it describes disassembling firmware.
- `github.com/xemu-project/xemu-dashboard` and `github.com/xemu-project/xemu-hdd-image`, not opened: closed,
  replacement system software.
- [XQEMU site][xqemu-site], welcome and getting-started pages; [StrikeBox README][strikebox];
  `github.com/mborgerson/OpenXBOX`, metadata and README, not linked: no licence.
- [Cxbx-Reloaded README][cxbxr]; [Cxbx-Reloaded site][cxbxr-site]; [cxbx-shogun README][shogun];
  [Cxbx on SourceForge][cxbx-sf]; `github.com/PatrickvL/Dxbx` README, not linked: no licence;
  [Dxbx on SourceForge][dxbx-sf]; `emulator-zone.com`, not opened: may host BIOS files.
- [hakuX README and licence][hakux], v1.3.0; [xbased README][xbased], v1.2.14; [xbased site][xbased-site];
  [xbased compatibility data][xbased-compat]; [XPSemu README][xpsemu], v3.6.
- [X1 BOX README][x1box], 1.3.3; [X1 BOX on Google Play][x1box-play]; [libretro, "xemu"][lr-xemu];
  [xemu-libretro README][xemu-lr]; [xemu-ps4][xemu-ps4], [X-OG Mobile][xog], and [xemu-uwp][xemu-uwp],
  metadata and READMEs.
- `github.com/Cxbx-Reloaded/XbSymbolDatabase`, README and licence, not linked: closed, derived from Microsoft's code.

Xbox 360, One, and Series projects, prose only:

- Xenia: [README][xenia]; [`docs/cpu.md`][xenia-cpu] and [`docs/kernel.md`][xenia-kernel], commit `95a5c3ee`;
  [FAQ][xenia-faq], last edited 2021-08-20; [roadmap][xenia-roadmap], Canary wiki copy, last edited 2021-11-30;
  [download page][xenia-dl]; ["Leaving No Pixel Behind"][xenia-2021], 2021-04-27;
  ["Presenting the Presentation Update"][xenia-2022], 2022-01-29.
  Its Quickstart and "How to rip games" pages, `github.com/xenia-project/xenia/wiki/Quickstart`,
  `github.com/xenia-project/xenia/wiki/How-to-rip-games`, and `xenia.jp/development/quickstart/`, not opened:
  game-dumping guides.
  `github.com/xenia-project/release-builds-windows`, metadata and releases, not linked: no licence.
- Canary: [README][canary]; [contributing guide][canary-contrib], branch `canary_experimental` on 2026-11-25;
  [FAQ][canary-faq], last edited 2024-09-29; [compatibility tracker][compat]; [Netplay fork][netplay];
  [Canary UWP][uwp].
- [Xenia Edge README][edge]; [libretro, "Xenia Edge"][lr-edge]; [XeniOS README][xenios]; [XeniOS site][xenios-site],
  release 2.3.5-12324; [XeniOS, iOS guide][xenios-ios]; [XeniOS, Mac guide][xenios-mac];
  [XeniOS compatibility][xenios-compat]; `xenios.jp/faq`, not linked: game-dumping how-to.
- [xenia-android README][xa]; [Xeo README][xeo]; [XenDroid README][xendroid]; [aX360e README][ax360e];
  [aX360e on Google Play, free][ax360e-play] and [paid][ax360e-paid]; [aX360e site][ax360e-site];
  `github.com/Ashnar2602/X360-Mobile---OFFICIAL` README, not linked: source withheld.
- [Xenon README][xenon]; [XenonRecomp README][xrecomp]; [WinDurango README][windurango];
  `github.com/Leviidev/Utsuro` README, not linked: no licence; `github.com/xboxoneresearch`, organisation metadata,
  not linked: exploits and dumpers.

Tests:

- [nxdk_pgraph_tests README][pgraph]; [golden results][golden]; [xemu's published runs][xemu-pgraph],
  index and the 0.8.136 and 0.8.139 pages; [nxdk_low_level_nv2a_tests][llnv2a], README and licence file;
  [xbox_kernel_test_suite README][kts]; [nxdk README][nxdk].

Microsoft:

- [Microsoft Xbox team blog, "On Backwards Compatibility"][ms-2006], 2006-04-03.
- Xbox Wire, read live with curl's default agent; the site refuses browser-like agents
  (HTTP 403):
  [2008-11-12][wire-2008]; [2015-06-16][wire-2015]; [2015-08-05][wire-2015b]; [2017-10-23][wire-2017];
  [2021-11-15][wire-2021]; [2026-07-22][wire-2026]; [2026-11-12][wire-2026b].
- [Xbox backward compatibility page][xbox-bc].
- [Microsoft Store Policies][store], version 7.20; [change history][store-hist].
- Google Patents results: [US8711159B2][gp-1]; [US10809988B2][gp-2]; titles and dates only.

Takedowns and courts:

- GitHub DMCA notices at commit `cd00b140`: [2014-07-28][dmca-2014]; [2026-06-03][dmca-2026].
- [US Department of Justice, 2014-09-30][doj], capture 20250201083551,
  because the live page answers scripts with a bot check; [R v Gilham][gilham], EWCA Crim 2293 of 2009.

References, press, and wikis (secondary, or leads):

- [Free60 FAQ][free60-faq], commit `f3d099ff`; [IBM, "Application-customized CPU design"][ibm], 2005-12-06,
  capture 20081206055212, as the live page is gone.
- [Digital Foundry, 2017-12-09][df-2017]; [GamesRadar, 2023-04-06][gr-2023]; [VGC, 2021-11-17][vgc-2021];
  [The Register, 2010-12-03][reg-2010]; [Malwarebytes, 2013-06-26][mwb].
- [Wikipedia, "Xemu (emulator)"][w-xemu], revision 1387704026 (tertiary).
  "Xbox system software" and "Xbox (console)" mention the 2020 leak of the Xbox source and are closed here
  as a precaution: `en.wikipedia.org/wiki/Xbox_system_software` and `en.wikipedia.org/wiki/Xbox_(console)`.
  R1-04, R1-07, and R1-08 link them by revision, which the register's patterns cannot match,
  and the "(console)" form cannot be matched either,
  so those links need a follow-up change that turns them into code spans.
- Emulation General wiki (leads): ["Xbox One emulators"][egw-one]; its "Xbox emulators" and "Emulator scams" pages,
  `emulation.gametechwiki.com/index.php/Xbox_emulators` and `emulation.gametechwiki.com/index.php/Emulator_scams`,
  not linked: closed because they mention stolen or leaked kits; their `index.php?title=` forms cannot be matched.

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[glossary]: ../../glossary/terms.md
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r002-checks]: R0-02-legal-baseline.md#console-checks-and-use-after-circumvention
[r002-terms]: R0-02-legal-baseline.md#makers-system-software-and-licence-terms
[r002-record]: R0-02-legal-baseline.md#what-the-record-shows
[r002-uk]: R0-02-legal-baseline.md#the-united-kingdom
[r002-pat]: R0-02-legal-baseline.md#patents-on-emulation
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-o11]: R0-02-legal-baseline.md#11-do-not-read-patents
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r003]: R0-03-licence-strategy.md
[r005-xbox]: R0-05-source-map.md#sega-arcade-xbox-and-other-systems
[r005-tests]: R0-05-source-map.md#test-suites-and-test-vectors
[r103-cpu]: R1-03-primer-sixth-generation.md#xbox-and-xbox-360
[r103-mem]: R1-03-primer-sixth-generation.md#xbox-and-xbox-360-1
[r103-audio]: R1-03-primer-sixth-generation.md#xbox-and-xbox-360-2
[r103-rec]: R1-03-primer-sixth-generation.md#recommendation
[r103-nv2a]: R1-03-primer-sixth-generation.md#xbox-nv2a
[r103-xenos]: R1-03-primer-sixth-generation.md#xbox-360-xenos-and-its-embedded-dram
[r103-discs]: R1-03-primer-sixth-generation.md#discs-and-what-arrives-as-a-plain-image
[r103-boot]: R1-03-primer-sixth-generation.md#boot-chains-and-security-processors
[r103-sys]: R1-03-primer-sixth-generation.md#system-software-that-games-call
[r103-o1]: R1-03-primer-sixth-generation.md#1-high-level-emulation-of-system-software
[r104-x86]: R1-04-primer-modern.md#x86-64-in-the-playstation-4-and-5-and-the-xbox-one-and-series
[r104-amd]: R1-04-primer-modern.md#amd-gpus-in-the-playstation-4-and-5-and-the-xbox-one-and-series
[r104-xos]: R1-04-primer-modern.md#xbox-one-and-series-1
[r104-tests]: R1-04-primer-modern.md#tests-and-sources
[r107-home]: R1-07-catalogue-sixth-generation.md#home-consoles
[r108-xbox]: R1-08-catalogue-modern.md#xbox-family
[xemu]: https://github.com/xemu-project/xemu
[xemu-home]: https://xemu.app/
[xemu-about]: https://xemu.app/docs/about/
[xemu-req]: https://xemu.app/docs/required-files/
[xemu-faq]: https://xemu.app/docs/faq/
[xemu-dash]: https://xemu.app/docs/dashboard/
[xemu-disc]: https://xemu.app/docs/disc-images/
[xemu-dl]: https://xemu.app/docs/download/
[xemu-test]: https://xemu.app/docs/testing/
[xemu-dev]: https://xemu.app/docs/dev/
[xemu-gfx]: https://xemu.app/docs/dev/debug/graphics/
[xemu-compat]: https://xemu.app/compat.json
[xemu-pgraph]: https://xemu-project.github.io/xemu-nxdk_pgraph_tests_results/
[xqemu-site]: https://xqemu.com/
[strikebox]: https://github.com/StrikerX3/StrikeBox
[cxbxr]: https://github.com/Cxbx-Reloaded/Cxbx-Reloaded
[cxbxr-site]: https://cxbx-reloaded.co.uk/
[shogun]: https://github.com/Echelon9/cxbx-shogun
[cxbx-sf]: https://sourceforge.net/projects/cxbx/
[dxbx-sf]: https://sourceforge.net/projects/dxbx/
[hakux]: https://github.com/rfandango/hakuX
[xbased]: https://github.com/crazyriddler/xbased
[xbased-site]: https://xbased-emu.com/
[xbased-compat]: https://xbased-emu.com/data/compat.json
[xpsemu]: https://github.com/ZiZc3/XPSemu
[x1box]: https://github.com/izzy2lost/xemu
[x1box-play]: https://play.google.com/store/apps/details?id=com.izzy2lost.x1box
[lr-xemu]: https://docs.libretro.com/library/xemu/
[lr-edge]: https://docs.libretro.com/library/xenia_edge/
[xemu-lr]: https://github.com/WizzardSK/xemu-libretro
[xemu-ps4]: https://github.com/iHaiDeeZ/xemu-ps4
[xog]: https://github.com/Ashnar2602/X-OG_Mobile
[xemu-uwp]: https://github.com/danprice142/xemu-uwp
[xenia]: https://github.com/xenia-project/xenia
[xenia-cpu]: https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/cpu.md
[xenia-kernel]: https://github.com/xenia-project/xenia/blob/95a5c3ee250f80c3b9d139658649d9ffb6db3eec/docs/kernel.md
[xenia-faq]: https://github.com/xenia-project/xenia/wiki/FAQ
[xenia-roadmap]: https://github.com/xenia-canary/xenia-canary/wiki/Roadmap
[xenia-dl]: https://xenia.jp/download/
[xenia-2021]: https://xenia.jp/updates/2021/04/27/leaving-no-pixel-behind-new-render-target-cache-3x3-resolution-scaling.html
[xenia-2022]: https://xenia.jp/updates/2022/01/29/presenting-the-presentation-update-amd-fidelityfx-fsr-fxaa-cas-vrr.html
[canary]: https://github.com/xenia-canary/xenia-canary
[canary-contrib]: https://github.com/xenia-canary/xenia-canary/blob/canary_experimental/.github/CONTRIBUTING.md
[canary-faq]: https://github.com/xenia-canary/xenia-canary/wiki/FAQ
[compat]: https://github.com/xenia-canary/game-compatibility
[netplay]: https://github.com/AdrianCassar/xenia-canary
[uwp]: https://github.com/SirMangler/xenia
[edge]: https://github.com/has207/xenia-edge
[xenios]: https://github.com/xenios-jp/XeniOS
[xenios-site]: https://xenios.jp/
[xenios-compat]: https://xenios.jp/compatibility
[xenios-ios]: https://xenios.jp/docs/ios/getting-started
[xenios-mac]: https://xenios.jp/docs/mac/getting-started
[xa]: https://github.com/xenia-android/xenia-android
[xeo]: https://github.com/chuckstation/xeo
[xendroid]: https://github.com/rfandango/XenDroid
[ax360e]: https://github.com/aenu1/ax360e
[ax360e-play]: https://play.google.com/store/apps/details?id=aenu.ax360e.free
[ax360e-paid]: https://play.google.com/store/apps/details?id=aenu.ax360e
[ax360e-site]: https://aenu.cc/ax360e/
[xenon]: https://github.com/xenon-emu/xenon
[xrecomp]: https://github.com/hedge-dev/XenonRecomp
[windurango]: https://github.com/WinDurango/WinDurango
[egw-one]: https://emulation.gametechwiki.com/index.php/Xbox_One_emulators
[pgraph]: https://github.com/abaire/nxdk_pgraph_tests
[golden]: https://abaire.github.io/nxdk_pgraph_tests_golden_results/
[llnv2a]: https://github.com/abaire/nxdk_low_level_nv2a_tests
[kts]: https://github.com/Cxbx-Reloaded/xbox_kernel_test_suite
[nxdk]: https://github.com/XboxDev/nxdk
[ms-2006]: https://learn.microsoft.com/en-us/archive/blogs/xboxteam/on-backwards-compatibility-2
[wire-2008]: https://news.xbox.com/en-us/2008/11/12/xbox-360-console-banning/
[wire-2015]: https://news.xbox.com/en-us/2015/06/16/xbox-microsoft-unleashes-xbox-one-backward-compatibility-game-streaming-in-preview/
[wire-2015b]: https://news.xbox.com/en-us/2015/08/05/gamescom-backward-compatibility/
[wire-2017]: https://news.xbox.com/en-us/2017/10/23/play-three-generations-of-games-better-on-xbox-one/
[wire-2021]: https://news.xbox.com/en-us/2021/11/15/70-new-backward-compatible-games/
[wire-2026]: https://news.xbox.com/en-us/2026/07/22/xbox-backward-compatibility-on-pc/
[wire-2026b]: https://news.xbox.com/en-us/2026/11/12/25-original-xbox-games-now-available-on-pc/
[xbox-bc]: https://www.xbox.com/en-US/games/backward-compatibility
[store]: https://learn.microsoft.com/en-us/windows/apps/publish/store-policies
[store-hist]: https://learn.microsoft.com/en-us/windows/apps/publish/store-policies-change-history
[gp-1]: https://patents.google.com/patent/US8711159B2/en
[gp-2]: https://patents.google.com/patent/US10809988B2/en
[dmca-2014]: https://github.com/github/dmca/blob/cd00b140d9dac5ea454affb1aee3344529f62fa5/2014/2014-07-28-Microsoft.md
[dmca-2026]: https://github.com/github/dmca/blob/cd00b140d9dac5ea454affb1aee3344529f62fa5/2026/06/2026-06-03-microsoft-3.md
[doj]: https://web.archive.org/web/20250201083551/https://www.justice.gov/opa/pr/four-members-international-computer-hacking-ring-indicted-stealing-gaming-technology-apache
[gilham]: https://caselaw.nationalarchives.gov.uk/ewca/crim/2009/2293
[free60-faq]: https://github.com/free60project/wiki/blob/f3d099ff10b732c6b5685ffbb1a9f50c66ae08b1/docs/Support/FAQ.md
[ibm]: https://web.archive.org/web/20081206055212/http://www-128.ibm.com/developerworks/power/library/pa-fpfxbox/
[df-2017]: https://www.digitalfoundry.net/articles/digitalfoundry-2017-xbox-one-x-back-compat-how-does-it-actually-work
[gr-2023]: https://www.gamesradar.com/emulators-on-xbox-series-xs-are-being-restricted-by-microsoft
[vgc-2021]: https://www.videogameschronicle.com/news/as-rights-issues-block-more-xbox-back-compat-games-phil-spencer-calls-for-legal-emulation/
[reg-2010]: https://www.theregister.com/2010/12/03/xbox_modder_prosecution_dropped/
[mwb]: https://www.malwarebytes.com/blog/news/2013/06/first-official-xbox-one-emulator-is-a-phony
[w-xemu]: https://en.wikipedia.org/w/index.php?oldid=1387704026
