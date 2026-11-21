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
most major CPUs examined have floating-point behaviour that host defaults do not reproduce,
and graphics become host shaders generated per configuration and cached (inference from the findings).
Second, system software decides much of the design: high-level emulation of what games call avoids firmware,
and the open-tier emulators read mostly take that route.
Third, the Wii, Wii U, 3DS, PSP, Vita, and Xbox 360 encrypt their retail content, while GameCube, Dreamcast,
and PS2 games reach an emulator as plain images by the pages read
(inference, partly from silence), which bears on `R0-02`'s options.
No maker specification was found for any major graphics chip of the era in the register's sources or `R0-05`'s search.
This note is not legal advice.

## Scope

- Question: how do the machines of this era work, subsystem by subsystem, and what does each part ask of an emulator?
- Covered, as worked examples: the Dreamcast, PlayStation 2, GameCube, Wii, Wii U, Xbox, Xbox 360, PSP, Vita,
  and Nintendo 3DS, the systems whose family surveys depend on this item
  (`R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22`, `R1-23`).
  The era follows the roadmap's grouping of surveys, not console generations,
  so it includes seventh- and eighth-generation systems; the PlayStation 3 and later systems are `R1-04`'s.
  For a survey that depends on several primers,
  pull request #22 proposes that each system belongs to the era of its own generation,
  and that the survey depends on the other primers for hardware its systems contain or carry over.
- Left to other items: the catalogue of every system sold (`R1-07`);
  the DS and PlayStation 1 hardware inside the 3DS and PS2 (`R1-02`); the law on firmware, keys,
  and encryption (`R0-02`), cited by section name; each emulator in depth
  (the family surveys and emulator studies); techniques in depth (phase 2).
- Researched on 2026-11-20.
  Wiki pages are pinned by revision and repositories by commit where the source showed one.
- How claims were checked: research agents fetched each source as raw text on 2026-11-20 and copied quotations from it.
  One independent verification pass followed, of nine verifiers who saw only this note:
  each fetched the sources again the same day and tested each claim and quotation.
  Its findings were checked against the raw sources before the note was corrected;
  pages beside key material were not reopened, and claims resting on them were weakened instead.
  The claims it could not check are listed in the pull request.
  Markers are those of `docs/research/README.md`; Wikipedia read as wikitext is marked "(secondary)".
  A statement that nothing was found records the searches named, not proof of absence.
- Emulator projects' documentation and data are cited as implementations' accounts, not hardware facts;
  no emulator source code, firmware, key, kit, game, leaked material, or tainted source was opened.
  Patents were read from the patent office's copies, by optical recognition where needed.

## Findings

### Processors

#### PlayStation 2: Emotion Engine, vector units, I/O processor

- The Emotion Engine's core is a custom MIPS core (R5900) at 294.912 MHz
  that can issue two instructions per cycle "in ideal conditions", with small caches and a 16 KiB scratchpad
  (ps2tek, "EE Architecture"),
  and 128-bit general registers whose full width only some instructions use (ps2tek, "EE Registers").
  The same die carries two vector units, a 10-channel DMA controller, an MPEG decoder,
  and the paths to the graphics chip and the I/O processor
  (Wikipedia, Emotion Engine, secondary; Toshiba and Sony, Hot Chips 11 slides).
  None of these can be emulated alone, because they run concurrently (inference).
- The core's FPU is single precision and, by ps2tek, departs from IEEE 754: no NaN or infinity, denormals read as zero,
  and rounding always towards zero, with a last-bit variation of which "the details on this are not well understood"
  (ps2tek, "IEEE 754 Differences"; ps2tek states no source).
  Results recorded on a console agree for addition: adding `0x7fffffff` to itself returns `0x7fffffff`,
  a pattern that IEEE 754 reads as a NaN
  (ps2autotests, `tests/cpu/ee_fpu/arithmetic.expected`, results recorded on a PS2; the IEEE reading from memory).
- Each vector unit has 32 registers of four 32-bit floats and executes an upper and a lower instruction per cycle;
  VU0 also acts as a coprocessor inside the core's instruction stream, and VU1 runs microprograms that games upload
  (Hot Chips 11 slides; ps2tek, "VU Architecture", "VU Registers").
  Their pipeline is exposed: "Underneath the surface, the VU is full of quirks.
  This is partially because its pipeline is exposed to the program." (ps2tek, "VU Pipelining").
  A recompiler for them models per-instruction timing as well as results (inference).
- The open-tier PS2 emulator's game database sets rounding and clamping per game: of 12,916 entries,
  215 set `eeRoundMode` and 418 `vuClampMode`, and more set VU0 or VU1 clamping alone
  (PCSX2, `GameIndex.yaml`, tested locally: counted with ugrep 7.8.4).
  These are an implementation's settings, read as data; one global setting does not fit every game (inference).
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
  (Sandon, IBM, Hot Chips 13 slides); Yet Another GameCube Documentation (YAGCD) gives 486 MHz (2.1).
  Quantised loads and stores convert small integers to floats by a type and scale held in registers
  (same slides; WiiBrew, "Paired single"),
  so a recompiler specialises on those registers or takes a slow path (inference).
- WiiBrew gives the reciprocal estimates as "Accurate to a precision of 1/4096."
  (WiiBrew, "Paired single"); none of the WiiBrew, YAGCD, or IBM pages read gives the exact bits.
  Of the open-tier emulator's 1,887 per-game settings files, 24 turn on `FPRF` and 2 more `AccurateNaNs`
  (Dolphin, `Data/Sys/GameSettings`, tested locally: counted with ugrep 7.8.4).
- Broadway (Wii) is upward-compatible with Gekko at 729 MHz (WiiBrew, "Hardware/Broadway").
  IBM and Nintendo have said that Espresso
  (Wii U)
  has three cores; its 1.243125 GHz clock is among figures that "have not been officially confirmed"
  (Wikipedia, Espresso (processor), secondary).
- The Wii and Wii U each add an ARM processor that runs the I/O and security system software
  (WiiBrew, "Hardware/Starlet"; WiiUBrew, "Hardware/Starbuck").
  An emulator runs that software on an emulated ARM, which needs code the project never holds,
  or reimplements its services (inference).

#### Xbox and Xbox 360

- The Xbox CPU is a 733 MHz Pentium III variant for which no datasheet exists, by XboxDevWiki,
  and the console is a PC built from chipset parts apart from its security additions
  (XboxDevWiki, "CPU", "Xbox Hardware Overview").
  Microsoft's own Xbox emulation on the Xbox 360 was software:
  "Xbox 360's backwards compatibility had to emulate the exact configuration of an original Xbox"
  (Microsoft Xbox team blog, "On Backwards Compatibility", 2006).
- Microsoft gives the Xbox 360 CPU as three 3.2 GHz PowerPC cores, each "2-issue per cycle, in-order",
  with two hardware threads and a vector unit of 128 registers per thread
  (Hot Chips 17 slides), so six guest threads need a host with as many, or interleaving (inference).
  Wikipedia says its vector unit, VMX128, is not entirely compatible with AltiVec: integer operations were removed,
  and registers and game-oriented operations added (Wikipedia, AltiVec, secondary).
  AltiVec's non-Java mode flushes denormals: "If an element in a source vector register contains a denormalized value,
  the value 0 is used instead" (Freescale, AltiVec Programming Environments Manual, Rev. 3, Table 2-1, VSCR[NJ]);
  whether the console runs only in that mode was not found in the Hot Chips 17 slides, Free60's "Xenon (CPU)",
  or Xenia's `docs/cpu.md`.
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
- Its inner-product and matrix instructions are approximate by design:
  "Geometric operation instructions perform approximate-value computations", discarding small partial products
  (Renesas, SH-4 Software Manual, 6.6.1), and they differ from the same sum built from separate operations (6.4).
  The manual lists errata in those instructions (6.7.2, 6.7.3) and in double-precision arithmetic
  (6.7.4, 6.7.5), and says the addition and subtraction erratum affects all SH-4 products (6.7.4).
  A host's arithmetic will not match bit for bit (inference);
  whether games depend on the exact error was not found in the Dreamcast sources listed below.

#### PSP and Vita

- Sony's 2004 slides give the PSP two MIPS R4000-class cores with FPUs, one also with a vector unit (VFPU),
  the other the Media Engine, plus 4 MB of embedded DRAM (Kurose and others, Sony, Hot Chips 16 slides).
- The VFPU's 128 registers are addressable singly or as rows, columns, and matrices,
  with prefixes that alter inputs and outputs;
  vfpu-docs' VFPU chapter says rounding is fixed to nearest and subnormals are flushed
  (vfpu-docs, `docs/introduction.md`).
  Some matrix instructions forbid overlapping inputs and outputs, which give incorrect results
  (same file),
  and two instructions write the wrong output registers on every model, an error
  that "seems to be deterministic" (`docs/bugs.md`);
  the README says each instruction statement has a test that runs on a PSP.
  "Sony did not release any public documentation (nor SDK/toolchain) for the Sony PSP" (vfpu-docs, README).
- Games reach the Media Engine only through libraries, which the open-tier emulator has emulated at a high level
  (PPSSPP, "The PSP Media Engine and its implementation");
  from 1.21 some run as real modules where available (same page).
- The Vita has four Cortex-A9 cores (Vita Development Wiki, "Main_Processor"),
  a media subsystem of eight Toshiba MeP cores (same wiki, "Venezia"), and a security processor
  (same wiki, "Security"), whose services an emulator would reimplement (inference).

#### Nintendo 3DS

- The original 3DS has a dual-core ARM11 MPCore at 268 MHz, "exactly twice the clock rate of the ARM9",
  and the New 3DS four cores that can run at 804 MHz when a title's header asks, with more memory
  (3dbrew, "Hardware" and "New_3DS").
  The New 3DS page says its list came from disassembling system modules, a firmware-derived origin,
  and the Hardware page cites unnamed "Official Documentation"; both facts need that caveat.
- One ARM11 core is reserved for the operating system, and the ARM9 serves mainly DS and DSi compatibility
  (Wikipedia, Nintendo 3DS, secondary); DS-mode hardware is `R1-02`'s.

#### Across the era

- Most major CPUs found here (PS2, GameCube and Wii, the Xbox 360's vector unit, Dreamcast, PSP) produce floating-point
  results host defaults will not reproduce, and vector register files (128 per thread on the Xbox 360, 128 with matrix
  views on the PSP) exceed a host's, so guest registers live in memory (inference from the findings above).
- Symmetric multi-core guests (Xbox 360, Wii U, 3DS, Vita) need the guest's memory ordering on the host; asymmetric ones
  (PS2, Wii, PSP) need synchronisation between unlike processors (inference).
- Main CPU clocks run from 200 MHz (Dreamcast) to three cores at 3.2 GHz
  (Xbox 360),
  and Wikipedia describes dynamic recompilation as common in such emulators
  (Wikipedia, "Dynamic recompilation", secondary).
  Code that overwrites itself (ps2tek, "Cache Coherency", on one game's decompressor)
  and microprograms uploaded through the vector interface
  (ps2tek, "Vector Interface (VIF)") appear, so a recompiler needs invalidation tied to writes into code (inference).
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
- The DMA controller moves 16 bytes per bus cycle on ten channels and walks linked lists of tags that games build
  (ps2tek, "DMA Controller (DMAC)", "DMAC Chain Mode");
  its address registers "update while a transfer is ongoing", and certain games rely on them changing
  (ps2tek, "DMAC I/O").
  The graphics interface takes work from three paths in fixed priority
  (ps2tek, "Graphics Interface (GIF)"),
  and ps2tek names a game that hangs on a black screen when PATH3 masking is emulated without the GIF FIFO
  (ps2tek, "GIF PATH3 Masking").
  DMA is concurrent state with arbitration, not a copy made when a register is written (inference).
- Memory cards are flash with a file system, and "Certain games do not work if the memory card is larger than expected,
  for unknown reasons" (ps2tek, "SIO2 PS2 Memcards"); they use Sony's MagicGate encryption
  (Wikipedia, PlayStation 2 technical specifications, secondary; ps2tek, "BIOS IOP SECRMAN - Security Manager"),
  which an emulator bypasses at a high level, because the project holds no keys (inference; `R0-02`).
- ps2autotests holds results recorded on a console for the DMA controller and the vector interface (`tests/dma`).

#### GameCube and Wii

- The GameCube has 24 MB of 1T-SRAM and a separate 16 MB audio RAM on a bus YAGCD calls "by far the slowest one,
  clocked at only 81MHz" (YAGCD, 2.4.2 and 2.5); its figures for the CPU's bus disagree between sections,
  so none of them is recorded.
- The CPU sees memory through fixed cached and uncached windows, the embedded framebuffer through its own,
  and a 16 KB region that YAGCD's map labels "L2 Cache" and its 2.1 calls a data scratchpad (YAGCD, 2.1 and 4.1).
  Audio RAM is not mapped into the CPU's memory
  (WiiBrew, "Memory map");
  a DMA engine and the DSP's "accelerator" reach it, with 32-byte alignment (YAGCD, 5.6; WiiBrew, "Hardware/DSP").
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
  The layouts on those pages are system software's, and the pages do not say how they were found,
  so they are not recorded here; a high-level emulator reproduces the map the kernel gives a title rather than the
  hardware page tables (inference).

#### Xbox and Xbox 360

- The Xbox has 64 MB of memory shared by the CPU and the GPU
  (XboxDevWiki, "Memory"),
  a kernel closely related to Windows NT's that exports virtual-memory functions
  (XboxDevWiki, "Kernel"),
  and a standard IDE hard disk, locked by the console, with its own file system (XboxDevWiki, "Hard Drive", "FATX").
- Microsoft describes the Xbox 360's 10 MB of embedded DRAM, on a die beside the GPU's main die,
  as a way to take framebuffer and depth fill out of the unified memory
  (Hot Chips 17 slides, "Architectural Choices - EDRAM", "GPU Block Diagram").
  Its CPU caches use 128-byte lines and its first-level data caches are write-through
  (same slides, "CPU Data Streaming Specs").
- Free60 describes a hypervisor that runs in real mode with paging disabled and can reach any memory,
  while user-mode code cannot reach the hypervisor's space (Free60, "Hypervisor").
  An emulator implements the services the hypervisor and kernel give games rather than the hypervisor itself
  (inference; Xenia's `docs/kernel.md` describes that approach for the kernel).
- Most boards carry 16 MB of NAND flash; bundles sold without a hard disk got 256 MB or 512 MB
  (Free60, "NAND"), and the disk is needed for original Xbox games (Free60, "HDD").

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

- The PSP's CPU has no TLB (YAPSPD, 4.3.1 and 7.1); it has data and instruction caches,
  "only a 32k L1 cache" and no second level, and no hardware coherence with DMA (YAPSPD, 4.10).
  Its 4 MB of embedded DRAM is two 2 MB blocks, one in the graphics chip and one in the Media Engine
  (YAPSPD, chapter 2 and the chapter 3 parts list),
  and its video memory appears mirrored at several offsets that change how the depth buffer reads back (YAPSPD, 10.2).
  YAPSPD's preface warns that it may be wrong.
- The Vita has 512 MiB of DRAM on two channels plus video memory
  (Vita Development Wiki, "Physical Memory"),
  and DMA controllers some of which also encrypt or hash while copying (same wiki, "DMAC").
  Its memory card speaks the Memory Stick protocol
  (same wiki, "Memory Card"), which the wiki derives from a system driver, a firmware-derived origin.

#### Nintendo 3DS

- The ARM11 cores see 128 MB of FCRAM, 256 MB on the New 3DS, plus video memory, DSP memory, and a shared work RAM,
  and the ARM9 sees the same plus memory of its own (3dbrew, "Memory layout").
  "Memory layout" states no origin for the New 3DS extension,
  but the "New_3DS" page says its account of that model's changes rests on disassembly of system modules.
- The 3DS has three DMA systems, one used by the ARM9's code and two Arm CoreLink engines
  (3dbrew, "NDMA Registers"; "Corelink DMA Engines");
  which processor drives each CoreLink engine is read from the pages' peripheral tables (inference).
  Its NAND and SD contents are encrypted
  (3dbrew, "Flash Filesystem"; "SD Filesystem"),
  so emulators present title storage decrypted by the user's own tools or as folders (inference; `R0-02`).

#### Patterns

- Most worked examples pair a large general pool with a small fast pool beside the GPU: the PS2's graphics DRAM,
  the GameCube and Wii embedded framebuffer, the Wii U's MEM1, the Xbox 360's embedded DRAM, the PSP's embedded DRAM,
  and the 3DS's video memory (inference from the findings above).
  The Xbox has one shared pool; the Dreamcast's and Vita's video memories are not shown to be faster.
- Address translation ranges from none on the PSP, through fixed segments and block mappings, to software TLBs
  (PS2; the Dreamcast's MMU, normally disabled, by dreamcast.wiki, "Memory map")
  and paging kernels (Xbox 360, Wii U); and keeping caches coherent with DMA is the software's job on the PS2 and PSP
  (inference from the findings above).

### Graphics

#### How the era's graphics are documented

- With no maker specification found (Summary), the record is wikis, maker talks and patents, and emulators' writing.
- The era runs from fixed pipelines (Dreamcast, PS2, PSP) through configurable combiners
  (GameCube, Wii, Xbox)
  to programmable shaders (Xbox 360, Vita, Wii U),
  and "PICA200 is compatible with OpenGL ES 1.1." with a programmable vertex stage
  (3dbrew, "Hardware"; the arc is inference from the findings below).

#### PlayStation 2: Graphics Synthesizer

- The Graphics Synthesizer holds framebuffer, textures, and depth buffer together in 4 MB of embedded memory,
  and ps2tek says "the GS only supports single-pass texturing and is entirely fixed-unit."
  (ps2tek, "GS Special Effects and Optimizations").
- Its blend unit has one fixed equation with selectable inputs, and "Internally,
  alpha-blending treats each color component as 9-bit.
  The output is then clamped accordingly by COLCLAMP."; with clamping off it keeps only the low bits, so results wrap
  (ps2tek, "GS Alpha Blending").
  Host blend units saturate, so wrapping and 9-bit arithmetic need shader work (inference).
- ps2tek documents techniques that rely on the memory layout,
  among them masking that a modern GPU cannot express directly: "modern GPUs mask on the byte level,
  but games can mask on the bit level,
  which requires a slow fragment shader to process the effect correctly
  if the game doesn't fully mask on the byte level." (same section).
  The memory is not linear: colour and depth formats, and 32-bit and 8-bit textures, are swizzled differently
  (same section), so a game that reads one format as another forces the emulator to convert between layouts.
- The GS draws points, lines, strips, fans, triangles, and two-vertex rectangles
  (ps2tek, "GS Primitives"), and has two output circuits, each with its own display buffer (ps2tek, "I/O Maps").
  Geometry reaches it by three paths: from VU1, through VIF1, and by DMA from main memory
  (ps2tek, "Graphics Interface (GIF)").
- The open-tier PS2 emulator's game database carries per-game options for its hardware renderer,
  such as blending accuracy levels (PCSX2, `bin/docs/GameIndex.pdf`; an implementation's options),
  which shows that no single host configuration fits every title (inference).

#### GameCube and Wii: the texture environment

- Nintendo's patent describes a texture-environment unit of "Up to sixteen independently programmable consecutive
  stages, forming a chain of blending operations", on values it gives as "unsigned 8-bit values or signed 10-bit values
  but other implementations could provide different precisions." (US 7,034,828, Nintendo, abstract and column 11, of
  multiplexer outputs in an example embodiment; patent office copy read by optical recognition).
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
  WiiBrew calls the Wii's graphics capabilities similar to the GameCube's, at a higher clock (WiiBrew, "Hardware/GX").

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
  Its vertex stage follows NVIDIA's vertex-program extension with some modifications,
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
- A developer of the open-tier emulator writes: "The Xbox 360 allows games to draw only to eDRAM — after drawing,
  resolving ... is necessary to write the result to the back buffer for presentation or to a texture
  for subsequent usage in shaders." (Xenia, "Leaving No Pixel Behind", 2021).
  The article gives the eDRAM's tile size and storage formats, and reports that 24-bit floating-point depth,
  emulated as 32-bit on the host, must survive round trips through eDRAM (same article).
  Emulating the resolve step and the console's own formats is where most of the work lies (inference).
- The same project states the origin of its GPU knowledge and its rule:
  "The writer of this post has never used the Xbox 360 XDK for any purpose,
  and contributions based on information obtained from the XDK are not allowed." (same article).

#### PSP

- Sony's slides give a rendering engine and a surface engine at 166 MHz (Hot Chips 16 slides).
  YAPSPD says each command is a 32-bit word with an 8-bit command and a 24-bit argument,
  and that "Floats processed in the command-stream are 24 bits instead of 32 that are used by the CPU."
  (YAPSPD, 11.1 and 11.2).
- The open-tier PSP emulator's change log records rendering a software depth buffer alongside the hardware renderer to
  fix lens flares in several games (PPSSPP, README, "What's new in 1.19"), one case of reading back what a host GPU does
  not expose (inference).

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
  (with 3D slider enabled), and A mode (no interlacing) in 2D mode." (3dbrew, "GPU/External Registers").
  The GPU renders into tiled buffers that a transfer engine converts for display (same page).
- The developers of Citra, predecessor of the open-tier Azahar, wrote in 2018: "As it stands,
  only a portion of the PICA200 emulation is running on the GPU; most of it is running on the CPU!"
  (Citra site archive, "Hardware Renderer Updates").
  The same post reports the rest moved to the host GPU, the guest's shader programs translated into host shaders.
- 3dbrew's register list carries a column headed "Official Name",
  whose names have a form that suggests a maker's document
  (3dbrew, "GPU/Internal Registers"; inference);
  the wiki does not say where they came from, so the names are not used here.

#### Vita and Wii U

- The Vita carries a four-core PowerVR SGX543MP4+.
  The Vita Development Wiki compares the GPU's kernel module with the open-source Linux PowerVR kernel module
  (Vita Development Wiki, "GPU").
  A user-mode library, `SceGxm`, exports the graphics functions
  (same wiki, "SceGxm", observed), so a high-level emulator implements that library over a host API (inference).
- WiiUBrew relates the Wii U's GPU to AMD's Radeon R7xx family and says:
  "While documentation perfectly matching the card is yet to be found,
  several documents can be brought together to form a reasonable picture of the register layout."
  (WiiUBrew, "Hardware/GX2").
  The closest maker documents would be AMD's for that desktop family;
  the copies tried redirected to a portal page that needs a script to load, and were not read (research log).

#### What host-GPU emulation needs, across the era

- Vulkan pipeline caches let compiled pipelines be reused between pipelines and between runs
  (Khronos, `VkPipelineCache`),
  and an extension lets parts of a pipeline be compiled separately and linked later
  (Khronos, `VK_EXT_graphics_pipeline_library`), which bears on the stutter Dolphin describes (inference).
- With the fragment shader interlock extension,
  a fragment shader may read the destination by image loads and write the result by image stores,
  so blending the host cannot express can move into the shader (Khronos, `VK_EXT_fragment_shader_interlock`).
  Dual-source blending and logic operations are optional device features
  (Khronos, `VkPhysicalDeviceFeatures`),
  so the set of hosts that can run an accurate renderer depends on them (inference).
- The era's GPUs compute in formats hosts do not: integer texture-environment arithmetic (GameCube), 9-bit blends (PS2),
  fixed-point combiners (NV2A, by NVIDIA's account of the NV10; inference), 24-bit floats
  (PSP commands, Xbox 360 depth), and non-IEEE shaders (3DS) (findings above).
  Across the projects read, emulators decode the command stream, track guest graphics memory in the console's layout,
  generate host shaders per configuration, and cache them (inference from the emulator writing cited above).

### Audio

- Audio takes four forms (inference from the findings below): a DSP running a program the game or its library uploads
  (GameCube, Wii, 3DS, the Xbox's two programmable DSPs, the Dreamcast's ARM7);
  a fixed voice synthesiser (PS2, the Xbox's voice processor, the 3DS's second sound unit);
  a fixed decoder plus mixing in software
  (Xbox 360, and by their libraries the PSP and Vita);
  and a DSP running fixed microcode from ROM (Wii U, by a WiiUBrew statement marked for checking).
  The first is where high-level against low-level emulation matters most.

#### GameCube and Wii

- "At the heart of the GCN audio hardware is a custom digital signal processor (DSP)
  which is largely dedicated to pitch modulation and the mixing of voices and effects data." (YAGCD, 5.6).
  YAGCD gives it an 81 MHz clock; Nintendo's patent describes an embodiment at 100 MHz
  (US 6,606,689, column 7, patent office copy).
- Its program is not fixed: "During system initialization, a runtime audio library is downloaded to audio DSP 156."
  (US 6,606,689, column 8).
  The open-tier emulator reimplements the common program families at a high level
  and says "LLE uses DSP ROM files to emulate the DSP's hardware behavior."
  (Dolphin wiki, "Audio Emulation"); its replacement DSP ROM is closed in the register.
- On the Wii, "ARAM does not physically exist in Wii hardware."
  (WiiBrew, "Hardware/DSP"),
  and on the Wii U, WiiUBrew says that under Cafe OS the DSP "always runs the same microcode from ROM rather than being
  per-title", marked for checking (WiiUBrew, "Hardware/DSP").

#### Nintendo 3DS

- The 3DS's DSP, a Teak-family processor by Teakra's README
  (3dbrew's "Hardware" says CEVA TeakLite),
  runs a program the title supplies, which "requires RSA-signed DSP firmware"
  (3dbrew, "DSP:LoadComponent"),
  and talks to the game through shared memory; a second sound unit can play at the same time
  (3dbrew, "DSP Memory Region", "DSP Services").
- Citra's developers built high-level audio by tracing shared memory, modelled on the most common program,
  and found that games with another program broke
  (Citra site archive, "HLE Audio Comes to Citra", 2016; "Accurate Audio Emulation Has Arrived", 2018);
  the 2016 post credits the community's reverse engineering of the DSP firmware, a firmware-derived origin.
  Of their low-level emulator they wrote "When it comes to writing an LLE DSP emulator, it's all or nothing."
  (same post of 2018); it ships testers that run on a 3DS (Teakra, README).
  Citra kept high-level emulation as the default in 2018 (the 2018 post), as Dolphin does
  (from memory),
  and Dolphin's wiki says "all sound issues need to be confirmed with LLE." (Dolphin wiki, "Audio Emulation").

#### PlayStation 2

- The SPU2 is a sound processor of two cores with 24 voices each and 2 MB of its own RAM,
  attached to the I/O processor with its own DMA channels
  (ps2tek, "I/O Maps", "Memory Map").
  ps2tek names a game whose library for a custom sound module reuses one buffer for sending and receiving,
  and which needs cache emulation to boot (ps2tek, "Cache Coherency").
  Sound reaches the SPU2 through the I/O processor's modules,
  so high-level emulation of those modules is an alternative to running them (inference).

#### Xbox and Xbox 360

- The Xbox's audio processing unit has a fixed voice processor for up to 256 voices and two programmable DSPs,
  one for effects and one for output encoding,
  and "All audio processing by the APU is typically done in 24bit PCM at 48000Hz." (XboxDevWiki, "APU").
  The library loads the encoder's program: "The EP code is loaded by DirectSound.
  The EP is not programmable using DirectSound APIs." (same page).
  The walled-tier emulator says "Surround Sound isn't implemented in xemu yet." (xemu, FAQ).
- Microsoft's block diagram places an XMA decoder in the Xbox 360's I/O chip
  (Hot Chips 17 slides),
  and Wikipedia says "Sound files for games are encoded using Microsoft's XMA audio format."
  (Wikipedia, Xbox 360 technical specifications, secondary).
  Mixing and effects run in software on the CPU (from memory).

#### Dreamcast

- The AICA is a Yamaha sound processor related to the Saturn's SCSP, with 64 channels and an ARM7 core of its own
  (Sega Retro, "AICA", secondary: the article is marked for cleanup; dreamcast.wiki, "Hardware overview").
  The ARM7 runs a program the game uploads (from memory), so the AICA joins the uploaded-program class (inference).

#### PSP and Vita

- Games reach Vita audio through system libraries
  (Vita Development Wiki, "SceAudio", "SceNgs"),
  and PSP audio through `sceAudio` and the Media Engine's libraries
  (PPSSPP, "The PSP Media Engine and its implementation"; YAPSPD, 12.1, gives only a 44,100 Hz rate),
  which a high-level emulator reimplements (inference).

### Timing, synchronisation, and input

#### Processors in parallel

- Interrupt controllers route sources to two processors:
  the Wii's is "capable of routing up to 32 interrupt sources to either the Starlet, the PowerPC, or both"
  (WiiBrew, "Hollywood/IRQs").
- Clock ratios change with the mode: in GameCube mode on the Wii "Hollywood is now at 162 MHz,
  and Broadway is now at 486 MHz" (WiiBrew, "Broadway/Clock Speed Control", a stub on a homebrew procedure),
  and the New 3DS uses its higher clock while the HOME Menu runs and otherwise only for software that asks in its header
  (3dbrew, "Hardware").
  The 3DS's clocks are exact ratios, the ARM11 at "exactly twice the clock rate of the ARM9" (3dbrew, "Hardware").
  Components therefore need a shared time base (inference).
- The PS2 core's two interrupt inputs come from the interrupt controller and the DMA controller
  (ps2tek, EE interrupts),
  and in PS1 mode "the IOP is underclocked to 33.8688 MHz" (ps2tek, "BIOS PlayStation Compatibility").

#### Frame timing

- ps2tek gives the PS2's raster as 262 lines per frame for NTSC and 312 for PAL,
  with a fixed count of bus cycles per line, the bus at half the core's clock
  (ps2tek, "EE Timers", "DMA Controller (DMAC)");
  from those figures the NTSC rate is about 60.07 Hz with 262 lines, or 59.95 Hz for an interlaced field of 262.5 lines,
  which ps2tek does not state (calculated from the figures).
  The GameCube's video interface uses a 27 MHz video clock, or 54 MHz for progressive output
  (YAGCD, 5.3); the 3DS's display timing is a divider of the GPU's 268 MHz clock (3dbrew, "GPU/External Registers").
- The GameCube's video interface has four display-interrupt registers that fire at programmed positions
  (YAGCD, 5.3), so games can time work against the beam even on this era's hardware (inference).
- The PS2 figures give rates that are not exactly 60 Hz or 50 Hz
  (PAL about 50.09 Hz; calculated as above),
  while YAGCD names the GameCube's modes as 60 Hz
  and 50 Hz (5.3.1); this bears on frame pacing on host displays (`R2-07`).

#### Input

- On the 3DS a system module writes buttons, Circle Pad, touch, and motion into shared-memory ring buffers
  (3dbrew, "HID Shared Memory"), so high-level emulation of input there means writing those buffers (inference).
- The GameCube polls its controller ports in hardware at a line interval tied to video,
  of which "7 is the minimum setting" (YAGCD, 5.8; Nintendo's US 6,609,977 describes the same interface).
- The Wii Remote is a Bluetooth HID device with buttons, an accelerometer,
  an infrared camera that tracks up to four points, and extensions (WiiBrew, "Wiimote").
  The Wii U GamePad streams H.264 video and PCM audio over a custom 5 GHz link and runs its own firmware
  (WiiUBrew, "GamePad", "GamePad/LVC").
  Neither has a host equivalent, so an emulator passes a real device through or synthesises reports (inference).
- Of SIO2, the PS2's controller port interface, ps2tek writes "A good portion of SIO2 is a mystery"
  (ps2tek, "SIO2 Registers").
  Xbox controllers are USB: "XIDs are USB devices." (XboxDevWiki, "Xbox Input Devices").
  Dreamcast peripherals sit on four Maple buses,
  where a port that does not answer before a timeout yields a result with all bits set (Comstedt, "Maple bus", a lead).

#### Networking

- Network hardware is built in on the Dreamcast, Xbox 360, PSP, and 3DS,
  and an add-on on the GameCube and on PS2 models before the slim one
  (dreamcast.wiki, "Hardware overview"; Hot Chips 17 slides; Wikipedia, PlayStation Portable, Nintendo 3DS, GameCube,
  PlayStation 2 technical specifications, secondary); their online services have ended or changed,
  so networking is left out or reconnected to replacements (inference; `R2-09`).

### Media, security, and system software

The law is in `R0-02` ("Anti-circumvention law in the United States", "Firmware, keys, and game copies");
this note records no key, key layout, or secret value.

#### Discs and what arrives as a plain image

- The GameCube's disc content is XORed with a constant and decrypted transparently by the drive's controller
  (YAGCD, 2.7.3),
  and "Dolphin does not include the GameCube Main Menu by default, and it doesn't need it"
  (Dolphin wiki, "GameCube Main Menu").
- The Dreamcast's GD-ROM has standard and high-density regions
  (Comstedt, "GD-ROM", a lead);
  at boot its ROM checks part of the disc's bootstrap byte by byte against a copy of its own
  (Comstedt, "IP.BIN and 1ST_READ.BIN", a lead).
- The PS2's BIOS sets up the hardware and copies the EE kernel into RAM, and "Unlike the EE,
  the IOP does not have a monolithic kernel" (ps2tek, "BIOS", "BIOS Boot Process").
  The PSP's UMD standard leaves the format of its copyright management fields to agreement between the parties
  (Ecma-365, 1st edition, 18.3 and 26.2.4.3).
- By the pages read, GameCube, Dreamcast, and PS2 games reach an emulator as plain images,
  and no page read says Xbox game executables are encrypted (inference, partly from silence).
  Wii, 3DS, PSP, Vita, and Xbox 360 retail content is encrypted
  (WiiBrew, "Ticket"; 3dbrew, "NCCH", unless a title's no-encryption flag is set; YAPSPD, 23.1.1.1,
  for a UMD game's main executable; Vita Development Wiki, "Security"; Free60, "XEX",
  under a heading that calls its account speculation), and so is the Wii U's (from memory).
  This sorts the systems by `R0-02`'s options 1 to 3 (inference); which applies is the owner's decision.

#### Boot chains and security processors

- Several systems boot through a chain of verified loaders that starts in ROM:
  the Wii and Wii U on their ARM processors, the Wii's first stage also decrypting the next
  (WiiBrew, "Boot0" introduction; WiiUBrew, "Boot process"),
  the 3DS from a boot ROM that checks a signed firmware image
  (3dbrew, "FIRM"),
  the Xbox from bootstrap code in its I/O chip, which a Microsoft patent describes
  (US 6,907,522, Microsoft, patent office copy), and the Xbox 360 from a loader inside the CPU (Free60, "Boot_Process").
  The Vita's root of trust is a separate security processor (Vita Development Wiki, "Security").
- Free60 writes: "In case of the Xbox 360, the hypervisor is responsible for encryption,
  decryption and the enforcement of access restrictions on memory." (Free60, "Hypervisor").
- None of these chains needs to run for a game to run in the emulators read:
  the open-tier emulators boot games without the maker's boot firmware, except that PCSX2 requires a BIOS dump,
  and the walled-tier xemu requires the Xbox's boot ROM image, flash image, and hard disk image
  (PCSX2, README; xemu, "Required Files").
  Citra recommends maker system files for accuracy (Citra site archive, FAQ).

#### System software that games call

- Where system software lives decides what high-level emulation replaces
  (inference from the sources here):
  the GameCube game carries its own operating system, which YAGCD implies (YAGCD, 4) and WiiUBrew states for the Wii
  (WiiUBrew, "Cafe OS");
  the Wii serves games from IOS, which "is not a 'hypervisor', as it runs on a dedicated, separate CPU."
  (WiiBrew, "IOS");
  the Wii U runs Cafe OS on the CPU and IOSU on the ARM
  (WiiUBrew, "Cafe OS", "Boot process");
  the PS2 has a kernel in RAM and loadable I/O modules
  (ps2tek, "BIOS Boot Process", "BIOS");
  the PSP and 3DS load modules or services that games import or request by name
  (YAPSPD, 26.2.2.6; 3dbrew, "Services"),
  and the Vita's user libraries export functions by identifier
  (Vita Development Wiki, "SceGxm", observed);
  the Xbox runs a kernel closely related to Windows NT's and the Xbox 360 a hypervisor and kernel
  (XboxDevWiki, "Kernel"; Free60, "Hypervisor", "Kernel").
- Named, dynamically linked interfaces
  (PSP, Vita, Wii U, 3DS, Xbox 360)
  suit high-level emulation; statically linked libraries
  (GameCube, Wii, Xbox) push it down to recognising library code, or toward hardware (inference).
- The emulators read say which they do: "No BIOS file required to play, PPSSPP is an 'HLE' emulator."
  (PPSSPP, README); "Play!
  uses a built-in high-level emulation BIOS."
  (Play!, README); "Xenia implements all kernel APIs as native functions under the host." (Xenia, `docs/kernel.md`).
  Xenia's contributing guide bans Microsoft's development kits as a source (Xenia, `.github/CONTRIBUTING.md`).

#### Pages next to restricted material

- Open wiki pages in this area sit beside firmware listings, key layouts, and pseudo-code of boot ROMs
  (`R0-05`, "Patterns across the hubs").
  A research session displayed one Free60 page that lists a console's fuse values; nothing from it was used,
  and the register now closes it.
  The correction pass did not reopen 3dbrew's "FIRM" and "NCCH", WiiUBrew's "Disc drive", or Free60's "XEX"
  (research log).

## Options and trade-offs

The options answer separate questions and can be combined, and the answer can differ by system.
Options 1 and 2 concern system software, 3 and 4 audio processors, 5 to 7 graphics, 8 to 10 processors,
and 11 protected content.
Costs and gains are the note's reasoning from the findings (inference) unless a source is named.

### 1. High-level emulation of system software

- **What:** implement the services games call (kernel functions, libraries, modules, IOS requests) as host code.
- **Costs:** each interface must be reimplemented and kept compatible with what games expect;
  statically linked libraries (GameCube, Wii, Xbox) offer no clean boundary.
- **Gains:** no firmware needed; fast.
- **Used by:** PPSSPP, Play!, Xenia, and Azahar, by their READMEs and Xenia's `docs/kernel.md`.

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
- **Used by:** Citra by default in 2018 (Citra site archive, "Accurate Audio Emulation Has Arrived"); Dolphin by default
  (from memory).

### 4. Low-level emulation of audio DSPs

- **What:** emulate the DSP's instruction set, memory, and peripherals, and run the uploaded program.
- **Costs:** "all or nothing" by Citra's account; on the GameCube and Wii, needs the DSP's ROMs or a replacement,
  which the register closes, and on the 3DS the program the title supplies; slow at first release, by Citra's account.
- **Gains:** runs any program; serves as the reference for checking high-level emulation.
- **Used by:** Dolphin; Citra, Azahar's predecessor, from 2018.

### 5. A specialised host shader for each guest configuration

- **What:** generate and compile a host shader for each combiner, blend, and vertex configuration a game sets.
- **Costs:** compilation stalls when a new configuration appears; a cache must be kept per game, per driver,
  and per emulator version (Dolphin blog, "Ubershaders").
- **Gains:** fast once compiled.
- **Used by:** Dolphin (Dolphin blog, "Ubershaders"); Citra translates the guest's shader programs into host shaders
  (Citra site archive, "Hardware Renderer Updates").

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
- **Used by:** per-game blending options in PCSX2; Xenia's work on depth formats.

### 8. Floating point: host defaults, per-game settings, or bit-exact software

- **What:** run guest arithmetic on the host FPU, adjust it by per-game rounding and clamping,
  or emulate the guest's rules exactly in software.
- **Costs:** host defaults break games; per-game settings need a database; bit-exact emulation is slow.
- **Gains:** in that order, speed, listed titles working, and correctness everywhere.
- **Used by:** PCSX2 and Dolphin use per-game settings.

### 9. Interpreter, block recompiler, or recompiler through an intermediate form

- **What:** interpret guest instructions; translate blocks directly to host code;
  or translate through an intermediate form with optimisation passes.
- **Costs:** an interpreter cannot keep up with the faster guests of the era;
  recompilers need invalidation for code that changes, and a back end per host architecture.
- **Gains:** in that order, simplicity, speed, and portability of optimisation.
- **Used by:** Xenia describes an intermediate form; Wikipedia names several console emulators
  that recompile (secondary).

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
- **Used by:** `R0-02` found no project that states it accepts only user-decrypted input,
  and records Dolphin as embedding a published key instead.

## Implications for Rustalgia

These follow from the findings (inference).

- System software is the deciding question for most of this era.
  Options 1 and 2 feed `R2-12` (firmware and system software) and an ADR on firmware; each survey
  (`R1-13`, `R1-17`, `R1-19`, `R1-20`, `R1-22`, `R1-23`) records where its system's software lives.
- Options 5 to 7 feed `R2-05` (3D hardware and shader compilation) and `R4-05`
  (graphics libraries);
  the optional Vulkan features they need bear on which hosts can run an accurate renderer (`R3-05`, `R3-12`).
- Options 8 to 10 feed `R2-01` (CPU execution) and `R4-08`
  (recompilation in Rust);
  the iOS limit on dynamic recompilation, `R3-01`'s subject and not checked here,
  weighs hardest on this era and the next.
- Encrypted content splits the era's systems in two, which feeds the owner's choice among `R0-02`'s options 1 to 3,
  system by system, and `R6-01`.
- Audio DSPs that run uploaded programs feed `R2-06` (audio), with options 3 and 4;
  input that passes through system software, and controllers with no host equivalent, feed `R2-13`.
- Most sources are community wikis, maker talks and patents, and emulator projects' own writing;
  the surveys keep each emulator's account of itself apart from hardware facts.

## Open questions

- Do the PS2's vector units share every floating-point deviation of the core's FPU, in particular rounding towards zero?
  ps2tek's section is under the FPU; no vector-unit floating-point test results were found,
  and ps2autotests has only VU0 macro-mode integer and transfer tests.
  `R1-19`.
- What exact values do the GameCube's reciprocal estimates return?
  None of the pages read gives them.
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
  Several pages say so; `R0-05`'s finding that a tier does not show a single fact's origin
  ("What the evaluation cannot show"), a question `R0-01` first asked, applies.
- Which of options 1 to 11 apply to each system?
  Decisions for the owner after the surveys.

## Sources

Every source below was read on 2026-11-20.
MediaWiki pages were read as raw wikitext unless an entry says otherwise; "rev" is the revision.

Maker material: conference talks, manuals, standards, and patents:

- K. Kutaragi (Sony Computer Entertainment), "New Millennium for Computer Entertainment", keynote, Hot Chips 11 (1999):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.k1.kutaragi.pdf`.
- A. Kunimatsu and others (Toshiba, Sony), "5.5 GFLOPS Vector Units for Emotion Synthesis", Hot Chips 11 (1999):
  `https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/2_Mon/hc99.s3.1.Kunimatsu.pdf`.
- P. Sandon (IBM), "A PowerPC compatible processor supporting high-performance 3-D graphics" (Gekko), Hot Chips 13
  (2001): `https://old.hotchips.org/wp-content/uploads/hc_archives/hc13/2_Mon/06ibm-gekko.pdf`.
- Y. Kurose and others (Sony), "A 90nm embedded DRAM single chip LSI with a 3D graphics, H.264 codec engine,
  and a reconfigurable processor", Hot Chips 16 (2004):
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
- NVIDIA, `NV_register_combiners` extension specification, version 1.7 (2007-02-01), Khronos registry:
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
- Yet Another PSP Documentation, chapters 2 to 12, 23, and 26
  (last revised 2006): `https://hitmen.c02.at/files/yapspd/psp_doc/chap4.html` and sibling chapters.
- WiiBrew: "Paired single" (rev 120284), "Hardware/Broadway" (rev 121256), "Hardware/Starlet" (rev 118313), "Memory map"
  (rev 121456),
  "Hardware/DSP" (rev 116811), "Hardware/NAND" (rev 121606), "Hollywood/IRQs"
  (rev 123514),
  "Broadway/Clock Speed Control" (rev 121261), "Hardware/GX" (rev 110039), "Wiimote" (rev 123599), "IOS"
  (rev 123340),
  "Ticket" (rev 121442), "Boot0" (rev 117622):
  `https://wiibrew.org/w/index.php?title=Paired_single&action=raw` and sibling pages.
- WiiUBrew: "Hardware/Starbuck" (rev 4847), "Memory map" (rev 4859), "Hardware" (rev 4831), "Cafe OS"
  (rev 4900),
  "Hardware/DSP" (rev 4300), "Hardware/GX2" (rev 3754), "GamePad" (rev 4886), "GamePad/LVC" (rev 4069), "Disc drive"
  (rev 4872),
  "Boot process" (rev 3135): `https://wiiubrew.org/w/index.php?title=Hardware/Starbuck&action=raw` and sibling pages.
- 3dbrew: "Hardware" (rev 23948), "New_3DS" (rev 22478), "Memory layout" (rev 21472), "NDMA Registers"
  (rev 21618),
  "Corelink DMA Engines" (rev 21473), "Flash Filesystem" (rev 23624), "SD Filesystem"
  (rev 20468),
  "GPU/Internal Registers" (rev 23943), "GPU/Shader Instruction Set" (rev 22377), "GPU/External Registers"
  (rev 23708),
  "GPU/Fragment Lighting" (rev 20751), "HID Shared Memory" (rev 22352), "DSP:LoadComponent"
  (rev 15977),
  "DSP Memory Region" (rev 22774), "DSP Services" (rev 17913), "FIRM" (rev 22193), "NCCH" (rev 23516), "Services"
  (rev 23934);
  revisions from each page's information view:
  `https://www.3dbrew.org/w/index.php?title=Hardware&action=raw` and sibling pages.
- Vita Development Wiki: "Main_Processor" (rev 21601), "Venezia" (rev 20746), "Physical Memory" (rev 21616), "DMAC"
  (rev 21584),
  "Memory Card" (rev 21881), "GPU" (rev 21670), "SceGxm" (rev 21212), "SceAudio" (rev 19499), "SceNgs"
  (rev 19600),
  "Security" (rev 20413); read as rendered pages, and as raw wikitext where the research's first fetch was refused:
  `https://wiki.henkaku.xyz/vita/Main_Processor` and sibling pages.
- XboxDevWiki: "CPU" (rev 7347), "Xbox Hardware Overview" (rev 6007), "Memory" (rev 7416), "Kernel"
  (rev 6596),
  "Hard Drive" (rev 7037), "FATX" (rev 7419), "NV2A" (rev 6894), "NV2A/Pixel Combiner" (rev 6853), "NV2A/Vertex Shader"
  (rev 7422),
  "APU" (rev 7415), "Xbox Input Devices"
  (rev 7426): `https://xboxdevwiki.net/index.php?title=CPU&action=raw` and sibling pages.
- Free60 wiki, commit `f3d099ff` (2026-11-08): "Xenon (CPU)", "Xenos (GPU)", "Hypervisor", "NAND", "HDD", "XEX",
  "Boot_Process", "Kernel": `https://github.com/free60project/wiki/tree/master/docs`.
- vfpu-docs, commit `f283bbb8` (2025-05-29): `https://github.com/pspdev/vfpu-docs`.
- dreamcast.wiki: "Memory map" (rev 1865), "VRAM" (rev 508), "Hardware overview" (rev 2944), "VMU hardware overview"
  (rev 2997): `https://dreamcast.wiki/wiki/index.php?title=Memory_map&action=raw` and sibling pages.
- M. Comstedt, Dreamcast Programming: SH-4, memory map, PowerVR, Maple bus, GD-ROM, and bootstrap pages
  (the SH-4 and memory pages dated 2000), a personal site and so a lead: `http://mc.pp.se/dc/` and its pages.
- Sega Retro, "AICA" (rev 1163931): `https://segaretro.org/index.php?title=AICA&action=raw`.

Tests:

- ps2autotests, README and `tests/cpu/ee_fpu/arithmetic.expected`, commit `97469ffb` (2019-11-16):
  `https://github.com/unknownbrackets/ps2autotests`.
- SingleStepTests sh4 README, commit `48975cb1`: `https://github.com/SingleStepTests/sh4`.
- Teakra README, commit `3d697a18` (2025-08-24): `https://github.com/wwylele/teakra`.

Emulator projects' documentation and data (implementations' accounts):

- PCSX2, commit `84077463` (2026-11-15): `bin/resources/GameIndex.yaml`, `bin/docs/GameIndex.pdf`, and `README.md`:
  `https://github.com/PCSX2/pcsx2`.
- Dolphin: `Data/Sys/GameSettings`, commit `32a2b828`
  (2026-11-19 in the committer's time):
  `https://github.com/dolphin-emu/dolphin`; FAQ: `https://dolphin-emu.org/docs/faq/`; wiki, "Audio Emulation"
  (rev 177576)
  and "GameCube Main Menu" (rev 200620): `https://wiki.dolphin-emu.org/index.php?title=Audio_Emulation&action=raw`.
- Dolphin blog, read from captures because the live site refused automated requests
  (research log):
  "Pixel Processing Problems" (2014-03-15), capture of 2026-07-01 13:21:19; "Ubershaders" (2017-07-30),
  capture of 2026-11-03 20:18:59; "To the Screen with Hybrid XFB" (2017-11-19), capture of 2026-05-24 10:46:46:
  `http://web.archive.org/web/20261103201859/https://dolphin-emu.org/blog/2017/07/30/ubershaders/` and the others.
- Xenia: `docs/cpu.md`, `docs/kernel.md`, and `.github/CONTRIBUTING.md`, commit `95a5c3ee` (2026-02-18):
  `https://github.com/xenia-project/xenia/tree/master/docs`; "Leaving No Pixel Behind" (2021-04-27):
  `https://xenia.jp/updates/2021/04/27/leaving-no-pixel-behind-new-render-target-cache-3x3-resolution-scaling.html`.
- PPSSPP: README, commit `77106069`: `https://github.com/hrydgard/ppsspp`;
  "The PSP Media Engine and its implementation":
  `https://www.ppsspp.org/docs/development/ppsspp-internals/media-engine`.
- Play!, README: `https://github.com/jpd002/Play-`.
- Azahar, README, commit `cf42aef2`: `https://github.com/azahar-emu/azahar`.
- Citra site archive (archive of 2024-03-04): "HLE Audio Comes to Citra" (2016-05-20),
  "Accurate Audio Emulation Has Arrived" (2018-12-07), "Hardware Renderer Updates" (2018-03-10), and the FAQ:
  `https://citra.azahar-emu.org/entry/hle-audio-comes-to-citra/`, `.../entry/accurate-audio-emulation/`,
  `.../entry/improvements-to-hardware-renderer/`, and `.../wiki/faq/`.
- xemu, home page, FAQ, and "Required Files" (prose of a walled emulator): `https://xemu.app/docs/required-files/`.

Wikipedia, raw wikitext (tertiary):

- Emotion Engine (rev 1375786242), PlayStation 2 technical specifications (rev 1355643867), Espresso (processor)
  (rev 1362404111),
  AltiVec (rev 1347443903), Dynamic recompilation (rev 1386329890), PlayStation Portable (rev 1386784394), Nintendo 3DS
  (rev 1386371150),
  GameCube (rev 1386636021), Wii U (rev 1386323270), PowerVR (rev 1369795331), Xbox 360 technical specifications
  (rev 1386323517): `https://en.wikipedia.org/w/index.php?title=Emotion_Engine&action=raw` and sibling pages.
