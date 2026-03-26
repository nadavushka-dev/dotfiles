#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found nvm

echo " Installing nvm..."

if brew install nvm; then 
  echo_ok " nvm installation succeeded"

else
  echo_err "  nvm did not install"
fi

