#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

uninstall_if_found mailsy

echo " Installing mailsy..."

if brew install mailsy; then 
  echo_ok " mailsy installation succeeded"

else
  echo_err "  mailsy did not install"
fi

