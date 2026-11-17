<!-- Title: Conventional Commits, lower-case subject, at most 72 characters. It becomes the commit on main. -->

## Summary

<!-- What this changes and why, in two or three sentences. -->

## Linked work

<!-- Use "Closes #123" so the issue closes on merge. Delete the lines that do not apply. -->

- Closes #
- Requirements:
- ADRs:

## Type of change

- [ ] Documentation: research, requirements, ADRs, or roadmap
- [ ] Feature
- [ ] Fix
- [ ] Refactor or performance, with no change in behaviour
- [ ] Tests
- [ ] Tooling, CI, or repository config

## What changed

<!-- The main changes, grouped. Point the reviewer at the files that matter most. -->

## Verification

<!-- How you know it works: commands run, results seen, and anything you could not verify. -->

- [ ] `mise run check` passes locally
- [ ] New behaviour has a test or a recorded proof, described above
- [ ] Platforms exercised (Linux, Windows, Android, iOS), or not applicable:

## Risk

<!-- What could break, who it affects, and how to roll back. Write "None" if that is true. -->

## Checklist

- [ ] The change is one logical unit, and the title describes it
- [ ] New documents sit in the right folder and follow their structure contract
- [ ] A decision that is hard to reverse has an ADR
- [ ] The README, glossary, and related documents reflect the change
- [ ] No ROMs, BIOS files, firmware, keys, or other copyrighted or secret material
- [ ] Changes under `.github/` or `.config/` are called out in the summary, with the reason
