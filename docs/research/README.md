# Research

## Purpose

Research notes record what the project has learned, how each claim was checked,
and what the evidence recommends where a choice remains.
This guide holds the conventions that every research note follows, whatever its type.
[R0-04](topics/R0-04-glossary-and-conventions.md) sets out the options behind them; nothing here is legal advice.

## Layout

| Folder | Holds | Guide |
|---|---|---|
| `emulators/` | Studies of existing emulators | |
| `topics/` | Studies of hardware, techniques, platforms, and policy | [topics/README.md](topics/README.md) |
| `spikes/` | Reports on throwaway experiments | |

Each note is one item of the [research roadmap](../roadmap/research.md).
Terms of art are defined in the [glossary](../glossary/terms.md).

## Conventions

These conventions apply to every note.
"Shape and links" and "Questions and recommendations" were added on 2026-11-20 and applied to every note then written;
the other sections bind notes whose first pull request opened after R0-04,
and the owner decides whether an earlier note is corrected in place.
The limits in words and bytes are project rules that a reviewer can check; no source read supplies them.

### Sources

- A source is opened only as [ADR 0001](../adr/0001-restrict-reading-by-licence-tier.md) allows.
- Each finding names its source at the point of use, by a short name and a pinpoint: a paragraph, a section, a page,
  or a note number.
  A paragraph number is preferred to a page of a slip opinion.
- The citation says which part of a document is meant where parts differ in authority:
  the opinion and not the syllabus or headnote, the licence and not its FAQ, the statute and not a summary of it.
- For law and policy, the finding states the authority: the court and the stage of the case, a holding or a remark,
  a project's rule or one person's comment, and the date or version of a policy.
- The Sources section lists every source used, each with its title as a link to its address, and the date it was read;
  a spike report, which has no Sources section, lists them under Method.
  An address goes in a code span instead of a link only where a reader must not open it, as "Links" below says.
  One sentence may give the date for the whole list.
- An entry also gives what fixes the version, where the source shows it: a commit or release,
  a wiki revision or "last edited" date, an edition, the version of a paper,
  or the date to which a statute text is current.
- A translation is labelled as official, unofficial, or the note's own.
- The project does not ask a web archive to capture a page.
  An existing capture may be cited when the live page is gone, with its full time stamp.
- English judgments are fetched from the National Archives one at a time, as each is needed.

### Shape and links

- Write in good plain style, and break dense blocks of text into paragraphs that each group related points.
  The Summary is written that way too: the question, the answer, and the points that matter most to Rustalgia,
  each in its own paragraph.
- Every reference to a document in this repository is a relative link: a note, an ADR, the roadmap, the register,
  a guide, or a section of one.
  A roadmap item is linked to its note once the note exists, and otherwise to the roadmap.
- A source named in the text is linked at its first mention in each section, to the same address as its Sources entry.
- An address that a reader must not open stays in a code span and is never a link: a closed or tainted source,
  a page that holds keys or firmware, and a download of a game or a kit.
  Where the text must name one, it says why there is no link.
- A host that refuses automated requests is listed, with the reason, in the link checker's configuration,
  so that its links are kept but not fetched by CI.

### Questions and recommendations

- A question met during research is answered before the note is written, where another source, a test,
  or a calculation can answer it.
- A question about process, such as a tier, a placement, or a citation style, is settled in the note,
  and the pull request lists each such call.
- Where the evidence leaves a design choice between options,
  "Options and trade-offs" ends with a recommendation and its reasons, and the pull request lists it for the owner.
  The owner decides; an ADR records a decision that is hard to reverse.
- "Open questions" lists only what cannot be answered now, each with the roadmap item or the work that would answer it.

### Claim status

A claim with no marker rests on the original text, read on the date the note gives.
Any other claim carries one of these markers:

| Marker | Meaning |
|---|---|
| (secondary) | Rests on commentary, or on a summary or partial copy; a full transcription counts as the original |
| (from memory) | Not confirmed by any page fetched for the note |
| (inference) | The author's reasoning from the findings |
| (tested locally) | Run by the author; the note names the tool and its version |
| (lead) | Found only in a forum, a chat, a video, or a personal blog; not relied on |
| (observed) | Seen by the author in a fetched page, a repository file, or a running program, and not quoted |
| (research log) | An event while gathering the evidence, such as a refused fetch; not checkable from a source |

- Another parenthesis that says how a claim was checked names the method in words, as in "(calculated from the rates)".
- A statement that nothing was found says what was searched.
- The Scope section, or the Method section of a spike report, says how the note's claims were checked,
  and by how many independent passes.
- Notes do not grade likelihood or confidence, and do not use the capitalised keywords of RFC 2119.
  A limit on a claim is stated in words beside it.

### Quoting

- A note quotes only where the exact words matter: a rule, a definition, a holding, a licence term,
  or a statement in dispute.
  Everything else is stated in the note's own words with a citation.
- Quotation marks mean that the words were confirmed against the raw text of the page,
  not taken from a summarising tool or a search result.
  Words that could not be confirmed are paraphrased without quotation marks.
- A quotation is exact.
  Only these changes are made silently: typographic quotation marks and apostrophes become plain ones,
  inner double marks become single, and line breaks, footnote marks, paragraph numbers, and markup are dropped.
  A hyphen that only breaks a word across a line is dropped; a recognition error is corrected in square brackets.
  An omission inside a quotation is marked with "..." and an insertion with square brackets; a source's error is kept.
- A quotation is never cut so that its meaning changes.
  Words that limit a statement stay in, such as "if", "may", "generally", and "on this record".
- A quotation is no longer than its point needs, and at most 60 words.
  In every section the note's own words outnumber the quoted ones.
- A quotation is never altered to pass a check.
  If the prose checker rejects a word inside it, another passage is quoted or the point is paraphrased.
- Nothing is quoted from a leaked or unpublished source.
  From a tainted source, only the licence and policy statements that `R0-01` records may be quoted,
  and only from `R0-01`, as ADR 0001 allows.
- Text under a licence that forbids adaptation or reuse, or under a bare copyright notice,
  is quoted word for word or not at all; it is not translated or closely reworded.
  A note states facts from it in its own words and its own structure.
- A note's own translation is never placed in quotation marks.
- A paraphrase uses the note's own sentence structure and keeps the source's meaning.
  A sentence that follows a source clause by clause is a quotation that has lost its marks.

### Constants and tables

- A note may state any single value, such as an address, a size, a bit position, a timing, or an identifier,
  with its source at the point of use, subject to the limits on bytes below.
- A value for which no source or test can be named is not recorded.
- A value known only from firmware, from the code of a decompilation, or from a tainted source is not recorded.
- A table is built for the note: the rows that its point needs, in the note's own arrangement,
  with a source for the table or for each row.
  A source's table, list, or block of definitions is not reproduced whole.
  Where the hardware fixes the order, such as addresses, the note says so.
- Notes never hold cryptographic keys or anything derived from one.
- Notes never hold bytes taken from firmware or a game: no code, no logo or other bitmap, no font, no sample data.
  The note says what the bytes are for, how long they are, and where a public source describes them.
- One exception: an identifier that a format or a check requires, of at most 16 bytes,
  such as a signature string or a header's magic number, with the reason it is required.
- A checksum or hash of a game or firmware image may be given to identify what a published test or catalogue refers to,
  with the catalogue named.
  Lists of them are not copied.

### Notation

- Hexadecimal values are written with a `0x` prefix, and every hexadecimal or binary value, address,
  and register name goes in a code span.
  A quotation keeps its source's notation.
- A size counted in multiples of 1024 bytes uses the binary prefixes, as in 96 KiB; a decimal prefix, as in 96 kB,
  means multiples of 1000.
- A quantity has a space before its unit, as in 59.73 Hz.
- Bit 0 is the least significant bit.
  Where a source numbers bits from the most significant end, the note says so and converts.
- A cycle is always a cycle of a named clock.
- Dates are written as `YYYY-MM-DD` or with the month in words, as in 28 March 1980.
- Systems are named as the research roadmap names them;
  another market's name or the maker's model code follows in parentheses at first use.
- Spelling is British in the note's own words; a quotation keeps its source's spelling.

### Algorithms and pseudo-code

- Behaviour is described in sentences, in tables of inputs and outputs, in formulas, and in state or timing diagrams.
- Notes hold no code.
  Until the owner decides where pseudo-code falls under ADR 0001, they hold no pseudo-code;
  [R0-04](topics/R0-04-glossary-and-conventions.md#recommendation) recommends
  that the proposed amendment of ADR 0001 count it as code.
  A code block holds only a command and its output, a path, or configuration.
- A description says what a system does as seen from outside it: inputs, outputs, state, and timing.
  No note gives the order of steps or the internal names of an implementation;
  an emulator study describes architecture at the level of its parts, as its template says.
- The steps of the hardware itself may be described in numbered sentences without assignment or loop notation,
  from the maker's documents, an open-tier reference, or a test, with the source named.
  A reader session's description holds no listing (ADR 0001).
- A description written after reading an implementation says so.
  Whether it is still too detailed is a judgement for the reviewer, because no source read gives a threshold.
- A diagram may show the states and timing of hardware.
  It does not chart the control flow of an implementation.
- A maker's own pseudo-code is not reproduced.
