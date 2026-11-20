---
title: Clean-room policy
roadmap_item: R0-01
status: approved
date: 2026-11-19
---

# Clean-room policy

## Summary

This note asks which sources Rustalgia's researchers and authors may read, and how notes should be taken,
so that later code can be shown to be independent work.
No statute or court opinion found requires a clean room.
It is evidence of independent creation,
and projects apply anything from excluding every exposed contributor to reading other emulators openly.
Three risks are separate and need separate rules: copyright, trade secrets and contracts, and anti-circumvention law.
Two findings matter most to Rustalgia.
One widely used hardware reference says that it derives from confidential material,
a widely used homebrew library is accused of the same by others,
and no source shows how an AI author with unknown training data can be the unexposed side of a wall.
This note is not legal advice.

## Scope

- Question: which sources may be read during research and development, and how should notes be taken?
- Covered: the kinds of source, the law that makes reading matter, what comparable projects do,
  what changes when AI agents read and write, and note-taking practice.
- Left to other items: case law, anti-circumvention, firmware, and keys in depth (`R0-02`); licence strategy (`R0-03`);
  note conventions and the glossary (`R0-04`); the reading list for each system (`R0-05`).
- Researched on 2026-11-17.
  Statutes and project policies are quoted as published that day.
  The Japanese statutes were read in unofficial English translations.
- How claims were checked: each finding names its source, and every source was fetched on 2026-11-17.
  A second, independent pass fetched the sources again and tested each claim and quotation.
  A claim marked "(secondary)" rests on commentary, not on the original text.
  A claim marked "(from memory)" was not confirmed by any fetched page, and one marked "(inference)" is reasoning.
  Statements that nothing was found record a search, not proof of absence.
  No emulator source code, decompilation, or leaked material was opened.
  From emulator projects, only prose policy files, licence files, and websites were read.

## Findings

### Copyright: what is protected and how copying is proved

- United States copyright does not extend to "any idea, procedure, process, system, method of operation"
  (17 U.S.C. § 102(b)).
  TRIPS Article 9(2) and Directive 2009/24/EC Article 1(2) state the same limit for treaty and European Union law.
- Infringement requires "copying of constituent elements of the work that are original" (Feist).
  Copying is most often inferred from access to the work plus substantial similarity (Altai).
- "Independent creation is a complete defense to copyright infringement" (Skidmore, slip opinion at 22).
  In the Ninth Circuit, access plus similarity raises a presumption of copying that the defendant must rebut
  (Three Boys).
- Similarity "so striking" that independent creation is, "as a practical matter,
  precluded" can support an inference of access,
  though the same court still required some evidence that access was reasonably possible (Selle v Gibb).
  Not having read a work is therefore not a complete answer where code matches it for no functional reason (inference).
- Copying infringes "even though subconsciously accomplished" (ABKCO).
  The cases found on this point concern music and, in a case ABKCO cites, a film; none found applies it to software.
- Before comparing two programs, a court sets aside elements that are ideas,
  that "are dictated by efficiency or external factors", or that come from the public domain (Altai).
- Structure can be protected without literal copying
  (Whelan; Altai), and a "translation" is a listed kind of derivative work (17 U.S.C. § 101).
  A port of someone else's code to another language can fall inside that definition
  where it carries over protected expression (inference from the statute and Whelan).
- Whether interface declarations are copyrightable is unresolved in the United States.
  The Federal Circuit said yes (Oracle v Google, 2014), the First Circuit held a menu hierarchy unprotectable (Lotus),
  and the Supreme Court assumed the point and decided on fair use (Google v Oracle).
- Reading is not one of the exclusive rights (17 U.S.C. § 106).
  GPLv3 defines "modify" as copying or adapting "in a fashion requiring copyright permission" (GPLv3 § 0).
  No case was found, either way, on whether reading licensed code and then writing similar code creates an obligation.
- Clean-room practice does not touch patents.
  Infringement has no copying element
  (35 U.S.C. § 271(a)), and patent protection reaches "independent creation" (Kewanee).
  The term is 20 years from filing (35 U.S.C. § 154),
  so on this note's date a utility patent filed before 2006-11-17 has expired unless its term was adjusted or extended
  (calculated from the statute).
- For enhanced patent damages, culpability "is generally measured against the knowledge of the actor at the time of the
  challenged conduct" (Halo).
  Engineers are often told not to read patents for that reason (Sandrik, secondary).

### Reverse engineering and the legal status of a clean room

- No statute or opinion that was read requires a clean room.
  Courts treat separation as evidence on the question of copying.
- In Sega v Accolade, Accolade's engineers disassembled three games, and the opinion describes no separate team.
  By the account of the employees who wrote it,
  the resulting manual "contained only functional descriptions of the interface requirements
  and did not include any of Sega's code".
  The court held disassembly a fair use where it is "the only way to gain access to the ideas and functional elements"
  and there is "a legitimate reason".
  It added that this did not "insulate Accolade from a claim of copyright infringement with respect to its finished
  products".
- In Sony v Connectix, Connectix engineers observed and disassembled the BIOS from a console they had bought
  while developing the emulator.
  The opinion describes no separation and does not say who wrote Connectix's own BIOS.
  The court found fair use, and the product "does not contain any of Sony's copyrighted material".
  The court did not approve a second BIOS copy that an engineer had downloaded: "the downloading infringement,
  if such it was" was left for damages.
- How a copy was obtained can decide the outcome.
  "To invoke the fair use exception, an individual must possess an authorized copy of a literary work",
  and source code obtained from the Copyright Office by a false statement did not qualify (Atari v Nintendo).
- Altai rewrote a tainted program with eight programmers who had not worked on the tainted version,
  with the engineer who copied excluded and his copy of the original locked away,
  working from a description of the services needed, over about six months.
  The court assumed access anyway and compared the code; the rewrite did not infringe, the earlier copied version did,
  and the trade-secret claim survived separately (Altai).
- In NEC v Intel a clean-room version written by an outside engineer was, in a law-review note's words,
  "persuasive evidence of non-infringement", because its similarities showed what function forces.
  The shipped code was written by an engineer who had studied Intel's.
  The full opinion could not be fetched; all of this rests on the 1990 note (secondary).
- A clean room that is not kept counts against its owner.
  An English court found a procedure with codes of conduct, a request channel, restricted source lists,
  and legal oversight had been "eroded over time until there was no effective separation" (IBM v LzLabs, para 874).
  Liability there came from breach of licence and conspiracy, not from copyright.
- Phoenix described its 1984 BIOS clean room to the press:
  one group wrote specifications "without including any examples of actual code",
  a single isolated programmer who had not used the processor family wrote the code,
  and the memos between them formed an "audit trail" (PC Magazine, 1984).
  This is Phoenix's own account and was not tested in court.
- A contract can remove what copyright allows.
  Parties "are free to contractually forego the limited ability to reverse engineer" (Bowers),
  and developers of an open-source game server lost on a click-through licence (Davidson v Jung).
  The rule may differ in other circuits (from memory).
- The interoperability exception to United States anti-circumvention law needs a lawfully obtained copy
  and information "not previously ... readily available" (17 U.S.C. § 1201(f)).
  The current temporary exemptions, dated October 2024, let individuals circumvent only to restore personal,
  local play of a lawfully acquired game whose authentication server has been shut down,
  and to repair a console's optical drive.
  Preserving other games, and circumventing console system software, is exempt only for eligible libraries, archives,
  and museums (37 C.F.R. § 201.40(b)(15) and (b)(19)).
  `R0-02` covers this in depth.

### Outside the United States

- In the European Union a lawful user may "observe, study or test the functioning of the program" while running it
  (Directive 2009/24/EC Article 5(3)), and contract terms to the contrary are "null and void" (Article 8).
  The United Kingdom, Germany, and Australia have matching rules
  (CDPA sections 50B to 50C, which include the right to observe, study, and test,
  with contrary terms void under section 296A; UrhG sections 69d and 69g; Copyright Act 1968 sections 47B and 47H).
- Decompilation is allowed only where "indispensable" for the interoperability of an independently created program,
  by a lawful user, for information not "readily available" (Article 6(1)).
  The information may not be "given to others, except when necessary",
  nor used for a program "substantially similar in its expression" (Article 6(2)).
- Functionality, programming languages, and data file formats are not protected expression (SAS v WPL, para 39).
  The court relied on the developer having had no access to source code
  (paras 44 and 61),
  and said that building similar elements "with the aid of" obtained code could be partial reproduction (para 43).
- The same developer infringed copyright in the original's manuals when writing its own manual
  (SAS v WPL, English High Court 2013, para 5),
  although its evidence was that its policy was not to copy them directly
  (SAS v WPL, English High Court 2010, para 139).
  Documentation is a separate risk from code.
- Competitors are free, "once they establish through independent analysis which ideas,
  rules or principles are being used, to create their own implementation" (Sony v Datel, para 48).
  No ruling on emulation or on Article 6 from 2025 or 2026 was found.
- "Merely making a program which will emulate another but which in no way involves copying the program code
  or any of the program's graphics is legitimate" (Nova v Mazooma, para 52, England and Wales).
- Japan's Copyright Act excludes "programming language, coding conventions, or algorithms" from protection
  (Article 10(3)) and names no reverse-engineering exception (translation current to Act No. 52 of 2021).
  The Agency for Cultural Affairs says analysis of programs falls under Article 30-4,
  suggests keeping written reports of the analysis as evidence of purpose, and warns about contract terms
  (2019 guidance, Q12, non-binding).
- Japan's Supreme Court has held that a work made with no access to an earlier one is not a copy even if identical
  (judgment of 7 September 1978).
- Canada's exception applies "even if the other computer program incorporates the information and is then sold,
  rented or otherwise distributed" (Copyright Act section 30.61(2)).
  The European Union text has no such clause.
- Whether an emulator counts as "interoperability" under Article 6,
  and whether publishing notes drawn from decompilation is "necessary", has not been ruled on in any source read.

### Trade secrets, contracts, and leaked material

- Trade-secret law permits reverse engineering.
  "Improper means" in United States law "does not include reverse engineering, independent derivation,
  or any other lawful means of acquisition" (18 U.S.C. § 1839(6)).
  European Union law treats "observation, study,
  disassembly or testing" the same way for a product made available to the public,
  or lawfully held by someone "free from any legally valid duty to limit the acquisition of the trade secret"
  (Directive (EU) 2016/943 Article 3(1)(b)).
- The same laws reach people who receive a secret second-hand.
  Acquiring one while knowing, or having reason to know, that it "was acquired by improper means" is misappropriation
  (18 U.S.C. § 1839(5)(A)); use is not required.
  The European Union standard is "knew or ought, under the circumstances, to have known"
  (Article 4(4)), and Japan's is knowledge or gross negligence (Unfair Competition Prevention Act Article 2(1)(v)).
- Publication does not always end secrecy, but wide publication can.
  "Publication on the Internet does not necessarily destroy the secret if the publication is sufficiently obscure
  or transient or otherwise limited",
  and the court reversed an injunction because widely distributed material "may have lost its trade secret status"
  (DVD CCA v Bunner, California Court of Appeal 2004).
  That ruling is a preliminary-injunction decision of an intermediate court.
- Copyright does not depend on secrecy,
  so loss of trade-secret status would not by itself end copyright in a leaked work
  (inference; no case read states this).
  Unpublished status is "a key, though not necessarily determinative, factor" against fair use,
  and "fair use presupposes 'good faith'" (Harper & Row); see also Atari v Nintendo above.
- The one prosecution read about, after a breach of Nintendo's servers, was of the intruder (The Record, secondary).
  No reported suit against an emulator project for reading leaked source was found.
  That is an observation about what was found, not evidence of safety.
- Disputes about keys have run on anti-circumvention law.
  The yuzu case ended in a consent judgment for $2,400,000 with agreed findings; its complaint pleads circumvention,
  keys, and pirated copies, and does not mention leaked development kits (Nintendo v Tropic Haze).
- Confidentiality duties outlive a developer licence.
  A PlayStation developer agreement filed with the Securities and Exchange Commission keeps its materials confidential
  for as long as Sony maintains them so, and that section is among those that survive termination
  (GDPA 2017, §§ 20.1 and 25.11).
  No public copy of Nintendo's developer non-disclosure agreement was found.
- No source gives a method for telling whether a document descends from a leak.

### Policies of reimplementation projects

- Wine bars "anyone who has seen Microsoft Windows source code (stolen, under an NDA, disassembled, or otherwise)".
  It tells contributors to learn behaviour by writing tests, forbids disassembly and reading ReactOS code,
  and says "Don't use an LLM tool to generate code" because nothing shows the training material respects its guidelines
  (Wine Developer FAQ; Clean Room Guidelines).
- ReactOS requires a sworn statement that the contributor has "not used nor seen" Windows source,
  naming the leaked Windows 2000 code (ReactOS `CONTRIBUTING.md`).
  In 2006 it announced an audit of its whole tree
  and barred four developers from the modules whose leaked source they had seen (ReactOS 2006).
  Its current guideline defers to the GNU rule, which is looser (ReactOS guideline).
- Asahi Linux says a clean room "is not a legal requirement" and does not "absolutely guarantee" a clean result,
  but is "a fairly strong legal defense".
  It ranks methods from hardware probing, to tracing the vendor system, to disassembly.
  A contributor who disassembles may then only write documentation for that area.
  It allows only material "explicitly made available to the public at large" (Asahi copyright policy).
- Asahi treats other open-source code as a reference only: register names may inspire,
  but contributors must not "reimplement identical code flows or algorithms",
  and code that others reverse engineered may not be incorporated even under a compatible licence
  (Asahi copyright policy).
- Asahi broadly forbids generative AI because such systems "are likely to violate the clean room requirements
  and taint the resulting code", a risk "amplified with 'agentic' approaches" (Asahi LLM policy).
- Samba learned its protocols by watching network traffic, probing, and comparing its server with the real one
  (Tridgell 2003).
  Nouveau compares hardware state before and after an action and does not disassemble the vendor driver (Nouveau FAQ).
- The GNU standards say "Don't in any circumstances refer to Unix source code",
  and that someone with "a vague recollection" should "organize the imitation internally along different lines"
  (GNU Coding Standards § 2.1).
- The Developer Certificate of Origin certifies the right to submit a contribution
  and says nothing about what its author read (DCO 1.1).
  The Linux kernel adds: "AI agents MUST NOT add Signed-off-by tags.
  Only humans can legally certify" it (kernel, AI coding assistants).
- Exposure rules have been lifted when the original was relicensed.
  FreeDOS barred people who had viewed Microsoft's 2014 source release and dropped the bar
  when the code was reissued under the MIT licence in 2018 (Hall 2018).
- Every policy read relies on the contributor's own account of what they have seen.
  ReactOS added an audit, and Asahi adds bans and a real-name rule for some contributors.

### Policies of emulator and decompilation projects

- Most emulator projects reviewed state no rule on sources or leaks in their README, contributing guide, or FAQ.
  None of the README or contributing files read for the 30 roadmap emulators uses the term "clean room"
  or a Developer Certificate of Origin.
- Dolphin asks anyone who knows confidential information,
  "either because you signed a non-disclosure agreement or because you looked at leaked materials",
  not to contribute code "at all".
  It also forbids using a language model for changes "related to the behavior of the emulated console",
  because "we have to assume that they contain leaked Nintendo information" (Dolphin `Contributing.md`).
- Cemu asks that new contributors' code be written by a human,
  and says "There is evidence that LLMs have been trained on leaked proprietary SDKs
  and we cannot verify the origin of the knowledge" (Cemu `CONTRIBUTING.md`).
  It cites none.
- Xenia lists the sources it permits, bans Microsoft's development kit as a source,
  and asks contributors to "leave comments describing how the information included in it was obtained"
  (Xenia `CONTRIBUTING.md`).
- Several projects say that they read other emulators.
  Panda3DS used Citra "as a reference, with some code snippets inspired or adapted from it",
  and gopher64 says portions "have been adapted from mupen64plus and/or ares" (project READMEs).
  MAME says the proper use of its source is "to examine it, using it to understand how the games worked,
  and then write your own emulation code" (MAME legal page).
- Emulator projects disagree about AI. mGBA, BizHawk, and SkyEmu refuse AI-generated code;
  MAME requires disclosure of the model;
  RPCS3 says "Use of AI tools for research and reverse engineering purposes is permitted" (project contributing guides).
- The Majora's Mask decompilation README bars from it
  and its sister project anyone who has "accessed leaked source code at any point in time" (ZeldaRET README).
  None of about 15 other decompilation READMEs sampled states a legal basis.
  The one lawsuit found against such a project ended
  when the claims against its four named developers were dismissed with prejudice by stipulation;
  no ruling on the merits was found (Take-Two v Papenhoff).

### Source categories and their provenance

| Category | Licence situation | Provenance stated? | Risk the sources name |
|---|---|---|---|
| Maker's public material: patents, filings, datasheets | Published; terms vary | Yes | Arm manuals restrict reuse |
| Hardware research: decapping, traces, photos | Varies, often unstated | Where method is published | None named |
| Test programs and test vectors | Mostly MIT; some have no licence | Partly | Some results come from emulators |
| Community hardware documentation | From CC0 to none | Rarely | One says it copies confidential material |
| Academic papers and conference talks | Varies by item | Yes | Some describe key extraction |
| Emulator documentation, blogs, and issue trackers | Prose licence often unstated | Named author | Can embed code |
| Behaviour observed by running hardware or software | Not applicable | Yes, if logged | Needs lawful copies |
| Emulator source code | Permissive to non-free | Licence yes; origin of facts no | Concedes access |
| Decompilations and firmware reimplementations | Often no licence | Method stated | Legal status untested |
| Homebrew development kits | Permissive or copyleft | Rarely | Disputed origin |
| Forums, chat, and video | Platform terms | Rarely | Unmonitored submissions |
| Confidential or leaked kits, manuals, and source | None | Origin is the leak | Trade secret; copyright |
| AI model memory and output | Unclear | No | No source can be named |

- The table summarises the findings below.
  Its rows for hardware research, academic work, emulator documentation,
  and forums rest on a survey of examples that the verification pass did not re-check; `R0-05` examines them.
- Licences of community references range from CC0
  (Pan Docs) through a bare copyright notice with no grant (GBATEK) to nothing stated (3dbrew, WiiBrew, SwitchBrew).
  Pan Docs' history pages do not say how its facts were first obtained (Pan Docs, History).
- The maintainers of the community PlayStation reference say that "it isn't a clean room reverse engineering project",
  that "a good chunk of the original document has been either directly copy/pasted from the confidential code
  and documentation from Sony, or summarized and rephrased",
  and that "any work derived from it shouldn't be considered clean" (psx-spx home page).
  The document it descends from carries the line "This hardware reference is reportedly based on confidential documents
  and source code.
  If anybody knows of such leaked information ... please let me know!", which reads as its author reporting the claim,
  not conceding it (Nocash PSX specifications).
  The two accounts conflict.
- Three community wikis checked state a rule against leaked or confidential material.
  3dbrew bars information obtained under a non-disclosure agreement,
  WiiBrew removes "leaked information such as Nintendo's private SDK", and WiiUBrew forbids leaked information
  (3dbrew Copyrights; WiiBrew Policy; WiiUBrew Policy).
  NESdev, SNESdev, N64brew, DSiBrew, and SwitchBrew state none on the pages read.
- Test suites do not always record hardware.
  One suite's expected images are "screenshots from my Game Boy emulator (which I believe to be correct)"
  (Mealybug README),
  another has an "emulator-only" class
  (Mooneye README),
  and a widely used set of processor test vectors is generated by an emulator implementation (SingleStepTests README).
- Several test collections show no licence file where they are commonly obtained, including mirrors of blargg's tests
  (GitHub licence metadata).
- Official documents that are public are not always free to reuse.
  The known-issues document for a current Arm manual forbids reproduction without Arm's written permission
  and makes access conditional on not using it to assess infringement of third-party patents (Arm notice, 2025).
  The older manuals differ.
  The ARMv5 Architecture Reference Manual grants no right to use it for developing processor cores "or models thereof"
  that are compatible with the architecture,
  and the ARM7TDMI manual forbids adapting or reproducing it without written permission;
  neither has the patent condition (Arm DDI 0100I; Arm DDI 0210C).
- A homebrew library can carry disputed origin.
  The authors of the Homebrew Channel state that large portions of libogc "were stolen directly from the Nintendo SDK
  (decompiled and cleaned up)"
  (fail0verflow README),
  and the RTEMS project alleges "a systematic effort to copy source code from RTEMS" (RTEMS 2025).
  The library's licence file now says its threading code was "inspired by and derived from code written
  for the RTEMS project" (libogc `LICENSE`).
  On the Nintendo allegation, its maintainer is reported as saying "There was no reading of source code
  or tools to turn assembly into C" (Hackaday 2025, secondary; the maintainer's own posts were not read).
- Community sites can host a maker's documents next to their own. jgenesis lists such "official documentation" among its
  sources, and its README does not say how the documents became public (jgenesis README).
- Quoting a source into a note copies it (inference).
  Notes that adapt CC BY-SA 4.0 text may be licensed under GPLv3, but no such compatibility is declared for BY-SA 3.0
  (Creative Commons, compatible licences).

### Licences of the emulators on the roadmap

Read from each repository's licence file and README on 2026-11-17.
`R0-03` covers what the licences mean for reuse.

- Permissive: SameBoy, SkyEmu, Play!, ares, rustboyadvance-ng, TetaNES, MartyPC, and BizHawk's own code.
  SameBoy adds a condition on app-store distribution of its iOS code.
  Provenance uses a BSD-style licence with a clause on commercial use of its name.
- MPL-2.0: mGBA.
- GPL-3.0: melonDS, Azahar, Panda3DS, PCSX2, bsnes, Mesen, jgenesis, RetroArch, dust, gopher64. melonDS, bsnes,
  and Mesen state "or any later version".
  The Mesen2 repository is archived and points to a community fork under the same licence.
- GPL-2.0 or later: PPSSPP, Dolphin, and MAME by its documentation.
  MAME's `COPYING` file says "version 2" with no "or later".
- GPL-2.0, with "only" or "or later" not determined from the files read: DeSmuME, PCSX-Redux, Flycast.
- AGPL-3.0: Delta.
- Not free software: DuckStation, under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 licence,
  and Snes9x, under its own non-commercial licence.
- No licence shown upstream: Gambatte, whose README now reads "This project has been taken private."
- The GNU licence list says GPLv2 alone "is, by itself,
  not compatible with GPLv3" and that a non-free licence "is automatically incompatible with the GNU GPL"
  (GNU licence list).
- No licence text read defines reading.
  The Creative Commons no-derivatives licence restricts sharing "Adapted Material",
  meaning material modified "in a manner requiring permission under the Copyright and Similar Rights"
  (Creative Commons legal code, § 1(a)).
- GitHub's licence metadata is missing or reads `NOASSERTION` for 13 of the 30 emulators,
  so it cannot stand in for reading the licence file (GitHub API).

### When AI agents read and write

- Code models reproduce training data.
  One study found that a model "memorizes and produces source code verbatim", including "code with strict licenses"
  (Yang et al. 2024).
  Another found 0.88% to 2.01% of output "strikingly similar to existing open-source implementations" (Xu et al. 2025).
  Neither measured emulator code.
- No ruling was found on whether a model's training counts as access, or on an AI clean room.
  The Ninth Circuit expressed "no view on whether that similarity would allow plaintiffs to assert a claim
  for copyright infringement" (Doe v GitHub, 2026).
  One law-journal article calls presence in the training set "powerful evidence of access"
  (Lee, Cooper and Grimmelmann, secondary).
- An instruction does not make a wall.
  In late February 2026 a maintainer rewrote a library with an AI agent
  and released it in March under the MIT licence in place of the LGPL.
  He started from an empty repository and told the agent not to use the old code.
  His audit of the logs found that "despite my instructions, its subagents read old source code in three sessions"
  (Blanchard 2026).
  He maintains that the result is not a derivative work,
  and says the reads went through a connected tool he had not restricted.
  The Software Freedom Conservancy advised people not to rely on the relicensing
  and said "There is no settled case law on the big questions" (Kuhn 2026).
- The agent tool used for this project documents the same limit.
  Instruction files are "context, not enforced configuration",
  and a fetch rule alone "doesn't prevent network access" while shell commands are allowed.
  A hook that runs before each tool call can block it.
  Subagents start with a fresh context unless forked, and return a summary;
  the documentation describes no filter on its content.
  Session transcripts are deleted after 30 days by default (Claude Code documentation).
- Authorship of AI-written code is unsettled.
  "Copyright does not extend to purely AI-generated material", and "prompts do not alone provide sufficient control"
  (United States Copyright Office 2025).
  The report does not analyse source code.
  A copyleft licence depends on there being copyright to license (inference); `R0-03` takes this up.
- Local comparison tools need a copy of the reference code (JPlag; copydetect).
  Hosted snippet-matching services compare against an index the project never holds and return a match report
  (GitHub code referencing; SCANOSS).
  Whether either counts as contact with the code is not addressed in any source read.

### Note-taking and record-keeping

- No source gives a bright line for what a specification may contain.
  Accolade's manual held descriptions and a 20 to 25 byte header that the court thought "probably unprotected"
  (Sega v Accolade, note 7).
  Asahi allows register names but not copied blocks of definitions; Wine forbids tests that print internal tables;
  the ReactOS audit page lists "undocumented magic numbers" as a warning sign
  (project policies; ReactOS audit page, archived copy).
  No source read addresses pseudo-code.
- Disassembly "is wholesale copying" (Sega v Accolade).
  It follows that listings kept in a public repository would be distributed copies,
  not the intermediate copies Sega considered (inference).
- A method may be described "in their own words" by others (Lotus v Borland).
- Records made at the time are what later proves independence.
  By its own post-trial brief, NEC's record held "every single piece of paper" its clean engineer saw
  (Harvard note 1990, secondary).
  ReactOS announced an audit of its whole tree in 2006 (ReactOS 2006).
- Tests can be the record.
  Wine asks that each finding about behaviour arrive as a test added to its suite (Wine Clean Room Guidelines).
- Xenia's per-claim provenance comments are the closest practice found to this repository's rule
  that every claim says how it was checked (Xenia `CONTRIBUTING.md`).
- Exposure is declared in different ways: publicly on a mailing list (Wine), by sworn statement (ReactOS),
  or as a condition the project says it must confirm (GNU Classpath).
  No project was found that keeps a standing public register.
- Rules that delay writing after reading, or forbid taking notes away, were found only in a university policy
  (Yale CPSC 101).
  They leave no record by design.
- Projects that use the Developer Certificate of Origin have contributors acknowledge
  that the record of a contribution "is maintained indefinitely and may be redistributed" (DCO 1.1, clause (d)).
  That forks and history keep a withdrawn note available is an inference.

## Options and trade-offs

The options answer four separate questions and can be combined.
Options 1 to 4 concern which sources may be read.
Options 5 to 7 concern how notes are taken.
Options 8 and 9 concern AI agents, and option 10 concerns people.

### 1. Public documents and observation only

- **What:** read only material published by its owner or produced by lawful observation and testing;
  open no implementation code, decompilation, or document of confidential origin.
- **Costs:** slower and less complete; needs a way to classify community references whose origin is unstated,
  and would exclude at least one standard PlayStation reference by its own description.
- **Gains:** matches the facts on which courts found no infringement in SAS and Nova;
  no access to concede for any particular emulator.
- **Used by:** Wine, Samba, Nouveau, and Asahi for its preferred methods.

### 2. Read source code only where the licence would allow reuse

- **What:** permit reading of emulators whose licences are compatible with GPL-3.0, treat the rest as closed,
  and cite what was learned.
- **Costs:** concedes access to each work read; licences change and metadata is unreliable;
  open code can itself rest on methods or sources the project would not accept.
- **Gains:** a clear test; if expression does carry over, the licence may permit it with attribution.
- **Used by:** Wine and Mono for compatibly licensed Microsoft code; FreeDOS after 2018; Asahi, with the caveat above;
  Panda3DS and gopher64, which say they adapted code from other emulators.

### 3. Read anything published, write independently

- **What:** allow reading of any publicly available source code
  and require the implementation to be organised differently, with no source open while writing.
- **Costs:** concedes access to everything read; relies on discipline;
  subconscious copying and structural similarity remain infringing;
  non-free licences such as DuckStation's and Snes9x's give no fallback.
- **Gains:** access to the widest body of knowledge; the practice MAME describes for its own source.
- **Used by:** jgenesis and TetaNES, which name other emulators as references;
  the GNU standards tolerate only a vague recollection and forbid referring to the source.

### 4. Separate readers from writers

- **What:** whoever reads a restricted source writes only a functional description;
  someone who has not seen the source implements from it.
  With agents, this is a reader session and a writer session with separate contexts.
- **Costs:** two parties for each area; the description can carry expression across;
  a wall that erodes counts against its owner; it does not address what a model already holds,
  or an overseer who sees both sides.
- **Gains:** evidence that courts have credited, as in NEC and Altai; a record made as the work happens.
- **Used by:** Phoenix; Compaq, by its co-founder's account
  (Canion interview);
  Altai's rewrite; Asahi for contributors who disassemble; described for AI agents by Marks & Clerk (secondary).

### 5. Functional notes with a source for every claim

- **What:** notes hold behaviour, formats, and values in the note-taker's own words, with no code or listings,
  and each claim names its source, the date read, and how it was checked.
- **Costs:** writing effort; no agreed limit on constants, tables, or pseudo-code;
  quoted text raises quotation and licence questions.
- **Gains:** every claim can be re-checked and its route audited; already this repository's rule for research notes.
- **Used by:** Accolade's manual; Xenia's provenance comments.

### 6. Tests as the record

- **What:** each finding about behaviour is captured as a reproducible test against hardware
  or freely licensed test software.
- **Costs:** needs lawful access to hardware or software; some published expected results come from emulators,
  not hardware.
- **Gains:** the evidence of origin is the test, and it doubles as a regression suite.
- **Used by:** Wine, Mono, and Samba.

### 7. Session-level provenance records

- **What:** keep a log of every address fetched and every search made,
  and retain session transcripts alongside the notes.
- **Costs:** transcripts hold the full text of whatever was read; default retention is 30 days;
  a log cannot show what came from model memory, and the same record proves any access that did occur.
- **Gains:** the record that exposed the leaks in the chardet rewrite; lets a reviewer audit what an agent opened.
- **Used by:** the chardet maintainer after the fact; recommended by Marks & Clerk (secondary);
  NEC's log is the human equivalent.

### 8. Enforce source limits in the agent tooling

- **What:** express the chosen source rule as permission rules, blocking hooks, and restricted tool lists,
  so that an agent cannot open a forbidden source, in place of an instruction asking it not to.
- **Costs:** setup and upkeep; fetch rules do not cover shell commands unless those are restricted too;
  search results and summaries can still carry code, and connected tool servers are a further route.
- **Gains:** enforced by the tool, not by the model; addresses the route by which the chardet wall failed,
  if every tool that can reach the source is covered.
- **Used by:** documented for Claude Code;
  no project was found that publishes such a configuration for clean-room purposes.

### 9. Limit or check what AI writes

- **What:** one of three positions seen: no AI-written code; AI barred from code that models the emulated system;
  or AI allowed with disclosure, a responsible human, and similarity checks on the output.
- **Costs:** the first two conflict with a project written mostly by agents;
  local similarity tools need the reference code, and translation between languages defeats token matching
  (JPlag; copydetect; Blanchard 2026).
- **Gains:** addresses the memory problem that options 4 and 8 leave open; matches what several peer projects accept.
- **Used by:** Wine, Asahi, and mGBA (none); Cemu (none from new contributors); Dolphin
  (not for console behaviour); MAME, RPCS3, and Mesa (disclosure).

### 10. Ask contributors what they have seen

- **What:** ask contributors to declare exposure to leaked or confidential material and to past agreements,
  or ask exposed people not to contribute, entirely or in the affected area.
- **Costs:** rests on self-declaration; turns people away; no source defines exposure for an AI author.
- **Gains:** addresses trade-secret and contract risk, which separating readers from writers does not.
- **Used by:** Dolphin and ZeldaRET (exposed people asked not to contribute); Wine and ReactOS (declaration);
  ReactOS in 2006 and GNU Classpath (by area).

## Implications for Rustalgia

- The research cannot choose among options 1 to 4, and the emulator studies
  (`R1-30` to `R1-67`) cannot start until one is chosen.
  This feeds an ADR on permitted sources.
  The remaining phase 0 items and the hardware primers need no emulator source under any option.
- Community references need a provenance class before they are relied on.
  The psx-spx statement makes each hub's licence, stated origin,
  and rule on confidential material facts for `R0-05` to record.
  This feeds a requirement on how sources are admitted.
- Confidential and leaked material is excluded under every option, as the roadmap already states.
  The findings show two things the rule lacks: a test that can be applied,
  of which Asahi's "explicitly made available to the public at large" is one example,
  and a procedure for a source later found to be tainted.
- Agents write most of this repository, and no source shows how a model can be the unexposed side of a wall.
  Options 7, 8, and 9 feed an ADR on AI provenance controls, and the authorship question feeds `R0-03`.
  The published policies of Wine, Asahi, and Dolphin exclude code produced this way;
  that bears on any plan to exchange code with them.
- The existing rule that every claim says how it was checked is option 5.
  `R0-04` can extend it to cover quoting, constants, and pseudo-code, where no source gives a line.
- Patents, contributor agreements, and the laws
  that reach downstream recipients of secrets are not addressed by separating readers from writers.
  `R0-02` records them as risks.

## Open questions

- Which of options 1 to 4 governs the emulator studies?
  A decision by the owner, recorded as an ADR.
- How can a reader tell whether a community document descends from confidential material?
  `R0-05` can record what each hub says; no method was found.
- Does a model's training on public emulator source count as access,
  and can agent-written code be shown to be independent?
  No ruling was found; `R0-02` and `R0-06` record the risk.
- Is agent-written code protected by copyright, so that GPL-3.0 can bind it?
  `R0-03`.
- May notes derived from decompilation be published under European Union law,
  and is an emulator "interoperability" under Article 6?
  `R0-02`.
- How much of a constant, table, or algorithm description may a note hold?
  `R0-04` can set a convention.
- What do the notices on processor manuals from other makers permit,
  and what do Arm's older notices mean for an emulator?
  `R0-05`.
- Which roadmap emulators under GPL-2.0 are "only" and which "or later"?
  The family surveys, without opening code if option 1 is chosen.
- What did the court in NEC v Intel hold, in its own words?
  The full opinion (10 U.S.P.Q.2d 1177) could not be fetched; a law library would have it.

## Sources

Every source below was read on 2026-11-17.

Statutes, treaties, and regulations:

- 17 U.S.C. §§ 101, 102, 106, 107, 1201: `https://www.law.cornell.edu/uscode/text/17/102` and sibling pages.
- 18 U.S.C. § 1839: `https://www.law.cornell.edu/uscode/text/18/1839`.
- 35 U.S.C. §§ 154, 271, 284: `https://www.law.cornell.edu/uscode/text/35/271` and sibling pages.
- 37 C.F.R. § 201.40: `https://www.law.cornell.edu/cfr/text/37/201.40`.
- Directive 2009/24/EC: `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32009L0024`.
- Directive (EU) 2016/943: `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32016L0943`.
- Copyright, Designs and Patents Act 1988, sections 50B to 50C and 296A:
  `https://www.legislation.gov.uk/ukpga/1988/48/section/50B` and sibling pages.
- German Copyright Act (UrhG), English translation:
  `https://www.gesetze-im-internet.de/englisch_urhg/englisch_urhg.html`.
- Australia, Copyright Act 1968: `https://www.legislation.gov.au/C1968A00063/latest/text`.
- Canada, Copyright Act section 30.61: `https://laws-lois.justice.gc.ca/eng/acts/C-42/section-30.61.html`.
- Japan, Copyright Act, unofficial translation: `https://www.japaneselawtranslation.go.jp/en/laws/view/4207`.
- Japan, Unfair Competition Prevention Act, tentative translation:
  `https://www.japaneselawtranslation.go.jp/en/laws/view/4709`.
- Japan, Agency for Cultural Affairs, guidance on Articles 30-4, 47-4, 47-5
  (24 October 2019, in Japanese):
  `https://www.bunka.go.jp/seisaku/chosakuken/hokaisei/h30_hokaisei/pdf/r1406693_17.pdf`.
- TRIPS Agreement, Article 9: `https://www.wto.org/english/docs_e/legal_e/27-trips_04_e.htm`.

Court decisions and filings:

- Feist v Rural Telephone, 499 U.S.
  340 (1991): `https://www.law.cornell.edu/supremecourt/text/499/340`.
- Kewanee Oil v Bicron, 416 U.S.
  470 (1974): `https://www.law.cornell.edu/supremecourt/text/416/470`.
- Harper & Row v Nation Enterprises, 471 U.S.
  539 (1985): `https://www.law.cornell.edu/supremecourt/text/471/539`.
- Halo Electronics v Pulse Electronics, 579 U.S.
  93 (2016): `https://www.law.cornell.edu/supremecourt/text/14-1513`.
- Google v Oracle America, 593 U.S.
  1 (2021): `https://www.law.cornell.edu/supremecourt/text/18-956`.
- Oracle America v Google, 750 F.3d 1339
  (Fed. Cir. 2014): `https://www.cafc.uscourts.gov/opinions-orders/13-1021.opinion.5-7-2014.1.pdf`.
- Whelan v Jaslow, 797 F.2d 1222 (3d Cir. 1986):
  `https://law.resource.org/pub/us/case/reporter/F2/797/797.F2d.1222.85-1358.html`.
- ABKCO Music v Harrisongs Music, 722 F.2d 988
  (2d Cir. 1983): `https://law.resource.org/pub/us/case/reporter/F2/722/722.F2d.988.82-7461.82-7421.505.600.html`.
- Selle v Gibb, 741 F.2d 896 (7th Cir. 1984):
  `https://law.resource.org/pub/us/case/reporter/F2/741/741.F2d.896.83-2545.83-2484.html`.
- Atari Games v Nintendo of America, 975 F.2d 832
  (Fed. Cir. 1992): `https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html`.
- Sega Enterprises v Accolade, 977 F.2d 1510
  (9th Cir. 1992): `https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html`.
- Computer Associates v Altai, 982 F.2d 693
  (2d Cir. 1992): `https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html`.
- Lotus Development v Borland, 49 F.3d 807
  (1st Cir. 1995): `https://law.resource.org/pub/us/case/reporter/F3/049/49.F3d.807.93-2214.html`.
- Sony Computer Entertainment v Connectix, 203 F.3d 596
  (9th Cir. 2000): `https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html`.
- Three Boys Music v Bolton, 212 F.3d 477
  (9th Cir. 2000): `https://law.resource.org/pub/us/case/reporter/F3/212/212.F3d.477.97-55154.97-55150.html`.
- Bowers v Baystate Technologies, 320 F.3d 1317
  (Fed. Cir. 2003): `https://law.resource.org/pub/us/case/reporter/F3/320/320.F3d.1317.01-1109.01-1108.html`.
- Davidson & Associates v Jung, 422 F.3d 630
  (8th Cir. 2005): `https://law.resource.org/pub/us/case/reporter/F3/422/422.F3d.630.04-3654.html`.
- Skidmore v Led Zeppelin, 952 F.3d 1051
  (9th Cir. 2020): `https://cdn.ca9.uscourts.gov/datastore/opinions/2020/03/09/16-56057.pdf`.
- Doe v GitHub, No. 24-7700 (9th Cir. 16 September 2026):
  `https://cdn.ca9.uscourts.gov/datastore/opinions/2026/09/16/24-7700.pdf`.
- DVD Copy Control Association v Bunner, No. H021153
  (Cal. Ct. App. 27 February 2004): `https://caselaw.findlaw.com/ca-court-of-appeal/1445547.html`.
- Nintendo of America v Tropic Haze, No. 1:24-cv-00082
  (D.R.I. 2024), complaint and final judgment:
  `https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf` and
  `https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.11.0.pdf`.
- Take-Two Interactive v Papenhoff, No. 3:21-cv-06831
  (N.D. Cal.),
  stipulation of dismissal, 3 April 2023:
  `https://storage.courtlistener.com/recap/gov.uscourts.cand.384429/gov.uscourts.cand.384429.47.0.pdf`.
- SAS Institute v World Programming, C-406/10:
  `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62010CJ0406`.
- Sony Computer Entertainment Europe v Datel, C-159/23:
  `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62023CJ0159`.
- SAS Institute v World Programming [2013] EWHC 69 (Ch): `https://caselaw.nationalarchives.gov.uk/ewhc/ch/2013/69`.
- SAS Institute v World Programming [2010] EWHC 1829 (Ch): `https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1829`.
- Nova Productions v Mazooma Games [2007] EWCA Civ 219: `https://caselaw.nationalarchives.gov.uk/ewca/civ/2007/219`.
- IBM United Kingdom v LzLabs [2025] EWHC 532 (TCC): `https://caselaw.nationalarchives.gov.uk/ewhc/tcc/2025/532`.
- Supreme Court of Japan, 7 September 1978, case 1975(O)324, translation: `https://www.wipo.int/wipolex/en/text/592975`.

Project policies and statements:

- Wine, Developer FAQ and Clean Room Guidelines:
  `https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ`
  and `https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines`.
- ReactOS, `CONTRIBUTING.md`: `https://raw.githubusercontent.com/reactos/reactos/master/CONTRIBUTING.md`.
- ReactOS, Intellectual Property Guideline: `https://reactos.org/intellectual-property-guideline/`.
- ReactOS wiki, Audit, archived copy: `https://web.archive.org/web/2024/https://reactos.org/wiki/Audit`.
- ReactOS, "Reset, Reboot, Restart, legal issues and the long road to 0.3"
  (27 January 2006): `https://reactos.org/project-news/reset-reboot-restart-legal-issues-and-long-road-03/`.
- Asahi Linux, Copyright policy: `https://asahilinux.org/copyright/`.
- Asahi Linux, Generative AI (LLM) Policy: `https://asahilinux.org/llm-policy/`.
- A. Tridgell, "How Samba was written" (2003): `https://www.samba.org/ftp/tridge/misc/french_cafe.txt`.
- Nouveau FAQ: `https://nouveau.freedesktop.org/FAQ.html`.
- GNU Coding Standards, § 2.1: `https://www.gnu.org/prep/standards/standards.html`.
- GNU Classpath FAQ: `https://www.gnu.org/software/classpath/faq/faq.html`.
- Mono, Contributing: `https://www.mono-project.com/community/contributing/`.
- Mesa, Submitting Patches: `https://docs.mesa3d.org/submittingpatches.html`.
- Linux kernel, Submitting patches (DCO 1.1): `https://docs.kernel.org/process/submitting-patches.html`.
- Linux kernel, AI Coding Assistants: `https://docs.kernel.org/process/coding-assistants.html`.
- J. Hall, "Why it matters that Microsoft released old versions of MS-DOS as open source" (2018):
  `https://opensource.com/article/18/10/microsoft-open-source-old-versions-ms-dos`.
- Dolphin, `Contributing.md`: `https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md`.
- Cemu, `CONTRIBUTING.md`: `https://github.com/cemu-project/Cemu/blob/main/CONTRIBUTING.md`.
- Xenia, `CONTRIBUTING.md`: `https://github.com/xenia-project/xenia/blob/master/.github/CONTRIBUTING.md`.
- MAME, Legal Information: `https://www.mamedev.org/legal.html`.
- MAME, Contributing: `https://docs.mamedev.org/contributing/index.html`.
- RPCS3, `CONTRIBUTING.md`: `https://github.com/RPCS3/rpcs3/blob/master/.github/CONTRIBUTING.md`.
- mGBA, `CONTRIBUTING.md`: `https://github.com/mgba-emu/mgba/blob/master/CONTRIBUTING.md`.
- BizHawk, `contributing.md`: `https://github.com/TASEmulators/BizHawk/blob/master/contributing.md`.
- READMEs of Panda3DS, gopher64, jgenesis, SkyEmu, Gambatte, and TetaNES: `https://github.com/wheremyfoodat/Panda3DS`,
  `https://github.com/gopher64/gopher64`, `https://github.com/jsgroth/jgenesis`,
  `https://github.com/skylersaleh/SkyEmu`, `https://github.com/sinamas/gambatte`, `https://github.com/lukexor/tetanes`.
- Licence files of the 30 roadmap emulators, read through the GitHub contents and licence API: `https://api.github.com`.
- ZeldaRET, Majora's Mask decompilation README (prose only): `https://github.com/zeldaret/mm/blob/main/README.md`.

Documentation hubs, test suites, and licences:

- Pan Docs, History: `https://gbdev.io/pandocs/History.html`.
- GBATEK: `https://problemkaputt.de/gbatek.htm`.
- Nocash PSX specifications: `https://problemkaputt.de/psx-spx.htm`.
- psx-spx home page: `https://psx-spx.consoledev.net/`.
- 3dbrew, Copyrights: `https://www.3dbrew.org/wiki/3dbrew:Copyrights`.
- WiiBrew, Policy: `https://wiibrew.org/wiki/WiiBrew:Policy`.
- WiiUBrew, Policy: `https://wiiubrew.org/wiki/WiiUBrew:Policy`.
- Mooneye Test Suite README: `https://github.com/Gekkio/mooneye-test-suite`.
- Mealybug Tearoom tests README: `https://github.com/mattcurrie/mealybug-tearoom-tests`.
- SingleStepTests 65x02 README: `https://github.com/SingleStepTests/65x02`.
- Arm Architecture Reference Manual, known issues document 102105
  (7 February 2025), proprietary notice: `https://documentation-service.arm.com/static/67ab274f6dbc975ccea916d7`.
- Arm DDI 0100I, ARM Architecture Reference Manual (2005), and Arm DDI 0210C, ARM7TDMI Technical Reference Manual:
  `https://documentation-service.arm.com/documentation/ddi0100/i`
  and `https://documentation-service.arm.com/documentation/ddi0210/c`.
- fail0verflow, Homebrew Channel README (prose only): `https://github.com/fail0verflow/hbc`.
- libogc, `LICENSE`: `https://raw.githubusercontent.com/devkitPro/libogc/master/LICENSE`.
- RTEMS, statement of 6 May 2025: `https://www.rtems.org/news/2025-05-06-rtems-devkit-libogc-response/`.
- GNU GPL version 3: `https://www.gnu.org/licenses/gpl-3.0.html`.
- GNU licence list: `https://www.gnu.org/licenses/license-list.html`.
- Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 legal code:
  `https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.en`.
- Creative Commons, compatible licences:
  `https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/`.
- PlayStation Global Developer and Publisher Agreement v1.01 (2017), as filed with the SEC:
  `https://www.sec.gov/Archives/edgar/data/946581/000162828017005833/ex10-48.htm`.

AI, authorship, and tooling:

- Z. Yang et al., "Unveiling Memorization in Code Models" (2024): `https://arxiv.org/abs/2308.09932`.
- W. Xu et al., "LiCoEval" (2025): `https://arxiv.org/abs/2408.02487`.
- United States Copyright Office, "Copyright and Artificial Intelligence, Part 2: Copyrightability" (2025):
  `https://www.copyright.gov/ai/Copyright-and-Artificial-Intelligence-Part-2-Copyrightability-Report.pdf`.
- D. Blanchard, account of the chardet rewrite
  (29 March 2026): `https://dan-blanchard.github.io/blog/chardet-rewrite-controversy/`.
- B. Kuhn, Software Freedom Conservancy, comment of 27 March 2026:
  `https://github.com/chardet/chardet/issues/355#issuecomment-4145369025`.
- JPlag README: `https://github.com/jplag/JPlag`.
- copydetect README: `https://github.com/blingenf/copydetect`.
- GitHub, code referencing: `https://docs.github.com/en/copilot/concepts/completions/code-referencing`.
- SCANOSS open knowledge base: `https://osskb.org/`.
- Claude Code documentation, permissions, hooks, subagents, and memory:
  `https://code.claude.com/docs/en/permissions.md` and sibling pages.

Secondary sources:

- "NEC v Intel: Breaking New Ground in the Law of Copyright", Harvard Journal of Law and Technology, volume 3,
  page 209 (1990): `https://jolt.law.harvard.edu/articles/pdf/v03/03HarvJLTech209.pdf`.
- J. Langdell, "Phoenix Says Its BIOS May Foil IBM's Lawsuits", PC Magazine, 10 July 1984, p. 56:
  `https://archive.org/stream/PC-Mag-1984-07-10/PC-Mag-1984-07-10_djvu.txt`.
- Sandrik, Michigan Technology Law Review, volume 28, page 61 (2021):
  `https://www.mttlr.org/wp-content/journal/voltwentyeight/sandrik.pdf`.
- Lee, Cooper, and Grimmelmann, "Talkin' 'Bout AI Generation" (2024 draft): `https://arxiv.org/pdf/2309.08133`.
- Marks & Clerk, "The Clean Room Problem"
  (29 October 2026):
  `https://www.marks-clerk.com/insights/latest-insights/102o6n6-the-clean-room-problem-ai-reverse-engineering-and-the-limits-of-safe-harbours/`.
- The Record, report on the Hernandez sentencing
  (1 December 2020):
  `https://therecord.media/hacker-who-stole-nintendo-switch-details-sentenced-to-three-years-in-prison/`.
- Yale CPSC 101 collaboration policy: `https://zoo.cs.yale.edu/classes/cs101/current/collab.html`.
- "An Interview With Compaq Co-Founder and CEO Rod Canion", Internet History Podcast:
  `https://www.internethistorypodcast.com/?p=444`.
- Hackaday, "Libogc Allegations Rock Wii Homebrew Community"
  (1 May 2025): `https://hackaday.com/2025/05/01/libogc-allegations-rock-wii-homebrew-community/`.
