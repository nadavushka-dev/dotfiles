#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found lazygit

echo " Installing lazygit..."

if brew install lazygit; then 
  echo_ok " lazygit installation succeeded"

else
  echo_err "  lazygit did not install"
fi

