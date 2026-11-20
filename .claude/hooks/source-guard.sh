#!/usr/bin/env sh
# Claude Code PreToolUse hook: refuse a tool call that would open a restricted source.
# It reads the call as JSON on standard input and exits 2, with the reason on standard error, to block it.
# The list is source-register.txt in this folder; entries in the open tier are ignored here.
# The rule is docs/adr/0001-restrict-reading-by-licence-tier.md.
set -eu

list="$(dirname "$0")/source-register.txt"
[ -f "$list" ] || exit 0

role=${RUSTALGIA_SOURCE_ROLE:-writer}
input=$(tr '[:upper:]' '[:lower:]')
mark='@@restricted@@'
prose='readme|license|licence|copying|contributing|code_of_conduct|ai-policy'
end="([\"' )?#\\\\]|\$)"

block() {
  echo "Blocked by .claude/hooks/source-guard.sh: '$2' is a $1 source." >&2
  echo "See docs/adr/0001-restrict-reading-by-licence-tier.md for what may be read." >&2
  exit 2
}

while IFS='|' read -r tier pattern _; do
  tier=${tier%% *}
  pattern=${pattern# }
  pattern=${pattern%% *}
  case "$tier" in
  closed | tainted) ;;
  walled) [ "$role" = reader ] && continue ;;
  *) continue ;;
  esac

  escaped=$(printf '%s' "$pattern" | sed 's/[.[\*^$]/\\&/g')
  case "$pattern" in
  */) escaped="${escaped}[a-z0-9._-]+" ;;
  esac

  # A call to a GitHub tool names the owner and the repository in separate fields.
  owner=${pattern%%/*}
  repo=${pattern#*/}
  if printf '%s' "$input" | grep -Eq "\"owner\"[[:space:]]*:[[:space:]]*\"$owner\""; then
    if [ -z "$repo" ] || printf '%s' "$input" | grep -Eq "\"repo\"[[:space:]]*:[[:space:]]*\"$repo\""; then
      block "$tier" "$pattern"
    fi
  fi

  marked=$(printf '%s' "$input" | sed -E "s~(^|[^a-z0-9_.-])${escaped}~\\1${mark}~g")
  case "$marked" in
  *"$mark"*) ;;
  *) continue ;;
  esac

  [ "$tier" = tainted ] && block "$tier" "$pattern"

  # Copying a whole repository, or searching inside it, is never a prose read.
  if printf '%s' "$marked" | grep -Eq 'clone|tarball|zipball|archive|codeload|search'; then
    block "$tier" "$pattern"
  fi

  # Remove what is allowed: prose files, the licence and README endpoints, and the bare repository page.
  rest=$(printf '%s' "$marked" | sed -E \
    -e "s~${mark}(/(blob|raw|contents)(/[^/\"' ]+)?|/[^/\"' ]+)?/(${prose})[a-z0-9._-]*${end}~\\5~g" \
    -e "s~${mark}/(license|readme)${end}~\\2~g" \
    -e "s~${mark}${end}~\\1~g")
  case "$rest" in
  *"$mark"*) block "$tier" "$pattern" ;;
  esac
done <<LIST
$(grep -Ev '^[[:space:]]*(#|$)' "$list")
LIST

exit 0
