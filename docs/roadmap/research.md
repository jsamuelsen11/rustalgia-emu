---
title: Research roadmap
status: approved
date: 2026-11-17
---

# Research roadmap

## Goal

Learn what it takes to build Rustalgia before designing any of it.
The research starts from the assumption that we know nothing.
It ends when we can write requirements and architecture decisions without guessing.

The research maps options and solves the questions it meets as it goes.
Where a choice between options is a design decision, a note recommends one with its reasons, and the owner decides.
Every system, platform, and technique stays in scope until the owner rules it out.

## Scope

- **Systems:** every console and handheld that has been on the market, old and new.
  Nintendo handhelds are required.
  PlayStation 1 and 2 are wanted.
  Other retro systems are a bonus.
- **Emulators:** the most used emulators for each system, and the ones that teach the most.
  We record what they do and why it works.
  We do not copy them.
- **Host platforms:** iOS, Android, Linux, and Windows, with other hosts noted as options.
- **Technology:** Rust and the languages it must work with, plus performance, testing, and project engineering.
- **Law and policy:** what constrains an emulator project, recorded as risks.

### How items work

- Each item has a stable ID.
  The phase number is the first digit.
- Each item produces one research note, named for its ID, in `docs/research/`.
  Emulator studies go in `emulators/`, topic studies in `topics/`, and spike reports in `spikes/`.
- An item is done when its note is merged with its status set to `approved`.
  The same pull request ticks the item here.
- An item starts only when the items it depends on are done.
  Every item in phases 1 to 5 depends on R0-01, and on R0-04 for the conventions it follows.
- A note states how each claim was checked.
  A claim from memory is marked as one.

## Milestones

### Phase 0: ground rules

Done when all six items are done.
Nothing else starts before R0-01.

- [x] **R0-01** Clean-room policy: which sources we may read, and how notes are taken.
- [x] **R0-02** Legal baseline: emulation case law, anti-circumvention law, firmware and keys, takedown history,
      and patents and trade marks as risks.
- [x] **R0-03** Licence strategy: GPL-3.0, app stores, contributor terms, dependency licences.
      Depends on R0-02, R0-06.
- [x] **R0-04** Glossary and research conventions.
      Adds the glossary and its structure contract.
- [x] **R0-05** Source map: the documentation hubs and essential reading for each system.
      Records each hub's licence, stated origin, rule on confidential material, and tier.
- [x] **R0-06** Provenance controls for agent-written work: logging, walls, similarity checks, and authorship.
      Depends on R0-01.

### Phase 1: landscape

Done when every survey, study, and synthesis item is done.

#### Hardware primers

Topic studies, two for each era.
A primer explains how the machines of one era work, and what that asks of an emulator,
using the systems that have a family survey as its examples.
A catalogue lists every dedicated console and handheld sold in the era, with its hardware and its best sources.
PC and Android handhelds, microconsoles, FPGA devices, and retro "mini" consoles are listed as emulator hosts,
which `R3-07` and `R3-12` cover, not as systems to emulate.
An era holds the systems whose family survey depends on its primer.
Where a survey depends on more than one primer, each of its systems belongs to the era of its own generation,
and the survey depends on the other primers for the hardware that its systems contain or carry over.

- [x] **R1-01** 8-bit and 16-bit consoles and handhelds: primer.
- [x] **R1-02** The 32-bit and 64-bit era: primer.
- [x] **R1-03** The sixth generation and the move to programmable graphics: primer.
- [x] **R1-04** Modern consoles and handhelds, including systems on sale today: primer.
- [x] **R1-05** 8-bit and 16-bit consoles and handhelds: catalogue.
- [x] **R1-06** The 32-bit and 64-bit era: catalogue.
- [x] **R1-07** The sixth generation and the move to programmable graphics: catalogue.
- [x] **R1-08** Modern consoles and handhelds, including systems on sale today: catalogue.

#### System family surveys

Topic studies.
Each lists the popular and the respected emulators for one family.
For each emulator it records status, licence, techniques, and host platforms.
It also records the family's legal exposure and how hard it is to emulate.

- [ ] **R1-10** Game Boy and Game Boy Color.
      Depends on R1-01.
- [ ] **R1-11** Game Boy Advance.
      Depends on R1-02.
- [ ] **R1-12** Nintendo DS and DSi.
      Depends on R1-02, R0-02.
- [ ] **R1-13** Nintendo 3DS.
      Depends on R1-02, R1-03, R0-02.
- [ ] **R1-14** Nintendo Switch and Switch 2.
      Depends on R1-04, R0-02.
- [ ] **R1-15** NES and SNES.
      Depends on R1-01.
- [ ] **R1-16** Nintendo 64.
      Depends on R1-02.
- [ ] **R1-17** GameCube, Wii, and Wii U. Depends on R1-03, R0-02.
- [ ] **R1-18** PlayStation 1.
      Depends on R1-02.
- [ ] **R1-19** PlayStation 2.
      Depends on R1-02, R1-03.
- [ ] **R1-20** PSP and Vita.
      Depends on R1-03, R0-02.
- [ ] **R1-21** PlayStation 3, 4, and 5.
      Depends on R1-04, R0-02.
- [ ] **R1-22** Sega: Master System, Game Gear, Genesis, Saturn, Dreamcast.
      Depends on R1-01, R1-02, R1-03.
- [ ] **R1-23** Xbox, Xbox 360, and later.
      Depends on R1-03, R1-04, R0-02.
- [ ] **R1-24** Arcade hardware.
      Depends on R1-01, R1-02, R1-03, R1-04.
- [ ] **R1-25** Other consoles, handhelds, and home computers: the systems that no other survey names.
      Depends on R1-01, R1-02, R1-03, R1-04, R1-05, R1-06, R1-07, R1-08.

#### Emulator studies

Emulator studies.
Each depends on the survey for its family and on R0-01.

Nintendo handhelds:

- [ ] **R1-30** SameBoy.
- [ ] **R1-31** Gambatte.
- [ ] **R1-32** mGBA.
- [ ] **R1-33** SkyEmu.
- [ ] **R1-34** melonDS.
- [ ] **R1-35** DeSmuME.
- [ ] **R1-36** Azahar.
- [ ] **R1-37** Panda3DS.

PlayStation:

- [ ] **R1-40** DuckStation.
      Documentation and behaviour only; its licence forbids derivatives.
- [ ] **R1-41** PCSX-Redux.
- [ ] **R1-42** PCSX2.
- [ ] **R1-43** Play!.
- [ ] **R1-44** PPSSPP.

Other systems:

- [ ] **R1-50** bsnes.
- [ ] **R1-51** Snes9x.
- [ ] **R1-52** Flycast.
- [ ] **R1-53** Dolphin.
- [ ] **R1-54** MAME.

Multi-system projects and mobile apps:

- [ ] **R1-60** ares.
- [ ] **R1-61** Mesen.
- [ ] **R1-62** jgenesis.
- [ ] **R1-63** RetroArch and the libretro API.
- [ ] **R1-64** BizHawk.
- [ ] **R1-65** Delta.
- [ ] **R1-66** Provenance.
- [ ] **R1-67** Single-system emulators written in Rust: dust, gopher64, rustboyadvance-ng, TetaNES, MartyPC.

#### Landscape synthesis

Topic studies.
Each depends on every survey and study above.

- [ ] **R1-90** Functional-area map: what every emulator has, what is shared across systems, what is not.
- [ ] **R1-91** Development patterns: what authors do, what went wrong, and what they regret.
- [ ] **R1-92** Feature baseline: what users of the popular emulators expect.

### Phase 2: cross-cutting engineering

Topic studies.
Done when all are done.
Each depends on R1-90.

- [ ] **R2-01** CPU execution: interpreters, cached interpreters, and dynamic recompilation.
- [ ] **R2-02** Memory: buses, address maps, and fast memory access.
- [ ] **R2-03** Timing and scheduling.
- [ ] **R2-04** Video: tile and sprite hardware, and software rendering.
- [ ] **R2-05** Video: 3D hardware, GPU-backed rendering, and shader compilation.
- [ ] **R2-06** Audio: synthesis and resampling.
- [ ] **R2-07** Sync: frame pacing, audio and video sync, and latency.
- [ ] **R2-08** Save states, determinism, rewind, and run-ahead.
- [ ] **R2-09** Netplay and local multiplayer links.
      Depends on R2-08.
- [ ] **R2-10** The boundary between core and frontend.
      Depends on R1-63.
- [ ] **R2-11** Media and storage formats.
      Depends on R0-02.
- [ ] **R2-12** Firmware: boot ROMs, replacements, and emulating a console's operating system.
      Depends on R0-02, R0-06.
- [ ] **R2-13** Input and peripherals.
- [ ] **R2-14** Debugging, tracing, cheats, and achievements.
- [ ] **R2-15** Verifying accuracy: test suites, input replays, and compatibility lists.

### Phase 3: host platforms

Topic studies.
Done when all are done.
Each depends on R1-92.

- [ ] **R3-01** iOS: the execution model, and what is possible without dynamic recompilation.
      Depends on R2-01.
- [ ] **R3-02** iOS: graphics, audio, files, controllers, and app lifecycle.
- [ ] **R3-03** iOS: App Store policy and other distribution routes.
      Depends on R0-03.
- [ ] **R3-04** Android: native code, storage, audio, and thermals.
- [ ] **R3-05** Android: graphics drivers and their differences.
- [ ] **R3-06** Android: Play policy, developer verification, and other distribution routes.
      Depends on R0-03.
- [ ] **R3-07** Linux: display, audio, input, packaging, and handheld devices.
- [ ] **R3-08** Windows: graphics, audio, input, signing, and ARM64.
- [ ] **R3-09** Cross-platform layers: one shared layer, Rust libraries, or native code for each platform.
- [ ] **R3-10** User interface: one shared interface or a native one for each platform.
- [ ] **R3-11** Accessibility, localisation, and privacy.
- [ ] **R3-12** Other hosts as options: macOS, the web, televisions, and handheld gaming devices.

### Phase 4: technology stack

Topic studies.
Done when all are done.

- [ ] **R4-01** Rust architecture patterns for emulator cores.
      Depends on R1-62, R1-67, R2-03.
- [ ] **R4-02** Rust with Swift.
      Depends on R3-02.
- [ ] **R4-03** Rust with Kotlin.
      Depends on R3-04.
- [ ] **R4-04** Rust with C and C++, and reusing existing libraries.
      Depends on R0-03.
- [ ] **R4-05** Graphics libraries and their maturity on each host.
      Depends on R2-05, R3-05.
- [ ] **R4-06** Audio, windowing, and input libraries.
      Depends on R3-09.
- [ ] **R4-07** User interface toolkits.
      Depends on R3-10.
- [ ] **R4-08** Dynamic recompilation in Rust, and designs that avoid it.
      Depends on R2-01, R3-01.
- [ ] **R4-09** Performance: profiling, benchmarking, and build tuning.
- [ ] **R4-10** Testing: test ROMs, instruction tests, frame comparison, fuzzing, coverage.
      Depends on R2-15.
- [ ] **R4-11** Testing on devices, and the continuous integration matrix.
- [ ] **R4-12** Workspace layout, build times, and release engineering.
- [ ] **R4-13** Supply chain, minimum Rust version, and the policy on unsafe code.

### Phase 5: hands-on spikes

Spike reports.
Throwaway experiments that answer what reading cannot.
Done when all are done.

- [ ] **R5-01** One Rust core drawing and playing sound inside a SwiftUI app and a Compose app.
      Depends on R4-02, R4-03.
- [ ] **R5-02** The same core behind generated bindings and a hand-written C interface, with the cost of each measured.
- [ ] **R5-03** A small CPU core run against public instruction test vectors.
      Depends on R4-10.
- [ ] **R5-04** Three bus designs for that core, benchmarked.
      Depends on R4-01, R5-03.
- [ ] **R5-05** A headless runner for public test ROMs in continuous integration.
      Depends on R5-03.
- [ ] **R5-06** Recorded input replayed on all four hosts, with identical frames.
      Depends on R2-08, R5-01.
- [ ] **R5-07** A toy recompiler against a cached interpreter, and what runs on an iPhone.
      Depends on R4-08.
- [ ] **R5-08** Binary size of two graphics stacks on Android.
      Depends on R4-05.
- [ ] **R5-09** A settings screen in two Rust toolkits on a real iPhone and Android phone.
      Depends on R4-07.
- [ ] **R5-10** A build of every target, with wall time and runner cost recorded.
      Depends on R4-11.
- [ ] **R5-11** An hour of fuzzing against a file parser.
      Depends on R4-10.
- [ ] **R5-12** PlayStation 1 behaviour measured on a console, where no clean source describes it.
      Depends on R1-18, R5-05.

### Phase 6: synthesis

Topic studies.
Done when all are done.
Each depends on every item in phases 1 to 5.

- [ ] **R6-01** System scope: what each system needs, its risks, and a proposed order.
- [ ] **R6-02** Quality targets: accuracy, latency, memory, binary size, battery, and startup time.
- [ ] **R6-03** The decisions that constraints force early, each written up as a candidate ADR.
- [ ] **R6-04** Seed requirements, drawn from the feature baseline and the quality targets.
- [ ] **R6-05** Exit review: what we still do not know, and whether requirements can start.

## Out of scope

- Deciding systems, platforms, libraries, or an architecture.
  The research recommends; the owner decides, and ADRs record the decisions.
- Writing requirements or ADRs.
  Phase 6 produces candidates only.
- Emulator code beyond the throwaway spikes.
- Reading leaked source code or documents, under any circumstances.
- Obtaining, using, or storing copyrighted games, firmware, or keys.
  Spikes use freely licensed test software.

## Risks and open questions

- **The research has no natural end.** Phase 6 exists to force a stop.
  R6-05 lists what stays unknown.
- **Facts go stale.**
  Store policy, operating system limits, and project status change within months.
  Each note is dated and states how its claims were checked.
- **Reading source code can taint later work.**
  R0-01 sets the rules before any emulator is studied.
- **Legal exposure differs by system.**
  Systems on sale today carry the most.
  R0-02 and the family surveys record it.
  Nothing here is legal advice.
- **iPhone may rule out dynamic recompilation.**
  If so, it limits which systems can run there.
  R3-01 and R5-07 settle it.
- **The licence may conflict with app stores.**
  R0-03 must finish before outside contributions arrive.
- **No Rust emulator for several systems appears to ship on both iOS and Android.**
  Phase 5 is where that gap is tested.
- **Is one note for each item the right size?**
  Each hardware primer was split into a primer and a catalogue before writing,
  because one note per era was estimated at two to three times the size of `R0-01`.
  Platform notes may need splitting once written.
- **Which items can run at the same time?**
  The dependencies allow much of phase 1 to run in parallel.
