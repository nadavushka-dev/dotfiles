#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found whatsapp

echo " Installing whatsapp..."

if brew install --cask whatsapp; then 
  echo_ok " whatsapp installation succeeded"

else
  echo_err "  whatsapp did not install"
fi

