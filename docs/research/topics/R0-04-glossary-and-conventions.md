---
title: Glossary and research conventions
roadmap_item: R0-04
status: draft
date: 2026-11-19
---

# Glossary and research conventions

## Summary

This note asks what vocabulary the research needs, and what a note may quote, tabulate, and describe.

The central emulation terms are used in conflicting senses by the sources the project will read.
The standard vocabulary read defines some of them, such as emulator, firmware, and ROM, in general computing senses,
and lacks others, such as BIOS, JIT, and save state,
so a glossary has to choose its own wording and say whose usage differs.

No source read gives a count of words that may be quoted, a length of byte sequence that may be recorded,
or a level of detail at which a description of an algorithm becomes a copy of a program.
The law gives conditions, and any limit the project sets is its own.

Two points matter most to Rustalgia.
A detailed enough description can carry a program's expression across a wall,
and the tools that agents fetch with paraphrase quotations unless each one is checked against the raw page
(research log).

The note ends each group of options with a recommendation, and they match what was merged with it:
one [glossary][glossary] file, quotation rules by class of source with exact text, single values with a source,
no pseudo-code, and pinned citations.
Two recommendations belong to [the proposed amendment of ADR 0001][adr]: that pseudo-code counts as code,
and that the glossary's definitions of BIOS, boot ROM, and system software become the ADR's terms.

This note is not legal advice.

## Scope

- Question: which terms need fixed meanings, and what conventions should notes follow for quoting, constants and tables,
  pseudo-code, citations, and the status of a claim?
- Covered: the law and licences on quotation, on data and tables, and on descriptions of programs;
  how peer projects and standards bodies handle each; contested vocabulary; glossary practice;
  and what this repository's checks can enforce.
- Left to other items: the substance of emulation case law, anti-circumvention, firmware, and keys ([R0-02][r02]),
  and patents, which [R0-01][r01] assigns to it; trade marks are this note's assignment to `R0-02`;
  what the repository's licence means for quoted
  and agent-written text ([R0-03][r03]); the tier of each hub ([R0-05][r05]); logging
  and similarity checks ([R0-06][r06]).
- Conventions for code are not set here.
  The [research guide][guide] binds documents under `docs/research/`; conventions for constants, tables,
  and provenance comments in code are set when the first implementation plan is written, which is where code starts.
  No roadmap item covers them (a search of the [roadmap][roadmap] for "conventions" finds only R0-04).
- Researched on 2026-11-19, with Vale 3.27.0, mdschema 0.16.0, lychee 0.24.2, rumdl 0.3.4, and typos 1.52.2.
  Japanese statutes were read in unofficial English translations;
  one Japanese judgment and one agency text were read in Japanese.
- Reworked on 2026-11-20, when the owner asked that the note's questions be answered rather than listed,
  and that its references be linked.
  The questions it listed, and those in its pull request, were answered from sources, by local tests,
  or by settling a process call; design choices became recommendations.
- How claims were checked: each finding names its source.
  Research agents fetched every source in the Sources list on 2026-11-19 and copied quotations from the raw page text,
  not from a summarising tool; sources that could not be fetched or read raw are named where they are mentioned.
  A second, independent pass fetched the sources again and tested each claim and quotation.
  Its corrections were applied, after the sources it relied on were fetched once more;
  the claims it could not check are listed in the pull request, and are weakened or marked here.
- The findings added on 2026-11-20 rest on raw fetches made with curl that day, one judgment at a time,
  with raw copies deleted after use.
  They have not had a second, independent pass; the pull request lists them.
- Markers: a claim marked "(secondary)" rests on commentary, "(from memory)" was not confirmed by any fetched page,
  "(inference)" is reasoning, and "(tested locally)" was run with the repository's tools on scratch files. "(research
  log)" is an observation an agent made while gathering the evidence, and "(observed)" or "(read locally)" marks what an
  agent saw in a fetched page or a repository file.
  Statements that nothing was found record a search, not proof of absence.
- Quotation marks, apostrophes, and line breaks inside quotations are normalised; nothing else is.
  No emulator source code, decompilation, or leaked material was opened, and no tainted source.
  From emulator and decompilation projects, only README files, licence files, documentation, FAQs,
  and blog posts were read.

The [glossary][glossary] and the conventions in the [research guide][guide] were merged with this note,
and the owner accepted them on 2026-11-20.
The recommendations at the end of "Options and trade-offs" give the evidence for each choice they make.

## Findings

### Quoting: what copyright law allows

- Quotation is a permitted use under the [Berne Convention][berne], on conditions.
  "It shall be permissible to make quotations from a work which has already been lawfully made available to the public,
  provided that their making is compatible with fair practice,
  and their extent does not exceed that justified by the purpose" (Article 10(1)).
  Mention must be made "of the source, and of the name of the author if it appears thereon" (Article 10(3)).
- No source read gives a word count.
  "There are no legal rules permitting the use of a specific number of words, a certain number of musical notes,
  or percentage of a work" ([United States Copyright Office, fair use FAQ][usco-fairuse]; an agency page, not law).
  The statute lists "the amount and substantiality of the portion used in relation to the copyrighted work as a whole"
  as one of four factors ([17 U.S.C. § 107][usc107]),
  and "the extent of permissible copying varies with the purpose and character of the use"
  ([Campbell][campbell], a case about a song parody).
- A short extract can be protected.
  Storing and printing an 11-word extract is reproduction in part "if the elements thus reproduced are the expression of
  the intellectual creation of their author; it is for the national court to make this determination"
  ([Infopaq][infopaq], operative part).
- United States registration rules exclude "Words and short phrases such as names, titles, and slogans"
  ([37 C.F.R. § 202.1(a)][cfr202]).
  The regulation lists them as examples of works "not subject to copyright",
  for which "applications for registration of such works cannot be entertained".
  It concerns standalone short phrases and does not say that a short quotation from a longer work is free (inference).
- The United Kingdom allows quotation "(whether for criticism or review or otherwise)" on four conditions:
  the work "has been made available to the public", the use is "fair dealing",
  "the extent of the quotation is no more than is required by the specific purpose for which it is used",
  and there is "a sufficient acknowledgement (unless this would be impossible for reasons of practicality or otherwise)"
  ([CDPA section 30(1ZA)][cdpa30]).
  An acknowledgement identifies the work "by its title or other description" and its author,
  unless a published work is anonymous or an unpublished work's author cannot be found by reasonable inquiry
  ([section 178][cdpa178]).
  A contract term that restricts the exception "is unenforceable"
  (section 30(4)),
  and in deciding whether a work has been made available "no account shall be taken of any unauthorised act"
  (section 30(1A)).
- A quotation that was fair dealing still failed the United Kingdom exception because it carried no acknowledgement,
  and the court put the burden of showing the conditions on the person quoting
  ([Pasternak v Prescott][pasternak], paras 444 to 487; a first-instance judgment).
- European Union law lets member states allow "quotations for purposes such as criticism or review",
  for a work "lawfully made available to the public", with "the source,
  including the author's name" indicated "unless this turns out to be impossible", "in accordance with fair practice,
  and to the extent required by the specific purpose" ([Directive 2001/29/EC Article 5(3)(d)][infosoc5]).
- The Court of Justice describes a quotation as use of an extract "for the purposes of illustrating an assertion,
  of defending an opinion or of allowing an intellectual comparison between that work and the assertions of that user"
  ([Pelham][pelham], para 71).
  "It also follows that the use of the quoted work must be secondary in relation to the assertions of that user"
  ([Spiegel Online][spiegel], para 79).
  Pelham concerned music sampling and Spiegel Online a news site.
- Japan permits quoting a work that has been made public where the quotation is "consistent with fair practices
  and within a scope that is justified" by its purpose, such as news reporting, critique, or study
  ([Copyright Act][jp-act] Article 32(1), unofficial translation).
  The source must be indicated when the work is reproduced,
  and for other uses where "it is common practice to indicate the source" (Article 48(1)(i) and (iii)).
  Translation of a quoted work is also permitted (Article 47-6(1)(ii)).
- Under the old Copyright Act, the Supreme Court of Japan required that the quoting
  and the quoted work can be told apart, and that the quoting work is the main part and the quoted work subordinate.
  That is the note's own translation of the [judgment][jp-sc] of the Third Petty Bench of 28 March 1980,
  read in Japanese; the date is from the court's [case page][jp-sc-page], which reports it at Minshū volume 34,
  number 3, page 244.
  The [Agency for Cultural Affairs][jp-textbook] lists the same points and adds, as examples,
  that the amount quoted stays within the minimum necessary
  (Copyright Textbook, fiscal 2026 edition, page 75; non-binding, read in Japanese).
  Whether later courts still apply the two requirements was not checked.
- Canada allows fair dealing for research with no attribution condition,
  and for criticism or review if the source is mentioned (Copyright Act [sections 29][ca29] and [29.1][ca291]).
  Its Supreme Court calls fair dealing "a user's right" that "must not be interpreted restrictively"
  ([CCH][cch], para 48; a case about a library's photocopying).
- Australia allows fair dealing for criticism or review where "a sufficient acknowledgement of the work is made"
  ([Copyright Act 1968][au-act] section 41).
  No general quotation exception was seen in the Australian Act's table of contents; only its first volume was read.
- Rewording is not a safe route.
  "Paraphrasing or copying with evasion is an infringement"
  ([Nutt][nutt], Second Circuit 1929, about the plan and arrangement of a whole lecture course).
  Close paraphrase of unpublished letters counted as copying protected expression
  ([Salinger][salinger], on a preliminary injunction),
  and a newspaper's abstracts of analysts' reports "appropriated almost verbatim the most creative
  and original aspects of the reports" ([Wainwright][wainwright], also on a preliminary injunction).
  The statute lists a "translation", an "abridgment", and a "condensation" as derivative works
  ([17 U.S.C. § 101][usc101]).
- One appeals court suggested, of a standard incorporated by reference that does not govern conduct,
  that "perhaps the copier's purpose could be achieved with only a paraphrase or a summary"
  ([ASTM v Public.Resource.Org][astm], D.C. Circuit 2018, slip opinion at 25 to 26; guidance on remand, not a holding).
- Facts stay free.
  "The biographer who copies only facts incurs no risk of an injunction; he has not taken copyrighted material"
  (Salinger, para 19).
- Unpublished and unlawfully published sources are treated differently.
  The Berne, United Kingdom, and European Union texts above require a work lawfully made available.
  In the European Union that means "with the authorisation of the copyright holder
  or in accordance with a non-contractual licence or a statutory authorisation" (Spiegel Online, para 89).
  In the United States no "per se rule regarding unpublished works" exists
  ([Wright v Warner Books][wright], para 30),
  and the statute says that being unpublished "shall not itself bar a finding of fair use" (17 U.S.C. § 107).
- Quotation marks make a claim about the words.
  "In general, quotation marks around a passage indicate to the reader
  that the passage reproduces the speaker's words verbatim",
  and a deliberate alteration counts as knowing falsity for libel only
  when it "results in a material change in the meaning conveyed by the statement"
  ([Masson][masson]; a public-figure defamation case, not a copyright rule).
  The Berne Convention gives authors a right to object to "any distortion,
  mutilation or other modification" that would prejudice their honour or reputation
  (Article 6bis(1), paraphrased in its last clause).
- A summary of a free text can be a separate protected work.
  A publisher's short headnotes that summarise judicial opinions were held original,
  and copying them to train a competing legal-research tool was not fair use
  ([Thomson Reuters v Ross][ross], Third Circuit, filed 29 September 2026;
  an interlocutory appeal from partial summary judgment on 2,243 headnotes).
  The court left open headnotes that copy opinion text verbatim (footnote 5).
  No later opinion in the appeal was on [GovInfo][ross-govinfo] by 2026-11-20;
  whether rehearing was sought is a docket question (see "Open questions").
- No decision was found on quoting a hardware or software manual into commentary.
  The nearest authority read is SAS v WPL, on manuals copied into a manual, which [R0-01][r01] records.
  One web search was run; no case-law database was searched.

### Quoting: statutes, judgments, and official texts

- Works of the United States federal government have no United States copyright
  ([17 U.S.C. § 105(a)][usc105]),
  and "no reporter has or can have any copyright in the written opinions delivered by this court"
  ([Wheaton v Peters][wheaton]).
- A separate, judge-made rule, the government edicts doctrine, also reaches state judges and legislators.
  It covers judges' "non-binding works
  (such as headnotes and syllabi)",
  but not works by those "who lack the authority to make or interpret the law, such as court reporters"
  ([Georgia v Public.Resource.Org][georgia]).
- In the United Kingdom, Acts and Crown works are in copyright
  ([CDPA sections 163 and 164][cdpa30]) and are licensed openly.
  The [Open Government Licence version 3.0][ogl] asks reusers to "acknowledge the source of the Information",
  and [legislation.gov.uk][lgu-help] states that its content is under that licence "except where otherwise stated",
  with content derived from EUR-Lex reused under Commission Decision 2011/833/EU.
- Judgments on the National Archives' Find Case Law service, which [R0-01][r01] used for English cases,
  are under the [Open Justice Licence version 2.0][ojl].
  It requires that a reuser "do not mislead others or misrepresent the Information or its source" and remove documents
  that are "subsequently no longer published" or "have been replaced by a revised version".
- That licence excludes "computational analysis of the Information (including indexing by search engines)".
  The service [defines it][ojl-permission] as "using automated
  or algorithmic methods to process large numbers of judgments systematically —
  including using AI or large language models (LLMs)",
  and lists "downloading judgments one at a time as you need them" and "quoting or citing judgments in your work"
  as outside it.
  The pages give no number for "large numbers".
- Agent sessions that follow the [research guide's][guide-sources] rule,
  that English judgments are fetched one at a time as each is needed,
  match the service's own example of use outside the exclusion; bulk or scripted fetching of judgments is not done
  (inference from the two texts).
  The rework of 2026-11-20 fetched two judgments that way.
- The [Court of Justice][curia-copyright] says "Editorial content
  and the case-law can be reproduced provided the source is acknowledged",
  and that "Only the versions of these documents that are published in the Reports of Cases
  or the EU Official Journal are authentic" (copyright and legal notices).
  For Commission documents, the conditions of reuse "may include" "the obligation not to distort the original meaning
  or message of the documents" ([Commission Decision 2011/833/EU Article 6(2)(b)][dec833-6]).
  The EUR-Lex legal notice was not read; the Court's and the Commission's own terms are quoted instead.
- Japan's [Copyright Act][jp-act] excludes laws and court judgments from protection,
  and translations of them "made by a national or local government agency" (Article 13, unofficial translation).
  The [Ministry of Justice][jp-moj] says of its translations that they "are not official texts" and
  that "Only the original Japanese texts of the laws and regulations have legal effect".
- Canada lets anyone reproduce federal enactments
  and federal court decisions "provided due diligence is exercised in ensuring the accuracy of the materials reproduced
  and the reproduction is not represented as an official version" ([Reproduction of Federal Law Order][ca-order]).
- Australia's Federal Register of Legislation is under the Creative Commons Attribution 4.0 licence,
  except the Commonwealth Coat of Arms and where otherwise noted ([terms of use][au-terms]).
  The terms for Australian court judgments were not obtained.
- Several of these permissions are conditional on accuracy.
  A cut or stale quotation of a text reused under the Open Justice Licence
  or the Canadian order can breach its reuse terms as well as a note's own standard (inference).

### Quoting: licences on the source

- A Creative Commons licence does not restrict what an exception allows.
  "For the avoidance of doubt, where Exceptions and Limitations apply to Your use, this Public License does not apply,
  and You do not need to comply with its terms and conditions"
  ([CC BY 4.0][ccby] section 2(a)(2); the same words are in the [no-derivatives 4.0 licence][ccbynd]).
  Which exception applies depends on the country of use,
  so a note read worldwide cannot assume one exception covers every reader (inference).
- Beyond an exception, CC BY 4.0 requires the licensee to retain, if supplied, identification of the creator,
  a copyright notice, a notice that refers to the licence, a notice that refers to the disclaimer of warranties,
  and a link to the material; to "indicate if You modified the Licensed Material"; and to state the licence
  (section 3(a)(1)).
  These may be met "in any reasonable manner based on the medium, means, and context" (section 3(a)(2)).
- "Adapted Material" is material in which the licensed work is "translated, altered, arranged, transformed,
  or otherwise modified in a manner requiring permission" (CC BY 4.0 section 1(a)).
- Text under CC BY-SA 4.0 can be adapted into a GPLv3 work, one way only; [R0-01][r01] records the bare fact.
  The compatibility was declared on 8 October 2015 ([Creative Commons, compatible licences][cc-compat]).
  When it is used "both licenses apply and downstream users must comply with both licenses",
  though a downstream user may meet the conditions of both "in the manner dictated by the GPLv3"
  ([Creative Commons, ShareAlike compatibility: GPLv3][cc-gplv3]).
- The [GNU licence list][gnu-list] adds a limit,
  read in a capture of 18 November 2026 because gnu.org did not answer on 2026-11-20:
  "you can not license your adapted CC BY-SA works under the terms of 'GNU GPL version 3, or
  (at your option) any later version'", unless Creative Commons is named as proxy under GPLv3 section 14.
  [R0-03][r03] decides the repository's notice.
- CC BY-SA 3.0 text does not reach a GPL-3.0 note through version 4.0.
  BY-SA 3.0 lets an adaptation be distributed "only under the terms of: (i) this License;
  (ii) a later version of this License with the same License Elements ...;
  (iii) a Creative Commons jurisdiction license ...; (iv) a Creative Commons Compatible License"
  ([BY-SA 3.0 legal code][ccbysa3], section 4(b)).
  For 3.0, "Currently, no non-CC licenses have been designated as compatible" (compatible licences).
- GPLv3 compatibility is stated for "your contributions to adaptations of BY-SA 4.0 materials" (same page).
  So a 3.0 work can be adapted under 4.0, and the adapter's own contributions can then go under GPLv3,
  but the 3.0 material inside stays under 3.0's section 4(b), which names no GPL route (inference from both texts).
  No page read says the two steps work.
- Quotation under an exception is unaffected by any of this:
  nothing in BY-SA 3.0 restricts "uses free from copyright or rights arising from limitations or exceptions"
  (section 2).
  Which licences notes may take text from beyond an exception is [R0-03][r03]'s question.
- A no-derivatives licence does not license sharing adapted material (BY-ND 4.0 section 2(a)(1)(B)).
  Creative Commons says that "Generally,
  no derivative work is made of the original from which the excerpt was taken
  when the excerpt is used to illuminate an idea or provide an example in another larger work"
  ([FAQ][cc-faq]; not the licence).
  A translated excerpt of such a source, or a rewording close enough to need permission, would be adapted material
  (inference from section 1(a)).
- "NonCommercial means not primarily intended for or directed towards commercial advantage or monetary compensation"
  ([BY-NC 4.0][ccbync] section 1(i)).
  GPL-3.0 lets recipients use the notes commercially,
  so non-commercial text taken beyond an exception could not carry the GPL grant (inference).
- The GNU Free Documentation Licence requires a modified version to be released "under precisely this License"
  ([FDL 1.3][fdl] section 4).
- Licence texts have their own terms.
  The GPL may be copied verbatim "but changing it is not allowed"
  ([GPLv3][gpl3] header), and it "acknowledges your rights of fair use or other equivalent" (section 2).
  Creative Commons makes its legal code available under CC0 ([Creative Commons policies][cc-policies]).
- Standards bodies license excerpts on conditions.
  The IETF allows copying "unmodified portions" of RFCs if each is "attributed to IETF and identifies the RFC",
  with all legends included "where any substantial portion of the text of an IETF RFC,
  and in any event where more than one-fifth of such text, is reproduced"
  ([Trust Legal Provisions 5.0][tlp] section 3(c)(iii)).
- The W3C allows copying its documents "or portions thereof" with a link, the copyright notice, and the status.
  It grants no right to make derivatives, except derivatives in software, in supporting materials,
  and "in documentation of software" made to implement the specification, with a notice
  ([W3C Document License, 2023][w3c]).
- A source with a bare copyright notice, or one that forbids reproduction, such as the Arm manuals in [R0-01][r01],
  can be quoted only under an exception (inference).
- Site terms are a separate layer.
  In the United States a contract has been held to waive the reverse-engineering latitude that copyright allows
  (`R0-01`, Bowers, the Federal Circuit applying First Circuit law); other circuits may differ (`R0-01`, from memory).
  In affirming a preliminary injunction for a scraper of a public site,
  the Ninth Circuit remarked that "other causes of action, such as copyright infringement, misappropriation,
  unjust enrichment, conversion, breach of contract, or breach of privacy, may also lie"
  ([hiQ v LinkedIn][hiq], 2022; a remark, not a holding).
  Whether terms bind a reader who never agrees to them was not settled by any source read.

### Quoting: what careful publishers do

- Wikipedia permits "Brief quotations of copyrighted text" to "illustrate a point, establish context,
  or attribute a point of view or idea", requires an inline citation and quotation marks or a block quote,
  and says "Extensive quotation of copyrighted text is prohibited"
  ([Non-free content guideline][wp-nfc], 7 October 2026).
  It states no word cap.
- Its [style manual][wp-mos] requires that "the wording of the quoted text must be faithfully reproduced",
  calls this the "principle of minimal change",
  and says not to omit text "where doing so would remove important context or alter the meaning of the text"
  (Manual of Style, 16 November 2026).
- It warns that "close paraphrasing can still violate copyright"
  (Manual of Style),
  and that "Translation from a foreign language is a form of paraphrase"
  ([Close paraphrasing][wp-cp], an explanatory supplement).
- For sources in other languages, "Translations published by reliable sources are preferred over translations by
  Wikipedians, but translations by Wikipedians are preferred over machine translations" ([Verifiability policy][wp-v]).
- Legal citation practice marks changes: "Any substitutions into quoted material should be bracketed",
  a significant mistake in the original is kept and followed by "[sic]",
  and an omission inside a sentence takes an ellipsis ([The Indigo Book][indigo], rules 38 and 39).
  Some changes are exempt, such as dropping a footnote call number that follows a quotation (rule 38).
- The Indigo Book sets quotations of 50 or more words as a block (rule 40.1).
  Wikipedia's Manual of Style sets a block at "more than about forty words or a few hundred characters".
  These are formatting thresholds, not permission limits.
- Research-integrity guidance says "Any verbatim text taken from another source must be enclosed in quotation marks
  and be accompanied by a citation", and that a paraphrase must use "our own syntactical structure"
  ([Miguel Roig's guide][ori], guidelines 2 and 4, as published by the United States Office of Research Integrity;
  about plagiarism, not copyright).
- The research for this note met these failure modes (research log for this note).
  Pages print a summary before the authoritative text: the syllabus before a Supreme Court opinion,
  a headnote before a Canadian judgment, a staff summary at the head of a Ninth Circuit opinion.
  The agent's first draft quoted a syllabus as the opinion and caught it by position.
  Raw text carries footnote marks, paragraph numbers, line-break hyphens, and recognition errors inside sentences,
  so "character for character" needs a stated rule for them.

### Constants: single values and short sequences

- Facts are not protected, and a compilation is protected only in its selection and arrangement.
  "The first person to find and report a particular fact has not created the fact;
  he or she has merely discovered its existence",
  and a later compiler "remains free to use the facts contained in another's publication to aid in preparing a competing
  work, so long as the competing work does not feature the same selection and arrangement" ([Feist][feist], a case about
  a telephone directory).
  Copyright in a compilation "does not imply any exclusive right in the preexisting material"
  ([17 U.S.C. § 103(b)][usc103]).
- Feist concerns discovered facts.
  A hardware constant was chosen by an engineer, and Feist does not say which side of its line that falls (inference).
- United States appeals courts have denied protection to assigned numbers and codes for three different reasons.
  Part numbers "are not protected by copyright
  because they are mechanically produced by the inflexible rules" of a numbering system
  ([Southco][southco], Third Circuit en banc, para 40).
  "The random and arbitrary use of numbers in the public domain does not evince enough originality"
  ([Toro][toro], Eighth Circuit, para 17).
  Command-code values that did show thought were excluded as scènes à faire,
  where "much of the expression in Mitel's command codes was dictated by the proclivities of technicians
  and limited by significant hardware, compatibility, and industry requirements"
  ([Mitel][mitel], Tenth Circuit, para 52; on a preliminary injunction).
- One circuit went the other way on a taxonomy:
  "even the short description and the number are original works of authorship"
  ([American Dental Association v Delta Dental][ada], Seventh Circuit, para 5).
  The Sixth Circuit later called that reasoning "rather opaque" ([ATC][atc], para 24).
  No Supreme Court decision read resolves the difference.
- A sequence that compatibility requires is treated as functional.
  "To the extent compatibility requires
  that a particular code sequence be included in the component device to permit its use,
  the merger and scènes à faire doctrines generally preclude the code sequence from obtaining copyright protection"
  ([Lexmark][lexmark], Sixth Circuit, para 36).
  That program came in two versions, of 37 and 55 bytes (para 9), and fed a checksum.
  The court vacated a preliminary injunction, and held only that "On this record,
  pure compatibility requirements justified SCC's copying" (para 56).
- A value that designers chose freely, such as a palette or a waveform table, is not addressed by any decision read.
  The nearest holdings turn on why a value is used, not on who chose it:
  values that hardware and compatibility dictate were excluded in Mitel (para 52) and Lexmark (para 36).
  An emulator must reproduce a console's palette and waveforms to be compatible,
  so the same reasoning would apply to the values an emulator needs (inference).
- In European Union law, a table whose order the hardware's index fixes has no creative arrangement,
  under the test in [Football Dataco][dataco] (para 39) quoted under "Constants: tables and collections"
  (inference from that test).
- The risk that remains is a court treating a designer's original choice of a set of colours as creative selection,
  as the Seventh Circuit treated codes and descriptions (American Dental Association, para 5).
  The constants convention in the [research guide][guide-constants],
  single values with a source and tables in the note's own arrangement, limits that risk (inference).
- No court fixed a length.
  The examples read are Sega's "20 bytes of initialization code plus the letters S-E-G-A", doubted in a footnote
  ([R0-01][r01]), the 37 and 55 bytes in Lexmark, and nine-digit part numbers in Southco.
  The same Sega footnote contrasts a key-generating program in which "Creativity and originality went into the design"
  ([Sega v Accolade][sega], note 7, describing Atari v Nintendo).
- The names of data structures and the order of their fields, copied to read a file format, were held unprotected:
  the names because a name such as "color" "merges with the idea or function of the file",
  and their organisation because it "is dictated mainly by external factors"
  ([Baystate v Bentley][baystate], District of Massachusetts 1996, after a bench trial; one district court).
- Where a required sequence makes a console display its maker's mark,
  the Ninth Circuit held the maker "primarily responsible for any resultant confusion",
  on a record with no alternative way to gain access known to competitors
  (Sega v Accolade, part IV; a preliminary-injunction appeal).
  [R0-02][r02] covers trademarks.
- Typefaces are a separate rule in the United States.
  "Typeface as typeface" is not subject to copyright ([37 C.F.R. § 202.1(e)][cfr202]).
  In 1988 the Copyright Office concluded
  that "typefaces created by a computerized-digital process are also uncopyrightable"
  ([policy decision][fr-typeface], 53 Federal Register 38110; an agency decision, read from a scanned text).
- Since 1992 the Office registers a program that generates a typeface if the program has enough original authorship,
  but not the typeface it produces ([Compendium][comp700], section 723, citing 57 Federal Register 6201).
  The Compendium adds that "Pictorial or graphic elements that are incorporated into uncopyrightable characters
  or used to represent an entire letter or number may be registrable" ([section 906.4][comp900]).
  One district court held outline font software protectable
  ([Adobe v Southern Software][adobe], Northern District of California 1998, on summary judgment;
  read in a transcription with visible errors, and not quoted for that reason).
- In the United Kingdom a typeface design is protected as an artistic work,
  but using it "in the ordinary course of typing, composing text, typesetting or printing" does not infringe
  ([CDPA section 54(1)][cdpa54]).
  Twenty-five years after the end of the year in which articles for producing it were first marketed,
  "the work may be copied by making further such articles" ([section 55(2)][cdpa55]).
  No source read says whether a console's character set is a "typeface" in this sense,
  or whether an emulator's font data is such an "article"; if they are,
  the 25-year rule would cover consoles marketed before 2000 (inference).
- In the European Union, "typographic typefaces"
  and "graphic symbols" are products whose appearance can be a registered design, "excluding computer programs"
  ([Directive 98/71/EC Article 1(b)][designdir]), for at most 25 years from filing ([Article 10][designdir10]).
  There a registered design, not copyright, is the route; whether any console font was registered was not searched.
  That directive has since been recast (from memory; not checked).
- No case on a console's character ROM or on a logo bitmap in a cartridge header was found,
  in the United States or elsewhere; outside the United States, nothing beyond the statutes above was searched.
- No court decision was found on whether a hash of a copyrighted file is protected or infringes.
  Three web searches were run; no case-law database was searched.

### Constants: tables and collections

- European Union law protects a database by copyright only where "the selection
  or arrangement" is "the author's own intellectual creation" ([Directive 96/9/EC][dbdir] Article 3(1)).
  That is not met "when the setting up of the database is dictated by technical considerations,
  rules or constraints which leave no room for creative freedom"
  ([Football Dataco][dataco], para 39).
  "the significant labour and skill required for setting up that database cannot as such justify such a protection
  if they do not express any originality in the selection or arrangement of that data" (para 46).
- A second right protects investment, not creativity.
  The maker of a database made with "substantial investment in either the obtaining,
  verification or presentation of the contents" may prevent "extraction and/or re-utilization of the whole
  or of a substantial part" ([Article 7(1)][dbdir7]).
  "The repeated and systematic extraction and/or re-utilization of insubstantial parts" is also barred
  where it conflicts with normal exploitation or unreasonably prejudices the maker's legitimate interests
  (Article 7(5)).
  A lawful user may take "insubstantial parts of its contents" "for any purposes whatsoever"
  (Article 8(1)), and a contract term to the contrary is "null and void" (Article 15).
- "Obtaining" means "the resources used to seek out existing independent materials and collect them in the database.
  It does not cover the resources used for the creation of materials which make up the contents of a database"
  ([British Horseracing Board][bhb], para 42).
  Extraction does "not imply direct access to the database concerned" (para 53).
- No ruling read places the measurement of a device on either side of that line.
  Measuring records behaviour the console already has, which reads as seeking out existing materials,
  so a project that measured and published a large table could hold the right,
  and taking a substantial part of someone else's measured table could infringe it (inference).
- The maker is "the person who takes the initiative and the risk of investing", which "excludes subcontractors"
  (Directive 96/9/EC, recital 41).
  For a volunteer wiki no source read names who that is.
- The right applies to databases whose makers or rightholders are nationals of, or habitually resident in,
  a member state, or companies with their registered office, central administration,
  or principal place of business there; agreements can extend it to databases made in third countries (Article 11).
  [R0-05][r05] records each hub's licence and location, which is where that test is applied.
- The United Kingdom has its own right on the same test,
  limited since 31 December 2020 to makers from the United Kingdom and the Isle of Man
  ([Copyright and Rights in Databases Regulations 1997][dbregs], regulations 13, 16, and 18).
- The [Data Act][dataact], Regulation (EU) 2023/2854, excludes the database right for some data:
  "The sui generis right provided for in Article 7 of Directive 96/9/EC shall not apply when data is obtained from
  or generated by a connected product or related service falling within the scope of this Regulation" (Article 43).
  A connected product must be "able to communicate product data via an electronic communications service,
  physical connection or on-device access" (Article 2(5)), and the Regulation applies from 12 September 2025
  (Article 50).
- The exclusion is tied to the Regulation's scope and its user-access rights (recital 112).
  No source read decides whether a console measured in a test rig is within it, and the Regulation's purpose,
  users' access to product data, suggests that it is not aimed at reference tables (inference).
- In practice a lawful user may take insubstantial parts for any purpose
  (Article 8(1)), and the convention of single values in the note's own arrangement keeps notes inside that (inference).
- Japan protects a database "that, by reason of the selection
  or systematic construction of information contained therein, constitutes a creation"
  ([Copyright Act][jp-act] Article 12-2(1), unofficial translation).
- A collection can be a trade secret although each entry is public.
  "Even if quotes aren't trade secrets,
  taking enough of them must amount to misappropriation of the underlying secret at some point"
  ([Compulife v Newman][compulife], Eleventh Circuit 2020, slip opinion at 45; about a database of insurance quotes,
  built from insurers' public rate tables, that its owner sold to agents in encrypted form).
  After a bench trial on remand, the Eleventh Circuit affirmed in 2024
  that the defendants misappropriated the trade secret by scraping, and sent the copyright ruling back for new findings
  ([Compulife, 2024][compulife2024]).
  [R0-01][r01] records that reverse engineering is not an improper means.

### Constants: how references and projects treat them

- Asahi Linux, a project's own view, of Apple's open-source code under the APSL,
  which it does not allow to be used directly: "you can take inspiration from register names
  (since those are effectively hardware documentation;
  we do not consider mere last-level register names to be copyrightable),
  but do not copy whole #define blocks or include files".
  "Register values and command buffers are usually not considered copyrightable",
  with an exception "where code or large blobs of data are uploaded to the hardware",
  and firmware blobs uploaded to the hardware "cannot be copied as-is" ([Asahi copyright policy][asahi]).
- Wine's [Clean Room Guidelines][wine] are the strictest constants practice in this note's evidence.
  The live page refuses scripts; the latest capture, of 17 July 2024, holds a revision "last edited on 6 July 2022".
  Under "Don't" it says "Don't write a test program that prints out the values of an internal table"; under "Do",
  a test program is preferred, and "if a test program will do, don't look at any Microsoft doc or headers".
- The same page bars looking at Microsoft source code "even if it's made 'public' under some license",
  except code under the MIT licence or another licence compatible with the LGPL.
  It adds "Don't look at ReactOS code either
  (not even header files)",
  because "A lot of it was reverse-engineered using methods that are not appropriate for Wine".
  Wine therefore treats an internal table as off limits even when a test obtains it,
  and treats headers as material to avoid where a test will do (observed).
- The [ReactOS audit page][reactos] lists, under "Proposed standards for the audit",
  signs that a function was not written cleanly: among them "'unknown' arguments given values",
  "functions for which there is NO DOCUMENTATION", and "functions with undocumented magic numbers" (archived copy).
  The test is whether a public source or a test exists for the value, not whether numbers are protected (inference).
  The page does not say that the standards were adopted.
- Pan Docs is released under CC0 ([History][pandocs]).
  Neither its [contributing guide][pandocs-contrib] nor the [gbdev contribution page][gbdev-contrib] states a rule on
  where values may come from (text search of five pages).
  Its history page says that the 2008 wiki version used "Martin Korth's 2001 revision as a baseline".
  A dedication covers only rights its contributors hold (inference).
- Pan Docs prints the cartridge-header logo as a hexadecimal dump,
  describing it as "a bitmap image that is displayed when the Game Boy is powered on" which "must match"
  or "the boot ROM won't allow the game to run" ([Pan Docs, The Cartridge Header][pandocs-header]).
  The page makes no statement about copyright or trade mark in the logo.
  This note does not record the bytes.
- Registries of constants state their status in three ways.
  IANA and the IETF dedicate any rights they hold in the registries under CC0,
  and say they "believe" the registries "consist primarily of factual information that is unlikely to be protectable
  as a matter of copyright law" ([IANA licensing terms][iana]).
  The [PCI ID Repository][pciids] offers a licence and says "The database is a compilation of factual data,
  and as such the copyright only covers the aggregation and formatting".
  The Linux kernel requires a licence identifier in all source files, headers of definitions included,
  and no rule was found that treats register headers as unprotected facts ([kernel licensing rules][kernel]).
- An identifier can be restricted without a copyright claim.
  USB-IF says its vendor identifiers "may not be sold, transferred,
  or used by others" except in special circumstances and then only with its prior written approval
  ([USB-IF, Getting a Vendor ID][usbif]); the page names no legal basis.
- Catalogues publish hashes of copyrighted images as identifiers.
  No-Intro says "We do NOT help or encourage users to download or otherwise obtain any of the listed dumps"
  ([No-Intro, home page][nointro]).
  Its Data Usage License, last updated on 11 September 2026, says that, unless the website states otherwise,
  its data "may be freely used" "to the extent that the website operator owns or controls the applicable rights"
  ([No-Intro, Data Usage License][nointro-terms]).
- [Redump's front page][redump] and [download page][redump-dl] state no licence and carry a bare copyright notice;
  the front page also reports a 2026 dispute with former staff over the project's forum and wiki.
  The [libretro database][lrdb] imports both under CC BY-SA 4.0, and its README names no permission from them.
  [MAME's documentation][mame] says "software list items should represent the original media",
  and its command reference prints checksums for images, including ones labelled as a BIOS.
- No dispute about the legal status of hash lists was found (three web searches).
  The searches returned only disputes about keys and the distribution of games
  (research log), which [R0-02][r02] covers.
- Keys are never recorded.
  That is the project's standing rule ([ADR 0001][adr-context], "Already decided").

### Pseudo-code and algorithm descriptions: the law

- One court of appeals placed algorithms between a program's purpose and its code,
  at a level it called less prone to generalizations.
  A program "can often be parsed into at least six levels of generally declining abstraction: (i) the main purpose,
  (ii) the program structure or architecture, (iii) modules, (iv) algorithms and data structures, (v) source code,
  and (vi) object code" ([Gates Rubber][gates], Tenth Circuit 1993).
  "The intermediate levels of abstraction, such as structure, sequence, organization, and the like,
  are less prone to generalizations" (same opinion).
- A process is free; its description may not be.
  "Although processes themselves are not copyrightable, an author's description of that process,
  so long as it incorporates some originality, may be protectable" (Gates Rubber).
  That court did not hold that algorithms are always unprotected; it sent the question back to the trial court.
- The Second Circuit said of this area: "To be frank,
  the exact contours of copyright protection for non-literal program structure are not completely clear"
  ([Altai][altai]; a remark, not a holding).
- One district court ruled on two exhibits, both titled "Plain Language Level", describing the same calculation.
  A data-flow and control-flow account of the method "merged with the algorithm itself" and was unprotected.
  A flow chart of "the particular steps taken" was protectable, though "close to the merger line"
  ([Harbor Software][harbor], Southern District of New York 1996, adopting an expert's recommendations).
  The exhibits were the claimant's own summaries of its program,
  and "protectable" there meant only that the element went on to be compared.
- Two older district-court statements treat programming from a detailed description
  as translation. "it would probably be a violation to take a detailed description of a particular problem solution,
  such as a flowchart or step-by-step set of prose instructions, written in human language,
  and program such a description in computer language"
  ([Synercom][synercom], Northern District of Texas 1978; a footnote remark).
  A program written from a step-by-step trading manual infringed the manual
  ([Williams v Arndt][williams], District of Massachusetts 1985).
  Both predate Altai; their later treatment is listed under "Open questions".
- The United States Copyright Office registers descriptions of programs, but not as programs.
  "Diagrams, models, outlines, pseudocode,
  or other types of works that illustrate or describe the structure or order of operation
  for a computer program may be registered ..., provided that they contain a sufficient amount of original authorship",
  but they "may not be claimed as computer programs"; the Office accepts them as text or as artwork
  ([Compendium][comp700], section 724; the Office's manual, not binding on courts).
  This is the only primary source found that names pseudo-code in a statement of legal status.
- European Union law counts design material
  as part of the program. "the term 'computer programs' shall include their preparatory design material"
  ([Directive 2009/24/EC][softdir] Article 1(1)),
  where "a computer program can result from it at a later stage" (recital 7).
  Logic and algorithms are unprotected "to the extent that" they "comprise ideas and principles" (recital 11).
  United Kingdom law lists "preparatory design material for a computer program" as a literary work
  ([CDPA section 3(1)(c)][cdpa3]).
- English courts separate a program's design from its function. "a written work consisting of a specification of the
  functions of an intended computer program will attract protection as a literary work.
  But the functions themselves do not" ([Nova v Mazooma][nova], para 51).
  Copyright "extends to protecting the design of the program", which is distinct from "protecting its functionality"
  ([SAS v WPL][sas], High Court 2010, para 232).
- In the English cases that favour reimplementation, the defendants had not seen the code.
  In Navitaire the judge said that what was left was the business function,
  "because none of the code was read or copied by the defendants"
  ([Navitaire v easyJet][navitaire], para 129);
  in SAS there was "no suggestion" of access to the source code
  (SAS v WPL, 2010, para 3),
  and that judgment rests on functionality falling "on the wrong side of the line" (para 236).
  They do not decide what follows when the person who writes the description has read the code.
- A description can carry a work across.
  A work "may be indirectly copied where the defendant's work is created through the intermediary of a verbal
  description of the claimant's work provided the description is sufficiently precise to allow the defendant to
  reproduce the claimant's work in substantial part" ([Edozo v Valos][edozo], January 2026, para 23).
  That is a statement of general law about artistic works, in a strike-out ruling of a specialist first-instance court.
  The same ruling held that steps which are part of a program's functionality "are not a form of expression" of its
  source code (para 58).
- No appeal judgment in Edozo was published on Find Case Law by 2026-11-20:
  a [search for "Edozo"][edozo-search] lists only the judgment of 21 January 2026.
  Whether permission to appeal was sought is not on that service.
- Ibcos, in its author's own words as he quoted them in the Court of Appeal:
  "The true position is that where an 'idea' is sufficiently general, then even if an original work embodies it,
  the mere taking of that idea will not infringe.
  But if the 'idea' is detailed, then there may be infringement.
  It is a question of degree" (Jacob LJ, quoting Ibcos [1994] FSR 275 at page 291, in Nova v Mazooma, para 33).
  The report itself was not obtained; the FSR is a paid series.
- Japan excludes from a program work's protection "the programming language, coding conventions,
  or algorithms used to create the work"
  ([Copyright Act][jp-act] Article 10(3), unofficial translation; [R0-01][r01] cites it).
- The 1978 [WIPO Model Provisions][wipo-model] define the thing a convention must regulate.
  A "program description" is "a complete procedural presentation in verbal, schematic or other form,
  in sufficient detail to determine a set of instructions constituting a corresponding computer program".
  They protect it with the program, and their commentary gives the example of a flow chart so detailed
  that each block "could be easily transformed into a corresponding set of machine-readable instructions".
  These were model provisions for national laws; no source read says any country enacted them as written.
- No source read gives a measurable threshold for when a description becomes that detailed.
- Changing the notation does not remove structure.
  Non-literal copying is "paraphrased or loosely paraphrased rather than word for word"
  ([Oracle v Google][oracle], Federal Circuit 2014, quoting Lotus),
  and [R0-01][r01] records that a translation is a derivative work.

### Pseudo-code and algorithm descriptions: practice

- Accounts of clean rooms describe prose.
  Phoenix's specifications were written "without including any examples of actual code",
  and the isolated programmer was given written descriptions of problems but no coded solutions
  ([PC Magazine 1984][pcmag], secondary; [R0-01][r01]).
  Altai's programmers were given "a description of the ZEKE operating system services";
  the [opinion][altai] says no more about its form.
- Asahi Linux has the reverse-engineering side write "clean documentation of the hardware".
  For Apple's open-source code under the APSL,
  it lets contributors use the code as a reference but tells them not to "reimplement identical code flows
  or algorithms" ([Asahi copyright policy][asahi]).
  The page does not define clean documentation and does not mention pseudo-code.
- One law-firm article lists what to remove from a clean-room specification: "code, pseudocode, data structures,
  naming and anything else that carries the original's expression" ([Marks & Clerk][marks], 29 October 2026, secondary).
  It cites no authority for the list.
  No clean-room or contribution policy was found that says whether pseudo-code may cross a wall (three web searches).
- One standards body treats pseudo-code as software; two others license code apart from prose without naming it.
  The ITU's guidelines for its Recommendations define software, "For purposes of these Guidelines",
  to include "A set of instructions written in any programming language
  (including pseudo code and reference implementations)",
  and also "data flow charts" ([ITU Software Copyright Guidelines][itu], edition 3.0, 7 December 2011).
- The IETF licenses "components intended to be directly processed by a computer" under the Revised BSD licence,
  apart from its prose; its [list of such components][tlp-code] includes "tables of values"
  and "classical programming code" and does not name pseudo-code ([Trust Legal Provisions 5.0][tlp], section 4).
  The W3C puts programming code that its documents mark as code examples under its software licence
  ([W3C Document License, 2023][w3c]).
- A maker's pseudo-code can be restricted.
  Arm now writes its instruction pseudo-code "in a language known as ASL1",
  in a guide whose notice says "No part of this document may be reproduced in any form by any means without the express
  prior written permission of Arm Limited" ([Arm, Architecture Specification Language Readers' Guide][arm-asl], 29
  October 2025).
- A machine-readable Arm package carries a three-clause BSD-style notice on a [third-party mirror][aarchmrs].
  Arm's own page for it returned HTTP 403 on 2026-11-19 and again on 2026-11-20,
  and whether the package holds the pseudo-code was not confirmed.
  The mirror stays walled in the register, and no claim here needs the package's contents.
  [R0-05][r05] covers processor manuals.
- Community references mix prose, code, and pseudo-code under one licence.
  Pan Docs releases "everything (content, sources, code, figures) under the CC0 license",
  and its [contributing guide][pandocs-contrib] gives a notation for pseudo-code, such as `:=` for assignment
  ([Pan Docs, History][pandocs]).
  Whether Pan Docs pages themselves hold pseudo-code was not checked.
- Tests are the alternative to description.
  [R0-01][r01] records Wine's practice and the test-vector projects.
  They describe behaviour by input and output, the level that Navitaire, SAS,
  and Edozo place outside a program's copyright (inference).
- [ADR 0001][adr-everytier] says that prose "stops where code begins" and that a reader writes "functional descriptions,
  with no code and no listings" ([walled tier][adr-walled]).
  It does not say on which side pseudo-code falls; the recommendation under "Options and trade-offs" answers that.
- An agent asked for pseudo-code may produce recalled code in another notation, with no fetch for the hook to see
  (inference from the memorisation studies in `R0-01`).
  No study of that was found.
  Under the recommendation that pseudo-code counts as code, notes hold none, so the question does not bear on notes;
  recalled prose is a matter for [R0-06][r06]'s similarity controls.

### Vocabulary: where the terms are contested

Each row records usage in the sources named; the conflicts are this note's reading of them (inference).

| Term | Usages that conflict |
|---|---|
| emulator, simulator | Near-synonyms; simulator as the more exact; "simulate" for not running original code |
| cycle accuracy | Correct relative timing of everything; correct durations only; a pass rate against tests |
| high-level, low-level | One component's method; a whole emulator's; a kind of renderer |
| core, frontend | A library behind an interface; per-system code in one program; a launcher |
| JIT, dynarec, recompiler | Synonyms; or "recompiler" as the class and JIT as one kind |
| BIOS, boot ROM, firmware | Any maker code needed; code that only boots; code in a chip; all system software |
| ROM, image, dump | A chip; a file copied from one; a copy of a disc; the act of copying |
| save state, save data | Mostly kept apart, under several spellings |
| cycle | A clock period; a machine cycle; a CPU cycle of several master clocks |
| decompilation, disassembly | Two techniques in engineering; one heading in European Union law |

- The standard vocabulary defines an emulator as a "device, computer program,
  or system that accepts the same inputs and produces the same outputs as a given system"
  and cross-refers it to simulator ([SEVOCAB][sevocab], attributed there to ISO/IEC/IEEE 24765:2017;
  the standard itself is sold, not free to read, from memory).
  It has no entry for a JIT compiler, dynamic recompilation, a hypervisor, or a clean room, nor for BIOS, frontend,
  or save state.
- SEVOCAB does define an interpreter, firmware, a dump, a core, and pseudocode, in general computing senses: a dump,
  for instance, is a "display of some aspect of a computer program's execution state",
  and decompile and disassemble are entries of their own (SEVOCAB, re-queried by the second pass).
- TASVideos treats a simulation as the more exact:
  an emulator "does not attempt to precisely model the state of the device being emulated;
  it only attempts to reproduce its behavior", unlike a simulation ([TASVideos glossary][tasvideos]).
  PPSSPP says it "simulates the BIOS and the entire internal operating system" ([PPSSPP FAQ][ppsspp]).
- mGBA's author writes that cycle accuracy "has a specific meaning,
  but it is often misunderstood and over-broadly applied",
  and defines it "loosely" as "every single aspect of the emulated system occurs at the correct time relative to
  everything else".
  The same article separates "cycle-count accuracy",
  in which "each component acts atomically and takes the correct amount of time" ([mGBA blog, 2017][mgba-blog]).
- Projects qualify the word by component.
  [SameBoy][sameboy] claims "T-cycle accurate emulation of LCD timing effects";
  [MartyPC][martypc] calls its NEC V20 core "Cycle-based, but not fully cycle-accurate",
  and says its 8088 core passes a test suite "with 99.9997% cycle-accuracy" (project READMEs).
- The Emulation General Wiki offers a ladder from low accuracy to transistor level and classes bsnes
  as "partially cycle-accurate" ([Emulation accuracy][egw-accuracy]);
  mGBA's article calls higan "(formerly bsnes)" "the most well-known example of a cycle-accurate emulator".
  The wiki is anonymous and names no licence ([Copyrights][egw-copyrights]).
  "Cycle-exact", "pixel-accurate", and "hardware-accurate" were found only undefined;
  "instruction-level" and "scanline-based" were not found as accuracy labels (research log: search of the saved pages).
- mGBA's author applies high-level and low-level emulation to "programmable components
  that are not part of the emulated software itself", such as "system software (as on the PSP and 3DS)".
  It adds that "LLE implementations, however, require copies of the code to be emulated" (mGBA blog).
- Dolphin uses the pair as names of two back ends for one component, the DSP: "Available DSP emulation engines are HLE
  (High Level Emulation)
  and LLE (Low Level Emulation)" ([Dolphin README][dolphin-readme], at commit f762387 of 3 October 2026).
  The Emulation General Wiki applies the words to whole emulators:
  "An HLE emulator would take the data to be processed", and "An LLE emulator (e.g., cycle-accurate SNES emulation)"
  ([High and low-level emulation][egw-hle]).
- libretro defines its terms by an interface: a program "gets turned into a single library file
  (called a 'libretro core')",
  and the frontend's responsibility "is to provide all the implementation-specific details,
  such as video/audio/input drivers" ([libretro API page][libretro-api]).
  MAME uses "front-ends" for third-party tools "to make system and software selection simpler"
  ([MAME documentation][mame]). ares calls the per-system parts of one program "emulator cores" ([ares README][ares]).
- Dolphin treats a JIT as one kind of recompiler: "There are many different types of recompilers",
  and a JIT "recompiles small blocks of code while the program is running".
  Its cached interpreter collects code into blocks "exactly like a JIT" but keeps decoded instructions,
  not host machine code ([Dolphin progress report, September 2024][dolphin-pr]; that describes Dolphin's design).
  PPSSPP writes of a JIT, "also known as a Dynarec" (PPSSPP FAQ).
  A static recompiler's README describes translating binaries "into C code that can be compiled for any platform"
  ([N64Recomp README][n64recomp]).
- Firmware has a narrow and a wide sense.
  WiiBrew: "Fixed low-level code written directly into a programmable chip.
  The Wii's system menu software is NOT firmware"
  ([WiiBrew glossary][wiibrew]).
  libretro: "A BIOS file is a copy of the operating system used by the hardware that a Core is emulating"
  ([libretro BIOS guide][libretro-bios]).
- Pan Docs says "boot ROM" for the Game Boy's built-in program and "SGB BIOS" for another on the same page
  ([Power-Up Sequence][pandocs-power]).
  GBATEK lists a "BIOS ROM" of the Game Boy Advance ("GBA Memory Map"; Sources says why it is not linked).
  A maker's consumer pages say "system software" ([PlayStation support][psn]).
  [ADR 0001's closed tier][adr-closed] names "a console's BIOS, boot ROM,
  or system software" and defines none of the three; the [glossary][glossary-bios] now defines them,
  and their place in the ADR is a recommendation below.
- "ROM" names a device in the standard vocabulary and a file in emulation: "In emulation,
  ROM is a copy of the contents (data) of the program chip inside a game cartridge",
  and "An image may be a ROM or a copy of disc/disk contents" ([TASVideos glossary][tasvideos]).
  MAME's documentation says "images of the original ROMs, CDs, hard disks or other media".
- Save states and a game's own saves are kept apart.
  PPSSPP keeps "SAVEDATA (for real PSP saves)" apart from "PPSSPP_STATE (save states)" ([PPSSPP FAQ][ppsspp]).
  TASVideos heads an entry `Savestate` and defines it as "A snapshot of the system state at given moment",
  and says a "saved game is sometimes also called SRAM" (TASVideos glossary).
- Community words carry legal assumptions.
  [3dbrew][3dbrew] defines a dump as extracting "the protected contents" of a chip or disc;
  [WiiBrew][wiibrew] defines a backup as a dump kept against damage and adds
  that "it is officially considered piracy by Nintendo" (project glossaries; the second is the wiki's characterisation).
  Statutes say "back-up copy" in the European Union and "archival" in the United States
  ([Directive 2009/24/EC][softdir] Article 5(2); [17 U.S.C. § 117(a)(2)][usc117]).
- Legal terms are fixed by statute and differ by jurisdiction.
  [17 U.S.C. § 1201][usc1201] defines circumvention twice, for access controls and for copy controls.
  European Union law heads Article 6 "Decompilation", for acts United States cases call disassembly.
  "Fair use" is a United States doctrine
  ([17 U.S.C. § 107][usc107]);
  [Directive 2001/29/EC][infosoc] Article 5 lists specific exceptions and does not use the term.
  [R0-02][r02] covers the law.
- The words "taint" and "provenance" are used in more than one sense inside this repository.
  [ADR 0001's tainted tier][adr-tainted] attaches to a reference document; Asahi's "taint" attaches to code
  ("taint the resulting code", [Asahi LLM policy][asahi-llm]); [R0-01][r01] also calls Altai's first program tainted.
  "Provenance" is used for the origin of a fact and for the origin of code, and is defined in neither place.
- Game decompilation projects describe rebuilding source that reproduces a specific ROM, identified by a hash
  (READMEs of three closed-tier projects, prose only; research log, not re-checked,
  because the source guard blocks these closed sources).
  The phrase "matching decompilation" was found used but not defined.

### Vocabulary: numbers, units, and names

- Hexadecimal notation differs by hub: a `$` prefix in Pan Docs and an `h` suffix in GBATEK (observed).
- Pan Docs states its notation as a rule.
  Its [contributing guide][pandocs-contrib] says "Hexadecimal values are uppercase and prefixed with `$`",
  with no prefix where context makes hexadecimal clear, such as addresses and opcode lists, and zero padding;
  "Use binary prefixes (Ki, Mi) for Bytes"; and "Binary numbers must be accompanied by the 'binary' word"
  ("Units and prefixes", at commit 7165790 of 20 November 2026).
- The NESdev wiki states no notation rule on the pages checked.
  Its [project pages][nesdev-pages] number 12, among them a [Manual of Style page on RFC 2119][nesdev-rfc] keywords.
  Its [Glossary][nesdev-glossary] (revision 22604) has no notation entry, and ["Before the basics"][nesdev-basics]
  (revision 24395) links Wikipedia's article on binary prefixes "(KiB, MiB)" and states no rule.
  Pages titled "Hexadecimal", "Number notation", and "Nesdev wiki:Manual of Style" do not exist,
  and the wiki's search interface returned no results for any query, so the search was of titles, not text.
  Other hubs are [R0-05][r05]'s survey.
- Binary sizes are written three ways: "KiB" in Pan Docs, "KBytes" and bare "K" in GBATEK,
  and "KB" in [melonDS's FAQ][melonds].
- A passage on [NIST's page][nist], adapted from an IEEE newsletter article of 1997,
  says that "When discussing computer memory, most manufacturers use megabyte to mean 2^20 = 1 048 576 bytes,
  but the manufacturers of computer storage devices usually use the term to mean 1 000 000 bytes".
  NIST itself says the IEC binary prefixes "are not part of the International System of Units (SI)"
  (NIST, Prefixes for binary multiples; the page prints the power as a superscript).
  Google's style guide says "Don't use MB if you mean MiB" ([Google, units of measurement][google-units]).
- A bare "cycle" is ambiguous.
  Pan Docs defines a dot as "one 2^22 Hz (≅ 4.194 MHz) time unit" with "4 dots per Normal Speed M-cycle"
  ([Pan Docs, Rendering][pandocs-rendering]).
  mGBA's article says the word "refers to the fundamental unit of timing in digital logic: the clock cycle",
  and that a console's bus and processors can run at different clock speeds ([mGBA blog][mgba-blog]).
- Frame rates are quoted at different precision: "59.73 Hz" in one Pan Docs table ([Specifications][pandocs-specs]),
  and "59.7275005696058" in [TASVideos' platform table][tasvideos-fps].
- "NTSC" and "PAL" are used as labels for handhelds with no television output and for game versions
  (TASVideos platform table; a decompilation README).
- Console names differ by market.
  The roadmap uses North American names; one open-tier emulator lists both, as in "Sega Genesis / Mega Drive";
  hardware references use maker model codes, as in "Game Boy (DMG)" and "Game Boy Color (CGB)"
  ([jgenesis README][jgenesis]; Pan Docs).
- No quotation from the NESdev wiki's prose is given in this section:
  on 2026-11-19 the wiki refused fetches made with a browser's identification,
  and the summarising fetch tool returned two wordings for one glossary entry (research log).
  Its raw wikitext was read on 2026-11-20 for the notation search above.

### How projects structure and enforce a glossary

- Three shapes are in use.
  One page with a heading for each term: the [Rust Reference][rustref], [TASVideos][tasvideos], and [3dbrew][3dbrew].
  One table: the [rustc development guide][rustc].
  One file for each term: Kubernetes, where "The raw data for glossary terms is stored at the glossary directory,
  with a content file for each glossary term"
  ([Kubernetes, Hugo shortcodes][k8s]);
  the CNCF glossary, where "Each glossary term is stored in a markdown file"; and MDN, where each term is its own page
  ([MDN glossary guide][mdn]).
- The CNCF glossary gives each entry its own frontmatter, including a status of "Completed", "Feedback Appreciated",
  or "Not Started" ([CNCF style guide][cncf]).
  MDN handles a term with several meanings through a disambiguation page (MDN glossary guide).
- Glossary rules restrict copied definitions.
  MDN: "Don't copy and paste from other definitions or content on the internet", and "Don't use generated text either."
  CNCF forbids copying "unless you are quoting and contributing it to them", and adds:
  "If you like a particular section of a definition, paraphrase it in your own words."
  MDN prefers a first paragraph of "no more than two sentences" and ends each entry with a "See also" section.
- The ISO/IEC drafting rules give a checkable form,
  read here in a [third-party rendering][iso-dir] of the 2018 edition (secondary).
  A definition "shall be written in such a form that it can replace the term in its context";
  "Only one definition per terminological entry is allowed", with the domain marked where a term names two concepts;
  "Circular definitions, which repeat the term being defined, are not allowed"; and synonyms are sorted into preferred,
  admitted, and deprecated terms.
- The same rules prefer systematic order: "Alphabetical order is the least preferred order."
  A borrowed entry must cite its source and say what was changed.
  Whether a later edition changed these rules was not checked.
- The standards vocabulary has three permission layers ([SEVOCAB results page][sevocab]).
  ISO/IEC definitions may be copied "providing that its source is cited";
  IEEE definitions only if the statement "Copyright©, 2026, IEEE.
  Used by permission." stays with them; and the PMI definitions carry "Copyright and all rights reserved."
- Google separates a word list of usage rulings from definitions: "If you're looking for a technical definition,
  then it's often a good idea to check the authoritative documentation on the topic"
  ([Google, word list][google-words]).
  It advises: "If your document is introducing the term, define the term.
  If your document is introducing many terms, collect the definitions into a glossary"
  ([Google, Technical Writing One][google-tw]).
- A community glossary can limit the authority of an entry: its definition of a video game "is strictly for TASVideos,
  and is not meant to objectively define a video game in all contexts" ([TASVideos glossary][tasvideos]).
- This repository already expected a glossary before this note.
  The Vale rule [`Terms.yml`][terms-yml] was then an empty substitution map whose comment said "The glossary fills this
  map", and the [requirement template][req-template] refers to "terms defined in the glossary" (read locally).
- The structure checker can enforce a heading for each term.
  A contract with a repeatable heading pattern, required labelled text in each entry,
  and unique headings reported a missing field and a duplicate term on a sample file
  (tested locally with [mdschema][mdschema] 0.16.0).
  Its table rule checks the number of tables, their columns, and their header names;
  its text rules apply to a section as a whole, so no rule checks each row (tested locally with mdschema 0.16.0).
  A link to a table row has no anchor to check.
  Its README documents no rule for the order of repeated sections and no rule that compares two files.
- The link checker verifies links from a note to a glossary heading, and fails on a term that does not exist
  (tested locally with lychee 0.24.2).
  It also resolves explicit heading identifiers, which it calls "Custom ID fragments" ([lychee documentation][lychee]).
  Without such an identifier a term's spelling is its address, and renaming the term breaks every link to it
  (inference; whether GitHub honours explicit heading identifiers was not checked).
- Vale can map a discouraged term to a preferred one: "`substitution` associates a string with a preferred form"
  ([Vale documentation][vale-sub]).
  The rule does not fire inside a code span
  (tested locally with Vale 3.27.0),
  and the repository's rule runs at error level,
  so it would fail a note that quotes a source using the discouraged word outside a code span,
  unless the passage is wrapped in a Vale comment that switches the rule off
  (inference; the comment switch was tested locally with Vale 3.27.0).
  Vale documents that it "supports comment-based configuration in Markdown files" ([Vale, Markdown][vale-md]).
  The project does not use that switch around quotations; the recommendation for options 1 to 5 says why.
- The repository names a vocabulary, `Rustalgia`, with an empty accept list,
  at the top level of its [Vale configuration][vale-ini].
  Named there, its generated rules need the built-in `Vale` style, which the configuration does not list,
  so it enforces nothing.
  "A vocabulary named in `[*]` applies to every file, with rules of its own that are on everywhere"
  ([Vale, vocabularies][vale-vocab]; both cases tested locally with Vale 3.27.0).
- Vale's documented example of a first-use rule for abbreviations flags letter-only hexadecimal values such
  as `BFFF` written outside a code span (tested locally with Vale 3.27.0); the repository has no such rule.
- Before this note, a glossary fitted no contract and had no row in the status table (read locally).
  The [status rules][docs-status] say "A document moves forward only",
  that an approved document needing a material change is replaced, and that small corrections are made in place;
  a glossary that every later note extends strains the first two (inference).

### Citations: link rot and pinning

- Cited pages disappear or change.
  "Link rot refers to the URL no longer serving up any content at all.
  Reference rot, an even larger phenomenon,
  happens when a link still works but the information referenced by the citation is no longer present, or has changed"
  ([Zittrain, Albert and Lessig 2014][zittrain]).
  That study found that "more than 70% of the URLs" in three Harvard law journals "and 50% of the URLs within U.S.
  Supreme Court opinions suffer reference rot".
- A page that answers is not proof.
  Of 353 Supreme Court links that returned a success code, "only 76% still led to the cited material"
  (same study; its own table gives 277 of 353, 78.5%).
  This repository's [link checker configuration][lychee-toml] accepts any success code, and 429 as well,
  so it cannot detect that kind of change (inference).
- "A quarter of all webpages that existed at one point between 2013 and 2023 are no longer accessible,
  as of October 2023" ([Pew Research Center 2024][pew]; the measure counts dead pages only, not changed ones).
- Four official addresses used for this note had moved or died on the day of research,
  among them the United States plain-language guidance and an intelligence-community directive (research log).
- Addresses in code spans are not link-checked, so their rot is silent
  (tested locally: lychee 0.24.2 skips an address in a code span unless `--include-verbatim` is set,
  and this repository does not set it).
  [R0-01][r01] held 117 such addresses, one of them an archive capture (counted on 2026-11-19).
  The [research guide][guide-shape] now makes every Sources title a link, so that the checker reads it,
  and keeps a code span only for an address a reader must not open.
- Sources offer version pins of different kinds.
  GitHub: "instead of using a branch name in the URL", "put a commit ID.
  This will permanently link to the exact version of the file in that commit"
  ([GitHub documentation][gh-permalinks]).
  arXiv: "Without the version number", "the identifier refers to the most recent version of the article",
  and it recommends citing the version ([arXiv help][arxiv]).
  A wiki page can be pinned by its revision number (observed).
- On 2026-11-19, `R0-01` cited GitHub files by branch, arXiv papers without a version, and one archive copy by year only
  (observed in the note).
- Published law comes in versions that are not all official.
  European Union: "Consolidated texts have no legal effect" ([EUR-Lex][consleg]);
  the same page calls them documentation.
  United Kingdom: revised legislation incorporates later amendments,
  with an aim to update "within a maximum of three months" ([legislation.gov.uk help][lgu-understanding]).
  United States: "The eCFR is not an official legal edition of the CFR" ([eCFR][ecfr]),
  and a Supreme Court slip opinion "is subject to formal revision before publication"
  ([slip opinion notice][google-slip]).
- Paragraph numbers survive re-pagination and slip-opinion page numbers do not (inference).
  An English practice direction requires the Official Law Reports where a judgment is reported there,
  and for an unreported judgment allows the official transcript, "not the handed-down text of the judgment,
  as this may have been subject to late revision"
  ([Practice Direction: Citation of Authorities 2012][pd-citation], paras 6 and 10; it does not bind a research note).

### Citations: archives

- The Internet Archive offers single-page captures that "can be cited, shared, linked to"
  ([Internet Archive help][ia-save]),
  and publishes limits for its capture interface, among them "Max captures per day for a URL = 5"
  ([Save Page Now 2 documentation][spn2], updated 22 July 2026).
- A capture can be withheld or removed.
  "Pages may not be archived due to robots exclusions and some sites are excluded by direct site owner request"
  ([general information][ia-general]),
  and on removal requests "We do not make any guarantees beforehand about the outcome" ([removal requests][ia-removal]).
  The Archive's [FAQ][ia-faq] relays a Nieman Lab report
  that some news publishers have begun blocking the Wayback Machine over concerns about AI scraping
  (FAQ first published 15 May 2026; an account by a party to the dispute).
- The Internet Archive's terms of use were not read: the live page needs JavaScript,
  and the help-centre address for them returned 404 on 2026-11-20.
  The project cites only existing captures and requests none, which needs no account (inference).
- A capture address holds a 14-digit time stamp;
  an address with only a year resolves to the nearest capture and is not a pin
  (Save Page Now 2 documentation; the second point is inference).
- English Wikipedia stopped using archive.today in February 2026,
  citing "the site using editors' and readers' computers to run a denial-of-service attack and evidence
  that the website has tampered with some archived pages"
  ([Wikipedia, Archive.today guidance][wp-archivetoday];
  the underlying facts are that community's findings and were not checked).
  The service's own [FAQ][archiveph] names no operator and says PDF files are not saved reliably:
  "Most of them are not saved or saved as blank page".
- Perma.cc refuses automated requests.
  Harvard-hosted posts from [2019][perma-2019] and [2021][perma-2021] describe ten free links and paid plans
  for users without a sponsoring library
  (read through a summarising tool only, because the posts refused raw fetches; secondary).
- Perma.cc's [terms of service][perma-terms], read in a capture of 15 July 2026,
  say that users "may not be able to modify,
  take down or delete links or User Submitted Content that you direct us to store",
  and that Perma.cc may "delete or disable access to any links ... in our sole discretion".
  They do not state the free-link allowance.
  The service itself thus states the recall problem that the Internet Archive's removal page implies.
- [WebCite][webcite], a service built for citations, says "We are currently not accepting archiving requests".
- A software hash identifier is computed "directly from the digital objects they refer to,
  by anyone that has access to a copy of those objects",
  and its durability "depends on the artifact it identifies being permanently archived"
  ([SWHID specification 1.2][swhid]; [SWHID FAQ][swhid-faq]).
  Computing a directory or revision identifier for a walled or closed repository would need a copy of its code,
  which [ADR 0001][adr] restricts; an identifier for one prose file needs only that file (inference).
- The United States Supreme Court keeps its own copies:
  "an attempt is made to capture in PDF format the material cited in an opinion"
  ([Supreme Court, Online Sources Cited in Opinions][scotus-cited]).
- Wikipedia's practice is a live address, an archive address, an archive date,
  and optionally the supporting quotation stored in the citation,
  which "can also provide insurance against failure of the chosen web archiving service"
  ([Wikipedia, Link rot][wp-linkrot]; a how-to page).
- A capture that the project requests is a copy on a third party's servers.
  The project can ask for its removal, but "We do not make any guarantees beforehand about the outcome of a request"
  (Internet Archive, removal requests).
  If the page were later classed as tainted or leaked, the copy and its address could remain (inference).
  [R0-01][r01] records that the rule lacks a procedure for a source later found to be tainted; none was found.
- The source guard blocks a tool call that pairs an archive address with a restricted or unregistered repository,
  because "archive" is one of its trigger words (read in [`source-guard.sh`][guard]; met once during this research).
  A writer session therefore cannot re-check an archived README of such a repository,
  and no session can for a closed or unregistered one
  (read in the script: a reader session is not blocked for a walled repository).

### Claim status and verification

- [R0-01][r01] marks where a claim came from: read in the original
  (no marker), "(secondary)", "(from memory)", or "(inference)".
  It labels authority in prose, such as a holding, a consent judgment, or a party's own account,
  and records verification once, in its Scope.
- Other vocabularies record different things.
  Wikipedia's tags record a later reviewer's result:
  "Failed verification" is used only when an editor has checked a cited source and found
  that "the source does not support what is contained in the article" ([template documentation][wp-fv]).
- The United States intelligence standard and the IPCC grade likelihood in fixed words with numeric bands,
  and the bands differ: "likely" is 55 to 80% in one and 66 to 100% in the other
  ([ICD 203][icd203]; [IPCC guidance note 2010][ipcc]).
  ICD 203 also says that products should "distinguish statements
  that convey underlying intelligence information used in analysis from statements that convey assumptions or judgments"
  (section D.6.e(3), "Properly distinguishes between underlying intelligence information and analysts' assumptions and
  judgments"; read in a capture of 22 May 2026, because the live file refuses scripts).
- GRADE rates a body of evidence at four levels ([Cochrane Handbook, chapter 14][cochrane14]).
  None of these vocabularies has a class for a claim made from memory (inference).
- Wikipedia's policy says "A source may be considered primary for one statement but secondary for a different one"
  ([No original research][wp-nor]).
  It prefers secondary sources for interpretation; this project prefers primaries,
  so the word matches and the preference is reversed (inference).
- The fact-checking code asks for "the best available primary, not secondary,
  sources of evidence wherever suitable primary sources are available",
  and for sources identified "in such a way that users can replicate their work".
  Its applicants check "all key elements of claims against more than one named source of evidence"
  unless one source is the only relevant one ([IFCN Code of Principles][ifcn], principle 2).
- Cochrane requires "(at least) two people working independently" to extract outcome data,
  and reports one study in which that "resulted in fewer errors than data extraction by a single author followed by
  verification by a second" ([Cochrane Handbook, chapter 5][cochrane5]; the study itself was not read).
  This project's second pass is the weaker of those two designs (inference).
  The Handbook prints its own version line: chapters are cited as "[last updated October 2019]" in "version 6.5"
  (chapter 5).
- Tools that write with citations misattribute.
  A study of commercial legal research tools defines a hallucination as "a response
  that contains either incorrect information or a false assertion that a source supports a proposition",
  and found that the tools "each hallucinate between 17% and 33% of the time"
  ([Magesh and others 2024][magesh], version 1).
- A broadcaster found that "13% of the quotes sourced from BBC articles were either altered from the original source
  or not present in the article cited": eight such quotes, divided by the 62 responses that included BBC quotes
  ([BBC 2025][bbc]; the BBC is an interested party).
  A preprint on research agents reports "citation accuracy ranging from 40--80% across systems"
  ([DeepTRACE 2025][deeptrace], abstract only; its definition was not read).
- A court sanctioned lawyers who "submitted non-existent judicial opinions with fake quotes
  and citations created by the artificial intelligence tool ChatGPT"
  ([Mata v Avianca][mata], Southern District of New York 2023, sanctions order).
- The fetch tool used here shortens quotations by design: asked for verbatim sentences,
  it answered that it would keep quotations within a 125-character limit (research log).
- No source read has a mark for "this quotation was compared with the raw page".

### The tooling a convention must fit

Read in this repository's configuration or tested locally on 2026-11-19, except where marked.

- The prose checker rejects thirteen filler words and phrases and ten wordy phrases at error level,
  and applies them inside quotation marks and block quotations but not inside code spans.
  Several standard scales, whose grades include a filler word,
  fail the check in running text unless the rule is switched off around them with a Vale comment
  (tested locally), and the rule also rejects the first word of the term `just-in-time` (research log).
- The formatter puts each sentence on its own line and breaks after some abbreviations followed by a capital or a digit.
  In a test it broke after "v." and "Art." before a capital or a digit, after "Cir." in running text,
  and after "pp." before a capital but not before a digit (tested locally with rumdl 0.3.4).
- No line may exceed 120 characters.
  A long address passes alone on its line or as a link destination; a long table row fails and is not reflowed.
- The [topic-study contract][topic-contract] allows four frontmatter fields,
  so a verification record cannot go there without a contract change.
- Nothing fixes the English variety.
  The spelling checker sets no locale and accepted both spellings of ten test words; the documents use British forms,
  such as "licence" as the noun, in seven files against one.
- The spelling checker reads inside code spans.
  On a scratch file, typos 1.52.2 with the repository's [configuration][typos] reported misspellings in prose,
  inside an inline code span, inside a fenced block, and inside an identifier split at an underscore,
  where it reported both parts; it exited with status 2 (tested locally with typos 1.52.2, 2026-11-20).
  Words made only of capitals and digits are skipped by the configuration's `extend-ignore-words-re`,
  so letter-only hexadecimal such as `BFFF` passes (read locally).
- Dates in frontmatter are `YYYY-MM-DD` by rule; [R0-01][r01] writes event dates in words.
- The keywords of RFC 2119 mark requirements in specifications:
  [RFC 2119][rfc2119] limits them to what is required "for interoperation or to limit behavior which has potential
  for causing harm" (section 6).
  A research note states findings and options and has no requirements to mark (inference).

## Options and trade-offs

The options answer five separate questions and can be combined.
Options 1 to 5 concern the glossary, 6 to 9 quoting, 10 to 13 constants and tables, 14 to 17 descriptions of algorithms,
and 18 to 21 citations and verification.
The recommendation for each group is at the end of the section.

### 1. One glossary file with a heading for each term

- **What:** a single document in which each term is a heading, with its definition and labelled lines beneath.
- **Costs:** one file that many later changes touch; without explicit heading identifiers,
  a term's spelling becomes its link address;
  the file's status has to be reconciled with the rule that an approved document needing a material change is replaced
  (small corrections are made in place).
- **Gains:** the structure checker can require fields in each entry and reject duplicates,
  and the link checker verifies links from notes to terms (tested locally).
- **Used by:** the [Rust Reference][rustref], [TASVideos][tasvideos], and [3dbrew][3dbrew].

### 2. One glossary file holding a table

- **What:** a single table of terms and meanings.
- **Costs:** rows have no anchors, so a link can reach only the table and the link checker cannot verify a term;
  the 120-character limit caps each definition; the structure checker has no rule for each row.
- **Gains:** compact, and quick to scan.
- **Used by:** the [rustc development guide][rustc].

### 3. One file for each term

- **What:** a folder of small files, each with frontmatter and a fixed body.
- **Costs:** many files and a naming rule; an index written by hand, because this repository has no site generator.
- **Gains:** each term can carry its own status and history, and a contested term can have a page for each sense.
- **Used by:** [Kubernetes][k8s], the [CNCF glossary][cncf], and [MDN][mdn].

### 4. Definitions inside each note, with an index

- **What:** every note defines its terms at first use, and a glossary page only lists terms and links to the notes.
- **Costs:** two notes can define one term differently with nothing to detect it;
  a change of preferred term is more than a small correction, so approved notes stay inconsistent.
- **Gains:** a definition sits beside its evidence; no shared file to maintain.
- **Used by:** ISO documents, whose [drafting rules][iso-dir] provide a terms and definitions clause (secondary);
  [Google's advice][google-tw] for documents with few terms.

### 5. A word list enforced by the prose checker

- **What:** rulings of the form "use this, not that", applied by a substitution rule; it can accompany any option above.
- **Costs:** at error level the rule also fires on quotations that contain the discouraged word,
  and research notes quote sources that say `savestate`, `dynarec`, and `BIOS`;
  the vocabulary files enforce nothing under the present configuration, though a vocabulary named in `[*]` would;
  a Vale comment can switch a rule off around a quotation.
- **Gains:** consistent spelling without review effort; the rule file already existed.
- **Used by:** [Google's word list][google-words], as guidance; this repository's [`Terms.yml`][terms-yml].

### 6. No quotations

- **What:** notes state every point in their own words, with a pinpoint citation.
- **Costs:** the reader cannot see a source's limiting words; close paraphrase can still infringe and can distort;
  nothing shows whether the note-taker read the passage or a summary of it.
- **Gains:** no protected text is reproduced, and nothing needs checking character by character.
- **Used by:** no publisher read forbids quotation outright.
  One appeals court suggested that a "paraphrase or a summary" may serve where the full text is not needed
  ([ASTM v Public.Resource.Org][astm], D.C. Circuit 2018; guidance on remand, not a holding).

### 7. Short attributed quotations under a numeric cap

- **What:** a quotation may run to a set number of words, or a set share of the note, and no further.
- **Costs:** no source read supplies the number, so the cap is a project rule that may be read as a guarantee;
  a cap tempts cutting a quotation at the point where its limit is stated.
- **Gains:** a reviewer or a script can check it; the note's own text stays dominant.
- **Used by:** nobody as a permission rule.
  The numbers found are formatting thresholds of 40 and 50 words
  ([Wikipedia][wp-mos]; [The Indigo Book][indigo])
  and the IETF's one-fifth trigger for legends ([Trust Legal Provisions][tlp]).

### 8. Quotation rules by class of source

- **What:** quote freely from law and licences that are unprotected or openly licensed,
  sparingly from published prose in copyright, verbatim only from sources that forbid adaptation,
  and never from unpublished, leaked, or tainted material.
- **Costs:** the class of a legal text differs by country;
  a publisher's summary of a free text is a different class from the text; each source's terms must be recorded.
- **Gains:** follows the condition of lawful availability in the Berne, United Kingdom, and European Union texts;
  it is stricter than United States law on unpublished works; agrees with [ADR 0001][adr].
- **Used by:** Wikipedia, which treats public-domain and compatibly licensed text differently from non-free text
  ([Non-free content][wp-nfc]).

### 9. Exact text, marked changes, and a named part

- **What:** a quotation is admitted only when its words were confirmed against the raw page;
  every omission and insertion is marked; no omission may change the meaning;
  and the citation says which part of the document the words come from.
- **Costs:** tooling and time; raw text has artefacts, so a normalisation rule must be stated;
  the prose checker rejects some words even inside quotations, which pushes authors toward other passages.
- **Gains:** addresses the failures met while researching and checking this note
  (research log):
  cut quotations, wrong attribution, and a summary's words presented as the source's;
  meets the accuracy conditions in several reuse licences.
- **Used by:** Wikipedia's "principle of minimal change" ([Manual of Style][wp-mos]); legal citation practice
  ([The Indigo Book][indigo]); the second pass on [R0-01][r01].

### 10. Any single value with a cited source

- **What:** a note may state any address, size, bit position, timing, or identifier if it names where it was found.
- **Costs:** the cited reference may not say where its own values came from; a cited source can be wrong.
- **Gains:** every value can be re-checked; fits the cases on facts and short identifiers.
- **Used by:** Xenia's provenance comments ([R0-01][r01]); the test proposed, and not shown to be adopted,
  in the [ReactOS audit page][reactos].

### 11. Values only with a second source or a test

- **What:** a value enters a note only when two independent sources, or a reproducible test, confirm it.
- **Costs:** slower; independence is hard to show when references descend from one another;
  tests need lawful hardware or software.
- **Gains:** guards accuracy, and shows the value is a discoverable fact and not one author's document.
- **Used by:** Wine's tests as the record ([R0-01][r01]); the fact-checking code's rule of more than one source
  ([IFCN][ifcn]).

### 12. Tables built in the note's own arrangement

- **What:** single facts are taken freely, but a source's table, list, or block of definitions is not reproduced;
  the note compiles its own, with a source for each row.
- **Costs:** needs judgement about when a set of values becomes the source's table; where hardware dictates the order,
  an independent arrangement may be identical anyway.
- **Gains:** addresses compilation copyright; keeps provenance for each row.
  The database rights still turn on how much of a protected database's contents is taken.
- **Used by:** Asahi Linux, which forbids copying "whole #define blocks or include files" from Apple's APSL code
  ([Asahi copyright policy][asahi]); Wine, which bars tests that print an internal table ([Wine][wine]).

### 13. No bytes of firmware, with or without an exception for short identifiers

- **What:** notes never hold keys, logo bitmaps, fonts, or code taken from a console or a game,
  and describe them instead; a variant allows a short identifier that a format or a check requires,
  with the reason stated.
- **Costs:** a reader must find the bytes elsewhere; no court fixed a length for the variant;
  the question returns when code is written.
- **Gains:** avoids at once the doubts about pictorial works, trade marks, and extracted firmware;
  the variant matches the facts on which United States courts declined protection.
- **Used by:** the project's standing rule on keys ([ADR 0001][adr-context]); Asahi's rule on firmware blobs
  ([Asahi copyright policy][asahi]).
  Pan Docs does the contrary and prints a header logo ([The Cartridge Header][pandocs-header]).

### 14. Prose, tables, and diagrams only

- **What:** behaviour is described in sentences, tables of inputs and outputs, formulas, and state or timing diagrams,
  with no code and no pseudo-code.
- **Costs:** long prose for exact behaviour, and room for ambiguity;
  prose that follows a source's steps one by one can still carry its sequence.
- **Gains:** matches the recorded accounts of clean-room specifications and the wording of [ADR 0001][adr-everytier].
- **Used by:** Phoenix by its [press account][pcmag]; the specification
  that one [law-firm article][marks] describes (secondary), for its exclusion of code and pseudo-code.
  Accolade's manual held "only functional descriptions" by its authors' account,
  but a 20 to 25 byte header file of Sega's code was added to it ([Sega v Accolade][sega]).

### 15. Pseudo-code only from maker documents or the note-taker's own tests

- **What:** pseudo-code is allowed when written from a maker's public documentation or from test results,
  and never by a session that has read an implementation of the same behaviour.
- **Costs:** provenance is needed for each block; maker documentation may forbid reproducing its own pseudo-code;
  the rule does not reach what a model recalls from training.
- **Gains:** rests on the fact that decided the favourable English cases, namely no access to the code.
- **Used by:** no project was found that states it.
  It combines the facts of [Navitaire][navitaire]
  and [SAS][sas] with the pseudo-code notation in [Pan Docs' contributing guide][pandocs-contrib].

### 16. Pseudo-code in a neutral notation, from any source

- **What:** pseudo-code is allowed everywhere, in a notation and a structure that the note-taker chooses.
- **Costs:** a changed notation leaves sequence and organisation intact, and translation is the classic infringing act;
  the [ITU][itu] counts pseudo-code as software, and the IETF and W3C license code apart from prose without naming it.
- **Gains:** precise and readable.
- **Used by:** Arm, in its [own defined language][arm-asl]; Pan Docs, whose contributing guide sets a notation for it.

### 17. Tests in place of descriptions

- **What:** behaviour is captured as executable tests or test vectors, and the note points to them.
- **Costs:** expected values need lawful hardware or a trusted source,
  and some published vectors come from emulators ([R0-01][r01]); not possible before any code exists.
- **Gains:** describes behaviour by input and output only.
- **Used by:** Wine, Mono, and Samba (`R0-01`); the test-vector projects.

### 18. Version pins in the source list

- **What:** each source carries what fixes its version: a commit, a release, a revision number, an edition,
  a paper's version, or the date to which a statute text is current.
- **Costs:** must be found for each source, and some have none;
  a code-host page of a restricted repository cannot be opened to find a commit.
- **Gains:** a later check can tell a changed page from a wrong citation.
- **Used by:** [GitHub][gh-permalinks] and [arXiv][arxiv] recommend it for their own addresses;
  [Cochrane][cochrane5] prints its own version line.

### 19. Archive copies

- **What:** each source also carries the address and date of a copy in a web archive,
  made by the project or already there.
- **Costs:** every third-party archive examined has a recorded weakness: removal on request, blocking by publishers,
  closure, or doubt about its integrity; the removal of a capture the project requests is not guaranteed;
  the source guard blocks archive addresses of restricted repositories.
- **Gains:** the citation survives link rot.
- **Used by:** Wikipedia ([Link rot][wp-linkrot]); law reviews through Perma.cc
  ([Zittrain 2014][zittrain]); the United States Supreme Court with its [own copies][scotus-cited].

### 20. The supporting quotation stored with the citation

- **What:** the words that support a claim are kept in the note, so that a reader can compare them with any copy.
- **Costs:** more third-party text in a GPL-3.0 repository, against options 6 and 7; the prose checker's filler rule.
- **Gains:** the claim stays checkable if every copy of the page disappears.
- **Used by:** Wikipedia's quotation field; the evidence files behind this note, which are not published (research log).

### 21. A verification record for each claim, or one statement for the note

- **What:** either each claim carries the result of a second check, or the Scope says once how the note was checked.
- **Costs:** marks on each claim clutter the text and need dates; one statement says nothing about what failed;
  either way the checker is a model with the same tools as the author.
- **Gains:** marks show which claims a second reader tested; one statement costs nothing.
- **Used by:** Wikipedia's dated tags for each claim
  ([Failed verification][wp-fv]);
  Cochrane's two independent extractions ([chapter 5][cochrane5]); [R0-01][r01]'s single statement.

### Recommendation

Each paragraph below is the recommendation for one group of options, with its reasons.
All five match what the [research guide][guide] and the [glossary][glossary] already do; the owner decides.

**Glossary (options 1 to 5).**
Option 1, one glossary file with a heading for each term, with option 5 limited to forms that no source needs quoted
(`bootrom`, `savestate`).
It is the only shape that both the structure checker and the link checker verify
(tested locally);
a table has no anchors, per-term files need an index written by hand, and definitions spread across notes drift unseen,
so notes keep first-use definitions only as pointers to the glossary.
At error level a wider word list would fail quotations of `dynarec` and `BIOS`,
and no Vale comment switch is used around quotations:
a quotation the checker rejects is replaced by another passage or a paraphrase
([research guide, "Quoting"][guide-quoting]).

**Quoting (options 6 to 9).**
Options 8 and 9 together, with option 7's cap of 60 words as a reviewer's check and not a permission rule.
Every regime read conditions quotation on lawful availability, attribution, and an extent fitted to the purpose,
which option 8 follows, and option 9 prevents the failures met in this research: cut quotations, misattribution,
and a syllabus quoted as the opinion.
No law gives a number, so the cap is only a project limit;
option 6 loses limiting words and does not avoid infringement by close paraphrase.

**Constants and tables (options 10 to 13).**
Options 10, 12, and 13 with the short-identifier variant
(at most 16 bytes, with the reason stated),
and option 11's second source or test in two cases only:
a value whose only source says it came from firmware or boot ROM analysis, where a hardware test is required,
and a value on which two sources disagree.
Single facts are free and the cases on numbers and codes deny protection,
while tables carry compilation and database risks that single values do not;
a blanket option 11 would stall the hardware primers,
because references descend from one another and independence is hard to show for every value.

**Algorithm descriptions (options 14 to 17).**
Option 14 now and option 17 once code exists, and not options 15 or 16:
[the proposed amendment of ADR 0001][adr] should say that pseudo-code counts as code,
for what may be read and for what any session writes.
European Union law counts preparatory design material as the program; the WIPO provisions, the ITU guidelines,
and Edozo treat a detailed enough description as carrying it;
and the favourable English cases rest on no access to code, which option 15 cannot guarantee against a model's recall.

**Citations and verification (options 18 to 21).**
Option 18, pinned versions; option 19 only as existing captures cited with a full time stamp,
never captures the project requests; not option 20; and option 21 as one statement in Scope,
with the unchecked claims listed in the pull request.
Reference rot affects most legal citations and pins let a later check tell a changed page from a wrong citation;
a requested capture cannot be recalled if the page is later classed as tainted, as Perma.cc's own terms show;
stored quotations add third-party text; and per-claim marks clutter notes when the checker has the author's tools.

## Implications for Rustalgia

- Notes that grade emulators as "cycle-accurate" will not be comparable, because sources mean different things by it.
  This feeds the functional-area map ([R1-90][r190]) and the quality targets ([R6-02][r602]);
  the [glossary's entry][glossary-cycle-accuracy] asks for a qualifier, as option 1's labelled lines allow.
- [ADR 0001's closed tier][adr-closed] turns on "BIOS, boot ROM, or system software", which it does not define,
  and its line between prose and code does not place pseudo-code.
  The recommendation is that [the proposed amendment of ADR 0001][adr] takes the glossary's definitions of the three
  as its terms, places replacement boot code under "system software", and counts pseudo-code as code.
  Because the definitions change the reach of the closed tier, the owner decides them in that amendment.
- A description written by a session that read an implementation is the case the favourable rulings leave open.
  The findings bear on whether the convention for reader sessions, and any provenance control in [R0-06][r06],
  treat the level of detail of a functional description as a control or as style.
- No source read gives a legal number for quotation length or for the length of a recorded byte sequence.
  Any cap in the conventions is a project rule; it feeds a requirement on note content,
  and [R0-03][r03] decides what the repository's licence notice says about quoted passages,
  and which licences notes may take text from beyond an exception.
- Whole tables carry risks that single values do not,
  and the European and United Kingdom database rights depend on facts the project cannot see.
  This feeds the source map ([R0-05][r05]), which records each hub's licence and location, and the hardware primers,
  which will be full of tables.
- Addresses in code spans rot silently, and `R0-01`'s citations were unpinned when this note was written.
  The [link rules][guide-shape] of 2026-11-20 put every source a reader may open behind a checked link,
  and option 18's recommendation covers pins; both apply to every note, `R0-01` among them.

## Open questions

- Was rehearing sought in Thomson Reuters v Ross after the opinion of 29 September 2026?
  GovInfo holds no later opinion; the Third Circuit docket, number 25-2153,
  on PACER or CourtListener with an access token would answer it.
- How have later courts treated Synercom and Williams v Arndt?
  A citator query, such as CourtListener's citing-opinions search with an access token or a commercial citator,
  would answer it; no finding rests on either for a holding.

## Sources

Every source below was read on 2026-11-19, and the second pass re-read them on the same day,
except where a finding says it could not.
Sources marked "(2026-11-20)" were read on that day for the rework.
Repository files named in the findings were read in the working tree on the day of the finding.

Statutes, treaties, regulations, and official guidance:

- [Berne Convention, Paris Act, Articles 6bis and 10][berne].
- [WIPO, Model Provisions on the Protection of Computer Software][wipo-model], in "Copyright", January 1978.
- 17 U.S.C. [§ 101][usc101], [§ 103][usc103], [§ 105][usc105], [§ 107][usc107], [§ 117][usc117], and [§ 1201][usc1201].
- [37 C.F.R. § 202.1][cfr202].
- [United States Copyright Office, fair use FAQ][usco-fairuse].
- United States Copyright Office, Compendium of Practices, third edition
  (28 January 2021), [chapter 700][comp700] and [chapter 900][comp900].
- [United States Copyright Office, Policy Decision on Copyrightability of Digitized Typefaces][fr-typeface],
  53 Federal Register 38110 (29 September 1988), scanned issue.
- Copyright, Designs and Patents Act 1988, [section 3][cdpa3],
  [section 30][cdpa30] and its sibling pages for sections 163 and 164, [section 54][cdpa54]
  and [section 55][cdpa55] (2026-11-20), and [section 178][cdpa178].
- [Copyright and Rights in Databases Regulations 1997][dbregs], regulations 13, 16, 18, and sibling pages.
- [Directive 2001/29/EC][infosoc], read from the Publications Office;
  [Article 5][infosoc5] re-read by the second pass at legislation.gov.uk.
- [Directive 2009/24/EC][softdir], at legislation.gov.uk, and [on EUR-Lex][softdir-eurlex].
- [Directive 96/9/EC][dbdir], as published in 1996, with recital 41
  (re-read 2026-11-20);
  [Article 7][dbdir7] re-read by the second pass at legislation.gov.uk, with sibling pages for Article 11.
- [Directive 98/71/EC, Article 1][designdir] and [Article 10][designdir10] (2026-11-20).
- [Regulation (EU) 2023/2854, the Data Act][dataact], Articles 2, 43, and 50 and recital 112 (2026-11-20).
- [Commission Decision 2011/833/EU][dec833]; [Article 6][dec833-6] re-read by the second pass at legislation.gov.uk.
- [EUR-Lex, Consolidated texts][consleg].
- [Japan, Copyright Act, unofficial translation][jp-act].
- [Japan, Ministry of Justice, Japanese Law Translation, notice on the home page][jp-moj].
- [Japan, Agency for Cultural Affairs, Copyright Textbook, fiscal 2026 edition][jp-textbook] (in Japanese).
- Canada, Copyright Act, [section 29][ca29] and [section 29.1][ca291].
- [Canada, Reproduction of Federal Law Order, SI/97-5][ca-order].
- [Australia, Copyright Act 1968, compilation of 2 April 2026, volume 1][au-act].
- [Australia, Federal Register of Legislation, terms of use][au-terms].
- legislation.gov.uk, [help page][lgu-help] and ["Understanding legislation"][lgu-understanding].
- [eCFR, Getting started][ecfr].
- [Practice Direction: Citation of Authorities (2012)][pd-citation].
- [Intelligence Community Directive 203, Analytic Standards][icd203]
  (2 January 2015, as amended),
  in the Internet Archive's capture of 22 May 2026 (2026-11-20); the live file at dni.gov refuses scripts.
- [RFC 2119][rfc2119].

Court decisions:

- [Wheaton v Peters][wheaton] (United States Supreme Court 1834).
- [Feist v Rural Telephone][feist] (United States Supreme Court 1991).
- [Masson v New Yorker Magazine][masson] (United States Supreme Court 1991).
- [Campbell v Acuff-Rose Music][campbell] (United States Supreme Court 1994).
- [Georgia v Public.Resource.Org][georgia] (United States Supreme Court 2020).
- [Google v Oracle America, slip opinion notice][google-slip] (2021).
- [Nutt v National Institute][nutt], 31 F.2d 236 (2d Cir. 1929).
- [Wainwright Securities v Wall Street Transcript][wainwright], 558 F.2d 91 (2d Cir. 1977).
- [Synercom Technology v University Computing][synercom], 462 Federal Supplement 1003 (N.D. Tex. 1978).
- [Williams v Arndt][williams], 626 Federal Supplement 571 (D. Mass. 1985).
- [Toro v R & R Products][toro], 787 F.2d 1208 (8th Cir. 1986).
- [Salinger v Random House][salinger], 811 F.2d 90 (2d Cir. 1987).
- [Wright v Warner Books][wright], 953 F.2d 731 (2d Cir. 1991).
- [Sega Enterprises v Accolade][sega], 977 F.2d 1510 (9th Cir. 1992).
- [Computer Associates v Altai][altai], 982 F.2d 693 (2d Cir. 1992).
- [Gates Rubber v Bando Chemical Industries][gates], 9 F.3d 823 (10th Cir. 1993).
- [Harbor Software v Applied Systems][harbor], 925 Federal Supplement 1042 (S.D.N.Y. 1996).
- [Baystate Technologies v Bentley Systems][baystate], 946 Federal Supplement 1079 (D. Mass. 1996).
- [American Dental Association v Delta Dental Plans Association][ada], 126 F.3d 977 (7th Cir. 1997).
- [Adobe Systems v Southern Software][adobe], case C 95-20710 RMW
  (N.D. Cal. 2 February 1998), order on summary judgment, in a transcription with visible errors.
- [Mitel v Iqtel][mitel], 124 F.3d 1366 (10th Cir. 1997).
- [Lexmark International v Static Control Components][lexmark], 387 F.3d 522 (6th Cir. 2004).
- [Southco v Kanebridge][southco], 390 F.3d 276 (3d Cir. 2004).
- [ATC Distribution Group v Whatever It Takes Transmissions & Parts][atc], 402 F.3d 700 (6th Cir. 2005).
- [Oracle America v Google][oracle], 750 F.3d 1339 (Fed. Cir. 2014).
- [American Society for Testing and Materials v Public.Resource.Org][astm], case 17-7035 (D.C. Cir. 17 July 2018).
- [Compulife Software v Newman][compulife], case 18-12004 (11th Cir. 20 May 2020).
- [Compulife Software v Newman][compulife2024], cases 21-14071 and 21-14074
  (11th Cir. 1 August 2024), pages 3 to 4 and the disposition (2026-11-20).
- [hiQ Labs v LinkedIn][hiq], case 17-16783 (9th Cir. 18 April 2022).
- [Mata v Avianca][mata], case 22-cv-1461 (S.D.N.Y. 22 June 2023), opinion and order on sanctions.
- [Thomson Reuters v ROSS Intelligence][ross], case 25-2153
  (3d Cir. 29 September 2026);
  [GovInfo's package for the appeal][ross-govinfo], last modified 31 October 2026 (2026-11-20).
- [Infopaq International v Danske Dagblades Forening][infopaq], C-5/08.
- [British Horseracing Board v William Hill][bhb], C-203/02 (para 42 re-read 2026-11-20).
- [Football Dataco v Yahoo][dataco], C-604/10 (paras 39 and 46 re-read 2026-11-20).
- [Pelham v Hütter][pelham], C-476/17.
- [Spiegel Online v Beck][spiegel], C-516/17 (para 79 re-read 2026-11-20).
- [Navitaire v easyJet][navitaire] [2004] EWHC 1725 (Ch).
- [Nova Productions v Mazooma Games][nova] [2007] EWCA Civ 219 (para 33 read 2026-11-20).
- [SAS Institute v World Programming][sas] [2010] EWHC 1829 (Ch).
- [Pasternak v Prescott][pasternak] [2022] EWHC 2695 (Ch).
- [Edozo v Valos][edozo] [2026] EWHC 93 (IPEC); [Find Case Law search for "Edozo"][edozo-search] (2026-11-20).
- [Supreme Court of Japan, 28 March 1980, case 1976(O)923][jp-sc]
  (in Japanese), and its [case page][jp-sc-page] (2026-11-20).
- [CCH Canadian v Law Society of Upper Canada][cch], 2004 SCC 13.

Licences and reuse terms:

- Creative Commons legal code: [Attribution 4.0][ccby], [Attribution-NoDerivatives 4.0][ccbynd],
  and [Attribution-NonCommercial 4.0][ccbync].
- [Creative Commons Attribution-ShareAlike 3.0, legal code][ccbysa3], sections 2 and 4(b) (2026-11-20).
- Creative Commons, [FAQ][cc-faq] and [policies][cc-policies].
- [Creative Commons, compatible licences][cc-compat] (re-read 2026-11-20).
- [Creative Commons, ShareAlike compatibility: GPLv3][cc-gplv3].
- [GNU licence list][gnu-list], in the Internet Archive's capture of 18 November 2026 (2026-11-20);
  gnu.org did not answer.
- [GNU GPL version 3][gpl3].
- [GNU Free Documentation License 1.3][fdl].
- [Open Government Licence version 3.0][ogl].
- [Open Justice Licence version 2.0][ojl], and ["When you need permission"][ojl-permission].
- Court of Justice of the European Union, [copyright notice][curia-copyright] and [legal notice][curia-legal].
- [IETF Trust Legal Provisions 5.0][tlp], and the [list of code components][tlp-code].
- [W3C Document License, 2023 version][w3c].
- [ITU Software Copyright Guidelines, edition 3.0][itu] (7 December 2011, applicable from 13 April 2012).
- [IANA, licensing terms][iana].
- [PCI ID Repository][pciids].
- [USB-IF, Getting a Vendor ID][usbif].
- No-Intro, [home page][nointro] and [Data Usage License][nointro-terms] (11 September 2026).
- Redump, [front page][redump] and [downloads page][redump-dl].
- [libretro-database, README and licence file][lrdb].
- [Arm, Architecture Specification Language Readers' Guide][arm-asl], 111069 A.a (29 October 2025).
- [Arm machine-readable specification, third-party mirror, README and notice][aarchmrs].

Project policies, documentation, and glossaries:

- Asahi Linux, [Copyright and Reverse Engineering Policy][asahi] and [LLM policy][asahi-llm].
- [ReactOS wiki, Audit][reactos], in the Internet Archive's capture of 23 April 2025.
- [Wine, Clean Room Guidelines][wine], in the Internet Archive's capture of 17 July 2024, revision 3995 (2026-11-20);
  the live page refuses scripts.
- [Linux kernel, licensing rules][kernel].
- Pan Docs: [About][pandocs-about], [History][pandocs], [The Cartridge Header][pandocs-header],
  [Power-Up Sequence][pandocs-power], [Rendering][pandocs-rendering], and [Specifications][pandocs-specs].
- Pan Docs repository, [README][pandocs-readme] and [`CONTRIBUTING.md`][pandocs-contrib],
  at commit 7165790 (2026-11-20); [gbdev contribution guidelines][gbdev-contrib].
- GBATEK, by Martin Korth, section "GBA Memory Map", read on the single page `https://problemkaputt.de/gbatek.htm`;
  the same document is in the repository `mgba-emu/gbatek` at commit `64b5087`.
  No link: the same page and repository hold the DS chapters, which hold key material.
- [3dbrew, Glossary][3dbrew].
- [WiiBrew, Glossary][wiibrew].
- TASVideos, [Glossary][tasvideos] (edited 23 August 2026), [Platform Framerates][tasvideos-fps],
  and [Site License][tasvideos-licence].
- Emulation General Wiki, [Emulation accuracy][egw-accuracy]
  (11 May 2026), [High and low-level emulation][egw-hle], and [Copyrights][egw-copyrights].
- [endrift, "Emulation Accuracy, Speed, and Optimization", mGBA blog][mgba-blog] (30 April 2017).
- [Dolphin, progress report for releases 2407 and 2409][dolphin-pr] (4 September 2024).
- [Dolphin, README][dolphin-readme], at commit f762387 (2026-11-20).
- [PPSSPP, FAQ][ppsspp].
- [melonDS, FAQ][melonds].
- libretro, [API page][libretro-api] and [BIOS guide][libretro-bios].
- [MAME documentation 0.289, "What is MAME"][mame], with its front-ends, software lists, and command reference pages.
- READMEs of [SameBoy][sameboy], [MartyPC][martypc], [jgenesis][jgenesis], [ares][ares], and [N64Recomp][n64recomp].
- READMEs of three decompilation projects
  (prose only),
  with no link because they are closed-tier sources: `https://raw.githubusercontent.com/zeldaret/oot/main/README.md`,
  `https://raw.githubusercontent.com/n64decomp/sm64/master/README.md`,
  and `https://raw.githubusercontent.com/pret/pokeemerald/master/README.md`.
- [PlayStation support, system software][psn].
- [SEVOCAB, the IEEE Computer Society and ISO/IEC JTC 1/SC 7 vocabulary, term searches][sevocab].
- NESdev wiki, [project pages][nesdev-pages], [Manual of Style/RFC 2119][nesdev-rfc], [Glossary][nesdev-glossary]
  (revision 22604), and ["Before the basics"][nesdev-basics] (revision 24395), read as wikitext (2026-11-20).
- [NIST, Prefixes for binary multiples][nist].
- Google developer documentation style guide, [units of measurement][google-units] and [word list][google-words];
  [Technical Writing One, "Words"][google-tw].
- [Kubernetes documentation, custom Hugo shortcodes][k8s] (27 November 2025).
- [CNCF Cloud Native Glossary, style guide][cncf].
- [MDN, "How to write a new entry in the glossary"][mdn] (22 October 2026).
- [The Rust Reference, glossary][rustref], and [the rustc development guide, glossary][rustc].
- Vale documentation: [vocabularies][vale-vocab], [Markdown][vale-md], [substitution][vale-sub],
  and [conditional][vale-cond].
- [mdschema, README][mdschema].
- [lychee documentation, checking anchor links][lychee].

Publishing, citation, and verification practice:

- Wikipedia, read as wikitext: [Non-free content][wp-nfc] (7 October 2026), [Manual of Style][wp-mos]
  (16 November 2026),
  [Close paraphrasing][wp-cp], [Verifiability][wp-v], [Quotations][wp-q], [No original research][wp-nor],
  [Link rot][wp-linkrot], [Archive.today guidance][wp-archivetoday]
  (17 November 2026), and [Template:Failed verification][wp-fv].
- [The Indigo Book][indigo].
- [United States Office of Research Integrity, "28 Guidelines at a Glance on Avoiding Plagiarism"][ori].
- J. Zittrain, K. Albert, and L.
  Lessig, ["Perma: Scoping and Addressing the Problem of Link and Reference Rot in Legal Citations"][zittrain],
  Harvard Law Review Forum, volume 127, page 176 (2014).
- [Pew Research Center, "When Online Content Disappears"][pew] (17 May 2024).
- [GitHub documentation, Getting permanent links to files][gh-permalinks].
- [arXiv help, identifier scheme][arxiv].
- Internet Archive help: [saving pages][ia-save], [general information][ia-general], and [removal requests][ia-removal].
- [Internet Archive, Save Page Now 2 public API documentation][spn2] (updated 22 July 2026).
- [Internet Archive help, FAQ on publishers blocking the Wayback Machine][ia-faq].
- [archive.today, FAQ][archiveph].
- Perma.cc blog, posts of [7 January 2019][perma-2019] and [15 September 2021][perma-2021].
- [Perma.cc, terms of service][perma-terms], in the Internet Archive's capture of 15 July 2026 (2026-11-20);
  the live page refuses scripts.
- [WebCite, home page][webcite].
- [SWHID specification version 1.2][swhid], and [FAQ][swhid-faq].
- [Supreme Court of the United States, Online Sources Cited in Opinions][scotus-cited].
- [IPCC, Guidance Note for Lead Authors of the Fifth Assessment Report on Consistent Treatment of Uncertainties][ipcc]
  (2010).
- Cochrane Handbook for Systematic Reviews of Interventions, [chapter 5][cochrane5] and [chapter 14][cochrane14].
- [International Fact-Checking Network, the commitments of the Code of Principles][ifcn].
- [V. Magesh and others, "Hallucination-Free?"][magesh] (2024), version 1.
- [BBC, "Representation of BBC News content in AI Assistants"][bbc] (February 2025).
- ["DeepTRACE: Auditing Deep Research AI Systems for Tracking Reliability Across Citations and Evidence"][deeptrace]
  (2025), version 1, abstract.

Secondary sources:

- [ISO/IEC Directives, Part 2, eighth edition (2018), clauses 6 and 16, in a third-party rendering][iso-dir]
  (whether a later edition is current was not checked).
- [J. Langdell, "Phoenix Says Its BIOS May Foil IBM's Lawsuits", PC Magazine, 10 July 1984][pcmag].
- [Marks & Clerk, "The Clean Room Problem"][marks] (29 October 2026).

[r01]: R0-01-clean-room-policy.md
[r02]: R0-02-legal-baseline.md
[r03]: ../../roadmap/research.md#phase-0-ground-rules
[r05]: R0-05-source-map.md
[r06]: R0-06-provenance-controls.md
[r190]: ../../roadmap/research.md#landscape-synthesis
[r602]: ../../roadmap/research.md#phase-6-synthesis
[roadmap]: ../../roadmap/research.md
[adr]: ../../adr/0001-restrict-reading-by-licence-tier.md
[adr-context]: ../../adr/0001-restrict-reading-by-licence-tier.md#context
[adr-walled]: ../../adr/0001-restrict-reading-by-licence-tier.md#walled-tier
[adr-closed]: ../../adr/0001-restrict-reading-by-licence-tier.md#closed-tier
[adr-tainted]: ../../adr/0001-restrict-reading-by-licence-tier.md#tainted-tier
[adr-everytier]: ../../adr/0001-restrict-reading-by-licence-tier.md#in-every-tier
[guide]: ../README.md
[guide-sources]: ../README.md#sources
[guide-shape]: ../README.md#shape-and-links
[guide-quoting]: ../README.md#quoting
[guide-constants]: ../README.md#constants-and-tables
[glossary]: ../../glossary/terms.md
[glossary-bios]: ../../glossary/terms.md#bios
[glossary-cycle-accuracy]: ../../glossary/terms.md#cycle-accuracy
[docs-status]: ../../README.md#status
[req-template]: ../../requirements/_template.md
[guard]: ../../../.claude/hooks/source-guard.sh
[terms-yml]: ../../../.config/vale/styles/Rustalgia/Terms.yml
[vale-ini]: ../../../.config/vale.ini
[typos]: ../../../.config/typos.toml
[lychee-toml]: ../../../.config/lychee.toml
[topic-contract]: ../../../.config/mdschema/topic-study.yml
[berne]: https://www.wipo.int/wipolex/en/text/283698
[wipo-model]: https://www.wipo.int/edocs/pubdocs/en/copyright/120/wipo_pub_120_1978_01.pdf
[usc101]: https://www.law.cornell.edu/uscode/text/17/101
[usc103]: https://www.law.cornell.edu/uscode/text/17/103
[usc105]: https://www.law.cornell.edu/uscode/text/17/105
[usc107]: https://www.law.cornell.edu/uscode/text/17/107
[usc117]: https://www.law.cornell.edu/uscode/text/17/117
[usc1201]: https://www.law.cornell.edu/uscode/text/17/1201
[cfr202]: https://www.law.cornell.edu/cfr/text/37/202.1
[usco-fairuse]: https://www.copyright.gov/help/faq/faq-fairuse.html
[comp700]: https://www.copyright.gov/comp3/chap700/ch700-literary-works.pdf
[comp900]: https://www.copyright.gov/comp3/chap900/ch900-visual-art.pdf
[fr-typeface]: https://www.govinfo.gov/content/pkg/FR-1988-09-29/pdf/FR-1988-09-29.pdf
[cdpa3]: https://www.legislation.gov.uk/ukpga/1988/48/section/3
[cdpa30]: https://www.legislation.gov.uk/ukpga/1988/48/section/30
[cdpa54]: https://www.legislation.gov.uk/ukpga/1988/48/section/54
[cdpa55]: https://www.legislation.gov.uk/ukpga/1988/48/section/55
[cdpa178]: https://www.legislation.gov.uk/ukpga/1988/48/section/178
[dbregs]: https://www.legislation.gov.uk/uksi/1997/3032/regulation/18
[infosoc]: http://publications.europa.eu/resource/celex/32001L0029
[infosoc5]: https://www.legislation.gov.uk/eudr/2001/29/article/5/adopted
[softdir]: https://www.legislation.gov.uk/eudr/2009/24/adopted
[softdir-eurlex]: https://eur-lex.europa.eu/LexUriServ/LexUriServ.do?uri=CELEX:32009L0024:EN:HTML
[dbdir]: https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:31996L0009
[dbdir7]: https://www.legislation.gov.uk/eudr/1996/9/article/7/adopted
[designdir]: https://www.legislation.gov.uk/eudr/1998/71/article/1/adopted
[designdir10]: https://www.legislation.gov.uk/eudr/1998/71/article/10/adopted
[dataact]: https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32023R2854
[dec833]: http://publications.europa.eu/resource/celex/32011D0833
[dec833-6]: https://www.legislation.gov.uk/eudn/2011/833/article/6/adopted
[consleg]: https://eur-lex.europa.eu/collection/eu-law/consleg.html
[jp-act]: https://www.japaneselawtranslation.go.jp/en/laws/view/4207
[jp-moj]: https://www.japaneselawtranslation.go.jp/en
[jp-textbook]: https://www.bunka.go.jp/seisaku/chosakuken/seidokaisetsu/pdf/94436101_01.pdf
[ca29]: https://laws-lois.justice.gc.ca/eng/acts/C-42/section-29.html
[ca291]: https://laws-lois.justice.gc.ca/eng/acts/C-42/section-29.1.html
[ca-order]: https://laws-lois.justice.gc.ca/eng/regulations/SI-97-5/FullText.html
[au-act]: https://www.legislation.gov.au/C1968A00063/latest/text
[au-terms]: https://www.legislation.gov.au/terms-of-use
[lgu-help]: https://www.legislation.gov.uk/help
[lgu-understanding]: https://www.legislation.gov.uk/understanding-legislation
[ecfr]: https://www.ecfr.gov/reader-aids/using-ecfr/getting-started
[pd-citation]: https://www.judiciary.uk/wp-content/uploads/JCO/Documents/Practice+Directions/lcj-pract-dir-citation-authorities-2012.pdf
[icd203]: https://web.archive.org/web/20260522220716/https://www.dni.gov/files/documents/ICD/ICD-203.pdf
[rfc2119]: https://www.rfc-editor.org/rfc/rfc2119.txt
[wheaton]: https://www.law.cornell.edu/supremecourt/text/33/591
[feist]: https://www.law.cornell.edu/supremecourt/text/499/340
[masson]: https://www.law.cornell.edu/supremecourt/text/501/496
[campbell]: https://www.law.cornell.edu/supremecourt/text/510/569
[georgia]: https://www.law.cornell.edu/supremecourt/text/18-1150
[google-slip]: https://www.supremecourt.gov/opinions/20pdf/18-956_d18f.pdf
[nutt]: https://static.case.law/f2d/31/cases/0236-01.json
[wainwright]: https://law.resource.org/pub/us/case/reporter/F2/558/558.F2d.91.76-7468.937.html
[synercom]: https://static.case.law/f-supp/462/cases/1003-01.json
[williams]: https://static.case.law/f-supp/626/cases/0571-01.json
[toro]: https://law.resource.org/pub/us/case/reporter/F2/787/787.F2d.1208.85-5240.html
[salinger]: https://law.resource.org/pub/us/case/reporter/F2/811/811.F2d.90.86-7957.657.html
[wright]: https://law.resource.org/pub/us/case/reporter/F2/953/953.F2d.731.90-9054.1762.html
[sega]: https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html
[altai]: https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html
[gates]: https://law.resource.org/pub/us/case/reporter/F3/009/9.F3d.823.92-1256.html
[harbor]: https://static.case.law/f-supp/925/cases/1042-01.json
[baystate]: https://static.case.law/f-supp/946/cases/1079-01.json
[ada]: https://law.resource.org/pub/us/case/reporter/F3/126/126.F3d.977.96-4140.html
[adobe]: https://luc.devroye.org/SSi-vs-Adobe-February-2-1998.html
[mitel]: https://law.resource.org/pub/us/case/reporter/F3/124/124.F3d.1366.95-1394.html
[lexmark]: https://law.resource.org/pub/us/case/reporter/F3/387/387.F3d.522.03-5400.html
[southco]: https://law.resource.org/pub/us/case/reporter/F3/390/390.F3d.276.02-1243.html
[atc]: https://law.resource.org/pub/us/case/reporter/F3/402/402.F3d.700.03-6505.html
[oracle]: https://www.cafc.uscourts.gov/opinions-orders/13-1021.opinion.5-7-2014.1.pdf
[astm]: https://www.govinfo.gov/content/pkg/USCOURTS-caDC-17-07035/pdf/USCOURTS-caDC-17-07035-0.pdf
[compulife]: https://media.ca11.uscourts.gov/opinions/pub/files/201812004.pdf
[compulife2024]: https://www.govinfo.gov/content/pkg/USCOURTS-ca11-21-14071/pdf/USCOURTS-ca11-21-14071-0.pdf
[hiq]: https://cdn.ca9.uscourts.gov/datastore/opinions/2022/04/18/17-16783.pdf
[mata]: https://storage.courtlistener.com/recap/gov.uscourts.nysd.575368/gov.uscourts.nysd.575368.54.0.pdf
[ross]: https://www2.ca3.uscourts.gov/opinarch/252153p.pdf
[ross-govinfo]: https://www.govinfo.gov/app/details/USCOURTS-ca3-25-02153
[infopaq]: http://publications.europa.eu/resource/celex/62008CJ0005
[bhb]: https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62002CJ0203
[dataco]: https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62010CJ0604
[pelham]: http://publications.europa.eu/resource/celex/62017CJ0476
[spiegel]: https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62017CJ0516
[navitaire]: https://caselaw.nationalarchives.gov.uk/ewhc/ch/2004/1725
[nova]: https://caselaw.nationalarchives.gov.uk/ewca/civ/2007/219
[sas]: https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1829
[pasternak]: https://caselaw.nationalarchives.gov.uk/ewhc/ch/2022/2695
[edozo]: https://caselaw.nationalarchives.gov.uk/ewhc/ipec/2026/93
[edozo-search]: https://caselaw.nationalarchives.gov.uk/search?query=Edozo
[jp-sc]: https://www.courts.go.jp/assets/hanrei/hanrei-pdf-53283.pdf
[jp-sc-page]: https://www.courts.go.jp/hanrei/53283/detail2/index.html
[cch]: https://decisions.scc-csc.ca/scc-csc/scc-csc/en/item/2125/index.do
[ccby]: https://creativecommons.org/licenses/by/4.0/legalcode.en
[ccbynd]: https://creativecommons.org/licenses/by-nd/4.0/legalcode.en
[ccbync]: https://creativecommons.org/licenses/by-nc/4.0/legalcode.en
[ccbysa3]: https://creativecommons.org/licenses/by-sa/3.0/legalcode.txt
[cc-faq]: https://creativecommons.org/faq/
[cc-policies]: https://creativecommons.org/policies/
[cc-compat]: https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/
[cc-gplv3]: https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3
[gnu-list]: https://web.archive.org/web/20261118021016/https://www.gnu.org/licenses/license-list.html
[gpl3]: https://www.gnu.org/licenses/gpl-3.0.txt
[fdl]: https://www.gnu.org/licenses/fdl-1.3.html
[ogl]: https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/
[ojl]: https://caselaw.nationalarchives.gov.uk/open-justice-licence
[ojl-permission]: https://caselaw.nationalarchives.gov.uk/when-you-need-permission
[curia-copyright]: https://curia.europa.eu/site/jcms/d2_5167/en/copyright
[curia-legal]: https://curia.europa.eu/jcms/jcms/T5_5135/en/
[tlp]: https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/
[tlp-code]: https://trustee.ietf.org/documents/trust-legal-provisions/code-components-list-3/
[w3c]: https://www.w3.org/copyright/document-license-2023/
[itu]: https://www.itu.int/dms_pub/itu-t/oth/04/04/T04040000040004MSWE.docx
[iana]: https://www.iana.org/help/licensing-terms
[pciids]: https://pci-ids.ucw.cz/
[usbif]: https://www.usb.org/getting-vendor-id
[nointro]: https://no-intro.org/
[nointro-terms]: https://datomatic.no-intro.org/terms.html
[redump]: http://redump.org/
[redump-dl]: http://redump.org/downloads/
[lrdb]: https://raw.githubusercontent.com/libretro/libretro-database/master/README.md
[arm-asl]: https://documentation-service.arm.com/static/6901ca9402789941c1920b3a
[aarchmrs]: https://kernel.googlesource.com/pub/scm/linux/kernel/git/maz/AARCHMRS/
[asahi]: https://asahilinux.org/copyright/
[asahi-llm]: https://asahilinux.org/llm-policy/
[reactos]: https://web.archive.org/web/20250423130230/https://reactos.org/wiki/Audit
[wine]: https://web.archive.org/web/20240717093231/https://wiki.winehq.org/Clean_Room_Guidelines
[kernel]: https://docs.kernel.org/process/license-rules.html
[pandocs-about]: https://gbdev.io/pandocs/About.html
[pandocs]: https://gbdev.io/pandocs/History.html
[pandocs-header]: https://gbdev.io/pandocs/The_Cartridge_Header.html
[pandocs-power]: https://gbdev.io/pandocs/Power_Up_Sequence.html
[pandocs-rendering]: https://gbdev.io/pandocs/Rendering.html
[pandocs-specs]: https://gbdev.io/pandocs/Specifications.html
[pandocs-readme]: https://raw.githubusercontent.com/gbdev/pandocs/716579058a01501b12e5f21e9d25b1327ad2fdb2/README.md
[pandocs-contrib]: https://raw.githubusercontent.com/gbdev/pandocs/716579058a01501b12e5f21e9d25b1327ad2fdb2/CONTRIBUTING.md
[gbdev-contrib]: https://gbdev.io/contributing.html
[3dbrew]: https://www.3dbrew.org/wiki/Glossary
[wiibrew]: https://wiibrew.org/wiki/Glossary
[tasvideos]: https://tasvideos.org/Glossary
[tasvideos-fps]: https://tasvideos.org/PlatformFramerates
[tasvideos-licence]: https://tasvideos.org/SiteLicense
[egw-accuracy]: https://emulation.gametechwiki.com/index.php/Emulation_accuracy
[egw-hle]: https://emulation.gametechwiki.com/index.php/High_and_low-level_emulation
[egw-copyrights]: https://emulation.gametechwiki.com/index.php/Emulation_General_Wiki:Copyrights
[mgba-blog]: https://mgba.io/2017/04/30/emulation-accuracy/
[dolphin-pr]: https://dolphin-emu.org/blog/2024/09/04/dolphin-progress-report-release-2407-2409/
[dolphin-readme]: https://raw.githubusercontent.com/dolphin-emu/dolphin/f76238742c70a3db637f2037b0ed380be4bdead1/Readme.md
[ppsspp]: https://www.ppsspp.org/docs/faq/
[melonds]: https://melonds.kuribo64.net/faq.php
[libretro-api]: https://www.libretro.com/index.php/api/
[libretro-bios]: https://docs.libretro.com/guides/bios/
[mame]: https://docs.mamedev.org/whatis.html
[sameboy]: https://raw.githubusercontent.com/LIJI32/SameBoy/master/README.md
[martypc]: https://raw.githubusercontent.com/dbalsom/martypc/main/README.md
[jgenesis]: https://raw.githubusercontent.com/jsgroth/jgenesis/master/README.md
[ares]: https://raw.githubusercontent.com/ares-emulator/ares/master/README.md
[n64recomp]: https://raw.githubusercontent.com/N64Recomp/N64Recomp/main/README.md
[psn]: https://www.playstation.com/en-us/support/hardware/ps5/system-software/
[sevocab]: https://pascal.computer.org/sev_display/search.action
[nesdev-pages]: https://www.nesdev.org/wiki/Special:AllPages?namespace=4
[nesdev-rfc]: https://www.nesdev.org/w/index.php?title=Nesdev_wiki:Manual_of_Style/RFC_2119&action=raw
[nesdev-glossary]: https://www.nesdev.org/w/index.php?title=Glossary&action=raw
[nesdev-basics]: https://www.nesdev.org/w/index.php?title=Before_the_basics&action=raw
[nist]: https://physics.nist.gov/cuu/Units/binary.html
[google-units]: https://developers.google.com/style/units-of-measure
[google-words]: https://developers.google.com/style/word-list
[google-tw]: https://developers.google.com/tech-writing/one/words
[k8s]: https://kubernetes.io/docs/contribute/style/hugo-shortcodes/
[cncf]: https://glossary.cncf.io/style-guide/
[mdn]: https://developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Howto/Write_a_new_entry_in_the_glossary
[rustref]: https://doc.rust-lang.org/reference/glossary.html
[rustc]: https://rustc-dev-guide.rust-lang.org/appendix/glossary.html
[vale-vocab]: https://docs.vale.sh/keys/vocabularies.md
[vale-md]: https://docs.vale.sh/formats/markdown.md
[vale-sub]: https://docs.vale.sh/checks/substitution.md
[vale-cond]: https://docs.vale.sh/checks/conditional.md
[mdschema]: https://raw.githubusercontent.com/jackchuka/mdschema/main/README.md
[lychee]: https://lychee.cli.rs/recipes/anchors/
[wp-nfc]: https://en.wikipedia.org/wiki/Wikipedia:Non-free_content
[wp-mos]: https://en.wikipedia.org/wiki/Wikipedia:Manual_of_Style
[wp-cp]: https://en.wikipedia.org/wiki/Wikipedia:Close_paraphrasing
[wp-v]: https://en.wikipedia.org/wiki/Wikipedia:Verifiability
[wp-q]: https://en.wikipedia.org/wiki/Wikipedia:Quotations
[wp-nor]: https://en.wikipedia.org/wiki/Wikipedia:No_original_research
[wp-linkrot]: https://en.wikipedia.org/wiki/Wikipedia:Link_rot
[wp-archivetoday]: https://en.wikipedia.org/wiki/Wikipedia:Archive.today_guidance
[wp-fv]: https://en.wikipedia.org/wiki/Template:Failed_verification
[indigo]: https://law.resource.org/pub/us/code/blue/IndigoBook.html
[ori]: https://ori.hhs.gov/28-guidelines-glance-avoiding-plagiarism
[zittrain]: https://harvardlawreview.org/forum/vol-127/perma-scoping-and-addressing-the-problem-of-link-and-reference-rot-in-legal-citations/
[pew]: https://www.pewresearch.org/data-labs/2024/05/17/when-online-content-disappears/
[gh-permalinks]: https://docs.github.com/en/repositories/working-with-files/using-files/getting-permanent-links-to-files
[arxiv]: https://info.arxiv.org/help/arxiv_identifier.html
[ia-save]: https://help.archive.org/help/save-pages-in-the-wayback-machine/
[ia-general]: https://help.archive.org/help/wayback-machine-general-information/
[ia-removal]: https://help.archive.org/help/how-do-i-request-to-remove-something-from-archive-org/
[spn2]: https://docs.google.com/document/d/1Nsv52MvSjbLb2PCpHlat0gkzw0EvtSgpKHu4mk0MnrA/export?format=txt
[ia-faq]: https://help.archive.org/help/faq-publishers-blocking-the-wayback-machine/
[archiveph]: https://archive.ph/faq
[perma-2019]: https://archive.blogs.harvard.edu/perma/2019/01/07/introducing-individual-account-subscription-tiers-for-perma
[perma-2021]: https://archive.blogs.harvard.edu/perma/2021/09/15/usage-plans-updates
[perma-terms]: https://web.archive.org/web/20260715093851/https://perma.cc/terms-of-service
[webcite]: https://webcitation.org/
[swhid]: https://www.swhid.org/swhid-specification/v1.2/1.Scope/
[swhid-faq]: https://www.swhid.org/faq/
[scotus-cited]: https://www.supremecourt.gov/opinions/cited_urls/
[ipcc]: https://www.ipcc.ch/site/assets/uploads/2017/08/AR5_Uncertainty_Guidance_Note.pdf
[cochrane5]: https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current/chapter-05
[cochrane14]: https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current/chapter-14
[ifcn]: https://ifcncodeofprinciples.poynter.org/the-commitments
[magesh]: https://arxiv.org/pdf/2405.20362v1
[bbc]: https://www.bbc.co.uk/aboutthebbc/documents/bbc-research-into-ai-assistants.pdf
[deeptrace]: https://arxiv.org/abs/2509.04499
[iso-dir]: https://metanorma.github.io/mn-samples-iso/documents/directives/part2/document.html
[pcmag]: https://archive.org/stream/PC-Mag-1984-07-10/PC-Mag-1984-07-10_djvu.txt
[marks]: https://www.marks-clerk.com/insights/latest-insights/102o6n6-the-clean-room-problem-ai-reverse-engineering-and-the-limits-of-safe-harbours/
