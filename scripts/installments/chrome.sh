#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found google-chrome

echo " Installing google-chrome..."

if brew install --cask google-chrome; then 
  echo_ok " google-chrome installation succeeded"

else
  echo_err "  google-chrome did not install"
fi

