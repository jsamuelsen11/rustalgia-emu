---
title: "Other consoles and handhelds: family survey"
roadmap_item: R1-26
status: approved
date: 2026-11-26
---

# Other consoles and handhelds: family survey

## Summary

This note asks which emulators matter for the consoles and handhelds that no other survey names,
from the Atari 2600 and the PC Engine to the 3DO, CD-i, and N-Gage, what each does,
what legal exposure the family carries, and how hard it is to emulate.

The leading open-tier emulators are new and narrow: [Geargrafx][ggx], [Gearlynx][glx],
and [Gearcoleco][gcv] for the PC Engine, Lynx, and ColecoVision, [Gopher2600][gopher] for the 2600,
[Geolith][geolith] for the Neo Geo, [ares][ares-gh] across ten of these systems with published completion counts,
and [MesenCE][mesence] for the PC Engine and WonderSwan.
The broadest references are walled or closed: [Mednafen][mdf] and its libretro forks, [MAME][mame-gh],
[Stella][stella-gh], [BizHawk][bizhawk], and the FreeDO line of 3DO emulators, whose terms are non-commercial.
Many popular cores carry closed parts: replacement or high-level BIOSes, and in `libretro/virtualjaguar-libretro`,
Atari's own boot ROM and CD BIOS images.

Legal exposure centres on a few systems.
Most of these systems have no encryption; the 7800's cartridge signature, the 3DO's and Pippin's RSA-signed discs,
the Jaguar's boot check (encrypted, by inference), the N-Gage's and GP32's encrypted cards,
and perhaps the Lynx's loader are the exceptions.
Nokia's 2003 pledge against a crack and Atari's 2011 letters to fan
and emulator sites are the only enforcement found against this family's software.
Makers sell emulation themselves: Atari, Konami with M2, SNK with Code Mystics, and Nintendo.

For Rustalgia, the family offers early targets with little legal weight: the 2600, ColecoVision, Intellivision,
Virtual Boy, and HuCard PC Engine need no encrypted input, and the 2600, HuCard PC Engine, Arcadia 2001,
and Virtual Boy need no firmware.
Published results against a hardware-referenced test exist only for the Lynx, from the test's own author,
and for the PC Engine processor's timing.
The note recommends keeping these rows at catalogue depth, adding no emulator study beyond the existing ares, Mesen,
MAME, and BizHawk ones, and taking up the unencrypted, firmware-free systems first.

## Scope

- Question: which emulators are popular or respected for the consoles and handhelds of [R1-05][r105] to [R1-08][r108]
  that no other survey names, and for each, what are its status, licence, tier, techniques, and hosts;
  what legal exposure does the family carry; and how hard is it to emulate?
- Covered: every row of those catalogues that no other survey names, listed in "The systems this note covers".
  Consoles built from home computers (XEGS, CDTV, CD32, FM Towns Marty, GX4000, C64 Games System, Zemmix, Pyūta Jr.) go
  to [R1-27][surveys], as [R1-09](R1-09-catalogue-home-computers.md) settles in its "Consoles built from home computers"
  table; the SG-1000 and the Pico go to [R1-22][surveys]; the MVS and Neo Geo X to [R1-25][r125].
- Researched on 2026-11-26 by four research agents, one each for the multi-system emulators,
  the Atari and early systems, the NEC, SNK, Bandai, and later systems, and law and difficulty;
  each read sources as raw text and quoted only from it.
  The writer checked gaps with further fetches
  (the GNU licence list, the libretro pages' addresses);
  the draft then goes to one pass of fresh verifiers and a fix pass (research log).
- Every emulator was read from its prose and repository metadata only, whatever its tier.
  No source file, issue, pull request, BIOS or boot ROM, game, dumping guide, or key file was opened,
  and no site offering games or firmware was followed.
  One page read, Phoenix's FreeDO page, links a 3DO key file; the link was not followed,
  the page itself holds no key text, and the register now closes the folder (research log; verification pass).
- Markers follow the [research guide][guide].
  Claims that rest on Wikipedia or on press are marked "secondary"; the [Emulation General wiki][egw] gave leads only,
  marked "(lead)", and none of its pages is cited.
- The fix pass re-fetched as raw text every source behind a finding it applied (research log).
  A statement that nothing was found records a search, not proof of absence.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, stores, frontends), respect
  (use as a reference, or accuracy backed by hardware tests), or history.
  Status is the archived flag and last push from metadata,
  and the release from the releases endpoint where the guard allowed it, otherwise from the README or site
  (research log).
- Tiers were checked against the [register][register]
  ([ADR 0006, "Evaluating a new source"][adr6-eval]),
  and no line's licence or tier changed: [ares][ares-gh], [Mesen 2][mesen2]
  (archived; its README names MesenCE as successor),
  [MesenCE][mesence], [RetroArch][retroarch], [Lemuroid][lemuroid], [EmulatorJS][emulatorjs], [FreeIntv][freeintv],
  and the [jzIntv mirror][jzintv-gh] stay open; [Mednafen][mdf], [MAME][mame-gh], [Stella][stella-gh],
  [BizHawk][bizhawk], [Provenance][provenance], and [BlissEmu][blissemu] walled; `openemu/openemu`
  (no push since 2025-10-22) and `andkrau/NuanceResurrection` closed (metadata).
- Process calls settled here, applying ADR 0006 and the earlier surveys' precedents:
  - Every built-in, bundled, or high-level BIOS, boot ROM, or system software is closed,
    and the rest of its repository keeps its tier: the NGP BIOS of Mednafen and its forks, [Holani][holani]'s boot ROM,
    [PokeMini][pokemini]'s FreeBIOS, [NeoCD][neocd]'s and Virtual Jaguar's BIOSes, AltirraOS in two cores,
    [Vectrexy][vectrexy]'s and NewOswan's boot ROMs, [OpenCDi][opencdi]'s slave processor,
    [PlaydiaEmu][playdia]'s disc player, [EKA2L1][eka2l1]'s kernel and servers,
    and [HuExpress][huexp]'s high-level System Card routines (inference from its README).
  - Maker firmware that a repository ships is closed, and the repository is a firmware hazard never to be copied whole:
    `libretro/virtualjaguar-libretro` and `onlyusemefeet/cub-spiele.com`, whose other files stay open.
    The note names both in code spans, not links, because each offers maker firmware.
    Vectrexy's two boot ROMs may be patched copies of the maker's ROM (from memory), so briefs treat it the same way.
  - The 3DO emulators that keep FreeDO's terms are closed,
    since they forbid commercial use "of FreeDO sources or any knowledge obtained by studying
    or reverse engineering of the sources" (Opera's LICENSE).
  - `libretro/libretro-handy` states no licence, but libretro's documentation and upstream metadata say zlib,
    so it is walled, as vbam-libretro was, and not closed as OpenEmu was with no statement anywhere.
  - [Gopher2600][gopher] is open: it read Stella's source as a reference, and states no adaptation, unlike gopher64.
  - [Tia][tia] stays open, and its oracle folder is walled: the oracle ports Sim2600, whose README grants MIT,
    but its netlists come from Visual6502 data that the register walls; Tia used Stella as a reference only (README).
  - [A7800][a7800] is walled, though its file says "2 or later": it forks MAME and defers to file headers,
    as MAME 2016 does.
  - [Ootake][ootake] is closed: its Readme forbids business use, and beats the wiki that calls it GPL-2.0.
  - The Wikipedia articles on the Virtual Boy and Atari 50 mention leaked games and a leaked game list, not source,
    kits, or firmware, so they stay open.
  - Phoenix's site links a 3DO key file from its FreeDO page, so the register closes nodes 30 to 39 and the file folder.
    Its game-library page (`arts-union.ru/node/7`) was not opened, and whether the site offers games is unknown;
    the note cites its pages in code spans as a precaution.
  - The jzIntv site's path holds "~", which a pattern cannot hold, so the register names its host.

### The systems this note covers

| Group | Systems | Catalogue |
|---|---|---|
| First generation | Odyssey, Home Pong, Telstar, Color TV-Game, PC-50x, and others | [R1-05][r105-1g] |
| Second generation | Channel F, Studio II, 2600, Astrocade, VC 4000, APF, Odyssey², Intellivision | [R1-05][r105-2g] |
| Second generation | Cassette Vision, CreatiVision, Arcadia 2001, ColecoVision, 5200, Vectrex | [R1-05][r105-2g] |
| Third generation | 7800, PV-1000, Super Cassette Vision, My Vision, Videopac+, and others | [R1-05][r105-3g] |
| Fourth generation | PC Engine and add-ons, SuperGrafx, Neo Geo AES and CD, CD-i, LaserActive | [R1-05][r105-4g] |
| Fourth generation | Super A'Can, Video Information System | [R1-05][r105-4g] |
| Handhelds to 2001 | Lynx, TurboExpress, Gamate, Supervision, Mega Duck, Game.com, and others | [R1-05][r105-hh] |
| Handhelds to 2001 | Neo Geo Pocket and Color, WonderSwan line, Pocket Challenge V2, Pokémon mini | [R1-05][r105-hh] |
| 32-bit era | 3DO, Jaguar, PC-FX, Playdia, Loopy, Pippin | [R1-06][r106-home] |
| 32-bit era | Jaguar CD; Virtual Boy | [R1-06][r106-addons]; [R1-06][r106-vb] |
| 32-bit era | Nuon, E-kara, Pixter | [R1-06][r106-other] |
| Later minor | V.Smile, Beena, HyperScan, ClickStart, XaviXPORT, and others | [R1-07][r107-minor] |
| Later handhelds | N-Gage, GP32, Zodiac, Leapster, Didj, Gizmondo, GameKing | [R1-07][r107-hh] |
| Modern | Zeebo, Playdate, Arduboy, Thumby, Nex Playground | [R1-08][r108-other] |

- The catalogues recommend this depth:
  [R1-06][r106-depth] keeps its rows at catalogue depth unless [R6-01][phase6] selects one,
  [R1-07][r107-rec] leaves the minor and educational systems to this survey at row depth,
  and [R1-05][r105-rec] proposed four family surveys (Atari, NEC, SNK, Bandai) that this item now holds.
- So the note gives short entries to those four lines and to the 3DO, CD-i, Virtual Boy, and Pokémon mini,
  and table rows to the rest (inference from the catalogues' recommendations).

### The emulators compared

Key: "push" is the last push; "lr" a libretro core; "PC" Windows, macOS, and Linux;
"user" means the user supplies the firmware; "closed" in the firmware column names a closed part of that project,
as do "HLE" and "FreeBIOS".
Systems: PCE PC Engine, SGX SuperGrafx, CD CD-ROM², FX PC-FX, NG Neo Geo AES, NGCD Neo Geo CD,
NGP Neo Geo Pocket and Color, WS WonderSwan and Color, VB Virtual Boy, CV ColecoVision, Intv Intellivision.

| Emulator | Tier | Licence | Status | Systems | Firmware | Hosts |
|---|---|---|---|---|---|---|
| [Mednafen][mdf] | walled | GPL-2.0 | 1.32.1, 2024-04-05 | Lynx, PCE, SGX, CD, FX, NGP, WS, VB | user; NGP HLE | Win |
| Beetle cores | walled | bare GPL-2.0 | pushes 2026 | one Mednafen module each | as Mednafen | lr |
| [ares][ares-gh] | open | ISC; MAME parts BSD | v148, 2026-05-30 | 2600, CV, PCE, NG, NGP, WS, more | not stated | PC |
| [MAME][mame-gh] | walled | GPL-2.0, texts differ | 0.289, 2026-07-31 | nearly all (from memory) | user sets | Win |
| [MesenCE][mesence] | open | GPL-3.0-or-later | 2.2.1, 2026-06-05 | PCE, CD, CV, WS | not read | PC, lr |
| [BizHawk][bizhawk] | walled | MIT own code; mixed | 2.11.1, 2026-05-01 | 15 systems here | user | Win, Lin |
| [Stella][stella-gh] | walled | bare GPL-2.0 | push 2026-11-27 | 2600 | none needed | PC, lr |
| [Gopher2600][gopher] | open | GPL-3.0 | v0.57.2, 2026-08-13 | 2600 | none needed | not verified |
| [Altirra][altirra] | walled | GPL-2.0 | 4.40, 2025-12-31 | 5200 | user or AltirraOS (closed) | Win |
| [Atari800][a800] | walled | bare GPL-2.0 | 7.2.1; push 2026-10-19 | 5200 | user; lr: AltirraOS | PC, And, more |
| [ProSystem][prosys] | walled | bare GPL-2.0 | push 2026-08-22 | 7800 | optional | lr |
| [A7800][a7800] | walled | GPL-2.0-or-later; MAME | v5.2, 2022-06-26 | 7800 | optional | PC |
| [Handy][handy] | walled | zlib by docs only | push 2026-04-20 | Lynx | user | lr |
| [Gearlynx][glx] | open | GPL-3.0 | 1.2.40 | Lynx | user | PC, BSD, lr |
| [Holani][holani] | open | GPL-3.0 | push 2026-08-11 | Lynx | built-in (closed); lr: user | lr, desktop |
| Virtual Jaguar | open | GPL-3.0 | v3.13.1 | Jaguar, Jaguar CD | maker images; HLE (closed) | 24 targets |
| BigPEmu | closed | proprietary | 1.221 | Jaguar, Jaguar CD | not stated | Win, Lin |
| Phoenix | closed | non-commercial | 2.8.JAG (Mac 2.8.25), undated | 3DO, Jaguar, CV | user | Win, Lin, Mac, And |
| [jzIntv][jzintv-site] | open | GPL-2.0-or-later | 20200712 | Intv | user (from memory) | PC, Pi |
| [FreeIntv][freeintv] | open | GPL-2.0-or-later | push 2026-08-11 | Intv | user | lr |
| [Gearcoleco][gcv] | open | GPL-3.0 | 1.8.1 | CV | user | PC, BSD, lr |
| ColEm | closed | non-commercial | 5.6, 2021-03-03 | CV | not stated | Win, Lin, And |
| [vecx][vecx] | open | GPL-3.0 | push 2026-10-17 | Vectrex | none asked | lr |
| ParaJVE | closed | non-commercial | 0.7.0, 2010-12-29 | Vectrex | bundled with games | Java |
| [O2EM][o2em] | open | Artistic-2.0 | push 2026-07-21 | Odyssey² | user | lr |
| [FreeChaF][freechaf] | open | GPL-3.0-or-later | push 2026-04-20 | Channel F | user | lr |
| [Geargrafx][ggx] | open | GPL-3.0 | 1.8.9, undated | PCE, SGX, CD, LaserActive | user | PC, BSD, lr |
| [Ootake][ootake] | closed | non-commercial | 3.06, 2026-08-01 | PCE, SGX, CD | user | Win |
| [Magic Engine][me] | closed | shareware | 1.1.3, 2008-05-26 | PCE, SGX, CD | built-in (closed) | Win, Mac |
| [Geolith][geolith] | open | BSD-3-Clause | push 2026-11-25 | NG, NGCD, MVS | user MAME sets | lr |
| [NeoCD][neocd] | open | LGPL-3.0 | push 2026-10-03 | NGCD | user or HLE (closed) | lr |
| [RACE][race] | walled | bare GPL-2.0 | push 2026-11-16 | NGP | not stated | lr |
| [StoicGoose][stoic] | open | MIT | push 2026-01-11 | WS | optional | Win |
| Red Viper | closed | non-commercial | push 2026-11-04 | VB | none needed | modded 3DS |
| Lemur | closed | none found | v0.16.1, 2026-11-04 | VB | none needed | PC |
| [PokeMini][pokemini] | open | GPL-3.0-or-later | 0.60, 2015-06-16 | Pokémon mini | optional; FreeBIOS | lr, many |
| Opera, 4DO, 5DO | closed | FreeDO, non-commercial | Opera push 2026-11-17 | 3DO | user or built-in (closed) | lr, PC |
| [CD-i Emulator][cdiemu] | closed | paid shareware | 0.5.3-beta10, 2026-08-08 | CD-i | user | Win |
| [OpenCDi][opencdi] | open | MIT | 0.4.2 | CD-i | user; HLE part (closed) | PC, lr |
| NuanceResurrection | closed | no-profit terms | push 2026-11-15 | Nuon | own routines (closed) | Win, Lin, lr |
| [LoopyMSE][loopymse] | open | GPL-3.0 | push 2026-08-16 | Loopy | user | PC |
| [V-Bear][vbear] | open | GPL-3.0-or-later | 0.5.2 | Super A'Can | user | Win, Lin, lr |
| [PlaydiaEmu][playdia] | open | BSD-3-Clause | push 2026-11-27 | Playdia | HLE player (closed) | PC, web, lr |
| [EKA2L1][eka2l1] | open | GPL-3.0 | rolling build | N-Gage | user; HLE OS (closed) | PC, And |

Sources by row: each project's README, licence file, metadata, site, or libretro page, as cited in its paragraph below.

### Multi-system emulators

- [Mednafen][mdf] is "distributed under the terms of the GNU GPLv2", with 1.32.1 of 5 April 2024 its latest release
  (home page).
  Its PC Engine module claims "Sub-instruction timing granularity(but greater than cycle granularity)",
  the 16-sprite line limit, and accurate HuC6280 flags, and defaults to the user's System Card 3.0 ([pce][mdf-pce]);
  `pce_fast` is a fork of 0.8.x "modified for speed" ([pce_fast][mdf-pcefast]).
  Its Lynx module is "based off of Handy" and needs the 512-byte boot ROM ([lynx][mdf-lynx]);
  WonderSwan is based on Cygne ([wswan][mdf-ws]); Virtual Boy is its own code with a V810 core from Reality Boy
  ([vb][mdf-vb]).
  Of its NGP module it says "BIOS is HLE'd, CPU instruction timing is totally fubared",
  pointing homebrew developers to MAME ([ngp][mdf-ngp]).
- libretro's Beetle cores port single Mednafen modules: [PCE][beetle-pce], [PCE FAST][beetle-pcefast],
  [SuperGrafx][beetle-sgx], [PC-FX][beetle-pcfx], [Lynx][beetle-lynx], [NeoPop][beetle-ngp], [Cygne][beetle-ws],
  and [VB][beetle-vb], each with a bare GPL-2.0 COPYING (licence files), so all are walled.
  Beetle PCE FAST lists `syscard3.pce` as required ([libretro, "Beetle PCE FAST"][lr-pcefast]).
- [ares][ares-gh] "focuses on accuracy and preservation" and builds for Windows, macOS, Linux, and BSD (README);
  its site lists the WonderSwan and Color, Pocket Challenge V2, ColecoVision, PC Engine, SuperGrafx, My Vision,
  and Neo Geo Pocket and Color as supported, and the 2600, PC Engine CD, Neo Geo AES, and LaserActive as experimental
  ([ares site][ares-site]).
  It forked from higan in 2020 to add systems
  that higan's "cycle-accurate model" could not take ([about][ares-about]). [v148][ares-148] improved the 2600's RIOT
  and the PC Engine's burst mode.
  What firmware each core needs is in no prose read; that the PC Engine CD, ColecoVision, NGP,
  and Neo Geo cores ask for the user's is from memory.
- [MAME][mame-gh] absorbed MESS, so it "now documents a wide variety of ... video game consoles",
  and it requires ROM images "provided by the user" ([home][mame-home]; [about][mame-about]).
  Releases 0.285 to 0.289 split the 3DO driver by model, from new dumps by 3dodev,
  and fixed Jaguar CD faults ([0.285][mame-285]) and CD-i faults
  ([0.286][mame-286]; [0.287][mame-287]; [0.288][mame-288]);
  its driver list is a walled release asset, so per-system status is from memory, and [R1-25][r125] records the rest.
- [MesenCE][mesence] continues Mesen 2, whose repository is now an archive "of Mesen as it was around version 2.1.1"
  ([Mesen 2 README][mesen2]).
  [2.1.0][mesen2-210] added the WonderSwan, 2.1.1 made "WS: Minor accuracy improvements
  (based on test roms)"
  ([2.1.1][mesen2-211]), and [2.2.0][mesence-220] the Pocket Challenge V2; the HuC6280 test set is Mesen's.
- [BizHawk][bizhawk] marks as "accuracy-focused and acceptable on TASVideos" cores
  for the fifteen systems of this family it covers
  (not the 5200, Neo Geo, Pokémon mini, or CD systems beyond the PC Engine CD and 3DO),
  among them its own C# PCEHawk, A7800Hawk, ColecoHawk, IntelliHawk, O2Hawk, ChannelFHawk, and VectrexHawk,
  and says "we cannot and will not distribute dumped games or firmware that are under copyright" (README).
  Release 2.11 added the Opera 3DO core, a closed one ([TASVideos, release history][tv-bizhawk]).
- Frontends carry these cores: [RetroArch][retroarch]
  (v1.22.2, 2025-11-20);
  [Provenance][provenance], which uses Mednafen for the NEC, SNK, Bandai, Lynx,
  and VB systems and syncs BIOS files through iCloud in its paid tier; [Lemuroid][lemuroid];
  and [EmulatorJS][emulatorjs] ([systems][ejs-sys]) (READMEs); OpenEmu's list is from memory.

### Atari 2600, 5200, and 7800

- [Stella][stella-gh] dates from 1996, has "cycle-exact emulation for the TIA chip", a debugger,
  and every bank-switching scheme, and uses the TIA core of [6502.ts][6502ts]
  ([Wikipedia, "Stella"][w-stella]; secondary); its README supports the PC and the commercial RetroN 77 console.
- [Gopher2600][gopher], in Go, claims "no known problems with the emulation of the 6507, TIA or RIOT chips",
  supports "the common TIA revisions",
  and debugs ARM-coprocessor cartridges and rewinds "at the CPU and Colour Clock level" (README).
  It used Stella as the visual reference and Stella's source for the CDF formats,
  which "don't seem to be documented anywhere accept in the Stella source", plus patents on the DPC, CBS,
  and SCABS cartridges (README).
- [6502.ts][6502ts], MIT by metadata, runs the Stellerator web frontend (README); [Javatari][javatari] is AGPL-3.0,
  so walled (metadata).
  [Tia][tia], a libretro core written from scratch,
  checks itself against a gate-level oracle ported from Greg James's [Sim2600][sim2600] transistor simulation
  and against the Harte 65x02 vectors, run as local test targets (README).
- The 5200's references are [Altirra][altirra], which claims "Full,
  cycle-exact emulation of all documented hardware features" and ships reimplemented OS ROMs, and [Atari800][a800],
  "released under the GPL" ([site][a800-site]), whose libretro core has "AltirraOS and Altirra BASIC built in"
  ([libretro, "Atari800"][lr-a800]); [a5200][lr-a5200] also builds AltirraOS in.
  Altirra's 8-bit side belongs to R1-27.
- The 7800 has [ProSystem][prosys], whose BIOS is "optionals"
  (README; [libretro, "ProSystem"][lr-prosys]);
  its web port [JS7800][js7800], whose 0.1.0 of 2026-11-05 added "MARIA DMA cycle penalties, holey DMA,
  and WSYNC/NMI timing" (README); and [A7800][a7800],
  "a fork of the MAME Atari 7800 driver" with "accurate DMA hole penalties", at v5.2 for Windows, macOS, and Linux
  (README; [8BitDev wiki, "A7800 Emulator"][a7800-wiki]).

### Atari Lynx and Jaguar

- Mednafen's Lynx module and libretro's [Handy][handy] core descend from Handy,
  which "was the original name of the Lynx project" ([libretro, "Handy"][lr-handy]); its SourceForge project lists zlib
  ([SourceForge metadata][sf-handy]).
  [Gearlynx][glx] offers "User selectable Lynx I or Lynx II emulation", "requires a BIOS",
  and "passes all tests from Atari Lynx Hardware Test ROMs", its author's own suite
  (README; [libretro, "Gearlynx"][lr-glx]).
- [Holani][holani] is "A cycle-stepped Atari Lynx emulator" (README) in Rust (metadata),
  whose 65C02 follows floooh's chips design; its README says it "embeds 6502 binary blobs",
  among them a "Free Lynx Boot Rom", while its libretro core asks for the user's boot image
  ([libretro, "Holani"][lr-holani]).
  [Felix][felix] is MIT and builds only on Windows (licence file, README).
- Virtual Jaguar (`libretro/virtualjaguar-libretro`), maintained by Joseph Mattiello, emulates the 68000, GPU, DSP,
  Object Processor, and CD controller, and says "The Jaguar boot ROMs and CD BIOSes are embedded,
  and cartridges boot through a high-level BIOS by default" (README);
  libretro's page adds that the console's boot ROM "is never loaded from the system directory"
  ([libretro, "Virtual Jaguar"][lr-vj]).
  Its boot matrices are "headless regression gates, not completion certificates" (README);
  v3.13.1 builds for 24 targets ([site][vj-site]); its parent, Virtual Jaguar 2.1.3, is GPL-3.0 "or later"
  ([mirror][vj-mirror]).
- BigPEmu, by Rich Whitehouse, claims "compatibility with the entire retail library" and
  that every processor "runs on a single native core", with no dynamic recompilation ([BigPEmu][bigpemu]);
  1.221 is current for Windows and Linux ([download page][bigpemu-dl]).
  Its FAQ says its source stays private under contract,
  that it was written "using only publicly available documentation" and the hardware,
  and that its default timing estimates bus contention by heuristics ([FAQ][bigpemu-faq]);
  it is closed and gets no repository line.
- Phoenix, by Maxim Grishin, added the Jaguar in 2.8.J, slow and rough by its author's own account
  (change history, `www.arts-union.ru/node/24`);
  its page claims 3DO compatibility of "100% ?!", dates itself to 2017 at the latest, and licenses it for personal,
  non-commercial use only (`www.arts-union.ru/node/23`; the note's paraphrase of the Russian).

### Other second-generation systems

- Intellivision: [jzIntv][jzintv-site]'s author recommends release 20200712, with SDL2 builds for Windows, macOS, Linux,
  and the Raspberry Pi, and calls it "Free Software" (site).
  [FreeIntv][freeintv] requires `exec.bin` and `grom.bin`, has no ECS support,
  and has PSG and STIC code made "closer to hardware" by Oscar Toledo G. (README).
- ColecoVision: [Gearcoleco][gcv] claims Z80, TMS9918A, SN76489,
  and AY-3-8910 emulation and says "Firmware is not included" (README),
  with undocumented Z80 behaviour "like R and MEMPTR registers" ([libretro, "Gearcoleco"][lr-gcv]).
  [JollyCV][jollycv], BSD-3-Clause, also covers the CreatiVision and My Vision (licence file, docs).
  ColEm's author allows his sources only if "your project is not commercial",
  and it "is not available under GPL license terms" ([ColEm][colem]),
  so it is closed. [blueMSX][bluemsx] mixes zlib-style, GPL, and "freeware" code, bundles C-BIOS,
  and can patch the user's BIOS for a fast boot (licence file, README).
- Vectrex: [vecx][vecx] asks for no BIOS file
  ([libretro, "vecx"][lr-vecx]); whether it embeds the system ROM is an open question.
  [Vectrexy][vectrexy], MIT by metadata, credits "FastBoot and SkipBoot bios roms" to ParaJVE's author (README);
  ParaJVE is freeware that "may not be sold or used for commercial purposes",
  and says its embedded game ROMs are public domain or used with permission ([ParaJVE release notes][parajve]).
- Odyssey²: [O2EM][o2em]'s COPYING is the Artistic License 2.0,
  which the [GNU list][gnu-list] calls "compatible with the GPL";
  its core needs `o2rom.bin` and runs only with that one of four BIOS files ([libretro, "O2EM"][lr-o2em]).
- Channel F: [FreeChaF][freechaf] needs two BIOS images, a third superseding one, and can play the built-in games
  ([libretro, "FreeChaF"][lr-freechaf]).
- The Emerson Arcadia 2001 and VC 4000 group have AmiArcadia
  (`warmenhoven/amiarcadia`, no link: closed, its documents say non-commercial),
  and the Cassette Vision has [PD777][pd777], MIT-licensed (metadata).
  The Astrocade, Studio II, APF, Super Cassette Vision, and the first-generation consoles have only MAME named
  (from memory).

### NEC: PC Engine, SuperGrafx, CD-ROM², and PC-FX

- [Geargrafx][ggx] claims "Accurate emulation supporting the entire HuCard PCE / SGX catalog", CD-ROM²,
  Super and Arcade CD-ROM², and LaserActive LD-ROM², with a debugger and an embedded MCP server;
  it "requires a BIOS to run CD-ROM games" and recommends System Card 3.0 (README).
  Its libretro core runs on Android, iOS, consoles, and the web ([libretro, "Geargrafx"][lr-ggx]).
  Its README links release 1.8.9; the guard blocked the releases endpoint, so its date is not checked.
- [Ootake][ootake], by Kitao Nakamura, is "a freeware" whose "Business use ... is prohibited",
  released as 3.06 on 2026-08-01 for Windows with source
  (site, Readme); it descends from PC2E, and boots `.sgx` images in SuperGrafx mode (Readme).
- [Magic Engine][me] is shareware with "a custom System Card - no BIOS ROM needed" and SuperGrafx
  and Arcade Card support, last released in 2008 (about and download pages); its news page ends in 2020.
- [HuExpress][huexp], a fork of Hu-Go!, defaults to "Use bios as much as possible",
  against a mode to "Use no bios at all as possible", which implies high-level System Card routines (README; inference).
- PC-FX: Mednafen recommends BIOS 1.00,
  and its accurate CPU mode still leaves "the pipeline" not "correctly and fully emulated" ([pcfx][mdf-pcfx]);
  [Beetle PC-FX][lr-pcfx] requires that file.
  Magic Engine FX 1.1.1 of 2008 is the other dedicated emulator found ([Magic Engine][me]).
- Official: Konami, which owns Hudson's properties, made the TurboGrafx-16 Mini with M2 in 2020
  ([Wikipedia, "TurboGrafx-16 Mini"][w-tg16mini]; secondary).

### SNK: Neo Geo AES, CD, and Pocket

- [Geolith][geolith], by Rupert Carmichael, is "a highly accurate emulator for the Neo Geo AES, MVS, CD, and CDZ",
  claims all commercial AES, MVS, and CD games, runs its CPUs "at instruction level granularity",
  times video "with a 'best effort' approach", and needs BIOS files "from a recent MAME set" (README).
  For cartridges it takes only TerraOnion's `.NEO` format, which is "unencrypted, but also unpatched",
  so it still emulates the cartridges' "challenge-response, descrambling" (README).
- [NeoCD][neocd] is "a complete rewrite of NeoCD from scratch", "designed with accuracy and portability in mind",
  that emulates the CD drive "at hardware level" and falls back to "a built-in high level BIOS"
  when none is found (README).
  It credits Z80 and YM2610 cores whose authors wrote early MAME code,
  so its LGPL-3.0 claim carries an unresolved inherited-licence question (README; inference).
- Neo Geo Pocket: NeoPop, "a portable open-source" emulator, ended in 2002
  ([NeoPop site, capture of 2012-08-29][neopop]); its line survives in Mednafen, Beetle NeoPop, and BizHawk.
  [RACE][race], a PSP port by several authors, is walled,
  and its upstream `theflav/race-ngpc-emulator-psp` has no licence, so it is closed
  (no link); that RACE also replaces the BIOS is from memory.
- Official: SNK and Code Mystics' Neo Geo Pocket Color Selection volumes of 2021 and 2022 each emulate ten games
  ([Wikipedia][w-ngpcsel]; secondary).

### Bandai and Nintendo handhelds

- WonderSwan: Mednafen's page names no boot ROM or BIOS setting ([wswan][mdf-ws]; observed).
  [StoicGoose][stoic] treats boot ROMs as "supported but not required" and has a debugger (README).
  NewOswan (`godzil/newoswan`, no link: no licence, and it ships boot ROM stubs) supports the boot ROMs of all three
  models, by its README.
  Mesen and ares cover the line, with the Pocket Challenge V2 (sections above).
- Virtual Boy: Red Viper (`skyfloogle/red-viper`, no link: closed) is a dynamic-recompiling 3DS port of Reality Boy,
  whose notice says "you make no money from the use of this code",
  and claims all licensed games at full speed on an original 3DS (README); its README links a firmware-dumping guide,
  not followed.
  Lemur (`git.virtual-boy.com/PVB/lemur`, no link: no licence found) is a Rust frontend on the shrooms-vb core,
  v0.16.1 of 2026-11-04 (Gitea metadata).
  The Virtual Boy has no BIOS ([R1-06][r106-vb]); Nintendo's own emulation came to Nintendo Classics on 2026-02-17,
  viewed through an enclosure ([Wikipedia, "Virtual Boy"][w-vb]; secondary).
- Pokémon mini: [PokeMini][pokemini], at 0.60 since 2015,
  has a hardware debugger and a "'sync cycles' option" that trades accuracy for speed ([SourceForge][sf-pokemini]);
  without `bios.min` "the bundled Pokémon mini FreeBIOS is used instead" (README).
  Nintendo's emulator in Pokémon Channel "was instrumental in helping a few hobbyist software engineers reverse engineer
  the handheld" ([Wikipedia, "Pokémon Mini"][w-pm]; secondary).

### 3DO, CD-i, and the other CD and 32-bit systems

- 3DO: every dedicated emulator found descends from FreeDO, and MAME's driver is separate ([0.285][mame-285]);
  FreeDO's 2.1 alpha marked the factorisation of the console's two 512-bit RSA keys
  (Phoenix's FreeDO page, `www.arts-union.ru/node/30`, not linked: it links a key file; the note's own summary;
  no key text appeared).
  FreeDO (`maxakaaltmer/freedo`), the Opera core (`libretro/opera-libretro`), 5DO (`purelogiccode/5do`),
  and opera-boot (`trapexit/opera-boot`) are closed and not linked: the first has no licence,
  the next two keep FreeDO's non-commercial terms,
  and the last is "an open-source alternative to retail 3DO boot ROMs" built with a closed kit (READMEs).
  [4DO][fourdo] is "An open-source, low-level emulator based on the FreeDO source code",
  last released as 1.3.2.4 (site); its terms follow FreeDO's (inference). libretro's page lists `norsa` firmware images,
  which its README says "have the RSA encryption check disabled"
  ([libretro, "Opera"][lr-opera]; README),
  and the README alone names an embedded replacement boot ROM as Opera's default.
- CD-i: [CD-i Emulator][cdiemu-page] gives "a fairly complete emulation of the hardware",
  limits its free edition to three minutes, and asks for "a modest payment"; it needs "copies of the CD-i system ROMs",
  which the author says users obtain "using the provided CD-i Link program" ([CD-i Emulator][cdiemu-page]).
  Its interfaces were "reverse-engineered from the CD-i system ROMs when necessary",
  words in a comment in the page's source ([sources][cdiemu-src]), so its facts are not recorded here.
  Its 0.5.3-beta10 came out on 2026-08-08 ([What's new][cdiemu-new]).
  [OpenCDi][opencdi], in Rust, emulates the slave processor at a high level,
  derives scanline timing from the MCD-212 clocks,
  and thanks the MAME team "for their invaluable documentation and foundational work on Philips
  and Motorola custom chips" (README); the README states no adaptation of MAME's walled code,
  so it stays open on that alone.
  CeDImu (`stovent/cedimu`, no licence) and libretro's [SAME CDi][same-cdi], MAME's driver alone, are the others.
- Nuon: NuanceResurrection's files hold "Aries assembly implementations of some BIOS routines and a complete miniBIOS",
  and it recompiles basic blocks (README of `andkrau/NuanceResurrection`, closed, no link).
- Casio Loopy: [LoopyMSE][loopymse] began "WIP, but able to run some games"
  and needs the user's BIOS ([original][loopymse-o]); its maintained fork claims it "Runs all commercial games",
  with builds for Windows, macOS, and Linux, and credits kasami with "BIOS dumping" (README).
- Super A'Can: [V-Bear][vbear], in Rust, follows the MiSTer core and MAME's driver,
  matched the simulated MiSTer core "pixel by pixel" in 10 of 12 games at frame 300,
  "has not been compared with a real console", and was written with Claude Code (README).
- Playdia: [PlaydiaEmu][playdia] plays discs "through an HLE disc player with no BIOS required";
  its "hardware pixel accuracy and display geometry remain unverified" (README).
- Pippin: MAME's driver "Now plays the startup sound and gets into the boot search code" ([0.289][mame-289]);
  DingusPPC reaches the boot screen only (lead).

### Minor systems

| System | Emulators found | Note |
|---|---|---|
| Supervision | [Potator][potator] (Unlicense) | MAME (from memory) |
| Game.com | Cub Spiele.Com (MIT), MAME (lead) | Cub ships "embedding the offline emulator bundle and BIOS" |
| Gamate, Mega Duck, Game Master | MAME (from memory; Mega Duck lists in [0.289][mame-289]) | — |
| N-Gage | [EKA2L1][eka2l1] (GPL-3.0) | reimplements Symbian's servers; a hobby since 2022 |
| HyperScan | [HyperScanEmu][hyperscan] (BSD-3-Clause) | "boots the retail BIOS", which the user supplies |
| V.Smile, LeapFrog, XaviX, Beena | MAME ([0.286][mame-286], [0.288][mame-288], [0.289][mame-289]) | lists and drivers |
| E-kara | MAME (`ekara_cart` list, [0.285][mame-285]; `xavix` driver, [0.286][mame-286]) | — |
| Video Information System | none searched | — |
| Studio II, APF, PV-1000, My Vision, others | MAME (from memory); ares for My Vision | — |
| Arduboy | ardens libretro core (not evaluated) | — |
| Playdate | none evaluated | Panic's SDK is closed in the register ([R1-08][r108-other]) |
| GP32, Zodiac, Gizmondo, Zeebo, Thumby, Nex | none searched | — |

- EKA2L1 says it "emulates Symbian OS/N-Gage's kernel, and reimplement most of its critical app servers and libraries",
  and almost all official N-Gage libraries run (README); its site's set-up pages
  for N-Gage firmware were not opened ([site][eka2l1-site]).
- Hidden Palace hosts a 1998 Game.com emulator and debugger from the maker's side
  (lead, from memory of a wiki); the site also hosts prototypes, so it is closed and not linked (`hiddenpalace.org`).

### Makers' own emulation

- Atari: the Atari 2600+ "uses software-based emulation" and plays 2600 and 7800 cartridges
  ([Wikipedia, "Atari 2600+"][w-2600p]; secondary);
  AtGames' Flashback 3 onward used emulation under licence
  ([Wikipedia, "Atari Flashback"][w-flashback]; secondary);
  Atari 50's Jaguar emulator was by Rich Whitehouse, who found the hardware's documentation sparse and inaccurate
  ([Wikipedia, "Atari 50"][w-atari50]; secondary).
  BigPEmu's release came through Digital Eclipse ([FAQ][bigpemu-faq]).
- Intellivision: the rights holders shipped emulators of the original game code from 1997,
  and Atari bought the brand in 2024 ([Wikipedia, "Intellivision"][w-intv]; secondary).
- NEC and Hudson, SNK, and Nintendo: see the PC Engine, Neo Geo Pocket, Virtual Boy, and Pokémon mini entries.
  No maker statement on third-party emulators was found for Atari, NEC, Konami, SNK, Bandai, Philips, or 3DO
  (web search, 2026-11-26).

### Legal exposure

This section builds on [R0-02][r002] and adds what is specific to this family.
It is not legal advice.

- Encryption and signatures:
  - The 7800's NTSC BIOS computes a signature of the cartridge and runs 7800 mode only on a match,
    and the signing software was released at a 2001 show
    ([Wikipedia, "Atari 7800"][w-7800]; secondary);
    the article's PAL detail rests on firmware analysis, so it is not recorded.
    ProSystem and A7800 make the BIOS optional, so without one they do not run the check (inference).
  - The 3DO's signed discs, disputed between Wikipedia and 3dodev in [R1-06][r106-home],
    gain support from the `norsa` images and Phoenix's undated "PAL BIOS с отключенным RSA"
    (a PAL BIOS with RSA disabled; the note's translation)
    (change history, `www.arts-union.ru/node/24`; inference that retail firmware checks).
    Projects that document firmware patched to skip an authentication check come close to the conduct in
    [R0-02, "Console checks, and use after circumvention"][r002-checks] (inference).
  - The Jaguar's software is encrypted
    ([R1-06][r106-home], itself an inference from Wikipedia);
    Virtual Jaguar's high-level BIOS skips the check (inference).
  - The Pippin's discs carry RSA signatures ([R1-06][r106-home]),
    and GP32 cards and downloads were encrypted to the card or to one console ([R1-07][r107-hh]).
  - N-Gage cards are encrypted: Nokia vowed to "aggressively pursue" the makers of a crack
    that decrypts games onto a memory card, and to shut down sites posting it
    ([The Register, 2003-11-12][reg-ngage]; secondary).
  - The Lynx boot ROM's loader check is described only in forum threads that analyse the ROM and discuss keys
    (lead; not opened); it is not recorded.
  - Neo Geo cartridges scramble data rather than lock out ([R1-05][r105-pat]);
    Geolith's decrypted `.NEO` input fits [R0-02 option 3][r002-o3]'s first variant (inference).
- Lock-outs without cryptography: the Intellivision II's changed Exec,
  which third parties "quickly figured out how to get around"
  ([Wikipedia, "Intellivision"][w-intv]; secondary),
  the TurboGrafx's reversed pins, and the WonderSwan's handshake bit ([R1-05][r105-pat]).
  No § 1201 decision on such a check, or on a cartridge-era signature such as the 7800's, was found
  ([R0-02, "Which systems the claims concern"][r002-which]).
  The risk is recorded with this position: an emulator that never runs a check circumvents nothing it uses,
  and one that runs the user's BIOS on a signed cartridge does what the console does (inference).
- Firmware: the user's dump ([option 4][r002-o4]) is the norm for the ColecoVision, Odyssey², Channel F, Intellivision,
  Lynx, PC Engine CD, PC-FX, Neo Geo, 3DO, CD-i, Loopy, Super A'Can, and N-Gage; replacements and high-level BIOSes
  ([option 5][r002-o5]) are listed under "How the survey chose and checked emulators", and all are closed for Rustalgia.
  No maker publishes any of these files ([option 6][r002-o6]; search of the projects' prose).
  CD-i Emulator ships its own dumping tool,
  conduct that [R0-02's Recommendation][r002-rec] advises against under [option 7][r002-o7];
  the yuzu pleadings named guides and links for dumping keys from an encrypted system
  ([R0-02, "Game sites, and the yuzu case"][r002-yuzu]),
  so a ROM-dumping tool for an unencrypted system is a weaker case of the same risk (inference).
- Shipped maker firmware: `libretro/virtualjaguar-libretro` compiles Atari's boot ROM
  and two CD BIOS images into the core ([libretro, "Virtual Jaguar"][lr-vj]), a route R0-02's options do not list.
  It presumably rests on Hasbro's 1999 release of "all rights that it may have to the vintage Atari hardware platform,
  the Jaguar", which names no firmware or public domain and cautions against the Atari mark
  ([Hasbro release][hasbro]; fan transcription; lead),
  and which Wikipedia says was extended to the Lynx by phone
  ([Wikipedia, "Atari Lynx"][w-lynx]; secondary);
  firmware in ROM is protected by copyright
  ([R0-02, "Firmware and back-up copies"][r002-fw]), and Atari has said nothing found on the release (web search).
  So whether the release reaches the boot ROM and CD BIOS is a recorded risk,
  and the note's position is that Rustalgia never embeds those images, which leaves the risk with the projects
  that do (inference).
- Vectrex: Wikipedia says Jay Smith allowed duplication of the games "on a not-for-profit basis"
  ([Wikipedia, "Vectrex"][w-vectrex]; secondary);
  no primary statement was found, and a non-commercial permission would be closed under ADR 0006 if read
  as a licence (inference).
- Non-commercial terms run through the 3DO (FreeDO) and Virtual Boy
  (Reality Boy)
  lines and the older PC Engine and ColecoVision emulators, so a study checks inherited terms first;
  Mednafen's V810 core is from Reality Boy ([vb][mdf-vb]; inference that the terms carry over).
- Enforcement:
  - In 2011 Atari sent a cease-and-desist letter to the owner of `atari2600.org` over the brand name
    ([Game Developer][gd-atari]; secondary),
    and, by a reader's submission, to emulator authors on Android
    and the Dreamcast whose emulators "appear to have no copyrighted content from Atari" ([Slashdot][slashdot]; lead).
  - Nokia's 2003 pledge above concerned circumvention of copy protection.
  - SNK's 2013 order against the Neo Geo X was reportedly over its maker's manufacturing standards, not its emulator,
    though the unit ran Final Burn Alpha against that emulator's licence
    ([Wikipedia, "Neo Geo X"][w-ngx]; secondary); [R1-25][r125] covers it.
  - No GitHub notice naming an emulator of this family was found by web search,
    consistent with [R0-02, "Who has been reached"][r002-who].
- Marks: Hasbro's caution on the Atari mark, Atari's 2011 letters,
  and Nintendo's characters in CD-i games apply [option 14][r002-o14] and [option 15][r002-o15];
  no boot logo check was found in this family ([R0-02, "Boot logos"][r002-logos]).
- Of R0-02's options, 1 fits every system here but the 3DO, Jaguar, Pippin, N-Gage, GP32, and perhaps the Lynx;
  2 and 3 fit the encrypted N-Gage and GP32 media, while the signature systems
  (3DO, Jaguar, Pippin)
  need only that the check is skipped, or a patched firmware, which is closed; 4 and 5 the firmware systems;
  7 and 8 the dumping tool and paid builds; and 14 to 16 throughout (inference).

### How hard the family is to emulate

- The 2600's registers "hold data for only a single line of the display", so games update them while the beam runs,
  and the TIA stalls the 6507 with RDY
  ([Wikipedia, "Television Interface Adaptor"][w-tia]; secondary);
  cartridges add bank switching and ARM coprocessors whose newer CDF formats seem, by Gopher2600's account,
  documented only in walled Stella source (README), so an independent route needs other sources (inference).
- The Jaguar's architecture "obstructed accurate emulation and homebrew development for decades"
  ([Wikipedia, "Atari Jaguar"][w-jaguar]; secondary):
  a 68000 and two RISC processors share the bus,
  and BigPEmu, the leader, estimates contention by heuristics ([FAQ][bigpemu-faq]).
- The PC Engine's HuC6280 runs at about 7.16 MHz
  ([Copetti, "PC Engine"][cop-pce]; lead),
  Mednafen claims sub-instruction timing for it ([pce][mdf-pce]),
  and the CPU and VDC share VRAM access in a configurable way ([Covell][covell]);
  Covell's tests show emulators getting VSync and block-transfer timing wrong ("Tests and published results").
  CD games need a System Card, which is region-locked, while the HuCard machine has no firmware (Copetti; lead).
- The Neo Geo pairs a 68000, Z80, and YM2610 with video timing that Geolith calls "best effort" (README).
  Neo Geo Pocket's TLCS-900/H has no maker manual or open test set ([R1-01][r101-others]),
  and Mednafen calls its own timing wrong ([ngp][mdf-ngp]).
- The Virtual Boy shows 384 × 224 pixels per eye from oscillating mirrors,
  read from a double-buffered stereoscopic frame buffer, at 50.0 Hz
  ([Sacred Tech Scroll][sts]);
  Wikipedia gives about 50.27 Hz ([Wikipedia, "Virtual Boy"][w-vb]; secondary), a conflict left to measurement.
  Mednafen says its V810 pipeline is not fully emulated ([R1-02][r102-others]).
- The 3DO's custom chips, the CD-i's many player models,
  and the Nuon's four VLIW processors ([R1-06][r106-other]) are the heaviest work,
  and their emulators' code is closed or high-level throughout (inference from the sections above).
- The smaller machines' difficulty lies in the Vectrex's analogue output and in processors with no SingleStepTests set:
  the 6809, CP1610, F8, and 8048 ([SingleStepTests organisation][sst-org], listed 2026-11-26).

### Tests and published results

| Suite | Systems | Oracle | Published results |
|---|---|---|---|
| [Lynx Hardware Tests][lynx-tests] | CPU, maths, sprites, timers, UART, audio, I/O | the author's consoles | Gearlynx |
| [Covell's timing test][covell] | PC Engine opcodes from ROM and RAM | a console, photographed | Mednafen, MiSTer |
| [SingleStepTests huc6280][sst-huc] | HuC6280 | Mesen | none |
| [ws-test-suite][ws-tests] | WonderSwan and Color | not stated; read the source | none |
| WSTimingTest | V30MZ timing | a WonderSwan Color | none |
| WSHWTest | timers and interrupts | not stated | none |
| [240p Test Suite][240p] | PC Engine and CD (display, timing) | real hardware | none |
| Acid5200 (Altirra) | 5200 | hardware, by its description | none |
| [Tia][tia] oracle | 2600 TIA, 6507, RIOT | gate-level simulation | own test suite; none published |
| ares compatibility | thirteen lists | playthrough | per title |

- Lynx Hardware Tests were "made by analyzing actual hardware" (README); Gearlynx's pass is by the same author,
  so it is not independent (inference).
- Covell found, with his own hedge "or something like that", that "Mednafen's CPU timing matches the PCE hardware,
  but its VSync interrupt triggers too late", that it treats VRAM access as always minimal in block transfers,
  and that the MiSTer core runs RAM code too fast ([Covell][covell]).
- The huc6280 set is "only as good as Mesen" (README), so passing it shows agreement with Mesen ([R1-01][r101-tests]).
- WSTimingTest's results came from its author's "Pink WonderSwan Color"
  (README of `flubbaofward/wstimingtest`, closed, no licence);
  WSHWTest's README holds step listings of timer logic, not recorded (`flubbaofward/wshwtest`, closed).
- ares publishes counts of completable, in-game, starting, and failing titles; as of 2026-11-26:
  WonderSwan 124 of 124 completable, Color 103 of 104, PC Engine 366 of 382, PC Engine CD 43 of 476 with 373 untested,
  Neo Geo Pocket Color 84 of 92, Neo Geo AES 78 of 137, ColecoVision 145 of 152,
  and the 2600 29 of 588 with 530 untested ([ares compatibility][ares-compat]).
- Gopher2600, BigPEmu, Geolith, V-Bear, and Virtual Jaguar make claims with no published oracle (sections above).
- No published pass table was found for the TIA, MARIA, Jaguar, Intellivision, Vectrex, Odyssey², Channel F,
  Virtual Boy, NGP, 3DO, Pokémon mini, or CD-i (web and repository searches, 2026-11-26).

## Options and trade-offs

### Which emulators the roadmap's studies cover

- **What:** rely on the existing [studies][studies] of [ares][ares-gh] (R1-60), [Mesen][mesence] (R1-61),
  [MAME][mame-gh] (R1-54), and [BizHawk][bizhawk] (R1-64) for this family,
  or add a study of an open single-system emulator such as [Geargrafx][ggx], [Gearlynx][glx], [Gopher2600][gopher],
  or [Geolith][geolith].
- **Costs:** a new study adds a roadmap item; MAME and BizHawk are walled, and BizHawk's 3DO core is closed.
- **Gains:** ares and Mesen are open and cover the PC Engine, WonderSwan, Neo Geo Pocket, ColecoVision, and 2600;
  the single-system emulators carry the only published Lynx pass and the 2600 and Neo Geo detail.
- **Used by:** Gearlynx, Geargrafx, and Gearcoleco share one author's design across three systems (READMEs);
  BizHawk carries the closed Opera core ([TASVideos][tv-bizhawk]).

### Which test oracles to adopt

- **What:** adopt the hardware-referenced suites
  ([Lynx Hardware Tests][lynx-tests], [Covell's timing test][covell]),
  use the [240p suite][240p] as a display check against an owned console, take emulator-generated sets
  ([huc6280][sst-huc]) for regression only, or measure on owned consoles.
- **Costs:** no suite exists for most of these systems; the WonderSwan timing tests and Covell's test state no licence,
  so their results are usable and the ROMs may be run as programs, but their code is not; consoles must be bought.
- **Gains:** the hardware suites are the only oracles found; ares's per-title counts give a coarse second check.
- **Used by:** Gearlynx, Mesen's 2.1.1 ([release notes][mesen2-211]), and [ares][ares-compat].

### How firmware is handled

- **What:** for each firmware system, the user's dump
  ([option 4][r002-o4]),
  Rustalgia's own replacement or high-level BIOS
  ([option 5][r002-o5]), or a start from the post-boot state; never embed maker images.
- **Costs:** replacements need a description of the services, which for the 3DO, CD-i,
  and N-Gage comes only from closed code
  or firmware analysis; the user's dump has no settled lawful route ([R0-02][r002-fw]).
- **Gains:** the HuCard PC Engine, 2600, Arcadia 2001, and Virtual Boy need no firmware,
  so several systems avoid the question (catalogue rows).
- **Used by:** every emulator in the table; the closed replacements show the demand.

### Which systems come first

- **What:** take up the firmware-free, unencrypted systems first
  (2600, HuCard PC Engine, Virtual Boy),
  then the firmware systems whose BIOS the user supplies
  (ColecoVision, Intellivision, Lynx, Neo Geo), and the signed or encrypted systems (3DO, Jaguar, N-Gage) last.
- **Costs:** the 2600's ARM cartridges and analogue quirks, and the Virtual Boy's display, are not small.
- **Gains:** the first group needs no keys or firmware;
  the PC Engine has a hardware timing test ([Covell][covell]) and the Virtual Boy an open hub
  ([Sacred Tech Scroll][sts]);
  the 2600 and PC Engine share 6502-family cores with the NES work
  ([R1-05][r105-pat]; the HuC6280's descent from memory).
- **Used by:** [Geargrafx][ggx], [Gearlynx][glx], and [Gearcoleco][gcv], which each take one small system (READMEs).

### Recommendation

The owner decides each of these; the pull request lists them.

- **Depth:** keep these rows at catalogue depth, as R1-06 and R1-07 recommend, and let [R6-01][phase6] pull in a system.
- **Studies:** add no study; read ares and Mesen as the open references for this family in R1-60 and R1-61,
  and read Geargrafx, Gearlynx, Gopher2600, and Geolith as open references when a system is taken up.
  Brief any MAME or BizHawk study to skip their closed parts and the 3DO.
- **Oracles:** adopt the Lynx Hardware Tests and Covell's test,
  and use the 240p suite as a display check against an owned console;
  use the huc6280 set and ares's counts for regression only;
  plan console measurements for the 2600 and the Virtual Boy before any accuracy target.
- **Firmware:** start firmware systems from the post-boot state or a replacement written by Rustalgia,
  with the user's dump an optional route, and never load another project's replacement or embedded maker images.
- **Order:** the 2600, HuCard PC Engine, and Virtual Boy first; the 3DO, Jaguar,
  and N-Gage only after [R6-01][phase6] decides on encrypted systems.

## Implications for Rustalgia

- [R2-12][phase2] should record per system whether it needs firmware,
  and that every replacement BIOS named here is closed; the post-boot start needs a documented state for each system,
  which only the open hubs and tests can give.
- [R2-03][phase2] must schedule several processors per system at sub-instruction granularity
  (the Jaguar's three, the PC Engine's shared VRAM access).
- [R2-15][phase2] should plan console measurements,
  since published hardware results exist only for the Lynx and the PC Engine processor,
  and the Virtual Boy's refresh rate is disputed.
- Every brief for this family must forbid the firmware in `libretro/virtualjaguar-libretro`
  and `onlyusemefeet/cub-spiele.com`, Vectrexy's boot ROMs, the 3DO code, dumping guides, and key threads;
  the register's new block closes the addresses found.
- [R6-01][phase6] can weigh the 2600, PC Engine, and Virtual Boy as early targets beside the NES and Mega Drive.

## Open questions

- What is the Virtual Boy's refresh rate, 50.0 Hz or about 50.27 Hz?
  A measurement on a console, under [R2-15][phase2], would answer it.
- Does vecx embed the Vectrex system ROM, which holds a built-in game?
  Its prose is silent and the survey reads no code; a functional description by a reader under [ADR 0006][adr6],
  or a question to its maintainers, would answer it.
  Until then briefs treat vecx as a possible firmware hazard.

## Sources

Every source below was read on 2026-11-26, as raw text, unless an entry says otherwise.
READMEs and metadata were read through GitHub's API; Wikipedia links are pinned to the revision read;
closed addresses are in code spans, with the reason.

- Repository documents: [ADR 0006][adr6]; [research guide][guide]; [roadmap][roadmap]; [register][register];
  [R0-02][r002]; [R1-01][r101]; [R1-02][r102]; [R1-05][r105]; [R1-06][r106]; [R1-07][r107]; [R1-08][r108];
  [R1-25][r125].
- Multi-system: Mednafen [home][mdf] and pages [pce][mdf-pce], [pce_fast][mdf-pcefast], [pcfx][mdf-pcfx],
  [lynx][mdf-lynx], [ngp][mdf-ngp], [wswan][mdf-ws], [vb][mdf-vb]
  (valid as of 1.32.1);
  Beetle [PCE][beetle-pce], [PCE FAST][beetle-pcefast], [SuperGrafx][beetle-sgx], [PC-FX][beetle-pcfx],
  [Lynx][beetle-lynx], [NeoPop][beetle-ngp], [Cygne][beetle-ws], [VB][beetle-vb]; ares [repository][ares-gh],
  [site][ares-site], [about][ares-about], [compatibility][ares-compat], [v148][ares-148]; MAME [repository][mame-gh],
  [home][mame-home], [about][mame-about], whatsnew [0.285][mame-285], [0.286][mame-286], [0.287][mame-287],
  [0.288][mame-288], [0.289][mame-289]; [Mesen 2][mesen2], [2.1.0][mesen2-210], [2.1.1][mesen2-211]; [MesenCE][mesence],
  [2.2.0][mesence-220]; [BizHawk][bizhawk]; [TASVideos, BizHawk release history][tv-bizhawk], last edited 2026-05-31;
  [RetroArch][retroarch]; [Provenance][provenance]; [Lemuroid][lemuroid]; [EmulatorJS][emulatorjs], [systems][ejs-sys].
- Atari: [Stella][stella-gh]; [Gopher2600][gopher]; [6502.ts][6502ts]; [Javatari][javatari]; [Tia][tia];
  [Sim2600][sim2600]; [Altirra][altirra]; [Atari800][a800], [site][a800-site]; [ProSystem][prosys]; [JS7800][js7800];
  [A7800][a7800]; [8BitDev wiki, "A7800 Emulator"][a7800-wiki], last modified 2022-12-11; [Handy][handy];
  [SourceForge, Handy][sf-handy]; [Gearlynx][glx]; [Lynx Hardware Tests][lynx-tests]; [Holani][holani]; [Felix][felix];
  Virtual Jaguar's [site][vj-site] and [mirror][vj-mirror]; [BigPEmu][bigpemu], [FAQ][bigpemu-faq],
  and [download page][bigpemu-dl], read with a browser user agent.
- Second generation: [jzIntv][jzintv-site], [mirror][jzintv-gh]; [BlissEmu][blissemu]; [FreeIntv][freeintv];
  [Gearcoleco][gcv]; [ColEm][colem]; [blueMSX][bluemsx]; [JollyCV][jollycv]; [vecx][vecx]; [Vectrexy][vectrexy];
  [ParaJVE release notes][parajve]; [O2EM][o2em]; [FreeChaF][freechaf]; [PD777][pd777]; [GNU licence list][gnu-list].
- NEC and SNK: [Geargrafx][ggx]; [Ootake][ootake]; [Magic Engine][me]; [HuExpress][huexp];
  [Covell, "PC-Engine CPU Timing Test Results"][covell]; [Copetti, "PC Engine / TurboGrafx-16 Architecture"][cop-pce];
  [Geolith][geolith]; [NeoCD][neocd]; [NeoPop site][neopop], capture of 2012-08-29 13:39:20; [RACE][race].
- Handhelds and CD systems: [StoicGoose][stoic]; [ws-test-suite][ws-tests]; [PokeMini][pokemini],
  [SourceForge][sf-pokemini]; [Sacred Tech Scroll][sts], About dated 2026-05-21; [4DO][fourdo]; [CD-i Emulator][cdiemu],
  [emulator page][cdiemu-page], [sources][cdiemu-src], [What's new][cdiemu-new]; [OpenCDi][opencdi];
  [SAME CDi][same-cdi]; [LoopyMSE][loopymse], [original][loopymse-o]; [V-Bear][vbear]; [PlaydiaEmu][playdia];
  [HyperScanEmu][hyperscan]; [Potator][potator]; [EKA2L1][eka2l1], [site][eka2l1-site].
- libretro pages: [Beetle PCE FAST][lr-pcefast]; [Beetle PC-FX][lr-pcfx]; [Atari800][lr-a800]; [a5200][lr-a5200];
  [ProSystem][lr-prosys]; [Handy][lr-handy]; [Gearlynx][lr-glx]; [Holani][lr-holani]; [Virtual Jaguar][lr-vj];
  [Gearcoleco][lr-gcv]; [vecx][lr-vecx]; [O2EM][lr-o2em]; [FreeChaF][lr-freechaf]; [Geargrafx][lr-ggx];
  [Opera][lr-opera].
- Tests: [SingleStepTests huc6280][sst-huc]; [SingleStepTests organisation][sst-org], repository listing;
  [240p Test Suite][240p].
- Wikipedia (secondary): ["Stella (emulator)"][w-stella]; ["Atari 2600+"][w-2600p]; ["Atari Flashback"][w-flashback];
  ["Atari 50"][w-atari50]; ["Atari 7800"][w-7800]; ["Atari Jaguar"][w-jaguar]; ["Atari Lynx"][w-lynx];
  ["Television Interface Adaptor"][w-tia]; ["Intellivision"][w-intv]; ["Vectrex"][w-vectrex];
  ["TurboGrafx-16 Mini"][w-tg16mini]; ["Neo Geo X"][w-ngx]; ["Neo Geo Pocket Color Selection"][w-ngpcsel];
  ["Virtual Boy"][w-vb]; ["Pokémon Mini"][w-pm].
- Press and leads: [The Register, "Nokia pledges to pursue N-Gage crack creators"][reg-ngage];
  [Game Developer, "Report: Atari Sends Cease And Desist To Hobbyist Site For Using Company Name"][gd-atari];
  [Slashdot, "Atari C&Ds Emulators, Site About Asteroids"][slashdot]; [Hasbro Interactive release][hasbro],
  a fan transcription; [Emulation General wiki][egw], leads only, no page cited.
- Closed, read as README, licence, and metadata only, and not linked: `openemu/openemu`, `warmenhoven/amiarcadia`,
  `theflav/race-ngpc-emulator-psp`, `godzil/newoswan`, `flubbaofward/wstimingtest`, `flubbaofward/wshwtest`,
  `skyfloogle/red-viper`, `git.virtual-boy.com/PVB/lemur`, `libretro/opera-libretro`, `maxakaaltmer/freedo`,
  `purelogiccode/5do`, `trapexit/opera-boot`, `stovent/cedimu`, `andkrau/NuanceResurrection`.
- Open in the register but cited in code spans:
  Phoenix's pages `www.arts-union.ru/node/23` (emulator) and `www.arts-union.ru/node/24`
  (change history),
  because the site's game-library page was not opened;
  and `libretro/virtualjaguar-libretro` and `onlyusemefeet/cub-spiele.com`, because each ships maker firmware.
- Closed, read once and not linked: `www.arts-union.ru/node/30`, Phoenix's FreeDO page,
  which links a 3DO key file in `www.arts-union.ru/sites/default/files/` (not opened).
- Closed and not opened: `hillsoftware.com/files/atari/jaguar/jag_v8.pdf`, a maker manual hosted by others,
  which BigPEmu's FAQ links; `lynxdev.atari.org`, source of a replacement boot ROM;
  the ParaJVE and Ootake download pages, which bundle games or the installer; `www.cdiemu.org/site/cdilink.htm`,
  a dumping tool; `3ds.hacks.guide`, a dumping guide; `hiddenpalace.org`, which hosts prototypes.

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[surveys]: ../../roadmap/research.md#system-family-surveys
[studies]: ../../roadmap/research.md#emulator-studies
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-checks]: R0-02-legal-baseline.md#console-checks-and-use-after-circumvention
[r002-which]: R0-02-legal-baseline.md#which-systems-the-claims-concern
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r002-yuzu]: R0-02-legal-baseline.md#game-sites-and-the-yuzu-case
[r002-who]: R0-02-legal-baseline.md#who-has-been-reached
[r002-logos]: R0-02-legal-baseline.md#boot-logos
[r002-rec]: R0-02-legal-baseline.md#recommendation
[r002-o3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o6]: R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r002-o15]: R0-02-legal-baseline.md#15-use-no-maker-logos-or-game-imagery-or-use-them-under-a-stated-position
[r101]: R1-01-primer-8-and-16-bit.md
[r101-others]: R1-01-primer-8-and-16-bit.md#others-and-what-they-share
[r101-tests]: R1-01-primer-8-and-16-bit.md#tests-and-their-oracles
[r102]: R1-02-primer-32-and-64-bit.md
[r102-others]: R1-02-primer-32-and-64-bit.md#others-and-what-they-share
[r105]: R1-05-catalogue-8-and-16-bit.md
[r105-1g]: R1-05-catalogue-8-and-16-bit.md#first-generation-dedicated-consoles
[r105-2g]: R1-05-catalogue-8-and-16-bit.md#second-generation-home-consoles
[r105-3g]: R1-05-catalogue-8-and-16-bit.md#third-generation-home-consoles
[r105-4g]: R1-05-catalogue-8-and-16-bit.md#fourth-generation-home-consoles
[r105-hh]: R1-05-catalogue-8-and-16-bit.md#handhelds
[r105-pat]: R1-05-catalogue-8-and-16-bit.md#patterns-across-the-catalogue
[r105-rec]: R1-05-catalogue-8-and-16-bit.md#recommendation
[r106]: R1-06-catalogue-32-and-64-bit.md
[r106-home]: R1-06-catalogue-32-and-64-bit.md#home-consoles
[r106-addons]: R1-06-catalogue-32-and-64-bit.md#add-ons-and-expansion-cards
[r106-vb]: R1-06-catalogue-32-and-64-bit.md#handhelds-of-the-nintendo-families
[r106-other]: R1-06-catalogue-32-and-64-bit.md#other-systems-first-sold-to-2000
[r106-depth]: R1-06-catalogue-32-and-64-bit.md#how-deeply-r1-26-studies-the-rows-it-takes
[r107]: R1-07-catalogue-sixth-generation.md
[r107-minor]: R1-07-catalogue-sixth-generation.md#minor-and-educational-home-systems
[r107-rec]: R1-07-catalogue-sixth-generation.md#recommendation
[r107-hh]: R1-07-catalogue-sixth-generation.md#other-dedicated-handhelds
[r108]: R1-08-catalogue-modern.md
[r108-other]: R1-08-catalogue-modern.md#other-dedicated-consoles
[r125]: R1-25-arcade-family.md
[mdf]: https://mednafen.github.io/
[mdf-pce]: https://mednafen.github.io/documentation/pce.html
[mdf-pcefast]: https://mednafen.github.io/documentation/pce_fast.html
[mdf-pcfx]: https://mednafen.github.io/documentation/pcfx.html
[mdf-lynx]: https://mednafen.github.io/documentation/lynx.html
[mdf-ngp]: https://mednafen.github.io/documentation/ngp.html
[mdf-ws]: https://mednafen.github.io/documentation/wswan.html
[mdf-vb]: https://mednafen.github.io/documentation/vb.html
[beetle-pce]: https://github.com/libretro/beetle-pce-libretro
[beetle-pcefast]: https://github.com/libretro/beetle-pce-fast-libretro
[beetle-sgx]: https://github.com/libretro/beetle-supergrafx-libretro
[beetle-pcfx]: https://github.com/libretro/beetle-pcfx-libretro
[beetle-lynx]: https://github.com/libretro/beetle-lynx-libretro
[beetle-ngp]: https://github.com/libretro/beetle-ngp-libretro
[beetle-ws]: https://github.com/libretro/beetle-wswan-libretro
[beetle-vb]: https://github.com/libretro/beetle-vb-libretro
[lr-pcefast]: https://docs.libretro.com/library/beetle_pce_fast/
[lr-pcfx]: https://docs.libretro.com/library/beetle_pc_fx/
[ares-gh]: https://github.com/ares-emulator/ares
[ares-site]: https://ares-emu.net/
[ares-about]: https://ares-emu.net/about
[ares-compat]: https://ares-emu.net/compatibility
[ares-148]: https://github.com/ares-emulator/ares/releases/tag/v148
[mame-gh]: https://github.com/mamedev/mame
[mame-home]: https://www.mamedev.org/
[mame-about]: https://www.mamedev.org/about.html
[mame-285]: https://www.mamedev.org/releases/whatsnew_0285.txt
[mame-286]: https://www.mamedev.org/releases/whatsnew_0286.txt
[mame-287]: https://www.mamedev.org/releases/whatsnew_0287.txt
[mame-288]: https://www.mamedev.org/releases/whatsnew_0288.txt
[mame-289]: https://www.mamedev.org/releases/whatsnew_0289.txt
[mesen2]: https://github.com/SourMesen/Mesen2
[mesen2-210]: https://github.com/SourMesen/Mesen2/releases/tag/2.1.0
[mesen2-211]: https://github.com/SourMesen/Mesen2/releases/tag/2.1.1
[mesence]: https://github.com/nesdev-org/MesenCE
[mesence-220]: https://github.com/nesdev-org/MesenCE/releases/tag/2.2.0
[bizhawk]: https://github.com/TASEmulators/BizHawk
[tv-bizhawk]: https://tasvideos.org/Bizhawk/ReleaseHistory
[retroarch]: https://github.com/libretro/RetroArch
[provenance]: https://github.com/Provenance-Emu/Provenance
[lemuroid]: https://github.com/Swordfish90/Lemuroid
[emulatorjs]: https://github.com/EmulatorJS/EmulatorJS
[ejs-sys]: https://emulatorjs.org/docs/systems/
[stella-gh]: https://github.com/stella-emu/stella
[gopher]: https://github.com/JetSetIlly/Gopher2600
[6502ts]: https://github.com/6502ts/6502.ts
[javatari]: https://github.com/ppeccin/javatari.js
[tia]: https://github.com/warmenhoven/tia
[sim2600]: https://github.com/gregjames/Sim2600
[altirra]: https://www.virtualdub.org/altirra.html
[a800]: https://github.com/atari800/atari800
[a800-site]: https://atari800.github.io/
[lr-a800]: https://docs.libretro.com/library/atari800/
[lr-a5200]: https://docs.libretro.com/library/a5200/
[lr-prosys]: https://docs.libretro.com/library/prosystem/
[prosys]: https://github.com/libretro/prosystem-libretro
[js7800]: https://github.com/raz0red/js7800
[a7800]: https://github.com/7800-devtools/a7800
[a7800-wiki]: https://7800.8bitdev.org/index.php/A7800_Emulator
[handy]: https://github.com/libretro/libretro-handy
[lr-handy]: https://docs.libretro.com/library/handy/
[sf-handy]: https://sourceforge.net/rest/p/handy
[glx]: https://github.com/drhelius/Gearlynx
[lr-glx]: https://docs.libretro.com/library/gearlynx/
[lynx-tests]: https://github.com/drhelius/lynx-tests
[holani]: https://github.com/LLeny/holani
[lr-holani]: https://docs.libretro.com/library/holani/
[felix]: https://github.com/laoo/Felix
[lr-vj]: https://docs.libretro.com/library/virtual_jaguar/
[vj-site]: https://jaguar.provenance-emu.com/
[vj-mirror]: https://github.com/mirror/virtualjaguar
[bigpemu]: https://www.richwhitehouse.com/jaguar/
[bigpemu-faq]: https://www.richwhitehouse.com/jaguar/index.php?content=faq
[bigpemu-dl]: https://www.richwhitehouse.com/jaguar/index.php?content=download
[jzintv-site]: http://spatula-city.org/~im14u2c/intv/
[jzintv-gh]: https://github.com/lutris/jzintv
[blissemu]: https://github.com/jeremiah-sypult/BlissEmu
[freeintv]: https://github.com/libretro/FreeIntv
[gcv]: https://github.com/drhelius/Gearcoleco
[lr-gcv]: https://docs.libretro.com/library/gearcoleco/
[colem]: https://fms.komkon.org/ColEm/
[bluemsx]: https://github.com/libretro/blueMSX-libretro
[jollycv]: https://github.com/libretro/jollycv
[vecx]: https://github.com/libretro/libretro-vecx
[lr-vecx]: https://docs.libretro.com/library/vecx/
[vectrexy]: https://github.com/amaiorano/vectrexy
[parajve]: http://www.vectrex.fr/ParaJVE/release/release_notes
[o2em]: https://github.com/libretro/libretro-o2em
[lr-o2em]: https://docs.libretro.com/library/o2em/
[freechaf]: https://github.com/libretro/FreeChaF
[lr-freechaf]: https://docs.libretro.com/library/freechaf/
[pd777]: https://github.com/mittonk/PD777
[gnu-list]: https://www.gnu.org/licenses/license-list.html#ArtisticLicense2
[ggx]: https://github.com/drhelius/Geargrafx
[lr-ggx]: https://docs.libretro.com/library/geargrafx/
[ootake]: https://www.ouma.jp/ootake/
[me]: http://www.magicengine.com/
[huexp]: https://github.com/kallisti5/huexpress
[covell]: https://www.chrismcovell.com/CPUTest/
[cop-pce]: https://www.copetti.org/writings/consoles/pc-engine/
[geolith]: https://github.com/libretro/geolith-libretro
[neocd]: https://github.com/libretro/neocd_libretro
[neopop]: https://web.archive.org/web/20120829133920/http://www.emuxhaven.net/~neopop/
[race]: https://github.com/libretro/RACE
[stoic]: https://github.com/xdanieldzd/StoicGoose
[ws-tests]: https://github.com/asiekierka/ws-test-suite
[pokemini]: https://github.com/libretro/PokeMini
[sf-pokemini]: https://sourceforge.net/projects/pokemini/
[sts]: http://perfectkiosk.net/stsvb.html
[lr-opera]: https://docs.libretro.com/library/opera/
[fourdo]: https://fourdo.com/
[cdiemu]: https://www.cdiemu.org/
[cdiemu-page]: https://www.cdiemu.org/site/cdiemu.htm
[cdiemu-src]: https://www.cdiemu.org/site/sources.htm
[cdiemu-new]: https://www.cdiemu.org/site/whatsnew.htm
[opencdi]: https://github.com/sigsantilio/opencdi
[same-cdi]: https://github.com/libretro/same_cdi
[loopymse]: https://github.com/LoopyMSE/LoopyMSE
[loopymse-o]: https://github.com/PSI-Rockin/LoopyMSE
[vbear]: https://github.com/PSGM-Romhacking/v-bear
[playdia]: https://github.com/AloysHF/PlaydiaEmu
[hyperscan]: https://github.com/AloysHF/HyperScanEmu
[potator]: https://github.com/libretro/potator
[eka2l1]: https://github.com/EKA2L1/EKA2L1
[eka2l1-site]: https://eka2l1.github.io/
[sst-huc]: https://github.com/SingleStepTests/huc6280
[sst-org]: https://github.com/SingleStepTests
[240p]: https://github.com/ArtemioUrbina/240pTestSuite
[egw]: https://emulation.gametechwiki.com/index.php/Main_Page
[hasbro]: https://mail.atariage.com/Jaguar/archives/HasbroRights.html
[reg-ngage]: https://www.theregister.com/2003/11/12/nokia_pledges_to_pursue_ngage/
[gd-atari]: https://www.gamedeveloper.com/business/report-atari-sends-cease-and-desist-to-hobbyist-site-for-using-company-name
[slashdot]: https://games.slashdot.org/story/11/09/02/1825230
[w-stella]: https://en.wikipedia.org/w/index.php?oldid=1357671978
[w-2600p]: https://en.wikipedia.org/w/index.php?oldid=1387134293
[w-flashback]: https://en.wikipedia.org/w/index.php?oldid=1386296269
[w-atari50]: https://en.wikipedia.org/w/index.php?oldid=1387752193
[w-7800]: https://en.wikipedia.org/w/index.php?oldid=1384315726
[w-jaguar]: https://en.wikipedia.org/w/index.php?oldid=1387278480
[w-lynx]: https://en.wikipedia.org/w/index.php?oldid=1385284173
[w-tia]: https://en.wikipedia.org/w/index.php?oldid=1386648231
[w-intv]: https://en.wikipedia.org/w/index.php?oldid=1384387529
[w-vectrex]: https://en.wikipedia.org/w/index.php?oldid=1387213650
[w-tg16mini]: https://en.wikipedia.org/w/index.php?oldid=1360861077
[w-ngx]: https://en.wikipedia.org/w/index.php?oldid=1377484786
[w-ngpcsel]: https://en.wikipedia.org/w/index.php?oldid=1330427822
[w-vb]: https://en.wikipedia.org/w/index.php?oldid=1384432040
[w-pm]: https://en.wikipedia.org/w/index.php?oldid=1384550005
