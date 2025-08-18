#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found btop

echo " Installing btop..."

if brew install btop; then 
  symlink_with_dirs ~/dotfiles/config/btop/ ~/.config/btop
  echo_ok " btop installation succeeded"

else
  echo_err "  btop did not install"
fi

