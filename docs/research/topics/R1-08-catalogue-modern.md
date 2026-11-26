---
title: "Modern consoles and handhelds, including systems on sale today: catalogue"
roadmap_item: R1-08
status: approved
date: 2026-11-21
---

# Modern consoles and handhelds, including systems on sale today: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold from the seventh generation to 2026-11-20,
and what hardware, protection, system software, and sources each has.

The three surveyed families take 19 rows, one per model with its revisions, plus the PlayStation Portal,
listed once as a streaming client and not a system to emulate.

The other tables hold 5 minor dedicated consoles, 6 cross-references to [`R1-07`](R1-07-catalogue-sixth-generation.md),
49 emulator hosts, 3 devices listed under other systems, and 3 systems announced but not sold (counted from the tables).

[psdevwiki](https://www.psdevwiki.com/) and [SwitchBrew](https://switchbrew.org/wiki/Main_Page) give model-level data
for the PlayStation and Nintendo families.
Microsoft's Hot Chips talks, product pages, and spec sheet cover the Xbox One, Series X, and Series S,
and Blaze's page the Evercade VS; every other row rests on Wikipedia alone.

Two facts matter most to Rustalgia.
First, every surveyed family is still sold or supported as of 2026-11-20, and each had a system software release in 2026
(from the findings below; for the Xbox,
by ["Xbox system software"](https://en.wikipedia.org/w/index.php?oldid=1386323584),
while the ["Xbox One"](https://en.wikipedia.org/w/index.php?oldid=1386323575) infobox gives an older version).

Second, this note reads the owner's "Dedicated consoles only"
([pull request #18](https://github.com/jsamuelsen11/rustalgia-emu/pull/18), "Request")
as a test: a device sold to run other systems' games is a host.
So the Evercade line, the Atari VCS, and the Linux handhelds are hosts,
and clones are listed under the systems they copy.

Four points stay open, listed under [Open questions](#open-questions): the Portal's Snapdragon part,
the Evercade VS's core type, on which two Wikipedia articles disagree, the PS4's first sale in mainland China,
and the licence of each MiSTer core.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds were sold from the seventh generation to 2026-11-20, and for each,
  what are its maker, release, processor, graphics, media, protection, system software, survey, and sources?
- Covered: every model and revision of the systems whose family surveys depend on [`R1-04`](R1-04-primer-modern.md)
  ([`R1-14`](../../roadmap/research.md#system-family-surveys),
  [`R1-21`](../../roadmap/research.md#system-family-surveys),
  [`R1-23`](../../roadmap/research.md#system-family-surveys),
  as ["How the catalogue is built"](#how-the-catalogue-is-built) sets out), from the PlayStation 3, Xbox One,
  and Switch onward; other dedicated game devices first sold after 2005-11-21,
  and lines of them that continue from earlier years; emulator hosts as a list; and systems announced but not sold.
- Left to others: how the hardware works to the primer ([`R1-04`](R1-04-primer-modern.md));
  each family's emulators to its survey; the law on encryption and keys to [`R0-02`](R0-02-legal-baseline.md);
  each hub's evaluation to [`R0-05`](R0-05-source-map.md);
  emulator hosts as platforms to [`R3-07`](../../roadmap/research.md#phase-3-host-platforms)
  and [`R3-12`](../../roadmap/research.md#phase-3-host-platforms).
  The Wii, Wii U, 3DS, and Vita are in the previous era's catalogue ([`R1-07`](R1-07-catalogue-sixth-generation.md)),
  by their surveys; the Xbox 360 is there by a placement the two catalogues share
  (inference; [`R1-07`](R1-07-catalogue-sixth-generation.md),
  Scope and ["Boundary cases"](R1-07-catalogue-sixth-generation.md#boundary-cases)).
- Researched on 2026-11-20 against the Wikipedia revisions, wiki revisions, archive captures, maker pages,
  and conference slides listed in Sources.
  Every statement about a system on sale is as of 2026-11-20.
- Research: two research agents each covered a share
  (the surveyed families; every other device)
  and read every page as raw text, Wikipedia
  and [SwitchBrew](https://switchbrew.org/wiki/Main_Page) through their raw wikitext,
  and [psdevwiki](https://www.psdevwiki.com/) through existing web archive captures,
  because the live site served a challenge page (research log).
- Verification: three independent passes ran, each fetching the sources again on 2026-11-20 (research log).
  The first two, each split among six or seven verifiers by section, tested every claim and quotation,
  274 claims in the first and 304 in the second.
  A rework pass then answered the draft's open questions from the sources listed in [Sources](#sources),
  quoting only text matched in the raw pages.
  The third pass tested the rework's new and changed lines, with one verifier on claims and one on links and shape.
  After each pass, a fix pass checked every finding against the raw sources and applied those that held;
  the claims the verifiers could not check are weakened, marked, or dropped here, and listed in the pull request.
- Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed. "(inference)" marks reasoning,
  and "(research log)" an event while gathering the evidence.
  A statement that nothing was found records the searches made, not proof of absence.
- No firmware, key, game, development kit, exploit, or emulator code was opened (research log).

## Findings

### How the catalogue is built

- An era holds the systems whose family survey depends on its primer
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers)).
  [`R1-14`](../../roadmap/research.md#system-family-surveys)
  (Switch and Switch 2),
  [`R1-21`](../../roadmap/research.md#system-family-surveys)
  (PlayStation 3, 4, and 5),
  and [`R1-23`](../../roadmap/research.md#system-family-surveys)
  (Xbox, Xbox 360, and later)
  depend on [`R1-04`](R1-04-primer-modern.md);
  [`R1-23`](../../roadmap/research.md#system-family-surveys) also depends on
  [`R1-03`](R1-03-primer-sixth-generation.md), so the rule places its systems in both eras.
  The two catalogues place the original Xbox and the Xbox 360 in [`R1-07`](R1-07-catalogue-sixth-generation.md)
  and start this one at the Xbox One (inference; [`R1-07`](R1-07-catalogue-sixth-generation.md), Scope,
  ["Home consoles"](R1-07-catalogue-sixth-generation.md#home-consoles),
  and ["Boundary cases"](R1-07-catalogue-sixth-generation.md#boundary-cases)).
- Every device is listed in one catalogue only; the others carry a one-line cross-reference row.
  A device that no survey places goes by its first sale: to 2000 in [`R1-06`](R1-06-catalogue-32-and-64-bit.md),
  from 2001 to 2005-11-21 in [`R1-07`](R1-07-catalogue-sixth-generation.md), and after that here.
  The cut-off is the Xbox 360's first sale, which began the seventh generation of home consoles
  (["Seventh generation of video game consoles"](https://en.wikipedia.org/w/index.php?oldid=1386320369), lead section);
  the placement is a project call for the catalogues.
- Four devices are placed against that date.
  The GP2X line is listed here with its successors, though the first GP2X was sold in South Korea on 2005-11-10.
  V.Flash, HyperScan, and V.Smile Baby, first sold in 2006,
  stay in [`R1-07`](R1-07-catalogue-sixth-generation.md) beside the minor home systems it lists,
  as V.Smile Baby is part of its V.Smile line there
  ([`R1-07`, "Minor and educational home systems"](R1-07-catalogue-sixth-generation.md#minor-and-educational-home-systems)).
- The roadmap lists "PC and Android handhelds, microconsoles, FPGA devices,
  and retro 'mini' consoles" as emulator hosts, not systems to emulate
  ([roadmap, "Hardware primers"](../../roadmap/research.md#hardware-primers)).
  The owner's answer of 2026-11-20 was "Dedicated consoles only", with those classes left to the host items
  ([pull request #18](https://github.com/jsamuelsen11/rustalgia-emu/pull/18), "Request").
  This note reads that answer as a test, a process call that the pull request lists:
  a device sold to run emulators of other systems is a host.
  A clone that reproduces an older system is listed under that system,
  and a home computer goes to [`R1-25`](../../roadmap/research.md#system-family-surveys).
- A row is one model, or a model with its revisions where they run the same software.
  "Hub" names the best registered hardware source other than Wikipedia;
  a dash means no hardware source other than Wikipedia was cited.
- Regions: NA North America, US United States, EU Europe, UK United Kingdom, JP Japan, KR South Korea, AU Australia,
  NZ New Zealand, HK Hong Kong, TW Taiwan, CN mainland China, BR Brazil.
- Release dates are Wikipedia's: the article on the console,
  or ["PlayStation 3 models"](https://en.wikipedia.org/w/index.php?oldid=1386319150) for the PS3 Slim and Super Slim,
  unless a row names a maker. [psdevwiki](https://www.psdevwiki.com/)'s dates differ in month for several PS3 models;
  the finding below names them.

### PlayStation family

| Model (codes) | First release | Survey | Hub |
|---|---|---|---|
| PlayStation 3 (CECHA to CECHQ) | JP 2006-11-11; NA, HK, TW 2006-11-17; EU, AU 2007-03-23 | [`R1-21`] | psdevwiki |
| PlayStation 3 Slim (CECH-20xx to 30xx) | NA, EU 2009-09-01; JP, AU, NZ 2009-09-03 | [`R1-21`] | psdevwiki |
| PS3 Super Slim (CECH-40xx to 43xx) | NA 2012-09-25 (250 GB); AU 2012-09-27; UK 2012-09-28 | [`R1-21`] | psdevwiki |
| PlayStation 4 (CUH-10xx to 12xx) | NA 2013-11-15; EU, AU 2013-11-29; JP 2014-02-22 | [`R1-21`] | psdevwiki |
| PlayStation 4 Slim (CUH-20xx to 22xx) | 2016-09-15 | [`R1-21`] | psdevwiki |
| PlayStation 4 Pro (CUH-70xx to 72xx) | worldwide 2016-11-10 | [`R1-21`] | psdevwiki |
| PS5 and PS5 Digital (CFI-10xx to 12xx) | NA, JP, KR, AU, NZ 2020-11-12; most others 11-19 | [`R1-21`] | psdevwiki |
| PlayStation 5 Slim and Slim Digital (CFI-20xx) | 2023-11 | [`R1-21`] | psdevwiki, partly |
| PlayStation 5 Pro (CFI-70xx, 71xx) | worldwide 2024-11-07 | [`R1-21`] | psdevwiki |
| PlayStation Portal: streaming client, not a system to emulate | JP, NA, EU, AU 2023-11-15 | none | — |

| Model | CPU | Graphics | Memory | Media and storage |
|---|---|---|---|---|
| PlayStation 3 | Cell 3.2 GHz: 1 PPE, 7 SPEs | RSX 500 MHz | 256 MB XDR, 256 MB GDDR3 | BD, DVD, CD; HDD 20 to 160 GB |
| PS3 Slim | Cell, 45 nm | RSX, 65 then 40 nm | as PS3 | BD, DVD, CD; HDD 120 to 320 GB |
| PS3 Super Slim | Cell, 45 nm | RSX, 40 or 28 nm | as PS3 | BD, DVD, CD; flash or HDD |
| PlayStation 4 | 8 Jaguar cores, 1.6 GHz | GCN, 18 CUs, 800 MHz | 8 GB GDDR5, 256 MB DDR3 | BD, DVD; HDD |
| PS4 Pro | 8 Jaguar cores, 2.13 GHz | GCN, 36 CUs, 911 MHz | 8 GB GDDR5, 1 GB DDR3 | BD (no UHD BD); HDD 1 or 2 TB |
| PlayStation 5 | 8 Zen 2 cores, to 3.5 GHz | RDNA 2, 36 CUs, to 2.23 GHz | 16 GB GDDR6 | UHD BD (disc); 825 GB SSD |
| PS5 Pro | Zen 2, to 3.85 GHz | 60 CUs, to 2.35 GHz | 16 GB GDDR6, 2 GB DDR5 | 2 TB SSD; no drive |
| PlayStation Portal | Snapdragon, model unclear | 8-inch 1080p LCD | not stated | none |

- Every value in the two tables rests on the Wikipedia articles
  ["PlayStation 3"](https://en.wikipedia.org/w/index.php?oldid=1386319117),
  ["PlayStation 3 models"](https://en.wikipedia.org/w/index.php?oldid=1386319150),
  ["PlayStation 4"](https://en.wikipedia.org/w/index.php?oldid=1386319169),
  ["PlayStation 5"](https://en.wikipedia.org/w/index.php?oldid=1385515902), and
  ["PlayStation Portal"](https://en.wikipedia.org/w/index.php?oldid=1382191333) (infoboxes and "Technical
  specifications" or "Hardware" sections), except where a bullet below names another source.
  Model codes come from psdevwiki's "SKU Models" pages
  for the [PS3](https://web.archive.org/web/20261107043400/https://www.psdevwiki.com/ps3/SKU_Models),
  [PS4](https://web.archive.org/web/20260710164056/https://www.psdevwiki.com/ps4/SKU_Models),
  and [PS5](https://web.archive.org/web/20260312145723/https://www.psdevwiki.com/ps5/SKU_Models);
  process sizes come from the PS3 one only, and the PS4 Pro's 2 TB drive from the PS4 one
  (CUH-72xx row; Wikipedia gives 2 TB only for the family).
- The PS3's Cell has one PowerPC-based PPE and seven working SPEs,
  of which six are available to games and one is reserved for the operating system
  ("PlayStation 3", "Technical specifications").
  The RSX's core clock is 500 MHz in that article's infobox
  and in ["RSX Reality Synthesizer"](https://en.wikipedia.org/w/index.php?oldid=1318869943), "Specifications";
  the latter's 550 MHz is the clock at which some of its figures were measured, against the shipped 500 MHz
  (same article, "Speed, bandwidth and latency").
- PS2 compatibility differs by model: CECHA and CECHB do it in hardware, CECHC and CECHE by software,
  and later models not at all (psdevwiki,
  [PS3 "SKU Models"](https://web.archive.org/web/20261107043400/https://www.psdevwiki.com/ps3/SKU_Models),
  column "PS2 mode").
  Of the CECHC and CECHE units, Wikipedia says "it retains the 'Graphics Synthesizer' GPU resulting in a hybrid hardware
  and software emulation" ("PlayStation 3 models", "Original model").
  Every model runs original PlayStation games in software (same article).
- psdevwiki's "SKU Release date" column differs from Wikipedia's "First available" dates in month
  for several original models, for example 8/2006 for CECHA and CECHB against Wikipedia's November 2006
  (psdevwiki, PS3 "SKU Models"; "PlayStation 3 models").
  The page does not say what its dates mean; that they track manufacture rather than first retail sale is an inference.
- The Super Slim's flash model is "12 GB" in "PlayStation 3 models" and 16 GB of eMMC in "PlayStation 3"
  (infobox and "Super Slim model"); psdevwiki's row gives 16 GB of eMMC, 12 GB total and 8.9 GB usable.
  The row's NA date of 2012-09-25 is the 250 GB bundle; the 500 GB model's NA date is 2012-10-30
  ("PlayStation 3 models", comparison table).
- The PS3's system software was at version 4.93, dated 2026-03-18,
  and Wikipedia says it "continues to be updated as of 2026 for performance and security enhancements,
  and to renew the Blu-ray encryption key"
  (Wikipedia, "PlayStation 3 system software", revision 1386319155, lead section and infobox; not linked,
  because the register closes the page, which mentions leaked kits).
  Purchased PlayStation Network content is limited to two activated consoles per account,
  the OtherOS feature was removed by firmware 3.21 of 2010-04-01, and every PS3 game but one is region-free
  ("PlayStation 3", "Digital rights management" and "OtherOS support";
  ["Region lock"](https://en.wikipedia.org/w/index.php?oldid=1384605268), "Sony").
- The PS4's APU has two quad-core Jaguar modules, seven cores of which are for games;
  the infobox adds a secondary low-power processor for background tasks,
  and the console also has secondary custom chips for downloads, uploads, and social features, an audio module,
  and a hardware zlib decompression module ("PlayStation 4", infobox and "Technical specifications").
  Its system software, Orbis OS, is a fork of FreeBSD 9, at version 14.02 dated 2026-11-04
  (["PlayStation 4 system software"](https://en.wikipedia.org/w/index.php?oldid=1385538186)).
- "Games are not region-locked, so games purchased in one region can be played on consoles in all regions"
  ("PlayStation 4", "Games"), though downloadable content needs an account of its region ("Region lock", "Sony").
- The PS4 Slim and Pro were both announced on 2016-09-07; the Pro added checkerboard-rendering hardware and 4K output
  ("PlayStation 4", "PlayStation 4 Slim", "PlayStation 4 Pro").
  Later Pro revisions are CUH-71xx (late 2017) and CUH-72xx (November 2018)
  (psdevwiki, [PS4 "SKU Models"](https://web.archive.org/web/20260710164056/https://www.psdevwiki.com/ps4/SKU_Models));
  "PlayStation 4", "PlayStation 4 Pro", gives October 2018 for the CUH-7200.
- The PS4's mainland China launch was announced by Sony on 2014-12-11 for 2015-01-11, for the PS4 and the PS Vita
  ([Sony Computer Entertainment, press release of 2014-12-11](https://www.sie.com/corporate/release/2014/141211.html),
  title).
  Reports that it was postponed to 2015-03-20 were found only in search results (lead).
  No maker statement of the date of first sale was found: Sony's release pages for four dates in March 2015 returned 404
  (research log), and "PlayStation 4" gives no mainland China date, so the row gives none.
- The PS5's storage is an 825 GB soldered SSD with a hardware decompression unit for zlib and Oodle Kraken,
  and an M.2 slot for user-installed drives, whose support a system update added in September 2021;
  PS5 games cannot run from USB storage ("PlayStation 5", "Storage architecture").
  Its audio is the "Tempest Engine", and its graphics interface is Sony's "AGC" ("PlayStation 5", "Hardware").
- psdevwiki describes what it calls a "presumably custom" hypervisor on the PS5: "In the PS5 case,
  it is used primarily for Virtualization Based Security (VBS) to protect the kernel integrity"
  (psdevwiki, [PS5 "Hypervisor"](https://web.archive.org/web/20260519183327/https://www.psdevwiki.com/ps5/Hypervisor),
  lead section).
  PS5 games, on disc or downloaded, carry no region codes,
  though region-locked games remain possible and downloadable content still needs an account of its region
  ("Region lock", "Sony").
- The PS5's first release reached "most of the rest of the world" on 2020-11-19,
  and later launches ran to mainland China on 2021-05-15 ("PlayStation 5", infobox and "Marketing and release").
- Later PS5 models: the 1100 series of August 2021, the 1200 series of August 2022, the Slim of November 2023 with 1 TB,
  and a Slim Digital reduced to 825 GB from September 2025, which a citation in the article names CFI-2116
  ("PlayStation 5", "Standard model", "PlayStation 5 Slim", "Internal storage reduction").
  psdevwiki lists the Slim as CFI-20xx, from CFI-2000;
  its capture of 2026-03-12 has no storage column and no CFI-2116 row.
- In the standard and Slim models the last two digits of the model code encode the region,
  for example 00 for Japan and 15 for the United States, Canada, and Mexico; the Pro uses other digits for some regions
  (psdevwiki, [PS5 "SKU Models"](https://web.archive.org/web/20260312145723/https://www.psdevwiki.com/ps5/SKU_Models),
  column "Region").
- The PS5 Pro has a 60-CU GPU that the article calls a mix of RDNA 2 and RDNA 3 with RDNA 4 ray-tracing units,
  machine-learning upscaling called "PSSR", and no disc drive; a second chassis, CFI-7100, followed in September 2025
  ("PlayStation 5", infobox and "PlayStation 5 Pro"; psdevwiki, PS5 "SKU Models").
- As of 2026-11-20 the PS5 had system software update 14 of 2026-09-16 and Sony's figure of 100 million units
  as of 2026-11-10 ("PlayStation 5", "Software updates" and infobox).
  The article carries a banner, dated October 2026, saying parts of it may be outdated.
  In July 2026 Sony announced it would stop producing physical PlayStation game discs from January 2028,
  and later that it would handle the transition "cautiously" ("PlayStation 5", "Marketing and release").
- The PlayStation Portal streams games from a PS5 and, since November 2025,
  from Sony's cloud service for PlayStation Plus Premium,
  "although it does not run any games or media natively on its own"
  ("PlayStation Portal", lead section and "Hardware and technicals").
  It is listed because it is sold as part of the family, and labelled a streaming client,
  so that no survey takes it as a system to emulate.
- The Portal runs a modified Android 13 on a Snapdragon part that the article's text calls "662"
  while linking the article on the Snapdragon 660 ("PlayStation Portal", "Hardware and technicals").
  Reports name the 662, the 680, or a part marked SG4150P; those pages were not opened (lead, from search results).
- Sony's open-source page lists the system software versions whose source it publishes
  ([Sony, open-source software, PlayStation Portal](https://www.playstation.com/en-us/oss/accessories/playstation-portal-remote-player/)).
  The file names in its archive for version 1.0.0, `PS_Portal-1.0.0.zip`
  (a 658 MB download, named and not linked),
  include Qualcomm video-driver folders for several chips, which does not identify one part
  (observed from the archive's central directory only; no file in it was opened, and the copy was deleted).
  The part stays open ([Open questions](#open-questions)).

### Xbox family

| Model (model number) | First release | Survey | Hub |
|---|---|---|---|
| Xbox One (1540; Elite SKU) | 13 markets 2013-11-22; JP 2014-09-04; CN 2014-09-29 | [`R1-23`] | Hot Chips 25 |
| Xbox One S (1681); One S All-Digital | 2016-08-02 (2 TB); All-Digital 2019-05-07 | [`R1-23`] | — |
| Xbox One X (1787) | 2017-11-07 | [`R1-23`] | — |
| Xbox Series X | 2020-11-10; CN 2021-06-10 | [`R1-23`] | Hot Chips 32; Microsoft product page |
| Xbox Series S | 2020-11-10; CN 2021-06-10 | [`R1-23`] | Xbox Wire spec sheet |
| Series refresh models; Series X25 edition | 2023-09-01 (1 TB Series S); 2024-10-15; X25 2026-11-12 | [`R1-23`] | — |

| Model | CPU | Graphics | Memory | Media and storage |
|---|---|---|---|---|
| Xbox One | 8 Jaguar cores, 1.75 GHz | GCN, 12 CUs, 853 MHz | 8 GB DDR3, 32 MB ESRAM | BD, DVD, CD; HDD or SSHD |
| Xbox One S | as One | GCN, 914 MHz | as One | UHD BD (none on All-Digital) |
| Xbox One X | 8 cores, 2.3 GHz | GCN, 40 CUs, 1172 MHz | 12 GB GDDR5 | UHD BD; 1 TB HDD |
| Xbox Series X | 8 Zen 2 cores, 3.8 GHz | RDNA 2, 52 CUs, 1.825 GHz | 16 GB GDDR6: 10 GB and 6 GB | UHD BD; 1 TB SSD |
| Xbox Series S | 8 Zen 2 cores, 3.6 GHz | RDNA 2, 20 CUs, 1.565 GHz | 10 GB GDDR6 | no drive; 512 GB, 1 TB SSD |

- Every value rests on the Wikipedia articles ["Xbox One"](https://en.wikipedia.org/w/index.php?oldid=1386323575)
  and ["Xbox Series X and Series S"](https://en.wikipedia.org/w/index.php?oldid=1386594308)
  (infoboxes, "Internals", "Hardware comparison", and the sections on each model), unless a bullet names another source.
- Microsoft's own descriptions exist for three models.
  For the Xbox One, Microsoft's Hot Chips 25 talk on the main SoC
  ([Sell and O'Connor](https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf)),
  on the registered Hot Chips archive, which [`R1-04`](R1-04-primer-modern.md) already reads
  ([`R1-04`, "Audio"](R1-04-primer-modern.md#audio)).
  For the Series X, Microsoft's Hot Chips 32 talk, "Xbox Series X System Architecture"
  ([Andrews and Grossman](https://hc32.hotchips.org/assets/program/conference/day1/HotChips2020_GPU_Microsoft_Jeff_Andrews_v2.pdf)),
  given on 2020-08-17 ([Hot Chips 32 programme](https://hc32.hotchips.org/), day 1).
  For the Series S and X, Microsoft's product pages
  ([Series S](https://www.xbox.com/en-US/consoles/xbox-series-s),
  [Series X](https://www.xbox.com/en-US/consoles/xbox-series-x)) and the spec sheet in the Xbox Wire post
  that announced the Series S
  ([Microsoft, Xbox Wire, 2020-09-09](https://news.xbox.com/en-us/2020/09/09/introducing-xbox-series-s/)), which give
  each console's processor, graphics, and memory.
- Xbox One release: 13 markets on 2013-11-22, then 26 more in September 2014 including Japan ("Xbox One").
  Mainland China followed on 2014-09-29: Xbox Wire said that day that "today, Xbox One officially launched in China,
  becoming the first video game console to do so in 14 years", at more than 4,000 retail locations in 37 cities
  ([Microsoft, Xbox Wire, 2014-09-29](https://news.xbox.com/en-us/2014/09/29/xbox-one-launches-in-china/)).
  That agrees with the "Xbox One" infobox; the article's sales text gives July 2014.
  Production of the family ended in 2020 (same article).
- The Xbox One's system software runs games and apps in two partitions under a hypervisor:
  "The Xbox System Software contains a heavily modified Hyper-V hypervisor
  (known as NanoVisor)
  as its host OS and two partitions" (["Xbox system software"](https://en.wikipedia.org/w/index.php?oldid=1386323584)).
  Its current version is 10.0.25398.2923 in the "Xbox One" infobox,
  and 10.0.26100.9662 of 2026-11-11 for every Xbox One and Series model in "Xbox system software" (infobox);
  the articles disagree.
- The Xbox One shipped region-free after plans for a region lock; Xbox Series X and Series S are region-free
  (["Region lock"](https://en.wikipedia.org/w/index.php?oldid=1384605268), "Xbox One and Xbox Series X/S").
- The One X's processor is compatible with Jaguar and, by the article, unrelated to Ryzen ("Xbox One", "Xbox One X").
- The Series X has one CPU core for the operating system and two memory pools of different bandwidth
  ("Xbox Series X and Series S", "Xbox Series X").
  Microsoft's slides give the GPU as 1.825 GHz, 52 CUs, and 12 TFLOPS FP32; the memory as "16 GB GDDR6,
  10GB high memory interleave + 6GB low memory interleave", from "20 channels of x16 GDDR6 @ 14Gbps -> 560 GB/s";
  and the CPU as "8x Zen2 CPU cores @ 3.8 GHz, 3.6 GHz w/SMT" (Andrews and Grossman, Hot Chips 32, slide 5).
  Microsoft's Series X page gives the same CPU line and "12 TFLOPS, 52 CUs @1.825 GHz"
  ([Microsoft, "Xbox Series X"](https://www.xbox.com/en-US/consoles/xbox-series-x)).
- The Series S's GPU is "4 TFLOPS, 20 CUs @1.565 GHz Custom RDNA 2 GPU" on Microsoft's page,
  with "10GB GDDR6 128 bit-wide bus" and bandwidth "8GB @ 224 GB/s, 2GB @ 56 GB/s"
  ([Microsoft, "Xbox Series S"](https://www.xbox.com/en-US/consoles/xbox-series-s), "Tech specs").
  That agrees with the 1.565 GHz of the Wikipedia infobox; the article's text gives 1.55 GHz.
- The Series S's CPU runs at 3.6 GHz, or 3.4 GHz with SMT, on Microsoft's spec sheet of 2020-09-09
  ([Microsoft, Xbox Wire, 2020-09-09](https://news.xbox.com/en-us/2020/09/09/introducing-xbox-series-s/),
  embedded [spec sheet image](https://xboxwire.thesourcemediaassets.com/sites/2/2020/09/Tech-Specs-1.jpg), CPU row;
  observed in the image), as in "Xbox Series X and Series S" (infobox and "Comparison").
  The same sheet gives the Series X 3.8 GHz, or 3.6 GHz with SMT; Wikipedia gives 3.66 GHz with SMT (same places).
  Microsoft's Series S product page gives "8X Cores @ 3.8 GHz (3.6 GHz w/SMT)", the line from its Series X page
  ([Microsoft, "Xbox Series S"](https://www.xbox.com/en-US/consoles/xbox-series-s), "Tech specs");
  against the spec sheet and Wikipedia, that line is an error on the page (inference).
  The Hot Chips 32 talk does not cover the Series S (a search of its text for "Series S" found no match).
- Series storage is a custom NVMe SSD with a decompression block for zlib and a proprietary "BCPack" algorithm
  for textures, expansion through proprietary cards, and no running of native games from USB
  ("Xbox Series X and Series S", "Xbox Velocity Architecture").
  Microsoft's slides name an "MSP" block for cryptography, hashing, and decompression at the SSD's bandwidth
  (Andrews and Grossman, Hot Chips 32, slide 8).
- "The console has dedicated audio hardware acceleration"
  ("Xbox Series X and Series S", "Video and audio rendering technologies").
  Microsoft's slides list the Series X audio engines: CFPU2 DSPs, an Opus decoder and sample-rate converter (MOVAD),
  and "Logan", with four DSP cores and XMA decoding (Andrews and Grossman, Hot Chips 32, slide 8).
- The Xbox One was designed with hardware support for the Xbox 360's XMA audio format and texture processing
  ("Xbox One", "Xbox 360 compatibility").
  Microsoft's Hot Chips 25 slides show its audio processors among 15 special-purpose processors:
  vector and scalar DSP cores, two of them 128-bit SIMD floating-point vector cores, and fixed-function engines
  (Sell and O'Connor, Hot Chips 25, slides 4 and 7; observed by OCR,
  as [`R1-04`, "Audio"](R1-04-primer-modern.md#audio), reads them).
- Security processors: the Series X has an "HSP/Pluton" block, a root of trust that also does cryptography,
  and its memory has "full BW crypto, integrity check regions" (Andrews and Grossman, Hot Chips 32, slides 5 and 8).
  The slides also name a block that holds hardware keys; this note records only that keys exist and are excluded.
  No security processor for the Xbox One is described in the sources searched: "Xbox One", "Xbox Series X and Series S",
  and "Xbox system software" for "SHAPE", "audio processor", "Pluton", and "security",
  and an OCR text of all 18 Hot Chips 25 slides for the stems of "security" and "cryptography" and for "trust", "boot",
  and "key".
- Every retail Xbox One and Series X|S console can enter Developer Mode through the Xbox Dev Mode app;
  "In Developer Mode, you can develop and test software for the console,
  but you cannot play retail games or run retail apps"
  ([Microsoft Learn, "Xbox Developer Mode activation"](https://learn.microsoft.com/en-us/previous-versions/windows/uwp/xbox-apps/devkit-activation),
  "How Developer Mode works").
  It runs UWP apps and games and needs a Partner Center developer account;
  a UWP game in the foreground gets 5 GB of memory, "4 exclusive and 2 shared CPU cores",
  and full access to available GPU cycles
  ([Microsoft Learn, "System resources for UWP apps and games on Xbox One"](https://learn.microsoft.com/en-us/previous-versions/windows/uwp/xbox-apps/system-resource-allocation)).
  A test program the project wrote could run there under those limits, without a native game's access (inference).
- The developer account's terms are Microsoft's
  ["App Developer Agreement"](https://learn.microsoft.com/en-us/legal/windows/agreements/app-developer-agreement),
  version 8.11, published 2026-03-17 and effective 2026-04-17, which governs the use of Partner Center and the Store.
  Its testing clause lets a developer unlock "a reasonable number of Windows Devices",
  only to test and evaluate the developer's own apps,
  and defines a Windows Device as "an electronic device that is capable of running Apps" (sections 3.c.i and 1.ee).
  A search of its text for "Developer Mode", "emulat", "reverse engineer", "decompil",
  and "disassembl" matched only Exhibit G's bans on reverse engineering an application,
  terms between a customer and its publisher.
  So a test program the project wrote may fall within the clause's purpose, if a console counts
  as such a device (inference); the risk that a test seeks more than an app's access is recorded
  for [`R1-23`](../../roadmap/research.md#system-family-surveys) and [`R0-02`](R0-02-legal-baseline.md).
- Series models as of 2026-11-20: a 1 TB Series S of 2023-09-01; on 2024-10-15 a white 1 TB Series S,
  a white all-digital Series X, and a 2 TB Series X; with a price rise on 2026-08-01,
  Microsoft said it was discontinuing the 2 TB Series X;
  and the Series X25 limited edition of 25,000 units released on 2026-11-12
  ("Xbox Series X and Series S", "History" and "Mid-generation refreshes and Limited Editions").
- Model numbers: 1882 for the 1 TB Series X with a disc drive, 1881 for the 512 GB Series S,
  and 1883 for the 1 TB Series S ("Xbox Series X and Series S", "Comparison").
  The article's table gives none for the 2 TB and all-digital Series X.
- iFixit's parts store titles parts for both "Model 1882": "Microsoft Xbox Series X Disk Drive Model 1882
  (14 digit serial number)"
  on the 2 TB Galaxy Black page, and "Microsoft Xbox Series X All-Digital Model 1882" on the Digital Edition page
  (secondary: a retailer's part titles, not a maker statement).
  The pages are named and not linked, because the register closes iFixit for its non-commercial licence
  (addresses in [Sources](#sources)).
  So both appear to carry the 1 TB disc model's number (inference); Microsoft's product pages give no model number.

### Nintendo family

| Model (codes) | First release | Survey | Hub |
|---|---|---|---|
| Switch (HAC-001, HAC-001(-01)); CN Tencent model | JP, NA, EU, AU 2017-03-03; CN 2019-12-10 | [`R1-14`] | SwitchBrew |
| Switch Lite (HDH-001) | worldwide 2019-09-20 | [`R1-14`] | SwitchBrew |
| Switch OLED Model (HEG-001) | 2021-10-08 | [`R1-14`] | SwitchBrew |
| Switch 2; Japan-only model; EU battery revision | JP, NA, EU, AU and others 2025-06-05 | [`R1-14`] | SwitchBrew |

| Model | CPU | Graphics | Memory | Media and storage |
|---|---|---|---|---|
| Switch | Tegra X1, then X1+: 4 A57 cores, 1.02 GHz | Maxwell, 256 cores, 768 MHz | 4 GB LPDDR4 | cards; 32 GB eMMC |
| Switch Lite | Tegra X1+ | as Switch, handheld only | 4 GB LPDDR4 | game cards; 32 GB eMMC |
| Switch OLED Model | Tegra X1+ | as Switch | 4 GB LPDDR4 | game cards; 64 GB eMMC |
| Switch 2 | T239: 8 Cortex-A78C cores | Ampere, 1,536 cores | 12 GB LPDDR5X | Switch 2 and Switch cards; 256 GB |

- Every value rests on the Wikipedia articles ["Nintendo Switch"](https://en.wikipedia.org/w/index.php?oldid=1384604421)
  and ["Nintendo Switch 2"](https://en.wikipedia.org/w/index.php?oldid=1386314413)
  and on SwitchBrew's ["Hardware"](https://switchbrew.org/w/index.php?oldid=15339),
  ["Switch 2: Hardware"](https://switchbrew.org/w/index.php?oldid=14956),
  and ["Switch 2: Tegra T239"](https://switchbrew.org/w/index.php?oldid=15493) pages,
  unless a bullet names another source.
  The model codes HAC-001, HDH-001, and HEG-001 are from
  ["Tegra"](https://en.wikipedia.org/w/index.php?oldid=1385605682) (Tegra X1 devices table), and its SoC part numbers
  agree with SwitchBrew's "Hardware".
- The Switch's GPU runs at 768 MHz docked; the Switch uses only the four Cortex-A57 cores of the Tegra X1,
  one of them for the operating system, with a 1.785 GHz boost mode for loading added by firmware in April 2019;
  its GPU runs at 307.2, 384, or 460 MHz undocked ("Nintendo Switch", "SoC, CPU, GPU and RAM").
- In April 2018 two groups found a flaw in the Tegra X1's boot ROM that software cannot patch;
  Nintendo reportedly fixed it in units from about July 2018 ("Nintendo Switch", "Security").
  "Tegra" says the Tegra X1+ of 2019 fixes the Fusée Gelée exploit
  ("Tegra", Tegra X1 section);
  that this is the flaw of April 2018 is the note's inference, since neither article joins the two.
  The revised HAC-001(-01), with the X1+, followed in August 2019 ("Nintendo Switch", "Later revisions").
- Switch game cards hold 1 to 32 GB, are not writable, and connect through a game-card ASIC on the console
  (["Nintendo Game Card"](https://en.wikipedia.org/w/index.php?oldid=1384974362), "Nintendo Switch"; SwitchBrew,
  ["Gamecard"](https://switchbrew.org/w/index.php?oldid=12871), "Protocol"; SwitchBrew, "Hardware").
  The Switch is region-free, except that Tencent's Chinese cartridges play only on the Tencent model,
  which plays any region's cartridges but reaches only Chinese online services
  ("Nintendo Switch", "Distribution"; ["Region lock"](https://en.wikipedia.org/w/index.php?oldid=1384605268),
  "Nintendo").
- The Switch's system software, Horizon, is shared by the Switch and Switch 2; SwitchBrew lists version 23.5.0 for both,
  released on 2026-11-10 (UTC)
  (["Nintendo Switch system software"](https://en.wikipedia.org/w/index.php?oldid=1381894756), lead section; SwitchBrew,
  ["System Versions"](https://switchbrew.org/w/index.php?oldid=15460) and
  ["Switch 2: System Versions"](https://switchbrew.org/w/index.php?oldid=15457)).
- As of 2026-11-20 the Switch was still sold;
  Nintendo announced in July 2026 that sales in Europe will stop from February 2027, while continuing elsewhere
  ("Nintendo Switch", "Discontinuation").
- The Switch Lite is handheld only, with integrated controls and no TV output
  ("Nintendo Switch", "Nintendo Switch Lite").
- The Switch 2's CPU runs at 998 MHz docked and 1,101 MHz undocked, and its GPU at 1,007 MHz docked and 561 MHz undocked
  ("Nintendo Switch 2", infobox).
- The Switch 2's memory bandwidth figures agree once the data rate is stated.
  SwitchBrew gives "LPDDR5X-3750, 128-bit (120 GB/s)" (SwitchBrew, "Switch 2: Tegra T239").
  "Nintendo Switch 2" gives a 128-bit bus at 6,400 MT/s docked and 4,266 MT/s undocked (infobox),
  and about 102 GB/s docked and 68 GB/s handheld ("Console"); "Tegra" gives 102.4 GB/s (T239 row).
- A 128-bit bus moves 16 bytes per transfer, so 7,500 MT/s gives 120 GB/s, the part's rated peak;
  6,400 MT/s gives 102.4 GB/s; and 4,266 MT/s gives 68.3 GB/s (calculated from the rates).
  Reading LPDDR5X-3750 as 7,500 MT/s is an inference from the double-data-rate naming.
  Nintendo gives no figure: its specification page names only a "Custom processor made by NVIDIA"
  and states no memory type, speed, or bandwidth
  ([Nintendo, "Nintendo Switch 2 Technical Specifications"](https://www.nintendo.com/us/gaming-systems/switch-2/tech-specs/);
  searched for "LPDDR", "RAM", "Memory", "GB/s", and "bandwidth").
- The article lists Switch 2 game cards of 16, 32, and 64 GB,
  but says only 64 GB was offered at first and a 32 GB card was confirmed in September 2026;
  "Nintendo Switch 2 Edition" cards work in both consoles; and Game-Key Cards hold only a licence:
  "they contain no data on them other than a digital license for the game, which requires the software to be downloaded"
  ("Nintendo Game Card", "Nintendo Switch 2" and "Game-Key Card").
- SwitchBrew says the T239's A78C cores support pointer authentication,
  and that the T239 "appears to support memory encryption": "Memory within certain carveout regions is encrypted"
  (SwitchBrew, "Switch 2: Tegra T239", "Notable Security Features").
  By Engadget's account, as the article reports it, Nintendo ties a unique identifier to each game card,
  and consoles that used flash carts, or second-hand game cards, have been banned from Nintendo Switch Online
  ("Nintendo Switch 2", "Hardware protections").
- Nintendo's hardware director called the Switch 2's way of running Switch games "somewhere in between a software
  emulator and hardware compatibility" ("Nintendo Switch 2", "Backward compatibility").
- Switch 2 variants as of 2026-11-20:
  a Japan-only model that "operates only in the Japanese language
  and can only use online services registered to Japanese residents",
  and a European revision with user-replaceable console and controller batteries shipping from July 2026
  ("Nintendo Switch 2", "Release and pricing" and "Revisions").
  Indonesia's release is scheduled for 2026-12-10, and mainland China's is delayed without a date
  ("Nintendo Switch 2", "Release and pricing").

### Other dedicated consoles

Each full row rests on the Wikipedia article on the device, unless it names another source.
A cross-reference row names the catalogue that lists the device in full, and takes its date from that catalogue's row.

| Device | Maker | First release | CPU | Media |
|---|---|---|---|---|
| Zeebo | Zeebo Inc. | BR 2009-05-25 | ARM11-based, 528 MHz | download over 3G |
| Playdate | Panic | 2022-04-19 | STM32F746, Cortex-M7F | downloads |
| Arduboy | Kevin Bates | 2016 | ATmega32U4 | downloads |
| Thumby | TinyCircuits | 2022 | RP2040, 2 Cortex-M0+ cores | downloads |
| Nex Playground | Nex Team | 2023-12 | Amlogic A311D2-NOD | downloads |
| Gizmondo | Tiger Telematics | UK 2005-03-19 | listed in [`R1-07`], "Other dedicated handhelds" | — |
| Advanced Pico Beena | Sega Toys | JP 2005-08-06 | listed in [`R1-07`], "Minor and educational home systems" | — |
| Game Wave | ZAPiT Games | CA 2005-10 | listed in [`R1-07`], "Minor and educational home systems" | — |
| V.Smile Baby | VTech | 2006 | listed in [`R1-07`], "Minor and educational home systems" | — |
| V.Flash | VTech | 2006-09 | listed in [`R1-07`], "Minor and educational home systems" | — |
| HyperScan | Mattel | NA 2006-10-23 | listed in [`R1-07`], "Minor and educational home systems" | — |

- Zeebo sold games only as downloads over a built-in 3G modem, in Brazil and then Mexico,
  and was discontinued on 2011-09-30 (["Zeebo"](https://en.wikipedia.org/w/index.php?oldid=1384449469),
  lead section and infobox).
  The article gives the company's stated intention as circumventing piracy through wireless distribution
  ("Zeebo", lead section).
- The Playdate has a 400 × 240 1-bit display, a crank, and an accelerometer;
  its games arrive in "seasons" and through a store added on 2023-03-07
  (["Playdate (console)"](https://en.wikipedia.org/w/index.php?oldid=1383318356), infobox, "Hardware", and "Games").
  The article calls the device an open system that allows sideloading ("Games", "Developers").
- Panic's SDK licence says its terms apply to the documentation of the programming interfaces as well,
  and forbids using the SDK "to develop applications for other platforms
  or to develop another SDK" without Panic's written permission
  ([Panic, Playdate SDK License 1.0](https://play.date/dev/sdk-license/), preamble and section 2).
  The [register](../../../.claude/hooks/source-register.txt) closes Panic's SDK documentation for that reason;
  the licence limits documentation, not the device.
  The effect on an emulator is a risk for [`R0-02`](R0-02-legal-baseline.md)
  and [`R0-03`](R0-03-licence-strategy.md) (inference).
- The Arduboy's infobox gives no release date;
  the year is from ["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?oldid=1384273411).
  Successors are the Arduboy FX and FX-C (["Arduboy"](https://en.wikipedia.org/w/index.php?oldid=1379368117)).
- Nex Playground runs an Android-based "Play OS" and depends on a built-in camera with motion tracking;
  its games download and then play offline
  (["Nex Playground"](https://en.wikipedia.org/w/index.php?oldid=1386780212), infobox and body).
  It is classed here as a dedicated console because it runs its own closed library
  and is not sold to run other systems' games, though it is Android-based
  (inference; ["Boundary cases"](#boundary-cases)).
- No lock-out or copy protection mechanism is described in the articles on the five devices with full rows
  (searches of each for "protect", "lock", "encrypt", "sign", and "piracy");
  Zeebo's download-only distribution is the nearest.

### Emulator hosts

The roadmap's list of hosts, and this note's test
([How the catalogue is built](#how-the-catalogue-is-built)),
place these here as hosts, covered by [`R3-07`](../../roadmap/research.md#phase-3-host-platforms)
and [`R3-12`](../../roadmap/research.md#phase-3-host-platforms).
Each row rests on the Wikipedia article on the device or line, read raw, except the Tecno Pocket Go,
which has no article and rests on
["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?oldid=1384273411).

| Device or line | Maker | First release | Class | Processor family |
|---|---|---|---|---|
| Nvidia Shield Portable | Nvidia | 2013-07-31 | Android handheld | Tegra 4 |
| Nvidia Shield Tablet | Nvidia | NA 2014-07-29 | Android handheld | Tegra K1 |
| GPD XD | GamePad Digital | 2015-10 | Android handheld | Rockchip RK3288 |
| Logitech G Cloud | Logitech, Tencent | NA 2022-10-17 | Android handheld | Snapdragon 720G |
| Razer Edge | Razer | 2023-01-26 | Android handheld | Snapdragon G3x Gen 1 |
| Anbernic line | Shenzhen YangLiMing | 2017 | Android or Linux handheld | Rockchip and others, by model |
| Retroid Pocket 2, 2+, 2S | GoRetroid | 2020-09 | Android handheld | MediaTek MT6580, then Unisoc |
| Ayn Odin (Lite, Base, Pro) | Ayn | 2022 | Android handheld | Snapdragon 845; Dimensity D900 (Lite) |
| JXD Android handhelds | JinXing Digital | 2011 | Android handheld | not stated; by model |
| Xperia Play | Sony Ericsson | 2011 | Android phone | Snapdragon S2 MSM8255 |
| GP2X; GP2X Wiz; Caanoo | GamePark Holdings | KR 2005-11-10 | Linux handheld | ARM920T, ARM940T; Pollux (Wiz, Caanoo) |
| Dingoo A320, A330 | Dingoo Digital | CN 2009-02 | handheld sold with emulators | Ingenic Jz4732 or Jz4740, MIPS |
| Pandora | OpenPandora | 2010-05 | Linux handheld computer | OMAP 3530, Cortex-A8 |
| Game Gadget | Blaze Europe | 2012-04-05 | Linux handheld | Ingenic JZ4750, MIPS |
| GCW Zero | Game Consoles Worldwide | 2013 | Linux handheld | Ingenic JZ4770, MIPS |
| GPD Win line | GamePad Digital | 2016-10 | PC handheld | Intel Atom (first two models) |
| Ayaneo line | Anyun Intelligent Technology | 2021 | PC or Android handheld | AMD Ryzen, and others by model |
| Steam Deck (LCD; OLED) | Valve | NA, EU 2022-02-25 | PC handheld | AMD Zen 2, RDNA 2 |
| ROG Ally; Ally X | Asus | 2023-06-13 | PC handheld | AMD Zen 4, RDNA 3 |
| Legion Go line | Lenovo | 2023-10-31 | PC handheld | AMD Ryzen Z1, then Z2 |
| MSI Claw A1M | MSI | 2024-03 | PC handheld | Intel Core Ultra |
| Tecno Pocket Go | Tecno Mobile | 2024 | PC handheld | AMD Ryzen 7 |
| ROG Xbox Ally; Ally X | Asus, with Microsoft | 2025-10-16 | PC handheld | AMD Ryzen Z2 |
| Atari VCS (2021) | Atari | AU, NZ 2021-06-10; NA 2021-06-15 | PC with a Debian-based system | AMD R1606G, Zen |
| Polymega | Playmaji | 2021-09-12 | console of licensed emulators, x86 Linux | Intel Coffee Lake S |
| Ouya | Ouya, Inc. | 2013-06-25 | microconsole | Tegra 3 |
| GameStick | PlayJam | 2013-11-15 | microconsole | Amlogic, Cortex-A9 |
| Mojo (M.O.J.O.) | Mad Catz | US, UK 2013-12-10 | microconsole | Tegra 4 |
| Nexus Player | Google, Asus | 2014-11-03 | microconsole | Intel Atom |
| Nvidia Shield TV | Nvidia | NA 2015-05-28 | microconsole | Tegra X1, then X1+ |
| Amazon Fire TV | Amazon | NA 2014-04-12 | microconsole | Snapdragon, then MediaTek |
| Apple TV, from 2015 | Apple | 2015 | microconsole | Apple A8 and later |
| Steam Machine | Valve | 2026-06-29 | PC (microconsole reading) | AMD Zen 4, RDNA 3 |
| Analogue Nt mini; Super Nt; Mega Sg | Analogue | 2017-01-23 to 2019-03-25 | FPGA | Altera Cyclone V |
| Analogue Pocket | Analogue | 2021-12-13 | FPGA | Cyclone V and Cyclone 10 |
| Analogue 3D | Analogue | 2025-11-18 | FPGA | Cyclone 10 GX |
| MiSTer | open project | 2017-06 (on GitHub) | FPGA | DE10-Nano board |
| ModRetro Chromatic; M64 | ModRetro | Chromatic announced 2024-06; M64 2026-07-28 | FPGA | MiSTer parts (Chromatic) |
| Evercade handheld, VS, EXP, Nexus | Blaze | 2020-05-22 | cartridges of licensed emulators | Cortex-A7; RK3328 (VS) |
| Super Pocket | HyperMegaTech! (Blaze) | 2023-11-14 | plays Evercade cartridges | not stated (1.2 GHz) |
| NES and Super NES Classic Editions | Nintendo | 2016-11-10; 2017-09-29 | retro mini | Allwinner R16 |
| PlayStation Classic | SIE | 2018-12-03 | retro mini | MediaTek MT8167A |
| Genesis Mini; Mini 2 | Sega, with M2 | 2019-09-19; 2022-10-27 | retro mini | ZUIKI Z7213 (Z2713 in the infobox) |
| TurboGrafx-16 Mini | Konami, with M2 | JP 2020-03-19 | retro mini | not stated |
| Neo Geo Mini; Neo Geo X | SNK; Tommo | 2018-07-24; 2012-12-18 | retro mini | not stated; Ingenic JZ4770 |
| Game Gear Micro | Sega | JP 2020-10-06 | retro mini | not stated |
| Game & Watch (2020, 2021) | Nintendo | 2020-11-13; 2021-11-12 | retro mini | STM32H7B0 |
| Atari Flashback line; 2600+ | Legacy, AtGames; Atari, Plaion | 2004; 2023-11-17 | retro mini | Rockchip 3128 (2600+) |
| RetroN line | Hyperkin | 2010 | retro mini | not stated |

- The list is not exhaustive, and does not try to be:
  it shows [`R3-07`](../../roadmap/research.md#phase-3-host-platforms)
  and [`R3-12`](../../roadmap/research.md#phase-3-host-platforms) the field.
  A host enters when a registered source describes it, and those items treat hosts by processor family
  (["Implications for Rustalgia"](#implications-for-rustalgia)), so a missing row hides no platform.
- These exact titles returned 404 from Wikipedia: Retroid Pocket, AYN Odin, Miyoo Mini, OneXPlayer, Zotac Zone,
  Mad Catz M.O.J.O., Razer Forge TV, Analogue Duo, Legion Go S, and Atari 7800+.
  A Wikipedia search found the three articles above; for the others it returned only maker or system articles,
  such as "Razer Inc." and "Atari 7800", which were not read,
  and ["Lenovo Legion Go"](https://en.wikipedia.org/w/index.php?oldid=1374923849) does not name a Legion Go S. "TECNO
  Pocket Go" redirects to a list in ["Tecno Mobile"](https://en.wikipedia.org/w/index.php?oldid=1384988601).
- The Evercade line is a host because it is sold to run licensed emulators:
  "The Evercade runs emulators that have been licensed by Blaze
  or custom-built in some cases" (["Evercade"](https://en.wikipedia.org/w/index.php?oldid=1384324203)).
  At least one title, Full Void, runs natively, and the Nexus comes with native ports of two games
  (same article); a few native titles do not change what the device is sold to do (inference).
- Blaze's own page says of the VS: "The Quad Core 1.5 Ghz processor will power a brand new user interface"
  ([Blaze, "VS"](https://evercade.co.uk/vs/)).
  That matches both ["Evercade VS"](https://en.wikipedia.org/w/index.php?oldid=1379582441)
  (Rockchip RK3328, quad-core Cortex-A53, 1.5 GHz; infobox)
  and ["List of home video game consoles"](https://en.wikipedia.org/w/index.php?oldid=1386685039)
  (an unknown four-core Cortex-A7 at 1.5 GHz; Evercade VS row).
  The core type and the part number rest on Wikipedia, which disagrees with itself ([Open questions](#open-questions)).
- The Atari VCS's article calls it a hybrid of a home console and a gaming PC, gives a release to backers on 2020-12-14,
  and says its storefront is set to close on 2027-02-01
  (["Atari VCS (2021 console)"](https://en.wikipedia.org/w/index.php?oldid=1386169078)).
  It is listed as a PC because it runs a general operating system (inference).
- The GP2X line, the Dingoo, the Pandora, the Game Gadget,
  and the GCW Zero are Linux or MIPS handhelds whose articles describe emulation or homebrew as their use
  (["GP2X"](https://en.wikipedia.org/w/index.php?oldid=1385314903),
  ["Dingoo"](https://en.wikipedia.org/w/index.php?oldid=1379337765),
  ["Pandora (computer)"](https://en.wikipedia.org/w/index.php?oldid=1382382856),
  ["Game Gadget"](https://en.wikipedia.org/w/index.php?oldid=1353062161),
  ["GCW Zero"](https://en.wikipedia.org/w/index.php?oldid=1366037317)).
  The Xperia Play is the one phone listed, and a host for the same reason.
- The Anbernic line is a host for its Linux models as well as its Android ones.
  Wikipedia describes the line as playing older systems "through software emulation"
  and quotes a newspaper calling them "unofficial handhelds"
  (["Anbernic"](https://en.wikipedia.org/w/index.php?oldid=1384269816); the newspaper was not opened).
- The Retroid Pocket 2 and Ayn Odin are Android handhelds that their articles call emulation consoles,
  and the Mojo is an Android microconsole that runs unmodified Android with Google Play
  (["Retroid Pocket 2"](https://en.wikipedia.org/w/index.php?oldid=1352232091),
  ["Ayn Odin"](https://en.wikipedia.org/w/index.php?oldid=1369017721),
  and ["Mojo (microconsole)"](https://en.wikipedia.org/w/index.php?oldid=1386317773), lead sections).
  JXD started making Android tablets and gaming handhelds in 2011, after the JXD 301, which emulated retro consoles
  (["JXD"](https://en.wikipedia.org/w/index.php?oldid=1359557491), "History" and "Android products").
- The Steam Deck runs SteamOS, plays Windows games through Proton,
  and has a desktop mode in which users install other software
  (["Steam Deck"](https://en.wikipedia.org/w/index.php?oldid=1385949939), lead section and "History");
  no lock-out against user software is described.
  Its LCD models were discontinued on 2025-12-19 (same article, infobox).
- The ROG Xbox Ally's "Xbox mode" "boots the system directly into the Xbox app without loading the full Windows shell by
  default" (["ROG Xbox Ally"](https://en.wikipedia.org/w/index.php?oldid=1386825038)); it is a Windows PC, not an Xbox
  console (inference from the article's "Handheld PC" type).
  Wikipedia's type field calls the Asus ROG Ally a handheld game console,
  the MSI Claw A1M both a handheld game console and a handheld gaming computer,
  the Steam Deck and Legion Go handheld gaming computers, and the ROG Xbox Ally a handheld PC,
  so the field cannot decide the class (each article's infobox).
- The Steam Machine of 2026 was released on 2026-06-29 after a reservation waitlist, at a base price above US$1,000;
  Valve stopped offering waitlist places in November 2026
  (["Steam Machine"](https://en.wikipedia.org/w/index.php?oldid=1386682817), infobox and "History", "Launch").
  Valve's earlier Steam Machines, from 2015, relied on other manufacturers ("Steam Deck", lead section and "History").
- The Analogue Pocket's FPGA is reprogrammed to replicate the Game Boy, Game Boy Color, and Game Boy Advance,
  and takes other handhelds' cartridges through adapters
  (["Analogue Pocket"](https://en.wikipedia.org/w/index.php?oldid=1384117105), "Design" and "Hardware").
  ModRetro's Chromatic "uses open-source components from the MiSTer FPGA project"
  (["ModRetro"](https://en.wikipedia.org/w/index.php?oldid=1384719948)).
  The article's "M64" section says the M64 was released on 2026-07-28,
  though its "History" section still calls it "planned for release in 2026" ("ModRetro").
- Wikipedia says of MiSTer, "The project is licensed under version 3 of the GNU General Public Licence"
  (["MiSTer"](https://en.wikipedia.org/w/index.php?oldid=1364318909)).
  GitHub's licence metadata differs by repository:
  GPL-3.0 for [Main_MiSTer](https://github.com/MiSTer-devel/Main_MiSTer)
  and [Distribution_MiSTer](https://github.com/MiSTer-devel/Distribution_MiSTer),
  GPL-2.0 for [Template_MiSTer](https://github.com/MiSTer-devel/Template_MiSTer),
  and none for [Menu_MiSTer](https://github.com/MiSTer-devel/Menu_MiSTer)
  ([GitHub, repository metadata](https://docs.github.com/en/rest/repos/repos#get-a-repository), field `license.spdx_id`;
  observed; no repository file was opened).
  Wikipedia's sentence fits the project's main repository, not every core (inference),
  which is why the [source register](../../../.claude/hooks/source-register.txt) walls MiSTer-devel's repositories per
  core.
- The Atari Flashback line began in 2004, before this note's date rule; it is listed because it continues
  (["Atari Flashback"](https://en.wikipedia.org/w/index.php?oldid=1386296269), infobox and lead section).
  The Atari 2600+ plays original 2600 and 7800 cartridges
  but "uses software-based emulation instead of a binary compatible system-on-chip hardware", so some cartridges fail
  (["Atari 2600+"](https://en.wikipedia.org/w/index.php?oldid=1384597237), "Software"; the quotation drops link markup).
  Of the RetroN 5, Wikipedia reports that RetroArch's developers said "the RetroN 5 violates several licenses",
  because it shipped emulators under a non-commercial licence
  (["RetroN"](https://en.wikipedia.org/w/index.php?oldid=1345465636), "RetroN 5 (2014)").
- Hardware clusters: the Shield TV uses the Switch's Tegra X1 and X1+;
  the NES and Super NES Classic Editions share the Allwinner R16; Ingenic MIPS parts run the Dingoo, the Game Gadget,
  the GCW Zero, and the Neo Geo X, which shares the GCW Zero's JZ4770; the Steam Deck and the ROG Xbox Ally
  (Z2 A) both pair Zen 2 with RDNA 2 (the rows above and their articles; the grouping is the note's).

### Listed under other systems

| Device | Maker | First release | Listed under |
|---|---|---|---|
| Analogue Nt (2015) | Analogue | 2015 | the NES, as a variant ([`R1-05`]; survey [`R1-15`]) |
| Atari Flashback 2, 2+ | Legacy Engineering | 2005-08; 2+ due 2010-02-22 | the Atari 2600, as a variant ([`R1-05`]) |
| ZX Spectrum Next | SpecNext | 2017-12 (board) | home computers ([`R1-25`]) |

- The Analogue Nt's article lists a Ricoh 2A03 and 2C02, the NES's own chips, so it is a clone of the NES
  (["Analogue Nt"](https://en.wikipedia.org/w/index.php?oldid=1366437670)).
- The Flashback 2 re-implements the Atari 2600's hardware rather than emulating it
  (["Atari Flashback"](https://en.wikipedia.org/w/index.php?oldid=1386296269)).
- The ZX Spectrum Next is a home computer; its date is the development board's,
  and the cased machine followed in February 2020
  (["ZX Spectrum Next"](https://en.wikipedia.org/w/index.php?oldid=1373891208), infobox).

### Announced and not sold

- The Intellivision Amico was set first for October 2020;
  its article now says the delays left "the console without a release date",
  that its maker said in November 2023 it lacked funds to produce units,
  and that Atari SA bought the Intellivision brand in May 2024 without the Amico
  (["Intellivision Amico"](https://en.wikipedia.org/w/index.php?oldid=1384330319)).
- A PlayStation 6 has no article;
  ["Ninth generation of video game consoles"](https://en.wikipedia.org/w/index.php?oldid=1384781485) says rising
  hardware costs, including memory, are expected to delay the next generation, "the planned PlayStation 6 from Sony"
  among it.
- Microsoft's next Xbox, codename Project Helix,
  was announced in March 2026 and is described as re-evaluated for component prices
  (["Xbox"](https://en.wikipedia.org/w/index.php?oldid=1386174526), "Project Helix";
  "Ninth generation of video game consoles").
- None of the three was on sale on 2026-11-20 (the articles above).

### Out of scope

- Standalone virtual-reality headsets
  (the Steam Frame, released 2026-09-18, and the Meta Quest line)
  are not dedicated game consoles in the roadmap's sense, and are left out
  (["Steam Frame"](https://en.wikipedia.org/w/index.php?oldid=1386446966);
  ["Meta Quest"](https://en.wikipedia.org/w/index.php?oldid=1385938275)).
- Cloud gaming services and their clients (Stadia, Luna, Xbox Cloud Gaming, OnLive) are left out
  (["Google Stadia"](https://en.wikipedia.org/w/index.php?oldid=1384327273);
  ["Amazon Luna"](https://en.wikipedia.org/w/index.php?oldid=1383355935);
  ["Xbox Cloud Gaming"](https://en.wikipedia.org/w/index.php?oldid=1384990660);
  ["OnLive"](https://en.wikipedia.org/w/index.php?oldid=1386318547)).
  [`R1-07`](R1-07-catalogue-sixth-generation.md) lists the OnLive Game System as a host
  ([`R1-07`, "Emulator hosts, PC-based systems, and cancelled systems"](R1-07-catalogue-sixth-generation.md#emulator-hosts-pc-based-systems-and-cancelled-systems));
  this note carries no row for it.
- Phones are left out, except the Xperia Play, which is listed as a host.

### Boundary cases

| System | By survey | By date | Placed |
|---|---|---|---|
| Xbox 360 | [`R1-23`], which depends on [`R1-03`] and [`R1-04`] | seventh generation | [`R1-07`], shared placement |
| Wii; Wii U; 3DS; Vita and PS TV | [`R1-17`], [`R1-13`], [`R1-20`] (on [`R1-03`]) | seventh and eighth | [`R1-07`] |
| Devices first sold to 2005-11-21 | none | 2001 to 2005-11-21 | [`R1-07`]; cross-reference rows here |
| GP2X line | none | KR 2005-11-10, then later models | here, with its successors |
| V.Flash; HyperScan; V.Smile Baby | none | 2006 | [`R1-07`], beside its minor home systems |
| PlayStation Portal | [`R1-21`] names PS3, 4, 5 only | 2023 | here, listed as a client |
| Nex Playground | none; Android-based, closed library | 2023 | here, as a dedicated console (inference) |
| Analogue Nt; Flashback 2 | [`R1-15`] for the NES; none for the 2600 | 2005, 2015 | under the NES and the 2600 |
| ZX Spectrum Next | [`R1-25`] | 2017 | [`R1-25`] |

- The placements follow the roadmap's survey dependencies
  (["System family surveys"](../../roadmap/research.md#system-family-surveys)),
  its era rule (["Hardware primers"](../../roadmap/research.md#hardware-primers)),
  and the date rule in ["How the catalogue is built"](#how-the-catalogue-is-built).
- [`R1-07`](R1-07-catalogue-sixth-generation.md) lists the devices of 2001 to 2005-11-21 in full,
  and this note lists the later ones: the GP2X line, the Dingoo, Zeebo, the Pandora, the Neo Geo X, the Game Gadget,
  the GCW Zero, the Xperia Play, the Nvidia Shield Portable, the Ouya, and JXD's handhelds,
  which [`R1-07`](R1-07-catalogue-sixth-generation.md) also lists today
  ([`R1-07`](R1-07-catalogue-sixth-generation.md),
  ["Minor and educational home systems"](R1-07-catalogue-sixth-generation.md#minor-and-educational-home-systems),
  ["Other dedicated handhelds"](R1-07-catalogue-sixth-generation.md#other-dedicated-handhelds), and
  ["Emulator hosts, PC-based systems, and cancelled systems"](R1-07-catalogue-sixth-generation.md#emulator-hosts-pc-based-systems-and-cancelled-systems)).
  That note carries cross-reference rows for them once it is revised.

### Patterns across the catalogue

- Every surveyed family had a system software release in 2026: the PS3 (4.93, 2026-03-18), the PS4
  (14.02, 2026-11-04),
  the PS5 (update 14, 2026-09-16), the Switch and Switch 2 (23.5.0, 2026-11-10), and the Xbox One and Series
  (10.0.26100.9662, 2026-11-11, by ["Xbox system software"](https://en.wikipedia.org/w/index.php?oldid=1386323584))
  (findings above).
  The PS3 was discontinued in Japan on 2017-05-29
  (["PlayStation 3"](https://en.wikipedia.org/w/index.php?oldid=1386319117), infobox)
  and still receives updates (Wikipedia, "PlayStation 3 system software", revision 1386319155, lead section; not linked,
  as above).
- Processor families: Cell in the PS3; AMD Jaguar in the PS4 and Xbox One families,
  the One X's cores being Jaguar-compatible; AMD Zen 2 with RDNA 2 in the PS5, Xbox Series, Steam Deck,
  and the base ROG Xbox Ally (Z2 A); Arm cores with Nvidia graphics in the Switch, Switch 2, and Shield devices
  (rows above; the grouping is the note's).
- Region locks on native games are nearly gone from the surveyed families: one PS3 game is region-locked;
  the PS4 and PS5 are not region-locked, though region-locked games remain possible;
  Xbox One and Series are region-free;
  and the Switch's exceptions are Tencent's Chinese cartridges and the Switch 2's Japan-only model.
  The PS3 still locks PS1 and PS2 games and films, and PlayStation downloadable content is tied to its region
  (["Region lock"](https://en.wikipedia.org/w/index.php?oldid=1384605268), "Sony"; findings above).
- Media is moving from discs to downloads: the PS5 Digital, PS5 Pro, Series S,
  and all-digital Series X ship without a drive,
  though the revised PS5 Digital Edition and the Pro take one sold separately
  (["PlayStation 5"](https://en.wikipedia.org/w/index.php?oldid=1385515902));
  Switch 2 Game-Key Cards hold only a licence;
  and Sony has announced it will stop producing physical game discs from 2028 (findings above).
  For an emulator, a game that exists only as a download, or whose card holds only a licence,
  is reached only through the user's own copy (inference; [`R0-02`](R0-02-legal-baseline.md) records the law).
- Hardware decompression appears in the PS4 (zlib), PS5 (zlib and Kraken), and Xbox Series
  (zlib and BCPack, by Wikipedia; Microsoft's slides place Deflate/Zlib and an "MS XVA" texture codec in the MSP,
  [Andrews and Grossman](https://hc32.hotchips.org/assets/program/conference/day1/HotChips2020_GPU_Microsoft_Jeff_Andrews_v2.pdf),
  slide 10); the PS5 and Series pair it with SSDs, the PS4 with a hard disk (findings above).
- Protection described in the sources read: for the PlayStation family,
  the PS3's Blu-ray key renewal and the PS5's hypervisor; for the Xbox family,
  the hypervisor and the Series X's HSP/Pluton root of trust and memory encryption; for the Nintendo family,
  the Switch's boot ROM flaw and the T239's encrypted carveouts and game-card identifiers.
- No signed boot chain is described for the PlayStation or Xbox families in the sources searched: the PS3, PS4, PS5,
  Xbox One, and Xbox Series articles, the PS3, PS4, and Xbox system software articles,
  and [psdevwiki](https://www.psdevwiki.com/)'s
  [PS5 "Hypervisor"](https://web.archive.org/web/20260519183327/https://www.psdevwiki.com/ps5/Hypervisor), for "secure
  boot", "boot chain", "chain of trust", "root of trust", "bootloader", "boot ROM", "signed", "signature", and "security
  processor"; the OCR text of the
  [Hot Chips 25 slides](https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf)
  for "boot" and "trust"; and the text of the
  [Hot Chips 32 slides](https://hc32.hotchips.org/assets/program/conference/day1/HotChips2020_GPU_Microsoft_Jeff_Andrews_v2.pdf)
  for "boot" and "signed".
  A root of trust, as on the Series X, is not by itself a described boot chain (inference).
  [`R0-02`, "Firmware, keys, and game copies"](R0-02-legal-baseline.md#firmware-keys-and-game-copies),
  records what follows for keys.

### Coverage of sources

- [psdevwiki](https://www.psdevwiki.com/) gives model codes for the PS3, PS4, and PS5, boards for the PS3 and PS4,
  and process sizes for the PS3, read through existing web archive captures, cited with their full time stamps,
  because the live site served a challenge page to scripts
  (psdevwiki, "SKU Models", archived copies; research log).
  psdevwiki's PS4 "Hypervisor" page has no archive capture (web archive index, both host spellings).
- [SwitchBrew](https://switchbrew.org/wiki/Main_Page) gives boards, chips,
  and system versions for the Switch and Switch 2.
- Microsoft's Hot Chips talks give the Xbox One and Series X system architecture,
  and its product pages and Xbox Wire spec sheet give the Series S and X specifications; the register's older Xbox hubs
  ([XboxDevWiki](https://xboxdevwiki.net/) and [Free60](https://free60.org/)),
  which serve the original Xbox and the Xbox 360, were not searched.
- Sony's open-source pages list the Portal's system software versions
  ([Sony, open-source software](https://www.playstation.com/en-us/oss/accessories/playstation-portal-remote-player/)).
- Beyond Wikipedia, only Panic's licence (Playdate) and Blaze's VS page (Evercade) are cited
  for rows outside the three families.
  Facts that appear only on unregistered makers' pages, for the Steam Deck, Analogue's devices, ModRetro,
  and Nvidia's Shield, are left to [`R3-07`](../../roadmap/research.md#phase-3-host-platforms)
  and [`R3-12`](../../roadmap/research.md#phase-3-host-platforms), which will evaluate those sites;
  the pages were read for evaluation only and are not cited (research log).
- Risk: Sony's, Nintendo's, and Microsoft's site terms, read in the first pass, bar automated collection,
  and Sony's terms reserve text-and-data mining under EU law (research log; the terms were not re-read for this pass).
  The rework and fix passes fetched single maker pages one at a time for named facts, not in bulk: Microsoft's product,
  Xbox Wire, and Learn pages and its developer agreement, Sony's press release, Nintendo's Switch 2 specification page,
  and Blaze's VS page.
  [`R0-02`](R0-02-legal-baseline.md) records that makers' licence terms may bind those who accepted them,
  and leaves open whether they bind those who did not
  ([`R0-02`](R0-02-legal-baseline.md),
  ["Firmware, keys, and game copies"](R0-02-legal-baseline.md#firmware-keys-and-game-copies) and
  ["Questions no court was found to have decided"](R0-02-legal-baseline.md#questions-no-court-was-found-to-have-decided)).

## Options and trade-offs

### Catalogue every model, or one row per family

- **What:** keep a row for each revision, as here, or one row per family with revisions as notes.
- **Costs:** a row per revision repeats most columns; one per family hides that the PS5 Pro, the One X,
  and the Switch Lite differ in hardware (inference).
- **Gains:** per revision shows which models differ for software; per family keeps the table short.
- **Used by:** [psdevwiki](https://www.psdevwiki.com/)
  and [SwitchBrew](https://switchbrew.org/wiki/Main_Page) list models and boards in detail, though not every revision:
  psdevwiki's capture of 2026-03-12 lacks the 825 GB Slim Digital, and SwitchBrew lists boards, not regional models.

### Where a device the roadmap does not name belongs

- **What:** the test applied: a device sold to run its own games is a dedicated console,
  a device sold to run emulators of other systems is a host, a clone of a system is a variant of it,
  and a home computer goes to [`R1-25`](../../roadmap/research.md#system-family-surveys).
- **Costs:** a host reading leaves devices with their own cartridges, such as the Evercade, without a system study;
  their few native titles are not catalogued as a system (inference).
- **Gains:** one test classes every device, and keeps the research finite (inference).
- **Used by:** this note, for the Evercade line, Atari VCS, Linux handhelds, the Xperia Play,
  and the edge cases of the Analogue Nt, Flashback 2, and ZX Spectrum Next.

### A streaming client in the catalogue

- **What:** keep the PlayStation Portal as a family row, move it to the hosts, or leave it out.
- **Costs:** a row implies a target that runs no games; leaving it out drops a sold family member.
- **Gains:** a row records the family completely; leaving it out keeps the catalogue to systems that run games.
- **Used by:** this note lists it once, labelled as a streaming client.

### Systems on sale

- **What:** catalogue systems on sale with a date and re-check them, or freeze the catalogue at one date.
- **Costs:** re-checking is recurring work; a frozen date goes stale within months
  (inference from the 2026 changes in the findings).
- **Gains:** a dated catalogue says what was true when; re-checks keep the system scope proposal current.
- **Used by:** this note dates every statement about a system on sale.

### Recommendation

- **Rows:** keep a row per model, grouping revisions that run the same software, as now.
  The PS5 Pro, One X, Switch Lite, and the Switch 2's Japan-only model differ in hardware or behaviour
  that software sees, and the hubs that matter
  ([psdevwiki](https://www.psdevwiki.com/) "SKU Models",
  [SwitchBrew](https://switchbrew.org/wiki/Main_Page) ["Hardware"](https://switchbrew.org/w/index.php?oldid=15339)) are
  organised by model, so per-model rows map straight onto the later surveys.
- **Devices the roadmap does not name:** apply the test above.
  It is this note's reading of the owner's "Dedicated consoles only"
  ([pull request #18](https://github.com/jsamuelsen11/rustalgia-emu/pull/18), "Request"),
  settled here as a process call that the pull request lists.
  Keep the subsection as the record of the test and its edge cases.
- **Streaming client:** list the Portal once, as a streaming client and not a system to emulate.
  The row records the sold family member, and the label keeps it out of every survey's scope,
  since it "does not run any games or media natively on its own"
  (["PlayStation Portal"](https://en.wikipedia.org/w/index.php?oldid=1382191333), lead section).
- **Systems on sale:** keep a dated catalogue
  ("as of 2026-11-20")
  and re-check it when [`R6-01`](../../roadmap/research.md#phase-6-synthesis)
  (system scope)
  is drafted and when each family survey
  ([`R1-14`](../../roadmap/research.md#system-family-surveys),
  [`R1-21`](../../roadmap/research.md#system-family-surveys),
  [`R1-23`](../../roadmap/research.md#system-family-surveys)) starts.
  2026 alone brought the Switch's European end of sale, the 2 TB Series X's discontinuation,
  Sony's end of disc production, the Series X25, and new system software in every family,
  so a frozen catalogue would mislead the scope proposal.

## Implications for Rustalgia

- Every surveyed family is still sold or updated, which bears on all three surveys
  ([`R1-14`](../../roadmap/research.md#system-family-surveys),
  [`R1-21`](../../roadmap/research.md#system-family-surveys),
  [`R1-23`](../../roadmap/research.md#system-family-surveys))
  and on the system scope proposal ([`R6-01`](../../roadmap/research.md#phase-6-synthesis)).
  [`R0-02`](R0-02-legal-baseline.md) sorts risk by encryption, the common fact in every console emulator filing,
  judgment, and notice it found, not by whether a system is on sale
  ([`R0-02`, "Implications for Rustalgia"](R0-02-legal-baseline.md#implications-for-rustalgia));
  its one link to a system's age is its inference that design patents on current consoles are still in force
  ([`R0-02`, "Patents, recorded as risks"](R0-02-legal-baseline.md#patents-recorded-as-risks)).
  How being on sale bears on other risks is the note's inference.
- Download-only games, and games whose Game-Key Card holds only a licence, exist only
  as the user's own downloads (inference);
  the PS5 Slim Digital Edition and the PS5 Pro take a disc drive sold separately,
  and the original Digital Edition is not described as taking one
  (["PlayStation 5"](https://en.wikipedia.org/w/index.php?oldid=1385515902));
  this feeds [`R2-11`](../../roadmap/research.md#phase-2-cross-cutting-engineering) on media and storage formats.
- Hardware decompression for zlib and Kraken, and for zlib and BCPack, is part of the PS5 and Series storage paths,
  and the PS4 has a zlib decompression module
  (["PlayStation 4"](https://en.wikipedia.org/w/index.php?oldid=1386319169), "Technical specifications"; findings
  above); whether the formats are documented is a question for [`R1-04`](R1-04-primer-modern.md),
  [`R1-21`](../../roadmap/research.md#system-family-surveys), and
  [`R1-23`](../../roadmap/research.md#system-family-surveys), and their licensing for
  [`R0-03`](R0-03-licence-strategy.md) (inference).
- Three processor families, AMD x86, Nvidia Tegra, and Altera Cyclone FPGAs, cover 16 of the 49 host rows,
  which [`R3-07`](../../roadmap/research.md#phase-3-host-platforms)
  and [`R3-12`](../../roadmap/research.md#phase-3-host-platforms) can test by family
  (counted from the table; inference).
- [`R1-23`](../../roadmap/research.md#system-family-surveys) can start the Xbox One
  and Series X from Microsoft's Hot Chips slides
  ([Sell and O'Connor](https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf);
  [Andrews and Grossman](https://hc32.hotchips.org/assets/program/conference/day1/HotChips2020_GPU_Microsoft_Jeff_Andrews_v2.pdf))
  and the Series S from Microsoft's
  [Xbox Wire spec sheet](https://news.xbox.com/en-us/2020/09/09/introducing-xbox-series-s/), not from the Series S
  product page, whose CPU line is wrong.
  Xbox Developer Mode is a possible route to tests on retail hardware, within the developer agreement's testing clause
  (["Xbox family"](#xbox-family)).

## Open questions

- Which Snapdragon part the PlayStation Portal uses.
  Only a maker statement or a teardown from a registered source can answer it; no roadmap item depends on it,
  since the Portal has no survey.
- Which core the Evercade VS uses, Cortex-A53 or Cortex-A7, and its part number.
  Blaze's page gives only a quad-core 1.5 GHz processor; a registered teardown or maker statement would answer it,
  for [`R3-12`](../../roadmap/research.md#phase-3-host-platforms) if it lists the VS as a host.
- When the PS4 first went on sale in mainland China.
  Sony's announced date was found, the date of first sale was not;
  [`R1-21`](../../roadmap/research.md#system-family-surveys) answers it if the survey needs the regional release.
- The licence of each MiSTer core.
  The [register](../../../.claude/hooks/source-register.txt) walls MiSTer-devel's repositories until each is evaluated;
  the evaluation by ADR 0001's steps falls to the first item that cites a core,
  [`R3-12`](../../roadmap/research.md#phase-3-host-platforms) or a family survey,
  with [`R0-05`](R0-05-source-map.md) as the map of hubs.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext; each title links to the revision read, by its revision ID.

Wikipedia, surveyed families:

- ["PlayStation 3"](https://en.wikipedia.org/w/index.php?oldid=1386319117);
  ["PlayStation 3 models"](https://en.wikipedia.org/w/index.php?oldid=1386319150); "PlayStation 3 system software",
  `en.wikipedia.org/w/index.php?oldid=1386319155`, not linked: the register closes the page as a precaution,
  because it mentions leaked kits; ["RSX Reality Synthesizer"](https://en.wikipedia.org/w/index.php?oldid=1318869943).
- ["PlayStation 4"](https://en.wikipedia.org/w/index.php?oldid=1386319169);
  ["PlayStation 4 system software"](https://en.wikipedia.org/w/index.php?oldid=1385538186);
  ["PlayStation 5"](https://en.wikipedia.org/w/index.php?oldid=1385515902);
  ["PlayStation Portal"](https://en.wikipedia.org/w/index.php?oldid=1382191333).
- ["Xbox One"](https://en.wikipedia.org/w/index.php?oldid=1386323575);
  ["Xbox Series X and Series S"](https://en.wikipedia.org/w/index.php?oldid=1386594308);
  ["Xbox system software"](https://en.wikipedia.org/w/index.php?oldid=1386323584).
- ["Nintendo Switch"](https://en.wikipedia.org/w/index.php?oldid=1384604421);
  ["Nintendo Switch 2"](https://en.wikipedia.org/w/index.php?oldid=1386314413);
  ["Nintendo Switch system software"](https://en.wikipedia.org/w/index.php?oldid=1381894756);
  ["Nintendo Game Card"](https://en.wikipedia.org/w/index.php?oldid=1384974362);
  ["Tegra"](https://en.wikipedia.org/w/index.php?oldid=1385605682);
  ["Region lock"](https://en.wikipedia.org/w/index.php?oldid=1384605268).
- ["Seventh generation of video game consoles"](https://en.wikipedia.org/w/index.php?oldid=1386320369).

Wikipedia, other devices:

- ["List of home video game consoles"](https://en.wikipedia.org/w/index.php?oldid=1386685039);
  ["List of handheld game consoles"](https://en.wikipedia.org/w/index.php?oldid=1384273411);
  ["Ninth generation of video game consoles"](https://en.wikipedia.org/w/index.php?oldid=1384781485);
  ["Xbox"](https://en.wikipedia.org/w/index.php?oldid=1386174526);
  ["Intellivision Amico"](https://en.wikipedia.org/w/index.php?oldid=1384330319).
- ["Zeebo"](https://en.wikipedia.org/w/index.php?oldid=1384449469);
  ["Xperia Play"](https://en.wikipedia.org/w/index.php?oldid=1385402596).
- ["Playdate (console)"](https://en.wikipedia.org/w/index.php?oldid=1383318356);
  ["Arduboy"](https://en.wikipedia.org/w/index.php?oldid=1379368117);
  ["Thumby (console)"](https://en.wikipedia.org/w/index.php?oldid=1386650878);
  ["Nex Playground"](https://en.wikipedia.org/w/index.php?oldid=1386780212).
- ["GP2X"](https://en.wikipedia.org/w/index.php?oldid=1385314903);
  ["GP2X Wiz"](https://en.wikipedia.org/w/index.php?oldid=1377361946);
  ["Caanoo"](https://en.wikipedia.org/w/index.php?oldid=1354286783);
  ["Pandora (computer)"](https://en.wikipedia.org/w/index.php?oldid=1382382856);
  ["Dingoo"](https://en.wikipedia.org/w/index.php?oldid=1379337765);
  ["Game Gadget"](https://en.wikipedia.org/w/index.php?oldid=1353062161);
  ["GCW Zero"](https://en.wikipedia.org/w/index.php?oldid=1366037317);
  ["JXD"](https://en.wikipedia.org/w/index.php?oldid=1359557491).
- ["Ouya"](https://en.wikipedia.org/w/index.php?oldid=1386318623);
  ["GameStick"](https://en.wikipedia.org/w/index.php?oldid=1386313319);
  ["Nexus Player"](https://en.wikipedia.org/w/index.php?oldid=1380498656);
  ["Nvidia Shield TV"](https://en.wikipedia.org/w/index.php?oldid=1384340364);
  ["Amazon Fire TV"](https://en.wikipedia.org/w/index.php?oldid=1385876881);
  ["Apple TV (device)"](https://en.wikipedia.org/w/index.php?oldid=1386231890).
- ["Nvidia Shield Portable"](https://en.wikipedia.org/w/index.php?oldid=1381277348);
  ["Nvidia Shield Tablet"](https://en.wikipedia.org/w/index.php?oldid=1382229923);
  ["GPD XD"](https://en.wikipedia.org/w/index.php?oldid=1367516307);
  ["Logitech G Cloud"](https://en.wikipedia.org/w/index.php?oldid=1370941045);
  ["Razer Edge"](https://en.wikipedia.org/w/index.php?oldid=1366404016);
  ["Anbernic"](https://en.wikipedia.org/w/index.php?oldid=1384269816);
  ["Retroid Pocket 2"](https://en.wikipedia.org/w/index.php?oldid=1352232091);
  ["Ayn Odin"](https://en.wikipedia.org/w/index.php?oldid=1369017721);
  ["Mojo (microconsole)"](https://en.wikipedia.org/w/index.php?oldid=1386317773);
  ["Tecno Mobile"](https://en.wikipedia.org/w/index.php?oldid=1384988601).
- ["GPD Win"](https://en.wikipedia.org/w/index.php?oldid=1382382620);
  ["Ayaneo"](https://en.wikipedia.org/w/index.php?oldid=1373675588);
  ["Ayaneo 2"](https://en.wikipedia.org/w/index.php?oldid=1335970637);
  ["Steam Deck"](https://en.wikipedia.org/w/index.php?oldid=1385949939);
  ["Asus ROG Ally"](https://en.wikipedia.org/w/index.php?oldid=1385002726);
  ["Lenovo Legion Go"](https://en.wikipedia.org/w/index.php?oldid=1374923849);
  ["MSI Claw A1M"](https://en.wikipedia.org/w/index.php?oldid=1383630618);
  ["ROG Xbox Ally"](https://en.wikipedia.org/w/index.php?oldid=1386825038);
  ["Steam Machine"](https://en.wikipedia.org/w/index.php?oldid=1386682817);
  ["Atari VCS (2021 console)"](https://en.wikipedia.org/w/index.php?oldid=1386169078);
  ["Polymega"](https://en.wikipedia.org/w/index.php?oldid=1384342702).
- ["Analogue Nt"](https://en.wikipedia.org/w/index.php?oldid=1366437670);
  ["Analogue Nt Mini"](https://en.wikipedia.org/w/index.php?oldid=1366437694);
  ["Super Nt"](https://en.wikipedia.org/w/index.php?oldid=1380990970);
  ["Mega Sg"](https://en.wikipedia.org/w/index.php?oldid=1371477202);
  ["Analogue Pocket"](https://en.wikipedia.org/w/index.php?oldid=1384117105);
  ["Analogue 3D"](https://en.wikipedia.org/w/index.php?oldid=1386298948);
  ["MiSTer"](https://en.wikipedia.org/w/index.php?oldid=1364318909);
  ["ModRetro"](https://en.wikipedia.org/w/index.php?oldid=1384719948);
  ["ZX Spectrum Next"](https://en.wikipedia.org/w/index.php?oldid=1373891208).
- ["NES Classic Edition"](https://en.wikipedia.org/w/index.php?oldid=1386306036);
  ["Super NES Classic Edition"](https://en.wikipedia.org/w/index.php?oldid=1386310392);
  ["PlayStation Classic"](https://en.wikipedia.org/w/index.php?oldid=1386316834);
  ["Sega Genesis Mini"](https://en.wikipedia.org/w/index.php?oldid=1378865000);
  ["TurboGrafx-16 Mini"](https://en.wikipedia.org/w/index.php?oldid=1360861077);
  ["Neo Geo"](https://en.wikipedia.org/w/index.php?oldid=1384602234);
  ["Neo Geo X"](https://en.wikipedia.org/w/index.php?oldid=1377484786);
  ["Game Gear"](https://en.wikipedia.org/w/index.php?oldid=1377875769);
  ["Game & Watch: Super Mario Bros."](https://en.wikipedia.org/w/index.php?oldid=1371519076);
  ["The Legend of Zelda LCD games"](https://en.wikipedia.org/w/index.php?oldid=1385489888).
- ["Atari Flashback"](https://en.wikipedia.org/w/index.php?oldid=1386296269);
  ["Atari 2600+"](https://en.wikipedia.org/w/index.php?oldid=1384597237);
  ["RetroN"](https://en.wikipedia.org/w/index.php?oldid=1345465636);
  ["Evercade"](https://en.wikipedia.org/w/index.php?oldid=1384324203);
  ["Evercade VS"](https://en.wikipedia.org/w/index.php?oldid=1379582441);
  ["Super Pocket"](https://en.wikipedia.org/w/index.php?oldid=1383355276).
- ["Steam Frame"](https://en.wikipedia.org/w/index.php?oldid=1386446966);
  ["Meta Quest"](https://en.wikipedia.org/w/index.php?oldid=1385938275);
  ["Google Stadia"](https://en.wikipedia.org/w/index.php?oldid=1384327273);
  ["Amazon Luna"](https://en.wikipedia.org/w/index.php?oldid=1383355935);
  ["Xbox Cloud Gaming"](https://en.wikipedia.org/w/index.php?oldid=1384990660);
  ["OnLive"](https://en.wikipedia.org/w/index.php?oldid=1386318547).

Hubs:

- The hubs' home pages, cited where a section names the hub as a whole:
  [psdevwiki](https://www.psdevwiki.com/) and [SwitchBrew](https://switchbrew.org/wiki/Main_Page);
  the facts rest on the pages below.
- psdevwiki, read from existing archive captures, because the live pages served a challenge page to scripts:
  [PS3 "SKU Models"](https://web.archive.org/web/20261107043400/https://www.psdevwiki.com/ps3/SKU_Models)
  (capture 20261107043400; page last edited 2026-02-03),
  [PS4 "SKU Models"](https://web.archive.org/web/20260710164056/https://www.psdevwiki.com/ps4/SKU_Models)
  (capture 20260710164056; last edited 2025-09-22),
  [PS5 "SKU Models"](https://web.archive.org/web/20260312145723/https://www.psdevwiki.com/ps5/SKU_Models)
  (capture 20260312145723; last edited 2026-02-22),
  and [PS5 "Hypervisor"](https://web.archive.org/web/20260519183327/https://www.psdevwiki.com/ps5/Hypervisor)
  (capture 20260519183327; last edited 2024-10-30).
- SwitchBrew, read as raw wikitext: ["Hardware"](https://switchbrew.org/w/index.php?oldid=15339)
  (revision 15339),
  ["Switch 2: Hardware"](https://switchbrew.org/w/index.php?oldid=14956) (14956),
  ["Switch 2: Tegra T239"](https://switchbrew.org/w/index.php?oldid=15493) (15493),
  ["System Versions"](https://switchbrew.org/w/index.php?oldid=15460) (15460),
  ["Switch 2: System Versions"](https://switchbrew.org/w/index.php?oldid=15457) (15457),
  ["Gamecard"](https://switchbrew.org/w/index.php?oldid=12871) (12871).

Makers' documents:

- J. Sell and P.
  O'Connor,
  ["Xbox One Main SoC and Xbox One Kinect"](https://old.hotchips.org/wp-content/uploads/hc_archives/hc25/HC25.10-SoC1-epub/HC25.26.121-fixed-%20XB1%2020130826gnn.pdf),
  Hot Chips 25 (2013), slides, mostly images, read by OCR.
- J. Andrews and M.
  Grossman,
  ["Xbox Series X System Architecture"](https://hc32.hotchips.org/assets/program/conference/day1/HotChips2020_GPU_Microsoft_Jeff_Andrews_v2.pdf),
  Hot Chips 32 (2020), 29 pages, "© 2020 IEEE.
  Personal use of this material is permitted."; listed in the [HC32 Archive](https://hc32.hotchips.org/) programme,
  day 1, 2020-08-17.
- Microsoft, ["Xbox Series S"](https://www.xbox.com/en-US/consoles/xbox-series-s), "Tech specs",
  and ["Xbox Series X"](https://www.xbox.com/en-US/consoles/xbox-series-x), product pages.
- Microsoft, Xbox Wire,
  ["Xbox One Launches in China"](https://news.xbox.com/en-us/2014/09/29/xbox-one-launches-in-china/), 2014-09-29.
- Microsoft, Xbox Wire,
  ["Introducing Xbox Series S ..."](https://news.xbox.com/en-us/2020/09/09/introducing-xbox-series-s/), 2020-09-09, and
  its embedded [spec sheet](https://xboxwire.thesourcemediaassets.com/sites/2/2020/09/Tech-Specs-1.jpg), an image read
  by eye and by OCR.
- Microsoft,
  ["App Developer Agreement"](https://learn.microsoft.com/en-us/legal/windows/agreements/app-developer-agreement),
  Microsoft Store, version 8.11, published 2026-03-17, effective 2026-04-17; served as a PDF of 52 pages.
- Microsoft Learn,
  ["Xbox Developer Mode activation"](https://learn.microsoft.com/en-us/previous-versions/windows/uwp/xbox-apps/devkit-activation)
  and
  ["System resources for UWP apps and games on Xbox One"](https://learn.microsoft.com/en-us/previous-versions/windows/uwp/xbox-apps/system-resource-allocation),
  previous-versions documentation.
- Sony Computer Entertainment, press release of 2014-12-11,
  ["Sony Computer Entertainment Launches PlayStation Business in People's Republic of China ..."](https://www.sie.com/corporate/release/2014/141211.html),
  which redirects to the same release on Sony Interactive Entertainment's press pages.
- Sony,
  ["Source Code for Open-Source Software Used in PlayStation Portal Remote Player (US)"](https://www.playstation.com/en-us/oss/accessories/playstation-portal-remote-player/),
  listing system software versions 1.0.0 to 7.1.7.
- Nintendo,
  ["Nintendo Switch 2 Technical Specifications"](https://www.nintendo.com/us/gaming-systems/switch-2/tech-specs/),
  product page.
- Blaze, ["VS"](https://evercade.co.uk/vs/), the Evercade VS product page.

Secondary and metadata:

- iFixit, "Xbox Series X (2 TB Galaxy Black)", `https://www.ifixit.com/Device/Xbox_Series_X_2TB_Galaxy_Black`,
  and "Xbox Series X (Digital Edition)", `https://www.ifixit.com/Device/Xbox_Series_X_%28Digital_Edition%29`,
  device pages, under iFixit's content licence, CC BY-NC-SA 3.0 (`https://www.ifixit.com/Info/Licensing`).
  Not linked: the register closes iFixit for that licence's non-commercial term, so only the part titles were read.
- GitHub, repository licence metadata, field `license.spdx_id`,
  read through the [REST API's repository endpoint](https://docs.github.com/en/rest/repos/repos#get-a-repository)
  for [Main_MiSTer](https://github.com/MiSTer-devel/Main_MiSTer),
  [Distribution_MiSTer](https://github.com/MiSTer-devel/Distribution_MiSTer),
  [Template_MiSTer](https://github.com/MiSTer-devel/Template_MiSTer),
  and [Menu_MiSTer](https://github.com/MiSTer-devel/Menu_MiSTer).
  The register walls the repositories, so only their metadata was read.

Licences:

- Panic, [Playdate SDK License 1.0](https://play.date/dev/sdk-license/), dated 2022-02-25.

Project documents:

- The [research roadmap](../../roadmap/research.md); [ADR 0001](../../adr/0001-restrict-reading-by-licence-tier.md);
  the [source register](../../../.claude/hooks/source-register.txt).
- [`R0-02`](R0-02-legal-baseline.md), [`R0-05`](R0-05-source-map.md), [`R1-04`](R1-04-primer-modern.md),
  [`R1-05`](R1-05-catalogue-8-and-16-bit.md), and [`R1-07`](R1-07-catalogue-sixth-generation.md), as merged.

[`R1-03`]: R1-03-primer-sixth-generation.md
[`R1-04`]: R1-04-primer-modern.md
[`R1-05`]: R1-05-catalogue-8-and-16-bit.md
[`R1-07`]: R1-07-catalogue-sixth-generation.md
[`R1-13`]: ../../roadmap/research.md#system-family-surveys
[`R1-14`]: ../../roadmap/research.md#system-family-surveys
[`R1-15`]: ../../roadmap/research.md#system-family-surveys
[`R1-17`]: ../../roadmap/research.md#system-family-surveys
[`R1-20`]: ../../roadmap/research.md#system-family-surveys
[`R1-21`]: ../../roadmap/research.md#system-family-surveys
[`R1-23`]: ../../roadmap/research.md#system-family-surveys
[`R1-25`]: ../../roadmap/research.md#system-family-surveys
