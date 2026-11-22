---
title: Take contributions on the outbound licence
status: approved
date: 2026-11-21
---

# Take contributions on the outbound licence

## Context

The contribution guide says a contribution is licensed under GPL-3.0,
with no version scope and no record of who had the right to submit it
([R0-03, "Rustalgia's licence as it stands"](../research/topics/R0-03-licence-strategy.md#rustalgias-licence-as-it-stands)).
The terms must be settled before the first outside contribution, because changing them later reaches only new work.
Agents write most of the repository, and
whether their output is protected at all is unsettled
([R0-06](../research/topics/R0-06-provenance-controls.md#authorship-and-ownership-of-agent-written-code-and-text)).

Constraints:

- Contributions take the project's licence, GPL-3.0-or-later
  ([ADR 0002](0002-license-under-gpl-3-0-or-later.md)),
  with the store permission ([ADR 0003](0003-permit-conveying-through-app-stores.md)).
- The project has no organisation to hold an agreement or an assignment.
- Agent involvement is already recorded in commit trailers (R0-06).

## Options considered

### Inbound equals outbound, no sign-off

- **What:** a line in the contribution guide; contributors give the licence the project gives.
- **For:** the lightest for contributors; what Dolphin and mGBA use.
- **Against:** no record that each contributor had the right to submit.
- **Evidence:** [R0-03, "Contributor terms"](../research/topics/R0-03-licence-strategy.md#contributor-terms).

### Inbound equals outbound, with the DCO

- **What:** as above, plus a `Signed-off-by` line from a human contributor on each commit,
  certifying the [Developer Certificate of Origin](https://developercertificate.org/).
- **For:** a record for enforcement; the kernel and GCC use it, and require a person, not an agent, to sign.
- **Against:** one more trailer, and it does not settle whether a person can certify agent output.
- **Evidence:** same section, and [R0-06](../research/topics/R0-06-provenance-controls.md).

### A contributor licence agreement

- **What:** contributors grant a broad licence that allows later relicensing.
- **For:** new permissions or versions without asking each contributor.
- **Against:** friction; its "original creation" wording fits agent output badly; it needs a holder.
- **Evidence:** Signal, Apache, and Google use one (same section).

### Assignment

- **What:** contributors assign copyright to one holder.
- **For:** one holder who can enforce.
- **Against:** the most friction, and it adds nothing for output that is not protected; GCC dropped it in 2021.
- **Evidence:** the FSF still uses it (same section).

## Decision

We will take contributions on the outbound licence, GPL-3.0-or-later with the permissions in `LICENSE-EXCEPTIONS`,
and add a human sign-off under the DCO when the first outside contribution is accepted.

- It is what emulators use, so contributors meet nothing unusual.
- A contributor agreement and an assignment add no rights over agent output and need an organisation the project lacks.
- The DCO is deferred because, while the owner is the only human author, a sign-off records nothing new.
- An agent never adds a `Signed-off-by` line; a human who signs off answers for the change.

Revisit this if the project needs to relicense, which would need a contributor agreement for new work.

## Consequences

- Easier: a contributor needs no agreement and no account beyond the pull request.
- Harder: relicensing, or a new permission, needs every contributor's consent.
- Given up: a single holder who can enforce for the whole project.
- Work created: the contribution guide states the term now;
  the DCO rule and a check for it are added when the first outside contribution is accepted.
- Risk: an outside pull request is merged before the sign-off rule exists.
  Sign: a merged commit whose author is neither the owner, an agent, nor Dependabot.
