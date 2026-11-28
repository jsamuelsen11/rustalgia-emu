---
title: "Home computers: family survey"
roadmap_item: R1-27
status: draft
date: 2026-11-27
---

# Home computers: family survey

## Summary

This note asks which emulators matter for the home computers that [R1-09][r109] catalogues, what each does,
what legal exposure the family carries, and how hard it is to emulate.
It covers nine families in depth, the PC-9801 and X68000 next, and the other machines as table rows.

The open tier is rich here, unlike most console families (inference): [VICE][vice], [Fuse][fuse], [Hatari][hatari],
[vAmiga][vamiga], [VirtualC64][vc64], [jsbeeb][jsbeeb], and [Clock Signal][clk] are open, among others.
The best-known Amiga, Atari 8-bit, MSX, and Apple II emulators are walled: [WinUAE][winuae] and its forks,
[Altirra][altirra], [openMSX][openmsx], and [AppleWin][applewin].
Many open projects carry closed parts, shipped maker ROMs or replacement firmware.

The legal weight lies in firmware, not encryption: no machine here encrypts its games,
and no GitHub notice found targets a home-computer emulator.
Amiga Corporation claims the Commodore copyrights, and the Amstrad and Sharp permissions are partial.
Disk copy protection counts as an access control for the US Copyright Office,
and the IPF disk-image decoder is under a non-commercial licence.

For Rustalgia, the [VICE testbench][testbench] is a rare published comparison,
ranking sixteen C64 configurations against real-machine references.
The note recommends one emulator study, of VICE; the testbench, [Lorenz's suite][lorenz], [z80test][z80test],
and [vAmigaTS][vamigats] as oracles; user-supplied firmware; and the C64 and 48K Spectrum first.
The owner decides.

## Scope

- Question: which emulators are popular or respected for the home computers of [R1-09][r109], and for each,
  what are its status, licence, tier, techniques, and hosts; what legal exposure does the family carry;
  and how hard is it to emulate?
- Covered: the nine families R1-09 recommends in depth, with the consoles built from them,
  the PC-9801 and X68000 in shorter entries, the other rows as table rows, and IBM PC compatibles, DOS,
  and the classic Macintosh as a boundary ([R1-09][r109-rec]).
  Hosts and mini computers are left to [R3-12][hosts], and firmware engineering to [R2-12][phase2].
- Researched on 2026-11-26 into 2026-11-27 by four research agents
  (Commodore and Amiga; British and European machines; American, Japanese, and boundary machines; law and difficulty),
  reading pages as raw text and Wikipedia as raw wikitext pinned to a revision;
  the writer checked gaps with one more fetch
  ([KEGS][kegs]'s site and README);
  four fresh verifiers then re-read every source on 2026-11-27,
  and a fix pass re-fetched each disputed claim as raw text before changing it (research log).
- Emulators were read from prose and metadata only, whatever their tier; no source file, issue, pull request, firmware,
  ROM, game, dumping guide, or key was opened.
  Pages found to offer or link firmware or games were opened once, and nothing on them followed:
  the RPCEmu home and ROM-image pages, the BeebEm site, the Archimedes Live and DCMOTO home pages,
  and the fMSX and XM6 pages (research log).
  The [register][register] now closes each.
- Markers follow the [research guide][guide]; Wikipedia and press are "secondary",
  and the Emulation General wiki gave leads only.
  Every Wikipedia page read was searched for "leak", and none mentions one.
  A statement that nothing was found records a search.
  This note is not legal advice.

## Findings

### How the survey chose and checked emulators

- An emulator is included for popularity (stars, store installs, frontends), respect
  (accuracy backed by hardware references, use by others), history, or because the maker made it.
  Status is the archived flag and last push from metadata, with the release from the releases endpoint, a site,
  or a README.
- Tiers were checked against the [register][register] ([ADR 0006][adr6-eval]).
  `dosbox-staging/dosbox-staging` changes from walled to open,
  because its licence file calls the whole "GPL-2.0-or-later", which beats the metadata the line rested on;
  the MiSTer cores `C64_MiSTer` and `Minimig-AGA_MiSTer`, which show no licence,
  gain closed lines under the owner-wide walled line.
  Every other line re-read kept its tier, among them [SimCoupé][simcoupe], [Classic99][classic99], [Atari800][a800],
  [openMSX][openmsx], [MAME][mame], `virtualdub.org`, and [vAmigaTS][vamigats].
  The verification pass moved five of this note's own drafted lines before they merged: [PC6001VX][pc6001vx],
  [CSCP][cscp], and [81-libretro][81lr] to walled, and XEiJ and `charlierobson/EightyOne` to closed,
  for the reasons below.
- Process calls settled here, applying ADR 0006 and the earlier surveys' precedents:
  - A bare GPL-2.0 text is walled, but a README or site that grants "or later" completes it,
    since the text leaves the version to the notice: [VICE][vice], [Hatari][hatari], [ARAnyM][aranym], [86Box][86box],
    and [ep128emu][ep128] are open, and `libretro/vice-libretro`, which builds VICE 3.10, takes VICE's grant.
  - A project that adapts walled or unlicensed code is walled whatever its own file says
    (the gopher64 precedent):
    [Amiberry][amiberry] over [WinUAE][winuae], [GSplus][gsplus] over [KEGS][kegs],
    whose site and README state no licence, [NP2kai][np2kai] over [Neko Project II][np2],
    [px68k-libretro][px68klr] over px68k, 81-libretro over EightyOne's GPLv2, and CSCP,
    whose change log shows fmgen and Neko Project 21/W code.
    PC6001VX is LGPL but says its fmgen part may be used "only in freeware", as QUASI88's is,
    and [Spectral][spectral] names proprietary and GPL parts beside a 0BSD licence file.
  - No licence found means closed: micro64, [z64k][z64k], [YACE64][yace], [SpecEmu][specemu],
    [Retro Virtual Machine][rvm], [CSpect][cspect], [WinAPE][winape], ACE-DL, WebMSX, NP21/W, px68k, JS99'er, ElectrEm,
    [trs80gp][trs80gp], Virtual ][, the GitHub copy of EightyOne, `dirkwhoffmann/virtualc64ts`, and `tomcw/mb-audit`;
    fMSX is closed for non-commercial terms, sQLux for the UQLX licence's fee caps,
    and XEiJ because its licence lets it be "distributed free of charge" only ([licence][xeij-lic]).
    Their sites stay open for prose, unless a site serves firmware or games.
    Where the code sits in archives or hosts not read, as for KEGS, Neko Project II, [Steem SSE][steem], and Amspirit,
    the source is unevaluated and stays walled.
  - Sites that serve or link firmware or games are closed and named in code spans: `bbc.xania.org`
    (jsbeeb's site, serving the ROMs and Stairway to Hell games by its README),
    `www.mkw.me.uk/beebem/` (BeebEm's site, offering a game and an installer with firmware), `www.marutan.net/rpcemu/`
    (offering RISC OS bundles),
    `archi.medes.live`, `dcmoto.free.fr`, `webmsx.org`
    (by inference from its separate C-BIOS build), the fMSX pages, the XM6 page, and `uraraworks.github.io/webx68k`.
    The ROM-dump hosts that XRoar's home page names,
    and the dumping guide and replacement-ROM site that PC6001VX's README links, were not opened and are closed too.
  - Maker ROMs shipped in open repositories are closed, and the rest keeps its tier: [Hoxs64][hoxs],
    VICE and its libretro core, [Fuse][fuse], [ZEsarUX][zesarux], [fuse-libretro][fuselr], and [beebjit][beebjit];
    [b2][b2]'s third-party `etc/` folder is walled.
    Where a path is unknown, briefs must not open the ROM files.
  - Replacement firmware is closed wherever it sits: AROS in [WinUAE][winuae], [PUAE][puae], [Denise][denise],
    [vAmiga][vamiga], and [vAmigaWeb][vamigaweb]; open-roms in [VirtualC64][vc64]; VICE's SCPU64 ROM,
    which [Kernal64][k64] also ships; EmuTOS; C-BIOS; AltirraOS; [jsbeeb][jsbeeb]'s VDFS ROM; FreeTOWNS; XM6's ROM tool;
    [XRoar][xroar]'s BSDOS boot ROM; the compatible PC-6001 ROM built into PC6001VX; and [WebX68k][webx68k]'s font ROM,
    which stands in for a system ROM though drawn from a public-domain font.
  - The XEGS, C64 Games System, GX4000, CDTV, CD32, Zemmix, and Marty are modes of their hosts ([R1-09][r109-consoles]);
    the 5200 stays a console target in [R1-26][r126].
  - A path holding "~", such as QUASI88's, gets no register line; the written rule covers it.

### The emulators compared

Key: "push" is the last push; "lr" a libretro core; "PC" Windows, macOS, and Linux;
"user" means the user supplies the firmware, and "(closed)" marks a closed part of the project.

| Emulator | Tier | Licence | Status | Machines | Firmware | Hosts |
|---|---|---|---|---|---|---|
| [VICE][vice] | open | GPL-2.0-or-later | 3.10, 2025-12-24 | C64 to C128, VIC-20, PET | ships ROMs (closed) | PC, lr |
| [Hoxs64][hoxs] | open | GPL-3.0-or-later | 1.1.2.9, 2026-07-23 | C64 | ships ROMs (closed) | Win |
| [Denise][denise] | open | GPLv3 by metadata | 2.9, 2026-08-28 | C64; A1000, A500, A600 | AROS (closed) | PC, BSD |
| [VirtualC64][vc64] | open | GPL-3.0+; MPL-2.0 core | 6.2, 2026-10-31 | C64 | user; open-roms (closed) | Mac, web |
| [Kernal64][k64] | open | MIT | push 2026-10-15 | C64, C128, VIC-20, CBM-II | SCPU ROM (closed) | JVM |
| [Frodo][frodo] | walled | bare GPL-2.0 | 4.5, 2024-12-14 | C64 | not read | PC, lr |
| [Emu64][emu64] | walled | bare GPL-2.0 | push 2026-11-25 | C64 | not read | not read |
| [plus4emu][p4e] | walled | bare GPL-2.0 | push 2020-04-02 | Plus/4 | not read | not read |
| z64k, YACE64, micro64 | closed | none found | 2026, 2020, 2018 | C64; z64k also C128 | not read | z64k JVM |
| [WinUAE][winuae] | walled | bare GPL-2.0 | 6.0.3, 2026-03-03 | A1000 to A4000, CD32 | user; AROS (closed) | Win |
| [FS-UAE][fsuae] | walled | bare GPL-2.0 | 3.2.35, 2025-09-07 | as WinUAE | user | PC |
| [PUAE][puae] | walled | bare GPL-2.0 | push 2026-11-08 | A500 to A4000, CDTV, CD32 | user; AROS (closed) | lr, web |
| [Amiberry][amiberry] | walled | GPL-3.0 over GPL-2.0 | 8.5.0, 2026-10-27 | as WinUAE | user | PC, BSD, Haiku, And |
| [vAmiga][vamiga] | open | GPL-3.0+; MPL-2.0 core | 5.1, 2026-11-25 | A500, A1000, A2000 | user; AROS (closed) | Mac |
| [WinFellow][winfellow] | walled | bare GPL-2.0 | push 2025-11-13 | Amiga | not read | Win |
| [Fuse][fuse] | open | GPL-2.0-or-later | 1.10.1 | 16K to +3, TS 2068, clones | ships ROMs (closed) | PC, BSD, lr |
| [ZEsarUX][zesarux] | open | GPL-3.0 | 13.0, 2026-06-09 | Sinclair, Next, CPC, SAM, MSX1 | ROMs (closed) | PC, BSD |
| SpecEmu | closed | freeware (from memory) | 3.4, 2026-04-25 | 48K to +3 | not read | Win |
| Spectaculator | closed | commercial | 9.1, 2026-05-23 | 48K to +3 | bundles BASIC | Win, iOS, And |
| Retro Virtual Machine | closed | none found | 2.1.20, 2025-06-14 | Spectrum, CPC, GX4000, MSX1 | not read | PC, Pi |
| CSpect | closed | free, no source | 4.5.1.0; patrons 4.6.0.0 | Next | not read | PC |
| [Spectral][spectral] | walled | mixed | push 2026-11-26 | 16K to +3, Pentagon | own ROMs (closed) | PC |
| [JSSpeccy 3][jsspeccy] | open | GPL-3.0 | 3.2, 2024-11-23 | 48K, 128K, Pentagon | not read | web |
| [AppleWin][applewin] | walled | bare GPL-2.0 | 1.32.0.0 | II to enhanced IIe | not read | Win; Linux fork, lr |
| [KEGS][kegs] | walled | none in prose read | 1.38 | IIgs | user | PC |
| [GSplus][gsplus] | walled | GPL-3.0 over KEGS | push 2026-07-22 | IIgs | user | PC |
| Virtual \]\[ | closed | shareware | 13.3 | II to //c | not stated | Mac |
| [apple2js][apple2js] | open | MIT | push 2026-11-15 | II, IIe | may hold ROMs (from memory) | web |
| [Apple2TS][apple2ts] | open | MIT by metadata | push 2026-11-27 | II+, IIe, IIgs | not read | web |
| [Clemens IIGS][clemens] | open | MIT | push 2023-08-17 | IIgs | user | PC |
| [Altirra][altirra] | walled | GPL-2.0 | 4.40, 2025-12-31 | 400 to XEGS, 5200 | user or AltirraOS (closed) | Win |
| [Atari800][a800] | walled | bare GPL-2.0 | push 2026-10-19 | 8-bit, 5200 | user; lr AltirraOS (closed) | PC, And |
| [Hatari][hatari] | open | GPL-2.0-or-later | 2.6.1, 2025-08-15 | ST to Falcon | user; EmuTOS (closed) | PC, web |
| [Steem SSE][steem] | walled | none in prose read | 4.2.1, 2026-07-19 | ST, STE | not read | Win, Lin, lr |
| [ARAnyM][aranym] | open | GPL-2.0-or-later | 1.1.0, 2019-04-14 | Falcon-like | user TOS; EmuTOS (closed) | not read |
| [Caprice32][cap32] | walled | GPL-2.0 | push 2026-11-26 | CPC, Plus, GX4000 | not read | PC |
| [libretro-cap32][lrcap32] | walled | bare GPL-2.0 | push 2026-10-30 | CPC, Plus | not read | lr |
| WinAPE | closed | freeware | 2.0b2, 2016-01-06 | CPC, Plus | ParaDOS (closed) | Win |
| ACE-DL | closed | freeware | 2026-11-11 | CPC, Plus | not read | PC, Pi |
| [CPCEC][cpcec] | open | GPL-3.0 | 20261030 | CPC | bundles Amstrad firmware | Win, SDL2 |
| Amspirit | walled | site did not answer | 2.04 | CPC | not read | Win |
| [openMSX][openmsx] | walled | GPL, no version | 22.0, 2026-10-28 | MSX1 to turbo R | user; C-BIOS (closed) | PC, BSD |
| blueMSX | walled | mixed (lr) | 2.8.2 (from memory) | MSX | C-BIOS (closed) | Win, lr |
| fMSX | closed | non-commercial | 6.0, 2021-02-24 | MSX | links ROM files | Win, Lin, And |
| WebMSX | closed | none found | 6.0 | MSX1 to turbo R | system ROMs (inference) | web |
| [jsbeeb][jsbeeb] | open | GPL-3.0-or-later | 2.28.0, 2026-11-26 | B, Master, Atom | site serves ROMs | web |
| [B-em][bem] | walled | bare GPL-2.0 | test builds; issue219c, 2024-01-19 | A to Master Compact | not read | Win, Lin |
| [BeebEm][beebem] | walled | GPL, no version | 4.23 | B, B+, Master 128 | included (inference) | Win, Mac, And |
| [b2][b2] | open | GPL-3.0 for its code | 2026-11-08 | B, Master 128, Compact | `etc/` walled | PC |
| [beebjit][beebjit] | open | GPL-3.0 | push 2026-11-25 | B, Master 128, Compact | `roms/` (closed) | PC |
| [Elkulator][elk] | walled | GPL, no version | 1.0, 2010-07-17 | Electron | not read | Win, Lin, DOS |
| [Neko Project II][np2] | walled | none in prose read | 0.86, 2016-03-06 | PC-9801 | not read | Win, Mac |
| [NP2kai][np2kai] | walled | MIT over NP2 | push 2026-09-05 | PC-9801, PC-9821 | user | PC, lr |
| NP21/W | closed | none found | push 2026-11-26 | PC-98 | not read | Win |
| XM6 TypeG | walled | terms unread | 3.38, 2026-02-23 | X68000, X68030 | user; ROM tool (closed) | Win |
| px68k | closed | none found | push 2021-04-26 | X68000 | user | PSP, And, Pi |
| [XEiJ][xeij] | closed | free distribution only | 0.26.11.08 | X68000 | Sharp IPL-ROM (closed) | JVM |
| [Tsugaru][tsugaru] | open | BSD-3-Clause | push 2026-10-31 | FM Towns II MX, Marty | user | Win, Mac |
| [Geartowns][geartowns] | open | GPL-3.0 by metadata | push 2026-11-27 | FM Towns, Marty | user | PC, BSD, lr |
| [MAME][mame] | walled | GPL-2.0, texts differ | 0.289, 2026-07-31 | most rows (from memory) | user | PC |
| [Clock Signal][clk] | open | MIT | 2026-07-23 | 18 machines, 3 partial | not stated | Mac, Lin, BSD |
| [CSCP][cscp] | walled | GPL-2.0+ over fmgen, NP21/W | 2026-01-01 | Japanese machines, many | not read | Win |

Sources by row: each project's README, licence file, metadata, site, or libretro page, cited in its paragraph below.

### Multi-system emulators

- [MAME][mame] covers nearly every row of R1-09 since it absorbed MESS
  (from memory; the driver list was not read), and its walled tier, settled in [R1-25][r125], holds.
- [Clock Signal][clk] emulates eighteen machines, among them the Electron, BBC Micro, CPC, Apple II and IIe, ST, Plus/4,
  VIC-20, Enterprise, MSX 1 and 2, Oric, ZX80 to Spectrum, CoCo, and Thomson MO5 and MO6, with the Archimedes, Amiga,
  and early PC "less rounded".
  It says "This emulator attempts cycle-accurate emulation of all supported machines.
  In some cases it succeeds.", and decodes composite video from the signal itself (README); it has 1,158 stars
  (metadata).
- [ZEsarUX][zesarux] spans the Sinclair line and its clones, the QL, Jupiter Ace, CPC, PCW, SAM Coupé, and MSX1;
  its README says it "includes third-party roms, media, programs and games NOT covered by this license",
  and that it can browse online game sites.
- The [Common Source Code Project][cscp] packs one emulator per machine for dozens of Japanese machines,
  from the PC-9801 to the Sord M5; its licence changed from "GPL v2" to "GPL v2 or Later",
  but its change log shows fmgen and Neko Project 21/W code inside it, so it is walled (home page).
- [ep128emu][ep128] covers the Enterprise, Spectrum, CPC, and Videoton TVC, but only CRTC type 0,
  and its installer downloads a ROM package from a forum host, closed in the register (README).
- libretro cores carry most of these to phones and consoles
  ([libretro, "VICE"][lr-vice]), and [EmulatorJS][ejs] runs `vice_x64sc` on the web.
  MiSTer's C64 and Minimig AGA cores show no licence (metadata), so they are closed.

### Commodore 8-bit

- [VICE][vice], begun in 1993, has been free software under the GPL since 2004
  and was by then one of the most widely used Commodore emulators
  ([Wikipedia, "VICE"][w-vice]; secondary); its site grants "or later".
  Its manual says "VICE aims to be cycle accurate": `x64sc` is "a cycle-based and pixel-accurate VIC-II emulation",
  the older `x64` is no longer built by default, the CIAs and VIAs are cycle accurate,
  and reSID is the accurate SID engine ([manual][vice-man]).
  It warns: "Please do not expect the C64DTV, C128, PET, PLUS4,
  SCPU64 and CBM-II emulators to be as good as the C64 or VIC20 one".
  Its [model page][c64models] lists the 6569, 6569R1, 6567, 6567R56A, 8565, 8562, and Drean 6572 VIC-II revisions.
  It reads G64 and P64 disk images, and its binary monitor serves third-party debuggers (site).
  [Cloanto's C64 Forever][c64f] is a VICE fork
  (its source page), and the mirror has 135 stars ([VICE-Team/svn-mirror][vice-gh]).
- VICE ships the Commodore ROMs: its manual says "Every emulator requires its own ROM set", lists the ROM files,
  and says the PET editor ROMs "are provided"
  ([ROM files][vice-man3]);
  libretro's page says "All required files are embedded"
  ([libretro, "VICE"][lr-vice]),
  and Debian removes "the ROM files distributed with the version that can be downloaded there"
  ([Debian copyright file][deb-vice-copy]).
  No permission statement was found in its site or manual (searched); the repository's ROM path is unknown,
  from memory `vice/data/`.
- [Hoxs64][hoxs] is a Windows C64 emulator under GPL-3.0-or-later, whose README lists `Kernal.rom`, `Basic.rom`,
  `Char.rom`, and `C1541.rom` as "Copyright (C) by Commodore Business Machines".
  The [testbench][testbench] notes that it emulates "only one specific configuration" ("Tests and published results").
- [Denise][denise] calls itself "a cycle accurate C64 / Amiga 1000/500/600 emulator" (project page).
  Its release notes, on a files page now closed for shipping AROS, add debuggers for the CPU, Copper, Blitter, Paula,
  and CIAs, run-ahead, and "encrypted kick rom support", and credit vAmigaTS
  for accuracy work (`sourceforge.net/projects/deniseemu/files/`).
  Its code host was not found, so its licence rests on metadata.
- [VirtualC64][vc64] puts "a strong emphasis on PAL emulation accuracy" ([site][vc64-site]),
  splits its licence into a GPL-3.0-or-later app, an MPL-2.0 core, an MIT CPU core,
  and GPL-2.0-or-later reSID (LICENSE), and ships the MEGA65 open-roms, closed;
  [vc64web][vc64web] carries it to the web, iOS, and Android.
- [Kernal64][k64], in Scala, claims a "6510 CPU cycle-exact" core and is "Shipped with VICE's SCPU rom" (README).
  [Frodo][frodo], whose site calls it the first C64 emulator "without a '64' in its name",
  has a cycle-exact and a "Lite" core and 30 seconds of rewind (README; [site][frodo-site]).
  The z64k site claims "Pixel exact emulation" of the C128, C64, Spectrum, VIC-20, and 2600 ([z64k][z64k]);
  YACE64 offers 3D and VR views ([YACE64][yace]).

### Amiga, with the CDTV and CD32

- UAE began in 1995 as the "Unusable Amiga Emulator", gained a JIT in 2000, and spread as WinUAE, PUAE, FS-UAE,
  and others; its 68000 core also runs in Hatari and Basilisk II ([Wikipedia, "UAE (emulator)"][w-uae]; secondary).
- [WinUAE][winuae], by Toni Wilen, models the A1000's original chips, OCS, ECS, and AGA,
  with "optional cycle-exact emulation mode" for all chip sets and an optional x86 JIT for the 68020
  and later ([features][winuae-site]).
  It claims "A500 emulation in cycle-exact mode is 100% accurate",
  but of the A1200 and CD32 that the "CPU internal instruction execution speed is not exact".
  Release 4.10.0 made unexpanded 68000 machines "100% cycle-accurate", crediting test programs by ross
  ([4.10.0][winuae-410]), and 6.0.0 rewrote the chipset and made a cycle-exact A500 the default ([6.0.0][winuae-600]).
  Its build steps download an AROS Kickstart into the source tree, and its site asks for boot ROM dumps;
  both are closed.
- [FS-UAE][fsuae] is "based on the excellent emulation code from WinUAE" with a focus on games ([site][fsuae-site]),
  and [PUAE][puae], the libretro core, is based on WinUAE 5.3.1, with model presets from the A500 to the A4000, CDTV,
  and CD32 and a built-in AROS fallback (README).
  PUAE also accepts [Amiga Forever][af]'s encrypted ROMs with their `rom.key`, a key file the note does not open,
  and embeds a WHDLoad helper.
- [Amiberry][amiberry] adds JIT for ARM64 and x86-64 and has the most stars of the Amiga emulators, 998 (metadata).
  Release 8.5.0 stopped bundling WHDLoad and libraries whose licences forbid it
  (release notes, read in research; the guard blocked a re-read);
  its README names an 8.6.0 package and an Android edition in closed testing.
- [vAmiga][vamiga] emulates the A500, A1000, and A2000 ([site][vamiga-site]),
  with an "Emulation accuracy" section in each release note,
  and its author's [vAmigaTS][vamigats] compares its output with "reference images taken on real Amigas".
  Its site still calls the Kickstart ROMs "the intellectual property of Cloanto"; that is now out of date
  ("Legal exposure").
  [vAmigaWeb][vamigaweb] runs the same core in a browser, with "the free AROS-Rom replacements"
  ([about][vamigaweb-site]).
- [WinFellow][winfellow] continues Fellow, UAE's rival of the 1990s; Amiga Forever bundles it beside WinUAE
  ([Amiga Forever][af]).
  Denise and Clock Signal cover the Amiga too.

### ZX Spectrum, from the 16K to the Next

- [Fuse][fuse] claims "Accurate 16K, 48K
  (including the NTSC variant),
  128K, +2, +2A and +3 emulation", "Working" TS 2068, Pentagon, and Scorpion support, many interfaces,
  and RZX recording, and is "licensed under the GNU General Public License, version 2 or later" (home page).
  Its source tarball holds a `roms/` folder that Debian strips as "non-free software"
  ([Debian copyright file][deb-fuse]), and fuse-libretro bakes the ROMs in ([fuse-libretro][fuselr]).
  Flathub counts 47,810 installs ([Flathub statistics][flathub]);
  the [Sinclair Wiki's emulator list][sw-emus] puts it first, and the ZX Spectrum Vega+ ran it
  ([Wikipedia, "ZX Spectrum"][w-zx]; secondary).
- [ZEsarUX][zesarux] claims "Almost perfect emulation of timing of all Spectrum machines", MEMPTR, contended memory,
  early and late ULA timings, and snow, plus a reverse debugger (README).
- SpecEmu, Mark Woodmass's freeware (from memory), is still built:
  the build of 2026-04-25 adds a new "late timings model",
  after MEMPTR and Q-flag fixes in builds of 2024-02-03 and 2024-04-01 ([site][specemu]).
  Spectaculator, with a "30-day free trial" since 2001,
  has phone editions that bundle Sinclair BASIC and licensed games,
  and whose SZX snapshot format is open to others ([site][spectaculator]).
  Retro Virtual Machine covers the Spectrum, the CPC with the Plus and GX4000, and MSX1 ([site][rvm]),
  and Mike Dailly's CSpect, for the Next, is a development tool with "NO support" ([page][cspect]).
- [JSSpeccy 3][jsspeccy] runs the 48K, 128K,
  and Pentagon in a browser with "Cycle-accurate emulation of scanline / multicolour effects",
  loading tapes "via traps only" (README).
  [Spectral][spectral] claims cycle-stepped Z80 and ULA cores; [SpecIde][specide] is archived (metadata).

### Apple II and IIgs

- [AppleWin][applewin], begun in 1994
  ([Wikipedia, "AppleWin"][w-applewin]; secondary),
  covers the II to the enhanced IIe and clones, with NTSC video and a symbolic debugger, but "no support for the //c,
  //c+, Laser 128 ... or Apple IIgs" (README); [its Linux fork][applewin-lin] adds a libretro core.
  It has 948 stars (metadata); that it embeds Apple ROM images is from memory, so briefs treat it as a firmware hazard.
- [KEGS][kegs], Kent Dickey's IIgs emulator, claims to emulate "an Apple IIgs accurately" and asks the user for the ROM;
  neither its site nor its README states a licence (read 2026-11-27).
  [GSplus][gsplus] rebuilds KEGS 1.38 with SDL3 and says "The ROM is Apple's copyrighted firmware,
  so GSplus can't ship it"; its README also points users to firmware sources, a pointer not followed,
  and says the author used AI to build it.
- [Clemens IIGS][clemens] "Passes Self-Diagnostic Tests", the IIgs's own diagnostics (README).
  Virtual ][ is macOS shareware covering the II to the //c ([site][virtualii]);
  [apple2js][apple2js] and [Apple2TS][apple2ts] run in browsers, the second with IIgs profiles and WOZ flux images.
  Mednafen's apple2 module emulates the II to the enhanced IIe from user firmware ([Mednafen][mdf-apple2]).

### Atari 8-bit and ST

- [Altirra][altirra] claims "Full, cycle-exact emulation of all documented hardware features" of the 400/800, 1200XL,
  XL, XE, XEGS, and 5200, and its downloads carry "no code or software from Atari"; its own OS, BASIC,
  and handler ROMs are closed, and its manual is in [R1-09][r109-src].
  [Atari800][a800] dates from 1995 ([site][a800-site]).
- [Hatari][hatari] covers the ST, STE, TT, and Falcon with "cycle-accurate 68000 emulation", a debugger,
  and STX and IPF disk images; TT and Falcon support is "still in development and experimental"
  ([manual][hatari-man]; [site][hatari-site]).
  Its README names WinUAE's cycle-exact CPU core, says its packages ship EmuTOS as `tos.img`,
  and grants an exception for linking the IPF library;
  and the manual says original TOS cannot be shipped "since these images are still copyrighted";
  its official repository is on [Framagit][hatari-fg].
- [Steem SSE][steem] released 4.2.1 on 2026-07-19, after 4.2.0 in 2025 ended a pause;
  its native STX support "isn't cycle-accurate" (blog).
  [ARAnyM][aranym] is a virtual machine more than an accurate emulator, booting TOS 4.04, EmuTOS, MagiC,
  or Linux (README); its last release could not be re-read (guard block), and it was pushed on 2026-03-07 (metadata).

### Amstrad CPC, Plus, and GX4000

- [Caprice32][cap32] recreates "the operations of all hardware components at a low level",
  with the Plus and GX4000 "Mostly working", lacking vectored and DMA interrupts (README);
  [its libretro core][lrcap32] rewrote the ASIC, DMA, and PPI in 2026.
- WinAPE, Windows freeware last released in 2016, emulates the Plus with "accurate Monitor emulation, CRTC emulation,
  ASIC emulation" and ships ParaDOS ([features][winape]).
  ACE-DL, from ACE on MorphOS, had a release on 2026-11-11 ([site][acedl]; its host did not resolve on 2026-11-27).
  Arnold, Kevin Thacker's emulator, survives as [a mirror][arnold]; its site is gone (research log).
- [CPCEC][cpcec] replicates "the CRTC 6845 and Gate Array video chips" under GPL-3.0,
  and its packages bundle Amstrad firmware and MSX firmware, so they are closed.
- Amspirit, in its full 2.04 and Lite 1.12 editions, is the only emulator with the [Shaker][shaker] seal
  ("Tests and published results"); its site did not answer (research log).
  [CrocoDS][crocods] is an MIT libretro core.

### MSX, each generation with the R800

- [openMSX][openmsx] covers "Almost all MSX systems" from MSX to turbo R in over 230 configurations,
  with "Cycle accurate VDP command engine timing" and copy-protected DMK disks ([features][openmsx-feat]).
  Its 22.0 news says many accuracy contributions were made "with the help of AI tools".
  It ships C-BIOS, closed, in place of the MSX-BIOS ([setup guide][openmsx-setup]).
- blueMSX "was originally derived from fMSX", and its libretro core is walled ([bluemsx-libretro][bluemsx-lr]);
  its last desktop release is 2.8.2 for Windows
  (from memory).
  fMSX, Marat Fayzullin's emulator, is closed for its non-commercial terms, and its pages link MSX system ROM files,
  so they are not linked (`fms.komkon.org/fMSX/`); it is the most ported MSX emulator
  ([Wikipedia, "FMSX"][w-fmsx]; secondary).
- WebMSX runs MSX1 to turbo R in a browser, with "R800 CPU advanced timing may not be completely accurate"
  (README of `ppeccin/webmsx`).
- The MSX Association's MSX-PLAYer is "the only official MSX emulator",
  built on fMSX and shipped on magazine CDs from 2002 to 2008 ([MSX Resource Center wiki][msxplayer]).
  D4 Enterprise, which runs the licensed Project EGG service, ported MSX games to iOS from December 2008
  ([Wikipedia, "D4 Enterprise"][w-d4]; secondary); its site looped on redirects (research log).

### BBC Micro and Electron

- [jsbeeb][jsbeeb] emulates the BBC B, Master 128, and Atom in a browser, "heavily based on Sarah Walker's C B-Em",
  and its README lists more test suites than any other read ("Tests and published results").
- [B-em][bem] claims "Cycle-accurate video emulation", all undocumented 6502 instructions,
  and second processors for the 6502, 65816, Z80, and 32016 (README).
  [BeebEm][beebem] moved to Codeberg under Chris Needham at 4.23,
  and its site says the installer "contains everything you need" (`www.mkw.me.uk/beebem/`, closed).
- [beebjit][beebjit] is a recompiler that turns "6502 code blocks into host
  (Intel x64 or ARM64)
  code blocks", claims "well over 10GHz" effective speed, and runs protected discs (README). [b2][b2], by Tom Seddon,
  covers the B, Master 128, Compact, and Olivetti PC 128 S, and its README says it is in RetroArch on the App Store;
  libretro documents the core ([libretro, "b2"][lr-b2]).
- [Elkulator][elk] for the Electron became "cycle accurate" in a rewrite at 0.7
  and was last released in 2010 ([site][elk-site]); ElectrEm, Thomas Harte's cycle-accurate Electron emulator,
  is archived (metadata).

### PC-9801 and X68000

- [Neko Project II][np2] stopped at 0.86 in 2016 ([site][np2]); [NP2kai][np2kai] carries it to wxWidgets, SDL, the web,
  and libretro, and tells users to dump BIOS files from "actual PC-98 machine" (README),
  while linking a firmware repository, not followed.
  NP21/W adds late PC-98 hardware, and [DOSBox-X][dosbox-x] has a PC-98 mode whose BIOS is closed
  as system software (READMEs).
- XM6 TypeG, from PI. and GIMONS, models the X68000 to the X68030 with scheduling in 500 ns units and a debugger;
  its page links Sharp's IPL-ROM release and a tool that builds substitute ROMs,
  so it is cited in a code span (`retropc.net/pi/xm6/index.html`). px68k forks WinX68k and xkeropi with no licence;
  [px68k-libretro][px68klr] needs the user's BIOS (README).
- [XEiJ][xeij] calls itself "an experimental X68000 emulator",
  and thanks the rights holders and the users' forum that released the system software free.
  Its licence allows distribution "free of charge" only, so it is closed, and it bundles Sharp's free system software,
  such as `IPLROM.DAT` and `HUMAN.SYS` ([licence][xeij-lic]); the site stays open for prose.
  MAME's X68000 driver is well regarded (lead).
- [WebX68k][webx68k] bundles Sharp's IPL-ROM and Human68k 3.02 under the release terms ("Legal exposure").

### Other machines

| Machine | Emulators (tier) | Notes |
|---|---|---|
| TRS-80 I, III, 4 | [trs80gp][trs80gp] (closed); [xtrs][xtrs] (walled); MAME | "Cycle perfect sub-instruction Z-80" |
| CoCo, Dragon, MC-10 | [XRoar][xroar] (open); [VCC][vcc] (open); Clock Signal | XRoar 1.13.1, 2026-11-15 |
| TI-99/4A | [Classic99][classic99] (walled); JS99'er (closed); MAME | Classic99 ships ROMs licensed by TI |
| Oric | [Oricutron][oricutron] (walled); Clock Signal | ships demos and games by permission (README) |
| Thomson MO and TO | DCMOTO (closed site); Teo (not read); Clock Signal | Teo's site refused scripts |
| SAM Coupé | [SimCoupé][simcoupe] (walled); ZEsarUX | ships the SAM ROMs by Andy Wright's permission |
| Enterprise, TVC | [ep128emu][ep128] (open); Clock Signal | [Xep128][xep128] (walled) merged into Xemu |
| Archimedes | [Arculator][arculator] (walled); [RPCEmu][rpcemu-dev] (walled) | Archimedes Live ports Arculator |
| Sharp MZ, X1 | CSCP (walled); MAME | X millennium (lead) |
| PC-8801, PC-6001 | CSCP; QUASI88 (walled); [PC6001VX][pc6001vx] (walled) | M88 (lead) |
| FM-7, FM Towns, Marty | CSCP (FM-7); Tsugaru; Geartowns | UNZ (lead) |
| QL; PCW | sQLux (closed); ZEsarUX; [JOYCE][joyce] (walled) | JOYCE's licence not found on its page |
| ZX80, ZX81 | [EightyOne][eightyone-sf] (walled); [81-libretro][81lr] (walled) | ZEsarUX and Clock Signal too |
| Minor rows | ZEsarUX (Jupiter Ace); CSCP (Sord M5, Pasopia, MULTI8, RX-78, PV-2000); MAME | not searched further |

- XRoar claims "Accurate timing for PAL and NTSC Dragons and CoCo 1/2s" and an MC6809 accurate "down to
  which cycles are non-valid memory address" ([features][xroar-feat]).
  Its home page says "Firmware ROM images are required" and names two hosts of ROM dumps, closed
  and not opened ([XRoar][xroar]).
- trs80gp picks Level I or II BASIC and a ROM revision by option and gives its disk controller a ROM itself,
  so it appears to embed Tandy ROMs, a firmware hazard (inference from [its page][trs80gp]).
- EightyOne's SourceForge project gives GPLv2 with no "or later" (metadata), so it is walled; its GitHub copy,
  `charlierobson/EightyOne`, has no licence file and is closed; 81-libretro, a port of it,
  says GPLv3 (README) and is walled as an adaptation.
- PC6001VX is LGPL, with fmgen "only in freeware", and builds in Akikawa's compatible ROM, closed;
  its README links a ROM-dumping guide and the ROM's site, neither opened (README).
- [Arculator][arculator] emulates MEMC1 timing, the ARM3 cache, and FPA10 ([site][arc-site]),
  and bans "AI generated/assisted code" (README); RPCEmu, for the later Risc PC,
  has interpreted and recompiling ARM cores
  (from memory)
  and needs a RISC OS ROM, which its site, `www.marutan.net/rpcemu/`, offers in bundles, so the site is closed.
- [Tsugaru][tsugaru] claims "more than 97% of the FM TOWNS commercial application titles",
  passes "TEST386 enhanced tests", and points users to a free replacement ROM, closed (README).
  [Geartowns][geartowns] claims high accuracy, passes of [test386][test386] and SingleStepTests 80386,
  and embeds an MCP server for AI debugging (README).
- The QUASI88 site is cited in a code span because its path holds "~": `www.eonet.ne.jp/~showtime/quasi88/`.
  It is modified-BSD for its own code with MAME and fmgen sound code under their terms, so walled.

### Boundary: IBM PC compatibles and the classic Macintosh

| Emulator | Licence and its evidence | Tier |
|---|---|---|
| [DOSBox][dosbox] | GPLv2 per SourceForge metadata | walled; DOS and BIOS layers closed |
| [DOSBox-X][dosbox-x] | GPL-2.0, no "or later" (README); bare COPYING | walled |
| [DOSBox Staging][staging] | "GPL-2.0-or-later" (LICENSE); four parts unversioned | open, changed; parts walled |
| [86Box][86box] | bare COPYING; README grants "or later" | open; ROM sets apart (from memory) |
| [PCem][pcem] | "GPL v2.0" (README) | walled |
| [Basilisk II, SheepShaver][macemu] | "GPL", no version (README); [maintained fork][macemu-fork] | walled |
| [Mini vMac][minivmac] | "version 2" of the GPL (licence page) | walled |

- Including the boundary would add the PC's processor range, five or more video standards, six or more sound devices,
  many BIOS vendors, and 8,462 DOS games, about a fifth of the family's total ([R1-09][r109-boundary]).
  DOSBox and its forks reimplement DOS and the BIOS at a high level, so those layers are closed;
  86Box and PCem need the user's BIOS ROMs, and the Mac needs ROMs Apple never released (R1-09).
  PCem says "NO COPYRIGHTED ROM FILES ARE INCLUDED NOR WILL THEY BE" (README).

### Licensed and official distributions

- [Amiga Forever][af] calls itself "the official Amiga and AmigaOS preservation, emulation and support suite",
  from $19.95, with "all (0.7-3.X) ROM and Workbench versions" in its Plus Edition, WinUAE and WinFellow, and AROS 68K.
  [C64 Forever][c64f], with a free Express Edition, runs the PET to the C128 "with legal CBM system ROMs" on VICE.
- Cloanto's EULA "does not allow the use of the ROM and OS files on third-party 'Amiga-compatible' devices",
  which need an OEM licence between the device maker and Amiga ([Cloanto KB 13-122][kb122]).
- Retro Games' THE400 Mini is "produced under license from Atari Interactive" and emulates the 400 to the XE
  and the 5200 ([product page][the400]); MSX-PLAYer, Project EGG, and Spectaculator are above.

### Legal exposure

This section builds on [R0-02][r002] and records what is specific to this family as findings and risks.
It is not legal advice.

- Commodore and Amiga.
  Amiga Corporation says it "holds the registered and unregistered copyrights in the works of the former Commodore
  and Amiga companies", CBM 8-bit and Amiga firmware included,
  by a chain of title partly "preserved and consolidated by Cloanto", and names Cloanto, Retro Games,
  and SpecNext among its licensees (release of 2026-08-04, reproduced by [amiga-news.de][amiga-news]).
  Cloanto says the files "may only be used or distributed under license",
  and that owning an Amiga "does not grant any right to reproduce the ROM" ([KB 13-122][kb122]).
  Amiga Inc. had passed its rights in 2019 to a company of Cloanto's director, later renamed Amiga Corporation
  ([Wikipedia, "Hyperion Entertainment"][w-hyperion]; secondary),
  and Hyperion settled with it on 2026-08-04 ([Hyperion][hyperion]).
  Debian's VICE package still names Tulip as the holder, a dated packager's view ([Debian, "vice"][deb-vice]).
- Enforcement.
  Cloanto's 2023 GitHub notice reached Kickstart files in `archtaurus/RetroPieBIOS`, a "Full BIOS collection",
  after a "friendly 'ask nicely first' mail"
  ([2023 notice][dmca-2023]);
  a 2016 notice reached `amigasource/amigaos` and three forks,
  which it says hold "a pirate copy of our copyrighted Amiga ROM and operating system software"
  ([2016 notice][dmca-2016]).
  The research pass's searches for Cloanto, Kickstart, Commodore, ZX Spectrum, Amstrad, Apple II, Amiga, MSX,
  and Atari ST notices found none against a home-computer emulator
  (research log; not repeated, since that would search inside a repository),
  and [R0-02's history][r002-take] names none.
- Amstrad and Sinclair.
  Cliff Lawson's 1999 post, in excerpts Debian quotes (secondary),
  says "Amstrad are happy for emulator writers to include images of our copyrighted code as long
  as the (c)opyright messages are not altered" and "No one should be charging for the ROM code"
  ([Debian spectrum-roms copyright][deb-roms]; [R1-09][r109-fw]);
  a 2002 post reports letters limiting the ROMs to emulators (secondary).
  Debian judges the terms non-free.
  Amstrad passed to BSkyB in 2007, and in 2024 Alan Sugar bought back only the name
  ([Wikipedia, "Amstrad"][w-amstrad]; secondary).
  Finding: the permission works like a non-commercial term under [ADR 0006][adr6],
  so it cannot cover a bundle in a GPL-3.0 program, and its present holder is unknown (inference).
  The ZX mark is still licensed separately:
  Retro Games' 2024 machine is "The Spectrum" because "the ZX trademark is unlicensed from Sinclair"
  ([Wikipedia, "ZX Spectrum"][w-zx]; secondary).
- Apple.
  Apple v Formula affirmed an injunction,
  rejecting the argument that operating-system programs in ROM are not copyrightable
  (9th Circuit, 1984-02-08; [725 F.2d 521][formula]),
  beside R0-02's [Franklin][r002-fw]; VTech's Laser 128 reimplemented the Monitor ROM by clean room,
  licensed a compatible BASIC, and stayed on sale
  ([Wikipedia, "Laser 128"][w-laser]; secondary), a historical case of [option 5][r002-o5].
- Acorn, TI, and Sharp.
  Acorn emulators ship Acorn firmware with no permission found
  (beebjit, BeebEm, jsbeeb's site, RPCEmu's RISC OS 3.71 bundle,
  where the permission read covers only RISC OS 5 and RISC OS Direct).
  Sharp's IPL-ROM and Human68k 3.02 may be redistributed "無改変・無償"
  (unmodified, free; the note's translation)
  with their terms attached, but the font ROM "は無償公開の対象外" (is outside the free release)
  ([WebX68k README][webx68k]; [INTERNET Watch][iwatch2]); the terms file sits beside the firmware, unread.
- Copy protection.
  The Copyright Office treats obsolete programs that check for the original floppy
  as "works protected by access controls"
  ([71 Fed. Reg. 68472][fr2006]);
  today's exemption for games that need no server serves eligible institutions only,
  and individuals only where a game's server has closed ([37 C.F.R. § 201.40][cfr]; [R0-02][r002-exempt]).
  The SPS library that decodes IPF images "cannot be used in commercial products,
  services or be contained in any distribution where money changes hands"
  ([SPS download page][sps]; [decoder licence][kryoflux]),
  so it is closed, and every emulator found that reads IPF loads it as a separate library.
  Finding: an emulator that reads a protected image as the drive would circumvents nothing it uses,
  and cracking tools and cracked images are the conduct at risk (inference).
- Lock-out: only the TI-99/4A's 1983 cartridge chip ([R1-09][r109]); the CPC Plus's ASIC lock is, in Amstrad's words,
  "a deliberately obscure I/O sequence" that "protects existing software from accidents"
  ([Arnold V specification][arnold-v]).
  No boot logo check was found.
- R0-02's options: [option 1][r002-o1] fits the whole family; [option 4][r002-o4] is the norm;
  every option 5 replacement found is closed; [option 6][r002-o6] exists only in altered forms
  (Amstrad's permission, Sharp's release, Amiga Corporation's paid licences, Classic99's TI licence);
  [option 7][r002-o7] bears on projects that point to firmware or dumping
  (GSplus, NP2kai, XRoar, Hatari, ep128emu, PC6001VX);
  [options 14 and 15][r002-o14] on the Commodore, Amiga, Atari, and Sinclair marks.
- Provenance: GSplus, openMSX 22.0, and Geartowns state AI help, and Arculator bans it ([R0-06][r006]).

### How hard the family is to emulate

- C64: the VIC-II halts the CPU for 40 to 43 CPU clock cycles on each bad line,
  which a write to YSCROLL can start or cancel at any cycle
  ([Bauer][bauer], section 3.5);
  VICE emulates seven VIC-II revisions ([C64models][c64models]),
  and the undocumented ANE constant varies between real chips,
  so the testbench fixes one and notes "the test will fail on some real C64s" ([testbench][testbench]).
  The 1541 drive has its own 6502, ROM, and RAM, so true drive emulation runs two CPUs ([VICE manual][vice-man]).
  A tape loader on a real game depends on one undocumented opcode constant (testbench).
- Amiga: WinUAE needed cycle-exact chipset DMA, bus pipelining, copper, and CIAs,
  and test hardware for 68000 interrupt timing, before calling the A500 exact
  ([4.9.0][winuae-49]; [4.10.0][winuae-410]);
  its A1200 still lacks exact CPU timing ([features][winuae-site]), and copy-protected disks need flux-level images
  (from memory).
- Spectrum: the 48K's contention pattern of 6, 5, 4, 3, 2, 1, 0, 0 T-states differs on the 128 and the +2A and +3
  ([Sinclair Wiki, "Contended memory"][sw-cont]);
  some games read the floating bus ([Sinclair Wiki, "Floating bus"][sw-float]); custom tape loaders protect games
  ([Sinclair Wiki][sw-tape]);
  and z80test's README records that in 2012 SCF and CCF were found to depend on
  whether the previous instruction changed the flags ([z80test][z80test]).
- CPC: five CRTC types from several makers
  and several Gate Array series differ in operations beyond their specifications,
  which causes compatibility problems ([Shaker][shaker]).
  The Plus ASIC's DMA and vectored interrupts are still incomplete in Caprice32.
- BBC Micro and Electron: a 6845, the video ULA, teletext, two VIAs, two disc controllers, and second processors,
  with timing-sensitive protection (jsbeeb and B-em READMEs; R1-09).
- ST: the STF powers up in one of four wake-up states that move the timing of border tricks
  ([Hatari manual][hatari-man]).
- MSX: the R800 differs in undocumented flags ([R1-09][r109]), and WebMSX calls its R800 timing approximate (README).
- Techniques: interpreters everywhere; recompilers in beebjit, WinUAE, Amiberry, and RPCEmu;
  tape and microdrive traps in Fuse, JSSpeccy 3, and ZEsarUX; composite decoding in Clock Signal; WebAssembly in vAmiga,
  VirtualC64, JSSpeccy 3, and Archimedes Live.

### Tests and published results

| Suite | Machines | Oracle | Register | Published results |
|---|---|---|---|---|
| [VICE testbench][testbench] | Commodore 8-bit, 9 models | real machines | open wiki | 16 C64 rows |
| Lorenz 2.15 ([text][lorenz]) | 6510, CIA | the author's C64-I PAL | public domain; host walled | testbench rows |
| [vAmigaTS][vamigats] | OCS, ECS | images taken on real Amigas | open | none |
| [z80test][z80test] | Z80 | a real 48K Spectrum | open | none |
| [MrKWatkins suites][mrkw] | Z80, Spectrum timing | mixed; bundles ROMs | walled | none |
| [Shaker][shaker] | CPC CRTC, Gate Array | about 1,500 photographs | open | seal: Amspirit, full and Lite |
| Acid800 | Atari 8-bit | hardware, by description | walled | leads only |
| [a2audit][a2audit] | II to IIc | real hardware, by intent | open | none |
| [dp111/6502Timing][dp111] | BBC 6502 | not stated | open | none |
| [jsbeeb][jsbeeb]'s tests | 6502, 65C12, VIA, FDC | a real BBC B for one test | in jsbeeb | jsbeeb runs them |
| [test386][test386] | i386 | "never tested on real hardware" | open | Tsugaru, Geartowns |
| [Hatari list][hatari-compat] | ST titles | user reports | open site | per title |

- The testbench's C64 results, as passed of tested, with the page last edited 2026-01-13 ([testbench][testbench]):
  Denise 1,305 of 1,348 (96.8%), Hoxs64 938 of 996 (94.2%), VICE `x64sc` 1,272 of 1,354 (93.9%), z64k 1,169 of 1,253
  (93.3%), the Turbo Chameleon cartridge 90.7%, VICE `x64` 83.4%, the Ultimate 64 77.8%, Kernal64 77.8%, Frodo 73.6%,
  micro64 72.8%, YACE 54.7%, and Emu64 44.2%.
  On the VIC-20 `xvic` passes 74 of 74, and on the C128 `x128` 2,115 of 2,154; VirtualC64 has no row.
  The page warns that it "rates every test equally" and gives "only ... a rough idea".
- Lorenz's suite says that if it runs through on an emulator,
  that emulator "is compatible to my C64 regarding every tested detail" ([text][lorenz]);
  in the testbench's failure tables Denise, `x64sc`, Hoxs64, z64k on its C64 setting, the Turbo Chameleon cartridge,
  `x64`, and Frodo, with six tests not run, show no Lorenz failure (the note's count from the tables).
- Shaker's "Approved Seal" goes to emulators "passing the vast majority of SHAKER tests",
  and Amspirit 2.04 and Amspirit-Lite 1.12 hold it; the site's comparison data set older versions of Amspirit, CPC-SE,
  WinAPE, and CPCEC beside real hardware
  ([Shaker][shaker], its `api/archs` list); its Creative Commons variant is not stated, so its test disk is walled.
- WinUAE's claims rest on its author's cputester, and Acid800 passes appear only in forum threads (lead);
  no published pass table was found for vAmigaTS, z80test, a2audit, the ST, MSX, the BBC, the X68000, or the PC-98
  (repository and site reads, web searches, 2026-11-26).

## Options and trade-offs

### Which emulators the roadmap's studies cover

- **What:** no single-system [emulator study][studies] covers a home computer, though MAME (R1-54), BizHawk
  (R1-64: C64, Spectrum, MSX, and Apple II cores, by [its README][bizhawk]),
  and ares (R1-60: MSX, by [its README][ares]) touch it.
  Add one study of [VICE][vice], open and the [testbench][testbench]'s host;
  or of an open single-system reference per family, such as [vAmiga][vamiga], [Fuse][fuse], [Hatari][hatari],
  or [jsbeeb][jsbeeb]; or rely on those three.
- **Costs:** each study adds a roadmap item; VICE's repository ships ROMs that a study must skip; the most-used Amiga,
  Atari 8-bit, and MSX emulators are walled, so a study of them reads prose only.
- **Gains:** VICE spans the whole Commodore line with the only ranked pass-rate table found
  (Shaker's photo comparison for the CPC is the other cross-emulator result);
  vAmiga, Fuse, Hatari, and jsbeeb are open and each carries tests or hardware claims.
- **Used by:** [Denise][denise] and [VirtualC64][vc64] fix bugs against the testbench, and Denise credits vAmigaTS
  (release notes, read in research; the verifiers could not re-read them).

### Which test oracles to adopt

- **What:** adopt the hardware-referenced suites
  ([VICE testbench][testbench], [Lorenz][lorenz], [vAmigaTS][vamigats], [z80test][z80test], [a2audit][a2audit]),
  run [Shaker][shaker] and Acid800 as programs only, or measure owned machines.
- **Costs:** vAmigaTS needs a Kickstart; Shaker's licence variant and Acid800's licence leave their code unread;
  the testbench's oracle choices fail on some real C64s; a2audit's register line warns it may copy two ROM routines.
- **Gains:** these are the only oracles found that name real hardware, and the testbench already ranks rivals.
- **Used by:** VICE, Denise, [Hoxs64][hoxs], [Frodo][frodo], and [Kernal64][k64]
  (testbench rows); jsbeeb, which runs Lorenz's suite.

### How firmware is handled

- **What:** user-supplied firmware ([option 4][r002-o4]); shipping firmware under a permission
  (Spectrum, CPC, SAM, the X68000 IPL-ROM); a licence from Amiga Corporation or Cloanto; or Rustalgia's own replacement.
- **Costs:** Amstrad's permission is informal and bars charging for the ROMs, and Sharp's licence omits the font ROM;
  Cloanto's EULA excludes devices, which need an OEM licence from Amiga Corporation;
  a replacement is a clean-room project, and every existing one is closed to the project.
- **Gains:** the user's dump is exact and needs no permission; a replacement can ship freely,
  as Altirra and the Laser 128, with its BASIC licensed, show.
- **Used by:** Fuse, VICE, and Hoxs64 ship ROMs; Hatari, openMSX, and Altirra ship replacements;
  vAmiga and GSplus ask the user.

### Which formats carry copy-protected disks

- **What:** read IPF through the SPS library, write an IPF reader of Rustalgia's own, or take other formats: SCP flux,
  [WOZ][woz], G64 and P64, STX, and DMK.
- **Costs:** the SPS library is non-commercial, and its licence forbids enabling other formats through it;
  an own IPF reader needs a specification whose terms were not read; of the others only WOZ's specification was read,
  and they cover fewer titles (inference).
- **Gains:** IPF holds most preserved Amiga and ST titles
  (from memory); WOZ is written to let protected Apple II software run.
- **Used by:** every emulator here that reads IPF, through the library; WinUAE and Denise read SCP;
  VICE and Hoxs64 read P64; Hatari reads STX, and openMSX DMK.

### Which families come first

- **What:** the C64 and 48K Spectrum first, then the CPC, BBC Micro, and Atari 8-bit, with the Amiga, ST, MSX turbo R,
  and Japanese 32-bit machines last; or start with the Amiga for its game count.
- **Costs:** both first targets need firmware; the Amiga's chipset is the hardest work and its disks need flux formats.
- **Gains:** the C64 and Spectrum have hardware-referenced suites, open references,
  and shared processors with the NES and Master System work; the C64 alone has 5,750 games in [R1-09][r109]'s count.
- **Used by:** [Clock Signal][clk] and [ZEsarUX][zesarux], which cover the 8-bit machines most fully.

### Recommendation

The owner decides each of these; the pull request lists them.

- **Studies:** add one emulator study, of VICE, briefed to skip its ROM data; read vAmiga, Fuse, Hatari, jsbeeb,
  and [Clock Signal][clk] as open references when a family is taken up; read [WinUAE][winuae], [Altirra][altirra],
  and [openMSX][openmsx] from prose only.
- **Oracles:** adopt the VICE testbench, Lorenz's suite, z80test, vAmigaTS, and a2audit,
  and run Shaker and Acid800 as programs; plan measurements on owned machines for the Amiga, ST, and BBC.
- **Firmware:** user-supplied firmware as the default, shipping none; record the permissions for [R2-12][phase2],
  and leave a licence enquiry to Amiga Corporation and any own replacement to R2-12.
- **Formats:** take formats whose specifications can be read on open terms, WOZ first,
  and leave IPF until its terms are read; never load the SPS library.
- **Order:** the C64 and 48K Spectrum first, then the CPC, BBC Micro, and Atari 8-bit,
  and the Amiga after [R6-01][phase6] weighs it.

## Implications for Rustalgia

- [R2-12][phase2] must treat each home computer as needing firmware, with every replacement found closed;
  a licence from Amiga Corporation is a possible route that no open emulator has taken (inference).
- [R2-11][phase2] should rule on flux formats and the SPS library,
  since copy-protected disks are access controls in the Copyright Office's view.
- [R2-03][phase2] must schedule chip-level contention: the VIC-II's bad lines, the ULA's contention,
  and the Amiga's DMA slots.
- [R2-15][phase2] can adopt the [testbench][testbench]'s Debugcart exit protocol,
  which lets any emulator report a pass by exit code ([Debugcart][debugcart]).
- Every brief for this family must forbid the ROM folders of [VICE][vice], [Hoxs64][hoxs], [Fuse][fuse],
  [beebjit][beebjit], and [b2][b2], the AROS and open-roms copies, the downloads of trs80gp, PC6001VX, and XEiJ,
  which hold firmware, the closed sites, and the `rom.key` file;
  the [register][register]'s new block closes the addresses known.

## Open questions

- On what terms does [Classic99][classic99]'s manual license the emulator and TI's ROMs?
  Its site says only "Open source (but restrictive license) emulator including ROMs licensed by Texas Instruments",
  and links the manual inside the walled repository, which the guard blocks; there is no other copy.
  A reader session under [ADR 0006][adr6] would answer it.
- What are the full terms of Sharp's X68000 release?
  The terms file sits beside the firmware; a copy on a host that does not offer the files, for [R2-12][phase2].
- Who holds the copyright in Amstrad's Spectrum and CPC ROMs since BSkyB's purchase,
  and does the 1999 permission still bind them?
  A written enquiry to Amstrad and Sky, for R2-12.
- How large is the X68000's system ROM?
  Japanese Wikipedia gives 128 sprites a screen and 16 a line,
  but both a 256 KiB IPL and BIOS ROM and a 512 KiB built-in ROM ([Wikipedia, "X68000"][w-x68k]; secondary).
  Sharp's free service manual would settle it ([R1-09][r109-open]).

## Sources

Every source below was read on 2026-11-26 as raw text, unless an entry says otherwise.
READMEs, licence files, and metadata were read through GitHub's API on 2026-11-26 and again on 2026-11-27;
a repository is pinned by that read date, with its release or last push in the table where one was read;
Wikipedia links are pinned to the revision read; closed addresses are in code spans, with the reason.

- Repository documents: [ADR 0006][adr6]; [research guide][guide]; [roadmap][roadmap]; [register][register];
  [R0-02][r002]; [R0-06][r006]; [R1-09][r109]; [R1-25][r125]; [R1-26][r126].
- Commodore: [VICE site][vice], copyright section, and [manual][vice-man], with its [ROM files section][vice-man3]
  (built 2025-12-24);
  [VICE-Team/svn-mirror][vice-gh]; VICE wiki [Testbench][testbench] (revision 6458, 2026-01-13), [C64models][c64models]
  (revision 5945),
  [Debugcart][debugcart] (revision 5670);
  [Debian, "vice"][deb-vice] (3.9+dfsg-1) and its [copyright file][deb-vice-copy]; [libretro, "VICE"][lr-vice];
  [libretro/vice-libretro][vicelr]; [libretro/frodo-libretro][frodolr]; [Hoxs64][hoxs] and [site][hoxs-site];
  [Denise][denise]; [VirtualC64][vc64] and [site][vc64-site]; [vc64web][vc64web]; [Kernal64][k64];
  [Frodo][frodo] and [site][frodo-site]; [Emu64][emu64]; [plus4emu][p4e]; [z64k][z64k]; [YACE64][yace];
  [Bauer, VIC-II article][bauer] (2024-09-29); [Lorenz, "C64 Emulator Test Suite" 2.15][lorenz]
  (commit b400010); [EmulatorJS][ejs]; [Wikipedia, "VICE"][w-vice] (revision 1381355839).
- Amiga and licensees: [Wikipedia, "UAE (emulator)"][w-uae]
  (revision 1345711502);
  [WinUAE][winuae], [site][winuae-site], [4.9.0][winuae-49], [4.10.0][winuae-410], [6.0.0][winuae-600]; [FS-UAE][fsuae],
  [site][fsuae-site]; [PUAE][puae]; [Amiberry][amiberry], [site][amiberry-site]; [vAmiga][vamiga], [site][vamiga-site];
  [vAmigaWeb][vamigaweb], [about][vamigaweb-site]; [vAmigaTS][vamigats]; [WinFellow][winfellow]; [Amiga Forever][af];
  [C64 Forever][c64f]; [Cloanto KB 13-122][kb122]
  (updated 2026-06-06);
  [amiga-news.de][amiga-news] (2026-08-04); [Hyperion, corporate news][hyperion];
  [Wikipedia, "Hyperion Entertainment"][w-hyperion] (revision 1368036397); GitHub notices of [2023-11-29][dmca-2023]
  (commit 130af626)
  and [2016-01-05][dmca-2016]; [SPS download page][sps], capture of 2026-07-20 01:16:31;
  [Gentoo copy of the SPS decoder licence][kryoflux] (1.02, 2014-05-20).
- Sinclair and Amstrad: [Fuse][fuse] (site updated 2026-10-31); [Debian copyright file for Fuse][deb-fuse]
  (1.10.1+dfsg-1); [Debian spectrum-roms copyright][deb-roms] (20081224-5); [Flathub statistics for Fuse][flathub];
  [fuse-libretro][fuselr]; [Sinclair Wiki, "Emulators"][sw-emus] (revision 2395), ["Contended memory"][sw-cont]
  (revision 1840), ["Floating bus"][sw-float] (revision 2242), ["Spectrum tape interface"][sw-tape] (revision 1956);
  [ZEsarUX][zesarux]; [SpecEmu][specemu]; [Spectaculator][spectaculator]; [Retro Virtual Machine][rvm];
  [CSpect][cspect]; [Spectral][spectral]; [JSSpeccy 3][jsspeccy]; [SpecIde][specide]; [z80test][z80test];
  [MrKWatkins test suites][mrkw] (0.9.4) and [repository][mrkw-gh]; [Caprice32][cap32]; [libretro-cap32][lrcap32];
  [WinAPE][winape]; [ACE-DL][acedl]; [Arnold mirror][arnold]; [CPCEC][cpcec]; [CrocoDS][crocods]; [Shaker][shaker];
  [Arnold V specification][arnold-v], capture of 2000-11-18 21:49:00; [SimCoupé][simcoupe];
  [Wikipedia, "Amstrad"][w-amstrad] (revision 1373433025); [Wikipedia, "ZX Spectrum"][w-zx] (revision 1386188469).
- Acorn: [jsbeeb][jsbeeb]; [B-em][bem] and [site][bem-site]; [BeebEm][beebem]; [b2][b2]; [libretro, "b2"][lr-b2];
  [beebjit][beebjit]; [Elkulator][elk] and [site][elk-site]; [dp111/6502Timing][dp111];
  [Arculator][arculator] and [site][arc-site]; [RPCEmu macOS builds][rpcemu-dev].
- Apple, Atari, and MSX: [AppleWin][applewin]; [Wikipedia, "AppleWin"][w-applewin]
  (revision 1335578994);
  [AppleWin for Linux][applewin-lin]; [KEGS][kegs] home page and README
  (read 2026-11-27);
  [GSplus][gsplus]; [Virtual \]\[][virtualii]; [apple2js][apple2js]; [Apple2TS][apple2ts]; [Clemens IIGS][clemens];
  [Mednafen, "apple2"][mdf-apple2] (valid as of 1.32.1); [a2audit][a2audit]; [WOZ 2.1 reference][woz] (2021-06-16);
  [Apple v Formula][formula]; [Wikipedia, "Laser 128"][w-laser]
  (revision 1358296033);
  [Altirra][altirra] (4.40); [Atari800][a800], [site][a800-site]; [Hatari][hatari], [Framagit][hatari-fg],
  [site][hatari-site], [manual][hatari-man], [compatibility list][hatari-compat] (2.6.1); [Steem SSE blog][steem];
  [ARAnyM][aranym]; [THE400 Mini][the400]; [openMSX][openmsx], [site][openmsx-site], [features][openmsx-feat],
  [setup guide][openmsx-setup]; [bluemsx-libretro][bluemsx-lr]; [MSX-PLAYer][msxplayer]; [Wikipedia, "FMSX"][w-fmsx]
  (revision 1368566574); [Wikipedia, "D4 Enterprise"][w-d4] (revision 1386090559).
- Japan and others: [Neko Project II][np2]; [NP2kai][np2kai]; [Common Source Code Project][cscp];
  [px68k-libretro][px68klr]; [Wikipedia (Japanese), "X68000"][w-x68k]
  (revision 111390795);
  [XEiJ][xeij] and its [licence][xeij-lic] (2023-06-08); [WebX68k][webx68k] (README.ja.md); [INTERNET Watch][iwatch2]
  (2026-08-13); [Tsugaru][tsugaru]; [Geartowns][geartowns]; [test386][test386]; [XRoar][xroar] (1.13.1) and
  [features][xroar-feat]; [VCC][vcc]; [xtrs][xtrs]; [trs80gp][trs80gp] (2.5.8); [Classic99][classic99] and
  [site][classic99-site]; [Oricutron][oricutron]; [ep128emu][ep128]; [Xep128][xep128];
  [EightyOne metadata][eightyone-sf]; [81-libretro][81lr]; [JOYCE][joyce]; [PC6001VX][pc6001vx]; [Clock Signal][clk];
  [MAME][mame]; [BizHawk][bizhawk] and [ares][ares] READMEs (read 2026-11-27).
- Boundary: [DOSBox metadata][dosbox]; [DOSBox-X][dosbox-x]; [DOSBox Staging][staging]; [86Box][86box]; [PCem][pcem];
  [Basilisk II and SheepShaver][macemu]; [kanjitalk755/macemu][macemu-fork]; [Mini vMac licence][minivmac].
- Law: [37 C.F.R. § 201.40][cfr]; [71 Fed. Reg. 68472][fr2006] (2006-11-27).
- Closed, not linked: the RetroPieBIOS, AmigaOS, and ROM-host repositories and sites named in the text,
  which offer firmware; `ppeccin/webmsx`, `webmsx.org`, `fms.komkon.org/fMSX/`, `retropc.net/pi/xm6/index.html`,
  `bbc.xania.org`, `www.mkw.me.uk/beebem/`, `www.marutan.net/rpcemu/`, `archi.medes.live`, `dcmoto.free.fr`,
  and `uraraworks.github.io/webx68k`, which serve or link firmware or games; `frodesolheim/capsimg`, non-commercial;
  `sourceforge.net/projects/deniseemu/files/`, which ships AROS; and the no-licence repositories named in a code span.
  `www.eonet.ne.jp/~showtime/quasi88/` is walled and has no register line, because its path holds "~".
- Opened before they were closed, nothing followed: `www.marutan.net/rpcemu/manual/romimage.html`, the RPCEmu home page,
  the BeebEm site, `archi.medes.live`, and `dcmoto.free.fr` (research log).

[adr6]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[guide]: ../README.md#claim-status
[roadmap]: ../../roadmap/research.md
[studies]: ../../roadmap/research.md#emulator-studies
[hosts]: ../../roadmap/research.md#phase-3-host-platforms
[phase2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[phase6]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[r002]: R0-02-legal-baseline.md
[r002-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r002-take]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r002-exempt]: R0-02-legal-baseline.md#the-triennial-exemptions
[r002-o1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r002-o4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r002-o5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r002-o6]: R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes
[r002-o7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r002-o14]: R0-02-legal-baseline.md#14-name-the-project-without-a-makers-mark-and-describe-systems-in-plain-words
[r006]: R0-06-provenance-controls.md
[r109]: R1-09-catalogue-home-computers.md
[r109-rec]: R1-09-catalogue-home-computers.md#recommendation
[r109-consoles]: R1-09-catalogue-home-computers.md#consoles-built-from-home-computers
[r109-boundary]: R1-09-catalogue-home-computers.md#boundary-cases
[r109-fw]: R1-09-catalogue-home-computers.md#firmware-and-its-availability
[r109-src]: R1-09-catalogue-home-computers.md#coverage-of-sources
[r109-open]: R1-09-catalogue-home-computers.md#open-questions
[r125]: R1-25-arcade-family.md
[r126]: R1-26-other-consoles-family.md
[vice]: https://vice-emu.sourceforge.io/
[vice-man]: https://vice-emu.sourceforge.io/vice_1.html
[vice-man3]: https://vice-emu.sourceforge.io/vice_3.html
[vice-gh]: https://github.com/VICE-Team/svn-mirror
[testbench]: https://vice-emu.pokefinder.org/wiki/Testbench
[bizhawk]: https://github.com/TASEmulators/BizHawk
[ares]: https://github.com/ares-emulator/ares
[c64models]: https://vice-emu.pokefinder.org/wiki/C64models
[debugcart]: https://vice-emu.pokefinder.org/wiki/Debugcart
[deb-vice]: https://packages.debian.org/sid/vice
[deb-vice-copy]: https://metadata.ftp-master.debian.org/changelogs/contrib/v/vice/unstable_copyright
[lr-vice]: https://docs.libretro.com/library/vice/
[vicelr]: https://github.com/libretro/vice-libretro
[frodolr]: https://github.com/libretro/frodo-libretro
[hoxs]: https://github.com/davidhorrocks/hoxs64
[hoxs-site]: https://www.hoxs64.net/
[denise]: https://sourceforge.net/projects/deniseemu/
[vc64]: https://github.com/dirkwhoffmann/virtualc64
[vc64-site]: https://dirkwhoffmann.github.io/VirtualC64/
[vc64web]: https://github.com/vc64web/virtualc64web
[k64]: https://github.com/abbruzze/kernal64
[frodo]: https://github.com/cebix/frodo4
[frodo-site]: https://frodo.cebix.net/
[emu64]: https://github.com/ThKattanek/emu64
[p4e]: https://github.com/istvan-v/plus4emu
[z64k]: https://www.z64k.com/
[yace]: https://www.yace64.com/
[bauer]: https://cebix.net/VIC-Article.txt
[lorenz]: https://git.applefritter.com/Apple-2-SW/prog8/raw/commit/b4000104260b68d672d8ec36e0a97ef27b064292/sim65/test/6502testsuite/_Test%20Suite%202.15.txt
[ejs]: https://emulatorjs.org/docs/systems/commodore-64
[w-vice]: https://en.wikipedia.org/w/index.php?oldid=1381355839
[w-uae]: https://en.wikipedia.org/w/index.php?oldid=1345711502
[winuae]: https://github.com/tonioni/WinUAE
[winuae-site]: https://www.winuae.net/features/
[winuae-49]: https://www.winuae.net/2021/12/04/winuae-4-9-0/
[winuae-410]: https://www.winuae.net/2022/12/17/winuae-4-10-0/
[winuae-600]: https://www.winuae.net/2025/07/03/winuae-6-0-0/
[fsuae]: https://github.com/FrodeSolheim/fs-uae
[fsuae-site]: https://fs-uae.net/
[puae]: https://github.com/libretro/libretro-uae
[amiberry]: https://github.com/BlitterStudio/amiberry
[amiberry-site]: https://amiberry.com/
[vamiga]: https://github.com/dirkwhoffmann/vAmiga
[vamiga-site]: https://dirkwhoffmann.github.io/vAmiga/
[vamigaweb]: https://github.com/vAmigaWeb/vAmigaWeb
[vamigaweb-site]: https://vamigaweb.github.io/doc/about.html
[vamigats]: https://github.com/dirkwhoffmann/vAmigaTS
[winfellow]: https://github.com/petschau/WinFellow
[af]: https://www.amigaforever.com/
[c64f]: https://www.c64forever.com/
[kb122]: https://www.amigaforever.com/kb/13-122
[amiga-news]: https://amiga-news.de/en/news/AN-2026-08-00022-EN.html
[hyperion]: https://www.hyperion-entertainment.com/index.php/news/38-corporate
[w-hyperion]: https://en.wikipedia.org/w/index.php?oldid=1368036397
[dmca-2023]: https://github.com/github/dmca/blob/master/2023/11/2023-11-29-amiga-rom.md
[dmca-2016]: https://github.com/github/dmca/blob/master/2016/2016-01-05-AmigaROM.md
[sps]: https://web.archive.org/web/20260720011631/https://www.softpres.org/download
[kryoflux]: https://ftp.fau.de/gentoo-portage/licenses/Kryoflux-MAME
[fuse]: https://fuse-emulator.sourceforge.net/
[deb-fuse]: https://metadata.ftp-master.debian.org/changelogs//main/f/fuse-emulator/fuse-emulator_1.10.1+dfsg-1_copyright
[deb-roms]: https://metadata.ftp-master.debian.org/changelogs//non-free/s/spectrum-roms/spectrum-roms_20081224-5_copyright
[flathub]: https://flathub.org/api/v2/stats/net.sourceforge.fuse_emulator.Fuse
[fuselr]: https://github.com/libretro/fuse-libretro
[sw-emus]: https://sinclair.wiki.zxnet.co.uk/wiki/Emulators
[sw-cont]: https://sinclair.wiki.zxnet.co.uk/wiki/Contended_memory
[sw-float]: https://sinclair.wiki.zxnet.co.uk/wiki/Floating_bus
[sw-tape]: https://sinclair.wiki.zxnet.co.uk/wiki/Spectrum_tape_interface
[zesarux]: https://github.com/chernandezba/zesarux
[specemu]: https://specemu.zxe.io/
[spectaculator]: https://www.spectaculator.com/
[rvm]: https://www.retrovirtualmachine.org/
[cspect]: https://mdf200.itch.io/cspect
[spectral]: https://github.com/r-lyeh/Spectral
[jsspeccy]: https://github.com/gasman/jsspeccy3
[specide]: https://github.com/MartianGirl/SpecIde
[z80test]: https://github.com/raxoft/z80test
[mrkw]: https://mrkwatkins.github.io/EmulatorTestSuites/Z80/MarkWoodmass.html
[mrkw-gh]: https://github.com/mrkwatkins/EmulatorTestSuites
[w-amstrad]: https://en.wikipedia.org/w/index.php?oldid=1373433025
[w-zx]: https://en.wikipedia.org/w/index.php?oldid=1386188469
[cap32]: https://github.com/ColinPitrat/caprice32
[lrcap32]: https://github.com/libretro/libretro-cap32
[winape]: https://www.winape.net/
[acedl]: http://roudoudou.com/ACE-DL/
[arnold]: https://github.com/rofl0r/arnold
[cpcec]: http://cngsoft.no-ip.org/cpcec.htm
[crocods]: https://github.com/libretro/libretro-crocods
[shaker]: https://shaker.logonsystem.eu/
[arnold-v]: https://web.archive.org/web/20001118214900/http://web.ukonline.co.uk/cliff.lawson/arnold5.htm
[simcoupe]: https://github.com/simonowen/simcoupe
[jsbeeb]: https://github.com/mattgodbolt/jsbeeb
[bem]: https://github.com/stardot/b-em
[bem-site]: http://b-em.bbcmicro.com/
[beebem]: https://github.com/stardot/beebem-windows
[b2]: https://github.com/tom-seddon/b2
[lr-b2]: https://docs.libretro.com/library/b2/
[beebjit]: https://github.com/scarybeasts/beebjit
[elk]: https://github.com/stardot/elkulator
[elk-site]: https://elkulator.acornelectron.co.uk/
[dp111]: https://github.com/dp111/6502Timing
[arculator]: https://github.com/sarah-walker-pcem/arculator
[arc-site]: http://b-em.bbcmicro.com/arculator/
[rpcemu-dev]: https://github.com/Septercius/rpcemu-dev
[applewin]: https://github.com/AppleWin/AppleWin
[applewin-lin]: https://github.com/audetto/AppleWin
[w-applewin]: https://en.wikipedia.org/w/index.php?oldid=1335578994
[kegs]: https://kegs.sourceforge.net/
[gsplus]: https://github.com/digarok/gsplus
[virtualii]: https://www.virtualii.com/
[apple2js]: https://github.com/whscullin/apple2js
[apple2ts]: https://github.com/ct6502/apple2ts
[clemens]: https://github.com/samkusin/clemens_iigs
[mdf-apple2]: https://mednafen.github.io/documentation/apple2.html
[a2audit]: https://github.com/zellyn/a2audit
[woz]: https://applesaucefdc.com/woz/reference2/
[formula]: https://static.case.law/f2d/725/cases/0521-01.json
[w-laser]: https://en.wikipedia.org/w/index.php?oldid=1358296033
[altirra]: https://www.virtualdub.org/altirra.html
[a800]: https://github.com/atari800/atari800
[a800-site]: https://atari800.github.io/
[hatari]: https://github.com/hatari/hatari
[hatari-fg]: https://framagit.org/hatari/hatari
[hatari-site]: https://www.hatari-emu.org/
[hatari-man]: https://www.hatari-emu.org/doc/manual.html
[hatari-compat]: https://www.hatari-emu.org/doc/compatibility.html
[steem]: https://sourceforge.net/rest/p/steemsse/blog/
[aranym]: https://github.com/aranym/aranym
[the400]: https://retrogames.biz/products/the400-mini/
[openmsx]: https://github.com/openMSX/openMSX
[openmsx-site]: https://openmsx.org/
[openmsx-feat]: https://openmsx.org/features.html
[openmsx-setup]: https://openmsx.org/manual/setup.html
[bluemsx-lr]: https://github.com/libretro/bluemsx-libretro
[msxplayer]: https://www.msx.org/wiki/MSX-PLAYer
[w-fmsx]: https://en.wikipedia.org/w/index.php?oldid=1368566574
[w-d4]: https://en.wikipedia.org/w/index.php?oldid=1386090559
[w-x68k]: https://ja.wikipedia.org/w/index.php?oldid=111390795
[np2]: https://www.yui.ne.jp/np2/
[np2kai]: https://github.com/AZO234/NP2kai
[cscp]: https://takeda-toshiya.my.coocan.jp/common/index.html
[px68klr]: https://github.com/libretro/px68k-libretro
[xeij]: https://stdkmd.net/xeij/
[xeij-lic]: https://stdkmd.net/xeij/license.htm
[webx68k]: https://github.com/uraraworks/WebX68k
[iwatch2]: https://internet.watch.impress.co.jp/docs/yajiuma/2132479.html
[tsugaru]: https://github.com/captainys/TOWNSEMU
[geartowns]: https://github.com/drhelius/Geartowns
[test386]: https://github.com/barotto/test386.asm
[xroar]: https://www.6809.org.uk/xroar/
[xroar-feat]: https://www.6809.org.uk/xroar/features.shtml
[vcc]: https://github.com/VCCE/VCC
[xtrs]: https://github.com/TimothyPMann/xtrs
[trs80gp]: http://48k.ca/trs80gp.html
[classic99]: https://github.com/tursilion/classic99
[classic99-site]: https://harmlesslion.com/software/classic99/
[oricutron]: https://github.com/pete-gordon/oricutron
[ep128]: https://github.com/istvan-v/ep128emu
[eightyone-sf]: https://sourceforge.net/rest/p/eightyone-sinclair-emulator
[xep128]: https://github.com/lgblgblgb/xep128
[81lr]: https://github.com/libretro/81-libretro
[joyce]: https://www.seasip.info/Unix/Joyce/
[pc6001vx]: https://github.com/eighttails/PC6001VX
[clk]: https://github.com/TomHarte/CLK
[mame]: https://github.com/mamedev/mame
[dosbox]: https://sourceforge.net/rest/p/dosbox
[dosbox-x]: https://github.com/joncampbell123/dosbox-x
[staging]: https://github.com/dosbox-staging/dosbox-staging
[86box]: https://github.com/86Box/86Box
[pcem]: https://github.com/sarah-walker-pcem/pcem
[macemu]: https://github.com/cebix/macemu
[macemu-fork]: https://github.com/kanjitalk755/macemu
[minivmac]: https://www.gryphel.com/c/minivmac/license.html
[cfr]: https://www.law.cornell.edu/cfr/text/37/201.40
[fr2006]: https://www.govinfo.gov/content/pkg/FR-2006-11-27/pdf/E6-20029.pdf
