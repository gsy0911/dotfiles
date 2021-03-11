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

### install oh-my-zsh if not exist
if [[ ! -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# setup oh-my-zsh via zinit
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

## Load theme from OMZ
## See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
setopt promptsubst
## candidates: [amuse, jonathan]
# use theme via `starship`
# zinit snippet OMZT::amuse

## auto-complete
# zinit light zsh-users/zsh-autosuggestions

## syntax-highlight
zinit light zdharma/fast-syntax-highlighting

## Ctrl+r でコマンド履歴を検索
# zinit light zdharma/history-search-multi-word

# anyframeのセットアップ
zinit light mollifier/anyframe

## zsh settings
# ヒストリファイルを指定
HISTFILE=~/.zsh_history
# ヒストリに保存するコマンド数
HISTSIZE=10000
# ヒストリファイルに保存するコマンド数
SAVEHIST=10000
# 重複するコマンド行は古い方を削除
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt append_history
# 履歴をインクリメンタルに追加
setopt inc_append_history

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

# set theme via `starship`
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# python
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PIPENV_VENV_IN_PROJECT=1

# node
export PATH="/usr/local/opt/node@14/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# general
alias nawk=/usr/bin/awk
alias awk=/usr/local/bin/gawk

# ls
if type "exa" > /dev/null 2>&1; then
    alias ls='exa'
    alias l='exa -F'
    alias la='exa -a'
    alias ll='exa -l'
else
    alias ls='ls'
    alias l='ls -CF'
    alias la='ls -A'
    alias ll='ls -l'
fi

if type "bat" > /dev/null 2>&1; then
    alias cat="bat"
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
## 停止コンテナ、タグ無しイメージ、未使用ボリューム、未使用ネットワーク一括削除
alias drm="docker system prune"

function mm() {
    if [[ $1 ]]; then
        printf "\033[36m%-20s\033[0m %-20s %-30s\n" "[main:sub]" "[Command]" "[Description]"
        cat $HOME/.manurc | grep $1 | awk -F " *?## *?" '{printf "\033[36m%-20s\033[0m %-20s %-30s\n", $1, $2, $3}'
    else
        echo "mm iterm[:line, :tab, :window]"
        echo "mm alias[:dir, ...]"
    fi
}

function cdp() {
    local dir="$( ls -1d $HOME/Development/*/* | peco )"
    if [ ! -z "$dir" ] ; then
        echo $dir
        cd $dir
    fi    
}
zle -N cdp
bindkey "^p" cdp

function drmip(){
    local imageId=$(docker images | peco | awk '{print $3}')
    [ -n "$imageId" ] && docker rmi $imageId
}

function jump_middle() {
    CURSOR=$((${#BUFFER} / 2))
    zle redisplay
}
zle -N jump_middle
bindkey "^j" jump_middle

# Node-SCript
function nsc() {
    if [[ -f package.json ]]; then
        printf "\033[36m%-44s\033[0m %-20s\n" "[Command]" "[Description]"
        cat package.json | jq ".scripts" | grep : | sed -e 's/,//g' |  awk -F "\": \"" '{printf "(npm run|yarn)\033[36m%-30s\033[0m %-20s\n", $1, $2}' | sed -e 's/\"//g'
    fi
}

# CDK List && cdk Deploy
function cdkld() {
    if [[ $1 ]]; then
        local stack="$(cdk ls | grep $1 | peco)"
        echo deploying... $stack
        cdk deploy $stack
    else
        local stack="$(cdk ls | peco)"
        echo deploying... $stack
        cdk deploy $stack    
    fi
}