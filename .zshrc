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

## not share command history between terminals
setopt no_share_history
unsetopt share_history

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
export PATH="/usr/local/opt/node/bin:$PATH"

# mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# for starship(zsh) and CDK
export CDK_VERSION="$(cdk --version | awk '{printf $1}')"

# general
alias nawk=/usr/bin/awk
alias awk=/usr/local/bin/gawk

# ls
if type "exa" > /dev/null 2>&1; then
    alias ls='exa'
    alias l='exa -F'
    alias la='exa -a'
    alias ll='exa -l'
    alias lla='exa -la'
    alias lt='ls -lT --level=2 --git-ignore'
else
    alias ls='ls'
    alias l='ls -CF'
    alias la='ls -A'
    alias ll='ls -l'
    alias lla='ls -la'
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
alias di="docker images"
alias dr="docker run --rm"
alias ds='docker stop $(docker ps -q)'
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
## 停止コンテナ、タグ無しイメージ、未使用ボリューム、未使用ネットワーク一括削除
alias drm="docker system prune"

alias mp="make | sed -e '1d' | peco"

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

function mm() {
    if [[ $1 ]]; then
        printf "\033[36m%-20s\033[0m %-20s %-30s\n" "[main:sub]" "[Command]" "[Description]"
        cat $HOME/.manurc | grep $1 | awk -F " *?## *?" '{printf "\033[36m%-20s\033[0m %-20s %-30s\n", $1, $2, $3}'
    else
        echo "mm alias[:dir, ...]"
        echo "mm iterm[:line, :tab, :window]"
        echo "mm net"
        echo "mm usage[:docker, ...]"
        echo "mm db-[psql, mysql]"
        echo "mm av"
        echo "mm aws"
    fi
}

# Docker List
function dl() {
    if [[ $1 ]]; then
        local image="$(docker images | sed -e '1d' | grep $1 | sort | awk '{printf "%-20s %-20s %s\n", $2, $3, $1}' | peco | awk '{printf "%s:%s", $3, $1}' | sed -e 's/%//g')"
    else
        local image="$(docker images | sed -e '1d' | sort | awk '{printf "%-20s %-20s %s\n", $2, $3, $1}' | peco | awk '{printf "%s:%s", $3, $1}' | sed -e 's/%//g')"
    fi
    export li=$image
    echo "export li=$image"
}

# TRivy Peco
function trp() {
    if [[ $1 ]]; then
        dl $1
    else
        dl
    fi
    trivy --severity=HIGH,CRITICAL --ignore-unfixed=true $li
}

# CD Project-directory
function cdp() {
    local dir="$( ls -1d $HOME/Development/*/* | peco )"
    if [ ! -z "$dir" ] ; then
        echo $dir
        cd $dir
    fi    
}
zle -N cdp
bindkey "^p" cdp

# Docker RM Images with Peco
function drmip(){
    local imageId=$(docker images | sort | peco | awk '{print $3}')
    [ -n "$imageId" ] && docker rmi -f $imageId
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
        local stack="$(cdk ls | sort | grep $1 | peco)"
        echo deploying... $stack
        cdk deploy $stack
    else
        local stack="$(cdk ls | sort | peco)"
        echo deploying... $stack
        cdk deploy $stack    
    fi
}

function cdk_pkg_ver() {
    if [[ -f package.json ]]; then
        local cdk_installed_packages_version_count="$(cat package-lock.json | sed -e 's/ //g' |grep -E "\"@aws-cdk/.*?:\"[0-9\.]*\"," | awk -F ":" '{printf "%s\n", $2}' | sed -e 's/\"//g' | sed -e 's/,//g' | uniq | wc -l | awk '{print $1}')"
        if [ $cdk_installed_packages_version_count -eq 1 ]; then
            echo "cdk package compatibility: ⭕"
        else
            echo "cdk package compatibility: ❌"
        fi
    else
        echo "cdk package not found"
    fi
}

function set_cdk() {
    if [[ $1 ]]; then
        local account=$(aws sts get-caller-identity --profile $1 | jq -r .Account)
    else
        local account=$(aws sts get-caller-identity | jq -r .Account)
    fi
    export CDK_DEFAULT_ACCOUNT=$account
    echo "set CDK_DEFAULT_ACCOUNT as $CDK_DEFAULT_ACCOUNT as deploy account"
}

# show aws CREDential
function cred() {
    cat $HOME/.aws/credentials | grep "\[" | sed -e 's/\[//g' | sed -e 's/\]//g'
}
