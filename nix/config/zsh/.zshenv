# Read by every zsh: directly when ZDOTDIR is inherited, otherwise via ~/.zshenv
# XGD Base Directory
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
# volta (unused): non-interactive shells must agree with the shim dir on PATH,
# otherwise the shim falls back to ~/.volta and recurses into itself
# export VOLTA_HOME=$XDG_DATA_HOME/volta
