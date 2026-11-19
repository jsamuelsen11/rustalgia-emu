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
check 0 writer "$(bash 'gh api repos/interpret/x/contents/src')"

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
check 0 writer "$(fetch https://problemkaputt.de/gbatek.htm)"

# Walled: closed to a writer, open to a reader.
check 2 writer "$(fetch https://github.com/flyinghead/flycast/blob/master/core/hw/sh4/sh4_core.h)"
check 0 writer "$(fetch https://github.com/flyinghead/flycast/blob/master/README.md)"
check 0 reader "$(fetch https://github.com/flyinghead/flycast/blob/master/core/hw/sh4/sh4_core.h)"
check 2 writer "$(github mamedev mame)"
check 0 reader "$(github mamedev mame)"

if [ "$failed" -eq 0 ]; then
  echo "source-guard: all cases pass"
fi
exit "$failed"
