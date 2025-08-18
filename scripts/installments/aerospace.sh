#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found aerospace

echo " Installing aerospace..."

if brew install aerospace; then 
  symlink_with_dirs ~/dotfiles/config/aerospace/ ~/.config/aerospace
  echo_ok " aerospace installation succeeded"

else
  echo_err "  aerospace did not install"
fi
