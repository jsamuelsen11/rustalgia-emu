#!/usr/bin/env sh
# Claude Code PreToolUse hook: refuse a tool call that would open a restricted source.
# It reads the call as JSON on standard input and exits 2, with the reason on standard error, to block it.
# The list is source-register.txt in this folder. The rule is
# docs/adr/0006-read-sources-by-tier-under-a-compatibility-test.md.
#
# How a call is matched against the register:
# - Only calls that fetch are checked: WebFetch, every MCP tool except GitHub tools that only write, and Bash
#   commands that run a fetching program (curl, wget, an interpreter, git clone or fetch, gh api or repo or search,
#   and the like). A command that only names an address, such as writing a file or opening an issue, passes.
# - A pattern is plain text, matched in lower case after the start of a line or a character that cannot be part of
#   a name. "owner/repository" also needs a name boundary after it, so it does not match "owner/repository-fork".
#   "owner/" matches every repository of the owner. Every other pattern matches as a prefix.
# - Where several lines match at the same place, the longest decides the tier, so an open line can carve a path out
#   of a restricted one, and a restricted line can close a path inside an open one.
# - Closed and tainted web addresses are blocked outright, page and host alike. A walled web site's prose is open to
#   a writer; its downloads (archives, source files, download paths) are not. Tainted sources are blocked in every
#   role, walled ones only for a writer.
# - In a repository, a restricted line still allows its prose: the bare repository page, the licence and README
#   endpoints, and files named README, LICENSE, COPYING, CONTRIBUTING, CODE_OF_CONDUCT, or AI-POLICY.
#   A line for a whole repository or owner also allows its release notes and metadata: a changelog file
#   (CHANGELOG, CHANGES, NEWS, HISTORY, or release notes, bare or as .md, .txt, .rst, .markdown, or .adoc), a file
#   named AUTHORS, CONTRIBUTORS, CREDITS, THANKS, or TODO in the same forms, the releases pages and endpoint, and
#   the lists of commits, branches, tags, and contributors. One commit is not allowed, because
#   it comes with its diff. Cloning, archive and release downloads, and searches inside it are blocked.
#   A GitHub tool call on such a repository may do the same and no more: an issue, a pull request, and one commit
#   are blocked.
# - A line for a path inside a repository, written in any one form ("owner/repo/blob/<ref>/path",
#   "owner/repo/tree/<ref>/path", "owner/repo/<ref>/path" as the raw host has it, or "owner/repo/contents/path"),
#   matches that path in every form and on every ref: blob, tree, raw, and blame pages, the raw host with or without
#   "refs/heads/", the contents endpoint, a branch, a tag, or a commit.
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

# A call that only names an address, without fetching it, passes.
if printf '%s' "$input" | grep -Eq '"tool_name"[[:space:]]*:[[:space:]]*"bash"'; then
  fetchers='curl|wget|aria2c|lynx|w3m|elinks|xh|svn|hg|scp|rsync|sftp|ftp|ncat|socat|telnet|python[0-9.]*|node|nodejs'
  fetchers="$fetchers|deno|bun|ruby|perl|php|lua|tclsh|osascript|xdg-open|powershell|pwsh|wsl"
  b='(^|[^a-z0-9_.-])'
  a='([^a-z0-9_.-]|$)'
  gh='(api|repo|search|browse|release|gist|run|workflow|codespace|extension|attestation|cache|ruleset|project|org)'
  gitfetch='(clone|fetch|pull|ls-remote|archive|submodule)'
  fetch="${b}(${fetchers})${a}|${b}git[^;&|]*[[:space:]]${gitfetch}${a}|${b}gh[[:space:]]+${gh}${a}"
  if ! printf '%s' "$input" | grep -Eq "$fetch"; then
    exit 0
  fi
elif
  writes='(issue_write|sub_issue_write|create_|update_|add_|delete_|push_files|merge_pull_request'
  writes="$writes|pull_request_review_write|request_copilot|assign_copilot)"
  printf '%s' "$input" | grep -Eq "\"tool_name\"[[:space:]]*:[[:space:]]*\"mcp__[a-z0-9_]*github[a-z0-9_]*__${writes}"
then
  exit 0
fi

block() {
  echo "Blocked by .claude/hooks/source-guard.sh: '$2' is a $1 source." >&2
  echo "See docs/adr/0006-read-sources-by-tier-under-a-compatibility-test.md for what may be read." >&2
  exit 2
}

# One awk pass reads the register and tests the call against every line.
# It prints the tier and pattern of the line that blocks, or nothing.
hit=$(
  GUARD_INPUT=$input GUARD_ROLE=$role awk '
    function restricted(t) { return t == "tainted" || t == "closed" || (t == "walled" && role != "reader") }
    function isweb(p) { return p ~ /^[^\/]*\./ }
    # Where a match of pattern p starting at position st of string s ends, or 0 if p does not match there.
    function endofmatch(s, st, p,    len, c, r) {
      len = length(p)
      if (substr(s, st, len) != p) return 0
      if (st > 1 && substr(s, st - 1, 1) ~ /[a-z0-9_.-]/) return 0
      if (substr(p, len) == "/") {
        if (!match(substr(s, st + len), /^[a-z0-9._-]+/)) return 0
        return st + len + RLENGTH - 1
      }
      if (!isweb(p) && p ~ /^[^\/]+\/[^\/]+$/) {
        r = substr(s, st + len)
        if (r ~ /^\.git([^a-z0-9_.-]|$)/) return st + len + 3
        c = substr(r, 1, 1)
        if (c ~ /[a-z0-9_-]/ || r ~ /^\.[a-z0-9_-]/) return 0
      }
      return st + len - 1
    }
    # The line with every by-ref file address rewritten to "<host>/owner/repo/blob/@/path".
    function canon(s,    out, hit, c) {
      out = ""
      while (match(s, refre)) {
        hit = substr(s, RSTART, RLENGTH)
        split(hit, c, "/")
        out = out substr(s, 1, RSTART - 1) c[1] "/" c[2] "/" c[3] "/blob/@/"
        s = substr(s, RSTART + RLENGTH)
      }
      return out s
    }
    BEGIN {
      role = ENVIRON["GUARD_ROLE"]
      q = sprintf("%c", 39)
      endc = "([\"" q " )?#\\\\]|$)"
      prose = "(readme|license|licence|copying|contributing|code_of_conduct|ai-policy)"
      seg = "[^/\"" q " ]+"
      proseread = "^(/(blob|raw|contents)(/" seg ")?|/" seg ")?/" prose "[a-z0-9._-]*" endc "|^/(license|readme)" endc
      bareread = "^" endc
      # Release notes and metadata of a whole repository: prose under the rule, with no code and no diff.
      notes = "(changelog|changes|news|history|release[-_]?notes|authors|contributors|credits|thanks|todo)"
      notes = notes "(\\.(md|txt|rst|markdown|adoc))?"
      notesread = "^/blob/@/(" seg "/)*" notes endc
      relread = "^/releases(/latest|/tags?/" seg "|/[0-9]+)?" endc
      apimeta = "^/(commits|branches|tags|contributors)" endc "|^/branches/" seg endc
      webmeta = "^/(commits|branches|tags)(/" seg ")?" endc
      # Every way to address a file by ref is rewritten to one form, "owner/repo/blob/@/path",
      # so that one line for a path closes it on every ref and in every form.
      nm = "[a-z0-9_.-]+"
      refseg = "(refs/(heads|tags)/)?[^/\"" q " ?#)]+/"
      refre = "(github\\.com|gitlab\\.com|codeberg\\.org)/" nm "/" nm "/(-/)?(blob|tree|raw|blame)/" refseg
      refre = refre "|raw\\.githubusercontent\\.com/" nm "/" nm "/" refseg "|repos/" nm "/" nm "/contents/"
      code = "\\.(zip|7z|rar|tar|gz|tgz|bz2|xz|zst|lzh|lha|c|h|cc|cpp|cxx|hpp|hh|rs|s|asm|inc|py|java|go|cs"
      code = code "|swift|m|mm|kt|lua|js|mjs|ts|wasm|patch|diff|bin|rom|iso)([?#&]|$)|/downloads?([/?#]|$)"
      keyword = "(git|gh repo)[^;&|]*[[:space:]]clone([^a-z0-9_.-]|$)|tarball|zipball|codeload"
      keyword = keyword "|git[^;&|]*[[:space:]]archive([^a-z0-9_.-]|$)|gh[[:space:]]+search|search/code"
      keyword = keyword "|gh[[:space:]]+release[[:space:]]+download|/releases/(download|assets)"
      n = split(ENVIRON["GUARD_INPUT"], line, "\n")
      # A wiki page reached by "index.php?title=" is also tested in its "/wiki/" and "/index.php/" forms,
      # so that a page closed by its path form is closed in every form.
      m = n
      for (i = 1; i <= n; i++) {
        if (index(line[i], "index.php?title=")) {
          s = line[i]; gsub(/(\/w|\/mediawiki)?\/index\.php\?title=/, "/wiki/", s); line[++m] = s
          s = line[i]; gsub(/(\/w|\/mediawiki)?\/index\.php\?title=/, "/index.php/", s); line[++m] = s
        }
      }
      n = m
      for (i = 1; i <= n; i++) line[i] = canon(line[i])
      for (i = 1; i <= n; i++) {
        s = line[i]
        while (match(s, /"(owner|repo|path)"[[:space:]]*:[[:space:]]*"[^"]*"/)) {
          v = substr(s, RSTART, RLENGTH); k = v
          sub(/^"/, "", k); sub(/".*$/, "", k)
          sub(/^"[a-z]*"[[:space:]]*:[[:space:]]*"/, "", v); sub(/"$/, "", v)
          if (!(k in field)) field[k] = v
          s = substr(s, RSTART + RLENGTH)
        }
      }
    }
    /^[[:space:]]*(#|$)/ { next }
    {
      split($0, f, "|")
      t = f[1]; sub(/^[[:space:]]+/, "", t); sub(/[[:space:]].*$/, "", t)
      p = f[2]; sub(/^[[:space:]]+/, "", p); sub(/[[:space:]].*$/, "", p)
      if (p == "") next
      np++; tier[np] = t; pat[np] = p
      # A line for a path inside a repository also gets the one form that canon() rewrites addresses to.
      if (!isweb(p)) {
        ns = split(p, part, "/")
        from = (part[3] == "tree" || part[3] == "blob") ? 5 : 4
        if (ns >= from && part[3] != "wiki" && part[3] != "-") {
          inner = ""; sep = ""
          for (x = from; x <= ns; x++) { inner = inner sep part[x]; sep = "/" }
          np++; tier[np] = t; pat[np] = part[1] "/" part[2] "/blob/@/" inner
        }
      }
    }
    END {
      # GitHub tool calls name the owner, the repository, and a path in separate fields.
      if ("owner" in field) {
        best = 0; blen = -2
        for (j = 1; j <= np; j++) {
          p = pat[j]
          if (isweb(p)) continue
          ns = split(p, part, "/")
          if (part[1] != field["owner"]) continue
          if (p ~ /\/$/) { l = -1 }
          else if (ns == 2) { if (part[2] != field["repo"]) continue; l = 0 }
          else {
            if (part[2] != field["repo"]) continue
            from = (part[3] == "tree" || part[3] == "blob") ? 5 : 4
            inner = ""; sep = ""
            for (x = from; x <= ns; x++) { inner = inner sep part[x]; sep = "/" }
            if (inner == "" || index(field["path"], inner) != 1) continue
            l = length(inner)
          }
          if (l > blen) { blen = l; best = j }
        }
        if (best && restricted(tier[best])) {
          # Of a restricted repository, a GitHub tool may read prose files, release notes, releases,
          # and the lists of commits, branches, and tags: not one commit, an issue, or a pull request.
          tool = ""
          if (match(ENVIRON["GUARD_INPUT"], /"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"/)) {
            tool = substr(ENVIRON["GUARD_INPUT"], RSTART, RLENGTH - 1); sub(/^.*__/, "", tool)
          }
          reads = "^(get_file_contents|list_releases|get_latest_release|get_release_by_tag|list_commits"
          reads = reads "|list_branches|list_tags|get_tag)$"
          okpath = "^(" prose "[a-z0-9._-]*)?$|^(" seg "/)*" notes "$"
          if (tier[best] == "tainted" || blen > 0 || ENVIRON["GUARD_INPUT"] ~ /search/ \
            || tool !~ reads || field["path"] !~ okpath) { print tier[best] " " pat[best]; exit }
        }
      }
      for (i = 1; i <= n; i++) {
        s = line[i]
        delete bestj; delete bestend
        for (j = 1; j <= np; j++) {
          p = pat[j]; pos = 1
          while ((k = index(substr(s, pos), p)) > 0) {
            st = pos + k - 1
            e = endofmatch(s, st, p)
            if (e && (!(st in bestj) || e - st > bestend[st] - st || \
              (e - st == bestend[st] - st && length(p) > length(pat[bestj[st]])))) { bestj[st] = j; bestend[st] = e }
            pos = st + 1
          }
        }
        for (st in bestj) {
          j = bestj[st]; t = tier[j]; p = pat[j]
          if (!restricted(t)) continue
          if (t == "tainted") { print t " " p; exit }
          rest = substr(s, bestend[st] + 1)
          if (isweb(p)) {
            if (t == "closed") { print t " " p; exit }
            tok = rest; sub(/[\042\047 )#\\].*$/, "", tok)
            if ((p tok) ~ code || s ~ keyword) { print t " " p; exit }
            continue
          }
          if (s ~ keyword || substr(s, st - 5, 5) == "repo:") { print t " " p; exit }
          if (rest ~ proseread) continue
          if (p ~ /^[^\/]+\/[^\/]*$/) {
            if (rest ~ bareread || rest ~ notesread || rest ~ relread) continue
            if (rest ~ (substr(s, st - 6, 6) == "repos/" ? apimeta : webmeta)) continue
          }
          print t " " p; exit
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
reserved='^(orgs|search|settings|features|topics|about|login|marketplace|sponsors|notifications|explore|customer-terms'
reserved="$reserved|site|site-policy|pricing|enterprise|security|apps|collections|trending|events|codespaces|new|join"
reserved="$reserved|account|team|readme|contact|mobile|copilot|solutions|resources|premium-support|github|api)/"
found=$(
  {
    printf '%s' "$input" | grep -oE "(^|[^a-z0-9.-])(${hosts})/${name}/${name}" | sed -E "s~^.*(${hosts})/~~"
    api="(api\.github\.com/|gh api +(\\\\?[\"'])?/?)repos/"
    printf '%s' "$input" | grep -oE "${api}${name}/${name}" | sed -E 's~^.*repos/~~'
    printf '%s' "$input" | grep -oE "(--repo|-r|gh repo (clone|view)) +${name}/${name}" | sed -E 's~^.* ~~'
    printf '%s' "$input" | grep -E '"owner"[[:space:]]*:' | sed -nE \
      "s~.*\"owner\"[[:space:]]*:[[:space:]]*\"(${name})\".*\"repo\"[[:space:]]*:[[:space:]]*\"(${name})\".*~\1/\2~p"
  } | sed -E 's~\.git$~~' | grep -Ev "$reserved" | sort -u
)

unevaluated() {
  {
    echo "Blocked by .claude/hooks/source-guard.sh: '$1' is not in the source register."
    echo "Evaluate it first. Its licence, README, and policy pages may be read now."
    echo "Follow 'Evaluating a new source' in docs/adr/0006-read-sources-by-tier-under-a-compatibility-test.md,"
    echo "add a line to .claude/hooks/source-register.txt, then try again."
    echo "A repository that has nothing to do with consoles or emulation is registered as 'other'."
  } >&2
  exit 2
}

for repository in $found; do
  owner=${repository%%/*}
  if grep -Eq "^[a-z]+ \| (${repository}|${owner}/) \|" "$list"; then
    continue
  fi
  verdict=$(
    GUARD_INPUT=$input GUARD_REPO=$repository awk '
      BEGIN {
        q = sprintf("%c", 39)
        endc = "([\"" q " )?#\\\\]|$)"
        prose = "(readme|license|licence|copying|contributing|code_of_conduct|ai-policy)"
        seg = "[^/\"" q " ]+"
        allowed = "^((/(blob|raw|contents)(/" seg ")?|/" seg ")?/" prose "[a-z0-9._-]*" endc
        allowed = allowed "|/(license|readme)" endc "|(\\.git)?" endc ")"
        keyword = "clone|tarball|zipball|codeload|git[^;&|]*[[:space:]]archive|gh[[:space:]]+search|search/code"
        r = ENVIRON["GUARD_REPO"]; n = split(ENVIRON["GUARD_INPUT"], line, "\n")
        for (i = 1; i <= n; i++) {
          s = line[i]; pos = 1
          if (s ~ /"owner"[[:space:]]*:/ && index(s, "\"" substr(r, index(r, "/") + 1) "\"")) { print "yes"; exit }
          while ((k = index(substr(s, pos), r)) > 0) {
            st = pos + k - 1; pos = st + 1
            if (st > 1 && substr(s, st - 1, 1) ~ /[a-z0-9_.-]/) continue
            if (s ~ keyword) { print "yes"; exit }
            if (substr(s, st + length(r)) !~ allowed) { print "yes"; exit }
          }
        }
      }'
  )
  [ "$verdict" = yes ] && unevaluated "$repository"
done

# An organisation-wide code search reaches every repository of the owner, so the owner needs an open line.
if printf '%s' "$input" | grep -Eq 'search'; then
  by='(--owner[= ]+|org:|user:)'
  for owner in $(printf '%s' "$input" | grep -oE "${by}${name}" | sed -E "s~^${by}~~" | sort -u); do
    if ! grep -Eq "^(open|other) \| ${owner}/ " "$list"; then
      unevaluated "$owner/"
    fi
  done
fi

exit 0
