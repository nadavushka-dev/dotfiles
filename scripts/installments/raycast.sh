#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found raycast

echo " Installing raycast..."

if brew install --cask raycast; then 
  echo_ok " raycast installation succeeded"

else
  echo_err "  raycast did not install"
fi

