#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found kitty

echo " Installing kitty..."

if brew install --cask kitty; then 
  symlink_with_dirs ~/dotfiles/config/kitty/ ~/.config/kitty
  echo_ok " kitty installation succeeded"

else
  echo_err "  kitty did not install"
fi

