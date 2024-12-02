#                                     _
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#

# enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"
# enable sheldon
eval "$(sheldon source)"

# speed check
# zmodload zsh/zprof

## not share command history between terminals
setopt no_share_history
unsetopt share_history

## zsh settings
# ヒストリファイルを指定
HISTFILE=~/.zsh_history
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
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# set theme via `starship`
if type "starship" > /dev/null 2>&1; then
    eval "$(starship init zsh)"
fi


# add exports
source "$HOME/.zsh.exports"
source "$HOME/.zsh.exports.secret"

# add aliases
source "$HOME/.zsh.aliases"

# add functions
source "$HOME/.zsh.functions"

# add vi-mode
source "$HOME/.zsh.vi"

# set up direnv
eval "$(direnv hook zsh)"

# disable default repeat command
disable r

# check
# zprof
