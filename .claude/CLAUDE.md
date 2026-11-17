# Rustalgia: instructions for Claude

Rustalgia is in its planning phase.
The repository holds documentation and the tooling that checks it.
Read `README.md` and `docs/README.md` before writing anything.

## Where documents go

- Designs from the brainstorming skill go in `docs/designs/YYYY-MM-DD-<topic>-design.md`.
  Do not use the skill's default, `docs/superpowers/specs/`.
- Plans from the writing-plans skill go in `docs/plans/YYYY-MM-DD-<topic>.md`.
  Do not use the skill's default, `docs/superpowers/plans/`.
- Every other document under `docs/` must match a structure contract.
  `docs/README.md` lists the types.
- Start every new document from the `_template.md` in its folder, and follow its guidance for each section.
- A new type of document needs a contract in `.config/mdschema/` and an entry in `.config/mise/tasks/lint/contracts`,
  in the same change.

## Rules

- Run `mise run check` before saying work is done.
  Run `mise run fmt` to fix formatting.
- Never skip the git hooks with `--no-verify`, and never weaken a check to make a document pass.
  Fix the document.
- Changes reach `main` through pull requests.
  Titles follow Conventional Commits and become the commit on `main`.
- Call out any change under `.github/` or `.config/` in the pull request summary, with the reason.
- Tool configuration goes in `.config/` unless the tool cannot read it from there.
- Write short documents with a clear structure.
  Lead with what matters, and leave out filler.
- Use the status values defined in `docs/README.md`.
  A document starts as `draft`; only the owner approves it.

## Research

- The research roadmap is `docs/roadmap/research.md`.
  Each item produces one note, named for the item.
- Research maps options.
  It does not choose between systems, platforms, or techniques.
- State how each claim was checked, and mark a claim that comes from memory.
- Never read leaked source code or documents.
  Never obtain, use, or store copyrighted games, firmware, or keys.
