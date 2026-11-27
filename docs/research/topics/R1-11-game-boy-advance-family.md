---
title: "Game Boy Advance: family survey"
roadmap_item: R1-11
status: approved
date: 2026-11-26
---

# Game Boy Advance: family survey

## Summary

This note asks which emulators matter for the Game Boy Advance family, what each one is and does,
how exposed the family is in law, and how hard it is to emulate.

Three emulators lead on published accuracy: [NanoBoyAdvance][nba-gh] and [SkyEmu][skyemu], both open tier,
and the walled [Hades][hades] say they were the first three to pass Nintendo's AGS aging cartridge. [mGBA][mgba] is the
most popular dedicated emulator and the default core of most frontends; [VisualBoyAdvance-M][vbam] is walled, and the
most installed phone apps are closed.

Legal exposure is low for a console emulator (inference): the games carry no encryption,
and every GBA notice found targets copies of games, not emulator code.
The risk to record is the cartridge logo,
a registered Nintendo work that a Canadian court treated as part of a protection measure
([Nintendo v King][king]), which every bootable test ROM carries (inference).

The family is moderately hard, and the BIOS is the hardest gap for Rustalgia,
because no public description of it states an origin outside the firmware and emulators.
For the owner to decide, the note recommends a NanoBoyAdvance study, the open GBA suites ranked by oracle,
a user's dump beside hardware-confirmed high-level services, and NanoBoyAdvance's cycle accuracy as the target.
This note is not legal advice.

## Scope

- Question: which emulators are popular or respected for the Game Boy Advance family, and for each, what are its status,
  licence, tier, techniques, and hosts; what is the family's legal exposure; and how hard is it to emulate?
- Covered: the Game Boy Advance, Game Boy Advance SP, and Game Boy Micro;
  the e-Reader and other cartridge hardware where emulators model them;
  Nintendo's own emulation of GBA games where public prose describes it.
  Left to other items: Game Boy and Game Boy Color mode to [R1-10](../../roadmap/research.md#system-family-surveys);
  the DS and its GBA slot to [R1-12](../../roadmap/research.md#system-family-surveys);
  the hardware to [R1-02](R1-02-primer-32-and-64-bit.md) and [R1-06](R1-06-catalogue-32-and-64-bit.md);
  the law to [R0-02](R0-02-legal-baseline.md); the hubs to [R0-05](R0-05-source-map.md);
  each emulator's architecture to its study ([emulator studies](../../roadmap/research.md#emulator-studies)).
- Researched on 2026-11-22.
  Status figures (archived flag, last push, stars, licence identifier, latest release) are GitHub API metadata read
  that day, so they are observed, not quoted.
- How claims were checked: three research agents each covered a share
  (dedicated emulators; multi-system projects and phone apps; law and difficulty)
  and read every page as raw text with curl or GitHub's raw media type.
  Emulators were read from prose only, in every tier: READMEs, licence files, sites, blogs, release notes,
  and documentation, with no source file, issue, or pull request opened, and no repository cloned or searched.
  One pass of three fresh verifiers, who saw only the note, then checked each claim, quotation, link,
  and register line against its sources,
  and a fix pass re-fetched each disputed source as raw text before applying their findings.
- Research log: the source guard blocked metadata calls on unregistered repositories and the Codeberg API,
  and blocked the closed `cult-of-gba/bios` outright; no block was worked around (research log).
  Before the first block, bare metadata
  for eight unregistered repositories was read in a loop the guard could not inspect
  (research log);
  the figures kept from it (VisualBoyAdvance-M and Hades stars and releases, and NooDS) were read again through the
  guard in the fix pass and matched.
  The no$gba site and Boycott Advance's host refuse or do not answer scripts, so captures were read (research log).
  Every emulator line in the [register](../../../.claude/hooks/source-register.txt)
  that this survey covers was checked again; only NanoBoyAdvance's licence changed, and OpenEmu was registered closed.

## Findings

### The emulators at a glance

Status, licence, and tier, with the tier as the [register](../../../.claude/hooks/source-register.txt) gives it
after this survey, or, for a program with no repository, by ADR 0006's closed test for software with no licence
(observed, from the projects' metadata, release pages, and store listings).
Each row's sources are linked in the paragraphs below: [mGBA][mgba], [NanoBoyAdvance][nba-gh], [SkyEmu][skyemu],
[Hades][hades], [VisualBoyAdvance-M][vbam], [no$gba][nocash-gba], [ares][ares-dl], [higan][higan], [MesenCE][mesence],
[Mednafen][mednafen-gba], [BizHawk][tas-rel], [GBAHawk][gbahawk], [gpSP][gpsp-lr], [rustboyadvance-ng][rbang],
[NooDS][noods], [eggvance][eggvance], [Meteor][meteor], [GBA.emu][gbaemu-play], and the store listings.

| Emulator | Tier | Licence | Latest release | Firmware | Hosts |
|---|---|---|---|---|---|
| mGBA | open | MPL-2.0 | 0.10.5, 2025-03-09 | Built-in BIOS; dump optional | Win, Mac, Linux, BSD, consoles, libretro |
| NanoBoyAdvance | open | GPL-3.0+; BSD-2 on phoenix | v1.8.3, 2026-05-10 | Dump or replacement | Win, Mac, Linux, BSD |
| SkyEmu | open | MIT | v5, 2026-02-12 | Bundled replacement | Win, Mac, Linux, BSD, Android, iOS, web, libretro |
| Hades | walled | GPL-2.0, version unstated | v1.2.0, 2026-11-22 | Dump required | Win, Mac, Linux |
| VisualBoyAdvance-M | walled | GPL-2.0, version unstated | v2.2.3, 2025-10-25 | Optional | Win, Mac, Linux, libretro |
| no$gba | closed | freeware, no licence | 3.06, 2025-04-14 | Built-in BIOS clone | Win, DOS |
| ares | open | ISC | v148, 2026-05-30 | Not stated in prose | Win, Mac; Linux, BSD by others |
| higan | open | GPL-3.0+ | v115 pre-release, 2020-08-16 | Dump required | Win, Mac, Linux, BSD |
| MesenCE | open | GPL-3.0+ | 2.2.1, 2026-06-05 | Not stated in prose | Win, Mac, Linux |
| Mednafen | walled | GPLv2, version unstated | 1.32.1, 2024-04-05 | High-level BIOS; dump optional | Win; source |
| BizHawk | walled | MIT own code; mixed | 2.11.1, 2026-05-01 | Through its mGBA core | Win, Linux |
| GBAHawk | walled | mixed, unresolved | v3.1.1, 2026-11-13 | Not stated | Win |
| gpSP (libretro) | walled | GPL-2.0, version unstated | none tagged | Bundled replacement | PSP, PS2, Wii, 3DS, PC |
| rustboyadvance-ng | open | MIT | none (a 2022 test build) | Dump or a replacement | Desktop, web, Android test |
| NooDS | open | GPL-3.0 | rolling, 2026-08-09 | High-level; dump optional | Win, Mac, Linux, Android, iOS, consoles |
| eggvance | open | GPL-3.0 | 1.2, 2025-01-02 | Bundled replacement | Win, Mac, Linux |
| Meteor | open | GPL-3.0 | none tagged | Not stated | Linux; libretro |
| GBA.emu | walled | GPL-3.0 root, VBA-M GPL-2.0 | 1.5.85, 2026-03-17 | High-level BIOS | Android, Linux |
| My Boy!, Linkboy | closed | proprietary | store, 2026-08-28 | High-level; file in Linkboy | Android; iOS |
| Pizza Boy A | closed | proprietary | store, 2026-11-16 | Custom BIOS in Pro | Android |
| John GBA | closed | proprietary | store, 2026-07-26 | Not stated | Android |

The firmware column gives each project's own words, cited in the paragraphs below.
Under [ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier), every built-in,
bundled, or high-level BIOS in the table is a reimplementation of system software,
so that part is closed even inside an open repository; none was opened.

Popularity, as one rough sign (observed, 2026-11-22): mGBA has 7,624 GitHub stars, VisualBoyAdvance-M 3,954,
SkyEmu 1,322, NanoBoyAdvance 1,311 on its archived GitHub copy, NooDS 1,169, rustboyadvance-ng 673, and Hades 258.
On Google Play, [My Boy! Lite][myboy-lite] shows 50,000,000+ installs and [John GBA Lite][john-lite] 10,000,000+;
the paid [My Boy!][myboy] and the free [Pizza Boy A][pizza] each show 1,000,000+,
and the paid [John GBA][john] 500,000+.

### Dedicated emulators, open tier

**mGBA.** endrift began it in April 2013 as a native follow-on to her JavaScript emulator,
released 0.1.0 on 13 December 2014, and added Game Boy support in 0.5.0 on 19 September 2016
([mGBA timeline][mgba-timeline]).
The 0.10.5 post says it "will be the last release before 0.11 unless a major issue is discovered"
([mGBA 0.10.5][mgba-0105]); the repository was pushed on the day of reading (observed).
Its author calls it a project with "a bus factor of one" ([mGBA 0.10.0][mgba-0100]).
The [README][mgba] lists third-party parts under BSD-3-Clause and public-domain terms, all compatible,
and offers publishers a commercial licence.

Its accuracy model is stated in the author's own words: CPU instructions run whole,
and other hardware is scheduled between them,
and "It is a common misconception that mGBA is now or will become cycle accurate,
but to do so would require a major rewrite of some of the foundational elements of mGBA"
([emulation accuracy post][mgba-acc]).
The [FAQ][mgba-faq] says no game fails to boot, with known bugs in some.
The README names one missing feature, the object window in bitmap modes 3 to 5.
Whether the core is an interpreter only was not found in prose; it ships no recompiler (from memory).

Features, from the README and FAQ: rewind, Lua scripting, cheat codes,
GameShark and Action Replay snapshot import and export, patches, a command-line debugger, and a GDB stub.
High-level mixing of the MP2k sound engine
("XQ audio") exists by the [0.10.0 changelog][mgba-0100], though the README still lists it as planned.
For cartridge hardware it models tilt and gyro sensors, rumble, the real-time clock, the solar sensor,
Game Boy Player rumble, the e-Reader, and the BattleChip Gate, and detects save types "even for flash memory size";
Vast Fame's protected cartridges are supported, by a fix to that support in the [0.7.0 changelog][mgba-070].
The FAQ lists the Wireless Adapter, IR Adapter, and Soul Adapter as unsupported, and link-cable support as partial.
Hosts are Windows, macOS, Linux, FreeBSD, 3DS, Switch, Wii, and Vita; there is no official Android or iOS port.

**NanoBoyAdvance.**
Its GitHub copy is archived, and its README says development continues on [Codeberg][nba-cb], where `phoenix`,
now the default branch, carried a commit dated 2026-11-22 and a BSD-2-Clause [licence file][nba-phoenix-lic] (observed).
The README claims cycle-accurate emulation "of most components", among them the CPU, DMA, timers, video,
and cartridge prefetch, and that it "Passes all AGS aging cartridge tests
(NBA was the first public emulator to achieve this)".
It adds a high-quality MP2k mixer, colour correction, and video viewers for palettes, tiles, backgrounds, and sprites,
and models the real-time clock and solar sensor ([README][nba-gh]).
The [v1.8.0 notes][nba-180] list fixes such as an EEPROM busy period after writes
and the mask ROM's internal address register.
No libretro core was found.

The user must supply a BIOS, prompted on first run; the README suggests a dump, called accurate,
or a third-party replacement, called less accurate.
Both targets it links are closed, `mgba-emu/bios-dump` as a dumping tool and `nebuleon/regba` for its replacement,
so neither is linked here.

**SkyEmu.**
A "low level" emulator of the Game Boy, Game Boy Color, GBA, and DS, the last in beta ([README][skyemu]).
Its README claims a per-pixel video renderer that handles mid-line effects, "Passes the AGS Aging Test ROM
(SkyEmu is the second SW based GBA emulator to ever pass this)",
full passes of ARMWrestler, [FuzzARM][fuzzarm], and [jsmolka's][jsmolka-tests] `arm.gba` and `thumb.gba`,
full pipeline and prefetch emulation,
and 2020 of 2020 [mGBA timing tests][mgba-suite] "when utilizing the official GBA BIOS".
The README does not use the word cycle for SkyEmu itself; it names NanoBoyAdvance as the other per-pixel renderer.
It has CPU, MMIO, and memory debuggers and an HTTP control server.
Release v4 added a libretro core, RetroAchievements, and MMIO breakpoints ([releases][skyemu-rel]).
It bundles replacement firmware and recommends a dump, because the replacements "are not as accurate".
Its README also states that no AI-generated code is accepted, which bears on provenance.

**rustboyadvance-ng.**
A GBA emulator and debugger in Rust, with separate crates for the core and the ARM7TDMI, and frontends for SDL2,
WebAssembly, a terminal, and an Android proof of concept ([README][rbang]).
It has no real releases, and its last push was 2026-08-27 (observed).
It asks for a BIOS dump or a replacement, makes no accuracy claims, and credits NanoBoyAdvance for debugging.
It is the Rust precedent most relevant to Rustalgia,
and is already in the [study item](../../roadmap/research.md#emulator-studies) for Rust emulators.

**NooDS, eggvance, and Meteor.**
[NooDS][noods] is a DS and GBA emulator whose README stresses speed and portability, takes a GBA BIOS optionally,
and cites the closed replacement-BIOS project as its reference for high-level functions;
its author does not accept pull requests.
Its Google Play listing shows 100,000+ installs ([NooDS on Google Play][noods-play]).
Whether it models the DS's GBA-slot mode as distinct from its GBA mode was not found in its prose. [eggvance][eggvance],
by the author of jsmolka's tests, bundles a third-party replacement BIOS and recommends the original for compatibility.
[Meteor][meteor] runs its own frontends on Linux only and recommends its libretro build;
its prose states nothing on firmware or accuracy.

### Dedicated emulators, walled and closed

**VisualBoyAdvance and VisualBoyAdvance-M.**
The original VisualBoyAdvance, by Forgotten and then the VBA Team, was registered on SourceForge in 2002 under GPLv2
([SourceForge metadata][vba-sf]);
its last stable Windows release was 1.7.2 in 2004, and forks followed until VisualBoyAdvance-M merged them
([Wikipedia][w-vba], secondary).
VisualBoyAdvance-M's licence file is the bare GPL-2.0 text,
and neither its README nor its site states "only" or "or later" ([VisualBoyAdvance-M][vbam]);
Wikipedia's uncited infoboxes say GPL-3.0 for VisualBoyAdvance-M and GPL-2.0-or-later for the original,
against SourceForge's bare GPLv2.
By ADR 0006's walled test it is walled.
It is active, with Android nightlies announced on 13 August 2026 ([site][vbam-site]),
and its build options include link-cable support, a debugger, Lua, and several scalers.
Its prose makes no accuracy claims.

mGBA's author set out to be "more accurate than VisualBoyAdvance, and also faster"
([emulation accuracy post][mgba-acc]),
and its 0.9.0 post says VBA's e-Reader support needs per-game hacks for each of the three e-Reader ROM versions
and bypasses the scanning itself ([mGBA 0.9.0][mgba-090]).
Descendants are spread widely: [Mednafen's GBA module][mednafen-gba],
the libretro [VBA Next][lr-vbanext] and [VBA-M][lr-vbam] cores, [Delta's][delta] GBA core,
and [GBA.emu][gbaemu-play] all come from it.

**Hades.**
A walled emulator for the same reason: its licence file, `LICENSE.md`, is the GPL-2.0 text with no version statement
(observed in the fix pass, as the [register](../../../.claude/hooks/source-register.txt) records).
Its [README][hades] says it is the third software emulator to pass the AGS aging cartridge,
and aims at a balance of usability, speed, and accuracy.
Release 1.2.0, published on the day of reading, added idle-loop removal
(off by default "since it can introduce inaccuracies"),
a per-line sprite rendering budget, and ROM mirroring ([release 1.2.0][hades-120]).
It needs a dump; its [download page][hades-dl] says "The BIOS cannot be provided with Hades for legal reasons".

**no$gba.**
Martin Korth's emulator and debugger, first released in July 2001, freeware since 28 July 2014,
with no licence and no published source, so closed ([release notes][nocash-new], capture).
Version 3.06 is dated 14 April 2025 ([download page][nocash-gba], capture).
Its debugger offers source-level debugging from ELF and DWARF2 data,
per-opcode cycle comments resolved from the wait-state setting, and conditional breakpoints
([debugger page][nocash-dev], capture).
It has a BIOS clone and, since 2.4b in 2007, an e-Reader emulation that needs the user's e-Reader files.
Its author's [GBATEK][gbatek] is the main reference credited by the NanoBoyAdvance, Hades, NooDS, rustboyadvance-ng,
and eggvance READMEs.

**gpSP.**
Exophase's gameplaySP, first released on 19 August 2006, was written for the PSP; its readme calls it cycle-inaccurate,
with the CPU effectively overclocked and DMA taking no cycles, and it keeps a per-game idle-loop list
([notaz's copy][gpsp-notaz]).
The original needs "an authentic GBA BIOS image file to run",
and adds that owning one without a console is not legal "and even then it's rather gray area";
the readme links a dumping guide, `wiki.pocketheaven.com/gba_bios`, not linked here because it is closed.
The libretro fork adds a dynamic recompiler for x86, ARM, and MIPS hosts, with an interpreter elsewhere,
Wireless Adapter networking, Game Boy Player rumble, and a bundled replacement BIOS ([README][gpsp-lr]).
Both repositories are GPL-2.0 text with no version stated, so walled.

**GBAHawk.**
A fork of BizHawk "focusing on console verification of TASes and hardware research",
whose author says that "Any revision dependent behavior is tested on
and matches my personal console" ([README][gbahawk]).
Its licence file calls the repository an "illegal combination of several incompatible GPL licenses",
so it is walled as an unresolved mix.
It is active, with v3.1.1 released on 2026-11-13 (observed).

**Historical closed emulators.**
[Boycott Advance][boycott], by Julien Frelat, was free, and its site offered no source
(inference from the captures);
its last builds were 0.2.8 for Windows, 0.2.7 for macOS, and 0.2.6 for Linux, FreeBSD, and BeOS, with a Java port
([downloads page][boycott-dl], 2017 capture).
[VGBA][vgba], by Marat Fayzullin, reached 6.4 on 10 March 2021; its Windows and Linux builds are free,
and the site offers its Android version as the way to support development.
Both have no licence, so closed.
The Firestorm emulator for the Tapwave Zodiac belongs here as history (see "Legal exposure").

### Multi-system emulators

**ares and higan.** [ares][ares] descends from bsnes and higan, "focuses on accuracy and preservation",
and trades "speed for code clarity" by its README; it forked from higan on 25 March 2020 ([about][ares-about]).
Its GBA core is listed as supported and not experimental ([site][ares-site]),
its compatibility list rates games from Completable to Nothing
([GBA list][ares-compat]),
and its [download page][ares-dl] offers Windows and macOS builds, leaving Linux and FreeBSD to packagers.
Its BIOS handling is not stated in the prose read; it needs a dump
(from memory).
[higan][higan] lists the GBA and the Game Boy Player,
and its documentation says the GBA BIOS "must be installed into higan" by the user
([import guide][higan-import], as of v104); its last release was a 2020 pre-release.

**Mesen.**
GBA support first appeared in tagged release 2.1.0, on 2025-05-16,
beside macOS support and a debugger integration with devkitARM
([Mesen 2.1.0][mesen-210]);
[2.1.1][mesen-211] lists GBA accuracy improvements "based on test roms", which it does not name.
The original repository is archived, after a last push on 2026-06-04 (observed),
and development continues as [MesenCE][mesence], "a community-managed fork", with 2.2.1 on 2026-06-05 for Windows,
Linux, and macOS ([site][mesen-site]).
Its GBA firmware handling was not found in prose.

**Mednafen.**
Its GBA emulation "is based off of VisualBoy Advance", and "Built-in high-level BIOS emulation is used by default;
however, a real BIOS can be used" ([GBA documentation][mednafen-gba], valid as of 1.32.1).
It takes a per-game file naming the save type, among SRAM, flash, EEPROM, sensor, and RTC.
Its code is walled, as the register records for its release downloads.
The libretro port, Beetle GBA, keeps the high-level BIOS as an option ([libretro docs][lr-beetle]).

**BizHawk.**
Its core table marks mGBA in bold, meaning accuracy-focused and acceptable on TASVideos,
and notes that GBAHawk is "not part of BizHawk" and needs a Windows host ([README][bizhawk]).
Its history shows a GBA core added in 1.8.0 in 2014, mGBA added in 1.10.0 in 2015 as an alternative to VBA Next,
and VBA Next dropped in 2.5 because "mGBA is more accurate and has feature parity"
([previous releases][tas-prev]); 2.11.1 was released on 1 May 2026 ([release history][tas-rel]).
Windows and Linux are its hosts.

### Frontends, libretro cores, and phone apps

Frontends have converged on mGBA.
[OpenEmu][openemu-notes] made it the default GBA core in 2.0.2 as "faster and more accurate";
[Lemuroid][lemuroid] and [EmulatorJS][emujs-cores] use it by default; [Provenance][provenance] offers VBA-M and mGBA;
[BizHawk][bizhawk] uses it.
[Delta][delta], "the spiritual successor to GBA4iOS", uses VisualBoyAdvance-M, as GBA.emu does.

The libretro documentation has eight GBA core pages, among them mGBA Splitscreen, besides the SkyEmu and Mesen pages
(read on pages stamped 22 October 2026).
[mGBA][lr-mgba], [VBA-M][lr-vbam], [VBA Next][lr-vbanext], [gpSP][lr-gpsp],
and [Beetle GBA][lr-beetle] each take a BIOS file as optional.
VBA Next is "based on VBA-M 2011 with backported patches",
and its page and gpSP's say the solar and tilt sensors are not emulated,
where the mGBA core exposes a solar setting and the VBA-M core solar, tilt, and gyro settings.
[Meteor][lr-meteor] has no compatibility notes yet, and [TempGBA][lr-tempgba], a gpSP fork for the PSP only,
tells everyone else to use gpSP or "a more accurate core, such as mGBA".
[RetroArch][retroarch-plat] carries these cores to its hosts, from Windows and Android to consoles, through Steam,
Google Play, and the App Store.

Phone apps lead on installs, and most are closed.
[My Boy!][myboy] says it is "Super fast" thanks to "the JIT recompiler", with high-level BIOS emulation,
link-cable play over Bluetooth or Wi-Fi, and sensors mapped to the phone's own;
its successor [Linkboy][linkboy] is on iOS with up to four-player link play,
and its notes mention a high-level BIOS fix and support for an external BIOS file.
[Pizza Boy A][pizza] says it is written in C and assembly and claims "High scores in accuracy test suites",
naming no suite, and no published result was found; its [Pro][pizza-pro] version adds a custom BIOS option.
[John GBA][john] states nothing on firmware.
[GBA.emu][gbaemu-play] is open source on a VBA-M base, with high-level BIOS emulation and no BIOS file needed;
its repository mixes a GPL-3.0 root with VBA-M's GPL-2.0, which it has not resolved,
so it is walled ([README][exalpha]).
Delta's licence is AGPL-3.0 and Provenance's BSD-style with a branding clause, so both are walled.
OpenEmu's repository, `github.com/openemu/openemu`, holds no licence file and its README states no licence,
so by ADR 0006's closed test it is closed.
Delta 2.0 adds Pokémon "DLC" and play from original cartridges through Epilogue's reader ([release notes][delta-notes]).

### Official emulation by Nintendo

Nintendo sold GBA games on the Wii U Virtual Console in Europe from 3 April 2014
([Nintendo UK, capture][nintendo-wiiu]),
and added them to the Nintendo Switch Online Expansion Pack, while "Game Boy is available on the base NSO subscription"
([Nintendo Life, 2023-02-08][nl-nso], secondary).
Nintendo now names the library Game Boy Advance – Nintendo Classics ([Nintendo, capture][nintendo-nso]).
Ten GBA games went to 3DS Ambassadors in December 2011
([Wikipedia, "Nintendo 3DS"][w-3ds], secondary, citing Game Informer of 16 December 2011);
the 3DS has a GBA mode in which the cartridge is served from RAM
([R1-02, "Game Boy Advance and DS"](R1-02-primer-32-and-64-bit.md#game-boy-advance-and-ds-2)),
so those games ran natively in that mode, not in a software emulator (inference).
No public prose was found on how Nintendo's emulators work, in the pages above, R0-02's makers' statements,
and R1-02's GBA sections; Nintendo publishes no BIOS.

### Tests, oracles, and published results

[R0-05, "Test suites and test vectors"](R0-05-source-map.md#test-suites-and-test-vectors) records each suite's oracle;
this survey adds what the projects publish about them.

| Suite | Licence, tier | Oracle, as stated |
|---|---|---|
| [jsmolka gba-tests][jsmolka-tests] | MIT, open | Its source gives the expected result |
| [mGBA suite][mgba-suite] | MIT, open | Not stated; no README |
| [NanoBoyAdvance hw-test][nba-hwtest] | BSD-3-Clause, open | Consoles, by R0-05 |
| [FuzzARM][fuzzarm] | GPL-3.0, open | Values computed by its generator; no timing, DMA, or interrupts |
| [SingleStepTests ARM7TDMI][sst-arm] | MIT, open | Generated from NanoBoyAdvance; cycle counts experimental |
| ARMWrestler copies | no licence, closed | Four tests fail on hardware, by mGBA's author ([forum][mgba-forum], lead) |
| AGS aging cartridge | Nintendo's, must not be used | A console; only emulators' claims are recorded |

The fullest comparison a project publishes is NanoBoyAdvance's own, since deleted
([ACCURACY.md at `e83ea6cf`][nba-acc]).
Selected mGBA suite groups, as passes of the total:

| Group (total) | NBA 1.8 | mGBA 0.10.3 | VBA-M 2.1.9 | ares v137 | SkyEmu V3 |
|---|---|---|---|---|---|
| Memory (1552) | 1552 | 1552 | 1426 | 1552 | 1552 |
| I/O read (130) | 130 | 120 | 100 | 130 | 130 |
| Timing (2020) | 2020 | 1768 | 1024 | 1890 | 2020 |
| Timer count-up (936) | 936 | 744 | 440 | 465 | 706 |
| Timer IRQ (90) | 90 | 70 | 8 | 0 | 90 |
| DMA (1256) | 1256 | 1232 | 1068 | 1212 | 1256 |
| Multiply long (72) | 52 | 52 | 52 | 52 | 52 |
| Edge cases (10) | 10 | 4 | 8 | 1 | 4 |

The same document warns that "Passing these tests does not necessarily translate to compatibility
or *overall* accuracy", and lists games that depend on edge cases, such as mid-instruction DMA with open bus
(Hello Kitty Collection), sprite render limits (Gunstar Heroes), and sub-line timing (Gadget Racers).
Hades' benchmark of January 2024 gives itself 1918 of 2020 timing and 211 of 936 count-up,
and no$gba 3.05 crashing before the memory tests ended ([features][hades-feat]).
SkyEmu's older table shows mGBA 0.9.3 and VBA-M 2.1.4 failing the aging cartridge and 7 and 2 of 10 hard games passing,
against 10 for SkyEmu and NanoBoyAdvance ([Accuracy.md][skyemu-acc]).
The Emulation General Wiki's tables, tested with the official BIOS, show NanoBoyAdvance, SkyEmu, Mesen, GBAHawk,
and two FPGA cores passing every aging-cartridge group, mGBA failing one memory test, and only GBAHawk,
and the Analogue Pocket core on an older suite revision, passing the video tests
([GBA Tests][egw-tests], revision 146557; lead); the wiki also tabulates more suites and targets than any project.

No table has a column for a stock console, so passing is agreement with each suite's expectations,
not with measured hardware (inference).
The BIOS changes timing results: SkyEmu's full timing pass needs the official BIOS,
and a forum list shows mGBA scoring higher with a BIOS than without ([mGBA forum][mgba-forum], lead).

### What makes the family hard

[R1-02](R1-02-primer-32-and-64-bit.md#game-boy-advance) covers the clock, pipeline, open bus, DMA, sound, sprite budget,
and save media; the points below add what the emulators' records show to be hard.
GBATEK citations are to [mGBA's copy][gbatek] by section.

- Memory timing has many settings.
  Cartridges start at 4 and 2 wait states with prefetch off, and commercial games switch to `0x4317`
  ("GBA System Control");
  each 128 KiB block of ROM starts with a non-sequential access
  (the same section); the prefetch buffer holds eight halfwords ("GBA GamePak Prefetch").
  In 2015 mGBA's author called prefetch "extremely poorly documented" ([cycle-counting post][mgba-prefetch]).
- Models differ.
  The undocumented memory control register at `0x4000800` locks up a Game Boy Micro at one setting
  and is absent on a DS in GBA mode ("GBA System Control"), and open-bus values in Thumb code differ between the GBA,
  SP, Micro, and DS Lite and the original DS ("GBA Unpredictable Things", which promises no stability across models).
- DMA hides state. mGBA's author found by hardware test
  that a DMA from an invalid source repeats the last value of the previous transfer,
  because the transfer register "is shared between all four DMA channels",
  and that a background enabled mid-frame takes three lines to appear ([holy grail post][mgba-holy]).
- Games test emulators on purpose.
  The Classic NES Series uses self-modifying code, write order to I/O, and memory mirrors,
  and refuses to run if SRAM exists ("GBA Cart Protections");
  mGBA's author wrote that this "appears to be a deliberate attempt to dissuade copying these games"
  ([Classic NES post][mgba-nes]).
- Cartridges add hardware: a 4-bit GPIO port in the ROM chip drives a clock, a solar sensor, a gyro, and rumble,
  and tilt sensors sit in the SRAM area ("GBA Cartridge Header" and the GPIO sections).
  Save types must be guessed from ID strings, because the header has no field ("GBA Cart Backup IDs").
- The e-Reader needs Nintendo's own 8 MiB ROM, which runs NES and Game & Watch games in software
  (GBATEK, "GBA Cart e-Reader Overview"); mGBA calls itself the second full implementation after no$gba.
- GBATEK's BIOS chapter states no origin
  ([R0-05, GBA hubs](R0-05-source-map.md#game-boy-game-boy-color-and-game-boy-advance)).
  ADR 0006's rule binds only facts a source says it took from firmware,
  and an unstated origin does not close a reference; this note settles, as a precaution of its own,
  that each BIOS behaviour from that chapter needs a hardware test before Rustalgia relies on it.

There is no encryption, coprocessor, or disc, so the family is moderate in difficulty,
harder than the Game Boy for its timing and easier than the DS (inference).
Speed spans three approaches: gpSP's and My Boy!'s recompilers for weak hosts, mGBA's scheduled interpreter,
and accuracy-first cores, which run slower (inference); ares says its own design trades speed for code clarity.

### Legal exposure

This section builds on [R0-02](R0-02-legal-baseline.md) and is not legal advice.

- **No game encryption.**
  A search of GBATEK's GBA chapter for "encrypt" found only cheat-device codes, multiboot transfer,
  and the e-Reader's NES emulator, not game data (searched as raw text).
  So the family fits [R0-02's option 1](R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted),
  and R0-02 found every circumvention filing and notice against a console emulator to concern encrypted systems
  ([R0-02, "Which systems the claims concern"](R0-02-legal-baseline.md#which-systems-the-claims-concern)).
  The Classic NES checks defeat emulators by undefined behaviour; emulating them circumvents nothing (inference).
- **The logo.**
  GBATEK says a cartridge will not work if the 156-byte compressed logo is missing or modified,
  and multiboot images carry the same header ("GBA Cartridge Header").
  In [Nintendo v King][king], an effectively uncontested Canadian case about DS and 3DS copiers,
  the court listed "GAME BOY ADVANCE BOOT CODE WITH NINTENDO LOGO DATA FILE" among three registered works
  (paragraph 20),
  called the console's header checks a protection measure
  (paragraph 30),
  held that copiers reproducing the header data circumvent it
  (paragraphs 101 and 102), and found the logo file on devices sold for DS consoles (paragraphs 50 to 54).
  [R0-02, "Boot logos"](R0-02-legal-baseline.md#boot-logos) already finds that a BIOS replacement
  that makes no comparison needs no copy.
  New here: every GBA test ROM and homebrew image that boots on a console holds the logo, so storing test ROMs
  ([R0-03, "Test suites with no licence"](R0-03-licence-strategy.md#test-suites-with-no-licence))
  stores that work (inference).
- **Notices.**
  R0-02's table has the 2014 notice against the GBA4iOS download site
  ([R0-02, "Takedown and enforcement history"](R0-02-legal-baseline.md#takedown-and-enforcement-history)).
  Three more target browser GBA emulators on GitHub Pages that bundled games: Nintendo's of [2015-07-06][dmca-2015],
  listing about 25 titles by registration number, and [2018-07-19][dmca-2018], and the ESA's of [2022-06-21][dmca-2022],
  alleging "full copies of games".
  None names emulator code or pleads circumvention; TorrentFreak notes the emulator code itself stayed online
  ([TorrentFreak, 2022][tf-2022], secondary).
- **Stores.**
  Apple removed iGBA in April 2024 as a copy of GBA4iOS, under its spam and copyright rules
  ([TechCrunch][tc-igba], secondary);
  guideline 4.7 now lets emulators offer game downloads,
  with the developer "responsible for all such software offered in your app" ([App Review Guidelines][apple-guide]).
  Delta has been on the App Store since 17 April 2024 ([Delta release notes][delta-notes]).
  Pizza Boy left Google Play in March 2024, its developer not blaming Nintendo
  ([Android Authority, capture][aa-pizza], secondary);
  both its apps are listed again, updated 16 November 2026
  ([Pizza Boy A][pizza]; observed),
  a sequel [R0-02's table](R0-02-legal-baseline.md#takedown-and-enforcement-history) lacks.
- **Patent.** The 2004 letter R0-02 records
  ([R0-02, "Patent claims against emulators"](R0-02-legal-baseline.md#patent-claims-against-emulators)) went to Crimson
  Fire over Firestorm, a GBA emulator for the Tapwave Zodiac, which had a cease-and-desist letter by its ship date of 12
  March 2004 ([The Register][reg-2004], secondary); the patent has expired
  ([R0-02, "Patents on emulation"](R0-02-legal-baseline.md#patents-on-emulation)).
- **Firmware and peripherals.**
  The projects split among [option 4](R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps)
  (NanoBoyAdvance, Hades, higan)
  and [option 5](R0-02-legal-baseline.md#5-replace-the-firmware)
  (mGBA, SkyEmu, gpSP, Mednafen, NooDS, My Boy!), most offering both.
  NanoBoyAdvance's links to a dumping tool are
  [option 7](R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links) conduct, and mGBA's FAQ
  names tools for dumping the 3DS sound firmware its 3DS port needs. e-Reader emulation needs a dump of Nintendo's
  e-Reader ROM and copies of cards, which mGBA cannot link to "for legal reasons" ([mGBA 0.9.0][mgba-090]).
- **Marks and content.** [mGBA's site][mgba-faq], [Hades' site][hades-dl], [Mednafen's home page][mednafen-home],
  [My Boy!'s listing][myboy], and [Delta's README][delta] carry non-affiliation lines, as in R0-02's
  [option 14](R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words).
  Delta 2.0's Pokémon "DLC", which changes Nintendo's and Game Freak's games, is a risk beyond emulation (inference).
- **Maker statements.**
  Nintendo's former legal page has no GBA-specific text
  ([R0-02, "Makers' statements on emulators"](R0-02-legal-baseline.md#makers-statements-on-emulators)).

## Options and trade-offs

### Which emulators the emulator studies cover

- **What:** keep the roadmap's [emulator studies](../../roadmap/research.md#emulator-studies)
  (mGBA, SkyEmu, rustboyadvance-ng, ares, Mesen, BizHawk, Delta, Provenance), or add one of [NanoBoyAdvance][nba-gh].
- **Costs:** one more study; NanoBoyAdvance carries GPL-3.0-or-later on its released branch
  and BSD-2-Clause on its default branch, `phoenix`.
- **Gains:** the first pass of the aging cartridge by its own claim,
  and the most complete mGBA-suite result in its own published table; an open tier on either licence,
  its own hardware tests, and the generator of the ARM7TDMI vectors.
- **Used by:** [SkyEmu][skyemu] names it as the other per-pixel renderer, [Hades][hades] credits it,
  and NanoBoyAdvance's README calls SkyEmu a sister project.

### Which test oracles to adopt

- **What:** adopt the open suites ([jsmolka's][jsmolka-tests], [mGBA's][mgba-suite],
  [NanoBoyAdvance's hw-test][nba-hwtest], [FuzzARM][fuzzarm], [SingleStepTests ARM7TDMI][sst-arm]) ranked by oracle,
  or wait for console measurements of the project's own.
- **Costs:** two suites state no hardware oracle, and the ARM7TDMI vectors measure agreement with NanoBoyAdvance;
  timing results depend on a BIOS the project may not obtain; the ROMs hold the logo.
- **Gains:** every published comparison uses them, so Rustalgia's results become comparable at once.
- **Used by:** NanoBoyAdvance, SkyEmu, Hades, and the [Emulation General Wiki's][egw-tests] tables.

### How to handle the BIOS

- **What:** require a dump (option 4), provide the project's own high-level services (option 5), or both.
- **Costs:** a dump cannot be tested by the project, which may not obtain one;
  high-level services rest on GBATEK's BIOS chapter, whose origin is unstated,
  so each behaviour needs a hardware test before it is used.
- **Gains:** high-level services let homebrew and tests run with nothing of Nintendo's and need no logo copy;
  a dump gives full accuracy to users who have one.
- **Used by:** [Mednafen][mednafen-gba] and [NooDS][noods] (high-level by default, dump optional); [Hades][hades-dl]
  (dump only); NanoBoyAdvance (dump, or another project's replacement).

### Which accuracy target

- **What:** cycle-count accuracy with whole instructions, as [mGBA][mgba-acc], or cycle accuracy of most components,
  among them CPU, DMA, timers, video, and prefetch, as [NanoBoyAdvance][nba-gh] defines it,
  which [SkyEmu's][skyemu] per-pixel and full-pipeline claims approach.
- **Costs:** cycle accuracy is slower and harder to build; mGBA's author says reaching it would take a rewrite.
- **Gains:** the edge-case games and full suite passes; the target is measurable by the suites above.
- **Used by:** NanoBoyAdvance (claimed), and SkyEmu (per-pixel video, full pipeline).

### Recommendation

- **Studies:** add a NanoBoyAdvance study beside mGBA and SkyEmu;
  it is the strongest open-tier reference on published results.
- **Oracles:** adopt the five open suites, recording for each whether its oracle is hardware, its source code,
  or an emulator, and fetch them at test time rather than store them, because of the logo.
- **BIOS:** support a user's dump as the accurate path and build the project's own high-level services only
  for behaviour a hardware test confirms; ship no other project's replacement.
  This departs from [R0-02's](R0-02-legal-baseline.md#recommendation) preference for option 5,
  and narrows [R1-02's](R1-02-primer-32-and-64-bit.md#recommendation) "clean sources" to hardware-confirmed behaviour,
  because GBATEK's BIOS chapter states no origin and the project may not obtain a dump to compare.
- **Accuracy:** target cycle accuracy as NanoBoyAdvance defines it,
  measured by full passes of the mGBA suite and hw-test; the owner decides each of these.

## Implications for Rustalgia

- The roadmap's [emulator studies](../../roadmap/research.md#emulator-studies) gain a [NanoBoyAdvance][nba-gh] item
  if the owner accepts; R1-32 and R1-33 should compare against its [published table][nba-acc].
- The test runner from [R5-05](../../roadmap/research.md#phase-5-hands-on-spikes) needs a mode with no BIOS,
  and its reports must say which BIOS path a result used, because results differ.
- [R2-12](../../roadmap/research.md#phase-2-cross-cutting-engineering) settles the BIOS technique;
  GBA high-level services need console tests for each behaviour, which no roadmap item yet provides for this family;
  a GBA counterpart of [R5-12](../../roadmap/research.md#phase-5-hands-on-spikes) would.
- The cartridge GPIO devices and the e-Reader set a peripheral scope for the feature baseline,
  [R1-92](../../roadmap/research.md#landscape-synthesis); the e-Reader needs a user's dump of a second Nintendo ROM.
- Store releases face [Apple's guideline 4.7][apple-guide] and the record of [iGBA][tc-igba] and [Pizza Boy][aa-pizza],
  for [R3-03 and R3-06](../../roadmap/research.md#phase-3-host-platforms).

## Open questions

- Which of [GBATEK's][gbatek] BIOS behaviours hold on a console: hardware tests on owned consoles,
  in a GBA counterpart of [R5-12](../../roadmap/research.md#phase-5-hands-on-spikes),
  which this note recommends adding to the roadmap.
- Whether the mGBA suite's expectations, beyond the one commit [R0-05](R0-05-source-map.md) found matched to hardware,
  were checked on a console: the mGBA study ([R1-32](../../roadmap/research.md#emulator-studies)) can read its history.
- Whether mGBA ships only an interpreter: the mGBA study, which may read its source.
- How open-bus and prefetch details differ on the SP, Micro, and DS beyond GBATEK: console measurements,
  for which no roadmap item exists yet.
- When and why Pizza Boy returned to Google Play: its [listing][pizza],
  first released on 11 June 2019 under the same identifier, says neither, and no press item was found;
  asking the developer, or [R3-06](../../roadmap/research.md#phase-3-host-platforms), would answer it.

## Sources

Every source below was read on 2026-11-22, as raw text unless marked.
Addresses in code spans are closed or offer firmware, and are not linked.

Emulators, dedicated:

- mGBA: [README][mgba] (default branch, pushed 2026-11-22); [FAQ][mgba-faq]; [timeline][mgba-timeline];
  blog posts ["Emulation Accuracy, Speed, and Optimization"][mgba-acc] (2017-04-30),
  ["Cycle Counting, Memory Stalls, Prefetch and Other Pitfalls"][mgba-prefetch] (2015-06-27),
  ["Revisiting 'Holy Grail' Bugs in Emulation"][mgba-holy] (2018-03-09), ["Game Pak Error"][mgba-nes] (2014-12-28),
  ["mGBA 0.7.0"][mgba-070] (2019-01-26), ["mGBA 0.9.0"][mgba-090] (2021-03-28), ["mGBA 0.10.0"][mgba-0100] (2022-10-11),
  ["mGBA 0.10.5"][mgba-0105] (2025-03-08); [suite score thread][mgba-forum] (lead).
- NanoBoyAdvance: [GitHub README][nba-gh]
  (archived default branch, last pushed 2026-06-21);
  [Codeberg repository][nba-cb] (`phoenix` at `7b1ae21e01`); [`phoenix` licence file][nba-phoenix-lic];
  [v1.8.0 release notes][nba-180]; [ACCURACY.md at commit `e83ea6cf`][nba-acc].
- SkyEmu: [README][skyemu] (branch `dev`, v5); [releases][skyemu-rel]; [Accuracy.md at commit `b64903f0`][skyemu-acc].
- VisualBoyAdvance-M: [repository][vbam] (v2.2.3); [site][vbam-site]; original VBA, [SourceForge metadata][vba-sf];
  [Wikipedia, "VisualBoyAdvance"][w-vba] (revision 1351614330).
- Hades: [README][hades] (v1.2.0); [features][hades-feat]; [download][hades-dl]; [release 1.2.0][hades-120].
- no$gba: [download page][nocash-gba], capture 20261110215342; [release notes][nocash-new], capture 20261118102804;
  [debugger page][nocash-dev], capture 20260910185035.
- gpSP: [notaz's copy][gpsp-notaz]; [libretro fork][gpsp-lr].
- [GBAHawk README][gbahawk] (v3.1.1); [rustboyadvance-ng README][rbang]; [NooDS README][noods];
  [eggvance README][eggvance] (1.2); [Meteor README][meteor].
- [Boycott Advance][boycott], capture 20180724054559; [downloads page][boycott-dl], capture 20171105223132;
  [VGBA][vgba].
- Not linked, as closed: `mgba-emu/bios-dump`, `nebuleon/regba`, `cult-of-gba/bios`,
  and the dumping guide `wiki.pocketheaven.com/gba_bios`; and OpenEmu's repository, `github.com/openemu/openemu`,
  whose README was read.

Emulators, multi-system, frontends, and apps:

- [ares README][ares] (v148); [ares site][ares-site]; [about][ares-about]; [GBA compatibility][ares-compat];
  [download][ares-dl].
- [higan README][higan]; [higan import guide][higan-import] (as of v104).
- [Mesen 2.1.0 release][mesen-210]; [Mesen 2.1.1 release][mesen-211]; [MesenCE README][mesence];
  [Mesen site][mesen-site].
- [Mednafen GBA documentation][mednafen-gba] (updated 2024-03-19); [Mednafen home page][mednafen-home].
- [BizHawk README][bizhawk]; TASVideos, [release history][tas-rel]
  (edited 2026-05-31) and [previous release history][tas-prev] (edited 2026-05-26).
- libretro documentation: [mGBA][lr-mgba], [VBA-M][lr-vbam], [VBA Next][lr-vbanext], [gpSP][lr-gpsp],
  [Beetle GBA][lr-beetle], [Meteor][lr-meteor], [TempGBA][lr-tempgba] (all last updated 2026-10-22).
- [RetroArch platforms][retroarch-plat]; [OpenEmu 2.4.1 release notes][openemu-notes]; [Lemuroid README][lemuroid];
  [EmulatorJS cores][emujs-cores]; [Provenance README][provenance]; [Delta README][delta];
  [Delta release notes][delta-notes]; [EX emulators README][exalpha].
- Store listings (observed): [My Boy!][myboy], [My Boy! Lite][myboy-lite], [Linkboy (Linking Boy)][linkboy],
  [Pizza Boy A][pizza], [Pizza Boy A Pro][pizza-pro], [John GBA][john], [John GBA Lite][john-lite],
  [GBA.emu][gbaemu-play], [NooDS][noods-play].
- Emulation General Wiki, ["GBA Tests"][egw-tests] (revision 146557, lead).

Nintendo:

- [Nintendo UK, Wii U Virtual Console news][nintendo-wiiu]
  (26 March 2014),
  capture 20250817021415; [Nintendo, Switch Online update][nintendo-nso], capture 20251224073445;
  [Nintendo Life, 2023-02-08][nl-nso]; [Wikipedia, "Nintendo 3DS"][w-3ds] (revision 1386371150).

References and tests:

- [GBATEK, mGBA's copy, `gba.md`][gbatek] (commit `64b5087a`).
- [jsmolka gba-tests][jsmolka-tests]; [mGBA suite][mgba-suite]; [NanoBoyAdvance hw-test][nba-hwtest];
  [FuzzARM][fuzzarm]; [SingleStepTests ARM7TDMI][sst-arm].

Law, notices, and press:

- [Nintendo v King, 2017 FC 246][king], capture 20250212013700.
- GitHub DMCA archive, read on `master`: [Nintendo notice, 2015-07-06][dmca-2015],
  [Nintendo notice, 2018-07-19][dmca-2018], [ESA notice, 2022-06-21][dmca-2022].
- [TorrentFreak, 2022-06-24][tf-2022]; [TechCrunch, 2024-04-15][tc-igba]; [Android Authority, 2024-03-12][aa-pizza],
  capture 20250116053554; [The Register, 2004-03-12][reg-2004].
- [Apple App Review Guidelines][apple-guide] (last updated 2026-10-16).

[mgba]: https://github.com/mgba-emu/mgba
[mgba-faq]: https://mgba.io/faq.html
[mgba-timeline]: https://mgba.io/timeline.html
[mgba-acc]: https://mgba.io/2017/04/30/emulation-accuracy/
[mgba-prefetch]: https://mgba.io/2015/06/27/cycle-counting-prefetch/
[mgba-holy]: https://mgba.io/2018/03/09/holy-grail-bugs-revisited/
[mgba-nes]: https://mgba.io/2014/12/28/classic-nes/
[mgba-070]: https://mgba.io/2019/01/26/mgba-0.7.0/
[mgba-090]: https://mgba.io/2021/03/28/mgba-0.9.0/
[mgba-0100]: https://mgba.io/2022/10/11/mgba-0.10.0/
[mgba-0105]: https://mgba.io/2025/03/08/mgba-0.10.5/
[mgba-forum]: https://forums.mgba.io/printthread.php?tid=18
[mgba-suite]: https://github.com/mgba-emu/suite
[nba-gh]: https://github.com/nba-emu/NanoBoyAdvance
[nba-cb]: https://codeberg.org/nba-emu/NanoBoyAdvance
[nba-phoenix-lic]: https://codeberg.org/nba-emu/NanoBoyAdvance/raw/branch/phoenix/LICENSE
[nba-180]: https://github.com/nba-emu/NanoBoyAdvance/releases/tag/v1.8.0
[nba-acc]: https://github.com/nba-emu/NanoBoyAdvance/blob/e83ea6cffa07d5b05f53ea273d524ea727018031/docs/ACCURACY.md
[nba-hwtest]: https://github.com/nba-emu/hw-test
[skyemu]: https://github.com/skylersaleh/SkyEmu
[skyemu-rel]: https://github.com/skylersaleh/SkyEmu/releases
[skyemu-acc]: https://github.com/skylersaleh/SkyEmu/blob/b64903f0fde8104d0796546b96859e9f682311b7/docs/Accuracy.md
[vbam]: https://github.com/visualboyadvance-m/visualboyadvance-m
[vbam-site]: https://visualboyadvance-m.org/
[vba-sf]: https://sourceforge.net/rest/p/vba
[w-vba]: https://en.wikipedia.org/w/index.php?title=VisualBoyAdvance&oldid=1351614330
[hades]: https://github.com/hades-emu/Hades
[hades-feat]: https://hades-emu.org/features/
[hades-dl]: https://hades-emu.org/download/
[hades-120]: https://hades-emu.org/blog/release-1.2.0/
[nocash-gba]: https://web.archive.org/web/20261110215342/http://problemkaputt.de/gba.htm
[nocash-new]: https://web.archive.org/web/20261118102804/https://problemkaputt.de/gbanew.htm
[nocash-dev]: https://web.archive.org/web/20260910185035/https://problemkaputt.de/gba-dev.htm
[gpsp-notaz]: https://github.com/notaz/gpsp
[gpsp-lr]: https://github.com/libretro/gpsp
[gbahawk]: https://github.com/alyosha-tas/GBAHawk
[rbang]: https://github.com/michelhe/rustboyadvance-ng
[noods]: https://github.com/hydr8gon/NooDS
[eggvance]: https://github.com/jsmolka/eggvance
[meteor]: https://github.com/blastrock/meteor
[boycott]: https://web.archive.org/web/20180724054559/http://boycottadvance.emuunlim.org/
[boycott-dl]: https://web.archive.org/web/20171105223132/http://boycottadvance.emuunlim.org/Downloads_content.htm
[vgba]: https://fms.komkon.org/VGBA/
[ares]: https://github.com/ares-emulator/ares
[ares-site]: https://ares-emu.net/
[ares-about]: https://ares-emu.net/about
[ares-compat]: https://ares-emu.net/compatibility/nintendo-game-boy-advance
[ares-dl]: https://ares-emu.net/download
[higan]: https://github.com/higan-emu/higan
[higan-import]: https://higan.readthedocs.io/en/stable/guides/import/
[mesen-210]: https://github.com/SourMesen/Mesen2/releases/tag/2.1.0
[mesen-211]: https://github.com/SourMesen/Mesen2/releases/tag/2.1.1
[mesence]: https://github.com/nesdev-org/MesenCE
[mesen-site]: https://www.mesen.ca/
[mednafen-gba]: https://mednafen.github.io/documentation/gba.html
[mednafen-home]: https://mednafen.github.io/
[bizhawk]: https://github.com/TASEmulators/BizHawk
[tas-rel]: https://tasvideos.org/Bizhawk/ReleaseHistory
[tas-prev]: https://tasvideos.org/Bizhawk/PreviousReleaseHistory
[lr-mgba]: https://docs.libretro.com/library/mgba/
[lr-vbam]: https://docs.libretro.com/library/vba_m/
[lr-vbanext]: https://docs.libretro.com/library/vba_next/
[lr-gpsp]: https://docs.libretro.com/library/gpsp/
[lr-beetle]: https://docs.libretro.com/library/beetle_gba/
[lr-meteor]: https://docs.libretro.com/library/meteor/
[lr-tempgba]: https://docs.libretro.com/library/tempgba/
[retroarch-plat]: https://www.retroarch.com/platforms.html
[openemu-notes]: https://openemu.org/rnotes/2.4.1.html
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[emujs-cores]: https://emulatorjs.org/docs4devs/cores/
[provenance]: https://github.com/Provenance-Emu/Provenance
[delta]: https://github.com/rileytestut/Delta
[delta-notes]: https://faq.deltaemulator.com/release-notes
[exalpha]: https://github.com/Rakashazi/emu-ex-plus-alpha
[myboy]: https://play.google.com/store/apps/details?id=com.fastemulator.gba
[myboy-lite]: https://play.google.com/store/apps/details?id=com.fastemulator.gbafree
[linkboy]: https://apps.apple.com/us/app/linking-boy/id6695762604
[pizza]: https://play.google.com/store/apps/details?id=it.dbtecno.pizzaboygba
[pizza-pro]: https://play.google.com/store/apps/details?id=it.dbtecno.pizzaboygbapro
[john]: https://play.google.com/store/apps/details?id=com.johnemulators.johngba
[john-lite]: https://play.google.com/store/apps/details?id=com.johnemulators.johngbalite
[gbaemu-play]: https://play.google.com/store/apps/details?id=com.explusalpha.GbaEmu
[noods-play]: https://play.google.com/store/apps/details?id=com.hydra.noods
[egw-tests]: https://emulation.gametechwiki.com/index.php?title=GBA_Tests&oldid=146557
[nintendo-wiiu]: https://web.archive.org/web/20250817021415/https://www.nintendo.com/en-gb/News/2014/March/Game-Boy-Advance-titles-join-the-Wii-U-Virtual-Console-roster-starting-next-week-866371.html
[nintendo-nso]: https://web.archive.org/web/20251224073445/https://www.nintendo.com/us/whatsnew/new-update-for-nintendo-switch-online-expansion-pack-members/
[nl-nso]: https://www.nintendolife.com/news/2023/02/game-boy-and-gba-coming-to-switch-online-today
[w-3ds]: https://en.wikipedia.org/w/index.php?title=Nintendo_3DS&oldid=1386371150
[gbatek]: https://github.com/mgba-emu/gbatek/blob/64b5087aa45cd0187b8b239d77e54ee5eb2917d1/gba.md
[jsmolka-tests]: https://github.com/jsmolka/gba-tests
[fuzzarm]: https://github.com/DenSinH/FuzzARM
[sst-arm]: https://github.com/SingleStepTests/ARM7TDMI
[king]: https://web.archive.org/web/20250212013700/https://decisions.fct-cf.gc.ca/fc-cf/decisions/en/item/223922/index.do
[dmca-2015]: https://github.com/github/dmca/blob/master/2015/2015-07-06-nintendo.md
[dmca-2018]: https://github.com/github/dmca/blob/master/2018/2018-07-19-Nintendo.md
[dmca-2022]: https://github.com/github/dmca/blob/master/2022/06/2022-06-21-esa.md
[tf-2022]: https://torrentfreak.com/takedown-notice-wipes-game-boy-advance-emulator-from-github-220624/
[tc-igba]: https://techcrunch.com/2024/04/15/apple-pulls-a-game-boy-emulator-for-app-store-violations-but-says-game-emulators-are-allowed/
[aa-pizza]: https://web.archive.org/web/20250116053554/https://www.androidauthority.com/emulators-for-android-shut-down-pulled-play-store-3424602/
[reg-2004]: https://www.theregister.com/on-prem/2004/03/12/nintendo-patents-handheld-emulation-software/1453100
[apple-guide]: https://developer.apple.com/app-store/review/guidelines/
