---
title: "Modern consoles and handhelds, including systems on sale today: primer"
roadmap_item: R1-04
status: draft
date: 2026-11-20
---

# Modern consoles and handhelds, including systems on sale today: primer

## Summary

This note asks how the consoles of the modern era work and what that asks of an emulator,
using the systems the roadmap's era rule places here: the PlayStation 3, 4, and 5, the Xbox One and Xbox Series,
and the Nintendo Switch and Switch 2.
In this era a game is a user process of a full operating system,
so the interface an emulator must reproduce is mostly the operating system's and its libraries',
not the chips' registers (inference).
The guest processors are general-purpose architectures
(64-bit PowerPC with the Cell's SPUs, x86-64, and 64-bit Arm),
so a host of the same architecture can run much guest code directly,
and the PlayStation 3 needs translation on every host (inference).
Console games can ship pre-compiled shaders
(Wikipedia, Micro stuttering, secondary),
which an emulator must translate for the host GPU, so shader translation
and its compilation stutter are central costs (inference).
Switch game containers are encrypted
(SwitchBrew, NCA); that the other systems' retail games are encrypted and signed is from memory.
The legal side is in `R0-02` and is not repeated here.
This note is not legal advice.

## Scope

- Question: how do the consoles of the modern era work, and what does that ask of an emulator?
- Covered: processors, memory and storage, graphics, audio, operating systems and services, timing, threading and input,
  and online services, for the Switch and Switch 2 (`R1-14`), PlayStation 3, 4, and 5 (`R1-21`),
  and Xbox One and Xbox Series (`R1-23`).
  By the roadmap's era rule (pull request #22), the Xbox 360, of the seventh generation,
  is placed in `R1-03` with the Wii, and the PS3 here because `R1-21` depends on no other primer;
  that split is the roadmap's grouping, not a hardware rule.
  The roadmap gives the listing of every console and handheld of the era to the catalogue, `R1-08`;
  PC and Android handhelds, microconsoles, and FPGA devices are emulator hosts, left to `R3-07` and `R3-12`.
- Left to other items: the law on encryption, firmware, keys, and takedowns
  (`R0-02`, cited by section name);
  each family's emulators (`R1-14`, `R1-21`, `R1-23`); host platforms (phase 3); techniques in depth (phase 2).
- Researched on 2026-11-20, when Wikipedia recorded no end of sales for the Switch 2, PlayStation 5, or Xbox Series,
  Nintendo's plan to end Switch sales in Europe in February 2027, the PS4 discontinued only in Japan (2024),
  and the Xbox One discontinued in 2020 (Wikipedia, each system's article, secondary).
  Each claim about a system on sale is dated by the revision of the page it rests on.
- How claims were checked: research agents fetched every source on 2026-11-20
  (wiki pages through `action=raw`, PDFs through `pdftotext`, repository files at a pinned commit where shown);
  the Hot Chips 25 slides are mostly images, and the patent was read by OCR.
  Two independent verification passes followed, each of nine verifiers who saw only this note:
  each fetched the sources again the same day and tested each claim and quotation.
  Each correction was checked against the source once more before it was applied;
  claims the passes could not check are weakened, marked, or listed in the pull request.
  A claim marked "(secondary)" rests on Wikipedia or another summary of other sources,
  "(from memory)" on no page fetched for the note, "(inference)" on the author's reasoning,
  "(research log)" on an event while gathering the evidence,
  and "(observed)" on what the author saw in a page or image and did not quote.
- What was opened: maker documents and talks, community wikis' technical pages, Wikipedia, and walled emulators' prose.
  No emulator source code, key, fuse, exploit, firmware, title-list, or game page was opened on purpose.
  Code read outside emulators, header constants of `libnx`
  (open tier) and part of a Linux sound driver, is named where used.

## Findings

### What changed in this era

- Software here reaches hardware mostly through kernel calls and system libraries or services:
  Sony's PS3 Linux documents describe a hypervisor that virtualises "Most devices and system resources" for Linux
  as the guest, which reaches some, such as USB host controllers, directly;
  psdevwiki records that PS4 system calls are "mostly called by" a kernel library that exports wrappers to applications,
  and SwitchBrew describes Switch services reached by inter-process messages
  (Sony, Linux Kernel Overview; psdevwiki PS4, Syscalls; SwitchBrew, Services API).
  That games rarely write device registers, and that the emulator's main interface is therefore the operating system's,
  is inference from these.
- The makers update that interface over the life of the console.
  SwitchBrew marks services and calls with the system version that added or changed them,
  and psdevwiki marks PS4 system calls by firmware interval (SwitchBrew, Services API; psdevwiki PS4, Syscalls).
  A high-level emulation (HLE) of that interface has to know which version a game was built for (inference).
- The makers themselves keep old games running by emulation, compatibility layers, or hardware built to match.
  The Xbox One runs selected Xbox 360 games through software emulation,
  with hardware support for the 360's XMA audio and texture processing
  (Wikipedia, Xbox One, secondary);
  the PS5's compatibility rests in part on "extra logic" in its GPU,
  and on a CPU whose timings were brought closer to the PS4's
  (Wikipedia, PlayStation 5, secondary);
  and the Switch 2 hooks selected library functions inside Switch games (SwitchBrew, Switch 2: Compatibility Mode).
  These are precedents for each approach the options below describe (inference).

### Processors

#### The Cell in the PlayStation 3

- The Cell has one Power Processor Element (PPE) for control and eight Synergistic Processor Elements (SPEs)
  for data-intensive work, joined by the Element Interconnect Bus; Sony, Toshiba, and IBM began it in 2000
  (Gschwind et al., Hot Chips 17, slides 2 and 5; Sony, Cell Programming Primer, sections 1.1.2 and 1.2.1).
  An emulator therefore needs two unrelated instruction-set front ends in one guest (inference).
- The PPE implements 64-bit PowerPC with the VMX vector extension,
  with 32 KiB instruction and 32 KiB data caches and a 512 KiB L2
  (Gschwind et al., slide 5; Sony, Cell Programming Primer, section 1.2.2).
  It runs two hardware threads (Wikipedia, Cell (processor), secondary; psdevwiki PS3, CELL BE).
- Each SPU has one register file of 128 registers of 128 bits, used for every data type
  (Gschwind et al., slides 8 and 11).
  A 32-bit scalar or address sits in bytes 0 to 3, the "preferred slot"; a byte sits in byte 3,
  a 16-bit value in bytes 2 and 3, and a 64-bit value in bytes 0 to 7
  (Gschwind et al., slides 12 and 13; Sony, Cell Programming Primer, section 4.5.1);
  bytes are numbered in big-endian order (Sony, Cell Programming Primer, section 2.2.2).
  128 guest vector registers exceed the vector register files of x86-64 and AArch64 hosts
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
  The exact deviations are in IBM's SPU instruction-set document, which could not be read:
  IBM's own links now return HTTP 404, and the surviving copies are on third-party hosts (research log).
- All SPU code runs at one privilege level, and the SPE shares the PPE's address translation and protection
  (Gschwind et al., slides 7 and 23), so addresses in SPU DMA commands go through the guest's page tables (inference).
- In the PlayStation 3 seven of the eight SPEs work, for manufacturing yield, and one of the seven is reserved:
  Wikipedia says by the operating system, psdevwiki says by the hypervisor
  (Wikipedia, Cell (processor), secondary; psdevwiki PS3, CELL BE).
  Six SPU threads and the PPE's two threads must run together on the host (inference).

#### The SPE's DMA engine and messaging

- A PPE program loads an SPE program into local store and starts it;
  the SPE program fetches data from main memory by DMA, computes, writes results back, and signals the PPE
  (Sony, Cell Programming Primer, section 1.3.3).
  An SPE thread's saved context includes its registers, local store,
  and outstanding DMA requests in Toshiba's programming model (Sakai et al., Hot Chips 17, slide 5).
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
  (Sony, Cell Programming Primer, sections 4.1.1 and 4.1.2; Linux, `spufs.rst`).
  Blocking channel reads are where an emulator can park or switch SPU threads (inference).

#### x86-64 in the PlayStation 4 and 5 and the Xbox One and Series

- The PS4 (2013) and Xbox One (2013) use two modules of four AMD Jaguar cores each: 1.6 GHz on the PS4,
  a figure tagged "citation needed" (2.13 GHz on the PS4 Pro), and 1.75 GHz on the Xbox One;
  the Xbox One X has an eight-core CPU at 2.3 GHz, a custom design compatible with Jaguar
  (Wikipedia, PlayStation 4 technical specifications and Xbox One, secondary).
  Jaguar is AMD's Family 16h (from memory); AMD's guide for those parts gives a 40-bit physical address space
  (AMD, BIOS and Kernel Developer's Guide 48751, section 2.4.5).
  Whether the console parts keep that limit is not stated in any source read.
- The PS5 (2020) and Xbox Series (2020) use eight AMD Zen 2 cores: up to 3.5 GHz on the PS5
  (3.85 GHz on the PS5 Pro),
  3.8 GHz on the Series X (3.66 GHz with simultaneous multithreading), and 3.6 GHz on the Series S (3.4 GHz with it)
  (Wikipedia, PlayStation 5 and Xbox Series X and Series S, secondary; on sale as of 2026-11-20).
  Zen 2 supports AVX2 and FMA3 (Wikipedia, Zen 2, secondary), which Jaguar lacks
  (from memory), so a host lacking them must translate them (inference).
- Games do not get every core. psdevwiki says six of the PS4's eight cores are available to applications
  (psdevwiki PS4, APU),
  while Wikipedia says seven, citing a 2015 Eurogamer article on Sony unlocking more CPU power for developers
  (Wikipedia, PlayStation 4, secondary), so the figures can differ by firmware (inference).
  Wikipedia says one Xbox Series X core is dedicated to the operating system
  (Wikipedia, Xbox Series X and Series S, secondary).
  No source read gives the PS5's figure.
- By the research agent's reading of its README, shadPS4, a walled PS4 emulator,
  runs the x64 code of PS4 binaries natively and needs some PS4 system modules dumped from the user's console
  (shadPS4 README; neither verification pass could re-check it).
  Running guest code directly on an x86-64 host leaves the emulator to intercept system and library calls
  and to fit the guest's address layout into the host's (inference).

#### Arm in the Switch and Switch 2

- The Switch uses Nvidia's Tegra X1 (the X1+ from August 2019 and in the Lite and OLED models);
  games use the four Cortex-A57 cores, one of which is reserved for the operating system,
  and the chip's four Cortex-A53 cores are not used (Wikipedia, Nintendo Switch, secondary; on sale as of 2026-11-20).
  The CPU normally runs at 1.02 GHz; an update of April 2019 lets certain games boost it to 1.785 GHz,
  used mainly during loading (same).
- Arm's manual describes the Cortex-A57 as an out-of-order ARMv8-A core with 48 KiB instruction
  and 32 KiB data L1 caches, supporting AArch32 and AArch64 at every exception level
  (Arm, Cortex-A57 TRM, DDI 0488 issue H, "Features" and "Compliance").
  A Switch program's metadata has a flag for 64-bit instructions
  and an address-space field whose values include 32-bit layouts
  (SwitchBrew, NPDM),
  so an emulator needs both 64-bit and 32-bit Arm front ends if any game is a 32-bit process (inference).
- The Switch 2 (2025; Wikipedia, Nintendo Switch 2, secondary) uses Nvidia's T239:
  eight Cortex-A78C cores and a 1,536-core Ampere GPU,
  built to Nintendo's specification and sharing many aspects with the T234 of Nvidia's Orin products,
  by SwitchBrew's account, which states no origin for its figures
  (SwitchBrew, Switch 2: Tegra T239; on sale as of 2026-11-20).
  Arm's guide gives the A78C's architecture as Armv8-A with the Armv8.1-A and Armv8.2-A extensions
  and selected later features: pointer authentication and LDAPR from Armv8.3-A,
  dot product and multi-OS support from Armv8.4-A,
  and enhanced pointer authentication from Armv8.6-A without the optional FPAC
  (Arm, Cortex-A78C Software Optimization Guide, section 2).
  A host without pointer authentication runs the forms encoded as hints as no-ops and must emulate the others
  (from memory).
- The same guide gives timings for A32 and T32 as well as A64 instructions
  (section 3.1), so the A78C runs 32-bit code (inference); at which exception levels was not found in a maker source.

#### Translation between host and guest architectures

- Built for this note from the findings above (the host columns are inference):

| System | Guest code | On an x86-64 host | On an Arm64 host |
|---|---|---|---|
| PlayStation 3 | PowerPC with VMX, and SPU | translate both | translate both |
| PlayStation 4, Xbox One | x86-64 (Jaguar) | run directly, translating missing extensions | translate |
| PlayStation 5, Xbox Series | x86-64 (Zen 2) | run directly, translating missing extensions | translate |
| Switch | A64, and AArch32 if a game uses it (Cortex-A57) | translate | run directly |
| Switch 2 | A64, and AArch32 if a game uses it (Cortex-A78C) | translate | run directly, with pointer authentication |

- FEX runs x86 Linux programs on ARM64 Linux, has an experimental code cache,
  and lets the user skip what its README calls "costly memory model emulation" per application (FEX README).
  Box64 runs x86-64 Linux programs on Arm and other hosts with a dynamic recompiler,
  keeping translated code on disk by default
  (Box64 README).
  x86's stronger memory ordering must be enforced, or relaxed per game, on an Arm host,
  and a persistent cache answers first-run stutter (inference).

### Memory and storage

- The PS3 has two pools: 256 MiB of XDR as main memory, and 256 MiB of GDDR3 attached to the RSX GPU
  (Wikipedia, PlayStation 3 technical specifications, secondary; psdevwiki PS3, RAM).
  Main memory and an SPU's local store are separate address spaces, and a DMA command names one address in each
  (Sony, Cell Programming Primer, section 3.3.2).
- The RSX can access up to 224 MiB of main memory (Wikipedia, RSX Reality Synthesizer, secondary).
  Wikipedia and psdevwiki give one nearly identical table of rates,
  of unstated origin and measured with the RSX and GDDR3 above their shipped clocks,
  with the Cell reading GDDR3 at about 16 MB/s; they count as one source
  (Wikipedia, RSX Reality Synthesizer, secondary; psdevwiki PS3, RSX).
  Games avoid that slow path, so an emulator need not model its cost but must allow both directions (inference).
- Sony's documents say Linux on the PS3 runs on top of the hypervisor,
  and that "no direct access by guest OSes to the GPU is allowed currently";
  the frame buffer was in main memory and copied to the GPU by DMA through hypervisor calls
  (Sony, Linux Kernel Overview, "Graphics/Video"; Sony, Application Programming Environment).
- The PS4 has 8 GiB of GDDR5 at 176 GB/s shared by CPU and GPU, with no separate video memory
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  The PS4 Pro adds 1 GiB of DDR3 so that background applications can be moved out,
  giving games 5.5 GiB in place of 5 GiB (same).
  The memory a game sees therefore depends on the model (inference).
- The Xbox One has 8 GiB of DDR3 plus 32 MiB of on-chip ESRAM;
  Wikipedia's prose and its table give different ESRAM bandwidths (Wikipedia, Xbox One, secondary).
  Games were reported to get 5 GiB of the 8, and the Xbox One X has 12 GiB of GDDR5 with 9 GiB for games;
  its column of the table lists no ESRAM (same).
  Neither the Wikipedia articles cited nor Microsoft's Hot Chips 25 slides say how games place data in ESRAM
  or how the One X runs games designed for it.
- The Xbox One and Series run a modified Hyper-V hypervisor with an "Exclusive" partition for games and a "Shared" one
  for apps, including the operating system (Wikipedia, Xbox system software, secondary).
  Microsoft's Hot Chips 25 slides show host-guest memory-management units for the GPU and for input and output,
  with page tables kept in step with the CPU's (Sell and O'Connor, Hot Chips 25, slides 4 and 6 to 8; observed).
  A game therefore sees a guest-physical address space inside a virtual machine (inference).
- The PS5 has 16 GiB of GDDR6 at 448 GB/s shared by CPU and GPU, and 512 MiB of DDR4 used as the SSD controller's cache;
  the SSD reads 5.5 GB/s raw, and a hardware unit decompresses zlib and Oodle Kraken
  (Wikipedia, PlayStation 5, secondary; psdevwiki PS5, Hardware; on sale as of 2026-11-20).
  PS5 games must run from internal or M.2 storage (Wikipedia, PlayStation 5, secondary).
- The Xbox Series X has 16 GiB of GDDR6 at two speeds, 10 GiB at 560 GB/s and 6 GiB at 336 GB/s,
  "with the system software only drawing from the slower pool";
  its storage block decompresses zlib and a proprietary BCPack algorithm for game textures
  (Wikipedia, Xbox Series X and Series S, secondary; on sale as of 2026-11-20).
  The register, `R0-05`, and the Wikipedia articles cited give no public specification of Kraken or BCPack.
- The Switch has 4 GiB of LPDDR4, LPDDR4X in the X1+ models
  (SwitchBrew, Hardware; Wikipedia, Nintendo Switch, secondary);
  that CPU and GPU share it is inference from the GPU mapping process memory (SwitchBrew, GPU).
  User address spaces are 32 or 36 bits, and 38 from system version 2.0.0, by one page
  (SwitchBrew, Memory layout);
  a later page names the larger layout 39-bit and adds a 42-bit one from 23.0.0 (SwitchBrew, NPDM).
- The Switch kernel sets a heap size only in multiples of 2 MiB (SwitchBrew, SVC, heap call).
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
  each open of that device creates a separate GPU address space (SwitchBrew, GPU; NV services).
  CPU and GPU addresses are translated separately over one pool (inference).
- The Switch 2 has 12 GiB of LPDDR5X; SwitchBrew gives 120 GB/s, Wikipedia about 102 GB/s docked and 68 GB/s handheld
  (SwitchBrew, Switch 2: Tegra T239; Wikipedia, Nintendo Switch 2, secondary; on sale as of 2026-11-20).
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
  (Wikipedia, RSX Reality Synthesizer, secondary, a page tagged "original research"; psdevwiki PS3, RSX).
  Vertex and fragment programs need separate translation paths to a host's unified shaders (inference).
- psdevwiki says developers prefer a library that builds GPU command buffers directly,
  and that "hardly anyone uses PSGL these days", the OpenGL ES layer built on top of it
  (psdevwiki PS3, RSX, "RSX Libraries").
  A PS3 emulator therefore works at the level of GPU commands (inference).
- Sony's documents describe only the Linux frame-buffer path, not the 3D engine
  (Sony, Linux Kernel Overview), so 3D behaviour must come from community references (inference).
  No open description of the RSX command methods or shader encodings was read.

#### AMD GPUs in the PlayStation 4 and 5 and the Xbox One and Series

- The PS4 GPU is AMD Graphics Core Next (GCN) with 18 compute units at 800 MHz;
  Wikipedia places it on the second generation of GCN, with a "better source needed" mark
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  The PS4 Pro has 36 compute units and faster 16-bit floating point from AMD's Vega design (same);
  from system software 4.5 a "Boost Mode" raises clocks for games not patched for it
  (Wikipedia, PlayStation 4, secondary).
- Wikipedia lists three PS4 differences from PC cards of the first GCN generation:
  a bus that lets the GPU bypass its caches, a tag on L2 lines for mixed graphics and compute work,
  and "An upgrade from 2 to 64 sources for compute commands"
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  Guest compute and graphics writes to shared memory must be ordered as the hardware orders them (inference).
- PS4 games use two Sony APIs, GNM and the higher-level GNMX, and a shader language close to HLSL
  (Wikipedia, PlayStation 4 system software, secondary);
  the PS5 is programmed through a Sony API named AGC (Wikipedia, PlayStation 5, secondary).
  The register and `R0-05` hold no detailed public description of either;
  the PS4 system-software article outlines GNM and cites a 2013 Sony Europe developer talk that was not read.
  Both compile to command packets and GPU shader binaries, which is what an emulator sees (inference).
- GCN runs threads in waves of 64; RDNA, used in the PS5 and Xbox Series,
  runs waves of 32 natively and also supports 64,
  and keeps aspects of GCN so those consoles run their GCN games natively
  (Wikipedia, Graphics Core Next and RDNA (microarchitecture), secondary).
  A host without 64-wide waves must emulate their wave operations (inference).
  The third generation of GCN is binary-incompatible with earlier ones
  (Wikipedia, Graphics Core Next, secondary),
  so even an AMD host cannot be assumed to run PS4 shader binaries unchanged (inference).
- The PS5 GPU is a custom RDNA 2 part with 36 compute units at up to 2.23 GHz and hardware ray tracing,
  with a variable clock; the PS5 Pro (2024) has 60 compute units and a machine-learning upscaler
  (Wikipedia, PlayStation 5, secondary; on sale as of 2026-11-20).
  A Pro model would need an equivalent upscaler or a substitute (inference).
- The Xbox One GPU is GCN with 12 compute units at 853 MHz;
  the Series X has 52 compute units of RDNA 2 at a fixed 1.825 GHz
  (Wikipedia, Xbox One and Xbox Series X and Series S, secondary).
  The Xbox One is programmed through Direct3D 11.X, a superset of DirectX 11.2 (Wikipedia, Direct3D, secondary).
- On AMD GPUs the CPU writes command packets into ring buffers that a command processor reads,
  following pointers into indirect buffers
  (Linux, amdgpu documentation, `gc/index.rst` and `ring-buffer.rst`, at a pinned commit).
  Mesa's documentation says the graphics and asynchronous compute queues use the PM4 packet format,
  while the copy and video queues have their own formats (Mesa, RADV, "Command submission and PM4 packets").
  These are PC driver documents; that the console GPUs follow them is inference from their lineage.
- A pipe runs only one queue at a time, switching between mapped queues
  (Linux, amdgpu documentation, `driver-core.rst`).
  Asynchronous compute is concurrency between pipes,
  and an emulator needs ordering between queues only where the guest synchronises (inference).
- Sony patent US 10,275,239 describes recording a legacy game's performance
  and tuning the new system's operating parameters, such as GPU clocks and wavefront slots, until key metrics are met
  (US 10,275,239 B2, abstract and description, read by OCR; its claims were not analysed, under `R0-02`, "Patents,
  recorded as risks").
  The maker treats GPU timing as something old games can depend on (inference).

#### Nvidia GPUs in the Switch and Switch 2

- The Switch's Maxwell GPU has 256 cores, clocked at 768 MHz docked and 307.2 to 460 MHz in handheld mode
  (Wikipedia, Nintendo Switch, secondary).
  The system software reports it to programs as implementation GM20B or GM20B_B,
  with SM version 5.0.3 and 3D class `0xB197`
  (SwitchBrew, NV services, GPU characteristics); an emulator returns such values (inference).
- Programs submit lists of entries pointing to command lists, which Nvidia's command engine routes to the 3D, compute,
  2D, inline-to-memory, and copy engines (SwitchBrew, GPU; GPU Classes).
  The 3D engine also runs small macro programs uploaded by the game to write its registers,
  so an emulator must run the macro language before it can see the state a draw uses
  (SwitchBrew, GPU, "Macro"; the second half is inference).
- Fences are counter values the GPU writes to memory, and the CPU waits until a value is reached
  (SwitchBrew, GPU, "Fences").
  Those values are the points where an emulator's GPU must be exact; elsewhere it can run asynchronously (inference).
- Maxwell shaders start with a header of `0x50` bytes, and every fourth 64-bit instruction is a scheduling instruction
  (SwitchBrew, GPU Shaders).
  SwitchBrew's GPU pages rest on Nouveau's work, envytools, Nvidia's disassembler,
  and observation of a game's command stream, and cite Nvidia's published shader-header document for the header
  (SwitchBrew, GPU, "References"; GPU Shaders, "Header" and "Analysis Tools").
- Mesa's NVK documentation says a switch between engines in one channel idles the whole channel
  (Mesa, NVK, "Hardware docs", "Subchannel switches"),
  and says that "Red Hat has some NDA'd documentation on instruction latencies from NVIDIA"
  (Mesa, NVK, "External Hardware Documentation and Resources").
  Parts of Mesa's Nvidia compiler may
  therefore rest on confidential maker data; this note uses only Mesa's prose (inference).
- The Switch 2 GPU reports Ampere 3D class `0xC797` and keeps two older Nvidia classes
  (SwitchBrew, NV services, Switch 2 structure), so much of a Switch GPU front end carries over (inference).
  Its GPU runs at 1,007 MHz docked and 561 MHz handheld (Wikipedia, Nintendo Switch 2, secondary).

#### Shader translation and compilation stutter

- SPIR-V, the intermediate language Vulkan takes, is a binary form
  (Khronos, SPIR-V Specification 1.6, revision 8, "Goals")
  that can declare structured control flow
  (same, section 2.11);
  that Vulkan requires it is from memory;
  guest shader binaries for every GPU here must be lifted into structured control flow to produce it (inference).
- Wikipedia says that "On consoles, developers can pre-compile all shaders for the known, fixed hardware",
  while PCs compile at run time and stutter, which is mitigated by recording pipeline variants, background compilation,
  and distributing compiled shaders (Wikipedia, Micro stuttering, "Shader compilation", secondary).
- Khronos's pipeline-library proposal states that, for many engines,
  requiring most of the state up front "either fails to eliminate hitching" or needs an unmanageable pipeline cache
  (Khronos, VK_EXT_graphics_pipeline_library proposal, "Problem Statement");
  a later proposal binds shaders without pipeline objects (Khronos, VK_EXT_shader_object proposal).
  An emulator learns guest state only at draw time, the case these extensions address (inference).

### Audio

- Sony's documents say the PS3 front end "reads(DMAs) PCM data into its buffer" and plays it at a set clock and format,
  with no decoder for compressed audio and no volume control;
  the back end is controlled by an AV setting driver that sits behind the hypervisor
  and is reached over a virtual serial port, and has base clock generators for 44.1 kHz and 48 kHz
  (Sony, Linux Kernel Overview, "Audio").
  The Linux driver advertises stereo 16- or 24-bit big-endian samples at 44.1, 48, 88.2, or 96 kHz
  (Linux, `snd_ps3.c`; this description was written after reading part of that driver).
  Everything else a PS3 game plays is computed on the Cell (inference).
- Wikipedia says the PS4 has a dedicated audio module and a DSP that is identical or similar to AMD TrueAudio
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  Sony's PS4 open-source page lists FLAC, libvorbis, and Opus among its components
  (Sony, PS4 open-source page; observed).
- Wikipedia describes the PS5's Tempest engine as supporting "hundreds of simultaneous sound sources,
  compared to 50 on the PlayStation 4" (Wikipedia, PlayStation 5, secondary).
  No registered source describes Tempest's design; that it is a modified GPU compute unit is from memory.
- Wikipedia says both Xbox Series models support spatial audio,
  and that "audio ray tracing" uses the graphics ray-tracing processors for it
  (Wikipedia, Xbox Series X and Series S, secondary); no source read describes the Series audio hardware.
- Microsoft's Hot Chips 25 slides show the Xbox One's audio as four DSP cores beside a shared memory,
  plus fixed-function blocks for sample-rate conversion, DMA, an Xbox Media Audio decoder, equalisation and compression,
  and filtering (Sell and O'Connor, Hot Chips 25, slide 7; observed).
  The slide gives the cores' roles (control, scalar, and two 128-bit SIMD vector cores) and cache sizes,
  but no source read names their instruction set,
  so emulating Microsoft's audio interfaces at high level is the only path visible in the sources read (inference).
- On the Switch, a game either plays buffers through an audio output service at 48 kHz or uses the audio renderer,
  which takes the game's state updates and generates command lists for the audio DSP
  (SwitchBrew, Audio services; `libnx` header `audout.h`).
  The renderer runs in fixed 5 ms frames of 240 samples at 48 kHz
  (`libnx` header `audren.h`; constants read in a homebrew library's header).
- The renderer's parameter format is versioned by a revision value the game supplies,
  with new values added in system versions 1.0.0 to 23.0.0, each enabling features or fixes
  (SwitchBrew, Audio services, "BehaviorInfo Revision").
  An emulated renderer behaves as the revision a game asks for (inference).
- SwitchBrew describes the hardware Opus decoder as libopus running on the DSP
  (SwitchBrew, Audio services, "hwopus"), so a host libopus can be expected to give matching output (inference).
- Low-level emulation of the Switch audio DSP would need Nintendo's DSP firmware (inference),
  which SwitchBrew says was overhauled on the Switch 2 to run Nintendo's own kernel
  (SwitchBrew, Audio services, "Notes"); the project does not obtain firmware (ADR 0001, "Context").

### Operating systems, services, and security

#### PlayStation 3

- Sony's documents describe a guest operating system running on a hypervisor that virtualises most devices: storage,
  network, audio set-up, and the clock are reached by hypervisor calls; storage calls are mostly asynchronous,
  completing by virtual interrupt; and "The RTC value can be read by a hypervisor call, but it can not be written"
  (Sony, Linux Kernel Overview, "Storage", "Giga Bit Ethernet", "Audio", "Real Time Clock").
  The Linux kernel's help text names the platform as "the PS3 hypervisor" and its LV1 level
  (Linux, `arch/powerpc/platforms/ps3/Kconfig`).
  An emulator that runs the game kernel (LV2) must provide LV1's calls;
  one that emulates LV2 at high level never needs LV1 (inference).
- psdevwiki lists the LV2 system calls in numbered groups: processes, PPU threads, timers and synchronisation,
  SPU threads, virtual memory, module loading, storage, the RSX, network, file system, and debugging,
  each marked by the firmware kinds that have it and by the rights it needs (psdevwiki PS3, LV2 Functions and Syscalls).
  Only the retail, unprivileged subset matters to games (inference).
- PS3 libraries use the PRX module format, inherited from the PSP
  (psdevwiki PS3, PRX), with imports and exports in tables of identifiers (same, structure fields; observed).
  A game imports system-library functions that ship in the console's firmware,
  so an emulator must supply them itself or load Sony's modules (inference).
- RPCS3 needs the PS3 firmware, which Wikipedia says "can be downloaded from Sony's official website"
  (Wikipedia, RPCS3, secondary).
  This matches `R0-02` option 6, "Point users to firmware the maker publishes".
- The PS3 shipped with "OtherOS", which booted Linux under the same hypervisor; Sony removed it in system software 3.21
  (Wikipedia, PlayStation 3 system software, secondary),
  and the README beside Sony's kit says it is not available on the CECH-2000 series or later (Levand, PS3-Linux README).
  OtherOS is why maker-published hypervisor documentation exists for the PS3 and for no later console (inference).

#### PlayStation 4 and 5

- The PS4's Orbis OS is based on FreeBSD 9; Sony's open-source page lists a FreeBSD kernel among PS4 components
  (Wikipedia, PlayStation 4 system software, secondary; Sony, PS4 open-source page; observed).
  psdevwiki says PS4 system calls follow FreeBSD numbering with some disabled and Sony's own calls added from 99 and
  after FreeBSD 9.1's last, 531, and that "the last custom Sony syscall ID is 677 (as of FW 6.51)"
  (psdevwiki PS4, Syscalls).
  Much of the kernel interface is documented FreeBSD behaviour (inference).
- Games reach the kernel mostly through a system library that also provides threads, event queues, memory allocation,
  and the dynamic linker (psdevwiki PS4, Syscalls; OpenOrbis, "Libkernel"),
  so the natural HLE boundary is the system-library interface (inference).
- PS4 executables are a modified ELF with Sony program-header types and a dedicated dynamic-linking segment,
  by the OpenOrbis toolchain's reverse-engineered documents (OpenOrbis, "PS4 ELF Specification", at a pinned commit).
  Imports name functions by a short hash of the name rather than by name;
  the toolchain's authors write that "It is believed the primary purpose of using NIDs was to obfuscate symbol names"
  (OpenOrbis, "Dynlib Data").
  An HLE needs a table from those identifiers to its own functions (inference).
- That retail PS4 executables ship in a signed, encrypted wrapper is from memory; `R0-02`, "Firmware, keys,
  and game copies", applies.
  OpenOrbis builds homebrew as "fake SELF files", "without the need of Sony's official Software Development Kit"
  (OpenOrbis README), the only PS4 test software an emulator project can run without decryption (inference).
- psdevwiki says the PS5 kernel is based on FreeBSD 11.0 and carries three executable types,
  one of them for PS4 programs (psdevwiki PS5, Kernel).
  For system software 2.70 and earlier it describes a small hypervisor that protects the kernel
  and "does not run multiple VMs" (psdevwiki PS5, Hypervisor); a game never calls it (inference).

#### Switch and Switch 2

- Horizon is a proprietary microkernel derived from the 3DS's, with every driver in user space,
  including Nvidia's GPU driver (Wikipedia, Nintendo Switch system software, secondary).
  SwitchBrew's table lists 124 kernel call numbers for the Switch, some reused across versions,
  and 7 more for the Switch 2 only (SwitchBrew, SVC, counted).
- A process gets a service by asking a service manager for it by name,
  and requests travel in Horizon's own message format with copied and moved handles and buffer descriptors
  (SwitchBrew, Services API; HIPC).
  SwitchBrew lists 446 service names, 354 on the Switch and 347 on the Switch 2,
  counted on revision 15412 of 2026-11-02, including names retired in later versions
  (SwitchBrew, Services API; counted locally).
  HLE of Horizon means answering each service a game opens, over a large, versioned set (inference).
- SwitchBrew lists `sdk` and `subsdk` modules that titles may carry beside `main`
  (SwitchBrew, ExeFS)
  and calls them the game's SDK code (Switch 2: Compatibility Mode, "Hooking"),
  so an emulator runs the SDK as guest code and emulates the services below it, unlike the PS3 and PS4 (inference).
- Each program carries metadata declaring its address space, main thread, permitted kernel calls,
  and permitted services, with a signed part (SwitchBrew, NPDM).
  Executables are segments with hashes, optionally compressed
  (SwitchBrew, NSO0),
  inside containers that SwitchBrew says are "encrypted", the only known exception being an optional logo section,
  with a key generation that rises with system versions (SwitchBrew, NCA).
  A newer game needs keys from a newer system version (inference); `R0-02`,
  "Anti-circumvention law in the United States", records that every § 1201 complaint, judgment,
  and notice found against a console emulator concerns the Switch.
- A secure monitor in Arm TrustZone offers cryptographic functions; user-mode processes reach it through a kernel call
  (SwitchBrew, Secure Monitor).
  An HLE answers the services above it and never models TrustZone (inference).
- Switch 2 system versions ran from 19.0.0 before launch to 23.5.0 of 10 November 2026,
  with 16 dated releases from June 2025
  (SwitchBrew, Switch 2: System Versions, counted; as of 2026-11-20),
  so an HLE of a system on sale targets an interface that changes about monthly (inference).
- In Switch 2 compatibility mode, three modules mapped into a Switch game override selected SDK functions,
  with per-game patches, while "most sdk codebin symbols remain unchanged and execute their original code"
  (SwitchBrew, Switch 2: Compatibility Mode, "Hooking").
  The maker's compatibility is a hybrid: hooks at the library boundary over its own system software (inference).

#### Xbox One and Series

- The system software is based on Windows NT and runs on Hyper-V;
  it was based on a Windows 8 core at launch and on a Windows 10 core from November 2015
  (Wikipedia, Xbox system software, secondary).
  The article does not say which partition each change describes.
- No open-tier description of the game partition's interface, its executable or package format,
  or its encryption was found.
  Searched: the register and `R0-05` (no hub), the Wikipedia articles listed in the Sources,
  and one web search on Xbox security talks;
  the one candidate community wiki is unregistered and was blocked by the guard (research log).

### Timing, threading, and input

- The Switch kernel's thread call accepts processor ids 0 to 3, or -2 for the process's default core, and a sleep of 0,
  -1, or -2 nanoseconds selects one of three kinds of yield (SwitchBrew, SVC).
- On the Switch 2, a Switch game's process is given cores 0 to 5 (`0x3F`),
  but the compatibility layer reports only three, "effectively pretending that there are only 3 CPU cores available"
  (SwitchBrew, Switch 2: Compatibility Mode).
- SwitchBrew lists kernel calls that arbitrate a lock at a guest address and wait on or signal a process-wide key,
  and from 4.0.0 a general wait-on-address
  (SwitchBrew, SVC); that these serve as mutexes and condition variables is inference from their names.
  The GPU driver service offers calls to read, increment, and wait on a syncpoint,
  and a GPU submission returns a fence for others to wait on
  (SwitchBrew, NV services); that CPU and GPU synchronise through these is inference.
  An HLE must keep these semantics, including timeouts and cancellation (inference).
- The PS3's game kernel offers threads, mutexes, lightweight mutexes, condition variables, reader-writer locks,
  semaphores, event flags, and event queues
  (psdevwiki PS3, LV2 Functions and Syscalls, group and call names);
  the PS4 adds Sony event flags and semaphores to FreeBSD's calls (psdevwiki PS4, Syscalls).
- The Switch's tick counter runs at 19.2 MHz and is read directly by games;
  on the Switch 2 the compatibility layer "Returns 31250000 instead of 19200000" to Switch games
  (SwitchBrew, SVC; Switch 2: Compatibility Mode).
  Because the guest reads it without a kernel call,
  the emulator must keep it consistent with guest progress (inference).
- The Switch's performance service sets clock configurations: the CPU at 1020 MHz
  (1224 MHz in configurations for development units only),
  or 1785 MHz in boost configurations from 7.0.0 that drop the GPU to 76.8 MHz,
  which a power-saving mode from 7.0.0 also does at 1020 MHz; the others run the GPU from 230.4 to 768 MHz,
  two of them only when docked (SwitchBrew, PPC services).
  Games ask for the operation mode (handheld or docked) and the performance mode,
  and can be notified when either changes (SwitchBrew, Applet Manager services).
  An emulator chooses the mode it reports, and a change must arrive as that notification (inference).
- The Switch 2's compatibility layer adds waits and locks for Switch games;
  for two of them SwitchBrew writes "Probably prevents a race condition that only manifests on Switch 2"
  (SwitchBrew, Switch 2: Compatibility Mode, "nnCompatThin").
  Running faster than the original exposes timing bugs, which an emulator on a fast host also meets (inference).
- The Switch 2's screen runs up to 120 Hz with variable refresh
  (Wikipedia, Nintendo Switch 2, secondary; as of 2026-11-20),
  and the PS5 added variable refresh at 1440p in system software 7.00 of 8 March 2023
  (Wikipedia, PlayStation 5, secondary), so an emulator must not assume a fixed 60 Hz (inference).
- Vulkan requires only its FIFO present mode, which waits for vertical blanking
  (Khronos, VkPresentModeKHR);
  a guest waiting on its own vertical-sync event (SwitchBrew, VI services) adds that latency to the host's (inference).
- Attached to the console, a Joy-Con is asked for its state every 15 ms
  (dekuNukem, README);
  over Bluetooth the standard full report is pushed at 60 Hz, or 120 Hz for the Pro Controller
  (dekuNukem, Bluetooth HID notes, "INPUT 0x30");
  at a 15 ms push each report carries three motion samples 5 ms apart (dekuNukem, IMU notes).
  The game-facing input service writes ring buffers in a shared memory block of `0x40000` bytes,
  each entry with a sampling number (SwitchBrew, HID services).
  A host gyroscope must be resampled to that pattern (inference).
- Each trigger of the Xbox Wireless Controller has its own rumble motor
  (Wikipedia, Xbox Wireless Controller, secondary).
  Microsoft publishes a USB protocol for game controllers, the Gaming Input Protocol USB extension,
  revision 1.0 of 16 September 2024 (that it is the Xbox controllers' protocol is from memory),
  under a notice that allows copies made to implement it and grants no patent licence itself
  (Microsoft, MS-GIPUSB, notice; its technical content was not read).

### Online services

- Nintendo Switch Online is required for online play in most games and holds cloud saves,
  which lapse after a six-month grace period (Wikipedia, Nintendo Switch Online, secondary; as of 2026-11-20).
  Switch games also receive server-delivered content through a background delivery cache (SwitchBrew, BCAT services).
  Offline emulation loses multiplayer, cloud saves, and delivered content (inference).
- A third-party client library warns that "Nintendo bans Switch devices that show suspicious behavior"
  (NintendoClients README, commit `d0965c88`);
  Wikipedia, citing Engadget, reports unique identifiers on Switch and Switch 2 game cards against duplicated cards,
  and bans from the online service (Wikipedia, Nintendo Switch 2, secondary).
  An emulator that connects to official servers exposes users to those measures (inference).

### Tests and sources

- The only test suite found for these systems is RPCS3's PS3 repository,
  which compares output with expected output "preferably from a real PS3"
  (RPCS3 ps3autotests README, prose of a walled source).
  None was found for the PS4, PS5, Xbox One, Series, Switch, or Switch 2, in the register or `R0-05` (research log).
- Of the maker material in the Sources, Sony's PS3 Linux documents are under GFDL 1.2;
  IBM's slides say that nothing in them operates "as an express or implied license"
  (Gschwind et al., slide 31),
  and Arm's Cortex-A57 manual carries a notice that forbids reproduction without Arm's written permission
  (Arm, Cortex-A57 TRM, proprietary notice); facts from them are stated in this note's own words.
- The register and `R0-05` list no maker document for the PS4, PS5, or Xbox GPUs beyond Microsoft's slides,
  nor for the Tegra T239.
  AMD's instruction-set manuals for these GPUs now sit on unregistered hosts,
  and Nvidia's GPU documentation repository is unregistered
  (research log); both are proposed for the register in the pull request.
- Community references for these systems are reverse-engineered.
  SwitchBrew states no origin and no rule on leaked material (`R0-05`). psdevwiki's PS4 page on the executable wrapper
  says part of its layout came from a leaked kernel, so nothing else on that page was used, and its PS4 libraries page
  reads like a maker's manual, so it was not used (research log).

## Options and trade-offs

Costs and gains are the author's inference unless a source is named.

### Emulate the operating system at high level, or run the maker's system software

- **What:** answer the game's system calls and library or service requests in the emulator (HLE),
  or emulate the hardware and kernel interface and run the maker's own system modules from a dump (low-level emulation).
- **Costs:** HLE must follow a large interface that changes with versions, service by service;
  low-level emulation needs firmware and keys that `R0-02`, "Firmware, keys, and game copies", treats as unsettled,
  and must model hypervisors and security processors.
- **Gains:** HLE needs no maker code and skips the boot chain and security processors;
  low-level emulation reproduces the maker's behaviour, including its bugs.
- **Used by:** the Switch 2 for Switch games, as a hybrid (inference): its layer overrides selected SDK functions,
  mostly graphics, and the rest of the game's SDK code runs on Nintendo's system software
  (SwitchBrew, Switch 2: Compatibility Mode, "Hooking");
  RPCS3 requires Sony's published PS3 firmware
  (Wikipedia, RPCS3, secondary); shadPS4 loads some system modules from a dump (README; not re-checked).

### Where the high-level boundary sits

- **What:** the kernel's calls (PS3 LV2, Switch kernel calls), the system libraries
  (PS4 and PS5),
  or the services reached by messages (Switch); for the PS3,
  also whether Sony's libraries are emulated or loaded from the published firmware.
- **Costs:** a low boundary means running more guest code and modelling more kernel behaviour;
  a high boundary means reimplementing more of the maker's libraries.
- **Gains:** a low boundary has fewer entry points; a high one runs less guest code and needs no maker modules.
- **Used by:** the evidence places the Switch boundary at services, because games carry their SDK,
  and the PS4's at the libraries (inference).

### How guest code is executed

- **What:** direct execution on a host of the same architecture
  (in-process or in a host virtual machine),
  or dynamic translation, or translation ahead of time of uploaded images (SPU programs).
- **Costs:** direct execution ties each system to one host architecture and must trap or translate missing extensions;
  translation costs speed and needs memory-ordering work from x86 guests on Arm hosts.
- **Gains:** direct execution runs faster than translation; translation runs anywhere.
- **Used by:** shadPS4 (direct, by its README); Ryujinx on Apple silicon
  (host virtual machine; Wikipedia, Ryujinx, secondary);
  FEX and Box64 for x86 programs on Arm hosts (FEX README; Box64 README).

### The Cell's SPUs

- **What:** run SPU threads on host threads with blocking channels, or schedule them cooperatively;
  emulate 128-byte reservations exactly or approximately; perform DMA at once or deferred.
- **Costs:** exact reservations and deferred DMA cost speed; approximation fails games that race.
- **Gains:** exactness follows Sony's documented rules; approximation is simpler.
- **Used by:** RPCS3, whose approach was not found in the RPCS3 prose that could be fetched (research log).

### Shader translation and caching

- **What:** translate guest shader binaries to SPIR-V or another host form at draw time,
  with a persistent cache of translations; use host pipeline libraries or shader objects where available;
  pre-compile from a recorded list; or interpret on the GPU.
- **Costs:** run-time translation stutters on first use; a host pipeline cache is tied to the GPU and driver
  (Khronos, Vulkan specification, "Pipeline Cache"),
  and a translation cache to the emulator's version;
  a GPU-side interpreter for programmable guests is not described by any source read.
- **Gains:** caching removes repeated stutter; pipeline libraries reduce it.
- **Used by:** shadPS4 (a shader recompiler) and yuzu (a shader decompiler), by Wikipedia (secondary).

### Coherence between CPU and GPU memory

- **What:** track which side last wrote each region of unified guest memory, at a page or finer granularity,
  or assume games do not read GPU results back.
- **Costs:** tracking costs copies and faults; assuming fails games that read back.
- **Gains:** tracking is correct; assuming is fast.
- **Used by:** shadPS4 added experimental readbacks, disabled by default, in July 2025 (Wikipedia, ShadPS4, secondary).

### Models, modes, and revisions to present

- **What:** which model's memory budget and GPU configuration to report
  (PS4 or Pro, One or One X, Series X or S, PS5 or Pro),
  which Switch operation and performance mode, and which system-software version.
- **Costs:** each model presented is a configuration to test; a game may behave differently with more memory or speed.
- **Gains:** presenting the stronger model can improve games; presenting the original keeps them as shipped.
- **Used by:** the PS4 Pro's Boost Mode for unpatched games
  (Wikipedia, PlayStation 4, secondary)
  and the Switch 2's per-game compatibility settings (SwitchBrew, Switch 2: Compatibility Mode).

### Audio

- **What:** emulate the audio services and libraries at high level and render on the host, including spatial audio;
  or emulate audio processors with maker firmware.
- **Costs:** HLE must match each renderer revision's behaviour;
  low-level emulation needs firmware the project does not obtain;
  the patent status of audio formats such as AC-3 was not confirmed (`R0-02`, "Patents, recorded as risks").
- **Gains:** HLE is the only route the registered sources support.
- **Used by:** the register lists no open-tier emulator for these systems.

### Online services

- **What:** leave online features out, replace them with the project's own services, or connect to the makers'.
- **Costs:** leaving out loses multiplayer and delivered content;
  replacing carries the server-emulator risk `R0-02` records;
  connecting to Nintendo's servers exposes users to its bans.
- **Gains:** leaving out is simplest and touches no service.
- **Used by:** yuzu replaced Nintendo's BCAT with its own service, later removed as non-functional
  (Wikipedia, Yuzu (emulator), secondary).

## Implications for Rustalgia

- The operating system is the main interface for every system here (inference), so the family surveys `R1-14`, `R1-21`,
  and `R1-23` need to record which boundary each studied emulator chose and how it handles system-software versions.
  This feeds an ADR on high-level against low-level emulation of system software, and `R2-12`.
- The PS3, PS4, PS5, Switch, and Switch 2 have no open-tier emulator, and the Xbox One and Series have no hub
  (register; `R0-05`);
  the surveys will rest on prose, community wikis, the few maker documents, and reader sessions
  for walled emulators (inference).
  This bears on `R6-01`, which weighs each system's risks.
- Guest architecture decides which host runs a system fastest: x86-64 hosts for the Sony and Microsoft systems,
  Arm64 hosts for Nintendo's, and translation everywhere for the PS3 (inference).
  This feeds `R2-01`, `R3-01`, `R4-08`, and the host notes in phase 3.
- Shader translation and caching are central GPU work for every system here (inference).
  This feeds `R2-05` and `R4-05`, and a quality target on first-run stutter in `R6-02`.
- Switch games are encrypted, and the Switch 2's system software changes about monthly
  (inference, as of 2026-11-20); encryption on the other systems is from memory.
  The legal record in `R0-02` and the pace of change both feed `R6-01`.
- Unified memory near host size feeds the host requirements in phase 3 and `R6-02` (inference).

## Open questions

- What does IBM's SPU instruction-set document say about floating point and channels?
  Its copies are on third-party hosts; `R0-05` option 5 decides whether they may be read.
- How many cores and threads does a PS5 or Xbox One game get, and does a primary source confirm the Series X figure?
  Not found; the family surveys.
- How do games place data in the Xbox One's ESRAM, and how does the One X run them?
  Microsoft's Hot Chips 29 slides on the One X, on the registered Hot Chips archive, not yet read.
- What are the Kraken and BCPack formats?
  No public specification was found; `R2-11`.
- At which exception levels does the Cortex-A78C run 32-bit Arm code, and do any Switch games use it?
  Arm's manual, once its feature section is located; `R1-14`.
- What is the Xbox One and Series guest interface?
  No open-tier source was found; `R1-23`.
- What do RPCS3 and shadPS4 emulate at high level and what do they load from firmware?
  Their prose beyond the README, in the family survey.
- May notes print the official software names that SwitchBrew records?
  A decision for the owner: whether the rule on internal names of an implementation
  (`docs/research/README.md`, "Algorithms and pseudo-code") reaches a maker's software names.
- May any part of psdevwiki's PS4 executable-wrapper page be used,
  given its statement that part of its layout came from a leaked kernel?
  A decision for the owner; this note uses nothing from it beyond that statement.
- May a note cite captures of live pages that refuse automated requests, as for psdevwiki?
  A decision for the owner.

## Sources

Every source below was read on 2026-11-20. psdevwiki was read from existing Wayback Machine captures,
because the live site refused automated requests (research log); each capture's time stamp is given.

Maker documents and talks:

- Sony, PS3 Linux Distributor's Starter Kit: Linux Kernel Overview (revision 1.7), Application Programming Environment
  (revision 1.6), and Cell Programming Primer (revision 1.6) chapters 1 to 4, GFDL 1.2; and G.
  Levand's PS3-Linux README of 6 January 2024:
  `https://kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/LinuxKernelOverview.html` and sibling pages,
  `https://kernel.org/pub/linux/kernel/people/geoff/cell/README`.
- M. Gschwind et al., "A Novel SIMD Architecture for the Cell Heterogeneous Chip-Multiprocessor", Hot Chips 17 (2005):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T1.pdf`.
- R. Sakai et al., "Programming and Performance Evaluation of the Cell Processor", Hot Chips 17:
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T4.pdf`.
- J. Sell and P.
  O'Connor, "Xbox One Main SoC and Xbox One Kinect", Hot Chips 25 (2013), slides, mostly images:
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf`.
- Arm, Cortex-A57 MPCore Processor Technical Reference Manual, DDI 0488 issue H
  (r1p3, 1 February 2016): `https://documentation-service.arm.com/documentation/ddi0488/h/`.
- Arm, Cortex-A78C Core Software Optimization Guide, issue 1.0
  (2 November 2020): `https://documentation-service.arm.com/static/5fa2bd1eb1a7c5445f2906fd`.
- AMD, BIOS and Kernel Developer's Guide for Family 16h Models 00h-0Fh, 48751 revision 3.03:
  `https://www.amd.com/content/dam/amd/en/documents/archived-tech-docs/programmer-references/48751_16h_bkdg.pdf`.
- US 10,275,239 B2, on deriving application-specific operating parameters for backwards compatibility
  (granted 30 April 2019; title paraphrased),
  patent office image: `https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/10275239`.
- Sony, "Open Source Software Used in PlayStation(R)4 (US)": `https://www.playstation.com/en-us/oss/ps4/`.
- Microsoft, "[MS-GIPUSB]: Gaming Input Protocol (GIP) Universal Serial Bus (USB) Extension", revision 1.0
  (16 September 2024), landing page and notice:
  `https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gipusb/e7c90904-5e21-426e-b9ad-d82adeee0dbc`.

Community references:

- SwitchBrew, raw pages: Hardware (revision 15339), Memory layout (12866), SVC (15416), NV services (15358),
  GPU (12795), GPU Classes (12790), GPU Shaders (12661), NPDM (15417), NSO0 (14440), ExeFS (1506), NCA (14983),
  Services API (15412), HIPC (14205), Secure Monitor (15437), Audio services (15352), HID services (15464),
  PPC services (12421), Applet Manager services (15266), VI services (15292), BCAT services (15401), Switch 2:
  Tegra T239 (15493), Switch 2: Compatibility Mode (15275), Switch 2: System Versions (15457):
  `https://switchbrew.org/w/index.php?title=SVC&action=raw` and sibling pages.
- psdevwiki, archived captures: PS3 RAM (20261010031253), RSX (20261013161738), CELL BE (20260623140547),
  LV2 Functions and Syscalls (20260818233001), PRX (20260222183702); PS4 APU (20251121182524),
  Syscalls (20260216085041), SELF File Format
  (20260220000705, used only for its statement on a leaked kernel);
  PS5 Hardware (20260221153149), Kernel (20261001200415), Hypervisor (20260519183327):
  `https://web.archive.org/web/20261013161738id_/https://www.psdevwiki.com/ps3/RSX` and sibling captures.
- OpenOrbis PS4 Toolchain, README and documents "PS4 ELF Specification", "Dynlib Data", "Libkernel",
  at commit `0a1aaf9`:
  `https://raw.githubusercontent.com/OpenOrbis/OpenOrbis-PS4-Toolchain/0a1aaf9dd4a92695538bdeb09fb056d06dd11725/README.md`
  and sibling files.
- dekuNukem, Nintendo Switch reverse-engineering notes, README, Bluetooth HID notes, and IMU notes,
  at commit `b354f21a`:
  `https://raw.githubusercontent.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/b354f21ae81f7b0d1d060b2b61e66ad0d9bc1756/README.md`
  and sibling files.
- `libnx` headers `audren.h` and `audout.h`, from the master branch, whose latest commit was `b156b477`:
  `https://raw.githubusercontent.com/switchbrew/libnx/master/nx/include/switch/services/audren.h` and sibling file.
- NintendoClients README, at commit `d0965c88`:
  `https://raw.githubusercontent.com/Kinnay/NintendoClients/d0965c8875ca09e1bfa5482ac8d41d1eccd59d75/README.md`.

Open-source documentation and specifications:

- Linux kernel, `Documentation/gpu/amdgpu/`
  (`driver-core.rst`, `ring-buffer.rst`, `gc/index.rst`) at commit `5f22fb20`:
  `https://raw.githubusercontent.com/torvalds/linux/5f22fb20497f4983094131f00a734362300d22d2/Documentation/gpu/amdgpu/driver-core.rst`
  and sibling files; and `Documentation/filesystems/spufs/spufs.rst`, `arch/powerpc/platforms/ps3/Kconfig`, and
  `sound/ppc/snd_ps3.c` (header and capabilities only), read from the master branch, whose head was `5f22fb20`; none of
  the three has changed since 2025:
  `https://raw.githubusercontent.com/torvalds/linux/5f22fb20497f4983094131f00a734362300d22d2/sound/ppc/snd_ps3.c` and
  sibling files.
- Mesa documentation, RADV, and NVK's pages "Hardware docs" and "External Hardware Documentation and Resources":
  `https://docs.mesa3d.org/drivers/radv.html` and sibling pages.
- Khronos, Vulkan specification chapter "Pipelines",
  VK_EXT_graphics_pipeline_library and VK_EXT_shader_object proposals, and VkPresentModeKHR reference page:
  `https://docs.vulkan.org/spec/latest/chapters/pipelines.html` and sibling pages.
- Khronos, SPIR-V Specification, version 1.6 revision 8:
  `https://registry.khronos.org/SPIR-V/specs/unified1/SPIRV.html`.
- FEX README at commit `20059335` and Box64 README at commit `07e9e5c3`, the latest to change each file:
  `https://raw.githubusercontent.com/FEX-Emu/FEX/2005933518d51c15c7ff115522cf3d577a9f1a91/Readme.md`,
  `https://raw.githubusercontent.com/ptitSeb/box64/07e9e5c34420b3116913b44e3f38a5c8f6f4e546/README.md`.

Prose of walled emulators:

- shadPS4 README, from the main branch, whose latest commit the research agent recorded as `e82c3350`:
  `https://raw.githubusercontent.com/shadps4-emu/shadPS4/main/README.md`.
- RPCS3 ps3autotests README, from the master branch; the guard blocks the commit lookup, so none is given:
  `https://raw.githubusercontent.com/RPCS3/ps3autotests/master/README.md`.

Wikipedia, raw wikitext (tertiary; revision numbers in brackets):

- Cell (processor) [1386170292]; PlayStation 3 technical specifications [1386319161];
  PlayStation 3 system software [1386319155]; RSX Reality Synthesizer [1318869943]; PlayStation 4 [1386319169];
  PlayStation 4 technical specifications [1386319175]; PlayStation 4 system software [1385538186];
  PlayStation 5 [1385515902]; Xbox One [1386323575]; Xbox Series X and Series S [1386594308];
  Xbox system software [1386323584]; Xbox Wireless Controller [1385359035]; Nintendo Switch [1384604421];
  Nintendo Switch 2 [1386314413]; Nintendo Switch system software [1381894756]; Nintendo Switch Online [1384839693];
  Zen 2 [1373859411]; Direct3D [1385070978]; Graphics Core Next [1384947614]; RDNA (microarchitecture) [1384343765];
  Micro stuttering [1385431095]; RPCS3 [1384344878]; ShadPS4 [1383492990]; Ryujinx [1376535915];
  Yuzu (emulator) [1380070546]: `https://en.wikipedia.org/w/index.php?title=Cell_(processor)&action=raw`
  and sibling pages.
