#!/usr/bin/env bash
# report-pr.sh — 現在ブランチの PR 番号を herdr の space metadata ($pr) として報告する。
# zsh の precmd から (ブランチ変化 or TTL 切れ時のみ) バックグラウンドで呼ばれる想定。
# 引数: $1 = workspace_id, $2 = 対象ディレクトリ (省略時は workspace 先頭ペインの cwd)
# $pr は workspace 単位なので、どのペインから呼ばれても同じディレクトリを見るよう
# 既定では先頭ペインを代表にする (ペインごとの cwd で報告すると互いに上書きし合う)。
# 表示: open -> "PR:#1234" / closed・merged -> "PR:(#1234)" / なし -> "PR:----" / git 外 -> token をクリア
set -uo pipefail

ws="${1:?workspace_id required}"
dir="${2:-}"
ttl="${HERDR_PR_TTL:-300}"
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/herdr-pr"

report() {
  herdr workspace report-metadata "$ws" --source pr "$@" >/dev/null 2>&1
}

if [[ -z "$dir" ]]; then
  dir=$(herdr pane list --workspace "$ws" 2>/dev/null \
    | jq -r '.result.panes[0] | .foreground_cwd // .cwd // empty' 2>/dev/null)
  # 代表が取れない時は誤った値で上書きしないよう何もしない
  [[ -n "$dir" ]] || exit 0
fi

cd "$dir" 2>/dev/null || exit 0
root=$(git rev-parse --show-toplevel 2>/dev/null) || { report --clear-token pr; exit 0; }
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [[ -z "$branch" || "$branch" == "HEAD" ]]; then
  report --token pr="PR:----"
  exit 0
fi

# キャッシュ: repo root + branch 単位。TTL 内なら gh を叩かない。
mkdir -p "$cache_dir"
cache="$cache_dir/$(printf '%s\0%s' "$root" "$branch" | shasum | cut -c1-16)"
now=$(date +%s)
# キャッシュ内容: "<number> <state>" (PR なしは空)。
if [[ -f "$cache" ]] && (( now - $(stat -f %m "$cache") < ttl )); then
  info=$(<"$cache")
else
  # gh は「PR なし」もネットワーク/認証エラーも exit 1 なので stderr で区別する。
  # 失敗時は「PR なし」として記録せず、古いキャッシュがあればそれを使い、なければ表示を据え置く。
  gh_pr() { gh pr view "$@" --json number,state --jq '"\(.number) \(.state)"' 2>"$cache.err"; }
  # 引数なし: gh が @{push} と fork の owner から head を解決する。
  info=$(gh_pr); rc=$?
  # push.default=simple でローカル名と upstream 名が違うと @{push} が引けず
  # ローカル名で探してしまうので、upstream のブランチ名で引き直す。
  if (( rc != 0 )) && grep -q 'no pull requests found' "$cache.err"; then
    up=$(git for-each-ref --format='%(upstream:lstrip=3)' "refs/heads/$branch")
    if [[ -n "$up" && "$up" != "$branch" ]]; then
      info=$(gh_pr "$up"); rc=$?
    fi
  fi
  if (( rc == 0 )); then
    printf '%s' "$info" >"$cache"
  elif grep -q 'no pull requests found' "$cache.err"; then
    info=""
    printf '%s' "$info" >"$cache"
  elif [[ -f "$cache" ]]; then
    info=$(<"$cache")
  else
    rm -f "$cache.err"
    exit 0
  fi
  rm -f "$cache.err"
fi
read -r num state <<<"$info"

if [[ -z "$num" ]]; then
  report --token pr="PR:----"
elif [[ "$state" == "OPEN" ]]; then
  report --token pr="PR:#$num"
else
  report --token pr="PR:(#$num)"
fi
