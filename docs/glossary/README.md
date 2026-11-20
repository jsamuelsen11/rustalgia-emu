# Glossary

## Purpose

The glossary fixes what Rustalgia's documents mean by their terms of art.
The sources that the project reads use many of those terms in conflicting senses,
so each entry also says how usage differs elsewhere.
[R0-04](../research/topics/R0-04-glossary-and-conventions.md) holds the evidence.

## Layout

| File | Holds |
|---|---|
| [terms.md](terms.md) | Every term, in alphabetical order |

Each term is a third-level heading under "Terms", so a document can link to it, as in `terms.md#save-state`.
An entry is the definition, then a list of labelled lines:

| Line | Holds | Required |
|---|---|---|
| **Also:** | Other forms that documents may use | no |
| **Avoid:** | Forms that documents do not use, each in a code span | no |
| **Elsewhere:** | How sources use the term differently, with where that is recorded | no |
| **See also:** | Links to related entries | no |
| **Basis:** | Where the definition comes from: an ADR, a roadmap, a note, or a named source's usage | yes |

## Conventions

- A definition is written in the project's own words, in one or two sentences, and does not repeat the term.
  It is not copied from a source; a definition that an ADR or a guide already gives is repeated as
  that document gives it.
- A term is defined once.
  A term with two senses in this repository gets one entry that states both, or two entries with qualified names.
- An entry defines how this repository uses a term; it does not rule on anyone else's usage.
- Legal terms are left to the statutes: `R0-02` records them, and the glossary does not restate them.
- Terms are added and changed by pull request, in the same change as the document that first needs them.
  The glossary is edited in place and is not replaced by a new document; the owner approves each change by merging,
  and `date` is the day of the last change.
- Renaming a term changes its link address.
  The same change updates every link to it; the link check finds them.
- A form listed under **Avoid** may be added to `.config/vale/styles/Rustalgia/Terms.yml` only
  when no document needs to quote it outside a code span.
- Entries start from [`_template.md`](_template.md).
- The status values are defined in [the documentation guide](../README.md#status).
