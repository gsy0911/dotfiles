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
# CA bundle for tools that ship a stale one (eMudhra/emSign incident, 2026-10).
# Homebrew's ca-certificates already drops the compromised roots.
#   - /usr/bin/pip3 (pip 21, Python 3.9) has no fixed release; PIP_CERT replaces its bundled certifi
#   - gcloud vendors an old certifi even in 590.0.0
if [[ -f /opt/homebrew/etc/ca-certificates/cert.pem ]]; then
  export PIP_CERT=/opt/homebrew/etc/ca-certificates/cert.pem
  export CLOUDSDK_CORE_CUSTOM_CA_CERTS_FILE=/opt/homebrew/etc/ca-certificates/cert.pem
fi
