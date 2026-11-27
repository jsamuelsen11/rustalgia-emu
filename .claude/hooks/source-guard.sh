#!/usr/bin/env sh
# Claude Code PreToolUse hook: refuse a tool call that would open a restricted source.
# It reads the call as JSON on standard input and exits 2, with the reason on standard error, to block it.
# The list is source-register.txt in this folder; entries in the open tier are ignored here.
# The rule is docs/adr/0006-read-sources-by-tier-under-a-compatibility-test.md.
set -eu

# The guard fails closed: whatever stops it from checking a call blocks the call.
# A crash or a timeout blocks too, through "onFailure": "block" in .claude/settings.json.
refuse() {
  echo "Blocked by .claude/hooks/source-guard.sh: $1" >&2
  echo "The guard cannot check this call, so it blocks it. Fix the cause and try again." >&2
  exit 2
}

list="$(dirname "$0")/source-register.txt"
[ -f "$list" ] || refuse "the source register is missing ($list)."
[ -r "$list" ] || refuse "the source register cannot be read ($list)."

role=${RUSTALGIA_SOURCE_ROLE:-writer}
input=$(tr '[:upper:]' '[:lower:]')

# A tool call arrives as one JSON object that names its tool.
case "$input" in
*[![:space:]]*) ;;
*) refuse "the call arrived empty." ;;
esac
trimmed=${input#"${input%%[![:space:]]*}"}
case "$trimmed" in
'{'*'"tool_name"'*'}'*) ;;
*) refuse "the call is not a JSON object with a tool name." ;;
esac
mark='@@restricted@@'
prose='readme|license|licence|copying|contributing|code_of_conduct|ai-policy'
end="([\"' )?#\\\\]|\$)"

block() {
  echo "Blocked by .claude/hooks/source-guard.sh: '$2' is a $1 source." >&2
  echo "See docs/adr/0006-read-sources-by-tier-under-a-compatibility-test.md for what may be read." >&2
  exit 2
}

# One awk pass reads the register and tests every restricted line against the call, line by line of the call.
# For each pattern it finds the occurrences that start the call or follow a character that cannot be part of a name,
# replaces them with a mark, and blocks unless every mark is an allowed prose read.
# It prints the tier and pattern of the first line that blocks, in register order, or nothing.
hit=$(
  GUARD_INPUT=$input GUARD_ROLE=$role GUARD_PROSE=$prose awk '
    BEGIN {
      mark = "@@restricted@@"
      n = split(ENVIRON["GUARD_INPUT"], line, "\n")
      prose = ENVIRON["GUARD_PROSE"]
      endc = "([\"'"'"' )?#\\\\]|$)"
      allowed = "^((/(blob|raw|contents)(/[^/\"'"'"' ]+)?|/[^/\"'"'"' ]+)?/(" prose ")[a-z0-9._-]*" endc \
        "|/(license|readme)" endc "|" endc ")"
      # The owner and repository fields of GitHub tool calls, on any line.
      for (i = 1; i <= n; i++) {
        s = line[i]
        while (match(s, /"owner"[[:space:]]*:[[:space:]]*"[^"]*"/)) {
          v = substr(s, RSTART, RLENGTH); sub(/^"owner"[[:space:]]*:[[:space:]]*"/, "", v); sub(/"$/, "", v)
          owners[v] = 1; s = substr(s, RSTART + RLENGTH)
        }
        s = line[i]
        while (match(s, /"repo"[[:space:]]*:[[:space:]]*"[^"]*"/)) {
          v = substr(s, RSTART, RLENGTH); sub(/^"repo"[[:space:]]*:[[:space:]]*"/, "", v); sub(/"$/, "", v)
          repos[v] = 1; s = substr(s, RSTART + RLENGTH)
        }
      }
    }
    /^[[:space:]]*(#|$)/ { next }
    {
      split($0, field, "|")
      tier = field[1]; sub(/^[[:space:]]+/, "", tier); sub(/[[:space:]].*$/, "", tier)
      pattern = field[2]; sub(/^[[:space:]]+/, "", pattern); sub(/[[:space:]].*$/, "", pattern)
      if (tier == "walled") { if (ENVIRON["GUARD_ROLE"] == "reader") next }
      else if (tier != "closed" && tier != "tainted") next

      # A call to a GitHub tool names the owner and the repository in separate fields.
      owner = pattern; sub(/\/.*$/, "", owner)
      repo = pattern; if (index(repo, "/")) sub(/^[^\/]*\//, "", repo)
      if (owner in owners && (repo == "" || repo in repos)) { print tier " " pattern; exit }

      slash = (substr(pattern, length(pattern)) == "/")
      for (i = 1; i <= n; i++) {
        s = line[i]; out = ""; pos = 1; found = 0
        while ((k = index(substr(s, pos), pattern)) > 0) {
          start = pos + k - 1
          len = length(pattern)
          before = (start == 1) ? "" : substr(s, start - 1, 1)
          ok = (start == 1 && pos == 1) || (start > pos && before !~ /[a-z0-9_.-]/)
          if (ok && slash) {
            if (match(substr(s, start + len), /^[a-z0-9._-]+/)) len += RLENGTH; else ok = 0
          }
          if (!ok) { out = out substr(s, pos, k); pos = start + 1; continue }
          out = out substr(s, pos, start - pos) mark
          pos = start + len; found = 1
        }
        if (!found) continue
        marked = out substr(s, pos)
        if (tier == "tainted") { print tier " " pattern; exit }
        # Copying a whole repository, or searching inside it, is never a prose read.
        if (marked ~ /clone|tarball|zipball|archive|codeload|search/) { print tier " " pattern; exit }
        # Every mark must be an allowed read: a prose file, the licence or README endpoint, or the bare page.
        rest = marked
        while ((k = index(rest, mark)) > 0) {
          rest = substr(rest, k + length(mark))
          if (rest !~ allowed) { print tier " " pattern; exit }
        }
      }
    }
  ' "$list"
)
if [ -n "$hit" ]; then
  block "${hit%% *}" "${hit#* }"
fi

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
      echo "Follow 'Evaluating a new source' in docs/adr/0006-read-sources-by-tier-under-a-compatibility-test.md,"
      echo "add a line to .claude/hooks/source-register.txt, then try again."
      echo "A repository that has nothing to do with consoles or emulation is registered as 'other'."
    } >&2
    exit 2
  fi
done

exit 0
