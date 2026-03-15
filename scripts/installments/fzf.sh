#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found fzf

echo " Installing fzf..."

if brew install fzf; then 
  echo_ok " fzf installation succeeded"

else
  echo_err "  fzf did not install"
fi

