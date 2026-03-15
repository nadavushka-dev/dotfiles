#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found tldr

echo " Installing tldr..."

if brew install tldr; then 
  echo_ok " tldr installation succeeded"

else
  echo_err "  tldr did not install"
fi

