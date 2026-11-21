---
title: License Rustalgia under GPL-3.0-or-later
status: draft
date: 2026-11-21
---

# License Rustalgia under GPL-3.0-or-later

## Context

The README says Rustalgia is licensed under "the GNU General Public License v3.0" and does not say which versions apply.
GPL-3.0 section 14 gives a recipient any version only when the program names none,
so the bare statement reads closest to "version 3 only", and no text settles it
([R0-03, "Rustalgia's licence as it stands"](../research/topics/R0-03-licence-strategy.md#rustalgias-licence-as-it-stands)).
The choice must be made while the owner is the only human holder: after outside contributions arrive,
changing it needs every contributor's consent.

Constraints:

- The licence stays GPL-3.0; R0-03 found no reason to leave copyleft
  ([R0-03, "Options and trade-offs"](../research/topics/R0-03-licence-strategy.md#options-and-trade-offs)).
- The statement must be readable by tools, in SPDX form
  ([R0-03, "Recommendation"](../research/topics/R0-03-licence-strategy.md#recommendation)).
- Material under CC BY-SA 4.0, such as the libretro database, may be used
  ([R0-05](../research/topics/R0-05-source-map.md)).

Already decided and not reopened: GPL-3.0 as the licence family,
and the reading rules of [ADR 0001](0001-restrict-reading-by-licence-tier.md).

## Options considered

### GPL-3.0-only

- **What:** state "version 3 only".
- **For:** the terms never change; CC BY-SA 4.0 material can be merged into the code.
- **Against:** any later move needs every holder, and a future version's added permissions never reach users.
- **Evidence:** none of the five emulators read uses it
  ([R0-03, "Which versions"](../research/topics/R0-03-licence-strategy.md#which-versions-only-or-later-or-a-proxy)).

### GPL-3.0-or-later

- **What:** state "version 3, or (at your option) any later version".
- **For:** matches every GPL emulator read; a later version needs no consent hunt.
- **Against:** the FSF writes the future terms; CC BY-SA 4.0 material must stay in separate files.
- **Evidence:** melonDS, bsnes, and PCSX2 state it, and Dolphin states GPL-2.0-or-later (same section).

### GPL-3.0 with the owner as proxy

- **What:** name the owner, under section 14, as the one who accepts later versions.
- **For:** keeps the choice with the project without a contributor agreement.
- **Against:** no emulator read uses it, so readers may misread it, and it lapses if the owner cannot act.
- **Evidence:** section 14 allows it; R0-03 found no user among the five emulators.

## Decision

We will license Rustalgia under GPL-3.0-or-later, stated in the README, the contribution guide, and SPDX form.

- It is the practice of every GPL emulator read, so contributors and packagers meet nothing unusual.
- A later GPL version can apply without asking every contributor, which no other option gives without a proxy.
- The CC BY-SA 4.0 limit is met by keeping such material in separate data files,
  which ship beside the program as an aggregate (GPL-3.0 section 5).

Revisit this if the FSF publishes a version that the project would not accept;
the code would then need a new ADR naming the versions it allows.

## Consequences

- Easier: code under GPL-3.0-or-later or GPL-2.0-or-later can be combined without a question of versions.
- Harder: CC BY-SA 4.0 material cannot be merged into the program's code; it stays in its own files.
- Given up: control over the terms of any future GPL version a recipient chooses.
- Work created: the README and the contribution guide state the scope;
  SPDX identifiers and `REUSE.toml` follow in their own change.
- Work created: the store permission and the contributor terms are decided in
  [ADR 0003](0003-permit-conveying-through-app-stores.md) and
  [ADR 0004](0004-take-contributions-on-the-outbound-licence.md).
- Risk: a file arrives from a "GPL-3.0-only" project and cannot be combined under "or later" without its holders.
  Sign: a dependency or imported file whose SPDX identifier ends in `-only`.
