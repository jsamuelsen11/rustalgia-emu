---
title: Licence strategy
roadmap_item: R0-03
status: approved
date: 2026-11-21
---

# Licence strategy

## Summary

This note asks how Rustalgia should hold its GPL-3.0 licence: which versions it names, how it reaches app stores,
what terms contributors give, which dependency licences it admits, and how its documents, data, and tests are licensed.

The repository says only "GNU General Public License v3.0", with no "only" or "or later" and no notice in any file.
While the owner is the only human contributor, the owner alone can still fix the version,
add a permission for app stores, and set the contributor terms;
each outside contribution under plain GPL-3.0 takes that freedom away for its code, as VLC's relicensing showed.

Apple's minimum terms for an App Store licence conflict with GPL-3.0 on the text,
and no such term was found in Google Play's or F-Droid's; GPL emulators ship on the App Store anyway,
and the exposure is a complaint by any one copyright holder.
Every crate an emulator is likely to use declares a licence GPL-3.0 can take in,
though the C libraries behind `-sys` crates need their own check.

"Options and trade-offs" ends with [recommendations for the owner](#recommendation): GPL-3.0-or-later,
an open section 7 permission for app stores written now,
inbound terms equal to outbound with a sign-off once others contribute, a dual licence for the documents,
and tests fetched rather than stored.
This note is not legal advice.

## Scope

- Question: what licence terms should Rustalgia state for its code, its documents, and its contributors,
  so that it can ship on every host it targets, take in the libraries it needs, and keep the choices it has now?
- Covered: what GPL-3.0 asks of a release; the version choice under section 14;
  additional permissions and terms under section 7; the terms of Apple's and Google's stores and F-Droid,
  as far as the licence choice needs them; contributor instruments; dependency licences and the tools that check them;
  the licences that [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md)'s open test leaves unnamed;
  test suites with no licence; the licence of the repository's documents and data; the project name.
- Left to other items: the law on emulation, firmware, patents, and trade marks ([R0-02](R0-02-legal-baseline.md));
  authorship of agent-written work and its records ([R0-06](R0-06-provenance-controls.md)); store policy in depth
  ([`R3-03`, `R3-06`](../../roadmap/research.md#phase-3-host-platforms));
  the Windows toolchain ([`R3-08`](../../roadmap/research.md#phase-3-host-platforms)); reuse of C
  and C++ libraries ([`R4-04`](../../roadmap/research.md#phase-4-technology-stack)).
- Researched on 2026-11-20, with gaps closed on 2026-11-21.
  Store terms are those in force on the day read, with the dates the pages give.
- How claims were checked: six research passes fetched every source on 2026-11-20 with `curl`,
  converted markup to text locally, and confirmed each quotation in the raw text.
  Findings added on 2026-11-21 rest on pages fetched that day in the same way.
  An independent pass then fetched the sources again and tested each claim, quotation, link, and marker,
  and its corrections were applied.
- A process call for this note: `www.gnu.org` refused every connection from this machine on 2026-11-20 and 2026-11-21
  (time-outs on ports 443 and 80, and in a browser) (research log).
  The licence text was read from GNU's FTP server, whose copy is byte-identical to the repository's `LICENSE`
  (tested locally with `cmp`, GNU diffutils 3.8, 2026-11-20),
  and the FAQ, the licence list, and three other GNU pages were read in existing Wayback Machine captures,
  cited with their full time stamps.
  The research guide allows a capture "when the live page is gone";
  this note reads a page that cannot be reached at all as gone for that purpose, and asks for no new capture.
- Where only part of a source was read, the finding says so.
  No emulator source code, decompilation, leaked material, firmware, key, or game was opened.
  From emulator projects, only licence files, READMEs, contribution guides,
  the first lines of one source file in open-tier projects, repository listings, and websites were read.

## Findings

### Rustalgia's licence as it stands

- The README says "Rustalgia is licensed under the GNU General Public License v3.0"
  and links `LICENSE` ([README](../../../README.md#license)).
  No file carries an `SPDX-License-Identifier` line, and there is no `LICENSES/` folder or `REUSE.toml`
  (observed with `git grep` and a listing, 2026-11-20).
- The contribution guide says "Your contribution is licensed under the GNU General Public License v3.0"
  ([CONTRIBUTING](../../../.github/CONTRIBUTING.md#legal-ground-rules)).
  That is inbound equal to outbound: contributors give the licence the project gives (inference).
- The git history shows one human author identity, Dependabot, and `Co-Authored-By` trailers naming Claude models,
  with no human `Signed-off-by` (observed in `git log`, 2026-11-20).
  So the owner is the only human holder of any copyright in the project's files, subject to
  [R0-06, "Authorship and ownership of agent-written code and text"](R0-06-provenance-controls.md#authorship-and-ownership-of-agent-written-code-and-text)
  on whether agent output is protected at all (inference).
- Section 14 of [GPL-3.0](https://ftp.gnu.org/gnu/Licenses/gpl-3.0.txt) gives a recipient any version only "If the
  Program does not specify a version number".
  The README names version 3 without "or any later version", so the reading closest to the text is "only",
  though no text read settles a bare "v3.0" (inference).
- Richard Stallman's essay asks licensors to write `GPL-3.0-only` or `GPL-3.0-or-later`,
  and calls the bare `GPL-3.0` identifier "old, ambiguous"
  ([For Clarity's Sake](https://web.archive.org/web/20261027043451/https://www.gnu.org/licenses/identify-licenses-clearly.html),
  capture 20261027043451, page dated 2022/01/22; one author's essay published by the FSF).
  The FSF's [how-to](https://web.archive.org/web/20261117082656/https://www.gnu.org/licenses/gpl-howto.html)
  (capture 20261117082656) recommends a notice in each file that says which versions apply.

### What GPL-3.0 asks of a release

- Corresponding Source is the whole build: "all the source code needed to generate, install, and
  (for an executable work)
  run the object code and to modify the work, including scripts to control those activities" (GPL-3.0 section 1).
  System Libraries are excluded, and so are general-purpose tools used unmodified that are not part of the work
  (same section).
  For Rustalgia, build scripts, Cargo manifests and lock files, shader sources,
  and packaging scripts belong in the published source (inference).
- A download satisfies section 6(d) when the conveyor offers "equivalent access to the Corresponding Source in the same
  way through the same place at no further charge", or clear directions to it, for as long as needed (GPL-3.0 section
  6).
  The FAQ asks for "clear and convenient instructions for how to get the source
  for the exact object code they downloaded"
  ([GPL FAQ](https://web.archive.org/web/20261118023556/https://www.gnu.org/licenses/gpl-faq.html), `#SourceInCVS`,
  capture 20261118023556, page dated 2026/01/13).
  A release page with the binaries and a source archive of the same commit meets this,
  while a link to the default branch does not name the exact source (inference).
- The written offer of section 6(b) applies to object code in a physical product and must stay "valid
  for at least three years" (GPL-3.0 section 6).
  For downloads, section 6(d) keeps the source available only while the object code is offered,
  so a release that ships source beside the binary ends its duty when the download ends (inference).
- "Propagation includes copying, distribution (with or without modification), making available to the public"
  (GPL-3.0 section 0).
  Nightly and CI builds offered to the public are therefore conveyed and need matching source (inference).
- Each copy carries the licence and notices (GPL-3.0 section 4).
  A modified version's interactive interfaces "must display Appropriate Legal Notices"
  (section 5(d)):
  a copyright notice, the absence of warranty, that the work may be conveyed under the licence, and how to view it
  (section 0).
  The duty binds those who convey a modified work, and lapses where the original program shows no such notices
  (section 5(d)).
  An About screen in each Rustalgia front end, with the licence text in the package, passes the duty on to every fork
  (inference).
- Charging is allowed and restricting is not: "You may charge any price or no price for each copy that you convey"
  (section 4),
  and "You may not impose any further restrictions on the exercise of the rights granted or affirmed under this License"
  (section 10).

### The User Product clause

- Installation Information is owed when object code is conveyed "in, or with, or specifically for use in,
  a User Product", and the conveying is part of a transaction in which possession of the product passes to the recipient
  (GPL-3.0 section 6).
  The duty lapses where no one "retains the ability to install modified object code on the User Product" (same).
- A download to a phone the user already owns transfers no device,
  so Rustalgia's own releases owe no Installation Information;
  a vendor who sells a handheld with Rustalgia preinstalled would owe it (inference).
  No FSF text or ruling applying the clause to app downloads was found
  (searched: the FAQ capture for "User Product", "Installation Information", "app", and "store").
- Users can still install modified builds: Android allows apps installed with ADB and, from August 2026,
  an advanced flow for unverified developers
  ([Android developer verification FAQ](https://developer.android.com/developer-verification/guides/faq),
  entries of 2025-09-11 and 2026-06-18), and Xcode can sign a build for one's own device (from memory).

### Which versions: "only", "or later", or a proxy

- Under "or any later version" a recipient may follow version 3 or any later version the FSF publishes,
  and "that proxy's public statement of acceptance of a version permanently authorizes you to choose that version"
  where the program names a proxy (GPL-3.0 section 14).
  Later versions impose "no additional obligations ... on any author or copyright holder" (same).
- The FAQ urges "or any later version" so that a future version's added permissions reach users at once
  (GPL FAQ, `#VersionThreeOrLater`, paraphrased because the page is under a no-derivatives licence).
  Stallman's essay adds that code under one version "only" cannot be merged with code under a different single version,
  and that relicensing later needs every later contributor's consent (For Clarity's Sake, paraphrased).
- Every GPL emulator read states "or later", and none states "only" (observed):

| Project | Licence as the project states it | Where | Per-file notice read |
|---|---|---|---|
| [melonDS](https://github.com/melonDS-emu/melonDS) | GPL-3.0 "or (at your option) any later version" | README | GNU notice text |
| [bsnes](https://github.com/bsnes-emu/bsnes) | GPL-3.0 or later; ISC-style for its libraries | `LICENSE.txt` | not checked |
| [PCSX2](https://github.com/PCSX2/pcsx2) | GPL, with no version scope in README or licence file | `COPYING.GPLv3` | `GPL-3.0+` |
| [Dolphin](https://github.com/dolphin-emu/dolphin) | "version 2 or later (GPLv2+)" | `Readme.md` | `GPL-2.0-or-later` |
| [mGBA](https://github.com/mgba-emu/mgba) | MPL-2.0, one named holder | README | MPL header |

- The table rests on each repository's README and licence file, and on the first lines of one source file:
  `src/ARCodeFile.cpp` (melonDS), `pcsx2/BuildVersion.cpp` (PCSX2), `Source/Core/Core/AchievementManager.cpp` (Dolphin),
  and `src/gba/gba.c` (mGBA), read on 2026-11-20 at commits `361ffa9501b6` (melonDS), `78474e5d39f5` (bsnes),
  `6bdd93d289a8` (PCSX2), `7dac5ec79049` (Dolphin), and `e6c17152dec0` (mGBA).
  PCSX2's `GPL-3.0+` is the deprecated SPDX spelling of "or later"
  ([SPDX License List](https://spdx.org/licenses/), version 3.29.0, which lists `GPL-3.0+` as deprecated) (observed).
- The two choices trade control for reach.
  "Or later" lets a future FSF version govern any recipient who elects it; "only" freezes the terms,
  and moving later needs every holder (GPL-3.0 section 14; inference).
  A proxy, such as the owner, keeps the decision with the project without a contributor agreement
  (section 14), but none of the five projects uses one (observed).
- CC BY-SA 4.0 material can enter a GPLv3 work but not one licensed "GPL version 3, or
  (at your option)
  any later version", unless Creative Commons is named as proxy under section 14
  ([GNU licence list](https://web.archive.org/web/20261118021016/https://www.gnu.org/licenses/license-list.html),
  `#ccbysa`, capture 20261118021016, page dated 2026/04/22).
  A separate data file shipped beside the program, rather than merged into it, is an aggregate and keeps its own licence
  (GPL-3.0 section 5, final paragraph; inference).

### Additional permissions and terms under section 7

- Permissions widen the licence, and any downstream conveyor "may at your option remove any additional permissions from
  that copy, or from any part of it" (GPL-3.0 section 7).
- Only a holder can add one, for its own material: "material, added by you to a covered work,
  for which you have or can give appropriate copyright permission" (section 7).
  The FAQ says other contributors "do not have to make the same exception for their code"
  (GPL FAQ, `#GPLIncompatibleLibs`).
  So an exception reaches only code whose holders grant it,
  and code taken from other GPL projects carries it only if its holders grant it too (inference).
- Six kinds of extra term are allowed for added material,
  among them preserving "specified reasonable legal notices or author attributions",
  marking modified versions as different,
  and "Declining to grant rights under trademark law for use of some trade names, trademarks, or service marks"
  (section 7(b), (c), (e)).
  "All other non-permissive additional terms are considered 'further restrictions'", and a recipient may remove them
  (section 7).
  A ban on store distribution or on commercial use would be such a removable term (inference).
- No section 7 permission was found in the five emulators above (observed in the files listed only).
  Signal's GPL-3.0 exception lets anyone convey,
  "Provided that you are otherwise in compliance with the GPLv3 for each covered work you convey",
  executables "through the Apple App Store" under other terms
  ([ScanCode LicenseDB, Signal exception](https://scancode-licensedb.aboutcode.org/signal-gpl-3.0-exception.html),
  a transcription, not Signal's own file; secondary).

### Apple's App Store

- The App Store's Usage Rules bind every app, whatever its licence:
  "Any other use of the Services and Content is a material breach of this Agreement", and Content includes apps
  ([Apple Media Services Terms](https://www.apple.com/legal/internet-services/itunes/us/terms.html), section F,
  last updated 14 September 2026).
  Among them: use only "for personal, noncommercial purposes", with exceptions Apple sets, with up to ten devices,
  at most five of them computers, signed in to an account at one time (same).
- A developer may supply its own EULA,
  but it "must include and may not be inconsistent with the minimum terms" of Exhibit B,
  whose item 2 requires "a non-transferable license to use the Licensed Application on any Apple-branded Products
  that the end user owns or controls"
  ([Apple Developer Program License Agreement](https://developer.apple.com/support/terms/apple-developer-program-license-agreement/),
  Schedule 1, section 3.2 and Exhibit B; the Agreement and Schedule 1 last updated 29 October 2026).
  A GPL-3.0 grant allows transfer and redistribution, so it cannot meet item 2 (inference).
- Apple's [Standard EULA](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/) exempts what the licensing
  terms "of any open-sourced components included with the Licensed Application" permit from its copying and modification
  limits, but its sentence "You may not transfer, redistribute or sublicense the Licensed Application" has no such
  exemption (section a; no date on the page).
  Whether the exemption helps when the whole app is GPL is not addressed by Apple (inference).
- The same agreement names the GNU GPL in its definition of FOSS,
  requires the developer to "comply with all applicable FOSS licensing terms",
  and lets Apple stop distributing an app whose terms conflict with its own (sections 1.2, 3.3.4(A)(v), and 5.1).
  It puts the burden on the developer; it does not forbid GPL apps (inference).
- The [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) say "retro game console
  and PC emulator apps can offer to download games"
  (4.7; last updated 16 October 2026),
  and mention no open-source licence (searched for "open source", "EULA", and "license agreement").
- In 2010 the FSF told Apple that the store's terms impose "numerous legal restrictions on use
  and distribution" of GNU Go, which GPLv2 forbids, and Apple removed the app
  ([FSF news, 25 May 2010](https://www.fsf.org/news/2010-05-app-store-compliance)).
  Its follow-up said "this analysis would apply to all versions of the GNU GPL and AGPL"
  ([FSF blog, 26 May 2010](https://www.fsf.org/blogs/licensing/more-about-the-app-store-gpl-enforcement)).
  Authority: the FSF's view in an enforcement letter, not a ruling.
  Apple's terms have changed since (inference from the 2026 dates above), and the FAQ capture has no entry on app stores
  (searched for "app store", "apple", and "store").
- VLC was removed from the App Store in January 2011 after one contributor's GPL complaint
  ([vlc-devel, 10 January 2011](https://mailman.videolan.org/pipermail/vlc-devel/2011-January/078047.html),
  mailing-list posts; the date from press, secondary).
  VideoLAN then moved libVLC to the LGPL: "All the developers have agreed to the relicensing, but a famous one,
  who refused to answer.
  His code was therefore rewritten." ([VideoLAN, 21 December 2011](https://www.videolan.org/press/lgpl-libvlc.html)).
  VLC for iOS is now "bi-licensed under the Mozilla Public License Version 2 as well
  as the GNU General Public License Version 2 or later" ([VLC for iOS](https://www.videolan.org/vlc/download-ios.html)).
- SameBoy reserves the store to its author for its iOS folder,
  whose files carry the condition that written permission from Lior Halphon "is required to distribute copies
  or substantial portions of the Software in a digital marketplace, such as Apple's App Store"
  ([SameBoy `LICENSE`](https://github.com/LIJI32/SameBoy/blob/master/LICENSE), the condition on the iOS directory).
  It is the reverse of an exception, under a permissive licence.

### Apple outside the App Store

- For apps distributed through alternative marketplaces or the web in the European Union, "Schedules 1, 2,
  and 3 to the Agreement do not apply", so Exhibit B's minimum terms fall away there, while the FOSS clauses remain
  (Developer Program License Agreement, Attachment 14, section 2.3(C)).
  Apple still "encrypts and signs all iOS and iPadOS apps intended for alternative distribution"
  ([Apple, apps in the EU](https://developer.apple.com/support/dma-and-apps-in-the-eu/)).
- Web Distribution needs enrolment "as an organization" and one of several financial or standing tests
  (Attachment 14, section 2.1; [Web Distribution](https://developer.apple.com/support/web-distribution-eu/)),
  so it is out of reach for an individual owner (inference).
  A marketplace can list others' apps:
  [AltStore](https://altstore.io/) says "Anyone can distribute their apps with AltStore" by hosting a source,
  and Delta ships through AltStore PAL or the App Store ([Delta user guide](https://faq.deltaemulator.com/), home page).
  AltStore offers PAL "only in the European Union, Japan, & Brazil" (AltStore).
- [TestFlight](https://developer.apple.com/testflight/) allows up to 10,000 external testers,
  and the first build must be approved by App Review; testers accept the TestFlight terms
  (Developer Program License Agreement, section 1.2).
  It raises the store's question for a smaller audience, and is not a separate licensing route (inference).
- [Regulation (EU) 2022/1925](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32022R1925), Article 6(4),
  requires a gatekeeper to "allow and technically enable the installation
  and effective use of third-party software applications or software application stores", subject to integrity measures.

### Android

- Google Play's agreement lets a developer add its own EULA, "but,
  to the extent that EULA conflicts with this Agreement, this Agreement will supersede the EULA"
  ([Developer Distribution Agreement](https://play.google/developer-distribution-agreement.html), section 5.3,
  effective 15 September 2025).
  The [Play Terms of Service](https://play.google/intl/en_us/play-terms/) bar redistributing content "except
  as expressly authorized and only in the exact manner provided", and say apps "may be governed by" the developer's EULA
  (section 4, dated 17 November 2026).
  The GPL's grant can be read as such an authorisation, and no term like Apple's Exhibit B was found (inference).
- Developer verification began on 30 September 2026 for installs from participating stores in Brazil, Indonesia,
  Singapore, and Thailand, on certified devices running Android 8 or later,
  and is to expand to all apps on certified devices in 2027
  ([Android developer verification](https://developer.android.com/developer-verification)).
  Apps from open-source repositories can keep shipping without registering the app, with users taking the advanced flow
  ([open-source registration guide](https://developer.android.com/developer-verification/guides/open-source-app-registration)).
  It concerns identity, not the licence (inference).
- [F-Droid](https://f-droid.org/docs/Inclusion_Policy/) takes only FLOSS, "for example,
  released under a GPL or Apache license", builds apps from source where it can,
  and forbids proprietary tracking libraries.
  Dolphin, PPSSPP, and RetroArch are listed there
  ([Dolphin](https://f-droid.org/en/packages/org.dolphinemu.dolphinemu/),
  [PPSSPP](https://f-droid.org/en/packages/org.ppsspp.ppsspp/),
  [RetroArch](https://f-droid.org/en/packages/com.retroarch/)).

### What GPL emulators do on the stores

| Emulator | Licence | iOS | Android | Licence term in the listing |
|---|---|---|---|---|
| PPSSPP | GPL-2.0 or later | [App Store](https://apps.apple.com/us/app/id6496972903) | Play, F-Droid | none shown |
| RetroArch | GPL-3.0 | [App Store](https://apps.apple.com/us/app/id6499539433) | Play, F-Droid | not checked |
| Delta | AGPL-3.0 | App Store, AltStore PAL | not checked | Delta's own terms of use |
| Provenance | BSD-style | [App Store](https://apps.apple.com/us/app/id1596862805) | not checked | Apple's Standard EULA, by the listing |
| Dolphin | GPL-2.0 or later | none | [Play](https://play.google.com/store/apps/details?id=org.dolphinemu.dolphinemu), F-Droid | "GNU GPL v3+" |

- The table rests on the store listings and project pages read on 2026-11-20
  ([PPSSPP downloads](https://www.ppsspp.org/download/),
  [RetroArch platforms](https://www.retroarch.com/?page=platforms),
  [Delta's App Store listing](https://apps.apple.com/us/app/id1048524688),
  and [Dolphin's FAQ](https://dolphin-emu.org/docs/faq/)).
  Provenance bundles cores under GPL-2.0-or-later and GPL-3.0-or-later and sells optional features
  ([Provenance licences](https://provenance-emu.com/licenses/)) (observed).
- No complaint or takedown under the GPL against any of these was found
  (searched: the web, for "GPL emulator App Store takedown complaint", from 2024 on).
  The search found Apple's removal of iGBA in April 2024 under its copyright guideline, as a copy of another app,
  which [R0-02](R0-02-legal-baseline.md) records, and a forum thread on RetroArch's removal that gives no reason (lead);
  RetroArch's listing is live.
  Practice tolerates GPL apps on the App Store; the exposure is a complaint by any holder, as with VLC (inference).

### Contributor terms

- The [Developer Certificate of Origin](https://developercertificate.org/) certifies
  that a contribution was created "in whole or in part by me" and
  that the contributor has "the right to submit it under the open source license indicated in the file" (clause (a)).
  It grants nothing, so it leaves relicensing and new permissions needing every holder (inference).
- The [Apache ICLA](https://www.apache.org/licenses/icla.pdf)
  (version 2.2)
  and [Google's CLA](https://cla.developers.google.com/about/google-individual) grant a "perpetual, worldwide,
  non-exclusive, no-charge, royalty-free, irrevocable copyright license" including the right to sublicense,
  (section 2), and the contributor keeps copyright (preamble).
  The recipient can relicense or add permissions without further consent (inference from "sublicense").
- The [Harmony template](https://harmonyagreements.org/docs/ha-combined-v1) offers outbound limits from "only under the
  terms of the license or licenses which We are using on the Submission Date" to "any license, including copyleft,
  permissive, commercial, or proprietary licenses" (section 2.3, options one and five).
  [Canonical's CLA](https://assets.ubuntu.com/v1/ff2478d1-Canonical-HA-CLA-ANY-I_v1.2.pdf)
  (version 1.2) uses option five.
- The FSF asks for assignment because "enforcement by copyright holders is a universal, straightforward,
  and powerful tool", and because it "allows us to grant additional permissions on a package, such as an exception,
  if the need should arise" ([FSF contributor FAQ](https://www.fsf.org/licensing/contributor-faq), 9 July 2021).
  KDE's [Fiduciary Licence Agreement](https://ev.kde.org/rules/fla/) is its "preferred form
  for assigning copyright" to KDE e.V., and KDE says "It is entirely optional".
- GitHub's terms make inbound equal to outbound by default:
  content added to a repository with a licence notice is licensed "under the same terms",
  unless a separate agreement says otherwise
  ([GitHub Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service), section D.6,
  effective 27 April 2026).
  GPL-3.0 itself has no such clause (observed).
- Emulators use a one-line inbound term and no CLA:
  [Dolphin](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md) licenses contributions
  after 1 December 2014 "under the GNU GPL version 2
  (or any later version)",
  and [mGBA](https://github.com/mgba-emu/mgba/blob/master/CONTRIBUTING.md) says "New code to mGBA will be licensed under
  the MPL 2.0 license".
  [R0-01](R0-01-clean-room-policy.md) found no sign-off rule in the roadmap's emulators.
- Dolphin's guide also bars contributors from using LLMs to make changes to the emulated console's behaviour,
  on the ground that models must be assumed to hold leaked Nintendo material (Dolphin `Contributing.md`, paraphrased).
- Signal's CLA licenses contributions on the condition
  that Signal "will make Your Contributions available under an OSI-approved open source license"
  ([Signal CLA](https://signal.org/cla/)), which leaves room for its store exception (inference).
- The Rust project's own projects are "generally dual-licensed" under Apache-2.0 and MIT
  ([Rust licences](https://www.rust-lang.org/policies/licenses)), with no CLA or sign-off in the
  [compiler's contribution guide](https://rustc-dev-guide.rust-lang.org/contributing.html) (observed).
- GCC "will now accept contributions with or without an FSF copyright assignment", taking the DCO as the alternative
  ([GCC Steering Committee, 1 June 2021](https://gcc.gnu.org/pipermail/gcc/2021-June/236182.html)),
  and requires a known identity for sign-off ([GCC DCO page](https://gcc.gnu.org/dco.html)).
- Relicensing without an agreement means finding every holder.
  VideoLAN reported "more than 80% of the copyright holders on VLC's core have agreed",
  and that without the rest "we will not change the license"
  ([VideoLAN, 7 September 2011](https://www.videolan.org/press/lgpl.html)).
  Dolphin's [FAQ](https://dolphin-emu.org/docs/faq/) says the project was relicensed to GPLv2 or later,
  and its inbound term dates from 1 December 2014 (Dolphin `Contributing.md`).
- Each holder enforces for its own code: reinstatement after a violation runs from "a particular copyright holder"
  (GPL-3.0 section 8).
  Hellwig's case against VMware was dismissed on procedure and standing
  ([Software Freedom Conservancy, 2 April 2019](https://sfconservancy.org/news/2019/apr/02/vmware-no-appeal/)),
  and a record of who wrote what is what an enforcing holder needs (inference).
  Conservancy's claim against Vizio as a third-party beneficiary of the GPL was set for trial in late 2026
  ([Conservancy, Vizio case](https://sfconservancy.org/copyleft-compliance/vizio.html), updated 27 February 2026).

### Contributions written by agents

- CLAs assume a human author: Apache's and Google's forms require each contribution to be "Your original creation"
  (Apache ICLA section 5; Google CLA).
  A wholly agent-written change may fit neither
  (inference, from [R0-06](R0-06-provenance-controls.md#authorship-and-ownership-of-agent-written-code-and-text)).
- OpenSSL has issued a new CLA: where a portion was generated by AI tools "and is not protected by copyright,
  You do not represent that portion as owned intellectual property"
  ([OpenSSL ICLA](https://openssl-library.org/policies/cla/openssl_icla.pdf), version 1.1, clause 8(c)).
  Its [AI policy](https://openssl-library.org/policies/general/ai-policy/) requires an `Assisted-by:` trailer
  and the new CLA together where a non-trivial portion of a submission was made with an AI tool.
- The TYPO3 board's draft says "A lack of copyright protection does not render code incompatible with the GPL",
  and "Where a piece of code attracts no copyright protection, no copyleft obligation is triggered"
  ([TYPO3 board statement](https://news.typo3.com/article/typo3-association-board-meeting-protocol-8-july-2026/board-statement-on-gpl-and-ai-code),
  section 2, draft of 20 July 2026).
  It declined a CLA on account of AI alone and pointed to a sign-off instead (section 6).
- Apache's unofficial draft says "there is no legal barrier to contributing material that is not copyrightable"
  ([Apache RAI draft](https://rai.apache.org/ai-generated-code.html)),
  and the [Linux Foundation](https://www.linuxfoundation.org/legal/generative-ai) says AI output "can be contributed",
  subject to tool terms and third-party material.
- So no agreement creates a copyright the law does not give,
  and a section 7 permission is not needed for parts with no copyright; copyleft does not reach those parts either,
  which is the risk R0-06 records (inference).
- Eclipse's template header marks the generated parts of a file as CC0 and outside the project's licence
  ([R0-06, "How other projects treat and record AI involvement"](R0-06-provenance-controls.md#how-other-projects-treat-and-record-ai-involvement)).
  Whether a human's selection and arrangement of agent-written changes makes the whole code base protected was found
  decided by no source ([R0-06, "Open questions"](R0-06-provenance-controls.md#open-questions)); this note records it as
  a risk to the reach of copyleft.

### Dependency licences

- GPL-3.0 excludes System Libraries from Corresponding Source: parts of the normal packaging of a Major Component,
  such as the kernel, the window system, or "a compiler used to produce the work",
  that serve only to use the work with it (section 1).
  Apple's frameworks, Android's platform libraries, and Windows system DLLs qualify (inference).
- Not every runtime does. "libc++ is not a system library", and if an Android app uses `libc++_shared.so`,
  "it must be included in your app"
  ([Android NDK, C++ library support](https://developer.android.com/ndk/guides/cpp-support), updated 6 November 2026).
  It is under Apache-2.0 with LLVM exceptions, which GPL-3.0 can take in (same page; inference).
- On Windows, the FAQ says a GPL program may link the Visual C++ runtime, which is then a System Library,
  but "You may not distribute these libraries in compiled DLL form with the program" (GPL FAQ, `#WindowsRuntimeAndGPL`).
  Microsoft limits redistribution of that runtime to licensed Visual Studio users
  ([Redistributing Visual C++ files](https://learn.microsoft.com/en-us/cpp/windows/redistributing-visual-cpp-files)),
  while the Universal CRT "ships as part of Windows 10 and later versions"
  ([CRT library features](https://learn.microsoft.com/en-us/cpp/c-runtime-library/crt-library-features)).
  GCC's own runtime libraries, such as libgcc and libstdc++, carry GCC's exception,
  which lets a combination with independent modules be conveyed "under terms of your choice,
  consistent with the licensing of the Independent Modules", provided the target code came from eligible compilation;
  which libraries Rust's GNU target links is from memory
  ([GCC Runtime Library Exception 3.1](https://web.archive.org/web/20261114170117/https://www.gnu.org/licenses/gcc-exception-3.1.html),
  section 1, capture 20261114170117).
- Apache-2.0 goes into GPL-3.0 one way:
  the Apache Software Foundation says Apache 2 software "can therefore be included in GPLv3 projects",
  while the FSF has never considered it compatible with GPLv2
  ([Apache, GPL compatibility](https://www.apache.org/licenses/GPL-compatibility.html)).
  Crates under Apache-2.0 alone, such as winit and cpal, are usable because Rustalgia is GPLv3 (inference).
- [MPL-2.0](https://www.mozilla.org/media/MPL/2.0/index.txt) names the GPL as a Secondary License
  (section 1.12),
  and a file opts out only by its author's choice: the Exhibit B notice,
  or first publication under MPL 1.1 without a GPL option
  ([MPL FAQ](https://www.mozilla.org/en-US/MPL/2.0/FAQ/), question 14, updated 30 January 2024).
  LGPL-3.0 is GPL-3.0 "supplemented by the additional permissions listed below"
  ([LGPL-3.0](https://spdx.org/licenses/LGPL-3.0-only.html)), and LGPL-2.1 lets a recipient apply the GPL instead
  ([LGPL-2.1](https://spdx.org/licenses/LGPL-2.1-only.html), section 3), including a newer GPL version than version 2
  (same section).
- AGPL-3.0 is "technically not compatible with GPLv3 in a strict sense",
  but separate modules under each may be combined in one project (GNU licence list, `#AGPL`).
- Fonts are separate works. egui's default fonts crate declares `(MIT OR Apache-2.0) AND OFL-1.1 AND Ubuntu-font-1.0`
  ([docs.rs, epaint_default_fonts 0.37.0](https://docs.rs/epaint_default_fonts/latest/epaint_default_fonts/)).
  The GNU list calls the [OFL](https://spdx.org/licenses/OFL-1.1.html) "a free copyleft license for fonts" (`#SILOFL`),
  and the [Ubuntu font licence](https://canonical.com/legal/font-licence) lets the fonts be "bundled, embedded,
  and redistributed provided the terms of this licence are met",
  while they "cannot be released under any other licence" (preamble).
  They ride with the program as separate works under their own licence (inference).
- The likely crates all declare licences GPL-3.0 can take in
  (each crate's `license` field in the [crates.io API](https://crates.io/api/v1/crates/winit),
  latest stable versions on 2026-11-20; self-declared, not checked against each crate's files):

| Declared licence | Crates |
|---|---|
| MIT OR Apache-2.0 | wgpu, naga, ash, rodio, egui, serde, libc, flate2, ndk, windows, metal |
| Apache-2.0/MIT, the older spelling of the same choice | gilrs |
| MIT | sdl3, iced, rfd, zip, objc2, alsa-sys, gtk-sys, libudev-sys |
| Apache-2.0 | winit, cpal, oboe, ab_glyph |
| MIT AND Zlib | sdl2-sys |
| Apache-2.0 AND ISC | ring |
| BSD-3-Clause | chd |
| MPL-2.0 | symphonia |
| MIT AND Apache-2.0 WITH LLVM-exception AND (MIT OR Apache-2.0) | compiler_builtins |

- The C libraries behind `-sys` crates carry their own licences.
  SDL 2.0 and newer is under the zlib licence
  ([SDL licence](https://www.libsdl.org/license.php)),
  and [zlib](https://zlib.net/zlib_license.html) asks only that origin is not misrepresented,
  altered versions are marked, and the notice stays.
  ALSA's library, GTK 3, and libudev are under LGPL-2.1 or later (from memory).
- [FFmpeg](https://ffmpeg.org/legal.html) is LGPL-2.1 or later,
  becomes GPL-2.0 or later when its GPL parts are built in,
  and a `--enable-nonfree` build cannot be redistributed with a GPL program (FFmpeg's checklist; inference).
- [libchdr](https://github.com/rtissera/libchdr) is BSD-3-Clause,
  and its README says the code "is based off of MAME's old C codebase",
  with third-party libraries under their own terms. [chd-rs](https://github.com/SnowflakePowered/chd-rs) calls itself a
  "Reimplementation of the CHD file format in pure Safe Rust" under the same licence.
  MAME's [legal page](https://web.archive.org/web/20261111203603/https://www.mamedev.org/legal.html)
  (capture 20261111203603, because the live site refused connections)
  gives GPL-2.0 or later from MAME 0.172, lets files carry other licences in their headers,
  and says "This license does not apply to prior versions of MAME".
  So code taken from MAME's older C codebase carries the older terms unless its authors relicensed it,
  and libchdr's origin needs checking before its code is read or used (inference).
- Enforcement tools cover different gaps.
  [cargo-deny](https://embarkstudios.github.io/cargo-deny/checks/licenses/cfg.html) denies any licence not on an allow
  list, can allow a licence for one crate only, and matches GNU identifiers exactly, so `GPL-3.0-only`,
  `GPL-3.0-or-later`, and `GPL-3.0` are separate entries (as of version 0.18.4); by default it checks build dependencies
  and not dev dependencies. [cargo-about](https://embarkstudios.github.io/cargo-about/) generates licence information
  for every crate in the dependency graph, which serves MIT's notice condition and Apache-2.0's copy of the licence
  (section 4(a)), and a NOTICE file's attributions where a crate ships one (section 4(d))
  ([MIT](https://spdx.org/licenses/MIT.html); [Apache-2.0](https://spdx.org/licenses/Apache-2.0.html); inference).
  [REUSE 3.3](https://reuse.software/spec-3.3/) declares a licence for every file,
  including vendored C and fonts that cargo-deny cannot see.
  None checks a C library a `-sys` crate links from the system (inference).

### Licences the open tier does not name

ADR 0001's open test names a list of licences
([ADR 0001, "Open tier"](../../adr/0001-restrict-reading-by-licence-tier.md#open-tier)).
The FSF's definition, that a licence is compatible
when "you can combine code released under the other license with code released under the GNU GPL in one larger program"
(GPL FAQ, `#WhatDoesCompatMean`), is the same test.
[R0-05](R0-05-source-map.md) left these licences to this note:

| Licence | Where met | FSF verdict | Tier by the test |
|---|---|---|---|
| X11 | SameSuite | "compatible with the GNU GPL" (`#X11License`) | open |
| LGPL-3.0 | n64chain, asar | "compatible with GPLv3" (`#LGPLv3`) | open |
| ZPL-2.1 | devkitPro calico | "compatible with the GNU GPL" (`#Zope2.0`) | open by licence; origin unchecked |
| CC BY 4.0 | references | "compatible with all versions of the GNU GPL" (`#ccby`) | open |
| CC BY-SA 4.0 | libretro database, wikis | one way into GPLv3 (`#ccbysa`) | open, with the version limit above |
| AFL-2.0 | ps2sdk | "incompatible with the GNU GPL" (`#AcademicFreeLicense`) | walled |
| BSD-4-Clause | none yet | clause causes "incompatibility with the GNU GPL" (`#OriginalBSD`) | walled |
| CC BY-NC, any version | code marked NC ([R0-05](R0-05-source-map.md)) | nonfree (`#CC-BY-NC`) | closed |

- The verdicts are from the GNU licence list capture; each licence text was read on [SPDX](https://spdx.org/licenses/).
  The X11 licence differs from Expat only by a clause on using the X Consortium's name,
  which restricts a name and not the use of the code
  (GNU licence list, `#X11License`; [X11 text](https://spdx.org/licenses/X11.html); inference).
  The NC licences fail ADR 0001's closed test first, because the licence forbids commercial use.
- [Creative Commons](https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/) declared
  GPLv3 compatible with BY-SA 4.0 on 8 October 2015 and says "compatibility with the GPLv3 is one-way only".
- Against the CC BY 4.0 row, the [CC FAQ](https://creativecommons.org/faq/) says "our licenses are currently not
  compatible with the major software licenses", in general terms and undated.
- The register's lines for these sources were written before this note, and change only when the ADR does.

### Test suites with no licence

- Copyright subsists in "original works of authorship fixed in any tangible medium of expression",
  and the owner holds the rights to reproduce and distribute
  ([17 U.S.C. § 102](https://www.law.cornell.edu/uscode/text/17/102)(a);
  [§ 106](https://www.law.cornell.edu/uscode/text/17/106)(1), (3)).
  In the United Kingdom copying "includes storing the work in any medium by electronic means"
  ([Copyright, Designs and Patents Act 1988, section 17](https://www.legislation.gov.uk/ukpga/1988/48/section/17)(2)).
  Storing a test ROM in the repository copies it, and publishing the repository distributes it (inference).
- GitHub's terms let others use and fork content "through the Service", and exclude content created by others
  (GitHub Terms of Service, sections A and D.5).
  A mirror cannot pass on a licence its owner never had (inference).
  GitHub's guide says that without a licence, "nobody else can copy, distribute,
  or modify your work without being at risk of take-downs, shake-downs, or litigation"
  ([choosealicense, "No License"](https://choosealicense.com/no-permission/)).
- Practice splits.
  [TetaNES](https://github.com/lukexor/tetanes) stores 157 `.nes` test ROMs under `tetanes-core/test_roms`,
  many of them blargg's, with his readmes and no licence for them,
  and [mGBA](https://github.com/mgba-emu/mgba) stores 41 Game Boy test files under `cinema/gb/blargg`,
  with a licence file for its Mooneye folder but none for blargg's
  (observed in repository listings at commits `344b607bb40f` and `e6c17152dec0`).
  GitHub's code search for `"game-boy-test-roms/releases/download"` showed 58 files that download
  that bundle's releases at test time
  (observed in the result list, 2026-11-20; the search needs a signed-in account, so it is not linked).
  [mooneye-gb](https://github.com/Gekkio/mooneye-gb/blob/master/.github/workflows/ci.yml) downloads its author's own MIT
  test suite in CI, a step named "Download test ROMs" (observed at commit `3856dcbca82a`).
- Fetching at test time still makes a copy on the machine that runs the test,
  but it removes Rustalgia's distribution and keeps the files out of its history (§ 106(1), (3); inference).
  [R0-05](R0-05-source-map.md) found that older addresses for blargg's tests no longer serve them,
  so a fetched suite can vanish.
- Facts about behaviour, such as pass or fail and the result code a test prints, are outside protection,
  which never extends to "any idea, procedure, process, system, method of operation" (§ 102(b); inference).
  A baseline screenshot reproduces what the ROM draws, so text results avoid the question (inference).
- In ADR 0001's kinds table, the row for test software and test vectors reads "Results always; code by its licence"
  ([ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md)).
  A suite with no licence is closed, and the closed tier allows "observing the program's behaviour by running it";
  the ADR does not say whether running an open or walled test binary counts as reading its code (observed).

### The repository's documents and data

- GPL-3.0 is "a free, copyleft license for software and other kinds of works" (preamble),
  and its source rule uses "the preferred form of the work for making modifications to it" (section 1).
  A Markdown note is its own source, so the GPL is easy to meet for the repository's documents (inference).
- The FSF recommends the GFDL rather than the GPL for manuals and calls CC BY and CC BY-SA 4.0 suitable
  for educational works (GPL FAQ, `#GPLOtherThanSoftware`; GNU licence list, `#ccby`, `#ccbysa`; paraphrased).
  KDE requires "CC-BY-SA-4.0 or compatible licence" for documentation,
  lets documentation started before 2017 stay under the GFDL, allows its code licences in addition,
  and requires the REUSE specification
  ([KDE Licensing Policy](https://community.kde.org/Policies/Licensing_Policy), last edited 15 August 2025).
  The Linux kernel's SPDX rule extends to its `.rst` documents (observed)
  ([kernel licensing rules](https://docs.kernel.org/process/license-rules.html)).
- Creative Commons allows dual licensing, for example "under both a CC license and the GPL",
  after which "A reuser may then choose which set of terms to comply with" (CC FAQ).
  Wikimedia dual-licenses contributed text, and refuses to import text "available solely under GFDL"
  ([Wikimedia Terms of Use](https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use), section 7).
  A dual licence holds only for text the project owns, so imported text needs its own marking (inference).
- CC calls the BY-SA route into the GPL "not for general use", for adaptations hard to tell apart from code
  ([CC wiki, ShareAlike compatibility: GPLv3](https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3),
  last edited 29 September 2015).
- CC BY-SA 3.0 text, such as the Dolphin wiki's, cannot reach a GPL-only note in two steps,
  but can reach a note under BY-SA 4.0
  ([R0-04, "Quoting: licences on the source"](R0-04-glossary-and-conventions.md#quoting-licences-on-the-source);
  [BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/legalcode.txt), section 4(b); inference).
- The hubs Rustalgia learns from use CC0
  ([Pan Docs](https://gbdev.io/pandocs/About.html)),
  CC BY 4.0, CC BY-SA 4.0, CC BY-SA 3.0, and the GPL ([R0-05](R0-05-source-map.md)).
  GPL-only notes could not be given back to a CC wiki or to Pan Docs (inference).
- Quotations rest on quotation exceptions ([R0-04](R0-04-glossary-and-conventions.md)),
  and REUSE says "you can only apply licenses to your own works" ([REUSE FAQ](https://reuse.software/faq/)).
  So any notice licenses only the project's own text (inference).
- REUSE lets one `REUSE.toml` declare licences for files by path,
  lets a notice name a group such as "Contributors to Example Project",
  and allows `SPDX-FileCopyrightText: NONE` where no one holds copyright (REUSE 3.3; REUSE FAQ).
  That fits notes governed by structure contracts, which need no comment header,
  and agent-written files whose protection is unsettled (inference).
- Game databases, such as the save-type and checksum lists
  that [R1-02](R1-02-primer-32-and-64-bit.md) found emulators need, are lists of facts:
  a checksum and a save type are not "original works of authorship" (§ 102; inference).
  The [libretro database](https://github.com/libretro/libretro-database) is CC BY-SA 4.0 (register),
  and the European Union's database right can protect a database regardless
  ([R0-04](R0-04-glossary-and-conventions.md); inference).

### The project name and other licences met

- Section 7(e) lets the project decline trade mark rights in its name,
  and 7(c) require modified versions to be marked as different (GPL-3.0 section 7).
- The [Rust trademark policy](https://rustfoundation.org/policy/rust-trademark-policy/) allows "Rust" in the name of
  repositories "when referring to use with or compatibility with the Rust programming language", but "Using the Rust
  trademarks within another trademark requires written permission from the Rust Foundation and may include additional
  conditions of use and a fee for use" (no date on the page).
  A registered mark would be such a use; a store listing may be, if the name works as a mark (inference).
  A web search for "Rustalgia" found no other product of that name (secondary); no trade mark register was searched.
- Licences that bind a person, such as Panic's Playdate SDK licence ([R1-08](R1-08-catalogue-modern.md)),
  bind whoever accepted them; Rustalgia's licence cannot change that, so the exposure sits with each contributor
  (inference; [R0-01, option 10](R0-01-clean-room-policy.md#recommendation)).
- A compression format, such as the PS5's Kraken ([R1-08](R1-08-catalogue-modern.md)), is not licensed by copyright;
  an implementation is, and patents are [R0-02](R0-02-legal-baseline.md#patents-recorded-as-risks)'s question
  (inference).
- The patent grant in GPL-3.0 section 11 comes only from contributors, for their own claims,
  and does not reach console makers' patents
  ([R0-02, "Patents, recorded as risks"](R0-02-legal-baseline.md#patents-recorded-as-risks)).

## Options and trade-offs

The options answer six separate questions and can be combined.
Options 1 to 3 concern the GPL version, 4 to 7 app stores, 8 to 11 contributor terms, 12 to 14 the documents,
15 to 17 unlicensed tests, and 18 and 19 how the licence is stated.

### 1. GPL-3.0-only

- **What:** state "version 3 only".
- **Costs:** every later move needs every holder; future GPL permissions do not reach users;
  out of step with every GPL emulator read.
- **Gains:** the terms never change; CC BY-SA 4.0 material can be merged into code.
- **Used by:** none of the five emulators read.

### 2. GPL-3.0-or-later

- **What:** state "version 3, or (at your option) any later version".
- **Costs:** the FSF writes the future terms;
  BY-SA 4.0 material must stay in separate files or name Creative Commons as proxy.
- **Gains:** matches melonDS, bsnes, PCSX2, and Dolphin's practice; a later version needs no consent hunt.
- **Used by:** every GPL emulator read.

### 3. GPL-3.0 with the owner as proxy

- **What:** name the owner, under section 14, as the one who decides which later versions apply.
- **Costs:** none of the five emulators uses it, so readers may misread it,
  and the decision lapses if the owner cannot act (inference).
- **Gains:** keeps the choice with the project without a contributor agreement.
- **Used by:** none of the five emulators read.

### 4. No store permission

- **What:** ship plain GPL-3.0 to every store.
- **Costs:** Apple's Exhibit B conflicts with the licence on the text; any holder can ask Apple to remove the app.
- **Gains:** nothing to write.
- **Used by:** Dolphin on Play, whose listing names the GPL; PPSSPP and RetroArch show no exception in their listings
  (their licence files were not searched for one).

### 5. An open section 7 permission for stores

- **What:** a permission letting anyone convey Rustalgia through a store whose terms add restrictions,
  provided they otherwise comply with GPL-3.0, written now and made part of the inbound terms.
- **Costs:** forks may strip it; it covers code from other GPL projects only if their holders grant it too.
- **Gains:** removes the conflict for the project's own code; costs nothing while the owner is the only holder.
- **Used by:** Signal, by a transcription of its exception; no emulator found.

### 6. A store reservation for the author

- **What:** keep store distribution for the owner, as SameBoy does.
- **Costs:** under GPL-3.0 a restriction on others is removable, so it binds no one;
  it makes the store build a privilege.
- **Gains:** none under the GPL.
- **Used by:** SameBoy, under a permissive licence.

### 7. Relicense to a weaker copyleft

- **What:** move to MPL-2.0 or LGPL, as VLC did.
- **Costs:** gives up copyleft over the whole program; larger than the question needs.
- **Gains:** the store question goes away, as far as VLC's terms show.
- **Used by:** VLC for iOS (MPL-2.0 or GPL-2.0-or-later); mGBA has used MPL-2.0 from the start.

### 8. Inbound equals outbound, no sign-off

- **What:** keep the one-line term in the contribution guide.
- **Costs:** no record that each contributor had the right to submit.
- **Gains:** the lightest for contributors; what emulators use.
- **Used by:** Dolphin, mGBA, Rustalgia today.

### 9. Inbound equals outbound, with the DCO

- **What:** add a `Signed-off-by` from a human contributor to each commit; never from an agent.
- **Costs:** one trailer; does not settle whether a person can certify agent output (R0-06).
- **Gains:** a record for enforcement; what GCC uses.
- **Used by:** GCC; the kernel and GCC require a person, not an agent, to sign
  ([R0-06](R0-06-provenance-controls.md#how-other-projects-treat-and-record-ai-involvement)); TYPO3's board points to
  it.

### 10. A contributor licence agreement

- **What:** contributors grant a broad licence, perhaps bound to free licences, as Harmony allows.
- **Costs:** friction; its "original creation" wording fits agent output badly;
  Rustalgia has no organisation to hold it.
- **Gains:** later relicensing or new permissions without consent hunting.
- **Used by:** Signal, Canonical, OpenSSL, Apache.

### 11. Assignment

- **What:** contributors assign copyright, or license exclusively to a trustee.
- **Costs:** the most friction; GCC dropped the requirement in 2021; adds nothing for uncopyrighted output.
- **Gains:** one holder who can enforce.
- **Used by:** the FSF; KDE, as an optional form.

### 12. Documents under the code's licence

- **What:** notes, ADRs, and the register stay under GPL-3.0, as now.
- **Costs:** notes cannot go back to CC wikis or Pan Docs; BY-SA 3.0 text cannot be adapted in.
- **Gains:** one licence; notes flow into code comments.
- **Used by:** Rustalgia today; the kernel applies its SPDX rule to its documents.

### 13. Documents under CC BY-SA 4.0

- **What:** license `docs/` separately.
- **Costs:** code comments cannot flow back into the notes; two licences to explain.
- **Gains:** matches KDE's rule for new documentation and the wikis; can carry BY-SA 3.0 adaptations.
- **Used by:** KDE, which also allows its code licences in addition.

### 14. Documents dual-licensed under the GPL or CC BY-SA 4.0

- **What:** the project's own text under `GPL-3.0-or-later OR CC-BY-SA-4.0`,
  with imported text marked by its own licence.
- **Costs:** per-file marking for anything imported.
- **Gains:** notes can go to code and to wikis; CC sanctions the practice.
- **Used by:** Wikimedia, with the GFDL in place of the GPL; KDE's rule allows it.

### 15. Store unlicensed test suites

- **What:** commit the test ROMs, as TetaNES and mGBA do.
- **Costs:** a copy and a distribution with no permission behind them.
- **Gains:** offline, reproducible runs.
- **Used by:** TetaNES, mGBA.

### 16. Fetch at test time

- **What:** download each suite from a pinned address, check it against a recorded checksum, keep it out of the tree,
  and store only text results; ask each author for a licence meanwhile.
- **Costs:** the host can vanish; the runner still makes a copy.
- **Gains:** no distribution by Rustalgia; a takedown would reach the host, not the project (inference).
- **Used by:** the 58 files found by code search.

### 17. Use only licensed suites

- **What:** run only suites under a licence.
- **Costs:** gives up the only tests for several behaviours ([R0-05](R0-05-source-map.md)).
- **Gains:** no copyright question at all.
- **Used by:** mooneye-gb, for its author's own MIT suite.

### 18. A README statement only

- **What:** keep the licence in the README and `LICENSE`.
- **Costs:** no per-file statement; tools cannot read the scope.
- **Gains:** nothing to maintain.
- **Used by:** Rustalgia today.

### 19. SPDX identifiers and REUSE

- **What:** a `REUSE.toml` that covers `docs/**` and the configuration, SPDX headers in code once it exists,
  `LICENSES/` holding each text, and cargo-deny and cargo-about in the checks.
- **Costs:** a check to maintain.
- **Gains:** the version choice and each imported file's licence are machine-readable.
- **Used by:** KDE requires REUSE; the kernel, Dolphin, and PCSX2 use SPDX lines.

### Recommendation

Each recommendation is for the owner to decide,
and the first four depend on doing them before the first outside contribution.

- **Version (options 1 to 3):** option 2, GPL-3.0-or-later, stated in the README, the contribution guide, and SPDX form.
  Every GPL emulator read uses it, it avoids a consent hunt for a later version,
  and the BY-SA limit is met by keeping BY-SA data in separate files.
- **App stores (options 4 to 7):** option 5, an open permission written now and named in the inbound term.
  Apple's minimum terms conflict on the text,
  VLC shows that fixing it later costs consent from every author or a rewrite, and the owner can grant it alone today.
  Store builds then take no GPL code from other projects without the same permission.
- **Contributors (options 8 to 11):** option 8 now, moving to option 9 when the first outside contribution is accepted,
  with a human's sign-off and never an agent's.
  No CLA or assignment: neither adds rights over uncopyrighted output, and Rustalgia has no organisation to hold them.
- **Documents (options 12 to 14):** option 14, the project's own text under `GPL-3.0-or-later OR CC-BY-SA-4.0`,
  and a notice that quotations stay under their sources' terms.
  The register and configuration go under the same rule, for simplicity.
- **Tests (options 15 to 17):** option 16, with option 17 wherever a licensed suite covers the same behaviour.
- **Statement (options 18 and 19):** option 19, starting with `REUSE.toml` and `LICENSES/` now and adding cargo-deny,
  cargo-about, and SPDX headers with the first crate.
  The allow list names, in SPDX form, the licences of the crate table and ADR 0001's open test, Unicode-3.0,
  `GPL-3.0-only`, `LGPL-3.0-only`, and the GNU licences in their "or later" forms,
  with fonts allowed per crate and the `Apache-2.0/MIT` spelling checked against cargo-deny's parser.
  The GNU list calls the
  [Unicode License v3](https://web.archive.org/web/20261118021016/https://www.gnu.org/licenses/license-list.html)
  "compatible with all versions of the GNU GPL" (`#Unicodev3`).
- **Agent-written regions:** no separate licence for them, unlike Eclipse's CC0 marking.
  Marking them would give up copyleft over parts that may be protected through human selection,
  and the commit trailers already record agent involvement ([R0-06](R0-06-provenance-controls.md)).
- **Name:** keep "Rustalgia" as the repository name, which the Rust policy allows,
  and add a section 7(e) notice on the name; before a store listing or a registered mark,
  ask the Rust Foundation for permission or rename.

## Implications for Rustalgia

- The version, the store permission, and the contributor term feed a new ADR on the licence,
  which must be accepted before outside contributions arrive,
  as the [roadmap](../../roadmap/research.md#risks-and-open-questions) says.
  It changes `README.md`, [CONTRIBUTING](../../../.github/CONTRIBUTING.md), and adds `LICENSES/` and `REUSE.toml`.
- The tier table above feeds the pending amendment of [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md):
  replace the named list in the open test with the test itself,
  with the GNU list as the authority and the names as examples.
  That would move SameSuite, n64chain, asar, and the libretro database
  (with the BY-SA limit) to open, keep ps2sdk walled, and leave calico on its origin check.
  The same amendment needs a line saying that running an open or walled test binary is not reading its code;
  the closed tier already allows running a program.
- Store builds need an About screen with the legal notices, the licence text, and a notice file from cargo-about;
  [`R3-03`](../../roadmap/research.md#phase-3-host-platforms)
  and [`R3-06`](../../roadmap/research.md#phase-3-host-platforms) take the store routes from here,
  including AltStore PAL in the EU and F-Droid's build from source.
- Releases need a source archive of the exact commit beside each binary, nightly builds included.
  This becomes a requirement on the release process.
- [`R3-08`](../../roadmap/research.md#phase-3-host-platforms) chooses between the MSVC and GNU targets knowing
  that the Visual C++ runtime DLLs cannot ship with the program.
- [`R4-04`](../../roadmap/research.md#phase-4-technology-stack) checks libchdr's origin and its bundled libraries
  before any CHD code is used, and keeps FFmpeg free of `--enable-nonfree`.
  The test notes ([`R2-15`](../../roadmap/research.md#phase-2-cross-cutting-engineering),
  [`R4-10`](../../roadmap/research.md#phase-4-technology-stack)) take the fetch-at-test-time design.

## Open questions

- Will a court accept a third party's right to enforce the GPL, as Conservancy argues against Vizio?
  The trial set for late 2026 will answer it at first instance.
- Does a human's selection and arrangement of agent-written changes make a code base protected?
  Only a ruling can answer it; none was found.
- Will blargg and the other authors of unlicensed suites grant a licence?
  Asking them, which the owner would do, answers it.
- Was the older MAME code that libchdr is based on relicensed by its authors?
  MAME's legal page says its licence does not reach versions before 0.172;
  a reader session in [`R4-04`](../../roadmap/research.md#phase-4-technology-stack), started by the owner,
  can compare libchdr's history with MAME's, which is walled.
- Is "Rustalgia" registered as a trade mark anywhere?
  A search of the United States, European Union, and United Kingdom registers, whose tools need a browser session,
  answers it before any store listing.

## Sources

Every source below was read on 2026-11-20, except those marked "read 2026-11-21".
Each host is recorded in the [source register](../../../.claude/hooks/source-register.txt).
Pages on `www.gnu.org` were read in the captures named, because the live site did not answer.

Licences and their stewards:

- [GNU General Public License, version 3](https://ftp.gnu.org/gnu/Licenses/gpl-3.0.txt), 29 June 2007, GNU's FTP copy,
  identical to the repository's `LICENSE`.
- [GPL FAQ](https://web.archive.org/web/20261118023556/https://www.gnu.org/licenses/gpl-faq.html),
  capture 20261118023556, page dated 2026/01/13; read again 2026-11-21.
- [How to Use GNU Licenses](https://web.archive.org/web/20261117082656/https://www.gnu.org/licenses/gpl-howto.html),
  capture 20261117082656, page dated 2023/11/30.
- [For Clarity's Sake, Please Don't Say "Licensed under GNU GPL 2"!](https://web.archive.org/web/20261027043451/https://www.gnu.org/licenses/identify-licenses-clearly.html),
  capture 20261027043451, page dated 2022/01/22.
- [Various Licenses and Comments about Them](https://web.archive.org/web/20261118021016/https://www.gnu.org/licenses/license-list.html),
  capture 20261118021016, page dated 2026/04/22; read again 2026-11-21.
- [GCC Runtime Library Exception 3.1](https://web.archive.org/web/20261114170117/https://www.gnu.org/licenses/gcc-exception-3.1.html),
  capture 20261114170117, page dated 2022/01/10; read 2026-11-21.
- [FSF, "GPL Enforcement in Apple's App Store"](https://www.fsf.org/news/2010-05-app-store-compliance), 25 May 2010.
- [FSF, "More about the App Store GPL Enforcement"](https://www.fsf.org/blogs/licensing/more-about-the-app-store-gpl-enforcement),
  26 May 2010.
- [FSF, Contributor FAQ](https://www.fsf.org/licensing/contributor-faq), 9 July 2021.
- [SPDX License List](https://spdx.org/licenses/), version 3.29.0,
  with the texts of [LGPL-3.0](https://spdx.org/licenses/LGPL-3.0-only.html),
  [LGPL-2.1](https://spdx.org/licenses/LGPL-2.1-only.html), [OFL-1.1](https://spdx.org/licenses/OFL-1.1.html),
  [X11](https://spdx.org/licenses/X11.html), [MIT](https://spdx.org/licenses/MIT.html),
  and [Apache-2.0](https://spdx.org/licenses/Apache-2.0.html), the last two read 2026-11-21.
- [Mozilla Public License 2.0](https://www.mozilla.org/media/MPL/2.0/index.txt)
  and its [FAQ](https://www.mozilla.org/en-US/MPL/2.0/FAQ/), updated 30 January 2024.
- [Apache, "Apache License v2.0 and GPL Compatibility"](https://www.apache.org/licenses/GPL-compatibility.html).
- [Ubuntu font licence](https://canonical.com/legal/font-licence), version 1.0; read 2026-11-21.
- [ScanCode LicenseDB, Signal GPL-3.0 exception](https://scancode-licensedb.aboutcode.org/signal-gpl-3.0-exception.html).
- [Creative Commons, "Compatible Licenses"](https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/).
- [Creative Commons FAQ](https://creativecommons.org/faq/).
- [CC wiki, "ShareAlike compatibility: GPLv3"](https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3),
  last edited 29 September 2015.
- [CC BY-SA 3.0 Unported legal code](https://creativecommons.org/licenses/by-sa/3.0/legalcode.txt).
- [choosealicense, "No License"](https://choosealicense.com/no-permission/).
- [REUSE Specification 3.3](https://reuse.software/spec-3.3/) and [REUSE FAQ](https://reuse.software/faq/).

Stores and their terms:

- [Apple Media Services Terms and Conditions](https://www.apple.com/legal/internet-services/itunes/us/terms.html),
  last updated 14 September 2026.
- [Apple Licensed Application EULA](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/), undated.
- [Apple Developer Program License Agreement](https://developer.apple.com/support/terms/apple-developer-program-license-agreement/),
  the Agreement and Schedule 1 last updated 29 October 2026.
- [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/), last updated 16 October 2026.
- [Apple, "Update on apps distributed in the European Union"](https://developer.apple.com/support/dma-and-apps-in-the-eu/).
- [Apple, Web Distribution](https://developer.apple.com/support/web-distribution-eu/).
- [Apple, TestFlight](https://developer.apple.com/testflight/).
- [Regulation (EU) 2022/1925](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32022R1925),
  Official Journal text.
- [Google Play Developer Distribution Agreement](https://play.google/developer-distribution-agreement.html),
  effective 15 September 2025.
- [Google Play Terms of Service](https://play.google/intl/en_us/play-terms/), dated 17 November 2026.
- [Android developer verification](https://developer.android.com/developer-verification),
  its [FAQ](https://developer.android.com/developer-verification/guides/faq), and its
  [open-source registration guide](https://developer.android.com/developer-verification/guides/open-source-app-registration).
- [F-Droid Inclusion Policy](https://f-droid.org/docs/Inclusion_Policy/) and the package pages
  for [Dolphin](https://f-droid.org/en/packages/org.dolphinemu.dolphinemu/),
  [PPSSPP](https://f-droid.org/en/packages/org.ppsspp.ppsspp/),
  and [RetroArch](https://f-droid.org/en/packages/com.retroarch/).
- App Store listings for [PPSSPP](https://apps.apple.com/us/app/id6496972903),
  [RetroArch](https://apps.apple.com/us/app/id6499539433), [Delta](https://apps.apple.com/us/app/id1048524688),
  and [Provenance](https://apps.apple.com/us/app/id1596862805);
  [Dolphin on Google Play](https://play.google.com/store/apps/details?id=org.dolphinemu.dolphinemu).
- [AltStore](https://altstore.io/), [Delta user guide](https://faq.deltaemulator.com/),
  [Provenance licences](https://provenance-emu.com/licenses/), [PPSSPP downloads](https://www.ppsspp.org/download/),
  [RetroArch platforms](https://www.retroarch.com/?page=platforms),
  and [Dolphin FAQ](https://dolphin-emu.org/docs/faq/).
- [VideoLAN, libVLC relicensing, 21 December 2011](https://www.videolan.org/press/lgpl-libvlc.html),
  [VideoLAN, VLC engine relicensing, 7 September 2011](https://www.videolan.org/press/lgpl.html),
  [VLC for iOS](https://www.videolan.org/vlc/download-ios.html),
  and [vlc-devel, 10 January 2011](https://mailman.videolan.org/pipermail/vlc-devel/2011-January/078047.html).

Contributor terms:

- [Developer Certificate of Origin 1.1](https://developercertificate.org/).
- [Signal CLA](https://signal.org/cla/).
- [Apache Individual CLA](https://www.apache.org/licenses/icla.pdf), version 2.2.
- [Google Individual CLA](https://cla.developers.google.com/about/google-individual).
- [Harmony combined template](https://harmonyagreements.org/docs/ha-combined-v1), version 1.0.
- [Canonical Individual CLA](https://assets.ubuntu.com/v1/ff2478d1-Canonical-HA-CLA-ANY-I_v1.2.pdf), version 1.2.
- [KDE e.V., Fiduciary Licence Agreement](https://ev.kde.org/rules/fla/).
- [GitHub Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service),
  effective 27 April 2026.
- [GCC Steering Committee, "Update to GCC copyright assignment policy"](https://gcc.gnu.org/pipermail/gcc/2021-June/236182.html),
  1 June 2021, and [GCC DCO page](https://gcc.gnu.org/dco.html).
- [Rust licences](https://www.rust-lang.org/policies/licenses)
  and [rustc-dev-guide, Contributing](https://rustc-dev-guide.rust-lang.org/contributing.html).
- [OpenSSL ICLA](https://openssl-library.org/policies/cla/openssl_icla.pdf), version 1.1,
  and [OpenSSL AI policy](https://openssl-library.org/policies/general/ai-policy/).
- [Apache RAI draft, "AI-generated code in Apache projects"](https://rai.apache.org/ai-generated-code.html).
- [Linux Foundation, generative AI guidance](https://www.linuxfoundation.org/legal/generative-ai).
- [TYPO3 Association Board, statement on GPL and AI code](https://news.typo3.com/article/typo3-association-board-meeting-protocol-8-july-2026/board-statement-on-gpl-and-ai-code),
  draft of 20 July 2026.
- [Software Freedom Conservancy on Hellwig v VMware](https://sfconservancy.org/news/2019/apr/02/vmware-no-appeal/),
  2 April 2019, and [the Vizio case page](https://sfconservancy.org/copyleft-compliance/vizio.html),
  updated 27 February 2026.

Emulator projects, at the commits given in the findings:

- [melonDS](https://github.com/melonDS-emu/melonDS), [bsnes](https://github.com/bsnes-emu/bsnes),
  [PCSX2](https://github.com/PCSX2/pcsx2),
  [Dolphin](https://github.com/dolphin-emu/dolphin)
  and its [contribution guide](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md),
  [mGBA](https://github.com/mgba-emu/mgba)
  and its [contribution guide](https://github.com/mgba-emu/mgba/blob/master/CONTRIBUTING.md),
  [TetaNES](https://github.com/lukexor/tetanes),
  [mooneye-gb's CI workflow](https://github.com/Gekkio/mooneye-gb/blob/master/.github/workflows/ci.yml),
  and [SameBoy's `LICENSE`](https://github.com/LIJI32/SameBoy/blob/master/LICENSE).

Dependencies and tools:

- [Android NDK, "C++ library support"](https://developer.android.com/ndk/guides/cpp-support), updated 6 November 2026.
- [Microsoft, "Redistributing Visual C++ files"](https://learn.microsoft.com/en-us/cpp/windows/redistributing-visual-cpp-files)
  and
  ["C runtime (CRT) and C++ standard library (STL) .lib files"](https://learn.microsoft.com/en-us/cpp/c-runtime-library/crt-library-features).
- [crates.io API](https://crates.io/api/v1/crates/winit), one record for each crate in the table.
- [docs.rs, epaint_default_fonts](https://docs.rs/epaint_default_fonts/latest/epaint_default_fonts/), version 0.37.0.
- [SDL licence](https://www.libsdl.org/license.php), [zlib licence](https://zlib.net/zlib_license.html),
  and [FFmpeg, "License and Legal Considerations"](https://ffmpeg.org/legal.html).
- [libchdr](https://github.com/rtissera/libchdr) and [chd-rs](https://github.com/SnowflakePowered/chd-rs),
  README and licence only.
- [cargo-deny, licences configuration](https://embarkstudios.github.io/cargo-deny/checks/licenses/cfg.html)
  and [cargo-about](https://embarkstudios.github.io/cargo-about/).

Law and policy on copies and documents:

- [17 U.S.C. § 102](https://www.law.cornell.edu/uscode/text/17/102)
  and [§ 106](https://www.law.cornell.edu/uscode/text/17/106).
- [Copyright, Designs and Patents Act 1988, section 17](https://www.legislation.gov.uk/ukpga/1988/48/section/17),
  with no known outstanding effects on the page.
- [KDE Licensing Policy](https://community.kde.org/Policies/Licensing_Policy), last edited 15 August 2025.
- [Linux kernel licensing rules](https://docs.kernel.org/process/license-rules.html).
- [Wikimedia Terms of Use](https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use).
- [Pan Docs, About](https://gbdev.io/pandocs/About.html).
- [libretro database](https://github.com/libretro/libretro-database), by its register line.
- [MAME legal information](https://web.archive.org/web/20261111203603/https://www.mamedev.org/legal.html),
  capture 20261111203603; read 2026-11-21.
- [Rust Foundation, Rust Trademark Policy](https://rustfoundation.org/policy/rust-trademark-policy/), undated.
