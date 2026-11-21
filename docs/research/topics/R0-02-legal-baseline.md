---
title: Legal baseline
roadmap_item: R0-02
status: draft
date: 2026-11-19
---

# Legal baseline

## Summary

This note asks what law and enforcement history constrain an emulator project, building on the clean-room note,
[R0-01](R0-01-clean-room-policy.md).

No contested ruling was found that decides
whether distributing a console emulator is lawful under anti-circumvention law.
The favourable appeals of 2000 were preliminary-injunction rulings, mainly on copyright fair use,
about one console whose games the opinions do not describe as encrypted;
a later ruling for Connectix on remand is known only from press accounts.
One contested judgment held a free server emulator for an online game to be a trafficked circumvention tool
(Davidson v Jung, 2005).

The actions against emulators since 2023 rest mainly on anti-circumvention law
and concern emulators of consoles whose games are encrypted, almost all for the Switch.
Only the yuzu action ended in a judgment against an emulator's developer, by consent.
A default judgment held a streamer who linked to emulators liable for trafficking, and the rest ended through notices,
a letter to a store, or private contact.

Three things matter most to Rustalgia.
Whether a system's games are encrypted, and perhaps whether they are authenticated,
separates the systems on the roadmap by risk (inference).
Firmware, keys, and game dumps have no settled lawful route from the user to the emulator in any jurisdiction examined.
Patents and trade marks are separate risks that independent writing does not answer.

"Options and trade-offs" ends with recommendations for the owner: take up unencrypted systems first,
prefer replacement firmware, publish no dumping guides, read expired patents only,
and plan around United States law first.
This note is not legal advice.

## Scope

- Question: what do emulation case law, anti-circumvention law, the rules on firmware and keys,
  and the history of takedowns mean for an open-source emulator, and what risks do patents and trade marks add?
- Covered: the United States in depth; the European Union, the United Kingdom, Germany, France, Japan, Canada,
  Australia, and South Korea for technological measures; enforcement history to November 2026.
  The roadmap line named four subjects; patents and trade marks were added at the owner's request, as recorded risks.
- Left to other items: what [R0-01](R0-01-clean-room-policy.md) already records, which is cited by section name;
  licence strategy and contributor terms ([`R0-03`](../../roadmap/research.md#phase-0-ground-rules)); note conventions
  ([R0-04](R0-04-glossary-and-conventions.md)); the exposure of each system family
  ([`R1-10` to `R1-25`](../../roadmap/research.md#system-family-surveys)); firmware emulation as a technique
  ([`R2-12`](../../roadmap/research.md#phase-2-cross-cutting-engineering)); store policy
  ([`R3-03`, `R3-06`](../../roadmap/research.md#phase-3-host-platforms)).
- Researched on 2026-11-19, and reworked on 2026-11-20 to answer the open questions.
  Statutes and policies are quoted as published on the day each was read.
  French, German, Japanese, and Korean law was read partly in translations or in earlier texts, as marked.
- How claims were checked: each finding names its source.
  For the first version, research agents fetched every source on 2026-11-19 and copied quotations from the raw text;
  a second, independent pass fetched the sources again and tested each claim and quotation,
  and its corrections were applied.
  Findings added on 2026-11-20 rest on pages fetched that day with `curl`,
  or with a browser where a page renders by script, as marked, with each quotation confirmed in the raw text.
  Claims that could not be checked are listed in the pull request.
- Where only part of a source was read,
  the finding says so. "(secondary)" marks a claim that rests on commentary or press,
  "(from memory)" one that no fetched page confirmed, and "(inference)" reasoning.
  A statement that nothing was found records a search, not proof of absence.
- No emulator source code, decompilation, leaked material, firmware, key, or game was opened or obtained.
  From emulator projects, only README files, licence files, release notes, documentation, and websites were read.
  No repository named in a takedown notice was opened, and no download of system software was opened.
- A process call for this note: it says that a protection exists, what it protects, and what kind of check it is,
  and never how to defeat it.
  Publishing such information is conduct that statutes and filings name
  (section 296 of the United Kingdom's 1988 Act; the yuzu complaint),
  and the research guide already bars keys and firmware bytes
  ([research conventions, "Constants and tables"](../README.md#constants-and-tables)).

## Findings

### Emulation case law in the United States

[R0-01](R0-01-clean-room-policy.md) records
[Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html),
[Sony v Connectix](https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html), and
[Atari v Nintendo](https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html) on reverse engineering
([R0-01, "Reverse engineering and the legal status of a clean room"](R0-01-clean-room-policy.md#reverse-engineering-and-the-legal-status-of-a-clean-room)).
This section adds what the emulator cases did and did not decide.

#### Connectix and Bleem

- Sony v Connectix was an appeal from a preliminary injunction that the district court had based on copyright alone;
  the court also reversed a finding of trade mark tarnishment, and Sony's other claims were not before it.
  The court called the emulator "modestly transformative" and "a legitimate competitor in the market for platforms on
  which Sony and Sony-licensed games can be played".
  "Sony has asserted no patent rights in this proceeding."
  The opinion does not consider an emulator that needs the user to supply a BIOS, keys, or decrypted game data
  (inference from the whole opinion; a search of its text found neither "encrypt" nor "key").
- On remand the district court is reported to have granted Connectix summary judgment from the bench on the copyright
  and trade mark claims, seven of Sony's nine, in May 2000,
  leaving trade-secret and unfair-competition claims for a jury trial set for March 2001 (a Connectix press release
  [reprinted by MacTech](https://www.mactech.com/2000/05/17/court-dismisses-all-sony-copyright-and-tm-claims-in-connectix-case/),
  and [The Register, 6 September 2000](https://www.theregister.com/2000/09/06/sony_playstation_emulator_trial_date/);
  secondary).
  No written order was found.
- The Connectix case then ended by agreement, before that trial.
  A joint announcement of 14 March 2001 said the companies had "resolved all legal issues" about the emulator and
  that Sony would "acquire from Connectix all assets related to the VGS emulation technology"
  ([MacTech reprint of the press release](https://www.mactech.com/content/sony-and-connectix-announce-agreement-0),
  secondary).
- [Sony v Bleem](https://law.resource.org/pub/us/case/reporter/F3/214/214.F3d.1022.99-17137.html) did not decide
  whether an emulator is lawful.
  "The legality of the emulator is not at issue in this lawsuit."
  The only issue on appeal, again from a preliminary injunction,
  was Bleem's use of screenshots of Sony games in its advertising.
- Bleem held that use a fair use, with a stated limit.
  The conclusions "apply only to those screen shots
  that Bleem has generated by taking the actual images of Sony's games from a television screen".
  The opinion does not address video capture, streaming, or screenshots published for other purposes.
- One sentence in Bleem is often quoted more widely than its context supports.
  In the market-harm discussion the court wrote "We have already ruled
  that the emulator is not a violation of the copyright laws", citing Connectix.
  That sentence describes a different product, in an appeal that did not concern Bleem's emulator
  (inference from the two opinions).

#### Derivative works, loading, and ownership

- [Lewis Galoob Toys v Nintendo](https://law.resource.org/pub/us/case/reporter/F2/964/964.F2d.965.91-16205.html),
  decided after a bench trial, held that a cheat device which altered one data byte in transit made no derivative work.
  "A derivative work must incorporate a protected work in some concrete or permanent form."
  The device "does not alter the data that is stored in the game cartridge.
  Its effects are temporary."
- [Micro Star v FormGen](https://law.resource.org/pub/us/case/reporter/F3/154/154.F3d.1107.html) distinguished Galoob on
  a preliminary-injunction record.
  Level files sold on a disc described the game's display in detail,
  so "the audiovisual displays assume a concrete or permanent form in the MAP files".
  The court also said that Galoob's fair use discussion "was not necessary", and called it dicta.
- [Midway v Artic](https://law.resource.org/pub/us/case/reporter/F2/704/704.F2d.1009.82-1607.html) held
  that a speeded-up arcade game made with a replacement circuit board was a derivative work,
  and that the board's seller was a contributory infringer
  (7th Circuit 1983, affirming a preliminary injunction; only the relevant paragraphs were read).
- No decision was found that applies these three cases to a save state, a texture pack, a translation patch,
  or an upscaling filter.
  A cheat or filter that leaves nothing behind resembles Galoob's facts,
  and a distributed file that re-describes game content resembles Micro Star's (inference).
- In the Ninth Circuit, loading a program into memory makes a copy.
  [MAI v Peak](https://law.resource.org/pub/us/case/reporter/F2/991/991.F2d.511.92-55363.93-55106.html) held
  that "the loading of MAI's operating software into RAM ... constitutes a copyright violation"
  where a repair company ran the software on more machines than its one licence covered,
  and also found infringement where the company, a third party outside its customers' licences, ran their copies.
  [Section 117(c)](https://www.law.cornell.edu/uscode/text/17/117) now exempts a copy made by switching on a machine
  "for purposes only of maintenance or repair".
- [17 U.S.C. § 117(a)](https://www.law.cornell.edu/uscode/text/17/117) lets "the owner of a copy of a computer program"
  make a copy "as an essential step in the utilization of the computer program in conjunction with a machine", or a copy
  "for archival purposes only".
  The privilege belongs to an owner.
- The Ninth and Second Circuits word the test for ownership differently,
  though Vernor said its holding created no split with Krause.
  In the Ninth Circuit a user is a licensee where the copyright owner "(1) specifies that the user is granted a license;
  (2) significantly restricts the user's ability to transfer the software; and (3) imposes notable use restrictions"
  ([Vernor v Autodesk](https://cdn.ca9.uscourts.gov/datastore/opinions/2010/09/10/09-35969.pdf)).
  In the Second Circuit "formal title in a program copy is not an absolute prerequisite",
  and the question is whether the party "exercises sufficient incidents of ownership"
  ([Krause v Titleserv](https://law.resource.org/pub/us/case/reporter/F3/402/402.F3d.119.03-9303.html)).
  Neither case concerned a game.
- Not every breach of a licence is infringement.
  For a licensee's breach to be infringement,
  "there must be a nexus between the condition and the licensor's exclusive rights of copyright"
  ([MDY v Blizzard](https://cdn.ca9.uscourts.gov/datastore/opinions/2011/02/17/09-15932.pdf)).
- A term confining an operating system to its maker's hardware survived a copyright misuse defence.
  The licence "did not prevent others from developing their own computer or operating systems"
  ([Apple v Psystar](https://cdn.ca9.uscourts.gov/datastore/opinions/2011/09/28/10-15113.pdf)).
  The defendant sold computers with the system installed, and the infringement finding was not appealed.
- An unpublished Eleventh Circuit opinion held a commercial product
  that runs a phone operating system on other hardware "moderately transformative" and a fair use, citing Connectix
  ([Apple v Corellium](https://media.ca11.uscourts.gov/opinions/unpub/files/202112835.pdf), 2023).
  The purpose found was security research, and two counts were sent back undecided.

#### Game sites, and the yuzu case

- Distributing games is a different matter from distributing an emulator.
  A contested summary judgment found the operator of a ROM site with paid memberships liable for direct, contributory,
  and vicarious copyright infringement
  ($1,715,000) and for wilful infringement of 28 trade marks on the website ($400,000), with judgment for $2,115,000
  ([Nintendo v Storman](https://storage.courtlistener.com/recap/gov.uscourts.cacd.758131/gov.uscourts.cacd.758131.87.0.pdf),
  Central District of California 2021).
  The order does not contain the word "emulator" or any form of it (search of its text).
- Nintendo v Tropic Haze, the yuzu case, ran nine days from complaint to judgment with no answer filed
  (calculated from the docket documents:
  [complaint](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf),
  [joint motion](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.10.0.pdf),
  [judgment](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.11.0.pdf)).
  The complaint pleads three anti-circumvention counts and two copyright counts, and no trade mark, patent,
  trade-secret, or contract claim.
- The complaint's theory is decryption at run time with keys that the user supplies.
  Nintendo alleges that yuzu executes "code that decrypts the Nintendo Switch video game files immediately before
  and during runtime using an illegally-obtained copy of prod.keys", and that "but for Yuzu, a user could have keys,
  and they could have encrypted game ROMs, but they couldn't play games".
  These are allegations.
- Nintendo also alleges that dumping one's own purchased game is unlawful:
  "Any copy of a Nintendo Switch game ROM not on an authorized cartridge or console is an unauthorized copy and
  therefore infringing."
  The complaint does not mention fair use, § 117, § 1201(f), Sega, Connectix, or Bleem (search of its text).
- The complaint relies on conduct around the software as well:
  a setup guide with links to console-hacking and key-dumping tools, pleaded as trafficking "by providing direct links";
  paid early-access builds and about $30,000 a month from patrons; telemetry; a compatibility list;
  support for a game leaked before release; and the developers' own dumping and testing.
  All of these are allegations.
- The judgment's findings were agreed, not litigated.
  The parties "consent to judgment in favor of Nintendo",
  and the defendant and its members "acknowledge and agree that the findings of fact ... are true and accurate".
- The fourth finding reads: "Developing or distributing software, including Yuzu,
  that in its ordinary course functions only when cryptographic keys are integrated without authorization,
  violates the Digital Millennium Copyright Act's prohibition on trafficking in devices
  that circumvent effective technological measures", on the ground that the software is "primarily designed" for it.
  A consent judgment binds its parties; it is not precedent for other courts or other emulators (inference).
- The Tropic Haze injunction bars "trafficking in Yuzu or any source code or features of Yuzu".
  It also bars infringement "which includes the emulation of Nintendo's video games", orders the domain surrendered and,
  "upon Nintendo's election and to the extent controlled by Defendant or its members",
  the deletion of "all circumvention devices, including all copies of Yuzu",
  and is "binding against Defendant and its members worldwide".

#### Keighin, and later default judgments

- One court has applied § 1201 to named console emulators in its own reasoning, on an undefended default.
  In Nintendo v Keighin a magistrate judge,
  taking the complaint as true and likening them to "the Battle.net emulator in Davidson",
  wrote that the emulators a streamer had linked "evade technological measures
  which prevent an individual from playing Nintendo games on other consoles and from playing pirated games",
  and that "There is no other alleged use for these emulators"
  ([Keighin recommendation, ECF 36](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.36.0.pdf)).
- The recommendation counts open-source status against the emulators:
  they "have little if any commercial value outside of circumventing Nintendo's technological measures
  because they are open-source projects and are thus free for the public to replicate".
  Nobody argued the other side, and the text does not contain "1201(f)", "fair use", or "Connectix"
  (search of its text).
- The $17,500 awarded is $10,000 in statutory damages for direct infringement of one game,
  and $7,500 "for 15 violations" of § 1201 (ECF 36, pages 27 and 30).
- The magistrate judge refused two of the three parts of the injunction that Nintendo asked for
  (ECF 36, pages 30 and 31).
  An injunction against third parties was refused because "Plaintiff's Complaint does not allege
  that Defendant is working in concert with any third party".
  An order to destroy circumvention devices was refused
  because "all the known technologies Defendant used to circumvent Nintendo's technological measures are available
  for free on the Internet if one has the proper link".
- The district judge adopted the recommendation on 29 October 2025, reviewing for clear error,
  because "No party has filed an objection"
  ([order, ECF 37](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.37.0.pdf),
  page 1).
- The injunction entered bars infringing "including by streaming, and from trafficking in Switch emulators,
  Nintendo's proprietary cryptographic keys,
  or other software or technologies that circumvent Nintendo's technological protective measures"
  ([final judgment, ECF 38](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.38.0.pdf),
  page 1).
  It orders a status report "on or before November 13, 2025" (ECF 38, page 2).
- The same recommendation says "Repositories of ROMs are not circumvention technologies or devices",
  and that streaming pirated pre-release games infringed the reproduction and public performance rights.
- A 2026 default judgment awarded Nintendo $4,500,000 against an individual alleged to have run shops
  for pirated Switch games and circumvention software, on claims that included breach of the console's user agreements
  ([Nintendo v Williams](https://storage.courtlistener.com/recap/gov.uscourts.wawd.336727/gov.uscourts.wawd.336727.29.0.pdf),
  Western District of Washington, 23 September 2026).
  Its text does not mention emulators (search of its text).

#### What the record shows

- Apart from Tropic Haze, and Keighin,
  where a streamer who posted links to emulators was held on default to have trafficked in them
  and was enjoined from "trafficking in Switch emulators",
  no suit against an emulator's developer or distributor was found for 2024 to November 2026, and none by Sony, Sega,
  or Microsoft.
- Ryujinx ended in October 2024 after, by a press account of a developer's chat message,
  its creator "was contacted by Nintendo and offered an agreement to stop working on the project"
  ([PC Gamer](https://www.pcgamer.com/gaming-industry/switch-emulator-ryujinx-goes-offline-after-creator-gets-an-offer-from-nintendo-they-cant-refuse),
  secondary).
  No court filing was found.
- Every judgment found against the developer or distributor of a console emulator is a consent or default judgment.
  The one contested § 1201 judgment found against an emulator's developers concerns a free server for an online game,
  not a console ([Davidson v Jung](https://law.resource.org/pub/us/case/reporter/F3/422/422.F3d.630.04-3654.html),
  summary judgment affirmed in 2005).
  The other contested rulings found concern ROM distribution, or pre-date consoles with encrypted games (inference).

### Anti-circumvention law in the United States

[R0-01](R0-01-clean-room-policy.md) gives one sentence on 17 U.S.C. § 1201(f) and two on the 2024 exemptions
([R0-01, "Reverse engineering and the legal status of a clean room"](R0-01-clean-room-policy.md#reverse-engineering-and-the-legal-status-of-a-clean-room)).
This section sets out the statute and how courts have read it.

#### The statute

- The statute has three prohibitions.
  [Section 1201(a)(1)](https://www.law.cornell.edu/uscode/text/17/1201) forbids the act:
  "No person shall circumvent a technological measure
  that effectively controls access to a work protected under this title."
  Section 1201(a)(2) forbids anyone to "manufacture, import, offer to the public, provide,
  or otherwise traffic in any technology, product, service, device, component,
  or part thereof" that meets one of three tests.
  Section 1201(b)(1) is a matching ban on tools that defeat a measure protecting "a right of a copyright owner".
  It has no ban on the act.
- The three tests for a tool are alternatives.
  It "is primarily designed or produced" for circumventing,
  or "has only limited commercially significant purpose or use other than to circumvent",
  or "is marketed ... for use in circumventing" (§ 1201(a)(2)(A) to (C)).
- To circumvent "means to descramble a scrambled work, to decrypt an encrypted work, or otherwise to avoid, bypass,
  remove, deactivate, or impair a technological measure, without the authority of the copyright owner"
  (§ 1201(a)(3)(A)).
  A measure "effectively controls access"
  if "in the ordinary course of its operation" it "requires the application of information, or a process or a treatment,
  with the authority of the copyright owner, to gain access to the work" (§ 1201(a)(3)(B)).

#### How courts have read it

- Fair use is not among the listed exemptions.
  The statute says only that nothing in it "shall affect rights, remedies, limitations,
  or defenses to copyright infringement, including fair use" (§ 1201(c)(1)).
- A district court held after trial that fair use is no defence to trafficking:
  "If Congress had meant the fair use defense to apply to such actions, it would have said so"
  ([Universal v Reimerdes](https://static.case.law/f-supp-2d/111/cases/0294-01.json)).
  The Second Circuit affirmed and wrote
  that fair use "has never been held to be a guarantee of access to copyrighted material"
  for copying "by the fair user's preferred technique or in the format of the original"
  ([Universal v Corley](https://law.resource.org/pub/us/case/reporter/F3/273/273.F3d.429.00-9185.html)).
- The Ninth Circuit has left the question open.
  On a preliminary injunction it assumed for argument that fair use can be a defence to a § 1201(a) claim
  and rejected it on the facts
  ([Disney v VidAngel](https://cdn.ca9.uscourts.gov/datastore/opinions/2017/08/24/16-56843.pdf), note 17), and in
  [MDY](https://cdn.ca9.uscourts.gov/datastore/opinions/2011/02/17/09-15932.pdf) it wrote "we too leave open the
  question whether fair use might serve as an affirmative defense to a prima facie violation of § 1201" (MDY, note 12).
- Buying a copy does not carry authority to decrypt it.
  The statute "exempts from liability those who would 'decrypt' an encrypted DVD with the authority of a copyright
  owner, not those who would 'view' a DVD with the authority of a copyright owner" (Corley).
  A district court applied this to software that used a genuine player key without a licence
  ([321 Studios v MGM](https://static.case.law/f-supp-2d/307/cases/1085-01.json)).
- The circuits disagree on whether a link to infringement is needed.
  The Federal Circuit held that § 1201 "prohibits only forms of access
  that bear a reasonable relationship to the protections that the Copyright Act otherwise affords copyright owners"
  ([Chamberlain v Skylink](https://law.resource.org/pub/us/case/reporter/F3/381/381.F3d.1178.04-1118.html)).
  The Ninth Circuit refused to follow:
  "we are unable to follow its approach because it is contrary to the plain language of the statute" (MDY v Blizzard).
  The Supreme Court has not construed these provisions (MDY said so in 2011; no later decision was found).
- A weak or broken measure still counts.
  The DVD cipher "effectively controls access" "whether or not it is a strong means of protection" (Reimerdes).
  A key published on the internet does not change that: "when the decryption key was not employed,
  the encryption effectively worked to prevent access"
  ([Apple v Psystar](https://static.case.law/f-supp-2d/673/cases/0931-01.json), Northern District of California 2009).
- A check does not control access to material that is otherwise readable.
  A printer's authentication sequence did not control access to a program
  that anyone who buys the printer "may read ... directly from the printer memory",
  and the provision "does not naturally extend to a technological measure that restricts one form of access
  but leaves another route wide open"
  ([Lexmark v Static Control](https://law.resource.org/pub/us/case/reporter/F3/387/387.F3d.522.03-5400.html),
  on a preliminary injunction).
  The Ninth Circuit applied the same reasoning to the parts of a game that sit unprotected on the buyer's disk (MDY).
  An unencrypted flag that software may ignore "is a passive entity that does nothing by itself"
  ([Agfa v Adobe](https://static.case.law/f-supp-2d/404/cases/1030-01.json)).
- Lexmark set video games apart, in passing.
  "Unlike the code underlying video games or DVDs,
  'using' or executing the Printer Engine Program does not in turn create any protected expression."
  This explains why the console cases did not help Lexmark; it is not a holding about any console (inference).

#### Console checks, and use after circumvention

- Two district courts treated a console's disc authentication as an access control
  when a device defeated it on the console.
  A device that let a PlayStation play discs from another territory "appears to be a device whose primary function is to
  circumvent" ([Sony v GameMasters](https://static.case.law/f-supp-2d/87/cases/0976-01.json), preliminary injunction,
  1999).
- In [Sony v Divineo](https://static.case.law/f-supp-2d/457/cases/0957-01.json),
  on summary adjudication against a seller who appeared without a lawyer and default against his companies,
  modchips and a hard-disk loader program were circumvention devices,
  and "downstream customers' lawful or fair use of circumvention devices does not relieve" a seller of liability.
- Divineo describes an authentication process, not encryption.
  GameMasters says the console operates only when "encrypted data is read from an authorized CD-ROM",
  citing the plaintiff's papers; the measure at issue is a territory and authenticity check (inference).
- Using software after someone else removed its protection is not circumvention by the user, in the Fifth Circuit:
  § 1201(a)(1) "does not apply to the use of copyrighted works after the technological measure has been circumvented"
  ([MGE v GE](https://www.ca5.uscourts.gov/opinions/pub/08/08-10521-CV1.wpd.pdf)).
- A free server emulator has been held a trafficked tool.
  The bnetd server "had limited commercial purpose because its sole purpose was to avoid the limitations of Battle.net"
  ([Davidson v Jung](https://law.resource.org/pub/us/case/reporter/F3/422/422.F3d.630.04-3654.html),
  a contested summary judgment, affirmed).

#### The interoperability exemption

- Section 1201(f) is narrow.
  Of the contested defences found under it,
  three failed and one was favourably received at the preliminary-injunction stage.
- Subsection (f)(1) exempts the act for a person who "has lawfully obtained the right to use a copy of a computer
  program", for "the sole purpose of identifying and analyzing those elements of the program that are necessary to
  achieve interoperability of an independently created computer program".
  Subsection (f)(2) lets a person "develop and employ" means of circumvention to enable that analysis,
  or to enable interoperability of an independently created program "with other programs,
  if such means are necessary to achieve such interoperability", so far as that does not infringe;
  it does not say "distribute".
  Subsection (f)(3) lets the information and means "be made available to others" by the person who did the work,
  and "solely" for enabling interoperability.
  Subsection (f)(4) defines interoperability as "the ability of computer programs to exchange information".
- Davidson rejected the defence because the circumvention "constitutes infringement".
  Reimerdes rejected it after trial, first because the defendants had done no reverse engineering themselves,
  and added that the right to share "does not apply to public dissemination of means of circumvention".
  Divineo held a modchip seller liable while taking as true that users could use modchips
  for interoperability under § 1201(f).
  Lexmark said a defendant "may benefit from the interoperability defense,
  at least in the preliminary injunction context".
- The Copyright Office has read § 1201(f) as reaching circumvention for interoperability itself, not only analysis.
  Its [2017 study](https://www.copyright.gov/policy/1201/section-1201-full-report.pdf) concludes "that the stronger
  interpretation is that section 1201(f) does permit circumvention to enable interoperability in certain circumstances,
  and subject to various statutory safeguards".
- In the [first rulemaking, in 2000](https://www.govinfo.gov/content/pkg/FR-2000-10-27/pdf/00-27714.pdf),
  the Office refused an exemption for games playable only on dedicated platforms,
  saying that because a console's BIOS is a computer program "section 1201(f) would appear to address the problem".
  Both are agency views, not rulings that an emulator qualifies,
  and how they compare with the court decisions above is an inference.
- The encryption research and security testing exemptions have their own conditions.
  Research requires "a good faith effort to obtain authorization",
  and testing requires "the authorization of the owner or operator" of the computer (§ 1201(g) and (j)).

#### The triennial exemptions

- The triennial exemptions cover the act only.
  They may not "be used as a defense in any action to enforce any provision of this title other than this paragraph"
  (§ 1201(a)(1)(E)).
  The Register cannot recommend "exemptions from these anti-trafficking prohibitions"
  ([2024 Recommendation](https://www.copyright.gov/1201/2024/2024_Section_1201_Registers_Recommendation.pdf), page 12).
- No current exemption lets an individual circumvent a console's access controls to run other software.
  An exemption for console jailbreaking was refused in 2012 on the evidentiary record
  ([77 Fed. Reg. 65260](https://www.govinfo.gov/content/pkg/FR-2012-10-26/pdf/2012-26308.pdf)).
  The class for investigating infringement of free software excludes "a video game console" in terms
  ([37 C.F.R. § 201.40(b)(22)](https://www.law.cornell.edu/cfr/text/37/201.40)).
- In 2024 the Librarian refused to let libraries offer preserved games off their premises
  ([2024 final rule](https://www.govinfo.gov/content/pkg/FR-2024-10-28/pdf/2024-24563.pdf)).
  The Register's reasoning mentions emulation:
  "while hardware emulation may be noninfringing and attitudes may be changing,
  video game emulation technologies have been historically associated with piracy"
  (2024 Recommendation, page 191, footnote).
- The 2027 cycle is open.
  The Office intends to recommend renewing the game preservation class,
  and two new game classes are proposed by individuals: operating system incompatibility, and network play.
  No listed petition asks for an exemption for emulators or console jailbreaking.
  First-round comments are due on 7 December 2026
  (Copyright Office, [2027 cycle page](https://www.copyright.gov/1201/2027/index.html) and
  [notice of proposed rulemaking](https://public-inspection.federalregister.gov/2026-21939.pdf)).

#### Damages, crimes, and injunctions

- Civil damages are counted for each item, with no cap:
  "not less than $200 or more than $2,500 per act of circumvention, device, product, component, offer,
  or performance of service" ([§ 1203(c)(3)(A)](https://www.law.cornell.edu/uscode/text/17/1203)).
- A court has multiplied by devices sold:
  $6,018,700 for 7,194 circumvention devices, modchips and a loader program on disc, at $800 for 7,039 and $2,500
  for 155, in [Sony v Filipiak](https://static.case.law/f-supp-2d/406/cases/1068-01.json),
  where liability was stipulated and damages were tried (total of units calculated).
- One decision found counts end-user downloads of posted software:
  $200 for each of 11,228 downloads, within an award of $2,250,600
  ([DISH Network v SatFTA](https://cases.justia.com/federal/district-courts/california/candce/5:2008cv01561/201657/53/0.pdf),
  Northern District of California 2011, on an opposed motion for summary judgment; downloads added up from the order).
  The order does not say whether the software was free.
- A crime needs a violation done "willfully and for purposes of commercial advantage or private financial gain",
  with up to five years for a first offence ([§ 1204(a)](https://www.law.cornell.edu/uscode/text/17/1204)).
  One modified console sold to an undercover agent "for a $50 profit" supported a conviction
  ([United States v Reichert](https://www.govinfo.gov/content/pkg/USCOURTS-ca6-13-03479/pdf/USCOURTS-ca6-13-03479-0.pdf)).
  No prosecution of an emulator author was found.
- Agreed injunctions in this area reach beyond devices.
  A 2025 consent judgment against a seller of flash cartridges and modchips, for $2,000,000,
  bars distributing "any technology, documentation, software code,
  or information used to create or assist in the creation of any Circumvention Devices"
  ([Nintendo v Daly](https://torrentfreak.com/images/nintendo-daly197112005041.pdf)).
- Rulings in 2026 read "access control" broadly at the pleading stage.
  A court refused to dismiss a claim that scraping publicly viewable videos circumvented a "rolling cipher"
  ([Ted Entertainment v ByteDance](https://www.courthousenews.com/wp-content/uploads/2026/10/bytedance-motion-dismiss-ruling.pdf),
  order of 2 October 2026).

#### Which systems the claims concern

- Every § 1201 complaint, judgment, and notice found against a console emulator concerns the Switch,
  whose games are encrypted.
  The one letter found, about Dolphin, asserts that Wii and GameCube game files are encrypted
  ([Dolphin blog, archived copy](https://web.archive.org/web/20241221001744/https://dolphin-emu.org/blog/2023/07/20/what-happened-to-dolphin-on-steam/)).
  None pleads § 1201 against an emulator of a system that has no encryption or authentication.
- No decision under § 1201 was found on a cartridge-era lock-out, such as a logo comparison, a lock-out chip,
  or a region check.
  [Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html)
  and [Atari v Nintendo](https://law.resource.org/pub/us/case/reporter/F2/975/975.F2d.832.91-1293.html) addressed such
  lock-outs under copyright and trade mark law before § 1201 existed.

### Outside the United States

[R0-01](R0-01-clean-room-policy.md) covers the Software Directive's Articles 5, 6, and 8, SAS v WPL, Sony v Datel,
and the matching national rules
([R0-01, "Outside the United States"](R0-01-clean-room-policy.md#outside-the-united-states)).
This section adds the rules on technological measures.
No court ruling about an emulator was found in any of these jurisdictions.

The table is a reading of the statute texts, and each row combines several provisions (inference).
"Statute only" means that no case applying the point was found.

| Place | Circumventing for oneself | Distributing a tool | Interoperability exception | Tested in court |
|---|---|---|---|---|
| European Union | Barred for games, if knowing | Barred on three tests | A recital only | Devices: PC Box |
| United Kingdom | Civil wrong for works other than programs | Civil and criminal | None in the text | Devices only |
| Germany | Barred; no crime if private | Crime if commercial, else a fine | None read in section 95a | Devices only |
| France | Fined, except for research | Crime | None in the criminal text | None read |
| Japan | Deemed infringement; no penalty | Unfair competition; crime | None named; research | Devices only |
| Canada | Barred for access controls | Barred; crime if commercial | Yes, section 41.12 | Devices: King |
| Australia | Civil wrong for access controls | Civil; crime if for profit | Yes, section 116AN(3) | Statute only |
| South Korea | Barred for access controls | Barred on three tests | Yes, for compatibility | Statute only |

#### The treaty and the European Union

- The common root is one treaty sentence.
  Parties must protect measures that "restrict acts ... which are not authorized by the authors concerned
  or permitted by law" ([WIPO Copyright Treaty, Article 11](https://www.wipo.int/wipolex/en/text/295166)).
  Each scheme below is a national choice within it (inference).
- European Union law has two regimes.
  For works in general, Member States must protect against circumvention carried out "in the knowledge,
  or with reasonable grounds to know", and against devices that are marketed for circumvention,
  "have only a limited commercially significant purpose or use other than to circumvent",
  or are "primarily designed" for it
  ([Directive 2001/29/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32001L0029), Article 6(1) and
  (2)).
  For computer programs the rule reaches only "any means the sole intended purpose of
  which is to facilitate the unauthorised removal or circumvention" of a technical device
  ([Directive 2009/24/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32009L0024), Article 7(1)(c)).
- A video game falls under the wider regime.
  Games "constitute complex matter comprising not only a computer program but also graphic and sound elements",
  protected "together with the entire work" under Directive 2001/29
  ([Nintendo v PC Box](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62012CJ0355), paragraph 23).
  Measures "partly incorporated in the physical housing of videogames and partly in consoles" are covered
  if their objective is to prevent or limit acts that adversely affect the rightholder's rights (paragraph 28).
- PC Box made that protection subject to proportionality.
  Measures "must be suitable for achieving that objective and must not go beyond what is necessary".
  The national court must ask whether other measures "could have caused less interference with the activities of third
  parties", must examine the purpose of the devices, and "may, in particular, examine how often those devices ... are in
  fact used in disregard of copyright and how often they are used for purposes which do not infringe copyright".
- The Court decided neither point.
  The Milan court's 2015 judgment for Nintendo that followed is known only from press
  ([Punto Informatico](https://www.punto-informatico.it/modchip-nintendo-vince-a-milano/), secondary).
  Its text sits in paid Italian databases and was not obtained,
  and a search result that gave its date led to a page that no longer exists (research log).
- The recitals of Directive 2001/29 say its protection should not "prevent the development
  or use of any means of circumventing a technological measure
  that is necessary to enable acts to be undertaken in accordance with" the Software Directive's Articles 5(3) and 6
  (recital 50).
  A recital is an aid to interpretation (from memory), and no ruling read applies this sentence to a game.
- Private copying does not reach programs.
  The private copying exception is optional, and Member States need not make rightholders lift measures for it
  (Directive 2001/29/EC, Articles 5(2)(b) and 6(4)).
  A program has only the back-up copy, which "may not be prevented by contract in so far as it is necessary"
  (Directive 2009/24/EC, Article 5(2)).
  The Court reads this strictly: the copy "may be made
  and used only to meet the sole needs of the person having the right to use that program"
  ([Ranks and Vasiļevičs](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62015CJ0166), paragraph 43).

#### The United Kingdom

- The United Kingdom's program provision reaches publication.
  It applies to a person who, "knowing or having reason to believe that it will be used to make infringing copies",
  deals in a sole-purpose means or "publishes information intended to enable or assist persons to remove
  or circumvent the technical device"
  ([Copyright, Designs and Patents Act 1988, section 296](https://www.legislation.gov.uk/ukpga/1988/48/section/296)).
- For works other than programs, United Kingdom law makes the act a civil wrong where the person acts "knowing,
  or with reasonable grounds to know", and gives rights against dealers on the three European tests
  ([sections 296ZA](https://www.legislation.gov.uk/ukpga/1988/48/section/296ZA) and
  [296ZD](https://www.legislation.gov.uk/ukpga/1988/48/section/296ZD)).
  Dealing is a crime mainly "in the course of a business",
  or otherwise "to such an extent as to affect prejudicially the copyright owner"
  ([section 296ZB](https://www.legislation.gov.uk/ukpga/1988/48/section/296ZB)).
  The statutory answer to a measure that blocks a permitted act is a complaint to the Secretary of State
  ([section 296ZE](https://www.legislation.gov.uk/ukpga/1988/48/section/296ZE)).
- English courts have applied these sections to modchips and game copiers, not to emulators.
  Section 296ZD "creates a tort of strict liability", and "What counts is that there is copy protection,
  not where it is" ([Sony v Ball](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2004/1738)).
  A back-up was no answer in that case,
  under the program back-up rule of [section 50A](https://www.legislation.gov.uk/ukpga/1988/48/section/50A):
  "Since there is no necessity to make a back up, there is no justification for having one."
- Lawful uses such as home-made games did not help a seller:
  "The mere fact that the device can be used for a non-infringing purpose is not a defence,
  provided one of the conditions in section 296 ZD(1)(b) (considered below) is satisfied"
  ([Nintendo v Playables](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1932),
  a summary judgment application that the defendants, who did not appear, no longer resisted).
- Playing a copied game in England makes substantial copies of the drawings shown on screen,
  which are copyright works in their own right;
  the court did not need to decide whether the data passing through memory are a substantial part of the game as a whole
  ([R v Gilham](https://caselaw.nationalarchives.gov.uk/ewca/crim/2009/2293), upholding a modchip dealer's conviction).
  An earlier appeal had quashed such convictions because the prosecution had not proved copying
  ([R v Higgs](https://caselaw.nationalarchives.gov.uk/ewca/crim/2008/1324)).
- A website-blocking order has been granted on the anti-circumvention sections.
  The target was a dongle and custom firmware for the Switch,
  and the judge found the measures proportionate under PC Box
  because the devices "are used primarily to play pirated games" and Nintendo offers a developer programme
  ([Nintendo v Sky](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2019/2376), 2019,
  decided on the claimant's evidence).
- No private copying exception is in force in the United Kingdom.
  The 2014 regulations were quashed "in their entirety" in 2015, and as enacted they excluded computer programs
  ([BASCA v Secretary of State](https://caselaw.nationalarchives.gov.uk/ewhc/admin/2015/2041);
  [legislation.gov.uk note to section 28B](https://www.legislation.gov.uk/ukpga/1988/48/section/28B)).

#### Germany

- Germany forbids circumventing effective measures "without the rightholder's consent",
  and dealing in devices on the three tests (UrhG section 95a,
  [English translation on the federal law portal](https://www.gesetze-im-internet.de/englisch_urhg/englisch_urhg.html),
  which [says its translations are not binding](https://www.gesetze-im-internet.de/Teilliste_translations.html)).
- The criminal penalty for circumventing does not apply to an act "committed exclusively
  for the personal private use of the offender or of persons personally associated with the offender" (section 108b(1)).
  Dealing in devices for commercial purposes stays a crime
  (section 108b(2)), and other dealing outside one's personal circle is a regulatory offence with a fine (section 111a).
  The civil prohibition has no private-use words (inference).
- Section 95a no longer stands excluded from computer programs by the text.
  Section 69a(5) excluded sections 95a to 95d from programs between 1 March 2017 and 6 June 2021,
  and the text in force since 7 June 2021 no longer lists them
  ([buzer.de record of section 69a's versions](https://www.buzer.de/69a_UrhG.htm);
  [current section 69a](https://www.gesetze-im-internet.de/urhg/__69a.html)).
- The government's reasoning says the exclusion was struck out because of Article 7(2), second sentence,
  of the Digital Single Market Directive,
  and that the relation between technological measures and programs follows in future from section 69f
  ([Drucksache 19/27426](https://dserver.bundestag.de/btd/19/274/1927426.pdf), 9 March 2021, page 107;
  the note's own translation).
  [Section 69f(2)](https://www.gesetze-im-internet.de/urhg/__69f.html) reaches only means intended solely to make easier
  the unauthorised removal or circumvention of technical program protection (the note's own translation).
- So the stated intent keeps programs under section 69f's sole-purpose test, while games,
  which the Federal Court of Justice treats as works with parts that are not programs,
  stay under [section 95a](https://www.gesetze-im-internet.de/urhg/__95a.html)
  (inference from the reasoning and I ZR 124/11).
  No ruling on a pure program under section 95a after 2021 was found.
- The Federal Court of Justice applied section 95a to games with a proportionality condition.
  Measures are protected only if their use is proportionate and does not unduly limit lawful uses
  ([I ZR 124/11](https://rws-verlag.de/fileadmin/zbb-volltexte-3/i_zr_124-11a.pdf), 2014, headnote).
  In guidance for the remand it said that the rightholder in principle bears the burden of showing
  that no other measure would interfere less with lawful acts while giving comparable protection,
  although the other side must first put forward such a measure (paragraph 107, paraphrased from the German).
- On that remand the Munich Higher Regional Court largely dismissed the defendants' appeal
  ([I ZR 273/14](https://www.rechtsprechung-im-internet.de/jportal/?quelle=jlink&docid=KORE300792017&psml=bsjrsprod.psml&max=true),
  paragraph 10, the note's own translation).
  A law firm's announcement reports that this decision was final, the court having allowed no further appeal
  ([LTO, 20 October 2016](https://www.lto.de/recht/kanzleien-unternehmen/k/king-wood-mallesons-nintendo-kopierschutz-gewerblicher-rechtsschutz);
  secondary).
- The 2017 judgment, I ZR 273/14 of 2 March 2017,
  concerns the parallel claims for damages and under a European Union trade mark.
  It set aside the Munich judgment of 13 February 2014 and sent the case back for a new hearing,
  because the appeal court had made no sufficient findings on whether the measures were proportionate
  (operative part, and paragraph 17; full text from a [private mirror](https://gesetze.co/urteile/I_ZR_273-14) whose
  headnote and dates match the federal portal's record).
  The outcome after that remand was not found (web search; the federal portal and the court's own site were tried).

#### France

- France's 2006 law protected measures on works other than software and said measures must not prevent interoperability,
  in the [text adopted by Parliament](https://www.assemblee-nationale.fr/12/ta/ta0596.asp).
  The Constitutional Council struck the interoperability exemption out of the criminal provisions,
  because the legislature had not defined the term
  ([decision 2006-540 DC](https://www.conseil-constitutionnel.fr/decision/2006/2006540DC.htm), paragraphs 60 and 61).
- The code in force keeps that shape (Code de la propriété intellectuelle, edition of 18 November 2026, read in an
  [unofficial compilation](https://codes.droit.org/PDF/Code%20de%20la%20propri%C3%A9t%C3%A9%20intellectuelle.pdf) of
  Légifrance's open data, because Légifrance refused automated requests).
  Article L. 331-5, as amended by law 2021-1382, protects effective measures on "une oeuvre, autre qu'un logiciel",
  and still says measures must not prevent the effective use of interoperability, within respect for copyright.
- Article L. 335-3-1 fines circumventing for purposes other than research €3,750,
  and punishes supplying the means with six months' imprisonment and €30,000.
  Its part III exempts acts done for computer security, and it names no interoperability exemption,
  consistent with decision 2006-540 DC.
- For software, article L.
  122-6-2 requires any advertisement or instructions for a means of removing a software protection to state
  that unlawful use is punishable as infringement.

#### Japan

- Japan regulates tools as unfair competition.
  It covers transferring or providing online a device, program,
  or code "with a function that interferes with the effectiveness of technological restriction measures",
  and providing a service that does so.
  For a program that has other functions too, it is limited to provision made to enable the restricted use
  ([Unfair Competition Prevention Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4709), Article 2(1)(xvii),
  unofficial translation).
  Testing or research on technological restriction measures is exempt,
  and the crime needs "the purpose of wrongful gain" or of causing damage (Articles 19(1)(x) and 21(3)(iv)).
- A 2018 amendment added services and codes.
  The ministry's overview notes that the "Act of interfering with TRM is not considered to be unfair competition,
  but it would be against another law"
  ([METI overview](https://www.meti.go.jp/english/policy/economy/chizai/chiteki/pdf/english_2018rev.pdf), slide 10).
- An industry association reports an arrest and referrals to prosecutors in 2019,
  and the referral of a company and three of its people in 2020, for offering save-data modification services and tools
  (ACCS announcements of [2019](https://www2.accsjp.or.jp/activities/2019/news114.php) and
  [2020](https://www2.accsjp.or.jp/activities/2020/news120.php); they report no convictions).
- Japan's Copyright Act deems circumvention of an access-type measure to be infringement,
  unless it is done within a scope justified for research or technological development,
  "or otherwise does not harm the interests of the copyright owner"
  ([Copyright Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4207), Article 113(6),
  unofficial translation of the text as amended to 2021).
  The general criminal penalty excludes that deemed infringement (Article 119(1)).
  Dealing in circumvention programs, and circumventing "in the course of trade ... at the request of the public",
  are crimes (Article 120-2).
- Private copying is lost where "the reproduction of the work has become possible due to the circumvention of
  technological protection measures" and the user copies "in knowledge of this fact" (Copyright Act, Article 30(1)(ii),
  same translation).
  That item refers to the copy-control measures of Article 2(1)(xx), which "prevent or deter" infringing acts,
  and does not name the access-type measures of item (xxi).
- So a console protection takes a dump outside Article 30 where it is an item (xx) measure and the user knows;
  by the text, a pure access control does not (inference from the definitions).
  No source read says which item a given console's encryption falls under.
- Nintendo's own account of its Japanese litigation is that injunctions
  and damages of 95,625,000 yen against sellers of Nintendo DS copier devices became final in January 2016
  ([Nintendo press release](https://www.nintendo.co.jp/corporate/release/2016/160119.html);
  the judgments were not fetched).
- A Nintendo intellectual property manager is reported to have said in January 2025 that an emulator is not unlawful
  as such but can become so in three cases: where it copies the console's programs,
  where it has a function that disables a game's security such as encryption, and where it links to pirate sites.
  He is reported to have added that Switch emulators had the second feature
  ([Famitsu](https://www.famitsu.com/article/202501/30093) and
  [Denfaminicogamer](https://news.denfaminicogamer.jp/kikakuthetower/250112a), secondary; remarks at an industry
  seminar, translated here, not a ruling or a company policy).
- Reported Japanese prosecutions over modified consoles in 2025 and 2026 used the Trademark Act
  ([Anime News Network](https://www.animenewsnetwork.com/news/2025-04-16/japanese-man-sentenced-for-illegally-modifying-2nd-hand-nintendo-switch-units/.223571);
  [Automaton](https://automaton-media.com/en/news/four-men-referred-to-prosecution-for-selling-modified-nintendo-switch-consoles-in-japan/);
  secondary).

#### Canada

- Canada forbids circumventing an access control and dealing in circumvention technology,
  with a criminal offence for acts done "knowingly and for commercial purposes"
  ([Copyright Act](https://laws-lois.justice.gc.ca/eng/acts/C-42/FullText.html), sections 41.1 and 42(3.1)).
  A rightholder cannot elect statutory damages against an individual who circumvented "only for his
  or her own private purposes" (section 41.1(3)).
- Canada's interoperability exception was widened in 2024.
  The act is exempt where done to make "the program or a device in
  which it is embedded interoperable with any other computer program, device or component".
  The exception is lost if the person "does an act that constitutes an infringement of copyright"
  (section 41.12(1) and (7)).
  The exceptions for services and for tools still speak only of making "the computer program
  and any other computer program interoperable" (section 41.12(2) and (3)).
- No decision on the new wording was found.
  A search of the decisions databases of the [Federal Court](https://decisions.fct-cf.gc.ca/fc-cf/en/nav.do)
  and the [Federal Court of Appeal](https://decisions.fca-caf.gc.ca/fca-caf/en/nav.do)
  for "41.12" from 1 November 2024 found none on point; its only hits were King and two unrelated cases.
  Provincial courts were not searched, because CanLII refused automated requests (research log).
- In the only decision found that tested the interoperability defence, it failed on the evidence.
  In [Nintendo v King](https://decisions.fct-cf.gc.ca/fc-cf/decisions/en/item/223922/index.do) the court held
  that "'homebrew' is not a recognized exception under the Act",
  that the seller of game copiers and modchips bore the burden, and that it "adduced no evidence".
  The reasons adopt the applicant's written argument, which the court called "effectively uncontested".
- King assessed damages by the works unlocked, without proof of copying:
  "$11,700,000 for TPM circumvention in respect of its 585 Nintendo Games", "$60,000
  for copyright infringement in respect of the three Header Data works", found infringed by sale under section 27(2),
  and $1,000,000 in punitive damages (Canadian dollars).
- Canada's private and back-up copying exceptions each require
  that the person "did not circumvent ... a technological protection measure" (sections 29.22 and 29.24).

#### Australia and South Korea

- Australia's current definitions name software and exclude two things.
  A circumvention device includes "a computer program".
  An access control does not include a measure to the extent that it "controls geographic market segmentation", or,
  for a program embodied in a device, "restricts the use of goods
  (other than the work)
  or services in relation to the machine or device"
  ([Copyright Act 1968](https://www.legislation.gov.au/C1968A00063/latest/text), section 10(1)).
- Australia has an interoperability exception to both the act and the tool rules.
  It applies to a lawfully obtained program, to elements "not ... readily available",
  and to acts "for the sole purpose of achieving interoperability of an independently created computer program"
  (sections 116AN(3) and 116AO(3)).
  The offences need "the intention of obtaining a commercial advantage or profit" (sections 132APC and 132APD).
- Section 116AN has other exceptions too (compilation 65, 2 April 2026): permission
  (subsection (2)),
  encryption research (4), security testing "with the permission of the owner of the computer" (5), online privacy (6),
  and acts "prescribed by the regulations" that do not infringe (9).
- [Copyright Regulations 2017](https://www.legislation.gov.au/F2017L01649/latest/text), regulation 40,
  prescribes among others reproducing programs under section 47D "to make interoperable products",
  access where the measure "is not operating normally" and "a replacement ... is not reasonably available" (40(2)(c)),
  and repair (40(2)(d)).
  Two of the prescribed classes exclude "a computer game" in terms (40(2)(b) and (e)).
  Regulation 40 serves sections 116AN(9) and 132APC(9), the act and its offence, not the device rules.
- Whether regulation 40(2)(c) reaches a console whose online check no longer runs is not decided by any source read
  (inference).
  No decision applying these sections was found;
  [Stevens v Sony](https://www.wipo.int/wipolex/en/text/580968) construed wording since replaced.
- South Korea forbids circumvention "by intention or negligence without legitimate authority", with eight exceptions,
  among them decompiling by a lawful user "to the extent necessary to secure compatibility with other programs"
  ([Copyright Act](https://elaw.klri.re.kr/eng_service/lawViewContent.do?hseq=62935), Article 104-2(1),
  unofficial translation of the text as amended to May 2023; statute only).

#### Across these jurisdictions

- Where these laws limit liability for personal use, they remove a penalty, not the prohibition:
  Germany removes the crime and Canada the statutory damages.
  Australia's offences require commercial intent,
  and Japan's general criminal penalty excludes circumvention whatever its purpose,
  while circumventing as a trade for others is a separate crime (inference from the provisions above).
- Three of the reported rulings were one-sided: Playables and Sky were unopposed,
  and King rested on the applicant's evidence.
  The 2014 German judgment ended, on remand, in a largely dismissed appeal.
  None of the rulings concerned free software (inference from the judgments' own descriptions).

### Firmware, keys, and game copies

No firmware, key, or game was obtained for this section, and no replacement BIOS or boot ROM code was opened.

#### Firmware and back-up copies

- Firmware is protected by copyright.
  "A computer program in object code embedded in a ROM chip is an appropriate subject of copyright"
  ([Apple v Franklin](https://law.resource.org/pub/us/case/reporter/F2/714/714.F2d.1240.82-1582.html),
  Third Circuit 1983, on a preliminary injunction).
  [Connectix](https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html) records
  that "Sony has a copyright on the BIOS".
- Connectix is a case about a replacement.
  "Connectix had its own BIOS", and the copies at issue were made during development.
  It does not decide whether a user may copy a BIOS out of a console,
  or whether an emulator may be distributed that needs one
  (inference from the opinion; no decision on either point was found).
- The Copyright Office's public guidance on back-ups rests on ownership.
  Under § 117 a copy may be made "for archival
  (i.e., backup)
  purposes only" by "the legal owner of the copy",
  and licence terms "might affect your ability or right under section 117 to make a backup copy".
  The answer to whether one may "buy and use a backup copy of software I already own" begins "No"
  ([Copyright Office, "Copyright and Digital Files"](https://www.copyright.gov/help/faq/faq-digital.html); guidance,
  not a ruling, and it does not mention games).
- The one decision found that construes the archival exception for a cartridge went against the copier.
  On a preliminary injunction against the seller of a cartridge copying device, a district court read the exception,
  following the CONTU Report, as applying "Where, and only where,
  a medium may be destroyed by mechanical or electrical failure", and found that the seller, who bore the burden,
  had not shown a ROM cartridge to be one ([Atari v JS&A](https://static.case.law/f-supp/597/cases/0005-01.json), 1983).
  It was a likelihood-of-success finding, concerns a seller and not an owner,
  and has no appellate sequel that was found.
  [Sega v MAPHIA](https://static.case.law/f-supp/948/cases/0923-01.json) (1996) later rejected a back-up use
  for a copier because Sega's cartridges "are not susceptible to breakdown".

#### Makers' system software and licence terms

- Sony publishes system software update files for the PlayStation 3, 4, 5, and Vita on its support site
  ([PlayStation 5 system software page](https://www.playstation.com/en-us/support/hardware/ps5/system-software/)).
  The pages were read and no file was downloaded.
- The licences limit use to the console: Sony grants "a non-exclusive,
  non-commercial right to use System Software solely on your PS5 system", and the user "may not reverse engineer,
  decompile or disassemble System Software" ([PS5 licence](https://www.playstation.com/en-us/legal/ps5-ssla/)).
  The [PlayStation 4](https://doc.dl.playstation.net/doc/ps4-eula/ps4_eula_en.html)
  and [Vita](https://doc.dl.playstation.net/doc/psvita-eula/psvita_eula_en.html) licences use the same grant
  for their systems.
  The [PlayStation 3 agreement](https://doc.dl.playstation.net/doc/ps3-eula/ps3_eula_en.html) also says
  that Sony "does not grant any license to System Software obtained by users in any manner other than through SIE's
  authorized distribution methods".
- Microsoft publishes an offline system update file for Xbox consoles.
  Its [error E101 page](https://support.xbox.com/en-US/help/errors/error-code-e101) says "You need to perform an offline
  system update" and directs the user to "Download the XBOX OSU1 file", to be applied from a USB drive.
  The download itself was not opened, and its address is not given here
  (read with a browser, because the page renders by script).
- The
  [Xbox Software License Terms](https://support.xbox.com/en-US/help/hardware-network/warranty-service/xbox-software-license-agreement),
  for "an XBOX One, XBOX 360 or original XBOX console", say: "The XBOX Software is licensed to You, not sold.
  You are licensed to use the XBOX Software only as pre-installed in Your XBOX Console or Authorized Accessory,
  and updated by Microsoft from time to time.
  You may not copy or reverse engineer the XBOX Software."
  They do not use the word "emulate", and they name no Series console (search of the page, read with a browser).
- So Xbox follows Sony's model: a published update file, under a licence that ties its use to the console (inference).
  No licence read permits use of a published firmware file off the console.
- No Nintendo page offering console firmware as a file was found.
  The [Switch 2 agreement](https://en-americas-support.nintendo.com/app/answers/detail/a_id/68586) forbids the user to
  "publish, copy, modify, reverse engineer" any portion of the Software, and to "obtain or install any version of the
  Software other than through distribution methods provided by Nintendo".
- PPSSPP can optionally use real firmware: it installs the update that "almost every game disc carries",
  or one "from an official PSP update file" ([PPSSPP FAQ](https://www.ppsspp.org/docs/faq/)).
- Sony's game licence forbids emulation in terms,
  and Microsoft's services agreement does so for software it provides as part of its services.
  PlayStation's [Software Usage Terms](https://www.playstation.com/en-us/legal/software-eula/) say the software "is
  licensed to you, not sold", for use "on the system or device it was intended for", and that the user agrees not to
  "emulate the Software" or to "use any means to bypass or disable any encryption, security, or authentication
  mechanism".
- The [Microsoft Services Agreement](https://www.microsoft.com/en-us/servicesagreement) bars a user to "disassemble,
  decompile, decrypt, hack, emulate, exploit, or reverse engineer",
  "except and only to the extent that the applicable copyright law expressly permits doing so".
  Applications bought in Microsoft's stores, including on Xbox,
  fall under separate standard terms unless the application has its own,
  and those terms bar reverse engineering but do not use the word "emulate".
- The Nintendo Account User Agreement changed in 2025.
  The [agreement dated May 2025](https://accounts.nintendo.com/term/eula/US?lang=en-US) says that
  if the user breaks its restrictions "Nintendo may render the Nintendo Account Services and/or the applicable Nintendo
  device permanently unusable in whole or in part".
  An
  [archived copy dated April 2021](https://web.archive.org/web/20250303232702/https://accounts.nintendo.com/term/eula/US?lang=en-US)
  has no such sentence.
- The Switch 2 agreement, dated October 2026,
  bars using software "from which one or more unauthorized copies have been made",
  which on its words reaches a purchased game after its owner has dumped it (inference).
- These terms matter in two ways (inference, building on R0-01's findings on Bowers and Davidson, in
  [R0-01, "Reverse engineering and the legal status of a clean room"](R0-01-clean-room-policy.md#reverse-engineering-and-the-legal-status-of-a-clean-room)).
  A person who accepted them may face a contract claim in the United States for an act that copyright would allow.
  "Licensed, not sold" wording is also the route by which a maker can argue that a user is not an owner under § 117.
  No decision enforcing any of these agreements against a person for dumping or emulating was found.

#### Makers' statements on emulators

- Nintendo's published wording has changed, and its pleaded position is broader than its current page
  (inference from comparing them).
- Its former legal page,
  [archived in 2017](https://web.archive.org/web/20170101225939/http://www.nintendo.com/corp/legal.jsp), said "it is
  illegal to download and play a Nintendo ROM from the Internet" whether or not the user owns the game, and said that
  "emulators created to play illegally copied Nintendo software" were "the greatest threat to date to the intellectual
  property rights of video game developers".
  That page is no longer served.
- The current page, Nintendo's
  ["Intellectual Property & Piracy FAQ"](https://en-americas-support.nintendo.com/app/answers/detail/a_id/55888), says
  that "some unauthorized emulators also circumvent the security measures in the games and are therefore unlawful pieces
  of software", and says nothing about back-up copies, though it still lists "emulators" among the "illegal activities"
  it asks people to report.
- In the [yuzu complaint](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf)
  Nintendo pleaded that obtaining keys from one's own console and dumping one's own games "are themselves unlawful".
- No official Sony or Sega statement on emulators as such was found.

#### Keys

- No court decision was found on whether a cryptographic key is a copyrightable work.
  The claims found against publishing keys rest mainly on anti-circumvention law; where copyright is pleaded,
  it is induced infringement or infringement of the firmware, and no claim of copyright in a key itself was found.
- The Electronic Frontier Foundation wrote of the 2007 disc key that the licensing body "is not claiming
  that the key is copyrightable, but rather that it is (or is a component of) a circumvention technology"
  (commentary; its legal primer, whose address stays unlinked in Sources because the page discusses a published key).
- Sony's 2011 complaint over PlayStation 3 keys pleaded anti-circumvention, computer misuse,
  induced copyright infringement, contract, and tort claims, by the consent judgment's own recital.
  As to Hotz it ended in that [consent judgment](https://www.eff.org/files/geohotz-finaljudgmentpi.pdf),
  which records that "Hotz denies these allegations"
  (only the [caption](https://archive.org/download/gov.uscourts.cand.235965/gov.uscourts.cand.235965.1.0.pdf) and
  judgment were read).
- Nintendo's 2023 notices to GitHub attack key files and a key-dumping tool as trafficking,
  and for key files add that distributing them "constitutes copyright infringement of Nintendo Switch firmware itself"
  ([GitHub DMCA archive](https://github.com/github/dmca)).
  That is a rights holder's assertion in a notice.
- The
  [Keighin default ruling](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.36.0.pdf)
  treats keys as trafficked technology under one subsection and not the other.
  Unauthorised copies of the keys "have no commercial purpose outside of enabling unauthorized decryption",
  but "the cryptographic keys themselves do not do anything to prevent a user from replicating a game",
  so posting them "did not violate Section 1201(b)(1)".
- Dolphin's own account of 2023 is that Nintendo's letter to Valve cited the anti-circumvention sections,
  and said the emulator works "by incorporating these cryptographic keys without Nintendo's authorization"
  ([Dolphin blog, archived copy](https://web.archive.org/web/20241221001744/https://dolphin-emu.org/blog/2023/07/20/what-happened-to-dolphin-on-steam/)).
- Dolphin wrote that "Nintendo has not taken any legal action against Dolphin Emulator or Valve",
  that a short random key "is not copyrightable under current US copyright law",
  that removing the key "would not change whether the exemption in 17 U.S.C. § 1201(f) applies",
  and that "Unless a court rules that our understanding of the law is incorrect,
  we have every reason to believe that our decryption of Wii game discs is covered by this exemption"
  (same post; a project's view, untested).
- Azahar, a 3DS emulator, accepts only decrypted content, by its own release notes.
  [Release 2120](https://github.com/azahar-emu/azahar/releases/tag/2120)
  (21 March 2025) says: "Support for encrypted applications has been dropped.
  Applications must now be dumped in a decrypted format to be used."
  [Release 2124.3](https://github.com/azahar-emu/azahar/releases/tag/2124.3)
  (29 January 2026)
  says "support for encrypted ROMs is still disabled",
  because "encrypted ROMs still present actual legal challenges that we do not want to take on".

#### How projects handle firmware and games

- Emulator projects handle firmware in four ways, by their own documentation.
  DuckStation is closed tier under [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md),
  so only its README's prose was read, and its repository is not linked.

| Approach | Project's words | Project |
|---|---|---|
| User dumps firmware | "must therefore be dumped from your own console" | [PCSX2](https://pcsx2.net/docs/setup/bios/) |
| User dumps firmware | "not provided with the emulator for legal reasons" | DuckStation |
| Replacement built in | "A built-in BIOS implementation, and ability to load external BIOS files" | [mGBA](https://github.com/mgba-emu/mgba) |
| Replacement built in | "bundles open source replacement BIOS/stubs" | [SkyEmu](https://github.com/skylersaleh/SkyEmu) |
| Replacement built in | "Includes open source DMG and CGB boot ROMs" | [SameBoy](https://github.com/LIJI32/SameBoy) |
| High-level emulation | "simulates the BIOS and the entire internal operating system" | [PPSSPP](https://www.ppsspp.org/docs/faq/) |
| Maker's download | "can be downloaded from the official PlayStation website" | [Vita3K](https://vita3k.org/quickstart.html) |

- Vita3K's page adds that a second package, of system fonts, must be found by the user: "we couldn't get the URL for it,
  so you will have to find it yourself".
- The projects that speak about games tell users to dump their own.
  [Dolphin's FAQ](https://dolphin-emu.org/docs/faq/) says "Downloading commercial games is illegal
  and thus strongly frowned upon by the Dolphin developers", and "To prevent legal issues,
  this includes gray areas like downloading games which you purchased earlier".
- Some projects publish dumping guides that name or link tools.
  [PCSX2's BIOS guide](https://pcsx2.net/docs/setup/bios/) recommends softmods such as "FreeMcBoot or FreeDVDBoot"
  and links a dumping program, and Dolphin's FAQ says to "install the homebrew channel
  and run an application like CleanRip".
- Replacements cost accuracy, by one project's account.
  [SkyEmu](https://github.com/skylersaleh/SkyEmu) says its replacements "lack many of the features of the native
  firmware/BIOS (such as colorizing GB games and the startup splashes) and are not as accurate".
  PCSX2 says that for the PlayStation 2 BIOS "no open-source alternative exists".

#### Boot logos

- The boot-time logo is a separate question.
  [Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html) held
  that "when there is no other method of access to the computer that is known
  or readily available to rival cartridge manufacturers,
  the use of the initialization code by a rival does not violate the Act even though
  that use triggers a misleading trademark display".
  That holding concerns a game maker whose cartridge triggered a message drawn by Sega's own console.
  An emulator or replacement boot ROM
  that itself draws a maker's logo is a different actor doing a different thing (inference);
  no decision on it was found.
- [Pan Docs](https://gbdev.io/pandocs/Power_Up_Sequence.html) says the Game Boy logo check "was meant to deter piracy
  using trademark law", and that after Sega v Accolade "there is no danger for homebrew developers".
  The page calls itself advisory and not legal advice, and it restates the holding's condition loosely,
  as use that "is necessary for running programs on the console" (inference).
- A replacement boot ROM for the Game Boy needs no copy of the logo to run unmodified games.
  The logo bitmap sits in each cartridge's header at `0x0104` to `0x0133`, and "It must match ...,
  otherwise the boot ROM won't allow the game to run"
  ([Pan Docs, "The Cartridge Header"](https://gbdev.io/pandocs/The_Cartridge_Header.html)).
  The comparison is the boot ROM's own gate, so a replacement that makes no comparison needs no copy
  (inference from that description).
  The header layout is a cartridge fact; the details of the boot sequence, which come from boot ROM analysis,
  are not recorded here.
- The only project statement found on how a replacement boot ROM treats the logo is SameBoy's,
  whose boot ROMs have "Support for games with a non-Nintendo logo in the header"
  ([SameBoy](https://github.com/LIJI32/SameBoy)); none was found that says whether a replacement embeds or draws a
  maker's logo.
- Two courts outside the United States, on applications that were unopposed or effectively uncontested,
  have treated header and logo data files as copyright works.
  [King](https://decisions.fct-cf.gc.ca/fc-cf/decisions/en/item/223922/index.do) declared copyright infringed in three
  registered works, one named "GAME BOY ADVANCE BOOT CODE WITH NINTENDO LOGO DATA FILE".
  [Playables](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1932) called copier devices holding the logo data
  file "templates for infringement", while refusing summary judgment on the console's own boot code, and on a logo as an
  artistic work, which it found "so rudimentary" that subsistence of copyright was arguable.

### Takedown and enforcement history

The main primary source is the archive of notices that GitHub publishes
([GitHub DMCA archive](https://github.com/github/dmca)).
A notice is its sender's allegation.
GitHub says that posting one "only means that we received the notice on the indicated date",
and not "that the content was unlawful or wrong".
No repository named in a notice was opened, and none is linked here.

| Date | Who and what | Mechanism | Stated theory or outcome | Source |
|---|---|---|---|---|
| 2011-01 | Sony against PlayStation 3 custom firmware | Notice; suit | Trafficking; consent judgment | GitHub; Hotz |
| 2014-05 | Nintendo against the GBA4iOS download site | § 512 notice | Access to game copies | GitHub |
| 2016-12 | Nintendo against freeShop, a 3DS shop downloader | Notice | Circumvention; logo data | GitHub |
| 2018-08 | EmuParadise removes its game downloads | Voluntary | Cites suits against others | Press |
| 2018-11 | Nintendo against LoveROMs | Consent judgment | $12,230,000 in the lodged form | Filed forms |
| 2021-08 | Nintendo against RomUniverse | Contested judgment | $2,115,000; ROMs and site marks | Court |
| 2022-07 | Nintendo against signature patches for the Switch | § 1201 notice | Bypasses signature checks | GitHub |
| 2023-05 | Nintendo against key files and Lockpick | § 1201 notices | Trafficking; key extraction | GitHub |
| 2023-05 | Skyline halts development | Voluntary | Cites the Lockpick notice (secondary) | Press |
| 2023-05 | Dolphin's Steam release blocked | Letter to Valve | § 1201; no notice, no suit | Dolphin |
| 2024-03 | Nintendo against yuzu's company | Consent judgment | $2,400,000; agreed findings | Court |
| 2024-03 | Pizza Boy emulators leave Google Play | Voluntary | No notice reported (secondary) | Press |
| 2024-04 | Nintendo against yuzu copies | § 1201 notice | 8,535 repositories disabled | GitHub |
| 2024-04 | Apple removes iGBA | Store rules | Copy of another app (secondary) | Press |
| 2024-05 | Adobe against Delta's icon | Trade mark | Icon changed (secondary) | Press |
| 2024-10 | Ryujinx removed by its creator | Private contact | Terms not public (secondary) | Press |
| 2025-02 | Nintendo against Ryujinx copies | § 1201 notices | 4,238 repositories in one notice | GitHub |
| 2025-05 | Nintendo against LibHac, a file-format library | § 1201 notice | Cites the yuzu judgment | GitHub |
| 2025-09 | Nintendo against a modchip seller, Daly | Consent judgment | $2,000,000 | News-site copy |
| 2025-10 | Nintendo against a streamer, Keighin | Default judgment | $17,500; links to emulators | Court |
| 2026-02 | Nintendo against thirteen named Switch emulators | § 1201 notice | Cites yuzu and Keighin | GitHub |
| 2026-09 | Nintendo against a shop operator, Williams | Default judgment | $4,500,000 | Court |
| 2026-10 | Nintendo against a game decompilation | § 512 notice | Derivative copies of code | GitHub |
| 2026-11 | Nintendo against Switch modchip firmware | § 1201 notice | 144 repositories | GitHub |

The press and court sources of the table rows are listed in Sources:
[TorrentFreak on EmuParadise](https://torrentfreak.com/nintendo-rom-fallout-emuparadise-terminates-all-game-downloads-180809/),
the [LoveROMs judgment form](https://torrentfreak.com/images/romsjudg.pdf),
[Nintendo Life on Skyline](https://www.nintendolife.com/news/2023/05/switch-android-emulator-skyline-halts-development-due-to-potential-legal-risks),
[Android Authority on Pizza Boy](https://www.androidauthority.com/emulators-for-android-shut-down-pulled-play-store-3424602/),
and TechCrunch on
[iGBA](https://techcrunch.com/2024/04/15/apple-pulls-a-game-boy-emulator-for-app-store-violations-but-says-game-emulators-are-allowed)
and [Delta](https://techcrunch.com/2024/05/17/adobe-comes-after-indie-game-emulator-delta-for-copying-its-logo).

#### What the notices allege

- Nintendo's GitHub notices before 2022 do not plead anti-circumvention against an emulator.
  The 2014 notice targeted the download site of the GBA4iOS emulator on the ground that it gave access to game copies.
  The others read from 2014 to 2020 concern game content, fan games, and recreations,
  one in 2016 pleads circumvention against a shop downloader,
  and of two in 2019 whose authenticity the recipients disputed,
  one alleges unauthorised documentation and "illegal emulation software" of an online service
  (inference from the files read).
- The emulator notices plead decryption, not copying.
  The April 2024 notice says that yuzu "necessarily uses unauthorized copies of these cryptographic keys to decrypt
  unauthorized copies of Nintendo Switch games, or ROMs, at or immediately before runtime".
  No notice read alleges that an emulator's source code copies Nintendo's code, or that yuzu shipped keys.
- Uncontested judgments are now cited as findings.
  From February 2025 the notices cite the yuzu consent judgment as "finding that the distribution of software
  which primarily decrypts Nintendo Switch games without authorization violated DMCA anti-trafficking provisions".
- From February 2026 they add Keighin, a default judgment.
  The [notice of 12 February 2026](https://github.com/github/dmca/blob/master/2026/02/2026-02-12-nintendo.md) cites
  Keighin's "ECF Nos.
  36, 37, 40" for that finding.
  Document 40 is not in the public court archive (see "Open questions").
- The notices of 2026 widen the target.
  They use the words "offer, link to, or otherwise provide access to".
  By their names, the repositories include release and build repositories, project websites, a packaging manifest,
  guides, and compatibility lists (inference from names; none was opened).
  Nintendo notices rose from 8 files in 2023 to 28 in 2024 and 32 in 2026 to date (count of file names).
- A library and a dormant project were both reached.
  LibHac was described as "primarily designed to allow users to access and/or play Nintendo Switch games".
  Skyline's repository was disabled in August 2026, three years after its developers stopped work.
- One notice can disable every fork.
  For a network of more than 100 repositories,
  GitHub acts on the sender's statement that "all or most of the forks are infringing to the same extent
  as the parent repository" (GitHub DMCA archive, README).
- A decompilation has now been named as infringing.
  The October 2026 notice alleges "unauthorized derivative, or decompiled, copies of the video game (i) code,
  and (ii) audiovisual assets", citing Micro Star.
  No notice was found against the long-running Nintendo 64 or Pokémon decompilation repositories.
- Nintendo describes its development kit as secret.
  A February 2026 notice calls it "proprietary and confidential",
  "subject to a valid and enforceable License and Non-Disclosure Agreement".
  This bears on R0-01's findings on leaked material
  ([R0-01, "Trade secrets, contracts, and leaked material"](R0-01-clean-room-policy.md#trade-secrets-contracts-and-leaked-material)).

#### Who has been reached

- Every emulator named in a circumvention notice or letter emulates a console whose retail games are encrypted:
  the Switch, and the Wii and GameCube in the letter about Dolphin,
  which asserts that the game files of both are encrypted.
- A search of the archive for some thirty other emulators, including bsnes, MAME, PCSX2, PPSSPP, DuckStation, RPCS3,
  melonDS, and SameBoy, found no notice against any of them.
  A code search of the archive on 2026-11-20 for "azahar", "lime3ds", and "citra" found no notice naming Azahar
  (the hits were unrelated).
  That is a search of one host's archive.
- GitLab, Patreon, and Discord publish no comparable record that was found.
  Google shares some notices for its services with the Lumen database
  ([Google, "About Lumen"](https://support.google.com/legal/answer/12158374)),
  whose search refused automated requests (HTTP 403, 2026-11-19 and 2026-11-20; research log).
- No notice from Sony against a PlayStation emulator, or naming a console BIOS file, was found in the archive.
  No file mentions the Switch 2.
- The original projects mostly ended by other means than a notice. yuzu ended by consent judgment,
  Ryujinx by private contact, Skyline and EmuParadise by their own decision,
  and Dolphin's store release by its own decision after Valve required an agreement with Nintendo.
  The notices then removed copies and continuations (inference from the dated records).
- A store can act with no notice at all.
  Dolphin reports that Valve "told us that we had to come to an agreement with Nintendo"
  before it could release on Steam, and that it abandoned the release
  ([Dolphin blog, archived copy](https://web.archive.org/web/20241221001744/https://dolphin-emu.org/blog/2023/07/20/what-happened-to-dolphin-on-steam/)).

#### Counter-notices and wrongful notices

- The counter-notice route carries its own exposure.
  To keep its immunity, the host restores material "not less than 10, nor more than 14,
  business days" after a counter-notice, unless the sender first tells it that suit has been filed
  ([17 U.S.C. § 512(g)(1) and (2)(C)](https://www.law.cornell.edu/uscode/text/17/512)).
  The counter-notice must be sworn, must give the subscriber's "name, address, and telephone number",
  and must consent "to the jurisdiction of Federal District Court" (§ 512(g)(3)).
- In the one published sequence found that ran to its end,
  a counter-notice was filed in April 2021 and the sender then sued developers of the project (GitHub DMCA archive;
  [Take-Two v Papenhoff](https://storage.courtlistener.com/recap/gov.uscourts.cand.384429/gov.uscourts.cand.384429.47.0.pdf),
  recorded in
  [R0-01, "Policies of emulator and decompilation projects"](R0-01-clean-room-policy.md#policies-of-emulator-and-decompilation-projects)).
  Whether the person who filed the counter-notice was among those sued was not checked.
  No counter-notice naming yuzu, Ryujinx, their successors, Lockpick, or LibHac is in the archive.
- The remedy for a wrongful notice is narrow.
  Section 512(f) reaches a person who "knowingly materially misrepresents ... that material or activity is infringing".
  A rights holder must "consider fair use before sending a takedown notification",
  but a "subjective good faith belief" suffices
  ([Lenz v Universal](https://cdn.ca9.uscourts.gov/datastore/opinions/2016/03/17/13-16106.pdf)).
- One district court has held that § 512(f) does not reach a notice that alleges only circumvention,
  because such notices "do not identify any copyrighted works
  and accordingly are incapable of being misrepresentations under section 512"
  ([Yout v RIAA](https://storage.courtlistener.com/recap/gov.uscourts.ctd.141714/gov.uscourts.ctd.141714.61.0.pdf),
  District of Connecticut 2022, on a motion to dismiss).
- The appeal was still pending in March 2026
  ([appellees' letter of 31 March 2026](https://storage.courtlistener.com/recap/gov.uscourts.ca2.59200/gov.uscourts.ca2.59200.146.0.pdf)).
  No appellate ruling was found by 20 November 2026: the public court archive holds no appeal document after 146,
  and two web searches found reports of the pending appeal only.
  Whether the put-back applies to such a notice is not settled by any source read
  (inference from the statute's wording).
- GitHub says it reviews circumvention claims with "both technical and legal experts",
  and that where it cannot tell whether a claim is valid it "will err on the side of the developer"
  ([GitHub DMCA takedown policy](https://docs.github.com/en/site-policy/content-removal-policies/dmca-takedown-policy)).
  It does not publish its reasoning.
- Notices can be false.
  In 2019 recipients of two notices filed under Nintendo's name answered that the notices were fraudulent; of the first,
  they said it "was fraudulent" and that their documentation was "all our own work"
  (counter-notices of 10 September and 3 October 2019 in the GitHub DMCA archive; the recipients' allegations).

### Patents, recorded as risks

[R0-01](R0-01-clean-room-policy.md) records that a clean room does not answer a patent claim, the 20-year term,
and the role of knowledge in enhanced damages
([R0-01, "Copyright: what is protected and how copying is proved"](R0-01-clean-room-policy.md#copyright-what-is-protected-and-how-copying-is-proved)).

This note names patents that are shown as expired, and describes those shown as in force by subject only,
without numbers or claim text.
That limit is a choice made in writing this note, for the reason given in the knowledge finding below.
The recommendation that the project keep it is part of the proposed amendment of
[ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) ("Recommendation", below).

Patent status here is as shown by Google Patents on 2026-11-19,
which says its status "is an assumption and is not a legal conclusion".
For the three patents named, the status was checked again on 2026-11-20 against the term rule,
from the filing dates and adjustments on the Patent Office's front pages (calculated).
No Patent Office fee or maintenance record was read, so a lapse for unpaid fees could only shorten the terms given.
Statuses of patents not named here were not checked again.

#### Patents on emulation

- Console makers hold patents on emulation itself.
  Nintendo's US 6,672,963, "Software implementation of a handheld video game hardware platform",
  was filed on 28 November 2000 with no adjustment, so it expired by 28 November 2020
  (calculated from the [Patent Office copy](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6672963)).
- Later patents from the same original application, a division and continuations, and one further application,
  are shown as expired or abandoned.
  A child's 20 years run "from the date on which the earliest such application was filed"
  ([35 U.S.C. § 154(a)(2)](https://www.law.cornell.edu/uscode/text/35/154)),
  plus any adjustment of its own; the division's front page shows an adjustment of 1,258 days.
- Other expired Nintendo patents claim emulators of particular handhelds.
  [US 7,445,551](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7445551) recites one handheld's memory
  layout in its first claim.
  It was filed on 28 November 2000 as a continuation-in-part of an application filed on 28 July 2000,
  with an adjustment of 1,218 days, so it ran to 28 November 2023 (calculated).
- [US 7,988,556](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7988556) claims emulating a two-screen
  handheld on a one-screen handheld.
  It is a division in a chain whose earliest application was filed on 20 August 2004, with no adjustment,
  so it expired by 20 August 2024 (calculated).
  The application it was divided from issued with an adjustment of nearly four years,
  so that family may not have wholly expired
  (calculated from the front page; that patent is not named here, because it may be in force).
- Patents shown as in force cover emulator techniques and features, not only hardware.
  Title searches found Nintendo and Sony patents, shown with expiry dates from 2028 into the 2040s,
  on subjects that include translating code between instruction sets, caching translated code,
  ahead-of-time recompilation of old games, pacing and speeding up emulation, replacing textures,
  suspending and restoring emulated games over a network, and showing a ROM's graphics in a second application.
  Whether any emulator practises any of these claims was not analysed, and the searches were by title word only.
  Microsoft's position was not mapped.

#### Terms

- R0-01's rule of thumb, that a patent filed before late 2006 has expired, allows for adjustment
  ([R0-01, "Copyright: what is protected and how copying is proved"](R0-01-clean-room-policy.md#copyright-what-is-protected-and-how-copying-is-proved)),
  and the adjustments found in this field are large.
  Patent Office delay extends a term "1 day for each day" (35 U.S.C. § 154(b)).
  Adjustments of about two to nearly four years were found on console-related patents filed in 2000 and 2005,
  and one hardware patent from the two-screen handheld era is shown in force until 2027.
- A foreign priority date does not start the United States term:
  priority "shall not be taken into account in determining the term of a patent" (§ 154(a)(3)).
  A patent from an application filed before 8 June 1995 runs for the greater of 20 years from filing
  or "17 years from grant" (§ 154(c)(1)).
- Patents filed around a console's launch have passed 20 years for systems launched by 2001,
  and plausibly run into the 2030s and 2040s for systems launched from 2011
  (inference from filing-date arithmetic; no list of patents for any console was made).

#### Patent claims against emulators

- One letter asserting a patent on emulation itself against an emulator developer was found, and it is a lead.
  A fan site reproduces what it says is a March 2004 letter from Nintendo to the maker of a commercial Game Boy Advance
  emulator, citing US 6,672,963 and warning of "treble damages for willful infringement"
  ([Zophar's Domain](https://www.zophar.net/news-archive/nintendo-patents-certain-emulators-6614.html);
  [The Register, 12 March 2004](https://www.theregister.com/2004/03/12/nintendo_patents_handheld_emulation_software/);
  secondary).
  No lawsuit on it was found; Sony's patent suits of 2000, below, are the only patent suits against emulators found.
- Neither of Sony's patent suits against the two commercial PlayStation emulators was found to reach a final judgment.
  Press reports say Sony sued Connectix for patent infringement in February 2000 and "withdrew the case" in June 2000,
  after the judge had by one report rejected seven of its nine patent claims, and later refiled it;
  they say Sony sued Bleem in May 2000, and the outcome of that suit was not found
  (The Register, [16 February](https://www.theregister.com/2000/02/16/sony_slaps_patent_suit/),
  [19 May](https://www.theregister.com/2000/05/19/sony_hits_playstation_emulator_developer/),
  and [30 June 2000](https://www.theregister.com/2000/06/30/sony_surrenders_playstation_emulation_fight/), secondary;
  its reports differ on which of Sony's claims the judge rejected).
  No complaint, docket, or patent number was found.
  Two emulator patents first filed by Connectix and by Bleem's developer are shown as assigned to Sony
  (Google Patents in the first pass; not checked again).
- No patent suit against a non-commercial, open-source emulator was found in any jurisdiction.
  That records the searches made; court dockets and the Japanese and European registers were not searched.
- A patent holder has sued a free software project.
  A patent suit against the GNOME Foundation over a photo manager settled in 2020;
  by the [Open Source Initiative's account](https://opensource.org/?p=19712) GNOME paid nothing,
  after raising "over $150,000 from more than 4,000 donors".

#### Liability and knowledge

- Direct infringement needs no knowledge and no sale.
  The statute reaches "whoever without authority makes, uses, offers to sell, or sells any patented invention"
  ([35 U.S.C. § 271(a)](https://www.law.cornell.edu/uscode/text/35/271)).
  "Direct infringement is a strict-liability offense"
  ([Commil v Cisco](https://www.law.cornell.edu/supremecourt/text/13-896)).
  Whether publishing free source code "makes" a claimed system, and who "uses" a claimed method,
  is not answered by any source read.
- Indirect infringement turns on knowledge.
  "Induced infringement under § 271(b) requires knowledge that the induced acts constitute patent infringement",
  and wilful blindness, which "surpasses recklessness and negligence", counts as knowledge
  ([Global-Tech v SEB](https://www.law.cornell.edu/supct/html/10-6.ZO.html)).
  A letter that names a patent supplies knowledge of the patent from its date;
  knowledge that the acts infringe needs more (inference).
- Reading and writing about a patent creates a record of knowledge.
  Debian's guidance for distributions says "reading patents increases the probability
  that subsequent infringement will be found to be willful"
  ([Debian and Software Freedom Law Center FAQ](https://www.debian.org/reports/patent-faq), 2011,
  written before [Halo](https://www.law.cornell.edu/supremecourt/text/14-1513)).
- [Debian's policy](https://www.debian.org/legal/patent) asks community members to "refrain from posting patent concerns
  publicly" or discussing patents outside privileged communications, because unprivileged communications may have to be
  produced in a lawsuit, and unfounded concerns create "fear, uncertainty, and doubt".
  The same page says "Debian will not knowingly distribute software encumbered by patents".
  [FFmpeg](https://ffmpeg.org/legal.html) says "we have never read patents to implement any part of FFmpeg".
  A public note that names in-force patents is such a record (inference).
- [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) treats material a console maker published itself
  as open.
  It does not mention patents, but R0-01's source table lists patents as a maker's public material,
  so a maker's patent would appear to fall in that class (inference).
  An expired patent read as hardware documentation and an in-force patent read
  for the same facts carry different patent risks (inference).
  No project read was found to state that line as a policy.
- Past acts stay exposed after expiry:
  "no recovery shall be had for any infringement committed more than six years" before the complaint is filed
  ([35 U.S.C. § 286](https://www.law.cornell.edu/uscode/text/35/286)).
  Damages can be increased "up to three times" ([§ 284](https://www.law.cornell.edu/uscode/text/35/284)).

#### Exemptions and other countries

- United States law has no general exemption for private or non-commercial use.
  The common-law experimental use defence is narrow, and limited to actions performed "for amusement,
  to satisfy idle curiosity, or for strictly philosophical inquiry"
  ([Madey v Duke](https://law.resource.org/pub/us/case/reporter/F3/307/307.F3d.1351.01-1567.html)).
- The United Kingdom and Germany exempt the private user, not the supplier.
  An act is not an infringement in the United Kingdom if "it is done privately and for purposes
  which are not commercial"
  ([Patents Act 1977, section 60(5)(a)](https://www.legislation.gov.uk/ukpga/1977/37/section/60)).
  A person who supplies "means, relating to an essential element of the invention" can still infringe,
  and the exempt user "shall not be treated as a person entitled to work the invention" (section 60(2) and (6)).
  Germany's Patent Act has the same structure (sections 10 and 11,
  [English translation on the federal law portal](https://www.gesetze-im-internet.de/englisch_patg/englisch_patg.html)).
- Japan has a different structure.
  It gives the patentee "the exclusive right to work the patented invention in the course of trade",
  limits indirect infringement to supply "in the course of trade" as well,
  and lists providing a program "through a telecommunications line" as working it
  ([Patent Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4097/en), Articles 68, 101, and 2(3),
  unofficial translation of the text as amended to 2019).
  How "in the course of trade" applies to free distribution was not researched.
- The European Patent Convention, a treaty outside European Union law,
  excludes "programs for computers" from patents only "as such"
  ([European Patent Convention, Article 52(2) and (3)](https://www.epo.org/en/legal/epc/2020/a52.html)).
  [VideoLAN](https://www.videolan.org/legal.html) takes the position
  that "software patents licenses do not apply on VideoLAN software"; that is one project's stance, tied to France.

#### Games, hardware, and media

- A patent can carry an application date after the accused product shipped.
  The three Japanese patents that Nintendo and The Pokémon Company assert against Palworld carry application dates
  after the game's release, by the defendant's own report,
  which does not say whether they descend from earlier applications.
  Those are game-mechanic patents (inference from the changes the defendant describes),
  and the defendant changed its game while the suit was pending, by its own account
  (Pocketpair statements of [November 2024](https://www.pocketpair.jp/en/news/report-on-patent-infringement-lawsuit/)
  and [May 2025](https://www.pocketpair.jp/en/news/regarding-the-lawsuit-changes-to-palworld-and-the-future/)).
  The suit's status in late 2026 was not established.
- A console feature can be covered by a third party's patents.
  Immersion reports a 2004 jury verdict and $82.0 million in damages against Sony over controller vibration,
  reaching "PlayStation consoles, Dual Shock controllers, and the 47 games found by the jury to infringe"
  ([Immersion's annual report](https://www.sec.gov/Archives/edgar/data/0001058811/000089161807000164/f27349e10vk.htm);
  the plaintiff's account).
- Media formats that some consoles use (from memory) are still pooled.
  The [H.264 pool's](https://www.via-la.com/licensing-2/avc-h-264/) list of active patents dated 1 November 2026 holds
  353 United States patent numbers and one reissue (count of the published list), and the
  [AAC pool](https://www.via-la.com/licensing-2/aac/) lists several hundred.
  The [VC-1 pool's](https://www.via-la.com/licensing-2/vc-1/) list dated 1 November 2026 holds 284 distinct United
  States patent numbers, some shown with expiry dates in 2026 and 2027 (count of the published list).
  The pools' lists do not say which patents a given game's decoding would touch.
- Other formats have left their pools.
  For [MPEG-2](https://www.via-la.com/licensing-2/mpeg-2/), the pool says "the last US patent expired February 13,
  2018".
  The [MP3 licensing programme](https://www.iis.fraunhofer.de/en/ff/amm/consumer-electronics/mp3.html) "has been
  terminated" as of April 2017 (Fraunhofer).
  Press accounts say the last United States AC-3 patent expired in 2017
  ([Gigazine, 21 March 2017](https://gigazine.net/gsc_news/en/20170321-ac-3-patent-expired); secondary),
  and no patent holder's statement was found.
  For ATRAC and the ADPCM variants, a web search found no pool and no holder's statement.
- The S3 texture compression patent was filed in October 1997, so its 20 years ended in 2017 (calculated).
  Mesa kept the feature out while the patent ran, and integrated it in December 2017,
  after the patent's 20 years had passed (inference from the dates).
  While the texture patent ran, its developers wrote "We cannot integrate
  and enable S3TC code by default due to the patents on the algorithm", and loaded an external library instead;
  the code was integrated in 2017 ([DRI wiki](https://dri.freedesktop.org/wiki/S3TC/);
  [Mesa 17.3.0 release notes](https://docs.mesa3d.org/relnotes/17.3.0.html)).

#### Design patents and licences

- Design patents last "15 years from the date of grant", or 14 for applications filed before 13 May 2015
  ([35 U.S.C. § 173](https://www.law.cornell.edu/uscode/text/35/173) and its notes).
  Design patents granted for current consoles would therefore still be in force (inference; none was looked up).
- A United States design patent's claim can be confined to the article it names.
  The Federal Circuit held "that claim language can limit the scope of a design patent
  where the claim language supplies the only instance of an article of manufacture that appears nowhere in the figures"
  ([Curver v Home Expressions](https://law.berkeley.edu/wp-content/uploads/2021/07/2019-09-12_Curver-HomeExpressions_FedCircuitOpinion.pdf),
  2019, slip opinion page 8, read in a university's copy).
  It affirmed a dismissal in which accused baskets "could not infringe" a design limited to chairs (page 2).
  So a design patent for a controller would not reach an image on a screen
  unless its claim covers a screen display (inference).
- [GPLv3's](https://www.gnu.org/licenses/gpl-3.0.html) grant does not reach these patents:
  it gives a licence under "the contributor's essential patent claims", which are a contributor's own (GPLv3 § 11).
  Whether the Open Invention Network's cross-licence, whose members include Sony,
  reaches any emulator was not established: it is scoped to "a list of software packages" that was not read
  ([Open Invention Network, "Linux System"](https://openinventionnetwork.com/linux-system/)).
  [`R0-03`](../../roadmap/research.md#phase-0-ground-rules) covers licences.

### Trade marks and branding, recorded as risks

#### United States

- United States law reaches confusion about "affiliation, connection, or association" and about "origin, sponsorship,
  or approval" ([15 U.S.C. § 1125(a)(1)](https://www.law.cornell.edu/uscode/text/15/1125)).
  A famous mark is also protected against dilution "regardless of the presence or absence of actual or likely confusion,
  of competition, or of actual economic injury" (§ 1125(c)(1)).
- Referring to a maker's product by name can be a nominative fair use.
  In the Ninth Circuit the product must be "not readily identifiable without use of the trademark",
  "only so much of the mark or marks may be used as is reasonably necessary", and the user "must do nothing that would,
  in conjunction with the mark, suggest sponsorship or endorsement"
  ([New Kids on the Block v News America](https://law.resource.org/pub/us/case/reporter/F2/971/971.F2d.302.90-56258.90-56219.html)).
  A competitor may name a product "but would not be entitled to use Coca-Cola's distinctive lettering" (same, note 7).
- The circuits differ on the test.
  The Third Circuit makes it a defence the defendant must prove after confusion is shown
  ([Century 21 v LendingTree](https://law.resource.org/pub/us/case/reporter/F3/425/425.F3d.211.03-4700.html)).
  The Second Circuit holds that it "is not an affirmative defense" and adds its factors to the ordinary ones
  ([Security University](https://www.govinfo.gov/content/pkg/USCOURTS-ca2-14-03456/pdf/USCOURTS-ca2-14-03456-0.pdf),
  2016).
- In the cases read, logos and stylised use fell outside nominative fair use.
  A car broker "could adequately communicate their message without using the visual trappings of the Lexus brand",
  and a disclaimer, "while not required", "is relevant to the nominative fair use analysis"
  ([Toyota v Tabari](https://cdn.ca9.uscourts.gov/datastore/opinions/2010/07/08/07-55344.pdf)).
  A repeated, stylised abbreviation used as page wallpaper failed the test
  ([Playboy v Welles](https://law.resource.org/pub/us/case/reporter/F3/279/279.F3d.796.00-55538.00-55537.00-55229.00-55009.html)).
- Using a maker's mark inside one's own name or logo is treated differently.
  The dilution exclusions cover fair use "other than as a designation of source for the person's own goods or services"
  (§ 1125(c)(3)(A)).
  The Supreme Court held that the Rogers threshold test, a First Amendment screen,
  does not apply where the accused party "has used a trademark as a trademark",
  and that a parody used as a mark is not "noncommercial" for the dilution exclusion
  ([Jack Daniel's v VIP Products](https://www.supremecourt.gov/opinions/22pdf/22-148_3e04.pdf)).
- A domain name can suggest sponsorship.
  A name that is "only the trademark followed by .com" "will typically suggest sponsorship or endorsement" (Tabari).
  A single-member Forum panel transferred a name joining "switch" and "emulator" to Nintendo in 2022,
  where the site offered unauthorised copies of Nintendo games, advertising, and adult material,
  and the registrant did not respond
  ([Forum claim FA2207002006456](https://www.adrforum.com/DomainDecisions/2006456.htm), an administrative decision).

#### Emulator cases and boot logos

- The trade mark rulings in emulator cases are few and narrow.
  [Connectix](https://law.resource.org/pub/us/case/reporter/F3/203/203.F3d.596.99-15852.html) rejected dilution by
  tarnishment because "there is insufficient evidence", while assuming "without deciding, that the concept of
  tarnishment is applicable".
  [Bleem](https://law.resource.org/pub/us/case/reporter/F3/214/214.F3d.1022.99-17137.html) decided no trade mark
  question.
  The [yuzu complaint](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.1.0.pdf)
  has no trade mark count.
- A mark displayed by copied game data has been treated both ways by district courts.
  In the ROM site case the court held that a claim based on marks shown
  when a downloaded game is played is "more accurately conceived of as attacking unauthorized copying",
  and "not a cognizable Lanham Act claim"; it granted judgment only for marks used on the website
  ([Nintendo v Storman](https://storage.courtlistener.com/recap/gov.uscourts.cacd.758131/gov.uscourts.cacd.758131.87.0.pdf),
  unopposed on this point).
  An earlier court had held that the mark appearing "whenever a Sega game
  which has been downloaded" is played supported infringement
  ([Sega v MAPHIA](https://static.case.law/f-supp/948/cases/0923-01.json), 1996).
  Both concern distributors of copied games, not emulator authors.
- Sega v Accolade's trade mark holding rests on its facts.
  The court asked "which party is primarily responsible" for the misleading message,
  and held "that Sega is primarily responsible for any resultant confusion",
  because the check regulated access and there was "no indication in the record of any public
  or industry awareness of any feasible alternate method of gaining access"
  ([Sega v Accolade](https://law.resource.org/pub/us/case/reporter/F2/977/977.F2d.1510.92-15655.html)).
  It noted that Accolade's packaging said it "is not associated with Sega Enterprises, Ltd."
  The ruling was on a preliminary injunction: "Possibly, Sega will be able to meet its burden of proof at trial."
- By [Pan Docs'](https://gbdev.io/pandocs/The_Cartridge_Header.html) description,
  the logo a Game Boy shows at start-up is read from the cartridge's header,
  and the boot ROM holds a copy to compare it with.
  An emulator that runs no boot ROM and makes no check contains no copy of the logo (inference from that description).
  [SameBoy](https://github.com/LIJI32/SameBoy) lists "Support
  for games with a non-Nintendo logo in the header" among the features of its boot ROMs.

#### Europe and Japan

- European Union law lets a third party use a mark for "identifying or referring to goods or services
  as those of the proprietor", but only "in accordance with honest practices in industrial or commercial matters"
  ([Regulation (EU) 2017/1001](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32017R1001), Article 14).
- Construing the same words in the earlier Directive 89/104, the Court of Justice held that use is not honest,
  for example, where it gives "the impression that there is a commercial connection",
  or where the third party "presents its product as an imitation or replica"
  ([Gillette v LA-Laboratories](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:62003CJ0228)).
- Infringement requires use "in the course of trade".
  The Court of Justice's test is that use is in the course of trade
  where "it takes place in the context of commercial activity with a view to economic advantage and not
  as a private matter" ([Arsenal v Reed](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62001CJ0206),
  C-206/01, paragraph 40; restated in
  [Google France](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62008CJ0236), C-236/08, paragraph 50).
- A project that sells nothing, carries no advertising,
  and takes no money is further from that test than yuzu's paid builds; donations
  and store releases move it closer (inference).
  No ruling on a free software project was found.
  The United Kingdom's [Trade Marks Act 1994](https://www.legislation.gov.uk/ukpga/1994/26/section/10) has matching
  words (sections 10 and 11(2)).
- Japan's [Trademark Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4032) gives a right no effect against "a
  trademark which is not used in the mode that consumers may recognize the goods or services as those pertaining to the
  business of a particular person" (Article 26(1)(vi), unofficial translation; no case was read).

#### Imagery and makers' guidelines

- Screenshots, box art, characters, and footage are copyright questions.
  The only appellate support read is Bleem, limited to real screenshots in comparative advertising.
  PCSX2 states a fair use position for the screenshots on its own site; it is untested
  ([PCSX2, "Trademark and Copyright"](https://pcsx2.net/intellectualproperty)).
- Makers' content guidelines do not cover an emulator project.
  [Nintendo's guidelines](https://www.nintendo.co.jp/networkservice_guideline/en/index.html) permit individuals to share
  footage on video sites, and list as inappropriate content that "shows how to use software and/or devices that
  circumvent security measures ... such as emulators and/or other circumvention software".
  [Microsoft's rules](https://www.xbox.com/en-US/developers/rules) are a "revocable, limited license" for "personal,
  noncommercial" use.
  [Sega's](https://www.sega.co.jp/en/streaming_guideline/) apply "only to individual users who are using our products
  through legitimate means".
  No Sony guideline was found.
- One maker publishes rules for naming its products.
  Microsoft allows a note that a product "is interoperable or compatible with a Microsoft product",
  and forbids its marks "in the name of your business, product, service, app, domain name, social media account",
  and its logos "in any manner"
  ([Microsoft Trademark and Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks)).
- Asked for permission to use its website content,
  [Nintendo of Europe](https://www.nintendo.com/en-gb/Legal-information/Copyright/Copyright-625949.html) says that
  because it receives thousands of requests, "our policy is to decline use of our trademarks and copyrights".
  These are owners' wishes, not statements of what the law allows (inference).

#### Design rights, stores, and project names

- Console and controller shapes can carry design rights.
  Nintendo says it registers "design rights, or design patents as they are known in the US",
  which "can include the shape of accessories like controllers"
  ([Nintendo, Intellectual Property and Piracy FAQ](https://en-americas-support.nintendo.com/app/answers/detail/a_id/55888)).
- European Union design law now covers "graphical user interfaces" and products in "non-physical form",
  with a limit for acts done for "identifying or referring to a product as that of the design right holder"
  ([Regulation (EC) 6/2002 as consolidated in May 2025](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02002R0006-20250501)).
  Its scope covers "any design which does not produce on the informed user a different overall impression"
  (Article 10(1)),
  and the product indication "shall not affect the scope of protection of the design as such" (Article 36(6)).
  So a European Union design for a controller is not confined to physical controllers by its product indication
  (inference); the limit for referring to a product still applies.
- Trade dress does not protect a feature that "is essential to the use
  or purpose of the article" ([TrafFix](https://www.law.cornell.edu/supct/html/99-1571.ZO.html)).
  No dispute about an emulator's on-screen controller skin was found.
- Stores apply stricter rules than the courts (inference).
  [Apple](https://developer.apple.com/app-store/review/guidelines/) forbids using "another developer's icon, brand,
  or product name in your app's icon or name, without approval from the developer",
  and [Google](https://support.google.com/googleplay/android-developer/answer/9888072?hl=en) says an app using another's
  marks "in a way that is likely to cause confusion ... may be suspended".
- [Delta's release notes](https://faq.deltaemulator.com/release-notes) record a "Brand new legally-compliant app icon"
  in July 2024, after a complaint from Adobe that press reports say was also sent to Apple
  ([TechCrunch](https://techcrunch.com/2024/05/17/adobe-comes-after-indie-game-emulator-delta-for-copying-its-logo),
  secondary).
- Existing emulators name the console in plain words and mostly disclaim affiliation.
  Of ten projects whose README or site was read, six state that they are not affiliated with the maker,
  for example "Dolphin is not affiliated with Nintendo in any way" and "Azahar is not affiliated with
  or endorsed by Nintendo" ([Azahar](https://azahar-emu.org/)).
  PPSSPP has a general trade mark line; melonDS, [RetroArch's home page](https://www.retroarch.com/),
  and [RPCS3's README](https://github.com/RPCS3/rpcs3) have none.
- Several names allude to a console's name, such as PCSX2, PPSSPP, and RPCS3.
  No complaint against those names, and no emulator renamed after a maker's complaint, was found.
- One project claims a registration of its own name:
  "RetroArch is a registered trademark in the United States of America, the European Union and China"
  (project site; the registers were not checked).

### Questions no court was found to have decided

Each line records searches, not proof of absence.
These are findings about the state of the law; the work that could change them is in "Open questions".

- Whether an emulator that contains no maker code and no keys, and needs the user to supply keys or firmware,
  is a circumvention tool.
  For console emulators, only an agreed finding and a default ruling exist.
- Whether § 1201(f), or an interoperability exception elsewhere, protects such an emulator.
- Whether a cartridge-era lock-out on an unencrypted game, such as a logo comparison, a lock-out chip,
  or a region check, is a measure that "effectively controls access",
  and whether software that never runs such a check circumvents it.
  A disc authentication check was treated as an access control, on the console, in Divineo.
- Whether the owner of a game may dump it and run the dump on other hardware,
  and whether buyers of console games are owners or licensees.
- Whether a user may copy a BIOS out of a console the user owns,
  and whether an emulator that needs one may be distributed.
- Whether a cryptographic key is a copyrightable work, and whether publishing one infringes copyright in firmware.
- Whether a save state, a texture pack, a translation patch, or an upscaling feature infringes.
- Whether screenshots or video of emulated play of a lawfully owned game infringe.
- Whether a replacement boot ROM or an emulator that draws a maker's logo infringes a trade mark or copyright.
- Whether free distribution of emulator source code infringes a patent, and under which provision.
- Whether the remedies for a wrongful takedown notice apply to a notice that alleges only circumvention.
  One district court held that § 512(f) does not (Yout v RIAA); no appellate ruling was found by 2026-11-20.
- Whether a maker's licence terms bind a developer who never accepted them,
  where users who did accept them supply the dumps.

## Options and trade-offs

The options answer separate questions and can be combined.
Options 1 to 3 concern which systems are emulated and how protected content is handled.
Options 4 to 6 concern firmware and game copies.
Options 7 to 10 concern distribution and conduct around the code.
Options 11 to 13 concern patents, and options 14 to 16 concern names and imagery.

### 1. Emulate only systems whose games are not encrypted

- **What:** limit the emulator to systems where it reads unencrypted game images and performs no decryption.
- **Costs:** excludes or delays later consoles; the status of lock-out checks on old systems is undecided; copyright,
  patent, and trade mark risks remain.
- **Gains:** none of the circumvention filings, judgments, or notices found describes such an emulator;
  closest to the facts of Connectix.
- **Used by:** the emulators with no notice in GitHub's archive, as an observation, not as their stated policy.

### 2. Emulate an encrypted system and require the user to supply keys

- **What:** ship no keys; decrypt at run time with keys the user provides.
- **Costs:** the design that the yuzu complaint, the agreed finding, the Keighin default ruling,
  and the 2026 notices describe as trafficking; untested in a contested case; libraries and forks are reached too.
- **Gains:** covers encrypted systems; the project publishes no key.
- **Used by:** yuzu and Ryujinx, by the court documents' account; both have ended.

### 3. Accept only decrypted input, or embed a published key

- **What:** two variants seen: leave decryption to separate tools, or include a widely published key in the source.
- **Costs:** linking to decryption tools was pleaded as trafficking,
  and the consent injunction bars trafficking in other circumvention software without naming links;
  an embedded key was cited in a maker's letter; neither variant has been tested.
- **Gains:** in the first, the project's code performs no decryption; in the second, the emulator works unaided.
- **Used by:** Azahar, for the first variant, since March 2025, giving legal challenges as its reason,
  with no notice naming it found; Dolphin embeds the Wii common key and has "every reason to believe"
  that § 1201(f) covers its decryption.

### 4. Require firmware that the user dumps

- **What:** ship no BIOS or system software; the user copies it from a console the user owns.
- **Costs:** no decision says the user's copy is lawful; maker licences forbid copying and use off the console;
  dumping can need a modified console.
- **Gains:** the project distributes no maker code.
- **Used by:** PCSX2, DuckStation, and melonDS for firmware boot.

### 5. Replace the firmware

- **What:** ship an independently written BIOS or boot ROM, or emulate system calls at a high level.
- **Costs:** lower accuracy, by SkyEmu's account; the replacement must be written independently,
  and other projects' replacements are closed-tier material under
  [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md#closed-tier); any logo or message it draws is the
  project's own act.
- **Gains:** nothing of the maker's is needed to run; the facts of Connectix;
  a Game Boy replacement needs no copy of the logo, because the cartridge supplies it.
- **Used by:** mGBA, SkyEmu, SameBoy, and PPSSPP.

### 6. Point users to firmware the maker publishes

- **What:** have the user download system software from the maker's own site.
- **Costs:** the licences read, Sony's
  and Microsoft's, limit use to the console; a maker can withdraw the page (inference); not available for every system.
- **Gains:** no console modification and no third-party copy.
- **Used by:** Vita3K, which leaves a second font package to the user;
  Microsoft publishes such a file for Xbox consoles, and no emulator using it was looked for.

### 7. Publish, or decline to publish, dumping guides and links

- **What:** whether the project documents how to obtain keys, firmware, and game dumps, or links to tools that do.
- **Costs:** of publishing: guides and links were pleaded as trafficking,
  and United Kingdom law names publishing information; of declining: users turn to third parties.
- **Gains:** of publishing: usability; of declining: removes conduct that the filings rely on.
- **Used by:** yuzu published a guide and links to key-dumping tools;
  PCSX2 and Dolphin publish guides that name or link dumping tools for one's own console.

### 8. Take money, or not

- **What:** paid builds, subscriptions, or donations tied to the emulator.
- **Costs:** pleaded against yuzu as profit from circumvention;
  the criminal provisions read mostly require a commercial purpose or gain; in the European Union,
  money moves use of a mark closer to "the course of trade" (inference).
- **Gains:** funding.
  Taking none does not remove civil exposure: a free server was a trafficked tool in Davidson,
  and Keighin counted open-source status against the emulators.
- **Used by:** yuzu took money; Connectix and Bleem were paid products and won their appeals on other facts.

### 9. Choose where the project is hosted and distributed

- **What:** a public code host, self-hosting, commercial stores, or a mix.
- **Costs:** one notice can disable a repository and every fork; a store can refuse a release with no notice;
  self-hosting moves the exposure to hosts and registrars.
- **Gains:** a host with a published review process and counter-notice route; a store's reach.
- **Used by:** Dolphin abandoned its Steam release.

### 10. Respond to a claim by contesting, complying, or settling

- **What:** counter-notice or defence; removal or withdrawal; or an agreed judgment.
- **Costs:** a counter-notice needs identity, an address, and consent to a United States court,
  and was followed by a suit in one case; agreed judgments carried broad findings and injunctions;
  withdrawal ends the project.
- **Gains:** only contested cases produce rulings tested by argument from both sides;
  compliance and settlement end the dispute, often on terms that bind the people involved afterwards,
  and a dormant repository was still disabled later.
- **Used by:** Connectix and Bleem contested, and Connectix then settled; yuzu and Hotz consented;
  Skyline and EmuParadise withdrew.

### 11. Do not read patents

- **What:** contributors never search for or read patents, and the project does not discuss specific patents in public.
- **Costs:** gives up expired patents as hardware documentation; no effect on direct infringement;
  cannot be shown for an AI author whose training data is unknown.
- **Gains:** no record of having read patents, for indirect infringement or enhanced damages;
  knowledge can still come from a letter, or be argued as wilful blindness.
- **Used by:** FFmpeg; recommended by Debian's guidance.

### 12. Read expired patents only, as documentation

- **What:** treat a maker's expired patents as open maker material, and leave patents in force unread.
- **Costs:** needs an expiry check for each patent; public status data disclaims accuracy;
  a patent in the family may run past the 20-year estimate through term adjustment.
  A check from the front page's filing dates and adjustment, as done here for three patents, gives the longest term;
  fees and disclaimers can only shorten it.
- **Gains:** keeps the documentary value for old systems.
- **Used by:** no project found that states it.

### 13. Leave patented features out until expiry

- **What:** omit a patented codec or technique, load it from an external library, or wait.
- **Costs:** missing features; someone must track expiry in each country.
- **Gains:** the project does not ship the feature while the patent runs.
- **Used by:** Mesa for texture compression until 2017; Debian,
  which "will not knowingly distribute software encumbered by patents" (Debian policy).

### 14. Name the project without a maker's mark, and describe systems in plain words

- **What:** a coined name; statements such as "emulates X" in text; a statement of non-affiliation.
- **Costs:** the name does not say what is emulated; a disclaimer is relevant but not decisive.
- **Gains:** the name is not a use of a maker's mark as a mark; plain reference is what the nominative tests address.
- **Used by:** Dolphin, Azahar, Delta, and RetroArch for names; six of ten projects for disclaimers.

### 15. Use no maker logos or game imagery, or use them under a stated position

- **What:** either show only the project's interface, test programs, and homebrew,
  or use screenshots and state a fair use position.
- **Costs:** of abstaining: plainer pages; of using: rests on a holding confined to comparative advertising,
  Nintendo's guidelines treat emulator content as inappropriate,
  and the others read cover only personal or legitimate use.
- **Gains:** of abstaining: no third-party copyright or mark in the project's material.
- **Used by:** PCSX2 states a position.

### 16. Handle boot logos by drawing what the game supplies, or by drawing none

- **What:** a replacement boot path that shows header data from the user's game image, shows nothing,
  or shows the project's own mark.
- **Costs:** no decision covers any variant;
  a boot ROM that embeds a maker's logo makes the project the party reproducing it.
- **Gains:** a path that holds no copy of the logo distributes none.
- **Used by:** SkyEmu's replacements lack the start-up splashes; SameBoy supports a non-Nintendo logo in the header.

### Recommendation

The options answer five separate questions, and a sixth question, whose law to plan around, runs through them all.
Each recommendation is for the owner to decide.

- **Protected content (options 1 to 3):** take up systems under option 1 first,
  and decide encrypted systems one by one in [`R6-01`](../../roadmap/research.md#phase-6-synthesis)
  after their family surveys.
  Where an encrypted system is taken up, prefer option 3's first variant
  (accept only decrypted input, with no decryption code, keys, or links to tools) over option 2.
  Every filing, judgment, and notice found targets run-time decryption with user-supplied keys,
  Azahar moved to decrypted input in March 2025 with no notice naming it found,
  and an embedded key drew a maker's letter.
- **Firmware (options 4 to 6):** prefer option 5, an independently written replacement or high-level emulation,
  wherever accuracy allows, with option 4 as an optional path, and option 6 where the maker publishes the file.
  Connectix's facts are a replacement, no decision makes a user's dump lawful, and the maker licences read
  (Sony, Microsoft) tie published files to the console.
- **Conduct around the code (options 7 to 10):** publish no dumping guides or links to dumping tools;
  take no money tied to the emulator at first; host on GitHub,
  with no store release until [`R3-03` and `R3-06`](../../roadmap/research.md#phase-3-host-platforms) report;
  and on a notice, comply and take the owner's decision before any counter-notice.
  Guides, links, and paid builds are pleaded against yuzu,
  and a counter-notice needs a named person and consent to a United States court, and was followed by a suit once.
- **Patents (options 11 to 13):** option 12, reading expired patents only, as documentation,
  with option 13 for codecs still pooled.
  The expired Nintendo emulation patents are confirmed expired by the term rule,
  reading in-force patents creates a record of knowledge
  (Debian's guidance), and Mesa's handling of S3TC shows option 13 at work.
  This matches the proposed amendment of ADR 0001: expired patents are maker material and open,
  and patents shown in force are read for subject only, never for claims,
  so no Patent Office status check is made for them.
- **Names and imagery (options 14 to 16):** option 14 with a non-affiliation statement; option 15's abstaining variant
  (no maker logos or game imagery; homebrew and test programs only);
  and option 16's variants that hold no copy of a maker's logo (draw nothing, or the project's own mark).
  "Rustalgia" holds no maker's mark, the only fair use support for screenshots is confined to comparative advertising,
  and a boot path that embeds a logo makes the project its reproducer.
- **Whose law to plan around:** plan around United States law first,
  and treat the United Kingdom and the European Union as a second check where they are stricter.
  Every judgment and notice found against an emulator is American, the project is hosted on GitHub,
  and a counter-notice consents to a United States court;
  the United Kingdom has no interoperability exception and names publishing information,
  and the European Union has only a recital.
  If the owner's country of residence changes the answer, `R6-01` records it.

## Implications for Rustalgia

- Encryption is the common fact in every console emulator filing, judgment, and notice found.
  Each family survey ([`R1-10` to `R1-25`](../../roadmap/research.md#system-family-surveys)) needs to record
  whether a system's games or firmware are encrypted or authenticated, and by what kind of check.
  This feeds the system scope proposal ([`R6-01`](../../roadmap/research.md#phase-6-synthesis))
  and an ADR on protected content.
- Options 1 to 3 cannot be settled by research alone,
  which is why the recommendation leaves encrypted systems to `R6-01`.
  For the Switch and PlayStation surveys
  ([`R1-14`, `R1-21`](../../roadmap/research.md#system-family-surveys)),
  which depend on this note, the record for consoles with encrypted games is one-sided and uncontested;
  that is a recorded risk, not a finding that those systems are closed.
- Firmware has three routes, options 4 to 6, and none is settled law.
  [`R2-12`](../../roadmap/research.md#phase-2-cross-cutting-engineering) weighs them technically;
  the legal inputs are the findings on Connectix, maker licences, and Atari v JS&A.
  This feeds an ADR on firmware and a requirement on what the project ships.
- What the project says to users is itself conduct.
  Guides, links, compatibility lists, screenshots, and telemetry all appear in the filings.
  This feeds requirements on documentation and on the website.
  For notes, the research conventions already bar keys and firmware bytes
  ([research conventions, "Constants and tables"](../README.md#constants-and-tables)),
  and this note says what a protection is without saying how to defeat it, as its Scope states.
- Patents are a risk that [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md) does not address;
  its row for maker material, which R0-01's source table says includes patents, treats them as open (inference).
  The recommendation is the proposed amendment of ADR 0001: expired patents open, in-force patents by subject only.
  Until the owner decides, this note names no patent in force, as its patents section states.
- Takedown history bears on how sources are recorded.
  The recommendation, also for the proposed amendment of ADR 0001,
  is that takedown history goes in a register line's note field and does not by itself change a tier.
- The project's licence, hosting, and funding choices carry legal weight found here:
  open-source status was counted against emulators in one default ruling, a single notice can disable all forks,
  and contesting a notice needs a named person.
  [`R0-03`](../../roadmap/research.md#phase-0-ground-rules),
  [`R3-03`, and `R3-06`](../../roadmap/research.md#phase-3-host-platforms) take these up.
- The name "Rustalgia" contains no maker's mark.
  Rules for descriptive statements, logos, screenshots, controller skins, and boot logos would follow options 14 to 16.
  This feeds a requirement on branding
  and one on the default interface ([`R3-10`](../../roadmap/research.md#phase-3-host-platforms)).
- Country matters.
  Statutory interoperability exceptions to anti-circumvention rules exist in the United States
  (§ 1201(f)),
  Canada, Australia, and South Korea; the European Union has only a recital, and none was found in the United Kingdom,
  German, French, or Japanese texts read.
  The recommendation above plans around United States law first; this feeds `R6-01`.

## Open questions

- Which roadmap systems encrypt or authenticate their games or firmware, and by what kind of check?
  [R1-03](R1-03-primer-sixth-generation.md#media-security-and-system-software) records that Wii, 3DS, PSP, Vita,
  and Xbox 360 retail content is encrypted, and [R1-04](R1-04-primer-modern.md) that Switch game containers are;
  the rest is for the family surveys, [`R1-10` to `R1-25`](../../roadmap/research.md#system-family-surveys).
- Is a lock-out check on an unencrypted game an access control?
  Only a court ruling can answer it, and none exists; the family surveys record each check,
  so that the risk can be stated per system.
- What is Keighin's document 40, of 5 November 2025, which the 2026 notices cite?
  It is not in the public court archive
  (HTTP 404 for documents 39 to 42); buying it from the court's paid service, which needs an account, would answer it.
- Which audio and video formats does each system's software use?
  The family surveys and [`R2-11`](../../roadmap/research.md#phase-2-cross-cutting-engineering).
- Does a replacement boot ROM for a roadmap system other than the Game Boy need a maker's logo to run unmodified
  software, as the Game Boy Advance, DS, and Genesis checks may require (from memory)?
  [`R2-12`](../../roadmap/research.md#phase-2-cross-cutting-engineering) and the family surveys.
- What enforcement has reached hosts other than GitHub?
  Lumen refuses automated searches; a Lumen researcher account, which the owner would have to request, would answer it.
  GitLab, Patreon, and Discord publish no archive that was found.

## Sources

Every source below was read on 2026-11-19, except those marked "read 2026-11-20".
Sources that [R0-01](R0-01-clean-room-policy.md#sources) lists are not repeated: Sega v Accolade, Sony v Connectix,
Atari v Nintendo, Davidson v Jung, Bowers v Baystate, Halo v Pulse, Take-Two v Papenhoff,
the Tropic Haze complaint and judgment, Directive 2009/24/EC, the German Copyright Act in English,
the Japanese Copyright Act and Unfair Competition Prevention Act, the Australian Copyright Act, 37 C.F.R. § 201.40,
and GPLv3.
On 2026-11-19 European Union texts were read through the Publications Office's CELEX resource addresses,
because EUR-Lex returned empty pages; EUR-Lex answered on 2026-11-20, and the entries link it.
Each legal and press host is recorded in the [source register](../../../.claude/hooks/source-register.txt) as a source
that is not about consoles.

Statutes, treaties, and regulations:

- [17 U.S.C. § 1201](https://www.law.cornell.edu/uscode/text/17/1201),
  with [§ 117](https://www.law.cornell.edu/uscode/text/17/117), [§ 512](https://www.law.cornell.edu/uscode/text/17/512),
  [§ 1203](https://www.law.cornell.edu/uscode/text/17/1203),
  and [§ 1204](https://www.law.cornell.edu/uscode/text/17/1204).
- [15 U.S.C. § 1125](https://www.law.cornell.edu/uscode/text/15/1125).
- [35 U.S.C. § 154](https://www.law.cornell.edu/uscode/text/35/154),
  with [§ 173](https://www.law.cornell.edu/uscode/text/35/173), [§ 271](https://www.law.cornell.edu/uscode/text/35/271),
  [§ 284](https://www.law.cornell.edu/uscode/text/35/284), and [§ 286](https://www.law.cornell.edu/uscode/text/35/286).
- [WIPO Copyright Treaty](https://www.wipo.int/wipolex/en/text/295166), Article 11.
- [Directive 2001/29/EC](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32001L0029).
- [Regulation (EU) 2017/1001](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32017R1001), Articles 9 and 14.
- [Regulation (EC) 6/2002, consolidated 1 May 2025](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02002R0006-20250501),
  first read at the [Publications Office address](https://publications.europa.eu/resource/celex/02002R0006-20250501);
  Articles 10 and 36 read 2026-11-20.
- [European Patent Convention, Article 52](https://www.epo.org/en/legal/epc/2020/a52.html).
- [Copyright, Designs and Patents Act 1988](https://www.legislation.gov.uk/ukpga/1988/48/section/296),
  sections [28B](https://www.legislation.gov.uk/ukpga/1988/48/section/28B),
  [50A](https://www.legislation.gov.uk/ukpga/1988/48/section/50A), and 296 to 296ZF.
- [Trade Marks Act 1994](https://www.legislation.gov.uk/ukpga/1994/26/section/10), sections 10 and 11.
- [Patents Act 1977](https://www.legislation.gov.uk/ukpga/1977/37/section/60), section 60.
- [German Patent Act, English translation](https://www.gesetze-im-internet.de/englisch_patg/englisch_patg.html).
- German Copyright Act, German text: [section 69a](https://www.gesetze-im-internet.de/urhg/__69a.html);
  [section 69f](https://www.gesetze-im-internet.de/urhg/__69f.html)
  and [section 95a](https://www.gesetze-im-internet.de/urhg/__95a.html), read 2026-11-20;
  the [portal's note on translations](https://www.gesetze-im-internet.de/Teilliste_translations.html).
- [buzer.de, versions of section 69a UrhG](https://www.buzer.de/69a_UrhG.htm) and its amendment pages,
  a private record of statute versions, read 2026-11-20.
- [Bundestag, Drucksache 19/27426](https://dserver.bundestag.de/btd/19/274/1927426.pdf), 9 March 2021,
  government bill and reasoning, read 2026-11-20.
- [France, bill adopted on 30 June 2006, text 596](https://www.assemblee-nationale.fr/12/ta/ta0596.asp).
- [France, Constitutional Council, decision 2006-540 DC](https://www.conseil-constitutionnel.fr/decision/2006/2006540DC.htm).
- [France, Code de la propriété intellectuelle](https://codes.droit.org/PDF/Code%20de%20la%20propri%C3%A9t%C3%A9%20intellectuelle.pdf),
  edition of 18 November 2026, an unofficial compilation of Légifrance open data, read 2026-11-20.
- Japan, unofficial translations: [Patent Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4097/en),
  as amended to 2019, and [Trademark Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4032);
  [Copyright Act](https://www.japaneselawtranslation.go.jp/en/laws/view/4207), Act No. 52 of 2021 version,
  Articles 2 and 30 read 2026-11-20.
- [Japan, Ministry of Economy, Trade and Industry, "Revision of Unfair Competition Prevention Act"](https://www.meti.go.jp/english/policy/economy/chizai/chiteki/pdf/english_2018rev.pdf).
- [Canada, Copyright Act](https://laws-lois.justice.gc.ca/eng/acts/C-42/FullText.html), current to 29 October 2026.
- Australia, [Copyright Act 1968](https://www.legislation.gov.au/C1968A00063/latest/text), compilation 65 (C2026C00138),
  and [Copyright Regulations 2017](https://www.legislation.gov.au/F2017L01649/latest/text) (F2024C00262),
  each read 2026-11-20 as the Word file the register serves.
- [South Korea, Copyright Act, unofficial translation](https://elaw.klri.re.kr/eng_service/lawViewContent.do?hseq=62935).

Copyright Office material:

- [Register's Recommendation, Ninth Triennial Proceeding](https://www.copyright.gov/1201/2024/2024_Section_1201_Registers_Recommendation.pdf)
  (October 2024).
- ["Section 1201 of Title 17"](https://www.copyright.gov/policy/1201/section-1201-full-report.pdf) (June 2017).
- Final rules of [2000](https://www.govinfo.gov/content/pkg/FR-2000-10-27/pdf/00-27714.pdf),
  [2012](https://www.govinfo.gov/content/pkg/FR-2012-10-26/pdf/2012-26308.pdf),
  and [2024](https://www.govinfo.gov/content/pkg/FR-2024-10-28/pdf/2024-24563.pdf).
- [Tenth Triennial Proceeding, 2027 cycle](https://www.copyright.gov/1201/2027/index.html),
  and its [notice of proposed rulemaking](https://public-inspection.federalregister.gov/2026-21939.pdf).
- ["Copyright and Digital Files"](https://www.copyright.gov/help/faq/faq-digital.html).

United States court decisions and filings:

- [Sony Computer Entertainment America v Bleem](https://law.resource.org/pub/us/case/reporter/F3/214/214.F3d.1022.99-17137.html),
  214 F.3d 1022 (9th Cir. 2000).
- [Lewis Galoob Toys v Nintendo of America](https://law.resource.org/pub/us/case/reporter/F2/964/964.F2d.965.91-16205.html),
  964 F.2d 965 (9th Cir. 1992).
- [Micro Star v FormGen](https://law.resource.org/pub/us/case/reporter/F3/154/154.F3d.1107.html), 154 F.3d 1107
  (9th Cir. 1998).
- [Midway Manufacturing v Artic International](https://law.resource.org/pub/us/case/reporter/F2/704/704.F2d.1009.82-1607.html),
  704 F.2d 1009 (7th Cir. 1983).
- [MAI Systems v Peak Computer](https://law.resource.org/pub/us/case/reporter/F2/991/991.F2d.511.92-55363.93-55106.html),
  991 F.2d 511 (9th Cir. 1993).
- [Vernor v Autodesk](https://cdn.ca9.uscourts.gov/datastore/opinions/2010/09/10/09-35969.pdf), 621 F.3d 1102
  (9th Cir. 2010).
- [Krause v Titleserv](https://law.resource.org/pub/us/case/reporter/F3/402/402.F3d.119.03-9303.html), 402 F.3d 119
  (2d Cir. 2005).
- [MDY Industries v Blizzard Entertainment](https://cdn.ca9.uscourts.gov/datastore/opinions/2011/02/17/09-15932.pdf),
  629 F.3d 928 (9th Cir. 2010, amended 2011).
- Apple v Psystar, [658 F.3d 1150](https://cdn.ca9.uscourts.gov/datastore/opinions/2011/09/28/10-15113.pdf)
  (9th Cir. 2011), and [673 F.Supp.2d 931](https://static.case.law/f-supp-2d/673/cases/0931-01.json) (N.D. Cal. 2009).
- [Apple v Corellium](https://media.ca11.uscourts.gov/opinions/unpub/files/202112835.pdf), No. 21-12835
  (11th Cir. 8 May 2023, unpublished).
- [Apple Computer v Franklin Computer](https://law.resource.org/pub/us/case/reporter/F2/714/714.F2d.1240.82-1582.html),
  714 F.2d 1240 (3d Cir. 1983).
- [Atari v JS&A Group](https://static.case.law/f-supp/597/cases/0005-01.json), 597 Federal Supplement 5
  (N.D. Ill. 1983).
- [Universal City Studios v Reimerdes](https://static.case.law/f-supp-2d/111/cases/0294-01.json), 111 F.Supp.2d 294
  (S.D.N.Y. 2000).
- [Universal City Studios v Corley](https://law.resource.org/pub/us/case/reporter/F3/273/273.F3d.429.00-9185.html),
  273 F.3d 429 (2d Cir. 2001).
- [Disney Enterprises v VidAngel](https://cdn.ca9.uscourts.gov/datastore/opinions/2017/08/24/16-56843.pdf), 869 F.3d 848
  (9th Cir. 2017).
- [Chamberlain Group v Skylink Technologies](https://law.resource.org/pub/us/case/reporter/F3/381/381.F3d.1178.04-1118.html),
  381 F.3d 1178 (Fed. Cir. 2004).
- [Lexmark International v Static Control Components](https://law.resource.org/pub/us/case/reporter/F3/387/387.F3d.522.03-5400.html),
  387 F.3d 522 (6th Cir. 2004).
- [MGE UPS Systems v GE Consumer and Industrial](https://www.ca5.uscourts.gov/opinions/pub/08/08-10521-CV1.wpd.pdf),
  622 F.3d 361 (5th Cir. 2010).
- [321 Studios v Metro Goldwyn Mayer Studios](https://static.case.law/f-supp-2d/307/cases/1085-01.json),
  307 F.Supp.2d 1085 (N.D. Cal. 2004).
- [Agfa Monotype v Adobe Systems](https://static.case.law/f-supp-2d/404/cases/1030-01.json), 404 F.Supp.2d 1030
  (N.D. Ill. 2005).
- [Sony Computer Entertainment America v GameMasters](https://static.case.law/f-supp-2d/87/cases/0976-01.json),
  87 F.Supp.2d 976 (N.D. Cal. 1999).
- [Sony Computer Entertainment America v Divineo](https://static.case.law/f-supp-2d/457/cases/0957-01.json),
  457 F.Supp.2d 957 (N.D. Cal. 2006).
- [Sony Computer Entertainment America v Filipiak](https://static.case.law/f-supp-2d/406/cases/1068-01.json),
  406 F.Supp.2d 1068 (N.D. Cal. 2005).
- [United States v Reichert](https://www.govinfo.gov/content/pkg/USCOURTS-ca6-13-03479/pdf/USCOURTS-ca6-13-03479-0.pdf),
  747 F.3d 445 (6th Cir. 2014).
- [DISH Network v SatFTA](https://cases.justia.com/federal/district-courts/california/candce/5:2008cv01561/201657/53/0.pdf),
  No. 5:08-cv-01561 (N.D. Cal., order of 9 March 2011), copy hosted by Justia.
- Yout v Recording Industry Association of America, No. 3:20-cv-1602 (D.
  Conn.,
  [ruling of 30 September 2022](https://storage.courtlistener.com/recap/gov.uscourts.ctd.141714/gov.uscourts.ctd.141714.61.0.pdf)),
  and the
  [appellees' letter of 31 March 2026](https://storage.courtlistener.com/recap/gov.uscourts.ca2.59200/gov.uscourts.ca2.59200.146.0.pdf)
  in the appeal, No. 22-2760 (2d Cir.); the appeal's archive was checked again 2026-11-20 for documents 147 to 160,
  which it does not hold.
- [Ted Entertainment v ByteDance](https://www.courthousenews.com/wp-content/uploads/2026/10/bytedance-motion-dismiss-ruling.pdf),
  No. 3:25-cv-10933 (N.D. Cal. 2 October 2026), copy hosted by a news service.
- [Lenz v Universal Music](https://cdn.ca9.uscourts.gov/datastore/opinions/2016/03/17/13-16106.pdf),
  cases 13-16106 and 13-16107 (9th Cir., amended opinion of 17 March 2016).
- [Nintendo of America v Tropic Haze, joint motion of 4 March 2024](https://storage.courtlistener.com/recap/gov.uscourts.rid.56980/gov.uscourts.rid.56980.10.0.pdf),
  No. 1:24-cv-00082 (D.R.I.).
- [Nintendo of America v Storman](https://storage.courtlistener.com/recap/gov.uscourts.cacd.758131/gov.uscourts.cacd.758131.87.0.pdf),
  No. 2:19-cv-07818 (C.D. Cal.), complaint, orders of 26 May and 5 August 2021, and judgment: documents
  [1](https://storage.courtlistener.com/recap/gov.uscourts.cacd.758131/gov.uscourts.cacd.758131.1.0.pdf),
  [75](https://storage.courtlistener.com/recap/gov.uscourts.cacd.758131/gov.uscourts.cacd.758131.75.0.pdf), 87, and
  [89](https://storage.courtlistener.com/recap/gov.uscourts.cacd.758131/gov.uscourts.cacd.758131.89.0.pdf).
- Nintendo of America v Keighin, No. 1:24-cv-03101
  (D. Colo.),
  [recommendation of 3 October 2025](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.36.0.pdf),
  [order](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.37.0.pdf) and
  [judgment](https://storage.courtlistener.com/recap/gov.uscourts.cod.238647/gov.uscourts.cod.238647.38.0.pdf) of 29
  October 2025; first read in part, then each read in full 2026-11-20.
- Nintendo of America v Williams, No. 2:24-cv-00960
  (W.D. Wash.),
  [order](https://storage.courtlistener.com/recap/gov.uscourts.wawd.336727/gov.uscourts.wawd.336727.29.0.pdf)
  and [judgment](https://storage.courtlistener.com/recap/gov.uscourts.wawd.336727/gov.uscourts.wawd.336727.30.0.pdf) of
  23 September 2026.
- [Nintendo of America v Daly, judgment of 26 September 2025](https://torrentfreak.com/images/nintendo-daly197112005041.pdf),
  No. 2:24-cv-00958 (W.D. Wash.), copy hosted by a news site.
- [Nintendo of America v Mathias Designs, judgment form lodged on 9 November 2018](https://torrentfreak.com/images/romsjudg.pdf),
  No. 2:18-cv-02282 (D. Ariz.), copy hosted by a news site.
- Sony Computer Entertainment America v Hotz, No. 3:11-cv-00167
  (N.D. Cal.),
  [complaint caption](https://archive.org/download/gov.uscourts.cand.235965/gov.uscourts.cand.235965.1.0.pdf)
  and [consent judgment](https://www.eff.org/files/geohotz-finaljudgmentpi.pdf).
- [Sega Enterprises v MAPHIA](https://static.case.law/f-supp/948/cases/0923-01.json), 948 Federal Supplement 923
  (N.D. Cal. 1996).
- [New Kids on the Block v News America Publishing](https://law.resource.org/pub/us/case/reporter/F2/971/971.F2d.302.90-56258.90-56219.html),
  971 F.2d 302 (9th Cir. 1992).
- [Playboy Enterprises v Welles](https://law.resource.org/pub/us/case/reporter/F3/279/279.F3d.796.00-55538.00-55537.00-55229.00-55009.html),
  279 F.3d 796 (9th Cir. 2002).
- [Toyota Motor Sales v Tabari](https://cdn.ca9.uscourts.gov/datastore/opinions/2010/07/08/07-55344.pdf), 610 F.3d 1171
  (9th Cir. 2010).
- [Century 21 Real Estate v LendingTree](https://law.resource.org/pub/us/case/reporter/F3/425/425.F3d.211.03-4700.html),
  425 F.3d 211 (3d Cir. 2005).
- [International Information Systems Security Certification Consortium v Security University](https://www.govinfo.gov/content/pkg/USCOURTS-ca2-14-03456/pdf/USCOURTS-ca2-14-03456-0.pdf)
  (2d Cir. 2016).
- [Jack Daniel's Properties v VIP Products](https://www.supremecourt.gov/opinions/22pdf/22-148_3e04.pdf), 599 U.S.
  140 (2023).
- [TrafFix Devices v Marketing Displays](https://www.law.cornell.edu/supct/html/99-1571.ZO.html), 532 U.S.
  23 (2001).
- [Commil USA v Cisco Systems](https://www.law.cornell.edu/supremecourt/text/13-896), 575 U.S.
  632 (2015).
- [Global-Tech Appliances v SEB](https://www.law.cornell.edu/supct/html/10-6.ZO.html), 563 U.S.
  754 (2011).
- [Madey v Duke University](https://law.resource.org/pub/us/case/reporter/F3/307/307.F3d.1351.01-1567.html),
  307 F.3d 1351 (Fed. Cir. 2002).
- [Curver v Home Expressions](https://law.berkeley.edu/wp-content/uploads/2021/07/2019-09-12_Curver-HomeExpressions_FedCircuitOpinion.pdf),
  (Fed. Cir. 12 September 2019), a university's copy, read 2026-11-20; the court's own copy failed certificate
  verification and was not fetched another way.

Decisions outside the United States:

- [Nintendo v PC Box](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62012CJ0355), C-355/12.
- [Ranks and Vasiļevičs](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62015CJ0166), C-166/15.
- [Gillette v LA-Laboratories](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:62003CJ0228), C-228/03.
- [Arsenal Football Club v Reed](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62001CJ0206), C-206/01,
  read 2026-11-20.
- [Google France](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:62008CJ0236), C-236/08,
  read 2026-11-20.
- [Sony Computer Entertainment v Ball](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2004/1738) [2004] EWHC 1738 (Ch).
- [R v Higgs](https://caselaw.nationalarchives.gov.uk/ewca/crim/2008/1324) [2008] EWCA Crim 1324.
- [R v Gilham](https://caselaw.nationalarchives.gov.uk/ewca/crim/2009/2293) [2009] EWCA Crim 2293.
- [Nintendo v Playables](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2010/1932) [2010] EWHC 1932 (Ch).
- [Nintendo v Sky UK](https://caselaw.nationalarchives.gov.uk/ewhc/ch/2019/2376) [2019] EWHC 2376 (Ch).
- [BASCA v Secretary of State](https://caselaw.nationalarchives.gov.uk/ewhc/admin/2015/2041) [2015] EWHC 2041 (Admin).
- [German Federal Court of Justice, I ZR 124/11](https://rws-verlag.de/fileadmin/zbb-volltexte-3/i_zr_124-11a.pdf)
  (27 November 2014), publisher-hosted copy.
- [German Federal Court of Justice, I ZR 273/14](https://www.rechtsprechung-im-internet.de/jportal/?quelle=jlink&docid=KORE300792017&psml=bsjrsprod.psml&max=true)
  (2 March 2017), on the federal case-law portal, document `KORE300792017`; the full text read 2026-11-20 in a
  [private mirror](https://gesetze.co/urteile/I_ZR_273-14) whose headnote and dates match the portal's record.
- [LTO, announcement of King & Wood Mallesons on the Nintendo case](https://www.lto.de/recht/kanzleien-unternehmen/k/king-wood-mallesons-nintendo-kopierschutz-gewerblicher-rechtsschutz)
  (20 October 2016), read 2026-11-20.
- [Nintendo of America v King](https://decisions.fct-cf.gc.ca/fc-cf/decisions/en/item/223922/index.do), 2017 FC 246.
- Searches of the [Federal Court](https://decisions.fct-cf.gc.ca/fc-cf/en/nav.do)
  and [Federal Court of Appeal](https://decisions.fca-caf.gc.ca/fca-caf/en/nav.do) decisions databases, 2026-11-20.
- [Stevens v Sony](https://www.wipo.int/wipolex/en/text/580968) [2005] HCA 58, copy on WIPO Lex.
- [Forum claim FA2207002006456, Nintendo of America v Abelo Achante](https://www.adrforum.com/DomainDecisions/2006456.htm).

Takedown notices and host policy:

- [GitHub DMCA notice archive](https://github.com/github/dmca), README and the notices cited by month, among them the
  [notice of 12 February 2026](https://github.com/github/dmca/blob/master/2026/02/2026-02-12-nintendo.md), read again
  2026-11-20.
- [GitHub DMCA Takedown Policy](https://docs.github.com/en/site-policy/content-removal-policies/dmca-takedown-policy).
- [Google, "About Lumen"](https://support.google.com/legal/answer/12158374).

Makers' terms, statements, and guidelines:

- PlayStation system software pages and licence agreements:
  [PS5 system software page](https://www.playstation.com/en-us/support/hardware/ps5/system-software/),
  [PS5 licence](https://www.playstation.com/en-us/legal/ps5-ssla/),
  [PS3 licence](https://doc.dl.playstation.net/doc/ps3-eula/ps3_eula_en.html),
  [PS4 licence](https://doc.dl.playstation.net/doc/ps4-eula/ps4_eula_en.html),
  and [Vita licence](https://doc.dl.playstation.net/doc/psvita-eula/psvita_eula_en.html).
  The system software page describes downloads but is not one, and no file was opened.
- [PlayStation Software Usage Terms](https://www.playstation.com/en-us/legal/software-eula/).
- [Xbox Software License Terms](https://support.xbox.com/en-US/help/hardware-network/warranty-service/xbox-software-license-agreement)
  and [Xbox error E101 page](https://support.xbox.com/en-US/help/errors/error-code-e101), read 2026-11-20 with a
  browser, because the pages render by script.
  The update file that the E101 page offers was not opened, and its address is not given.
- [Microsoft Services Agreement](https://www.microsoft.com/en-us/servicesagreement), effective 30 September 2026.
- [Microsoft Trademark and Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks),
  and [Game Content Usage Rules](https://www.xbox.com/en-US/developers/rules).
- [Nintendo Account User Agreement](https://accounts.nintendo.com/term/eula/US?lang=en-US), May 2025, and an
  [archived copy of the April 2021 version](https://web.archive.org/web/20250303232702/https://accounts.nintendo.com/term/eula/US?lang=en-US),
  captured 3 March 2025 at 23:27:02.
- [Nintendo Switch 2 User Agreement](https://en-americas-support.nintendo.com/app/answers/detail/a_id/68586),
  October 2026.
- [Nintendo, "Intellectual Property & Piracy FAQ"](https://en-americas-support.nintendo.com/app/answers/detail/a_id/55888).
- [Nintendo, legal information page](https://web.archive.org/web/20170101225939/http://www.nintendo.com/corp/legal.jsp),
  archived on 1 January 2017 at 22:59:39.
- [Nintendo Game Content Guidelines](https://www.nintendo.co.jp/networkservice_guideline/en/index.html),
  updated 2 September 2024.
- [Nintendo of Europe, copyright page](https://www.nintendo.com/en-gb/Legal-information/Copyright/Copyright-625949.html).
- Nintendo press releases of [19 January 2016](https://www.nintendo.co.jp/corporate/release/2016/160119.html)
  and [19 September 2024](https://www.nintendo.co.jp/corporate/release/en/2024/240919.html).
- [Sega, Streaming Guideline](https://www.sega.co.jp/en/streaming_guideline/), updated 19 October 2026.
- [Apple, App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/), updated 16 October 2026.
- [Google Play, Intellectual Property policy](https://support.google.com/googleplay/android-developer/answer/9888072?hl=en).

Emulator projects, prose only:

- [Dolphin, FAQ](https://dolphin-emu.org/docs/faq/), and
  [blog post of 20 July 2023](https://web.archive.org/web/20241221001744/https://dolphin-emu.org/blog/2023/07/20/what-happened-to-dolphin-on-steam/)
  in an archived copy captured 21 December 2024 at 00:17:44, because the live blog refuses automated requests.
- PCSX2, [BIOS documentation](https://pcsx2.net/docs/setup/bios/)
  and ["Trademark and Copyright"](https://pcsx2.net/intellectualproperty).
- [PPSSPP, FAQ](https://www.ppsspp.org/docs/faq/).
- [Vita3K, quickstart](https://vita3k.org/quickstart.html).
- [Delta, release notes](https://faq.deltaemulator.com/release-notes).
- Websites of [RetroArch](https://www.retroarch.com/), [Azahar](https://azahar-emu.org/), and [mGBA](https://mgba.io/).
- Azahar release notes, [2120](https://github.com/azahar-emu/azahar/releases/tag/2120)
  and [2124.3](https://github.com/azahar-emu/azahar/releases/tag/2124.3), read 2026-11-20.
- README files, read as raw files from each repository: [mGBA](https://github.com/mgba-emu/mgba),
  [SkyEmu](https://github.com/skylersaleh/SkyEmu), [SameBoy](https://github.com/LIJI32/SameBoy),
  [melonDS](https://github.com/melonDS-emu/melonDS), [RPCS3](https://github.com/RPCS3/rpcs3), and DuckStation,
  whose repository `github.com/stenzek/duckstation` is closed tier and so is not linked.
- [Pan Docs, "Power-Up Sequence"](https://gbdev.io/pandocs/Power_Up_Sequence.html)
  and ["The Cartridge Header"](https://gbdev.io/pandocs/The_Cartridge_Header.html), the latter read again 2026-11-20.

Patents and patent practice:

- Google Patents page for US 6,672,963, `https://patents.google.com/patent/US6672963B1/en`,
  and sibling pages for US 7,445,551, US 7,988,556, and the others described.
  The address is not linked for now only because the host refuses automated requests
  (HTTP 503 on 2026-11-20) and is not yet in the link checker's list of such hosts; it is safe to open.
- United States Patent Office copies of
  [US 6,672,963](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/6672963),
  [US 7,445,551](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7445551), and
  [US 7,988,556](https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/7988556), and sibling documents; front
  pages read again 2026-11-20 by text recognition of the page images.
- Via Licensing Alliance pages and lists: [MPEG-2](https://www.via-la.com/licensing-2/mpeg-2/),
  [AVC](https://www.via-la.com/licensing-2/avc-h-264/), [AAC](https://www.via-la.com/licensing-2/aac/),
  and [VC-1](https://www.via-la.com/licensing-2/vc-1/), the VC-1 list dated 1 November 2026 read 2026-11-20.
- [Fraunhofer IIS, mp3](https://www.iis.fraunhofer.de/en/ff/amm/consumer-electronics/mp3.html).
- [DRI wiki, "S3TC"](https://dri.freedesktop.org/wiki/S3TC/),
  and [Mesa 17.3.0 release notes](https://docs.mesa3d.org/relnotes/17.3.0.html).
- [FFmpeg, legal page](https://ffmpeg.org/legal.html).
- [VideoLAN, legal page](https://www.videolan.org/legal.html).
- Debian, ["Position on Software Patents"](https://www.debian.org/legal/patent)
  and ["Community Distribution Patent Policy FAQ"](https://www.debian.org/reports/patent-faq).
- [Open Invention Network, "Linux System"](https://openinventionnetwork.com/linux-system/).
- [Open Source Initiative, statement on the GNOME settlement](https://opensource.org/?p=19712).
- Pocketpair, statements of [8 November 2024](https://www.pocketpair.jp/en/news/report-on-patent-infringement-lawsuit/)
  and [8 May 2025](https://www.pocketpair.jp/en/news/regarding-the-lawsuit-changes-to-palworld-and-the-future/).
- [Immersion, annual report for 2006](https://www.sec.gov/Archives/edgar/data/0001058811/000089161807000164/f27349e10vk.htm).

Secondary sources:

- [MacTech, "Sony and Connectix Announce Agreement"](https://www.mactech.com/content/sony-and-connectix-announce-agreement-0)
  (16 March 2001).
- [MacTech, reprint of a Connectix press release](https://www.mactech.com/2000/05/17/court-dismisses-all-sony-copyright-and-tm-claims-in-connectix-case/)
  (17 May 2000).
- [PC Gamer, report on Ryujinx](https://www.pcgamer.com/gaming-industry/switch-emulator-ryujinx-goes-offline-after-creator-gets-an-offer-from-nintendo-they-cant-refuse)
  (1 October 2024).
- Electronic Frontier Foundation, legal primer on the 2007 disc key
  (May 2007): `https://www.eff.org/deeplinks/2007/05/09-f9-legal-primer`.
  It is not linked, because the page discusses a published key and may reproduce it.
- Association of Copyright for Computer Software,
  announcements of [2019](https://www2.accsjp.or.jp/activities/2019/news114.php)
  and [2020](https://www2.accsjp.or.jp/activities/2020/news120.php).
- [Famitsu](https://www.famitsu.com/article/202501/30093)
  (10 January 2025) and [Denfaminicogamer](https://news.denfaminicogamer.jp/kikakuthetower/250112a) (12 January 2025).
- [Anime News Network](https://www.animenewsnetwork.com/news/2025-04-16/japanese-man-sentenced-for-illegally-modifying-2nd-hand-nintendo-switch-units/.223571)
  (16 April 2025) and
  [Automaton](https://automaton-media.com/en/news/four-men-referred-to-prosecution-for-selling-modified-nintendo-switch-consoles-in-japan/)
  (19 March 2026).
- [Punto Informatico](https://www.punto-informatico.it/modchip-nintendo-vince-a-milano/) (17 November 2015).
- The Register, reports of [16 February](https://www.theregister.com/2000/02/16/sony_slaps_patent_suit/),
  [19 May](https://www.theregister.com/2000/05/19/sony_hits_playstation_emulator_developer/),
  [30 June](https://www.theregister.com/2000/06/30/sony_surrenders_playstation_emulation_fight/),
  and [6 September 2000](https://www.theregister.com/2000/09/06/sony_playstation_emulator_trial_date/),
  and [12 March 2004](https://www.theregister.com/2004/03/12/nintendo_patents_handheld_emulation_software/);
  the addresses of all but the first were found again 2026-11-20.
- [Zophar's Domain, news archive](https://www.zophar.net/news-archive/nintendo-patents-certain-emulators-6614.html).
- [Gigazine, on the expiry of AC-3 patents](https://gigazine.net/gsc_news/en/20170321-ac-3-patent-expired)
  (21 March 2017), read 2026-11-20.
- [TorrentFreak, on EmuParadise](https://torrentfreak.com/nintendo-rom-fallout-emuparadise-terminates-all-game-downloads-180809/)
  (9 August 2018).
- [Nintendo Life, on Skyline](https://www.nintendolife.com/news/2023/05/switch-android-emulator-skyline-halts-development-due-to-potential-legal-risks)
  (May 2023).
- [Android Authority](https://www.androidauthority.com/emulators-for-android-shut-down-pulled-play-store-3424602/)
  (12 March 2024).
- TechCrunch,
  [15 April](https://techcrunch.com/2024/04/15/apple-pulls-a-game-boy-emulator-for-app-store-violations-but-says-game-emulators-are-allowed)
  and [17 May 2024](https://techcrunch.com/2024/05/17/adobe-comes-after-indie-game-emulator-delta-for-copying-its-logo).
