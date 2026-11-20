---
title: "Modern consoles and handhelds, including systems on sale today: catalogue"
roadmap_item: R1-08
status: draft
date: 2026-11-20
---

# Modern consoles and handhelds, including systems on sale today: catalogue

## Summary

This note asks which dedicated consoles and handhelds were sold from the seventh generation to 2026-11-20,
and what hardware, protection, system software, and sources each has.
It lists the 20 models and revisions of the three surveyed families
(PlayStation 3, 4, and 5 with the PlayStation Portal; Xbox One and Xbox Series; Switch and Switch 2),
11 minor dedicated consoles, about 50 devices that the owner's rule makes emulator hosts
(36 rows), 12 devices whose class the rule does not settle, and 3 announced systems not yet sold.
For the surveyed families, SwitchBrew and psdevwiki give model-level data beyond Wikipedia;
for the Xbox One and Xbox Series, and for every other row, Wikipedia is the only hardware source cited.
Two facts matter most to Rustalgia: every surveyed family is still sold or supported as of 2026-11-20,
and the PlayStation and Nintendo families had system software releases in 2026
(from the rows below),
and the rule for emulator hosts leaves the class of the Evercade, Atari VCS, open Linux handhelds,
and similar devices to the owner.
This note is not legal advice.

## Scope

- Question: which dedicated consoles and handhelds were sold from the seventh generation to 2026-11-20, and for each,
  what are its maker, release, processor, graphics, media, protection, system software, survey, and sources?
- Covered: every model and revision of the systems whose family surveys depend on `R1-04`
  (`R1-14`, `R1-21`, `R1-23`, as "How the catalogue is built" sets out),
  other dedicated game devices first sold from 2005, emulator hosts as a list, and systems announced but not sold.
  How the hardware works is left to the primer (`R1-04`); each family's emulators to its survey;
  the law on encryption and keys to `R0-02`; each hub's evaluation to `R0-05`;
  emulator hosts as platforms to `R3-07` and `R3-12`.
  The Xbox 360, Wii, Wii U, 3DS, and Vita are in the previous era's catalogue (`R1-07`), by their surveys.
- Researched on 2026-11-20 against the Wikipedia revisions, wiki revisions, and archived copies listed in Sources.
  Every statement about a system on sale is as of 2026-11-20.
- How claims were checked: two research agents each covered a share
  (the surveyed families; every other device)
  and read every page as raw text, Wikipedia through its raw wikitext, SwitchBrew through its raw wikitext,
  and psdevwiki through existing web archive captures, because the live site served a challenge page.
  A second, independent pass fetched the sources again and tested each claim and quotation;
  its corrections were checked against the sources and applied,
  and the claims it could not check are listed in the pull request.
  Wikipedia is a tertiary source: a value with no hub named rests on the article's own text,
  whose citations were not followed. "(inference)" marks reasoning,
  and "(from memory)" a claim no fetched page confirmed.
  A statement that nothing was found records the searches made, not proof of absence.
- No firmware, key, game, development kit, exploit, or emulator code was opened.

## Findings

### How the catalogue is built

- An era holds the systems whose family survey depends on its primer (roadmap, "Hardware primers").
  `R1-14` (Switch and Switch 2), `R1-21` (PlayStation 3, 4, and 5), and `R1-23`
  (Xbox, Xbox 360, and later)
  depend on `R1-04`; `R1-23` also depends on `R1-03`, which holds the original Xbox and the Xbox 360.
- Other devices are placed by date: those first sold in 2005 or later,
  the year the seventh generation began with the Xbox 360, are listed here,
  a rule this note adds because no survey places them (inference).
  The previous catalogue's share runs to 2012 for minor handhelds, so the two overlap;
  "Boundary cases" lists the overlap.
- The roadmap lists "PC and Android handhelds, microconsoles, FPGA devices,
  and retro "mini" consoles" as emulator hosts, not systems to emulate (roadmap, "Hardware primers").
  Devices the rule names are listed as hosts; devices it does not name are flagged, with the two readings,
  for the owner.
- A row is one model, or a model with its revisions where they run the same software.
  "Hub" names the best registered source other than Wikipedia; a dash means Wikipedia was the only source cited.
- Regions: NA North America, EU Europe, UK United Kingdom, JP Japan, KR South Korea, AU Australia, NZ New Zealand,
  HK Hong Kong, TW Taiwan, CN mainland China, BR Brazil.
- Wikipedia's model pages for the PlayStation 3 and its articles on each console give dates that differ in month
  for several models; where they differ, the row gives the article on the console and the finding names the other.

### PlayStation family

| Model (codes) | First release | Survey | Hub |
|---|---|---|---|
| PlayStation 3 (CECHA to CECHQ) | JP 2006-11-11; NA, HK, TW 2006-11-17; EU, AU 2007-03-23 | `R1-21` | psdevwiki |
| PlayStation 3 Slim (CECH-20xx to 30xx) | NA, EU 2009-09-01; JP, AU, NZ 2009-09-03 | `R1-21` | psdevwiki |
| PS3 Super Slim (CECH-40xx to 43xx) | NA 2012-09-25 (250 GB); AU 2012-09-27; UK 2012-09-28 | `R1-21` | psdevwiki |
| PlayStation 4 (CUH-10xx to 12xx) | NA 2013-11-15; EU, AU 2013-11-29; JP 2014-02-22 | `R1-21` | psdevwiki |
| PlayStation 4 Slim (CUH-20xx to 22xx) | 2016-09-15 | `R1-21` | psdevwiki |
| PlayStation 4 Pro (CUH-70xx to 72xx) | worldwide 2016-11-10 | `R1-21` | psdevwiki |
| PS5 and Digital Edition (CFI-10xx to 12xx) | NA, JP, KR, AU, NZ 2020-11-12; others 2020-11-19 | `R1-21` | psdevwiki |
| PlayStation 5 Slim and Slim Digital (CFI-20xx) | 2023-11 | `R1-21` | psdevwiki, partly |
| PlayStation 5 Pro (CFI-70xx, 71xx) | worldwide 2024-11-07 | `R1-21` | psdevwiki |
| PlayStation Portal | JP, NA, EU, AU 2023-11-15 | none named | — |

| Model | CPU | Graphics | Memory | Media and storage |
|---|---|---|---|---|
| PlayStation 3 | Cell, 3.2 GHz: 1 PPE, 7 SPEs | RSX | 256 MB XDR, 256 MB GDDR3 | BD, DVD, CD; HDD 20 to 160 GB |
| PS3 Slim | Cell, 45 nm | RSX, 65 then 40 nm | as PS3 | BD, DVD, CD; HDD 120 to 320 GB |
| PS3 Super Slim | Cell, 45 nm | RSX, 40 or 28 nm | as PS3 | BD, DVD, CD; flash or HDD |
| PlayStation 4 | 8 Jaguar cores, 1.6 GHz | GCN, 18 CUs, 800 MHz | 8 GB GDDR5, 256 MB DDR3 | BD, DVD; HDD |
| PS4 Pro | 8 Jaguar cores, 2.13 GHz | GCN, 36 CUs, 911 MHz | 8 GB GDDR5, 1 GB DDR3 | BD (no UHD BD); HDD 1 or 2 TB |
| PlayStation 5 | 8 Zen 2 cores, to 3.5 GHz | RDNA 2, 36 CUs, to 2.23 GHz | 16 GB GDDR6 | UHD BD (disc); 825 GB SSD |
| PS5 Pro | Zen 2, to 3.85 GHz | 60 CUs, to 2.35 GHz | 16 GB GDDR6, 2 GB DDR5 | 2 TB SSD; no drive |
| PlayStation Portal | Snapdragon, model unclear | 8-inch 1080p LCD | not stated | none |

- Every value in the two tables rests on the Wikipedia articles "PlayStation 3", "PlayStation 3 models",
  "PlayStation 4", "PlayStation 5", and "PlayStation Portal"
  (infoboxes and "Technical specifications" or "Hardware" sections),
  with process sizes and model codes from psdevwiki's "SKU Models" pages for the PS3, PS4, and PS5,
  except where a bullet below names another source.
- The PS3's Cell has one PowerPC-based PPE and seven working SPEs,
  of which six are available to games and one is reserved for the operating system
  ("PlayStation 3", "Technical specifications").
  The RSX's clock is given as 500 MHz in that article's infobox and as 550 MHz in "RSX Reality Synthesizer",
  so the table gives none.
- PS2 compatibility differs by model: CECHA and CECHB do it in hardware, CECHC and CECHE in part by software,
  and later models not at all (psdevwiki, PS3 "SKU Models", column "PS2 mode").
  Of the CECHC and CECHE units, Wikipedia says "it retains the "Graphics Synthesizer" GPU resulting in a hybrid hardware
  and software emulation" ("PlayStation 3 models", "Original model").
  Every model runs original PlayStation games in software (same article).
- psdevwiki's "SKU Release date" column differs from Wikipedia's "First available" dates in month
  for several original models; the PS3 page's dates reflect firmware batches, not first retail sale
  (psdevwiki, PS3 "SKU Models").
  The Super Slim's flash model is "12 GB" in "PlayStation 3 models" and 16 GB of eMMC, 12 GB of it counted,
  in psdevwiki; the physical part is 16 GB by psdevwiki's row (inference).
- The PS3's system software was at version 4.93, dated 2026-03-18,
  and Wikipedia says it "continues to be updated as of 2026 for performance and security enhancements,
  and to renew the Blu-ray encryption key" ("PlayStation 3 system software", lead and infobox).
  Purchased PlayStation Network content is limited to two activated consoles per account,
  the OtherOS feature was removed by firmware 3.21 of 2010-04-01, and every PS3 game but one is region-free
  ("PlayStation 3", "Digital rights management"; "Region lock", "Sony").
- The PS4's APU has two quad-core Jaguar modules, seven cores of which are for games, a secondary low-power processor,
  an audio module, and a hardware zlib decompression unit ("PlayStation 4", "Technical specifications").
  Its system software, Orbis OS, is a fork of FreeBSD 9, at version 14.02 dated 2026-11-04
  ("PlayStation 4 system software").
  "Games are not region-locked, so games purchased in one region can be played on consoles in all regions"
  ("PlayStation 4"), though downloadable content needs an account of its region ("Region lock", "Sony").
- The PS4 Slim and Pro were both announced on 2016-09-07; the Pro added checkerboard-rendering hardware and 4K output
  ("PlayStation 4", "PlayStation 4 Slim", "PlayStation 4 Pro").
  Later Pro revisions are CUH-71xx (late 2017) and CUH-72xx (November 2018) (psdevwiki, PS4 "SKU Models").
  The PS4's mainland China release date is not given in "PlayStation 4"; the row leaves it out.
- The PS5's storage is an 825 GB soldered SSD with a hardware decompression unit for zlib and Oodle Kraken,
  and an M.2 slot added by an update in September 2021; PS5 games cannot run from USB storage
  ("PlayStation 5", "Storage architecture").
  Its audio is the "Tempest Engine", and its graphics interface is Sony's "AGC" ("PlayStation 5", "Hardware").
- psdevwiki describes a custom hypervisor on the PS5: "In the PS5 case,
  it is used primarily for Virtualization Based Security (VBS) to protect the kernel integrity"
  (psdevwiki, PS5 "Hypervisor", lead).
  PS5 discs and downloadable content carry no region codes ("Region lock", "Sony").
- Later PS5 models: the 1100 series of August 2021, the 1200 series of August 2022,
  the CFI-2000 Slim of November 2023 with 1 TB, and a Slim Digital reduced to 825 GB from September 2025,
  which a citation in the article names CFI-2116
  ("PlayStation 5", "Standard model", "PlayStation 5 Slim", "Internal storage reduction").
  psdevwiki's capture of 2026-03-12 lists no 825 GB Slim Digital model.
  The last digits of each CFI code encode the region, for example 00 for Japan and 15 for the United States, Canada,
  and Mexico (psdevwiki, PS5 "SKU Models", column "Region").
- The PS5 Pro has a 60-CU GPU that the article calls a mix of RDNA 2 and RDNA 3 with RDNA 4 ray-tracing units,
  machine-learning upscaling called "PSSR", and no disc drive; a second chassis, CFI-7100, followed in September 2025
  ("PlayStation 5", "PlayStation 5 Pro"; psdevwiki, PS5 "SKU Models").
- As of 2026-11-20 the PS5 had system software update 14 of 2026-09-16 and Sony's figure of 100 million units
  as of 2026-11-10 ("PlayStation 5", "Software updates" and infobox).
  In July 2026 Sony announced it would stop producing physical PlayStation game discs from January 2028
  ("PlayStation 5", "Marketing and release").
- The PlayStation Portal streams games from a PS5, "although it does not run any games or media natively on its own"
  ("PlayStation Portal", lead).
  It runs a modified Android 13 on a Snapdragon part that the article's text calls "662"
  while linking the article on the Snapdragon 660; Sony's open-source page lists its system software releases
  ("PlayStation Portal", "Hardware and technicals"; Sony, open-source software, PlayStation Portal).
  It has a row here because it is sold as part of the family;
  whether a streaming client belongs in the catalogue is open (Open questions).

### Xbox family

| Model (model number) | First release | Survey | Hub |
|---|---|---|---|
| Xbox One (1540; Elite SKU) | 13 markets 2013-11-22; JP 2014-09-04 | `R1-23` | — |
| Xbox One S (1681); One S All-Digital | 2016-08-02 (2 TB); All-Digital 2019-05-07 | `R1-23` | — |
| Xbox One X (1787) | 2017-11-07 | `R1-23` | — |
| Xbox Series X | 2020-11-10; CN 2021-06-10 | `R1-23` | — |
| Xbox Series S | 2020-11-10; CN 2021-06-10 | `R1-23` | — |
| Series refresh models; Series X25 edition | 2024-10-15; X25 2026-11-12 | `R1-23` | — |

| Model | CPU | Graphics | Memory | Media and storage |
|---|---|---|---|---|
| Xbox One | 8 Jaguar cores, 1.75 GHz | GCN, 12 CUs, 853 MHz | 8 GB DDR3, 32 MB ESRAM | BD, DVD, CD; HDD or SSHD |
| Xbox One S | as One | GCN, 914 MHz | as One | UHD BD (none on All-Digital) |
| Xbox One X | 8 cores, 2.3 GHz | GCN, 40 CUs, 1172 MHz | 12 GB GDDR5 | UHD BD; 1 TB HDD |
| Xbox Series X | 8 Zen 2 cores, 3.8 GHz | RDNA 2, 52 CUs, 1.825 GHz | 16 GB GDDR6 in two pools | UHD BD; 1 TB SSD |
| Xbox Series S | 8 Zen 2 cores, 3.6 GHz | RDNA 2, 20 CUs | 10 GB GDDR6 in two pools | no drive; 512 GB or 1 TB SSD |

- Every value rests on the Wikipedia articles "Xbox One" and "Xbox Series X and Series S"
  (infoboxes, "Internals", "Hardware comparison", and the sections on each model), unless a bullet names another source.
  No registered source beyond Wikipedia was found for any Xbox One or Series model; the Microsoft developer pages,
  conference talks, and journal papers that might hold one are unregistered and were not searched.
- Xbox One release: 13 markets on 2013-11-22, then 26 more in September 2014 including Japan;
  the article gives mainland China as 2014-09-29 in its infobox and as July 2014 in its sales text ("Xbox One").
  Production of the family ended in 2020 (same article).
- The Xbox One's system software runs games and apps in two partitions under a hypervisor:
  "The Xbox System Software contains a heavily modified Hyper-V hypervisor
  (known as NanoVisor) as its host OS and two partitions" ("Xbox system software").
  Its current version was 10.0.25398.2923 ("Xbox One", infobox).
- The Xbox One shipped region-free after plans for a region lock; Xbox Series X and Series S are region-free
  ("Region lock", "Xbox One and Xbox Series X/S").
- The One X's processor is compatible with Jaguar and, by the article, unrelated to Ryzen ("Xbox One", "Xbox One X").
- The Series X has one CPU core for the operating system and two memory pools of different bandwidth;
  the Series S's GPU clock is 1.565 GHz in the infobox and 1.55 GHz in the text, so the table gives none
  ("Xbox Series X and Series S", "Xbox Series X", "Xbox Series S").
- Series storage is a custom NVMe SSD with a decompression block for zlib and Microsoft's "BCPack" texture format,
  expansion through proprietary cards, and no running of native games from USB
  ("Xbox Series X and Series S", "Xbox Velocity Architecture").
  "The console has dedicated audio hardware acceleration" (same article, "Video and audio rendering technologies").
- Every retail Series console can enter "Dev mode", a sandbox for testing software (same article, "Software").
  Its scope was not read; whether it is a lawful route to hardware tests is an inference left open.
- Series models as of 2026-11-20: a 1 TB Series S of 2023-09-01; on 2024-10-15 a white 1 TB Series S,
  a white all-digital Series X, and a 2 TB Series X; the 2 TB Series X discontinued on 2026-08-01;
  and the Series X25 limited edition of 25,000 units released on 2026-11-12
  ("Xbox Series X and Series S", "Mid-generation refreshes and Limited Editions" and "Sales").
- Model numbers for the Series X and Series S are not on the pages read; the table leaves them out.
  An audio block in the Xbox One, and a security processor in either family, are not described in the articles read
  (searches of "Xbox One", "Xbox Series X and Series S", and "Xbox system software" for "SHAPE", "audio processor",
  "Pluton", and "security").

### Nintendo family

| Model (codes) | First release | Survey | Hub |
|---|---|---|---|
| Switch (HAC-001, HAC-001(-01)); CN Tencent model | JP, NA, EU, AU 2017-03-03; CN 2019-12-10 | `R1-14` | SwitchBrew |
| Switch Lite (HDH-001) | worldwide 2019-09-20 | `R1-14` | SwitchBrew |
| Switch OLED Model (HEG-001) | 2021-10-08 | `R1-14` | SwitchBrew |
| Switch 2; Japan-only model; EU battery revision | JP, NA, EU, AU and others 2025-06-05 | `R1-14` | SwitchBrew |

| Model | CPU | Graphics | Memory | Media and storage |
|---|---|---|---|---|
| Switch | Tegra X1, then X1+: 4 A57 cores, 1.02 GHz | Maxwell, 256 cores, 768 MHz | 4 GB LPDDR4 | cards; 32 GB eMMC |
| Switch Lite | Tegra X1+ | as Switch, handheld only | 4 GB LPDDR4 | game cards; 32 GB eMMC |
| Switch OLED Model | Tegra X1+ | as Switch | 4 GB LPDDR4 | game cards; 64 GB eMMC |
| Switch 2 | T239: 8 Cortex-A78C cores | Ampere, 1,536 cores | 12 GB LPDDR5X | Switch 2 and Switch cards; 256 GB |

- Every value rests on the Wikipedia articles "Nintendo Switch" and "Nintendo Switch 2" and on SwitchBrew's "Hardware",
  "Switch 2: Hardware", and "Switch 2: Tegra T239" pages, unless a bullet names another source.
  The SoC part numbers agree between SwitchBrew's "Hardware" and Wikipedia's "Tegra".
- The Switch's GPU runs at 768 MHz docked; the Switch uses only the four Cortex-A57 cores of the Tegra X1,
  one of them for the operating system, with a 1.785 GHz boost mode for loading added by firmware in April 2019;
  its GPU runs at 307.2, 384, or 460 MHz undocked ("Nintendo Switch", "SoC, CPU, GPU and RAM").
- In April 2018 two groups found a flaw in the Tegra X1's boot ROM that software cannot patch;
  Nintendo fixed it in units from about July 2018 and in the Tegra X1+
  ("Nintendo Switch", "Security"; "Tegra", Tegra X1 section).
  The revised HAC-001(-01), with the X1+, followed in August 2019 ("Nintendo Switch", "Later revisions").
- Switch game cards hold 1 to 32 GB, are not writable, and connect through a game-card ASIC on the console
  ("Nintendo Game Card", "Nintendo Switch"; SwitchBrew, "Gamecard", "Protocol"; SwitchBrew, "Hardware").
  The Switch is region-free except that the Tencent model plays only Chinese content
  ("Nintendo Switch", "Distribution"; "Region lock", "Nintendo").
- The Switch's system software, Horizon, is shared by the Switch and Switch 2; SwitchBrew lists version 23.5.0 for both,
  released on 2026-11-10 (UTC) ("Nintendo Switch system software", lead; SwitchBrew, "System Versions" and "Switch 2:
  System Versions").
- As of 2026-11-20 the Switch was still sold;
  Nintendo announced in July 2026 that sales in Europe will stop from February 2027, while continuing elsewhere
  ("Nintendo Switch", "Discontinuation").
- The Switch Lite is handheld only, with integrated controls and no TV output
  ("Nintendo Switch", "Nintendo Switch Lite").
- The Switch 2's CPU runs at 998 MHz docked and 1,101 MHz undocked, and its GPU at 1,007 MHz docked and 561 MHz undocked
  ("Nintendo Switch 2", infobox).
  Its memory bandwidth is given three ways: 120 GB/s by SwitchBrew, about 102 GB/s docked by Wikipedia's text,
  and 102.4 GB/s by "Tegra" (SwitchBrew, "Switch 2: Tegra T239"; "Nintendo Switch 2", "Console"; "Tegra").
- Switch 2 game cards come in 16, 32, and 64 GB; "Nintendo Switch 2 Edition" cards work in both consoles;
  and Game-Key Cards hold only a licence: "they contain no data on them other than a digital license for the game,
  which requires the software to be downloaded" ("Nintendo Game Card", "Nintendo Switch 2" and "Game-Key Card").
- SwitchBrew says the T239 appears to support pointer authentication,
  and "Memory within certain carveout regions is encrypted"
  (SwitchBrew, "Switch 2: Tegra T239", "Notable Security Features").
  Nintendo ties a unique identifier to each game card and has banned consoles that used flash carts
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

Each row rests on the Wikipedia article on the device, unless it names another source.

| Device | Maker | First release | CPU | Media |
|---|---|---|---|---|
| Game Wave | ZAPiT Games | 2005-10 | Mediamatics 8611 | DVD-ROM |
| Gizmondo | Tiger Telematics | 2005-03-19 | Samsung S3C2440, ARM9 | SD and MMC cards |
| Advanced Pico Beena | Sega Toys | JP 2005 | ARM7TDMI, 81 MHz | cartridges |
| V.Smile Baby | VTech | 2006 | not stated | not stated |
| V.Flash | VTech | 2006-09 | ARM9 from LSI Logic | CD-ROM "V.Discs" |
| HyperScan | Mattel | NA 2006-10-23 | Sunplus SPG290, 108 MHz | CD-ROM and RFID cards |
| Zeebo | Zeebo Inc. | BR 2009-05-25 | ARM11-based, 528 MHz | download over 3G |
| Playdate | Panic | 2022-04-19 | STM32F746, Cortex-M7F | downloads |
| Arduboy | Kevin Bates | 2016 | ATmega32U4 | flash |
| Thumby | TinyCircuits | 2022 | RP2040, 2 Cortex-M0+ cores | flash |
| Nex Playground | Nex Team | 2023-12 | Amlogic A311D2-NOD | downloads |

- The Gizmondo ran Windows CE and was discontinued on 2006-02-06 ("Gizmondo", infobox).
- The Beena's processor is from "List of home video game consoles",
  and the two Wikipedia articles disagree on its sales; V.Smile Baby's row is only that list's
  (both from "List of home video game consoles"; "Sega Pico", "Advanced Pico Beena").
  The V.Flash article carries a "more citations needed" banner.
- HyperScan's RFID reader reads and writes cards that unlock features and save data, so a game is a disc plus a card
  ("HyperScan", lead and infobox).
- Zeebo sold games only as downloads over a built-in 3G modem, in Brazil and then Mexico,
  and was discontinued on 2011-09-30 ("Zeebo", lead and infobox).
- The Playdate has a 400 × 240 1-bit display, a crank, and an accelerometer;
  its games arrive in "seasons" and through a store added on 2023-03-07 ("Playdate (console)", "Hardware" and "Games").
  Panic's SDK licence says its terms apply to the documentation of the programming interfaces as well,
  and forbids using the SDK "to develop applications for other platforms
  or to develop another SDK" without Panic's written permission (Panic, Playdate SDK License 1.0, section 2).
  The register closes Panic's SDK documentation for that reason;
  the effect on an emulator is a risk for `R0-02` and `R0-03` (inference).
- The Arduboy's infobox gives no release date; the year is from "List of handheld game consoles".
  Successors are the Arduboy FX and FX-C ("Arduboy").
- Nex Playground runs an Android-based "Play OS" and depends on a built-in camera with motion tracking;
  its games download and then play offline ("Nex Playground", infobox and body).
  It is classed here as a dedicated console because it runs its own closed library, though it is Android-based
  (inference; flagged in "Boundary cases").
- No lock-out or protection is described in any of these articles
  (searches of each article for "protect", "lock", "encrypt", and "sign");
  the Playdate's licence limits documentation, not the device.

### Emulator hosts

The roadmap's rule lists these as hosts, covered by `R3-07` and `R3-12`.
Each row rests on the Wikipedia article on the device or line, read raw.

| Device or line | Maker | First release | Rule's class | Processor family |
|---|---|---|---|---|
| Nvidia Shield Portable | Nvidia | 2013-07-31 | Android handheld | Tegra 4 |
| Nvidia Shield Tablet | Nvidia | NA 2014-07-29 | Android handheld | Tegra K1 |
| GPD XD | GamePad Digital | 2015 | Android handheld | not stated |
| Logitech G Cloud | Logitech, Tencent | NA 2022-10-17 | Android handheld | Snapdragon 720G |
| Razer Edge | Razer | 2023-01-26 | Android handheld | Snapdragon G3x Gen 1 |
| Anbernic line | Shenzhen YangLiMing | 2017 | Android or Linux handheld | not stated |
| GPD Win line | GamePad Digital | 2016-10 | PC handheld | Intel Atom, then others |
| Ayaneo line | Anyun Intelligent Technology | 2021 | PC handheld | AMD Ryzen |
| Steam Deck (LCD; OLED) | Valve | NA, EU 2022-02-25 | PC handheld | AMD Zen 2, RDNA 2 |
| ROG Ally; Ally X | Asus | 2023-06-13 | PC handheld | AMD Zen 4, RDNA 3 |
| Legion Go line | Lenovo | 2023-10-31 | PC handheld | AMD Ryzen Z1, then Z2 |
| MSI Claw A1M | MSI | 2024-03 | PC handheld | Intel Core Ultra |
| Tecno Pocket Go | Tecno Mobile | 2024 | PC handheld | AMD Ryzen 7 |
| ROG Xbox Ally; Ally X | Asus, with Microsoft | 2025-10-16 | PC handheld | AMD Ryzen Z2 |
| Ouya | Ouya, Inc. | 2013-06-25 | microconsole | Tegra 3 |
| GameStick | PlayJam | 2013-11-15 | microconsole | Amlogic, Cortex-A9 |
| Nexus Player | Google, Asus | 2014-11-03 | microconsole | Intel Atom |
| Nvidia Shield TV | Nvidia | NA 2015-05-28 | microconsole | Tegra X1, then X1+ |
| Amazon Fire TV | Amazon | NA 2014-04-12 | microconsole | Snapdragon, then MediaTek |
| Apple TV, from 2015 | Apple | 2015 | microconsole | Apple A8 and later |
| Steam Machine | Valve | 2026-06-29 | PC (microconsole reading) | AMD Zen 4, RDNA 3 |
| Analogue Nt mini; Super Nt; Mega Sg | Analogue | 2017-01-23 to 2019-03-25 | FPGA | Altera Cyclone V |
| Analogue Pocket | Analogue | 2021-12-13 | FPGA | Cyclone V and Cyclone 10 |
| Analogue 3D | Analogue | 2025-11-18 | FPGA | Cyclone 10 GX |
| MiSTer | open project | not stated | FPGA | DE10-Nano board |
| ModRetro Chromatic; M64 | ModRetro | 2024; M64 not dated | FPGA | MiSTer components |
| NES and Super NES Classic Editions | Nintendo | 2016-11-10; 2017-09-29 | retro mini | Allwinner R16 |
| PlayStation Classic | SIE | 2018-12-03 | retro mini | MediaTek MT8167A |
| Genesis Mini; Mini 2 | Sega, with M2 | 2019-09-19; 2022-10-27 | retro mini | ZUIKI Z2713 |
| TurboGrafx-16 Mini | Konami, with M2 | JP 2020-03-19 | retro mini | not stated |
| Neo Geo Mini; Neo Geo X | SNK; Tommo | 2018-07-24; 2012-12-18 | retro mini | not stated; Ingenic JZ4770 |
| Game Gear Micro | Sega | JP 2020-10-06 | retro mini | not stated |
| Game & Watch (2020, 2021) | Nintendo | 2020-11-13; 2021-11-12 | retro mini | STM32H7B0 |
| Atari Flashback line; 2600+ | AtGames; Atari, Plaion | not stated; 2023-11-17 | retro mini | Rockchip 3128 (2600+) |
| RetroN line | Hyperkin | 2014 | retro mini | not stated |

- The Steam Deck runs SteamOS, plays Windows games through Proton,
  and has a desktop mode in which users install other software
  ("Steam Deck", lead and "Development"); no lock-out against user software is described.
  Its LCD models were discontinued on 2025-12-19 (same article, infobox).
- The ROG Xbox Ally's "Xbox mode" "boots the system directly into the Xbox app without loading the full Windows shell by
  default" ("ROG Xbox Ally"); it is a Windows PC, not an Xbox console (inference from the article's "Handheld PC" type).
  Wikipedia's type field calls the Asus ROG Ally and MSI Claw A1M handheld game consoles and the Steam Deck, Legion Go,
  and ROG Xbox Ally handheld PCs, so the field cannot decide the class (each article's infobox).
- The Steam Machine of 2026 was released on 2026-06-29 after a reservation waitlist, at a base price above US$1,000;
  Valve stopped offering waitlist places in November 2026 ("Steam Machine", infobox and "Release").
  The Steam Machines of 2015 to 2018 were third-party PCs to a Valve specification ("Steam Deck", "Development").
- The Analogue Pocket's FPGA is reprogrammed to replicate the Game Boy, Game Boy Color, and Game Boy Advance,
  and takes other handhelds' cartridges through adapters ("Analogue Pocket", "Hardware").
  Wikipedia says of MiSTer, "The project is licensed under version 3 of the GNU General Public Licence";
  the register walls the project's repositories "per core", so the two readings differ ("MiSTer"; register).
  ModRetro's Chromatic "uses open-source components from the MiSTer FPGA project" ("ModRetro").
  Wikipedia says the M64 is "planned for release in 2026"; whether it shipped by 2026-11-20 was not established.
- The Atari 2600+ plays original 2600 and 7800 cartridges
  but "uses software-based emulation instead of a binary compatible system-on-chip hardware", so some cartridges fail
  ("Atari 2600+"; the quotation drops link markup).
  Of the RetroN 5, Wikipedia reports that RetroArch's developers said "the RetroN 5 violates several licenses",
  because it shipped emulators under a non-commercial licence ("RetroN", "RetroN 5 (2014)").
- Wikipedia describes the Anbernic line as playing older systems "through software emulation"
  and quotes a newspaper calling them "unofficial handhelds" ("Anbernic"; the newspaper was not opened).
- No articles exist for the Retroid Pocket, AYN Odin, Miyoo Mini, OneXPlayer, Zotac Zone, Mad Catz M.O.J.O.,
  Razer Forge TV, Analogue Duo, Legion Go S, or Atari 7800+
  (each title returned 404 from Wikipedia); they are not listed in the table.
- Hardware clusters: the Shield TV uses the Switch's Tegra X1 and X1+;
  the NES and Super NES Classic Editions share the Allwinner R16; the Neo Geo X shares the GCW Zero's Ingenic JZ4770;
  the Steam Deck and the ROG Xbox Ally (Z2 A) both pair Zen 2 with RDNA 2
  (the rows above and their articles; the grouping is the note's).

### Flagged: devices the rule does not settle

| Device | Maker | First release | Reading as console | Reading as host |
|---|---|---|---|---|
| Evercade handheld, VS, EXP, Nexus | Blaze | 2020-05-22 | own cartridges; a native game | licensed emulators |
| Super Pocket | HyperMegaTech! (Blaze) | 2023-11-14 | plays Evercade cartridges | as Evercade |
| Polymega | Playmaji | 2021-09-12 | own modules | licensed emulators, x86 Linux |
| Atari VCS (2021) | Atari | NA 2021-06-15 | marketed as a console | x86 PC with Debian-based OS |
| GP2X; GP2X Wiz; Caanoo | GamePark Holdings | KR 2005-11-10 | own homebrew | emulation focus, Linux |
| Dingoo A320, A330 | Dingoo Digital | 2009 (from memory) | own games | sold with emulators |
| GCW Zero | Game Consoles Worldwide | 2013 | homebrew | "homebrew and emulation" |
| Pandora | OpenPandora | 2010-05 | handheld games | handheld computer |
| Analogue Nt (2015) | Analogue | 2015 | original Nintendo chips | neither: no emulation inside |
| Atari Flashback 2, 2+ | AtGames | not stated | a hardware re-implementation | retro mini |
| ZX Spectrum Next | SpecNext | 2017-12 | home computer | FPGA computer |
| Xperia Play | Sony Ericsson | 2011 | game phone | Android phone |

- Every row rests on the Wikipedia article on the device.
  Blaze says "The Evercade runs emulators that have been licensed by Blaze or custom-built in some cases",
  and one Evercade title runs natively ("Evercade").
  The Evercade VS's processor is a Rockchip RK3328 in its own article
  and an unknown Cortex-A7 in "List of home video game consoles".
- The Atari VCS's storefront is set to close on 2027-02-01 ("Atari VCS (2021 console)").
- The Analogue Nt's article lists a Ricoh 2A03 and 2C02, the NES's own chips; if catalogued,
  it is an NES variant for `R1-15` (inference).
- The Dingoo's year of release is not in its article; 2009 is from memory.

### Announced and not sold

- The Intellivision Amico was set first for October 2020;
  its article now says the delays left "the console without a release date",
  that its maker said in November 2023 it lacked funds to produce units,
  and that Atari SA bought the Intellivision brand in May 2024 without the Amico ("Intellivision Amico").
- A PlayStation 6 has no article; "Ninth generation of video game consoles" says the memory shortage is expected to
  delay "the planned PlayStation 6".
- Microsoft's next Xbox, codename Project Helix,
  was announced in March 2026 and is described as re-evaluated for component prices
  ("Xbox", "Project Helix"; "Ninth generation of video game consoles").
- None of the three was on sale on 2026-11-20 (the articles above).

### Out of scope

- Standalone virtual-reality headsets
  (the Steam Frame, released 2026-09-18, and the Meta Quest line),
  cloud gaming services and their clients
  (Stadia, Luna, Xbox Cloud Gaming, OnLive),
  and phones are not consoles in the roadmap's sense (inference); the owner decides whether any belongs here.

### Boundary cases

| System | By survey | By date | Placed |
|---|---|---|---|
| Xbox 360 | `R1-23`, which depends on `R1-03` and `R1-04` | seventh generation | `R1-07` |
| Wii; Wii U; 3DS; Vita and PS TV | `R1-17`, `R1-13`, `R1-20` (on `R1-03`) | seventh and eighth | `R1-07` |
| Seventh-generation minor devices | none | 2005 to 2012 | here, overlapping `R1-07` |
| PlayStation Portal | `R1-21` names PS3, 4, 5 only | 2023 | here, in its family |

- The placements follow the roadmap's survey dependencies and the note's date rule (roadmap, "System family surveys").
  The previous catalogue's handheld share reaches 2012, so the Gizmondo, Game Wave, Beena, V.Flash, HyperScan, Zeebo,
  the GP2X line, and the Dingoo may be listed in both; which note keeps them is open (Open questions).

### Patterns across the catalogue

- The PlayStation and Nintendo families had system software releases in 2026: the PS3 (4.93, 2026-03-18), the PS4
  (14.02, 2026-11-04),
  the PS5 (update 14, 2026-09-16), and the Switch and Switch 2
  (23.5.0, 2026-11-10); the Xbox articles give current version numbers without dates (findings above).
  The PS3 was discontinued in Japan on 2017-05-29 and still receives updates ("PlayStation 3", infobox).
- Processor families: Cell in the PS3; AMD Jaguar in the PS4 and Xbox One families; AMD Zen 2 with RDNA 2 in the PS5,
  Xbox Series, Steam Deck, and ROG Xbox Ally; Arm cores with Nvidia graphics in the Switch, Switch 2, and Shield devices
  (rows above; the grouping is the note's).
- Region locks are nearly gone from the surveyed families: the PS3 has one region-locked game, the PS4, PS5, Xbox One,
  and Series are region-free, and the exceptions are the Switch's Tencent model and the Switch 2's Japan-only model
  ("Region lock"; findings above).
- Media is moving from discs to downloads: the PS5 Digital, PS5 Pro, Series S, and all-digital Series X have no drive;
  Switch 2 Game-Key Cards hold only a licence; and Sony has announced the end of physical game discs from 2028
  (findings above).
  For an emulator, a game that exists only as a download or a licence card is reached only through the user's own copy
  (inference; `R0-02` records the law).
- Fast storage with hardware decompression appears in the PS4 (zlib), PS5 (zlib and Kraken), and Xbox Series
  (zlib and BCPack) (findings above).
- Encryption and signed boot chains are described for every surveyed family at the level the sources give
  (findings above); `R0-02`, "Firmware, keys, and game copies", records what follows for keys.

### Coverage of sources

- psdevwiki gives model codes, boards, and process sizes for the PS3, PS4, and PS5,
  read through web archive captures because the live site served a challenge page
  (psdevwiki, "SKU Models", archived copies).
  SwitchBrew gives boards, chips, and system versions for the Switch and Switch 2.
- Sony's open-source pages list the Portal's system software releases (Sony, open-source software).
- No registered source beyond Wikipedia covers the Xbox One or Xbox Series,
  or any other row in this note. psdevwiki's pages on the PS4's security processor
  and hypervisor had no archive capture.
- Makers' product pages for the Steam Deck, Analogue's devices, Evercade, ModRetro,
  and Nvidia's Shield were read on their prose pages for evaluation and are not cited, because they are not registered;
  Analogue's site terms limit its content to "personal, non-commercial use" (research log).

## Options and trade-offs

### Catalogue every model, or one row per family

- **What:** keep a row for each revision, as here, or one row per family with revisions as notes.
- **Costs:** a row per revision repeats most columns; one per family hides that the PS5 Pro, the One X,
  and the Switch 2's Japan-only model are separate targets.
- **Gains:** per revision shows which models differ for software; per family keeps the table short.
- **Used by:** psdevwiki and SwitchBrew list every model and board.

### Where a device the rule does not name belongs

- **What:** class each flagged device as a dedicated console, an emulator host, or out of scope.
- **Costs:** a console reading adds emulation targets with Wikipedia as their only source;
  a host reading leaves closed platforms such as the Evercade without a study.
- **Gains:** a console reading keeps closed new-content platforms in view; a host reading keeps the research finite.
- **Used by:** the roadmap's rule names four kinds of host and none of the flagged kinds.

### A streaming client in the catalogue

- **What:** keep the PlayStation Portal as a family row, move it to the hosts, or leave it out.
- **Costs:** a row implies a target that runs no games; leaving it out drops a sold family member.
- **Gains:** a row records the family completely; leaving it out keeps the catalogue to systems that run games.
- **Used by:** this note keeps the row and flags it.

### Systems on sale

- **What:** catalogue systems on sale with a date and re-check them, or freeze the catalogue at one date.
- **Costs:** re-checking is recurring work; a frozen date goes stale within months.
- **Gains:** a dated catalogue says what was true when; re-checks keep the system scope proposal current.
- **Used by:** this note dates every statement about a system on sale.

## Implications for Rustalgia

- Every surveyed family is still sold or updated,
  so the legal exposure that `R0-02` records for systems on sale applies to all three surveys
  (`R1-14`, `R1-21`, `R1-23`); this feeds the system scope proposal (`R6-01`).
- Games for disc-less models, Game-Key Cards, and download-only consoles exist only
  as the user's own downloads (inference); this feeds `R2-11` on media and storage formats.
- Hardware decompression for zlib, Kraken, and BCPack is part of the PS4, PS5, and Series storage paths;
  whether the formats are documented is a question for `R1-04` and `R1-21`, and their licensing for `R0-03` (inference).
- The host list shows a few processor families covering many devices, which `R3-07`
  and `R3-12` can test by family (inference).
- The Xbox One and Series rest on Wikipedia alone; `R1-23` needs a registered source before relying on any figure.

## Open questions

- Which flagged devices are consoles, hosts, or out of scope?
  A decision for the owner.
- Does a streaming client, such as the PlayStation Portal, belong in the catalogue?
  A decision for the owner.
- Which catalogue keeps the seventh-generation minor devices that both this note and `R1-07` may list?
  A decision for the owner when both are open.
- What are the PS3's RSX clock, the Series S's GPU clock, and the Switch 2's memory bandwidth, from a primary source?
  `R1-04` and the surveys.
- What are the Xbox Series model numbers, and is there a registered source for the Xbox One and Series hardware?
  `R1-23`.
- What processor do the PlayStation Portal and the Evercade VS use?
  A source beyond Wikipedia, which disagrees with itself.
- Did the ModRetro M64 ship by 2026-11-20?
  A later check.
- Do the Retroid, AYN, Miyoo, and other Chinese handhelds, and the PC handhelds with no article, need rows?
  `R3-07` and `R3-12`, from makers' pages once registered.

## Sources

Every source below was read on 2026-11-20.
Wikipedia articles were read as raw wikitext from `https://en.wikipedia.org/w/index.php?title=<Article>&action=raw`;
each pin is the revision ID, or, where the API refused, the time the page was last modified (GMT).

Wikipedia, surveyed families (last modified, GMT):

- "PlayStation 3" 2026-11-17 22:26; "PlayStation 3 models" 2026-11-17 22:26;
  "PlayStation 3 system software" 2026-11-17 22:26; "RSX Reality Synthesizer" 2025-10-26 14:04;
  "Cell (processor)" 2026-11-17 02:25.
- "PlayStation 4" 2026-11-17 22:26; "PlayStation 4 system software" 2026-11-13 20:49; "PlayStation 5" 2026-11-13 18:11;
  "PlayStation Portal" 2026-10-27 05:12.
- "Xbox One" 2026-11-17 22:54; "Xbox Series X and Series S" 2026-11-19 10:14; "Xbox system software" 2026-11-17 22:54.
- "Nintendo Switch" 2026-11-09 02:30; "Nintendo Switch 2" 2026-11-17 21:58;
  "Nintendo Switch system software" 2026-10-25 13:38; "Nintendo Game Card" 2026-11-11 04:02; "Tegra" 2026-11-14 04:41;
  "Region lock" 2026-11-09 02:36.

Wikipedia, other devices (revision IDs):

- "List of home video game consoles" 1386685039; "List of handheld game consoles" 1384273411;
  "Ninth generation of video game consoles" 1384781485; "Xbox" 1386174526; "Intellivision Amico" 1384330319.
- "Game Wave Family Entertainment System" 1355021547; "Sega Pico" 1379636195; "V.Flash" 1386322900;
  "HyperScan" 1369672075; "Zeebo" 1384449469; "Gizmondo" 1386173978; "Xperia Play" 1385402596.
- "Playdate (console)" 1383318356; "Arduboy" 1379368117; "Thumby (console)" 1386650878; "Nex Playground" 1386780212.
- "GP2X" 1385314903; "GP2X Wiz" 1377361946; "Caanoo" 1354286783; "Pandora (computer)" 1382382856; "Dingoo" 1379337765;
  "GCW Zero" 1366037317.
- "Ouya" 1386318623; "GameStick" 1386313319; "Nexus Player" 1380498656; "Nvidia Shield TV" 1384340364;
  "Amazon Fire TV" 1385876881; "Apple TV (device)" 1386231890.
- "Nvidia Shield Portable" 1381277348; "Nvidia Shield Tablet" 1382229923; "Logitech G Cloud" 1370941045;
  "Razer Edge" 1366404016; "Anbernic" 1384269816.
- "GPD Win" 1382382620; "Ayaneo" 1373675588; "Ayaneo 2" 1335970637; "Steam Deck" 1385949939; "Asus ROG Ally" 1385002726;
  "Lenovo Legion Go" 1374923849; "MSI Claw A1M" 1383630618; "ROG Xbox Ally" 1386825038; "Steam Machine" 1386682817;
  "Atari VCS (2021 console)" 1386169078.
- "Analogue Nt" 1366437670; "Analogue Nt Mini" 1366437694; "Super Nt" 1380990970; "Mega Sg" 1371477202;
  "Analogue Pocket" 1384117105; "Analogue 3D" 1386298948; "MiSTer" 1364318909; "ModRetro" 1384719948;
  "ZX Spectrum Next" 1373891208.
- "NES Classic Edition" 1386306036; "Super NES Classic Edition" 1386310392; "PlayStation Classic" 1386316834;
  "Sega Genesis Mini" 1378865000; "TurboGrafx-16 Mini" 1360861077; "Neo Geo" 1384602234; "Neo Geo X" 1377484786;
  "Game Gear" 1377875769; "Game & Watch: Super Mario Bros."
  1371519076; "The Legend of Zelda LCD games" 1385489888.
- "Atari Flashback" 1386296269; "Atari 2600+" 1384597237; "RetroN" 1345465636; "Evercade" 1384324203;
  "Evercade VS" 1379582441; "Super Pocket" 1383355276; "Polymega" 1384342702.
- "Steam Frame" 1386446966; "Meta Quest" 1385938275; "Google Stadia" 1384327273; "Amazon Luna" 1383355935;
  "Xbox Cloud Gaming" 1384990660; "OnLive" 1386318547.

Hubs:

- psdevwiki, "SKU Models" for the PS3, PS4, and PS5, and PS5 "Hypervisor", read from existing archive captures:
  `https://web.archive.org/web/20261107043400/https://www.psdevwiki.com/ps3/SKU_Models`
  (PS3, last edited 2026-02-03),
  and the captures of 2026-07-10 (PS4, last edited 2025-09-22), 2026-03-12 (PS5, last edited 2026-02-22), and 2026-05-19
  (Hypervisor, last edited 2024-10-30).
- SwitchBrew, "Hardware" (revision 15339), "Switch 2: Hardware" (14956), "Switch 2: Tegra T239" (15493),
  "System Versions" (15460), "Switch 2: System Versions" (15457), "Gamecard" (12871), read as raw wikitext:
  `https://switchbrew.org/w/index.php?title=Hardware&action=raw` and sibling pages.
- Sony, open-source software pages for the PS3, PS5, and PlayStation Portal: `https://www.playstation.com/en-us/oss/`.

Licences:

- Panic, Playdate SDK License 1.0: `https://play.date/dev/sdk-license/`.

Project documents:

- The research roadmap, `docs/roadmap/research.md`; `R0-02`; `R0-05`; ADR 0001; the source register.
