#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found spotify

echo " Installing spotify..."

if brew install --cask spotify; then 
  echo_ok " spotify installation succeeded"

else
  echo_err "  spotify did not install"
fi

