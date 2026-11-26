---
title: "Nintendo DS and DSi: family survey"
roadmap_item: R1-12
status: draft
date: 2026-11-25
---

# Nintendo DS and DSi: family survey

## Summary

This note asks which emulators matter for the Nintendo DS, DS Lite, DSi, and DSi XL, how each is built and licensed,
what legal exposure the family carries, and how hard it is to emulate.

[melonDS][melonds] is the family's centre of gravity: open tier, active, the engine inside most ports and frontends,
and with no$gba the only emulator with working DSi support.
[DeSmuME][desmume], walled, is the older alternative, with no stable release since 2022.
[DualSOUP][dualsoup], new and open, is the only project aiming at cycle accuracy.

Test results are thin.
The one published table, a lead on the [Emulation General Wiki][egw-tests],
shows melonDS ahead on 3D rasterisation and every emulator failing parts of the CPU and timing tests;
no DSi test suite was found.

Three points matter most to Rustalgia.
DS mode can run without any of Nintendo's code, since the popular emulators boot games on a replacement BIOS,
though each such replacement is closed tier.
DSi mode cannot: every DSi emulator needs the user's DSi BIOS, firmware, and NAND image, which hold console-unique keys
(from memory), so it falls under [R0-02][r002]'s option 2.
And courts in seven countries or unions have ruled against sellers of DS copiers,
most of them naming the card's header check or encryption as the protection measure,
so the lock-out weighs more here than on the Game Boy Advance (inference).

The note recommends DS mode with Rustalgia's own boot path and decrypted input, DSi mode deferred to [R6-01][phase6],
DualSOUP added to the melonDS study, and [polyrastertest][polyraster] plus a new DS hardware spike as the oracles.
The owner decides.
This note is not legal advice.

## Scope

- Question: which DS and DSi emulators are popular or respected, what are their status, licence, tier, techniques,
  and hosts, and what are the family's legal exposure and difficulty?
- Covered: the Nintendo DS, DS Lite, DSi, and DSi XL, DSi-enhanced and DSi-exclusive software, and DSiWare;
  the Game Boy Advance slot only as DS emulators use it.
  Game Boy Advance emulation is left to [R1-11][surveys], and the DS hardware inside the 3DS to [R1-13][surveys].
  The hardware itself is in [R1-02][r102-ds] and [R1-06][r106-hh], and the law in [R0-02][r002];
  this note cites them rather than repeating them.
- Researched on 2026-11-25.
  Three research agents read the sources in slices
  (dedicated emulators; multi-system and mobile projects; legal exposure and difficulty),
  and this note was written from their evidence and the repository's notes (research log).
  Three fresh verifiers then re-fetched every source
  (emulators; the rest of the findings; links, shape, and register),
  and a fix pass re-checked each of their findings against the raw text before applying it.
- How claims were checked: web pages were fetched with curl and read as text, wikis through their raw export,
  repositories through GitHub's metadata, licence, release, and README endpoints only,
  and the App Store through Apple's [lookup interface][itunes].
  The melonDS blog is the developers' own, but the register treats it as leads, so its posts are marked lead.
  Repository status (stars, last push, archived flag, licence) is the metadata of 2026-11-25.
  Quotations were confirmed against raw text.
  A claim with no marker rests on the original text; markers follow the [research guide][guide].
- Process call: emulators were read from prose only, in every tier.
  No emulator's source file, issue, or pull request was opened, and no repository was cloned or searched (research log).
  No BIOS, firmware, game, key, key page, or dumping guide was opened.
  GBATEK's "DSi Emulation" page was fetched once and deleted after a screen showed it is a dumping guide
  that mentions a leak; nothing from it is recorded.

## Findings

### The emulators at a glance

| Emulator | Licence, tier | State | Latest release | Last push | Stars |
|---|---|---|---|---|---|
| [melonDS][melonds] | GPL-3.0-or-later, open | active | 1.1, 2025-11-18 | 2026-11-22 | 5,244 |
| [DeSmuME][desmume] | GPL-2.0, version not stated, walled | maintained | 0.9.13, 2022-05-23 | 2026-11-22 | 3,701 |
| no$gba | freeware, no licence, closed | maintained | 3.06, 2025-04-14 | no repository | - |
| [NooDS][noods] | GPL-3.0, open (new line) | active | not recorded | 2026-08-09 | 1,170 |
| [SkyEmu][skyemu] | MIT, open | active | v5, 2026-02-12 | 2026-11-24 | 1,323 |
| [dust][dust] | GPL-3.0, open | slow | v0.0.0 prerelease, 2025-12-17 | 2026-02-03 | 348 |
| [DualSOUP][dualsoup] | MPL-2.0, open (new line) | alpha | not recorded | 2026-11-24 | 35 |
| DraStic | closed source, closed | delisted 2025 | none found | no repository | - |
| [melonDS DS][mds-ds] | GPL-3.0, open (new line) | active | not recorded | 2026-10-28 | 352 |
| [melonDS Android][mds-android] | GPL-3.0, open (new line) | active | Play update 2026-05-05 | 2026-11-20 | 1,777 |
| [BizHawk][bizhawk] | mixed, walled | active | 2.11.1, 2026-05-01 | 2026-11-22 | 2,831 |
| [Delta][delta] | AGPL-3.0, walled | active | 2.0.2, 2026-11-23 | 2026-10-24 | 6,281 |
| [Provenance][provenance] | BSD-style, walled | active | 3.3.0 on the App Store | 2026-11-25 | 6,423 |

- Sources: repository metadata and release lists; DeSmuME's release from [desmume.org][desmume-org],
  because the guard blocks the release list of a walled repository; no$gba's from [its home page][nocash];
  BizHawk's from [TASVideos][tas-bh-rel]; Delta's from [its FAQ's release notes][delta-rn];
  Provenance's from [its App Store listing][as-prov].
  Release lists of repositories not yet in the register are not recorded,
  because the guard would block them and two were reached only through a gap in its matching (research log).
- Stars are a rough sign of popularity only.
  Store installs add to it: on Google Play, the [RetroArch][gp-ra] listing shows 5M+ installs,
  [Lemuroid][gp-lemuroid] 5M+, and [melonDS Android][gp-melonds] 1M+; on the App Store,
  [Delta][as-delta] has about 28,400 ratings and [RetroArch][as-ra] about 1,900
  (store pages and Apple's [lookup interface][itunes], 2026-11-25).
- [R0-03][r003] already tabulates the store presence of RetroArch, Delta, and Provenance; this note adds DS facts only.

| Emulator | CPU | 3D | DSi | Firmware | Hosts |
|---|---|---|---|---|---|
| melonDS | interpreter, JIT | software; OpenGL; compute | yes; DSP by HLE or LLE | replacement, or dumps | desktop |
| DeSmuME | interpreter, x86 JIT | software; OpenGL | no | built-in replacement, or dumps | desktop |
| no$gba | not stated | software | yes, since 2015 | built-in BIOS clone, or dumps; DSi needs dumps | Windows, DOS |
| NooDS | not stated | software with upscaling | not stated | built-in HLE BIOS, or dumps | desktop, mobile, consoles |
| SkyEmu | not stated | not stated | not stated | bundled replacement, or dumps | desktop, mobile, web |
| dust | not stated | not stated | not stated | not stated | desktop, web |
| DualSOUP | aims at cycle accuracy | not stated | planned | GBA mode: dumps; DS: not stated | desktop, from source |

- Sources: each project's prose, given per emulator below.
  "Desktop" means Windows, macOS, and Linux at least.
  "Not stated" means the prose read says nothing on it.

### Dedicated emulators

**melonDS.**
Its home page says it "aims at providing fast and accurate Nintendo DS emulation"
([melonDS site][melonds-site]), and its README sets the goal "to do things right and fast" ([README][melonds]).
The CPUs run in an interpreter or a JIT recompiler
(the JIT's start date is from memory);
the 1.1 notes fix the JIT for W^X systems
([release notes][melonds-rel]),
and the 1.1 post says it is turned off on x86 Macs because of a crash ([1.1 post][mb-240]; lead).
The lead developer wrote in June 2026 that recent work was on CPU timings,
and that data fetch timings are harder to predict than code fetches ([Bit of plans][mb-260]; lead).

For 3D it has a software renderer, an OpenGL renderer with upscaling,
and since 1.0rc a compute-shader renderer
that "uses compute shaders to closely reproduce the DS GPU's rasterization algorithms" ([1.0 RC post][mb-216]; lead).
The same post rates the software renderer highly for accuracy but notes it cannot be upscaled,
and calls the OpenGL one "prone to all sorts of problems and glitches".
Local wireless play runs between instances on one machine or over a LAN,
which the post says needs a good wired network (lead); the [FAQ][melonds-faq] warns that LAN play rarely holds,
and says online play goes through an emulated access point.

The FAQ dates DSi support to 0.9, and the home page still marks it work in progress.
The notes add cameras and a working DSP (0.9.5), "AES: load Tad key" (1.0),
and DSP high-level emulation with DSP audio and microphone input (1.1) ([release notes][melonds-rel]).
The 1.1 post says the team identified three classes of DSP microcode, wrote high-level equivalents,
and falls back to low-level emulation for microcode it does not recognise ([1.1 post][mb-240]; lead).
That the low-level path uses [Teakra][teakra] is (from memory); no melonDS page read names it.

Firmware handling changed in 0.9.4, which uses DraStic's open-source BIOS replacement
and generates a non-bootable firmware
([release notes][melonds-rel]);
the FAQ's statement that dumps are needed is older than that ([FAQ][melonds-faq]; inference from the dates).
DSi mode needs the user's DSi BIOS, firmware, and a NAND image of about 240 MB.
The FAQ and the downloads page link dumping tools; they were not followed (research log).
Other features are a GDB stub, no$gba's debug registers, DLDI, flash-cart emulation, Slot-2 add-ons, and cheats.
Release 1.1 ships for Windows, macOS, Linux, FreeBSD, NetBSD, and OpenBSD on x64 and ARM64
where built ([downloads][melonds-dl]); the FAQ says unofficial ports are not supported.

In 2026 the lead developer wrote that "the melonDS codebase isn't in a good state"
([New horizons][mb-263]; lead),
and from 2026-11-24 pull requests are restricted to contributors,
to curb AI-generated pull requests and possibly for a time;
the post restates that "we don't accept AI-generated contributions" ([Restricting pull requests][mb-267]; lead).
The 1.1 post says melonDS's OpenGL context code, like PCSX2's, comes from DuckStation,
and that a Wayland fix came from the PCSX2 team ([1.1 post][mb-240]; lead).
DuckStation is closed in the [register][register]; when the code was taken, and under which DuckStation licence,
is not known.

**DeSmuME.**
The wiki FAQ says it "attempts to emulate, as faithfully as possible, the Nintendo DS and Nintendo DS Lite",
and that the DSi is not supported ([DeSmuME FAQ][desmume-faq], revision 8944).
It is candid about timing: the FAQ calls its CPU and memory timings wrong, adds that most games do not seem to suffer,
and offers an "Advanced Bus-Level Timing" option.
The CPU runs in an interpreter or a recompiler for x86 and x64 only,
and the FAQ says the interpreter has better compatibility.
Its SoftRasterizer emulates every 3D feature except wireframes and antialiasing,
with optional hacks for line and texture issues, and the OpenGL renderer every feature except fog and edge marking;
0.9.13 added high-resolution 3D.
The home page says Wi-Fi is not emulated ([desmume.org][desmume-org]), and the FAQ that two instances cannot be linked.

DeSmuME runs games on "its own internal BIOS and firmware, but only for the purposes of loading and executing ROMs",
which does not emulate every feature; external dumps give a full boot ([FAQ][desmume-faq]).
It adds a GDB stub, Lua, and TAS movie recording, and runs on Windows, macOS, and Linux (built from source).
The FAQ credits YopYop156 as its creator; the X432R fork, which added frontend features, is Windows-only,
long out of date, and has no surviving site ([download page][desmume-dl]).

**The no$gba emulator.**
Martin Korth's emulator is freeware with no licence, so closed; only its site's prose was read.
Version 3.06 is dated 14 April 2025 ([home page][nocash]).
Its history page dates a 3D software renderer and DS Wi-Fi to 2007, records local multiplay as "semi-stable",
and dates a basic DSi core to November 2014 and "working dsi-emulation
(about maybe 50% complete)" to v2.8 of February 2015 ([history][nocash-new]).
The home page warned in 2015 that DSi booting needs system files that users "probably don't have" ([home page][nocash]).
It has a debug build for Windows and gaming builds for Windows and DOS, and its debugger is its distinction
([debugger page][nocash-dev]).
The history names a built-in BIOS clone for the GBA, DS, and DSi, which is closed material,
and warns when a DSi BIOS dump is missing.
The same site links the author's Unlaunch, a DSi boot-stage exploit and launcher,
and names a disassembly of the DSi power controller's firmware; both are closed and were not opened
(`problemkaputt.de/unlaunch.htm`, `problemkaputt.de/disass_dsi_bptwl.txt`).

**NooDS.**
Its README calls it a "fast and portable DS and GBA emulator" with "accurate software rendering with upscaling"
and multi-core use, for Windows, macOS, Linux, Android, iOS, Switch, Wii U, and Vita ([README][noods]).
It runs most software without setup, and needs BIOS and firmware dumps only to boot the system menu;
the README cites DraStic's BIOS as the reference for its high-level DS BIOS functions, which are closed material,
and links dumping tools that were not followed.
The author does not review or accept pull requests.
Nothing is stated on a recompiler, the DSi, or wireless; that it is interpreter-only is (from memory).

**SkyEmu.**
Its README rates its DS emulation "Beta Quality" and lists Windows, macOS, Linux, FreeBSD, iOS, Android,
and the web ([README][skyemu]).
It bundles open-source replacement BIOS and stubs and recommends real dumps, which [R0-02][r002-fw] already quotes;
the bundled files are closed material.
Its test claims cover the Game Boy and Game Boy Advance only.

**dust.**
A Rust emulator "for desktop devices and the web, with debugging features and a focus on accuracy"
(repository description),
with builds for Windows, Linux, and macOS, a web version, a memory and disassembly viewer,
and a GDB server ([README][dust]).
It credits [GBATEK][gt-3d], Arisotura's research, StrikerX3's 3D research, and arm7wrestler,
which is closed ([register][register]).
It states no firmware policy, renderer list, or test results, and its last push was in February 2026.

**DualSOUP.**
Jakly, the author of polyrastertest,
started it in October 2025 with the aim to "Improve preservation of the NDS/DSi/3DS library
and their hardware via accurate emulation at ANY cost to usability and performance" ([README][dualsoup]).
The README calls it alpha and its DS Lite emulation incomplete, says it runs at 15 to 30 frames a second in DS mode,
and plans DSi, 3DS, and LCD emulation.
Its Game Boy Advance mode boots through the DS firmware, so it needs dumps there;
the README says nothing on firmware in DS mode.
The melonDS blog says it already goes "beyond the structural limitations of melonDS" ([blarg][mb-262]; lead).
Its MPL-2.0 licence file is the stock text; per-file notices were not checked.

### Ports, cores, and frontends

**melonDS DS** is the current libretro core.
Its README says it "is not a fork of an existing code base" but links standalone melonDS as a dependency,
and that "melonDS includes built-in BIOS and firmware replacements that work with most games" ([README][mds-ds]).
DSi mode needs DSi BIOS, firmware, and NAND files,
which the [libretro documentation][lr-mds] lists as "Required in DSi mode".
DSiWare is installed on the user's NAND image for the session,
and its title metadata is downloaded from Nintendo's servers.
Online play uses community replacements for Nintendo's Wi-Fi Connection servers, Kaeru WFC by default;
LAN play goes through libretro netplay and, by the documentation, does not work over the internet.
It has no DSi save states, so no rewind or run-ahead in DSi mode, and no GDB stub.
It builds for Windows, macOS, Linux, Android, and iOS; its compute renderer needs OpenGL 4.3, so not macOS.

The legacy libretro melonDS core is "obsolete and unmaintained", by its [documentation][lr-melonds],
though it still has the only Switch build. libretro's [DeSmuME core][lr-desmume] runs on DeSmuME's built-in replacement
unless "Use External BIOS/Firmware" is set, offers a JIT that "is not available on all hardware
(e.g. Android devices)", and keeps the bus-timing toggle on by default.
A second core, DeSmuME 2015, is a port of DeSmuME's code of about 2015 ([documentation][lr-desmume2015]);
its repository has no licence file or README, but the documentation states GPLv2 with no version,
so it is walled by the project's precedent for a bare GPL-2.0.
The [buildbot][buildbot]'s nightly listings show all four cores for Windows and Android, three for macOS and iOS,
and DeSmuME and legacy melonDS for the Switch (observed); a verifier did not re-check Linux and tvOS.

**melonDS Android** is "a DS and DSi emulator" port whose performance is "solid on 64 bit devices with thread rendering
and JIT enabled" and poor on 32-bit devices ([README][mds-android]).
It lacks local multiplayer and DSi SD card support, and is not on F-Droid (research log: 404).

**BizHawk**'s DS core is melonDS, marked in its README as accuracy-focused and acceptable on TASVideos,
for "DS + DSi" ([README][bizhawk]).
Release 2.11 updated the core to after 1.0, enabled its JIT, and loads DSi NAND applications
([release history][tas-bh-rel]).
In DS mode it runs on DraStic's free BIOS and a generated firmware when no dumps are given, and recommends real dumps;
firmware boot and DSi mode need real files ([NDS page][tas-bh-nds]).
The README calls BizHawk Windows-centric, with a Linux port about at parity and macOS only in legacy builds.
TASVideos' preferred table lists BizHawk for "Nintendo DS/DSi", and accepts DeSmuME,
which "has not been recommended for submissions since the release of the melonDS core in BizHawk 2.7"
([Emulator resources][tas-er]; [DeSmuME page][tas-desmume]).
The NDS page also says DS firmware boot code is encrypted and
that DraStic's free BIOS "lacks the code to boot to firmware".

**Delta** runs melonDS through a core repository with no licence file, so closed.
Its [README][delta] says Apple had earlier refused it, which led its author to create AltStore.
It reached the App Store on 2024-04-17, and release 1.6 added iPadOS and Apple Silicon Macs
([release notes][delta-rn]); EU users get it through AltStore PAL ([Get Delta][delta-get]).
Release 1.6 also moved to melonDS 0.9.5 and made BIOS files no longer required,
so Delta now relies on melonDS's replacement (inference);
a separate Delta Legacy app keeps the pre-1.6 core for old save states ([incompatible save states][delta-legacy]).
Release 1.7 opened online DS play through community Wi-Fi Connection servers to everyone; before it,
the feature was for patrons.

**Provenance** lists DeSmuME and melonDS for the DS among more than 60 bundled cores,
and records each core's licence in the app and in a separate table ([README][provenance]); the table was not read.
Its [BIOS requirements page][prov-bios] has no DS section, so DS runs on the cores' replacements (inference).
Its README says the Play!
core plays only with a JIT, on jailbroken devices or older OS versions, which App Store builds otherwise lack.

**Lemuroid** on Android names the DeSmuME and melonDS cores ([README][lemuroid]) and has 5M+ Play installs.
**EmulatorJS**, a web frontend, defaults to the legacy melonDS core and also offers both DeSmuME cores;
its page marks the BIOS files "Required" for melonDS ([documentation][ejs-ds]),
which conflicts with libretro's documentation and is likely stale (inference).
**OpenEmu** on macOS uses DeSmuME through a plugin last pushed in January 2021, so its DS support is stale
(inference from push dates); OpenEmu has no licence file and is closed by precedent.

**DraStic** was the leading Android DS emulator, closed source, by Exophase.
After the yuzu settlement it became free ([GamingOnLinux][gol]),
and its author wrote that "Releasing the source in short order is something I fully intend on doing";
no release was found.
In February 2025 it was "pulled from the storefront"
([Time Extension][te]), and [Android Authority][aa-drastic] reported no announcement and its website down.
Its Google Play listing returns 404 (research log, 2026-11-25), and its domain is parked.
Its techniques, an ARM recompiler, its own high-level BIOS, and upscaled 3D, are (from memory).

Closed iOS apps from companies, such as Manic EMU and Lucky Emulator,
are among the most-rated DS-capable apps on the App Store
(Apple's [lookup interface][itunes]; observed); none names the core it uses.

### Historical emulators and the maker's own

- **iDeaS**, freeware with plugins, ended at 1.0.4.0 in October 2011
  (research log, from a 2011 capture of its site whose time stamp was not recorded);
  its site is in a code span, because its page carries a game search box (`ideasemu.biz`).
- **CorgiDS** sought to "combine accuracy and speed" and needs BIOS
  and firmware dumps; it stopped in 2018 ([README][corgids]).
- **dasShiny**, by Cydrak, was built on bsnes's framework under GPL-3.0-or-later and needs dumps;
  its README puts its timing barely above ZSNES's; it stopped in 2013 ([README and licence file][dasshiny]).
  Cydrak's 3D research is credited by melonDS.
- **ndsemu**, in Go, is in a development phase with cycle counting and an unfinished JIT ([README][ndsemu]).
- **medusa**, mGBA's DS branch, is "suspended until further notice"
  ([mGBA blog][mgba-medusa]), with an alpha 2 preview on the [downloads page][mgba-dl].
- **iNDS** and its forerunners nds4ios and Nitrogen ran DeSmuME's threaded ARM interpreter on jailbroken
  or sideloaded iOS devices; its repository, `inds-team/inds`, has no licence
  and says it is largely unmaintained (observed).
- NeonDS, DualiS, and DSemu appear only on the Emulation General Wiki (lead); no primary source was read.
- **Ensata** is Nintendo's own DS emulator for developers.
  The wiki page that describes it says it reached the public through a leak, so it is closed; it is named only here,
  and that page is in a code span with a proposed closed line
  (`emulation.gametechwiki.com/index.php/Nintendo_DS_emulators`).
- **Wii U Virtual Console**: Nintendo itself sold DS games on the Wii U, 31 titles in each region,
  until purchases ended in March 2023 ([Wikipedia, "Virtual Console"][w-vc], revision 1386423035).
  No Nintendo prose on how its emulator works was found, and its internals were not researched,
  because such details usually come from firmware analysis.

### Host platforms

- **Windows, macOS, Linux:** every dedicated emulator above except no$gba, which is Windows and DOS only;
  BizHawk runs on Windows and Linux, with macOS only in legacy builds, and OpenEmu on macOS only.
- **Android:** melonDS Android, the libretro cores in RetroArch and Lemuroid, NooDS, and SkyEmu.
  DraStic left Google Play in 2025.
  The libretro DeSmuME JIT does not run there.
- **iOS and iPadOS:** Delta (from 2024-04-17), RetroArch (from 2024-05-15), Provenance
  (from 2025-01-06),
  and closed apps are on the App Store ([lookup interface][itunes]) under guideline 4.7
  ([App Review Guidelines][apple-guide]), which let emulators in from April 2024 (from memory).
  NooDS and SkyEmu offer iOS builds outside the store (READMEs; no store listing found).
  Apple grants no JIT to App Store apps, so DS emulation there runs interpreters
  (inference; the entitlement rule is from memory, and the Provenance README notes an exception on older OS versions).
- **Web:** SkyEmu, dust, and EmulatorJS.
- **Consoles:** NooDS on Switch, Wii U, and Vita; RetroArch's Switch cores; Nintendo's Wii U Virtual Console.

### Techniques across the family

- **CPU:** melonDS and DeSmuME pair an interpreter with a recompiler, and each says the interpreter is the reference
  (DeSmuME FAQ; libretro DeSmuME documentation) or keeps one for the ARM9's protection unit (melonDS 0.9.4 notes).
  Only DualSOUP aims at cycle accuracy.
- **Timing:** melonDS is reworking its timing model
  ([1.0 RC post][mb-216]; lead); DeSmuME offers bus-level timing as a toggle.
  [R1-02][r102-ds] gives the ARM9's slow uncached accesses; GBATEK's own notes on them are headed as unsorted
  ([DS Memory Timings][gt-timings]).
- **3D:** software renderers are the accurate path in melonDS, DeSmuME, and NooDS;
  GPU renderers trade accuracy for upscaling, and melonDS's compute renderer tries to keep both.
  GBATEK says rendering is automatic, so "the software has little influence on it",
  and runs scanline by scanline with limited cycles per line
  ([DS 3D Overview][gt-3d]),
  and that a full geometry command FIFO stalls the CPU that writes to it ([DS 3D Geometry Commands][gt-geom]).
- **Wireless:** melonDS emulates local wireless and online play,
  and no$gba's history records semi-stable local multiplay; DeSmuME's Wi-Fi is experimental and unsupported
  ([DeSmuME FAQ][desmume-faq]).
  Online play in melonDS DS and Delta goes through community replacements for Nintendo's servers
  ([melonDS DS README][mds-ds]; [Delta release notes][delta-rn]).
- **DSi:** melonDS and no$gba run it; BizHawk and the melonDS ports inherit melonDS's.
  The Teak DSP is high-level emulated for known microcode in melonDS.
- **Firmware:** in DS mode, DeSmuME, melonDS, NooDS, SkyEmu, and no$gba ship a replacement;
  CorgiDS and dasShiny need dumps, and DualSOUP needs them for its Game Boy Advance mode.
  In DSi mode every emulator needs dumps.
- **Enhancements:** upscaling (melonDS, DeSmuME, NooDS), texture filters
  (libretro DeSmuME), screen layouts, cheats, and debuggers (no$gba, melonDS, DeSmuME, dust).

### Tests and published results

The only published comparison is the Emulation General Wiki's [NDS Tests][egw-tests]
(revision 140213, 2026-03-15; lead, so not relied on),
run with official BIOS files on melonDS 1.0rc, a DeSmuME build of 0.9.14, SkyEmu v3, and no$gba 3.06.

| Test (oracle) | melonDS | DeSmuME | SkyEmu | no$gba |
|---|---|---|---|---|
| polyrastertest 1.0.2-b, 77 subtests (New 3DS XL) | 70 | 1 | 1 | 31 |
| rockwrestler `LDM`/`STM` (hardware, with help) | fails at 8 | fails at 4 | fails at 16 | passes |
| rockwrestler IPC FIFO | fails at 6 | fails at 25 | passes | fails at 2 |
| rockwrestler TCM | fails at 10 | fails at 0 | passes | fails at 10 |
| rockwrestler division | passes | passes | crashes on 64-bit | passes |
| Timing MEGA test, five groups (not stated) | 12 to 22 of each | fewer | 2 to 4 | 2 groups pass |

- Every emulator passes rockwrestler's condition-code test, its ARMv5 instruction tests other than `LDM`/`STM`,
  and its IPC interrupt, `WRAMCNT`, and `VRAMCNT` tests; no$gba times out on IPC sync.
  Its totals on the timing test exceed the subtest counts as printed, so its row is recorded as the page gives it.
- Oracles: polyrastertest's data was "recorded on a New3DSXL via TWiLight Menu++ 26.3.0" ([polyrastertest][polyraster]),
  and rockwrestler's README thanks StrikerX3 for testing on hardware
  (`rockpolish/rockwrestler`, closed, README read); the timing test's author and oracle were not found.
  The polyrastertest oracle is a New 3DS XL in DS mode, not an original DS or DSi.
- rockwrestler is "Work in progress"; its maths tests check results,
  not timing (README). armwrestler and armwrestler-fixed are closed too,
  so their results may be used but their code may not be read.
- The page also runs Nintendo's "NTR Aging" card software, which is closed and which [R0-05][r005-ds] forbids;
  its results are not used.
- No emulator publishes its own DS results, and no DSi test suite was found
  (searched: the melonDS site and README, the DeSmuME site and FAQ, the NooDS, dust, and SkyEmu READMEs,
  and a web search for DSi test programs). melonDS's DSP work used the author's own test homebrew;
  the post does not say it was run on a console ([Having fun with DSP HLE][mb-231]; lead).

### How hard the family is to emulate

The primer sets out the hardware ([R1-02][r102-ds]);
these are the points of difficulty that the emulators' own prose confirms.

- **Two different CPUs, one clock domain.**
  The ARM9 at twice the bus clock and the ARM7 share memory and talk through IPC FIFOs;
  the rockwrestler failures above are in that area and in the ARM9's tightly coupled memory.
- **Caches decide speed.**
  GBATEK says cached memory timing on misses "might even drop to 1.4MHz or so?"
  ([DS Memory Timings][gt-timings]),
  and melonDS's author had to adjust cache timings to run the DSi Sound application
  ([Having fun with DSP HLE][mb-231]; lead).
- **3D is exact-pixel and line-limited.**
  Only one emulator passes most of polyrastertest (table above).
- **Wireless needs tight timing.**
  The melonDS FAQ says Nintendo's local protocol "requires tight timing for a good connection" ([FAQ][melonds-faq]).
- **The DSi adds a new machine.**
  [DSiBrew][dsibrew-hw] gives an ARM9 at 133 MHz in DSi mode, a Teak DSP at 133 MHz, 16 MiB of RAM, two cameras,
  and 240 MB of NAND, as DSiBrew gives the unit.
  GBATEK gives 800 KiB of shared WRAM in all, the old 32 KiB plus three new 256 KiB banks,
  of which two can also map to the DSP, and marks several of its behaviours unknown ([DSi New Shared WRAM][gt-wram]).
  [Teakra][teakra] says most DSi games do not use the DSP,
  and that its architecture "is still unclear". melonDS found that the DSi menu powers the cartridge off,
  and that the DSi was planned with two cartridge slots ([The DS cartridge interface][mb-251]; lead).
- **Documentation gaps.**
  [R0-05][r005-ds] records that no DS or DSi reference has a licence grant or a stated method,
  and no ARM9 single-step vectors exist.

### Legal exposure

This section builds on [R0-02][r002]; it is not legal advice.

**Courts have ruled on the DS lock-out.**
R0-02 cites these cases for other points; their DS facts are these.

- England: [Nintendo v Playables][playables] concerns the DS.
  The judge held that the boot software's check for the "Nintendo Logo Data File" and the card's "encryption
  and scrambling" are effective technological measures, doubting only the slot's shape,
  and that homebrew use still circumvents.
  The defendants did not resist summary judgment ([R0-02, "The United Kingdom"][r002-uk]).
- Canada: [Nintendo v King][king] concerns the DS, 3DS, and Wii.
  Its registered works include a "NINTENDO DS BOOT CODE
  (a.k.a. NINTENDO DS HEADER CODE)",
  and it found that "Authorized DS game cards each contain a copy of the DS Header Data
  and the Nintendo Logo Data File", which the console compares with reference copies.
  [R0-02, "Boot logos"][r002-logo] names only King's Game Boy Advance work; King also registers the DS header code.
- European Union: [Nintendo v PC Box][pcbox] concerns DS and Wii consoles,
  whose recognition system blocks games lacking a code (paragraph 10).
- Germany: the Federal Court of Justice's "Videospiel-Konsolen II"
  (I ZR 124/11) concerns adapters shaped like DS Slot-1 cards.
  Its headnote holds that cards and console matched in their dimensions can be an effective measure,
  the shape that Playables doubted, and it sent the case back to test proportionality
  ([judgment][bgh]; [R0-02, "Germany"][r002-de]).
- Japan: R0-02 records the damages against DS copier sellers;
  [Nintendo's release][nintendo-jp] gives the case history from 2009 to the Supreme Court's refusal in January 2016
  ([R0-02, "Japan"][r002-jp]).
- France: the Paris Court of Appeal convicted six importers of DS "linkers" in September 2011,
  ([Le Monde du Droit][lmdd]),
  with damages and fines of over 5.2 million euros by [Game Developer][gd]'s account
  (both secondary; the judgment was not found).
  Neither the Japanese nor the French sources read name the protection mechanism.
- United States: in Nintendo v Chan (C.D. Cal. 2009),
  a preliminary injunction found the DS security system a measure that controls access under section 1201
  ([Loeb summary][loeb]; secondary).
  It is the only American DS ruling found, and it concerns copier sellers, not an emulator;
  R0-02's finding that no section 1201 decision covers a cartridge-era logo check alone stands
  ([R0-02, "Which systems the claims concern"][r002-which]).

Every ruling targets sellers of copier cards, adapters, or modchips.
None concerns an emulator, and no notice or claim against any DS or DSi emulator was found
(searched: the press read for this note, and web searches; the GitHub DMCA archive was not searched again,
and R0-02 records no notice naming melonDS, [R0-02, "Who has been reached"][r002-who]).

**Maker statements.**
Nintendo's current [piracy FAQ][nintendo-faq] says it is illegal to distribute "circumvention products
(such as piracy cartridges, game copiers, USB piracy sticks, mod chips, and/or software)",
and that some emulators circumvent ([R0-02, "Makers' statements on emulators"][r002-stmt]).
No DS-specific statement on emulators was found.

**Encryption.**
DS game data on the card is not encrypted beyond the bus and the secure area
([Copetti][copetti-nds]; lead), and [R1-06][r106-hh] records the card's encryption and Download Play signatures.
An emulator that runs a dump whose secure area is already decrypted, by direct boot, decrypts nothing,
which is [R0-02's option 1][r002-o1] or the first variant of [option 3][r002-o3] (inference).
Booting through the firmware, or re-encrypting the secure area, needs key data held in the user's ARM7 BIOS,
which is [option 4][r002-o4] with a key inside the dump
(inference; that firmware boot uses it is from memory).
libretro has a separate "Decrypted" DS category beside its plain DS database
([libretro documentation][lr-mds]),
so decrypted dumps circulate; that the plain database lists encrypted dumps is (from memory).

**The DSi is a different case.**
GBATEK says DSi cards carry a signed extended header that makes unlicensed code "problematic" to run
([DSi Basic Differences][gt-dsi]).
Every DSi has a unique NAND ([TASVideos][tas-bh-nds]), and melonDS loads the key for exported DSiWare itself
(release notes).
That the NAND and DSiWare are encrypted with keys derived from console identifiers in the DSi BIOS is
(from memory), and so is the encryption of DSi-only regions on DSi-enhanced cards.
So every DSi emulator decrypts at run time with keys from the user's files, which is [R0-02's option 2][r002-o2],
the pattern pleaded against yuzu (inference).
No emulator surveyed here accepts already-decrypted DSi content in place of the user's files
(searched: the prose of each emulator above).
For [option 6][r002-o6], the DSi Shop shut on 2017-03-31
([Wikipedia, "Nintendo DSi"][w-dsi], revision 1386756319),
and no DSi system file published by Nintendo was found
(searched: the sources above; Nintendo's servers were not contacted).

**Firmware.**
In DS mode the whole ecosystem runs on replacement firmware
([option 5][r002-o5]):
melonDS with DraStic's BIOS, DeSmuME's internal one, NooDS's, SkyEmu's, and every frontend that inherits them,
including Delta since 1.6.
For Rustalgia each of these is closed material, which [R0-05][r005-ds] already forbids for melonDS and DeSmuME.
No surveyed project ships Nintendo's BIOS files.
Copetti says the secure-area scheme was worked out from an extracted ARM7 BIOS
([Copetti][copetti-nds]; lead), so its details are boot-ROM analysis and are kept to R1-02's level here.

**Boot logos.**
This answers R0-02's open question for the DS ([R0-02, "Open questions"][r002-open]).
Playables says the boot software checks the card for the logo data file,
and King that the console compares the card's header data with its own reference copies.
As R0-02 reasons for the Game Boy Advance, the comparison is the boot code's gate,
so a replacement boot path that makes no comparison needs no copy of the logo, which the card supplies
(inference; that the logo bitmap sits in the card header is from memory).
King's registration of the header code as a work means a boot path
that drew the card's logo would reproduce it on the user's machine,
which [option 16][r002-o16] already covers (inference).

**Dumping guides and links.**
The melonDS FAQ and downloads page, and the NooDS README, link dumping tools
([option 7][r002-o7]),
and the NooDS README also links a copy of DraStic's BIOS binary; this note links those pages but none of those tools.
R0-02's recommendation against such links applies unchanged.

**Stores and money.**
DraStic's delisting in February 2025 belongs in R0-02's table as a voluntary
or unexplained removal with no notice reported ([R0-02, "Takedown and enforcement history"][r002-take]).
Delta's patron features, Provenance Plus, and EmulatorJS's demo ads tie money to DS emulation ([option 8][r002-o8]).

**New exposure points.** melonDS DS fetches DSiWare metadata from Nintendo's servers,
and melonDS DS and Delta connect users to replacement online services; no claim about either was found.
Bundled GPL cores sit inside an AGPL frontend (Delta), a BSD-style one with a branding clause (Provenance),
and closed apps of unknown origin; for Rustalgia this only confirms that those projects are read as prose.

### Register re-check

- The lines for melonDS, DeSmuME, dust, SkyEmu, RetroArch, BizHawk, Delta, Provenance, Teakra, polyrastertest,
  the closed armwrestler, arm7wrestler, and rockwrestler lines, wiki.desmume.org, melonds.kuribo64.net, mgba.io,
  TASVideos, docs.libretro.com, and the Emulation General Wiki were re-checked; no licence
  or tier has changed ([register][register]).
- The register has two lines for androidauthority.com with different tiers; the duplicate is reported for removal,
  not changed here.
- The replacement BIOS inside melonDS, DeSmuME, NooDS, and SkyEmu is closed by precedent, but has no path line,
  because the repository trees were not listed under this survey's process call.
- The same holds for melonDS's DuckStation-derived context code: walled or closed once its path is known.
- The new lines are listed in the pull request.
  Protective closed lines cover the DSi pages of GBATEK that hold keys, certificates, exploits, or dumping instructions,
  including the head page of the Teak section, which the existing Teak prefix does not match.

## Options and trade-offs

### Which emulators the studies cover

- **What:** keep [R1-34 (melonDS) and R1-35 (DeSmuME)][studies] as planned,
  and add [DualSOUP][dualsoup] to R1-34 as a contrast, or give no$gba, [NooDS][noods], or DualSOUP studies of their own.
- **Costs:** the closed no-licence emulator can only be observed;
  NooDS repeats DeSmuME's design space without published results; each extra study costs a note.
- **Gains:** [melonDS][melonds] is the most accurate and most used engine,
  [DeSmuME][desmume] the long-lived alternative, and DualSOUP the only project that puts cycle accuracy first,
  as Rustalgia's [README][readme] puts accuracy first.
- **Used by:** the roadmap's current list.

### Which test oracles to adopt

- **What:** [polyrastertest][polyraster] and the closed wrestler suites' published results,
  Rustalgia's own DS hardware tests, or comparison with melonDS.
- **Costs:** polyrastertest covers rasterisation only, and its oracle is a New 3DS XL in DS mode;
  the wrestlers are closed and cannot be read; hardware tests need a console, a flash card, and a roadmap item,
  since [R5-12][phase5] covers the PlayStation 1 only; comparison with melonDS imports its errors.
- **Gains:** polyrastertest is open, has a stated console oracle, and separates the emulators sharply.
- **Used by:** the [Emulation General Wiki][egw-tests]'s table (lead).

### How to boot DS software

- **What:** Rustalgia's own boot path and high-level BIOS with direct boot of decrypted dumps,
  the user's dumped BIOS and firmware, or both.
- **Costs:** a high-level BIOS misses firmware boot
  and the system menu; dumps rest on no settled lawful route ([R0-02][r002-fw]) and need key data for firmware boot.
- **Gains:** the first needs no maker code and no decryption, and is what the popular emulators already default to.
- **Used by:** melonDS, DeSmuME, NooDS, SkyEmu, and no$gba, with closed replacements;
  BizHawk falls back to melonDS's replacement but recommends dumps ([BizHawk NDS][tas-bh-nds]).

### Whether to emulate the DSi

- **What:** DS mode only; DSi mode with the user's NAND and keys; or DSi mode only for already-decrypted content.
- **Costs:** the second is [R0-02's option 2][r002-o2]; for the third,
  no emulator accepts already-decrypted DSi content, and the DSi Shop is gone.
- **Gains:** DSi-exclusive software and DSiWare come into scope.
- **Used by:** melonDS and no$gba use the second.

### Which accuracy target

- **What:** melonDS's level, fast and accurate enough for [TASVideos][tas-er], or DualSOUP's cycle-level target.
- **Costs:** DualSOUP runs at 15 to 30 frames a second; melonDS's author says its structure limits it.
- **Gains:** the first runs on phones; the second might pass the timing tests
  that no emulator passes in full (inference).
- **Used by:** melonDS and DualSOUP.

### Recommendation

- **Studies:** keep R1-34 and R1-35, and fold DualSOUP into R1-34 as the cycle-accuracy contrast;
  observe no$gba's debugger behaviour in R1-34 rather than studying it. melonDS is the engine of the whole ecosystem,
  and DualSOUP's author is the polyrastertest author.
- **Oracles:** adopt polyrastertest now, take the wrestler suites' results as targets without reading them,
  and add a phase 5 spike that measures the DS and DSi on a console for IPC, caches, and timing,
  either by widening R5-12 or as a new item; that roadmap change is the owner's.
  These are the areas where every emulator fails something.
- **Boot:** DS mode with Rustalgia's own boot path and decrypted input, the user's dumps optional,
  as [R0-02's recommendation][r002-rec] prefers for firmware.
  [R1-02's recommendation][r102-rec] differs: it makes the user's dumps the accurate path,
  with Rustalgia's own services where clean sources describe them; the owner settles the difference.
  The process call here is that a DS dump with a decrypted secure area is decrypted input,
  R0-02's option 3 first variant, which R0-02 prefers wherever an encrypted system is taken up;
  R0-02 sends each encrypted system to [R6-01][phase6], so R6-01 confirms DS mode on that basis.
  The courts' rulings all concern the card protection, and direct boot of a decrypted dump performs none.
- **DSi:** defer it to R6-01, to be decided with the other encrypted systems.
  Every DSi emulator decrypts with keys from the user's files.
- **Accuracy:** design for cycle-level timing of the ARM9 caches and bus, with a faster mode later.
  The project puts accuracy first, and the failing tests sit in timing and IPC.

## Implications for Rustalgia

- A DS core can be planned without any maker code in DS mode;
  this feeds [R2-12][phase2]'s firmware technique and an ADR on boot paths.
- The scheduler must interleave two different ARM cores with cache-accurate ARM9 timing,
  as [R1-02][r102-rec] also recommends; this feeds [R2-03][phase2].
- DSi support is an encrypted-system decision for [R6-01][phase6], not an engineering default.
- [polyrastertest][polyraster] and any DS hardware runs belong in the quality targets ([R6-02][phase6]).
- Mobile hosts without a JIT (iOS) will run the DS cores interpreted;
  [R5-07][phase5] should measure an interpreter's speed on an iPhone before any recompiler work,
  and [R3-01][phase3] settles the JIT rule.

## Open questions

- What does the DS hardware do where [GBATEK][gt-wram] marks behaviour unknown, such as the DSi WRAM mapping priority,
  and where its uncached ARM9 timing notes are unsorted?
  A DS hardware spike would answer it, once the owner adds one to phase 5.
  The Emulation General Wiki links a "DS Memory Cycle Counter" test
  (`desperateprogrammer/dsmemorycyclecounter`, closed: no licence, README 404),
  which the page does not tie to its timing table.
- Who wrote the "Timing MEGA test", and what is its oracle?
  Its author or a public copy would answer it; a web search found only the wiki's page.
- Does any closed iOS DS app embed a GPL core?
  Only its binary would show it, and the project does not obtain them.

## Sources

Every source below was read on 2026-11-25, unless an entry says otherwise.
Repositories were read through GitHub's metadata, licence, release, and README endpoints on their default branches;
README commits were not pinned.

Repository notes and files:

- [R0-02, "Legal baseline"][r002]; [R0-03][r003]; [R0-05, "Nintendo DS, DSi, and 3DS"][r005-ds];
  [R1-02, "Nintendo DS and DSi"][r102-ds]; [R1-06, "Handhelds of the Nintendo families"][r106-hh];
  [research roadmap][surveys]; [research guide][guide]; [source register][register]; [README][readme]; [ADR 0006][adr6].

Emulators and frontends:

- [melonDS README][melonds]; [melonDS site][melonds-site]; [FAQ][melonds-faq]; [downloads][melonds-dl];
  [release notes][melonds-rel] (releases 0.9 to 1.1).
- melonDS blog, lead: [1.0 RC][mb-216] (2024-11-21); [Having fun with DSP HLE][mb-231] (2025-07-31); [1.1][mb-240]
  (2025-11-18); [The DS cartridge interface][mb-251] (2026-02-28); [Bit of plans][mb-260] (2026-06-21); [blarg][mb-262]
  (2026-09-27); [New horizons][mb-263] (2026-10-07); [Restricting pull requests][mb-267] (2026-11-24).
- [DeSmuME repository][desmume]; [desmume.org][desmume-org]; [download page][desmume-dl];
  [DeSmuME wiki FAQ][desmume-faq] (revision 8944, 2022-06-06).
- no$gba: [home page][nocash]; [version history][nocash-new]; [debugger page][nocash-dev].
- [NooDS][noods]; [SkyEmu][skyemu]; [dust][dust]; [DualSOUP][dualsoup]; [CorgiDS][corgids]; [dasShiny][dasshiny];
  [ndsemu][ndsemu]; [mGBA, "Holy grail bugs revisited"][mgba-medusa]; [mGBA downloads][mgba-dl].
- [melonDS DS][mds-ds]; [melonDS Android][mds-android]; [BizHawk][bizhawk]; [Delta][delta]; Delta FAQ,
  [release notes][delta-rn] (latest entry 2026-11-23), [Get Delta][delta-get],
  and [incompatible save states][delta-legacy]; [Provenance][provenance];
  [Provenance wiki, "BIOS Requirements"][prov-bios]
  (updated about 2026-03); [Lemuroid][lemuroid]; [EmulatorJS, "Nintendo DS"][ejs-ds].
- libretro documentation (site stamp 2026-10-22): [melonDS DS][lr-mds]; [melonDS][lr-melonds]; [DeSmuME][lr-desmume];
  [DeSmuME 2015][lr-desmume2015]; [buildbot nightly listings][buildbot].
- TASVideos: [Emulator resources][tas-er] (edited about 2026-11-13); [DeSmuME][tas-desmume]
  (edited 2025-04-17);
  [BizHawk release history][tas-bh-rel] (edited 2026-05-31); [BizHawk NDS][tas-bh-nds] (edited 2025-10-03).
- Emulation General Wiki, lead: [NDS Tests][egw-tests] (revision 140213, 2026-03-15).
- Stores: Google Play, [RetroArch][gp-ra], [Lemuroid][gp-lemuroid], [melonDS][gp-melonds]; App Store, [Delta][as-delta],
  [RetroArch][as-ra], [Provenance][as-prov]; Apple's [lookup interface][itunes] (API output).
  DraStic's former listing, `play.google.com/store/apps/details?id=com.dsemu.drastic`, returns 404.
- Not linked, because closed: `rockpolish/rockwrestler` (README only); `inds-team/inds` (README only); `ideasemu.biz`
  (a 2011 capture),
  for its game search box; `emulation.gametechwiki.com/index.php/Nintendo_DS_emulators`,
  which names a leaked maker emulator; `problemkaputt.de/unlaunch.htm` and `problemkaputt.de/disass_dsi_bptwl.txt`,
  not opened.

Hardware:

- GBATEK, at its author's site: [DS 3D Overview][gt-3d]; [DS 3D Geometry Commands][gt-geom];
  [DS Memory Timings][gt-timings]; [DSi Basic Differences to NDS][gt-dsi]; [DSi New Shared WRAM][gt-wram].
- [DSiBrew, "Hardware"][dsibrew-hw] (revision 2099901, last edited 2023-10-04;
  its API and revision links refuse automated requests); [Teakra README][teakra]; [polyrastertest][polyraster];
  [Copetti, "Nintendo DS Architecture"][copetti-nds] (last modified 2026-06-10; lead).
- Wikipedia: ["Nintendo DSi"][w-dsi] (revision 1386756319); ["Virtual Console"][w-vc] (revision 1386423035).

Law, policy, and press:

- [Nintendo v Playables][playables]; [Nintendo v King][king]; [Nintendo v PC Box][pcbox]; [BGH, I ZR 124/11][bgh];
  [Nintendo press release, 2016-01-19][nintendo-jp].
- Secondary: [Le Monde du Droit][lmdd] (2011-10-04); [Game Developer][gd] (2011-10-03); [Loeb, on Chan][loeb] (2009-07).
- [Nintendo, piracy FAQ][nintendo-faq]; [Apple, App Review Guidelines][apple-guide] (last updated 2026-10-16).
- Press: [Android Authority][aa-drastic] (2025-02-14); [Time Extension][te] (2025-02-14);
  [GamingOnLinux][gol] (2024-03).

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[guide]: ../README.md#claim-status
[readme]: ../../../README.md
[register]: ../../../.claude/hooks/source-register.txt
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[r002]: R0-02-legal-baseline.md
[r002-uk]: R0-02-legal-baseline.md#the-united-kingdom
[r002-de]: R0-02-legal-baseline.md#germany
[r002-jp]: R0-02-legal-baseline.md#japan
[r002-which]: R0-02-legal-baseline.md#which-systems-the-claims-concern
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r002-stmt]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-fw]: R0-02-legal-baseline.md#how-projects-handle-firmware-and-games
[r002-logo]: R0-02-legal-baseline.md#boot-logos
[r002-take]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r002-open]: R0-02-legal-baseline.md#open-questions
[r002-rec]: R0-02-legal-baseline.md#recommendation
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o2]: R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys
[r002-o3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o6]: R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r003]: R0-03-licence-strategy.md
[r005-ds]: R0-05-source-map.md#nintendo-ds-dsi-and-3ds
[r102-ds]: R1-02-primer-32-and-64-bit.md#nintendo-ds-and-dsi
[r102-rec]: R1-02-primer-32-and-64-bit.md#recommendation
[r106-hh]: R1-06-catalogue-32-and-64-bit.md#handhelds-of-the-nintendo-families
[melonds]: https://github.com/melonDS-emu/melonDS
[melonds-rel]: https://github.com/melonDS-emu/melonDS/releases
[melonds-site]: https://melonds.kuribo64.net/
[melonds-faq]: https://melonds.kuribo64.net/faq.php
[melonds-dl]: https://melonds.kuribo64.net/downloads.php
[mb-216]: https://melonds.kuribo64.net/comments.php?id=216
[mb-231]: https://melonds.kuribo64.net/comments.php?id=231
[mb-240]: https://melonds.kuribo64.net/comments.php?id=240
[mb-251]: https://melonds.kuribo64.net/comments.php?id=251
[mb-260]: https://melonds.kuribo64.net/comments.php?id=260
[mb-262]: https://melonds.kuribo64.net/comments.php?id=262
[mb-263]: https://melonds.kuribo64.net/comments.php?id=263
[mb-267]: https://melonds.kuribo64.net/comments.php?id=267
[desmume]: https://github.com/TASEmulators/desmume
[desmume-org]: https://desmume.org/
[desmume-dl]: https://desmume.org/download/
[desmume-faq]: https://wiki.desmume.org/index.php?title=Faq
[nocash]: https://problemkaputt.de/gba.htm
[nocash-new]: https://problemkaputt.de/gbanew.htm
[nocash-dev]: https://problemkaputt.de/gba-dev.htm
[noods]: https://github.com/Hydr8gon/NooDS
[skyemu]: https://github.com/skylersaleh/SkyEmu
[dust]: https://github.com/kelpsyberry/dust
[dualsoup]: https://github.com/Jaklyy/DualSOUP
[corgids]: https://github.com/PSI-Rockin/CorgiDS
[dasshiny]: https://github.com/Cydrak/dasShiny
[ndsemu]: https://github.com/rasky/ndsemu
[mgba-medusa]: https://mgba.io/2018/03/09/holy-grail-bugs-revisited/
[mgba-dl]: https://mgba.io/downloads.html
[mds-ds]: https://github.com/JesseTG/melonds-ds
[mds-android]: https://github.com/rafaelvcaetano/melonDS-android
[bizhawk]: https://github.com/TASEmulators/BizHawk
[delta]: https://github.com/rileytestut/Delta
[delta-rn]: https://faq.deltaemulator.com/release-notes
[delta-get]: https://faq.deltaemulator.com/getting-started/get-delta
[delta-legacy]: https://faq.deltaemulator.com/using-delta/nintendo-ds/incompatible-save-states
[provenance]: https://github.com/Provenance-Emu/Provenance
[prov-bios]: https://wiki.provenance-emu.com/getting-started/bios-requirements
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[ejs-ds]: https://emulatorjs.org/docs/systems/nintendo-ds
[lr-mds]: https://docs.libretro.com/library/melonds_ds/
[lr-melonds]: https://docs.libretro.com/library/melonds/
[lr-desmume]: https://docs.libretro.com/library/desmume/
[lr-desmume2015]: https://docs.libretro.com/library/desmume_2015/
[buildbot]: https://buildbot.libretro.com/nightly/
[tas-er]: https://tasvideos.org/EmulatorResources
[tas-desmume]: https://tasvideos.org/EmulatorResources/Desmume
[tas-bh-rel]: https://tasvideos.org/BizHawk/ReleaseHistory
[tas-bh-nds]: https://tasvideos.org/BizHawk/NDS
[egw-tests]: https://emulation.gametechwiki.com/index.php?title=NDS_Tests&oldid=140213
[gp-ra]: https://play.google.com/store/apps/details?id=com.retroarch
[gp-lemuroid]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[gp-melonds]: https://play.google.com/store/apps/details?id=me.magnum.melonds
[as-delta]: https://apps.apple.com/us/app/id1048524688
[as-ra]: https://apps.apple.com/us/app/id6499539433
[as-prov]: https://apps.apple.com/us/app/id1596862805
[itunes]: https://itunes.apple.com/lookup?id=1048524688,6499539433,1596862805&country=us
[gt-3d]: https://problemkaputt.de/gbatek-ds-3d-overview.htm
[gt-geom]: https://problemkaputt.de/gbatek-ds-3d-geometry-commands.htm
[gt-timings]: https://problemkaputt.de/gbatek-ds-memory-timings.htm
[gt-dsi]: https://problemkaputt.de/gbatek-dsi-basic-differences-to-nds.htm
[gt-wram]: https://problemkaputt.de/gbatek-dsi-new-shared-wram-for-arm7-arm9-dsp.htm
[dsibrew-hw]: https://dsibrew.org/wiki/Hardware
[teakra]: https://github.com/wwylele/teakra
[polyraster]: https://github.com/Jaklyy/PolyRasterTest
[copetti-nds]: https://www.copetti.org/writings/consoles/nintendo-ds/
[w-dsi]: https://en.wikipedia.org/w/index.php?title=Nintendo_DSi&oldid=1386756319
[w-vc]: https://en.wikipedia.org/w/index.php?title=Virtual_Console&oldid=1386423035
[playables]: https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1932
[king]: https://decisions.fct-cf.gc.ca/fc-cf/decisions/en/item/223922/index.do
[pcbox]: https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62012CJ0355
[bgh]: https://rws-verlag.de/fileadmin/zbb-volltexte-3/i_zr_124-11a.pdf
[nintendo-jp]: https://www.nintendo.co.jp/corporate/release/2016/160119.html
[lmdd]: https://www.lemondedudroit.fr/pi-tic/278-propriete-intellectuelle-industrielle/28767-linkers-de-nintendo-la-cour-dappel-de-paris-donne-raison-a-la-societe-japonaise.html
[gd]: https://gamedeveloper.com/business/nintendo-applauds-french-ruling-against-game-copying-devices
[loeb]: https://www.loeb.com/en/insights/publications/2009/07/nintendo-of-america-inc-v-chan-et-al
[nintendo-faq]: https://en-americas-support.nintendo.com/app/answers/detail/a_id/55888
[apple-guide]: https://developer.apple.com/app-store/review/guidelines/
[aa-drastic]: https://www.androidauthority.com/drastic-ds-emulator-removed-3526330/
[te]: https://www.timeextension.com/news/2025/02/nintendo-ds-emulator-drastic-pulled-from-google-play-store
[gol]: https://www.gamingonlinux.com/2024/03/nintendo-ds-emulator-drastic-became-free-of-charge-after-yuzu-case/
