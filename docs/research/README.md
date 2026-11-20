# Research

## Purpose

Research notes record what the project has learned and how each claim was checked.
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

These conventions apply to notes begun after this guide was merged.
Earlier notes are not rewritten to match.
The limits in words and bytes are project rules that a reviewer can check; no law supplies them.

### Sources

- A source is opened only as [ADR 0001](../adr/0001-restrict-reading-by-licence-tier.md) allows.
- Each finding names its source at the point of use, by a short name and a pinpoint: a paragraph, a section, a page,
  or a note number.
  A paragraph number is preferred to a page of a slip opinion.
- The citation says which part of a document is meant where parts differ in authority:
  the opinion and not the syllabus or headnote, the licence and not its FAQ, the statute and not a summary of it.
- For law and policy, the finding states the authority: the court and the stage of the case, a holding or a remark,
  a project's rule or one person's comment, and the date or version of a policy.
- The Sources section lists every source used, each with its title, its address in a code span,
  and the date it was read.
  One sentence may give the date for the whole list.
- An entry also gives what fixes the version, where the source shows it: a commit or release,
  a wiki revision or "last edited" date, an edition, the version of a paper,
  or the date to which a statute text is current.
- A translation is labelled as official, unofficial, or the note's own.
- The project does not ask a web archive to capture a page.
  An existing capture may be cited when the live page is gone, with its full time stamp.
- English judgments are fetched from the National Archives one at a time, as each is needed.

### Claim status

A claim with no marker rests on the original text, read on the date the note gives.
Any other claim carries one of these markers:

| Marker | Meaning |
|---|---|
| (secondary) | Rests on commentary or on a copy, not on the original text |
| (from memory) | Not confirmed by any page fetched for the note |
| (inference) | The author's reasoning from the findings |
| (tested locally) | Run by the author; the note names the tool and its version |
| (lead) | Found only in a forum, a chat, a video, or a personal blog; not relied on |

- A statement that nothing was found says what was searched.
- The Scope section says how the note's claims were checked, and by how many independent passes.
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
  An omission inside a quotation is marked with "..." and an insertion with square brackets; a source's error is kept.
- A quotation is never cut so that its meaning changes.
  Words that limit a statement stay in, such as "if", "may", "generally", and "on this record".
- A quotation is no longer than its point needs, and at most 60 words.
  In every section the note's own words outnumber the quoted ones.
- A quotation is never altered to pass a check.
  If the prose checker rejects a word inside it, another passage is quoted or the point is paraphrased.
- Nothing is quoted from a leaked, unpublished, or tainted source.
- Text under a licence that forbids adaptation or reuse, or under a bare copyright notice,
  is quoted word for word or not at all; it is not translated, reworded closely, or condensed.
- A note's own translation is never placed in quotation marks.
- A paraphrase uses the note's own sentence structure and keeps the source's meaning.
  A sentence that follows a source clause by clause is a quotation that has lost its marks.

### Constants and tables

- A note may state any single value, such as an address, a size, a bit position, a timing, or an identifier,
  with its source at the point of use.
- A value for which no source or test can be named is not recorded.
- A value known only from firmware, a decompilation, or a closed or tainted source is not recorded.
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

- Hexadecimal values are written with a `0x` prefix, and every value, address, and register name goes in a code span.
  A quotation keeps its source's notation.
- Sizes that are powers of two use the binary prefixes, as in 32 KiB; a decimal prefix means a power of ten.
- A quantity has a space before its unit, as in 59.73 Hz.
- Bit 0 is the least significant bit.
- A cycle is always a cycle of a named clock.
- Dates are written as `YYYY-MM-DD` or with the month in words, as in 28 March 1980.
- Systems are named as the research roadmap names them;
  another market's name or the maker's model code follows in parentheses at first use.
- Spelling is British in the note's own words; a quotation keeps its source's spelling.

### Algorithms and pseudo-code

- Behaviour is described in sentences, in tables of inputs and outputs, in formulas, and in state or timing diagrams.
- Notes hold no code and no pseudo-code.
  A code block holds only a command and its output, a path, or configuration.
- A description says what a system does as seen from outside it: inputs, outputs, state, and timing.
  It does not give the order of steps, the names, or the structure of any implementation.
- The steps of the hardware itself may be listed, from the maker's documents, an open-tier reference, or a test,
  with the source named.
- A description written after reading an implementation says so,
  and stays short of the detail from which that implementation's instructions could be rebuilt.
- A diagram may show the states and timing of hardware.
  It does not chart the control flow of an implementation.
- A maker's own pseudo-code is not reproduced.
