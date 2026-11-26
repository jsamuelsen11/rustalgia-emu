---
title: "Nintendo Switch and Switch 2: family survey"
roadmap_item: R1-14
status: draft
date: 2026-11-25
---

# Nintendo Switch and Switch 2: family survey

## Summary

This note asks which emulators matter for the Nintendo Switch and Switch 2, what each one's status, licence, tier,
techniques, and hosts are, and how exposed and how hard the family is, building on the [primer][r1-04],
the [catalogue][r1-08], and the [legal baseline][r0-02].

Two projects shaped the family, yuzu in C++ and Ryujinx in C#, and both ended in 2024 under pressure from Nintendo
([Wikipedia, "Yuzu (emulator)"][wp-yuzu]; [Wikipedia, "Ryujinx"][wp-ryujinx]; secondary).
What runs games today is their continuations, chiefly Eden for yuzu and Ryubing for Ryujinx, now hosted off GitHub,
beside young independent projects and, since 29 October 2026, a wave of Switch 2 forks of Eden.

Several of them are now open tier, under GPL-3.0, so [`R0-05`][r0-05-ntdo]'s gap statement is out of date,
but their high-level emulation of Nintendo's operating system is closed under [ADR 0006][adr6-closed].

Every anti-circumvention complaint, judgment,
and notice against a console emulator that R0-02 found concerns the Switch,
and the 2026 notices reach whatever links to an emulator; no notice yet names a Switch 2 emulator.

The note recommends keeping both systems out of the first systems Rustalgia takes up, adding no emulator study now,
and recording oboromi as a Rust precedent and ruzu as a provenance risk; the owner decides.
This note is not legal advice.

## Scope

- Question: which emulators of the Switch and Switch 2 are popular or respected, what are their status, licence, tier,
  techniques, and hosts, and what are the family's legal exposure and difficulty?
- Covered: the Switch (HAC-001 and its revision), Switch Lite, Switch OLED Model, and Switch 2,
  as the [catalogue][r1-08-ntdo] lists them; emulators, forks, Switch 2 claims, stores, and enforcement.
  Hardware is left to the [primer][r1-04], law in general to [R0-02][r0-02],
  and any emulator study to the [roadmap][roadmap-studies].
  Researched on 2026-11-25, against Switch 2 system version 23.5.0 of 10 November 2026
  ([SwitchBrew, "Switch 2: System Versions"][sb-versions]).
- Inclusion: popularity is judged by stars, store installs, store presence, and naming in notices;
  respect by accuracy claims, use as a reference by other projects, and history.
  Projects that only the [Emulation General Wiki][egw-switch] names are listed once, as leads.
  No Nintendo-made emulator of the Switch is described in public prose beyond the Switch 2's compatibility layer.
- How claims were checked: three research agents gathered the evidence,
  reading every page through curl or the GitHub API as raw text, Wikipedia through raw wikitext,
  and court filings through `pdftotext`.
  One verification pass of fresh verifiers who saw only this note then tested each claim
  and quotation against its source, and a fix pass applied their corrections
  after checking each against the source again.
  Markers: "(secondary)" for Wikipedia and press, "(lead)" for the Emulation General Wiki, forums, and search results,
  "(observed)" for what an agent saw and did not quote, and "(research log)" for events while gathering.
- What was opened: emulator prose (READMEs, licence files, sites, handbooks, release notes, blogs)
  and repository metadata only.
  No emulator source file, issue, or pull request, and no key, fuse, firmware, dumping, or game page was opened.
  Repository metadata through the GitHub API was used for status;
  the guard blocked the releases endpoint for unregistered repositories, so their status is the last push
  (research log).

## Findings

### The emulators at a glance

Hosts: W Windows, M macOS, L Linux, A Android, i iOS, B BSDs.
Status and licence rest on the repository's metadata or prose read on 2026-11-25 unless marked;
"drafted" means the register line is added in this change.

| Emulator | Lineage | Status on 2026-11-25 | Licence and evidence | Tier | Hosts |
|---|---|---|---|---|---|
| yuzu | first, 2018 | ended 2024-03-04; repository gone | GPL-3.0+ or GPL-2.0+, see below | closed (drafted) | W L A |
| Ryujinx | first, 2018 | ended 2024-10-01 at 1.1.1403 | MIT, by Wikipedia (secondary) | closed (drafted) | W M L |
| Skyline | first for Android | ended 2023-05 (lead); source removed | none now; was MPL-2.0 | closed | A |
| Strato | Skyline | dormant; last push 2024-09-02 | GPL-3.0-or-later, README and file | open (drafted) | A |
| Eden | yuzu | v0.2.1 of 2026-06-01; active | GPL-3.0-or-later, README and file | open (drafted) | W M L A B |
| Citron Neo | yuzu, Citron | release of 2026-04-27; active | GPL-3.0-or-later, README | open (drafted) | W M L A |
| Lemon | Eden | last push 2026-11-23 | GPL-3.0-or-later, README | open (drafted) | A |
| Sudachi | yuzu | ended 2025-08 (secondary) | GPLv3 by the wiki (lead) | walled (unregistered) | W M L A |
| Ryubing | Ryujinx | stable 1.3.3 of 2025-10-11 | MIT, by its site | walled | W M L |
| Kenji-NX | Ryujinx | 2.1.0 pre-release, 2026-02 (secondary) | MIT, by the wiki (lead) | walled (drafted) | A W M L |
| MeloNX | Ryujinx | Codeberg copy to 2026-07-19 | statements conflict | walled (drafted) | i |
| Astris | Ryujinx | binaries; last push 2026-10-09 | MIT by metadata; no source | walled (drafted) | M |
| Hydra | new | last push 2026-10-13 | GPL-3.0, licence file | open (drafted) | M |
| Pound | new | last push 2026-11-23 | GPL-3.0, licence file | open (drafted) | W L |
| oboromi | new, Rust | last push 2026-11-25 | GPL-3.0, licence file | open (drafted) | not stated |
| ruzu | yuzu and Eden, Rust | last push 2026-11-22 | GPL-3.0-or-later, README | open (drafted) | W M L |
| Eglantine | Eden | last push 2026-11-25 | GPL-3.0-or-later, README | open (drafted) | W M L |
| Lichii | Eglantine | last push 2026-11-25 | GPL-3.0, licence file | open (drafted) | W M L |
| Eden-NX2 | Eden | pre-release of 2026-10-29 | GPL-3.0, licence file | open (drafted) | W |

Sources for the rows are given in the paragraphs below.
Every emulator here that runs games asks the user for keys and, for some games, firmware,
and none ships replacement firmware files (inference from the READMEs and documentation read).

### The two originals and Skyline

- yuzu is included for its reach, shown by its store downloads below, and as the base of most later emulators.
  Citra's developers announced it on 14 January 2018, and its last builds were Mainline 1734 and Early Access 4176
  ([Wikipedia, "Yuzu (emulator)"][wp-yuzu], secondary).
  It added a Vulkan renderer in 2019, multi-core CPU emulation in 2020, a rewritten shader decompiler in 2021,
  resolution scaling, and an Android release on 30 May 2023 (same, secondary).
  Its free Google Play build had more than one million downloads
  ([Google Play capture of 2 March 2024][play-yuzu])
  and its paid build more than 10,000 ([capture of the same day][play-yuzu-ea]).
- yuzu's licence is recorded two ways.
  The infobox gives GPL-3.0-or-later (same, secondary)
  and the Play listing says "The yuzu app is licensed by the GNU GPL v3",
  while Eden's README keeps yuzu's 2018 copyright line under `GPL-2.0-or-later` ([Eden README][eden]).
  Both are compatible with GPL-3.0; the repositories return HTTP 404, so the register line is closed,
  following Skyline's (research log; process call under "Tiers against the register").
- Ryujinx is included as the respected original:
  by Wikipedia's account it was the first emulator to boot commercial games, and it aimed at "correctness,
  rather than adding game-specific hacks" ([Wikipedia, "Ryujinx"][wp-ryujinx], secondary).
  It added Vulkan in 2022, ran Arm code natively on Apple silicon through the host's hypervisor from November 2022,
  and had 800 Patreon members when it ended (same, secondary).
- Skyline was the first Android emulator of note and is closed in the register.
  Its README says its source "has been removed from all owner-controlled branches
  and tags at the request of authorized agents of Nintendo Co., Ltd.",
  and that its shader compiler was a fork of yuzu's under a licence exemption.
  It used Ryujinx's high-level emulation (HLE) as a reference,
  with [SwitchBrew][switchbrew] and `libnx` for its kernel and services
  (README read through the GitHub API; the repository is not linked because it is closed).

### yuzu's successors

- Eden is included as the most active successor, named in the 2026 notices, and the base of the Switch 2 forks.
  Its README calls it "a free and open-source (FOSS) Switch 1 emulator", with builds for "Windows, Linux, macOS,
  Android, FreeBSD and more" ([Eden README][eden]).
  Its handbook asks for a GPU with OpenGL 4.6 or Vulkan 1.1 and a CPU with FMA,
  and points to an external compatibility database rather than keeping a list ([Eden handbook, "Basics"][eden-basics]).
  It makes amd64 the main desktop target, and says "NCE
  (Native Code Execution)
  is currently only available on Android and (experimentally) Linux" ([Architectures][eden-arch]).
  Graphics options include FSR and SGSR upscaling and anisotropic filtering ([Graphics][eden-graphics]).
- Its Forgejo host lists 14 releases, from v0.0.3-rc1, published there on 12 November 2025,
  to [v0.2.1][eden-rel] of 1 June 2026 (Forgejo API).
  Eden's popularity shows in stores rather than stars: 89 stars on its own Forgejo host and 530 on its GitHub mirror
  (Forgejo and GitHub metadata),
  and 29,844 installs on Flathub since about September 2026 ([Flathub, Eden][flathub-eden]).
  Its site's footer reads "Utopia LLC/Eden", the developer name on its short-lived Play listing below
  ([Eden site][eden-site]).
- Citron Neo continues Citron, whose original hosts no longer answer
  (research log);
  its README says it "continues the Citron codebase" for Windows, Linux, macOS, and Android,
  built on its own CI machines ([Citron Neo README][citron-neo]), with four releases from 20 March to 27 April 2026
  (Forgejo API).
  Its release notes mention launching the Switch's own home menu from user firmware and fixes for firmware 21 and 22
  ([Citron Neo site][citron-neo-site], observed).
  The [AUR's `citron` package][aur-citron] gives GPL-2.0-or-later for the original and is flagged out of date
  since 27 February 2026; [`citron-neo`][aur-citron-neo] gives GPL-3.0-or-later.
- Lemon, an Eden fork for Android, lists save states, a memory editor,
  and a warning when the user's keys are older than the firmware ([Lemon README][lemon]).
- Sudachi ended in August 2025 with a final version of 2 July 2025, and its developer pointed users to Eden
  ([Android Authority, Sudachi][aa-sudachi], secondary).
  suyu was forked on 5 March 2024, left GitLab after a notice, and stopped on 13 February 2025;
  torzu develops on a Tor hidden service, whose address is not given here (Wikipedia, "Yuzu (emulator)", secondary).
  Uzuy's domain is parked (research log), and Nuzu, Ziunx, Nyushu, Sumi, Pine,
  and the iOS port Pomelo are known only from notices or the [Emulation General Wiki][egw-switch] (lead).

### Ryujinx's successors

- Ryubing is included as Ryujinx's continuation with the widest reach: its community Flathub package,
  which it does not support, has 254,906 installs, of which 8,898 came in the last 30 days
  ([Flathub, Ryubing][flathub-ryubing]).
  Its documentation says "This is not a Ryujinx revival project", and describes the CPU emulator, ARMeilleure,
  as translating Arm code to "a custom IR" and then to x86 code, with a translation cache kept on disk
  ([Ryubing documentation][ryubing-docs]).
  It emulates the Maxwell GPU through OpenGL 4.5, Vulkan, or Metal through MoltenVK, with resolution scaling
  and FSR (same).
  Its [site][ryubing-site] says it was "tested on approximately 4,300 titles", read as a bare front page,
  because the guard blocks every other path of that walled host (research log).
- Ryubing's documentation links key, firmware, and game dumping guides from its navigation; none was opened,
  and their paths are drafted as closed (research log).
  Flathub dates the stable 1.3.3 to 11 October 2025
  ([Flathub, Ryubing][flathub-ryubing]);
  the guard blocks the project's own release pages, so no newer build was confirmed (research log).
- Kenji-NX is included for Android reach:
  it grew from the original Ryujinx developers' Android branch and was tuned for Snapdragon 8 Elite
  ([Android Authority, Kenji-NX][aa-kenji]; [Notebookcheck, Kenji-NX][nbc-kenji]; secondary).
  GitHub blocked its releases repository, `Kenji-NX/Android-Releases`, on 17 February 2026 (GitHub API error body).
- MeloNX is the only iOS Switch emulator found.
  A copy on Codeberg says "MeloNX REQUIRES JIT and CANNOT run without it", needs [StikDebug][stikdebug] on iOS 26,
  and recommends an iPhone 15 Pro or newer ([MeloNX copy on Codeberg][melonx-codeberg]).
  Its licence is unresolved: that copy's README says GPLv3, while its licence file was MIT text when first read
  (research log; the guard blocked a second reading),
  and another copy's licence file says AGPL-3.0-or-later after "the MeloNX License",
  whose permission excludes people who tried to merge it with Pomelo ([AzureDominus copy][melonx-azure]).
  The README links a console-hacking guide and dumping guides; none was followed.
  Its [site][melonx-site] says "For use with legally owned game backups only",
  and points to a source host that refused automated requests (research log).
- Astris is a binaries-only Ryujinx derivative for Apple silicon Macs on macOS 15 or later,
  with 1,563 stars and no stated source location ([Astris README][astris]).

### Independent projects and history

- Strato continues Skyline for Arm64 Android and, like it, keeps a fork of yuzu's shader compiler
  ([Strato README][strato]).
  The [Emulation General Wiki][egw-switch] describes Skyline and Strato as running guest code natively,
  as a compatibility layer does (lead).
  Its 2,351 stars make it the most starred emulator here that is not a yuzu fork (GitHub metadata).
- Hydra is "an experimental Nintendo Switch emulator for macOS", at an early stage of development by its own account,
  with per-game patches and SDL3 or SwiftUI frontends;
  it says some games need firmware files that "need to be decrypted", and links its author's own tools for that,
  which were not followed ([Hydra README][hydra]).
- Pound aims at both consoles; its README says development "HAS FULLY SHIFTED" to a new Arm recompiler, Ballistic,
  and lists translating SM86 shaders to SPIR-V as work to do ([Pound README][pound]).
  The [Emulation General Wiki][egw-switch] says GPLv2, but the licence file is GPL-3.0 text, and the file is followed.
- oboromi is the closest precedent to Rustalgia:
  a Rust "work-in-progress nintendo switch 2 emulator foundation" with a Qt 6 debugging frontend,
  a new ARMv9 CPU emulator for the T239's extensions, credited to another developer and kept as a separate project,
  and a shader decoder that "targets NVIDIA SM86" ([oboromi README][oboromi]).
  It says it "cannot currently run commercial games or firmware".
- ruzu is a Rust port of yuzu and Eden made with language models, by its metadata;
  its README says it is "developed with the assistance of AI coding agents", and names a recompiler in its tree,
  rdynarmic, for 32-bit and 64-bit Arm guests on x86-64 and Arm64 hosts, with Vulkan, OpenGL, and experimental Metal
  ([ruzu README][ruzu]).
- History: CageTheUnicorn (2017, Python, ISC) was a debugging environment for Switch code, followed by Mephisto in C++
  ([CageTheUnicorn][ctu]; [Mephisto][mephisto]; metadata).
  Smaller early projects include nsemu ([nsemu][nsemu], GPL-3.0), PsychopompNX for Apple silicon
  ([PsychopompNX][psychopomp], Apache-2.0),
  `XorTroll/pegasus` (no licence, so closed and not linked), and a Linux fork, [horizon-linux][horizon-linux],
  that runs Switch programs under a shim adapted from yuzu ([Emulation General Wiki][egw-switch], lead).
- Closed-source Android apps sold as Switch emulators, such as Egg NS,
  are said by the [Emulation General Wiki][egw-switch] to reuse yuzu and Skyline code (lead); they get no register line.
- The same wiki also lists projects no other source read here names, so they are left as leads and not evaluated:
  Eden ports to the Xbox Series (Eden UWP) and the PS5
  (Nightshade, ProsperoEden), and two wrappers, nxnative for macOS and iOS and ScarletNX (lead).

### Switch 2

- A software exploit on system 23.0.1, run through SmileBASIC 4, gave file-system access,
  and must be reapplied after each restart ([Android Authority, Switch 2 jailbreak][aa-jailbreak], secondary).
  Polish press says the update of 10 November 2026 patched it
  ([android.com.pl][androidpl], lead);
  SwitchBrew's page for 23.5.0 leaves its security fixes blank ([SwitchBrew, "Switch 2: 23.5.0"][sb-2350]).
- Eden-NX2, released on Eden's Forgejo on 29 October 2026, is the first public Switch 2 build found.
  Its release notes call it "experimental switch 2 integration for eden" that "needs a lot of fixes",
  ask for "a Vulkan GPU with 8 GB+ VRAM and 16 GB+ RAM", and tell users to open the game's extracted code folder
  ([Eden-NX2 release][eden-nx2]).
  Press reports Mario Kart World booting with stutter
  ([TweakTown][tweaktown], secondary; read during research, and the host refused automated requests on re-check).
- Eglantine, derived from Eden, says it is "capable of running Mario Kart World at full speed on most specs",
  and has 6,243 stars after 27 days ([Eglantine README][eglantine]; GitHub metadata).
  Its fork Lichii has 10,284 stars, the most in the family
  (GitHub metadata),
  says it "has no official website", and warns that any other site using its name, such as `lichii.org`,
  "may contain malware" ([Lichii README][lichii]).
  `lichii.org` is not linked for that reason.
- The [Emulation General Wiki's Switch 2 page][egw-switch2] says most of these forks are AI-assisted,
  and lists ports to the PS5 and further forks (lead).
- Some claims are lures or jokes.
  `nat-carbonara/NYx-2-Emulator` claimed in April 2025, before the console shipped, to be "The first ever, open-source,
  Switch 2 Emulator written in Python"; it is treated as a possible lure and not linked (inference).
  `Estem01/EchoNX` is a parody whose demonstration link points to a well-known prank video (observed);
  it is not linked because it is not an emulator.
  Fake Switch emulators also spread malware in 2017, when the FTC warned that none existed
  ([Wikipedia, "Nintendo Switch emulation"][wp-nse], secondary).
- The maker's own layer is a hybrid.
  Nintendo's engineers say "Switch 2 doesn't contain any Switch hardware",
  and that full software emulation would have cost battery life,
  "so we did something that's somewhere in between a software emulator and hardware compatibility";
  they checked "More than 10,000 games" one by one ([Nintendo, "Ask the Developer" vol. 16 part 4][ntdo-atd]).
  The primer describes that layer from SwitchBrew ([primer, "Switch and Switch 2"][r1-04-os]).

### Tiers against the register

- The existing lines for Skyline, Ryubing's two hosts and owner, Ryubing's site, and Mephisto were checked again,
  as [ADR 0006][adr6-eval] asks, and none has changed licence or tier.
  One observation for Skyline's line: its repository answers normally again, last pushed on 18 August 2026,
  the day after a notice named it, and holds only its README (GitHub metadata; observed).
- Licence statements were read in this order of weight: the licence file, then the README, then metadata,
  then press or the wiki; a conflict is recorded and the file followed (Pound),
  or the source walled where files conflict (MeloNX).
- High-level emulation of Horizon inside an emulator is reimplemented system software,
  so closed by [ADR 0006][adr6-closed],
  while the rest of the repository keeps its tier. yuzu's own words make the point:
  its multi-core rewrite "aims to ensure that emulation behaves the same as on the Switch
  while matching the code with the Switch's original OS code" ([yuzu, "Prometheus"][yuzu-prometheus]).
  In a Switch emulator that part is most of the code (inference).
- A repository that is gone has no licence now, so yuzu's and Ryujinx's are closed like Skyline's;
  a binaries-only release is walled because its source cannot be established (Astris);
  a project whose claims are implausible is walled and not linked.
- The sites of emulators are open for prose, by the settled precedent
  (Eden, Citron Neo, MeloNX, yuzu's old site, Ryujinx's old blog).
  Ryubing's documentation and blog depart from it: they are walled, which still allows their prose,
  to match the existing walled line for its main site, whose licence has not changed;
  the guard then blocks all but their front pages (process call).
  Dumping guides and the sites of circumvention devices are closed as a precaution.
- dynarmic, the Arm recompiler of yuzu and its forks, is under 0BSD
  ([azahar-emu dynarmic README][dynarmic]),
  which the GNU list places among GPL-compatible licences:
  it "can operate as a free software license compatible with the GNU GPL"
  ([GNU licence list, "Zero-clause BSD license"][gnu-0bsd]); so it is open.
- The [Emulation General Wiki][egw-switch] pages cited were searched for "leak" in their raw text, with no hit;
  in the Wikipedia revisions cited the word appears only in citation titles about a game and a hardware leak.
  Repositories named in a takedown notice are named in code spans and not linked.

### Stores and distribution

- No Switch emulator by a known project is on the App Store, Google Play, Steam, or F-Droid today
  (searches of each store's catalogue or search page for "switch emulator", "yuzu", "ryujinx", and similar terms;
  research log).
- yuzu's Play listings returned 404 from 4 March 2024 (Wayback Machine capture index; research log).
  Eden reached Google Play under the developer name "Utopia LLC" in September 2025, with more than 50,000 downloads
  ([Google Play capture of 15 September 2025][play-eden]),
  and was gone by 21 October 2025; no reason was found (capture index and press searches; research log).
- Copycats use the family's names: a Play app titled "Ryujinx Emulator" by an unrelated developer,
  and an App Store app that lists "Switch" among the systems it emulates (store pages; observed, not run).
  Apple's rule 5.2.1 forbids "copycat representations" ([App Review Guidelines][apple-guidelines]).
- Apple allows emulators under rule 4.7 and never mentions JIT
  (search of the guideline text),
  and its JIT entitlement lists macOS only (Apple's entitlement documentation; observed).
  So an iOS Switch emulator is sideloaded and needs a tool such as [StikDebug][stikdebug],
  which says it is "no longer available on the App Store" (inference from both).
- Android's developer verification will expand to all apps on certified devices in 2027
  ([Android developer verification][android-verify]);
  the Android builds of Eden, Citron Neo, Kenji-NX, and Lemon are installed outside any store today (inference).
- Eden says it keeps its source off GitHub "(primarily because of DMCA risk)",
  and moved builds to its Forgejo host and file stores after two notices ([Eden, "Distribution Challenges"][eden-blog]).
  Eden documents installing its Android builds through Obtainium ([Eden, third-party tools][eden-third]).

### Legal exposure

This section adds to [R0-02][r0-02] what it does not hold; it is not legal advice.

- **Run-time decryption is the theory.**
  The notices keep the yuzu theory ([R0-02, "Game sites, and the yuzu case"][r0-02-yuzu]):
  "these emulators necessarily use unauthorized copies of these cryptographic keys to decrypt unauthorized copies of
  Nintendo Switch games" ([notice of 12 February 2026][n-260212]).
  A key-file notice cites case law that distributing keys violates § 1201,
  and repeats that key files infringe the firmware
  ([notice of 16 October 2025][n-251016]);
  a Ryujinx-copy notice adds "unauthorized copies of the Nintendo Switch firmware" ([notice of 6 March 2025][n-250306]).
  R0-02's ["Keys"][r0-02-keys] and ["Firmware and back-up copies"][r0-02-fw] sections hold the law.
- **Notices reach builds, packaging, and sites.**
  The 2026 notices name release repositories, sites, AppImage and Flathub packaging, and compatibility lists
  ([R0-02, "What the notices allege"][r0-02-notices]).
  GitHub blocked Eden's releases repository on 5 March 2026, three weeks after the notice,
  Eden's site repository on 14 July 2026, and Ryubing's Flathub manifest on 30 June 2026
  ([notice of 10 July 2026 (2)][n-260710]; [notice of 30 June 2026][n-260630]; GitHub API error bodies).
  The two notices of 26 February 2025 were processed against networks of 4,238 and 113 repositories, 4,351 in all
  ([first][n-250226]; [second][n-250226-2]; calculated from GitHub's notes).
- **Notices are templated, and GitHub has not always accepted the theory.**
  Many notices since 28 April 2026 keep the form's placeholder,
  "[list one or more relevant projects hosted in reported repositories e.g. Citron, Eden, Kenji-NX, MeloNX, Pine,
  Pomelo, Ryubing, Ryujinx, Skyline, Sudachi, Sumi, Suyu, and Yuzu]" ([notice of 28 April 2026][n-260428]).
  Four notices carry GitHub's note that it "did not find sufficient information to determine a valid anti-circumvention
  claim" and acted on other copyright claims ([31 May 2024][n-240531]; [16 September 2024][n-240916];
  [30 June 2026][n-260630]; [30 September 2026][n-260930]).
- **Nothing new since R0-02, and no Switch 2.**
  No Nintendo notice is dated after 12 November 2026, none mentions the Switch 2, and none names a static recompilation
  (search of the archive's file names and text to 2026-11-25, pinned at commit `cd00b14`).
  No counter-notice from a Switch project is in the archive,
  although press reports that Eden contested the February notice ([Wccftech][wccftech], secondary).
  Skyline's repository, which R0-02 records as disabled, now answers with its README only
  ([R0-02, "Who has been reached"][r0-02-reached]; observed).
- **Courts.**
  The Williams judgment's injunction bars software that circumvents "technological measures
  that control access to Nintendo's games or consoles",
  and other circumvention technology that violates the Switch's user agreements
  ([Williams judgment, ECF 30][williams]); R0-02 records the award.
  In the Netherlands, the District Court of The Hague ruled on 2 September 2026
  (ECLI:NL:RBDHA:2026:25479, case C/09/696247 HA ZA 25-1125).
  Its summary finds three wrongs: trading MIG Switch cards and dumpers circumvented technical measures,
  under article 29a of the Dutch Copyright Act;
  offering a list of hyperlinks to unlawful copies of Nintendo games infringed copyright, under article 12;
  and listing game titles and showing the marks infringed Nintendo's EU trade marks
  ([judgment, through the judiciary's open data][rb-mig]).
  The hyperlink holding bears on [R0-02's option 7][r0-02-opt7] (inference).
  Nintendo's message to players names "circumvention software" beside devices ([Nintendo Life][nl-mig], secondary).
  The three seller sites named are closed and not linked: `r4switch.nl`, `ther4card.com`, `r4switch.co.uk`.
- **Maker statements.**
  Nintendo's engineers describe software emulation neutrally, as a technique that costs processing power
  ([Nintendo, "Ask the Developer"][ntdo-atd]),
  and Nintendo's investor Q&A of 2025 and 2026 says nothing on piracy or emulation
  (search of five Q&A files in English and Japanese,
  such as the [AGM Q&A of June 2026][ir-2606] and the [briefing Q&A of November 2026][ir-2611]; research log).
  R0-02 holds the rest ([R0-02, "Makers' statements on emulators"][r0-02-makers]).
- **Money and conduct.** yuzu's paid Play build cost
  $4.99 ([Google Play capture][play-yuzu-ea]), pleaded as earning "at least an additional $50,000"
  ([yuzu complaint][yuzu-complaint], paragraph 38, an allegation).
  Lichii takes cryptocurrency donations that "help pay for the AI tools",
  and Eglantine takes donations through Open Collective ([Lichii README][lichii]; [Eglantine README][eglantine]).
- **Risks recorded.**
  Codebases written or ported with AI tools
  (ruzu, Lichii, and most Switch 2 forks by the wiki's account, lead)
  carry yuzu's code, which the consent injunction treats as a circumvention device (inference).
  A company stands behind Eden's site (observed).
  Scam sites use the projects' names.

### Which R0-02 options apply

- [Option 1][r0-02-opt1] does not fit: every retail Switch game container is encrypted
  ([primer, "Switch and Switch 2"][r1-04-os]).
- [Option 2][r0-02-opt2] is what every current emulator does, and it is the act every notice describes (inference).
- [Option 3][r0-02-opt3]'s first variant keeps the project's own code out of the stated theory,
  but the user's decryption then depends on tools already reached by notices, Lockpick and LibHac
  ([R0-02, "Takedown and enforcement history"][r0-02-takedown]),
  and the 2026 notices reach whatever links to an emulator (inference).
  Eden-NX2's extracted game folder is that variant's input in practice (inference from its release notes).
- [Option 4][r0-02-opt4] brings option 2 back: system titles are containers that SwitchBrew calls encrypted,
  so a user's firmware dump needs the same keys (inference; that system titles are such containers is from memory).
- [Option 5][r0-02-opt5] is high-level emulation of Horizon;
  it removes the firmware but not game decryption (inference).
- [Options 7, 8, and 9][r0-02-opt7] apply as observed above: guides linked by MeloNX and Ryubing's documentation,
  paid builds and donations, and every hosting route, from GitHub with mirrors to self-hosted Forgejo, Flathub,
  and sideloading.

### How hard the family is to emulate

- **CPU.**
  The Switch's games run on three of four Cortex-A57 cores, some in AArch32,
  and the Switch 2's on Cortex-A78C cores with pointer authentication
  ([primer, "Arm in the Switch and Switch 2"][r1-04-arm]).
  dynarmic, the recompiler yuzu changed for multi-core work
  ([yuzu, "Prometheus"][yuzu-prometheus]),
  says "this emulator does not match spec", that "Only user-mode is emulated",
  and that "No formal verification has been done" ([dynarmic README][dynarmic]).
  Its original repository now returns HTTP 404 (research log).
- **Execution on Arm hosts.**
  Native execution is the common optimisation: yuzu's Android build added NCE
  ([Google Play capture][play-yuzu]),
  Eden offers it on Android and Linux, Ryujinx used the Mac hypervisor, and Skyline ran guest code natively (lead).
  On x86-64 every project read translates (inference from their prose).
- **Memory.** yuzu mapped the guest address space through the host's memory management unit,
  with gains of "15-60%" by its own benchmarks,
  using a placeholder memory interface that Windows 10 added in version 1803 ([yuzu, "Fastmem"][yuzu-fastmem]).
- **Threads and timing.** yuzu moved to one host thread per guest core,
  and reports that a game soft-locked until it made its host timer less precise, "to better match actual hardware"
  ([yuzu, "Prometheus"][yuzu-prometheus]; a project's account).
  Nintendo says faster hardware can break games that "ran well due to the Switch system's hardware configuration"
  ([Nintendo, "Ask the Developer"][ntdo-atd]).
- **GPU.** yuzu lifts the Switch GPU's precompiled shaders to an intermediate form and emits GLSL, SPIR-V, or GLASM,
  and says caching everything needed to build pipelines removed "shader stutter almost completely on Vulkan"
  ([yuzu, "Hades"][yuzu-hades]); this extends the primer's ["Shader translation and compilation stutter"][r1-04-shader].
  The Switch 2's GPU adds RT and Tensor cores for DLSS,
  and NVIDIA puts the whole system at "1,000 engineer-years of effort"
  ([NVIDIA blog][nvidia]); an emulator must map ray tracing and DLSS work to the host (inference).
  Eden-NX2's missing meshes come from shaders not yet implemented ([Eden-NX2 release][eden-nx2]).
- **Audio.**
  Ryujinx claimed to be the first to implement the whole audio renderer,
  and reports that inaccurate mixing caused a soft-lock and broken video and animation in named games,
  so audio is coupled to game logic ([Ryujinx, "Amadeus"][ryujinx-amadeus]; a project's account;
  the coupling is inference).
- **Operating system.**
  The primer counts 446 service names and more than 130 kernel calls, with Switch 2 system versions about monthly
  ([primer, "Switch and Switch 2"][r1-04-os]).
  SwitchBrew states no origin for its facts, yuzu says it matched its kernel to Nintendo's code,
  and Ryujinx says it reverse-engineered the audio renderer without saying from what.
  Under [ADR 0006, "In every tier"][adr6-every],
  a fact whose source says it came from analysis of firmware is recorded only with a hardware test;
  that holds back yuzu's kernel account, not SwitchBrew's unattributed facts (inference from the rule).
  Testing on a Switch needs a console running homebrew, which needs an exploit (inference).
- **Translation caches.**
  Ryujinx's cache is built over three launches and takes "40-60MB of storage space per game"
  ([Ryujinx, "PPTC"][ryujinx-pptc]).

### Tests and their oracles

- No test suite with a stated hardware oracle was found for either console,
  and no emulator publishes pass or fail results against one
  (the primer's search, repeated with twelve GitHub repository-name searches; research log).
- yuzu's GPU work is the one statement found of hardware tests: "Rodrigo wrote homebrew tests for the hardware"
  ([yuzu, "Hades"][yuzu-hades]).
  A matching repository, [nxgfxtests][nxgfxtests], calls itself "Single executable libnx graphics tests",
  states no oracle, and was last pushed in 2019; that it is Hades's suite is from memory.
- [switch2-homebrew][sw2-homebrew] is a collection with an input tester, built in JavaScript for the CivSwitch runtime;
  its payload bridge was tested on Switch 21.2.0 and Switch 2 20.1.5 (README).
  Its oracle is a person watching the screen (inference). [switch-examples][switch-examples] are "Examples
  for Switch using devkitA64 and libnx", with no expected results (README; observed).
- The published "results" are compatibility lists, whose oracle is a person playing: Ryubing's counts above,
  the wiki's per-emulator counts for Eden and Ryubing (lead), and Nintendo's own check of more than 10,000 games.

## Options and trade-offs

Costs and gains are the author's inference unless a source is named.

### Which of the family's emulators the roadmap studies

- **What:** add no study for the family; add a study of Eden's parts outside its HLE;
  or treat oboromi and ruzu as Rust precedents within [`R1-67`][roadmap-studies] or [`R4-08`][roadmap].
- **Costs:** no study leaves the family's architecture known only from this note; an Eden study may read its GPU,
  shader recompiler, and [dynarmic][dynarmic], which are open, but not its HLE code, which is closed,
  and its handbook is thin; oboromi runs no games yet, and ruzu's port raises provenance questions.
- **Gains:** no study spends nothing on a system the project may not take up; Eden is open tier and active;
  oboromi shows a Rust Switch 2 design that uses a separate ARMv9 CPU emulator, credited to another developer.
- **Used by:** the roadmap has no study for this family today ([roadmap][roadmap-studies]).

### How keys, firmware, and games would be handled

- **What:** [R0-02's option 2][r0-02-opt2], as every current emulator does; or option 3's first variant with option 5,
  accepting only decrypted, extracted programs and emulating Horizon at high level.
- **Costs:** option 2 is the design every notice describes;
  option 3 depends on decryption tools already reached by notices, and option 5 needs HLE facts,
  of which those whose sources state firmware analysis need hardware tests before the notes may record them
  ([ADR 0006, "In every tier"][adr6-every]).
- **Gains:** option 2 runs games as users hold them; option 3 keeps decryption out of the project's code.
- **Used by:** Eden, Ryubing, and the others for option 2; [Eden-NX2's release notes][eden-nx2] load extracted folders.

### Where guest code runs

- **What:** a recompiler for AArch64 and AArch32 on every host; native execution on Arm64 hosts as an addition;
  or native execution only.
- **Costs:** a recompiler is the largest single part,
  and [dynarmic][dynarmic] shows how much behaviour gets elided for speed;
  native execution needs an Arm64 host with the right extensions and memory layout.
- **Gains:** a recompiler runs anywhere; native execution is the fast path on phones and Apple silicon.
- **Used by:** yuzu, Eden, and Ryujinx (recompiler, with native paths); Skyline and Strato
  (native, by the wiki, a lead).

### What serves as the test oracle

- **What:** homebrew tests run on a console with an exploit; compatibility testing by people; or both.
- **Costs:** a hardware oracle needs a modified console,
  which [R0-02, "Console checks, and use after circumvention"][r0-02-checks] makes a legal question;
  compatibility testing needs games, which the project may not obtain.
- **Gains:** hardware tests confirm the HLE facts whose sources state firmware analysis,
  as [ADR 0006][adr6-every] requires; compatibility lists measure what users see.
- **Used by:** yuzu's GPU work (homebrew tests); every project and Nintendo itself (compatibility).

### When to take up the Switch 2

- **What:** with the Switch, as one family sharing Horizon; or after it.
- **Costs:** together means an Ampere GPU, ray tracing, and DLSS at once;
  after means the Switch's front end must be kept open for the A78C and Ampere classes.
- **Gains:** together reuses the services layer; after puts the better-documented console first.
- **Used by:** Pound and ruzu aim at both; oboromi at the Switch 2 only;
  Eden-NX2 and Eglantine extend a Switch emulator.

### Recommendation

Keep the Switch and Switch 2 out of the first systems, and decide them in [`R6-01`][roadmap-synthesis],
as [R0-02's recommendation][r0-02-rec] already proposes for encrypted systems.
If the owner takes them up, prefer option 3's first variant with high-level emulation,
a recompiler with native execution on Arm64 hosts, and the Switch before the Switch 2.

Add no emulator study for the family now,
because the systems are not taken up and a study costs effort that the earlier systems need; if the owner takes them up,
a study of Eden's GPU, shader recompiler, and dynarmic, the readable parts outside its closed HLE, is the one to add.
Point [`R1-67`][roadmap-studies] and [`R4-08`][roadmap] at oboromi as a Rust precedent for a Switch 2 design,
with ruzu recorded only as a provenance risk.

Take no hardware oracle for now; the owner decides in [`R6-01`][roadmap-synthesis]
whether a modified console is acceptable, because the HLE facts whose sources state firmware analysis,
such as yuzu's kernel account, need one before the notes may record them.

## Implications for Rustalgia

- The register gains open-tier Switch emulators, and [`R0-05`][r0-05-ntdo]'s gap statement is out of date;
  the owner may correct it in place.
- Any future reading of a Switch emulator's code must avoid its HLE kernel and service parts, which are closed;
  a study brief must say so.
- The provenance rule on firmware analysis holds back the facts of Horizon whose sources state that origin,
  which bears on [`R2-12`][roadmap] (firmware and emulating an operating system).
- Accuracy for the family can be measured only by compatibility unless a hardware oracle is accepted;
  this feeds [`R2-15`][roadmap] and [`R4-10`][roadmap].
- The iOS route depends on sideloading and a JIT enabler, and the Android route on verification from 2027;
  both feed [`R3-03` and `R3-06`][roadmap].
- Each channel this family has used at scale, GitHub, GitLab, and Google Play, has seen a notice
  or a removal (inference), which bears on [R0-02's option 9][r0-02-opt9] and on [`R6-01`][roadmap-synthesis].

## Open questions

- What were the "other valid copyright claim(s)" on which GitHub acted in four notices?
  Only GitHub or the parties could say; a request to GitHub would answer it.
- Why did Eden leave Google Play, and why is Skyline's repository readable again?
  No source states either; only the projects, Google, or GitHub could say.
- Does any public emulator run a commercial Switch 2 game as press reports?
  Checking needs games, which the project may not obtain; a later press or project report could settle it.

## Sources

Every source below was read on 2026-11-25, as raw text through curl or the GitHub API unless stated.
Addresses in code spans are not linked because they are closed, named in a takedown notice, a possible lure,
or not an emulator; the text gives the reason at each.

Project documents:

- [R0-02][r0-02], [R0-05][r0-05-ntdo], [R1-04][r1-04], [R1-08][r1-08], [ADR 0006][adr6-closed],
  the [research roadmap][roadmap], and the [source register][register].

Emulator prose and metadata:

- [Eden README][eden], handbook pages [Basics][eden-basics], [Graphics][eden-graphics], [Architectures][eden-arch],
  and [third-party tools][eden-third], on Eden's Forgejo, its release list through the Forgejo API,
  the [v0.2.1 release][eden-rel], and the [site][eden-site] and ["Distribution Challenges"][eden-blog] (2026-04-24).
- [Eden-NX2 pre-release nx2-2026-10-29][eden-nx2], and its licence file.
- [Citron Neo README][citron-neo]; [Citron Neo site][citron-neo-site];
  AUR packages [`citron`][aur-citron] (2026.02.1-2) and [`citron-neo`][aur-citron-neo].
- [Ryubing documentation][ryubing-docs], home page; [Ryubing site][ryubing-site], front page.
- [MeloNX copy on Codeberg][melonx-codeberg], README and licence file; [AzureDominus copy][melonx-azure];
  [MeloNX site][melonx-site].
- READMEs, licence files, and metadata on GitHub, with README blob pins: [Strato][strato] (`28c704d`), [Hydra][hydra]
  (`eba0f2c`), [Pound][pound] (`25213c4`), [oboromi][oboromi] (`5e220a2`), [ruzu][ruzu] (`4ce298f`), [Lemon][lemon]
  (`7a06e62`), [Eglantine][eglantine] (`6b954c7`), [Lichii][lichii] (`1c4e198`), [Astris][astris] (`d5ec7d6`),
  [dynarmic (Azahar's copy)][dynarmic] (`1bb437d`), [StikDebug][stikdebug] (`c85d5be`); metadata and licence files only:
  [CageTheUnicorn][ctu], [Mephisto][mephisto], [nsemu][nsemu], [PsychopompNX][psychopomp],
  [horizon-linux][horizon-linux]; `skyline-emu/skyline` README, closed.
- yuzu blog, in Wayback Machine captures: ["Prometheus"][yuzu-prometheus] (20200510173041), ["Fastmem"][yuzu-fastmem]
  (20210607225815), ["Hades"][yuzu-hades] (20210709223608).
- Ryujinx blog, in captures: ["PPTC"][ryujinx-pptc] (20200617002039), ["Amadeus"][ryujinx-amadeus] (20200818020158).

Tests:

- READMEs: [nxgfxtests][nxgfxtests] (`cef48df`); [switch2-homebrew][sw2-homebrew] (`1c8c37d`);
  [switch-examples][switch-examples] (`6891626`).

Takedowns and courts (GitHub DMCA archive at commit `cd00b14`):

- Notices of [31 May 2024][n-240531], [16 September 2024][n-240916], [26 February 2025][n-250226],
  [26 February 2025 (2)][n-250226-2], [6 March 2025 (3)][n-250306], [16 October 2025][n-251016],
  [12 February 2026][n-260212], [28 April 2026][n-260428], [30 June 2026][n-260630], [10 July 2026 (2)][n-260710],
  and [30 September 2026][n-260930].
- [Nintendo v Williams, judgment, ECF 30][williams]; [Nintendo v Tropic Haze, complaint][yuzu-complaint];
  [District Court of The Hague, ECLI:NL:RBDHA:2026:25479][rb-mig] (2026-09-02),
  metadata and summary from the judiciary's open-data service.

Stores and platforms:

- Google Play captures: [yuzu][play-yuzu] (20240302114933), [yuzu Early Access][play-yuzu-ea] (20240302114930),
  [Eden][play-eden] (20250915215704).
- Flathub: [Ryubing][flathub-ryubing], [Eden][flathub-eden]; Apple, [App Review Guidelines][apple-guidelines]
  (last updated 16 October 2026); Android, [developer verification][android-verify].

Maker material:

- [Nintendo, "Ask the Developer Vol. 16: Nintendo Switch 2, Part 4"][ntdo-atd]
  (2025-04-02, translated by Nintendo); [NVIDIA blog, Switch 2][nvidia] (2025-04-03).
- Nintendo investor Q&A, read with `pdftotext`: [AGM, June 2026][ir-2606], [briefing, November 2026][ir-2611],
  [briefing, November 2025][ir-2511], and [AGM, June 2025][ir-2506], with the Japanese AGM file of 2026.

References, press, and leads:

- Wikipedia: ["Yuzu (emulator)"][wp-yuzu] 1380070546; ["Ryujinx"][wp-ryujinx] 1376535915;
  ["Nintendo Switch emulation"][wp-nse] 1384763016.
- SwitchBrew: [home page][switchbrew] revision 15701; ["Switch 2: System Versions"][sb-versions] revision 15457;
  ["Switch 2: 23.5.0"][sb-2350] revision 15455 (both last edited 10 November 2026).
- GNU, [licence list, "Zero-clause BSD license"][gnu-0bsd] (page dated 2026/04/22).
- Emulation General Wiki, leads: ["Nintendo Switch emulators"][egw-switch] revision 152600;
  ["Nintendo Switch 2 emulators"][egw-switch2] revision 152544.
- Press, secondary: Android Authority on [Sudachi][aa-sudachi] (2025-08-25), [Kenji-NX][aa-kenji] (2025-06-05),
  and the [Switch 2 jailbreak][aa-jailbreak] (2026-10-22); [Notebookcheck on Kenji-NX][nbc-kenji] (2026-02-11);
  [TweakTown][tweaktown] (2026-10-31; refused automated requests on re-check); [Wccftech][wccftech] (2026-02-16);
  [Nintendo Life on MIG Switch][nl-mig] (2026-09-11); [android.com.pl][androidpl] (2026-11-10), a lead.

Not opened, by rule: every key, firmware, and dumping guide linked by Ryubing's documentation, MeloNX,
and yuzu's Play listing (`docs.ryujinx.app/guides/dumping`, `docs.ryujinx.app/info/dumping`,
`nh-server.github.io/switch-guide`, `yuzu-emu.org/help/quickstart`); the circumvention-device sellers above;
`lichii.org`; `onejailbreak.com`, a jailbreak and dump site the wiki links; and torzu's hidden service.

[r0-02]: R0-02-legal-baseline.md
[r0-02-yuzu]: R0-02-legal-baseline.md#game-sites-and-the-yuzu-case
[r0-02-keys]: R0-02-legal-baseline.md#keys
[r0-02-fw]: R0-02-legal-baseline.md#firmware-and-back-up-copies
[r0-02-makers]: R0-02-legal-baseline.md#makers-statements-on-emulators
[r0-02-takedown]: R0-02-legal-baseline.md#takedown-and-enforcement-history
[r0-02-notices]: R0-02-legal-baseline.md#what-the-notices-allege
[r0-02-reached]: R0-02-legal-baseline.md#who-has-been-reached
[r0-02-opt1]: R0-02-legal-baseline.md#1-emulate-only-systems-whose-games-are-not-encrypted
[r0-02-opt2]: R0-02-legal-baseline.md#2-emulate-an-encrypted-system-and-require-the-user-to-supply-keys
[r0-02-opt3]: R0-02-legal-baseline.md#3-accept-only-decrypted-input-or-embed-a-published-key
[r0-02-opt4]: R0-02-legal-baseline.md#4-require-firmware-that-the-user-dumps
[r0-02-opt5]: R0-02-legal-baseline.md#5-replace-the-firmware
[r0-02-opt7]: R0-02-legal-baseline.md#7-publish-or-decline-to-publish-dumping-guides-and-links
[r0-02-rec]: R0-02-legal-baseline.md#recommendation
[r0-02-opt9]: R0-02-legal-baseline.md#9-choose-where-the-project-is-hosted-and-distributed
[r0-02-checks]: R0-02-legal-baseline.md#console-checks-and-use-after-circumvention
[r0-05-ntdo]: R0-05-source-map.md#gamecube-wii-wii-u-switch-and-switch-2
[r1-04]: R1-04-primer-modern.md
[r1-04-arm]: R1-04-primer-modern.md#arm-in-the-switch-and-switch-2
[r1-04-shader]: R1-04-primer-modern.md#shader-translation-and-compilation-stutter
[r1-04-os]: R1-04-primer-modern.md#switch-and-switch-2-1
[r1-08]: R1-08-catalogue-modern.md
[r1-08-ntdo]: R1-08-catalogue-modern.md#nintendo-family
[adr6-closed]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#closed-tier
[adr6-eval]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#evaluating-a-new-source
[adr6-every]: ../../adr/0006-read-sources-by-tier-under-a-compatibility-test.md#in-every-tier
[roadmap]: ../../roadmap/research.md
[roadmap-studies]: ../../roadmap/research.md#emulator-studies
[roadmap-synthesis]: ../../roadmap/research.md#phase-6-synthesis
[register]: ../../../.claude/hooks/source-register.txt
[eden]: https://git.eden-emu.dev/eden-emu/eden
[eden-basics]: https://git.eden-emu.dev/eden-emu/eden/src/branch/master/docs/user/Basics.md
[eden-graphics]: https://git.eden-emu.dev/eden-emu/eden/src/branch/master/docs/user/Graphics.md
[eden-arch]: https://git.eden-emu.dev/eden-emu/eden/src/branch/master/docs/user/Architectures.md
[eden-third]: https://git.eden-emu.dev/eden-emu/eden/src/branch/master/docs/user/ThirdParty.md
[eden-site]: https://eden-emu.dev/
[eden-blog]: https://eden-emu.dev/2026/04/24/distribution-challenges/
[eden-nx2]: https://git.eden-emu.dev/Takoroka/eden-nx2/releases/tag/nx2-2026-10-29
[eden-rel]: https://git.eden-emu.dev/eden-emu/eden/releases/tag/v0.2.1
[citron-neo]: https://git.mythrax-rs.org/Citron-NEO/emulator
[citron-neo-site]: https://citron-neo.org/
[aur-citron]: https://aur.archlinux.org/packages/citron
[aur-citron-neo]: https://aur.archlinux.org/packages/citron-neo
[ryubing-docs]: https://docs.ryujinx.app/
[ryubing-site]: https://ryujinx.app
[melonx-codeberg]: https://codeberg.org/Altrew/MeloNX
[melonx-azure]: https://github.com/AzureDominus/melonx
[melonx-site]: https://melonx.org/
[strato]: https://github.com/strato-emu/strato
[hydra]: https://github.com/SamoZ256/hydra
[pound]: https://github.com/pound-emu/pound
[oboromi]: https://github.com/0xNikilite/oboromi
[ruzu]: https://github.com/vricosti/ruzu-emu
[lemon]: https://github.com/Ghael-V/Lemon-Project
[eglantine]: https://github.com/Eglantine-Community/Eglantine
[lichii]: https://github.com/zortos293/Lichii
[astris]: https://github.com/V380-Ori/Astris.Binaries
[ctu]: https://github.com/reswitched/CageTheUnicorn
[mephisto]: https://github.com/reswitched/Mephisto
[nsemu]: https://github.com/RKX1209/nsemu
[psychopomp]: https://github.com/daeken/PsychopompNX
[horizon-linux]: https://github.com/kentjhall/horizon-linux
[dynarmic]: https://github.com/azahar-emu/dynarmic
[stikdebug]: https://github.com/StikDebug/StikDebug
[nxgfxtests]: https://github.com/ReinUsesLisp/nxgfxtests
[sw2-homebrew]: https://github.com/fernando-granco/switch2-homebrew
[switch-examples]: https://github.com/switchbrew/switch-examples
[yuzu-prometheus]: https://web.archive.org/web/20200510173041/https://yuzu-emu.org/entry/yuzu-prometheus/
[yuzu-fastmem]: https://web.archive.org/web/20210607225815/https://yuzu-emu.org/entry/yuzu-fastmem/
[yuzu-hades]: https://web.archive.org/web/20210709223608/https://yuzu-emu.org/entry/yuzu-hades/
[ryujinx-pptc]: https://web.archive.org/web/20200617002039/https://blog.ryujinx.org/introducing-profiled-persistent-translation-cache/
[ryujinx-amadeus]: https://web.archive.org/web/20200818020158/https://blog.ryujinx.org/introducing-complete-audio-rendering-support-amadeus/
[n-240531]: https://github.com/github/dmca/blob/master/2024/05/2024-05-31-nintendo.md
[n-240916]: https://github.com/github/dmca/blob/master/2024/09/2024-09-16-nintendo.md
[n-250226]: https://github.com/github/dmca/blob/master/2025/02/2025-02-26-nintendo.md
[n-250226-2]: https://github.com/github/dmca/blob/master/2025/02/2025-02-26-nintendo-2.md
[n-250306]: https://github.com/github/dmca/blob/master/2025/03/2025-03-06-nintendo-3.md
[n-251016]: https://github.com/github/dmca/blob/master/2025/10/2025-10-16-nintendo.md
[n-260212]: https://github.com/github/dmca/blob/master/2026/02/2026-02-12-nintendo.md
[n-260428]: https://github.com/github/dmca/blob/master/2026/04/2026-04-28-nintendo.md
[n-260630]: https://github.com/github/dmca/blob/master/2026/06/2026-06-30-nintendo.md
[n-260710]: https://github.com/github/dmca/blob/master/2026/07/2026-07-10-nintendo-2.md
[n-260930]: https://github.com/github/dmca/blob/master/2026/09/2026-09-30-nintendo.md
[rb-mig]: https://data.rechtspraak.nl/uitspraken/content?id=ECLI:NL:RBDHA:2026:25479
[gnu-0bsd]: https://www.gnu.org/licenses/license-list.html#Zero-BSD
[williams]: https://storage.courtlistener.com/recap/gov.uscourts.wawd.336727/gov.uscourts.wawd.336727.30.0.pdf
[yuzu-complaint]: https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf
[play-yuzu]: https://web.archive.org/web/20240302114933/https://play.google.com/store/apps/details?id=org.yuzu.yuzu_emu
[play-yuzu-ea]: https://web.archive.org/web/20240302114930/https://play.google.com/store/apps/details?id=org.yuzu.yuzu_emu.ea
[play-eden]: https://web.archive.org/web/20250915215704/https://play.google.com/store/apps/details?id=dev.eden.eden_emulator
[flathub-ryubing]: https://flathub.org/apps/io.github.ryubing.Ryujinx
[flathub-eden]: https://flathub.org/apps/dev.eden_emu.eden
[apple-guidelines]: https://developer.apple.com/app-store/review/guidelines/
[android-verify]: https://developer.android.com/developer-verification
[ntdo-atd]: https://www.nintendo.com/us/whatsnew/ask-the-developer-vol-16-nintendo-switch-2-part-4/
[ir-2606]: https://www.nintendo.co.jp/ir/pdf/2026/qa2606e.pdf
[ir-2611]: https://www.nintendo.co.jp/ir/pdf/2026/261106_2e.pdf
[ir-2511]: https://www.nintendo.co.jp/ir/pdf/2025/251105_2e.pdf
[ir-2506]: https://www.nintendo.co.jp/ir/pdf/2025/qa2506e.pdf
[nvidia]: https://blogs.nvidia.com/blog/nintendo-switch-2-leveled-up-with-nvidia-ai-powered-dlss-and-4k-gaming/
[wp-yuzu]: https://en.wikipedia.org/w/index.php?oldid=1380070546
[wp-ryujinx]: https://en.wikipedia.org/w/index.php?oldid=1376535915
[wp-nse]: https://en.wikipedia.org/w/index.php?oldid=1384763016
[switchbrew]: https://switchbrew.org/wiki/Main_Page
[sb-versions]: https://switchbrew.org/wiki/Switch_2:_System_Versions
[sb-2350]: https://switchbrew.org/wiki/Switch_2:_23.5.0
[egw-switch]: https://emulation.gametechwiki.com/index.php?title=Nintendo_Switch_emulators&oldid=152600
[egw-switch2]: https://emulation.gametechwiki.com/index.php?title=Nintendo_Switch_2_emulators&oldid=152544
[aa-sudachi]: https://www.androidauthority.com/sudachi-ends-development-3590776/
[aa-kenji]: https://www.androidauthority.com/kenji-nx-switch-emulator-2-0-4-3564479/
[aa-jailbreak]: https://www.androidauthority.com/nintendo-switch-2-software-jailbreak-3727013/
[nbc-kenji]: https://www.notebookcheck.net/Kenji-NX-update-boosts-Nintendo-Switch-emulation-performance-on-Snapdragon-8-Elite.1224334.0.html
[tweaktown]: https://www.tweaktown.com/news/114420/first-nintendo-switch-2-emulator-for-pc-is-out-and-it-already-boots-mario-kart-world/index.html
[wccftech]: https://wccftech.com/nintendo-once-again-brings-dmca-hammer-down-switch-emulators/
[nl-mig]: https://www.nintendolife.com/news/2026/09/nintendo-wins-court-case-ruling-the-sale-of-switch-circumvention-devices-unlawful
[androidpl]: https://android.com.pl/tech/1103824-nintendo-switch-2-wojna-z-piratami/
