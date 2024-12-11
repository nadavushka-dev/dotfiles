export DOTFILES=~/dotfiles

source_if_exists () {
  if test -r "$1"; then
    source "$1"
  fi
}

source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/prompt.zsh
source_if_exists $DOTFILES/zsh/profile.zsh
source_if_exists $DOTFILES/zsh/options.zsh
source_if_exists $DOTFILES/zsh/env.zsh

. "$HOME/.local/bin/env"
