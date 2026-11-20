---
title: Source map
roadmap_item: R0-05
status: draft
date: 2026-11-19
---

# Source map

## Summary

This note asks where the documentation for each system lives, and what each hub says about its licence,
the origin of its information, and confidential material.
It evaluates more than 300 sources by the steps of ADR 0001 and adds each to the source register with a proposed tier.
Most community references state no origin and no rule on leaked material, and several open hubs link, describe,
or host a maker's confidential documents.
For the PlayStation 1, no detailed and current reference was found that does not name the tainted document as a source.
Makers' own manuals are public but restricted: most forbid reproduction,
and one Arm manual grants no right to build "models".
This note is not legal advice.

## Scope

- Question: which documentation hubs and essential reading exist for each system, and for each hub,
  what are its licence, stated origin, rule on confidential material, and tier?
- Covered: seven groups of systems, makers' processor manuals, multi-system references, archives, and test suites.
  A tier here is a proposal made by ADR 0001's tests; the owner accepts it by merging.
  The register holds every source evaluated, and the tables here hold the hubs a later note is most likely to need.
- Left to other items: what the law says about firmware, keys, and takedowns (`R0-02`);
  what licences mean for reuse and for storing tests (`R0-03`); conventions for quoting (`R0-04`);
  what each hub says about the hardware (`R1-01` to `R1-04`); and the emulators themselves (`R1-10` onward).
- Researched on 2026-11-19.
  Licences, policies, and addresses are as published that day.
  Four sites were read from archived copies, with dates given where they are cited.
- How claims were checked: research agents fetched each hub's pages on 2026-11-19
  and copied quotations from the raw page text.
  A second, independent pass fetched each hub's pages again and tested each claim and quotation.
  A claim marked "(secondary)" rests on another party's account, "(from memory)" was not confirmed by a fetched page,
  and "(inference)" is reasoning.
  "None" and "nothing was found" record what the pages read contain, not proof of absence; the Sources list the pages.
  Typographic quotation marks in sources are written as plain ones, and line breaks inside quotations are joined.
- What was opened: evaluation pages only, meaning home, about, licence, copyright, policy, contributing,
  and index pages, README and licence files, and the notice pages of makers' manuals.
  For several single-page references the origin statements were found by keyword search of the whole page,
  which displayed some matching technical lines.
- What was not opened: technical content pages, hosted maker documents, development kits, games, firmware, key pages,
  issue threads, code in walled, closed, or unregistered repositories, and the tainted references.

## Findings

In every table, "none" means none stated on the pages read, and "not read" means the page could not be fetched.
The "Rule" column is the hub's rule on confidential or leaked material.
The tier is the one proposed under ADR 0001, and the register holds the evidence for each line.

### Game Boy, Game Boy Color, and Game Boy Advance

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| Pan Docs | CC0 | lineage of authors; method unstated | none | open |
| Game Boy: Complete Technical Reference | CC BY-SA 4.0 | Sharp data books; marks speculation | none | open |
| gbdev wiki | none | owner asks for a source for everything | none | open |
| Gekkio's research, schematics, database | CC BY 4.0 or BY-SA 4.0 | traced from decap photos and scans | none | open |
| DMG-CPU schematics (Furrtek, msinger) | CC BY-SA 4.0 | traced from die photographs | none | open |
| Cycle-Accurate Game Boy Docs | not read | not read | not read | walled |
| Dan Docs | "Public Domain" | author's research and others' studies | none | open |
| GBATEK | notice, no grant | credits; no method | none | open |
| gbadoc (CowBite descendant) | CC0 | other sites, by permission; emulators | none | open |
| Tonc | CC BY-NC-SA 4.0 | tested on emulator and hardware | none | open |
| The Audio Advance | none | "Unofficial"; method unstated | none | open |
| mGBA blog | none for the text | its author's research | none | open |
| gbdev.io and gbadev.net lists | GPL-3.0 | resource lists | chat only | open, lead |
| Copetti's articles | CC BY 4.0 | lists its sources | none | open, lead |
| Sharp data books, 1990 and 1996 | not read | maker's catalogue; third-party scans | n/a | open |
| Nintendo manuals, kits, test cartridges | none | maker material hosted by others | n/a | closed |

- Pan Docs says it is "released under the CC0 license".
  Its history page gives who wrote and revised it and does not say how the facts were first obtained,
  and its reference list of 17 works names no Nintendo document (Pan Docs, About, History, References).
- The Complete Technical Reference names maker-published evidence for the processor:
  "using old Sharp datasheets and databooks as evidence, the core has been identified to be a Sharp SM83 CPU core".
  It marks unverified statements as "Speculation", and says it "focuses at the moment on 1st and 2nd generation devices
  (models before the Game Boy Color)" (gb-ctr, revision 199).
  Whether its boot ROM section holds a listing, which would be closed, was not determined.
- The gbdev wiki shows no content licence; its copyright and disclaimer pages are empty.
  Its owner writes: "I want all information to have a source" (gbdev wiki, Main Page).
- The schematics state a method and its limits.
  Furrtek's were traced over a die photograph "manually with only a few automated checks
  so **THERE'S A HIGH RISK OF ERROR**", and msinger's "were derived from the schematics in" Furrtek's repository
  (project READMEs).
- The Cycle-Accurate Game Boy Docs sit inside an emulator repository under GPL version 2,
  with "only" or "or later" not stated in its README.
  The guard blocked the document because the repository was not registered, so its own terms were not read.
- GBATEK's footer reads "copyright 2025 martin korth (nocash)" with no grant,
  and "About this Document" states no method.
  Its author also wrote the tainted PlayStation document.
  A keyword search of GBATEK found no notice like that document's, and no match for "confidential".
- GBATEK does name leaked material in two DSi sections.
  For the Teak signal processor: "There aren't any official references for the Teak instruction set.
  However, there's one document that has leaked into internet", a chip designer's specification.
  For the BPTWL chip it says the firmware "has [apparently] leaked" in a named file
  (misspelt on the page; corrected in brackets).
  Neither line says how much of the section copies those files, and neither is in a Game Boy Advance section
  (GBATEK, single page, keyword search).
  The tainted test in ADR 0001 asks for a maintainer's statement that the reference copies
  or paraphrases a console maker's confidential material, and the closed test asks for a public accusation;
  neither is met (inference).
  The register closes the split pages of both sections as a precaution until the owner decides;
  the single page `gbatek.htm` holds every section and stays open.
- gbadoc says it is "provided to you under the Creative Commons 0 License" and states second-hand origins.
  Its BIOS chapter came from two emulator authors' lists and from "observing the behavior of various demos in CowBite
  and other emulators"; its sound chapter is "most of it verbatim" from The Audio Advance;
  and Martin Korth "has given me permission to consolidate additional info from his emulator's informative help
  documents" (gbadoc, Acknowledgements and chapters).
  A CC0 dedication cannot release text whose rights belong to others (inference).
- Tonc's community edition is "released under the CC-BY-NC-SA license", so its text cannot be reused in GPL-3.0 notes.
  The register closes its repository's code, because the licence forbids commercial use (ADR 0001, closed test).
- The only rule on leaked material found in this family covers chat, not documentation: "Don't engage in piracy,
  or share leaked material (general discussion around such topics is fine)" (gbadev.net, chat rules).
- gbdev adopted a policy on AI in August 2026: "AI agents MUST NOT author git commits" (gbdev AI policy).
  It bears on any plan to contribute findings back.
- Copetti's Game Boy article lists "Nintendo, Gameboy programming manual - version 1.1" among its sources,
  so a fact taken from the article may rest on a closed source, unmarked (inference).
  His Game Boy Advance article lists no Nintendo manual.
- By the Complete Technical Reference's account,
  the Game Boy's core "hasn't publicly been given a name by either Sharp or Nintendo".
  The Sharp data books are hosted as third-party scans; their own notices were not read.
- Must not be used: the Game Boy and Game Boy Advance programming manuals and development kits;
  the boot ROM folder and the ROM of "the official Nintendo Gameboy test cartridge" on the gbdev file hub;
  Nintendo's aging cartridges, which two emulators' READMEs name as accuracy targets;
  disassemblies and replacements of the boot ROMs and the BIOS; and tools whose use extracts the BIOS.
  Both resource lists link several of these.
- Gaps: no reference for the Game Boy Color at the depth the Complete Technical Reference gives older models;
  no Game Boy Advance reference with a stated method; and for the Game Boy Advance BIOS, only disassemblies,
  replacements, dumping guides, and descriptions drawn from emulators were found.

### NES, SNES, Nintendo 64, and Virtual Boy

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| NESdev wiki | disclaimer: "considered public domain" | accumulated by many people; method unstated | none | open |
| NESdev forum | none | forum | none | open, lead |
| 6502.org (hosts makers' 6502 datasheets) | none, by a summary | community site | none | open |
| Breaks books (emu-russia) | CC0 | circuits traced from die photographs | none | open |
| Quietust's chip images, Visual 2C02 | none | traced from die photographs | none | open |
| Visual6502 site | none | photographed a decapped chip | none | open |
| SNESdev wiki | CC0 | unstated | none | open |
| Super Famicom Development Wiki | none | re-hosted documents; unstated | none | open |
| fullsnes (Nocash) | notice, no grant | Anomie's specs, hardware tests, web pages | none | open |
| Anomie's documents | none | unstated | host bars ROMs | open |
| Near's articles (ares mirror) | none | decapping, scans, own research | none | open, lead |
| N64brew wiki | CC BY-SA 4.0 | unstated | none | open |
| n64docs | notice, no grant | an emulator author's notes | none | open, lead |
| libdragon | Unlicense | reverse engineering; no dispute found | none | open |
| Sacred Tech Scroll (Virtual Boy) | unclear | NEC manuals, sites, "original research" | none | open |
| WDC 65C816 datasheet | all rights reserved | chip maker | n/a | open |
| Nintendo and Ricoh patents | patent office | maker | n/a | open |
| ultra64.ca; SNES Development Manual | none | maker material hosted by others | n/a | closed |
| 64dd.org | none | hosts game images, by its own posts | none | closed |

- No hub read for this family states a rule on leaked or confidential material,
  and none carries a statement like the tainted PlayStation reference's.
  For the NESdev, SNESdev, and N64brew wikis the policy, copyright, and about pages that would hold one do not exist.
- The NESdev wiki's licence is a disclaimer page from 2012:
  "Any information posted on this wiki is considered public domain".
  The wiki software's rights setting is empty.
  The SNESdev wiki's footer reads "Content is available under CC0 Public Domain unless otherwise noted",
  and N64brew's names CC BY-SA 4.0.
- Two open hubs describe or link the maker's confidential material.
  The SNESdev wiki has a page on the "SNES Development Manual", "provided by Nintendo to licensed developers",
  with a link to a hosted copy.
  The N64brew wiki describes installing Nintendo's development kit and links copies of it.
  Nothing on the pages read says whether any wiki text is drawn from those documents.
- fullsnes carries "Copyright 2012 by Martin Korth (nocash)" and no grant.
  Its author writes that the video and audio parts "are widely based on Anomie's great specs" and
  that he "verified most of it on real hardware".
  Its credits include "snes9x - open source emulator
  (info on undocumented coprocessors)",
  a closed-tier emulator, and one body line refers to "Nintendo's developer manuals".
  A search of the page found no match for "confidential".
- The Super Famicom Development Wiki states no licence.
  Its owner says he collects "development items, prototype games, game source code";
  that sentence describes his collection and does not say that the wiki's text comes from it.
- libdragon's licence file is the Unlicense, and no public dispute about its origin was found.
  Its README makes no clean-room statement.
  Its `boot/` folder holds "an open source bootcode" that replaces the cartridge boot code Nintendo wrote;
  whether that is a "boot ROM" under ADR 0001's closed test is not settled by the ADR's words (inference).
- parallel-rdp is MIT and says it was "written from scratch by studying Angrylion-Plus", "not a port,
  and not a derived codebase".
  The Angrylion fork ships a licence text saying "MAME is not licensed for commercial use";
  which files that text governs is not stated in its README.
- The Visual6502 repository's README says only "Note the various licenses and Copyright associated with each file",
  so its code is walled until those notices are read.
- Maker-published material is thin.
  The 65C816 datasheet is Western Design Center's current part, with "All rights reserved,
  including the right of reproduction"; the console uses a Ricoh chip built around that core (inference).
  One Nintendo patent and one Ricoh and Nintendo patent were read at the patent office.
  No maker-hosted copy of the NEC manuals for the Nintendo 64 and Virtual Boy processors was found;
  copies sit on third-party hosts and were not opened.
- Must not be used: the SNES Development Manual; the Nintendo 64 kit and manuals on ultra64.ca,
  which a resource list describes as "official development manuals, as well as SDK downloads";
  the decompiled and repackaged kit libraries; the 2020 leak of Nintendo source code; the leaked UltraHLE source;
  Nintendo's own SNES test programs, which a results page lists; game images on 64dd.org;
  and the console boot ROM files that two open-tier emulators' READMEs ask the user to supply.
- Gaps: outside patents, no maker document was found for the NES and SNES video and sound chips or
  for the Nintendo 64 graphics coprocessor, whose detailed maker description is the closed kit documentation.
  For SNES cartridge coprocessors the hubs found credit a closed-tier emulator or extracted firmware.
  The decap image archive these projects cite refused every request.

### Nintendo DS, DSi, and 3DS

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| GBATEK, DS, DSi, and 3DS parts | notice, no grant | credits; cites DSiBrew and 3dbrew | none | open |
| GBATEK, DSi Teak and BPTWL pages | notice, no grant | names leaked documents and firmware | none | closed, pending |
| DSiBrew | none | unstated; invites reverse engineering | none | open |
| 3dbrew | none | "legal reverse engineering" and public information | bars NDA material | open |
| Citra site archive | none | lists where 3DS research lives | none | open |
| melonDS blog | notice, no grant | its developer's hardware research | none | open |
| GBATEK addendum thread (melonDS board) | none | "several individuals" | none | open, lead |
| BlocksDS documentation | CC BY-SA 4.0 | points to GBATEK for hardware | none | open |
| libnds, libctru (devkitPro) | zlib | unstated | none | open |
| Teakra | MIT | GBATEK's Teak section; own testers | none | open |
| Arm reference manuals | Arm notices | chip designer | n/a | open |
| Luma3DS | GPL-3.0, parts MIT | reimplements system software | none | closed |
| Nintendo kits, firmware, keys | none | maker material; leaks | n/a | closed |

- 3dbrew is the one hub in this family with a stated origin and rule.
  "Information found on this website is found through legal reverse engineering
  (both in the hardware and software sense)
  and publicly available information", and information "obtained via an NDA" "cannot be disclosed on this website".
  The page was last edited in 2011, does not use the word "leak",
  and says the site "cannot be held responsible for information submitted by users" (3dbrew, Copyrights).
- DSiBrew's rights setting is empty, and its policy page does not exist.
  Its only licence text is about copying from other sites:
  "Never copy and paste articles or do any act of verbatim copying from any source without following its licensing terms
  to the letter" (DSiBrew, Contributing).
- GBATEK's DS part names a file of "Nintendo's devkit" and describes what it does, without saying how that is known.
  Its DSi part credits DSiBrew, and its 3DS part, marked "under construction", cites 3dbrew.
- The DSi Teak pages are the part closest to failing ADR 0001's tests.
  GBATEK says of the TeakLite II opcodes that "the only available info has leaked in form of .DLLs".
  Teakra, the signal-processor emulator that Panda3DS forks, thanks GBATEK for that documentation,
  and adds a commercial debugger's public chip definitions and its own hardware testers (Teakra README).
  The leaked items are a chip designer's, and the register closes these pages as a precaution until the owner decides.
- The four Arm manuals for these processors are served by Arm and marked non-confidential.
  Three technical reference manuals carry the same core notice:
  no part of the information "may be adapted
  or reproduced in any material form except with the prior written permission of the copyright holder".
  None of the three mentions models or patents (Arm DDI 0201D, DDI 0360F, DDI 0210C).
- The architecture manual for ARMv5 and ARMv6 differs.
  It grants a licence for three purposes
  and says "No right is granted" to use the manual "for the purposes of developing
  or having developed microprocessor cores or models thereof which are compatible in whole
  or part" with the described instructions (Arm DDI 0100I, Proprietary Notice, clause 2).
  A processor interpreter is plausibly such a model; the notice does not define the word (inference).
  It does not forbid reading, and no source read says whether it binds a reader who made no agreement with Arm.
- No hardware documentation published by Nintendo for these systems was found.
  One paper by the 3DS graphics chip designer's staff was located and not read (Kazakov and Ohbuchi, 2011).
- libnds and libctru state the zlib licence and no origin.
  No accusation naming either library was found; they share maintainers with libogc, which is closed for a dispute.
  The maintainers' own site refused every request.
- BlocksDS documents a licence for each component
  and says it reimplemented one library whose "licensing status in unclear"
  (BlocksDS, design guide; wording as on the page).
- Azahar adopted an AI policy effective 20 March 2026:
  "Use of AI to rewrite incompatibly-licensed code for submission to Azahar is prohibited" (Azahar `AI-POLICY.md`).
- Must not be used: Nintendo's development kits for these systems and the 2020 leaks; the leaked specification,
  libraries, and firmware file that GBATEK names; BIOS, firmware, boot ROM,
  and key files that emulator READMEs ask users to supply; key pages inside DSiBrew, GBATEK, and 3dbrew,
  known from their indexes only; the replacement BIOS inside melonDS and DeSmuME; Luma3DS;
  and Nintendo's "Aging Card NTR" test software, which a wiki lists among test ROMs.
- Gaps: no DS or DSi reference with a licence grant or a stated method;
  no reference for the signal processor that does not run through material GBATEK calls leaked;
  no openly licensed specification of the 3DS graphics chip,
  where the research index found points mostly to personal notes and forum posts;
  no single-step vectors for the ARM9 or ARM11; and no maintained 3DS hardware test suite under a licence.

### GameCube, Wii, Wii U, Switch, and Switch 2

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| Yet Another GameCube Documentation | none | games, patents, public documents | none | open |
| GC-Forever wiki | none | unstated | none | open |
| WiiBrew | none | unstated; founded by a developer channel | bars leaked kit content | open |
| WiiUBrew | none | unstated | forbids leaked information | open |
| SwitchBrew (Switch and Switch 2) | none | unstated | none | open |
| Dolphin wiki and repository documents | CC BY-SA 3.0; GPL-2.0+ | emulator project | in its contributing guide | open |
| Cemu; decaf-emu | MPL-2.0; GPL-3.0+ | emulator projects | Cemu: see R0-01 | open |
| libnx; wut | ISC; zlib | unstated | none | open |
| Switch controller notes (dekuNukem) | none | own hardware captures | none | walled |
| Power ISA (OpenPOWER) | end user licence | standards body and IBM | n/a | open |
| Arm A-profile manual; Khronos specifications | maker notices | chip designer; standards body | n/a | open |
| Nintendo open-source releases page | per component | maker | n/a | open |
| NVIDIA Tegra X1 manual | contract | maker, behind registration | n/a | walled |
| libogc2 | zlib-style | fork of libogc | none | closed |
| Atmosphère; fail0verflow mini | GPL-2.0 | replace system software | none | closed |

- The three "brew" wikis differ.
  WiiBrew: "Content pertaining to leaked information such as Nintendo's private SDK are prohibited,
  and will be removed on sight."
  WiiUBrew: "Content pertaining to leaked information is forbidden."
  SwitchBrew has one project page, a one-sentence About, and so no licence, origin statement, or rule on leaks;
  it is also the only hub found that covers the Switch 2.
  All three have an empty rights setting.
- The GameCube specification states a lawful origin:
  "Everything in this Document has been reverse-engineered from legally [acquired] software (Games),
  publicly available Patents and Documentation for the sole purpose of writing interoperable Software"
  (YAGCD, section 1.4; one misspelling corrected in brackets).
  Its source chapter lists about 35 United States patents and maker manuals and datasheets.
  Its credits also thank a "Gamecube Source pack", unnamed "sources",
  and for graphics work the person whom the Homebrew Channel's authors accuse over libogc.
  It states no licence and was last modified in 2006.
- The site that hosts that specification also lists maker manuals for download.
  The guard cannot open one path inside a closed one, so those files rest on the written rule.
- Maker manuals for these processors were not found on a maker's site.
  Three former IBM addresses return "not found"; copies sit on third-party sites and were not opened.
  A search result describes one copy of the GameCube processor manual as marked confidential (lead, not opened).
- The Power ISA licence grant is "Solely for the purposes of developing and expanding the Power ISA
  and the POWER ecosystem".
  Whether an emulator of an older 32-bit core is covered is not answered by its text (inference).
- The current Arm A-profile manual says "No part of this document may be reproduced in any form by any means without the
  express prior written permission of Arm Limited".
  It makes access conditional on not using the information "for the purposes of determining
  whether the subject matter of this document infringes any third party patents" (Arm DDI 0487, issue M.d).
  R0-01 found both conditions on the manual's known-issues document.
- Khronos "grants a conditional copyright license to use and reproduce the unmodified Specification for any purpose",
  with no patent or trademark licence (Vulkan specification, preamble).
- NVIDIA lists a Tegra X1 technical reference manual and says some downloads need membership of its developer programme.
  The manual licence it publishes says the licensee "shall not use the TRM and/or any Derivative Works created by
  Licensee on any software or hardware platforms that do not contain an NVIDIA application processor", and "shall
  maintain the confidentiality of the TRM".
  Whether that agreement is the one shown for the X1 manual today was not determined; nothing was accepted.
  No maker document for the Switch 2 processor was found.
- Nintendo publishes the open-source components of its consoles, with entries for Switch 2, Switch,
  and Wii U. It is the only maker-published technical material found for the Switch 2
  (Nintendo, open-source software page).
- libogc stays closed. libogc2 is "largely API compatible with libogc" and carries the same two copyright holders.
  No accusation names it; treating a fork as inheriting the dispute is an inference.
  Every GameCube and Wii test suite found builds with libogc.
- Atmosphère describes itself as "customized firmware" whose parts replace components of the system,
  which meets the closed test whatever its licence.
  Dolphin's repository holds a replacement signal-processor ROM folder that the guard cannot separate.
- Switch emulation is under active enforcement.
  GitHub published 47 notices with "nintendo" in the file name between February 2025 and 12 November 2026.
  Skyline's README says its source "has been removed from all owner-controlled branches
  and tags at the request of authorized agents of Nintendo".
  The yuzu and Ryujinx repositories return "not found"; their successors are unevaluated and so walled.
  `R0-02` covers the history.
- Must not be used: Nintendo's development kits for these consoles; libogc and libogc2; Atmosphère, mini,
  and other replacement system code; third-party copies of maker manuals with no maker release shown; key, fuse,
  title-list, and dumping pages on the wikis and on emulator sites.
- Gaps: no maker-hosted processor manual for the GameCube, Wii, or Wii U;
  nothing beyond patents for their graphics chips; no hardware test suite for the Wii U, Switch, or Switch 2;
  no open-tier Switch emulator; and no Switch hub with a stated origin.

### PlayStation family

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| psx-spx and the Nocash PSX specification | see R0-01 | see R0-01 | see R0-01 | tainted |
| Walker's PlayStation document (2000) | given "to everybody" | a console taken apart; web; emulators | denial | open |
| Hitmen's 1999 to 2000 text files | none | unstated | none | open |
| psxrev (emu-russia) | CC0 | board and chip reverse engineering | none | open |
| Copetti's articles | CC BY 4.0 | source lists, some tainted or closed | none | open, lead |
| IDT R30xx software manual | copyright lines | chip maker; university copy | n/a | open |
| ps2tek | none | unstated | none | open |
| Sony's PS2 system manuals, third-party copies | no redistribution | maker, sold with a kit | n/a | closed |
| Yet Another PSP Documentation | none | datasheets, patents, forum contributors | none | open |
| vfpu-docs (PSP) | GPL-3.0 | each statement has a test for a PSP | none | open |
| psdevwiki (seven wikis) | GFDL 1.2 | reverse engineering, as a goal | none | open |
| Sony's PS3 Linux documents | GFDL 1.2 | maker | n/a | open |
| Sony's open-source pages | per package | maker | n/a | open |
| PSPSDK; vitasdk; PSL1GHT | BSD; MIT; MIT | unstated | none | open |
| ps2sdk | AFL-2.0 | unstated | none | walled |
| RPCS3; Vita3K; shadPS4; Mednafen | GPL-2.0 variants | emulator projects | none | walled |
| PSn00bSDK | MPL-2.0 core | parts "lifted as-is from Sony libraries" | none | closed |
| psx.arthus.net; Net Yaroze manuals | none | maker material hosted by others | none | closed |
| uOFW; Obliteration | MIT; MIT or Apache | reimplement system software | none | closed |

- The tainted reference reaches other sources.
  PSn00bSDK's README lists it first among "References used".
  The Rustation emulator's README says its author is "mainly using" the Nocash specification.
  Copetti's PlayStation article lists it for the processor, audio, disc format, and graphics.
  A fact taken from these may be known only from the tainted document, and none of them marks which (inference).
- Copetti's citations point at per-chapter pages of the Nocash document whose file names the register's pattern did not
  match.
  The register now carries a second pattern for them.
- The one PlayStation 1 reference found whose own text addresses origin is Joshua Walker's compilation of 2000.
  "I never looked at any of Sony's official documentation
  and never took any thing you would have to have a license to get."
  It says of its method: "I mostly poked at emulators to see how they worked."
  It says of its reliability: "Most of the stuff in here is hearsay and logical deductions."
  Its bibliography names a chip maker's manual and text files by other authors whose origin is not stated.
- PSn00bSDK is the common open-source kit for the PlayStation 1.
  Its README says of one library that parts "have been lifted as-is from Sony libraries" and that the kit "is currently
  (and will probably always be) in a legal gray area due to this" (emphasis removed).
  The common PlayStation 1 test collection is built with it.
- The IDT manual describes the processor family, not Sony's chip.
  The copy read sits on a university server; its title pages carry copyright lines and no grant.
  The manual for the core Sony used could not be fetched.
- Sony did release PlayStation 2 hardware manuals, to buyers of its Linux kit.
  Its community FAQ, read in a third-party copy,
  says "you may not re-produce or copy the manuals or re-distribute them",
  and "the PDFs may not be posted on public web sites".
  It adds that they "have identical content to 6 of the 7 system manuals provided to licensed developers".
  Copies found online are therefore hosted against the maker's stated terms.
  ADR 0001's table has no row for material sold to the public under such terms.
- Sony's PlayStation 3 Linux documents carry a free licence: "Permission is granted to copy,
  distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.2".
- psdevwiki's seven wikis share the footer "Content is available under GNU Free Documentation License 1.2
  unless otherwise noted".
  Its About page gives reverse engineering as a founding goal, and no page read states a rule on leaked material.
  Six of the seven main pages index a "Keys" page, and two index "SDK" pages; none was opened.
  The site refused automated access, so this rests on archived copies dated November 2025 to November 2026.
- ps2tek states no licence and no source.
  It describes itself as "inspired by nocash's websites for various consoles", which is a statement about form.
  Its chapter on the input and output processor, which is PlayStation 1 class hardware
  (from memory), states no source on the lines read.
- The PSP has a reference tied to tests:
  "For each of these statements there's a test that can be executed on a PSP device to validate it" (vfpu-docs README).
  The same README says Sony "did not release any public documentation" for the PSP.
- uOFW "aims to reverse engineer the basic PSP kernel & hardware" and "provide a free and open source vanilla firmware",
  which meets the closed test whatever its licence.
- Emulator licences: RPCS3's README says "GNU GPL-2.0-only";
  Vita3K and Mednafen say GPL version 2 without "only" or "or later";
  shadPS4's prose files are marked "GPL-2.0-or-later" and its code was not read.
  Vita3K adds that it is not "derived from confidential materials belonging to Sony".
- The PlayStation 1 developer forum has been offline since October 2025, and five other hubs refused automated access,
  among them the Vita development wiki and one open-tier author's blog.
- Must not be used: the tainted reference in any form, including per-chapter pages and copies; Sony's development kits,
  technical notes, reference disc, and BIOS images, which one site lists in its folders;
  third-party copies of the Net Yaroze and PlayStation 2 system manuals; key, kit, and firmware pages on psdevwiki;
  PSn00bSDK's code; and the firmware and BIOS reimplementations.
- Gaps: for the PlayStation 1, no detailed and current reference for the disc controller, sound, video decoder,
  geometry coprocessor, and timing was found that does not name the tainted document as a source.
  Walker's document and the text files of 1999 to 2000 are the only candidates.
  For the PlayStation 2, Sony's own FAQ says the released manuals omit the disc drive, sound chip, and peripherals.
  IBM's Cell documents could not be fetched.
  For the PlayStation 4 and 5 only wikis and security write-ups were found.

### Sega, arcade, Xbox, and other systems

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| SMS Power! development pages | none | per-document authors; unstated | none | open |
| Charles MacDonald's notes | none | "reverse engineered from various pieces of hardware" | none | open, lead |
| Sega Retro articles | CC BY 4.0 | unstated | none | open |
| Plutiedev; MegaDrive Wiki | none; CC BY-NC-SA | unstated | none | open |
| Yabause wiki (Saturn) | GFDL 1.2 | unstated | none | open |
| Marcus Comstedt's Dreamcast pages | none | unstated | none | open, lead |
| KallistiOS; dreamcast.wiki | BSD-style; none | "developed independently from Sega"; unstated | none | open |
| MAME documentation and legal pages | GPL-2.0, texts disagree | emulator project | none | open prose |
| NeoGeo Development Wiki | public domain | unstated | none | open |
| XboxDevWiki | none | unstated | not readable | open |
| Xenia | BSD-3-Clause | reverse engineering of bought devices | bans the maker's kit | open |
| Free60 (Xbox 360) | none | unstated | none | open |
| Huang's Xbox memo and book | not read; none found | published research | n/a | open |
| BlastEm; Exodus; Ymir | GPL-3.0+; MIT; GPL-3.0 | emulators; Exodus: its author's reverse engineering | none | open |
| Sinclair Wiki; C64-Wiki | CC BY-SA 4.0; GFDL | not read | none | open |
| 3DO Development Repo wiki | CC BY-SA 4.0 | unstated | none | open |
| MSX Assembly Page; MSX Resource Center wiki | notice, no grant | unstated | none | open |
| WSdev wiki (WonderSwan) | CC0, by a summary | unstated | none | open |
| Renesas, NXP, Intel manuals | maker notices | chip makers | n/a | open |
| Chip research from die photographs (Nuked, SiliconRE) | LGPL-2.1 or GPL-2.0 | die photographs | none | walled |
| xemu; nxdk; Kronos; Stella; openMSX | GPL-2.0 variants or mixed | emulators and a kit | none | walled |
| Genesis Plus GX; FinalBurn Neo | non-commercial | emulators | none | closed |
| Hosted Sega, Atari, Amiga, 3DO, arcade manuals | none | maker material hosted by others | n/a | closed |

- Several hubs in this family host the maker's developer manuals beside their own pages.
  SMS Power's document index lists "Official SMS/GG documentation | Sega | The real thing".
  Sega Retro advertises "internal documents you were never meant to see".
  One Saturn page lists Sega's hardware manuals and technical bulletins and credits individuals for them.
  A hub's own pages can be open while its hosted maker documents are closed,
  and no page read says which articles restate a hosted manual.
- A Mega Drive development kit tells readers that Sega's software manual, hosted on Sega Retro,
  "contains absolutely everything you need to know about the Sega Mega Drive" (SGDK README).
- The strongest origin statement for the 8-bit and 16-bit Sega systems is one author's:
  "Here is a collection of the documentation, schematics,
  and other information I've reverse engineered from various pieces of hardware over the years"
  (C. MacDonald, document index).
  He adds that it "is not intended to be accurate or [authoritative]" (misspelt on the page; corrected in brackets).
- For the Saturn, the usable references found are an emulator project's wiki with unstated origin, and emulator source.
  The manuals the community treats as primary are closed.
- KallistiOS says it was "developed independently from Sega entirely by free software developers".
  The original Xbox kit nxdk reuses an older open kit and says nothing about Microsoft's kit.
- Xenia's README says "All information is obtained via reverse engineering of legally purchased devices and games
  and information made public on the internet".
  That does not say who made the information public (inference).
- XboxDevWiki answered every request with a rate-limit error; an archived copy of its main page shows no licence line.
  Its policy pages could not be read, and its index lists a page on Microsoft's kit.
  This is the least certain tier in this note.
- MAME's own pages still disagree.
  Its legal page and its documentation say "version 2 or later";
  the legal page's FAQ says the "project as whole is under GPL-2.0 license".
  Its documentation describes the source as the documentation: "The source code to MAME serves as this documentation."
- The research that works from die photographs states the clearest origin and the least usable licence.
  One author writes that his repository's licence is GPL-2.0 and rejects any reading of it as "GPL V2 or later",
  and that he opposes "the use of the information provided in this repository for model training or
  for the AI generation of code or data" (Furrtek, SiliconRE README).
  That statement is not a licence term on its face (inference), and Rustalgia is written mostly by agents.
- Maker manuals carry different notices.
  Renesas: "This document may not be reproduced or duplicated, in any form, in whole or in part,
  without prior written consent of Renesas Electronics."
  Intel: "You may not use or facilitate the use of this document in connection with any infringement
  or other legal analysis concerning Intel products described herein", with a patent licence back to Intel.
  The Motorola manual on NXP's site shows no notice on its first three pages.
  Zilog's manual address now redirects to a page that refused access.
- Two well-known permissions are narrower than their reputation.
  Hasbro Interactive's 1999 release says it "has released all rights
  that it may have to the vintage Atari hardware platform, the Jaguar";
  it does not say "public domain" or mention documentation (fan-site transcription, secondary).
  Amstrad's 1999 newsgroup post says it is "happy for emulator writers to include images of our copyrighted code as long
  as the (c)opyright messages are not altered" (archived copy).
  Neither is a licence document, and no ROM was obtained.
- Must not be used: Sega's software manual, technical bulletins, and Saturn manuals wherever hosted; the Dreamcast, 3DO,
  and Xbox development kits; the Amiga developer disc contents on one host;
  the transcribed Atari 2600 programmer's guide, which shows no release by Atari;
  arcade manual collections whose host says it has not verified rights;
  a Commodore 64 reference repository that holds ROM disassemblies; and the ROM pages of SMS Power and MAME.
- Gaps: Saturn hardware beyond an emulator wiki; the original Xbox's policy on leaked material; the Atari 2600,
  which has no usable primary reference in this evidence; the Amiga, where only a closed host was found;
  arcade boards outside MAME's walled source; and the PC Engine, Commodore 64, and Intellivision hubs,
  which could not be reached.
  No hub was evaluated for the Atari 7800, Lynx, ColecoVision, or Neo Geo Pocket.

### Processor and chip makers' manuals

This answers R0-01's open question on what makers' notices permit, as far as their words go.
Every document below is served by the maker or its successor, unless the row says otherwise.

| Maker and document | Reproduction | Use to build a compatible model | Other conditions |
|---|---|---|---|
| Arm, current manuals (DDI 0487, 0406, 0602) | needs written permission | not addressed | no infringement analysis |
| Arm, older core manuals (DDI 0201, 0210, 0301, 0360) | no adapting or reproducing | not addressed | none |
| Arm, ARMv5 and ARMv6 manual (DDI 0100I) | no distribution | "No right is granted" for models | no patent rights |
| Intel, developer's manual (2026) | unmodified copies allowed | for software on Intel products | no legal analysis |
| Renesas, SuperH software manuals | needs written consent | not addressed | no licence granted |
| Western Design Center, 65C816 datasheet | reserved | not addressed | none |
| NXP, Motorola 68000 manual | no notice found | not addressed | site terms: personal use |
| OpenPOWER, Power ISA | under its licence | allowed for compliant cores | patent grant for compliant chips |
| AMD, Family 16h guide | all rights reserved | not addressed | no licence granted |
| Ecma, disc standards | allowed unmodified | allowed in conformant products | notice must be kept |
| Toshiba TX79; IDT R30xx (third-party copies) | all rights reserved; none | not addressed | no patent licence |

- Arm publishes one standard notice for its current non-confidential documents.
  Its notice for confidential documents adds conditions the public one lacks,
  such as not using the information "for developing technology or products
  which avoid any of Arm's intellectual property" (Arm, product documentation proprietary notices).
  No confidential document was opened.
- Arm's ARMv7 manual, issue C.d of 2018, has the reproduction ban and a patent condition,
  and not the "models thereof" wording of the older ARMv5 manual (Arm DDI 0406C.d, page ii).
  Earlier issues were not fetched.
- The older core manuals' ban covers "the information contained in, or the product described in, this document".
  What "adapted or reproduced in any material form" means for a software model is not explained on any Arm page read.
  That part of R0-01's question stays open.
- Arm's website terms allow downloading "and to make one hard copy of the information for reference purposes only".
- Intel's notice is the most permissive of the proprietary ones:
  "You may create software implementations based on this document and in compliance with the foregoing
  that are intended to execute on the Intel product(s) referenced in this document."
  Whether that covers software that models an Intel processor on another host is not stated (inference).
- Renesas's site-wide disclaimer says it "takes precedence over the "Notice" appearing in previously issued documents",
  and its copyright terms allow "personal use".
- Ecma's default notice permits "works by making use of this specification in standard conformant products by
  implementing (e.g. by copy and paste wholly or partly) the functionality therein".
  Its CD-ROM standards are free downloads.
  The disc formats' licensed books were not found as public documents.
- The SD Association publishes simplified specifications "on a non-confidential basis"
  and says implementing them "may require a license".
- Arm's and Intel's conditions against infringement analysis sit awkwardly with patent research (`R0-02`),
  if the same work reads both (inference).
- For many console processors no maker-hosted manual with a readable notice was obtained: the Z80, the 6502,
  the Game Boy and NES chips, the SNES sound chips, the Yamaha and Texas Instruments sound chips, the NEC processors,
  the MIPS architecture volumes, and the PowerPC parts.
  What exists is third-party scans and community reverse engineering.
- ADR 0001 opens material a maker "published itself" and closes maker material
  that others host "with no sign the maker released it".
  A datasheet that its maker once sold or handed out, and that survives only as a third-party scan, fits both rows.
  The ADR does not say which governs.

### Multi-system references and archives

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| Copetti, "Architecture of Consoles" | CC BY 4.0 | per-article source lists | none | open, lead |
| emudev.org | "MIT-style" goal | reverse engineering and testing | no ROMs | open |
| Emulation General Wiki | none | unstated | none | open, lead |
| TASVideos | CC BY 2.0 | unstated | no ROM or BIOS references | open, lead |
| Stack Exchange sites | CC BY-SA by date | forum | none | open, lead |
| Wikipedia | CC BY-SA 4.0 and GFDL | cites sources | none | open |
| Conference talk archives | per talk | talks | none | open, lead |
| No-Intro; Redump | none | catalogues of hashes | no games | open |
| TCRF; Data Crystal | not determined; GFDL 1.2, by a summary | game binaries (from memory) | not read | walled |
| Repair and modification wikis | not read | not read | not read | walled |
| siliconpr0n | not read | decap photographs | not read | walled |
| bitsavers; Internet Archive; history foundation | none; per item | others' uploads | removal on notice | per item |

- Stack Exchange licenses contributions by date:
  "Content contributed on or after 2018-05-02 (UTC) is distributed under the terms of CC BY-SA 4.0",
  and earlier content under versions 2.5 or 3.0.
  R0-01 found a declared compatibility with GPLv3 for version 4.0 only.
- The Internet Archive removes material on notice:
  "If the Internet Archive is made aware of content that infringes someone's copyright,
  we will remove it per our Copyright Policy."
  Presence there is therefore no sign that a maker released an item (inference).
- bitsavers states no copyright or removal policy on its home page and bars bulk fetching.
- The Video Game History Foundation says it "does not own the intellectual property of materials in the library";
  a donor's permission is not a console maker's release (inference).
- These archives mix lawful scans with closed material, so the register closes named items and gives the hubs no line.
- A summary of one fetched TCRF page reported that the page "does contain instructions aimed at AI agents".
  They were not acted on; the site is walled until it can be evaluated.
- Near's articles have no authoritative host today: the author's site shows a hosting placeholder,
  and a site named for bsnes has a "SNES Roms" menu and no shown tie to the project.
- The die-photograph archive that many research projects cite refused every request, so its licence is unrecorded.
- A fact found only in a lead is not relied on until a better source or a test confirms it (ADR 0001).

### Test suites and test vectors

For test software ADR 0001 lets results be used always, and code by its licence.

| Suite | Licence | Expected results come from | Code tier |
|---|---|---|---|
| Mooneye Test Suite | MIT | consoles, run by hand; one class is emulator-only | open |
| GBMicrotest; AGE test roms | MIT | "checked on real hardware"; named by device | open |
| dmg-acid2, cgb-acid2 | MIT | reference image; console photographs | open |
| Mealybug Tearoom | MIT | the author's emulator | open |
| SameSuite | X11 | not stated in the top README | open |
| blargg's Game Boy tests | none | not stated; a development cartridge is mentioned | closed |
| SingleStepTests sm83 | MIT | a translation of the ares core | open |
| SingleStepTests ARM7TDMI | MIT | NanoBoyAdvance | open |
| jsmolka gba-tests; mGBA suite | MIT | not stated | open |
| NBA hardware tests | BSD-3-Clause | not stated on the pages read | open |
| FuzzARM | GPL-3.0 | a generator; compared with emulators | open |
| ARMWrestler copies; krom's GBA code | none | krom: "a real GBA using a flash cartridge" | closed |
| AccuracyCoin (NES) | MIT | the author's console, one chip revision | open |
| NES test ROM mirror (blargg and others) | none | not stated at repository level | closed |
| SingleStepTests 65x02, 65816, spc700 | MIT | emulator implementations | open |
| gilyon's SNES tests | MIT | not stated | open |
| undisbeliever's SNES tests | zlib | not stated | open |
| krom's SNES code; blargg's SNES tests | none | krom: a console; blargg: not stated | closed |
| n64-systemtest, nemu64-test | MIT | not stated | open |
| krom's N64 tests | Unlicense | "a real N64 using a 64drive Cartridge" | open |
| parallel-rdp validation | MIT | another emulator, Angrylion | open |
| 240p Test Suite and its small ports | GPL-2.0-or-later | display tests; "tested on real hardware" | open |
| armwrestler family, rockwrestler (DS) | none | checked inside the program; partly on hardware | closed |
| polyrastertest (DS) | MIT | a New 3DS XL running in DS mode | open |
| Citra-era 3DS test repositories | none | no recorded expectations described | closed |
| Teakra testers; crossbar9 (3DS) | MIT; BSD-3-Clause | run on a 3DS | open |
| Dolphin hwtests (GameCube, Wii) | GPL-2.0 | not stated; run on a Wii or an emulator | walled |
| ioncodes and Geotale tests (GameCube, Wii) | none | hardware results recorded in the READMEs | closed |
| ps1-tests | MIT | not stated for the suite; built with a closed kit | open |
| Amidog's PlayStation tests | none for archives | not stated on the pages read | closed |
| krom's PlayStation code | none | "I only test with a real PSX" | closed |
| SingleStepTests r3000 | MIT | the ares interpreter | open |
| ps2autotests | ISC | a console, by a documented procedure | open |
| pspautotests | placeholder, no grant | "preferably from a real PSP" | closed |
| ps3autotests | GPL-2.0 | "preferably from a real PS3" | walled |
| z80test | MIT | "a real 48K Spectrum with Zilog Z80 CPU" | open |
| ZEXALL extract | GPL-2.0 | not stated | walled |
| SingleStepTests m68000 | MIT | "the microcoded core in MAME" | open |
| SingleStepTests z80 | MIT | an emulator, by its description | open |
| SingleStepTests 8088 | MIT | a physical processor, with MartyPC | open |
| Klaus Dormann's 6502 tests | GPL-3.0 | self-checking; not stated | open |
| vAmiga Test Suite | GPL-3.0 | "reference images taken on real Amigas" | open |

- blargg's Game Boy tests carry no licence in the author's own copy of the one archive read,
  and the common collection that bundles them is MIT for its own files only (readme of `cpu_instrs`; c-sp README).
  The register walls that collection, because its parts carry a mix of licences, some none, that is not resolved.
  The addresses older pages give for his tests no longer serve them.
- Most single-step processor vectors come from emulators, and their READMEs say so.
  One says "Any bugs that exist in Mame's microcoded M68000 emulator will exist here too";
  another that it "was generated using Reicast's CPU interpreter".
  Only the x86-family sets say they were captured from a physical processor (SingleStepTests READMEs and descriptions).
  Passing an emulator-generated set shows agreement with that emulator, which is also similarity to it (inference).
- No hardware-captured vector set was found for the Game Boy, NES, SNES, Game Boy Advance, DS,
  or PlayStation processors.
- Several suites assume material the project may not obtain: boot ROMs, a system ROM, or a maker's own test cartridge.
- Suites with no licence can be run for their results, but storing or redistributing them has no stated permission.
  That question belongs to `R0-03`.
- GitHub's licence metadata was wrong or missing for many repositories here, as R0-01 found;
  the register relies on the licence file or README where one was read.

### Patterns across the hubs

Counts are of the hub rows in the family tables above and the multi-system table, not of every source in the register.

- Of the 41 community references in those tables, meaning wikis and specifications written by their communities,
  19 state a licence or dedication for their text, 10 state how their information was obtained,
  and 3 state a rule against leaked or confidential material: 3dbrew, WiiBrew, and WiiUBrew.
  Personal sites, emulator documentation, kits, maker material, and tests are not in that count.
  A reference that gives only credits, or only a goal, was counted as not stating how its information was obtained.
- Rules against confidential or leaked material are rare and narrow: three wikis for Nintendo home consoles and the 3DS,
  one emulator's README, one author's denial, and bans on ROM references.
  The hubs most relied on for the Game Boy, NES, SNES, Nintendo 64, DS, Switch, and PlayStation state none.
- Licences cluster by type of project: CC0 or "public domain" for the gbdev and NESdev family of references,
  Creative Commons attribution licences for hardware research and overview articles,
  free documentation licences for emulator wikis, and nothing at all for most older single-author documents.
- Stated methods are strongest where the work starts from silicon or from tests: die-photograph schematics,
  test suites that name the consoles used, and one PSP reference tied to tests.
- Hubs sit next to closed material.
  Open wikis link maker manuals and development kits, index key pages, or host firmware two folders away.
- Statements about AI are appearing in the hubs themselves: gbdev's policy, Azahar's policy,
  one chip researcher's objection, and one archive's complaint about scrapers.

### What the evaluation cannot show

- A tier records what a hub says about itself and what others have said publicly about it.
  It does not show where any single fact came from.
  R0-01 asked how a reader can tell whether a community document descends from confidential material;
  no hub read gives a method, and none was found here.
- What can be recorded for each hub is its own statement, whether it links or describes confidential maker documents,
  and which sources it credits.
  The findings above record those three.
- Evaluation read policy pages, not technical pages.
  A hub whose policy pages are clean can still hold a page that restates a closed document.
- The guard matches addresses as written, and this work found four limits: a `www.` prefix escaped every web pattern,
  including the tainted ones, until lines for it were added; an address equal to a closed pattern passes,
  as a bare repository page does; an open path cannot be carved out of a closed one;
  and a call written as `gh api "repos/..."`, with a quotation mark before `repos`,
  escapes the fallback for unregistered repositories.
  The first two are handled in the register; the last two are not.
- Pages that refused automated access were read from archived copies or not at all,
  and a hub can change its policy after the date in the register.

## Options and trade-offs

These are the choices the evidence leaves open.
Each is the owner's, and several would change ADR 0001 or the register.

### 1. Hubs with no stated licence or origin: keep open, or wall them

- **What:** ADR 0001 keeps a reference open when it makes no claim of confidential origin, and records the gap.
  The alternative is to wall references that state neither licence nor origin.
- **Costs:** keeping them open rests on silence; walling them removes the main references for the DS, Switch, Xbox,
  and much of Sega.
- **Gains:** open keeps the research possible; walled spends care where nothing is known.
- **Used by:** the ADR as written.
  Asahi's test, "explicitly made available to the public at large" (R0-01), is closer to the stricter reading.

### 2. Mixed hubs: one tier for the hub, or rules for its pages

- **What:** a wiki with key pages, or a site hosting maker manuals, can take one tier,
  or be open with named paths closed.
- **Costs:** one tier either blocks useful pages or exposes closed ones; path rules need each path found from an index,
  and the guard cannot express every case.
- **Gains:** path rules follow the ADR's tests for each kind of material.
- **Used by:** the register, for SameBoy's iOS folder and, in this change, for six web sites.

### 3. Documents by the tainted reference's author that carry no such statement

- **What:** GBATEK and fullsnes pass the ADR's tests.
  They can stay open, be read through split pages that leave out flagged sections, or be walled as a precaution.
- **Costs:** open concedes whatever their unstated origins hold;
  walled removes the standard Game Boy Advance and DS reference.
- **Gains:** split pages keep a session away from sections that name leaked material.
- **Used by:** the Game Boy Advance and DS emulator READMEs read credit GBATEK.

### 4. Makers' manuals whose notices restrict use

- **What:** read them as ADR 0001 allows and note the limits; or avoid manuals whose notice excludes "models";
  or learn the instruction sets from other documents and tests.
- **Costs:** the first leaves an unresolved contract and copyright question;
  the others give up the most authoritative source for the ARM processors.
- **Gains:** the first matches common practice; the others avoid the question.
- **Used by:** Citra's developer page pointed readers to Arm's manuals.

### 5. Maker documents that survive only as third-party copies

- **What:** treat a datasheet or manual that its maker once published as maker-published wherever it is hosted;
  or as closed until a maker's release is shown; or decide item by item.
- **Costs:** the strict reading leaves the Z80, 6502, and several console processors with no maker document;
  the loose one cannot tell a sold manual from a confidential one without opening it.
- **Gains:** the strict reading needs no judgement; item by item fits the facts.
- **Used by:** community references cite such scans; one says its processor facts come from them.

### 6. Tests with no licence, or with expectations from an emulator

- **What:** use results from any suite, as the ADR allows; or prefer suites that state hardware results;
  or label each suite's origin in the register and in later notes.
- **Costs:** preferring hardware-verified suites leaves several processors with no vectors at all.
- **Gains:** labelling keeps an emulator's behaviour from being taken as the hardware's.
- **Used by:** suite authors label themselves in their READMEs.

### 7. Sources whose own authors name tainted or leaked material

- **What:** a kit that says parts were "lifted as-is from Sony libraries",
  an emulator that says it mainly uses the tainted specification,
  and GBATEK's Teak pages can be classed by licence alone, or closed or walled on their authors' words.
- **Costs:** licence alone opens code built on what the project refuses to read;
  the stricter reading goes beyond the ADR's written tests.
- **Gains:** the stricter reading matches the reason the tainted tier exists.
- **Used by:** this change walls or closes all three as a precaution and asks the owner.

### 8. How the PlayStation 1 primer gets its facts

- **What:** the routes found are the older documents with stated origins, makers' datasheets and patents,
  tests on hardware, and the code of open-tier emulators.
- **Costs:** the older documents call themselves guesswork; emulator code may itself rest on the tainted reference,
  and reading it concedes access.
- **Gains:** each route has a nameable source; a hardware test's origin is the measurement.
- **Used by:** one open-tier emulator's README names official documents among its sources (R0-01);
  one walled emulator's author says he also tests on hardware.

## Implications for Rustalgia

- The hardware primers (`R1-01` to `R1-04`) and family surveys (`R1-10` to `R1-25`) read from this map.
  Each should cite the hub's register line and repeat the hub's gaps, not the tier alone.
- The PlayStation 1 primer and survey (`R1-02`, `R1-18`) cannot lean on one reference.
  This feeds a decision on option 8, and it may make the PlayStation 1 a candidate for hardware tests in a spike.
- Open hubs put closed material one link away.
  This feeds a requirement that a session checks the register before following a link from a hub to a file host,
  key page, or kit.
- The guard needed register lines for forms of address it did not match, and two limits remain.
  This feeds a change to the guard, which is the owner's to order.
- ADR 0001's tests gave uncertain results for the kinds of source listed under "Open questions".
  This feeds an amendment or a successor ADR.
- Makers' notices bear on how notes quote and tabulate (`R0-04`),
  and Arm's and Intel's conditions on legal analysis bear on how patent research is kept apart (`R0-02`).
- Test suites need their origin recorded when used.
  This feeds the testing notes (`R2-15`, `R4-10`), and the licence gaps feed `R0-03`.

## Open questions

- Do GBATEK's DSi Teak and BPTWL pages stay closed, and does Teakra, which thanks the Teak pages, stay open?
  A decision by the owner; no test in ADR 0001 fits.
- Is a kit whose README admits copied maker code tainted or closed, and what of tests built with it?
  A decision by the owner.
- Does a fork inherit a library's disputed origin, as assumed here for libogc2?
  A decision by the owner.
- Is a replacement for cartridge boot code, or for a signal-processor ROM, a "boot ROM" under the closed test?
  A decision by the owner; libdragon and Dolphin raise it.
- Which row governs a maker document that was sold to the public and now sits only on third-party hosts?
  An amendment to ADR 0001.
- Are Creative Commons attribution licences, LGPL-3.0, ZPL-2.1, and AFL-2.0 inside the open tier for code?
  `R0-03`, then the ADR.
- Does a wiki article that restates a hosted maker manual count as the wiki or as the manual?
  No method was found; the family surveys can record cases.
- What do Arm's older notices mean for a software emulator, and does the "models" exclusion bind a reader?
  `R0-02` records the risk.
- What do the pages that refused access say: devkitPro's site, the Vita and Sega wikis, XboxDevWiki's policy,
  the die-photograph archive, and Dolphin's blog?
  The family surveys, with a browser or by hand.
- Which GPL-2.0 projects are "only" and which "or later"?
  The family surveys, in a reader session where needed.
- Who produced the expected values in the suites that do not say?
  `R2-15`.
- Where do IBM, Zilog, MIPS, and NEC's successor host their manuals today, and under what notices?
  The hardware primers.

## Sources

Every page below was read on 2026-11-19.
For a repository, "README and licence" means those two files, read through the GitHub API.
A repository that the register lists and this list does not name was evaluated from its README, its licence file,
or GitHub's licence metadata, as the last field of its register line says.

Game Boy and Game Boy Advance:

- Pan Docs, About, History, References, and single-page view: `https://gbdev.io/pandocs/About.html`,
  `https://gbdev.io/pandocs/History.html`, `https://gbdev.io/pandocs/References.html`.
- gbdev, home, contributing, chat, and AI policy pages: `https://gbdev.io/`, `https://gbdev.io/aipolicy.html`.
- awesome-gbdev and awesome-gbadev, README and licence: `https://github.com/gbdev/awesome-gbdev`,
  `https://github.com/gbadev-org/awesome-gbadev`.
- gbdev wiki, Main Page and About, and the file hub's index pages: `https://gbdev.gg8.se/wiki/articles/Main_Page`,
  `https://gbdev.gg8.se/files/`.
- Game Boy: Complete Technical Reference, revision 199, title page, preface, chapter 4 opening, bibliography:
  `https://gekkio.fi/files/gb-docs/gbctr.pdf`; README of `https://github.com/Gekkio/gb-ctr`.
- Gekkio, home page and hardware database: `https://gekkio.fi/`, `https://gbhwdb.gekkio.fi/`;
  READMEs of `Gekkio/gb-research`, `Gekkio/gb-schematics`, `Gekkio/mooneye-gb`, `Gekkio/mooneye-test-suite`.
- READMEs of `furrtek/DMG-CPU-Inside`, `msinger/dmg-schematics`, `Raphael-Boichot/Game-Boy-chips-decapping-project`,
  `AntonioND/giibiiadvance`, `aappleby/metroboy`; `http://iceboy.a-singer.de/`.
- Dan Docs, About: `https://shonumi.github.io/dandocs.html`.
- GBATEK, title block, footer, "About this Document", index, and keyword search of the single page:
  `https://problemkaputt.de/gbatek.htm`, `https://problemkaputt.de/gbatek-index.htm`.
- gbadev.net chat rules, gbadoc, and Tonc: `https://gbadev.net/chat.html`, `https://gbadev.net/gbadoc/print.html`,
  `https://gbadev.net/tonc/`, `https://www.coranac.com/tonc/text/intro.htm`.
- The Audio Advance, introduction: `http://belogic.com/gba/intro.shtml`.
- mGBA, home page and FAQ: `https://mgba.io/`, `https://mgba.io/faq.html`.
- R. Copetti, Game Boy and Game Boy Advance articles, sources and permissions sections:
  `https://www.copetti.org/writings/consoles/game-boy/`.
- Internet Archive catalogue metadata for the two Sharp data books: `https://archive.org/metadata/`.
- blargg's Game Boy tests, index and the readme of one archive: `https://www.slack.net/~ant/old/gb-tests/`.
- READMEs and licence metadata of the test repositories named in the register, among them `c-sp/game-boy-test-roms`,
  `mattcurrie/mealybug-tearoom-tests`, `mattcurrie/dmg-acid2`, `LIJI32/SameSuite`, `aappleby/gbmicrotest`,
  `SingleStepTests/sm83`, `SingleStepTests/ARM7TDMI`, `jsmolka/gba-tests`, `nba-emu/hw-test`, `DenSinH/FuzzARM`,
  `PeterLemon/GBA`.
- READMEs of `PikalaxALT/gba_bios`, `Cult-of-GBA/BIOS`, `mgba-emu/bios-dump` (prose only).

NES, SNES, Nintendo 64, and Virtual Boy:

- NESdev wiki, main page, About, General disclaimer, rights setting, test index:
  `https://www.nesdev.org/wiki/Nesdev_wiki:General_disclaimer`, `https://www.nesdev.org/wiki/Nesdev_wiki:About`.
- NESdev forum, index and terms: `https://forums.nesdev.org/`.
- Quietust, chip images and Visual 2C02 pages: `https://www.qmtpro.com/~nes/chipimages/`.
- Visual6502, home page and FAQ: `http://www.visual6502.org/`; README of `trebonian/visual6502`.
- READMEs and licence files of `emu-russia/breaks` and `emu-russia/breaknes`.
- SNESdev wiki, main page, footer, rights setting, and the page on the SNES Development Manual:
  `https://snes.nesdev.org/wiki/`.
- Super Famicom Development Wiki, home page: `https://wiki.superfamicom.org/`.
- fullsnes, contents list and About and Credits: `https://problemkaputt.de/fullsnes.htm`.
- Romhacking.net, one document entry and the policy page: `https://www.romhacking.net/documents/196/`,
  `https://www.romhacking.net/policy/`.
- Near's articles, index pages of the mirror: `https://archive.ares-emu.net/near.sh/`.
- Western Design Center, W65C816S datasheet of 13 March 2024, page 1:
  `https://www.westerndesigncenter.com/wdc/documentation/w65c816s.pdf`.
- United States Patents 4,799,635 and 5,327,158, front pages:
  `https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/4799635`.
- N64brew wiki, main page, FAQ, footer, rights setting, lead of the Libultra page: `https://n64brew.dev/wiki/`.
- n64docs, home page: `https://n64.readthedocs.io/`.
- libdragon, README, licence, boot README, and site: `https://github.com/DragonMinded/libdragon`,
  `https://libdragon.dev/`; `https://dragonminded.com/n64dev/`.
- Link lists: `http://n64dev.org/`, `https://n64.dev/`.
- ultra64.ca and 64dd.org, home pages only: `https://ultra64.ca/`, `https://64dd.org/`.
- READMEs and licence files of `n64dev/cen64`, `rasky/r64emu`, `Themaister/parallel-rdp`, `ata4/angrylion-rdp-plus`,
  `decompals/ultralib`, `higan-emu/higan`, `cc65/cc65`, `alekmaul/pvsneslib`, `vhelin/wla-dx`, `RPGHacker/asar`.
- Sacred Tech Scroll, contents and About, and its catalogue entry: `http://perfectkiosk.net/stsvb.html`,
  `https://www.virtual-boy.com/documents/virtual-boy-sacred-tech-scroll/`.
- TASVideos, site licence and accuracy-test pages: `https://tasvideos.org/SiteLicense`.
- READMEs and licence files of the test repositories named in the register, among them `100thCoin/AccuracyCoin`,
  `SingleStepTests/65x02`, `gilyon/snes-tests`, `PeterLemon/N64`, `lemmy-64/n64-systemtest`,
  `ArtemioUrbina/240pTestSuite`, `pinobatch/240p-test-mini`.

Nintendo DS, DSi, and 3DS:

- GBATEK, About page and index, and keyword search of the single page:
  `https://problemkaputt.de/gbatek-about-this-document.htm`.
- DSiBrew, Main Page, Contributing, About, General disclaimer, page index, rights setting:
  `https://dsibrew.org/wiki/DSiBrew:Contributing`.
- 3dbrew, Main Page, Copyrights, About, General disclaimer: `https://www.3dbrew.org/wiki/3dbrew:Copyrights`.
- Citra site archive, home and five wiki pages: `https://citra.azahar-emu.org/wiki/archive-of-3ds-documentation/`.
- Arm, proprietary notices of DDI 0201D, DDI 0360F, DDI 0210C, and DDI 0100I:
  `https://documentation-service.arm.com/documentation/ddi0201/d` and sibling records.
- Nintendo, open-source software page: `https://support.nintendo.com/jp/oss/index.html`.
- Kazakov and Ohbuchi, "Primitive Processing and Advanced Shading Architecture for Embedded Space" (2011),
  catalogue record only: `https://diglib.eg.org/handle/10.2312/14922`.
- melonDS, site, FAQ, README, contributing guide, and the readme of its `freebios` folder:
  `https://melonds.kuribo64.net/`; first post of `https://melonds.kuribo64.net/board/thread.php?id=13`.
- DeSmuME wiki FAQ: `https://wiki.desmume.org/index.php?title=Faq`.
- Azahar, README and `AI-POLICY.md`; Panda3DS README: `https://github.com/azahar-emu/azahar`.
- devkitPro, organisation profile, and READMEs or licence files of `libctru`, `libnds`, `calico`, `dswifi`, `maxmod`,
  `picasso`, `citro3d`, `3ds-examples`.
- BlocksDS documentation, introduction, licences, credits, contributing, and FAQ pages:
  `https://blocksds.skylyrac.net/docs/guides/licenses/`.
- READMEs of `wwylele/teakra`, `neobrain/nihstro`, `smealum/aemstro`, `LumaTeam/Luma3DS`, `PSI-Rockin/Corgi3DS`.
- READMEs and licence metadata of the test repositories named in the register, among them `mic-/armwrestler`,
  `RockPolish/rockwrestler`, `Jaklyy/polyrastertest`, `archshift/crossbar9`.
- Emulation General Wiki, DS tests page, as a list only: `https://emulation.gametechwiki.com/index.php/NDS_Tests`.
- Wikipedia, "Nintendo data leak" (secondary): `https://en.wikipedia.org/wiki/Nintendo_data_leak`.

GameCube, Wii, Wii U, Switch, and Switch 2:

- WiiBrew, Policy, Piracy, About, General disclaimer, Contributing, rights setting:
  `https://wiibrew.org/wiki/WiiBrew:Policy`.
- WiiUBrew, Policy, About, Contributing, Main Page: `https://wiiubrew.org/wiki/WiiUBrew:Policy`.
- SwitchBrew, Main Page, About, project page list, rights setting: `https://switchbrew.org/wiki/Main_Page`.
- GC-Forever wiki, Main Page and rights setting: `https://www.gc-forever.com/wiki/`.
- Yet Another GameCube Documentation, landing page, title page, chapters 1, 19, and 20:
  `https://hitmen.c02.at/files/yagcd/`.
- Dolphin, FAQ, wiki footer, and the index of the repository's `docs` folder: `https://dolphin-emu.org/docs/faq/`,
  `https://wiki.dolphin-emu.org/`.
- Cemu wiki, Main Page and About: `https://wiki.cemu.info/`.
- OpenPOWER Foundation, Power ISA version 3.1C, pages 1 to 5: `https://openpower.foundation/specifications/isa/`.
- Arm DDI 0487, issue M.d, notice: `https://documentation-service.arm.com/documentation/ddi0487/latest`.
- Khronos, Vulkan specification preamble and OpenGL 4.6 page 2:
  `https://docs.vulkan.org/spec/latest/chapters/preamble.html`.
- NVIDIA, Jetson related-documentation page, Tegra K1 reference page, and the manual licence:
  `https://developer.nvidia.com/tegra-rdp-trm-license-details`.
- Nintendo, open-source software page and Switch 2 technical specifications:
  `https://support.nintendo.com/jp/oss/index.html`.
- READMEs and licence files of `extremscorner/libogc2`, `devkitPro/wut`, `switchbrew/libnx`, `Atmosphere-NX/Atmosphere`,
  `fail0verflow/mini`, `fail0verflow/hbc`, `cemu-project/Cemu`, `decaf-emu/decaf-emu`, `emu-russia/pureikyubu`,
  `skyline-emu/skyline`, `dekuNukem/Nintendo_Switch_Reverse_Engineering`, `reswitched/SwIPC`, `kinnay/NintendoClients`,
  `dolphin-emu/hwtests`, `ioncodes/gamecube-wii-tests`, `Geotale/GC-Like-Research`.
- Ryubing, site and documentation home: `https://ryujinx.app/`, `https://docs.ryujinx.app/`.
- GitHub's published takedown notices, directory listing and three notices: `https://github.com/github/dmca`.
- Conference talk pages, abstracts only: `https://media.ccc.de/`.

PlayStation family (the tainted reference was not opened; its addresses are in R0-01 and the register):

- J. Walker, "Everything You Have Always Wanted to Know about the Playstation
  But Were Afraid to Ask", version 1.1 (2000), introduction and bibliography:
  `https://hitmen.c02.at/files/docs/psx/psx.pdf`; listing page `https://hitmen.c02.at/html/psx_docs.html`.
- R. Copetti, PlayStation, PlayStation 2, PSP, and PlayStation 3 articles, source lists and permissions sections:
  `https://www.copetti.org/writings/consoles/playstation/`.
- READMEs and licence files of `Lameguy64/PSn00bSDK`, `simias/rustation`, `spicyjpeg/ps1-bare-metal`,
  `emu-russia/psxrev`, `pcsx-redux/nugget`, `ps2dev/ps2sdk`, `pspdev/pspsdk`, `pspdev/vfpu-docs`, `uofw/uofw`,
  `uofw/upspd`, `vitasdk/vita-headers`, `Vita3K/Vita3K`, `RPCS3/rpcs3`, `ps3dev/PSL1GHT`, `shadps4-emu/shadPS4`,
  `obhq/obliteration`, `OpenOrbis/OpenOrbis-PS4-Toolchain`; README of the DuckStation repository (prose only).
- psx.arthus.net, top-level and three folder indexes only: `https://psx.arthus.net/`.
- PSXDEV network, shutdown notice: `https://www.psxdev.net/`.
- Internet Archive, catalogue metadata of the Net Yaroze item (documents not opened): `https://archive.org/metadata/`.
- Mednafen, home page and PlayStation page: `https://mednafen.github.io/`.
- IDT R30xx Family Software Reference Manual, revision 1.0, title pages, university copy:
  `https://cgi.cse.unsw.edu.au/~cs3231/doc/R3000.pdf`.
- Toshiba TX79 user's manual, first four pages, archive mirror: `https://bitsavers.mirrorservice.org/`.
- Hot Chips 11 programme: `https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/1_Sun/hc99nav.pdf`.
- Sony's PlayStation 2 Linux community FAQ, third-party copy: `https://ps2-linux.tensioncore.com/faq.html`.
- Sony, PlayStation 3 Linux documents, index notice:
  `https://www.kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/`.
- Sony, open-source software pages: `https://www.playstation.com/en-us/oss/ps3/` and sibling pages.
- Ecma International, page for ECMA-130:
  `https://ecma-international.org/publications-and-standards/standards/ecma-130/`.
- ps2tek, overview: `https://psi-rockin.github.io/ps2tek/`.
- GNU licence list, Academic Free License entry: `https://www.gnu.org/licenses/license-list.html`.
- Yet Another PSP Documentation, index and chapters 1, 32, 33: `https://hitmen.c02.at/files/yapspd/`.
- psdevwiki, main pages, Copyrights, About, and General disclaimer, archived copies dated 2025-11-25 to 2026-11-14:
  `https://web.archive.org/` copies of `https://www.psdevwiki.com/`.
- Vita SDK, site and documentation home: `https://vitasdk.org/`.
- Amidog's PlayStation wiki, start and download pages: `https://psx.amidog.se/`.
- READMEs and licence files of the test repositories named in the register, among them `JaCzekanski/ps1-tests`,
  `SingleStepTests/r3000`, `unknownbrackets/ps2autotests`, `hrydgard/pspautotests`, `RPCS3/ps3autotests`.

Sega, arcade, Xbox, and other systems:

- SMS Power!, home, development index, documents index, contact page: `https://www.smspower.org/Development/Documents`.
- C. MacDonald, document index: `http://dreamjam.co.uk/emuviews/docindex.php`; the frameset that shows it:
  `http://www.techno-junk.org/`.
- Sega Retro, main page, archived copy of 2026-11-14:
  `https://web.archive.org/web/20261114122812/https://segaretro.org/Main_Page`.
- Plutiedev, home and FAQ: `https://plutiedev.com/faq`.
- MegaDrive Wiki, main page, About, rights setting: `https://md.railgun.works/index.php?title=Main_Page`.
- BlastEm, README and licence: `https://www.retrodev.com/repos/blastem`.
- READMEs and licence files of `ekeeke/Genesis-Plus-GX`, `RogerSanders/Exodus`, `nukeykt/Nuked-OPN2`,
  `nukeykt/Nuked-MD`, `Stephane-D/SGDK`, `Yabause/yabause`, `FCare/Kronos`, `ymir-emu/Ymir`, `srg320/Saturn_MiSTer`,
  `KallistiOS/KallistiOS`, `finalburnneo/FBNeo`, `jotego/jtcores`, `furrtek/SiliconRE`, `xemu-project/xemu`,
  `XboxDev/nxdk`, `Free60Project/wiki`, `xenia-project/xenia`, `mist64/c64ref`, `trapexit/3do-devkit`, `jeffpar/pcjs`.
- Renesas, SH-4 and SH-1, SH-2 software manuals, notice pages:
  `https://www.renesas.com/en/document/mas/sh-4-software-manual`.
- Motorola M68000 Family Programmer's Reference Manual, pages 1 to 3:
  `https://www.nxp.com/docs/en/reference-manual/M68000PRM.pdf`.
- Intel 64 and IA-32 Architectures Software Developer's Manual, volume 1, September 2026, notices page:
  `https://cdrdv2.intel.com/v1/dl/getContent/671436`.
- Yabause wiki, main page and documentation index: `https://wiki.yabause.org/`.
- antime's Saturn page, document index only: `https://antime.kapsi.fi/sega/docs.html`.
- SegaXtreme, resources index and terms: `https://segaxtreme.net/`.
- M. Comstedt, "Dreamcast Programming", index pages: `https://mc.pp.se/dc/`.
- dreamcast.wiki, root page: `https://dreamcast.wiki/`.
- MAME, legal page, licence page, "What is MAME", and the introduction of the ROM page:
  `https://www.mamedev.org/legal.html`, `https://docs.mamedev.org/license.html`.
- NeoGeo Development Wiki, main page: `https://wiki.neogeodev.org/`.
- ARCade ARChive, front page: `https://arcarc.xmission.com/`.
- XboxDevWiki, main page, archived copy of 2026-10-27:
  `https://web.archive.org/web/20261027211121/https://xboxdevwiki.net/Main_Page`.
- xemu, required-files page: `https://xemu.app/docs/required-files/`.
- Free60: `https://free60.org/`.
- A. Huang, MIT AI Memo 2002-008, record page: `https://dspace.mit.edu/handle/1721.1/6694`;
  free edition of "Hacking the Xbox": `https://nostarch.com/xboxfree`.
- Hasbro Interactive press release of 14 May 1999, transcription:
  `https://mail.atariage.com/Jaguar/archives/HasbroRights.html`.
- C. Lawson, "Amstrad ROM permissions", newsgroup post of 31 August 1999, archived copy:
  `https://web.archive.org/web/20130115052219/http://www.worldofspectrum.org/permits/amstrad-roms.txt`.
- Stella Programmer's Guide transcription, header only: `https://alienbill.com/2600/101/docs/stella.html`.
- Amiga developer disc pages, front page: `http://amigadev.elowar.com/`.
- 3DO Development Repo, home and documentation index: `https://3dodev.com/`.
- MSX Assembly Page and MSX Resource Center wiki footers: `http://map.grauw.nl/`, `https://www.msx.org/wiki/`.
- Sinclair Wiki rights setting and C64-Wiki footer: `https://sinclair.wiki.zxnet.co.uk/`, `https://www.c64-wiki.com/`.
- WSdev wiki, footer, through a summarising fetch only: `https://ws.nesdev.org/wiki/`.
- READMEs and licence files of the test repositories named in the register, among them `raxoft/z80test`,
  `agn453/ZEXALL`, `SingleStepTests/m68000`, `SingleStepTests/8088`, `Klaus2m5/6502_65C02_functional_tests`,
  `dirkwhoffmann/vAmigaTS`.

Cross-system sources:

- Arm, proprietary notices of DDI 0487 issue M.d, DDI 0406C.d, DDI 0301H, and DDI 0602; the standard notices page;
  the website terms:
  `https://www.arm.com/company/policies/terms-and-conditions/product-documentation-proprietary-notices`,
  `https://www.arm.com/company/policies/terms-and-conditions`.
- Renesas, legal notices: `https://www.renesas.com/en/legal-notices`.
- AMD, guide 48751 revision 3.03, page 2:
  `https://www.amd.com/content/dam/amd/en/documents/archived-tech-docs/programmer-references/48751_16h_bkdg.pdf`.
- MIPS and Texas Instruments, site terms: `https://mips.com/terms/`,
  `https://www.ti.com/legal/terms-conditions/terms-of-use.html`.
- OpenPOWER Foundation, final draft of the Power ISA licence:
  `https://openpowerfoundation.org/blog/final-draft-of-the-power-isa-eula-released/`.
- Ecma International, text copyright policy and the pages for ECMA-119 and ECMA-130:
  `https://ecma-international.org/policies/by-ipr/ecma-text-copyright-policy/`.
- SD Association, simplified specifications page: `https://www.sdcard.org/downloads/pls/`.
- USB Implementers Forum, document library: `https://www.usb.org/documents`.
- AACS LA, specifications index: `https://aacsla.com/aacs-specifications/`.
- J-Core project, home page: `https://j-core.org/`.
- R. Copetti, index, about, and disclaimer pages: `https://www.copetti.org/disclaimer/`.
- Emulation General Wiki, Main Page, About, Copyrights, General disclaimer, rights setting:
  `https://emulation.gametechwiki.com/`.
- emudev.org, home page: `https://emudev.org/`.
- TASVideos, site licence and site rules: `https://tasvideos.org/SiteRules`.
- Stack Exchange, licensing help page: `https://retrocomputing.stackexchange.com/help/licensing`.
- Wikimedia Foundation, Terms of Use: `https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use`.
- media.ccc.de, about page: `https://media.ccc.de/about.html`.
- Hackaday, policies page: `https://hackaday.com/policies/`.
- TCRF and Data Crystal copyright pages, through a summarising fetch only:
  `https://tcrf.net/The_Cutting_Room_Floor:Copyrights`, `https://datacrystal.tcrf.net/wiki/Data_Crystal:Copyrights`.
- Refused every request, so not read: `https://console5.com/techwiki/`, `https://consolemods.org/wiki/`,
  `https://siliconpr0n.org/`, `https://wiki.henkaku.xyz/vita/Main_Page`, `https://devkitpro.org/`.
- MiSTer documentation home: `https://mister-devel.github.io/MkDocs_MiSTer/`.
- bsnes.org, home page navigation only: `https://bsnes.org/`.
- bitsavers, home page: `https://bitsavers.org/`.
- Internet Archive, rights help page: `https://help.archive.org/help/rights/`.
- Video Game History Foundation, archive help page: `https://archive.gamehistory.org/help`.
- No-Intro and Redump, home pages: `https://no-intro.org/`, `http://redump.org/`.
- SingleStepTests, the organisation's repository list and each README: `https://github.com/SingleStepTests`.

Project documents:

- R0-01, clean-room policy: `docs/research/topics/R0-01-clean-room-policy.md`.
- ADR 0001: `docs/adr/0001-restrict-reading-by-licence-tier.md`.
- The source register and the guard: `.claude/hooks/source-register.txt`, `.claude/hooks/source-guard.sh`.
