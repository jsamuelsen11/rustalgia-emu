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

We will decide what may be read by tier, as set out below, and write Rustalgia's own code in every tier.

| Tier | Sources | What may be read |
|---|---|---|
| Open | Emulators under a licence compatible with GPL-3.0 | Everything, including code and issue threads |
| Walled | Open-source emulators under an incompatible or unresolved licence | Prose by anyone; code by a reader |
| Closed | Emulators that are not open source or show no licence | Prose only |
| Closed | Decompilations and reimplementations of console firmware | Prose only |
| Tainted | References whose maintainers say they derive from confidential material | Nothing |

- Code is never copied or ported from any tier.
  What is learned is cited, and the implementation is written independently.
- A reader is a session that the owner starts for that purpose.
  It records behaviour, formats, and values as functional descriptions, with no code and no listings.
  A session that writes Rustalgia code for a system never opens that system's walled sources.
- Prose means a README, a licence, a contributing guide, a wiki, a blog, or documentation.
  It stops where code begins.
- A source with no tier yet is treated as walled.
- The deciding factors: reading cannot be undone, so the strictest treatment goes where a licence gives no fallback;
  and a published open-source licence is its author's permission to study the work.

Revisit this if a lawyer advises otherwise, if a walled or closed project changes its licence,
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
- Not decided here: who may contribute (`R0-03`), and provenance controls for agent-written work (`R0-06`).
- Risk: the hook does not see search results, summaries, or what a model memorised in training.
  Sign: a note or code that cites nothing for a detail a restricted source is known for.
- Risk: the list falls behind a licence change.
  Sign: a survey records a licence that differs from the list.
