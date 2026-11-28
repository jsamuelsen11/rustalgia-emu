---
title: "PSP and PlayStation Vita: family survey"
roadmap_item: R1-20
status: approved
date: 2026-11-26
---

# PSP and PlayStation Vita: family survey

## Summary

This note asks which emulators matter for the PSP and PlayStation Vita family, what each one is and does,
how exposed the family is in law, and how hard it is to emulate.

[PPSSPP][ppsspp] dominates the PSP by every sign found: 15,000 stars, "100M+" installs of its free Android app,
official builds for six host families, and the only published bit-exact results against a real PSP.
It is open tier, but its high-level PSP operating system is closed as system software,
and its KIRK engine folder is closed as a key hazard.
[JPCSP][jpcsp] and [KanaStation][kanastation] are the open-tier alternatives,
the second a new low-level emulator that needs the user's boot ROM and NAND.
The Vita has one emulator of weight, [Vita3K][vita3k], which is walled, has no store listing,
and asks for Sony's firmware download and decrypted or licence-file content; every Vita fork found is walled too.

Legal exposure is that of an encrypted system (inference): PSP executables are encrypted for KIRK,
Vita content needs console keys or licence files, and the leading emulators decrypt in their own code.
No Sony action against a PSP or Vita emulator was found; the enforcement on record is Apple's and Google's,
against PPSSPP's store apps.

For Rustalgia, the PSP is well documented by hardware tests and runs at full speed without a recompiler on iOS,
by PPSSPP's account, while the Vita has no hardware test suite,
and no clean-room emulator beyond the experimental vitaslop runs games without Sony's modules.
The note recommends, for the owner to decide,
keeping the PPSSPP study ([R1-44](../emulators/R1-44-ppsspp.md)) without its closed parts, decrypted input only,
PPSSPP's hardware measurements and [vfpu-docs][vfpu-docs] as the oracles,
and no Vita study until [R6-01][phase6] takes the Vita up.

## Scope

- Question: which emulators are popular or respected for the PSP and PlayStation Vita family, and for each,
  what are its status, licence, tier, techniques, and hosts; what is the family's legal exposure;
  and how hard is it to emulate?
- Covered: the PSP-1000, PSP-2000, PSP-3000, PSP Go (N1000), and PSP Street (E1000);
  the PlayStation Vita PCH-1000 and PCH-2000, and the PlayStation TV, as [R1-07][r107-hand] lists them,
  with the PlayStation TV as a Vita variant ([R1-07, "Treating combined units"][r107-pstv]).
  The hardware is in [R1-03][r103-cpu], the law in [R0-02][r002], and the hubs in [R0-05][r005];
  this note cites those sections and does not repeat them.
- Researched on 2026-11-25.
  Status figures (archived flag, last push, stars, licence identifier, latest release) are GitHub API metadata read
  between 2026-11-25 and 02:30 UTC on 2026-11-26, during research and verification, so they are observed, not quoted.
- How claims were checked: three research agents
  (emulators; frontends and stores; law and difficulty)
  read every page as raw text with curl, GitHub's API, or a wiki capture, and matched quotations against it.
  Emulators were read from prose only, in every tier, with no source file, issue, or pull request opened.
  Three fresh verifiers then checked each claim, quotation, link, and register line,
  and a fix pass fetched each disputed source again before applying their findings (research log).
- No key, KIRK key, keyring, game-card, licence-file, or firmware page was opened, and no firmware, game,
  or dump was downloaded.
  Markers follow the [research guide][guide]; the [Emulation General wiki][egw-psp], a lead in the [register][register],
  is marked "(lead)".
  A statement that nothing was found records a search, not proof of absence.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, store installs, frontends), respect
  (accuracy claims backed by tests, or use as a reference), or history (it shaped the family, or Sony made it).
- Each tier was checked against the [register][register], as ADR 0006 requires when a survey covers a source
  ([ADR 0006, "Evaluating a new source"][adr6-eval]).
  One existing line changes: [ScarletNX][scarlet] moves from open to walled,
  because its credits list code ported from Vita3K ("Other Vita emulators" below).
  The other lines re-read keep their tier: [PPSSPP][ppsspp], [RetroArch][retroarch], and [Lemuroid][lemuroid] open;
  [Vita3K][vita3k], [Provenance][provenance], and [Delta][delta] walled; `openemu/openemu`, `uofw/uofw`,
  and `hrydgard/pspautotests` closed.
- PPSSPP's licence file is the PSPSDK's BSD notice and the bare GPL-2.0 text, so the README supplies the version:
  "Originally released under the GPL 2.0 (and later) in November 2012" ([PPSSPP README][ppsspp-readme]).
  The register's GPL-2.0-or-later rests on that README line.
- Vita3K stays walled: its licence file is the bare GPL-2.0 text,
  and its README says "Vita3K is licensed under the GPLv2 license.
  This is largely dictated by external dependencies, most notably Unicorn."
  ([Vita3K README][vita3k]); ScarletNX's credits calling it GPL-2.0-or-later do not outrank that.
- Earlier surveys' rules apply: a high-level operating system or module set is closed
  as system software in any repository, the rest keeping its tier; so is custom firmware; no licence means closed;
  a bare GPL-2.0 text, or a fork of a walled emulator, is walled.
  Prose names two such folders, which the register now closes: Vita3K's system modules,
  linked by the [Vita wiki page][egw-vita] and named in [ScarletNX's credits][scarlet-credits],
  and ScarletNX's own high-level runtime and libraries ([ScarletNX, Vita platform notes][scarlet-vita]).
  No prose read names PPSSPP's high-level kernel folder, so the written rule covers it
  (inference; a folder name is known only from memory).
- The guard blocked the releases and commits endpoints for Vita3K, its builds repository, JPCSP, and pspautotests, and,
  in the verification reads, the releases of KanaStation and ScePSP and the metadata of ReVita,
  whose lines are not yet merged (research log), so those release facts come from prose;
  Vita3K's latest release tag and date are not recorded.

### The emulators compared

The table compares [PPSSPP][ppsspp], [JPCSP][jpcsp], [KanaStation][kanastation], [ScePSP][scepsp], [kpspemu][kpspemu],
[M33][m33], [Vita3K][vita3k], [EmuCoreV][emucorev], [ReVita][revita], [vitaslop][vitaslop], [ScarletNX][scarlet],
[vios][vios], [Anubis][anubis], and the closed projects named below.
Key: "push" is the last push to the repository; "HLE" means the emulator provides the operating system itself;
"dump" means the user supplies firmware, which PPSSPP also accepts as an option; "interp." is an interpreter; Win, Mac,
Lin, And name hosts; "lr" is a libretro core.

| Emulator | System | Tier | Licence | Status | CPU | Firmware | Hosts |
|---|---|---|---|---|---|---|---|
| PPSSPP | PSP | open | GPL-2.0-or-later | v1.20.4, 2026-05-16 | interp., IR, JIT | HLE | Win, Mac, Lin, And, iOS, lr |
| JPCSP | PSP | open | GPL-3.0-or-later | v0.7, 2013-06-28 | Java dynarec | HLE, or dump | Win, Mac, Lin |
| KanaStation | PSP | open | GPL-3.0 | push 2026-11-03 | not stated | dump required | not stated |
| ScePSP | PSP | walled | GPL-2.0 | push 2026-03-03 | recompiler to C# IL | HLE | Win, Lin, Mac (core) |
| kpspemu | PSP | open | MIT | archived; push 2022-03-25 | interpreter | HLE | JVM, JS, native |
| cspspemu | PSP | closed | none | archived; push 2021-02-10 | recompiler | HLE | not stated |
| jspspemu | PSP | closed | none | archived; push 2021-03-27 | dynarec | HLE | web |
| M33 | PSP | open | GPL-2.0-or-later | push 2026-11-06 | PPSSPP's JIT | Sony's 6.61 | PS4 (jailbroken) |
| PSPE, Potemkin, PCSP | PSP | closed (lead) | see below | ended by 2007 | not stated | HLE (Potemkin) | Win |
| Vita3K | Vita | walled | GPL-2.0 | push 2026-11-25 | Dynarmic | HLE; Sony's download | Win, Mac, Lin, And, lr |
| EmuCoreV | Vita | walled | GPL-2.0-or-later | push 2026-11-25 | from Vita3K | user's firmware | And |
| ReVita | Vita | walled | GPL-2.0-or-later | push 2026-11-16 | from Vita3K | Sony's download | Xbox dev mode |
| vitaslop | Vita | open | MIT | push 2026-10-31 | ahead of time, to Wasm | none | web, desktop |
| ScarletNX | Vita | walled | GPL-3.0-or-later | push 2026-11-26 | ahead of time, JIT | HLE | not stated |
| vios | Vita | walled | GPL-2.0 | push 2022-03-01 | Unicorn | not stated | Lin, Mac |
| Anubis | Vita | open | MIT OR Apache-2.0 | push 2021-09-28 | own JIT crate | not stated | not stated |
| Adrenaline | PSP on Vita | closed | GPL-3.0 | push 2024-01-13 | Sony's emulator | Sony's 6.61 | Vita |
| Sony's emulators | PSP | closed | maker's | Vita, PS3, PS4, PS5 | not stated | maker's | Sony hardware |

Sources by row: each project's README, site, licence endpoint, and metadata, cited in its paragraph below.
GPL-2.0 means GPL-2.0 with neither "only" nor "or later" stated.
Closed repositories are named without links throughout.

### PPSSPP

- PPSSPP is active: pushed 2026-11-25, with 1.20.4 the latest release and 1.21 in development builds.
  Major releases are now yearly, "every spring, probably March or April"
  ([PPSSPP, "PPSSPP 1.19.1 and upcoming changes"][pp-upcoming]).
- It needs no firmware by default: "PPSSPP simulates the BIOS and the entire internal operating system,
  so PSP games run without any firmware files" ([PPSSPP FAQ][pp-faq]).
  The libretro documentation says it ships "replacement fonts" and accepts the user's original fonts
  ([libretro, "PPSSPP"][lr-ppsspp]).
- From 1.21, real firmware is optional and gives the system fonts, the XMB,
  PS1 games through the firmware's own PS1 emulator, and UMD Video.
  The FAQ says "almost every game disc carries a firmware update,
  and PPSSPP installs it automatically when you start a game", or the user installs an official PSP update file (same).
  With firmware, a few libraries run for real; "The kernel underneath is still simulated."
  ([PPSSPP, Known differences][pp-known]).
- The Media Engine's libraries are high-level by default;
  from 1.21 the MPEG and MP4 modules run as real ones where available, "falling back to HLE",
  and the ME CPU itself is emulated for PS1 games and optionally homebrew ([PPSSPP, Media Engine][pp-me]).
  That page tells users to dump the modules with a named firmware dumping tool, which was not followed.
- It has three CPU cores: an interpreter, an IR interpreter, and JITs for "x86 and ARM, 32-bit and 64-bit"
  ([PPSSPP FAQ][pp-faq]), and its development page adds RISC-V and LoongArch64 JITs ([PPSSPP, Introduction][pp-dev]).
  The FAQ is out of date: the older x86-64 and ARM64 JITs were removed in October 2026,
  and every native compiler is now a back end of the one intermediate representation
  ([R1-44, "Processor and memory"](../emulators/R1-44-ppsspp.md#processor-and-memory); corrected 2026-11-27).
  Compiled blocks are left for thread switches, for interrupts fired by timed events, and for callbacks,
  and its function replacement hashes scanned functions, an idea it credits to early Dolphin
  ([PPSSPP, "Scheduling"][pp-sched]).
- It renders through Vulkan, OpenGL, and D3D11, D3D9 having gone in 1.20, and in software ([README][ppsspp-readme]),
  and since then through Metal, the only back end of its iOS and tvOS apps
  ([R1-44, "Video"](../emulators/R1-44-ppsspp.md#video); corrected 2026-11-27);
  it adds texture upscaling and replacement, MSAA on Vulkan, rewind, save states, RetroAchievements,
  ad hoc and infrastructure play, and a debugger with GE and JIT viewers (same; FAQ).
- Its own documents list what it does not model: CPU caches, colour depth below 32 bits, and accurate reverb,
  and the operating system is simulated ([PPSSPP, Known differences][pp-known]).
  The XMB page adds that the PSP Go's firmware is not supported ([PPSSPP, VSH][pp-vsh]).
- Its AI policy requires contributors to disclose AI use (same),
  and its 2026 GE and VFPU results were AI-assisted by their posts' own account ("Tests and published results").
- On Vita emulation its FAQ answers "No", saying the Vita has "a completely different machine architecture,
  much more powerful than the PSP and with different security technologies" ([PPSSPP FAQ][pp-faq]).

### Other PSP emulators

- [JPCSP][jpcsp], in Java, began in 2008 and is still pushed
  (2026-09-24, 461 stars),
  but its last numbered release is v0.7 of 2013; its site serves builds from 2024-12-01 ([jpcsp.net][jpcsp-site]).
  Its README claims "more than 600 games", a dynarec, HLE modules, OpenGL and software renderers,
  and in the unreleased v1.0 a low-level mode that runs the official 6.61 update
  and the full boot process from flash images "decrypted on a real PSP" ([JPCSP README][jpcsp]).
  The same README lists "Automatic decryption of encrypted EBOOT.BIN and PGD files"
  and says "The only legal option is to own a PSP and use it to decrypt your own games' boot file." (same);
  so JPCSP holds or derives keys, and is a key hazard for any study of it (inference; path unknown).
- [KanaStation][kanastation] is "a low-level PlayStation Portable emulator aiming to emulate
  as much of the underlying hardware as possible"; it boots a PSP-1000 boot ROM, several official firmwares, the XMB,
  and some games, accepts only the TA-082 and TA-088 board types, and does not yet boot Slim firmware.
  It requires the boot ROM, the NAND, and the console's fuse identifier, on which "Per-console cryptography depends",
  and refuses AI-written contributions ([KanaStation README][kanastation]).
  Whether it embeds keys is not stated, and facts it takes from boot-ROM analysis are not recordable
  ([ADR 0006, "In every tier"][adr6-every]).
- [ScePSP][scepsp], an alpha C# emulator from 2025, recompiles to .NET intermediate code, needs no firmware,
  and lists 4K rendering and texture filters ([ScePSP README][scepsp]).
  Its feature table says "Kirk supports commercial game decoding", a key hazard (inference),
  and that its core compiles on Windows, Linux, and Mac; it credits pspplayer and the closed cspspemu (same).
- soywiz's three emulators, all archived, show one author's path:
  `soywiz-archive/cspspemu` in C# with a recompiler and `soywiz-archive/jspspemu` in TypeScript for the web,
  both with no licence detected and so closed, and [kpspemu][kpspemu] in Kotlin, MIT, interpreted.
- [M33][m33] is PPSSPP for a jailbroken PS4,
  whose README says it downloads firmware 6.61 "from Sony for you" for the real XMB and
  that "Nothing copyrighted is bundled"; its licence file is PPSSPP's, and its README says GPL-2.0 or later,
  "the same licence as PPSSPP", so it is open by PPSSPP's rule, with the same closed parts ([M33 README][m33]).
- `ioncodes/peespee`, an HLE PSP emulator in Rust from November 2026, has no licence and no README, so it is closed.
  A search of GitHub for PSP emulators in Rust found nothing else
  (research log), and [PSPReverse/PSPEmu][pspreverse] emulates AMD's Platform Secure Processor, not Sony's handheld.

### Historical PSP emulators

- PSPE 0.9b for Windows (2005-06-04) is "The first PSP emulator released" ([Zophar, "PSPE"][zophar-pspe]; lead).
- Potemkin, "an experimental HLE PSP Emulator ... released by ector under the GPL license", last released 2007-05-06
  ([Zophar, PSP][zophar-psp]; lead).
  The wiki says it came from Dolphin and in 2012 became the basis of PPSSPP, which inherited its HLE kernel design
  ([Emulation General, "PlayStation Portable emulators"][egw-psp]; lead);
  that "ector" is PPSSPP's author is from memory, which fits PPSSPP's credit to early Dolphin.
- PCSP, a C++ emulator that the wiki lists as proprietary, decrypted games itself by Zophar's account (lead);
  pspplayer by Ben Vanik is named by ScePSP and the wiki and was not opened.
  None of these is a source.

### Vita3K and its forks

- [Vita3K][vita3k] is active (pushed 2026-11-25, 6,006 stars) and ships rolling "continuous" builds;
  its README says it "runs most homebrew programs and commercial games".
  The FAQ reports "over 50% of tested games being marked as playable"
  ([Vita3K FAQ][v3k-faq]),
  up from about 3 percent three years before by its 2024 report
  ([Vita3K, 2024 report][v3k-2024]),
  while its compatibility page says the list no longer reflects the emulator ([Vita3K, compatibility][v3k-compat]).
- It emulates system modules at a high level, and loads the user's firmware modules where needed:
  "Some games require the system modules be present for Vita3K to (low level) emulate them"
  (Vita3K quickstart, `vita3k.org/quickstart`, read once in research; now closed, so not linked or checked again).
  Its 2021 report says high-level libc "failed miserably", so libc and other modules run from firmware code
  ([Vita3K, 2021 report][v3k-2021]).
- The CPU moved from Unicorn to Dynarmic, and the shader recompiler translates the GPU's programs to SPIR-V
  and GLSL (same).
  The 2024 report adds Vulkan, which brought macOS and Android, upscaling, texture replacement, FSR,
  AAC and ATRAC9 decoding, and memory-mapping modes ([Vita3K, 2024 report][v3k-2024]).
- Firmware comes from Sony's site, and the FAQ says the firmware option "will decrypt the modules only"
  ([Vita3K FAQ][v3k-faq]), so Vita3K decrypts Sony's firmware modules itself (inference; a key hazard, path unknown).
  It installs .pkg files, NoNpDrm and FAGDec dumps, and manually decrypted games,
  and its README links NoNpDrm and FAGDec as dumping tools ([Vita3K README][vita3k]); none was followed.
- It runs on Windows, macOS 13.3 and later, Linux, and Android 7 or later on AArch64 with Vulkan
  ([Vita3K FAQ][v3k-faq]).
  No iOS build or mention was found on its site or README, and it has no listing on Google Play, the App Store, Flathub,
  or F-Droid (searches and lookups, 2026-11-25).
- Its site and README say it is "not related to or endorsed by Sony,
  or derived from confidential materials belonging to Sony" ([vita3k.org][v3k-site]).
- [EmuCoreV][emucorev], a Vita3K fork for Android 10 and later, is the only Vita emulator found on Google Play,
  with "50K+" downloads ([Google Play][emucorev-play]); its install flows accept firmware, PKG packages, and zRIF, RIF,
  and work.bin licence files, and it says it ships none ([EmuCoreV README][emucorev]).
- [ReVita][revita] ports Vita3K to Xbox consoles in Developer Mode and downloads firmware from Sony's update server
  ([ReVita README][revita]).
- The libretro core is "A port of Vita3K, the experimental PlayStation Vita emulator, to libretro",
  built on upstream Vita3K and danprice142's earlier port, for Linux, Windows, and Android, with a PlayStation TV mode
  ([libretro, "Vita3K"][lr-vita3k]).
  It needs the user to download the update file and preinstalled package "from PlayStation's website",
  and a .pkg "needs its license next to it" (same).
  Its repository, [WizzardSK/vita3k-libretro][wiz], and [danprice142's fork][danprice] carry bare GPL-2.0 texts,
  so both are walled.

### Other Vita emulators

- [ScarletNX][scarlet], a static recompiler for several systems,
  runs Vita homebrew and decrypted dumps by ahead-of-time ARMv7 recompilation plus a JIT,
  answering system libraries by identifier ([ScarletNX, Vita platform notes][scarlet-vita]).
  Its credits list Vita3K code ported for the GPU library, shader translator, audio, decoders, and kernel signals,
  and code from Citra and yuzu forks ([ScarletNX credits][scarlet-credits]).
  So it adapts walled code and is walled, by the same rule as gopher64, although its README says GPL-3.0-or-later;
  its Vita runtime and system-library folders, which the platform notes name, are closed as system software.
  It installs the user's Switch and 3DS keys ([ScarletNX README][scarlet]).
- [vitaslop][vitaslop] runs in a browser on WebGPU, lifting ARM code ahead of time to WebAssembly and shaders to WGSL,
  with "no Sony firmware", and refuses encrypted executables ([vitaslop README][vitaslop]).
  It says it is "Developed clean-room, with no copyleft code" from vita-headers, Dynarmic, the Vita wikis,
  and Arm's manual, is "Yes, 100%" AI-written, and keeps "A pixel oracle" of regression frames that it does not publish;
  it lists 24 games tried (same).
  It answers the system's calls from vita-headers' identifiers,
  so its high-level system modules are closed as system software and the rest is open (precedent).
- vios, a C++ emulator on Unicorn, stalled in 2022 ([vios][vios]); Anubis, a Rust learning project, stopped in 2021
  ([Anubis README][anubis]).
  RPCS3 once held Vita code, removed in 2018 ([Emulation General, "PlayStation Vita emulators"][egw-vita]; lead).

### Sony's own emulators, and Adrenaline

- The Vita runs PSP games bought from the PlayStation Store or copied from a PS3,
  and Sony warns that "Some PSP™Game software titles are not compatible with your system."
  ([Sony, PS Vita User's Guide, PSP games page][sony-manual]).
  It offers bilinear filtering, right-stick and camera assignment,
  and on the PCH-1000 a colour-space option that makes the OLED screen look "more like
  that of a liquid crystal screen" (same).
  [R1-03][r103-cpu] records the Vita's MIPS side for this mode.
- Sony put a PSP emulator in four Japanese HD remasters on the PS3
  ([PPSSPP FAQ][pp-faq]),
  and PlayStation Plus Premium offers "beloved classic games" from the PSP generation, streamed in some markets
  ([PlayStation Blog, 29 March 2022][ps-blog]).
- Adrenaline "modifies the official PSP Emulator using taiHEN CFW framework to make it run a PSP 6.61 custom firmware",
  after downloading the 6.61 update (`theofficialflow/adrenaline`, README; not linked because it is closed).
  As custom firmware that patches Sony's system software it is closed, as is its maintained fork `isage/adrenaline`,
  whose README added support for Vita firmware 3.71 to 3.74 in v7.1.7.

### Frontends and stores

- PPSSPP's official builds cover Windows on x86 and ARM64, macOS, Linux
  (Flathub and AppImage, including LoongArch and RISC-V),
  Android, iOS, Xbox in developer mode, and VR headsets
  ([PPSSPP, Download][pp-download]; [PPSSPP, Porting][pp-porting]).
  Unofficial ports include a Switch build for homebrew-enabled consoles and a WebAssembly port
  ([PPSSPP, "Ports and legacy builds"][pp-legacy]).
- Its installs: "100M+" for the free Android app and "500K+" for Gold
  ([Google Play][pp-play]; [Gold][pp-gold-play]),
  2,848 US ratings on the App Store ([App Store lookup][pp-ios]),
  and 5,203,382 Flathub installs ([Flathub][pp-flathub]).
  Gold works the same as the free app and is sold on Android, Windows, macOS, and since 2025 inside the iOS app
  ([PPSSPP, Gold page][pp-whygold]).
- On iOS, the JIT is "disallowed in App Store apps"
  ([PPSSPP FAQ][pp-faq]),
  and PPSSPP says "the PSP does not require a JIT compiler to be emulated at full speed on modern iOS devices,
  although it would reduce battery consumption"
  ([PPSSPP, "PPSSPP for iOS"][pp-ios-doc]);
  its App Store launch credits its "efficient IR-based caching interpreter"
  ([PPSSPP, "PPSSPP is live on the App Store!"][pp-live]).
- RetroArch's PPSSPP core runs on Windows, macOS, Linux, Android, iOS, tvOS, and the Switch
  ([libretro buildbot][buildbot]), and is sold as Steam DLC ([Steam][steam-ppsspp]).
  It supports save states and achievements but not rewind or RetroArch netplay ([libretro, "PPSSPP"][lr-ppsspp]).
  On the App Store "JIT is not enabled", and libretro ships only cores whose upstream approved store distribution
  ([libretro, "RetroArch on iOS"][lr-ios]); the Vita3K core has no Apple build ([buildbot][buildbot]).
- PSP support elsewhere: [Lemuroid][lemuroid] on Android uses the PPSSPP core;
  OpenEmu on macOS added the PSP in its 2.0 line
  ([OpenEmu 2.4.1 notes][openemu-notes])
  through a plugin with no licence, `openemu/ppsspp-core`, which is closed; [Provenance][provenance] lists PPSSPP;
  and Delta supports no PlayStation system ([App Store lookup][delta-ios]).
- RetroArch itself runs on PSP and Vita hardware,
  as "an unauthorized homebrew port to this EOL (End-of-Life) game console" ([RetroArch, platforms][ra-platforms]).

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Encryption is the family's core exposure.
  A UMD's main executable is encrypted
  ([YAPSPD, 23.1.1.1][yapspd-23]),
  and KIRK, a crypto block in the main chip, performs AES with a key vault, signature checks with Sony's public key,
  SHA-1, and CMAC ([Copetti, "PlayStation Portable (PSP) Architecture"][copetti-psp]; lead).
  Vita retail content is encrypted ([R1-03, "Discs and what arrives as a plain image"][r103-discs]).
- PPSSPP decrypts in its own code: its XMB page says "Our KIRK emulation was missing one encryption type,
  so this had to be added" ([PPSSPP, VSH][pp-vsh]), and it plays users' own ISO images,
  whose executables are encrypted (inference).
  Copetti's bibliography cites PPSSPP's KIRK engine file beside a wiki page titled "Keys"
  and a paste titled "UMD keys decrypted", none of which was opened; the [register][register] now closes all three.
  That puts PPSSPP under the second variant of [R0-02's option 3][r002-o3], an embedded key, like Dolphin (inference).
- The same page says that "For the registry (sceReg) I used a hardcoded dump from one of my own PSPs." (same),
  so PPSSPP carries some data taken from a console (inference from the author's words).
- Vita3K takes the other routes: it decrypts .pkg and NoNpDrm content with a licence file the user supplies,
  which is [R0-02's option 2][r002-o2] in substance, and accepts FAGDec or manually decrypted dumps,
  option 3's first variant (inference from the quickstart and FAQ).
  Its quickstart holds a step-by-step dumping guide and a procedure to make a fake licence file;
  research opened it once as the register's cited page, recorded no key, and the register now closes it.
- Firmware licences bar exactly these routes.
  Sony's PSP licence grants use "solely on your PSP™ system" and bars "use of tools to bypass, disable,
  or circumvent any encryption, security, or authentication mechanism" ([Sony, PSP system software licence][psp-eula]).
  The Vita licence grants use "solely on your PS VITA SYSTEM",
  bars obtaining the software "in any manner other than through SIE's authorized distribution methods"
  ([Sony, Vita licence][vita-eula]), and covers the PlayStation TV by its title.
  So the maker's download that Vita3K, its core, ReVita, and M33 rely on
  ([R0-02 option 6][r002-o6])
  conflicts with the licence's single-console grant, as R0-02 found for Sony
  (inference; [R0-02, "Makers' system software and licence terms"][r002-terms]).
- Sony still serves the Vita's system software 3.74, of 2022-05-10, from its support page
  (`playstation.com/en-us/support/hardware/psvita/system-software/`, not linked because it offers the download).
  The register now closes that page.
  Its US PSP system software page returned HTTP 404
  (research log),
  so option 6 for the PSP rests on game-disc updates; other regional pages were not opened,
  because a page that offers firmware is closed.
- Firmware handling splits as in [R0-02, "How projects handle firmware and games"][r002-how]:
  high-level replacement by default (PPSSPP, ScePSP, vitaslop); the user's dump
  (KanaStation, JPCSP's low-level mode, PPSSPP's optional modules); and the maker's download (Vita3K, M33, ReVita).
- Dumping guidance touches [R0-02 option 7][r002-o7]:
  PPSSPP's site links its own game dumping guide and names a firmware dumping tool, psardumper, with no address;
  Vita3K's README, FAQ, and quickstart link NoNpDrm, FAGDec, VitaShell, and GcToolKit;
  JPCSP and KanaStation name console tools without addresses.
  The PPSSPP guide and every linked tool are closed in the register, unopened.
- Enforcement found is by stores, not Sony; R0-02's takedown table has no PSP or Vita row
  ([R0-02, "Takedown and enforcement history"][r002-take]),
  and its look through GitHub's notices for PPSSPP found none ([R0-02, "Who has been reached"][r002-who]).

| Date | Actor | Action | Outcome |
|---|---|---|---|
| 2018-02-01 | Google | suspended PPSSPP, not Gold, "for unclear reasons" | reinstated on appeal, 2018-02-06 |
| 2024-05-30 | Apple | removed PPSSPP over homebrew in its store, under 5.2.2 | back 2024-06-04 |
| 2024-11-04 | Apple | refused Gold under 4.1 ("PSP" in the name), 4.3(a), and 5.2.2 | Gold app retired 2025-06-06 |

- Sources for the table: PPSSPP's posts on the [2018 suspension][pp-gone-2018] and [return][pp-back-2018],
  the [2024 removal][pp-down], [Apple's notice][pp-1172] and [the return][pp-back], the [Gold review][pp-stuck],
  and the [Gold app's retirement][pp-ios-changes].
  Apple's first complaint said "some games in the built-in Homebrew Store were violating someone's copyright somehow,
  no details" ([PPSSPP, 2024-06-01][pp-down]),
  and its Gold rejection said "the app can open video games files without the appropriate authorisation from the right
  holder" ([PPSSPP, 2024-11-26][pp-stuck]).
  The near-identical free app, also with "PSP" in its name, passed review minutes later (same).
- A scan of the file names in GitHub's [DMCA archive][dmca]
  (22,749 entries, 2026-11-25)
  for "sony" found 21 notices, and a reading of them found subjects of PS3 keys, DualShock 4 firmware, PS4 kit code,
  PS4 games and an exploit, and, on 2023-11-29, a game's keys:
  "The information uploaded to the repository is Bloodborne's access keys."
  None names the PSP, the Vita, or PPSSPP (research log).
- No lawsuit against a PSP or Vita emulator was found in the sources read;
  Sony answered PSP homebrew with firmware updates, from 1.51 in May 2005
  ([Wikipedia, "PlayStation Portable homebrew"][w-psphb]; tertiary).
- Patents and names: PPSSPP's FAQ says the XMB "is patented by Sony so the idea is iffy"
  ([PPSSPP FAQ][pp-faq]), which bears on [R0-02 options 11 to 13][r002-o11].
  Apple applied 4.1 to "PSP" in an app name while apps titled "PSP" stay listed
  (inference from the store search),
  PPSSPP's listing says "PSP is a trademark of Sony"
  ([App Store lookup][pp-ios]), and RetroArch calls its ports "unauthorized" ([R0-02 option 14][r002-o14]).
  Paid Gold and Vita3K's supporter tiers bear on [option 8][r002-o8].
- No logo comparison or lock-out chip was found for either system; the gate is signed and encrypted code
  (YAPSPD; Copetti, lead), so [option 16][r002-o16] hardly arises for a high-level emulator (inference).
- Of R0-02's options, 2 and 3 (encryption), 4 to 7 (firmware and guides), 8 (money), 11 to 14
  (the XMB patent and names), and 9 (store distribution) apply to this family; option 1 does not (inference).

### How hard the family is to emulate

- The PSP is well measured.
  PPSSPP's timing page, "measured on a real PSP", gives the in-order CPU's costs:
  one instruction per cycle of the CPU clock, extra cycles for taken branches and load use,
  5 to 7 for dependent FPU and VFPU operations, about 55 to 70 for a cache miss to RAM,
  and about 2,900 for a thread switch ([PPSSPP, "CPU timing"][pp-timing]).
  Its model predicted 315,392 cycles for a CRC32 over 4 KiB that measured 315,370 (same).
  The measurements come from kernel-mode test programs over PSPLink, reading the CPU's performance counters
  ([PPSSPP, "How it was measured"][pp-measuring]),
  and the effect of the Media Engine on the CPU is not yet covered ([PPSSPP, "CPU timing"][pp-timing]).
- The CPU runs usually at 222 or 333 MHz, has no MMU, and its VFPU shares the CPU's instruction fetch;
  "the GPU cannot read out of the CPU cache", and the Media Engine "cannot (officially) be programmed directly"
  ([PPSSPP, Allegrex overview][pp-overview]).
  [R1-03][r103-mem] gives the caches and memory.
- The GE is fixed-function with up to four lights and no shaders; its stencil shares the colour's alpha bits,
  some blend modes are hard to reproduce on a host GPU, and its guard band matters because "some games rely on that,
  so it must be emulated" ([PPSSPP, "The GE (Graphics Engine)"][pp-ge]).
  Its floats are 24 bits, and "the GE computes at that precision internally too" (same).
- Bit-exact results are possible on the PSP and not on a host GPU.
  The software renderer matches a PSP on most frame dumps, and the hardware back ends "never match exactly"
  (`hrydgard/ppsspp-framedumps`, README; not linked because it is closed).
  From 1.21 the VFPU's special functions and dot products are bit-exact on every CPU back end
  ([PPSSPP, Known differences][pp-known]),
  and [vfpu-docs][vfpu-docs] backs each instruction statement with a test on a PSP ([R1-03][r103-cpu]).
- The PSP's hard parts are the operating system and the Media Engine.
  PPSSPP's Media Engine "involves a lot of guesswork" with FFmpeg
  ([PPSSPP, Known differences][pp-known]),
  and the one project found that reimplements the PSP's firmware itself, `uofw/uofw`,
  aims at the basic kernel and is closed ([R0-05][r005]).
  KanaStation's low-level route needs the boot ROM and per-console cryptography (above).
- The Vita is harder.
  It has four Cortex-A9 cores, "Cortex-A9 r2p10" by its ID register
  ([Vita Development Wiki, "Main Processor"][henkaku-cpu], capture),
  and an SGX543MP4+ GPU with its own MMU and one address space per application
  ([Vita Development Wiki, "GPU"][henkaku-gpu], capture).
  Its system software is a proprietary operating system with FreeBSD and NetBSD parts
  ([Wikipedia, "PlayStation Vita system software"][w-vita-sys]; tertiary).
- Vita3K's own history shows the cost: high-level libc failed and it fell back to the user's firmware modules
  ([Vita3K, 2021 report][v3k-2021]),
  so a clean-room Vita needs every library it calls rewritten from public descriptions (inference).
- Hosts: PPSSPP needs no JIT on modern iOS devices for the PSP;
  Vita3K asks for Vulkan 1.0 or OpenGL 4.4 and a 64-bit x86 or ARM CPU
  ([Vita3K FAQ][v3k-faq]),
  uses shader interlock where the GPU has it
  ([Vita3K, 2024 report][v3k-2024]),
  and has no iOS build, so a Vita on an iPhone without JIT is untested by any project found (inference).

### Tests and published results

| Suite | Tier | Oracle | Covers | Published emulator results |
|---|---|---|---|---|
| pspautotests | closed | a real PSP, "preferably" | system calls and APIs, image tests | PPSSPP, 536 of 643 listed |
| PPSSPP frame dumps | closed | a real PSP replaying each dump | GE rendering | PPSSPP software, 125 of 132 |
| PPSSPP hardware pages | open | a PSP over PSPLink | CPU timing, GE arithmetic | PPSSPP, their basis |
| vfpu-docs | open | a PSP, a test per statement | VFPU instructions | none found |
| Vita3K compatibility | open | players' reports | Vita games, homebrew | Vita3K, "over 50%" |

- `hrydgard/pspautotests` keeps expected output "preferably from a real PSP" and needs a PSP with custom firmware
  and PSPLink (its README; not linked because the repository is closed);
  PPSSPP's test script compares its own output with it ([PPSSPP, Introduction][pp-dev]).
  The script lists 536 tests that pass and 107 that do not yet, and CI runs the passing list
  ([R1-44, "Tests and published results"](../emulators/R1-44-ppsspp.md#tests-and-published-results);
  corrected 2026-11-27).
  Its results are usable.
- The GE result is the family's one published hardware comparison: about 170 experiments on a PSP,
  after which "the software renderer reproduces 125 of a set of 132 frame dumps from various games,
  bit-exact pixel by pixel against the same dumps played back on a real PSP" ([PPSSPP, GE news post][pp-ge-news]).
  Its frame-dump repository, about 1.2 GB of captured game data, has no licence and is not to be cloned.
- The VFPU result: tables dumped from a real PSP had made eight functions bit-exact,
  and AI-derived formulas now reproduce them "bit-exact over every one of the 2^32 float inputs" from about 10 KB of
  coefficients ([PPSSPP, "Cracking VFPU math functions using AI"][pp-vfpu-news]).
  The GE arithmetic page says each result "was measured on a PSP with small hand-built display lists"
  ([PPSSPP, "GE arithmetic"][pp-ge-arith]).
- PPSSPP's compatibility reports are unmoderated user reports
  ([Emulation General, "PlayStation Portable emulators"][egw-psp]; lead).
- No Vita hardware test suite was found:
  GitHub searches for "psvita tests" and "vita hardware tests emulator" found only homebrew test apps,
  none a hardware suite, and [R0-05][r005] lists none. vitaslop's pixel oracle is internal,
  and Vita3K's compatibility data is kept in issues, which were not read.

## Options and trade-offs

The options answer four separate questions, and the recommendation takes one answer to each.

### Which emulators the family's studies cover

- **What:** keep [R1-44](../emulators/R1-44-ppsspp.md), [PPSSPP][ppsspp], alone; add a [Vita3K][vita3k] study;
  or add [JPCSP][jpcsp] for its low-level route.
- **Costs:** a PPSSPP study must leave out its high-level operating system and KIRK engine, which are closed;
  Vita3K is walled, so its code needs a reader session, and much of what makes it work is closed system software;
  JPCSP adds a key hazard and a stale codebase.
- **Gains:** PPSSPP is the most used, publishes hardware-backed documents, and is open for everything else;
  a Vita3K study would cover the one Vita emulator of weight.
- **Used by:** the [roadmap][studies], which lists R1-44 only.

### Which oracles a PSP core is tested against

- **What:** PPSSPP's published hardware measurements and [vfpu-docs][vfpu-docs]; pspautotests' expected output;
  the frame dumps' PSP references; Rustalgia's own measurements on a PSP; or another emulator's output.
- **Costs:** pspautotests and the frame dumps are closed, and the dumps hold game data;
  own measurements need a PSP running PSPLink, which needs custom firmware
  (pspautotests README),
  conduct that the PSP licence bars (inference from [the licence][psp-eula]);
  another emulator only reproduces an emulator.
- **Gains:** the hardware pages and vfpu-docs are open and state their method;
  the hardware pages reached bit-exact agreement, and vfpu-docs ties each statement to a PSP test;
  pspautotests covers the operating system's calls.
- **Used by:** PPSSPP (all but another emulator's output); [vitaslop][vitaslop] (its own frames).

### How encrypted content and firmware are handled

- **What:** accept only decrypted input and supply a high-level operating system written from clean sources;
  embed KIRK emulation and keys, as PPSSPP and JPCSP do; decrypt with the user's licence files, as Vita3K does;
  or require the user's firmware or boot ROM, as [KanaStation][kanastation] does.
- **Costs:** decrypted input means users decrypt executables with separate tools,
  and no clean description of the PSP's or Vita's system libraries exists in full;
  embedded keys and licence-file decryption are the conduct that [R0-02's options 2 and 3][r002-o2] record against;
  firmware routes conflict with Sony's licences.
- **Gains:** decrypted input keeps decryption and keys out of the project
  ([R0-02, "Recommendation"][r002-rec]); the other routes run more games unaided.
- **Used by:** see "Legal exposure"; [R2-12][phase2] weighs firmware across systems.

### What accuracy target the PSP's GE takes

- **What:** a bit-exact software renderer as the reference with a host-GPU renderer for speed;
  or a host-GPU renderer only.
- **Costs:** software rendering is slower and costs battery on phones (inference); a host GPU "never" matches exactly,
  by PPSSPP's frame dumps.
- **Gains:** the software path can be checked frame by frame against a PSP; the host path is fast.
- **Used by:** PPSSPP, which keeps both.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** keep R1-44 and scope it to PPSSPP's prose,
  its open code outside the high-level operating system and the KIRK folder, and its hardware pages;
  add no Vita study until R6-01 takes the Vita up.
  Vita3K's working parts are either walled or closed, so a study would teach less than its cost.
- **Oracles:** adopt PPSSPP's hardware pages and vfpu-docs as the first oracles,
  use pspautotests' and the frame dumps' published results as reference only,
  and add no PSP measurement spike unless the owner accepts the custom-firmware conduct it needs.
- **Content and firmware:** decrypted input only, with no keys, no KIRK decryption, no licence-file support,
  and no dumping links, as [R0-02][r002-rec] recommends for encrypted systems
  and [R1-03's option 11][r103-o11] describes; and a high-level operating system
  ([R0-02 option 5][r002-o5]; [R1-03, "Recommendation"][r103-rec])
  written from open descriptions: [YAPSPD][yapspd-23], PPSSPP's prose documents, and the PSPSDK
  and vitasdk headers ([R0-05][r005-ps]).
  None of these covers the system libraries in full, so [R2-12][phase2] takes up that gap.
- **GE accuracy:** a bit-exact software renderer as the reference and a host-GPU renderer for speed,
  because only the first has been shown to match a PSP; this feeds [R2-05][phase2].

## Implications for Rustalgia

- [R6-01][phase6] can weigh the PSP as well documented but encrypted, and the Vita as encrypted,
  undocumented by any test suite, and dependent on firmware in its one emulator of weight.
- [R2-12][phase2] inherits the family's scale problem:
  a high-level PSP or Vita needs its system libraries rewritten from public descriptions,
  because every existing one is closed.
- [R3-01][phase3] and [R5-07][phase5] can take [PPSSPP][ppsspp]'s claim
  that the PSP runs at full speed on iOS without a JIT as a target to check; no project shows the same for the Vita.
- [R3-03][phase3] should record Apple's 2024 removal and its 4.1 and 5.2.2 refusals of Gold,
  and [R3-06][phase3] Google's 2018 suspension; these are the only enforcement found against this family.
- [R2-15][phase2] can adopt the PPSSPP method, hardware probes and frame dumps replayed on a console,
  as one model of a published oracle.

## Open questions

- Does [PPSSPP][ppsspp] hold key tables outside its KIRK folder, as memory suggests for its module decrypter?
  [R1-44](../emulators/R1-44-ppsspp.md), which reads its open code, would find the path for the register to close.
- How does a Vita behave where no emulator documents it?
  A test suite would need homebrew on a console, which the Vita licence bars (inference); [R6-01][phase6] decides.

## Sources

Every source below was read on 2026-11-25, as raw text, unless an entry says otherwise.
Closed addresses, firmware downloads, and key pages are in code spans, with the reason.

Repository documents:

- [ADR 0006][adr6]; [research guide][guide]; [research roadmap][roadmap]; [source register][register].
- [R0-02, legal baseline][r002]; [R0-05, source map][r005]; [R1-03, primer][r103-cpu]; [R1-07, catalogue][r107-hand].

PPSSPP, prose only:

- [PPSSPP README][ppsspp-readme] and licence file, at commit `38d92884ab73c8081adefd64b4ffc334c93df80e`.
- PPSSPP site: ["FAQ - Frequently Asked Questions"][pp-faq]; ["Known differences from the real PSP"][pp-known];
  ["The PSP Media Engine and its implementation"][pp-me]; ["Scheduling"][pp-sched];
  ["VSH, also know as the XMB"][pp-vsh]; ["Introduction"][pp-dev] (development); ["CPU timing"][pp-timing];
  ["How it was measured"][pp-measuring]; ["Overview"][pp-overview] (Allegrex); ["The GE (Graphics Engine)"][pp-ge];
  ["GE arithmetic"][pp-ge-arith]; ["Download PPSSPP"][pp-download]; ["Ports and legacy builds"][pp-legacy];
  ["Porting PPSSPP"][pp-porting]; ["PPSSPP for iOS"][pp-ios-doc]; ["PPSSPP Gold – the what and why"][pp-whygold].
- PPSSPP news: ["PPSSPP 1.19.1 and upcoming changes"][pp-upcoming] (2025-06-09);
  ["Cracking the PSP GPU's transform and raster"][pp-ge-news] (2026-10-02);
  ["Cracking VFPU math functions using AI"][pp-vfpu-news] (2026-09-24); ["PPSSPP is live on the App Store!"][pp-live]
  (2024-05-15); ["PPSSPP temporarily down from App Store, back soon hopefully"][pp-down] (2024-06-01);
  ["PPSSPP for iOS 1.17.2, iOS review still stalled"][pp-1172] (2024-06-03); ["PPSSPP for iOS is back!"][pp-back]
  (2024-06-04); ["Talking to an App Store Review brick wall"][pp-stuck] (2024-11-26);
  ["1.19 live on iOS, plus Gold changes"][pp-ios-changes] (2025-06-06);
  ["PPSSPP temporarily gone from Play Store"][pp-gone-2018] (2018-02-01);
  ["PPSSPP back in the Play Store!"][pp-back-2018] (2018-02-06).
- `hrydgard/ppsspp-framedumps` and `hrydgard/pspautotests`, READMEs only, not linked because they are closed.
- Not opened, closed in the register: PPSSPP's game dumping guide, `ppsspp.org/docs/getting-started/dumping-games/`;
  its custom-firmware page, `ppsspp.org/docs/reference/psp-custom-firmware/`; and its KIRK folder,
  `hrydgard/ppsspp/blob/a1964ca1a108b1340e54ae30262f317c9dd6999b/ext/libkirk/kirk_engine.c`, a key hazard.

Other emulators, prose and metadata only:

- READMEs and licence files are pinned by the last push that the comparison table gives for each repository.
- [JPCSP README][jpcsp] (push 2026-09-24); [jpcsp.net][jpcsp-site]; [KanaStation README][kanastation];
  [ScePSP README][scepsp]; [kpspemu][kpspemu]; [M33][m33]; [PSPReverse/PSPEmu][pspreverse].
- `soywiz-archive/cspspemu`, `soywiz-archive/jspspemu`, and `ioncodes/peespee`, metadata and READMEs only,
  not linked because they are closed.
- [Vita3K README][vita3k]; [vita3k.org][v3k-site]; [Vita3K FAQ][v3k-faq]; [compatibility][v3k-compat];
  [2021 report][v3k-2021] (2021-07-31); [2024 report][v3k-2024] (2024-07-31).
  The quickstart, `vita3k.org/quickstart`, was read once and is now closed,
  because it holds a game dumping and licence-file guide.
- [EmuCoreV][emucorev]; [ReVita][revita]; [WizzardSK/vita3k-libretro][wiz]; [danprice142/Vita3K-libretro][danprice];
  [ScarletNX README][scarlet], [credits][scarlet-credits], and [Vita notes][scarlet-vita], at `main`
  (push 2026-11-26); [vitaslop][vitaslop]; [vios][vios]; [Anubis][anubis].
- `theofficialflow/adrenaline` and `isage/adrenaline`, READMEs only, not linked because they are closed.
- Not opened, closed in the register: `theofficialflow/nonpdrm`, `celesteblue-dev/psvita-re-tools` (FAGDec),
  and `oestriot/gctoolkit`, the dumping tools Vita3K links.

Frontends and stores:

- libretro documentation: ["PPSSPP"][lr-ppsspp], ["Vita3K"][lr-vita3k], and ["RetroArch on iOS"][lr-ios],
  each dated 2026-10-22; [libretro buildbot][buildbot], nightly listings.
- [RetroArch, platforms][ra-platforms]; [Lemuroid][lemuroid]; [Provenance][provenance];
  [OpenEmu 2.4.1 release notes][openemu-notes]; `openemu/ppsspp-core`, metadata only, not linked because it is closed.
- Stores: Google Play, [PPSSPP][pp-play], [PPSSPP Gold][pp-gold-play], and [EmuCoreV][emucorev-play];
  App Store lookups for [PPSSPP][pp-ios] and [Delta][delta-ios]; [Flathub][pp-flathub]; [Steam][steam-ppsspp].

Sony and law:

- [Sony, PS Vita User's Guide, "Playing a game for the PSP™ (PlayStation®Portable) system on your system"][sony-manual].
- [Sony, PSP system software licence][psp-eula], version 1.1; [Sony, Vita system software licence][vita-eula],
  version 1.5.
- Sony's Vita system software page, `playstation.com/en-us/support/hardware/psvita/system-software/`,
  not linked because it offers the firmware download; closed in the register.
- [PlayStation Blog, "All-new PlayStation Plus"][ps-blog] (2022-03-29).
- [GitHub DMCA archive][dmca], tree listing at `master` (push 2026-11-25 22:38 UTC).

References and leads:

- [YAPSPD, chapter 23][yapspd-23].
- [Copetti, "PlayStation Portable (PSP) Architecture"][copetti-psp], last modified 22 November 2026, a lead.
  Its bibliography's key pages are not linked and were not opened:
  `playstationdev.wiki/pspdevwiki/index.php?title=Keys&oldid=11336`
  and `web.archive.org/web/20141201091221/http://pastie.org/1467912`.
- Vita Development Wiki, in captures because the live wiki refuses scripts
  (a process call):
  ["Main Processor"][henkaku-cpu] (revision 21601, last edited 27 July 2025) and ["GPU"][henkaku-gpu]
  (revision 21670, last edited 25 February 2026).
- [vfpu-docs][vfpu-docs].
- Wikipedia, tertiary: ["PlayStation Portable homebrew"][w-psphb]
  (revision 1374181142); ["PlayStation Vita system software"][w-vita-sys] (revision 1386315935).
- Emulation General wiki, leads: ["PlayStation Portable emulators"][egw-psp]
  (revision 152530) and ["PlayStation Vita emulators"][egw-vita] (revision 152251); neither mentions a leak.
- Zophar, leads: ["PSPE"][zophar-pspe] and [the PSP emulator list][zophar-psp].

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[adr6-every]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#in-every-tier
[anubis]: https://github.com/anubis-rs/Anubis
[buildbot]: https://buildbot.libretro.com/nightly/
[copetti-psp]: https://www.copetti.org/writings/consoles/playstation-portable/
[danprice]: https://github.com/danprice142/Vita3K-libretro
[delta-ios]: https://itunes.apple.com/lookup?id=1048524688
[dmca]: https://github.com/github/dmca
[egw-psp]: https://emulation.gametechwiki.com/index.php?oldid=152530
[egw-vita]: https://emulation.gametechwiki.com/index.php?oldid=152251
[emucorev]: https://github.com/sashkinbro/EmuCoreV
[emucorev-play]: https://play.google.com/store/apps/details?id=com.sbro.emucorev
[guide]: ../README.md
[henkaku-cpu]: https://web.archive.org/web/20261022163224/https://wiki.henkaku.xyz/vita/Main_Processor
[henkaku-gpu]: https://web.archive.org/web/20261022205536/https://wiki.henkaku.xyz/vita/GPU
[jpcsp]: https://github.com/jpcsp/jpcsp
[jpcsp-site]: https://jpcsp.net/
[kanastation]: https://github.com/noumidev/KanaStation
[kpspemu]: https://github.com/soywiz-archive/kpspemu
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[lr-ios]: https://docs.libretro.com/guides/install-ios/
[lr-ppsspp]: https://docs.libretro.com/library/ppsspp/
[lr-vita3k]: https://docs.libretro.com/library/vita3k/
[m33]: https://github.com/iHaiDeeZ/M33
[openemu-notes]: https://openemu.org/rnotes/2.4.1.html
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[pp-1172]: https://www.ppsspp.org/news/ppsspp-ios-1.17.2/
[pp-back]: https://www.ppsspp.org/news/ppsspp-ios-is-back/
[pp-back-2018]: https://www.ppsspp.org/news/back-in-play-store-2018/
[pp-dev]: https://www.ppsspp.org/docs/development/getting-started/
[pp-down]: https://www.ppsspp.org/news/temporarily-down-ios/
[pp-download]: https://www.ppsspp.org/download/
[pp-faq]: https://www.ppsspp.org/docs/faq/
[pp-flathub]: https://flathub.org/apps/org.ppsspp.PPSSPP
[pp-ge]: https://www.ppsspp.org/docs/psp-hardware/gpu/ge-overview/
[pp-ge-arith]: https://www.ppsspp.org/docs/psp-hardware/gpu/arithmetic/
[pp-ge-news]: https://www.ppsspp.org/news/ge-bit-exact/
[pp-gold-play]: https://play.google.com/store/apps/details?id=org.ppsspp.ppssppgold
[pp-gone-2018]: https://www.ppsspp.org/news/gone-from-play-store-2018/
[pp-ios]: https://itunes.apple.com/lookup?id=6496972903
[pp-ios-changes]: https://www.ppsspp.org/news/ios-changes/
[pp-ios-doc]: https://www.ppsspp.org/docs/reference/ios-support/
[pp-known]: https://www.ppsspp.org/docs/development/known-differences/
[pp-legacy]: https://www.ppsspp.org/legacybuilds/
[pp-live]: https://www.ppsspp.org/news/live-on-app-store/
[pp-me]: https://www.ppsspp.org/docs/development/ppsspp-internals/media-engine/
[pp-measuring]: https://www.ppsspp.org/docs/psp-hardware/cpu/measuring/
[pp-overview]: https://www.ppsspp.org/docs/psp-hardware/cpu/allegrex-overview/
[pp-play]: https://play.google.com/store/apps/details?id=org.ppsspp.ppsspp
[pp-porting]: https://www.ppsspp.org/docs/development/porting/
[pp-sched]: https://www.ppsspp.org/docs/development/ppsspp-internals/scheduling/
[pp-stuck]: https://www.ppsspp.org/news/stuck-in-app-store-review/
[pp-timing]: https://www.ppsspp.org/docs/psp-hardware/cpu/timing/
[pp-upcoming]: https://www.ppsspp.org/news/upcoming-changes/
[pp-vfpu-news]: https://www.ppsspp.org/news/vfpu-math-re/
[pp-vsh]: https://www.ppsspp.org/docs/development/ppsspp-internals/vsh/
[pp-whygold]: https://www.ppsspp.org/docs/reference/whygold/
[ppsspp]: https://github.com/hrydgard/ppsspp
[ppsspp-readme]: https://github.com/hrydgard/ppsspp/blob/38d92884ab73c8081adefd64b4ffc334c93df80e/README.md
[provenance]: https://github.com/Provenance-Emu/Provenance
[ps-blog]: https://blog.playstation.com/2022/03/29/all-new-playstation-plus-launches-in-june-with-700-games-and-more-value-than-ever/
[psp-eula]: https://doc.dl.playstation.net/doc/psp-eula/psp_eula_en.html
[pspreverse]: https://github.com/PSPReverse/PSPEmu
[r002]: R0-02-legal-baseline.md
[r002-how]: R0-02-legal-baseline.md#how-projects-handle-firmware-and-games
[r002-o11]: R0-02-legal-baseline.md#11-do-not-read-patents
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r002-o2]: R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys
[r002-o3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r002-o6]: R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-rec]: R0-02-legal-baseline.md#recommendation
[r002-terms]: R0-02-legal-baseline.md#makers-system-software-and-licence-terms
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r005]: R0-05-source-map.md
[r103-cpu]: R1-03-primer-sixth-generation.md#psp-and-vita
[r103-discs]: R1-03-primer-sixth-generation.md#discs-and-what-arrives-as-a-plain-image
[r103-mem]: R1-03-primer-sixth-generation.md#psp-and-vita-1
[r103-o11]: R1-03-primer-sixth-generation.md#11-plain-images-only-or-content-that-the-user-decrypts
[r107-hand]: R1-07-catalogue-sixth-generation.md#handhelds
[r107-pstv]: R1-07-catalogue-sixth-generation.md#treating-combined-units-and-the-playstation-tv
[ra-platforms]: https://www.retroarch.com/platforms.html
[register]: ../../../.claude/hooks/source-register.txt
[revita]: https://github.com/oledz-i/ReVita
[roadmap]: ../../roadmap/research.md
[scarlet]: https://github.com/ScarletNX/ScarletNX
[scarlet-credits]: https://github.com/ScarletNX/ScarletNX/blob/main/docs/CREDITS.md
[scarlet-vita]: https://github.com/ScarletNX/ScarletNX/blob/main/docs/platforms/vita/README.md
[scepsp]: https://github.com/unknowall/ScePSP
[sony-manual]: https://manuals.playstation.net/document/en/psvita/game/game_psp.html
[steam-ppsspp]: https://store.steampowered.com/app/1234350/
[studies]: ../../roadmap/research.md#emulator-studies
[v3k-2021]: https://vita3k.org/blog/2021-07-31-3-years-Progress-Report
[v3k-2024]: https://vita3k.org/blog/2024-07-31-3-years-Progress-Report
[v3k-compat]: https://vita3k.org/compatibility.html
[v3k-faq]: https://vita3k.org/faq.html
[v3k-site]: https://vita3k.org/
[vfpu-docs]: https://github.com/pspdev/vfpu-docs
[vios]: https://github.com/JagerDesu/vios
[vita-eula]: https://doc.dl.playstation.net/doc/psvita-eula/psvita_eula_en.html
[vita3k]: https://github.com/Vita3K/Vita3K
[vitaslop]: https://github.com/cretz/vitaslop
[w-psphb]: https://en.wikipedia.org/w/index.php?oldid=1374181142
[w-vita-sys]: https://en.wikipedia.org/w/index.php?oldid=1386315935
[wiz]: https://github.com/WizzardSK/vita3k-libretro
[yapspd-23]: https://hitmen.c02.at/files/yapspd/psp_doc/chap23.html
[zophar-psp]: https://www.zophar.net/psp.html
[zophar-pspe]: https://www.zophar.net/psp/pspe.html
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-take]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r005-ps]: R0-05-source-map.md#playstation-family
[r103-rec]: R1-03-primer-sixth-generation.md#recommendation
[retroarch]: https://github.com/libretro/RetroArch
[delta]: https://github.com/rileytestut/Delta
