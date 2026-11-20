---
title: Restrict what may be read by licence tier
status: approved
date: 2026-11-19
---

# Restrict what may be read by licence tier

## Context

Rustalgia studies existing emulators before it designs its own, and AI agents do most of the reading and writing.
Reading a source cannot be undone: once a work has been read,
access to it is conceded in any later dispute about copying.
The emulator studies in the research roadmap
(`R1-30` to `R1-67`) cannot start until the project says which sources may be opened.

Constraints:

- A clean room is evidence of independent creation, not a legal requirement
  (`docs/research/topics/R0-01-clean-room-policy.md`, "Reverse engineering and the legal status of a clean room").
- Licences of the emulators on the roadmap range from permissive to not free
  (same note, "Licences of the emulators on the roadmap").
- One community reference says it copies confidential material (same note, "Source categories and their provenance").
- An instruction alone has not stopped agents from opening a forbidden source
  (same note, "When AI agents read and write").
- Rustalgia is licensed under GPL-3.0.

Already decided and not reopened: leaked source code and documents are never read, and copyrighted games, firmware,
and keys are never obtained, used, or stored.

## Options considered

### Public documents and observation only

- **What:** open no emulator source at all; study documentation, talks, and behaviour.
- **For:** nothing is conceded, and the rule can be loosened later.
- **Against:** the slowest route, and it discards knowledge that open-source authors published for others to study.
- **Evidence:** the practice of Wine, Samba, and Nouveau (R0-01, "Policies of reimplementation projects").

### Read anything published, write independently

- **What:** open any public source and rely on writing the code differently.
- **For:** the widest knowledge.
- **Against:** concedes access to everything, including code whose licence gives no fallback if expression carries over.
- **Evidence:** subconscious copying and similar structure can infringe (R0-01, "Copyright").

### One reader/writer wall for every emulator

- **What:** a reader describes each emulator's behaviour, and a separate writer implements from the description.
- **For:** the form of separation that courts have credited as evidence.
- **Against:** heavy, and it does not address what a model already holds from training.
- **Evidence:** a wall that erodes counts against its owner (R0-01, IBM v LzLabs).

### Tiers by licence

- **What:** how a source is treated depends on its licence and its origin, from free reading to never opened.
- **For:** care is spent where the risk is; open-source code is used as its authors allow.
- **Against:** every source needs a tier, licences change, and reading still concedes access to what is read.
- **Evidence:** FreeDOS, Mono, and Wine key their reading rules to the licence (R0-01, option 2).

## Decision

We will sort every source into one of four tiers by its licence and its origin, and read it as its tier allows.
Rustalgia's own code is written independently in every tier.

| Tier | A source belongs here when | Code may be read by |
|---|---|---|
| Open | Its licence lets its code be combined with GPL-3.0 code | Anyone |
| Walled | It is open source, but its licence does not, or is unclear | A reader session only |
| Closed | It is not open source, or it is derived from a console maker's binary | Nobody |
| Tainted | Its maintainers say it copies confidential material | Nobody, and its prose is not read either |

### Open tier

- **Test:** every part being read is under MIT, BSD, ISC, zlib, Apache-2.0, MPL-2.0, CC0, the Unlicense,
  LGPL-2.1 or later, GPL-2.0 "or later", or GPL-3.0.
- **Today:** mGBA, SkyEmu, melonDS, Azahar, Panda3DS, PCSX2, Play!, PPSSPP, bsnes, Dolphin, ares, Mesen, jgenesis, dust,
  gopher64, rustboyadvance-ng, TetaNES, MartyPC, the RetroArch frontend, and SameBoy outside its iOS folder.
- **Allowed:** source code, tests, commit history, issue threads, pull requests, and all prose.
- **Not allowed:** copying or porting any of it, and reading a replacement BIOS or boot ROM inside the repository,
  which is closed.

### Walled tier

- **Test:** the project publishes its source under an open-source licence, but the licence is GPL-2.0 "only", AGPL-3.0,
  GPL-2.0 with "only" or "or later" not stated, or a mix that the project has not resolved.
  A source that has not been given a tier is also walled.
- **Today:** DeSmuME, PCSX-Redux, Flycast, the maintained Gambatte forks, Delta, MAME, BizHawk, Provenance,
  libretro cores under other licences, and SameBoy's iOS folder.
- **Allowed to anyone:** prose only.
- **Allowed to a reader:** everything in the open tier's list.
  A reader is a session the owner starts with `RUSTALGIA_SOURCE_ROLE=reader` to study one emulator.
  It writes down behaviour, formats, and values as functional descriptions, with no code and no listings.
- **Not allowed:** a session that writes Rustalgia code for a system opening that system's walled sources.

### Closed tier

- **Test:** the licence forbids derivatives or commercial use, or there is no licence;
  or the work is a decompilation or disassembly of a game or of firmware;
  or it is a reimplementation of a console's BIOS, boot ROM, or system software, wherever it is hosted.
- **Today:** DuckStation, Snes9x, the upstream Gambatte repository, the pret, ZeldaRET, and n64decomp projects,
  OpenBIOS, and the replacement BIOS or boot ROM code inside SameBoy, mGBA, SkyEmu, and other emulators.
- **Allowed:** prose only, and observing the program's behaviour by running it.
- **Not allowed:** source code, issue threads, and pull requests, for any session.

### Tainted tier

- **Test:** the people who maintain the reference say that it copies or paraphrases a console maker's confidential code
  or documents; or it is the document that statement is about.
- **Today:** the psx-spx PlayStation reference and the Nocash PlayStation specification it descends from.
- **Allowed:** nothing.
  Its licence and policy statements may be quoted from R0-01, which already records them.
- **Not allowed:** opening it, or relying on a fact that is known only from it.

### In every tier

- Prose means a README, a licence file, a contributing guide, a wiki, a blog, release notes, and documentation.
  It stops where code begins.
- Code is never copied or ported.
  What is learned is cited, and the implementation is written independently.
- Leaked source code and documents are never read.

The deciding factors:

- Reading cannot be undone, so the strictest treatment goes where a licence gives no fallback.
- A published open-source licence is its author's permission to study the work.

Revisit this if a walled or closed project changes its licence, if a court ruling changes what reading concedes,
or if `R0-06` finds that agent-written code needs stricter controls.

## Consequences

- Easier: most emulators on the roadmap can be studied in full, and each study states its tier.
- Harder: every source read is access conceded.
  Similarity to an open-tier emulator must be explained by function, not by this rule.
- Harder: studies of walled emulators need a reader session started by the owner,
  and studies of closed ones rest on documentation and behaviour.
- Given up: the PlayStation reference at psx-spx and the document it descends from,
  although their accounts of its origin conflict.
  The hardware primer and the PlayStation survey must use other sources.
- Work created: `.claude/hooks/restricted-sources.txt` lists the walled, closed, and tainted sources,
  and `.claude/hooks/source-guard.sh` refuses tool calls that would open them.
  Each family survey confirms the tier of its emulators and extends the list.
- Work created: MAME, BizHawk, and Provenance mix licences and start as walled; their surveys settle the tier.
- Work created: the hook lists repositories,
  so it cannot tell a replacement BIOS inside an open-tier emulator from the rest of that emulator.
  That part of the closed tier rests on the written rule.
- Not decided here: who may contribute (`R0-03`), and provenance controls for agent-written work (`R0-06`).
- Risk: the hook does not see search results, summaries, or what a model memorised in training.
  Sign: a note or code that cites nothing for a detail a restricted source is known for.
- Risk: the list falls behind a licence change.
  Sign: a survey records a licence that differs from the list.
