---
title: "Nintendo 3DS: family survey"
roadmap_item: R1-13
status: draft
date: 2026-11-25
---

# Nintendo 3DS: family survey

## Summary

This note asks which emulators matter for the Nintendo 3DS family, what each one is and does,
how exposed the family is in law, and how hard it is to emulate.

[Azahar][azahar], the open-tier merger of two Citra forks,
is the family's leading active emulator by every popularity sign found,
and the only one found with a store listing of its own on Google Play.
[Citra][citra-end], from which most 3DS emulators descend,
ended on 4 March 2024 with the [yuzu settlement][yuzu-judgment].
[Panda3DS][panda3ds] and [Tanuki3DS][tanuki] are independent open-tier emulators of the same high-level kind;
[3Beans][3beans] and [Corgi3DS][corgi] are open-tier low-level emulators that need the user's boot ROMs;
[Mikage][mikage-faq] is now published, but with no licence, so it is closed.
No published test results compare any of them.

Legal exposure is high for a console emulator (inference): every 3DS title is encrypted,
and the one [Nintendo notice on GitHub][freeshop] about the 3DS pleads decryption of eShop files
and copyright in the logo data.
Azahar is not the decrypted-input-only project that [R0-02](R0-02-legal-baseline.md#keys) records:
it accepts decrypted dumps only, but ships built-in keys and decrypts content it downloads from Nintendo's servers.

The family is hard, and harder still under Rustalgia's rules.
High-level emulation of the kernel and its services is what makes these emulators work,
and that part of every repository is closed, so Rustalgia must build its own from hardware-tested references.
For the owner to decide, the note recommends keeping the Azahar and Panda3DS studies,
decrypted input with no keys and no network services, hardware tests as the oracle,
and deterministic scheduling on one host thread.
This note is not legal advice.

## Scope

- Question: which emulators are popular or respected for the Nintendo 3DS family, and for each, what are its status,
  licence, tier, techniques, and hosts; what is the family's legal exposure; and how hard is it to emulate?
- Covered: the Nintendo 3DS, 3DS XL, 2DS, New 3DS, New 3DS XL, and New 2DS XL,
  as [R1-07](R1-07-catalogue-sixth-generation.md#handhelds) lists them;
  DS and Game Boy Advance modes only as 3DS emulators model them.
  Left to other items: the DS itself to [R1-12](../../roadmap/research.md#system-family-surveys);
  the hardware to [R1-02](R1-02-primer-32-and-64-bit.md) and [R1-03](R1-03-primer-sixth-generation.md);
  the law to [R0-02](R0-02-legal-baseline.md); the hubs to [R0-05](R0-05-source-map.md);
  each emulator's architecture to its study ([emulator studies](../../roadmap/research.md#emulator-studies)).
- Researched on 2026-11-25.
  Status figures (archived flag, last push, stars, licence identifier, latest release) are GitHub API metadata read
  that day, so they are observed, not quoted.
- How claims were checked: three research agents each covered a share
  (emulators; frontends, phone apps, and stores; law and difficulty)
  and read every page as raw text with curl or through GitHub's API.
  Emulators were read from prose only, in every tier: READMEs, licence files, sites, blogs, release notes,
  and documentation, with no source file, issue, or pull request opened, and no repository cloned or searched.
  The writer fetched again the facts on which the research agents disagreed.
  One pass of fresh verifiers, who saw only the note, then checked each claim, quotation, link, and register line,
  and a fix pass re-fetched each disputed source as raw text before applying their findings.
- Hazards: no page listing keys, key slots, seeds, or the key scrambler, and no firmware, key,
  or game dumping guide was opened; every fetched page was screened for long hexadecimal strings,
  and none held key material (research log).
  Four cited pages use the word "leak": Citra's statement and the [yuzu complaint][yuzu-complaint], of game content;
  Citra's Android post, of Citra's own unreleased code; and [Azahar 2125.0.1][az-2125-0-1], of a memory leak.
  None names leaked maker material as a source, so none is closed.
  [3dbrew][3dbrew-hub] refused raw exports with a challenge page
  (HTTP 403)
  during research and answered on re-check, but no 3dbrew page was read for this note;
  its facts come through the primers.
- Research log: the source guard blocked the metadata of `lime3ds/lime3ds-archive` and `b3n30/citra_system_archives`
  (the word "archive" in the name),
  raw licence probes of `mikage-emu/mikage-dev`, release data of the unregistered libretro Citra,
  a deep documentation path in ScarletNX, and release data of the walled [Provenance][provenance-wiki];
  in the verification and fix passes it blocked the metadata of `mikage-emu/mikage-dev`, `jaklyy/vitaminc`,
  and `citra-emu/citra-web`, and every read of the compatibility list, whose line has not yet merged;
  no block was worked around.
  One research agent built a licence-file address in a loop before the guard blocked it, against the brief;
  nothing was read from that call.
  Every emulator line in the [register](../../../.claude/hooks/source-register.txt)
  that this survey covers was checked again; only Azahar's licence changed.
  Lines confirmed unchanged keep their old dates, because a line changes only when its licence or tier does.

## Findings

### The emulators at a glance

Status, licence, and tier, with the tier as the [register](../../../.claude/hooks/source-register.txt) gives it
after this survey (observed, from the projects' metadata, release pages, and store listings).
Each row's sources are linked in the paragraphs below.
"Keys" means the user supplies the console's keys, and the emulator decrypts at run time.

| Emulator | Tier | Licence | Latest release or last push | Input and system software | Hosts |
|---|---|---|---|---|---|
| Azahar | open | GPL-3.0+ from 2127.0 | 2127.0.1, 2026-11-24 | Decrypted; built-in keys | Win, Mac, Linux, Android |
| Citra | open | GPL-2.0+ | nightly 2104, 2024-03-04; removed | Keys; system files | Win, Mac, Linux, Android |
| Lime3DS | walled | GPL-2.0 by metadata | 2119.1, 2024-11-09; archived | As Citra | Win, Mac, Linux, Android |
| PabloMK7's fork | walled | not read | gone (404) | As Citra; Artic Base | not read |
| AzaharPlus | open | GPL-3.0 | 2126.2-A, 2026-10-09 | All files; Nintendo's servers | Win, Linux, Android 9+ |
| Mandarine | walled | not read | 1.2, 2025-01-28; gone (404) | Keys | Win, Mac, Linux, Android |
| Citra MMJ | open | GPL-2.0+ | 20251112, 2025-11-12 | As Citra | Android |
| Borked3DS | walled | GPL-2.0, version unstated | pushed 2025-04-15 | As Citra | Win, Mac, Linux, Android |
| libretro Citra | open | GPL-2.0+ | pushed 2026-09-20 | Keys | libretro; no macOS |
| Panda3DS | open | GPL-3.0 | v0.9, 2024-12-25; nightlies | Decrypted, or keys | Win, Mac, Linux, Android, libretro |
| Tanuki3DS | open | GPL-3.0 | v0.5.1, 2026-04-13 | Decrypted only; open replacements | Win, Mac, Linux |
| Mikage | closed | none | Developer Edition, 2025-01-02 | Keys; NAND from update data | PC (developers only) |
| ScarletNX | open | GPL-3.0+ | created 2026-10-11 | Keys | Linux, Win, Android, BSD, Solaris |
| 3Beans | open | GPL-3.0 | rolling, 2026-08-05 | Boot ROMs, NAND, encrypted cards | Win, Mac, Linux |
| Corgi3DS | open | GPL-3.0 | none; pushed 2023-07-13 | Boot ROMs, NAND | Win, Mac, Linux; source only |
| VitaminC | closed | none | archived; last push 2025-01-22 | Boot ROMs | none released |
| 3dmoo | closed | none | pushed 2017-08-20 | Dumped system data | none released |
| Folium (Cytrus) | open | GPL-3.0 | 2.2, 2026-10-04 | User's system files | iOS, paid |
| Manic EMU | walled | AGPL-3.0 | 2.0.2, 2026-11-02 | Azahar core | iOS |

Under [ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier),
a reimplementation of system software is closed wherever it is hosted.
This survey applies that to the high-level kernel and service modules of Citra and its forks, Panda3DS, Tanuki3DS,
and Mikage, and to the replacement system archives, shared fonts, and Mii data some of them bundle;
the rest of each repository keeps its tier.
It does not apply it to high-level audio, because the DSP program comes with each title,
and the [glossary](../../glossary/terms.md#firmware) counts only code stored in the device as firmware.
Facts these projects took from analysis of DSP firmware are still not recorded without a hardware test.

Popularity, as one rough sign (observed, 2026-11-25): Azahar has 8,789 GitHub stars, Citra MMJ 2,781, AzaharPlus 1,493,
Panda3DS 1,417, 3Beans 673, Manic EMU 670, Mikage's Developer Edition 423, ScarletNX 365, Tanuki3DS 344, Borked3DS 279,
and Corgi3DS 250.
Azahar's [Google Play listing][az-play] shows 1,000,000+ downloads,
and [Flathub's statistics][flathub-az] count 287,783 installs of Azahar, 95,808 of Lime3DS
(now end-of-life), and 2,510,442 of Citra, whose listing is gone.
The [Emulation General Wiki][egw-3ds] gives Azahar, Citra, and Panda3DS compatibility counts out of 550 titles (lead).

### Citra and the projects that continue it

**Citra.**
Its 2015 progress report says Citra was founded in April 2014 and credits the authors of 3dmoo, an earlier prototype,
with early reverse engineering ([Citra 2015 P1][citra-2015p1], 2016-02-23);
the [FAQ][citra-faq] instead says it started in early 2013, and Wikipedia gives a first release of 24 April 2014
([Wikipedia, "Citra (emulator)"][w-citra], secondary).
The FAQ says Citra is "licensed under the GPLv2 (or any later version)", runs on Windows, macOS, Linux, and Android
([download page][citra-download]),
needs games, updates, and system files dumped from a modified 3DS,
and runs encrypted games only with keys dumped from the console; it links key and dumping guides, which were not opened.
Its code repository, `github.com/citra-emu/citra`, returns 404 (observed); the organisation keeps only the archived,
unlicensed site source `citra-emu/citra-web`. [citra-emu.org][citra-end] now serves only the shutdown statement of 4
March 2024, quoted under "Legal exposure".
Its site survives as an Azahar-maintained copy whose banner calls it "an archive of the official Citra Emulator website
dated March 4th 2024".

Its techniques, from its progress reports in that copy: an interpreter,
then the [Dynarmic][dynarmic] recompiler from ARM11 to x86-64, with an AArch64 back end added for Android
([Citra Android][citra-android], 2020);
an OpenGL hardware renderer beside an accuracy-focused software renderer, and later Vulkan; high-level audio by default,
with low-level audio through [Teakra][teakra] that ran games at about 5 frames a second in 2018
([Citra site archive, "Accurate Audio Emulation Has Arrived"][citra-audio]).
Cycle counting assumed one cycle per instruction until Dynarmic's author made the counts more accurate
([Citra 2023 Q1][citra-2023q1]).
Citra's scheduling, modelled revisions, and stereoscopic modes are under "What makes the family hard".
Its Android app ran from 2020 to March 2024, with a paid "Premium" in-app purchase for cosmetic features
([Citra Android][citra-android]; Play listing captures, observed).

**Azahar.**
On its [blog][az-beginning] ([site][azahar-site]), Azahar describes the merger of Lime3DS,
which worked on the interface, and PabloMK7's Citra fork, which worked on the core and added Artic Base,
a console-side program that streams games and saves over a local network.
Its repository is Lime3DS's renamed (the old name resolves to the same repository; observed), created on 4 March 2024,
with a first stable release, 2120, on 21 March 2025.
Its [README][azahar] calls it "a free and open-source high level Nintendo 3DS emulator for PC and mobile devices";
it is pushed daily (observed).

Release 2127.0 of 23 November 2026 says "Azahar's license has been changed from GPLv2+ to GPLv3+" ([2127.0][az-2127]);
its licence file is the GPL-3.0 text (observed).
The [libretro documentation][lr-azahar] and [Wikipedia][w-citra] still show GPLv2-or-later,
and [Flathub's metadata][flathub-az] GPL-2.0 (observed).
Its [AI policy][az-ai] says "Use of AI to rewrite incompatibly-licensed code for submission to Azahar is prohibited."

Techniques, from the README, [release notes][az-releases], and [libretro documentation][lr-azahar]: Dynarmic,
through Azahar's own 0BSD fork, as the recompiler; FastInterp,
a faster interpreter that replaced DynCom in 2127.0 for hosts without dynamic recompilation,
which the notes say lets devices as old as an iPhone XS run at over 200% speed; OpenGL, Vulkan, and software renderers,
up to 18 times the internal resolution ([2126.1][az-2126-1]), texture filters,
and a Vulkan disk shader cache ([2125.0.1][az-2125-0-1]).
Audio is high-level by default, with low-level and multithreaded low-level options;
the kernel and services are high-level, with optional low-level system modules from the user's system files,
which online features need ([2125.1][az-2125-1]).
Its hosts are Windows, macOS 13.4 or later, 64-bit Linux, 64-bit Android 10 or later,
and libretro cores for those and for iOS and tvOS; Windows on ARM is not supported
([README][azahar]; [download page][az-download]).
Other features: save states, per-game settings on Android, 3GX plugins, and multiplayer room servers.

Input, from its own words: decrypted dumps only since 2120
([R0-02](R0-02-legal-baseline.md#keys) quotes it),
built-in keys used for content from Nintendo's own applications,
and system files copied from a console with the Artic Setup Tool,
which the notes call the only method from 2120 ([2120][az-2120]).
The keys and their legal theory are under "Legal exposure".
Release 2127.0 adds bundles that can carry a game with its updates, its downloadable content,
and system files such as Mii data.

Provenance, from Citra's report for the second half of 2023, published by Azahar
([Citra: 1 Year On][az-one-year]):
method names were changed to match Nintendo's from debug symbols found in a retail game;
a contributor used a decompiler on a retail game to find a display-transfer behaviour,
then confirmed it by hardware tests; and a decompiler plugin for the DSP's processor was written to study its firmware.
Those parts are game-derived or firmware-derived,
which the Azahar study ([R1-36](../../roadmap/research.md#emulator-studies)) has to weigh (inference).

**Forks.**
Each from its README or site, read as prose (observed):

- Lime3DS: the profile of its organisation says it "has been discontinued",
  and its [site][lime3ds-site] redirects to Azahar; its last Flathub release was 2119.1 of 9 November 2024
  ([Flathub][flathub-az], observed).
  A capture of its site in June 2024 named Windows, macOS, Linux, and Android 9 or later.
- PabloMK7's fork: `pablomk7/citra` returns 404 (observed); its work went into Azahar, and Artic Base is now Azahar's
  ([Azahar blog][az-beginning]).
- [AzaharPlus][azaharplus]: restores what Azahar removed, saying "If a file works with any Citra fork, it works
  with AzaharPlus", and adds "Ability to download system files from official servers.
  No need for an actual 3DS."
- Mandarine: its repository returns 404 with no explanation found;
  its [site][mandarine-site] calls it a fork with experimental hacks, backported from Citra MMJ,
  with releases for Windows, macOS, Linux, and Android to 1.2 of 28 January 2025, which fixed the splitting of AES keys.
- [Citra MMJ][citra-mmj] (weihuoya): Android builds released to 12 November 2025,
  each of the five latest offering a build that presents the app to the system as a benchmark app to raise clocks;
  the Emulation General Wiki says its source is published only in part (lead).
- [Borked3DS][borked3ds]: derived from PabloMK7's fork with parts of Lime3DS and Mandarine; inactive since April 2025.
- [libretro Citra][lr-citra-gh]: the libretro port of Citra, documented under GPLv2,
  needing user keys, OpenGL 3.3, and no working macOS build
  ([libretro documentation][lr-citra]); the Emulation General Wiki calls it obsolete (lead).

### Other high-level emulators

**Panda3DS.**
The [README][panda3ds] calls it "an HLE, red-panda-themed Nintendo 3DS emulator written in C++", powered by Dynarmic,
credits Citra with "some code snippets inspired or adapted from it",
and names [3dbrew][3dbrew-hub] as its "main source of documentation used".
Release v0.9 of 25 December 2024 says it is outdated in favour of nightly builds from [its site][panda3ds-site].
Its techniques, from the README, the [v0.9 notes][panda-v09], and the [libretro documentation][lr-panda]: OpenGL,
Vulkan, and Metal renderers; shader recompilers for x86-64 and ARM64, a shader decompiler, a fragment shader generator,
and optional ubershaders; high-level, low-level, or no DSP emulation; Lua scripting;
and debug views that dump game file systems and the title's DSP program (its notes say "DSP firmware").
Its [FAQ][panda3ds-faq] says the website is under MIT and the emulator under GPLv3.
Hosts: Windows, macOS, and Linux, with Linux ARM64 builds on its [download page][panda3ds-dl], an Android APK
("Pandroid", no store listing found), and an official libretro core.
It accepts decrypted dumps, or encrypted ones with the user's key file (README) and, for some titles, the seed database
([v0.9 notes][panda-v09]).
Its developer's slides at FOSDEM 2024 set out the trade between low-level, high-level, and hybrid system emulation
([FOSDEM 2024 slides][fosdem-panda]).

**Tanuki3DS.**
The [README][tanuki] calls it a 3DS emulator for macOS, Linux, and Windows, written in C, "which aims to be simple,
fast, and compatible", and says "All games must be decrypted."
It uses open replacements for the shared font and Mii data by default, generated with B3n30's tool,
and offers a dumping program for the originals; neither was opened, and both are closed in the register.
It names Panda3DS, Citra, and 3dmoo as references, and releases from v0.4.0 (23 February 2026) to v0.5.1
(13 April 2026)
add an ImGui frontend, texture and audio viewers, lighting, fog, shadows, procedural textures,
and camera and microphone support ([releases][tanuki-rel]).
Its own ARM recompiler and an OpenGL renderer are recalled, not read (from memory).

**Mikage.**
Its [FAQ][mikage-faq] says neobrain, an author of Citra, started it in 2016, that it emulates the HOME Menu,
and that it has recompilers for the CPU and DSP and a Vulkan renderer; "No builds have left our computers since 2020."
Its [Developer Edition announcement][mikage-dev] of 2 January 2025 published "the majority of the emulator core":
an ARM11 interpreter, Vulkan emulation of the PICA200, a high-level kernel, over twenty service modules,
a debugging hypervisor, and DSP emulation based on Teakra; "there are no public user builds".
The repository, `mikage-emu/mikage-dev`, has no licence file or statement
(licence endpoint 404; observed), while the FAQ answers "Will Mikage be open-source?
Yes, and it already is!"
By the no-licence precedent it is closed, and its address stays unlinked.
Its README asks for the user's key file and a system NAND built from a game's update partition,
so it runs maker system modules beneath its own kernel; it serves GDB and a kernel console.
A 2020 post put it on hiatus for lack of funding, declining a seven-figure offer; a 2022 note ended the hiatus
([Mikage, "Good Bye, Friends"][mikage-bye]).

**ScarletNX.**
The [README][scarletnx] calls it "A GPLv3 static ARM64 to x86 recompiler" with a Switch ABI layer,
whose "Experimental drivers run 3DS games, DS games and PS Vita homebrew the same way",
taking the user's 3DS key file and Switch keys; it was created on 2026-10-11 (observed).

### Low-level emulators

**Corgi3DS.**
The [README][corgi] calls it "a dog-themed LLE 3DS emulator" that boots a modified console's firmware, the HOME Menu,
and some commercial games, from the user's boot ROMs and an encrypted NAND image; it uses a public-domain AES library.
It has no releases and was last pushed on 2023-07-13 (observed).
Panda3DS calls it "an innovative LLE emulator", and 3Beans thanks its logs.

**3Beans.**
By its [README][3beans], it "emulates the 3DS at a low level, which means that it runs the entire OS",
and "has both software and hardware GPU rendering, but CPUs are still fully interpreted."
It needs the user's boot ROMs and NAND from GodMode9 and encrypted card dumps,
runs the original 3DS better than the New 3DS, does not take pull requests,
and names Teakra as "The only source for newer aspects of the Teak architecture".
Its rolling build of 5 August 2026 is for Windows, macOS, and Linux (observed).

**VitaminC and 3dmoo.**
`jaklyy/vitaminc`, archived and unlicensed,
describes an experimental fully low-level research emulator of the original and New 3DS, aiming at the highest accuracy,
that does not get past the boot ROM.
`plutooo/3dmoo`, created on 2014-03-19 with no licence, is the prototype whose authors Citra credits;
its README asks users to dump system data with a homebrew tool, which was not followed (observed).
Both are closed and named without links.

**Dynarmic.**
The recompiler that Citra, Azahar, and Panda3DS use is under 0BSD,
which the [GNU list][gnu-list] says "can operate as a free software license compatible with the GNU GPL";
its [README][dynarmic] says "Only user-mode is emulated", that floating-point status is approximate,
and that "No formal verification has been done".
The upstream repository returns 404, and Azahar keeps a fork (observed).

### Frontends, libretro cores, and phone apps

- **RetroArch.** libretro documents four 3DS cores: [Citra][lr-citra], Citra Canary, [Azahar][lr-azahar],
  and [Panda3DS][lr-panda]; Azahar's core takes decrypted games only, while Citra's takes the user's keys.
  Its [iOS guide][lr-ios] says App Store builds carry only cores whose upstream allowed it,
  that cores cannot be added after installation, and that the App Store build runs without dynamic recompilation;
  the App Store listing names no 3DS core (inference).
  Azahar's iOS and tvOS cores ship with recompilation turned off ([2125.0.1][az-2125-0-1]).
- **Lemuroid.**
  An open-tier Android libretro frontend whose README lists the 3DS through libretro's Citra core;
  [Google Play][lemuroid-play] shows 5,000,000+ downloads for all its systems,
  and [F-Droid][lemuroid-fd] flags it for downloading emulator cores from GitHub at run time.
- **BizHawk.**
  TASVideos' [release history][tas-rel] lists "Encore (Citra) for 3DS" among new cores in BizHawk 2.10,
  released on 7 January 2025, for deterministic input movies; BizHawk is walled.
- **iOS apps.**
  Apple's [guideline 4.7][apple-guide] lets emulators offer game downloads,
  and its rule 2.5.2 bars downloading code that changes an app's features,
  which is why the store builds run interpreters (inference, consistent with libretro's guide).
  Apps that list the 3DS (observed, App Store search of 2026-11-25):
  - [Folium][folium-app], $2.99, first released 2024-05-31, whose 3DS system "Cytrus" is a port of Azahar.
    Its [repository][folium-gh] and [Cytrus's][cytrus-gh] are GPL-3.0, created in September 2026 (observed).
    Folium shipped closed for its first two years (from memory).
  - [Manic EMU][manic-app], free, 17,717 ratings, whose notes name "the Azahar core";
    its [repository][manic-gh] is AGPL-3.0, and its README says some cores are integrated as binary frameworks.
  - Provenance, which lists a Citra- or Azahar-based 3DS core on its [wiki][provenance-wiki].
  - Closed apps that list the 3DS, among them JOY, ZETA, PP EMU, Gamuroid, and Fin;
    closed apps get no line of their own, and the App Store line covers their listings.
- **Android stores.**
  Citra's app was on Google Play from 2020 until a capture of 28 February 2024
  (5,000,000+ downloads); from 4 March 2024 its listing returns 404 (Play listing captures, observed).
  Lime3DS's listing existed by November 2024 and became Azahar's by May 2025
  ([Azahar on Google Play][az-play]; captures, observed).
  Azahar's faster file access needs a permission Google Play forbids,
  so a second "Vanilla" build is offered outside the store ([README][azahar]).
  F-Droid lists no Citra, Azahar, or Panda3DS package (observed).

### Official emulation by Nintendo

No public Nintendo prose on an emulator of the 3DS was found,
in the pages read for this survey and a web search limited to Nintendo's sites (lead).
Nintendo's [support page][ntd-switch] says Switch "does not include backwards compatibility with digital
or physical games designed for other consoles or systems", and that 3DS eShop purchases do not carry over.
On the 3DS itself, the Ambassador Program's Game Boy Advance titles ran natively on the ARM7TDMI under AGB_FIRM,
not under emulation, while Virtual Console titles of other systems were emulated
([Wikipedia, "Virtual Console"][w-vc], secondary); R1-10, R1-11, and R1-15 cover those systems.

### DS and Game Boy Advance modes in 3DS emulators

No page read says that any high-level 3DS emulator runs DS titles under TWL_FIRM or GBA titles under AGB_FIRM
(searched: the Citra posts and FAQ, Azahar's notes and blog, and the Panda3DS, Tanuki3DS, 3Beans, Corgi3DS,
and Mikage pages).
The low-level 3Beans and Corgi3DS boot the user's NAND, but neither says whether DS or GBA mode runs.
ScarletNX has a separate DS driver.
So DS mode belongs to the DS emulators of [R1-12](../../roadmap/research.md#system-family-surveys)
and the hardware of [R1-02](R1-02-primer-32-and-64-bit.md#game-boy-advance-and-ds) (inference).

### Tests, oracles, and published results

No published result of any 3DS emulator on any test suite was found
(searched: the projects' prose above, the Emulation General Wiki, and a web search).
What exists, and its oracle:

| Suite or list | Tier | What it tests | Oracle |
|---|---|---|---|
| [crossbar9][crossbar9] | open | ARM9 tests in Rust, run on a modified console | hardware; no expected results |
| [Teakra][teakra] testers | open | DSP instructions, registers, memory, MMIO, DMA | hardware |
| `normmatt/hwtests` and others of Citra's era | closed | GPU, CPU, and services | hardware; no expectations |
| [3ds-examples][3ds-examples] | walled | devkitPro demos, not self-checking | not stated |
| [Azahar compatibility list][az-compat] | open | play reports, rated 0 (best) to 5 | players |
| [Input lag checker][lag-checker] | open | a white screen and a sound, repeated; the user presses in time | the user |
| [polyrastertest][polyraster] | open | DS polygon rasterisation, in DS mode | hardware, a New 3DS XL |

The register's existing lines give the tiers of crossbar9, Teakra, the Citra-era tests, 3ds-examples,
and polyrastertest.
Citra's developers describe hardware tests behind shader, texture-combiner, display-transfer, DSP-buffer,
and amiibo fixes, but published neither the programs nor the results
([Citra 2019 Q1][citra-2019q1]; [Citra: 1 Year On][az-one-year]).
The compatibility list's ratings are judged by players
(its contributing guide could not be re-read, research log);
its data has no licence, and as a community reference with no claim of a confidential origin it is open under
[ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#sources-that-are-not-emulators).
Azahar claims one to two frames less input latency "in some cases" in 2127.0, but no published measurement was found.

### What makes the family hard

The hardware is described in the primers: two ARM11 cores at 268 MHz, four on the New 3DS at up to 804 MHz
([R1-03, "Nintendo 3DS"](R1-03-primer-sixth-generation.md#nintendo-3ds));
encrypted NAND and SD storage and three DMA systems
([R1-03, memory](R1-03-primer-sixth-generation.md#nintendo-3ds-1));
the PICA200's command buffers, fixed fragment stage, non-IEEE shaders, and interlaced stereoscopic output
([R1-03, PICA200](R1-03-primer-sixth-generation.md#nintendo-3ds-pica200));
a Teak-family DSP running a program the title supplies
([R1-03, audio](R1-03-primer-sixth-generation.md#nintendo-3ds-2));
and services that titles request by name
([R1-03, system software](R1-03-primer-sixth-generation.md#system-software-that-games-call)).
The emulator authors add these points:

- **Scheduling.**
  Citra's report for the second half of 2023 says "a single emulation thread is used
  that periodically switches execution between the game threads, emulating the thread scheduler of the 3DS",
  which it calls deterministic, and that real multithreading would need a kernel rewrite and cost accuracy
  ([Citra: 1 Year On][az-one-year]).
  Adding the New 3DS's extra core was "almost completely within the scheduler",
  and the report calls it "an open secret in the 3DS reverse engineering scene
  that the 3DS scheduler is devilishly complex" ([Citra 2019 Q1][citra-2019q1]).
  Azahar added experimental GPU timing in 2126.0
  and fixed DSP sleep timing "to better match real hardware timings" in 2127.0 ([2126.0][az-2126-0]; [2127.0][az-2127]).
- **System software.**
  Every popular emulator replaces the kernel and services at a high level
  and loads some maker modules from the user's dump where its own version falls short: Azahar's notes name the BOSS,
  CECD, and DLP modules ([2124][az-2124]; [2125.0.1][az-2125-0-1]; [2125.1][az-2125-1]).
  Mikage's FAQ says system-module emulation took Citra months, while Mikage had it from the start.
  Panda3DS's slides weigh low-level emulation, which runs any software but is slow and error-prone,
  against high-level emulation, with "Many elements left to reverse engineer" ([FOSDEM 2024 slides][fosdem-panda]).
- **Graphics.**
  Citra's report says on its shader edge cases that "There is only one source of truth for these questions,
  the console itself", and that matching the clip-plane test exactly would need the console's float format in software;
  min and max blending need framebuffer fetch or a similar path; geometry shaders fall back to software;
  and the software renderer "served as a measure of accuracy for the hardware renderers to match"
  ([Citra: 1 Year On][az-one-year]).
  Azahar 2126.1 fixed geometry shader output banking and denormal accuracy ([2126.1][az-2126-1]).
- **Audio.**
  High-level audio is the default in Citra, Azahar, and Panda3DS; the same report says it "is not perfect",
  that low-level audio is slow, and that a prototype DSP recompiler doubled speed over the reference interpreter in
  early tests.
- **CPU without recompilation.** iOS forces an interpreter; Azahar wrote FastInterp for it ([2127.0][az-2127]).
- **Revisions.**
  Emulators choose the original or New 3DS per game: Citra had a "New 3DS mode" with the C-Stick and ZL and ZR
  ([Citra 2023 Q1][citra-2023q1]),
  and Azahar's libretro core sets the model, New 3DS by default ([libretro documentation][lr-azahar]).
  3Beans runs the New 3DS slower and with more issues ([README][3beans]).
  Citra's stereoscopic modes, among them interlaced since 2019 and reverse interlaced,
  show that some games render differently for each eye ([Citra 2023 Q1][citra-2023q1]).
- **Encryption.**
  Mikage counts four encryption schemes for system files and more than fifty keys
  ([Mikage, "The unsung Heroes of 3DS Emulation"][mikage-heroes]);
  for Rustalgia this is handled by refusing it (see "Options and trade-offs").

### Legal exposure

This section builds on [R0-02](R0-02-legal-baseline.md) and is not legal advice.

- **Citra's end.**
  The [yuzu complaint][yuzu-complaint] names Citra once, in paragraph 66,
  as a 3DS emulator led by yuzu's lead developer, with no count about it; the joint motion does not mention it
  (research log).
  The [judgment][yuzu-judgment] bars the defendant and its members from "trafficking in other software or devices
  that circumvent Nintendo's technical protection measures",
  and orders the surrender of any website they control that involves Nintendo's intellectual property
  ([R0-02, "Game sites, and the yuzu case"](R0-02-legal-baseline.md#game-sites-and-the-yuzu-case)).
  Citra's statement says its "projects can circumvent Nintendo's technological protection measures
  and allow users to play games outside of authorized hardware, they have led to extensive piracy",
  and that the repositories would go offline ([citra-emu.org][citra-end]).
  Citra decrypted titles with user keys and its lead was a member of the defendant,
  so the injunction reaches a Citra run by those members, though it is no ruling on Citra
  (inference; [PC Gamer][pcgamer], secondary, reached the same view).
  [R0-02's enforcement table](R0-02-legal-baseline.md#takedown-and-enforcement-history) has no row for this end.
- **Notices.**
  A listing of every Nintendo notice in GitHub's archive from 2014 to 2026-11-12 found the 3DS only in the
  [freeShop notice][freeshop] of 2016-12-27 (search of the notices' raw text for Citra, Azahar, Lime3DS, Panda3DS,
  Mikage, and "3DS"; research log).
  It pleads that "Nintendo believes the freeShop application circumvents Nintendo's protection measures by decrypting
  the game files accessible from its eShop servers", and copyright in "Nintendo 3DS Logo Data", registration
  PA0001781880.
  This extends [R0-02, "Who has been reached"](R0-02-legal-baseline.md#who-has-been-reached).
  Mandarine's and PabloMK7's repositories are gone with no notice found.
- **Azahar's keys.**
  The [game-loading post][az-loading] of 12 December 2024 says "Azahar will not allow launching
  or installing encrypted games, unless they have been obtained through Nintendo's official applications,
  such as the eShop or System Settings", and "we will directly include the cryptographic keys in Azahar",
  arguing under its author's reading of Spanish law that random keys are not creative enough for copyright
  (a project's view, untested).
  Release 2125.1 confirms it: a build option, on by default,
  whose removal "omits the built-in keys usually distributed with Azahar,
  which disables certain functionality" ([2125.1][az-2125-1]),
  and 2127.0 adds signature checks on downloaded encrypted content, such as eShop titles and system files.
  So Azahar uses both variants of
  [R0-02's option 3](R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key): decrypted dumps,
  and embedded keys for Nintendo's downloads.
  R0-02's "Keys" and its recommendation describe only the first;
  and [R1-03's option 11](R1-03-primer-sixth-generation.md#11-plain-images-only-or-content-that-the-user-decrypts) says
  R0-02 found no decrypted-input project, which R0-02's Azahar finding contradicts.
  Its decryption of eShop downloads resembles what the freeShop notice pleads,
  though freeShop gave access to unpaid titles and Azahar is limited to titles the user's account owns;
  it has drawn no notice found (inference).
- **The options as projects apply them.**
  [Option 2](R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys), user keys:
  Citra, libretro Citra, Mandarine, Panda3DS, Mikage, ScarletNX.
  Option 3's first variant, decrypted dumps only: Tanuki3DS, and Azahar for dumps.
  [Option 4](R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps), the user's firmware: Corgi3DS, 3Beans,
  VitaminC, and system files for every Citra-lineage emulator.
  [Option 5](R0-02-legal-baseline.md#5-replace-the-firmware): Citra's and Azahar's open system archives and fonts,
  and Tanuki3DS's font and Mii data.
  [Option 6](R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes) has no 3DS analogue,
  because Nintendo's servers send encrypted files (inference);
  AzaharPlus goes beyond every option by downloading system files from them with no console at all.
  [Option 7](R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links):
  Citra published key and dumping guides;
  Azahar declines game-copying guides but keeps `github.com/azahar-emu/azahar/wiki/Dumping-Games`
  and a system-file page, unlinked as dumping guides.
  [Option 8](R0-02-legal-baseline.md#8-take-money-or-not): Citra's paid Premium, sold by the company later sued;
  Folium is paid.
- **Maker terms.**
  Nintendo of Europe's [3DS service agreement][eula]
  (version 05.2018)
  bars "Hosting, intercepting, emulating,
  reverse engineering any part of the Nintendo 3DS System or the Nintendo 3DS Services";
  an emulator that talks to the eShop or update servers adds contract exposure for users who accepted it (inference),
  beyond
  [R0-02, "Makers' system software and licence terms"](R0-02-legal-baseline.md#makers-system-software-and-licence-terms).
  An American version was not found.
- **Boot logos and lock-out.**
  The lock-out is signatures and encryption from the boot ROM
  ([R1-03, "Boot chains"](R1-03-primer-sixth-generation.md#boot-chains-and-security-processors)), not a logo check.
  Each title carries the logo the system shows at boot
  (from memory; the page that would confirm it documents content encryption, so it was not opened),
  so an emulator that draws the title's own logo holds no copy,
  as [R0-02, "Boot logos"](R0-02-legal-baseline.md#boot-logos) finds for the Game Boy;
  freeShop's notice shows Nintendo registered that logo data.
- **Licences.**
  The Emulation General Wiki reports incomplete source for Citra MMJ and unstated changes in AzaharPlus (lead),
  which are compliance risks for those projects, not for their readers.
  Folium was sold on the App Store for two years before its GPL repositories appeared,
  which raises the tension between the GPL and the store's terms recorded in [R0-03](R0-03-licence-strategy.md)
  (from memory, inference).
  Citra bundles an AAC-LC decoder, treating the patent as expired on the views of Fedora's legal team
  and the Flatpak (freedesktop-sdk) maintainers
  ([Citra: 1 Year On][az-one-year]; a project's view), and Azahar inherits it (inference;
  [R0-02, "Patents, recorded as risks"](R0-02-legal-baseline.md#patents-recorded-as-risks)).
- **Marks and impostors.**
  Azahar and its store listing disclaim affiliation with Nintendo, as in
  [R0-02's option 14](R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words);
  Azahar warns of an impostor site, `azahar-emulator.org`, unlinked because its contents are unknown
  ([Azahar, "Fake Websites"][az-fake]).

## Options and trade-offs

### Which emulators the emulator studies cover

- **What:** keep the roadmap's [Azahar][azahar] and [Panda3DS][panda3ds] studies
  ([R1-36 and R1-37](../../roadmap/research.md#emulator-studies)),
  add [Tanuki3DS][tanuki] or [3Beans][3beans], or replace one.
- **Costs:** in every high-level emulator, the kernel and services are closed, so a study reads only the CPU, GPU, DSP,
  scheduler, and frontend; Azahar also holds built-in keys at a path not yet known,
  and names taken from a retail game's debug symbols.
  A new study is one more item.
- **Gains:** Azahar is the reference by popularity and the fullest feature set;
  Panda3DS is independent of Citra's lineage apart from adapted snippets
  (inference from its README);
  Tanuki3DS aims to be simple and takes decrypted input only, as Rustalgia would;
  3Beans is the open-tier low-level reference, useful as a test oracle only where a user's boot ROMs are to hand.
- **Used by:** Tanuki3DS names Panda3DS and Citra as references; Panda3DS names Citra, 3dmoo, and Corgi3DS.

### Which test oracles to adopt

- **What:** adopt [crossbar9][crossbar9] and [Teakra][teakra]'s testers, write the project's own console tests,
  or rely on compatibility lists.
- **Costs:** the open suites cover only the ARM9 and the DSP; console tests need a modified console with boot9strap,
  and the project may not obtain or keep its firmware; play reports are not hardware-verified.
- **Gains:** hardware-checked results for the parts tested; play reports cover whole games.
- **Used by:** Citra's developers (unpublished hardware tests), Teakra, Azahar (its compatibility list).

### How to handle encrypted content

- **What:** decrypted dumps only with no keys
  (option 3, first variant),
  Azahar's dumps plus embedded keys for Nintendo's downloads, or user keys at run time (option 2).
- **Costs:** the first leaves eShop and update downloads out and depends on the user's own tools;
  run-time decryption is what the yuzu complaint and the freeShop notice plead,
  and an embedded key drew a maker's letter ([R0-02](R0-02-legal-baseline.md#recommendation)).
- **Gains:** the first matches R0-02's recommendation and Tanuki3DS; the others work unaided or with fewer steps.
- **Used by:** Tanuki3DS; Azahar; Citra, Panda3DS, and Mikage.

### How to handle system software

- **What:** the project's own high-level kernel and services (option 5), optional maker modules from the user's dump
  (option 4), or full low-level emulation from boot ROMs.
- **Costs:** the high-level path must be written without reading any emulator's version, from [3dbrew][3dbrew-hub],
  whose pages are partly firmware-derived, and hardware tests; maker modules need the user's console;
  low-level emulation needs boot ROMs that hold the keys.
- **Gains:** the high-level path runs homebrew and tests with nothing of Nintendo's;
  maker modules fill gaps such as online and friend services.
- **Used by:** every high-level emulator (both, combined); Corgi3DS and 3Beans (low-level).

### How to schedule the cores

- **What:** one host thread that interleaves guest threads deterministically, as Citra does,
  or host threads for the symmetric cores,
  as [R1-03's recommendation](R1-03-primer-sixth-generation.md#recommendation) proposes for the 3DS.
- **Costs:** one thread is slower and hangs the whole emulator when a guest thread blocks;
  host threads lose determinism and need the guest's memory ordering, and Citra's authors say they would cost accuracy.
- **Gains:** determinism supports tests and input replays; threads use more host cores.
- **Used by:** Citra and its forks (one thread).

### Recommendation

These are recommendations for the owner, who decides; the pull request lists them.

- **Studies:** keep R1-36 (Azahar) and R1-37 (Panda3DS),
  with Tanuki3DS as a comparison inside R1-37 rather than a new item;
  each study skips the high-level kernel and services and any key material, as the register says.
  Azahar and Panda3DS are the two most used open-tier lineages, and Tanuki3DS shows a simple decrypted-only design.
- **Oracles:** adopt crossbar9 and Teakra's testers now,
  and plan the project's own 3DS console tests in a 3DS counterpart of
  [R5-12](../../roadmap/research.md#phase-5-hands-on-spikes), using a compatibility list only for play coverage, because
  no published 3DS suite tests the ARM11 or the PICA200 against hardware.
- **Content:** decrypted input only, with no keys, no decryption code, and no eShop or update downloads,
  as [R0-02's recommendation](R0-02-legal-baseline.md#recommendation) already prefers;
  Azahar's embedded keys and downloads resemble the conduct the freeShop notice pleads (inference).
- **System software:** the project's own high-level kernel and services built only from 3dbrew facts
  that are not firmware-derived, or that a console test confirms, with the user's maker modules as an optional path.
- **Scheduling:** one deterministic host thread for the 3DS, departing from R1-03's recommendation of host threads,
  because the one 3DS emulator line with published reasoning chose it for accuracy and determinism.

## Implications for Rustalgia

- The owner may correct [R0-02](R0-02-legal-baseline.md#keys) and its recommendation on Azahar,
  [R1-03's option 11](R1-03-primer-sixth-generation.md#11-plain-images-only-or-content-that-the-user-decrypts),
  and R0-02's enforcement table (Citra's end), in place, as small corrections.
- [R2-12](../../roadmap/research.md#phase-2-cross-cutting-engineering) has its hardest case here:
  a high-level operating system written from references without reading any implementation.
- [R2-03](../../roadmap/research.md#phase-2-cross-cutting-engineering)
  and [R2-08](../../roadmap/research.md#phase-2-cross-cutting-engineering) inherit the scheduling choice;
  a deterministic single thread supports replays and save states.
- [R3-01](../../roadmap/research.md#phase-3-host-platforms) has a claimed precedent:
  [Azahar's notes][az-2127] say its interpreter lets devices as old as an iPhone XS reach over 200% speed,
  with no published measurement.
- [R6-01](../../roadmap/research.md#phase-6-synthesis) decides whether the 3DS is in scope at all,
  given encrypted titles, firmware-held keys, and closed high-level references.

## Open questions

- Which [3dbrew][3dbrew-hub] service and kernel facts hold on a console: hardware tests on an owned, modified console,
  in a 3DS counterpart of [R5-12](../../roadmap/research.md#phase-5-hands-on-spikes), which no roadmap item provides.
- Where in [Azahar][azahar]'s tree the built-in keys live, so that a closed line can name the path:
  a statement from the project, or the Azahar study ([R1-36](../../roadmap/research.md#emulator-studies)) asking it.
- Whether 3Beans or Corgi3DS runs DS or GBA mode: running them, which needs boot ROMs the project may not obtain,
  or a statement from their authors.
- How each title's boot logo is stored: 3dbrew's "NCCH" page documents content encryption and key slots,
  so the key-page hazard bars it; a 3dbrew page with no key material, or a console test, for R1-12 or R2-11.

## Sources

Every source below was read on 2026-11-25, as raw text unless marked.
Addresses in code spans are closed, removed, impostor sites, or dumping guides, and are not linked.

Citra and its successors:

- Azahar: [README][azahar] (blob `a16f4a7a`); [releases][az-releases], in particular [2120][az-2120], [2124][az-2124],
  [2125.0.1][az-2125-0-1], [2125.1][az-2125-1], [2126.0][az-2126-0], [2126.1][az-2126-1], [2127.0][az-2127];
  [AI policy][az-ai]; [site][azahar-site]; [download page][az-download]; blog posts ["A New Beginning"][az-beginning]
  (2024-12-08), ["Game Loading on Azahar"][az-loading] (2024-12-12), ["Fake Websites"][az-fake] (2025-03-02),
  ["Citra: 1 Year On"][az-one-year] (2025-03-04); [compatibility list][az-compat]; [Dynarmic fork README][dynarmic]
  (blob `1bb437d8`).
- Citra: [shutdown statement][citra-end]; Azahar's copy of its site: [FAQ][citra-faq]
  (marked as edited),
  ["Announcing Citra Android"][citra-android], ["Accurate Audio Emulation Has Arrived"][citra-audio],
  progress reports [2015 P1][citra-2015p1], [2019 Q1][citra-2019q1], [2023 Q1][citra-2023q1],
  and [download page][citra-download]; [Wikipedia, "Citra (emulator)"][w-citra] (revision 1375255981).
- Forks: [Lime3DS site][lime3ds-site] and its Wayback capture 20240603194404; [AzaharPlus README][azaharplus]
  (blob `f9b291da`; release 2126.2-A);
  [Mandarine site][mandarine-site]; [Citra MMJ repository][citra-mmj] (release 20251112); [Borked3DS README][borked3ds]
  (blob `1de5067f`); [libretro Citra README][lr-citra-gh] (blob `40269909`).
- Not linked: `github.com/citra-emu/citra`, `github.com/pablomk7/citra`, and `github.com/mandarine3ds/mandarine`
  (removed; 404);
  `citra-emu/citra-web` (closed); `lime3ds/lime3ds-archive` (metadata blocked by the guard); `azahar-emu/ArticSetupTool`
  (copies system files and keys from a console);
  the dumping pages of Azahar's wiki; `azahar-emulator.org` (impostor site).

Other emulators:

- [Panda3DS README][panda3ds] (blob `438a2b95`); [v0.9 release notes][panda-v09]; [site][panda3ds-site];
  [download page][panda3ds-dl]; [FAQ][panda3ds-faq]; [FOSDEM 2024 slides][fosdem-panda].
- [Tanuki3DS README][tanuki] (blob `dcbf6342`); [releases][tanuki-rel].
- Mikage: [FAQ][mikage-faq]; ["Mikage Developer Edition"][mikage-dev] (2025-01-02); ["Good Bye, Friends"][mikage-bye]
  (2020-08-15, with its 2022 note);
  ["The unsung Heroes of 3DS Emulation"][mikage-heroes] (2024-01-23); and the README of `mikage-emu/mikage-dev`
  (closed, not linked).
- [ScarletNX README][scarletnx] (blob `e792f257`); [Corgi3DS README][corgi] (blob `a30664f5`); [3Beans README][3beans]
  (blob `9085a5de`); the READMEs of `jaklyy/vitaminc` and `plutooo/3dmoo` (closed, not linked).
- Emulation General Wiki, ["Nintendo 3DS emulators"][egw-3ds] (revision 152421, lead).

Frontends, apps, and stores:

- libretro documentation: [Azahar][lr-azahar], [Citra][lr-citra], [Panda3DS][lr-panda], [iOS guide][lr-ios]
  (all dated 2026-10-22).
- [Lemuroid on Google Play][lemuroid-play]; [Lemuroid on F-Droid][lemuroid-fd] (1.17.0); TASVideos,
  [BizHawk release history][tas-rel].
- [Folium on the App Store][folium-app] (2.2); [Folium repository][folium-gh]; [Cytrus repository][cytrus-gh];
  [Manic EMU on the App Store][manic-app] (2.0.2); [Manic EMU repository][manic-gh]; [Provenance wiki][provenance-wiki].
- [Azahar on Google Play][az-play]; [Azahar on Flathub][flathub-az], with Flathub's statistics API;
  captures of Citra's Play listing, 2024-02-28 and 2024-03-04 (observed).
- Apple, [App Review Guidelines][apple-guide] (last updated 2026-10-16).
- Wikipedia, ["Virtual Console"][w-vc] (revision 1386423035).

Law and Nintendo:

- Nintendo v Tropic Haze: [complaint][yuzu-complaint], [judgment][yuzu-judgment]
  (ECF 1 and 11; the joint motion as [R0-02](R0-02-legal-baseline.md) lists it).
- GitHub DMCA archive, [2016-12-27 Nintendo notice][freeshop], and its listing on the default branch.
- [PC Gamer, 2024-03-04][pcgamer] (secondary).
- Nintendo of Europe, [Nintendo 3DS Service User Agreement][eula]
  (version 05.2018); Nintendo UK, [support page on older games and Switch][ntd-switch].
- Free Software Foundation, [Various Licenses and Comments about Them][gnu-list].

References and tests:

- [crossbar9 README][crossbar9]; [Teakra README][teakra]; [3ds-examples README][3ds-examples];
  [polyrastertest README][polyraster]; [3DS input lag checker README][lag-checker].
- [3dbrew][3dbrew-hub] (main page only; raw export refused during research, answered on re-check;
  facts through R1-03 and R1-07).

Project documents:

- [R0-02](R0-02-legal-baseline.md); [R0-03](R0-03-licence-strategy.md); [R0-05](R0-05-source-map.md);
  [R1-02](R1-02-primer-32-and-64-bit.md); [R1-03](R1-03-primer-sixth-generation.md);
  [R1-07](R1-07-catalogue-sixth-generation.md);
  [ADR 0006](../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md);
  the [glossary](../../glossary/terms.md); the [research roadmap](../../roadmap/research.md);
  the [source register](../../../.claude/hooks/source-register.txt).

[3beans]: https://github.com/Hydr8gon/3Beans
[3dbrew-hub]: https://www.3dbrew.org/wiki/Main_Page
[3ds-examples]: https://github.com/devkitPro/3ds-examples
[apple-guide]: https://developer.apple.com/app-store/review/guidelines/
[az-2120]: https://github.com/azahar-emu/azahar/releases/tag/2120
[az-2124]: https://github.com/azahar-emu/azahar/releases/tag/2124
[az-2125-0-1]: https://github.com/azahar-emu/azahar/releases/tag/2125.0.1
[az-2125-1]: https://github.com/azahar-emu/azahar/releases/tag/2125.1
[az-2126-0]: https://github.com/azahar-emu/azahar/releases/tag/2126.0
[az-2126-1]: https://github.com/azahar-emu/azahar/releases/tag/2126.1
[az-2127]: https://github.com/azahar-emu/azahar/releases/tag/2127.0
[az-ai]: https://github.com/azahar-emu/azahar/blob/master/AI-POLICY.md
[az-beginning]: https://azahar-emu.org/blog/a-new-beginning
[az-compat]: https://github.com/azahar-emu/compatibility-list
[az-download]: https://azahar-emu.org/pages/download/
[az-fake]: https://azahar-emu.org/blog/fake-websites
[az-loading]: https://azahar-emu.org/blog/game-loading-changes
[az-one-year]: https://azahar-emu.org/blog/one-year-citra-takedown
[az-play]: https://play.google.com/store/apps/details?id=io.github.lime3ds.android
[az-releases]: https://github.com/azahar-emu/azahar/releases
[azahar]: https://github.com/azahar-emu/azahar
[azahar-site]: https://azahar-emu.org/
[azaharplus]: https://github.com/AzaharPlus/AzaharPlus
[borked3ds]: https://github.com/Borked3DS/Borked3DS
[citra-2015p1]: https://citra.azahar-emu.org/entry/citra-progress-report-2015-p1/
[citra-2019q1]: https://citra.azahar-emu.org/entry/citra-progress-report-2019-q1/
[citra-2023q1]: https://citra.azahar-emu.org/entry/citra-progress-report-2023-q1/
[citra-android]: https://citra.azahar-emu.org/entry/announcing-citra-android/
[citra-audio]: https://citra.azahar-emu.org/entry/accurate-audio-emulation/
[citra-download]: https://citra.azahar-emu.org/download/
[citra-end]: https://citra-emu.org/
[citra-faq]: https://citra.azahar-emu.org/wiki/faq/
[citra-mmj]: https://github.com/weihuoya/citra
[corgi]: https://github.com/psi-rockin/Corgi3DS
[crossbar9]: https://github.com/archshift/crossbar9
[cytrus-gh]: https://github.com/folium-app/Cytrus
[dynarmic]: https://github.com/azahar-emu/dynarmic
[egw-3ds]: https://emulation.gametechwiki.com/index.php/Nintendo_3DS_emulators
[eula]: https://www.nintendo.com/eu/terms/3ds/3DS_Shop_EULA/3DS-EULA-UK_EN-2018-05.html
[flathub-az]: https://flathub.org/apps/org.azahar_emu.Azahar
[folium-app]: https://apps.apple.com/us/app/id6498623389
[folium-gh]: https://github.com/folium-app/Folium
[fosdem-panda]: https://archive.fosdem.org/2024/events/attachments/fosdem-2024-1726-panda3ds-climbing-the-tree-of-3ds-emulation/slides/22561/Panda3DS_FOSDEM_o9U1196.pdf
[freeshop]: https://github.com/github/dmca/blob/master/2016/2016-12-27-Nintendo.md
[gnu-list]: https://www.gnu.org/licenses/license-list.html
[lag-checker]: https://github.com/PabloMK7/3ds_input_lag_checker
[lemuroid-fd]: https://f-droid.org/en/packages/com.swordfish.lemuroid/
[lemuroid-play]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[lime3ds-site]: https://lime3ds.github.io/
[lr-azahar]: https://docs.libretro.com/library/azahar/
[lr-citra]: https://docs.libretro.com/library/citra/
[lr-citra-gh]: https://github.com/libretro/citra
[lr-ios]: https://docs.libretro.com/guides/install-ios/
[lr-panda]: https://docs.libretro.com/library/panda3ds/
[mandarine-site]: https://mandarine3ds.github.io/
[manic-app]: https://apps.apple.com/us/app/id6743335790
[manic-gh]: https://github.com/Manic-EMU/ManicEMU
[mikage-bye]: https://mikage.app/good-bye-friends/
[mikage-dev]: https://mikage.app/deved-announcement/
[mikage-faq]: https://mikage.app/faq/
[mikage-heroes]: https://mikage.app/the-unsung-heroes-of-3ds-emulation/
[panda-v09]: https://github.com/wheremyfoodat/Panda3DS/releases/tag/v0.9
[panda3ds]: https://github.com/wheremyfoodat/Panda3DS
[ntd-switch]: https://www.nintendo.com/en-gb/Support/Nintendo-Switch/Can-I-Transfer-Games-from-Older-Consoles-and-Systems-to-Nintendo-Switch-1496748.html
[panda3ds-dl]: https://panda3ds.com/download
[panda3ds-faq]: https://panda3ds.com/faq

[panda3ds-site]: https://panda3ds.com/
[pcgamer]: https://www.pcgamer.com/software/nintendo-3ds-emulator-citra-taken-offline-as-collateral-damage-in-yuzu-settlement/
[polyraster]: https://github.com/Jaklyy/PolyRasterTest
[provenance-wiki]: https://wiki.provenance-emu.com/
[scarletnx]: https://github.com/scarletnx/ScarletNX
[tanuki]: https://github.com/burhanr13/Tanuki3DS
[tanuki-rel]: https://github.com/burhanr13/Tanuki3DS/releases
[tas-rel]: https://tasvideos.org/BizHawk/ReleaseHistory
[teakra]: https://github.com/wwylele/teakra
[w-citra]: https://en.wikipedia.org/w/index.php?oldid=1375255981
[w-vc]: https://en.wikipedia.org/w/index.php?oldid=1386423035
[yuzu-complaint]: https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf
[yuzu-judgment]: https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.11.0.pdf
