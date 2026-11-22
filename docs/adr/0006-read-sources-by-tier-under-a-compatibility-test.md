---
title: Read sources by tier, under a licence compatibility test
status: approved
date: 2026-11-21
---

# Read sources by tier, under a licence compatibility test

## Context

[ADR 0001](0001-restrict-reading-by-licence-tier.md) sorts every source into four tiers and says what each allows.
Phase 0 and the phase 1 primers then met cases its tests leave open,
and the register gave each a tier on a note's reasoning, which a reviewer cannot check against the ADR.
An approved ADR is never rewritten, so this ADR restates ADR 0001 in full with those rules added, and replaces it.
The phase 1 surveys, which open many more repositories and wikis, should start under the written rules.

Constraints:

- The open test names a list of licences, and five licences met since are on neither side of it
  ([R0-03, "Licences the open tier does not name"](../research/topics/R0-03-licence-strategy.md#licences-the-open-tier-does-not-name)).
- R0-05 found seven rules that the register applies but the ADR does not state
  ([R0-05, option 9](../research/topics/R0-05-source-map.md#9-rules-adr-0001-does-not-yet-state)).
- R0-04 recommends that pseudo-code counts as code and that the glossary's definitions of BIOS, boot ROM,
  and system software become the ADR's terms
  ([R0-04, "Recommendation"](../research/topics/R0-04-glossary-and-conventions.md#recommendation)).
- R0-06 settled that a comparison by a machine alone counts as reading
  ([R0-06, "Recommendation"](../research/topics/R0-06-provenance-controls.md#recommendation)).
- R0-02 recommends rules for patents and for takedown history
  ([R0-02, "Recommendation"](../research/topics/R0-02-legal-baseline.md#recommendation)).
- Rustalgia is licensed under GPL-3.0-or-later ([ADR 0002](0002-license-under-gpl-3-0-or-later.md)).

Already decided and not reopened: the four tiers, the reader session, and the evaluation steps of ADR 0001;
leaked source code and documents are never read; copyrighted games, firmware, and keys are never obtained, used,
or stored.

## Options considered

### Keep ADR 0001, and leave the new rules in the notes and the register

- **What:** ADR 0001 stays as it is; each case is argued in the note that meets it.
- **For:** no change to an approved decision.
- **Against:** each later case is argued again, and a tier cites a note instead of the rule.
- **Evidence:** R0-05 counted seven such rules already applied in the register.

### Replace ADR 0001, keeping the open test as a named list

- **What:** write the new rules, and add the five licences to the open or walled list by name.
- **For:** a reader checks a licence against a list, with no judgement.
- **Against:** every licence not yet named is unresolved and walled until the ADR changes again.
- **Evidence:** five licences were unresolved within three days of ADR 0001.

### Replace ADR 0001, with the compatibility test as the open test

- **What:** write the new rules, and make the open test the question the list was standing for:
  can the code be combined with GPL-3.0 code, as the GNU licence list says.
- **For:** a new licence is settled by one lookup; the named licences become examples.
- **Against:** a licence the GNU list does not cover still needs a judgement, and is walled until it gets one.
- **Evidence:** the FSF's definition of compatibility is the test the list summarises (R0-03, same section).

## Decision

We will replace ADR 0001 with the rules below, with GPL-3.0 compatibility as the open test.

| Tier | A source belongs here when | Code may be read by |
|---|---|---|
| Open | Its licence lets its code be combined with GPL-3.0 code | Anyone |
| Walled | It is open source, but its licence does not, or is unclear | A reader session only |
| Closed | It is not open source, or it is derived from a console maker's binary or confidential material | Nobody |
| Tainted | Its maintainers say it copies confidential material | Nobody, and its prose is not read either |

### Open tier

- **Test:** every part being read is under a licence
  that the [GNU licence list](https://www.gnu.org/licenses/license-list.html) calls compatible with GPL-3.0,
  or with all versions of the GPL.
  Examples: MIT, X11, BSD-2-Clause, BSD-3-Clause, ISC, zlib, Apache-2.0, MPL-2.0, CC0, the Unlicense, CC BY 4.0,
  LGPL-2.1 or later, LGPL-3.0, GPL-2.0 "or later", and GPL-3.0.
  Where a source offers a choice of licences, one compatible choice is enough.
- **CC BY-SA 4.0:** open, because it can go one way into GPL-3.0; material under it is kept in its own files,
  never merged into code (ADR 0002).
- **Allowed:** source code, tests, commit history, issue threads, pull requests, and all prose.
- **Not allowed:** copying or porting any of it, and reading a replacement BIOS, boot ROM,
  or other system software inside the repository, which is closed.

### Walled tier

- **Test:** the source is published under an open-source licence that the GNU list calls incompatible with GPL-3.0,
  such as GPL-2.0 "only", AFL, or BSD-4-Clause; or it is under AGPL-3.0,
  GPL-2.0 with neither "only" nor "or later" stated, or a mix the project has not resolved;
  or its licence is not on the GNU list and has not been judged.
  A source that has not been given a tier is also walled.
- **Allowed to anyone:** prose only.
- **Allowed to a reader:** everything in the open tier's list.
  A reader is a session the owner starts with `RUSTALGIA_SOURCE_ROLE=reader` to study one emulator.
  It writes down behaviour, formats, and values as functional descriptions, with no code, no listings,
  and no pseudo-code.
- **Not allowed:** a session that writes Rustalgia code for a system opening that system's walled sources.

### Closed tier

- **Test:** the licence forbids derivatives or commercial use, or there is no licence;
  or the work is a decompilation or disassembly of a game or of firmware;
  or it is a reimplementation of a console's BIOS, boot ROM, or system software, wherever it is hosted.
  Replacement boot code for a cartridge, or for a coprocessor's ROM, counts as system software.
- **Allowed:** prose only, and observing the program's behaviour by running it.
- **Not allowed:** source code, issue threads, and pull requests, for any session.

### Tainted tier

- **Test:** the people who maintain the reference say that it copies or paraphrases a console maker's confidential code
  or documents; or it is the document that statement is about.
- **Today:** the psx-spx PlayStation reference and the Nocash PlayStation specification it descends from.
- **Allowed:** nothing.
  Its licence and policy statements may be quoted from R0-01, which already records them.
- **Not allowed:** opening it, or relying on a fact that is known only from it.

### Terms

- **BIOS, boot ROM, and system software** mean what the [glossary](../glossary/terms.md#bios) defines.
- **Code** includes pseudo-code: step-by-step listings of an algorithm, in any notation.
  A note or a reader's description uses sentences, tables, formulas, and diagrams instead.
- **Prose** means a README, a licence file, a contributing guide, a wiki, a blog, release notes, and documentation.
  It stops where code begins.
- **Reading** includes a comparison run by a machine alone against code,
  because the job holds a full copy and its report reproduces the matches.
  So no such comparison is run against code a session may not read.
- **Running** an open-tier or walled-tier test program, and using its results, is not reading its code.

### Sources that are not emulators

The four tiers apply to every kind of source.
For kinds other than emulators, the tests are:

| Kind | Open when | Otherwise |
|---|---|---|
| Material a console or chip maker published itself | Always; note any limit on reuse | Not applicable |
| Maker material that others host, with no sign the maker released it | Never | Closed |
| Maker document that survives only on third-party hosts | The maker's release of it is shown | Closed |
| Maker manual given out only under a confidentiality agreement | Never | Closed |
| Patent | Expired: always, as maker material | In force: subject and term only, never the claims |
| Community reference: wiki, specification, or hash catalogue | No claim of a confidential origin | Tainted or closed |
| Test software and test vectors | Results always; code by its licence | Code walled or closed |
| Development kit or library | Its licence passes and its origin is not disputed | Closed |
| Site that offers games, firmware, or keys | Never | Closed |
| Forum, chat, video, or personal blog | Always, as a lead to a better source | Not applicable |

- A community reference is tainted when its own maintainers say it copies confidential material.
  It is closed when a named project or rights holder has publicly accused it of that.
  An unstated origin, or no stated licence, does not close a reference; the register records the gap.
- Where a source's author names leaked material as the origin of some pages, those pages are closed,
  and the rest keeps the source's tier.
  A page that only mentions a leak, without naming it as its origin, is closed as a precaution.
- A library whose origin is publicly disputed is closed, whatever its licence,
  and so is a library whose own README admits copied maker code.
- A fork inherits its parent's disputed origin.
- An emulator that says it mainly uses a tainted document is walled, whatever its licence.
- A test suite's register line names its oracle: hardware, an emulator, or not stated.
- A fact found only in a forum, a chat, a video, or a personal blog is a lead.
  It is not relied on until a better source or a test confirms it.
- A takedown in a source's history is recorded in its register line and does not by itself change its tier.

### Evaluating a new source

Before a source is opened beyond its prose, or cited for the first time:

1. Decide its kind: emulator, decompilation or firmware reimplementation, maker material, community reference,
   test software, library, site, or discussion.
2. Read its prose only: the licence file, the README, and any page on contributions, copyright, or policy.
   Record the licence, how it says its information was obtained, any rule on confidential material,
   and any public dispute about its origin.
3. Apply the tests in this order and stop at the first that fits: tainted, closed, walled, open.
   A source that fits none, or whose facts cannot be established, is walled.
4. Add it to the register, `.claude/hooks/source-register.txt`, with its tier, licence, stated origin, the date checked,
   and the evidence, in the same change that first opens or cites it.
5. The author of the change proposes the tier, and the owner accepts it by merging.

A tier is checked again when a family survey or the source map (`R0-05`) covers the source,
and whenever a change of licence or a new dispute is noticed.
The date in the register shows how old each evaluation is.
A source that is not in the register has not been evaluated.

The hook applies this on the spot for repositories on code hosts.
When a session tries to open code in a repository that is not in the register,
the hook blocks the call and asks for the steps above; the repository's prose stays open so that they can be done.
Once the line is added, the hook applies its tier and does not ask again.
A repository that has nothing to do with consoles or emulation, such as a tool this project uses,
is registered as `other` and is not restricted.

### In every tier

- Code is never copied or ported.
  What is learned is cited, and the implementation is written independently.
- Leaked source code and documents are never read.
- A fact that a source says it took from analysis of a boot ROM or firmware is not recorded,
  unless a hardware test confirms it; it is then stated with that test.

The deciding factors:

- The compatibility test settles a new licence with one lookup, where a named list leaves it walled until amended.
- Each added rule is one the register already applies, so writing it down changes no tier except by the open test.
- Reading cannot be undone, so the strictest treatment still goes where a licence gives no fallback.

Revisit this if a walled or closed project changes its licence, if a court ruling changes what reading concedes,
or if the GNU list changes its verdict on a licence the register relies on.

## Consequences

- Easier: a new licence is settled by the GNU list, and a reviewer checks a tier against a written rule.
- Changed tiers: SameSuite (X11), n64chain and asar (LGPL-3.0), and the libretro database
  (CC BY-SA 4.0) move from walled to open; ps2sdk (AFL-2.0) stays walled; devkitPro's calico stays on its origin check.
- Harder: the register depends on the GNU list, which the FSF can change; the register's date shows when it was read.
- Harder: pseudo-code is now code, so a note or a reader's description holds none,
  and nobody reads it in a closed source.
- Given up: comparing Rustalgia's code by machine against walled or closed code, as R0-06 found.
- Work created: [ADR 0001](0001-restrict-reading-by-licence-tier.md) becomes `superseded`; the instructions,
  the guard's messages, the register, the research guide, and the glossary point here.
- Work created: the per-page closures and the path rules still rest on the written rule
  where the guard cannot express them, until issues 31 to 33 are done.
- Risk: a licence the GNU list does not cover is opened by analogy.
  Sign: a register line marked open whose licence is not on the GNU list.
