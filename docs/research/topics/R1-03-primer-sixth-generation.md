---
title: "The sixth generation and the move to programmable graphics: primer"
roadmap_item: R1-03
status: draft
date: 2026-11-20
---

# The sixth generation and the move to programmable graphics: primer

## Summary

This note asks how the consoles and handhelds of the roadmap's sixth era work, and what that asks of an emulator.
The era moves graphics from fixed pipelines to configurable combiners and then to programmable shaders,
and brings multi-core processors, vector units, and resident system software.
Three things matter most to Rustalgia.
First, emulation here is translation: the faster guests need dynamic recompilation,
every major CPU has floating-point behaviour that host defaults do not reproduce,
and graphics become host shaders generated per configuration and cached.
Second, system software decides much of the design: high-level emulation of what games call avoids firmware,
and the open-tier emulators read mostly take that route.
Third, the Wii, Wii U, 3DS, PSP, Vita, and Xbox 360 encrypt their retail content, while GameCube, Dreamcast,
and PS2 games reach an emulator as plain images by the pages read, which bears on `R0-02`'s options.
No maker specification was found for any major graphics chip of the era.
This note is not legal advice.

## Scope

- Question: how do the machines of this era work, subsystem by subsystem, and what does each part ask of an emulator?
- Covered, as worked examples: the Dreamcast, PlayStation 2, GameCube, Wii, Wii U, Xbox, Xbox 360, PSP, Vita,
  and Nintendo 3DS, the systems whose family surveys depend on this item
  (`R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22`, `R1-23`);
  other systems of the period briefly, where they differ in kind.
  The era follows the roadmap's grouping of surveys, not console generations,
  so it includes seventh- and eighth-generation systems; the PlayStation 3 and later systems are `R1-04`'s.
- Left to other items: the catalogue of every system sold (`R1-07`);
  the DS and PlayStation 1 hardware inside the 3DS and PS2 (`R1-02`); the law on firmware, keys,
  and encryption (`R0-02`), cited by section name; each emulator in depth
  (the family surveys and emulator studies); techniques in depth (phase 2).
- Researched on 2026-11-20.
  Wiki pages are pinned by revision and repositories by commit where the source showed one;
  the Sources say where none was shown.
- How claims were checked: research agents fetched each source as raw text on 2026-11-20 and copied quotations from it.
  A second, independent pass fetched the sources again and tested each claim and quotation;
  its corrections were checked against the sources and applied,
  and the claims it could not check are listed in the pull request.
  A claim marked "(secondary)" rests on Wikipedia or another summary,
  "(from memory)" was not confirmed by a fetched page, "(inference)" is reasoning,
  "(lead)" rests on a personal page or forum, "(tested locally)" was counted with a local tool,
  and "(research log)" records an event while gathering evidence.
  A statement that nothing was found records the searches named, not proof of absence.
- Emulator projects' documentation and data are cited as implementations' accounts, not hardware facts;
  no emulator source code, firmware, key, kit, game, leaked material, or tainted source was opened.
  Patents were read from the patent office's copies, by optical recognition where needed.

## Findings

### Processors

#### PlayStation 2: Emotion Engine, vector units, I/O processor

- The Emotion Engine's core is a custom MIPS core (R5900) at 294.912 MHz that issues two instructions per cycle,
  with 128-bit general registers, 128-bit integer SIMD instructions, small caches, and a 16 KiB scratchpad
  (ps2tek, "EE Architecture").
  The same die carries two vector units, a 10-channel DMA controller, an MPEG decoder,
  and the paths to the graphics chip and the I/O processor
  (Wikipedia, Emotion Engine, secondary; Toshiba and Sony, Hot Chips 11 slides).
  None of these can be emulated alone, because they run concurrently.
- The core's FPU is single precision and, by ps2tek, departs from IEEE 754: no NaN or infinity, denormals read as zero,
  and rounding always towards zero, with a last-bit variation of which "the details on this are not well understood"
  (ps2tek, "IEEE 754 Differences"; ps2tek states no source).
  Results recorded on a console agree for addition: adding the largest pattern to itself returns `0x7fffffff`,
  where an IEEE unit gives infinity (ps2autotests, `tests/cpu/ee_fpu/arithmetic.expected`, results recorded on a PS2).
- Each vector unit has 32 registers of four 32-bit floats and executes an upper and a lower instruction per cycle;
  VU0 also acts as a coprocessor inside the core's instruction stream, and VU1 runs microprograms that games upload
  (Hot Chips 11 slides; ps2tek, "VU Architecture").
  Their pipeline is exposed: "Underneath the surface, the VU is full of quirks.
  This is partially because its pipeline is exposed to the program." (ps2tek, "VU Pipelining").
  A recompiler for them models per-instruction timing as well as results.
- The open-tier PS2 emulator's game database sets rounding and clamping per game: of 12,904 entries,
  215 set the core's rounding and 418 the vector units' clamping
  (PCSX2, `GameIndex.yaml`, counted locally; tested locally).
  These are an implementation's settings, read as data; they show
  that one global setting does not match the guest (inference).
- The core's caches are not coherent with DMA, and "Certain games are so buggy, however,
  that they require cache emulation to work" (ps2tek, "Cache Coherency").
- The I/O processor duplicates the PlayStation 1's CPU and runs slow I/O and PS1 compatibility
  (ps2tek, "PS2 Overview"), so it inherits the PS1's source problem, which `R1-02` records (`R0-05`, option 8).
  Wikipedia says later models replaced it with a PowerPC part
  (Wikipedia, PlayStation 2 technical specifications, secondary).

#### GameCube, Wii, and Wii U

- IBM describes Gekko as a PowerPC derivative at 485 MHz with a lockable half of the data cache,
  DMA from that locked cache, a write-gather pipe for graphics commands,
  and an IEEE 754 FPU that also does paired singles, two single operations per register
  (Sandon, IBM, Hot Chips 13 slides); most other sources say 486 MHz (Yet Another GameCube Documentation, 2.1).
  Quantised loads and stores convert small integers to floats by a type and scale held in registers
  (same slides; WiiBrew, "Paired single"),
  so a recompiler specialises on those registers or takes a slow path (inference).
- WiiBrew gives the reciprocal estimates as "Accurate to a precision of 1/4096."
  (WiiBrew, "Paired single"); no open prose source gives the exact bits.
  The open-tier emulator turns on extra floating-point accuracy for 24 of 1,887 titles' settings
  (Dolphin, `Data/Sys/GameSettings`, counted locally).
- Broadway (Wii) is upward-compatible with Gekko at 729 MHz (WiiBrew, "Hardware/Broadway"), and Espresso
  (Wii U)
  has three such cores at 1.243125 GHz, figures that "have not been officially confirmed"
  (Wikipedia, Espresso, secondary).
- The Wii and Wii U each add an ARM processor that runs the I/O and security system software
  (WiiBrew, "Hardware/Starlet"; WiiUBrew, "Hardware/Starbuck").
  An emulator runs that software on an emulated ARM, which needs code the project never holds,
  or reimplements its services.

#### Xbox and Xbox 360

- The Xbox CPU is a 733 MHz Pentium III variant for which no datasheet exists, by XboxDevWiki,
  and the console is a PC built from chipset parts apart from its security additions
  (XboxDevWiki, "CPU", "Xbox Hardware Overview").
  Microsoft's own Xbox emulation on the Xbox 360 was software:
  "Xbox 360's backwards compatibility had to emulate the exact configuration of an original Xbox"
  (Microsoft Xbox team blog, "On Backwards Compatibility", 2006).
- Microsoft gives the Xbox 360 CPU as three 3.2 GHz PowerPC cores, each "2-issue per cycle, in-order",
  with two hardware threads and a vector unit of 128 registers per thread
  (Hot Chips 17 slides), so six guest threads need a host with as many, or interleaving.
  Its vector unit is binary-compatible with a subset of AltiVec
  (Wikipedia, AltiVec, secondary),
  whose non-Java mode flushes denormals: "If an element in a source vector register contains a denormalized value,
  the value 0 is used instead" (Freescale, AltiVec Programming Environments Manual, Rev. 3, 3.2.1);
  whether the console runs only in that mode was not found.
- The open-tier emulator's documentation calls the CPU "a 64-bit PowerPC chip running in 32-bit mode",
  close to the PlayStation 3's PPE, and describes translating it through an intermediate form to x64
  (Xenia, `docs/cpu.md`; an implementation's account);
  one translator could serve both consoles (inference; `R1-04` holds the PS3).

#### Dreamcast

- The Dreamcast CPU is the Hitachi SH7750 (SH-4) at 200 MHz, a 32-bit RISC core with 16-bit instructions, an MMU,
  32 single-precision floating-point registers, and 8 KiB instruction and 16 KiB data caches
  (Comstedt, Dreamcast programming, SH-4 page; a lead, dated 2000).
- The maker's manual gives the floating-point modes: two banks of sixteen registers; status bits that select the bank,
  the transfer size, and single or double precision, so one opcode means a single or a double operation by mode
  (Renesas, SH-4 Software Manual, Rev. 6.00, 6.3).
  A recompiler keys its translations on that mode (inference).
- Its inner-product and matrix instructions round once and are approximate by design:
  "Geometric operation instructions perform approximate-value computations" (Renesas, SH-4 Software Manual, 6.6.1).
  The manual also lists errata in those instructions and in double-precision addition that apply to all SH-4 products
  (6.7.2 to 6.7.5).
  A host's arithmetic will not match bit for bit; whether games depend on the exact error was not found.

#### PSP and Vita

- Sony's 2004 slides give the PSP two MIPS cores, one with an FPU and a vector unit (VFPU) and one, the Media Engine,
  for codecs, plus 4 MB of embedded DRAM (Kurose and others, Sony, Hot Chips 16 slides).
- The VFPU's 128 registers are addressable singly or as rows, columns, and matrices,
  with prefixes that alter inputs and outputs; rounding is fixed to nearest, subnormals are flushed,
  and some overlapping matrix operations give wrong results that are behaviour, not undefined
  (vfpu-docs, `docs/introduction.md`, `docs/bugs.md`; its README says each statement has a test that runs on a PSP).
  "Sony did not release any public documentation (nor SDK/toolchain) for the Sony PSP" (vfpu-docs, README).
- Games reach the Media Engine only through libraries, which the open-tier emulator has emulated at a high level
  (PPSSPP, "The PSP Media Engine and its implementation").
- The Vita has four Cortex-A9 cores (Vita Development Wiki, "Main_Processor"),
  a media subsystem of eight Toshiba MeP cores
  (same wiki, "Venezia"), and a security processor, whose services an emulator would reimplement (inference).

#### Nintendo 3DS

- The original 3DS has a dual-core ARM11 MPCore at 268 MHz, "exactly twice the clock rate of the ARM9",
  and the New 3DS four cores that can run at 804 MHz when a title's header asks, with more memory
  (3dbrew, "Hardware" and "New_3DS").
  The New 3DS page says its list came from disassembling system modules, a firmware-derived origin,
  and the Hardware page cites unnamed "Official Documentation"; both facts need that caveat.
  Clock and memory depend on the model and on a per-title flag.
- One ARM11 core is reserved for the operating system, and the ARM9 serves mainly DS and DSi compatibility
  (Wikipedia, Nintendo 3DS, secondary); DS-mode hardware is `R1-02`'s.
  ARMv6 adds SIMD on general registers and exclusive loads and stores (Wikipedia, ARM11, secondary).

#### Across the era

- Every major CPU found here produces floating-point results host defaults will not reproduce, and vector register files
  (128 per thread on the Xbox 360, 128 with matrix views on the PSP)
  exceed a host's, so guest registers live in memory (inference from the findings above).
- Symmetric multi-core guests (Xbox 360, Wii U, 3DS, Vita) need the guest's memory ordering on the host; asymmetric ones
  (PS2, Wii, PSP) need synchronisation between unlike processors (inference).
- Guest clocks run from 200 MHz (Dreamcast) to three cores at 3.2 GHz
  (Xbox 360),
  and Wikipedia describes dynamic recompilation as common in such emulators
  (Wikipedia, "Dynamic recompilation", secondary).
  Self-modifying code and uploaded microprograms appear (ps2tek),
  so a recompiler needs invalidation tied to writes into code (inference).
- No maker-hosted manual was found for the main CPUs of the PS2, GameCube, Wii, Wii U, Xbox 360,
  or PSP in the register's sources or `R0-05`'s search, and no single-step test vectors for any of them;
  the only SH-4 vectors found were generated with another emulator (SingleStepTests sh4 README).

### Memory, buses, and storage

#### PlayStation 2

- The core reaches its 32 MB of main memory through cached, uncached, and "uncached and accelerated" windows,
  and its scratchpad only by virtual address; beside it sit the vector units' memories,
  2 MB of I/O-processor RAM it can read directly, 4 MB of graphics memory, and 2 MB of sound memory
  (ps2tek, "Memory Map").
  A 48-entry TLB written by software maps user addresses, with a bit that redirects a page to the scratchpad
  (ps2tek, "EE COP0 Memory Management").
- Sony gives the graphics chip's embedded DRAM a 2,560-bit width
  (Kutaragi, Sony, Hot Chips 11 keynote), which is why games re-read and rewrite the framebuffer freely (inference).
- The DMA controller moves 16 bytes per bus cycle on ten channels and walks linked lists of tags that games build;
  its address registers "update while a transfer is ongoing", and games read them
  (ps2tek, "DMA Controller (DMAC)", "DMAC Chain Mode").
  The graphics interface takes work from three paths in fixed priority, and ps2tek warns:
  "Emulating PATH3 masking without emulating the GIF FIFO will cause it to hang on a black screen,"
  (ps2tek, "GIF PATH3 Masking").
  DMA is concurrent state with arbitration, not a copy made when a register is written.
- Memory cards are flash with a file system, and "Certain games do not work if the memory card is larger than expected,
  for unknown reasons" (ps2tek, "SIO2 PS2 Memcards"); Wikipedia says they use Sony's MagicGate encryption (secondary),
  which an emulator bypasses at a high level, because the project holds no keys (`R0-02`).
- Results recorded on a console exist for the DMA controller and the vector interface (ps2autotests, `tests/dma`).

#### GameCube and Wii

- The GameCube has 24 MB of 1T-SRAM and a separate 16 MB audio RAM on a bus YAGCD calls "by far the slowest one,
  clocked at only 81MHz" (YAGCD, 2.4.2 and 2.5); its bus figures disagree between sections, so none is quoted alone.
- The CPU sees memory through fixed cached and uncached windows, the embedded framebuffer through its own,
  and the locked cache as a 16 KB scratchpad (YAGCD, 4.1).
  Audio RAM is not in the CPU's address space; a DMA engine and the DSP's "accelerator" reach it, with 32-byte alignment
  (YAGCD, 5.6; WiiBrew, "Hardware/DSP").
- The Wii adds 64 MB of GDDR3, and "The Wii does not have the ARAM chip; instead, DSP can access MEM1 or MEM2"
  (WiiBrew, "Memory map");
  its ARM processor can lock part of that memory against the main CPU,
  and its flash holds a file system encrypted with a per-console key (WiiBrew, "Hardware/Starlet", "Hardware/NAND").
  Emulators present saves as folders, which keeps keys out (inference).

#### Wii U

- WiiUBrew describes 2 GiB of DDR3 (MEM2), 32 MiB of fast memory (MEM1), and the old framebuffer memory (MEM0)
  (WiiUBrew, "Memory map"; "Hardware").
  The sources disagree on what MEM1 is: WiiUBrew says 1T-SRAM,
  and Wikipedia says embedded DRAM on the GPU and notes that Nintendo, IBM,
  and AMD never published detailed specifications (Wikipedia, Wii U, secondary).
- Titles run under a paging kernel that gives each process its own virtual map (WiiUBrew, "Cafe OS").
  The layouts on those pages are system software's, read from firmware, and are not recorded here;
  a high-level emulator reproduces the map the kernel gives a title rather than the hardware page tables (inference).

#### Xbox and Xbox 360

- The Xbox has 64 MB of memory shared by the CPU and the GPU
  (XboxDevWiki, "Memory"),
  a kernel closely related to Windows NT's that exports virtual-memory functions
  (XboxDevWiki, "Kernel"), and a standard IDE hard disk with its own file system (XboxDevWiki, "Hard Drive", "FATX").
- Microsoft describes the Xbox 360's 10 MB of embedded DRAM on the GPU as a way to take framebuffer
  and depth fill out of the unified memory (Hot Chips 17 slides, "Architectural Choices - EDRAM", "GPU Block Diagram").
  Its CPU caches use 128-byte lines and its first-level data caches are write-through
  (same slides, "CPU Data Streaming Specs").
- Free60 describes a hypervisor that runs in real mode and alone can reach all memory,
  while games run with translation on (Free60, "Hypervisor").
  An emulator implements the services the hypervisor and kernel give games rather than the hypervisor itself
  (inference; Xenia's documentation, under Processors, describes that approach).
- Early boards carry 16 MB of NAND flash and later ones 256 MB or 512 MB; the hard disk is optional
  (Free60, "NAND"; "HDD").

#### Dreamcast

- The Dreamcast has 16 MB of system RAM and 8 MB of video RAM (dreamcast.wiki, "Memory map"; Comstedt, memory map).
  The SH-4 uses 32-bit logical addresses over a 29-bit physical space whose top bits select caching and mapping
  (dreamcast.wiki, "Memory map"),
  and its MMU has a 64-entry unified TLB (Renesas, SH7750 Group User's Manual: Hardware, Rev. 7.02, section 1).
  The video RAM is seen through two windows that arrange the same memory differently (dreamcast.wiki, "VRAM").
- The memory card, the VMU, is itself a small computer with an 8-bit Sanyo CPU and flash memory
  (dreamcast.wiki, "VMU hardware overview").
  Emulating saves fully means emulating a second machine; a high-level card is the alternative (inference).

#### PSP and Vita

- The PSP's CPU has no TLB (YAPSPD, 4.3.1 and 7.1), one 32 KB cache, and no hardware coherence with DMA (YAPSPD, 4.10).
  Its 4 MB of embedded DRAM is two 2 MB blocks, one in the graphics chip and one in the Media Engine
  (YAPSPD, chapter 2 and the chapter 3 parts list),
  and its video memory appears mirrored at several offsets that change how the depth buffer reads back (YAPSPD, 10.2).
  YAPSPD's preface warns that it may be wrong.
- The Vita has 512 MiB of DRAM on two channels plus video memory
  (Vita Development Wiki, "Physical Memory"),
  and DMA controllers some of which also encrypt or hash while copying (same wiki, "DMAC").
  Its memory card speaks the Memory Stick protocol (same wiki, "Memory Card").

#### Nintendo 3DS

- The ARM11 cores see 128 MB of FCRAM, 256 MB on the New 3DS, plus video memory, DSP memory, and a shared work RAM,
  and the ARM9 sees the same plus memory of its own (3dbrew, "Memory layout").
  3dbrew says its account of the New 3DS's extra memory rests on disassembly of system modules
  (3dbrew, "New 3DS"), so those values are not recorded here.
- The 3DS has three DMA systems, one on the ARM9 and Arm CoreLink engines on both sides
  (3dbrew, "NDMA Registers"; "Corelink DMA Engines").
  Its NAND and SD contents are encrypted
  (3dbrew, "Flash Filesystem"; "SD Filesystem"),
  so emulators present title storage decrypted by the user's own tools or as folders (inference; `R0-02`).

#### Patterns

- Every worked example pairs a large general pool with a small fast pool beside the GPU: the PS2's graphics DRAM,
  the GameCube and Wii embedded framebuffer, the Wii U's MEM1, the Xbox 360's embedded DRAM, the PSP's embedded DRAM,
  and the 3DS's video memory (inference from the findings above).
  The original Xbox is the exception: one shared 64 MB pool.
- Address translation ranges from none on the PSP, through fixed segments and block mappings, to software TLBs
  (PS2, Dreamcast)
  and paging kernels (Xbox 360, Wii U, Vita);
  and keeping caches coherent with DMA is the software's job on the PS2 and PSP (inference from the findings above).
  An emulator chooses for each system whether to model translation in hardware terms or to provide the mappings
  that system software gives a title.

### Graphics

#### How the era's graphics are documented

- No maker specification was found for any major graphics chip of the era among the register's sources
  and `R0-05`'s search; the record is wikis, maker talks and patents, and emulator projects' writing.
- The era runs from fixed pipelines (Dreamcast, PS2, PSP) through configurable combiners
  (GameCube, Wii, Xbox)
  to programmable shaders (Xbox 360, Vita, Wii U),
  and "PICA200 is compatible with OpenGL ES 1.1." with a programmable vertex stage
  (3dbrew, "Hardware"; the arc is inference from the findings below).

#### PlayStation 2: Graphics Synthesizer

- The Graphics Synthesizer holds framebuffer, textures, and depth buffer together in 4 MB of embedded memory,
  and ps2tek says "the GS only supports single-pass texturing and is entirely fixed-unit." (ps2tek, GS chapters).
  Sony's 1999 keynote gives its throughput and memory width (Kutaragi, Hot Chips 11 keynote).
- Its blend unit has one fixed equation with selectable inputs, and "Internally,
  alpha-blending treats each color component as 9-bit.
  The output is then clamped accordingly by COLCLAMP."; with clamping off it keeps only the low bits, so results wrap
  (ps2tek, GS blending).
  Host blend units saturate, so wrapping and 9-bit arithmetic need shader work (inference).
- ps2tek documents techniques that rely on the memory layout,
  among them masking that a modern GPU cannot express directly: "modern GPUs mask on the byte level,
  but games can mask on the bit level,
  which requires a slow fragment shader to process the effect correctly
  if the game doesn't fully mask on the byte level." (ps2tek, GS special effects).
  The memory is not linear: each format is arranged differently within pages
  (same chapters), so a game that reads one format as another forces the emulator to convert between layouts.
- The GS draws points, lines, strips, fans, triangles, and two-vertex rectangles,
  and has two display read circuits that compose the output (ps2tek, GS primitives and display).
  Geometry reaches it from the vector units through the three-path interface described under Memory.
- The open-tier PS2 emulator's game database carries per-game options for its hardware renderer,
  such as blending accuracy levels (PCSX2, `bin/docs/GameIndex.pdf`; an implementation's options),
  which shows that no single host configuration fits every title (inference).

#### GameCube and Wii: the texture environment

- Nintendo's patent describes a texture-environment unit of "Up to sixteen independently programmable consecutive
  stages, forming a chain of blending operations", on values it gives as "unsigned 8-bit values or signed 10-bit values
  but other implementations could provide different precisions." (US 7,034,828, Nintendo, patent office copy read by
  optical recognition).
  The Dolphin team writes that 32-bit floating point on PC GPUs is not precise enough to reproduce the hardware's 24-bit
  integer results (Dolphin blog, "Pixel Processing Problems", 2014, capture of 2026-07-01).
- Dolphin turns each configuration into a host shader, and "shaders have to be compiled, which takes time";
  its answer runs a general shader while the specialised one compiles: "Under Hybrid Mode,
  whenever a new pipeline configuration appears,
  Dolphin will use the already compiled Ubershaders to immediately render the effect without stuttering"
  (Dolphin blog, "Ubershaders", 2017, capture of 2026-11-03).
- The GPU renders into "a special 2MB chunk of memory on the GPU itself, separate from the shared main memory",
  then copies frames to main memory, and some games alter frames there
  (Dolphin blog, "To the Screen with Hybrid XFB", 2017, capture of 2026-05-24).
  The Wii's graphics unit is the GameCube's at a higher clock (WiiBrew, "Hardware/GX").

#### Dreamcast: tile-based rendering

- "The Tile Accelerator divides the scene into 32 by 32 pixel tiles, which can be rendered individually."
  (Comstedt, Dreamcast programming, "PowerVR"; a lead).
  A VideoLogic patent of 1995 describes deciding per pixel, within screen regions, which surface is visible
  (US 5,729,672, VideoLogic, read from the patent office copy).
- Wikipedia says the method "allows for correct rendering of partially transparent polygons,
  independent of the order in which they are processed" (Wikipedia, PowerVR, secondary).
  A host GPU draws in submission order, so order-independent transparency must be emulated (inference).

#### Xbox: NV2A

- XboxDevWiki places the NV2A in NVIDIA's family of the GeForce3 (XboxDevWiki, "NV2A").
  Its vertex stage follows NVIDIA's vertex-program extension "with some" differences,
  and its pixel stage is texture shaders plus register combiners
  (XboxDevWiki, "NV2A/Vertex Shader", "NV2A/Pixel Combiner").
- NVIDIA's own extension texts describe those stages; one notes a precision detail outside its main text:
  "The fact that NV10 does the computations as 9-bit signed fixed point is not mentioned in the spec."
  (NVIDIA, `NV_register_combiners`, Khronos registry).
  Matching the combiners' fixed-point arithmetic in host shaders is the NV2A's version of the GameCube's precision
  problem (inference).
- The walled-tier Xbox emulator says it emulates the original hardware at a low level (xemu home page, prose).

#### Xbox 360: Xenos and its embedded DRAM

- Microsoft gives Xenos as a 500 MHz GPU with "48 parallel shader cores (ALUs); dynamically scheduled; 32bit IEEE FLP",
  with 10 MB of embedded DRAM meant to "Take FB/ZB fill-rate out of the equation" (Hot Chips 17 slides).
  Free60 relates it to ATI's R500 series (Free60, "Xenos (GPU)").
- The open-tier emulator's developers write: "The Xbox 360 allows games to draw only to eDRAM — after drawing,
  resolving ... is necessary to write the result to the back buffer for presentation or to a texture
  for subsequent usage in shaders." (Xenia, "Leaving No Pixel Behind", 2021).
  The article gives the eDRAM's tile size and storage formats, and reports that 24-bit floating-point depth,
  emulated as 32-bit on the host, must survive round trips through eDRAM (same article).
  Emulating the resolve step and the console's own formats is where most of the work lies (inference).
- The same project states the origin of its GPU knowledge and its rule:
  "The writer of this post has never used the Xbox 360 XDK for any purpose,
  and contributions based on information obtained from the XDK are not allowed." (same article).
  Its documentation says the GPU runs commands from a ring buffer in system memory (Xenia, `docs/gpu.md`).

#### PSP

- Sony's slides give a rendering engine and a surface engine at 166 MHz (Hot Chips 16 slides).
  YAPSPD says each command is a 32-bit word with an 8-bit command and a 24-bit argument,
  and that "Floats processed in the command-stream are 24 bits instead of 32 that are used by the CPU."
  (YAPSPD, chapter 10).
- The open-tier PSP emulator's change log records rendering a software depth buffer alongside the hardware renderer to
  fix specific effects (PPSSPP, README), one case of reading back what a host GPU does not expose.

#### Nintendo 3DS: PICA200

- The PICA200 is driven by command buffers that write internal registers; its fragment stage is fixed,
  with six texture-combiner stages and per-pixel lighting from tables
  (3dbrew, "GPU/Internal Registers", "GPU/Fragment Lighting").
  Its vertex shader instruction set "seems to have been heavily inspired by" Microsoft's `vs_3_0`
  (3dbrew, "GPU/Shader Instruction Set").
- 3dbrew: "The PICA200 is not IEEE-compliant.
  It has positive and negative infinities and NaN, but does not seem to have negative 0.
  Input and output subnormals are flushed to +0." (3dbrew, "GPU/Shader Instruction Set").
- The top screen shows two framebuffers in 3D mode: "Top screen uses AB interlacing in 3D mode
  (with 3D slider enabled), and A mode (no interlacing) in 2D mode." (3dbrew, "LCD Registers").
  The GPU renders into tiled buffers that a transfer engine converts for display (3dbrew, "GPU/External Registers").
- The developers of the open-tier 3DS emulator's predecessor wrote in 2018: "As it stands,
  only a portion of the PICA200 emulation is running on the GPU; most of it is running on the CPU!"
  (Citra site archive, "Hardware Renderer Updates").
  Moving fixed-function lighting and combiners into generated host shaders was their later work (same archive).
- 3dbrew's register list carries a column headed "Official Name",
  whose names have a form that suggests a maker's document
  (3dbrew, "GPU/Internal Registers"; inference);
  the wiki does not say where they came from, so the names are not used here.

#### Vita and Wii U

- The Vita carries a four-core PowerVR SGX543MP4+.
  The Vita Development Wiki compares the GPU's kernel module with the open-source Linux PowerVR kernel module
  (Vita Development Wiki, "GPU", read from a capture of 2026-10-22).
  Games reach it through the `SceGxm` library
  (same wiki, "SceGxm", capture of 2025-11-26),
  so a high-level emulator implements that library over a host API (inference).
- WiiUBrew relates the Wii U's GPU to AMD's Radeon R7xx family and says:
  "While documentation perfectly matching the card is yet to be found,
  several documents can be brought together to form a reasonable picture of the register layout."
  (WiiUBrew, "Hardware/GX2").
  The closest maker documents would be AMD's for that desktop family;
  the copies tried redirected to a portal page that needs a script to load, and were not read (research log).

#### What host-GPU emulation needs, across the era

- Vulkan lets a program keep compiled pipelines:
  "Pipeline cache objects allow the result of pipeline construction to be reused between pipelines
  and between runs of an application." (Khronos, Vulkan, `VkPipelineCache`).
  An extension lets parts of a pipeline be compiled separately and linked later
  (Khronos, `VK_EXT_graphics_pipeline_library`), which bears on the stutter Dolphin describes (inference).
- Blending that host hardware cannot express can move into the fragment shader:
  with the fragment shader interlock extension,
  "applications may be able to execute programmable blending operations in the fragment shader,
  where the destination buffer is read via image loads and the final value is written via image stores."
  (Khronos, `VK_EXT_fragment_shader_interlock`).
  Dual-source blending and logic operations are optional device features
  (Khronos, `VkPhysicalDeviceFeatures`),
  so the set of hosts that can run an accurate renderer depends on them (inference).
- The era's GPUs compute in formats hosts do not: integer texture-environment arithmetic (GameCube), 9-bit blends
  (PS2, NV2A combiners), 24-bit floats (PSP commands, Xbox 360 depth), and non-IEEE shaders (3DS) (findings above).
  Across the projects read, emulators decode the command stream, track guest graphics memory in the console's layout,
  generate host shaders per configuration, and cache them (inference from the emulator writing cited above).

### Audio

- Audio in this era takes four forms (inference from the findings below):
  a programmable DSP whose program the game or its library uploads
  (GameCube, Wii, 3DS, the Xbox's two effects DSPs, and the Dreamcast's ARM7);
  a fixed voice synthesiser with no user program
  (PS2, the Xbox's voice processor, the 3DS's second sound unit);
  a fixed decoder plus mixing in software on the main CPU
  (Xbox 360, and by their libraries the PSP and Vita);
  and a DSP that runs fixed microcode from ROM under the system software (Wii U).
  The first form is where high-level against low-level emulation matters most.

#### GameCube and Wii

- "At the heart of the GCN audio hardware is a custom digital signal processor (DSP)
  which is largely dedicated to pitch modulation and the mixing of voices and effects data." (YAGCD, 5.6).
  YAGCD gives it an 81 MHz clock; Nintendo's patent gives 100 MHz as an example (US 6,606,689, patent office copy).
- Its program is not fixed: "During system initialization, a runtime audio library is downloaded to audio DSP 156."
  (US 6,606,689, column 8).
  The open-tier emulator reimplements the common program families at a high level
  and says "LLE uses DSP ROM files to emulate the DSP's hardware behavior."
  (Dolphin wiki, "Audio Emulation"); its replacement DSP ROM is closed in the register.
- On the Wii, "ARAM does not physically exist in Wii hardware."
  (WiiBrew, "Hardware/DSP"),
  and on the Wii U, WiiUBrew says the DSP "always runs the same microcode from ROM rather than being per-title",
  marked for checking (WiiUBrew, "Hardware/DSP").

#### Nintendo 3DS

- The 3DS's Teak-family DSP runs a program the title supplies, which "requires RSA-signed DSP firmware"
  (3dbrew, "DSP:LoadComponent"),
  and talks to the game through shared memory; a second sound unit can play at the same time
  (3dbrew, "DSP Memory Region", "DSP Services").
- The developers of the open-tier emulator's predecessor built high-level audio by tracing shared memory,
  modelled on the most common program, and found that games with another program broke
  (Citra site archive, "HLE Audio Comes to Citra", 2016; "Accurate Audio Emulation Has Arrived", 2018).
  Of their low-level emulator they wrote "When it comes to writing an LLE DSP emulator, it's all or nothing."
  (same post of 2018); it ships testers that run on a 3DS (Teakra, README).
  Both projects kept high-level emulation as the default,
  and Dolphin's wiki says "all sound issues need to be confirmed with LLE." (Dolphin wiki, "Audio Emulation").

#### PlayStation 2

- The SPU2 is a fixed-function sound processor of two cores with 24 voices each and 2 MB of its own RAM,
  attached to the I/O processor with its own DMA channels
  (ps2tek, SPU2 register map and AutoDMA).
  ps2tek names a game that reuses one buffer for sending and receiving through a library
  (ps2tek, SPU2 AutoDMA), a case where DMA timing reaches the audio path.
  Sound reaches the SPU2 through the I/O processor's modules,
  so high-level emulation of those modules is an alternative to running them (inference).

#### Xbox and Xbox 360

- The Xbox's audio processing unit has a fixed voice processor for up to 256 voices and two programmable DSPs,
  one for effects and one for output encoding,
  and "All audio processing by the APU is typically done in 24bit PCM at 48000Hz." (XboxDevWiki, "APU").
  Its programs ship with the game: "The EP code is loaded by DirectSound.
  The EP is not programmable using DirectSound APIs." (same page).
  The walled-tier emulator says "Surround Sound isn't implemented in xemu yet." (xemu, FAQ).
- Microsoft's block diagram places an XMA decoder in the Xbox 360's I/O chip
  (Hot Chips 17 slides),
  and Wikipedia says "Sound files for games are encoded using Microsoft's XMA audio format."
  (Wikipedia, Xbox 360 technical specifications, secondary).
  Mixing and effects otherwise run in software on the CPU
  (from memory; the Microsoft page that says so was seen only in a search summary).

#### Dreamcast

- The AICA is a Yamaha sound processor related to the Saturn's SCSP, with 64 channels and an ARM7 core of its own
  (Sega Retro, "AICA", secondary: the article is marked for cleanup; dreamcast.wiki, "Hardware overview").
  The ARM7 runs a program the game uploads, so the AICA joins the uploaded-program class (inference).

#### PSP and Vita

- Games reach PSP and Vita audio through system libraries
  (YAPSPD, chapter 12, which gives a 44,100 Hz rate; Vita Development Wiki, "SceAudio", "SceNgs"),
  which a high-level emulator reimplements (inference).

#### What audio asks of an emulator

- In the projects read, audio is decoupled from emulation speed:
  Dolphin's FAQ treats audio stutter as a performance problem eased by time-stretching at some cost in latency,
  and names the DSP as one of three tasks that run well on separate host threads (Dolphin, FAQ).

### Timing, synchronisation, and input

#### Processors in parallel

- Interrupt controllers route sources to two processors:
  the Wii's is "capable of routing up to 32 interrupt sources to either the Starlet, the PowerPC, or both"
  (WiiBrew, "Hollywood/IRQs").
- Clock ratios change with the mode: in GameCube mode on the Wii "Hollywood is now at 162 MHz,
  and Broadway is now at 486 MHz" (WiiBrew, "Broadway/Clock Speed Control"),
  and the New 3DS uses its higher clock while the HOME Menu runs and otherwise only for software that asks in its header
  (3dbrew, "Hardware").
  The 3DS's clocks are exact ratios, the ARM11 at "exactly twice the clock rate of the ARM9" (3dbrew, "Hardware").
  Components therefore need a shared time base.
- The PS2 core's two interrupt inputs come from the interrupt controller and the DMA controller
  (ps2tek, EE interrupts),
  and in PS1 mode "the IOP is underclocked to 33.8688 MHz" (ps2tek, "BIOS PlayStation Compatibility").

#### Frame timing

- ps2tek gives the PS2's raster as 262 lines per frame for NTSC and 312 for PAL,
  with a fixed count of bus cycles per line
  (ps2tek, GS display timing);
  from those figures the NTSC frame rate is about 59.95 Hz for an interlaced field of 262.5 lines
  (calculated from the figures).
  The GameCube's video interface uses a 27 MHz video clock, or 54 MHz for progressive output, separate from the CPU's
  (YAGCD, 5.2); the 3DS's display timing is a divider of its own clocks (3dbrew, "LCD Registers").
  On the PS2 and 3DS the frame rate is therefore a fixed fraction of the CPU clock, and on the GameCube it is not
  (inference from these figures).
- The GameCube's video interface has four display-interrupt registers that fire at programmed positions
  (YAGCD, 5.2), so games time work against the beam even on this era's hardware.
- The 3DS's top screen refresh and the PS2's and GameCube's region modes give rates that are not exactly 60 Hz
  or 50 Hz in the figures read (findings above; calculated), which bears on frame pacing on host displays (`R2-07`).

#### Input

- On the 3DS a system module writes buttons, Circle Pad, touch, and motion into shared-memory ring buffers
  (3dbrew, "HID Shared Memory"),
  and on the Wii system software on the ARM handles Bluetooth
  (WiiBrew, "Hardware/Starlet"), so high-level emulation of input means writing those buffers (inference).
- The GameCube polls its controller ports in hardware at a line interval tied to video,
  of which "7 is the minimum setting" (YAGCD, 5.8; Nintendo's US 6,609,977 describes the same interface).
- The Wii Remote is a Bluetooth HID device with buttons, an accelerometer,
  an infrared camera that tracks up to four points, and extensions
  (WiiBrew, "Wiimote"); the sensor bar only carries LEDs (Wikipedia, Wii Remote, secondary).
  The Wii U GamePad streams compressed video and audio over a custom 5 GHz link and runs its own firmware
  (WiiUBrew, "GamePad", "GamePad/LVC").
  Neither has a host equivalent, so an emulator passes a real device through or synthesises reports (inference).
- Of PS2 controllers' port controller ps2tek writes "A good portion of SIO2 is a mystery" (ps2tek, "SIO2 Registers").
  Xbox controllers are USB: "XIDs are USB devices." (XboxDevWiki, "Xbox Input Devices").
  Dreamcast peripherals sit on four Maple buses with no presence line
  (Comstedt, "Maple bus"), and its memory card, the VMU, has "A Sanyo LC86K87 8-bit cpu" (Comstedt, VMS pages).

#### Networking

- Network hardware is an add-on on most of these systems
  (Wikipedia, console articles, secondary),
  and their online services have ended or changed, so networking is left out or reconnected to replacements
  (inference; `R2-09`).

### Media, security, and system software

This section describes what an emulator meets, at the level public sources describe it.
The law is in `R0-02` ("Anti-circumvention law in the United States", "Firmware, keys, and game copies");
this note does not repeat it, and records no key, key layout, or secret value.

#### Discs and what arrives as a plain image

- The GameCube's disc content is scrambled and descrambled by the drive
  (YAGCD, chapter 13),
  and "Dolphin does not include the GameCube Main Menu by default, and it doesn't need it"
  (Dolphin wiki, "GameCube Main Menu").
- The Dreamcast's GD-ROM has standard and high-density regions
  (Comstedt, "GD-ROM");
  at boot its ROM checks part of the disc's bootstrap byte by byte against a copy of its own
  (Comstedt, "IP.BIN and 1ST_READ.BIN").
- The PS2's BIOS sets up the hardware and copies a small kernel into RAM, and "Unlike the EE,
  the IOP does not have a monolithic kernel" (ps2tek, BIOS sections).
  The PSP's UMD standard leaves protection outside it (Ecma-365, 1st edition).
- By the pages read, GameCube, Dreamcast, and PS2 games reach an emulator as plain images,
  and Xbox executables are signed with no page saying they are encrypted
  (inference, partly from silence);
  Wii, Wii U, 3DS, PSP, Vita, and Xbox 360 retail content is encrypted under keys held in the console
  (WiiBrew, "Ticket"; WiiUBrew, "Disc drive"; 3dbrew, "NCCH"; YAPSPD, chapter 20; Vita Development Wiki, "Security";
  Free60, "XEX").
  This sorts the systems by `R0-02`'s options 1 to 3 (inference); which applies is the owner's decision.

#### Boot chains and security processors

- Several systems boot through a chain of encrypted, verified loaders that starts in a mask ROM:
  the Wii and Wii U on their ARM processors
  (WiiBrew, "Boot0" introduction; WiiUBrew, "Boot process"),
  the 3DS from boot ROMs on both processors
  (3dbrew, "FIRM"),
  the Xbox from bootstrap code in its I/O chip, which a Microsoft patent describes
  (US 6,907,522, Microsoft, patent office copy), and the Xbox 360 from a loader inside the CPU (Free60, "Boot_Process").
  The Vita's root of trust is a separate security processor (Vita Development Wiki, "Security").
- Free60 writes: "In case of the Xbox 360, the hypervisor is responsible for encryption,
  decryption and the enforcement of" its security policy (Free60, "Hypervisor").
- None of these chains needs to run for a game to run in the emulators read:
  the open-tier emulators boot games without the maker's boot firmware, except that PCSX2 requires a BIOS dump,
  and the walled-tier xemu requires the Xbox's boot ROM image, flash image, and hard disk image
  (PCSX2, README; xemu, "Required Files").
  The 3DS and Vita emulators run some games better with maker system files
  (Citra site archive, FAQ; Vita3K, README, prose of a walled emulator).

#### System software that games call

- Where system software lives decides what high-level emulation replaces
  (inference from the sources here):
  the GameCube game links its own operating system
  (YAGCD, memory-map chapter);
  the Wii serves games from IOS, which "is not a "hypervisor", as it runs on a dedicated, separate CPU."
  (WiiBrew, "IOS");
  the Wii U runs Cafe OS on the CPU and IOSU on the ARM
  (WiiUBrew, "Cafe OS");
  the PS2 has a kernel in RAM and loadable I/O modules (ps2tek); the PSP, Vita,
  and 3DS load modules or services that games import by name
  (YAPSPD, chapter 8; Vita Development Wiki, "Modules"; 3dbrew, "Services");
  the Xbox runs a kernel derived from Windows NT and the Xbox 360 a hypervisor and kernel
  (XboxDevWiki, "Kernel"; Free60, "Kernel").
- Named, dynamically linked interfaces
  (PSP, Vita, Wii U, 3DS, Xbox 360)
  suit high-level emulation; statically linked libraries
  (GameCube, Wii, Xbox) push it down to recognising library code, or toward hardware (inference).
- The emulators read say which they do: "No BIOS file required to play, PPSSPP is an "HLE" emulator."
  (PPSSPP, README); "Play!
  uses a built-in high-level emulation BIOS."
  (Play!, README); "Xenia implements all kernel APIs as native functions under the host." (Xenia, `docs/kernel.md`).
  Xenia's contributing guide bans Microsoft's development kits as a source (Xenia, `.github/CONTRIBUTING.md`).

#### Pages next to restricted material

- Open wiki pages in this area sit beside firmware listings, key layouts,
  and pseudo-code of boot ROMs written from dumps;
  the research for this note read only the introductions of such pages and recorded nothing from them (research log).
  `R0-05` records the same pattern ("Patterns across the hubs").

## Options and trade-offs

The options answer separate questions and can be combined, and the answer can differ by system.
Options 1 and 2 concern system software, 3 and 4 audio processors, 5 to 7 graphics, 8 to 10 processors,
and 11 protected content.

### 1. High-level emulation of system software

- **What:** implement the services games call
  (kernel functions, libraries, I/O-processor modules, IOS requests) as host code, and run no system software.
- **Costs:** each interface must be reimplemented and kept compatible with what games expect;
  statically linked libraries (GameCube, Wii, Xbox) offer no clean boundary.
- **Gains:** no firmware needed; fast; the path the open-tier emulators for the PSP, PS2
  (in Play!), Xbox 360, and 3DS describe.
- **Used by:** PPSSPP, Play!, Xenia, Azahar, by their own documentation.

### 2. Low-level emulation of system software

- **What:** emulate the hardware fully and run the console's own boot code and system software, supplied by the user.
- **Costs:** needs firmware the project never holds, which `R0-02` records as unsettled law;
  boot chains include security processors and encryption; slower.
- **Gains:** behaviour matches the console wherever the hardware model is right.
- **Used by:** PCSX2, which requires a BIOS; xemu, which requires boot ROM, flash, and disk images.

### 3. High-level emulation of audio DSP programs

- **What:** recognise the program a game uploads to its audio DSP and reimplement its effect on the host.
- **Costs:** every program family must be identified; games with an unusual program break (Citra's account).
- **Gains:** no DSP ROM needed; fast.
- **Used by:** Dolphin and Azahar by default.

### 4. Low-level emulation of audio DSPs

- **What:** emulate the DSP's instruction set, memory, and peripherals, and run the uploaded program.
- **Costs:** "all or nothing" by Citra's account; needs the DSP's own ROMs or a replacement, which the register closes;
  slow at first release.
- **Gains:** runs any program; serves as the reference for checking high-level emulation.
- **Used by:** Dolphin and Azahar as an option.

### 5. A specialised host shader for each guest configuration

- **What:** generate and compile a host shader for each combiner, blend, and vertex configuration a game sets.
- **Costs:** compilation stalls when a new configuration appears; a cache must be kept per game and per driver.
- **Gains:** fast once compiled.
- **Used by:** Dolphin, Citra, and others, by their own writing.

### 6. A general shader that interprets the configuration

- **What:** one large host shader that reads the guest's configuration as data,
  used alone or while specialised shaders compile.
- **Costs:** slower per pixel; heavy on host GPUs.
- **Gains:** no compilation stall for new configurations.
- **Used by:** Dolphin's "ubershaders", alone or in hybrid mode.

### 7. Precision and blending: host fixed function or shader emulation

- **What:** use host blending and floating point where they agree with the guest, or emulate the guest's integer,
  wrap-around, 9-bit, and 24-bit arithmetic in shaders, including blending in the fragment shader.
- **Costs:** shader emulation is slower and needs optional host features such as fragment-shader interlock.
- **Gains:** fixes effects that depend on the guest's arithmetic.
- **Used by:** per-game options in PCSX2 and Dolphin; Xenia's work on depth formats.

### 8. Floating point: host defaults, per-game settings, or bit-exact software

- **What:** run guest arithmetic on the host FPU, adjust it by per-game rounding and clamping,
  or emulate the guest's rules exactly in software.
- **Costs:** host defaults break games; per-game settings need a database; bit-exact emulation is slow.
- **Gains:** in that order, speed, compatibility for listed titles, and correctness everywhere.
- **Used by:** PCSX2 and Dolphin use per-game settings.

### 9. Interpreter, block recompiler, or recompiler through an intermediate form

- **What:** interpret guest instructions; translate blocks directly to host code;
  or translate through an intermediate form with optimisation passes.
- **Costs:** an interpreter cannot keep up with the faster guests of the era
  (inference from the clock figures);
  recompilers need invalidation for code that changes, and a back end per host architecture.
- **Gains:** in that order, simplicity, speed, and portability of optimisation.
- **Used by:** Xenia describes an intermediate form; Wikipedia names several console emulators that recompile.

### 10. Host threads for guest processors

- **What:** run each guest processor (or core, or hardware thread) on its own host thread, or interleave them on one.
- **Costs:** threads need the guest's memory ordering and atomic operations and careful synchronisation;
  interleaving is slower for symmetric multi-core guests.
- **Gains:** threads use host cores; interleaving is deterministic.
- **Used by:** Dolphin names CPU, GPU, and DSP as tasks that run well on separate threads.

### 11. Plain images only, or content that the user decrypts

- **What:** support only systems whose games arrive as plain images,
  or accept content the user has decrypted with their own tools.
- **Costs:** the first leaves out the Wii, Wii U, 3DS, PSP, Vita, and Xbox 360; the second is `R0-02`'s option 3,
  with its risks.
- **Gains:** the first keeps the project away from decryption; the second covers the era.
- **Used by:** `R0-02` records which projects do which.

## Implications for Rustalgia

- System software is the deciding question for most of this era.
  Options 1 and 2 feed `R2-12` (firmware and system software) and an ADR on firmware; each survey
  (`R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22`, `R1-23`)
  needs to record where its system's software lives and what interface games call.
- Graphics emulation here is translation to host GPUs.
  Options 5 to 7 feed `R2-05` (3D hardware and shader compilation) and `R4-05`
  (graphics libraries),
  and the optional Vulkan features they need bear on which hosts can run an accurate renderer (`R3-05`, `R3-12`).
- Every major CPU of the era has floating-point behaviour hosts do not match, and the faster guests need recompilation.
  Options 8 to 10 feed `R2-01` (CPU execution) and `R4-08`
  (recompilation in Rust); the iOS limit on dynamic recompilation (`R3-01`) weighs hardest on this era and the next.
- Encrypted content separates the era's systems into two groups (Media, security, and system software above).
  This feeds the owner's choice among `R0-02`'s options 1 to 3, system by system, and `R6-01`.
- Audio DSPs that run uploaded programs feed `R2-06` (audio), with options 3 and 4.
- Input here often passes through system software, and the Wii Remote and Wii U GamePad have no host equivalent;
  this feeds `R2-13` (input and peripherals) and the platform notes.
- Most sources here are community wikis, maker conference talks and patents, and emulator projects' own writing;
  the surveys should keep each emulator's description of itself apart from hardware facts.

## Open questions

- Do the PS2's vector units share every floating-point deviation of the core's FPU, in particular rounding towards zero?
  ps2tek's section is under the FPU; no vector-unit test results were found.
  `R1-19`.
- What exact values do the GameCube's reciprocal estimates return?
  No open prose source was found.
  `R1-17`.
- Does the Xbox 360's vector unit run only in AltiVec's non-Java mode?
  Not found.
  `R1-23`.
- How does the Vita run PSP games, and does the Wii U's DSP always run microcode from ROM?
  `R1-20`, `R1-17`.
- What is the Wii U's MEM1, and what are its CPU's cache sizes from a maker?
  No maker document found.
  `R1-17`.
- Where did 3dbrew's "Official Name" register column and "Official Documentation" citation come from?
  Not stated on the pages read; `R1-13` should ask before relying on them.
- Which statements on these wikis rest on disassembled system software?
  Several pages say so; `R0-05`'s question on telling a fact's origin applies.
- Which of options 1 to 12 apply to each system?
  Decisions for the owner after the surveys.

## Sources

Every source below was read on 2026-11-20.
Wiki pages were read as raw wikitext; "rev" is the MediaWiki revision.

Maker material: conference talks, manuals, standards, and patents:

- K. Kutaragi (Sony Computer Entertainment), keynote, Hot Chips 11 (1999):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf`.
- A. Kunimatsu and others (Toshiba, Sony), "5.5 GFLOPS Vector Units for Emotion Synthesis", Hot Chips 11 (1999):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.s3.1.Kunimatsu.pdf`.
- C. Sandon (IBM), Gekko, Hot Chips 13 (2001):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc13/2_Mon/06ibm-gekko.pdf`.
- Kurose and others (Sony), the PSP system chip, Hot Chips 16 (2004):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc16/3_Tue/8_HC16_Sess8_Pres1_bw.pdf`.
- J. Andrews and N.
  Baker (Microsoft), "Xbox 360 System Architecture", Hot Chips 17 (2005):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc17/3_Tue/HC17.S8/HC17.S8T4.pdf`.
- Microsoft Xbox team, "On Backwards Compatibility" (2006-03-20), archived on Microsoft Learn:
  `https://learn.microsoft.com/en-us/archive/blogs/xboxteam/on-backwards-compatibility-2`.
- Freescale, AltiVec Technology Programming Environments Manual, Rev. 3 (2006):
  `https://www.nxp.com/docs/en/reference-manual/ALTIVECPEM.pdf`.
- Renesas, SH-4 Software Manual, Rev. 6.00 (2006-09-13): `https://www.renesas.com/en/document/mas/sh-4-software-manual`.
- Renesas, SH7750 Group User's Manual: Hardware, Rev. 7.02 (2013-09-24):
  `https://www.renesas.com/en/document/mah/sh7750-sh7750s-sh7750r-group-users-manual-hardware`.
- NVIDIA, `NV_register_combiners` extension specification, Khronos registry:
  `https://registry.khronos.org/OpenGL/extensions/NV/NV_register_combiners.txt`.
- Khronos, Vulkan reference pages `VkPipelineCache`, `VK_EXT_fragment_shader_interlock`,
  `VK_EXT_graphics_pipeline_library`, `VkPhysicalDeviceFeatures`, latest version on the date read:
  `https://registry.khronos.org/vulkan/specs/latest/man/html/VkPipelineCache.html` and sibling pages.
- Ecma International, ECMA-365, 1st edition
  (June 2005): `https://ecma-international.org/wp-content/uploads/ECMA-365_1st_edition_june_2005.pdf`.
- United States patents, patent office copies: 5,729,672 (VideoLogic), 6,606,689 (Nintendo), 6,609,977 (Nintendo),
  6,907,522 (Microsoft), 7,034,828 (Nintendo):
  `https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7034828` and sibling documents.

Community references:

- ps2tek, single page, commit `1c916606` (2022-01-27):
  `https://psi-rockin.github.io/ps2tek/` and `https://raw.githubusercontent.com/psi-rockin/ps2tek/master/index.html`.
- Yet Another GameCube Documentation, chapters 1 to 6, 10, and 13
  (last revised 2006): `https://hitmen.c02.at/files/yagcd/yagcd/chap2.html` and sibling chapters.
- Yet Another PSP Documentation, chapters 2 to 12 and 20
  (last revised 2006): `https://hitmen.c02.at/files/yapspd/psp_doc/chap4.html` and sibling chapters.
- WiiBrew: "Paired single" (rev 120284), "Hardware/Broadway" (rev 121256), "Hardware/Starlet" (rev 118313), "Memory map"
  (rev 121456),
  "Hardware/DSP" (rev 116811), "Hardware/NAND" (rev 121606), "Hollywood/Registers"
  (rev 123372),
  "Hollywood/IRQs", "Hardware", "Broadway/Clock Speed Control", "Hardware/GX"
  (rev 110039),
  "Wiimote", "Bluetooth", "IOS", "Ticket", "Boot0":
  `https://wiibrew.org/w/index.php?title=Paired_single&action=raw` and sibling pages.
- WiiUBrew: "Hardware/Espresso" (rev 4429), "Hardware/Starbuck" (rev 4847), "Memory map" (rev 4859), "Hardware"
  (rev 4831),
  "Cafe OS" (rev 4900), "Hardware/DSP" (rev 4300), "Hardware/GX2"
  (rev 3754),
  "GamePad", "GamePad/LVC", "Disc drive", "Boot process":
  `https://wiiubrew.org/w/index.php?title=Hardware/Espresso&action=raw` and sibling pages.
- 3dbrew: "Hardware" (rev 23948), "New_3DS", "Memory layout", "NDMA Registers", "Corelink DMA Engines",
  "Flash Filesystem", "SD Filesystem", "GPU/Internal Registers" (rev 23943), "GPU/Shader Instruction Set"
  (rev 22377),
  "GPU/External Registers" (rev 23708), "GPU/Fragment Lighting", "LCD Registers", "TIMER Registers",
  "HID Shared Memory", "DSP Registers", "DSP:LoadComponent", "DSP Memory Region", "DSP Services", "CSND Registers",
  "FIRM", "NCCH", "Services"; some pages not pinned because the revision interface refused:
  `https://www.3dbrew.org/w/index.php?title=Hardware&action=raw` and sibling pages.
- Vita Development Wiki: "Main_Processor", "Kermit", "Venezia", "Caches", "Physical Memory" (rev 21616), "DMAC"
  (rev 21584),
  "Memory Card" (rev 21881), "SceAudio", "SceCodec", "SceNgs", "Security", "Modules":
  `https://wiki.henkaku.xyz/vita/Main_Processor` and sibling pages;
  "GPU" and "SceGxm" from captures of 2026-10-22 20:55:36 and 2025-11-26 14:54:55 because the live site refused:
  `http://web.archive.org/web/20261022205536/https://wiki.henkaku.xyz/vita/GPU`
  and `http://web.archive.org/web/20251126145455/https://wiki.henkaku.xyz/vita/SceGxm`.
- XboxDevWiki: "CPU" (rev 7347), "Xbox Hardware Overview" (rev 6007), "Memory" (rev 7416), "Kernel"
  (rev 6596),
  "Hard Drive" (rev 7037), "FATX" (rev 7419), "NV2A" (rev 6894), "NV2A/Pixel Combiner" (rev 6853), "NV2A/Vertex Shader"
  (rev 7422),
  "APU" (rev 7415), "Xbox Input Devices", "Xbox Memory Unit", "System Link":
  `https://xboxdevwiki.net/index.php?title=CPU&action=raw` and sibling pages.
- Free60 wiki, commit `f3d099ff` (2026-11-08): "Xenon (CPU)", "Xenos (GPU)", "Memory", "Hypervisor", "NAND", "HDD",
  "XEX", "Boot_Process", "Kernel": `https://github.com/free60project/wiki/tree/master/docs`.
- vfpu-docs, commit `f283bbb8` (2025-05-29): `https://github.com/pspdev/vfpu-docs`.
- dreamcast.wiki: "Memory map" (rev 1865), "VRAM" (rev 508), "Hardware overview" (rev 2944), "VMU hardware overview"
  (rev 2997),
  "GD-ROM" (rev 2113), "Maple bus": `https://dreamcast.wiki/wiki/index.php?title=Memory_map&action=raw`
  and sibling pages.
- M. Comstedt, Dreamcast Programming: SH-4, memory map, PowerVR, Maple bus, VMS, GD-ROM, bootstrap,
  and system-call pages (the SH-4 and memory pages dated 2000): `http://mc.pp.se/dc/` and its pages.
- Sega Retro, "AICA" (rev 1163931): `https://segaretro.org/index.php?title=AICA&action=raw`.

Tests:

- ps2autotests, README and `tests/cpu/ee_fpu/arithmetic.expected`, commit `97469ffb` (2019-11-16):
  `https://github.com/unknownbrackets/ps2autotests`.
- SingleStepTests sh4 README, commit `48975cb1`: `https://github.com/SingleStepTests/sh4`.
- Teakra README, commit `3d697a18` (2025-08-24): `https://github.com/wwylele/teakra`.

Emulator projects' documentation and data (implementations' accounts):

- PCSX2: `GameIndex.yaml` and `GameIndex.md`, commit `84077463` (2026-11-15), `bin/docs/GameIndex.pdf`, and README:
  `https://github.com/PCSX2/pcsx2/tree/master/bin/resources`.
- Dolphin: `Data/Sys/GameSettings` and README, commit `32a2b828` (2026-11-19): `https://github.com/dolphin-emu/dolphin`;
  FAQ: `https://dolphin-emu.org/docs/faq/`; wiki, "Audio Emulation"
  (rev 177576) and "GameCube Main Menu": `https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation&action=raw`.
- Dolphin blog, read from captures because the live site refused: "Pixel Processing Problems" (2014-03-15),
  capture of 2026-07-01 13:21:19; "Ubershaders" (2017-07-30), capture of 2026-11-03 20:18:59;
  "To the Screen with Hybrid XFB" (2017-11-19), capture of 2026-05-24 10:46:46:
  `http://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/` and the others.
- Xenia: `docs/cpu.md`, `docs/kernel.md`, `docs/gpu.md`, and `.github/CONTRIBUTING.md`, commit `95a5c3ee` (2026-02-18):
  `https://github.com/xenia-project/xenia/tree/master/docs`; "Leaving No Pixel Behind" (2021-04-27):
  `https://xenia.jp/updates/2021/04/27/leaving-no-pixel-behind-new-render-target-cache-3x3-resolution-scaling.html`.
- PPSSPP: README: `https://github.com/hrydgard/ppsspp`; "The PSP Media Engine and its implementation":
  `https://www.ppsspp.org/docs/development/ppsspp-internals/media-engine`.
- Play!, README: `https://github.com/jpd002/Play-`.
- Citra site archive (archive of 2024-03-04): "HLE Audio Comes to Citra" (2016-05-20),
  "Accurate Audio Emulation Has Arrived" (2018-12-07), "Hardware Renderer Updates" (2018-03-10), and the FAQ:
  `https://citra.azahar-emu.org/entry/hle-audio-comes-to-citra/` and sibling pages.
- xemu, home page, FAQ, and "Required Files" (prose of a walled emulator): `https://xemu.app/docs/required-files/`.
- Vita3K, README (prose of a walled emulator): `https://github.com/Vita3K/Vita3K`.

Wikipedia, raw wikitext (tertiary):

- Emotion Engine (rev 1375786242), PlayStation 2 technical specifications (rev 1355643867), Gekko
  (rev 1365149828),
  Broadway (rev 1370961000), Espresso (rev 1362404111), AltiVec (rev 1347443903), ARM11
  (rev 1381928793),
  Dynamic recompilation (rev 1386329890), Nuon (rev 1383941718), PlayStation Portable (rev 1386784394), PlayStation Vita
  (rev 1386319237),
  Nintendo 3DS (rev 1386371150), GameCube (rev 1386636021), Wii U
  (rev 1386323270),
  PowerVR, Wii Remote, Wii U GamePad, Xbox 360 technical specifications:
  `https://en.wikipedia.org/w/index.php?title=Emotion_Engine&action=raw` and sibling pages.
