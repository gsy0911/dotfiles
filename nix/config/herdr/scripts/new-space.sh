#!/usr/bin/env bash
# new-space.sh — 固定タブ構成 (control / nvim / git / 1 / 2 / 3) の space を作成する。
# ctrl+t -> shift+n（config.toml の [[keys.command]]）から呼ばれる想定。
# 引数: $1 = 作業ディレクトリ。省略時は herdr の new_cwd ポリシー(既定 follow)に従う。
set -euo pipefail

# workspace 作成。cwd 指定があれば渡し、無ければ herdr のポリシーに任せる。
create_args=(--focus)
if [[ $# -ge 1 && -n "${1:-}" ]]; then
  create_args+=(--cwd "$1")
fi

created=$(herdr workspace create "${create_args[@]}")
ws=$(printf '%s' "$created" | jq -r '.result.workspace.workspace_id')
root_tab=$(printf '%s' "$created" | jq -r '.result.tab.tab_id')

tabs=(control nvim git 1 2 3)

# root タブを先頭ラベル(control)にリネーム
herdr tab rename "$root_tab" "${tabs[0]}"

# 残りのタブ(nvim / git / 1 / 2 / 3)を作成
for name in "${tabs[@]:1}"; do
  herdr tab create --workspace "$ws" --label "$name" --no-focus >/dev/null
done

# 先頭(control)タブへフォーカスを戻す
herdr tab focus "$root_tab" >/dev/null
