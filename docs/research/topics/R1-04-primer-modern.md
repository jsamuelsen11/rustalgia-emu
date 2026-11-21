---
title: "Modern consoles and handhelds, including systems on sale today: primer"
roadmap_item: R1-04
status: draft
date: 2026-11-20
---

# Modern consoles and handhelds, including systems on sale today: primer

## Summary

This note asks how the consoles of the modern era work and what that asks of an emulator,
using the systems the [roadmap][roadmap]'s era rule places here: the PlayStation 3, 4, and 5,
the Xbox One and Xbox Series, and the Nintendo Switch and Switch 2.

In this era a game is a user process of a full operating system,
so the interface an emulator must reproduce is mostly the operating system's and its libraries',
not the chips' registers (inference).
For the Xbox, the maker documents part of that interface:
Microsoft's public GDK pages describe the game's Win32 subset and the audio APIs.

The guest processors are general-purpose architectures
(64-bit PowerPC with the Cell's SPUs, x86-64, and 64-bit Arm),
so a host of the same architecture can run much guest code directly,
and the PlayStation 3 needs translation on every host (inference).
Some Switch games are 32-bit, so a Switch emulator needs a 32-bit Arm front end as well (inference).

Console games can ship pre-compiled shaders
([Wikipedia, Micro stuttering][wp-stutter], secondary),
which an emulator must translate for the host GPU, so shader translation
and its compilation stutter are central costs (inference).

Switch game containers are encrypted
([SwitchBrew, NCA][sb-nca]); that the other systems' retail games are encrypted and signed is from memory.
The legal side is in [`R0-02`][r0-02] and is not repeated here.
This note is not legal advice.

## Scope

- Question: how do the consoles of the modern era work, and what does that ask of an emulator?
- Covered: processors, memory and storage, graphics, audio, operating systems and services, timing, threading and input,
  and online services, for the Switch and Switch 2 ([`R1-14`][roadmap]), PlayStation 3, 4, and 5 ([`R1-21`][roadmap]),
  and Xbox One and Xbox Series ([`R1-23`][roadmap]).
  By the roadmap's era rule ([pull request #22][pr22]), the Xbox 360, of the seventh generation,
  is placed in [`R1-03`][r1-03] with the Wii, and the PS3 here because `R1-21` depends on no other primer;
  that split is the roadmap's grouping, not a hardware rule.
  The [roadmap][roadmap] gives the listing of every console and handheld of the era to the catalogue, [`R1-08`][r1-08];
  PC and Android handhelds, microconsoles, and FPGA devices are emulator hosts,
  left to [`R3-07`][roadmap] and [`R3-12`][roadmap].
- Left to other items: the law on encryption, firmware, keys, and takedowns
  ([`R0-02`][r0-02], cited by section name);
  each family's emulators (`R1-14`, `R1-21`, `R1-23`); host platforms (phase 3); techniques in depth (phase 2).
- Researched on 2026-11-20, when Wikipedia recorded no end of sales for the Switch 2, PlayStation 5, or Xbox Series,
  Nintendo's plan to end Switch sales in Europe in February 2027, the PS4 discontinued only in Japan (2024),
  and the Xbox One discontinued in 2020 (Wikipedia, each system's article, secondary).
  Each claim about a system on sale is dated by the revision of the page it rests on.
- How claims were checked: research agents fetched every source on 2026-11-20
  (wiki pages through `action=raw`, PDFs through `pdftotext`, repository files at a pinned commit where shown);
  the Hot Chips 25 and 29 slides are mostly images, and the patent was read by OCR.
  Two independent verification passes followed, each of nine verifiers who saw only this note:
  each fetched the sources again the same day and tested each claim and quotation.
  Each correction was checked against the source once more before it was applied;
  claims the passes could not check are weakened, marked, or listed in the pull request.
- A later pass the same day answered the note's open questions where a source could:
  it fetched the new sources as raw text or PDF, confirmed each quotation against that text, and checked each pinpoint;
  the pull request lists what it changed.
- A claim marked "(secondary)" rests on Wikipedia or another summary of other sources,
  "(from memory)" on no page fetched for the note, "(inference)" on the author's reasoning,
  "(research log)" on an event while gathering the evidence,
  and "(observed)" on what the author saw in a page or image and did not quote.
- What was opened: maker documents and talks, community wikis' technical pages, Wikipedia, press articles,
  and walled emulators' prose.
  No emulator source code, key, fuse, exploit, firmware, title-list, or game page was opened on purpose.
  Code read outside emulators, header constants of `libnx`
  (open tier) and part of a Linux sound driver, is named where used.

## Findings

### What changed in this era

- Software here reaches hardware mostly through kernel calls and system libraries or services.
  Sony's PS3 Linux documents describe a hypervisor that virtualises "Most devices and system resources" for Linux
  as the guest, which reaches some, such as USB host controllers, directly
  ([Sony, Linux Kernel Overview][sony-lko]).
  psdevwiki records that PS4 system calls are "mostly called by" a kernel library that exports wrappers to applications
  ([psdevwiki PS4, Syscalls][pd-ps4-syscalls]),
  and SwitchBrew describes Switch services reached by inter-process messages ([SwitchBrew, Services API][sb-services]).
  That games rarely write device registers, and that the emulator's main interface is therefore the operating system's,
  is inference from these.
- The makers update that interface over the life of the console.
  SwitchBrew marks services and calls with the system version that added or changed them,
  and psdevwiki marks PS4 system calls by firmware interval (SwitchBrew, Services API; psdevwiki PS4, Syscalls).
  A high-level emulation (HLE) of that interface has to know which version a game was built for (inference).
- The makers themselves keep old games running by emulation, compatibility layers, or hardware built to match.
  The Xbox One runs selected Xbox 360 games through software emulation,
  with hardware support for the 360's XMA audio and texture processing ([Wikipedia, Xbox One][wp-xboxone], secondary).
  The PS5's compatibility rests in part on "extra logic" in its GPU,
  and on a CPU whose timings were brought closer to the PS4's ([Wikipedia, PlayStation 5][wp-ps5], secondary).
  The Switch 2 hooks selected library functions inside Switch games
  ([SwitchBrew, Switch 2: Compatibility Mode][sb-compat]).
  These are precedents for each approach the options below describe (inference).

### Processors

#### The Cell in the PlayStation 3

- The Cell has one Power Processor Element (PPE) for control and eight Synergistic Processor Elements (SPEs)
  for data-intensive work, joined by the Element Interconnect Bus; Sony, Toshiba, and IBM began it in 2000
  ([Gschwind et al., Hot Chips 17][hc17-gschwind], slides 2 and 5; [Sony, Cell Programming Primer][sony-cpp],
  sections 1.1.2 and 1.2.1).
  An emulator therefore needs two unrelated instruction-set front ends in one guest (inference).
- The PPE implements 64-bit PowerPC with the VMX vector extension,
  with 32 KiB instruction and 32 KiB data caches and a 512 KiB L2
  (Gschwind et al., slide 5; Sony, Cell Programming Primer, section 1.2.2).
  It runs two hardware threads ([Wikipedia, Cell (processor)][wp-cell], secondary;
  [psdevwiki PS3, CELL BE][pd-ps3-cell]).
- Each SPU has one register file of 128 registers of 128 bits, used for every data type
  (Gschwind et al., slides 8 and 11).
  A 32-bit scalar or address sits in bytes 0 to 3, the "preferred slot"; a byte sits in byte 3,
  a 16-bit value in bytes 2 and 3, and a 64-bit value in bytes 0 to 7
  (Gschwind et al., slides 12 and 13; Sony, Cell Programming Primer, section 4.5.1);
  bytes are numbered in big-endian order (Sony, Cell Programming Primer, section 2.2.2).
- 128 guest vector registers exceed the vector register files of x86-64 and AArch64 hosts
  (from memory),
  and the lane order is reversed against little-endian hosts,
  so a translator keeps most registers in memory and maps every lane index (inference).
- An SPU addresses only its own 256 KiB local store, which holds code and data; loads and stores always move 128 bits,
  and addresses wrap at the value of a limit register
  (Gschwind et al., slides 14 and 16; Sony, Cell Programming Primer, section 1.2.3).
  The local store can be emulated as a masked offset into a host buffer with no address translation (inference).
- The SPU issues in order, up to two instructions per cycle, with performance strongly biased to aligned instructions,
  and has no branch prediction hardware, only static prediction by a prepare-to-branch instruction
  (Gschwind et al., slides 6 and 16; Wikipedia, Cell (processor), secondary).
  A functional translator can ignore the hints; one that models timing cannot (inference).
- The SPU supports standard IEEE and graphics-oriented arithmetic:
  graphics-oriented single precision keeps an IEEE data layout with extended range, a simplified format,
  and no floating-point exceptions, while double precision follows IEEE conventions (Gschwind et al., slide 22).
- The exact deviations are in IBM's SPU instruction-set document, which this note does not read.
  IBM's own links return HTTP 404, and a web search found version 1.2
  (27 January 2007)
  only on university hosts, which are not linked here because no maker page shows that IBM released it (research log).
  Sony's PS3 Linux directory on kernel.org holds only the eight Linux documents and no SPU instruction-set document
  ([Sony, PS3 Linux directory][sony-dir], listing; observed).
- All SPU code runs at one privilege level, and the SPE shares the PPE's address translation and protection
  (Gschwind et al., slides 7 and 23), so addresses in SPU DMA commands go through the guest's page tables (inference).
- In the PlayStation 3 seven of the eight SPEs work, for manufacturing yield, and one of the seven is reserved:
  Wikipedia says by the operating system, psdevwiki says by the hypervisor
  (Wikipedia, Cell (processor), secondary; psdevwiki PS3, CELL BE).
  Six SPU threads and the PPE's two threads must run together on the host (inference).

#### The SPE's DMA engine and messaging

- A PPE program loads an SPE program into local store and starts it;
  the SPE program fetches data from main memory by DMA, computes, writes results back, and signals the PPE
  ([Sony, Cell Programming Primer][sony-cpp], section 1.3.3).
  An SPE thread's saved context includes its registers, local store,
  and outstanding DMA requests in Toshiba's programming model ([Sakai et al., Hot Chips 17][hc17-sakai], slide 5).
- DMA sizes are 1, 2, 4, or 8 bytes or a multiple of 16 bytes, at most 16 KiB per command;
  transfers of 16 bytes or more need 16-byte alignment on both sides,
  and smaller ones natural alignment with the same low four address bits on both sides
  (Sony, Cell Programming Primer, section 4.2.1).
  Sony's primer says that if these rules are broken "the MFC will stop, resulting in a DMA alignment error interrupt",
  so an emulator must raise the fault to the guest (inference).
- Each DMA command carries a tag from 0 to 31, and the SPE program waits on groups of tags
  (Sony, Cell Programming Primer, sections 3.3.2 and 4.2.2).
  Performing DMA at once is simpler; deferring it is more faithful when games overlap work and transfer (inference).
- Atomic updates use a reservation on a 128-byte line:
  a conditional store fails if another SPE updated the line after it was loaded
  (Sony, Cell Programming Primer, section 4.2.3);
  whether writes by the PPE or devices also break it is not stated there.
  Hosts have no 128-byte reservation, so an emulator must detect guest writes to a reserved line (inference).
- Each SPE has an inbound mailbox of four 32-bit entries, an outbound mailbox of one entry,
  an outbound interrupt mailbox, and two signal registers that are cleared when read and can be set to overwrite
  or to combine by OR; reading an empty channel stalls the SPE
  (Sony, Cell Programming Primer, sections 4.1.1 and 4.1.2; [Linux, `spufs.rst`][linux-spufs]).
  Blocking channel reads are where an emulator can park or switch SPU threads (inference).

#### x86-64 in the PlayStation 4 and 5 and the Xbox One and Series

- The PS4 (2013) and Xbox One (2013) use two modules of four AMD Jaguar cores each: 1.6 GHz on the PS4,
  a figure tagged "citation needed" (2.13 GHz on the PS4 Pro), and 1.75 GHz on the Xbox One
  ([Wikipedia, PlayStation 4 technical specifications][wp-ps4-specs] and [Xbox One][wp-xboxone], secondary).
- Microsoft's Hot Chips 29 slides give the Xbox One X eight x86 cores at 2.3 GHz
  ([Sell, Hot Chips 29][hc29], slides 4 to 6; observed, the slides are images);
  Wikipedia calls it a custom design compatible with Jaguar (Wikipedia, Xbox One, secondary).
- Jaguar is AMD's Family 16h (from memory); AMD's guide for those parts gives a 40-bit physical address space
  ([AMD, BIOS and Kernel Developer's Guide 48751][amd-16h], section 2.4.5).
  Whether the console parts keep that limit is not stated in any source read.
- The PS5 (2020) has eight Zen 2 cores with 16 threads at a variable frequency of up to 3.5 GHz,
  by Sony's specification table ([PlayStation Blog, "Unveiling new details of PlayStation 5"][psblog];
  on sale as of 2026-11-20); Wikipedia gives 3.85 GHz on the PS5 Pro (Wikipedia, PlayStation 5, secondary).
- The Xbox Series X has eight Zen 2 cores at 3.8 GHz, or 3.6 GHz with simultaneous multithreading,
  in two clusters of four cores and eight threads, each cluster with 4 MiB of L3
  ([Andrews and Grossman, Hot Chips 32][hc32], slide 5; on sale as of 2026-11-20).
  Wikipedia gives the Series S 3.6 GHz, or 3.4 GHz with simultaneous multithreading
  ([Wikipedia, Xbox Series X and Series S][wp-series], secondary).
- Zen 2 supports AVX2 and FMA3 ([Wikipedia, Zen 2][wp-zen2], secondary), which Jaguar lacks
  (from memory), so a host lacking them must translate them (inference).
- Games do not get every core. psdevwiki says six of the PS4's eight cores are available to applications
  ([psdevwiki PS4, APU][pd-ps4-apu]),
  while Wikipedia says seven, citing a 2015 Eurogamer article on Sony unlocking more CPU power for developers
  ([Wikipedia, PlayStation 4][wp-ps4], secondary), so the figures can differ by firmware (inference).
- Digital Foundry, reporting Microsoft's briefing, says the Series X keeps "one CPU core
  (or two threads)
  reserved for running the underlying operating system and the front-end 'shell'"
  ([Leadbetter, Digital Foundry, "Inside Xbox Series X: the full specs"][df], secondary).
  The same article quotes Microsoft's Andrew Goossen saying
  that "their current games are running with the distribution often set to seven cores and seven worker threads",
  so Xbox One games often run on seven cores (inference).
- Microsoft's own page gives Universal Windows Platform (UWP) games on Xbox One and Series X\|S "4 exclusive
  and 2 shared CPU cores" ([Microsoft, "System resources for UWP apps and games on Xbox One"][ms-uwp]);
  that page covers UWP games only, not native titles.
  Microsoft's GDK page that compares the consoles' CPU and memory requires a sign-in and was not read (research log).
  Reports that a seventh Xbox One core was opened to games rest on a leaked kit and were not opened (research log).
- No page searched gives the cores left to PS5 games: Sony's blog post, the PS5 Wikipedia article,
  and [psdevwiki PS5, Hardware][pd-ps5-hw].
- shadPS4, a walled PS4 emulator, credits help with "natively executing the x64 code of PS4 binaries",
  and says it "can load some PlayStation 4 firmware files" from a list of modules
  that "must be dumped from your legally owned PlayStation 4 console"
  ([shadPS4 README][shadps4]; module names not reproduced).
  Everything outside those modules is emulated at high level (inference).
  Running guest code directly on an x86-64 host leaves the emulator to intercept system and library calls
  and to fit the guest's address layout into the host's (inference).

#### Arm in the Switch and Switch 2

- The Switch uses Nvidia's Tegra X1 (the X1+ from August 2019 and in the Lite and OLED models);
  games use the four Cortex-A57 cores, one of which is reserved for the operating system,
  and the chip's four Cortex-A53 cores are not used
  ([Wikipedia, Nintendo Switch][wp-switch], secondary; on sale as of 2026-11-20).
  The CPU normally runs at 1.02 GHz; an update of April 2019 lets certain games boost it to 1.785 GHz,
  used mainly during loading (same).
- Arm's manual describes the Cortex-A57 as an out-of-order ARMv8-A core with 48 KiB instruction
  and 32 KiB data L1 caches, supporting AArch32 and AArch64 at every exception level
  ([Arm, Cortex-A57 TRM][arm-a57], DDI 0488 issue H, "Features" and "Compliance").
- A Switch program's metadata has a flag for 64-bit instructions
  and an address-space field whose values include 32-bit layouts ([SwitchBrew, NPDM][sb-npdm]).
  Android Authority reports that "There are only a handful of 32-bit Switch games", naming Pikmin 3 Deluxe,
  New Super Mario Bros.
  U Deluxe, Monster Hunter Generations Unite, and Luigi's Mansion 2 HD,
  and that Mario Kart 8 Deluxe was 32-bit until its update 3.0.4
  ([Fernandez, Android Authority][aa], secondary; the change to 64-bit rests on a social-media post the article cites,
  a lead).
  A Switch emulator therefore needs an AArch32 front end for some well-known titles (inference).
- The Switch 2 (2025; [Wikipedia, Nintendo Switch 2][wp-switch2], secondary) uses Nvidia's T239:
  eight Cortex-A78C cores and a 1,536-core Ampere GPU,
  built to Nintendo's specification and sharing many aspects with the T234 of Nvidia's Orin products,
  by SwitchBrew's account, which states no origin for its figures
  ([SwitchBrew, Switch 2: Tegra T239][sb-t239]; on sale as of 2026-11-20).
- Arm's guide gives the A78C's architecture as Armv8-A with the Armv8.1-A and Armv8.2-A extensions
  and selected later features: pointer authentication and LDAPR from Armv8.3-A,
  dot product and multi-OS support from Armv8.4-A,
  and enhanced pointer authentication from Armv8.6-A without the optional FPAC
  ([Arm, Cortex-A78C Software Optimization Guide][arm-a78c-sog], section 2).
  A host without pointer authentication runs the forms encoded as hints as no-ops and must emulate the others
  (from memory).
- Arm's A78C manual lists AArch32 execution at EL0 only, and AArch64 at every exception level from EL0 to EL3
  ([Arm, Cortex-A78C Core Technical Reference Manual][arm-a78c-trm], 102226 r0p2, section A1.2 "Features",
  and section A1.3, table A1-2).
  So the T239 can run 32-bit user processes in hardware,
  and an Arm64 host built on a core with the same limit could run them directly (inference).
- The same Android Authority article adds that Arm confirmed the A78C supports 32-bit operations,
  and says "32-bit code is not supported by the Switch 2 SDK" (Fernandez, Android Authority, secondary).

#### Translation between host and guest architectures

- Built for this note from the findings above (the host columns are inference):

| System | Guest code | On an x86-64 host | On an Arm64 host |
|---|---|---|---|
| PlayStation 3 | PowerPC with VMX, and SPU | translate both | translate both |
| PlayStation 4, Xbox One | x86-64 (Jaguar) | run directly, translating missing extensions | translate |
| PlayStation 5, Xbox Series | x86-64 (Zen 2) | run directly, translating missing extensions | translate |
| Switch | A64, and AArch32 for some games (Cortex-A57) | translate | run directly; AArch32 where the host core has it |
| Switch 2 | A64, and AArch32 at EL0 (Cortex-A78C) | translate | run directly, with pointer authentication |

- FEX runs x86 Linux programs on ARM64 Linux, has an experimental code cache,
  and lets the user skip what its README calls "costly memory model emulation" per application ([FEX README][fex]).
  Box64 runs x86-64 Linux programs on Arm and other hosts with a dynamic recompiler,
  keeping translated code on disk by default ([Box64 README][box64]).
- x86's stronger memory ordering must be enforced, or relaxed per game, on an Arm host,
  and a persistent cache answers first-run stutter (inference).

### Memory and storage

- The PS3 has two pools: 256 MiB of XDR as main memory, and 256 MiB of GDDR3 attached to the RSX GPU
  ([Wikipedia, PlayStation 3 technical specifications][wp-ps3-specs], secondary; [psdevwiki PS3, RAM][pd-ps3-ram]).
  Main memory and an SPU's local store are separate address spaces, and a DMA command names one address in each
  ([Sony, Cell Programming Primer][sony-cpp], section 3.3.2).
- The RSX can access up to 224 MiB of main memory ([Wikipedia, RSX Reality Synthesizer][wp-rsx], secondary).
  Wikipedia and psdevwiki give one nearly identical table of rates,
  of unstated origin and measured with the RSX and GDDR3 above their shipped clocks,
  with the Cell reading GDDR3 at about 16 MB/s; they count as one source
  (Wikipedia, RSX Reality Synthesizer, secondary; [psdevwiki PS3, RSX][pd-ps3-rsx]).
  Games avoid that slow path, so an emulator need not model its cost but must allow both directions (inference).
- Sony's documents say Linux on the PS3 runs on top of the hypervisor,
  and that "no direct access by guest OSes to the GPU is allowed currently";
  the frame buffer was in main memory and copied to the GPU by DMA through hypervisor calls
  ([Sony, Linux Kernel Overview][sony-lko], "Graphics/Video"; [Sony, Application Programming Environment][sony-ape]).
- The PS4 has 8 GiB of GDDR5 at 176 GB/s shared by CPU and GPU, with no separate video memory
  ([Wikipedia, PlayStation 4 technical specifications][wp-ps4-specs], secondary).
  The PS4 Pro adds 1 GiB of DDR3 so that background applications can be moved out,
  giving games 5.5 GiB in place of 5 GiB (same).
  The memory a game sees therefore depends on the model (inference).
- The Xbox One has 8 GiB of DDR3 plus 32 MiB of on-chip ESRAM;
  Wikipedia's prose and its table give different ESRAM bandwidths ([Wikipedia, Xbox One][wp-xboxone], secondary).
  Games were reported to get 5 GiB of the 8, and the Xbox One X 9 GiB of its 12 GiB (same).
- Microsoft's Hot Chips 29 slides on the One X show 12 GB of GDDR5 at 6.8 GHz on 12 channels, 326 GB/s at peak,
  and no ESRAM block in the diagram; the GPU runs at 1.172 GHz with 40 compute units, plus 4 spare,
  its data paths are labelled "1172/850 MHz", and the GPU slide lists "Xbox One S and 360 compatibility"
  ([Sell, Hot Chips 29][hc29], slides 4 to 6; observed, the slides are images, read by OCR and by eye).
  That the One X runs ESRAM games from its larger, faster GDDR5 pool is inference;
  how it maps an ESRAM allocation is not stated.
- Microsoft's public GDK index has no page on ESRAM
  (searched: all 47 English topic lists of [Microsoft's GDK documentation index][xbox-index]),
  and the older Xbox One kit documentation is not public,
  so how Xbox One games place data in ESRAM is not described by any source read.
- The Xbox One and Series run a modified Hyper-V hypervisor with an "Exclusive" partition for games and a "Shared" one
  for apps, including the operating system ([Wikipedia, Xbox system software][wp-xboxsys], secondary).
  Microsoft's Hot Chips 25 slides show host-guest memory-management units for the GPU and for input and output,
  with page tables kept in step with the CPU's ([Sell and O'Connor, Hot Chips 25][hc25], slides 4 and 6 to 8; observed).
  A game therefore sees a guest-physical address space inside a virtual machine (inference).
- The PS5 has 16 GiB of GDDR6 at 448 GB/s shared by CPU and GPU, and 512 MiB of DDR4 used as the SSD controller's cache;
  the SSD reads 5.5 GB/s raw, and a hardware unit decompresses zlib and Oodle Kraken
  ([Wikipedia, PlayStation 5][wp-ps5], secondary; [psdevwiki PS5, Hardware][pd-ps5-hw]; on sale as of 2026-11-20).
  PS5 games must run from internal or M.2 storage (Wikipedia, PlayStation 5, secondary).
- The Xbox Series X has 16 GiB of GDDR6 at two speeds, 10 GiB at 560 GB/s and 6 GiB at 336 GB/s,
  "with the system software only drawing from the slower pool";
  its storage block decompresses zlib and a proprietary BCPack algorithm for game textures
  ([Wikipedia, Xbox Series X and Series S][wp-series], secondary; on sale as of 2026-11-20).
- Microsoft's Hot Chips 32 slides say the Series X storage block does encryption, hashing,
  and decompression at the SSD's rate,
  with more than 6 GB/s of output from two general and texture decompression engines,
  and give about 2:1 lossless compression on BCn textures ([Andrews and Grossman, Hot Chips 32][hc32], slides 8 and 10).
- No public specification of the Kraken or BCPack bitstreams was found.
  Searched: the [register][register], [`R0-05`][r0-05], the Wikipedia articles cited, the Hot Chips 32 slides,
  Sony's blog post, and Microsoft's public GDK index,
  whose page on the Xbox texture-compression archive format redirects to a page
  that requires membership in a developer programme under a non-disclosure agreement;
  that page was closed and its copy deleted (research log).
- The Switch has 4 GiB of LPDDR4, LPDDR4X in the X1+ models
  ([SwitchBrew, Hardware][sb-hardware]; [Wikipedia, Nintendo Switch][wp-switch], secondary);
  that CPU and GPU share it is inference from the GPU mapping process memory ([SwitchBrew, GPU][sb-gpu]).
- Switch user address spaces are 32 or 36 bits, and 38 from system version 2.0.0, by one page
  ([SwitchBrew, Memory layout][sb-memlayout]);
  a later page names the larger layout 39-bit and adds a 42-bit one from 23.0.0 ([SwitchBrew, NPDM][sb-npdm]).
- The Switch kernel sets a heap size only in multiples of 2 MiB ([SwitchBrew, SVC][sb-svc], heap call).
  A game cannot make memory executable through the call it uses to change permissions; from system version 4.0.0,
  code memory objects let one process map memory writable and another map it executable
  (SwitchBrew, SVC, permission and code-memory calls).
  A recompiler can therefore treat guest code pages as fixed except on that path and where modules are loaded
  and unloaded at run time (inference).
- The kernel keeps a memory state and attributes for every region, and later calls succeed or fail by them;
  the Switch 2 adds two GPU-sharing attributes whose effect the page does not describe (SwitchBrew, SVC).
  One physical page may appear at several guest addresses with different permissions,
  so the host mapping must support aliasing (inference).
- To give the GPU memory, a program maps it into a GPU address space through Nvidia's driver interface;
  each open of that device creates a separate GPU address space (SwitchBrew, GPU; [NV services][sb-nv]).
  CPU and GPU addresses are translated separately over one pool (inference).
- The Switch 2 has 12 GiB of LPDDR5X; SwitchBrew gives 120 GB/s, Wikipedia about 102 GB/s docked and 68 GB/s handheld
  ([SwitchBrew, Switch 2: Tegra T239][sb-t239]; [Wikipedia, Nintendo Switch 2][wp-switch2], secondary;
  on sale as of 2026-11-20).
- Every system here except the PS3 has one pool shared by CPU and GPU;
  the Xbox One and One S add 32 MiB of on-chip ESRAM beside it
  (Wikipedia, Xbox One, secondary; Sell and O'Connor, Hot Chips 25, slide 4;
  the rest is inference from the findings above).
  Guest memory now approaches host memory:
  a 16 GiB guest needs a host with more than 16 GiB once the emulator's own memory
  and host GPU copies are added (inference).

### Graphics

#### PlayStation 3

- The RSX, developed jointly by Nvidia and Sony, is based on the GeForce 7800 GTX,
  with separate vertex and pixel pipelines rather than unified shaders
  ([Wikipedia, RSX Reality Synthesizer][wp-rsx], secondary, a page tagged "original research";
  [psdevwiki PS3, RSX][pd-ps3-rsx]).
  Vertex and fragment programs need separate translation paths to a host's unified shaders (inference).
- psdevwiki says developers prefer a library that builds GPU command buffers directly,
  and that "hardly anyone uses PSGL these days", the OpenGL ES layer built on top of it
  (psdevwiki PS3, RSX, "RSX Libraries").
  A PS3 emulator therefore works at the level of GPU commands (inference).
- Sony's documents describe only the Linux frame-buffer path, not the 3D engine
  ([Sony, Linux Kernel Overview][sony-lko]), so 3D behaviour must come from community references (inference).
  No open description of the RSX command methods or shader encodings was read.

#### AMD GPUs in the PlayStation 4 and 5 and the Xbox One and Series

- The PS4 GPU is AMD Graphics Core Next (GCN) with 18 compute units at 800 MHz;
  Wikipedia places it on the second generation of GCN, with a "better source needed" mark
  ([Wikipedia, PlayStation 4 technical specifications][wp-ps4-specs], secondary).
  The PS4 Pro has 36 compute units and faster 16-bit floating point from AMD's Vega design (same);
  from system software 4.5 a "Boost Mode" raises clocks for games not patched for it
  ([Wikipedia, PlayStation 4][wp-ps4], secondary).
- Wikipedia lists three PS4 differences from PC cards of the first GCN generation:
  a bus that lets the GPU bypass its caches, a tag on L2 lines for mixed graphics and compute work,
  and "An upgrade from 2 to 64 sources for compute commands"
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  Guest compute and graphics writes to shared memory must be ordered as the hardware orders them (inference).
- PS4 games use two Sony APIs, GNM and the higher-level GNMX, and a shader language close to HLSL
  ([Wikipedia, PlayStation 4 system software][wp-ps4-sys], secondary);
  the PS5 is programmed through a Sony API named AGC ([Wikipedia, PlayStation 5][wp-ps5], secondary).
  The [register][register] and [`R0-05`][r0-05] hold no detailed public description of either;
  the PS4 system-software article outlines GNM and cites a 2013 Sony Europe developer talk that was not read.
  Both compile to command packets and GPU shader binaries, which is what an emulator sees (inference).
- GCN runs threads in waves of 64; RDNA, used in the PS5 and Xbox Series,
  runs waves of 32 natively and also supports 64,
  and keeps aspects of GCN so those consoles run their GCN games natively
  ([Wikipedia, Graphics Core Next][wp-gcn] and [RDNA (microarchitecture)][wp-rdna], secondary).
  A host without 64-wide waves must emulate their wave operations (inference).
- The third generation of GCN is binary-incompatible with earlier ones
  (Wikipedia, Graphics Core Next, secondary),
  so even an AMD host cannot be assumed to run PS4 shader binaries unchanged (inference).
- The PS5 GPU is a custom RDNA 2 part with 36 compute units at up to 2.23 GHz and hardware ray tracing,
  with a variable clock; the PS5 Pro (2024) has 60 compute units and a machine-learning upscaler
  (Wikipedia, PlayStation 5, secondary; on sale as of 2026-11-20).
  A Pro model would need an equivalent upscaler or a substitute (inference).
- The Xbox One GPU is GCN with 12 compute units at 853 MHz ([Wikipedia, Xbox One][wp-xboxone], secondary).
  The Series X GPU has 52 compute units at 1.825 GHz
  ([Andrews and Grossman, Hot Chips 32][hc32], slide 5),
  of RDNA 2 at a fixed clock ([Wikipedia, Xbox Series X and Series S][wp-series], secondary).
  The Xbox One is programmed through Direct3D 11.X, a superset of DirectX 11.2
  ([Wikipedia, Direct3D][wp-d3d], secondary).
- On AMD GPUs the CPU writes command packets into ring buffers that a command processor reads,
  following pointers into indirect buffers
  (Linux, amdgpu documentation, [`gc/index.rst`][linux-gc] and [`ring-buffer.rst`][linux-ring], at a pinned commit).
  Mesa's documentation says the graphics and asynchronous compute queues use the PM4 packet format,
  while the copy and video queues have their own formats
  ([Mesa, RADV][mesa-radv], "Command submission and PM4 packets").
  These are PC driver documents; that the console GPUs follow them is inference from their lineage.
- A pipe runs only one queue at a time, switching between mapped queues
  (Linux, amdgpu documentation, [`driver-core.rst`][linux-core]).
  Asynchronous compute is concurrency between pipes,
  and an emulator needs ordering between queues only where the guest synchronises (inference).
- Sony patent US 10,275,239 describes recording a legacy game's performance
  and tuning the new system's operating parameters, such as GPU clocks and wavefront slots, until key metrics are met
  ([US 10,275,239 B2][us10275239], abstract and description, read by OCR; its claims were not analysed,
  under [`R0-02`, "Patents, recorded as risks"][r0-02-pat]).
  The maker treats GPU timing as something old games can depend on (inference).

#### Nvidia GPUs in the Switch and Switch 2

- The Switch's Maxwell GPU has 256 cores, clocked at 768 MHz docked and 307.2 to 460 MHz in handheld mode
  ([Wikipedia, Nintendo Switch][wp-switch], secondary).
  The system software reports it to programs as implementation GM20B or GM20B_B,
  with SM version 5.0.3 and 3D class `0xB197`
  ([SwitchBrew, NV services][sb-nv], GPU characteristics); an emulator returns such values (inference).
- Programs submit lists of entries pointing to command lists, which Nvidia's command engine routes to the 3D, compute,
  2D, inline-to-memory, and copy engines ([SwitchBrew, GPU][sb-gpu]; [GPU Classes][sb-gpuclasses]).
  The 3D engine also runs small macro programs uploaded by the game to write its registers,
  so an emulator must run the macro language before it can see the state a draw uses
  (SwitchBrew, GPU, "Macro"; the second half is inference).
- Fences are counter values the GPU writes to memory, and the CPU waits until a value is reached
  (SwitchBrew, GPU, "Fences").
  Those values are the points where an emulator's GPU must be exact; elsewhere it can run asynchronously (inference).
- Maxwell shaders start with a header of `0x50` bytes, and every fourth 64-bit instruction is a scheduling instruction
  ([SwitchBrew, GPU Shaders][sb-gpushaders]).
  SwitchBrew's GPU pages rest on Nouveau's work, envytools, Nvidia's disassembler,
  and observation of a game's command stream, and cite Nvidia's published shader-header document for the header
  (SwitchBrew, GPU, "References"; GPU Shaders, "Header" and "Analysis Tools").
- Mesa's NVK documentation says a switch between engines in one channel idles the whole channel
  ([Mesa, NVK, "Hardware docs"][mesa-nvk-hw], "Subchannel switches"),
  and says that "Red Hat has some NDA'd documentation on instruction latencies from NVIDIA"
  ([Mesa, NVK, "External Hardware Documentation and Resources"][mesa-nvk-ext]).
  Parts of Mesa's Nvidia compiler may
  therefore rest on confidential maker data; this note uses only Mesa's prose (inference).
- The Switch 2 GPU reports Ampere 3D class `0xC797` and keeps two older Nvidia classes
  (SwitchBrew, NV services, Switch 2 structure), so much of a Switch GPU front end carries over (inference).
  Its GPU runs at 1,007 MHz docked and 561 MHz handheld ([Wikipedia, Nintendo Switch 2][wp-switch2], secondary).

#### Shader translation and compilation stutter

- SPIR-V, the intermediate language Vulkan takes, is a binary form
  ([Khronos, SPIR-V Specification 1.6][spirv], revision 8, "Goals")
  that can declare structured control flow
  (same, section 2.11);
  that Vulkan requires it is from memory;
  guest shader binaries for every GPU here must be lifted into structured control flow to produce it (inference).
- Wikipedia says that "On consoles, developers can pre-compile all shaders for the known, fixed hardware",
  while PCs compile at run time and stutter, which is mitigated by recording pipeline variants, background compilation,
  and distributing compiled shaders ([Wikipedia, Micro stuttering][wp-stutter], "Shader compilation", secondary).
- Khronos's pipeline-library proposal states that, for many engines,
  requiring most of the state up front "either fails to eliminate hitching" or needs an unmanageable pipeline cache
  ([Khronos, VK_EXT_graphics_pipeline_library proposal][vk-gpl], "Problem Statement");
  a later proposal binds shaders without pipeline objects ([Khronos, VK_EXT_shader_object proposal][vk-so]).
  An emulator learns guest state only at draw time, the case these extensions address (inference).

### Audio

#### PlayStation 3, 4, and 5

- Sony's documents say the PS3 front end "reads(DMAs) PCM data into its buffer" and plays it at a set clock and format,
  with no decoder for compressed audio and no volume control;
  the back end is controlled by an AV setting driver that sits behind the hypervisor
  and is reached over a virtual serial port, and has base clock generators for 44.1 kHz and 48 kHz
  ([Sony, Linux Kernel Overview][sony-lko], "Audio").
- The Linux driver advertises stereo 16- or 24-bit big-endian samples at 44.1, 48, 88.2, or 96 kHz
  ([Linux, `snd_ps3.c`][linux-sndps3]; this description was written after reading part of that driver).
  Everything else a PS3 game plays is computed on the Cell (inference).
- Wikipedia says the PS4 has a dedicated audio module and a DSP that is identical or similar to AMD TrueAudio
  ([Wikipedia, PlayStation 4 technical specifications][wp-ps4-specs], secondary).
  Sony's PS4 open-source page lists FLAC, libvorbis, and Opus among its components
  ([Sony, PS4 open-source page][sony-oss4]; observed).
- Sony says it "designed and built a custom engine for 3D audio",
  and lists "'Tempest' 3D AudioTech" in its PS5 specification table
  ([PlayStation Blog, "Unveiling new details of PlayStation 5"][psblog]).
  Wikipedia describes the Tempest engine as supporting "hundreds of simultaneous sound sources,
  compared to 50 on the PlayStation 4" ([Wikipedia, PlayStation 5][wp-ps5], secondary).
  That it is a modified GPU compute unit is stated only in a video talk by Sony's architect (lead, not relied on).

#### Xbox One and Series

- Microsoft's Hot Chips 25 slides show the Xbox One's audio as four DSP cores beside a shared memory,
  plus fixed-function blocks for sample-rate conversion, DMA, an Xbox Media Audio decoder, equalisation and compression,
  and filtering ([Sell and O'Connor, Hot Chips 25][hc25], slide 7; observed).
  The slide gives the cores' roles (control, scalar, and two 128-bit SIMD vector cores) and cache sizes,
  but names no instruction set.
- Microsoft's GDK pages say the Xbox One's SHAPE
  (Scalable Hardware Audio Processing Engine)
  does most audio work in fixed-function blocks for XMA decoding, sample-rate conversion, equalisation and compression,
  and filtering and volume, with its own DMA to unified memory and internal mix buffers
  ([Microsoft, "Overview of SHAPE"][xbox-shape]).
  It works on 128-sample blocks, which at 48 kHz is a 2.67 ms audio frame
  ([Microsoft, "The audio architecture in XBOX One"][xbox-one-audio]).
- An Audio Control Processor schedules SHAPE, driven by the game through an API of its own;
  an Audio Scalar Processor and an Audio Vector Processor, the latter mainly for multichannel echo cancellation,
  sit beside it (Microsoft, "The audio architecture in XBOX One"; "Overview of SHAPE").
  Microsoft writes that "`XAudio2` and audio middleware implement SHAPE components implicitly"
  (Microsoft, "Overview of SHAPE").
  The pages describe the API and the blocks, not an instruction set,
  so the high-level boundary for Xbox One audio is XAudio2 plus the control processor's API (inference).
- Microsoft's Hot Chips 32 slides list three Series X audio engines:
  one of two 4-way floating-point SIMD DSPs and four floating-point engines, for convolution, FFT, and reverb;
  one for Opus decoding and sample-rate conversion, for more than 300 channels;
  and one of four DSP cores for sample-rate conversion, effects, and XMA decoding
  ([Andrews and Grossman, Hot Chips 32][hc32], slide 8).
- Microsoft's GDK page says the Series X\|S decodes Opus in hardware through its Xbox Audio Processing Unit (XAPU) API,
  and that "SHAPE is still supported in XBOX Series X\|S consoles for backward compatibility titles"
  ([Microsoft, "Overview of XBOX Series X\|S audio hardware"][xbox-series-audio]).
- Wikipedia says both Xbox Series models support spatial audio,
  and that "audio ray tracing" uses the graphics ray-tracing processors for it
  ([Wikipedia, Xbox Series X and Series S][wp-series], secondary).

#### Switch and Switch 2

- On the Switch, a game either plays buffers through an audio output service at 48 kHz or uses the audio renderer,
  which takes the game's state updates and generates command lists for the audio DSP
  ([SwitchBrew, Audio services][sb-audio]; [`libnx` header `audout.h`][libnx-audout]).
  The renderer runs in fixed 5 ms frames of 240 samples at 48 kHz
  ([`libnx` header `audren.h`][libnx-audren]; constants read in a homebrew library's header).
- The renderer's parameter format is versioned by a revision value the game supplies,
  with new values added in system versions 1.0.0 to 23.0.0, each enabling features or fixes
  (SwitchBrew, Audio services, "BehaviorInfo Revision").
  An emulated renderer behaves as the revision a game asks for (inference).
- SwitchBrew describes the hardware Opus decoder service, which games request as `hwopus`, as libopus running on the DSP
  (SwitchBrew, Audio services, "hwopus"), so a host libopus can be expected to give matching output (inference).
- Low-level emulation of the Switch audio DSP would need Nintendo's DSP firmware (inference),
  which SwitchBrew says was overhauled on the Switch 2 to run Nintendo's own kernel
  (SwitchBrew, Audio services, "Notes"); the project does not obtain firmware ([ADR 0001, "Context"][adr1-context]).

### Operating systems, services, and security

#### PlayStation 3

- Sony's documents describe a guest operating system running on a hypervisor that virtualises most devices: storage,
  network, audio set-up, and the clock are reached by hypervisor calls; storage calls are mostly asynchronous,
  completing by virtual interrupt; and "The RTC value can be read by a hypervisor call, but it can not be written"
  ([Sony, Linux Kernel Overview][sony-lko], "Storage", "Giga Bit Ethernet", "Audio", "Real Time Clock").
  The Linux kernel's help text names the platform as "the PS3 hypervisor" and its LV1 level
  ([Linux, `arch/powerpc/platforms/ps3/Kconfig`][linux-kconfig]).
  An emulator that runs the game kernel (LV2) must provide LV1's calls;
  one that emulates LV2 at high level never needs LV1 (inference).
- psdevwiki lists the LV2 system calls in numbered groups: processes, PPU threads, timers and synchronisation,
  SPU threads, virtual memory, module loading, storage, the RSX, network, file system, and debugging,
  each marked by the firmware kinds that have it and by the rights it needs
  ([psdevwiki PS3, LV2 Functions and Syscalls][pd-ps3-lv2]).
  Only the retail, unprivileged subset matters to games (inference).
- PS3 libraries use the PRX module format, inherited from the PSP
  ([psdevwiki PS3, PRX][pd-ps3-prx]),
  with imports and exports in tables of identifiers (same, structure fields; observed).
  A game imports system-library functions that ship in the console's firmware,
  so an emulator must supply them itself or load Sony's modules (inference).
- RPCS3 needs the PS3 firmware, which Wikipedia says "can be downloaded from Sony's official website"
  ([Wikipedia, RPCS3][wp-rpcs3], secondary).
  This matches [`R0-02` option 6, "Point users to firmware the maker publishes"][r0-02-opt6].
- The PS3 shipped with "OtherOS", which booted Linux under the same hypervisor; Sony removed it in system software 3.21
  ([Wikipedia, PlayStation 3 system software][wp-ps3-sys], secondary),
  and the README beside Sony's kit says it is not available on the CECH-2000 series or later
  ([Levand, PS3-Linux README][sony-readme]).
  OtherOS is why maker-published hypervisor documentation exists for the PS3 and for no later console (inference).

#### PlayStation 4 and 5

- The PS4's Orbis OS is based on FreeBSD 9; Sony's open-source page lists a FreeBSD kernel among PS4 components
  ([Wikipedia, PlayStation 4 system software][wp-ps4-sys], secondary; [Sony, PS4 open-source page][sony-oss4];
  observed).
- psdevwiki says PS4 system calls follow FreeBSD numbering with some disabled and Sony's own calls added from 99 and
  after FreeBSD 9.1's last, 531, and that "the last custom Sony syscall ID is 677 (as of FW 6.51)"
  ([psdevwiki PS4, Syscalls][pd-ps4-syscalls]).
  Much of the kernel interface is documented FreeBSD behaviour (inference).
- Games reach the kernel mostly through a system library that also provides threads, event queues, memory allocation,
  and the dynamic linker (psdevwiki PS4, Syscalls; [OpenOrbis, "Libkernel"][oo-libkernel]),
  so the natural HLE boundary is the system-library interface (inference).
- PS4 executables are a modified ELF with Sony program-header types and a dedicated dynamic-linking segment,
  by the OpenOrbis toolchain's reverse-engineered documents
  ([OpenOrbis, "PS4 ELF Specification"][oo-elf], at a pinned commit).
  Imports name functions by a short hash of the name rather than by name;
  the toolchain's authors write that "It is believed the primary purpose of using NIDs was to obfuscate symbol names"
  ([OpenOrbis, "Dynlib Data"][oo-dynlib]).
  An HLE needs a table from those identifiers to its own functions (inference).
- That retail PS4 executables ship in a signed, encrypted wrapper is from memory;
  [`R0-02`, "Firmware, keys, and game copies"][r0-02-fw], applies.
  OpenOrbis builds homebrew as "fake SELF files", "without the need of Sony's official Software Development Kit"
  ([OpenOrbis README][oo-readme]),
  the only PS4 test software an emulator project can run without decryption (inference).
- psdevwiki says the PS5 kernel is based on FreeBSD 11.0 and carries three executable types,
  one of them for PS4 programs ([psdevwiki PS5, Kernel][pd-ps5-kernel]).
  For system software 2.70 and earlier it describes a small hypervisor that protects the kernel
  and "does not run multiple VMs" ([psdevwiki PS5, Hypervisor][pd-ps5-hv]); a game never calls it (inference).

#### Switch and Switch 2

- Horizon is a proprietary microkernel derived from the 3DS's, with every driver in user space,
  including Nvidia's GPU driver ([Wikipedia, Nintendo Switch system software][wp-switch-sys], secondary).
  SwitchBrew's table lists 124 kernel call numbers for the Switch, some reused across versions,
  and 7 more for the Switch 2 only ([SwitchBrew, SVC][sb-svc], counted).
- A process gets a service by asking a service manager for it by name,
  and requests travel in Horizon's own message format with copied and moved handles and buffer descriptors
  ([SwitchBrew, Services API][sb-services]; [HIPC][sb-hipc]).
  SwitchBrew lists 446 service names, 354 on the Switch and 347 on the Switch 2,
  counted on revision 15412 of 2026-11-02, including names retired in later versions
  (SwitchBrew, Services API; counted locally).
  HLE of Horizon means answering each service a game opens, over a large, versioned set (inference).
- This note prints an official name that SwitchBrew records only where an emulator must match it for a game to work,
  such as a service a game asks for by name or a module the loader looks for;
  SwitchBrew states no origin for these names ([`R0-05`][r0-05]).
- SwitchBrew lists `sdk` and `subsdk` modules that titles may carry beside `main`
  ([SwitchBrew, ExeFS][sb-exefs])
  and calls them the game's SDK code ([Switch 2: Compatibility Mode][sb-compat], "Hooking"),
  so an emulator runs the SDK as guest code and emulates the services below it, unlike the PS3 and PS4 (inference).
- Each program carries metadata declaring its address space, main thread, permitted kernel calls,
  and permitted services, with a signed part ([SwitchBrew, NPDM][sb-npdm]).
  Executables are segments with hashes, optionally compressed
  ([SwitchBrew, NSO0][sb-nso]),
  inside containers that SwitchBrew says are "encrypted", the only known exception being an optional logo section,
  with a key generation that rises with system versions ([SwitchBrew, NCA][sb-nca]).
- A newer game needs keys from a newer system version (inference);
  [`R0-02`, "Anti-circumvention law in the United States"][r0-02-1201], records that every § 1201 complaint, judgment,
  and notice found against a console emulator concerns the Switch.
- A secure monitor in Arm TrustZone offers cryptographic functions; user-mode processes reach it through a kernel call
  ([SwitchBrew, Secure Monitor][sb-secmon]).
  An HLE answers the services above it and never models TrustZone (inference).
- Switch 2 system versions ran from 19.0.0 before launch to 23.5.0 of 10 November 2026,
  with 16 dated releases from June 2025
  ([SwitchBrew, Switch 2: System Versions][sb-versions], counted; as of 2026-11-20),
  so an HLE of a system on sale targets an interface that changes about monthly (inference).
- In Switch 2 compatibility mode, three modules mapped into a Switch game override selected SDK functions,
  with per-game patches, while "most sdk codebin symbols remain unchanged and execute their original code"
  (SwitchBrew, Switch 2: Compatibility Mode, "Hooking").
  The maker's compatibility is a hybrid: hooks at the library boundary over its own system software (inference).

#### Xbox One and Series

- The system software is based on Windows NT and runs on Hyper-V;
  it was based on a Windows 8 core at launch and on a Windows 10 core from November 2015
  ([Wikipedia, Xbox system software][wp-xboxsys], secondary).
  The article does not say which partition each change describes.
- Microsoft publishes its Game Development Kit (GDK) documentation without a sign-in,
  apart from pages marked as topics under a non-disclosure agreement or redirected to a sign-in
  ([Microsoft's GDK documentation index][xbox-index]; observed).
- Its glossary defines the "Game OS" as "The minimal, fast, secure OS that runs GDK games on XBOX consoles",
  and `WINAPI_FAMILY_GAMES` as "The Win32 API partition that represents the subset of Win32 APIs supported by the GDK",
  marked "Required on XBOX consoles"; it calls MSIXVC the packaging format of GDK titles on PC and Xbox
  ([Microsoft, GDK glossary][xbox-glossary]).
  The game's interface is therefore a subset of Win32 plus the GDK's libraries (inference).
- The older Xbox One kit's documentation is not public,
  and which Win32 and GDK calls games use is not listed on the pages read.
- Microsoft's directory of topics under a non-disclosure agreement, at `docs.xbox.com/nda/`,
  is closed in the [register][register] and has no link here, because its pages are for licensed developers only;
  pages behind Microsoft's sign-in are not opened for the same reason.
- The `xboxoneresearch/` repositories, a community group whose list includes exploit and flash-dump tools,
  are not in the register and are not linked; the guard blocks their code, and `R1-23` evaluates them (research log).

### Timing, threading, and input

- The Switch kernel's thread call accepts processor ids 0 to 3, or -2 for the process's default core, and a sleep of 0,
  -1, or -2 nanoseconds selects one of three kinds of yield ([SwitchBrew, SVC][sb-svc]).
- On the Switch 2, a Switch game's process is given cores 0 to 5 (`0x3F`),
  but the compatibility layer reports only three, "effectively pretending that there are only 3 CPU cores available"
  ([SwitchBrew, Switch 2: Compatibility Mode][sb-compat]).
- SwitchBrew lists kernel calls that arbitrate a lock at a guest address and wait on or signal a process-wide key,
  and from 4.0.0 a general wait-on-address
  (SwitchBrew, SVC); that these serve as mutexes and condition variables is inference from their names.
- The GPU driver service offers calls to read, increment, and wait on a syncpoint,
  and a GPU submission returns a fence for others to wait on
  ([SwitchBrew, NV services][sb-nv]); that CPU and GPU synchronise through these is inference.
  An HLE must keep these semantics, including timeouts and cancellation (inference).
- The PS3's game kernel offers threads, mutexes, lightweight mutexes, condition variables, reader-writer locks,
  semaphores, event flags, and event queues
  ([psdevwiki PS3, LV2 Functions and Syscalls][pd-ps3-lv2], group and call names);
  the PS4 adds Sony event flags and semaphores to FreeBSD's calls ([psdevwiki PS4, Syscalls][pd-ps4-syscalls]).
- The Switch's tick counter runs at 19.2 MHz and is read directly by games;
  on the Switch 2 the compatibility layer "Returns 31250000 instead of 19200000" to Switch games
  (SwitchBrew, SVC; Switch 2: Compatibility Mode).
  Because the guest reads it without a kernel call,
  the emulator must keep it consistent with guest progress (inference).
- The Switch's performance service sets clock configurations: the CPU at 1020 MHz
  (1224 MHz in configurations for development units only),
  or 1785 MHz in boost configurations from 7.0.0 that drop the GPU to 76.8 MHz,
  which a power-saving mode from 7.0.0 also does at 1020 MHz; the others run the GPU from 230.4 to 768 MHz,
  two of them only when docked ([SwitchBrew, PPC services][sb-ppc]).
- Games ask for the operation mode (handheld or docked) and the performance mode,
  and can be notified when either changes ([SwitchBrew, Applet Manager services][sb-am]).
  An emulator chooses the mode it reports, and a change must arrive as that notification (inference).
- The Switch 2's compatibility layer adds waits and locks for Switch games;
  for two of them SwitchBrew writes "Probably prevents a race condition that only manifests on Switch 2"
  (SwitchBrew, Switch 2: Compatibility Mode, section on one of its three modules).
  Running faster than the original exposes timing bugs, which an emulator on a fast host also meets (inference).
- The Switch 2's screen runs up to 120 Hz with variable refresh
  ([Wikipedia, Nintendo Switch 2][wp-switch2], secondary; as of 2026-11-20),
  and the PS5 added variable refresh at 1440p in system software 7.00 of 8 March 2023
  ([Wikipedia, PlayStation 5][wp-ps5], secondary), so an emulator must not assume a fixed 60 Hz (inference).
- Vulkan requires only its FIFO present mode, which waits for vertical blanking
  ([Khronos, VkPresentModeKHR][vk-present]);
  a guest waiting on its own vertical-sync event
  ([SwitchBrew, VI services][sb-vi]) adds that latency to the host's (inference).
- Attached to the console, a Joy-Con is asked for its state every 15 ms
  ([dekuNukem, README][deku-readme]);
  over Bluetooth the standard full report is pushed at 60 Hz, or 120 Hz for the Pro Controller
  ([dekuNukem, Bluetooth HID notes][deku-bt], "INPUT 0x30");
  at a 15 ms push each report carries three motion samples 5 ms apart ([dekuNukem, IMU notes][deku-imu]).
- The game-facing input service writes ring buffers in a shared memory block of `0x40000` bytes,
  each entry with a sampling number ([SwitchBrew, HID services][sb-hid]).
  A host gyroscope must be resampled to that pattern (inference).
- Each trigger of the Xbox Wireless Controller has its own rumble motor
  ([Wikipedia, Xbox Wireless Controller][wp-xboxpad], secondary).
  Microsoft publishes a USB protocol for game controllers, the Gaming Input Protocol USB extension,
  revision 1.0 of 16 September 2024 (that it is the Xbox controllers' protocol is from memory),
  under a notice that allows copies made to implement it and grants no patent licence itself
  ([Microsoft, MS-GIPUSB][ms-gipusb], notice; its technical content was not read).

### Online services

- Nintendo Switch Online is required for online play in most games and holds cloud saves,
  which lapse after a six-month grace period ([Wikipedia, Nintendo Switch Online][wp-nso], secondary; as of 2026-11-20).
  Switch games also receive server-delivered content through a background delivery cache
  ([SwitchBrew, BCAT services][sb-bcat]).
  Offline emulation loses multiplayer, cloud saves, and delivered content (inference).
- A third-party client library warns that "Nintendo bans Switch devices that show suspicious behavior"
  ([NintendoClients README][nc-readme], commit `d0965c88`).
  Wikipedia, citing Engadget, reports unique identifiers on Switch and Switch 2 game cards against duplicated cards,
  and bans from the online service ([Wikipedia, Nintendo Switch 2][wp-switch2], secondary).
  An emulator that connects to official servers exposes users to those measures (inference).

### Tests and sources

- The only test suite found for these systems is RPCS3's PS3 repository,
  which compares output with expected output "preferably from a real PS3"
  ([RPCS3 ps3autotests README][rpcs3-tests], prose of a walled source).
  None was found for the PS4, PS5, Xbox One, Series, Switch, or Switch 2,
  in the [register][register] or [`R0-05`][r0-05] (research log).
- RPCS3's approach to Sony's libraries and to the SPUs was not found:
  the guard blocks RPCS3's main repository beyond its prose, and `rpcs3.net` refused an automated request with HTTP 403
  (research log).
- Of the maker material in the Sources, Sony's PS3 Linux documents are under GFDL 1.2.
  IBM's slides say that nothing in them operates "as an express or implied license"
  ([Gschwind et al., Hot Chips 17][hc17-gschwind], slide 31).
  Arm's manuals carry a notice that forbids reproduction without Arm's written permission
  ([Arm, Cortex-A57 TRM][arm-a57], proprietary notice),
  and the Hot Chips 32 slides allow personal use only
  ([Andrews and Grossman, Hot Chips 32][hc32], slide 1); facts from them are stated in this note's own words.
- AMD's Family 16h guide carries "AMD Confidential" page footers on a revision AMD marks "PUB release"
  and serves from its own site ([AMD, 48751][amd-16h]); the [register][register] records both.
- The register and `R0-05` list no maker document for the PS4, PS5, or Xbox GPUs beyond Microsoft's slides,
  nor for the Tegra T239.
  AMD's instruction-set manuals for these GPUs now sit on hosts the register does not list,
  and Nvidia's GPU documentation repository is not listed (research log); each is evaluated when a note first cites it
  ([ADR 0001, "Evaluating a new source"][adr1-eval]).
- Community references for these systems are reverse-engineered.
  SwitchBrew states no origin and no rule on leaked material ([`R0-05`][r0-05]).
- psdevwiki's PS4 page on the executable wrapper says part of its layout came from a leaked kernel,
  and its PS4 libraries page reads like a maker's manual (research log).
  Both pages are closed in the [register][register], so they have no link:
  `www.psdevwiki.com/ps4/SELF_File_Format` and `www.psdevwiki.com/ps4/Libraries`.
  The proposed amendment of [ADR 0001][adr1] recommends
  that pages a source's author says came from leaked material are closed while the rest of the source keeps its tier.

## Options and trade-offs

Costs and gains are the author's inference unless a source is named.

### Emulate the operating system at high level, or run the maker's system software

- **What:** answer the game's system calls and library or service requests in the emulator (HLE),
  or emulate the hardware and kernel interface and run the maker's own system modules from a dump (low-level emulation).
- **Costs:** HLE must follow a large interface that changes with versions, service by service;
  low-level emulation needs firmware and keys that [`R0-02`, "Firmware, keys, and game copies"][r0-02-fw],
  treats as unsettled, and must model hypervisors and security processors.
- **Gains:** HLE needs no maker code and skips the boot chain and security processors;
  low-level emulation reproduces the maker's behaviour, including its bugs.
- **Used by:** the Switch 2 for Switch games, as a hybrid (inference): its layer overrides selected SDK functions,
  mostly graphics, and the rest of the game's SDK code runs on Nintendo's system software
  ([SwitchBrew, Switch 2: Compatibility Mode][sb-compat], "Hooking");
  RPCS3 requires Sony's published PS3 firmware
  ([Wikipedia, RPCS3][wp-rpcs3], secondary); shadPS4 loads some system modules from a dump ([shadPS4 README][shadps4]).

#### Recommendation

High-level emulation for every system here,
with PS3 library modules from Sony's published firmware as an option for each library.
HLE needs no keys or dumped modules, which [`R0-02`][r0-02-fw] leaves unsettled,
and the maker's own Switch 2 layer and Microsoft's public GDK pages show
that the boundary is documented enough to reach; Sony publishes the PS3 firmware,
so loading it fits [`R0-02` option 6][r0-02-opt6].

### Where the high-level boundary sits

- **What:** the kernel's calls (PS3 LV2, Switch kernel calls), the system libraries
  (PS4 and PS5, the Xbox GDK),
  or the services reached by messages (Switch); for the PS3,
  also whether Sony's libraries are emulated or loaded from the published firmware.
- **Costs:** a low boundary means running more guest code and modelling more kernel behaviour;
  a high boundary means reimplementing more of the maker's libraries.
- **Gains:** a low boundary has fewer entry points; a high one runs less guest code and needs no maker modules.
- **Used by:** the evidence places the Switch boundary at services, because games carry their SDK,
  the PS4's at the libraries, and the Xbox's at the Win32 subset and GDK libraries (inference).

#### Recommendation

Each system's documented boundary: Switch services
(games carry their SDK),
PS4 and PS5 system libraries, PS3 LV2 calls, and the Xbox `WINAPI_FAMILY_GAMES` Win32 subset plus GDK libraries.
These are where the sources place the games' calls, and each is versioned,
so the boundary must also track the system version a game targets.

### How guest code is executed

- **What:** direct execution on a host of the same architecture
  (in-process or in a host virtual machine),
  or dynamic translation, or translation ahead of time of uploaded images (SPU programs).
- **Costs:** direct execution ties each system to one host architecture and must trap or translate missing extensions;
  translation costs speed and needs memory-ordering work from x86 guests on Arm hosts.
- **Gains:** direct execution runs faster than translation; translation runs anywhere.
- **Used by:** shadPS4 (direct, by its [README][shadps4]); Ryujinx on Apple silicon
  (host virtual machine; [Wikipedia, Ryujinx][wp-ryujinx], secondary);
  FEX and Box64 for x86 programs on Arm hosts ([FEX README][fex]; [Box64 README][box64]).

#### Recommendation

A translator for each guest architecture as the base,
with direct execution as an optimisation on hosts of the same architecture.
The PS3 needs translation on every host, Arm hosts need it for x86 guests, and some Switch games need AArch32,
which only some Arm64 hosts run directly; direct execution is faster where it applies.

### The Cell's SPUs

- **What:** run SPU threads on host threads with blocking channels, or schedule them cooperatively;
  emulate 128-byte reservations exactly or approximately; perform DMA at once or deferred.
- **Costs:** exact reservations and deferred DMA cost speed; approximation fails games that race.
- **Gains:** exactness follows Sony's documented rules; approximation is simpler.
- **Used by:** RPCS3, whose approach was not found in the RPCS3 prose that could be fetched (research log).

#### Recommendation

Host threads that block on SPU channels, exact detection of writes to a reserved 128-byte line,
and DMA performed at once, with deferral added only where a test shows a game depends on overlap;
Sony documents the reservation and alignment rules exactly, and blocking channel reads give natural switch points.
IBM's SPU instruction-set copies on third-party hosts are not read:
the proposed amendment of [ADR 0001][adr1] recommends
that maker documents surviving only on third-party hosts are closed unless the maker's release is shown.

### Shader translation and caching

- **What:** translate guest shader binaries to SPIR-V or another host form at draw time,
  with a persistent cache of translations; use host pipeline libraries or shader objects where available;
  pre-compile from a recorded list; or interpret on the GPU.
- **Costs:** run-time translation stutters on first use; a host pipeline cache is tied to the GPU and driver
  ([Khronos, Vulkan specification, "Pipeline Cache"][vk-pipelines]),
  and a translation cache to the emulator's version;
  a GPU-side interpreter for programmable guests is not described by any source read.
- **Gains:** caching removes repeated stutter; pipeline libraries reduce it.
- **Used by:** shadPS4 (a shader recompiler) and yuzu (a shader decompiler), by Wikipedia
  ([ShadPS4][wp-shadps4]; [Yuzu (emulator)][wp-yuzu]; secondary).

#### Recommendation

Translation to SPIR-V at first use, a persistent translation cache keyed by the emulator's version,
and pipeline libraries or shader objects where the host has them.
Khronos's own proposals target the case of state known only at draw time, and a cache removes repeat stutter.

### Coherence between CPU and GPU memory

- **What:** track which side last wrote each region of unified guest memory, at a page or finer granularity,
  or assume games do not read GPU results back.
- **Costs:** tracking costs copies and faults; assuming fails games that read back.
- **Gains:** tracking is correct; assuming is fast.
- **Used by:** shadPS4 added experimental readbacks, disabled by default, in July 2025
  ([Wikipedia, ShadPS4][wp-shadps4], secondary).

#### Recommendation

Tracking at page granularity from the start.
Every system but the PS3 shares one pool, and shadPS4 had to add readbacks later,
which shows that the assumption fails real games.

### Models, modes, and revisions to present

- **What:** which model's memory budget and GPU configuration to report
  (PS4 or Pro, One or One X, Series X or S, PS5 or Pro),
  which Switch operation and performance mode, and which system-software version.
- **Costs:** each model presented is a configuration to test; a game may behave differently with more memory or speed.
- **Gains:** presenting the stronger model can improve games; presenting the original keeps them as shipped.
- **Used by:** the PS4 Pro's Boost Mode for unpatched games
  ([Wikipedia, PlayStation 4][wp-ps4], secondary)
  and the Switch 2's per-game compatibility settings ([SwitchBrew, Switch 2: Compatibility Mode][sb-compat]).

#### Recommendation

By default, the original base model, its default mode, and the system version a game was built for,
with stronger models as an option.
That keeps games as shipped and limits the configurations to test; the makers' own boost modes are opt-in or per game.

### Audio

- **What:** emulate the audio services and libraries at high level and render on the host, including spatial audio;
  or emulate audio processors with maker firmware.
- **Costs:** HLE must match each renderer revision's behaviour;
  low-level emulation needs firmware the project does not obtain;
  the patent status of audio formats such as AC-3 was not confirmed
  ([`R0-02`, "Patents, recorded as risks"][r0-02-pat]).
- **Gains:** HLE needs no firmware, and the makers now document the API surfaces it answers for the Xbox
  ([Microsoft, "Overview of SHAPE"][xbox-shape];
  [Microsoft, "Overview of XBOX Series X\|S audio hardware"][xbox-series-audio]).
- **Used by:** the [register][register] lists no open-tier emulator for these systems.

#### Recommendation

High-level emulation of the audio services and libraries, rendered on the host: the Switch audio renderer by revision,
XAudio2 with the Xbox One control processor's and the Series XAPU APIs, and Sony's libraries.
Low-level emulation needs DSP firmware the project does not obtain,
and the makers' public pages describe the API surfaces.

### Online services

- **What:** leave online features out, replace them with the project's own services, or connect to the makers'.
- **Costs:** leaving out loses multiplayer and delivered content;
  replacing carries the server-emulator risk [`R0-02`][r0-02] records;
  connecting to Nintendo's servers exposes users to its bans.
- **Gains:** leaving out is simplest and touches no service.
- **Used by:** yuzu replaced Nintendo's BCAT with its own service, later removed as non-functional
  ([Wikipedia, Yuzu (emulator)][wp-yuzu], secondary).

#### Recommendation

Leave online features out at first, with no connection to the makers' servers.
Connecting exposes users to the bans the sources record,
and a replacement service carries the server-emulator risk in [`R0-02`][r0-02].

## Implications for Rustalgia

- The operating system is the main interface for every system here (inference),
  so the family surveys [`R1-14`][roadmap], [`R1-21`][roadmap],
  and [`R1-23`][roadmap] need to record which boundary each studied emulator chose
  and how it handles system-software versions.
  This feeds an ADR on high-level against low-level emulation of system software, and [`R2-12`][roadmap].
- The PS3, PS4, PS5, Switch, and Switch 2 have no open-tier emulator, and the Xbox One and Series have no hub
  ([register][register]; [`R0-05`][r0-05]);
  the surveys will rest on prose, community wikis, the few maker documents, Microsoft's public GDK pages,
  and reader sessions for walled emulators (inference).
  This bears on [`R6-01`][roadmap], which weighs each system's risks.
- Guest architecture decides which host runs a system fastest: x86-64 hosts for the Sony and Microsoft systems,
  Arm64 hosts for Nintendo's, and translation everywhere for the PS3 (inference).
  A Switch emulator also needs a 32-bit Arm front end.
  This feeds [`R2-01`][roadmap], [`R3-01`][roadmap], [`R4-08`][roadmap], and the host notes in phase 3.
- Shader translation and caching are central GPU work for every system here (inference).
  This feeds [`R2-05`][roadmap] and [`R4-05`][roadmap], and a quality target on first-run stutter in [`R6-02`][roadmap].
- Switch games are encrypted, and the Switch 2's system software changes about monthly
  (inference, as of 2026-11-20); encryption on the other systems is from memory.
  The legal record in [`R0-02`][r0-02] and the pace of change both feed `R6-01`.
- Unified memory near host size feeds the host requirements in phase 3 and `R6-02` (inference).

## Open questions

- Exact SPU floating-point deviations: IBM's instruction-set document,
  if the proposed amendment of [ADR 0001][adr1] lets a capture of IBM's own address show its release;
  otherwise [`R1-21`][roadmap] reader sessions.
- Cores available to PS5 games: [`R1-21`][roadmap] (Sony's blog, Wikipedia, and psdevwiki searched).
- How Xbox One games place data in ESRAM: [`R1-23`][roadmap], from walled emulators' prose or reader sessions.
- Kraken and BCPack bitstreams: no public specification
  (register, `R0-05`, Microsoft's public GDK index searched); [`R2-11`][roadmap].
- Which Win32 and GDK calls Xbox games use, and the MSIXVC and older kit formats: [`R1-23`][roadmap].
- RPCS3's library and SPU approach: an `R1-21` reader session, or the prose of `rpcs3.net` once evaluated
  (it refuses scripts).
- Tempest's internals: `R1-21`.
- The PS3's time-base frequency and its source: `R1-21`
  (Linux's PS3 platform code is a candidate, `other` tier; Sony's kit documents searched).
- PS3 audio middleware on the SPUs: `R1-21`.

## Sources

Every source below was read on 2026-11-20. psdevwiki was read from existing Wayback Machine captures,
because the live site refused automated requests (research log); each capture's time stamp is given.
Sources that this note names but does not link are closed in the [register][register], and the text says why.

Maker documents and talks:

- Sony, PS3 Linux Distributor's Starter Kit: [Linux Kernel Overview][sony-lko]
  (revision 1.7),
  [Application Programming Environment][sony-ape] (revision 1.6), and [Cell Programming Primer][sony-cpp]
  (revision 1.6)
  chapters 1 to 4, GFDL 1.2; G. Levand's [PS3-Linux README][sony-readme] of 6 January 2024;
  and the [directory listing][sony-dir].
- M. Gschwind et al., ["A Novel SIMD Architecture for the Cell Heterogeneous Chip-Multiprocessor"][hc17-gschwind],
  Hot Chips 17 (2005).
- R. Sakai et al., ["Programming and Performance Evaluation of the Cell Processor"][hc17-sakai], Hot Chips 17.
- J. Sell and P.
  O'Connor, ["Xbox One Main SoC and Xbox One Kinect"][hc25], Hot Chips 25 (2013), slides, mostly images.
- J. Sell, [Xbox One X ("Scorpio Engine") slides][hc29], Hot Chips 29 (2017), images, read by OCR and by eye;
  found through the Wayback Machine's index of addresses and fetched from `old.hotchips.org`.
- J. Andrews and M.
  Grossman, ["Xbox Series X System Architecture"][hc32], Hot Chips 32
  (17 August 2020), © 2020 IEEE, personal use permitted.
- Arm, [Cortex-A57 MPCore Processor Technical Reference Manual][arm-a57], DDI 0488 issue H (r1p3, 1 February 2016).
- Arm, [Cortex-A78C Core Software Optimization Guide][arm-a78c-sog], issue 1.0 (2 November 2020).
- Arm, [Cortex-A78C Core Technical Reference Manual][arm-a78c-trm], 102226, revision r0p2, document 0002_03.
- AMD, [BIOS and Kernel Developer's Guide for Family 16h Models 00h-0Fh][amd-16h], 48751 revision 3.03.
- [US 10,275,239 B2][us10275239], on deriving application-specific operating parameters for backwards compatibility
  (granted 30 April 2019; title paraphrased), patent office image.
- Sony, ["Open Source Software Used in PlayStation(R)4 (US)"][sony-oss4].
- Sony, PlayStation Blog, ["Unveiling new details of PlayStation 5: hardware technical specs"][psblog], 18 March 2020,
  updated.
- Microsoft, ["[MS-GIPUSB]: Gaming Input Protocol (GIP) Universal Serial Bus (USB) Extension"][ms-gipusb], revision 1.0
  (16 September 2024), landing page and notice.
- Microsoft, ["System resources for UWP apps and games on Xbox One"][ms-uwp], dated 8 February 2017,
  now under Microsoft Learn's previous versions.
- Microsoft, GDK documentation: the [index][xbox-index] and its English topic lists, the [glossary][xbox-glossary],
  ["The audio architecture in XBOX One"][xbox-one-audio], ["Overview of SHAPE"][xbox-shape],
  and ["Overview of XBOX Series X\|S audio hardware"][xbox-series-audio], read as Markdown.

Press:

- R. Leadbetter, Digital Foundry, ["Inside Xbox Series X: the full specs"][df], 16 March 2020.
- N. Fernandez, Android Authority,
  ["Nintendo accidentally improved Switch emulation performance, thanks to Switch 2"][aa], 15 May 2025, updated the same
  day.

Community references:

- SwitchBrew pages, read raw at the revision given in brackets: [Hardware][sb-hardware] (15339),
  [Memory layout][sb-memlayout] (12866), [SVC][sb-svc] (15416), [NV services][sb-nv] (15358), [GPU][sb-gpu] (12795),
  [GPU Classes][sb-gpuclasses] (12790), [GPU Shaders][sb-gpushaders] (12661), [NPDM][sb-npdm] (15417), [NSO0][sb-nso]
  (14440), [ExeFS][sb-exefs] (1506), [NCA][sb-nca] (14983), [Services API][sb-services] (15412), [HIPC][sb-hipc]
  (14205), [Secure Monitor][sb-secmon] (15437), [Audio services][sb-audio] (15352), [HID services][sb-hid] (15464),
  [PPC services][sb-ppc] (12421), [Applet Manager services][sb-am] (15266), [VI services][sb-vi] (15292),
  [BCAT services][sb-bcat] (15401), [Switch 2: Tegra T239][sb-t239] (15493), [Switch 2: Compatibility Mode][sb-compat]
  (15275), [Switch 2: System Versions][sb-versions] (15457).
- psdevwiki, archived captures: PS3 [RAM][pd-ps3-ram] (20261010031253), [RSX][pd-ps3-rsx] (20261013161738),
  [CELL BE][pd-ps3-cell] (20260623140547), [LV2 Functions and Syscalls][pd-ps3-lv2] (20260818233001),
  [PRX][pd-ps3-prx] (20260222183702); PS4 [APU][pd-ps4-apu] (20251121182524), [Syscalls][pd-ps4-syscalls]
  (20260216085041); PS5 [Hardware][pd-ps5-hw] (20260221153149), [Kernel][pd-ps5-kernel] (20261001200415),
  [Hypervisor][pd-ps5-hv] (20260519183327).
  The PS4 SELF File Format capture (20260220000705) was used only for its statement on a leaked kernel,
  and is not linked because the register closes that page.
- OpenOrbis PS4 Toolchain at commit `0a1aaf9`: [README][oo-readme], ["PS4 ELF Specification"][oo-elf],
  ["Dynlib Data"][oo-dynlib], ["Libkernel"][oo-libkernel].
- dekuNukem, Nintendo Switch reverse-engineering notes at commit `b354f21a`: [README][deku-readme],
  [Bluetooth HID notes][deku-bt], [IMU notes][deku-imu].
- `libnx` headers [`audren.h`][libnx-audren] and [`audout.h`][libnx-audout], from the master branch,
  whose latest commit was `b156b477`.
- [NintendoClients README][nc-readme], at commit `d0965c88`.

Open-source documentation and specifications:

- Linux kernel at commit `5f22fb20`: `Documentation/gpu/amdgpu/`
  ([`driver-core.rst`][linux-core], [`ring-buffer.rst`][linux-ring], [`gc/index.rst`][linux-gc]),
  [`Documentation/filesystems/spufs/spufs.rst`][linux-spufs], [`arch/powerpc/platforms/ps3/Kconfig`][linux-kconfig],
  and [`sound/ppc/snd_ps3.c`][linux-sndps3]
  (header and capabilities only);
  the last three were read from the master branch, whose head was `5f22fb20`, and none has changed since 2025.
- Mesa documentation: [RADV][mesa-radv],
  and NVK's pages ["Hardware docs"][mesa-nvk-hw] and ["External Hardware Documentation and Resources"][mesa-nvk-ext].
- Khronos: Vulkan specification chapter ["Pipelines"][vk-pipelines],
  [VK_EXT_graphics_pipeline_library][vk-gpl] and [VK_EXT_shader_object][vk-so] proposals,
  and the [VkPresentModeKHR][vk-present] reference page.
- Khronos, [SPIR-V Specification][spirv], version 1.6 revision 8.
- [FEX README][fex] at commit `20059335` and [Box64 README][box64] at commit `07e9e5c3`, the latest to change each file.

Prose of walled emulators:

- [shadPS4 README][shadps4], from the main branch, re-read on 2026-11-20; the guard blocks the commit lookup,
  so none is given.
- [RPCS3 ps3autotests README][rpcs3-tests], from the master branch; the guard blocks the commit lookup,
  so none is given.

Wikipedia, raw wikitext (tertiary; each link is the revision read, in brackets):

- [Cell (processor)][wp-cell] [1386170292]; [PlayStation 3 technical specifications][wp-ps3-specs] [1386319161];
  [PlayStation 3 system software][wp-ps3-sys] [1386319155]; [RSX Reality Synthesizer][wp-rsx] [1318869943];
  [PlayStation 4][wp-ps4] [1386319169]; [PlayStation 4 technical specifications][wp-ps4-specs] [1386319175];
  [PlayStation 4 system software][wp-ps4-sys] [1385538186]; [PlayStation 5][wp-ps5] [1385515902];
  [Xbox One][wp-xboxone] [1386323575]; [Xbox Series X and Series S][wp-series] [1386594308];
  [Xbox system software][wp-xboxsys] [1386323584]; [Xbox Wireless Controller][wp-xboxpad] [1385359035];
  [Nintendo Switch][wp-switch] [1384604421]; [Nintendo Switch 2][wp-switch2] [1386314413];
  [Nintendo Switch system software][wp-switch-sys] [1381894756]; [Nintendo Switch Online][wp-nso] [1384839693];
  [Zen 2][wp-zen2] [1373859411]; [Direct3D][wp-d3d] [1385070978]; [Graphics Core Next][wp-gcn] [1384947614];
  [RDNA (microarchitecture)][wp-rdna] [1384343765]; [Micro stuttering][wp-stutter] [1385431095];
  [RPCS3][wp-rpcs3] [1384344878]; [ShadPS4][wp-shadps4] [1383492990]; [Ryujinx][wp-ryujinx] [1376535915];
  [Yuzu (emulator)][wp-yuzu] [1380070546].

[r0-02]: R0-02-legal-baseline.md
[r0-02-fw]: R0-02-legal-baseline.md#firmware-keys-and-game-copies
[r0-02-pat]: R0-02-legal-baseline.md#patents-recorded-as-risks
[r0-02-1201]: R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states
[r0-02-opt6]: R0-02-legal-baseline.md#6-point-users-to-firmware-the-maker-publishes
[r0-05]: R0-05-source-map.md
[r1-03]: R1-03-primer-sixth-generation.md
[r1-08]: R1-08-catalogue-modern.md
[roadmap]: ../../roadmap/research.md
[adr1]: ../../adr/0001-restrict-reading-by-licence-tier.md
[adr1-context]: ../../adr/0001-restrict-reading-by-licence-tier.md#context
[adr1-eval]: ../../adr/0001-restrict-reading-by-licence-tier.md#evaluating-a-new-source
[register]: ../../../.claude/hooks/source-register.txt
[pr22]: https://github.com/jsamuelsen11/rustalgia-emu/pull/22
[sony-lko]: https://kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/LinuxKernelOverview.html
[sony-ape]: https://kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/ApplicationProgrammingEnvironment.html
[sony-cpp]: https://kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/CellProgrammingPrimer.html
[sony-readme]: https://kernel.org/pub/linux/kernel/people/geoff/cell/README
[sony-dir]: https://kernel.org/pub/linux/kernel/people/geoff/cell/
[hc17-gschwind]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T1.pdf
[hc17-sakai]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T4.pdf
[hc25]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf
[hc29]: https://old.hotchips.org/wp-content/uploads/hc_archives/hc29/HC29.21-Monday-Pub/HC29.21.10-GPU-Gaming-Pub/HC29.21.110-Xbox-Sell-Microsoft.pdf
[hc32]: https://hc32.hotchips.org/assets/program/conference/day1/HotChips2020_GPU_Microsoft_Jeff_Andrews_v2.pdf
[arm-a57]: https://documentation-service.arm.com/documentation/ddi0488/h/
[arm-a78c-sog]: https://documentation-service.arm.com/static/5fa2bd1eb1a7c5445f2906fd
[arm-a78c-trm]: https://documentation-service.arm.com/static/6193c9bef45f0b1fbf3a85dd
[amd-16h]: https://www.amd.com/content/dam/amd/en/documents/archived-tech-docs/programmer-references/48751_16h_bkdg.pdf
[us10275239]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/10275239
[sony-oss4]: https://www.playstation.com/en-us/oss/ps4/
[psblog]: https://blog.playstation.com/2020/03/18/unveiling-new-details-of-playstation-5-hardware-technical-specs/
[ms-gipusb]: https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gipusb/e7c90904-5e21-426e-b9ad-d82adeee0dbc
[ms-uwp]: https://learn.microsoft.com/en-us/previous-versions/windows/uwp/xbox-apps/system-resource-allocation
[xbox-index]: https://docs.xbox.com/llms.txt
[xbox-glossary]: https://docs.xbox.com/home/glossary
[xbox-one-audio]: https://docs.xbox.com/build/console-features/audio/overviews/xbox-one-audio-architecture
[xbox-shape]: https://docs.xbox.com/build/console-features/audio/overviews/shape-overview
[xbox-series-audio]: https://docs.xbox.com/build/console-features/audio/overviews/scarlett-audio
[df]: https://www.digitalfoundry.net/articles/digitalfoundry-2020-inside-xbox-series-x-full-specs
[aa]: https://www.androidauthority.com/mario-kart-8-deluxe-switch-emulation-3557965/
[sb-hardware]: https://switchbrew.org/w/index.php?oldid=15339
[sb-memlayout]: https://switchbrew.org/w/index.php?oldid=12866
[sb-svc]: https://switchbrew.org/w/index.php?oldid=15416
[sb-nv]: https://switchbrew.org/w/index.php?oldid=15358
[sb-gpu]: https://switchbrew.org/w/index.php?oldid=12795
[sb-gpuclasses]: https://switchbrew.org/w/index.php?oldid=12790
[sb-gpushaders]: https://switchbrew.org/w/index.php?oldid=12661
[sb-npdm]: https://switchbrew.org/w/index.php?oldid=15417
[sb-nso]: https://switchbrew.org/w/index.php?oldid=14440
[sb-exefs]: https://switchbrew.org/w/index.php?oldid=1506
[sb-nca]: https://switchbrew.org/w/index.php?oldid=14983
[sb-services]: https://switchbrew.org/w/index.php?oldid=15412
[sb-hipc]: https://switchbrew.org/w/index.php?oldid=14205
[sb-secmon]: https://switchbrew.org/w/index.php?oldid=15437
[sb-audio]: https://switchbrew.org/w/index.php?oldid=15352
[sb-hid]: https://switchbrew.org/w/index.php?oldid=15464
[sb-ppc]: https://switchbrew.org/w/index.php?oldid=12421
[sb-am]: https://switchbrew.org/w/index.php?oldid=15266
[sb-vi]: https://switchbrew.org/w/index.php?oldid=15292
[sb-bcat]: https://switchbrew.org/w/index.php?oldid=15401
[sb-t239]: https://switchbrew.org/w/index.php?oldid=15493
[sb-compat]: https://switchbrew.org/w/index.php?oldid=15275
[sb-versions]: https://switchbrew.org/w/index.php?oldid=15457
[pd-ps3-ram]: https://web.archive.org/web/20261010031253/https://www.psdevwiki.com/ps3/RAM
[pd-ps3-rsx]: https://web.archive.org/web/20261013161738/https://www.psdevwiki.com/ps3/RSX
[pd-ps3-cell]: https://web.archive.org/web/20260623140547/https://www.psdevwiki.com/ps3/CELL_BE
[pd-ps3-lv2]: https://web.archive.org/web/20260818233001/https://www.psdevwiki.com/ps3/LV2_Functions_and_Syscalls
[pd-ps3-prx]: https://web.archive.org/web/20260222183702/https://www.psdevwiki.com/ps3/PRX
[pd-ps4-apu]: https://web.archive.org/web/20251121182524/https://www.psdevwiki.com/ps4/APU
[pd-ps4-syscalls]: https://web.archive.org/web/20260216085041/https://www.psdevwiki.com/ps4/Syscalls
[pd-ps5-hw]: https://web.archive.org/web/20260221153149/https://www.psdevwiki.com/ps5/Hardware
[pd-ps5-kernel]: https://web.archive.org/web/20261001200415/https://www.psdevwiki.com/ps5/Kernel
[pd-ps5-hv]: https://web.archive.org/web/20260519183327/https://www.psdevwiki.com/ps5/Hypervisor
[oo-readme]: https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain/blob/0a1aaf9dd4a92695538bdeb09fb056d06dd11725/README.md
[oo-elf]: https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain/blob/0a1aaf9dd4a92695538bdeb09fb056d06dd11725/docs/MD/OELF%20Specification/PS4%20ELF%20Specification.md
[oo-dynlib]: https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain/blob/0a1aaf9dd4a92695538bdeb09fb056d06dd11725/docs/MD/OELF%20Specification/PS4%20ELF%20Specification%20-%20Dynlib%20Data.md
[oo-libkernel]: https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain/blob/0a1aaf9dd4a92695538bdeb09fb056d06dd11725/docs/MD/PS4%20Libraries/Libkernel.md
[deku-readme]: https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/b354f21ae81f7b0d1d060b2b61e66ad0d9bc1756/README.md
[deku-bt]: https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/b354f21ae81f7b0d1d060b2b61e66ad0d9bc1756/bluetooth_hid_notes.md
[deku-imu]: https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/b354f21ae81f7b0d1d060b2b61e66ad0d9bc1756/imu_sensor_notes.md
[libnx-audren]: https://github.com/switchbrew/libnx/blob/master/nx/include/switch/services/audren.h
[libnx-audout]: https://github.com/switchbrew/libnx/blob/master/nx/include/switch/services/audout.h
[nc-readme]: https://github.com/Kinnay/NintendoClients/blob/d0965c8875ca09e1bfa5482ac8d41d1eccd59d75/README.md
[linux-core]: https://github.com/torvalds/linux/blob/5f22fb20497f4983094131f00a734362300d22d2/Documentation/gpu/amdgpu/driver-core.rst
[linux-ring]: https://github.com/torvalds/linux/blob/5f22fb20497f4983094131f00a734362300d22d2/Documentation/gpu/amdgpu/ring-buffer.rst
[linux-gc]: https://github.com/torvalds/linux/blob/5f22fb20497f4983094131f00a734362300d22d2/Documentation/gpu/amdgpu/gc/index.rst
[linux-spufs]: https://github.com/torvalds/linux/blob/5f22fb20497f4983094131f00a734362300d22d2/Documentation/filesystems/spufs/spufs.rst
[linux-kconfig]: https://github.com/torvalds/linux/blob/5f22fb20497f4983094131f00a734362300d22d2/arch/powerpc/platforms/ps3/Kconfig
[linux-sndps3]: https://github.com/torvalds/linux/blob/5f22fb20497f4983094131f00a734362300d22d2/sound/ppc/snd_ps3.c
[mesa-radv]: https://docs.mesa3d.org/drivers/radv.html
[mesa-nvk-hw]: https://docs.mesa3d.org/drivers/nvk/hardware_docs.html
[mesa-nvk-ext]: https://docs.mesa3d.org/drivers/nvk/external_hardware_docs.html
[vk-pipelines]: https://docs.vulkan.org/spec/latest/chapters/pipelines.html
[vk-gpl]: https://docs.vulkan.org/features/latest/features/proposals/VK_EXT_graphics_pipeline_library.html
[vk-so]: https://docs.vulkan.org/features/latest/features/proposals/VK_EXT_shader_object.html
[vk-present]: https://docs.vulkan.org/refpages/latest/refpages/source/VkPresentModeKHR.html
[spirv]: https://registry.khronos.org/SPIR-V/specs/unified1/SPIRV.html
[fex]: https://github.com/FEX-Emu/FEX/blob/2005933518d51c15c7ff115522cf3d577a9f1a91/Readme.md
[box64]: https://github.com/ptitSeb/box64/blob/07e9e5c34420b3116913b44e3f38a5c8f6f4e546/README.md
[shadps4]: https://github.com/shadps4-emu/shadPS4/blob/main/README.md
[rpcs3-tests]: https://github.com/RPCS3/ps3autotests/blob/master/README.md
[wp-cell]: https://en.wikipedia.org/w/index.php?oldid=1386170292
[wp-ps3-specs]: https://en.wikipedia.org/w/index.php?oldid=1386319161
[wp-ps3-sys]: https://en.wikipedia.org/w/index.php?oldid=1386319155
[wp-rsx]: https://en.wikipedia.org/w/index.php?oldid=1318869943
[wp-ps4]: https://en.wikipedia.org/w/index.php?oldid=1386319169
[wp-ps4-specs]: https://en.wikipedia.org/w/index.php?oldid=1386319175
[wp-ps4-sys]: https://en.wikipedia.org/w/index.php?oldid=1385538186
[wp-ps5]: https://en.wikipedia.org/w/index.php?oldid=1385515902
[wp-xboxone]: https://en.wikipedia.org/w/index.php?oldid=1386323575
[wp-series]: https://en.wikipedia.org/w/index.php?oldid=1386594308
[wp-xboxsys]: https://en.wikipedia.org/w/index.php?oldid=1386323584
[wp-xboxpad]: https://en.wikipedia.org/w/index.php?oldid=1385359035
[wp-switch]: https://en.wikipedia.org/w/index.php?oldid=1384604421
[wp-switch2]: https://en.wikipedia.org/w/index.php?oldid=1386314413
[wp-switch-sys]: https://en.wikipedia.org/w/index.php?oldid=1381894756
[wp-nso]: https://en.wikipedia.org/w/index.php?oldid=1384839693
[wp-zen2]: https://en.wikipedia.org/w/index.php?oldid=1373859411
[wp-d3d]: https://en.wikipedia.org/w/index.php?oldid=1385070978
[wp-gcn]: https://en.wikipedia.org/w/index.php?oldid=1384947614
[wp-rdna]: https://en.wikipedia.org/w/index.php?oldid=1384343765
[wp-stutter]: https://en.wikipedia.org/w/index.php?oldid=1385431095
[wp-rpcs3]: https://en.wikipedia.org/w/index.php?oldid=1384344878
[wp-shadps4]: https://en.wikipedia.org/w/index.php?oldid=1383492990
[wp-ryujinx]: https://en.wikipedia.org/w/index.php?oldid=1376535915
[wp-yuzu]: https://en.wikipedia.org/w/index.php?oldid=1380070546
