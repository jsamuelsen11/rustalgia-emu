---
title: Glossary and research conventions
roadmap_item: R0-04
status: draft
date: 2026-11-19
---

# Glossary and research conventions

## Summary

This note asks what vocabulary the research needs, and what a note may quote, tabulate, and describe.
The central emulation terms are used in conflicting senses by the sources the project will read,
and the standard vocabularies lack most of them,
so a glossary has to choose its own wording and say whose usage differs.
No source gives a count of words that may be quoted, a length of byte sequence that may be recorded,
or a level of detail at which a description of an algorithm becomes a copy of a program; the law gives conditions,
and any limit the project sets is its own.
Two points matter most to Rustalgia: a detailed enough description can carry a program's expression across a wall,
and the tools that agents fetch with paraphrase quotations unless each one is checked against the raw page.
This note is not legal advice.

## Scope

- Question: which terms need fixed meanings, and what conventions should notes follow for quoting, constants and tables,
  pseudo-code, citations, and the status of a claim?
- Covered: the law and licences on quotation, on data and tables, and on descriptions of programs;
  how peer projects and standards bodies handle each; contested vocabulary; glossary practice;
  and what this repository's checks can enforce.
- Left to other items: the substance of anti-circumvention, firmware, keys, patents, and trade marks (`R0-02`);
  what the repository's licence means for quoted and agent-written text (`R0-03`); the tier of each hub (`R0-05`);
  logging and similarity checks (`R0-06`).
  Conventions for code are not set here.
- Researched on 2026-11-19, with Vale 3.27.0, mdschema 0.16.0, lychee 0.24.2, rumdl 0.3.4, and typos 1.52.2.
  Japanese statutes were read in unofficial English translations;
  one Japanese judgment and one agency text were read in Japanese.
- How claims were checked: each finding names its source,
  and research agents fetched every source on 2026-11-19 and copied quotations from the raw page text,
  not from a summarising tool.
  A second, independent pass fetched the sources again and tested each claim and quotation.
  A claim marked "(secondary)" rests on commentary, "(from memory)" was not confirmed by any fetched page,
  "(inference)" is reasoning, and "(tested locally)" was run with the repository's tools on scratch files. "(research
  log)" is an observation an agent made while gathering the evidence.
  Statements that nothing was found record a search, not proof of absence.
  Quotation marks, apostrophes, and line breaks inside quotations are normalised; nothing else is.
  No emulator source code, decompilation, or leaked material was opened, and no tainted source.
  From emulator and decompilation projects, only README files, licence files, and documentation sites were read.

The glossary and the conventions that this change adds beside the note are a proposal.
The note maps the options; the owner accepts or changes the proposal by merging.

## Findings

### Quoting: what copyright law allows

- Quotation is a permitted use under the Berne Convention, on conditions.
  "It shall be permissible to make quotations from a work which has already been lawfully made available to the public,
  provided that their making is compatible with fair practice,
  and their extent does not exceed that justified by the purpose" (Article 10(1)).
  Mention must be made "of the source, and of the name of the author if it appears thereon" (Article 10(3)).
- No source read gives a word count.
  "There are no legal rules permitting the use of a specific number of words, a certain number of musical notes,
  or percentage of a work" (United States Copyright Office, fair use FAQ; an agency page, not law).
  The statute lists "the amount and substantiality of the portion used in relation to the copyrighted work as a whole"
  as one of four factors (17 U.S.C. § 107),
  and "the extent of permissible copying varies with the purpose and character of the use"
  (Campbell, a case about a song parody).
- A short extract can be protected.
  Storing and printing an 11-word extract is reproduction in part "if the elements thus reproduced are the expression of
  the intellectual creation of their author; it is for the national court to make this determination" (Infopaq,
  operative part).
  United States registration rules exclude "Words and short phrases such as names, titles, and slogans"
  (37 C.F.R. § 202.1(a)).
  That is a rule about registration; it does not say that a short quotation from a longer work is free (inference).
- The United Kingdom allows quotation "(whether for criticism or review or otherwise)" on four conditions:
  the work "has been made available to the public", the use is "fair dealing",
  "the extent of the quotation is no more than is required by the specific purpose for which it is used",
  and there is "a sufficient acknowledgement (unless this would be impossible for reasons of practicality or otherwise)"
  (CDPA section 30(1ZA)).
  An acknowledgement identifies the work "by its title or other description" and its author (section 178).
  A contract term that restricts the exception "is unenforceable"
  (section 30(4)),
  and in deciding whether a work has been made available "no account shall be taken of any unauthorised act"
  (section 30(1A)).
- A quotation that was fair dealing still failed the United Kingdom exception because it carried no acknowledgement,
  and the court put the burden of showing the conditions on the person quoting
  (Pasternak v Prescott, paras 444 to 487; a first-instance judgment).
- European Union law lets member states allow "quotations for purposes such as criticism or review",
  for a work "lawfully made available to the public", with "the source,
  including the author's name" indicated "unless this turns out to be impossible", "in accordance with fair practice,
  and to the extent required by the specific purpose" (Directive 2001/29/EC Article 5(3)(d)).
  The Court of Justice describes a quotation as use of an extract "for the purposes of illustrating an assertion,
  of defending an opinion or of allowing an intellectual comparison between that work and the assertions of that user"
  (Pelham, para 71),
  and says the quoted work "must be secondary in relation to the assertions of that user" (Spiegel Online, para 79).
  Pelham concerned music sampling and Spiegel Online a news site.
- Japan permits quoting a work that has been made public where the quotation is "consistent with fair practices
  and within a scope that is justified" by its purpose, such as news reporting, critique, or study
  (Copyright Act Article 32(1), unofficial translation), with the source indicated (Article 48(1)).
  Translation of a quoted work is also permitted (Article 47-6(1)(ii)).
  The Supreme Court required, under the old Copyright Act,
  that the quoting and the quoted work can be told apart and that the quoting work is the main part
  and the quoted work subordinate (judgment of 28 March 1980, read in Japanese; this rendering is the research agent's).
  The Agency for Cultural Affairs lists the same points and adds, as examples,
  that the amount quoted stays within the minimum necessary
  (Copyright Textbook, fiscal 2026 edition, page 75; non-binding, read in Japanese).
  Whether later courts still apply the two requirements was not checked.
- Canada allows fair dealing for research with no attribution condition,
  and for criticism or review if the source is mentioned (Copyright Act sections 29 and 29.1).
  Its Supreme Court calls fair dealing "a user's right" that "must not be interpreted restrictively"
  (CCH, para 48; a case about a library's photocopying).
  Australia allows fair dealing for criticism or review where "a sufficient acknowledgement of the work is made"
  (Copyright Act 1968 section 41).
  No general quotation exception was seen in the Australian Act's table of contents; only its first volume was read.
- Rewording is not a safe route.
  "Paraphrasing or copying with evasion is an infringement"
  (Nutt, Second Circuit 1929, about the plan and arrangement of a whole lecture course).
  Close paraphrase of unpublished letters counted as copying protected expression
  (Salinger, on a preliminary injunction),
  and a newspaper's abstracts of analysts' reports "appropriated almost verbatim the most creative
  and original aspects of the reports" (Wainwright, also on a preliminary injunction).
  The statute lists a "translation", an "abridgment", and a "condensation" as derivative works (17 U.S.C. § 101).
- Facts stay free.
  "The biographer who copies only facts incurs no risk of an injunction; he has not taken copyrighted material"
  (Salinger, para 19).
- Unpublished and unlawfully published sources are treated differently.
  The Berne, United Kingdom, and European Union texts above require a work lawfully made available.
  In the European Union that means "with the authorisation of the copyright holder
  or in accordance with a non-contractual licence or a statutory authorisation" (Spiegel Online, para 89).
  In the United States no "per se rule regarding unpublished works" exists
  (Wright v Warner Books, para 30),
  and the statute says that being unpublished "shall not itself bar a finding of fair use" (17 U.S.C. § 107).
- Quotation marks make a claim about the words.
  "In general, quotation marks around a passage indicate to the reader
  that the passage reproduces the speaker's words verbatim",
  and an alteration matters legally when it "results in a material change in the meaning conveyed by the statement"
  (Masson; a defamation case, not a copyright rule).
  The Berne Convention gives authors a right to object to "any distortion,
  mutilation or other modification" that would prejudice their honour or reputation
  (Article 6bis(1), paraphrased in its last clause).
- A summary of a free text can be a separate protected work.
  A publisher's short headnotes that summarise judicial opinions were held original,
  and copying them to train a competing legal-research tool was not fair use
  (Thomson Reuters v Ross, Third Circuit, 29 September 2026).
  The court left open headnotes that copy opinion text verbatim (footnote 5).
- No decision was found on quoting a hardware or software manual into commentary.
  The nearest authority read is SAS v WPL, on manuals copied into a manual, which `R0-01` records.
  One web search was run; no case-law database was searched.

### Quoting: statutes, judgments, and official texts

- Works of the United States federal government have no United States copyright
  (17 U.S.C. § 105(a)),
  and "no reporter has or can have any copyright in the written opinions delivered by this court" (Wheaton v Peters).
  The rule covers judges' own "non-binding works
  (such as headnotes and syllabi)",
  but not works by people "who lack the authority to make or interpret the law, such as court reporters"
  (Georgia v Public.Resource.Org).
- In the United Kingdom, Acts and Crown works are in copyright (CDPA sections 163 and 164) and are licensed openly.
  The Open Government Licence version 3.0 asks reusers to "acknowledge the source of the Information",
  and legislation.gov.uk states that its content is under that licence.
- Judgments on the National Archives' Find Case Law service, which `R0-01` used for English cases,
  are under the Open Justice Licence version 2.0.
  It requires that a reuser "do not mislead others or misrepresent the Information or its source" and remove documents
  that are "subsequently no longer published" or "have been replaced by a revised version".
  It excludes "computational analysis of the Information (including indexing by search engines)".
  The service defines that as "using automated
  or algorithmic methods to process large numbers of judgments systematically —
  including using AI or large language models (LLMs)",
  and lists "downloading judgments one at a time as you need them" and "quoting or citing judgments in your work"
  as outside it.
  The pages give no number for "large numbers".
- The Court of Justice says "Editorial content and the case-law can be reproduced provided the source is acknowledged",
  and that "Only the versions of these documents that are published in the Reports of Cases
  or the EU Official Journal are authentic" (Court of Justice, copyright and legal notices).
  Commission documents may be reused on conditions that include "the obligation not to distort the original meaning
  or message of the documents" (Commission Decision 2011/833/EU Article 6(2)).
  The EUR-Lex legal notice could not be fetched.
- Japan's Copyright Act excludes laws and court judgments from protection,
  and translations of them "made by a national or local government agency" (Article 13, unofficial translation).
  The Ministry of Justice says of its translations that they "are not official texts" and
  that "Only the original Japanese texts of the laws and regulations have legal effect".
- Canada lets anyone reproduce federal enactments
  and federal court decisions "provided due diligence is exercised in ensuring the accuracy of the materials reproduced
  and the reproduction is not represented as an official version" (Reproduction of Federal Law Order).
  Australia's Federal Register of Legislation is under the Creative Commons Attribution 4.0 licence (terms of use).
  The terms for Australian court judgments were not obtained.
- Several of these permissions are conditional on accuracy.
  A cut or stale quotation of such a text breaches the reuse terms as well as a note's own standard (inference).

### Quoting: licences on the source

- A Creative Commons licence does not restrict what an exception allows.
  "For the avoidance of doubt, where Exceptions and Limitations apply to Your use, this Public License does not apply,
  and You do not need to comply with its terms and conditions"
  (CC BY 4.0 section 2(a)(2); the same words are in the no-derivatives 4.0 licence).
  Which exception applies depends on the country of use,
  so a note read worldwide cannot assume one exception covers every reader (inference).
- Beyond an exception, CC BY 4.0 requires the licensee to retain, if supplied, identification of the creator,
  a copyright notice, a notice that refers to the licence, a notice that refers to the disclaimer of warranties,
  and a link to the material; to "indicate if You modified the Licensed Material"; and to state the licence
  (section 3(a)(1)).
  These may be met "in any reasonable manner based on the medium, means, and context" (section 3(a)(2)).
- "Adapted Material" is material in which the licensed work is "translated, altered, arranged, transformed,
  or otherwise modified in a manner requiring permission" (CC BY 4.0 section 1(a)).
- Text under CC BY-SA 4.0 can be adapted into a GPLv3 work, one way only; `R0-01` records the bare fact.
  The compatibility was declared on 8 October 2015,
  and when it is used "both licenses apply and downstream users must comply with both licenses"
  (Creative Commons, ShareAlike compatibility: GPLv3).
  The GNU licence list confirms it for "GNU GPL version 3".
  For BY-SA 3.0, "Currently, no non-CC licenses have been designated as compatible"
  (Creative Commons, compatible licences).
  No page read says whether 3.0 text can reach GPLv3 in two steps through 4.0.
- A no-derivatives licence does not license sharing adapted material (BY-ND 4.0 section 2(a)(1)(B)).
  Creative Commons says that "Generally,
  no derivative work is made of the original from which the excerpt was taken
  when the excerpt is used to illuminate an idea or provide an example in another larger work" (FAQ; not the licence).
  A translated or reworded excerpt of such a source would be adapted material (inference from section 1(a)).
- "NonCommercial means not primarily intended for or directed towards commercial advantage or monetary compensation"
  (BY-NC 4.0 section 1(i)).
  GPL-3.0 lets recipients use the notes commercially,
  so non-commercial text taken beyond an exception could not carry the GPL grant (inference).
- The GNU Free Documentation Licence requires a modified version to be released "under precisely this License"
  (FDL 1.3 section 4).
- Licence texts have their own terms.
  The GPL may be copied verbatim "but changing it is not allowed"
  (GPLv3 header), and it "acknowledges your rights of fair use or other equivalent" (section 2).
  Creative Commons makes its legal code available under CC0 (Creative Commons policies).
- Standards bodies license excerpts on conditions.
  The IETF allows copying "unmodified portions" of RFCs if each is "attributed to IETF and identifies the RFC",
  with all legends included "where more than one-fifth of such text" is reproduced
  (Trust Legal Provisions 5.0 section 3(c)(iii)).
  The W3C allows copying its documents "or portions thereof" with a link, the copyright notice, and the status,
  and grants no right to make derivatives (W3C Document License, 2023).
- A source with a bare copyright notice, or one that forbids reproduction, such as the Arm manuals in `R0-01`,
  can be quoted only under an exception (inference).
- Site terms are a separate layer.
  In the United States a contract can remove what copyright allows
  (`R0-01`, Bowers),
  and after hiQ v LinkedIn "other causes of action, such as copyright infringement, misappropriation, unjust enrichment,
  conversion, breach of contract, or breach of privacy, may also lie" for scraping a public site.
  Whether terms bind a reader who never agrees to them was not settled by any source read.

### Quoting: what careful publishers do

- Wikipedia permits "Brief quotations of copyrighted text" to "illustrate a point, establish context,
  or attribute a point of view or idea", requires an inline citation and quotation marks or a block quote,
  and says "Extensive quotation of copyrighted text is prohibited" (Non-free content guideline, 7 October 2026).
  It states no word cap.
- Its style manual requires that "the wording of the quoted text must be faithfully reproduced",
  calls this the "principle of minimal change",
  and says not to omit text "where doing so would remove important context or alter the meaning of the text"
  (Manual of Style, 16 November 2026).
- It warns that "close paraphrasing can still violate copyright"
  (Manual of Style),
  and that "Translation from a foreign language is a form of paraphrase"
  (Close paraphrasing, an explanatory supplement).
- For sources in other languages, "Translations published by reliable sources are preferred over translations by
  Wikipedians, but translations by Wikipedians are preferred over machine translations" (Verifiability policy).
- Legal citation practice marks every change: "Any substitutions into quoted material should be bracketed",
  a significant mistake in the original is kept and followed by "[sic]",
  and an omission inside a sentence takes an ellipsis (The Indigo Book, rules 38 and 39).
  It sets quotations of 50 or more words as a block (rule 40.1).
  A Wikipedia essay uses "about 40 words" for the same purpose.
  These are formatting thresholds, not permission limits.
- Research-integrity guidance says "Any verbatim text taken from another source must be enclosed in quotation marks
  and be accompanied by a citation", and that a paraphrase must use "our own syntactical structure"
  (United States Office of Research Integrity, guidelines 2 and 4; about plagiarism, not copyright).
- The research for this note met the failure modes that the `R0-01` verification pass found.
  Pages print a summary before the authoritative text: the syllabus before a Supreme Court opinion,
  a headnote before a Canadian judgment, a staff summary at the head of a Ninth Circuit opinion.
  The agent's first draft quoted a syllabus as the opinion and caught it by position.
  Raw text carries footnote marks, paragraph numbers, line-break hyphens, and recognition errors inside sentences,
  so "character for character" needs a stated rule for them (research log for this note).

### Constants: single values and short sequences

- Facts are not protected, and a compilation is protected only in its selection and arrangement.
  "The first person to find and report a particular fact has not created the fact;
  he or she has merely discovered its existence",
  and a later compiler "remains free to use the facts contained in another's publication to aid in preparing a competing
  work, so long as the competing work does not feature the same selection and arrangement" (Feist, a case about a
  telephone directory).
  Copyright in a compilation "does not imply any exclusive right in the preexisting material" (17 U.S.C. § 103(b)).
- Feist concerns discovered facts.
  A hardware constant was chosen by an engineer, and Feist does not say which side of its line that falls (inference).
- United States appeals courts have denied protection to assigned numbers and codes for three different reasons.
  Part numbers "are not protected by copyright
  because they are mechanically produced by the inflexible rules" of a numbering system
  (Southco, Third Circuit en banc, para 40).
  "The random and arbitrary use of numbers in the public domain does not evince enough originality"
  (Toro, Eighth Circuit, para 17).
  Command-code values that did show thought were excluded as scènes à faire,
  where "much of the expression in Mitel's command codes was dictated by the proclivities of technicians
  and limited by significant hardware, compatibility, and industry requirements"
  (Mitel, Tenth Circuit, para 52; on a preliminary injunction).
- One circuit went the other way on a taxonomy:
  "even the short description and the number are original works of authorship"
  (American Dental Association v Delta Dental, Seventh Circuit, para 5).
  The Sixth Circuit later called that reasoning "rather opaque" (ATC, para 24).
  No Supreme Court decision read resolves the difference.
- A sequence that compatibility requires is treated as functional.
  "To the extent compatibility requires
  that a particular code sequence be included in the component device to permit its use,
  the merger and scènes à faire doctrines generally preclude the code sequence from obtaining copyright protection"
  (Lexmark, Sixth Circuit, para 36).
  That program was 55 bytes and fed a checksum, and the ruling vacated a preliminary injunction "On this record"
  (paras 9 and 56).
- No court fixed a length.
  The examples read are Sega's "20 bytes of initialization code plus the letters S-E-G-A", doubted in a footnote
  (`R0-01`), the 55 bytes in Lexmark, and nine-digit part numbers in Southco.
  The same Sega footnote contrasts a key-generating program in which "Creativity and originality went into the design"
  (Sega v Accolade, note 7, describing Atari v Nintendo).
- The names of data structures and the order of their fields, copied to read a file format,
  were held unprotected because the organisation "is dictated mainly by external factors"
  (Baystate v Bentley, District of Massachusetts 1996; one district court).
- Where a required sequence makes a console display its maker's mark,
  the Ninth Circuit held the maker "primarily responsible for any resultant confusion",
  on a record with no known alternative way to gain access (Sega v Accolade, part IV; a preliminary-injunction appeal).
  `R0-02` covers trademarks.
- Typefaces are a separate rule in the United States.
  "Typeface as typeface" is not subject to copyright (37 C.F.R. § 202.1(e)).
  In 1988 the Copyright Office concluded
  that "typefaces created by a computerized-digital process are also uncopyrightable"
  (policy decision, 53 Federal Register 38110; an agency decision, read from a scanned text).
  It adds that "Pictorial or graphic elements that are incorporated into uncopyrightable characters
  or used to represent an entire letter or number may be registrable" (Compendium, section 906.4).
  One district court held outline font software protectable
  (Adobe v Southern Software; read in a transcription with visible errors, and not quoted for that reason).
  No case on a console's character ROM or on a logo bitmap in a cartridge header was found,
  and typeface law outside the United States was not researched.
- No court decision was found on whether a hash of a copyrighted file is protected or infringes.
  Three web searches were run; no case-law database was searched.

### Constants: tables and collections

- European Union law protects a database by copyright only where "the selection
  or arrangement" is "the author's own intellectual creation" (Directive 96/9/EC Article 3(1)).
  That is not met "when the setting up of the database is dictated by technical considerations,
  rules or constraints which leave no room for creative freedom", and "significant labour and skill" cannot justify it
  (Football Dataco, paras 39 and 46).
- A second right protects investment, not creativity.
  The maker of a database made with "substantial investment in either the obtaining,
  verification or presentation of the contents" may prevent "extraction and/or re-utilization of the whole
  or of a substantial part" (Article 7(1)).
  "The repeated and systematic extraction and/or re-utilization of insubstantial parts" is also barred
  where it conflicts with normal exploitation (Article 7(5)).
  A lawful user may take "insubstantial parts of its contents" "for any purposes whatsoever"
  (Article 8(1)), and a contract term to the contrary is "null and void" (Article 15).
- That right does not cover resources "used for the creation of materials which make up the contents of a database",
  and extraction does "not imply direct access to the database concerned" (British Horseracing Board, paras 42 and 53).
  Whether measuring hardware is obtaining existing data
  or creating it has not been decided in any source read (inference).
- The right belongs only to makers who are nationals of, or habitually resident in, a member state,
  or companies established there (Article 11).
  The United Kingdom has its own right on the same test, limited since 31 December 2020 to United Kingdom makers
  (Copyright and Rights in Databases Regulations 1997, regulations 13, 16, and 18).
  Who the "maker" of a wiki's tables is, no source read says.
- Japan protects a database "that, by reason of the selection
  or systematic construction of information contained therein, constitutes a creation"
  (Copyright Act Article 12-2(1), unofficial translation).
- A collection can be a trade secret although each entry is public.
  "Even if quotes aren't trade secrets,
  taking enough of them must amount to misappropriation of the underlying secret at some point"
  (Compulife v Newman, Eleventh Circuit 2020, slip opinion at 45;
  about an insurer's database that its owner kept encrypted).
  `R0-01` records that reverse engineering is not an improper means.

### Constants: how references and projects treat them

- Asahi Linux, a project's own view: "you can take inspiration from register names
  (since those are effectively hardware documentation;
  we do not consider mere last-level register names to be copyrightable),
  but do not copy whole #define blocks or include files".
  "Register values and command buffers are usually not considered copyrightable",
  with an exception "where code or large blobs of data are uploaded to the hardware" (Asahi copyright policy).
- The ReactOS audit page lists, under "Proposed standards for the audit", signs that a function was not written cleanly:
  among them arguments given "unknown" values, "functions for which there is NO DOCUMENTATION",
  and "functions with undocumented magic numbers" (archived copy).
  The test is whether a public source or a test exists for the value, not whether numbers are protected (inference).
  The page does not say that the standards were adopted.
- Pan Docs is released under CC0, and neither its contributing guide nor the gbdev contribution page states a rule on
  where values may come from (text search of five pages).
  Its history page says that the 2008 wiki version used "Martin Korth's 2001 revision as a baseline".
  A dedication covers only rights its contributors hold (inference).
- Pan Docs prints the cartridge-header logo as a hexadecimal dump,
  describing it as "a bitmap image that is displayed when the Game Boy is powered on" which "must match"
  or "the boot ROM won't allow the game to run" (Pan Docs, The Cartridge Header).
  The page makes no statement about copyright or trade mark in the logo.
  This note does not record the bytes.
- Registries of constants state their status in three ways.
  IANA dedicates its registries under CC0 and says they "consist primarily of factual information
  that is unlikely to be protectable as a matter of copyright law" (IANA licensing terms).
  The PCI ID Repository offers a licence and says "The database is a compilation of factual data,
  and as such the copyright only covers the aggregation and formatting".
  The Linux kernel requires a licence identifier on every file, headers of definitions included,
  and no rule was found that treats register headers as unprotected facts (kernel licensing rules).
- An identifier can be restricted without a copyright claim.
  USB-IF says its vendor identifiers "may not be sold, transferred, or used by others" without its written approval
  (USB-IF, Getting a Vendor ID); the page names no legal basis.
- Catalogues publish hashes of copyrighted images as identifiers.
  No-Intro says "We do NOT help or encourage users to download or otherwise obtain any of the listed dumps",
  and since 11 September 2026 its data "may be freely used" "to the extent that the website operator owns
  or controls the applicable rights" (No-Intro, Data Usage License).
  Redump's front and download pages state no licence.
  The libretro database imports both under CC BY-SA 4.0, and its README names no permission from them.
  MAME's documentation says "software list items should represent the original media",
  and its command reference prints checksums for images, including ones labelled as a BIOS.
- No dispute about hash lists was found (three web searches).
  The reported disputes concern keys and the distribution of games, which `R0-02` covers.
- Keys are never recorded.
  That is the project's standing rule (ADR 0001, "Already decided").

### Pseudo-code and algorithm descriptions: the law

- Courts place algorithms between a program's purpose and its code, where no general rule holds.
  A program "can often be parsed into at least six levels of generally declining abstraction: (i) the main purpose,
  (ii) the program structure or architecture, (iii) modules, (iv) algorithms and data structures, (v) source code,
  and (vi) object code" (Gates Rubber, Tenth Circuit 1993).
  "The intermediate levels of abstraction, such as structure, sequence, organization, and the like,
  are less prone to generalizations" (same opinion).
- A process is free; its description may not be.
  "Although processes themselves are not copyrightable, an author's description of that process,
  so long as it incorporates some originality, may be protectable" (Gates Rubber).
  That court did not hold that algorithms are always unprotected; it sent the question back to the trial court.
- The Second Circuit said of this area: "To be frank,
  the exact contours of copyright protection for non-literal program structure are not completely clear"
  (Altai; a remark, not a holding).
- One district court ruled on descriptions of the same calculation at two levels of detail.
  A plain-language account of the method "merged with the algorithm itself" and was unprotected.
  A flow chart of "the particular steps taken" was protectable, though "close to the merger line"
  (Harbor Software, Southern District of New York 1996).
  The exhibits were the claimant's own summaries of its program,
  and "protectable" there meant only that the element went on to be compared.
- Two older district-court statements treat programming from a detailed description
  as translation. "it would probably be a violation to take a detailed description of a particular problem solution,
  such as a flowchart or step-by-step set of prose instructions, written in human language,
  and program such a description in computer language" (Synercom, Northern District of Texas 1978; a footnote remark).
  A program written from a step-by-step trading manual infringed the manual
  (Williams v Arndt, District of Massachusetts 1985).
  Both predate Altai, and their later treatment was not researched.
- The United States Copyright Office registers descriptions of programs as their own kind of work.
  "Diagrams, models, outlines, pseudocode,
  or other types of works that illustrate or describe the structure or order of operation
  for a computer program may be registered", but "may not be claimed as computer programs"
  (Compendium, section 724; the Office's manual, not binding on courts).
  This is the only primary source found that names pseudo-code in a statement of legal status.
- European Union law counts design material
  as part of the program. "the term 'computer programs' shall include their preparatory design material"
  (Directive 2009/24/EC Article 1(1)), where "a computer program can result from it at a later stage" (recital 7).
  Logic and algorithms are unprotected "to the extent that" they "comprise ideas and principles" (recital 11).
  United Kingdom law lists "preparatory design material for a computer program" as a literary work
  (CDPA section 3(1)(c)).
- English courts separate a program's design from its function. "a written work consisting of a specification of the
  functions of an intended computer program will attract protection as a literary work.
  But the functions themselves do not" (Nova v Mazooma, para 51).
  Copyright "extends to protecting the design of the program", which is distinct from "protecting its functionality"
  (SAS v WPL, High Court 2010, para 232).
- The English cases that favour reimplementation rest on no access to the code. "none of the code was read
  or copied by the defendants" (Navitaire v easyJet, para 129).
  They do not decide what follows when the person who writes the description has read the code.
- A description can carry a work across.
  A work "may be indirectly copied where the defendant's work is created through the intermediary of a verbal
  description of the claimant's work provided the description is sufficiently precise to allow the defendant to
  reproduce the claimant's work in substantial part" (Edozo v Valos, January 2026, para 23).
  That is a statement of general law about artistic works, in a strike-out ruling of a specialist first-instance court.
  The same ruling held that steps which are part of a program's functionality "are not a form of expression" of its
  source code (para 58).
- Earlier English law, as quoted in later judgments: "if the 'idea' is detailed, then there may be infringement.
  It is a question of degree" (Ibcos, quoted in Navitaire, para 124; the original was not obtained).
- Japan excludes from a program work's protection "the programming language, coding conventions,
  or algorithms used to create the work" (Copyright Act Article 10(3), unofficial translation; `R0-01` cites it).
- The 1978 WIPO Model Provisions define the thing a convention must regulate.
  A "program description" is "a complete procedural presentation in verbal, schematic or other form,
  in sufficient detail to determine a set of instructions constituting a corresponding computer program".
  They protect it with the program, and their commentary gives the example of a flow chart so detailed
  that each block "could be easily transformed into a corresponding set of machine-readable instructions".
  These were model provisions for national laws; no source read says any country enacted them as written.
- No source read gives a measurable threshold for when a description becomes that detailed.
- Changing the notation does not remove structure.
  Non-literal copying is "paraphrased or loosely paraphrased rather than word for word"
  (Oracle v Google, Federal Circuit 2014, quoting Lotus), and `R0-01` records that a translation is a derivative work.

### Pseudo-code and algorithm descriptions: practice

- Accounts of clean rooms describe prose.
  Phoenix's specifications were written "without including any examples of actual code",
  and the isolated programmer was given written descriptions of problems but no coded solutions
  (PC Magazine 1984, secondary; `R0-01`).
  Altai's programmers were given "a description of the ZEKE operating system services";
  the opinion says no more about its form.
- Asahi Linux has the reverse-engineering side write "clean documentation of the hardware",
  and tells contributors not to "reimplement identical code flows or algorithms" (Asahi copyright policy).
  The page does not define clean documentation and does not mention pseudo-code.
- One law-firm article lists what to remove from a clean-room specification: "code, pseudocode, data structures,
  naming and anything else that carries the original's expression" (Marks & Clerk, 29 October 2026, secondary).
  It cites no authority for the list.
  No project policy was found that names pseudo-code (three web searches).
- Standards bodies treat pseudo-code as code.
  ITU-T defines software to include "A set of instructions written in any programming language
  (including pseudo code and reference implementations)",
  and also "data flow charts" (Software Copyright Guidelines, issue 3.0, 2011).
  The IETF licenses "components intended to be directly processed by a computer" under the Revised BSD licence,
  apart from its prose; its list of such components includes "tables of values" and "classical programming code"
  and does not name pseudo-code (Trust Legal Provisions 5.0, section 4).
  The W3C puts programming code that its documents mark as code examples under its software licence
  (W3C Document License, 2023).
- A maker's pseudo-code can be restricted.
  Arm now writes its instruction pseudo-code "in a language known as ASL1",
  in a guide whose notice says "No part of this document may be reproduced in any form by any means without the express
  prior written permission of Arm Limited" (Arm, Architecture Specification Language Readers' Guide, 29 October 2025).
  A machine-readable Arm package carries a three-clause BSD-style notice on a third-party mirror;
  Arm's own page for it could not be reached, and whether it holds the pseudo-code was not confirmed.
  `R0-05` covers processor manuals.
- Community references mix prose, code, and pseudo-code under one licence.
  Pan Docs releases "everything (content, sources, code, figures) under the CC0 license",
  and its contributing guide gives a notation for pseudo-code (Pan Docs, History and `CONTRIBUTING.md`).
- Tests are the alternative to description.
  `R0-01` records Wine's practice and the test-vector projects.
  They describe behaviour by input and output, the level that Navitaire, SAS,
  and Edozo place outside a program's copyright (inference).
- ADR 0001 says that prose "stops where code begins" and that a reader writes "functional descriptions,
  with no code and no listings".
  It does not say on which side pseudo-code falls.
- An agent asked for pseudo-code may produce recalled code in another notation, with no fetch for the hook to see
  (inference from the memorisation studies in `R0-01`).
  No study of that was found.

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
| ROM, image, dump | A chip; a file copied from one; any game file; the act of copying |
| save state, save data | Mostly kept apart, under several spellings |
| cycle | A clock period; a machine cycle; a CPU cycle of several master clocks |
| decompilation, disassembly | Two techniques in engineering; one heading in European Union law |

- The standard vocabulary defines an emulator as a "device, computer program,
  or system that accepts the same inputs and produces the same outputs as a given system"
  and cross-refers it to simulator (SEVOCAB, attributed there to ISO/IEC/IEEE 24765:2017;
  the standard itself is paywalled).
  It has no entry for a JIT compiler, dynamic recompilation, a hypervisor, or a clean room.
- TASVideos reverses the common usage:
  an emulator "does not attempt to precisely model the state of the device being emulated;
  it only attempts to reproduce its behavior", unlike a simulation (TASVideos glossary).
  PPSSPP says it "simulates the BIOS and the entire internal operating system" (PPSSPP FAQ).
- mGBA's author writes that cycle accuracy "has a specific meaning,
  but it is often misunderstood and over-broadly applied",
  and defines it "loosely" as "every single aspect of the emulated system occurs at the correct time relative to
  everything else".
  The same article separates "cycle-count accuracy",
  in which "each component acts atomically and takes the correct amount of time" (mGBA blog, 2017).
- Projects qualify the word by component.
  SameBoy claims "T-cycle accurate emulation of LCD timing effects"; MartyPC calls one processor core "Cycle-based,
  but not fully cycle-accurate" and reports a pass rate against a test suite (project READMEs).
- The Emulation General Wiki offers a ladder from low accuracy to transistor level and classes bsnes
  as "partially cycle-accurate"; mGBA's article calls higan "(formerly bsnes)" "the most well-known example of a
  cycle-accurate emulator".
  The wiki is anonymous and names no licence.
  "Cycle-exact", "pixel-accurate", and "hardware-accurate" were found only undefined;
  "instruction-level" and "scanline-based" were not found as accuracy labels (search of the saved pages).
- mGBA's author applies high-level and low-level emulation to "programmable components
  that are not part of the emulated software itself", such as "system software (as on the PSP and 3DS)".
  It adds that "LLE implementations, however, require copies of the code to be emulated" (mGBA blog).
  Dolphin uses the pair as names of two back ends for one component (Dolphin performance guide).
- libretro defines its terms by an interface: a program "gets turned into a single library file
  (called a 'libretro core')",
  and the frontend's responsibility "is to provide all the implementation-specific details,
  such as video/audio/input drivers" (libretro API page).
  MAME uses "front-ends" for third-party tools "to make system and software selection simpler" (MAME documentation).
- Dolphin treats a JIT as one kind of recompiler: "There are many different types of recompilers",
  and a JIT "recompiles small blocks of code while the program is running".
  Its cached interpreter collects code into blocks "exactly like a JIT" but keeps decoded instructions,
  not host machine code (Dolphin progress report, September 2024; that describes Dolphin's design).
  PPSSPP writes of a JIT, "also known as a Dynarec" (PPSSPP FAQ).
  A static recompiler's README describes translating binaries "into C code that can be compiled for any platform"
  (N64Recomp README).
- Firmware has a narrow and a wide sense.
  WiiBrew: "Fixed low-level code written directly into a programmable chip.
  The Wii's system menu software is NOT firmware". libretro:
  "A BIOS file is a copy of the operating system used by the hardware that a Core is emulating".
  Pan Docs says "boot ROM" for the Game Boy's built-in program and "the SGB BIOS" for another on the same page.
  A maker's consumer pages say "system software" (PlayStation support).
  ADR 0001's closed tier names "a console's BIOS, boot ROM, or system software" and defines none of the three.
- "ROM" names a device in the standard vocabulary and a file in emulation: "In emulation,
  ROM is a copy of the contents (data) of the program chip inside a game cartridge",
  and "An image may be a ROM or a copy of disc/disk contents" (TASVideos glossary).
  MAME's documentation says "images of the original ROMs, CDs, hard disks or other media".
- Community words carry legal assumptions.
  3dbrew defines a dump as extracting "the protected contents" of a chip or disc;
  WiiBrew defines a backup as a dump kept against damage and adds that "it is officially considered piracy by Nintendo"
  (project glossaries; the second is the wiki's characterisation).
  Statutes say "back-up copy" in the European Union and "archival" in the United States
  (Directive 2009/24/EC Article 5(2); 17 U.S.C. § 117(a)(2)).
- Legal terms are fixed by statute and differ by jurisdiction.
  17 U.S.C. § 1201 defines circumvention twice, for access controls and for copy controls.
  European Union law heads Article 6 "Decompilation", for acts United States cases call disassembly.
  "Fair use" is a United States doctrine with no European Union counterpart of that name.
  `R0-02` covers the law.
- The words "taint" and "provenance" are used in more than one sense inside this repository.
  ADR 0001's tainted tier attaches to a reference document; Asahi's "taint" attaches to code and people;
  `R0-01` also calls Altai's first program tainted.
  "Provenance" is used for the origin of a fact and for the origin of code, and is defined in neither place.
- Game decompilation projects describe rebuilding source that reproduces a specific ROM, identified by a hash
  (READMEs of three closed-tier projects, prose only).
  The phrase "matching decompilation" was found used but not defined.

### Vocabulary: numbers, units, and names

- Hexadecimal notation differs by hub: a `$` prefix in Pan Docs, an `h` suffix in GBATEK, and `0x` in 3dbrew
  (observed in the fetched text; no hub page read states its convention as a rule).
- Binary sizes are written three ways: "KiB" in Pan Docs, "KBytes" and bare "K" in GBATEK, and "KB" in melonDS's FAQ.
  NIST records that "most manufacturers use megabyte to mean 2^20 = 1 048 576 bytes,
  but the manufacturers of computer storage devices usually use the term to mean 1 000 000 bytes",
  and that the IEC binary prefixes "are not part of the International System of Units (SI)"
  (NIST, Prefixes for binary multiples; the page prints the power as a superscript).
  Google's style guide says "Don't use MB if you mean MiB".
- A bare "cycle" is ambiguous.
  Pan Docs defines a dot as "one 2^22 Hz
  (≅ 4.194 MHz)
  time unit" with "4 dots per Normal Speed M-cycle". mGBA's article says the word "refers to the fundamental unit of
  timing in digital logic: the clock cycle", and that a console's bus and processors can run at different clock speeds.
- Frame rates are quoted at different precision: "59.73 Hz" in one Pan Docs table,
  and "59.7275005696058" in TASVideos' platform table.
- "NTSC" and "PAL" are used as labels for handhelds with no television output and for game versions
  (TASVideos platform table; a decompilation README).
- Console names differ by market.
  The roadmap uses North American names; one open-tier emulator lists both, as in "Sega Genesis / Mega Drive";
  hardware references use maker model codes, as in "Game Boy (DMG)" and "Game Boy Color (CGB)"
  (jgenesis README; Pan Docs).
- No quotation from the NESdev wiki is given in this section: the wiki refused direct fetches,
  and the summarising fetch tool returned two wordings for one glossary entry.

### How projects structure and enforce a glossary

- Three shapes are in use.
  One page with a heading for each term: the Rust Reference, TASVideos, and 3dbrew.
  One table: the rustc development guide.
  One file for each term: Kubernetes, where "The raw data for glossary terms is stored at the glossary directory,
  with a content file for each glossary term"; the CNCF glossary; and MDN.
- Projects that give each term a file also give it its own metadata.
  The CNCF glossary gives each entry a status of "Completed", "Feedback Appreciated", or "Not Started"
  (CNCF style guide).
  MDN handles a term with several meanings through a disambiguation page (MDN glossary guide).
- Glossary rules forbid copied definitions.
  MDN: "Don't copy and paste from other definitions or content on the internet", and "Don't use generated text either."
  CNCF: "If you like a particular section of a definition, paraphrase it in your own words."
  MDN keeps the first paragraph to "no more than two sentences" and ends each entry with a "See also" section.
- The ISO/IEC drafting rules give a checkable form,
  read here in a third-party rendering of the 2018 edition (secondary).
  A definition "shall be written in such a form that it can replace the term in its context";
  "Only one definition per terminological entry is allowed", with the domain marked where a term names two concepts;
  "Circular definitions, which repeat the term being defined, are not allowed"; and synonyms are sorted into preferred,
  admitted, and deprecated terms.
  They prefer systematic order: "Alphabetical order is the least preferred order."
  A borrowed entry must cite its source and say what was changed.
- The standards vocabulary allows its definitions to be copied "providing that its source is cited"
  (SEVOCAB results page).
- Google separates a word list of usage rulings from definitions, and advises:
  "If your document is introducing many terms, collect the definitions into a glossary" (Google, Technical Writing One).
- A community glossary can limit its own authority: "this definition is strictly for TASVideos,
  and is not meant to objectively define a video game in all contexts" (TASVideos glossary).
- This repository already expects a glossary.
  The Vale rule `Terms.yml` is an empty substitution map whose comment says "The glossary fills this map",
  and the requirement template refers to "terms defined in the glossary" (read locally).
- The structure checker can enforce a heading for each term.
  A contract with a repeatable heading pattern, required labelled text in each entry,
  and unique headings reported a missing field and a duplicate term on a sample file
  (tested locally with mdschema 0.16.0).
  For a table it can check only the header row, and a link to a table row has no anchor to check.
  Its README documents no rule for the order of repeated sections and no rule that compares two files.
- The link checker verifies links from a note to a glossary heading, and fails on a term that does not exist
  (tested locally with lychee 0.24.2).
  A term's spelling is therefore its address, and renaming a term breaks every link to it (inference).
- Vale can map a discouraged term to a preferred one: "`substitution` associates a string with a preferred form"
  (Vale documentation).
  The rule does not fire inside a code span
  (tested locally),
  and the repository's rule runs at error level,
  so it would fail a note that quotes a source using the discouraged word outside a code span (inference).
- Vale's vocabulary files would not enforce terms here.
  The generated rules need the built-in `Vale` style, and this repository's configuration lists only its own style
  (Vale documentation; tested locally with Vale 3.27.0).
- A first-use rule for abbreviations flags letter-only hexadecimal values such as `BFFF` written outside a code span
  (tested locally).
- The glossary fits no existing contract and has no row in the status table (read locally).
  The status rules say "A document moves forward only" and
  that an approved document needing a material change is replaced;
  a glossary that every later note extends strains both (inference).

### Citations: link rot and pinning

- Cited pages disappear or change.
  "Link rot refers to the URL no longer serving up any content at all.
  Reference rot, an even larger phenomenon,
  happens when a link still works but the information referenced by the citation is no longer present, or has changed"
  (Zittrain, Albert and Lessig 2014).
  That study found that "more than 70% of the URLs" in three Harvard law journals "and 50% of the URLs within U.S.
  Supreme Court opinions suffer reference rot".
- A page that answers is not proof.
  Of 353 Supreme Court links that returned a success code, "only 76% still led to the cited material" (same study).
  This repository's link checker accepts any success code, so it cannot detect that kind of change (inference).
- "A quarter of all webpages that existed at one point between 2013 and 2023 are no longer accessible,
  as of October 2023" (Pew Research Center 2024; the measure counts dead pages only, not changed ones).
- Four official addresses used for this note had moved or died on the day of research,
  among them the United States plain-language guidance and an intelligence-community directive (research log).
- Addresses in code spans are not link-checked, so their rot is silent
  (inference; that the checker skips code spans is from memory).
  `R0-01` holds 117 such addresses and one archive address (counted on 2026-11-19).
- Sources offer version pins of different kinds.
  GitHub: "instead of using a branch name in the URL", "put a commit ID.
  This will permanently link to the exact version of the file in that commit"
  (GitHub documentation).
  arXiv: "Without the version number", "the identifier refers to the most recent version of the article",
  and it recommends citing the version (arXiv help).
  A wiki page can be pinned by its revision number (observed).
- `R0-01` cites GitHub files by branch, arXiv papers without a version, and one archive copy by year only
  (observed in the note).
- Published law comes in versions that are not all official.
  European Union: "Consolidated texts have no legal effect.
  They are intended for use as documentation only" (EUR-Lex).
  United Kingdom: revised legislation incorporates later amendments,
  with an aim to update "within a maximum of three months" (legislation.gov.uk help).
  United States: "The eCFR is not an official legal edition of the CFR",
  and a Supreme Court slip opinion "is subject to formal revision before publication" (eCFR; slip opinion notice).
- Paragraph numbers survive re-pagination and slip-opinion page numbers do not (inference).
  An English practice direction tells advocates to cite the official report or transcript,
  "not the handed-down text of the judgment, as this may have been subject to late revision"
  (Practice Direction: Citation of Authorities 2012; it does not bind a research note).

### Citations: archives

- The Internet Archive offers single-page captures that "can be cited, shared, linked to",
  and publishes limits for its capture interface, among them "Max captures per day for a URL = 5"
  (Internet Archive help; Save Page Now 2 documentation, updated 22 July 2026).
- A capture can be withheld or removed.
  "Pages may not be archived due to robots exclusions and some sites are excluded by direct site owner request",
  and on removal requests "We do not make any guarantees beforehand about the outcome" (Internet Archive help).
  The Archive reports that some news publishers began blocking it in 2026 (its own account of a dispute it is party to).
  Its terms of use could not be read.
- A capture address holds a 14-digit time stamp;
  an address with only a year resolves to the nearest capture and is not a pin
  (Save Page Now 2 documentation; the second point is inference).
- English Wikipedia stopped using archive.today in February 2026,
  citing "the site using editors' and readers' computers to run a denial-of-service attack and evidence
  that the website has tampered with some archived pages"
  (Wikipedia, Archive.today guidance; the underlying facts are that community's findings and were not checked).
  The service's own FAQ names no operator and says it does not save PDF files.
- Perma.cc refused every fetch.
  Harvard-hosted posts from 2019 and 2021 describe ten free links and paid plans for users without a sponsoring library;
  current terms were not confirmed.
- WebCite, a service built for citations, says "We are currently not accepting archiving requests" (WebCite home page).
- A software hash identifier is computed "directly from the digital objects they refer to,
  by anyone that has access to a copy of those objects",
  and its durability "depends on the artifact it identifies being permanently archived"
  (SWHID specification 1.2; SWHID FAQ).
  Computing one for a walled or closed repository would need the copy that ADR 0001 restricts (inference).
- The United States Supreme Court keeps its own copies:
  "an attempt is made to capture in PDF format the material cited in an opinion"
  (Supreme Court, Online Sources Cited in Opinions).
- Wikipedia's practice is a live address, an archive address, an archive date,
  and optionally the supporting quotation stored in the citation,
  which "can also provide insurance against failure of the chosen web archiving service"
  (Wikipedia, Link rot; a how-to page).
- A capture that the project requests is a copy on a third party's servers that the project cannot recall.
  If the page were later classed as tainted or leaked, the copy and its address would remain (inference).
  `R0-01` records that the rule lacks a procedure for a source later found to be tainted; none was found.
- The source guard blocks a tool call that pairs an archive address with a restricted or unregistered repository,
  because "archive" is one of its trigger words
  (read in `.claude/hooks/source-guard.sh`; met once during this research).
  An agent session therefore cannot re-check an archived README of such a repository.

### Claim status and verification

- `R0-01` marks where a claim came from: read in the original
  (no marker), "(secondary)", "(from memory)", or "(inference)".
  It labels authority in prose, such as a holding, a consent judgment, or a party's own account,
  and records verification once, in its Scope.
- Other vocabularies record different things.
  Wikipedia's tags record a later reviewer's result:
  "Failed verification" is used when "the source does not support what is contained in the article"
  (template documentation).
  The United States intelligence standard and the IPCC grade likelihood in fixed words with numeric bands,
  and the bands differ: "likely" is 55 to 80% in one and 66 to 100% in the other (ICD 203; IPCC guidance note 2010).
  ICD 203 also requires that products "distinguish statements
  that convey underlying intelligence information used in analysis from statements that convey assumptions or judgments"
  (section D.6.e).
  GRADE rates a body of evidence at four levels (Cochrane Handbook, chapter 14).
  None has a class for a claim made from memory (inference).
- Wikipedia's policy says "A source may be considered primary for one statement but secondary for a different one"
  (No original research).
  It prefers secondary sources for interpretation; this project prefers primaries,
  so the word matches and the preference is reversed (inference).
- The fact-checking code asks for "the best available primary, not secondary,
  sources of evidence wherever suitable primary sources are available",
  and for sources identified "in such a way that users can replicate their work" (IFCN Code of Principles, principle 2).
- Cochrane requires "(at least) two people working independently" to extract outcome data,
  and reports one study in which that "resulted in fewer errors than data extraction by a single author followed by
  verification by a second" (Cochrane Handbook, chapter 5; the study itself was not read).
  This project's second pass is the weaker of those two designs (inference).
- Tools that write with citations misattribute.
  A study of commercial legal research tools defines a hallucination as "a response
  that contains either incorrect information or a false assertion that a source supports a proposition",
  and found that the tools "each hallucinate between 17% and 33% of the time" (Magesh and others 2024, version 1).
  A broadcaster found that "13% of the quotes sourced from BBC articles were either altered from the original source
  or not present in the article cited", from 8 of 62 responses (BBC 2025; the BBC is an interested party).
  A preprint on research agents reports "citation accuracy ranging from 40--80% across systems"
  (DeepTRACE 2025, abstract only; its definition was not read).
- A court sanctioned lawyers who "submitted non-existent judicial opinions with fake quotes
  and citations created by the artificial intelligence tool ChatGPT"
  (Mata v Avianca, Southern District of New York 2023, sanctions order).
- The fetch tool used here shortens quotations by design: asked for verbatim sentences,
  it answered that it would keep quotations within a 125-character limit (research log).
- No source read has a mark for "this quotation was compared with the raw page".

### The tooling a convention must fit

All read in this repository's configuration or tested locally on 2026-11-19.

- The prose checker rejects thirteen filler words and ten wordy phrases at error level,
  and applies them inside quotation marks and block quotations but not inside code spans.
  Several standard scales cannot be reproduced in running text for that reason,
  and the rule also rejects the first word of the term `just-in-time` (met while writing this note).
- The formatter puts each sentence on its own line and breaks after some abbreviations followed by a capital or a digit.
  It broke after "v." and "Art." and not after "Cir." or "pp." in a test.
- No line may exceed 120 characters.
  A long address passes alone on its line or as a link destination; a long table row fails and is not reflowed.
- The topic-study contract allows four frontmatter fields,
  so a verification record cannot go there without a contract change.
- Nothing fixes the English variety.
  The spelling checker sets no locale and accepted both spellings of ten test words; the documents use British forms,
  such as "licence" as the noun, in seven files against one.
- Dates in frontmatter are `YYYY-MM-DD` by rule; `R0-01` writes event dates in words.
- The keywords of RFC 2119 mark requirements in specifications:
  RFC 2119 limits them to what is required "for interoperation or to limit behavior which has potential
  for causing harm" (section 6).
  A research note states findings and options and has no requirements to mark (inference).

## Options and trade-offs

The options answer five separate questions and can be combined.
Options 1 to 5 concern the glossary, 6 to 9 quoting, 10 to 13 constants and tables, 14 to 17 descriptions of algorithms,
and 18 to 21 citations and verification.

### 1. One glossary file with a heading for each term

- **What:** a single document in which each term is a heading, with its definition and labelled lines beneath.
- **Costs:** one file that many later changes touch; a term's spelling becomes its link address;
  the file's status has to be reconciled with the rule that approved documents are replaced, not edited.
- **Gains:** the structure checker can require fields in each entry and reject duplicates,
  and the link checker verifies links from notes to terms (tested locally).
- **Used by:** the Rust Reference, TASVideos, and 3dbrew.

### 2. One glossary file holding a table

- **What:** a single table of terms and meanings.
- **Costs:** rows have no anchors, so notes cannot link to a term; the 120-character limit caps each definition;
  the checker sees only the header row.
- **Gains:** compact, and quick to scan.
- **Used by:** the rustc development guide; Microsoft's term collections.

### 3. One file for each term

- **What:** a folder of small files, each with frontmatter and a fixed body.
- **Costs:** many files and a naming rule; an index written by hand, because this repository has no site generator.
- **Gains:** each term can carry its own status and history, and a contested term can have a page for each sense.
- **Used by:** Kubernetes, the CNCF glossary, and MDN.

### 4. Definitions inside each note, with an index

- **What:** every note defines its terms at first use, and a glossary page only lists terms and links to the notes.
- **Costs:** two notes can define one term differently with nothing to detect it; approved notes are not rewritten,
  so a later change of preferred term leaves them inconsistent.
- **Gains:** a definition sits beside its evidence; no shared file to maintain.
- **Used by:** ISO documents, each of which defines the terms it uses; Google's advice for documents with few terms.

### 5. A word list enforced by the prose checker

- **What:** rulings of the form "use this, not that", applied by a substitution rule; it can accompany any option above.
- **Costs:** at error level the rule also fires on quotations that contain the discouraged word,
  and research notes quote sources that say `savestate`, `dynarec`, and `BIOS`;
  the vocabulary files enforce nothing under the present configuration.
- **Gains:** consistent spelling without review effort; the rule file already exists and is empty.
- **Used by:** Google's word list and Microsoft's A to Z list, as guidance; this repository's `Terms.yml`, unfilled.

### 6. No quotations

- **What:** notes state every point in their own words, with a pinpoint citation.
- **Costs:** the reader cannot see a source's limiting words; close paraphrase can still infringe and can distort;
  nothing shows whether the note-taker read the passage or a summary of it.
- **Gains:** no protected text is reproduced, and nothing needs checking character by character.
- **Used by:** no publisher read forbids quotation outright.
  One appeals court suggested that a "paraphrase or a summary" may serve where the full text is not needed
  (ASTM v Public.Resource.Org, D.C. Circuit 2018; guidance on remand, not a holding).

### 7. Short attributed quotations under a numeric cap

- **What:** a quotation may run to a set number of words, or a set share of the note, and no further.
- **Costs:** no law supplies the number, so the cap is a project rule that may be read as a guarantee;
  a cap tempts cutting a quotation at the point where its limit is stated.
- **Gains:** a reviewer or a script can check it; the note's own text stays dominant.
- **Used by:** nobody as a permission rule.
  The numbers found are formatting thresholds of 40 and 50 words and the IETF's one-fifth trigger for legends.

### 8. Quotation rules by class of source

- **What:** quote freely from law and licences that are unprotected or openly licensed,
  sparingly from published prose in copyright, verbatim only from sources that forbid adaptation,
  and never from unpublished, leaked, or tainted material.
- **Costs:** the class of a legal text differs by country;
  a publisher's summary of a free text is a different class from the text; each source's terms must be recorded.
- **Gains:** follows the statutory condition of lawful availability and the cases on unpublished works;
  agrees with ADR 0001.
- **Used by:** Wikipedia, which treats public-domain and compatibly licensed text differently from non-free text.

### 9. Exact text, marked changes, and a named part

- **What:** a quotation is admitted only when its words were confirmed against the raw page;
  every omission and insertion is marked; no omission may change the meaning;
  and the citation says which part of the document the words come from.
- **Costs:** tooling and time; raw text has artefacts, so a normalisation rule must be stated;
  the prose checker rejects some words even inside quotations, which pushes authors toward other passages.
- **Gains:** addresses the three failures found on `R0-01`: cut quotations, wrong attribution,
  and a summary's words presented as the source's; meets the accuracy conditions in several reuse licences.
- **Used by:** Wikipedia's "principle of minimal change"; legal citation practice
  (The Indigo Book); the second pass on `R0-01`.

### 10. Any single value with a cited source

- **What:** a note may state any address, size, bit position, timing, or identifier if it names where it was found.
- **Costs:** the cited reference may not say where its own values came from; a cited source can be wrong.
- **Gains:** every value can be re-checked; fits the cases on facts and short identifiers.
- **Used by:** Xenia's provenance comments (`R0-01`); the test in the ReactOS audit page.

### 11. Values only with a second source or a test

- **What:** a value enters a note only when two independent sources, or a reproducible test, confirm it.
- **Costs:** slower; independence is hard to show when references descend from one another;
  tests need lawful hardware or software.
- **Gains:** guards accuracy, and shows the value is a discoverable fact and not one author's document.
- **Used by:** Wine's tests as the record (`R0-01`); the fact-checking code's rule of more than one source.

### 12. Tables built in the note's own arrangement

- **What:** single facts are taken freely, but a source's table, list, or block of definitions is not reproduced;
  the note compiles its own, with a source for each row.
- **Costs:** needs judgement about when a set of values becomes the source's table; where hardware dictates the order,
  an independent arrangement may be identical anyway.
- **Gains:** addresses compilation copyright and the database rights at once; keeps provenance for each row.
- **Used by:** Asahi Linux, which forbids copying "whole #define blocks or include files".

### 13. No bytes of firmware, with or without an exception for short identifiers

- **What:** notes never hold keys, logo bitmaps, fonts, or code taken from a console or a game,
  and describe them instead; a variant allows a short identifier that a format or a check requires,
  with the reason stated.
- **Costs:** a reader must find the bytes elsewhere; no court fixed a length for the variant;
  the question returns when code is written.
- **Gains:** avoids at once the doubts about pictorial works, trade marks, and extracted firmware;
  the variant matches the facts on which United States courts declined protection.
- **Used by:** the project's standing rule on keys; Asahi's rule on firmware blobs.
  Pan Docs does the contrary and prints a header logo.

### 14. Prose, tables, and diagrams only

- **What:** behaviour is described in sentences, tables of inputs and outputs, formulas, and state or timing diagrams,
  with no code and no pseudo-code.
- **Costs:** long prose for exact behaviour, and room for ambiguity;
  prose that follows a source's steps one by one can still carry its sequence.
- **Gains:** matches the recorded accounts of clean-room specifications and the wording of ADR 0001.
- **Used by:** Phoenix by its press account; Accolade's manual; the specification
  that one law-firm article describes (secondary).

### 15. Pseudo-code only from maker documents or the note-taker's own tests

- **What:** pseudo-code is allowed when written from a maker's public documentation or from test results,
  and never by a session that has read an implementation of the same behaviour.
- **Costs:** provenance is needed for each block; maker documentation may forbid reproducing its own pseudo-code;
  the rule does not reach what a model recalls from training.
- **Gains:** rests on the fact that decided the favourable English cases, namely no access to the code.
- **Used by:** no project was found that states it.
  It combines the facts of Navitaire and SAS with documentation practice at Pan Docs.

### 16. Pseudo-code in a neutral notation, from any source

- **What:** pseudo-code is allowed everywhere, in a notation and a structure that the note-taker chooses.
- **Costs:** a changed notation leaves sequence and organisation intact, and translation is the classic infringing act;
  standards bodies treat pseudo-code as code and license it apart from prose.
- **Gains:** precise and readable.
- **Used by:** Arm, in its own defined language; Pan Docs in places.

### 17. Tests in place of descriptions

- **What:** behaviour is captured as executable tests or test vectors, and the note points to them.
- **Costs:** expected values need lawful hardware or a trusted source,
  and some published vectors come from emulators (`R0-01`); not possible before any code exists.
- **Gains:** describes behaviour by input and output only.
- **Used by:** Wine, Mono, and Samba (`R0-01`); the test-vector projects.

### 18. Version pins in the source list

- **What:** each source carries what fixes its version: a commit, a release, a revision number, an edition,
  a paper's version, or the date to which a statute text is current.
- **Costs:** must be found for each source, and some have none;
  a code-host page of a restricted repository cannot be opened to find a commit.
- **Gains:** a later check can tell a changed page from a wrong citation.
- **Used by:** GitHub and arXiv recommend it for their own addresses; Cochrane prints its own version line.

### 19. Archive copies

- **What:** each source also carries the address and date of a copy in a web archive,
  made by the project or already there.
- **Costs:** every archive examined has a recorded weakness: removal on request, blocking by publishers, outage,
  closure, or doubt about its integrity; a capture the project requests cannot be recalled;
  the source guard blocks archive addresses of restricted repositories.
- **Gains:** the citation survives link rot.
- **Used by:** Wikipedia; law reviews and courts through Perma.cc; the United States Supreme Court with its own copies.

### 20. The supporting quotation stored with the citation

- **What:** the words that support a claim are kept in the note, so that a reader can compare them with any copy.
- **Costs:** more third-party text in a GPL-3.0 repository, against options 6 and 7; the prose checker's filler rule.
- **Gains:** the claim stays checkable if every copy of the page disappears.
- **Used by:** Wikipedia's quotation field; the evidence files behind this note, which are not published.

### 21. A verification record for each claim, or one statement for the note

- **What:** either each claim carries the result of a second check, or the Scope says once how the note was checked.
- **Costs:** marks on each claim clutter the text and need dates; one statement says nothing about what failed;
  either way the checker is a model with the same tools as the author.
- **Gains:** marks show which claims a second reader tested; one statement costs nothing.
- **Used by:** Wikipedia's dated tags for each claim; Cochrane's two independent extractions;
  `R0-01`'s single statement.

## Implications for Rustalgia

- Notes that grade emulators as "cycle-accurate" will not be comparable, because sources mean different things by it.
  This feeds the functional-area map (`R1-90`) and the quality targets (`R6-02`),
  and is a reason for the glossary to require a qualifier.
- ADR 0001's closed tier turns on "BIOS, boot ROM, or system software", which it does not define,
  and its line between prose and code does not place pseudo-code.
  The glossary proposed with this note defines the first; the second is the owner's choice,
  and would become a small correction to the ADR or a new one.
- A description written by a session that read an implementation is the case the favourable rulings leave open.
  The convention for reader sessions, and any provenance control in `R0-06`,
  should treat the level of detail of a functional description as a control, not as style.
- No legal number exists for quotation length or for the length of a recorded byte sequence.
  Any cap in the conventions is a project rule; it feeds a requirement on note content,
  and `R0-03` decides what the repository's licence notice says about quoted passages.
- Whole tables carry risks that single values do not,
  and the European and United Kingdom database rights depend on facts the project cannot see.
  This feeds the source map (`R0-05`), which records each hub's licence, and the hardware primers,
  which will be full of tables.
- Citations in approved notes are already unpinned, and addresses in code spans rot silently.
  Pinning and any archive rule feed a requirement on research notes;
  whether `R0-01` is pinned in place is the owner's choice.

## Open questions

- Is pseudo-code prose or code for ADR 0001, both for what may be read and for what a reader session may write?
  A decision by the owner.
- Does the prose checker's filler rule apply inside quotations by intent?
  A decision by the owner; the alternatives are code spans, an exemption, or the present practice.
- Is a value that designers chose freely, such as a waveform or palette table, a fact once it is fixed in silicon?
  No source read says; the hardware primers will meet the question.
- Is measuring hardware "obtaining" or "creating" data for the database rights, and who is the maker of a wiki's tables?
  No ruling was found; `R0-05` can record each hub's makers and location.
- Do agent sessions that fetch English judgments fall under the "computational analysis" exclusion?
  The licence gives no number; `R0-02` fetches the most judgments and can record the risk.
- Can CC BY-SA 3.0 text reach a GPL-3.0 note through version 4.0?
  No page read says; `R0-03`.
- What do Cantor Fitzgerald, Ibcos, and John Richardson say in their own words, and was Edozo v Valos appealed?
  A law-report source that answers a script would settle the first.
- Does a model asked for pseudo-code of a named system reproduce a particular implementation's structure?
  No study was found; `R0-06`.
- What do Wine's guidelines say today about tables, constants, and headers?
  The page refused every fetch; a later attempt.
- Does the link checker skip code spans, and does the spelling checker read identifiers inside them?
  A local test in a later change.
- What notation do the NESdev wiki and other hubs state for numbers and bits?
  `R0-05` can check when it surveys each hub.
- Do the conventions for notes also govern tables and constants in code?
  `R0-06` or an ADR.

## Sources

Every source below was read on 2026-11-19.
Repository files named in the findings were read in the working tree on the same day.

Statutes, treaties, regulations, and official guidance:

- Berne Convention, Paris Act, Articles 6bis and 10: `https://www.wipo.int/wipolex/en/text/283698`.
- WIPO, Model Provisions on the Protection of Computer Software, in "Copyright", January 1978:
  `https://www.wipo.int/edocs/pubdocs/en/copyright/120/wipo_pub_120_1978_01.pdf`.
- 17 U.S.C. §§ 101, 103, 105, 107, 117, 1201: `https://www.law.cornell.edu/uscode/text/17/107` and sibling pages.
- 37 C.F.R. § 202.1: `https://www.law.cornell.edu/cfr/text/37/202.1`.
- United States Copyright Office, fair use FAQ: `https://www.copyright.gov/help/faq/faq-fairuse.html`.
- United States Copyright Office, Compendium of Practices, third edition
  (28 January 2021),
  chapters 700 and 900: `https://www.copyright.gov/comp3/chap700/ch700-literary-works.pdf`
  and `https://www.copyright.gov/comp3/chap900/ch900-visual-art.pdf`.
- United States Copyright Office, Policy Decision on Copyrightability of Digitized Typefaces, 53 Federal Register 38110
  (29 September 1988), scanned issue: `https://www.govinfo.gov/content/pkg/FR-1988-09-29/pdf/FR-1988-09-29.pdf`.
- Copyright, Designs and Patents Act 1988, sections 3, 30, 163, 164, 178:
  `https://www.legislation.gov.uk/ukpga/1988/48/section/30` and sibling pages.
- Copyright and Rights in Databases Regulations 1997, regulations 13, 16, 18:
  `https://www.legislation.gov.uk/uksi/1997/3032/regulation/18` and sibling pages.
- Directive 2001/29/EC, read from the Publications Office: `http://publications.europa.eu/resource/celex/32001L0029`.
- Directive 2009/24/EC: `https://www.legislation.gov.uk/eudr/2009/24/adopted`
  and `https://eur-lex.europa.eu/LexUriServ/LexUriServ.do?uri=CELEX:32009L0024:EN:HTML`.
- Directive 96/9/EC, as published in 1996: `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:31996L0009`.
- Commission Decision 2011/833/EU: `http://publications.europa.eu/resource/celex/32011D0833`.
- EUR-Lex, Consolidated texts: `https://eur-lex.europa.eu/collection/eu-law/consleg.html`.
- Japan, Copyright Act, unofficial translation: `https://www.japaneselawtranslation.go.jp/en/laws/view/4207`.
- Japan, Ministry of Justice, Japanese Law Translation, notice on the home page:
  `https://www.japaneselawtranslation.go.jp/en`.
- Japan, Agency for Cultural Affairs, Copyright Textbook, fiscal 2026 edition
  (in Japanese): `https://www.bunka.go.jp/seisaku/chosakuken/seidokaisetsu/pdf/94436101_01.pdf`.
- Canada, Copyright Act sections 29 and 29.1:
  `https://laws-lois.justice.gc.ca/eng/acts/C-42/section-29.html`
  and `https://laws-lois.justice.gc.ca/eng/acts/C-42/section-29.1.html`.
- Canada, Reproduction of Federal Law Order, SI/97-5:
  `https://laws-lois.justice.gc.ca/eng/regulations/SI-97-5/FullText.html`.
- Australia, Copyright Act 1968, compilation of 2 April 2026, volume 1:
  `https://www.legislation.gov.au/C1968A00063/latest/text`.
- Australia, Federal Register of Legislation, terms of use: `https://www.legislation.gov.au/terms-of-use`.
- legislation.gov.uk, help page and "Understanding legislation":
  `https://www.legislation.gov.uk/help` and `https://www.legislation.gov.uk/understanding-legislation`.
- eCFR, Getting started: `https://www.ecfr.gov/reader-aids/using-ecfr/getting-started`.
- Practice Direction: Citation of Authorities (2012):
  `https://www.judiciary.uk/wp-content/uploads/JCO/Documents/Practice+Directions/lcj-pract-dir-citation-authorities-2012.pdf`.
- Intelligence Community Directive 203, Analytic Standards
  (2 January 2015): `https://archive.dni.gov/files/documents/ICD/ICD-203.pdf`.
- RFC 2119: `https://www.rfc-editor.org/rfc/rfc2119.txt`.

Court decisions:

- Wheaton v Peters (United States Supreme Court 1834): `https://www.law.cornell.edu/supremecourt/text/33/591`.
- Feist v Rural Telephone (United States Supreme Court 1991): `https://www.law.cornell.edu/supremecourt/text/499/340`.
- Masson v New Yorker Magazine (United States Supreme Court 1991):
  `https://www.law.cornell.edu/supremecourt/text/501/496`.
- Campbell v Acuff-Rose Music (United States Supreme Court 1994):
  `https://www.law.cornell.edu/supremecourt/text/510/569`.
- Georgia v Public.Resource.Org (United States Supreme Court 2020):
  `https://www.law.cornell.edu/supremecourt/text/18-1150`.
- Google v Oracle America, slip opinion notice (2021): `https://www.supremecourt.gov/opinions/20pdf/18-956_d18f.pdf`.
- Nutt v National Institute, 31 F.2d 236 (2d Cir. 1929): `https://static.case.law/f2d/31/cases/0236-01.json`.
- Wainwright Securities v Wall Street Transcript, 558 F.2d 91
  (2d Cir. 1977): `https://law.resource.org/pub/us/case/reporter/F2/558/558.F2d.91.76-7468.937.html`.
- Synercom Technology v University Computing, 462 Federal Supplement 1003
  (N.D. Tex. 1978): `https://static.case.law/f-supp/462/cases/1003-01.json`.
- Williams v Arndt, 626 Federal Supplement 571 (D. Mass. 1985): `https://static.case.law/f-supp/626/cases/0571-01.json`.
- Toro v R & R Products, 787 F.2d 1208
  (8th Cir. 1986): `https://law.resource.org/pub/us/case/reporter/F2/787/787.F2d.1208.85-5240.html`.
- Salinger v Random House, 811 F.2d 90
  (2d Cir. 1987): `https://law.resource.org/pub/us/case/reporter/F2/811/811.F2d.90.86-7957.657.html`.
- Wright v Warner Books, 953 F.2d 731
  (2d Cir. 1991): `https://law.resource.org/pub/us/case/reporter/F2/953/953.F2d.731.90-9054.1762.html`.
- Sega Enterprises v Accolade, 977 F.2d 1510
  (9th Cir. 1992): `https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html`.
- Computer Associates v Altai, 982 F.2d 693
  (2d Cir. 1992): `https://law.resource.org/pub/us/case/reporter/F2/982/982.F2d.693.91-7935.91-7893.762.html`.
- Gates Rubber v Bando Chemical Industries, 9 F.3d 823
  (10th Cir. 1993): `https://law.resource.org/pub/us/case/reporter/F3/009/9.F3d.823.92-1256.html`.
- Harbor Software v Applied Systems, 925 Federal Supplement 1042
  (S.D.N.Y. 1996): `https://static.case.law/f-supp/925/cases/1042-01.json`.
- Baystate Technologies v Bentley Systems, 946 Federal Supplement 1079
  (D. Mass. 1996): `https://static.case.law/f-supp/946/cases/1079-01.json`.
- American Dental Association v Delta Dental Plans Association, 126 F.3d 977
  (7th Cir. 1997): `https://law.resource.org/pub/us/case/reporter/F3/126/126.F3d.977.96-4140.html`.
- Mitel v Iqtel, 124 F.3d 1366 (10th Cir. 1997):
  `https://law.resource.org/pub/us/case/reporter/F3/124/124.F3d.1366.95-1394.html`.
- Lexmark International v Static Control Components, 387 F.3d 522
  (6th Cir. 2004): `https://law.resource.org/pub/us/case/reporter/F3/387/387.F3d.522.03-5400.html`.
- Southco v Kanebridge, 390 F.3d 276 (3d Cir. 2004):
  `https://law.resource.org/pub/us/case/reporter/F3/390/390.F3d.276.02-1243.html`.
- ATC Distribution Group v Whatever It Takes Transmissions & Parts, 402 F.3d 700
  (6th Cir. 2005): `https://law.resource.org/pub/us/case/reporter/F3/402/402.F3d.700.03-6505.html`.
- Oracle America v Google, 750 F.3d 1339
  (Fed. Cir. 2014): `https://www.cafc.uscourts.gov/opinions-orders/13-1021.opinion.5-7-2014.1.pdf`.
- American Society for Testing and Materials v Public.Resource.Org, case 17-7035
  (D.C. Cir. 17 July 2018):
  `https://www.govinfo.gov/content/pkg/USCOURTS-caDC-17-07035/pdf/USCOURTS-caDC-17-07035-0.pdf`.
- Compulife Software v Newman, case 18-12004
  (11th Cir. 20 May 2020): `https://media.ca11.uscourts.gov/opinions/pub/files/201812004.pdf`.
- hiQ Labs v LinkedIn, case 17-16783 (9th Cir. 18 April 2022):
  `https://cdn.ca9.uscourts.gov/datastore/opinions/2022/04/18/17-16783.pdf`.
- Mata v Avianca, case 22-cv-1461 (S.D.N.Y. 22 June 2023), opinion and order on sanctions:
  `https://storage.courtlistener.com/recap/gov.uscourts.nysd.575368/gov.uscourts.nysd.575368.54.0.pdf`.
- Thomson Reuters v ROSS Intelligence, case 25-2153
  (3d Cir. 29 September 2026): `https://www2.ca3.uscourts.gov/opinarch/252153p.pdf`.
- Infopaq International v Danske Dagblades Forening, C-5/08: `http://publications.europa.eu/resource/celex/62008CJ0005`.
- British Horseracing Board v William Hill, C-203/02:
  `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62002CJ0203`.
- Football Dataco v Yahoo, C-604/10: `https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62010CJ0604`.
- Pelham v Hütter, C-476/17: `http://publications.europa.eu/resource/celex/62017CJ0476`.
- Spiegel Online v Beck, C-516/17: `http://publications.europa.eu/resource/celex/62017CJ0516`.
- Navitaire v easyJet [2004] EWHC 1725 (Ch): `https://caselaw.nationalarchives.gov.uk/ewhc/ch/2004/1725`.
- Nova Productions v Mazooma Games [2007] EWCA Civ 219: `https://caselaw.nationalarchives.gov.uk/ewca/civ/2007/219`.
- SAS Institute v World Programming [2010] EWHC 1829 (Ch): `https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1829`.
- Pasternak v Prescott [2022] EWHC 2695 (Ch): `https://caselaw.nationalarchives.gov.uk/ewhc/ch/2022/2695`.
- Edozo v Valos [2026] EWHC 93 (IPEC): `https://caselaw.nationalarchives.gov.uk/ewhc/ipec/2026/93`.
- Supreme Court of Japan, 28 March 1980, case 1976(O)923
  (in Japanese): `https://www.courts.go.jp/assets/hanrei/hanrei-pdf-53283.pdf`.
- CCH Canadian v Law Society of Upper Canada, 2004 SCC 13:
  `https://decisions.scc-csc.ca/scc-csc/scc-csc/en/item/2125/index.do`.

Licences and reuse terms:

- Creative Commons Attribution 4.0, Attribution-NoDerivatives 4.0, and Attribution-NonCommercial 4.0, legal code:
  `https://creativecommons.org/licenses/by/4.0/legalcode.en` and sibling pages.
- Creative Commons, FAQ and policies: `https://creativecommons.org/faq/` and `https://creativecommons.org/policies/`.
- Creative Commons, compatible licences:
  `https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/`.
- Creative Commons, ShareAlike compatibility: GPLv3:
  `https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3`.
- GNU licence list: `https://www.gnu.org/licenses/license-list.html`.
- GNU GPL version 3: `https://www.gnu.org/licenses/gpl-3.0.txt`.
- GNU Free Documentation License 1.3: `https://www.gnu.org/licenses/fdl-1.3.html`.
- Open Government Licence version 3.0: `https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/`.
- Open Justice Licence version 2.0, and "When you need permission":
  `https://caselaw.nationalarchives.gov.uk/open-justice-licence`
  and `https://caselaw.nationalarchives.gov.uk/when-you-need-permission`.
- Court of Justice of the European Union, copyright notice and legal notice:
  `https://curia.europa.eu/site/jcms/d2_5167/en/copyright` and `https://curia.europa.eu/jcms/jcms/T5_5135/en/`.
- IETF Trust Legal Provisions 5.0, and the list of code components:
  `https://trustee.ietf.org/documents/trust-legal-provisions/tlp-5/`
  and `https://trustee.ietf.org/documents/trust-legal-provisions/code-components-list-3/`.
- W3C Document License, 2023 version: `https://www.w3.org/copyright/document-license-2023/`.
- ITU-T Software Copyright Guidelines, issue 3.0 (2011):
  `https://www.itu.int/dms_pub/itu-t/oth/04/04/T04040000040004MSWE.docx`.
- IANA, licensing terms: `https://www.iana.org/help/licensing-terms`.
- PCI ID Repository: `https://pci-ids.ucw.cz/`.
- USB-IF, Getting a Vendor ID: `https://www.usb.org/getting-vendor-id`.
- No-Intro, home page and Data Usage License
  (11 September 2026): `https://no-intro.org/` and `https://datomatic.no-intro.org/terms.html`.
- Redump, front page and downloads page: `http://redump.org/` and `http://redump.org/downloads/`.
- libretro-database, README and licence file:
  `https://raw.githubusercontent.com/libretro/libretro-database/master/README.md`.
- Arm, Architecture Specification Language Readers' Guide, 111069 A.a
  (29 October 2025): `https://documentation-service.arm.com/static/6901ca9402789941c1920b3a`.
- Arm machine-readable specification, third-party mirror, README and notice:
  `https://kernel.googlesource.com/pub/scm/linux/kernel/git/maz/AARCHMRS/`.

Project policies, documentation, and glossaries:

- Asahi Linux, Copyright and Reverse Engineering Policy: `https://asahilinux.org/copyright/`.
- ReactOS wiki, Audit, archived copy: `https://web.archive.org/web/2024/https://reactos.org/wiki/Audit`.
- Linux kernel, licensing rules: `https://docs.kernel.org/process/license-rules.html`.
- Pan Docs, About, History, The Cartridge Header, Power-Up Sequence, Rendering, and Specifications:
  `https://gbdev.io/pandocs/History.html` and sibling pages.
- Pan Docs repository, README and `CONTRIBUTING.md`; gbdev contribution guidelines:
  `https://raw.githubusercontent.com/gbdev/pandocs/master/CONTRIBUTING.md` and `https://gbdev.io/contributing.html`.
- GBATEK: `https://problemkaputt.de/gbatek.htm`.
- 3dbrew, Glossary: `https://www.3dbrew.org/wiki/Glossary`.
- WiiBrew, Glossary: `https://wiibrew.org/wiki/Glossary`.
- TASVideos, Glossary (edited 23 August 2026), Platform Framerates, and Site License: `https://tasvideos.org/Glossary`,
  `https://tasvideos.org/PlatformFramerates`, and `https://tasvideos.org/SiteLicense`.
- Emulation General Wiki, Emulation accuracy
  (11 May 2026),
  High and low-level emulation, and Copyrights:
  `https://emulation.gametechwiki.com/index.php/Emulation_accuracy` and sibling pages.
- endrift, "Emulation Accuracy, Speed, and Optimization", mGBA blog
  (30 April 2017): `https://mgba.io/2017/04/30/emulation-accuracy/`.
- Dolphin, progress report for releases 2407 and 2409
  (4 September 2024),
  and performance guide: `https://dolphin-emu.org/blog/2024/09/04/dolphin-progress-report-release-2407-2409/`
  and `https://dolphin-emu.org/docs/guides/performance-guide/`.
- PPSSPP, FAQ: `https://www.ppsspp.org/docs/faq/`.
- melonDS, FAQ: `https://melonds.kuribo64.net/faq.php`.
- libretro, API page and BIOS guide: `https://www.libretro.com/index.php/api/`
  and `https://docs.libretro.com/guides/bios/`.
- MAME documentation 0.289, "What is MAME", front-ends, software lists, and command reference:
  `https://docs.mamedev.org/whatis.html` and sibling pages.
- READMEs of SameBoy, MartyPC, jgenesis, ares, and N64Recomp:
  `https://raw.githubusercontent.com/LIJI32/SameBoy/master/README.md`,
  `https://raw.githubusercontent.com/dbalsom/martypc/main/README.md`,
  `https://raw.githubusercontent.com/jsgroth/jgenesis/master/README.md`,
  `https://raw.githubusercontent.com/ares-emulator/ares/master/README.md`,
  and `https://raw.githubusercontent.com/N64Recomp/N64Recomp/main/README.md`.
- READMEs of three decompilation projects
  (prose only):
  `https://raw.githubusercontent.com/zeldaret/oot/main/README.md`,
  `https://raw.githubusercontent.com/n64decomp/sm64/master/README.md`,
  and `https://raw.githubusercontent.com/pret/pokeemerald/master/README.md`.
- PlayStation support, system software: `https://www.playstation.com/en-us/support/hardware/ps5/system-software/`.
- SEVOCAB, the IEEE Computer Society and ISO/IEC JTC 1/SC 7 vocabulary, term searches:
  `https://pascal.computer.org/sev_display/search.action`.
- NIST, Prefixes for binary multiples: `https://physics.nist.gov/cuu/Units/binary.html`.
- Google developer documentation style guide, units of measurement; Technical Writing One, "Words":
  `https://developers.google.com/style/units-of-measure` and `https://developers.google.com/tech-writing/one/words`.
- Kubernetes documentation, custom Hugo shortcodes
  (27 November 2025): `https://kubernetes.io/docs/contribute/style/hugo-shortcodes/`.
- CNCF Cloud Native Glossary, style guide: `https://glossary.cncf.io/style-guide/`.
- MDN, "How to write a new entry in the glossary"
  (22 October 2026):
  `https://developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Howto/Write_a_new_entry_in_the_glossary`.
- The Rust Reference, glossary, and the rustc development guide, glossary:
  `https://doc.rust-lang.org/reference/glossary.html`
  and `https://rustc-dev-guide.rust-lang.org/appendix/glossary.html`.
- Vale documentation, vocabularies, substitution, and conditional:
  `https://docs.vale.sh/keys/vocabularies.md` and sibling pages.
- mdschema, README: `https://raw.githubusercontent.com/jackchuka/mdschema/main/README.md`.
- lychee documentation, checking anchor links: `https://lychee.cli.rs/recipes/anchors/`.

Publishing, citation, and verification practice:

- Wikipedia, Non-free content (7 October 2026), Manual of Style
  (16 November 2026),
  Close paraphrasing, Verifiability, Quotations, No original research, Link rot, Archive.today guidance
  (17 November 2026),
  and Template:Failed verification, read as wikitext:
  `https://en.wikipedia.org/w/index.php?title=Wikipedia:Non-free_content&action=raw` and sibling pages.
- The Indigo Book: `https://law.resource.org/pub/us/code/blue/IndigoBook.html`.
- United States Office of Research Integrity, "28 Guidelines at a Glance on Avoiding Plagiarism":
  `https://ori.hhs.gov/28-guidelines-glance-avoiding-plagiarism`.
- J. Zittrain, K. Albert, and L.
  Lessig, "Perma: Scoping and Addressing the Problem of Link and Reference Rot in Legal Citations",
  Harvard Law Review Forum, volume 127, page 176 (2014):
  `https://harvardlawreview.org/forum/vol-127/perma-scoping-and-addressing-the-problem-of-link-and-reference-rot-in-legal-citations/`.
- Pew Research Center, "When Online Content Disappears"
  (17 May 2024): `https://www.pewresearch.org/data-labs/2024/05/17/when-online-content-disappears/`.
- GitHub documentation, Getting permanent links to files:
  `https://docs.github.com/en/repositories/working-with-files/using-files/getting-permanent-links-to-files`.
- arXiv help, identifier scheme: `https://info.arxiv.org/help/arxiv_identifier.html`.
- Internet Archive help, saving pages, general information, and removal requests:
  `https://help.archive.org/help/save-pages-in-the-wayback-machine/` and sibling pages.
- Internet Archive, Save Page Now 2 public API documentation
  (updated 22 July 2026):
  `https://docs.google.com/document/d/1Nsv52MvSjbLb2PCpHlat0gkzw0EvtSgpKHu4mk0MnrA/export?format=txt`.
- Internet Archive help, FAQ on publishers blocking the Wayback Machine:
  `https://help.archive.org/help/faq-publishers-blocking-the-wayback-machine/`.
- archive.today, FAQ: `https://archive.ph/faq`.
- Perma.cc blog, posts of 7 January 2019 and 15 September 2021:
  `https://archive.blogs.harvard.edu/perma/2019/01/07/introducing-individual-account-subscription-tiers-for-perma`
  and `https://archive.blogs.harvard.edu/perma/2021/09/15/usage-plans-updates`.
- WebCite, home page: `https://webcitation.org/`.
- SWHID specification version 1.2, and FAQ:
  `https://www.swhid.org/swhid-specification/v1.2/1.Scope/` and `https://www.swhid.org/faq/`.
- Supreme Court of the United States, Online Sources Cited in Opinions:
  `https://www.supremecourt.gov/opinions/cited_urls/`.
- IPCC, Guidance Note for Lead Authors of the Fifth Assessment Report on Consistent Treatment of Uncertainties (2010):
  `https://www.ipcc.ch/site/assets/uploads/2017/08/AR5_Uncertainty_Guidance_Note.pdf`.
- Cochrane Handbook for Systematic Reviews of Interventions, chapters 5 and 14:
  `https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current/chapter-05`
  and `https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current/chapter-14`.
- International Fact-Checking Network, the commitments of the Code of Principles:
  `https://ifcncodeofprinciples.poynter.org/the-commitments`.
- V. Magesh and others, "Hallucination-Free?" (2024), version 1: `https://arxiv.org/pdf/2405.20362v1`.
- BBC, "Representation of BBC News content in AI Assistants"
  (February 2025): `https://www.bbc.co.uk/aboutthebbc/documents/bbc-research-into-ai-assistants.pdf`.
- "DeepTRACE: Auditing Deep Research AI Systems for Tracking Reliability Across Citations and Evidence" (2025),
  version 1, abstract: `https://arxiv.org/abs/2509.04499`.

Secondary sources:

- ISO/IEC Directives, Part 2, eighth edition (2018), clause 16, in a third-party rendering:
  `https://metanorma.github.io/mn-samples-iso/documents/directives/part2/document.html`.
- J. Langdell, "Phoenix Says Its BIOS May Foil IBM's Lawsuits", PC Magazine, 10 July 1984:
  `https://archive.org/stream/PC-Mag-1984-07-10/PC-Mag-1984-07-10_djvu.txt`.
- Marks & Clerk, "The Clean Room Problem"
  (29 October 2026):
  `https://www.marks-clerk.com/insights/latest-insights/102o6n6-the-clean-room-problem-ai-reverse-engineering-and-the-limits-of-safe-harbours/`.
