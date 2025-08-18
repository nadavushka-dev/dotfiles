#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found tmux

echo " Installing tmux..."

if brew install tmux; then 
  symlink_with_dirs ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
  echo_ok " tmux installation succeeded"

else
  echo_err "  tmux did not install"
fi
