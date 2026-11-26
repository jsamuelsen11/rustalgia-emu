---
title: "GameCube, Wii, and Wii U: family survey"
roadmap_item: R1-17
status: draft
date: 2026-11-25
---

# GameCube, Wii, and Wii U: family survey

## Summary

This note asks which emulators matter for the GameCube, Wii, and Wii U, what each one is and does,
how exposed the family is in law, and how hard it is to emulate.

[Dolphin][dolphin] is the GameCube and Wii emulator by every sign found
(stars, store downloads, and installs), and the base of every popular fork, port, and frontend core.
[Cemu][cemu] holds the same place for the Wii U, with [decaf-emu][decaf] as a dormant open-tier research emulator.
Two new emulators are written in Rust, both open tier: [Gecko][gecko]
(GameCube and Wii) and [Lazuli][lazuli] (GameCube); [pureikyubu][pureikyubu] continues the Dolwin line.
Nintendo runs GameCube games itself on Switch 2 through Nintendo Classics.
No published table compares any of these emulators on a hardware test suite.

Legal exposure centres on keys (inference).
GameCube discs reach an emulator as plain images, while Wii and Wii U content is encrypted.
Dolphin embeds the Wii common key, which drew the family's one enforcement act found, Nintendo's 2023 letter to Valve,
and decided in 2023 to keep it; Cemu asks the user for keys, or for its own decrypted format.
No takedown notice, letter, or suit names any other emulator of the family.

Beyond caches, GPU precision, shader stutter, and an undocumented Wii U GPU,
the family is hard for Rustalgia because the system software in the popular emulators is closed:
Dolphin's IOS and boot code, Cemu's and decaf-emu's high-level Cafe OS, and, for low-level audio,
the replacement DSP ROM.
For the owner to decide, the note recommends a Dolphin study that reads around those parts,
a Cemu study only when the Wii U is taken up, GameCube first with plain images,
decrypted input only for the Wii and Wii U, and the project's own tests on a Wii as the oracle.
This note is not legal advice.

## Scope

- Question: which emulators are popular or respected for the GameCube, Wii, and Wii U, and for each,
  what are its status, licence, tier, techniques, and hosts; what is the family's legal exposure;
  and how hard is it to emulate?
- Covered: the GameCube and the Panasonic Q, the Wii with the Wii Mini and the Korean model, and the Wii U,
  as [R1-07](R1-07-catalogue-sixth-generation.md#home-consoles) lists them; Nintendo's own emulation.
  The Triforce arcade board is left to [R1-25](../../roadmap/research.md#system-family-surveys),
  with only Dolphin's support for it noted here.
- Builds on: the hardware in [R1-03](R1-03-primer-sixth-generation.md)
  (its "GameCube, Wii, and Wii U" sections and options 1 to 11),
  the rows in R1-07, the law in [R0-02](R0-02-legal-baseline.md), and the hubs in
  [R0-05, "GameCube, Wii, Wii U, Switch, and Switch 2"](R0-05-source-map.md#gamecube-wii-wii-u-switch-and-switch-2).
  None of that is repeated here.
- How claims were checked, on 2026-11-25, in three passes.
  Repository status is GitHub metadata of that day: archived flag, last push, latest release, licence, and stars,
  so it is observed, not quoted.
  Research: three agents each covered a slice
  (emulators; frontends, phone apps, stores, and Nintendo's emulation; legal exposure and difficulty)
  and read every page as raw text with curl, a wiki's raw export, a web archive capture, or GitHub's licence, README,
  and release endpoints.
  The writer fetched again where the slices disagreed.
  Verification: fresh verifiers who saw only the note checked each claim, quotation, link, and register line.
  Fix: each disputed claim was checked against its source again before it was changed, weakened, or kept.
  No emulator source file, issue, or pull request was opened, in any tier, and no repository was cloned or searched.
- Hazards: no key, OTP, SEEPROM, eFuse, boot-stage, or common-key page was opened, nor any key list, keys file template,
  or page known to be a firmware, key, or game dumping guide; pages that link one are named,
  and the links were not followed.
  Cemu's FAQ and the Wii U firmware emulator's README were screened for 32-digit hexadecimal strings, and none held one
  (research log).
  The [Emulation General Wiki][egw]'s GameCube page links a game site's copy of a maker kit's emulator,
  so it is closed and named only in a code span; its Wii and Wii U pages hold neither, and stay leads.
  Wikipedia's page on Super Mario 3D All-Stars mentions a leak, so it is closed as a precaution and was not used.
  Dolphin's wiki page "Audio Emulation", cited by R1-03 and read in research, ends with a section on dumping DSP ROMs,
  which was not followed; verification found it, so the page is now closed as a dumping guide and named in a code span.
  Research log: the source guard blocked metadata of `SternXD/dolphin`, `dolphin-emu/fifoci`, `dolphin-emu/hwtests`,
  `openemu/openemu`, and `ioncodes/gamecube-wii-tests`, one of two reads of `libretro/dolphin`, a Codeberg API call,
  and every read of `geotale/gc-like-research`, whose name holds "search",
  which the guard takes for a search inside a closed repository (a false positive); no block was worked around.
  The permission system refused a listing of Dolphin's tree and a fetch of Dolphin's blog index.
  Every emulator line in the [register](../../../.claude/hooks/source-register.txt)
  that this survey covers was checked again; none changed its licence or tier, so those lines keep their old dates.

## Findings

### The emulators at a glance

Status, licence, and tier, with the tier as the [register](../../../.claude/hooks/source-register.txt) gives it
after this survey (observed, from metadata, release pages, and store listings; each row's sources are linked below).
"GPL-2.0+" for a Dolphin fork means the upstream `COPYING`,
which says the repository is "in aggregate" compatible with GPLv3, or, for Ishiiruka, Slippi's Ishiiruka, and MMJ,
a bare GPL-2.0 licence file with a README that says version 2 or later.

| Emulator | Tier | Licence | Latest release or last push | Input and system software | Hosts |
|---|---|---|---|---|---|
| Dolphin | open | GPL-2.0+ | 2609b, 2026-11-08 | GC plain; Wii decrypted by embedded key | Win, Mac, Linux, Android |
| Ishiiruka | open | GPL-2.0+ | pushed 2023-01-10 | As Dolphin | Win, Mac, Linux, Android |
| Slippi (two forks) | open | GPL-2.0+ | v3.7.0, 2026-11-17 | As Dolphin; Melee netplay | not read |
| PrimeHack | open | GPL-2.0+ | 1.0.9, 2026-06-09 | As Dolphin | Win, Mac, Linux; Android by others |
| Dolphin MMJ | open | GPL-2.0+ | pushed 2024-08-21 | As Dolphin | Android |
| Dolphin MMJR | closed | none now | gone (404) | As Dolphin | Android |
| Dolphin MMJR2 | open | GPL-2.0+ | pushed 2022-06-04 | As Dolphin | Android |
| libretro Dolphin | open | GPL-2.0+ | nightly, 2026-11-25 | IPL optional | libretro on six systems |
| DolphiniOS | open | GPL-2.0+ | v5.0.0b6, 2026-06-20 | As Dolphin | iOS, iPadOS; sideloaded |
| DolphinUWP | open | GPL-2.0+ | no releases | As Dolphin | Xbox, developer mode |
| OpenEmu's core | closed | none found | pushed 2026-03-14 | GameCube only | macOS |
| Cemu | open | MPL-2.0 | v2.6, 2025-02-06 | Own decrypted format, or user keys | Win, Linux; Mac experimental |
| Cemu Android port | open | MPL-2.0 | 0.5, 2026-04-25 | As Cemu | Android |
| decaf-emu | open | GPL-3.0+ | "release", 2023-11-09 | High-level Cafe OS (from memory) | Win, Linux |
| Wii U Firmware Emulator | open | MIT | pushed 2023-10-27 | User's boot1, OTP, SEEPROM, NAND, a key | Linux |
| Gecko | open | GPL-3.0 | pushed 2026-10-21 | IPL and Starlet replaced; Dolphin's DSP ROM | Win, Linux, Mac; browser |
| Lazuli | open | GPL-3.0 and MIT | pushed 2026-10-12; paused | IPL replaced; DSP low-level | Linux, Win; Mac partly |
| pureikyubu | open | CC0-1.0 | 20, 2026-10-07 | Can boot a boot ROM image | x86 and x64; macOS arm64 |
| gcube | walled | GPL-2.0, version unstated | about 2005 (lead) | Optional high-level mode | Linux, Win, Mac |
| Gekko | walled | GPL-2.0, version unstated | imported 2015-08-23 | not stated | not stated |
| beanwii, solstice | closed | none shown | beanwii pushed 2026-09-29 | not read | not read |

Under [ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier),
a reimplementation of system software is closed wherever it is hosted, and the rest of the repository keeps its tier.
This survey applies that to Dolphin's high-level IOS and its emulated GameCube boot,
to Cemu's and decaf-emu's high-level Cafe OS, to the IPL and Starlet replacements in Gecko and Lazuli,
and to every copy of Dolphin's replacement DSP ROM, in Dolphin's forks and in Gecko.
Dolphin's high-level DSP emulation keeps the repository's tier: it replaces microcode that each game uploads,
not a ROM of the console ([R1-03, audio](R1-03-primer-sixth-generation.md#gamecube-and-wii-1)),
as [R1-13](R1-13-nintendo-3ds-family.md#the-emulators-at-a-glance) decided for 3DS audio.
Only Cemu's path is known (`src/Cafe/OS`, from R1-03's listing), so it alone gets register lines;
the others are named in a register comment until a study finds their paths.

Popularity, as one rough sign (observed, 2026-11-25): Dolphin has 15,898 GitHub stars, Cemu 10,256, decaf-emu 1,280,
the Cemu Android port 1,254, PrimeHack 631, DolphiniOS 598, Gecko 435, Slippi's Ishiiruka 381, Ishiiruka 373,
Dolphin MMJ 336, Lazuli 275, pureikyubu 198, and libretro's Dolphin 132.
Dolphin's [Google Play listing][dolphin-play] shows 10M+ downloads,
and [Flathub][flathub-dolphin] counts 5,640,998 installs of Dolphin, about half of last month's from SteamOS,
against 326,107 of [Cemu][flathub-cemu] (Flathub counts updates, so both are rough).

### Dolphin

**History and licence.**
The [FAQ][dolphin-faq] says Dolphin "was first developed as closed source in 2003, and as open source since 2008",
released under GPLv2 and since "relicensed to GPLv2+".
Wikipedia dates the first release to 22 September 2003 by F|RES and ector, the source release to 13 July 2008,
and the relicensing to 4.0-6349 in 2015, and calls Dolphin the first GameCube emulator to run commercial games
([Wikipedia, "Dolphin (emulator)"][w-dolphin], secondary).
The [COPYING][dolphin-copying] file says "Most of Dolphin's original source code is licensed under GPLv2+",
and "Overall, in aggregate, the entirety of this repository is compatible with the GPLv3 license",
with per-file licence tags; GitHub detects no single licence (observed).
The Play listing offers the app "under the GNU GPL v3+", which fits that aggregate statement;
F-Droid and Flathub say GPL-2.0 or later (observed).

**Status.**
It was last pushed on 2026-11-25, has no GitHub releases, and tags 2609b of 8 November 2026 as its latest release,
after 2609 (24 September) and 2609a (8 October); the [download page][dolphin-download],
read in a capture because the live page refused scripts,
lists development build 2609-324 of 25 November 2026 and says releases come "every few months,
usually accompanied by a Progress Report".
The FAQ names Windows 10 and later, Linux, macOS 11 and later, and 64-bit Android 7.0 and later,
with builds for Windows on x64 and ARM64, macOS for ARM and x86, and Android;
it says "We no longer distribute Linux builds on our website", and Flathub carries x86-64 and AArch64 builds.
Other Unix-like systems "may work but are not officially supported".
F-Droid lags at 2603a ([F-Droid][dolphin-fdroid], observed).

**Techniques.**
From the [README][dolphin] (blob `4180d136`), the [libretro documentation][lr-dolphin], and the blog:

- CPU: an interpreter, a cached interpreter, and recompilers for x86-64 and ARM64 hosts, the recompiler by default
  (libretro core options name "JIT64/JITARM64").
  The FAQ says the demanding tasks that run in parallel are the CPU, GPU, and DSP, so Dolphin "only runs on 3 cores".
  Release 5.0-540 booted the last unbootable GameCube game,
  which needed full emulation of the CPU's block address translation; full MMU emulation is an option, "Enable MMU"
  ([Dolphin blog, "Booting the Final GameCube Game"][dolphin-final-gc], 2016-09-06).
- DSP: "HLE is faster but less accurate whereas LLE is slower but close to perfect",
  and LLE has interpreter and recompiler submodes (README).
  The wiki says high-level emulation needs no files,
  and that since 3.5-1031 a "developer-created DSP ROM" lets low-level emulation run without dumps,
  with "errors that a DSP ROM from a console does not have"
  (Dolphin wiki, "Audio Emulation", last edited 31 July 2021, capture of 2026-07-30; closed, see Scope).
  That replacement is closed in the register.
- Graphics: Direct3D 11 and 12 (Windows only), OpenGL, Vulkan, a null backend,
  and a software renderer "intended for debugging purposes only" (README); a Metal backend is recalled, not read
  (from memory).
  The hybrid mode renders a new configuration at once with a general shader while the specialised one compiles
  ([Dolphin blog, "Ubershaders"][dolphin-ubershaders], 2017).
- System software: Dolphin's emulation of Wii IOS was good enough by 2017 to use the Wii Shop Channel,
  which needed "a proper console ID and keys from a Wii"
  ([progress report, March 2017][dolphin-pr-2017-03]); that it emulates IOS at a high level is recalled (from memory).
  The IPL is skipped by default, and a "Load GameCube BIOS" option to boot a dumped IPL came in 5.0-3902
  ([progress report, May 2017][dolphin-pr-2017-05]).
  Some Wii games need files from a full NAND dump
  ([R1-07, "Patterns"](R1-07-catalogue-sixth-generation.md#patterns-across-the-catalogue)).
- Input formats: GCM and ISO, GCZ, CISO, WBFS, WIA, RVZ, and "NFS (Wii games purchased from the Wii U eShop)" (FAQ).
- Tools: a debugger pane, `dolphin-tool`
  (convert, verify, header, extract),
  FIFO recording and playback, netplay, and RetroAchievements (README; [RetroArch's guide][ra-gc]).
- Compatibility: the [list][dolphin-compat] rates 67.2% of titles "Perfect"
  and 30.7% "Playable", by users' ratings (observed).

**Project rules and incidents.**
Its contributing guide asks anyone who knows confidential GameCube, Wii,
or Triforce information "because you signed a non-disclosure agreement or
because you looked at leaked materials" not to contribute at all, and bars AI agents and LLM use for console behaviour,
as [R0-05](R0-05-source-map.md#gamecube-wii-wii-u-switch-and-switch-2) records.
Those rules bind Dolphin's contributors, not its readers; their premise,
that a model may carry leaked Nintendo material, bears on Rustalgia's agent-run research
([R0-06](R0-06-provenance-controls.md)) (inference).
The 2609 report says Dolphin's macOS build machine was compromised on 8 August 2026,
and that analysis of the builds made on it found no sign that they were altered
([progress report, release 2609][dolphin-pr-2609]).

**Triforce.**
"As of Dolphin 2512-395, Triforce support is here!":
crediar's long-running fork reached mainline through a pull request and code review;
the board boots through a modified GameCube IPL that loads Sega's Segaboot
([Dolphin blog, "Rise of the Triforce"][dolphin-triforce], 2026-02-16).
The post links a dumping guide, not followed; the board is [R1-25's](../../roadmap/research.md#system-family-surveys).

### Dolphin's forks and ports

Each from its README, licence file, site, or release notes, read as prose (observed):

- **[Ishiiruka][ishiiruka]** (Tino): a performance fork, GPLv2+ by its README, for Windows, Linux, macOS,
  and Android 5.0 and later; dormant since January 2023, and called superseded by the Emulation General Wiki (lead).
  Dolphin's Ubershaders post credits a fork with popularising asynchronous shader compilation,
  which draws nothing until the shader is ready.
- **Slippi**: [Ishiiruka's fork][slippi-ishiiruka] carries Super Smash Bros.
  Melee netplay and replays and a Rust submodule, not evaluated;
  a [port to mainline Dolphin][slippi-dolphin] says it is "even with upstream release 2506".
  Slippi's site serves only a script, so its claims were not read (research log).
- **[PrimeHack][primehack]**: "a Dolphin Emulator fork for the Metroid Prime series games" for Windows, Linux,
  and macOS, with an Android build "provided by the community".
- **Android forks**: [Dolphin MMJ][dolphin-mmj], by the author of Citra MMJ, dormant since August 2024;
  `Bankaimaster999/Dolphin-MMJR`, gone
  (HTTP 404, no reason found), so closed and unlinked; and [MMJR2][mmjr2], dormant since June 2022.
- **[libretro core][lr-dolphin-gh]**: Dolphin's README unchanged, pushed on 2026-11-25.
  Its [documentation][lr-dolphin] says the core "is licensed under GPLv2", against the licence file's "or later",
  which wins; it needs Dolphin's `Sys` folder, which RetroArch downloads, and calls a BIOS unnecessary for most games,
  though titles that rely on the system fonts, such as Star Fox Assault, can be unplayable without one.
  It supports OpenGL, Vulkan, and Direct3D 11, save states, rewind, and achievements, but not netplay or softpatching.
  The [buildbot][buildbot] builds it for Windows on x86-64, Linux and macOS on x86-64 and ARM64, iOS, tvOS, and Android
  (observed, file listings only),
  yet RetroArch's App Store listing names no GameCube or Wii core, and none of its 65 Steam cores is Dolphin
  ([RetroArch on the App Store][ra-ios]; [RetroArch on Steam][ra-steam]; observed).
  The `Sys` folder RetroArch downloads probably carries the replacement DSP ROM (inference, not checked).
- **[DolphiniOS][dolphinios]**: an iOS and iPadOS port, not affiliated with the Dolphin project;
  its [site][dolphinios-site] says "We are not able to submit DolphiniOS to the App Store or AltStore PAL",
  offers SideStore, AltStore Classic, an IPA, TrollStore, and jailbroken builds,
  and calls its stable 3.2.1 of September 2022 out of date beside the 5.0.0 betas.
  Its [FAQ][dolphinios-faq] says Apple "is preventing us from using JIT,
  which is necessary to provide good performance";
  its [beta page][dolphinios-beta] says beta 6 "adds support for JIT on non-jailbroken devices running iOS 26.6
  and iOS 27 beta", and its [JIT help][dolphinios-jit] names StikDebug, an App Store debugger, as the means,
  which an iTunes lookup of its store number no longer finds (observed).
  Its developer's [blog][oatmeal-appstore] says a request to Apple
  for JIT under the EU's Digital Markets Act was denied,
  and that the interpreter "is many times slower than the JIT recompiler"; a blog is a lead,
  except for the project's own decisions.
- **DolphinUWP** ([`SternXD/dolphin`][sternxd]): a third-party fork for Xbox One and Series consoles in developer mode,
  not in the Microsoft Store ([Wikipedia][w-dolphin], secondary); its licence file and README are upstream's unchanged,
  so only Wikipedia ties it to the port, and it has no GitHub releases.
- **OpenEmu's core**: `OpenEmu/dolphin` has no licence file or statement, so it is closed and unlinked.
  Its README says it is supported by neither the OpenEmu
  nor the Dolphin team; OpenEmu lists the GameCube, not the Wii ([OpenEmu][openemu]),
  and its [2.2 notes][openemu-22] call the port "absolutely unsupported by Dolphin emulator developers".

### Cemu and other Wii U emulators

**Cemu.**
Its [changelog][cemu-changelog] runs from "Initial cemu release" on 2015-10-13 to v2.0 of 2022-08-24,
"Cemu is now open-source!"; Wikipedia says Exzap and Petergov developed it closed and funded by donations,
and that it drew criticism for that ([Wikipedia, "Cemu"][w-cemu], secondary).
The [README][cemu] says it is under MPL-2.0, except the dependencies and "some individual files in the src folder,
as specified in those file headers"; the licence file is MPL-2.0 (observed).
It was last pushed on 2026-11-20, but its last release, v2.6, is of 2025-02-06, with Windows, Ubuntu, macOS,
and AppImage assets (observed); the README says it runs on "64-bit Windows, Linux & macOS",
with macOS "purely experimental" through MoltenVK and Rosetta,
and its [FAQ][cemu-faq] has "no plans to support Metal API directly".
On Android the FAQ says "Android is not on the roadmap", and that sites advertising Cemu APKs are a scam.

Techniques, from the changelog: a GPU7 shader decompiler to GLSL
(1.1.0, 2015),
a PowerPC recompiler "up to 5-6 times faster" (1.4.0c, 2016), multi-core PowerPC emulation (1.11.3, 2018), Vulkan
(1.16.0, 2019),
optional asynchronous shader and pipeline compilation (1.19.0), a permanent pipeline cache (1.25.0),
asynchronous JIT translation (1.17.3, 2020), the `.wua` format
(1.27.0b, 2022), and a PowerPC debugger's symbol list (2.0).
It needs OpenGL 4.5 or Vulkan 1.2, emulates the GamePad, Pro Controller, and Classic Controller,
and Wiimotes partly ([cemu.info][cemu-site]).
The [v2.4 notes][cemu-releases] fix "the HLE implementation of proc_ui.ProcUIRegisterCallback",
which confirms from prose that Cafe OS libraries are high-level; that part is closed by rule.
Its [compatibility list][cemu-compat] rates 15% of titles perfect, 43% playable, and 4% unplayable,
and the wiki warns its results may be out of date (observed).
Its contributing guide asks for human-written code, as R0-05 records.

**Cemu's Android port.**
[SSimco's fork][ssimco] calls itself "the Android port of Cemu ... still early and experimental",
has released APKs since 2024-09-22, numbered 0.1 (2025-03-10) to 0.5 (2026-04-25),
and asks for no issues or pull requests yet.
No statement by the Cemu project about it was found.
Other forks for Switch homebrew, Xbox, PlayStation 4, and iOS are leads from the Emulation General Wiki.

**decaf-emu.**
The [README][decaf] says "Researching Wii U emulation", under GPLv3 or later, and that user support "is not provided";
Windows and Linux builds are CI artefacts, and macOS builds are not provided because of Vulkan.
Its last commit and only release are of 2023-11-09.
That it emulates Cafe OS at a high level with a recompiler is recalled, not read
(from memory); the Emulation General Wiki says it boots some commercial games (lead).

**Wii U Firmware Emulator.** [kinnay's emulator][kinnay-fw] "emulates the Wii U processors
and hardware at the lowest level" and runs "all the way through boot1, IOSU and Cafe OS up to the Wii U menu".
Its README asks the user to dump boot1, OTP, SEEPROM, and NAND images with a homebrew tool and to supply a CPU key,
which makes its study a key hazard; it holds no key, and it is dormant since October 2023.

### Rust emulators and other active projects

- **[Gecko][gecko]** (GPL-3.0, created 2026-04-04):
  "A cross-platform GameCube/Wii emulator and debugger written in Rust", with Cranelift recompilers for the PowerPC,
  the DSP, and the vertex decoder, a wgpu renderer, "Starlet HLE", "IPL skip patches for NTSC and PAL",
  a FIFO player "Compatible with Dolphin", save states, Lua, a browser build, and Windows, Linux,
  and macOS on x86 and ARM.
  It boots "most games without any system files, using Dolphin's DSP ROM and an IPL HLE",
  and says the embedded DSP ROM "is written by the Dolphin team, not dumped from hardware",
  and that its IPL replacement is Hazel's.
  Its tool decodes a dumped IPL, a hazard for its study.
- **[Lazuli][lazuli]** (created 2025-08-16): its README says most of it is under GPLv3 and some crates under MIT,
  with licence texts in a folder but no root licence file; by the precedent that a README beats metadata, it is open.
  It has Cranelift recompilers for the PowerPC and the vertex parser, a DSP interpreter, a wgpu renderer,
  and an IPL replacement, and says "No dolphin code is reused";
  since 2026-09-16 its author is "not working on Lazuli actively", and names solstice, Gecko,
  and beanwii as sister projects.
- **[pureikyubu][pureikyubu]** (CC0-1.0), formerly Dolwin,
  aims "to research the hardware features of GameCube and reverse engineer the technologies used to develop games",
  and released five builds between 2026-09-11 and 2026-10-07.
  It has Gekko and DSP recompilers for x86 and x64 and interpreters on macOS arm64,
  and a software graphics path besides OpenGL.
  It can boot a boot ROM image on request, without saying where the image comes from;
  its host-side BIOS is closed in the register.
  Its README describes agentic AI development and checks run on Nintendo SDK demos, whose origin it does not state.
- **beanwii** (Wii) and **solstice** (GameCube, Wii, and Wii U, in Rust, on Codeberg) show no licence;
  solstice's repository page lists no licence file or README
  (observed in the fix pass), so both are closed and named without links.

### Historical emulators

- **gcube**, by monk: a mirror's README says only the interpreter is implemented,
  with an optional high-level mode and an integrated debugger, for Linux, Windows, and macOS
  ([gcube mirror][gcube]); the Emulation General Wiki dates it to 2005 (lead).
  It thanks Dolwin's authors for releasing their source, and "Dolphin authors, F|RES, ector and schibo,
  for the Dolphin sources", although Dolphin's source was published only in 2008 (above);
  how gcube had it is not stated.
- **[Gekko][gekko-gc]**: a 2015 import whose README holds only its name; its history is a lead.
- **Dolwin**: pureikyubu's credits name the Dolwin 0.10 team, and thank WhineCube and gcube for ideas;
  the Dolwin project page refused automated requests (research log).
- **WhineCube** and **SuperGCube**, closed-source Windows freeware, are known only from leads, and **GCEmu**,
  by Duddie and Tratax, only from gcube's credits; no primary page was found, so no register line is needed.

### Nintendo's own emulation

- **Nintendo GameCube – Nintendo Classics** is part of the Switch Online Expansion Pack,
  "only available on Nintendo Switch™ 2!", from 5 June 2025
  ([Nintendo store page][ntd-gc-store]; [Nintendo news][ntd-gc-news]),
  with button remapping and an optional GameCube controller for Switch 2.
  Nintendo's pages never use the words "emulator" or "emulation" (searched);
  Wikipedia calls it an emulator and counts 12 games by 2026-11-24
  ([Wikipedia, "Nintendo Classics"][w-classics], secondary).
- **Wii U Wii Mode** runs Wii games on the Wii-compatible GX unit in the Latte chip
  ([R1-07](R1-07-catalogue-sixth-generation.md#home-consoles)); Wikipedia says the mode "emulates the Wii's system
  software and Wii Menu interface", that the Wii U does not play GameCube discs, and that it does not upscale Wii games
  ([Wikipedia, "Wii U"][w-wiiu], secondary).
  Dolphin reads Wii titles bought from the Wii U eShop in their `NFS` form (FAQ).
- **Leads only**: a Nintendo European R&D emulator said to run GameCube and Wii re-releases on Switch,
  and an SDK emulator for Windows that the Emulation General Wiki says does not run commercial games.
  Ports of GameCube and Wii games to NVIDIA Shield in China are recalled, not found (from memory).

### Tests, oracles, and published results

No published pass-or-fail table for any emulator of the family was found
(searched: the projects' prose above, Dolphin's blog posts read, the test READMEs, and a web search).
What exists:

| Suite or list | Tier | What it tests | Oracle | Published result |
|---|---|---|---|---|
| [hwtests][hwtests] | walled | programs sent to a Wii over the network; topics not read | the user's Wii | none |
| `ioncodes/gamecube-wii-tests` | closed; results usable | IPC flags, ECID, depth, vertex skip | Wii | one Gecko image |
| `geotale/gc-like-research` | closed; results usable | not re-read (guard block) | hardware, by register | not read |
| [FifoCI][fifoci] | open | rendering of recorded GPU command streams | earlier Dolphin versions | per change |
| [Dolphin compatibility][dolphin-compat] | open | play reports | players | 67.2% perfect |
| [Cemu compatibility][cemu-compat] | open | play reports | players | 15% perfect |

- hwtests' README says tests are run "by sending their ELFs one-by-one over the network to a Wii running the Homebrew
  Channel", reports results over TCP port 16784, needs libogc, which is closed, and is "Released under GPLv2."
- The ioncodes README records hardware results: on a Wii under IOS58, two IPC flags "stay set in every trial";
  in a depth test from two Mario sports games, "The wider bands above match the hardware result",
  while a Wii test "supports wrapping into a signed 27-bit range
  before clamping to unsigned Z24" with the representation "not established".
  Its one emulator result: "The image below was captured in Gecko
  and still has precision differences in some in-range values."
  Each of its three graphics tests (z-freeze, vertex skip, depth readback) ships a Dolphin FIFO capture,
  and a fifth test reads the Wii CPU's chip ID (ECID) registers.
- FifoCI renders "a chosen set of FIFO logs", dumps the frames,
  and compares the pixels "to previous versions of the emulator"
  ([FifoCI, "About"][fifoci-about], capture of 2024-12-16);
  Dolphin's 2015 post says FIFO logs can also be replayed "on a real Wii!" and that FifoCI found regressions
  before merge ([Dolphin blog, "Making developers more productive"][dolphin-infra]).
  So its oracle detects regressions, not agreement with hardware (inference); by the 2609 report,
  a Mac hosted by MacStadium runs it with ARM64 unit tests.
- No Wii U hardware test suite was found,
  as [R0-05](R0-05-source-map.md#gamecube-wii-wii-u-switch-and-switch-2) records.

### What makes the family hard

The primer describes the hardware ([processors](R1-03-primer-sixth-generation.md#gamecube-wii-and-wii-u),
[graphics](R1-03-primer-sixth-generation.md#gamecube-and-wii-the-texture-environment),
[audio](R1-03-primer-sixth-generation.md#gamecube-and-wii-1),
[system software](R1-03-primer-sixth-generation.md#system-software-that-games-call)).
The emulator authors and wikis add these points:

- **Caches and memory translation.**
  Dolphin's report for April and May 2021 says "emulating GameCube/Wii processor cache behaviors is a huge performance
  problem", that its recompilers are not likely to get "more than rudimentary icache emulation at a reasonable speed",
  and that the rare cases are handled by patching the game ([progress report, April and May 2021][dolphin-pr-2021]).
  The last GameCube game to boot needed full block address translation (above).
- **Undefined behaviour.**
  The same report tells how a hardware check of one undefined GPU behaviour used by Luigi's Mansion exposed another in
  Viewtiful Joe, and that each such check seems to uncover more problems.
- **Paired singles.**
  WiiBrew gives the quantised types (float, unsigned and signed 8-bit and 16-bit) and a scale by a power of two
  ([WiiBrew, "Paired single"][wb-ps]),
  and WiiUBrew's register table keeps the quantisation registers on Espresso
  ([WiiUBrew, "Hardware/Espresso"][wub-espresso]) (inference: paired singles carry over to the Wii U).
- **GPU precision.**
  Beyond the integer arithmetic the primer records,
  Dolphin's 2014 post says floating-point underflow and overflow "varies per hardware",
  and that its software renderer has used integers since 2009
  ([Dolphin blog, "Pixel Processing Problems"][dolphin-pixel]).
  Cemu added a workaround for "sampler rounding behavior differences between Wii U and OpenGL/Vulkan" (1.27.0b),
  and its "Accurate barriers" option trades speed against "occasional flickering graphics" (1.27.1).
- **Shader stutter.**
  A specialised host shader stalls the frame that first needs it, and each active emulator works around that:
  Dolphin with its hybrid mode, Cemu with asynchronous compilation (1.19.0) and a pipeline cache, Gecko with a cache.
- **The Wii U GPU.**
  WiiUBrew says "documentation perfectly matching the card is yet to be found" and
  that the GX2 is used only in Wii U mode, with the GX in Wii mode ([WiiUBrew, "Hardware/GX2"][wub-gx2]).
- **DSP firmware.**
  WiiBrew says the DSP boots from an instruction ROM when a control bit is set
  ([WiiBrew, "Hardware/DSP"][wb-dsp]),
  so low-level emulation needs the console's DSP ROM or a replacement, which is closed (inference);
  high-level emulation needs neither.
- **System software.**
  On the Wii, IOS on Starlet provides "USB, networking, security, app management, NAND flash storage, SD card,
  optical disc, and also WiiConnect24 features", and GameCube software runs under MIOS, "effectively a dummy IOS"
  ([WiiBrew, "IOS"][wb-ios]).
  Gecko replaces IOS at a high level ("Starlet HLE"), as Dolphin does (from memory), and Cemu
  (and decaf-emu, from memory)
  replace Cafe OS; those are the parts closed to Rustalgia,
  so its own must be written from WiiBrew and WiiUBrew facts and hardware tests (inference).
- **The GamePad.**
  WiiUBrew says the GamePad pairs over 5 GHz Wi-Fi and uses H.264 video and 16-bit PCM audio in both directions
  ([WiiUBrew, "GamePad"][wub-gamepad]);
  Cemu maps GamePad touch to the left mouse button and shows the GamePad screen on the Tab key or in a second window
  ([cemu.info][cemu-site]; [FAQ][cemu-faq]).
- **Threads.**
  Dolphin spreads the CPU, GPU, and DSP over three cores (above); Cemu added multi-core PowerPC emulation for Espresso,
  and its `--force-interpreter` option "now always uses single-threaded CPU emulation" ([v2.6 notes][cemu-releases]).
- **Hosts without recompilation.**
  On iOS without a debugger's help, Dolphin runs "at unplayably slow frame rates"
  ([DolphiniOS, JIT help][dolphinios-jit]).
- **Revisions.**
  No emulator page read says it models the Panasonic Q, the Wii Mini, or the Korean Wii,
  whose differences R1-07 lists as removed features and drives (searched: the READMEs, FAQs, and wiki pages read).

### Legal exposure

This section builds on [R0-02](R0-02-legal-baseline.md) and is not legal advice.

- **The Steam letter.**
  R0-02 records the letter, Dolphin's reading of § 1201(f), and its view that a key is not copyrightable
  ([R0-02, "Keys"](R0-02-legal-baseline.md#keys);
  ["Which systems the claims concern"](R0-02-legal-baseline.md#which-systems-the-claims-concern)).
  Three points are new.
  First, the archive's index shows the [Steam page][steam-dolphin] live from 28 March to at least 24 May 2023,
  and redirecting by 27 May 2023, the day of Dolphin's first post (observed);
  that first post spoke of "a cease and desist citing the DMCA"
  ([Dolphin blog, 2023-05-27][dolphin-steam-may]),
  and its second said there was no § 512 notice and that Valve's legal department had contacted Nintendo first
  ([Dolphin blog, 2023-07-20][dolphin-steam-july]).
  Second, Valve said "Nintendo and the Dolphin team have a clear legal dispute between them,
  and Valve can't sit in judgment", and that it generally stops distributing until the parties resolve such a dispute
  ([PC Gamer][pcgamer], secondary);
  a Nintendo spokesperson said the emulator "illegally circumvents Nintendo's protection measures
  and runs illegal copies of games" ([VGC][vgc], secondary).
  Third, Dolphin decided "leaving the keys as they are is the best course of action",
  because moving decryption to another program "would make the situation worse for everyone";
  no later report of the key's removal was found (web search), and Dolphin's source was not opened to check
  (process rule).
- **Notices.**
  Of the 101 notices from 2014 to 2026 in [GitHub's archive][ghdmca] with "nintendo" in the file name,
  none names Dolphin, Cemu, decaf-emu, the GameCube, the Wii, or the Wii U
  (search of each notice's raw text; research log),
  which extends [R0-02, "Who has been reached"](R0-02-legal-baseline.md#who-has-been-reached).
  The archive holds seven Nintendo notices dated 2026-08-17
  that R0-02's [table](R0-02-legal-baseline.md#takedown-and-enforcement-history) lacks;
  their subjects were not read here, and are left to [R1-14](R1-14-nintendo-switch-family.md).
- **Encryption.**
  YAGCD says a GameCube disc's content is XORed with a constant and "transparently decrypted by the Disc-Controller",
  and that its barcode authenticates the disc in the drive
  ([YAGCD, 2.7][yagcd-2]); Dolphin's July post says GameCube games are not encrypted at all.
  The letter, as Dolphin quotes it, says "Wii and Nintendo GameCube game files, or ROMs, are encrypted",
  so the two parties disagree on the GameCube (a finding, not a ruling).
  Wii partitions and Wii U content are encrypted
  ([R1-03, "Discs"](R1-03-primer-sixth-generation.md#discs-and-what-arrives-as-a-plain-image)).
- **Keys at the Wii U.** Cemu's FAQ says `.wud`
  and `.wux` images need "the proper decryption key to be placed inside keys.txt",
  that "Since these keys are copyrighted we can't provide them with Cemu", and recommends `.wua`,
  which "doesn't require keys"; the changelog calls `.wua` lossless, made from the user's own titles.
  Cemu thus calls keys copyrighted while Dolphin calls them not copyrightable; both are projects' views, untested.
  The FAQ also needs system files dumped from a console for Nintendo's servers, and links dumping guides
  (`cemu.cfw.guide`, and an online-play tutorial on its compatibility wiki), unlinked here as dumping guides.
- **The options as projects apply them.**
  [Option 1](R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted): the GameCube,
  on YAGCD's and Dolphin's account, contested by the letter.
  [Option 2](R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys):
  Cemu for `.wud` and `.wux`, and the Wii U firmware emulator.
  [Option 3](R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key):
  Cemu's `.wua` for the first variant, and Dolphin for the second, the one that drew the letter;
  Dolphin's RVZ stores "Wii data partitions unencrypted",
  and its table marks WIA and RVZ as able to compress encrypted Wii data
  ([progress report, May and June 2020][dolphin-pr-2020]),
  so Dolphin offers the first variant as well;
  turning such a file back into a disc image the console would read implies re-encrypting it with the common key
  (inference).
  [Option 4](R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps):
  the optional IPL and NAND in Dolphin and libretro, which RetroArch says "must be dumped from your own console"
  ([RetroArch's guide][ra-gc]); the firmware emulator requires dumps, and pureikyubu can boot a boot ROM image.
  [Option 5](R0-02-legal-baseline.md#5-replace-the-firmware): every active emulator, by high-level IOS or Cafe OS,
  IPL replacements, or the replacement DSP ROM.
  [Option 7](R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links): Dolphin's FAQ, wiki,
  and Triforce post, Cemu's FAQ and README, and the firmware emulator's README all name or link dumping tools.
  [Option 9](R0-02-legal-baseline.md#9-choose-where-the-project-is-hosted-and-distributed):
  Steam required an agreement with Nintendo; Google Play, F-Droid, and Flathub carry Dolphin;
  Apple's [guideline 4.7][apple-guide] admits emulators, but Dolphin-based apps stay off the App Store for the JIT ban,
  not a takedown, by DolphiniOS's account.
- **Boot logos and lock-out.**
  YAGCD's disc header lists console, game, country, and maker codes, a magic word, and the game's name, and no logo
  ([YAGCD, 13][yagcd-13]), so no Game Boy-style logo gate applies (inference).
  The Wii and Wii U lock out by signatures and encryption from their boot ROMs
  ([R1-03, "Boot chains"](R1-03-primer-sixth-generation.md#boot-chains-and-security-processors));
  no boot logo was looked for on either.
- **Maker statements.**
  Beyond Nintendo's general statements ([R0-02](R0-02-legal-baseline.md#makers-statements-on-emulators))
  and the spokesperson's words above, Nintendo sells GameCube emulation of its own on Switch 2 without calling it that.
- **Licences and names.**
  OpenEmu's core derives from GPL-2.0+ code yet carries no licence; Fin, a closed App Store app
  (store number 6758910777)
  that claims GameCube, Wii, Wii U, and Triforce games and says "Encrypted dumps need your console keys", names no core;
  both are compliance questions for those projects, not for their readers.
  An unrelated NES app sells as "Dolphin Emulator - Basic"
  (store number 6742373017),
  a use of the project's name of the kind
  [R0-02's option 14](R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words)
  weighs; Dolphin's Play listing says "Dolphin isn't associated with Nintendo in any way."
- **Provenance.** pureikyubu's and gcube's use of Nintendo SDK demos,
  and gcube's thanks for Dolphin's sources before 2008, are provenance risks for those projects;
  R0-05 lists Nintendo's kits as "Must not be used", so nothing a study learns from those demos is recorded (inference).
  Gecko embeds Dolphin's replacement DSP ROM, so its closure follows the copy.

## Options and trade-offs

### Which emulators the emulator studies cover

- **What:** keep the roadmap's one study, of [Dolphin][dolphin] ([R1-53](../../roadmap/research.md#emulator-studies));
  add a [Cemu][cemu] study for the Wii U;
  or add [Gecko][gecko] or [Lazuli][lazuli] as a Rust comparison inside the Dolphin study.
- **Costs:** in Dolphin and Cemu the system software, the replacement DSP ROM, and Dolphin's key are closed,
  at paths the study must first find from a listing;
  a Cemu study is one more item for a system that may not be taken up; Gecko and Lazuli are young,
  and Gecko embeds closed parts.
- **Gains:** Dolphin is the reference for the CPU, GPU, shaders, and FIFO tooling;
  Cemu is the only maintained open-tier Wii U emulator;
  Lazuli says it reuses no Dolphin code and shows a Rust design with Cranelift and wgpu.
- **Used by:** Gecko reuses Dolphin's DSP ROM and FIFO format; Lazuli names Gecko and solstice as sister projects.

### Which test oracles to adopt

- **What:** the project's own tests run on a Wii through the Homebrew Channel; the ioncodes results;
  [hwtests][hwtests]' prose; [FifoCI][fifoci]-style comparison of recorded command streams; compatibility lists.
- **Costs:** own tests need a Wii and a toolchain other than libogc, which is closed; ioncodes is closed,
  so only its recorded results may be used; hwtests is walled and states no expected values;
  FifoCI compares against an emulator, not hardware; play reports are not hardware-checked.
- **Gains:** a Wii runs GameCube and Wii code, so one console tests both;
  recorded GPU streams make graphics tests repeatable once a hardware frame is captured for them.
- **Used by:** Dolphin (FifoCI, unpublished hardware checks); ioncodes and Gecko (hardware results).

### How to handle encrypted content

- **What:** GameCube plain images only; decrypted input for the Wii and Wii U, made by the user's own tools;
  an embedded key, as [Dolphin][dolphin]; or user keys at run time, as [Cemu][cemu-faq] for `.wud`.
- **Costs:** decrypted input depends on outside tools and leaves shop and update content out;
  the embedded key drew a maker's letter and a store refusal; run-time keys are what the Switch filings plead
  ([R0-02, recommendation](R0-02-legal-baseline.md#recommendation)).
- **Gains:** plain images and decrypted input keep keys and decryption out of the project;
  the others work with fewer steps.
- **Used by:** every GameCube emulator; Cemu's `.wua`; Dolphin; Cemu and the firmware emulator.

### How to handle system software and firmware

- **What:** the project's own GameCube boot and IPL replacement, its own high-level IOS and Cafe OS,
  and high-level DSP microcode (R0-02 option 5); optional user dumps
  (option 4); or full low-level emulation from boot ROMs and NAND, as the Wii U firmware emulator.
- **Costs:** the high-level parts must be written without reading any emulator's version,
  from [WiiBrew][wb-ios] and [WiiUBrew][wub-gx2], whose origins are not stated, and from tests;
  Cafe OS is a large library surface; low-level emulation needs dumps that carry per-console secrets.
- **Gains:** homebrew and most games run with nothing of Nintendo's; the user's IPL restores fonts some games need.
- **Used by:** [Dolphin][dolphin] (IOS from memory), [Gecko][gecko], [Lazuli][lazuli], [Cemu][cemu], decaf-emu
  (high-level, from memory);
  [kinnay's emulator][kinnay-fw] (dumps); [pureikyubu][pureikyubu] (an optional boot ROM image).

### Which systems first

- **What:** the GameCube first, then the Wii, then the Wii U; or all three together.
- **Costs:** the Wii adds IOS and encrypted content; the Wii U adds three symmetric cores,
  an R7xx-class GPU with no matching maker document, Cafe OS, and the GamePad stream.
- **Gains:** the GameCube needs no keys, no system software beyond its boot, and shares the CPU, GPU,
  and DSP with the Wii.
- **Used by:** [Lazuli][lazuli] covers only the GameCube, and [Gecko][gecko] both;
  Dolphin ran GameCube games before it gained Wii emulation ([Wikipedia, "Dolphin (emulator)"][w-dolphin], secondary).

### Recommendation

These are recommendations for the owner, who decides; the pull request lists them.

- **Studies:** keep [R1-53](../../roadmap/research.md#emulator-studies) ([Dolphin][dolphin]),
  reading around the closed parts named above, with [Lazuli][lazuli] as a comparison inside it;
  add a [Cemu][cemu] study only if [R6-01](../../roadmap/research.md#phase-6-synthesis) takes up the Wii U. Dolphin is
  the reference for both older consoles, and Lazuli is the one Rust design that says it is independent of Dolphin.
- **Oracles:** the project's own tests on a Wii,
  with the ioncodes results and [FifoCI][fifoci]-style stream replays as supplements;
  compatibility lists only for play coverage.
  No suite under a usable licence gives expected values from hardware;
  ioncodes and geotale record hardware results but are closed, so only their recorded results may be used.
- **Content:** GameCube plain images; for the Wii and Wii U, decrypted input only, with no keys and no decryption code,
  as [R0-02's recommendation](R0-02-legal-baseline.md#recommendation) prefers,
  because the one letter in this family was about an embedded key.
- **System software:** the project's own GameCube boot and high-level DSP microcode first,
  then a high-level IOS from [WiiBrew][wb-ios] facts confirmed by tests on a Wii;
  the user's IPL as an optional path for fonts.
- **Order:** GameCube, then Wii, then Wii U, because each step adds one hard layer and the first needs no keys.

## Implications for Rustalgia

- The owner may correct [R1-03](R1-03-primer-sixth-generation.md#gamecube-and-wii-1) in place:
  its Cemu `snd_core` citation now points into a path this survey closes,
  and its citation of Dolphin's "Audio Emulation" page now points to a page this survey closes
  for its DSP dumping section.
- [R2-12](../../roadmap/research.md#phase-2-cross-cutting-engineering) has a second hard case after the 3DS:
  high-level IOS and Cafe OS written from wikis and tests without reading an implementation.
- [R3-01](../../roadmap/research.md#phase-3-host-platforms) inherits [DolphiniOS][dolphinios-jit]'s evidence
  that an interpreter alone is unplayable for this family on iOS, and the App Store's JIT ban.
- A Wii counterpart of [R5-12](../../roadmap/research.md#phase-5-hands-on-spikes),
  which measures the PlayStation 1 on a console, would test two consoles on one machine; no roadmap item provides it.
- [R6-01](../../roadmap/research.md#phase-6-synthesis) decides whether the Wii and Wii U are in scope,
  given encrypted content and closed high-level references.

## Open questions

- Where [Dolphin][dolphin] keeps its Wii common key, its high-level IOS, and its boot replacement,
  so that closed lines can name the paths: a tree listing at the start of the Dolphin study
  ([R1-53](../../roadmap/research.md#emulator-studies)).
- Which [WiiBrew][wb-ios] IOS facts hold on a console: tests on an owned Wii,
  in the Wii counterpart of [R5-12](../../roadmap/research.md#phase-5-hands-on-spikes) proposed above.
- How the Wii U's [GX2][wub-gx2] registers behave where no maker document matches: tests on a Wii U,
  which no roadmap item provides.

## Sources

Every source below was read on 2026-11-25, as raw text unless marked.
Addresses in code spans are closed, gone, or dumping guides, and are not linked.
A README or licence file given without a pin was read at its default branch that day (pin not recorded).

Dolphin and its forks:

- Dolphin: [repository and README][dolphin]
  (blob `4180d136`),
  [tags][dolphin-tags] (2609b), [COPYING][dolphin-copying], [FAQ][dolphin-faq], [compatibility list][dolphin-compat];
  captures of the [download page][dolphin-download] (2026-11-25)
  and of the blog posts ["Booting the Final GameCube Game"][dolphin-final-gc] (2016-09-06),
  [progress reports for March 2017][dolphin-pr-2017-03], [May 2017][dolphin-pr-2017-05],
  and [May and June 2020][dolphin-pr-2020] (2020-07-05), ["Ubershaders"][dolphin-ubershaders] (2017-07-30),
  ["Pixel Processing Problems"][dolphin-pixel] (2014-03-15), ["Making developers more productive"][dolphin-infra]
  (2015-01-25), [April and May 2021][dolphin-pr-2021], [release 2609][dolphin-pr-2609],
  ["Rise of the Triforce"][dolphin-triforce] (2026-02-16), and the Steam posts of [2023-05-27][dolphin-steam-may] and
  [2023-07-20][dolphin-steam-july]; the wiki page "Audio Emulation" (oldid 177576, capture 2026-07-30), closed since
  this survey because it ends in a DSP ROM dumping section: `wiki.dolphin-emu.org/index.php?title=Audio_Emulation`.
- [Google Play listing][dolphin-play]; [F-Droid][dolphin-fdroid] (2603a); [Flathub][flathub-dolphin],
  with its [statistics API][flathub-stats]; [Steam page capture][steam-dolphin] (2023-04-16).
- Forks: [Ishiiruka][ishiiruka]; [Slippi Ishiiruka][slippi-ishiiruka]; [Slippi Dolphin][slippi-dolphin];
  [PrimeHack][primehack]; [Dolphin MMJ][dolphin-mmj]; [MMJR2][mmjr2]; [libretro Dolphin][lr-dolphin-gh];
  [DolphinUWP][sternxd]; [DolphiniOS][dolphinios]
  (release v5.0.0b6),
  its [site][dolphinios-site], [FAQ][dolphinios-faq], [beta page][dolphinios-beta], and [JIT help][dolphinios-jit];
  OatmealDome, ["Why Dolphin Isn't Coming to the App Store"][oatmeal-appstore] (2024-04-19, lead).
- Not linked: `Bankaimaster999/Dolphin-MMJR` (gone, 404); `OpenEmu/dolphin` (closed, no licence).

Cemu and other emulators:

- Cemu: [README][cemu] (commit `2f49c079`), [site][cemu-site], [FAQ][cemu-faq], [changelog][cemu-changelog],
  [release notes][cemu-releases] (v2.4 of 2024-11-13, v2.6 of 2025-02-06), [compatibility list][cemu-compat],
  [Flathub][flathub-cemu]; [Android port][ssimco] (release 0.5).
- [decaf-emu README][decaf] (commit `e6c528a2`); [Wii U Firmware Emulator README][kinnay-fw].
- [Gecko README][gecko]; [Lazuli README][lazuli]; [pureikyubu README][pureikyubu]
  (release 20);
  [gcube mirror][gcube]; [Gekko import][gekko-gc];
  the README of `zaydlang/beanwii` and the repository page of `codeberg.org/equinox-emu/solstice` (closed, not linked).
- Emulation General Wiki, [main page][egw]
  (a lead);
  its GameCube emulators page, `emulation.gametechwiki.com/index.php/Nintendo_GameCube_emulators`, is closed
  (it links a game site), and its Wii and Wii U pages were read as leads.
- Not linked: `cemu.cfw.guide` and `compat.cemu.info/wiki/Tutorial:Online_Play` (dumping guides).

Frontends, stores, and Nintendo:

- [libretro documentation, Dolphin][lr-dolphin]
  (revised 2026-10-22);
  [RetroArch's GameCube guide][ra-gc]; [libretro buildbot][buildbot]
  (listings only); [RetroArch on the App Store][ra-ios]; [RetroArch on Steam][ra-steam].
- [OpenEmu][openemu] and its [2.2 release notes][openemu-22].
- App Store listings of [Fin][fin-ios] (3.5.1) and ["Dolphin Emulator - Basic"][dolphin-basic-ios],
  read through the iTunes lookup service
  (`itunes.apple.com/lookup`, an API); Apple, [App Review Guidelines][apple-guide] (last updated 2026-10-16).
- Nintendo, [GameCube – Nintendo Classics store page][ntd-gc-store] and [news post][ntd-gc-news] (2025-06-06).
- Wikipedia: ["Dolphin (emulator)"][w-dolphin] (revision 1386311437), ["Cemu"][w-cemu]
  (revision 1384318386),
  ["Nintendo Classics"][w-classics] (revision 1387538380), ["Wii U"][w-wiiu] (revision 1386323270).

Law, references, and tests:

- [PC Gamer, 2023-06-05][pcgamer] and [VGC, 2023-05-29][vgc] (secondary); [GitHub DMCA archive][ghdmca].
- YAGCD, [chapter 2][yagcd-2] and [chapter 13][yagcd-13]
  (index last modified 2006-12-23);
  section 2.8 of chapter 2 recovers an IPL cipher from firmware dumps and was not used.
- WiiBrew, ["Paired single"][wb-ps], ["Hardware/DSP"][wb-dsp], and ["IOS"][wb-ios]; WiiUBrew,
  ["Hardware/Espresso"][wub-espresso], ["Hardware/GX2"][wub-gx2], and ["GamePad"][wub-gamepad]
  (last edited 23 July 2024, 17 May 2022, 23 November 2026, 27 November 2025, 3 September 2023, and 14 November 2026;
  both wikis refuse their API, so no revision number).
- [hwtests README][hwtests]; [FifoCI repository][fifoci] and [About page][fifoci-about]
  (capture 2024-12-16); the README of `ioncodes/gamecube-wii-tests` (closed, not linked).

Project documents:

- [R0-02](R0-02-legal-baseline.md); [R0-05](R0-05-source-map.md); [R0-06](R0-06-provenance-controls.md);
  [R1-03](R1-03-primer-sixth-generation.md); [R1-07](R1-07-catalogue-sixth-generation.md);
  [ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md);
  the [research roadmap](../../roadmap/research.md); the [source register](../../../.claude/hooks/source-register.txt).

[apple-guide]: https://developer.apple.com/app-store/review/guidelines/
[buildbot]: https://buildbot.libretro.com/nightly/
[cemu]: https://github.com/cemu-project/Cemu
[cemu-changelog]: https://cemu.info/changelog.html
[cemu-compat]: https://compat.cemu.info/
[cemu-faq]: https://cemu.info/faq.html
[cemu-releases]: https://github.com/cemu-project/Cemu/releases
[cemu-site]: https://cemu.info/
[decaf]: https://github.com/decaf-emu/decaf-emu
[dolphin]: https://github.com/dolphin-emu/dolphin
[dolphin-compat]: https://dolphin-emu.org/compat/
[dolphin-copying]: https://github.com/dolphin-emu/dolphin/blob/master/COPYING
[dolphin-download]: https://web.archive.org/web/20261125232408/https://dolphin-emu.org/download/
[dolphin-faq]: https://dolphin-emu.org/docs/faq/
[dolphin-fdroid]: https://f-droid.org/en/packages/org.dolphinemu.dolphinemu/
[dolphin-final-gc]: https://web.archive.org/web/20261116022404/https://dolphin-emu.org/blog/2016/09/06/booting-the-final-gc-game/
[dolphin-infra]: https://web.archive.org/web/20260312065804/https://dolphin-emu.org/blog/2015/01/25/making-developers-more-productive-dolphin-development-infrastructure/
[dolphin-basic-ios]: https://apps.apple.com/us/app/id6742373017
[dolphin-mmj]: https://github.com/weihuoya/dolphin
[dolphin-pixel]: https://web.archive.org/web/20260701132119/https://dolphin-emu.org/blog/2014/03/15/pixel-processing-problems/
[dolphin-play]: https://play.google.com/store/apps/details?id=org.dolphinemu.dolphinemu
[dolphin-pr-2017-03]: https://web.archive.org/web/20251222060436/https://dolphin-emu.org/blog/2017/04/05/dolphin-progress-report-march-2017/
[dolphin-pr-2020]: https://web.archive.org/web/20261012170910/https://dolphin-emu.org/blog/2020/07/05/dolphin-progress-report-may-and-june-2020/
[dolphin-pr-2017-05]: https://web.archive.org/web/20170604095323/https://dolphin-emu.org/blog/2017/06/03/dolphin-progress-report-may-2017/
[dolphin-pr-2021]: https://web.archive.org/web/20251121085724/https://dolphin-emu.org/blog/2021/06/06/dolphin-progress-report-april-and-may-2021/
[dolphin-pr-2609]: https://web.archive.org/web/20260924045058/https://dolphin-emu.org/blog/2026/09/24/dolphin-progress-report-release-2609/
[dolphin-tags]: https://github.com/dolphin-emu/dolphin/tags
[dolphin-steam-july]: https://web.archive.org/web/20241221001744/https://dolphin-emu.org/blog/2023/07/20/what-happened-to-dolphin-on-steam/
[dolphin-steam-may]: https://web.archive.org/web/20241221001659/https://dolphin-emu.org/blog/2023/05/27/dolphin-steam-indefinitely-postponed/
[dolphin-triforce]: https://web.archive.org/web/20261116022333/https://dolphin-emu.org/blog/2026/02/16/rise-of-the-triforce/
[dolphin-ubershaders]: https://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/
[dolphinios]: https://github.com/OatmealDome/dolphin-ios
[dolphinios-beta]: https://dolphinios.oatmealdome.me/beta
[dolphinios-faq]: https://dolphinios.oatmealdome.me/faq
[dolphinios-jit]: https://dolphinios.oatmealdome.me/jit-help
[dolphinios-site]: https://dolphinios.oatmealdome.me/
[egw]: https://emulation.gametechwiki.com/index.php/Main_Page
[fifoci]: https://github.com/dolphin-emu/fifoci
[fifoci-about]: https://web.archive.org/web/20241216182337/https://fifo.ci/about/
[flathub-cemu]: https://flathub.org/apps/info.cemu.Cemu
[fin-ios]: https://apps.apple.com/us/app/id6758910777
[flathub-dolphin]: https://flathub.org/apps/org.DolphinEmu.dolphin-emu
[flathub-stats]: https://flathub.org/api/v2/stats/org.DolphinEmu.dolphin-emu
[gcube]: https://github.com/moras-p/gcube
[gecko]: https://github.com/ioncodes/gecko
[gekko-gc]: https://github.com/shonumi/gekko-gc-emu
[ghdmca]: https://github.com/github/dmca
[hwtests]: https://github.com/dolphin-emu/hwtests
[ishiiruka]: https://github.com/Tinob/Ishiiruka
[kinnay-fw]: https://github.com/kinnay/Wii-U-Firmware-Emulator
[lazuli]: https://github.com/vxpm/lazuli
[lr-dolphin]: https://docs.libretro.com/library/dolphin/
[lr-dolphin-gh]: https://github.com/libretro/dolphin
[mmjr2]: https://github.com/Mato00KAN/Dolphin-MMJR2
[ntd-gc-news]: https://www.nintendo.com/us/whatsnew/jump-into-three-classic-nintendo-gamecube-games/
[ntd-gc-store]: https://www.nintendo.com/us/store/products/nintendo-gamecube-nintendo-classics-switch-2/
[oatmeal-appstore]: https://oatmealdome.me/blog/why-dolphin-isnt-coming-to-the-app-store/
[openemu]: https://openemu.org/
[openemu-22]: https://openemu.org/rnotes/2.2.html
[pcgamer]: https://www.pcgamer.com/valve-wouldnt-host-dolphin-on-steam-because-it-cant-sit-in-judgement-on-nintendos-fight-against-emulators/
[primehack]: https://github.com/shiiion/dolphin
[pureikyubu]: https://github.com/emu-russia/pureikyubu
[ra-gc]: https://www.retroarch.com/gamecube.html
[ra-ios]: https://apps.apple.com/us/app/id6499539433
[ra-steam]: https://store.steampowered.com/app/1118310/
[slippi-dolphin]: https://github.com/project-slippi/dolphin
[slippi-ishiiruka]: https://github.com/project-slippi/Ishiiruka
[ssimco]: https://github.com/SSimco/Cemu
[steam-dolphin]: https://web.archive.org/web/20230416180908/https://store.steampowered.com/app/1941680
[sternxd]: https://github.com/SternXD/dolphin
[vgc]: https://www.videogameschronicle.com/news/nintendo-explains-its-decision-to-block-dolphins-steam-release-saying-it-stifles-innovation/
[w-cemu]: https://en.wikipedia.org/w/index.php?oldid=1384318386
[w-classics]: https://en.wikipedia.org/w/index.php?oldid=1387538380
[w-dolphin]: https://en.wikipedia.org/w/index.php?oldid=1386311437
[w-wiiu]: https://en.wikipedia.org/w/index.php?oldid=1386323270
[wb-dsp]: https://wiibrew.org/wiki/Hardware/DSP
[wb-ios]: https://wiibrew.org/wiki/IOS
[wb-ps]: https://wiibrew.org/wiki/Paired_single
[wub-espresso]: https://wiiubrew.org/wiki/Hardware/Espresso
[wub-gamepad]: https://wiiubrew.org/wiki/GamePad
[wub-gx2]: https://wiiubrew.org/wiki/Hardware/GX2
[yagcd-13]: https://hitmen.c02.at/files/yagcd/yagcd/chap13.html
[yagcd-2]: https://hitmen.c02.at/files/yagcd/yagcd/chap2.html
