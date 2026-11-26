---
title: "Sega Saturn and Dreamcast: family survey"
roadmap_item: R1-23
status: draft
date: 2026-11-26
---

# Sega Saturn and Dreamcast: family survey

## Summary

This note asks which emulators matter for the Sega Saturn and the Dreamcast, how each works,
what legal exposure the family carries, and how hard it is to emulate.

For the Saturn, [Mednafen][mdf-ss]'s module
and its fork [Beetle Saturn][beetle] are the long-standing accuracy references, and [Ymir][ymir],
open tier and active since 2025, claims 94.4% of the library and leads on sound.
For the Dreamcast, [Flycast][flycast] leads on hosts and frontends,
closed [Redream][rd-site] has ten times its Play installs, and Redream's old code, [inolen/redream][redream-gh],
is the only open-tier Dreamcast emulator found.

The legal picture is mild for the Saturn and sharper for the Dreamcast.
Saturn game data is not encrypted (inference), and the respected Saturn emulators need the user's BIOS dump.
Dreamcast executables are scrambled, and Flycast and Redream can boot games through their own high-level BIOS,
which then descrambles them itself (inference); Redream and erings patch the region check.
No Sega notice, suit, or statement against an emulator of either console was found.

For Rustalgia, the Saturn's two SH-2s need full cache emulation and tight bus timing,
which even the leaders still patch per game, and no public suite for either console states a hardware oracle.
The note recommends a study of Ymir, the user's BIOS by default, and Rustalgia's own console tests in phase 5.

## Scope

- Question: which emulators are popular or respected for the Saturn
  (with the Samsung Saturn, Hi-Saturn, and V-Saturn)
  and the Dreamcast, and for each, what are its status, licence, tier, techniques, and hosts;
  what legal exposure does the family carry; and how hard is it to emulate?
- Covered: the models in [R1-06][r106-home] and [R1-07][r107-home].
  The ST-V, NAOMI, and Atomiswave boards are only cross-referenced to [R1-25][r125-naomi].
  The hardware is in [R1-02][r102-cpu] and [R1-03][r103-cpu], the law in [R0-02][r002],
  and the hubs in [R0-05][r005-sega]; this note cites those sections and does not repeat them.
- Researched on 2026-11-26 by three research agents, one each for the Saturn, the Dreamcast,
  and frontends with law and difficulty, who read every quoted source as raw text;
  then the writer checked the disputed points again (research log).
  Then one verification pass, by three fresh verifiers each on one slice,
  checked each claim against its source as raw text,
  and a fix pass checked each disputed finding again before applying it.
- Every emulator was read from prose and repository metadata only, whatever its tier.
  No emulator source file, issue, or pull request was opened, and no BIOS, flash, firmware, disc image,
  or game was obtained.
- Markers follow the [research guide][guide].
  The Emulation General wiki and fan sites are marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.
  Japanese-language sources on enforcement were not searched.
  Nothing here is legal advice.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, store installs, frontends), respect
  (accuracy claims backed by tests, or use as a reference by others), or history.
- Status is the archived flag, last push, and latest release from GitHub metadata or the project's site,
  read on 2026-11-26.
  The guard blocked some metadata of walled and unregistered repositories: release lists
  ([Flycast][flycast], [Deecy][deecy], [lxdream][lxdream-gh], [erings][erings]),
  [Kronos][kronos]'s metadata in the writer's and fix pass's calls, and all of nullDC's (research log).
- Each tier was checked against the [register][register], as a family survey requires
  ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  Precedents were applied without re-deciding them: no licence is closed; a gone repository is closed;
  a bare GPL-2.0 text is walled; a licence file beats a README, metadata, or a wiki;
  every high-level BIOS is closed as system software inside any repository
  ([ADR 0006, "Closed tier"][adr6-closed]),
  and the table gives the tier of the rest; a wiki page that mentions leaked material is closed.
- Lines changed by this survey:
  - `yabause/yabause` goes from open to walled.
    Its line rested on "GPL-2.0-or-later by its wiki", but the wiki's main page, revision 5304,
    says only "under GNU GPL", its FAQ has no licence statement, and both COPYING files are the bare GPL-2.0 text
    ([Yabause wiki][yabause-wiki]).
  - `skmp/nulldc-v1` and its redirect `skmp/nulldc` go from closed to walled.
    The [Google Code project metadata][gc-nulldc] labels nullDC "gpl2", a licence statement of no stated version,
    which outranks Sega Retro's claim of MIT ([Sega Retro, "nullDC"][sr-nulldc]).
  - [Reicast][reicast]'s `skmp/reicast-emulator` and its old name `reicast/reicast-emulator` go from open to walled.
    The repository holds three licence files: `LICENSE`,
    a one-line pledge followed by a grant of the 3-Clause BSD licence, and `LICENSE-GPL` and `LICENSE-LGPL`,
    the bare GPL-2.0 and LGPL-2.1 texts with no statement of what they cover; GitHub reads the licence as NOASSERTION
    (licence files; metadata).
    Licence files that disagree make a source walled, by precedent.
- Lines kept, with the reason:
  - `p1pkin/demul` stays closed.
    It is an export of Demul's tracker with no licence file, and Demul's binaries
    and site state no licence ([R1-25][r125-naomi]).
    Its [Google Code metadata][gc-demul] says "gpl2" and reports an svn repository, which was not opened;
    unlike nullDC's, no released source ties that label to Demul's binaries.
    Google Code's source and download exports get a protective walled line.
  - `thearcadestriker/flycast-wiki` stays closed, now on a stated ground rather than its missing licence:
    it is a setup guide for an emulator, the kind of page that links BIOS dumps and dumping guides,
    and that cannot be checked without opening it.
    [ADR 0006, "Sources that are not emulators"][adr6-refs] says no stated licence does not close a reference;
    the precaution does.
- New process calls:
  - [Deecy][deecy] is walled as a precaution:
    its MIT code names a boot ROM disassembly and Sega's official documentation among its sources (README),
    and its GD-ROM security data file, from MAME, is closed as protection data.
  - `libretro/yabause` is walled as a whole, because its branches carry walled [Kronos][kronos] and YabaSanshiro code;
    [Castation][castation], a Flycast port with a GPL-3.0 licence file over Flycast's GPL-2.0 code,
    is walled by the gopher64 precedent.
  - The YabaSanshiro repository `devmiyax/yabause` is gone
    (HTTP 404),
    so it is closed; its [site][ys-site] is open for prose, and its dumping-tool, recompilation,
    and how-to pages are closed, as is its games page, unopened, as a precaution.
  - A high-level CD block replaces the drive's SH-1 program, a coprocessor's ROM, so it is closed as system software
    ([ADR 0006, "Closed tier"][adr6-closed]): Ymir's default one and Yabause's.
    Their paths are not known without opening code, so no line is drafted; a study skips them.
  - The Emulation General pages "Sega Saturn emulators" and "GiriGiri" are closed: the first links "leaked,
    official documentation" and the second hacked official builds and bundled downloads (raw).
    Their `index.php?title=` forms cannot be matched.
    Its [Dreamcast page][egw-dc], revision 152618, has no "leak" and stays open under the wiki's line (lead).
  - Wikipedia's "Bleem!" is closed, because it mentions a leaked Bleemcast beta (raw wikitext).
    The pattern also blocks other pages whose names begin the same way;
    its mobile (`en.m.wikipedia.org`) and `index.php?title=` forms cannot be matched.
  - The boot ROM disassembly's original host holds "~", which a pattern cannot hold,
    so it has no line and is closed by the written rule.
  - The repository named in Sega's 2019 notice gets a protective closed line, as earlier surveys did for notices.
  - The guard reads `skmp/nulldc` as covering `skmp/nullDC-rust`, the revived nullDC,
    because its patterns match any name that begins with them.
    An unregistered repository is walled anyway, so the cost is only its metadata; the fix, an end anchor in the guard,
    belongs in a change of its own and is listed in the pull request.
- Reported and not changed: `androidauthority.com` has two lines, one open and one other.

### The emulators compared

Key: SS is the Saturn, DC the Dreamcast; "user BIOS" means the user supplies the console's BIOS image;
"HLE" means the project carries its own high-level BIOS, which is closed; Win, Mac, Lin, And,
and lr name hosts and libretro.

| Project | For | Tier | Licence | Release or push | CPU | Firmware | Hosts |
|---|---|---|---|---|---|---|---|
| Mednafen `ss` | SS, ST-V | walled | GPLv2, unstated | 1.32.1, 2024-04-05 | not stated | user BIOS | Win; source |
| Beetle Saturn | SS | walled | bare GPL-2.0 | push 2026-11-17 | Mednafen's | user BIOS | lr |
| Saturn.emu | SS | walled | GPL-3.0 file; core GPL-2.0 | Play, 2026-03-17 | Mednafen's | user BIOS | And |
| Saturnus (BizHawk) | SS | walled | MIT own code; mix | 2.11.1, 2026-05-01 | Mednafen's (lead) | user BIOS | Win, Lin |
| Ymir | SS | open | GPL-3.0 | v0.4.1, 2026-10-18 | interpreter | user BIOS; CD ROM for LLE | Win, Mac, Lin, BSD |
| Emir | SS | open | GPL-3.0-or-later | activity 2026-11-20 | Ymir's | as Ymir | lr |
| Yabause | SS | walled | bare GPL-2.0 | 0.9.15, 2016-08-24 | not stated | optional; HLE | Win, Mac, Lin, BSD |
| Kronos | SS, ST-V | walled | GPL-2.0, unstated | 2.6.1 (lead) | cached interpreter | user BIOS; HLE | Win, Lin, lr |
| YabaSanshiro | SS | closed | GPL claimed; tarball unread | Play, 2026-11-24 | dynarec | optional | And, iOS, Win, lr |
| `SSF` | SS | closed | none | R38 (lead) | not read | not read | Win, And (lead) |
| erings | SS | open | GPL-3.0 | not read | not stated | optional; HLE | Win, Mac, Lin |
| Saturnin | SS | open | Apache-2.0 | no release read | not stated | not read | Win |
| Flycast | DC, arcade | walled | bare GPL-2.0 | v2.7, 2026-08-14 | not read | optional; HLE | Win, Mac, Lin, And, lr |
| parallel-dc | DC, arcade | walled | bare GPL-2.0 | push 2026-11-25 | recompilers | optional; HLE | lr |
| Reicast | DC | walled | BSD-3; GPL texts | r20.04, 2020-04-02 | not read | HLE | And, others (lead) |
| nullDC 1.0.4 | DC, arcade | walled | gpl2 label | r136, 2011-08-21 | dynarec label | user BIOS | Win |
| nullDC 2 | DC | unregistered | not read | build 2026-11-25 | not read | BIOS and flash | Win, Mac, Lin, web |
| Redream | DC | closed | none; old code GPL-3.0 | 1.5.0, 2020-02-13 | JIT | HLE default | Win, Mac, Lin, And |
| Demul | DC, arcade | closed | none | 0.7 WIP, 2018-04-28 | see R1-25 | user BIOS | Win |
| lxdream | DC | walled | bare GPL-2.0 | 0.9.1, 2009-06-29 | not cycle-accurate | user BIOS | Lin, Mac |
| Deecy | DC | walled | MIT; MAME parts | v0.6.3, 2026-09-09 | not read | BIOS and flash | Win, Lin |
| Makaron, Chankast | DC | closed | none | 2000s (lead) | not read | not read | Win |

Sources by row: each project's README, licence file, site, store listing, or release metadata,
cited in its paragraph below; tiers from the register or this note's new lines.
"Bare GPL-2.0" means a GPL-2.0 text with neither "only" nor "or later" stated.

### Saturn: Mednafen and its descendants

- Mednafen's latest release is "Mednafen 1.32.1 April 5, 2024",
  whose news fixes "a gcc bug that broke the Saturn VDP1 rasterization code";
  its home page still says it is distributed under "the GNU GPLv2" ([Mednafen][mdf-home]).
  It is maintained but quiet, and stays walled.
- Its [Saturn documentation][mdf-ss], valid as of 1.32.1, builds the module only for 64-bit x86-64, AArch64,
  and PPC64 hosts and asks for a quad-core Haswell of at least 3.3 GHz.
  It warns against using it "in lieu of a Sega Saturn for authoritative game performance/FPS review purposes",
  because games "generally run ... with less slowdown than on a real Saturn".
- Firmware: the user supplies one Japanese and one North American and European BIOS, and three ST-V BIOS images;
  a sanity check is on by default, the page prints hashes of the expected images, and there is no high-level BIOS
  ([Mednafen, `ss.html`][mdf-ss]).
  Two games' ROM cartridges, The King of Fighters '95 and Ultraman, must also be dumped by the user.
- Accuracy is tuned per game by databases ([Mednafen, `ss.html`][mdf-ss]).
  The cache-mode list, already in [R1-02][r102-cache],
  picks full cache emulation for games such as Albert Odyssey and Dark Seed II,
  and a data-only mode with a high-level bypass for games such as Dragon Force II and Fighting Vipers;
  ST-V always runs full cache emulation.
  The "Horrible Hacks" list slows VDP1 per game,
  which it applies selectively "to avoid the likelihood of breaking some games due to overall Saturn emulation timing
  inaccuracies", and patches individual titles such as Grandia.
- It detects region from the header among eight regions, picks cartridges by database,
  leaves the Netlink modem unemulated, has a debugger and CRT shaders,
  and lists ST-V games with decryption or decompression chips as broken ([Mednafen, `ss.html`][mdf-ss]).
- [Beetle Saturn][beetle] is "fork of Mednafen Saturn ... ported to the libretro API" (README),
  a fork pushed on 2026-11-17 with 39 stars (metadata).
  Its licence file is the bare GPL-2.0 text, so it is walled
  ([libretro, "Beetle Saturn"][lr-beetle], "GPLv2").
  libretro adds save states, rewind, netplay, achievements, twelve players, and the Virtua Gun
  and other peripherals (same).
- Mednafen's descendants elsewhere: Saturn.emu on Android, "Advanced open-source Saturn emulator based on Mednafen",
  5K+ installs at $4.99 ([Google Play][saturnemu]); BizHawk's Saturnus core,
  which [TASVideos][tas-res] requires for Saturn movies, "BizHawk (2.0+)", with 2.11.1 released on 1 May 2026
  ([BizHawk release history][tas-bh]);
  and OpenEmu's Saturn plugin, `OpenEmu/Mednafen-Core`, which has no licence and is closed (metadata).

### Saturn: Ymir

- [Ymir][ymir], GPL-3.0 and open, was created on 2025-04-28, has 1,137 stars, and was pushed on 2026-11-25;
  v0.4.1 came on 2026-10-18 and a nightly on 2026-11-18 (metadata).
  [Flathub][fh-ymir] counts 15,569 installs, 1,016 in the last month.
- Its v0.4.0 notes claim it "is now compatible with 94.4% of the entire Saturn library",
  say its SCSP is now ahead of Mednafen's, and name "SMPC,
  bus contention and memory access timings" as the weakest parts ([Ymir v0.4.0][ymir-040]).
  They credit "@celeriyacon's test ROMs" with pushing its accuracy, and add Direct3D 12 and Metal backends,
  with GPU-accelerated VDP rendering on Direct3D 12 only, which they call "as accurate as the software renderer,
  save for undiscovered bugs".
  Its internal game database forces SH-2 cache emulation on for Dragon Force II among others (same).
- Techniques ([Ymir v0.3.2][ymir-032]; [README][ymir]):
  an SH-2 interpreter that models pipeline stalls and the fetch of two 16-bit instructions per 32-bit access,
  with no recompiler mentioned anywhere; optional SH-2 cache emulation; threaded VDP1, VDP2, and SCSP; and a debugger,
  rewind, and forward-compatible save states.
  The two SH-2s take about 50% to 60% of the emulator thread, and the SCSP with its DSP
  and the 68EC000 25% to 30% (v0.3.2).
- Firmware: "Ymir requires an IPL (BIOS) ROM to work", chosen by the disc's region,
  and "When using low level CD block emulation (LLE), Ymir also requires the CD block ROM" ([README][ymir]),
  the drive's SH-1 program; high-level CD block emulation is the default (v0.3.2).
- Its developer notes describe games that fail without exact behaviour:
  NiGHTS uses the slave SH-2's cache data array as scratch memory,
  Fighters Megamix crashes the slave CPU if the two SH-2s are not tightly synchronised,
  and Virtua Racing freezes "if VDP1 commands are processed too quickly"
  ([Ymir, `finicky-games`][ymir-notes], commit `fd3e4398`).
  Its notes on the SH-1 and the CD block were not opened, because they may rest on analysis of the drive's firmware.
- Hosts: Windows 10 or later, macOS 12 or later, most Linux distributions, and FreeBSD, on x86-64
  and Arm CPUs ([README][ymir]); no Android, iOS, or web build is listed (observed).
  Its libretro port, [Emir][emir], by the same author, offers cache emulation off by default,
  an SH-2 clock from 25% to 500%, an SCSP granularity from "0 - Fastest" to "5 - Most Accurate",
  and the low-level CD block ([libretro, "Emir"][lr-emir]).

### Saturn: the Yabause line

- [Yabause][yabause] began in 2003 and last released 0.9.15 on 24 August 2016
  ([Yabause site, capture 2017-12-23][yabause-site]);
  its repository has no GitHub releases and was last pushed on 2024-03-09,
  with 390 stars (metadata). libretro says "Without any update for years it seems upstream is now dead"
  ([libretro, "Yabause"][lr-yabause]).
  Its old domain now serves a copy of the site with casino advertising, so only the capture is linked.
- Its 0.9.15 changelog adds SH-2 cache emulation, low-level CD block emulation, optional SH-2 and SCU DMA timing,
  and the Musashi 68000 core ([Yabause ChangeLog][yabause-cl]).
- It carries a high-level BIOS: libretro lists the BIOS as optional,
  warns "the emulated bios is not perfect and has lesser compatibility",
  and needs the real BIOS for multi-disc playlists ([libretro, "Yabause"][lr-yabause]).
  [EmulatorJS][ejs] uses Yabause as its default Saturn core, the only web Saturn emulator found.
- [Kronos][kronos] is "a Sega Saturn emulator forked from uoYabause", for Linux and Windows
  ([Kronos site][kronos-site]),
  and "a fork of YabaSanshiro, which is itself a fork of Yabause" ([libretro blog, 2018][lr-kronos-blog]).
  It renders with compute shaders and needs OpenGL 4.3, emulates the ST-V,
  offers experimental SH-2 cache support "required for some game to work properly", and scales to 8K
  ([libretro, "Kronos"][lr-kronos]).
  Its high-level BIOS runs only when forced,
  because the project "doesn't recommend using this HLE bios" and gives no support
  for it (same). libretro's 2018 post calls its CPU core "a high performance SH2 cached interpreter"
  ([libretro blog, 2018][lr-kronos-blog]).
  Version 2.6.1 of 2023-12-28 and a later deprioritising of Saturn work are leads only,
  as the guard blocked its metadata in the writer's and fix pass's calls.
- YabaSanshiro, by devMiyax, is the Saturn's phone emulator:
  "Yaba Sanshiro Z" has 500K+ installs with ads and was updated on 2026-11-24, and "YabaSanshiro 2 Pro" 50K+ at $4.99
  ([Google Play][gp-ys]; [Pro][gp-ys-pro]).
  It renders with OpenGL ES 3.1 and Vulkan, says it ships no BIOS or game data,
  and calls itself "based on the Yabause open-source project
  and ... provided under the GPL license" (same). libretro's Kronos post names "the dynarecs used in YabaSanshiro"
  ([libretro blog, 2018][lr-kronos-blog]),
  and libretro calls its core "outdated, known for having many issues, and unmaintained"
  ([libretro, YabaSanshiro page][lr-ys], titled "Yabause").
- Its [terms of use][ys-terms], effective 30 March 2025,
  say "The App is provided solely for personal and non-commercial use" and "Even when modifying
  or redistributing the source code, non-commercial use is expected under the terms of the GPL license",
  and point to `github.com/devmiyax/yabause`, which is gone.
  Its download page, `www.yabasanshiro.com/download`, not linked because it offers a disc-dumping tool,
  offers a source tarball of v1.20.55 "under the GNU GPL" with credentials removed, and "Panzer Dragoon Trilogy for PC",
  native builds that a builder makes from the user's own discs; none of these was opened,
  and the tarball is walled until registered.

### Saturn: closed, historical, and newer projects

- `SSF`, by Shima, is closed freeware: its GitHub repository holds only a heading and no licence
  (README; licence endpoint 404).
  The Emulation General wiki says it "Used to be the emulator of choice", runs on Windows and Android,
  and that City Connection uses it in the engine of its Saturn Tribute re-releases (lead; page closed).
- GiriGiri, by Cassini and MegaDeath, stopped at 0.6a;
  the wiki says Sega hired MegaDeath and ran GiriGiri as an official emulator in its CyberDisc service until early 2004
  (lead; page closed).
  That is the only Saturn emulator by Sega found.
- Satourne and Nova were proprietary Windows emulators (lead); [Saturnin][saturnin], by Renaud Toumazet, is Apache-2.0
  (licence endpoint; README); that it dates from the early 2000s is from memory.
- [erings][erings], GPL-3.0, is a Go emulator whose VDP1 and VDP2 pipelines "are written once and run either
  as ordinary Go on the CPU or as compute shaders on the GPU", and says "Without one, a built-in HLE
  (high-level emulation) BIOS boots the game" (README); "Compatibility is not formally tracked yet" (same).
  It patches the BIOS's region check, so a US BIOS plays Japanese games and the reverse (same), and renders with Metal,
  Direct3D 12, or Vulkan 1.3 on macOS, Windows, and Linux (same).
- MAME's Saturn driver is marked not working (lead); [ares][ares] has no Saturn (site; README).
  The Saturn MiSTer core is closed (register).

### Dreamcast: Flycast and its forks

- [Flycast][flycast]'s status, licence, store figures, and arcade boards are in [R1-25][r125-naomi];
  this survey adds what is specific to the Dreamcast.
  Flathub counts 7,918 installs in the last month ([Flathub][fh-flycast]),
  and its Play listing says it runs "most Dreamcast games
  (including Windows CE ones)",
  has modem and LAN adapter emulation and texture packs, and "contains no ads" ([Google Play][gp-flycast]).
- Its libretro core offers a forced high-level BIOS, an optional AICA DSP,
  a "Force Windows CE Mode" that enables full MMU emulation, and translucency sorting per strip, per triangle,
  or "Per-Pixel (accurate, but slowest)" ([libretro, "Flycast"][lr-flycast]).
  The BIOS is optional; the table no longer names a flash file, which [R1-07][r107-home] recorded (same).
- Its techniques are not in prose the survey could read: its wiki is closed and its releases blocked.
  SH-4 recompilers for x86-64 and Arm, an interpreter, and OpenGL, Vulkan, and Direct3D renderers are from memory.
- iOS support ended: "Due to persistent harassment from an iOS user, support
  for this platform has been dropped" ([README][flycast]).
  Its online service DCNet redirects to the closed wiki (research log).
- [parallel-dc][pdc] "started life as libretro's own fork of Flycast ... and has
  since been developed independently" (README); `libretro/flycast` redirects to it.
  It says "**No BIOS required.**" because its BIOS routines are reimplemented,
  adds an optional "cycle-accurate timing model", SH-4 fixes "from an audit against upstream and the hardware
  (DIV1, FTRC, FIPR/FTRV and more)",
  and an experimental Vulkan renderer that draws "tile by tile with compute shaders the way the PowerVR2 does,
  with exact per-pixel sorting" (README).
  Its regression tests use "a reference software renderer used as an oracle", an emulator oracle (same).
- Ports and forks, all walled: [Flycast Dojo][dojo] for netplay and Fightcade,
  [Hollycast][hollycast] with cover art and DCnet,
  and [flycast-vita][fvita] for the Vita carry Flycast's bare GPL-2.0 text
  (licence endpoints);
  [Castation][castation] ships a GPL-3.0 licence file over Flycast's code
  (licence endpoint),
  runs only on a jailbroken PS5, and says "No BIOS and no games are included, and none will be" (READMEs).
  OpenEmu's `Flycast-Core` and `Reicast-Core` plugins have no licence and are closed (metadata).

### Dreamcast: Reicast and nullDC

- [Reicast][reicast] is archived, with r20.04 of 2020-04-02 its last release,
  and its README says "This project is no longer active" and points to Flycast (metadata; README).
  Its site said it "primarily aims for speed and to run on android" and "is derived from the nullDC codebase"
  ([reicast.com, capture 2020-03-22][reicast-site]).
  Its Google Play listing is gone (HTTP 404); the reason was not found.
  Its high-level BIOS is recorded in the [register][register],
  from R1-25. [parallel-dc][pdc] says its code is "*not* bound by the Individual Contributor License Agreement of the
  reicast repository" (README), the only evidence found that Reicast had one; that Reicast moved from GPL to BSD under
  it is from memory.
- nullDC, by drk||Raziel and ZeZu, last released 1.0.4 r136 on 2011-08-21 for Windows;
  it needs BIOS files and used plugins, some ported from Chankast
  ([Sega Retro, "nullDC"][sr-nulldc], capture 2025-12-30).
  Its Google Code metadata lists dynarec and JIT labels ([Google Code][gc-nulldc]).
- nullDC was revived: its [site][nulldc-site] offers a web build that takes the BIOS and flash images,
  and builds for Windows, macOS, and Linux on x86-64, Arm64,
  and RISC-V, the latest on 2026-11-25 ([builds][nulldc-builds]).
  The builds use Rust's target names (observed); the revived code could not be evaluated,
  because the guard blocks `skmp/nullDC-rust` (above).

### Dreamcast: Redream

- Redream's current builds are closed: [redream.io][rd-site] states no licence,
  and a $6 "Premium" adds high-definition rendering and save slots ([download page][rd-dl]).
  Its stable release is 1.5.0 of February 2020
  ([progress report, February 2020][rd-2020]), with development builds three months old (download page).
  Google Play counts 1M+ installs, updated on 2026-08-08 with modem emulation "sufficient for playing PSO on Sylverant"
  ([Google Play][gp-rd]).
- Its older code, [inolen/redream][redream-gh], is GPL-3.0 and open, last pushed in 2023,
  and says the project moved to GitLab (metadata; README); `libretro/redream`, its GPL-3.0 libretro fork, is gone
  (HTTP 404).
- Its [help page][rd-help] says: "By default,
  redream will use its own replacement BIOS that provides most of this same functionality,
  sans some features such as the opening boot animation and the audio CD player."
  In 2017 it began to "high-level emulate the Flash rom operations as well as the syscalls provided by the BIOS"
  ([July 2017][rd-2017]),
  and by 2020 "If a game runs with the retail BIOS, it will also run with our replacement HLE BIOS"
  ([February 2020][rd-2020]).
- Its compatibility list counts 921 games, 96.14%, as playable from start to finish ([compatibility][rd-compat]),
  up from 456, 68.88%, in its January 2018 hand test of 650 or more ([January 2018][rd-2018]).
- Techniques: a dynamic recompiler of SH-4 code with self-modifying code caught by memory watches,
  and per-triangle translucency sorting ([January 2018][rd-2018]); new ARM JITs for Android and the Raspberry Pi
  ([February 2020][rd-2020]).
  Hosts are Windows, macOS, Linux, Android, and the Raspberry Pi 4 ([redream.io][rd-site]).

### Dreamcast: Demul, lxdream, Deecy, and historical emulators

- [Demul][demul] last posted "DEmul 0.7 WIP" on 28 April 2018 (site); [R1-25][r125-naomi] covers it.
  Its FAQ says it cannot start without the matching BIOS set, creates its own flash file, and plans Saturn support
  (site; the note's own translation from Russian).
- [lxdream][lxdream-gh] runs on Linux and OS X and is "capable of running most demos
  and some games" ([lxdream][lxdream-site]); 0.9.1 of 2009 added GDB remote debugging,
  warns "The SH4 emulation is not cycle accurate" and calls MMU translation slow ([0.9.1 notes][lxdream-091]).
  It boots homebrew from disc without the boot ROM and builds MIL-CD images on the fly (news, 2010).
  Its fork [mxdream][mxdream] for macOS is walled with it.
- [Deecy][deecy], "an experimental Dreamcast emulator written in Zig", requires "bios and flash dumps",
  has a debug interface, and added rewind and MIL-CD reading from CHD in 2026 (README; releases, research log).
  It says its CHD code is "inspired by, or even direct ports of" MAME's (README).
  Its sources include `lars-olsson.sizious.com`, a "Boot ROM disassembly", not linked because it is closed,
  and its file of GD-ROM security data from MAME is closed (README).
- Makaron, by Deunan Knute, ran Windows CE games with Demul (lead); its author's blog is closed as a key hazard
  (research log).
  Chankast was an early Windows emulator whose code fed nullDC's plugins
  ([Sega Retro, "nullDC"][sr-nulldc]);
  that it first ran commercial games around 2004 is from memory. washDC, GPLv3 by the [wiki][egw-dc] and inactive,
  was not opened (lead).

### Frontends and stores

| Frontend or store | Saturn | Dreamcast |
|---|---|---|
| libretro nightlies, Windows and Linux | Beetle, Kronos, Yabause, YabaSanshiro, Ymir | Flycast, parallel-dc |
| libretro nightlies, macOS, Android, iOS | the same, less Kronos | Flycast, parallel-dc |
| RetroArch on the App Store; on Steam | listed; Beetle and Kronos as add-ons | not listed; no Flycast add-on |
| [OpenEmu][openemu] 2.4.1 | Mednafen | not on the official list |
| [Provenance][provenance] | Mednafen | Flycast |
| Lemuroid; F-Droid | none | none |

- Sources: [buildbot listings][buildbot], files of 2026-11-25; [App Store][appstore-ra]
  and [Steam][steam-ra] listings (observed); [OpenEmu's notes][openemu-notes]; [Provenance's README][provenance];
  [Lemuroid's README][lemuroid]; [F-Droid searches][fdroid] for "saturn", "dreamcast", "flycast", and "yabause" (raw).
- RetroArch's [Saturn guide][ra-saturn] names four cores,
  says Beetle Saturn and Kronos "cannot play Saturn games without" a BIOS "dumped from your own console",
  and has no Dreamcast counterpart (HTTP 404).
- Provenance labels Mednafen and Beetle Saturn GPL-2.0-or-later in its licence table;
  a packager's table does not change their tier (LICENSES.md).
- OpenEmu calls its Saturn support CPU-intensive, needing a quad-core i7 (notes).

### Legal exposure

This section builds on [R0-02][r002].
It is not legal advice.

- Encryption.
  Saturn game data is not encrypted (inference, from R1-02 and R1-06): the disc block and the BIOS approve a disc,
  and the protection mark Sega's patents describe sits outside the data sectors, which disc images lack
  ([R1-02, media][r102-media]; [R1-06][r106-patterns]).
  So [R0-02 option 1][r002-o1] fits, subject to R0-02's undecided question whether such a check is an access control
  ([R0-02, open questions][r002-open]).
  Dreamcast executables are scrambled on the GD-ROM and unscrambled in memory,
  and the scheme fell through MIL-CD loading in 2000
  ([Wikipedia, "GD-ROM"][w-gdrom], "Dreamcast console"; tertiary, citing a fan site).
  The statute counts descrambling a scrambled work as circumvention
  ([R0-02, "The statute"][r002-statute]);
  with the user's BIOS the console's code descrambles, but a high-level BIOS
  that boots a GD-ROM image does it itself (inference).
- Firmware.
  [Mednafen][mdf-ss], Beetle Saturn, Kronos, [Ymir][ymir], Demul, lxdream for games, and Deecy need the user's dump
  ([R0-02 option 4][r002-o4]); Ymir's low-level CD block needs a second, the drive's ROM.
  Yabause, Kronos, YabaSanshiro by descent (inference), erings, [Flycast][lr-flycast], parallel-dc, Castation, Reicast
  (register), and [Redream][rd-help] carry high-level BIOSes ([R0-02 option 5][r002-o5]), all closed; so do the
  high-level CD blocks of Ymir and Yabause.
  That Sega has not published the firmware of either console is from memory;
  [R0-02, "Makers' system software and licence terms"][r002-terms] does not cover Sega.
- Region and lock-out.
  [Redream][rd-2018] says "The region lock check is now automatically patched at runtime such
  that any region game will run, regardless of the region of the BIOS you use"
  ([January 2018][rd-2018]),
  a deliberate bypass of a lock-out (inference), and [erings][erings] patches the BIOS's region check (README);
  R0-02 records that Divineo treated a disc check as an access control, on the console
  ([R0-02, "Console checks"][r002-checks]).
- Boot logos.
  Comstedt says every bootable Dreamcast disc carries Sega's licence-screen code,
  which shows the Sega logo and licence message and which the ROM checks byte by byte
  ([Comstedt, "IP.BIN and 1ST_READ.BIN"][mc-ipbin]; a lead, from boot ROM behaviour, so not relied on).
  If so, the Dreamcast is close to [Sega v Accolade][r002-logos]'s facts, game-supplied code that the console requires,
  and [R0-02 option 16][r002-o16] applies: a high-level BIOS that never runs that code draws nothing (inference);
  Redream's omits "the opening boot animation" ([help][rd-help]).
- Dumping guides: the [YabaSanshiro site][ys-site] recommends a dumping tool and links a how-to,
  and libretro links RetroArch's guide; none was followed beyond the guide's own text ([R0-02 option 7][r002-o7]).
- Takedowns.
  GitHub's notice repository holds one Sega notice, of 2019-10-21,
  about a mobile game's source posted without permission, whose repository is now closed in the register
  ([GitHub DMCA, 2019-10-21][dmca-sega]);
  searches for "dreamcast", "saturn", and "sega" found no notice naming an emulator or a BIOS of either console
  (research log).
  In 2000 Sega of America took action against more than 60 sites and 125 auction sites selling pirated Dreamcast games,
  and called it a first level of cease-and-desist orders
  ([Out-Law, 2000-07-24][outlaw]; secondary), aimed at copies, not emulators.
  In 2016 PayPal limited [Yabause][yabause-site]'s donation account, having decided, the project wrote,
  that Yabause was "illegal and apparently infringing on Sega's copyright":
  a third party acting on a right that Sega was not found to have asserted;
  the project wrote that "we have never received any legal threats or letters from Sega or anyone else
  since our first release back in 2003" ([Yabause site, capture][yabause-site]).
  A web search on 2026-11-26 found no Sega statement on emulators,
  matching [R0-02, "Makers' statements"][r002-statements].
- Sega's own use: the CyberDisc service and City Connection's use of SSF are leads only (above).
- Money and names: [Redream][rd-dl]'s premium tier and YabaSanshiro's paid app and ads
  ([R0-02 option 8][r002-o8]);
  YabaSanshiro's listings say it is "not affiliated with or endorsed by SEGA Corporation",
  an example of [R0-02 option 14][r002-o14] ([Google Play][gp-ys]).
- Licence compliance: YabaSanshiro sells and advertises an app it calls GPL and offers its source as a tarball,
  but its [terms][ys-terms] add a non-commercial expectation that conflicts with the GPL's freedoms,
  so its code cannot be reused with confidence (inference).
  Its PC builds of Panzer Dragoon are made by a builder it distributes, from the user's own discs, so the user,
  not the site, makes the derivative of the games (inference).

### How hard the family is to emulate

- The hardware is in [R1-02][r102-cpu] for the Saturn and [R1-03][r103-cpu] for the Dreamcast;
  this adds what the emulators' prose shows.
- Saturn, two CPUs on one bus: every respected emulator needs per-game help.
  [Mednafen][mdf-ss] and [Ymir][ymir-040] keep databases that force cache modes or slow VDP1,
  Kronos calls cache support required for some games,
  and Ymir names bus contention and memory timing as its weakest parts (above).
  Full cache emulation is costly: Mednafen does not enable it everywhere "primarily due to the large increase in host
  CPU usage" ([Mednafen, `ss.html`][mdf-ss]).
  So a design that models both SH-2 caches and the shared bus at all times, fast enough to run,
  would remove the databases (inference).
- Saturn, other parts: VDP1's drawing time is visible to games, sound runs on its own clock
  ([R1-02, audio][r102-audio]),
  and the CD block is a third processor that Ymir can run at a low level only with a firmware dump (above);
  that Yabause's low-level CD block needs one too is an inference from its changelog.
- Dreamcast: Windows CE games need the full MMU, translucency must be sorted per pixel to be exact,
  and the AICA's DSP costs host time (Flycast and parallel-dc, above),
  consistent with [R1-03, tile-based rendering][r103-pvr].
  The approximate FIPR and FTRV results remain unmeasured against hardware; parallel-dc's audit publishes no results
  ([R1-03, open questions][r103-open]).
- Both consoles are well covered by game-level results: Ymir 94.4% and Redream 96.14% by their own lists.

### Tests and published results

| Suite | Tier | Public | Oracle | Results |
|---|---|---|---|---|
| [240p Test Suite][s240p] | open | yes | developed and tested on hardware | one unnamed emulator fault |
| Celeriyacon's `sstests` | none | no | presumably a Saturn (inference) | Ymir, MiSTer core (lead) |
| [saturn-tests][sat-tests] | open | yes | not stated | none found |
| YabauseUT, in [Yabause][yabause] (from memory) | walled | yes | not stated | none found |
| [SingleStepTests sh4][sst-sh4] | open | yes | Reicast's interpreter | none found |
| [dctest][dctest] | open | yes | not stated | none found |
| `dc-arm7wrestler` | closed | yes | implied hardware | none found |
| [Flycast's game tests][fc-tests] | walled | results only | boot and screenshot | 904 of 913 boot |

- The 240p suite, GPL-2.0-or-later, has Saturn and Dreamcast builds,
  the Saturn's running on a homebrew-capable system and the Dreamcast's "on any MIL-CD compatible Dreamcast" (README).
  Its devlog says some emulators show artefacts when switching screens and
  that hardware shows them to be emulation errors ([devlog, 2022-07-18][devlog-dc2]), naming no emulator.
  It tests display and audio chains, not chips.
  Its Dreamcast build reads console data from the BIOS and flash, including dial-up and ISP details (same),
  so its output on a console must not be recorded.
- Celeriyacon's tests are credited by Ymir (above) and are "not public",
  per a fan site that reports the MiSTer core passing all known tests except VDP1's
  ([Sega Saturn Shiro, 2025-08-08][shiro-0808]; [2025-11-14][shiro-1114]; lead).
- Ymir's author publishes [saturn-tests][sat-tests], MIT,
  "a suite of tests that I used to help develop a Sega Saturn emulator", built with the Yaul toolchain;
  [dctest][dctest], BSD-3-Clause from the washDC project, is a "collection of Dreamcast test programs",
  last pushed in 2017 (READMEs; licence endpoints).
  Neither states an oracle or publishes results, and neither was opened beyond its README.
- YabauseUT, a unit-test program inside Yabause's repository, is from memory; no prose read names it.
- [SingleStepTests sh4][sst-sh4] was "generated using Reicast's CPU interpreter", covers all SH-4 encodings except PREF,
  MACL, and MACH, and warns "Any bugs present in Reicast will be reproduced in this test" ([README][sst-sh4]);
  its README holds pseudo-code, not reproduced.
- `snickerbockers/dc-arm7wrestler` tests the AICA's ARM7 and shows text drawn slowly
  when an emulator does not interleave the ARM7 and SH-4 tightly, which "is not a problem on real hardware" (README);
  it has no licence, so only results are usable.
- Flycast's automated run e670746 of 2026-09-19 lists 233 of 235 US, 234 of 235 EU,
  and 226 of 227 Japanese Dreamcast games, and 211 of 216 arcade games, as passing
  ([test results][fc-tests]; counted from the data, research log);
  it records a screenshot and log per game and compares nothing with hardware (inference).
- No SH-2 test vectors, no public suite that states a hardware oracle,
  and no published per-emulator table against one were found for either console
  (register; [R1-02, tests][r102-tests]; GitHub repository-name searches, 2026-11-26).

## Options and trade-offs

The options answer four questions, and the recommendation takes one answer to each.

### Which emulators the roadmap studies

- **What:** [R1-52][studies] already plans a study of [Flycast][flycast]; add a study of [Ymir][ymir],
  of [Mednafen][mdf-ss]'s Saturn module, or of the old open [Redream][redream-gh] code.
- **Costs:** Mednafen and Flycast are walled and need reader sessions; Ymir's CD block notes, its high-level CD block,
  and every project's high-level BIOS must be skipped;
  the open Redream code was last pushed in 2023 (metadata) and its BIOS is closed.
- **Gains:** Ymir is open, active, documents finicky games in prose, and claims the best sound;
  Mednafen is the long-standing accuracy reference; open Redream is the only open-tier Dreamcast emulator found.
- **Used by:** the roadmap's practice of one study per leading emulator.

### Which oracles the family's cores are tested against

- **What:** the [240p suite][s240p]; [SingleStepTests sh4][sst-sh4]; [saturn-tests][sat-tests] and [dctest][dctest];
  game lists; or new tests run on Rustalgia's own consoles.
- **Costs:** the 240p suite tests output, not chips; the SH-4 vectors inherit Reicast's bugs; game lists give no cause;
  saturn-tests and dctest state no oracle; console tests need a Saturn and a Dreamcast that run homebrew,
  and the Saturn's best tests are not public.
- **Gains:** the 240p suite is the only open suite tested on both consoles;
  the SH-4 vectors cover nearly every encoding; console tests could settle the SH-2 cache, VDP1 timing,
  and FIPR and FTRV questions.
- **Used by:** [Ymir][ymir-040] (Celeriyacon's tests); [parallel-dc][pdc] (its own renderer); Flycast (game boots).

### How firmware is handled

- **What:** the user's BIOS (and Dreamcast flash), as [Mednafen][mdf-ss], [Ymir][ymir], and [Deecy][deecy] require;
  a high-level BIOS, as [Redream][rd-help] and [Flycast][lr-flycast] offer, which Rustalgia would write from open prose;
  or both.
- **Costs:** a dump is a barrier for users;
  a Saturn high-level BIOS lags in compatibility (libretro) and no open source read lists the services it must provide;
  a Dreamcast high-level BIOS must descramble GD-ROM executables itself, the statute's wording.
- **Gains:** a dump reproduces the console exactly and keeps descrambling in Sega's code;
  a high-level BIOS needs nothing from Sega
  ([R0-02 option 5][r002-o5]) and, by [Redream][rd-2020]'s claim, can match the retail BIOS.
- **Used by:** the projects in the legal section.

### Which accuracy target the Saturn takes

- **What:** full cache and bus timing at all times; a per-game database,
  as [Mednafen][mdf-ss] and [Ymir][ymir-040] keep; or neither.
- **Costs:** the first costs host time, which Mednafen gives as its reason not to do it;
  the second needs a maintained list and hides faults; the third breaks the games Ymir and Mednafen list.
- **Gains:** the first removes per-game lists and fixes games not yet found; the second runs on slower hosts.
- **Used by:** Mednafen for ST-V only (full); Mednafen and Ymir for the Saturn (database).

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** add a Ymir study by direct reading, skipping its CD block notes and its high-level CD block;
  keep Flycast's study ([R1-52][studies]) as a reader session;
  read Mednafen's Saturn module only through its prose unless a reader session is wanted.
- **Oracles:** adopt the 240p suite for both consoles, SingleStepTests sh4 as a regression aid only,
  saturn-tests and dctest as candidates to be run on consoles before they are trusted,
  and plan console tests in [phase 5][phase5] for the SH-2 caches, VDP1 timing, and the SH-4's approximate instructions.
- **Firmware:** the user's BIOS by default for both consoles;
  a Dreamcast high-level BIOS only after [R2-12][phase2] weighs the descrambling question; no automatic region patch.
- **Accuracy:** full SH-2 cache and bus emulation as the Saturn's default,
  with any per-game list only as a speed option, because the evidence shows the lists hide timing faults.

## Implications for Rustalgia

- [R2-12][phase2] must decide whether a Dreamcast high-level BIOS descrambles GD-ROM executables itself,
  since that is the statute's wording, and whether Rustalgia follows the console's region check.
- [R2-01][phase2] and the scheduler work must budget for two SH-2s with full caches on one bus,
  which [Mednafen][mdf-ss] and [Ymir][ymir-032] show to be the Saturn's main cost (How hard).
- [R2-05][phase2] should plan an exact per-pixel translucency path for the PowerVR2,
  as [parallel-dc][pdc]'s tile renderer does, beside a fast one.
- [R2-15][phase2] should take the [240p suite][s240p],
  and [phase 5][phase5] should budget for a Saturn and a Dreamcast that run homebrew,
  because no public suite found states a hardware oracle; saturn-tests and dctest need console runs first.
- The guard's prefix matching hides the revived nullDC in Rust, which a Rust project would want to evaluate;
  an end anchor, in a change of its own, would let it be evaluated (Findings).

## Open questions

- What services does the Saturn's BIOS provide to games ([R1-06][r106-open])?
  No open source read lists them: the [Yabause wiki][yabause-wiki] has no BIOS page,
  [Mednafen's prose][mdf-ss] has none, and the high-level BIOSes are closed;
  a [phase 5][phase5] test on a Saturn that observes calls from a homebrew program would answer it.
- Do Dreamcast games depend on the SH-4's approximate FIPR and FTRV results ([R1-03][r103-open])?
  Comparing an exact model with a Dreamcast in [phase 5][phase5] would answer it.

## Sources

Every source below was read on 2026-11-26, as raw text, unless an entry says otherwise.
Repository READMEs and licence files were read at their default branch through the GitHub API on that date.
Closed addresses are in code spans, with the reason.

Repository documents:

- [ADR 0006][adr6], with ["Sources that are not emulators"][adr6-refs]; [research guide][guide];
  [research roadmap][roadmap]; [source register][register].
- [R0-02, legal baseline][r002]; [R0-05, "Sega, arcade, Xbox, and other systems"][r005-sega]; [R1-02, primer][r102-cpu];
  [R1-03, primer][r103-cpu]; [R1-06, catalogue][r106-home]; [R1-07, catalogue][r107-home];
  [R1-25, arcade survey][r125-naomi].

Saturn emulators, prose only:

- Mednafen: [home page][mdf-home], 1.32.1; [Saturn documentation][mdf-ss], last updated 2024-03-19.
- [Beetle Saturn README][beetle]; libretro: ["Beetle Saturn"][lr-beetle], ["Yabause"][lr-yabause],
  ["Kronos"][lr-kronos], [the YabaSanshiro page][lr-ys], titled "Yabause", ["Emir"][lr-emir],
  each last updated 2026-10-22.
- Ymir: [README][ymir], commit `fd3e4398`; release notes [v0.3.2][ymir-032] and [v0.4.0][ymir-040];
  [`docs/dev-notes/finicky-games`][ymir-notes], commit `fd3e4398`; [Flathub][fh-ymir]; [Emir][emir], project page,
  LICENSE, README, and GitLab's licence detection, GPL-3.0-or-later, with last activity 2026-11-20.
- Yabause: [repository][yabause] metadata and COPYING files; [ChangeLog][yabause-cl], on `master`,
  last pushed 2024-03-09, as the guard allows no commit lookup; [wiki][yabause-wiki], main page revision 5304,
  last modified 2016-08-10, and FAQ; [site, capture 20171223161130][yabause-site].
  Its current domain, `yabause.org`, not linked: a copy of the old site with casino advertising.
- Kronos: [README][kronos]; [site][kronos-site]; [libretro blog, 2018-12-23][lr-kronos-blog].
- YabaSanshiro: [site][ys-site]; [terms of use][ys-terms]; [Google Play, Yaba Sanshiro Z][gp-ys];
  [Google Play, Pro][gp-ys-pro].
  Read but not linked: `www.yabasanshiro.com/download`, which offers a disc-dumping tool.
  Not opened, and not linked: `www.yabasanshiro.com/BackupCDrom_latest.zip`, a disc-dumping tool;
  `www.yabasanshiro.com/pds-recompile`, builds made from game binaries; `www.yabasanshiro.com/howto`,
  how-to pages for making disc images; `www.yabasanshiro.com/games`, unopened, a precaution;
  `github.com/devmiyax/yabause`, gone.
- [Saturn.emu on Google Play][saturnemu]; TASVideos: [EmulatorResources][tas-res], [BizHawk release history][tas-bh],
  last edited 2026-05-31.
- `github.com/shimazzz/SEGASaturnEmulator-SSF`, README and licence endpoint, not linked: no licence.
- [Saturnin README][saturnin]; [erings README][erings]; [ares site][ares].
- `github.com/OpenEmu/Mednafen-Core`, `Flycast-Core`, `Reicast-Core`, and `yabause`, metadata, not linked: no licence.

Dreamcast emulators, prose only:

- Flycast: [README][flycast]; [libretro, "Flycast"][lr-flycast]; [Flathub][fh-flycast]; [Google Play][gp-flycast];
  [test results][fc-tests], run e670746 of 2026-09-19 (observed).
  Its wiki, `github.com/TheArcadeStriker/flycast-wiki`, not opened: closed.
- [parallel-dc README][pdc]; [Flycast Dojo README][dojo]; [Hollycast README][hollycast]; [Castation README][castation];
  [flycast-vita][fvita], metadata.
- Reicast: [README, LICENSE, LICENSE-GPL, and LICENSE-LGPL][reicast];
  [reicast.com, capture 20200322201451][reicast-site], because the live site refuses scripts.
- nullDC: [Google Code metadata][gc-nulldc]; [Sega Retro, "nullDC"][sr-nulldc], capture 20251230125822, revision 401177;
  [nullDC site][nulldc-site]; [builds][nulldc-builds].
  `github.com/skmp/nullDC-rust`, not opened and not linked: blocked before evaluation.
- Redream: [home page][rd-site]; [download][rd-dl]; [help][rd-help]; [compatibility][rd-compat]; [Google Play][gp-rd];
  progress reports of [July 2017][rd-2017], capture 20170727121103, [January 2018][rd-2018], capture 20190608072803,
  and [February 2020][rd-2020], capture 20200216214336; [inolen/redream README][redream-gh].
- [Demul site][demul], news and FAQ; [Google Code metadata for Demul][gc-demul].
- lxdream: [repository][lxdream-gh] metadata and COPYING; [news][lxdream-site]; [0.9.1 notes][lxdream-091];
  [FAQ][lxdream-faq]; [mxdream][mxdream], metadata.
- Deecy: [README and releases][deecy]; [site][deecy-site].
  Not linked: `lars-olsson.sizious.com`, a boot ROM disassembly; Deecy's `src/gdrom_secu.zig`, GD-ROM security data.
- Makaron's author's blog, `dknute.livejournal.com`, closed as a key hazard; Makaron and Chankast have no page read.

Frontends and tests:

- [RetroArch Saturn guide][ra-saturn]; [libretro buildbot][buildbot];
  [OpenEmu][openemu] and [release notes][openemu-notes]; [Provenance README and LICENSES.md][provenance];
  [EmulatorJS systems][ejs]; [RetroArch on the App Store][appstore-ra] and [on Steam][steam-ra] (observed);
  [Lemuroid README][lemuroid]; [F-Droid search][fdroid] for "saturn", "dreamcast", "flycast", and "yabause".
- [240p Test Suite README][s240p]; [devlog, 2022-07-18][devlog-dc2]; [SingleStepTests sh4 README][sst-sh4],
  commit `48975cb1`; [saturn-tests][sat-tests] and [dctest][dctest], READMEs and licence files;
  `github.com/snickerbockers/dc-arm7wrestler` README, not linked: no licence.

Law, press, and wikis (secondary, or leads):

- [GitHub DMCA notice, 2019-10-21][dmca-sega]; [Out-Law, "Sega takes action against game pirates"][outlaw], 2000-07-24.
- [Wikipedia, "GD-ROM"][w-gdrom], revision 1387464400 (tertiary); [Comstedt, "IP.BIN and 1ST_READ.BIN"][mc-ipbin],
  last modified 2000-11-16 (lead).
- Sega Saturn Shiro, ["Saturn MiSTer core now passes every test"][shiro-0808], 2025-08-08,
  and ["Tests continue to pay dividends"][shiro-1114], 2025-11-14 (lead).
- [Emulation General wiki, "Dreamcast emulators"][egw-dc], revision 152618 (lead).
- Not linked, closed as a precaution:
  `emulation.gametechwiki.com/index.php/Sega_Saturn_emulators` and `emulation.gametechwiki.com/index.php/GiriGiri`,
  for links to leaked documents and hacked builds; `archive.org/details/SegaManuals`, "leaked,
  official documentation" by that wiki; `en.wikipedia.org/wiki/Bleem!`, which mentions a leaked beta.

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[adr6-refs]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#sources-that-are-not-emulators
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-statute]: R0-02-legal-baseline.md#the-statute
[r002-checks]: R0-02-legal-baseline.md#console-checks-and-use-after-circumvention
[r002-terms]: R0-02-legal-baseline.md#makers-system-software-and-licence-terms
[r002-statements]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-logos]: R0-02-legal-baseline.md#boot-logos
[r002-open]: R0-02-legal-baseline.md#questions-no-court-was-found-to-have-decided
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r005-sega]: R0-05-source-map.md#sega-arcade-xbox-and-other-systems
[r102-cpu]: R1-02-primer-32-and-64-bit.md#saturn
[r102-cache]: R1-02-primer-32-and-64-bit.md#caches-and-segments
[r102-audio]: R1-02-primer-32-and-64-bit.md#saturn-2
[r102-media]: R1-02-primer-32-and-64-bit.md#saturn-3
[r102-tests]: R1-02-primer-32-and-64-bit.md#tests-and-their-oracles
[r103-cpu]: R1-03-primer-sixth-generation.md#dreamcast
[r103-pvr]: R1-03-primer-sixth-generation.md#dreamcast-tile-based-rendering
[r103-open]: R1-03-primer-sixth-generation.md#open-questions
[r106-home]: R1-06-catalogue-32-and-64-bit.md#home-consoles
[r106-patterns]: R1-06-catalogue-32-and-64-bit.md#patterns-across-the-catalogue
[r106-open]: R1-06-catalogue-32-and-64-bit.md#open-questions
[r107-home]: R1-07-catalogue-sixth-generation.md#home-consoles
[r125-naomi]: R1-25-arcade-family.md#naomi-atomiswave-and-hikaru-demul-and-flycast
[mdf-home]: https://mednafen.github.io/
[mdf-ss]: https://mednafen.github.io/documentation/ss.html
[beetle]: https://github.com/libretro/beetle-saturn-libretro
[lr-beetle]: https://docs.libretro.com/library/beetle_saturn/
[lr-yabause]: https://docs.libretro.com/library/yabause/
[lr-kronos]: https://docs.libretro.com/library/kronos/
[lr-ys]: https://docs.libretro.com/library/yabasanshiro/
[lr-emir]: https://docs.libretro.com/library/ymir/
[lr-flycast]: https://docs.libretro.com/library/flycast/
[saturnemu]: https://play.google.com/store/apps/details?id=com.explusalpha.SaturnEmu
[tas-res]: https://tasvideos.org/EmulatorResources
[tas-bh]: https://tasvideos.org/BizHawk/ReleaseHistory
[ymir]: https://github.com/ymir-emu/ymir/tree/fd3e4398bcc535dbc8d932a7a85f97e8a756d6fc
[ymir-032]: https://github.com/ymir-emu/ymir/releases/tag/v0.3.2
[ymir-040]: https://github.com/ymir-emu/ymir/releases/tag/v0.4.0
[ymir-notes]: https://github.com/ymir-emu/ymir/tree/fd3e4398bcc535dbc8d932a7a85f97e8a756d6fc/docs/dev-notes/finicky-games
[fh-ymir]: https://flathub.org/apps/io.github.strikerx3.ymir
[emir]: https://git.libretro.com/libretro/emir
[yabause]: https://github.com/Yabause/yabause
[yabause-cl]: https://github.com/Yabause/yabause/blob/master/yabause/ChangeLog
[yabause-wiki]: https://wiki.yabause.org/
[yabause-site]: https://web.archive.org/web/20171223161130/https://yabause.org/
[ejs]: https://emulatorjs.org/docs/systems
[kronos]: https://github.com/FCare/Kronos
[kronos-site]: https://fcare.github.io/
[lr-kronos-blog]: https://www.libretro.com/index.php/introducing-kronos-a-new-sega-saturn-stv-emulator/
[ys-site]: https://www.yabasanshiro.com/
[ys-terms]: https://www.yabasanshiro.com/terms-of-use
[gp-ys]: https://play.google.com/store/apps/details?id=org.devmiyax.yabasanshioro2
[gp-ys-pro]: https://play.google.com/store/apps/details?id=org.devmiyax.yabasanshioro2.pro
[saturnin]: https://github.com/rtoumazet/saturnin
[erings]: https://github.com/user-none/erings
[ares]: https://ares-emu.net/
[flycast]: https://github.com/flyinghead/flycast
[fh-flycast]: https://flathub.org/apps/org.flycast.Flycast
[gp-flycast]: https://play.google.com/store/apps/details?id=com.flycast.emulator
[fc-tests]: https://flyinghead.github.io/flycast-builds/test-results.html?hash=e670746
[pdc]: https://github.com/libretro/parallel-dc
[dojo]: https://github.com/blueminder/flycast-dojo
[hollycast]: https://github.com/nexus382/Hollycast
[castation]: https://github.com/BrinooTk/castation
[fvita]: https://github.com/Rinnegatamante/flycast-vita
[reicast]: https://github.com/skmp/reicast-emulator
[reicast-site]: https://web.archive.org/web/20200322201451/https://reicast.com/
[gc-nulldc]: https://storage.googleapis.com/google-code-archive/v2/code.google.com/nulldc/project.json
[gc-demul]: https://storage.googleapis.com/google-code-archive/v2/code.google.com/demul/project.json
[sr-nulldc]: https://web.archive.org/web/20251230125822/https://segaretro.org/NullDC
[nulldc-site]: https://nulldc.emudev.org/
[nulldc-builds]: https://nulldc.emudev.org/builds/
[rd-site]: https://redream.io/
[rd-dl]: https://redream.io/download
[rd-help]: https://redream.io/help
[rd-compat]: https://redream.io/compatibility
[gp-rd]: https://play.google.com/store/apps/details?id=io.recompiled.redream
[rd-2017]: https://web.archive.org/web/20170727121103/http://redream.io/posts/progress-report-july-2017
[rd-2018]: https://web.archive.org/web/20190608072803/https://redream.io/posts/progress-report-january-2018
[rd-2020]: https://web.archive.org/web/20200216214336/https://redream.io/posts/progress-report-february-2020
[redream-gh]: https://github.com/inolen/redream
[demul]: http://demul.emulation64.com/
[lxdream-gh]: https://github.com/lxdream/lxdream
[lxdream-site]: https://www.lxdream.org/news/
[lxdream-091]: https://www.lxdream.org/0_9_1-notes.php
[lxdream-faq]: https://www.lxdream.org/faq.php
[mxdream]: https://github.com/rzkowskii/mxdream
[deecy]: https://github.com/Senryoku/Deecy
[deecy-site]: https://senryoku.github.io/
[ra-saturn]: https://www.retroarch.com/saturn.html
[buildbot]: https://buildbot.libretro.com/nightly/
[openemu]: https://openemu.org/
[openemu-notes]: https://openemu.org/rnotes/2.4.1.html
[provenance]: https://github.com/Provenance-Emu/Provenance
[s240p]: https://github.com/ArtemioUrbina/240pTestSuite
[devlog-dc2]: https://artemiourbina.itch.io/240p-test-suite/devlog/405605/dreamcast-release-20-hcfr-vmu-lightguns-and-more
[sst-sh4]: https://github.com/SingleStepTests/sh4/blob/48975cb1a9569abb5a0cba587013ea54edf79100/README.md
[dmca-sega]: https://github.com/github/dmca/blob/master/2019/10/2019-10-21-sega.md
[outlaw]: https://www.pinsentmasons.com/out-law/news/sega-takes-action-against-game-pirates
[w-gdrom]: https://en.wikipedia.org/w/index.php?oldid=1387464400
[mc-ipbin]: http://mc.pp.se/dc/ip.bin.html
[shiro-0808]: https://www.segasaturnshiro.com/2025/08/08/saturn-mister-core-now-passes-every-test/
[shiro-1114]: https://www.segasaturnshiro.com/2025/11/14/tests-continue-to-pay-dividends-for-saturn-mister-core-development/
[egw-dc]: https://emulation.gametechwiki.com/index.php/Dreamcast_emulators
[sat-tests]: https://github.com/StrikerX3/saturn-tests
[dctest]: https://github.com/washingtondc-emu/dctest
[appstore-ra]: https://apps.apple.com/us/app/retroarch/id6499539433
[steam-ra]: https://store.steampowered.com/app/1118310/RetroArch/
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[fdroid]: https://search.f-droid.org/
