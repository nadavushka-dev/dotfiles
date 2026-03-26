#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found go

echo " Installing go..."

if brew install go; then 
  echo_ok " go installation succeeded"

else
  echo_err "  go did not install"
fi

