# Lazy load nodenv
if type nodenv &> /dev/null; then
  local NODENV_SHIMS="${NODENV_ROOT:-${HOME}/.nodenv}/shims"
  export PATH="${NODENV_SHIMS}:${PATH}"
  source $(which nodenv)/../../completions/nodenv.zsh
  function nodenv() {
    unset nodenv
    eval "$(command nodenv init -)"
    nodenv "$@"
  }
fi
