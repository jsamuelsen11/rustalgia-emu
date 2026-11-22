---
title: Dual-license the project's documents under the GPL or CC BY-SA 4.0
status: approved
date: 2026-11-21
---

# Dual-license the project's documents under the GPL or CC BY-SA 4.0

## Context

The research notes, ADRs, and the source register are covered by the code's licence today.
That keeps them from going back to the community wikis Rustalgia learns from,
most of which use Creative Commons licences, and keeps CC material from being adapted into them
([R0-03, "The repository's documents and data"](../research/topics/R0-03-licence-strategy.md#the-repositorys-documents-and-data)).
The choice is easiest now, while the owner is the only human holder.

Constraints:

- The code is licensed under GPL-3.0-or-later ([ADR 0002](0002-license-under-gpl-3-0-or-later.md)).
- Notes quote sources, and quotations stay under their sources' terms
  ([docs/research/README.md](../research/README.md)).
- Text from the notes may become code comments.

## Options considered

### Documents under the code's licence

- **What:** keep `docs/` under GPL-3.0-or-later.
- **For:** one licence, and notes flow into code comments.
- **Against:** notes cannot go back to CC wikis, and CC text cannot be adapted in.
- **Evidence:** the current state; the Linux kernel applies its code licence to its documents.

### Documents under CC BY-SA 4.0

- **What:** license `docs/` separately under CC BY-SA 4.0.
- **For:** matches the wikis and KDE's rule for new documentation.
- **Against:** text cannot flow back from the notes into code under the GPL; two licences to explain.
- **Evidence:** KDE
  ([R0-03, same section](../research/topics/R0-03-licence-strategy.md#the-repositorys-documents-and-data)).

### Dual licence

- **What:** the project's own text under `GPL-3.0-or-later OR CC-BY-SA-4.0`,
  with imported text marked by its own licence.
- **For:** notes can go to code and to wikis; Creative Commons accepts the practice.
- **Against:** anything imported must be marked file by file.
- **Evidence:** Wikimedia dual-licenses with the GFDL in place of the GPL.

## Decision

We will license the project's own documents, the source register,
and the configuration under `GPL-3.0-or-later OR CC-BY-SA-4.0`,
and state that quotations stay under their sources' terms.

- It is the only option that lets the same text flow both into the code and to the wikis.
- The configuration and register take the same rule so that one statement covers every non-code file.
- Marking imported text is needed under any option, so the dual licence adds little.

Revisit this if a source the project depends on asks that adaptations of its text carry only its licence.

## Consequences

- Easier: a note, or part of one, can be offered to a wiki or used in a code comment.
- Harder: an imported passage longer than a quotation needs its own licence marking.
- Given up: nothing; each recipient chooses one of the two licences.
- Work created: the README states the rule now; `REUSE.toml` and `LICENSES/` record it per file in their own change.
- Risk: a note adapts CC BY-SA 3.0 or other one-way text and is then offered under the GPL.
  Sign: a file whose REUSE entry names a licence other than the two.
