# Security policy

## Reporting a vulnerability

Report vulnerabilities privately through
[GitHub private vulnerability reporting](https://github.com/jsamuelsen11/rustalgia-emu/security/advisories/new).
Do not open a public issue.

Include:

- what the vulnerability is and what an attacker gains
- steps or a proof of concept that reproduce it
- the commit or version affected

Expect an acknowledgement within seven days.
A fix and an advisory follow once the report is confirmed.

## Scope

In scope:

- memory safety, sandbox escape, or code execution triggered by a crafted ROM, save file, or save state
- the build, release, and CI pipeline in this repository

Out of scope:

- problems that need a modified build of Rustalgia
- inaccurate emulation with no security impact; report those as bugs

## Supported versions

Rustalgia is in its planning phase and has no releases.
Once releases exist, the latest release receives security fixes.
