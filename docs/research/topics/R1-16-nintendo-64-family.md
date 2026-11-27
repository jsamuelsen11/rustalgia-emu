---
title: "Nintendo 64: family survey"
roadmap_item: R1-16
status: approved
date: 2026-11-26
---

# Nintendo 64: family survey

## Summary

This note asks which emulators matter for the Nintendo 64 and its 64DD disk drive, how each works,
what legal exposure the family carries, and how hard it is to emulate.

The family has two eras.
[Project64][pj64-gh] and [Mupen64Plus][m64p-core], both plugin-based and both under GPL-2.0 with no version stated,
are the base of most builds people install
(inference from stars and store counts):
Mupen64Plus reaches users through libretro cores and Android apps such as [M64Plus FZ][play-fz],
which has ten million or more installs.
A newer group runs the processors at the low level: [ares][ares-gh] and [CEN64][cen64] by their own pages,
and [gopher64][gopher64], written in Rust, by inference, with no per-game hacks by a user wiki (lead).
Most of the low-level emulators render with [paraLLEl-RDP][prdp]. ares and CEN64 are open tier; gopher64 is walled,
because it adapts Mupen64Plus code whose licence is unresolved.
Only ares and one closed-tier web emulator publish results, both against n64-systemtest,
whose successor's commits show hardware checks.

What matters most to Rustalgia is the boot path.
Retail cartridges are not encrypted, but each holds a lock-out chip (CIC) that every emulator must answer for,
and the code that answers it inside emulators is closed tier.
Rustalgia can boot games at a high level without firmware, but the lock-out chip's side has no clean source yet;
the note recommends measuring it on a console.

The open-tier evidence is good: the [N64brew][n64brew] wiki, open emulators to study by their prose and code,
and test suites whose expected values came from hardware.
The only enforcement against an N64 emulator found was a threat in 1999 against UltraHLE,
on copyright and circumvention grounds, that no court tested
(searched: the 1999 press, captures of Nintendo's legal FAQ, and R0-02's notice search);
Nintendo's later actions reached copier makers and the builds of a decompiled port.

The note recommends ares as the open study, gopher64 studied under walled rules until its licence is resolved,
hardware-backed suites as the oracles, a high-level boot with no firmware, 64DD support only from a dumped drive ROM,
and low-level accuracy with no per-game hacks; the owner decides.
This note is not legal advice.

## Scope

- Question: which Nintendo 64 emulators are popular or respected, and for each, what is its status, licence, tier,
  technique, and host; what legal exposure the family carries; and how hard it is to emulate?
- Covered: the Nintendo 64, the 64DD, and the Expansion, Controller, Rumble,
  and Transfer Paks where emulators model them; Nintendo's own emulators of the console;
  static recompilers as a boundary technique.
  The iQue Player is covered as a model of the family, as [R1-06][r106-boundary] places it.
  The Aleck64 arcade board belongs to [R1-25][surveys], as R1-06 says; ares supports it since v142
  ([v142 notes][ares-v142]) and ParaLLEl N64 has options for it ([documentation][lr-paralleln64]).
- Builds on: the hardware in [R1-02][r102]
  ("Processors", "Video", "Audio", "Media, protection, and firmware", "Tests and their oracles"),
  the rows in [R1-06][r106], the law in [R0-02][r002],
  and the hubs in [R0-05, "NES, SNES, Nintendo 64, and Virtual Boy"][r005-n64].
  None of that is repeated here.
- Researched on 2026-11-25.
  Repository status is GitHub metadata of that day: archived flag, last push, latest release, licence, and stars.
- How claims were checked, in three passes.
  Research: three agents each covered a slice
  (standalone emulators; multi-system projects, frontends, and apps; legal exposure and difficulty)
  and read every page as raw text with curl, a wiki's raw export, or the GitHub licence and README endpoints.
  Verification: three fresh verifiers
  (emulators; the other findings; links, shape, and register)
  fetched every source again as raw text and matched each quotation against it.
  Fix: each disputed claim was checked against its source again before it was changed, weakened, or kept.
  No emulator source file, issue, or pull request was opened, in any tier: emulators were read from prose only.

## Findings

### The emulators at a glance

Hosts are written Win, Mac, Lin, and And (Android), joined by slashes;
"libretro" means a core that runs in RetroArch and its relatives.
Each row's sources are in the paragraph that follows the table.

| Emulator | Tier | Release; last push | CPU | Signal; display processor | Boot | Hosts |
|---|---|---|---|---|---|---|
| [Project64][pj64-gh] | walled | 3.0.1, 2021-07-30; 2026-11-19 | both (memory) | plugins | no firmware | Win |
| [Mupen64Plus][m64p-core] | walled | 2.6.0, 2024-07-15; 2026-11-11 | 3 modes | plugins | none (memory) | Win/Mac/Lin |
| [Mupen64Plus-Next][lr-m64p] | walled | none; 2026-11-24 | 3 modes | HLE or LLE | no firmware | libretro |
| [ParaLLEl N64][lr-paralleln64] | walled | none; 2026-11-25 | 3 modes | HLE or LLE | no firmware | libretro |
| [ares][ares-gh] | open | v148, 2026-05-30; 2026-11-25 | recompiler | LLE; paraLLEl-RDP | none (memory) | Win/Mac/Lin |
| [gopher64][gopher64] | walled | v1.2.2, 2026-11-20; 2026-11-25 | unstated | unstated | unstated | Win/Mac/Lin/And |
| [simple64][simple64-cap] | walled | ended 2025; gone | lead: no recompiler | LLE; paraLLEl | "Fully LLE" | Win/Lin |
| [CEN64][cen64] | open | v0.3, 2017-02-11; 2025-10-26 | lead: no recompiler | LLE | PIF dump | Win/Lin |
| `dillonb/n64` | closed | nightly builds; not re-checked | both | LLE; paraLLEl-RDP | PIF optional | Win/Lin |
| `hulkholden/n64js` | closed | none; 2026-11-22 | both | HLE; LLE trial | unstated | web |
| [rokuyon][rokuyon] | open | rolling, 2026-06-14; 2026-06-14 | unstated | built in | no firmware | Win/Mac/Lin/Switch |
| [DaedalusX64][] | walled | 1.1.8, 2019-10-23; 2026-10-18 | ARM JIT | unstated | unstated | PSP/3DS/Vita/Lin/Mac |

"3 modes" means a pure interpreter, a cached interpreter, and a dynamic recompiler;
"both" means an interpreter and a recompiler; "unstated" means the prose read does not say;
"(memory)" marks a claim from memory.
The 64DD disk drive is supported, by the sources below, in Project64, Mupen64Plus, both libretro cores, ares, CEN64,
and BizHawk through Ares64; each that states a need asks for a dump of the drive's boot ROM
(the IPL). simple64 and gopher64 list only saves through the 64DD cartridge port, not the drive.

### Standalone emulators

**Project64** is the best-known Windows emulator, with 3,085 stars ([repository][pj64-gh], metadata).
Its README calls it "a free and open-source emulator for the Nintendo 64
and Nintendo 64 Disk Drive written in C++ currently only for Windows", and names five graphics plugins,
among them GLideN64, Angrylion's RDP Plus, and paraLLEl-RDP ([README][pj64-readme]).
Its licence file is the bare GPL version 2 text, with "or later" only in the FSF's how-to appendix, so it is walled.
GitHub lists no releases (observed); the last public release is 3.0.1, dated 2021-07-30 by [Wikipedia][w-pj64]
(tertiary), and newer builds are for Patreon supporters ([site][pj64-site]).
Wikipedia says it needs no BIOS and that 64DD support arrived in 2015, citing a closed site.

**Mupen64Plus** began as Hacktarux's Mupen64, was forked in 2007,
and in late 2009 re-designed its architecture around its plugin interface
([Wikipedia, "Mupen64Plus"][w-m64p], tertiary).
The core's licence file says it "is licensed under the GNU General Public License version 2", with no "or later",
while Wikipedia gives GPL-2.0-or-later; the file governs, so the core, the HLE signal-processor plugin,
and the command-line frontend are walled ([LICENSES][m64p-licenses]).
Its site lists "four MIPS R4300 CPU emulators, with dynamic recompilers for 32-bit x86 and 64-bit amd64 systems",
an ARM recompiler, and Rumble Pak support ([site][m64p-site]); its core chooses a pure interpreter,
a cached interpreter, or a recompiler ([Core Parameters][m64p-params]).
The frontend loads a Game Boy cartridge into an emulated Transfer Pak, and boots the 64DD only from a user's IPL dump:
"The IPL boot rom will execute first and select the disk" ([ui-console README][m64p-ui]).
The core's licence file also names a BSD-licensed file for the CIC-NUS-6105 lock-out chip by X-Scale,
which this note closes (see "Register re-check and tier calls").

**ares**, the multi-system emulator, rated its Nintendo 64 core at three stars in v124,
meaning "at least 80% of the game library is working" ([v124 notes][ares-v124]).
It added the 64DD in v130 ("Implement Nintendo 64DD emulation [Luigiblood]"),
and in the same release paraLLEl-RDP on macOS through MoltenVK ([v130 notes][ares-v130]).
It recompiles both the CPU and the signal processor
("rewrites to the N64 CPU & RSP JITs", [v148][ares-v148]),
and its site lists a debugger with trace logging, run-ahead, and rewind ([site][ares-site]).
In 2022 it reported passing 560 of 563 n64-systemtest tests
([v128 notes][ares-v128]; see "Tests and published results").
BizHawk calls its N64 core, Ares64, "accuracy-focused and acceptable on TASVideos" ([README][bizhawk]).
Its 64DD compatibility page lists the F-Zero X expansion as completable ([compatibility][ares-compat-dd]).
That ares boots cartridges without firmware and asks for the 64DD IPL is from memory. ares is open tier
(ISC, with MAME-derived parts under BSD-3-Clause) and has an emulator study, [R1-60][studies].

**gopher64** is written in Rust and is the newest of the group ([repository][gopher64]).
Its README lists rollback netplay, upscaling, cheats, and RetroAchievements.
It says it is "licensed under the GPLv3 license" and
that "Many portions of gopher64 have been adapted from mupen64plus and/or ares", which makes it walled
(see "Register re-check and tier calls").
Its wiki asks for a GPU with Vulkan 1.1 and a CPU with AVX2 or ARMv8.2-A
([System Requirements][gopher64-sysreq]),
and its options include dropping the memory "from 8MB to 4MB"
(the Expansion Pak),
the voice recognition unit, and a Transfer Pak fed a Game Boy image and its save ([options][gopher64-opts]).
A wiki for emulation users says it is by simple64's maintainer, written from scratch as simple64's successor,
uses no per-game hacks and no plugins, and supports 64DD saves through the cartridge port
([Emulation General Wiki, "Gopher64"][egw-gopher64] and ["Simple64"][egw-simple64]; leads).
That it runs the processors at the low level on paraLLEl-RDP is an inference from its Vulkan requirement.
It has 237,550 installs on Flathub and 500 or more on Google Play
([Flathub][flathub-gopher64]; [Google Play][play-gopher64]); [R1-67][studies] studies it.

**simple64** (formerly m64p) was "based on a heavily modified version of mupen64plus-core, and ParaLLEl RSP/RDP"
([site capture][simple64-cap], 2025-01-23).
It listed a "Fully LLE boot process", cache emulation, cycle timing with no per-instruction count setting,
voice recognition unit support, 64DD saves through the cartridge port,
and better synchronisation of the CPU and signal processor "important for homebrew titles".
Its repository and site are gone (API 404 and HTTP 404, research log).
The [Emulation General Wiki][egw-simple64] (lead) says it no longer has a recompiler,
that development stopped on 2025-02-14, and that its licence was GPLv3.
With no licence file to read, it is walled.

**CEN64** "aims for _perfect_ emulation by emulating the hardware inside of the Nintendo 64 itself,
down to the register-transfer level (RTL)", and needs "a valid pifdata.bin file", a dump of the console's boot ROM;
for 64DD games it also needs a dump of the drive's IPL and a disk image ([README][cen64]).
Its last release is v0.3 of 2017, so it is dormant.
A user wiki says it lacks a recompiler and that one branch uses Angrylion's MAME-derived video
([Emulation General Wiki, "CEN64"][egw-cen64]; lead).
krom's test programs name it as an emulator that runs them ([PeterLemon/N64][krom]).

**dgb-n64** (`dillonb/n64`, closed: no licence) is an experimental low-level emulator with an interpreter
and an x86-64 recompiler, paraLLEl-RDP for video, an optional PIF ROM, and a GDB stub;
its README says its signal processor was "Hardware-verified over the EverDrive 64's USB port using rsp-recorder",
and offers only builds made on every push (README endpoint, prose only).
The source guard blocks its metadata, so its last push was not re-checked.

**n64js** (`hulkholden/n64js`, closed: see below) runs in a browser with an interpreter and a JIT,
HLE graphics in WebGL with an experimental RDP, and says "Over 95% of n64-systemtest tests pass" (README, prose only).

**rokuyon** is "An experimental N64 emulator" for Windows, macOS, Linux, and Switch that needs no firmware
("No setup is required", inference),
runs only big-endian NTSC images, and accepts no pull requests ([README][rokuyon]); it is open.
Its one release is a rolling tag (release list, observed).

**DaedalusX64** continues Daedalus (from memory; GitHub does not mark it a fork), for "PSP, 3DS, Vita, Linux,
macOS and Windows"; its README notes a broken Windows build and an ARM recompiler for the 3DS ([README][daedalusx64]),
and its last release is 1.1.8 of 2019 (release list).
Its licence file is the bare GPL version 2 text, so it is walled.

### Plugins and components

- **paraLLEl-RDP** emulates the display processor "as accurately as possible using Vulkan compute",
  and is "written from scratch by studying Angrylion-Plus" ([README][prdp]).
  It says synchronising the GPU and CPU "is one of the hot button issues of N64 emulation"
  and leaves it outside its scope, and it upscales by 2, 4, or 8 times
  (same README; [ParaLLEl N64 documentation][lr-paralleln64]).
  Its build instructions pull in Angrylion-Plus as a submodule, so a checkout holds closed code (README).
  It is open (MIT); its last push was 2024-11-09.
- **paraLLEl-RSP** runs the signal processor at the low level with a recompiler;
  its licence file offers MIT or LGPL-3.0, so it is open, and it has no README ([LICENSE][prsp-lic]).
- **cxd4's RSP** (mupen64plus-rsp-cxd4) is a low-level signal-processor interpreter under CC0,
  so open ([repository][cxd4]); nothing from its README, which comes close to pseudo-code, is reproduced.
- **GLideN64** is the common HLE renderer, mostly by microcode, with high-resolution texture packs;
  its licence file says GPL version 2 with no "or later" and credits code "ported from" glN64, Glide64,
  and the z64 low-level plugin ([LICENSE][gliden64-lic]).
  It stays walled.
- **Angrylion RDP Plus** (`ata4/angrylion-rdp-plus`, closed) is a software low-level renderer
  that aims at "retaining the accuracy of the original plugin" and credits MAME developers
  for "an awesome N64 RDP reference software" (README, prose only).
  It is the oracle of paraLLEl-RDP's tests and is bundled in both libretro cores.
- **RT64** is a renderer for emulators and native ports with "High level of accuracy and no tolerance
  for game-specific workarounds", though its emulator plugin is "not available in this repository yet" ([README][rt64]).
  Its texture-memory loader was reverse engineered "by observing console behavior with the aid of homebrew test ROMs"
  (same README).

### Frontends, libretro cores, and apps

- **Mupen64Plus-Next** is libretro's main N64 core and the only N64 core offered on Steam ([Steam][steam-ra]; observed).
  Its documentation offers GLideN64 by default, Angrylion and paraLLEl-RDP, an HLE or LLE signal processor,
  and a per-instruction cycle count setting, the timing knob ([documentation][lr-m64p]).
  It reads 64DD disk images and loads Game Boy images through the Transfer Pak (same page).
  Its licence file is the bare GPL version 2 text while the documentation says "licensed under GPLv3",
  so it is walled ([LICENSE][m64pnx-lic]).
- **ParaLLEl N64** was "the first N64 emulator core available for libretro" and the testbed for paraLLEl-RDP
  and paraLLEl-RSP ([documentation][lr-paralleln64]).
  It offers a switchable Expansion Pak that Donkey Kong 64 and Majora's Mask need, a "64DD IPL" boot device, memory,
  rumble, and biosensor paks, video-interface filters, and a synchronous RDP mode; without that mode,
  games that read rendered frames back from memory break (same page).
  It has no licence file, and libretro's pages say GPLv2 on one page and GPLv3 on another, so it is walled.
- **Rosalie's Mupen GUI** (RMG) is "a free and open-source mupen64plus front-end" under GPL-3.0,
  at v0.9.1 of 2026-11-04, with 869,743 Flathub installs ([README][rmg]; [Flathub][flathub-rmg]).
  It bundles the Mupen64Plus core and plugins, by a user wiki (lead); those parts keep their own tiers.
- **BizHawk** runs Ares64 and Mupen64Plus; its 64DD support is Ares64's,
  and it emulates the Controller Pak and an installed Expansion Pak,
  with Rumble and Transfer Paks not yet fully supported ([TASVideos, "Bizhawk/N64"][tasv-n64], last edited 2023-09-22).
  Its README says Mupen64Plus is missing from the Linux build ([README][bizhawk]); it has a study, [R1-64][studies].
- **RetroArch** carries both libretro cores,
  with 5M+ Google Play installs and an App Store listing that names the Nintendo 64
  ([Google Play][play-ra]; [App Store][appstore-ra]).
- **Android**: M64Plus FZ, a closed app from the Mupen64Plus AE developer by its package name
  (from memory),
  has "10M+ Downloads" and "Contains ads", last updated 2024-04-02
  ([Google Play][play-fz]);
  Mupen64Plus AE itself is GPL-3.0, and its README offers it through F-Droid ([repository][m64pae]);
  Lemuroid uses Mupen64Plus-Next and has 5M+ installs ([README][lemuroid]; [Google Play][play-lemuroid]).
- **Apple platforms**: Delta runs Mupen64Plus through `rileytestut/n64deltacore` (closed: no licence)
  ([release notes][delta-notes]);
  Provenance ships Mupen64Plus-Next and ParaLLEl ([README][provenance]); OpenEmu
  (`openemu/openemu`, closed)
  uses Mupen64Plus ([site][openemu]). iOS apps lack a JIT, by an App Store review (lead),
  so they likely run interpreters (inference).
- **Web**: EmulatorJS uses Mupen64Plus-Next, and ParaLLEl N64 on iOS
  ([N64 page][ejs-n64]);
  its FAQ says a browser that disables WebAssembly JIT "switches to an interpreter,
  which is far slower" ([FAQ][ejs-faq]).
- **Parallel Launcher** wraps ParaLLEl N64 and claims "it's faster
  and more accurate than Project64", citing no test ([site][plauncher]).

### Historical and official emulators

- **UltraHLE** (1999), closed freeware, was the first to run commercial games at playable speed,
  by replacing calls to Nintendo's libraries with host code (Wikipedia "UltraHLE", lead: see below).
  Its authors pulled it within hours of release ([TechWeb][techweb]; [IGN64][ign64]).
  Its leaked source is never to be read ([R0-05][r005-n64]).
- **Project Unreality** (1998) was "the first Nintendo 64 emulator to successfully boot a commercial game"
  ([Wikipedia][w-unreality]).
- **1964** was a Windows emulator, and 1964js its JavaScript successor,
  which describes itself as "a traditional dynamic recompiler" generating JavaScript from blocks of MIPS code;
  Super Mario 64 is its one known working game ([1964 README][1964]; [1964js README][1964js]); both are walled
  (GPL-2.0 with no version).
- **Nemu64**, a closed Windows emulator known for its debugger, and **Corn** are from memory; nemu64-test,
  the successor of n64-systemtest ([R0-05][r005-tests]), is by Nemu64's author (from memory).
  **Sixtyforce**, a macOS emulator, has published no source since version 0.9.2, by a user wiki (lead), so it is closed.
- **Nintendo's own**: the GameCube Ocarina of Time runs the N64 game at double resolution ([Wikipedia][w-oot]);
  the Virtual Console dropped Controller Pak saves and Transfer Pak functions ([Wikipedia][w-vc]);
  Nintendo Switch Online, mostly by Nintendo European Research & Development,
  drew complaints of input lag and has no virtual Controller Pak
  ([Wikipedia][w-nso]; [Wikipedia, "Nintendo Classics"][w-classics]).
  Wikipedia says the Virtual Console's "gameplay experience is not always identical to the original".
- **iQue Player**: Wikipedia describes it as Nintendo 64 hardware on a single chip running ported games,
  which are "re-encrypted on first launch using a console-specific private key"
  ([Wikipedia][w-ique], the revision R1-06 read).
  No emulator read claims iQue support.

### Static recompilation and ports

- [N64Recomp][n64recomp] turns N64 binaries into C,
  but "the only way to provide the required metadata is by passing an elf file",
  most easily from "a disassembly or decompilation of the target binary" (README); R1-02 records the same.
- Zelda 64: Recompiled (`zelda64recomp/zelda64recomp`, closed) says "It is not an emulator" and uses "headers
  and some functions from the decompilation project"; Ship of Harkinian
  (`harbourmasters/shipwright`, closed)
  builds "on the source code provided by the OOT decompilation project" (READMEs, prose only).
  Both are ports that carry decompiled game code (inference).

### Techniques across the family

- **HLE against LLE is the family's dividing line.**
  The older emulators and both libretro cores replace known microcode by default and offer low-level plugins
  as an option ([Mupen64Plus-Next][lr-m64p]; [ParaLLEl N64][lr-paralleln64]).
  ParaLLEl N64's documentation says HLE audio "glitches in some games",
  and Mupen64Plus-Next's that LLE "should be more precise but it requires more computational power"
  (same pages). ares, simple64, CEN64, and dgb-n64 run the signal processor at the low level (sources above).
- **Game-specific hacks remain in the older line**: a TLB hack for GoldenEye in ParaLLEl N64,
  which its page says the accurate path now matches in speed on desktop-class hosts
  ([ParaLLEl N64][lr-paralleln64]), and a per-game graphics fallback in Delta ([release notes][delta-notes]).
  The newer line removed them: simple64 did so in 2022 by a user wiki, and gopher64 uses none
  ([Emulation General Wiki][egw-simple64] and [its Gopher64 page][egw-gopher64]; leads).
- **Timing**: Mupen64Plus-derived cores fix a count of cycles per instruction,
  which simple64 dropped for "Much more accurate CPU, RSP and interrupt cycle timing" ([capture][simple64-cap]).
  No emulator read states its scheduling granularity in clock cycles.
- **Synchronisation of the CPU and the GPU renderer** is a stated hazard: paraLLEl-RDP leaves it to the emulator,
  and ParaLLEl N64 names Resident Evil 2 as a game that fails without waiting at the display processor's full sync
  ([README][prdp]; [ParaLLEl N64][lr-paralleln64]).
- **Recompilers** target x86, x86-64, ARM, and JavaScript hosts, and the signal processor in ares and paraLLEl-RSP;
  CEN64 and simple64 have none, by their Emulation General Wiki pages (leads).
- **Firmware**: most emulators boot cartridges with no firmware, reproducing the boot's result
  (libretro's BIOS page lists no N64 entry, [BIOS hub][lr-bios]).
  That does not remove the lock-out chip: games with the CIC-NUS-6105 still expect its answers
  (R1-02, "Media, protection, and firmware"), with a dumped PIF too, since the CIC is in the cartridge (inference).
- **Enhancements**: upscaling in paraLLEl-RDP, GLideN64, RT64, gopher64, and n64js; texture packs in GLideN64 and RT64;
  widescreen, overclocking, and rewind in gopher64 ([options][gopher64-opts]); run-ahead
  and rewind in ares ([site][ares-site]).
- **Peripherals**: Controller and Rumble Paks are common; the Transfer Pak needs a Game Boy core
  (Mupen64Plus, Mupen64Plus-Next, gopher64; sources above).

### Tests and published results

| Suite | Tier | What it covers | Oracle |
|---|---|---|---|
| [nemu64-test][nemu64test], once n64-systemtest | open, MIT | CPU, CP0, TLB, exceptions, RSP | hardware, by commits |
| [n64-cpu-tests][thar0-cpu] | open, CC BY-SA 4.0 | VR4300 instructions | "generated by running the test on hardware" |
| [rdp-timing-tests][thar0-rdp] | open, MIT | display processor fill rates | a console over USB |
| [rsp_inval_instrs][rsp-inval] | open, Unlicense | invalid RSP instructions | "real N64 hardware" |
| [n64-integermuldiv-test][thar0-muldiv] | open, CC0 | multiply and divide edge cases | not stated |
| [krom's programs][krom] | open, Unlicense | CPU, RSP, and RDP demos | run on a console; no expected values stated |
| paraLLEl-RDP validation | open, MIT | about 150 display processor fuzz tests | Angrylion, a closed emulator |

- nemu64-test's README does not state its oracle; its commits do,
  for example one that fixes an expectation found wrong because of "a bug in the EverDrive64" (`ec4279a`)
  and one adding a level "for tests which document behavior of the hardware" (`09a9f77`)
  ([commits][nemu64test-commits]).
  It boots with libdragon's open boot code, which is closed tier as system software; running it is allowed.
- krom's README calls the repository "N64 Bare Metal Code" and its programs demos,
  which its author runs only "with a real N64 using a 64drive Cartridge"; with no stated expected values,
  they show behaviour on a console but are not a suite with an oracle (inference).
- `rasky/n64-systemcrash` (a test for console crashes) and `hacktarux/n64-systembench`
  (no README)
  have no licence, so they are closed; running them and using the results is allowed
  ([ADR 0006, "Closed tier"][adr6-closed]; [test software][adr6-kinds]).
- No SingleStepTests set exists for the VR4300 or the signal processor; its MIPS set is for the PlayStation's R3000
  (organisation listing, observed).
- Published results: ares v128 reported "Tests: 563.
  Failed: 3" on [n64-systemtest][n64systemtest], in results dated 08/05/2022 on the page, and,
  prefaced as the author's belief, claimed to be "the most accurate Nintendo 64 emulator at the time of publication"
  ([v128 notes][ares-v128]; self-reported, pinned to v128 only). n64js claims over 95% of the same suite, with no count.
  No result was found for the other emulators (searched: their READMEs, sites, wikis, and the user wiki pages).
  A user wiki page that lists ares, gopher64, and dgb-n64 for testing has an empty results section
  (Emulation General Wiki, `User:Sczther/N64_Tests`, lead; not linked, see Sources).

### How hard the family is to emulate

[R1-02][r102] describes the processors, the video and audio paths, and the boot.
The N64brew pages read for this note, at the revisions in Sources, which match R1-02's where it read the same page,
add these points:

- **CPU timing depends on encoding, not on true dependencies**:
  the VR4300 stalls one cycle after a load whenever the next instruction "appears to use the result",
  including cases with no real dependency ([N64brew, "VR4300"][n64-vr4300], "Load Delay Interlock").
  Its multiplication bug affects "generally NUS-01 (Japan Only), NUS-02 (Japan Only), NUS-03 (First US Revision)" boards
  (same page), so the board revision modelled matters (inference).
- **Memory timing depends on open rows**:
  each 1 MiB RDRAM bank keeps one 2 KiB row open and the interface tracks bank state, for the bottom 8 MiB only
  ([N64brew, "RDRAM Interface"][n64-ri], "Bank Status Tracking").
  Reads outside the fitted chips return zero,
  except for a repeating pattern of register values that the page says is the same on more than one console,
  though not compared widely (a hardware observation).
- **The processors compete for memory**: when the display processor and the video interface ask at once,
  "RDRAM will service the VI request first", and display throughput drops with video on ([rdp-timing-tests][thar0-rdp]).
- **The cartridge bus misbehaves on misaligned DMA**, in ways the page likens to a half-finished design,
  and open-bus reads return the low address bits ([N64brew, "Parallel Interface"][n64-pi]).
  ParaLLEl N64 notes that the accurate alignment breaks some ROM hacks ([documentation][lr-paralleln64]).
- **Invalid signal-processor instructions change state**: where they were thought to do nothing,
  "architectural state change is observed" ([rsp_inval_instrs][rsp-inval]).
- **Controller and accessory traffic is slow and serial**:
  a 64-byte PIF RAM read waits for the PIF's firmware to run the whole exchange
  ([N64brew, "Serial Interface"][n64-si]);
  the Controller Pak's file system is implemented in software by Nintendo's kit,
  and third-party 256 KiB and 512 KiB paks switch banks ([N64brew, "Controller Pak"][n64-cpak]).
- **Facts from the boot code are not recorded**:
  N64brew's RDRAM page gives the memory start-up order and the Expansion Pak check "as implemented in IPL3"
  and links a disassembly of it (`decompals/n64-ipl`, closed, not opened)
  ([N64brew, "RDRAM"][n64-rdram]); [ADR 0006][adr6-every] keeps such facts out until a hardware test confirms them.

The family is harder than its 1999 debut suggests
(inference from the points above):
high-level emulation ran games early, but the low-level path needs three processors kept in step,
memory timing that depends on access history, and a renderer that must hand frames back to the CPU.

### Legal exposure

- **Encryption and lock-out**: retail cartridges are memory-mapped
  ([N64brew, "Memory map"][n64-memmap]),
  and unencrypted (inference: the map reads the ROM directly);
  the CIC is an authentication chip in front of readable code ([R1-02][r102]).
  [R0-02 option 1][r002-o1] applies, and so does its finding
  that no § 1201 decision covers a cartridge-era lock-out chip
  ([R0-02, "Which systems the claims concern"][r002-which]).
  Lexmark's reasoning about code that anyone "may read" from memory is the closest US analogy for the CIC
  (inference; [R0-02, "How courts have read it"][r002-courts]).
  The iQue Player's per-console encryption falls under options 2 and 3 instead.
- **Nintendo's statements of 1999 and 2000**: a spokesperson told IGN64 that "Bottom line,
  emulators are illegal" and that the N64 emulator "infringes on Nintendo's intellectual property rights including
  copyrights and circumvents Nintendo's Anti-piracy Security System" ([IGN64][ign64]).
  Nintendo's legal FAQ said "The UltraHLE is illegal" and that it "circumvents Nintendo's anti-piracy security system"
  ([Nintendo, legal FAQ, 2000 capture][noa-faq2000]);
  the [2003][noa-faq2003] and [2017][noa-faq2017] versions no longer name UltraHLE (observed).
  UltraHLE's author answered that they "only emulated core processor technology" ([The Register][reg-boycott]).
  No suit or court record was found (searched: the 1999 press above and the FAQ captures);
  a student project of March 1999 says Nintendo decided not to sue ([Stanford CS201][stanford]; lead).
  These add an N64 entry to [R0-02, "Makers' statements on emulators"][r002-makers]:
  the theory against an emulator of unencrypted games, on copyright and circumvention, predates October 2000,
  when § 1201's ban on the act took effect (from memory), and was never tested.
- **Copiers, not emulators, were sued**:
  a US federal court entered judgment for Nintendo against the maker of the Doctor V64 in 1999,
  after what the release calls Bung's "repeated abuses of the discovery process",
  and awarded "more than $7 million in damages", on copyrights, trade marks, and patents
  ([Nintendo press release][noa-bung], the maker's own account; [Wikipedia, "Bung Enterprises"][w-bung]).
- **Decompiled ports**: in May 2020 a law firm acting "at least in part"
  for Nintendo reportedly had download links of the Super Mario 64 PC port removed as "an unauthorized derivative work",
  and videos received copyright claims; some complaints failed
  (notice text through TorrentFreak, as [Nintendo Life][nlife-sm64] reports it; secondary).
  The decompilation repositories themselves are still up
  (metadata; [R0-02, "What the notices allege"][r002-notices]),
  and the October 2026 notice against a Game Boy Advance decompilation used § 512 alone,
  answering "No" to whether it claims access controls ([notice][dmca-2026]).
  No new search of GitHub's notice archive was made: searching inside a repository is outside this survey's process,
  and R0-02's search did not name the N64 emulators ([R0-02, "Who has been reached"][r002-who]).
- **Firmware**: the PIF's two boot stages are Nintendo firmware; IPL3 sits in every game image the user supplies,
  so an emulator ships none ([N64brew, "ROM Header"][n64-header]); the 64DD's IPL is in the drive
  ([N64brew, "64DD"][n64-64dd]).
  [R0-02 option 4][r002-o4] covers dumped PIF and IPL images, and [option 5][r002-o5] a high-level boot.
  The 64DD was sold only in Japan ([R1-06][r106]), so [R0-02, "Japan"][r002-japan] is the second jurisdiction
  for it (inference).
- **Boot logos**: no page read describes a logo drawn or checked by the boot, so [option 16][r002-o16] has little to do.
- **Maker material inside emulators**:
  n64js says its HLE audio is "derived from captured RSP disassembly and libultra headers";
  libultra is part of Nintendo's development kit, which a 2026 notice calls "proprietary and confidential"
  ([R0-02, "What the notices allege"][r002-notices]).
  The ports above carry decompiled game code, the shape of the 2026 notice.
- **Money**: M64Plus FZ carries ads, Provenance sells a subscription, and both libretro cores bundle Angrylion,
  under old MAME non-commercial terms by its register line ([R0-02 option 8][r002-o8]; inference for paid builds).
- **Licence mixes**: gopher64 states GPLv3 for a work
  that adapts Mupen64Plus code whose file grants GPL version 2 with no "or later"; if those parts are GPL-2.0 only,
  the combination cannot be distributed under GPLv3
  (inference from the licences), which is a risk for gopher64 and for any project that learns from it.
- **Stores**: Apple's guideline 4.7 lets emulators download games but makes the developer responsible for them
  ([App Review Guidelines][apple-guide]).
  No removal of an N64 emulator from a store was found (searched: the listings named above).
- **Names**: "64" and "N64" appear in many project names, and "Zelda" in one
  ([R0-02 options 14][r002-o14] and [15][r002-o15]);
  no complaint was found (searched: the press above and R0-02's notice search).
- **Patents**: R0-02 found in-force patents titled on recompiling old games ahead of time,
  which bear on static recompilation ([R0-02, "Patents on emulation"][r002-patents]).

### Register re-check and tier calls

Every emulator this note covers was checked against the [register][register].
Two existing lines change:

- gopher64 moves from open to walled:
  it states GPLv3 but adapts Mupen64Plus code under GPL version 2 with no version rule,
  "a mix the project has not resolved"
  ([ADR 0006, "Walled tier"][adr6-walled]), and the adapted parts cannot be told apart without reading code.
- GLideN64's licence field changes from "not determined" to GPL-2.0 with no version stated, by its licence file;
  it stays walled.

Angrylion RDP Plus's licence endpoint still returns 404, as R0-05 recorded, and it stays closed.
The nemu64-test line names no oracle, which ADR 0006 asks for; it should read "oracle hardware, by commits",
but this survey changes only lines whose licence or tier changed, so it is left for the owner.

Process calls settled and applied:

- Bare GPL version 2 text, or "version 2" alone, is walled: Project64, Mupen64Plus and its plugins, Mupen64Plus-Next,
  1964, 1964js, DaedalusX64; Wikipedia's "or later" does not override a project's file.
  ParaLLEl N64, with no file but two libretro statements, is walled, not closed.
- A licence header inside a source file is not prose
  ([ADR 0006, "Terms"][adr6-terms]):
  reading it opens the file, so for walled repositories it waits for a reader session.
- n64js is closed: its audio derives from a disassembly of maker microcode that ships in games,
  the closed test for a disassembly of a game
  ([ADR 0006, "Closed tier"][adr6-closed]),
  and it admits maker headers, to which the rule for a library admitting maker code
  ([ADR 0006, "Sources that are not emulators"][adr6-kinds]) is applied here as a process call.
  Its parts cannot be separated without reading code.
- The Mupen64Plus core's CIC-NUS-6105 file is closed as replacement code for a chip's firmware;
  forks probably carry it (inference),
  but finding the paths needs a code search. libdragon's boot folder is closed as replacement boot code,
  by the first-wave precedent, at its default branch, trunk.
- Bundled parts keep their tiers inside an open repository
  (RMG, Mupen64Plus AE, paraLLEl-RDP's Angrylion submodule, which the Angrylion line already blocks).
  EmulatorJS stays open, by R1-15's line. simple64, whose repository is gone,
  is walled on a wiki's word that it was GPLv3.
- Closed as a precaution, unlinked, their facts leads:
  Wikipedia's "UltraHLE" and the user wiki's "Nintendo 64 emulators", which mention leaked source and documentation
  (the `Oman archive`);
  the user wiki's `User:Sczther/N64_Tests`, which links a presumed maker ROM and a file download;
  and an Internet Archive item listed as an N64 test cartridge.
  The user wiki's Project64 page (leaked beta builds) and Wikipedia's Switch Online page
  (a leaked playtest) stay open under the first-wave precedent.
- Per-CIC seed values and the 6105 answer are treated as key material, not recorded or read.
- Guard blocks were recorded, not worked around: in research, the Project64 and GLideN64 release lists,
  the gopher64 wiki's raw path, and a raw ParaLLEl N64 README path
  (read instead through the README endpoint); in verification and fixing, the metadata and release list of dgb-n64.
  The release lists of RMG and the Mupen64Plus core passed through the quoting gap R0-05 records (research log).

## Options and trade-offs

### Study ares, and gopher64 under walled rules

- **What:** keep [R1-60][studies] on [ares][ares-gh] as an open study,
  and read [gopher64][gopher64] in [R1-67][studies] from prose, or in a reader session, until its licence is settled.
- **Costs:** a walled study learns less from code.
- **Gains:** ares is open, publishes a test result, and is BizHawk's accuracy core; gopher64 is the Rust emulator.
- **Used by:** [BizHawk][bizhawk] and TASVideos accept Ares64 alone for N64 records.

### Add a study of paraLLEl-RDP and paraLLEl-RSP

- **What:** one study of [paraLLEl-RDP][prdp] and [paraLLEl-RSP][prsp-lic], both open.
- **Costs:** a research pass on dense GPU and recompiler code.
- **Gains:** they are the low-level display and signal processors most low-level emulators borrow.
- **Used by:** ares, simple64, and dgb-n64 (RDP); simple64 and both libretro cores (RSP).

### Hardware-backed suites as the oracles

- **What:** [nemu64-test][nemu64test], [thar0's suites][thar0-cpu], and [rsp_inval_instrs][rsp-inval].
- **Costs:** no suite publishes expected display output from hardware, beyond [timing][thar0-rdp].
- **Gains:** the CPU and signal processor are tested against the console.
- **Used by:** ares ([v128 notes][ares-v128]).

### Agreement with Angrylion for pixels

- **What:** compare display output with Angrylion's.
- **Costs:** ties correctness to a closed emulator, which may be run but not read.
- **Gains:** covers pixels.
- **Used by:** paraLLEl-RDP.

### A high-level boot with no firmware

- **What:** reproduce the state the boot leaves ([R0-02 option 5][r002-o5]).
- **Costs:** must match every observable effect; the CIC still needs answers.
- **Gains:** needs nothing from Nintendo.
- **Used by:** most emulators.

### The user's PIF dump

- **What:** run a PIF ROM the user dumps ([R0-02 option 4][r002-o4]).
- **Costs:** puts firmware in the user's hands; the CIC still needs answers.
- **Gains:** runs the real code.
- **Used by:** CEN64 (required) and dgb-n64 (optional).

### Measure the lock-out chip on a console

- **What:** measure the CIC's answers on a console the project owns, with a flash cartridge and a test program.
- **Costs:** hardware, and an owner ruling that values Rustalgia observes may enter code.
- **Gains:** the project's own observation of running a program ([ADR 0006][adr6-closed]).
- **Used by:** none found.

### Leave CIC-NUS-6105 games unsupported

- **What:** run only games whose chip needs no computed answer.
- **Costs:** drops titles such as Ocarina of Time (from memory).
- **Gains:** no risk and no hardware.
- **Used by:** none found.

### 64DD from the user's IPL dump

- **What:** run a drive IPL the user dumps.
- **Costs:** a dump has no settled lawful path ([R0-02, "Firmware and back-up copies"][r002-fw]).
- **Gains:** Rustalgia ships nothing of Nintendo's.
- **Used by:** every emulator that states a 64DD need.

### Leave the 64DD out

- **What:** cartridges only; an own IPL is set aside, since no page read describes it well enough.
- **Costs:** drops about ten Japanese titles (from memory).
- **Gains:** costs nothing.
- **Used by:** none found among the emulators read.

### Low-level processors with no per-game hacks

- **What:** low-level signal and display processors with cycle timing.
- **Costs:** a GPU renderer or much host time, and careful CPU and GPU synchronisation.
- **Gains:** runs homebrew and unusual microcode.
- **Used by:** ares, simple64, CEN64, and gopher64 (inference).

### High-level microcode with per-game settings

- **What:** replace known microcode with host code and keep per-game settings.
- **Costs:** breaks games with their own microcode.
- **Gains:** runs on weak hosts.
- **Used by:** [Project64][pj64-gh], [Mupen64Plus][m64p-core], and the libretro defaults.

### Recommendation

- **Studies:** keep ares as an open study and gopher64 as a walled one,
  and add one study of paraLLEl-RDP and paraLLEl-RSP.
  Read Project64 and Mupen64Plus from prose only, for hosts and features;
  their prose lists no feature that the open emulators lack (inference from the Findings).
- **Oracles:** adopt the hardware-backed suites, starting with nemu64-test and thar0's suites,
  and use agreement with Angrylion only as a cross-check for pixels, run and never read.
- **Boot:** boot cartridges at a high level with no firmware by default,
  and accept a user's PIF dump later as an accuracy path.
  For the lock-out chip, add a hardware spike like [R5-12][phase5] for the Nintendo 64,
  and ask the owner whether values Rustalgia measures itself may go into code; until then,
  leave CIC-NUS-6105 games unsupported.
- **64DD:** treat it as a later add-on that runs only from a user's IPL dump.
- **Accuracy:** follow [R1-02][r102]: low-level processors, no per-game hacks,
  and enhancements such as upscaling only as opt-in modes of a low-level renderer.

## Implications for Rustalgia

- The boot path needs an owner ruling on measured lock-out values; it feeds [R2-12][phase2] and an ADR on firmware.
- A Nintendo 64 hardware spike belongs beside [R5-12][phase5] in phase 5, and needs a console, a flash cartridge,
  and USB output, as dgb-n64's and [thar0's tests][thar0-rdp] used.
- The core's renderer interface must let the CPU wait for the display processor and read frames back,
  which [paraLLEl-RDP][prdp] leaves to the emulator; this feeds R2-05 (3D hardware and GPU-backed rendering) and R2-03
  (timing and scheduling) in [phase 2][phase2].
- The Transfer Pak couples this core to the Game Boy core ([R1-10][surveys]),
  so the core boundary must allow one system to host another; this feeds R2-10
  (the boundary between core and frontend) and R2-13 (input and peripherals).
- If iOS builds run without a JIT, as a lead says and [R3-01][phase3] will settle,
  an interpreter for both the CPU and the signal processor must reach speed on its own.
- The register gains the lines this note drafts, including closed lines for the CIC file, libdragon's boot folder,
  and the precautionary pages, and gopher64 moves to walled.

## Open questions

- What does a retail boot leave in observable memory and registers,
  and what does the CIC-NUS-6105 return to chosen challenges?
  A hardware spike on a console the project owns would answer it.
- Do the Mupen64Plus core's file headers grant "or later",
  and which version do the parts adapted into [gopher64][gopher64], [RMG][rmg], and [Mupen64Plus AE][m64pae] carry?
  This decides the tier of Mupen64Plus and of gopher64.
  A reader session ([ADR 0006, "Walled tier"][adr6-walled]) on the Mupen64Plus core, or a statement from either project,
  would answer it; RMG and Mupen64Plus AE are open, so R1-67 or a later study can read their headers directly.
- Can the iQue Player run any title without its per-console keys?
  No source read says, and no emulator claims iQue support; a hardware spike on an iQue Player, in phase 5,
  would answer it, and [R0-02][r002] holds the exposure.

## Sources

Every source below was read on 2026-11-25 unless stated.
GitHub repositories were read through their README and licence files and metadata of that day;
the pin given is the last push.

Emulators and components:

- [Project64 repository][pj64-gh] (push 2026-11-19), [README][pj64-readme] (branch develop), and [site][pj64-site].
- [mupen64plus-core][m64p-core] (push 2026-11-11) and its [LICENSES][m64p-licenses];
  [mupen64plus-ui-console README][m64p-ui] (push 2026-06-23); [mupen64plus-rsp-hle][m64p-rsphle]
  (push 2026-11-11);
  [cxd4's RSP][cxd4] (push 2026-11-21); [Mupen64Plus site][m64p-site] and its [Core Parameters][m64p-params] wiki page
  (revision 63).
- [ares repository][ares-gh] (push 2026-11-25), [site][ares-site], release notes [v124][ares-v124], [v128][ares-v128],
  [v130][ares-v130], [v142][ares-v142], and [v148][ares-v148]; [64DD compatibility][ares-compat-dd].
- [gopher64 repository][gopher64] (v1.2.2, push 2026-11-25) and its wiki pages ["System Requirements"][gopher64-sysreq]
  and ["Explanation of options"][gopher64-opts].
- [simple64 site, capture of 2025-01-23 19:34:57][simple64-cap].
- [CEN64][cen64] (v0.3, push 2025-10-26); [rokuyon][rokuyon] (push 2026-06-14); [DaedalusX64][daedalusx64]
  (1.1.8, push 2026-10-18); [1964][1964] (push 2022-11-27); [1964js][1964js] (push 2025-09-27).
- [paraLLEl-RDP README][prdp] (push 2024-11-09); [paraLLEl-RSP licence][prsp-lic]
  (push 2026-05-11); [GLideN64 licence][gliden64-lic] (push 2026-10-11); [RT64][rt64] (push 2026-11-05).
- [Rosalie's Mupen GUI][rmg] (v0.9.1); [Mupen64Plus AE][m64pae]
  (push 2026-08-28);
  [Lemuroid][lemuroid] (1.17.0); [EmulatorJS N64 page][ejs-n64] and [FAQ][ejs-faq]; [Parallel Launcher][plauncher].
- [BizHawk README][bizhawk] (push 2026-11-22); [TASVideos, "Bizhawk/N64"][tasv-n64], last edited 2023-09-22.
- [Delta release notes][delta-notes] (2.0.2 of 2026-11-23); [Provenance README][provenance]
  (push 2026-11-25); [OpenEmu site][openemu].
- libretro documentation: [Mupen64Plus-Next][lr-m64p] and [ParaLLEl N64][lr-paralleln64], both last updated 2026-10-22;
  [BIOS hub][lr-bios]; [Mupen64Plus-Next licence file][m64pnx-lic] (branch develop, push 2026-11-24).
- [N64Recomp][n64recomp] (push 2026-11-03).

Prose of closed repositories, read but not linked: `dillonb/n64`, `hulkholden/n64js`, `ata4/angrylion-rdp-plus`,
`openemu/openemu`, `rileytestut/n64deltacore`, `zelda64recomp/zelda64recomp`, `harbourmasters/shipwright`,
`rasky/n64-systemcrash`, and `hacktarux/n64-systembench`, all on GitHub.

Stores:

- Google Play: [gopher64][play-gopher64], [M64Plus FZ][play-fz], [RetroArch][play-ra], [Lemuroid][play-lemuroid].
- [App Store, RetroArch][appstore-ra]; [Steam, RetroArch][steam-ra]; Flathub:
  [RMG][flathub-rmg] and [gopher64][flathub-gopher64].
- Apple, [App Review Guidelines][apple-guide], last updated 2026-10-16.

Tests:

- [nemu64-test][nemu64test] and its [commits][nemu64test-commits] (push 2026-09-08); [n64-systemtest][n64systemtest]
  (push 2026-07-21); [krom's programs][krom] (push 2026-02-01).
- thar0's [n64-cpu-tests][thar0-cpu] (push 2024-10-09), [rdp-timing-tests][thar0-rdp]
  (push 2026-08-01),
  and [n64-integermuldiv-test][thar0-muldiv] (push 2024-11-18); [rsp_inval_instrs][rsp-inval] (push 2024-11-18).

N64brew, raw exports at the revisions given: ["VR4300"][n64-vr4300] 5928, ["RDRAM"][n64-rdram] 5529,
["RDRAM Interface"][n64-ri] 5302, ["Parallel Interface"][n64-pi] 5761, ["Serial Interface"][n64-si] 5663,
["Memory map"][n64-memmap] 5763, ["64DD"][n64-64dd] 5543, ["Controller Pak"][n64-cpak] 5635,
["ROM Header"][n64-header] 5943.

Wikipedia, raw wikitext at the revisions given: ["Project64"][w-pj64] 1336922933; ["Mupen64Plus"][w-m64p] 1383602525;
["Project Unreality"][w-unreality] 1337974354; ["Virtual Console"][w-vc] 1386423035;
["Nintendo Switch Online"][w-nso] 1384839693; ["Nintendo Classics"][w-classics] 1387538380;
["The Legend of Zelda: Ocarina of Time"][w-oot] 1387622260; ["iQue Player"][w-ique] 1355022059;
["Bung Enterprises"][w-bung] 1379050989.

Emulation General Wiki, raw text, leads only: ["Simple64"][egw-simple64] revision 138952, ["CEN64"][egw-cen64] 135251,
["Gopher64"][egw-gopher64] 152077.

Press and history:

- [TechWeb, "Nintendo May Sue Emulator Makers"][techweb], 1999-02-02, capture of 1999-05-02 23:04:34.
- [IGN64, "Emulating Mario"][ign64], 1999-01-29, capture of 2002-02-23 04:58:11.
- [The Register, "Nintendo legal rumblings provoke boycott call"][reg-boycott], 1999-02-08.
- Nintendo of America: [legal FAQ][noa-faq2000], capture of 2000-06-20 22:12:41; its [2003 version][noa-faq2003],
  capture of 2003-06-21 21:53:34; its [2017 version][noa-faq2017], capture of 2017-01-01 22:59:39;
  [press release of 1999-12-23][noa-bung], capture of 2000-03-03 02:33:56.
- [Stanford CS201, "Emulation Lawsuits: Past and Present"][stanford], a student project of March 1999, a lead.
- [Nintendo Life, "Nintendo Cracks Down On The Super Mario 64 PC Port"][nlife-sm64], 2020-05-09;
  [GitHub notice of 2026-10-23][dmca-2026].

Not opened or not linked, with the reason:

- Wikipedia's "UltraHLE" (`https://en.wikipedia.org/wiki/UltraHLE`, revision 1330735054)
  and the Emulation General Wiki's "Nintendo 64 emulators"
  (`https://emulation.gametechwiki.com/index.php/Nintendo_64_emulators`, revision 152404)
  were read and are closed as a precaution because they mention leaks;
  their `index.php?title=` forms are not to be opened either.
- The Emulation General Wiki's `User:Sczther/N64_Tests`
  (revision 120751) was read and is closed as a precaution, because it links a presumed maker ROM and a file download.
- The Mupen64Plus core's CIC file (`src/memory/n64_cic_nus_6105.c` in `mupen64plus/mupen64plus-core`), closed.
- `decompals/n64-ipl`, a boot code disassembly linked from N64brew; `archive.org/details/n64_testcart`,
  a presumed maker ROM; N64brew's "PIF-NUS", "CIC-NUS", and "Initial Program Load" pages, closed by R1-02.
  None was opened.
- The Northwestern Journal of Technology and Intellectual Property paper on UltraHLE (2004) refused the fetch
  (HTTP 403, research log), so nothing rests on it.

Project documents: the [research roadmap][roadmap]; [R0-02][r002]; [R0-05][r005-n64]; [R1-02][r102]; [R1-06][r106];
[ADR 0006][adr6]; the [source register][register].

[r002]: R0-02-legal-baseline.md
[r002-which]: R0-02-legal-baseline.md#which-systems-the-claims-concern
[r002-courts]: R0-02-legal-baseline.md#how-courts-have-read-it
[r002-makers]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r002-notices]: R0-02-legal-baseline.md#what-the-notices-allege
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r002-japan]: R0-02-legal-baseline.md#japan
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r002-patents]: R0-02-legal-baseline.md#patents-on-emulation
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o8]: R0-02-legal-baseline.md#8-take-money-or-not
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o15]: R0-02-legal-baseline.md#15-use-no-maker-logos-or-game-imagery-or-use-them-under-a-stated-position
[r002-o16]: R0-02-legal-baseline.md#16-handle-boot-logos-by-drawing-what-the-game-supplies-or-by-drawing-none
[r005-n64]: R0-05-source-map.md#nes-snes-nintendo-64-and-virtual-boy
[r005-tests]: R0-05-source-map.md#test-suites-and-test-vectors
[r102]: R1-02-primer-32-and-64-bit.md
[r106]: R1-06-catalogue-32-and-64-bit.md
[r106-boundary]: R1-06-catalogue-32-and-64-bit.md#boundary-cases
[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-terms]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#terms
[adr6-kinds]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#sources-that-are-not-emulators
[adr6-walled]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#walled-tier
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-every]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#in-every-tier
[roadmap]: ../../roadmap/research.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase3]: ../../roadmap/research.md#phase-3-host-platforms
[phase5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[register]: ../../../.claude/hooks/source-register.txt
[pj64-gh]: https://github.com/project64/project64
[pj64-readme]: https://github.com/project64/project64/blob/develop/README.md
[pj64-site]: https://www.pj64-emu.com/
[m64p-core]: https://github.com/mupen64plus/mupen64plus-core
[m64p-licenses]: https://github.com/mupen64plus/mupen64plus-core/blob/master/LICENSES
[m64p-ui]: https://github.com/mupen64plus/mupen64plus-ui-console
[m64p-rsphle]: https://github.com/mupen64plus/mupen64plus-rsp-hle
[m64p-site]: https://mupen64plus.org/
[m64p-params]: https://mupen64plus.org/wiki/index.php?title=Mupen64Plus_Core_Parameters
[cxd4]: https://github.com/mupen64plus/mupen64plus-rsp-cxd4
[ares-gh]: https://github.com/ares-emulator/ares
[ares-site]: https://ares-emu.net/
[ares-v124]: https://ares-emu.net/news/ares-v124-released
[ares-v128]: https://ares-emu.net/news/ares-v128-released
[ares-v130]: https://ares-emu.net/news/ares-v130-released
[ares-v142]: https://ares-emu.net/news/ares-v142-released
[ares-v148]: https://ares-emu.net/news/ares-v148-released
[ares-compat-dd]: https://ares-emu.net/compatibility/nintendo-nintendo-64dd
[gopher64]: https://github.com/gopher64/gopher64
[gopher64-sysreq]: https://github.com/gopher64/gopher64/wiki/System-Requirements
[gopher64-opts]: https://github.com/gopher64/gopher64/wiki/Explanation-of-options
[simple64-cap]: https://web.archive.org/web/20250123193457/https://simple64.github.io/
[cen64]: https://github.com/n64dev/cen64
[rokuyon]: https://github.com/Hydr8gon/rokuyon
[daedalusx64]: https://github.com/DaedalusX64/daedalus
[1964]: https://github.com/schibo/1964
[1964js]: https://github.com/schibo/1964js
[prdp]: https://github.com/Themaister/parallel-rdp
[prsp-lic]: https://github.com/libretro/parallel-rsp/blob/master/LICENSE
[gliden64-lic]: https://github.com/gonetz/GLideN64/blob/master/LICENSE
[rt64]: https://github.com/rt64/rt64
[rmg]: https://github.com/Rosalie241/RMG
[m64pae]: https://github.com/mupen64plus-ae/mupen64plus-ae
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[ejs-n64]: https://emulatorjs.org/docs/systems/nintendo-64/
[ejs-faq]: https://emulatorjs.org/docs/faq/
[plauncher]: https://parallel-launcher.ca/
[bizhawk]: https://github.com/TASEmulators/BizHawk
[tasv-n64]: https://tasvideos.org/Bizhawk/N64
[delta-notes]: https://faq.deltaemulator.com/release-notes
[provenance]: https://github.com/Provenance-Emu/Provenance
[openemu]: https://openemu.org/
[lr-m64p]: https://docs.libretro.com/library/mupen64plus/
[lr-paralleln64]: https://docs.libretro.com/library/parallel_n64/
[lr-bios]: https://docs.libretro.com/library/bios/
[m64pnx-lic]: https://github.com/libretro/mupen64plus-libretro-nx/blob/develop/LICENSE
[n64recomp]: https://github.com/N64Recomp/N64Recomp
[play-gopher64]: https://play.google.com/store/apps/details?id=io.github.gopher64.gopher64
[play-fz]: https://play.google.com/store/apps/details?id=org.mupen64plusae.v3.fzurita
[play-ra]: https://play.google.com/store/apps/details?id=com.retroarch
[play-lemuroid]: https://play.google.com/store/apps/details?id=com.swordfish.lemuroid
[appstore-ra]: https://apps.apple.com/us/app/retroarch/id6499539433
[steam-ra]: https://store.steampowered.com/app/1118310/RetroArch/
[flathub-rmg]: https://flathub.org/apps/com.github.Rosalie241.RMG
[flathub-gopher64]: https://flathub.org/apps/io.github.gopher64.gopher64
[apple-guide]: https://developer.apple.com/app-store/review/guidelines/
[nemu64test]: https://github.com/thelemmy/nemu64-test
[nemu64test-commits]: https://github.com/thelemmy/nemu64-test/commits
[n64systemtest]: https://github.com/lemmy-64/n64-systemtest
[krom]: https://github.com/PeterLemon/N64
[thar0-cpu]: https://github.com/Thar0/n64-cpu-tests
[thar0-rdp]: https://github.com/Thar0/RDP-Timing-Tests
[thar0-muldiv]: https://github.com/Thar0/n64-integermuldiv-test
[rsp-inval]: https://github.com/sauraen/rsp_inval_instrs
[n64brew]: https://n64brew.dev/wiki/Main_Page
[n64-vr4300]: https://n64brew.dev/wiki/VR4300
[n64-rdram]: https://n64brew.dev/wiki/RDRAM
[n64-ri]: https://n64brew.dev/wiki/RDRAM_Interface
[n64-pi]: https://n64brew.dev/wiki/Parallel_Interface
[n64-si]: https://n64brew.dev/wiki/Serial_Interface
[n64-memmap]: https://n64brew.dev/wiki/Memory_map
[n64-64dd]: https://n64brew.dev/wiki/64DD
[n64-cpak]: https://n64brew.dev/wiki/Controller_Pak
[n64-header]: https://n64brew.dev/wiki/ROM_Header
[w-pj64]: https://en.wikipedia.org/w/index.php?title=Project64&oldid=1336922933
[w-m64p]: https://en.wikipedia.org/w/index.php?title=Mupen64Plus&oldid=1383602525
[w-unreality]: https://en.wikipedia.org/w/index.php?title=Project_Unreality&oldid=1337974354
[w-vc]: https://en.wikipedia.org/w/index.php?title=Virtual_Console&oldid=1386423035
[w-nso]: https://en.wikipedia.org/w/index.php?title=Nintendo_Switch_Online&oldid=1384839693
[w-classics]: https://en.wikipedia.org/w/index.php?title=Nintendo_Classics&oldid=1387538380
[w-oot]: https://en.wikipedia.org/w/index.php?title=The_Legend_of_Zelda:_Ocarina_of_Time&oldid=1387622260
[w-ique]: https://en.wikipedia.org/w/index.php?title=IQue_Player&oldid=1355022059
[w-bung]: https://en.wikipedia.org/w/index.php?title=Bung_Enterprises&oldid=1379050989
[egw-simple64]: https://emulation.gametechwiki.com/index.php/Simple64
[egw-cen64]: https://emulation.gametechwiki.com/index.php/CEN64
[egw-gopher64]: https://emulation.gametechwiki.com/index.php/Gopher64
[techweb]: https://web.archive.org/web/19990502230434/http://www.techweb.com/wire/story/TWB19990202S0009
[ign64]: https://web.archive.org/web/20020223045811/http://ign64.ign.com/articles/066/066650p1.html
[reg-boycott]: https://www.theregister.com/1999/02/08/nintendo_legal_rumblings_provoke_boycott/
[noa-faq2000]: https://web.archive.org/web/20000620221241/http://www.nintendo.com:80/corp/faqs/legal.html
[noa-faq2003]: https://web.archive.org/web/20030621215334/http://www.nintendo.com:80/corp/legal.jsp
[noa-faq2017]: https://web.archive.org/web/20170101225939/http://www.nintendo.com/corp/legal.jsp
[noa-bung]: https://web.archive.org/web/20000303023356/http://www.nintendo.com/corp/press/122399.html
[stanford]: https://cs.stanford.edu/people/eroberts/courses/cs181/projects/1998-99/copyright-infringement/emulationlawsuits.html
[nlife-sm64]: https://www.nintendolife.com/news/2020/05/nintendo_cracks_down_on_the_super_mario_64_pc_port
[dmca-2026]: https://github.com/github/dmca/blob/master/2026/10/2026-10-23-nintendo.md
