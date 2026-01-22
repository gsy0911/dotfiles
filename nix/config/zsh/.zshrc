#                                     _
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#

# speed check
# zmodload zsh/zprof

# enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"
# enable sheldon
eval "$(sheldon source)"

## not share command history between terminals
setopt no_share_history
unsetopt share_history

## zsh settings
# ヒストリファイルを指定
# HISTFILE=~/.zsh_history
# ヒストリに保存するコマンド数
HISTSIZE=1000
# ヒストリファイルに保存するコマンド数
SAVEHIST=1000
# 重複するコマンド行は古い方を削除
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt append_history
# 履歴をインクリメンタルに追加
setopt inc_append_history
# historyにcdやlsなどを残さないようにする
zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir|u|uu|drm)($| )" ]]
}

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# add exports
source "$HOME/.config/zsh/.zsh.exports"
source "$ZDOTDIR/.zsh.exports.secret"

# add aliases
source "$ZDOTDIR/.zsh.aliases"

# add functions
source "$ZDOTDIR/.zsh.functions"

# add zle
source "$ZDOTDIR/.zsh.zle"

# add vi-mode
source "$ZDOTDIR/.zsh.vi"

# set up direnv
eval "$(direnv hook zsh)"

# disable default repeat command
disable r

# set theme via `starship`
if type "starship" > /dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
# check
# zprof

echo -e "\e[35m" \
"            _      \n" \
"    _______| |__   \n" \
"   |_  / __| '_ \  \n" \
"  _ / /\__ \ | | | \n" \
" (_)___|___/_| |_|   "

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
