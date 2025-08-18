#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found neovim

echo " Installing neovim..."

if brew install neovim; then 
  symlink_with_dirs ~/dotfiles/config/nvim/ ~/.config/nvim
  echo_ok " neovim installation succeeded"

else
  echo_err "  neovim did not install"
fi
