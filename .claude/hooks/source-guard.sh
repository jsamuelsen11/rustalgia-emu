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

  # Escape every character that is special in an extended regular expression, such as the '?' of a query.
  escaped=$(printf '%s' "$pattern" | sed 's/[.[\*^$?+(){}|]/\\&/g')
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

# Fallback: code in a repository that is not in the register has not been evaluated, so it is walled.
# Prose stays open, so that the licence and the README can be read to evaluate it.
hosts='github\.com|raw\.githubusercontent\.com|gitlab\.com|codeberg\.org'
name='[a-z0-9][a-z0-9._-]*'
reserved='^(orgs|search|settings|features|topics|about|login|marketplace|sponsors|notifications|explore)/'
found=$(
  {
    printf '%s' "$input" | grep -oE "(^|[^a-z0-9.-])(${hosts})/${name}/${name}" | sed -E "s~^.*(${hosts})/~~"
    printf '%s' "$input" | grep -oE "(api\.github\.com/|gh api +/?)repos/${name}/${name}" | sed -E 's~^.*repos/~~'
    printf '%s' "$input" | grep -oE "(--repo|-r|gh repo (clone|view)) +${name}/${name}" | sed -E 's~^.* ~~'
    printf '%s' "$input" | grep -E '"owner"[[:space:]]*:' | sed -nE \
      "s~.*\"owner\"[[:space:]]*:[[:space:]]*\"(${name})\".*\"repo\"[[:space:]]*:[[:space:]]*\"(${name})\".*~\1/\2~p"
  } | sed -E 's~\.git$~~' | grep -Ev "$reserved" | sort -u
)

for repository in $found; do
  owner=${repository%%/*}
  if grep -Eq "^[a-z]+ \| (${repository}|${owner}/) \|" "$list"; then
    continue
  fi
  escaped=$(printf '%s' "$repository" | sed 's/[.[\*^$]/\\&/g')
  marked=$(printf '%s' "$input" | sed -E "s~(^|[^a-z0-9_.-])${escaped}~\\1${mark}~g")
  rest=$(printf '%s' "$marked" | sed -E \
    -e "s~${mark}(/(blob|raw|contents)(/[^/\"' ]+)?|/[^/\"' ]+)?/(${prose})[a-z0-9._-]*${end}~\\5~g" \
    -e "s~${mark}/(license|readme)${end}~\\2~g" \
    -e "s~${mark}${end}~\\1~g")
  unevaluated=no
  case "$rest" in *"$mark"*) unevaluated=yes ;; esac
  if printf '%s' "$marked" | grep -Eq 'clone|tarball|zipball|archive|codeload|search|"owner"'; then
    unevaluated=yes
  fi
  if [ "$unevaluated" = yes ]; then
    {
      echo "Blocked by .claude/hooks/source-guard.sh: '$repository' is not in the source register."
      echo "Evaluate it first. Its licence, README, and policy pages may be read now."
      echo "Follow 'Evaluating a new source' in docs/adr/0001-restrict-reading-by-licence-tier.md,"
      echo "add a line to .claude/hooks/source-register.txt, then try again."
      echo "A repository that has nothing to do with consoles or emulation is registered as 'other'."
    } >&2
    exit 2
  fi
done

exit 0
