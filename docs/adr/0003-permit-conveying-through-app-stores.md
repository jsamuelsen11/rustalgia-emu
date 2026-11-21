---
title: Permit conveying Rustalgia through app stores
status: draft
date: 2026-11-21
---

# Permit conveying Rustalgia through app stores

## Context

Rustalgia targets iOS and Android, and the app stores add terms of their own.
Apple's developer agreement requires a licence that is "non-transferable", which a GPL-3.0 grant cannot meet,
and any holder can ask Apple to remove an app whose terms conflict with the GPL
([R0-03, "Apple's App Store"](../research/topics/R0-03-licence-strategy.md#apples-app-store)).
VLC fixed the same conflict only by asking every author or rewriting their code;
while the owner is the only human holder, the owner can grant a permission alone
([R0-03, "Recommendation"](../research/topics/R0-03-licence-strategy.md#recommendation)).

Constraints:

- The code is licensed under GPL-3.0-or-later ([ADR 0002](0002-license-under-gpl-3-0-or-later.md)).
- Section 7 lets a holder add permissions for its own material, and anyone may remove them downstream
  ([R0-03, "Additional permissions"](../research/topics/R0-03-licence-strategy.md#additional-permissions-and-terms-under-section-7)).
- A ban on store distribution would be a further restriction that a recipient may remove (same section).

Already decided and not reopened: the store routes for each platform are settled in R3-03 and R3-06.

## Options considered

### No store permission

- **What:** ship plain GPL-3.0 to every store.
- **For:** nothing to write.
- **Against:** Apple's minimum terms conflict with the licence on the text; any holder can force a removal.
- **Evidence:** PPSSPP and RetroArch show no exception in their store listings,
  and no GPL complaint against them was found
  ([R0-03, "What GPL emulators do on the stores"](../research/topics/R0-03-licence-strategy.md#what-gpl-emulators-do-on-the-stores)).

### An open section 7 permission

- **What:** let anyone convey Rustalgia through a store whose terms add restrictions,
  provided they otherwise comply with the GPL, and make it part of the contribution terms.
- **For:** removes the conflict for the project's own code, and costs nothing while the owner is the only holder.
- **Against:** forks may strip it, and it covers GPL code from other projects only if their holders grant it too.
- **Evidence:** Signal grants a permission of this kind; no emulator was found to.

### A store reservation for the owner

- **What:** keep store distribution for the owner, as SameBoy does.
- **For:** the owner controls the store build.
- **Against:** under GPL-3.0 a restriction on others is removable, so it binds no one.
- **Evidence:** SameBoy uses it under a permissive licence, where it can bind.

### Relicense to a weaker copyleft

- **What:** move to MPL-2.0 or the LGPL, as VLC did.
- **For:** the store conflict goes away.
- **Against:** gives up copyleft over the whole program, which is more than the question needs.
- **Evidence:** VLC for iOS moved to MPL-2.0 or GPL-2.0-or-later; mGBA has used MPL-2.0 from the start.

## Decision

We will grant an open section 7 permission to convey Rustalgia through app stores,
written in [`LICENSE-EXCEPTIONS`](../../LICENSE-EXCEPTIONS) and included in the terms every contribution is made on.

- It is the only option that removes the conflict while keeping the GPL's copyleft.
- The owner can grant it alone now; after outside contributions it would need every contributor.
- It costs nothing to the GPL's users: the conveyor must still give the source and every GPL right.

The same file declines, under section 7(e), any trade mark right in the name "Rustalgia".

Revisit this if a store accepts plain GPL terms, or if a holder of code Rustalgia uses refuses the permission.

## Consequences

- Easier: a store build of the project's own code meets its store's terms without a conflict on the text.
- Harder: GPL code from other projects can enter a store build only if its holders grant the same permission.
- Given up: nothing in the GPL; a downstream fork may remove the permission from its copy.
- Work created: [ADR 0004](0004-take-contributions-on-the-outbound-licence.md) makes the permission part of the
  contribution terms; R4-04 checks each dependency's licence for store builds.
- Work created: store builds need an About screen with the legal notices and the source offer (R3-03, R3-06).
- Risk: a dependency under the GPL without the permission reaches a store build.
  Sign: a GPL crate or library in a build's licence report without a matching permission.
