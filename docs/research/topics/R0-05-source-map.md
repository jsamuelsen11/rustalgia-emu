---
title: Source map
roadmap_item: R0-05
status: approved
date: 2026-11-21
---

# Source map

## Summary

This note asks where each system's documentation lives and what each hub says about its licence,
the origin of its information, and confidential material,
and it records more than 300 sources in the [source register][reg] with a tier given by [ADR 0001][adr].

Most community references state no origin and no rule on leaked material,
and several open hubs link or host a maker's confidential documents,
so the register closes those pages by name and leaves the rest of each hub open.

For the PlayStation 1 no detailed, current reference was found that does not name the tainted document as a source,
so the note recommends that tests on a console settle its facts.

Arm's older core manuals forbid adapting or reproducing the product they describe,
and one architecture manual's licence excludes building models,
so the note records building a model from them as a legal risk and recommends the current Arm manuals.

Where ADR 0001's tests leave a result uncertain, the note recommends a rule for the owner to decide,
the register keeps its tier until then, and nothing here is legal advice.

## Scope

- Question: which documentation hubs and essential reading exist for each system, and for each hub,
  what are its licence, stated origin, rule on confidential material, and tier?
- Covered: six groups of systems, makers' processor manuals, multi-system references, archives, and test suites.
  A tier here is one given by ADR 0001's tests, and the owner accepted the tiers by merging the first version
  ([pull request 17][pr17]).
  The [register][reg] holds every source evaluated except the archive hubs,
  and the tables here hold the hubs a later note is most likely to need.
- Left to other items: what the law says about firmware, keys, and takedowns ([R0-02][r002]);
  what licences mean for reuse and for storing tests ([R0-03][rm0]); conventions for quoting ([R0-04][r004]);
  what each hub says about the hardware ([R1-01][r101] to [R1-04][r104]); and the emulators themselves
  ([R1-10][rmsurv] onward).
- Researched on 2026-11-19.
  The questions the first version left open were worked down on 2026-11-20,
  and the pages read for them are listed under that date in the Sources.
  Licences, policies, and addresses are as published on the day each was read.
  Several sites were read from archived copies, with their time stamps in the Sources.
- How claims were checked: research agents fetched each hub's pages on 2026-11-19
  and copied quotations from the raw page text, except where a row or the Sources say a page was read through a summary.
  A second, independent pass fetched each hub's pages again and tested each claim and quotation,
  and piped tool calls into the [guard][guard] to test the register.
  Its corrections were applied after each was checked against the source again;
  the claims it could not check are listed in the pull request.
- The answers added on 2026-11-20 rest on raw fetches made that day, named with each finding.
  One further independent pass, in two parts, then re-fetched every source those answers cite and tested each claim,
  quotation, link, and register line; each of its corrections was checked against the raw source before it was applied,
  so the note has had two independent passes in all, one for each version.
  The claims that pass could not check are marked where they stand and listed in the pull request.
  A claim marked "(secondary)" rests on another party's account, "(from memory)" was not confirmed by a fetched page,
  and "(inference)" is reasoning.
  "None" and "nothing was found" record what the pages read contain, not proof of absence; the Sources list the pages.
  Typographic quotation marks in sources are written as plain ones, and line breaks inside quotations are joined.
- What was opened: evaluation pages, meaning home, about, licence, copyright, policy, contributing, and index pages,
  README and licence files, and the notice pages of makers' manuals;
  also the pages that hold a hub's source list or credits, and the openings named in the Sources.
  For several single-page references the origin statements were found by keyword search of the whole page,
  which displayed some matching technical lines.
- What was not opened: technical content pages, development kits, games, firmware, key pages, issue threads,
  code in walled, closed, or unregistered repositories, and the tainted references.
  Hosted maker documents were not opened beyond the title or notice pages of two third-party copies,
  IDT's and Toshiba's, which the tests close.

## Findings

In every table, "none" means none stated on the pages read, and "not read" means the page could not be fetched.
The "Rule" column is the hub's rule on confidential or leaked material.
The tier is the one given under [ADR 0001][adr], and the [register][reg] holds the evidence for each line.
Where a tier rests on a rule that ADR 0001 does not yet state,
the finding names the rule this note recommends for the ADR,
which [option 9](#9-rules-adr-0001-does-not-yet-state) gathers for the owner.

### Game Boy, Game Boy Color, and Game Boy Advance

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| Pan Docs | CC0 | lineage of authors; method unstated | none | open |
| Game Boy: Complete Technical Reference | CC BY-SA 4.0 | Sharp data books; marks speculation | none | open |
| gbdev wiki | none granted; owner expects public domain | owner asks for a source for everything | none | open |
| Gekkio's research, schematics, database | CC BY 4.0 or BY-SA 4.0 | traced from decap photos and scans | none | open |
| DMG-CPU schematics (Furrtek, msinger) | CC BY-SA 4.0 | traced from die photographs | none | open |
| Cycle-Accurate Game Boy Docs | not read | not read | not read | walled |
| Dan Docs | "Public Domain" | author's research and others' studies | none | open |
| GBATEK | notice, no grant | credits; no method | none | open |
| gbadoc (CowBite descendant) | CC0 | other sites; emulator help text, by permission; emulators | none | open |
| Tonc | CC BY-NC-SA 4.0 | unstated; demo code tested on emulators and hardware | none | open |
| The Audio Advance | CC BY 4.0 | "Unofficial"; method unstated | none | open |
| mGBA blog | notice, no grant | unstated | none | open, lead |
| gbdev.io and gbadev.net lists | GPL-3.0; one adds a no-commercial notice | resource lists | chat only | open, lead |
| Copetti's articles | CC BY 4.0 | lists its sources | none | open, lead |
| Sharp data books, 1990 and 1996 | not read | maker's catalogue; third-party scans | n/a | closed |
| Nintendo manuals, kits, test cartridges | none | maker material hosted by others | n/a | closed |

- [Pan Docs][pandocs-about] says it is "released under the CC0 license".
  Its [history page][pandocs-history] gives who wrote and revised it and does not say how the facts were first obtained,
  and its [reference list][pandocs-refs] of 17 works names no Nintendo document (Pan Docs, About, History, References).
- The [Complete Technical Reference][gbctr] names maker-published evidence for the processor:
  "using old Sharp datasheets and databooks as evidence, the core has been identified to be a Sharp SM83 CPU core".
  It marks unverified statements as "Speculation", and says it "focuses at the moment on 1st and 2nd generation devices
  (models before the Game Boy Color)" (gb-ctr, revision 199).
  Whether its boot ROM section holds a listing, which would be closed, was not determined.
- The [gbdev wiki][gbdevwiki] grants no licence, and its copyright and disclaimer pages do not exist.
  Its owner writes: "I expect most information added to this Wiki to be implicitly or explicitly in the public domain,
  or being an original creation for the Wiki.
  But nevertheless, I want all information to have a source" (gbdev wiki, Main Page).
- The schematics state a method and its limits.
  [Furrtek's][dmgcpu] were traced over a die photograph "manually with only a few automated checks
  so **THERE'S A HIGH RISK OF ERROR**",
  and [msinger's][dmgschem] "were derived from the schematics in" Furrtek's repository (project READMEs).
- The Cycle-Accurate Game Boy Docs sit inside an emulator repository under GPL version 2,
  with "only" or "or later" not stated in its README.
  The guard blocked the document because the repository was not registered, so its own terms were not read.
- [GBATEK][gbatek]'s footer reads "copyright 2025 martin korth (nocash)" with no grant,
  and "About this Document" states no method.
  Its author also wrote the tainted PlayStation document.
  A keyword search of GBATEK found no notice like that document's, and no match for "confidential".
- GBATEK does name leaked material in two DSi sections, and asks about it in one DS section.
  For the Teak signal processor: "There aren't any official references for the Teak instruction set.
  However, there's one document that has leaked into internet", a chip designer's specification.
  The same section says leaked .DLLs were used to "disassemble all possible 65536 combinations for all opcodes",
  so it states that its opcode information was derived from leaked files.
- For the BPTWL chip GBATEK says the firmware "has [apparently] leaked" in a named file
  (misspelt on the page; corrected in brackets); it does not say the section draws on that file.
  The DS Download Play section asks "Unknown if public RSA key can be found in gigaleak or so?".
  None of these lines is in a Game Boy Advance section (GBATEK, single page, keyword search).
- By ADR 0001's [kinds table][adr-kinds],
  a community reference is open only with "No claim that it has a confidential origin",
  and otherwise "Tainted or closed".
  The Teak section's own words are such a claim, so it is not open; it is not tainted,
  because the leaked files are not a console maker's, and no public accusation closes it (inference).
- This note recommends a rule for such cases
  ([option 9](#9-rules-adr-0001-does-not-yet-state)):
  where a source's author names leaked material as the source of some pages, those pages are closed,
  and the rest keeps the source's tier.
  The register closes the split Teak pages on that basis.
  The BPTWL page only names a leak, so the rule as worded would leave it open; the register closes it as a precaution,
  which merging accepted, and the rule should say whether a page that only names a leak is covered.
  The single page `gbatek.htm` and its copies hold every section and stay open.
- [gbadoc][gbadoc] says it is "provided to you under the Creative Commons 0 License" and states second-hand origins.
  Its BIOS chapter came from two emulator authors' lists and from "observing the behavior of various demos in CowBite
  and other emulators"; its sound chapter is "most of it verbatim" from [The Audio Advance][audioadv];
  and Martin Korth "has given me permission to consolidate additional info from his emulator's informative help
  documents" (gbadoc, Acknowledgements and chapters).
- The Audio Advance carries "CC BY 4.0", which asks for attribution;
  a CC0 dedication cannot release text whose rights belong to others (inference).
- [Tonc][tonc]'s community edition is "released under the CC-BY-NC-SA license",
  so its text cannot be reused in GPL-3.0 notes (inference).
  As a tutorial it is a community reference, which the kinds table tests by origin, not licence, so its text is open.
  The register closes its repository's code, because the licence forbids commercial use
  (ADR 0001, [closed test][adr-closed]).
- The [awesome-gbadev][awesome-gbadev] list's licence file opens with "No commercial adaptation
  or implementation of this material is allowed"; as a list of links it is a reference too, and open.
- The only rule on leaked material found in this family covers chat, not documentation: "Don't engage in piracy,
  or share leaked material (general discussion around such topics is fine)" ([gbadev.net, chat rules][gbadevchat]).
- gbdev adopted a policy on AI in August 2026: "AI agents MUST NOT author git commits"
  ([gbdev AI policy][gbdevai]; the date from the commit that added it).
  It bears on any plan to contribute findings back (inference).
- [Copetti's Game Boy article][copetti-gb] lists "Nintendo, Gameboy programming manual - version 1.1" among its sources,
  so a fact taken from the article may rest on a closed source, unmarked (inference).
  His Game Boy Advance article lists no Nintendo manual.
- By the Complete Technical Reference's account,
  the Game Boy's core "hasn't publicly been given a name by either Sharp or Nintendo".
  The Sharp data books are hosted as third-party scans; their own notices were not read.
  The pages read show no sign that Sharp released them,
  so the ADR's row for maker material hosted by others closes them;
  this note recommends a row that says so for such copies
  ([option 5](#5-maker-documents-that-survive-only-as-third-party-copies)).
- Must not be used: the Game Boy and Game Boy Advance programming manuals and development kits;
  the boot ROM folder and the ROM of "the official Nintendo Gameboy test cartridge" on the gbdev file hub;
  Nintendo's aging cartridges, which the [SkyEmu][skyemu] and [NanoBoyAdvance][nba] READMEs name as accuracy targets;
  disassemblies and replacements of the boot ROMs and the BIOS; tools whose use extracts the BIOS;
  and the Sharp data book scans.
  Both resource lists link several of these.
- Gaps: no reference for the Game Boy Color at the depth the Complete Technical Reference gives older models;
  no Game Boy Advance reference whose stated method rests on hardware rather than emulators;
  and for the Game Boy Advance BIOS, only disassemblies, replacements, dumping guides,
  and descriptions whose origin is unstated or drawn from emulators were found.

### NES, SNES, Nintendo 64, and Virtual Boy

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| NESdev wiki | disclaimer: "considered public domain" | accumulated by many people; method unstated | none | open |
| NESdev forum | none | forum | none | open, lead |
| 6502.org; makers' datasheets it hosts | none | community site; datasheets by makers | none | open; datasheets closed |
| Breaks books (emu-russia) | CC0 | circuits traced from die photographs | none | open |
| Quietust's chip images; Visual 2A03 and 2C02 | none | traced from die photographs | none | open; simulator walled |
| Visual6502 site | none | photographed a decapped chip | none | open |
| SNESdev wiki | CC0 | unstated | none | open |
| Super Famicom Development Wiki | notice, no grant | re-hosted documents; unstated | none | open |
| fullsnes (Nocash) | notice, no grant | Anomie's specs, hardware tests, web pages | none | open |
| Anomie's documents | none | unstated | host bars ROMs, takes maker documents | open |
| Near's articles (ares mirror) | none | decapping, scans, own research | none | open, lead |
| N64brew wiki | CC BY-SA 4.0 | unstated | none | open |
| n64docs | notice, no grant | an emulator author's notes | none | open, lead |
| libdragon | Unlicense | reverse engineering; no dispute found | none | open |
| Sacred Tech Scroll (Virtual Boy) | "Unlicensed", by a catalogue | NEC manuals, sites, own research | none | open |
| WDC 65C816 datasheet | all rights reserved | chip maker | n/a | open |
| Nintendo and Ricoh patents | patent office | maker | n/a | open |
| ultra64.ca; SNES Development Manual | all rights reserved; none | maker material hosted by others | n/a | closed |
| 64dd.org | notice, no grant | hosts game images, by its own posts | none | closed |

- No hub read for this family states a rule on leaked or confidential material,
  and none carries a statement like the tainted PlayStation reference's.
  The [SNESdev][snesdev] and [N64brew][n64brew] wikis have no about, copyright, policy, or disclaimer page,
  and the [NESdev wiki][nesdev-disc] has no copyright or policy page;
  its [About][nesdev-about] and disclaimer pages state no such rule.
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
- [fullsnes][fullsnes] carries "Copyright 2012 by Martin Korth (nocash)" and no grant.
  Its author writes that the video and audio parts "are widely based on Anomie's great specs
  (on that part I've mainly rearranged and reformatted the Anomie's txt files, verified most of it on real hardware,
  and discovered only a few additional details)".
- fullsnes's credits include "snes9x - open source emulator
  (info on undocumented coprocessors)",
  a closed-tier emulator, and one body line refers to "Nintendo's developer manuals".
  A search of the page found no match for "confidential".
- The [Super Famicom Development Wiki][sfdw] carries a copyright notice, "©2026 Super Famicom Development Wiki",
  and no licence.
  Its owner says he collects "development items, prototype games, game source code";
  that sentence describes his collection and does not say that the wiki's text comes from it.
- [Romhacking.net][rhdn-policy], which hosts [Anomie's documents][rhdn-doc], rejects ROMs and accepts maker material:
  "Official documentation or SDKs should be labeled with the author placeholder 'OEM'".
  Those items are maker material hosted by others, which ADR 0001 closes;
  the register opens the documents section and leaves them to the written rule.
- [libdragon][libdragon]'s licence file is the Unlicense, and no public dispute about its origin was found.
  Its README makes no clean-room statement.
  Its `boot/` folder holds "an open source bootcode" that replaces the cartridge boot code Nintendo wrote.
  This note recommends that replacement boot code for cartridges, or for a coprocessor ROM,
  counts as "system software" under the closed test
  ([option 9][opt9]); the folder would then take a closed path line, added if the owner adopts the rule.
- [parallel-rdp][prdp] is MIT and says it was "written from scratch by studying Angrylion-Plus", "not a port,
  and not a derived codebase".
  The Angrylion fork ships a licence text saying "MAME is not licensed for commercial use";
  which files that text governs is not stated in its README.
- On 2026-11-20 GitHub's licence endpoint for the Angrylion fork returned HTTP 404,
  meaning no licence file was detected, and the guard then blocked a further call to the closed repository
  (research log).
  The fork stays closed either way: ADR 0001 closes both a non-commercial licence and no licence.
- The [Visual6502 repository][v6502-repo]'s README says only "Note the various licenses
  and Copyright associated with each file", so its code is walled until those notices are read.
  The [site][v6502] serves the same simulator code, which the register walls too.
  [Quietust's Visual 2A03][qmt] runs on it, and "The 6502 CPU was copied directly from The Visual 6502";
  his chip images and page prose stay open.
- [6502.org's documents index][6502docs], in its capture of 2026-09-19,
  lists "Component datasheets for 6500- family parts from the original manufacturers" (the space is on the page).
  Neither that capture nor the [home page's capture of 2026-10-16][6502home] has a copyright or licence line
  (a count of "copyright" and "licen" in the raw captures gave 0).
  The live site answered HTTP 404 at every form of its address on 2026-11-20 (research log).
  The pages show no sign that the makers released those copies,
  so the register closes the folder under the row for maker material hosted by others.
- Maker-published material is thin.
  The [65C816 datasheet][wdc] is Western Design Center's current part, with "All rights reserved,
  including the right of reproduction"; the console uses a Ricoh chip built around that core (from memory).
  One Nintendo patent and one Ricoh and Nintendo patent were read at the [patent office][uspto].
  No maker-hosted copy of the NEC manuals for the Nintendo 64 and Virtual Boy processors was found
  (the searches are under ["Processor and chip makers' manuals"][s-makers]);
  copies sit on third-party hosts and were not opened.
- Must not be used: the SNES Development Manual; the Nintendo 64 kit and manuals on `ultra64.ca`
  (closed, so not linked),
  which a resource list describes as "official development manuals, as well as SDK downloads";
  the decompiled and repackaged kit libraries; the 2020 leak of Nintendo source code
  (secondary; [Wikipedia][wp-leak]);
  the leaked UltraHLE source (from memory); maker documents on Romhacking.net and 6502.org;
  Nintendo's own SNES test programs, which a results page lists; game images on `64dd.org`
  (closed, so not linked); and the console boot ROM files that two open-tier emulators' READMEs ask the user to supply.
- Gaps: outside patents, no maker document was found for the NES and SNES video and sound chips or
  for the Nintendo 64 graphics coprocessor, whose detailed maker description is the closed kit documentation
  (from memory).
  For SNES cartridge coprocessors the hubs found credit a closed-tier emulator or extracted firmware.
  The decap image archive these projects cite refused every request.

### Nintendo DS, DSi, and 3DS

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| GBATEK, DS, DSi, and 3DS parts | notice, no grant | credits; cites DSiBrew and 3dbrew | none | open |
| GBATEK, DSi Teak and BPTWL pages | notice, no grant | Teak: leaked files; BPTWL: a leak | none | closed |
| DSiBrew | none | unstated; invites reverse engineering | none | open |
| 3dbrew | none | "legal reverse engineering" and public information | bars NDA material | open |
| Citra site archive | notice, no grant | lists where 3DS research lives | none | open |
| melonDS blog | notice, no grant | its developer's hardware research | none | open, lead |
| GBATEK addendum thread (melonDS board) | none | "several individuals" | none | open, lead |
| BlocksDS documentation | CC BY-SA 4.0 | unstated; links GBATEK | none | open |
| libnds, libctru (devkitPro) | zlib | unstated | none | open |
| Teakra | MIT | GBATEK's Teak section; own testers | none | open |
| Arm reference manuals | Arm notices | chip designer | n/a | open |
| Luma3DS | GPL-3.0, parts MIT | reimplements system software | none | closed |
| Nintendo kits, firmware, keys | none | maker material; leaks | n/a | closed |

- [3dbrew][3dbrew] is the one hub in this family with a stated origin and rule.
  "Information found on this website is found through legal reverse engineering
  (both in the hardware and software sense)
  and publicly available information", and information "obtained via an NDA" "cannot be disclosed on this website".
  The page was last edited in 2011, does not use the word "leak",
  and says the site "cannot be held responsible for information submitted by users" (3dbrew, Copyrights).
- [DSiBrew][dsibrew]'s rights setting is empty, and its policy page does not exist.
  Its only licence text is about copying from other sites:
  "Never copy and paste articles or do any act of verbatim copying from any source without following its licensing terms
  to the letter" (DSiBrew, Contributing).
- [GBATEK][gbatek-about]'s DS part names a file of "Nintendo's devkit" and describes what it does,
  without saying how that is known.
  Its DSi part credits DSiBrew, and its 3DS part, marked "under construction", cites 3dbrew.
- On their author's words the DSi Teak pages fail the open test of the kinds table,
  as the [Game Boy findings][s-gb] set out (inference).
  GBATEK says of the TeakLite II opcodes that "the only available info has leaked in form of .DLLs",
  bundled with a release of RealView Developer Suite, and that those files were used to disassemble every opcode.
  The leaked document is a signal-processor designer's specification (DSP Group).
- RealView is Arm's suite: [Arm's documentation service][arm-rvds] serves the "RealView Development Suite Getting
  Started Guide Version 4.1 RC2" (DUI 0255) and the RealView Compilation Tools guides (DUI 0204, DUI 0348), each record
  marked non-confidential.
  GBATEK does not say who owns the leaked .DLLs, and this note does not assume it.
- [Teakra][teakra], the signal-processor emulator that [Panda3DS][panda-tp] bundles in its `third_party` folder,
  credits GBATEK for the Teak documentation (Teakra README; Panda3DS folder listing).
  It also says that a Teak-family debugger from Lauterbach shows registers
  and an instruction set close to those GBATEK describes, and it ships two 3DS hardware testers,
  `dsptester` and `dspmemorytester` (Teakra README, read raw on 2026-11-20).
- Teakra stays open under its MIT licence.
  It is not a fork of GBATEK, so the rule on inherited origin does not reach it (inference).
  Settled for this note and the register:
  a Teak fact taken from Teakra is relied on only where its hardware testers confirm it, and its register line says so.
- The four Arm manuals for these processors are served by Arm and marked non-confidential.
  Three technical reference manuals carry the same core notice:
  "Neither the whole nor any part of the information contained in, or the product described in,
  this document may be adapted or reproduced in any material form except with the prior written permission of the
  copyright holder".
  None of the three mentions models or patents
  (Arm [DDI 0201D][arm-ddi0201], [DDI 0360F][arm-ddi0360], [DDI 0210C][arm-ddi0210]).
  Each adds that "The right to use, copy
  and disclose this document may be subject to license restrictions in accordance with the terms of the agreement
  entered into by ARM and the party that ARM delivered this document to".
  [Citra's developer page][citra-dev] linked two of them.
- The [architecture manual for ARMv5 and ARMv6][arm-ddi0100] differs,
  and its notice was re-read in full from Arm's own copy on 2026-11-20 (pages i to iii, extracted with pdftotext).
  Clause 1 grants "a perpetual, non-exclusive, nontransferable, royalty free,
  worldwide licence to use" the manual for three purposes: software and operating systems, and tools,
  each for cores "distributed under licence from ARM", and chips that incorporate a core "manufactured under licence".
- Clause 2 says "No right is granted to you under the provisions of Clause 1 to;
  (i) use the ARM Architecture Reference Manual for the purposes of developing or having developed microprocessor cores
  or models thereof", compatible with the manual's instructions or programmer's models,
  and adds "(ii) develop or have developed models of any microprocessor cores designed by or for ARM".
  So the exclusion limits what the clause 1 licence covers; it is worded as a right not granted,
  not as a ban on reading.
  Pages i to iii make neither access nor reading conditional on accepting the notice: a search for "conditional",
  "accept", and "agree" found none.
  The page ends: "This document is Non-Confidential.
  The right to use, copy and disclose this document is subject to the licence set out above."
- Legal risk, recorded as a finding (inference):
  a reader who builds a processor model from DDI 0100I acts outside that licence.
  Whether that matters turns on whether the use needs a licence at all,
  for copyright in the manual's text or for patents, which clause 2 also excludes; [R0-02][r002] holds that baseline.
- Legal risk, recorded as a finding (inference): the older core manuals' ban reaches "the product described",
  the processor itself, and not only the text, and no Arm page read defines "material form".
  A model of the processor built from those manuals may be read as adapting or reproducing the product described.
- No hardware documentation published by Nintendo for these systems was found.
  The [Citra index][citra-idx] lists papers by staff of the 3DS graphics chip's designer, DMP;
  one was located and not read ([Kazakov and Ohbuchi, 2011][kazakov]; the affiliation is from [Crossref][crossref]).
- [libnds][libnds] and libctru state the zlib licence and no origin. libnds's licence file,
  re-read through the GitHub API on 2026-11-20, is the zlib text,
  which grants permission "to anyone to use this software for any purpose, including commercial applications,
  and to alter it and redistribute it freely", under three conditions; GitHub's metadata reads `NOASSERTION`.
- The [Homebrew Channel's README][hbc], which accuses libogc,
  says libogc's co-maintainer was "caught referencing the official Nintendo DS ("nitro") SDK while writing code
  for libnds".
  Its footnote limits that charge: "This should not be taken to imply that any
  or all of libnds itself is tainted with SDK code.
  The commit in question itself only adds fairly standard cache maintenance functions,
  and is not itself evidence that there was substantial copying" (hbc README, lines 94 to 102).
  The next sentence still says he was referring to "the leaked SDK" (line 103).
  Settled: the accuser does not dispute the library's origin, only the co-maintainer's conduct, so libnds stays open,
  and its register line carries that limit.
  No statement naming libctru was found.
- The maintainers' own site refuses scripts (HTTP 403 from a Cloudflare block on 2026-11-20).
  Its [capture of 2026-10-16][devkitpro-cap] is a forum portal that calls devkitPro a "provider of homebrew toolchains
  for Nintendo wii, gamecube, ds, gba, gamepark gp32 and Nintendo Switch".
  It shows no licence, origin statement, or rule on leaked material,
  and lists an announcement titled "libogc license controversy" (lead; not opened).
- Panda3DS, an open-tier emulator, carries a `third_party/duckstation` folder of helper files from DuckStation,
  whose licence is now closed; the files' own licence was not read, so the register walls the folder.
- [BlocksDS][blocksds] documents a licence for each component
  and says it reimplemented one library whose "licensing status in unclear"
  (BlocksDS, design guide; wording as on the page).
- [Azahar][azahar] adopted an AI policy effective 20 March 2026:
  "Use of AI to rewrite incompatibly-licensed code for submission to Azahar is prohibited" (Azahar `AI-POLICY.md`).
- Must not be used: Nintendo's development kits for these systems and the 2020 leaks; the leaked specification,
  libraries, and firmware file that GBATEK names; BIOS, firmware, boot ROM,
  and key files that emulator READMEs ask users to supply; key pages inside DSiBrew, GBATEK, and 3dbrew,
  known from their indexes only; the replacement BIOS inside melonDS and DeSmuME; Luma3DS;
  and Nintendo's "Aging Card NTR" test software, which a [wiki][egw-nds] lists among test ROMs.
- Gaps: no DS or DSi reference with a licence grant or a stated method;
  no reference for the signal processor that does not run through material GBATEK calls leaked;
  no openly licensed specification of the 3DS graphics chip,
  where the research index found points mostly to personal notes and forum posts;
  no single-step vectors for the ARM9 or ARM11;
  and no 3DS hardware test suite under a licence that is known to be maintained,
  although Teakra's testers and crossbar9 are licensed.

### GameCube, Wii, Wii U, Switch, and Switch 2

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| Yet Another GameCube Documentation | none | games, patents, public documents | none | open |
| GC-Forever wiki | none | unstated | none | open |
| WiiBrew | none | unstated; founded by a developer channel | bars leaked kit content | open |
| WiiUBrew | none | unstated; founded by a developer channel | forbids leaked information | open |
| SwitchBrew (Switch and Switch 2) | none | unstated | none | open |
| Dolphin wiki and repository documents | CC BY-SA 3.0; GPL-2.0+ | emulator project | contributing guide | open |
| Cemu; decaf-emu | MPL-2.0; GPL-3.0+ | emulator projects | Cemu: an AI rule only | open |
| libnx; wut | ISC; zlib | libnx: "Based on libctru"; wut: unstated | none | open |
| Switch controller notes (dekuNukem) | none | own hardware captures | none | open |
| Power ISA (OpenPOWER) | end user licence | standards body and IBM | n/a | open |
| Arm A-profile manual; Khronos specifications | maker notices | chip designer; standards body | n/a | open |
| Nintendo open-source releases page | per component | maker | n/a | open |
| NVIDIA Tegra X1 manual | contract | maker, behind registration | n/a | walled |
| libogc2 | zlib-style | fork of libogc | none | closed |
| Atmosphère; fail0verflow mini | GPL-2.0 | replace system software | none | closed |

- The three "brew" wikis differ.
  [WiiBrew][wiibrew]: "Content pertaining to leaked information such as Nintendo's private SDK are prohibited,
  and will be removed on sight."
  [WiiUBrew][wiiubrew]: "Content pertaining to leaked information is forbidden."
  [SwitchBrew][switchbrew] has one project page, a one-sentence About, and so no licence, origin statement,
  or rule on leaks; it is also the only hub found that covers the Switch 2.
  All three have an empty rights setting.
- The [GameCube specification][yagcd] states a lawful origin:
  "Everything in this Document has been reverse-engineered from legally [acquired] software (Games),
  publicly available Patents and Documentation for the sole purpose of writing interoperable Software"
  (YAGCD, section 1.4; one misspelling corrected in brackets).
  Its references chapter lists 29 United States patents, seven maker manuals and datasheets, and one Ecma standard.
- The specification's credits also thank a "Gamecube Source pack", unnamed "sources",
  and for graphics work the person whom the Homebrew Channel's authors accuse over libogc.
  It states no licence and was last modified in 2006.
- The site that hosts that specification also [lists maker documents][hitmen-gc]: a Panasonic datasheet it hosts,
  which the register closes by its path, and an IBM manual it links at IBM.
  Its PlayStation page hosts an "R3000A Manual", closed the same way.
- Maker manuals for these processors were not found on a maker's site.
  IBM's former addresses return "not found", among them the one the GameCube document's host links,
  and the searches of 2026-11-20 under ["Processor and chip makers' manuals"][s-makers] found no ibm.com copy.
  Copies sit on third-party sites and were not opened.
  A search result described one copy of the GameCube processor manual as marked confidential
  (lead; the search was not recorded, and the copy was not opened).
- The [Power ISA][powerisa] licence grant is "Solely for the purposes of developing and expanding the Power ISA
  and the POWER ecosystem".
  Its definition of a "Power ISA Core" includes an implementation "represented by software",
  but only one that meets the compliance definition.
  Whether an emulator of an older 32-bit core that is not compliant is covered is not stated (inference).
- The [current Arm A-profile manual][arm-ddi0487] says "No part of this document may be reproduced in any form by any
  means without the express prior written permission of Arm Limited".
  It makes access conditional on not using the information "for the purposes of determining
  whether the subject matter of this document infringes any third party patents" (Arm DDI 0487, issue M.d).
  [R0-01][r001] found both conditions on the manual's known-issues document.
- Khronos "grants a conditional copyright license to use and reproduce the unmodified Specification for any purpose",
  with no patent or trademark licence ([Vulkan specification, preamble][vulkan]).
- NVIDIA lists a Tegra X1 technical reference manual and says some downloads need membership of its developer programme.
  The [manual licence it publishes][nvidia-lic] says the licensee "shall not use the TRM and/or any Derivative Works
  created by Licensee on any software or hardware platforms that do not contain an NVIDIA application processor", and
  "shall maintain the confidentiality of the TRM".
- [SwitchBrew's Tegra X1 page][sb-tegra] gives the manual's address as NVIDIA's embedded downloads page,
  with the remark "(2977 pages, requires free Nvidia developer account)",
  and says "There is no available TRM for the Tegra X1+" (raw wikitext, read on 2026-11-20).
  Nothing was accepted at NVIDIA, so whether the agreement shown there is the one quoted above was not determined.
  A web search summary gave a document number and revision for the manual; no NVIDIA page confirmed them,
  so they are not recorded.
- A manual handed out only under a confidentiality agreement is not plainly one the maker "published itself",
  so no row of the kinds table fits, and ADR 0001's step 3 walls it for now.
  This note recommends a row that closes such manuals ([option 9][opt9]).
  The register walls the download page as well as the licence page, by a pattern cut short.
  No maker document for the Switch 2 processor was found.
- Nintendo publishes the open-source components of its consoles, with entries for Switch 2, Switch,
  and Wii U. Apart from a technical specifications page,
  it is the only maker-published technical material found for the Switch 2
  ([Nintendo, open-source software page][nintendo-oss]).
- libogc stays closed. libogc2 "is largely API compatible with libogc 2.1.0 and earlier",
  and its licence names libogc's two copyright holders and its own.
  No accusation names it, so the library row's literal test would open it.
  This note recommends that a fork inherits its parent's disputed origin
  ([option 9][opt9]), and the register closes libogc2 on that basis.
- [Dolphin's hardware tests][dolphin-hwtests] require libogc;
  the READMEs of the other two GameCube and Wii suites found do not say what they build with.
- Atmosphère describes itself as "customized firmware" whose parts replace components of the system,
  which meets the closed test whatever its licence.
  [Dolphin's repository][dolphin-repo] holds a free replacement for the signal-processor ROM,
  in `docs/DSP/free_dsp_rom` and as built images in `Data/Sys/GC`; the register closes those paths as system software.
  A GitHub tool call names the path in a separate field, which the guard does not match,
  so that route rests on the rule.
- Dolphin's contributing guide, in a section added in March 2026, says "We accept contributions from humans,
  not from AI agents" and "you're not allowed to use LLMs to make changes related to the behavior of the emulated
  console or to use LLMs to obtain information related to the console".
  Its reason: "we have to assume that they contain leaked Nintendo information" (Dolphin `Contributing.md`).
  Its `AGENTS.md` adds: "For legal reasons,
  AI agents must not make changes related to the behaviors of the emulated consoles."
- [Cemu][cemu]'s contributing guide asks for human-written code and gives as one concern that "There is evidence
  that LLMs have been trained on leaked proprietary SDKs" ([R0-01][r001]; Cemu `CONTRIBUTING.md`).
  It states no rule on contributors' own use of leaked material.
- The [Switch controller notes][deku] collect their author's discoveries, with his own captures, and carry no licence.
  As notes they are a community reference, which "no stated licence" does not close, so the register opens them.
- Switch emulation is under active enforcement.
  GitHub published 47 notices with "nintendo" in the file name between February 2025 and 12 November 2026
  ([GitHub's takedown notices][ghdmca]).
  Skyline's README says its source "has been removed from all owner-controlled branches
  and tags at the request of authorized agents of Nintendo".
  The yuzu and Ryujinx repositories return "not found".
- Ryujinx's successor, [Ryubing][ryubing], says it "is licensed under the MIT license"; the register walls it,
  because its licence file was not read and a takedown notice names it. yuzu's successors are unevaluated and so walled.
  [R0-02][r002] covers the history.
- Must not be used: Nintendo's development kits for these consoles; libogc and libogc2; Atmosphère, mini,
  and other replacement system code; third-party copies of maker manuals with no maker release shown; key, fuse,
  title-list, and dumping pages on the wikis and on emulator sites.
- Gaps: no maker-hosted processor manual for the GameCube, Wii, or Wii U;
  no maker document beyond patents for their graphics chips; no hardware test suite for the Wii U, Switch, or Switch 2;
  no open-tier Switch emulator; and no Switch wiki with a stated origin,
  although one set of controller notes states its own captures.

### PlayStation family

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| psx-spx and the Nocash PSX specification | see R0-01 | see R0-01 | see R0-01 | tainted |
| Walker's PlayStation document (2000) | "free to give this away" | a console taken apart; emulators | denial | open |
| Doomed's and bITmASTER's text files (1999 to 2000) | none | unstated | none | open |
| psxrev (emu-russia) | CC0 | board and chip reverse engineering; a "condidual" figure | none | walled |
| Copetti's articles | CC BY 4.0 | source lists, some tainted or closed | none | open, lead |
| IDT R30xx software manual, front matter | copyright lines | chip maker; university copy | n/a | closed |
| ps2tek | none | unstated | none | open |
| Sony's PS2 system manuals, third-party copies | no redistribution | maker, sold with a kit | n/a | closed |
| Yet Another PSP Documentation | none | datasheets, patents, forum contributors | none | open |
| vfpu-docs (PSP) | GPL-3.0 | each statement has a test for a PSP | none | open |
| psdevwiki (seven wikis) | GFDL 1.2 | unstated; an encyclopedia, as a goal | PS4 wiki bars leaks | open |
| Vita Development Wiki | CC BY | unstated | none | open |
| Sony's PS3 Linux documents | GFDL 1.2 | maker | n/a | open |
| Sony's open-source pages | per package | maker | n/a | open |
| PSPSDK; vitasdk; PSL1GHT | BSD; MIT; MIT | unstated | none | open |
| ps2sdk | AFL-2.0 | unstated | none | walled |
| RPCS3; Vita3K; shadPS4; Mednafen | GPL-2.0 variants | emulator projects | Vita3K: denial | walled |
| PSn00bSDK | MPL-2.0 core | parts "lifted as-is from Sony libraries" | none | closed |
| psx.arthus.net; Net Yaroze manuals | none | maker material hosted by others | none | closed |
| uOFW; Obliteration | MIT; MIT or Apache | reimplement system software | none | closed |

- The tainted reference reaches other sources.
  PSn00bSDK's README lists it first among "References used" (`Lameguy64/PSn00bSDK`, closed, so not linked).
  The [Rustation][rustation] emulator's README says its author is "mainly using" the Nocash specification,
  and that its geometry coprocessor support was "ported from mednafen PSX", a walled emulator;
  its author adds "I also run tests on the real hardware".
  [Copetti's PlayStation article][copetti-ps] lists it for the processor, audio, disc format, and graphics.
  A fact taken from these may be known only from the tainted document, and none of them marks which (inference).
- Rustation and its companion guide, `simias/psx-guide`, stay walled, as merged.
  The rule this note recommends for sources that name tainted or leaked material is the nearest wording,
  and [option 7][opt7] gives the reason.
- Copetti's citations point at per-chapter pages of the Nocash document whose file names the register's pattern did not
  match.
  The register now carries a second pattern for them.
- Of the PlayStation 1 references found,
  [Joshua Walker's compilation of 2000][walker] gives the fullest account of its origin.
  It says: "You are, once again, free to give this away, trade it, or do what you will.
  It's not mine anymore.
  It's everybody's."
  "I never looked at any of Sony's official documentation
  and never took any thing you would have to have a license to get."
- Walker says of his method: "I mostly poked at emulators to see how they worked."
  He says of its reliability: "Most of the stuff in here is hearsay and logical deductions."
  His bibliography names a chip maker's manual and text files by other authors whose origin is not stated.
  Those text files, by Doomed and bITmASTER, are hosted by Hitmen, whose [listing][hitmen-psx] names their authors.
- [psxrev][psxrev]'s wiki index shows "A picture from one "condidual" manual that shows the connections well".
  If the misspelt word means confidential, the wiki copies a figure from a maker's confidential manual,
  which the tainted test would reach.
  No page that may be read settles it: the guard blocked the wiki index as walled on 2026-11-20,
  the eight-line root README does not mention the figure,
  and opening the figure would mean reading material that may be confidential (research log).
- Settled: psxrev stays walled under ADR 0001 step 3, for a source "whose facts cannot be established".
  It is not cited for PlayStation 1 facts until its wiki prose can be read, and the figure is never opened.
- PSn00bSDK calls itself "The most powerful open source SDK for the PS1 (as far as open source PS1 SDKs go)".
  Its README says that the kit "is currently (and will probably always be) in a legal gray area due to this"
  (emphasis removed).
  Its to-do list puts the copied parts in one library:
  `libpsxgte`'s assembly functions are to be rewritten "as parts of them have been lifted as-is from Sony libraries"
  (PSn00bSDK README, lines 87 to 89, read raw on 2026-11-20; the later verification pass could not re-read it,
  because the guard blocks calls that name the closed repository).
- This note recommends that a library whose README admits copied maker code is closed
  ([option 7][opt7]), and the register closes PSn00bSDK on that basis.
  The tier table's "derived from a console maker's binary" is the nearest wording in the ADR as it stands.
- The common PlayStation 1 test collection, [ps1-tests][ps1tests], links that library into every test:
  its `common-test.mk` lists `-lpsxgte` among the linked libraries
  (line 6, commit `f727802`, 2023-03-05),
  and its README builds the tests with the `jaczekanski/psn00bsdk` container image.
  So each built test may hold code lifted from Sony's libraries, where the test calls those functions (inference).
  A GitHub code search for `psxgte` in the repository gave 6 files, `common-test.mk` among them.
- Settled for those tests: their results stay usable, as ADR 0001 allows for results,
  and their own source stays open under MIT.
  Their built binaries are run only to observe results and are not stored in this repository;
  storing tests is left to [R0-03][rm0].
- The IDT manual describes the processor family, not Sony's chip; the copy is closed, so it is not linked.
  The copy read sits on a university server and holds only front matter, six pages by the second pass;
  its title pages carry copyright lines and no grant.
  The pages read show no sign that IDT released that copy, so the row for maker material hosted by others closes it.
  The register names the whole host, because its path holds a "~" that the guard cannot match.
  The manual for the core Sony used could not be fetched (the document and address tried were not recorded).
- Sony did release PlayStation 2 hardware manuals, to buyers of its Linux kit.
  Its [community FAQ][ps2faq], read in a third-party copy,
  says "you may not re-produce or copy the manuals or re-distribute them",
  and "the PDFs may not be posted on public web sites".
  It adds that they "have identical content to 6 of the 7 system manuals provided to licensed developers".
- Copies of those manuals found online show no sign of Sony's permission, which the FAQ requires.
  This note recommends a row for maker documents that survive only on third-party hosts
  ([option 5][opt5]): closed unless the maker's release is shown.
  That row closes these copies; the register already closes them as a precaution.
- [Sony's PlayStation 3 Linux documents][ps3linux] carry a free licence: "Permission is granted to copy,
  distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.2".
- [psdevwiki][psdev-cap3]'s seven wikis share the footer "Content is available under GNU Free Documentation License 1.2
  unless otherwise noted".
  Its PlayStation 3 About page gives its goal
  as "an open-collaborative online encyclopedia around the whole PlayStation brand",
  and its main pages have "Reversing" sections.
  The PlayStation 4 wiki's About page says "We do not allow warez, leaks,
  or other info unrelated to PlayStation 4 or PlayStation family in general";
  no other page read states a rule on leaked material.
- Six of psdevwiki's seven main pages index a "Keys" page, and three index pages on Sony's development kits;
  none was opened.
  The [PS3 main page][psdev-cap3] links "SCEI PS3 SDK" and "PSDK3v2",
  and the [PS4 main page][psdev-cap4] links "SCEI PS4 SDK", "PSM SDK", and "Open Orbis SDK"
  (captures of 2026-09-10 and 2026-09-24).
  The register closes by name, with guard tests, the pages on Sony's own kits: the two "SCEI" pages,
  and the "PSM SDK" page, which by its name covers Sony's PlayStation Mobile kit (from memory), closed as a precaution.
  "PSDK3v2" and "Open Orbis SDK" name homebrew kits (from memory; Open Orbis is the open-tier toolchain in the Sources).
- The site refuses scripts, so the psdevwiki findings rest on archived copies dated November 2025 to November 2026.
  The default 2026 captures of the PS3 and PS4 roots were refusal pages,
  so the archive's capture index was used to find complete ones (research log).
- [ps2tek][ps2tek] states no licence and no source.
  It describes itself as "inspired by nocash's websites for various consoles", which is a statement about form.
  Its chapter on the input and output processor, a "Duplicate of the PSX's CPU" by its overview,
  states no source on the lines read.
- The PSP has a reference tied to tests:
  "For each of these statements there's a test that can be executed on a PSP device to validate it"
  ([vfpu-docs][vfpudocs] README).
  The same README says Sony "did not release any public documentation" for the PSP.
- uOFW "aims to reverse engineer the basic PSP kernel & hardware" and "provide a free and open source vanilla firmware",
  which meets the closed test whatever its licence.
- Emulator licences: [RPCS3][rpcs3]'s README says "Most files are licensed under the terms of GNU GPL-2.0-only License"
  and that some files may differ.
  [Vita3K][vita3k] says it is "licensed under the **GPLv2** license.
  This is largely dictated by external dependencies, most notably Unicorn",
  which suggests that a dependency holds it to version 2 (inference).
  [Mednafen][mednafen] says GPL version 2 without "only" or "or later";
  [shadPS4][shadps4]'s prose files are marked "GPL-2.0-or-later" and its code was not read.
  Vita3K adds that it is not "derived from confidential materials belonging to Sony".
- Mednafen's home page links `/releases/` and source archives under `releases/files/`,
  which confirms the path the register walls (raw home page, read on 2026-11-20).
- The [PlayStation 1 developer forum][psxdev] has been offline since October 2025.
  Other hubs refused automated access during the first pass; which ones was not recorded.
  The [Vita development wiki][vitawiki] answered on re-check:
  its footer reads "Content is available under Creative Commons Attribution unless otherwise noted",
  and it has no about, copyright, or disclaimer page; the register opens it, its key pages never opened.
- Must not be used: the tainted reference in any form, including per-chapter pages and copies; Sony's development kits,
  technical notes, reference disc, and BIOS images, which one site lists in its folders;
  third-party copies of the Net Yaroze and PlayStation 2 system manuals; key, kit, and firmware pages on psdevwiki;
  PSn00bSDK's code; and the firmware and BIOS reimplementations.
- Gaps: for the PlayStation 1, no detailed and current reference for the disc controller, sound, video decoder,
  geometry coprocessor, and timing was found that does not name the tainted document as a source.
  Walker's document and the text files of 1999 to 2000 are the open candidates found; psxrev's wiki is a third,
  walled until its prose can be read.
- For the PlayStation 2, Sony's own FAQ says the released manuals omit the disc drive, sound chip, and peripherals.
  IBM's Cell documents could not be fetched (the addresses tried were not recorded).
  For the PlayStation 4 and 5 only wikis, security write-ups, Sony's open-source disclosure pages,
  and one toolchain's format documents were found.

### Sega, arcade, Xbox, and other systems

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| SMS Power! development pages | none | per-document authors; unstated | none | open |
| Charles MacDonald's notes | notice, no grant | "reverse engineered" from hardware | none | open, lead |
| Sega Retro articles | CC BY 4.0 | unstated | none | open |
| Plutiedev; MegaDrive Wiki | code snippets free; CC BY-NC-SA | unstated | none | open |
| Yabause wiki (Saturn) | GFDL 1.2 | partly MacDonald's Saturn notes, by permission | none | open |
| Marcus Comstedt's Dreamcast pages | none | unstated | none | open, lead |
| KallistiOS; dreamcast.wiki | new BSD, add-ons vary; none | "developed independently"; unstated | none | open |
| MAME documentation and legal pages | GPL-2.0, texts disagree | emulator project | none | open prose |
| NeoGeo Development Wiki | public domain | unstated | none | open |
| XboxDevWiki | none | unstated | none | open |
| Xenia | BSD-3-Clause | reverse engineering of bought devices | contributing guide bans the maker's kit | open |
| Free60 (Xbox 360) | none | unstated | none | open |
| Huang's Xbox memo and book | not read; none found | published research | n/a | open |
| BlastEm; Exodus; Ymir | GPL-3.0+; MIT; GPL-3.0 | emulators; Exodus: its author's reverse engineering | none | open |
| Sinclair Wiki; C64-Wiki | CC BY-SA 4.0; GFDL | not read | none | open |
| 3DO Development Repo wiki | CC BY-SA 4.0 | unstated | none | open |
| MSX Assembly Page; MSX Resource Center wiki | notice, no grant | unstated | none | open |
| WSdev wiki (WonderSwan) | CC0 | unstated | none | open |
| Renesas, NXP, Intel manuals | maker notices | chip makers | n/a | open |
| Chip research from die photographs (Nuked, SiliconRE) | LGPL-2.1 or GPL-2.0 | die photographs | none | walled |
| xemu; nxdk; Kronos; Stella; openMSX | GPL-2.0 variants or mixed | emulators and a kit | none | walled |
| Genesis Plus GX; FinalBurn Neo | non-commercial | emulators | none | closed |
| Hosted Sega, Atari, Amiga, 3DO, arcade manuals | none | maker material hosted by others | n/a | closed |

- Several hubs in this family host the maker's developer manuals beside their own pages.
  [SMS Power's document index][smspower] lists "Official SMS/GG documentation | Sega | The real thing".
  [Sega Retro][segaretro] advertises "internal documents you were never meant to see".
  One Saturn page lists Sega's hardware manuals and technical bulletins and credits individuals for them.
- A hub's own pages can be open while its hosted maker documents are closed.
  Settled for this note and later ones: a wiki article counts as the wiki, at the wiki's tier;
  where an article says it takes a fact from a maker manual, that fact needs a second source,
  or is recorded with that limit stated.
- A Mega Drive development kit tells readers that Sega's software manual, hosted on Sega Retro,
  "contains absolutely everything you need to know about the Sega Mega Drive" ([SGDK][sgdk] README).
- The broadest origin statement for the 8-bit and 16-bit Sega systems is one author's:
  "Here is a collection of the documentation, schematics,
  and other information I've reverse engineered from various pieces of hardware over the years"
  ([C. MacDonald, document index][macdonald]).
  He adds that it "is not intended to be accurate or [authoritative]" (misspelt on the page; corrected in brackets).
- For the Saturn, the usable references found are an emulator project's wiki, MacDonald's Saturn hardware notes,
  and emulator source.
  The wiki says "Special thanks to Charles MacDonald
  for allowing us to include information from his "Sega Saturn hardware notes" documentation"
  ([Yabause wiki][yabause-wiki], main page).
  The manuals the community treats as primary are closed.
- [Plutiedev's FAQ][plutiedev] says "Do whatever you want with the code snippets in this site" and grants nothing
  for its text.
  The [MegaDrive Wiki][mdwiki]'s footer gives "Creative Commons Attribution-NonCommercial-ShareAlike" with no version;
  as a community reference it is open by the kinds table, which tests origin, not licence.
- The MegaDrive Wiki's main page lists a file "TMSS Disassembly.zip", a disassembly of the console's boot code,
  which the closed test covers; the guard cannot match its address, so it rests on the written rule.
  TMSS is code the console runs before the game:
  [Wikipedia's "Sega Genesis"][wp-genesis] says the Genesis III of 1991 "included a code known
  as the Trademark Security System (TMSS), which, when a game cartridge was inserted,
  would check for the presence of the string 'SEGA'" (raw wikitext; secondary).
  So it falls under the closed test as boot code (inference).
- [KallistiOS][kos]'s licence file says it "is licensed under the terms of the "new" BSD license",
  and that in its "utils" and "addons" folders "Licenses on these pieces vary"; the register walls those two folders.
  KallistiOS says it was "developed independently from Sega entirely by free software developers".
  The original Xbox kit [nxdk][nxdk] reuses an older open kit and says nothing about Microsoft's kit.
- [Xenia][xenia]'s README says "All information is obtained via reverse engineering of legally purchased devices
  and games and information made public on the internet (you'd be surprised what's indexed on Google...)".
  Its contributing guide names the public sources: "tools made public by Microsoft
  (such as the XNA Game Studio tooling)",
  "documentation made public by Microsoft
  (such as slide decks and other presentations at conferences)",
  and "code made public by 3rd party companies (like the Valve SDKs)".
  It also says "The official Microsoft Xbox Development Kits (XDKs) are not to be used
  for any information added to the project" (Xenia `.github/CONTRIBUTING.md`).
- [XboxDevWiki][xboxdevwiki] refused requests with a rate-limit error during the first pass,
  and its live main page answered on 2026-11-20 (HTTP 200).
  The page shows no licence line; its footer has "Privacy policy", "About xboxdevwiki", and "Disclaimers",
  and says "This page was last modified on 20 December 2025, at 11:07."
  Its About page says only "To find out more about XboxDev please read our information on GitHub",
  and its disclaimer page does not exist.
- XboxDevWiki's index lists "Microsoft XDK" under "Development Kits and Tools".
  The register closes that page by name, with a guard test, and it was not opened.
- [MAME][mame-legal]'s own pages still disagree.
  Its legal page and its [documentation][mame-lic] say "version 2 or later";
  the legal page's FAQ says the "project as whole is under GPL-2.0 license".
  Its documentation describes the source as the documentation: "The source code to MAME serves as this documentation."
- The research that works from die photographs states the clearest origin and the least usable licence.
  One author writes that his repository's licence is GPL-2.0 and rejects any reading of it as "GPL V2 or later",
  and that he opposes "the use of the information provided in this repository for model training or
  for the AI generation of code or data" (Furrtek, [SiliconRE][siliconre] README).
  That statement is not a licence term on its face (inference), and Rustalgia is written mostly by agents.
- Maker manuals carry different notices.
  [Renesas][renesas-sh4]: "This document may not be reproduced or duplicated, in any form, in whole or in part,
  without prior written consent of Renesas Electronics."
  [Intel][intel-sdm]: "You may not use or facilitate the use of this document in connection with any infringement
  or other legal analysis concerning Intel products described herein", with a patent licence back to Intel.
- The [Motorola manual on NXP's site][nxp-m68k] shows only a copyright line, "MOTOROLA INC., 1992",
  on its first three pages.
  NXP still serves it at the same address.
  Once on 2026-11-20 NXP's site answered scripts with HTTP 404, home page included,
  and a later plain fetch the same day got the home page and the manual (research log).
  [Zilog's manual address][zilog] now redirects to a page that refused access.
- Two well-known permissions are narrower than their reputation.
  Hasbro Interactive's 1999 release says it "has released all rights
  that it may have to the vintage Atari hardware platform, the Jaguar";
  it does not say "public domain" or mention documentation ([fan-site transcription][hasbro], secondary).
- Amstrad's 1999 [newsgroup post][amstrad] says it is "happy
  for emulator writers to include images of our copyrighted code as long as the (c)opyright messages are not altered"
  (archived copy).
  The same post welcomes copies of manuals, saying it is glad of "People scanning, OCRing,
  HTMLing & PDFing any manuals that are genuinely (c)Amstrad",
  and its author thinks it covers only the machines whose rights Amstrad bought or made,
  the Spectrum 48 and 128 and the "+ machines".
  Neither is a licence document, and no ROM was obtained.
- Must not be used: Sega's software manual, technical bulletins, and Saturn manuals wherever hosted; the Dreamcast, 3DO,
  and Xbox development kits, by ADR 0001's rule on maker material; the original 3DO source code, ROM,
  and kit pages that the 3DO Development Repo indexes; the MegaDrive Wiki's TMSS disassembly;
  the Amiga developer disc contents on one host; the transcribed Atari 2600 programmer's guide,
  which shows no release by Atari; arcade manual collections whose host says it has not verified rights;
  a Commodore 64 reference repository that holds ROM disassemblies; and the ROM pages of SMS Power and MAME.
- Gaps: Saturn hardware beyond an emulator wiki and one author's notes;
  a policy on leaked material for the original Xbox; the Atari 2600,
  which has no usable primary reference in this evidence; the Amiga, where only a closed host was found;
  arcade boards outside MAME's walled source; the PC Engine and Intellivision hubs, which could not be reached;
  and Commodore 64 hubs beyond the C64-Wiki's footer.
  No hub was evaluated for the Atari 7800, Lynx, ColecoVision, or Neo Geo Pocket.

### Processor and chip makers' manuals

This answers [R0-01][r001]'s open question on what makers' notices permit, as far as their words go.
Every document below is served by the maker or its successor, unless the row says otherwise.

| Maker and document | Reproduction | Use to build a compatible model | Other conditions |
|---|---|---|---|
| Arm, A-profile and ARMv7 (DDI 0487, 0602, 0406C.d) | needs permission | not addressed | no infringement analysis |
| Arm core manuals (DDI 0201, 0210, 0301, 0360) | no adapting or copying | product and text; model unnamed | agreement |
| Arm, ARMv5 and ARMv6 manual (DDI 0100I) | no distribution | "No right is granted" | use licence; no patents |
| Intel, developer's manual (2026) | unmodified copies | software on Intel products | no legal analysis; patents back |
| Renesas, SuperH software manuals | needs written consent | no reverse engineering of products | no licence granted |
| Western Design Center, 65C816 datasheet | reserved | not addressed | none |
| NXP, Motorola 68000 manual | copyright line only | not addressed | site terms: personal use |
| OpenPOWER, Power ISA | all rights reserved | allowed for compliant cores | patent grant for compliant chips |
| AMD, Family 16h guide | all rights reserved | not addressed | no licence granted |
| Ecma, ECMA-119 (6th edition); ECMA-130 | unmodified; no notice | in conformant products | notice must be kept |
| Toshiba TX79; IDT R30xx (third-party copies) | all rights reserved; no grant | not addressed | no patent licence |

- Arm publishes [one standard notice][arm-notices] for its current non-confidential documents.
  Its notice for confidential documents adds conditions the public one lacks,
  such as not using the information "for developing technology or products
  which avoid any of Arm's intellectual property" (Arm, product documentation proprietary notices).
  No confidential document was opened.
- Arm's ARMv7 manual, issue C.d of 2018,
  has the reproduction ban and a patent condition worded as "whether implementations infringe",
  and not the "models thereof" wording of the older ARMv5 manual ([Arm DDI 0406C.d][arm-ddi0406], page ii).
  Earlier issues were not fetched.
- The [ARMv5 manual][arm-ddi0100]'s notice is a licence as well as a limit: Arm "hereby grants to you a perpetual,
  non-exclusive, nontransferable, royalty free,
  worldwide licence to use this ARM Architecture Reference Manual for the purposes of developing;
  (i) software applications or operating systems
  which are targeted to run on microprocessor cores distributed under licence from ARM", and tools for them.
  The "models thereof" exclusion in clause 2 limits that grant, as the [DS findings][s-ds] set out.
- The older core manuals' ban covers "the information contained in, or the product described in, this document".
  So it reaches the processor as well as the text, and no Arm page read defines "material form".
  Whether a model built from those manuals adapts or reproduces "the product described" is not addressed,
  and the DS findings record it as a legal risk (inference).
- Arm's [website terms][arm-terms] allow downloading "and to make one hard copy of the information
  for reference purposes only", except on its Keil pages,
  and say documentation "is governed by the license that accompanies it".
- [Intel's notice][intel-sdm] says "you may publish an unmodified copy", and adds a grant for software
  (inference: among the most permissive of the proprietary notices):
  "You may create software implementations based on this document and in compliance with the foregoing
  that are intended to execute on the Intel product(s) referenced in this document."
  Whether that covers software that models an Intel processor on another host is not stated (inference).
- Intel's notice also says "No rights are granted to create modifications or derivatives of this document",
  and asks for a licence back to Intel on "any patent claim thereafter drafted
  which includes subject matter disclosed herein".
- [Renesas's legal-notices page][renesas-legal] carries a Document Disclaimer,
  "an all-encompassing notice for technical documents",
  which "takes precedence over the "Notice" appearing in previously issued documents".
  It says "You shall not alter, modify, copy, or reverse engineer any Renesas Electronics product".
  The site's own terms allow "personal use" of site content and yield to conditions stated on an item.
- [Ecma's default notice][ecma-policy] permits "works by making use of this specification in standard conformant
  products by implementing (e.g. by copy and paste wholly or partly) the functionality therein".
  ECMA-119's sixth edition carries that notice; the [ECMA-130][ecma130] file of 1996 carries no notice.
  Its CD-ROM standards are free downloads.
- ECMA-130 says its content was first in the "Yellow Book" that Philips and Sony issued "for their licensees only";
  the disc formats' licensed books were not found as public documents (the search was not recorded).
- The [SD Association][sdcard] publishes simplified specifications "on a non-confidential basis"
  and says implementing them "may require a license".
- Arm's condition against patent-infringement analysis, and Intel's against infringement or other legal analysis,
  sit awkwardly with patent research ([R0-02][r002]), if the same work reads both (inference).
- For many console processors no maker-hosted manual with a readable notice was obtained: the Z80, the 6502,
  the Game Boy and NES chips, the SNES sound chips, the Yamaha and Texas Instruments sound chips, the NEC processors,
  the MIPS architecture volumes, and the PowerPC parts.
  The copies found were third-party scans and community reverse engineering.
- Four web searches on 2026-11-20 looked for maker-hosted copies of the manuals most needed, and found none
  (research log: search results only, which cannot be repeated exactly; no copy was opened):
  - "IBM PowerPC 750CL user's manual PDF ibm.com" found copies on fail0verflow.com, bitsavers mirrors, archive.org,
    and manual sites, and no ibm.com copy.
  - "Zilog Z80 CPU user manual UM0080 download zilog.com" found copies at a university archive, bitsavers mirrors,
    Scribd, and cpcwiki, and no zilog.com copy; the register already records Zilog's redirect that refused access.
  - "MIPS Architecture for Programmers Volume II download mips.com documentation" found university copies only.
  - "Renesas VR4300 user's manual NEC V810 architecture manual download" found bitsavers mirrors, n64brew,
    and virtual-boy.com; Renesas hosts manuals for the V850, the line descended from the V810
    (from memory), but no VR4300 or V810 manual was found there.
- All of those copies are maker material hosted by others, closed under the row described next.
- [ADR 0001][adr-kinds] opens material a maker "published itself" and closes maker material
  that others host "with no sign the maker released it".
  A datasheet that its maker once sold or handed out, and that survives only as a third-party scan,
  arguably fits both rows (inference).
  The ADR's order of tests (tainted, closed, walled, open) makes such a scan closed, and the register applies that.
  This note recommends writing it as a row: closed unless the maker's release is shown ([option 5][opt5]).

### Multi-system references and archives

| Hub | Licence stated | Stated origin | Rule | Tier |
|---|---|---|---|---|
| Copetti, "Architecture of Consoles" | CC BY 4.0 | per-article source lists | none | open, lead |
| emudev.org | "MIT-style" goal | unstated; reverse engineering and testing as goals | no ROMs | open |
| Emulation General Wiki | "Some rights reserved"; asks for citation | unstated | none | open, lead |
| TASVideos | CC BY 2.0 | unstated | no ROM or BIOS references | open, lead |
| Stack Exchange sites | CC BY-SA by date | forum | none | open, lead |
| Wikipedia | CC BY-SA 4.0 and GFDL | cites sources (from memory) | none | open |
| Conference talk archives | per talk | talks | none | open, lead |
| No-Intro; Redump | No-Intro: own data licence; Redump: none | hash catalogues | No-Intro: no download help | open |
| TCRF; Data Crystal | not determined; GFDL 1.2, by a summary | game binaries (from memory) | not read | walled |
| Repair and modification wikis | not read | not read | not read | walled |
| siliconpr0n | not read | decap photographs (from memory) | not read | walled |
| bitsavers | none | its owner's collection and loans | none | per item |
| Internet Archive; history foundation | per item | others' uploads and donations | removal on request | per item |
| Internet Archive's Wayback Machine | n/a | captures of other sites | n/a | other |

- [Stack Exchange][stackex] licenses contributions by date:
  "Content contributed on or after 2018-05-02 (UTC) is distributed under the terms of CC BY-SA 4.0",
  and earlier content under versions 2.5 or 3.0.
  [R0-01][r001] found a declared compatibility with GPLv3 for version 4.0 and none for 3.0.
- The [Internet Archive][ia-rights] removes material on notice:
  "If the Internet Archive is made aware of content that infringes someone's copyright,
  we will remove it per our Copyright Policy."
  Presence there is therefore no sign that a maker released an item (inference).
- The archive's captures of other sites are cited where a live page refuses scripts, with the capture's time stamp.
  The register lists `web.archive.org` as "other", an archive and not a source,
  so that the tier of each captured page is the tier of its own site.
- [bitsavers][bitsavers] states no copyright or removal policy on its home page.
  Its owner says "Most of the documents are from my personal collection that I have either bought or been given",
  or loaned for scanning.
  It says "Wget is no longer permitted here" since April 2026 and points bulk copying to rsync mirrors:
  "The situation has gotten much worse since the LLM web scrapers have appeared."
- The [Video Game History Foundation's library][vghf] says that "Unless stated otherwise,
  the library does not own the intellectual property of materials in the library",
  and that items may be withheld "at the request of the rightsholder or donor";
  a donor's permission is not a console maker's release (inference).
- These archives mix lawful scans with closed material, so the register closes named items,
  with their download paths and the `www.` form, and gives the hubs no line.
- A summary of one fetched [TCRF][tcrf] page reported that the page "does contain instructions aimed at AI agents".
  They were not acted on.
  The site is walled, and stays shut to agents even after the guard lets writers read walled prose.
- Near's articles have no authoritative host today: the author's site shows a hosting placeholder,
  and a site named for bsnes (`bsnes.org`, closed, so not linked) has a "SNES Roms" menu
  and no shown tie to the project.
- The die-photograph archive that many research projects cite refused every request, so its licence is unrecorded.
- ADR 0001 makes a fact found only in a forum, chat, video, or personal blog a lead,
  not relied on until a better source or a test confirms it.
  This note applies the same rule to the other hubs it labels "lead", which the ADR would treat as references.
- [No-Intro][nointro] and [Redump][redump] are none of the kinds that ADR 0001 lists.
  This note treats them as community references, and recommends a row that makes hash catalogues community references
  ([option 9][opt9]).
  No-Intro says "We do NOT help or encourage users to download or otherwise obtain any of the listed dumps";
  Redump's home page states no such rule.
- No-Intro's data has its own licence, which this note's pages did not show: [R0-04][r004] read its Data Usage License,
  last updated on 11 September 2026, under
  which the data "may be freely used" to the extent the operator controls the rights.
- R0-04 registered Redump as walled, because the facts could not be established.
  This note gave it open: the two notes record the same facts, no licence and a bare copyright notice,
  and ADR 0001 says that "no stated licence, does not close a reference".
  Merging accepted open, and the hash-catalogue row in [option 9][opt9] would give it a written basis.

### Test suites and test vectors

For test software ADR 0001 lets results be used always, and code by its licence.

| Suite | Licence | Expected results come from | Code tier |
|---|---|---|---|
| Mooneye Test Suite | MIT | consoles, run by hand; one class is emulator-only | open |
| GBMicrotest; AGE test roms | MIT | "checked on real hardware"; named by device | open |
| dmg-acid2, cgb-acid2 | MIT | reference image; console photographs | open |
| Mealybug Tearoom | MIT | the author's emulator; photographs of real devices | open |
| SameSuite | X11 | not stated in the top README | walled |
| blargg's Game Boy tests | none | not stated; a development cartridge is mentioned | closed |
| SingleStepTests sm83 | MIT | a translation of the ares core | open |
| SingleStepTests ARM7TDMI | MIT | NanoBoyAdvance | open |
| jsmolka gba-tests; mGBA suite | MIT | hardware: author's flash-cartridge runs; mGBA: a commit | open |
| NBA hardware tests | BSD-3-Clause | consoles, named in one test's README | open |
| FuzzARM | GPL-3.0 | computed by its generator; no hardware check stated | open |
| ARMWrestler copies; krom's GBA code | none | krom: "a real GBA using a flash cartridge" | closed |
| AccuracyCoin (NES) | MIT | the author's console, one chip revision | open |
| NES test ROM mirror (blargg and others) | none | not stated at repository level | closed |
| SingleStepTests 65x02, 65816, spc700 | MIT | 65x02, spc700: emulator implementations; 65816: not stated | open |
| gilyon's SNES tests | MIT | a console, by one commit | open |
| undisbeliever's SNES tests | zlib | a console with an sd2snes and a RAM cartridge, by commits | open |
| krom's SNES code; blargg's SNES tests | none | krom: a console; blargg: not stated (copy not recorded) | closed |
| n64-systemtest, nemu64-test | MIT | hardware runs, by commits; n64-systemtest: an EverDrive cartridge | open |
| krom's N64 tests | Unlicense | "a real N64 using a 64drive Cartridge" | open |
| parallel-rdp validation | MIT | another emulator, Angrylion | open |
| 240p Test Suite and its small ports | GPL-2.0-or-later | display tests; "tested on real hardware" | open |
| armwrestler family, rockwrestler (DS) | none | checked inside the program; partly on hardware | closed |
| polyrastertest (DS) | MIT | a New 3DS XL running in DS mode | open |
| Citra-era 3DS test repositories | none | no recorded expectations described | closed |
| Teakra testers; crossbar9 (3DS) | MIT; BSD-3-Clause | run on a 3DS | open |
| Dolphin hwtests (GameCube, Wii) | GPL-2.0 | not stated; run on a Wii or an emulator | walled |
| ioncodes and Geotale tests (GameCube, Wii) | none | hardware results recorded in the READMEs | closed |
| ps1-tests | MIT | not stated for the suite; links a kit library with lifted Sony code | open |
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
| Klaus Dormann's 6502 tests | GPL-3.0 | self-checking; written to test an emulator | open |
| vAmiga Test Suite | GPL-3.0 | "reference images taken on real Amigas" | open |

- blargg's Game Boy tests carry no licence in the author's own copy of the one archive read.
  The [common collection][csp] that bundles them has an MIT licence file that does not say
  whether it covers the bundled suites (readme of `cpu_instrs`; c-sp licence file and README).
  The author's copy sits under a path with "~", so the register closes its host by name.
  The register walls that collection, because its parts carry a mix of licences, some none, that is not resolved.
  The addresses older pages give for his tests no longer serve them.
- Where a suite's top README is silent,
  its other READMEs and its latest 100 commit messages were searched on 2026-11-20
  for statements about hardware. [jsmolka's][jsmolka-unsafe] `unsafe/README.md` says "The failures on hardware are
  probably caused by the flash card", and one [NBA test's README][nba-vram] says it "passes on GBA and GBA SP" but not
  on a DS Lite or a 3DS.
  Commits name hardware runs: [mGBA's suite][mgba-suite] updated results "to match with hardware" (`91f019f`),
  [gilyon's][gilyon] disabled a test "that fails on real SNES" (`bf38f8c`),
  [undisbeliever's][undisb] compared an sd2snes with a Quickdev16 cartridge (`5b3df82`),
  and [n64-systemtest][n64st] fixed expectations after runs on an EverDrive cartridge (`ec4279a`, `fc26441`).
  Neither the 65816 vectors' README nor their commits state an origin,
  and the header of Dormann's main test says it is designed to test a 6502 emulator. nemu64-test,
  the successor of n64-systemtest, has commits that give values seen on hardware.
- Most single-step processor vectors come from emulators, and their READMEs say so.
  One says "Any bugs that exist in Mame's microcoded M68000 emulator will exist here too";
  another that it "was generated using Reicast's CPU interpreter".
  Only the x86-family sets say they were captured from a physical processor
  ([SingleStepTests][sst] READMEs and descriptions).
  Passing an emulator-generated set shows agreement with that emulator, which is also similarity to it (inference).
- No hardware-captured vector set was found for the Game Boy, NES, SNES, Game Boy Advance, DS,
  or PlayStation processors.
- Some suites assume material the project may not obtain. [vAmiga's tests][vamigats] ask for a Kickstart system ROM
  ("Copy Kickstart 1.3 to /tmp").
  [crossbar9][crossbar9] runs "using boot9strap",
  a loader whose README describes "Boot9/Boot11 code execution" and loading "boot.firm" from the SD card or CTRNAND
  ([boot9strap][b9s] README).
  The author's [talk slides][b9s-talk] describe a forged signature
  that the 3DS boot ROM's flawed signature check accepts (lead),
  so the loader runs through a flaw in the boot ROM (inference).
  The same talk describes dumping the boot ROMs; nothing of that kind was opened or used.
- The [Game Boy findings][s-gb] name emulators that test against Nintendo's aging cartridges.
- SameSuite's X11 licence is not on ADR 0001's list for the open tier, so the tests give walled,
  although the licence is permissive.
  Whether the list should name it is [R0-03][rm0]'s question;
  the [GNU licence list][gnu-cap] calls the X11 licence "compatible with the GNU GPL".
- The GNU list's current wording on the other licences outside ADR 0001's open list,
  recorded so that R0-03 can start from it
  (revision dated 2026/04/22, read in a capture because the live site timed out twice):
  - LGPLv3: "It is compatible with GPLv3."
  - Zope Public License 2.0 and 2.1: "compatible with the GNU GPL".
  - Academic Free License, "all versions through 3.0": "incompatible with the GNU GPL".
  - CC BY 4.0: "compatible with all versions of the GNU GPL", though CC licences "should not be used on software".
  - CC BY-SA 4.0: "one-way compatible with the GNU GPL version 3".
- So, by GNU's account, only AFL-2.0 fails, and ps2sdk stays walled whatever R0-03 decides about the others (inference).
  The libretro hash database, under CC BY-SA 4.0, stays walled until R0-03 answers.
- Suites with no licence can be run for their results, but storing or redistributing them has no stated permission.
  That question belongs to R0-03.
- GitHub's licence metadata was missing or read `NOASSERTION` for many repositories here,
  as R0-01 found for the emulators; the register relies on the licence file or README where one was read.

### Patterns across the hubs

Counts are of the hub rows in the family tables above and the multi-system table, not of every source in the register.

- Of the 62 community references in those tables, meaning wikis and reference documents written outside the makers,
  27 state a licence or dedication for their text, 18 state how their information was obtained,
  and 4 state a rule against leaked or confidential material: 3dbrew, WiiBrew, WiiUBrew, and psdevwiki's PS4 wiki.
- Blogs and article sites, forums, lists, emulator projects and their wikis, kits, maker material, catalogues, archives,
  and tests are not in that count, and a hub that appears in two tables is counted once.
  A reference that gives only credits, or only a goal, was counted as not stating how its information was obtained,
  and a bare copyright notice was not counted as a licence.
  The first pull request ([#17][pr17]) lists the 62.
- Rules against confidential or leaked material are rare and narrow: three wikis for Nintendo home consoles and the 3DS,
  one PlayStation wiki, two emulators' contributing guides
  (Dolphin and Xenia), one emulator's and one author's denial, one chat rule, and bans on ROM references.
  The hubs most relied on for the Game Boy, NES, SNES, Nintendo 64, DS, Switch, and PlayStation 1 state none
  (inference: which hubs are most relied on is a judgement).
- Licences cluster by type of project: CC0 or "public domain" for the gbdev and NESdev family of references,
  Creative Commons licences or CC0 for most hardware research and overview articles,
  a mix of free documentation and Creative Commons licences for wikis,
  and nothing at all for most older single-author documents.
  Die-photograph work held as code is the exception, under GPL-2.0 or LGPL-2.1.
- Stated methods are strongest where the work starts from silicon or from tests: die-photograph schematics,
  test suites that name the consoles used, and one PSP reference tied to tests.
- Hubs sit next to closed material.
  Open wikis link maker manuals and development kits, index key pages, or host firmware two folders away.
- Statements about AI are appearing in hubs and projects: gbdev's policy; the Azahar, Dolphin,
  and Cemu emulators' policies, two of which give leaked material in models as a reason;
  one chip researcher's objection; one archive's complaint about "LLM web scrapers";
  and text addressed to AI agents on a TCRF page.

### What the evaluation cannot show

- A tier records what a hub says about itself and what others have said publicly about it.
  It does not show where any single fact came from.
  [R0-01][r001] asked how a reader can tell whether a community document descends from confidential material;
  no hub read gives a method, and none was found here.
- What can be recorded for each hub is its own statement, whether it links or describes confidential maker documents,
  and which sources it credits.
  The findings above record those three.
- Evaluation read policy pages, not technical pages.
  A hub whose policy pages are clean can still hold a page that restates a closed document,
  and no method finds a restatement that the article does not state.
  The rule settled in the [Sega findings][s-sega] covers the stated case:
  such a fact needs a second source or a stated limit.
- Some origins cannot be established from pages that may be read. psxrev's "condidual" figure is one:
  deciding it would mean opening the figure, so the repository stays walled.
- The [guard][guard] matches addresses as written.
  The [register][reg] now handles these by its patterns: the `www.` form of each restricted web pattern,
  an archive item's download path, a wiki's file pages, a closed file inside an open path or repository,
  and a pattern cut short so that an exact address cannot pass.
  A restricted pattern cannot hold "~" or "?"; a "~" stops the guard for every call,
  so a host stands in for such a path, which also blocks the rest of that host.
- These limits need a change to the guard, and rest on the written rule until then
  (each reproduced by piping a tool call into the guard):
  - a pattern is a prefix, so `dillonb/n64` also blocks the prose of `dillonb/n64-tests`;
  - an archive's storage hosts, a recursive download from an open parent folder,
    and a GitHub tool's separate path field are not matched;
  - a quoted `gh api "repos/..."` call and an organisation-wide code search escape the fallback;
  - a file named like a README one level below a closed host passes;
  - the address of a closed host's home page ending in "/" is blocked;
  - a GitHub tool's read of a restricted repository's README, and any call whose text holds "archive" or "search",
    including "research", are blocked;
  - and a walled web site blocks its prose to a writer, although ADR 0001 lets anyone read a walled source's prose.
- The guard also slows every call it checks.
  With the register at 651 lines, one `git status` call piped into the guard under `/usr/bin/dash` took 1.06 to 2.81 s
  over eight runs (tested locally, timed with `date +%s.%N` on a 12-core machine running Linux 5.15).
  The first pull request ([#17][pr17]) measured 0.10 to 0.20 s at 68 lines and 1.97 to 2.27 s at 500,
  as [issue 33][iss33] quotes, so the cost grew with the register up to 500 lines;
  the runs at 651 lines overlap the range at 500 and do not show further growth (calculated from the figures).
- Settled: these limits, the over-blocked hosts named in place of "~" paths
  (`cgi.cse.unsw.edu.au` and `slack.net`),
  and the cost of reading the register are in three task issues for the guard: [#31][iss31] (fail closed), [#32][iss32]
  (match what the register means), and [#33][iss33] (fast at any register size).
  An earlier fix, [#16][pr16], blocked the tainted reference at addresses the guard had missed.
- Pages that refused automated access were read from archived copies or not at all,
  and a hub can change its policy after the date in the register.

## Options and trade-offs

These are the choices the evidence leaves.
Each is the owner's, and several would change [ADR 0001][adr] or the [register][reg].
The last subsection gives the recommendation for each.

### 1. Hubs with no stated licence or origin: keep open, or wall them

- **What:** ADR 0001 keeps a reference open when it makes no claim of confidential origin, and records the gap.
  The alternative is to wall references that state neither licence nor origin.
- **Costs:** keeping them open rests on silence; walling them removes the main references for the DS, Switch, Xbox,
  and much of Sega.
- **Gains:** open keeps the research possible; walled spends care where nothing is known.
- **Used by:** the ADR as written.
  Asahi's test, "explicitly made available to the public at large" ([R0-01][r001]), is closer to the stricter reading.

### 2. Mixed hubs: one tier for the hub, or rules for its pages

- **What:** a wiki with key pages, or a site hosting maker manuals, can take one tier,
  or be open with named paths closed.
- **Costs:** one tier either blocks useful pages or exposes closed ones; path rules need each path found from an index,
  and the guard cannot express every case.
- **Gains:** path rules follow the ADR's tests for each kind of material.
- **Used by:** the register, for SameBoy's iOS folder, for folders of three more open repositories,
  for eleven web sites whose other pages are open, and now for the kit pages of psdevwiki and XboxDevWiki.

### 3. Documents by the tainted reference's author that carry no such statement

- **What:** apart from GBATEK's Teak pages, [GBATEK][gbatek] and [fullsnes][fullsnes] pass the ADR's tests.
  They can stay open, be read through split pages that leave out flagged sections, or be walled as a precaution.
- **Costs:** open concedes whatever their unstated origins hold;
  walled removes the standard Game Boy Advance and DS reference.
- **Gains:** closing the split pages blocks those addresses only;
  the single page and its copies still hold the flagged sections.
- **Used by:** the READMEs of [melonDS][melonds], [NanoBoyAdvance][nba], and [rustboyadvance-ng][rbang] credit GBATEK.

### 4. Makers' manuals whose notices restrict use

- **What:** read them as ADR 0001 allows and note the limits; or avoid manuals whose notice excludes "models";
  or learn the instruction sets from other documents and tests.
- **Costs:** the first leaves [DDI 0100I][arm-ddi0100]'s licence, which does not cover building models,
  the older core manuals' ban on adapting "the product described", and a copyright question;
  the others give up the most authoritative source for the ARM processors.
- **Gains:** the first is what Citra's developer page did; the others avoid the question.
- **Used by:** [Citra's developer page][citra-dev] pointed readers to Arm's manuals.

### 5. Maker documents that survive only as third-party copies

- **What:** treat a datasheet or manual that its maker once published as maker-published wherever it is hosted;
  or as closed until a maker's release is shown; or decide item by item.
- **Costs:** the strict reading leaves the Z80, 6502, and several console processors with no maker document;
  the loose one cannot tell a sold manual from a confidential one without opening it.
- **Gains:** the strict reading needs no judgement; item by item fits the facts.
- **Used by:** community references cite such scans; one identifies its processor core from them.
  The register applies the strict reading, as the ADR's order of tests gives it, to the Sharp data books, the IDT copy,
  6502.org's datasheets, two files on the GameCube document's host, and the PlayStation 2 manuals;
  each is a closed copy, so none is linked.

### 6. Tests with no licence, or with expectations from an emulator

- **What:** use results from any suite, as the ADR allows; or prefer suites that state hardware results;
  or label each suite's origin in the register and in later notes.
- **Costs:** preferring hardware-verified suites leaves several processors with no vectors at all.
- **Gains:** labelling keeps an emulator's behaviour from being taken as the hardware's.
- **Used by:** suite authors label themselves in their READMEs and commits.

### 7. Sources whose own authors name tainted or leaked material

- **What:** a kit that says parts were "lifted as-is from Sony libraries",
  an emulator that says it mainly uses the tainted specification,
  and GBATEK's Teak pages can be classed by licence alone, or closed or walled on their authors' words.
- **Costs:** licence alone opens code built on what the project refuses to read;
  for the emulator the stricter reading goes beyond the ADR's written tests,
  while for the kit the tier table's "derived from a console maker's binary" may already apply,
  and for the Teak pages the kinds table's "otherwise" column does (inference).
- **Gains:** the stricter reading matches the reason the tainted tier exists.
- **Used by:** the register closes the kit and the Teak pages and walls the emulator,
  whose README also says part of it was ported from a walled emulator.

### 8. How the PlayStation 1 primer gets its facts

- **What:** the routes found are the older documents with stated origins, makers' datasheets and patents,
  tests on hardware, and the code of open-tier emulators.
- **Costs:** [Walker's document][walker] calls itself "hearsay and logical deductions";
  emulator code may itself rest on the tainted reference, and reading it concedes access.
- **Gains:** each route has a nameable source; a hardware test's origin is the measurement.
- **Used by:** one walled emulator's author says he also tests on hardware.

### 9. Rules ADR 0001 does not yet state

- **What:** the findings met cases that ADR 0001's tests leave uncertain, and the register gave each a tier.
  The rules behind those tiers can stay in this note and the register, or be written into the ADR:
  - a source whose author names leaked material as the origin of some pages: those pages closed,
    the rest at the source's tier, with a decision on a page that only names a leak (GBATEK's BPTWL page);
  - replacement boot code for a cartridge or a coprocessor ROM counts as "system software" (libdragon's `boot/`);
  - a maker manual handed out only under a confidentiality agreement is closed (NVIDIA's Tegra X1 manual);
  - a fork inherits its parent's disputed origin (libogc2);
  - a maker document that survives only on third-party hosts is closed unless the maker's release is shown (option 5);
  - a library whose README admits copied maker code is closed (option 7);
  - a hash catalogue is a community reference (No-Intro and Redump).
- **Costs:** written into the ADR, the rules bind later notes and need the owner's decision; left in the note,
  each later case is argued again.
- **Gains:** written rules let the register cite the ADR instead of a note, and let a reviewer check a tier.
- **Used by:** the register, which applies each rule today on this note's reasoning.

### Recommendation

1. **Hubs with no stated licence or origin:** keep them open, as ADR 0001 says, and record the gap in the register.
   Walling them would remove the main references for the DS, Switch, Xbox, and much of Sega,
   and the kinds table already makes silence no bar to "open".
   A fact from such a hub that a design depends on should be confirmed by a test or a second source.
2. **Mixed hubs:** rules for named paths, with protective closed lines for key, kit, and firmware pages.
   One tier per hub would either shut the main references or expose closed pages;
   the paths the guard cannot express wait for [issue 32][iss32].
3. **The tainted reference's author's other documents:** keep [GBATEK][gbatek] and [fullsnes][fullsnes] open,
   with the Teak pages closed and the BPTWL page closed as a precaution.
   They pass the tests, three open emulators credit GBATEK,
   and walling them removes the standard Game Boy Advance and DS reference;
   flagged sections stay closed by the per-page rule of recommendation 9.
4. **Makers' manuals whose notices restrict use:** read them as ADR 0001 allows and record each notice's limits,
   preferring the current Arm manuals ([DDI 0487][arm-ddi0487], [DDI 0406C.d][arm-ddi0406]) to [DDI 0100I][arm-ddi0100]
   for instruction behaviour, and check that behaviour against test vectors.
   The current notices have no "models thereof" exclusion, while DDI 0100I's licence does not cover building models;
   the ARMv7 manual's appendices on earlier architecture versions cover the ARMv5 and ARMv6 differences
   (from memory; to be confirmed before it is relied on).
   Core timing is the gap: the architecture manuals do not replace the core manuals for the DS and 3DS processors
   ([DDI 0201][arm-ddi0201], [DDI 0210][arm-ddi0210], [DDI 0360][arm-ddi0360])
   (from memory),
   whose notice reaches "the product described";
   so timing taken from them carries the legal risk recorded in the [DS findings][s-ds],
   and timing measured by tests on hardware avoids it.
5. **Maker documents that survive only as third-party copies:** closed unless the maker's release is shown,
   reopened item by item when it is.
   This is the row this note recommends for ADR 0001, and it needs no judgement about unseen copies;
   maker-hosted current documents, such as [WDC's 65C816 datasheet][wdc] and Ecma's standards ([ECMA-130][ecma130]),
   fill part of the gap.
6. **Tests with no licence, or with expectations from an emulator:** use any suite's results, as ADR 0001 allows,
   and label each suite's oracle (hardware, emulator, or not stated) in its register note
   and wherever a later note uses it.
   No hardware-captured vector set was found for six processor families,
   so preferring hardware-verified suites would leave those with none,
   and labelling keeps an emulator's behaviour from being taken as the hardware's.
7. **Sources whose own authors name tainted or leaked material:** close the pages an author says came from leaked
   material, close a library that admits copied maker code, and wall an emulator that says it mainly uses the tainted
   document, as the register does.
   This matches the reason the tainted tier exists,
   and licence alone would open code built on material the project refuses to read.
8. **How the PlayStation 1 primer gets its facts:** make hardware tests the route that settles a fact,
   starting from the older documents with stated origins
   ([Walker][walker], the 1999 to 2000 text files),
   makers' datasheets, and patents, each named in the sentence,
   and using open-tier emulator documentation only where it states a hardware test.
   Walker calls his own document "hearsay and logical deductions", and emulator code may rest on the tainted reference;
   so the measurements belong to [R5-12][rm5], "PlayStation 1 behaviour measured on a console",
   and results from [ps1-tests][ps1tests] may be used while its binaries are not stored.
9. **Rules ADR 0001 does not yet state:** write the seven rules of option 9 into ADR 0001,
   in a change the owner approves, and keep the register's tiers until then.
   Each rule matches a tier the owner accepted by merging [#17][pr17],
   and a written rule lets a reviewer check a tier without this note.
   The pull request lists the seven for the owner.

## Implications for Rustalgia

- The hardware primers ([R1-01][r101] to [R1-04][r104]) and family surveys
  ([R1-10 to R1-27][rmsurv]) read from this map.
  Each should cite the hub's register line and repeat the hub's gaps, not the tier alone.
- The PlayStation 1 primer and survey ([R1-02][r102], [R1-18][rmsurv]) cannot lean on one reference.
  This feeds the decision on [option 8][opt8] and the measurements of [R5-12][rm5].
- Open hubs put closed material one link away.
  This feeds a requirement that a session checks the register before following a link from a hub to a file host,
  key page, or kit.
- The guard needed register lines for forms of address it did not match, and the limits listed above remain.
  This feeds issues [#31][iss31] to [#33][iss33].
  ADR 0001's tests gave uncertain results for the kinds of source that [option 9][opt9] lists;
  this feeds the owner's decision on recommendation 9.
- Makers' notices bear on how notes quote and tabulate ([R0-04][r004]),
  and Arm's condition on patent-infringement analysis
  and Intel's on legal analysis bear on how patent research is kept apart ([R0-02][r002]).
- Test suites need their origin recorded when used.
  This feeds the testing notes ([R2-15][rm2], [R4-10][rm4]), and the licence gaps feed [R0-03][rm0],
  which also answers whether X11, LGPL-3.0, ZPL-2.1, AFL-2.0,
  and the Creative Commons attribution licences belong on the open list.
  The GNU list's current wording on each is recorded under ["Test suites and test vectors"][s-tests].

## Open questions

- What do [TCRF's copyright page][tcrf], [Data Crystal's licence page][datacrystal], the repair and modification wikis
  ([Console5][console5], [ConsoleMods][consolemods]), and the die-photograph archive ([siliconpr0n][siliconpr0n]) say?
  Their tier allows their prose to anyone, but the [guard][guard] blocks a walled site's prose to a writer.
  The guard change in [issue 32][iss32], or a session the owner allows to read their prose, would let the family surveys
  ([R1-10 to R1-27][rmsurv]) evaluate them.
- Which GPL-2.0 projects are "only" and which "or later"?
  The prose a writer may read does not settle it: [openMSX][openmsx] says "GNU Public License (GPL)" with no version,
  and the [Stella][stella] and [Kronos][kronos] READMEs have no licence wording.
  [Stella's site][stella-site] says it is "released under the GNU General Public License (GPL)",
  and its manual's "License and Disclaimer" section gives the version 2 text with no "or later" notice
  (both read on 2026-11-20).
  The answer lies in per-file headers, which are code;
  a reader session for each project in its family survey would answer it.
- Who produced the expected values of the 65816 vectors, and of the suites in other tiers that do not say?
  The open suites' READMEs and latest commits were searched, as ["Test suites and test vectors"][s-tests] records;
  the 65816 set states nothing, and the walled and closed suites' code and history may not be read by a writer.
  [R2-15][rm2], which examines each suite's oracle, would answer it, with a reader session for the walled suites.

## Sources

Every page below was read on 2026-11-19, except those under "Read on 2026-11-20", which the questions needed.
For a repository on GitHub, "README and licence" means those two files, read through the GitHub API.
Some pages below were read to evaluate a register line and are not cited in the findings.
A repository that the register lists and this list does not name was evaluated from its README, its licence file,
or GitHub's licence metadata, as the last field of its register line says.
An address in a code span with no link is one a reader must not open: a closed source,
a site that hosts maker kits or games, or a page that holds keys or firmware.
Closed repositories are named the same way, by `owner/repository` with no link.

Game Boy and Game Boy Advance:

- Pan Docs, [About][pandocs-about], [History][pandocs-history], [References][pandocs-refs], and single-page view.
- gbdev, [home][gbdev], contributing, chat, and [AI policy][gbdevai] pages.
- [awesome-gbdev](https://github.com/gbdev/awesome-gbdev) and [awesome-gbadev][awesome-gbadev], README and licence.
- gbdev wiki, [Main Page][gbdevwiki], About, copyright and disclaimer pages,
  and the [file hub's index pages](https://gbdev.gg8.se/files/).
- [Game Boy: Complete Technical Reference][gbctr], revision 199, title page, preface, chapter 4 opening, bibliography;
  README of [Gekkio/gb-ctr](https://github.com/Gekkio/gb-ctr).
- Gekkio, [home page](https://gekkio.fi/) and [hardware database](https://gbhwdb.gekkio.fi/);
  READMEs of [Gekkio/gb-research](https://github.com/Gekkio/gb-research),
  [Gekkio/gb-schematics](https://github.com/Gekkio/gb-schematics),
  [Gekkio/mooneye-gb](https://github.com/Gekkio/mooneye-gb),
  [Gekkio/mooneye-test-suite](https://github.com/Gekkio/mooneye-test-suite).
- READMEs of [furrtek/DMG-CPU-Inside][dmgcpu], [msinger/dmg-schematics][dmgschem],
  [Raphael-Boichot/Game-Boy-chips-decapping-project](https://github.com/Raphael-Boichot/Game-Boy-chips-decapping-project),
  [AntonioND/giibiiadvance](https://github.com/AntonioND/giibiiadvance), `aappleby/metroboy`;
  [iceboy.a-singer.de](http://iceboy.a-singer.de/).
- [Dan Docs, About](https://shonumi.github.io/dandocs.html).
- [GBATEK][gbatek], title block, footer, "About this Document", [index](https://problemkaputt.de/gbatek-index.htm),
  and keyword search of the single page.
- gbadev.net [chat rules][gbadevchat], [gbadoc][gbadoc], and Tonc
  ([community edition](https://gbadev.net/tonc/), [original][tonc]).
- [The Audio Advance, introduction][audioadv].
- mGBA, [home page](https://mgba.io/) and [FAQ](https://mgba.io/faq.html).
- R. Copetti, [Game Boy][copetti-gb] and Game Boy Advance articles, sources and permissions sections.
- [Internet Archive catalogue metadata][ia-meta] for the two Sharp data books (items not opened).
- blargg's Game Boy tests, index and the readme of one archive: `https://www.slack.net/~ant/old/gb-tests/`
  (closed for want of a licence, so not linked).
- READMEs and licence metadata of the test repositories named in the register,
  among them [c-sp/game-boy-test-roms][csp],
  [mattcurrie/mealybug-tearoom-tests](https://github.com/mattcurrie/mealybug-tearoom-tests),
  [mattcurrie/dmg-acid2](https://github.com/mattcurrie/dmg-acid2),
  [LIJI32/SameSuite](https://github.com/LIJI32/SameSuite),
  [aappleby/gbmicrotest](https://github.com/aappleby/gbmicrotest),
  [SingleStepTests/sm83](https://github.com/SingleStepTests/sm83),
  [SingleStepTests/ARM7TDMI](https://github.com/SingleStepTests/ARM7TDMI),
  [jsmolka/gba-tests](https://github.com/jsmolka/gba-tests), [nba-emu/hw-test](https://github.com/nba-emu/hw-test),
  [DenSinH/FuzzARM](https://github.com/DenSinH/FuzzARM), `PeterLemon/GBA`.
- READMEs of `PikalaxALT/gba_bios`, `Cult-of-GBA/BIOS`, `mgba-emu/bios-dump` (prose only; closed).

NES, SNES, Nintendo 64, and Virtual Boy:

- NESdev wiki, main page, [About][nesdev-about], [General disclaimer][nesdev-disc], rights setting, test index.
- [NESdev forum](https://forums.nesdev.org/), index and terms.
- Quietust, [chip images and Visual 2C02 pages][qmt].
- Visual6502, [home page and FAQ][v6502]; README of [trebonian/visual6502][v6502-repo].
- READMEs and licence files of [emu-russia/breaks](https://github.com/emu-russia/breaks)
  and [emu-russia/breaknes](https://github.com/emu-russia/breaknes).
- [SNESdev wiki][snesdev], main page, footer, rights setting, and the page on the SNES Development Manual.
- [Super Famicom Development Wiki][sfdw], home page.
- [fullsnes][fullsnes], contents list and About and Credits.
- Romhacking.net, [one document entry][rhdn-doc] and the [policy page][rhdn-policy].
- [Near's articles][near], index pages of the mirror.
- [Western Design Center, W65C816S datasheet][wdc] of 13 March 2024, page 1.
- United States Patents [4,799,635][uspto]
  and [5,327,158](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/5327158), front pages.
- [N64brew wiki][n64brew], main page, FAQ, footer, rights setting, lead of the Libultra page.
- [n64docs](https://n64.readthedocs.io/), home page.
- libdragon, [README, licence, and boot README][libdragon], [site](https://libdragon.dev/);
  [dragonminded.com/n64dev](https://dragonminded.com/n64dev/).
- Link lists: [n64dev.org](http://n64dev.org/), [n64.dev](https://n64.dev/).
- ultra64.ca and 64dd.org, home pages only: `https://ultra64.ca/`, `https://64dd.org/`
  (closed: one hosts the maker's kits, the other game images).
- READMEs and licence files of [n64dev/cen64](https://github.com/n64dev/cen64),
  [rasky/r64emu](https://github.com/rasky/r64emu), [Themaister/parallel-rdp][prdp], `ata4/angrylion-rdp-plus`,
  `decompals/ultralib`, [higan-emu/higan](https://github.com/higan-emu/higan),
  [cc65/cc65](https://github.com/cc65/cc65), [alekmaul/pvsneslib](https://github.com/alekmaul/pvsneslib),
  [vhelin/wla-dx](https://github.com/vhelin/wla-dx), [RPGHacker/asar](https://github.com/RPGHacker/asar).
- Sacred Tech Scroll, [contents and About](http://perfectkiosk.net/stsvb.html),
  and its [catalogue entry](https://www.virtual-boy.com/documents/virtual-boy-sacred-tech-scroll/).
- TASVideos, [site licence](https://tasvideos.org/SiteLicense) and accuracy-test pages.
- READMEs and licence files of the test repositories named in the register,
  among them [100thCoin/AccuracyCoin](https://github.com/100thCoin/AccuracyCoin),
  [SingleStepTests/65x02](https://github.com/SingleStepTests/65x02),
  [gilyon/snes-tests](https://github.com/gilyon/snes-tests), [PeterLemon/N64](https://github.com/PeterLemon/N64),
  [lemmy-64/n64-systemtest](https://github.com/lemmy-64/n64-systemtest),
  [ArtemioUrbina/240pTestSuite](https://github.com/ArtemioUrbina/240pTestSuite),
  [pinobatch/240p-test-mini](https://github.com/pinobatch/240p-test-mini).

Nintendo DS, DSi, and 3DS:

- GBATEK, [About page][gbatek-about] and index, and keyword search of the single page.
- DSiBrew, Main Page, [Contributing][dsibrew], About, General disclaimer, page index, rights setting.
- 3dbrew, Main Page, [Copyrights][3dbrew], About, General disclaimer.
- [Citra site archive][citra-idx], home and five wiki pages.
- Arm, proprietary notices of [DDI 0201D][arm-ddi0201], [DDI 0360F][arm-ddi0360], [DDI 0210C][arm-ddi0210],
  and [DDI 0100I][arm-ddi0100], from the same service.
- [Citra site archive, developer information page][citra-dev].
- [Crossref record of the Kazakov and Ohbuchi paper][crossref].
- Panda3DS, [listing of its third_party folder][panda-tp].
- [README of fail0verflow/hbc][hbc], on libogc and libnds.
- [Nintendo, open-source software page][nintendo-oss].
- Kazakov and Ohbuchi, ["Primitive Processing and Advanced Shading Architecture for Embedded Space"][kazakov] (2011),
  catalogue record only.
- melonDS, [site, FAQ, README, contributing guide][melonds-site], and the readme of its `freebios` folder;
  first post of the [GBATEK addendum thread](https://melonds.kuribo64.net/board/thread.php?id=13).
- [DeSmuME wiki FAQ](https://wiki.desmume.org/index.php?title=Faq).
- [Azahar, README and AI-POLICY.md][azahar]; Panda3DS README.
- devkitPro, organisation profile, and READMEs or licence files of [libctru](https://github.com/devkitPro/libctru),
  [libnds][libnds], [calico](https://github.com/devkitPro/calico), [dswifi](https://github.com/devkitPro/dswifi),
  [maxmod](https://github.com/devkitPro/maxmod), [picasso](https://github.com/devkitPro/picasso),
  [citro3d](https://github.com/devkitPro/citro3d), [3ds-examples](https://github.com/devkitPro/3ds-examples).
- [BlocksDS documentation][blocksds], introduction, licences, credits, contributing, and FAQ pages.
- READMEs of [wwylele/teakra][teakra], [neobrain/nihstro](https://github.com/neobrain/nihstro), `smealum/aemstro`,
  `LumaTeam/Luma3DS`, [PSI-Rockin/Corgi3DS](https://github.com/PSI-Rockin/Corgi3DS).
- READMEs and licence metadata of the test repositories named in the register, among them `mic-/armwrestler`,
  `RockPolish/rockwrestler`, [Jaklyy/polyrastertest](https://github.com/Jaklyy/polyrastertest),
  [archshift/crossbar9][crossbar9].
- [Emulation General Wiki, DS tests page][egw-nds], as a list only.
- [Wikipedia, "Nintendo data leak"][wp-leak] (secondary).

GameCube, Wii, Wii U, Switch, and Switch 2:

- WiiBrew, [Policy][wiibrew], Piracy, About, General disclaimer, Contributing, rights setting.
- WiiUBrew, [Policy][wiiubrew], About, Contributing, Main Page.
- SwitchBrew, [Main Page][switchbrew], About, project page list, rights setting.
- [GC-Forever wiki](https://www.gc-forever.com/wiki/), Main Page and rights setting.
- [Yet Another GameCube Documentation][yagcd], landing page, title page, chapters 1, 19, and 20.
- Dolphin, [FAQ](https://dolphin-emu.org/docs/faq/), [wiki footer](https://wiki.dolphin-emu.org/),
  and `Contributing.md`, `AGENTS.md`, and the index of the `docs` folder in [its repository][dolphin-repo].
- [Cemu, CONTRIBUTING.md][cemu].
- The [GameCube documents page of the YAGCD host][hitmen-gc]; a former IBM address for the PowerPC 7xx manual,
  linked from it, returns "not found".
- [Cemu wiki](https://wiki.cemu.info/), Main Page and About.
- [OpenPOWER Foundation, Power ISA version 3.1C][powerisa], pages 1 to 5.
- [Arm DDI 0487, issue M.d, notice][arm-ddi0487].
- Khronos, [Vulkan specification preamble][vulkan] and OpenGL 4.6 page 2.
- NVIDIA, Jetson related-documentation page, Tegra K1 reference page, and the [manual licence][nvidia-lic].
- Nintendo, [open-source software page][nintendo-oss] and Switch 2 technical specifications.
- READMEs and licence files of `extremscorner/libogc2`, [devkitPro/wut](https://github.com/devkitPro/wut),
  [switchbrew/libnx](https://github.com/switchbrew/libnx), `Atmosphere-NX/Atmosphere`, `fail0verflow/mini`,
  [fail0verflow/hbc][hbc], [cemu-project/Cemu][cemu], [decaf-emu/decaf-emu](https://github.com/decaf-emu/decaf-emu),
  [emu-russia/pureikyubu](https://github.com/emu-russia/pureikyubu), `skyline-emu/skyline`,
  [dekuNukem/Nintendo_Switch_Reverse_Engineering][deku], [reswitched/SwIPC](https://github.com/reswitched/SwIPC),
  [kinnay/NintendoClients](https://github.com/kinnay/NintendoClients), [dolphin-emu/hwtests][dolphin-hwtests],
  `ioncodes/gamecube-wii-tests`, `Geotale/GC-Like-Research`.
- Ryubing, [site][ryubing] and [documentation home](https://docs.ryujinx.app/).
- [GitHub's published takedown notices][ghdmca], directory listing and three notices.
- [Conference talk pages](https://media.ccc.de/), abstracts only.

PlayStation family (the tainted reference was not opened; its addresses are in [R0-01][r001] and the register):

- J. Walker, ["Everything You Have Always Wanted to Know about the Playstation But Were Afraid to Ask"][walker],
  version 1.1 (2000), introduction and bibliography; [listing page][hitmen-psx].
- R. Copetti, [PlayStation][copetti-ps], PlayStation 2, PSP, and PlayStation 3 articles,
  source lists and permissions sections.
- READMEs and licence files of `Lameguy64/PSn00bSDK`, [simias/rustation][rustation], `spicyjpeg/ps1-bare-metal`
  (open, but not cited, because it asks AI agents not to use it),
  [emu-russia/psxrev][psxrev], `pcsx-redux/nugget`, [ps2dev/ps2sdk](https://github.com/ps2dev/ps2sdk),
  [pspdev/pspsdk](https://github.com/pspdev/pspsdk), [pspdev/vfpu-docs][vfpudocs], `uofw/uofw`,
  [uofw/upspd](https://github.com/uofw/upspd), [vitasdk/vita-headers](https://github.com/vitasdk/vita-headers),
  [Vita3K/Vita3K][vita3k], [RPCS3/rpcs3][rpcs3], [ps3dev/PSL1GHT](https://github.com/ps3dev/PSL1GHT),
  [shadps4-emu/shadPS4][shadps4], `obhq/obliteration`,
  [OpenOrbis/OpenOrbis-PS4-Toolchain](https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain);
  README of the DuckStation repository (prose only; closed).
- psx.arthus.net, top-level and three folder indexes only: `https://psx.arthus.net/`
  (closed: it hosts Sony kits and a BIOS folder, so not linked).
- [PSXDEV network, shutdown notice][psxdev].
- [Internet Archive, catalogue metadata][ia-meta] of the Net Yaroze item (documents not opened).
- [Mednafen][mednafen], home page and PlayStation page.
- IDT R30xx Family Software Reference Manual, revision 1.0, title pages, university copy:
  `https://cgi.cse.unsw.edu.au/~cs3231/doc/R3000.pdf` (closed third-party copy, so not linked).
- Toshiba TX79 user's manual, first four pages, on an [archive mirror](https://bitsavers.mirrorservice.org/)
  (the copy is closed; the mirror's root is linked).
- [Hot Chips 11 programme](https://old.hotchips.org/wp-content/uploads/hc_archives/hc11/1_Sun/hc99nav.pdf).
- [Sony's PlayStation 2 Linux community FAQ][ps2faq], third-party copy.
- [Sony, PlayStation 3 Linux documents][ps3linux], index notice.
- Sony, [open-source software pages](https://www.playstation.com/en-us/oss/ps3/) and sibling pages.
- [Ecma International, page and 1996 file for ECMA-130][ecma130].
- [ps2tek][ps2tek], overview.
- GNU licence list, Academic Free License entry, [live page](https://www.gnu.org/licenses/license-list.html).
- [Yet Another PSP Documentation](https://hitmen.c02.at/files/yapspd/), index and chapters 1, 32, 33.
- psdevwiki, main pages, Copyrights, About, and General disclaimer, archived copies dated 2025-11-25 to 2026-11-14,
  from the [Wayback Machine](https://web.archive.org/) copies of [psdevwiki.com](https://www.psdevwiki.com/).
- [Vita SDK](https://vitasdk.org/), site and documentation home.
- [Vita Development Wiki][vitawiki], main page, About, Copyrights, and General disclaimer.
- psxrev, wiki index: `wiki_eng/Readme.md` in [emu-russia/psxrev][psxrev].
- Internet Archive, [catalogue search](https://archive.org/advancedsearch.php) for Net Yaroze items.
- [Amidog's PlayStation wiki](https://psx.amidog.se/), start and download pages.
- READMEs and licence files of the test repositories named in the register,
  among them [JaCzekanski/ps1-tests][ps1tests], [SingleStepTests/r3000](https://github.com/SingleStepTests/r3000),
  [unknownbrackets/ps2autotests](https://github.com/unknownbrackets/ps2autotests), `hrydgard/pspautotests`,
  [RPCS3/ps3autotests](https://github.com/RPCS3/ps3autotests).

Sega, arcade, Xbox, and other systems:

- SMS Power!, home, development index, [documents index][smspower], contact page.
- C. MacDonald, [document index][macdonald]; the [frameset that shows it](http://www.techno-junk.org/).
- [Sega Retro, main page, archived copy of 2026-11-14][segaretro];
  the live site answered one scripted fetch with a bot check, and a later one with the page (research log, 2026-11-20).
- Plutiedev, home and [FAQ][plutiedev].
- [MegaDrive Wiki][mdwiki], main page, About, rights setting.
- [BlastEm, README and licence](https://www.retrodev.com/repos/blastem).
- READMEs and licence files of `ekeeke/Genesis-Plus-GX`, [RogerSanders/Exodus](https://github.com/RogerSanders/Exodus),
  [nukeykt/Nuked-OPN2](https://github.com/nukeykt/Nuked-OPN2), [nukeykt/Nuked-MD](https://github.com/nukeykt/Nuked-MD),
  [Stephane-D/SGDK][sgdk], [Yabause/yabause](https://github.com/Yabause/yabause), [FCare/Kronos][kronos],
  [ymir-emu/Ymir](https://github.com/ymir-emu/Ymir), `srg320/Saturn_MiSTer`, [KallistiOS/KallistiOS][kos],
  `finalburnneo/FBNeo`, [jotego/jtcores](https://github.com/jotego/jtcores), [furrtek/SiliconRE][siliconre],
  [xemu-project/xemu](https://github.com/xemu-project/xemu), [XboxDev/nxdk][nxdk],
  [Free60Project/wiki](https://github.com/Free60Project/wiki), [xenia-project/xenia][xenia], `mist64/c64ref`,
  `trapexit/3do-devkit`, [jeffpar/pcjs](https://github.com/jeffpar/pcjs).
- [Renesas, SH-4][renesas-sh4] and SH-1, SH-2 software manuals, notice pages.
- [Motorola M68000 Family Programmer's Reference Manual][nxp-m68k], pages 1 to 3; NXP, [terms of use][nxp-terms].
  On 2026-11-20 both refused one scripted fetch with HTTP 404, and the manual loaded on a later one (research log).
- [Zilog, Z80 user manual address][zilog], which redirects to a page that refused access.
- KallistiOS, [`doc/LICENSE.md`][kos-lic]; Xenia, [`.github/CONTRIBUTING.md`][xenia-contrib].
- [Intel 64 and IA-32 Architectures Software Developer's Manual][intel-sdm], volume 1, September 2026, notices page.
- [Yabause wiki][yabause-wiki], main page and documentation index.
- antime's Saturn page, document index only: `https://antime.kapsi.fi/sega/docs.html`
  (closed: it hosts Sega's manuals, so not linked).
- [SegaXtreme](https://segaxtreme.net/), resources index and terms.
- M. Comstedt, ["Dreamcast Programming"](https://mc.pp.se/dc/), index pages.
- [dreamcast.wiki](https://dreamcast.wiki/), root page.
- MAME, [legal page][mame-legal], [licence page][mame-lic], "What is MAME", and the introduction of the ROM page.
- [NeoGeo Development Wiki](https://wiki.neogeodev.org/), main page.
- ARCade ARChive, front page: `https://arcarc.xmission.com/` (closed: arcade makers' manuals, so not linked).
- XboxDevWiki, main page,
  [archived copy of 2026-10-27](https://web.archive.org/web/20261027211121/https://xboxdevwiki.net/Main_Page).
- [xemu, required-files page](https://xemu.app/docs/required-files/).
- [Free60](https://free60.org/).
- A. Huang, [MIT AI Memo 2002-008, record page](https://dspace.mit.edu/handle/1721.1/6694);
  [free edition of "Hacking the Xbox"](https://nostarch.com/xboxfree).
- [Hasbro Interactive press release of 14 May 1999, transcription][hasbro].
- [C. Lawson, "Amstrad ROM permissions"][amstrad], newsgroup post of 31 August 1999, archived copy.
- Stella Programmer's Guide transcription, header only: `https://alienbill.com/2600/101/docs/stella.html`
  (closed: no release by Atari is shown, so not linked).
- Amiga developer disc pages, front page: `http://amigadev.elowar.com/`
  (closed: the contents of a commercial developer disc, so not linked).
- [3DO Development Repo](https://3dodev.com/), home and documentation index.
- 6502.org, home page and documents index, live on 2026-11-19 (captures under 2026-11-20 below).
- [MSX Assembly Page](http://map.grauw.nl/) and [MSX Resource Center wiki](https://www.msx.org/wiki/) footers.
- [Sinclair Wiki](https://sinclair.wiki.zxnet.co.uk/) rights setting and [C64-Wiki](https://www.c64-wiki.com/) footer.
- [WSdev wiki](https://ws.nesdev.org/wiki/), footer, read through a summarising fetch, and read raw by [R1-05][r105].
- READMEs and licence files of the test repositories named in the register,
  among them [raxoft/z80test](https://github.com/raxoft/z80test), [agn453/ZEXALL](https://github.com/agn453/ZEXALL),
  [SingleStepTests/m68000](https://github.com/SingleStepTests/m68000),
  [SingleStepTests/8088](https://github.com/SingleStepTests/8088),
  [Klaus2m5/6502_65C02_functional_tests](https://github.com/Klaus2m5/6502_65C02_functional_tests),
  [dirkwhoffmann/vAmigaTS][vamigats].

Cross-system sources:

- Arm, proprietary notices of [DDI 0487][arm-ddi0487] issue M.d, [DDI 0406C.d][arm-ddi0406], [DDI 0301H][arm-ddi0301],
  and [DDI 0602][arm-ddi0602]; the [standard notices page][arm-notices]; the [website terms][arm-terms].
- [Renesas, legal notices][renesas-legal].
- [AMD, guide 48751 revision 3.03](https://www.amd.com/content/dam/amd/en/documents/archived-tech-docs/programmer-references/48751_16h_bkdg.pdf),
  page 2.
- MIPS and Texas Instruments, site terms: [MIPS](https://mips.com/terms/),
  [Texas Instruments](https://www.ti.com/legal/terms-conditions/terms-of-use.html).
- [OpenPOWER Foundation, final draft of the Power ISA licence](https://openpowerfoundation.org/blog/final-draft-of-the-power-isa-eula-released/).
- Ecma International, [text copyright policy][ecma-policy] and the pages for ECMA-119 and ECMA-130.
- [SD Association, simplified specifications page][sdcard].
- [USB Implementers Forum, document library](https://www.usb.org/documents).
- [AACS LA, specifications index](https://aacsla.com/aacs-specifications/).
- [J-Core project, home page](https://j-core.org/).
- R. Copetti, index, about, and [disclaimer](https://www.copetti.org/disclaimer/) pages.
- [Emulation General Wiki](https://emulation.gametechwiki.com/), Main Page, About, Copyrights, General disclaimer,
  rights setting.
- [emudev.org](https://emudev.org/), home page.
- TASVideos, site licence and [site rules](https://tasvideos.org/SiteRules).
- [Stack Exchange, licensing help page][stackex].
- [Wikimedia Foundation, Terms of Use](https://foundation.wikimedia.org/wiki/Policy:Terms_of_Use).
- [media.ccc.de, about page](https://media.ccc.de/about.html).
- [Hackaday, policies page](https://hackaday.com/policies/).
- TCRF and Data Crystal copyright pages, through a summarising fetch only: [TCRF][tcrf], [Data Crystal][datacrystal].
- Refused every request, so not read: [Console5 tech wiki][console5], [ConsoleMods wiki][consolemods],
  [siliconpr0n][siliconpr0n].
  The Vita wiki, refused in the first pass, answered on re-check.
- READMEs of [skylersaleh/SkyEmu][skyemu], [nba-emu/NanoBoyAdvance][nba], [michelhe/rustboyadvance-ng][rbang],
  and [melonDS-emu/melonDS][melonds], on aging cartridges and on GBATEK.
- [MiSTer documentation home](https://mister-devel.github.io/MkDocs_MiSTer/).
- bsnes.org, home page navigation only: `https://bsnes.org/` (closed: its menu offers games, so not linked).
- [bitsavers, home page][bitsavers].
- [Internet Archive, rights help page][ia-rights].
- [Video Game History Foundation, archive help page][vghf].
- [No-Intro][nointro] and [Redump][redump], home pages.
- [SingleStepTests][sst], the organisation's repository list and each README.

Read on 2026-11-20, for the questions the first version left open:

- [Teakra README][teakra-raw], raw: its credits and its testers.
- [README of fail0verflow/hbc][hbc], lines 94 to 103, read through the GitHub API.
- libnds licence file, `libnds_license.txt`,
  read through the GitHub API's licence endpoint for [devkitPro/libnds][libnds].
- PSn00bSDK README, lines 87 to 89, raw, from `Lameguy64/PSn00bSDK`
  (closed, so not linked);
  the verification pass could not re-read it, because the guard blocks calls that name the repository.
- [ps1-tests][ps1tests], README and `common-test.mk` at commit `f727802`, through the GitHub API,
  and a code search for `psxgte` in the repository.
- [psxrev root README][psxrev-readme], through the GitHub API; the guard blocked its wiki index as walled.
- [GNU, "Various Licenses and Comments about Them"][gnu-cap], revision dated 2026/04/22, capture of 2026-11-18;
  the live page timed out twice.
- 6502.org, [home page, capture of 2026-10-16][6502home] and [documents index, capture of 2026-09-19][6502docs], raw;
  the live site answered HTTP 404.
- [Arm DDI 0100I record][arm-ddi0100], with its PDF; pages i to iii extracted with pdftotext, and the copy deleted.
- [Arm DUI 0255 record][arm-rvds] and the records of DUI 0204 and DUI 0348, as JSON.
- devkitPro site, refused with HTTP 403; [capture of 2026-10-16][devkitpro-cap].
- Dolphin blog, refused with HTTP 403;
  [capture of 2026-11-10](https://web.archive.org/web/20261110141123/https://dolphin-emu.org/blog/).
- Sega Retro, live main page, which once answered with a bot check
  (research log); the capture of 2026-11-14 stays the source.
- tcrf.net copyright page, raw: blocked by the guard as walled, and not worked around.
- READMEs of [Vita3K/Vita3K][vita3k], [openmsx/openmsx][openmsx], [stella-emu/stella][stella],
  and [FCare/Kronos][kronos], through the GitHub API's README endpoint, which the guard allowed then,
  searched for "later", "only", and "GPL".
- Web searches for the IBM, Zilog, MIPS, and NEC manuals,
  as listed under ["Processor and chip makers' manuals"][s-makers]; results only (research log).
- [SwitchBrew, "Tegra X1"][sb-tegra], raw wikitext, lines 41 to 43.
- Angrylion fork, GitHub's licence endpoint for `ata4/angrylion-rdp-plus`, which returned HTTP 404.
- [XboxDevWiki, live Main Page][xboxdevwiki], raw.
- psdevwiki main pages, [PS3 capture of 2026-09-10][psdev-cap3] and [PS4 capture of 2026-09-24][psdev-cap4], raw,
  for the titles and paths of their links; the archive's capture index found them.
- [Mednafen home page][mednafen], raw.
- [Wikipedia, "Sega Genesis"][wp-genesis], raw wikitext.
- [README of SciresM/boot9strap][b9s], through the GitHub API, and the author's [talk slides][b9s-talk].
- [NXP, Motorola M68000 manual][nxp-m68k] and NXP's [terms of use][nxp-terms], fetched again to check the address.
- The guard's run time, measured locally as described under ["What the evaluation cannot show"][s-cannot].
- READMEs, sub-folder READMEs, and the latest 100 commit messages of [jsmolka/gba-tests][jsmolka-unsafe],
  [mgba-emu/suite][mgba-suite], [nba-emu/hw-test][nba-vram], [gilyon/snes-tests][gilyon],
  [undisbeliever/snes-test-roms][undisb], [lemmy-64/n64-systemtest][n64st],
  [thelemmy/nemu64-test](https://github.com/thelemmy/nemu64-test),
  [SingleStepTests/65816](https://github.com/SingleStepTests/65816),
  and the readme and main test header of [Klaus2m5/6502_65C02_functional_tests][dormann], through the GitHub API.
- [Stella's site][stella-site] and [manual](https://stella-emu.github.io/docs/index.html), raw.
- The repository's guard issues, [#31][iss31] to [#33][iss33], and its pull request list, through `gh`.
- Arm records of [DDI 0201D][arm-ddi0201], [DDI 0360F][arm-ddi0360], [DDI 0210C][arm-ddi0210],
  and [DDI 0406C.d][arm-ddi0406], as JSON, for their notices and titles.

Project documents:

- [R0-01, clean-room policy][r001].
- [ADR 0001][adr].
- The [source register][reg] and the [guard][guard].
- [Research conventions][conv].

[adr]: ../../adr/0001-restrict-reading-by-licence-tier.md
[adr-kinds]: ../../adr/0001-restrict-reading-by-licence-tier.md#sources-that-are-not-emulators
[adr-closed]: ../../adr/0001-restrict-reading-by-licence-tier.md#closed-tier
[reg]: ../../../.claude/hooks/source-register.txt
[guard]: ../../../.claude/hooks/source-guard.sh
[conv]: ../README.md
[r001]: R0-01-clean-room-policy.md
[r002]: R0-02-legal-baseline.md
[r004]: R0-04-glossary-and-conventions.md
[r101]: R1-01-primer-8-and-16-bit.md
[r102]: R1-02-primer-32-and-64-bit.md
[r104]: R1-04-primer-modern.md
[r105]: R1-05-catalogue-8-and-16-bit.md
[rm0]: R0-03-licence-strategy.md
[rmsurv]: ../../roadmap/research.md#system-family-surveys
[rm2]: ../../roadmap/research.md#phase-2-cross-cutting-engineering
[rm4]: ../../roadmap/research.md#phase-4-technology-stack
[pr16]: https://github.com/jsamuelsen11/rustalgia-emu/pull/16
[pr17]: https://github.com/jsamuelsen11/rustalgia-emu/pull/17
[iss31]: https://github.com/jsamuelsen11/rustalgia-emu/issues/31
[iss32]: https://github.com/jsamuelsen11/rustalgia-emu/issues/32
[iss33]: https://github.com/jsamuelsen11/rustalgia-emu/issues/33
[rm5]: ../../roadmap/research.md#phase-5-hands-on-spikes
[s-gb]: #game-boy-game-boy-color-and-game-boy-advance
[s-ds]: #nintendo-ds-dsi-and-3ds
[s-sega]: #sega-arcade-xbox-and-other-systems
[s-makers]: #processor-and-chip-makers-manuals
[s-tests]: #test-suites-and-test-vectors
[s-cannot]: #what-the-evaluation-cannot-show
[opt5]: #5-maker-documents-that-survive-only-as-third-party-copies
[opt7]: #7-sources-whose-own-authors-name-tainted-or-leaked-material
[opt8]: #8-how-the-playstation-1-primer-gets-its-facts
[opt9]: #9-rules-adr-0001-does-not-yet-state
[arm-ddi0201]: https://documentation-service.arm.com/documentation/ddi0201/d
[arm-ddi0210]: https://documentation-service.arm.com/documentation/ddi0210/c
[arm-ddi0301]: https://documentation-service.arm.com/documentation/ddi0301/h
[arm-ddi0360]: https://documentation-service.arm.com/documentation/ddi0360/f
[arm-ddi0406]: https://documentation-service.arm.com/documentation/ddi0406/cd
[arm-ddi0602]: https://documentation-service.arm.com/documentation/ddi0602/latest
[kos-lic]: https://github.com/KallistiOS/KallistiOS/blob/master/doc/LICENSE.md
[xenia-contrib]: https://github.com/xenia-project/xenia/blob/master/.github/CONTRIBUTING.md
[psxrev-readme]: https://github.com/emu-russia/psxrev/blob/master/Readme.md
[nxp-terms]: https://www.nxp.com/company/about-nxp/terms-of-use:TERMSOFUSE
[jsmolka-unsafe]: https://github.com/jsmolka/gba-tests/blob/master/unsafe/README.md
[nba-vram]: https://github.com/nba-emu/hw-test/blob/master/ppu/vram-mirror/README.md
[mgba-suite]: https://github.com/mgba-emu/suite
[gilyon]: https://github.com/gilyon/snes-tests
[undisb]: https://github.com/undisbeliever/snes-test-roms
[n64st]: https://github.com/lemmy-64/n64-systemtest
[dormann]: https://github.com/Klaus2m5/6502_65C02_functional_tests
[openmsx]: https://github.com/openMSX/openMSX
[stella]: https://github.com/stella-emu/stella
[stella-site]: https://stella-emu.github.io/
[kronos]: https://github.com/FCare/Kronos
[datacrystal]: https://datacrystal.tcrf.net/wiki/Data_Crystal:Copyrights
[console5]: https://console5.com/techwiki/
[consolemods]: https://consolemods.org/wiki/
[siliconpr0n]: https://siliconpr0n.org/
[pandocs-about]: https://gbdev.io/pandocs/About.html
[pandocs-history]: https://gbdev.io/pandocs/History.html
[pandocs-refs]: https://gbdev.io/pandocs/References.html
[gbdev]: https://gbdev.io/
[gbdevai]: https://gbdev.io/aipolicy.html
[awesome-gbadev]: https://github.com/gbadev-org/awesome-gbadev
[gbdevwiki]: https://gbdev.gg8.se/wiki/articles/Main_Page
[gbctr]: https://gekkio.fi/files/gb-docs/gbctr.pdf
[dmgcpu]: https://github.com/furrtek/DMG-CPU-Inside
[dmgschem]: https://github.com/msinger/dmg-schematics
[gbatek]: https://problemkaputt.de/gbatek.htm
[gbatek-about]: https://problemkaputt.de/gbatek-about-this-document.htm
[gbadevchat]: https://gbadev.net/chat.html
[gbadoc]: https://gbadev.net/gbadoc/print.html
[tonc]: https://www.coranac.com/tonc/text/intro.htm
[audioadv]: http://belogic.com/gba/intro.shtml
[copetti-gb]: https://www.copetti.org/writings/consoles/game-boy/
[copetti-ps]: https://www.copetti.org/writings/consoles/playstation/
[ia-meta]: https://archive.org/metadata/
[csp]: https://github.com/c-sp/game-boy-test-roms
[skyemu]: https://github.com/skylersaleh/SkyEmu
[nba]: https://github.com/nba-emu/NanoBoyAdvance
[rbang]: https://github.com/michelhe/rustboyadvance-ng
[melonds]: https://github.com/melonDS-emu/melonDS
[melonds-site]: https://melonds.kuribo64.net/
[nesdev-disc]: https://www.nesdev.org/wiki/Nesdev_wiki:General_disclaimer
[nesdev-about]: https://www.nesdev.org/wiki/Nesdev_wiki:About
[qmt]: https://www.qmtpro.com/~nes/chipimages/
[v6502]: http://www.visual6502.org/
[v6502-repo]: https://github.com/trebonian/visual6502
[snesdev]: https://snes.nesdev.org/wiki/
[sfdw]: https://wiki.superfamicom.org/
[fullsnes]: https://problemkaputt.de/fullsnes.htm
[rhdn-doc]: https://www.romhacking.net/documents/196/
[rhdn-policy]: https://www.romhacking.net/policy/
[near]: https://archive.ares-emu.net/near.sh/
[wdc]: https://www.westerndesigncenter.com/wdc/documentation/w65c816s.pdf
[uspto]: https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/4799635
[n64brew]: https://n64brew.dev/wiki/
[libdragon]: https://github.com/DragonMinded/libdragon
[prdp]: https://github.com/Themaister/parallel-rdp
[6502home]: https://web.archive.org/web/20261016133630/https://6502.org/
[6502docs]: https://web.archive.org/web/20260919203141/https://6502.org/documents/
[wp-leak]: https://en.wikipedia.org/wiki/Nintendo_data_leak
[wp-genesis]: https://en.wikipedia.org/w/index.php?title=Sega_Genesis&action=raw
[dsibrew]: https://dsibrew.org/wiki/DSiBrew:Contributing
[3dbrew]: https://www.3dbrew.org/wiki/3dbrew:Copyrights
[citra-idx]: https://citra.azahar-emu.org/wiki/archive-of-3ds-documentation/
[citra-dev]: https://citra.azahar-emu.org/wiki/developer-information/
[crossref]: https://api.crossref.org/works/10.1145/2018323.2018350
[kazakov]: https://diglib.eg.org/handle/10.2312/14922
[panda-tp]: https://github.com/wheremyfoodat/Panda3DS/tree/master/third_party
[hbc]: https://github.com/fail0verflow/hbc
[nintendo-oss]: https://support.nintendo.com/jp/oss/index.html
[azahar]: https://github.com/azahar-emu/azahar
[libnds]: https://github.com/devkitPro/libnds
[blocksds]: https://blocksds.skylyrac.net/docs/guides/licenses/
[teakra]: https://github.com/wwylele/teakra
[teakra-raw]: https://raw.githubusercontent.com/wwylele/teakra/master/README.md
[crossbar9]: https://github.com/archshift/crossbar9
[egw-nds]: https://emulation.gametechwiki.com/index.php/NDS_Tests
[arm-ddi0100]: https://documentation-service.arm.com/documentation/ddi0100/i
[arm-rvds]: https://documentation-service.arm.com/documentation/dui0255/latest
[arm-ddi0487]: https://documentation-service.arm.com/documentation/ddi0487/latest
[arm-notices]: https://www.arm.com/company/policies/terms-and-conditions/product-documentation-proprietary-notices
[arm-terms]: https://www.arm.com/company/policies/terms-and-conditions
[devkitpro-cap]: https://web.archive.org/web/20261016043121/https://devkitpro.org/
[wiibrew]: https://wiibrew.org/wiki/WiiBrew:Policy
[wiiubrew]: https://wiiubrew.org/wiki/WiiUBrew:Policy
[switchbrew]: https://switchbrew.org/wiki/Main_Page
[sb-tegra]: https://switchbrew.org/w/index.php?title=Tegra_X1&action=raw
[yagcd]: https://hitmen.c02.at/files/yagcd/
[hitmen-gc]: https://hitmen.c02.at/html/gc_docs.html
[dolphin-repo]: https://github.com/dolphin-emu/dolphin
[dolphin-hwtests]: https://github.com/dolphin-emu/hwtests
[cemu]: https://github.com/cemu-project/Cemu
[powerisa]: https://openpower.foundation/specifications/isa/
[vulkan]: https://docs.vulkan.org/spec/latest/chapters/preamble.html
[nvidia-lic]: https://developer.nvidia.com/tegra-rdp-trm-license-details
[deku]: https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
[ghdmca]: https://github.com/github/dmca
[ryubing]: https://ryujinx.app/
[walker]: https://hitmen.c02.at/files/docs/psx/psx.pdf
[hitmen-psx]: https://hitmen.c02.at/html/psx_docs.html
[rustation]: https://github.com/simias/rustation
[psxrev]: https://github.com/emu-russia/psxrev
[ps1tests]: https://github.com/JaCzekanski/ps1-tests
[ps2faq]: https://ps2-linux.tensioncore.com/faq.html
[ps3linux]: https://www.kernel.org/pub/linux/kernel/people/geoff/cell/ps3-linux-docs/
[psdev-cap3]: https://web.archive.org/web/20260910085238/https://www.psdevwiki.com/ps3/Main_Page
[psdev-cap4]: https://web.archive.org/web/20260924184055/https://www.psdevwiki.com/ps4/Main_Page
[ps2tek]: https://psi-rockin.github.io/ps2tek/
[vfpudocs]: https://github.com/pspdev/vfpu-docs
[rpcs3]: https://github.com/RPCS3/rpcs3
[vita3k]: https://github.com/Vita3K/Vita3K
[mednafen]: https://mednafen.github.io/
[shadps4]: https://github.com/shadps4-emu/shadPS4
[psxdev]: https://www.psxdev.net/
[vitawiki]: https://wiki.henkaku.xyz/vita/Main_Page
[ecma130]: https://ecma-international.org/publications-and-standards/standards/ecma-130/
[ecma-policy]: https://ecma-international.org/policies/by-ipr/ecma-text-copyright-policy/
[gnu-cap]: https://web.archive.org/web/20261118023556/https://www.gnu.org/licenses/license-list.html
[smspower]: https://www.smspower.org/Development/Documents
[segaretro]: https://web.archive.org/web/20261114122812/https://segaretro.org/Main_Page
[sgdk]: https://github.com/Stephane-D/SGDK
[macdonald]: http://dreamjam.co.uk/emuviews/docindex.php
[yabause-wiki]: https://wiki.yabause.org/
[plutiedev]: https://plutiedev.com/faq
[mdwiki]: https://md.railgun.works/index.php?title=Main_Page
[kos]: https://github.com/KallistiOS/KallistiOS
[nxdk]: https://github.com/XboxDev/nxdk
[xenia]: https://github.com/xenia-project/xenia
[xboxdevwiki]: https://xboxdevwiki.net/Main_Page
[mame-legal]: https://www.mamedev.org/legal.html
[mame-lic]: https://docs.mamedev.org/license.html
[siliconre]: https://github.com/furrtek/SiliconRE
[renesas-sh4]: https://www.renesas.com/en/document/mas/sh-4-software-manual
[renesas-legal]: https://www.renesas.com/en/legal-notices
[intel-sdm]: https://cdrdv2.intel.com/v1/dl/getContent/671436
[nxp-m68k]: https://www.nxp.com/docs/en/reference-manual/M68000PRM.pdf
[zilog]: https://www.zilog.com/docs/z80/um0080.pdf
[hasbro]: https://mail.atariage.com/Jaguar/archives/HasbroRights.html
[amstrad]: https://web.archive.org/web/20130115052219/http://www.worldofspectrum.org/permits/amstrad-roms.txt
[sdcard]: https://www.sdcard.org/downloads/pls/
[stackex]: https://retrocomputing.stackexchange.com/help/licensing
[ia-rights]: https://help.archive.org/help/rights/
[bitsavers]: https://bitsavers.org/
[vghf]: https://archive.gamehistory.org/help
[tcrf]: https://tcrf.net/The_Cutting_Room_Floor:Copyrights
[nointro]: https://no-intro.org/
[redump]: http://redump.org/
[sst]: https://github.com/SingleStepTests
[vamigats]: https://github.com/dirkwhoffmann/vAmigaTS
[b9s]: https://github.com/SciresM/boot9strap
[b9s-talk]: https://sciresm.github.io/33-and-a-half-c3/
