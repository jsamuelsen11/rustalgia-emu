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

# Web sites: a walled site is closed to a writer and open to a reader.
check 2 writer "$(fetch https://tcrf.net/Help:Contents)"
check 0 reader "$(fetch https://tcrf.net/Help:Contents)"

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

# A host named in place of a path with "~", which a pattern cannot hold.
check 2 writer "$(fetch https://cgi.cse.unsw.edu.au/~cs3231/doc/R3000.pdf)"
check 2 writer "$(fetch https://www.slack.net/~ant/old/gb-tests/)"

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
check 2 writer "$(fetch https://github.com/LIJI32/SameSuite/tree/master/apu)"
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

# No restricted pattern holds "~" or "?": the guard's matching cannot take them, and "~" stops the guard.
special=$(grep -E '^(walled|closed|tainted) \| [^ |]*[~?]' "$register" || true)
if [ -n "$special" ]; then
  echo "FAIL: restricted patterns with characters the guard cannot match:"
  echo "$special"
  failed=1
fi

if [ "$failed" -eq 0 ]; then
  echo "source-guard: all cases pass"
fi
exit "$failed"
