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
and a widely used homebrew library is accused of the same by others.
No source shows how an AI author with unknown training data can be the unexposed side of a wall.

[ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) has since chosen which sources may be read,
by licence tier, and the recommendations below follow it.
This note is not legal advice.

## Scope

- Question: which sources may be read during research and development, and how should notes be taken?
- Covered: the kinds of source, the law that makes reading matter, what comparable projects do,
  what changes when AI agents read and write, and note-taking practice.
- Left to other items: case law, anti-circumvention, firmware, and keys in depth ([R0-02](R0-02-legal-baseline.md));
  licence strategy ([R0-03](../../roadmap/research.md#phase-0-ground-rules)); note conventions
  and the glossary ([R0-04](R0-04-glossary-and-conventions.md)); the reading list
  for each system ([R0-05](R0-05-source-map.md)); provenance controls
  for agent-written work ([R0-06](R0-06-provenance-controls.md)).
- Researched on 2026-11-17, and reworked on 2026-11-20 to answer the open questions.
  Statutes and project policies are quoted as published on the day each was read.
  The Japanese statutes were read in unofficial English translations.
- How claims were checked: each finding names its source, and every source was fetched on the date its entry gives.
  Two independent passes have run so far, each after a research pass.
  For the first version, a second pass fetched the sources again and tested each claim and quotation.
  The findings added on 2026-11-20 rest on pages fetched that day, or on the repository notes they link.
  A second pass on the same day fetched those sources again, tested each new claim, quotation, and link,
  and its corrections were checked against the sources and applied.
  Claims it could not check are marked where they stand and listed in the pull request.
- A claim marked "(secondary)" rests on commentary, not on the original text.
  A claim marked "(from memory)" was not confirmed by any fetched page, and one marked "(inference)" is reasoning.
  Statements that nothing was found record a search, not proof of absence.
- No emulator source code, decompilation, or leaked material was opened.
  From emulator projects, only prose policy files, licence files, and websites were read.

## Findings

### Copyright: what is protected and how copying is proved

- United States copyright does not extend to "any idea, procedure, process, system, method of operation"
  ([17 U.S.C. § 102(b)](https://www.law.cornell.edu/uscode/text/17/102)).
  [TRIPS Article 9(2)](https://www.wto.org/english/docs_e/legal_e/27-trips_04_e.htm)
  and [Directive 2009/24/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32009L0024) Article 1(2)
  state the same limit for treaty and European Union law.
- Infringement requires "copying of constituent elements of the work
  that are original" ([Feist](https://www.law.cornell.edu/supremecourt/text/499/340)).
  Copying is most often inferred from access to the work plus substantial similarity
  ([Altai](https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html)).
- "Independent creation is a complete defense to copyright infringement"
  ([Skidmore](https://cdn.ca9.uscourts.gov/datastore/opinions/2020/03/09/16-56057.pdf), slip opinion at 22).
  In the Ninth Circuit, access plus similarity raises a presumption of copying that the defendant must rebut
  ([Three Boys](https://law.resource.org/pub/us/case/reporter/F3/212/212.F3d.477.97-55154.97-55150.html)).
- Similarity "so striking" that independent creation is, "as a practical matter,
  precluded" can support an inference of access,
  though the same court still required some evidence that access was reasonably possible
  ([Selle v Gibb](https://law.resource.org/pub/us/case/reporter/F2/741/741.F2d.896.83-2545.83-2484.html)).
  Not having read a work is therefore not a complete answer where code matches it for no functional reason (inference).
- Copying infringes "even though subconsciously accomplished"
  ([ABKCO](https://law.resource.org/pub/us/case/reporter/F2/722/722.F2d.988.82-7461.82-7421.505.600.html)).
  The cases found on this point concern music and, in a case ABKCO cites, a film; none found applies it to software.
- Before comparing two programs, a court sets aside elements that are ideas,
  that "are dictated by efficiency or external factors", or that come from the public domain (Altai).
- Structure can be protected without literal copying
  ([Whelan](https://law.resource.org/pub/us/case/reporter/F2/797/797.F2d.1222.85-1358.html); Altai),
  and a "translation" is a listed kind of derivative work
  ([17 U.S.C. § 101](https://www.law.cornell.edu/uscode/text/17/101)).
  A port of someone else's code to another language can fall inside that definition
  where it carries over protected expression (inference from the statute and Whelan).
- Whether interface declarations are copyrightable is unresolved in the United States.
  The Federal Circuit said yes
  ([Oracle v Google, 2014](https://www.cafc.uscourts.gov/opinions-orders/13-1021.opinion.5-7-2014.1.pdf)), the First
  Circuit held a menu hierarchy unprotectable
  ([Lotus](https://law.resource.org/pub/us/case/reporter/F3/049/49.F3d.807.93-2214.html)), and the Supreme Court assumed
  the point and decided on fair use ([Google v Oracle](https://www.law.cornell.edu/supremecourt/text/18-956)).
- Reading is not one of the exclusive rights ([17 U.S.C. § 106](https://www.law.cornell.edu/uscode/text/17/106)).
  GPLv3 defines "modify" as copying or adapting "in a fashion requiring copyright permission"
  ([GPLv3 § 0](https://www.gnu.org/licenses/gpl-3.0.html)).
  No case was found, either way, on whether reading licensed code and then writing similar code creates an obligation.
- Clean-room practice does not touch patents.
  Infringement has no copying element
  ([35 U.S.C. § 271(a)](https://www.law.cornell.edu/uscode/text/35/271)),
  and patent protection reaches "independent creation"
  ([Kewanee](https://www.law.cornell.edu/supremecourt/text/416/470)).
  The term is 20 years from filing ([35 U.S.C. § 154](https://www.law.cornell.edu/uscode/text/35/154)),
  so on this note's first date a utility patent filed before 2006-11-17 has expired unless its term was adjusted
  or extended (calculated from the statute).
- For enhanced patent damages, culpability "is generally measured against the knowledge of the actor at the time of the
  challenged conduct" ([Halo](https://www.law.cornell.edu/supremecourt/text/14-1513)).
  Engineers are often told not to read patents for that reason
  ([Sandrik](https://www.mttlr.org/wp-content/journal/voltwentyeight/sandrik.pdf), secondary).

### Reverse engineering and the legal status of a clean room

- No statute or opinion that was read requires a clean room.
  Courts treat separation as evidence on the question of copying.
- In [Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html),
  Accolade's engineers disassembled three games, and the opinion describes no separate team.
  By the account of the employees who wrote it,
  the resulting manual "contained only functional descriptions of the interface requirements
  and did not include any of Sega's code".
- The court in Sega held disassembly a fair use where it is "the only way to gain access to the ideas
  and functional elements" and there is "a legitimate reason".
  It added that this did not "insulate Accolade from a claim of copyright infringement with respect to its finished
  products".
- In [Sony v Connectix](https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html),
  Connectix engineers observed and disassembled the BIOS from a console they had bought while developing the emulator.
  The opinion describes no separation and does not say who wrote Connectix's own BIOS.
  The court found fair use, and the product "does not contain any of Sony's copyrighted material".
  The court did not approve a second BIOS copy that an engineer had downloaded: "the downloading infringement,
  if such it was" was left for damages.
- How a copy was obtained can decide the outcome.
  "To invoke the fair use exception, an individual must possess an authorized copy of a literary work",
  and source code obtained from the Copyright Office by a false statement did not qualify
  ([Atari v Nintendo](https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html)).
- Altai rewrote a tainted program with eight programmers who had not worked on the tainted version,
  with the engineer who copied excluded and his copy of the original locked away,
  working from a description of the services needed, over about six months.
  The court assumed access anyway and compared the code; the rewrite did not infringe, the earlier copied version did,
  and the trade-secret claim survived separately
  ([Altai](https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html)).
- In NEC v Intel a clean-room version written by an outside engineer was, in a law-review note's words,
  "persuasive evidence of non-infringement", because its similarities showed what function forces.
  The shipped code was written by an engineer who had studied Intel's.
  All of this rests on the 1990 note ([Harvard note](https://jolt.law.harvard.edu/articles/pdf/v03/03HarvJLTech209.pdf),
  secondary).
- The 1989 decision itself is reported only in a subscription reporter (10 U.S.P.Q.2d 1177).
  Two web searches on 2026-11-20 found free copies of the 1986 and 1987 decisions in the case only,
  and CourtListener's search interface asked for an account (HTTP 401) (research log).
- A clean room that is not kept counts against its owner.
  An English court found a procedure with codes of conduct, a request channel, restricted source lists,
  and legal oversight had been "eroded over time until there was no effective separation"
  ([IBM v LzLabs](https://caselaw.nationalarchives.gov.uk/ewhc/tcc/2025/532), para 874).
  Liability there came from breach of licence and conspiracy, not from copyright.
- Phoenix described its 1984 BIOS clean room to the press:
  one group wrote specifications "without including any examples of actual code",
  a single isolated programmer who had not used the processor family wrote the code,
  and the memos between them formed an "audit trail"
  ([PC Magazine, 1984](https://archive.org/stream/PC-Mag-1984-07-10/PC-Mag-1984-07-10_djvu.txt)).
  This is Phoenix's own account and was not tested in court.
- A contract can remove what copyright allows.
  Parties "are free to contractually forego the limited ability to reverse engineer"
  ([Bowers](https://law.resource.org/pub/us/case/reporter/F3/320/320.F3d.1317.01-1109.01-1108.html)), and developers of
  an open-source game server lost on a click-through licence
  ([Davidson v Jung](https://law.resource.org/pub/us/case/reporter/F3/422/422.F3d.630.04-3654.html)).
  The rule may differ in other circuits (from memory).
- The interoperability exception to United States anti-circumvention law needs a lawfully obtained copy
  and information "not previously ... readily available"
  ([17 U.S.C. § 1201(f)](https://www.law.cornell.edu/uscode/text/17/1201)).
  The current temporary exemptions, dated October 2024, let individuals circumvent only to restore personal,
  local play of a lawfully acquired game whose authentication server has been shut down,
  and to repair a console's optical drive.
  Preserving other games, and circumventing console system software, is exempt only for eligible libraries, archives,
  and museums ([37 C.F.R. § 201.40(b)(15) and (b)(19)](https://www.law.cornell.edu/cfr/text/37/201.40)).
  [R0-02](R0-02-legal-baseline.md#anti-circumvention-law-in-the-united-states) covers this in depth.

### Outside the United States

- In the European Union a lawful user may "observe, study or test the functioning of the program" while running it
  ([Directive 2009/24/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32009L0024) Article 5(3)),
  and contract terms to the contrary are "null and void" (Article 8).
  The United Kingdom, Germany, and Australia have matching rules
  ([CDPA sections 50B](https://www.legislation.gov.uk/ukpga/1988/48/section/50B) to
  [50C](https://www.legislation.gov.uk/ukpga/1988/48/section/50C), which include the right to observe, study, and test,
  with contrary terms void under [section 296A](https://www.legislation.gov.uk/ukpga/1988/48/section/296A);
  [UrhG](https://www.gesetze-im-internet.de/englisch_urhg/englisch_urhg.html) sections 69d and 69g;
  [Copyright Act 1968](https://www.legislation.gov.au/C1968A00063/latest/text) sections 47B and 47H).
- Decompilation is allowed only where "indispensable" for the interoperability of an independently created program,
  by a lawful user, for information not "readily available" (Article 6(1)).
  The information may not be "given to others, except when necessary",
  nor used for a program "substantially similar in its expression" (Article 6(2)).
- Recital 10 says that interoperability between parts of software and hardware "can be defined
  as the ability to exchange information and mutually to use the information which has been exchanged".
  A recital explains the directive; it is not one of its operative articles.
  No source read rules on whether a program that runs another's software in place of its hardware fits that definition
  (searched: the case law read for this note and for R0-02, and EUR-Lex for the judgment below).
- Article 6(2)(b) bars giving the information to others "except when necessary
  for the interoperability of the independently created computer program".
  Publishing notes drawn from decompilation to anyone who reads them is not what that text describes (inference).
  This stays a risk for any contributor who has decompiled a program; for this project the question is moot,
  as the last bullet of this section says.
- Decompilation is not limited to Article 6.
  A lawful purchaser may decompile all or part of a program to "correct errors affecting its operation",
  without meeting Article 6's conditions, but "only to the extent necessary to effect that correction and in compliance,
  where appropriate, with the conditions laid down in the contract"
  ([Top System v Belgian State](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62020CJ0013),
  Court of Justice, judgment of 6 October 2021, operative part, points 1 and 2).
  The ruling was given under Directive 91/250/EEC, which 2009/24/EC codified, and concerns error correction,
  not emulation.
- Functionality, programming languages, and data file formats are not protected expression
  ([SAS v WPL](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62010CJ0406), para 39).
  The court relied on the developer having had no access to source code
  (paras 44 and 61),
  and said that building similar elements "with the aid of" obtained code could be partial reproduction (para 43).
- The same developer infringed copyright in the original's manuals when writing its own manual
  ([SAS v WPL, English High Court 2013](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2013/69), para 5),
  although its evidence was that its policy was not to copy them directly
  ([SAS v WPL, English High Court 2010](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1829), para 139).
  Documentation is a separate risk from code.
- Competitors are free, "once they establish through independent analysis which ideas,
  rules or principles are being used, to create their own implementation"
  ([Sony v Datel](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62023CJ0159), para 48).
  No ruling on emulation or on Article 6 from 2025 or 2026 was found.
- "Merely making a program which will emulate another but which in no way involves copying the program code
  or any of the program's graphics is legitimate"
  ([Nova v Mazooma](https://caselaw.nationalarchives.gov.uk/ewca/civ/2007/219), para 52, England and Wales).
- Japan's [Copyright Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4207) excludes "programming language,
  coding conventions, or algorithms" from protection (Article 10(3)) and names no reverse-engineering exception
  (translation current to Act No. 52 of 2021).
  The
  [Agency for Cultural Affairs](https://www.bunka.go.jp/seisaku/chosakuken/hokaisei/h30_hokaisei/pdf/r1406693_17.pdf)
  says analysis of programs falls under Article 30-4, suggests keeping written reports of the analysis as evidence of
  purpose, and warns about contract terms (2019 guidance, Q12, non-binding).
- Japan's Supreme Court has held that a work made with no access to an earlier one is not a copy even if identical
  ([judgment of 7 September 1978](https://www.wipo.int/wipolex/en/text/592975)).
- Canada's exception applies "even if the other computer program incorporates the information and is then sold,
  rented or otherwise distributed"
  ([Copyright Act section 30.61(2)](https://laws-lois.justice.gc.ca/eng/acts/C-42/section-30.61.html)).
  The European Union text has no such clause.
- For Rustalgia the European Union question on publishing decompiled information does not arise.
  ADR 0001 closes decompilations and disassemblies of games and firmware
  ([ADR 0001, "Closed tier"](../../adr/0001-restrict-reading-by-licence-tier.md#closed-tier)),
  and the research conventions bar any value known only from the code of a decompilation
  ([research conventions, "Constants and tables"](../README.md#constants-and-tables)).
  The stronger reason is that the project never obtains or uses firmware or games at all,
  so it has nothing of its own to decompile
  ([ADR 0001, "Context"](../../adr/0001-restrict-reading-by-licence-tier.md#context)).

### Trade secrets, contracts, and leaked material

- Trade-secret law permits reverse engineering.
  "Improper means" in United States law "does not include reverse engineering, independent derivation,
  or any other lawful means of acquisition" ([18 U.S.C. § 1839(6)](https://www.law.cornell.edu/uscode/text/18/1839)).
  European Union law treats "observation, study,
  disassembly or testing" the same way for a product made available to the public,
  or lawfully held by someone "free from any legally valid duty to limit the acquisition of the trade secret"
  ([Directive (EU) 2016/943](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32016L0943) Article
  3(1)(b)).
- The same laws reach people who receive a secret second-hand.
  Acquiring one while knowing, or having reason to know, that it "was acquired by improper means" is misappropriation
  (18 U.S.C. § 1839(5)(A)); use is not required.
  The European Union standard is "knew or ought, under the circumstances, to have known"
  (Article 4(4)),
  and Japan's is knowledge or gross negligence
  ([Unfair Competition Prevention Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4709) Article 2(1)(v)).
- Publication does not always end secrecy, but wide publication can.
  "Publication on the Internet does not necessarily destroy the secret if the publication is sufficiently obscure
  or transient or otherwise limited",
  and the court reversed an injunction because widely distributed material "may have lost its trade secret status"
  ([DVD CCA v Bunner](https://caselaw.findlaw.com/ca-court-of-appeal/1445547.html), California Court of Appeal 2004).
  That ruling is a preliminary-injunction decision of an intermediate court.
- Copyright does not depend on secrecy,
  so loss of trade-secret status would not by itself end copyright in a leaked work
  (inference; no case read states this).
  Unpublished status is "a key, though not necessarily determinative, factor" against fair use,
  and "fair use presupposes 'good faith'"
  ([Harper & Row](https://www.law.cornell.edu/supremecourt/text/471/539));
  see also [Atari v Nintendo](https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html) above.
- The one prosecution read about, after a breach of Nintendo's servers, was of the intruder
  ([The Record](https://therecord.media/hacker-who-stole-nintendo-switch-details-sentenced-to-three-years-in-prison/),
  secondary).
  No reported suit against an emulator project for reading leaked source was found.
  That is an observation about what was found, not evidence of safety.
- Disputes about keys have run on anti-circumvention law.
  The yuzu case ended in a consent judgment for $2,400,000 with agreed findings; its complaint pleads circumvention,
  keys, and pirated copies, and does not mention leaked development kits
  ([Nintendo v Tropic Haze](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf)).
- Confidentiality duties outlive a developer licence.
  A PlayStation developer agreement filed with the Securities and Exchange Commission keeps its materials confidential
  for as long as Sony maintains them so, and that section is among those that survive termination
  ([GDPA 2017](https://www.sec.gov/Archives/edgar/data/946581/000162828017005833/ex10-48.htm), §§ 20.1 and 25.11).
  No public copy of Nintendo's developer non-disclosure agreement was found.

### Policies of reimplementation projects

- Wine bars "anyone who has seen Microsoft Windows source code (stolen, under an NDA, disassembled, or otherwise)".
  It tells contributors to learn behaviour by writing tests, forbids disassembly and reading ReactOS code,
  and says "Don't use an LLM tool to generate code" because nothing shows the training material respects its guidelines
  ([Wine Developer FAQ](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ);
  [Clean Room Guidelines](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines)).
- ReactOS requires a sworn statement that the contributor has "not used nor seen" Windows source,
  naming the leaked Windows 2000 code
  ([ReactOS `CONTRIBUTING.md`](https://raw.githubusercontent.com/reactos/reactos/master/CONTRIBUTING.md)).
  In 2006 it announced an audit of its whole tree
  and barred four developers from the modules whose leaked source they had seen
  ([ReactOS 2006](https://reactos.org/project-news/reset-reboot-restart-legal-issues-and-long-road-03/)).
  Its current guideline defers to the [GNU rule](https://www.gnu.org/prep/standards/standards.html), which is looser
  ([ReactOS guideline](https://reactos.org/intellectual-property-guideline/)).
- Asahi Linux says a clean room "is not a legal requirement" and does not "absolutely guarantee" a clean result,
  but is "a fairly strong legal defense".
  It ranks methods from hardware probing, to tracing the vendor system, to disassembly.
  A contributor who disassembles may then only write documentation for that area.
  It allows only material "explicitly made available to the public at large"
  ([Asahi copyright policy](https://asahilinux.org/copyright/)).
- Asahi treats other open-source code as a reference only: register names may inspire,
  but contributors must not "reimplement identical code flows or algorithms",
  and code that others reverse engineered may not be incorporated even under a compatible licence
  (Asahi copyright policy).
- Asahi broadly forbids generative AI because such systems "are likely to violate the clean room requirements
  and taint the resulting code", a risk "amplified with 'agentic' approaches"
  ([Asahi LLM policy](https://asahilinux.org/llm-policy/)).
- Samba learned its protocols by watching network traffic, probing, and comparing its server with the real one
  ([Tridgell 2003](https://www.samba.org/ftp/tridge/misc/french_cafe.txt)).
  Nouveau compares hardware state before and after an action and does not disassemble the vendor driver
  ([Nouveau FAQ](https://nouveau.freedesktop.org/FAQ.html)).
- The GNU standards say "Don't in any circumstances refer to Unix source code",
  and that someone with "a vague recollection" should "organize the imitation internally along different lines"
  ([GNU Coding Standards § 2.1](https://www.gnu.org/prep/standards/standards.html)).
- The Developer Certificate of Origin certifies the right to submit a contribution
  and says nothing about what its author read ([DCO 1.1](https://docs.kernel.org/process/submitting-patches.html)).
  The Linux kernel adds: "AI agents MUST NOT add Signed-off-by tags.
  Only humans can legally certify" it
  ([kernel, AI coding assistants](https://docs.kernel.org/process/coding-assistants.html)).
- Exposure rules have been lifted when the original was relicensed.
  FreeDOS barred people who had viewed Microsoft's 2014 source release and dropped the bar
  when the code was reissued under the MIT licence in 2018
  ([Hall 2018](https://opensource.com/article/18/10/microsoft-open-source-old-versions-ms-dos)).
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
  because "we have to assume that they contain leaked Nintendo information"
  ([Dolphin `Contributing.md`](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md)).
- Cemu asks that new contributors' code be written by a human,
  and says "There is evidence that LLMs have been trained on leaked proprietary SDKs
  and we cannot verify the origin of the knowledge"
  ([Cemu `CONTRIBUTING.md`](https://github.com/cemu-project/Cemu/blob/main/CONTRIBUTING.md)).
  It cites none.
- Xenia lists the sources it permits, bans Microsoft's development kit as a source,
  and asks contributors to "leave comments describing how the information included in it was obtained"
  ([Xenia `CONTRIBUTING.md`](https://github.com/xenia-project/xenia/blob/master/.github/CONTRIBUTING.md)).
- Several projects say that they read other emulators.
  Panda3DS used Citra "as a reference, with some code snippets inspired or adapted from it",
  and gopher64 says portions "have been adapted from mupen64plus and/or ares"
  ([Panda3DS](https://github.com/wheremyfoodat/Panda3DS) and [gopher64](https://github.com/gopher64/gopher64) READMEs).
  MAME says the proper use of its source is "to examine it, using it to understand how the games worked,
  and then write your own emulation code" ([MAME legal page](https://www.mamedev.org/legal.html)).
- Emulator projects disagree about AI. [mGBA](https://github.com/mgba-emu/mgba/blob/master/CONTRIBUTING.md),
  [BizHawk](https://github.com/TASEmulators/BizHawk/blob/master/contributing.md),
  and [SkyEmu](https://github.com/skylersaleh/SkyEmu) refuse AI-generated code; MAME requires disclosure of the model
  ([MAME contributing](https://docs.mamedev.org/contributing/index.html));
  RPCS3 says "Use of AI tools for research and reverse engineering purposes is permitted"
  ([RPCS3 `CONTRIBUTING.md`](https://github.com/RPCS3/rpcs3/blob/master/.github/CONTRIBUTING.md)).
- The Majora's Mask decompilation README bars from it
  and its sister project anyone who has "accessed leaked source code at any point in time" (ZeldaRET README).
  It has no link here because ZeldaRET is a closed-tier source; its address is in Sources as text, for its prose only.
  None of about 15 other decompilation READMEs sampled states a legal basis.
  The one lawsuit found against such a project ended
  when the claims against its four named developers were dismissed with prejudice by stipulation;
  no ruling on the merits was found
  ([Take-Two v Papenhoff](https://storage.courtlistener.com/recap/gov.uscourts.cand.384429/gov.uscourts.cand.384429.47.0.pdf)).

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
  and forums rest on a survey of examples that the verification pass did not re-check;
  [R0-05](R0-05-source-map.md) examines them.
- Licences of community references range from CC0
  ([Pan Docs](https://gbdev.io/pandocs/History.html))
  through a bare copyright notice with no grant
  ([GBATEK, About](https://problemkaputt.de/gbatek-about-this-document.htm))
  to nothing stated ([3dbrew](https://www.3dbrew.org/wiki/3dbrew:Copyrights),
  [WiiBrew](https://wiibrew.org/wiki/WiiBrew:Policy), [SwitchBrew](https://switchbrew.org/wiki/Main_Page)).
  Pan Docs' history pages do not say how its facts were first obtained (Pan Docs, History).
- The maintainers of the community PlayStation reference say that "it isn't a clean room reverse engineering project",
  that "a good chunk of the original document has been either directly copy/pasted from the confidential code
  and documentation from Sony, or summarized and rephrased",
  and that "any work derived from it shouldn't be considered clean" (psx-spx home page).
- The document it descends from carries the line "This hardware reference is reportedly based on confidential documents
  and source code.
  If anybody knows of such leaked information ... please let me know!", which reads as its author reporting the claim,
  not conceding it (Nocash PSX specifications).
  The two accounts conflict.
  Neither is linked: both are tainted under ADR 0001, and their addresses stay in Sources as text, not to be opened.
- No source read gives a method for telling
  whether a document descends from confidential material without comparing it with that material,
  which the project never opens.
  R0-05 searched every hub's policy pages and found none
  ([R0-05, "What the evaluation cannot show"](R0-05-source-map.md#what-the-evaluation-cannot-show)).
- The working test is ADR 0001's kinds table:
  a reference is tainted when its maintainers say it copies confidential material,
  closed when a named project or rights holder has accused it publicly, and otherwise open, with the gap recorded
  ([ADR 0001, "Sources that are not emulators"](../../adr/0001-restrict-reading-by-licence-tier.md#sources-that-are-not-emulators)).
  R0-05 records each hub's statement
  ([R0-05, "Patterns across the hubs"](R0-05-source-map.md#patterns-across-the-hubs)).
- Three community wikis checked state a rule against leaked or confidential material.
  3dbrew bars information obtained under a non-disclosure agreement,
  WiiBrew removes "leaked information such as Nintendo's private SDK", and WiiUBrew forbids leaked information
  ([3dbrew Copyrights](https://www.3dbrew.org/wiki/3dbrew:Copyrights);
  [WiiBrew Policy](https://wiibrew.org/wiki/WiiBrew:Policy);
  [WiiUBrew Policy](https://wiiubrew.org/wiki/WiiUBrew:Policy)).
  [NESdev](https://www.nesdev.org/wiki/Nesdev_wiki:General_disclaimer),
  [SNESdev](https://snes.nesdev.org/wiki/SNESdev_Wiki), [N64brew](https://n64brew.dev/wiki/Main_Page),
  [DSiBrew](https://dsibrew.org/wiki/DSiBrew:Contributing),
  and [SwitchBrew](https://switchbrew.org/wiki/Main_Page) state none on the pages read,
  and R0-05 found the same across the hubs it evaluated
  ([R0-05, "Patterns across the hubs"](R0-05-source-map.md#patterns-across-the-hubs)).
- Test suites do not always record hardware.
  One suite's expected images are "screenshots from my Game Boy emulator (which I believe to be correct)"
  ([Mealybug README](https://github.com/mattcurrie/mealybug-tearoom-tests)),
  another has an "emulator-only" class
  ([Mooneye README](https://github.com/Gekkio/mooneye-test-suite)),
  and a widely used set of processor test vectors is generated by an emulator implementation
  ([SingleStepTests README](https://github.com/SingleStepTests/65x02)).
- Several test collections show no licence file where they are commonly obtained, including mirrors of blargg's tests
  (GitHub licence metadata).
  They are not linked: with no licence they are closed tier,
  as the [register](../../../.claude/hooks/source-register.txt) records for each mirror.
- Official documents that are public are not always free to reuse.
  The known-issues document for a current Arm manual forbids reproduction without Arm's written permission
  and makes access conditional on not using it to assess infringement of third-party patents
  ([Arm notice, 2025](https://documentation-service.arm.com/static/67ab274f6dbc975ccea916d7)).
  The older manuals differ.
  The ARMv5 Architecture Reference Manual grants no right to use it for developing processor cores "or models thereof"
  that are compatible with the architecture,
  and the ARM7TDMI manual forbids adapting or reproducing it without written permission;
  neither has the patent condition ([Arm DDI 0100I](https://documentation-service.arm.com/documentation/ddi0100/i);
  [Arm DDI 0210C](https://documentation-service.arm.com/documentation/ddi0210/c)).
- Other makers' notices were read and tabulated by R0-05
  ([R0-05, "Processor and chip makers' manuals"](R0-05-source-map.md#processor-and-chip-makers-manuals)):
  Arm, Intel, Renesas, the Western Design Center, NXP, OpenPOWER, AMD, Ecma,
  and third-party copies of Toshiba and IDT manuals.
  Among them, by R0-05's table, only Arm's ARMv5 and ARMv6 manual withholds a right for models,
  and only Renesas forbids reverse engineering of its products.
  OpenPOWER and Ecma allow conforming implementations, and Intel allows software that runs on its products.
- No Arm page that R0-05 read explains what "adapted or reproduced in any material form" means for a software model.
  That is a risk for any study of an ARM-based system that relies on the older manuals.
  The register line for the Arm documentation site already notes
  that one manual excludes models ([register](../../../.claude/hooks/source-register.txt)).
  How such studies should use these manuals is
  [R0-05's option 4](R0-05-source-map.md#4-makers-manuals-whose-notices-restrict-use).
- A homebrew library can carry disputed origin.
  The authors of the Homebrew Channel state that large portions of libogc "were stolen directly from the Nintendo SDK
  (decompiled and cleaned up)" ([fail0verflow README](https://github.com/fail0verflow/hbc)).
  On that allegation, its maintainer is reported as saying "There was no reading of source code
  or tools to turn assembly into C"
  ([Hackaday 2025](https://hackaday.com/2025/05/01/libogc-allegations-rock-wii-homebrew-community/), secondary; the
  maintainer's own posts were not read).
- The RTEMS project alleges "a systematic effort to copy source code from RTEMS"
  ([RTEMS 2025](https://www.rtems.org/news/2025-05-06-rtems-devkit-libogc-response/)).
  The library's licence file now says its threading code was "inspired by and derived from code written
  for the RTEMS project" (libogc `LICENSE`, closed tier, so not linked).
- Community sites can host a maker's documents next to their own. jgenesis lists such "official documentation" among its
  sources, and its README does not say how the documents became public
  ([jgenesis README](https://github.com/jsgroth/jgenesis)).
- Quoting a source into a note copies it (inference).
  Notes that adapt CC BY-SA 4.0 text may be licensed under GPLv3, but no such compatibility is declared for BY-SA 3.0
  ([Creative Commons, compatible licences](https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/)).

### Licences of the emulators on the roadmap

Read from each repository's licence file and README on 2026-11-17, through the GitHub contents and licence API,
and for three projects again on 2026-11-20.
Each emulator is linked to its repository at first mention, except those in the closed tier.
[R0-03](../../roadmap/research.md#phase-0-ground-rules) covers what the licences mean for reuse.

- Permissive: [SameBoy](https://github.com/LIJI32/SameBoy), [SkyEmu](https://github.com/skylersaleh/SkyEmu),
  [Play!](https://github.com/jpd002/Play-), [ares](https://github.com/ares-emulator/ares),
  [rustboyadvance-ng](https://github.com/michelhe/rustboyadvance-ng), [TetaNES](https://github.com/lukexor/tetanes),
  [MartyPC](https://github.com/dbalsom/martypc), and [BizHawk](https://github.com/TASEmulators/BizHawk)'s own code.
  SameBoy adds a condition on app-store distribution of its iOS code.
  [Provenance](https://github.com/Provenance-Emu/Provenance) uses a BSD-style licence with a clause on commercial use of
  its name.
- MPL-2.0: [mGBA](https://github.com/mgba-emu/mgba).
- GPL-3.0: [melonDS](https://github.com/melonDS-emu/melonDS), [Azahar](https://github.com/azahar-emu/azahar),
  [Panda3DS](https://github.com/wheremyfoodat/Panda3DS), [PCSX2](https://github.com/PCSX2/pcsx2),
  [bsnes](https://github.com/bsnes-emu/bsnes), [Mesen](https://github.com/SourMesen/Mesen2),
  [jgenesis](https://github.com/jsgroth/jgenesis), [RetroArch](https://github.com/libretro/RetroArch),
  [dust](https://github.com/kelpsyberry/dust), and [gopher64](https://github.com/gopher64/gopher64). melonDS, bsnes,
  and Mesen state "or any later version".
  The Mesen2 repository is archived and points to a community fork under the same licence.
- GPL-2.0 or later: [PPSSPP](https://github.com/hrydgard/ppsspp), [Dolphin](https://github.com/dolphin-emu/dolphin),
  and [MAME](https://github.com/mamedev/mame) by its [documentation](https://www.mamedev.org/legal.html).
  [MAME's `COPYING` file](https://github.com/mamedev/mame/blob/master/COPYING) says "version 2" with no "or later".
- GPL-2.0, with "only" or "or later" not stated: [DeSmuME](https://github.com/TASEmulators/desmume),
  [PCSX-Redux](https://github.com/pcsx-redux/pcsx-redux), and [Flycast](https://github.com/flyinghead/flycast).
  Each licence file is the GPL version 2 text with nothing added, and each README says nothing about the licence
  (licence and README read through the GitHub API, 2026-11-20).
  For Flycast this rests on one reading; the second pass's request was blocked by the source guard (research log).
- The DeSmuME and PCSX-Redux licence files are identical once runs of white space are collapsed
  (tested locally with `tr` and `sha256sum`, GNU coreutils 8.32, 2026-11-20).
  The Flycast file was compared on the first reading only, with tool versions not recorded.
- DeSmuME's wiki says that the program is distributed under the GNU General Public License, and links the version 2 text
  ([DeSmuME wiki, FAQ](https://wiki.desmume.org/index.php?title=Faq), last modified 6 June 2022, revision 8944).
  The page returned HTTP 500 to the second pass, which confirmed only the revision and date,
  so its wording is paraphrased here (research log).
- The version 2 text provides that if "the Program does not specify a version number of this License,
  you may choose any version ever published by the Free Software Foundation"
  ([GPL version 2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html), section 9,
  checked against the projects' licence files).
- The Free Software Foundation's FAQ does not say whether shipping the version 2 text specifies a version.
  It does say that a copy of the licence in a repository, on its own,
  leaves it "not entirely clear" whether the licence applies to any particular file,
  and asks for a notice in each source file
  ([GPL FAQ, "LicenseCopyOnly"](https://www.gnu.org/licenses/gpl-faq.html#LicenseCopyOnly),
  read in a web archive capture of 2026-11-18 02:35:56, because gnu.org timed out).
  Searched: the FAQ, the version 2 text, the three READMEs, and DeSmuME's wiki.
  On the FAQ's account the per-file notices decide the question.
  They sit in code, which is walled, so only a reader session can read them.
- Under [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md#open-tier),
  notices saying "or later" would move the files they cover to the open tier on re-evaluation,
  because the open test includes GPL-2.0 "or later".
  Notices saying "only", or no notices, keep the three walled
  ([ADR 0001, "Walled tier"](../../adr/0001-restrict-reading-by-licence-tier.md#walled-tier)).
  The recommendation below proposes the reader session.
- AGPL-3.0: [Delta](https://github.com/rileytestut/Delta).
- Not free software: DuckStation, under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 licence,
  and Snes9x, under its own non-commercial licence.
  Neither is linked, because both are closed tier,
  as the [register](../../../.claude/hooks/source-register.txt) records.
- No licence shown upstream: Gambatte, whose README now reads "This project has been taken private."
  The upstream Gambatte repository is closed tier, so its address is in Sources as text.
- The [GNU licence list](https://www.gnu.org/licenses/license-list.html) says GPLv2 alone "is, by itself,
  not compatible with GPLv3" and that a non-free licence "is automatically incompatible with the GNU GPL".
- No licence text read defines reading.
  The Creative Commons no-derivatives licence restricts sharing "Adapted Material",
  meaning material modified "in a manner requiring permission under the Copyright and Similar Rights"
  ([Creative Commons legal code, § 1(a)](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.en)).
- GitHub's licence metadata is missing or reads `NOASSERTION` for 13 of the 30 emulators,
  so it cannot stand in for reading the licence file (GitHub licence API, 2026-11-17).

### When AI agents read and write

- Code models reproduce training data.
  One study found that a model "memorizes and produces source code verbatim", including "code with strict licenses"
  ([Yang et al. 2024](https://arxiv.org/abs/2308.09932)).
  Another found 0.88% to 2.01% of output "strikingly similar to existing open-source implementations"
  ([Xu et al. 2025](https://arxiv.org/abs/2408.02487)).
  Neither measured emulator code.
- No ruling was found on whether a model's training counts as access by the person who uses the model,
  or on an AI clean room.
  The Ninth Circuit expressed "no view on whether that similarity would allow plaintiffs to assert a claim
  for copyright infringement"
  ([Doe v GitHub, 2026](https://cdn.ca9.uscourts.gov/datastore/opinions/2026/09/16/24-7700.pdf)), a reservation, since
  no infringement claim was before it.
- The nearest decisions found are mostly at the pleading stage, advisory, under appeal, or not final,
  and none concerns a model's downstream user; R0-06 lists them
  ([R0-06, "Litigation and regulation on model memory, access, and output"](R0-06-provenance-controls.md#litigation-and-regulation-on-model-memory-access-and-output)).
  One law-journal article calls presence in the training set "powerful evidence of access"
  ([Lee, Cooper and Grimmelmann](https://arxiv.org/pdf/2309.08133), secondary).
- An instruction does not make a wall.
  In late February 2026 a maintainer rewrote a library with an AI agent
  and released it in March under the MIT licence in place of the LGPL.
  He started from an empty repository and told the agent not to use the old code.
  His audit of the logs found that "despite my instructions, its subagents read old source code in three sessions"
  ([Blanchard 2026](https://dan-blanchard.github.io/blog/chardet-rewrite-controversy/)).
- He maintains that the result is not a derivative work,
  and says the reads went through a connected tool he had not restricted.
  The Software Freedom Conservancy advised people not to rely on the relicensing
  and said "There is no settled case law on the big questions"
  ([Kuhn 2026](https://github.com/chardet/chardet/issues/355#issuecomment-4145369025)).
- The agent tool used for this project documents the same limit.
  Instruction files are "context, not enforced configuration",
  and a fetch rule alone "doesn't prevent network access" while shell commands are allowed.
  A hook that runs before each tool call can block it.
  Subagents start with a fresh context unless forked, and return a summary;
  the documentation describes no filter on its content.
  Session transcripts are deleted after 30 days by default
  ([Claude Code documentation](https://code.claude.com/docs/en/permissions.md)).
- Authorship of AI-written code depends on the country.
  In the United States the Copyright Act "requires all eligible work to be authored in the first instance by a human
  being" ([Thaler v Perlmutter](https://media.cadc.uscourts.gov/opinions/docs/2025/03/23-5233.pdf), D.C.
  Circuit 2025; review denied 2 March 2026, as R0-06 records).
  The
  [Copyright Office](https://www.copyright.gov/ai/Copyright-and-Artificial-Intelligence-Part-2-Copyrightability-Report.pdf)
  says "Copyright does not extend to purely AI-generated material", and "prompts do not alone provide sufficient
  control"; its report does not analyse source code.
- By R0-06's account, the Office protects human-written material that stays perceptible in the output,
  and the creative selection, coordination, or arrangement of outputs, or creative modifications of them;
  selecting among outputs is not in itself enough
  ([R0-06, "Authorship and ownership of agent-written code and text"](R0-06-provenance-controls.md#authorship-and-ownership-of-agent-written-code-and-text)).
- Elsewhere the rules differ.
  The United Kingdom still deems an author for a computer-generated work
  ([CDPA section 9(3)](https://www.legislation.gov.uk/ukpga/1988/48/section/9)).
  European Union law protects a program that is "the author's own intellectual creation",
  and makes the author a natural person or group of them or, where national law permits, a legal person it designates
  ([Directive 2009/24/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32009L0024),
  Articles 1(3) and 2(1)).
  Japan's guidance allows that iterative correction of prompts may count (as R0-06 reports).
  The same file can therefore be protected in one country and unprotected in another (inference, as R0-06 states).
- A licence such as GPL-3.0 grants permissions under copyright,
  so under copyright it binds only the parts of a work in which copyright subsists (inference).
  Whether it also binds as a contract is open:
  the district court in Doe v GitHub let a contract claim for breach of open-source licences proceed
  (order of 24 June 2024, as R0-06 records).
  What licence strategy follows is for [R0-03](../../roadmap/research.md#phase-0-ground-rules).
- Local comparison tools need a copy of the reference code
  ([JPlag](https://github.com/jplag/JPlag); [copydetect](https://github.com/blingenf/copydetect)).
  Hosted snippet-matching services compare against an index the project never holds and return a match report
  ([GitHub code referencing](https://docs.github.com/en/copilot/concepts/copilot-surfaces/copilot-in-ides);
  [SCANOSS](https://osskb.org/)).
  Whether either counts as contact with the code is not addressed in any source read.

### Note-taking and record-keeping

- No source gives a bright line for what a specification may contain.
  Accolade's manual held descriptions and a 20 to 25 byte header that the court thought "probably unprotected"
  ([Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html), note 7).
- Asahi allows register names but not copied blocks of definitions
  ([Asahi copyright policy](https://asahilinux.org/copyright/));
  Wine forbids tests that print internal tables
  ([Wine Clean Room Guidelines](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines));
  the ReactOS audit page lists "undocumented magic numbers" as a warning sign
  ([ReactOS audit page](https://web.archive.org/web/20250423130230/https://reactos.org/wiki/Audit),
  archived copy captured 2025-04-23 13:02:30).
- No primary source read for the first version of this note addressed pseudo-code.
  [R0-04](R0-04-glossary-and-conventions.md#pseudo-code-and-algorithm-descriptions-the-law) has since mapped the law
  and [the practice](R0-04-glossary-and-conventions.md#pseudo-code-and-algorithm-descriptions-practice),
  and the [research conventions](../README.md#algorithms-and-pseudo-code) bar pseudo-code until the owner decides
  where it falls under ADR 0001.
- Disassembly "is wholesale copying" (Sega v Accolade).
  It follows that listings kept in a public repository would be distributed copies,
  not the intermediate copies Sega considered (inference).
- A method may be described "in their own words" by others
  ([Lotus v Borland](https://law.resource.org/pub/us/case/reporter/F3/049/49.F3d.807.93-2214.html)).
- Records made at the time are what later proves independence.
  By its own post-trial brief, NEC's record held "every single piece of paper" its clean engineer saw
  ([Harvard note 1990](https://jolt.law.harvard.edu/articles/pdf/v03/03HarvJLTech209.pdf), secondary).
  ReactOS announced an audit of its whole tree in 2006
  ([ReactOS 2006](https://reactos.org/project-news/reset-reboot-restart-legal-issues-and-long-road-03/)).
- Tests can be the record.
  Wine asks that each finding about behaviour arrive as a test added to its suite (Wine Clean Room Guidelines).
- Xenia's per-claim provenance comments are the closest practice found to this repository's rule
  that every claim says how it was checked
  ([Xenia `CONTRIBUTING.md`](https://github.com/xenia-project/xenia/blob/master/.github/CONTRIBUTING.md)).
- Exposure is declared in different ways: publicly on a mailing list
  ([Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ)), by sworn statement
  ([ReactOS](https://raw.githubusercontent.com/reactos/reactos/master/CONTRIBUTING.md)), or as a condition the project
  says it must confirm ([GNU Classpath](https://www.gnu.org/software/classpath/faq/faq.html)).
  No project was found that keeps a standing public register.
- Rules that delay writing after reading, or forbid taking notes away, were found only in a university policy
  ([Yale CPSC 101](https://zoo.cs.yale.edu/classes/cs101/current/collab.html)).
  They leave no record by design.
- Projects that use the Developer Certificate of Origin have contributors acknowledge
  that the record of a contribution "is maintained indefinitely and may be redistributed"
  ([DCO 1.1](https://docs.kernel.org/process/submitting-patches.html), clause (d)).
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
- **Gains:** matches the facts on which courts found no infringement in
  [SAS](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62010CJ0406) and
  [Nova](https://caselaw.nationalarchives.gov.uk/ewca/civ/2007/219); no access to concede for any particular emulator.
- **Used by:** [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines),
  [Samba](https://www.samba.org/ftp/tridge/misc/french_cafe.txt), [Nouveau](https://nouveau.freedesktop.org/FAQ.html),
  and [Asahi](https://asahilinux.org/copyright/) for its preferred methods.

### 2. Read source code only where the licence would allow reuse

- **What:** permit reading of emulators whose licences are compatible with GPL-3.0, treat the rest as closed,
  and cite what was learned.
- **Costs:** concedes access to each work read; licences change and metadata is unreliable;
  open code can itself rest on methods or sources the project would not accept.
- **Gains:** a clear test; if expression does carry over, the licence may permit it with attribution.
- **Used by:** [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ) and Mono
  ([Mono, Contributing](https://www.mono-project.com/community/contributing/))
  for compatibly licensed Microsoft code; FreeDOS after 2018
  ([Hall 2018](https://opensource.com/article/18/10/microsoft-open-source-old-versions-ms-dos));
  [Asahi](https://asahilinux.org/copyright/), with the caveat above;
  [Panda3DS](https://github.com/wheremyfoodat/Panda3DS) and [gopher64](https://github.com/gopher64/gopher64),
  which say they adapted code from other emulators.

### 3. Read anything published, write independently

- **What:** allow reading of any publicly available source code
  and require the implementation to be organised differently, with no source open while writing.
- **Costs:** concedes access to everything read; relies on discipline;
  subconscious copying and structural similarity remain infringing;
  non-free licences such as DuckStation's and Snes9x's give no fallback.
- **Gains:** access to the widest body of knowledge;
  the practice [MAME](https://www.mamedev.org/legal.html) describes for its own source.
- **Used by:** [jgenesis](https://github.com/jsgroth/jgenesis) and [TetaNES](https://github.com/lukexor/tetanes),
  which name other emulators as references;
  the [GNU standards](https://www.gnu.org/prep/standards/standards.html) tolerate only a vague recollection
  and forbid referring to the source.

### 4. Separate readers from writers

- **What:** whoever reads a restricted source writes only a functional description;
  someone who has not seen the source implements from it.
  With agents, this is a reader session and a writer session with separate contexts.
- **Costs:** two parties for each area; the description can carry expression across;
  a wall that erodes counts against its owner; it does not address what a model already holds,
  or an overseer who sees both sides.
- **Gains:** evidence that courts have credited, as in NEC
  ([Harvard note](https://jolt.law.harvard.edu/articles/pdf/v03/03HarvJLTech209.pdf), secondary)
  and [Altai](https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html);
  a record made as the work happens.
- **Used by:** Phoenix ([PC Magazine, 1984](https://archive.org/stream/PC-Mag-1984-07-10/PC-Mag-1984-07-10_djvu.txt));
  Compaq, by its co-founder's account
  ([Canion interview](https://www.internethistorypodcast.com/?p=444));
  Altai's rewrite; [Asahi](https://asahilinux.org/copyright/) for contributors who disassemble;
  described for AI agents by
  [Marks & Clerk](https://www.marks-clerk.com/insights/latest-insights/102o6n6-the-clean-room-problem-ai-reverse-engineering-and-the-limits-of-safe-harbours/)
  (secondary).

### 5. Functional notes with a source for every claim

- **What:** notes hold behaviour, formats, and values in the note-taker's own words, with no code or listings,
  and each claim names its source, the date read, and how it was checked.
- **Costs:** writing effort; quoted text raises quotation and licence questions; the limits on constants, tables,
  and pseudo-code are project rules, since no source gives a line.
- **Gains:** every claim can be re-checked and its route audited; already this repository's rule for research notes
  ([research conventions](../README.md#conventions)).
- **Used by:** Accolade's manual
  ([Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html));
  [Xenia's](https://github.com/xenia-project/xenia/blob/master/.github/CONTRIBUTING.md) provenance comments.

### 6. Tests as the record

- **What:** each finding about behaviour is captured as a reproducible test against hardware
  or freely licensed test software.
- **Costs:** needs lawful access to hardware or software; some published expected results come from emulators,
  not hardware.
- **Gains:** the evidence of origin is the test, and it doubles as a regression suite.
- **Used by:** [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines),
  [Mono](https://www.mono-project.com/community/contributing/),
  and [Samba](https://www.samba.org/ftp/tridge/misc/french_cafe.txt).

### 7. Session-level provenance records

- **What:** keep a log of every address fetched and every search made,
  and retain session transcripts alongside the notes.
- **Costs:** transcripts hold the full text of whatever was read; default retention is 30 days;
  a log cannot show what came from model memory, and the same record proves any access that did occur.
- **Gains:** the record that exposed the leaks in the chardet rewrite
  ([Blanchard 2026](https://dan-blanchard.github.io/blog/chardet-rewrite-controversy/));
  lets a reviewer audit what an agent opened.
- **Used by:** the chardet maintainer after the fact; recommended by
  [Marks & Clerk](https://www.marks-clerk.com/insights/latest-insights/102o6n6-the-clean-room-problem-ai-reverse-engineering-and-the-limits-of-safe-harbours/)
  (secondary); NEC's log is the human equivalent
  ([Harvard note](https://jolt.law.harvard.edu/articles/pdf/v03/03HarvJLTech209.pdf), secondary).

### 8. Enforce source limits in the agent tooling

- **What:** express the chosen source rule as permission rules, blocking hooks, and restricted tool lists,
  so that an agent cannot open a forbidden source, in place of an instruction asking it not to.
- **Costs:** setup and upkeep; fetch rules do not cover shell commands unless those are restricted too;
  search results and summaries can still carry code, and connected tool servers are a further route.
- **Gains:** enforced by the tool, not by the model; addresses the route by which the chardet wall failed,
  if every tool that can reach the source is covered.
- **Used by:** documented for [Claude Code](https://code.claude.com/docs/en/permissions.md);
  no project was found that publishes such a configuration for clean-room purposes.
  This repository has since adopted it ([register](../../../.claude/hooks/source-register.txt)).

### 9. Limit or check what AI writes

- **What:** one of three positions seen: no AI-written code; AI barred from code that models the emulated system;
  or AI allowed with disclosure, a responsible human, and similarity checks on the output.
- **Costs:** the first two conflict with a project written mostly by agents;
  local similarity tools need the reference code, and translation between languages defeats token matching
  ([JPlag](https://github.com/jplag/JPlag); [copydetect](https://github.com/blingenf/copydetect);
  [Blanchard 2026](https://dan-blanchard.github.io/blog/chardet-rewrite-controversy/)).
- **Gains:** addresses the memory problem that options 4 and 8 leave open; matches what several peer projects accept.
- **Used by:** [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ),
  [Asahi](https://asahilinux.org/llm-policy/),
  and [mGBA](https://github.com/mgba-emu/mgba/blob/master/CONTRIBUTING.md) (none);
  [Cemu](https://github.com/cemu-project/Cemu/blob/main/CONTRIBUTING.md)
  (none from new contributors);
  [Dolphin](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md)
  (not for console behaviour);
  [MAME](https://docs.mamedev.org/contributing/index.html),
  [RPCS3](https://github.com/RPCS3/rpcs3/blob/master/.github/CONTRIBUTING.md), and Mesa
  ([Mesa, Submitting Patches](https://docs.mesa3d.org/submittingpatches.html)) (disclosure).

### 10. Ask contributors what they have seen

- **What:** ask contributors to declare exposure to leaked or confidential material and to past agreements,
  or ask exposed people not to contribute, entirely or in the affected area.
- **Costs:** rests on self-declaration; turns people away; no source defines exposure for an AI author.
- **Gains:** addresses trade-secret and contract risk, which separating readers from writers does not.
- **Used by:** [Dolphin](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md) and ZeldaRET
  (exposed people asked not to contribute; ZeldaRET is closed tier, so not linked);
  [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ)
  and [ReactOS](https://raw.githubusercontent.com/reactos/reactos/master/CONTRIBUTING.md) (declaration); ReactOS in 2006
  ([ReactOS 2006](https://reactos.org/project-news/reset-reboot-restart-legal-issues-and-long-road-03/))
  and [GNU Classpath](https://www.gnu.org/software/classpath/faq/faq.html) (by area).

### Recommendation

- **Which sources may be read (options 1 to 4):** decided, not recommended here.
  [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md#decision) applies option 2 to open-tier code,
  option 4 as a reader session to walled code, and option 1 to closed sources, and reads nothing of tainted ones
  (inference: the ADR does not number these options).
  Its deciding factors are that reading cannot be undone,
  so the strictest treatment goes where a licence gives no fallback,
  and that a published open-source licence is its author's permission to study the work.
  The findings support both: a compatible licence gives a fallback if expression carries over,
  and a wall is credited only where it is kept
  ([Altai](https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html);
  [IBM v LzLabs](https://caselaw.nationalarchives.gov.uk/ewhc/tcc/2025/532)).
- **The three GPL-2.0 emulators:** commission one reader session to read the per-file licence notices of DeSmuME,
  PCSX-Redux, and Flycast, and re-evaluate their tier from what it records.
  The notices are the only evidence that can settle "only" or "or later",
  the session records licence statements and no behaviour,
  and an "or later" answer would open those files under ADR 0001's open test.
  Starting a reader session is the owner's call.
- **How notes are taken (options 5 to 7):** combine options 5 and 6, and keep session records as option 7 describes,
  privately.
  Option 5 is already the project's rule and makes every claim re-checkable,
  and option 6 turns findings into evidence that doubles as a regression suite where lawful hardware
  or freely licensed tests exist, as at [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines).
  Option 7 gives the only record of what an agent opened, which is how the chardet leaks were found
  ([Blanchard 2026](https://dan-blanchard.github.io/blog/chardet-rewrite-controversy/)).
  Its costs set the form: transcripts hold the full text of what was read, including walled code a reader opened,
  and the same record proves any access that did occur.
  Keeping them outside the published repository, as R0-06's option 2 maps
  ([R0-06, "Retain transcripts privately"](R0-06-provenance-controls.md#2-retain-transcripts-privately)),
  answers the first cost; the second is the price of having evidence at all.
- **AI agents (options 8 and 9):** keep option 8, the guard hook already in place, and adopt the third form of option 9:
  disclosure, a responsible human, and similarity checks against open-tier code the project may hold.
  The first two forms conflict with a project written mostly by agents, and option 8 alone does not reach model memory.
  Neither do those similarity checks reach memory of leaked kits,
  the risk that [Dolphin](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md)
  and [Cemu](https://github.com/cemu-project/Cemu/blob/main/CONTRIBUTING.md) name,
  because the project never holds leaked material to compare against.
  [R0-06](R0-06-provenance-controls.md#15-segregated-job-that-holds-restricted-code-and-reports-scores) maps a
  machine-only check against restricted code; its revision now under review recommends that such a check count as
  reading, for a future amendment of ADR 0001, so that it is not run.
  No such amendment exists yet.
- **Pseudo-code (option 5):** [R0-04](R0-04-glossary-and-conventions.md#options-and-trade-offs),
  in its revision now under review, recommends that a future amendment of ADR 0001 count pseudo-code as code,
  so that notes keep to sentences, tables, formulas, and diagrams.
  Until the owner decides, the [research conventions](../README.md#algorithms-and-pseudo-code) allow none.
- **People (option 10):** ask every human contributor to declare exposure to leaked or confidential material
  and to past developer agreements before outside contributions arrive,
  and keep exposed people out of the affected area,
  as [ReactOS did in 2006](https://reactos.org/project-news/reset-reboot-restart-legal-issues-and-long-road-03/)
  and [GNU Classpath](https://www.gnu.org/software/classpath/faq/faq.html) does;
  Dolphin bars them from contributing code at all.
  It is the option that most directly addresses trade-secret and contract risk,
  alongside the standing exclusion of leaked material.
  The contributor terms belong to [R0-03](../../roadmap/research.md#phase-0-ground-rules).

## Implications for Rustalgia

- The choice among options 1 to 4 is made, by [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md),
  approved on 2026-11-19.
  The emulator studies ([`R1-30` to `R1-67`](../../roadmap/research.md#emulator-studies)) may start under it,
  each stating the tier of its emulator.
- Community references need a provenance class before they are relied on.
  The psx-spx statement made each hub's licence, stated origin, and rule on confidential material facts to record;
  [R0-05](R0-05-source-map.md) records them,
  and the [register](../../../.claude/hooks/source-register.txt) holds each tier.
- Confidential and leaked material is excluded under every option, as the roadmap already states.
  ADR 0001's kinds table now gives the test that the first version of this note found missing,
  and its rule that a tier is checked again when a new dispute is noticed covers a source later found to be tainted
  ([ADR 0001, "Evaluating a new source"](../../adr/0001-restrict-reading-by-licence-tier.md#evaluating-a-new-source)).
- Agents write most of this repository, and no source shows how a model can be the unexposed side of a wall.
  Options 7, 8, and 9 feed an ADR on AI provenance controls, which [R0-06](R0-06-provenance-controls.md) maps,
  and the authorship findings feed [R0-03](../../roadmap/research.md#phase-0-ground-rules).
  The published policies of [Wine](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ),
  [Asahi](https://asahilinux.org/llm-policy/),
  and [Dolphin](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md) exclude code produced this way;
  that bears on any plan to exchange code with them.
- The existing rule that every claim says how it was checked is option 5.
  The [research conventions](../README.md#conventions) now extend it to quoting, constants, and pseudo-code.
- Patents, contributor agreements, and the laws
  that reach downstream recipients of secrets are not addressed by separating readers from writers.
  [R0-02](R0-02-legal-baseline.md) records them as risks.

## Open questions

- Does a model's training on a work count as access by the person who uses the model?
  No ruling yet, and no pending matter
  that [R0-06](R0-06-provenance-controls.md#litigation-and-regulation-on-model-memory-access-and-output) lists presents
  it.
  It stays open until a case does; R0-06 tracks the litigation.
- What did the court in NEC v Intel hold, in its own words?
  The 1989 decision (10 U.S.P.Q.2d 1177) is in subscription reporters only;
  a law library or a subscription would answer it, and until then the finding rests on the 1990 note (secondary).

## Sources

Every source below was read on 2026-11-17, except where an entry gives 2026-11-20.

This repository's documents:

- [ADR 0001, "Restrict what may be read by licence tier"](../../adr/0001-restrict-reading-by-licence-tier.md),
  approved 2026-11-19, read 2026-11-20.
- [Research conventions](../README.md), read 2026-11-20.
- [Research roadmap](../../roadmap/research.md), read 2026-11-20.
- [Source register](../../../.claude/hooks/source-register.txt), read 2026-11-20.
- [R0-02](R0-02-legal-baseline.md), [R0-04](R0-04-glossary-and-conventions.md), [R0-05](R0-05-source-map.md),
  and [R0-06](R0-06-provenance-controls.md), as on `main` at commit `2b1a9be`, read 2026-11-20.

Statutes, treaties, and regulations:

- 17 U.S.C. [§ 101](https://www.law.cornell.edu/uscode/text/17/101),
  [§ 102](https://www.law.cornell.edu/uscode/text/17/102), [§ 106](https://www.law.cornell.edu/uscode/text/17/106),
  [§ 107](https://www.law.cornell.edu/uscode/text/17/107),
  and [§ 1201](https://www.law.cornell.edu/uscode/text/17/1201).
- [18 U.S.C. § 1839](https://www.law.cornell.edu/uscode/text/18/1839).
- 35 U.S.C. [§ 154](https://www.law.cornell.edu/uscode/text/35/154),
  [§ 271](https://www.law.cornell.edu/uscode/text/35/271), and [§ 284](https://www.law.cornell.edu/uscode/text/35/284).
- [37 C.F.R. § 201.40](https://www.law.cornell.edu/cfr/text/37/201.40).
- [Directive 2009/24/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32009L0024), read 2026-11-17,
  and recital 10 and Articles 1(3), 2(1), and 6(2)(b) again on 2026-11-20.
- [Directive (EU) 2016/943](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32016L0943).
- Copyright, Designs and Patents Act 1988, sections [50B](https://www.legislation.gov.uk/ukpga/1988/48/section/50B),
  [50C](https://www.legislation.gov.uk/ukpga/1988/48/section/50C),
  and [296A](https://www.legislation.gov.uk/ukpga/1988/48/section/296A),
  and [section 9](https://www.legislation.gov.uk/ukpga/1988/48/section/9), read 2026-11-20.
- [German Copyright Act (UrhG), English translation](https://www.gesetze-im-internet.de/englisch_urhg/englisch_urhg.html).
- [Australia, Copyright Act 1968](https://www.legislation.gov.au/C1968A00063/latest/text).
- [Canada, Copyright Act section 30.61](https://laws-lois.justice.gc.ca/eng/acts/C-42/section-30.61.html).
- [Japan, Copyright Act, unofficial translation](https://www.japaneselawtranslation.go.jp/en/laws/view/4207).
- [Japan, Unfair Competition Prevention Act, tentative translation](https://www.japaneselawtranslation.go.jp/en/laws/view/4709).
- [Japan, Agency for Cultural Affairs, guidance on Articles 30-4, 47-4, 47-5](https://www.bunka.go.jp/seisaku/chosakuken/hokaisei/h30_hokaisei/pdf/r1406693_17.pdf)
  (24 October 2019, in Japanese).
- [TRIPS Agreement, Article 9](https://www.wto.org/english/docs_e/legal_e/27-trips_04_e.htm).

Court decisions and filings:

- [Feist v Rural Telephone](https://www.law.cornell.edu/supremecourt/text/499/340), 499 U.S.
  340 (1991).
- [Kewanee Oil v Bicron](https://www.law.cornell.edu/supremecourt/text/416/470), 416 U.S.
  470 (1974).
- [Harper & Row v Nation Enterprises](https://www.law.cornell.edu/supremecourt/text/471/539), 471 U.S.
  539 (1985).
- [Halo Electronics v Pulse Electronics](https://www.law.cornell.edu/supremecourt/text/14-1513), 579 U.S.
  93 (2016).
- [Google v Oracle America](https://www.law.cornell.edu/supremecourt/text/18-956), 593 U.S.
  1 (2021).
- [Oracle America v Google](https://www.cafc.uscourts.gov/opinions-orders/13-1021.opinion.5-7-2014.1.pdf), 750 F.3d 1339
  (Fed. Cir. 2014).
- [Whelan v Jaslow](https://law.resource.org/pub/us/case/reporter/F2/797/797.F2d.1222.85-1358.html), 797 F.2d 1222
  (3d Cir. 1986).
- [ABKCO Music v Harrisongs Music](https://law.resource.org/pub/us/case/reporter/F2/722/722.F2d.988.82-7461.82-7421.505.600.html),
  722 F.2d 988 (2d Cir. 1983).
- [Selle v Gibb](https://law.resource.org/pub/us/case/reporter/F2/741/741.F2d.896.83-2545.83-2484.html), 741 F.2d 896
  (7th Cir. 1984).
- [Atari Games v Nintendo of America](https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html),
  975 F.2d 832 (Fed. Cir. 1992).
- [Sega Enterprises v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html),
  977 F.2d 1510 (9th Cir. 1992).
- [Computer Associates v Altai](https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html),
  982 F.2d 693 (2d Cir. 1992).
- [Lotus Development v Borland](https://law.resource.org/pub/us/case/reporter/F3/049/49.F3d.807.93-2214.html),
  49 F.3d 807 (1st Cir. 1995).
- [Sony Computer Entertainment v Connectix](https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html),
  203 F.3d 596 (9th Cir. 2000).
- [Three Boys Music v Bolton](https://law.resource.org/pub/us/case/reporter/F3/212/212.F3d.477.97-55154.97-55150.html),
  212 F.3d 477 (9th Cir. 2000).
- [Bowers v Baystate Technologies](https://law.resource.org/pub/us/case/reporter/F3/320/320.F3d.1317.01-1109.01-1108.html),
  320 F.3d 1317 (Fed. Cir. 2003).
- [Davidson & Associates v Jung](https://law.resource.org/pub/us/case/reporter/F3/422/422.F3d.630.04-3654.html),
  422 F.3d 630 (8th Cir. 2005).
- [Skidmore v Led Zeppelin](https://cdn.ca9.uscourts.gov/datastore/opinions/2020/03/09/16-56057.pdf), 952 F.3d 1051
  (9th Cir. 2020).
- [Doe v GitHub](https://cdn.ca9.uscourts.gov/datastore/opinions/2026/09/16/24-7700.pdf), No. 24-7700
  (9th Cir. 16 September 2026).
- [Thaler v Perlmutter](https://media.cadc.uscourts.gov/opinions/docs/2025/03/23-5233.pdf), No. 23-5233
  (D.C. Cir. 18 March 2025), read 2026-11-20.
- [DVD Copy Control Association v Bunner](https://caselaw.findlaw.com/ca-court-of-appeal/1445547.html), No. H021153
  (Cal. Ct. App. 27 February 2004).
- Nintendo of America v Tropic Haze, No. 1:24-cv-00082
  (D.R.I. 2024),
  [complaint](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf)
  and [final judgment](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.11.0.pdf).
- [Take-Two Interactive v Papenhoff](https://storage.courtlistener.com/recap/gov.uscourts.cand.384429/gov.uscourts.cand.384429.47.0.pdf),
  No. 3:21-cv-06831 (N.D. Cal.), stipulation of dismissal, 3 April 2023.
- [SAS Institute v World Programming, C-406/10](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62010CJ0406).
- [Sony Computer Entertainment Europe v Datel, C-159/23](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62023CJ0159).
- [Top System v Belgian State, C-13/20](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62020CJ0013),
  judgment of 6 October 2021, read 2026-11-20.
- [SAS Institute v World Programming [2013] EWHC 69 (Ch)](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2013/69).
- [SAS Institute v World Programming [2010] EWHC 1829 (Ch)](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1829).
- [Nova Productions v Mazooma Games [2007] EWCA Civ 219](https://caselaw.nationalarchives.gov.uk/ewca/civ/2007/219).
- [IBM United Kingdom v LzLabs [2025] EWHC 532 (TCC)](https://caselaw.nationalarchives.gov.uk/ewhc/tcc/2025/532).
- [Supreme Court of Japan, 7 September 1978, case 1975(O)324, translation](https://www.wipo.int/wipolex/en/text/592975).

Project policies and statements:

- Wine, [Developer FAQ](https://gitlab.winehq.org/wine/wine/-/wikis/Developer-FAQ)
  and [Clean Room Guidelines](https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines).
- [ReactOS, `CONTRIBUTING.md`](https://raw.githubusercontent.com/reactos/reactos/master/CONTRIBUTING.md).
- [ReactOS, Intellectual Property Guideline](https://reactos.org/intellectual-property-guideline/).
- [ReactOS wiki, Audit, archived copy](https://web.archive.org/web/20250423130230/https://reactos.org/wiki/Audit),
  captured 2025-04-23 13:02:30, the capture that the 2024 archive address leads to.
- [ReactOS, "Reset, Reboot, Restart, legal issues and the long road to 0.3"](https://reactos.org/project-news/reset-reboot-restart-legal-issues-and-long-road-03/)
  (27 January 2006).
- [Asahi Linux, Copyright policy](https://asahilinux.org/copyright/).
- [Asahi Linux, Generative AI (LLM) Policy](https://asahilinux.org/llm-policy/).
- [A. Tridgell, "How Samba was written"](https://www.samba.org/ftp/tridge/misc/french_cafe.txt) (2003).
- [Nouveau FAQ](https://nouveau.freedesktop.org/FAQ.html).
- [GNU Coding Standards, § 2.1](https://www.gnu.org/prep/standards/standards.html).
- [GNU Classpath FAQ](https://www.gnu.org/software/classpath/faq/faq.html).
- [Mono, Contributing](https://www.mono-project.com/community/contributing/).
- [Mesa, Submitting Patches](https://docs.mesa3d.org/submittingpatches.html).
- [Linux kernel, Submitting patches (DCO 1.1)](https://docs.kernel.org/process/submitting-patches.html).
- [Linux kernel, AI Coding Assistants](https://docs.kernel.org/process/coding-assistants.html).
- [J. Hall, "Why it matters that Microsoft released old versions of MS-DOS as open source"](https://opensource.com/article/18/10/microsoft-open-source-old-versions-ms-dos)
  (2018).
- [Dolphin, `Contributing.md`](https://github.com/dolphin-emu/dolphin/blob/master/Contributing.md).
- [Cemu, `CONTRIBUTING.md`](https://github.com/cemu-project/Cemu/blob/main/CONTRIBUTING.md).
- [Xenia, `CONTRIBUTING.md`](https://github.com/xenia-project/xenia/blob/master/.github/CONTRIBUTING.md).
- [MAME, Legal Information](https://www.mamedev.org/legal.html).
- [MAME, Contributing](https://docs.mamedev.org/contributing/index.html).
- [RPCS3, `CONTRIBUTING.md`](https://github.com/RPCS3/rpcs3/blob/master/.github/CONTRIBUTING.md).
- [mGBA, `CONTRIBUTING.md`](https://github.com/mgba-emu/mgba/blob/master/CONTRIBUTING.md).
- [BizHawk, `contributing.md`](https://github.com/TASEmulators/BizHawk/blob/master/contributing.md).
- READMEs of [Panda3DS](https://github.com/wheremyfoodat/Panda3DS), [gopher64](https://github.com/gopher64/gopher64),
  [jgenesis](https://github.com/jsgroth/jgenesis), [SkyEmu](https://github.com/skylersaleh/SkyEmu),
  and [TetaNES](https://github.com/lukexor/tetanes).
- Gambatte README, prose only: `https://github.com/sinamas/gambatte`.
  Not linked, because the upstream repository is closed tier.
- Licence files and READMEs of the 30 roadmap emulators, read through the GitHub contents and licence API,
  from these repositories: [SameBoy](https://github.com/LIJI32/SameBoy), [Play!](https://github.com/jpd002/Play-),
  [ares](https://github.com/ares-emulator/ares), [rustboyadvance-ng](https://github.com/michelhe/rustboyadvance-ng),
  [MartyPC](https://github.com/dbalsom/martypc), [BizHawk](https://github.com/TASEmulators/BizHawk),
  [Provenance](https://github.com/Provenance-Emu/Provenance), [mGBA](https://github.com/mgba-emu/mgba),
  [melonDS](https://github.com/melonDS-emu/melonDS), [Azahar](https://github.com/azahar-emu/azahar),
  [PCSX2](https://github.com/PCSX2/pcsx2), [bsnes](https://github.com/bsnes-emu/bsnes),
  [Mesen](https://github.com/SourMesen/Mesen2), [RetroArch](https://github.com/libretro/RetroArch),
  [dust](https://github.com/kelpsyberry/dust), [PPSSPP](https://github.com/hrydgard/ppsspp),
  [Dolphin](https://github.com/dolphin-emu/dolphin),
  [MAME](https://github.com/mamedev/mame) and its [`COPYING`](https://github.com/mamedev/mame/blob/master/COPYING),
  [DeSmuME](https://github.com/TASEmulators/desmume), [PCSX-Redux](https://github.com/pcsx-redux/pcsx-redux),
  [Flycast](https://github.com/flyinghead/flycast), and [Delta](https://github.com/rileytestut/Delta),
  the five whose READMEs are listed above, and Gambatte.
  DuckStation and Snes9x are closed tier and not linked:
  `https://github.com/stenzek/duckstation` and `https://github.com/snes9xgit/snes9x`.
  For DeSmuME, PCSX-Redux, and Flycast,
  the licence and README were read again on 2026-11-20 through
  [`/repos/tasemulators/desmume/license`](https://api.github.com/repos/tasemulators/desmume/license),
  [`/repos/pcsx-redux/pcsx-redux/license`](https://api.github.com/repos/pcsx-redux/pcsx-redux/license),
  [`/repos/flyinghead/flycast/license`](https://api.github.com/repos/flyinghead/flycast/license), and the matching
  `/readme` endpoints.
- [DeSmuME wiki, FAQ](https://wiki.desmume.org/index.php?title=Faq), last modified 6 June 2022, revision 8944,
  read 2026-11-20.
- ZeldaRET, Majora's Mask decompilation README, prose only: `https://github.com/zeldaret/mm/blob/main/README.md`.
  Not linked, because ZeldaRET is closed tier.

Documentation hubs, test suites, and licences:

- [Pan Docs, History](https://gbdev.io/pandocs/History.html).
- [GBATEK, About this document](https://problemkaputt.de/gbatek-about-this-document.htm),
  the chapter that holds the copyright notice.
- [NESdev wiki, General disclaimer](https://www.nesdev.org/wiki/Nesdev_wiki:General_disclaimer),
  [SNESdev wiki](https://snes.nesdev.org/wiki/SNESdev_Wiki), [N64brew wiki](https://n64brew.dev/wiki/Main_Page),
  [DSiBrew, Contributing](https://dsibrew.org/wiki/DSiBrew:Contributing),
  and [SwitchBrew](https://switchbrew.org/wiki/Main_Page), with their footers.
- Nocash PSX specifications: `https://problemkaputt.de/psx-spx.htm`.
  Not linked, because it is tainted; its statement is recorded here so that it need not be opened again.
- psx-spx home page: `https://psx-spx.consoledev.net/`.
  Not linked, for the same reason.
- [3dbrew, Copyrights](https://www.3dbrew.org/wiki/3dbrew:Copyrights).
- [WiiBrew, Policy](https://wiibrew.org/wiki/WiiBrew:Policy).
- [WiiUBrew, Policy](https://wiiubrew.org/wiki/WiiUBrew:Policy).
- [Mooneye Test Suite README](https://github.com/Gekkio/mooneye-test-suite).
- [Mealybug Tearoom tests README](https://github.com/mattcurrie/mealybug-tearoom-tests).
- [SingleStepTests 65x02 README](https://github.com/SingleStepTests/65x02).
- [Arm Architecture Reference Manual, known issues document 102105](https://documentation-service.arm.com/static/67ab274f6dbc975ccea916d7)
  (7 February 2025), proprietary notice.
- [Arm DDI 0100I, ARM Architecture Reference Manual](https://documentation-service.arm.com/documentation/ddi0100/i)
  (2005), and
  [Arm DDI 0210C, ARM7TDMI Technical Reference Manual](https://documentation-service.arm.com/documentation/ddi0210/c).
- [fail0verflow, Homebrew Channel README](https://github.com/fail0verflow/hbc), prose only.
- libogc, `LICENSE`: `https://raw.githubusercontent.com/devkitPro/libogc/master/LICENSE`.
  Not linked, because libogc is closed tier.
- [RTEMS, statement of 6 May 2025](https://www.rtems.org/news/2025-05-06-rtems-devkit-libogc-response/).
- [GNU GPL version 3](https://www.gnu.org/licenses/gpl-3.0.html).
- [GNU GPL version 2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html);
  section 9 was read on 2026-11-20 in the three projects' unmodified copies, because gnu.org timed out.
- [GNU GPL FAQ](https://www.gnu.org/licenses/gpl-faq.html#LicenseCopyOnly),
  read 2026-11-20 in the web archive capture of 2026-11-18 02:35:56 (`20261118023556`), because gnu.org timed out.
- [GNU licence list](https://www.gnu.org/licenses/license-list.html).
- [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 legal code](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.en).
- [Creative Commons, compatible licences](https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/).
- [PlayStation Global Developer and Publisher Agreement v1.01 (2017), as filed with the SEC](https://www.sec.gov/Archives/edgar/data/946581/000162828017005833/ex10-48.htm).

AI, authorship, and tooling:

- [Z. Yang et al., "Unveiling Memorization in Code Models"](https://arxiv.org/abs/2308.09932) (2024).
- [W. Xu et al., "LiCoEval"](https://arxiv.org/abs/2408.02487) (2025).
- [United States Copyright Office, "Copyright and Artificial Intelligence, Part 2: Copyrightability"](https://www.copyright.gov/ai/Copyright-and-Artificial-Intelligence-Part-2-Copyrightability-Report.pdf)
  (2025).
- [D. Blanchard, account of the chardet rewrite](https://dan-blanchard.github.io/blog/chardet-rewrite-controversy/)
  (29 March 2026).
- [B. Kuhn, Software Freedom Conservancy, comment of 27 March 2026](https://github.com/chardet/chardet/issues/355#issuecomment-4145369025).
- [JPlag README](https://github.com/jplag/JPlag).
- [copydetect README](https://github.com/blingenf/copydetect).
- [GitHub, code referencing](https://docs.github.com/en/copilot/concepts/copilot-surfaces/copilot-in-ides).
- [SCANOSS open knowledge base](https://osskb.org/).
- [Claude Code documentation, permissions](https://code.claude.com/docs/en/permissions.md),
  and its sibling pages on hooks, subagents, and memory.

Secondary sources:

- ["NEC v Intel: Breaking New Ground in the Law of Copyright"](https://jolt.law.harvard.edu/articles/pdf/v03/03HarvJLTech209.pdf),
  Harvard Journal of Law and Technology, volume 3, page 209 (1990).
- [J. Langdell, "Phoenix Says Its BIOS May Foil IBM's Lawsuits"](https://archive.org/stream/PC-Mag-1984-07-10/PC-Mag-1984-07-10_djvu.txt),
  PC Magazine, 10 July 1984, p. 56.
- [Sandrik, Michigan Technology Law Review, volume 28, page 61](https://www.mttlr.org/wp-content/journal/voltwentyeight/sandrik.pdf)
  (2021).
- [Lee, Cooper, and Grimmelmann, "Talkin' 'Bout AI Generation"](https://arxiv.org/pdf/2309.08133) (2024 draft).
- [Marks & Clerk, "The Clean Room Problem"](https://www.marks-clerk.com/insights/latest-insights/102o6n6-the-clean-room-problem-ai-reverse-engineering-and-the-limits-of-safe-harbours/)
  (29 October 2026).
- [The Record, report on the Hernandez sentencing](https://therecord.media/hacker-who-stole-nintendo-switch-details-sentenced-to-three-years-in-prison/)
  (1 December 2020).
- [Yale CPSC 101 collaboration policy](https://zoo.cs.yale.edu/classes/cs101/current/collab.html).
- ["An Interview With Compaq Co-Founder and CEO Rod Canion", Internet History Podcast](https://www.internethistorypodcast.com/?p=444).
- [Hackaday, "Libogc Allegations Rock Wii Homebrew Community"](https://hackaday.com/2025/05/01/libogc-allegations-rock-wii-homebrew-community/)
  (1 May 2025).
