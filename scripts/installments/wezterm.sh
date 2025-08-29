#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found wezterm

echo " Installing wezterm..."

if brew install --cask wezterm; then 
  symlink_with_dirs ~/dotfiles/config/wezterm/ ~/.config/wezterm
  echo_ok " wezterm installation succeeded"

else
  echo_err "  wezterm did not install"
fi

