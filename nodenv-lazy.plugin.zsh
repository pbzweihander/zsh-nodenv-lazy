# Lazy load nodenv
if type nodenv &> /dev/null; then
  local NODENV_SHIMS="${NODENV_ROOT:-${HOME}/.nodenv}/shims"
  export PATH="${NODENV_SHIMS}:${PATH}"
  source $(dirname $(greadlink -f `whence -p nodenv`))/../completions/nodenv.zsh
  function nodenv() {
    unset -f nodenv > /dev/null 2>&1
    eval "$(command nodenv init -)"
    nodenv "$@"
  }
fi
