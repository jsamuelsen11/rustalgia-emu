---
title: "PlayStation 3, 4, and 5: family survey"
roadmap_item: R1-21
status: draft
date: 2026-11-25
---

# PlayStation 3, 4, and 5: family survey

## Summary

This note asks which emulators matter for the PlayStation 3, PlayStation 4, and PlayStation 5, what each one does,
what legal exposure the family carries, and how hard the family is to emulate.

Twenty-five projects and services, of about sixty named during the research, are compared in one table.
[RPCS3][rpcs3] is the only mature PS3 emulator, and its ports carry it to Android, iOS, the Xbox, and jailbroken PS5s;
[shadPS4][shadps4] leads the PS4; and real PS5 projects now exist beside the scams,
led by [SharpEmu][sharpemu] and [KytyPS5][kytyps5].
Most serious projects are GPL-2.0, so walled; [fpPS4][fpps4], [Kyty][kyty], [GPCS4][gpcs4], [Orbital][orbital],
and the ChonkyStation emulators are among the few open ones, and every project's high-level system libraries are closed.

The legal picture is the hardest of any family surveyed so far.
Games, firmware, and system modules are encrypted on all three consoles, so every emulator either decrypts,
with keys it carries (RPCS3, by inference from its ports' prose) or keys the user supplies
(Nucleus, Orbital),
or takes input that the user has already decrypted (ChonkyStation3 and the other PS4 and PS5 projects).
Sony's enforcement record is against keys, exploits, custom firmware, and leaked code;
the only action found against an emulator was a publisher's, [Atlus's][atlus], against RPCS3's Patreon page in 2017.

For Rustalgia, the family is a high-level emulation problem with no hardware-oracle test suite beyond the PS3's
[ps3autotests][ps3at], and no commercial PS4 or PS5 game that a user can run without first circumventing the console's
protection (inference); homebrew built with OpenOrbis is the exception.
The note recommends adding reader-session studies of RPCS3 and shadPS4 to the roadmap,
treating the PS3 as the family's first target,
and deferring the PS4 and PS5 until [R2-12][phase2] and [R6-01][phase6] weigh decrypted input.

## Scope

- Question: which emulators are popular or respected for the PlayStation 3, 4, and 5, and for each, what are its status,
  licence, tier, techniques, and hosts; what legal exposure does the family carry; and how hard is it to emulate?
- Covered: every PS3, PS4, PS4 Pro, PS5, and PS5 Pro model in [R1-08][r108-ps].
  The PlayStation Portal is a streaming client and stays a boundary case ([R1-08][r108-ps]);
  homebrew ports that run other consoles' emulators on a jailbroken PS5 are named only as boundary cases.
  How the hardware works is in [R1-04][r104]; the law in [R0-02][r002]; the hubs in [R0-05][r005-ps].
  This note cites those sections and does not repeat them.
- Researched on 2026-11-25 by three research agents, who read every source as raw text and quoted only from it;
  then one pass of fresh verifiers checked each claim against its source, and a fix pass applied their findings
  (research log).
- Every emulator was read from prose and repository metadata only, whatever its tier.
  No emulator source file, issue, pull request, or emulator's own wiki was opened, and no key, keyset, EID, fuse,
  kernel dump, RAP or account-licence, dumping-guide, or firmware page was opened, nor any firmware, game,
  or key downloaded.
- Markers follow the [research guide][guide].
  Wikipedia is tertiary and named wherever a fact rests on it.
  The Emulation General wiki, which the [register][register] calls a lead, is marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.
  Nothing here is legal advice.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, store installs, frontends), respect
  (tested accuracy claims, or use as a reference by other projects), or history (it shaped the family).
  Stars are a rough sign only: [AnyPS5][anyps5] shows 61,519 stars four months after its creation,
  more than any other project here (metadata, 2026-11-25), which no other sign supports (inference).
- Status is the archived flag, last push, and latest release from GitHub metadata, read on 2026-11-25,
  or the project's site or Flathub where the guard blocked it: the releases of [RPCS3][rpcs3] and [shadPS4][shadps4],
  the metadata of repositories not yet in the main register, and `rpcs3.net`,
  which refuses automated requests with a Cloudflare challenge in any case (research log; verification pass).
- Each tier was checked against the [register][register], as a family survey requires
  ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  No licence on an existing line changed: RPCS3 is still GPL-2.0-only with some files differing,
  shadPS4 a bare GPL-2.0 licence file under a README that says or-later, [ps3autotests][ps3at] GPL-2.0 with no version,
  and Obliteration MIT or Apache-2.0.
  One tier changed: `rpcs3.net` was walled, and the settled precedent that a walled emulator's site is open for prose,
  as `vita3k.org` is, makes it open.
- Precedents applied without re-deciding them: a repository with no licence is closed; a bare GPL-2.0 text is walled;
  a licence file beats a README; a repository that is gone is closed;
  every high-level reimplementation of a kernel or of system modules is closed inside any repository
  ([ADR 0006, "Closed tier"][adr6-closed]), so the table's tiers are those of the rest of each repository.
- [fpPS4][fpps4]'s licence file is LGPL-2.1 with no version statement;
  the GNU list says LGPL-2.1 "is compatible with GPLv2 and GPLv3"
  ([GNU licence list][gnu]), so it is open, unlike a bare GPL-2.0.
- Process calls settled for this survey: the shadPS4 compatibility repository, which has no licence,
  is closed under the no-licence precedent, and its published results stay usable as data;
  [ps3recomp][ps3recomp-note] is closed as a whole
  (see "Static recompilation");
  `claimore22/ps5rs` is closed as a precaution, like `idc/ps4libdoc`,
  because it holds firmware and SDK databases of unstated origin; Obliteration stays closed as a whole,
  as the register has it.

### The emulators compared

Key: a release is given where its metadata or site could be read, else the last push;
"PUP" means Sony's published update file, which the user downloads;
"dump" means modules or system software that the user dumps from a console;
"HLE" means the project supplies the libraries itself; Win, Mac, Lin, BSD, And, and iOS name hosts.

| Project | For | Tier | Licence | Release or push | CPU | Firmware | Hosts |
|---|---|---|---|---|---|---|---|
| RPCS3 | PS3 | walled | GPL-2.0-only | build 2026-10-23 | interp., LLVM | PUP | Win, Mac, Lin, BSD |
| aPS3e | PS3 | walled | not settled | Play 2026-10-04 | LLVM | PUP | And |
| ARMSX3 | PS3 | walled | GPL-2.0-only | 1.7.2, 2026-11-24 | from RPCS3 | PUP | And, iOS |
| Nucleus | PS3 | walled | GPL-2.0 | archived; 0.1.0, 2016 | interp., own IR | user keys | Win, Lin, Mac, And, iOS |
| ChonkyStation3 | PS3 | open | GPL-3.0 | push 2025-09-24 | not stated | decrypted modules | Win, Mac, Lin |
| `ps3emu` | PS3 | closed | none | push 2021-02-27 | static rewriter | dump | Lin |
| shadPS4 | PS4 | walled | GPL-2.0 | v0.21.0, 2026-10-29 | native x86-64 | dump, else HLE | Win, Mac, Lin, BSD |
| Bachata S4 | PS4 | walled | GPL-2.0 | 0.2.6, 2026-11-21 | FEX on Arm | as shadPS4 | And, iOS |
| fpPS4 | PS4 | open | LGPL-2.1 | push 2026-11-19 | native x86-64 | HLE | Win |
| Kyty | PS4, PS5 | open | MIT | v0.2.0, 2022-08-18 | native x86-64 | HLE | Win |
| GPCS4 | PS4 | open | GPL-3.0 | v0.2.1, 2022-06-07 | native x86-64 | some dumped, HLE | Win |
| ChonkyStation4 | PS4 | open | GPL-3.0 | push 2026-09-20 | not stated | decrypted modules | Win |
| Orbital | PS4 | open | MIT | push 2024-04-06 | virtualised | user keys, kernel | Win, Mac, Lin |
| Obliteration | PS4 | closed | MIT or Apache-2.0 | push 2026-11-22 | hypervisor | system software | Win, Mac, Lin |
| `spine` | PS4 | closed | binary only | 2022-05-17 | native x86-64 | dump | Lin |
| psOff | PS4 | open | GPL-3.0 | archived 2024 | native x86-64 | dump | Win |
| RPCSX | PS4, PS5 | walled | GPL-2.0 | push 2026-06-29 | not stated | runs Sony's VSH | Lin |
| Prosperity | PS4, PS5 | walled | GPL-2.0 | v0.0.1, 2026-10-03 | native; FEX on Arm | dump (LLE) | Lin, And |
| SharpEmu | PS5, PS4 | walled | GPL-2.0 | v0.0.8, 2026-11-23 | native x86-64 | not stated | Win, Lin, Mac |
| KytyPS5 | PS5 | walled | GPL-2.0-only | daily, 2026-11-25 | native x86-64 | HLE | Win, Lin, Mac |
| AnyPS5 | PS5 | walled | GPL-2.0-only | v0.1.5, 2026-11-11 | relinked native | HLE | Win, Lin; Mac (relinker) |
| RustPS5Emu | PS5 | walled | GPL-2.0-only | push 2026-11-24 | native x86-64 | HLE | Lin, Win |
| `ps3recomp` | PS3 | closed | MIT | v0.20.0, 2026-11-21 | static recompiler | HLE, or Sony's | Win, Mac, Lin |
| Sony's emulators | PS1, PS2, PSP | closed | maker's | in PS3 firmware | not stated | maker's | PS3 |
| PS Plus streaming | PS3 | — | maker's | since 2022 | streamed | — | PS4, PS5 |

Sources by row: each project's README, site, release metadata, or store page as cited in its paragraph below.
GPL-2.0 means GPL-2.0 with neither "only" nor "or later" settled by the licence file, as the register records it;
a name in a code span is a closed repository, not linked.

### PlayStation 3 emulators

- RPCS3 is "The world's first free and open-source PlayStation 3 emulator/debugger, written in C++ for Windows, Linux,
  macOS and FreeBSD" ([RPCS3 README][rpcs3], blob `6e59bdb5`), with 20,519 stars, pushed on 2026-11-25.
  Its Flathub package reports 2,927,648 installs
  ([Flathub statistics][fh-rpcs3-stats]),
  and the latest build there is 0.0.43-20376 of 23 October 2026
  ([Flathub appstream][fh-rpcs3]); Wikipedia says it has no stable release ([Wikipedia, "RPCS3"][w-rpcs3]; tertiary).
- Its Flathub description, most likely the project's own metainfo (unconfirmed),
  says "All information was obtained legally by purchasing PlayStation 3 hardware and software",
  plus documentation from the internet, most of it on the PlayStation 3 Developer Wiki ([Flathub appstream][fh-rpcs3]).
  That wording does not say whether the documentation was public (inference).
- Its technique, from prose: interpreters and LLVM recompilers for the PPU and the SPUs,
  an Arm64 port that needs Armv8.2-A ([R1-04, "Tests and sources"][r104-tests]), a PPU thread scheduler from 2017,
  Vulkan from 2017, save states from July 2022, and Intel TSX code removed on 17 November 2025 as unmaintained
  ([Wikipedia, "RPCS3"][w-rpcs3]; tertiary).
  It loads Sony's libraries from the firmware or replaces them:
  aPS3e's listing for its RPCS3-derived core offers "Optional specification of libraries to simulate in LLE or HLE mode"
  ([aPS3e on Google Play][aps3e-play]).
- Firmware is Sony's published update.
  Wikipedia says RPCS3 "gained the ability to install official PlayStation 3 firmware directly to its core file system"
  on 16 February 2017 ([Wikipedia, "RPCS3"][w-rpcs3]; tertiary), and ARMSX3 says installing it "decrypts Sony's official
  update and unpacks the console's internal flash (dev_flash) ... as RPCS3 does on every platform"
  ([ARMSX3 README][armsx3]).
  ChonkyStation3 tells its users to decrypt game executables, data files,
  and firmware modules with RPCS3's own decryption tool ([ChonkyStation3 README][chonky3]).
  So RPCS3 decrypts the update file, executables, and game data itself, and carries the keys to do so
  (inference from both READMEs);
  where in its repository they sit is not known,
  so a reader session must find and close that path before reading further (see "Implications").
- Digital games also need a licence file: the wiki says paid digital releases need "a .RAP license file"
  (Emulation General, RPCS3 page, `emulation.gametechwiki.com/index.php/RPCS3`; lead),
  a page closed here because it discusses obtaining licence files and cracked files from others.
  RPCS3's own quickstart, blocked by the guard, was not read, so whether it also asks for an account file is unchecked.
- Wikipedia says that "As of October 21, 2026, 80% of PlayStation 3 games have been classified as 'playable'"
  ([Wikipedia, "RPCS3"][w-rpcs3]; tertiary),
  and its Flathub description claims over 2,500 commercial titles
  ([Flathub appstream][fh-rpcs3]); its own compatibility list is behind the guard.
  RPCS3 runs Sony's own PS1 emulator from the installed firmware, but not its PS2 or PSP ones,
  and runs the system menu in part (Emulation General, "PlayStation 3 emulators"; lead).
- It began in May 2011, by DH and Hykem
  ([Wikipedia, "RPCS3"][w-rpcs3]; tertiary),
  and its README requires that "AI-assisted contributions must be disclosed" ([RPCS3 README][rpcs3]).
- [Nucleus][nucleus], by AlexAltea, also an RPCS3 developer (Emulation General; lead), is archived.
  Its last release, 0.1.0 of 13 May 2016,
  replaced an LLVM translator with "New retargetable binary translator with a custom IR" for PPU and SPU code
  and had Direct3D 12, OpenGL, and Vulkan back ends;
  0.0.1 listed "High-level emulation of LV2 syscalls" and integration tests from the PS3 autotests
  ([Nucleus releases][nucleus-rel]).
  Its README says users "need to provide the PlayStation 3 firmware keys" in a file,
  and links the key file's requirements, not opened and closed here ([Nucleus README][nucleus]).
- [ChonkyStation3][chonky3], GPL-3.0, "can currently boot a few simple commercial games",
  warns users not to play games with it, and needs Sony's firmware modules, decrypted by the user,
  because "PS3 game executables are encrypted, and ChonkyStation3 currently can't decrypt games on its own" (README).
  That confirms from prose what [R1-04][r104-hle] marked from memory: the published firmware's modules are encrypted.
- `ps3emu`, by nongeneric, has no licence, so it is closed and not linked.
  Its site says it "strives to recompile as much PS3 code to x86 as possible", with a Cell to x86 rewriter,
  an OpenGL 4.5 renderer, and a set-up that copies binaries from a PS3 and decrypts them
  ([ps3emu site][rcebits]); its decryption and preparation pages were not opened.
- [allity][allity], MIT, is a toy that loads ELF files and runs enough PowerPC for one test (README); it is open.
- Historical projects, all leads from the Emulation General wiki: PS3F by Shima, the author of SSF; Short Waves,
  proprietary, by InoriRus, who later wrote Kyty; and Andstation 3, an Android app the wiki does not recommend.

### Ports of RPCS3

| Port | Host | Stars | Licence evidence | Note |
|---|---|---|---|---|
| [aPS3e][aps3e] | Android 10+, arm64 | 773 | no root licence file; README cites headers | Play "1M+"; paid build |
| [ARMSX3][armsx3] | Android, iOS beta | 1,098 | GPL-2.0-only by README | iOS 0.0.4 beta, 2026-11-22 |
| [RPCSX-UI-Android][rpcsx-ui] | Android | 1,341 | GPLv2, version not stated | last release 2025-04-25 |
| [rpcs3-xbox][rpcs3-xbox] | Xbox Series, UWP | 38 | GPL-2.0-only by README | Developer Mode only |
| [KB-RPCS3][kb-rpcs3] | jailbroken PS5 | 116 | GPL-2.0-only core, GPL-3.0 parts | ships no binary |

- Sources: each port's README and metadata, read 2026-11-25; aPS3e's [Play listing][aps3e-play] and [site][aps3e-site].
- aPS3e says "We open source and follows the GPLv2 agreement", offers a paid "Premium version",
  and tells users to "dump your own real PS3 games" ([aPS3e on Google Play][aps3e-play]).
  Comments on its site say its GitHub repository was deleted in February 2025, which fits its creation date of June 2025
  ([aPS3e site][aps3e-site]; lead).
  A paid build with no root licence file does not show GPL compliance (inference, recorded as that fork's risk).
- ARMSX3's README says it "includes no PS3 firmware, games or other files of Sony's",
  and that its "XMB Mode runs none of Sony's code"
  ([ARMSX3 README][armsx3]); that mode reimplements the system menu, so it is closed.
- rpcs3-xbox says it "never downloads or distributes PS3 firmware" and is "about 99% vibecoded"
  ([rpcs3-xbox README][rpcs3-xbox]).
- KB-RPCS3 states the licence problem plainly: its "title links RPCS3's GPL-2.0-only core with GPL-3.0 PS5 components;
  those licences cannot be combined in one distributed program" ([KB-RPCS3 README][kb-rpcs3]).
  The same bar stops Rustalgia, under [ADR 0002][adr2], from taking any RPCS3 code even if its tier allowed reading it.

### Static recompilation

- [ps3recomp][ps3recomp-note], MIT, with 745 stars and release v0.20.0 of 21 November 2026,
  turns PS3 executables into native programs with "HLE implementations of the PS3 system libraries"
  and calls RPCS3 "a behavioural reference, not a code source" (README, blob `6de88b52`).
  Its changelog says, among other entries, that "`cellFiber` is the SDK's scheduler API,
  replacing the made-up one" and that a pass brings system calls "closer to the SDK" (same).
  Those entries suggest Sony's kit was consulted (inference), so the repository is closed as a whole and not linked.
- Game ports built on it, several with hundreds of stars, are recompilations of games and closed;
  they are not named here (GitHub search, 2026-11-25).

### PlayStation 4 emulators

- shadPS4 is "an early **PlayStation 4** emulator for **Windows**, **Linux** and **macOS** written in C++",
  with 34,394 stars, pushed on 2026-11-25 ([shadPS4 README][shadps4], blob `0161e221`).
  Its latest release is v0.21.0 of 29 October 2026 ([shadPS4 site][shadps4-site]; [release post][shadps4-021]).
  Flathub reports 81,999 installs ([Flathub statistics][fh-shadps4-stats]).
  The repository is the core; a separate Qt launcher is the user's interface,
  and its metadata is blocked because the guard's shadPS4 pattern matches it as a prefix (research log).
- Its README says it "can load some PlayStation 4 firmware files", lists 34 modules,
  and says they "must be dumped from your legally owned PlayStation 4 console"; everything else is HLE (inference).
  It links a wiki quickstart page, which was not followed. macOS needs version 26 and Apple silicon,
  running the x86-64 build under Rosetta 2 (README; release notes).
- Its release notes name patching of guest x86-64 code that runs natively, HLE of system libraries,
  PM4 command processing for the GPU, a shader recompiler with no target named, and handling of the Pro's "Neo" mode
  ([v0.21.0 post][shadps4-021]).
  Wikipedia adds that 0.10.0 brought "readbacks", which emulate the shared memory, experimental and off by default,
  and that 0.13.0 added shader caching ([Wikipedia, "ShadPS4"][w-shadps4]; tertiary).
- Its credits name Panda3DS for native execution, fpPS4 for "reverse engineering work and research", and yuzu:
  "Our shader compiler has been designed with yuzu's Hades compiler as a blueprint" ([README][shadps4]).
  The yuzu credit is design lineage with no claim of copied code; yuzu ended under a consent judgment
  ([R0-02, "Game sites, and the yuzu case"][r002-yuzu]).
- Its contributing guide says "AI use should always be disclosed" and has no rule on leaked material
  ([shadPS4 contributing guide][shadps4-contrib]).
  Its compatibility rules ban repacked dumps and piracy and ask reporters to dump their console's system files
  (`github.com/shadps4-compatibility/shadps4-game-compatibility` README, not linked because it has no licence).
- [fpPS4][fpps4], in Free Pascal, is a "PS4 compatibility layer (emulator)" for Windows 7 and later with AVX2
  and Vulkan, whose author is "rewriting the emulator core in the kern branch"
  (README, blob `86fde02d`); its last release is v0.0.1 of 31 December 2022, though pushes continue ([metadata][fpps4]).
  Its site calls it "open-source" and thanks georgemoralis, of shadPS4's main team, for the domain
  ([fpPS4 site][fpps4-site]).
  The kern branch's kernel is closed with its HLE.
- [Kyty][kyty], MIT, says "It is possible to run some simple games for PS4 and homebrews
  for PS5", on Windows 10 only (README); its last release is v0.2.0 of 18 August 2022 and its last push May 2024.
  It shaped the family: Obliteration began as its fork, KytyPS5 and several PS5 projects descend from it,
  and SharpEmu thanks it (those projects' READMEs).
- [GPCS4][gpcs4], GPL-3.0, says it is "not intended to become a serious application";
  it parses PM4 command buffers to recover graphics calls, recompiles GCN shaders to SPIR-V,
  uses some system libraries "directly" and implements the rest, and builds only on Windows (README).
- [Orbital][orbital], MIT, is a "Virtualization-based PlayStation 4 emulator"
  that boots decrypted kernels of system software 4.55 and 5.00;
  users must build its three parts and "extract your own console keys" (README).
  One part, `AlexAltea/orbital-bios`, is a "SeaBIOS fork with support for PlayStation 4 hardware" (metadata),
  a replacement boot firmware, so it is closed and not linked.
- Obliteration, closed, is "a free and open-source PlayStation 4 kernel rewritten in Rust"
  that aims "to run the dumped PlayStation 4 system software" in its own virtual machine, and "cannot run any games yet"
  (`github.com/obhq/obliteration` README, not linked);
  its site points users to fpPS4 or shadPS4 ([Obliteration site][oblit-site]).
  It is the only substantial Rust project for the family found, and its code is closed to Rustalgia.
- [uplift][uplift], MIT, dormant since 2019, is an early PS4 project whose README describes nothing;
  Prosperity calls it the "original inspiration for PS4Delta", and Obliteration and GPCS4 credit it too (their READMEs).
- Spine is a closed-source Linux emulator.
  GamingOnLinux quoted its README asking for "firmware dependencies in firmware folder"
  and reported 345 of 996 listed titles going in-game in 2021
  ([GamingOnLinux, 10 September 2021][gol-spine]; secondary).
  Its repositories under `github.com/devofspine/` hold binaries only, so they are closed and not linked:
  `devofspine/spine` under a licence that permits redistribution "in binary form" alone
  (licence file),
  with a last release of 17 May 2022 (metadata, verification pass; the guard blocked it in the fix pass),
  and `devofspine/spinedemo` with no licence.
- psOff, a Windows layer under GPL-3.0, is archived; its README says "we had to go closed source"
  ([psOff README][psoff]).
  Its closed successor loads firmware modules, models the Pro's mode, and needs a trophy key "from retail console"
  (`github.com/SysRay/psOff_compatibility` README, not linked because it has no licence).
- [ChonkyStation4][chonky4], GPL-3.0,
  "can currently boot a few simple commercial games" on Windows
  and needs the user's decrypted firmware modules (README).
- [RPCSX][rpcsx] is "An experimental PlayStation 4 and PlayStation 5 emulator for Linux"
  that "uses modified source code of RPCS3", with an `orbis-kernel` directory under MIT (README);
  that directory is a kernel and closed.
  The wiki says it loads the PS5's Safe Mode and shows the PS logo in the system shell
  (Emulation General, "PlayStation 5 emulators"; lead), which needs the user's system software (inference).

### PlayStation 5 projects

- Real PS5 projects with public source and prose exist, alongside scams.
  All run decrypted dumps, and all but Prosperity and RPCSX replace Sony's libraries with their own (findings below).
- [SharpEmu][sharpemu], in C#, is "An experimental PlayStation 5 emulator for Windows and Linux,
  with experimental backward compatibility support for PlayStation 4 games" whose "current focus is on accuracy
  and infrastructure setup rather than game-specific compatibility" (README); 6,713 stars,
  release v0.0.8 of 23 November 2026.
  Its licence file is bare GPL-2.0 under a README header of GPL-2.0-or-later, so it is walled.
  Its contributing guide bars "Sony proprietary code, firmware, keys, decrypted assets",
  asks for "clean-room techniques, or your own original research",
  and welcomes AI-assisted work that the contributor can explain ([SharpEmu contributing guide][sharpemu-c]).
- SharpEmu's site counts "110 of 9,516 PS5 titles tested on Windows · 79 reaching gameplay",
  and its FAQ says it "only runs dumps you make from your own console"
  ([SharpEmu site][sharpemu-site]; [FAQ][sharpemu-faq]).
  A macOS edition renders with Metal and runs under Rosetta 2 (FAQ).
  Tom's Hardware called it "The most prominent name in the news cycle" in July 2026
  ([Tom's Hardware, 15 July 2026][toms]; secondary).
- [KytyPS5][kytyps5], 12,723 stars, is "a free
  and open-source PlayStation 5 translation layer ... based on a heavily modified version of Kyty", GPL-2.0-only,
  and says "External low-level emulation modules are neither required nor planned" (README).
  It has regression tests of its own memory, shader, and resource tracking, and a Direct3D 12 fork
  for the Xbox Series (README).
  The repository moved from `nmzik/KytyPS5` (redirect, observed).
- [AnyPS5][anyps5] relinks PS5 executables into native Linux
  or Windows programs with "implementations of system prx libraries suitable for dynamic linking.
  No emulation or separate runtime process" (README).
  It is GPL-2.0-only, has a web converter, and says it does not "require copyrighted software, firmware,
  cryptographic keys, or proprietary libraries" (README).
- [Prosperity][prosperity], formerly PS4Delta,
  "aims to provide a low-level emulation (LLE) sandbox where games run with their original system modules";
  CPU code runs natively on x86-64 or through FEX on Arm64,
  and the user must "supply your own decrypted system modules and games, dumped from hardware you own" (README).
  It rates Linux on x86-64 tier 1, Linux on Arm64 and Android tier 2, and Windows tier 3.
- [RustPS5Emu][rps5e], in Rust and alpha, is "in the spirit of Wine": the game's code runs natively,
  the system libraries are HLE in Rust, and "Retail-encrypted packages cannot be used" (README).
  It records and replays input as a repeatable test with frame dumps (README).
- `ps5rs`, also in Rust, describes an SDK knowledge database and a firmware catalogue of modules and exports,
  and is closed as a precaution (README, not linked).
- Scams: the wiki warns of portals that put installers behind surveys or "fake BIOS/key prompts"
  and of spoofed repositories that ship info-stealers
  (Emulation General, "PlayStation 5 emulators"; lead),
  and press reports name fake copies of KytyPS5 and AnyPS5 (web search, 2026-11-25; lead).
  One iOS repository the wiki lists has an empty README and a single release made the day it was created
  (`hernan0078/MagnusPS5`, metadata; not linked, closed because no source is shown).
- No project read models the PS5 Pro, and the wiki records no emulator's support for the Pro's features
  (Emulation General, "PlayStation 5 emulators"; lead).

### Mobile ports, frontends, and stores

- [Bachata S4][bachata] is "Experimental PlayStation 4 emulation for ARM64 Android devices.
  Powered by shadPS4, FEX, a managed Linux runtime, and Vulkan" (README); its iOS build was released on 2026-11-17
  (release metadata).
- It is sold: "$7.49" on [Google Play][bachata-play], with "500+" downloads,
  and ₹1,999 on the [App Store][bachata-apple].
  Both listings avoid the PlayStation name and speak of "homebrew";
  the App Store listing speaks of games "legally dumped",
  and Play of "legally acquired homebrew files and application dumps" (same listings).
  The README says it "does not distribute games, firmware, decryption keys,
  licenses" and points to a separate repository for the client's source, `zenithblue-oss/shadps4-arm64`,
  which returns HTTP 404 (observed), so it is closed and not linked.
  A sold build whose stated source is gone does not show GPL compliance (inference, recorded as its risk).
- [sharpdroid][sharpdroid] runs SharpEmu on Android through FEXCore (README).
  Prosperity has Android at its tier 2.
- No libretro core exists for any PS3, PS4, or PS5 emulator found;
  libretro's only PS3-named repository is a PS1 emulator for the PS3
  (GitHub search of the libretro organisation, 2026-11-25).
  Inclusion in EmuDeck or ES-DE was not checked, and no project is on Steam (store searches, 2026-11-25).

### Sony's own emulation

- The PS3's firmware carries Sony's emulators for PS1 games, for PS2 games on some models, and for PSP titles
  (Emulation General, "PlayStation 3 emulators"; lead); the models' PS2 support is in [R1-08][r108-ps].
- Sony offers PS3 games on later consoles only by streaming:
  its 2022 announcement of PlayStation Plus Premium lists "PS3 games available via cloud streaming",
  beside classics of the PS1, PS2, and PSP "available in both streaming and download options"
  ([PlayStation Blog, 29 March 2022][psb-2022]).
  So Sony ships no PS3 emulator on the PS4 or PS5 (inference; Sony gives no reason).

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Encryption is on everything a game needs.
  Game executables and data are encrypted on the PS3 (ChonkyStation3 README), and its firmware's modules are too (same).
  PS4 packages are signed, as Sony's 2020 notice on "unsigned or fPKGs" shows
  ([GitHub DMCA, 2020-07-30][dmca-2020]),
  and PS4 data encrypted, as its 2023 notice on "access keys" that let people "access encrypted information" shows
  ([GitHub DMCA, 2023-11-29][dmca-2023]); RustPS5Emu's README implies the same for the PS5.
  So [R0-02 option 1][r002-o1] fits none of these consoles.
- Sony's licences tie its system software to its own console.
  The PS3 agreement, version 1.5, licenses it "solely for personal,
  non-commercial use on the PS3™ system" and bars "use of tools to bypass, disable, or circumvent any encryption"
  ([PS3 licence][eula-ps3]);
  the PS4 and PS5 agreements grant use "solely on your PS4 system" and the same for the PS5, and bar downgrading
  ([PS4 licence][eula-ps4]; [PS5 licence][eula-ps5], version 2.0).
  None of the three contains the word "emulate"; the game licence bars the user to "emulate the Software"
  ([PlayStation Software Usage Terms][sw-eula]), as [R0-02][r002-terms] records.
- Sony publishes the update files for all three consoles on its support pages,
  which are not linked because they hold download buttons
  (`playstation.com/en-us/support/hardware/ps3/system-software/` and the PS4 and PS5 pages; research log).
  RPCS3 uses the PS3 file, which is [R0-02 option 6][r002-o6]; no PS4 or PS5 project found uses Sony's file,
  and using any of them needs decryption (ChonkyStation3 README; inference for the PS4 and PS5).
- The projects split along R0-02's options
  ([R0-02, "How projects handle firmware and games"][r002-how]):
  [option 2][r002-o2], user keys, for Nucleus and Orbital; [option 3][r002-o3], for RPCS3 by embedded keys (inference),
  and for ChonkyStation3 and the other PS4 and PS5 projects by decrypted input; [option 4][r002-o4], dumped modules,
  for ChonkyStation3, shadPS4, ChonkyStation4, GPCS4, Prosperity, Obliteration, psOff, and Spine;
  and [option 5][r002-o5], HLE, for fpPS4, Kyty, SharpEmu, KytyPS5, AnyPS5, RustPS5Emu, and the rest of shadPS4.
  A decrypted PS4 or PS5 dump needs a jailbroken console (from memory), and RAP files come from a modified PS3
  (Emulation General, RPCS3 page; lead), so each route starts with a circumvention by the user (inference).
- Sony's GitHub notices target circumvention, keys, and leaked code, never an emulator.
  A search of every notice file in `github/dmca` whose name has "sony" or "playstation",
  and code searches there for rpcs3, shadps4, fpPS4, gpcs4, and obliteration, found none naming a PS3, PS4,
  or PS5 emulator to 2026-11-25 (research log), extending [R0-02, "Who has been reached"][r002-who].
  The notices found:

| Date | Sender | Against | Theory or words |
|---|---|---|---|
| [2011-01-27][dmca-2011a] | SCEA | PS3 tools and a key repository | trafficking under § 1201(a)(2), 1201(b)(1) |
| [2011-02-03][dmca-2011b] | SCEA | 1,159 copies of fail0verflow's tools and one other | § 1201; asks for identities |
| [2011-06-07][dmca-2011c] | SCEA | a repository of Sony kit material | "proprietary code and firmware"; trade secret |
| [2017-01-12][dmca-2017] | SIE | copies of DUALSHOCK 4 firmware | copyright in the firmware |
| [2019-09-06][dmca-2019] | agent for PlayStation | code said to be PS5 system software | "CONFIDENTIAL" |
| [2020-07-30][dmca-2020] | SIE Europe | a PS4 exploit and game torrents | § 1201(a)(1)(A); exceptions "inapplicable" |
| [2023-11-29][dmca-2023] | SIE | a repository of Bloodborne data | "Bloodborne's access keys" |
| [2026-11-13][dmca-2026] | Unity | its PS5 support code | NDA code for Sony's PS5 programme |
| [2026-11-19][dmca-2026b] | Unity | another copy of the same code | the same |

- Sources: each notice in GitHub's archive, read raw.
  The key, kit, NDA, exploit, and tool repositories they name are closed in the register, with no link;
  the 1,159 copies of fail0verflow's tools are not registered one by one, so they stay walled and unopened.
  The one counter-notice found, of 2011,
  said "the exposure of sloppy crypto implementation on Sony's part in no way infringes on copyright"
  ([GitHub DMCA, 2011 counter-notice][dmca-2011-cn]).
- The 2020 notice says the senders "carefully considered a range of possible exceptions to the DMCA,
  and fair use arguments ... and found them inapplicable"
  ([GitHub DMCA, 2020-07-30][dmca-2020]), the fullest statement of Sony's § 1201 view for the PS4 found.
  The 2023 notice concerns Bloodborne, the game shadPS4's README shows first, and targets game data and keys,
  not the emulator ([GitHub DMCA, 2023-11-29][dmca-2023]).
- Sony v Hotz, which R0-02 records ([R0-02, "Keys"][r002-keys]), ended as follows by its docket: filed 11 January 2011,
  a restraining order on 27 January, a stipulated consent judgment and permanent injunction against Hotz,
  and dismissal without prejudice of the other defendants on 11 and 12 April 2011
  ([Hotz docket][hotz-docket], entries 1, 50, 127 to 129).
  Sony's joint statement quotes its general counsel:
  "Our motivation for bringing this litigation was to protect our intellectual property and our consumers"
  ([PlayStation Blog, 11 April 2011][psb-hotz]).
- In Australia, Sony won an injunction against importers of a PS3 jailbreak dongle in August 2010, extended in September
  ([The Register, 27 August 2010][reg-2010a]; [6 September 2010][reg-2010b]; secondary);
  in Spain, GamesRadar reported in December 2010 that a court found the shops selling such a device did nothing illegal
  and ordered Sony to pay the seller ([GamesRadar, 18 December 2010][gamesradar]; secondary,
  citing the Barcelona Reporter), as [Wikipedia, "PlayStation 3 Jailbreak"][w-jb] also records (tertiary).
- The one action against an emulator was Atlus's.
  Atlus says it "issued a DMCA takedown notice involving emulation developer group RPCS3 and their Patreon page"
  ([Atlus, "Atlus and emulation"][atlus], 26 September 2017).
  Ars Technica reported that RPCS3 removed every reference to Persona 5 from the page,
  and that Atlus cited the circumvention a user needs and RPCS3's general instructions for dumping a game
  ([Ars Technica][ars]; secondary, quoting Atlus at second hand).
  That touches [R0-02 option 7][r002-o7] (guides) and [option 8][r002-o8] (money).
  RPCS3's README still links its Patreon page, and shadPS4's a Ko-fi page (READMEs).
- Notebookcheck reported in October 2026 that "Sony has not commented on recent piracy and emulator advancements",
  after a PS5 jailbreak storefront and its GitHub page vanished ([Notebookcheck, 14 October 2026][nbc]; secondary).
  No Sony statement on emulators was found, as [R0-02, "Makers' statements on emulators"][r002-stmt] found
  (web search, 2026-11-25).
- No prose read mentions a boot-logo check on these consoles; lock-out is by signatures and encryption
  (inference from the findings above), so [R0-02 option 16][r002-o16] does not arise.
- Names and money: aPS3e ([Play listing][aps3e-play]), ARMSX3 ([README][armsx3]), KB-RPCS3 ([README][kb-rpcs3]),
  Bachata S4 ([README][bachata]), and SharpEmu ([site][sharpemu-site]) disclaim affiliation with Sony,
  and RPCS3's README does not; many names use "PS3", "PS4", or "PS5"
  ([R0-02 option 14][r002-o14]);
  SharpEmu's site says "Cover images are served from the PlayStation Store"
  ([option 15][r002-o15]);
  Bachata S4 is sold and aPS3e has a paid build
  ([option 8][r002-o8]), both through Google Play, and Bachata S4 through the App Store too ([option 9][r002-o9]).
- Of R0-02's options, 2 to 10, 14, and 15 apply to this family, 1 and 16 do not, and the patent options, 11 to 13,
  were not assessed (inference).

### How hard the family is to emulate

- The hardware is in [R1-04][r104-cell]
  (the Cell, its SPEs' DMA, and the x86-64 consoles)
  and [R1-04, "Operating systems, services, and security"][r104-os]; this survey adds what the emulators' prose shows.
- Execution splits by console.
  The PS3 needs a translator on every host
  (RPCS3, Nucleus, ps3recomp);
  the PS4 and PS5 run guest x86-64 natively with patching (shadPS4, SharpEmu, KytyPS5, fpPS4), virtualised
  (Orbital, Obliteration),
  or relinked (AnyPS5), and reach Arm hosts through FEX or Rosetta 2
  (Prosperity, Bachata S4, shadPS4 on macOS), as [R1-04][r104-exec] expects.
- The system interface is the larger task.
  Every working PS4 and PS5 project draws the line at the system libraries, as [R1-04][r104-boundary] recommends,
  and those that run every Sony module or its whole system software
  (Prosperity, RPCSX, Obliteration) are the least advanced (findings above).
  On the PS4, psdevwiki counts Sony's own system calls up to 677 above FreeBSD 9's, as of firmware 6.51
  ([R1-04, "PlayStation 4 and 5"][r104-ps45]).
- The GPU work is shared: SPIR-V shader translation is named by GPCS4, KytyPS5, AnyPS5, RustPS5Emu,
  and Prosperity (READMEs) and SharpEmu
  (release notes, verification pass),
  PM4 command processing by GPCS4 and shadPS4, and shadPS4's prose names a shader recompiler without a target
  (README; v0.21.0 post).
  AMD's index lists instruction-set guides from GCN 3 and Vega to RDNA 4 and none for GCN 1 or 2
  ([AMD GPUOpen, documentation index][gpuopen]; observed),
  so the PS4's own GPU generation has no maker manual there, while the PS5's RDNA 2 does.
- Shared memory between CPU and GPU is hard:
  shadPS4's readbacks are experimental and off by default because they cost speed and accuracy
  ([Wikipedia, "ShadPS4"][w-shadps4]; tertiary), which bears out [R1-04][r104-coherence].
- Revisions matter little so far: shadPS4 and psOff's successor model the PS4 Pro's mode, and nothing models the PS5 Pro
  (findings above), so [R1-04's recommendation of the base model][r104-models] matches practice (inference).

### Tests and published results

| Suite | Tier | Oracle | Emulator results |
|---|---|---|---|
| [ps3autotests][ps3at], RPCS3's copy | walled | "preferably from a real PS3" | none published |
| [ps3autotests][ps3at-alex], the original | walled | the same | Nucleus ran it in CI (0.0.1 notes) |
| KytyPS5's regression tests | walled | the emulator's own expectations | run locally with ctest |
| RustPS5Emu's input replays | walled | its own earlier runs | its own |
| `ps5rs` fixtures | closed | its author's expectations | its own |

- Sources: each README; tiers from the [register][register]. ps3autotests gives each test "_file.expected_:
  File with the expected TTY output, preferably from a real PS3", and its sections on building and running are "TODO"
  ([ps3autotests README][ps3at]).
  The original says its tests build with Sony's kit or an unofficial one, and recommends PSL1GHT
  ([original README][ps3at-alex]), so a built test may carry Sony kit code, and only results are used (inference).
- No PS4 or PS5 suite with a console oracle was found
  (GitHub repository searches for PS4 and PS5 autotests, hardware tests, and homebrew tests, and a web search,
  2026-11-25), consistent with [R1-04, "Tests and sources"][r104-tests].
  The [OpenOrbis toolchain][openorbis] remains the clean way to build PS4 test programs (R1-04).
- Published results are game lists, not tests: RPCS3's and SharpEmu's (above); shadPS4's,
  with 300 titles in game and 167 playable as of November 2026
  ([Wikipedia, "ShadPS4"][w-shadps4]; tertiary); and the wiki's counts for the rest (Emulation General; lead).

## Options and trade-offs

The options answer four separate questions, and the recommendation takes one answer to each.

### Which emulators the roadmap studies

- **What:** the [roadmap][studies] has no study for this family; add a study of [RPCS3][rpcs3], of [shadPS4][shadps4],
  of both, or of an open project such as [fpPS4][fpps4] or [Kyty][kyty].
- **Costs:** RPCS3 and shadPS4 are walled, so their code needs a reader session,
  and their HLE of Sony's libraries and kernel is closed even then; RPCS3 also carries decryption keys (inference),
  a key hazard.
  The open projects are small or dormant.
- **Gains:** RPCS3 is the only mature PS3 emulator and the parent of every port;
  shadPS4 is the reference for PS4 execution, GPU command processing, and shader translation;
  fpPS4's and Kyty's loaders, GPU, and shader code can be read directly, though their HLE is closed.
- **Used by:** the roadmap's practice for other families, such as [R1-41][studies] for a walled emulator.

### Which oracles the family's cores are tested against

- **What:** [ps3autotests][ps3at] for the PS3;
  homebrew tests built with [OpenOrbis][openorbis] and run on a console for the PS4; game compatibility lists;
  or another emulator's output.
- **Costs:** ps3autotests' outputs are only "preferably" from a console, and its binaries may hold kit code;
  console runs need a console able to run homebrew, which for the PS4 means a jailbreak,
  and for a PS3 without OtherOS custom firmware or an exploit
  (both from memory),
  a circumvention by the owner either way; game lists say nothing about why a game fails;
  another emulator only reproduces itself.
- **Gains:** ps3autotests exists and is runnable; homebrew tests are clean by construction;
  game lists show what users see.
- **Used by:** [Nucleus][nucleus] (ps3autotests in CI); [KytyPS5][kytyps5] and [RustPS5Emu][rps5e]
  (their own checks); every project (game lists).

### How firmware and encrypted input are handled

- **What:** HLE of every library, with no Sony module; Sony's published PS3 modules as an option for each library;
  only input the user has already decrypted; or user-supplied keys.
- **Costs:** HLE is a large versioned interface ([R1-04][r104-hle]); Sony's PS3 modules need decryption,
  so the second option needs keys or the user's decrypted copies; decrypted input presumes a circumvention by the user;
  user keys are R0-02's [option 2][r002-o2] with its risk.
- **Gains:** HLE needs nothing from Sony; Sony's modules reproduce its behaviour;
  decrypted input keeps every key out of Rustalgia
  (R0-02's preferred route for an encrypted system, [option 3][r002-o3]).
- **Used by:** KytyPS5, [AnyPS5][anyps5], and RustPS5Emu (HLE); RPCS3
  (Sony's modules or HLE, per library, with embedded keys by inference);
  [ChonkyStation3][chonky3] and shadPS4 (the user's decrypted or dumped modules).

### How far the family is pursued

- **What:** the PS3 as the family's target with the PS4 and PS5 later; all three together; or the PS3 only.
- **Costs:** the PS4 and PS5 have no oracle, no project that runs Sony's whole system software beyond an early stage,
  and no commercial game a user can run without first circumventing the console's protection
  (findings above); the PS3 needs the Cell's translators and the SPU model.
- **Gains:** the PS3 has a test suite, maker-published hypervisor documents ([R1-04][r104-os]),
  and a published firmware file that an emulator already uses
  ([R0-02 option 6][r002-o6]); the PS4 and PS5 have the larger active communities.
- **Used by:** every project found targets one console, except Kyty, [RPCSX][rpcsx], [Prosperity][prosperity],
  and [SharpEmu][sharpemu], which pair the PS4 and PS5.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** add two studies to the roadmap, RPCS3 and shadPS4, each by a reader session limited to architecture,
  and fpPS4 or Kyty only as a direct-reading supplement.
  RPCS3's study must first find and register its decryption code as closed, because by inference it carries the keys.
- **Oracles:** ps3autotests' results, re-run on a PS3 where an output was not made on one,
  and for the PS4 only OpenOrbis-built tests; both console runs need a console the owner has modified
  (from memory), which the owner weighs with [R2-12][phase2]; game lists serve as regression aids, never as oracles.
- **Firmware:** HLE by default, with Sony's PS3 modules accepted only as the user's own decrypted copies,
  as ChonkyStation3 does, and no key in Rustalgia; decide with [R2-12][phase2] and R0-02's options 3 and 6.
- **Scope:** the PS3 first, and the PS4 and PS5 only after R2-12 and [R6-01][phase6] weigh decrypted input,
  because only the PS3 has a test suite, maker documents, and a published firmware file that an emulator uses.

## Implications for Rustalgia

- [R2-12][phase2] must decide whether Rustalgia accepts decrypted input and the user's decrypted modules,
  because every route into this family starts with the user decrypting something (Legal exposure).
- Any reader study of [RPCS3][rpcs3] needs a register line closing its decryption code before it opens anything,
  and the guard's prefix match on `shadps4-emu/shadps4` needs a fix so that the Qt launcher can be evaluated.
- [R2-01][phase2] can take RPCS3's interpreter and LLVM pairing, and [Nucleus][nucleus]'s own intermediate form,
  as the two designs for the Cell, and [shadPS4][shadps4]'s native execution with patching as the PS4 design.
- [R2-05][phase2] should treat GCN and RDNA to SPIR-V translation as one problem across the PS4, PS5, and Xbox,
  noting that AMD's index lacks the PS4's GPU generation.
- [R2-15][phase2] should adopt [ps3autotests][ps3at]' results and add console-run homebrew tests,
  because no other oracle exists.
- RPCS3's GPL-2.0-only licence bars its code from Rustalgia under [ADR 0002][adr2] whatever its tier,
  as [KB-RPCS3][kb-rpcs3]'s README states for its own GPL-3.0 parts.

## Open questions

- Which [ps3autotests][ps3at] expected outputs were made on a console?
  Running the suite on a PS3 that runs homebrew, through [R5-05][phase5]'s runner, would answer it,
  if the owner accepts the modified console that needs (from memory).
- Where in [RPCS3][rpcs3]'s repository are its decryption keys?
  A file listing in a reader session, before any code is read, would answer it.
- Does RPCS3's quickstart also ask for an account file for digital games?
  Reading the quickstart once the `rpcs3.net` line merges as open, without following its dumping links.

## Sources

Every source below was read on 2026-11-25, as raw text, unless an entry says otherwise.
Repository READMEs are pinned by the blob read or by the release named; Wikipedia links are pinned to the revision read.
Closed addresses are in code spans, with the reason.

Repository documents:

- [ADR 0002][adr2]; [ADR 0006][adr6]; [research guide][guide]; [research roadmap][roadmap]; [source register][register].
- [R0-02, legal baseline][r002]; [R0-05, "PlayStation family"][r005-ps]; [R1-04, primer][r104];
  [R1-08, catalogue][r108-ps].

PS3 emulators and ports, prose only:

- [RPCS3 README][rpcs3] (blob `6e59bdb5`); RPCS3 on Flathub,
  [appstream][fh-rpcs3] (0.0.43-20376) and [statistics][fh-rpcs3-stats]; [RPCS3 site][rpcs3-site], refused
  (HTTP 403, Cloudflare); `wiki.rpcs3.net`, refused (HTTP 403), unread, so walled and not linked.
- [aPS3e README][aps3e] (blob `fb09a505`); [aPS3e on Google Play][aps3e-play]; [aPS3e site][aps3e-site].
- [ARMSX3 README][armsx3] (blob `0afa60f5`); [RPCSX-UI-Android README][rpcsx-ui]
  (blob `e500659a`); [rpcs3-xbox README][rpcs3-xbox] (blob `608df83b`); [KB-RPCS3 README][kb-rpcs3] (blob `359a6103`).
- [Nucleus README][nucleus] (blob `239a89f3`) and [releases][nucleus-rel]
  (0.0.1 to 0.1.0); `github.com/AlexAltea/nucleus/blob/master/docs/user/keys.md`, not opened: key instructions.
- [ChonkyStation3 README][chonky3] (blob `49f99781`); [allity README][allity] (blob `5d99186c`).
- `github.com/nongeneric/ps3emu`, README only, not linked: no licence; [ps3emu site][rcebits],
  index and getting-started pages.
- `github.com/sp00nznet/ps3recomp`, README and changelog (blob `6de88b52`) and licence, not linked: closed.

PS4 and PS5 projects, prose only:

- [shadPS4 README][shadps4] (blob `0161e221`); [contributing guide][shadps4-contrib]; [shadPS4 site][shadps4-site];
  [v0.21.0 post][shadps4-021]; shadPS4 on Flathub, [appstream][fh-shadps4] (0.20.0) and [statistics][fh-shadps4-stats];
  `github.com/shadps4-compatibility/shadps4-game-compatibility` README, not linked: no licence.
- [fpPS4 README][fpps4] (blob `86fde02d`); [fpPS4 site][fpps4-site]; [Kyty README][kyty]
  (blob `46accf22`);
  [GPCS4 README][gpcs4] (blob `419b9026`); [Orbital README][orbital]
  (blob `d9ec8ab6`); `github.com/AlexAltea/orbital-bios`, metadata only, not linked: replacement boot firmware.
- `github.com/obhq/obliteration` README, not linked: closed; [Obliteration site][oblit-site]; [uplift README][uplift]
  (blob `fbc496c9`).
- `github.com/devofspine/spine` licence file and `github.com/devofspine/spinedemo` metadata and README, not linked:
  binary only; [psOff README][psoff] (blob `a2e23313`); `github.com/SysRay/psOff_compatibility` README, not linked:
  no licence; [ChonkyStation4 README][chonky4] (blob `6c6f6099`); [RPCSX README][rpcsx] (blob `1debf02f`).
- [Prosperity README][prosperity] (blob `67f4c1ff`); [SharpEmu README][sharpemu]
  (blob `5c2d4875`, v0.0.8-ember),
  [contributing guide][sharpemu-c], [site][sharpemu-site], and [FAQ][sharpemu-faq]; [KytyPS5 README][kytyps5]
  (blob `3c0b5452`);
  [AnyPS5 README][anyps5] (blob `5e8a0904`, v0.1.5); [RustPS5Emu README][rps5e]
  (blob `0a99058e`);
  `github.com/claimore22/ps5rs` README, not linked: closed; `github.com/hernan0078/MagnusPS5`, metadata only,
  not linked: no source.
- [Bachata S4 README][bachata] (blob `a44918cb`); [Google Play listing][bachata-play];
  [App Store listing][bachata-apple], India storefront, version 1.2.0; `github.com/zenithblue-oss/shadps4-arm64`,
  HTTP 404, not linked: gone; [sharpdroid README][sharpdroid] (blob `ff6f5134`).

Tests:

- [RPCS3 ps3autotests README][ps3at] (blob `80c409b4`); [original ps3autotests README][ps3at-alex]
  (blob `5162dddd`); [OpenOrbis toolchain][openorbis].

Sony:

- [PS3 System Software License Agreement][eula-ps3], version 1.5; [PS4 System Software License Agreement][eula-ps4],
  versions 2.2 and 2.3; [PS5 System Software License Agreement][eula-ps5], version 2.0;
  [PlayStation Software Usage Terms][sw-eula].
- Sony's system software support pages for the PS3, PS4, and PS5 under `playstation.com/en-us/support/hardware/`,
  not linked: download buttons.
- PlayStation Blog: [11 April 2011][psb-hotz], updated 10 January 2019; [29 March 2022][psb-2022].

Takedowns and courts:

- GitHub DMCA notices: [2011-01-27][dmca-2011a]; [2011-02-03][dmca-2011b] and its [counter-notice][dmca-2011-cn];
  [2011-06-07][dmca-2011c]; [2017-01-12][dmca-2017]; [2019-09-06][dmca-2019]; [2020-07-30][dmca-2020];
  [2023-11-29][dmca-2023]; [2026-11-13][dmca-2026]; [2026-11-19][dmca-2026b].
- Sony v Hotz, N.D.
  Cal.
  No. 3:11-cv-00167, [docket][hotz-docket], entries only.
- [Atlus, "Atlus and emulation"][atlus], published 2017-09-26.

Other references:

- [GNU licence list][gnu], dated 2026-04-22; [AMD GPUOpen, documentation index][gpuopen].

Wikipedia (tertiary):

- ["RPCS3"][w-rpcs3]; ["ShadPS4"][w-shadps4]; ["PlayStation 3 Jailbreak"][w-jb].
  "PlayStation 3 system software", which R1-04 and R1-08 cite,
  mentions leaked PS3 kits and is closed here as a precaution, so this note does not use it:
  `en.wikipedia.org/wiki/PlayStation_3_system_software`.
  Those notes link it by revision (`oldid=1386319155`), a form the register's pattern cannot match,
  so their links need a follow-up change that turns them into code spans.

Press and wikis (secondary, or leads):

- [Ars Technica, 27 September 2017][ars]; [The Register, 27 August 2010][reg-2010a] and [6 September 2010][reg-2010b];
  [GamingOnLinux, 10 September 2021][gol-spine]; [Tom's Hardware, 15 July 2026][toms];
  [Notebookcheck, 14 October 2026][nbc]; [GamesRadar, 18 December 2010][gamesradar].
- Emulation General wiki (leads): ["PlayStation 3 emulators"][egw-ps3], revision 152633;
  ["PlayStation 4 emulators"][egw-ps4], revision 152431; ["PlayStation 5 emulators"][egw-ps5], revision 152365;
  its RPCS3 page, revision 151506, at `emulation.gametechwiki.com/index.php/RPCS3`, not linked: closed as a precaution.

[adr2]: ../../adr/0002-license-under-gpl-3-0-or-later.md
[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-yuzu]: R0-02-legal-baseline.md#game-sites-and-the-yuzu-case
[r002-terms]: R0-02-legal-baseline.md#makers-system-software-and-licence-terms
[r002-stmt]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-keys]: R0-02-legal-baseline.md#keys
[r002-how]: R0-02-legal-baseline.md#how-projects-handle-firmware-and-games
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o2]: R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys
[r002-o3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o6]: R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-o9]: R0-02-legal-baseline.md#9-choose-where-the-project-is-hosted-and-distributed
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o15]: R0-02-legal-baseline.md#15-use-no-maker-logos-or-game-imagery-or-use-them-under-a-stated-position
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r005-ps]: R0-05-source-map.md#playstation-family
[r104]: R1-04-primer-modern.md
[r104-cell]: R1-04-primer-modern.md#the-cell-in-the-playstation-3
[r104-os]: R1-04-primer-modern.md#operating-systems-services-and-security
[r104-ps45]: R1-04-primer-modern.md#playstation-4-and-5
[r104-tests]: R1-04-primer-modern.md#tests-and-sources
[r104-hle]: R1-04-primer-modern.md#emulate-the-operating-system-at-high-level-or-run-the-makers-system-software
[r104-boundary]: R1-04-primer-modern.md#where-the-high-level-boundary-sits
[r104-exec]: R1-04-primer-modern.md#how-guest-code-is-executed
[r104-coherence]: R1-04-primer-modern.md#coherence-between-cpu-and-gpu-memory
[r104-models]: R1-04-primer-modern.md#models-modes-and-revisions-to-present
[r108-ps]: R1-08-catalogue-modern.md#playstation-family
[rpcs3]: https://github.com/RPCS3/rpcs3
[rpcs3-site]: https://rpcs3.net/
[fh-rpcs3]: https://flathub.org/api/v2/appstream/net.rpcs3.RPCS3
[fh-rpcs3-stats]: https://flathub.org/api/v2/stats/net.rpcs3.RPCS3
[aps3e]: https://github.com/aenu1/aps3e
[aps3e-play]: https://play.google.com/store/apps/details?id=aenu.aps3e
[aps3e-site]: https://aenu.cc/aps3e/
[armsx3]: https://github.com/ARMSX2/ARMSX3
[rpcsx-ui]: https://github.com/RPCSX/rpcsx-ui-android
[rpcs3-xbox]: https://github.com/emelin2004/rpcs3-xbox
[kb-rpcs3]: https://github.com/kamb205/KB-RPCS3
[nucleus]: https://github.com/AlexAltea/nucleus
[nucleus-rel]: https://github.com/AlexAltea/nucleus/releases
[chonky3]: https://github.com/liuk7071/ChonkyStation3
[rcebits]: https://rcebits.com/ps3emu/
[allity]: https://github.com/allkern/allity
[ps3recomp-note]: #static-recompilation
[shadps4]: https://github.com/shadps4-emu/shadPS4
[shadps4-contrib]: https://github.com/shadps4-emu/shadPS4/blob/main/CONTRIBUTING.md
[shadps4-site]: https://shadps4.net/
[shadps4-021]: https://shadps4.net/blog/shadps4-v0210-codename-until-mavethee-dawn
[fh-shadps4]: https://flathub.org/api/v2/appstream/net.shadps4.shadPS4
[fh-shadps4-stats]: https://flathub.org/api/v2/stats/net.shadps4.shadPS4
[fpps4]: https://github.com/red-prig/fpPS4
[fpps4-site]: https://fpps4.net/
[kyty]: https://github.com/InoriRus/Kyty
[gpcs4]: https://github.com/Inori/GPCS4
[orbital]: https://github.com/AlexAltea/orbital
[oblit-site]: https://www.obliteration.net/
[uplift]: https://github.com/idc/uplift
[gol-spine]: https://www.gamingonlinux.com/2021/09/ps4-emulator-spine-gets-a-new-demo-release/
[psoff]: https://github.com/SysRay/psOff_public
[chonky4]: https://github.com/liuk7071/ChonkyStation4
[rpcsx]: https://github.com/RPCSX/rpcsx
[prosperity]: https://github.com/Force67/prosperity
[sharpemu]: https://github.com/sharpemu/sharpemu
[sharpemu-c]: https://github.com/sharpemu/sharpemu/blob/main/CONTRIBUTING.md
[sharpemu-site]: https://sharpemu.app/
[sharpemu-faq]: https://sharpemu.app/faq/
[kytyps5]: https://github.com/KytyPS5/KytyPS5
[anyps5]: https://github.com/boykopovar/AnyPS5
[rps5e]: https://github.com/keklick1337/rps5e
[bachata]: https://github.com/JICA98/Bachata-S4
[bachata-play]: https://play.google.com/store/apps/details?id=com.bachatas4.android
[bachata-apple]: https://apps.apple.com/in/app/bachatas4-emulator/id6822708927
[sharpdroid]: https://github.com/mircowuffwuff/sharpdroid
[toms]: https://www.tomshardware.com/video-games/playstation/ps5-emulation-ramps-up-in-wake-of-sonys-end-to-physical-media-ps5-titles-now-booting-across-different-emulators-with-rapid-community-development-for-both-2d-and-3d-games
[ps3at]: https://github.com/RPCS3/ps3autotests
[ps3at-alex]: https://github.com/AlexAltea/ps3autotests
[openorbis]: https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain
[eula-ps3]: https://doc.dl.playstation.net/doc/ps3-eula/ps3_eula_en.html
[eula-ps4]: https://doc.dl.playstation.net/doc/ps4-eula/ps4_eula_en.html
[eula-ps5]: https://www.playstation.com/en-us/legal/ps5-ssla/
[sw-eula]: https://www.playstation.com/en-us/legal/software-eula/
[psb-hotz]: https://blog.playstation.com/2011/04/11/settlement-in-george-hotz-case/
[psb-2022]: https://blog.playstation.com/2022/03/29/all-new-playstation-plus-launches-in-june-with-700-games-and-more-value-than-ever/
[dmca-2011a]: https://github.com/github/dmca/blob/master/2011/2011-01-27-sony.markdown
[dmca-2011b]: https://github.com/github/dmca/blob/master/2011/2011-02-03-sony.markdown
[dmca-2011-cn]: https://github.com/github/dmca/blob/master/2011/2011-02-03-sony-counternotice.markdown
[dmca-2011c]: https://github.com/github/dmca/blob/master/2011/2011-06-07-sony.markdown
[dmca-2017]: https://github.com/github/dmca/blob/master/2017/2017-01-12-Sony.md
[dmca-2019]: https://github.com/github/dmca/blob/master/2019/09/2019-09-06-playstation.md
[dmca-2020]: https://github.com/github/dmca/blob/master/2020/07/2020-07-30-Sony.md
[dmca-2023]: https://github.com/github/dmca/blob/master/2023/11/2023-11-29-sony.md
[dmca-2026]: https://github.com/github/dmca/blob/master/2026/11/2026-11-13-unity.md
[dmca-2026b]: https://github.com/github/dmca/blob/master/2026/11/2026-11-19-unity.md
[hotz-docket]: https://archive.org/download/gov.uscourts.cand.235965/gov.uscourts.cand.235965.docket.xml
[atlus]: https://atlus.com/atlus-and-emulation/
[gnu]: https://www.gnu.org/licenses/license-list.en.html
[gpuopen]: https://gpuopen.com/amd-gpu-architecture-programming-documentation/
[w-rpcs3]: https://en.wikipedia.org/w/index.php?oldid=1384344878
[w-shadps4]: https://en.wikipedia.org/w/index.php?oldid=1387872217
[w-jb]: https://en.wikipedia.org/w/index.php?oldid=1384604905
[ars]: https://arstechnica.com/gaming/2017/09/atlus-wants-to-cut-off-a-ps3-emulator-because-it-runs-persona-5/
[reg-2010a]: https://www.theregister.com/2010/08/27/sony_oz_mod_chip_ban/
[reg-2010b]: https://www.theregister.com/2010/09/06/ps3_usb_mod_chip_dongle_case/
[gamesradar]: https://www.gamesradar.com/powned-sony-ordered-to-pay-restitution-to-ps-jailbreak-seller-in-spain/
[nbc]: https://www.notebookcheck.net/Sony-reportedly-shuts-down-free-PS5-game-store-accessed-with-console-jailbreak.1423408.0.html
[egw-ps3]: https://emulation.gametechwiki.com/index.php?oldid=152633
[egw-ps4]: https://emulation.gametechwiki.com/index.php?oldid=152431
[egw-ps5]: https://emulation.gametechwiki.com/index.php?oldid=152365
