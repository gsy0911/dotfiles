#!/usr/bin/env bash
# report-pr.sh — 現在ブランチの PR 番号を herdr の space metadata ($pr) として報告する。
# zsh の precmd から (ブランチ変化 or TTL 切れ時のみ) バックグラウンドで呼ばれる想定。
# 引数: $1 = workspace_id, $2 = 対象ディレクトリ (省略時は $PWD)
# 表示: PR あり -> "PR:#1234" / なし -> "PR:----" / git 外 -> token をクリア
set -uo pipefail

ws="${1:?workspace_id required}"
dir="${2:-$PWD}"
ttl="${HERDR_PR_TTL:-300}"
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/herdr-pr"

report() {
  herdr workspace report-metadata "$ws" --source pr "$@" >/dev/null 2>&1
}

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
if [[ -f "$cache" ]] && (( now - $(stat -f %m "$cache") < ttl )); then
  num=$(<"$cache")
else
  num=$(gh pr view "$branch" --json number --jq .number 2>/dev/null) || num=""
  printf '%s' "$num" >"$cache"
fi

if [[ -n "$num" ]]; then
  report --token pr="PR:#$num"
else
  report --token pr="PR:----"
fi
