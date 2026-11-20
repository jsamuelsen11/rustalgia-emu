---
title: "Modern consoles and handhelds, including systems on sale today: primer"
roadmap_item: R1-04
status: draft
date: 2026-11-20
---

# Modern consoles and handhelds, including systems on sale today: primer

## Summary

This note asks how the consoles of the modern era work and what that asks of an emulator,
using the systems whose family surveys depend on it: the PlayStation 3, 4, and 5, the Xbox One and Xbox Series,
and the Nintendo Switch and Switch 2.
In this era a game is a user process of a full operating system,
so the interface an emulator must reproduce is mostly the operating system's and its libraries',
not the chips' registers (inference).
The guest processors are general-purpose architectures
(64-bit PowerPC with the Cell's SPUs, x86-64, and 64-bit Arm),
so a host of the same architecture can run much guest code directly,
and the PlayStation 3 needs translation on every host (inference).
Every game ships compiled shader binaries and builds its own GPU command buffers,
so shader translation and its compilation stutter are unavoidable costs (inference).
Retail games on all of these systems are encrypted and signed; the legal side is in `R0-02` and is not repeated here.
This note is not legal advice.

## Scope

- Question: how do the consoles of the modern era work, and what does that ask of an emulator?
- Covered: processors, memory and storage, graphics, audio, operating systems and services, timing, threading and input,
  and online services, for the systems whose family surveys depend on this item: `R1-14` (Switch and Switch 2), `R1-21`
  (PlayStation 3, 4, and 5), and `R1-23` (Xbox One and Xbox Series; the Xbox 360 is covered by `R1-03`).
  Every console and handheld of the era is listed in the catalogue, `R1-08`; PC and Android handhelds, microconsoles,
  and FPGA devices are emulator hosts, left to `R3-07` and `R3-12`.
- Left to other items: the law on encryption, firmware, keys, and takedowns
  (`R0-02`, cited by section name);
  each family's emulators (`R1-14`, `R1-21`, `R1-23`); host platforms (phase 3); techniques in depth (phase 2).
- Researched on 2026-11-20.
  Several of these systems are on sale: as of 2026-11-20 the Switch
  (outside Europe), Switch 2, PlayStation 5, and Xbox Series are sold, and their system software changes about monthly.
  Each claim about a system on sale is dated by the revision of the page it rests on.
- How claims were checked: research agents fetched the raw text of every source on 2026-11-20
  (wiki pages through `action=raw`, PDFs through `pdftotext`, repository files at a pinned commit where shown).
  A second, independent pass fetched the sources again and tested each claim and quotation;
  its corrections were checked against the sources and applied,
  and the claims it could not check are listed in the pull request.
  A claim marked "(secondary)" rests on Wikipedia or another summary of other sources,
  "(from memory)" on no page fetched for the note, "(inference)" on the author's reasoning,
  "(lead)" on an article site the register treats as a lead,
  and "(observed)" on what the author saw in a page or image and did not quote.
  The Xbox One slides from Hot Chips 25 are images; facts from them are marked "(observed)".
  Statements that nothing was found record a search, not proof of absence.
- What was opened: maker documents and talks, community wikis on their technical pages, archived copies of psdevwiki
  (the live site refused automated requests), Wikipedia, and the prose of walled emulators.
  No emulator source code, key, fuse, exploit, firmware, title-list, or game page was opened on purpose.
  Two kinds of code outside emulators were read:
  header constants of an open-tier homebrew library (`libnx`) and part of a Linux sound driver;
  the findings that rest on them say so.

## Findings

### What changed in this era

- A game here reaches hardware through kernel calls and system libraries or services, not by writing device registers:
  Sony's PS3 Linux documents describe a hypervisor that virtualises "Most devices and system resources",
  psdevwiki records that PS4 system calls are "mostly called by" a kernel library that exports wrappers to applications,
  and SwitchBrew describes Switch services reached by inter-process messages
  (Sony, Linux Kernel Overview; psdevwiki PS4, Syscalls; SwitchBrew, Services API).
  The emulator's main interface is therefore the operating system's (inference).
- The makers update that interface over the life of the console.
  SwitchBrew marks services and calls with the system version that added or changed them,
  psdevwiki marks PS4 system calls by firmware interval,
  and the PS5 hypervisor moved out of the kernel binary after system software 2.70
  (SwitchBrew, Services API; psdevwiki PS4, Syscalls; psdevwiki PS5, Hypervisor).
  A high-level emulation (HLE) of that interface has to know which version a game was built for (inference).
- The makers themselves keep old games running by emulation or compatibility layers.
  The Xbox One runs Xbox 360 games through a software emulator in its system software,
  with hardware support for 360 audio and texture formats
  (Wikipedia, Xbox One, secondary);
  the PS5 relies on extra logic in its GPU and a CPU tuned to match the PS4
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
  with 32 KB instruction and 32 KB data caches and a 512 KB L2 (Sony, Cell Programming Primer, section 1.2.2).
  It runs two hardware threads (Wikipedia, Cell (processor), secondary; the sentence carries a "citation needed" tag).
- Each SPU has one register file of 128 registers of 128 bits, used for every data type
  (Gschwind et al., slides 8 and 11).
  A scalar value sits in a "preferred slot", bytes 0 to 3 of a register, counted from the most significant end
  (Gschwind et al., slides 12 to 15; the byte order is from memory).
  128 guest vector registers exceed the vector register files of x86-64 and AArch64 hosts
  (from memory),
  and the lane order is reversed against little-endian hosts,
  so a translator keeps most registers in memory and maps every lane index (inference).
- An SPU addresses only its own 256 KB local store, which holds code and data; loads and stores always move 128 bits,
  and addresses wrap at the value of a limit register
  (Gschwind et al., slides 14 and 16; Sony, Cell Programming Primer, section 1.2.3).
  The local store can be emulated as a masked offset into a host buffer with no address translation (inference).
- The SPU is statically scheduled: two instructions issue per cycle in aligned pairs,
  and branches are predicted only by a hint instruction
  (Gschwind et al., slides 16 and 26; Wikipedia, Cell (processor), secondary).
  A functional translator can ignore the hints; one that models timing cannot (inference).
- SPU single precision uses an IEEE data layout in a graphics-oriented mode,
  while double precision follows IEEE conventions (Gschwind et al., slide 22).
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
  An SPE thread's saved context includes its registers, local store, and outstanding DMA requests
  (Sakai et al., Hot Chips 17, "Multi-layered Programming Model").
- DMA sizes are 1, 2, 4, or 8 bytes or a multiple of 16 bytes, at most 16 KB per command;
  transfers of 16 bytes or more need 16-byte alignment on both sides,
  and smaller ones natural alignment with the same low four address bits on both sides
  (Sony, Cell Programming Primer, section 4.2.1).
  Sony's primer says that if these rules are broken "the MFC will stop, resulting in a DMA alignment error interrupt",
  so the fault is visible to the guest (same section).
- Each DMA command carries a tag from 0 to 31, and the SPE program waits on groups of tags
  (Sony, Cell Programming Primer, chapter 3 and section 4.2).
  Performing DMA at once is simpler; deferring it is more faithful when games overlap work and transfer (inference).
- Atomic updates use a reservation on a 128-byte line:
  a conditional store fails if any other agent wrote the line after it was loaded
  (Sony, Cell Programming Primer, section 4.2.3).
  Hosts have no 128-byte reservation, so an emulator must detect any guest write to a reserved line (inference).
- Each SPE has an inbound mailbox of four 32-bit entries, an outbound mailbox of one entry,
  an outbound interrupt mailbox, and two signal registers that are cleared when read and can be set to overwrite
  or to combine by OR; reading an empty channel stalls the SPE
  (Sony, Cell Programming Primer, sections 4.1.1 and 4.1.2; Linux, `spufs.rst`).
  Blocking channel reads are where an emulator can park or switch SPU threads (inference).

#### x86-64 in the PlayStation 4 and 5 and the Xbox One and Series

- The PS4 (2013) and Xbox One (2013) use two modules of four AMD Jaguar cores each: 1.6 GHz on the PS4
  (2.13 GHz on the PS4 Pro)
  and 1.75 GHz on the Xbox One (2.3 GHz on the Xbox One X)
  (Wikipedia, PlayStation 4 technical specifications and Xbox One, secondary).
  Jaguar is AMD's Family 16h; AMD's own guide for the PC parts gives a 40-bit physical address space
  (AMD, BIOS and Kernel Developer's Guide 48751, section 2.4.5).
  Whether the console parts keep that limit is not stated in any source read.
- The PS5 (2020) and Xbox Series (2020) use eight AMD Zen 2 cores: up to 3.5 GHz on the PS5
  (3.85 GHz on the PS5 Pro),
  3.8 GHz on the Series X (3.66 GHz with simultaneous multithreading), and 3.6 GHz on the Series S (3.4 GHz with it)
  (Wikipedia, PlayStation 5 and Xbox Series X and Series S, secondary; on sale as of 2026-11-20).
  Zen 2 adds AVX2 and FMA3 among others, which a host lacking them must translate
  (Wikipedia, Zen 2, secondary; the second half is inference).
- Games do not get every core. psdevwiki says six of the PS4's eight cores are available to applications
  (psdevwiki PS4, APU),
  while Wikipedia says seven (Wikipedia, PlayStation 4, secondary); the difference may be a firmware change
  (from memory).
  Wikipedia says one Xbox Series core is dedicated to the operating system
  (Wikipedia, Xbox Series X and Series S, secondary).
  No source read gives the PS5's figure.
- shadPS4, a walled PS4 emulator, describes its approach in its README
  as "natively executing the x64 code of PS4 binaries",
  and says some PS4 system modules must be dumped from the user's console (shadPS4 README).
  Running guest code directly on an x86-64 host leaves the emulator to intercept system and library calls
  and to fit the guest's address layout into the host's (inference).

#### Arm in the Switch and Switch 2

- The Switch uses Nvidia's Tegra X1 (the X1+ from August 2019 and in the Lite and OLED models);
  games use the four Cortex-A57 cores, one of which is reserved for the operating system,
  and the chip's four Cortex-A53 cores are not used
  (Wikipedia, Nintendo Switch, secondary; on sale outside Europe as of 2026-11-20).
  The CPU normally runs at 1.02 GHz, with a boost to 1.785 GHz used mainly during loading (same).
- Arm's manual describes the Cortex-A57 as an out-of-order ARMv8-A core with 48 KB instruction and 32 KB data L1 caches,
  supporting AArch32 and AArch64 at every exception level
  (Arm, Cortex-A57 TRM, DDI 0488 issue H, "Features" and "Compliance").
  A Switch program's metadata has a flag for 64-bit instructions
  and an address-space field whose values include 32-bit layouts
  (SwitchBrew, NPDM),
  so an emulator needs both 64-bit and 32-bit Arm front ends if any game is a 32-bit process (inference).
- The Switch 2 (2025) uses Nvidia's T239: eight Cortex-A78C cores and a 1,536-core Ampere GPU,
  built to Nintendo's specification and close to the T234 of Nvidia's Orin products, by SwitchBrew's account,
  which states no origin for its figures (SwitchBrew, Switch 2: Tegra T239; on sale as of 2026-11-20).
  Arm's guide gives the A78C's architecture as Armv8-A with extensions up to pointer authentication from Armv8.3-A
  and enhanced pointer authentication from Armv8.6-A, without the optional FPAC
  (Arm, Cortex-A78C Software Optimization Guide, section 2).
  A host without pointer authentication must emulate those instructions (inference).
- Whether the A78C runs 32-bit Arm code, and at which exception levels, was not found in a maker source:
  five guessed topic addresses in Arm's documentation service returned 404 (research log).

#### Translation between host and guest architectures

- Built for this note from the findings above (the host columns are inference):

| System | Guest code | On an x86-64 host | On an Arm64 host |
|---|---|---|---|
| PlayStation 3 | PowerPC with VMX, and SPU | translate both | translate both |
| PlayStation 4, Xbox One | x86-64 (Jaguar) | run directly | translate |
| PlayStation 5, Xbox Series | x86-64 (Zen 2) | run directly, translating missing extensions | translate |
| Switch | A64 and A32 (Cortex-A57) | translate | run directly |
| Switch 2 | A64 (Cortex-A78C) | translate | run directly, with pointer authentication |

- Ryujinx's macOS port used Apple silicon's hypervisor to run the Switch's ARMv8 code natively
  (Wikipedia, Ryujinx, secondary).
  Running guest user code in a host virtual machine while the emulator supplies the operating system is one route
  for a same-architecture host (inference).
- FEX runs x86 Linux programs on ARM64 Linux, keeps a code cache,
  and lets the user skip what its README calls "costly memory model emulation" per application (FEX README).
  Box64 runs x86-64 Linux programs on Arm and other hosts with a dynamic recompiler
  and keeps translated code on disk by default
  (Box64 README).
  x86's stronger memory ordering must be enforced, or relaxed per game, on an Arm host,
  and a persistent cache answers first-run stutter (inference).

### Memory and storage

- The PS3 has two pools: 256 MB of XDR as main memory, and 256 MB of GDDR3 attached to the RSX GPU
  (Wikipedia, PlayStation 3 technical specifications, secondary; psdevwiki PS3, RAM).
  Main memory and an SPU's local store are separate address spaces, and a DMA command names one address in each
  (Sony, Cell Programming Primer, chapter 3).
- The RSX can read up to 224 MB of main memory (Wikipedia, RSX Reality Synthesizer, secondary).
  Wikipedia and psdevwiki give the same table of rates measured on pre-launch clocks,
  with the Cell reading GDDR3 at about 16 MB/s; neither names the origin of the measurements,
  and their texts are nearly identical, so they count as one source
  (Wikipedia, RSX Reality Synthesizer, secondary; psdevwiki PS3, RSX).
  Games avoid that slow path, so an emulator need not model its cost but must allow both directions (inference).
- Sony's documents say Linux on the PS3 runs on top of the hypervisor,
  and that "no direct access by guest OSes to the GPU is allowed currently";
  the frame buffer was in main memory and copied to the GPU by DMA through hypervisor calls
  (Sony, Linux Kernel Overview, "Graphics/Video"; Sony, Application Programming Environment).
- The PS4 has 8 GB of GDDR5 at 176 GB/s shared by CPU and GPU, with no separate video memory
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  The PS4 Pro adds 1 GB of slower memory so that background applications can be moved out,
  giving games 5.5 GB in place of 5 GB (same).
  The memory a game sees therefore depends on the model (inference).
- The Xbox One has 8 GB of DDR3 plus 32 MB of on-chip ESRAM;
  Wikipedia's prose and its table give different ESRAM bandwidths (Wikipedia, Xbox One, secondary).
  Games were reported to get 5 GB of the 8, and the Xbox One X has 12 GB of GDDR5 with 9 GB for games
  and no ESRAM (same).
  No source read says how games place data in ESRAM or how the One X runs games designed for it.
- The Xbox One and Series run a modified Hyper-V hypervisor with an "Exclusive" partition for games and a "Shared" one
  for apps and the interface (Wikipedia, Xbox system software, secondary).
  Microsoft's Hot Chips 25 slides show "host-guest" memory-management units for the GPU and for input and output,
  with page tables kept in step with the CPU's (Sell and O'Connor, Hot Chips 25, slides 4 and 6 to 8; observed).
  A game therefore sees a guest-physical address space inside a virtual machine (inference).
- The PS5 has 16 GB of GDDR6 at 448 GB/s shared by CPU and GPU, and 512 MB of DDR4 used as the SSD controller's cache;
  the SSD reads 5.5 GB/s raw, and a hardware unit decompresses zlib and Oodle Kraken
  (Wikipedia, PlayStation 5, secondary; psdevwiki PS5, Hardware; on sale as of 2026-11-20).
  PS5 games must run from internal or M.2 storage (Wikipedia, PlayStation 5, secondary).
- The Xbox Series X has 16 GB of GDDR6 at two speeds, 10 GB at 560 GB/s and 6 GB at 336 GB/s,
  "with the system software only drawing from the slower pool";
  its storage block decompresses zlib and Microsoft's BCPack texture format
  (Wikipedia, Xbox Series X and Series S, secondary; on sale as of 2026-11-20).
  No public specification of Kraken or BCPack was found among the sources read.
- The Switch has 4 GB of LPDDR4 shared by CPU and GPU (SwitchBrew, Hardware; Wikipedia, Nintendo Switch, secondary).
  Its user address space is 32 or 36 bits, with 38-bit spaces from system version 2.0.0, by SwitchBrew
  (SwitchBrew, Memory layout); a 39-bit figure in other references is from memory, so the value needs a second source.
- The Switch kernel grows a heap only in multiples of 2 MB (SwitchBrew, SVC, heap call).
  A game cannot make memory executable through the call it uses to change permissions; from system version 4.0.0,
  code memory objects let one process map memory writable and another map it executable
  (SwitchBrew, SVC, permission and code-memory calls).
  A recompiler can therefore treat guest code pages as fixed except on that path (inference).
- The kernel keeps a memory state and attributes for every region, and later calls succeed or fail by them;
  the Switch 2 adds two GPU-sharing attributes whose effect the page does not describe (SwitchBrew, SVC).
  One physical page may appear at several guest addresses with different permissions,
  so the host mapping must support aliasing (inference).
- To give the GPU memory, a program maps it into a GPU address space through Nvidia's driver interface;
  each open of that device creates a separate GPU address space (SwitchBrew, GPU; NV services).
  CPU and GPU addresses are translated separately over one pool (inference).
- The Switch 2 has 12 GB of LPDDR5X; SwitchBrew gives 120 GB/s, Wikipedia about 102 GB/s docked and 68 GB/s handheld
  (SwitchBrew, Switch 2: Tegra T239; Wikipedia, Nintendo Switch 2, secondary; on sale as of 2026-11-20).
- Across the era every system here except the PS3 and Xbox One has one unified pool for CPU and GPU
  (inference from the findings above).
  Guest memory now approaches host memory:
  a 16 GB guest needs a host with more than 16 GB once the emulator's own memory
  and host GPU copies are added (inference).

### Graphics

#### PlayStation 3

- The RSX is an Nvidia design based on the GeForce 7800 GTX,
  with separate vertex and pixel pipelines rather than unified shaders
  (Wikipedia, RSX Reality Synthesizer, secondary, a page tagged "original research"; psdevwiki PS3, RSX).
  Vertex and fragment programs need separate translation paths to a host's unified shaders (inference).
- Games program the RSX mostly through a library that builds GPU command buffers directly;
  psdevwiki says "hardly anyone uses PSGL", the OpenGL ES layer built on top of it
  (psdevwiki PS3, RSX, "RSX Libraries").
  A PS3 emulator therefore works at the level of GPU commands (inference).
- Sony's documents describe only the Linux frame-buffer path, not the 3D engine
  (Sony, Linux Kernel Overview), so 3D behaviour must come from community references.
  No open description of the RSX command methods or shader encodings was read.

#### AMD GPUs in the PlayStation 4 and 5 and the Xbox One and Series

- The PS4 GPU is AMD Graphics Core Next (GCN) with 18 compute units at 800 MHz;
  Wikipedia places it on the second generation of GCN, with a "better source needed" mark
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  The PS4 Pro has 36 compute units, packed 16-bit arithmetic, and a "Boost Mode" for games not patched for it (same).
- Wikipedia lists three PS4 changes from the PC parts: a bus that lets the GPU bypass its caches,
  a tag on L2 lines for mixed graphics and compute work, and "An upgrade from 2 to 64 sources for compute commands"
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  Guest compute and graphics writes to shared memory must be ordered as the hardware orders them (inference).
- PS4 games use two Sony APIs, GNM and the higher-level GNMX, and a shader language close to HLSL
  (Wikipedia, PlayStation 4 system software, secondary);
  the PS5 is programmed through a Sony API named AGC (Wikipedia, PlayStation 5, secondary).
  No public description of either was found.
  Both compile to command packets and GPU shader binaries, which is what an emulator sees (inference).
- GCN runs threads in waves of 64; RDNA, used in the PS5 and Xbox Series, supports waves of 32 and 64
  (Wikipedia, Graphics Core Next and RDNA (microarchitecture), secondary).
  A host with 32-wide waves must emulate 64-wide wave operations (inference).
  The third generation of GCN is binary-incompatible with earlier ones
  (Wikipedia, Graphics Core Next, secondary),
  so even an AMD host cannot be assumed to run PS4 shader binaries unchanged (inference).
- The PS5 GPU is a custom RDNA 2 part with 36 compute units at up to 2.23 GHz and hardware ray tracing,
  with a variable clock; the PS5 Pro (2024) has 60 compute units and a machine-learning upscaler
  (Wikipedia, PlayStation 5, secondary; on sale as of 2026-11-20).
  A Pro model would need an equivalent upscaler or a substitute (inference).
- The Xbox One GPU is GCN with 12 compute units at 853 MHz, programmed through Direct3D 11.X,
  a superset of Direct3D 11.2; the Series X has 52 compute units of RDNA 2 at a fixed 1.825 GHz
  (Wikipedia, Xbox One and Xbox Series X and Series S, secondary).
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
  (US 10,275,239 B2, abstract; read from the patent office image by OCR; its claims were not analysed, under `R0-02`,
  "Patents, recorded as risks").
  The maker treats GPU timing as something old games can depend on (inference).

#### Nvidia GPUs in the Switch and Switch 2

- The Switch's Maxwell GPU has 256 cores, clocked at 768 MHz docked and 307.2 to 460 MHz in handheld mode
  (Wikipedia, Nintendo Switch, secondary).
  The system software reports it to programs as implementation GM20B with SM version 5.0.3 and 3D class `0xB197`
  (SwitchBrew, NV services, GPU characteristics); an emulator returns these values.
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
  and observation of a game's command stream, and claim no maker documents
  (SwitchBrew, GPU, "References"; GPU Shaders, "Analysis Tools").
- Mesa's NVK documentation says a switch between engines in one channel idles the whole channel
  (Mesa, NVK, "Hardware docs", "Subchannel switches"),
  and says that "Red Hat has some NDA'd documentation on instruction latencies from NVIDIA"
  (Mesa, NVK, "External Hardware Documentation and Resources").
  Parts of Mesa's Nvidia compiler may
  therefore rest on confidential maker data; this note uses only Mesa's prose (inference).
- The Switch 2 GPU reports Ampere 3D class `0xC797` and keeps two older Nvidia classes
  (SwitchBrew, NV services, Switch 2 structure), so much of a Switch GPU front end carries over (inference).
  Its GPU runs at 1,007 MHz docked and 561 MHz handheld (Wikipedia, Nintendo Switch 2, secondary).
- On the Switch 2, three compatibility modules loaded into a Switch game override selected library functions;
  SwitchBrew says "The overrides are mostly related to Graphics
  (i.e. translating to the new GPU),
  but there are also plenty other function overrides to deal with various system differences"
  (SwitchBrew, Switch 2: Compatibility Mode, "Hooking").
  The maker translates the old GPU's work rather than executing it (inference).

#### Shader translation and compilation stutter

- SPIR-V, the intermediate language Vulkan takes, is a binary form with structured control flow
  (Khronos, SPIR-V Specification 1.6, revision 8, "Goals");
  guest shader binaries for every GPU here must be lifted into structured control flow to produce it (inference).
- Wikipedia says that "On consoles, developers can pre-compile all shaders for the known, fixed hardware",
  while PCs compile at run time and stutter, which is mitigated by recording pipeline variants, background compilation,
  and distributing compiled shaders (Wikipedia, Micro stuttering, "Shader compilation", secondary).
  An emulator turns the console's pre-compiled shaders back into run-time compilation on the host (inference).
- Khronos's pipeline-library proposal states that, for many engines,
  requiring the state up front "either fails to eliminate hitching,
  or requires precompiling so many state combinations that the size of the pipeline cache is nearly unmanageable"
  (Khronos, VK_EXT_graphics_pipeline_library proposal, "Problem Statement");
  a later proposal binds shaders without pipeline objects (Khronos, VK_EXT_shader_object proposal).
  An emulator learns guest state only at draw time, the case these extensions address (inference).
- Vulkan pipeline caches let compiled pipelines be reused between runs
  (Khronos, Vulkan specification, "Pipeline Cache");
  an emulator keeps its own cache of translated shaders as well (inference).

### Audio

- The surveyed systems use four arrangements, by the findings below (inference):
  a plain output front end with all decoding and mixing in software (PS3);
  a cluster of audio processors with fixed-function engines
  (Xbox One; PS4 by secondary sources);
  a dedicated unit for 3D audio (PS5, and the Xbox Series by Wikipedia's infobox only);
  and a separate audio processor that runs a system renderer, reached only through operating-system services
  (Switch, Switch 2).
- Sony's documents say the PS3 front end "reads(DMAs) PCM data into its buffer" and plays it at a set clock and format,
  with no decoder for compressed audio and no volume control;
  the back end sits behind the hypervisor and is reached over a virtual serial port,
  and base clocks give 44.1 kHz and 48 kHz families (Sony, Linux Kernel Overview, "Audio").
  The Linux driver advertises stereo 16- or 24-bit samples at 44.1 to 96 kHz
  (Linux, `snd_ps3.c`; this description was written after reading part of that driver).
  Everything else a PS3 game plays is computed on the Cell (inference).
- Wikipedia says the PS4 has a dedicated audio module and a DSP that is identical or similar to AMD TrueAudio
  (Wikipedia, PlayStation 4 technical specifications, secondary).
  Sony's PS4 open-source page lists FLAC, libvorbis, and Opus among its components (Sony, open-source pages; observed).
- Wikipedia describes the PS5's Tempest engine as supporting "hundreds of simultaneous sound sources,
  compared to 50 on the PlayStation 4" (Wikipedia, PlayStation 5, secondary).
  No registered source describes Tempest's design; that it is a modified GPU compute unit is from memory.
- Microsoft's Hot Chips 25 slides show the Xbox One's audio as four DSP cores beside a shared memory,
  plus fixed-function blocks for sample-rate conversion, DMA, an Xbox Media Audio decoder, equalisation and compression,
  and filtering (Sell and O'Connor, Hot Chips 25, slide 7; observed).
  No source names the DSP cores' architecture,
  so emulating Microsoft's audio interfaces at high level is the only path visible in the sources read (inference).
- On the Switch, a game either plays buffers through an audio output service at 48 kHz or uses the audio renderer,
  which takes the game's state updates and generates command lists for the audio DSP
  (SwitchBrew, Audio services; `libnx` header `audout.h`).
  The renderer runs in fixed 5 ms frames of 240 samples at 48 kHz
  (`libnx` header `audren.h`; constants read in a homebrew library's header).
- The renderer's parameter format is versioned by a revision value the game supplies, from 1.0.0 to 23.0.0,
  each enabling features or fixes (SwitchBrew, Audio services, "BehaviorInfo Revision").
  An emulated renderer behaves as the revision a game asks for (inference).
- SwitchBrew describes the hardware Opus decoder as libopus running on the DSP
  (SwitchBrew, Audio services, "hwopus"), so a host libopus can be expected to give matching output (inference).
- Low-level emulation of the Switch audio DSP would need Nintendo's DSP firmware,
  which SwitchBrew says was overhauled on the Switch 2 to run Nintendo's own kernel
  (SwitchBrew, Audio services, "Notes");
  the project does not obtain firmware (`R0-02`, "Firmware, keys, and game copies").

### Operating systems, services, and security

#### PlayStation 3

- Sony's documents describe a guest operating system running on a hypervisor that virtualises most devices: storage,
  network, audio set-up, and the clock are reached by hypervisor calls,
  mostly asynchronous with completion by virtual interrupt, and "The RTC value can be read by a hypervisor call,
  but it can not be written" (Sony, Linux Kernel Overview, "Storage", "Audio", "Real Time Clock").
  The Linux kernel's help text names the platform as "the PS3 hypervisor" and its LV1 level
  (Linux, `arch/powerpc/platforms/ps3/Kconfig`).
  An emulator that runs the game kernel (LV2) must provide LV1's calls;
  one that emulates LV2 at high level never needs LV1 (inference).
- psdevwiki lists the LV2 system calls in numbered groups: processes, PPU threads, timers and synchronisation,
  SPU threads, virtual memory, module loading, storage, the RSX, network, file system, and debugging,
  each marked by the firmware kinds that have it and by the rights it needs (psdevwiki PS3, LV2 Functions and Syscalls).
  Only the retail, unprivileged subset matters to games (inference).
- PS3 libraries use the PRX module format, inherited from the PSP, with imports and exports keyed by numeric identifiers
  (psdevwiki PS3, PRX).
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
  (Wikipedia, PlayStation 4 system software, secondary; Sony, open-source pages; observed).
  psdevwiki says PS4 system calls follow FreeBSD numbering with some disabled and Sony's own calls added from 99 and
  after FreeBSD's last, 531, and that "the last custom Sony syscall ID is 677 (as of FW 6.51)"
  (psdevwiki PS4, Syscalls).
  Much of the kernel interface is documented FreeBSD behaviour (inference).
- Games reach the kernel mostly through a system library that also provides threads, event queues, memory allocation,
  and the dynamic linker (psdevwiki PS4, Syscalls; OpenOrbis, "Libkernel"),
  so the natural HLE boundary is the system-library interface (inference).
- PS4 executables are a modified ELF with Sony program-header types and a large dynamic-linking segment,
  by the OpenOrbis toolchain's reverse-engineered documents (OpenOrbis, "PS4 ELF Specification", at a pinned commit).
  Imports name functions by a short hash of the name rather than by name;
  the toolchain's authors write that "It is believed the primary purpose of using NIDs was to obfuscate symbol names"
  (OpenOrbis, "Dynlib Data").
  An HLE needs a table from those identifiers to its own functions (inference).
- PS4 executables ship in a signed, encrypted wrapper, and psdevwiki says the keys "are not publicly known"
  (psdevwiki PS4, SELF File Format, introduction).
  Retail code reaches an emulator only after decryption on a console; `R0-02`, "Firmware, keys, and game copies",
  applies.
  Open toolchains build unsigned homebrew "without the need of Sony's official Software Development Kit"
  (OpenOrbis README), which is the only PS4 test software an emulator project can run without decryption (inference).
- psdevwiki says the PS5 kernel is based on FreeBSD 11.0 and carries three executable types,
  one of them for PS4 programs (psdevwiki PS5, Kernel).
  It describes a small hypervisor that protects the kernel and "does not run multiple VMs"
  (psdevwiki PS5, Hypervisor); a game never calls it (inference).

#### Switch and Switch 2

- Horizon is a proprietary microkernel derived from the 3DS's, with every driver in user space,
  including Nvidia's GPU driver (Wikipedia, Nintendo Switch system software, secondary).
  SwitchBrew's table lists 101 kernel calls for the Switch and 7 more for the Switch 2 only (SwitchBrew, SVC, counted).
- A process gets a service by asking a service manager for it by name,
  and requests travel in Horizon's own message format with copied and moved handles and buffer descriptors
  (SwitchBrew, Services API; HIPC).
  SwitchBrew lists 446 service names, 354 on the Switch and 347 on the Switch 2,
  counted on revision 15412 of 2026-11-02, including names retired in later versions
  (SwitchBrew, Services API; counted locally).
  HLE of Horizon means answering each service a game opens, over a large, versioned set (inference).
- A Switch game ships Nintendo's SDK code inside its own package as separate modules
  (SwitchBrew, ExeFS),
  so an emulator runs the SDK as guest code and emulates the services below it, unlike the PS3 and PS4 (inference).
- Each program carries metadata declaring its address space, main thread, permitted kernel calls,
  and permitted services, with a signed part (SwitchBrew, NPDM).
  Executables are segments with hashes, optionally compressed
  (SwitchBrew, NSO0),
  inside containers that SwitchBrew says are "encrypted" whole, with a key generation that rises with system versions
  (SwitchBrew, NCA).
  A newer game needs keys from a newer system version; `R0-02`, "Anti-circumvention law in the United States",
  records that every circumvention action found against a console emulator concerns the Switch.
- Cryptography is done by a secure monitor in Arm TrustZone that user code reaches only through a system service
  (SwitchBrew, Secure Monitor); an HLE answers the services above it and never models TrustZone (inference).
- Switch 2 system versions ran from 19.0.0 before launch to 23.5.0 of 10 November 2026
  (SwitchBrew, Switch 2: System Versions; as of 2026-11-20),
  so an HLE of a system on sale targets an interface that changes about monthly (inference).
- In Switch 2 compatibility mode, three modules are mapped into a Switch game and override selected SDK functions,
  with per-game patches; SwitchBrew writes
  that "Backwards-compatibility is achieved by (ab)using dynamic linking to selectively hook API functions"
  (SwitchBrew, Switch 2: Compatibility Mode, "Hooking").
  The maker's own compatibility is high-level emulation at the library boundary plus per-game fixes (inference).

#### Xbox One and Series

- The game runs in a Windows-NT-based guest under the hypervisor,
  first on a Windows 8 core and from November 2015 on a Windows 10 core (Wikipedia, Xbox system software, secondary).
- No open-tier description of that guest's interface, its executable or package format, or its encryption was found.
  Searched: the register and `R0-05` (no hub), the Wikipedia articles listed in the Sources,
  and one web search on Xbox security talks;
  the one candidate community wiki is unregistered and was blocked by the guard (research log).

### Timing, threading, and input

- The Switch kernel's thread call accepts processor ids 0 to 3, or -2 for the process's default core, and a sleep of 0,
  -1, or -2 nanoseconds selects one of three kinds of yield (SwitchBrew, SVC).
- On the Switch 2, a Switch game's process is given cores 0 to 5 (`0x3F`),
  but the compatibility layer reports only three, "effectively pretending that there are only 3 CPU cores available"
  (SwitchBrew, Switch 2: Compatibility Mode).
- Switch synchronisation is by words in guest memory that the kernel arbitrates: address-based locks,
  condition variables, and from 4.0.0 a general wait-on-address (SwitchBrew, SVC).
  CPU and GPU synchronise through syncpoints, counters a program can read, increment, and wait on
  (SwitchBrew, NV services).
  An HLE must keep these semantics, including timeouts and cancellation (inference).
- The PS3's game kernel offers threads, mutexes, lightweight mutexes, condition variables, reader-writer locks,
  semaphores, event flags, and event queues
  (psdevwiki PS3, LV2 Functions and Syscalls, group names);
  the PS4 adds Sony event flags and semaphores to FreeBSD's calls (psdevwiki PS4, Syscalls).
- The Switch's tick counter runs at 19.2 MHz and is read directly by games;
  on the Switch 2 the compatibility layer "Returns 31250000 instead of 19200000" to Switch games
  (SwitchBrew, SVC; Switch 2: Compatibility Mode).
  Because the guest reads it without a kernel call,
  the emulator must keep it consistent with guest progress (inference).
- The Switch's performance service sets clock profiles: the CPU at 1020 MHz, or 1785 MHz in boost profiles from 7.0.0;
  the GPU at 307.2, 384, or 460.8 MHz in handheld profiles and 768 MHz docked (SwitchBrew, PPC services).
  Games ask for the operation mode (handheld or docked) and the performance mode,
  and can be notified when either changes (SwitchBrew, Applet Manager services).
  An emulator chooses the mode it reports, and a change must arrive as that notification (inference).
- The Switch 2's compatibility layer adds waits and locks for Switch games,
  several described as preventing races that appear only on the faster console;
  SwitchBrew writes "Probably prevents a race condition that only manifests on Switch 2"
  (SwitchBrew, Switch 2: Compatibility Mode, "MiscControlData").
  Running faster than the original exposes timing bugs, which an emulator on a fast host also meets (inference).
- With a fixed refresh rate a late frame is held (judder) or shown part-drawn (tearing);
  variable refresh lets the display follow the frame rate (Wikipedia, Variable refresh rate, secondary).
  The Switch 2's screen runs up to 120 Hz with variable refresh
  (Wikipedia, Nintendo Switch 2, secondary; as of 2026-11-20),
  and the PS5 added variable refresh at 1440p in system software 7.00 of 8 March 2023
  (Wikipedia, PlayStation 5, secondary), so an emulator must not assume a fixed 60 Hz.
- On the host, Vulkan's FIFO present mode waits for vertical blanking and "is the only value of presentMode
  that is required to be supported"; other modes replace, tear, or drop frames (Khronos, VkPresentModeKHR).
  A guest that waits on its own vertical-sync event
  (SwitchBrew, VI services) adds that latency to the host's (inference).
- The console asks each attached Joy-Con for its state every 15 ms,
  while the standard Bluetooth report is pushed at 60 Hz, as the same notes give both figures;
  each report carries three motion samples 5 ms apart (dekuNukem, README and IMU notes).
  The game-facing input service writes ring buffers in a shared memory block of `0x40000` bytes,
  each entry with a sampling number (SwitchBrew, HID services).
  A host gyroscope sampled at another rate must be resampled to that pattern
  for motion aiming to feel the same (inference).
- The Xbox Wireless Controller has a motor in each trigger as well as two in the grips
  (Wikipedia, Xbox Wireless Controller, secondary).
  Microsoft publishes its USB protocol, revision 1.0 of 16 September 2024,
  under a notice that allows copies made to implement it and grants no patent licence
  (Microsoft, MS-GIPUSB, notice; its technical content was not read).

### Online services

- Nintendo Switch Online is required for online play in most games and holds cloud saves,
  which lapse after a six-month grace period (Wikipedia, Nintendo Switch Online, secondary; as of 2026-11-20).
  Switch games also receive server-delivered content through a background delivery cache (SwitchBrew, BCAT services).
  Offline emulation loses multiplayer, cloud saves, and delivered content (inference).
- A third-party client library warns that "Nintendo bans Switch devices that show suspicious behavior"
  (NintendoClients README, commit `d0965c88`).
  Wikipedia reports that Nintendo attaches a unique identifier to every Switch and Switch 2 game card
  and has blocked consoles after duplicated cards were used (Wikipedia, Nintendo Switch 2, secondary).
  An emulator that connects to official servers exposes users to those measures (inference).

### Tests and sources

- The only test suite found for these systems is RPCS3's PS3 repository,
  which compares output with expected output "preferably from a real PS3"
  (RPCS3 ps3autotests README, prose of a walled source).
  None was found for the PS4, PS5, Xbox One, Series, Switch, or Switch 2, in the register or `R0-05` (research log).
- Maker documents are scarce.
  Sony's PS3 Linux documents (under the GNU Free Documentation Licence 1.2), IBM's and Toshiba's Hot Chips slides,
  Microsoft's Hot Chips 25 slides, Arm's manuals, AMD's Family 16h guide, Sony's patents,
  and Microsoft's controller specification are the maker material found.
  IBM's slides say that nothing in them operates "as an express or implied license"
  (Gschwind et al., slide 31),
  and Arm's manuals forbid reproduction
  (Arm, Cortex-A57 TRM, notice); facts from them are stated in this note's own words.
- No maker document was found for the PS4, PS5, or Xbox GPUs beyond Microsoft's slides, nor for the Tegra T239.
  AMD's instruction-set manuals for these GPU generations now sit on hosts the register does not list,
  and Nvidia's GPU documentation repository is unregistered
  (research log); both are proposed for the register in the pull request.
- Community references for these systems are reverse-engineered.
  SwitchBrew states no origin and no rule on leaked material (`R0-05`). psdevwiki's PS4 page on the executable wrapper
  says part of its layout came from a leaked kernel, so nothing after that statement was used, and its PS4 libraries
  page reads like a maker's manual, so it was not used (research log).

## Options and trade-offs

### Emulate the operating system at high level, or run the maker's system software

- **What:** answer the game's system calls and library or service requests in the emulator (HLE),
  or emulate the hardware and kernel interface and run the maker's own system modules from a dump (low-level emulation).
- **Costs:** HLE must follow a large interface that changes with versions, service by service;
  low-level emulation needs firmware and keys that `R0-02`, "Firmware, keys, and game copies", treats as unsettled,
  and must model hypervisors and security processors.
- **Gains:** HLE needs no maker code and skips the boot chain and security processors;
  low-level emulation reproduces the maker's behaviour, including its bugs.
- **Used by:** the Switch 2's own compatibility for Switch games
  (library hooks);
  RPCS3 by Wikipedia's account mixes kernel emulation with Sony's libraries from a published firmware file;
  shadPS4 loads some system modules from a dump.

### Where the high-level boundary sits

- **What:** the kernel's calls (PS3 LV2, Switch kernel calls), the system libraries
  (PS4 and PS5),
  or the services reached by messages (Switch); for the PS3,
  also whether Sony's libraries are emulated or loaded from the published firmware.
- **Costs:** a low boundary means running more guest code and modelling more kernel behaviour;
  a high boundary means reimplementing more of the maker's libraries.
- **Gains:** a low boundary is smaller and more stable; a high one runs faster and needs no maker modules.
- **Used by:** the evidence places the Switch boundary at services, because games carry their SDK,
  and the PS4's at the libraries (inference).

### How guest code is executed

- **What:** direct execution on a host of the same architecture
  (in-process or in a host virtual machine),
  or dynamic translation, or translation ahead of time of uploaded images (SPU programs).
- **Costs:** direct execution ties each system to one host architecture and needs traps for missing extensions;
  translation costs speed and needs memory-ordering work from x86 guests on Arm hosts.
- **Gains:** direct execution runs near native speed; translation runs anywhere.
- **Used by:** shadPS4 (direct, by its README); Ryujinx on Apple silicon
  (host virtual machine); FEX and Box64 for x86 programs on Arm hosts.

### The Cell's SPUs

- **What:** run SPU threads on host threads with blocking channels, or schedule them cooperatively;
  emulate 128-byte reservations exactly or approximately; perform DMA at once or deferred.
- **Costs:** exact reservations and deferred DMA cost speed; approximation fails games that race.
- **Gains:** exactness follows Sony's documented rules; approximation is simpler.
- **Used by:** RPCS3, whose approach was not readable in any source the register allows (research log).

### Shader translation and caching

- **What:** translate guest shader binaries to SPIR-V or another host form at draw time,
  with a persistent cache of translations; use host pipeline libraries or shader objects where available;
  pre-compile from a recorded list; or interpret on the GPU.
- **Costs:** run-time translation stutters on first use; caches are tied to emulator and host versions;
  a GPU-side interpreter for programmable guests is not described by any source read.
- **Gains:** caching removes repeated stutter; pipeline libraries reduce it.
- **Used by:** every emulator for these systems that Wikipedia describes translates shaders (secondary).

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
- **Used by:** the makers' own per-game boost modes and compatibility settings.

### Audio

- **What:** emulate the audio services and libraries at high level and render on the host, including spatial audio;
  or emulate audio processors with maker firmware.
- **Costs:** HLE must match each renderer revision's behaviour;
  low-level emulation needs firmware the project does not obtain; Dolby and DTS output raise licensing questions
  (`R0-02`, "Patents, recorded as risks").
- **Gains:** HLE is the only route the registered sources support.
- **Used by:** no open-tier emulator for these systems exists to show either (register).

### Online services

- **What:** leave online features out, replace them with the project's own services, or connect to the makers'.
- **Costs:** leaving out loses multiplayer and delivered content;
  replacing carries the server-emulator risk `R0-02` records; connecting exposes users to bans.
- **Gains:** leaving out is simplest and touches no service.
- **Used by:** yuzu replaced one Nintendo service (Wikipedia, Yuzu (emulator), secondary).

## Implications for Rustalgia

- The operating system is the main interface for every system here, so the family surveys `R1-14`, `R1-21`,
  and `R1-23` need to record which boundary each studied emulator chose and how it handles system-software versions.
  This feeds an ADR on high-level against low-level emulation of system software, and `R2-12`.
- The PS3, PS4, PS5, Switch, and Switch 2 have no open-tier emulator, and the Xbox One and Series have no hub
  (register; `R0-05`); the surveys will rest on prose and community wikis.
  This bears on `R6-01`, which weighs each system's risks.
- Guest architecture decides which host runs a system fastest: x86-64 hosts for the Sony and Microsoft systems,
  Arm64 hosts for Nintendo's, and translation everywhere for the PS3 (inference).
  This feeds `R2-01`, `R3-01`, `R4-08`, and the host notes in phase 3.
- Shader translation and caching are central GPU work for every system here.
  This feeds `R2-05` and `R4-05`, and a quality target on first-run stutter in `R6-02`.
- Every retail game here is encrypted, and the systems on sale change their software about monthly (as of 2026-11-20).
  The legal record in `R0-02` and the pace of change both feed `R6-01`.
- Unified memory near host size feeds the host requirements in phase 3 and `R6-02` (inference).

## Open questions

- What does IBM's SPU instruction-set document say about floating point and channels?
  Its copies are on third-party hosts; `R0-05` option 5 decides whether they may be read.
- How many cores and threads does a PS5, Xbox One, or Xbox Series game get?
  Not found; the family surveys.
- How do games place data in the Xbox One's ESRAM, and how does the One X run them?
  Microsoft's later Hot Chips slides, on an unregistered host.
- What are the Kraken and BCPack formats?
  No public specification was found; `R2-11`.
- Does the Cortex-A78C run 32-bit Arm code, and do any Switch games use it?
  Arm's manual, once its feature section is located; `R1-14`.
- What do AMD's instruction-set manuals and Nvidia's GPU documentation say, once their hosts are registered?
  A register change, then `R2-05`.
- What is the Xbox One and Series guest interface?
  No open-tier source was found; `R1-23`.
- What is the PS3 time-base frequency?
  Known here from memory only; `R1-21`.
- What do RPCS3 and shadPS4 emulate at high level and what do they load from firmware?
  Their prose beyond the README, in the family survey.
- May notes print the official software names that SwitchBrew records?
  A decision for the owner under the conventions on internal names.

## Sources

Every source below was read on 2026-11-20. psdevwiki was read from existing Wayback Machine captures,
because the live site refused automated requests; each capture's time stamp is given.

Maker documents and talks:

- Sony, PS3 Linux Distributor's Starter Kit: Linux Kernel Overview
  (revision 1.7),
  Application Programming Environment, and Cell Programming Primer chapters 1, 3, and 4, GFDL 1.2; and G.
  Levand's PS3-Linux README of 6 January 2024:
  `https://kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/LinuxKernelOverview.html` and sibling pages,
  `https://kernel.org/pub/linux/kernel/people/geoff/cell/README`.
- M. Gschwind et al., "Broadband Processor Architecture", Hot Chips 17 (2005):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T1.pdf`.
- S. Clark et al., "Cell Broadband Engine Interconnect and Memory Interface", Hot Chips 17:
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T2.pdf`.
- S. Sakai et al., "Programming and Performance Evaluation of the Cell Processor", Hot Chips 17:
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/2_Mon/HC17.S1/HC17.S1T4.pdf`.
- J. Sell and P.
  O'Connor, "Xbox One Main SoC and Xbox One Kinect", Hot Chips 25 (2013), slide images:
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf`.
- Arm, Cortex-A57 MPCore Technical Reference Manual, DDI 0488 issue H (2016):
  `https://documentation-service.arm.com/documentation/ddi0488/h/`.
- Arm, Cortex-A78C Core Software Optimization Guide, issue 1.0
  (2 November 2020): `https://documentation-service.arm.com/static/5fa2bd1eb1a7c5445f2906fd`.
- AMD, BIOS and Kernel Developer's Guide for Family 16h Models 00h-0Fh, 48751 revision 3.03:
  `https://www.amd.com/content/dam/amd/en/documents/archived-tech-docs/programmer-references/48751_16h_bkdg.pdf`.
- US 10,275,239 B2 (granted 30 April 2019) and US 10,235,219 B2
  (granted 19 March 2019),
  patent office images: `https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/10275239`
  and sibling document.
- Sony, open-source software pages for PS3, PS4, and PS5: `https://www.playstation.com/en-us/oss/ps4/` and siblings.
- Microsoft, "[MS-GIPUSB]: Gaming Input Protocol (GIP) Universal Serial Bus (USB) Extension", revision 1.0
  (16 September 2024), landing page and notice:
  `https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gipusb/e7c90904-5e21-426e-b9ad-d82adeee0dbc`.

Community references:

- SwitchBrew, raw pages: Hardware (revision 15339), Memory layout (12866), SVC (15416), NV services (15358),
  GPU (12795), GPU Classes (12790), GPU Shaders (12661), NPDM (15417), NSO0 (14440), ExeFS (1506), NCA (14983),
  Services API (15412), HIPC (14205), Secure Monitor (15437), Audio services (15352), HID services (15464),
  PPC services (12421), Applet Manager services (15266), VI services (15292), BCAT services (15401), Switch 2:
  Tegra T239 (15493), Switch 2: Hardware (14956), Switch 2: Compatibility Mode (15275), Switch 2: System Versions
  (15457): `https://switchbrew.org/w/index.php?title=SVC&action=raw` and sibling pages.
- psdevwiki, archived captures: PS3 RAM (2026-10-10), RSX (2026-10-13), CELL BE (2026-06-23),
  LV2 Functions and Syscalls (2026-08-18), PRX (2026-02-22); PS4 APU (2025-11-21), Southbridge (2026-06-16), Syscalls
  (2026-02-16), SELF File Format (2026-02-20); PS5 Hardware (2026-02-21), Kernel (2026-10-01), Hypervisor (2026-05-19):
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
  `sound/ppc/snd_ps3.c` (header and capabilities only) from the master branch:
  `https://raw.githubusercontent.com/torvalds/linux/master/Documentation/filesystems/spufs/spufs.rst` and sibling files.
- Mesa documentation, RADV and NVK ("Hardware docs", "External Hardware Documentation and Resources"):
  `https://docs.mesa3d.org/drivers/radv.html` and sibling pages.
- Khronos, Vulkan specification chapters "Pipelines" and "Devices and Queues", Vulkan Guide "Pipeline Cache",
  VK_EXT_graphics_pipeline_library and VK_EXT_shader_object proposals, and VkPresentModeKHR reference page:
  `https://docs.vulkan.org/spec/latest/chapters/pipelines.html` and sibling pages.
- Khronos, SPIR-V Specification, version 1.6 revision 8:
  `https://registry.khronos.org/SPIR-V/specs/unified1/SPIRV.html`.
- FEX README: `https://raw.githubusercontent.com/FEX-Emu/FEX/main/Readme.md`.
- Box64 README: `https://raw.githubusercontent.com/ptitSeb/box64/main/README.md`.

Prose of walled emulators:

- shadPS4 README, at commit `e82c3350`: `https://raw.githubusercontent.com/shadps4-emu/shadPS4/main/README.md`.
- RPCS3 ps3autotests README: `https://raw.githubusercontent.com/RPCS3/ps3autotests/master/README.md`.

Wikipedia, raw wikitext (tertiary; revision numbers in brackets):

- Cell (processor) [1386170292]; PlayStation 3 [1386319117]; PlayStation 3 technical specifications [1386319161];
  PlayStation 3 system software [1386319155]; RSX Reality Synthesizer [1318869943]; PlayStation 4 [1386319169];
  PlayStation 4 technical specifications [1386319175]; PlayStation 4 system software [1385538186];
  PlayStation 5 [1385515902]; Xbox One [1386323575]; Xbox Series X and Series S [1386594308];
  Xbox system software [1386323584]; Xbox Wireless Controller [1385359035]; Nintendo Switch [1384604421];
  Nintendo Switch 2 [1386314413]; Nintendo Switch system software [1381894756]; Nintendo Switch Online [1384839693];
  Zen 2 [1373859411]; Graphics Core Next [1384947614]; RDNA (microarchitecture) [1384343765];
  Micro stuttering [1385431095]; Variable refresh rate [1362871359]; RPCS3 [1384344878]; ShadPS4 [1383492990];
  Ryujinx [1376535915]; Yuzu (emulator) [1380070546]:
  `https://en.wikipedia.org/w/index.php?title=Cell_(processor)&action=raw` and sibling pages.
