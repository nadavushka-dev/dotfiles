#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"



uninstall_if_found yazi

echo " Installing yazi..."

if brew install yazi; then 
  echo_ok " yazi installation succeeded"

else
  echo_err "  yazi did not install"
fi

