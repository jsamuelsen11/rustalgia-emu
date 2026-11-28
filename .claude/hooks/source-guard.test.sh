#!/usr/bin/env sh
# Tests for source-guard.sh. Run it from anywhere; it exits 1 if any case fails.
set -eu

guard="$(dirname "$0")/source-guard.sh"
failed=0

# check <expected exit code> <role> <tool call as JSON>
check() {
  code=0
  printf '%s' "$3" | RUSTALGIA_SOURCE_ROLE="$2" "$guard" 2>/dev/null || code=$?
  if [ "$code" -ne "$1" ]; then
    echo "FAIL: expected $1, got $code, as $2: $3"
    failed=1
  fi
}

bash() { printf '{"tool_name":"Bash","tool_input":{"command":"%s"}}' "$1"; }
github() {
  printf '{"tool_name":"mcp__plugin_github_github__get_file_contents",'
  printf '"tool_input":{"owner":"%s","repo":"%s","path":"src"}}' "$1" "$2"
}
fetch() { printf '{"tool_name":"WebFetch","tool_input":{"url":"%s","prompt":"x"}}' "$1"; }

# Unrestricted sources pass.
check 0 writer "$(fetch https://github.com/mgba-emu/mgba/blob/master/src/gba/gba.c)"
check 0 writer "$(bash 'git status')"

# Closed: code is blocked, prose is allowed.
check 2 writer "$(fetch https://github.com/stenzek/duckstation/blob/master/src/core/cpu_core.cpp)"
check 2 writer "$(fetch https://github.com/Stenzek/DuckStation/tree/master/src)"
check 2 writer "$(bash 'git clone https://github.com/stenzek/duckstation')"
check 2 writer "$(bash 'gh api repos/stenzek/duckstation/contents/src')"
check 2 writer "$(bash 'gh search code foo --repo stenzek/duckstation')"
check 2 writer "$(fetch https://github.com/stenzek/duckstation/issues/1)"
check 0 writer "$(fetch https://github.com/stenzek/duckstation)"
check 0 writer "$(fetch https://github.com/stenzek/duckstation/blob/master/README.md)"
check 0 writer "$(fetch https://raw.githubusercontent.com/stenzek/duckstation/master/LICENSE)"
check 0 writer "$(bash 'gh api repos/stenzek/duckstation/license --jq .license.spdx_id')"
check 0 writer "$(bash 'gh api repos/stenzek/duckstation/contents/README.md')"
check 2 reader "$(fetch https://github.com/stenzek/duckstation/blob/master/src/core/cpu_core.cpp)"

# Closed by owner: every repository of a decompilation group.
check 2 writer "$(fetch https://github.com/pret/pokered/blob/master/main.asm)"
check 0 writer "$(fetch https://github.com/zeldaret/mm/blob/main/README.md)"
check 2 writer "$(github zeldaret oot)"

# Tainted: nothing is allowed, in any role.
check 2 writer "$(fetch https://psx-spx.consoledev.net/)"
check 2 reader "$(fetch https://psx-spx.consoledev.net/cpuspecifications/)"
check 2 writer "$(bash 'curl -sL https://problemkaputt.de/psx-spx.htm')"
check 2 writer "$(fetch https://psx-spx.github.io/)"
check 2 writer "$(fetch https://www.psx-spx.consoledev.net/)"
check 2 writer "$(fetch https://www.problemkaputt.de/psx-spx.htm)"
check 2 writer "$(fetch https://problemkaputt.de/psxspx-spu-overview.htm)"
check 2 reader "$(fetch https://www.problemkaputt.de/psxspx-spu-overview.htm)"
check 0 writer "$(fetch https://problemkaputt.de/gbatek.htm)"

# Tainted: the www prefix and the per-chapter pages need their own register lines, and have them.
check 2 writer "$(fetch https://www.problemkaputt.de/psx-spx.htm)"
check 2 writer "$(fetch https://www.psx-spx.consoledev.net/)"
check 2 writer "$(fetch https://problemkaputt.de/psxspx-spu-overview.htm)"
check 2 reader "$(fetch https://www.problemkaputt.de/psxspx-spu-overview.htm)"
check 2 writer "$(fetch https://web.archive.org/web/2024/https://problemkaputt.de/psx-spx.htm)"

# Web sites: a closed path beside open pages on the same host, and a closed host with and without www.
check 0 writer "$(fetch https://www.smspower.org/Development/Documents)"
check 2 writer "$(fetch https://www.smspower.org/Development/OfficialDocumentation)"
check 2 writer "$(fetch https://smspower.org/Development/OfficialDocumentation)"
check 0 writer "$(fetch https://problemkaputt.de/gbatek-gba-memory-map.htm)"
check 2 writer "$(fetch https://problemkaputt.de/gbatek-dsi-teak-misc.htm)"
check 2 writer "$(fetch https://ultra64.ca/resources/)"
check 2 writer "$(fetch https://www.ultra64.ca/resources/)"
check 2 writer "$(bash 'curl -sL https://archive.org/details/SNESDevManual/')"
check 2 writer "$(fetch https://archive.org/details/SNESDevManual)"
check 0 writer "$(fetch https://archive.org/details/some-other-item)"
check 0 writer "$(fetch https://segaretro.org/Sega_Mega_Drive)"
check 2 writer "$(fetch https://segaretro.org/images/a/a2/manual.pdf)"
check 0 writer "$(fetch https://segaretro.org/Images_of_the_Mega_Drive)"
check 2 writer "$(fetch https://problemkaputt.de/gbatek-dsi-i2c-device-4ah-bptwl-chip.htm)"
check 2 reader "$(fetch https://www.problemkaputt.de/gbatek-dsi-i2c-device-4ah-bptwl-chip.htm)"

# Repositories this change moved between tiers.
check 2 reader "$(fetch https://github.com/gbadev-org/tonc/blob/master/code/basic/hello/hello.c)"
check 0 writer "$(fetch https://github.com/gbadev-org/tonc/blob/master/README.md)"
check 2 writer "$(fetch https://github.com/c-sp/game-boy-test-roms/tree/master/src)"
check 0 reader "$(fetch https://github.com/c-sp/game-boy-test-roms/tree/master/src)"

# Web sites: a walled site's prose is open to a writer and a reader; its downloads are not open to a writer.
check 0 writer "$(fetch https://tcrf.net/Help:Contents)"
check 0 reader "$(fetch https://tcrf.net/Help:Contents)"
check 2 writer "$(fetch https://tcrf.net/images/files/example.zip)"
check 0 reader "$(fetch https://tcrf.net/images/files/example.zip)"

# Web sites, from the verification pass: www forms, download paths, and file pages of closed items.
check 2 writer "$(fetch https://www.segaretro.org/images/a/a2/manual.pdf)"
check 2 writer "$(fetch https://www.archive.org/details/SNESDevManual/)"
check 2 writer "$(bash 'curl -sL https://archive.org/download/SNESDevManual/manual.pdf -o m.pdf')"
check 2 writer "$(fetch https://segaretro.org/File:Genesis_Software_Manual.pdf)"
check 2 writer "$(bash 'curl -sL https://segaretro.org/Special:Redirect/file/Genesis_Software_Manual.pdf')"
check 2 writer "$(fetch https://www.psx.arthus.net/sdk/)"
check 2 writer "$(fetch https://psx-spx.github.io/)"

# A closed file inside an open path, and a cut-short pattern before a query string.
check 2 writer "$(fetch https://hitmen.c02.at/files/docs/psx/3467.pdf)"
check 0 writer "$(fetch https://hitmen.c02.at/files/docs/psx/psx.pdf)"
check 2 writer "$(fetch http://www.6502.org/documents/datasheets/mos/)"
check 0 writer "$(fetch http://www.6502.org/documents/)"
check 2 writer "$(fetch 'https://psx.amidog.se/lib/exe/fetch.php?media=psx:download:cpu.zip')"
check 0 writer "$(fetch 'https://psx.amidog.se/doku.php?id=psx:download')"
check 2 writer "$(fetch https://www.mamedev.org/roms/)"
check 0 writer "$(fetch https://www.mamedev.org/legal.html)"

# Patterns that hold "~" match their own addresses, and the rest of each host stays open.
check 2 writer "$(fetch https://cgi.cse.unsw.edu.au/~cs3231/doc/R3000.pdf)"
check 2 writer "$(fetch https://www.slack.net/~ant/old/gb-tests/)"
check 0 writer "$(fetch https://cgi.cse.unsw.edu.au/~cs3231/)"
check 0 writer "$(fetch https://www.slack.net/~someone-else/)"

# Closed or walled folders inside open repositories, in page and raw form.
check 2 writer "$(fetch https://github.com/wheremyfoodat/Panda3DS/blob/master/third_party/duckstation/window_info.cpp)"
check 0 writer "$(fetch https://github.com/wheremyfoodat/Panda3DS/tree/master/third_party/teakra)"
check 2 reader "$(fetch https://github.com/dolphin-emu/dolphin/blob/master/docs/DSP/free_dsp_rom/dsp_rom.ds)"
check 2 writer "$(fetch https://raw.githubusercontent.com/dolphin-emu/dolphin/master/Data/Sys/GC/dsp_rom.bin)"
check 0 writer "$(fetch https://github.com/dolphin-emu/dolphin/blob/master/Source/Core/Core/HW/DSP.cpp)"
check 2 writer "$(fetch https://github.com/KallistiOS/KallistiOS/tree/master/utils/dc-chain)"
check 0 writer "$(fetch https://github.com/KallistiOS/KallistiOS/tree/master/kernel)"

# A walled emulator's web site: its prose is open, its source archives are not.
check 0 writer "$(fetch https://mednafen.github.io/documentation/)"
check 2 writer "$(fetch https://mednafen.github.io/releases/files/mednafen-1.32.1.tar.xz)"

# Tiers this verification moved.
check 0 writer "$(fetch https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/master/README.md)"
check 0 writer "$(fetch https://github.com/LIJI32/SameSuite/tree/master/apu)" # open under ADR 0006 (X11)
check 0 writer "$(fetch https://github.com/mgba-emu/gbatek/blob/master/gbatek.htm)"
check 2 writer "$(fetch https://github.com/skyline-emu/skyline/tree/master/app)"

# Walled: closed to a writer, open to a reader.
check 2 writer "$(fetch https://github.com/flyinghead/flycast/blob/master/core/hw/sh4/sh4_core.h)"
check 0 writer "$(fetch https://github.com/flyinghead/flycast/blob/master/README.md)"
check 0 reader "$(fetch https://github.com/flyinghead/flycast/blob/master/core/hw/sh4/sh4_core.h)"
check 2 writer "$(github mamedev mame)"
check 0 reader "$(github mamedev mame)"

# A walled folder inside an open-tier emulator.
check 2 writer "$(fetch https://github.com/LIJI32/SameBoy/blob/master/iOS/GBViewController.m)"
check 0 writer "$(fetch https://github.com/LIJI32/SameBoy/blob/master/Core/gb.c)"
check 0 reader "$(fetch https://github.com/LIJI32/SameBoy/blob/master/iOS/GBViewController.m)"

# Fallback: a repository that is not in the register is walled until it is evaluated.
check 2 writer "$(fetch https://github.com/example-org/new-emulator/blob/main/src/cpu.rs)"
check 2 reader "$(fetch https://github.com/example-org/new-emulator/blob/main/src/cpu.rs)"
check 2 writer "$(bash 'git clone https://github.com/example-org/new-emulator.git')"
check 2 writer "$(bash 'gh api repos/example-org/new-emulator/contents/src')"
check 2 writer "$(github example-org new-emulator)"
check 0 writer "$(fetch https://github.com/example-org/new-emulator)"
check 0 writer "$(fetch https://github.com/example-org/new-emulator/blob/main/README.md)"
check 0 writer "$(bash 'gh api repos/example-org/new-emulator/license')"
check 0 writer "$(bash 'gh api repos/jsamuelsen11/rustalgia-emu/pulls/9/comments')"
check 0 writer "$(fetch https://github.com/crate-ci/typos/blob/master/docs/reference.md)"
check 0 writer "$(fetch https://docs.github.com/en/copilot/concepts/completions/code-referencing)"
check 0 writer "$(fetch https://github.com/search?q=emulator)"
check 0 writer "$(fetch https://gbdev.io/pandocs/Rendering.html)"

# Disputed libraries are closed, and an open-tier entry in the register blocks nothing.
check 2 writer "$(fetch https://github.com/devkitPro/libogc/blob/master/libogc/lwp_threads.c)"
check 0 writer "$(fetch https://github.com/devkitPro/libogc/blob/master/LICENSE)"
check 0 writer "$(fetch https://gbdev.io/pandocs/Rendering.html)"

# Free60's fuse page, closed as key material, at every address it was reached by; the rest of the wiki stays open.
check 2 writer "$(fetch https://free60.org/Hardware/Fusesets/)"
check 2 writer "$(fetch https://free60.org/Hardware/Fusesets)"
check 2 writer "$(fetch https://www.free60.org/Hardware/Fusesets/)"
check 2 reader "$(fetch https://github.com/free60project/wiki/blob/master/docs/Hardware/Fusesets.md)"

# SMS Power: the attachment folder of the Development pages is closed; the pages themselves stay open.
check 2 writer "$(fetch https://www.smspower.org/uploads/Development/bios.zip)"
check 2 writer "$(bash 'curl -sLO https://smspower.org/uploads/Development/bios.zip')"
check 0 writer "$(fetch https://www.smspower.org/Development/SN76489)"
check 0 writer "$(fetch https://www.smspower.org/uploads/Site/logo.png)"
check 2 writer "$(fetch https://raw.githubusercontent.com/free60project/wiki/master/docs/Hardware/Fusesets.md)"
check 2 writer "$(bash 'curl -sL raw.githubusercontent.com/free60project/wiki/master/docs/Hardware/Fusesets.md')"
check 0 writer "$(fetch https://free60.org/Hypervisor/)"

# psdevwiki's PS4 wrapper and libraries pages, closed, at the address forms tested here; other pages stay open.
check 2 writer "$(fetch https://www.psdevwiki.com/ps4/SELF_File_Format)"
check 2 writer "$(fetch https://psdevwiki.com/ps4/SELF_File_Format)"
check 2 writer "$(fetch https://web.archive.org/web/20260220000705id_/https://www.psdevwiki.com/ps4/SELF_File_Format)"
check 2 reader "$(fetch https://www.psdevwiki.com/ps4/Libraries)"
check 2 writer "$(bash 'curl -sL https://web.archive.org/web/2026/https://www.psdevwiki.com/ps4/Libraries')"
check 0 writer "$(fetch https://web.archive.org/web/20260216085041id_/https://www.psdevwiki.com/ps4/Syscalls)"

# Microsoft's directory of GDK topics under a non-disclosure agreement is closed; the public pages stay open.
check 2 writer "$(fetch https://docs.xbox.com/nda/nda-overview.md)"
check 2 writer "$(fetch https://docs.xbox.com/nda/nda-topic-directory.md)"
check 2 writer "$(fetch https://devdocs.xbox.com/nda/nda-overview)"
check 2 writer "$(fetch https://learn.microsoft.com/gaming/gdk/docs/features/graphics/xbtc)"
check 0 writer "$(fetch https://learn.microsoft.com/en-us/previous-versions/windows/uwp/xbox-apps)"
check 0 writer "$(fetch https://docs.xbox.com/home/glossary.md)"
check 0 writer "$(fetch https://raw.githubusercontent.com/free60project/wiki/master/docs/Hypervisor.md)"

# The EFF's 2007 posts on a published disc key are closed; the rest of the site stays open.
check 2 writer "$(fetch https://www.eff.org/deeplinks/2007/05/legal-primer)"
check 2 writer "$(fetch https://eff.org/deeplinks/2007/05/legal-primer)"
check 0 writer "$(fetch https://www.eff.org/files/geohotz-finaljudgmentpi.pdf)"
# ReactOS code is closed, by Wine's account of how it was made; its README stays readable.
check 2 writer "$(fetch https://github.com/reactos/reactos/blob/master/ntoskrnl/ke/bug.c)"
check 2 reader "$(fetch https://raw.githubusercontent.com/reactos/reactos/master/ntoskrnl/ke/bug.c)"
check 2 writer "$(bash 'git clone https://github.com/reactos/reactos')"
check 0 writer "$(fetch https://github.com/reactos/reactos/blob/master/README.md)"
# Wine's wiki is open, at its old address and on GitLab.
# An archive capture of an unrestricted page passes.
check 0 writer "$(fetch https://wiki.winehq.org/Clean_Room_Guidelines)"
check 0 writer "$(fetch https://gitlab.winehq.org/wine/wine/-/wikis/Clean-Room-Guidelines)"
check 0 writer "$(fetch https://web.archive.org/web/20260522220716/https://www.dni.gov/files/documents/ICD/ICD-203.pdf)"
# Kit pages on open wikis, closed by name; the wikis' other pages stay open (R0-05, 2026-11-20).
check 2 writer "$(fetch https://www.psdevwiki.com/ps3/SCEI_PS3_SDK)"
check 2 writer "$(fetch https://psdevwiki.com/ps4/SCEI_PS4_SDK)"
check 2 reader "$(fetch https://www.psdevwiki.com/ps4/SCEI_PS4_SDK)"
check 2 writer "$(fetch https://web.archive.org/web/2026/https://www.psdevwiki.com/ps3/SCEI_PS3_SDK)"
check 0 writer "$(fetch https://www.psdevwiki.com/ps3/Main_Page)"
check 2 writer "$(fetch https://www.psdevwiki.com/ps4/PSM_SDK)"
check 2 reader "$(fetch https://psdevwiki.com/ps4/PSM_SDK)"
check 2 writer "$(fetch https://xboxdevwiki.net/Microsoft_XDK)"
check 2 reader "$(fetch https://www.xboxdevwiki.net/Microsoft_XDK)"
check 0 writer "$(fetch https://xboxdevwiki.net/OpenXDK)"
check 2 writer "$(fetch https://developer.nvidia.com/embedded/downloads)"
check 0 reader "$(fetch https://developer.nvidia.com/embedded/downloads)"
# Pages closed by R1-02: an N64 boot ROM listing, CIC key and seed material, 3DO internal material; others stay open.
check 2 writer "$(fetch https://n64brew.dev/wiki/Initial_Program_Load)"
check 2 writer "$(fetch https://n64brew.dev/wiki/CIC-NUS)"
check 2 writer "$(fetch https://n64brew.dev/wiki/PIF-NUS)"
check 0 writer "$(fetch https://n64brew.dev/wiki/Joybus_Protocol)"
check 2 writer "$(fetch https://ext.3dodev.com/)"
check 2 writer "$(fetch https://3dodev.com/documentation/hardware/opera/memory_configurations)"
check 0 writer "$(fetch https://3dodev.com/documentation/hardware/opera/madam/matrix_engine)"
check 2 writer "$(fetch https://github.com/rasky/n64_pi_dma_test/blob/master/main.c)"
check 2 writer "$(fetch https://github.com/libretro/beetle-psx-libretro/blob/master/libretro.cpp)"
# Pages beside key and boot material on open wikis, closed by R1-03; the cited pages beside them stay open.
check 2 writer "$(fetch https://wiiubrew.org/wiki/Cafe_OS/Kernel)"
check 2 writer "$(fetch https://www.wiiubrew.org/wiki/Cafe_OS/Kernel)"
check 0 writer "$(fetch https://wiiubrew.org/wiki/Cafe_OS)"
check 0 writer "$(fetch https://wiiubrew.org/wiki/Boot_process)"
check 2 writer "$(fetch https://wiibrew.org/wiki/Signing_bug)"
check 2 writer "$(fetch https://www.wiibrew.org/wiki/Signing_bug)"
check 2 writer "$(fetch https://wiibrew.org/wiki/Wii_disc)"
check 2 reader "$(fetch https://www.wiibrew.org/wiki/Wii_disc)"
check 0 writer "$(fetch https://wiibrew.org/wiki/Boot0)"
check 0 writer "$(fetch https://wiibrew.org/wiki/Wiimote)"
check 2 writer "$(fetch https://3dbrew.org/wiki/Bootloader)"
check 2 writer "$(fetch https://www.3dbrew.org/wiki/Bootloader)"
check 0 writer "$(fetch https://www.3dbrew.org/wiki/FIRM)"
check 2 writer "$(fetch https://xboxdevwiki.net/Boot_Process)"
check 2 writer "$(fetch https://www.xboxdevwiki.net/Boot_Process)"
check 2 writer "$(fetch https://xboxdevwiki.net/MCPX_ROM)"
check 2 writer "$(fetch https://www.xboxdevwiki.net/MCPX_ROM)"
check 2 writer "$(fetch https://xboxdevwiki.net/Xbox_Game_Disc)"
check 2 writer "$(fetch https://www.xboxdevwiki.net/Xbox_Game_Disc)"
check 0 writer "$(fetch https://xboxdevwiki.net/Kernel)"
check 0 writer "$(fetch https://xboxdevwiki.net/Xbox_Input_Devices)"
# R1-05's protective lines: a ROM site, SMS Power's attachments, and a collector's folder of maker manuals.
check 2 writer "$(fetch https://retrostic.com/)"
check 2 writer "$(fetch https://www.retrostic.com/roms/sega-game-gear)"
check 2 writer "$(fetch https://www.smspower.org/uploads/Development/bios13.zip)"
check 2 reader "$(fetch https://smspower.org/uploads/Development/bios13.asm)"
check 0 writer "$(fetch https://www.smspower.org/Development/ClockRate)"
check 2 writer "$(fetch https://www.handheldmuseum.com/Manuals/Entex-SAG.pdf)"
check 2 writer "$(bash 'curl -sL https://handheldmuseum.com/Manuals/Entex-SAG.pdf')"
check 0 writer "$(fetch https://www.handheldmuseum.com/Entex/SAG.htm)"
check 2 writer "$(fetch https://www.ballyalley.com/rom_images/rom_images.html)"
check 2 writer "$(fetch https://channelf.se/veswiki/index.php?title=Main_Page)"
check 0 writer "$(fetch https://commons.wikimedia.org/wiki/File:BBC-bridge-companion-pcb.jpg)"
# 3DO Development Repo: key, maker-document, and source paths are closed; the index pages R1-06 cites stay open.
check 2 writer "$(fetch https://3dodev.com/documentation/encryption/keys)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/documentation/encryption/opera)"
check 2 writer "$(fetch https://3dodev.com/_media/documentation/encryption/keys.zip)"
check 0 writer "$(fetch https://3dodev.com/documentation/encryption)"
check 0 writer "$(fetch https://3dodev.com/_export/raw/documentation/encryption)"
check 2 writer "$(fetch https://3dodev.com/documentation/development/opera/hardware)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/documentation/development_documents)"
check 2 writer "$(fetch https://3dodev.com/_media/documentation/sdks/docs.zip)"
check 2 writer "$(fetch https://ext.3dodev.com/3do/docs/index.html)"
check 2 writer "$(fetch https://3dodev.com/_media/software/operating_systems/portfolio.zip)"
check 0 writer "$(fetch https://3dodev.com/_export/raw/software/operating_systems)"
check 2 writer "$(fetch https://3dodev.com/documentation/hardware/opera/memory_configurations)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/documentation/hardware/opera/memory_configurations)"
check 0 writer "$(fetch https://3dodev.com/_export/raw/documentation/hardware)"
check 0 writer "$(fetch https://3dodev.com/_export/raw/documentation/patents)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/software/original_source_code)"
check 2 writer "$(fetch https://3dodev.com/_media/software/original_source_code/opera.zip)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/software/rom/opera)"
check 2 writer "$(fetch https://3dodev.com/_media/software/rom/image.zip)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/software/sdk/opera)"
check 2 writer "$(fetch https://3dodev.com/_media/software/sdk/kit.zip)"
check 2 writer "$(fetch https://3dodev.com/documentation:encryption:opera:encryption_keys)"
check 2 writer "$(fetch https://3dodev.com/_export/raw/documentation:development_documents)"
check 2 writer "$(fetch https://3dodev.com/documentation:development:opera)"
check 0 writer "$(fetch https://3dodev.com/documentation:patents)"
check 2 writer "$(fetch https://github.com/trapexit/3do-docs/tree/master/docs)"
check 2 writer "$(github trapexit 3do-docs)"
check 0 writer "$(fetch https://github.com/trapexit/3do-docs/blob/master/README.md)"

# N64brew's PIF and CIC pages print key or seed material; the pages R1-06 cites stay open.
check 2 writer "$(fetch https://n64brew.dev/wiki/PIF-NUS)"
check 2 writer "$(fetch https://n64brew.dev/wiki/PIF-NUS?action=raw)"
check 2 reader "$(fetch https://n64brew.dev/wiki/CIC-NUS)"
check 0 writer "$(fetch https://n64brew.dev/wiki/VR4300?action=raw)"
check 0 writer "$(fetch https://n64brew.dev/wiki/64DD)"
# R1-07's protective lines: a Vita card page and a 3DS memory-layout page, at every form the guard can match;
# the rest of each wiki stays open. NuanceResurrection is closed: its code is blocked, its README is not.
check 2 writer "$(fetch https://wiki.henkaku.xyz/vita/Game_Card)"
check 2 writer "$(fetch https://web.archive.org/web/20261022161817/https://wiki.henkaku.xyz/vita/Game_Card)"
check 0 writer "$(fetch https://wiki.henkaku.xyz/vita/Security)"
check 2 writer "$(fetch https://www.3dbrew.org/wiki/Memory_layout)"
check 2 reader "$(fetch https://3dbrew.org/wiki/Memory_layout)"
check 2 writer "$(fetch https://web.archive.org/web/20251227195852/https://www.3dbrew.org/wiki/Memory_layout)"
check 0 writer "$(fetch https://www.3dbrew.org/wiki/Hardware)"
check 2 writer "$(fetch https://github.com/andkrau/NuanceResurrection/blob/master/NuanceMain.cpp)"
check 0 writer "$(fetch https://raw.githubusercontent.com/andkrau/NuanceResurrection/master/README.md)"
check 0 writer "$(fetch http://web.archive.org/web/20111016181020/http://www.nintendo.com/3ds/hardware/specs)"

# A closed page is blocked at its full address. The guard lets an address equal to a pattern through,
# so each page pattern is cut short; these cases catch a pattern that names its page in full.
check 2 writer "$(fetch https://problemkaputt.de/psx.htm)"
check 2 writer "$(fetch https://www.psdevwiki.com/ps3/PS2_Emulation)"
check 2 writer "$(fetch https://pcsx2.net/docs/setup/gather)"
check 2 writer "$(fetch https://emulation.gametechwiki.com/index.php/Nintendo_DS_emulators)"
check 2 writer "$(fetch 'https://emulation.gametechwiki.com/index.php?title=Nintendo_DS_emulators')"
check 2 writer "$(fetch 'https://playstationdev.wiki/pspdevwiki/index.php?title=Keys')"
check 0 writer "$(fetch https://emulation.gametechwiki.com/index.php/GBA_Tests)"
check 0 writer "$(fetch https://pcsx2.net/docs/setup/bios/)"

# The guard fails closed: empty or malformed input blocks.
check 2 writer ''
check 2 writer '   '
check 2 writer 'not json'
check 2 writer '{"tool_input":{"command":"git status"}}'
check 2 writer '['
check 0 writer "$(bash 'git status')"

# The guard fails closed: a missing register blocks every call, with a message that says so.
copy=$(mktemp -d)
cp "$guard" "$copy/source-guard.sh"
code=0
message=$(printf '%s' "$(bash 'git status')" | sh "$copy/source-guard.sh" 2>&1) || code=$?
if [ "$code" -ne 2 ] || ! printf '%s' "$message" | grep -q 'register is missing'; then
  echo "FAIL: a missing register gave exit $code: $message"
  failed=1
fi
rm -rf "$copy"

# The project settings make a crash or a timeout block, and keep user settings from switching hooks off.
settings="$(dirname "$0")/../settings.json"
for key in '"onFailure": "block"' '"timeout": [0-9]' '"disableAllHooks": false'; do
  if ! grep -Eq "$key" "$settings"; then
    echo "FAIL: .claude/settings.json lacks $key"
    failed=1
  fi
done

# Every register line has a known tier, six fields, and a date.
register="$(dirname "$0")/source-register.txt"
fields='[^| ]+ \| [^|]+ \| [^|]+ \| [0-9]{4}-[0-9]{2}-[0-9]{2} \| [^|]+'
bad=$(grep -Ev '^[[:space:]]*(#|$)' "$register" |
  grep -Ev "^(open|walled|closed|tainted|other) \\| ${fields}\$" || true)
if [ -n "$bad" ]; then
  echo "FAIL: malformed register lines:"
  echo "$bad"
  failed=1
fi

# Issue #32: what the register means, and only that.
# A pattern holding "?" matches its address; so does a page's "index.php?title=" form of a path pattern.
check 2 writer "$(fetch 'https://emulation.gametechwiki.com/index.php?title=Nintendo_DS_emulators&action=raw')"
check 2 writer "$(fetch 'https://playstationdev.wiki/pspdevwiki/index.php?title=Keys')"
check 0 writer "$(fetch 'https://playstationdev.wiki/pspdevwiki/index.php?title=Main_Page')"
check 2 writer "$(fetch 'https://n64brew.dev/index.php?title=PIF-NUS')"
check 2 writer "$(fetch 'https://en.wikipedia.org/w/index.php?title=Xbox_system_software')"
check 0 writer "$(fetch 'https://en.wikipedia.org/w/index.php?title=Xbox_360')"
# A repository pattern matches only at a name boundary, not inside a longer repository name.
check 2 writer "$(fetch https://github.com/OpenEmu/OpenEmu/blob/master/Source/x.m)"
check 0 writer "$(fetch https://github.com/simias/rustation-libretro/blob/master/README.md)"
check 2 writer "$(bash 'git clone https://github.com/stenzek/duckstation.git')"
# The longest line decides: an open line carves a repository out of a walled owner, and a closed folder inside an open
# repository is blocked through a GitHub tool's separate path field too.
check 0 writer "$(fetch https://github.com/MiSTer-devel/Arcade-Cave_MiSTer/blob/master/rtl/cave.vhd)"
check 2 writer "$(fetch https://github.com/MiSTer-devel/Arcade-Galaga_MiSTer/blob/master/rtl/galaga.vhd)"
path_call() {
  printf '{"tool_name":"mcp__plugin_github_github__get_file_contents",'
  printf '"tool_input":{"owner":"%s","repo":"%s","path":"%s"}}' "$1" "$2" "$3"
}
check 2 writer "$(path_call dolphin-emu dolphin docs/DSP/free_dsp_rom/dsp_rom.ds)"
check 0 writer "$(path_call dolphin-emu dolphin Source/Core/Core/HW/DSP.cpp)"
check 0 writer "$(path_call stenzek duckstation README.md)"
check 2 writer "$(path_call stenzek duckstation src/core/cpu_core.cpp)"
# A quoted "gh api" call and an organisation-wide code search reach the unregistered-repository fallback.
check 2 writer "$(bash 'gh api \"repos/example-org/new-emulator/contents/src\"')"
check 0 writer "$(bash 'gh api \"repos/example-org/new-emulator/license\"')"
check 2 writer "$(bash 'gh search code cpu --owner example-org')"
check 2 writer "$(bash 'gh search code cpu --owner pret')"
# GitHub pages that are not repositories are not treated as unregistered repositories.
check 0 writer "$(fetch https://github.com/customer-terms/github-copilot-product-specific-terms)"
check 0 writer "$(fetch https://github.com/site-policy/github-terms/blob/main/github-terms-of-service.md)"
# A command that only names an address, without fetching it, passes; fetching it is still checked.
check 0 writer "$(bash 'printf %s github.com/stenzek/duckstation/blob/master/src/core/cpu_core.cpp > notes.txt')"
check 0 writer "$(bash 'gh issue create --title x --body \"see github.com/stenzek/duckstation/tree/master/src\"')"
check 0 writer "$(bash 'grep -rn problemkaputt.de/psx-spx docs')"
check 0 writer "$(bash 'printf %s {} | sh .claude/hooks/source-guard.sh # tcrf.net/x.zip')"
check 2 writer "$(bash 'curl -sL https://github.com/stenzek/duckstation/blob/master/src/core/cpu_core.cpp')"
check 2 writer "$(bash 'python3 -c \"import urllib\" https://psx-spx.consoledev.net/')"
issue_call='{"tool_name":"mcp__plugin_github_github__issue_write","tool_input":{"body":"psx-spx.consoledev.net"}}'
check 0 writer "$issue_call"
# The words "archive", "search", and "research" do not block by themselves; clones and archive downloads still do.
check 0 writer "$(fetch https://github.com/geotale/gc-like-research/blob/main/README.md)"
check 0 writer "$(fetch https://web.archive.org/web/2024/https://www.mamedev.org/legal.html)"
check 0 writer "$(bash 'curl -sL https://api.github.com/search/repositories?q=emulator')"
check 2 writer "$(fetch https://github.com/stenzek/duckstation/archive/refs/heads/master.zip)"
check 2 writer "$(fetch https://codeload.github.com/stenzek/duckstation/zip/refs/heads/master)"
# A walled web site's code files are not open to a writer, though its pages are.
check 2 writer "$(fetch https://visual6502.org/JSSim/expertWires.js)"
check 0 writer "$(fetch https://visual6502.org/JSSim/)"
# A closed web address is blocked at its exact address and its home page; a trailing "/" leaves its index open.
check 2 writer "$(fetch https://pcsx2.net/docs/setup/gather)"
check 2 writer "$(fetch https://kawaks.org)"
check 0 writer "$(fetch https://3dodev.com/documentation/encryption)"
check 2 writer "$(fetch https://3dodev.com/documentation/encryption/keys)"

# Issue #83: a line for a path inside a repository closes it in every address form and on every ref.
raw=https://raw.githubusercontent.com
check 2 writer "$(fetch https://github.com/LIJI32/SameBoy/blob/ea667ad79aa28409f034b1fd6da7304e1844750d/BootROMs/x.asm)"
check 2 writer "$(fetch https://github.com/LIJI32/SameBoy/tree/v1.0.2/BootROMs)"
check 2 writer "$(fetch https://github.com/LIJI32/SameBoy/blame/master/BootROMs/dmg_boot.asm)"
check 2 writer "$(fetch https://github.com/LIJI32/SameBoy/raw/master/BootROMs/dmg_boot.asm)"
check 2 writer "$(fetch https://github.com/LIJI32/SameBoy/raw/refs/heads/master/BootROMs/dmg_boot.asm)"
check 2 writer "$(fetch $raw/LIJI32/SameBoy/refs/heads/master/BootROMs/dmg_boot.asm)"
check 2 writer "$(fetch $raw/LIJI32/SameBoy/refs/tags/v1.0.2/BootROMs/dmg_boot.asm)"
check 2 writer "$(bash 'gh api repos/LIJI32/SameBoy/contents/BootROMs/dmg_boot.asm')"
check 2 writer "$(bash 'curl -s https://api.github.com/repos/LIJI32/SameBoy/contents/BootROMs')"
check 2 writer "$(bash 'gh api repos/mgba-emu/mgba/contents/src/gba/bios.c?ref=0.10.5')"
check 2 writer "$(fetch https://github.com/wheremyfoodat/Panda3DS/blob/b18e658/third_party/duckstation/gl/context.cpp)"
check 0 writer "$(fetch https://github.com/LIJI32/SameBoy/blob/ea667ad79aa28409f034b1fd6da7304e1844750d/Core/gb.c)"
check 0 writer "$(fetch $raw/LIJI32/SameBoy/refs/heads/master/Core/gb.c)"
check 0 writer "$(bash 'gh api repos/mgba-emu/mgba/contents/src/gba/gba.c')"
# A restricted repository's prose stays open in those forms, and its code stays blocked.
check 0 writer "$(fetch $raw/stenzek/duckstation/refs/heads/master/README.md)"
check 0 writer "$(fetch https://github.com/stenzek/duckstation/blob/0123abc/LICENSE)"
check 2 writer "$(fetch https://github.com/stenzek/duckstation/blob/0123abc/src/core/cpu_core.cpp)"
check 2 writer "$(fetch $raw/stenzek/duckstation/refs/heads/master/src/core/cpu_core.cpp)"

# Issue #95: release notes and metadata of a walled or closed repository are prose; code, diffs, and downloads are not.
check 0 writer "$(fetch https://github.com/TASEmulators/desmume/blob/master/desmume/ChangeLog)"
check 0 writer "$(fetch $raw/TASEmulators/desmume/master/CHANGELOG.md)"
check 0 writer "$(fetch $raw/pokemon-speedrunning/gambatte-core/master/NEWS)"
check 0 writer "$(bash 'gh api repos/TASEmulators/desmume/contents/RELEASE-NOTES.txt')"
check 0 writer "$(fetch https://github.com/TASEmulators/desmume/releases)"
check 0 writer "$(fetch https://github.com/TASEmulators/desmume/releases/tag/release_0_9_13)"
check 0 writer "$(fetch https://github.com/stenzek/duckstation/releases/latest)"
check 0 writer "$(bash 'gh api repos/TASEmulators/desmume/releases?per_page=5')"
check 0 writer "$(bash 'gh api repos/TASEmulators/desmume/commits?per_page=1')"
check 0 writer "$(bash 'gh api repos/TASEmulators/desmume/branches/master')"
check 0 writer "$(bash 'gh api repos/TASEmulators/desmume/tags')"
check 0 writer "$(fetch https://github.com/TASEmulators/desmume/commits/master)"
check 2 writer "$(bash 'gh api repos/TASEmulators/desmume/commits/master')"
check 2 writer "$(fetch https://github.com/TASEmulators/desmume/commit/b549f71b83287f265b6d74b9e77ef5d98a617190)"
check 2 writer "$(fetch https://github.com/TASEmulators/desmume/releases/download/release_0_9_13/desmume.zip)"
check 2 writer "$(bash 'gh release download release_0_9_13 --repo TASEmulators/desmume')"
check 2 writer "$(bash 'gh api repos/TASEmulators/desmume/releases/assets/1234')"
check 2 writer "$(fetch $raw/TASEmulators/desmume/master/desmume/src/history.cpp)"
check 2 writer "$(fetch $raw/TASEmulators/desmume/master/desmume/src/changes.h)"
check 2 writer "$(bash 'gh api repos/TASEmulators/desmume/git/trees/master?recursive=1')"
check 2 writer "$(fetch https://github.com/TASEmulators/desmume/compare/a...b)"
check 2 writer "$(fetch https://github.com/stenzek/duckstation/issues/1)"

# No pattern holds a space or a "|", which would split its register line.
special=$(grep -Ev '^[[:space:]]*(#|$)' "$register" | awk -F' [|] ' '$2 ~ /[ |]/' || true)
if [ -n "$special" ]; then
  echo "FAIL: register patterns with a space or a bar:"
  echo "$special"
  failed=1
fi

if [ "$failed" -eq 0 ]; then
  echo "source-guard: all cases pass"
fi
exit "$failed"
