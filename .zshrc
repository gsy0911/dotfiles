#                                     _              
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# setup Prezto via zinit
zinit snippet PZT::modules/helper/init.zsh

# setup oh-my-zsh via zinit
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

## Load theme from OMZ
## See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
setopt promptsubst
zinit snippet OMZT::amuse

## auto-complete
# zinit light zsh-users/zsh-autosuggestions

## syntax-highlight
zinit light zdharma/fast-syntax-highlighting

## Ctrl+r でコマンド履歴を検索
# zinit light zdharma/history-search-multi-word

# anyframeのセットアップ
zinit light mollifier/anyframe

# Ctrl+x -> b
# peco でディレクトリの移動履歴を表示
bindkey '^xd' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Ctrl+x -> r
# peco でコマンドの実行履歴を表示
bindkey '^xc' anyframe-widget-execute-history

# Ctrl+x -> Ctrl+b
# peco でGitブランチを表示して切替え
bindkey '^xb' anyframe-widget-checkout-git-branch

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# python
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PIPENV_VENV_IN_PROJECT=1

# node
export PATH="/usr/local/opt/node@14/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# general
alias cdp="cd $HOME/Development/Projects"

# ls
if type "exa" > /dev/null 2>&1; then
    alias ls='exa -la'
    alias l='exa -F'
    alias la='exa -a'
    alias ll='exa -l'
else
    alias ls='ls -la'
    alias l='ls -CF'
    alias la='ls -A'
    alias ll='ls -l'
fi

# cd
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# alias for Python
alias j="poetry run jupyter lab"

# alias for docker
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'

