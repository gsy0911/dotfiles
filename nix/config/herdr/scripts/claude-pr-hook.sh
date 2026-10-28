#!/usr/bin/env bash
# claude-pr-hook.sh — Claude Code の PostToolUse(Bash) hook。
# Claude が PR やブランチを変えるコマンドを実行したら、zsh のプロンプトを待たずに
# report-pr.sh をキャッシュ無視 (HERDR_PR_TTL=0) で走らせて $pr を即時更新する。
# stdin: hook の JSON 入力 (tool_input.command を見る)
set -uo pipefail

[[ -n "${HERDR_WORKSPACE_ID:-}" ]] || exit 0

cmd=$(jq -r '.tool_input.command // empty' 2>/dev/null)
if [[ "$cmd" =~ gh[[:space:]]+pr[[:space:]]+(create|merge|close|reopen|ready) ]] \
  || [[ "$cmd" =~ git[[:space:]]+(checkout|switch)[[:space:]] ]]; then
  HERDR_PR_TTL=0 bash "$HOME/.config/herdr/scripts/report-pr.sh" "$HERDR_WORKSPACE_ID" \
    </dev/null &>/dev/null &
  disown
fi
exit 0
