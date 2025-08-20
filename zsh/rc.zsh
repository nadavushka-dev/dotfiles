export DOTFILES=~/dotfiles

source_if_exists () {
  if test -r "$1"; then
    source "$1"
  fi
}

source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/prompt.zsh
source_if_exists $DOTFILES/zsh/env.zsh
source_if_exists $DOTFILES/zsh/options.zsh
source_if_exists $DOTFILES/zsh/profile.zsh

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/Nadavushka/.bun/_bun" ] && source "/Users/Nadavushka/.bun/_bun"
