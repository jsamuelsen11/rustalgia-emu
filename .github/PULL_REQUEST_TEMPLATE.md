<!--
Written by an agent, read by the owner. Keep it short; the owner's time is the scarce thing.
Title: Conventional Commits, lower-case subject, at most 72 characters. It becomes the commit on main.
A pull request opened through the API does not get this template: read this file and follow it.
Write "None" in a section that does not apply. Do not delete a section.
-->

## Purpose

<!-- One sentence: what this changes and why. If it takes two, the pull request is too big. -->

## Request

<!-- The owner's instruction, quoted or linked: "Closes #123", a roadmap item, or the words of the request. -->

## Decisions for you

<!-- What only the owner can settle before merging, each as a question with a recommended answer.
     Include every choice the author made that was the owner's to make. -->

## Read in this order

<!-- A map for the reviewer. Name the files that need careful reading, and why.
     Then name the files that are mechanical: renames, generated output, formatting. -->

Changes to checks or controls (`.github/`, `.config/`, `.claude/`):

<!-- Each one with its reason, or "None". A change that makes a check pass by weakening it is never acceptable. -->

## Evidence

<!-- The commands that were run and what they printed, not a statement that things pass.
     Trim output to the lines that show the result. -->

```text
$ mise run check
```

## Not verified

<!-- What was not checked, could not be checked, or was assumed. Sources that refused access. Claims from memory. -->

## Risk and rollback

<!-- What could break, who it affects, and how to undo it. -->

## Out of scope

<!-- What was noticed and left alone, with the issue opened for each. -->

## Provenance

- Tool and model:
- Sources opened: all in the open tier or registered in `.claude/hooks/source-register.txt` (yes or no):
- New entries in the source register:

## Checklist

- [ ] One logical change, and the purpose above fits in one sentence
- [ ] `mise run check` passes locally, with the output above
- [ ] New documents sit in the right folder and follow their structure contract
- [ ] A decision that is hard to reverse has an ADR
- [ ] No ROMs, BIOS files, firmware, keys, or other copyrighted or secret material
- [ ] Nothing was copied or ported from another project's code
